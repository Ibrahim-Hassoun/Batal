<?php

namespace App\Services\ChatServices;

use App\Models\User;
use App\Models\Message;
use App\Models\Conversation;

class MessageServices
{
    public function storeMessage($request)
    {
        //retrieve conversation or create one if it doesnt
        $conversation = Conversation::where(function ($query) use ($request) {
            $query->where('user1_id', auth()->user()->id)
                  ->where('user2_id', $request->receiver_id);
        })->orWhere(function ($query) use ($request) {
            $query->where('user1_id', $request->receiver_id)
                  ->where('user2_id', auth()->user()->id);
        })->first();

        if (!$conversation) {
            $conversation = Conversation::create([
                'user1_id' => auth()->user()->id,
                'user2_id' => $request->receiver_id,
            ]);
        }

        $request->conversation_id = $conversation->id;
        $message = Message::create([
            'sender_id'=>auth()->user()->id,
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