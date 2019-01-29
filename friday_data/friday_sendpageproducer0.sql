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
-- Table structure for table `sendpageproducer`
--

DROP TABLE IF EXISTS `sendpageproducer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sendpageproducer` (
  `p_id` int(11) NOT NULL COMMENT '制作商id',
  `p_company` varchar(45) DEFAULT NULL COMMENT '制作商公司名',
  `p_address` varchar(45) DEFAULT NULL COMMENT '公司地址',
  `p_tax_number` varchar(45) DEFAULT NULL COMMENT '税号',
  `p_kh_bank` varchar(45) DEFAULT NULL COMMENT '开户行',
  `p_bank_card` varchar(45) DEFAULT NULL COMMENT '开户行银行卡卡号',
  `p_bank_number` varchar(45) DEFAULT NULL COMMENT '开户行的行号',
  `p_phone1` varchar(45) DEFAULT NULL COMMENT '联系电话号码1',
  `p_phone2` varchar(45) DEFAULT NULL COMMENT '联系电话号码2',
  `p_contact_person` varchar(45) DEFAULT NULL COMMENT '业务联系人',
  `p_contact_phone` varchar(45) DEFAULT NULL COMMENT '业务联系人电话',
  PRIMARY KEY (`p_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='送货单制作单位信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sendpageproducer`
--

LOCK TABLES `sendpageproducer` WRITE;
/*!40000 ALTER TABLE `sendpageproducer` DISABLE KEYS */;
INSERT INTO `sendpageproducer` VALUES (1,'成都市世清源印刷有限公司','成都市金牛区白马寺北顺街68号 ','9151010675596916XA','成都银行金河支行','24012003216045100019','313651024014','0851-86513372','15185108889','陈金国','15185108889');
/*!40000 ALTER TABLE `sendpageproducer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-21  0:19:57
