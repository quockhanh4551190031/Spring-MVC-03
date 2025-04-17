-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: postify
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `follows`
--

DROP TABLE IF EXISTS `follows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `follows` (
  `following_user_id` bigint NOT NULL,
  `followed_user_id` bigint NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`following_user_id`,`followed_user_id`),
  KEY `followed_user_id` (`followed_user_id`),
  CONSTRAINT `follows_ibfk_1` FOREIGN KEY (`following_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `follows_ibfk_2` FOREIGN KEY (`followed_user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follows`
--

LOCK TABLES `follows` WRITE;
/*!40000 ALTER TABLE `follows` DISABLE KEYS */;
INSERT INTO `follows` VALUES (1,6,'2025-04-09 22:29:27.000000'),(1,7,'2025-04-09 09:31:03.000000'),(1,8,'2025-04-09 09:31:01.000000'),(1,9,'2025-04-09 22:29:26.000000'),(1,10,'2025-04-09 22:29:26.000000'),(1,11,'2025-04-09 22:29:25.000000');
/*!40000 ALTER TABLE `follows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `place`
--

DROP TABLE IF EXISTS `place`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `place` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `place`
--

LOCK TABLES `place` WRITE;
/*!40000 ALTER TABLE `place` DISABLE KEYS */;
INSERT INTO `place` VALUES (1,'Hà Nội'),(2,'TP. Hồ Chí Minh'),(3,'Đà Nẵng'),(4,'Hải Phòng'),(5,'Cần Thơ');
/*!40000 ALTER TABLE `place` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `body` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `posts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'Bài viết 1','Nội dung bài viết 1',1,'public','2025-04-09 04:33:42.000000'),(2,'Bài viết 2','Nội dung bài viết 2',2,'public','2025-04-09 04:33:42.000000'),(3,'Bài viết 3','Nội dung bài viết 3',3,'draft','2025-04-09 04:33:42.000000'),(4,'Bài viết 4','Nội dung bài viết 4',4,'public','2025-04-09 04:33:42.000000'),(5,'Bài viết 5','Nội dung bài viết 5',5,'draft','2025-04-09 04:33:42.000000'),(6,'Bài viết 6','Nội dung bài viết 6',6,'public','2025-04-09 04:33:42.000000'),(7,'Bài viết 7','Nội dung bài viết 7',7,'private','2025-04-09 04:33:42.000000'),(8,'Bài viết 8','Nội dung bài viết 8',8,'public','2025-04-09 04:33:42.000000'),(9,'Bài viết 9','Nội dung bài viết 9',9,'draft','2025-04-09 04:33:42.000000'),(10,'Bài viết 10','Nội dung bài viết 10',10,'public','2025-04-09 04:33:42.000000'),(11,'siuuuu','Siuuuuuu',1,'public','2025-04-09 04:34:09.000000'),(12,'siuu','siuuuuu',1,'public','2025-04-09 09:30:42.000000');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `place_id` bigint DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `fk_place` (`place_id`),
  CONSTRAINT `fk_place` FOREIGN KEY (`place_id`) REFERENCES `place` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'user','123',NULL,NULL,NULL,NULL,'2025-04-09 04:31:33.000000'),(2,'user1','pass1',NULL,NULL,NULL,NULL,'2025-04-09 04:33:28.000000'),(3,'user2','pass2',NULL,NULL,NULL,NULL,'2025-04-09 04:33:28.000000'),(4,'user3','pass3',NULL,NULL,NULL,NULL,'2025-04-09 04:33:28.000000'),(5,'user4','pass4',NULL,NULL,NULL,NULL,'2025-04-09 04:33:28.000000'),(6,'user5','pass5',NULL,NULL,NULL,NULL,'2025-04-09 04:33:28.000000'),(7,'user6','pass6',NULL,NULL,NULL,NULL,'2025-04-09 04:33:28.000000'),(8,'user7','pass7',NULL,NULL,NULL,NULL,'2025-04-09 04:33:28.000000'),(9,'user8','pass8',NULL,NULL,NULL,NULL,'2025-04-09 04:33:28.000000'),(10,'user9','pass9',NULL,NULL,NULL,NULL,'2025-04-09 04:33:28.000000'),(11,'user10','pass10',NULL,NULL,NULL,NULL,'2025-04-09 04:33:28.000000'),(15,'danh','1234','skynghia52@gmail.com','2004-08-14',NULL,'/uploads/1744814633863.jpg','2025-04-16 13:35:23.484157');
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

-- Dump completed on 2025-04-16 23:06:04
