<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Traits\HttpResponseTrait;
use App\Services\JobProfileServices\JobProfileServices;
use App\Http\Requests\JobProfileRequests\AddJobProfileRequest;

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


}
