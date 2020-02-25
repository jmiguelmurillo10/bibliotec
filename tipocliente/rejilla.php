<?php
include ("../conectar.php");
include ("../conectar_bd.php");
conectar_bd();

//$codfamilia=$_POST["codfamilia"];
$codfamilia=$_POST["cod_tipocliente"];
$nombre=$_POST["nombre"];
$cadena_busqueda=$_POST["cadena_busqueda"];

$where="1=1";
//if ($codfamilia <> "") { $where.=" AND codfamilia='$codfamilia'"; }
if ($codfamilia <> "") { $where.=" AND cod_tipocliente='$codfamilia'"; }
if ($nombre <> "") { $where.=" AND nombre like '%".$nombre."%'"; }

$where.=" ORDER BY nombre ASC";
$query_busqueda="SELECT count(*) as filas FROM tipoCliente WHERE borrado=0 AND ".$where;
$rs_busqueda=mysql_query($query_busqueda);
$filas=mysql_result($rs_busqueda,0,"filas");

?>
<html>
	<head>
		<title>Tipo Cliente</title>
		<!--<link href="../estilos/estilos_familias.css" type="text/css" rel="stylesheet">-->
		<link href="../estilos/estilos_general.css" type="text/css" rel="stylesheet">
		<script language="javascript">
		
		function ver_tipocliente(cod_tipocliente) {
			parent.location.href="ver_tipocliente.php?cod_tipocliente=" + cod_tipocliente + "&cadena_busqueda=<? echo $cadena_busqueda?>";
		}
		
		function modificar_tipocliente(cod_tipocliente) {
			parent.location.href="modificar_tipocliente.php?cod_tipocliente=" + cod_tipocliente + "&cadena_busqueda=<? echo $cadena_busqueda?>";
		}
		
		function eliminar_tipocliente(cod_tipocliente) {
			parent.location.href="eliminar_tipocliente.php?cod_tipocliente=" + cod_tipocliente + "&cadena_busqueda=<? echo $cadena_busqueda?>";
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
			<input type="hidden" name="numfilas" id="numfilas" value="<? echo $filas?>">
				<? $iniciopagina=$_POST["iniciopagina"];
				if (empty($iniciopagina)) { $iniciopagina=$_GET["iniciopagina"]; } else { $iniciopagina=$iniciopagina-1;}
				if (empty($iniciopagina)) { $iniciopagina=0; }
				if ($iniciopagina>$filas) { $iniciopagina=0; }
					if ($filas > 0) { ?>
						<? $sel_resultado="SELECT * FROM tipoCliente WHERE borrado=0 AND ".$where;
						   $sel_resultado=$sel_resultado."  limit ".$iniciopagina.",10";
						   $res_resultado=mysql_query($sel_resultado);
						   $contador=0;
						   while ($contador < mysql_num_rows($res_resultado)) { 
								 if ($contador % 2) { $fondolinea="itemParTabla"; } else { $fondolinea="itemImparTabla"; }?>
						<tr class="<?php echo $fondolinea?>" onMouseOver="CambiaColor(this,'#000000','#ffffff')" onMouseOut="CambiaColor2(this,'#000000')" >
							<td class="aCentro" width="12%"><? echo $contador+1;?></td>
							<td width="20%"><div align="center"><? echo mysql_result($res_resultado,$contador,"cod_tipocliente")?></div></td>
							<td width="50%"><div align="left"><? echo mysql_result($res_resultado,$contador,"nombre")?></div></td>
							<td width="6%"><div align="center"><a href="#"><img src="../img/modificar.png" width="16" height="16" border="0" onClick="modificar_tipocliente(<?php echo mysql_result($res_resultado,$contador,"cod_tipocliente")?>)" title="Modificar"></a></div></td>
														<td width="6%"><div align="center"><a href="#"><img src="../img/ver.png" width="16" height="16" border="0" onClick="ver_tipocliente(<?php echo mysql_result($res_resultado,$contador,"cod_tipocliente")?>)" title="Visualizar"></a></div></td>
							<td width="6%"><div align="center"><a href="#"><img src="../img/eliminar.png" width="16" height="16" border="0" onClick="eliminar_tipocliente(<?php echo mysql_result($res_resultado,$contador,"cod_tipocliente")?>)" title="Eliminar"></a></div></td>
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
					<? } ?>					
				</div>
		  </div>			
		</div>
	</body>
</html>
