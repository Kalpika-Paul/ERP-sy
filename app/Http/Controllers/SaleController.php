<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Customer;
use App\Models\Purchase;
use App\Models\Sale;
use App\Models\Sales_return;
use App\Models\SalesItem;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\JsonResponse;

class SaleController extends Controller
{
    /**
     * Get available products for sale
     */
    public function availableProducts(): JsonResponse
    {
        $purchases = Purchase::with('product')
            ->where('status', 'approved')
            ->get();

        $products = $purchases->groupBy('product_id')->map(function ($items) {
            $firstItem = $items->first();
            if (!$firstItem || !$firstItem->product) return null;

            $product = $firstItem->product;

            $variants = $items->map(function (Purchase $p) {
                $stock = $p->available_stock ?? $p->quantity;
                if ($stock <= 0) return null;

                return [
                    'purchase_id' => $p->id,
                    'variant' => $p->variant,
                    'ram' => $p->ram,
                    'rom' => $p->rom,
                    'price' => $p->salesPrice,
                    'color' => $p->color,
                    'imei' => $p->imei,
                    'battery_health' => $p->battery_health,
                    'quantity' => $stock,
                ];
            })->filter()->values();

            if ($variants->isEmpty()) return null;

            return [
                'id' => $product->id,
                'brand' => $product->brand,
                'model' => $product->name,
                'variants' => $variants,
                'colors' => $items->pluck('color')->unique()->values(),
            ];
        })->filter()->values();

        return response()->json($products);
    }

    /**
     * Create a new sale
     */
    public function store(Request $request): JsonResponse
    {
        DB::beginTransaction();

        try {
            $lastSale = Sale::orderBy('invoice_code', 'desc')->first();
            $invoiceCode = $lastSale && $lastSale->invoice_code ? $lastSale->invoice_code + 1 : 200401;

            $customer = Customer::firstOrCreate(
                ['phone' => $request->phone],
                ['name' => $request->customerName, 'address' => $request->address]
            );

            $subTotal = 0;
            foreach ($request->cart as $item) {
                $subTotal += $item['price'] * $item['quantity'];
            }

            $discount = $request->discount ?? 0;
            $grandTotal = $subTotal - $discount;
            $date = $request->date ?? now()->toDateString();
            $sale = Sale::create([
                'customer_id' => $customer->id,
                'prepared_by' => auth()->id(),
                'sub_total' => $subTotal,
                'grand_total' => $grandTotal,
                'payment_method' => $request->method,
                'account' => $request->account ?? null,
                'current_stock' => json_encode([]),
                'discount' => $discount,
                'invoice_code' => $invoiceCode,
                'date'=>$date,
            ]);

            $currentStockData = [];

            foreach ($request->cart as $item) {
                $purchase = Purchase::lockForUpdate()->findOrFail($item['purchase_id']);
                $purchase->available_stock = $purchase->available_stock ?? $purchase->quantity;

                if ($purchase->available_stock < $item['quantity']) {
                    throw new \Exception("Not enough stock for purchase ID {$purchase->id}");
                }

                $purchase->available_stock -= $item['quantity'];
                $purchase->save();
                $currentStockData[$purchase->id] = $purchase->available_stock;

                SalesItem::create([
                    'sale_id' => $sale->id,
                    'purchase_id' => $purchase->id,
                    'product_id' => $item['product_id'],
                    'brand' => $item['brand'],
                    'model' => $item['model'],
                    'variant' => $item['variant'],
                    'ram' => $item['ram'],
                    'rom' => $item['rom'],
                    'color' => $item['color'],
                    'imei' => $item['imei'],
                    'battery_health' => $item['battery_health'],
                    'quantity' => $item['quantity'],
                    'price' => $item['price'],          
                    'custom_price' => ((float)$item['price'] !== (float)$item['original_price']) ? $item['price'] : null,
                    'subtotal' => $item['price'] * $item['quantity'],
                    
                ]);
            }

            $sale->update(['current_stock' => json_encode($currentStockData)]);
            DB::commit();

            return response()->json([
                'message' => 'Sale completed',
                'sale_id' => $sale->id,
                'invoice_code' => $invoiceCode,
                'current_stock' => $currentStockData
            ]);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json(['message' => 'Sale failed', 'error' => $e->getMessage()], 500);
        }
    }

    public function list(): JsonResponse
    {
        $sales = Sale::with(['customer', 'preparedBy', 'items.product'])->latest()->get();

        $data = $sales->map(function (Sale $sale) {
            return $this->formatSaleData($sale);
        });

        return response()->json($data);
    }


    public function show($id): JsonResponse
    {
    
        $sale = Sale::with(['customer', 'preparedBy', 'items.product'])->findOrFail($id);

        return response()->json($this->formatSaleData($sale));
    }


   private function formatSaleData(Sale $sale): array
{
    
    $returnedItems = Sales_return::where('sale_id', $sale->id)
        ->get()
        ->keyBy(function ($r) {
            return $r->product_id . '_' . $r->imei;
        });

    return [
        'id' => $sale->id,
        'customer_name' => $sale->customer->name ?? null,
        'customer_phone' => $sale->customer->phone ?? null,
        'customer_address' => $sale->customer->address ?? null,
        'payment_method' => $sale->payment_method,
        'account' => $sale->account,
        'prepared_by' => $sale->preparedBy->name ?? "N/A",
        'branch' => $sale->items->first()?->purchase?->branch ?? "N/A",
        'date' => $sale->date,
        'created_at' => $sale->created_at,
        'sub_total' => $sale->sub_total,
        'grand_total' => $sale->grand_total,
        'discount' => $sale->discount ?? 0,
        'invoice_code' => $sale->invoice_code,

        'items' => $sale->items->map(function (SalesItem $item) use ($returnedItems) {

            
            $key = $item->product_id . '_' . $item->imei;

            $isReturned = isset($returnedItems[$key]);

            return [
                'product_name' => $item->product->name ?? null,
                'brand' => $item->product->brand ?? "-",
                'variant' => $item->variant,
                'ram' => $item->ram,
                'rom' => $item->rom,
                'color' => $item->color,
                'imei' => $item->imei,
                'battery_health' => $item->battery_health,
                'quantity' => $item->quantity,
                'price' => $item->price,
                'subtotal' => $item->subtotal,

                'status' => $isReturned ? 'returned' : 'sold',
            ];
        }),
    ];
}

}
