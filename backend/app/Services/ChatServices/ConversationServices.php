<?php

namespace App\Services\ChatServices;

use App\Models\User;
use App\Models\Message;
use App\Models\Conversation;

class ConversationServices
{
    public function getUserConversations()
    {
        $userId = auth()->id(); 

        $conversations = Conversation::where('user1_id', $userId)
            ->orWhere('user2_id', $userId)
            ->with(['latestMessage'])
            ->orderByDesc(
                Message::select('created_at')
                    ->whereColumn('conversation_id', 'conversations.id')
                    ->latest()
                    ->limit(1)
            )
            ->paginate(15);

    
        $conversations->getCollection()->transform(function ($conversation) use ($userId) {
            $conversation->otherUserId = $userId == $conversation->user1_id
                ? $conversation->user2_id
                : $conversation->user1_id;

            $conversation->otherUser = User::where('id', $conversation->otherUserId)
                ->select('first_name', 'last_name', 'profile_photo_path')
                ->first();

            return $conversation;
        });

        return response()->json($conversations);
    }

    public function getConversationMessages($conversation_id)
    {
        $messages = Conversation::find($conversation_id)
            ->messages()
            ->orderBy('created_at', 'desc')
            ->paginate(15);
        if(!$messages){
            throw new \Exception('unable to retrieve messages',404);
        }
        return $messages;
    }
    
}