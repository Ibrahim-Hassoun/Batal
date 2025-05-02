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
    public function searchPost($request)
    {
        $query=Post::query();

        if($request->query('id')){
            $query->where('id', $request->query('id'));
        }
        if($request->query('user_id')){
            $query->where('user_id', $request->query('user_id'));
        }
        if($request->query('description')){
            $query->where('name', 'like', '%' . $request->query('name') . '%');
        }

        $results=$query->get();

        if(!$results){
            throw new \Exception('Post not found', 404);
        }
        return $results;
    }
    public function deletePost($data)
    {
        $post = Post::find($data);
        if(!$post){
            throw new \Exception('Post not found', 404);
        }
        $post->delete();
        return $post;
    }

    public function updatePost($data)
    {
        $post = Post::find($data['id']);
        if(!$post){
            throw new \Exception('Post not found', 404);
        }
        $post->update([
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
        return $post;
    }
    


}