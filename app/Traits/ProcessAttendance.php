<?php

namespace App\Traits;

use App\Models\AcademicHoliday;
use DateTime;
use App\Models\OfficeHoliday;
use Illuminate\Support\Carbon;
use App\Models\TeacherLeaveApplication;
use App\Models\TeacherMachineAttendance;

trait ProcessAttendance
{
    public function attendance($date, $teacher_id = null)
    {
        $data = [];
        $year = date('Y');
        $month = date('m', strtotime($date)); // date = 2024-11-01
        $daysInMonth = date('t', strtotime("$year-$month-01"));

        if ($teacher_id) {
            $attendanceData = TeacherMachineAttendance::whereYear('date', $year)
                ->whereMonth('date', $month)
                ->where('teacher_id', $teacher_id)
                ->with('teacher')
                ->get()
                ->groupBy('teacher_id');
        } else {
            $attendanceData = TeacherMachineAttendance::whereYear('date', $year)
                ->whereMonth('date', $month)
                ->with('teacher')
                ->get()
                ->groupBy('teacher_id');
        }


        $leaves = TeacherLeaveApplication::where(function ($query) use ($year, $month) {
            $query->whereYear('start_date', $year)
                ->whereMonth('start_date', $month);
        })->orWhere(function ($query) use ($year, $month) {
            $query->whereYear('end_date', $year)
                ->whereMonth('end_date', $month);
        })->get();


        $holidays = OfficeHoliday::whereYear('start_date', $year)
            ->whereMonth('start_date', $month)
            ->orWhere(function ($query) use ($year, $month) {
                $query->whereYear('end_date', $year)
                    ->whereMonth('end_date', $month);
            })->get();

        $academic_holidays = AcademicHoliday::whereYear('start_date', $year)
            ->whereMonth('start_date', $month)
            ->orWhere(function ($query) use ($year, $month) {
                $query->whereYear('end_date', $year)
                    ->whereMonth('end_date', $month);
            })->get();



        foreach ($attendanceData as $teacherId => $attendanceRecords) {
            $teacherName = optional($attendanceRecords->first()->teacher)->name;

            // not defind attendance as 'N'
            $monthlyAttendance = array_fill(1, $daysInMonth, '');

            $currentDay = date('j'); // Current day of the month (1-31)


            for ($day = 1; $day <= $daysInMonth; $day++) {
                $monthlyAttendance[$day] = ($day < $currentDay) ? 'A' : '';
            }

            $daysInMonth = cal_days_in_month(CAL_GREGORIAN, $month, $year);

            for ($day = 1; $day <= $daysInMonth; $day++) {
                $currentDate = "$year-$month-" . str_pad($day, 2, '0', STR_PAD_LEFT);
                $dayOfWeek = date('w', strtotime($currentDate)); // 0 (Sunday) to 6 (Saturday)

                if ($dayOfWeek == 5) {
                    // Friday (5)
                    $monthlyAttendance[$day] = 'W';
                }
            }

            //holidays as 'H'
            foreach ($holidays as $holiday) {
                $holidayStart = new DateTime(max("$year-$month-01", $holiday->start_date));
                $holidayEnd = new DateTime(min("$year-$month-$daysInMonth", $holiday->end_date));

                foreach (range(1, $daysInMonth) as $day) {
                    $currentDate = new DateTime("$year-$month-" . str_pad($day, 2, '0', STR_PAD_LEFT));

                    if ($currentDate >= $holidayStart && $currentDate <= $holidayEnd) {
                        $monthlyAttendance[$day] = $holiday->holiday_type ?? 'H';
                    }
                }
            }

            //academic_holidays as 'AC'
            foreach ($academic_holidays as $holiday) {
                $holidayStart = new DateTime(max("$year-$month-01", $holiday->start_date));
                $holidayEnd = new DateTime(min("$year-$month-$daysInMonth", $holiday->end_date));

                foreach (range(1, $daysInMonth) as $day) {
                    $currentDate = new DateTime("$year-$month-" . str_pad($day, 2, '0', STR_PAD_LEFT));

                    if ($currentDate >= $holidayStart && $currentDate <= $holidayEnd) {
                        $monthlyAttendance[$day] = $holiday->title ?? 'AC';
                    }
                }
            }

            foreach ($leaves as $leave) {
                if ($leave->teacher_id == $teacherId) {
                    $leaveStart = Carbon::parse($leave->start_date);
                    $leaveEnd = Carbon::parse($leave->end_date);

                    $monthStart = Carbon::parse("$year-$month-01");
                    $monthEnd = Carbon::parse("$year-$month-$daysInMonth");

                    $effectiveStart = $leaveStart->greaterThanOrEqualTo($monthStart) ? $leaveStart : $monthStart;
                    $effectiveEnd = $leaveEnd->lessThanOrEqualTo($monthEnd) ? $leaveEnd : $monthEnd;

                    // leave as 'L'
                    foreach (range(1, $daysInMonth) as $day) {
                        $currentDate = Carbon::parse("$year-$month-$day");

                        if ($currentDate->between($effectiveStart, $effectiveEnd)) {
                            $monthlyAttendance[$day] = $leave->leave_type ?? 'L';
                        }
                    }
                }
            }

            foreach ($attendanceRecords as $record) {
                $day = (int) date('j', strtotime($record->date));
                $monthlyAttendance[$day] = $this->attendanceStatus($record->attendance) ?? 'A';
            }



            $data[] = [
                'name' => $teacherName,
                'id' => $teacherId,
                'attendance' => $monthlyAttendance,
            ];
        }

        return $data;
    }

    public function attendanceStatus($status)
    {
        if ($status == 'Present') {
            return 'P';
        } elseif ($status == 'Absent') {
            return 'A';
        } elseif ($status == 'Leave') {
            return 'L';
        } elseif ($status == 'Holiday') {
            return 'H';
        } else {
            return 'A';
        }
    }

}
