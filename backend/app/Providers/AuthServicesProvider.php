<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;

class AuthServicesProvider extends ServiceProvider
{
    /**
     * Register services.
     */
    public function register(): void
    {
        $this->app->singleton('AuthServices',function($app){
            return new \App\Services\AuthServices();
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
