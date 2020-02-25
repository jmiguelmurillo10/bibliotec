<?php 
echo "test";
function conectar(){
	

	try
	{
		//include ("../conectar.php");
		include ("../conectar_bd.php");
		//require_once("../conectar_bd.php");
		//conectar_bd();
		echo "Conexion ok";
	}
	catch(Exception $e)
	{
		//echo "Conexion Local", $e->getMessage(),"\n";
		echo "wrong connection";
	}

	}
?>