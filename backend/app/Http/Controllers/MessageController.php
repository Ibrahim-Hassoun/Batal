<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Traits\HttpResponseTrait;
use App\Services\ChatServices\MessageServices;


class MessageController extends Controller
{
    use HttpResponseTrait;
    protected $messageServices;

    public function __construct(MessageServices $messageServices)
    {
        $this->messageServices = $messageServices;
    }

    public function getConversationMessages($conversation_id,Request $request)
    {
         try{
            $messages = $this->messageServices->getConversationMessages($conversation_id);
            return $this->respond(true,'Convos retrieved successfully',$messages,201);

        }catch(\Exception $e){
            return $this->respond(false,$e->getMessage(),null,500);
        }
    }
}
