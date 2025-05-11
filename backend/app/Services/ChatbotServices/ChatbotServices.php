<?php 

namespace App\Services\ChatbotServices;

use App\Models\User;
use Prism\Prism\Prism;
use App\Prism\PrismHelper;
use App\Models\ChatbotSession;
use App\Models\ChatbotMessage;
use Prism\Prism\Enums\Provider;
use Prism\Prism\Schema\ObjectSchema;
use Prism\Prism\Schema\EnumSchema;
use Prism\Prism\Schema\ArraySchema;
use App\Prism\ChunkSelectors\ChunkSelectors;
use App\Prism\ContextBuilder\ContextBuilder;

class ChatbotServices
{
    public function sendMessage($request)
    {   
        
        $userId = $request->user()->id;
        $session = $this->getSession($userId);
        $sent = ChatbotMessage::create([
            'chatbot_session_id' => $session->id,
            'role' => 'user',
            'content' => $request->prompt,
        ]);
        if(!$sent){
            throw new \Exception('Error in saving the message to the database', 500);
        }

        $received = $this->sendToModel($request, $userId);
        
        $message = ChatbotMessage::create([
            'chatbot_session_id' => $session->id,
            'role' => 'assistant',
            'content' => $received->text,
        ]);


        return $received->text;
    }

    private function sendToModel($request, $userId){
       
        $selectedChunks = PrismHelper::decideChunks('users', $request->prompt);
        $rawRow = User::find($userId);

        $finalContextText = ContextBuilder::buildContext($rawRow, $selectedChunks);

        $finalPrompt = "User info:\n$finalContextText\n\nUser question:\n" . $request->prompt . "\n\n" ;
        
        $response = Prism::text()
        ->using(Provider::OpenAI, 'gpt-4o')
        ->withSystemPrompt('You are a helpful assistant. "Answer the question based on the user info provided. If the information is not available, say I do not know.')
        ->withPrompt($finalPrompt)
        ->asText();
        if(!$response){
            throw new \Exception('Error in getting response from the chatbot', 500);
        }
        return $response;
    }

    private function getSession($userId)
    {
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
        return $session;
    }
}