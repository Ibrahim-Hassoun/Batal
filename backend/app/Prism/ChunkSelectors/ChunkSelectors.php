<?php 

namespace App\Prism\ChunkSelectors;

class ChunkSelectors {

    public static function getUserChunks(){
        return [
                        'id',
                        'username',
                        'phone_number',
                        'bio',
                        'profile_photo_path',
                        'first_name',
                        'last_name',
                        'is_completed',
                        'completed_at',
                        'is_verified',
                        'verified_at',
                        'email',
                        'email_verified_at',
                        'password',
                        'date_of_birth',
                        'location_of_birth',
                        'role',
                        'country',
                        'province',
                        'city',
                        'street',
                        'followers_count',
                        'following_count',
                        'gym_location',
                        'streak',
                        'coins',
                        'sets',
                        'current_xp',
                        'total_xp',
                        'trophies_count',
                        'last_login_at',
                        'last_login_ip',
                        
                        'fitness_level',
                        'fitness_goal',
                        'fitness_interests',
                        'injuries',
                        'medical_conditions',
                        'allergies',
                        'dietary_preferences',
                        'dietary_restrictions',
                        'fitness_equipment',
                        'fitness_experience'
        ];
    }
}