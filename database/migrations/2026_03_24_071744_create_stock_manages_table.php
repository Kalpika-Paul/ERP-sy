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
    Schema::create('stock_manages', function (Blueprint $table) {
        
    $table->id();
    $table->foreignId('purchase_id')->constrained()->cascadeOnDelete();
    $table->string('from_branch');
    $table->string('to_branch');
    $table->integer('quantity');
    $table->timestamp('transfer_date')->useCurrent();
    $table->timestamps();
    
    });
    }

    
    public function down(): void
    {
        Schema::dropIfExists('stock_manages');
    }


};
