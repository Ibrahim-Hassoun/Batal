<?php

namespace App\Services;

use App\Models\User;
use Tymon\JWTAuth\Facades\JWTAuth;
use App\Http\Requests\RegisterRequest;


class AuthServices {

    public function test(){
        return "test";
    }

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

    public function login($credentials) {
        $token = JWTAuth::attempt(['email' => $credentials['email'], 'password' => $credentials['password']]);
        if (!$token) {
            throw new \Exception('Invalid credentials', 401);
        }
        $user = JWTAuth::user();
        $data = [
            'user' => $user,
            'token' => $token
        ];
        return $data;
       
    }
}