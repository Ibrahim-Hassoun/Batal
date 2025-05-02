<?php

namespace App\Http\Requests\GymRequests;

use App\Models\Gym;
use Illuminate\Foundation\Http\FormRequest;
use App\Http\Requests\RootRequest;

class GymManipulationAuthorizationRequest extends RootRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        $gymId = $this->input('id');
        $gym = Gym::find($gymId);
        if($gym && $gym->owner_id == $this->user()->id){
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
