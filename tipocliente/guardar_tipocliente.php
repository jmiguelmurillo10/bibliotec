<?
include ("../conectar.php"); 
include ("../conectar_bd.php");
conectar_bd();

$accion=$_POST["accion"];
if (!isset($accion)) { $accion=$_GET["accion"]; }

$nombre=$_POST["Anombre"];

if ($accion=="alta") {
	//$query_operacion="INSERT INTO familias (codfamilia, nombre, borrado) 
	//				VALUES ('', '$nombre', '0')";					
	$query_operacion="INSERT INTO tipoCliente (cod_tipocliente, nombre, borrado) 
					VALUES ('', '$nombre', '0')";					
	$rs_operacion=mysql_query($query_operacion);
	if ($rs_operacion) { $mensaje="el tipo cliente ha sido dada de alta correctamente"; }
	$cabecera1="Inicio >> Tipo Cliente &gt;&gt; Nuevo Tipo Cliente ";
	$cabecera2="INSERTAR TIPO CLIENTE ";
	$sel_maximo="SELECT max(cod_tipocliente) as maximo FROM tipoCliente";
	$rs_maximo=mysql_query($sel_maximo);
	$codfamilia=mysql_result($rs_maximo,0,"maximo");
}

if ($accion=="modificar") {
	$codfamilia=$_POST["Zid"];
	//$query="UPDATE familias SET nombre='$nombre', borrado=0 WHERE codfamilia='$codfamilia'";
	$query="UPDATE tipoCliente SET nombre='$nombre', borrado=0 WHERE cod_tipocliente='$codfamilia'";
	$rs_query=mysql_query($query);
	if ($rs_query) { $mensaje="Los datos del tipo cliente han sido modificados correctamente"; }
	$cabecera1="Inicio >> Tipo Cliente &gt;&gt; Modificar Tipo Cliente ";
	$cabecera2="MODIFICAR TIPO CLIENTE ";
}

if ($accion=="baja") {
	$codfamilia=$_GET["cod_tipocliente"];
	//$query_comprobar="SELECT * FROM articulos WHERE codfamilia='$codfamilia' AND borrado=0";
	$query_comprobar="SELECT * FROM clientes WHERE cod_tipocliente='$codfamilia' AND borrado=0";
	$rs_comprobar=mysql_query($query_comprobar);
	if (mysql_num_rows($rs_comprobar) > 0 ) {
		?><script>
			alert ("No se puede eliminar el tipo cliente porque tiene registros asociados.");
			location.href="eliminar_tipocliente.php?cod_tipocliente=<? echo $codfamilia?>";
		</script>
		<?
	} else {
		$query="UPDATE tipoCliente SET borrado=1 WHERE cod_tipocliente='$codfamilia'";
		//$query="UPDATE familias SET borrado=1 WHERE codfamilia='$codfamilia'";
		$rs_query=mysql_query($query);
		if ($rs_query) { $mensaje="el tipo de Cliente ha sido eliminada correctamente"; }
		$cabecera1="Inicio >> Tipo Cliente &gt;&gt; Eliminar Tipo Cliente ";
		$cabecera2="ELIMINAR TIPO CLIENTE ";
		$query_mostrar="SELECT * FROM tipoCliente WHERE cod_tipocliente='$codfamilia'";
		$rs_mostrar=mysql_query($query_mostrar);
		$codfamilia=mysql_result($rs_mostrar,0,"cod_tipocliente");
		$nombre=mysql_result($rs_mostrar,0,"nombre");
	}
}

?>

<html>
	<head>
		<title>Principal</title>
		<link href="../estilos/estilos.css" type="text/css" rel="stylesheet">
		<script language="javascript">
		
		function aceptar() {
			location.href="index.php";
		}
		var cursor;
		if (document.all) {
		// Está utilizando EXPLORER
		cursor='hand';
		} else {
		// Está utilizando MOZILLA/NETSCAPE
		cursor='pointer';
		}
		
		</script>
	</head>
	<body>
		<div id="pagina">
			<div id="zonaContenido">
				<div align="center">
				<div id="tituloForm" class="header"><?php echo $cabecera2?></div>
				<div id="frmBusqueda">
					<table class="fuente8" width="98%" cellspacing=0 cellpadding=3 border=0>
						<tr>
							<td width="15%"></td>
							<td width="85%" colspan="2" class="mensaje"><?php echo $mensaje;?></td>
					    </tr>
						<tr>
							<td width="15%">C&oacute;digo</td>
							<td width="85%" colspan="2"><?php echo $codfamilia?></td>
					    </tr>
						<tr>
							<td width="15%">Nombre</td>
						    <td width="85%" colspan="2"><?php echo $nombre?></td>
					    </tr>						
					</table>
			  </div>
				<div id="botonBusqueda">
					<img src="../img/botonaceptar.jpg" width="85" height="22" onClick="aceptar()" border="1" onMouseOver="style.cursor=cursor">
			  </div>
			 </div>
		  </div>
		</div>
	</body>
</html>
