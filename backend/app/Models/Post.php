<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    /** @use HasFactory<\Database\Factories\PostFactory> */
    use HasFactory;

    protected $fillable = [
            'user_id',
            'description',
            'image_path',
            'reactions',
            'comments',
            'shares',
            'impressions_count' ,
            'followers_brought' ,
            'profile_visits' ,
            'reach' ,
            'scheduled_at' ,
            'deleted_at' 
    ];
}
