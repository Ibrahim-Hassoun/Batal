<?php

namespace Database\Seeders;

use App\Models\JobProfile;
use Illuminate\Database\Seeder;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;


class JobProfileSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        JobProfile::factory()->count(10)->create();
    }
}
