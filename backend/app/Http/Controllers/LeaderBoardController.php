<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Traits\HttpResponseTrait;

class LeaderBoardController extends Controller
{
    use HttpResponseTrait;

    protected $authServices;

    public function __construct()
    {
        
    }
}