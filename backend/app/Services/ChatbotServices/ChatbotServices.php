<?php 

namespace App\Services\ChatbotServices;

use App\Models\User;
use Prism\Prism\Prism;
use App\Entities\PrismHelper;
use App\Models\ChatbotSession;
use App\Models\ChatbotMessage;
use Prism\Prism\Enums\Provider;
use Prism\Prism\Schema\ObjectSchema;
use Prism\Prism\Schema\EnumSchema;
use Prism\Prism\Schema\ArraySchema;

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
        



$chunkSelectorSchema = new ObjectSchema(
    name: 'chunk_selector',
    description: 'Schema for selecting relevant context chunks',
    properties: [
        new ArraySchema(
            name: 'selected_chunks',
            description: 'Most relevant user info chunks for this question',
            items: new EnumSchema(
                name: 'chunk_item',
                description: 'Individual chunk selection',
                options: [
                    'id',
                    'username',
                    'phone_number',
                    'bio',
                    'profile_photo_path',
                    'first_name',
                    'last_name',
                    'is_completed',
                    'completed_at',
                    'is_verified',
                    'verified_at',
                    'email',
                    'email_verified_at',
                    'password',
                    'date_of_birth',
                    'location_of_birth',
                    'role',
                    'country',
                    'province',
                    'city',
                    'street',
                    'followers_count',
                    'following_count',
                    'gym_location',
                    'streak',
                    'coins',
                    'sets',
                    'current_xp',
                    'total_xp',
                    'trophies_count',
                    'last_login_at',
                    'last_login_ip',
                    
                    'fitness_level',
                    'fitness_goal',
                    'fitness_interests',
                    'injuries',
                    'medical_conditions',
                    'allergies',
                    'dietary_preferences',
                    'dietary_restrictions',
                    'fitness_equipment',
                    'fitness_experience'
                ]
            )
        )
    ],
    requiredFields: ['selected_chunks']
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
}