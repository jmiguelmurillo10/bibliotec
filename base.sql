-- phpMyAdmin SQL Dump
-- version 2.10.3
-- http://www.phpmyadmin.net
-- 
-- Servidor: localhost
-- Tiempo de generación: 17-11-2014 a las 17:58:20
-- Versión del servidor: 5.0.51
-- Versión de PHP: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

-- 
-- Base de datos: `maxcodeka`
-- 

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `albalinea`
-- 


INSERT INTO `albalinea` VALUES (2, 1, 61, '49', 1.00, 60.00, 60.00, 0);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `albalineap`
-- 

CREATE TABLE `albalineap` (
  `codalbaran` varchar(20) NOT NULL default '0',
  `codproveedor` int(5) NOT NULL default '0',
  `numlinea` int(4) NOT NULL auto_increment,
  `codfamilia` int(3) default NULL,
  `codigo` varchar(15) default NULL,
  `cantidad` decimal(10,2) NOT NULL default '0.00',
  `precio` decimal(19,2) NOT NULL default '0.00',
  `importe` decimal(19,2) NOT NULL default '0.00',
  `dcto` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`codalbaran`,`codproveedor`,`numlinea`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Volcar la base de datos para la tabla `albalineap`
-- 


-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `albalineaptmp`
-- 

CREATE TABLE `albalineaptmp` (
  `codalbaran` int(11) NOT NULL default '0',
  `numlinea` int(4) NOT NULL auto_increment,
  `codfamilia` int(3) default NULL,
  `codigo` varchar(15) default NULL,
  `cantidad` decimal(19,2) NOT NULL default '0.00',
  `precio` decimal(19,2) NOT NULL default '0.00',
  `importe` decimal(19,2) NOT NULL default '0.00',
  `dcto` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`codalbaran`,`numlinea`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Volcar la base de datos para la tabla `albalineaptmp`
-- 


-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `albalineatmp`
-- 

CREATE TABLE `albalineatmp` (
  `codalbaran` int(11) NOT NULL default '0',
  `numlinea` int(4) NOT NULL auto_increment,
  `codfamilia` int(3) default NULL,
  `codigo` varchar(15) character set utf8 default NULL,
  `cantidad` decimal(19,2) NOT NULL default '0.00',
  `precio` decimal(19,2) NOT NULL default '0.00',
  `importe` decimal(19,2) NOT NULL default '0.00',
  `dcto` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`codalbaran`,`numlinea`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- 
-- Volcar la base de datos para la tabla `albalineatmp`
-- 


-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `albaranes`
-- 

CREATE TABLE `albaranes` (
  `codalbaran` int(11) NOT NULL auto_increment,
  `codfactura` int(11) NOT NULL default '0',
  `fecha` date NOT NULL default '0000-00-00',
  `iva` tinyint(4) NOT NULL default '0',
  `codcliente` int(5) default '0',
  `estado` varchar(1) character set utf8 default '1',
  `totalalbaran` decimal(19,2) NOT NULL,
  `borrado` varchar(1) NOT NULL default '0',
  PRIMARY KEY  (`codalbaran`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- 
-- Volcar la base de datos para la tabla `albaranes`
-- 

INSERT INTO `albaranes` VALUES (2, 0, '2011-03-06', 19, 18, '1', 71.40, '0');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `albaranesp`
-- 

CREATE TABLE `albaranesp` (
  `codalbaran` varchar(20) NOT NULL default '0',
  `codproveedor` int(5) NOT NULL default '0',
  `codfactura` varchar(20) default NULL,
  `fecha` date NOT NULL default '0000-00-00',
  `iva` tinyint(4) NOT NULL default '0',
  `estado` varchar(1) default '1',
  `totalalbaran` decimal(19,2) NOT NULL default '0.00',
  PRIMARY KEY  (`codalbaran`,`codproveedor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `albaranesp`
-- 


-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `albaranesptmp`
-- 

CREATE TABLE `albaranesptmp` (
  `codalbaran` int(11) NOT NULL auto_increment,
  `fecha` date NOT NULL default '0000-00-00',
  PRIMARY KEY  (`codalbaran`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Temporal de albaranes de proveedores para controlar acceso s' AUTO_INCREMENT=1 ;

-- 
-- Volcar la base de datos para la tabla `albaranesptmp`
-- 


-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `albaranestmp`
-- 

CREATE TABLE `albaranestmp` (
  `codalbaran` int(11) NOT NULL auto_increment,
  `fecha` date NOT NULL default '0000-00-00',
  PRIMARY KEY  (`codalbaran`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Temporal de albaranes para controlar acceso simultaneo' AUTO_INCREMENT=1 ;

-- 
-- Volcar la base de datos para la tabla `albaranestmp`
-- 


-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `articulos`
-- 

CREATE TABLE `articulos` (
  `codarticulo` int(10) NOT NULL auto_increment,
  `codfamilia` int(5) NOT NULL,
  `referencia` varchar(35) NOT NULL,
  `descripcion` varchar(35) NOT NULL,
  `impuesto` float NOT NULL,
  `codproveedor1` int(5) NOT NULL default '1',
  `codproveedor2` int(5) NOT NULL,
  `descripcion_corta` varchar(35) NOT NULL,
  `codubicacion` int(3) NOT NULL,
  `stock` int(10) NOT NULL,
  `stock_minimo` int(8) NOT NULL,
  `aviso_minimo` varchar(1) NOT NULL default '0',
  `datos_producto` varchar(200) NOT NULL,
  `fecha_alta` date NOT NULL default '0000-00-00',
  `codembalaje` int(3) NOT NULL,
  `unidades_caja` int(8) NOT NULL,
  `precio_ticket` varchar(1) NOT NULL default '0',
  `modificar_ticket` varchar(1) NOT NULL default '0',
  `observaciones` text NOT NULL,
  `precio_compra` decimal(19,2) default NULL,
  `precio_almacen` decimal(19,2) default NULL,
  `precio_tienda` decimal(19,2) default NULL,
  `precio_pvp` decimal(19,2) default NULL,
  `precio_iva` decimal(19,2) default NULL,
  `codigobarras` varchar(15) NOT NULL,
  `imagen` varchar(200) NOT NULL,
  `borrado` varchar(1) NOT NULL default '0',
  PRIMARY KEY  (`codarticulo`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Articulos' AUTO_INCREMENT=93 ;

-- 
-- Volcar la base de datos para la tabla `articulos`
-- 

INSERT INTO `articulos` VALUES (11, 18, '21023525674', 'Computador portatil bell', 19, 4, 5, 'computador bell', 1, -38, 2, '1', '', '2010-03-07', 3, 12, '1', '1', '', 120.00, 140.00, 180.00, NULL, 240.00, '5600000000113', 'foto11.jpg', '1');
INSERT INTO `articulos` VALUES (12, 18, '21078945631', 'Computador portatil Cannon ', 19, 4, 5, 'computador portatil   cannon', 4, -52, 3, '1', '', '2010-03-07', 3, 1, '1', '1', '', 124.00, 126.00, 137.00, NULL, 167.00, '8400000000123', 'foto12.jpg', '1');
INSERT INTO `articulos` VALUES (13, 19, '21089696314', 'Escritorio para notebook ', 19, 5, 6, 'escritorio', 1, -13, 1, '1', '', '2010-03-08', 3, 1, '1', '0', '', 234.00, 257.00, 567.00, NULL, 456.00, '8400000000130', 'foto13.jpg', '1');
INSERT INTO `articulos` VALUES (34, 25, '21078952345', 'Tornillos caja computadores', 19, 7, 0, 'TORNILLOS  1 "', 5, 25, 18, '1', 'Tornillos de 1"', '2010-10-15', 3, 1, '0', '', 'Tornillos de hierro dulce', 0.54, 0.65, 0.70, NULL, 1.00, '8400000000345', 'foto34.jpg', '1');
INSERT INTO `articulos` VALUES (39, 66, '21096314789', 'COOLER PARA CASE DE 12cm', 19, 15, 0, 'COOLER PARA CASE DE 12 cm', 3, 39, 1, '1', 'COOLER EVER GREEN FAN EVERCOOL DE 12cm', '2010-11-06', 7, 1, '1', '0', 'Modelo Nro EGF-12', 14.32, 17.04, 19.50, NULL, 24.99, '8400000001119', 'foto39.jpg', '1');
INSERT INTO `articulos` VALUES (40, 66, '21096385248', 'Cooler MARTECH de 5cm', 19, 12, 0, 'COOLER  MARTECH de 5cm', 5, -28, 1, '0', 'Cooler para case MARTECH de 5cm color negro', '2010-11-06', 5, 1, '1', '0', 'Hecho en China', 4.00, 4.76, 5.52, NULL, 7.14, '8400000000406', 'foto40.jpg', '1');
INSERT INTO `articulos` VALUES (41, 66, '20412896324', 'Personal computer Air Cond', 19, 12, 0, 'AIRE ACONDICIONADO PARA PC', 5, 215, 1, '1', 'Color: Azul con plateado / Dimensión: 149.5 x 42.7 x 85.5cm', '2010-11-06', 7, 1, '1', '0', 'Sólo para bahias de 5.25"', 18.27, 24.80, 25.00, NULL, 21.74, '8400000000879', 'foto41.jpg', '0');
INSERT INTO `articulos` VALUES (42, 40, '21012385296', 'TARJETA DE RED INALAMBRICA TP-LINK ', 19, 16, 0, 'NIC INALAMBR TP-LINK TL-WN551', 5, -15196, 1, '1', 'Para Slot PCI / Rango 4x / seguridad WEB/WPA/WPA2/ fácil de usar / 54 Mbps / ', '2010-11-06', 1, 1, '1', '0', 'CON ANTENA OMNIDIRECCIONAL DESMONTABLE.', 36.54, 49.80, 50.00, NULL, 43.49, '8400000000420', 'foto42.jpg', '1');
INSERT INTO `articulos` VALUES (49, 61, '21036985215', 'CARTUCHO DE TINTA CANON CL-31 TRICO', 19, 12, 0, 'CARTUCHO CANON CL-31 TRICOLOR', 5, 869, 1, '1', 'PARA IMPRESORAS SERIE PIXMA: IP1800/IP1900/IP2500/IP2600/MP140/MP190/MP210/MP220/MP470/MX300 & MX310', '2010-11-12', 1, 1, '1', '0', 'CARTUCHO TRICOLOR DE 3ml x 3ml = 9ml', 47.13, 60.00, 64.50, NULL, 56.08, '013803078411', 'foto49.jpg', '0');
INSERT INTO `articulos` VALUES (50, 69, '21078996326', 'BATERIA PARA PC - SONY CR2032', 19, 13, 0, 'BATERIA  SONY CR2032', 5, -202, 1, '1', 'PARA COMPUTADORAS Y OTROS DISPOSITIVOS QUE UTILICEN ESTE MODELO DE BATERIAS', '2010-11-12', 1, 100, '1', '0', 'producto muy vrsatil', 85.00, 83.00, 115.00, NULL, 101.15, '56000324562', 'foto50.jpg', '1');
INSERT INTO `articulos` VALUES (83, 61, '75022223804', 'Disco Compacto sin grabar', 19, 17, 16, 'CD grabable', 5, 549, 20, '1', '', '2010-12-18', 1, 500, '1', '0', 'No', 2.00, 3.00, 5.00, NULL, 8.20, '7502222380494', 'foto83.jpg', '0');
INSERT INTO `articulos` VALUES (89, 72, '12324578789', 'Balanza', 19, 0, 0, 'Balanza Iris 2 Kg.', 5, 30, 7, '1', 'vvmbnmvmn', '2010-10-22', 8, 0, '0', '0', 'hjjhkbkjk', 123.00, 89.00, 789.00, NULL, 789631.00, '5600000000892', 'foto89.jpg', '0');
INSERT INTO `articulos` VALUES (90, 72, '45636985274', 'Balanza americana 3 kilos', 19, 12, 0, 'Balanza Huneus 3 kilos', 5, -1, 1, '1', '', '2010-10-06', 8, 12, '1', '0', '', 123.00, 123.00, 123.00, 563.00, 2233.00, '5600000000908', 'foto90.jpg', '0');
INSERT INTO `articulos` VALUES (91, 46, '2K000224', 'T1000', 12, 12, 0, 'POS', 5, 4, 1, '0', 'POS', '2014-09-24', 1, 12, '0', '0', 'POS', 1000.00, 1200.00, 1500.00, NULL, 1590.00, '2K000224', 'foto91.jpg', '0');
INSERT INTO `articulos` VALUES (92, 69, '1234567890', 'test', 12, 12, 0, 'test 2', 5, 100, 5, '1', 'test test', '2014-11-10', 1, 10, '0', '', 'sdsdfsd', 8.00, 10.00, 12.00, NULL, 13.84, '5600000000922', 'foto92.jpg', '0');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `artpro`
-- 

CREATE TABLE `artpro` (
  `codarticulo` varchar(15) NOT NULL,
  `codfamilia` int(3) NOT NULL,
  `codproveedor` int(5) NOT NULL,
  `precio` decimal(19,2) NOT NULL,
  PRIMARY KEY  (`codarticulo`,`codfamilia`,`codproveedor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `artpro`
-- 

INSERT INTO `artpro` VALUES ('13', 18, 4, 234.00);
INSERT INTO `artpro` VALUES ('16', 18, 7, 114802.00);
INSERT INTO `artpro` VALUES ('16', 18, 8, 12352.00);
INSERT INTO `artpro` VALUES ('34', 25, 7, 0.54);
INSERT INTO `artpro` VALUES ('42', 40, 12, 36.54);
INSERT INTO `artpro` VALUES ('39', 66, 15, 14.32);
INSERT INTO `artpro` VALUES ('42', 40, 17, 36.54);
INSERT INTO `artpro` VALUES ('82', 63, 17, 95.00);
INSERT INTO `artpro` VALUES ('50', 69, 20, 85.00);
INSERT INTO `artpro` VALUES ('40', 66, 12, 5.00);
INSERT INTO `artpro` VALUES ('83', 61, 13, 2.00);
INSERT INTO `artpro` VALUES ('83', 61, 17, 4.00);
INSERT INTO `artpro` VALUES ('89', 72, 12, 125.00);
INSERT INTO `artpro` VALUES ('90', 72, 13, 122.00);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `authteam`
-- 

CREATE TABLE `authteam` (
  `id` int(4) NOT NULL auto_increment,
  `teamname` varchar(25) NOT NULL default '',
  `teamlead` varchar(25) NOT NULL default '',
  `status` varchar(10) NOT NULL default '',
  PRIMARY KEY  (`id`),
  KEY `teamname` (`teamname`,`teamlead`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

-- 
-- Volcar la base de datos para la tabla `authteam`
-- 

INSERT INTO `authteam` VALUES (1, 'Ungrouped', 'sa', 'active');
INSERT INTO `authteam` VALUES (2, 'Admin', 'sa', 'active');
INSERT INTO `authteam` VALUES (3, 'Temporary', 'sa', 'active');
INSERT INTO `authteam` VALUES (7, 'Group 1', 'sa', 'active');
INSERT INTO `authteam` VALUES (8, 'Group 2', 'test', 'active');
INSERT INTO `authteam` VALUES (9, 'Group 3', 'admin', 'active');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `authuser`
-- 

CREATE TABLE `authuser` (
  `id` int(11) NOT NULL auto_increment,
  `uname` varchar(25) NOT NULL default '',
  `passwd` varchar(32) NOT NULL default '',
  `team` varchar(25) NOT NULL default '',
  `level` int(4) NOT NULL default '0',
  `status` varchar(10) NOT NULL default '',
  `lastlogin` datetime default NULL,
  `logincount` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

-- 
-- Volcar la base de datos para la tabla `authuser`
-- 

INSERT INTO `authuser` VALUES (1, 'sa', '9df3b01c60df20d13843841ff0d4482c', 'Admin', 1, 'active', '2010-06-26 11:29:28', 12);
INSERT INTO `authuser` VALUES (2, 'admin', '9df3b01c60df20d13843841ff0d4482c', 'Admin', 1, 'active', '2010-06-22 18:30:24', 21);
INSERT INTO `authuser` VALUES (3, 'test', '9df3b01c60df20d13843841ff0d4482c', 'Temporary', 999, 'active', '2003-04-03 00:00:34', 0);
INSERT INTO `authuser` VALUES (11, 'G1-0001', '9df3b01c60df20d13843841ff0d4482c', 'Group 1', 5, 'active', '2003-04-04 10:59:02', 0);
INSERT INTO `authuser` VALUES (12, 'G1-0002', '9df3b01c60df20d13843841ff0d4482c', 'Group 1', 2, 'active', '0000-00-00 00:00:00', 0);
INSERT INTO `authuser` VALUES (13, 'G2-0001', '9df3b01c60df20d13843841ff0d4482c', 'Group 2', 5, 'active', '2003-04-03 00:46:20', 0);
INSERT INTO `authuser` VALUES (14, 'G2-0002', '9df3b01c60df20d13843841ff0d4482c', 'Group 2', 6, 'active', '2003-04-03 00:48:04', 0);
INSERT INTO `authuser` VALUES (15, 'G2-0003', '9df3b01c60df20d13843841ff0d4482c', 'Group 2', 3, 'active', '2003-04-04 10:31:16', 0);
INSERT INTO `authuser` VALUES (16, 'G3-0001', '9df3b01c60df20d13843841ff0d4482c', 'Group 3', 10, 'active', '0000-00-00 00:00:00', 0);
INSERT INTO `authuser` VALUES (17, 'G3-0002', '9df3b01c60df20d13843841ff0d4482c', 'Group 3', 4, 'active', '0000-00-00 00:00:00', 0);
INSERT INTO `authuser` VALUES (20, 'arturo', '34facb611d63077b415e7e4ae92845a2', 'Group 2', 4, 'active', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `clientes`
-- 

CREATE TABLE `clientes` (
  `codcliente` int(5) NOT NULL auto_increment,
  `nombre` varchar(40) NOT NULL,
  `nif` varchar(15) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `codprovincia` int(2) NOT NULL default '0',
  `localidad` varchar(35) NOT NULL,
  `codformapago` int(2) NOT NULL default '0',
  `codentidad` int(2) NOT NULL default '0',
  `cuentabancaria` varchar(20) NOT NULL,
  `codpostal` varchar(5) NOT NULL,
  `telefono` varchar(14) NOT NULL,
  `movil` varchar(14) NOT NULL,
  `email` varchar(35) NOT NULL,
  `web` varchar(45) NOT NULL,
  `borrado` varchar(1) NOT NULL default '0',
  PRIMARY KEY  (`codcliente`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Clientes' AUTO_INCREMENT=40 ;

-- 
-- Volcar la base de datos para la tabla `clientes`
-- 

INSERT INTO `clientes` VALUES (1, 'Cliente Mostrador', 'NA', 'NA', 0, '', 0, 0, '', '', '', '', '', '', '1');
INSERT INTO `clientes` VALUES (6, 'Compueasy', 'HEJS821008 KQ4', 'Avda, Juan Aldama nº 87 ', 16, 'Tlaquiltenango', 1, 4, '', '62983', '3421574', '', 'compueasy@mail.com', '', '1');
INSERT INTO `clientes` VALUES (16, 'CORPORACION TECNICA INTERNACIONAL DE SER', '20479950602', 'CAL. 7 DE ENERO NRO. 1241 ', 9, 'Xochilmilco', 3, 15, '352-851-78', '074', '896132', '', '', '', '0');
INSERT INTO `clientes` VALUES (17, 'INSTITUTO ALMA MATER SAC', '20438264095', 'CAL. ALFONSO UGARTE NRO. 670', 9, 'Xochilmilco', 2, 15, '632-897-85', '0745', '227312', '', '', '', '0');
INSERT INTO `clientes` VALUES (18, 'PERALES HUANCARUNA S.A.C.', '20131495006', 'CAR. PANAMERICANA NORTE NRO. 3.5', 9, 'Milpa Alto', 3, 15, '963-125-56', '074', '459126', '', '', '', '0');
INSERT INTO `clientes` VALUES (21, 'TANK''S 105 SERVICIOS GENERALES S.R.L.', '20482006729', 'CAL. LOS ALUMNOS NRO. 198', 9, 'Benito Juarez', 3, 12, '897-859-96', '0743', '876965', '', '', '', '0');
INSERT INTO `clientes` VALUES (19, 'TUME GONZALES WALTER ENRIQUE', '10805858953', 'CAL. ANTONIO RAYMONDI NRO. 466 INT. B URB. EL', 0, 'CHICLAYO', 3, 0, '', '', '', '', '', '', '1');
INSERT INTO `clientes` VALUES (20, 'APILADORA MARIA DEL PILAR S.C.R.L', '20479653063', 'CAR. PANAMERICANA NORTE NRO. K783 ', 9, 'Xochilmilco', 3, 15, '321-963-42', '074', '941365', '', '', '', '0');
INSERT INTO `clientes` VALUES (22, 'TAI LOY S.A.', '20100049181', 'CAL. ALFREDO LAPOINT NRO. 8704', 9, 'Benito Juarez', 3, 15, '785-785-89', '0743', '986452', '', '', '', '0');
INSERT INTO `clientes` VALUES (23, 'CORPORACION EDUCATIVA CESAR Y DAVID CORN', '20480510497', 'AV. MANUEL MARIA IZAGA NRO. 866', 9, 'Benito Juarez', 3, 15, '961-752-96', '', '153957', '', '', '', '0');
INSERT INTO `clientes` VALUES (24, 'REPUESTOS ZAMORA S.R.LTDA.', '20171776482', 'AV. LUIS GONZALES NRO. 1272 ', 9, 'Benito Juarez', 3, 12, '987-362-78', '9874', '796452', '', '', '', '0');
INSERT INTO `clientes` VALUES (25, 'JERPIMED S.A.C.', '20535558966', 'AV. JAVIER PRADO ESTE NRO. 499 ', 9, 'Xochilmilco', 3, 13, '965-758-23', '015', '986785', '', '', '', '0');
INSERT INTO `clientes` VALUES (26, 'MUNICIPALIDAD DISTRITAL DE XOCHIMILCO', '20162368703', 'CAL. TUPAC AMARU NRO. 0531 ', 9, 'Xochimilco', 2, 0, '563-458-74', '074', '789632', '', '', '', '0');
INSERT INTO `clientes` VALUES (27, 'GONZALES YAIPEN GABRIEL', '10166530925', 'CAL. VICENTE DE LA VEGA NRO. 936', 9, 'Benito Juarez', 3, 16, '748-965-78', '074', '987632', '', '', '', '0');
INSERT INTO `clientes` VALUES (28, 'COMPUTROCK E.I.R.L.', '20480632410', 'CAL. ALFREDO LAPOINT NRO. 945 CENTRO', 9, 'Xochilmilco', 2, 13, '961-789-23', '074', '789325', '', '', '', '0');
INSERT INTO `clientes` VALUES (29, 'RODRIGUEZ DE QUIROZ, JULIA MERCEDES', '10166743074', 'CAL. VALDIVIEZO MZA. C LOTE. 02 ', 9, 'Benito Juarez', 3, 12, '987-965-78', '0741', '320727', '', '', '', '0');
INSERT INTO `clientes` VALUES (30, 'LORENROSE SRL', '20480799110', 'CAL. ALFREDO LAPOINT NRO. 1210', 9, 'Xochimilco', 3, 16, '654-852-89', '7896', '984563', '', '', '', '0');
INSERT INTO `clientes` VALUES (31, 'CONSTRUCCION Y ADMINISTRACION S.A.', '20109565017', 'AV. JAVIER PRADO ESTE NRO. 4109 ', 9, 'Benito Juarez', 3, 12, '782-782-89', '01', '611393 ', '', 'admin@rivanet.com.ar', '', '0');
INSERT INTO `clientes` VALUES (32, 'GLOBETECH CIX S.R.L.', '20487455637', 'CAL. LAPOINT NRO. 654 ', 9, 'Milpa Alto', 3, 13, '965-785-89', '074', '437086', '9560131', '', '', '0');
INSERT INTO `clientes` VALUES (33, 'DEIBBIE JAVIER YARLAQUÉ SANTISTEBAN', '45489110451', 'FEDERICO VILLARREAL 733', 9, 'Xochilmilco', 2, 12, '879-632-45', '0741', '789632', '978741036', 'deibi16_1_89@hotmail.com', '', '0');
INSERT INTO `clientes` VALUES (34, 'karla Garcia Castaño', 'GCK681221k52', 'Rio Caletiano 226', 19, 'Monterrey', 5, 0, '', '64859', '854656231', '894535412', 'karla@me.com', '', '1');
INSERT INTO `clientes` VALUES (38, 'asd ', '', '', 0, '', 0, 0, '', '', '', '', '', '', '1');
INSERT INTO `clientes` VALUES (39, 'JUAN MURILLO', '1804109559', 'QUITO', 21, 'QUITO', 3, 0, '', '593', '023968480', '0999891887', 'TLGO_JUAN@YAHOO.ES', 'WWW.JM.COM', '0');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `cobradores`
-- 

CREATE TABLE `cobradores` (
  `codcobrador` int(2) NOT NULL auto_increment,
  `nombrecobrador` varchar(40) NOT NULL,
  `borrado` varchar(1) NOT NULL default '0',
  PRIMARY KEY  (`codcobrador`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Cobradores' AUTO_INCREMENT=9 ;

-- 
-- Volcar la base de datos para la tabla `cobradores`
-- 

INSERT INTO `cobradores` VALUES (1, 'ernesto  perez ', '1');
INSERT INTO `cobradores` VALUES (2, 'juan gacitua', '0');
INSERT INTO `cobradores` VALUES (4, 'irene perez', '0');
INSERT INTO `cobradores` VALUES (5, 'xccxcxc', '1');
INSERT INTO `cobradores` VALUES (6, 'jbbbb', '1');
INSERT INTO `cobradores` VALUES (7, 'vbxfzf', '1');
INSERT INTO `cobradores` VALUES (8, 'asd', '1');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `cobros`
-- 

CREATE TABLE `cobros` (
  `id` int(11) NOT NULL auto_increment,
  `codfactura` int(11) NOT NULL,
  `codcliente` int(5) NOT NULL,
  `importe` decimal(19,2) NOT NULL,
  `codformapago` int(2) NOT NULL,
  `numdocumento` varchar(30) NOT NULL,
  `fechacobro` date NOT NULL default '0000-00-00',
  `observaciones` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Cobros de facturas a clientes' AUTO_INCREMENT=25 ;

-- 
-- Volcar la base de datos para la tabla `cobros`
-- 

INSERT INTO `cobros` VALUES (1, 1, 1, 192.42, 1, '7896321456', '2011-02-22', '');
INSERT INTO `cobros` VALUES (2, 3, 1, 20.00, 3, '1234', '2011-02-28', 'primer pago');
INSERT INTO `cobros` VALUES (3, 3, 1, 35.68, 7, '3456', '2011-02-22', 'cheq');
INSERT INTO `cobros` VALUES (4, 5, 1, 82.47, 6, '7896325621', '2011-02-23', '');
INSERT INTO `cobros` VALUES (5, 10, 16, 153.51, 3, '', '2011-02-23', '');
INSERT INTO `cobros` VALUES (6, 13, 1, 59.50, 1, '', '2011-02-23', '');
INSERT INTO `cobros` VALUES (7, 4, 18, 5.00, 3, '', '2011-02-25', '');
INSERT INTO `cobros` VALUES (8, 2007, 17, 7.10, 7, '896321', '2011-02-26', '');
INSERT INTO `cobros` VALUES (9, 2000, 1, 190.16, 3, '33', '2011-03-05', '');
INSERT INTO `cobros` VALUES (10, 2020, 1, 29.75, 1, '', '2011-03-06', '');
INSERT INTO `cobros` VALUES (11, 2021, 16, 20.00, 3, '123', '2011-03-06', '');
INSERT INTO `cobros` VALUES (12, 2021, 16, 51.40, 3, '456', '2011-03-06', '');
INSERT INTO `cobros` VALUES (13, 2022, 22, 55.10, 3, '345', '2011-03-06', 'cheque banco machala');
INSERT INTO `cobros` VALUES (14, 2018, 16, 50.00, 3, '', '2011-03-06', '1er abono');
INSERT INTO `cobros` VALUES (15, 2024, 1, 76.76, 3, '', '2011-03-07', '');
INSERT INTO `cobros` VALUES (16, 2025, 1, 59.50, 3, '', '2011-03-07', '');
INSERT INTO `cobros` VALUES (17, 2028, 1, 938.91, 1, '456321', '2011-03-07', '');
INSERT INTO `cobros` VALUES (18, 2029, 1, 146.37, 6, '12364', '2011-03-07', '');
INSERT INTO `cobros` VALUES (19, 2031, 1, 29.75, 3, '', '2011-03-09', '');
INSERT INTO `cobros` VALUES (20, 2038, 16, 938.91, 1, '', '2011-03-30', '');
INSERT INTO `cobros` VALUES (21, 2049, 1, 0.00, 3, '1234567', '2014-09-24', 'test');
INSERT INTO `cobros` VALUES (22, 2048, 1, 29.75, 3, '12345678', '2014-09-24', 'test2');
INSERT INTO `cobros` VALUES (23, 2051, 28, 1680.00, 3, '1234567', '2014-10-14', 'test');
INSERT INTO `cobros` VALUES (24, 2052, 1, 137.76, 3, '134', '2014-11-13', 'pago en efectivo con discrepancias de precio');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `emails`
-- 

CREATE TABLE `emails` (
  `codigo` int(11) NOT NULL auto_increment,
  `email` varchar(100) default NULL,
  PRIMARY KEY  (`codigo`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- 
-- Volcar la base de datos para la tabla `emails`
-- 

INSERT INTO `emails` VALUES (4, 'codekamx@gmail.com');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `embalajes`
-- 

CREATE TABLE `embalajes` (
  `codembalaje` int(3) NOT NULL auto_increment,
  `nombre` varchar(30) default NULL,
  `borrado` varchar(1) NOT NULL default '0',
  PRIMARY KEY  (`codembalaje`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Embalajes' AUTO_INCREMENT=10 ;

-- 
-- Volcar la base de datos para la tabla `embalajes`
-- 

INSERT INTO `embalajes` VALUES (1, 'Caja', '0');
INSERT INTO `embalajes` VALUES (2, 'resma', '0');
INSERT INTO `embalajes` VALUES (3, 'unidad', '0');
INSERT INTO `embalajes` VALUES (4, 'No aplica', '0');
INSERT INTO `embalajes` VALUES (7, 'Blister', '0');
INSERT INTO `embalajes` VALUES (8, 'kilos', '0');
INSERT INTO `embalajes` VALUES (9, 'm2', '0');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `entidades`
-- 

CREATE TABLE `entidades` (
  `codentidad` int(2) NOT NULL auto_increment,
  `nombreentidad` varchar(50) NOT NULL,
  `borrado` varchar(1) NOT NULL default '0',
  PRIMARY KEY  (`codentidad`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Entidades Bancarias' AUTO_INCREMENT=55 ;

-- 
-- Volcar la base de datos para la tabla `entidades`
-- 

INSERT INTO `entidades` VALUES (35, 'Banco del Austro', '0');
INSERT INTO `entidades` VALUES (34, 'Banco Internacional', '0');
INSERT INTO `entidades` VALUES (33, 'Banco Bolivariano', '0');
INSERT INTO `entidades` VALUES (32, 'Produbanco', '0');
INSERT INTO `entidades` VALUES (31, 'Banco de Guayaquil', '0');
INSERT INTO `entidades` VALUES (30, 'Banco del Pacifico', '0');
INSERT INTO `entidades` VALUES (26, 'asd', '1');
INSERT INTO `entidades` VALUES (36, 'Banco Promerica', '0');
INSERT INTO `entidades` VALUES (37, 'Banco de Machala', '0');
INSERT INTO `entidades` VALUES (38, 'BGR', '0');
INSERT INTO `entidades` VALUES (39, 'Citibank', '0');
INSERT INTO `entidades` VALUES (40, 'Banco ProCredit', '0');
INSERT INTO `entidades` VALUES (41, 'UniBanco', '0');
INSERT INTO `entidades` VALUES (42, 'Banco Solidario', '0');
INSERT INTO `entidades` VALUES (43, 'Banco de Loja', '0');
INSERT INTO `entidades` VALUES (44, 'Banco Territorial', '0');
INSERT INTO `entidades` VALUES (45, 'Banco Coopnacional', '0');
INSERT INTO `entidades` VALUES (46, 'Banco Amazonas', '0');
INSERT INTO `entidades` VALUES (47, 'Banco Capital', '0');
INSERT INTO `entidades` VALUES (48, 'Banco DMIRO', '0');
INSERT INTO `entidades` VALUES (49, 'Banco Finca', '0');
INSERT INTO `entidades` VALUES (50, 'Banco Comercial de Manabi', '0');
INSERT INTO `entidades` VALUES (51, 'Banco COFIEC', '0');
INSERT INTO `entidades` VALUES (52, 'Banco del Litoral', '0');
INSERT INTO `entidades` VALUES (53, 'Banco Delbank', '0');
INSERT INTO `entidades` VALUES (54, 'Banco Sudamericano', '0');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `eventcal`
-- 

CREATE TABLE `eventcal` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `eventDate` date default NULL,
  `eventTitle` varchar(100) default NULL,
  `eventContent` text,
  `borrado` varchar(1) character set cp850 NOT NULL default '1',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

-- 
-- Volcar la base de datos para la tabla `eventcal`
-- 

INSERT INTO `eventcal` VALUES (1, '2010-09-28', 'ivas', 'pagar', '1');
INSERT INTO `eventcal` VALUES (2, '2010-09-30', 'Cumpleaño Maria Ines', 'Nos reuniremos a almorzar con la jefatura en el Casino Royal. Cancela la Empresa', '1');
INSERT INTO `eventcal` VALUES (3, '2010-10-05', 'despedida soltero', 'nos vamos pa la costa', '1');
INSERT INTO `eventcal` VALUES (4, '2010-10-14', 'fiesta', 'en rancagua', '0');
INSERT INTO `eventcal` VALUES (5, '2010-10-08', 'buenas noticias', 'seran aumentados los sueldos bases en un 25 % para todos aquellos que logren su titulo de Master en informatica antes del 30 de Diciembre de este año.', '1');
INSERT INTO `eventcal` VALUES (6, '2010-12-09', 'test', 'test de evento', '1');
INSERT INTO `eventcal` VALUES (7, '2010-12-31', 'xasas', 'asasas', '1');
INSERT INTO `eventcal` VALUES (8, '2010-12-30', 'carlos', 'no hay mas', '1');
INSERT INTO `eventcal` VALUES (9, '2010-12-27', 'cotiz<acxnes pendientes', 'ganancia $ 110.00 cada cotizacion', '1');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `events`
-- 

CREATE TABLE `events` (
  `eventID` bigint(20) unsigned NOT NULL auto_increment,
  `eventDate` date default NULL,
  `eventContent` longtext,
  `langCode` varchar(20) default 'en',
  PRIMARY KEY  (`eventID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

-- 
-- Volcar la base de datos para la tabla `events`
-- 

INSERT INTO `events` VALUES (1, '2010-09-23', 'this is my first ', 'en');
INSERT INTO `events` VALUES (2, '2010-09-30', 'this is my second event', 'en');
INSERT INTO `events` VALUES (3, '2010-09-30', '&#2351;&#2361; &#2350;&#2375;&#2352;&#2366; &#2346;&#2361;&#2354;&#2366; &#2360;&#2306;&#2342;&#2375;&#2358; &#2361;&#2376;', 'hi');
INSERT INTO `events` VALUES (4, '2010-09-29', 'This is new event', 'en');
INSERT INTO `events` VALUES (5, '2005-03-29', 'This is new event', 'en');
INSERT INTO `events` VALUES (6, '2005-03-29', 'This is new event', 'en');
INSERT INTO `events` VALUES (7, '2005-04-15', 'This is new event', 'en');
INSERT INTO `events` VALUES (8, '2005-04-15', 'This is new event', 'en');
INSERT INTO `events` VALUES (9, '2005-04-17', 'This is updated third event', 'en');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `factulinea`
-- 

CREATE TABLE `factulinea` (
  `codfactura` int(11) NOT NULL,
  `numlinea` int(4) NOT NULL auto_increment,
  `codfamilia` int(3) NOT NULL,
  `codigo` varchar(15) NOT NULL,
  `cantidad` decimal(19,2) NOT NULL,
  `precio` decimal(19,2) NOT NULL,
  `importe` decimal(19,2) NOT NULL,
  `dcto` tinyint(4) NOT NULL,
  PRIMARY KEY  (`codfactura`,`numlinea`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='lineas de facturas a clientes' AUTO_INCREMENT=1 ;

-- 
-- Volcar la base de datos para la tabla `factulinea`
-- 

INSERT INTO `factulinea` VALUES (1, 1, 40, '42', 1.00, 50.00, 49.00, 2);
INSERT INTO `factulinea` VALUES (1, 2, 69, '50', 1.00, 115.00, 112.70, 2);
INSERT INTO `factulinea` VALUES (2, 1, 61, '49', 1.00, 60.00, 52.80, 12);
INSERT INTO `factulinea` VALUES (2, 2, 66, '41', 1.00, 24.80, 24.80, 0);
INSERT INTO `factulinea` VALUES (3, 1, 40, '42', 4.00, 12.00, 48.00, 0);
INSERT INTO `factulinea` VALUES (4, 1, 61, '83', 3.00, 3.00, 9.00, 0);
INSERT INTO `factulinea` VALUES (5, 1, 61, '83', 1.00, 5.00, 4.80, 4);
INSERT INTO `factulinea` VALUES (5, 2, 61, '49', 1.00, 64.50, 64.50, 0);
INSERT INTO `factulinea` VALUES (6, 1, 66, '41', 1.00, 25.00, 25.00, 0);
INSERT INTO `factulinea` VALUES (7, 1, 61, '83', 1.00, 5.00, 5.00, 0);
INSERT INTO `factulinea` VALUES (8, 1, 40, '42', 1.00, 49.80, 49.80, 0);
INSERT INTO `factulinea` VALUES (9, 1, 40, '42', 1.00, 50.00, 50.00, 0);
INSERT INTO `factulinea` VALUES (10, 1, 61, '49', 2.00, 64.50, 129.00, 0);
INSERT INTO `factulinea` VALUES (11, 1, 40, '42', 1.00, 50.00, 50.00, 0);
INSERT INTO `factulinea` VALUES (11, 2, 61, '49', 1.00, 64.50, 64.50, 0);
INSERT INTO `factulinea` VALUES (12, 1, 69, '50', 1.00, 115.00, 115.00, 0);
INSERT INTO `factulinea` VALUES (13, 1, 40, '42', 1.00, 50.00, 50.00, 0);
INSERT INTO `factulinea` VALUES (14, 1, 40, '42', 1.00, 50.00, 50.00, 0);
INSERT INTO `factulinea` VALUES (14, 2, 69, '50', 1.00, 115.00, 115.00, 0);
INSERT INTO `factulinea` VALUES (15, 1, 40, '42', 1.00, 49.80, 49.80, 0);
INSERT INTO `factulinea` VALUES (16, 1, 69, '50', 1.00, 83.00, 83.00, 0);
INSERT INTO `factulinea` VALUES (2000, 1, 40, '42', 1.00, 49.80, 49.80, 0);
INSERT INTO `factulinea` VALUES (2001, 1, 61, '83', 1.00, 3.00, 3.00, 0);
INSERT INTO `factulinea` VALUES (2000, 2, 61, '49', 1.00, 60.00, 60.00, 0);
INSERT INTO `factulinea` VALUES (2002, 1, 61, '49', 1.00, 60.00, 60.00, 0);
INSERT INTO `factulinea` VALUES (2003, 3, 69, '50', 1.00, 83.00, 83.00, 0);
INSERT INTO `factulinea` VALUES (2003, 2, 61, '83', 1.00, 3.00, 3.00, 0);
INSERT INTO `factulinea` VALUES (2003, 1, 40, '42', 1.00, 49.80, 49.80, 0);
INSERT INTO `factulinea` VALUES (2004, 1, 40, '42', 1.00, 90.00, 90.00, 0);
INSERT INTO `factulinea` VALUES (2004, 2, 66, '41', 1.00, 44.00, 44.00, 0);
INSERT INTO `factulinea` VALUES (2000, 3, 40, '42', 1.00, 50.00, 50.00, 0);
INSERT INTO `factulinea` VALUES (2007, 2, 61, '83', 10.00, 3.00, 30.00, 0);
INSERT INTO `factulinea` VALUES (2007, 1, 61, '49', 1.00, 60.00, 60.00, 0);
INSERT INTO `factulinea` VALUES (2008, 1, 61, '49', 1.00, 64.50, 64.50, 0);
INSERT INTO `factulinea` VALUES (2009, 1, 61, '83', 10.00, 5.00, 50.00, 0);
INSERT INTO `factulinea` VALUES (2010, 1, 61, '83', 1.00, 5.00, 4.90, 2);
INSERT INTO `factulinea` VALUES (2011, 1, 61, '83', 1.00, 5.00, 5.00, 0);
INSERT INTO `factulinea` VALUES (2012, 1, 61, '83', 1.00, 5.00, 5.00, 0);
INSERT INTO `factulinea` VALUES (2013, 1, 61, '49', 1.00, 60.00, 60.00, 0);
INSERT INTO `factulinea` VALUES (2014, 1, 61, '49', 10.00, 60.00, 600.00, 0);
INSERT INTO `factulinea` VALUES (2015, 1, 66, '41', 1.00, 24.80, 24.80, 0);
INSERT INTO `factulinea` VALUES (2015, 2, 61, '49', 20.00, 60.00, 1200.00, 0);
INSERT INTO `factulinea` VALUES (2017, 1, 66, '41', 1.00, 24.80, 24.80, 0);
INSERT INTO `factulinea` VALUES (2018, 1, 61, '49', 1.00, 60.00, 60.00, 0);
INSERT INTO `factulinea` VALUES (2020, 1, 66, '41', 1.00, 25.00, 25.00, 0);
INSERT INTO `factulinea` VALUES (2021, 1, 61, '49', 1.00, 60.00, 60.00, 0);
INSERT INTO `factulinea` VALUES (2022, 1, 66, '41', 10.00, 5.00, 47.50, 5);
INSERT INTO `factulinea` VALUES (2023, 1, 72, '90', 15.00, 123.00, 1845.00, 0);
INSERT INTO `factulinea` VALUES (2024, 1, 61, '49', 1.00, 64.50, 64.50, 0);
INSERT INTO `factulinea` VALUES (2025, 1, 61, '49', 1.00, 64.50, 64.50, 0);
INSERT INTO `factulinea` VALUES (2025, 2, 61, '83', 1.00, 5.00, 5.00, 0);
INSERT INTO `factulinea` VALUES (2026, 1, 61, '49', 1.00, 60.00, 90.00, 0);
INSERT INTO `factulinea` VALUES (2026, 2, 61, '49', 1.00, 60.00, 78.00, 0);
INSERT INTO `factulinea` VALUES (2027, 1, 72, '90', 1.00, 123.00, 123.00, 0);
INSERT INTO `factulinea` VALUES (2028, 1, 72, '89', 1.00, 789.00, 789.00, 0);
INSERT INTO `factulinea` VALUES (2029, 1, 72, '90', 1.00, 123.00, 123.00, 0);
INSERT INTO `factulinea` VALUES (2031, 1, 61, '83', 5.00, 5.00, 25.00, 0);
INSERT INTO `factulinea` VALUES (2032, 1, 61, '49', 4.00, 64.50, 258.00, 0);
INSERT INTO `factulinea` VALUES (2033, 1, 61, '83', 10.00, 5.00, 50.00, 0);
INSERT INTO `factulinea` VALUES (2034, 1, 61, '49', 2.00, 64.50, 129.00, 0);
INSERT INTO `factulinea` VALUES (2035, 1, 61, '83', 6.00, 5.00, 30.00, 0);
INSERT INTO `factulinea` VALUES (2036, 1, 72, '90', 1.00, 123.00, 123.00, 0);
INSERT INTO `factulinea` VALUES (2038, 1, 72, '89', 1.00, 789.00, 789.00, 0);
INSERT INTO `factulinea` VALUES (2039, 1, 66, '41', 3.00, 25.00, 75.00, 0);
INSERT INTO `factulinea` VALUES (2040, 1, 66, '41', 3.00, 25.00, 75.00, 0);
INSERT INTO `factulinea` VALUES (2041, 1, 66, '41', 3.00, 25.00, 75.00, 0);
INSERT INTO `factulinea` VALUES (2042, 1, 61, '83', 2.00, 5.00, 10.00, 0);
INSERT INTO `factulinea` VALUES (2043, 1, 72, '90', 1.00, 123.00, 123.00, 0);
INSERT INTO `factulinea` VALUES (2044, 1, 61, '83', 1.00, 5.00, 4.75, 5);
INSERT INTO `factulinea` VALUES (2045, 1, 72, '90', 1.00, 123.00, 98.40, 20);
INSERT INTO `factulinea` VALUES (2046, 1, 61, '49', 1.00, 64.50, 64.50, 0);
INSERT INTO `factulinea` VALUES (2047, 1, 66, '41', 1.00, 25.00, 25.00, 0);
INSERT INTO `factulinea` VALUES (2047, 2, 72, '90', 2.00, 123.00, 246.00, 0);
INSERT INTO `factulinea` VALUES (2048, 1, 66, '41', 1.00, 25.00, 25.00, 0);
INSERT INTO `factulinea` VALUES (2049, 1, 66, '41', 1.00, 25.00, 25.00, 0);
INSERT INTO `factulinea` VALUES (2051, 1, 46, '91', 1.00, 1500.00, 1500.00, 0);
INSERT INTO `factulinea` VALUES (2052, 1, 72, '90', 1.00, 123.00, 123.00, 0);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `factulineap`
-- 

CREATE TABLE `factulineap` (
  `codfactura` varchar(20) NOT NULL default '',
  `codproveedor` int(5) NOT NULL,
  `numlinea` int(4) NOT NULL auto_increment,
  `codfamilia` int(3) NOT NULL,
  `codigo` varchar(15) NOT NULL,
  `cantidad` decimal(19,2) NOT NULL,
  `precio` decimal(19,2) NOT NULL,
  `importe` decimal(19,2) NOT NULL,
  `dcto` tinyint(4) NOT NULL,
  PRIMARY KEY  (`codfactura`,`codproveedor`,`numlinea`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='lineas de facturas de proveedores' AUTO_INCREMENT=1 ;

-- 
-- Volcar la base de datos para la tabla `factulineap`
-- 

INSERT INTO `factulineap` VALUES ('0002', 17, 1, 61, '83', 1.00, 2.00, 2.00, 0);
INSERT INTO `factulineap` VALUES ('0002', 17, 2, 61, '83', 4.00, 4.00, 16.00, 0);
INSERT INTO `factulineap` VALUES ('0003', 17, 1, 61, '83', 1.00, 4.00, 4.00, 0);
INSERT INTO `factulineap` VALUES ('0004', 17, 1, 61, '83', 2.00, 4.00, 8.00, 0);
INSERT INTO `factulineap` VALUES ('1234567', 12, 1, 72, '89', 10.00, 125.00, 1250.00, 0);
INSERT INTO `factulineap` VALUES ('1234568', 12, 1, 72, '89', 10.00, 125.00, 1250.00, 0);
INSERT INTO `factulineap` VALUES ('21345', 13, 1, 72, '90', 10.00, 122.00, 1220.00, 0);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `factulineaptmp`
-- 

CREATE TABLE `factulineaptmp` (
  `codfactura` int(11) NOT NULL,
  `numlinea` int(4) NOT NULL auto_increment,
  `codfamilia` int(3) NOT NULL,
  `codigo` varchar(15) NOT NULL,
  `cantidad` decimal(19,2) NOT NULL,
  `precio` decimal(19,2) NOT NULL,
  `importe` decimal(19,2) NOT NULL,
  `dcto` tinyint(4) NOT NULL,
  PRIMARY KEY  (`codfactura`,`numlinea`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='lineas de facturas de proveedores temporal' AUTO_INCREMENT=1 ;

-- 
-- Volcar la base de datos para la tabla `factulineaptmp`
-- 

INSERT INTO `factulineaptmp` VALUES (1, 1, 72, '89', 10.00, 125.00, 1250.00, 0);
INSERT INTO `factulineaptmp` VALUES (2, 1, 72, '89', 10.00, 125.00, 1250.00, 0);
INSERT INTO `factulineaptmp` VALUES (5, 1, 72, '90', 10.00, 122.00, 1220.00, 0);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `factulineatmp`
-- 

CREATE TABLE `factulineatmp` (
  `codfactura` int(11) NOT NULL,
  `numlinea` int(4) NOT NULL auto_increment,
  `codfamilia` int(3) NOT NULL,
  `codigo` varchar(15) NOT NULL,
  `cantidad` decimal(19,2) NOT NULL,
  `precio` decimal(19,2) NOT NULL,
  `importe` decimal(19,2) NOT NULL,
  `dcto` tinyint(4) NOT NULL,
  PRIMARY KEY  (`codfactura`,`numlinea`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Temporal de linea de facturas a clientes' AUTO_INCREMENT=1 ;

-- 
-- Volcar la base de datos para la tabla `factulineatmp`
-- 

INSERT INTO `factulineatmp` VALUES (2257, 1, 46, '91', 2.00, 1200.00, 2400.00, 0);
INSERT INTO `factulineatmp` VALUES (2252, 1, 72, '90', 1.00, 123.00, 123.00, 0);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `facturas`
-- 

CREATE TABLE `facturas` (
  `codfactura` int(11) NOT NULL auto_increment,
  `fecha` date NOT NULL,
  `iva` tinyint(4) NOT NULL,
  `codcliente` int(5) NOT NULL,
  `estado` varchar(1) NOT NULL default '0',
  `totalfactura` decimal(19,2) NOT NULL,
  `fechavencimiento` date NOT NULL default '0000-00-00',
  `borrado` varchar(1) NOT NULL default '0',
  `remito` varchar(20) NOT NULL,
  `numfactura` varchar(20) NOT NULL,
  PRIMARY KEY  (`codfactura`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='facturas de ventas a clientes' AUTO_INCREMENT=2053 ;

-- 
-- Volcar la base de datos para la tabla `facturas`
-- 

INSERT INTO `facturas` VALUES (1, '2011-02-22', 19, 1, '2', 192.42, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (2, '2011-02-22', 19, 27, '1', 92.34, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (3, '2011-02-22', 19, 1, '1', 55.68, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (4, '2011-02-22', 19, 18, '1', 10.44, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (5, '2011-02-23', 19, 1, '2', 82.47, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (6, '2011-02-23', 19, 1, '1', 29.75, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (7, '2011-02-23', 19, 1, '1', 5.95, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (8, '2011-02-23', 19, 16, '1', 59.26, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (9, '2011-02-23', 19, 1, '1', 59.50, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (10, '2011-02-23', 19, 16, '2', 153.51, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (11, '2011-02-23', 19, 1, '1', 136.26, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (12, '2011-02-23', 19, 1, '1', 136.85, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (13, '2011-02-23', 19, 1, '2', 59.50, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (14, '2011-02-23', 19, 1, '1', 196.35, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (15, '2011-02-23', 16, 16, '1', 57.77, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (16, '2011-02-23', 16, 17, '1', 96.28, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (2000, '2011-02-23', 19, 16, '2', 89.25, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (2001, '2011-02-23', 19, 18, '1', 3.57, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (2002, '2011-02-23', 19, 27, '1', 71.40, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (2003, '2011-02-24', 19, 26, '1', 161.60, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (2004, '2011-02-24', 16, 1, '1', 155.44, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (2005, '2011-02-24', 16, 1, '1', 0.00, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (2006, '2011-02-25', 19, 1, '1', 0.00, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (2007, '2011-02-26', 19, 17, '1', 107.10, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (2008, '2011-03-01', 19, 1, '1', 76.76, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (2009, '2011-03-01', 19, 1, '1', 59.50, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (2010, '2011-03-01', 19, 1, '1', 5.83, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (2011, '2011-03-01', 19, 1, '1', 5.95, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (2012, '2011-03-01', 12, 16, '1', 5.60, '2011-03-02', '0', '', '');
INSERT INTO `facturas` VALUES (2013, '2011-03-03', 19, 16, '1', 71.40, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (2014, '2011-03-04', 16, 29, '1', 696.00, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (2015, '2011-03-04', 16, 29, '2', 1420.77, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (2016, '2011-03-05', 19, 1, '1', 0.00, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (2017, '2011-03-05', 19, 22, '1', 29.51, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (2018, '2011-03-05', 19, 16, '1', 71.40, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (2019, '2011-03-05', 19, 27, '1', 0.00, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (2020, '2011-03-06', 19, 1, '2', 29.75, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (2021, '2011-03-06', 19, 16, '2', 71.40, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (2022, '2011-03-06', 16, 22, '2', 55.10, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (2023, '2011-03-06', 19, 16, '1', 2195.55, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (2024, '2011-03-07', 19, 1, '2', 76.76, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (2025, '2011-03-07', 0, 1, '2', 69.50, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (2026, '2011-03-07', 19, 32, '1', 199.92, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (2027, '2011-03-07', 19, 1, '1', 146.37, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (2028, '2011-03-07', 19, 1, '2', 938.91, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (2029, '2011-03-07', 19, 1, '2', 146.37, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (2030, '2011-03-09', 19, 1, '1', 0.00, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (2031, '2011-03-09', 19, 1, '2', 29.75, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (2032, '2011-03-29', 19, 22, '1', 307.02, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (2033, '2011-03-29', 19, 20, '1', 59.50, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (2034, '2011-03-30', 21, 27, '1', 156.09, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (2035, '2011-03-30', 19, 20, '1', 35.70, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (2036, '2011-03-30', 19, 16, '1', 146.37, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (2037, '2011-03-30', 19, 1, '1', 0.00, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (2038, '2011-03-30', 19, 16, '2', 938.91, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (2039, '2011-03-30', 19, 16, '1', 89.25, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (2040, '2011-03-30', 19, 1, '1', 89.25, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (2041, '2011-03-30', 19, 1, '1', 89.25, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (2042, '2011-03-30', 19, 16, '1', 11.90, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (2043, '2011-03-30', 19, 16, '1', 146.37, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (2044, '2011-04-04', 19, 1, '1', 5.65, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (2045, '2011-04-04', 19, 1, '1', 117.10, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (2046, '2011-04-04', 19, 1, '1', 76.76, '0000-00-00', '0', '4444', '3333');
INSERT INTO `facturas` VALUES (2047, '2011-04-04', 19, 28, '1', 322.49, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (2048, '2014-09-24', 19, 1, '1', 29.75, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (2049, '2014-09-24', 19, 1, '2', 29.75, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (2050, '2014-09-24', 19, 1, '1', 0.00, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (2051, '2014-10-14', 12, 28, '2', 1680.00, '0000-00-00', '0', '', '');
INSERT INTO `facturas` VALUES (2052, '2014-11-13', 12, 1, '2', 137.76, '0000-00-00', '0', '114', '');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `facturasp`
-- 

CREATE TABLE `facturasp` (
  `codfactura` varchar(20) NOT NULL default '',
  `codproveedor` int(5) NOT NULL,
  `fecha` date NOT NULL,
  `iva` tinyint(4) NOT NULL,
  `estado` varchar(1) NOT NULL default '0',
  `totalfactura` decimal(19,2) NOT NULL,
  `fechapago` date NOT NULL default '0000-00-00',
  `borrado` varchar(1) NOT NULL default '0',
  PRIMARY KEY  (`codfactura`,`codproveedor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='facturas de compras a proveedores';

-- 
-- Volcar la base de datos para la tabla `facturasp`
-- 

INSERT INTO `facturasp` VALUES ('0002', 17, '2011-02-26', 19, '2', 21.42, '0000-00-00', '0');
INSERT INTO `facturasp` VALUES ('0003', 17, '2011-02-26', 19, '1', 4.76, '0000-00-00', '0');
INSERT INTO `facturasp` VALUES ('0004', 17, '2011-02-26', 19, '1', 9.52, '2011-02-25', '0');
INSERT INTO `facturasp` VALUES ('1234567', 12, '2014-11-12', 12, '1', 1400.00, '0000-00-00', '0');
INSERT INTO `facturasp` VALUES ('1234568', 12, '2014-11-12', 12, '1', 1400.00, '0000-00-00', '0');
INSERT INTO `facturasp` VALUES ('21345', 13, '2014-11-13', 12, '1', 1366.40, '0000-00-00', '0');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `facturasptmp`
-- 

CREATE TABLE `facturasptmp` (
  `codfactura` int(11) NOT NULL auto_increment,
  `fecha` date NOT NULL,
  PRIMARY KEY  (`codfactura`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='temporal de facturas de proveedores' AUTO_INCREMENT=6 ;

-- 
-- Volcar la base de datos para la tabla `facturasptmp`
-- 

INSERT INTO `facturasptmp` VALUES (1, '2014-11-12');
INSERT INTO `facturasptmp` VALUES (2, '2014-11-12');
INSERT INTO `facturasptmp` VALUES (3, '2014-11-13');
INSERT INTO `facturasptmp` VALUES (4, '2014-11-13');
INSERT INTO `facturasptmp` VALUES (5, '2014-11-13');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `facturastmp`
-- 

CREATE TABLE `facturastmp` (
  `codfactura` int(11) NOT NULL auto_increment,
  `fecha` date NOT NULL,
  PRIMARY KEY  (`codfactura`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='temporal de facturas a clientes' AUTO_INCREMENT=2260 ;

-- 
-- Volcar la base de datos para la tabla `facturastmp`
-- 

INSERT INTO `facturastmp` VALUES (2252, '2014-11-13');
INSERT INTO `facturastmp` VALUES (2251, '2014-11-13');
INSERT INTO `facturastmp` VALUES (2250, '2014-11-13');
INSERT INTO `facturastmp` VALUES (2249, '2014-11-13');
INSERT INTO `facturastmp` VALUES (2248, '2014-11-13');
INSERT INTO `facturastmp` VALUES (2247, '2014-11-13');
INSERT INTO `facturastmp` VALUES (2246, '2014-11-12');
INSERT INTO `facturastmp` VALUES (2245, '2014-11-12');
INSERT INTO `facturastmp` VALUES (2244, '2014-11-12');
INSERT INTO `facturastmp` VALUES (2243, '2014-11-11');
INSERT INTO `facturastmp` VALUES (2242, '2014-11-11');
INSERT INTO `facturastmp` VALUES (2241, '2014-11-11');
INSERT INTO `facturastmp` VALUES (2253, '2014-11-13');
INSERT INTO `facturastmp` VALUES (2254, '2014-11-13');
INSERT INTO `facturastmp` VALUES (2255, '2014-11-13');
INSERT INTO `facturastmp` VALUES (2256, '2014-11-13');
INSERT INTO `facturastmp` VALUES (2257, '2014-11-13');
INSERT INTO `facturastmp` VALUES (2258, '2014-11-13');
INSERT INTO `facturastmp` VALUES (2259, '2014-11-13');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `familias`
-- 

CREATE TABLE `familias` (
  `codfamilia` int(5) NOT NULL auto_increment,
  `nombre` varchar(35) default NULL,
  `borrado` varchar(1) NOT NULL default '0',
  PRIMARY KEY  (`codfamilia`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='familia de articulos' AUTO_INCREMENT=73 ;

-- 
-- Volcar la base de datos para la tabla `familias`
-- 

INSERT INTO `familias` VALUES (28, 'ACCESORIOS DE NOTEBO', '1');
INSERT INTO `familias` VALUES (29, 'ACCESORIOS PARA CASE', '1');
INSERT INTO `familias` VALUES (30, 'CABLES DIVERSOS', '1');
INSERT INTO `familias` VALUES (31, 'CARD READERS / WRITER', '0');
INSERT INTO `familias` VALUES (32, 'CASES (GABINETES)', '0');
INSERT INTO `familias` VALUES (33, 'COOLERS PARA MICROPROCESADORES', '0');
INSERT INTO `familias` VALUES (34, 'DISCOS DUROS EXTERNO', '0');
INSERT INTO `familias` VALUES (35, 'DISCOS DUROS INTERNO', '0');
INSERT INTO `familias` VALUES (36, 'DISP. DE ALMACENAMIENTO', '0');
INSERT INTO `familias` VALUES (37, 'DISP. DE IMAGENES', '0');
INSERT INTO `familias` VALUES (38, 'DISP. OPTICOS DE L/E', '0');
INSERT INTO `familias` VALUES (39, 'DISP. PARA REDES CAB', '0');
INSERT INTO `familias` VALUES (40, 'DISP. PARA REDES WIF', '0');
INSERT INTO `familias` VALUES (41, 'ESTABILIZADORES', '0');
INSERT INTO `familias` VALUES (42, 'FUENTES DE PODER', '0');
INSERT INTO `familias` VALUES (43, 'IMPRESORAS', '0');
INSERT INTO `familias` VALUES (44, 'MAINBOARDS', '0');
INSERT INTO `familias` VALUES (45, 'MEMORIAS', '0');
INSERT INTO `familias` VALUES (46, 'MEMORIAS DIGITALES,U', '0');
INSERT INTO `familias` VALUES (47, 'MICROPROCESADORES', '1');
INSERT INTO `familias` VALUES (48, 'MICROPROCESADORES', '0');
INSERT INTO `familias` VALUES (49, 'MONITORES', '0');
INSERT INTO `familias` VALUES (50, 'MOUSE, TRACKBALL, PU', '0');
INSERT INTO `familias` VALUES (51, 'NOTEBOOKS, LAPTOPS', '0');
INSERT INTO `familias` VALUES (52, 'OTRAS TARJETAS CONTR', '0');
INSERT INTO `familias` VALUES (53, 'PARLANTES / SUBWOOFER', '0');
INSERT INTO `familias` VALUES (54, 'PCS DE MARCA', '0');
INSERT INTO `familias` VALUES (55, 'PCS ENSAMBLADAS', '0');
INSERT INTO `familias` VALUES (56, 'PRINT SERVER', '0');
INSERT INTO `familias` VALUES (57, 'PRODUCTOS PARA VOIP', '0');
INSERT INTO `familias` VALUES (58, 'REPUESTOS DE NOTEBOOK', '0');
INSERT INTO `familias` VALUES (59, 'SERVIDORES', '1');
INSERT INTO `familias` VALUES (60, 'SOFTWARE', '0');
INSERT INTO `familias` VALUES (61, 'SUMINISTROS', '0');
INSERT INTO `familias` VALUES (62, 'SUPERMULTI DVD & BLU', '0');
INSERT INTO `familias` VALUES (63, 'TARJETAS DE VIDEO', '0');
INSERT INTO `familias` VALUES (64, 'TECLADOS', '0');
INSERT INTO `familias` VALUES (65, 'UPS Y DISP. DE PROTE', '1');
INSERT INTO `familias` VALUES (66, 'COOLERS PARA CASES', '0');
INSERT INTO `familias` VALUES (67, 'OTROS DISPOSITIVOS', '0');
INSERT INTO `familias` VALUES (69, 'BATERIAS', '0');
INSERT INTO `familias` VALUES (70, 'Aromatizantes', '1');
INSERT INTO `familias` VALUES (71, 'RESISTENCIAS', '0');
INSERT INTO `familias` VALUES (72, 'BASCULAS', '0');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `formapago`
-- 

CREATE TABLE `formapago` (
  `codformapago` int(2) NOT NULL auto_increment,
  `nombrefp` varchar(40) NOT NULL,
  `borrado` varchar(1) NOT NULL default '0',
  PRIMARY KEY  (`codformapago`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Forma de pago' AUTO_INCREMENT=10 ;

-- 
-- Volcar la base de datos para la tabla `formapago`
-- 

INSERT INTO `formapago` VALUES (1, 'Tarjeta de crédito', '0');
INSERT INTO `formapago` VALUES (2, 'Crédito directo', '0');
INSERT INTO `formapago` VALUES (3, 'Contado/Efectivo', '0');
INSERT INTO `formapago` VALUES (6, 'Cheque al dia', '0');
INSERT INTO `formapago` VALUES (7, 'Cheque 30 dias', '0');
INSERT INTO `formapago` VALUES (8, 'Nota de Credito', '0');
INSERT INTO `formapago` VALUES (9, 'asd', '1');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `impuestos`
-- 

CREATE TABLE `impuestos` (
  `codimpuesto` int(3) NOT NULL auto_increment,
  `nombre` varchar(20) default NULL,
  `valor` decimal(19,1) NOT NULL,
  `borrado` varchar(1) NOT NULL default '0',
  PRIMARY KEY  (`codimpuesto`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='tipos de impuestos' AUTO_INCREMENT=14 ;

-- 
-- Volcar la base de datos para la tabla `impuestos`
-- 

INSERT INTO `impuestos` VALUES (5, 'IVA', 12.0, '0');
INSERT INTO `impuestos` VALUES (7, 'Exento', 0.0, '0');
INSERT INTO `impuestos` VALUES (13, 'asd', 12.0, '1');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `librodiario`
-- 

CREATE TABLE `librodiario` (
  `id` int(8) NOT NULL auto_increment,
  `fecha` date NOT NULL default '0000-00-00',
  `tipodocumento` varchar(1) NOT NULL,
  `coddocumento` varchar(20) NOT NULL,
  `codcomercial` int(5) NOT NULL,
  `codformapago` int(2) NOT NULL,
  `numpago` varchar(30) NOT NULL,
  `total` decimal(19,2) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Movimientos diarios' AUTO_INCREMENT=38 ;

-- 
-- Volcar la base de datos para la tabla `librodiario`
-- 

INSERT INTO `librodiario` VALUES (1, '2011-02-22', '2', '1', 1, 1, '7896321456', 192.42);
INSERT INTO `librodiario` VALUES (2, '2011-02-28', '2', '3', 1, 3, '1234', 20.00);
INSERT INTO `librodiario` VALUES (3, '2011-02-22', '2', '3', 1, 7, '3456', 35.68);
INSERT INTO `librodiario` VALUES (4, '2011-02-10', '1', '2342', 13, 2, '34567', 256.00);
INSERT INTO `librodiario` VALUES (5, '2011-02-23', '2', '5', 1, 6, '7896325621', 82.47);
INSERT INTO `librodiario` VALUES (6, '2011-02-23', '2', '10', 16, 3, '', 153.51);
INSERT INTO `librodiario` VALUES (7, '2011-02-23', '2', '13', 1, 1, '', 59.50);
INSERT INTO `librodiario` VALUES (8, '2011-02-25', '2', '4', 18, 3, '', 5.00);
INSERT INTO `librodiario` VALUES (9, '2011-02-26', '1', '0002', 17, 3, '2', 22.00);
INSERT INTO `librodiario` VALUES (10, '2011-02-26', '2', '2007', 17, 7, '896321', 7.10);
INSERT INTO `librodiario` VALUES (11, '0000-00-00', '2', '2007', 0, 0, '', -7.10);
INSERT INTO `librodiario` VALUES (12, '0000-00-00', '2', '2007', 0, 0, '', -7.10);
INSERT INTO `librodiario` VALUES (13, '2011-02-26', '1', '0004', 17, 7, '896321', 0.52);
INSERT INTO `librodiario` VALUES (14, '0000-00-00', '1', '0002', 0, 0, '', -22.00);
INSERT INTO `librodiario` VALUES (15, '0000-00-00', '1', '0002', 0, 0, '', -22.00);
INSERT INTO `librodiario` VALUES (16, '0000-00-00', '1', '0002', 0, 0, '', -22.00);
INSERT INTO `librodiario` VALUES (17, '2011-02-26', '1', '0002', 17, 6, 'nc/1234', 0.58);
INSERT INTO `librodiario` VALUES (18, '2011-02-26', '1', '0002', 17, 6, 'NC/2345', -1.16);
INSERT INTO `librodiario` VALUES (19, '2011-02-26', '1', '0002', 17, 6, '', 0.00);
INSERT INTO `librodiario` VALUES (20, '0000-00-00', '1', '0002', 0, 0, '', 0.00);
INSERT INTO `librodiario` VALUES (21, '2011-02-26', '1', '0004', 17, 8, 'NC/7862', 8.00);
INSERT INTO `librodiario` VALUES (22, '2011-03-05', '2', '2000', 1, 3, '33', 190.16);
INSERT INTO `librodiario` VALUES (23, '2011-03-06', '2', '2020', 1, 1, '', 29.75);
INSERT INTO `librodiario` VALUES (24, '2011-03-06', '2', '2021', 16, 3, '123', 20.00);
INSERT INTO `librodiario` VALUES (25, '2011-03-06', '2', '2021', 16, 3, '456', 51.40);
INSERT INTO `librodiario` VALUES (26, '2011-03-06', '2', '2022', 22, 3, '345', 55.10);
INSERT INTO `librodiario` VALUES (27, '2011-03-06', '2', '2018', 16, 3, '', 50.00);
INSERT INTO `librodiario` VALUES (28, '2011-03-07', '2', '2024', 1, 3, '', 76.76);
INSERT INTO `librodiario` VALUES (29, '2011-03-07', '2', '2025', 1, 3, '', 59.50);
INSERT INTO `librodiario` VALUES (30, '2011-03-07', '2', '2028', 1, 1, '456321', 938.91);
INSERT INTO `librodiario` VALUES (31, '2011-03-07', '2', '2029', 1, 6, '12364', 146.37);
INSERT INTO `librodiario` VALUES (32, '2011-03-09', '2', '2031', 1, 3, '', 29.75);
INSERT INTO `librodiario` VALUES (33, '2011-03-30', '2', '2038', 16, 1, '', 938.91);
INSERT INTO `librodiario` VALUES (34, '2014-09-24', '2', '2049', 1, 3, '1234567', 0.00);
INSERT INTO `librodiario` VALUES (35, '2014-09-24', '2', '2048', 1, 3, '12345678', 29.75);
INSERT INTO `librodiario` VALUES (36, '2014-10-14', '2', '2051', 28, 3, '1234567', 1680.00);
INSERT INTO `librodiario` VALUES (37, '2014-11-13', '2', '2052', 1, 3, '134', 137.76);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `pagos`
-- 

CREATE TABLE `pagos` (
  `id` int(11) NOT NULL auto_increment,
  `codfactura` varchar(20) NOT NULL,
  `codproveedor` int(5) NOT NULL,
  `importe` decimal(19,2) NOT NULL,
  `codformapago` int(2) NOT NULL,
  `numdocumento` varchar(30) NOT NULL,
  `fechapago` date default '0000-00-00',
  `observaciones` text NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Pagos de facturas a proveedores' AUTO_INCREMENT=8 ;

-- 
-- Volcar la base de datos para la tabla `pagos`
-- 

INSERT INTO `pagos` VALUES (1, '2342', 13, 256.00, 2, '34567', '2011-02-10', 'ret');
INSERT INTO `pagos` VALUES (2, '0002', 17, 22.00, 3, '2', '2011-02-26', 'pago 22 pesos');
INSERT INTO `pagos` VALUES (3, '0004', 17, 0.52, 7, '896321', '2011-02-26', '');
INSERT INTO `pagos` VALUES (4, '0002', 17, 0.58, 6, 'nc/1234', '2011-02-26', 'seentrega nota de credito');
INSERT INTO `pagos` VALUES (5, '0002', 17, -1.16, 6, 'NC/2345', '2011-02-26', 'se entrega nota credito 5643');
INSERT INTO `pagos` VALUES (6, '0002', 17, 0.00, 6, '', '2011-02-26', '');
INSERT INTO `pagos` VALUES (7, '0004', 17, 8.00, 8, 'NC/7862', '2011-02-26', 'nota credito 7851');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `parametros`
-- 

CREATE TABLE `parametros` (
  `indice` int(1) NOT NULL default '0',
  `usuario` varchar(10) default NULL,
  `clave` varchar(10) default NULL,
  `servidor` varchar(20) default NULL,
  `basedatos` varchar(20) default NULL,
  `numeracionfactura` decimal(10,0) default NULL,
  `setnumfac` decimal(1,0) default NULL,
  `fondofac` text,
  `imagenfac` varchar(30) default NULL,
  `fondoguia` text,
  `imagenguia` varchar(30) default NULL,
  `filasdetallefactura` int(2) default NULL,
  `ivaimp` decimal(2,0) default NULL,
  `nombremoneda` varchar(20) default NULL,
  `simbolomoneda` varchar(20) default NULL,
  `codigomoneda` varchar(10) default NULL,
  `nomempresa` tinytext,
  `giro` varchar(50) default NULL,
  `fonos` varchar(30) default NULL,
  `direccion` varchar(30) default NULL,
  `comuna` varchar(30) default NULL,
  `ciudadactual` varchar(30) default NULL,
  `numerofiscal` varchar(20) default NULL,
  `resolucionsii` varchar(50) default NULL,
  `rutempresa` varchar(20) default NULL,
  `giro2` varchar(50) default NULL,
  `logoempresa` varchar(50) default NULL,
  PRIMARY KEY  (`indice`),
  KEY `indice` (`indice`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `parametros`
-- 

INSERT INTO `parametros` VALUES (1, '', '', '', '', 2000, 0, 'SI', 'Factura v3.jpg', 'SI', 'logo.jpg', 20, 12, 'dolares', '$', '$', 'ROBOTECH', 'Equipos de Computo', '051- 44 94 8 363562', 'CC PRIMAVERA ESTAND E4', 'CENTRO', 'QUITO', '12345', '789654', 'R.F.C. 544544544', 'Telecomunicaciones', '');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `petroleo`
-- 

CREATE TABLE `petroleo` (
  `mes` int(11) default NULL,
  `precio` int(11) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `petroleo`
-- 


-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `proveedores`
-- 

CREATE TABLE `proveedores` (
  `codproveedor` int(5) NOT NULL auto_increment,
  `nombre` varchar(40) NOT NULL,
  `nif` varchar(12) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `codprovincia` int(2) NOT NULL,
  `localidad` varchar(35) NOT NULL,
  `codentidad` int(2) NOT NULL,
  `cuentabancaria` varchar(20) NOT NULL,
  `codpostal` varchar(5) NOT NULL,
  `telefono` varchar(14) NOT NULL,
  `movil` varchar(14) NOT NULL,
  `email` varchar(35) NOT NULL,
  `web` varchar(45) NOT NULL,
  `borrado` varchar(1) NOT NULL default '0',
  PRIMARY KEY  (`codproveedor`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Proveedores' AUTO_INCREMENT=23 ;

-- 
-- Volcar la base de datos para la tabla `proveedores`
-- 

INSERT INTO `proveedores` VALUES (12, 'GRUPO DELTRON S.A.', '20212331377', 'AV. SALAVERRY 580 URB. PATAZCA', 9, 'Benito Juarez', 12, '193-0076989-1', '074', '591061', '', '', 'WWW.deltron.com.mx', '0');
INSERT INTO `proveedores` VALUES (13, 'GRUPO IGARASHI S.R.L.', '20252011910', 'PJ. ARTEMIA WOYKE Nro 135 INT. 202', 9, 'Milpa Alto', 22, '123-4569-89', '074', '231994', '', '', 'www.grupoigarashi.com', '0');
INSERT INTO `proveedores` VALUES (14, 'HALION INTERNACIONAL S.A.', '20505970323', 'C. ALFREDO LAPOINT Nro 149 INT. B.', 9, 'Benito Juarez', 15, '123-897-96', '074', '456963', '', '', 'www.delux.com.mx', '0');
INSERT INTO `proveedores` VALUES (15, 'IMPULSO INFORMATICO S.A.', '20422561537 ', 'CAL. ALFREDO LAPOINT NRO. 337 ', 9, 'Xochilmilco', 19, '789-1236-78', '074', '421388 ', '', '', 'www.impulso.com.mx', '0');
INSERT INTO `proveedores` VALUES (16, 'MAXIMA INTERNACIONAL S.A', '20505970323', 'Av. Siesquicentenario 528 Urb. Santa Victoria', 9, 'Benito Juarez', 12, '456-785-52', '074', '207010', '', '', 'www.maximainternacional.com.mx', '0');
INSERT INTO `proveedores` VALUES (17, 'PCLINK S.A.C', '20469317855', 'Calle Tacna nro 623-625', 17, 'Xochimilco', 12, '782-456-23', '074', '270531', '', '', 'www.pclink.com.mx', '0');
INSERT INTO `proveedores` VALUES (18, 'TECHDATA S.A.C.', '20267163228', 'C. MANUEL ARTEAGA N? 520 Urb. Los Parques', 0, 'CHICLAYO', 13, '', '074', '270550', '', '', 'www.techdata.com.pe', '1');
INSERT INTO `proveedores` VALUES (20, 'Prueba', '01', '01', 2, '01', 14, '01', '01', '114', '10', '', '', '1');
INSERT INTO `proveedores` VALUES (21, 'JUAN SOTO GARAY', '456321456', 'Chantupec   123', 2, 'chantupec', 15, '7896321', '78963', '78-96321', '', 'juan@gmail.com', '', '0');
INSERT INTO `proveedores` VALUES (22, 'asd', '', '', 0, '', 0, '', '', '', '', '', '', '1');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `provincias`
-- 

CREATE TABLE `provincias` (
  `codprovincia` int(2) NOT NULL auto_increment,
  `nombreprovincia` varchar(40) NOT NULL,
  `borrado` varchar(1) NOT NULL default '0',
  PRIMARY KEY  (`codprovincia`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Provincias' AUTO_INCREMENT=38 ;

-- 
-- Volcar la base de datos para la tabla `provincias`
-- 

INSERT INTO `provincias` VALUES (24, 'Zamora Chinchipe', '0');
INSERT INTO `provincias` VALUES (23, 'Tungurahua', '0');
INSERT INTO `provincias` VALUES (22, 'Sucumbios', '0');
INSERT INTO `provincias` VALUES (21, 'Santo Domingo de los Ts', '0');
INSERT INTO `provincias` VALUES (20, 'Santa Elena', '0');
INSERT INTO `provincias` VALUES (19, 'Pichincha', '0');
INSERT INTO `provincias` VALUES (18, 'Pastaza', '0');
INSERT INTO `provincias` VALUES (17, 'Orellana', '0');
INSERT INTO `provincias` VALUES (16, 'Napo', '0');
INSERT INTO `provincias` VALUES (15, 'Morona Santiago', '0');
INSERT INTO `provincias` VALUES (14, 'Manabi', '0');
INSERT INTO `provincias` VALUES (13, 'Los Rios', '0');
INSERT INTO `provincias` VALUES (12, 'Loja', '0');
INSERT INTO `provincias` VALUES (11, 'Imbabura', '0');
INSERT INTO `provincias` VALUES (10, 'Guayas', '0');
INSERT INTO `provincias` VALUES (9, 'Galapagos', '0');
INSERT INTO `provincias` VALUES (8, 'Esmeraldas', '0');
INSERT INTO `provincias` VALUES (7, 'El Oro', '0');
INSERT INTO `provincias` VALUES (6, 'Cotopaxi', '0');
INSERT INTO `provincias` VALUES (5, 'Chimborazo', '0');
INSERT INTO `provincias` VALUES (4, 'Carchi', '0');
INSERT INTO `provincias` VALUES (3, 'Caniar', '0');
INSERT INTO `provincias` VALUES (2, 'Bolivar', '0');
INSERT INTO `provincias` VALUES (1, 'Azuay', '0');
INSERT INTO `provincias` VALUES (37, 'asd', '1');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `tabbackup`
-- 

CREATE TABLE `tabbackup` (
  `id` int(6) NOT NULL auto_increment,
  `denominacion` varchar(50) character set utf8 collate utf8_unicode_ci NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `archivo` varchar(40) character set utf8 collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

-- 
-- Volcar la base de datos para la tabla `tabbackup`
-- 

INSERT INTO `tabbackup` VALUES (1, 'RP220220111755', '2011-02-22', '17:55:26', '../copias/copia1.sql');
INSERT INTO `tabbackup` VALUES (2, 'yioyukluilululu', '2011-02-23', '02:15:18', '../copias/copia2.sql');
INSERT INTO `tabbackup` VALUES (3, 'JJJ', '2011-02-25', '16:00:00', '../copias/copia3.sql');
INSERT INTO `tabbackup` VALUES (4, 'JAZMIN', '2011-02-26', '13:22:22', '../copias/copia4.sql');
INSERT INTO `tabbackup` VALUES (5, 'uuu', '2011-02-26', '13:23:51', '../copias/copia5.sql');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `ubicaciones`
-- 

CREATE TABLE `ubicaciones` (
  `codubicacion` int(3) NOT NULL auto_increment,
  `nombre` varchar(50) NOT NULL,
  `borrado` varchar(1) NOT NULL default '0',
  PRIMARY KEY  (`codubicacion`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Ubicaciones' AUTO_INCREMENT=14 ;

-- 
-- Volcar la base de datos para la tabla `ubicaciones`
-- 

INSERT INTO `ubicaciones` VALUES (3, 'PV Robotec - Juan Cuglievan', '0');
INSERT INTO `ubicaciones` VALUES (5, 'PV Robotec - Alfredo Lapoint', '0');
INSERT INTO `ubicaciones` VALUES (12, 'a-1-1', '1');
INSERT INTO `ubicaciones` VALUES (13, 'asd', '1');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `uf`
-- 

CREATE TABLE `uf` (
  `Fecha` varchar(20) default NULL,
  `Valor` int(11) default NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 
-- Volcar la base de datos para la tabla `uf`
-- 


-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `useronline`
-- 

CREATE TABLE `useronline` (
  `id` int(10) NOT NULL auto_increment,
  `ip` varchar(15) NOT NULL default '',
  `timestamp` varchar(15) NOT NULL default '',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=268 ;

-- 
-- Volcar la base de datos para la tabla `useronline`
-- 

INSERT INTO `useronline` VALUES (267, '190.90.91.2', '1299481161');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `users`
-- 

CREATE TABLE `users` (
  `id` int(20) NOT NULL auto_increment,
  `full_name` varchar(200) character set latin1 collate latin1_general_ci NOT NULL default '',
  `user_name` varchar(200) character set latin1 collate latin1_general_ci NOT NULL default '',
  `user_pwd` varchar(200) character set latin1 collate latin1_general_ci NOT NULL default '',
  `user_email` varchar(200) character set latin1 collate latin1_general_ci NOT NULL default '',
  `activation_code` int(10) NOT NULL default '0',
  `joined` date NOT NULL default '0000-00-00',
  `country` varchar(100) character set latin1 collate latin1_general_ci NOT NULL default '',
  `user_activated` int(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- 
-- Volcar la base de datos para la tabla `users`
-- 


-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `vendedores`
-- 

CREATE TABLE `vendedores` (
  `codvendedor` int(5) NOT NULL auto_increment,
  `nombrevendedor` varchar(45) NOT NULL,
  `movil` varchar(14) NOT NULL,
  `email` varchar(35) NOT NULL,
  `borrado` varchar(1) NOT NULL default '0',
  PRIMARY KEY  (`codvendedor`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Clientes' AUTO_INCREMENT=12 ;

-- 
-- Volcar la base de datos para la tabla `vendedores`
-- 

INSERT INTO `vendedores` VALUES (8, 'Juan Espinoza ', '', '', '0');
INSERT INTO `vendedores` VALUES (10, 'Maria Espinoza', '', '', '0');
INSERT INTO `vendedores` VALUES (11, 'Carlos Jorquera', '', '', '0');
