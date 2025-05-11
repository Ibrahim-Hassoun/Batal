<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ChatbotMessage extends Model
{
    /** @use HasFactory<\Database\Factories\ChatbotMessageFactory> */
    use HasFactory;
    protected $fillable = [
        'chatbot_session_id',
        'role',
        'content',
        'meta',
    ];
}
