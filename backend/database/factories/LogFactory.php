<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Log>
 */
class LogFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'id'=>fake()>unique()->uuid(),
            'user_id' => \App\Models\User::factory(),
            'ip_address' => fake()->ipv4(),
            'action' =>fake()->randomElement(['login','logout','register']),
            'success' => fake()->boolean(),
            'country' => fake()->country(),
            'province' => fake()->state(),
            'city' => fake()->city(),
            'street' => fake()->streetAddress(),
            'created_at' => now(),
            'updated_at' => now(),
            

        ];
    }
}
