<?php
include ("../conectar.php");
include ("../conectar_bd.php");
conectar_bd();

//$codfamilia=$_POST["codfamilia"];
//$nombre=$_POST["nombre"];
//pendites de revisar funcionalidad y borrar
$codusuario=$_POST["LBR_ID"];
$nombre=$_POST["LBR_TITULO"];
$cadena_busqueda=$_POST["cadena_busqueda"];


//nombre de los cuadros de texto para pasar informacion entre formularios
$bci=$_POST["Bci"];
$bnombre=$_POST["Bnombre"];
$bactivo=$_POST["Bactivo"];



//echo "cadena de busqueda: ",$bci;


//Condicionantes para completar la cadena de busqueda para los registros a mostrar
$where="1=1";
//if ($codusuario <> "") { $where.=" AND USR_ID='$codusuario'"; }
//if ($nombre <> "") { $where.=" AND USR_NOMBRE like '%".$nombre."%'"; }

if ($bci <> "") { $where.=" AND LBR_ID='$bci'"; }
if ($bnombre <> "") { $where.=" AND LBR_TITULO like '%".$bnombre."%'"; }
if ($bactivo <> "") { $where.=" AND LBR_BORRADO='$bactivo'"; }

//if ($bactivo <> "") { $where.=" AND USR_BORRADO=0"; }

//if ($bactivo <> "") { $where.=" AND USR_BORRADO like '%".$bactivo."%'"; }
//if ($bnombre <> "") { $where.=" AND USR_APEL1 like '%".$bnombre."%'"; }


//ordena la información mostrada en forma ascendente
$where.=" ORDER BY LBR_TITULO ASC";
//$where.=" ORDER BY USR_ID DESC";


$query_busqueda="SELECT count(*) as filas FROM LIBROS WHERE LBR_BORRADO=0 AND ".$where;
//$query_busqueda="SELECT count(*) as filas FROM USUARIOS WHERE 1=1 AND ".$where;
//$query_busqueda="SELECT count(*) as filas FROM tbl_users WHERE ".$where;
$rs_busqueda=mysql_query($query_busqueda);
$filas=mysql_result($rs_busqueda,0,"filas");

?>
<html>
	<head>
		<title>Libros</title>
		<!--<link href="../estilos/estilos_familias.css" type="text/css" rel="stylesheet">-->
		<link href="../estilos/estilos_general.css" type="text/css" rel="stylesheet">
		
		<script language="javascript">
		
		function ver_usuario(USR_ID) {
			parent.location.href="ver_usuario.php?LBR_ID=" + USR_ID + "&cadena_busqueda=<? echo $cadena_busqueda?>";
		}
		
		function modificar_usuario(USR_ID) {
			parent.location.href="modificar_usuario.php?LBR_ID=" + USR_ID + "&cadena_busqueda=<? echo $cadena_busqueda?>";
		}
		
		function eliminar_usuario(USR_ID) {
			parent.location.href="eliminar_usuario.php?LBR_ID=" + USR_ID + "&cadena_busqueda=<? echo $cadena_busqueda?>";
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
			<table class="fuente8" width="100%" cellspacing=0 cellpadding=0 border=1 ID="Table1">
			<!--muestra el número de registros encontrados-->
			<input type="hidden" name="numfilas" id="numfilas" value="<? echo $filas?>">
				<? $iniciopagina=$_POST["iniciopagina"];
				if (empty($iniciopagina)) { $iniciopagina=$_GET["iniciopagina"]; } else { $iniciopagina=$iniciopagina-1;}
				if (empty($iniciopagina)) { $iniciopagina=0; }
				if ($iniciopagina>$filas) { $iniciopagina=0; }
					if ($filas > 0) { ?>
						<? 
						   /*SQL para mostrar el total de usuarios */
						   //$sel_resultado="SELECT * FROM USUARIOS WHERE ".$where;
						   //$sel_resultado="SELECT * FROM USUARIOS WHERE USR_BORRADO=0";
						   //$sel_resultado="SELECT * FROM LIBROS WHERE LBR_BORRADO=0 AND ".$where;
						   $sel_resultado="SELECT  L.LBR_TITULO,A.AUT_NOM1,A.AUT_APEL1,L.LBR_CANTIDAD FROM AUTORES AS A, LIBROS AS L WHERE L.AUT_ID=A.AUT_ID AND L.LBR_BORRADO=0 AND ".$where;
						   $sel_resultado=$sel_resultado."  limit ".$iniciopagina.",10";
						   $res_resultado=mysql_query($sel_resultado);
						   $contador=0;
						   while ($contador < mysql_num_rows($res_resultado)) { 
								 if ($contador % 2) { $fondolinea="itemParTabla"; } else { $fondolinea="itemImparTabla"; }?>
						<tr class="<?php echo $fondolinea?>" onMouseOver="CambiaColor(this,'#000000','#ffffff')" onMouseOut="CambiaColor2(this,'#000000')" >
							<td class="aCentro" width="13%"><? echo $contador+1;?></td>
							<td width="20%"><div align="center"><? echo mysql_result($res_resultado,$contador,"L.LBR_TITULO")?></div></td>
							<td width="50%"><div align="center"><? echo mysql_result($res_resultado,$contador,"A.AUT_NOM1")." ".mysql_result($res_resultado,$contador,"A.AUT_APEL1")?></div></td>
							<td width="50%"><div align="center"><? echo mysql_result($res_resultado,$contador,"L.LBR_CANTIDAD")?></div></td>
							<td width="15%"><div align="center"><a href="#arriba"><img src="../img/modificar.png" width="16" height="16" border="0" onClick="modificar_usuario(<?php echo mysql_result($res_resultado,$contador,"USR_ID")?>)" title="Modificar"></a></div></td>
							<td width="15%"><div align="center"><a href="#arriba"><img src="../img/ver.png" width="16" height="16" border="0" onClick="ver_usuario(<?php echo mysql_result($res_resultado,$contador,"USR_ID")?>)" title="Visualizar"></a></div></td>
							<td width="15%"><div align="center"><a href="#arriba"><img src="../img/eliminar.png" width="16" height="16" border="0" onClick="eliminar_usuario(<?php echo mysql_result($res_resultado,$contador,"USR_ID")?>)" title="Eliminar"></a></div></td>
						</tr>
						<? $contador++;
							}
						?>			
					</table>
					<? } else { ?>
					<table class="fuente8" width="87%" cellspacing=0 cellpadding=3 border=0>
						<tr>
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
