<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Sale extends Model
{
    use HasFactory;

    protected $guarded = [];

  public function customer()
{
    return $this->belongsTo(Customer::class);
}

public function preparedBy()
{
    return $this->belongsTo(User::class, 'prepared_by');
}



public function items()
{
    return $this->hasMany(SalesItem::class, 'sale_id');
}
}