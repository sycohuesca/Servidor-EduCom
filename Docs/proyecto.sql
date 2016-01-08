-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-01-2016 a las 09:48:36
-- Versión del servidor: 5.6.24
-- Versión de PHP: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `proyecto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `centro`
--

CREATE TABLE IF NOT EXISTS `centro` (
  `ID_CENTRO` int(11) NOT NULL,
  `NOMBRE` varchar(64) NOT NULL,
  `DESCRIPCION` varchar(256) NOT NULL DEFAULT 'Sin contenido',
  `DIRECCION` varchar(256) NOT NULL DEFAULT 'Sin contenido'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `centro`
--

INSERT INTO `centro` (`ID_CENTRO`, `NOMBRE`, `DESCRIPCION`, `DIRECCION`) VALUES
(1, 'Los enlaces', 'Instituto', 'C dirección goya'),
(2, 'Miguel server', 'Sin contenido', 'Sin contenido');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE IF NOT EXISTS `grupo` (
  `ID_GRUPO` int(11) NOT NULL,
  `NOMBRE` varchar(64) NOT NULL,
  `DESCRIPCION` varchar(256) NOT NULL DEFAULT 'Sin contenido',
  `FECHA_HORA_CREACION` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ID_USUARIO_SUPERADMINISTRADOR` int(11) NOT NULL,
  `PRIVADO` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `grupo`
--

INSERT INTO `grupo` (`ID_GRUPO`, `NOMBRE`, `DESCRIPCION`, `FECHA_HORA_CREACION`, `ID_USUARIO_SUPERADMINISTRADOR`, `PRIVADO`) VALUES
(1, 'Equipo directivo', 'Usuarios que pueden entrar en todos los grupos ver y editar y borrar mensajes y usuarios.', '2015-12-24 00:13:09', 9, 0),
(2, 'Claustro', 'Grupo de todos los profesores y responsables lo del equipo directivo', '2015-12-16 18:19:46', 9, 1),
(3, 'CCP', 'Grupo de jefes de departamento y equipo directivo y responsables equipo directivo', '2015-12-16 19:35:29', 9, 0),
(4, 'Profesores', 'Grupo de todos los profesores y son todos responsables', '2016-01-06 18:41:15', 9, 0),
(5, 'Publicos', 'Grupo publicos', '2015-12-23 22:39:36', 9, 0),
(6, 'Tutoria', 'Grupo para informar a los padres', '2015-11-09 16:10:59', 9, 0),
(7, '1º de ESO D', 'Integrantes de 2! de ESo Grupo D', '2015-11-09 16:26:18', 9, 0),
(8, 'AMPA', 'Grupo de informacion del AMPA', '2015-11-09 16:50:45', 9, 0),
(9, 'Nuevo Profesores', 'Grupo de nuesvo profesores', '2015-12-29 13:13:03', 13, 0);

--
-- Disparadores `grupo`
--
DELIMITER $$
CREATE TRIGGER `crearGrupo` AFTER INSERT ON `grupo`
 FOR EACH ROW insert into miembro values(NEW.ID_USUARIO_SUPERADMINISTRADOR, NEW.ID_GRUPO,CURRENT_TIMESTAMP,"s")
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `ID_LOGIN` int(11) NOT NULL,
  `ID_USUARIO` int(11) NOT NULL,
  `USER` varchar(50) NOT NULL,
  `PASSWORD` varchar(64) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `login`
--

INSERT INTO `login` (`ID_LOGIN`, `ID_USUARIO`, `USER`, `PASSWORD`) VALUES
(13, 9, 'educom', 'educom'),
(24, 10, 'ajlucea@gmail.com', 'sdssssd'),
(25, 11, 'pablo.gmail.es', '3423424'),
(26, 12, 'alumno', 'alumno'),
(27, 13, 'profesor', 'profesor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensaje`
--

CREATE TABLE IF NOT EXISTS `mensaje` (
  `ID_MENSAJE` int(11) NOT NULL,
  `ID_GRUPO` int(11) NOT NULL,
  `TEXTO` varchar(2048) NOT NULL,
  `AUTOR` int(11) NOT NULL,
  `FECHA_HORA` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ESTADO` varchar(50) NOT NULL DEFAULT 'Sin modificar',
  `MODIFICADO` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `mensaje`
--

INSERT INTO `mensaje` (`ID_MENSAJE`, `ID_GRUPO`, `TEXTO`, `AUTOR`, `FECHA_HORA`, `ESTADO`, `MODIFICADO`) VALUES
(132, 3, 'Buenos dias reunion a las 4', 9, '2015-12-19 09:40:48', 'Sin modificar', '2015-12-19 09:40:48'),
(133, 3, 'Hola que tal', 9, '2015-12-19 09:41:00', 'Sin modificar', '2015-12-19 09:41:00'),
(134, 1, 'Buenos dias', 9, '2015-12-19 09:41:09', 'Sin modificar', '2015-12-19 09:41:09'),
(135, 1, 'Reunion de profesores', 9, '2015-12-19 09:41:22', 'Sin modificar', '2015-12-19 09:41:22'),
(136, 2, 'Historias de clases, dos veces.', 9, '2015-12-19 09:41:51', 'Modificado por Armando Jimenez Lucea', '2015-12-24 00:13:26'),
(137, 1, 'El usuario Armando Jimenez Lucea quiere unirse a este grupo.', 9, '2015-12-24 00:03:40', 'Sin modificar', '2015-12-24 00:03:40'),
(138, 9, 'Hola nuevos profesores', 13, '2015-12-29 13:14:35', 'Sin modificar', '2015-12-29 13:14:35');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `miembro`
--

CREATE TABLE IF NOT EXISTS `miembro` (
  `ID_USUARIO` int(11) NOT NULL,
  `ID_GRUPO` int(11) NOT NULL,
  `FECHA_HORA` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `RESPONSABLE` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `miembro`
--

INSERT INTO `miembro` (`ID_USUARIO`, `ID_GRUPO`, `FECHA_HORA`, `RESPONSABLE`) VALUES
(9, 1, '2015-12-25 22:46:23', 1),
(9, 2, '2015-12-19 09:41:36', 1),
(9, 3, '2015-12-23 21:20:41', 1),
(9, 5, '2015-12-23 22:39:36', 0),
(10, 3, '2015-12-21 22:25:23', 0),
(10, 4, '2016-01-06 18:41:15', 0),
(11, 4, '2016-01-06 18:41:15', 0),
(11, 5, '2015-12-23 22:39:36', 0),
(12, 1, '2015-12-29 13:09:52', 0),
(12, 4, '2015-12-19 09:42:35', 0),
(12, 5, '2015-12-29 17:36:11', 1),
(13, 4, '2015-12-29 13:12:39', 0),
(13, 5, '2015-12-23 22:39:36', 0),
(13, 7, '2015-12-19 09:48:37', 0),
(13, 9, '2015-12-29 13:14:18', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario`
--

CREATE TABLE IF NOT EXISTS `tipo_usuario` (
  `ID_TIPO_USUARIO` int(11) NOT NULL,
  `NOMBRE` varchar(45) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`ID_TIPO_USUARIO`, `NOMBRE`) VALUES
(1, 'Equipo Técnico'),
(2, 'Profesor'),
(3, 'Conserje'),
(4, 'Alumno/a'),
(5, 'Padres/Tutores');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `ID_USUARIO` int(11) NOT NULL,
  `NOMBRE` varchar(64) NOT NULL,
  `ID_CENTRO` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`ID_USUARIO`, `NOMBRE`, `ID_CENTRO`) VALUES
(9, 'Armando Jimenez Lucea', 1),
(10, 'Antonio Frances Gutierrez', 1),
(11, 'Manuel Gutierrez Arnau', 1),
(12, 'Paco Martinez Almansa', 1),
(13, 'Laura Martinez Serrano', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_tipo_usuario`
--

CREATE TABLE IF NOT EXISTS `usuario_tipo_usuario` (
  `ID_USUARIO` int(11) NOT NULL,
  `ID_TIPO_USUARIO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario_tipo_usuario`
--

INSERT INTO `usuario_tipo_usuario` (`ID_USUARIO`, `ID_TIPO_USUARIO`) VALUES
(9, 1),
(9, 2),
(13, 2),
(12, 3),
(13, 4);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `centro`
--
ALTER TABLE `centro`
  ADD PRIMARY KEY (`ID_CENTRO`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`ID_GRUPO`), ADD KEY `FK_GRUPO_A_USUARIO_idx` (`ID_USUARIO_SUPERADMINISTRADOR`);

--
-- Indices de la tabla `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`ID_LOGIN`), ADD KEY `ID_USUARIO` (`ID_USUARIO`);

--
-- Indices de la tabla `mensaje`
--
ALTER TABLE `mensaje`
  ADD PRIMARY KEY (`ID_MENSAJE`), ADD KEY `FK_MENSAJE_A_GRUPO_idx` (`ID_GRUPO`), ADD KEY `FK_MENSAJE_A_USUARIO_idx` (`AUTOR`);

--
-- Indices de la tabla `miembro`
--
ALTER TABLE `miembro`
  ADD PRIMARY KEY (`ID_USUARIO`,`ID_GRUPO`), ADD KEY `FK_MIEMBRO_A_GRUPO_idx` (`ID_GRUPO`);

--
-- Indices de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  ADD PRIMARY KEY (`ID_TIPO_USUARIO`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID_USUARIO`), ADD KEY `FK_USUARIO_A_CENTRO_idx` (`ID_CENTRO`);

--
-- Indices de la tabla `usuario_tipo_usuario`
--
ALTER TABLE `usuario_tipo_usuario`
  ADD PRIMARY KEY (`ID_USUARIO`,`ID_TIPO_USUARIO`), ADD KEY `FK_USUARIO_TIPO_USUARIO_A_TIPO_USUARIO_idx` (`ID_TIPO_USUARIO`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `centro`
--
ALTER TABLE `centro`
  MODIFY `ID_CENTRO` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `grupo`
--
ALTER TABLE `grupo`
  MODIFY `ID_GRUPO` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `login`
--
ALTER TABLE `login`
  MODIFY `ID_LOGIN` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT de la tabla `mensaje`
--
ALTER TABLE `mensaje`
  MODIFY `ID_MENSAJE` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=139;
--
-- AUTO_INCREMENT de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  MODIFY `ID_TIPO_USUARIO` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID_USUARIO` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `grupo`
--
ALTER TABLE `grupo`
ADD CONSTRAINT `FK_GRUPO_A_USUARIO` FOREIGN KEY (`ID_USUARIO_SUPERADMINISTRADOR`) REFERENCES `usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `login`
--
ALTER TABLE `login`
ADD CONSTRAINT `FK_LOGIN_A_USUARIO` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `mensaje`
--
ALTER TABLE `mensaje`
ADD CONSTRAINT `FK_MENSAJE_A_GRUPO` FOREIGN KEY (`ID_GRUPO`) REFERENCES `grupo` (`ID_GRUPO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `FK_MENSAJE_A_USUARIO` FOREIGN KEY (`AUTOR`) REFERENCES `usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `miembro`
--
ALTER TABLE `miembro`
ADD CONSTRAINT `FK_MIEMBRO_A_GRUPO` FOREIGN KEY (`ID_GRUPO`) REFERENCES `grupo` (`ID_GRUPO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `FK_MIEMBRO_A_USUARIO` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
ADD CONSTRAINT `FK_USUARIO_A_CENTRO` FOREIGN KEY (`ID_CENTRO`) REFERENCES `centro` (`ID_CENTRO`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario_tipo_usuario`
--
ALTER TABLE `usuario_tipo_usuario`
ADD CONSTRAINT `FK_USUARIO_TIPO_USUARIO_A_TIPO_USUARIO` FOREIGN KEY (`ID_TIPO_USUARIO`) REFERENCES `tipo_usuario` (`ID_TIPO_USUARIO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `FK_USUARIO_TIPO_USUARIO_A_USUARIO` FOREIGN KEY (`ID_USUARIO`) REFERENCES `usuario` (`ID_USUARIO`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
