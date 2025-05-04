<?php

namespace App\Http\Requests\JobProfileRequests;

use Illuminate\Foundation\Http\FormRequest;
use App\Http\Requests\JobProfileRequests\JobProfileOwnerShipRequest;


class UpdateJobProfileRequest extends JobProfileOwnerShipRequest
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
            'job_profile_id' => 'required|integer|exists:job_profiles,id',
            'role' => 'nullable|in:trainer,dietitian',
            'job_description' => 'nullable|string',
            'hourly_rate' => 'nullable|numeric|min:0|max:999.99',
            'negotiable' => 'nullable|boolean',
            'years_of_experience' => 'nullable|numeric|min:0|max:99.9',
            'rating' => 'nullable|numeric|min:0|max:5',
            'is_approved' => 'nullable|boolean',
        ];
    }
}
