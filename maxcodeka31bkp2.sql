-- phpMyAdmin SQL Dump
-- version 2.10.3
-- http://www.phpmyadmin.net
-- 
-- Servidor: localhost
-- Tiempo de generación: 31-01-2015 a las 02:49:49
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

DROP TABLE IF EXISTS `albalinea`;
CREATE TABLE `albalinea` (
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
-- Volcar la base de datos para la tabla `albalinea`
-- 

INSERT INTO `albalinea` (`codalbaran`, `numlinea`, `codfamilia`, `codigo`, `cantidad`, `precio`, `importe`, `dcto`) VALUES 
(2, 1, 61, '49', 1.00, 60.00, 60.00, 0);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `albalineap`
-- 

DROP TABLE IF EXISTS `albalineap`;
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

DROP TABLE IF EXISTS `albalineaptmp`;
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

DROP TABLE IF EXISTS `albalineatmp`;
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

DROP TABLE IF EXISTS `albaranes`;
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

INSERT INTO `albaranes` (`codalbaran`, `codfactura`, `fecha`, `iva`, `codcliente`, `estado`, `totalalbaran`, `borrado`) VALUES 
(2, 0, '2011-03-06', 19, 18, '1', 71.40, '0');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `albaranesp`
-- 

DROP TABLE IF EXISTS `albaranesp`;
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

DROP TABLE IF EXISTS `albaranesptmp`;
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

DROP TABLE IF EXISTS `albaranestmp`;
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

DROP TABLE IF EXISTS `articulos`;
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Articulos' AUTO_INCREMENT=96 ;

-- 
-- Volcar la base de datos para la tabla `articulos`
-- 


-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `artpro`
-- 

DROP TABLE IF EXISTS `artpro`;
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


-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `authteam`
-- 

DROP TABLE IF EXISTS `authteam`;
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

INSERT INTO `authteam` (`id`, `teamname`, `teamlead`, `status`) VALUES 
(1, 'Ungrouped', 'sa', 'active'),
(2, 'Admin', 'sa', 'active'),
(3, 'Temporary', 'sa', 'active'),
(7, 'Group 1', 'sa', 'active'),
(8, 'Group 2', 'test', 'active'),
(9, 'Group 3', 'admin', 'active');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `authuser`
-- 

DROP TABLE IF EXISTS `authuser`;
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

INSERT INTO `authuser` (`id`, `uname`, `passwd`, `team`, `level`, `status`, `lastlogin`, `logincount`) VALUES 
(1, 'sa', '9df3b01c60df20d13843841ff0d4482c', 'Admin', 1, 'active', '2010-06-26 11:29:28', 12),
(2, 'admin', '9df3b01c60df20d13843841ff0d4482c', 'Admin', 1, 'active', '2010-06-22 18:30:24', 21),
(3, 'test', '9df3b01c60df20d13843841ff0d4482c', 'Temporary', 999, 'active', '2003-04-03 00:00:34', 0),
(11, 'G1-0001', '9df3b01c60df20d13843841ff0d4482c', 'Group 1', 5, 'active', '2003-04-04 10:59:02', 0),
(12, 'G1-0002', '9df3b01c60df20d13843841ff0d4482c', 'Group 1', 2, 'active', '0000-00-00 00:00:00', 0),
(13, 'G2-0001', '9df3b01c60df20d13843841ff0d4482c', 'Group 2', 5, 'active', '2003-04-03 00:46:20', 0),
(14, 'G2-0002', '9df3b01c60df20d13843841ff0d4482c', 'Group 2', 6, 'active', '2003-04-03 00:48:04', 0),
(15, 'G2-0003', '9df3b01c60df20d13843841ff0d4482c', 'Group 2', 3, 'active', '2003-04-04 10:31:16', 0),
(16, 'G3-0001', '9df3b01c60df20d13843841ff0d4482c', 'Group 3', 10, 'active', '0000-00-00 00:00:00', 0),
(17, 'G3-0002', '9df3b01c60df20d13843841ff0d4482c', 'Group 3', 4, 'active', '0000-00-00 00:00:00', 0),
(20, 'arturo', '34facb611d63077b415e7e4ae92845a2', 'Group 2', 4, 'active', '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `clientes`
-- 

DROP TABLE IF EXISTS `clientes`;
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
  `cod_tipocliente` int(5) default NULL,
  PRIMARY KEY  (`codcliente`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Clientes' AUTO_INCREMENT=43 ;

-- 
-- Volcar la base de datos para la tabla `clientes`
-- 


-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `cobradores`
-- 

DROP TABLE IF EXISTS `cobradores`;
CREATE TABLE `cobradores` (
  `codcobrador` int(2) NOT NULL auto_increment,
  `nombrecobrador` varchar(40) NOT NULL,
  `borrado` varchar(1) NOT NULL default '0',
  PRIMARY KEY  (`codcobrador`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Cobradores' AUTO_INCREMENT=9 ;

-- 
-- Volcar la base de datos para la tabla `cobradores`
-- 

INSERT INTO `cobradores` (`codcobrador`, `nombrecobrador`, `borrado`) VALUES 
(1, 'ernesto  perez ', '1'),
(2, 'juan gacitua', '0'),
(4, 'irene perez', '0'),
(5, 'xccxcxc', '1'),
(6, 'jbbbb', '1'),
(7, 'vbxfzf', '1'),
(8, 'asd', '1');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `cobros`
-- 

DROP TABLE IF EXISTS `cobros`;
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Cobros de facturas a clientes' AUTO_INCREMENT=24 ;

-- 
-- Volcar la base de datos para la tabla `cobros`
-- 


-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `ctg_tiposusuario`
-- 

DROP TABLE IF EXISTS `ctg_tiposusuario`;
CREATE TABLE `ctg_tiposusuario` (
  `id_TipoUsuario` int(10) NOT NULL auto_increment,
  `tx_TipoUsuario` varchar(100) NOT NULL,
  PRIMARY KEY  (`id_TipoUsuario`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- 
-- Volcar la base de datos para la tabla `ctg_tiposusuario`
-- 

INSERT INTO `ctg_tiposusuario` (`id_TipoUsuario`, `tx_TipoUsuario`) VALUES 
(1, 'Administrador'),
(2, 'Usuario Normal');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `emails`
-- 

DROP TABLE IF EXISTS `emails`;
CREATE TABLE `emails` (
  `codigo` int(11) NOT NULL auto_increment,
  `email` varchar(100) default NULL,
  PRIMARY KEY  (`codigo`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- 
-- Volcar la base de datos para la tabla `emails`
-- 

INSERT INTO `emails` (`codigo`, `email`) VALUES 
(4, 'codekamx@gmail.com');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `embalajes`
-- 

DROP TABLE IF EXISTS `embalajes`;
CREATE TABLE `embalajes` (
  `codembalaje` int(3) NOT NULL auto_increment,
  `nombre` varchar(30) default NULL,
  `borrado` varchar(1) NOT NULL default '0',
  PRIMARY KEY  (`codembalaje`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Embalajes' AUTO_INCREMENT=10 ;

-- 
-- Volcar la base de datos para la tabla `embalajes`
-- 

INSERT INTO `embalajes` (`codembalaje`, `nombre`, `borrado`) VALUES 
(1, 'Caja', '0'),
(2, 'resma', '0'),
(3, 'unidad', '0'),
(4, 'No aplica', '0'),
(7, 'Blister', '0'),
(8, 'kilos', '0'),
(9, 'm2', '0');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `entidades`
-- 

DROP TABLE IF EXISTS `entidades`;
CREATE TABLE `entidades` (
  `codentidad` int(2) NOT NULL auto_increment,
  `nombreentidad` varchar(50) NOT NULL,
  `borrado` varchar(1) NOT NULL default '0',
  PRIMARY KEY  (`codentidad`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Entidades Bancarias' AUTO_INCREMENT=56 ;

-- 
-- Volcar la base de datos para la tabla `entidades`
-- 

INSERT INTO `entidades` (`codentidad`, `nombreentidad`, `borrado`) VALUES 
(30, 'Banco del Pacifico', '0'),
(31, 'Banco de Guayaquil', '0'),
(32, 'Produbanco', '0'),
(33, 'Banco Bolivariano', '0'),
(34, 'Banco Internacional', '0'),
(35, 'Banco del Austro', '0'),
(36, 'Banco Promerica', '0'),
(37, 'Banco de Machala', '0'),
(38, 'BGR', '0'),
(39, 'Citibank', '0'),
(40, 'Banco ProCredit', '0'),
(41, 'UniBanco', '0'),
(42, 'Banco Solidario', '0'),
(43, 'Banco de Loja', '0'),
(44, 'Banco Territorial', '0'),
(45, 'Banco Coopnacional', '0'),
(46, 'Banco Amazonas', '0'),
(47, 'Banco Capital', '0'),
(48, 'Banco DMIRO', '0'),
(49, 'Banco Finca', '0'),
(50, 'Banco Comercial de Manabi', '0'),
(51, 'Banco COFIEC', '0'),
(52, 'Banco del Litoral', '0'),
(53, 'Banco Delbank', '0'),
(54, 'Banco Sudamericano', '0'),
(55, 'Pichincha', '0');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `eventcal`
-- 

DROP TABLE IF EXISTS `eventcal`;
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

INSERT INTO `eventcal` (`id`, `eventDate`, `eventTitle`, `eventContent`, `borrado`) VALUES 
(1, '2010-09-28', 'ivas', 'pagar', '1'),
(2, '2010-09-30', 'Cumplea?o Maria Ines', 'Nos reuniremos a almorzar con la jefatura en el Casino Royal. Cancela la Empresa', '1'),
(3, '2010-10-05', 'despedida soltero', 'nos vamos pa la costa', '1'),
(4, '2010-10-14', 'fiesta', 'en rancagua', '0'),
(5, '2010-10-08', 'buenas noticias', 'seran aumentados los sueldos bases en un 25 % para todos aquellos que logren su titulo de Master en informatica antes del 30 de Diciembre de este a?o.', '1'),
(6, '2010-12-09', 'test', 'test de evento', '1'),
(7, '2010-12-31', 'xasas', 'asasas', '1'),
(8, '2010-12-30', 'carlos', 'no hay mas', '1'),
(9, '2010-12-27', 'cotiz<acxnes pendientes', 'ganancia $ 110.00 cada cotizacion', '1');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `events`
-- 

DROP TABLE IF EXISTS `events`;
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

INSERT INTO `events` (`eventID`, `eventDate`, `eventContent`, `langCode`) VALUES 
(1, '2010-09-23', 'this is my first ', 'en'),
(2, '2010-09-30', 'this is my second event', 'en'),
(3, '2010-09-30', '&#2351;&#2361; &#2350;&#2375;&#2352;&#2366; &#2346;&#2361;&#2354;&#2366; &#2360;&#2306;&#2342;&#2375;&#2358; &#2361;&#2376;', 'hi'),
(4, '2010-09-29', 'This is new event', 'en'),
(5, '2005-03-29', 'This is new event', 'en'),
(6, '2005-03-29', 'This is new event', 'en'),
(7, '2005-04-15', 'This is new event', 'en'),
(8, '2005-04-15', 'This is new event', 'en'),
(9, '2005-04-17', 'This is updated third event', 'en');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `factulinea`
-- 

DROP TABLE IF EXISTS `factulinea`;
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


-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `factulineap`
-- 

DROP TABLE IF EXISTS `factulineap`;
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


-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `factulineaptmp`
-- 

DROP TABLE IF EXISTS `factulineaptmp`;
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


-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `factulineatmp`
-- 

DROP TABLE IF EXISTS `factulineatmp`;
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

INSERT INTO `factulineatmp` (`codfactura`, `numlinea`, `codfamilia`, `codigo`, `cantidad`, `precio`, `importe`, `dcto`) VALUES 
(0, 3, 66, '41', 1.00, 25.00, 25.00, 0),
(0, 2, 61, '49', 1.00, 64.50, 64.50, 0),
(0, 4, 72, '90', 1.00, 123.00, 123.00, 0);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `facturas`
-- 

DROP TABLE IF EXISTS `facturas`;
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
  `id_usuario` int(10) NOT NULL,
  `fechacreacion` datetime NOT NULL,
  PRIMARY KEY  (`codfactura`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='facturas de ventas a clientes' AUTO_INCREMENT=2083 ;

-- 
-- Volcar la base de datos para la tabla `facturas`
-- 


-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `facturasp`
-- 

DROP TABLE IF EXISTS `facturasp`;
CREATE TABLE `facturasp` (
  `codfactura` varchar(20) NOT NULL default '',
  `codproveedor` int(5) NOT NULL,
  `fecha` date NOT NULL,
  `iva` tinyint(4) NOT NULL,
  `estado` varchar(1) NOT NULL default '0',
  `totalfactura` decimal(19,2) NOT NULL,
  `fechapago` date NOT NULL default '0000-00-00',
  `borrado` varchar(1) NOT NULL default '0',
  `id_usuario` int(10) NOT NULL,
  `fechacreacion` datetime NOT NULL,
  PRIMARY KEY  (`codfactura`,`codproveedor`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='facturas de compras a proveedores';

-- 
-- Volcar la base de datos para la tabla `facturasp`
-- 


-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `facturasptmp`
-- 

DROP TABLE IF EXISTS `facturasptmp`;
CREATE TABLE `facturasptmp` (
  `codfactura` int(11) NOT NULL auto_increment,
  `fecha` date NOT NULL,
  PRIMARY KEY  (`codfactura`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='temporal de facturas de proveedores' AUTO_INCREMENT=32 ;

-- 
-- Volcar la base de datos para la tabla `facturasptmp`
-- 


-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `facturastmp`
-- 

DROP TABLE IF EXISTS `facturastmp`;
CREATE TABLE `facturastmp` (
  `codfactura` int(11) NOT NULL auto_increment,
  `fecha` date NOT NULL,
  PRIMARY KEY  (`codfactura`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='temporal de facturas a clientes' AUTO_INCREMENT=2359 ;

-- 
-- Volcar la base de datos para la tabla `facturastmp`
-- 

INSERT INTO `facturastmp` (`codfactura`, `fecha`) VALUES 
(2358, '2015-01-31'),
(2357, '2015-01-31');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `familias`
-- 

DROP TABLE IF EXISTS `familias`;
CREATE TABLE `familias` (
  `codfamilia` int(5) NOT NULL auto_increment,
  `nombre` varchar(35) default NULL,
  `borrado` varchar(1) NOT NULL default '0',
  PRIMARY KEY  (`codfamilia`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='familia de articulos' AUTO_INCREMENT=75 ;

-- 
-- Volcar la base de datos para la tabla `familias`
-- 


-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `formapago`
-- 

DROP TABLE IF EXISTS `formapago`;
CREATE TABLE `formapago` (
  `codformapago` int(2) NOT NULL auto_increment,
  `nombrefp` varchar(40) NOT NULL,
  `borrado` varchar(1) NOT NULL default '0',
  PRIMARY KEY  (`codformapago`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Forma de pago' AUTO_INCREMENT=10 ;

-- 
-- Volcar la base de datos para la tabla `formapago`
-- 

INSERT INTO `formapago` (`codformapago`, `nombrefp`, `borrado`) VALUES 
(1, 'Tarjeta de cr', '0'),
(2, 'Cr', '0'),
(3, 'Contado/Efectivo', '0'),
(6, 'Cheque al dia', '0'),
(7, 'Cheque 30 dias', '0'),
(8, 'Nota de Credito', '0'),
(9, 'asd', '1');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `impuestos`
-- 

DROP TABLE IF EXISTS `impuestos`;
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

INSERT INTO `impuestos` (`codimpuesto`, `nombre`, `valor`, `borrado`) VALUES 
(5, 'IVA', 11.0, '0'),
(7, 'Exento', 0.0, '0'),
(13, 'asd', 12.0, '1');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `librodiario`
-- 

DROP TABLE IF EXISTS `librodiario`;
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Movimientos diarios' AUTO_INCREMENT=41 ;

-- 
-- Volcar la base de datos para la tabla `librodiario`
-- 

INSERT INTO `librodiario` (`id`, `fecha`, `tipodocumento`, `coddocumento`, `codcomercial`, `codformapago`, `numpago`, `total`) VALUES 
(1, '2011-02-22', '2', '1', 1, 1, '7896321456', 192.42),
(2, '2011-02-28', '2', '3', 1, 3, '1234', 20.00),
(3, '2011-02-22', '2', '3', 1, 7, '3456', 35.68),
(4, '2011-02-10', '1', '2342', 13, 2, '34567', 256.00),
(5, '2011-02-23', '2', '5', 1, 6, '7896325621', 82.47),
(6, '2011-02-23', '2', '10', 16, 3, '', 153.51),
(7, '2011-02-23', '2', '13', 1, 1, '', 59.50),
(8, '2011-02-25', '2', '4', 18, 3, '', 5.00),
(9, '2011-02-26', '1', '0002', 17, 3, '2', 22.00),
(10, '2011-02-26', '2', '2007', 17, 7, '896321', 7.10),
(11, '0000-00-00', '2', '2007', 0, 0, '', -7.10),
(12, '0000-00-00', '2', '2007', 0, 0, '', -7.10),
(13, '2011-02-26', '1', '0004', 17, 7, '896321', 0.52),
(14, '0000-00-00', '1', '0002', 0, 0, '', -22.00),
(15, '0000-00-00', '1', '0002', 0, 0, '', -22.00),
(16, '0000-00-00', '1', '0002', 0, 0, '', -22.00),
(17, '2011-02-26', '1', '0002', 17, 6, 'nc/1234', 0.58),
(18, '2011-02-26', '1', '0002', 17, 6, 'NC/2345', -1.16),
(19, '2011-02-26', '1', '0002', 17, 6, '', 0.00),
(20, '0000-00-00', '1', '0002', 0, 0, '', 0.00),
(21, '2011-02-26', '1', '0004', 17, 8, 'NC/7862', 8.00),
(22, '2011-03-05', '2', '2000', 1, 3, '33', 190.16),
(23, '2011-03-06', '2', '2020', 1, 1, '', 29.75),
(24, '2011-03-06', '2', '2021', 16, 3, '123', 20.00),
(25, '2011-03-06', '2', '2021', 16, 3, '456', 51.40),
(26, '2011-03-06', '2', '2022', 22, 3, '345', 55.10),
(27, '2011-03-06', '2', '2018', 16, 3, '', 50.00),
(28, '2011-03-07', '2', '2024', 1, 3, '', 76.76),
(29, '2011-03-07', '2', '2025', 1, 3, '', 59.50),
(30, '2011-03-07', '2', '2028', 1, 1, '456321', 938.91),
(31, '2011-03-07', '2', '2029', 1, 6, '12364', 146.37),
(32, '2011-03-09', '2', '2031', 1, 3, '', 29.75),
(33, '2011-03-30', '2', '2038', 16, 1, '', 938.91),
(34, '2014-12-18', '2', '2075', 1, 3, '123456', 123.00),
(35, '2014-12-27', '2', '2081', 30, 3, '1234567', 250.88),
(36, '2014-12-29', '1', '65478', 21, 3, '3456', 20.46),
(37, '2014-12-29', '2', '2082', 1, 3, '5467', 114.24),
(38, '2014-12-29', '1', '23543', 12, 3, '4356', 1120.00),
(39, '2015-01-15', '1', '65478', 21, 3, '1234567', 20.46),
(40, '2015-01-15', '1', '5467', 16, 3, '1234567', 20.46);

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `pagos`
-- 

DROP TABLE IF EXISTS `pagos`;
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Pagos de facturas a proveedores' AUTO_INCREMENT=12 ;

-- 
-- Volcar la base de datos para la tabla `pagos`
-- 


-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `parametros`
-- 

DROP TABLE IF EXISTS `parametros`;
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

INSERT INTO `parametros` (`indice`, `usuario`, `clave`, `servidor`, `basedatos`, `numeracionfactura`, `setnumfac`, `fondofac`, `imagenfac`, `fondoguia`, `imagenguia`, `filasdetallefactura`, `ivaimp`, `nombremoneda`, `simbolomoneda`, `codigomoneda`, `nomempresa`, `giro`, `fonos`, `direccion`, `comuna`, `ciudadactual`, `numerofiscal`, `resolucionsii`, `rutempresa`, `giro2`, `logoempresa`) VALUES 
(1, '', '', '', '', 2000, 0, 'SI', 'Factura v3.jpg', 'NO', 'logo.jpg', 20, 12, 'dolares', '$', '$', 'DEVELOPERS', 'Equipos de Computo', '094077887', 'LAS CASAS', 'CENTRO', 'QUITO', '12345', '789654', 'RUC 1804109559', 'Telecomunicaciones', '');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `petroleo`
-- 

DROP TABLE IF EXISTS `petroleo`;
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

DROP TABLE IF EXISTS `proveedores`;
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


-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `provincias`
-- 

DROP TABLE IF EXISTS `provincias`;
CREATE TABLE `provincias` (
  `codprovincia` int(2) NOT NULL auto_increment,
  `nombreprovincia` varchar(40) NOT NULL,
  `borrado` varchar(1) NOT NULL default '0',
  PRIMARY KEY  (`codprovincia`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Provincias' AUTO_INCREMENT=38 ;

-- 
-- Volcar la base de datos para la tabla `provincias`
-- 

INSERT INTO `provincias` (`codprovincia`, `nombreprovincia`, `borrado`) VALUES 
(1, 'Azuay', '0'),
(2, 'Bolivar', '0'),
(3, 'Caniar', '0'),
(4, 'Carchi', '0'),
(5, 'Chimborazo', '0'),
(6, 'Cotopaxi', '0'),
(7, 'El Oro', '0'),
(8, 'Esmeraldas', '0'),
(9, 'Galapagos', '0'),
(10, 'Guayas', '0'),
(11, 'Imbabura', '0'),
(12, 'Loja', '0'),
(13, 'Los Rios', '0'),
(14, 'Manab', '0'),
(15, 'Morona Santiago', '0'),
(16, 'Napo', '0'),
(17, 'Orellana', '0'),
(18, 'Pastaza', '0'),
(19, 'Pichincha', '0'),
(20, 'Santa Elena', '0'),
(21, 'Santo Domingo de los Ts', '0'),
(22, 'Sucumbios', '0'),
(23, 'Tungurahua', '0'),
(24, 'Zamora Chinchipe', '0');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `tabbackup`
-- 

DROP TABLE IF EXISTS `tabbackup`;
CREATE TABLE `tabbackup` (
  `id` int(6) NOT NULL auto_increment,
  `denominacion` varchar(50) character set utf8 collate utf8_unicode_ci NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `archivo` varchar(40) character set utf8 collate utf8_unicode_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

-- 
-- Volcar la base de datos para la tabla `tabbackup`
-- 


-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `tbl_users`
-- 

DROP TABLE IF EXISTS `tbl_users`;
CREATE TABLE `tbl_users` (
  `id_usuario` int(10) NOT NULL auto_increment,
  `tx_nombre` varchar(50) NOT NULL,
  `tx_apellidoPaterno` varchar(50) NOT NULL,
  `tx_apellidoMaterno` varchar(50) NOT NULL,
  `tx_correo` varchar(100) NOT NULL,
  `tx_username` varchar(50) NOT NULL,
  `tx_password` varchar(250) NOT NULL,
  `id_TipoUsuario` int(10) NOT NULL,
  `dt_registro` datetime NOT NULL,
  `borrado` varchar(1) NOT NULL,
  PRIMARY KEY  (`id_usuario`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

-- 
-- Volcar la base de datos para la tabla `tbl_users`
-- 

INSERT INTO `tbl_users` (`id_usuario`, `tx_nombre`, `tx_apellidoPaterno`, `tx_apellidoMaterno`, `tx_correo`, `tx_username`, `tx_password`, `id_TipoUsuario`, `dt_registro`, `borrado`) VALUES 
(1, 'Juan', 'Murillo', 'Murillo', 'tlgo_juany@ahoo.es', 'johan10m', 'ddlserver', 1, '2014-12-14 14:09:43', '0'),
(2, 'Miguel', 'Murillo', 'Murillo', 'tlgo_juan@yahoo.es', 'miguel10m', 'perrito', 2, '2014-12-14 14:10:38', '0'),
(3, 'Danilo', 'Sierra', 'Leon', 'dsierra@grupomas.com', 'dsierra', 'ddlserver', 2, '2014-12-14 16:46:52', '0');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `tipocliente`
-- 

DROP TABLE IF EXISTS `tipocliente`;
CREATE TABLE `tipocliente` (
  `cod_tipoCliente` int(5) NOT NULL auto_increment,
  `nombre` varchar(35) default NULL,
  `borrado` varchar(1) NOT NULL,
  PRIMARY KEY  (`cod_tipoCliente`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- 
-- Volcar la base de datos para la tabla `tipocliente`
-- 

INSERT INTO `tipocliente` (`cod_tipoCliente`, `nombre`, `borrado`) VALUES 
(1, 'NORMAL', '0'),
(2, 'DISTRIBUIDOR', '0'),
(3, 'test', '1'),
(4, 'TEST2', '1');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `ubicaciones`
-- 

DROP TABLE IF EXISTS `ubicaciones`;
CREATE TABLE `ubicaciones` (
  `codubicacion` int(3) NOT NULL auto_increment,
  `nombre` varchar(50) NOT NULL,
  `borrado` varchar(1) NOT NULL default '0',
  PRIMARY KEY  (`codubicacion`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Ubicaciones' AUTO_INCREMENT=14 ;

-- 
-- Volcar la base de datos para la tabla `ubicaciones`
-- 

INSERT INTO `ubicaciones` (`codubicacion`, `nombre`, `borrado`) VALUES 
(3, 'PV Robotec - Juan Cuglievan', '0'),
(5, 'PV Robotec - Alfredo Lapoint', '0'),
(12, 'a-1-1', '1'),
(13, 'asd', '1');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `uf`
-- 

DROP TABLE IF EXISTS `uf`;
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

DROP TABLE IF EXISTS `useronline`;
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

INSERT INTO `useronline` (`id`, `ip`, `timestamp`) VALUES 
(267, '190.90.91.2', '1299481161');

-- --------------------------------------------------------

-- 
-- Estructura de tabla para la tabla `users`
-- 

DROP TABLE IF EXISTS `users`;
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

DROP TABLE IF EXISTS `vendedores`;
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

