<?php

namespace App\Services\StatisticsServices;

use App\Models\User;
use App\Models\UserExercice;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class StatisticsServices {

    public function getNumberOfUsers()
    {
        return User::count();
    }

    public function getNumberOfUsersByRole()
    {
        $dietitians = User::where('role','dietitian')->count();
        $trainers = User::where('role','trainer')->count();

        return [
            'dietitians' => $dietitians,
            'trainers' => $trainers
        ];

    }

    public function getNumberOfExercicesMade()
    {
        return UserExercice::count();
    }

    public function getExercicesAggregations()
    {
       $exerciseCounts = UserExercice::select('exercices.exercice', DB::raw('COUNT(*) as count'))
    ->join('exercices', 'user_exercice.exercice_id', '=', 'exercices.id')
    ->groupBy('exercices.exercice')
    ->orderByDesc('count')
    ->get();
    return $exerciseCounts;

    }

    public function getCountryAggregations()
    {
       return $usersPerCountry = User::select('country', \DB::raw('count(*) as total'))
        ->groupBy('country')
        ->orderByDesc('total')
        ->get();
    }
    public function getGrowthOfUsers()
    {
       return $growth = User::select(DB::raw('DATE(created_at) as date'), DB::raw('COUNT(*) as total'))
                        ->where('created_at', '>=', Carbon::now()->subDays(6)->startOfDay()) // last 7 days including today
                        ->groupBy(DB::raw('DATE(created_at)'))
                        ->orderBy('date')
                        ->get();
    }
}