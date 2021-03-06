-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: friday
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `instockdetails`
--

DROP TABLE IF EXISTS `instockdetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `instockdetails` (
  `i_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '入库详单编号',
  `inStock_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '入库单编号',
  `p_id` int(11) DEFAULT NULL COMMENT '产品编号',
  `i_num` int(11) DEFAULT NULL COMMENT '入库数量',
  PRIMARY KEY (`i_id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instockdetails`
--

LOCK TABLES `instockdetails` WRITE;
/*!40000 ALTER TABLE `instockdetails` DISABLE KEYS */;
INSERT INTO `instockdetails` VALUES (20,'RK20190120220320612',6,100),(21,'RK20190120220320612',7,100),(22,'RK20190120230445398',1,10),(23,'RK20190120230541141',6,100),(24,'RK20190120230541141',7,100),(25,'RK20190120231344597',6,100),(26,'RK20190120231649063',1,100),(27,'RK20190120232100860',6,100),(28,'RK20190120232418662',7,100),(29,'RK20190120233210386',7,100),(30,'RK20190120233725828',1,100),(31,'RK20190120234018322',6,100),(32,'RK20190120234720536',6,1),(33,'RK20190120235437138',1,1),(34,'RK20190121000327971',6,100);
/*!40000 ALTER TABLE `instockdetails` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-21  0:20:00
