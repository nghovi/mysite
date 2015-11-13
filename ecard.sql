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
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$20000$FpbfEt7uavpT$e1QfSS/jgxnxsV1s6mDyGXsPDyrts2YozsViQ3bHcyU=','2015-11-11 08:12:20',1,'admin','','','vietnh90@gmail.com',1,1,'2015-10-31 07:53:57');
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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2015-10-31 07:58:35','1','Link object',1,'',7,1),(2,'2015-10-31 08:05:15','1','Book object',1,'',9,1),(3,'2015-10-31 08:08:02','2','Link object',1,'',7,1),(4,'2015-10-31 08:13:22','2','Book object',1,'',9,1),(5,'2015-10-31 08:20:25','3','Link object',1,'',7,1),(6,'2015-10-31 08:20:27','3','Book object',1,'',9,1),(7,'2015-10-31 08:22:21','4','Link object',1,'',7,1),(8,'2015-10-31 08:25:21','4','Book object',1,'',9,1),(9,'2015-10-31 08:26:52','5','Link object',1,'',7,1),(10,'2015-10-31 08:31:54','5','Book object',1,'',9,1),(11,'2015-10-31 08:34:20','6','Link object',1,'',7,1),(12,'2015-10-31 08:37:14','6','Book object',1,'',9,1),(13,'2015-10-31 08:45:19','7','Link object',1,'',7,1),(14,'2015-10-31 08:45:21','7','Book object',1,'',9,1),(15,'2015-10-31 08:50:21','1','Task object',1,'',10,1),(16,'2015-10-31 08:50:49','2','Task object',1,'',10,1),(17,'2015-10-31 08:52:07','2','Task object',2,'Changed name, description and priority.',10,1),(18,'2015-10-31 08:52:45','3','Task object',1,'',10,1),(19,'2015-10-31 08:54:09','4','Task object',1,'',10,1),(20,'2015-10-31 08:55:48','5','Task object',1,'',10,1),(21,'2015-11-07 04:15:49','1','Book object',2,'Changed vocabulary.',9,1),(22,'2015-11-07 06:46:48','6','Book object',2,'Changed vocabulary.',9,1),(23,'2015-11-07 06:51:56','5','Book object',2,'Changed vocabulary.',9,1),(24,'2015-11-07 06:59:21','4','Book object',2,'Changed vocabulary.',9,1),(25,'2015-11-07 07:00:44','1','Book object',2,'Changed vocabulary.',9,1),(26,'2015-11-07 07:01:13','2','Book object',2,'Changed vocabulary.',9,1),(27,'2015-11-07 07:02:24','3','Book object',2,'Changed vocabulary.',9,1),(28,'2015-11-07 07:03:06','7','Book object',2,'Changed vocabulary.',9,1),(29,'2015-11-11 08:12:44','8','Book object',2,'Changed vocabulary.',9,1),(30,'2015-11-12 08:38:54','1','Motto object',1,'',11,1),(31,'2015-11-12 09:08:29','2','Motto object',1,'',11,1),(32,'2015-11-12 09:09:41','3','Motto object',1,'',11,1),(33,'2015-11-12 09:10:03','4','Motto object',1,'',11,1),(34,'2015-11-13 03:09:12','5','Motto object',1,'',11,1),(35,'2015-11-13 03:09:27','6','Motto object',1,'',11,1),(36,'2015-11-13 03:09:48','7','Motto object',1,'',11,1),(37,'2015-11-13 03:09:59','8','Motto object',1,'',11,1),(38,'2015-11-13 03:10:26','9','Motto object',1,'',11,1),(39,'2015-11-13 03:10:48','10','Motto object',1,'',11,1),(40,'2015-11-13 03:11:18','11','Motto object',1,'',11,1),(41,'2015-11-13 03:12:04','12','Motto object',1,'',11,1),(42,'2015-11-13 03:12:44','13','Motto object',1,'',11,1),(43,'2015-11-13 03:13:30','14','Motto object',1,'',11,1),(44,'2015-11-13 03:13:50','15','Motto object',1,'',11,1),(45,'2015-11-13 03:16:05','16','Motto object',1,'',11,1),(46,'2015-11-13 03:18:23','17','Motto object',1,'',11,1),(47,'2015-11-13 03:19:54','18','Motto object',1,'',11,1),(48,'2015-11-13 03:22:12','18','Link object',1,'',7,1),(49,'2015-11-13 03:24:14','19','Motto object',1,'',11,1),(50,'2015-11-13 03:24:49','20','Motto object',1,'',11,1),(51,'2015-11-13 03:25:00','21','Motto object',1,'',11,1),(52,'2015-11-13 03:26:07','22','Motto object',1,'',11,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2015-10-31 07:52:33'),(2,'auth','0001_initial','2015-10-31 07:52:33'),(3,'admin','0001_initial','2015-10-31 07:52:33'),(4,'contenttypes','0002_remove_content_type_name','2015-10-31 07:52:33'),(5,'auth','0002_alter_permission_name_max_length','2015-10-31 07:52:33'),(6,'auth','0003_alter_user_email_max_length','2015-10-31 07:52:33'),(7,'auth','0004_alter_user_username_opts','2015-10-31 07:52:33'),(8,'auth','0005_alter_user_last_login_null','2015-10-31 07:52:33'),(9,'auth','0006_require_contenttypes_0002','2015-10-31 07:52:33'),(10,'ecard','0001_initial','2015-10-31 07:52:34'),(11,'sessions','0001_initial','2015-10-31 07:52:34'),(12,'ecard','0002_auto_20151111_1320','2015-11-11 06:20:25'),(13,'ecard','0003_motto','2015-11-12 08:34:33');
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
INSERT INTO `django_session` VALUES ('maqrh4rsvuok64okh9a2pqm8upmu5lsf','OGUwZWQ3YjBiODNmZjE0NGIwMTMyOTdkMmYyNTYzNTQ4MjdkMDczODp7Il9hdXRoX3VzZXJfaGFzaCI6IjBmYzg1N2YzNjJhYzVhZjQ1N2Q1ZTE3MzYwYThkNDUwODBkMzY1M2EiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2015-11-14 07:54:00'),('p2ya1gwv5uui1z87znu3kopb9qq12qsi','OGUwZWQ3YjBiODNmZjE0NGIwMTMyOTdkMmYyNTYzNTQ4MjdkMDczODp7Il9hdXRoX3VzZXJfaGFzaCI6IjBmYzg1N2YzNjJhYzVhZjQ1N2Q1ZTE3MzYwYThkNDUwODBkMzY1M2EiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=','2015-11-25 08:12:20');
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
  `vocabulary` varchar(1000) DEFAULT NULL,
  `comment` varchar(500) NOT NULL,
  `mood` varchar(1000) NOT NULL,
  `booklink_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ecard_book_3df15766` (`booklink_id`),
  CONSTRAINT `ecard_book_booklink_id_36cc70530716f32e_fk_ecard_link_id` FOREIGN KEY (`booklink_id`) REFERENCES `ecard_link` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecard_book`
--

LOCK TABLES `ecard_book` WRITE;
/*!40000 ALTER TABLE `ecard_book` DISABLE KEYS */;
INSERT INTO `ecard_book` VALUES (1,'https://upload.wikimedia.org/wikipedia/en/2/23/Number_the_Stars_book_cover.jpeg','Louis Sachar','Holes','lizard@@@@odor@@@@shovel@@@@donkey@@@@crate@@@@reptile@@@@onion@@@@test2','Really my first english book. I remember reading them with difficulty thanks to my bad english by then. I read it on my ipad.','Fate love kind children',1),(2,'https://upload.wikimedia.org/wikipedia/en/9/98/Lowry_gathering_blue_cover.jpg',' Lois Lowry','Gathering Blue','mug^^^^his mug$$$$@@@@agony@@@@ominous@@@@dye@@@@kettle@@@@weave@@@@stalk@@@@defiant@@@@tend^^^^Weeds had gone untended while his wife had neared her time, given birth then died$$$$@@@@flourish','Kira is a strong and talent girl despite her leg trouble. From amazon: \"As she did in The Giver and later Messenger, in Gathering Blue Lois Lowry challenges readers to imagine what our world could become, how people could evolve, and what could be considered valuable\"','Everyone is special',2),(3,'http://ecx.images-amazon.com/images/I/51XFr3yZg4L._SX334_BO1,204,203,200_.jpg','Karen Cushman','Midwife\'s Apprentice','dung^^^^Something like Max\'s excrement :D$$$$@@@@midwife@@@@apprentice','wiki: Through the course of the book, Alyce transforms from a nameless, \"worthless\" nonentity into a young woman who has friends, skills, a name, a cat and a future.','Life',3),(4,'https://upload.wikimedia.org/wikipedia/en/thumb/8/86/TheLionWitchWardrobe%281stEd%29.jpg/220px-TheLionWitchWardrobe%281stEd%29.jpg','C. S. Lewis','The Lion, the Witch and the Wardrobe','mane@@@@steep@@@@hilt@@@@dodge@@@@stride@@@@spring@@@@robe@@@@muffle@@@@pavillion@@@@sheath@@@@repulsive@@@@crumble@@@@scramble@@@@wardrobe^^^^Highly successful people simplify their wardrobe and minimize the amount of decisions they make on trivial matters$$$$@@@@nibble@@@@velvet@@@@mercy@@@@lodge','Just a fairy tail with Witch, Lion and good siblings','Go on an adventure',4),(5,'https://upload.wikimedia.org/wikipedia/en/2/23/Number_the_Stars_book_cover.jpeg','Lois Lowry','Number the Stars','snarl@@@@sabotage@@@@bucket@@@@stern^^^^He always has a stern voice when talking with her$$$$@@@@fiance@@@@ponder@@@@bellow@@@@sputter or splutter@@@@frothy@@@@heap@@@@leash@@@@dart@@@@wrinkle@@@@dismay@@@@slap@@@@throne@@@@herb@@@@meadow@@@@trudge@@@@deftly@@@@attic@@@@leap@@@@tug@@@@scold','Good story about the courage of the young girl during war. I learn something interesting about western history, nazi, war, etc..','Be Brave',5),(6,'https://upload.wikimedia.org/wikipedia/en/thumb/e/e9/Missing_May.jpg/220px-Missing_May.jpg','Cynthia Rylant','Missing May','twig@@@@snap^^^^Summer thougt her friend\'s finger like a twigs that could be snapped in a minute.$$$$@@@@hoist^^^^May was a big woman so she had to hoist herself out of the front seat$$$$@@@@thigh^^^^Japanese sharpnel had got Ob in the thigh$$$$@@@@consolation^^^^What is the true mission of spirit message ? To bring us consolation in the sorrows of life$$$$trailer^^^^Summer lived in a beautiful trailer with her raising parents$$$$','Short, light story about family love. \"Summer\", \"May\", \"Ob\", \"Cletus\" were beautiful names','Love your loveones',6),(7,'https://upload.wikimedia.org/wikipedia/en/thumb/6/62/Kite_runner.jpg/220px-Kite_runner.jpg','Khaled Hosseini','The Kite Runner','congenital@@@@shred@@@@bolt@@@@acne@@@@trot@@@@ironic@@@@gnarle@@@@bleak@@@@scramble@@@@gruff@@@@impeccable@@@@covet@@@@flank@@@@vault@@@@mold(the world)@@@@ discard@@@@adjacent@@@@mischief@@@@perpetually@@@@abundantly@@@@thwart@@@@motto@@@@toss@@@@thaw@@@@mosaic@@@@snicker@@@@coarse@@@@intricate@@@@ armpit@@@@crunch@@@@creek (noun@@@@breeze@@@@refrain@@@@flush ( ~blush)@@@@havoc@@@@seduce@@@@elope@@@@limp@@@@polio@@@@slaughter@@@@mumble@@@@crisp@@@@valiant@@@@tuck@@@@scuttle@@@@weep@@@@bead@@@@shierk@@@@hurl','Some kind of shocking feeling. I have a first look at some remote lands like Afgha','Life is full of stunning story',7),(8,'https://upload.wikimedia.org/wikipedia/en/thumb/a/a9/Percy-Jackson-Sea-poster.jpg/220px-Percy-Jackson-Sea-poster.jpg','Rich Riordan','Percy Jackson: Sea Of Monsters','dais, casket, ashes@@@@screech^^^^The three old lady driver screeched \" we don\'t take his kind\" (Tyson)$$$$@@@@hitch, provision, kerosense@@@@gross@@@@propel vs prop@@@@boulder@@@@javelin, entangle@@@@rip, veil, scruffy, adolescent@@@@subtle^^^^Getting chopped into a milion pieces and cast into the darkest part of the Underworld would give him a subtle clue that nobody wanted him around.$$$$@@@@gloat (desire)@@@@lumber, wade@@@@deed@@@@timber, whack, beam@@@@smoldering, hatch@@@@trespasser@@@@chariot, tremple@@@@naut@@@@sprawl, daze@@@@atest^^^^atestf$$$$@@@@stammer@@@@vulture@@@@tackle, braid@@@@shudder, billow@@@@inhale, exhale, lurched@@@@tumble, chasm@@@@strangle@@@@hipster, scraf@@@@wail, crumple <> crumble@@@@ferocity@@@@wail, juvenile, delinquent@@@@pathetic@@@@feisty, feast^^^^Polyphemus called Clarisse a feisty one, and he wanted to eat the loudmouth girl for wedding feast.$$$$@@@@frantically@@@@lap, hull, current@@@@rodent, hutch@@@@scoot away@@@@traitor (betrayal, defector)@','Great book for young adults and lower intermediate English learners. I just couldn\'t wait to finish it off after reading the first pages. I completely forgot it\'s written in my second language - English','Existence of Gods',15),(9,'https://upload.wikimedia.org/wikipedia/en/thumb/7/7b/The_Giver_first_edition_1993.jpg/220px-The_Giver_first_edition_1993.jpg','Lois Lowry','The Giver',NULL,'Sameness social is bad idea','Be Different',16),(10,'https://upload.wikimedia.org/wikipedia/en/thumb/3/3c/The_titan%27s_curse.jpg/250px-The_titan%27s_curse.jpg','Rich Riordan','Percy JackSon: The Titan\'s Curse',NULL,'The best in the series. I don\'t believe adult like author can describe the life of young demigod such admiring way. He must have been very understand young children','Thalia, Percy and Annabeth are cool',17),(11,'https://upload.wikimedia.org/wikipedia/en/thumb/b/bf/PercyBattleLabyrinth.jpg/250px-PercyBattleLabyrinth.jpg','Rich Riordan','Percy Jackson: The Battle of the Labyrinth','pit, ring^^^^They\'ve entered the room full with waterfalls. The floor was one big pit ringed by a slippery stone walk way$$$$@@@@deception, devour^^^^Kelli and Goode have the power of deception. Almost male hero would have fallen under their spell and been devoured$$$$@@@@scrawl^^^^Rachel Elizabeth Dare scrawled her phone number on Percy\'s hand$$$$@@@@something felt wrong@@@@canter^^^^Chiron cantered up to the from of the Elder Council$$$$@@@@rehearse^^^^Grover and Tyson stood up together like they\'d rehearsed it: \"Left\". They both felt the present of monsters in the right tunnel $$$$@@@@bizarre^^^^Tammi the monster looked totally bizarre, especially with red eyes and sharp fangs$$$$@@@@plunge^^^^Percy took the plunge to tell Rachel that he is a half-blood$$$$@@@@hike, crest^^^^Annabeth and Percy hiked to the crest of the hill$$$$@@@@morph^^^^Briares\'s face morphed into something else when Tyson ordered \"Put on your brave face\"$$$$@@@@siren, blare^^^^Emergency sirens began to blare whe','The hundred hands, Kampe','Be strong',19);
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecard_link`
--

LOCK TABLES `ecard_link` WRITE;
/*!40000 ALTER TABLE `ecard_link` DISABLE KEYS */;
INSERT INTO `ecard_link` VALUES (1,'https://en.wikipedia.org/wiki/Holes_%28novel%29','book_wiki_holes_louis_sachar',0),(2,'https://en.wikipedia.org/wiki/Gathering_Blue','book_wiki_gathering_blue',0),(3,'https://en.wikipedia.org/wiki/The_Midwife\'s_Apprentice','book_wiki_the_midwifes_apprentice',0),(4,'https://en.wikipedia.org/wiki/The_Lion,_the_Witch_and_the_Wardrobe','book_wiki_the_lion_witch_wardrobe',0),(5,'https://en.wikipedia.org/wiki/Number_the_Stars','wiki_book_number_the_stars',0),(6,'https://en.wikipedia.org/wiki/Missing_May','book_wiki_missing_may',0),(7,'https://en.wikipedia.org/wiki/The_Kite_Runner','book_wiki_the_kite_runner',0),(8,'https://en.wikipedia.org/wiki/Book','Link of book Percy Jackson and se',0),(9,'https://en.wikipedia.org/wiki/Book','Link of book Percy Jackson and se',0),(10,'https://en.wikipedia.org/wiki/Book','Link of book Percy Jackson and se',0),(11,'https://en.wikipedia.org/wiki/Book','Link of book Percy Jackson and se',0),(12,'https://en.wikipedia.org/wiki/Book','Link of book Percy Jackson and se',0),(13,'https://en.wikipedia.org/wiki/Book','Link of book Percy Jackson and se',0),(15,'https://en.wikipedia.org/wiki/Percy_Jackson:_Sea_of_Monsters','Link of book Percy Jackson: Sea Of Monsters',0),(16,'https://en.wikipedia.org/wiki/The_Giver','Link of book The Giver',0),(17,'https://en.wikipedia.org/wiki/The_Titan%27s_Curse','Link of book Percy JackSon: The Titan\'s Curse',0),(18,'http://www.lifehack.org/articles/communication/30-books-that-everyone-should-read-least-once-their-lives.html','Good book to read',0),(19,'https://en.wikipedia.org/wiki/The_Battle_of_the_Labyrinth','Link of book Percy Jackson: The Battle of the Labyrinth',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecard_motto`
--

LOCK TABLES `ecard_motto` WRITE;
/*!40000 ALTER TABLE `ecard_motto` DISABLE KEYS */;
INSERT INTO `ecard_motto` VALUES (1,'Be yourself',1),(2,'Spend money for experiences, not items',0),(3,'Laugh, Cry and Have Sex',0),(4,'Sleeping naked',0),(5,'Visit a new continent',0),(6,'Travel to at least 20 countries',0),(7,'Face your worst fear',0),(8,'Stand on top of a mountain',0),(9,'Get in the best shape of your life',0),(10,'Become a disciplined person',0),(11,'Become a morning person',0),(12,'Read at leat 100 books',0),(13,'Write a book',0),(14,'Write a letter to your future self',0),(15,'Go offline for a whole month',0),(16,'Experience The Joy Of Learning',0),(17,'Take a picture every day for a whole year',0),(18,'Stop looking for other people’s approval',0),(19,'Learn to say no',0),(20,'Make a DIY furniture',0),(21,'Spend a night under the stars',0),(22,'Take a small step out of your comfort zone every day',0);
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ecard_task`
--

LOCK TABLES `ecard_task` WRITE;
/*!40000 ALTER TABLE `ecard_task` DISABLE KEYS */;
INSERT INTO `ecard_task` VALUES (1,'Close eye','Close your eye for just 2minutes, forgetting any thing',5,1,'2015-11-02 08:50:02','2015-11-02 08:50:15'),(2,'Draw a commit','Just make a commit to ecard to make momentum, no matter what changes it is',4,1,'2015-11-02 08:50:43','2015-11-02 08:50:44'),(3,'Be tough','I should be more tough and confident',1,1,'2015-11-02 08:52:39','2015-11-02 08:52:40'),(4,'Go home early','Go home early, it\'s Monday. Working late on the first day of week can lead into really hard week',2,1,'2015-11-02 08:54:05','2015-11-02 08:54:08'),(5,'Be healthy and beautiful','Try to eat healthy food, walking around, drink enough water',3,1,'2015-11-02 08:55:42','2015-11-02 08:55:45'),(6,'Fix the lamp','Get back the electric heal tool and try to fix the lamp, or throw it away if repairing is impossible',1,0,'2015-11-14 02:46:45','2015-11-14 02:46:45'),(7,'Get AirBlade washed','It\'s long time i don\'t wash my bike. If it won\'t rain, then go out and wash it. Be social',10,0,'2015-11-14 02:49:59','2015-11-14 02:49:59'),(8,'Pay 14k to sister','I owned her 14k for exchanging fee of new water tank. I took 200k from our safe because i couldn\'t found my purse.',5,0,'2015-11-14 02:40:11','2015-11-14 02:40:11'),(9,'Clean heat tank','Never clean it since the first day. It\'s time.',5,0,'2015-11-15 02:43:34','2015-11-15 02:43:34'),(10,'Clean Winix','Clean Winix the first time in 3-month regularly cleaning',2,0,'2016-02-13 02:45:25','2016-02-13 02:45:25'),(11,'Reading background color','Change background color of some pages so it\'s easy for long time reading',7,0,'2015-11-16 02:35:39','2015-11-16 02:35:39'),(12,'Setting menu','Create setting menu, replace main card and photo menu item',6,0,'2015-11-16 02:36:57','2015-11-16 02:36:57'),(13,'Sign Up, Sign In','Create user system, sign up, sign in, reset',1,0,'2015-11-17 02:39:22','2015-11-17 02:39:22'),(14,'Push Notification','Push notification about task, good sayings, from server',1,0,'2015-11-19 02:41:11','2015-11-19 02:41:11'),(15,'Bug fixing, delete redundant resources, update layout, ready for solid releasing','Keep thing simple, no more advanced layout, just keep things consistent',1,0,'2015-11-16 02:43:33','2015-11-16 02:43:33'),(16,'Search function','Implement search function for task, book',1,0,'2015-11-23 02:46:58','2015-11-23 02:46:58'),(17,'Releasing day','Upload and release my first app on Android Play Store',1,0,'2015-11-27 02:51:16','2015-11-27 02:51:16'),(18,'Add voice function for book word','http://www.tutorialspoint.com/android/android_text_to_speech.htm',4,0,'2015-11-20 09:59:11','2015-11-20 09:59:11');
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

-- Dump completed on 2015-11-13 17:19:31
