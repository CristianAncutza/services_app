<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;

class CreateCategoriaTable extends Migration {

	public function up()
	{
		Schema::create('categoria', function(Blueprint $table) {
			$table->increments('id');
			$table->timestamps();
			$table->softDeletes();
			$table->string('descripcion', 200);
		});
	}

	public function down()
	{
		Schema::drop('categoria');
	}
}