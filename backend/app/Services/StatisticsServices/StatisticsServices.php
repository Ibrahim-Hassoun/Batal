<?php

namespace App\Services\StatisticsServices;

use App\Models\User;


class StatisticsServices {

    public function getNumberOfUsers()
    {
        return User::count();
    }
}