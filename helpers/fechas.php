<?php
function get_mes($mes = '')
{
	$meses_completos = [
		'0' => '',
		'1' => 'Enero',
		'2' => 'Febrero',
		'3' => 'Marzo',
		'4' => 'Abril',
		'5' => 'Mayo',
		'6' => 'Junio',
		'7' => 'Julio',
		'8' => 'Agosto',
		'9' => 'Septiembre',
		'10' => 'Octubre',
		'11' => 'Noviembre',
		'12' => 'Diciembre',
		'01' => 'Enero',
		'02' => 'Febrero',
		'03' => 'Marzo',
		'04' => 'Abril',
		'05' => 'Mayo',
		'06' => 'Junio',
		'07' => 'Julio',
		'08' => 'Agosto',
		'09' => 'Septiembre'
	];
	return $meses_completos[$mes];
}

function get_mes_mayus($mes = '')
{
	$meses = [
		'0' => '',
		'1' => 'ENE',
		'2' => 'FEB',
		'3' => 'MAR',
		'4' => 'ABR',
		'5' => 'MAY',
		'6' => 'JUN',
		'7' => 'JUL',
		'8' => 'AGO',
		'9' => 'SEP',
		'10' => 'OCT',
		'11' => 'NOV',
		'12' => 'DIC',
		'01' => 'ENE',
		'02' => 'FEB',
		'03' => 'MAR',
		'04' => 'ABR',
		'05' => 'MAY',
		'06' => 'JUN',
		'07' => 'JUL',
		'08' => 'AGO',
		'09' => 'SEP'
	];
	return $meses[$mes];
}

function getFechaEscrita($fecha="",$min=0){
	if ($fecha == ""){
		$fecha = date("Y-m-d");
	}
	$y = date("Y", strtotime($fecha));
	$m = date("m", strtotime($fecha));
	$d = date("d", strtotime($fecha));
	if ($min == 0) {
		return $d." de ".get_mes($m)." del ".$y;
	} else {
		return $d."/".get_mes_mayus($m)."/".$y;
	}
}
