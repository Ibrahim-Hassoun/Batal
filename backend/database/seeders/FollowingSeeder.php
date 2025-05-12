<?php

namespace Database\Seeders;

use App\Models\Following;
use Illuminate\Database\Seeder;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;


class FollowingSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Following::factory()->count(10)->create();
    }
}
