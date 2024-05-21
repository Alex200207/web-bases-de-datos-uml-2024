-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         11.3.2-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para proyectos
CREATE DATABASE IF NOT EXISTS `proyectos` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `proyectos`;

-- Volcando estructura para tabla proyectos.actividades
CREATE TABLE IF NOT EXISTS `actividades` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT '0',
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `presupuesto` float NOT NULL DEFAULT 0,
  `descripcion` text NOT NULL,
  `proyecto_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_actividades_proyectos` (`proyecto_id`),
  CONSTRAINT `FK_actividades_proyectos` FOREIGN KEY (`proyecto_id`) REFERENCES `proyectos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla proyectos.actividades: ~0 rows (aproximadamente)
DELETE FROM `actividades`;

-- Volcando estructura para tabla proyectos.actividad_miembro
CREATE TABLE IF NOT EXISTS `actividad_miembro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `actividades_id` int(11) NOT NULL DEFAULT 0,
  `miembro_id` int(11) NOT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_actividad_miembro_actividades` (`actividades_id`),
  KEY `FK_actividad_miembro_miembro` (`miembro_id`),
  CONSTRAINT `FK_actividad_miembro_actividades` FOREIGN KEY (`actividades_id`) REFERENCES `actividades` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_actividad_miembro_miembro` FOREIGN KEY (`miembro_id`) REFERENCES `miembro` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla proyectos.actividad_miembro: ~0 rows (aproximadamente)
DELETE FROM `actividad_miembro`;

-- Volcando estructura para tabla proyectos.miembro
CREATE TABLE IF NOT EXISTS `miembro` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `rol` int(2) NOT NULL,
  `email` varchar(30) NOT NULL,
  `telefono` varchar(30) NOT NULL,
  `celular` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla proyectos.miembro: ~0 rows (aproximadamente)
DELETE FROM `miembro`;

-- Volcando estructura para tabla proyectos.proyectos
CREATE TABLE IF NOT EXISTS `proyectos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT '0',
  `presupuesto` float DEFAULT 0,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date NOT NULL,
  `descripcion` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla proyectos.proyectos: ~5 rows (aproximadamente)
DELETE FROM `proyectos`;
INSERT INTO `proyectos` (`id`, `nombre`, `presupuesto`, `fecha_inicio`, `fecha_fin`, `descripcion`) VALUES
	(1, 'eddy f', 45, '2024-05-11', '2024-05-11', 'rtc'),
	(2, 'luisgg', 55, '2023-05-13', '2024-05-13', 'gg'),
	(28, 'Nemo minima voluptatdddd', 51, '1977-12-21', '1979-03-19', 'Temporibus libero vofffffd'),
	(29, 'Delectus', 28, '1984-06-23', '1996-04-26', 'Quod ut cum vero dol'),
	(30, 'eddy talavera ', 55, '2024-05-22', '2024-05-10', 'dddd');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
