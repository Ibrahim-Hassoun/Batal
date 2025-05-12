<?php

namespace App\Services\PostServices;

use App\Models\Post;


class PostServices {

    public function getFollowingsPosts($request)
    {
        $followingIds = auth()->user()->followings()->where('status', 'accepted')->pluck('followed_id');

        Post::whereIn('user_id', $followingIds)->latest()->paginate(10);

    }

}