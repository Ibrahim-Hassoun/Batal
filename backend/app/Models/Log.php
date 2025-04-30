<?php

namespace App\Models;

use App\Models\User;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;


class Log extends Model
{
    /** @use HasFactory<\Database\Factories\LogFactory> */
    use HasFactory;
    protected $fillable = [
        'user_id',
        'ip_address',
        'action',
        'success',
        'country',
        'province',
        'city',
        'street',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
