<?
include ("../conectar.php"); 
include ("../conectar_bd.php");
conectar_bd();

//$codfamilia=$_GET["id_usuario"];
//$cadena_busqueda=$_GET["cadena_busqueda"];

$codusuario=$_GET["USR_ID"];// Obtiene el código del usuario a ser dado de baja
$query="SELECT * FROM USUARIOS WHERE USR_ID='$codusuario'";// Consulta sql
$rs_query=mysql_query($query);// consulta ejecutada

?>

<html>
	<head>
		<title>Principal</title>
		<link href="../estilos/estilos.css" type="text/css" rel="stylesheet">
		<script language="javascript">
		
		var cursor;
		if (document.all) {
		// Está utilizando EXPLORER
		cursor='hand';
		} else {
		// Está utilizando MOZILLA/NETSCAPE
		cursor='pointer';
		}
		
		function aceptar(id_usuario) {
			location.href="guardar_usuario.php?id_usuario=" + id_usuario + "&accion=baja" + "&cadena_busqueda=<? echo $cadena_busqueda?>";
		}
		
		function cancelar() {
			location.href="index.php?cadena_busqueda=<? echo $cadena_busqueda?>";
		}
		
		</script>
	</head>
	<body>
	<a name="arriba"></a><!-- localiza la vista de la página al inicio del formulario-->
		<div id="pagina">
			<div id="zonaContenido">
				<div align="center">
				<div id="tituloForm" class="header">ELIMINAR USUARIO </div>
				<div id="frmBusqueda">
					<table class="fuente8" width="98%" cellspacing=0 cellpadding=3 border=0>
						<tr>
							<td width="15%">C&oacute;digo</td>
							<td width="85%" colspan="2"><?php echo $codusuario?></td>
					    </tr>
						<tr>
							<td width="15%">CED.ID.:</td>
						    <td width="85%" colspan="2"><?php echo mysql_result($rs_query,0,"USR_CI")?></td>
					    </tr>
						<tr>
							<td width="15%">Nombre</td>
						    <td width="85%" colspan="2"><?php echo mysql_result($rs_query,0,"USR_NOM1")?></td>
					    </tr>
						<tr>
							<td width="15%">Apellido</td>
						    <td width="85%" colspan="2"><?php echo mysql_result($rs_query,0,"USR_APEL1")?></td>
					    </tr>
					</table>
			  </div>
				<div id="botonBusqueda">
					<img src="../img/botonaceptar.jpg" width="85" height="22" onClick="aceptar(<? echo $codusuario?>)" border="1" onMouseOver="style.cursor=cursor">
					<!--<img src="../img/botonaceptar.jpg" width="85" height="22" onClick="aceptar()" border="1" onMouseOver="style.cursor=cursor">-->
					<img src="../img/botoncancelar.jpg" width="85" height="22" onClick="cancelar()" border="1" onMouseOver="style.cursor=cursor">					
			  </div>
			 </div>
		  </div>
		</div>
	</body>
</html>
