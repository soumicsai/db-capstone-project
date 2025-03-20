-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: littlelemondb
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `BookingID` int NOT NULL,
  `CustomerID` int NOT NULL,
  `StaffID` int NOT NULL,
  `BookingDate` date NOT NULL,
  `TableNumber` int DEFAULT NULL,
  PRIMARY KEY (`BookingID`),
  KEY `customer_id_idx` (`CustomerID`),
  KEY `staff_id_idx` (`StaffID`),
  CONSTRAINT `customer_id` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`) ON DELETE CASCADE,
  CONSTRAINT `staff_id` FOREIGN KEY (`StaffID`) REFERENCES `staff` (`StaffID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `FullName` varchar(255) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `PhoneNumber` varchar(45) NOT NULL,
  PRIMARY KEY (`CustomerID`),
  UNIQUE KEY `PhoneNumber_UNIQUE` (`PhoneNumber`),
  UNIQUE KEY `Email_UNIQUE` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `MenuItemID` int NOT NULL,
  `Name` varchar(45) DEFAULT NULL,
  `Category` varchar(45) DEFAULT NULL,
  `Price` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`MenuItemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderdeliverystatus`
--

DROP TABLE IF EXISTS `orderdeliverystatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderdeliverystatus` (
  `DeliveryID` int NOT NULL,
  `OrderID` int NOT NULL,
  `DeliveryDate` date DEFAULT NULL,
  `Status` varchar(45) NOT NULL,
  PRIMARY KEY (`DeliveryID`),
  KEY `order_id_idx` (`OrderID`),
  CONSTRAINT `order_id` FOREIGN KEY (`OrderID`) REFERENCES `orders` (`OrderID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderdeliverystatus`
--

LOCK TABLES `orderdeliverystatus` WRITE;
/*!40000 ALTER TABLE `orderdeliverystatus` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderdeliverystatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderID` int NOT NULL,
  `CustomerID` int NOT NULL,
  `MenuItemID` int NOT NULL,
  `Quantity` int NOT NULL,
  `TotalCost` decimal(10,0) NOT NULL,
  `OrderDate` date NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `customer_id_idx` (`CustomerID`),
  KEY `menu_item_id_idx` (`MenuItemID`),
  CONSTRAINT `customer_id_ord` FOREIGN KEY (`CustomerID`) REFERENCES `customers` (`CustomerID`) ON DELETE CASCADE,
  CONSTRAINT `menu_item_id` FOREIGN KEY (`MenuItemID`) REFERENCES `menu` (`MenuItemID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `StaffID` int NOT NULL,
  `FullName` varchar(255) NOT NULL,
  `Role` varchar(45) NOT NULL,
  `Salary` decimal(10,0) NOT NULL,
  PRIMARY KEY (`StaffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-20 13:21:16
