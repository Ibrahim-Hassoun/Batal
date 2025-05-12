<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Traits\HttpResponseTrait;
use App\Services\PostServices\PostServices;
use App\Services\PostServices\ReactionServices;
use App\Http\Requests\PostRequests\AddPostRequest;
use App\Http\Requests\PostRequests\UpdatePostRequest;
use App\Http\Requests\PostRequests\AddReactionRequest;
use App\Http\Requests\PostRequests\PostManipulationAuthorizationRequest;

class PostController extends Controller
{
    use HttpResponseTrait;
    protected $postServices;
    protected $reactionServices;

    public function __construct(PostServices $postServices,ReactionServices $reactionServices)
    {
        $this->postServices = $postServices;
        $this->reactionServices = $reactionServices;
    }


    public function addPost(AddPostRequest $request)
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

    public function deletePost(PostManipulationAuthorizationRequest $request)
    {
        try{
            $post = $this->postServices->deletePost($request->input('id'));
            return $this->respond(true,'Post deleted successfully',$post,200);
        }catch(\Exception $e){
            return $this->respond(false, $e->getMessage(), null, $e->getCode() ?: 500);
        }
    }

    public function updatePost(UpdatePostRequest $request)
    {
        try{
            $post = $this->postServices->updatePost($request->all());
            return $this->respond(true,'Post updated successfully',$post,200);
        }catch(\Exception $e){
            return $this->respond(false, $e->getMessage(), null, $e->getCode() ?: 500);
        }
    }
    
    public function addReaction(AddReactionRequest $request)
    {
        try{
            $reaction=$this->reactionServices->addReaction($request);
            return $this->respond(true,"reaction added successfully",$reaction,200);
        }catch(\Exception $e){
            return $this->respond(false,$e->getMessage(),null,400);
        }
    }

    public function deleteReaction(Request $request)
    {
        try{
            $reaction = $this->reactionServices->deleteReaction($request);
            return $this->respond(true,"Reaction deleted successfully",$reaction,200);
        }catch(\Exception $e){
            return $this->respond(false, $e->getMessage(), null, $e->getCode() ?: 500);
        }
    }
    
    public function updateReaction(Request $request)
    {
        try{
            $reaction = $this->reactionServices->updateReaction($request);
            return $this->respond(true,"Reaction updated successfully",$reaction,200);
        }catch(\Exception $e){
            return $this->respond(false, $e->getMessage(), null, $e->getCode() ?: 500);
        }
    }

    public function getFollowingsPosts(Request $request)
    {
        try{
            $reaction = $this->feedServices->getFollowingsPosts($request);
            return $this->respond(true,"Following posts fetched successfully",$reaction,200);
        }catch(\Exception $e){
            return $this->respond(false, $e->getMessage(), null, $e->getCode() ?: 500);
        } 
    }
}
