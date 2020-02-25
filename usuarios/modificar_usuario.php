<?php

include ("../conectar_bd.php");
conectar_bd();

//$codfamilia=$_GET["USR_ID"];
//$codfamilia=1;
$codusuario=$_GET["USR_ID"];
//echo "codigo:",$codusuario;
$query="SELECT * FROM USUARIOS WHERE USR_ID='$codusuario'";
$rs_query=mysqli_query($objetoMysqli,$query);

?>
<html>
	<head>
		<title>Principal</title>
		<link href="../estilos/estilos.css" type="text/css" rel="stylesheet">
		<script type="text/javascript" src="../funciones/validar.js"></script>
		<link href="../usuarios/cabeceras.css" type="text/css" rel="stylesheet">
		<script language="javascript">
		function cancelar() {
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
		
		function limpiar() {
			document.getElementById("formulario").reset();
		}
		
		</script>
	</head>
	<body>		
	<a name="arriba"></a><!-- localiza la vista de la página al inicio del formulario-->
		<div id="pagina">
			<div id="zonaContenido">
				<div align="center">
				<div id="tituloForm" class="header_mod2">MODIFICAR USUARIO </div>
				<div id="frmBusqueda">
				<form id="formulario" name="formulario" method="post" action="guardar_usuario.php">
					<table class="fuente8" width="98%" cellspacing=0 cellpadding=3 border=0>
						<tr>
							<td>C&oacute;digo</td>
							<td><?php echo $codusuario?></td>
						    <td width="42%" rowspan="2" align="left" valign="top"><ul id="lista-errores"></ul></td>
						</tr>
						<tr>
							<td width="15%">Nombre usuario</td>
						    <td width="43%"><input NAME="Anombreusuario" type="text" class="cajaGrande" id="nombreusuario" size="45" maxlength="45" value="<?php echo mysqli_result($rs_query,0,"USR_NOMBRE")?>"></td>

				        </tr>
						<tr>
							<td width="15%"># Ced. id.</td>
						    <td width="43%"><input NAME="Aci" type="text" class="cajaGrande" id="ci" size="45" maxlength="45" value="<?php echo mysqli_result($rs_query,0,"USR_CI")?>"></td>

				        </tr>
						<tr>
							<td width="15%">Nombre </td>
						    <td width="43%"><input NAME="Anombre" type="text" class="cajaGrande" id="nombre" size="45" maxlength="45" value="<?php echo mysqli_result($rs_query,0,"USR_NOM1")?>"></td>

				        </tr>
						<tr>
							<td width="15%">Apellido</td>
						    <td width="43%"><input NAME="Aapellido" type="text" class="cajaGrande" id="apellido" size="45" maxlength="45" value="<?php echo mysqli_result($rs_query,0,"USR_APEL1")?>"></td>

				        </tr>
						<tr>
							<td width="15%">Correo</td>
						    <td width="43%"><input NAME="Acorreo" type="text" class="cajaGrande" id="correo" size="45" maxlength="45" value="<?php echo mysqli_result($rs_query,0,"USR_CORREO")?>"></td>

				        </tr>
				        <tr>
				        	<td width="15%">Password</td>
						    <td width="43%"><input NAME="Apassword" type="password" class="cajaGrande" id="password" size="45" maxlength="45" value="<?php echo mysqli_result($rs_query,0,"USR_PASSWORD")?>"></td>
				        </tr>
						<tr>
							<td width="15%">Activo:0 / Inactivo: 1</td>
						    <td width="43%"><input NAME="Aborrado" type="text" class="cajaGrande" id="borrado" size="45" maxlength="45" value="<?php echo mysqli_result($rs_query,0,"USR_BORRADO")?>"></td>

				        </tr>
						<tr>	
							<td class="prompt">Tipo de usuario</td>
							<td>
            
								<input type="radio" name="i_tipoUsuario" id="i_tipoUsuario" enabled value="1" /> Administrador &nbsp;&nbsp;&nbsp;
								<input type="radio" name="i_tipoUsuario" id="i_tipoUsuario" enabled value="2"  /> Digitador
								<input type="radio" name="i_tipoUsuario" id="i_tipoUsuario" enabled value="3" /> Docente &nbsp;&nbsp;&nbsp;
								<input type="radio" name="i_tipoUsuario" id="i_tipoUsuario" enabled value="4"  /> Estudiante
							</td>
						<tr>	
					</table>
			    </div>
				<div id="botonBusqueda">
					<img src="../img/botonaceptar.jpg" width="85" height="22" onClick="validar(formulario,true)" border="1" onMouseOver="style.cursor=cursor">
					<img src="../img/botonlimpiar.jpg" width="69" height="22" onClick="limpiar()" border="1" onMouseOver="style.cursor=cursor">
					<img src="../img/botoncancelar.jpg" width="85" height="22" onClick="cancelar()" border="1" onMouseOver="style.cursor=cursor">
					<input id="accion" name="accion" value="modificar" type="hidden">
					<input id="id" name="Zid" value="<?php echo $codusuario?>" type="hidden"><!--Envia codigo de usuario para modificar-->
				</div>
			  </form>
			 </div>
		  </div>
		</div>
	</body>
</html>
