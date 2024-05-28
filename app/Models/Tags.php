<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Model\Posts;

class Tags extends Model
{
    use HasFactory;
    function posts()
    {
        return $this->belongsToMany(Posts::class);
    }
}
