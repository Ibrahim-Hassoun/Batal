<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Gym extends Model
{
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
        'is_active'
    ];
    /** @use HasFactory<\Database\Factories\GymFactory> */
    use HasFactory;
}
