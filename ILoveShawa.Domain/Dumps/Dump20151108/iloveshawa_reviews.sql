CREATE DATABASE  IF NOT EXISTS `iloveshawa` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `iloveshawa`;
-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: localhost    Database: iloveshawa
-- ------------------------------------------------------
-- Server version	5.6.27-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` longtext NOT NULL,
  `positive` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `IX_fk_review_shawarma_shop1` (`shop_id`),
  KEY `IX_fk_review_user1` (`user_id`),
  CONSTRAINT `fk_review_shawarma_shop1` FOREIGN KEY (`shop_id`) REFERENCES `shawashops` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_review_user1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (1,'«Очень странная и необычная форма — почему-то шаверма квадратная. Лаваш больше похож на лепешку, чем на настоящий армянский лаваш. Не очень вкусно. Он сухой, холодный и не хрустящий. Я считаю, что одна из самых важных вещей — это хлеб, который ты используешь. Хороший вполне можно найти в супермаркете». Оценка: 5 из 10',1,5,1),(2,'«Не знал, что шаверма с сыром вообще существует. Первый раз такое вижу. Нормальная цена — сто рублей, столько она и должна стоить. Опять этот лаваш, который мне не нравится, и его очень много — три слоя. Но здесь он хотя бы хрустящий. Мясо значительно лучше, чем в прошлом месте, на Литейном. Качественно промариновано, есть специи. Не так уж плохо, хорошая шаверма». Оценка: 6 из 10',1,5,2),(3,'«Мясо слишком белое, значит, недостаточно прожарено. Температура гриля должна быть выше. Наконец-то правильный лаваш: достаточно тонкий. Слишком мало курицы — всего три кусочка, все остальное — огурцы и салат. Я заказал шаверму с курицей, а не с овощами, это какой-то вегетарианский вариант. Хотя со вкусом все окей. ',1,5,3),(4,'«Это ненастоящая шаверменная, а какой-то гриль-бар. Сама шаверма слишком жирная. Несмотря на то, что лаваш хрустящий, кажется, будто ешь муку. Мясо сухое. Вообще мне не нравится его запах, оно как будто несвежее. Я не хочу это есть, правда. Невкусно и некрасиво. И здесь опасно». Оценка: 3 из 10 ',0,5,4),(5,'«Порция больше, чем где-либо. Но мне не нравятся эти овощи. Они не очень свежие, как будто их нарезали вчера. В лаваше много масла — выглядит, как картошка с селедкой. И еще, на нём есть черные точки, значит он не очень свежий. Но мясо вкусное, есть специи. И все же не могу оценить это место выше, чем другие». Оценка: 6 из 10',1,5,5);
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-08 22:10:08
