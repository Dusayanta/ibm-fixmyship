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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,'2019-04-29 11:20:28','2019-04-29 11:20:28',7,7,'It’s better to discuss with her about the issue rather than not talking to her anymore, because if you don’t talk with her or any of them without saying anything it may lead to misunderstandings, so you should let her/them know what you are feeling exactly.  ',2,7,3,0,'Priyanshu'),(2,'2019-04-29 11:22:35','2019-04-29 11:22:35',13,13,'It’s important to discuss it with him to be aware of the problems he’s facing or if there anyother hidden reason attached to it.Since you don’t know whether they met accidentally orpurposely, making an assumption about this would be a waste of time.It\'s better if you cancommunicate with him regarding the whole issue and try to understand his side of the story.Even if they would have met purposely, try to peacefully ask your husband about the reasonfor it.Support him if you find the reason to be valid and if not, make him realize how it couldaffect your relationship.Developing a healthy communication and emotional intimacy canhelp you stay close to your husband. This will help you gain his trust and chances are hewould be comfortable in sharing the reason for meeting his ex-wife.',1,13,2,0,'Divya'),(3,'2019-04-29 11:22:51','2019-04-29 11:22:51',11,11,'If you don’t feel comfortable with her, then don’t think more about her. If she can not understand you, your feelings and your friendship, just ignore her and think anything else instead of her.\n\n',2,11,3,0,'Pooja'),(4,'2019-04-29 11:22:53','2019-04-29 11:22:53',8,8,'I think  if you really liked talking to her, you should speak with her about your problem with her. You should discuss with her that you get hurt because of her again and again, tell her that because of her behavior you feel unhappy in front of group members. Also you can suggest her that don’t make you a butt of her jokes.',2,8,2,0,'Debaparna'),(5,'2019-04-29 11:23:47','2019-04-29 11:23:47',1,1,'I think you two are not spending time with each other. That’s why your communication is not getting the shape. First you need to spend some time with each other. Communication will take place automatically.',3,1,3,0,'Dusayanta'),(6,'2019-04-29 11:24:14','2019-04-29 11:24:14',7,7,'I can understand what you are going through now. But you know what you cannot control anyone’s feeling. You talk to him. If he really wants to go back to his ex-wife or not. Then you take your decision.  Your life is your life.. Don’t let your life to be stopped for his playing mind.',1,7,1,0,'Priyanshu'),(7,'2019-04-29 11:25:07','2019-04-29 11:25:07',7,7,'Communication plays major role in any relationship, so its better to share each other thoughts.',3,7,2,0,'Priyanshu'),(8,'2019-04-29 11:25:33','2019-04-29 11:25:33',11,11,'You need to feel comfortable laying bare your problems and frustrations with your partner.',3,11,2,0,'Pooja'),(9,'2019-04-29 11:26:06','2019-04-29 11:26:06',14,14,'I think you two are not spending time with each other. That’s why your communication is not getting the shape. First you need to spend some time with each other. Communication will take place automatically.',3,14,0,0,'Pallavi'),(10,'2019-04-29 11:28:16','2019-04-29 11:28:16',1,1,'Just ask him calmly. What is actually happening. Otherwise he will never tell you the truth. ',1,1,2,0,'Dusayanta');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dislikes`
--

LOCK TABLES `dislikes` WRITE;
/*!40000 ALTER TABLE `dislikes` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,'2019-04-29 11:21:33','2019-04-29 11:21:33',1,1,1,1),(2,'2019-04-29 11:23:03','2019-04-29 11:23:03',11,11,1,11),(3,'2019-04-29 11:23:10','2019-04-29 11:23:10',8,8,1,8),(4,'2019-04-29 11:23:13','2019-04-29 11:23:13',8,8,3,8),(5,'2019-04-29 11:23:38','2019-04-29 11:23:38',7,7,3,7),(6,'2019-04-29 11:24:01','2019-04-29 11:24:01',14,14,2,14),(7,'2019-04-29 11:24:06','2019-04-29 11:24:06',8,8,5,8),(8,'2019-04-29 11:24:59','2019-04-29 11:24:59',8,8,4,8),(9,'2019-04-29 11:25:45','2019-04-29 11:25:45',8,8,7,8),(10,'2019-04-29 11:25:46','2019-04-29 11:25:46',8,8,8,8),(11,'2019-04-29 11:25:54','2019-04-29 11:25:54',8,8,2,8),(12,'2019-04-29 11:25:55','2019-04-29 11:25:55',8,8,6,8),(13,'2019-04-29 11:25:57','2019-04-29 11:25:57',7,7,5,7),(14,'2019-04-29 11:26:03','2019-04-29 11:26:03',1,1,3,1),(15,'2019-04-29 11:26:06','2019-04-29 11:26:06',1,1,4,1),(16,'2019-04-29 11:28:31','2019-04-29 11:28:31',8,8,10,8),(17,'2019-04-29 11:28:39','2019-04-29 11:28:39',1,1,7,1),(18,'2019-04-29 11:28:45','2019-04-29 11:28:45',1,1,8,1),(19,'2019-04-29 11:28:52','2019-04-29 11:28:52',11,11,10,11),(20,'2019-04-29 11:30:48','2019-04-29 11:30:48',11,11,5,11);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'2019-04-29 11:19:35','2019-04-29 11:19:35',14,14,'He told me he was in Client meet. But no. He was spending quality time with his ex-wife. I saw them when I went out for shopping. He broke my trust. He broke my heart.','I accidentally saw him spending quality time with his ex wife.',14,3,'Pallavi','N'),(2,'2019-04-29 11:19:57','2019-04-29 11:19:57',1,1,'The situation is kinda frustrating to me. There\'s this girl that I\'ve known since 2 years ago. We haven\'t spoken much until recently of late last year in terms of being around the same group of friends. I got to know her a little bit better after talking for some time and I did develop an interest in her, but I found out she was involved with someone so I pulled back my interest for her. That being said, it still didn\'t mean that I had to stop talking to her at all because I did enjoy conversing with her about different topics and the like. That went on for awhile. Now, the issue that comes up is that after talking with one of my guy friends, I found out that she thinks I\'m like deep in love with her. She\'s slightly annoyed by it and feels like I can\'t take a hint. I\'m also told she\'s weary around me because she doesn\'t want me to ask her out. And she\'s talked to pretty much the rest of the group about it, so now its just been some kind of running gag with me being the butt of the joke. And I feel personally offended by this because I\'ve always thought that I was just being cool with her. Yes, I liked talking to her but I never asked her out or anything. I don\'t even remember complimenting her or making a pass at her ever. It also makes me feel bad because I was actually trying to do the thing people think guys cannot do and that\'s just be platonic friends with a person. But to make me out to be some love struck puppy and probably have a laugh at my expense behind my back? Gotta say, 0/10, wouldn\'t recommend. So now I\'m wondering what should I do, if anything? I\'m partial to just not talking to her or any of them anymore. That\'ll clear up all this mess in one go. But I also want to be mature and try to address the situation, but I feel like its hopeless at this point.','Girl[F/20] is convinced that I\'m[M/20] strongly interested in her when I\'m not and its caused an uncomfortable situation for me within our social group. Should I address her, the situation, or just leave it all alone?',1,3,'Dusayanta','N'),(3,'2019-04-29 11:21:47','2019-04-29 11:31:29',8,8,'There is something which is acting as the hindrance between us. We want to share our thoughts, but don’t know why it is not happening. I can understand that he wants to say something to me. But he cannot. Even the scenario is same for me. I am not able to share the things with him. Can anyone please suggest what should we do?','Can’t open up to each other',8,4,'Debaparna','Y');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solution`
--

LOCK TABLES `solution` WRITE;
/*!40000 ALTER TABLE `solution` DISABLE KEYS */;
INSERT INTO `solution` VALUES (1,'2019-04-29 11:25:50','2019-04-29 11:25:50',1,1,4,2),(2,'2019-04-29 11:26:00','2019-04-29 11:26:00',1,1,1,2),(3,'2019-04-29 11:31:21','2019-04-29 11:31:21',8,8,5,3);
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
INSERT INTO `user_roles` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'2019-04-19 04:00:12','2019-04-19 04:00:12','dusayantaprasad@gmail.com','Dusayanta','male','Prasad','$2a$10$7Dpyn5fX8LrYbnbpfVbun.ehffm4WS/2EPjaVdrgfXJ.hCUX5qwRe','9007959410','dusayantaprasad@gmail.com',10),(2,'2019-04-19 04:07:20','2019-04-19 04:07:20','jayson@gmail.com','Jayson','male','Bourne','$2a$10$T4Mv2tIlSPFhE3VOaUP4NuXsh0WCJ2nPYGy/CTtA0es.uBABoEsyS','9876543210','jayson@gmail.com',0),(3,'2019-04-21 16:51:29','2019-04-21 16:51:29','sam@gmail.com','Samuel','male','Jackson','$2a$10$.FCXNcbPvqPGHNNs.LPEY.r9/RGvEnh4WMzR.OwfM0tVQ2YF1RHq.','7073341205','sam@gmail.com',0),(4,'2019-04-22 03:41:01','2019-04-22 03:41:01','maisie@gmail.com','Maisie','female','Williams','$2a$10$7hRX7JFC2YxWGnqJB2YmcuUFk49ZwA0UoHaOh1STieNLHv0t4P/f6','9876543210','maisie@gmail.com',0),(5,'2019-04-22 11:30:32','2019-04-22 11:30:32','check@gmail.com','Check','male','User','$2a$10$HNSgCtKYUDywlTFWIhatd.fyt56XdKJGRf2Hbbof6WQX5SKnLl6Na','9876543210','check@gmail.com',0),(6,'2019-04-25 12:32:53','2019-04-25 12:32:53','john@gmail.com','John','male','Davis','$2a$10$x/GxKCDK0auMPrgiCYWEO.uh0fzSPKtAtg1LdgbQxGk5qYtt8u.F.','1234567890','john@gmail.com',0),(7,'2019-04-26 08:51:37','2019-04-26 08:51:37','priyanshu@gmail.com','Priyanshu','male','Pratihar','$2a$10$mz37L4bJFVTkgT9JgHgb5OFJr7I3DW3g1PP9nTvITWmhXzyKgnog6','8910681981','priyanshu@gmail.com',12),(8,'2019-04-26 09:24:40','2019-04-26 09:24:40','deboparna.chakraborty1996@gmail.com','Debaparna','female','Chakraborty','$2a$10$fb52Y1S/6I03Dn3PrL7Hv.VN2Y93ja9IZ57OnxZHN0YJGddv9oHKC','9163511196','deboparna.chakraborty1996@gmail.com',4),(9,'2019-04-26 09:40:30','2019-04-26 09:40:30','braja@gmail.com','Braja','male','Maity','$2a$10$lmK8xr2UhgTOIrKZDm.wEuM6lNL9KrRjSrqsOT1GAgij6vLQ9o/1G','9876543210','braja@gmail.com',0),(10,'2019-04-26 09:42:30','2019-04-26 09:42:30','rai@gmail.com','Rai','female','Chakraborty','$2a$10$79DvWw5vYRB.s3S4A8uQ3O/tBVrn1CmswcIPumC8egRxJjuRncxOu','9163511196','rai@gmail.com',0),(11,'2019-04-26 09:43:08','2019-04-26 09:43:08','pooja@gmail.com','Pooja','female','Chidrawar','$2a$10$EVfysSTRnVYkW6OfNTuy0.H05EuWiu1YChs.w2YFVjdN9.3EtJ2Cm','7645323456','pooja@gmail.com',10),(12,'2019-04-26 09:45:06','2019-04-26 09:45:06','shivamtayal00@gmail.com','Shivam ','male','Tayal','$2a$10$Dp2adwIagsgG7mfiB62n7uzTw5D1FxxvXVSzZfdhfVLPl72SsxS.G','8266060242','shivamtayal00@gmail.com',0),(13,'2019-04-26 09:49:03','2019-04-26 09:49:03','divya@gmail.com','Divya','female','Nagireddy','$2a$10$2ZTBIryHQtLvRur2eYoos.Pp97SFrOBbbfRHY8DQoEdcV107.8kNO','9876543210','divya@gmail.com',4),(14,'2019-04-26 10:00:18','2019-04-26 10:00:18','pallavi@gmail.com','Pallavi','female','Pattikunta','$2a$10$IANaZDUCV/9NcKeAbiTlfOao5uD7FYdBnWg1zRgQofI/qDZ6UTbQq','9876543245','pallavi@gmail.com',0),(15,'2019-04-29 04:01:49','2019-04-29 04:01:49','cr.jaicreative@gmail.com','RAMESH','male','NC','$2a$10$rVh7l9RP/IjpNSJCIu8nAev37TErxu8L3o9Fv.9sjvgpopsOAeQVK','9840936599','cr.jaicreative@gmail.com',0),(16,'2019-04-29 04:10:22','2019-04-29 04:10:22','ASWATH.123@GMAIL.COM','ASHWATH','male','RAMESH','$2a$10$CsiXCLJFaqyABP0RmYxhreN8tHSjCMydPmfzWXWC8x0kmaKRDBEuO','9876543210','ASWATH.123@GMAIL.COM',0),(17,'2019-04-29 07:26:08','2019-04-29 07:26:08','sriram.mahesh@gmail.com','SRIRAM','male','MAHESH','$2a$10$S/FwQfwipR/f4au0BCq9I.27AAK1iTMoOp21zOb7sroQuQ06uDkyW','8910681981','sriram.mahesh@gmail.com',0);
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

-- Dump completed on 2019-04-29 17:33:32
