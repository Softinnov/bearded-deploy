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
-- Table structure for table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utilisateur` (
  `u_id` int(32) NOT NULL auto_increment,
  `u_pdv` int(32) default NULL,
  `u_login` varchar(16) default NULL,
  `u_pass` varchar(32) default NULL,
  `u_nom` varchar(32) default NULL,
  `u_prenom` varchar(32) default NULL,
  `u_personne` int(32) default NULL,
  `u_role` int(8) default NULL,
  `u_supprime` tinyint(1) default NULL,
  `u_expiration` datetime default NULL,
  `u_cree` datetime default NULL,
  `u_modifie` datetime default NULL,
  `u_faitpar` int(32) default NULL,
  PRIMARY KEY  (`u_id`),
  KEY `i64` (`u_pdv`),
  KEY `i65` (`u_login`),
  KEY `i66` (`u_pass`),
  KEY `i67` (`u_supprime`)
) ENGINE=MyISAM AUTO_INCREMENT=2642 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-09-03  3:43:06
