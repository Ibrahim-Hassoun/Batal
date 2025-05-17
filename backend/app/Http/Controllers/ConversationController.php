<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Traits\HttpResponseTrait;


class ConversationController extends Controller
{
    use HttpResponseTrait;
    protected $conversationServices;

    public function __construct(ConversationServices $conversationServices)
    {
        $this->conversationServices = $conversationServices;
    }

    public function getUserConversations(Request $request){
        
        try{
            $post = $this->conversationServices->getUserConversations($request);
            return $this->respond(true,'Convos retrieved successfully',$post,201);

        }catch(\Exception $e){
            return $this->respond(false,$e->getMessage(),null,500);
        }
    
    }
}
