<?php

namespace App\Services\PostServices;

use App\Models\Post;


class FeedServices {

    public function getFollowingsPosts($request)
    {
        $followingIds = auth()->user()->followings()->where('status', 'accepted')->pluck('followed_id');
        if(!$followingIds){
            throw new \Exception('No followings found.',500);
        }
        $posts = Post::with(['user:id,first_name,last_name'])->whereIn('user_id', $followingIds)->latest()->paginate(10);

        if (!$posts) {
            throw new \Exception('No posts found for followings.', 404);
        }
        
        return $posts;
    }

    public function getTrendingPosts($request)
    {
        $posts = Post::orderByDesc(DB::raw('likes_count * 1 + comments_count * 2 + shares_count * 3'))
                ->orderByDesc('created_at')
                ->take(10)
                ->get();

    }
}