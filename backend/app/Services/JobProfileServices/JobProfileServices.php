<?php

namespace App\Services\JobProfileServices;

use App\Models\JobProfile;

class JobProfileServices 
{
    public function addJobProfile($request)
    {
        $userId = auth()->user()->id;
        $jobProfile = JobProfile::create([
            'user_id'=>$userId,
            'role' => $request->input('role'),
            'job_description' => $request->input('job_description', null),
            'hourly_rate' => $request->input('hourly_rate'),
            'negotiable' => $request->boolean('negotiable', false),
            'years_of_experience' => $request->input('years_of_experience'),
    
        ]);
        if(!$jobProfile){
            throw new Exception("Couldn't add new job profile",500);
        }
        return $jobProfile;
    }

}