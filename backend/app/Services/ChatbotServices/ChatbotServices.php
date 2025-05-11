<?php 

namespace App\Services\ChatbotServices;

use App\Models\User;
use Prism\Prism\Prism;
use App\Models\ChatbotSession;
use App\Models\ChatbotMessage;
use Prism\Prism\Enums\Provider;


class ChatbotServices
{
    public function sendMessage($request)
    {   
        //extract user id from request
        $userId = $request->user()->id;
        $user = User::find($userId);
        if (!$user) {
            throw new \Exception('User not found');
        }
        //check if user has a session and if not create one
        $sessionId = $request->chatbotSession->id;
        if (!$sessionId) {
            $sessionId=ChatbotSession::create([
                'user_id' => $userId,
            ])->id;

        }
        //get messages belonging to the session
        $messages = ChatbotMessage::find( $sessionId)->ChatbotMessages();

        
        $response = Prism::text()
        ->using(Provider::OpenAI, 'gpt-4')
        ->withSystemPrompt('You are a helpful assistant. Respond only to gym related queries,Make your responses short and concise.')
        ->withPrompt($request->prompt)
        ->asText();

        return $response->text;
    }
}