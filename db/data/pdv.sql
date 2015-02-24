-- MySQL dump 10.11
--
-- Host: localhost    Database: prod
-- ------------------------------------------------------
-- Server version	5.0.96-0ubuntu3-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES latin1 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `pdv`
--

DROP TABLE IF EXISTS `pdv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pdv` (
  `pv_id` int(32) NOT NULL auto_increment,
  `pv_nom` varchar(128) default NULL,
  `pv_statut` int(16) default NULL,
  `pv_autre` varchar(256) default NULL,
  `pv_adr_pdv` int(32) default NULL,
  `pv_cnt_pdv` int(32) default NULL,
  `pv_adr_liv` int(32) default NULL,
  `pv_cnt_liv` int(32) default NULL,
  `pv_adr_fct` int(32) default NULL,
  `pv_cnt_fct` int(32) default NULL,
  `pv_paiement` int(32) default NULL,
  `pv_mnt_attr` int(32) default NULL,
  `pv_adherent` tinyint(1) default NULL,
  `pv_cmt` text,
  `pv_supprime` tinyint(1) default '0',
  `pv_faitpar` int(32) default NULL,
  `pv_cree` datetime default NULL,
  `pv_modifie` datetime default NULL,
  `pv_abo_expire` datetime default NULL,
  `pv_abo_etat` int(16) default '237',
  `pv_abo_facturl` varchar(256) default NULL,
  PRIMARY KEY  (`pv_id`),
  KEY `i41` (`pv_adr_pdv`),
  KEY `i42` (`pv_supprime`)
) ENGINE=MyISAM AUTO_INCREMENT=579 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-09-03  3:41:40
