<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Message>
 */
class MessageFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'sender_id' => \App\Models\User::factory(),
            'receiver_id' => \App\Models\User::factory(),
            'conversation_id' => \App\Models\Conversation::factory(),
            'content' => $this->faker->paragraph,
            'status' => $this->faker->randomElement(['sent', 'delivered', 'seen']),
            'type' => $this->faker->randomElement(['text', 'image', 'file']),
        ];
    }
}
