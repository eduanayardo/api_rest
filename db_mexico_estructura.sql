/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 11.1.2-MariaDB-1:11.1.2+maria~ubu2204 : Database - db_mexico
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_mexico` /*!40100 DEFAULT CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci */;

USE `db_mexico`;

/*Table structure for table `detalle` */

DROP TABLE IF EXISTS `detalle`;

CREATE TABLE `detalle` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `informacion` text DEFAULT NULL,
  `tipo_actividad_id` int(11) NOT NULL,
  `municipio_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_detalle_tipo_actividad1_idx` (`tipo_actividad_id`),
  KEY `fk_detalle_municipio1_idx` (`municipio_id`),
  CONSTRAINT `fk_detalle_municipio1` FOREIGN KEY (`municipio_id`) REFERENCES `municipio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_tipo_actividad1` FOREIGN KEY (`tipo_actividad_id`) REFERENCES `tipo_actividad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

/*Table structure for table `estado` */

DROP TABLE IF EXISTS `estado`;

CREATE TABLE `estado` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `abreviatura` varchar(2) DEFAULT NULL,
  `status` tinyint(4) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

/*Table structure for table `galeria` */

DROP TABLE IF EXISTS `galeria`;

CREATE TABLE `galeria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) DEFAULT NULL,
  `url` text DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `municipio_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_galeria_municipio1_idx` (`municipio_id`),
  CONSTRAINT `fk_galeria_municipio1` FOREIGN KEY (`municipio_id`) REFERENCES `municipio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

/*Table structure for table `municipio` */

DROP TABLE IF EXISTS `municipio`;

CREATE TABLE `municipio` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) DEFAULT NULL,
  `titulo` text DEFAULT NULL,
  `superficie` varchar(45) DEFAULT NULL,
  `poblacion` int(11) DEFAULT NULL,
  `fundacion` date DEFAULT NULL,
  `pueblo_magico` year(4) DEFAULT 0000,
  `descripcion` text DEFAULT NULL,
  `gastronomia` text DEFAULT NULL,
  `banner` varchar(255) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  `estado_id` int(11) NOT NULL,
  `zona_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_municipios_estados_idx` (`estado_id`),
  KEY `fk_municipio_zona1_idx` (`zona_id`),
  CONSTRAINT `fk_municipio_zona1` FOREIGN KEY (`zona_id`) REFERENCES `zona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_municipios_estados` FOREIGN KEY (`estado_id`) REFERENCES `estado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

/*Table structure for table `pueblo` */

DROP TABLE IF EXISTS `pueblo`;

CREATE TABLE `pueblo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `informacion` text DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `municipio_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_ciudades_municipios1_idx` (`municipio_id`),
  CONSTRAINT `fk_ciudades_municipios1` FOREIGN KEY (`municipio_id`) REFERENCES `municipio` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

/*Table structure for table `tipo_actividad` */

DROP TABLE IF EXISTS `tipo_actividad`;

CREATE TABLE `tipo_actividad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

/*Table structure for table `zona` */

DROP TABLE IF EXISTS `zona`;

CREATE TABLE `zona` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `status` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
