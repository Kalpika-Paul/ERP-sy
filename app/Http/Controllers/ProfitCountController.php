<?php

namespace App\Http\Controllers;

use App\Models\Purchase;
use App\Models\SalesItem;
use Illuminate\Http\Request;

class ProfitCountController extends Controller
{
    public function index()
    {
        try {
            $items = SalesItem::with(['sale', 'purchase.product'])
                ->orderBy('created_at', 'desc')
                ->get()
                ->unique('imei');

            $data = [];
            $totalProfit = 0;

            foreach ($items as $item) {

                $purchasePrice = $item->purchase->price ?? 0;
                $salePrice = $item->sale ? $item->sale->grand_total : 0;

                $profit = $salePrice - $purchasePrice;
                $totalProfit += $profit;

                $data[] = [
                    'id' => $item->id,
                    'product_name' => $item->purchase->product->name ?? '-',
                    'brand' => $item->purchase->product->brand ?? '-',
                    'color' => $item->purchase->color ?? '-',
                    'ram' => $item->purchase->ram ?? '-',
                    'rom' => $item->purchase->rom ?? '-',
                    'purchase_price' => $purchasePrice,
                    'sale_price' => $salePrice,
                    'profit' => $profit,
                    'date' => $item->created_at->format('Y-m-d'),
                ];
            }

            return response()->json([
                'data' => $data,
                'total_profit' => $totalProfit
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'error' => $e->getMessage()
            ], 500);
        }
    }
}
