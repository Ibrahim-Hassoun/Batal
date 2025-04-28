<?php

namespace App;

trait HttpResponse
{
    public function respond($success,$message,$data,$statusCode){
        return response()->json([
            'success'=>$success,
            'message'=>$message,
            'data'=>$data
        ],$statusCode);
    }
}
