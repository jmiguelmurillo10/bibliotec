-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 01-02-2020 a las 22:37:07
-- Versión del servidor: 5.7.17-log
-- Versión de PHP: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `biblioteca`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignatura`
--

CREATE TABLE `asignatura` (
  `ASG_ID` int(4) NOT NULL,
  `ASG_NOMBRE` varchar(50) NOT NULL,
  `ASG_BORRADO` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `asignatura`
--

INSERT INTO `asignatura` (`ASG_ID`, `ASG_NOMBRE`, `ASG_BORRADO`) VALUES
(1, 'BASE DE DATOS', 0),
(2, 'PROGRAMACION', 0),
(3, 'MOTIVACION', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autores`
--

CREATE TABLE `autores` (
  `AUT_ID` int(4) NOT NULL,
  `AUT_NOM1` varchar(50) NOT NULL,
  `AUT_APEL1` varchar(50) NOT NULL,
  `AUT_COAUTORES` varchar(50) NOT NULL,
  `AUT_BORRADO` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `autores`
--

INSERT INTO `autores` (`AUT_ID`, `AUT_NOM1`, `AUT_APEL1`, `AUT_COAUTORES`, `AUT_BORRADO`) VALUES
(1, 'PAULO', 'COELHO', '', 0),
(2, 'JUAN ', 'MURILLO', 'MIGUEL MURILLO', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingreso`
--

CREATE TABLE `ingreso` (
  `RI_ID` int(4) NOT NULL,
  `RI_FECHA` date NOT NULL,
  `USR_ID` int(4) NOT NULL,
  `LBR_ID` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `LBR_ID` int(10) NOT NULL,
  `LBR_TITULO` varchar(50) NOT NULL,
  `AUT_ID` int(10) NOT NULL,
  `LBR_EDITORIAL` varchar(50) NOT NULL,
  `LBR_ANIOED` date NOT NULL,
  `ASG_ID` int(10) NOT NULL,
  `LBR_COLEC` int(10) NOT NULL,
  `LBR_VOLUMEN` int(10) NOT NULL,
  `LBR_LUGPUB` varchar(50) NOT NULL,
  `LBR_BORRADO` int(1) NOT NULL,
  `LBR_CANTIDAD` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`LBR_ID`, `LBR_TITULO`, `AUT_ID`, `LBR_EDITORIAL`, `LBR_ANIOED`, `ASG_ID`, `LBR_COLEC`, `LBR_VOLUMEN`, `LBR_LUGPUB`, `LBR_BORRADO`, `LBR_CANTIDAD`) VALUES
(1, 'EL ALQUIMISTA', 1, 'MURILLO TORO', '2020-01-19', 3, 1, 1, 'BRASIL', 0, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salida`
--

CREATE TABLE `salida` (
  `RS_ID` int(4) NOT NULL,
  `RS_FECHA` date NOT NULL,
  `USR_ID` int(4) NOT NULL,
  `LBR_ID` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tusuarios`
--

CREATE TABLE `tusuarios` (
  `TUSR_ID` int(3) NOT NULL,
  `TUSR_NOMBRE` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tusuarios`
--

INSERT INTO `tusuarios` (`TUSR_ID`, `TUSR_NOMBRE`) VALUES
(1, 'ADMINISTRADOR'),
(2, 'DIGITADOR'),
(3, 'DOCENTE'),
(4, 'ESTUDIANTE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `USR_ID` int(3) NOT NULL,
  `USR_NOMBRE` varchar(50) NOT NULL,
  `USR_PASSWORD` varchar(50) NOT NULL,
  `USR_CI` int(10) NOT NULL,
  `USR_NOM1` varchar(50) NOT NULL,
  `USR_APEL1` varchar(50) NOT NULL,
  `USR_CORREO` varchar(50) NOT NULL,
  `TUSR_ID` int(50) NOT NULL,
  `USR_FECREGISTRO` date NOT NULL,
  `USR_BORRADO` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`USR_ID`, `USR_NOMBRE`, `USR_PASSWORD`, `USR_CI`, `USR_NOM1`, `USR_APEL1`, `USR_CORREO`, `TUSR_ID`, `USR_FECREGISTRO`, `USR_BORRADO`) VALUES
(1, '1804109559', '123', 1804109559, 'juan', 'murillo', 'johan86m@gmail.com', 1, '2019-12-22', 0),
(2, '1014109559', '123', 1014109559, 'Edgar', 'Murillo', 'e@gmail.com', 4, '2019-12-22', 0),
(3, '1024109559', '123', 1024109559, 'julian', 'Murillo', 'j@murillo.com', 4, '2019-12-22', 0),
(4, '1654109559', '123', 1654109559, 'silvia', 'gamboy', 's@gamboy.com', 2, '2019-12-22', 0),
(5, '1104109559', '1234567', 1104109559, 'Tamara', 'Murillo', 'tamara@murillo.com', 3, '0000-00-00', 0),
(6, '1304109559', '1234567', 1304109559, 'Andrea', 'Perez', '', 3, '0000-00-00', 0),
(7, '1714109559', '1234567', 1714109559, 'Rommel', 'Jimenez', '', 2, '0000-00-00', 0),
(8, '1704109559', '12345678', 1704109559, 'Paul', 'murillo', 'juan@gmail.com', 3, '0000-00-00', 0),
(9, '1604109559', '12345678', 1604109559, 'miguel', 'murillo', 'juan@gmail.com', 3, '0000-00-00', 0),
(10, '1504109559', '1234567', 1504109559, 'Belén', 'Murillo', 'm@murillo.com', 4, '0000-00-00', 0),
(11, '1404109559', '1234567', 1404109559, 'Jonathan', 'Murillo', 'juan@gmail.com', 4, '0000-00-00', 0),
(12, '1004109559', '123456', 1004109559, 'Danny', 'Pechan', 'dpechan@gmail.com', 2, '0000-00-00', 0),
(13, '1404109540', '123', 1404109540, 'Pablito', 'Murillo', 'pablito@gmail.com', 3, '0000-00-00', 0),
(14, '1404109541', '123', 1404109541, 'Pablito', 'Murillo', 'pablito@gmail.com', 3, '0000-00-00', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD PRIMARY KEY (`ASG_ID`);

--
-- Indices de la tabla `autores`
--
ALTER TABLE `autores`
  ADD PRIMARY KEY (`AUT_ID`);

--
-- Indices de la tabla `ingreso`
--
ALTER TABLE `ingreso`
  ADD PRIMARY KEY (`RI_ID`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`LBR_ID`);

--
-- Indices de la tabla `salida`
--
ALTER TABLE `salida`
  ADD PRIMARY KEY (`RS_ID`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`USR_ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  MODIFY `ASG_ID` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `autores`
--
ALTER TABLE `autores`
  MODIFY `AUT_ID` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `ingreso`
--
ALTER TABLE `ingreso`
  MODIFY `RI_ID` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `LBR_ID` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `salida`
--
ALTER TABLE `salida`
  MODIFY `RS_ID` int(4) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `USR_ID` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1404109542;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
