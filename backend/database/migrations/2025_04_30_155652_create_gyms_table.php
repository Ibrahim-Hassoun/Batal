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
        Schema::create('gyms', function (Blueprint $table) {
            $table->id();
            $table->foreignId('owner_id')->constrained('users')->onDelete('cascade');
            $table->string('name');
            $table->string('description');
            $table->string('logo_path')->nullable();
            $table->integer('estimated_capacity');
            $table->integer('subscription_price');
            $table->enum('current_traffic', ['low', 'medium', 'high'])->nullable();
            $table->enum('usual_traffic', ['low', 'medium', 'high'])->nullable();
            $table->json('opening_hours')->nullable();
            $table->enum('gender', ['male', 'female','mixed']);
            $table->decimal('latitude', 10, 8);
            $table->decimal('longitude', 11, 8);
            $table->string('phone_number');
            $table->string('email');
            $table->string('website')->nullable();
            $table->boolean('is_active')->default(true);
            $table->timestamps();
            $table->softDeletes(); 


            $table->index('name');  
            $table->index(['latitude', 'longitude']);

        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('gyms');
    }
};
