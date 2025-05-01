<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes; 
use Illuminate\Database\Eloquent\Factories\HasFactory;


class Gym extends Model
{
    use SoftDeletes;
    protected $fillable = [
        'owner_id',
        'name',
        'description',
        'logo_path',
        'estimated_capacity',
        'subscription_price',
        'current_traffic',
        'usual_traffic',
        'opening_hours',
        'gender',
        'latitude',
        'longitude',
        'phone_number',
        'email',
        'website',
        'is_active',
        'deleted_at',
    ];
    /** @use HasFactory<\Database\Factories\GymFactory> */
    use HasFactory;
}
