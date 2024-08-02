<?php

namespace App\Http\Controllers;
use App\Models\Comment;
use Illuminate\Http\Request;

class CommentController extends Controller
{
    public function store(Request $request, $postId)
    {
        try {
            $request->validate([
                'user_id' => 'required|exists:users,id',
                'content' => 'required|string',
            ]);
    
            $comment = Comment::create([
                'post_id' => $postId,
                'user_id' => $request->user_id,
                'content' => $request->content,
            ]);
    
            return response()->json(['success' => true, 'data' => $comment], 201);
        } catch (\Illuminate\Validation\ValidationException $e) {
            return response()->json(['error' => $e->errors()], 422);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
    
}