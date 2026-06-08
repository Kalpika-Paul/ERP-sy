<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SalesItem extends Model
{
    use HasFactory;

    protected $guarded = [];
    
    
    public function sale()
    {
        return $this->belongsTo(Sale::class);
    }

    public function product()
    {
        return $this->belongsTo(Product::class);
    }
    public function purchase()
{
    return $this->belongsTo(Purchase::class, 'purchase_id');
}


public function return()
{
    return $this->hasOne(Sales_return::class, 'sale_id', 'sale_id');
}


}
