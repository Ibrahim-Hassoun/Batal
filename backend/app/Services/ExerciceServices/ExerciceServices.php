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
            'difficulty' => $request->difficulty ,
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

    public function searchExercice($request)
    {
        $query = Exercice::query();
        if ($request->query('id')) {
            $query->where('id', $request->query('id'));
        }
        if ($request->query('area')) {
            $query->where('area', 'like', '%' . $request->query('area') . '%');
        }
        if ($request->query('muscle')) {
            $query->where('muscle', 'like', '%' . $request->query('muscle') . '%');
        }
        if ($request->query('exercice')) {
            $query->where('exercice', 'like', '%' . $request->query('exercice') . '%');
        }
        if ($request->query('description')) {
            $query->where('description', 'like', '%' . $request->query('description') . '%');
        }
        if ($request->query('min_difficulty')) {
            $query->where('difficulty', '>=', $request->query('min_difficulty'));
        }
        if ($request->query('max_difficulty')) {
            $query->where('difficulty', '<=', $request->query('max_difficulty'));
        }
        if ($request->query('equipment')) {
            $query->where('equipment', 'like', '%' . $request->query('equipment') . '%');
        }
        if ($request->query('type')) {
            $query->where('type', 'like', '%' . $request->query('type') . '%');
        }
        if ($request->query('duration')) {
            $query->where('duration', 'like', '%' . $request->query('duration') . '%');
        }
        if ($request->query('tags')) {
            $query->where('tags', 'like', '%' . $request->query('tags') . '%');
        }

        $exercices = $query->orderBy('area')->get();
        if (!$exercices) {
            throw new \Exception('No exercices found', 404);
        }
        return $exercices;
    }

    public function getRecommendedExercices($request)
    {
        
    }
}