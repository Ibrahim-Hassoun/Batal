<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Exercice extends Model
{
    /** @use HasFactory<\Database\Factories\ExerciceFactory> */
    use HasFactory;

    protected $casts = [
    'tags' => 'array',
];

    protected $fillable = [
        'area',
        'muscle',
        'exercice',
        'description',
        'difficulty',
        'equipment',
        'type',
        'duration',
        'image_url',
        'video_url',
        'tags'
    ];

    public function getRouteKeyName()
    {
        return 'exercice';
    }

    public function exercice()
    {
        return $this->belongsTo(Exercice::class);
    }
}
