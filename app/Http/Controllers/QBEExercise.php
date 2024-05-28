<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use DB;

class QBEExercise extends Controller
{
    fuction read(){

       $users = DB::table('user')->get;
    }
    
}
