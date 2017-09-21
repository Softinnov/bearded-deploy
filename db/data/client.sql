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
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `c_id` int(32) NOT NULL AUTO_INCREMENT,
  `c_pdv` int(32) DEFAULT NULL,
  `c_creation` tinyint(1) DEFAULT NULL,
  `c_beneficiaire` int(32) DEFAULT NULL,
  `c_ref_nom` varchar(32) DEFAULT NULL,
  `c_ref_prenom` varchar(32) DEFAULT NULL,
  `c_ref_org` int(32) DEFAULT NULL,
  `c_ref_tel` varchar(16) DEFAULT NULL,
  `c_alloue` varchar(256) DEFAULT NULL,
  `c_dated` date DEFAULT NULL,
  `c_datef` date DEFAULT NULL,
  `c_rav` int(32) DEFAULT NULL,
  `c_solde` int(32) DEFAULT NULL,
  `c_cmt` text,
  `c_supprime` tinyint(1) DEFAULT NULL,
  `c_faitpar` int(32) DEFAULT NULL,
  `c_cree` datetime DEFAULT NULL,
  `c_modifie` datetime DEFAULT NULL,
  `c_codeinterne` varchar(256) DEFAULT NULL,
  `c_dernpass` date DEFAULT NULL,
  PRIMARY KEY (`c_id`),
  KEY `i3` (`c_pdv`),
  KEY `i4` (`c_beneficiaire`),
  KEY `i5` (`c_dated`),
  KEY `i6` (`c_datef`),
  KEY `i7` (`c_supprime`)
) ENGINE=InnoDB AUTO_INCREMENT=276193 DEFAULT CHARSET=latin1;
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
