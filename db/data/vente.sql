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
-- Table structure for table `vente`
--

DROP TABLE IF EXISTS `vente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vente` (
  `v_id` int(32) NOT NULL AUTO_INCREMENT,
  `v_pdv` int(32) DEFAULT NULL,
  `v_client` int(32) DEFAULT NULL,
  `v_date` datetime DEFAULT NULL,
  `v_total` int(32) DEFAULT NULL,
  `v_modep` int(32) DEFAULT NULL,
  `v_fourni` int(32) DEFAULT NULL,
  `v_rendu` int(32) DEFAULT NULL,
  `v_solde` int(32) DEFAULT NULL,
  `v_caisse` int(8) DEFAULT NULL,
  `v_remise` int(32) DEFAULT NULL,
  `v_tarif` int(32) DEFAULT NULL,
  `v_faitpar` int(32) DEFAULT NULL,
  `v_ticket` int(32) DEFAULT NULL,
  `v_supprime` tinyint(1) DEFAULT '0',
  `v_mp_esp` int(32) DEFAULT NULL,
  `v_mp_chq` int(32) DEFAULT NULL,
  `v_mp_cb` int(32) DEFAULT NULL,
  `v_mp_autre` int(32) DEFAULT NULL,
  `v_mp_r1` int(32) DEFAULT NULL,
  `v_mp_r2` int(32) DEFAULT NULL,
  `v_mp_r3` int(32) DEFAULT NULL,
  `v_mp_r4` int(32) DEFAULT NULL,
  PRIMARY KEY (`v_id`),
  KEY `i68` (`v_pdv`),
  KEY `i69` (`v_client`),
  KEY `i70` (`v_date`),
  KEY `i71` (`v_ticket`),
  KEY `i72` (`v_faitpar`)
) ENGINE=InnoDB AUTO_INCREMENT=3605983 DEFAULT CHARSET=latin1;
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
