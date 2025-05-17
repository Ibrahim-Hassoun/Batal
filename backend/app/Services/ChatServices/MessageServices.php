<?php

namespace App\Services\ChatServices;

use App\Models\User;
use App\Models\Message;
use App\Models\Conversation;

class MessageServices
{
    public function storeMessage($request)
    {
        $message = Message::create([
            'sender_id'=>$request->sender_id,
            'receiver_id'=>$request->receiver_id,
            'conversation_id' => $request->conversation_id,
            'content' => $request->content,
            'status' => $request->status
        ]);

        if(!$message){
            throw new \Exception('Failed to store message', 500);
        }

        return $message;
    }
    
}