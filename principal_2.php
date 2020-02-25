<?php
session_start();
if ( !($_SESSION['autenticado'] == 'SI' && isset($_SESSION['uid'])) )

{

    //En caso de que el usuario no este autenticado, crear un formulario y redireccionar a la 

    //pantalla de login, enviando un codigo de error

?>

        <form name="formulario" method="post" action="Index.php">

            <input type="hidden" name="msg_error" value="2">

        </form>

        <script type="text/javascript"> 

            document.formulario.submit();

        </script>

<?php

}

 

    //Conectar BD

    include("conectar_bd.php");  

    conectar_bd();

	echo "Principal 2";

    //Sacar datos del usuario que ha iniciado sesion

    $sql = "SELECT  USR_NOM1,USR_APEL1,TUSR_NOMBRE,USR_ID

            FROM USUARIOS

            LEFT JOIN TUSUARIOS

            ON USUARIOS.USR_ID = TUSUARIOS.TUSR_ID

                    
			WHERE USR_ID = '".$_SESSION['uid']."'";         

    $result     =mysql_query($sql); 

 

    $nombreUsuario = "";

 

    //Formar el nombre completo del usuario

    if( $fila = mysql_fetch_array($result) )

        $nombreUsuario = $fila['USR_NOM1']." ".$fila['USR_APEL1'];

     

//Cerrrar conexion a la BD

mysql_close($conexio);
	
?>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

    <title>.:: Inicio ::. Ejemplo autenticar usuarios</title>

    <link rel="stylesheet" href="estilos.css" type="text/css">
    <link rel="stylesheet" href="estilos_inicio_x.css" type="text/css">
	<script language="JavaScript" src="menu/JSCookMenu.js" type="text/javascript"></script>
  <link rel="stylesheet" href="menu/theme.css" type="text/css" />
  <script language="JavaScript" src="menu/theme.js" type="text/javascript"></script>
  <script language="JavaScript" type="text/javascript">
<!--
var MenuPrincipal = [
	[null,'Inicio','Central.php','principal','Inicio'],
	[null,'Inter. Comerciales',null,null,'Ventas clientes',
		[null,'Clientes','./clientes/index.php','principal','Clientes']
	],
	[null,'Productos',null,null,'Productos',
		[null,'Articulos','./articulos/index.php','principal','Articulos'],
		[null,'Familias','./familias/index.php','principal','Familias']
	],
	[null,'Ventas clientes',null,null,'Ventas clientes',
		[null,'Ventas Mostrador','./ventas_mostrador/index.php','principal','Ventas Mostrador'],
		[null,'Facturas','./facturas_clientes/index.php','principal','Facturas']
		//[null,'Guias de Remision','./albaranes_clientes/index.php','principal','Albaranes'],
		//[null,'Facturar albaranes','./lote_albaranes_clientes/index.php','principal','Facturar albaranes']
	],
	[null,'Compras proveedores',null,null,'Compras proveedores',
		[null,'Facturas','./facturas_proveedores/index.php','principal','Proveedores']
		//[null,'Guias de Remision','./albaranes_proveedores/index.php','principal','Albaranes'],
		//[null,'Facturar albaranes','./lote_albaranes_proveedores/index.php','principal','Facturar albaranes'],
	],
	[null,'Copias Seguridad',null,null,'Copias de Seguridad',
		[null,'Hacer copia','./backup/hacerbak.php','principal','Hacer copia'],
		[null,'Restaurar copia','./backup/restaurarbak.php','principal','Restaurar copia'],
	],
	[null,'Creditos','creditos.php','principal','Creditos']
];

--></script>
  <style type="text/css">
  body { background-color: rgb(255, 255,255);
    background-image: url(images/superior.png);
    background-repeat: no-repeat;
	margin: 0px;
    }

  #MenuAplicacion { margin-left: 10px;
    margin-top: 0px;
    }


  </style>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />


</head>

<body topmargin="0" >
<div class="fondoSesion"> 
<table align="right" width="1350px" border="0" class="fondoSesion">

<tr>                                              <!-- Dar Bienvenida al usuario -->

    <td  width="400px" align="right"><b>Usuario: </b><?php echo $nombreUsuario ?></td>
    <td width="1px" align="center">|</td>
    <td  width="10px" align="center">

        <!-- Proporcionar Link para cerrar sesion -->

        <a href="cerrarSesion.php" class="cerrarSesion" id="cerrarSesion2">Cerrar sesi&oacute;n</a> 

    </td>

</tr>

</table>
</div>

<br /><br />

<h2 align="center">Pantalla Principal</h2>

 

        <!-- Contenido inicial del sitio web -->

         
<div id="MenuAplicacion" align="center"></div>
<script language="JavaScript" type="text/javascript">
<!--
	cmDraw ('MenuAplicacion', MenuPrincipal, 'hbr', cmThemeGray, 'ThemeGray');
-->
</script>
<iframe src="Central.php" name="principal" width="100%" height="1050px" scrolling="No" frameborder="0" id="principal" style="margin-left: 0px; margin-right: 0px; margin-top: 2px; margin-bottom: 0px;" title="principal"></iframe>

<body>

</html>