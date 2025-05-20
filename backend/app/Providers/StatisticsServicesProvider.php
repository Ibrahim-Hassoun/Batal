<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use App\Services\PostServices\StatisticsServices;

class StatisticsServicesProvider extends ServiceProvider
{
    /**
     * Register services.
     */
    public function register(): void
    {
          $this->app->singleton(StatisticsServices::class, function ($app) {
            return new StatisticsServices();
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
