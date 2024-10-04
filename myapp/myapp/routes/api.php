<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\ControllerS\AuthController;
use App\Http\Controllers\CategoryController;

route::post('/register', [AuthController::class, 'register']);
route::post('/login', [AuthController::class, 'login']);
Route::middleware('auth:sanctum')->group(function () {
Route::post('/logout', [AuthController::class, 'logout']);
Route::post('/addCategory', [CategoryController::class, 'addCategory']);
Route::put('/updateCategory', [CategoryController::class, 'updateCategory']);
Route::delete('/deleteCategory', [CategoryController::class, 'deleteCategory']);
Route::get('getCategory', [CategoryController::class, 'getCategory']);
});