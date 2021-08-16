-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-08-2021 a las 04:50:43
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `northcar_prueba`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alquiler`
--

CREATE TABLE `alquiler` (
  `id_alquiler` int(11) NOT NULL,
  `id_reserva` int(11) NOT NULL,
  `id_trabajador` int(11) NOT NULL,
  `id_tipoPago` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autos`
--

CREATE TABLE `autos` (
  `placa_auto` varchar(7) NOT NULL,
  `categoria_auto` int(4) NOT NULL,
  `modelo_auto` int(4) NOT NULL,
  `color_auto` varchar(20) NOT NULL,
  `costo_alquiler` decimal(10,2) NOT NULL,
  `estado_auto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_auto`
--

CREATE TABLE `categoria_auto` (
  `id_categoria_auto` int(4) NOT NULL,
  `categoria` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categoria_auto`
--

INSERT INTO `categoria_auto` (`id_categoria_auto`, `categoria`) VALUES
(1, 'Urbano'),
(2, 'Sedan'),
(3, 'Todoterreno'),
(4, 'Deportivo'),
(5, 'Monovolumen'),
(6, 'Hatchback');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `id_cliente` int(4) NOT NULL,
  `tipoPersona` int(4) NOT NULL,
  `identificación` varchar(11) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `apellidos` varchar(40) DEFAULT NULL,
  `direccion` varchar(60) NOT NULL,
  `telefono` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_reserva`
--

CREATE TABLE `detalle_reserva` (
  `id_detalleReserva` int(11) NOT NULL,
  `id_reserva` int(11) NOT NULL,
  `placa_auto` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_auto`
--

CREATE TABLE `estado_auto` (
  `id_estadoAuto` int(11) NOT NULL,
  `estado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estado_auto`
--

INSERT INTO `estado_auto` (`id_estadoAuto`, `estado`) VALUES
(1, 'DISPONIBLE'),
(2, 'ALQUILADO'),
(3, 'NO DISPONIBLE');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado_reserva`
--

CREATE TABLE `estado_reserva` (
  `id_estadoReserva` int(11) NOT NULL,
  `estado` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estado_reserva`
--

INSERT INTO `estado_reserva` (`id_estadoReserva`, `estado`) VALUES
(1, 'ACTIVA'),
(2, 'CANCELADA'),
(3, 'CULMINADA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca_auto`
--

CREATE TABLE `marca_auto` (
  `id_marca_auto` int(4) NOT NULL,
  `marca_auto` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `marca_auto`
--

INSERT INTO `marca_auto` (`id_marca_auto`, `marca_auto`) VALUES
(1, 'BMW'),
(2, 'Mercedes-Benz'),
(3, 'Ford'),
(4, 'Honda'),
(5, 'Toyota');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelo_auto`
--

CREATE TABLE `modelo_auto` (
  `id_modelo_auto` int(4) NOT NULL,
  `modelo_auto` varchar(40) NOT NULL,
  `marca_auto_fk` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `modelo_auto`
--

INSERT INTO `modelo_auto` (`id_modelo_auto`, `modelo_auto`, `marca_auto_fk`) VALUES
(1, 'Serie 1', 1),
(2, 'Serie 2', 1),
(3, 'Serie 3', 1),
(4, 'Serie 4', 1),
(5, 'Serie 5', 1),
(6, 'Serie 6', 1),
(7, 'Serie 7', 1),
(8, 'Z4', 1),
(9, 'X5', 1),
(10, 'X1', 1),
(11, 'X4', 1),
(12, 'C-Max', 3),
(13, 'Fiesta', 3),
(14, 'Focus', 3),
(15, 'Mondeo', 3),
(16, 'S-MAX', 3),
(17, 'B-MAX', 3),
(18, 'Grand C-Max', 3),
(19, 'Tourneo Custom', 3),
(20, 'Grand Tourneo Connect', 3),
(21, 'Mustang', 3),
(22, 'Transit Connect', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

CREATE TABLE `reserva` (
  `idReserva` int(11) NOT NULL,
  `fecha_reserva` date NOT NULL,
  `fecha_ini_alquiler` date NOT NULL,
  `fecha_fin_alquiler` date NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `id_cliente(dni)` int(4) NOT NULL,
  `id_detalleReserva` int(11) NOT NULL,
  `estado_reserva` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipos_usuario`
--

CREATE TABLE `tipos_usuario` (
  `id_tipos_usuario` int(1) NOT NULL,
  `tipoUsuario` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipos_usuario`
--

INSERT INTO `tipos_usuario` (`id_tipos_usuario`, `tipoUsuario`) VALUES
(1, 'ADMIN'),
(2, 'CAJA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_pago`
--

CREATE TABLE `tipo_pago` (
  `idTipoPago` int(11) NOT NULL,
  `tipo_pago` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_pago`
--

INSERT INTO `tipo_pago` (`idTipoPago`, `tipo_pago`) VALUES
(1, 'Efectivo'),
(2, 'Transferencia online'),
(3, 'PagoEfectivo'),
(4, 'Tarjeta Debito'),
(5, 'Tarjeta Credito'),
(6, 'Billetera Virtual');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_persona`
--

CREATE TABLE `tipo_persona` (
  `id_tipoPersona` int(4) NOT NULL,
  `tipo_persona` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_persona`
--

INSERT INTO `tipo_persona` (`id_tipoPersona`, `tipo_persona`) VALUES
(1, 'Natural'),
(2, 'Jurídica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `dni` varchar(8) NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `apellidos` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `usuario` varchar(11) NOT NULL,
  `contraseña` varchar(11) NOT NULL,
  `tipo_usuario` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `dni`, `nombre`, `apellidos`, `email`, `usuario`, `contraseña`, `tipo_usuario`) VALUES
(1, '72040215', 'Marcelo', 'Coronado Chanamé', 'marcelo2000@hotmail.com', 'MarceCor', 'soylacapa01', 2),
(2, '74696587', 'Hector', 'Zamora Valladares', 'hector24@gmail.com', 'HecZam1', 'noorientado', 2),
(3, '72560215', 'Piero', 'Alvarado Palomino', 'pieroalexis33@gmail.com', 'Pieroaap', 'piero1607', 1),
(4, '72987215', 'Alberto', 'Castillo Alvarado', 'joseloco@gmail.com', '123joseloco', 'joselo', 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alquiler`
--
ALTER TABLE `alquiler`
  ADD PRIMARY KEY (`id_alquiler`),
  ADD KEY `id_reserva` (`id_reserva`),
  ADD KEY `id_trabajador` (`id_trabajador`),
  ADD KEY `id_tipoPago` (`id_tipoPago`);

--
-- Indices de la tabla `autos`
--
ALTER TABLE `autos`
  ADD PRIMARY KEY (`placa_auto`),
  ADD UNIQUE KEY `estado` (`estado_auto`),
  ADD KEY `categoria` (`categoria_auto`),
  ADD KEY `modelo_auto` (`modelo_auto`);

--
-- Indices de la tabla `categoria_auto`
--
ALTER TABLE `categoria_auto`
  ADD PRIMARY KEY (`id_categoria_auto`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD KEY `identificación` (`tipoPersona`);

--
-- Indices de la tabla `detalle_reserva`
--
ALTER TABLE `detalle_reserva`
  ADD PRIMARY KEY (`id_detalleReserva`),
  ADD KEY `auto` (`placa_auto`),
  ADD KEY `id_reserva` (`id_reserva`);

--
-- Indices de la tabla `estado_auto`
--
ALTER TABLE `estado_auto`
  ADD PRIMARY KEY (`id_estadoAuto`);

--
-- Indices de la tabla `estado_reserva`
--
ALTER TABLE `estado_reserva`
  ADD PRIMARY KEY (`id_estadoReserva`);

--
-- Indices de la tabla `marca_auto`
--
ALTER TABLE `marca_auto`
  ADD PRIMARY KEY (`id_marca_auto`);

--
-- Indices de la tabla `modelo_auto`
--
ALTER TABLE `modelo_auto`
  ADD PRIMARY KEY (`id_modelo_auto`),
  ADD KEY `marca_auto_fk` (`marca_auto_fk`);

--
-- Indices de la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`idReserva`),
  ADD KEY `id_cliente(dni)` (`id_cliente(dni)`),
  ADD KEY `id_detalleReserva` (`id_detalleReserva`),
  ADD KEY `estado_reserva` (`estado_reserva`);

--
-- Indices de la tabla `tipos_usuario`
--
ALTER TABLE `tipos_usuario`
  ADD PRIMARY KEY (`id_tipos_usuario`);

--
-- Indices de la tabla `tipo_pago`
--
ALTER TABLE `tipo_pago`
  ADD PRIMARY KEY (`idTipoPago`);

--
-- Indices de la tabla `tipo_persona`
--
ALTER TABLE `tipo_persona`
  ADD PRIMARY KEY (`id_tipoPersona`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `tipo_usuario` (`tipo_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alquiler`
--
ALTER TABLE `alquiler`
  MODIFY `id_alquiler` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categoria_auto`
--
ALTER TABLE `categoria_auto`
  MODIFY `id_categoria_auto` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id_cliente` int(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_reserva`
--
ALTER TABLE `detalle_reserva`
  MODIFY `id_detalleReserva` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estado_auto`
--
ALTER TABLE `estado_auto`
  MODIFY `id_estadoAuto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `estado_reserva`
--
ALTER TABLE `estado_reserva`
  MODIFY `id_estadoReserva` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `marca_auto`
--
ALTER TABLE `marca_auto`
  MODIFY `id_marca_auto` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `modelo_auto`
--
ALTER TABLE `modelo_auto`
  MODIFY `id_modelo_auto` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `reserva`
--
ALTER TABLE `reserva`
  MODIFY `idReserva` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipos_usuario`
--
ALTER TABLE `tipos_usuario`
  MODIFY `id_tipos_usuario` int(1) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tipo_pago`
--
ALTER TABLE `tipo_pago`
  MODIFY `idTipoPago` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tipo_persona`
--
ALTER TABLE `tipo_persona`
  MODIFY `id_tipoPersona` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alquiler`
--
ALTER TABLE `alquiler`
  ADD CONSTRAINT `alquiler_ibfk_1` FOREIGN KEY (`id_trabajador`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `alquiler_ibfk_2` FOREIGN KEY (`id_tipoPago`) REFERENCES `tipo_pago` (`idTipoPago`),
  ADD CONSTRAINT `alquiler_ibfk_3` FOREIGN KEY (`id_reserva`) REFERENCES `reserva` (`idReserva`);

--
-- Filtros para la tabla `autos`
--
ALTER TABLE `autos`
  ADD CONSTRAINT `autos_ibfk_1` FOREIGN KEY (`estado_auto`) REFERENCES `estado_auto` (`id_estadoAuto`),
  ADD CONSTRAINT `autos_ibfk_2` FOREIGN KEY (`categoria_auto`) REFERENCES `categoria_auto` (`id_categoria_auto`),
  ADD CONSTRAINT `autos_ibfk_3` FOREIGN KEY (`modelo_auto`) REFERENCES `modelo_auto` (`id_modelo_auto`);

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`tipoPersona`) REFERENCES `tipo_persona` (`id_tipoPersona`);

--
-- Filtros para la tabla `detalle_reserva`
--
ALTER TABLE `detalle_reserva`
  ADD CONSTRAINT `detalle_reserva_ibfk_2` FOREIGN KEY (`placa_auto`) REFERENCES `autos` (`placa_auto`);

--
-- Filtros para la tabla `modelo_auto`
--
ALTER TABLE `modelo_auto`
  ADD CONSTRAINT `modelo_auto_ibfk_1` FOREIGN KEY (`marca_auto_fk`) REFERENCES `marca_auto` (`id_marca_auto`);

--
-- Filtros para la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `reserva_ibfk_1` FOREIGN KEY (`id_detalleReserva`) REFERENCES `detalle_reserva` (`id_detalleReserva`),
  ADD CONSTRAINT `reserva_ibfk_3` FOREIGN KEY (`estado_reserva`) REFERENCES `estado_reserva` (`id_estadoReserva`),
  ADD CONSTRAINT `reserva_ibfk_4` FOREIGN KEY (`id_cliente(dni)`) REFERENCES `cliente` (`id_cliente`);

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`tipo_usuario`) REFERENCES `tipos_usuario` (`id_tipos_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
