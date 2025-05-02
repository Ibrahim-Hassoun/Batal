<?php

namespace Tests\Feature;

use Tests\TestCase;
use App\Models\Gym;
use App\Models\User;
use App\Traits\TestHelpersTrait;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Foundation\Testing\RefreshDatabase;


class GymTest extends TestCase
{
    use RefreshDatabase, WithFaker,TestHelpersTrait;
    /**
     * A basic feature test example.
     */
    
    public function testAddGym(): void
    {
        $user = User::factory()->make();
        $token = $this->addUserAndGetToken();
        $owner_id = User::where('email', 'ihassoun567@gmail.com')->first()->id;

        $response=$this->addGym($token, $owner_id);
        $response->assertStatus(201);
        
    }

    public function testGetGym()
    {
        $user = User::factory()->make();
        $token = $this->addUserAndGetToken();
        $owner_id = User::where('email', 'ihassoun567@gmail.com')->first()->id;
        $this->addGym($token, $owner_id);

        $response = $this->withHeader('Authorization', 'Bearer ' . $token)
                 ->get('/api/v0.1/gyms/search?name=Titan Gym');
        $response->assertStatus(200);
    }

    public function testDeleteGym()
    {
        $user = User::factory()->make();
        $token = $this->addUserAndGetToken();
        $owner_id = User::where('email', 'ihassoun567@gmail.com')->first()->id;
        $gym = $this->addGym($token, $owner_id);

        $response = $this->withHeader('Authorization', 'Bearer ' . $token)
                 ->delete('/api/v0.1/gyms/delete', ['id' => $gym->json('data.id')]);
        $response->assertStatus(200);
    }

    public function testUpdateGym()
    {
        $user = User::factory()->make();
        $token = $this->addUserAndGetToken();
        $owner_id = User::where('email', 'ihassoun567@gmail.com')->first()->id;
        $gym = $this->addGym($token, $owner_id);

        $response = $this->withHeader('Authorization', 'Bearer ' . $token)
                 ->post('/api/v0.1/gyms/update', $gym->json('data'));
        $response->assertStatus(200);
    }

    
}
