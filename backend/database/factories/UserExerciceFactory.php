<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\UserExercice>
 */
class UserExerciceFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'user_id' => \App\Models\User::factory(),
            'exercice_id' => \App\Models\Exercice::factory(),
            'sets' => $this->faker->numberBetween(1, 5),
            'rating' => $this->faker->optional()->numberBetween(1, 10),
            'notes' => $this->faker->optional()->sentence(),
            'is_completed' => $this->faker->boolean(),
            'completed_at' => $this->faker->optional()->dateTime(),
        ];
    }
}
