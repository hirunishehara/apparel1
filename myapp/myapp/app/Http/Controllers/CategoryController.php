<?php

namespace App\Http\Controllers;

use App\Models\category;
use Illuminate\Http\Request;

class CategoryController extends Controller
{
    public function addCategory(Request $request){
        $product = new Category();
        $product->cloth_name = $request->cloth_name;
        $product->brand_name = $request->brand_name;
        $product->description = $request->description;
        $product->price = $request->price;
        $product->quantity = $request->quantity;

        $product->save();

        return response()->json([
            'message' => 'item added successfully',
            'product' => $product,
        ], 201);
    }
    public function updateCategory(Request $request){
        $product = Category::find($request->id);
        $product->cloth_name = $request->cloth_name;
        $product->brand_name = $request->brand_name;
        $product->description = $request->description;
        $product->price = $request->price;
        $product->quantity = $request->quantity;

        $product->save();
        return response()->json([
        'message' => 'Item updated successfully',
        'product' => $product,
        ], 200);

    }

    public function deleteCategory(Request $request){
        $product = Category::find($request->id);
        $product->delete();
        return response()->json([
        'message' => 'Item deleted successfully',
        ], 200);

    }
    //create a function to get all the products
    public function getAllCategories(){
        $categories = Category::all();
        return response()->json([
            'message' => 'All categories retrieved successfully',
            'categories' => $categories,
        ], 200);
    }
    public function getCategory(){
        $categories = Category::all();
        return response()->json([
            'message' => 'All categories retrieved successfully',
            'categories' => $categories,
        ], 200);
    }
}
