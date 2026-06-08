<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    
    public function up(): void
    {
    Schema::create('purchases', function (Blueprint $table) {
    $table->id();
    $table->foreignId('product_id')->constrained()->onDelete('cascade');
    $table->string('barcode');
    $table->string('brand');
    $table->string('model')->nullable();
    $table->decimal('price', 10, 2)->nullable();
    $table->string('color');
    $table->string('variant');
    $table->string('battery_health');
    $table->string('branch');
    $table->string('memo');
    $table->string('month'); //this is used as date
    $table->string('supplier_name');
    $table->string('contact_number');
    $table->string('nid_number'); 
    $table->string('condition')->nullable();
    $table->string('ram')->nullable();
    $table->string('rom')->nullable();
    $table->string('box')->nullable();
    $table->string('imei')->nullable();
    $table->integer('quantity');
    $table->integer('available_stock')->default(0);  
    $table->decimal('salesPrice', 10, 2)->nullable(); 
    $table->string('status')->default('pending'); 
    $table->string('nid_image');     
    $table->string('memo_image')->nullable();
    $table->foreignId('prepared_by')->constrained('users')->cascadeOnDelete();
    $table->timestamps();
});
    }

    public function down(): void
    {
        Schema::dropIfExists('purchases');
    }

};


