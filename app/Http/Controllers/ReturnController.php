<?php

namespace App\Http\Controllers;

use App\Models\Purchase;
use App\Models\Purchase_return;
use App\Models\Sales_return;
use App\Models\SalesItem;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ReturnController extends Controller
{
    
// ............................................for purchase return..............................................


    /**
     * 🔍 Search Purchases
     */
    public function purchaseReturn(Request $request)
    {
        if (!$request->filled('search')) {
            return response()->json(['purchases' => []]);
        }

        $search = $request->search;
        $purchases = Purchase::with(['product', 'stockManages'])
            ->where(function ($q) use ($search) {
                $q->where('imei', 'LIKE', "%{$search}%")
                    ->orWhere('brand', 'LIKE', "%{$search}%")
                    ->orWhere('model', 'LIKE', "%{$search}%")
                    ->orWhereHas('product', function ($pq) use ($search) {
                        $pq->where('name', 'LIKE', "%{$search}%");
                    });
            })->latest()->get();

        $data = $purchases->map(function ($p) {
            return [
                'id' => $p->id,
                'product_name' => $p->product->name ?? 'Unknown',
                'branch' => $p->branch ?? '-',
                'available_stock' => $p->available_stock ?? 0,
                'imei' => $p->imei ?? '-',
                'price' => $p->price ?? 0,
                'brand' => $p->brand ?? '-',
                'model' => $p->model ?? '-',
                'ram' => $p->ram ?? '-',
                'rom' => $p->rom ?? '-',
                'color' => $p->color ?? '-',
                'condition' => $p->condition ?? '-',
            ];
        });

        return response()->json(['purchases' => $data], 200);
    }

    // return purchase logic
    public function returnPurchase(Request $request, $purchaseId)
    {
        return DB::transaction(function () use ($request, $purchaseId) {
            $purchase = Purchase::lockForUpdate()->findOrFail($purchaseId);

            $request->validate([
                'note' => 'required|string',
            ]);

         
            Purchase_return::create([
                'purchase_id'    => $purchase->id,
                'product_id'     => $purchase->product_id,
                'quantity'       => $purchase->available_stock,
                'return_price'   => $purchase->price ?? 0,
                'note'           => $request->note,
                'returned_by'    => auth()->id(),
                'returned_at'    => now(),

                'branch' => DB::table('stock_manages')
                    ->where('purchase_id', $purchase->id)
                    ->value('to_branch') ?? $purchase->branch ?? '-',

                'ram'            => $purchase->ram ?? '-',
                'rom'            => $purchase->rom ?? '-',
                'color'          => $purchase->color ?? '-',
                'imei'           => $purchase->imei ?? '-',
                'brand'          => $purchase->brand ?? '-',
                'barcode'        => $purchase->barcode ?? '-',
                'model'          => $purchase->model ?? '-',
                'price'          => $purchase->price ?? 0,
                'variant'        => $purchase->variant ?? '-',
                'battery_health' => $purchase->battery_health ?? '-',
                'memo'           => $purchase->memo ?? '-',
                'date'           => $purchase->date ?? '-',
                'supplier_name'  => $purchase->supplier_name ?? '-',
                'contact_number' => $purchase->contact_number ?? '-',
                'nid_number'     => $purchase->nid_number ?? '-',
                'condition'      => $purchase->condition ?? '-',
                'box'            => $purchase->box ?? '-',
                'available_stock' => $purchase->available_stock ?? 0,
                'salesPrice'     => $purchase->salesPrice ?? 0,
                'status'         => 'returned',
                'nid_image'      => $purchase->nid_image ?? '-',
                'memo_image'     => $purchase->memo_image ?? '-',
                'prepared_by'    => $purchase->prepared_by,
            ]);

            $purchase->delete();

            return response()->json(['message' => 'Purchase returned successfully!']);
        });
    }

    public function returnList()
    {
        $returns = Purchase_return::with(['product', 'preparedByUser'])->latest()->get();

        $data = $returns->map(function ($r) {

            
            $branchFromStock = DB::table('stock_manages')
                ->where('purchase_id', $r->purchase_id)
                ->value('to_branch');

            return [
                'id'             => $r->id,
                'date'           => $r->created_at->format('Y-m-d'),
                'quantity'       => $r->quantity,
                'product_name'   => $r->product->name ?? 'Unknown Product',
                'return_price'   => $r->return_price,
                'imei'           => $r->imei,
                'branch'         => $branchFromStock ?? $r->branch ?? 'N/A', // ✅ FINAL FIX
                'note'           => $r->note,
                'brand'          => $r->brand,
                'ram'            => $r->ram,
                'rom'            => $r->rom,
                'color'          => $r->color,
                'battery_health' => $r->battery_health,
                'prepared_by_name' => $r->preparedByUser->name ?? 'System',
            ];
        });

        return response()->json(['returns' => $data]);
    }


// ............................................for sale return..............................................

// to search the item/imei
public function saleReturn(Request $request)
{
    if (!$request->filled('search')) {
        return response()->json(['sales' => []]);
    }

    $search = $request->search;

    $items = SalesItem::with(['sale.customer', 'product', 'purchase'])
        ->where('imei', 'LIKE', "%{$search}%")
        ->orWhere('brand', 'LIKE', "%{$search}%")
        ->latest()
        ->get();

    $data = $items->map(function ($item) {
        return [
            'id' => $item->id,
            'sale_id' => $item->sale_id,
            'purchase_id' => $item->purchase_id,
            'product_id' => $item->product_id,
            'product_name' => $item->product->name ?? 'Unknown',
            'customer_name' => $item->sale->customer->name ?? 'Walk-in',
            'customer_phone' => $item->sale->customer->phone ?? '-',
            'imei' => $item->imei,
            'brand' => $item->brand,
            'ram' => $item->ram,
            'rom' => $item->rom,
            'color' => $item->color,
            'condition' => $item->condition,
            'quantity' => $item->quantity,
            'price' => $item->price,
            'branch' => $item->purchase->branch ?? '-',
            'buy_date' => $item->sale->date ?? null,
        ];
    });

    return response()->json(['sales' => $data], 200);
}

 public function returnSale(Request $request, $saleItemId)
{
    return DB::transaction(function () use ($request, $saleItemId) {

        $item = SalesItem::with(['sale.customer', 'purchase'])
            ->lockForUpdate()
            ->findOrFail($saleItemId);

        $request->validate([
            'note' => 'required|string',
        ]);

        
        $alreadyReturned = Sales_return::where('sale_id', $item->sale_id)
            ->where('product_id', $item->product_id)
            ->where('imei', $item->imei)
            ->exists();

        if ($alreadyReturned) {
            return response()->json([
                'message' => 'This item is already returned!'
            ], 400);
        }

     
        Sales_return::create([
            'sale_id' => $item->sale_id,
            'product_id' => $item->product_id,
            'purchase_id' => $item->purchase_id,
            'customer_id' => $item->sale->customer_id,
            'brand' => $item->brand,
            'color' => $item->color,
            'variant' => $item->variant,
            'battery_health' => $item->battery_health,
            'condition' => $item->condition,
            'ram' => $item->ram,
            'rom' => $item->rom,
            'box' => $item->box,
            'imei' => $item->imei,
            'branch' => $item->purchase->branch ?? '-',
            'customer_phone' => $item->sale->customer->phone ?? '-',
            'grand_total' => $item->sale->grand_total,
            'quantity' => $item->quantity,
            'available_stock' => $item->purchase->available_stock ?? 0,
            'buy_date' => $item->sale->date,
            'note' => $request->note,
            'prepared_by' => auth()->id(),
        ]);

       
        $item->update([
            'status' => 'returned'
        ]);

    
        if ($item->purchase) {
            $item->purchase->increment('available_stock', $item->quantity);
        }

        return response()->json([
            'message' => 'Sale returned successfully!'
        ]);
    });
}

public function returnSaleList()
{
    $returns = Sales_return::with(['product', 'preparedByUser'])
        ->latest()
        ->get();

    $data = $returns->map(function ($r) {
        return [
            'id' => $r->id,
            'date' => $r->created_at->format('Y-m-d'), // ✅ FIXED FINAL
            'quantity' => $r->quantity,
            'product_name' => optional($r->product)->name ?? 'Unknown',
            'imei' => $r->imei,
            'brand' => $r->brand,
            'ram' => $r->ram,
            'rom' => $r->rom,
            'color' => $r->color,
            'battery_health' => $r->battery_health,
            'branch' => $r->branch ?? 'N/A',
            'return_price' => $r->grand_total ?? 0,
            'note' => $r->note,
            'prepared_by_name' => optional($r->preparedByUser)->name ?? 'System',
        ];
    });

    return response()->json(['returns' => $data]);
}


}

