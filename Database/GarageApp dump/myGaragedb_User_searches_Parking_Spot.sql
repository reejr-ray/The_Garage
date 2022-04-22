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
-- Table structure for table `User_searches_Parking_Spot`
--

DROP TABLE IF EXISTS `User_searches_Parking_Spot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User_searches_Parking_Spot` (
  `User_idUser` int NOT NULL,
  `Parking_Spot_idParking_Spot` int NOT NULL,
  `Parking_Spot_Host_idHost` int NOT NULL,
  `Parking_Spot_Host_Account_idAccount` int NOT NULL,
  PRIMARY KEY (`User_idUser`,`Parking_Spot_idParking_Spot`,`Parking_Spot_Host_idHost`,`Parking_Spot_Host_Account_idAccount`),
  KEY `fk_User_has_Parking_Spot_Parking_Spot1_idx` (`Parking_Spot_idParking_Spot`,`Parking_Spot_Host_idHost`,`Parking_Spot_Host_Account_idAccount`),
  KEY `fk_User_has_Parking_Spot_User1_idx` (`User_idUser`),
  CONSTRAINT `fk_User_has_Parking_Spot_Parking_Spot1` FOREIGN KEY (`Parking_Spot_idParking_Spot`, `Parking_Spot_Host_idHost`, `Parking_Spot_Host_Account_idAccount`) REFERENCES `Parking_Spot` (`idParking_Spot`, `Host_idHost`, `Host_Account_idAccount`),
  CONSTRAINT `fk_User_has_Parking_Spot_User1` FOREIGN KEY (`User_idUser`) REFERENCES `User` (`idUser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_searches_Parking_Spot`
--

LOCK TABLES `User_searches_Parking_Spot` WRITE;
/*!40000 ALTER TABLE `User_searches_Parking_Spot` DISABLE KEYS */;
/*!40000 ALTER TABLE `User_searches_Parking_Spot` ENABLE KEYS */;
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
