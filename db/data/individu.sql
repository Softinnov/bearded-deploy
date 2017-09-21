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
-- Table structure for table `individu`
--

DROP TABLE IF EXISTS `individu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `individu` (
  `i_id` int(32) NOT NULL AUTO_INCREMENT,
  `i_pdv` int(32) DEFAULT NULL,
  `i_client` int(32) DEFAULT NULL,
  `i_nom` varchar(32) DEFAULT NULL,
  `i_prenom` varchar(32) DEFAULT NULL,
  `i_annee` int(16) DEFAULT NULL,
  `i_sexe` int(32) DEFAULT NULL,
  `i_statut` int(32) DEFAULT NULL,
  `i_autre_s` varchar(64) DEFAULT NULL,
  `i_salarie` tinyint(1) DEFAULT NULL,
  `i_contrat` int(32) DEFAULT NULL,
  `i_partiel` tinyint(1) DEFAULT NULL,
  `i_aide` tinyint(1) DEFAULT NULL,
  `i_embauche` date DEFAULT NULL,
  `i_chomeur` tinyint(1) DEFAULT NULL,
  `i_att_vers` tinyint(1) DEFAULT NULL,
  `i_cdateentree` date DEFAULT NULL,
  `i_datefin` date DEFAULT NULL,
  `i_retraite` tinyint(1) DEFAULT NULL,
  `i_rdateentree` date DEFAULT NULL,
  `i_etudiant` tinyint(1) DEFAULT NULL,
  `i_liberal` tinyint(1) DEFAULT NULL,
  `i_autre` tinyint(1) DEFAULT NULL,
  `i_supprime` tinyint(1) DEFAULT '0',
  `i_faitpar` int(32) DEFAULT NULL,
  `i_cree` datetime DEFAULT NULL,
  `i_modifie` datetime DEFAULT NULL,
  PRIMARY KEY (`i_id`),
  KEY `i19` (`i_pdv`),
  KEY `i20` (`i_client`),
  KEY `i21` (`i_nom`),
  KEY `i22` (`i_statut`),
  KEY `i23` (`i_supprime`)
) ENGINE=InnoDB AUTO_INCREMENT=575966 DEFAULT CHARSET=latin1;
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
