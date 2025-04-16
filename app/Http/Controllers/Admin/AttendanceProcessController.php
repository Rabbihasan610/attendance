<?php

namespace App\Http\Controllers\Admin;

use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use App\Models\TeacherAttendance;
use App\Traits\ProcessAttendance;
use App\Http\Controllers\Controller;

class AttendanceProcessController extends Controller
{
    use ProcessAttendance;

    public function index(Request $request){


        $year = $request->year;

        $month = $request->month;

        $date = "{$year}-{$month}-01";


        $teacher_id = $request->filled('teacher_id') ? $request->teacher_id : null;


        $attendanceData = $this->attendance($date, $teacher_id);

        $this->processAttendanceData($attendanceData, $year, $month);


        return view('admin.attendance-process.index', compact('attendanceData', 'year', 'date', 'month','teacher_id'));

    }

    public function print(Request $request){

        $year = $request->year;

        $month = $request->month;

        $date = "{$year}-{$month}-01";


        $teacher_id = $request->filled('teacher_id') ? $request->teacher_id : null;


        $attendanceData = $this->attendance($date, $teacher_id);

        return view('admin.attendance-process.print', compact('attendanceData', 'date', 'year', 'month', 'teacher_id'));
    }


    public function store(Request $request)
    {

        $request->validate([
            'attendance' => 'required|array',
            'attendance.*.teacher_id' => 'required|integer',
            'attendance.*.year' => 'required|integer',
            'attendance.*.month' => 'required|integer',
            'attendance.*.date' => 'required|array',
            'attendance.*.status' => 'required|array',
        ],[
            'attendance.*.teacher_id.required' => 'Teacher ID is required.',
            'attendance.*.year.required' => 'Year is required.',
            'attendance.*.month.required' => 'Month is required.',
            'attendance.*.date.required' => 'Date is required.',
            'attendance.*.status.required' => 'Attendance is required.',
        ]);

        try {
            foreach ($request->attendance as $entry) {
                foreach ($entry['date'] as $i => $day) {
                    $date = sprintf('%04d-%02d-%02d', $entry['year'], $entry['month'], $day);
                    $status = $entry['status'][$i];

                    TeacherAttendance::updateOrCreate(
                        [
                            'teacher_id' => $entry['teacher_id'],
                            'date' => $date,
                        ],
                        [
                            'attendance' => $status,
                        ]
                    );
                }
            }

            return redirect()->back()->with('success', 'Attendance processed successfully.');
        } catch (Exception $e) {
            return redirect()->back()->with('error', 'Error processing attendance: ' . $e->getMessage());
        }
    }
}
