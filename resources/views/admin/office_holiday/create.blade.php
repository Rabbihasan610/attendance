@extends('layouts.app')

@section('content')

<div class="main">
    <div class="card">
         <div class="card-header d-flex justify-content-between">
            <h3>Office Holidays</h3>
            <a href="{{ route('officeholiday.index') }}" class="btn btn-primary">
                <span><i class="fas fa-plus"></i></span>
                List
            </a>
         </div>
         <div class="card-body">
            <form action="{{ route('officeholiday.store') }}" method="POST" enctype="multipart/form-data" class="dropzone" id="my-awesome-dropzone" data-url="{{ route('officeholiday.store') }}">
                @csrf
                <div class="row">
                    <div class="col-12 col-md-6">
                        <div class="form-group my-3">
                            <label for="title" class="mb-2">{{ __('Title')}}</label>
                            <input
                               type="text"
                               class="form-control"
                               name="title" value="{{ old('title', @$item->title) }}" id="title" placeholder="{{ __('Enter title') }}" required
                           />
                           @error('title')
                           <span>{{ $message }}</span>
                           @enderror
                       </div>
                    </div>

                    <div class="col-12 col-md-6">
                        <div class="form-group my-3">
                            <label for="start_date" class="mb-2">{{ __('Start date')}}</label>
                            <input
                               type="date"
                               class="form-control"
                               name="start_date" value="{{ old('start_date', @$item->start_date) }}" id="start_date"  required
                           />
                           @error('start_date')
                           <span>{{ $message }}</span>
                           @enderror
                       </div>
                    </div>

                    <div class="col-12 col-md-6">
                        <div class="form-group my-3">
                            <label for="end_date" class="mb-2">{{ __('End date')}}</label>
                            <input
                               type="date"
                               class="form-control"
                               name="end_date" value="{{ old('end_date', @$item->end_date) }}" id="end_date"  required
                           />
                           @error('end_date')
                           <span>{{ $message }}</span>
                           @enderror
                       </div>
                    </div>

                    <div class="col-12 col-md-6">
                        <div class="form-group my-3">
                            <label for="holiday_type" class="mb-2">{{ __('Type')}}</label>
                            <input
                               type="text"
                               class="form-control"
                               name="holiday_type" value="{{ old('holiday_type', @$item->holiday_type) }}" id="holiday_type"  required
                           />
                           @error('holiday_type')
                           <span>{{ $message }}</span>
                           @enderror
                       </div>
                    </div>

                    <div class="col-12 col-md-12">
                        <div class="form-group my-3">
                            <label for="note" class="mb-2">{{ __('Note')}}</label>
                            <input
                               type="text"
                               class="form-control"
                               name="note" value="{{ old('note', @$item->note) }}" id="note"  required
                           />
                           @error('note')
                           <span>{{ $message }}</span>
                           @enderror
                       </div>
                    </div>

                    <div class="col-12 col-md-12">
                        <div class="form-group my-3">
                            <button type="submit" class="btn btn-primary">
                                Save
                            </button>
                        </div>
                    </div>
                </div>
            </form>
         </div>
    </div>
</div>

@endsection
