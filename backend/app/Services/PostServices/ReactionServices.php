<?php

namespace App\Services\PostServices;

use App\Models\Reaction;

class ReactionServices
{
    public function addReaction($payload)
    {
        $reaction=Reaction::create([
            'user_id' => auth()->user()->id,
            'post_id' => $payload['post_id'],
            'type'=> $payload['type'],
            'country'=> $payload['country'],
            'province'=> $payload['province'],
            'city'=> $payload['city'],
        ]);
        if(!$reaction){
            throw new Exception("couldn't add reaction",400);
        }
        return $reaction;
    }
}