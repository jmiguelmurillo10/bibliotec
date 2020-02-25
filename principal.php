<?php
session_start();



    //Conectar BD

    //include("conectar_bd.php");  
	require_once("conectar_bd.php");
    conectar_bd();

 

    //Sacar datos del usuario que ha iniciado sesion

    
	$sql = "SELECT  USR_NOM1,USR_APEL1,TUSR_NOMBRE,USR_ID

            FROM USUARIOS

            LEFT JOIN TUSUARIOS

            ON USUARIOS.USR_ID = TUSUARIOS.TUSR_ID

                    
			WHERE USR_ID = '".$_SESSION['uid']."'";         
			
    //$result     =mysql_query($sql); 
	$result     =mysqli_query($objetoMysqli,$sql); 

 

    $nombreUsuario = "";

 

    //Formar el nombre completo del usuario

    if( $fila = mysqli_fetch_array($result) )

        $nombreUsuario = $fila['USR_NOM1']." ".$fila['USR_APEL1'];

     

//Cerrrar conexion a la BD
//echo "test:",$_SESSION['uid'];
//$_SESSION['uid']="";
//echo "test2:",$_SESSION['uid'];

//mysql_close($conexio);
mysqli_close($objetoMysqli);
	
session_destroy();
?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>

    <title>.:: Inicio ::. Autenticar usuarios</title>

    <link rel="stylesheet" href="estilos.css" type="text/css">
	    <link rel="stylesheet" href="estilos_inicio_x.css" type="text/css">
	<script language="JavaScript" src="menu/JSCookMenu.js" type="text/javascript"></script>
  <link rel="stylesheet" href="menu/theme.css" type="text/css" />
  <script language="JavaScript" src="menu/theme.js" type="text/javascript"></script>
  <script language="JavaScript" type="text/javascript">
<!--
var MenuPrincipal = [
	//[null,'Inicio','Central.php','principal','Inicio'
	//[null,'Inicio',null,null,'Inicio'
	[null,'Inicio',null,null,'Usuarios',
		[null,'Usuarios','./usuarios/index.php','principal','Usuarios'],
		[null,'Carga Lote Usuarios','./usuarios/plantilla_iusuario.php','principal','Carga Lote Usuarios']
	],
	[null,'Biblioteca',null,null,'Bibliotecas',
		[null,'Libros','./libros/index.php','principal','Libros'],
		[null,'Carga Lote Libros','./clientes/index.php','principal','Clientes']
		
	],
	[null,'Autores','./autores/index.php','principal','Autores'
		
	],
	
	[null,'Asignaturas','./asignaturas/index.php','principal','Ventas clientes'
		
	],
	[null,'Registro',null,null,'Tesoreria',
		[null,'Ingreso Libros','./articulos/index.php','principal','Articulos'],
		[null,'Salida Libros','./familias/index.php','principal','Familias']
	]
	
];

</script>
  <style type="text/css">
  body { background-color: rgb(255, 255,255);
    background-image: url(images/superior.png);
    background-repeat: no-repeat;
	margin: 0px;
    }

  #MenuAplicacion { margin-left: 10px;
    margin-top: 10px;
    }


  </style>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />


</head>

<body topmargin="0" >
<div class="fondoSesion"> 
	<table align="right" width="1350px" border="0" class="fondoSesion" >
		<tr>                                              <!-- Dar Bienvenida al usuario -->
			<td  width="400px" align="right"><b>Usuario: </b><?php echo $nombreUsuario; ?></td>
			<!--<td  width="400px" align="right"><b>Usuario: </b><?php /*echo $testing; */?></td>-->
			<td width="1px" align="center">|</td>
			<td  width="10px" align="center">

				<!-- Proporcionar Link para cerrar sesion -->

				<a href="cerrarSesion.php" class="cerrarSesion" id="cerrarSesion2">Cerrar sesi&oacute;n</a> 

			</td>

		</tr>
	</table>

</div>

<br /><br />

<h2 align="center">SISTEMA BIBLIOTECARIO</h2>

 

        <!-- Contenido inicial del sitio web -->

         

<table border="0" align="\n">

	<tr>
		<td>
			
			&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
			&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp 
			
		</td>
	<td>
	<div id="MenuAplicacion" align="justify"></div>

		<script language="JavaScript" type="text/javascript">
		<!--
			cmDraw ('MenuAplicacion', MenuPrincipal, 'hbr', cmThemeGray, 'ThemeGray');
		-->
		</script>
	</td>
	
	</tr>


</table>	
<iframe src="Central.php" name="principal" width="100%" height="1050px" scrolling="No" frameborder="0" id="principal" style="margin-left: 0px; margin-right: 0px; margin-top: 2px; margin-bottom: 0px;" title="principal"></iframe>

<body>

</html>