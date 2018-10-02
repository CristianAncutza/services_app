-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.19-MariaDB


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema mobile_app
--

CREATE DATABASE IF NOT EXISTS mobile_app;
USE mobile_app;

--
-- Definition of table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE `categoria` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `descripcion` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categoria`
--

/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;


--
-- Definition of table `contratante`
--

DROP TABLE IF EXISTS `contratante`;
CREATE TABLE `contratante` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `nombre` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dni` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sexo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mail` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `direccion` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nacionalidad` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contratante`
--

/*!40000 ALTER TABLE `contratante` DISABLE KEYS */;
/*!40000 ALTER TABLE `contratante` ENABLE KEYS */;


--
-- Definition of table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`,`migration`,`batch`) VALUES 
 (1,'2018_10_02_121227_create_categoria_table',1),
 (2,'2018_10_02_121227_create_contratante_table',1),
 (3,'2018_10_02_121227_create_oferta_table',1),
 (4,'2018_10_02_121227_create_postulacion_table',1),
 (5,'2018_10_02_121227_create_postulante_table',1),
 (6,'2018_10_02_121237_create_foreign_keys',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;


--
-- Definition of table `oferta`
--

DROP TABLE IF EXISTS `oferta`;
CREATE TABLE `oferta` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `id_postulante` int(10) unsigned NOT NULL,
  `id_categoria` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `oferta_id_postulante_foreign` (`id_postulante`),
  KEY `oferta_id_categoria_foreign` (`id_categoria`),
  CONSTRAINT `oferta_id_categoria_foreign` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id`),
  CONSTRAINT `oferta_id_postulante_foreign` FOREIGN KEY (`id_postulante`) REFERENCES `postulante` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oferta`
--

/*!40000 ALTER TABLE `oferta` DISABLE KEYS */;
/*!40000 ALTER TABLE `oferta` ENABLE KEYS */;


--
-- Definition of table `postulacion`
--

DROP TABLE IF EXISTS `postulacion`;
CREATE TABLE `postulacion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `id_postulante` int(10) unsigned NOT NULL,
  `id_contratante` int(10) unsigned NOT NULL,
  `comentario` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `postulacion_id_postulante_foreign` (`id_postulante`),
  KEY `postulacion_id_contratante_foreign` (`id_contratante`),
  CONSTRAINT `postulacion_id_contratante_foreign` FOREIGN KEY (`id_contratante`) REFERENCES `contratante` (`id`),
  CONSTRAINT `postulacion_id_postulante_foreign` FOREIGN KEY (`id_postulante`) REFERENCES `postulante` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `postulacion`
--

/*!40000 ALTER TABLE `postulacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `postulacion` ENABLE KEYS */;


--
-- Definition of table `postulante`
--

DROP TABLE IF EXISTS `postulante`;
CREATE TABLE `postulante` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `nombre` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellido` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dni` bigint(20) NOT NULL,
  `mail` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefono` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `direccion` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nacionalidad` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sexo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `postulante`
--

/*!40000 ALTER TABLE `postulante` DISABLE KEYS */;
/*!40000 ALTER TABLE `postulante` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
