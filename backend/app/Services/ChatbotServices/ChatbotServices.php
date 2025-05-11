<?php 

namespace App\Services\ChatbotServices\ChatbotServices;

use Prism\Prism\Prism;
use Prism\Prism\Enums\Provider;


class ChatbotServices
{
    public function sendMessage($request)
    {
        $response = Prism::text()
        ->using(Provider::Anthropic, 'claude-3-5-sonnet-20241022')
        ->withPrompt('Tell me a short story about a brave knight.')
        ->asText();

        return $response;
    }
}