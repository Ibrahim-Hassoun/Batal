<?php

namespace App\Services\PostServices;

use App\Models\Post;

class PostServices {

    public function addPost($data)
    {
        $post = Post::create([
            'user_id' => $data['user_id'],
            'description' => $data['description'],
            'image_path' => $data['image_path'],
            'reactions' => $data['reactions'],
            'comments' => $data['comments'],
            'shares' => $data['shares'],
            'impressions_count' => $data['impressions_count'],
            'followers_brought' => $data['followers_brought'],
            'profile_visits' => $data['profile_visits'],
            'reach' => $data['reach'],
            'scheduled_at' => $data['scheduled_at'],
        ]);
        if(!$post){
            throw new \Exception('Post not created', 500);
        }
        return $post;
    }
    public function getPost($data)
    {

    }
    public function deletePost($data)
    {

    }
    public function updatePost($data)
    {

    }
    


}