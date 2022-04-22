-- MySQL dump 10.13  Distrib 8.0.19, for macos10.15 (x86_64)
--
-- Host: localhost    Database: myGaragedb
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `Parking_Spot`
--

DROP TABLE IF EXISTS `Parking_Spot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Parking_Spot` (
  `idParking_Spot` int NOT NULL AUTO_INCREMENT,
  `Street` varchar(45) NOT NULL,
  `City` varchar(45) NOT NULL,
  `State` varchar(45) DEFAULT NULL,
  `Country` varchar(45) NOT NULL,
  `Availability` tinyint NOT NULL DEFAULT '1',
  `Status` varchar(45) DEFAULT NULL,
  `Host_idHost` int NOT NULL,
  `Host_Account_idAccount` int NOT NULL,
  PRIMARY KEY (`idParking_Spot`,`Host_idHost`,`Host_Account_idAccount`),
  KEY `fk_Parking_Spot_Host1_idx` (`Host_idHost`,`Host_Account_idAccount`),
  CONSTRAINT `fk_Parking_Spot_Host1` FOREIGN KEY (`Host_idHost`, `Host_Account_idAccount`) REFERENCES `Host` (`idHost`, `Account_idAccount`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Parking_Spot`
--

LOCK TABLES `Parking_Spot` WRITE;
/*!40000 ALTER TABLE `Parking_Spot` DISABLE KEYS */;
INSERT INTO `Parking_Spot` VALUES (1,'750 Font Blvd.','San Francisco','CA','USA',1,'Free',1,1),(2,'295 Buckingham Way.','San Francisco','CA','USA',0,'Taken',1,1);
/*!40000 ALTER TABLE `Parking_Spot` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-09 13:31:06
