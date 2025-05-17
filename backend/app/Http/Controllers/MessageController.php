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

    public function getConversationMessages(Request $request)
    {
        
    }
}
