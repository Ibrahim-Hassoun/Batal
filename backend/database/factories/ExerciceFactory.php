<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Exercice>
 */
class ExerciceFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'area' => $this->faker->word(),
            'muscle' => $this->faker->word(),
            'exercice' => $this->faker->word(),
            'description' => $this->faker->optional()->sentence(),
            'difficulty' => $this->faker->numberBetween(1, 5),
            'equipment' => $this->faker->optional()->word(),
            'type' => $this->faker->optional()->word(),
            'duration' => $this->faker->optional()->numberBetween(1, 5),
            'image_url' => $this->faker->optional()->imageUrl(),
            'video_url' => $this->faker->optional()->url(),
            'tags' => $this->faker->optional()->randomElements(['strength', 'cardio', 'flexibility', 'balance', 'endurance'], $this->faker->numberBetween(1, 3)),
        ];
    }
}
