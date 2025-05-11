<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;


class ChatbotMessage extends Model
{
    /** @use HasFactory<\Database\Factories\ChatbotMessageFactory> */
    use SoftDeletes;
    use HasFactory;
    
    protected $fillable = [
        'chatbot_session_id',
        'role',
        'content',
        'meta',
    ];
}
