<?php 
    /*  
  
    Este es un programa desarrollado bajo el concepto de Software Libre y Uds.,
	pueden modificarlo y redistribuirlo bajo los terminos de la GNU General 
	Public License como ha sido publicado por Free Software Foundation;
	ya sea bajo la Licencia version 2 o cualquier Licencia posterior.

    	
	Autores: Ignacio Albacete
			 Pedro Obregón Mejías
			 Rubén D. Mancera Morán
	
	Fecha Liberación del código: 15/10/2007
	Codeka 2007 -- Murcia	
	
	Este codigo ha sido modificado parcialmente por
	
	Fecha Liberación del código: 28/08/2010
	Grupo  CodeKa Mx --- Mexico , Chile
	                     Manuel Avalos
	                     Arturo Fertilio
						 Helio Trincado 	 


	Este codigo ha sido modificado parcialmente por www.MaxCode.com.ar
	
	Fecha Liberación del código: 29/03/2011
	Grupo  CodeKa Max --- Argentina
	                      Joaquin R. Rizer
	
	*/
header ("Expires: Thu, 27 Mar 1980 23:59:00 GMT"); //la pagina expira en una fecha pasada
header ("Last-Modified: " . gmdate("D, d M Y H:i:s") . " GMT"); //ultima actualizacion ahora cuando la cargamos
header ("Cache-Control: no-cache, must-revalidate"); //no guardar en CACHE
header ("Pragma: no-cache");

include("conectar.php");
include_once("./popupmsg/popup.class.php");

// Normal Usage  , with time out.

$HeadlineStyleArr["text-align"] = "left";
$HeadlineStyleArr["color"] = "purple"; 
$HeadlineStyleArr["background-color"] = "silver";
$HeadlineStyleArr["font-style"] = "italic";
$HeadlineStyleArr["font-family"] = "arial, sans-serif";
$MessageStyleArr["border"] = "black 8px solid";
$MessageStyleArr["filter"] =  "alpha(opacity=80)"; // IE
$MessageStyleArr["moz-opacity"] = 0.8;  //FF
$MessageStyleArr["opacity"] = 0.8;    // FF

$TextStyleArr["text-align"] = "center";
$TextStyleArr["color"] = "silver"; 
$TextStyleArr["background-color"] = "purple";
$TextStyleArr["font-weight"] = "bold";
$TextStyleArr["font-family"] = "arial, sans-serif";


?>

<html>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
 <link href="img/logo.ico" rel="shortcut icon">
  <title>MaxCodeKa - Gestion de Ventas de Entorno Web</title>
  <script language="JavaScript" src="menu/JSCookMenu.js"></script>
  <link rel="stylesheet" href="menu/theme.css" type="text/css">
  <script language="JavaScript" src="menu/theme.js"></script>
  <script language="JavaScript">

<!--

var MenuPrincipal = [
	[null,'Inicio',null,null,'Inicio',
		[null,'Reloj','./reloj/ureloj.php','principal','Reloj'],
		[null,'Calculadora','./calculadora/ucalculadora.php','principal','Calculadora'],
		_cmSplit,
		[null,'Salir','./salir.php','principal','Salir']
	],
	[null,'Inter. Comerciales',null,null,'Ventas clientes',
		[null,'Proveedores','./proveedores/index.php','principal','Proveedores'],
		[null,'Clientes','./clientes/index.php','principal','Clientes']
	],
	[null,'Productos',null,null,'Productos',
		[null,'Articulos','./articulos/index.php','principal','Articulos'],
		[null,'Familias','./familias/index.php','principal','Familias']
	],
	[null,'Ventas clientes',null,null,'Ventas clientes',
		[null,'Ventas Mostrador','./ventas_mostrador/index.php','principal','Ventas Mostrador'],
		[null,'Facturas de Ventas','./facturas_clientes/index.php','principal','Facturas'],
		[null,'Ordenes de salida','./albaranes_clientes/index.php','principal','Guia despacho'],
		[null,'Facturar Guia despacho ventas','./lote_albaranes_clientes/index.php','principal','Facturar Guia despacho']
	],
	[null,'Compras proveedores',null,null,'Compras proveedores',
		[null,'Facturas de Compras','./facturas_proveedores/index.php','principal','Proveedores'],
		[null,'Recepcion de mercancia','./albaranes_proveedores/index.php','principal','Guia despacho'],
		[null,'Facturar Guia despacho a proveedores','./lote_albaranes_proveedores/index.php','principal','Facturar Guia despacho']
	],
	[null,'Tesoreria',null,null,'Tesoreria',
	    [null,'Cobros','./cobros/index.php','principal','Cobros'],
		[null,'Pagos','./pagos/index.php','principal','Pagos'],
		[null,'Caja Diaria','./cerrarcaja/index.php','principal','Caja Diaria'],
		[null,'Libro Diario','./librodiario/index.php','principal','Libro Diario'],
		_cmSplit,
		[null,'Reportes',null,null,'Reportes',
			[null,'Costo Articulos en Stock','./fpdf/imprimir_articulos_costo.php','principal','Costo Articulos en Stock'],
	    	[null,'Productos Stock negativo','./fpdf/imprimir_stocks_negativo.php','principal','Productos Stocks negativos'],
		    [null,'Precios Netos Tienda','./fpdf/imprimir_articulos_venta.php','principal','Precios Netos Tienda']
	]	
	],
	[null,'Mantenimientos',null,null,'Mantenimientos',
		[null,'Etiquetas','./etiquetas/index.php','principal','Etiquetas'],
		[null,'Optimizar el sistema','./optimizar/index.php','principal','Optimizar el sistema'],
		[null,'Parametros del Sistema','./parametros/parametros.php','principal','Parámetros del Sistema'],
		_cmSplit,
		[null,'Tablas',null,null,'Tablas',
			[null,'Impuestos','./impuestos/index.php','principal','Impuestos'],
	    	[null,'Entidades bancarias','./entidades/index.php','principal','Entidades bancarias'],
		    [null,'Ubicaciones','./ubicaciones/index.php','principal','Ubicaciones'],
		    [null,'Embalajes','./embalajes/index.php','principal','Embalajes'],
			[null,'Provincias','./provincias/index.php','principal','Provincias'],
			[null,'Vendedores','./vendedores/index.php','principal','Vendedores'],
			[null,'Cobradores','./cobradores/index.php','principal','Cobradores'],
		    [null,'Formas de pago','./formaspago/index.php','principal','Formas de pago']
	]
	],
	[null,'Copias Seguridad',null,null,'Copias de Seguridad',
		[null,'Hacer copia','./backup/hacerbak.php','principal','Hacer copia'],
		[null,'Restaurar copia','./backup/restaurarbak.php','principal','Restaurar copia']
	],
	[null,'Ayuda',null,null,'Ayuda',
		[null,'Manual Conexion Hosting remoto','./servidor_remoto/manual_rem.php','principal','Manual Hosting Remoto'],
		[null,'Manual Conexion Hosting Local ','./servidor_local/manual_local.php','principal','Manual Hosting Local'],
		_cmSplit,
		[null,'Acerca de ....','./creditos.php','principal','Acerca de ....']
	]
];



--></script>

  <style type="text/css">
  body {
	font:Arial;
  	background-color: rgb(255, 255,255);
    background-image: url(images/superior.png);
    background-repeat: no-repeat;
	margin: 0px;
    }



  #MenuAplicacion { 
  	margin-left: 10px;
    margin-top: 0px;
    }
  </style>

</head>


<body>
	
	<div align="center">
		<!--<a href="http://www.maxcode.com.ar" style="font:Verdana; text-decoration:none; color:#000000; font-weight:bold; margin:-10px 0 10px 0;">MaxCodeKa</a>
		<a href="http://www.maxcode.com.ar" style="margin:0 0 0 680px"><img src="img/maxchico.jpg" alt="MaxCode" width="31" height="30" border="0" longdesc="Aplicaciones Web" style="margin:6px 0 0 0;"></a>	</div>-->
	<div id="MenuAplicacion" align="center"></div>



<script language="JavaScript">

<!--
	cmDraw ('MenuAplicacion', MenuPrincipal, 'hbr', cmThemeGray, 'ThemeGray');
-->

</script>

	<iframe src="central2.php" name="principal" title="principal" width="100%" height="1050px" frameborder=0 scrolling="no" style="margin-left: 0px; margin-right: 0px; margin-top: 2px; margin-bottom: 0px;"></iframe>

</body>

</html>

