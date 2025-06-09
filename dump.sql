-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: sports_nutrition_db
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `accounts_profile`
--

DROP TABLE IF EXISTS `accounts_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts_profile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `phone` varchar(20) NOT NULL,
  `address` longtext NOT NULL,
  `is_email_verified` tinyint(1) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `accounts_profile_user_id_49a85d32_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_profile`
--

LOCK TABLES `accounts_profile` WRITE;
/*!40000 ALTER TABLE `accounts_profile` DISABLE KEYS */;
INSERT INTO `accounts_profile` VALUES (1,'','',0,1),(3,'','',0,3),(7,'','',0,6);
/*!40000 ALTER TABLE `accounts_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Профиль',7,'add_profile'),(26,'Can change Профиль',7,'change_profile'),(27,'Can delete Профиль',7,'delete_profile'),(28,'Can view Профиль',7,'view_profile'),(29,'Can add Категория',8,'add_category'),(30,'Can change Категория',8,'change_category'),(31,'Can delete Категория',8,'delete_category'),(32,'Can view Категория',8,'view_category'),(33,'Can add Бренд',9,'add_brand'),(34,'Can change Бренд',9,'change_brand'),(35,'Can delete Бренд',9,'delete_brand'),(36,'Can view Бренд',9,'view_brand'),(37,'Can add Товар',10,'add_product'),(38,'Can change Товар',10,'change_product'),(39,'Can delete Товар',10,'delete_product'),(40,'Can view Товар',10,'view_product'),(41,'Can add Изображение товара',11,'add_productimage'),(42,'Can change Изображение товара',11,'change_productimage'),(43,'Can delete Изображение товара',11,'delete_productimage'),(44,'Can view Изображение товара',11,'view_productimage'),(45,'Can add Отзыв',12,'add_review'),(46,'Can change Отзыв',12,'change_review'),(47,'Can delete Отзыв',12,'delete_review'),(48,'Can view Отзыв',12,'view_review'),(49,'Can add Товар в корзине',13,'add_cartitem'),(50,'Can change Товар в корзине',13,'change_cartitem'),(51,'Can delete Товар в корзине',13,'delete_cartitem'),(52,'Can view Товар в корзине',13,'view_cartitem'),(53,'Can add Заказ',14,'add_order'),(54,'Can change Заказ',14,'change_order'),(55,'Can delete Заказ',14,'delete_order'),(56,'Can view Заказ',14,'view_order'),(57,'Can add Товар в заказе',15,'add_orderitem'),(58,'Can change Товар в заказе',15,'change_orderitem'),(59,'Can delete Товар в заказе',15,'delete_orderitem'),(60,'Can view Товар в заказе',15,'view_orderitem');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1000000$9BYqUYR69YN5D65X9XLfgM$iK3rq5lPSC36oVUMlSf7CSwaqQneBTwjKRP/NAOO1Ec=','2025-04-25 10:09:40.781262',1,'pavlo','','','unitaz228pickoed1337482@yandex.ru',1,1,'2025-04-25 09:33:06.359303'),(3,'pbkdf2_sha256$600000$LRFItriYYmZosOdSbQ7hFB$S7/PWRRo3jDiIeySgFVO418bmD7KzIWoVoswfVlt48Y=','2025-06-09 00:22:50.445448',1,'admin','','','',1,1,'2025-06-05 18:34:22.464059'),(6,'pbkdf2_sha256$600000$3AiPVAwrQLRfo2bHoDXA36$ErFvflFpNiBukocaWfu4r8hX/gG2xA0p5w8sKIaY/no=','2025-06-08 20:52:06.459014',0,'123','','','unitaz228pickoed1337482@yandex.ru',0,1,'2025-06-08 20:52:03.478803');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-04-25 10:06:45.661518','2','support',1,'[{\"added\": {}}]',4,1),(2,'2025-04-25 10:14:44.704784','1','zveroboy',1,'[{\"added\": {}}]',9,1),(3,'2025-04-25 10:16:21.873897','1','bcaa',1,'[{\"added\": {}}]',8,1),(4,'2025-04-25 10:16:23.670252','1','bcaa',1,'[{\"added\": {}}]',10,1),(5,'2025-05-14 11:29:49.974402','7','Заказ #7 от pavlo',3,'',14,1),(6,'2025-05-14 11:29:49.974428','6','Заказ #6 от pavlo',3,'',14,1),(7,'2025-05-14 11:29:49.974440','5','Заказ #5 от pavlo',3,'',14,1),(8,'2025-05-14 11:29:49.974450','4','Заказ #4 от pavlo',3,'',14,1),(9,'2025-05-14 11:29:49.974459','3','Заказ #3 от pavlo',3,'',14,1),(10,'2025-05-14 11:29:49.974468','2','Заказ #2 от pavlo',3,'',14,1),(11,'2025-05-14 11:29:49.974477','1','Заказ #1 от pavlo',3,'',14,1),(12,'2025-05-14 11:31:25.361756','1','bcaa',3,'',8,1),(13,'2025-05-14 11:32:30.611041','1','bcaa',3,'',10,1),(14,'2025-05-14 11:38:29.959312','2','Be first',1,'[{\"added\": {}}]',9,1),(15,'2025-05-14 11:38:34.216161','2','EAA',1,'[{\"added\": {}}]',10,1),(16,'2025-05-14 11:45:41.195389','2','EAA',2,'[{\"changed\": {\"fields\": [\"\\u041f\\u043e\\u043f\\u0443\\u043b\\u044f\\u0440\\u043d\\u043e\\u0441\\u0442\\u044c\"]}}]',10,1),(17,'2025-05-14 16:01:25.795620','2','EAA',2,'[{\"added\": {\"name\": \"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u0442\\u043e\\u0432\\u0430\\u0440\\u0430\", \"object\": \"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u0434\\u043b\\u044f EAA\"}}, {\"added\": {\"name\": \"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u0442\\u043e\\u0432\\u0430\\u0440\\u0430\", \"object\": \"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u0434\\u043b\\u044f EAA\"}}, {\"added\": {\"name\": \"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u0442\\u043e\\u0432\\u0430\\u0440\\u0430\", \"object\": \"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u0434\\u043b\\u044f EAA\"}}]',10,1),(18,'2025-05-14 16:03:17.633758','2','EAA',2,'[{\"changed\": {\"name\": \"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u0442\\u043e\\u0432\\u0430\\u0440\\u0430\", \"object\": \"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u0434\\u043b\\u044f EAA\", \"fields\": [\"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435\"]}}]',10,1),(19,'2025-06-08 18:53:08.123934','3','Muscletech',1,'[{\"added\": {}}]',9,3),(20,'2025-06-08 18:53:50.232116','4','Optimum Nutrition',1,'[{\"added\": {}}]',9,3),(21,'2025-06-08 18:54:02.791709','5','BSN',1,'[{\"added\": {}}]',9,3),(22,'2025-06-08 18:54:10.014476','6','Geneticlab Nutrition',1,'[{\"added\": {}}]',9,3),(23,'2025-06-08 18:54:11.481338','6','Geneticlab Nutrition',2,'[]',9,3),(24,'2025-06-08 18:54:18.131811','7','Maxler',1,'[{\"added\": {}}]',9,3),(25,'2025-06-08 18:54:49.327298','8','Prime Kraft',1,'[{\"added\": {}}]',9,3),(26,'2025-06-08 19:00:32.488523','3','MuscleTech, Creatine Chews, Boogieman Punch',1,'[{\"added\": {}}, {\"added\": {\"name\": \"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u0442\\u043e\\u0432\\u0430\\u0440\\u0430\", \"object\": \"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u0434\\u043b\\u044f MuscleTech, Creatine Chews, Boogieman Punch\"}}, {\"added\": {\"name\": \"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u0442\\u043e\\u0432\\u0430\\u0440\\u0430\", \"object\": \"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u0434\\u043b\\u044f MuscleTech, Creatine Chews, Boogieman Punch\"}}]',10,3),(27,'2025-06-08 19:08:49.166502','9','Insane Labz',1,'[{\"added\": {}}]',9,3),(28,'2025-06-08 19:12:12.938853','4','Insane Labz Psychotic Gold',1,'[{\"added\": {}}, {\"added\": {\"name\": \"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u0442\\u043e\\u0432\\u0430\\u0440\\u0430\", \"object\": \"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u0434\\u043b\\u044f Insane Labz Psychotic Gold\"}}, {\"added\": {\"name\": \"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u0442\\u043e\\u0432\\u0430\\u0440\\u0430\", \"object\": \"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u0434\\u043b\\u044f Insane Labz Psychotic Gold\"}}]',10,3),(29,'2025-06-08 20:22:20.612934','14','Заказ #14 от admin',3,'',14,3),(30,'2025-06-08 20:22:20.615561','13','Заказ #13 от admin',3,'',14,3),(31,'2025-06-08 20:22:20.617434','12','Заказ #12 от admin',3,'',14,3),(32,'2025-06-08 20:22:20.619507','11','Заказ #11 от admin',3,'',14,3),(33,'2025-06-08 20:22:20.621571','10','Заказ #10 от admin',3,'',14,3),(34,'2025-06-08 20:22:20.624200','9','Заказ #9 от admin',3,'',14,3),(35,'2025-06-08 20:22:20.626845','8','Заказ #8 от admin',3,'',14,3),(36,'2025-06-08 20:45:00.426690','4','pavlovilya2004@rambler.ru',3,'',4,3),(37,'2025-06-08 20:45:00.429058','2','support',3,'',4,3),(38,'2025-06-08 20:50:54.892946','5','unitaz228pickoed1337482yandex.ru',3,'',4,3),(39,'2025-06-08 20:54:10.092476','1','Отзыв от pavlo на EAA',3,'',12,3),(40,'2025-06-08 20:54:19.383450','2','Отзыв от admin на MuscleTech, Creatine Chews, Boogieman Punch',3,'',12,3),(41,'2025-06-08 21:10:45.194162','5','Креатин Geneticlab Creatine',1,'[{\"added\": {}}, {\"added\": {\"name\": \"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u0442\\u043e\\u0432\\u0430\\u0440\\u0430\", \"object\": \"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u0434\\u043b\\u044f \\u041a\\u0440\\u0435\\u0430\\u0442\\u0438\\u043d Geneticlab Creatine\"}}, {\"added\": {\"name\": \"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u0442\\u043e\\u0432\\u0430\\u0440\\u0430\", \"object\": \"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u0434\\u043b\\u044f \\u041a\\u0440\\u0435\\u0430\\u0442\\u0438\\u043d Geneticlab Creatine\"}}]',10,3),(42,'2025-06-08 21:32:27.579570','6','Аминокислоты Maxler 100% Golden BCAA 2:1:1',1,'[{\"added\": {}}, {\"added\": {\"name\": \"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u0442\\u043e\\u0432\\u0430\\u0440\\u0430\", \"object\": \"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u0434\\u043b\\u044f \\u0410\\u043c\\u0438\\u043d\\u043e\\u043a\\u0438\\u0441\\u043b\\u043e\\u0442\\u044b Maxler 100% Golden BCAA 2:1:1\"}}, {\"added\": {\"name\": \"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u0442\\u043e\\u0432\\u0430\\u0440\\u0430\", \"object\": \"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u0434\\u043b\\u044f \\u0410\\u043c\\u0438\\u043d\\u043e\\u043a\\u0438\\u0441\\u043b\\u043e\\u0442\\u044b Maxler 100% Golden BCAA 2:1:1\"}}]',10,3),(43,'2025-06-08 21:32:31.453252','6','Аминокислоты Maxler 100% Golden BCAA 2:1:1',2,'[]',10,3),(44,'2025-06-08 21:42:14.650713','7','Предтренировочный комплекс PRIMEKRAFT PRE-WORKOUT BOOST',1,'[{\"added\": {}}, {\"added\": {\"name\": \"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u0442\\u043e\\u0432\\u0430\\u0440\\u0430\", \"object\": \"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u0434\\u043b\\u044f \\u041f\\u0440\\u0435\\u0434\\u0442\\u0440\\u0435\\u043d\\u0438\\u0440\\u043e\\u0432\\u043e\\u0447\\u043d\\u044b\\u0439 \\u043a\\u043e\\u043c\\u043f\\u043b\\u0435\\u043a\\u0441 PRIMEKRAFT PRE-WORKOUT BOOST\"}}, {\"added\": {\"name\": \"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u0442\\u043e\\u0432\\u0430\\u0440\\u0430\", \"object\": \"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u0434\\u043b\\u044f \\u041f\\u0440\\u0435\\u0434\\u0442\\u0440\\u0435\\u043d\\u0438\\u0440\\u043e\\u0432\\u043e\\u0447\\u043d\\u044b\\u0439 \\u043a\\u043e\\u043c\\u043f\\u043b\\u0435\\u043a\\u0441 PRIMEKRAFT PRE-WORKOUT BOOST\"}}]',10,3),(45,'2025-06-08 21:42:29.682797','7','Предтренировочный комплекс PRIMEKRAFT PRE-WORKOUT BOOST',2,'[]',10,3),(46,'2025-06-08 22:03:54.542384','8','Протеин BSN Syntha-6 Edge',1,'[{\"added\": {}}]',10,3),(47,'2025-06-08 22:04:29.730449','8','Протеин BSN Syntha-6 Edge',2,'[{\"added\": {\"name\": \"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u0442\\u043e\\u0432\\u0430\\u0440\\u0430\", \"object\": \"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u0434\\u043b\\u044f \\u041f\\u0440\\u043e\\u0442\\u0435\\u0438\\u043d BSN Syntha-6 Edge\"}}, {\"added\": {\"name\": \"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u0442\\u043e\\u0432\\u0430\\u0440\\u0430\", \"object\": \"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u0434\\u043b\\u044f \\u041f\\u0440\\u043e\\u0442\\u0435\\u0438\\u043d BSN Syntha-6 Edge\"}}]',10,3),(48,'2025-06-08 22:09:17.149958','9','Muscletech 100% Mass Gainer™',1,'[{\"added\": {}}, {\"added\": {\"name\": \"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u0442\\u043e\\u0432\\u0430\\u0440\\u0430\", \"object\": \"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u0434\\u043b\\u044f Muscletech 100% Mass Gainer\\u2122\"}}, {\"added\": {\"name\": \"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u0442\\u043e\\u0432\\u0430\\u0440\\u0430\", \"object\": \"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u0434\\u043b\\u044f Muscletech 100% Mass Gainer\\u2122\"}}]',10,3),(49,'2025-06-08 22:11:02.345797','8','Протеин BSN Syntha-6 Edge',2,'[{\"changed\": {\"fields\": [\"\\u041e\\u043f\\u0438\\u0441\\u0430\\u043d\\u0438\\u0435\", \"\\u0421\\u043e\\u0441\\u0442\\u0430\\u0432\"]}}]',10,3),(50,'2025-06-08 22:12:01.865782','9','Muscletech 100% Mass Gainer™',2,'[{\"changed\": {\"name\": \"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u0442\\u043e\\u0432\\u0430\\u0440\\u0430\", \"object\": \"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u0434\\u043b\\u044f Muscletech 100% Mass Gainer\\u2122\", \"fields\": [\"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435\"]}}]',10,3),(51,'2025-06-08 22:12:50.992067','7','Предтренировочный комплекс PRIMEKRAFT PRE-WORKOUT BOOST',2,'[{\"changed\": {\"name\": \"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u0442\\u043e\\u0432\\u0430\\u0440\\u0430\", \"object\": \"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u0434\\u043b\\u044f \\u041f\\u0440\\u0435\\u0434\\u0442\\u0440\\u0435\\u043d\\u0438\\u0440\\u043e\\u0432\\u043e\\u0447\\u043d\\u044b\\u0439 \\u043a\\u043e\\u043c\\u043f\\u043b\\u0435\\u043a\\u0441 PRIMEKRAFT PRE-WORKOUT BOOST\", \"fields\": [\"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435\"]}}]',10,3),(52,'2025-06-08 22:13:34.625790','7','Предтренировочный комплекс PRIMEKRAFT PRE-WORKOUT BOOST',2,'[{\"changed\": {\"name\": \"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u0442\\u043e\\u0432\\u0430\\u0440\\u0430\", \"object\": \"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u0434\\u043b\\u044f \\u041f\\u0440\\u0435\\u0434\\u0442\\u0440\\u0435\\u043d\\u0438\\u0440\\u043e\\u0432\\u043e\\u0447\\u043d\\u044b\\u0439 \\u043a\\u043e\\u043c\\u043f\\u043b\\u0435\\u043a\\u0441 PRIMEKRAFT PRE-WORKOUT BOOST\", \"fields\": [\"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435\"]}}]',10,3),(53,'2025-06-08 22:14:05.186790','7','Предтренировочный комплекс PRIMEKRAFT PRE-WORKOUT BOOST',2,'[{\"changed\": {\"name\": \"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u0442\\u043e\\u0432\\u0430\\u0440\\u0430\", \"object\": \"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u0434\\u043b\\u044f \\u041f\\u0440\\u0435\\u0434\\u0442\\u0440\\u0435\\u043d\\u0438\\u0440\\u043e\\u0432\\u043e\\u0447\\u043d\\u044b\\u0439 \\u043a\\u043e\\u043c\\u043f\\u043b\\u0435\\u043a\\u0441 PRIMEKRAFT PRE-WORKOUT BOOST\", \"fields\": [\"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435\"]}}]',10,3),(54,'2025-06-08 22:14:58.120783','7','Предтренировочный комплекс PRIMEKRAFT PRE-WORKOUT BOOST',2,'[{\"changed\": {\"name\": \"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u0442\\u043e\\u0432\\u0430\\u0440\\u0430\", \"object\": \"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435 \\u0434\\u043b\\u044f \\u041f\\u0440\\u0435\\u0434\\u0442\\u0440\\u0435\\u043d\\u0438\\u0440\\u043e\\u0432\\u043e\\u0447\\u043d\\u044b\\u0439 \\u043a\\u043e\\u043c\\u043f\\u043b\\u0435\\u043a\\u0441 PRIMEKRAFT PRE-WORKOUT BOOST\", \"fields\": [\"\\u0418\\u0437\\u043e\\u0431\\u0440\\u0430\\u0436\\u0435\\u043d\\u0438\\u0435\"]}}]',10,3),(55,'2025-06-08 22:15:12.147802','7','Предтренировочный комплекс PRIMEKRAFT PRE-WORKOUT BOOST',3,'',10,3),(56,'2025-06-08 22:15:23.487186','9','Muscletech 100% Mass Gainer™',2,'[{\"changed\": {\"fields\": [\"\\u0426\\u0435\\u043d\\u0430 \\u0441\\u043e \\u0441\\u043a\\u0438\\u0434\\u043a\\u043e\\u0439\"]}}]',10,3),(57,'2025-06-08 22:54:23.087086','6','Аминокислоты Maxler 100% Golden BCAA 2:1:1',3,'',10,3);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (7,'accounts','profile'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(13,'cart','cartitem'),(5,'contenttypes','contenttype'),(14,'orders','order'),(15,'orders','orderitem'),(9,'products','brand'),(8,'products','category'),(10,'products','product'),(11,'products','productimage'),(12,'products','review'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-04-25 09:28:44.141133'),(2,'auth','0001_initial','2025-04-25 09:28:44.620814'),(3,'admin','0001_initial','2025-04-25 09:28:44.744941'),(4,'admin','0002_logentry_remove_auto_add','2025-04-25 09:28:44.751082'),(5,'admin','0003_logentry_add_action_flag_choices','2025-04-25 09:28:44.756548'),(6,'contenttypes','0002_remove_content_type_name','2025-04-25 09:28:44.849194'),(7,'auth','0002_alter_permission_name_max_length','2025-04-25 09:28:44.902235'),(8,'auth','0003_alter_user_email_max_length','2025-04-25 09:28:44.924472'),(9,'auth','0004_alter_user_username_opts','2025-04-25 09:28:44.930704'),(10,'auth','0005_alter_user_last_login_null','2025-04-25 09:28:45.001544'),(11,'auth','0006_require_contenttypes_0002','2025-04-25 09:28:45.005247'),(12,'auth','0007_alter_validators_add_error_messages','2025-04-25 09:28:45.012384'),(13,'auth','0008_alter_user_username_max_length','2025-04-25 09:28:45.081681'),(14,'auth','0009_alter_user_last_name_max_length','2025-04-25 09:28:45.139809'),(15,'auth','0010_alter_group_name_max_length','2025-04-25 09:28:45.153588'),(16,'auth','0011_update_proxy_permissions','2025-04-25 09:28:45.163642'),(17,'auth','0012_alter_user_first_name_max_length','2025-04-25 09:28:45.220488'),(18,'sessions','0001_initial','2025-04-25 09:28:45.248226'),(19,'accounts','0001_initial','2025-04-25 09:29:28.718451'),(20,'products','0001_initial','2025-04-25 09:29:29.105119'),(21,'cart','0001_initial','2025-04-25 09:29:29.247272'),(22,'orders','0001_initial','2025-04-25 09:29:29.504374'),(23,'cart','0002_delete_cartitem','2025-04-25 09:53:55.970552'),(24,'products','0002_add_categories','2025-05-10 09:44:52.310953'),(25,'orders','0002_alter_order_full_name','2025-06-08 21:12:38.738820'),(26,'products','0003_product_is_new','2025-06-08 21:12:38.775489');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('3eemt4ypebxfgsimnxgz61s4ejcf9mag','.eJxVjsEOgjAQRP9lz6TZYguFo3e_gbTdraCmaCkHQ_h3bcJBL3OYeTOZDQa75nFYF07DRNDDCapfz1l_51gCutl4nYWfY06TEwURR7qIy0z8OB_s38Bol7G0W2VD0IaNJDQUmCg0yruaVO28ZEMdNlopY5zWrOqWZSCsfYu6c2jkd9TblKHfoCvyWm3MU35DLyt4pslz-Y6IAhH2ff8AZ2NFuw:1uOQE6:r_AdYrsGZm4v1d64JBC8LG2a-YxqjFmKlse4JmYmb_E','2025-06-23 00:18:58.944412'),('fe9gidmg6eb9trnry3d633zcd2qrwvqf','.eJxVjDEOgzAMRe_iuYpwEiBh7M4ZkI2dQluBRGBC3L1FYmH9772_Q0_LCs1-PKCjbR26LevSjQININw2pv6j0wnkTdNrNv08rcvI5lTMRbNpZ9Hv83JvBwPl4V9rpeqc93XFtcZgXYHKqUQpmIMlrJIVF7FOzoeEVHIIErxFp2XEKBaOHyATOpg:1u8G2b:j1D4uFojBVZvcEvMALjqszhTRIqiPMq3rtCTApd1hpY','2025-05-09 10:12:17.604515'),('mgbeunswj23spgtfihg8pg60gn2wly1l','.eJxVjDEOgzAMRe_iuYpwEiBh7M4ZkI2dQluBRGBC3L1FYmH9772_Q0_LCs1-PKCjbR26LevSjQININw2pv6j0wnkTdNrNv08rcvI5lTMRbNpZ9Hv83JvBwPl4V9rpeqc93XFtcZgXYHKqUQpmIMlrJIVF7FOzoeEVHIIErxFp2XEKBaOHyATOpg:1u8Ftg:G2__Z9Y3XImgVbpZmnm_Jc1xhUYr2Q8iE-FSL9OQNXM','2025-05-09 10:03:04.510210'),('okda41y1tum3p8z62fdem43myrplrbu4','.eJxVjb0OgzAQg9_lZhTlkgAJY_c-A8rPUdJWoQ1hqBDvXpAY2sWD_dleobdLGftlptzHAB0gVL-es_5B6QjC3abbxPyUSo6OHQg705ldp0DPy8n-DYx2Hvc2NURSKtU2riWjheRIbqgxcOe0sNgMIkiD7SCVHtDWTuuglUBJtUETxD7qbS7QrSAOeS82lVg-0GEFrxw97SeCc844h23bvgW0RL8:1uFE2c:FMiRFQK6S0pc3AxpzW8v4K16EJaBrOaKn0doXcwz8kA','2025-05-28 15:29:06.439084'),('umwjeyihtnnyli8cg46d2eg3osjgudaj','.eJxVjMEOwiAQBf-FsyGAULY9evcbCLCLVE2bAD01_Xcl6UGvb-bNzpzfWnZbpeJmZBO7ssvvFnx80dIBPv3yWHlcl1bmwLvCT1r5fUV63073L5B9zf1ttU_JAIFEAZgIMQ06BoVahSgJcBSD0RogGENaWZIJhYpWmDEIkN9o9KWxaT-OD07iO4w:1uOQNw:squhMmuzraSze6F-WDKSo2Wvm9gIIP29FN2x5boAGXA','2025-06-23 00:29:08.898803');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_order`
--

DROP TABLE IF EXISTS `orders_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` longtext NOT NULL,
  `status` varchar(20) NOT NULL,
  `shipping_method` varchar(20) NOT NULL,
  `payment_method` varchar(20) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_order_user_id_e9b59eb1_fk_auth_user_id` (`user_id`),
  CONSTRAINT `orders_order_user_id_e9b59eb1_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_order`
--

LOCK TABLES `orders_order` WRITE;
/*!40000 ALTER TABLE `orders_order` DISABLE KEYS */;
INSERT INTO `orders_order` VALUES (15,'Павлов Илья Витальевич','unitaz228pickoed1337482@yandex.ru','83123123213','1231231231232132131232131231231231','completed','post','online',3000.00,'2025-06-08 20:23:25.154703','2025-06-08 20:24:47.099242',3),(16,'Павлов Илья Витальевич','unitaz228pickoed1337482@yandex.ru','89301575784','кудыкина гора','completed','post','online',5000.00,'2025-06-09 00:28:27.523937','2025-06-09 00:28:37.952197',3);
/*!40000 ALTER TABLE `orders_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders_orderitem`
--

DROP TABLE IF EXISTS `orders_orderitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders_orderitem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `price` decimal(10,2) NOT NULL,
  `quantity` int unsigned NOT NULL,
  `order_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_orderitem_order_id_fe61a34d_fk_orders_order_id` (`order_id`),
  KEY `orders_orderitem_product_id_afe4254a_fk_products_product_id` (`product_id`),
  CONSTRAINT `orders_orderitem_order_id_fe61a34d_fk_orders_order_id` FOREIGN KEY (`order_id`) REFERENCES `orders_order` (`id`),
  CONSTRAINT `orders_orderitem_product_id_afe4254a_fk_products_product_id` FOREIGN KEY (`product_id`) REFERENCES `products_product` (`id`),
  CONSTRAINT `orders_orderitem_chk_1` CHECK ((`quantity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders_orderitem`
--

LOCK TABLES `orders_orderitem` WRITE;
/*!40000 ALTER TABLE `orders_orderitem` DISABLE KEYS */;
INSERT INTO `orders_orderitem` VALUES (15,3000.00,1,15,4),(16,5000.00,1,16,8);
/*!40000 ALTER TABLE `orders_orderitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_brand`
--

DROP TABLE IF EXISTS `products_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_brand` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `logo` varchar(100) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_brand`
--

LOCK TABLES `products_brand` WRITE;
/*!40000 ALTER TABLE `products_brand` DISABLE KEYS */;
INSERT INTO `products_brand` VALUES (1,'zveroboy','zveroboy','','2025-04-25 10:14:44.704395'),(2,'Be first','be-first','brands/bi-ferst.jpg','2025-05-14 11:38:29.958703'),(3,'Muscletech','muscletech','','2025-06-08 18:53:08.123509'),(4,'Optimum Nutrition','optimum-nutrition','','2025-06-08 18:53:50.231733'),(5,'BSN','bsn','','2025-06-08 18:54:02.791314'),(6,'Geneticlab Nutrition','geneticlab-nutrition','','2025-06-08 18:54:10.014063'),(7,'Maxler','maxler','','2025-06-08 18:54:18.131418'),(8,'Prime Kraft','prime-kraft','','2025-06-08 18:54:49.326889'),(9,'Insane Labz','insane-labz','','2025-06-08 19:08:49.166086');
/*!40000 ALTER TABLE `products_brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_category`
--

DROP TABLE IF EXISTS `products_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_category`
--

LOCK TABLES `products_category` WRITE;
/*!40000 ALTER TABLE `products_category` DISABLE KEYS */;
INSERT INTO `products_category` VALUES (2,'Протеин','protein','Протеиновые добавки для набора мышечной массы и восстановления','2025-05-10 09:44:52.303385'),(3,'Аминокислоты','amino','Аминокислотные комплексы для поддержки мышечного роста и восстановления','2025-05-10 09:44:52.304579'),(4,'Гейнер','gainer','Высококалорийные смеси для набора массы','2025-05-10 09:44:52.305382'),(5,'Креатин','creatine','Креатиновые добавки для увеличения силы и выносливости','2025-05-10 09:44:52.306231'),(6,'Витамины','vitamins','Витаминные комплексы для поддержания здоровья','2025-05-10 09:44:52.307094'),(7,'БАДы','supplements','Биологически активные добавки для поддержания здоровья','2025-05-10 09:44:52.307859'),(8,'Прочее','other','Другие спортивные добавки и аксессуары','2025-05-10 09:44:52.308571');
/*!40000 ALTER TABLE `products_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_product`
--

DROP TABLE IF EXISTS `products_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `discount_price` decimal(10,2) DEFAULT NULL,
  `stock_quantity` int unsigned NOT NULL,
  `weight` decimal(10,2) DEFAULT NULL,
  `flavor` varchar(100) NOT NULL,
  `composition` longtext NOT NULL,
  `is_featured` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `popularity` int unsigned NOT NULL,
  `brand_id` bigint DEFAULT NULL,
  `category_id` bigint DEFAULT NULL,
  `is_new` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `products_product_brand_id_3e2e8fd1_fk_products_brand_id` (`brand_id`),
  KEY `products_product_category_id_9b594869_fk_products_category_id` (`category_id`),
  CONSTRAINT `products_product_brand_id_3e2e8fd1_fk_products_brand_id` FOREIGN KEY (`brand_id`) REFERENCES `products_brand` (`id`),
  CONSTRAINT `products_product_category_id_9b594869_fk_products_category_id` FOREIGN KEY (`category_id`) REFERENCES `products_category` (`id`),
  CONSTRAINT `products_product_chk_1` CHECK ((`stock_quantity` >= 0)),
  CONSTRAINT `products_product_chk_2` CHECK ((`popularity` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_product`
--

LOCK TABLES `products_product` WRITE;
/*!40000 ALTER TABLE `products_product` DISABLE KEYS */;
INSERT INTO `products_product` VALUES (2,'EAA','eaa','7 видов аминокислот в одной упаковке.',2000.00,NULL,100,160.00,'Апельсин','',0,'2025-05-14 11:38:34.215602','2025-06-08 23:52:04.419827',15,2,3,0),(3,'MuscleTech, Creatine Chews, Boogieman Punch','muscletech-creatine-chews-boogieman-punch','Limited Edition',5000.00,NULL,100,90.00,'Без вкуса','Размер порции: 3 жевательные таблетки\r\nПорций в упаковке: 30\r\nКоличество на порцию:\r\nКалории: 20\r\nВсего углеводов: 5 г (2% дневной нормы)\r\nВсего сахара: 5 г\r\nВключает 4 г добавленного сахара (8% дневной нормы)\r\nНатрий: 5 мг (<1% дневной нормы)\r\nМоногидрат креатина Creapure®: 3 г\r\nДругие ингредиенты:\r\nДекстроза\r\nСтеариновая кислота\r\nНатуральные ароматизаторы\r\nЛимонная кислота\r\nСтеарат магния\r\nДиоксид кремния\r\nСукралоза',1,'2025-06-08 19:00:32.484390','2025-06-08 23:52:49.409754',10,3,5,0),(4,'Insane Labz Psychotic Gold','insane-labz-psychotic-gold','Cherry Bomb',3000.00,NULL,0,190.00,'Вишня','Конечно, вот текст с изображения:\r\nКоличество питательных веществ в одной порции продукта:\r\n1 порция - 5,8 грамм\r\nСостав:\r\nСмесь Psychotic Gold — 4234 гр\r\nбета-аланин, L-цитруллин малат, сульфат ацетамида, безводный кофеин, битартрат DMAE, цитрат кофеина, AMPiberry (Можжевельник) (ягода) OxyGold (фульвокислота) экстракт rauwolfia vomitoria\r\nИнгредиенты\r\nАроматизатор, лимонная кислота, винная кислота, диоксид кремния, сукралоза, силикат кальция, ацесульфам калия, краситель',1,'2025-06-08 19:12:12.935197','2025-06-08 23:53:05.952714',7,9,7,0),(5,'Креатин Geneticlab Creatine','kreatin-geneticlab-creatine','Классика.',2000.00,NULL,100000,500.00,'Без вкуса','Креатин Многогидрат',0,'2025-06-08 21:10:45.190642','2025-06-08 23:52:55.144255',2,6,5,0),(8,'Протеин BSN Syntha-6 Edge','protein-bsn-syntha-6-edge','Вкусняшка.',5000.00,NULL,100000,1060.00,'Молочный коктейль с ванилью','концентрат белка молочной сыворотки, изолят белка молочной сыворотки, гидролизат изолята белка молочной сыворотки, концентрат молочного белка\r\nПищевая ценность на 100г\r\nБелки, г\r\n62\r\nЖиры, г\r\n11\r\nУглеводы, г\r\n16\r\nЭнергетическая ценность, кДж\r\n421',1,'2025-06-08 22:03:54.541819','2025-06-09 00:22:55.763075',4,5,2,0),(9,'Muscletech 100% Mass Gainer™','muscletech-100-mass-gainer','Реальный шоколад.',4000.00,3000.00,10000,2330.00,'Шоколад','Смотреть на фото упаковки.',0,'2025-06-08 22:09:17.146297','2025-06-09 00:22:46.028783',13,3,4,0);
/*!40000 ALTER TABLE `products_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_productimage`
--

DROP TABLE IF EXISTS `products_productimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_productimage` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `image` varchar(100) NOT NULL,
  `is_primary` tinyint(1) NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `product_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `products_productimage_product_id_e747596a_fk_products_product_id` (`product_id`),
  CONSTRAINT `products_productimage_product_id_e747596a_fk_products_product_id` FOREIGN KEY (`product_id`) REFERENCES `products_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_productimage`
--

LOCK TABLES `products_productimage` WRITE;
/*!40000 ALTER TABLE `products_productimage` DISABLE KEYS */;
INSERT INTO `products_productimage` VALUES (1,'products/b3b50365ed4a8289e4e1230b802ff0a9959310001000tr-jpg.jpg',0,'2025-05-14 16:01:25.791368',2),(2,'products/optimize.webp',0,'2025-05-14 16:01:25.793439',2),(3,'products/optimize_1.webp',0,'2025-05-14 16:01:25.795204',2),(4,'products/optimize_2.webp',0,'2025-06-08 19:00:32.486671',3),(5,'products/optimize_3.webp',0,'2025-06-08 19:00:32.488113',3),(6,'products/optimize_4.webp',0,'2025-06-08 19:12:12.937001',4),(7,'products/optimize_5.webp',0,'2025-06-08 19:12:12.938403',4),(8,'products/optimize_6.webp',0,'2025-06-08 21:10:45.192236',5),(9,'products/optimize_7.webp',0,'2025-06-08 21:10:45.193709',5),(14,'products/145087760299.jpg',0,'2025-06-08 22:04:29.728884',8),(15,'products/600x600.webp',0,'2025-06-08 22:04:29.729984',8),(16,'products/7522158851.webp',0,'2025-06-08 22:09:17.147807',9),(17,'products/orig.webp',0,'2025-06-08 22:09:17.149502',9);
/*!40000 ALTER TABLE `products_productimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_review`
--

DROP TABLE IF EXISTS `products_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_review` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `rating` smallint unsigned NOT NULL,
  `comment` longtext NOT NULL,
  `created_at` datetime(6) NOT NULL,
  `product_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_review_product_id_user_id_6a28a89d_uniq` (`product_id`,`user_id`),
  KEY `products_review_user_id_2e53b831_fk_auth_user_id` (`user_id`),
  CONSTRAINT `products_review_product_id_d933ffa7_fk_products_product_id` FOREIGN KEY (`product_id`) REFERENCES `products_product` (`id`),
  CONSTRAINT `products_review_user_id_2e53b831_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `products_review_chk_1` CHECK ((`rating` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_review`
--

LOCK TABLES `products_review` WRITE;
/*!40000 ALTER TABLE `products_review` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'sports_nutrition_db'
--

--
-- Dumping routines for database 'sports_nutrition_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-09  3:43:41
