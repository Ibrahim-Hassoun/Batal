<?php

namespace App\Http\Requests\GymRequests;

use App\Http\Requests\RootRequest;
use Illuminate\Foundation\Http\FormRequest;


class AddGymRequest extends RootRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
           
            'name' => 'required|string|max:255',
            'description' => 'required|string',
            'logo_path' => 'nullable|string|max:255',
            'estimated_capacity' => 'required|integer|min:1',
            'subscription_price' => 'required|numeric|min:0',
            'current_traffic' => 'nullable|in:low,medium,high',
            'usual_traffic' => 'nullable|in:low,medium,high',
            'opening_hours' => 'required|string',
            'gender' => 'required|in:male,female,mixed',
            'latitude' => 'required|numeric',
            'longitude' => 'required|numeric',
            'phone_number' => 'nullable|string|max:20',
            'email' => 'nullable|email|max:255',
            'website' => 'nullable|url|max:255',
            'is_active' => 'required|boolean',
        ];
    }
}
