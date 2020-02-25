<?php
//include ("../conectar.php");
//include ("../conectar_bd.php");
//conectar_bd();

//$cadena_busqueda=$_GET["cadena_busqueda"];
//$cadena_busqueda="1804109559";

/*
if (!isset($cadena_busqueda)) { $cadena_busqueda=""; } else { $cadena_busqueda=str_replace("",",",$cadena_busqueda); }

if ($cadena_busqueda<>"") 
{
	$array_cadena_busqueda=split("~",$cadena_busqueda);
	$bci=$array_cadena_busqueda[1];
	$bnombre=$array_cadena_busqueda[2];
	$bactivo=$array_cadena_busqueda[3];
	
	echo "codigo cliente:", $bci;
} 
else 
{
	echo "codigo cliente 2 :", $bci;
	$bci="";
	$bnombre="";
	$bactivo="";
	//echo "codigo cliente 2 :", $bci;
}
*/
?>
<html>
	<head>
		<title>Usuarios</title>
		<link href="../estilos/estilos_familias.css" type="text/css" rel="stylesheet">
		<link href="../estilos/estilos_botones.css" type="text/css" rel="stylesheet">		
		<link href="../usuarios/cabeceras.css" type="text/css" rel="stylesheet">
		<script language="javascript">
		
		var cursor;
		if (document.all) {
		// Está utilizando EXPLORER
		cursor='hand';
		} else {
		// Está utilizando MOZILLA/NETSCAPE
		cursor='pointer';
		}
		
		function inicio() {
			document.getElementById("form_busqueda").submit();
		}
		
		function nuevo_registro() {
			//location.href="../registro_usuario.php";
			location.href="../usuarios/registro_usuario.php";
		}

		function imprimir() {
			var codfamilia=document.getElementById("codfamilia").value;
			var nombre=document.getElementById("nombre").value;
			window.open("../fpdf/familias.php?codfamilia="+codfamilia+"&nombre="+nombre);
		}
		function buscar() {
			var cadena;
			cadena=hacer_cadena_busqueda();
			document.getElementById("cadena_busqueda").value=cadena;
			if (document.getElementById("iniciopagina").value=="") {
				document.getElementById("iniciopagina").value=1;
			} else {
				document.getElementById("iniciopagina").value=document.getElementById("paginas").value;
			}
			document.getElementById("form_busqueda").submit();
			
		}
		
		function paginar() {
			document.getElementById("iniciopagina").value=document.getElementById("paginas").value;
			document.getElementById("form_busqueda").submit();
		}
		
		function hacer_cadena_busqueda() {
			var codusuario=document.getElementById("Bci").value;
			var nombreusuario=document.getElementById("Bnombre").value;
			var activousuario=document.getElementById("Bactivo").value;
			var cadena="";
			cadena="~"+codusuario+"~"+nombreusuario+"~"+activousuario+"~";
			return cadena;
			}
			
		function limpiar() {
			document.getElementById("form_busqueda").reset();
			location.href="./index.php";
			//inicio();
		}
		</script>
	<!--<style>
	
		.boton {
		border: 1px solid #2e518b; /*anchura, estilo y color borde*/
		padding: 8px; /*espacio alrededor texto*/
		background-color: #5390bd; /*color botón*/
		color: #FFFFFF; /*color texto*/
		text-decoration: none; /*decoración texto*/
		text-transform: uppercase; /*capitalización texto*/
		font-family: 'Calibri', sans-serif; /*tipografía texto*/
		border-radius: 6px; /*bordes redondos*/
		}
		.boton:hover{
			color: #1883ba;
			background-color: #ffffff;
			font-family: 'Calibri', sans-serif; /*tipografía texto*/
			cursor: default;
		}		
		
		.header_mod {
		background-color:#5390BD;
		color:#fff;
		/* text-transform:uppercase; */
		text-align:center;
		font-weight:bold;
		height:25px;
		vertical-align:middle;
		padding: 10px;
		font-size:25px;
		font-family:'Times New Roman';
		}
	</style>-->
	</head>
	<body onLoad="inicio()">
	
		<div id="pagina">
			<div id="zonaContenido">
				<div align="center">
							<div id="tituloForm" class="header_mod2">Administración de Usuarios
							</div>
							<div id="frmBusqueda">
								<form id="form_busqueda" name="form_busqueda" method="post" action="rejilla.php" target="frame_rejilla">
										<!--Muestra los datos que se ingresarían para completar una búsqueda-->
										<table class="fuente8" width="98%" cellspacing=0 cellpadding=3 border=0>					
											<tr>
												<td width="16%"># Ced. Id. </td>
												<td width="68%"><input id="Bci" type="text" class="cajaPequena" NAME="Bci" maxlength="10" value="<? echo $bci?>"></td>
											</tr>
											<tr>
												<td>Nombre</td>
												<td><input id="Bnombre" name="Bnombre" type="text" class="cajaGrande" maxlength="50" value="<? echo $bnombre?>"></td>
											</tr>
											<tr>
												<td>Activo(0/1)</td>
												<td><input id="Bactivo" name="Bactivo" type="text" class="cajaPequena" maxlength="1" value="<? echo $bactivo?>"></td>
											</tr>
												
										</table>
					
										<div id="botonBusqueda"><!--Botones-->											
											<a class="boton" onClick="buscar()">Buscar</a>
											<a class="boton" onClick="limpiar()">Limpiar</a>
											<a class="boton" onClick="nuevo_registro()" >Nuevo Usuario</a>
											<p>

												<!--Muestra el número de usuarios encontrados así como la etiqueta de paginas mostradas-->
												<div id="lineaResultado">
													<table class="fuente8" width="80%" cellspacing=0 cellpadding=3 border=0	>
														<tr>
															<td width="50%" align="left"># Usuarios Econtrados <input id="filas" type="text" class="cajaPequena" NAME="filas" maxlength="5" readonly></td>
															<td width="50%" align="right">Pag. Mostradas <select name="paginas" id="paginas" onChange="paginar()"></select>  
															</td>
														</tr>
													</table>
												</div>
												<div id="cabeceraResultado" class="header_mod2">
													Usuarios Registrados 
												</div>
												<!--Muestra la cabacera de la rejilla-->
												<div id="frmResultado">
													<table class="fuente8" width="100%" cellspacing=0 cellpadding=4 border=1 ID="Table1">
														<tr class="cabeceraTabla_mod2">
															<td width="12%">ITEM</td>
															<td width="20%">USUARIOS</td>
															<td width="20%">NOMBRE</td>
															<td width="50%">CORREO </td>
															<!--<td width="6%">&nbsp;</td>
															<td width="6%">&nbsp;</td>
															<td width="6%">&nbsp;</td>-->
														</tr>
													</table>
												</div>
												<!-- Controla la paginación(numeración) de los registros mostrados en select name="paginas"-->
												<input type="hidden" id="iniciopagina" name="iniciopagina">	
												<!--Controla la cadena de busqueda de usuarios que se muestran en la rejilla-->
												<input type="hidden" id="cadena_busqueda" name="cadena_busqueda">
										</div>		
												<!--Muestra los registros de la BDD consultados-->
												<div id="lineaResultado" >
													<iframe align="center" style="margin: 0 0 0 -10px;" width="102%" height="250" id="frame_rejilla" name="frame_rejilla" frameborder="0">
														<ilayer height="150" id="frame_rejilla" name="frame_rejilla"></ilayer>
													</iframe>
												</div>									
								</form>
								
								
								
							</div>							
				</div>						
			</div>			
		</div>
	</body>
</html>
