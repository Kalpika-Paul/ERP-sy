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
    Schema::create('purchase_returns', function (Blueprint $table) {
    $table->id();
    $table->foreignId('purchase_id')->nullable()->constrained()->nullOnDelete();
    $table->foreignId('product_id')->constrained()->onDelete('cascade');
    $table->string('barcode');
    $table->string('brand');
    $table->string('model')->nullable();
    $table->decimal('price', 10, 2)->nullable();
    $table->decimal('return_price', 10, 2)->nullable();
    $table->string('color');
    $table->string('variant');
    $table->string('battery_health');
    $table->string('branch');
    $table->string('memo');
    $table->string('date');
    $table->string('supplier_name');
    $table->string('contact_number');
    $table->string('nid_number');
    $table->string('condition');
    $table->string('ram');
    $table->string('rom');
    $table->string('box');
    $table->string('imei');
    $table->integer('quantity');
    $table->integer('available_stock')->default(0);
    $table->decimal('salesPrice', 10, 2)->nullable();
    $table->string('status')->default('pending');
    $table->string('nid_image');
    $table->string('memo_image')->nullable();
    $table->text('note')->nullable();
    $table->foreignId('prepared_by')->constrained('users')->cascadeOnDelete();
    $table->foreignId('returned_by')->nullable()->constrained('users')->nullOnDelete();
    $table->timestamp('returned_at')->nullable();
    $table->timestamps();
});
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('purchase_returns');
    }
};

