<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use App\Services\ChatServices\MessageServices;
use App\Services\ChatServices\ConversationServices;


class ChatServicesProvider extends ServiceProvider
{
    /**
     * Register services.
     */
    public function register(): void
    {
        $this->app->singleton(ConversationServices::class, function ($app) {
            return new ConversationServices();
        });
        $this->app->singleton(MessageServices::class, function ($app) {
            return new MessageServices();
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
