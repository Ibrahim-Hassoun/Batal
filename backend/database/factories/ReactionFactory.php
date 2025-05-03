<?php

namespace Database\Factories;

use App\Models\User;
use App\Models\Post;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Reaction>
 */
class ReactionFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'user_id' => User::factory()->create()->id,
            'post_id' => Post::factory()->create()->id,
            'type' => $this->faker->randomElement(['like', 'love', 'fire', 'angry']),
            'country' => $this->faker->optional()->country(),
            'province' => $this->faker->optional()->state(),
            'city' => $this->faker->optional()->city(),
            
            
        ];
    }
}
