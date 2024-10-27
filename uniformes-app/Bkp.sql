CREATE DATABASE  IF NOT EXISTS `uniformes_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `uniformes_db`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: uniformes_db
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `entregas`
--

DROP TABLE IF EXISTS `entregas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entregas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `funcionario_id` int DEFAULT NULL,
  `data_entrega` date DEFAULT NULL,
  `camisa` tinyint(1) DEFAULT NULL,
  `calca` tinyint(1) DEFAULT NULL,
  `observacao` text,
  `sapato` tinyint(1) DEFAULT '0',
  `data_camisa` date DEFAULT NULL,
  `data_calca` date DEFAULT NULL,
  `data_sapato` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `funcionario_id` (`funcionario_id`),
  CONSTRAINT `entregas_ibfk_1` FOREIGN KEY (`funcionario_id`) REFERENCES `funcionarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entregas`
--

LOCK TABLES `entregas` WRITE;
/*!40000 ALTER TABLE `entregas` DISABLE KEYS */;
INSERT INTO `entregas` VALUES (1,1,'2024-10-23',1,0,'',0,NULL,NULL,NULL),(2,2,'2024-10-23',0,1,'precisa de Camisa Tamanho P',0,NULL,NULL,NULL),(3,3,'2024-10-23',1,1,'',0,NULL,NULL,NULL),(4,5,'2024-10-23',0,0,'',1,NULL,NULL,NULL),(5,6,'2024-10-23',1,0,'',0,NULL,NULL,NULL),(6,7,'2024-10-23',0,0,'',1,NULL,NULL,NULL),(7,8,'2024-10-23',0,0,'',1,NULL,NULL,NULL),(8,9,'2024-10-23',0,0,'',1,NULL,NULL,NULL),(9,10,'2024-10-23',0,1,'',1,NULL,NULL,NULL),(10,10,'2024-10-25',1,0,'',1,'2024-10-25',NULL,'2024-10-25'),(11,10,'2024-10-25',0,1,'',0,NULL,'2024-10-25',NULL),(12,10,'2024-10-25',1,0,'',0,'2024-10-25',NULL,NULL),(13,10,'2024-10-25',1,0,'',0,'2024-10-25',NULL,NULL);
/*!40000 ALTER TABLE `entregas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionarios`
--

DROP TABLE IF EXISTS `funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `matricula` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `matricula` (`matricula`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionarios`
--

LOCK TABLES `funcionarios` WRITE;
/*!40000 ALTER TABLE `funcionarios` DISABLE KEYS */;
INSERT INTO `funcionarios` VALUES (1,'Bruno henrique Cardoso','112233'),(2,'Lucas Sabadini Souza','403020'),(3,'Felipe Castro Perosa','1105523'),(4,'Antonio Nunes de Lima','1114933'),(5,'MAURICIO ALVES','56911'),(6,'REGINA CELIA DOS ANJOS','79676'),(7,'BIANCA DE OLIVEIRA','111167'),(8,'BRUNO ZORZATTO','110342'),(9,'CAIO LINCON ALEXANDRE','110958'),(10,'CLAUDIA FRAGASSI','108501');
/*!40000 ALTER TABLE `funcionarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-25 15:41:10
