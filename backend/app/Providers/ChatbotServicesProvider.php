<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use App\Services\ChatbotServices\ChatbotServices;

class ChatbotServicesProvider extends ServiceProvider
{
    /**
     * Register services.
     */
    public function register(): void
    {
         $this->app->singleton(ChatbotServices::class, function ($app) {
            return new ChatbotServices();
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
