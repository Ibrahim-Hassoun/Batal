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

    public function updateJobProfile($request)
    {
        $userId = auth()->user()->id;

        $jobProfile = JobProfile::find($request->input('job_profile_id'));
        
        if(!$jobProfile){
            throw new Exception('Couldn\'t find job profile', 404);
        }

        if ($request->input('role')) {
            $jobProfile->role = $request->input('role');
        }
        if ($request->input('job_description')) {
            $jobProfile->job_description = $request->input('job_description');
        }
        if ($request->input('hourly_rate')) {
            $jobProfile->hourly_rate = $request->input('hourly_rate');
        }
        if ($request->has('negotiable')) {
            $jobProfile->negotiable = $request->boolean('negotiable');
        }
        if ($request->input('years_of_experience')) {
            $jobProfile->years_of_experience = $request->input('years_of_experience');
        }

        if(!$jobProfile->save()){
            throw new Exception("Couldn't update job profile", 500);
        }

        return $jobProfile;
        
    }
}