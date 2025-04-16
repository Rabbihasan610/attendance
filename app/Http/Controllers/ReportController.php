<?php

namespace App\Http\Controllers;

use DateTime;
use App\Models\Teacher;
use Carbon\CarbonPeriod;
use Illuminate\Http\Request;
use App\Models\OfficeHoliday;
use Illuminate\Support\Carbon;
use App\Models\TeacherAttendance;
use App\Models\TeacherLeaveApplication;
use PHPUnit\Logging\TeamCity\TeamCityLogger;

class ReportController extends Controller
{
    public function index(Request $request)
    {
        $year = $request->filled('year') ? $request->year : now()->year;
        $month = $request->filled('month') ? $request->month : now()->month;
        $date = "{$year}-{$month}-01";

        $teacher_id = $request->filled('teacher_id') ? $request->teacher_id : null;

        $attendanceData = TeacherAttendance::query()
            ->select(['teacher_id', 'date', 'attendance'])
            ->whereYear('date', $year)
            ->whereMonth('date', $month)
            ->with('teacher')
            ->where('teacher_id', $teacher_id)
            ->get()
            ->groupBy('teacher_id');

        return view('admin.report.index', compact('attendanceData', 'year', 'date', 'month', 'teacher_id'));
    }


    public function update(Request $request, $teacherId)
    {
        $rawAttendance = $request->attendance;

        $structured = [];

        for ($i = 0; $i < count($rawAttendance) - 1; $i++) {
            $current = $rawAttendance[$i];
            $next = $rawAttendance[$i + 1];

            if (isset($current['status']) && isset($next['date'])) {
                $structured[] = [
                    'status' => $current['status'],
                    'date' => $next['date']
                ];
                $i++;
            }
        }

        $request->merge(['attendance' => $structured]);

        $request->validate([
            'attendance.*.date' => 'required|date',
            'attendance.*.status' => 'required',
        ]);

        foreach ($structured as $entry) {
            TeacherAttendance::updateOrCreate(
                ['teacher_id' => $teacherId, 'date' => $entry['date']],
                ['attendance' => $entry['status']]
            );
        }

        return redirect()->back()->with('success', 'Attendance updated successfully!');
    }


    public function monthlyReport(Request $request)
    {
        $month = $request->input('month', now()->format('Y-m'));

        $start = Carbon::parse($month)->startOfMonth();
        $end = Carbon::parse($month)->endOfMonth();

        $teacher_id = $request->teacher_id;

        $query = Teacher::query()
            ->with(['attendances' => function ($q) use ($start, $end) {
                $q->whereBetween('date', [$start, $end])
                  ->select('teacher_id', 'date', 'attendance');
            }]);

        if($teacher_id){
            $query->where('id', $teacher_id);
        }

        $teachers = $query->get();
        $dates = [];

        $period = \Carbon\CarbonPeriod::create($start, $end);

        foreach ($period as $date) {
            $dates[] = $date->toDateString();
        }


        $report = $teachers->map(function ($teacher) use ($dates) {
            $attendanceMap = $teacher->attendances->keyBy('date');

            $attendance = [];

            foreach ($dates as $date) {
                $attendance[] = $attendanceMap[$date]->attendance ?? '-';
            }

            return [
                'teacher' => $teacher,
                'attendance' => array_combine($dates, $attendance),
            ];
        });

        $return_type = 'blade';
        if ($request->print === 'print') {
            $return_type = 'print';
        }

        return $this->returnType($report, $month, $teacher_id, $return_type);
    }


    protected function returnType($report, $month, $teacher_id, $type = 'blade'){

        if($type === "blade"){
            return view('reports.monthly', [
                'report' => $report,
                'month' => $month,
                'teacher_id' => $teacher_id
            ]);
        }elseif($type === 'print'){
            return view('reports.print', [
                'report' => $report,
                'month' => $month,
                'teacher_id' => $teacher_id
            ]);
        }

    }
}
