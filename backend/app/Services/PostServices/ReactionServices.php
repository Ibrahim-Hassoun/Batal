<?php

namespace App\Services\PostServices;

use App\Models\Reaction;
use Illuminate\Support\Facades\Http;


class ReactionServices
{
    

    public function addReaction($payload)
    {
        $ip = request()->ip(); // or use a specific IP

        $response = Http::get("https://ipapi.co/178.135.15.202/json/");
        $location = $response->json();

        $reaction=Reaction::create([
            'user_id' => auth()->user()->id,
            'post_id' => $payload['post_id']??null,
            'type'=> $payload['type']??null,
            'country'=> $location['country']??null,
            'province'=> $location['region']??null,
            'city'=> $location['city']??null,
        ]);
        if(!$reaction){
            throw new Exception("couldn't add reaction",400);
        }
        return $reaction;
    }
}