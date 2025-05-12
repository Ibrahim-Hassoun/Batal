<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Traits\HttpResponseTrait;
use App\Services\ChatbotServices\ChatbotServices;

class ChatbotController extends Controller
{
    use HttpResponseTrait;
    protected $chatbotService;

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

    public function getMessages(Request $request)
    {
        try{
            $messages = $this->chatbotServices->getMessages($request);
            return $this->respond(true,'Messages retrieved successfully',$messages,200);

        }catch(\Exception $e){
            return $this->respond(false,$e->getMessage(),null,500);
        }
    }
}
