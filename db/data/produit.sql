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
-- Table structure for table `produit`
--

DROP TABLE IF EXISTS `produit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produit` (
  `p_id` int(32) NOT NULL AUTO_INCREMENT,
  `p_famille` int(16) DEFAULT NULL,
  `p_fourn` int(32) DEFAULT NULL,
  `p_code` varchar(64) DEFAULT NULL,
  `p_libelle` varchar(64) DEFAULT NULL,
  `p_photo` varchar(64) DEFAULT NULL,
  `p_ean` varchar(128) DEFAULT NULL,
  `p_dlc_req` tinyint(1) DEFAULT NULL,
  `p_seuil` int(16) DEFAULT NULL,
  `p_freq` int(16) DEFAULT NULL,
  `p_unite` int(32) DEFAULT NULL,
  `p_poids` int(32) DEFAULT NULL,
  `p_prix_gp` int(32) DEFAULT NULL,
  `p_prix_log` int(32) DEFAULT NULL,
  `p_prix_achat` int(32) DEFAULT NULL,
  `p_vendupoids` tinyint(1) DEFAULT NULL,
  `p_prix_vente` int(32) DEFAULT NULL,
  `p_nouveau` tinyint(1) DEFAULT NULL,
  `p_supprime` tinyint(1) DEFAULT '0',
  `p_comment` text,
  `p_ref_fourn` varchar(64) DEFAULT NULL,
  `p_faitpar` int(32) DEFAULT NULL,
  `p_cree` datetime DEFAULT NULL,
  `p_modifie` datetime DEFAULT NULL,
  PRIMARY KEY (`p_id`),
  KEY `i47` (`p_famille`),
  KEY `i48` (`p_fourn`),
  KEY `i49` (`p_code`),
  KEY `i50` (`p_libelle`),
  KEY `i51` (`p_ean`),
  KEY `i52` (`p_supprime`)
) ENGINE=InnoDB AUTO_INCREMENT=783926 DEFAULT CHARSET=latin1;
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
