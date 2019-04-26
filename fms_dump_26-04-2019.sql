-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: fixmyship
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `comments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `pid` bigint(20) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `like_count` bigint(20) NOT NULL DEFAULT '0',
  `dislike_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'2019-04-21 16:46:50','2019-04-21 16:46:50',2,2,'First Comment check by jayson and it should atleast 30 characters long, because a comment should be self explanatory',1,2,4,0),(2,'2019-04-21 17:53:47','2019-04-21 17:53:47',3,3,'Trying to post a comment from the comment box to check whether the comment is submitted successfully.',4,3,0,1),(3,'2019-04-21 17:55:15','2019-04-21 17:55:15',3,3,'This comment is to check how the second comment looks in the list of comments.',1,3,1,1),(4,'2019-04-21 18:43:15','2019-04-21 18:43:15',1,1,'This is a very first comment on a post by Dusayanta Prasad.',5,1,1,0),(5,'2019-04-22 03:35:13','2019-04-22 03:35:13',3,3,'I am the first to suggest on this post',2,3,1,1),(6,'2019-04-22 10:25:23','2019-04-22 10:25:23',3,3,'This suggestion is to check the counts of the comments and suggestions.',6,3,2,0),(7,'2019-04-22 16:01:01','2019-04-22 16:01:01',1,1,'This the to check the comment count for a post whether working or not',6,1,2,0),(8,'2019-04-22 16:04:05','2019-04-22 16:04:05',1,1,'This the to check the comment count for a post whether working or not',6,1,1,0),(9,'2019-04-22 10:40:08','2019-04-22 10:40:08',3,3,'Check for the comments count. let it be more than 30 characaters.',3,3,1,1),(10,'2019-04-22 10:42:58','2019-04-22 10:42:58',3,3,'This is the second suggestion on this post. The post id is 2.',2,3,0,2),(11,'2019-04-22 11:38:11','2019-04-22 11:38:11',5,5,'This is a comment for the presentation, should be more than 30 characters',1,5,3,0),(12,'2019-04-24 10:14:22','2019-04-24 10:14:22',1,1,'Hey this is a dummy comment or suggestion.',5,1,0,0),(13,'2019-04-26 08:54:06','2019-04-26 08:54:06',7,7,'no suggestions for u...........',8,7,0,1);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `inc_countComments` AFTER INSERT ON `comments` FOR EACH ROW BEGIN
 UPDATE Posts SET comment_count= comment_count + 1 WHERE id = NEW.pid;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `dislikes`
--

DROP TABLE IF EXISTS `dislikes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `dislikes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `cid` bigint(20) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dislikes`
--

LOCK TABLES `dislikes` WRITE;
/*!40000 ALTER TABLE `dislikes` DISABLE KEYS */;
INSERT INTO `dislikes` VALUES (25,'2019-04-25 12:20:30','2019-04-25 12:20:30',3,3,9,3),(36,'2019-04-26 07:21:09','2019-04-26 07:21:09',3,3,10,3),(38,'2019-04-26 07:37:53','2019-04-26 07:37:53',4,4,3,4),(39,'2019-04-26 08:53:31','2019-04-26 08:53:31',7,7,5,7),(40,'2019-04-26 08:53:32','2019-04-26 08:53:32',7,7,10,7),(41,'2019-04-26 08:53:41','2019-04-26 08:53:41',7,7,2,7),(42,'2019-04-26 08:54:09','2019-04-26 08:54:09',7,7,13,7);
/*!40000 ALTER TABLE `dislikes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `INC_DislikesAndBadges` AFTER INSERT ON `dislikes` FOR EACH ROW BEGIN
UPDATE Comments SET dislike_count= dislike_count + 1 WHERE id = NEW.cid;
UPDATE Users SET badge_value=badge_value-2 where id= (select uid from comments where id=new.cid);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `DEC_DislikesAndBadges` AFTER DELETE ON `dislikes` FOR EACH ROW BEGIN
UPDATE Comments SET dislike_count = dislike_count - 1 WHERE id = OLD.cid;
UPDATE Users SET badge_value=badge_value+2 where id= (select uid from comments where id=old.cid);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `likes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `cid` bigint(20) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (17,'2019-04-25 11:36:33','2019-04-25 11:36:33',3,3,11,3),(27,'2019-04-25 12:35:02','2019-04-25 12:35:02',2,2,1,2),(35,'2019-04-25 15:22:10','2019-04-25 15:22:10',6,6,11,6),(37,'2019-04-25 15:23:05','2019-04-25 15:23:05',6,6,6,6),(38,'2019-04-25 15:24:21','2019-04-25 15:24:21',6,6,7,6),(39,'2019-04-25 15:27:36','2019-04-25 15:27:36',6,6,1,6),(41,'2019-04-25 15:30:46','2019-04-25 15:30:46',6,6,9,6),(42,'2019-04-25 16:53:21','2019-04-25 16:53:21',3,3,4,3),(46,'2019-04-26 07:13:35','2019-04-26 07:13:35',3,3,7,3),(58,'2019-04-26 07:14:37','2019-04-26 07:14:37',3,3,6,3),(60,'2019-04-26 07:15:08','2019-04-26 07:15:08',3,3,8,3),(62,'2019-04-26 07:15:49','2019-04-26 07:15:49',3,3,1,3),(63,'2019-04-26 07:18:13','2019-04-26 07:18:13',3,3,3,3),(64,'2019-04-26 07:20:45','2019-04-26 07:20:45',3,3,5,3),(69,'2019-04-26 07:37:57','2019-04-26 07:37:57',4,4,11,4),(70,'2019-04-26 07:39:41','2019-04-26 07:39:41',4,4,1,4);
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `INC_LikesAndBadges` AFTER INSERT ON `likes` FOR EACH ROW BEGIN
UPDATE Comments SET like_count= like_count + 1 WHERE id = NEW.cid;
UPDATE Users SET badge_value=badge_value+2 where id= (select uid from comments where id=new.cid);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `DEC_LikesAndBadges` AFTER DELETE ON `likes` FOR EACH ROW BEGIN
UPDATE Comments SET like_count= like_count - 1 WHERE id = OLD.cid;
UPDATE Users SET badge_value=badge_value-2 where id= (select uid from comments where id=old.cid);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `posts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `comment_count` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'2019-04-19 04:00:57','2019-04-19 04:00:57',1,1,'First post description by dusayanta','First post title by dusayanta',1,3),(2,'2019-04-19 04:08:06','2019-04-19 04:08:06',2,2,'first post description by jayson','First post title by jayson',2,2),(3,'2019-04-19 07:19:20','2019-04-19 07:19:20',1,1,'Second post description by dusayanta','Second Post title by dusayanta',1,1),(4,'2019-04-20 11:10:11','2019-04-20 11:10:11',1,1,'Something which is weird is really weird if it is seen as a problem and not as a solution, but different people have different perspective. And this is the thing which arises conflict between two couples.','Something weird going on with my relationship',1,1),(5,'2019-04-20 11:20:31','2019-04-20 11:20:31',2,2,'Description check for modal close. Added data-dismiss attribute to submit post button to check whether the post is submitted and the modal is closed properly at the same time.','Title Check for modal Close',2,2),(6,'2019-04-20 18:39:10','2019-04-20 18:39:10',1,1,'This description if for checking whether the post is getting submitted or not after the modal being triggered from the child component, which is actually residing in the home component.','Child Component AllPost of Home',1,3),(7,'2019-04-22 03:36:06','2019-04-22 03:36:06',3,3,'This is issue description by Samuel','This is issue title by Samuel',3,0),(8,'2019-04-22 15:13:13','2019-04-22 15:13:13',3,3,'This is second post description by Samuel.','This is second post title by Samuel',3,1),(9,'2019-04-23 11:16:09','2019-04-23 11:16:09',3,3,'This is description title for presentation','This is post title for presentation',3,0),(10,'2019-04-25 12:14:50','2019-04-25 12:14:50',3,3,'This is a post description for fifth presentation','This is post title for fifth presentation',3,0),(11,'2019-04-26 08:52:31','2019-04-26 08:52:31',7,7,'it\'s priyanshu\'s post description','it\'s priyanshu\'s post title',7,0);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_nb4h0p6txrmfc0xbrd1kglp9t` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (2,'ROLE_ADMIN'),(1,'ROLE_USER');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_roles` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FKh8ciramu9cc9q3qcqiv4ue8a6` (`role_id`),
  CONSTRAINT `FKh8ciramu9cc9q3qcqiv4ue8a6` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`),
  CONSTRAINT `FKhfh9dx7w3ubf1co1vdev94g3f` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `firstname` varchar(40) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `lastname` varchar(40) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `badge_value` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKr43af9ap4edm43mmtq01oddj6` (`username`),
  UNIQUE KEY `UK6dotkott2kjsp8vw4d0m25fb7` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'2019-04-19 04:00:12','2019-04-19 04:00:12','dusayantaprasad@gmail.com','Dusayanta','male','Prasad','$2a$10$7Dpyn5fX8LrYbnbpfVbun.ehffm4WS/2EPjaVdrgfXJ.hCUX5qwRe','9007959410','dusayantaprasad@gmail.com',8),(2,'2019-04-19 04:07:20','2019-04-19 04:07:20','jayson@gmail.com','Jayson','male','Bourne','$2a$10$T4Mv2tIlSPFhE3VOaUP4NuXsh0WCJ2nPYGy/CTtA0es.uBABoEsyS','9876543210','jayson@gmail.com',8),(3,'2019-04-21 16:51:29','2019-04-21 16:51:29','sam@gmail.com','Samuel','male','Jackson','$2a$10$.FCXNcbPvqPGHNNs.LPEY.r9/RGvEnh4WMzR.OwfM0tVQ2YF1RHq.','7073341205','sam@gmail.com',-2),(4,'2019-04-22 03:41:01','2019-04-22 03:41:01','maisie@gmail.com','Maisie','female','Williams','$2a$10$7hRX7JFC2YxWGnqJB2YmcuUFk49ZwA0UoHaOh1STieNLHv0t4P/f6','9876543210','maisie@gmail.com',0),(5,'2019-04-22 11:30:32','2019-04-22 11:30:32','check@gmail.com','Check','male','User','$2a$10$HNSgCtKYUDywlTFWIhatd.fyt56XdKJGRf2Hbbof6WQX5SKnLl6Na','9876543210','check@gmail.com',6),(6,'2019-04-25 12:32:53','2019-04-25 12:32:53','john@gmail.com','John','male','Davis','$2a$10$x/GxKCDK0auMPrgiCYWEO.uh0fzSPKtAtg1LdgbQxGk5qYtt8u.F.','1234567890','john@gmail.com',0),(7,'2019-04-26 08:51:37','2019-04-26 08:51:37','priyanshu@gmail.com','Priyanshu','male','Pratihar','$2a$10$mz37L4bJFVTkgT9JgHgb5OFJr7I3DW3g1PP9nTvITWmhXzyKgnog6','8910681981','priyanshu@gmail.com',-2);
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

-- Dump completed on 2019-04-26 14:33:18
