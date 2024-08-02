<?php

namespace App\Http\Controllers;
use App\Models\Post;
use Illuminate\Http\Request;

class PostController extends Controller
{
    public function index($blogId)
    {
        $posts = Post::where('blog_id', $blogId)->get();
        return response()->json($posts);
    }
    
    public function store(Request $request, $blogId)
    {
        $request->validate([
            'title' => 'required|string',
            'content' => 'required|string',
        ]);
    
        $post = Post::create(array_merge($request->all(), ['blog_id' => $blogId]));
        return response()->json($post, 201);
    }
    
    public function show($blogId, $id)
    {
        $post = Post::with('likes', 'comments')->where('blog_id', $blogId)->findOrFail($id);
        return response()->json($post);
    }
    
    public function update(Request $request, $blogId, $id)
    {
        $request->validate([
            'title' => 'string',
            'content' => 'string',
        ]);
    
        $post = Post::where('blog_id', $blogId)->findOrFail($id);
        $post->update($request->all());
        return response()->json($post);
    }
    
    public function destroy($blogId, $id)
    {
        Post::where('blog_id', $blogId)->findOrFail($id)->delete();
        return response()->json(null, 204);
    }
    
}