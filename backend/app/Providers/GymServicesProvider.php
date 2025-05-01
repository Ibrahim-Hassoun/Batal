<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use App\Services\GymServices\GymServices;


class GymServicesProvider extends ServiceProvider
{
    /**
     * Register services.
     */
    public function register(): void
    {
        $this->app->singleton(GymServices::class, function($app) {
            return new GymServices();
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
