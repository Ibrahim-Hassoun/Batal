<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes; 
use Illuminate\Database\Eloquent\Factories\HasFactory;


class UserExercice extends Model
{   
    use SoftDeletes;
    protected $table = 'user_exercice';
    /** @use HasFactory<\Database\Factories\UserExerciceFactory> */
    use HasFactory;
}
