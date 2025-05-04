<?php

namespace App\Http\Requests\JobProfileRequests;

use App\Models\JobProfile;
use App\Http\Requests\RootRequest;
use Illuminate\Foundation\Http\FormRequest;


class JobProfileManipulationAuthorizationRequest extends RootRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        $userId = auth()->user()->id;
        $jobProfileId = $this->input('job_profile_id');
        $jobProfile = JobProfile::find($jobProfileId);
        if($jobProfile && $jobProfile->user_id == $userId ){
            return true;
        }
        return false;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            //
        ];
    }
}
