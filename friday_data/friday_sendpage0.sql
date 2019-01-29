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
-- Table structure for table `sendpage`
--

DROP TABLE IF EXISTS `sendpage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sendpage` (
  `s_id` int(11) NOT NULL,
  `s_date` datetime DEFAULT NULL COMMENT '日期',
  `s_number` varchar(45) DEFAULT NULL COMMENT '送货单编号',
  `s_content_id` int(11) DEFAULT NULL COMMENT '送货单的内容列表的id',
  `s_kp_id` int(11) DEFAULT NULL COMMENT '送货单送的品名对应的商品，可能有多个物品，这里需要查询 sendpageitems表单中对应的 i_id的数据',
  `s_company_id` int(11) DEFAULT NULL COMMENT '开票公司id',
  `s_total_price` float DEFAULT NULL COMMENT '总金额 = 开票金额 = 品名中商品的金额相加总数',
  `s_express_id` int(11) DEFAULT NULL COMMENT '快递表单中的id',
  `s_producer_id` int(11) DEFAULT NULL COMMENT '生产制作单位(供货方)表单中的id',
  `s_title` varchar(45) DEFAULT NULL COMMENT '送货单标题',
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='常规标签';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sendpage`
--

LOCK TABLES `sendpage` WRITE;
/*!40000 ALTER TABLE `sendpage` DISABLE KEYS */;
INSERT INTO `sendpage` VALUES (1,'2019-01-06 00:00:00','编号001',1,1,1,6600,1,1,'贵港市万千饲料有限责任公司标签材料2018年11月份送货单'),(2,'2019-01-12 00:00:00','编号002',2,1,1,8800,1,1,'贵港市万千饲料有限责任公司标签材料2018年12月份送货单');
/*!40000 ALTER TABLE `sendpage` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-21  0:20:01
