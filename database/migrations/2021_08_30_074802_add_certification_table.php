<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddCertificationTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('certification_history', function (Blueprint $table) {
            $table->increments('cert_id');
            $table->integer('employee_id')->unsigned();
            $table->integer('class_id')->unsigned();
            $table->date('date_start');
            $table->date('date_end');
            $table->string('cert_desc', 100);
            $table->string('cert_pass', 25);
            $table->tinyInteger('final_mark');
            $table->string('publication_no', 25)->nullable();
            $table->string('subgroup_name', 10);
            $table->string('personel_area', 25);
            $table->timestamps();
            $table->softDeletes();
            $table->integer('created_by')->nullable();
            $table->integer('updated_by')->nullable();
            $table->integer('deleted_by')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('certification_history');
    }
}
