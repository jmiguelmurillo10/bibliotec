<?
include ("../conectar.php"); 
include ("../conectar_bd.php");
conectar_bd();

$codusuario=$_GET["USR_ID"];
$cadena_busqueda=$_GET["cadena_busqueda"];

$query="SELECT * FROM USUARIOS WHERE USR_ID='$codusuario'";
$rs_query=mysql_query($query);

$query_2="SELECT TU.TUSR_NOMBRE FROM USUARIOS AS U,TUSUARIOS AS TU WHERE U.TUSR_ID=TU.TUSR_ID AND U.USR_ID='$codusuario'";
$rs_query_2=mysql_query($query_2);

echo "codigo de usuario:",$codusuario;
?>

<html>
	<head>
		<title>Principal</title>
		<link href="../estilos/estilos.css" type="text/css" rel="stylesheet">
		<script language="javascript">
		
		function aceptar() {
			location.href="index.php?cadena_busqueda=<? echo $cadena_busqueda?>";
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
	<a name="arriba"></a>
		<div id="pagina">
			<div id="zonaContenido">
				<div align="center">
				<div id="tituloForm" class="header">VER USUARIOS </div>
				<div id="frmBusqueda">
					<table class="fuente8" width="98%" cellspacing=0 cellpadding=3 border=0>
						<tr>
							<!--<td width="15%">C&oacute;digo</td>-->
							<td width="15%"># ID</td>
							<td width="85%" colspan="2"><?php echo $codusuario?></td>
					    </tr>
						<tr>
							<td width="15%">Nombre Usuario</td>
						    <td width="85%" colspan="2"><?php echo mysql_result($rs_query,0,"USR_NOMBRE")?></td>
					    </tr>						
						<tr>
							<td width="15%"># CED. ID.</td>
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
						<tr>
							<td width="15%">Correo</td>
						    <td width="85%" colspan="2"><?php echo mysql_result($rs_query,0,"USR_CORREO")?></td>
					    </tr>						
						<tr>
							<td width="15%">Tipo Usuario</td>
						    <td width="85%" colspan="2"><?php echo mysql_result($rs_query_2,0,"TU.TUSR_NOMBRE")?></td>
					    </tr>						
						<tr>
							<td width="15%">Fecha de Registro</td>
						    <td width="85%" colspan="2"><?php echo mysql_result($rs_query,0,"USR_FECREGISTRO")?></td>
					    </tr>						
						<tr>
							<td width="15%">Activo</td>
						    <td width="85%" colspan="2"><?php echo mysql_result($rs_query,0,"USR_BORRADO")?></td>
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
