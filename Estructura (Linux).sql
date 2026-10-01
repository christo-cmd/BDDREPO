/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.20-12.3.3-MariaDB, for Win64 (AMD64)
--
-- Host: 192.168.56.102    Database: Tienda_Sneakers
-- ------------------------------------------------------
-- Server version	10.11.14-MariaDB-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `Address_Federated`
--

DROP TABLE IF EXISTS `Address_Federated`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Address_Federated` (
  `id_Address` int(11) NOT NULL,
  `House_Num` varchar(6) DEFAULT NULL,
  `Neighborhood` varchar(30) NOT NULL,
  `Street` varchar(40) NOT NULL,
  `Zipcode` varchar(15) NOT NULL,
  PRIMARY KEY (`id_Address`)
) ENGINE=FEDERATED DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci CONNECTION='mysql://test_user:test123@192.168.56.1:3306/Tienda_Sneakers/Address_Local';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Address_General`
--

DROP TABLE IF EXISTS `Address_General`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Address_General` (
  `id_Address` int(11) NOT NULL AUTO_INCREMENT,
  `id_Client` int(11) DEFAULT NULL,
  `City` varchar(100) NOT NULL,
  `State` varchar(50) NOT NULL,
  `Country` varchar(50) NOT NULL,
  PRIMARY KEY (`id_Address`),
  KEY `id_Client` (`id_Client`),
  CONSTRAINT `Address_General_ibfk_1` FOREIGN KEY (`id_Client`) REFERENCES `Client` (`id_Client`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `Address_View`
--

DROP TABLE IF EXISTS `Address_View`;
/*!50001 DROP VIEW IF EXISTS `Address_View`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `Address_View` AS SELECT
 NULL AS `id_Address`,
 NULL AS `id_Client`,
 NULL AS `City`,
 NULL AS `State`,
 NULL AS `Country`,
 NULL AS `House_Num`,
 NULL AS `Zipcode`,
 NULL AS `Neighborhood`,
 NULL AS `Street` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Brand`
--

DROP TABLE IF EXISTS `Brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Brand` (
  `id_Brand` int(11) NOT NULL AUTO_INCREMENT,
  `Brand_Name` varchar(12) DEFAULT NULL,
  `Country_Origin` varchar(30) DEFAULT NULL,
  `Active` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id_Brand`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary table structure for view `Brand_Global`
--

DROP TABLE IF EXISTS `Brand_Global`;
/*!50001 DROP VIEW IF EXISTS `Brand_Global`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `Brand_Global` AS SELECT
 NULL AS `id_Brand`,
 NULL AS `Brand_Name`,
 NULL AS `Country_Origin`,
 NULL AS `Active` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Brand_Mexico`
--

DROP TABLE IF EXISTS `Brand_Mexico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Brand_Mexico` (
  `id_Brand` int(11) NOT NULL,
  `Brand_Name` varchar(12) DEFAULT NULL,
  `Country_Origin` varchar(50) DEFAULT NULL,
  `Active` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id_Brand`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Brand_Mexico_Remota`
--

DROP TABLE IF EXISTS `Brand_Mexico_Remota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Brand_Mexico_Remota` (
  `id_Brand` int(11) NOT NULL,
  `Brand_Name` varchar(12) DEFAULT NULL,
  `Country_Origin` varchar(50) DEFAULT NULL,
  `Active` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id_Brand`)
) ENGINE=FEDERATED DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci CONNECTION='mysql://User_vb:User_S1@192.168.56.102:3306/Tienda_Sneakers/Brand_Mexico';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Brand_Others_R`
--

DROP TABLE IF EXISTS `Brand_Others_R`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Brand_Others_R` (
  `id_Brand` int(11) NOT NULL,
  `Brand_Name` varchar(12) DEFAULT NULL,
  `Country_Origin` varchar(50) DEFAULT NULL,
  `Active` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id_Brand`)
) ENGINE=FEDERATED DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci CONNECTION='mysql://test_user:test123@192.168.56.1/Tienda_Sneakers/Brand_Others';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Client`
--

DROP TABLE IF EXISTS `Client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Client` (
  `id_Client` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) NOT NULL,
  `Last_Name` varchar(50) NOT NULL,
  `Phone_Number` varchar(20) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_Client`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Color`
--

DROP TABLE IF EXISTS `Color`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Color` (
  `id_Color` int(11) NOT NULL AUTO_INCREMENT,
  `Color_Name` varchar(10) DEFAULT NULL,
  `Color_Code` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_Color`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Model`
--

DROP TABLE IF EXISTS `Model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Model` (
  `id_Model` int(11) NOT NULL AUTO_INCREMENT,
  `id_Brand` int(11) NOT NULL,
  `Model_Name` varchar(15) NOT NULL,
  `Model_Code` varchar(5) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `ReleaseYear` year(4) DEFAULT NULL,
  PRIMARY KEY (`id_Model`),
  KEY `id_Brand` (`id_Brand`),
  CONSTRAINT `Model_ibfk_1` FOREIGN KEY (`id_Brand`) REFERENCES `Brand` (`id_Brand`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Products`
--

DROP TABLE IF EXISTS `Products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Products` (
  `id_Product` int(11) NOT NULL AUTO_INCREMENT,
  `id_Brand` int(11) DEFAULT NULL,
  `id_Color` int(11) DEFAULT NULL,
  `id_Model` int(11) DEFAULT NULL,
  `id_Size` int(11) DEFAULT NULL,
  `id_Style` int(11) DEFAULT NULL,
  `id_Type` int(11) DEFAULT NULL,
  `Price` decimal(5,2) NOT NULL,
  `Description` text DEFAULT NULL,
  PRIMARY KEY (`id_Product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Size`
--

DROP TABLE IF EXISTS `Size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Size` (
  `id_Size` int(11) NOT NULL AUTO_INCREMENT,
  `US_Size` decimal(3,1) DEFAULT NULL,
  `MX_Size` decimal(3,1) DEFAULT NULL,
  `CA_Size` decimal(3,1) DEFAULT NULL,
  `FootLenghtCM` decimal(4,1) DEFAULT NULL,
  PRIMARY KEY (`id_Size`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Style`
--

DROP TABLE IF EXISTS `Style`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Style` (
  `id_Style` int(11) NOT NULL AUTO_INCREMENT,
  `Style` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_Style`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `Type`
--

DROP TABLE IF EXISTS `Type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `Type` (
  `id_Type` int(11) NOT NULL AUTO_INCREMENT,
  `Type` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_Type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Final view structure for view `Address_View`
--

/*!50001 DROP VIEW IF EXISTS `Address_View`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Address_View` AS select `g`.`id_Address` AS `id_Address`,`g`.`id_Client` AS `id_Client`,`g`.`City` AS `City`,`g`.`State` AS `State`,`g`.`Country` AS `Country`,`l`.`House_Num` AS `House_Num`,`l`.`Zipcode` AS `Zipcode`,`l`.`Neighborhood` AS `Neighborhood`,`l`.`Street` AS `Street` from (`Address_General` `g` join `Address_Federated` `l` on(`g`.`id_Address` = `g`.`id_Address`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `Brand_Global`
--

/*!50001 DROP VIEW IF EXISTS `Brand_Global`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `Brand_Global` AS select `Brand_Mexico`.`id_Brand` AS `id_Brand`,`Brand_Mexico`.`Brand_Name` AS `Brand_Name`,`Brand_Mexico`.`Country_Origin` AS `Country_Origin`,`Brand_Mexico`.`Active` AS `Active` from `Brand_Mexico` union all select `Brand_Others_R`.`id_Brand` AS `id_Brand`,`Brand_Others_R`.`Brand_Name` AS `Brand_Name`,`Brand_Others_R`.`Country_Origin` AS `Country_Origin`,`Brand_Others_R`.`Active` AS `Active` from `Brand_Others_R` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2026-09-29  0:04:42
