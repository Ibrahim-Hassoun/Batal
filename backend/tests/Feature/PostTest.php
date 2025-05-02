<?php

namespace Tests\Feature;

use Tests\TestCase;
use App\Models\User;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Foundation\Testing\RefreshDatabase;


class PostTest extends TestCase
{
    use RefreshDatabase, WithFaker;
    
    private function addUserAndGetToken()
    {
        $response = $this->post('/api/v0.1/register', [
            "first_name" => "ibrahim",
            "last_name" => "hassoun",
            "username" => "ihassouns",
            "date_of_birth" => "2025-04-30",
            "email" => "ihassoun567@gmail.com",
            "password" => "12345678",
            "password_confirmation" => "12345678"
        ]);

        
        return $response->json('data.token');
    }

    private function addPost($token)
    {
        $data = [
            
            "description"=>"test",
            "image_path"=> "https://example.com/images/post123.jpg",
            "scheduled_at"=> "2025-05-03T15:30:00",
        ];
        $response = $this->withHeader('Authorization', 'Bearer ' . $token)
                 ->post('/api/v0.1/posts/add', $data);

        return $response;
    }
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
}
