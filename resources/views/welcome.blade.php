<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Laravel</title>

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.bunny.net">
    <link href="https://fonts.bunny.net/css?family=figtree:400,500,600&display=swap" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style>
        .report-header {
            text-align: center;
            margin-bottom: 20px;
        }

        .attendance-table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 50px;
        }

        th,
        td {
            border: 1px solid black;
            padding: 8px;
            text-align: center;
        }

        th {
            background-color:
                #f2f2f2;
        }

        .meaning_off_status {
            width: 300px;
            font-size: 8px;
            margin: 0;
            position: absolute;
            top: 0px;
        }

        .stable {
            width: 100%;
            border-collapse: collapse;
            margin: 10px 0;
            background-color: #fff;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .stable th,
        .stable td {
            padding: 5px 5px;
            text-align: left;
            border: 1px solid #ddd;
        }

        .stable th {
            background-color: #4CAF50;
            color: white;
        }

        .stable td {
            color: black;
        }

        .stable td.status-Absent {
            background-color: red;
            color: white;
        }

        .stable td.status-Present {
            background-color: green;
            color: white;
        }

        .stable td.status-Holiday {
            background-color: orange;
            color: white;
        }

        .stable td.status-Weekend {
            background-color: blue;
            color: white;
        }

        .stable td.status-Leave {
            background-color: purple;
            color: white;
        }

        .stable td.status-Medical_leave {
            background-color: pink;
            color: black;
        }

        .stable td.status-Short_leave {
            background-color: yellow;
            color: black;
        }

        .stable td.status-Late {
            background-color: gray;
            color: white;
        }

        .stable td.status-n {
            background-color: rgb(247, 244, 244);
            color: rgb(17, 16, 16);
        }

        .search-form {
            width: 500px;
            margin: 0 auto;
        }
    </style>
</head>

<body class="font-sans antialiased dark:bg-black dark:text-white/50">
    <div class="card">
        <div class="report-header">
            <h2>Attendance Report</h2>
            <p>Year: {{ $year }}</p>
            <p>Month: {{ date('F', strtotime($date)) }}</p>
            <div class="search-form shadow p-3">
                <form action="" method="GET">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="year">@lang('Year')</label>
                                <select class="form-select" name="year" id="year">
                                    @foreach (range(date('Y'), 2020) as $year)
                                        <option value="{{ $year }}">{{ $year }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="month">@lang('Month')</label>
                                <select class="form-select" name="month" id="month">
                                    @foreach (['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'] as $index => $month)
                                        <option value="{{ $index + 1 }}"
                                            {{ date('n') == $index + 1 ? 'selected' : '' }}>
                                            @lang($month)
                                        </option>
                                    @endforeach
                                </select>
                            </div>
                        </div>


                        <div class="col-md-4">
                            <div class="form-group d-flex align-items-end mt-4">
                                <button type="submit" class="btn btn-primary w-100">@lang('Search')</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>

        </div>

        <table class="attendance-table">
            <thead>
                <tr>
                    <th>Employee Name</th>
                    @php
                        $daysInMonth = date('t', strtotime($date));
                    @endphp

                    @for ($day = 1; $day <= $daysInMonth; $day++)
                        <th>{{ str_pad($day, 2, '0', STR_PAD_LEFT) }}</th>
                    @endfor

                </tr>
            </thead>
            <tbody>
                @foreach ($attendanceData as $employee)
                    <tr>
                        <td>{{ $employee['name'] }}</td>
                        @foreach ($employee['attendance'] as $status)
                            <td style="background-color: {{ $status == 'A' ? 'red' : '' }}">
                                <span style="color: {{ $status == 'A' ? '#FFF' : '#000' }}">{{ $status }}</span>
                            </td>
                        @endforeach
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous">
    </script>
</body>
</body>

</html>
