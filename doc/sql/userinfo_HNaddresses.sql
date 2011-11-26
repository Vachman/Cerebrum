CREATE DATABASE  IF NOT EXISTS `userinfo` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `userinfo`;
-- MySQL dump 10.13  Distrib 5.1.34, for apple-darwin9.5.0 (i386)
--
-- Host: 89.255.64.40    Database: userinfo
-- ------------------------------------------------------
-- Server version	5.0.89-log

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
-- Not dumping tablespaces as no INFORMATION_SCHEMA.FILES table on this server
--

--
-- Table structure for table `HNaddresses`
--

DROP TABLE IF EXISTS `HNaddresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `HNaddresses` (
  `id` smallint(2) NOT NULL auto_increment,
  `region` smallint(3) NOT NULL default '0',
  `address` varchar(30) NOT NULL default '',
  `countent` tinyint(4) NOT NULL default '0',
  `ent` varchar(80) NOT NULL default '',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `address` (`address`)
) ENGINE=MyISAM AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HNaddresses`
--

/*!40000 ALTER TABLE `HNaddresses` DISABLE KEYS */;
INSERT INTO `HNaddresses` VALUES (1,101,'Молодежная 1',6,''),(2,101,'Молодежная 3',2,''),(3,101,'Молодежная 5',5,''),(4,101,'Бабакина 13',6,''),(5,101,'Юбилейный 9',1,''),(6,102,'Юбилейный 4',1,''),(7,102,'Юбилейный 6',5,''),(8,102,'Юбилейный 8',1,''),(9,102,'Юбилейный 10',5,''),(10,102,'Юбилейный 18',1,''),(11,102,'Юбилейный 20',5,''),(12,102,'Юбилейный 22',1,''),(13,103,'Молодежный пр-д 8',3,'1 17 4:1 21 4:1 24 4'),(14,103,'Молодежная 50',8,'1 17 4:1 21 4:1 24 4:1 24 4:3 24 4:1 24 4:1 21 4:1 21 4'),(15,0,'Юбилейный 33/2',0,''),(16,201,'1-Мая 28',2,''),(17,201,'1-Мая 29',5,''),(18,201,'1-Мая 31',8,''),(19,201,'1-Мая 34',6,''),(20,201,'1-Мая 35',6,''),(21,201,'1-Мая 37',8,''),(22,103,'Мельникова 7',4,'1 18 4:1 22 4:1 25 4:1 25 4'),(23,103,'Мельникова 15',4,'1 22 4:1 25 4:1 25 4:1 25 4'),(24,103,'Молодежный пр-д 6',5,'1 18 4:1 22 4:1 25 4:1 25 4:1 25 4'),(25,103,'Молодежная 52',9,'1 18 4:1 22 4:1 25 4:1 25 4:1 25 4:1 25 4:1 25 4:1 22 4:1 18 4'),(26,103,'Молодежная 54',8,'1 22 4:1 25 4:1 25 4:1 25 4:1 25 4:1 25 4:1 25 4:1 22 4'),(27,104,'Молодежная 64',9,'1 18 4:1 22 4:1 25 4:1 25 4:1 25 4:1 25 4:1 25 4:1 22 4:1 18 4'),(28,104,'Молодежная 60',6,''),(29,201,'1-Мая 36',1,''),(30,201,'1-Мая 25',4,''),(31,104,'Молодежная 68',5,''),(32,104,'Молодежная 70',9,''),(33,105,'Панфилова 1',7,''),(34,105,'Горшина 1',9,''),(35,201,'1-Мая 26',5,''),(36,105,'Горшина 2',8,''),(37,104,'Молодежная 76',9,''),(38,105,'Горшина 3',2,''),(39,105,'Горшина 6 к.2',2,''),(40,105,'Горшина 9 к.1',2,''),(41,105,'Горшина 9 к.2',2,''),(42,106,'Юбилейный пр. 1 корп 2',1,''),(43,106,'Юбилейный пр. 1 корп 1',1,''),(44,106,'Юбилейный пр. 1 корп 3',1,''),(45,105,'Горшина 5',1,''),(46,105,'Горшина 8',1,''),(47,201,'1-Мая 36 к. 2',2,''),(48,104,'Молодежная 74',6,''),(49,101,'Рогова 9',1,''),(50,107,'Ленинский проспект д.1 к.1',1,''),(51,107,'Ленинский проспект д.1 к.2',1,''),(52,107,'Ленинский проспект д.1 к.3',1,''),(53,107,'Энгельса 27',3,''),(54,108,'Планерная 9',3,''),(55,108,'Планерная 11',2,''),(56,108,'Планерная 19',5,''),(57,108,'Планерная 20',2,''),(58,109,'Чернышевского 1',7,''),(59,102,'Юбилейный 88',0,''),(60,108,'Планерная 4',1,''),(61,110,'Новозаводская 10',5,''),(62,110,'Новозаводская 11',5,''),(63,110,'Новозаводская 12',5,''),(64,110,'Папанина 38 к1',5,''),(65,110,'Фрунзе 18',3,''),(66,110,'Папанина 38 к4',1,''),(67,111,'Энгельса 7/15',6,'');
/*!40000 ALTER TABLE `HNaddresses` ENABLE KEYS */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-11-23 16:36:06
