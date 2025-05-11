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
class ChatbotServices
{
    public function sendMessage($request)
    {   
        //extract user id from request
        $userId = $request->user()->id;
        $user = User::find($userId);
        $session = $this->getSession($userId);

        $chunkSelectorSchema = PrismHelper::buildSchema( 
            'chunk_selector',
            'Schema for selecting relevant context chunks',
        [
            new ArraySchema(
                name: 'selected_chunks',
                description: 'Most relevant user info chunks for this question',
                items: new EnumSchema(
                    name: 'chunk_item',
                    description: 'Individual chunk selection',
                    options: 
                       ChunkSelectors::getUserChunks()
                    )
                )
            ],
            ['selected_chunks']
        );


        $prompt = "The user asked: '{$request->prompt}'\n" .
                  "From the list of available data, select only the ones most relevant to answering this question.";


        $response = Prism::structured()
        ->using(Provider::OpenAI, 'gpt-4o')
        ->withSchema($chunkSelectorSchema)
        ->withPrompt($prompt)
        ->asStructured();

        $selectedChunks = $response->structured['selected_chunks'];
        $contextData = [];

        foreach ($selectedChunks as $key) {
            $value = $user->$key;
            if (!empty($value)) {
                $contextData[$key] = $value;
            }
        }
        $contextText = '';
        foreach ($contextData as $key => $value) {
            $contextText .= ucfirst(str_replace('_', ' ', $key)) . ': ' . $value . "\n";
        }

        $finalPrompt = "User info:\n$contextText\n\nUser question:\n" . $request->prompt . "\n\n" ;
        
        $response = Prism::text()
        ->using(Provider::OpenAI, 'gpt-4o')
        ->withSystemPrompt('You are a helpful assistant. "Answer the question based on the user info provided. If the information is not available, say I do not know.')
        ->withPrompt($finalPrompt)
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


        return ['response'=>$response->text];
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