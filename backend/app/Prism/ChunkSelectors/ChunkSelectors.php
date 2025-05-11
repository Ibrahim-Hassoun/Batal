<?php 

namespace App\Prism\ChunkSelectors;

use App\Prism\PrismHelper;
use Prism\Prism\Schema\EnumSchema;
use Prism\Prism\Schema\ArraySchema;
use Prism\Prism\Schema\ObjectSchema;

class ChunkSelectors {

    public static function makeChunkSelector( $chunks){
        return PrismHelper::buildSchema( 
                'chunk_selector',
                'Schema for selecting relevant context chunks',
            [
                new ArraySchema(
                    name: 'selected_chunks',
                    description: 'Most relevant user info chunks for this question',
                    items: new EnumSchema(
                        name: 'chunk_item',
                        description: 'Individual chunk selection',
                        options: 
                            $chunks
                        )
                    )
                ],
                ['selected_chunks']
            );
    }

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