<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests\RegisterRequest;
use App\Traits\HttpResponse;

class AuthController extends Controller
{
    use HttpResponse;
    public function register(RegisterRequest $request)
    {
        return $this->respond(
            true,
            "   User registered successfully",
            null,
            200
        );
    }

    public function login(Request $request)
    {
        // Login logic here
       
    }

    public function logout(Request $request)
    {
        // Logout logic here
       
    }
}
