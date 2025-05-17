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
            ->with([
                'latestMessage',
                'userOne:id,name,profile_image_url',
                'userTwo:id,name,profile_image_url'
            ])
            ->orderByDesc(
                Message::select('created_at')
                    ->whereColumn('conversation_id', 'conversations.id')
                    ->latest()
                    ->limit(1)
            )
            ->limit(15)
            ->get()
            ->map(function ($conversation) use ($userId) {
                
                $otherUser = $conversation->user_one_id == $userId
                    ? $conversation->userTwo
                    : $conversation->userOne;

                return [
                    'conversation_id' => $conversation->id,
                    'last_message' => $conversation->latestMessage->body ?? null,
                    'last_message_time' => $conversation->latestMessage->created_at ?? null,
                    'other_user' => [
                        'id' => $otherUser->id,
                        'name' => $otherUser->name,
                        'profile_image_url' => $otherUser->profile_image_url,
                    ]
                ];
            });

        return response()->json($conversations);
    }

    
}