<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;

Route::group(['prefix'=>"v0.1"],function(){
    Route::post('/register',[AuthController::class,'register'] );
    Route::get('test',function(){
        return response()->json(['message'=>'test']);
    });
});