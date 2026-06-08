<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('sales', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->foreignId('customer_id')->constrained()->cascadeOnDelete();
            $table->foreignId('prepared_by')->constrained('users')->cascadeOnDelete();
            $table->decimal('sub_total', 10,2);
            $table->decimal('grand_total', 10, 2);
            $table->decimal('discount')->nullable();
            $table->string('payment_method');
            $table->string('account')->nullable();
            $table->json('current_stock')->nullable();
            $table->string('invoice_code')->unique();
            $table->date('date'); 
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('sales');
    }
};


