<?php
include ("../conectar.php");
include ("../conectar_bd.php");
conectar_bd();

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
		<title>Asignaturas</title>
		<link href="../estilos/estilos_familias.css" type="text/css" rel="stylesheet">
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
			//location.href="../registro_libro.php";
			location.href="../usuarios/registro_libro.php";
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
	</head>
	<body onLoad="inicio()">
	
		<div id="pagina">
			<div id="zonaContenido">
				<div align="center">
							<div id="tituloForm" class="header">ASIGNATURAS
							</div>
							<div id="frmBusqueda">
								<form id="form_busqueda" name="form_busqueda" method="post" action="rejilla.php" target="frame_rejilla">
										<!--Muestra los datos que se ingresarían para completar una búsqueda-->
										<table class="fuente8" width="98%" cellspacing=0 cellpadding=3 border=0>																
											<tr>
												<td>Asignatura</td>
												<td><input id="Bnombre" name="Bnombre" type="text" class="cajaGrande" maxlength="50" value="<? echo $bnombre?>"></td>
											</tr>
											<tr>
												<td>Activo(0/1)</td>
												<td><input id="Bactivo" name="Bactivo" type="text" class="cajaPequena" maxlength="1" value="<? echo $bactivo?>"></td>
											</tr>
												
										</table>
					
										<div id="botonBusqueda"><!--Botones-->
											<img src="../img/botonbuscar.jpg" width="69" height="22" border="1" onClick="buscar()" onMouseOver="style.cursor=cursor">
											<img src="../img/botonlimpiar.jpg" width="69" height="22" border="1" onClick="limpiar()" onMouseOver="style.cursor=cursor">											
											<img src="../img/botonnuevousuario.jpg" width="106" height="22" border="1" onClick="nuevo_registro()" onMouseOver="style.cursor=cursor">
												<!--<img src="../img/botonimprimir.jpg" width="79" height="22" border="1" onClick="imprimir()" onMouseOver="style.cursor=cursor">-->
												
												<!--Muestra el número de usuarios encontrados así como la etiqueta de paginas mostradas-->
												<div id="lineaResultado">
													<table class="fuente8" width="80%" cellspacing=0 cellpadding=3 border=0>
														<tr>
															<td width="50%" align="left"># Asignaturas Econtrados <input id="filas" type="text" class="cajaPequena" NAME="filas" maxlength="5" readonly></td>
															<td width="50%" align="right">Pag. Mostradas <select name="paginas" id="paginas" onChange="paginar()"></select>  
															</td>
														</tr>
													</table>
												</div>
												<div id="cabeceraResultado" class="header">
													ASIGNATURAS REGISTRADOS 
												</div>
												<!--Muestra la cabacera de la rejilla-->
												<div id="frmResultado">
													<table class="fuente8" width="100%" cellspacing=0 cellpadding=3 border=1 ID="Table1">
														<tr class="cabeceraTabla">
															<td width="12%">ITEM</td>															
															<td width="50%">ASIGNATURAS</td>															
															<td width="6%">&nbsp;</td>
															<td width="6%">&nbsp;</td>
															<td width="6%">&nbsp;</td>
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
