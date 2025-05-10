<?php

namespace App\Providers;


use Illuminate\Support\ServiceProvider;
use App\Services\ExerciceServices\ExerciceServices;

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
