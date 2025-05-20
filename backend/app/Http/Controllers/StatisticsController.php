<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Traits\HttpResponseTrait;
use App\Services\StatisticsServices\StatisticsServices;

class StatisticsController extends Controller
{
    use HttpResponseTrait;
    protected $statisticsServices;

     public function __construct(StatisticsServices $statisticsServices)
    {
        $this->statisticsServices = $statisticsServices;
    }

    public function getNumberOfUsers(Request $request)
    {
         try{
            $usersCount = $this->statisticsServices->getNumberOfUsers($request->all());
            return $this->respond(true,'users retrieved successfully',$usersCount,201);

        }catch(\Exception $e){
            return $this->respond(false,$e->getMessage(),null,$e->getCode());
        }
    }
}
