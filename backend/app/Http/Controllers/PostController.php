<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Services\PostServices\PostServices;

class PostController extends Controller
{
    protected $postServices;

    public function _construct(PostServices $postServices)
    {
        $this->postServices = $postServices;
    }

    public function addPost(Request $request)
    {
        
    }
    public function getPost(Request $request)
    {
        
    }
    public function deletePost(Request $request)
    {
        
    }
    public function updatePost(Request $request)
    {
        
    }
    
}
