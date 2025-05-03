<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use App\Services\JobProfileServices\JobProfileServices;


class JobProfileServicesProvider extends ServiceProvider
{
    /**
     * Register services.
     */
    public function register(): void
    {
        $this->app->singleton(JobProfileServices::class, function ($app) {
            return new JobProfileServices();
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
