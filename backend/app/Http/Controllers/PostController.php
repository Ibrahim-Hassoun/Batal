<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Traits\HttpResponseTrait;
use App\Services\PostServices\PostServices;

class PostController extends Controller
{
    use HttpResponseTrait;
    protected $postServices;

    public function __construct(PostServices $postServices)
    {
        $this->postServices = $postServices;
    }


    public function addPost(Request $request)
    {
        try{
            $post = $this->postServices->addPost($request->all());
            return $this->respond(true,'Post added successfully',$post,201);

        }catch(\Exception $e){
            return $this->respond(false,$e->getMessage(),null,$e->getCode());
        }
    }

    public function searchPost(Request $request)
    {
        try{
            $posts = $this->postServices->searchPost($request);
            return $this->respond(true,'Post retrieved successfully',$posts,200);
        }catch(\Exception $e){
            return $this->respond(false, $e->getMessage(), null, $e->getCode() ?: 500);
        }
    }

    public function deletePost(Request $request)
    {
        
    }
    public function updatePost(Request $request)
    {
        
    }
    
}
