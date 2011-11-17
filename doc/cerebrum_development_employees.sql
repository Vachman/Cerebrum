CREATE DATABASE  IF NOT EXISTS `cerebrum_development` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `cerebrum_development`;
-- MySQL dump 10.13  Distrib 5.1.34, for apple-darwin9.5.0 (i386)
--
-- Host: 127.0.0.1    Database: cerebrum_development
-- ------------------------------------------------------
-- Server version	5.5.12

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
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `position` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `department_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Обухов Евгений','2011-10-21 13:47:31','2011-10-21 14:59:22','Телефонист',5),(2,'Геворкян Вачаган','2011-10-21 13:47:50','2011-10-21 14:57:55','Poker Face',5),(3,'Багдасарян Ерванд Андреевич\n','2011-11-01 12:14:21','2011-11-01 12:14:21','Генеральный директор',NULL),(4,'Авдиянц Станислав Петрович\n','2011-11-01 12:14:21','2011-11-01 12:14:21','Коммерческий директор',NULL),(5,'Коростик Екатерина Ивановна\n','2011-11-01 12:14:21','2011-11-01 12:14:21','Менеджер по продажам',NULL),(6,'Белковская Наталия Игоревна\n','2011-11-01 12:14:21','2011-11-01 12:14:21','Менеджер по продажам',NULL),(7,'Сафарян Александр Сергеевич\n','2011-11-01 12:14:21','2011-11-01 12:14:21','Проектировщик',NULL),(8,'Фельдман Илья Алексеевич','2011-11-01 12:14:21','2011-11-01 12:32:09','Технический директор',5),(9,'Горшкова Анна\n','2011-11-01 12:14:21','2011-11-01 12:14:21','Cекретарь',NULL),(10,'Курлыгин Дмитрий\n','2011-11-01 12:14:21','2011-11-01 12:14:21','Специалист службы ТП',NULL),(11,'Константинов Сергей\n','2011-11-01 12:14:21','2011-11-01 12:14:21','Специалист службы ТП',NULL),(12,'Николаев Владимир Александрович\n','2011-11-01 12:14:21','2011-11-01 12:14:21','Специалист службы ТП',NULL),(13,'Ивашкин Николай\n','2011-11-01 12:14:21','2011-11-01 12:14:21','Специалисты службы ТП',NULL),(14,'Попов Сергей\n','2011-11-01 12:14:21','2011-11-01 12:14:21','Выезд. Монтажник',NULL),(15,'Борискин Денис\n','2011-11-01 12:14:21','2011-11-01 12:14:21','Выезд. Монтажник',NULL),(16,'Стародубцев Борис\n','2011-11-01 12:14:21','2011-11-01 12:14:21','Выезд. Инженер',NULL),(17,'Кондрашев Дмитрий','2011-11-01 12:14:21','2011-11-01 12:32:40','Выезд. Инженер',2);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-11-15  6:52:21
