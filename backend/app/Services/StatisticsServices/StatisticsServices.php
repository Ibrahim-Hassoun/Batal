<?php

namespace App\Services\StatisticsServices;

use App\Models\User;
use App\Models\UserExercice;
use Illuminate\Support\Facades\DB;

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
    ->get();
    return $exerciseCounts;

    }
}