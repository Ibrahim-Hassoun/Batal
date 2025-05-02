<?php

namespace App\Providers;


use Illuminate\Support\ServiceProvider;
use App\Services\PostServices\PostServices;

class PostServicesProvider extends ServiceProvider
{
    /**
     * Register services.
     */
    public function register(): void
    {
        $this->app->singleton(PostServices::class, function ($app) {
            return new PostServices();
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
