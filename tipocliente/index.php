<?php
include ("../conectar.php");
include ("../conectar_bd.php");
conectar_bd();

$cadena_busqueda=$_GET["cadena_busqueda"];

if (!isset($cadena_busqueda)) { $cadena_busqueda=""; } else { $cadena_busqueda=str_replace("",",",$cadena_busqueda); }

if ($cadena_busqueda<>"") {
	$array_cadena_busqueda=split("~",$cadena_busqueda);
	$codfamilia=$array_cadena_busqueda[1];
	$nombre=$array_cadena_busqueda[2];
} else {
	$codfamilia="";
	$nombre="";
}

?>
<html>
	<head>
		<title>Tipo Clientes</title>
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
		
		function nuevo_tipocliente() {
			//location.href="nueva_familia.php";
			location.href="nuevo_tipocliente.php";
		}

		function imprimir() {
			//var codfamilia=document.getElementById("codfamilia").value;
			var codfamilia=document.getElementById("cod_tipocliente").value;
			var nombre=document.getElementById("nombre").value;
			//window.open("../fpdf/familias.php?codfamilia="+codfamilia+"&nombre="+nombre);
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
			//var codfamilia=document.getElementById("codfamilia").value;
			var codfamilia=document.getElementById("cod_tipocliente").value;
			var nombre=document.getElementById("nombre").value;
			var cadena="";
			cadena="~"+codfamilia+"~"+nombre+"~";
			return cadena;
			}
			
		function limpiar() {
			document.getElementById("form_busqueda").reset();
		}
		</script>
	</head>
	<body onLoad="inicio()">
		<div id="pagina">
			<div id="zonaContenido">
				<div align="center">
				<div id="tituloForm" class="header">BUSCAR TIPO CLIENTE </div>
				<div id="frmBusqueda">
				<form id="form_busqueda" name="form_busqueda" method="post" action="rejilla.php" target="frame_rejilla">
					<table class="fuente8" width="98%" cellspacing=0 cellpadding=3 border=0>					
						<tr>
							<td width="16%">Codigo Tipo Cliente </td>
							<td width="68%"><input id="codfamilia" type="text" class="cajaPequena" NAME="codfamilia" maxlength="3" value="<? echo $codfamilia?>"></td>
							<td width="5%">&nbsp;</td>
							<td width="5%">&nbsp;</td>
							<td width="6%" align="right"></td>
						</tr>
						<tr>
							<td>Nombre</td>
							<td><input id="nombre" name="nombre" type="text" class="cajaGrande" maxlength="20" value="<? echo $nombre?>"></td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
					</table>
			  </div>
			 	<div id="botonBusqueda"><img src="../img/botonbuscar.jpg" width="69" height="22" border="1" onClick="buscar()" onMouseOver="style.cursor=cursor">
			 	  <img src="../img/botonlimpiar.jpg" width="69" height="22" border="1" onClick="limpiar()" onMouseOver="style.cursor=cursor">
					 <img src="../img/botonnuevotipocli.jpg" width="106" height="22" border="1" onClick="nuevo_tipocliente()" onMouseOver="style.cursor=cursor">
					<img src="../img/botonimprimir.jpg" width="79" height="22" border="1" onClick="imprimir()" onMouseOver="style.cursor=cursor">				</div>							
			  <div id="lineaResultado">
			  <table class="fuente8" width="80%" cellspacing=0 cellpadding=3 border=0>
			  	<tr>
				<td width="50%" align="left">N de tipos clientes encontrados <input id="filas" type="text" class="cajaPequena" NAME="filas" maxlength="5" readonly></td>
				<td width="50%" align="right">Mostrados <select name="paginas" id="paginas" onChange="paginar()">
		          </select></td>
			  </table>
				</div>
				<div id="cabeceraResultado" class="header">
					TIPOS DE CLIENTES </div>
				<div id="frmResultado">
				<table class="fuente8" width="100%" cellspacing=0 cellpadding=3 border=1 ID="Table1">
						<tr class="cabeceraTabla">
							<td width="12%">ITEM</td>
							<td width="20%">CODIGO</td>
							<td width="50%">NOMBRE </td>
							<td width="6%">&nbsp;</td>
							<td width="6%">&nbsp;</td>
							<td width="6%">&nbsp;</td>
						</tr>
				</table>
				</div>
				<input type="hidden" id="iniciopagina" name="iniciopagina">
				<input type="hidden" id="cadena_busqueda" name="cadena_busqueda">
			</form>
				<!--<div id="lineaResultado_pagos" style="width:100%;">
					<iframe width="100%" height="250" id="frame_rejilla" name="frame_rejilla" frameborder="0">
						<ilayer width="100%" height="250" id="frame_rejilla" name="frame_rejilla"></ilayer>
					</iframe>-->
				<div id="div">
				  <iframe style="margin: 0 0 0 -10px;" width="102%" height="250" id="frame_rejilla" name="frame_rejilla" frameborder="0">
                  <ilayer height="150" id="frame_rejilla" name="frame_rejilla"></ilayer>
				  </iframe>
				  <iframe id="frame_datos" name="frame_datos" width="0" height="0" frameborder="0">
                  <ilayer width="0" height="0" id="frame_datos" name="frame_datos"></ilayer>
				  </iframe>
				</div>
				</div>
			</div>
		  </div>			
		</div>
	</body>
</html>
