<?php

namespace App\Http\Requests\PostRequests;

use App\Http\Requests\RootRequest;
use Illuminate\Foundation\Http\FormRequest;

class AddReactionRequest extends RootRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    // public function authorize(): bool
    // {
    //     return false;
    // }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'post_id' => 'required|integer|exists:posts,id',
            'type' => 'required|string|in:like,love,fire,angry',
        ];
    }
}
