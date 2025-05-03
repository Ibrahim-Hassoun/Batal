<?php

namespace App\Models;

use App\Models\User;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;


class Post extends Model
{
    /** @use HasFactory<\Database\Factories\PostFactory> */
    use SoftDeletes;
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

    public function user()
    {
        return $this->belongsTo(User::class);
    }
    public function myReaction()
    {
    return $this->hasOne(Reaction::class)
                ->where('user_id', auth()->id());
    }

}
