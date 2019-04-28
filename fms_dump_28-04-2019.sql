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
  `comment` mediumtext NOT NULL,
  `pid` bigint(20) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `like_count` bigint(20) NOT NULL DEFAULT '0',
  `dislike_count` bigint(20) NOT NULL DEFAULT '0',
  `username` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'2019-04-21 16:46:50','2019-04-21 16:46:50',2,2,'First Comment check by jayson and it should atleast 30 characters long, because a comment should be self explanatory',1,2,6,0,'Jayson'),(2,'2019-04-21 17:53:47','2019-04-21 17:53:47',3,3,'Trying to post a comment from the comment box to check whether the comment is submitted successfully.',4,3,1,1,'Samuel'),(3,'2019-04-21 17:55:15','2019-04-21 17:55:15',3,3,'This comment is to check how the second comment looks in the list of comments.',1,3,1,2,'Samuel'),(4,'2019-04-21 18:43:15','2019-04-21 18:43:15',1,1,'This is a very first comment on a post by Dusayanta Prasad.',5,1,1,0,'Dusayanta'),(5,'2019-04-22 03:35:13','2019-04-22 03:35:13',3,3,'I am the first to suggest on this post',2,3,2,1,'Samuel'),(6,'2019-04-22 10:25:23','2019-04-22 10:25:23',3,3,'This suggestion is to check the counts of the comments and suggestions.',6,3,4,0,'Samuel'),(7,'2019-04-22 16:01:01','2019-04-22 16:01:01',1,1,'This the to check the comment count for a post whether working or not',6,1,2,0,'Dusayanta'),(8,'2019-04-22 16:04:05','2019-04-22 16:04:05',1,1,'This the to check the comment count for a post whether working or not',6,1,1,0,'Dusayanta'),(9,'2019-04-22 10:40:08','2019-04-22 10:40:08',3,3,'Check for the comments count. let it be more than 30 characaters.',3,3,2,1,'Samuel'),(10,'2019-04-22 10:42:58','2019-04-22 10:42:58',3,3,'This is the second suggestion on this post. The post id is 2.',2,3,1,1,'Samuel'),(11,'2019-04-22 11:38:11','2019-04-22 11:38:11',5,5,'This is a comment for the presentation, should be more than 30 characters',1,5,3,1,'Check'),(12,'2019-04-24 10:14:22','2019-04-24 10:14:22',1,1,'Hey this is a dummy comment or suggestion.',5,1,0,0,'Dusayanta'),(13,'2019-04-26 08:54:06','2019-04-26 08:54:06',7,7,'no suggestions for u...........',8,7,1,1,'Priyanshu'),(14,'2019-04-26 09:57:05','2019-04-26 09:57:05',13,13,'It\'s ok to not be okay. some days are just harder than others.',14,13,3,0,'Divya'),(15,'2019-04-26 10:01:27','2019-04-26 10:01:27',9,9,'I want to swap with u if u pay me ur one year salary......',17,9,1,1,'Braja'),(16,'2019-04-26 10:04:16','2019-04-26 10:04:16',13,13,'I think you need to visit another portal regarding this issue',17,13,2,0,'Divya'),(17,'2019-04-26 10:06:59','2019-04-26 10:06:59',11,11,'don\'t be frustrated, it\'s  not big deal for him that he didn\'t think about you!!',14,11,0,0,'Pooja'),(18,'2019-04-26 10:08:19','2019-04-26 10:08:19',10,10,'Spend some money dude.. you will get desired result.',17,10,1,1,'Rai'),(19,'2019-04-26 10:09:00','2019-04-26 10:09:00',14,14,'Great ! then enjoy your life!!!',15,14,2,0,'Pallavi'),(20,'2019-04-26 10:15:20','2019-04-26 10:15:20',9,9,'you should create ur own issue..',15,9,2,1,'Braja'),(21,'2019-04-26 10:24:01','2019-04-26 10:24:01',14,14,'Wrong.\nNitrogen ,Oxygen, and Carbondioxide are in the air!!!!!!!!!!!\n',20,14,0,0,'Pallavi'),(22,'2019-04-26 10:24:22','2019-04-26 10:24:22',9,9,'suggesting myself.....................................',16,9,1,0,'Braja'),(23,'2019-04-26 10:27:01','2019-04-26 10:27:01',13,13,'creating issue is not as easy as posting ur issue in the fixmy\'ship @UserID-9',15,13,2,0,'Divya'),(24,'2019-04-26 10:29:02','2019-04-26 10:29:02',13,13,'Break their bones they have 206!!!!!!',21,13,3,0,'Divya'),(25,'2019-04-26 10:30:18','2019-04-26 10:30:18',10,10,'No.. you breath.. so that the love can fill your heart and mind.. :)',20,10,0,0,'Rai'),(26,'2019-04-26 10:37:28','2019-04-26 10:37:28',10,10,'Ups and downs come in the life.. this is the beauty of life.. we have to keep one thing in our mind that, time will not stop for us.. so we have to move on.. just forget about the bad things that happened in life.. remember those sweet memories which you spent with your full heart... just move on.. live your life.. live for yourself.. that\'s all..  Moreover, you can put yourself in a hobby to distract your attention from an ongoing irritation. Domestic violence: For some it’s just that one moment when you realise that you are a victim of domestic violence and immediately respond to it. Whereas, many keep suffering in the hope that things will get better. However, in a situation like such, it becomes crucial to seek a legal advice to cope up with a violent spouse or to dissolve a marriage. These are some of the common causes leading to the decision of dissolution of a marriage. ',16,10,2,0,'Rai'),(27,'2019-04-26 10:54:16','2019-04-26 10:54:16',13,13,'Comment to check credits!!!!!!!!!!!!!!!!!!',1,13,3,0,'Divya'),(28,'2019-04-26 10:55:41','2019-04-26 10:55:41',13,13,'Third suggestion!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!',2,13,1,0,'Divya'),(29,'2019-04-26 11:19:44','2019-04-26 11:19:44',9,9,'commenting on my post.................',12,9,0,0,'Braja');
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
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dislikes`
--

LOCK TABLES `dislikes` WRITE;
/*!40000 ALTER TABLE `dislikes` DISABLE KEYS */;
INSERT INTO `dislikes` VALUES (25,'2019-04-25 12:20:30','2019-04-25 12:20:30',3,3,9,3),(38,'2019-04-26 07:37:53','2019-04-26 07:37:53',4,4,3,4),(39,'2019-04-26 08:53:31','2019-04-26 08:53:31',7,7,5,7),(40,'2019-04-26 08:53:32','2019-04-26 08:53:32',7,7,10,7),(41,'2019-04-26 08:53:41','2019-04-26 08:53:41',7,7,2,7),(42,'2019-04-26 08:54:09','2019-04-26 08:54:09',7,7,13,7),(43,'2019-04-26 09:44:34','2019-04-26 09:44:34',9,9,3,9),(44,'2019-04-26 09:44:36','2019-04-26 09:44:36',9,9,11,9),(47,'2019-04-26 10:02:07','2019-04-26 10:02:07',12,12,15,12),(51,'2019-04-26 10:18:38','2019-04-26 10:18:38',12,12,18,12),(52,'2019-04-26 10:20:58','2019-04-26 10:20:58',13,13,20,13);
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
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (17,'2019-04-25 11:36:33','2019-04-25 11:36:33',3,3,11,3),(27,'2019-04-25 12:35:02','2019-04-25 12:35:02',2,2,1,2),(35,'2019-04-25 15:22:10','2019-04-25 15:22:10',6,6,11,6),(37,'2019-04-25 15:23:05','2019-04-25 15:23:05',6,6,6,6),(38,'2019-04-25 15:24:21','2019-04-25 15:24:21',6,6,7,6),(39,'2019-04-25 15:27:36','2019-04-25 15:27:36',6,6,1,6),(41,'2019-04-25 15:30:46','2019-04-25 15:30:46',6,6,9,6),(42,'2019-04-25 16:53:21','2019-04-25 16:53:21',3,3,4,3),(46,'2019-04-26 07:13:35','2019-04-26 07:13:35',3,3,7,3),(58,'2019-04-26 07:14:37','2019-04-26 07:14:37',3,3,6,3),(60,'2019-04-26 07:15:08','2019-04-26 07:15:08',3,3,8,3),(62,'2019-04-26 07:15:49','2019-04-26 07:15:49',3,3,1,3),(63,'2019-04-26 07:18:13','2019-04-26 07:18:13',3,3,3,3),(64,'2019-04-26 07:20:45','2019-04-26 07:20:45',3,3,5,3),(69,'2019-04-26 07:37:57','2019-04-26 07:37:57',4,4,11,4),(70,'2019-04-26 07:39:41','2019-04-26 07:39:41',4,4,1,4),(76,'2019-04-26 09:44:15','2019-04-26 09:44:15',9,9,1,9),(89,'2019-04-26 10:00:32','2019-04-26 10:00:32',10,10,14,10),(91,'2019-04-26 10:06:13','2019-04-26 10:06:13',10,10,16,10),(94,'2019-04-26 10:09:35','2019-04-26 10:09:35',13,13,19,13),(96,'2019-04-26 10:11:25','2019-04-26 10:11:25',14,14,14,14),(97,'2019-04-26 10:12:17','2019-04-26 10:12:17',13,13,14,13),(98,'2019-04-26 10:14:49','2019-04-26 10:14:49',11,11,18,11),(99,'2019-04-26 10:14:56','2019-04-26 10:14:56',11,11,15,11),(101,'2019-04-26 10:18:00','2019-04-26 10:18:00',12,12,16,12),(104,'2019-04-26 10:25:25','2019-04-26 10:25:25',9,9,22,9),(105,'2019-04-26 10:29:36','2019-04-26 10:29:36',13,13,24,13),(106,'2019-04-26 10:30:13','2019-04-26 10:30:13',14,14,24,14),(107,'2019-04-26 10:32:34','2019-04-26 10:32:34',14,14,23,14),(108,'2019-04-26 10:32:52','2019-04-26 10:32:52',14,14,20,14),(109,'2019-04-26 10:32:57','2019-04-26 10:32:57',14,14,19,14),(111,'2019-04-26 10:39:58','2019-04-26 10:39:58',9,9,24,9),(112,'2019-04-26 10:52:36','2019-04-26 10:52:36',9,9,26,9),(113,'2019-04-26 10:52:56','2019-04-26 10:52:56',13,13,23,13),(114,'2019-04-26 10:54:20','2019-04-26 10:54:20',13,13,27,13),(115,'2019-04-26 10:54:58','2019-04-26 10:54:58',14,14,27,14),(116,'2019-04-26 10:55:45','2019-04-26 10:55:45',13,13,28,13),(117,'2019-04-26 10:58:02','2019-04-26 10:58:02',10,10,27,10),(118,'2019-04-26 11:04:20','2019-04-26 11:04:20',9,9,20,9),(120,'2019-04-27 16:48:04','2019-04-27 16:48:04',3,3,13,3),(121,'2019-04-27 19:37:50','2019-04-27 19:37:50',1,1,1,1),(122,'2019-04-28 08:34:54','2019-04-28 08:34:54',1,1,26,1),(123,'2019-04-28 08:49:13','2019-04-28 08:49:13',2,2,6,2),(124,'2019-04-28 08:52:25','2019-04-28 08:52:25',1,1,6,1),(125,'2019-04-28 08:53:32','2019-04-28 08:53:32',2,2,5,2),(126,'2019-04-28 08:55:28','2019-04-28 08:55:28',2,2,9,2),(127,'2019-04-28 09:31:03','2019-04-28 09:31:03',3,3,10,3),(129,'2019-04-28 10:12:20','2019-04-28 10:12:20',1,1,2,1);
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
  `description` mediumtext NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `uid` bigint(20) DEFAULT NULL,
  `comment_count` bigint(20) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `resolved` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKjmv8q7g0hpt7x2je24rh1r4kf` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'2019-04-19 04:00:57','2019-04-28 08:46:54',1,1,'First post description by dusayanta','First post title by dusayanta',1,4,'Dusayanta','Y'),(2,'2019-04-19 04:08:06','2019-04-28 08:53:56',2,2,'first post description by jayson','First post title by jayson',2,3,'Jayson','Y'),(3,'2019-04-19 07:19:20','2019-04-19 07:19:20',1,1,'Second post description by dusayanta','Second Post title by dusayanta',1,1,'Dusayanta','N'),(4,'2019-04-20 11:10:11','2019-04-28 08:37:56',1,1,'Something which is weird is really weird if it is seen as a problem and not as a solution, but different people have different perspective. And this is the thing which arises conflict between two couples.','Something weird going on with my relationship',1,1,'Dusayanta','N'),(5,'2019-04-20 11:20:31','2019-04-20 11:20:31',2,2,'Description check for modal close. Added data-dismiss attribute to submit post button to check whether the post is submitted and the modal is closed properly at the same time.','Title Check for modal Close',2,2,'Jayson','N'),(6,'2019-04-20 18:39:10','2019-04-28 08:51:57',1,1,'This description if for checking whether the post is getting submitted or not after the modal being triggered from the child component, which is actually residing in the home component.','Child Component AllPost of Home',1,3,'Dusayanta','Y'),(7,'2019-04-22 03:36:06','2019-04-28 11:07:13',3,3,'This is issue description by Samuel to check whether the post is updated successfully. And then you would be able to see this post','This is issue title by Samuel to check update',3,0,'Samuel','N'),(8,'2019-04-22 15:13:13','2019-04-28 11:14:42',3,3,'The situation is kinda frustrating to me. There\'s this girl that I\'ve known since 2 years ago. We haven\'t spoke much until recently of late last year in terms of being around the same group of friends. I got to know her a little bit better after talking for some time and I did develop an interest in her, but I found out she was involved with someone so I pulled back my interest for her. That being said, it still didn\'t mean that I had to stop talking to her at all because I did enjoy conversing with her about different topics and the like. That went on for awhile.\n\nNow, the issue that comes up is that after talking with one of my guy friends, I found out that she thinks I\'m like deep in love with her. She\'s slightly annoyed by it and feels like I can\'t take a hint. I\'m also told she\'s weary around me because she doesn\'t want me to ask her out. And she\'s talked to pretty much the rest of the group about it, so now its just been some kind of running gag with me being the butt of the joke. And I feel personally offended by this because I\'ve always thought that I was just being cool with her. Yes, I liked talking to her but I never asked her out or anything. I don\'t even remember complimenting her or making a pass at her ever. It also makes me feel bad because I was actually trying to do the thing people think guys cant do and that\'s just be platonic friends with a person. But to make me out to be some love struck puppy and probably have a laugh at my expense behind my back? Gotta say, 0/10, wouldn\'t recommend.\n\n\n\nSo now I\'m wondering what should I do, if anything? I\'m partial to just not talking to her or any of them anymore. That\'ll clear up all this mess in one go. But I also want to be mature and try to address the situation, but I feel like its hopeless at this point.','Girl[F/20] is convinced that I\'m[M/20] strongly interested in her when I\'m not and its caused an uncomfortable situation for me within our social group. Should I address her, the situation, or just leave it all alone?',3,1,'Samuel','N'),(9,'2019-04-23 11:16:09','2019-04-23 11:16:09',3,3,'This is description title for presentation','This is post title for presentation',3,0,'Samuel','N'),(10,'2019-04-25 12:14:50','2019-04-28 10:45:49',3,3,'This is a description to check if the post is getting updated using Postman REST Client','This is a title to check update',3,0,'Samuel','N'),(11,'2019-04-26 08:52:31','2019-04-26 08:52:31',7,7,'it\'s priyanshu\'s post description','it\'s priyanshu\'s post title',7,0,'Priyanshu','N'),(12,'2019-04-26 09:43:13','2019-04-26 09:43:13',9,9,'Braja is posting description here','Braja is posting title here',9,1,'Braja','N'),(13,'2019-04-26 09:49:11','2019-04-26 09:49:11',9,9,'it\'s testing concurrency desc.................','it\'s testing concurrency title',9,0,'Braja','N'),(14,'2019-04-26 09:49:11','2019-04-26 09:49:11',10,10,'he is with his ex.','Frustrated',10,2,'Rai','N'),(15,'2019-04-26 09:53:41','2019-04-26 09:53:41',13,13,'I don\'t have any issue','post by divya',13,3,'Divya','N'),(16,'2019-04-26 09:58:41','2019-04-26 09:58:41',9,9,'Getting divorced with your partner is a big life changing decision.\nFor some, it’s a decision resulting from diminishing personal happiness and unsatisfied relationship for a period of time. Whereas, for others, the decision happens in \'that one moment\' that changes everything.\n\nWell in most cases an unhappy marriage and unmet expectations are the root cause. But here are some more reasons leading to the end of a marriage.\n\nOngoing frustration: If frustration gets out of control, it could result in an outburst with severe outcomes. And in many cases, divorce comes out to be the only option to recover from it.\n\nIt’s very important to communicate the things that disturbs you at the very stage of frustration. Moreover, you can put yourself in a hobby to distract your attention from an ongoing irritation.\n\nDomestic violence: For some it’s just that one moment when you realise that you are a victim of domestic violence and immediately respond to it. Whereas, many keep suffering in the hope that things will get better.\nHowever, in a situation like such, it becomes crucial to seek a legal advice to cope up with a violent spouse or to dissolve a marriage.  These are some of the common causes leading to the decision of dissolution of a marriage. ','When was the moment you no longer wanted to stay married to your partner and why?',9,2,'Braja','N'),(17,'2019-04-26 09:58:49','2019-04-26 09:58:49',12,12,'I have got Gurgaon location as per my first project but I want Pune.There is one guy Braja in my class who has got pune.\nso can anyone tell me how  should I manipulate his mind and make him agree.\n\nPs- Don\'t give any unnecessary (Ch**) suggestions if u don\'t have any.','My location & this guy',12,3,'Shivam ','N'),(18,'2019-04-26 10:11:50','2019-04-26 10:11:50',9,9,'I want to change location to kolkata, is anyone interested?','Location change ',9,0,'Braja','N'),(19,'2019-04-26 10:18:20','2019-04-26 10:18:20',9,9,'My wife had an affair 6 months ago and since then I\'ve never been able to trust her. I saw a testimonial online and I contacted this genius hacker because I had to know the truth. Well, my worst fears have been realized, she never even stopped cheating on me. Thanks to KREBS SECURITY. I discovered she\'s been cheating on me with the same man (from her office) during lunch breaks at her work! Thank you for your help, now that I know I can never trust her again, I\'ve ditched her and I\'m going to move on! If you need such help, you can contact krebsprivateinvestigator gmail com or call/text to meet up with him if you are in the states (973)602-9881. Lastly, he provides proof before requesting payment.','Can u guys resolve  it??????',9,0,'Braja','N'),(20,'2019-04-26 10:19:15','2019-04-26 10:19:15',13,13,'Love is in the air try not to breathe','#trynottobreathe',13,2,'Divya','N'),(21,'2019-04-26 10:27:48','2019-04-26 10:27:48',14,14,'Don\'t break someones\'s heart they have only one','DO NOT!!!!!!',14,1,'Pallavi','N'),(22,'2019-04-26 11:00:30','2019-04-26 11:00:30',9,9,'1. Element used to secure methods.\na) security:intercept-methods\nb) global-method-security\nc) all of the mentioned\nd) none of the mentioned','Choose the correct one',9,0,'Braja','N'),(23,'2019-04-26 11:01:37','2019-04-26 11:01:37',9,9,'Tag which displays user’s Authentication object.\na) security:tag\nb) security_Tag\nc) security:authentication\nd) none of the mentioned','Choose the correct one',9,0,'Braja','N');
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
-- Table structure for table `solution`
--

DROP TABLE IF EXISTS `solution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `solution` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `cid` bigint(20) DEFAULT NULL,
  `pid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solution`
--

LOCK TABLES `solution` WRITE;
/*!40000 ALTER TABLE `solution` DISABLE KEYS */;
INSERT INTO `solution` VALUES (1,'2019-04-28 08:46:33','2019-04-28 08:46:33',1,1,1,1),(2,'2019-04-28 08:46:41','2019-04-28 08:46:41',1,1,11,1),(3,'2019-04-28 08:48:11','2019-04-28 08:48:11',1,1,6,6),(4,'2019-04-28 08:53:39','2019-04-28 08:53:39',2,2,5,2),(5,'2019-04-28 08:59:24','2019-04-28 08:59:24',1,1,2,4);
/*!40000 ALTER TABLE `solution` ENABLE KEYS */;
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
INSERT INTO `user_roles` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'2019-04-19 04:00:12','2019-04-19 04:00:12','dusayantaprasad@gmail.com','Dusayanta','male','Prasad','$2a$10$7Dpyn5fX8LrYbnbpfVbun.ehffm4WS/2EPjaVdrgfXJ.hCUX5qwRe','9007959410','dusayantaprasad@gmail.com',8),(2,'2019-04-19 04:07:20','2019-04-19 04:07:20','jayson@gmail.com','Jayson','male','Bourne','$2a$10$T4Mv2tIlSPFhE3VOaUP4NuXsh0WCJ2nPYGy/CTtA0es.uBABoEsyS','9876543210','jayson@gmail.com',12),(3,'2019-04-21 16:51:29','2019-04-21 16:51:29','sam@gmail.com','Samuel','male','Jackson','$2a$10$.FCXNcbPvqPGHNNs.LPEY.r9/RGvEnh4WMzR.OwfM0tVQ2YF1RHq.','7073341205','sam@gmail.com',10),(4,'2019-04-22 03:41:01','2019-04-22 03:41:01','maisie@gmail.com','Maisie','female','Williams','$2a$10$7hRX7JFC2YxWGnqJB2YmcuUFk49ZwA0UoHaOh1STieNLHv0t4P/f6','9876543210','maisie@gmail.com',0),(5,'2019-04-22 11:30:32','2019-04-22 11:30:32','check@gmail.com','Check','male','User','$2a$10$HNSgCtKYUDywlTFWIhatd.fyt56XdKJGRf2Hbbof6WQX5SKnLl6Na','9876543210','check@gmail.com',4),(6,'2019-04-25 12:32:53','2019-04-25 12:32:53','john@gmail.com','John','male','Davis','$2a$10$x/GxKCDK0auMPrgiCYWEO.uh0fzSPKtAtg1LdgbQxGk5qYtt8u.F.','1234567890','john@gmail.com',0),(7,'2019-04-26 08:51:37','2019-04-26 08:51:37','priyanshu@gmail.com','Priyanshu','male','Pratihar','$2a$10$mz37L4bJFVTkgT9JgHgb5OFJr7I3DW3g1PP9nTvITWmhXzyKgnog6','8910681981','priyanshu@gmail.com',0),(8,'2019-04-26 09:24:40','2019-04-26 09:24:40','deboparna.chakraborty1996@gmail.com','Debaparna','female','Chakraborty','$2a$10$fb52Y1S/6I03Dn3PrL7Hv.VN2Y93ja9IZ57OnxZHN0YJGddv9oHKC','9163511196','deboparna.chakraborty1996@gmail.com',0),(9,'2019-04-26 09:40:30','2019-04-26 09:40:30','braja@gmail.com','Braja','male','Maity','$2a$10$lmK8xr2UhgTOIrKZDm.wEuM6lNL9KrRjSrqsOT1GAgij6vLQ9o/1G','9876543210','braja@gmail.com',4),(10,'2019-04-26 09:42:30','2019-04-26 09:42:30','rai@gmail.com','Rai','female','Chakraborty','$2a$10$79DvWw5vYRB.s3S4A8uQ3O/tBVrn1CmswcIPumC8egRxJjuRncxOu','9163511196','rai@gmail.com',4),(11,'2019-04-26 09:43:08','2019-04-26 09:43:08','pooja@gmail.com','Pooja','female','Chidrawar','$2a$10$EVfysSTRnVYkW6OfNTuy0.H05EuWiu1YChs.w2YFVjdN9.3EtJ2Cm','7645323456','pooja@gmail.com',0),(12,'2019-04-26 09:45:06','2019-04-26 09:45:06','shivamtayal00@gmail.com','Shivam ','male','Tayal','$2a$10$Dp2adwIagsgG7mfiB62n7uzTw5D1FxxvXVSzZfdhfVLPl72SsxS.G','8266060242','shivamtayal00@gmail.com',0),(13,'2019-04-26 09:49:03','2019-04-26 09:49:03','divya@gmail.com','Divya','female','Nagireddy','$2a$10$2ZTBIryHQtLvRur2eYoos.Pp97SFrOBbbfRHY8DQoEdcV107.8kNO','9876543210','divya@gmail.com',28),(14,'2019-04-26 10:00:18','2019-04-26 10:00:18','pallavi@gmail.com','Pallavi','female','Pattikunta','$2a$10$IANaZDUCV/9NcKeAbiTlfOao5uD7FYdBnWg1zRgQofI/qDZ6UTbQq','9876543245','pallavi@gmail.com',4);
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

-- Dump completed on 2019-04-28 23:09:56
