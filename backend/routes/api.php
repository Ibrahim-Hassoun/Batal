<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\GymController;
use App\Http\Controllers\PostController;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\MessageController;
use App\Http\Controllers\ChatbotController;
use App\Http\Controllers\ExerciceController;
use App\Http\Controllers\JobProfileController;
use App\Http\Controllers\StatisticsController;
use App\Http\Controllers\LeaderBoardController;
use App\Http\Controllers\ConversationController;


Route::group(['prefix'=>"v0.1"],function(){
    Route::post('/register',[AuthController::class,'register'] );
    Route::post('/login',[AuthController::class,'login'] );
    Route::get('/test',function(){
        return response()->json([
            'message'=>'Hello World',
            'message2sads'=>'Hello World2',
            'last test'=>'last test'
        ]);
    });
    Route::get('/auth-check',[AuthController::class,'authCheck'])->middleware('authenticated');
    // Route::post('/logout',[AuthController::class,'logout'] ); to be implemented
    

    Route::group(['middleware' => 'authenticated'], function () {
      
        Route::group(['prefix'=>'gyms'],function(){
            Route::get('/search',[GymController::class,'getGyms']);
            Route::post('/add',[GymController::class,'addGym']);
            Route::delete('/delete',[GymController::class,'deleteGym']);
            Route::post('/update',[GymController::class,'updateGym']);
        });

        Route::group(['prefix'=>'posts'],function(){
            Route::post('/add',[PostController::class,'addPost']);
            Route::get('/search',[PostController::class,'searchPost']);
            Route::delete('/delete',[PostController::class,'deletePost']);
            Route::post('/update',[PostController::class,'updatePost']);

            Route::post('/addReaction',[PostController::class,'addReaction']);
            Route::post('/deleteReaction',[PostController::class,'deleteReaction']);
            Route::post('/updateReaction',[PostController::class,'updateReaction']);
            // Route::post('/updateReaction',[PostController::class,'updateReaction']);

            Route::get('/following',[PostController::class,'getFollowingsPosts']);
            Route::get('/trending',[PostController::class,'getTrendingPosts']);
            
        });

        Route::group(['prefix'=>'jobProfiles'],function(){
            Route::post('/add',[JobProfileController::class,'addJobProfile']);
            Route::post('/update',[JobProfileController::class,'updateJobProfile']);
            Route::post('/approve',[JobProfileController::class,'approveJobProfile']);

        });

        Route::group(['prefix'=>'chatbot'],function(){
            Route::post('/send',[ChatbotController::class,'sendMessage']);
            Route::get('/messages',[ChatbotController::class,'getMessages']);
            Route::delete('/session',[ChatbotController::class,'resetSession']);
        });

        Route::group(['prefix'=>'exercices'],function(){
            Route::get('/search',[ExerciceController::class,'searchExercice']);

            Route::get('/all-previews',[ExerciceController::class,'getExercicesPreviews']);
            Route::get('/recommended',[ExerciceController::class,'getRecommendedExercices']);
            Route::post('/{id}/save',[ExerciceController::class,'saveExercice']);

            Route::group(['prefix'=>'saved'],function(){
                Route::get('/',[ExerciceController::class,'getSavedExercices']);
                Route::patch('/{id}/increment',[ExerciceController::class,'incrementSetCount']);
                Route::patch('/{id}/decrement',[ExerciceController::class,'decrementSetCount']);
                Route::patch('/{id}/complete',[ExerciceController::class,'completeExercice']);
                Route::delete('/{id}',[ExerciceController::class,'deleteExercice']);
            });
           

        });

        Route::group(['prefix'=>'leaderboard'],function(){
            Route::get('/weekly',[LeaderBoardController::class,'getWeeklyLeaderBoard']);
        });

        Route::group(['prefix'=>'chat'],function(){

            Route::group(['prefix'=>'conversations'],function(){
                Route::get('/all',[ConversationController::class,'getUserConversations']);
                Route::get('/{conversation_id}/messages',[ConversationController::class,'getConversationMessages']);
            });

            Route::group(['prefix'=>'messages'],function(){
                Route::post('/',[MessageController::class,'storeMessage']);
            });
        });

        Route::group(['middleware' => 'isAdmin'], function () {
            
            Route::group(['prefix'=>'exercices'],function(){
                Route::post('/add',[ExerciceController::class,'addExercice']);
                
            });

        });
       
        

    });

    Route::group(['prefix'=>'statistics'],function(){
        Route::get('/users',[StatisticsController::class,'getNumberOfUsers']);
        Route::get('/users/by-role',[StatisticsController::class,'getNumberOfUsersByRole']);
        Route::get('/user-exercices',[StatisticsController::class,'getNumberOfExercicesMade']);

        Route::get('/exercices/aggregations',[StatisticsController::class,'getExercicesAggregations']);
        Route::get('/countries/aggregations',[StatisticsController::class,'getCountryAggregations']);
    });
});
