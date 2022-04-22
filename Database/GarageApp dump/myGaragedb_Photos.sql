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
-- Table structure for table `Photos`
--

DROP TABLE IF EXISTS `Photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Photos` (
  `idPhotos` int NOT NULL AUTO_INCREMENT,
  `img_name` varchar(45) NOT NULL,
  `Host_idHost` int NOT NULL,
  `Host_Account_idAccount` int NOT NULL,
  `Parking_Spot_idParking_Spot` int NOT NULL,
  `Parking_Spot_Host_idHost` int NOT NULL,
  `Parking_Spot_Host_Account_idAccount` int NOT NULL,
  PRIMARY KEY (`idPhotos`,`Host_idHost`,`Host_Account_idAccount`,`Parking_Spot_idParking_Spot`,`Parking_Spot_Host_idHost`,`Parking_Spot_Host_Account_idAccount`),
  KEY `fk_Photos_Host1_idx` (`Host_idHost`,`Host_Account_idAccount`),
  KEY `fk_Photos_Parking_Spot1_idx` (`Parking_Spot_idParking_Spot`,`Parking_Spot_Host_idHost`,`Parking_Spot_Host_Account_idAccount`),
  CONSTRAINT `fk_Photos_Host1` FOREIGN KEY (`Host_idHost`, `Host_Account_idAccount`) REFERENCES `Host` (`idHost`, `Account_idAccount`),
  CONSTRAINT `fk_Photos_Parking_Spot1` FOREIGN KEY (`Parking_Spot_idParking_Spot`, `Parking_Spot_Host_idHost`, `Parking_Spot_Host_Account_idAccount`) REFERENCES `Parking_Spot` (`idParking_Spot`, `Host_idHost`, `Host_Account_idAccount`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Photos`
--

LOCK TABLES `Photos` WRITE;
/*!40000 ALTER TABLE `Photos` DISABLE KEYS */;
INSERT INTO `Photos` VALUES (1,'chubbyUnicorn',1,1,1,1,1);
/*!40000 ALTER TABLE `Photos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-09 13:31:07
