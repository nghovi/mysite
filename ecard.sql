-- MySQL dump 10.13  Distrib 5.5.46, for Linux (x86_64)
--
-- Host: localhost    Database: ecard
-- ------------------------------------------------------
-- Server version	5.5.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permission_group_id_689710a9a73b7457_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth__content_type_id_508cf46651277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add token',7,'add_token'),(20,'Can change token',7,'change_token'),(21,'Can delete token',7,'delete_token'),(22,'Can add link',8,'add_link'),(23,'Can change link',8,'change_link'),(24,'Can delete link',8,'delete_link'),(25,'Can add book',9,'add_book'),(26,'Can change book',9,'change_book'),(27,'Can delete book',9,'delete_book'),(28,'Can add word',10,'add_word'),(29,'Can change word',10,'change_word'),(30,'Can delete word',10,'delete_word'),(31,'Can add phrase',11,'add_phrase'),(32,'Can change phrase',11,'change_phrase'),(33,'Can delete phrase',11,'delete_phrase'),(34,'Can add task',12,'add_task'),(35,'Can change task',12,'change_task'),(36,'Can delete task',12,'delete_task'),(37,'Can add motto',13,'add_motto'),(38,'Can change motto',13,'change_motto'),(39,'Can delete motto',13,'delete_motto'),(40,'Can add note',14,'add_note'),(41,'Can change note',14,'change_note'),(42,'Can delete note',14,'delete_note'),(43,'Can add user preference',15,'add_userpreference'),(44,'Can change user preference',15,'change_userpreference'),(45,'Can delete user preference',15,'delete_userpreference');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$20000$E9nJ0zlvgH4E$7XUc3AhiPPruhS+P1YVnSrt9fYZeDaSQpOLzjabofHw=','2016-04-15 08:45:35',1,'admin','','','vietnh90@gmail.com',1,1,'2016-03-14 07:36:53'),(2,'pbkdf2_sha256$20000$PqBEt3CdlI07$FmARyNFt0iFCuyFHyVvU4c5EWtkFJN3Wuv3g9X0zC70=',NULL,0,'ecard','','','',0,1,'2016-03-14 07:40:39');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_33ac548dcf5f8e37_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_4b5ed4ffdb8fd9b0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_permissi_user_id_7f0938558328534a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authtoken_token`
--

DROP TABLE IF EXISTS `authtoken_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authtoken_token` (
  `key` varchar(40) NOT NULL,
  `created` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`key`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `authtoken_token_user_id_1d10c57f535fb363_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authtoken_token`
--

LOCK TABLES `authtoken_token` WRITE;
/*!40000 ALTER TABLE `authtoken_token` DISABLE KEYS */;
INSERT INTO `authtoken_token` VALUES ('e21928c9a5bd663e50799b0a9e34b22ae9004442','2016-03-14 07:40:50',1);
/*!40000 ALTER TABLE `authtoken_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `djang_content_type_id_697914295151027a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `djang_content_type_id_697914295151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2016-03-14 07:40:39','2','ecard',1,'',4,1),(2,'2016-03-30 01:52:56','7','Task object',1,'',12,1),(3,'2016-04-28 07:38:55','167','Word object',1,'',10,1),(4,'2016-04-28 07:54:15','167','Word object',2,'No fields changed.',10,1),(5,'2016-04-28 07:54:49','168','Word object',1,'',10,1),(6,'2016-04-28 08:01:54','168','Word object',2,'No fields changed.',10,1),(7,'2016-04-28 08:02:20','169','Word object',1,'',10,1),(8,'2016-04-28 08:13:21','169','Word object',2,'No fields changed.',10,1),(9,'2016-04-28 08:13:41','170','Word object',1,'',10,1),(10,'2016-04-28 08:13:51','171','Word object',1,'',10,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_45f3b1d93ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(7,'authtoken','token'),(5,'contenttypes','contenttype'),(9,'ecard','book'),(8,'ecard','link'),(13,'ecard','motto'),(14,'ecard','note'),(11,'ecard','phrase'),(12,'ecard','task'),(15,'ecard','userpreference'),(10,'ecard','word'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2016-03-14 07:33:21'),(2,'auth','0001_initial','2016-03-14 07:33:21'),(3,'admin','0001_initial','2016-03-14 07:33:21'),(4,'contenttypes','0002_remove_content_type_name','2016-03-14 07:33:21'),(5,'auth','0002_alter_permission_name_max_length','2016-03-14 07:33:21'),(6,'auth','0003_alter_user_email_max_length','2016-03-14 07:33:21'),(7,'auth','0004_alter_user_username_opts','2016-03-14 07:33:21'),(8,'auth','0005_alter_user_last_login_null','2016-03-14 07:33:21'),(9,'auth','0006_require_contenttypes_0002','2016-03-14 07:33:21'),(10,'authtoken','0001_initial','2016-03-14 07:33:21'),(11,'sessions','0001_initial','2016-03-14 07:33:21');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('2dyohr8msyrwzpc1uzhkh2ipluvnqc7g','MTdiZTdkMWNmNWRkZTQ1OTQ5NjgzMGY4ZjYzMzA3OGY2ZTY2MWUxYzp7Il9hdXRoX3VzZXJfaGFzaCI6ImQyNWMxODJmZTA1YzEyNWNjZWI4NTZmMTE3YzY5M2FhNmE3YTc0YTAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-04-29 08:45:35'),('cht2rh95ikmnf6y12hp2qnrs7vb5pqyj','MTdiZTdkMWNmNWRkZTQ1OTQ5NjgzMGY4ZjYzMzA3OGY2ZTY2MWUxYzp7Il9hdXRoX3VzZXJfaGFzaCI6ImQyNWMxODJmZTA1YzEyNWNjZWI4NTZmMTE3YzY5M2FhNmE3YTc0YTAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-04-13 01:50:51'),('nc0sv34wnd3bus31ws5sy72c0w8mfqso','MTdiZTdkMWNmNWRkZTQ1OTQ5NjgzMGY4ZjYzMzA3OGY2ZTY2MWUxYzp7Il9hdXRoX3VzZXJfaGFzaCI6ImQyNWMxODJmZTA1YzEyNWNjZWI4NTZmMTE3YzY5M2FhNmE3YTc0YTAiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2016-03-28 07:40:21');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecard_book`
--

DROP TABLE IF EXISTS `ecard_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ecard_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `iconurl` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `author` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `comment` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `link_id` int(11) DEFAULT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ecard_book_link_id_215f3ffae18f67d5_fk_ecard_link_id` (`link_id`),
  CONSTRAINT `ecard_book_link_id_215f3ffae18f67d5_fk_ecard_link_id` FOREIGN KEY (`link_id`) REFERENCES `ecard_link` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecard_book`
--

LOCK TABLES `ecard_book` WRITE;
/*!40000 ALTER TABLE `ecard_book` DISABLE KEYS */;
INSERT INTO `ecard_book` VALUES (1,'https://upload.wikimedia.org/wikipedia/en/thumb/7/79/To_Kill_a_Mockingbird.JPG/220px-To_Kill_a_Mockingbird.JPG','Harper Lee','To Kill A Mockingbird','',1,'2016-03-14 07:41:33','2016-03-30 07:03:38'),(2,'https://www.eslpod.com/website/images/new_logo.gif','Jeff McQuillance','ESL','My first English epidsodes',2,'2016-03-14 07:53:12','2016-04-28 07:32:07'),(4,'','viet nguyen','Toeic Exam','',4,'2016-03-15 03:51:47','2016-03-21 06:11:06'),(5,'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSRWx8jArrC0Wm-0KsmXsAf405je-BEQiCkdM0tSwAfga2ZUqpPe9FuQv0','World Wide Web','Article','',5,'2016-03-16 02:30:14','2016-03-28 09:34:23'),(6,'http://developer.android.com/assets/images/android_logo.png','google.com','The Android','I\'m going to read this big book for learning not only android ecosystem but english',6,'2016-03-18 10:02:38','2016-03-24 03:05:58'),(8,'http://www.101languages.net/images/flags/90px/japanese.png','web','Japanese 101','',8,'2016-03-29 10:10:53','2016-03-31 03:07:32'),(9,'https://upload.wikimedia.org/wikipedia/en/9/98/Lowry_gathering_blue_cover.jpg','Lois Lowry','Gathering Blue','',9,'2016-03-30 06:24:57','2016-03-30 06:58:31'),(10,'https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/Poster_-_Gone_With_the_Wind_01.jpg/220px-Poster_-_Gone_With_the_Wind_01.jpg','Margaret Mitchell','Gone with the wind','The longest novel i ever read.\nThe most expensive book i ever bought.',10,'2016-03-30 06:27:07','2016-04-19 07:15:01'),(11,'http://akamaicovers.oreilly.com/images/9780596007126/cat.gif','Eric Freeman, Elisabeth Freeman, Bert Bates, Kathy Sierra','Head First Design Pattern','',11,'2016-03-30 07:02:08','2016-03-30 07:05:47'),(12,'https://upload.wikimedia.org/wikipedia/en/c/c3/Sachar_-_Holes_Coverart.png','Louis Sachar','Holes','One of my favourite book. The book that started my interest in reading English book. Though i had to struggled a lot finishing it, I did and i loved reading English book since then',12,'2016-03-30 07:17:38','2016-03-30 07:19:09'),(14,'','Nguyen Hoang Viet','Life','YOLO',14,'2016-03-30 07:21:20','2016-04-15 09:56:33'),(16,'','John Green','Looking for Alaska','',16,'2016-03-30 07:23:18','2016-03-30 07:23:18'),(18,'https://upload.wikimedia.org/wikipedia/en/c/c4/TheAlchemist.jpg','Paulo Coelho','The Alchemist','The fiction about the shepherd',18,'2016-04-22 06:13:08','2016-04-22 06:30:17'),(19,'https://upload.wikimedia.org/wikipedia/en/thumb/b/be/Outliers.png/220px-Outliers.png','Malcolm Gladwell','Outliers','the biggest misconception about success is that we do it solely on our smarts, ambition, hustle and hard work',19,'2016-04-22 06:32:53','2016-04-26 06:28:49');
/*!40000 ALTER TABLE `ecard_book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecard_link`
--

DROP TABLE IF EXISTS `ecard_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ecard_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecard_link`
--

LOCK TABLES `ecard_link` WRITE;
/*!40000 ALTER TABLE `ecard_link` DISABLE KEYS */;
INSERT INTO `ecard_link` VALUES (1,'https://en.wikipedia.org/wiki/To_Kill_a_Mockingbird','Link of Book To Kill A Mockingbird',0,'2016-03-14 07:41:33','2016-03-30 07:03:38'),(2,'https://www.eslpod.com','Link of Book ESL',0,'2016-03-14 07:53:12','2016-04-28 07:32:07'),(3,'','Link of Book ESL',0,'2016-03-14 07:53:13','2016-03-14 07:53:13'),(4,'','Link of Book Toeic Exam',0,'2016-03-15 03:51:47','2016-03-21 06:11:06'),(5,'https://en.wikipedia.org/wiki/World_Wide_Web','Link of Book Article',0,'2016-03-16 02:30:14','2016-03-28 09:34:23'),(6,'','Link of Book The Android',0,'2016-03-18 10:02:38','2016-03-24 03:05:58'),(7,'','Link of Book Japanese 101',0,'2016-03-29 10:10:31','2016-03-29 10:10:31'),(8,'http://www.japanesepod101.com/','Link of Book Japanese 101',0,'2016-03-29 10:10:53','2016-03-31 03:07:32'),(9,'https://en.wikipedia.org/wiki/Gathering_Blue','Link of Book Gathering Blue',0,'2016-03-30 06:24:57','2016-03-30 06:58:31'),(10,'https://en.wikipedia.org/wiki/Gone_with_the_Wind','Link of Book Gone with the wind',0,'2016-03-30 06:27:07','2016-04-19 07:15:01'),(11,'http://www.amazon.com/Head-First-Design-Patterns-Freeman/dp/0596007124','Link of Book Head First Design Pattern',0,'2016-03-30 07:02:08','2016-03-30 07:05:47'),(12,'https://en.wikipedia.org/wiki/Holes_(novel)','Link of Book Holes',0,'2016-03-30 07:17:38','2016-03-30 07:19:09'),(13,'','Link of Book Life',0,'2016-03-30 07:19:57','2016-03-30 07:19:57'),(14,'','Link of Book Life',0,'2016-03-30 07:21:20','2016-04-15 09:56:33'),(15,'','Link of Book LIFE',0,'2016-03-30 07:22:04','2016-03-30 07:22:04'),(16,'','Link of Book Looking for Alaska',0,'2016-03-30 07:23:18','2016-03-30 07:23:18'),(17,'ss','Link of Book aa',0,'2016-03-30 07:23:51','2016-03-30 07:23:51'),(18,'https://en.wikipedia.org/wiki/The_Alchemist_(novel)','Link of Book The Alchemist',0,'2016-04-22 06:13:08','2016-04-22 06:30:17'),(19,'https://en.wikipedia.org/wiki/Outliers_(book)','Link of Book Outliers',0,'2016-04-22 06:32:53','2016-04-26 06:28:49');
/*!40000 ALTER TABLE `ecard_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecard_motto`
--

DROP TABLE IF EXISTS `ecard_motto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ecard_motto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `mottotype` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecard_motto`
--

LOCK TABLES `ecard_motto` WRITE;
/*!40000 ALTER TABLE `ecard_motto` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecard_motto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecard_note`
--

DROP TABLE IF EXISTS `ecard_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ecard_note` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `notetype` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecard_note`
--

LOCK TABLES `ecard_note` WRITE;
/*!40000 ALTER TABLE `ecard_note` DISABLE KEYS */;
INSERT INTO `ecard_note` VALUES (1,'What a beautiful girl she is',0,'2016-03-14 07:48:41','2016-03-14 07:48:41'),(2,'http://www.lifehack.org/376369/100-inspirational-quotes-that-will-give-you-strength-during-hard-times?mid=20160315&ref=mail&uid=464409&feq=daily',0,'2016-03-16 01:58:24','2016-03-16 01:58:24'),(3,'There is a huge different between android development with design pattern. But i will try to apply Design Pattern to it',0,'2016-03-24 03:08:16','2016-03-24 03:08:16'),(4,'20 ga imasu \nKyorai, Imotto, Ottoto, ane, ani, akachan \nDobotsu, Raimon, gorira \n\nDobotsu ga imasuka? \nAsoko Raimon ga imasu \nAh,  Raimon no akachan mo imasu ne \nKawai \nGorira ga arimasu \nDoko? \nKoko desu \nE, boku? Haha',0,'2016-04-02 01:15:04','2016-04-02 01:15:04'),(5,'9\nKore WA okashi desu ka \nSou desu,  yokan desu \nKore WA sakana desu ka?',0,'2016-04-03 01:31:16','2016-04-03 01:31:16'),(6,'Adult image app',0,'2016-04-12 05:51:18','2016-04-12 05:51:18'),(7,'image load error: restart server by Ctrl C then react-native start\nconstructor vs setInitState: http://stackoverflow.com/questions/30668326/what-is-the-difference-between-using-constructor-vs-getinitialstate-in-react-r\n\ncreateClass(setInitState ec5) vs extends Component(ec6 constructor with super): create class by extending Component don\'t bind methods: http://stackoverflow.com/questions/31986126/this-refs-is-getting-undefined-in-method\n\nstate vs props: https://github.com/uberVU/react-guide/blob/master/props-vs-state.md\n\nuse console.warn, console.error to log onto simulator. But now console.error dont work ?\n\njs base 64 encode https://github.com/facebook/react-native/issues/1023\n\nsetStart({token: value}) works but this.state.token = value dont. use () for complex View\n\nThis is a destructuring assignment, which lets you extract multiple object properties and assign them to variables using a single statement\n\nes6:  import * as reducers from \'./reducers\': means get all files in folder reducers into an object reducers which has keys are name of files\n\nnpm install module_name --save(add to package.json)\n\nError: Requiring module \"NativeModules\" which threw an exception: delete node_moduels/react-native, reinstall it, then cd to it then run npm install within node_modules/react-native/',0,'2016-04-19 04:28:27','2016-04-19 07:08:21');
/*!40000 ALTER TABLE `ecard_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecard_phrase`
--

DROP TABLE IF EXISTS `ecard_phrase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ecard_phrase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `word_id` int(11) DEFAULT NULL,
  `content` varchar(2000) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ecard_phrase_word_id_37fa866c224149cf_fk_ecard_word_id` (`word_id`),
  CONSTRAINT `ecard_phrase_word_id_37fa866c224149cf_fk_ecard_word_id` FOREIGN KEY (`word_id`) REFERENCES `ecard_word` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecard_phrase`
--

LOCK TABLES `ecard_phrase` WRITE;
/*!40000 ALTER TABLE `ecard_phrase` DISABLE KEYS */;
INSERT INTO `ecard_phrase` VALUES (1,1,'what you\'re response to gov accuse','2016-03-14 08:02:56','2016-03-14 08:02:56'),(2,2,'kill someone or didn\'t do it on purpose. An example of plea agreement','2016-03-14 08:03:52','2016-03-14 08:03:52'),(3,3,'situations that make your crime less severely punished','2016-03-14 08:06:37','2016-03-14 08:06:37'),(4,4,'This invoice has to be paid within 2 weeks','2016-03-15 03:52:24','2016-03-15 03:52:24'),(5,7,'Whether you\'re accepted or not will be decided after a period of probation','2016-03-15 03:56:34','2016-03-15 03:56:34'),(6,8,'The personnel in the sales department are highly qualified','2016-03-15 03:57:20','2016-03-15 03:57:20'),(7,9,'Anyone with at least 2 years\' managerial experience can apply for the job','2016-03-15 03:58:35','2016-03-15 03:58:35'),(8,10,'He is the sole proprietor of this luxurious restaurant','2016-03-15 03:59:23','2016-03-15 03:59:23'),(9,11,'All employees have just been informed that the meeting is adjourned until tomorrow afternoon','2016-03-15 04:01:44','2016-03-15 04:01:44'),(10,12,'Due to the company\'s cost reduction policy, 50 employees will be laid off','2016-03-15 04:02:25','2016-03-15 04:02:25'),(11,13,'The new policy will enable women on maternity leave to raise their children better','2016-03-15 04:03:28','2016-03-15 04:03:28'),(12,14,'Bank tellers are responsible for dealing with customers, receiving and paying out money in bank. Banker is the owner, founder of the bank','2016-03-15 04:09:34','2016-03-15 04:09:34'),(13,15,'My bank statement of the last six months was sent to my email this morning','2016-03-15 04:10:31','2016-03-15 04:10:31'),(14,16,'There is no money left in my checking account. Jeny opened a savings account 2 months ago','2016-03-15 04:11:46','2016-03-15 04:11:46'),(15,17,'She deposits a third of her salary into her savings account each month','2016-03-15 04:12:27','2016-03-15 04:12:27'),(16,18,'Our company\'s accounts are audited annually','2016-03-15 04:13:12','2016-03-15 04:13:12'),(17,19,'His corporation\'s turnover reached $70 million last year','2016-03-15 04:14:12','2016-03-15 04:14:12'),(18,20,'The director has decided to reduce the advertising expenditure for the rest of this year','2016-03-15 04:15:09','2016-03-15 04:15:09'),(19,21,'Five dollars will be deducted from every employee\'s salary to raise the fund for the poor','2016-03-15 04:16:05','2016-03-15 04:16:05'),(20,22,'companies have to spend a lot of money on buying airtime for their product advertisement on the major tv channels','2016-03-15 04:18:28','2016-03-15 04:18:28'),(21,23,'Vietnamese student often distribute leaflet to passers-by as a way of getting money','2016-03-15 04:21:51','2016-03-15 04:21:51'),(22,25,'a lot of magazines are arranged neatly on the rack','2016-03-15 06:05:44','2016-03-15 06:05:44'),(23,26,'The clothes company Savy has just opened a new outlet on this street','2016-03-15 06:06:54','2016-03-15 06:06:54'),(24,27,'cashiers work at the counters in supermarkets','2016-03-15 06:08:55','2016-03-15 06:08:55'),(25,28,'He invited his girlfriend to dine out in a luxurious restaurant and then proposed her','2016-03-15 06:09:30','2016-03-15 06:09:30'),(26,29,'In wedding parties, soup is often served as an appetizer','2016-03-15 06:10:07','2016-03-15 06:10:07'),(27,30,'He went out for some refreshments and then returned  to his office to work all night long','2016-03-15 06:11:38','2016-03-15 06:11:38'),(28,31,'I called the box office to book 2 flight tickets','2016-03-15 06:13:14','2016-03-15 06:13:14'),(29,32,'You can put your luggage in the overhead compartment or under your seat','2016-03-15 06:15:10','2016-03-15 06:15:10'),(30,33,'When you fly over several time zones, you may suffer from jet lag when you arrive','2016-03-15 06:17:20','2016-03-15 06:17:20'),(31,34,'More and more condominium have been built recently to save space, but still many children is living in the slum area','2016-03-15 06:18:27','2016-03-15 06:18:27'),(32,35,'they were evict from the house because they were unable to pay the rent','2016-03-15 06:20:11','2016-03-15 06:20:11'),(33,36,'That realtor sold the house at a big profit','2016-03-15 06:21:06','2016-03-15 06:21:06'),(34,37,'There is very little precipitation in the desert','2016-03-15 06:23:00','2016-03-15 06:23:00'),(35,38,'I have never seen such bug hail in my life','2016-03-15 06:23:34','2016-03-15 06:23:34'),(36,39,'Winds from the southeast are bringing muggy weather to the islands','2016-03-15 06:24:43','2016-03-15 06:24:43'),(37,40,'I\'ll not stay at home tomorrow though it\'s predicted to be overcast','2016-03-15 06:26:12','2016-03-15 06:26:12'),(38,41,'They got up early and went for a walk to enjoy the brisk morning wind','2016-03-15 06:26:54','2016-03-15 06:26:54'),(39,42,'These drugs are prescribed for high blood pressure','2016-03-15 06:28:36','2016-03-15 06:28:36'),(40,43,'She was getting lost searching for the right periodical in the library','2016-03-15 06:32:55','2016-03-15 06:32:55'),(41,45,'The people of Burma should be able to decide whether and when to amend the country\'s constitution to alter or remove these provisions','2016-03-16 02:31:40','2016-03-16 02:31:40'),(42,46,'Person who is foot doctor. Disgusting make you feel sick, unpleasant to look at. Corn:','2016-03-16 02:44:27','2016-03-16 02:44:27'),(43,47,'They feel marginalize and they\'re showing their feelings of alienation through their clothes','2016-03-18 06:20:05','2016-03-18 06:20:05'),(44,47,'Nobody is shunning them. They  choose to live on the fringe of society','2016-03-18 06:21:42','2016-03-18 06:21:42'),(45,48,'She was captivated by his disposition and his beauty','2016-03-18 08:30:38','2016-03-18 08:30:38'),(46,49,'To assist us in expediting its return to you, please give us your telephone number','2016-03-18 08:40:37','2016-03-18 08:40:37'),(47,50,'the 9-1-1 system automatically displays and relays your telephone number, address and any other special conditions you need to provide to police, fire or ambulance services dispatched to your location','2016-03-18 08:43:48','2016-03-18 08:43:48'),(48,51,'Apps provide multiple entry points','2016-03-18 10:10:49','2016-03-18 10:10:49'),(49,51,'Apps adapt to different devices','2016-03-18 10:11:10','2016-03-18 10:11:10'),(50,52,'activity, service, content provider and broadcast receiver','2016-03-21 02:11:47','2016-03-21 02:11:47'),(51,52,'If your app starts the activity in the camera app, that activity will run within the process of the camera app, not your app\'s process','2016-03-21 02:12:38','2016-03-21 02:12:38'),(52,52,'Content provider is not activated by intent','2016-03-21 02:18:36','2016-03-21 02:18:36'),(54,52,'Components must be registered in Manifest file, but Broadcast Receiver can be registered dynamically in code','2016-03-21 02:24:33','2016-03-21 02:24:33'),(55,52,'Declaring component capabilities (intent-filter) support the real power of intents which lies in the concept of implicit intents','2016-03-21 02:31:12','2016-03-21 02:31:12'),(56,53,'dp: independent density pixel: virtual pixel: px = dp * (dpi/160)','2016-03-21 02:44:26','2016-03-21 02:44:26'),(57,53,'The mipmap-xxxhdpi qualifier is necessary only to provide a launcher icon that can appear larger than usual on an xxhdpi device. You do not need to provide xxxhdpi assets for all your app\'s images.','2016-03-21 03:10:17','2016-03-21 03:10:17'),(58,54,'avoid deep nested view hierachies','2016-03-21 04:12:48','2016-03-21 04:12:48'),(59,54,'avoid nesting layout_weight','2016-03-21 04:13:15','2016-03-21 04:13:15'),(60,55,'Mr Seo attributed the company\'s strong performance to its business strategy that offered clients integrated logistics solutions','2016-03-21 05:06:12','2016-03-21 05:06:12'),(61,57,'In such tight job market, many creative people draw on their own expertise to come up with a new business idea','2016-03-21 06:03:14','2016-03-21 06:03:14'),(62,58,'Some system permissions implicitly require the availability of a device feature. So to prevent this, we can use required=false i uses-feature tag','2016-03-21 06:20:00','2016-03-21 06:20:00'),(63,59,'At install time, Android gives each package a distinct Linux user ID which remains during the package\'s life on device','2016-03-21 06:40:22','2016-03-21 06:40:22'),(64,60,'Making ListView scrolling smoothy by usingg background thread and ViewHolder DesignPattern','2016-03-22 03:13:06','2016-03-22 03:13:06'),(65,61,'elevation: dp, 3d','2016-03-24 02:38:53','2016-03-24 02:38:53'),(66,61,'App Bar, Menu, Submenu, Nav Drawer, Right drawer, modal bottom sheet, refresh indicator, quick entry/search bar, snack bar','2016-03-24 02:44:43','2016-03-24 02:44:43'),(67,62,'I’m going to visit our daughter. I want to see for myself what kind of hovel she’s living in! \n','2016-03-28 09:04:52','2016-03-28 09:04:52'),(68,63,'SeeSpace InAiR: The world\'s 1st augmented television. How to beat this team ?','2016-03-28 09:34:20','2016-03-28 09:34:20'),(69,64,'sumimasen, taxi nodiba wa doko desu ka','2016-03-29 10:11:46','2016-03-29 10:11:46'),(70,64,'Keyo plaza made onegaishimasu','2016-03-29 10:12:13','2016-03-29 10:12:13'),(71,64,'kokodei','2016-03-29 10:12:20','2016-03-29 10:12:20'),(72,65,'matashitane','2016-03-29 10:12:46','2016-03-29 10:12:46'),(73,65,'sayonara','2016-03-29 10:12:52','2016-03-29 10:12:52'),(75,68,'Had any other man spoken so, Scarlett would have dismissed  such protestations contemptuously as mock modesty and a bid for praise. But Ashley','2016-03-30 06:29:44','2016-03-30 06:29:44'),(76,69,'She was more like her father than her younger sister, for Caroline Irene, was delicate and dreamy, prided herself on her elegance and ladylike deportment','2016-03-30 06:32:47','2016-03-30 06:32:47'),(77,70,'He felt aggrieved, moreover, that Scarlett should still look desolate after being offered the best of the County boys and Tara, too','2016-03-30 06:35:58','2016-03-30 06:35:58'),(78,72,'She could emerge as the mistress of Atlanta\'s largest mansion, the hostess of the town\'s most elaborate entertainments','2016-03-30 06:38:48','2016-03-30 06:38:48'),(79,88,'Rhett Buttler bowed and sauntered off, leaving her with her bosom heaving with impotent rage and indignation','2016-03-30 06:42:23','2016-03-30 06:42:23'),(80,106,'In response to Ellen\'s letters, pleading with her to come home, she wrote minimizing the dangers of the siege, explaining Melanie\'s predicament and promising to come as soon as the baby was born','2016-03-30 06:47:40','2016-03-30 06:47:40'),(81,114,'Everyone thought she had neglected her boy\'s religious education and thought more of Rhett for trying to rectify the matter, even if he did take the boy to..','2016-03-30 06:49:58','2016-03-30 06:49:58'),(82,123,'And lots of times, after one kiss, they fell completely in love with a girl and made most entertaining spectacles of themselves, provided the girl was clever and withheld her kisses after the first one','2016-03-30 06:53:46','2016-03-30 06:53:46'),(83,125,'No one would ever have the temerity to think of Gerald O\'Hara as ridiculous little figure','2016-03-30 06:54:56','2016-03-30 06:54:56'),(84,145,'??????? ??????\n??????menu ??????\n????????? ??????','2016-03-31 02:58:42','2016-03-31 02:58:42'),(85,145,'Taylor San,  ohisasubides\n','2016-03-31 03:06:45','2016-03-31 03:06:45'),(87,66,'Doko ni sundeimasuka','2016-03-31 03:17:15','2016-03-31 03:17:15'),(88,66,'Susin wa doko desu ka ','2016-03-31 03:20:42','2016-03-31 03:20:42'),(89,145,'20: ga imasu \nRaimon,  gorira, dobotsu \nImotto,  Ottoto,  ane, ani, kyorai,  akachan \n\nKyorai ga imasuka? \n\n\n','2016-04-02 01:04:55','2016-04-02 01:04:55'),(90,148,'Liberty Central provide 171 guess rooms and suites, signature bathroom amenities\n','2016-04-06 03:27:38','2016-04-06 03:27:38'),(91,149,'Central Restaurant: 130 seats, all day dining featuring a sumptuous lunch and dinner buffet','2016-04-06 03:29:18','2016-04-06 03:29:18'),(92,150,'Recreation: hair salon with beauty and manicure/pedicure services','2016-04-06 03:30:16','2016-04-06 03:30:16'),(93,151,'Recreation: Fit center with a selection of cardio equipment and both machine and free weights','2016-04-06 03:31:29','2016-04-06 03:31:29'),(94,152,'Better to be an expert at a few things than a mediocre jack of all trades','2016-04-13 06:41:52','2016-04-13 06:41:52'),(95,153,' it\'s recommended to keep PUT requests idempotent. It is strongly recommended to use POST for non-idempotent requests.','2016-04-13 08:47:34','2016-04-13 08:47:34'),(96,154,'Immutable and most similar libraries are orthogonal to Redux','2016-04-14 02:39:07','2016-04-14 02:39:07'),(97,155,'On this page we will only feature a few of them that the Redux maintainers have vetted personally','2016-04-14 02:45:57','2016-04-14 02:45:57'),(98,156,' It\'s easy to conflate the terms “action” and “action creator,”','2016-04-14 02:58:26','2016-04-14 02:58:26'),(99,157,'g this specific middleware, an action creator can return a function instead of an action object. This way, the action creator becomes a thunk','2016-04-15 08:10:29','2016-04-15 08:10:29'),(100,156,'The urban crisis conflates a number of different economic and social issues','2016-04-19 06:24:24','2016-04-19 06:24:24'),(101,158,'Mr Hau is a mason','2016-04-20 02:53:09','2016-04-20 02:53:09'),(102,159,'Finally, a young woman approached who was not dressed in black. She had a vessel on her shoulder, and her head was covered by a veil','2016-04-22 06:24:20','2016-04-22 06:24:20'),(103,160,'The men fell into an animated\ndiscussion. They spoke in an Arabic\ndialect that the boy didn\'t understand,\nbut, when he made to leave','2016-04-22 06:25:06','2016-04-22 06:25:06'),(104,161,'The boy was beginning to\nunderstand that intuition is really a\nsudden immersion of the soul into the\nuniversal current of life, where the\nhistories of all people are connected,\nand we are able to know everything,\nbecause it\'s all written there.\r','2016-04-22 06:26:37','2016-04-22 06:26:37'),(105,162,'The alchemist was ready, and he mounted\nhis own steed and placed the falcon on\nhis left shoulder','2016-04-22 06:27:24','2016-04-22 06:27:24'),(106,163,'There is only one thing that makes a dream impossible to achieve: the fear of failure','2016-04-22 06:29:03','2016-04-22 06:29:03'),(107,161,'The ability of understanding something immediately, without the need of conscious reasoning','2016-04-26 06:04:12','2016-04-26 06:04:12'),(108,164,'test','2016-04-26 06:28:46','2016-04-26 06:28:46'),(109,165,'Once the town was terrorized by a series of morbid\nnocturnal events: people’s chickens and household pets were found mutilated; ','2016-04-26 06:37:14','2016-04-26 06:37:14');
/*!40000 ALTER TABLE `ecard_phrase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecard_task`
--

DROP TABLE IF EXISTS `ecard_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ecard_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `priority` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecard_task`
--

LOCK TABLES `ecard_task` WRITE;
/*!40000 ALTER TABLE `ecard_task` DISABLE KEYS */;
INSERT INTO `ecard_task` VALUES (1,'Go home early','I should go home early today and prepare for the Toeic exam\n(I went home at 6h30, but not prepared much for the exam)',1,1,'2016-03-14 03:40:44','2016-03-14 07:41:01','2016-03-15 03:50:56'),(2,'Go to IIG Vietnam','Go there and register for my second Toeic Exam. The purpose of the exam is none but for a little extra money i get from this company',1,1,'2016-03-16 21:56:14','2016-03-16 01:56:22','2016-03-30 01:49:34'),(3,'android','what is padding and margin symmetry ?',3,0,'2016-03-23 23:45:28','2016-03-24 03:46:08','2016-03-24 03:46:08'),(4,'v note version2','graph',2,1,'2016-03-23 23:46:22','2016-03-24 03:46:58','2016-04-06 01:54:12'),(5,'Enter data','When get bored, transfer data manually from  vnote to vnote v2',3,0,'2016-03-24 05:28:37','2016-03-24 09:29:37','2016-03-24 09:29:37'),(6,'VNote2','After delete book successfully, the book list doesn\'t refresh',3,0,'2016-03-29 21:44:48','2016-03-30 01:45:30','2016-03-30 01:45:30'),(7,'VNote2','Error when enter too much text into task description',3,0,'2016-03-30 01:52:48','2016-03-30 01:52:56','2016-03-30 01:52:56'),(8,'VNote2','Enter too long text in the task description cause making new task fail',3,0,'2016-03-29 22:18:20','2016-03-30 02:19:09','2016-03-30 02:19:09'),(9,'VNote2','After adding new book, list doesn\'t refresh',3,0,'2016-03-30 03:19:55','2016-03-30 07:20:36','2016-03-30 07:20:36'),(10,'VNote2','Pagination cause list book shortened, adapter problem is because i create new ArrayList',2,0,'2016-03-30 04:23:58','2016-03-30 08:29:55','2016-03-30 08:29:55'),(11,'GCM for vnote2','It\'s time to integrate gcm to vnote2',1,0,'2016-04-15 05:59:47','2016-04-15 10:01:24','2016-04-15 10:01:24');
/*!40000 ALTER TABLE `ecard_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecard_userpreference`
--

DROP TABLE IF EXISTS `ecard_userpreference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ecard_userpreference` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `primary_card_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ecard_userpref_primary_card_id_7b86434730bc6189_fk_ecard_link_id` (`primary_card_id`),
  CONSTRAINT `ecard_userpref_primary_card_id_7b86434730bc6189_fk_ecard_link_id` FOREIGN KEY (`primary_card_id`) REFERENCES `ecard_link` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecard_userpreference`
--

LOCK TABLES `ecard_userpreference` WRITE;
/*!40000 ALTER TABLE `ecard_userpreference` DISABLE KEYS */;
/*!40000 ALTER TABLE `ecard_userpreference` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecard_word`
--

DROP TABLE IF EXISTS `ecard_word`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ecard_word` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) DEFAULT NULL,
  `syllabus` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `modified` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ecard_word_book_id_423a0ce440c9547_fk_ecard_book_id` (`book_id`),
  CONSTRAINT `ecard_word_book_id_423a0ce440c9547_fk_ecard_book_id` FOREIGN KEY (`book_id`) REFERENCES `ecard_book` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecard_word`
--

LOCK TABLES `ecard_word` WRITE;
/*!40000 ALTER TABLE `ecard_word` DISABLE KEYS */;
INSERT INTO `ecard_word` VALUES (1,2,'plea','2016-03-14 08:02:56','2016-03-14 08:02:56'),(2,2,'man slaughter','2016-03-14 08:03:52','2016-03-14 08:03:52'),(3,2,'mitigating circumstance','2016-03-14 08:06:37','2016-03-14 08:06:37'),(4,4,'invoice','2016-03-15 03:52:24','2016-03-15 03:52:24'),(5,4,'elevator vs escalator','2016-03-15 03:52:47','2016-03-15 03:52:47'),(6,4,'cover letter vs reference letter','2016-03-15 03:56:06','2016-03-15 03:56:06'),(7,4,'probation','2016-03-15 03:56:34','2016-03-15 03:56:34'),(8,4,'personel','2016-03-15 03:57:20','2016-03-15 03:57:20'),(9,4,'managerial','2016-03-15 03:58:35','2016-03-15 03:58:35'),(10,4,'proprietor','2016-03-15 03:59:23','2016-03-15 03:59:23'),(11,4,'adjourn','2016-03-15 04:01:44','2016-03-15 04:01:44'),(12,4,'lay off','2016-03-15 04:02:25','2016-03-15 04:02:25'),(13,4,'maternity leave','2016-03-15 04:03:28','2016-03-15 04:03:28'),(14,4,'bank teller vs banker','2016-03-15 04:09:34','2016-03-15 04:09:34'),(15,4,'bank statement','2016-03-15 04:10:31','2016-03-15 04:10:31'),(16,4,'checking account vs savingS account','2016-03-15 04:11:46','2016-03-15 04:11:46'),(17,4,'deposit','2016-03-15 04:12:27','2016-03-15 04:12:27'),(18,4,'audit','2016-03-15 04:13:12','2016-03-15 04:13:12'),(19,4,'turnover','2016-03-15 04:14:12','2016-03-15 04:14:12'),(20,4,'expenditure','2016-03-15 04:15:09','2016-03-15 04:15:09'),(21,4,'deduct vs deduce','2016-03-15 04:16:05','2016-03-15 04:16:05'),(22,4,'airtime','2016-03-15 04:18:28','2016-03-15 04:18:28'),(23,4,'leaflet','2016-03-15 04:21:51','2016-03-15 04:21:51'),(24,4,'response vs respond','2016-03-15 04:22:16','2016-03-15 04:22:16'),(25,4,'rack','2016-03-15 06:05:44','2016-03-15 06:05:44'),(26,4,'outlet','2016-03-15 06:06:54','2016-03-15 06:06:54'),(27,4,'cashier','2016-03-15 06:08:55','2016-03-15 06:08:55'),(28,4,'dine','2016-03-15 06:09:30','2016-03-15 06:09:30'),(29,4,'appetizer','2016-03-15 06:10:07','2016-03-15 06:10:07'),(30,4,'refreshment vs beverage','2016-03-15 06:11:38','2016-03-15 06:11:38'),(31,4,'box office','2016-03-15 06:13:14','2016-03-15 06:13:14'),(32,4,'compartment','2016-03-15 06:15:10','2016-03-15 06:15:10'),(33,4,'jet lag','2016-03-15 06:17:20','2016-03-15 06:17:20'),(34,4,'condominium vs slum','2016-03-15 06:18:27','2016-03-15 06:18:27'),(35,4,'evict','2016-03-15 06:20:11','2016-03-15 06:20:11'),(36,4,'realtor vs real estate','2016-03-15 06:21:06','2016-03-15 06:21:06'),(37,4,'precipitation','2016-03-15 06:23:00','2016-03-15 06:23:00'),(38,4,'hail ?','2016-03-15 06:23:34','2016-03-15 06:23:34'),(39,4,'muggy vs mild','2016-03-15 06:24:43','2016-03-15 06:24:43'),(40,4,'overcast','2016-03-15 06:26:12','2016-03-15 06:26:12'),(41,4,'brisk','2016-03-15 06:26:54','2016-03-15 06:26:54'),(42,4,'prescribe','2016-03-15 06:28:36','2016-03-15 06:28:36'),(43,4,'periodical','2016-03-15 06:32:55','2016-03-15 06:32:55'),(44,4,'convey vs survey','2016-03-15 08:34:14','2016-03-15 08:34:14'),(45,5,'provision','2016-03-16 02:31:40','2016-03-16 02:31:40'),(46,2,'podiatrist, disgusting, blister, corn, bunions, calluses, athlete\'s foot','2016-03-16 02:44:27','2016-03-16 02:44:27'),(47,2,'Fringe of society','2016-03-18 06:20:05','2016-03-18 06:20:05'),(48,1,'captivate','2016-03-18 08:29:09','2016-03-18 08:29:09'),(49,4,'expedite','2016-03-18 08:40:37','2016-03-18 08:40:37'),(50,4,'relay, dispatch','2016-03-18 08:43:48','2016-03-18 08:43:48'),(51,6,'Introduction','2016-03-18 10:10:49','2016-03-18 10:10:49'),(52,6,'Application Fundamentals','2016-03-18 10:28:51','2016-03-18 10:28:51'),(53,6,'http://developer.android.com/guide/practices/screens_support.html','2016-03-21 02:44:26','2016-03-21 02:44:26'),(54,6,'Optimizing layout with lint','2016-03-21 04:12:48','2016-03-21 04:12:48'),(55,4,'attribute','2016-03-21 05:06:12','2016-03-21 05:06:12'),(56,4,'I should read with opening mind for word meanings','2016-03-21 05:08:15','2016-03-21 05:08:15'),(57,4,'draw on','2016-03-21 06:03:14','2016-03-21 06:03:14'),(58,6,'http://developer.android.com/guide/practices/compatibility.html','2016-03-21 06:20:00','2016-03-21 06:20:00'),(59,6,'http://developer.android.com/guide/topics/security/permissions.html','2016-03-21 06:40:22','2016-03-21 06:40:22'),(60,6,'http://developer.android.com/training/improving-layouts/smooth-scrolling.html','2016-03-22 03:13:06','2016-03-22 03:13:06'),(61,6,'Design material','2016-03-24 02:38:53','2016-03-24 02:38:53'),(62,2,'hovel','2016-03-28 09:04:52','2016-03-28 09:04:52'),(63,5,'augment','2016-03-28 09:34:20','2016-03-28 09:34:20'),(64,8,'Taxi','2016-03-29 10:11:46','2016-03-29 10:11:46'),(65,8,'podcast','2016-03-29 10:12:46','2016-03-29 10:12:46'),(66,8,'Top 25 questions','2016-03-29 10:16:43','2016-03-29 10:16:43'),(67,2,'gullible, picket, taint','2016-03-30 06:21:30','2016-03-30 06:21:30'),(68,10,'contemptuous','2016-03-30 06:29:44','2016-03-30 06:29:44'),(69,10,'deportment','2016-03-30 06:32:47','2016-03-30 06:32:47'),(70,10,'desolate','2016-03-30 06:35:58','2016-03-30 06:35:58'),(71,10,'dismal','2016-03-30 06:36:14','2016-03-30 06:36:14'),(72,10,'elaborate','2016-03-30 06:38:48','2016-03-30 06:38:48'),(73,10,'emarald','2016-03-30 06:39:02','2016-03-30 06:39:02'),(74,10,'envisage','2016-03-30 06:39:10','2016-03-30 06:39:10'),(75,10,'epitome','2016-03-30 06:39:15','2016-03-30 06:39:15'),(76,10,'exaltation','2016-03-30 06:39:23','2016-03-30 06:39:23'),(77,10,'fervently','2016-03-30 06:39:32','2016-03-30 06:39:32'),(78,10,'flaunt','2016-03-30 06:39:47','2016-03-30 06:39:47'),(79,10,'foliage','2016-03-30 06:39:53','2016-03-30 06:39:53'),(80,10,'forsaken','2016-03-30 06:39:58','2016-03-30 06:39:58'),(81,10,'furlough','2016-03-30 06:40:03','2016-03-30 06:40:03'),(82,10,'fury','2016-03-30 06:40:13','2016-03-30 06:40:13'),(83,10,'futile','2016-03-30 06:40:16','2016-03-30 06:40:16'),(84,10,'herald','2016-03-30 06:40:43','2016-03-30 06:40:43'),(85,10,'hoarse','2016-03-30 06:40:48','2016-03-30 06:40:48'),(86,10,'ignorgant','2016-03-30 06:41:07','2016-03-30 06:41:07'),(87,10,'impertinent','2016-03-30 06:41:11','2016-03-30 06:41:11'),(88,10,'impotent','2016-03-30 06:42:23','2016-03-30 06:42:23'),(89,10,'induce','2016-03-30 06:42:29','2016-03-30 06:42:29'),(90,10,'inferior','2016-03-30 06:42:37','2016-03-30 06:42:37'),(91,10,'insinuate','2016-03-30 06:42:50','2016-03-30 06:42:50'),(92,10,'insolent','2016-03-30 06:43:10','2016-03-30 06:43:10'),(93,10,'interpolate','2016-03-30 06:43:15','2016-03-30 06:43:15'),(94,10,'jeopardize','2016-03-30 06:43:22','2016-03-30 06:43:22'),(95,10,'lumber, deplore','2016-03-30 06:43:35','2016-03-30 06:43:35'),(96,10,'mule','2016-03-30 06:43:43','2016-03-30 06:43:43'),(97,10,'obdurate','2016-03-30 06:44:17','2016-03-30 06:44:17'),(98,10,'obliterate','2016-03-30 06:44:54','2016-03-30 06:44:54'),(99,10,'obstinate','2016-03-30 06:44:59','2016-03-30 06:44:59'),(100,10,'parasol','2016-03-30 06:45:09','2016-03-30 06:45:09'),(101,10,'parcel','2016-03-30 06:45:23','2016-03-30 06:45:23'),(102,10,'perspiration','2016-03-30 06:45:35','2016-03-30 06:45:35'),(103,10,'placidity','2016-03-30 06:45:41','2016-03-30 06:45:41'),(104,10,'plight','2016-03-30 06:45:47','2016-03-30 06:45:47'),(105,10,'precious, scarce','2016-03-30 06:46:05','2016-03-30 06:46:05'),(106,10,'predicament','2016-03-30 06:47:40','2016-03-30 06:47:40'),(107,10,'preempt','2016-03-30 06:47:48','2016-03-30 06:47:48'),(108,10,'preliminary','2016-03-30 06:47:56','2016-03-30 06:47:56'),(109,10,'proportion','2016-03-30 06:48:12','2016-03-30 06:48:12'),(110,10,'prospered','2016-03-30 06:48:26','2016-03-30 06:48:26'),(111,10,'provoke','2016-03-30 06:48:31','2016-03-30 06:48:31'),(112,10,'rebuff','2016-03-30 06:48:34','2016-03-30 06:48:34'),(113,10,'reception','2016-03-30 06:48:40','2016-03-30 06:48:40'),(114,10,'rectify','2016-03-30 06:49:58','2016-03-30 06:49:58'),(115,10,'remnant','2016-03-30 06:50:16','2016-03-30 06:50:16'),(116,10,'resolutely','2016-03-30 06:50:20','2016-03-30 06:50:20'),(117,10,'reticence, vanity','2016-03-30 06:50:29','2016-03-30 06:50:29'),(118,10,'sanctuary','2016-03-30 06:51:36','2016-03-30 06:51:36'),(119,10,'scoundrel','2016-03-30 06:51:42','2016-03-30 06:51:42'),(120,10,'sedate','2016-03-30 06:51:48','2016-03-30 06:51:48'),(121,10,'semblance','2016-03-30 06:51:54','2016-03-30 06:51:54'),(122,10,'smite, reverence','2016-03-30 06:52:04','2016-03-30 06:52:04'),(123,10,'spectacle','2016-03-30 06:53:46','2016-03-30 06:53:46'),(124,10,'suave','2016-03-30 06:54:03','2016-03-30 06:54:03'),(125,10,'temerity','2016-03-30 06:54:56','2016-03-30 06:54:56'),(126,10,'treacherous','2016-03-30 06:55:09','2016-03-30 06:55:09'),(127,10,'tumult','2016-03-30 06:55:28','2016-03-30 06:55:28'),(128,10,'twinge','2016-03-30 06:55:35','2016-03-30 06:55:35'),(129,10,'upbraid','2016-03-30 06:55:43','2016-03-30 06:55:43'),(130,10,'utter','2016-03-30 06:55:53','2016-03-30 06:55:53'),(131,10,'valet','2016-03-30 06:55:58','2016-03-30 06:55:58'),(132,10,'vanquish','2016-03-30 06:56:04','2016-03-30 06:56:04'),(133,10,'vicinity','2016-03-30 06:56:09','2016-03-30 06:56:09'),(134,10,'vile','2016-03-30 06:56:15','2016-03-30 06:56:15'),(135,10,'vowel, consonate','2016-03-30 06:56:50','2016-03-30 06:56:50'),(136,10,'wager','2016-03-30 06:56:54','2016-03-30 06:56:54'),(137,10,'wilt','2016-03-30 06:56:57','2016-03-30 06:56:57'),(138,12,'crate','2016-03-30 07:18:13','2016-03-30 07:18:13'),(139,12,'donkey','2016-03-30 07:18:18','2016-03-30 07:18:18'),(140,12,'lizard','2016-03-30 07:18:22','2016-03-30 07:18:22'),(141,12,'odor','2016-03-30 07:18:29','2016-03-30 07:18:29'),(142,12,'onion','2016-03-30 07:18:34','2016-03-30 07:18:34'),(143,12,'reptile','2016-03-30 07:18:40','2016-03-30 07:18:40'),(144,12,'shovel','2016-03-30 07:18:45','2016-03-30 07:18:45'),(145,8,'abs s1','2016-03-31 02:58:42','2016-03-31 02:58:42'),(146,8,'Onakagasukimasu ','2016-04-03 01:32:33','2016-04-03 01:32:33'),(147,8,'Imotto, Ottoto,  ane, ani, kyorai ','2016-04-03 01:33:07','2016-04-03 01:33:07'),(148,14,'amenity','2016-04-06 03:27:38','2016-04-06 03:27:38'),(149,14,'sumptuous','2016-04-06 03:29:18','2016-04-06 03:29:18'),(150,14,'manicure, pedicure','2016-04-06 03:30:16','2016-04-06 03:30:16'),(151,14,'cardio','2016-04-06 03:31:29','2016-04-06 03:31:29'),(152,14,'mediocre','2016-04-13 06:41:52','2016-04-13 06:41:52'),(153,14,'idempotent','2016-04-13 08:47:34','2016-04-13 08:47:34'),(154,14,'orthogonal','2016-04-14 02:39:07','2016-04-14 02:39:07'),(155,14,'vet','2016-04-14 02:45:57','2016-04-14 02:45:57'),(156,14,'conflate','2016-04-14 02:58:26','2016-04-14 02:58:26'),(157,14,'thunk','2016-04-15 08:10:29','2016-04-15 08:10:29'),(158,2,'mason','2016-04-20 02:53:09','2016-04-20 02:53:09'),(159,18,'vessel','2016-04-22 06:24:20','2016-04-22 06:24:20'),(160,18,'dialect','2016-04-22 06:25:06','2016-04-22 06:25:06'),(161,18,'intuition','2016-04-22 06:26:37','2016-04-22 06:26:37'),(162,18,'falcon','2016-04-22 06:27:24','2016-04-22 06:27:24'),(163,18,'failure','2016-04-22 06:29:03','2016-04-22 06:29:03'),(164,19,'test','2016-04-26 06:28:46','2016-04-26 06:28:46'),(165,1,'multilate','2016-04-26 06:37:14','2016-04-26 06:37:14'),(166,2,'relapse, outpatient, inpatient, rehab(rehabilitation)','2016-04-28 06:23:23','2016-04-28 06:23:23'),(167,1,'????','2016-04-28 07:38:55','2016-04-28 07:54:15'),(168,1,'????????????????','2016-04-28 07:54:49','2016-04-28 08:01:54'),(169,1,'????????????????????','2016-04-28 08:02:20','2016-04-28 08:13:21'),(170,1,'は、メッセージリストのヘッダである、私は','2016-04-28 08:13:41','2016-04-28 08:13:41'),(171,NULL,'は、メッセージリストのヘッダである、私は','2016-04-28 08:13:51','2016-04-28 08:13:51');
/*!40000 ALTER TABLE `ecard_word` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-28  8:35:40
