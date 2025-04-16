<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Teacher Monthly Attendance Report</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            font-size: 12px;
            padding: 20px;
            margin: 0;
        }

        h2 {
            text-align: center;
            margin-bottom: 10px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            page-break-inside: auto;
        }

        th, td {
            border: 1px solid #000;
            padding: 3px;
            text-align: center;
        }

        th {
            background-color: #f0f0f0;
        }

        @media print {
            body {
                margin: 0;
            }
        }
    </style>
</head>
<body onload="window.print()">

    <h2>Teacher Monthly Attendance Report</h2>
    <p><strong>Month:</strong> {{ \Carbon\Carbon::parse($month)->format('F Y') }}</p>

    <table>
        <thead>
            <tr>
                <th>Teacher</th>
                @php
                    $date = \Carbon\Carbon::parse($month)->startOfMonth();
                    $end = \Carbon\Carbon::parse($month)->endOfMonth();
                @endphp
                @while ($date <= $end)
                    <th>{{ $date->format('d') }}</th>
                    @php $date->addDay(); @endphp
                @endwhile
            </tr>
        </thead>
        <tbody>
            @foreach($report as $entry)
                <tr>
                    <td>{{ $entry['teacher']->name }}</td>
                    @php
                        $date = \Carbon\Carbon::parse($month)->startOfMonth();
                        $end = \Carbon\Carbon::parse($month)->endOfMonth();
                    @endphp
                    @while ($date <= $end)
                        @php
                            $formatted = $date->format('Y-m-d');
                            $status = $entry['attendance'][$formatted] ?? '-';
                        @endphp
                        <td>{{ $status }}</td>
                        @php $date->addDay(); @endphp
                    @endwhile
                </tr>
            @endforeach
        </tbody>
    </table>

    <div style="margin-top: 10px">
        Printed on: {{ now()->format('d M, Y H:i A') }}
    </div>
</body>
</html>
