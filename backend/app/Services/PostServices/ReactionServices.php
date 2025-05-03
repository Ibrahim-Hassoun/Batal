<?php

namespace App\Services\PostServices;

use App\Models\Reaction;

class ReactionServices
{
    public function addReaction($payload)
    {
        $reaction=Reaction::create([
            'user_id' => auth()->user()->id,
            'post_id' => $payload['post_id']??null,
            'type'=> $payload['type']??null,
            'country'=> $payload['country']??null,
            'province'=> $payload['province']??null,
            'city'=> $payload['city']??null,
        ]);
        if(!$reaction){
            throw new Exception("couldn't add reaction",400);
        }
        return $reaction;
    }
}