<?php

namespace Database\Factories;

use App\Models\User;
use App\Models\Post;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Post>
 */
class PostFactory extends Factory
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
            'description' => $this->faker->optional()->sentence(),
            'image_path' => $this->faker->optional()->imageUrl(),
            'reactions' => $this->faker->numberBetween(0, 1000),
            'comments' => $this->faker->numberBetween(0, 500),
            'shares' => $this->faker->numberBetween(0, 300),
            'impressions_count' => $this->faker->numberBetween(0, 10000),
            'followers_brought' => $this->faker->numberBetween(0, 200),
            'profile_visits' => $this->faker->numberBetween(0, 1000),
            'reach' => $this->faker->numberBetween(0, 15000),
            'scheduled_at' => $this->faker->optional()->dateTimeBetween('-1 week', '+1 week'),
            'deleted_at' => null,
            'created_at' => now(),
            'updated_at' => now(),
        ];
    }
}
