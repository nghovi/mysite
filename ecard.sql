-- MySQL dump 10.13  Distrib 5.6.26, for Win32 (x86)
--
-- Host: localhost    Database: ecard
-- ------------------------------------------------------
-- Server version	5.6.26

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
  CONSTRAINT `auth_group__permission_id_1f49ccbbdc69d2fc_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permission_group_id_689710a9a73b7457_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add link',7,'add_link'),(20,'Can change link',7,'change_link'),(21,'Can delete link',7,'delete_link'),(22,'Can add user preference',8,'add_userpreference'),(23,'Can change user preference',8,'change_userpreference'),(24,'Can delete user preference',8,'delete_userpreference'),(25,'Can add book',9,'add_book'),(26,'Can change book',9,'change_book'),(27,'Can delete book',9,'delete_book'),(28,'Can add task',10,'add_task'),(29,'Can change task',10,'change_task'),(30,'Can delete task',10,'delete_task'),(31,'Can add motto',11,'add_motto'),(32,'Can change motto',11,'change_motto'),(33,'Can delete motto',11,'delete_motto');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$20000$FpbfEt7uavpT$e1QfSS/jgxnxsV1s6mDyGXsPDyrts2YozsViQ3bHcyU=','2015-11-26 02:09:44',1,'admin','','','vietnh90@gmail.com',1,1,'2015-10-31 07:53:57');
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
  CONSTRAINT `auth_user_u_permission_id_384b62483d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissi_user_id_7f0938558328534a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
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
  CONSTRAINT `djang_content_type_id_697914295151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_52fdd58701c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2015-10-31 07:58:35','1','Link object',1,'',7,1),(2,'2015-10-31 08:05:15','1','Book object',1,'',9,1),(3,'2015-10-31 08:08:02','2','Link object',1,'',7,1),(4,'2015-10-31 08:13:22','2','Book object',1,'',9,1),(5,'2015-10-31 08:20:25','3','Link object',1,'',7,1),(6,'2015-10-31 08:20:27','3','Book object',1,'',9,1),(7,'2015-10-31 08:22:21','4','Link object',1,'',7,1),(8,'2015-10-31 08:25:21','4','Book object',1,'',9,1),(9,'2015-10-31 08:26:52','5','Link object',1,'',7,1),(10,'2015-10-31 08:31:54','5','Book object',1,'',9,1),(11,'2015-10-31 08:34:20','6','Link object',1,'',7,1),(12,'2015-10-31 08:37:14','6','Book object',1,'',9,1),(13,'2015-10-31 08:45:19','7','Link object',1,'',7,1),(14,'2015-10-31 08:45:21','7','Book object',1,'',9,1),(15,'2015-10-31 08:50:21','1','Task object',1,'',10,1),(16,'2015-10-31 08:50:49','2','Task object',1,'',10,1),(17,'2015-10-31 08:52:07','2','Task object',2,'Changed name, description and priority.',10,1),(18,'2015-10-31 08:52:45','3','Task object',1,'',10,1),(19,'2015-10-31 08:54:09','4','Task object',1,'',10,1),(20,'2015-10-31 08:55:48','5','Task object',1,'',10,1),(21,'2015-11-07 04:15:49','1','Book object',2,'Changed vocabulary.',9,1),(22,'2015-11-07 06:46:48','6','Book object',2,'Changed vocabulary.',9,1),(23,'2015-11-07 06:51:56','5','Book object',2,'Changed vocabulary.',9,1),(24,'2015-11-07 06:59:21','4','Book object',2,'Changed vocabulary.',9,1),(25,'2015-11-07 07:00:44','1','Book object',2,'Changed vocabulary.',9,1),(26,'2015-11-07 07:01:13','2','Book object',2,'Changed vocabulary.',9,1),(27,'2015-11-07 07:02:24','3','Book object',2,'Changed vocabulary.',9,1),(28,'2015-11-07 07:03:06','7','Book object',2,'Changed vocabulary.',9,1),(29,'2015-11-11 08:12:44','8','Book object',2,'Changed vocabulary.',9,1),(30,'2015-11-12 08:38:54','1','Motto object',1,'',11,1),(31,'2015-11-12 09:08:29','2','Motto object',1,'',11,1),(32,'2015-11-12 09:09:41','3','Motto object',1,'',11,1),(33,'2015-11-12 09:10:03','4','Motto object',1,'',11,1),(34,'2015-11-13 03:09:12','5','Motto object',1,'',11,1),(35,'2015-11-13 03:09:27','6','Motto object',1,'',11,1),(36,'2015-11-13 03:09:48','7','Motto object',1,'',11,1),(37,'2015-11-13 03:09:59','8','Motto object',1,'',11,1),(38,'2015-11-13 03:10:26','9','Motto object',1,'',11,1),(39,'2015-11-13 03:10:48','10','Motto object',1,'',11,1),(40,'2015-11-13 03:11:18','11','Motto object',1,'',11,1),(41,'2015-11-13 03:12:04','12','Motto object',1,'',11,1),(42,'2015-11-13 03:12:44','13','Motto object',1,'',11,1),(43,'2015-11-13 03:13:30','14','Motto object',1,'',11,1),(44,'2015-11-13 03:13:50','15','Motto object',1,'',11,1),(45,'2015-11-13 03:16:05','16','Motto object',1,'',11,1),(46,'2015-11-13 03:18:23','17','Motto object',1,'',11,1),(47,'2015-11-13 03:19:54','18','Motto object',1,'',11,1),(48,'2015-11-13 03:22:12','18','Link object',1,'',7,1),(49,'2015-11-13 03:24:14','19','Motto object',1,'',11,1),(50,'2015-11-13 03:24:49','20','Motto object',1,'',11,1),(51,'2015-11-13 03:25:00','21','Motto object',1,'',11,1),(52,'2015-11-13 03:26:07','22','Motto object',1,'',11,1),(53,'2015-11-24 01:34:34','23','Link object',1,'',7,1),(54,'2015-11-24 01:45:57','25','Link object',1,'',7,1),(55,'2015-11-24 01:47:42','23','Motto object',1,'',11,1),(56,'2015-11-24 01:49:22','24','Motto object',1,'',11,1),(57,'2015-11-25 02:42:55','26','Link object',1,'',7,1),(58,'2015-11-26 02:10:10','24','Motto object',2,'No fields changed.',11,1),(59,'2015-11-26 02:10:36','25','Motto object',1,'',11,1),(60,'2015-11-26 02:11:08','26','Motto object',1,'',11,1),(61,'2015-11-26 02:11:28','27','Motto object',1,'',11,1),(62,'2015-11-26 02:11:48','28','Motto object',1,'',11,1),(63,'2015-11-26 02:12:09','29','Motto object',1,'',11,1),(64,'2015-11-26 02:15:00','30','Motto object',1,'',11,1),(65,'2015-11-26 06:41:29','14','Book object',3,'',9,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(9,'ecard','book'),(7,'ecard','link'),(11,'ecard','motto'),(10,'ecard','task'),(8,'ecard','userpreference'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2015-10-31 07:52:33'),(2,'auth','0001_initial','2015-10-31 07:52:33'),(3,'admin','0001_initial','2015-10-31 07:52:33'),(4,'contenttypes','0002_remove_content_type_name','2015-10-31 07:52:33'),(5,'auth','0002_alter_permission_name_max_length','2015-10-31 07:52:33'),(6,'auth','0003_alter_user_email_max_length','2015-10-31 07:52:33'),(7,'auth','0004_alter_user_username_opts','2015-10-31 07:52:33'),(8,'auth','0005_alter_user_last_login_null','2015-10-31 07:52:33'),(9,'auth','0006_require_contenttypes_0002','2015-10-31 07:52:33'),(10,'ecard','0001_initial','2015-10-31 07:52:34'),(11,'sessions','0001_initial','2015-10-31 07:52:34'),(12,'ecard','0002_auto_20151111_1320','2015-11-11 06:20:25'),(13,'ecard','0003_motto','2015-11-12 08:34:33'),(14,'ecard','0004_auto_20151116_1053','2015-11-16 03:53:48'),(15,'ecard','0005_auto_20151125_1126','2015-11-25 04:26:28'),(16,'ecard','0006_auto_20151125_1127','2015-11-25 04:27:35'),(17,'ecard','0007_auto_20151125_1326','2015-11-25 06:26:18');
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
INSERT INTO `django_session` VALUES ('exn045kdcjjvjl4qwwqieasppdd702vd','OGUwZWQ3YjBiODNmZjE0NGIwMTMyOTdkMmYyNTYzNTQ4MjdkMDczODp7Il9hdXRoX3VzZXJfaGFzaCI6IjBmYzg1N2YzNjJhYzVhZjQ1N2Q1ZTE3MzYwYThkNDUwODBkMzY1M2EiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2015-12-10 02:09:44'),('maqrh4rsvuok64okh9a2pqm8upmu5lsf','OGUwZWQ3YjBiODNmZjE0NGIwMTMyOTdkMmYyNTYzNTQ4MjdkMDczODp7Il9hdXRoX3VzZXJfaGFzaCI6IjBmYzg1N2YzNjJhYzVhZjQ1N2Q1ZTE3MzYwYThkNDUwODBkMzY1M2EiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2015-11-14 07:54:00'),('p2ya1gwv5uui1z87znu3kopb9qq12qsi','OGUwZWQ3YjBiODNmZjE0NGIwMTMyOTdkMmYyNTYzNTQ4MjdkMDczODp7Il9hdXRoX3VzZXJfaGFzaCI6IjBmYzg1N2YzNjJhYzVhZjQ1N2Q1ZTE3MzYwYThkNDUwODBkMzY1M2EiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2015-11-25 08:12:20');
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
  `iconUrl` varchar(200) NOT NULL,
  `author` varchar(200) NOT NULL,
  `name` varchar(200) NOT NULL,
  `vocabulary` longtext,
  `comment` varchar(500) NOT NULL,
  `mood` varchar(1000) NOT NULL,
  `booklink_id` int(11) NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ecard_book_3df15766` (`booklink_id`),
  CONSTRAINT `ecard_book_booklink_id_36cc70530716f32e_fk_ecard_link_id` FOREIGN KEY (`booklink_id`) REFERENCES `ecard_link` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecard_book`
--

LOCK TABLES `ecard_book` WRITE;
/*!40000 ALTER TABLE `ecard_book` DISABLE KEYS */;
INSERT INTO `ecard_book` VALUES (1,'https://upload.wikimedia.org/wikipedia/en/2/23/Number_the_Stars_book_cover.jpeg','Louis Sachar','Holes','odor@@@@lizard@@@@donkey@@@@shovel@@@@reptile@@@@crate@@@@onion','This is my first english book. I remember reading them with lot of dificulties thanks to my bad English by then. I read it on my ipad and i had to struggle hard to finish it','Fate love kind children',1,0),(2,'https://upload.wikimedia.org/wikipedia/en/9/98/Lowry_gathering_blue_cover.jpg',' Lois Lowry','Gathering Blue','agony^^^^Google translate defines agony as extremely physical or metal suffering$$$$@@@@mug^^^^his mug$$$$@@@@ominous@@@@dye@@@@kettle@@@@weave@@@@defiant@@@@stalk@@@@tend^^^^Weeds had gone untended while his wife had neared her time, given birth then died$$$$@@@@flourish','Kira is a strong and talent girl despite her leg trouble. From amazon: \"As she did in The Giver and later Messenger, in Gathering Blue Lois Lowry challenges readers to imagine what our world could become, how people could evolve, and what could be considered valuable\"','Everyone is special',2,0),(3,'http://ecx.images-amazon.com/images/I/51XFr3yZg4L._SX334_BO1,204,203,200_.jpg','Karen Cushman','Midwife\'s Apprentice','dung^^^^Something like Max\'s excrement :D$$$$@@@@midwife@@@@apprentice','wiki: Through the course of the book, Alyce transforms from a nameless, \"worthless\" nonentity into a young woman who has friends, skills, a name, a cat and a future.','Life',3,0),(4,'https://upload.wikimedia.org/wikipedia/en/thumb/8/86/TheLionWitchWardrobe%281stEd%29.jpg/220px-TheLionWitchWardrobe%281stEd%29.jpg','C. S. Lewis','The Lion, the Witch and the Wardrobe','mane@@@@steep@@@@hilt@@@@dodge@@@@stride@@@@spring@@@@robe@@@@muffle@@@@pavillion@@@@sheath@@@@repulsive@@@@crumble@@@@scramble@@@@wardrobe^^^^Highly successful people simplify their wardrobe and minimize the amount of decisions they make on trivial matters$$$$@@@@nibble@@@@velvet@@@@mercy@@@@lodge','Just a fairy tail with Witch, Lion and good siblings','Go on an adventure',4,0),(5,'https://upload.wikimedia.org/wikipedia/en/2/23/Number_the_Stars_book_cover.jpeg','Lois Lowry','Number the Stars','snarl@@@@sabotage@@@@bucket@@@@stern^^^^He always has a stern voice when talking with her$$$$@@@@fiance@@@@ponder@@@@bellow@@@@sputter or splutter@@@@frothy@@@@heap@@@@leash@@@@dart@@@@wrinkle@@@@dismay@@@@slap@@@@throne@@@@herb@@@@meadow@@@@trudge@@@@deftly@@@@attic@@@@leap@@@@tug@@@@scold','Good story about the courage of the young girl during war. I learn something interesting about western history, nazi, war, etc..','Be Brave',5,0),(6,'https://upload.wikimedia.org/wikipedia/en/thumb/e/e9/Missing_May.jpg/220px-Missing_May.jpg','Cynthia Rylant','Missing May','twig@@@@snap^^^^Summer thougt her friend\'s finger like a twigs that could be snapped in a minute.$$$$@@@@hoist^^^^May was a big woman so she had to hoist herself out of the front seat$$$$@@@@thigh^^^^Japanese sharpnel had got Ob in the thigh$$$$@@@@consolation^^^^What is the true mission of spirit message ? To bring us consolation in the sorrows of life$$$$trailer^^^^Summer lived in a beautiful trailer with her raising parents$$$$','Short, light story about family love. \"Summer\", \"May\", \"Ob\", \"Cletus\" were beautiful names','Love your loveones',6,0),(7,'https://upload.wikimedia.org/wikipedia/en/thumb/6/62/Kite_runner.jpg/220px-Kite_runner.jpg','Khaled Hosseini','The Kite Runner',' armpit@@@@congenital^^^^Ali had a congenital paralysis of his lower facial muscle face (maybe a slight version of polio ?) so it left him perpetually grim-faced$$$$@@@@creek (noun@@@@crunch@@@@breeze@@@@shred@@@@bolt@@@@refrain^^^^Assef was flanked by his obeying friend when he was strolling through his land. Assef refrained from harassing Amir because of his famous father. Amir snickered.$$$$@@@@flush ( ~blush)@@@@acne@@@@elope@@@@seduce^^^^Hassan, the illiterature boy, was drawn to the mystery of word, seduced by a secret world forbidden to him. But to him, the words on the page were a scramble of codes$$$$@@@@havoc@@@@trot@@@@ironic@@@@bleak^^^^It became abundantly clear that Amir hadn\'t inherited a shred of his father\'s athletic talent. And his father resigned himself to the bleak fact that Amir was never either play or watch soccer$$$$@@@@gnarle@@@@scramble@@@@gruff@@@@impeccable^^^^Amir\'s grandfather was a highly regarded judge and a man of impeccable reputation.\n$$$$@@@@limp@@@@covet^^^^For the runners, the most coveted prize wat the last fallen kite of a winter tournament. After winning, Amir shook a few hands, and trotted home (he scuttled away from a man during his way home)$$$$@@@@polio@@@@flank@@@@slaughter@@@@crisp@@@@mumble@@@@valiant@@@@tuck@@@@scuttle@@@@vault@@@@mold(the world)@@@@adjacent@@@@ discard@@@@mischief@@@@weep^^^^If he wept into the cup, his tears turned into pearls. That was the first story of Amir. Can i say beads of tears ? or just beads of sweat ?$$$$@@@@perpetually@@@@bead@@@@shierk@@@@abundantly@@@@thwart^^^^The answer floated to his conscious mind before he can thwart it: Hassan was just a Hazara. Hassan then was raped and limped away from Amir$$$$@@@@hurl@@@@toss@@@@motto@@@@mosaic@@@@thaw@@@@snicker@@@@intricate@@@@coarse^^^^Islam teacher of Amir is a man witt a face full of acne scars and a gruff (coarse) voice$$$$','Some kind of shocking feeling. I have a first look at some remote lands like Afgha','Life is full of stunning story',7,0),(8,'https://upload.wikimedia.org/wikipedia/en/thumb/a/a9/Percy-Jackson-Sea-poster.jpg/220px-Percy-Jackson-Sea-poster.jpg','Rich Riordan','Percy Jackson: Sea Of Monsters','dais, casket, ashes@@@@screech^^^^The three old lady driver screeched \" we don\'t take his kind\" (Tyson)$$$$@@@@hitch, provision, kerosense@@@@gross@@@@propel vs prop@@@@boulder@@@@javelin, entangle@@@@rip, veil, scruffy, adolescent@@@@subtle^^^^Getting chopped into a milion pieces and cast into the darkest part of the Underworld would give him a subtle clue that nobody wanted him around.$$$$@@@@gloat (desire)@@@@lumber, wade@@@@deed@@@@timber, whack, beam@@@@smoldering, hatch@@@@trespasser@@@@chariot, tremple@@@@naut@@@@sprawl, daze@@@@atest^^^^atestf$$$$@@@@stammer@@@@vulture@@@@tackle, braid@@@@shudder, billow@@@@inhale, exhale, lurched@@@@tumble, chasm@@@@strangle@@@@hipster, scraf@@@@wail, crumple <> crumble@@@@ferocity@@@@wail, juvenile, delinquent@@@@pathetic@@@@feisty, feast^^^^Polyphemus called Clarisse a feisty one, and he wanted to eat the loudmouth girl for wedding feast.$$$$@@@@frantically@@@@lap, hull, current@@@@rodent, hutch@@@@scoot away@@@@traitor (betrayal, defector)@','Great book for young adults and lower intermediate English learners. I just couldn\'t wait to finish it off after reading the first pages. I completely forgot it\'s written in my second language - English','Existence of Gods',15,0),(9,'https://upload.wikimedia.org/wikipedia/en/thumb/7/7b/The_Giver_first_edition_1993.jpg/220px-The_Giver_first_edition_1993.jpg','Lois Lowry','The Giver',NULL,'Sameness social is bad idea','Be Different',16,0),(10,'https://upload.wikimedia.org/wikipedia/en/thumb/3/3c/The_titan%27s_curse.jpg/250px-The_titan%27s_curse.jpg','Rich Riordan','Percy JackSon: The Titan\'s Curse',NULL,'The best in the series. I don\'t believe adult like author can describe the life of young demigod such admiring way. He must have been very understand young children','Thalia, Percy and Annabeth are cool',17,0),(11,'https://upload.wikimedia.org/wikipedia/en/thumb/b/bf/PercyBattleLabyrinth.jpg/250px-PercyBattleLabyrinth.jpg','Rich Riordan','Percy Jackson: The Battle of the Labyrinth','scrawl^^^^Rachel Elizabeth Dare scrawled her phone number on Percy\'s hand$$$$@@@@grease^^^^Percy was pretty sure he was going to become a grease spot in the Garden of the God while flapping his arms like a duck$$$$@@@@something felt wrong@@@@evasive^^^^Rachel was evasive when Annabeth asked more about her background$$$$@@@@rehearse^^^^Grover and Tyson stood up together like they\'d rehearsed it: \"Left\". They both felt the present of monsters in the right tunnel $$$$@@@@bizarre^^^^Tammi the monster looked totally bizarre, especially with red eyes and sharp fangs$$$$@@@@close to^^^^She sounded like she was close to crying$$$$@@@@snag^^^^It took Percy two tries but finally he snagged Antaeus\'s loincloth and ready to kill his big, evil brother$$$$@@@@banish^^^^The way Nico banished Minos, King of Ghost was impressive but also made Percy uncomfortable$$$$@@@@wisp^^^^A wisp of blue light rose from the floor at Ethan Nakamura\'s feet (Kronos is rising)$$$$@@@@hike, crest^^^^Annabeth and Percy hiked to the crest of the hill$$$$@@@@swerve^^^^The driver swerved across traffic and took the exit as Rachel ordered$$$$@@@@siren, blare@@@@cleave, fissure^^^^Nico stabbed his black blade into the floor and it cleaved through the stone like butter. A fissure opened, sucked Minos and his spirits into the void$$$$@@@@carnage^^^^The lid was decorated even more intricately than the sides, with scences of carnage and power$$$$@@@@anticipate^^^^Percy try to skirt around, but Antaeus anticipated his move. He blocked his path, chuckling$$$$@@@@grimace^^^^Rachel grimaced as if she were about to do something she regretted. She would ask for a car$$$$@@@@recoil^^^^Tyson threw a boulder at Kampe, smacking it between the eyes but the snake just recoiled and hissed$$$$@@@@avalanche^^^^Briares came with a whole avalanche of scissor, a classroom set of rock and a lot of paper$$$$@@@@pit, ring^^^^They\'ve entered the room full with waterfalls. The floor was one big pit ringed by a slippery stone walk way$$$$@@@@deception, devour^^^^Kelli and Goode have the power of deception. Almost male hero would have fallen under their spell and been devoured$$$$@@@@canter^^^^Chiron cantered up to the from of the Elder Council$$$$@@@@engulf^^^^The small part of his brain that wasn\'t engulfed in panic heard Annabeth\'s voice...$$$$@@@@sense^^^^Displayed on the side of the spectator\'s wall was something that made no sense to him... (trident)$$$$@@@@plunge^^^^Percy took the plunge to tell Rachel that he is a half-blood$$$$@@@@graft^^^^The wing grafted instantly to Nico\'s back and arms$$$$@@@@shaft^^^^Nobody bothered them when they climbed the hill to the mine shaft&&&&Atlas used the shaft of his javelin ...$$$$@@@@morph^^^^Briares\'s face morphed into something else when Tyson ordered \"Put on your brave face\"$$$$@@@@fumble, fluster^^^^When Rachel asked, the driver nodded and fumbled for his cell phone. Percy had no idea why he was so fluster$$$$@@@@club^^^^Tyson darted to one side, but Kampe used its head like a club and knocked him off his feet$$$$@@@@ripple^^^^Kronos  threw back his head and laughed. The scar on his face rippled&&&&The darkness rippled around Percy and he found himself in different place$$$$@@@@soar^^^^Using Daelus\'s special bronze wing, they soared across the valley, over a road, and land on the terrace of the visitor center$$$$','The hundred hands, Kampe','Be strong',19,0),(12,'https://upload.wikimedia.org/wikipedia/en/thumb/9/99/Lastolympian.gif/220px-Lastolympian.gif','Rich Riordan','The Last Olympian','craft^^^^Prometheus was the Titan of crafty counsel, said Grover. But he stolen fire for human ?$$$$@@@@amnesty^^^^The Titan of crafty counsel tried to convince Percy to surrender by promising his force would be granted amnesty$$$$@@@@cram^^^^Nakamura didn\'t wanna spend his time crammed into the Hermes cabin because he wasn\'t important$$$$@@@@grudge^^^^Bianca said to her little brother \"Holding grudge is a fatal law for children of Hades\"$$$$@@@@wrath^^^^But Hades said Zeus\'s wrath would be horrible and he couldn\'t hide his love forever$$$$@@@@couldn\'t help^^^^Jackson couldn\'t help admiring the courage of Nico\'s mother$$$$@@@@defy, ordain^^^^Zeus ordained the explosion to destroy Hades\'s children, Bianca and Nico, because Hades defied his will$$$$@@@@oracle^^^^Rachel tried to become the new Oracle of Delphi. She was more lucky not having to stand the curse of Hades like Luke\'s mother$$$$@@@@outcast^^^^Hades cursed the Oracle terribly  \"As long as my children remain outcasts... Your body will wither and die...\"$$$$@@@@cave^^^^Part of the warehouse roof had caved in (Percy saw the old house of Medusa)$$$$@@@@goblet^^^^Nico poured a goblet of wine into the hole and began to chant \"Let\'s the dead taste again\"$$$$@@@@lenient^^^^Would Kronos be lenient if Percy surrender ?$$$$@@@@stationery^^^^Will the doctor grabbed a piece of hotel stationery, jotted down some notes and handed it to one of the Athena guys...&&&&I\'m getting tired with LT\'s small stationery$$$$@@@@charm^^^^Kronos gave the camp half-blood spy a charm as a communication device$$$$@@@@scrunch^^^^Annabeth said Percy is cute when he\'s worried. His eyebrows get all scrunched together&&&&Crisp yellow leaves scrunched underfood$$$$@@@@allergic^^^^Percy nodded wearily and asked Thalia for a favor \"Lock his gift of pithos in the hotel vault, will you?\" He thought he\'s allergic to it$$$$@@@@rite^^^^\"Give her the ancient rite\", Hades said bitterly. That was the very least he could do for his poor girl friend$$$$@@@@decree^^^^Zeus has decreed that Hades must bring had his children be turned into camp half-blood$$$$@@@@lounge^^^^Kronos lounged on his golden throne, his scythe across his lap, Percy dreamed.$$$$@@@@agitate^^^^In his dream, Percy saw Hades was leaning toward a woman, using his hands as he talked, like he was agitate$$$$@@@@squash^^^^Ethan Nakamura\'s nose looked like a squashed tomato from his fight with Percy$$$$@@@@imbecile^^^^Hades\'s lover, Nico\'s mother had the gut saying Zeus is an imbecile$$$$','Great book','Family',22,0),(13,'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e1/Sumerian_MS2272_2400BC.jpg/220px-Sumerian_MS2272_2400BC.jpg','Many','Article','sponge^^^^Sensitive people are like sponges, soaking up the emotional energy that surrounds us$$$$','At least one thing should be better','Today i\'m better than tomorrow',24,0);
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
  `url` varchar(200) NOT NULL,
  `description` varchar(300) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecard_link`
--

LOCK TABLES `ecard_link` WRITE;
/*!40000 ALTER TABLE `ecard_link` DISABLE KEYS */;
INSERT INTO `ecard_link` VALUES (1,'https://en.wikipedia.org/wiki/Holes_%28novel%29','book_wiki_holes_louis_sachar',0),(2,'https://en.wikipedia.org/wiki/Gathering_Blue','book_wiki_gathering_blue',0),(3,'https://en.wikipedia.org/wiki/The_Midwife\'s_Apprentice','book_wiki_the_midwifes_apprentice',0),(4,'https://en.wikipedia.org/wiki/The_Lion,_the_Witch_and_the_Wardrobe','book_wiki_the_lion_witch_wardrobe',0),(5,'https://en.wikipedia.org/wiki/Number_the_Stars','wiki_book_number_the_stars',0),(6,'https://en.wikipedia.org/wiki/Missing_May','book_wiki_missing_may',0),(7,'https://en.wikipedia.org/wiki/The_Kite_Runner','book_wiki_the_kite_runner',0),(8,'https://en.wikipedia.org/wiki/Book','Link of book Percy Jackson and se',0),(9,'https://en.wikipedia.org/wiki/Book','Link of book Percy Jackson and se',0),(10,'https://en.wikipedia.org/wiki/Book','Link of book Percy Jackson and se',0),(11,'https://en.wikipedia.org/wiki/Book','Link of book Percy Jackson and se',0),(12,'https://en.wikipedia.org/wiki/Book','Link of book Percy Jackson and se',0),(13,'https://en.wikipedia.org/wiki/Book','Link of book Percy Jackson and se',0),(15,'https://en.wikipedia.org/wiki/Percy_Jackson:_Sea_of_Monsters','Link of book Percy Jackson: Sea Of Monsters',0),(16,'https://en.wikipedia.org/wiki/The_Giver','Link of book The Giver',0),(17,'https://en.wikipedia.org/wiki/The_Titan%27s_Curse','Link of book Percy JackSon: The Titan\'s Curse',0),(18,'http://www.lifehack.org/articles/communication/30-books-that-everyone-should-read-least-once-their-lives.html','Good book to read',0),(19,'https://en.wikipedia.org/wiki/The_Battle_of_the_Labyrinth','Link of book Percy Jackson: The Battle of the Labyrinth',0),(20,'https://en.wikipedia.org/wiki/Book','Link of book Test',0),(21,'https://en.wikipedia.org/wiki/Book','Link of book t',0),(22,'https://en.wikipedia.org/wiki/The_Last_Olympian','Link of book The Last Olympian',0),(23,'http://www.lifehack.org/334247/its-never-easy-sensitive-person-heres-why?mid=20151123&ref=mail&uid=464409&feq=daily','Lifehack, sensitive person',0),(24,'https://en.wikipedia.org/wiki/Book','Link of book Article',0),(25,'http://www.lifehack.org/283544/11-signs-revealed-only-people-with-true-confidence','confident',0),(26,'http://kenh14.vn/la-cool/bo-suu-tap-anh-dong-cinemagraph-canh-vat-dep-den-me-hoac-long-nguoi-20151124114928269.chn','Must see',9),(27,'https://en.wikipedia.org/wiki/Book','Link of book sdfsdfs',0);
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
  `message` varchar(200) NOT NULL,
  `mottotype` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecard_motto`
--

LOCK TABLES `ecard_motto` WRITE;
/*!40000 ALTER TABLE `ecard_motto` DISABLE KEYS */;
INSERT INTO `ecard_motto` VALUES (1,'Be yourself',1),(2,'Spend money for experiences, not items',0),(3,'Laugh, Cry and Have Sex',0),(4,'Sleeping naked',0),(5,'Visit a new continent',0),(6,'Travel to at least 20 countries',0),(7,'Face your worst fear',0),(8,'Stand on top of a mountain',0),(9,'Get in the best shape of your life',0),(10,'Become a disciplined person',0),(11,'Become a morning person',0),(12,'Read at leat 100 books',0),(13,'Write a book',0),(14,'Write a letter to your future self',0),(15,'Go offline for a whole month',0),(16,'Experience The Joy Of Learning',0),(17,'Take a picture every day for a whole year',0),(18,'Stop looking for other people’s approval',0),(19,'Learn to say no',0),(20,'Make a DIY furniture',0),(21,'Spend a night under the stars',0),(22,'Take a small step out of your comfort zone every day',0),(23,'Confidence comes not from always being right but not fearing to be wrong',0),(24,'True confident people do not rely on outside compliments for a confidence boost',0),(25,'I have a morning routine',0),(26,'I don\'t panic when things go slightly wrongs',0),(27,'I work when i don\'t have to',0),(28,'I do my important work first',0),(29,'I keep my full schedules on one place',0),(30,'I relax when i\'m done',0);
/*!40000 ALTER TABLE `ecard_motto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ecard_task`
--

DROP TABLE IF EXISTS `ecard_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ecard_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `description` varchar(200) NOT NULL,
  `priority` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `lastupdated` datetime NOT NULL,
  `isDeleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecard_task`
--

LOCK TABLES `ecard_task` WRITE;
/*!40000 ALTER TABLE `ecard_task` DISABLE KEYS */;
INSERT INTO `ecard_task` VALUES (1,'Close eye','Close your eye for just 2minutes, forgetting any thing',5,1,'2015-11-02 08:50:02','2015-11-02 08:50:15',0),(2,'Draw a commit','Just make a commit to ecard to make momentum, no matter what changes it is',4,1,'2015-11-02 08:50:43','2015-11-02 08:50:44',0),(3,'Be tough','I should be more tough and confident',1,1,'2015-11-02 08:52:39','2015-11-02 08:52:40',0),(4,'Go home early','Go home early, it\'s Monday. Working late on the first day of week can lead into really hard week',2,1,'2015-11-02 08:54:05','2015-11-02 08:54:08',0),(5,'Be healthy and beautiful','Try to eat healthy food, walking around, drink enough water',3,1,'2015-11-02 08:55:42','2015-11-02 08:55:45',0),(6,'Fix the lamp','Get back the electric heal tool and try to fix the lamp, or throw it away if repairing is impossible',1,1,'2015-11-14 02:46:45','2015-11-14 02:46:45',0),(7,'Get AirBlade washed','It\'s long time i don\'t wash my bike. If it won\'t rain, then go out and wash it. Be social',10,1,'2015-11-14 02:49:59','2015-11-14 02:49:59',0),(8,'Pay 14k to sister','I owned her 14k for exchanging fee of new water tank. I took 200k from our safe because i couldn\'t found my purse.',5,0,'2015-11-14 02:40:11','2015-11-14 02:40:11',0),(9,'Clean heat tank','Never clean it since the first day. It\'s time.',5,0,'2015-11-15 02:43:34','2015-11-15 02:43:34',0),(10,'Clean Winix','Clean Winix the first time in 3-month regularly cleaning',2,0,'2016-02-13 02:45:25','2016-02-13 02:45:25',0),(11,'Reading background color','Change background color of some pages so it\'s easy for long time reading',7,1,'2015-11-16 02:35:39','2015-11-16 02:35:39',0),(12,'Setting menu','Create setting menu, replace main card and photo menu item',6,1,'2015-11-16 02:36:57','2015-11-16 02:36:57',0),(13,'Sign Up, Sign In','Create user system, sign up, sign in, reset',1,0,'2015-11-21 02:44:24','2015-11-21 02:44:24',0),(14,'Push Notification','Push notification about task, good sayings, from server',1,0,'2015-11-19 02:41:11','2015-11-19 02:41:11',0),(15,'Bug fixing, delete redundant resources, update layout, ready for solid releasing','Keep thing simple, no more advanced layout, just keep things consistent',1,1,'2015-11-16 02:43:33','2015-11-16 02:43:33',0),(16,'Search function','Implement search function for task, book',1,1,'2015-11-23 02:46:58','2015-11-23 02:46:58',0),(17,'Releasing day','Upload and release my first app on Android Play Store',1,0,'2015-12-29 04:56:38','2015-12-29 04:56:38',0),(18,'Add voice function for book word','http://www.tutorialspoint.com/android/android_text_to_speech.htm',4,0,'2015-11-20 09:59:11','2015-11-20 09:59:11',0),(19,'Search function','Search word before adding word',1,0,'2015-11-21 03:04:39','2015-11-21 03:04:39',0),(20,'Improve search function','Some words are not single words, so should use \"contain\" in search function',5,0,'2015-11-21 04:12:59','2015-11-21 04:12:59',0),(21,'Read Again','Programming skill: I forgot call super method, how does this link to real life ?',5,0,'2015-11-22 08:09:20','2015-11-22 08:09:20',0),(22,'Winix','Call enterbuy customer service again.',1,0,'2015-11-20 06:19:11','2015-11-20 06:19:11',0),(23,'Clean the headphone','My headphone smells bad. It\'s time to clean it',6,0,'2015-11-28 01:36:09','2015-11-28 01:36:09',0),(24,'Test','Test',1,0,'2015-11-25 05:00:50','2015-11-25 05:00:50',1),(25,'t2','t2',1,0,'2015-11-25 05:02:56','2015-11-25 05:02:56',1),(26,'tttt','tttt',1,0,'2015-11-25 06:40:47','2015-11-25 06:40:47',1),(27,'33','33',1,0,'2015-11-25 09:45:39','2015-11-25 09:45:39',0),(28,'aa','bb',1,0,'2015-11-25 08:06:51','2015-11-25 08:06:51',0),(29,'22','22',1,1,'2015-11-25 08:07:26','2015-11-25 08:07:26',0),(30,'This is must be added to remote','sdfsdf',1,0,'2015-11-26 11:50:36','2015-11-26 11:50:36',0),(31,'Found and Read Again my weird thought','I have really weird thoughts but i thought it\'s interesting. I need to find where is save it',1,0,'2015-11-28 07:00:00','2015-11-28 07:00:00',0);
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
  `user_id` int(11) NOT NULL,
  `primary_card_id` int(11) NOT NULL,
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-27 18:43:39
