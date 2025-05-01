<?php

namespace App\Services\LogServices;

use App\Models\Log;
use Stevebauman\Location\Facades\Location;

class LogServices {
    public  function addLog($ip,$action,$success,$id)
    {
        $location = Location::get($ip);
        $logData = [
            'user_id' => $id,
            'ip_address' => $ip,
            'action' => $action,
            'success' => $success,
            'country' => $location ? $location->countryName : null,
            'region' => $location ? $location->regionName : null,
            'city' => $location ? $location->cityName : null,
            'longitude' => $location ? $location->longitude : null,
            'latitude' => $location ? $location->latitude : null,
            
            
        ];
        
        if(!Log::create($logData)){
            throw new \Exception('Failed to create log entry');
        };
        return true;


    }
}
