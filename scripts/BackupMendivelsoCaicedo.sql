-- Tablas:
-- categoria
-- cliente
-- log_cliente
-- log_pedido
-- medio_pago
-- pedido
-- producto
-- proveedor
-- vendedor
-- venta


-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ecommerce_coder
-- ------------------------------------------------------

-- Server version	5.5.5-10.4.24-MariaDB

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
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Hogar'),(2,'Sport'),(3,'Electrodomésticos'),(4,'Juguetes'),(5,'prueba');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Juan','322121',3214123,'juan@hotamil.com','Buenos aires'),(2,'Pedro','736432',64738173,'pedro@hotamil.com','Bogota'),(3,'Maria','122333',43242332,'maria@hotamil.com','Bogota'),(4,'Rodrigo','100022',42133345,'rodrigo@hotamil.com','Bogota'),(5,'Ema','123412',36564432,'ema@hotamil.com','Bogota'),(6,'Duvan','123568',44234212,'duvan@hotamil.com','Bogota'),(7,'Ana','736482',64738173,'ana@hotamil.com','Bogota'),(8,'Wilmer','736483',42424222,'wilmer@hotamil.com','Bogota'),(9,'Julian','323112',13443234,'julian@hotamil.com','Bogota'),(10,'Fabian','564643',86765744,'fabian@hotamil.com','Bogota'),(11,'Lorena','434543',22344441,'lorena@hotamil.com','Bogota'),(12,'Natalia','874567',64645653,'natalia@hotamil.com','Bogota'),(13,'Adriana','234543',12311133,'adriana@hotamil.com','Bogota'),(14,'Roberto','876886',32324224,'roberto@hotamil.com','Bogota'),(15,'Lucas','8674371',23317482,'lucas@hotamil.com','rosario'),(17,'Militao','9999999',864531312,'milan@hotamil.com','bogota');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `log_cliente`
--

LOCK TABLES `log_cliente` WRITE;
/*!40000 ALTER TABLE `log_cliente` DISABLE KEYS */;
INSERT INTO `log_cliente` VALUES (1,'Delete','root@localhost','Rocio','2347437','N/A','2023-03-13 22:45:28'),(2,'Update','root@localhost','Milan','2949999','9999999','2023-03-13 22:45:28');
/*!40000 ALTER TABLE `log_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `log_pedido`
--

LOCK TABLES `log_pedido` WRITE;
/*!40000 ALTER TABLE `log_pedido` DISABLE KEYS */;
INSERT INTO `log_pedido` VALUES (1,'Insert','root@localhost',43,'2023-03-13 22:45:28'),(2,'Insert','root@localhost',44,'2023-03-13 22:45:28'),(3,'delete','root@localhost',44,'2023-03-13 22:45:28');
/*!40000 ALTER TABLE `log_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `medio_pago`
--

LOCK TABLES `medio_pago` WRITE;
/*!40000 ALTER TABLE `medio_pago` DISABLE KEYS */;
INSERT INTO `medio_pago` VALUES (1,'Efectivo',16),(2,'Pse',10),(3,'Tarjeta Credito',5);
/*!40000 ALTER TABLE `medio_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,1,1,1,1,'2023-03-13 22:44:29'),(2,1,3,1,1,'2023-03-13 22:44:29'),(3,15,1,2,3,'2023-03-13 22:44:29'),(4,15,3,2,3,'2023-03-13 22:44:29'),(5,15,5,2,3,'2023-03-13 22:44:29'),(6,2,7,3,3,'2023-03-13 22:44:29'),(7,2,8,3,3,'2023-03-13 22:44:29'),(8,14,3,4,1,'2023-03-13 22:44:29'),(9,14,4,4,1,'2023-03-13 22:44:29'),(10,3,2,5,2,'2023-03-13 22:44:29'),(11,3,6,5,2,'2023-03-13 22:44:29'),(12,13,3,6,1,'2023-03-13 22:44:29'),(13,13,4,6,1,'2023-03-13 22:44:29'),(14,13,4,6,1,'2023-03-13 22:44:29'),(15,4,1,7,3,'2023-03-13 22:44:29'),(16,4,5,7,3,'2023-03-13 22:44:29'),(17,4,3,7,3,'2023-03-13 22:44:29'),(18,4,3,7,3,'2023-03-13 22:44:29'),(19,4,7,7,3,'2023-03-13 22:44:29'),(20,12,7,8,2,'2023-03-13 22:44:29'),(21,12,7,8,2,'2023-03-13 22:44:29'),(22,12,7,8,2,'2023-03-13 22:44:29'),(23,12,7,8,2,'2023-03-13 22:44:29'),(24,12,7,8,2,'2023-03-13 22:44:29'),(25,12,7,8,2,'2023-03-13 22:44:29'),(26,12,7,8,2,'2023-03-13 22:44:29'),(27,12,7,8,2,'2023-03-13 22:44:29'),(28,5,6,9,1,'2023-03-13 22:44:29'),(29,5,8,9,1,'2023-03-13 22:44:29'),(30,11,8,10,2,'2023-03-13 22:44:29'),(31,11,8,10,2,'2023-03-13 22:44:29'),(32,11,8,10,2,'2023-03-13 22:44:29'),(33,6,2,11,1,'2023-03-13 22:44:29'),(34,10,5,12,1,'2023-03-13 22:44:29'),(35,7,2,13,3,'2023-03-13 22:44:29'),(36,7,4,13,3,'2023-03-13 22:44:29'),(37,9,5,14,2,'2023-03-13 22:44:29'),(38,9,6,14,2,'2023-03-13 22:44:29'),(39,8,7,15,1,'2023-03-13 22:44:29'),(40,8,7,15,1,'2023-03-13 22:44:29'),(41,8,8,15,1,'2023-03-13 22:44:29'),(42,8,8,15,1,'2023-03-13 22:44:29'),(43,1,1,1,1,'2023-03-13 22:45:28');
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'TV 30 pulgadas',1000,3,5),(2,'TV 60 pulgadas',1500,3,6),(3,'Zapatos w2',300,2,2),(4,'Zapatos w3',150,2,4),(5,'Mesa',600,1,1),(6,'Cama',800,1,1),(7,'Balon',30,4,7),(8,'Raqueta',50,4,7);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'Arkea'),(2,'Nike'),(3,'Adidas'),(4,'Puma'),(5,'LG'),(6,'Samsung'),(7,'Toys'),(16,'proveedor1'),(17,'proveedor2'),(18,'proveedor3'),(19,'proveedor4');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `vendedor`
--

LOCK TABLES `vendedor` WRITE;
/*!40000 ALTER TABLE `vendedor` DISABLE KEYS */;
INSERT INTO `vendedor` VALUES (1,'Maria Cardenas'),(2,'Miguel Castaño'),(3,'Lucia Ruiz'),(4,'Rafael Lopez'),(5,'Ximena jizz'),(6,'Vannesa Paez');
/*!40000 ALTER TABLE `vendedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (1,2,1300,2),(2,3,1900,1),(3,2,80,3),(4,2,450,5),(5,2,2300,4),(6,3,600,6),(7,5,2230,5),(8,8,240,6),(9,2,850,5),(10,3,150,2),(11,1,1500,3),(12,1,600,6),(13,2,1650,4),(14,2,1200,1),(15,4,160,4);
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-27 21:18:01
