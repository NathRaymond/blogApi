<?php

namespace App\Http\Controllers;
use App\Models\Like;
use Illuminate\Http\Request;

class LikeController extends Controller
{
    public function store(Request $request, $postId)
    {
        try {
            $request->validate(['user_id' => 'required|exists:users,id']);
    
            $like = Like::create([
                'post_id' => $postId,
                'user_id' => $request->user_id,
            ]);
    
            return response()->json(['success' => true, 'data' => $like], 201);
        } catch (\Illuminate\Validation\ValidationException $e) {
            return response()->json(['error' => $e->errors()], 422);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
    

}