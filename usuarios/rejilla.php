<?php
//include ("../conectar.php");
include ("../conectar_bd.php");
conectar_bd();


//pendites de revisar funcionalidad y borrar
$codusuario=$_POST["USR_ID"];
$nombre=$_POST["USR_NOMBRE"];
$cadena_busqueda=$_POST["cadena_busqueda"];


//nombre de los cuadros de texto para pasar informacion entre formularios
$bci=$_POST["Bci"];
$bnombre=$_POST["Bnombre"];
$bactivo=$_POST["Bactivo"];

//echo "cadena de busqueda: ",$bci;


//Condicionantes para completar la cadena de busqueda para los registros a mostrar
$where="1=1";

if ($bci <> "") { $where.=" AND USR_CI='$bci'"; }
if ($bnombre <> "") { $where.=" AND USR_NOM1 like '%".$bnombre."%'"; }
if ($bactivo <> "") { $where.=" AND USR_BORRADO='$bactivo'"; }

//ordena la información mostrada en forma ascendente
$where.=" ORDER BY USR_CI ASC";



$query_busqueda="SELECT count(*) as filas FROM USUARIOS WHERE USR_BORRADO=0 AND ".$where;
$rs_busqueda=mysqli_query($objetoMysqli,$query_busqueda);
$filas=mysqli_result($rs_busqueda,0,"filas");


?>
<html>
	<head>
		<title>Usuarios</title>
		<!--<link href="../estilos/estilos_familias.css" type="text/css" rel="stylesheet">-->
		<link href="../estilos/estilos_general.css" type="text/css" rel="stylesheet">
		<link href="../iconos/style.css" type="text/css" rel="stylesheet">
		<script language="javascript">
		
		function ver_usuario(USR_ID) {
			parent.location.href="ver_usuario.php?USR_ID=" + USR_ID + "&cadena_busqueda=<? echo $cadena_busqueda?>";
		}
		
		function modificar_usuario(USR_ID) {
			parent.location.href="modificar_usuario.php?USR_ID=" + USR_ID + "&cadena_busqueda=<? echo $cadena_busqueda?>";
		}
		
		function eliminar_usuario(USR_ID) {
			parent.location.href="eliminar_usuario.php?USR_ID=" + USR_ID + "&cadena_busqueda=<? echo $cadena_busqueda?>";
		}

		function inicio() {
			var numfilas=document.getElementById("numfilas").value;
			var indi=parent.document.getElementById("iniciopagina").value;
			var contador=1;
			var indice=0;
			if (indi>numfilas) { 
				indi=1; 
			}
			parent.document.form_busqueda.filas.value=numfilas;
			parent.document.form_busqueda.paginas.innerHTML="";		
			while (contador<=numfilas) {
				texto=contador + "-" + parseInt(contador+9);
				if (indi==contador) {
					parent.document.form_busqueda.paginas.options[indice]=new Option (texto,contador);
					parent.document.form_busqueda.paginas.options[indice].selected=true;
				} else {
					parent.document.form_busqueda.paginas.options[indice]=new Option (texto,contador);
				}
				indice++;
				contador=contador+10;
			}
		}
		function CambiaColor(esto,fondo,texto)
		{
			colorfondo=esto.style.background;
			esto.style.background=fondo;
			esto.style.color=texto;
			return colorfondo;
		}
		
		function CambiaColor2(esto,texto)
		{
			esto.style.background=colorfondo;
			esto.style.color=texto;
		}

		</script>
	</head>

	<body onload=inicio()>	
		<div id="pagina">
		<div id="zonaContenidoPP">
			<div align="center">
			<table class="fuente8" width="100%" cellspacing=0 cellpadding=0 border=0 ID="Table1">
			<!--muestra el número de registros encontrados-->
			<input type="hidden" name="numfilas" id="numfilas" value="<? echo $filas?>">
				<? $iniciopagina=$_POST["iniciopagina"];
				if (empty($iniciopagina)) { $iniciopagina=$_GET["iniciopagina"]; } else { $iniciopagina=$iniciopagina-1;}
				if (empty($iniciopagina)) { $iniciopagina=0; }
				if ($iniciopagina>$filas) { $iniciopagina=0; }
					if ($filas > 0) { ?>
						<? 
						   /*SQL para mostrar el total de usuarios */						   
						   $sel_resultado="SELECT * FROM USUARIOS WHERE USR_BORRADO=0 AND ".$where;
						   $sel_resultado=$sel_resultado."  limit ".$iniciopagina.",10";						   
						   $res_resultado=mysqli_query($objetoMysqli,$sel_resultado);
						   $contador=0;						   
							while ($contador < mysqli_num_rows($res_resultado)) { 
								 if ($contador % 2) { $fondolinea="itemParTabla"; } else { $fondolinea="itemImparTabla"; }?>
						<tr class="<?php echo $fondolinea?>" onMouseOver="CambiaColor(this,'#000000','#ffffff')" onMouseOut="CambiaColor2(this,'#000000')" >
							<td class="aCentro" width="12%"><? echo $contador+1;?></td>
							<td width="25%"><div align="center"><? echo mysqli_result($res_resultado,$contador,"USR_NOMBRE")?></div></td>							
							<td width="20%"><div align="left"><? echo mysqli_result($res_resultado,$contador,"USR_NOM1")." ".mysqli_result($res_resultado,$contador,"USR_APEL1")?></div></td>
							<td width="50%"><div align="left"><? echo mysqli_result($res_resultado,$contador,"USR_CORREO")?></div></td>
							<!--<td width="5%"><div align="center"><a href="#arriba"><img src="../img/modificar.png" width="16" height="16" border="0" onClick="modificar_usuario(<?php //echo mysqli_result($res_resultado,$contador,"USR_ID")?>)" title="Modificar"></a></div></td>-->
							<td width="5%"><div align="center"><a href="#arriba"><img src="../img/modificar.png" width="16" height="16" border="0" onClick="modificar_usuario(<?php echo mysqli_result($res_resultado,$contador,"USR_ID")?>)" title="Modificar"></a></div></td>
							<td width="5%"><div align="center"><a href="#arriba"><img src="../img/ver.png" width="16" height="16" border="0" onClick="ver_usuario(<?php echo mysqli_result($res_resultado,$contador,"USR_ID")?>)" title="Visualizar"></a></div></td>
							<td width="5%"><div align="center"><a href="#arriba"><img src="../img/eliminar.png" width="16" height="16" border="0" onClick="eliminar_usuario(<?php echo mysqli_result($res_resultado,$contador,"USR_ID")?>)" title="Eliminar"></a></div></td>
						</tr>
						<? $contador++;
							}
						?>			
					</table>
					<? } else { ?>
					<table class="fuente8" width="87%" cellspacing=0 cellpadding=3 border=0>
						<tr><!--Cuando no existen registros en la tabla se muestra el siguiente mensaje-->
							<td width="100%" class="mensaje"><?php echo "No hay ninguna familia que cumpla con los criterios de b&uacute;squeda";?></td>
					    </tr>
					</table>					
					<? } 
					?>					
				</div>
		  </div>			
		</div>
	</body>
</html>
