<?php

namespace App\Services\PostServices;

use App\Traits\IpApi;
use App\Models\Reaction;


class ReactionServices
{
    use IpApi;

    public function addReaction($request)
    {
        $location = $this->getLocation($request->ip());

        $reaction=Reaction::create([
            'user_id' => auth()->user()->id,
            'post_id' => $request['post_id']??null,
            'type'=> $request['type']??null,
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