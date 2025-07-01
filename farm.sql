-- MySQL dump 10.13  Distrib 8.0.25, for macos11 (x86_64)
--
-- Host: 127.0.0.1    Database: farm_db
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cows`
--

LOCK TABLES `cows` WRITE;
/*!40000 ALTER TABLE `cows` DISABLE KEYS */;
INSERT INTO `cows` VALUES (1,'X','199106','2025-01-30','Female','Holstein','from_farm','','','uploads\\cows\\1749129686295-955639665.jpeg','1',2,1,1,'2025-05-27 13:10:03','2025-07-01 12:19:38','0',NULL,NULL,NULL),(2,'X','2004801','2024-11-13','Female','Jersey','from_farm','','','uploads\\cows\\1749129871480-697219708.jpeg','1',2,1,1,'2025-05-27 13:56:56','2025-06-06 11:28:23',NULL,NULL,NULL,NULL),(4,'X','199105','2024-12-14','Female','Jersey','from_farm','','','uploads\\cows\\1749129985679-647723661.jpeg','1',2,1,1,'2025-05-27 18:12:09','2025-06-06 11:28:37',NULL,NULL,NULL,NULL),(5,'X','2137070','2025-04-01','Female','Jersey','from_farm','','','uploads\\cows\\1749130066836-855908728.jpeg','1',2,1,1,'2025-05-27 18:48:49','2025-06-06 11:28:49',NULL,NULL,NULL,NULL),(6,'X','2076201','2025-04-25','Male','Jersey','from_farm','','','uploads\\cows\\1749130122792-320250772.jpeg','1',2,1,1,'2025-05-27 19:02:22','2025-06-09 10:13:16',NULL,NULL,NULL,NULL),(7,'X','2076202','2025-04-24','Male','Jersey','from_farm','','','uploads\\cows\\1749130240847-176590878.jpeg','1',2,1,1,'2025-06-02 08:27:50','2025-06-09 10:13:25',NULL,NULL,NULL,NULL),(8,'Igikwerere','0583368','2022-04-01','Female','Jersey','from_outside','Mutangana','','uploads\\cows\\1749135035494-732616519.jpeg','1',2,1,1,'2025-06-05 13:55:31','2025-06-06 11:23:08',NULL,NULL,NULL,NULL),(9,'Rudasumbwa','0996973','2022-05-04','Female','Jersey','from_outside','Mutangana','','uploads\\cows\\1749135071072-721430719.jpeg','1',2,1,1,'2025-06-05 13:57:07','2025-06-06 11:23:21',NULL,NULL,NULL,NULL),(10,'Indinganire','1079045','2022-05-04','Female','Jersey','from_outside','Mutangana','','uploads\\cows\\1749136379936-655441584.jpeg','1',2,1,1,'2025-06-05 13:58:27','2025-06-06 11:23:34',NULL,NULL,NULL,NULL),(11,'Runigampunzi','1484436','2022-05-04','Female','Jersey','from_outside','Mutangana','','uploads\\cows\\1749135704577-519426102.jpeg','1',2,1,1,'2025-06-05 14:00:12','2025-06-09 10:42:01',NULL,NULL,NULL,NULL),(12,'Intarutwa','2092248','2022-03-04','Female','Jersey','from_outside','Mutangana','','uploads\\cows\\1749134994662-513578134.jpeg','1',2,1,1,'2025-06-05 14:01:13','2025-06-06 11:24:04',NULL,NULL,NULL,NULL),(13,'Imfuranzima','1498854','2022-02-01','Female','Jersey','from_outside','Asiimwe','','uploads\\cows\\1749134943475-952700501.jpeg','1',2,1,1,'2025-06-05 14:02:32','2025-06-09 12:09:32',NULL,NULL,NULL,NULL),(14,'Rubyirukana','0375589','2022-03-02','Female','Jersey','from_outside','Asiimwe','','uploads\\cows\\1749135466619-627163861.jpeg','1',2,1,1,'2025-06-05 14:03:26','2025-06-09 12:08:47',NULL,NULL,NULL,NULL),(15,'Rugango','0250637','2022-04-01','Female','Jersey','from_outside','Asiimwe','','uploads\\cows\\1749136658762-354677376.jpeg','1',2,1,1,'2025-06-05 14:04:49','2025-06-09 12:08:29',NULL,NULL,NULL,NULL),(16,'Inkusi','0925543','2022-03-02','Female','Jersey','from_outside','Asiimwe','','uploads\\cows\\1749134914381-832061370.jpeg','1',2,1,1,'2025-06-05 14:07:15','2025-06-09 12:09:45',NULL,NULL,NULL,NULL),(18,'Bull','0330464','2022-03-14','Male','Jersey','from_outside','Mutangana','','uploads\\cows\\1749136720979-207506869.jpeg','1',2,1,1,'2025-06-05 14:10:34','2025-06-30 23:46:26',NULL,'Steer',NULL,NULL),(19,'X','1079013','2023-01-09','Female','Holstein','from_outside','Mutangana','',NULL,'1',2,1,NULL,'2025-06-09 11:33:10','2025-06-09 11:33:10','1',NULL,NULL,NULL),(20,'X','1079011','2023-01-09','Female','Holstein','from_outside','Mutangana','',NULL,'1',2,1,NULL,'2025-06-09 11:34:21','2025-06-09 11:34:21','1',NULL,NULL,NULL),(21,'X','1079012','2023-01-19','Female','Holstein','from_outside','Mutangana','',NULL,'1',2,1,NULL,'2025-06-09 11:35:15','2025-06-09 11:35:15','1',NULL,NULL,NULL),(22,'X','1079015','2023-01-20','Female','Holstein','from_outside','Mutangana','',NULL,'1',2,1,NULL,'2025-06-09 11:35:44','2025-06-09 11:35:44','1',NULL,NULL,NULL);
/*!40000 ALTER TABLE `cows` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_milk_records`
--

LOCK TABLES `daily_milk_records` WRITE;
/*!40000 ALTER TABLE `daily_milk_records` DISABLE KEYS */;
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
  `food` varchar(255) NOT NULL,
  `quantity` varchar(255) DEFAULT NULL,
  `fed_date` date NOT NULL,
  `user_id` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `pasture_id` (`pasture_id`),
  KEY `user_id` (`user_id`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `feedings_ibfk_1` FOREIGN KEY (`pasture_id`) REFERENCES `pastures` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `feedings_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `feedings_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedings`
--

LOCK TABLES `feedings` WRITE;
/*!40000 ALTER TABLE `feedings` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedings` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medications`
--

LOCK TABLES `medications` WRITE;
/*!40000 ALTER TABLE `medications` DISABLE KEYS */;
/*!40000 ALTER TABLE `medications` ENABLE KEYS */;
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
INSERT INTO `SequelizeMeta` VALUES ('20250518172640-create-pasture.js'),('20250527120855-create-cow.js'),('20250601164218-create-daily-milk-record.js'),('20250601234505-create-price-settings.js'),('20250609084930-create-feeding.js'),('20250701145012-create-feeding.js'),('20250701155251-create-medication.js');
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
INSERT INTO `user_roles` VALUES ('2025-05-18 15:50:49','2025-05-18 15:50:49',1,1);
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
INSERT INTO `users` VALUES (1,'Thomas','Colo','Gayflor Jr','Kigali','uploads/users/1751308128247-848704475.jpeg','0785573286','admin@admin.com','$2b$10$Gf4IW2HZ9CwmCg7IhFeNyeO6eLUFQB34I3QoMRgDOyFVOJ.T9a6qO','2025-05-18 15:50:49','2025-06-30 18:28:48'),(2,'Karim','','R','Kigali','','','karimkhizz@gmail.com','$2b$10$Gf4IW2HZ9CwmCg7IhFeNyeO6eLUFQB34I3QoMRgDOyFVOJ.T9a6qO','2025-07-01 15:50:49','2025-07-01 15:50:49'),(5,'Charmente','','U','Kigali','','0788774958','cumurungi9@gmail.com','$2b$10$Gf4IW2HZ9CwmCg7IhFeNyeO6eLUFQB34I3QoMRgDOyFVOJ.T9a6qO','2025-07-01 15:50:49','2025-07-01 15:50:49'),(6,'Plaisir','','U','Kigali','','+250785052502','plaisirnishimwe@gmail.com','$2b$10$Gf4IW2HZ9CwmCg7IhFeNyeO6eLUFQB34I3QoMRgDOyFVOJ.T9a6qO','2025-07-01 15:50:49','2025-07-01 15:50:49');
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

-- Dump completed on 2025-07-01 19:27:32
