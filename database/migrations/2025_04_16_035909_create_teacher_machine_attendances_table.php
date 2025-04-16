<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('teacher_machine_attendances', function (Blueprint $table) {
            $table->id();
            $table->integer('teacher_id')->unsigned();
            $table->string('rfid');
            $table->date('date');
            $table->date('intime');
            $table->date('outtime');
            $table->enum('attendance', ['Present', 'Absent'])->default('Absent');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('teacher_machine_attendances');
    }
};
