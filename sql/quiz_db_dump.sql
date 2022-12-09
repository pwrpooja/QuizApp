-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: quiz_db
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Current Database: `quiz_db`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `quiz_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `quiz_db`;

--
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `answers` (
  `option_no` int NOT NULL AUTO_INCREMENT,
  `option_text` varchar(1000) NOT NULL,
  `quetion_id` int NOT NULL,
  PRIMARY KEY (`option_no`),
  KEY `FK_Ans_QueId_idx` (`quetion_id`),
  CONSTRAINT `FK_Ans_QueId` FOREIGN KEY (`quetion_id`) REFERENCES `questions` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
INSERT INTO `answers` VALUES (1,':',1),(2,';',1),(3,'!',1),(4,'&',1);
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_ans_mapping`
--

DROP TABLE IF EXISTS `question_ans_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question_ans_mapping` (
  `que_id` int NOT NULL,
  `ans_id` int NOT NULL,
  PRIMARY KEY (`que_id`),
  KEY `FK_ANS_AID_idx` (`ans_id`),
  CONSTRAINT `FK_ANS_AID` FOREIGN KEY (`ans_id`) REFERENCES `answers` (`option_no`),
  CONSTRAINT `FK_ANS_QID` FOREIGN KEY (`que_id`) REFERENCES `questions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_ans_mapping`
--

LOCK TABLES `question_ans_mapping` WRITE;
/*!40000 ALTER TABLE `question_ans_mapping` DISABLE KEYS */;
INSERT INTO `question_ans_mapping` VALUES (1,1);
/*!40000 ALTER TABLE `question_ans_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quetion_Text` varchar(250) NOT NULL,
  `quiz_type` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Quiz_type_idx` (`quiz_type`),
  CONSTRAINT `FK_Que_Quiz_Type` FOREIGN KEY (`quiz_type`) REFERENCES `quiz` (`Quiz_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,'Which of the following does TypeScript use to specify types?',1);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz`
--

DROP TABLE IF EXISTS `quiz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz` (
  `Quiz_Id` int NOT NULL,
  `Quiz_Name` varchar(45) NOT NULL,
  `Quiz_Type` varchar(45) NOT NULL,
  PRIMARY KEY (`Quiz_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz`
--

LOCK TABLES `quiz` WRITE;
/*!40000 ALTER TABLE `quiz` DISABLE KEYS */;
INSERT INTO `quiz` VALUES (1,'Angular Assessment','Front-End'),(2,'Java Assessment','Front-End');
/*!40000 ALTER TABLE `quiz` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quiz_allocation`
--

DROP TABLE IF EXISTS `quiz_allocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quiz_allocation` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(45) NOT NULL,
  `quiz_type` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Users_Email_idx` (`email`),
  KEY `FK_Quiz_quiz_type_idx` (`quiz_type`),
  CONSTRAINT `FK_Quiz_quiz_type` FOREIGN KEY (`quiz_type`) REFERENCES `quiz` (`Quiz_Id`),
  CONSTRAINT `FK_Users_Email` FOREIGN KEY (`email`) REFERENCES `users` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quiz_allocation`
--

LOCK TABLES `quiz_allocation` WRITE;
/*!40000 ALTER TABLE `quiz_allocation` DISABLE KEYS */;
INSERT INTO `quiz_allocation` VALUES (2,'rushabhpwr@gmail.com',1);
/*!40000 ALTER TABLE `quiz_allocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `result`
--

DROP TABLE IF EXISTS `result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `result` (
  `id` int NOT NULL AUTO_INCREMENT,
  `questions_attempted` int NOT NULL,
  `correct_questions` int NOT NULL,
  `incorrect_questions` int NOT NULL,
  `time_spend` int NOT NULL,
  `login_timestamp` datetime NOT NULL,
  `email` varchar(45) NOT NULL,
  `score` decimal(10,2) NOT NULL,
  `quiz_type` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_quiz_type_idx` (`quiz_type`),
  KEY `FK_email_idx` (`email`),
  CONSTRAINT `FK_email` FOREIGN KEY (`email`) REFERENCES `users` (`Email`),
  CONSTRAINT `FK_quiz_type` FOREIGN KEY (`quiz_type`) REFERENCES `quiz` (`Quiz_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result`
--

LOCK TABLES `result` WRITE;
/*!40000 ALTER TABLE `result` DISABLE KEYS */;
/*!40000 ALTER TABLE `result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `Name` varchar(20) NOT NULL,
  `Email` varchar(45) NOT NULL,
  PRIMARY KEY (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('Pooja Bachhav','poojabachhav24@gmail.com'),('Rushabh Pawar','rushabhpwr@gmail.com');
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

-- Dump completed on 2022-12-09 15:37:01
