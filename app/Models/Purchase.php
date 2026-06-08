<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Purchase extends Model
{
    use HasFactory;
    protected $guarded = [];

    public function product()
{
    return $this->belongsTo(Product::class);
}

public function preparedBy()
{
    return $this->belongsTo(User::class, 'prepared_by');
}


public function returns()
{
    return $this->hasMany(Purchase_return::class);
}


public function stockManages()
{
    return $this->hasMany(StockManage::class);
}

public function sale()
{
    return $this->hasOne(Sale::class, 'purchase_id');
}

}
