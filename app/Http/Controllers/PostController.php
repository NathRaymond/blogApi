<?php

namespace App\Http\Controllers;
use App\Models\Post;
use Illuminate\Http\Request;

class PostController extends Controller
{
    public function index($blogId)
{
    try {
        $posts = Post::where('blog_id', $blogId)->get();
        return response()->json(['success' => true, 'data' => $posts], 200);
    } catch (\Exception $e) {
        return response()->json(['error' => $e->getMessage()], 500);
    }
}

public function store(Request $request, $blogId)
{
    try {
        $request->validate([
            'title' => 'required|string',
            'content' => 'required|string',
        ]);

        $post = Post::create(array_merge($request->all(), ['blog_id' => $blogId]));
        return response()->json(['success' => true, 'data' => $post], 201);
    } catch (\Illuminate\Validation\ValidationException $e) {
        return response()->json(['error' => $e->errors()], 422);
    } catch (\Exception $e) {
        return response()->json(['error' => $e->getMessage()], 500);
    }
}

public function show($blogId, $id)
{
    try {
        $post = Post::with('likes', 'comments')->where('blog_id', $blogId)->findOrFail($id);
        return response()->json(['success' => true, 'data' => $post], 200);
    } catch (\Illuminate\Database\Eloquent\ModelNotFoundException $e) {
        return response()->json(['error' => 'Post not found'], 404);
    } catch (\Exception $e) {
        return response()->json(['error' => $e->getMessage()], 500);
    }
}

public function update(Request $request, $blogId, $id)
{
    try {
        $request->validate([
            'title' => 'string',
            'content' => 'string',
        ]);

        $post = Post::where('blog_id', $blogId)->findOrFail($id);
        $post->update($request->all());
        return response()->json(['success' => true, 'data' => $post], 200);
    } catch (\Illuminate\Validation\ValidationException $e) {
        return response()->json(['error' => $e->errors()], 422);
    } catch (\Illuminate\Database\Eloquent\ModelNotFoundException $e) {
        return response()->json(['error' => 'Post not found'], 404);
    } catch (\Exception $e) {
        return response()->json(['error' => $e->getMessage()], 500);
    }
}

public function destroy($blogId, $id)
{
    try {
        $post = Post::where('blog_id', $blogId)->findOrFail($id);
        $post->delete();
        return response()->json(['success' => true, 'message' => 'Deleted successfully'], 200);
    } catch (\Illuminate\Database\Eloquent\ModelNotFoundException $e) {
        return response()->json(['error' => 'Post not found'], 404);
    } catch (\Exception $e) {
        return response()->json(['error' => $e->getMessage()], 500);
    }
}

    }