-- MySQL dump 10.13  Distrib 8.0.33, for macos13 (arm64)
--
-- Host: localhost    Database: LittleLemonDB
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Bookings`
--

DROP TABLE IF EXISTS `Bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Bookings` (
  `BookingID` int NOT NULL AUTO_INCREMENT,
  `Table` int NOT NULL,
  `Date` date NOT NULL,
  `CustomerID` int NOT NULL,
  PRIMARY KEY (`BookingID`),
  KEY `fk_Bookings_Customers1_idx` (`CustomerID`),
  CONSTRAINT `fk_Bookings_Customers1` FOREIGN KEY (`CustomerID`) REFERENCES `Customers` (`CustomerID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bookings`
--

LOCK TABLES `Bookings` WRITE;
/*!40000 ALTER TABLE `Bookings` DISABLE KEYS */;
INSERT INTO `Bookings` VALUES (1,12,'2023-06-01',1),(2,12,'2023-06-02',2),(3,19,'2023-06-03',3),(4,15,'2023-06-04',4),(5,5,'2023-06-05',5),(6,8,'2023-06-06',6),(7,8,'2023-06-07',7),(8,5,'2023-06-08',8),(10,5,'2022-10-10',1),(11,3,'2022-11-12',3),(12,2,'2022-10-11',2),(13,2,'2022-10-13',1),(14,4,'2022-12-30',3),(16,3,'2022-10-13',1);
/*!40000 ALTER TABLE `Bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customers`
--

DROP TABLE IF EXISTS `Customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customers` (
  `CustomerID` int NOT NULL,
  `Name` varchar(45) NOT NULL,
  `Phone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customers`
--

LOCK TABLES `Customers` WRITE;
/*!40000 ALTER TABLE `Customers` DISABLE KEYS */;
INSERT INTO `Customers` VALUES (1,'Ana Iversen','582938472983'),(2,'Joakim Iversen','482938472938'),(3,'Vanessa McCarthy','384721938471'),(4,'Marcos Romero','38472938473'),(5,'Hiroki Yamane','1239472934'),(6,'Diana Pinto','2938401994'),(7,'Anees Java','2947203947'),(8,'Bald Vin','2384713987'),(9,'Jay Kon','9456293884'),(99,'John Doe','7382038499');
/*!40000 ALTER TABLE `Customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MenuItems`
--

DROP TABLE IF EXISTS `MenuItems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MenuItems` (
  `MenuItemsID` int NOT NULL,
  `CourseName` varchar(45) DEFAULT NULL,
  `StarterName` varchar(45) DEFAULT NULL,
  `DesertName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`MenuItemsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MenuItems`
--

LOCK TABLES `MenuItems` WRITE;
/*!40000 ALTER TABLE `MenuItems` DISABLE KEYS */;
INSERT INTO `MenuItems` VALUES (1,'Olives','Greek Salad','Greek yoghurt'),(2,'Minestrone','Pizza','Cheesecake'),(3,'Falafel','Kabasa','Ice cream');
/*!40000 ALTER TABLE `MenuItems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Menus`
--

DROP TABLE IF EXISTS `Menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Menus` (
  `MenuID` int NOT NULL,
  `MenuName` varchar(45) DEFAULT NULL,
  `Cuisine` varchar(45) DEFAULT NULL,
  `MenuItemsID` int NOT NULL,
  PRIMARY KEY (`MenuID`),
  KEY `fk_Menus_MenuItems1_idx` (`MenuItemsID`),
  CONSTRAINT `fk_Menus_MenuItems1` FOREIGN KEY (`MenuItemsID`) REFERENCES `MenuItems` (`MenuItemsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Menus`
--

LOCK TABLES `Menus` WRITE;
/*!40000 ALTER TABLE `Menus` DISABLE KEYS */;
INSERT INTO `Menus` VALUES (1,'Menu1','Greek',1),(2,'Menu2','Italian',2),(3,'Menu3','Turkish',3);
/*!40000 ALTER TABLE `Menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OrderDeliveries`
--

DROP TABLE IF EXISTS `OrderDeliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OrderDeliveries` (
  `DeliveryID` int NOT NULL AUTO_INCREMENT,
  `DeliveryDate` date DEFAULT NULL,
  `Status` varchar(45) DEFAULT NULL,
  `OrderID` int NOT NULL,
  `StaffID` int NOT NULL,
  PRIMARY KEY (`DeliveryID`),
  KEY `fk_OrderDeliveries_Orders1_idx` (`OrderID`),
  KEY `fk_OrderDeliveries_Staff1_idx` (`StaffID`),
  CONSTRAINT `fk_OrderDeliveries_Orders1` FOREIGN KEY (`OrderID`) REFERENCES `Orders` (`OrderID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_OrderDeliveries_Staff1` FOREIGN KEY (`StaffID`) REFERENCES `Staff` (`StaffID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OrderDeliveries`
--

LOCK TABLES `OrderDeliveries` WRITE;
/*!40000 ALTER TABLE `OrderDeliveries` DISABLE KEYS */;
/*!40000 ALTER TABLE `OrderDeliveries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Orders`
--

DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Orders` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `Date` date NOT NULL,
  `Quantity` int DEFAULT NULL,
  `TotalCost` int NOT NULL,
  `BookingID` int NOT NULL,
  `Menus_MenuID` int NOT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `fk_Orders_Bookings_idx` (`BookingID`),
  KEY `fk_Orders_Menus1_idx` (`Menus_MenuID`),
  CONSTRAINT `fk_Orders_Bookings` FOREIGN KEY (`BookingID`) REFERENCES `Bookings` (`BookingID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Orders_Menus1` FOREIGN KEY (`Menus_MenuID`) REFERENCES `Menus` (`MenuID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Orders`
--

LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` VALUES (1,'2023-05-01',5,215,1,1),(2,'2023-05-02',1,37,2,2),(3,'2023-05-03',1,37,3,2),(4,'2023-05-04',1,40,4,3),(5,'2023-05-05',3,129,5,1);
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `ordersgt150`
--

DROP TABLE IF EXISTS `ordersgt150`;
/*!50001 DROP VIEW IF EXISTS `ordersgt150`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ordersgt150` AS SELECT 
 1 AS `CustomerID`,
 1 AS `Name`,
 1 AS `OrderID`,
 1 AS `TotalCost`,
 1 AS `MenuName`,
 1 AS `CourseName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `ordersmenuqtygt2`
--

DROP TABLE IF EXISTS `ordersmenuqtygt2`;
/*!50001 DROP VIEW IF EXISTS `ordersmenuqtygt2`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ordersmenuqtygt2` AS SELECT 
 1 AS `MenuName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `ordersview`
--

DROP TABLE IF EXISTS `ordersview`;
/*!50001 DROP VIEW IF EXISTS `ordersview`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ordersview` AS SELECT 
 1 AS `OrderID`,
 1 AS `Quantity`,
 1 AS `TotalCost`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `Staff`
--

DROP TABLE IF EXISTS `Staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Staff` (
  `StaffID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Role` varchar(45) DEFAULT NULL,
  `Salary` int DEFAULT NULL,
  PRIMARY KEY (`StaffID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Staff`
--

LOCK TABLES `Staff` WRITE;
/*!40000 ALTER TABLE `Staff` DISABLE KEYS */;
INSERT INTO `Staff` VALUES (1,'Mario Gollini','Manager',70000),(2,'Adrian Gollini','Assistant Manager',65000),(3,'Giorgos Dioudis','Head Chef',50000),(4,'Fatma Kaya','Assistant Chef',45000),(5,'Elena Salvai','Head Waiter',40000),(6,'John Millar','Receptionist',35000);
/*!40000 ALTER TABLE `Staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `ordersgt150`
--

/*!50001 DROP VIEW IF EXISTS `ordersgt150`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`dbUser1`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ordersgt150` AS select `customers`.`CustomerID` AS `CustomerID`,`customers`.`Name` AS `Name`,`orders`.`OrderID` AS `OrderID`,`orders`.`TotalCost` AS `TotalCost`,`menus`.`MenuName` AS `MenuName`,`menuitems`.`CourseName` AS `CourseName` from ((((`orders` join `bookings` on((`orders`.`BookingID` = `bookings`.`BookingID`))) join `customers` on((`bookings`.`CustomerID` = `customers`.`CustomerID`))) join `menus` on((`orders`.`Menus_MenuID` = `menus`.`MenuID`))) join `menuitems` on((`menus`.`MenuItemsID` = `menuitems`.`MenuItemsID`))) where (`orders`.`TotalCost` > 150) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ordersmenuqtygt2`
--

/*!50001 DROP VIEW IF EXISTS `ordersmenuqtygt2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`dbUser1`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ordersmenuqtygt2` AS select `menus`.`MenuName` AS `MenuName` from `menus` where `menus`.`MenuID` in (select `menus`.`MenuID` from (`orders` join `menus` on((`orders`.`Menus_MenuID` = `menus`.`MenuID`))) where (`orders`.`Quantity` > 2)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ordersview`
--

/*!50001 DROP VIEW IF EXISTS `ordersview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`dbUser1`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ordersview` AS select `orders`.`OrderID` AS `OrderID`,`orders`.`Quantity` AS `Quantity`,`orders`.`TotalCost` AS `TotalCost` from `orders` where (`orders`.`Quantity` > 2) */;
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

-- Dump completed on 2023-07-14 15:34:13
