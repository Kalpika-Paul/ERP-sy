<?php

namespace App\Http\Controllers;

use App\Models\Purchase;
use App\Models\Sale;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class StockController extends Controller
{
    // Get product details by IMEI
  public function getProduct($imei)
{
    $product = DB::table('purchases')
        ->leftJoin('products', 'purchases.product_id', '=', 'products.id')
        ->where('purchases.imei', $imei)
        ->select(
            'purchases.*', 
            'products.name as product_name',    
            'products.brand as product_brand'   
        )
        ->first();

    if (!$product) {
        return response()->json(['message' => 'Product not found'], 404);
    }

    return response()->json([
        'product' => $product
    ]);
}

// public function exchangeStock(Request $request)
// {
//     $request->validate([
//         'purchase_id' => 'required|exists:purchases,id',
//         'source_branch' => 'required|string',
//         'destination_branch' => 'required|string|different:source_branch',
//         'exchange_quantity' => 'required|integer|min:1',
//     ]);

//     $qty = $request->exchange_quantity;

//     DB::transaction(function () use ($request, $qty) {

//         $purchase = Purchase::findOrFail($request->purchase_id);

//         // ✅ Insert transfer log
//         DB::table('stock_manages')->insert([
//             'purchase_id'   => $purchase->id,
//             'from_branch'   => $request->source_branch,
//             'to_branch'     => $request->destination_branch,
//             'quantity'      => $qty,
//             'transfer_date' => now(),
//             'created_at'    => now(),
//             'updated_at'    => now(),
//         ]);

//         // ⚠️ Get all sales (you can optimize later if needed)
//         $sales = Sale::all();

//         foreach ($sales as $sale) {

//             $currentStock = json_decode($sale->current_stock, true);

//             if (!$currentStock) continue;

//             // 🔽 STEP 1: Reduce stock from source branch
//             if (isset($currentStock[$purchase->id])) {

//                 // Check branch match
//                 if ($currentStock[$purchase->id]['branch'] === $request->source_branch) {

//                     if ($currentStock[$purchase->id]['available_stock'] < $qty) {
//                         throw new \Exception('Not enough stock in source branch');
//                     }

//                     $currentStock[$purchase->id]['available_stock'] -= $qty;

//                     // Remove if zero
//                     if ($currentStock[$purchase->id]['available_stock'] == 0) {
//                         unset($currentStock[$purchase->id]);
//                     }

//                 } else {
//                     continue; // skip if branch mismatch
//                 }
//             } else {
//                 continue; // skip if no stock found
//             }

//             // 🔼 STEP 2: Add stock to destination branch
//             $destKey = $purchase->id . '_to_' . $request->destination_branch;

//             if (isset($currentStock[$destKey])) {

//                 // Increase existing stock
//                 $currentStock[$destKey]['available_stock'] += $qty;

//             } else {

//                 // Create new destination stock
//                 $currentStock[$destKey] = [
//                     'branch'          => $request->destination_branch,
//                     'imei'            => $purchase->imei,
//                     'product_id'      => $purchase->product_id,
//                     'available_stock' => $qty,
//                 ];
//             }

           
//             $sale->update([
//                 'current_stock' => json_encode($currentStock)
//             ]);
//         }
//     });

//     return response()->json([
//         'message' => 'Stock transfer completed successfully'
//     ]);
// }

public function exchangeStock(Request $request)
{
    $request->validate([
        'purchase_id' => 'required|exists:purchases,id',
        'source_branch' => 'required|string',
        'destination_branch' => 'required|string|different:source_branch',
    ]);

    DB::transaction(function () use ($request) {

        $purchase = Purchase::findOrFail($request->purchase_id);

        
        $totalTransferredOut = DB::table('stock_manages')
            ->where('purchase_id', $purchase->id)
            ->where('from_branch', $request->source_branch)
            ->sum('quantity');

        $totalTransferredIn = DB::table('stock_manages')
            ->where('purchase_id', $purchase->id)
            ->where('to_branch', $request->source_branch)
            ->sum('quantity');

       
        $availableStock = $purchase->available_stock + $totalTransferredIn - $totalTransferredOut;

        if ($availableStock <= 0) {
            throw new \Exception('No stock available in this branch');
        }

      
        $qty = $availableStock;

        
        DB::table('stock_manages')->insert([
            'purchase_id'   => $purchase->id,
            'from_branch'   => $request->source_branch,
            'to_branch'     => $request->destination_branch,
            'quantity'      => $qty,
            'transfer_date' => now(),
            'created_at'    => now(),
            'updated_at'    => now(),
        ]);

     
        $sales = Sale::where('current_stock', 'LIKE', '%' . $purchase->id . '%')->get();

        foreach ($sales as $sale) {

            $currentStock = json_decode($sale->current_stock, true);
            if (!$currentStock) continue;

         
            if (isset($currentStock[$purchase->id])) {

                if ($currentStock[$purchase->id]['branch'] === $request->source_branch) {

                    $currentStock[$purchase->id]['available_stock'] -= $qty;

                    if ($currentStock[$purchase->id]['available_stock'] <= 0) {
                        unset($currentStock[$purchase->id]);
                    }

                } else {
                    continue;
                }
            } else {
                continue;
            }

           
            $destKey = $purchase->id . '_to_' . $request->destination_branch;

            if (isset($currentStock[$destKey])) {
                $currentStock[$destKey]['available_stock'] += $qty;
            } else {
                $currentStock[$destKey] = [
                    'branch'          => $request->destination_branch,
                    'imei'            => $purchase->imei,
                    'product_id'      => $purchase->product_id,
                    'available_stock' => $qty,
                ];
            }

            $sale->update([
                'current_stock' => json_encode($currentStock)
            ]);
        }
    });

    return response()->json([
        'message' => 'Stock transfer completed successfully'
    ]);
}
    // public function getHistory($purchase_id)
    // {
    //     $history = DB::table('stock_manages')
    //         ->where('purchase_id', $purchase_id)
    //         ->orderBy('id', 'desc')
    //         ->get();

    //     return response()->json($history);
    // }



    // this is for to show the value in the stock manage table. due to some unavaoidable issue the method is named as gethistory
public function getHistory($purchase_id)
{
    $history = DB::table('stock_manages')
        ->where('purchase_id', $purchase_id)
        ->orderBy('id', 'desc')
        ->select(
            'from_branch',
            'to_branch',
            'quantity',
            'transfer_date' 
        )
        ->get();

    return response()->json($history);
}



    public function getAllHistory()
    {
        try {
            $history = DB::table('stock_manages')
                ->leftJoin('purchases', 'stock_manages.purchase_id', '=', 'purchases.id')
                ->leftJoin('products', 'purchases.product_id', '=', 'products.id')
                ->select(
                    'stock_manages.id',
                    DB::raw("COALESCE(products.name, 'Unknown Product') as product_name"),
                    DB::raw("COALESCE(purchases.imei, 'N/A') as imei"),
                    'stock_manages.from_branch',
                    'stock_manages.to_branch',
                    'stock_manages.quantity',
                    'stock_manages.transfer_date'
                )
                ->orderBy('stock_manages.id', 'desc')
                ->get();

            return response()->json($history);
        } catch (\Exception $e) {
            Log::error('StockHistoryAll Error: '.$e->getMessage());

            return response()->json([
                'message' => 'Error fetching stock history',
                'error' => $e->getMessage()
            ], 500);
        }
    }
}