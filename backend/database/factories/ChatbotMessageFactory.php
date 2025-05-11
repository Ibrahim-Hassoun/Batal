<?php

namespace Database\Factories;

use App\Models\ChatbotSession;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\ChatbotMessage>
 */
class ChatbotMessageFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'chatbot_session_id' => ChatbotSession::factory()->create()->id, 
            'role' => $this->faker->randomElement(['user', 'assistant']), 
            'content' => $this->faker->text(), 
            'meta' => $this->faker->optional()->randomElement([null, json_encode(['token_usage' => rand(100, 500)])]),
            'created_at' => now(),
            'updated_at' => now(),
        ];
    }
}
