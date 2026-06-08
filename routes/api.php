<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\InventoryController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\ProfitCountController;
use App\Http\Controllers\PurchaseController;
use App\Http\Controllers\ReportController;
use App\Http\Controllers\ReturnController;
use App\Http\Controllers\SaleController;
use App\Http\Controllers\StockController;


Route::post('/login', [AuthController::class, 'login']);


Route::middleware('auth:sanctum')->group(function () {

    // for authentication
    Route::post('/logout', [AuthController::class, 'logout']);
    Route::get('/dashboard', [AuthController::class, 'dashboard']);

    // for inventory
    Route::get('/inventory', [InventoryController::class, 'index']);
  

    // for dashboard data
    Route::get('/dashboard-data', [DashboardController::class, 'index']);


    // for supllier info
    Route::get('/supplier-info', [ReportController::class, 'supplierReport']);

    // for stock manage
    Route::get('/branches/{purchase_id}', [StockController::class, 'getBranches']);
    Route::get('/stock-manage/{imei}', [StockController::class, 'getProduct']);
    Route::post('/exchange-stock', [StockController::class, 'exchangeStock']);
    Route::get('/stock-history/{id}', [StockController::class, 'getHistory']);
    Route::get('/stock-history-all', [StockController::class, 'getAllHistory']);


    // for products
    Route::prefix('products')->group(function () {
        Route::get('/', [ProductController::class, 'index']);
        Route::post('/', [ProductController::class, 'store']);
        Route::get('/{id}', [ProductController::class, 'show']);
        Route::put('/{id}', [ProductController::class, 'update']);
        Route::delete('/{id}', [ProductController::class, 'destroy']);
    });

    // for purchases
    Route::prefix('purchase')->group(function () {
        Route::get('/', [PurchaseController::class, 'index']);
        Route::post('/', [PurchaseController::class, 'store']);
        Route::get('/{id}', [PurchaseController::class, 'show']);
        Route::put('/{id}', [PurchaseController::class, 'update']);
        Route::delete('/{id}', [PurchaseController::class, 'destroy']);
    });

    // for sale
    Route::prefix('sale')->group(function () {
        Route::get('/available-products', [SaleController::class, 'availableProducts']);
        Route::post('/sales', [SaleController::class, 'store']);
        Route::get('/sales', [SaleController::class, 'index']);
        Route::get('/list', [SaleController::class, 'list']);
        Route::get('/{id}', [SaleController::class, 'show']);
    });


   // for Search purchases
Route::get('/purchase-return', [ReturnController::class, 'purchaseReturn']);

// for Return purchase
Route::post('/purchase-return/{purchaseId}', [ReturnController::class, 'returnPurchase']);
Route::get('/purchase-returns', [ReturnController::class, 'returnList']);


// for Search sale
 Route::get('/sale-return/search', [ReturnController::class, 'saleReturn']);

// for Return sale
    Route::post('/sale-return/{saleItemId}', [ReturnController::class, 'returnSale']);
    Route::get('/sale-returns', [ReturnController::class, 'returnSaleList']);
    

// to count profit
    Route::get('/profit-report', [ProfitCountController::class, 'index']);
});
