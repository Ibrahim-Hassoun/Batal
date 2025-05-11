<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use App\Models\Log;
use App\Models\Post;
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
        'first_name',
        'last_name',
        'date_of_birth',
        'username',
        'email',
        'password',
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

    public function posts()
    {
        return $this->hasMany(Post::class);
    }

    public function chatbotSessions()
    {
        return $this->hasOne(ChatbotSession::class);
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
