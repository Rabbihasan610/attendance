
@extends('layouts.app')

@section('content')

<div class="main">

    <div class="card">
        <div class="card-header d-flex justify-content-between">
            <h3>Office Holidays</h3>
            <a href="{{ route('officeholiday.create') }}" class="btn btn-primary">
                <span><i class="fas fa-plus"></i></span>
                Add New
            </a>
        </div>

        <div class="card-body">
            <div class="table">
                <table class="table table-bordered table-responsive">
                    <thead>
                        <th>
                            {{ __('ID') }}
                        </th>
                        <th>
                            Title
                        </th>
                        <th>
                            Start Date
                        </th>
                        <th>
                            End Date
                        </th>

                        <th>
                           Type
                        </th>

                        <th>
                            Note
                         </th>

                         <th>
                            Status
                         </th>
                         <th>
                            Action
                         </th>
                    </thead>

                    <tbody>
                        @foreach ($items as $item)
                        <tr>
                            <td>
                                {{ $item->id }}
                            </td>
                            <td>
                                {{ $item->title }}
                            </td>
                            <td>
                                {{ $item->start_date }}
                            </td>
                            <td>
                                {{ $item->end_date }}
                            </td>
                            <td>
                                {{ $item->holiday_type }}
                            </td>
                            <td>
                                {{ $item->note }}
                            </td>
                            <td>
                                {{ $item->status }}
                            </td>
                            <td>

                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>


</div>

@endsection
