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
-- Table structure for table `Account`
--

DROP TABLE IF EXISTS `Account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Account` (
  `idAccount` int NOT NULL AUTO_INCREMENT,
  `Region_idRegion` int NOT NULL,
  `User_idUser` int NOT NULL,
  PRIMARY KEY (`idAccount`,`User_idUser`),
  KEY `fk_Account_Region1_idx` (`Region_idRegion`),
  KEY `fk_Account_User1_idx` (`User_idUser`),
  CONSTRAINT `fk_Account_Region1` FOREIGN KEY (`Region_idRegion`) REFERENCES `Region` (`idRegion`) ON UPDATE CASCADE,
  CONSTRAINT `fk_Account_User1` FOREIGN KEY (`User_idUser`) REFERENCES `User` (`idUser`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Account`
--

LOCK TABLES `Account` WRITE;
/*!40000 ALTER TABLE `Account` DISABLE KEYS */;
INSERT INTO `Account` VALUES (1000,1,1000),(1001,1,1001),(1002,1,1002);
/*!40000 ALTER TABLE `Account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Favorites`
--

DROP TABLE IF EXISTS `Favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Favorites` (
  `idFavorites` int NOT NULL AUTO_INCREMENT,
  `isReserved` tinyint NOT NULL DEFAULT '0',
  `Guest_idGuest` int NOT NULL,
  `Guest_Account_idAccount` int NOT NULL,
  `Parking_Spot_idParking_Spot` int NOT NULL,
  `Parking_Spot_Host_idHost` int NOT NULL,
  `Parking_Spot_Host_Account_idAccount` int NOT NULL,
  PRIMARY KEY (`idFavorites`),
  KEY `fk_Favorites_Guest1_idx` (`Guest_idGuest`),
  KEY `fk_Favorites_Parking_Spot1_idx` (`Parking_Spot_idParking_Spot`),
  CONSTRAINT `fk_Favorites_Guest1` FOREIGN KEY (`Guest_idGuest`) REFERENCES `Guest` (`idGuest`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Favorites_Parking_Spot1` FOREIGN KEY (`Parking_Spot_idParking_Spot`) REFERENCES `Parking_Spot` (`idParking_Spot`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Favorites`
--

LOCK TABLES `Favorites` WRITE;
/*!40000 ALTER TABLE `Favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `Favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Guest`
--

DROP TABLE IF EXISTS `Guest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Guest` (
  `idGuest` int NOT NULL AUTO_INCREMENT,
  `Account_idAccount` int NOT NULL,
  `rating` int NOT NULL DEFAULT '5',
  PRIMARY KEY (`idGuest`,`Account_idAccount`),
  KEY `fk_Guest_Account1_idx` (`Account_idAccount`),
  CONSTRAINT `fk_Guest_Account1` FOREIGN KEY (`Account_idAccount`) REFERENCES `Account` (`idAccount`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Guest`
--

LOCK TABLES `Guest` WRITE;
/*!40000 ALTER TABLE `Guest` DISABLE KEYS */;
INSERT INTO `Guest` VALUES (1002,1002,4);
/*!40000 ALTER TABLE `Guest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Guest_reserves_Parking_Spot`
--

DROP TABLE IF EXISTS `Guest_reserves_Parking_Spot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Guest_reserves_Parking_Spot` (
  `Guest_idGuest` int NOT NULL,
  `Guest_Account_idAccount` int NOT NULL,
  `Parking_Spot_idParking_Spot` int NOT NULL,
  `Parking_Spot_Host_idHost` int NOT NULL,
  `Parking_Spot_Host_Account_idAccount` int NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `date` date NOT NULL,
  `rate` float NOT NULL,
  PRIMARY KEY (`Guest_idGuest`,`Guest_Account_idAccount`,`Parking_Spot_idParking_Spot`,`Parking_Spot_Host_idHost`,`Parking_Spot_Host_Account_idAccount`,`date`),
  KEY `fk_Guest_has_Parking_Spot_Parking_Spot1_idx` (`Parking_Spot_idParking_Spot`,`Parking_Spot_Host_idHost`,`Parking_Spot_Host_Account_idAccount`),
  KEY `fk_Guest_has_Parking_Spot_Guest1_idx` (`Guest_idGuest`,`Guest_Account_idAccount`),
  CONSTRAINT `fk_Guest_has_Parking_Spot_Guest1` FOREIGN KEY (`Guest_idGuest`, `Guest_Account_idAccount`) REFERENCES `Guest` (`idGuest`, `Account_idAccount`) ON UPDATE CASCADE,
  CONSTRAINT `fk_Guest_has_Parking_Spot_Parking_Spot1` FOREIGN KEY (`Parking_Spot_idParking_Spot`, `Parking_Spot_Host_idHost`, `Parking_Spot_Host_Account_idAccount`) REFERENCES `Parking_Spot` (`idParking_Spot`, `Host_idHost`, `Host_Account_idAccount`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Guest_reserves_Parking_Spot`
--

LOCK TABLES `Guest_reserves_Parking_Spot` WRITE;
/*!40000 ALTER TABLE `Guest_reserves_Parking_Spot` DISABLE KEYS */;
/*!40000 ALTER TABLE `Guest_reserves_Parking_Spot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Host`
--

DROP TABLE IF EXISTS `Host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Host` (
  `idHost` int NOT NULL AUTO_INCREMENT,
  `Account_idAccount` int NOT NULL,
  `rating` int NOT NULL DEFAULT '5',
  PRIMARY KEY (`idHost`,`Account_idAccount`),
  KEY `fk_Host_Account1_idx` (`Account_idAccount`),
  CONSTRAINT `fk_Host_Account1` FOREIGN KEY (`Account_idAccount`) REFERENCES `Account` (`idAccount`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1002 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Host`
--

LOCK TABLES `Host` WRITE;
/*!40000 ALTER TABLE `Host` DISABLE KEYS */;
INSERT INTO `Host` VALUES (1000,1000,5),(1001,1001,5);
/*!40000 ALTER TABLE `Host` ENABLE KEYS */;
UNLOCK TABLES;

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
  `ZipCode` varchar(5) DEFAULT NULL,
  `Status` varchar(45) NOT NULL,
  `rentalRate` int NOT NULL DEFAULT '5',
  `parkingType` varchar(45) DEFAULT NULL,
  `Host_idHost` int NOT NULL,
  `Host_Account_idAccount` int NOT NULL,
  `Start_Time` time DEFAULT NULL,
  `End_Time` time DEFAULT NULL,
  `Monday` tinyint NOT NULL,
  `Tuesday` tinyint NOT NULL,
  `Wednesday` tinyint NOT NULL,
  `Thursday` tinyint NOT NULL,
  `Friday` tinyint NOT NULL,
  `Saturday` tinyint NOT NULL,
  `Sunday` tinyint NOT NULL,
  PRIMARY KEY (`idParking_Spot`,`Host_idHost`,`Host_Account_idAccount`),
  KEY `fk_Parking_Spot_Host1_idx` (`Host_idHost`,`Host_Account_idAccount`),
  CONSTRAINT `fk_Parking_Spot_Host1` FOREIGN KEY (`Host_idHost`, `Host_Account_idAccount`) REFERENCES `Host` (`idHost`, `Account_idAccount`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Parking_Spot`
--

LOCK TABLES `Parking_Spot` WRITE;
/*!40000 ALTER TABLE `Parking_Spot` DISABLE KEYS */;
INSERT INTO `Parking_Spot` VALUES (5,'750 Font Blvd.','San Francisco','CA','USA',NULL,'Free',5,'Driveway',1001,1001,NULL,NULL,0,0,0,0,0,0,0),(6,'295 Buckingham Way.','San Francisco','CA','USA',NULL,'Taken',8,'Parking Stall',1000,1000,NULL,NULL,0,0,0,0,0,0,0),(11,'1600 Holloway Ave.','San Francisco','CA','USA',NULL,'Free',10,'Garage Door',1001,1001,NULL,NULL,0,0,0,0,0,0,0);
/*!40000 ALTER TABLE `Parking_Spot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Parking_Spot_Photos`
--

DROP TABLE IF EXISTS `Parking_Spot_Photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Parking_Spot_Photos` (
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
  CONSTRAINT `fk_Photos_Host` FOREIGN KEY (`Host_idHost`, `Host_Account_idAccount`) REFERENCES `Host` (`idHost`, `Account_idAccount`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Photos_Parking_Spot` FOREIGN KEY (`Parking_Spot_idParking_Spot`, `Parking_Spot_Host_idHost`, `Parking_Spot_Host_Account_idAccount`) REFERENCES `Parking_Spot` (`idParking_Spot`, `Host_idHost`, `Host_Account_idAccount`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Parking_Spot_Photos`
--

LOCK TABLES `Parking_Spot_Photos` WRITE;
/*!40000 ALTER TABLE `Parking_Spot_Photos` DISABLE KEYS */;
INSERT INTO `Parking_Spot_Photos` VALUES (1,'coming-soon.jpg',1001,1001,5,1001,1001),(2,'san-franciso-driveway.jpg',1001,1001,11,1001,1001),(3,'parking_spot.jpg',1000,1000,6,1000,1000);
/*!40000 ALTER TABLE `Parking_Spot_Photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Region`
--

DROP TABLE IF EXISTS `Region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Region` (
  `idRegion` int NOT NULL AUTO_INCREMENT,
  `regionName` varchar(45) NOT NULL,
  PRIMARY KEY (`idRegion`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Region`
--

LOCK TABLES `Region` WRITE;
/*!40000 ALTER TABLE `Region` DISABLE KEYS */;
INSERT INTO `Region` VALUES (1,'North America'),(2,'South America'),(3,'Europe'),(6,'Asia');
/*!40000 ALTER TABLE `Region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `idUser` int NOT NULL AUTO_INCREMENT,
  `first_Name` varchar(45) NOT NULL,
  `last_Name` varchar(45) NOT NULL,
  `photo_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`idUser`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1000,'Kirk','Simmons',NULL,'kirk@mygarage.com','password'),(1001,'Tracy','Porter',NULL,'tracy@mygaragedb.com','password'),(1002,'Kim','Martinez',NULL,'kim@mygaragedb.com','password');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User_Photos`
--

DROP TABLE IF EXISTS `User_Photos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User_Photos` (
  `idPhotos` int NOT NULL AUTO_INCREMENT,
  `img_name` varchar(45) NOT NULL DEFAULT 'anonymous.jpg',
  `Host_idHost` int NOT NULL,
  `Host_Account_idAccount` int NOT NULL,
  `Guest_idGuest` int NOT NULL,
  `Guest_Account_idAccount` int NOT NULL,
  PRIMARY KEY (`idPhotos`,`Host_idHost`,`Host_Account_idAccount`,`Guest_idGuest`,`Guest_Account_idAccount`),
  KEY `fk_Photos_Host1_idx` (`Host_idHost`,`Host_Account_idAccount`),
  KEY `fk_Photos_Guest1_idx` (`Guest_idGuest`,`Guest_Account_idAccount`),
  CONSTRAINT `fk_Photos_Guest10` FOREIGN KEY (`Guest_idGuest`, `Guest_Account_idAccount`) REFERENCES `Guest` (`idGuest`, `Account_idAccount`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Photos_Host10` FOREIGN KEY (`Host_idHost`, `Host_Account_idAccount`) REFERENCES `Host` (`idHost`, `Account_idAccount`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_Photos`
--

LOCK TABLES `User_Photos` WRITE;
/*!40000 ALTER TABLE `User_Photos` DISABLE KEYS */;
/*!40000 ALTER TABLE `User_Photos` ENABLE KEYS */;
UNLOCK TABLES;

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
  CONSTRAINT `fk_User_has_Parking_Spot_Parking_Spot1` FOREIGN KEY (`Parking_Spot_idParking_Spot`, `Parking_Spot_Host_idHost`, `Parking_Spot_Host_Account_idAccount`) REFERENCES `Parking_Spot` (`idParking_Spot`, `Host_idHost`, `Host_Account_idAccount`) ON UPDATE CASCADE,
  CONSTRAINT `fk_User_has_Parking_Spot_User1` FOREIGN KEY (`User_idUser`) REFERENCES `User` (`idUser`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User_searches_Parking_Spot`
--

LOCK TABLES `User_searches_Parking_Spot` WRITE;
/*!40000 ALTER TABLE `User_searches_Parking_Spot` DISABLE KEYS */;
/*!40000 ALTER TABLE `User_searches_Parking_Spot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vehicle`
--

DROP TABLE IF EXISTS `Vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Vehicle` (
  `idVehicle` int NOT NULL AUTO_INCREMENT,
  `color` varchar(45) NOT NULL,
  `make` varchar(45) NOT NULL,
  `model` varchar(45) NOT NULL,
  `license_num` varchar(7) NOT NULL,
  `Guest_idGuest` int NOT NULL,
  `Guest_Account_idAccount` int NOT NULL,
  `Vehicles_List_idVehicles_List` int NOT NULL,
  PRIMARY KEY (`idVehicle`,`Guest_idGuest`,`Guest_Account_idAccount`,`Vehicles_List_idVehicles_List`),
  UNIQUE KEY `license_num_UNIQUE` (`license_num`),
  KEY `fk_Vehicle_Guest1_idx` (`Guest_idGuest`,`Guest_Account_idAccount`),
  KEY `fk_Vehicle_Vehicles_List1_idx` (`Vehicles_List_idVehicles_List`),
  CONSTRAINT `fk_Vehicle_Guest1` FOREIGN KEY (`Guest_idGuest`, `Guest_Account_idAccount`) REFERENCES `Guest` (`idGuest`, `Account_idAccount`) ON UPDATE CASCADE,
  CONSTRAINT `fk_Vehicle_Vehicles_List1` FOREIGN KEY (`Vehicles_List_idVehicles_List`) REFERENCES `Vehicles_List` (`idVehicles_List`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vehicle`
--

LOCK TABLES `Vehicle` WRITE;
/*!40000 ALTER TABLE `Vehicle` DISABLE KEYS */;
/*!40000 ALTER TABLE `Vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Vehicles_List`
--

DROP TABLE IF EXISTS `Vehicles_List`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Vehicles_List` (
  `idVehicles_List` int NOT NULL AUTO_INCREMENT,
  `vehicleSize` varchar(45) NOT NULL,
  PRIMARY KEY (`idVehicles_List`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Vehicles_List`
--

LOCK TABLES `Vehicles_List` WRITE;
/*!40000 ALTER TABLE `Vehicles_List` DISABLE KEYS */;
INSERT INTO `Vehicles_List` VALUES (1,'Motorcycle'),(2,'Compact'),(3,'Full Size'),(4,'SUV'),(5,'Passenger Van'),(6,'Pickup'),(7,'Mini Van');
/*!40000 ALTER TABLE `Vehicles_List` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-20 20:19:11
