<?php

namespace App\Services\ExerciceServices;

use App\Models\Exercice;


class ExerciceServices
{
    public function addExercice($request)
    {
        $exercice = Exercice::create([
            'area' => $request->area,
            'muscle' => $request->muscle,
            'exercice' => $request->exercice,
            'description' => $request->description ?? null,
            'difficulty' => $request->difficulty ?? null,
            'equipment' => $request->equipment ?? null,
            'type' => $request->type ?? null,
            'duration' => $request->duration ?? null,
            'image_url' => $request->image_url ?? null,
            'video_url' => $request->video_url ?? null,
            'tags' => $request->tags?? null
        ]);

        if (!$exercice){
            throw new \Exception('Error creating exercice', 500);
        }
        return $exercice;
    }
}