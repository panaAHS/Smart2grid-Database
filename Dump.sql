CREATE DATABASE  IF NOT EXISTS `smart2grid` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `smart2grid`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: smart2grid
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `Payment_ID` varchar(10) NOT NULL,
  `Contract_Type` enum('Type_1','Type_2','Type_3','Type_4','Type_5') NOT NULL,
  `Amount` decimal(5,2) DEFAULT NULL,
  `Payment_Date` datetime DEFAULT NULL,
  `Payment_Expiration_Dat` datetime NOT NULL,
  `TIN` varchar(10) NOT NULL,
  `SM_ID` varchar(10) NOT NULL,
  PRIMARY KEY (`Payment_ID`),
  KEY `TIN _idx` (`TIN`),
  KEY `SM_ID_idx` (`SM_ID`),
  CONSTRAINT `SM_ID` FOREIGN KEY (`SM_ID`) REFERENCES `smartmeter` (`SM_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `TIN ` FOREIGN KEY (`TIN`) REFERENCES `consumer` (`TIN`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES ('PPC-00001','Type_1',190.13,'2022-11-10 10:12:39','2022-11-28 00:00:00','3000200021','100000-01'),('PPC-00002','Type_2',200.30,'2022-11-05 11:10:59','2022-11-28 00:00:00','4000200021','100000-02'),('PPC-00003','Type_3',100.20,'2022-11-20 12:29:13','2022-11-28 00:00:00','5000200021','123456-01'),('PPC-00004','Type_4',81.22,'2022-11-18 13:14:15','2022-11-28 00:00:00','6000200021','654321-02'),('PPC-00005','Type_5',56.12,'2022-11-21 09:10:23','2022-11-28 00:00:00','5550550555','123456-10'),('PPC-00006','Type_1',45.12,'2022-10-14 17:16:15','2022-10-29 00:00:00','3000200021','100000-01');
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Bill_BEFORE_INSERT` BEFORE INSERT ON `bill` FOR EACH ROW BEGIN
IF(NEW.Payment_ID = ' ') THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid Payment_ID';
	END IF;
 
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Bill_BEFORE_UPDATE` BEFORE UPDATE ON `bill` FOR EACH ROW BEGIN
IF(NEW.Payment_ID = ' ') THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid Payment_ID';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `bill_power_consumption`
--

DROP TABLE IF EXISTS `bill_power_consumption`;
/*!50001 DROP VIEW IF EXISTS `bill_power_consumption`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `bill_power_consumption` AS SELECT 
 1 AS `Payment_ID`,
 1 AS `SM_ID`,
 1 AS `TIN`,
 1 AS `power_consumption`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `con_email`
--

DROP TABLE IF EXISTS `con_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `con_email` (
  `email` varchar(25) DEFAULT NULL,
  `ConTIN` varchar(10) NOT NULL,
  PRIMARY KEY (`ConTIN`),
  KEY `fk_Con_Email_Consumer2_idx` (`ConTIN`),
  CONSTRAINT `fk_Con_Email_Consumer2` FOREIGN KEY (`ConTIN`) REFERENCES `consumer` (`TIN`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `con_email`
--

LOCK TABLES `con_email` WRITE;
/*!40000 ALTER TABLE `con_email` DISABLE KEYS */;
INSERT INTO `con_email` VALUES ('kp@ece.auth.gr','3000200021'),('ab@gmail.com','3000201021'),('bc@gmail.com','3100201021'),('cd@gmail.com','4000200021'),('de@gmail.com','4000201021'),('ef@gmail.com','4100201021'),('fg@gmail.com','5000200021'),('ge@gmail.com','5000201021'),('ed@gmail.com','5100201021'),('dscs@gmail.com','5150551555'),('vasd@gmail.com','5550550555'),('vsad@gmail.com','5550551555'),('wqfq@gmail.com','6000200021'),('vebd@gmail.com','6000201021'),('waffsww@gmail.com','6100201021');
/*!40000 ALTER TABLE `con_email` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Con_Email_BEFORE_INSERT` BEFORE INSERT ON `con_email` FOR EACH ROW BEGIN
IF(NEW.ConTIN = ' ') THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid TIN';
	END IF;
    
    IF(NEW.email = ' ') THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid  email';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Con_Email_BEFORE_UPDATE` BEFORE UPDATE ON `con_email` FOR EACH ROW BEGIN
IF(NEW.ConTIN = ' ') THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid TIN';
	END IF;
    
    IF(NEW.email = ' ') THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid  email';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `con_phone`
--

DROP TABLE IF EXISTS `con_phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `con_phone` (
  `Phone_Number` int DEFAULT NULL,
  `ConTIN` varchar(10) NOT NULL,
  PRIMARY KEY (`ConTIN`),
  KEY `fk_Con_Phone_Consumer2_idx` (`ConTIN`),
  CONSTRAINT `fk_Con_Phone_Consumer2` FOREIGN KEY (`ConTIN`) REFERENCES `consumer` (`TIN`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `con_phone`
--

LOCK TABLES `con_phone` WRITE;
/*!40000 ALTER TABLE `con_phone` DISABLE KEYS */;
INSERT INTO `con_phone` VALUES (69000000,'3000200021'),(69000005,'3000201021'),(69000010,'3100201021'),(69000001,'4000200021'),(69000006,'4000201021'),(69000011,'4100201021'),(69000002,'5000200021'),(69000007,'5000201021'),(69000012,'5100201021'),(69000014,'5150551555'),(69000004,'5550550555'),(69000009,'5550551555'),(69000003,'6000200021'),(69000008,'6000201021'),(69000013,'6100201021');
/*!40000 ALTER TABLE `con_phone` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Con_Phone_BEFORE_INSERT` BEFORE INSERT ON `con_phone` FOR EACH ROW BEGIN
IF(NEW.ConTIN = ' ') THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid TIN';
	END IF;
    
    IF(NEW.Phone_Number <= 0) THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid  Phone_Number';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Con_Phone_BEFORE_UPDATE` BEFORE UPDATE ON `con_phone` FOR EACH ROW BEGIN
IF(NEW.ConTIN = ' ') THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid TIN';
	END IF;
    
    IF(NEW.Phone_Number <= 0) THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid  Phone_Number';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `consumer`
--

DROP TABLE IF EXISTS `consumer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consumer` (
  `TIN` varchar(10) NOT NULL,
  `Address` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`TIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consumer`
--

LOCK TABLES `consumer` WRITE;
/*!40000 ALTER TABLE `consumer` DISABLE KEYS */;
INSERT INTO `consumer` VALUES ('3000200021','3rd September 28, Thessaloniki'),('3000201021','Egnatia, 158, Thessaloniki'),('3100201021','28th October 17, Thessaloniki'),('4000200021','Egnatias 28, Thessaloniki'),('4000201021','Egnatia, 153, Thessaloniki'),('4100201021','Peristeriou 142, Thessaloniki'),('5000200021','Ag. Dimitriou 28, Thessaloniki'),('5000201021','Ag. Dimitriou 137, Thessaloniki'),('5100201021','Ag. Dimitriou 137, Sindos'),('5150551555','Orixeio Noteiou Pediou, DEH AE, Kozani'),('5550550555','Stoa Dokouzgianni 1, Thessaloniki'),('5550551555','Stoa Dokouzgianni 10, Thessaloniki'),('6000200021','Meg. Alexandrou 28, Thessaloniki'),('6000201021','Egnatia, 142, Thessaloniki'),('6100201021','Monastiriou 12, Thessaloniki');
/*!40000 ALTER TABLE `consumer` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Consumer_BEFORE_INSERT` BEFORE INSERT ON `consumer` FOR EACH ROW BEGIN
IF(NEW.TIN = ' ') THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid TIN';
	END IF;
    
    IF(NEW.Address = ' ') THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid  Address';
	END IF;
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Consumer_BEFORE_UPDATE` BEFORE UPDATE ON `consumer` FOR EACH ROW BEGIN
IF(NEW.TIN = ' ') THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid TIN';
	END IF;
    
    IF(NEW.Address = ' ') THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid  Address';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `hv_consumer`
--

DROP TABLE IF EXISTS `hv_consumer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hv_consumer` (
  `Industry_Name` varchar(25) NOT NULL,
  `TIN` varchar(10) NOT NULL,
  PRIMARY KEY (`TIN`),
  KEY `fk_ΗV_Consumer_Consumer1_idx` (`TIN`),
  CONSTRAINT `fk_ΗV_Consumer_Consumer1` FOREIGN KEY (`TIN`) REFERENCES `consumer` (`TIN`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hv_consumer`
--

LOCK TABLES `hv_consumer` WRITE;
/*!40000 ALTER TABLE `hv_consumer` DISABLE KEYS */;
INSERT INTO `hv_consumer` VALUES ('TITAN','3100201021'),('TITAN II','4100201021'),('Alouminio tis Ellados','5100201021'),('Orieio Notiou Pediou PPC','5150551555'),('Diilistiria Thessalonikis','6100201021');
/*!40000 ALTER TABLE `hv_consumer` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `HV_Consumer_BEFORE_INSERT` BEFORE INSERT ON `hv_consumer` FOR EACH ROW BEGIN
IF(NEW.TIN = ' ') THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid TIN';
	END IF;
    
    IF(NEW.Industry_Name = ' ') THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid  Industry Name';
	END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `HV_Consumer_BEFORE_UPDATE` BEFORE UPDATE ON `hv_consumer` FOR EACH ROW BEGIN
IF(NEW.TIN = ' ') THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid TIN';
	END IF;
    
    IF(NEW.Industry_Name = ' ') THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid  Industry Name';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `lines_to_units`
--

DROP TABLE IF EXISTS `lines_to_units`;
/*!50001 DROP VIEW IF EXISTS `lines_to_units`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `lines_to_units` AS SELECT 
 1 AS `License_ID`,
 1 AS `PL_ID`,
 1 AS `Power_production`,
 1 AS `Nominal_Power`,
 1 AS `Unit_availability`,
 1 AS `Date_Time`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `lv_consumer`
--

DROP TABLE IF EXISTS `lv_consumer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lv_consumer` (
  `Full_Name` varchar(25) NOT NULL,
  `Con_ID` varchar(10) DEFAULT NULL,
  `TIN` varchar(10) NOT NULL,
  PRIMARY KEY (`TIN`),
  CONSTRAINT `fk_LV_Consumer_Consumer1` FOREIGN KEY (`TIN`) REFERENCES `consumer` (`TIN`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lv_consumer`
--

LOCK TABLES `lv_consumer` WRITE;
/*!40000 ALTER TABLE `lv_consumer` DISABLE KEYS */;
INSERT INTO `lv_consumer` VALUES ('Panagiotis Karamitopoulos','AB-800000','3000200021'),('Vasilis Hatziathanasiou ','AC-800000','4000200021'),('Grigoris Papagiannis','AD-800000','5000200021'),('Stavros Dokouzgiannis',NULL,'5550550555'),('Andreas Symeonidis','AS-800000','6000200021');
/*!40000 ALTER TABLE `lv_consumer` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `LV_Consumer_BEFORE_INSERT` BEFORE INSERT ON `lv_consumer` FOR EACH ROW BEGIN
IF(NEW.TIN = ' ') THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid TIN';
	END IF;
    IF(NEW.Full_Name = ' ') THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid  Company_Name';
	END IF;
    
     IF(NEW.Con_ID  = ' ') THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid  Con ID';
	END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `LV_Consumer_BEFORE_UPDATE` BEFORE UPDATE ON `lv_consumer` FOR EACH ROW BEGIN
IF(NEW.TIN = ' ') THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid TIN';
	END IF;
    IF(NEW.Full_Name = ' ') THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid  Company_Name';
	END IF;
    
     IF(NEW.Con_ID  = ' ') THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid  Con ID';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `lv_consumer-smart_meter`
--

DROP TABLE IF EXISTS `lv_consumer-smart_meter`;
/*!50001 DROP VIEW IF EXISTS `lv_consumer-smart_meter`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `lv_consumer-smart_meter` AS SELECT 
 1 AS `Full_Name`,
 1 AS `Address`,
 1 AS `SM_ID`,
 1 AS `Reading`,
 1 AS `Date_Time`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `lv_consumer_com`
--

DROP TABLE IF EXISTS `lv_consumer_com`;
/*!50001 DROP VIEW IF EXISTS `lv_consumer_com`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `lv_consumer_com` AS SELECT 
 1 AS `TIN`,
 1 AS `Full_Name`,
 1 AS `email`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `monitoring`
--

DROP TABLE IF EXISTS `monitoring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monitoring` (
  `Meter_ID` varchar(10) NOT NULL,
  `Coordinates` varchar(21) DEFAULT NULL,
  `Nominal_Voltage` enum('400kV','150kV','20kV','0.4kV') DEFAULT NULL,
  `PL_ID` varchar(10) NOT NULL,
  PRIMARY KEY (`Meter_ID`),
  KEY `fk_Monitoring_Power_Line1_idx` (`PL_ID`),
  CONSTRAINT `fk_Monitoring_Power_Line1` FOREIGN KEY (`PL_ID`) REFERENCES `power_line` (`PL_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monitoring`
--

LOCK TABLES `monitoring` WRITE;
/*!40000 ALTER TABLE `monitoring` DISABLE KEYS */;
INSERT INTO `monitoring` VALUES ('KZ-1001','40.2695936,20.7406296','400kV','KZ-100'),('TH-1001','51.2698936,36.7406286','400kV','TH-100'),('TH-2022','40.2695936,25.7456296','150kV','TH-200'),('TH-3009','75.2695836,22.7406596','20kV','TH-300'),('TH-4002','46.2693536,21.7405296','0.4kV','TH-400'),('TH-4403','66.2695036,32.7406496','0.4kV','TH-440');
/*!40000 ALTER TABLE `monitoring` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Monitoring_BEFORE_INSERT` BEFORE INSERT ON `monitoring` FOR EACH ROW BEGIN

    IF(NEW.Meter_ID = ' ') THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid  Meter_ID';
	END IF;
    
    IF(NEW.Coordinates = ' ') THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid  Coordinates';
	END IF;
    
    IF(NEW.PL_ID = ' ') THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid  PL_ID';
	END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Monitoring_BEFORE_UPDATE` BEFORE UPDATE ON `monitoring` FOR EACH ROW BEGIN
IF(NEW.Meter_ID = ' ') THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid  Meter_ID';
	END IF;
    
    IF(NEW.Coordinates = ' ') THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid  Coordinates';
	END IF;
    
    IF(NEW.PL_ID = ' ') THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid  PL_ID';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `monitoring_instance`
--

DROP TABLE IF EXISTS `monitoring_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `monitoring_instance` (
  `Meter_ID` varchar(10) NOT NULL,
  `Date_Time` datetime NOT NULL,
  `Current` float(5,2) DEFAULT NULL,
  `Voltage` float(5,2) DEFAULT NULL,
  `Reactive_Power` float(5,2) DEFAULT NULL,
  `Active_Power` float(5,2) DEFAULT NULL,
  `Temperature` float(5,2) DEFAULT NULL,
  PRIMARY KEY (`Date_Time`,`Meter_ID`),
  KEY `Meter_ID` (`Meter_ID`),
  CONSTRAINT `Meter_ID` FOREIGN KEY (`Meter_ID`) REFERENCES `monitoring` (`Meter_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `monitoring_instance`
--

LOCK TABLES `monitoring_instance` WRITE;
/*!40000 ALTER TABLE `monitoring_instance` DISABLE KEYS */;
INSERT INTO `monitoring_instance` VALUES ('KZ-1001','2022-11-04 00:12:00',400.00,401.00,10.00,300.00,60.12),('TH-1001 ','2022-11-04 00:12:00',200.00,399.00,20.00,200.00,60.10),('TH-2022 ','2022-11-04 00:12:00',190.00,148.00,1.00,150.00,40.46),('TH-3009','2022-11-04 00:12:00',100.00,19.00,2.00,20.00,30.56),('TH-4002','2022-11-04 00:12:00',15.00,0.40,4.00,8.00,20.00),('TH-4403','2022-11-04 00:12:00',90.00,0.40,1.00,10.00,20.35);
/*!40000 ALTER TABLE `monitoring_instance` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Monitoring_Instance_BEFORE_INSERT` BEFORE INSERT ON `monitoring_instance` FOR EACH ROW BEGIN


IF(NEW.Voltage <= 0) THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid Voltage';
	END IF;
    
    IF(NEW.Meter_ID = ' ') THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid  Meter_ID';
	END IF;

    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Monitoring_Instance_BEFORE_UPDATE` BEFORE UPDATE ON `monitoring_instance` FOR EACH ROW BEGIN
IF(NEW.Voltage <= 0) THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid Voltage';
	END IF;
    
    IF(NEW.Meter_ID = ' ') THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid  Meter_ID';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `mv_consumer`
--

DROP TABLE IF EXISTS `mv_consumer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mv_consumer` (
  `Company_Name` varchar(25) NOT NULL,
  `TIN` varchar(10) NOT NULL,
  PRIMARY KEY (`TIN`),
  CONSTRAINT `fk_ΜV_Consumer_Consumer1` FOREIGN KEY (`TIN`) REFERENCES `consumer` (`TIN`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mv_consumer`
--

LOCK TABLES `mv_consumer` WRITE;
/*!40000 ALTER TABLE `mv_consumer` DISABLE KEYS */;
INSERT INTO `mv_consumer` VALUES ('PAMAK','3000201021'),('THMMY AUTH','4000201021'),('ABB-Thessaloniki','5000201021'),('Plectoviomixania Dok','5550551555'),('TIF','6000201021');
/*!40000 ALTER TABLE `mv_consumer` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `MV_Consumer_BEFORE_INSERT` BEFORE INSERT ON `mv_consumer` FOR EACH ROW BEGIN
IF(NEW.TIN = ' ') THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid TIN';
	END IF;
    
    IF(NEW.Company_Name = ' ') THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid  Company_Name';
	END IF;
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `MV_Consumer_BEFORE_UPDATE` BEFORE UPDATE ON `mv_consumer` FOR EACH ROW BEGIN
IF(NEW.TIN = ' ') THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid TIN';
	END IF;
    
    IF(NEW.Company_Name = ' ') THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid  Company_Name';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `power_line`
--

DROP TABLE IF EXISTS `power_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `power_line` (
  `PL_ID` varchar(10) NOT NULL,
  `Region` varchar(60) DEFAULT NULL,
  `PL_type` enum('Overhead','Underground') DEFAULT NULL,
  `Nominal_Voltage` enum('400kV','150kV','20kV','0.4kV') DEFAULT NULL,
  `Conn_L2L_PL_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`PL_ID`),
  KEY `fk_Power_Line_Power_Line1_idx` (`Conn_L2L_PL_ID`),
  CONSTRAINT `fk_Power_Line_Power_Line1` FOREIGN KEY (`Conn_L2L_PL_ID`) REFERENCES `power_line` (`PL_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `power_line`
--

LOCK TABLES `power_line` WRITE;
/*!40000 ALTER TABLE `power_line` DISABLE KEYS */;
INSERT INTO `power_line` VALUES ('BR-4008','Veroia','Overhead','400kV','KZ-100'),('KZ-100 ','Kozani','Overhead','400kV',NULL),('KZ-1001','Kozani','Overhead','400kV','KZ-100 '),('KZ-2003','Kozani','Overhead','400kV','KZ-1001'),('KZ-4008','Kozani','Overhead','400kV','TH-22001 '),('MG-4030','Megalopoli','Overhead','400kV','KZ-100'),('TH-100','Thessaloniki','Overhead','400kV','KZ-100'),('TH-10000','Thessaloniki','Overhead','0.4kV','TH-300'),('TH-10001','Thessaloniki','Overhead','0.4kV','TH-300'),('TH-10002','Thessaloniki','Overhead','0.4kV','TH-21002 '),('TH-10003','Thessaloniki','Overhead','0.4kV','TH-300'),('TH-10004','Thessaloniki','Overhead','0.4kV','TH-300'),('TH-200','Thessaloniki','Overhead','150kV','KZ-1001'),('TH-21002 ','Thessaloniki','Underground','20kV',NULL),('TH-22001 ','Thessaloniki','Overhead','150kV',NULL),('TH-24004 ','Thessaloniki','Underground','0.4kV','TH-21002 '),('TH-24008 ','Thessaloniki','Overhead','0.4kV','TH-21002 '),('TH-300','Thessaloniki','Overhead','20kV','TH-22001 '),('TH-400','Thessaloniki','Overhead','0.4kV','TH-21002 '),('TH-440','Thessaloniki','Overhead','0.4kV','TH-21002 ');
/*!40000 ALTER TABLE `power_line` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Power_Line_BEFORE_INSERT` BEFORE INSERT ON `power_line` FOR EACH ROW BEGIN
IF(NEW.PL_ID = ' ') THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid PL_ID';
	END IF;
    
    IF(NEW.Nominal_Voltage  <= 0) THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid Nominal Voltage';
	END IF;
    
    IF(NEW.Region = ' ') THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid  Region';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Power_Line_BEFORE_UPDATE` BEFORE UPDATE ON `power_line` FOR EACH ROW BEGIN
IF(NEW.PL_ID = ' ') THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid PL_ID';
	END IF;
    
    IF(NEW.Nominal_Voltage  <= 0) THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid Nominal Voltage';
	END IF;
    
    IF(NEW.Region = ' ') THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid  Region';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `power_line_connect_l2ppu_power_production_unit`
--

DROP TABLE IF EXISTS `power_line_connect_l2ppu_power_production_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `power_line_connect_l2ppu_power_production_unit` (
  `Connection_ID` varchar(10) NOT NULL,
  `PL_ID` varchar(10) NOT NULL,
  `License_ID` varchar(10) NOT NULL,
  PRIMARY KEY (`License_ID`,`PL_ID`),
  KEY `fk_Power_Line _connect_L2PPU_Power_Production_Unit_Power_Li_idx` (`PL_ID`),
  KEY `fk_Power_Line _connect_L2PPU_Power_Production_Unit_Power_Pr_idx` (`License_ID`),
  CONSTRAINT `fk_Power_Line _connect_L2PPU_Power_Production_Unit_Power_Line1` FOREIGN KEY (`PL_ID`) REFERENCES `power_line` (`PL_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_Power_Line _connect_L2PPU_Power_Production_Unit_Power_Prod1` FOREIGN KEY (`License_ID`) REFERENCES `power_production_unit` (`License_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `power_line_connect_l2ppu_power_production_unit`
--

LOCK TABLES `power_line_connect_l2ppu_power_production_unit` WRITE;
/*!40000 ALTER TABLE `power_line_connect_l2ppu_power_production_unit` DISABLE KEYS */;
INSERT INTO `power_line_connect_l2ppu_power_production_unit` VALUES ('KZ-78101','KZ-1001','AHS-0078'),('KZ-79203','KZ-2003','AHS-0079'),('MG-3090','MG-4030','SP-30900'),('KZ-08408 ','KZ-4008','YHS-1008'),('BR-09408','BR-4008 ','YHS-1009');
/*!40000 ALTER TABLE `power_line_connect_l2ppu_power_production_unit` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Power_Line_connect_L2PPU_Power_Production_Unit_BEFORE_INSERT` BEFORE INSERT ON `power_line_connect_l2ppu_power_production_unit` FOR EACH ROW BEGIN
IF(NEW.PL_ID = ' ') THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid PL_ID';
	END IF;
        
    IF(NEW.License_ID = ' ') THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid  License ID';
	END IF;
    
    IF(NEW.Connection_ID = ' ') THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid  Connection ID';
	END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Power_Line_connect_L2PPU_Power_Production_Unit_BEFORE_UPDATE` BEFORE UPDATE ON `power_line_connect_l2ppu_power_production_unit` FOR EACH ROW BEGIN
IF(NEW.PL_ID = ' ') THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid PL_ID';
	END IF;
        
    IF(NEW.License_ID = ' ') THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid  License ID';
	END IF;
    
    IF(NEW.Connection_ID = ' ') THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid  Connection ID';
	END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `power_production_unit`
--

DROP TABLE IF EXISTS `power_production_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `power_production_unit` (
  `License_ID` varchar(10) NOT NULL,
  `Electricity_Producer` varchar(25) DEFAULT NULL,
  `Address` varchar(60) DEFAULT NULL,
  `Nominal_Power` int NOT NULL,
  `Unit_Type` enum('Solar_Panel','Wind_Turbine','TPC','CCPP','”Petrol','HPS') NOT NULL,
  PRIMARY KEY (`License_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `power_production_unit`
--

LOCK TABLES `power_production_unit` WRITE;
/*!40000 ALTER TABLE `power_production_unit` DISABLE KEYS */;
INSERT INTO `power_production_unit` VALUES ('AES-50555','PPC','2km Megalopolis-Athens, AHS Megalopolis',880,'CCPP'),('AHS-0078','PPC','12km Kozanis Thessalonikis, AHS Ag. Dimitriou',345,'TPC'),('AHS-0079','PPC','2km Ptolemaidas-Kozanis AHS Ptoleamaidas 5',660,'TPC'),('SP-30900','Thes-Power','10km Thessalonikis Veroias',1,'Solar_Panel'),('WT-40501','Thes-Power ','Mt Askio, Stavros',32,'Wind_Turbine'),('YHS-1008','PPC','10km Kozanis-Larissas, YHS Polifitou',120,'HPS'),('YHS-1009 ','PPC','2km Sfikias Verias, YHS Sfhkias',110,'HPS');
/*!40000 ALTER TABLE `power_production_unit` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Power_Production_Unit_BEFORE_INSERT` BEFORE INSERT ON `power_production_unit` FOR EACH ROW BEGIN
IF(NEW.License_ID = ' ') THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid licence id';
	END IF;
    
    IF(NEW.Electricity_Producer = ' ') THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid Electricity Producer';
	END IF;
    
    IF(NEW.Address = ' ') THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid  Address';
	END IF;
    
    IF(NEW.Nominal_Power <= 0) THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid  Nominal Power';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Power_Production_Unit_BEFORE_UPDATE` BEFORE UPDATE ON `power_production_unit` FOR EACH ROW BEGIN
IF(NEW.License_ID = ' ') THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid licence id';
	END IF;
    
    IF(NEW.Electricity_Producer = ' ') THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid Electricity Producer';
	END IF;
    
    IF(NEW.Address = ' ') THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid  Address';
	END IF;
    
    IF(NEW.Nominal_Power <= 0) THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid  Nominal Power';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `power_production_unit_instance`
--

DROP TABLE IF EXISTS `power_production_unit_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `power_production_unit_instance` (
  `License_ID` varchar(10) NOT NULL,
  `Reactive_Power` float(5,2) DEFAULT NULL,
  `Power_Production` float(5,2) DEFAULT NULL,
  `Unit_availability` int DEFAULT NULL,
  `Date_Time` datetime NOT NULL,
  PRIMARY KEY (`Date_Time`,`License_ID`),
  KEY `Licence_id` (`License_ID`),
  CONSTRAINT `Licence_id` FOREIGN KEY (`License_ID`) REFERENCES `power_production_unit` (`License_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `power_production_unit_instance`
--

LOCK TABLES `power_production_unit_instance` WRITE;
/*!40000 ALTER TABLE `power_production_unit_instance` DISABLE KEYS */;
INSERT INTO `power_production_unit_instance` VALUES ('AES-50555',10.00,200.00,440,'2022-11-04 00:12:00'),('AHS-0078',20.00,240.00,270,'2022-11-04 00:12:00'),('AHS-0079',50.00,300.00,500,'2022-11-04 00:12:00'),('SP-30900',0.00,0.00,0,'2022-11-04 00:12:00'),('WT-40501 ',0.00,20.00,20,'2022-11-04 00:12:00'),('YHS-1008',5.00,100.00,102,'2022-11-04 00:12:00'),('YHS-1009',0.00,0.00,100,'2022-11-04 00:12:00');
/*!40000 ALTER TABLE `power_production_unit_instance` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Power_Production_Unit_Instance_BEFORE_INSERT` BEFORE INSERT ON `power_production_unit_instance` FOR EACH ROW BEGIN
IF(NEW.License_ID = ' ') THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid licence id';
	END IF;
    
    IF(NEW.Unit_availability < 0) THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid Unit availability';
	END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `Power_Production_Unit_Instance_BEFORE_UPDATE` BEFORE UPDATE ON `power_production_unit_instance` FOR EACH ROW BEGIN
IF(NEW.License_ID = ' ') THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid licence id';
	END IF;
    
    IF(NEW.Unit_availability < 0) THEN
		SIGNAL sqlstate '45000' SET message_text = 'invalid Unit availability';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `smartmeter`
--

DROP TABLE IF EXISTS `smartmeter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `smartmeter` (
  `SM_ID` varchar(10) NOT NULL,
  `Reading` float(5,2) DEFAULT NULL,
  `Date_Time` datetime DEFAULT NULL,
  `PL_ID` varchar(10) NOT NULL,
  `TIN` varchar(10) NOT NULL,
  PRIMARY KEY (`SM_ID`),
  KEY `PL_ID_idx` (`PL_ID`),
  KEY `fk_SmartMeter_Consumer1_idx` (`TIN`),
  CONSTRAINT `fk_SmartMeter_Consumer1` FOREIGN KEY (`TIN`) REFERENCES `consumer` (`TIN`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `PL_ID` FOREIGN KEY (`PL_ID`) REFERENCES `power_line` (`PL_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `smartmeter`
--

LOCK TABLES `smartmeter` WRITE;
/*!40000 ALTER TABLE `smartmeter` DISABLE KEYS */;
INSERT INTO `smartmeter` VALUES ('100000-01 ',200.00,'2022-11-01 00:12:00','TH-10000','3000200021'),('100000-02',100.00,'2022-11-01 00:12:00','TH-10001','4000200021'),('123456-01',200.00,'2022-11-01 00:12:00','TH-10002','5000200021'),('123456-10',400.00,'2022-11-01 00:12:00','TH-10004','5550550555'),('654321-02',300.00,'2022-11-01 00:12:00','TH-10003','6000200021');
/*!40000 ALTER TABLE `smartmeter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `bill_power_consumption`
--

/*!50001 DROP VIEW IF EXISTS `bill_power_consumption`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `bill_power_consumption` AS select `bill`.`Payment_ID` AS `Payment_ID`,`smartmeter`.`SM_ID` AS `SM_ID`,`bill`.`TIN` AS `TIN`,`smartmeter`.`Reading` AS `power_consumption` from (`bill` join `smartmeter` on((`bill`.`TIN` = `smartmeter`.`TIN`))) where ((dayofmonth(`smartmeter`.`Date_Time`) = '01') and (cast(`smartmeter`.`Date_Time` as time) = '00:12:00')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `lines_to_units`
--

/*!50001 DROP VIEW IF EXISTS `lines_to_units`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `lines_to_units` AS select `power_production_unit`.`License_ID` AS `License_ID`,`power_line_connect_l2ppu_power_production_unit`.`PL_ID` AS `PL_ID`,`power_production_unit_instance`.`Power_Production` AS `Power_production`,`power_production_unit`.`Nominal_Power` AS `Nominal_Power`,`power_production_unit_instance`.`Unit_availability` AS `Unit_availability`,`power_production_unit_instance`.`Date_Time` AS `Date_Time` from ((`power_production_unit` join `power_production_unit_instance` on((`power_production_unit`.`License_ID` = `power_production_unit_instance`.`License_ID`))) join `power_line_connect_l2ppu_power_production_unit` on((`power_production_unit_instance`.`License_ID` = `power_line_connect_l2ppu_power_production_unit`.`License_ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `lv_consumer-smart_meter`
--

/*!50001 DROP VIEW IF EXISTS `lv_consumer-smart_meter`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `lv_consumer-smart_meter` AS select `lv_consumer`.`Full_Name` AS `Full_Name`,`consumer`.`Address` AS `Address`,`smartmeter`.`SM_ID` AS `SM_ID`,`smartmeter`.`Reading` AS `Reading`,`smartmeter`.`Date_Time` AS `Date_Time` from ((`lv_consumer` join `consumer` on((`lv_consumer`.`TIN` = `consumer`.`TIN`))) join `smartmeter` on((`smartmeter`.`TIN` = `consumer`.`TIN`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `lv_consumer_com`
--

/*!50001 DROP VIEW IF EXISTS `lv_consumer_com`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `lv_consumer_com` AS select `lv_consumer`.`TIN` AS `TIN`,`lv_consumer`.`Full_Name` AS `Full_Name`,`con_email`.`email` AS `email` from (`lv_consumer` join `con_email` on((`con_email`.`ConTIN` = `lv_consumer`.`TIN`))) */;
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
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-12 23:41:31
