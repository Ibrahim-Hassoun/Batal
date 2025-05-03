<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('job_profiles', function (Blueprint $table) {
            $table->id();
            $table->foreignId('user_id')->constrained('users')->onDelete('cascade');
            $table->enum('job_type', ['trainer', 'dietitian']);
            $table->string('job_description')->nullable();
            $table->unsignedDecimal('hourly_rate', 5, 2);
            $table->boolean('negotiable')->default(false);
            $table->unsignedDecimal('years_of_experience', 3, 1);
            $table->decimal('rating', 3, 2)->default(0.0);
            $table->boolean('is_approved')->default(false);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('job_profiles');
    }
};
