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

    public function getGyms($request){
        $query=Gym::query();

        if($request->query('name')){
            $query->where('name', 'like', '%' . $request->query('name') . '%');
        }
        if($request->query('location')){
           // we need to see how to search by location
        }
        if($request->query('gender')){
            $query->where('gender', $request->query('gender'));
        }
        if($request->query('min_subscription_price')){
            $query->where('subscription_price', '>=', $request->query('min_subscription_price'));
        }
        if($request->query('max_subscription_price')){
            $query->where('subscription_price', '<=', $request->query('max_subscription_price'));
        }
        return $query->get();
    }

   
    

}