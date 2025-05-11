<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Traits\HttpResponseTrait;
use App\Services\ChatbotServices\ChatbotServices;

class ChatbotController extends Controller
{
    use HttpResponseTrait;
    use ChatbotServices;

    public function __construct(ChatbotServices $chatbotServices)
    {
        $this->chatbotServices = $chatbotServices;
    }

    public function sendMessage(Request $request)
    {
        try{
            $message = $this->chatbotServices->sendMessage($request);
            return $this->respond(true,'Message sent successfully',$message,201);

        }catch(\Exception $e){
            return $this->respond(false,$e->getMessage(),null,500);
        }
    }
}
