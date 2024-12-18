<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ItemAdditionalImage extends Model
{
    protected $fillable = ['item_id', 'filename'];

    public function item()
    {
        return $this->belongsTo(Item::class);
    }
}
