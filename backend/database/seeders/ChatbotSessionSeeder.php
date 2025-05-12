<?php

namespace Database\Seeders;

use App\Models\ChatbotSession;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Database\Factories\ChatbotSessionFactory;

class ChatbotSessionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        ChatbotSession::factory()
            ->count(10)
            ->create();
    }
}
