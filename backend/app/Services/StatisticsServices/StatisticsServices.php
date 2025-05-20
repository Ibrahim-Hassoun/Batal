<?php

namespace App\Services\StatisticsServices;

use App\Models\User;
use App\Models\UserExercice;

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
}