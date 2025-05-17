<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use App\Models\User;
use Database\Seeders\GymSeeder;
use Illuminate\Database\Seeder;
use Database\Seeders\PostSeeder;
use Database\Seeders\MessageSeeder;
use Database\Seeders\ReactionSeeder;
use Database\Seeders\FollowingSeeder;
use Database\Seeders\JobProfileSeeder;
use Database\Seeders\ExerciceSeeder;
use Database\Seeders\UserExerciceSeeder;
use Database\Seeders\ConversationSeeder;
use Database\Seeders\ChatbotMessageSeeder;
use Database\Seeders\ChatbotSessionSeeder;



class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        $this->call([
            UserExerciceSeeder::class,
            UserSeeder::class,
            LogSeeder::class,
            GymSeeder::class,
            PostSeeder::class,
            ReactionSeeder::class,
            JobProfileSeeder::class,
            ExerciceSeeder::class,
            ChatbotSessionSeeder::class,
            ChatbotMessageSeeder::class,
            FollowingSeeder::class,
            ConversationSeeder::class,
            MessageSeeder::class
        ]);
        // User::factory(10)->create();

        // User::factory()->create([
        //     'name' => 'Test User',
        //     'email' => 'test@example.com',
        // ]);
    }
}
