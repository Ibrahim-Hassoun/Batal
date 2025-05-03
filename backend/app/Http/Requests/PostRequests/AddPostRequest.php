<?php

namespace App\Http\Requests\PostRequests;

use App\Http\Requests\RootRequest;
use Illuminate\Foundation\Http\FormRequest;

class AddPostRequest extends RootRequest
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
           'description' => 'present|nullable|string|max:255',
            'image_path' => 'present|nullable|string|max:255',
            'scheduled_at' => 'present|nullable|date|after:now',
        ];
    }
}
