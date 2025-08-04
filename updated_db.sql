-- MySQL dump 10.13  Distrib 8.0.25, for macos11 (x86_64)
--
-- Host: 127.0.0.1    Database: jakaja_db
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cow_sales`
--

DROP TABLE IF EXISTS `cow_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cow_sales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cow_id` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `quantity` varchar(255) NOT NULL,
  `unit_price` varchar(255) NOT NULL,
  `sales_date` date DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `cow_id` (`cow_id`),
  KEY `customer_id` (`customer_id`),
  KEY `user_id` (`user_id`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `cow_sales_ibfk_1` FOREIGN KEY (`cow_id`) REFERENCES `cows` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cow_sales_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cow_sales_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `cow_sales_ibfk_4` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cow_sales`
--

LOCK TABLES `cow_sales` WRITE;
/*!40000 ALTER TABLE `cow_sales` DISABLE KEYS */;
INSERT INTO `cow_sales` VALUES (1,1,2,'1','800000','2025-08-04',1,NULL,'2025-08-04 07:28:41','2025-08-04 07:28:41');
/*!40000 ALTER TABLE `cow_sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cows`
--

DROP TABLE IF EXISTS `cows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cows` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `ear_tag` varchar(255) NOT NULL,
  `date_of_birth` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `breed` varchar(255) NOT NULL,
  `herd` varchar(255) NOT NULL,
  `from_location` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `pasture_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `given_birth` varchar(255) DEFAULT NULL,
  `male_type` varchar(255) DEFAULT NULL,
  `mother_ear_tag` varchar(255) DEFAULT NULL,
  `father_ear_tag` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pasture_id` (`pasture_id`),
  KEY `user_id` (`user_id`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `cows_ibfk_1` FOREIGN KEY (`pasture_id`) REFERENCES `pastures` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `cows_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `cows_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cows`
--

LOCK TABLES `cows` WRITE;
/*!40000 ALTER TABLE `cows` DISABLE KEYS */;
INSERT INTO `cows` VALUES (1,'X','199106','2025-01-30','Female','Holstein','from_farm','','','uploads\\cows\\1749129686295-955639665.jpeg','1',2,1,1,'2025-05-27 13:10:03','2025-08-04 07:28:41','1',NULL,NULL,NULL),(2,'X','2004801','2024-11-13','Female','Jersey','from_farm','','','uploads\\cows\\1749129871480-697219708.jpeg','1',2,1,1,'2025-05-27 13:56:56','2025-06-06 11:28:23',NULL,NULL,NULL,NULL),(4,'X','199105','2024-12-14','Female','Jersey','from_farm','','','uploads\\cows\\1749129985679-647723661.jpeg','1',2,1,1,'2025-05-27 18:12:09','2025-06-06 11:28:37',NULL,NULL,NULL,NULL),(5,'X','2137070','2025-04-01','Female','Jersey','from_farm','','','uploads\\cows\\1749130066836-855908728.jpeg','1',2,1,1,'2025-05-27 18:48:49','2025-06-06 11:28:49',NULL,NULL,NULL,NULL),(6,'X','2076201','2025-04-25','Male','Jersey','from_farm','','','uploads\\cows\\1749130122792-320250772.jpeg','1',2,1,1,'2025-05-27 19:02:22','2025-06-09 10:13:16',NULL,NULL,NULL,NULL),(7,'X','2076202','2025-04-24','Male','Jersey','from_farm','','','uploads\\cows\\1749130240847-176590878.jpeg','1',2,1,1,'2025-06-02 08:27:50','2025-06-09 10:13:25',NULL,NULL,NULL,NULL),(8,'Igikwerere','0583368','2022-04-01','Female','Jersey','from_outside','Mutangana','','uploads\\cows\\1749135035494-732616519.jpeg','1',2,1,1,'2025-06-05 13:55:31','2025-06-06 11:23:08',NULL,NULL,NULL,NULL),(9,'Rudasumbwa','0996973','2022-05-04','Female','Jersey','from_outside','Mutangana','','uploads\\cows\\1749135071072-721430719.jpeg','1',2,1,1,'2025-06-05 13:57:07','2025-06-06 11:23:21',NULL,NULL,NULL,NULL),(10,'Indinganire','1079045','2022-05-04','Female','Jersey','from_outside','Mutangana','','uploads\\cows\\1749136379936-655441584.jpeg','1',2,1,1,'2025-06-05 13:58:27','2025-06-06 11:23:34',NULL,NULL,NULL,NULL),(11,'Runigampunzi','1484436','2022-05-04','Female','Jersey','from_outside','Mutangana','','uploads\\cows\\1749135704577-519426102.jpeg','1',2,1,1,'2025-06-05 14:00:12','2025-06-09 10:42:01',NULL,NULL,NULL,NULL),(12,'Intarutwa','2092248','2022-03-04','Female','Jersey','from_outside','Mutangana','','uploads\\cows\\1749134994662-513578134.jpeg','1',2,1,1,'2025-06-05 14:01:13','2025-06-06 11:24:04',NULL,NULL,NULL,NULL),(13,'Imfuranzima','1498854','2022-02-01','Female','Jersey','from_outside','Asiimwe','','uploads\\cows\\1749134943475-952700501.jpeg','1',2,1,1,'2025-06-05 14:02:32','2025-06-09 12:09:32',NULL,NULL,NULL,NULL),(14,'Rubyirukana','0375589','2022-03-02','Female','Jersey','from_outside','Asiimwe','','uploads\\cows\\1749135466619-627163861.jpeg','1',2,1,1,'2025-06-05 14:03:26','2025-06-09 12:08:47',NULL,NULL,NULL,NULL),(15,'Rugango','0250637','2022-04-01','Female','Jersey','from_outside','Asiimwe','','uploads\\cows\\1749136658762-354677376.jpeg','1',2,1,1,'2025-06-05 14:04:49','2025-06-09 12:08:29',NULL,NULL,NULL,NULL),(16,'Inkusi','0925543','2022-03-02','Female','Jersey','from_outside','Asiimwe','','uploads\\cows\\1749134914381-832061370.jpeg','1',2,1,1,'2025-06-05 14:07:15','2025-06-09 12:09:45',NULL,NULL,NULL,NULL),(18,'Bull','0330464','2022-03-14','Male','Jersey','from_outside','Mutangana','','uploads\\cows\\1749136720979-207506869.jpeg','1',2,1,1,'2025-06-05 14:10:34','2025-07-30 10:51:17',NULL,'Bull',NULL,NULL),(19,'X','1079013','2023-01-09','Female','Holstein','from_outside','Mutangana','',NULL,'1',2,1,NULL,'2025-06-09 11:33:10','2025-06-09 11:33:10','1',NULL,NULL,NULL),(20,'X','1079011','2023-01-09','Female','Holstein','from_outside','Mutangana','',NULL,'1',2,1,NULL,'2025-06-09 11:34:21','2025-06-09 11:34:21','1',NULL,NULL,NULL),(21,'X','1079012','2023-01-19','Female','Holstein','from_outside','Mutangana','',NULL,'1',2,1,NULL,'2025-06-09 11:35:15','2025-06-09 11:35:15','1',NULL,NULL,NULL),(22,'X','1079015','2023-01-20','Female','Holstein','from_outside','Mutangana','',NULL,'1',2,1,NULL,'2025-06-09 11:35:44','2025-06-09 11:35:44','1',NULL,NULL,NULL),(23,'Ruhimbaza','2199727','2022-06-12','Female','Holstein','from_outside','Mutangana farm','','uploads/cows/1751875718410-431370193.jpeg','1',2,5,NULL,'2025-07-07 08:08:38','2025-07-07 08:08:38','1','',NULL,NULL),(24,'Rugirabuntu','2199746','2022-05-13','Female','Holstein','from_outside','Mutangana farm','','uploads/cows/1751875846884-424524604.jpeg','1',2,5,NULL,'2025-07-07 08:10:46','2025-07-07 08:10:46','0','',NULL,NULL),(25,'Imbabazi','2199736','2022-02-05','Female','Holstein','from_outside','Mutangana farm','','uploads/cows/1751876342777-832164236.jpeg','1',2,5,NULL,'2025-07-07 08:19:02','2025-07-07 08:19:02','0','',NULL,NULL),(26,'x','2199710','2025-05-11','Female','Holstein','from_farm','','','uploads/cows/1751879465231-76811193.jpeg','1',2,5,NULL,'2025-07-07 09:11:05','2025-07-07 09:11:05','0','',NULL,NULL);
/*!40000 ALTER TABLE `cows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `customers_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (2,'Thomas','Gayflor','0785573286','tg6471jr@gmail.com',1,NULL,'2025-08-03 20:18:36','2025-08-03 20:18:36');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `daily_milk_records`
--

DROP TABLE IF EXISTS `daily_milk_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daily_milk_records` (
  `id` int NOT NULL AUTO_INCREMENT,
  `morning_qty` varchar(255) DEFAULT NULL,
  `evening_qty` varchar(255) DEFAULT NULL,
  `record_date` varchar(255) NOT NULL,
  `user_id` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `daily_milk_records_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `daily_milk_records_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_milk_records`
--

LOCK TABLES `daily_milk_records` WRITE;
/*!40000 ALTER TABLE `daily_milk_records` DISABLE KEYS */;
INSERT INTO `daily_milk_records` VALUES (4,'67','33','2025-06-01',1,1,'2025-07-07 09:48:43','2025-07-07 14:29:49'),(6,'59','38','2025-06-02',1,NULL,'2025-07-07 14:30:31','2025-07-07 14:30:31'),(7,'61','33','2025-06-03',1,NULL,'2025-07-07 14:31:10','2025-07-07 14:31:10'),(8,'57','29','2025-06-04',1,NULL,'2025-07-07 14:32:04','2025-07-07 14:32:04'),(9,'58','29','2025-06-05',1,NULL,'2025-07-07 14:32:35','2025-07-07 14:32:35'),(10,'50','28','2025-06-06',1,NULL,'2025-07-07 14:33:21','2025-07-07 14:33:21'),(11,'59','29','2025-06-07',1,NULL,'2025-07-07 14:33:53','2025-07-07 14:33:53'),(12,'57','30','2025-06-08',1,NULL,'2025-07-07 14:44:03','2025-07-07 14:44:03'),(13,'58','30','2025-06-09',1,NULL,'2025-07-07 14:44:40','2025-07-07 14:44:40'),(14,'61','36','2025-06-10',1,NULL,'2025-07-07 14:45:24','2025-07-07 14:45:24'),(15,'64','34','2025-06-11',1,NULL,'2025-07-07 14:45:54','2025-07-07 14:45:54'),(16,'50','32','2025-06-12',1,NULL,'2025-07-07 14:54:31','2025-07-07 14:54:31'),(17,'50','29','2025-06-13',1,NULL,'2025-07-07 14:55:08','2025-07-07 14:55:08'),(18,'55','37','2025-06-14',1,NULL,'2025-07-07 14:56:01','2025-07-07 14:56:01'),(19,'55','33','2025-06-15',1,NULL,'2025-07-07 14:56:33','2025-07-07 14:56:33'),(20,'68','32','2025-06-16',1,NULL,'2025-07-07 14:57:09','2025-07-07 14:57:09'),(21,'65','34','2025-06-17',1,NULL,'2025-07-07 14:57:40','2025-07-07 14:57:40'),(22,'61','28','2025-06-18',1,NULL,'2025-07-07 14:58:16','2025-07-07 14:58:16'),(23,'59','29','2025-06-19',1,NULL,'2025-07-07 14:58:46','2025-07-07 14:58:46'),(24,'55','26','2025-06-20',1,NULL,'2025-07-07 14:59:26','2025-07-07 14:59:26'),(25,'56','28','2025-06-21',1,NULL,'2025-07-07 15:00:00','2025-07-07 15:00:00'),(26,'57','33','2025-06-22',1,NULL,'2025-07-07 15:00:35','2025-07-07 15:00:35'),(27,'50','40','2025-06-23',1,NULL,'2025-07-07 15:01:09','2025-07-07 15:01:09'),(28,'50','40','2025-06-24',1,NULL,'2025-07-07 15:02:06','2025-07-07 15:02:06'),(29,'52','40','2025-06-25',1,NULL,'2025-07-07 15:02:43','2025-07-07 15:02:43'),(30,'52','31','2025-06-26',1,NULL,'2025-07-09 08:39:28','2025-07-09 08:39:28'),(31,'50','31','2025-06-27',1,NULL,'2025-07-09 08:40:01','2025-07-09 08:40:01'),(32,'50','27','2025-06-28',1,NULL,'2025-07-09 08:40:26','2025-07-09 08:40:26'),(33,'51','29','2025-06-29',1,NULL,'2025-07-09 08:40:55','2025-07-09 08:40:55'),(34,'50','','2025-06-30',1,NULL,'2025-07-09 08:41:22','2025-07-09 08:41:22'),(35,'50','25','2025-07-01',1,NULL,'2025-07-09 08:42:47','2025-07-09 08:42:47'),(36,'45','23','2025-07-02',1,NULL,'2025-07-09 08:45:20','2025-07-09 08:45:20'),(37,'30','20','2025-07-03',1,NULL,'2025-07-09 08:46:33','2025-07-09 08:46:33'),(38,'33','20','2025-07-04',1,NULL,'2025-07-09 08:47:02','2025-07-09 08:47:02'),(39,'32','15','2025-07-05',1,NULL,'2025-07-09 08:47:33','2025-07-09 08:47:33'),(40,'33','','2025-07-06',1,NULL,'2025-07-09 08:47:56','2025-07-09 08:47:56'),(41,'30','19','2025-07-07',1,NULL,'2025-07-09 08:48:20','2025-07-09 08:48:20'),(42,'31','','2025-07-08',1,NULL,'2025-07-09 08:48:49','2025-07-09 08:48:49'),(43,'15','0','2025-01-01',1,NULL,'2025-07-10 10:40:03','2025-07-10 10:40:03'),(44,'15','0','2025-01-02',1,NULL,'2025-07-10 10:40:48','2025-07-10 10:40:48'),(45,'15','0','2025-01-03',1,NULL,'2025-07-10 10:41:35','2025-07-10 10:41:35'),(46,'15','0','2025-01-04',1,NULL,'2025-07-10 10:42:06','2025-07-10 10:42:06'),(47,'10','0','2025-01-05',1,NULL,'2025-07-10 10:42:41','2025-07-10 10:42:41'),(48,'15','0','2025-01-06',1,NULL,'2025-07-10 10:45:03','2025-07-10 10:45:03'),(49,'15','0','2025-01-07',1,NULL,'2025-07-10 10:46:07','2025-07-10 10:46:07'),(50,'15','0','2025-01-08',1,NULL,'2025-07-10 12:37:48','2025-07-10 12:37:48'),(51,'15','0','2025-01-09',1,NULL,'2025-07-10 12:38:21','2025-07-10 12:38:21'),(52,'15','0','2025-01-10',1,NULL,'2025-07-10 12:38:51','2025-07-10 12:38:51'),(53,'20','0','2025-01-11',1,NULL,'2025-07-10 12:39:28','2025-07-10 12:39:28'),(54,'20','0','2025-01-12',1,NULL,'2025-07-10 12:40:12','2025-07-10 12:40:12'),(55,'20','0','2025-01-13',1,NULL,'2025-07-10 12:40:41','2025-07-10 12:40:41'),(56,'14','0','2025-01-14',1,NULL,'2025-07-10 12:42:27','2025-07-10 12:42:27'),(57,'15','0','2025-01-15',1,NULL,'2025-07-10 12:43:07','2025-07-10 12:43:07'),(58,'15','0','2025-01-16',1,NULL,'2025-07-10 12:43:35','2025-07-10 12:43:35'),(59,'13','0','2025-01-17',1,NULL,'2025-07-10 12:44:11','2025-07-10 12:44:11'),(60,'10','0','2025-01-18',1,NULL,'2025-07-10 12:45:03','2025-07-10 12:45:03'),(61,'15','0','2025-01-19',1,NULL,'2025-07-10 12:45:38','2025-07-10 12:45:38'),(62,'15','0','2025-01-20',1,NULL,'2025-07-10 12:46:10','2025-07-10 12:46:10'),(63,'15','0','2025-01-21',1,NULL,'2025-07-10 12:46:46','2025-07-10 12:46:46'),(64,'15','0','2025-01-22',1,NULL,'2025-07-10 12:47:13','2025-07-10 12:47:13'),(65,'15','0','2025-01-23',1,NULL,'2025-07-10 12:47:42','2025-07-10 12:47:42'),(66,'15','0','2025-01-24',1,NULL,'2025-07-10 12:48:05','2025-07-10 12:48:05'),(67,'10','0','2025-01-25',1,NULL,'2025-07-10 12:48:31','2025-07-10 12:48:31'),(68,'15','0','2025-01-26',1,NULL,'2025-07-10 12:48:57','2025-07-10 12:48:57'),(69,'15','0','2025-01-27',1,NULL,'2025-07-10 12:49:25','2025-07-10 12:49:25'),(70,'20','0','2025-01-28',1,NULL,'2025-07-10 12:49:55','2025-07-10 12:49:55'),(71,'20','0','2025-01-29',1,NULL,'2025-07-10 12:50:24','2025-07-10 12:50:24'),(72,'20','0','2025-01-30',1,NULL,'2025-07-10 12:50:48','2025-07-10 12:50:48'),(73,'20','0','2025-01-31',1,NULL,'2025-07-10 12:51:21','2025-07-10 12:51:21'),(74,'12','0','2025-02-01',1,NULL,'2025-07-10 13:07:38','2025-07-10 13:07:38'),(75,'19','0','2025-02-02',1,NULL,'2025-07-10 13:08:08','2025-07-10 13:08:08'),(76,'18','0','2025-02-03',1,NULL,'2025-07-10 13:08:35','2025-07-10 13:08:35'),(77,'18','0','2025-02-04',1,NULL,'2025-07-10 13:09:00','2025-07-10 13:09:00'),(78,'18','0','2025-02-05',1,NULL,'2025-07-10 13:10:38','2025-07-10 13:10:38'),(79,'19','0','2025-02-06',1,NULL,'2025-07-10 13:11:02','2025-07-10 13:11:02'),(80,'19','0','2025-02-07',1,NULL,'2025-07-10 13:11:27','2025-07-10 13:11:27'),(81,'19','0','2025-02-08',1,1,'2025-07-10 13:11:55','2025-07-10 13:12:39'),(82,'19','0','2025-02-09',1,NULL,'2025-07-10 13:13:29','2025-07-10 13:13:29'),(83,'10','0','2025-02-10',1,NULL,'2025-07-10 13:13:49','2025-07-10 13:13:49'),(84,'20','0','2025-02-11',1,NULL,'2025-07-10 13:14:14','2025-07-10 13:14:14'),(85,'20','10','2025-02-12',1,1,'2025-07-10 13:14:37','2025-07-10 13:16:49'),(86,'20','10','2025-02-13',1,1,'2025-07-10 13:15:02','2025-07-10 13:17:11'),(87,'20','10','2025-02-14',1,1,'2025-07-10 13:15:35','2025-07-10 13:17:32'),(88,'25','10','2025-02-15',1,NULL,'2025-07-10 13:18:36','2025-07-10 13:18:36'),(89,'24','10','2025-02-16',1,NULL,'2025-07-10 13:19:18','2025-07-10 13:19:18'),(90,'20','0','2025-02-17',1,NULL,'2025-07-10 13:19:50','2025-07-10 13:19:50'),(91,'20','0','2025-02-18',1,NULL,'2025-07-10 13:20:22','2025-07-10 13:20:22'),(92,'20','0','2025-02-19',1,NULL,'2025-07-10 13:20:51','2025-07-10 13:20:51'),(93,'20','0','2025-02-20',1,NULL,'2025-07-10 13:21:33','2025-07-10 13:21:33'),(94,'20','0','2025-02-21',1,NULL,'2025-07-10 13:22:04','2025-07-10 13:22:04'),(95,'20','10','2025-02-22',1,NULL,'2025-07-10 13:23:21','2025-07-10 13:23:21'),(96,'20','10','2025-02-23',1,NULL,'2025-07-10 13:23:48','2025-07-10 13:23:48'),(97,'20','10','2025-02-24',1,NULL,'2025-07-10 13:24:26','2025-07-10 13:24:26'),(98,'20','5','2025-02-25',1,NULL,'2025-07-10 13:25:21','2025-07-10 13:25:21'),(99,'20','5','2025-02-26',1,NULL,'2025-07-10 13:26:03','2025-07-10 13:26:03'),(100,'20','10','2025-02-27',1,NULL,'2025-07-10 13:26:30','2025-07-10 13:26:30'),(101,'20','10','2025-02-28',1,NULL,'2025-07-10 13:27:23','2025-07-10 13:27:23'),(102,'20','10','2025-03-01',1,NULL,'2025-07-11 07:56:30','2025-07-11 07:56:30'),(103,'20','10','2025-03-02',1,NULL,'2025-07-11 07:56:58','2025-07-11 07:56:58'),(104,'20','10','2025-03-03',1,NULL,'2025-07-11 08:06:09','2025-07-11 08:06:09'),(105,'20','10','2025-03-04',1,NULL,'2025-07-11 08:06:45','2025-07-11 08:06:45'),(106,'20','10','2025-03-05',1,NULL,'2025-07-11 08:07:08','2025-07-11 08:07:08'),(107,'20','5','2025-03-06',1,NULL,'2025-07-11 08:07:33','2025-07-11 08:07:33'),(108,'20','10','2025-03-07',1,NULL,'2025-07-11 08:07:57','2025-07-11 08:07:57'),(109,'20','5','2025-03-08',1,NULL,'2025-07-11 08:08:22','2025-07-11 08:08:22'),(110,'20','10','2025-03-09',1,NULL,'2025-07-11 08:09:00','2025-07-11 08:09:00'),(111,'20','10','2025-03-10',1,NULL,'2025-07-11 08:09:31','2025-07-11 08:09:31'),(112,'20','10','2025-03-11',1,NULL,'2025-07-11 08:09:59','2025-07-11 08:09:59'),(113,'20','10','2025-03-12',1,NULL,'2025-07-11 08:10:18','2025-07-11 08:10:18'),(114,'20','5','2025-03-13',1,NULL,'2025-07-11 08:10:57','2025-07-11 08:10:57'),(115,'20','10','2025-03-14',1,NULL,'2025-07-11 08:11:38','2025-07-11 08:11:38'),(116,'50','30','2025-03-15',1,NULL,'2025-07-11 08:12:11','2025-07-11 08:12:11'),(117,'50','30','2025-03-16',1,NULL,'2025-07-11 08:12:37','2025-07-11 08:12:37'),(118,'60','40','2025-03-17',1,NULL,'2025-07-11 08:13:00','2025-07-11 08:13:00'),(119,'65','30','2025-03-18',1,NULL,'2025-07-11 08:13:31','2025-07-11 08:13:31'),(120,'63','40','2025-03-19',1,NULL,'2025-07-11 08:14:00','2025-07-11 08:14:00'),(121,'62','40','2025-03-20',1,NULL,'2025-07-11 08:14:34','2025-07-11 08:14:34'),(122,'64','46','2025-03-21',1,NULL,'2025-07-11 08:15:15','2025-07-11 08:15:15'),(123,'63','34','2025-03-22',1,NULL,'2025-07-11 08:15:45','2025-07-11 08:15:45'),(124,'67','40','2025-03-23',1,NULL,'2025-07-11 08:16:16','2025-07-11 08:16:16'),(125,'66','40','2025-03-24',1,NULL,'2025-07-11 08:17:02','2025-07-11 08:17:02'),(126,'66','40','2025-03-25',1,NULL,'2025-07-11 08:17:36','2025-07-11 08:17:36'),(127,'63','40','2025-03-26',1,NULL,'2025-07-11 08:18:05','2025-07-11 08:18:05'),(128,'59','40','2025-03-27',1,NULL,'2025-07-11 08:18:33','2025-07-11 08:18:33'),(129,'58','40','2025-03-28',1,NULL,'2025-07-11 08:19:12','2025-07-11 08:19:12'),(130,'62','40','2025-03-29',1,NULL,'2025-07-11 08:19:41','2025-07-11 08:19:41'),(131,'63','40','2025-03-30',1,NULL,'2025-07-11 08:20:19','2025-07-11 08:20:19'),(132,'64','35','2025-03-31',1,NULL,'2025-07-11 08:20:50','2025-07-11 08:20:50'),(133,'61','40','2025-04-01',1,NULL,'2025-07-11 08:49:31','2025-07-11 08:49:31'),(134,'61','28','2025-04-02',1,NULL,'2025-07-11 08:50:02','2025-07-11 08:50:02'),(135,'61','31','2025-04-03',1,NULL,'2025-07-11 08:50:33','2025-07-11 08:50:33'),(136,'60','39','2025-04-04',1,NULL,'2025-07-11 08:51:05','2025-07-11 08:51:05'),(137,'61','35','2025-04-05',1,NULL,'2025-07-11 08:51:33','2025-07-11 08:51:33'),(138,'59','42','2025-04-06',1,NULL,'2025-07-11 08:52:02','2025-07-11 08:52:02'),(139,'64','35','2025-04-07',1,NULL,'2025-07-11 08:52:27','2025-07-11 08:52:27'),(140,'65','43','2025-04-08',1,NULL,'2025-07-11 08:53:00','2025-07-11 08:53:00'),(141,'62','29','2025-04-09',1,NULL,'2025-07-11 08:53:29','2025-07-11 08:53:29'),(142,'58','34','2025-04-10',1,NULL,'2025-07-11 08:53:55','2025-07-11 08:53:55'),(143,'63','40','2025-04-11',1,NULL,'2025-07-11 08:54:30','2025-07-11 08:54:30'),(144,'61','37','2025-04-12',1,NULL,'2025-07-11 08:54:56','2025-07-11 08:54:56'),(145,'58','30','2025-04-13',1,NULL,'2025-07-11 08:55:30','2025-07-11 08:55:30'),(146,'57','20','2025-04-14',1,NULL,'2025-07-11 08:56:00','2025-07-11 08:56:00'),(147,'61','24','2025-04-15',1,NULL,'2025-07-11 08:56:32','2025-07-11 08:56:32'),(148,'65','40','2025-04-16',1,NULL,'2025-07-11 08:57:05','2025-07-11 08:57:05'),(149,'65','40','2025-04-17',1,NULL,'2025-07-11 08:57:39','2025-07-11 08:57:39'),(150,'59','31','2025-04-18',1,NULL,'2025-07-11 08:58:18','2025-07-11 08:58:18'),(151,'60','30','2025-04-19',1,NULL,'2025-07-11 08:58:46','2025-07-11 08:58:46'),(152,'56','40','2025-04-21',1,NULL,'2025-07-11 08:59:23','2025-07-11 08:59:23'),(153,'58','36','2025-04-22',1,NULL,'2025-07-11 08:59:53','2025-07-11 08:59:53'),(154,'59','36','2025-04-23',1,NULL,'2025-07-11 09:00:22','2025-07-11 09:00:22'),(155,'60','25','2025-04-24',1,NULL,'2025-07-11 09:00:51','2025-07-11 09:00:51'),(156,'60','40','2025-04-25',1,NULL,'2025-07-11 09:01:28','2025-07-11 09:01:28'),(157,'65','0','2025-04-26',1,NULL,'2025-07-11 09:01:52','2025-07-11 09:01:52'),(158,'67','0','2025-04-27',1,NULL,'2025-07-11 09:02:18','2025-07-11 09:02:18'),(159,'0','0','2025-04-28',1,NULL,'2025-07-11 09:02:43','2025-07-11 09:02:43'),(160,'0','0','2025-04-29',1,NULL,'2025-07-11 09:03:05','2025-07-11 09:03:05'),(161,'0','0','2025-04-30',1,NULL,'2025-07-11 09:03:31','2025-07-11 09:03:31'),(162,'64','35','2025-05-01',1,NULL,'2025-07-14 09:09:23','2025-07-14 09:09:23'),(163,'56','48','2025-05-02',1,NULL,'2025-07-14 09:10:03','2025-07-14 09:10:03'),(164,'65','33','2025-05-03',1,NULL,'2025-07-14 09:11:21','2025-07-14 09:11:21'),(165,'71','31','2025-05-04',1,NULL,'2025-07-14 09:11:51','2025-07-14 09:11:51'),(166,'70','43','2025-05-05',1,NULL,'2025-07-14 09:12:20','2025-07-14 09:12:20'),(167,'66','36','2025-05-06',1,NULL,'2025-07-14 09:13:04','2025-07-14 09:13:04'),(168,'58','30','2025-05-07',1,NULL,'2025-07-14 09:13:37','2025-07-14 09:13:37'),(169,'58','34','2025-05-08',1,NULL,'2025-07-14 09:14:16','2025-07-14 09:14:16'),(170,'66','36','2025-05-09',1,NULL,'2025-07-14 09:14:49','2025-07-14 09:14:49'),(171,'60','33','2025-05-10',1,NULL,'2025-07-14 09:15:14','2025-07-14 09:15:14'),(172,'61','28','2025-05-11',1,NULL,'2025-07-14 09:15:52','2025-07-14 09:15:52'),(173,'60','40','2025-05-12',1,NULL,'2025-07-14 09:20:43','2025-07-14 09:20:43'),(174,'64','40','2025-05-13',1,NULL,'2025-07-14 09:21:18','2025-07-14 09:21:18'),(175,'65','41','2025-05-14',1,NULL,'2025-07-14 09:23:00','2025-07-14 09:23:00'),(176,'69','38','20025-05-15',1,NULL,'2025-07-14 09:23:38','2025-07-14 09:23:38'),(177,'64','40','2025-05-16',1,NULL,'2025-07-14 09:25:19','2025-07-14 09:25:19'),(178,'71','50','2025-05-17',1,NULL,'2025-07-14 09:26:07','2025-07-14 09:26:07'),(179,'80','50','2025-05-18',1,NULL,'2025-07-14 09:26:34','2025-07-14 09:26:34'),(180,'80','55','2025-05-19',1,NULL,'2025-07-14 09:27:12','2025-07-14 09:27:12'),(181,'81','52','2025-05-20',1,NULL,'2025-07-14 09:27:45','2025-07-14 09:27:45'),(182,'82','46','2025-05-21',1,NULL,'2025-07-14 09:28:19','2025-07-14 09:28:19'),(183,'41','50','2025-05-22',1,NULL,'2025-07-14 09:28:57','2025-07-14 09:28:57'),(184,'82','50','2025-05-23',1,NULL,'2025-07-14 09:30:12','2025-07-14 09:30:12'),(185,'78','50','2025-05-24',1,NULL,'2025-07-14 09:30:49','2025-07-14 09:30:49'),(186,'79','42','2025-05-25',1,NULL,'2025-07-14 09:31:17','2025-07-14 09:31:17'),(187,'80','50','2025-05-26',1,NULL,'2025-07-14 09:31:51','2025-07-14 09:31:51'),(188,'80','40','2025-05-27',1,NULL,'2025-07-14 09:33:40','2025-07-14 09:33:40'),(189,'0','0','2025-05-28',1,NULL,'2025-07-14 09:34:05','2025-07-14 09:34:05'),(190,'75','43','2025-05-29',1,NULL,'2025-07-14 09:34:37','2025-07-14 09:34:37'),(191,'66','36','2025-05-30',1,NULL,'2025-07-14 09:35:07','2025-07-14 09:35:07'),(192,'65','34','2025-05-31',1,NULL,'2025-07-14 09:35:42','2025-07-14 09:35:42'),(193,'35','0','2025-07-09',1,NULL,'2025-07-16 14:08:59','2025-07-16 14:08:59'),(194,'35','0','2025-07-10',1,NULL,'2025-07-16 14:09:32','2025-07-16 14:09:32'),(195,'39','16','2025-07-11',1,NULL,'2025-07-16 14:10:02','2025-07-16 14:10:02'),(196,'0','20','2025-07-12',1,NULL,'2025-07-16 14:10:28','2025-07-16 14:10:28'),(197,'33','0','2025-07-13',1,NULL,'2025-07-16 14:10:56','2025-07-16 14:10:56'),(198,'36','0','2025-07-14',1,NULL,'2025-07-16 14:11:22','2025-07-16 14:11:22'),(199,'40','0','2025-07-15',1,NULL,'2025-07-16 14:11:50','2025-07-16 14:11:50');
/*!40000 ALTER TABLE `daily_milk_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedings`
--

DROP TABLE IF EXISTS `feedings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pasture_id` int NOT NULL,
  `food_id` int NOT NULL,
  `quantity` varchar(255) DEFAULT NULL,
  `fed_date` date NOT NULL,
  `user_id` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `pasture_id` (`pasture_id`),
  KEY `food_id` (`food_id`),
  KEY `user_id` (`user_id`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `feedings_ibfk_1` FOREIGN KEY (`pasture_id`) REFERENCES `pastures` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `feedings_ibfk_2` FOREIGN KEY (`food_id`) REFERENCES `foods` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `feedings_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `feedings_ibfk_4` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedings`
--

LOCK TABLES `feedings` WRITE;
/*!40000 ALTER TABLE `feedings` DISABLE KEYS */;
INSERT INTO `feedings` VALUES (1,2,1,'123','2025-07-27',1,1,'2025-07-28 11:01:18','2025-07-28 11:15:41'),(2,2,1,'54','2025-07-28',1,NULL,'2025-07-28 11:15:31','2025-07-28 11:15:31'),(4,2,2,'12','2025-07-29',1,NULL,'2025-07-29 12:12:54','2025-07-29 12:12:54'),(5,2,3,'120','2025-08-04',1,NULL,'2025-08-04 08:48:27','2025-08-04 08:48:27');
/*!40000 ALTER TABLE `feedings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foods`
--

DROP TABLE IF EXISTS `foods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foods` (
  `id` int NOT NULL AUTO_INCREMENT,
  `food` varchar(255) NOT NULL,
  `quantity` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `foods_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `foods_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foods`
--

LOCK TABLES `foods` WRITE;
/*!40000 ALTER TABLE `foods` DISABLE KEYS */;
INSERT INTO `foods` VALUES (1,'Corn','700','Corn for cow feeding',1,1,'2025-07-28 10:49:44','2025-07-28 11:21:38'),(2,'Grass','120','',1,NULL,'2025-07-29 11:10:00','2025-07-29 11:10:00'),(3,'Potatoes','500','',1,NULL,'2025-08-04 08:47:52','2025-08-04 08:47:52');
/*!40000 ALTER TABLE `foods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maternities`
--

DROP TABLE IF EXISTS `maternities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maternities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cow_id` int NOT NULL,
  `bull_id` int DEFAULT NULL,
  `pregnancy_status` varchar(255) NOT NULL,
  `mating_date` date NOT NULL,
  `birth_date` date DEFAULT NULL,
  `calf_amount` varchar(255) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `cow_id` (`cow_id`),
  KEY `bull_id` (`bull_id`),
  KEY `user_id` (`user_id`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `maternities_ibfk_1` FOREIGN KEY (`cow_id`) REFERENCES `cows` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `maternities_ibfk_2` FOREIGN KEY (`bull_id`) REFERENCES `cows` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `maternities_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `maternities_ibfk_4` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maternities`
--

LOCK TABLES `maternities` WRITE;
/*!40000 ALTER TABLE `maternities` DISABLE KEYS */;
INSERT INTO `maternities` VALUES (2,1,18,'Pregnant','2025-08-03',NULL,NULL,1,1,'2025-08-03 12:33:24','2025-08-03 12:35:32');
/*!40000 ALTER TABLE `maternities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medications`
--

DROP TABLE IF EXISTS `medications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cow_id` int NOT NULL,
  `medication` varchar(255) NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `medication_date` date NOT NULL,
  `user_id` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `cow_id` (`cow_id`),
  KEY `user_id` (`user_id`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `medications_ibfk_1` FOREIGN KEY (`cow_id`) REFERENCES `cows` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `medications_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `medications_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medications`
--

LOCK TABLES `medications` WRITE;
/*!40000 ALTER TABLE `medications` DISABLE KEYS */;
INSERT INTO `medications` VALUES (4,2,'Pain injection','For pain','2025-07-06',1,NULL,'2025-07-07 10:49:09','2025-07-07 10:49:09'),(5,1,'Pain injection','For pain','2024-10-03',1,NULL,'2025-08-03 12:17:48','2025-08-03 12:17:48');
/*!40000 ALTER TABLE `medications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `milk_sales`
--

DROP TABLE IF EXISTS `milk_sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `milk_sales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `milk_record_id` int NOT NULL,
  `customer_id` int DEFAULT NULL,
  `quantity` varchar(255) NOT NULL,
  `unit_price` varchar(255) NOT NULL,
  `sales_date` date DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `milk_record_id` (`milk_record_id`),
  KEY `customer_id` (`customer_id`),
  KEY `user_id` (`user_id`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `milk_sales_ibfk_1` FOREIGN KEY (`milk_record_id`) REFERENCES `daily_milk_records` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `milk_sales_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `milk_sales_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `milk_sales_ibfk_4` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `milk_sales`
--

LOCK TABLES `milk_sales` WRITE;
/*!40000 ALTER TABLE `milk_sales` DISABLE KEYS */;
INSERT INTO `milk_sales` VALUES (1,4,2,'50','400','2025-08-04',1,1,'2025-08-04 05:42:17','2025-08-04 05:48:59');
/*!40000 ALTER TABLE `milk_sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pastures`
--

DROP TABLE IF EXISTS `pastures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pastures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pasture` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `updated_by` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `user_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `pastures_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pastures`
--

LOCK TABLES `pastures` WRITE;
/*!40000 ALTER TABLE `pastures` DISABLE KEYS */;
INSERT INTO `pastures` VALUES (1,'Kigabiro','Rwanda','Impeta','1','1',1,'2025-05-27 12:20:00','2025-06-09 10:26:49'),(2,'Rubona','Rwanda','Ibivunganyi','1','1',1,'2025-05-27 12:20:56','2025-06-09 10:26:20'),(4,'Kirorirwe / Masisi','DR Congo','Ibishababa','1','1',1,'2025-06-02 09:10:21','2025-06-09 10:27:33');
/*!40000 ALTER TABLE `pastures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `name_2` (`name`),
  UNIQUE KEY `name_3` (`name`),
  UNIQUE KEY `name_4` (`name`),
  UNIQUE KEY `name_5` (`name`),
  UNIQUE KEY `name_6` (`name`),
  UNIQUE KEY `name_7` (`name`),
  UNIQUE KEY `name_8` (`name`),
  UNIQUE KEY `name_9` (`name`),
  UNIQUE KEY `name_10` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

LOCK TABLES `permissions` WRITE;
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_permissions`
--

DROP TABLE IF EXISTS `role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_permissions` (
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `role_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`role_id`,`permission_id`),
  KEY `permission_id` (`permission_id`),
  CONSTRAINT `role_permissions_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_permissions_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_permissions`
--

LOCK TABLES `role_permissions` WRITE;
/*!40000 ALTER TABLE `role_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `name_2` (`name`),
  UNIQUE KEY `name_3` (`name`),
  UNIQUE KEY `name_4` (`name`),
  UNIQUE KEY `name_5` (`name`),
  UNIQUE KEY `name_6` (`name`),
  UNIQUE KEY `name_7` (`name`),
  UNIQUE KEY `name_8` (`name`),
  UNIQUE KEY `name_9` (`name`),
  UNIQUE KEY `name_10` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'superadmin','2025-05-18 15:50:49','2025-05-18 15:50:49');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SequelizeMeta`
--

DROP TABLE IF EXISTS `SequelizeMeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SequelizeMeta` (
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SequelizeMeta`
--

LOCK TABLES `SequelizeMeta` WRITE;
/*!40000 ALTER TABLE `SequelizeMeta` DISABLE KEYS */;
INSERT INTO `SequelizeMeta` VALUES ('20250518172640-create-pasture.js'),('20250527120855-create-cow.js'),('20250601164218-create-daily-milk-record.js'),('20250601234505-create-price-settings.js'),('20250609084930-create-feeding.js'),('20250701145012-create-feeding.js'),('20250701155251-create-medication.js'),('20250728082742-create-food.js'),('20250728094713-create-feeding.js'),('20250729122624-create-maternity.js'),('20250729124546-create-maternity.js'),('20250803121415-create-maternity.js'),('20250803172553-create-customer.js'),('20250803195157-create-customer.js'),('20250804045638-create-milk-sales.js'),('20250804064357-create-cow-sales.js');
/*!40000 ALTER TABLE `SequelizeMeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_roles` (
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `user_roles_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `user_roles_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES ('2025-05-18 15:50:49','2025-05-18 15:50:49',1,1),('2025-07-01 15:50:49','2025-07-01 15:50:49',2,1),('2025-07-01 15:50:49','2025-07-01 15:50:49',5,1),('2025-07-01 15:50:49','2025-07-01 15:50:49',6,1);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `other_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone_2` (`phone`),
  UNIQUE KEY `email_2` (`email`),
  UNIQUE KEY `phone_3` (`phone`),
  UNIQUE KEY `email_3` (`email`),
  UNIQUE KEY `phone_4` (`phone`),
  UNIQUE KEY `email_4` (`email`),
  UNIQUE KEY `phone_5` (`phone`),
  UNIQUE KEY `email_5` (`email`),
  UNIQUE KEY `phone_6` (`phone`),
  UNIQUE KEY `email_6` (`email`),
  UNIQUE KEY `phone_7` (`phone`),
  UNIQUE KEY `email_7` (`email`),
  UNIQUE KEY `phone_8` (`phone`),
  UNIQUE KEY `email_8` (`email`),
  UNIQUE KEY `phone_9` (`phone`),
  UNIQUE KEY `email_9` (`email`),
  UNIQUE KEY `phone_10` (`phone`),
  UNIQUE KEY `email_10` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Thomas','Colo','Gayflor Jr','Kigali','uploads/users/1751403909599-663893444.jpg','0785573286','admin@admin.com','$2b$10$Gf4IW2HZ9CwmCg7IhFeNyeO6eLUFQB34I3QoMRgDOyFVOJ.T9a6qO','2025-05-18 15:50:49','2025-07-01 21:05:09'),(2,'Karim','','R','Kigali','','','karimkhizz@gmail.com','$2b$10$Gf4IW2HZ9CwmCg7IhFeNyeO6eLUFQB34I3QoMRgDOyFVOJ.T9a6qO','2025-07-01 15:50:49','2025-07-01 15:50:49'),(5,'Charmente','','U','Kigali','','0788774958','cumurungi9@gmail.com','$2b$10$Gf4IW2HZ9CwmCg7IhFeNyeO6eLUFQB34I3QoMRgDOyFVOJ.T9a6qO','2025-07-01 15:50:49','2025-07-01 15:50:49'),(6,'Plaisir','','U','Kigali','','+250785052502','plaisirnishimwe@gmail.com','$2b$10$Gf4IW2HZ9CwmCg7IhFeNyeO6eLUFQB34I3QoMRgDOyFVOJ.T9a6qO','2025-07-01 15:50:49','2025-07-01 15:50:49');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-04 11:12:27
