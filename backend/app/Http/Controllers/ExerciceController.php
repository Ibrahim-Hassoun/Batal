<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Traits\HttpResponseTrait;
use App\Services\ExerciceServices\ExerciceServices;

class ExerciceController extends Controller
{
    use HttpResponseTrait;
    protected $exerciceServices;

    public function __construct(ExerciceServices $exerciceServices)
    {
        $this->exerciceServices = $exerciceServices;

    }
    public function addExercice(Request $request)
    {
        try{
            $post = $this->exerciceServices->addExercice($request);
            return $this->respond(true,'Exercice added successfully',$post,201);

        }catch(\Exception $e){
            return $this->respond(false,$e->getMessage(),null,500);
        }
    }

    public function searchExercice(Request $request)
    {
        try{
            $post = $this->exerciceServices->searchExercice($request);
            return $this->respond(true,'Exercices fetched successfully',$post,201);
        }catch(\Exception $e){
            return $this->respond(false,$e->getMessage(),null,500);
        }
    }

    public function getRecommendedExercices(Request $request)
    {
        try{
            $post = $this->exerciceServices->getRecommendedExercices($request);
            return $this->respond(true,'Recommended exercices fetched successfully',$post,201);
        }catch(\Exception $e){
            return $this->respond(false,$e->getMessage(),null,500);
        }
    }

    public function getSavedExercices(Request $request)
    {
        try{
            $exercices = $this->exerciceServices->getSavedExercices($request);
            return $this->respond(true,'Saved exercices fetched successfully',$exercices,201);
        }catch(\Exception $e){
            return $this->respond(false,$e->getMessage(),null,500);
        }
    }

    public function incrementSetCount($id)
    {
        try{
            $result = $this->exerciceServices->incrementSetCount($id);
            return $this->respond(true,'set incremented successfully',$result,201);
        }catch(\Exception $e){
            return $this->respond(false,$e->getMessage(),null,500);
        }
    }

    public function decrementSetCount($id)
    {
        try{
            $result = $this->exerciceServices->decrementSetCount($id);
            return $this->respond(true,'set decremented successfully',$result,201);
        }catch(\Exception $e){
            return $this->respond(false,$e->getMessage(),null,500);
        }
    }
}
