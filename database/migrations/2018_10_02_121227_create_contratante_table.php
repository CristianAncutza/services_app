<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateContratanteTable extends Migration {

	public function up()
	{
		Schema::create('contratante', function(Blueprint $table) {
			$table->increments('id');
			$table->timestamps();
			$table->softDeletes();
			$table->string('nombre', 200);
			$table->string('apellido', 200);
			$table->string('dni', 200);
			$table->string('sexo', 100);
			$table->string('telefono', 200);
			$table->string('mail', 200);
			$table->string('direccion', 200);
			$table->string('nacionalidad', 200);
			$table->date('fecha_nacimiento');
		});
	}

	public function down()
	{
		Schema::drop('contratante');
	}
}