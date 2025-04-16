@extends('layouts.app')

@section('content')
<div class="mt-4">

    {{-- Filter Form --}}
    <form method="GET" action="{{ route('report.attendance') }}" class="row g-3 mb-4">
        <div class="col-md-2">
            <select name="year" class="form-control">
                @for ($y = now()->year; $y >= 2020; $y--)
                    <option value="{{ $y }}" {{ $year == $y ? 'selected' : '' }}>{{ $y }}</option>
                @endfor
            </select>
        </div>

        <div class="col-md-2">
            <select name="month" class="form-control">
                @for ($m = 1; $m <= 12; $m++)
                    <option value="{{ $m }}" {{ $month == $m ? 'selected' : '' }}>
                        {{ \Carbon\Carbon::create()->month($m)->format('F') }}
                    </option>
                @endfor
            </select>
        </div>

        <div class="col-md-4">
            <select name="teacher_id" class="form-control">
                <option value="">All Teachers</option>
                @foreach (\App\Models\Teacher::all() as $teacherId => $teacher)
                    <option value="{{ $teacher->id }}" {{ $teacher_id == $teacher->id ? 'selected' : '' }}>
                        {{ $teacher->name }}
                    </option>
                @endforeach
            </select>
        </div>

        <div class="col-md-2">
            <button type="submit" class="btn btn-primary">Search</button>
        </div>
    </form>


    @if (session('success'))
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            <strong>Success:</strong> {{ session('success') }}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    @endif

    @if (session('error'))
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <strong>Error:</strong> {{ session('error') }}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    @endif


    {{-- show validation errror --}}
    @if ($errors->any())
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <strong>Validation Errors:</strong>
            <ul class="mb-0 mt-2">
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    @endif

    @foreach ($attendanceData as $teacherId => $records)
        @php $teacher = $records->first()->teacher ?? null; @endphp
        @if ($teacher)
            <div class="card mb-4">
                <div class="card-header">
                    <strong>{{ $teacher->name }}</strong>
                    <button class="btn btn-sm  float-end" type="button" data-bs-toggle="collapse"
                            data-bs-target="#attendance-{{ $teacherId }}" aria-expanded="false"
                            aria-controls="attendance-{{ $teacherId }}">
                        <i class="bi bi-caret-down-fill"></i> Show Attendance
                    </button>
                </div>
                <div id="attendance-{{ $teacherId }}" class="collapse">
                    <div class="card-body table-responsive">
                        <form method="POST" action="{{ route('attendance.update', $teacherId) }}">
                            @csrf
                            @method('PUT')

                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>Date</th>
                                        <th>Status</th>
                                        <th>Edit</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach ($records as $record)
                                        @if ($record && $record->date)
                                            <tr>
                                                <td>{{ \Carbon\Carbon::parse($record->date)->format('d M Y') }}</td>
                                                <td>
                                                    <select name="attendance[{{ $record->id }}][status]"
                                                            class="form-control">
                                                        <option value="-" {{ $record->attendance == '-' ? 'selected' : '' }}>-</option>
                                                        <option value="A" {{ $record->attendance == 'A' ? 'selected' : '' }}>Absent</option>
                                                        <option value="P" {{ $record->attendance == 'P' ? 'selected' : '' }}>Present</option>
                                                        <option value="L" {{ $record->attendance == 'L' ? 'selected' : '' }}>Leave</option>
                                                        <option value="W" {{ $record->attendance == 'W' ? 'selected' : '' }}>Weekend</option>
                                                        @foreach (\App\Models\OfficeHoliday::where('status', 'Approved')->get() as $ofhd)
                                                        <option value="{{ $ofhd->holiday_type }}" {{ $record->attendance == $ofhd->holiday_type ? 'selected' : '' }}>
                                                            {{ $ofhd->title }}({{ $ofhd->holiday_type }})
                                                        </option>
                                                        @endforeach
                                                    </select>
                                                </td>
                                                <td>
                                                    <input type="hidden" name="attendance[{{ $record->id }}][date]"
                                                           value="{{ $record->date }}">
                                                    <button type="submit" class="btn btn-success btn-sm">Update</button>
                                                </td>
                                            </tr>
                                        @endif
                                    @endforeach
                                </tbody>
                            </table>
                        </form>
                    </div>
                </div>
            </div>
        @endif
    @endforeach
</div>
@endsection
