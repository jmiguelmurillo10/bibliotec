<?php

include("../testing_conection.php");
conectar();



$str_lbr_titulo="";
$str_aut_id="";
$str_lbr_editorial="";
$str_lbr_anioed="";
$str_asg_id="";
$str_lbr_colec="";
$str_lbr_volumen="";
$str_lbr_lugpub="";
//$str_lbr_borrado="";
$str_lbr_cantidad="";

 


if( isset($_POST['str_lbr_titulo']) ) 
    $str_lbr_titulo  = trim($_POST['str_lbr_titulo']);
if( isset($_POST['str_aut_id']) ) 
    $str_aut_id  = trim($_POST['str_aut_id']);
if( isset($_POST['str_lbr_editorial']) ) 
    $str_lbr_editorial  = trim($_POST['str_lbr_editorial']);
if( isset($_POST['str_lbr_anioed']) ) 
    $str_lbr_anioed  = trim($_POST['str_lbr_anioed']);
if( isset($_POST['str_asg_id']) ) 
    $str_asg_id  = trim($_POST['str_asg_id']);
if( isset($_POST['str_lbr_colec']) ) 
    $str_lbr_colec  = trim($_POST['str_lbr_colec']);
if( isset($_POST['str_lbr_volumen']) ) 
    $str_lbr_volumen  = trim($_POST['str_lbr_volumen']);
if( isset($_POST['str_lbr_lugpub']) ) 
    $str_lbr_lugpub  = trim($_POST['str_lbr_lugpub']);
if( isset($_POST['str_lbr_cantidad']) ) 
    $str_lbr_cantidad  = trim($_POST['str_lbr_cantidad']);

 
 
?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <!--<title>.:: Registrar Usuario ::. </title>-->
 
    <!--<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <link rel="stylesheet" href="estilos_inicio.css" type="text/css">-->
    <title>Registrar Libros</title>
        <link href="../estilos/estilos.css" type="text/css" rel="stylesheet">
    <script src="jquery171.js" type="text/javascript"></script>
    <script src="jquery.validate.js" type="text/javascript"></script>
    <script type="text/javascript" src="jquery.alerts.js"></script>
    <link href="jquery.alerts.css" rel="stylesheet" type="text/css" />
 
    <script type="text/javascript">
    <!--
        $().ready(function() {
        $("#registrar_libro").validate({
        rules: {
        /*A continuacion los nombres de los campos y sus reglas a cumplir */
            tx_titulo: {
                required: true, minlength: 5
            },
            tx_editorial: {
                required: true, minlength: 5
            },
            tx_anioed: {
                required: true, minlength: 4
            },
            tx_coleccion: {
                required: true, minlength: 2
            },
            tx_volumen: {
                required: true, minlength: 2
            },
            tx_lugar: {
                required: true, minlength: 5
            },
			tx_cantidad: {
                required: true, minlength: 2
            }
            
 
        },
        /*A continuacion los campos y los mensajes en caso de que no se cumplan las reglas */
        messages: {
            						
			
			tx_titulo: {
                required: "Por favor, Ingrese el Nombre del Libro.",
                minlength: jQuery.format("Por favor, Ingrese el Nombre del Libro."),
                equalTo: "Por favor, Ingrese el Nombre del Libro.",
            }
			tx_editorial: {
                required: "Por favor, Ingrese el Nombre de la Editorial",
                minlength: jQuery.format("Por favor, Ingrese el Nombre de la Editorial."),
                equalTo: "Por favor, Ingrese el Nombre de la Editorial.",
            }
			tx_anioed: {
                required: "Por favor, Ingrese el Año de Edicion",
                minlength: jQuery.format("Por favor, Ingrese el Año de Edicion, AAAA {0} "),
                equalTo: "Por favor, Ingrese el Año de Edicion",
            }
			tx_coleccion: {
                required: "Por favor, Ingrese la colección",
                minlength: jQuery.format("Por favor, Ingrese la colección"),
                equalTo: "Por favor, Ingrese la colección",
            }
			tx_volumen: {
                required: "Por favor, Ingrese el Volumen",
                minlength: jQuery.format("Por favor, Ingrese el Volumen"),
                equalTo: "Por favor, Ingrese el Volumen",
            }
			tx_lugar: {
                required: "Por favor, Ingrese el lugar de publicación",
                minlength: jQuery.format("Por favor, Ingrese el lugar de publicación"),
                equalTo: "Por favor, Ingrese el lugar de publicación",
            }
			tx_cantidad: {
                required: "Por favor, Ingrese la cantidad",
                minlength: jQuery.format("Por favor, Ingrese la cantidad"),
                equalTo: "Por favor, Ingrese la cantidad",
            }
			
			
 
        }
 
        });
        $("#tx_titulo").focus();
        });
    
    </script>
 
    <!--<link href="estilos/estilos_inicio.css" rel="stylesheet" type="text/css">-->
    <link href="estilos/estilos.css" rel="stylesheet" type="text/css">
</head>

<body>

    <div id="pagina">
            <div id="zonaContenido">
                <div align="center"> 
                     <div id="tituloForm" class="header" background-color="green">REGISTRAR LIBROS </div>
               
<br/>
 
 
<form id="registrar_libro" name="registrar_libro"  method="POST" action="guardar_libro.php">
 


<table width="600px" align="center"  style="font-family:Calibri; font-size:	12px;">
 
<tr class="prompt">
    <!--<td colspan="2" align="center"><h3><b>REGISTRAR USUARIOS</b></h3></td>-->
    <td >

    </td>
</tr>
 
<tr class="prompt">
    <td colspan="2"><!--Para registrar un Libro, ss deberá llenar los siguientes campos,
     seleccionar el Autor y La Asignatura y pulsar el boton <b>Registrar</b><br /><br />
    -->
	</td>
</tr>
     
    <?php
        //Si llega el parametro error y no viene vacio
        if( isset( $_POST['error'] ) && $_POST['error'] != '' ) {
    ?>
<tr class="prompt">
    <td colspan="2" >
        <font color="red">
            <ul>
				<?php
                    echo $_POST['msgs_error'];
                ?>
            </ul>
        </font>
        <div align="center"></div></td>
</tr>
    <?php
        }
    ?>
 
     
    <tr>
      <td class="prompt"><label for="tx_titulo">Titulo del libro </label></td>
        <td>
            <input type="text" name="tx_titulo" id="tx_titulo" value='<?php echo $str_lbr_titulo ?>' size="30"  maxlength="30" />
        </td>
    </tr>
	<tr>
      <td class="prompt"><label for="tx_editorial">Editorial</label></td>
        <td>
            <input type="text" name="tx_editorial" id="tx_editorial" value='<?php echo $str_lbr_editorial ?>' size="30"  maxlength="30" />
        </td>
    </tr>
    <tr>
      <td class="prompt"><label for="tx_anioed">A&ntilde;o de Edici&oacute;n</label></td>
        <td>
            <input type="text" name="tx_anioed" id="tx_anioed" value='<?php echo $str_lbr_anioed ?>' size="30"  maxlength="30" />
        </td>
    </tr>
    <tr>
      <td class="prompt"><label for="tx_coleccion">Colecci&oacute;n</label></td>
        <td>
            <input type="text" name="tx_coleccion" id="tx_coleccion"  value='<?php echo $str_lbr_colec ?>' size="30"  maxlength="30" />
        </td>
    </tr>
    <tr>
      <td class="prompt"><label for="tx_volumen">Volumen</label></td>
        <td>
            <input type="text" name="tx_volumen" id="tx_volumen"  value='<?php echo $str_lbr_volumen ?>' size="30"  maxlength="30" />
        </td>
    </tr>
    <tr>
      <td class="prompt"><label for="tx_lugar">Lugar de Publicaci&oacute;n</label></td>
        <td>
            <input type="text" name="tx_lugar" id="tx_lugar"  value='<?php echo $str_lbr_lugpub ?>' size="25"  maxlength="25"  />
        </td>
    </tr>
	<tr>
      <td class="prompt"><label for="tx_cantidad">Cantidad</label></td>
        <td>
            <input type="text" name="tx_cantidad" id="tx_cantidad"  value='<?php echo $str_lbr_cantidad ?>' size="25"  maxlength="25"  />
        </td>
    </tr>
	
	<?php					  	
					  	$query_autores="SELECT aut_id,aut_nom1,aut_apel1 FROM autores ORDER BY aut_apel1 ASC";
						$res_autores=mysql_query($query_autores);
						$contador=0;
	?>
	<tr>
		<!--<td width="15%" class="prompt">Autor</td>-->
		<td class="prompt" width="10%"><label for="tx_Autores">Autor</label></td>
		<td width="15%">
		<select id="cboAutores" name="cboAutores" class="comboGrande">
			<option value="0">Seleccione un Autor</option>
				<?php
					while ($contador < mysql_num_rows($res_autores)) { 
						if ($codautor == mysql_result($res_autores,$contador,"aut_id")) {?>
						<option value="<?php echo mysql_result($res_autores,$contador,"aut_id")?>" selected="selected"><?php echo mysql_result($res_autores,$contador,"aut_nom1")." ".mysql_result($res_autores,$contador,"aut_apel1");?></option>
						<? } 
						else { ?>
						<option value="<?php echo mysql_result($res_autores,$contador,"aut_id")?>"> <?php echo mysql_result($res_autores,$contador,"aut_nom1")." ".mysql_result($res_autores,$contador,"aut_apel1");?></option>
						<? } $contador++;
						} ?>				
		</select>							
		</td>
	</tr>
	
	<?php					  	
					  	$query_asignatura="SELECT * FROM asignatura ORDER BY asg_nombre ASC";
						$res_asignatura=mysql_query($query_asignatura);
						$contador1=0;
	?>
	<tr>
		<!--<td width="15%" class="prompt">Asignatura</td>-->
		<td class="prompt" width="10%"><label for="tx_signatura">Asignatura</label></td>
		<td width="15%">
		<select id="cboAsignatura" name="cboAsignatura" class="comboGrande">
			<option value="0">Seleccione una Asignatura</option>
				<?php
					while ($contador1 < mysql_num_rows($res_asignatura)) { 
						if ($codautor == mysql_result($res_asignatura,$contador1,"asg_id")) {?>
						<option value="<?php echo mysql_result($res_asignatura,$contador1,"asg_id")?>" selected="selected"><?php echo mysql_result($res_asignatura,$contador1,"asg_nombre");?></option>
						<? } 
						else { ?>
						<option value="<?php echo mysql_result($res_asignatura,$contador1,"asg_id")?>"> <?php echo mysql_result($res_asignatura,$contador1,"asg_nombre");?></option>
						<? } $contador1++;
						} ?>				
		</select>							
		</td>
	</tr>
	
 
<tr class="prompt">
 
    <td align="center" colspan="2">
        <br /><br />
        <!--<input type="button" onClick="javascript: location.href='./usuarios/index.php'" name="cancelar" value="Cancelar" >-->
		<input type="button" onClick="javascript: location.href='./index.php'" name="cancelar" value="Cancelar" >
        &nbsp;&nbsp;&nbsp;&nbsp;
        <input type="submit" name="registrarme" value="Registrar" >
    </td>
</tr>
 
</table>




<input id="accion" name="accion" value="alta" type="hidden">
</form>

                </div>
            </div>
        </div>
</body>
</html>
