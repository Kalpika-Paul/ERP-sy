<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;

class InventoryController extends Controller
{
    // public function index()
    // {
    //     try {

    //         // 1️⃣ Get purchased items
    //         $purchases = DB::table('purchases')
    //             ->join('products', 'purchases.product_id', '=', 'products.id')
    //             ->join('users', 'purchases.prepared_by', '=', 'users.id')
    //             ->select(
    //                 'purchases.product_id',
    //                 'products.name',
    //                 'products.brand as product_brand',
    //                 'purchases.imei', 
    //                 'purchases.barcode',
    //                 'purchases.brand as purchase_brand',
    //                 'purchases.model',
    //                 'purchases.branch',
    //                 'purchases.rom',
    //                 'purchases.battery_health',
    //                 'purchases.price',
    //                 DB::raw('SUM(purchases.quantity) as purchased_qty')
    //             )
    //             ->groupBy(
    //                 'purchases.product_id',
    //                 'products.name',
    //                 'products.brand',
    //                 'purchases.imei', 
    //                 'purchases.barcode',
    //                 'purchases.brand',
    //                 'purchases.model',
    //                 'purchases.branch',
    //                 'purchases.rom',
    //                 'purchases.battery_health',
    //                 'purchases.price'
    //             )
    //             ->orderBy('purchases.id', 'desc')
    //             ->get();


    //         // 2️⃣ Get sold quantities
    //         $sales = DB::table('sales_items')
    //             ->join('purchases', 'sales_items.purchase_id', '=', 'purchases.id')
    //             ->join('users', 'purchases.prepared_by', '=', 'users.id')
    //             ->select(
    //                 'sales_items.product_id',
    //                 'purchases.imei', 
    //                 'users.branch',
    //                 'purchases.rom',
    //                 'purchases.battery_health',
    //                 DB::raw('SUM(sales_items.quantity) as sold_qty')
    //             )
    //             ->groupBy(
    //                 'sales_items.product_id',
    //                 'purchases.imei', 
    //                 'users.branch',
    //                 'purchases.rom',
    //                 'purchases.battery_health'
    //             )
    //             ->get()
    //             ->keyBy(function ($item) {
    //                 return $item->product_id . '_' . $item->imei . '_' . $item->branch . '_' . $item->rom . '_' . $item->battery_health;
    //             });


    //         // 3️⃣ Calculate current stock
    //         $inventory = $purchases->map(function ($item) use ($sales) {

    //             $key = $item->product_id . '_' . $item->imei . '_' . $item->branch . '_' . $item->rom . '_' . $item->battery_health;

    //             $soldQty = $sales[$key]->sold_qty ?? 0;

    //             $item->current_stock = $item->purchased_qty - $soldQty;

    //             return $item;
    //         });


    //         return response()->json([
    //             'products' => $inventory
    //         ]);

    //     } catch (\Exception $e) {

    //         return response()->json([
    //             'error' => $e->getMessage()
    //         ], 500);

    //     }
    // }



//  public function index()
// {
//     try {
//        
//         $purchases = DB::table('purchases')
//             ->join('products', 'purchases.product_id', '=', 'products.id')
//             ->join('users', 'purchases.prepared_by', '=', 'users.id')
//             ->leftJoin('sales', function($join) {
//                 $join->on('sales.id', '=', DB::raw('0')); 
//             })
//             ->select(
//                 'purchases.id as purchase_id',
//                 'purchases.product_id',
//                 'products.name',
//                 'products.brand as product_brand',
//                 'purchases.imei',
//                 'purchases.barcode',
//                 'purchases.brand as purchase_brand',
//                 'purchases.model',
//                 'purchases.branch',
//                 'purchases.rom',
//                 'purchases.battery_health',
//                 'purchases.price',
//                 'purchases.available_stock'
//             )
//             ->orderBy('purchases.id', 'desc')
//             ->get();

//         return response()->json([
//             'products' => $purchases
//         ]);

//     } catch (\Exception $e) {
//         return response()->json([
//             'error' => $e->getMessage()
//         ], 500);
//     }
// }



public function index()
{
    try {
        $purchases = DB::table('purchases')
            ->join('products', 'purchases.product_id', '=', 'products.id')
            ->join('users', 'purchases.prepared_by', '=', 'users.id')

            //  Stock Transfer logic
            ->leftJoin(DB::raw("(
                SELECT sm1.*
                FROM stock_manages sm1
                INNER JOIN (
                    SELECT purchase_id, MAX(id) as max_id
                    FROM stock_manages
                    GROUP BY purchase_id
                ) sm2 
                ON sm1.purchase_id = sm2.purchase_id 
                AND sm1.id = sm2.max_id
            ) as latest_transfer"), 'purchases.id', '=', 'latest_transfer.purchase_id')

            // Purchase Returns 
            ->leftJoin(DB::raw("(
                SELECT purchase_id, SUM(quantity) as total_returned
                FROM purchase_returns
                GROUP BY purchase_id
            ) as returns"), 'purchases.id', '=', 'returns.purchase_id')

            ->select(
                'purchases.id as purchase_id',
                'products.name',
                'products.brand as product_brand',
                'purchases.imei',
                'purchases.barcode',
                'purchases.brand as purchase_brand',
                'purchases.model',
                'purchases.month',
                DB::raw('COALESCE(latest_transfer.to_branch, purchases.branch) as branch'),
                'purchases.rom',
                'purchases.ram',
                'purchases.variant',
                'purchases.battery_health',
                'purchases.price',
                
              
                'purchases.available_stock as original_stock',
                DB::raw('COALESCE(returns.total_returned, 0) as returned_qty'),
                
                DB::raw('(purchases.available_stock - COALESCE(returns.total_returned, 0)) as net_stock')
            )
            ->orderBy('purchases.id', 'desc')
            ->get();

        return response()->json([
            'products' => $purchases
        ]);

    } catch (\Exception $e) {
        return response()->json([
            'error' => $e->getMessage()
        ], 500);
    }
}


}


