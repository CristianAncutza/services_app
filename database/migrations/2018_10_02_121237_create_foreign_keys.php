<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Eloquent\Model;

class CreateForeignKeys extends Migration {

	public function up()
	{
		Schema::table('oferta', function(Blueprint $table) {
			$table->foreign('id_postulante')->references('id')->on('postulante')
						->onDelete('restrict')
						->onUpdate('restrict');
		});
		Schema::table('oferta', function(Blueprint $table) {
			$table->foreign('id_categoria')->references('id')->on('categoria')
						->onDelete('restrict')
						->onUpdate('restrict');
		});
		Schema::table('postulacion', function(Blueprint $table) {
			$table->foreign('id_postulante')->references('id')->on('postulante')
						->onDelete('restrict')
						->onUpdate('restrict');
		});
		Schema::table('postulacion', function(Blueprint $table) {
			$table->foreign('id_contratante')->references('id')->on('contratante')
						->onDelete('restrict')
						->onUpdate('restrict');
		});
	}

	public function down()
	{
		Schema::table('oferta', function(Blueprint $table) {
			$table->dropForeign('oferta_id_postulante_foreign');
		});
		Schema::table('oferta', function(Blueprint $table) {
			$table->dropForeign('oferta_id_categoria_foreign');
		});
		Schema::table('postulacion', function(Blueprint $table) {
			$table->dropForeign('postulacion_id_postulante_foreign');
		});
		Schema::table('postulacion', function(Blueprint $table) {
			$table->dropForeign('postulacion_id_contratante_foreign');
		});
	}
}