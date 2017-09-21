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
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock` (
  `s_id` int(32) NOT NULL AUTO_INCREMENT,
  `s_pdv` int(32) DEFAULT NULL,
  `s_produit` int(32) DEFAULT NULL,
  `s_qte` int(32) DEFAULT NULL,
  `s_lot` varchar(32) DEFAULT NULL,
  `s_dlc` date DEFAULT NULL,
  `s_dluo` date DEFAULT NULL,
  `s_lieu` int(32) DEFAULT NULL,
  `s_reflieu` varchar(32) DEFAULT NULL,
  `s_dateentree` datetime DEFAULT NULL,
  `s_etat` tinyint(1) DEFAULT NULL,
  `s_vendable` tinyint(1) DEFAULT NULL,
  `s_prixpromo` int(32) DEFAULT NULL,
  `s_sommeil` tinyint(1) DEFAULT NULL,
  `s_x1000` int(16) DEFAULT NULL,
  `s_faitpar` int(32) DEFAULT NULL,
  `s_modifie` datetime DEFAULT NULL,
  `s_source` int(32) NOT NULL DEFAULT '0',
  `s_livraison` int(32) DEFAULT NULL,
  PRIMARY KEY (`s_id`),
  KEY `i54` (`s_pdv`),
  KEY `i55` (`s_produit`),
  KEY `i56` (`s_qte`),
  KEY `i57` (`s_dlc`),
  KEY `i58` (`s_dluo`),
  KEY `i100` (`s_source`)
) ENGINE=InnoDB AUTO_INCREMENT=4207096 DEFAULT CHARSET=latin1;
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
