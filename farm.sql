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
  PRIMARY KEY (`id`),
  KEY `pasture_id` (`pasture_id`),
  KEY `user_id` (`user_id`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `cows_ibfk_1` FOREIGN KEY (`pasture_id`) REFERENCES `pastures` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `cows_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `cows_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cows`
--

LOCK TABLES `cows` WRITE;
/*!40000 ALTER TABLE `cows` DISABLE KEYS */;
INSERT INTO `cows` VALUES (1,'Kim','12340','2021-01-27','cow','Holstein','from_outside','Gikondo farm','demo cow','uploads/cows/1748378239554-744254318.jpg','1',2,1,1,'2025-05-27 13:10:03','2025-05-27 20:54:50'),(2,'bigbyte','12346','2025-03-31','cow','Jersey','from_farm','','new born cow','uploads/cows/1748379519511-841448852.png','1',1,1,1,'2025-05-27 13:56:56','2025-05-27 20:58:39'),(4,'gin','12343','2025-05-03','cow','Jersey','from_farm','','',NULL,'1',1,1,NULL,'2025-05-27 18:12:09','2025-05-27 18:12:09'),(5,'jojo','12388','2025-04-30','cow','Jersey','from_farm','','',NULL,'1',1,1,NULL,'2025-05-27 18:48:49','2025-05-27 18:48:49'),(6,'soso','8877','2025-05-08','cow','Holstein','from_farm','','a demo cow','uploads/cows/1748379379775-451841810.jpg','1',1,1,1,'2025-05-27 19:02:22','2025-05-27 20:56:19'),(7,'Zizi','00000','2025-05-26','bull','Jersey','from_outside','Nyanza Farm','demo','uploads/cows/1748852870591-684576188.png','1',1,1,NULL,'2025-06-02 08:27:50','2025-06-02 08:27:50');
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
  `cow_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `cow_id` (`cow_id`),
  KEY `user_id` (`user_id`),
  KEY `updated_by` (`updated_by`),
  CONSTRAINT `daily_milk_records_ibfk_1` FOREIGN KEY (`cow_id`) REFERENCES `cows` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `daily_milk_records_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `daily_milk_records_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daily_milk_records`
--

LOCK TABLES `daily_milk_records` WRITE;
/*!40000 ALTER TABLE `daily_milk_records` DISABLE KEYS */;
INSERT INTO `daily_milk_records` VALUES (1,'12','12','2025-06-02',1,1,1,'2025-06-01 22:48:19','2025-06-01 23:07:59'),(2,'8','70','2025-06-02',2,1,1,'2025-06-01 22:51:16','2025-06-01 23:07:47'),(3,'9','','2025-06-02',4,1,NULL,'2025-06-01 22:53:33','2025-06-01 22:53:33'),(4,'5','','2025-06-02',4,1,NULL,'2025-06-01 22:55:31','2025-06-01 22:55:31'),(5,'9','','2025-06-02',5,1,NULL,'2025-06-01 22:56:09','2025-06-01 22:56:09'),(6,'6','','2025-06-02',6,1,1,'2025-06-01 23:05:40','2025-06-01 23:07:06');
/*!40000 ALTER TABLE `daily_milk_records` ENABLE KEYS */;
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
INSERT INTO `pastures` VALUES (1,'BBB','Rwanda','For babies cows',NULL,'1',1,'2025-05-27 12:20:00','2025-05-27 12:20:00'),(2,'AAA','Rwanda','For adult cows',NULL,'1',1,'2025-05-27 12:20:56','2025-05-27 12:20:56'),(4,'CCCC','DR Congo','',NULL,'1',1,'2025-06-02 09:10:21','2025-06-02 09:10:21');
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
INSERT INTO `SequelizeMeta` VALUES ('20250518172640-create-pasture.js'),('20250527120855-create-cow.js'),('20250601164218-create-daily-milk-record.js');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Thomas','','Gayflor Jr','Kigali','','1234567890','admin@admin.com','$2b$10$tqHR1ZQyy/bZU.OUx5isEO0PZ5Wa/7keOtb01qoSi3sN89IGIujQC','2025-05-18 15:50:49','2025-05-18 15:50:49');
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

-- Dump completed on 2025-06-03 12:02:01
