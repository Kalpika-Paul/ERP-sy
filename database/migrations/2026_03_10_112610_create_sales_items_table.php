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

        Schema::create('sales_items', function (Blueprint $table) {

            $table->bigIncrements('id');
            $table->foreignId('sale_id')->constrained()->cascadeOnDelete();
            $table->foreignId('purchase_id')->constrained()->cascadeOnDelete();
            $table->foreignId('product_id')->constrained()->cascadeOnDelete();
            $table->string('brand');
            $table->string('model')->nullable();
            $table->string('variant')->nullable();
            $table->string('ram')->nullable();
            $table->string('rom')->nullable();
            $table->string('color')->nullable();
            $table->string('imei')->nullable();
            $table->string('battery_health')->nullable();
            $table->integer('quantity');
            $table->decimal('price', 10, 2);
            $table->decimal('custom_price', 10, 2)->nullable();
            $table->decimal('subtotal', 10, 2);
            $table->string('status')->default('sold'); 
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */

    public function down(): void
    {
        Schema::dropIfExists('sales_items');
    }
};
