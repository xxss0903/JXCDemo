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
-- Table structure for table `sendpageitems`
--

DROP TABLE IF EXISTS `sendpageitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sendpageitems` (
  `i_id` int(11) NOT NULL COMMENT '当前item的id',
  `i_item_id` int(11) DEFAULT NULL COMMENT '品名（标签布、碳带等）对应的item的id',
  `i_amount` int(11) DEFAULT NULL COMMENT '数量',
  `i_price_total` float DEFAULT NULL COMMENT '金额',
  `i_comment` varchar(45) DEFAULT NULL COMMENT '备注',
  `s_id` int(11) DEFAULT NULL COMMENT '对应送货单的id',
  `c_id` int(11) DEFAULT NULL COMMENT '所属的类别，比如标签材料类别',
  PRIMARY KEY (`i_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='送货单的类别中的物品，包含几种类型的物品\n i_id:送货单上面一个送货内容的子内容的id  \n s_id:对应的送货单的id\n c_id:对应的category的id 1:标签材料\n i_item_id:当前送货item对应的item的id（标签布，碳带的id） 1:标签布,2:碳带\n';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sendpageitems`
--

LOCK TABLES `sendpageitems` WRITE;
/*!40000 ALTER TABLE `sendpageitems` DISABLE KEYS */;
INSERT INTO `sendpageitems` VALUES (1,1,84,4200,'箱/券',1,1),(2,2,10,2000,'箱',1,1),(3,2,2,222,'箱',2,2),(4,2,33,123,'券',2,2);
/*!40000 ALTER TABLE `sendpageitems` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-13 23:29:23
