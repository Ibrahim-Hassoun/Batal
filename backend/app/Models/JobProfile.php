<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class JobProfile extends Model
{
    /** @use HasFactory<\Database\Factories\JobProfileFactory> */
    use HasFactory;

    protected $fillable = [
        'user_id',
        'role',
        'job_description',
        'hourly_rate',
        'negotiable',
        'years_of_experience',
   
    
    ];
}
