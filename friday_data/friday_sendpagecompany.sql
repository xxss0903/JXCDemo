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
-- Table structure for table `sendpagecompany`
--

DROP TABLE IF EXISTS `sendpagecompany`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sendpagecompany` (
  `t_id` int(11) NOT NULL COMMENT '公司id',
  `t_company` varchar(45) DEFAULT NULL COMMENT '公司名称',
  `t_xy` varchar(45) DEFAULT NULL COMMENT '社会统一信用代码',
  `t_kh_bank` varchar(45) DEFAULT NULL COMMENT '开户行',
  `t_baccount` varchar(45) DEFAULT NULL COMMENT '开户行账号',
  `t_address` varchar(45) DEFAULT NULL COMMENT '公司地址',
  `t_phone` varchar(45) DEFAULT NULL COMMENT '电话',
  `t_fax_phone` varchar(45) DEFAULT NULL COMMENT '传真号码',
  `t_mail` varchar(45) DEFAULT NULL COMMENT '邮编',
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='送货单被送货对象公司';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sendpagecompany`
--

LOCK TABLES `sendpagecompany` WRITE;
/*!40000 ALTER TABLE `sendpagecompany` DISABLE KEYS */;
INSERT INTO `sendpagecompany` VALUES (1,'贵港市万千饲料有限责任公司','914508007086454535','中国农业银行股份有限公司贵港港南支行','461101040005488','广西贵港市港南区江南罗泊湾屯','0775-4337875','0775-4338102','537100');
/*!40000 ALTER TABLE `sendpagecompany` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-13 23:29:14
