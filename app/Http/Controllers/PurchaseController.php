<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Mail\PurchaseCreatedMail;
use Illuminate\Http\Request;
use App\Models\Purchase;
use App\Models\Product;
use App\Services\ImageUploadService;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Validator;

class PurchaseController extends Controller
{
    public function index()
    {
        $purchases = Purchase::with(['product', 'preparedBy'])
            ->orderBy('created_at', 'desc')
            ->get();

        $data = $purchases->map(function ($p) {
            return [
                'id' => $p->id,
                'barcode' => $p->barcode,
                'prepared_by' => $p->preparedBy->name ?? null,
                'product_name' => $p->product->name ?? null,
                'branch' => $p->branch,
                'memo' => $p->memo,
                'condition' => $p->condition,
                'brand' => $p->brand,
                'model' => $p->model,
                'color' => $p->color,
                'variant' => $p->variant,
                'ram' => $p->ram,
                'rom' => $p->rom,
                'box' => $p->box,
                'imei' => $p->imei,
                'price' => $p->price,
                'salesPrice' => $p->salesPrice ?? null,
                'supplier_name' => $p->supplier_name,
                'contact_number' => $p->contact_number,
                'nid_number' => $p->nid_number,
                'nid_image' => $p->nid_image ? asset($p->nid_image) : null,
                'memo_image' => $p->memo_image ? asset($p->memo_image) : null,
                'month' => $p->month,
                'status' => $p->status,
                'quantity' => $p->quantity,
                'battery_health'=>$p->battery_health
            ];
        });

        return response()->json(['purchases' => $data], 200);
    }


public function store(Request $request)
{
    $validated = $request->validate([
        'product_id' => 'required|exists:products,id',
        'quantity' => 'required|integer',
        'brand' => 'required|string|max:255',
        'model' => 'nullable|string|max:255',
        'price' => 'required|string|max:255',
        'color' => 'required|string|max:255',
        'variant' => 'required|string|max:255',
        'ram' => 'required|string|max:255',
        'rom' => 'required|string|max:255',
        'battery_health' => 'required|string',
        'branch' => 'required|string|max:255',
        'memo' => 'required|string|max:255',
        'month' => 'required|string|max:255',
        'supplier_name' => 'required|string|max:255',
        'contact_number' => 'required|string|max:255',
        'nid_number' => 'required|string|max:255',
        'nid_image' => 'required|image|mimes:jpeg,png,jpg|max:2048',
        'memo_image' => 'nullable|image|mimes:jpeg,png,jpg|max:2048',
        'status' => 'nullable|string|in:pending,approved',
          'imei' => 'required|unique:purchases,imei',
        'condition' => 'required',
        'box' => 'required',
    ]);

    $validated['prepared_by'] = auth()->id();

  
$lastPurchase = Purchase::orderByRaw('CAST(barcode AS UNSIGNED) DESC')->first();

if ($lastPurchase && $lastPurchase->barcode >= 20260901) {
    $validated['barcode'] = $lastPurchase->barcode + 1;
} else {
    $validated['barcode'] = 20260901;
}

    // Use ImageUploadService
    if ($request->hasFile('nid_image')) {
        $validated['nid_image'] = ImageUploadService::storeImage($request->file('nid_image'), 'purchases/NID');
    }

    if ($request->hasFile('memo_image')) {
        $validated['memo_image'] = ImageUploadService::storeImage($request->file('memo_image'), 'purchases/Memo');
    }

    $validated['available_stock'] = $validated['quantity'];

    $purchase = Purchase::create($validated);

    return response()->json([
        'message' => 'Purchase stored successfully!',
        'purchase' => $purchase
    ], 200);
}



    public function show($id)
    {
        $purchase = Purchase::with('product')->find($id);

        if (!$purchase) {
            return response()->json(['message' => 'Purchase not found'], 404);
        }

        return response()->json([
            'purchase' => [
                'id' => $purchase->id,
                'product_id' => $purchase->product_id,
                'product_name' => $purchase->product->name ?? null,
                'branch' => $purchase->branch,
                'memo' => $purchase->memo,
                'condition' => $purchase->condition,
                'brand' => $purchase->brand,
                'model' => $purchase->model,
                'color' => $purchase->color,
                'variant' => $purchase->variant,
                'ram' => $purchase->ram,
                'rom' => $purchase->rom,
                'box' => $purchase->box,
                'imei' => $purchase->imei,
                'price' => $purchase->price,
                'salesPrice' => $purchase->salesPrice ?? null,
                'supplier_name' => $purchase->supplier_name,
                'contact_number' => $purchase->contact_number,
                'nid_number' => $purchase->nid_number,
                'nid_image' => $purchase->nid_image ? asset($purchase->nid_image) : null,
                'memo_image' => $purchase->memo_image ? asset($purchase->memo_image) : null,
                'month' => $purchase->month,
                'status' => $purchase->status,
                'quantity' => $purchase->quantity,
                'battery_health'=>$purchase->battery_health,
            ]
        ], 200);
    }

   public function update(Request $request, $id)
{
    $purchase = Purchase::find($id);
    if (!$purchase) {
        return response()->json(['message' => 'Purchase not found'], 404);
    }

    // Validation
    $validator = Validator::make($request->all(), [
        'branch' => 'sometimes|required|string',
        'month' => 'sometimes|required|string',
        'supplier_name' => 'sometimes|required|string',
        'contact_number' => 'sometimes|required|string',
        'nid_number' => 'sometimes|string|nullable',
        'nid_image' => 'nullable|image|mimes:jpeg,png,jpg|max:2048',
        'memo_image' => 'nullable|image|mimes:jpeg,png,jpg|max:2048',
        'salesPrice' => 'nullable|numeric',
        'status' => 'nullable|string|in:pending,approved',
        'condition' => 'nullable|string',
        'quantity' => 'nullable|integer|min:1',
    ]);

    if ($validator->fails()) {
        return response()->json(['errors' => $validator->errors()], 422);
    }

    // Update basic fields
    $purchase->fill($request->only([
        'branch', 'month', 'supplier_name', 'contact_number', 'nid_number',
        'salesPrice', 'condition', 'battery_health', 'product_id', 'imei', 'memo',
        'brand', 'model', 'variant', 'ram', 'rom', 'color', 'price'
    ]));

    // Update quantity & adjust available stock
    if ($request->has('quantity')) {
        $diff = $request->quantity - $purchase->quantity;
        $purchase->quantity = $request->quantity;
        $purchase->available_stock += $diff;
        if ($purchase->available_stock < 0) {
            $purchase->available_stock = 0;
        }
    }

    // NID Image
    if ($request->hasFile('nid_image')) {
        if ($purchase->nid_image && file_exists(public_path($purchase->nid_image))) {
            unlink(public_path($purchase->nid_image));
        }
        $purchase->nid_image = ImageUploadService::storeImage($request->file('nid_image'), 'purchases/NID');
    }

    // Memo Image
    if ($request->hasFile('memo_image')) {
        if ($purchase->memo_image && file_exists(public_path($purchase->memo_image))) {
            unlink(public_path($purchase->memo_image));
        }
        $purchase->memo_image = ImageUploadService::storeImage($request->file('memo_image'), 'purchases/Memo');
    }

    // ✅ Auto-approve if salesPrice is provided
    if ($request->filled('salesPrice') && (!$purchase->status || $purchase->status === 'pending')) {
        $purchase->status = 'approved';
    }

    $purchase->save();

    return response()->json([
        'message' => 'Purchase updated successfully',
        'purchase' => $purchase
    ], 200);
}

    
    public function destroy($id)
    {
        $purchase = Purchase::find($id);
        if (!$purchase) {
            return response()->json(['message' => 'Purchase not found'], 404);
        }

        if ($purchase->nid_image && file_exists(public_path($purchase->nid_image))) {
            unlink(public_path($purchase->nid_image));
        }
        if ($purchase->memo_image && file_exists(public_path($purchase->memo_image))) {
            unlink(public_path($purchase->memo_image));
        }

        $purchase->delete();

        return response()->json(['message' => 'Purchase deleted successfully'], 200);
    }
}