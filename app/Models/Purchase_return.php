<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Purchase_return extends Model
{
    use HasFactory;

    protected $guarded = [];

    public function purchase()
    {
        return $this->belongsTo(Purchase::class, 'purchase_id');
    }
    public function product()
    {
        return $this->belongsTo(Product::class, 'product_id');
    }
    public function returnedBy()
    {
        return $this->belongsTo(User::class, 'returned_by');
    }

  public function stockManage()
{
    return $this->hasOne(StockManage::class, 'purchase_id', 'purchase_id');
}
    public function preparedByUser()
    {
        return $this->belongsTo(User::class, 'prepared_by');
    }
}
