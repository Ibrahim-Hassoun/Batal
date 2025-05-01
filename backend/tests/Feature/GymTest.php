<?php

namespace Tests\Feature;

use Tests\TestCase;
use App\Models\Gym;
use App\Models\User;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Foundation\Testing\RefreshDatabase;


class GymTest extends TestCase
{
    use RefreshDatabase, WithFaker;
    /**
     * A basic feature test example.
     */
    public function testAddGym(): void
    {
        $user = User::factory()->make();

        $response = $this->post('/api/v0.1/register', [
            "first_name" => "ibrahim",
            "last_name" => "hassoun",
            "username" => "ihassouns",
            "date_of_birth" => "2025-04-30",
            "email" => "ihassoun567@gmail.com",
            "password" => "12345678",
            "password_confirmation" => "12345678"
        ]);

        $response->assertStatus(201);
        $token = $response->json('data.token');
        

        $ownerId = User::where('email', 'ihassoun567@gmail.com')->first()->id;
        $data = [
            "owner_id" => $ownerId,
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

        $response->assertStatus(201);
    }

    public function testGetGym()
    {
        $user = User::factory()->make();

        $response = $this->post('/api/v0.1/register', [
            "first_name" => "ibrahim",
            "last_name" => "hassoun",
            "username" => "ihassouns",
            "date_of_birth" => "2025-04-30",
            "email" => "ihassoun567@gmail.com",
            "password" => "12345678",
            "password_confirmation" => "12345678"
        ]);

        $response->assertStatus(201);
        $token = $response->json('data.token');
        

        $ownerId = User::where('email', 'ihassoun567@gmail.com')->first()->id;
        $data = [
            "owner_id" => $ownerId,
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


        
        $response->assertStatus(201);

        $response = $this->withHeader('Authorization', 'Bearer ' . $token)
                 ->get('/api/v0.1/gyms/search?name=Titan Gym' . $response->json('data.id'));
        $response->assertStatus(200);
    }
}
