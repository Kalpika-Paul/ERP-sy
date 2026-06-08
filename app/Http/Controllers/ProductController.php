<?php

namespace App\Http\Controllers;

use App\Models\Product;
use App\Services\ImageUploadService;
use Illuminate\Http\Request;

class ProductController extends Controller
{
    
    public function index()
    {
        $products = Product::all()->map(function ($product) {
         
            $product->image_url = $product->image
                ? asset($product->image)
                : null;
            return $product;
        });

        return response()->json(['products' => $products]);
    }

    public function show($id)
    {
        $product = Product::findOrFail($id);
        $product->image_url = $product->image
            ? asset($product->image)
            : null;

        return response()->json(['product' => $product]);
    }


    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'brand' => 'required',
            'image' => 'required|image|max:2048',
        ]);

        $product = new Product();
        $product->fill($request->only([
            'name','brand',
        ]));

        
        if ($request->hasFile('image')) {
            $product->image = ImageUploadService::storeImage(
                $request->file('image'),
                'product-images'
            );
        }

        $product->save();

        $product->image_url = $product->image
            ? asset($product->image)
            : null;

        return response()->json(['success' => true, 'product' => $product]);
    }


    public function update(Request $request, $id)
    {
        $product = Product::findOrFail($id);

        $request->validate([
            'name' => 'required',
            'brand' => 'required',
            'image' => 'nullable|image|max:2048',
        ]);

        $product->fill($request->only([
            'name','brand'
        ]));

        
        if ($request->hasFile('image')) {
            
            if ($product->image && file_exists(public_path('product-images/' . $product->image))) {
                unlink(public_path('product-images/' . $product->image));
            }

            $product->image = ImageUploadService::storeImage(
                $request->file('image'),
                'product-images'
            );
        }

        $product->save();

        $product->image_url = $product->image
            ? asset('product-images/' . $product->image)
            : null;

        return response()->json(['success' => true, 'product' => $product]);
    }


    public function destroy($id)
    {
        $product = Product::findOrFail($id);

       
        if ($product->image && file_exists(public_path($product->image))) {
            unlink(public_path($product->image));
        }

        $product->delete();

        return response()->json(['success' => true]);
    }

    
}