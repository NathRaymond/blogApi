<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\BlogController;
use App\Http\Controllers\PostController;
use App\Http\Controllers\LikeController;
use App\Http\Controllers\CommentController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::middleware('token')->group(function () {
    // Blog Routes
    Route::get('blogs', [BlogController::class, 'index']);
    Route::post('blogs', [BlogController::class, 'store']);
    Route::get('blogs/{id}', [BlogController::class, 'show']);
    Route::put('blogs/{id}', [BlogController::class, 'update']);
    Route::delete('blogs/{id}', [BlogController::class, 'destroy']);

    // Post Routes
    Route::get('blogs/{blogId}/posts', [PostController::class, 'index']);
    Route::post('blogs/{blogId}/posts', [PostController::class, 'store']);
    Route::get('blogs/{blogId}/posts/{id}', [PostController::class, 'show']);
    Route::put('blogs/{blogId}/posts/{id}', [PostController::class, 'update']);
    Route::delete('blogs/{blogId}/posts/{id}', [PostController::class, 'destroy']);

    // Like Routes
    Route::post('posts/{postId}/like', [LikeController::class, 'store']);

    // Comment Routes
    Route::post('posts/{postId}/comment', [CommentController::class, 'store']);
});