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
        ->withPrompt('Tell me a short story about a brave knight.')
        ->asText();

        return $response->text;
    }
}