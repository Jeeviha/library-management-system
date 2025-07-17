-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `Book_ID` int NOT NULL,
  `Book_Name` varchar(100) NOT NULL,
  `Author` varchar(100) NOT NULL,
  `Quantity` int DEFAULT NULL,
  PRIMARY KEY (`Book_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'To Kill a Mockingbird','Harper Lee',5),(2,'1984','George Orwell',4),(3,'The Great Gatsby','F. Scott Fitzgerald',6),(4,'The Catcher in the Rye','J.D. Salinger',3),(5,'Pride and Prejudice','Jane Austen',4),(6,'The Hobbit','J.R.R. Tolkien',2),(7,'Harry Potter and the Sorcerer\'s Stone','J.K. Rowling',7),(8,'The Alchemist','Paulo Coelho',6),(9,'Animal Farm','George Orwell',5),(10,'The Lord of the Rings','J.R.R. Tolkien',3),(11,'The Book Thief','Markus Zusak',4),(12,'A Tale of Two Cities','Charles Dickens',3),(13,'The Fault in Our Stars','John Green',6),(14,'The Da Vinci Code','Dan Brown',4),(15,'Life of Pi','Yann Martel',2),(16,'The Kite Runner','Khaled Hosseini',5),(17,'The Chronicles of Narnia','C.S. Lewis',3),(18,'The Girl on the Train','Paula Hawkins',4),(19,'The Shining','Stephen King',2),(20,'The Power of Now','Eckhart Tolle',6);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `librarian`
--

DROP TABLE IF EXISTS `librarian`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `librarian` (
  `ID` int NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Mail_ID` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `Mail_ID` (`Mail_ID`),
  UNIQUE KEY `Password` (`Password`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `librarian`
--

LOCK TABLES `librarian` WRITE;
/*!40000 ALTER TABLE `librarian` DISABLE KEYS */;
INSERT INTO `librarian` VALUES (101,'Aromal Binukumar','aromal.librarian@gmail.com','LibAro@321'),(102,'Jackie Chan','jackiechan.librarian@gmail.com','LibJack#654'),(103,'Sanvi Vijay','sanvi.librarian@gmail.com','LibSan!987');
/*!40000 ALTER TABLE `librarian` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userborroweddetails`
--

DROP TABLE IF EXISTS `userborroweddetails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `userborroweddetails` (
  `User_ID` int NOT NULL,
  `Book_ID` int NOT NULL,
  `Borrowed_Book` varchar(100) NOT NULL,
  `Borrowed_Date` date DEFAULT NULL,
  `Return_Date` date DEFAULT NULL,
  `Days_Left` int DEFAULT NULL,
  `Exceeded_Days` int DEFAULT NULL,
  `Penalty` int DEFAULT NULL,
  PRIMARY KEY (`User_ID`,`Book_ID`),
  KEY `bookfk` (`Book_ID`),
  CONSTRAINT `bookfk` FOREIGN KEY (`Book_ID`) REFERENCES `book` (`Book_ID`),
  CONSTRAINT `userfk` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userborroweddetails`
--

LOCK TABLES `userborroweddetails` WRITE;
/*!40000 ALTER TABLE `userborroweddetails` DISABLE KEYS */;
INSERT INTO `userborroweddetails` VALUES (1,1,'To Kill a Mockingbird','2025-07-10','2025-07-20',4,0,0),(1,7,'Harry Potter and the Sorcerer\'s Stone','2025-07-12','2025-07-22',6,0,0),(2,3,'The Great Gatsby','2025-07-05','2025-07-15',0,1,10),(3,2,'1984','2025-07-03','2025-07-13',0,3,30),(3,5,'Pride and Prejudice','2025-07-01','2025-07-17',1,0,0);
/*!40000 ALTER TABLE `userborroweddetails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `User_ID` int NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Mail_ID` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  PRIMARY KEY (`User_ID`),
  UNIQUE KEY `Mail_ID` (`Mail_ID`),
  UNIQUE KEY `Password` (`Password`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Monisha Sukumar','monisha@gmail.com','Moni@123'),(2,'Madhu Hari','madhu@gmail.com','Madhu#456'),(3,'Dharshana Bala','dharshana@gmail.com','Dharshu!789');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-17 14:36:59
