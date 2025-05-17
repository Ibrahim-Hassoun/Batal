<?php

namespace App\Services\ChatServices;

use App\Models\User;
use App\Models\Message;
use App\Models\Conversation;

class MessageServices
{
 
    public function getConversationMessages($conversation_id)
    {
        $messages = Conversation::find($conversation_id)->messages;
        if(!$messages){
            throw new \Exception('unable to retrieve messages',404);
        }
        return $messages;
    }

    public function storeConversationMessage()
    {
        
    }
    
}