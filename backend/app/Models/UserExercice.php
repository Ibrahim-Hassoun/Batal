<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserExercice extends Model
{
    protected $table = 'user_exercice';
    /** @use HasFactory<\Database\Factories\UserExerciceFactory> */
    use HasFactory;
}
