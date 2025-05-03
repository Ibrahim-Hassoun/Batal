<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\JobProfile>
 */
class JobProfileFactory extends Factory
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
            'job_type' => $this->faker->randomElement(['trainer', 'dietitian']),
            'job_description' => $this->faker->sentence(),
            'hourly_rate' => $this->faker->randomFloat(2, 10, 100), 
            'negotiable' => $this->faker->boolean(),
            'years_of_experience' => $this->faker->randomFloat(1, 0, 30), 
            'rating' => $this->faker->randomFloat(2, 0, 5), 
            'is_approved' => $this->faker->boolean(),
        ];
    }
}
