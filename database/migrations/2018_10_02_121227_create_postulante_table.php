<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreatePostulanteTable extends Migration {

	public function up()
	{
		Schema::create('postulante', function(Blueprint $table) {
			$table->increments('id');
			$table->timestamps();
			$table->softDeletes();
			$table->string('nombre', 200);
			$table->string('apellido', 200);
			$table->bigInteger('dni');
			$table->string('mail', 200);
			$table->string('telefono', 100);
			$table->date('fecha_nacimiento');
			$table->string('direccion', 200);
			$table->string('nacionalidad', 200);
			$table->string('sexo', 100);
		});
	}

	public function down()
	{
		Schema::drop('postulante');
	}
}