<?php

namespace App\Models;


use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class ChatbotSession extends Model
{
    /** @use HasFactory<\Database\Factories\ChatbotSessionFactory> */
    use HasFactory;
    use softDeletes;
}
