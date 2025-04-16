<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Attendance Report</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .attendance-table {
            border-collapse: collapse;
            width: 100%;
            font-size: 12px;
        }

        .attendance-table th,
        .attendance-table td {
            border: 1px solid #000;
            padding: 4px;
            text-align: center;
        }

        .attendance-table th {
            background-color: #f0f0f0;
        }

        .status-P {
            background-color: #d4edda;
        }

        .status-A {
            background-color: #f8d7da;
        }

        .status-L {
            background-color: #fff3cd;
        }

        @media print {
            .no-print {
                display: none;
            }
        }
    </style>
</head>
<body>
    <div class="no-print" style="margin-bottom: 15px;">
        <button onclick="window.print()">🖨️ Print Attendance</button>
    </div>

    <h2>Attendance for {{ \Carbon\Carbon::create($year, $month)->format('F Y') }}</h2>

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
                    </td>
                    @foreach ($employee['attendance'] as $dateKey => $status)
                        <td class="status-{{ $status }}">
                            {{ $status }}
                        </td>
                    @endforeach
                </tr>
            @endforeach
        </tbody>
    </table>
</body>
</html>
