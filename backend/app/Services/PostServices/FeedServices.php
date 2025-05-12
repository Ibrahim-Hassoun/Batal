<?php

namespace App\Services\PostServices;

use App\Models\Post;


class FeedServices {

    public function getFollowingsPosts($request)
    {
        $followingIds = auth()->user()->followings()->where('status', 'accepted')->pluck('followed_id');

        $posts = Post::with(['user:id,first_name,last_name'])->whereIn('user_id', $followingIds)->latest()->paginate(10);
        
        return $posts;
    }

}