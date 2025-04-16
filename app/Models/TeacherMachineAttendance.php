<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class TeacherMachineAttendance extends Model
{
    protected $guarded = [];


    public function teacher()
    {
        return $this->belongsTo(Teacher::class, 'teacher_id', 'id');
    }
}
