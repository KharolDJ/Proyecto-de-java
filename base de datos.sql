-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.3.7-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para sistema_ventas
CREATE DATABASE IF NOT EXISTS `sistema_ventas` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `sistema_ventas`;

-- Volcando estructura para tabla sistema_ventas.detalle_factura
CREATE TABLE IF NOT EXISTS `detalle_factura` (
  `id_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `id_factura` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `subtotal` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `id_factura` (`id_factura`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `detalle_factura_ibfk_1` FOREIGN KEY (`id_factura`) REFERENCES `facturas` (`id_factura`),
  CONSTRAINT `detalle_factura_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla sistema_ventas.detalle_factura: ~18 rows (aproximadamente)
DELETE FROM `detalle_factura`;
/*!40000 ALTER TABLE `detalle_factura` DISABLE KEYS */;
INSERT INTO `detalle_factura` (`id_detalle`, `id_factura`, `id_producto`, `cantidad`, `subtotal`) VALUES
	(1, 1, 1, 1, 3500.00),
	(2, 2, 1, 1, 3500.00),
	(3, 3, 6, 1, 3.00),
	(4, 4, 1, 1, 3500.00),
	(5, 5, 1, 1, 3500.00),
	(6, 6, 6, 1, 3.00),
	(7, 7, 3, 1, 4000.00),
	(8, 8, 6, 1, 3.00),
	(9, 9, 6, 2, 6.00),
	(10, 10, 6, 1, 3.00),
	(11, 11, 6, 3, 9.00),
	(12, 12, 7, 1, 2000.00),
	(13, 13, 7, 1, 2000.00),
	(14, 14, 6, 3, 9.00),
	(15, 15, 6, 2, 6.00),
	(16, 16, 3, 3, 12000.00),
	(17, 17, 1, 1, 3500.00),
	(18, 17, 2, 1, 9800.00);
/*!40000 ALTER TABLE `detalle_factura` ENABLE KEYS */;

-- Volcando estructura para tabla sistema_ventas.facturas
CREATE TABLE IF NOT EXISTS `facturas` (
  `id_factura` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `fecha` datetime DEFAULT current_timestamp(),
  `total` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_factura`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `facturas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla sistema_ventas.facturas: ~17 rows (aproximadamente)
DELETE FROM `facturas`;
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
INSERT INTO `facturas` (`id_factura`, `id_usuario`, `fecha`, `total`) VALUES
	(1, 2, '2025-11-27 04:28:27', 3500.00),
	(2, 2, '2025-11-27 04:39:15', 3500.00),
	(3, 2, '2025-11-27 04:39:33', 3.00),
	(4, 2, '2025-11-27 04:49:44', 3500.00),
	(5, 2, '2025-11-27 04:49:47', 3500.00),
	(6, 2, '2025-11-27 04:49:54', 3.00),
	(7, 2, '2025-11-27 04:50:18', 4000.00),
	(8, 2, '2025-11-27 04:51:35', 3.00),
	(9, 2, '2025-11-27 04:52:35', 6.00),
	(10, 2, '2025-11-27 04:52:44', 3.00),
	(11, 2, '2025-11-27 04:52:51', 9.00),
	(12, 2, '2025-11-27 04:59:26', 2000.00),
	(13, 2, '2025-11-27 15:05:41', 2000.00),
	(14, 2, '2025-11-27 15:52:28', 9.00),
	(15, 2, '2025-11-27 15:52:35', 6.00),
	(16, 2, '2025-11-27 15:52:41', 12000.00),
	(17, 2, '2025-11-27 17:03:08', 13300.00);
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;

-- Volcando estructura para tabla sistema_ventas.productos
CREATE TABLE IF NOT EXISTS `productos` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `precio` double NOT NULL,
  `stock` int(11) NOT NULL,
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla sistema_ventas.productos: ~6 rows (aproximadamente)
DELETE FROM `productos`;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` (`id_producto`, `nombre`, `descripcion`, `precio`, `stock`) VALUES
	(1, 'Arroz', 'Bolsa de 1kg', 3500, 43),
	(2, 'Aceite', 'Botella 1L', 9800, 26),
	(3, 'Azúcar', 'Bolsa de 1kg', 4000, 36),
	(6, 'papas', '1kg', 3, 14),
	(7, 'Moras', 'Moras frescas', 2000, 3),
	(8, 'pollo', '1kg', 100, 1);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;

-- Volcando estructura para tabla sistema_ventas.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `usuario` varchar(255) DEFAULT NULL,
  `contrasena` varchar(255) DEFAULT NULL,
  `rol` enum('administrador','empleado') NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `usuario` (`usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla sistema_ventas.usuarios: ~2 rows (aproximadamente)
DELETE FROM `usuarios`;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`id_usuario`, `nombre`, `usuario`, `contrasena`, `rol`) VALUES
	(1, 'Administrador', 'admin', '1234', 'administrador'),
	(2, 'Empleado 1', 'empleado1', '1234', 'empleado');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
