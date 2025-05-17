<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ConversationController extends Controller
{
    public function getUserConversations(Request $request){
        
        try{
            $post = $this->conversationServices->getUserConversations($request);
            return $this->respond(true,'Convos retrieved successfully',$post,201);

        }catch(\Exception $e){
            return $this->respond(false,$e->getMessage(),null,500);
        }
    
    }
}
