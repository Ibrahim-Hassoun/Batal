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
            throw new \Exception('User not found', 404);
        }
        //check if user has a session and if not create one
        $session = $user->chatbotSession;
        if (!$session) {
            $session=ChatbotSession::create([
                'user_id' => $userId,
            ]);

        }
        
        //get messages belonging to the session
        $messages = $session->chatbotMessages;

        
        $response = Prism::text()
        ->using(Provider::OpenAI, 'gpt-4')
        ->withSystemPrompt('You are a helpful assistant. Respond only to gym related queries,Make your responses short and concise.')
        ->withPrompt($request->prompt)
        ->asText();
        if(!$response){
            throw new \Exception('Error in getting response from the chatbot', 500);
        }
        //save the messages to the database
        $message = ChatbotMessage::create([
            'chatbot_session_id' => $session->id,
            'role' => 'user',
            'content' => $request->prompt,
        ]);
        $message = ChatbotMessage::create([
            'chatbot_session_id' => $session->id,
            'role' => 'assistant',
            'content' => $response->text,
        ]);


        return ["response"=>$response->text, 'session'=>$session];
    }
}