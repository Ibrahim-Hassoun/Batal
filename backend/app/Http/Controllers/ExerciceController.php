<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;


class ExerciceController extends Controller
{
    public function addExercice(Request $request)
    {
        try{
            $post = $this->exerciceServices->addExercice($request->all());
            return $this->respond(true,'Exercice added successfully',$post,201);

        }catch(\Exception $e){
            return $this->respond(false,$e->getMessage(),null,$e->getCode());
        }
    }
}
