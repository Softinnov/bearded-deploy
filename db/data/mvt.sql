-- MySQL dump 10.13  Distrib 5.5.44, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: prod
-- ------------------------------------------------------
-- Server version	5.5.44-0+deb7u1-log

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
-- Position to start replication or point-in-time recovery from
--

CHANGE MASTER TO MASTER_LOG_FILE='mysql-bin.000139', MASTER_LOG_POS=27934487;

--
-- Table structure for table `mvt`
--

DROP TABLE IF EXISTS `mvt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mvt` (
  `m_id` int(32) NOT NULL AUTO_INCREMENT,
  `m_pdv` int(32) DEFAULT NULL,
  `m_idstock` int(32) DEFAULT NULL,
  `m_produit` int(32) DEFAULT NULL,
  `m_qte` int(32) DEFAULT NULL,
  `m_lot` varchar(32) DEFAULT NULL,
  `m_date` datetime DEFAULT NULL,
  `m_sens` int(8) DEFAULT NULL,
  `m_type` int(32) DEFAULT NULL,
  `m_cmt` varchar(128) DEFAULT NULL,
  `m_faitpar` int(32) DEFAULT NULL,
  `m_source` int(32) NOT NULL DEFAULT '0',
  `m_livraison` int(32) DEFAULT NULL,
  PRIMARY KEY (`m_id`),
  KEY `i31` (`m_pdv`),
  KEY `i32` (`m_produit`),
  KEY `i33` (`m_qte`),
  KEY `i34` (`m_date`),
  KEY `i35` (`m_sens`),
  KEY `i36` (`m_type`),
  KEY `i37` (`m_faitpar`),
  KEY `i101` (`m_source`)
) ENGINE=InnoDB AUTO_INCREMENT=72301372 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-19 23:25:31
