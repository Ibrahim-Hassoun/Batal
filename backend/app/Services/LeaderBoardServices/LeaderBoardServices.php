<?php

namespace App\Services\LeaderBoardServices;

use App\Models\User;

class LeaderBoardServices 
{
    public function getWeeklyLeaderboard($request)
    {
        return User::select('id', 'first_name', 'last_name', 'streak', 'current_xp')
            ->orderByDesc('current_xp')
            ->take(10)
            ->get();
    }
    
}