<?php

namespace App\Http\Controllers;

use App\Models\Purchase;
use App\Models\Sale;
use App\Models\SalesItem;
use Carbon\Carbon;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function index(Request $request)
    {
        $today = Carbon::today();
        $startOfMonth = Carbon::now()->startOfMonth();
        $endOfMonth = Carbon::now()->endOfMonth();
        $currentYear = Carbon::now()->year;

        // ================= PURCHASE =================
        $todayPurchase = Purchase::whereDate('created_at', $today)
            ->selectRaw('SUM(price * quantity) as total')
            ->value('total') ?? 0;

        $monthlyPurchase = Purchase::whereBetween('created_at', [$startOfMonth, $endOfMonth])
            ->selectRaw('SUM(price * quantity) as total')
            ->value('total') ?? 0;

        // ================= SALES (UNCHANGED - TOTALS) =================
        $latestItems = SalesItem::whereIn('id', function ($query) {
            $query->selectRaw('MAX(id)')
                ->from('sales_items')
                ->groupBy('imei'); 
        })
            ->where('status', 'sold') 
            ->whereDate('created_at', $today)
            ->pluck('sale_id')
            ->unique();

        $todaySale = Sale::whereIn('id', $latestItems)
            ->sum('grand_total');

        $latestMonthlySaleIds = SalesItem::whereIn('id', function ($query) {
            $query->selectRaw('MAX(id)')
                ->from('sales_items')
                ->groupBy('imei'); 
        })
            ->where('status', 'sold') 
            ->pluck('sale_id')        
            ->unique();             

        $monthlySale = Sale::whereIn('id', $latestMonthlySaleIds)
            ->whereBetween('date', [$startOfMonth, $endOfMonth]) 
            ->sum('grand_total');

        // ================= STOCK =================
        $availableStock = Purchase::sum('available_stock');

        $stockValuation = Purchase::selectRaw('SUM(price * available_stock) as total')
            ->value('total') ?? 0;

        // ================= DAILY (7 DAYS) =================
        $dailyData = [];

        for ($i = 6; $i >= 0; $i--) {
            $date = Carbon::now()->subDays($i);

           
            $sales = Sale::whereDate('date', $date)
                ->latest('id') 
                ->value('grand_total') ?? 0;

           
            $purchase = Purchase::whereDate('created_at', $date)
                ->selectRaw('SUM(price * quantity) as total')
                ->value('total') ?? 0;

            $dailyData[] = [
                'date' => $date->format('d M'),
                'sales' => (float) $sales,
                'purchase' => (float) $purchase,
            ];
        }

        
        $monthlyData = [];

        for ($m = 1; $m <= 12; $m++) {

            $sales = Sale::whereYear('date', $currentYear)
                ->whereMonth('date', $m)
                ->sum('grand_total');

            $purchase = Purchase::whereYear('created_at', $currentYear)
                ->whereMonth('created_at', $m)
                ->selectRaw('SUM(price * quantity) as total')
                ->value('total') ?? 0;

            $monthlyData[] = [
                'name' => Carbon::create()->month($m)->format('M'),
                'sales' => (float) $sales,
                'purchase' => (float) $purchase,
            ];
        }

        return response()->json([
            'todayPurchase' => $todayPurchase,
            'monthlyPurchase' => $monthlyPurchase,
            'todaySale' => $todaySale,
            'monthlySale' => $monthlySale,
            'availableStock' => $availableStock,
            'stockValuation' => $stockValuation,
            'dailyData' => $dailyData,
            'monthlyData' => $monthlyData,
            'user' => optional($request->user())->only(['id', 'name', 'email']),
        ]);
    }
}
