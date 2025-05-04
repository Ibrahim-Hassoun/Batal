<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Traits\HttpResponseTrait;
use App\Http\Requests\AuthorizeAdminRequest;
use App\Services\JobProfileServices\JobProfileServices;
use App\Http\Requests\JobProfileRequests\AddJobProfileRequest;
use App\Http\Requests\JobProfileRequests\UpdateJobProfileRequest;


class JobProfileController extends Controller
{
    use HttpResponseTrait;
    protected $jobProfileServices;

    public function __construct(JobProfileServices $jobProfileServices)
    {
        $this->jobProfileServices = $jobProfileServices;
    }

    public function addJobProfile(AddJobProfileRequest $request)
    {
        try{
            $jobProfile = $this->jobProfileServices->addJobProfile($request);
            return $this->respond(true,"Job Profile added successfully",$jobProfile,200);
        }catch(\Exception $e){
            return $this->respond(false,$e->getMessage(),null,500);
        }
    }

    public  function updateJobProfile(UpdateJobProfileRequest $request)
    {
        try{
            $jobProfile = $this->jobProfileServices->updateJobProfile($request);
            return $this->respond(true,"Job Profile updated successfully.",$jobProfile,200);
        }catch(\Exception $e){
            return $this->respond(false,$e->getMessage(),null,$e->getCode()??500);
        }
    }

    public function approveJobProfile(AuthorizeAdminRequest $request)
    {
        try{
            $jobProfile = $this->jobProfileServices->approveJobProfile($request);
            return $this->respond(true,"Job Profile approved successfully.",$jobProfile,200);
        }catch(\Exception $e){
            return $this->respond(false,$e->getMessage(),null,$e->getCode()??500);
        } 
    }

}
