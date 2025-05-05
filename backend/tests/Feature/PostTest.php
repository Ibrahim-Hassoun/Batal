<?php

namespace Tests\Feature;

use Tests\TestCase;
use App\Models\User;
use App\Traits\TestHelpersTrait;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Foundation\Testing\RefreshDatabase;


class PostTest extends TestCase
{
    use RefreshDatabase, WithFaker,TestHelpersTrait;
    
    
    /**
     * A basic feature test example.
     */
    public function testAddPost(): void
    {
        
        $token = $this->addUserAndGetToken();
        $response = $this->addPost($token);

        $response->assertStatus(201);
    }

    public function testSearchPost():void
    {
        $token = $this->addUserAndGetToken();
        $response1 = $this->addPost($token);

        $response = $this->withHeader('Authorization', 'Bearer ' . $token)
                        ->get('/api/v0.1/posts/search?description=test');

        $response->assertStatus(200);
    }

    public function testDeletePost():void
    {
        $token = $this->addUserAndGetToken();
        $post = $this->addPost($token);

        $data = ["id"=>$post->json('data.id')];
        $response = $this->withHeader('Authorization', 'Bearer ' . $token)
                        ->delete('/api/v0.1/posts/delete',$data);

        $response->assertStatus(200);
    }

    public function testUpdatePost():void
    {
        $token = $this->addUserAndGetToken();
        $post = $this->addPost($token);

        $data = [
            "id"=>$post->json('data.id'),
            'description' => 'updated description',
            'image_path' => 'https://example.com/images/updated_post123.jpg',
            'reactions' => 10,
            'comments' => 5,
            'shares' => 3,
            'impressions_count' => 100,
            'followers_brought' => 20,
            'profile_visits' => 15,
            'reach' => 50,
            'scheduled_at' => '2030-06-30T15:30:00',
        ];

        $response = $this->withHeader('Authorization', 'Bearer ' . $token)
                        ->post('/api/v0.1/posts/update',$data);

        $response->assertStatus(200);
    }

  


}
