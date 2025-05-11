<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\User>
 */
class UserFactory extends Factory
{
    /**
     * The current password being used by the factory.
     */
    protected static ?string $password;

    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'username' => fake()->unique()->userName(),
            'phone_number' => fake()->unique()->phoneNumber(),
            'bio' => fake()->sentence(10),
            'profile_photo_path' => null,
            'first_name' => fake()->firstName(),
            'last_name' => fake()->lastName(),
            'is_completed' => fake()->boolean(30), 
            'completed_at' => fake()->optional(0.3)->dateTimeThisYear(), 
            'is_verified' => fake()->boolean(70), 
            'verified_at' => fake()->optional(0.7)->dateTimeThisYear(), 
            'email' => fake()->unique()->safeEmail(),
            'email_verified_at' => now(),
            'password' =>  Hash::make('password'),
            'date_of_birth' => fake()->optional()->date(),
            'location_of_birth' => fake()->optional()->city(),
            'role' => fake()->randomElement(['user', 'trainer', 'dietitian', 'admin', 'moderator']),
            'country' => fake()->country(),
            'province' => fake()->state(),
            'city' => fake()->city(),
            'street' => fake()->streetAddress(),
            'followers_count' => fake()->numberBetween(0, 1000),
            'following_count' => fake()->numberBetween(0, 500),
            'gym_location' => fake()->optional(0.4)->company(), 
            'streak' => fake()->numberBetween(0, 365),
            'coins' => fake()->numberBetween(0, 100),
            'sets' => fake()->numberBetween(0, 5),
            'current_xp' => fake()->numberBetween(0, 1000),
            'total_xp' => fake()->numberBetween(0, 10000),
            'trophies_count' => fake()->numberBetween(0, 50),
            'last_login_at' => fake()->optional()->dateTimeThisMonth(),
            'last_login_ip' => fake()->optional()->ipv4(),
            'remember_token' => Str::random(10),

            'fitness_level' => fake()->optional()->randomElement(['beginner', 'intermediate', 'advanced']),
            'fitness_goal' => fake()->optional()->randomElement(['weight loss', 'muscle gain', 'endurance', 'flexibility', 'general fitness']),
            'fitness_interests' => fake()->optional()->words(3, true),
            'injuries' => fake()->optional()->words(2, true),
            'medical_conditions' => fake()->optional()->words(2, true),
            'allergies' => fake()->optional()->words(2, true),
            'dietary_preferences' => fake()->optional()->randomElement(['vegan', 'vegetarian', 'pescatarian', 'omnivore', 'keto', 'none']),
            'dietary_restrictions' => fake()->optional()->words(2, true),
            'fitness_equipment' => fake()->optional()->words(2, true),
            'fitness_experience' => fake()->optional()->randomElement(['none', 'some', 'regular', 'expert']),
        ];
    }

    /**
     * Indicate that the model's email address should be unverified.
     */
    public function unverified(): static
    {
        return $this->state(fn (array $attributes) => [
            'email_verified_at' => null,
        ]);
    }
}
