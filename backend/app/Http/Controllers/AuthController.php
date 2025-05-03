<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests\AuthRequests\RegisterRequest;
use App\Traits\HttpResponseTrait;
use App\Services\AuthServices;

class AuthController extends Controller
{
    use HttpResponseTrait;

    protected $authServices;

    public function __construct(AuthServices $authServices)
    {
        $this->authServices = $authServices;
    }

    public function test()
    {
        // Corrected reference to $authServices
        return response()->json(["test" => $this->authServices->test()]);
    }
    public function register(RegisterRequest $request)
    {
        try {
            $user = $this->authServices->register($request->validated());
            return $this->respond(
                true,
                "User created successfully",
                $user,
                201
            );
        } catch (\Exception $e) {
            return $this->respond(
                false,
                $e->getMessage(),
                null,
                 500
            );
        }
    }
    

    public function login(Request $request)
    {
        try{
            $credentials = $request->only('email', 'password');
            $user = $this->authServices->login($credentials);
            return $this->respond(
                true,
                "User logged in successfully",
                $user,
                200
            );
        }catch(\Exception $e){
            return $this->respond(
                false,
                $e->getMessage(),
                null,
                 500
            );
        }
       
    }

    public function logout(Request $request)
    {
        // Logout logic here
       
    }
}
