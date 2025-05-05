<?php

namespace App\Traits;
use Illuminate\Support\Facades\Http;

trait IpApi
{
    public function getLocation($ip)
    {
        $ip = request()->ip(); // or use a specific IP

        $response = Http::get("https://ipapi.co/$ip/json/");
        $location = $response->json();
    }
}
