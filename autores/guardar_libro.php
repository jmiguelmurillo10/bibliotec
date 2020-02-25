<?
include ("../conectar.php"); 
include ("../conectar_bd.php");
conectar_bd();

$accion=$_POST["accion"];
if (!isset($accion)) { $accion=$_GET["accion"]; }

$nombre=$_POST["Anombreusuario"];
$ci=$_POST["Aci"];
$nom1=$_POST["Anombre"];
$apel1=$_POST["Aapellido"];
$correo=$_POST["Acorreo"];
$pass=$_POST["Apassword"];
$borrado=$_POST["Aborrado"];
$tusuario=$_POST["i_tipoUsuario"];

echo "Proceso a realizar: ", $accion;

	$str_usr_ci=trim($_POST['tx_ci']);
	$str_usr_nom1=trim($_POST['tx_nombre']);
	$str_usr_apel1  =trim($_POST['tx_apPaterno']);
    $str_usr_correo         =trim($_POST['tx_correo']);
    $str_usr_nombre       =trim($_POST['tx_username']);
    $str_usr_password       =trim($_POST['tx_password']);
    $str_usr_password2  =trim($_POST['tx_password2']);
    $i_TipoUsuario  =trim($_POST['i_tipoUsuario']);


if ($accion=="alta") {
	$query_operacion="INSERT INTO USUARIOS (USR_ID,USR_NOMBRE,USR_PASSWORD,USR_CI, USR_NOM1,USR_APEL1,USR_CORREO,TUSR_ID, USR_BORRADO) 
					VALUES ('', '$str_usr_nombre','$str_usr_password','$str_usr_ci','$str_usr_nom1','$str_usr_apel1','$str_usr_correo','$i_TipoUsuario','0')";					
					
	$rs_operacion=mysql_query($query_operacion);
	if ($rs_operacion) { $mensaje="El usuario ha sido dada de alta correctamente"; }
	//$cabecera1="Inicio >> Usuarios &gt;&gt; Nuevo Usuario ";
	//$cabecera2="INSERTAR USUARIO ";
	//$sel_maximo="SELECT max(USUARIOS) as maximo FROM USUARIOS";
	//$rs_maximo=mysql_query($sel_maximo);
	//$codfamilia=mysql_result($rs_maximo,0,"maximo");
}

if ($accion=="modificar") {
	$codusuario=$_POST["Zid"];
	//echo $codusuario;
	$query="UPDATE USUARIOS SET USR_NOMBRE='$nombre', USR_PASSWORD='$pass',USR_CI='$ci',USR_NOM1='$nom1',USR_APEL1='$apel1',USR_CORREO='$correo',TUSR_ID='$tusuario',USR_BORRADO='$borrado' WHERE USR_ID='$codusuario'";
	$rs_query=mysql_query($query);
	if ($rs_query) { $mensaje="Los datos del Usuario se han sido modificados correctamente"; }
	$cabecera1="Inicio >> Familias &gt;&gt; Modificar Usuario ";
	$cabecera2="MODIFICAR USUARIO ";
}

if ($accion=="baja") {
	$codusuario=$_GET["id_usuario"];
	echo "codigo eliminar: ",$codusuario;
	$query_comprobar="SELECT * FROM USUARIOS WHERE USR_ID='$codusuario' AND USR_BORRADO=0";
	$rs_comprobar=mysql_query($query_comprobar);
	if (mysql_num_rows($rs_comprobar) > 0 ) {
		?><script>
			alert ("No se puede eliminar este usuario porque tiene registros asociados.");
			<!--location.href="eliminar_usuario.php?id_usuario=<? echo $codusuario?>";-->
		</script>
		<?
	} else {
		$query="UPDATE USUARIOS SET USR_BORRADO='1' WHERE USR_ID='$codusuario'";
		$rs_query=mysql_query($query);
		if ($rs_query) { $mensaje="el usuario ha sido eliminado correctamente"; }
		
		
		
		//$cabecera1="Inicio >> Usuarios &gt;&gt; Eliminar Usuario ";
		$cabecera2="ELIMINAR USUARIO ";
		$query_mostrar="SELECT * FROM USUARIOS WHERE USR_ID='$codusuario'";
		$rs_mostrar=mysql_query($query_mostrar);
		$codusuario=mysql_result($rs_mostrar,0,"USR_ID");
		$ci=mysql_result($rs_mostrar,0,"USR_CI");
		$nom1=mysql_result($rs_mostrar,0,"USR_NOM1");
		$apel1=mysql_result($rs_mostrar,0,"USR_APEL1");
		
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
							<td width="85%" colspan="2"><?php echo $codusuario?></td>
					    </tr>
						<tr>
							<td width="15%">CED. ID.:</td>
						    <td width="85%" colspan="2"><?php echo $ci?></td>
						</tr>	
						<tr>
							<td width="15%">Nombre:</td>
						    <td width="85%" colspan="2"><?php echo $nom1?></td>
						</tr>	
						<tr>
							<td width="15%">Apellido:</td>
						    <td width="85%" colspan="2"><?php echo $apel1?></td>
						</tr>	
					    <tr>
					    	<!--<td width="15%">Password</td>
						    <td width="85%" colspan="2"><?php/* echo $pass*/?></td>-->
							<td width="15%">Activo</td>
						    <td width="85%" colspan="2"><?php echo $borrado?></td>
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
