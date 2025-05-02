<?php

namespace App\Traits;

trait TestHelpersTrait
{
    public function addUserAndGetToken()
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

    public function addPost($token)
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

    public function addGym($token, $owner_id)
    {
        $data = [
            "owner_id" => $owner_id,
            "name" => "Titan Gym",
            "description" => "A modern fitness center with state-of-the-art equipment and professional trainers.",
            "logo_path" => "images/logos/titan_gym.png",
            "estimated_capacity" => 150,
            "subscription_price" => 45.99,
            "current_traffic" => "medium",
            "usual_traffic" => "medium",
            "opening_hours" => "{\"Monday\":[\"09:00\",\"21:00\"],\"Tuesday\":[\"09:00\",\"21:00\"],\"Wednesday\":[\"09:00\",\"21:00\"],\"Thursday\":[\"09:00\",\"21:00\"],\"Friday\":[\"09:00\",\"21:00\"],\"Saturday\":[\"10:00\",\"18:00\"],\"Sunday\":[\"10:00\",\"18:00\"]}",
            "gender" => "mixed",
            "latitude" => 33.8938,
            "longitude" => 35.5018,
            "phone_number" => "+96112345678",
            "email" => "info@titangym.com",
            "website" => "https://www.titangym.com",
            "is_active" => true,
        ];
        $response = $this->withHeader('Authorization', 'Bearer ' . $token)
                 ->post('/api/v0.1/gyms/add', $data);

        return $response;
    }
}
