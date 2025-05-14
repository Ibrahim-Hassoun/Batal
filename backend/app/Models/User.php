<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use App\Models\Log;
use App\Models\Post;
use App\Models\Exercice;
use App\Models\Following;
use App\Models\ChatbotSession;
use Tymon\JWTAuth\Contracts\JWTSubject;
use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;


class User extends Authenticatable implements JWTSubject
{
    /** @use HasFactory<\Database\Factories\UserFactory> */
    use HasFactory, Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var list<string>
     */
    protected $fillable = [
    'first_name', 'last_name', 'username', 'email', 'password', 
    'date_of_birth', 'location_of_birth', 'role', 'country', 'province',
    'city', 'street', 'phone_number', 'bio', 'profile_photo_path',
    'is_completed', 'completed_at', 'is_verified', 'verified_at',
    'followers_count', 'following_count', 'gym_location', 'streak',
    'coins', 'sets', 'current_xp', 'total_xp', 'trophies_count',
    'last_login_at', 'last_login_ip', 
    'fitness_level', 'fitness_goal', 'fitness_interests', 'injuries',
    'medical_conditions', 'allergies', 'dietary_preferences',
    'dietary_restrictions', 'fitness_equipment', 'fitness_experience'
];


    /**
     * The attributes that should be hidden for serialization.
     *
     * @var list<string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    public function logs(){
        return $this->hasMany(Log::class);
    }
    public function followings()
    {
        return $this->hasMany(Following::class, 'follower_id');
    }

    public function followers()
    {
        return $this->hasMany(Following::class, 'followed_id');
    }

    public function posts()
    {
        return $this->hasMany(Post::class);
    }

    public function chatbotSession()
    {
        return $this->hasOne(ChatbotSession::class);
    }

    public function exercices()
    {
           return $this->belongsToMany(Exercice::class);
    }

    public function getJWTIdentifier()
    {
        return $this->getKey(); // Typically the user's primary key (e.g., `id`)
    }
    
    
    /**
     * Get the custom claims for the JWT.
     *
     * @return array
     */
    public function getJWTCustomClaims()
    {
        return []; // Additional claims if needed
    }
    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
        ];
    }
}
