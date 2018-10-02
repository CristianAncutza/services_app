<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateOfertaTable extends Migration {

	public function up()
	{
		Schema::create('oferta', function(Blueprint $table) {
			$table->increments('id');
			$table->timestamps();
			$table->softDeletes();
			$table->integer('id_postulante')->unsigned();
			$table->integer('id_categoria')->unsigned();
		});
	}

	public function down()
	{
		Schema::drop('oferta');
	}
}