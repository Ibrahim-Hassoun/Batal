<?php

namespace App\Providers;

use App\Services\ExerciceServices;
use Illuminate\Support\ServiceProvider;

class ExerciceServicesProvider extends ServiceProvider
{
    /**
     * Register services.
     */
    public function register(): void
    {
         $this->app->singleton(ExerciceServices::class, function($app) {
            return new ExerciceServices();
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
