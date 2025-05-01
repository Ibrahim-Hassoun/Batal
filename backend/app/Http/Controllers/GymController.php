<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Traits\HttpResponseTrait;
use App\Services\GymServices\GymServices;

class GymController extends Controller
{
    use HttpResponseTrait;
    protected $gymServices;

    public function __construct(GymServices $gymServices)
    {
        $this->gymServices = $gymServices;
    }
    
    public function getGyms(Request $request)
    {
        try{
            $gyms = $this->gymServices->getGyms($request);
            return $this->respond(
                'true',
                'Gyms retrieved successfully',
                $gyms,
                200
            );
        }catch(\Exception $e){
            return $this->respond(
                'false',
                $e->getMessage(),
                null,
                500
            );
        }
    }
    
}
