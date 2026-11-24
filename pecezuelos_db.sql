-- MySQL dump 10.13  Distrib 8.4.13, for Linux (x86_64)
--
-- Host: localhost    Database: pecezuelos_db
-- ------------------------------------------------------
-- Server version	8.4.13-0ubuntu0.26.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alerta`
--

DROP TABLE IF EXISTS `alerta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alerta` (
  `id_alerta` int NOT NULL AUTO_INCREMENT,
  `id_medicion` int NOT NULL,
  `tipo_alerta` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_emision` datetime DEFAULT CURRENT_TIMESTAMP,
  `estado_lectura` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_alerta`),
  KEY `id_medicion` (`id_medicion`),
  CONSTRAINT `alerta_ibfk_1` FOREIGN KEY (`id_medicion`) REFERENCES `medicion` (`id_medicion`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=191 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alerta`
--

LOCK TABLES `alerta` WRITE;
/*!40000 ALTER TABLE `alerta` DISABLE KEYS */;
INSERT INTO `alerta` VALUES (1,2,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 19:31:48',0),(2,4,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 19:32:05',0),(3,6,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:08:06',0),(4,8,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:08:06',0),(5,10,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:08:17',0),(6,12,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:08:17',0),(7,14,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:08:27',0),(8,16,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:08:27',0),(9,18,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:08:37',0),(10,20,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:08:37',0),(11,22,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:08:47',0),(12,24,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:08:47',0),(13,26,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:08:57',0),(14,28,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:08:57',0),(15,30,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:09:26',0),(16,32,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:09:26',0),(17,34,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:09:36',0),(18,36,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:09:36',0),(19,38,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:09:46',0),(20,40,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:09:46',0),(21,42,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:09:56',0),(22,44,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:09:56',0),(23,46,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:10:06',0),(24,48,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:10:06',0),(25,50,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:10:16',0),(26,52,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:10:16',0),(27,54,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:10:26',0),(28,56,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:10:26',0),(29,58,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:10:36',0),(30,60,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:10:36',0),(31,62,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:10:46',0),(32,64,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:10:46',0),(33,66,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:10:56',0),(34,68,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:10:56',0),(35,70,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:11:06',0),(36,72,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:11:06',0),(37,74,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:11:16',0),(38,76,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:11:16',0),(39,78,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:11:26',0),(40,80,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:11:26',0),(41,82,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:11:36',0),(42,84,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:11:36',0),(43,86,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:11:46',0),(44,88,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:11:46',0),(45,90,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:11:56',0),(46,92,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:11:56',0),(47,94,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:12:06',0),(48,96,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:12:06',0),(49,98,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:12:16',0),(50,100,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:12:16',0),(51,102,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:12:26',0),(52,104,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:12:26',0),(53,106,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:12:26',0),(54,108,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:12:26',0),(55,110,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:12:36',0),(56,112,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:12:36',0),(57,114,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:12:37',0),(58,116,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:12:37',0),(59,118,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:12:46',0),(60,120,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:12:46',0),(61,122,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:12:47',0),(62,124,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:12:47',0),(63,126,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:12:56',0),(64,128,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:12:56',0),(65,130,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:12:57',0),(66,132,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:12:57',0),(67,134,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:13:06',0),(68,136,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:13:06',0),(69,137,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:13:06',0),(70,139,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:13:07',0),(71,141,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:13:07',0),(72,142,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:13:11',0),(73,143,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:13:13',0),(74,145,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:13:21',0),(75,147,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:13:21',0),(76,149,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:13:24',0),(77,151,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:13:24',0),(78,152,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:13:25',0),(79,153,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:13:30',0),(80,155,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:13:32',0),(81,157,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:13:32',0),(82,158,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:13:32',0),(83,160,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:13:42',0),(84,162,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:13:42',0),(85,164,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:13:52',0),(86,166,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:13:52',0),(87,168,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:14:02',0),(88,170,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:14:02',0),(89,172,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:14:12',0),(90,174,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:14:12',0),(91,176,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:14:22',0),(92,178,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:14:22',0),(93,180,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:14:31',0),(94,182,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:14:31',0),(95,184,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:14:42',0),(96,186,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:14:42',0),(97,188,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:14:52',0),(98,190,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:14:52',0),(99,192,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:15:02',0),(100,194,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:15:02',0),(101,196,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:15:12',0),(102,198,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:15:12',0),(103,200,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:15:22',0),(104,202,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:15:22',0),(105,204,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:15:32',0),(106,206,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:15:32',0),(107,208,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:15:42',0),(108,210,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:15:42',0),(109,212,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:15:51',0),(110,214,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:15:51',0),(111,216,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:16:02',0),(112,218,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:16:02',0),(113,220,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:16:11',0),(114,222,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:16:11',0),(115,224,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:16:22',0),(116,226,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:16:22',0),(117,228,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:16:31',0),(118,230,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:16:31',0),(119,232,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:16:42',0),(120,234,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:16:42',0),(121,236,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:16:52',0),(122,238,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:16:52',0),(123,240,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:17:02',0),(124,242,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:17:02',0),(125,244,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:17:12',0),(126,246,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:17:12',0),(127,248,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:17:21',0),(128,250,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:17:21',0),(129,252,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:17:32',0),(130,254,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:17:32',0),(131,256,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:17:42',0),(132,258,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:17:42',0),(133,260,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:17:52',0),(134,262,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:17:52',0),(135,264,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:18:02',0),(136,266,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:18:02',0),(137,268,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:18:11',0),(138,270,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:18:11',0),(139,272,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:18:22',0),(140,274,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:18:22',0),(141,276,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:18:32',0),(142,278,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:18:32',0),(143,280,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:18:42',0),(144,282,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:18:42',0),(145,284,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:18:52',0),(146,286,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:18:52',0),(147,288,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:19:02',0),(148,290,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:19:02',0),(149,292,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:19:11',0),(150,294,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:19:11',0),(151,296,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:19:22',0),(152,298,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:19:22',0),(153,300,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:19:32',0),(154,302,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:19:32',0),(155,304,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:19:41',0),(156,306,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:19:41',0),(157,308,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:19:52',0),(158,310,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:19:52',0),(159,312,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:20:02',0),(160,314,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:20:02',0),(161,316,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:20:12',0),(162,318,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:20:12',0),(163,320,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:20:22',0),(164,322,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:20:22',0),(165,324,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:20:32',0),(166,326,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:20:32',0),(167,328,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:20:41',0),(168,330,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:20:42',0),(169,332,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:20:54',0),(170,334,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:20:54',0),(171,336,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:21:04',0),(172,338,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:21:04',0),(173,340,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:21:14',0),(174,342,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:21:14',0),(175,344,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:21:24',0),(176,346,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:21:24',0),(177,348,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:21:34',0),(178,350,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:21:34',0),(179,352,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:21:44',0),(180,354,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:21:44',0),(181,356,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:21:54',0),(182,358,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-22 20:21:54',0),(183,360,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-24 00:01:10',0),(184,362,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-24 00:01:10',0),(185,364,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-24 01:05:46',0),(186,366,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-24 01:05:46',0),(187,368,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-24 01:06:02',0),(188,370,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-24 01:06:02',0),(189,372,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-24 01:06:12',0),(190,374,'CRÍTICA','Valor inusualmente alto detectado por el sensor.','2026-11-24 01:06:12',0);
/*!40000 ALTER TABLE `alerta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicion`
--

DROP TABLE IF EXISTS `medicion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicion` (
  `id_medicion` int NOT NULL AUTO_INCREMENT,
  `id_sensor` int NOT NULL,
  `valor_registrado` decimal(10,2) NOT NULL,
  `fecha_hora` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_medicion`),
  KEY `id_sensor` (`id_sensor`),
  CONSTRAINT `medicion_ibfk_1` FOREIGN KEY (`id_sensor`) REFERENCES `sensor` (`id_sensor`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=375 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicion`
--

LOCK TABLES `medicion` WRITE;
/*!40000 ALTER TABLE `medicion` DISABLE KEYS */;
INSERT INTO `medicion` VALUES (1,1,26.40,'2026-11-22 19:31:48'),(2,2,84.00,'2026-11-22 19:31:48'),(3,3,1.80,'2026-11-22 19:31:48'),(4,4,72.00,'2026-11-22 19:32:05'),(5,5,26.40,'2026-11-22 20:08:06'),(6,6,84.00,'2026-11-22 20:08:06'),(7,7,1.80,'2026-11-22 20:08:06'),(8,8,72.00,'2026-11-22 20:08:06'),(9,5,26.30,'2026-11-22 20:08:17'),(10,6,84.00,'2026-11-22 20:08:17'),(11,7,1.70,'2026-11-22 20:08:17'),(12,8,72.00,'2026-11-22 20:08:17'),(13,5,26.30,'2026-11-22 20:08:27'),(14,6,84.00,'2026-11-22 20:08:27'),(15,7,1.80,'2026-11-22 20:08:27'),(16,8,72.00,'2026-11-22 20:08:27'),(17,5,26.10,'2026-11-22 20:08:37'),(18,6,84.00,'2026-11-22 20:08:37'),(19,7,1.80,'2026-11-22 20:08:37'),(20,8,72.00,'2026-11-22 20:08:37'),(21,5,26.00,'2026-11-22 20:08:47'),(22,6,83.00,'2026-11-22 20:08:47'),(23,7,1.80,'2026-11-22 20:08:47'),(24,8,72.00,'2026-11-22 20:08:47'),(25,5,26.30,'2026-11-22 20:08:57'),(26,6,83.00,'2026-11-22 20:08:57'),(27,7,1.80,'2026-11-22 20:08:57'),(28,8,72.00,'2026-11-22 20:08:57'),(29,5,26.10,'2026-11-22 20:09:26'),(30,6,82.00,'2026-11-22 20:09:26'),(31,7,1.70,'2026-11-22 20:09:26'),(32,8,72.00,'2026-11-22 20:09:26'),(33,5,25.80,'2026-11-22 20:09:36'),(34,6,82.00,'2026-11-22 20:09:36'),(35,7,1.70,'2026-11-22 20:09:36'),(36,8,72.00,'2026-11-22 20:09:36'),(37,5,26.10,'2026-11-22 20:09:46'),(38,6,81.00,'2026-11-22 20:09:46'),(39,7,1.60,'2026-11-22 20:09:46'),(40,8,72.00,'2026-11-22 20:09:46'),(41,5,26.30,'2026-11-22 20:09:56'),(42,6,81.00,'2026-11-22 20:09:56'),(43,7,1.50,'2026-11-22 20:09:56'),(44,8,72.00,'2026-11-22 20:09:56'),(45,5,26.30,'2026-11-22 20:10:06'),(46,6,81.00,'2026-11-22 20:10:06'),(47,7,1.50,'2026-11-22 20:10:06'),(48,8,72.00,'2026-11-22 20:10:06'),(49,5,26.20,'2026-11-22 20:10:16'),(50,6,80.00,'2026-11-22 20:10:16'),(51,7,1.50,'2026-11-22 20:10:16'),(52,8,72.00,'2026-11-22 20:10:16'),(53,5,26.40,'2026-11-22 20:10:26'),(54,6,79.00,'2026-11-22 20:10:26'),(55,7,1.60,'2026-11-22 20:10:26'),(56,8,72.00,'2026-11-22 20:10:26'),(57,5,26.70,'2026-11-22 20:10:36'),(58,6,79.00,'2026-11-22 20:10:36'),(59,7,1.70,'2026-11-22 20:10:36'),(60,8,72.00,'2026-11-22 20:10:36'),(61,5,26.50,'2026-11-22 20:10:46'),(62,6,79.00,'2026-11-22 20:10:46'),(63,7,1.60,'2026-11-22 20:10:46'),(64,8,72.00,'2026-11-22 20:10:46'),(65,5,26.20,'2026-11-22 20:10:56'),(66,6,79.00,'2026-11-22 20:10:56'),(67,7,1.70,'2026-11-22 20:10:56'),(68,8,72.00,'2026-11-22 20:10:56'),(69,5,26.30,'2026-11-22 20:11:06'),(70,6,79.00,'2026-11-22 20:11:06'),(71,7,1.80,'2026-11-22 20:11:06'),(72,8,72.00,'2026-11-22 20:11:06'),(73,5,26.00,'2026-11-22 20:11:16'),(74,6,79.00,'2026-11-22 20:11:16'),(75,7,1.90,'2026-11-22 20:11:16'),(76,8,72.00,'2026-11-22 20:11:16'),(77,5,26.30,'2026-11-22 20:11:26'),(78,6,79.00,'2026-11-22 20:11:26'),(79,7,2.00,'2026-11-22 20:11:26'),(80,8,72.00,'2026-11-22 20:11:26'),(81,5,26.40,'2026-11-22 20:11:36'),(82,6,79.00,'2026-11-22 20:11:36'),(83,7,2.00,'2026-11-22 20:11:36'),(84,8,72.00,'2026-11-22 20:11:36'),(85,5,26.30,'2026-11-22 20:11:46'),(86,6,79.00,'2026-11-22 20:11:46'),(87,7,2.00,'2026-11-22 20:11:46'),(88,8,72.00,'2026-11-22 20:11:46'),(89,5,26.00,'2026-11-22 20:11:56'),(90,6,79.00,'2026-11-22 20:11:56'),(91,7,2.20,'2026-11-22 20:11:56'),(92,8,72.00,'2026-11-22 20:11:56'),(93,5,25.80,'2026-11-22 20:12:06'),(94,6,79.00,'2026-11-22 20:12:06'),(95,7,2.30,'2026-11-22 20:12:06'),(96,8,72.00,'2026-11-22 20:12:06'),(97,5,25.90,'2026-11-22 20:12:16'),(98,6,79.00,'2026-11-22 20:12:16'),(99,7,2.20,'2026-11-22 20:12:16'),(100,8,72.00,'2026-11-22 20:12:16'),(101,5,25.90,'2026-11-22 20:12:26'),(102,6,79.00,'2026-11-22 20:12:26'),(103,7,2.30,'2026-11-22 20:12:26'),(104,8,72.00,'2026-11-22 20:12:26'),(105,9,26.40,'2026-11-22 20:12:26'),(106,10,84.00,'2026-11-22 20:12:26'),(107,11,1.80,'2026-11-22 20:12:26'),(108,12,72.00,'2026-11-22 20:12:26'),(109,5,26.10,'2026-11-22 20:12:36'),(110,6,79.00,'2026-11-22 20:12:36'),(111,7,2.30,'2026-11-22 20:12:36'),(112,8,72.00,'2026-11-22 20:12:36'),(113,9,26.70,'2026-11-22 20:12:37'),(114,10,84.00,'2026-11-22 20:12:37'),(115,11,2.00,'2026-11-22 20:12:37'),(116,12,72.00,'2026-11-22 20:12:37'),(117,5,26.30,'2026-11-22 20:12:46'),(118,6,78.00,'2026-11-22 20:12:46'),(119,7,2.30,'2026-11-22 20:12:46'),(120,8,72.00,'2026-11-22 20:12:46'),(121,9,26.80,'2026-11-22 20:12:47'),(122,10,84.00,'2026-11-22 20:12:47'),(123,11,1.90,'2026-11-22 20:12:47'),(124,12,72.00,'2026-11-22 20:12:47'),(125,5,26.00,'2026-11-22 20:12:56'),(126,6,78.00,'2026-11-22 20:12:56'),(127,7,2.20,'2026-11-22 20:12:56'),(128,8,72.00,'2026-11-22 20:12:56'),(129,9,26.50,'2026-11-22 20:12:57'),(130,10,84.00,'2026-11-22 20:12:57'),(131,11,1.90,'2026-11-22 20:12:57'),(132,12,72.00,'2026-11-22 20:12:57'),(133,5,26.10,'2026-11-22 20:13:06'),(134,6,78.00,'2026-11-22 20:13:06'),(135,7,2.30,'2026-11-22 20:13:06'),(136,8,72.00,'2026-11-22 20:13:06'),(137,6,95.00,'2026-11-22 20:13:06'),(138,9,26.20,'2026-11-22 20:13:07'),(139,10,84.00,'2026-11-22 20:13:07'),(140,11,2.00,'2026-11-22 20:13:07'),(141,12,72.00,'2026-11-22 20:13:07'),(142,8,100.00,'2026-11-22 20:13:11'),(143,10,95.00,'2026-11-22 20:13:13'),(144,5,25.90,'2026-11-22 20:13:21'),(145,6,96.00,'2026-11-22 20:13:21'),(146,7,2.30,'2026-11-22 20:13:21'),(147,8,98.00,'2026-11-22 20:13:21'),(148,9,26.30,'2026-11-22 20:13:24'),(149,10,95.00,'2026-11-22 20:13:24'),(150,11,2.20,'2026-11-22 20:13:24'),(151,12,72.00,'2026-11-22 20:13:24'),(152,12,100.00,'2026-11-22 20:13:25'),(153,10,95.00,'2026-11-22 20:13:30'),(154,5,26.00,'2026-11-22 20:13:32'),(155,6,96.00,'2026-11-22 20:13:32'),(156,7,2.40,'2026-11-22 20:13:32'),(157,8,98.00,'2026-11-22 20:13:32'),(158,10,95.00,'2026-11-22 20:13:32'),(159,5,26.20,'2026-11-22 20:13:42'),(160,6,96.00,'2026-11-22 20:13:42'),(161,7,2.30,'2026-11-22 20:13:42'),(162,8,98.00,'2026-11-22 20:13:42'),(163,5,26.00,'2026-11-22 20:13:52'),(164,6,96.00,'2026-11-22 20:13:52'),(165,7,2.40,'2026-11-22 20:13:52'),(166,8,98.00,'2026-11-22 20:13:52'),(167,5,25.90,'2026-11-22 20:14:02'),(168,6,96.00,'2026-11-22 20:14:02'),(169,7,2.40,'2026-11-22 20:14:02'),(170,8,98.00,'2026-11-22 20:14:02'),(171,5,25.70,'2026-11-22 20:14:12'),(172,6,96.00,'2026-11-22 20:14:12'),(173,7,2.60,'2026-11-22 20:14:12'),(174,8,98.00,'2026-11-22 20:14:12'),(175,5,25.70,'2026-11-22 20:14:22'),(176,6,96.00,'2026-11-22 20:14:22'),(177,7,2.60,'2026-11-22 20:14:22'),(178,8,98.00,'2026-11-22 20:14:22'),(179,5,25.50,'2026-11-22 20:14:31'),(180,6,96.00,'2026-11-22 20:14:31'),(181,7,2.60,'2026-11-22 20:14:31'),(182,8,98.00,'2026-11-22 20:14:31'),(183,5,25.70,'2026-11-22 20:14:42'),(184,6,95.00,'2026-11-22 20:14:42'),(185,7,2.60,'2026-11-22 20:14:42'),(186,8,98.00,'2026-11-22 20:14:42'),(187,5,25.90,'2026-11-22 20:14:52'),(188,6,96.00,'2026-11-22 20:14:52'),(189,7,2.60,'2026-11-22 20:14:52'),(190,8,98.00,'2026-11-22 20:14:52'),(191,5,25.60,'2026-11-22 20:15:02'),(192,6,96.00,'2026-11-22 20:15:02'),(193,7,2.50,'2026-11-22 20:15:02'),(194,8,98.00,'2026-11-22 20:15:02'),(195,5,25.80,'2026-11-22 20:15:12'),(196,6,95.00,'2026-11-22 20:15:12'),(197,7,2.60,'2026-11-22 20:15:12'),(198,8,98.00,'2026-11-22 20:15:12'),(199,5,25.50,'2026-11-22 20:15:22'),(200,6,95.00,'2026-11-22 20:15:22'),(201,7,2.50,'2026-11-22 20:15:22'),(202,8,98.00,'2026-11-22 20:15:22'),(203,5,25.20,'2026-11-22 20:15:32'),(204,6,95.00,'2026-11-22 20:15:32'),(205,7,2.60,'2026-11-22 20:15:32'),(206,8,98.00,'2026-11-22 20:15:32'),(207,5,25.50,'2026-11-22 20:15:42'),(208,6,95.00,'2026-11-22 20:15:42'),(209,7,2.50,'2026-11-22 20:15:42'),(210,8,98.00,'2026-11-22 20:15:42'),(211,5,25.70,'2026-11-22 20:15:51'),(212,6,95.00,'2026-11-22 20:15:51'),(213,7,2.60,'2026-11-22 20:15:51'),(214,8,98.00,'2026-11-22 20:15:51'),(215,5,25.90,'2026-11-22 20:16:02'),(216,6,95.00,'2026-11-22 20:16:02'),(217,7,2.50,'2026-11-22 20:16:02'),(218,8,98.00,'2026-11-22 20:16:02'),(219,5,26.10,'2026-11-22 20:16:11'),(220,6,95.00,'2026-11-22 20:16:11'),(221,7,2.60,'2026-11-22 20:16:11'),(222,8,98.00,'2026-11-22 20:16:11'),(223,5,25.90,'2026-11-22 20:16:22'),(224,6,94.00,'2026-11-22 20:16:22'),(225,7,2.50,'2026-11-22 20:16:22'),(226,8,98.00,'2026-11-22 20:16:22'),(227,5,26.10,'2026-11-22 20:16:31'),(228,6,94.00,'2026-11-22 20:16:31'),(229,7,2.40,'2026-11-22 20:16:31'),(230,8,98.00,'2026-11-22 20:16:31'),(231,5,26.40,'2026-11-22 20:16:42'),(232,6,94.00,'2026-11-22 20:16:42'),(233,7,2.40,'2026-11-22 20:16:42'),(234,8,98.00,'2026-11-22 20:16:42'),(235,5,26.70,'2026-11-22 20:16:52'),(236,6,94.00,'2026-11-22 20:16:52'),(237,7,2.40,'2026-11-22 20:16:52'),(238,8,98.00,'2026-11-22 20:16:52'),(239,5,26.50,'2026-11-22 20:17:02'),(240,6,94.00,'2026-11-22 20:17:02'),(241,7,2.40,'2026-11-22 20:17:02'),(242,8,98.00,'2026-11-22 20:17:02'),(243,5,26.70,'2026-11-22 20:17:12'),(244,6,94.00,'2026-11-22 20:17:12'),(245,7,2.40,'2026-11-22 20:17:12'),(246,8,98.00,'2026-11-22 20:17:12'),(247,5,27.00,'2026-11-22 20:17:21'),(248,6,95.00,'2026-11-22 20:17:21'),(249,7,2.50,'2026-11-22 20:17:21'),(250,8,98.00,'2026-11-22 20:17:21'),(251,5,26.90,'2026-11-22 20:17:32'),(252,6,96.00,'2026-11-22 20:17:32'),(253,7,2.40,'2026-11-22 20:17:32'),(254,8,98.00,'2026-11-22 20:17:32'),(255,5,27.10,'2026-11-22 20:17:42'),(256,6,96.00,'2026-11-22 20:17:42'),(257,7,2.40,'2026-11-22 20:17:42'),(258,8,98.00,'2026-11-22 20:17:42'),(259,5,27.10,'2026-11-22 20:17:52'),(260,6,96.00,'2026-11-22 20:17:52'),(261,7,2.30,'2026-11-22 20:17:52'),(262,8,98.00,'2026-11-22 20:17:52'),(263,5,27.20,'2026-11-22 20:18:02'),(264,6,96.00,'2026-11-22 20:18:02'),(265,7,2.30,'2026-11-22 20:18:02'),(266,8,98.00,'2026-11-22 20:18:02'),(267,5,27.50,'2026-11-22 20:18:11'),(268,6,96.00,'2026-11-22 20:18:11'),(269,7,2.40,'2026-11-22 20:18:11'),(270,8,98.00,'2026-11-22 20:18:11'),(271,5,27.80,'2026-11-22 20:18:22'),(272,6,96.00,'2026-11-22 20:18:22'),(273,7,2.40,'2026-11-22 20:18:22'),(274,8,98.00,'2026-11-22 20:18:22'),(275,5,27.80,'2026-11-22 20:18:32'),(276,6,95.00,'2026-11-22 20:18:32'),(277,7,2.30,'2026-11-22 20:18:32'),(278,8,98.00,'2026-11-22 20:18:32'),(279,5,27.80,'2026-11-22 20:18:42'),(280,6,94.00,'2026-11-22 20:18:42'),(281,7,2.30,'2026-11-22 20:18:42'),(282,8,98.00,'2026-11-22 20:18:42'),(283,5,27.70,'2026-11-22 20:18:52'),(284,6,94.00,'2026-11-22 20:18:52'),(285,7,2.30,'2026-11-22 20:18:52'),(286,8,98.00,'2026-11-22 20:18:52'),(287,5,27.40,'2026-11-22 20:19:02'),(288,6,94.00,'2026-11-22 20:19:02'),(289,7,2.30,'2026-11-22 20:19:02'),(290,8,98.00,'2026-11-22 20:19:02'),(291,5,27.20,'2026-11-22 20:19:11'),(292,6,95.00,'2026-11-22 20:19:11'),(293,7,2.40,'2026-11-22 20:19:11'),(294,8,98.00,'2026-11-22 20:19:11'),(295,5,27.50,'2026-11-22 20:19:22'),(296,6,96.00,'2026-11-22 20:19:22'),(297,7,2.30,'2026-11-22 20:19:22'),(298,8,98.00,'2026-11-22 20:19:22'),(299,5,27.60,'2026-11-22 20:19:32'),(300,6,96.00,'2026-11-22 20:19:32'),(301,7,2.30,'2026-11-22 20:19:32'),(302,8,98.00,'2026-11-22 20:19:32'),(303,5,27.50,'2026-11-22 20:19:41'),(304,6,95.00,'2026-11-22 20:19:41'),(305,7,2.40,'2026-11-22 20:19:41'),(306,8,98.00,'2026-11-22 20:19:41'),(307,5,27.60,'2026-11-22 20:19:52'),(308,6,95.00,'2026-11-22 20:19:52'),(309,7,2.60,'2026-11-22 20:19:52'),(310,8,98.00,'2026-11-22 20:19:52'),(311,5,27.60,'2026-11-22 20:20:02'),(312,6,95.00,'2026-11-22 20:20:02'),(313,7,2.60,'2026-11-22 20:20:02'),(314,8,98.00,'2026-11-22 20:20:02'),(315,5,27.60,'2026-11-22 20:20:12'),(316,6,95.00,'2026-11-22 20:20:12'),(317,7,2.60,'2026-11-22 20:20:12'),(318,8,98.00,'2026-11-22 20:20:12'),(319,5,27.80,'2026-11-22 20:20:22'),(320,6,95.00,'2026-11-22 20:20:22'),(321,7,2.60,'2026-11-22 20:20:22'),(322,8,98.00,'2026-11-22 20:20:22'),(323,5,27.80,'2026-11-22 20:20:32'),(324,6,95.00,'2026-11-22 20:20:32'),(325,7,2.60,'2026-11-22 20:20:32'),(326,8,98.00,'2026-11-22 20:20:32'),(327,5,27.80,'2026-11-22 20:20:41'),(328,6,95.00,'2026-11-22 20:20:41'),(329,7,2.50,'2026-11-22 20:20:42'),(330,8,98.00,'2026-11-22 20:20:42'),(331,5,27.60,'2026-11-22 20:20:54'),(332,6,95.00,'2026-11-22 20:20:54'),(333,7,2.50,'2026-11-22 20:20:54'),(334,8,98.00,'2026-11-22 20:20:54'),(335,5,27.40,'2026-11-22 20:21:04'),(336,6,95.00,'2026-11-22 20:21:04'),(337,7,2.50,'2026-11-22 20:21:04'),(338,8,98.00,'2026-11-22 20:21:04'),(339,5,27.70,'2026-11-22 20:21:14'),(340,6,95.00,'2026-11-22 20:21:14'),(341,7,2.60,'2026-11-22 20:21:14'),(342,8,98.00,'2026-11-22 20:21:14'),(343,5,27.80,'2026-11-22 20:21:24'),(344,6,95.00,'2026-11-22 20:21:24'),(345,7,2.60,'2026-11-22 20:21:24'),(346,8,98.00,'2026-11-22 20:21:24'),(347,5,27.70,'2026-11-22 20:21:34'),(348,6,95.00,'2026-11-22 20:21:34'),(349,7,2.60,'2026-11-22 20:21:34'),(350,8,98.00,'2026-11-22 20:21:34'),(351,5,27.80,'2026-11-22 20:21:44'),(352,6,95.00,'2026-11-22 20:21:44'),(353,7,2.60,'2026-11-22 20:21:44'),(354,8,98.00,'2026-11-22 20:21:44'),(355,5,27.80,'2026-11-22 20:21:54'),(356,6,95.00,'2026-11-22 20:21:54'),(357,7,2.60,'2026-11-22 20:21:54'),(358,8,98.00,'2026-11-22 20:21:54'),(359,1,26.20,'2026-11-24 00:01:10'),(360,2,83.00,'2026-11-24 00:01:10'),(361,3,1.80,'2026-11-24 00:01:10'),(362,4,72.00,'2026-11-24 00:01:10'),(363,13,26.40,'2026-11-24 01:05:46'),(364,14,84.00,'2026-11-24 01:05:46'),(365,15,1.80,'2026-11-24 01:05:46'),(366,16,72.00,'2026-11-24 01:05:46'),(367,13,26.10,'2026-11-24 01:06:02'),(368,14,85.00,'2026-11-24 01:06:02'),(369,15,1.90,'2026-11-24 01:06:02'),(370,16,72.00,'2026-11-24 01:06:02'),(371,13,26.00,'2026-11-24 01:06:12'),(372,14,86.00,'2026-11-24 01:06:12'),(373,15,2.00,'2026-11-24 01:06:12'),(374,16,72.00,'2026-11-24 01:06:12');
/*!40000 ALTER TABLE `medicion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patron_ia`
--

DROP TABLE IF EXISTS `patron_ia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patron_ia` (
  `id_patron` int NOT NULL AUTO_INCREMENT,
  `descripcion_peligro` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `nivel_riesgo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_deteccion` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_patron`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patron_ia`
--

LOCK TABLES `patron_ia` WRITE;
/*!40000 ALTER TABLE `patron_ia` DISABLE KEYS */;
/*!40000 ALTER TABLE `patron_ia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pecera`
--

DROP TABLE IF EXISTS `pecera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pecera` (
  `id_pecera` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int NOT NULL,
  `nombre_pecera` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `capacidad_litros` decimal(8,2) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_pecera`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `pecera_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pecera`
--

LOCK TABLES `pecera` WRITE;
/*!40000 ALTER TABLE `pecera` DISABLE KEYS */;
INSERT INTO `pecera` VALUES (1,1,'Arrecife Azul',60.00,'2026-11-22 19:31:48'),(2,2,'polla',20.00,'2026-11-22 20:08:06'),(3,3,'hghghg',20.00,'2026-11-22 20:12:26'),(4,4,'Lucia',200.00,'2026-11-24 01:05:46');
/*!40000 ALTER TABLE `pecera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `nombre_rol` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_rol`),
  UNIQUE KEY `nombre_rol` (`nombre_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Administrador','Acceso total y pruebas del sistema'),(2,'Usuario','Propietario de pecera');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sensor`
--

DROP TABLE IF EXISTS `sensor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sensor` (
  `id_sensor` int NOT NULL AUTO_INCREMENT,
  `id_pecera` int NOT NULL,
  `tipo_medicion` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unidad_medida` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'Activo',
  PRIMARY KEY (`id_sensor`),
  KEY `id_pecera` (`id_pecera`),
  CONSTRAINT `sensor_ibfk_1` FOREIGN KEY (`id_pecera`) REFERENCES `pecera` (`id_pecera`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sensor`
--

LOCK TABLES `sensor` WRITE;
/*!40000 ALTER TABLE `sensor` DISABLE KEYS */;
INSERT INTO `sensor` VALUES (1,1,'Temperatura','°C','Activo'),(2,1,'Nivel de agua','%','Activo'),(3,1,'Turbidez','NTU','Activo'),(4,1,'Alimento','%','Activo'),(5,2,'Temperatura','°C','Activo'),(6,2,'Nivel de agua','%','Activo'),(7,2,'Turbidez','NTU','Activo'),(8,2,'Alimento','%','Activo'),(9,3,'Temperatura','°C','Activo'),(10,3,'Nivel de agua','%','Activo'),(11,3,'Turbidez','NTU','Activo'),(12,3,'Alimento','%','Activo'),(13,4,'Temperatura','°C','Activo'),(14,4,'Nivel de agua','%','Activo'),(15,4,'Turbidez','NTU','Activo'),(16,4,'Alimento','%','Activo');
/*!40000 ALTER TABLE `sensor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `id_rol` int NOT NULL,
  `nombre_completo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `correo_electronico` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contrasena` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'Activo',
  `fecha_registro` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `correo_electronico` (`correo_electronico`),
  KEY `id_rol` (`id_rol`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,1,'Marina López','marina@email.com','$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','Activo','2026-11-22 19:31:48'),(2,2,'juan','juan_polla@gmail.com','$2y$12$7onk0crRu3A5C9fncnBAHu7IEsghl0e2/T7XEJ3qX9cVKEGScMitO','Activo','2026-11-22 20:08:06'),(3,2,'danna','dannarussi72@gmail.com','$2y$12$aH4wN8qL8MyZ/cY9ogJ62uFzLKhZPZvyy/VZtZ5TzCynI5O7GX8Tm','Activo','2026-11-22 20:12:26'),(4,2,'Olga','olgalucia37@gmail.com','$2y$12$qJxUQl6mEr4AqL/Tk.KyPeeVjSXD1eIo3Alzupmfg8ErZ0xBQ2B5m','Activo','2026-11-24 01:05:46');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'pecezuelos_db'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_actualizar_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizar_usuario`(
    IN p_id_usuario INT,
    IN p_id_rol INT,
    IN p_nombre VARCHAR(100),
    IN p_correo VARCHAR(100),
    IN p_estado VARCHAR(20)
)
BEGIN
    UPDATE usuario 
    SET id_rol = p_id_rol,
        nombre_completo = p_nombre,
        correo_electronico = p_correo,
        estado = p_estado
    WHERE id_usuario = p_id_usuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_consultar_estado_peceras_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_consultar_estado_peceras_usuario`(
    IN p_id_usuario INT
)
BEGIN
    SELECT 
        u.nombre_completo AS propietario,
        p.nombre_pecera,
        s.tipo_medicion AS sensor,
        m.valor_registrado AS valor,
        s.unidad_medida AS unidad,
        m.fecha_hora AS fecha_medicion
    FROM usuario u
    INNER JOIN pecera p ON u.id_usuario = p.id_usuario
    INNER JOIN sensor s ON p.id_pecera = s.id_pecera
    INNER JOIN medicion m ON s.id_sensor = m.id_sensor
    WHERE u.id_usuario = p_id_usuario
    ORDER BY p.nombre_pecera, m.fecha_hora DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_eliminar_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_eliminar_usuario`(
    IN p_id_usuario INT
)
BEGIN
    DELETE FROM usuario WHERE id_usuario = p_id_usuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insertar_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insertar_usuario`(
    IN p_id_rol INT,
    IN p_nombre VARCHAR(100),
    IN p_correo VARCHAR(100),
    IN p_contrasena VARCHAR(255)
)
BEGIN
    INSERT INTO usuario (id_rol, nombre_completo, correo_electronico, contrasena)
    VALUES (p_id_rol, p_nombre, p_correo, p_contrasena);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_registrar_medicion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_registrar_medicion`(
    IN p_id_sensor INT,
    IN p_valor DECIMAL(10,2)
)
BEGIN
    DECLARE v_id_medicion INT;
    INSERT INTO medicion (id_sensor, valor_registrado) VALUES (p_id_sensor, p_valor);
    SET v_id_medicion = LAST_INSERT_ID();
    IF p_valor > 40.00 THEN
        INSERT INTO alerta (id_medicion, tipo_alerta, descripcion)
        VALUES (v_id_medicion, 'CRÍTICA', 'Valor inusualmente alto detectado por el sensor.');
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-11-24 15:27:55
