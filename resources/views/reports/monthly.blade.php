@extends('layouts.app')

@section('content')
<div class="p-3 card">
    <div class="flex justify-between items-center mb-4">
        <h2 class="text-xl font-bold">Teacher Monthly Attendance Report</h2>
        <span class="text-sm print:hidden">{{ \Carbon\Carbon::parse($month)->format('F Y') }}</span>
    </div>

    <form method="GET" class="mb-4 flex gap-4 print:hidden">
        <input type="month" name="month" value="{{ $month }}" class="border p-1 rounded" />

        <select name="teacher_id" class="border p-1 rounded">
            <option value="">All Teachers</option>
            @foreach (\App\Models\Teacher::all() as $teacherId => $teacher)
                <option value="{{ $teacher->id }}" {{ $teacher_id == $teacher->id ? 'selected' : '' }}>
                    {{ $teacher->name }}
                </option>
            @endforeach
        </select>

        <button type="submit" class="bg-primary text-white px-4 py-1">Search</button>
        <button type="submit" name="print" value="print" class="bg-primary text-white px-4 py-1">Print</button>
    </form>


    <div class="overflow-auto print:overflow-visible">
        <table class="min-w-full text-sm border border-gray-300 print:w-full print:text-xs">
            <thead class="bg-gray-200 text-gray-700">
                <tr>
                    <th class="border px-2 py-1 text-left">Teacher</th>
                    @foreach(array_keys($report[0]['attendance']) as $day)
                        <th class="border px-2 py-1 text-center">
                            {{ \Carbon\Carbon::parse($day)->format('d') }}
                        </th>
                    @endforeach
                </tr>
            </thead>
            <tbody>
                @foreach($report as $entry)
                    <tr class="hover:bg-gray-100 print:hover:bg-white">
                        <td class="border px-2 py-1 whitespace-nowrap">{{ $entry['teacher']->name }}</td>
                        @foreach($entry['attendance'] as $status)
                            <td class="border px-2 py-1 text-center">{{ $status }}</td>
                        @endforeach
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>

    <div class="mt-4 text-xs text-gray-500 print:block hidden">
        Printed on: {{ now()->format('d M, Y H:i A') }}
    </div>
</div>
@endsection
