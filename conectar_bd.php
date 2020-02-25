
<?php

/*     

    Instituto Tecnologico de Zacatepec, Morelos 

Descripcion:   Conecta con el Manejador de Base de Datos (DBMS) y deja disponible una variable global (conexio)

        para ser utilizada posteriormente. 

Author:     Gonzalo Silverio  gonzasilve@gmail.com 

Archivo:    conectar_bd.php 

*/

 

$conexio;

function conectar_bd()

{

    global $conexio;
	global $objetoMysqli;

    //Definir datos de conexion con el servidor MySQL

    $elUsr = "root";

    $elPw  = "Ddlserver";
	$elServer ="localhost";
    //$elServer ="localhost:8888/";
	//$elServer ="127.0.0.1:33065";

    $laBd = "biblioteca";

     

    //Conectar

    //$conexio = mysql_connect($elServer, $elUsr , $elPw) or die (mysql_error());
    //Seleccionar la BD a utilizar
	//mysql_select_db($laBd, $conexio ) or die (mysql_error());
	
	//Instanciamos el objeto mysqli con los datos de la conexión
	$objetoMysqli = new mysqli(localhost,root,Ddlserver,biblioteca);
	//Comprobamos si la conexión tuvo éxito. Si nó mostramos:
	//El número del error: mysqli_connect_errno()
	//El texto del error: mysqli_connect_error()
	if($objetoMysqli->connect_errno) {
		die("Error de conexion: " . $objetoMysqli->mysqli_connect_errno() . ", " . $objetoMysqli->connect_error());
	}
	else{
		//echo "La conexion tuvo exito";
	}
	

}   

function mysqli_result($result, $iRow, $field = 0)
{
    if(!mysqli_data_seek($result, $iRow))
        return false;
    if(!($row = mysqli_fetch_array($result)))
        return false;
    if(!array_key_exists($field, $row))
        return false;
    return $row[$field];
}
//ob_clean();
	//Cerramos la conexión
	//mysqli_close($objetoMysqli);
?>