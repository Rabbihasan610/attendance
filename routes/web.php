<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ReportController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\Admin\OfficeHolyDayController;
use App\Http\Controllers\Admin\AttendanceProcessController;

Route::get('/', function () {
    return to_route('login');
});

Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth', 'verified'])->name('dashboard');

Route::middleware('auth')->group(function () {

    Route::resource('officeholiday', OfficeHolyDayController::class);


    Route::get('attendance-process',[AttendanceProcessController::class, 'index'])->name('attendance-process.index');

    Route::post('attendance-process-store', [AttendanceProcessController::class, 'store'])->name('attendance-process.store');


    Route::get('report-attendance', [ReportController::class, 'index'])->name('report.attendance');
    Route::put('/report/update/{teacher}', [ReportController::class, 'update'])->name('attendance.update');

    Route::get('/reports/monthly', [ReportController::class, 'monthlyReport'])->name('report.monthly');

    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';
