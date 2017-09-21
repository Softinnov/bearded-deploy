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
-- Table structure for table `pdv`
--

DROP TABLE IF EXISTS `pdv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pdv` (
  `pv_id` int(32) NOT NULL AUTO_INCREMENT,
  `pv_nom` varchar(128) DEFAULT NULL,
  `pv_statut` int(16) DEFAULT NULL,
  `pv_autre` varchar(256) DEFAULT NULL,
  `pv_adr_pdv` int(32) DEFAULT NULL,
  `pv_cnt_pdv` int(32) DEFAULT NULL,
  `pv_adr_liv` int(32) DEFAULT NULL,
  `pv_cnt_liv` int(32) DEFAULT NULL,
  `pv_adr_fct` int(32) DEFAULT NULL,
  `pv_cnt_fct` int(32) DEFAULT NULL,
  `pv_paiement` int(32) DEFAULT NULL,
  `pv_mnt_attr` int(32) DEFAULT NULL,
  `pv_adherent` tinyint(1) DEFAULT NULL,
  `pv_cmt` text,
  `pv_supprime` tinyint(1) DEFAULT '0',
  `pv_faitpar` int(32) DEFAULT NULL,
  `pv_cree` datetime DEFAULT NULL,
  `pv_modifie` datetime DEFAULT NULL,
  `pv_abo_expire` datetime DEFAULT NULL,
  `pv_abo_etat` int(16) DEFAULT '237',
  `pv_abo_facturl` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`pv_id`),
  KEY `i41` (`pv_adr_pdv`),
  KEY `i42` (`pv_supprime`)
) ENGINE=InnoDB AUTO_INCREMENT=584 DEFAULT CHARSET=latin1;
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
