<?php

namespace App\Models;

use App\Models\ChatbotMessage;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;


class ChatbotSession extends Model
{
    /** @use HasFactory<\Database\Factories\ChatbotSessionFactory> */
    use HasFactory;
    use softDeletes;

    protected $fillable = [
        'user_id',
        'external_session_id',
    ];

    public function ChatbotMessages()
    {
        return $this->hasMany(ChatbotMessage::class);
    }
}
