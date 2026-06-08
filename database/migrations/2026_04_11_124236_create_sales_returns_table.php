<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    
    public function up(): void
    {
        Schema::create('sales_returns', function (Blueprint $table) {
            $table->id();
            $table->foreignId('sale_id')->constrained()->cascadeOnDelete();
            $table->foreignId('product_id')->constrained()->cascadeOnDelete();
            $table->foreignId('purchase_id')->nullable()->constrained()->nullOnDelete();
            $table->foreignId('customer_id')->constrained()->cascadeOnDelete();
            $table->string('brand');
            $table->string('color');
            $table->string('variant')->nullable();
            $table->string('battery_health')->nullable();
            $table->string('condition')->nullable();
            $table->string('ram')->nullable();
            $table->string('rom')->nullable();
            $table->string('box')->nullable();
            $table->string('imei')->nullable()->unique();
            $table->string('branch')->nullable();
            $table->string('customer_phone')->nullable();
            $table->decimal('grand_total', 10, 2);
            $table->integer('quantity');
            $table->integer('available_stock')->nullable();
            $table->date('buy_date');
            $table->text('note')->nullable();
            $table->foreignId('prepared_by')->constrained('users')->cascadeOnDelete();
            $table->index('sale_id');
            $table->index('product_id');
            $table->index('purchase_id');
            $table->index('customer_id');
            $table->timestamps();
        });
    }
    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('sales_returns');
    }
};
