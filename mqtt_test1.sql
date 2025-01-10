-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `healthmonitoring`
--

DROP TABLE IF EXISTS `healthmonitoring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `healthmonitoring` (
  `created_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `computer_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `dbtime` timestamp NOT NULL DEFAULT current_timestamp(),
  `site_id` int(11) DEFAULT NULL,
  `device_alias` varchar(10) DEFAULT NULL,
  `cpu` int(11) DEFAULT NULL,
  `swap` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`swap`)),
  `disk` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`disk`)),
  `memory` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`memory`)),
  `network` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`network`))
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `healthmonitoring`
--

LOCK TABLES `healthmonitoring` WRITE;
/*!40000 ALTER TABLE `healthmonitoring` DISABLE KEYS */;
INSERT INTO `healthmonitoring` VALUES ('2023-09-30 03:00:06','2023-09-30 09:17:36','2023-10-01 07:11:40',1,'LenovoLp',1,'{\"total\":3.875,\"used\":0.9505,\"free\":2.9245,\"percentage\":24.5}','{\"total\":476.1582,\"used\":89.2662,\"free\":386.892,\"percentage\":18.7}','{\"total\":23.7933,\"used\":9.3063,\"free\":14.4869,\"percentage\":39.1}','{\"ethernet\":false,\"Bluetooth netwrok connection\":false,\"vEthernet (default switch)\":true,\"Logback pseudo-interface 1\":true,\"Local area connection\":true,\"WiFi\":true,\"Local area connection 1\":false,\"Local area connection 10\":false}'),('2023-09-30 03:00:06','2023-09-30 09:17:36','2023-10-01 12:53:59',1,'1 _ Lenovo',1,'{\"total\":3.875,\"used\":0.9505,\"free\":2.9245,\"percentage\":24.5}','{\"total\":476.1582,\"used\":89.2662,\"free\":386.892,\"percentage\":18.7}','{\"total\":23.7933,\"used\":9.3063,\"free\":14.4869,\"percentage\":39.1}','{\"ethernet\":false,\"Bluetooth netwrok connection\":false,\"vEthernet (default switch)\":true,\"Logback pseudo-interface 1\":true,\"Local area connection\":true,\"WiFi\":true,\"Local area connection 1\":false,\"Local area connection 10\":false}'),('2023-09-30 03:00:06','2023-09-30 09:17:36','2023-10-01 12:55:00',1,'1_LenovoLp',1,'{\"total\":3.875,\"used\":0.9505,\"free\":2.9245,\"percentage\":24.5}','{\"total\":476.1582,\"used\":89.2662,\"free\":386.892,\"percentage\":18.7}','{\"total\":23.7933,\"used\":9.3063,\"free\":14.4869,\"percentage\":39.1}','{\"ethernet\":false,\"Bluetooth netwrok connection\":false,\"vEthernet (default switch)\":true,\"Logback pseudo-interface 1\":true,\"Local area connection\":true,\"WiFi\":true,\"Local area connection 1\":false,\"Local area connection 10\":false}');
/*!40000 ALTER TABLE `healthmonitoring` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `heartbeat`
--

DROP TABLE IF EXISTS `heartbeat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `heartbeat` (
  `created_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `computer_time` timestamp NOT NULL DEFAULT current_timestamp(),
  `dbtime` timestamp NOT NULL DEFAULT current_timestamp(),
  `site_id` int(11) DEFAULT NULL,
  `device_alias` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `heartbeat`
--

LOCK TABLES `heartbeat` WRITE;
/*!40000 ALTER TABLE `heartbeat` DISABLE KEYS */;
INSERT INTO `heartbeat` VALUES ('2023-09-30 03:47:36','2023-09-30 09:17:36','2023-10-01 06:35:50',1,'LenovoLp'),('2023-09-30 03:47:36','2023-09-30 09:17:36','2023-10-01 12:59:56',1,'1_LenovoLp'),('2023-09-30 03:47:36','2023-09-30 09:17:36','2023-10-02 11:13:49',1,'LenovoLp'),('2023-09-30 03:47:36','2023-09-30 09:17:36','2023-10-02 11:19:29',1,'1_LenovoLp');
/*!40000 ALTER TABLE `heartbeat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (1,'uploads\\image_1697364205154.jpg'),(2,'uploads\\image_1697364205242.jpg');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `stock` float NOT NULL,
  `status` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Oppo 15','Mobile',15,'InActive','2025-01-09 15:29:11','2025-01-09 16:34:55'),(2,'vivo T3 Lite 5G','Experience unparalleled 5G speeds for instant media access and smooth online gaming. Powered by a cutting-edge processor, enjoy seamless gaming, expansive connectivity, and smooth performance. Capture stunning photos with a 50 MP Sony AI main camera and enhance portraits with bokeh effects. With 6 GB RAM + 6 GB Extended RAM, multitask effortlessly. The 90 Hz High Brightness display brings vivid visuals to life. An upgraded battery offers extended playtime, while IP64 Dust and Water Resistance ensures durability. Portrait mode provides various styles for personalized shots. The Funtouch 14 OS offers customization and enhanced image security, keeping your photos private in a secure vault.',155,'Active','2025-01-09 16:29:53','2025-01-09 16:29:53');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-10 22:41:18
