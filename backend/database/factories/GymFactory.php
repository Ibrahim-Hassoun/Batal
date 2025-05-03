<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Facades\DB;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Gym>
 */
class GymFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            
            'owner_id' => \App\Models\User::factory()->create()->id,
            'name' => $this->faker->company,
            'description' => $this->faker->text(200),
            'logo_path' => $this->faker->imageUrl(),
            'estimated_capacity' => $this->faker->numberBetween(50, 500),
            'subscription_price' => $this->faker->numberBetween(100, 1000),
            'current_traffic' => $this->faker->randomElement(['low', 'medium', 'high']),
            'usual_traffic' => $this->faker->randomElement(['low', 'medium', 'high']),
            'opening_hours' => json_encode([
                'Monday' => ['09:00', '21:00'],
                'Tuesday' => ['09:00', '21:00'],
                'Wednesday' => ['09:00', '21:00'],
                'Thursday' => ['09:00', '21:00'],
                'Friday' => ['09:00', '21:00'],
                'Saturday' => ['10:00', '18:00'],
                'Sunday' => ['10:00', '18:00'],
        ]),
            'gender' => $this->faker->randomElement(['male', 'female', 'mixed']),
            'longitude' => $this->faker->longitude,
            'latitude' => $this->faker->latitude,
            'phone_number' => $this->faker->phoneNumber,
            'email' => $this->faker->unique()->safeEmail,
            'website' => $this->faker->url,
            'is_active' => $this->faker->boolean,
            'created_at' => now(),
            'updated_at' => now(),
            'deleted_at' => null,

    ];
}
}
