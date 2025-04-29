<?php

use App\Models\User;
use App\Http\Requests\RegisterRequest;

class AuthServices {

    public function register($userData) {
        $userData['password'] = bcrypt($userData['password']);
        $user = User::create($userData);
        if(!$user){
            throw new \Exception('User not created', 500);
        };
        $user['token'] = JWTAuth::fromUser($user);
        if(!$user['token']){
            throw new \Exception('Token not created', 500);
        };
        return $user;
    }
}