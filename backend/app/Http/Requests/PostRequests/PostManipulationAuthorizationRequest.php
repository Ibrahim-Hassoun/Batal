<?php

namespace App\Http\Requests\PostRequests;

use App\Models\Post;
use App\Http\Requests\RootRequest;
use Illuminate\Foundation\Http\FormRequest;


class PostManipulationAuthorizationRequest extends RootRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        $userId = $this->user()->id;
        $postId = $this->input('id');
        $post = Post::find($postId);
        if ($post && $post->user_id == $userId) {
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
