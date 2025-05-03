<?php

namespace App\Http\Requests\PostRequests;

use Illuminate\Foundation\Http\FormRequest;
use App\Http\Requests\PostRequests\PostManipulationAuthorizationRequest;

class UpdatePostRequest extends PostManipulationAuthorizationRequest
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
            'id' => 'required|integer|exists:posts,id',
            'description' => 'present|nullable|string|max:255',
            'image_path' => 'present|nullable|string',
            'reactions' => 'required|integer|min:0',
            'comments' => 'required|integer|min:0',
            'shares' => 'required|integer|min:0',
            'impressions_count' => 'required|integer|min:0',
            'followers_brought' => 'required|integer|min:0',
            'profile_visits' => 'required|integer|min:0',
            'reach' => 'required|integer|min:0',
            'scheduled_at' => 'present|date|after:now',
        ];
    }
}
