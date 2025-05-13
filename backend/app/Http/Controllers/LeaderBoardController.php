<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Traits\HttpResponseTrait;
use App\Services\LeaderBoardServices\LeaderBoardServices;

class LeaderBoardController extends Controller
{
    use HttpResponseTrait;
    protected $leaderBoardServices ;

   

    public function __construct(LeaderBoardServices $leaderBoardServices)
    {
        $this->leaderBoardServices = $leaderBoardServices;
    }

    public function getWeeklyLeaderboard(Request $request)
    {
         try{
            $leaderboard = $this->leaderBoardServices->getWeeklyLeaderboard($request);
            return $this->respond(true,'Messages retrieved successfully',$leaderboard,200);

        }catch(\Exception $e){
            return $this->respond(false,$e->getMessage(),null,500);
        }
    }

}