<?php

namespace Tests\Feature;

use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class AuthTest extends TestCase
{
    use RefreshDatabase, WithFaker;
    /**
     * A basic feature test example.
     */
    public function testRegister(): void
    {
        $user = User::factory()->make();

        $response = $this->post('/api/v0.1/register', [
            "first_name"=>"ibrahim",
            "last_name"=>"hassoun",
            "username"=>"ihassounfa",
            "date_of_birth"=>"2025-04-30",
            "email"=>"ihassoun73f@gmail.com",
            "password"=>"12345678",
            "password_confirmation"=>"12345678"
            
        ]);

        $response->assertStatus(201);
    }

    public function testLogin():void
    {
        $response = $this->post('/api/v0.1/register', [
            "first_name"=>"ibrahim",
            "last_name"=>"hassoun",
            "username"=>"ihassounfa",
            "date_of_birth"=>"2025-04-30",
            "email"=>"ihassoun73@gmail.com",
            "password"=>"12345678",
            "password_confirmation"=>"12345678"
            
        ]);

        $response = $this->post('/api/v0.1/login',[
            "email"=>"ihassoun73@gmail.com",
            "password"=>"12345678"
        ]);
        $response->assertStatus(200);
    }
}
