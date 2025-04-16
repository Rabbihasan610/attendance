<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\OfficeHoliday;
use Illuminate\Http\Request;

class OfficeHolyDayController extends Controller
{
    public function index(Request $request)
    {
        $items = OfficeHoliday::get();

        return view('admin.office_holyday.index', compact('items'));
    }

    public function create()
    {
        return view('admin.office_holiday.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'title' => "required|string|max:191",
            'start_date' => "required|date",
            "end_date" => "required|date",
            "holiday_type" => "required|unique:office_holidays,holiday_type"
        ]);

        $item = OfficeHoliday::create([
            'title' => $request->title,
            'start_date' => $request->start_date,
            'end_date' => $request->end_date,
            'holiday_type' => $request->holiday_type,
            'entry_user_id' => auth()->user()->id,
            'note' => $request->note
        ]);

        return redirect()->route('officeholiday.index');
    }
}
