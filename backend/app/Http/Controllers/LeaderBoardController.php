<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Traits\HttpResponseTrait;
use App\Services\LeaderBoardServices\LeaderBoardServices;

class LeaderBoardController extends Controller
{
    use HttpResponseTrait;
    private $leaderBoardServices ;

    protected $authServices;

    public function __construct(LeaderBoardServices $leaderBoardServices)
    {
        $this->leaderBoardServices = $leaderBoardServices;
    }
}