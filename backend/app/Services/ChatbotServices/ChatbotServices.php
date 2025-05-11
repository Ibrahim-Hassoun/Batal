<?php 

namespace App\Services\ChatbotServices;

use Prism\Prism\Prism;
use Prism\Prism\Enums\Provider;


class ChatbotServices
{
    public function sendMessage($request)
    {   
        $response = Prism::text()
        ->using(Provider::OpenAI, 'gpt-4')
        ->withSystemPrompt('You are a helpful assistant. Respond only to gym related queries,Make your responses short and concise.')
        ->withPrompt($request->prompt)
        ->asText();

        return $response->text;
    }
}