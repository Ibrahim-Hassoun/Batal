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

    public function storeMessage(Request $request)
    {
         try{
            $leaderboard = $this->messageServices->storeMessage($request);
            return $this->respond(true,'Message stored successfully',$leaderboard,200);

        }catch(\Exception $e){
            return $this->respond(false,$e->getMessage(),null,500);
        }
    }
}
