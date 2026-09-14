-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-09-2026 a las 20:42:30
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `matchgame_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `generos`
--

CREATE TABLE `generos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `generos`
--

INSERT INTO `generos` (`id`, `nombre`) VALUES
(1, 'Acción'),
(2, 'Aventura'),
(6, 'Carreras'),
(5, 'Deportes'),
(4, 'Estrategia'),
(9, 'Plataformas'),
(3, 'RPG'),
(10, 'Shooter'),
(8, 'Simulación'),
(7, 'Terror');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juegos`
--

CREATE TABLE `juegos` (
  `id` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `imagen` varchar(500) DEFAULT NULL,
  `fecha_lanzamiento` date DEFAULT NULL,
  `puntuacion` decimal(3,1) DEFAULT NULL,
  `genero_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `juegos`
--

INSERT INTO `juegos` (`id`, `titulo`, `descripcion`, `imagen`, `fecha_lanzamiento`, `puntuacion`, `genero_id`) VALUES
(1, 'Elden Ring', 'RPG de acción en mundo abierto desarrollado por FromSoftware.', NULL, '2022-02-25', 9.5, 3),
(2, 'Hollow Knight', 'Aventura de acción y plataformas ambientada en Hallownest.', NULL, '2017-02-24', 9.2, 2),
(3, 'Resident Evil 4', 'Juego de acción y terror centrado en la supervivencia.', NULL, '2023-03-24', 9.3, 7),
(5, 'Celeste', 'Juego de plataformas centrado en escalar una monta�a y superar numerosos desaf�os.', NULL, '2018-01-25', 9.1, 9);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `juego_plataforma`
--

CREATE TABLE `juego_plataforma` (
  `juego_id` int(11) NOT NULL,
  `plataforma_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `juego_plataforma`
--

INSERT INTO `juego_plataforma` (`juego_id`, `plataforma_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(2, 1),
(2, 3),
(2, 5),
(2, 6),
(3, 1),
(3, 2),
(3, 3),
(3, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `plataformas`
--

CREATE TABLE `plataformas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `plataformas`
--

INSERT INTO `plataformas` (`id`, `nombre`) VALUES
(6, 'Nintendo Switch'),
(1, 'PC'),
(3, 'PlayStation 4'),
(2, 'PlayStation 5'),
(5, 'Xbox One'),
(4, 'Xbox Series X/S');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resenas_editoriales`
--

CREATE TABLE `resenas_editoriales` (
  `id` int(11) NOT NULL,
  `juego_id` int(11) NOT NULL,
  `puntuacion` decimal(3,1) NOT NULL,
  `comentario` text NOT NULL,
  `etiqueta` varchar(100) DEFAULT NULL,
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `resenas_editoriales`
--

INSERT INTO `resenas_editoriales` (`id`, `juego_id`, `puntuacion`, `comentario`, `etiqueta`, `fecha_creacion`) VALUES
(1, 1, 9.6, 'Una aventura enorme, desafiante y con una libertad de exploración excepcional.', 'Imprescindible', '2026-09-03 12:17:48'),
(2, 2, 9.4, 'Una experiencia de exploración y combate muy cuidada, con un mundo memorable.', 'Joya oculta', '2026-09-03 12:17:48'),
(3, 3, 9.2, 'Una excelente combinación de acción, tensión y diseño de niveles.', 'Recomendado', '2026-09-03 12:17:48');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `generos`
--
ALTER TABLE `generos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `juegos`
--
ALTER TABLE `juegos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `genero_id` (`genero_id`);

--
-- Indices de la tabla `juego_plataforma`
--
ALTER TABLE `juego_plataforma`
  ADD PRIMARY KEY (`juego_id`,`plataforma_id`),
  ADD KEY `plataforma_id` (`plataforma_id`);

--
-- Indices de la tabla `plataformas`
--
ALTER TABLE `plataformas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `resenas_editoriales`
--
ALTER TABLE `resenas_editoriales`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `juego_id` (`juego_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `generos`
--
ALTER TABLE `generos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `juegos`
--
ALTER TABLE `juegos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `plataformas`
--
ALTER TABLE `plataformas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `resenas_editoriales`
--
ALTER TABLE `resenas_editoriales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `juegos`
--
ALTER TABLE `juegos`
  ADD CONSTRAINT `juegos_ibfk_1` FOREIGN KEY (`genero_id`) REFERENCES `generos` (`id`);

--
-- Filtros para la tabla `juego_plataforma`
--
ALTER TABLE `juego_plataforma`
  ADD CONSTRAINT `juego_plataforma_ibfk_1` FOREIGN KEY (`juego_id`) REFERENCES `juegos` (`id`),
  ADD CONSTRAINT `juego_plataforma_ibfk_2` FOREIGN KEY (`plataforma_id`) REFERENCES `plataformas` (`id`);

--
-- Filtros para la tabla `resenas_editoriales`
--
ALTER TABLE `resenas_editoriales`
  ADD CONSTRAINT `resenas_editoriales_ibfk_1` FOREIGN KEY (`juego_id`) REFERENCES `juegos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
