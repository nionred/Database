<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Profiles;
use App\Models\Posts;

class User extends Model
{
    use HasFactory;

    function profiles()
    {
        return $this->hasOne(Profiles::class);
    }
    function post()
    {
        return $this->hasMany(Posts::class);
    }
}
