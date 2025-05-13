<?php

namespace App\Services\LeaderBoardServices;

use App\Models\User;

class LeaderBoardServices 
{
    public function getWeeklyLeaderboard($request)
    {
        return User::orderByDesc('current_xp')
            ->take(10)
            ->get();
    }
    
}