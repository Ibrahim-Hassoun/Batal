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

    public function getNumberOfUsersByRole(Request $request)
    {
         try{
            $usersCount = $this->statisticsServices->getNumberOfUsersByRole($request->all());
            return $this->respond(true,'users retrieved successfully',$usersCount,201);

        }catch(\Exception $e){
            return $this->respond(false,$e->getMessage(),null,$e->getCode());
        }
    }

    public function getNumberOfExercicesMade(Request $request)
    {
         try{
            $exercises = $this->statisticsServices->getNumberOfExercicesMade($request->all());
            return $this->respond(true,'user exercices retrieved successfully',$exercises,201);

        }catch(\Exception $e){
            return $this->respond(false,$e->getMessage(),null,$e->getCode());
        }
    }

    public function getExercicesAggregations(Request $request)
    {
         try{
            $exercises = $this->statisticsServices->getExercicesAggregations($request->all());
            return $this->respond(true,'user exercices retrieved successfully',$exercises,201);

        }catch(\Exception $e){
            return $this->respond(false,$e->getMessage(),null,500);
        }
    }
}
