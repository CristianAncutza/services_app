<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreatePostulacionTable extends Migration {

	public function up()
	{
		Schema::create('postulacion', function(Blueprint $table) {
			$table->increments('id');
			$table->timestamps();
			$table->softDeletes();
			$table->integer('id_postulante')->unsigned();
			$table->integer('id_contratante')->unsigned();
			$table->string('comentario', 200);
		});
	}

	public function down()
	{
		Schema::drop('postulacion');
	}
}