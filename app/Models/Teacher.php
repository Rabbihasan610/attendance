<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Teacher extends Model
{
    //

    public function attendances()
    {
        return $this->hasMany(TeacherAttendance::class);
    }
}
