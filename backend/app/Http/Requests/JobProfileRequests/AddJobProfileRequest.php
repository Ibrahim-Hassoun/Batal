<?php

namespace App\Http\Requests\JobProfileRequests;

use App\Http\Requests\RootRequest;
use Illuminate\Foundation\Http\FormRequest;


class AddJobProfileRequest extends RootRequest
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
            'role' => 'required|in:trainer,dietitian',
            'job_description' => 'nullable|string',
            'hourly_rate' => 'required|numeric|min:0|max:999.99',
            'negotiable' => 'nullable|boolean',
            'years_of_experience' => 'required|numeric|min:0|max:99.9',
            'rating' => 'nullable|numeric|min:0|max:5',
            'is_approved' => 'nullable|boolean',
        ];
    }
}
