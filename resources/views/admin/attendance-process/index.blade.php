@extends('layouts.app')

@push('css')
<style>
    .report-header {
        text-align: center;
        margin-bottom: 30px;
    }

    .attendance-table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 30px;
    }

    .attendance-table th,
    .attendance-table td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: center;
    }

    .attendance-table th {
        background-color: #f2f2f2;
    }

    .status-A { background-color: red; color: white; }
    .status-P { background-color: green; color: white; }
    .status-H { background-color: orange; color: white; }
    .status-W { background-color: blue; color: white; }
    .status-L { background-color: purple; color: white; }
    .status-M { background-color: pink; color: black; }
    .status-S { background-color: yellow; color: black; }
    .status-n { background-color: #f7f4f4; color: #111; }

    .search-form {
        max-width: 800px;
        margin: 0 auto;
    }
</style>
@endpush

@section('content')
<div class="mt-4">

    <div class="card">
        <div class="card-header d-flex justify-content-between align-items-center">
            <h4>Process Attendance</h4>
        </div>

        <div class="card-body">
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



            <div class="report-header">
                <h2>Attendance Report</h2>
                <p>Year: {{ $year }}</p>
                <p>Month: {{ date('F', strtotime($date)) }}</p>
            </div>

            <div class="search-form bg-light p-4 rounded mb-4">
                <form method="GET">
                    <div class="row g-3">
                        <div class="col-md-4">
                            <label for="year" class="form-label">@lang('Year')</label>
                            <select class="form-select" name="year" id="year">
                                @foreach (range(date('Y'), 2020) as $y)
                                    <option value="{{ $y }}" {{ $year == $y ? 'selected' : '' }}>{{ $y }}</option>
                                @endforeach
                            </select>
                        </div>

                        <div class="col-md-4">
                            <label for="month" class="form-label">@lang('Month')</label>
                            <select class="form-select" name="month" id="month">
                                @foreach ([
                                    'January', 'February', 'March', 'April', 'May', 'June',
                                    'July', 'August', 'September', 'October', 'November', 'December'
                                ] as $index => $m)
                                    <option value="{{ $index + 1 }}" {{ $month == ($index + 1) ? 'selected' : '' }}>
                                        @lang($m)
                                    </option>
                                @endforeach
                            </select>
                        </div>

                        <div class="col-md-4">
                            <label for="teacher_id" class="form-label">@lang('Teacher')</label>
                            <select class="form-select" name="teacher_id" id="teacher_id">
                                <option value="0">{{ __('Select Teacher') }}</option>
                                @foreach (\App\Models\Teacher::all() as $teacher)
                                    <option value="{{ $teacher->id }}" {{ $teacher_id == $teacher->id ? 'selected' : '' }}>
                                        {{ $teacher->name }}
                                    </option>
                                @endforeach
                            </select>
                        </div>

                        <div class="col-12 text-center mt-3">
                            <button type="submit" class="btn btn-primary w-50">@lang('Process Attendance')</button>
                        </div>
                    </div>
                </form>
            </div>



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


            @if ($attendanceData)
               <div class="d-flex justify-content-center">
                    <button class="btn btn-primary me-3 show-attendance" type="button">Visible Attendance</button>
                    <a href="{{ route('attendance-process.print', ['year' => $year, 'month' => $month, 'teacher_id' => $teacher_id]) }}" class="btn btn-info me-3">Print</a>
                    <a href="{{ route('attendance-process.index') }}" class="btn btn-danger me-3">Clear</a>
               </div>
            @endif

            @if ($attendanceData)
            <div class="attendance-table-container d-none">
                <form action="{{ route('attendance-process.store') }}" method="POST">
                    @csrf
                    <table class="attendance-table table-bordered">
                        <thead>
                            <tr>
                                <th>Employee Name</th>
                                @php $daysInMonth = date('t', strtotime($date)); @endphp
                                @for ($day = 1; $day <= $daysInMonth; $day++)
                                    <th>{{ str_pad($day, 2, '0', STR_PAD_LEFT) }}</th>
                                @endfor
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($attendanceData as $index => $employee)
                                <tr>
                                    <td>
                                        {{ $employee['name'] }}
                                        <input type="hidden" name="attendance[{{ $index }}][teacher_id]" value="{{ $employee['id'] }}">
                                        <input type="hidden" name="attendance[{{ $index }}][year]" value="{{ $year }}">
                                        <input type="hidden" name="attendance[{{ $index }}][month]" value="{{ $month }}">
                                    </td>
                                    @foreach ($employee['attendance'] as $dateKey => $status)
                                        <td class="status-{{ $status }}">
                                            <input type="hidden" name="attendance[{{ $index }}][date][]" value="{{ $dateKey }}">
                                            <input type="hidden" name="attendance[{{ $index }}][status][]" value="{{ $status }}">
                                            {{ $status }}
                                        </td>
                                    @endforeach
                                </tr>
                            @endforeach
                        </tbody>
                    </table>

                    <div class="text-end mt-3">
                        <button type="submit" class="btn btn-success">@lang('Submit')</button>
                    </div>
                </form>
            </div>
            @endif
        </div>
    </div>
</div>
@endsection


@push('js')
    <script>
        $(document).ready(function() {
            $('.show-attendance').click(function() {
                $('.attendance-table-container').toggleClass('d-none');
            });
        });
    </script>
@endpush
