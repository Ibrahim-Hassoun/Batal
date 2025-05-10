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
       Schema::create('exercices', function (Blueprint $table) {
            $table->id();
            $table->string('area');                      
            $table->string('muscle');                   
            $table->string('exercice');                 
            $table->text('description')->nullable();   
            $table->integer('difficulty')->default(1);   
            $table->string('equipment')->nullable();    
            $table->string('type')->nullable();         
            $table->integer('duration')->nullable();    
            $table->string('image_url')->nullable();     
            $table->string('video_url')->nullable();     
            $table->json('tags')->nullable();            
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('exercices');
    }
};
