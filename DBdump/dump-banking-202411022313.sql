-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: banking
-- ------------------------------------------------------
-- Server version	9.1.0

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `account_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `opening_date` datetime NOT NULL,
  `account_type` varchar(10) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`account_id`),
  KEY `fk_customer` (`customer_id`),
  CONSTRAINT `fk_customer` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,1,'2024-01-01 10:00:00','Savings',1000.00,1),(2,2,'2024-01-02 11:30:00','Checking',2000.50,1),(3,3,'2024-01-03 09:45:00','Savings',500.75,0),(4,4,'2024-01-04 14:20:00','Checking',1500.00,1),(5,5,'2024-01-05 08:10:00','Savings',3000.00,1),(6,6,'2024-01-06 17:30:00','Checking',2500.00,0),(7,7,'2024-01-07 12:05:00','Savings',1200.25,1),(8,8,'2024-01-08 16:00:00','Checking',1700.50,1),(9,9,'2024-01-09 13:40:00','Savings',900.00,0),(10,10,'2024-01-10 15:30:00','Checking',2200.75,1),(11,1,'2024-01-11 09:30:00','Savings',1100.00,1),(12,2,'2024-01-12 11:00:00','Checking',2400.25,0),(13,3,'2024-01-13 10:10:00','Savings',950.50,1),(14,4,'2024-01-14 14:00:00','Checking',1300.00,1),(15,5,'2024-01-15 08:45:00','Savings',2800.00,0),(16,6,'2024-01-16 16:45:00','Checking',2100.50,1),(17,7,'2024-01-17 12:15:00','Savings',1000.00,1),(18,8,'2024-01-18 17:00:00','Checking',1900.00,1),(19,9,'2024-01-19 13:50:00','Savings',800.75,0),(20,10,'2024-01-20 15:45:00','Checking',2300.00,1),(22,3,'2024-01-20 15:45:00','Checking',2300.00,1);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `zipcode` varchar(10) DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'John Doe','1985-01-15','New York','10001',1),(2,'Jane Smith','1990-06-22','Los Angeles','90001',1),(3,'Alice Brown','1978-11-05','Chicago','60601',0),(4,'Bob White','1982-03-18','Houston','77001',1),(5,'Charlie Black','1995-09-23','Phoenix','85001',0),(6,'Diana Green','1989-02-14','Philadelphia','19019',1),(7,'Eve Adams','1993-07-30','San Antonio','78201',0),(8,'Frank Miller','1980-10-10','San Diego','92101',1),(9,'Grace Lee','1975-12-02','Dallas','75201',1),(10,'Hank Johnson','1983-04-11','San Jose','95101',0);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'banking'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-02 23:13:39
