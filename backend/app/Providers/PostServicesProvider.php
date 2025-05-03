<?php

namespace App\Providers;


use Illuminate\Support\ServiceProvider;
use App\Services\PostServices\PostServices;
use App\Services\PostServices\ReactionServices;


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

        $this->app->singleton(ReactionServices::class,function($app){
            return new ReactionServices();
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
