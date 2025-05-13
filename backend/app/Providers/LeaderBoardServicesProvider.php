<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use App\Services\LeaderBoardServices\LeaderBoardServices;

class LeaderBoardServicesProvider extends ServiceProvider
{
    /**
     * Register services.
     */
    public function register(): void
    {
        $this->app->singleton(LeaderBoardServices::class, function($app) {
            return new LeaderBoardServices();
        });
    }

    /**
     * Bootstrap services.
     */
    public function boot(): void
    {
        //
    }
}
