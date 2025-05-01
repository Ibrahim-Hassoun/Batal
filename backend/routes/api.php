<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\GymController;
use App\Http\Controllers\AuthController;


Route::group(['prefix'=>"v0.1"],function(){
    Route::post('/register',[AuthController::class,'register'] );
    Route::post('/login',[AuthController::class,'login'] );
    // Route::post('/logout',[AuthController::class,'logout'] ); to be implemented
    

    Route::group(['middleware' => 'authenticated'], function () {
      
        Route::group(['prefix'=>'gyms'],function(){
            Route::get('/search',[GymController::class,'getGyms']);
        });
    });
});
