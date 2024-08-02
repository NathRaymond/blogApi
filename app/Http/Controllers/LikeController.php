<?php

namespace App\Http\Controllers;
use App\Models\Like;
use Illuminate\Http\Request;

class LikeController extends Controller
{
    public function store(Request $request, $postId)
{
    $request->validate(['user_id' => 'required|exists:users,id']);

    $like = Like::create([
        'post_id' => $postId,
        'user_id' => $request->user_id,
    ]);

    return response()->json($like, 201);
}

}