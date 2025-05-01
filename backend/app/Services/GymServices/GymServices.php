<?php

namespace App\Services\GymServices;

use App\Models\Gym;

class GymServices {

    public function addGym($data){
        $gym = Gym::create($data);
        if ($gym) {
            return $gym;
        }
        throw new \Exception('Failed to create gym');
    }

    public function updateGym($id, $data){
        $gym = Gym::find($id);
        if ($gym) {
            $gym->update($data);
            return $gym;
        }
        throw new \Exception('Gym not found');
    }

    public function deleteGym($id){
        $gym = Gym::find($id);
        if ($gym) {
            $gym->update(['deleted_at' => now()]);
            return true;
        }
        throw new \Exception('Gym not found');
    }

    public function getGym($id){
        return Gym::find($id);
    }

    public function getAllGyms(){
        return Gym::all();
    }

    public function searchGyms($query){
        $query=Gym::query();

        if($request->has('name')){
            $query->where('name','like','%'.$request->input('name').'%');
        }
        if($request->has('location')){
           //we need to see how to search by location
        }
        if($request->has('gender')){
            $query->where('gender','like','%'.$request->input('type').'%');
        }
        if($request->has('min_subscription_price')){
            $query->where('subscription_price','>=',$request->input('min_subscription_price'));
        }
        if($request->has('max_subscription_price')){
            $query->where('subscription_price','<=',$request->input('max_subscription_price'));
        }
        return $query->get();
    }
    

}