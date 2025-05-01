<?php

namespace App\Services\GymServices;

use App\Models\Gym;

class GymServices {

    public function getGyms($request)
    {
        $query=Gym::query();

        if($request->query('id')){
            $query->where('id', $request->query('id'));
        }
        if($request->query('owner_id')){
            $query->where('owner_id', $request->query('owner_id'));
        }
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
        if($request->query('min_rating')){
            $query->where('min_rating', '>=', $request->query('min_rating'));
        }
        if($request->query('max_rating')){
            $query->where('max_rating', '<=', $request->query('max_rating'));
        }
        if($request->query('current_traffic')){
            $query->where('current_traffic',  $request->query('current_traffic'));
        }
        if($request->query('usual_traffic') ){
            $query->where('usual_traffic',  $request->query('usual_traffic'));
        }
        if($request->query('is_active')){
            $query->where('is_active', $request->query('is_active'));
        }
        return $query->get();
    }

    public function addGym($data)
    {
        $gym = Gym::create($data);
        if ($gym) {
            return $gym;
        }
        throw new \Exception('Failed to create gym');
    }


    public function deleteGym($id)
    {
        $gym = Gym::find($id)->first();
        if ($gym) {
            if($gym->delete()){
                return true;
            }
            throw new \Exception('Failed to delete gym');
        }
        throw new \Exception('Gym not found');
    }
    
    public function updateGym( $data)
    {
        $gym = Gym::find($data['id']);
        if (!$gym) {
            throw new \Exception('Gym not found');
            
        }
        if(!$gym->update($data)) throw new \Exception('Failed to update gym');
        return $gym;
    }

}