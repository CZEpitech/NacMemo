<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FooterDescription extends Model
{
    use HasFactory;

    protected $table = 'footer_descriptions';

    protected $fillable = ['description', 'address', 'phone', 'email'];
}
