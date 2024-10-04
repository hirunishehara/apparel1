<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class category extends Model
{
    use HasFactory;


    
    protected $fillable = [
        'cloth_name',
        'brand_name',
        'description',
        'price',
        'quantity',
    ];
}
