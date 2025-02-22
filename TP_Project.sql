-- MySQL dump 10.13  Distrib 8.0.38, for macos14 (x86_64)
--
-- Host: 127.0.0.1    Database: reparmat1
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
-- Table structure for table `CLIENTELE`
--

DROP TABLE IF EXISTS `CLIENTELE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENTELE` (
  `REFCLIENT` int NOT NULL,
  `NOMSOCIETE` varchar(45) DEFAULT NULL,
  `PRENOMCONTACT` varchar(45) DEFAULT NULL,
  `NOMCONTACT` varchar(45) DEFAULT NULL,
  `ADRESSEFACTURATION` varchar(45) DEFAULT NULL,
  `VILLE` varchar(45) DEFAULT NULL,
  `REGION` varchar(45) DEFAULT NULL,
  `CODEPOSTAL` varchar(45) DEFAULT NULL,
  `PAYS` varchar(45) DEFAULT NULL,
  `TITRECONTACT` varchar(45) DEFAULT NULL,
  `NUMEROTEL` varchar(45) DEFAULT NULL,
  `NUMTELECOPIE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`REFCLIENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENTELE`
--

LOCK TABLES `CLIENTELE` WRITE;
/*!40000 ALTER TABLE `CLIENTELE` DISABLE KEYS */;
INSERT INTO `CLIENTELE` VALUES (1,'Trail\'s Head Gourmet Provisioners','Helvetius','Nagy','722 DaVinci Blvd.','Kirkland','WA','98034','ÉU','Adjoint aux ventes','(301) 555-8257','(301) 555-2174'),(2,'Lazy K Kountry Store','John','Steel','12 Orchestra Terrace','Walla Walla','WA','99362','ÉU','Directeur marketing','(301) 555-7969','(301) 555-6221'),(3,'The Big Cheese','Liz','Nixon','89 Jefferson Way','Portland','OR','97201','ÉU','Directeur marketing','(403) 555-3612','(403) 555-3613'),(4,'Lonesome Pine Restaurant','Fran','Wilson','89 Chiaroscuro Rd.','Portland','OR','97219','ÉU','Directeur commercial','(403) 555-3612','(403) 555-9646'),(5,'Save-a-lot Markets','Jose','Pavarotti','187 Suffolk Ln.','Boise','ID','83720','ÉU','Représentant','(360) 555-8097','(360) 555-8097');
/*!40000 ALTER TABLE `CLIENTELE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EMPLOYES`
--

DROP TABLE IF EXISTS `EMPLOYES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EMPLOYES` (
  `REFEMPLOYE` int NOT NULL,
  `PRENOM` varchar(45) DEFAULT NULL,
  `NOMFAMILLE` varchar(45) DEFAULT NULL,
  `TITRE` varchar(45) DEFAULT NULL,
  `TELPROFESSIONNEL` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`REFEMPLOYE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMPLOYES`
--

LOCK TABLES `EMPLOYES` WRITE;
/*!40000 ALTER TABLE `EMPLOYES` DISABLE KEYS */;
INSERT INTO `EMPLOYES` VALUES (1,'Nancy','Davolio','Technicien','(301) 555-9857'),(2,'Andrew','Fuller','Technicien','(301) 555-9482'),(3,'Janet','Leverling','Directeur','(301) 555-3412'),(4,'Margaret','Peacock','Technicien','(301) 555-8122'),(5,'Steven','Buchanan','Technicien','(301) 555-1189');
/*!40000 ALTER TABLE `EMPLOYES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HEURES_FACTUREES`
--

DROP TABLE IF EXISTS `HEURES_FACTUREES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HEURES_FACTUREES` (
  `REFORDREDETRAVAIL` int NOT NULL,
  `REFEMPLOYE` int NOT NULL,
  `HEURESFACTURABLES` decimal(3,2) DEFAULT NULL,
  `TAUXFACTURATION` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`REFORDREDETRAVAIL`,`REFEMPLOYE`),
  KEY `FK-HEURES_FACTUREES-EMPLOYES_idx` (`REFEMPLOYE`),
  CONSTRAINT `FK-HEURES_FACTUREES-EMPLOYES` FOREIGN KEY (`REFEMPLOYE`) REFERENCES `EMPLOYES` (`REFEMPLOYE`),
  CONSTRAINT `FK-HEURES_FACTUREES-ORDRE_DE_TARVAIL` FOREIGN KEY (`REFORDREDETRAVAIL`) REFERENCES `ORDRE_DE_TRAVAIL` (`REFORDREDETRAVAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HEURES_FACTUREES`
--

LOCK TABLES `HEURES_FACTUREES` WRITE;
/*!40000 ALTER TABLE `HEURES_FACTUREES` DISABLE KEYS */;
INSERT INTO `HEURES_FACTUREES` VALUES (1,1,1.00,'45,00 €'),(1,2,1.00,'56,00 €'),(2,2,2.00,'23,00 €'),(3,4,1.50,'22,00 €'),(4,1,1.25,'45,00 €'),(5,2,0.45,'55,00 €'),(6,4,0.85,'35,00 €'),(7,2,1.75,'55,00 €'),(8,1,0.40,'45,00 €'),(9,1,0.40,'45,00 €'),(9,5,1.20,'35,00 €');
/*!40000 ALTER TABLE `HEURES_FACTUREES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MODES_PAIEMENT`
--

DROP TABLE IF EXISTS `MODES_PAIEMENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MODES_PAIEMENT` (
  `REFMODEPAIEMENT` int NOT NULL,
  `MODEPAIEMENT` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`REFMODEPAIEMENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MODES_PAIEMENT`
--

LOCK TABLES `MODES_PAIEMENT` WRITE;
/*!40000 ALTER TABLE `MODES_PAIEMENT` DISABLE KEYS */;
INSERT INTO `MODES_PAIEMENT` VALUES (1,'Chèque'),(2,'Carte bleue'),(3,'Carte Visa'),(4,'Carte American Express'),(5,'Liquide');
/*!40000 ALTER TABLE `MODES_PAIEMENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ORDRE_DE_TRAVAIL`
--

DROP TABLE IF EXISTS `ORDRE_DE_TRAVAIL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ORDRE_DE_TRAVAIL` (
  `REFORDREDETRAVAIL` int NOT NULL,
  `REFCLIENT` int DEFAULT NULL,
  `REFEMPLOYE` int DEFAULT NULL,
  `DATERECEPTION` date DEFAULT NULL,
  `DATEEXIGIBILITE` date DEFAULT NULL,
  `MARQUEETMODELE` varchar(45) DEFAULT NULL,
  `NUMEROSERIE` varchar(45) DEFAULT NULL,
  `DESCRIPTIONPROBLEME` varchar(100) DEFAULT NULL,
  `DATEFIN` date DEFAULT NULL,
  `DATEENLEVEMENT` date DEFAULT NULL,
  PRIMARY KEY (`REFORDREDETRAVAIL`),
  KEY `FK-ORDRE_DE_TRAVAIL-EMPLOYES_idx` (`REFEMPLOYE`),
  KEY `FK-ORDRE_DE_TRAVAIL-CLIENTELE_idx` (`REFCLIENT`),
  CONSTRAINT `FK-ORDRE_DE_TRAVAIL-CLIENTELE` FOREIGN KEY (`REFCLIENT`) REFERENCES `CLIENTELE` (`REFCLIENT`),
  CONSTRAINT `FK-ORDRE_DE_TRAVAIL-EMPLOYES` FOREIGN KEY (`REFEMPLOYE`) REFERENCES `EMPLOYES` (`REFEMPLOYE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ORDRE_DE_TRAVAIL`
--

LOCK TABLES `ORDRE_DE_TRAVAIL` WRITE;
/*!40000 ALTER TABLE `ORDRE_DE_TRAVAIL` DISABLE KEYS */;
INSERT INTO `ORDRE_DE_TRAVAIL` VALUES (1,1,1,'2023-11-23','2023-12-04','Caisse enregistreuse ABC 100','P343434-34','L\'écran n\'affiche rien.','2023-12-02','2023-12-03'),(2,1,2,'2023-11-30','2023-12-01','Caisse enregistreuse XYZ 200','J656565-56','Le tiroir de la caisse ne s\'ouvre pas.','2023-12-01','2023-12-01'),(3,2,4,'2024-01-11','2024-01-17','Caisse enregistreuse ABC 300','P343434-35','L\'écran affiche \"Erreur 3433\"','2024-01-16','2024-01-17'),(4,2,1,'2024-01-18','2024-01-20','Caisse enregistreuse XYZ 100','J656565-57','L\'écran affiche \"Erreur 3435\"','2024-01-20','2024-01-20'),(5,2,2,'2024-01-25','2024-01-27','Caisse enregistreuse ABC 300','P343434-36','L\'écran n\'affiche rien.','2024-01-26','2024-01-27'),(6,3,3,'2024-01-12','2024-01-14','Caisse enregistreuse XYZ 300','J656565-58','L\'écran n\'affiche rien.','2024-01-13','2024-01-14'),(7,3,2,'2024-02-02','2024-02-04','Caisse enregistreuse ABC 100','P343434-37','L\'écran affiche \"Erreur 3433\"','2024-02-04','2024-02-04'),(8,4,1,'2024-02-01','2024-02-01','Caisse enregistreuse XYZ 300','J656565-59','Le tiroir ne s\'ouvre pas.','2024-02-01','2024-02-01'),(9,5,5,'2024-02-08','2024-02-09','Caisse enregistreuse ABC 100','P343434-38','ne fonctionne plus après une surtension due à un orage.','2024-02-08','2024-02-09');
/*!40000 ALTER TABLE `ORDRE_DE_TRAVAIL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PAIEMENTS`
--

DROP TABLE IF EXISTS `PAIEMENTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PAIEMENTS` (
  `REFPAIEMENT` int NOT NULL,
  `REFORDREDETRAVAIL` int DEFAULT NULL,
  `MONTANTPAIEMENT` varchar(45) DEFAULT NULL,
  `DATEPAIEMENT` date DEFAULT NULL,
  `NUMCARTEBANCIARE` varchar(45) DEFAULT NULL,
  `NOMTITULAIRECARTE` varchar(45) DEFAULT NULL,
  `DATEEXPIRCARTE` date DEFAULT NULL,
  `REFMODEPAIEMENT` int DEFAULT NULL,
  PRIMARY KEY (`REFPAIEMENT`),
  KEY `FK-PAIEMENTS-MODES_PAIEMENT_idx` (`REFMODEPAIEMENT`),
  KEY `FK-PAIEMENTS-ORDRE_DE_TRAVAIL_idx` (`REFORDREDETRAVAIL`),
  CONSTRAINT `FK-PAIEMENTS-MODES_PAIEMENT` FOREIGN KEY (`REFMODEPAIEMENT`) REFERENCES `MODES_PAIEMENT` (`REFMODEPAIEMENT`),
  CONSTRAINT `FK-PAIEMENTS-ORDRE_DE_TRAVAIL` FOREIGN KEY (`REFORDREDETRAVAIL`) REFERENCES `ORDRE_DE_TRAVAIL` (`REFORDREDETRAVAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PAIEMENTS`
--

LOCK TABLES `PAIEMENTS` WRITE;
/*!40000 ALTER TABLE `PAIEMENTS` DISABLE KEYS */;
INSERT INTO `PAIEMENTS` VALUES (1,1,'190,03 €','2023-12-03','54677987137','Helvetius Nagy','2025-05-31',2),(2,2,'37,80 €','2023-12-01','62348784438','Helvetius Nagy','2025-05-31',2),(3,3,'152,28 €','2024-02-01',NULL,NULL,NULL,1),(4,4,'15,47 €','2024-01-20','78498424513','John Steel','2026-12-01',4),(5,5,'50,44 €','2024-01-27',NULL,NULL,NULL,1),(6,6,'59,70 €','2024-01-14',NULL,NULL,NULL,1),(7,7,'204,25 €','2024-02-02','23546789541','Liz Nixon','2026-02-01',2),(8,8,'30,00 €','2024-02-02','23546789541','Fran Wilson','2026-01-12',4),(9,9,'252,67 €','2024-02-09','55756489542','Jose Pavarotti','2025-07-01',3);
/*!40000 ALTER TABLE `PAIEMENTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PIECES`
--

DROP TABLE IF EXISTS `PIECES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PIECES` (
  `REFPIECE` int NOT NULL,
  `NOMPIECE` varchar(45) DEFAULT NULL,
  `PRIXUNITAIRE` varchar(45) DEFAULT NULL,
  `DESCRIPTIONPIECE` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`REFPIECE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PIECES`
--

LOCK TABLES `PIECES` WRITE;
/*!40000 ALTER TABLE `PIECES` DISABLE KEYS */;
INSERT INTO `PIECES` VALUES (1,'Mécanisme d\'ouverture du tiroir','12,00 €','Contrôle l\'ouverture et la fermeture du tiroir-caisse'),(2,'Circuit contrôleur vidéo','8,00 €',NULL),(3,'Circuit de mémoire 64k','18,00 €',NULL),(4,'Afficheur à cristaux liquides','21,95 €','afficheur 3 pouces sur 5'),(5,'Afficheur à cristaux liquides','54,00 €',NULL);
/*!40000 ALTER TABLE `PIECES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PIECES_FACTUREES`
--

DROP TABLE IF EXISTS `PIECES_FACTUREES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PIECES_FACTUREES` (
  `REFPIECE` int NOT NULL,
  `QUANTITE` int DEFAULT NULL,
  `PRIXUNITAIRE` varchar(45) DEFAULT NULL,
  `REFORDREDETRAVAIL` int NOT NULL,
  PRIMARY KEY (`REFPIECE`,`REFORDREDETRAVAIL`),
  KEY `FK-PIECES_FACTUREES-ORDRE_DE_TRAVAIL_idx` (`REFORDREDETRAVAIL`),
  CONSTRAINT `FK-PIECES_FACTUREES-ORDRE_DE_TRAVAIL` FOREIGN KEY (`REFORDREDETRAVAIL`) REFERENCES `ORDRE_DE_TRAVAIL` (`REFORDREDETRAVAIL`),
  CONSTRAINT `FK-PIECES_FACTUREES-PIECES` FOREIGN KEY (`REFPIECE`) REFERENCES `PIECES` (`REFPIECE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PIECES_FACTUREES`
--

LOCK TABLES `PIECES_FACTUREES` WRITE;
/*!40000 ALTER TABLE `PIECES_FACTUREES` DISABLE KEYS */;
INSERT INTO `PIECES_FACTUREES` VALUES (1,1,'12,00 €',2),(1,1,'12,00 €',4),(1,1,'12,00 €',8),(2,1,'8,00 €',1),(2,1,'8,00 €',6),(2,10,'8,00 €',7),(2,1,'8,00 €',9),(3,4,'18,00 €',4),(3,8,'18,00 €',9),(4,1,'21,95 €',1),(4,1,'21,95 €',5),(4,1,'21,95 €',6),(4,1,'21,95 €',9),(5,2,'54,00 €',3),(5,2,'54,00 €',7);
/*!40000 ALTER TABLE `PIECES_FACTUREES` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-26 23:30:58
