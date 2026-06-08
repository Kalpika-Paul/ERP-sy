<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Sales_return extends Model
{
    use HasFactory;

    protected $guarded = [];
    public function product()
{
    return $this->belongsTo(Product::class);
}

public function preparedByUser()
{
    return $this->belongsTo(User::class, 'prepared_by');
}



}
