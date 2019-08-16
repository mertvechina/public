CREATE DATABASE  IF NOT EXISTS `test` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `test`;
-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: test
-- ------------------------------------------------------
-- Server version	5.7.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(11) NOT NULL,
  `text` varchar(255) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  `expired_at` int(11) NOT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`message_id`),
  UNIQUE KEY `message_id_UNIQUE` (`message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=566 DEFAULT CHARSET=utf8 COMMENT='все комментарии чата';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,1,'ARHIP','rgara gar gaer g',0,1565685821,1565682221,1565682221),(5,1,'ARHIP','sthst hstrh trsh srt',0,1565685872,1565682272,1565682272),(6,1,'ARHIP','strh rth ntrs;h tsrh \n',0,1565685878,1565682278,1565682278),(7,1,'ARHIP','strh r;sthnj ;orstnh ;ntrs;kh rst',0,1565685880,1565682280,1565682280),(8,1,'ARHIP','ыкелпт трлыект ртыке рюждлеык',0,1565687319,1565683719,1565683719),(9,1,'ARHIP','укп фкп фкуп фукп фукпфук пфукп',0,1565687349,1565683749,1565683749),(10,1,'ARHIP','ara gaer gaergaerg',0,1565687398,1565683798,1565683798),(11,1,'ARHIP','arg arg argareg',0,1565687407,1565683807,1565683807),(12,1,'ARHIP','are aerg aergaer gaerg ear',0,1565687430,1565683830,1565683830),(13,1,'ARHIP','rgrs gaerg earg era g',0,1565687569,1565683969,1565683969),(14,1,'ARHIP','rtg rnth lrtmh; mrt;lhm ;rtmh; r',0,1565688099,1565684499,1565684499),(15,1,'ARHIP','erg re ger ger ger',0,1565688145,1565684545,1565684545),(16,1,'ARHIP','srt shsr thtsrhsrth',0,1565688350,1565684750,1565684750),(17,1,'ARHIP','aregaer gaer gaerg a',0,1565688443,1565684843,1565684843),(18,1,'ARHIP','afgearg aerg earg aerg aer g',0,1565688620,1565685020,1565685020),(19,1,'ARHIP','reg rgaerg aerg aerg ear g',0,1565692028,1565688428,1565688428),(20,1,'ARHIP','srtgsrt hstrhrsthstrh',0,1565692058,1565688458,1565688458),(21,1,'ARHIP','sfsfsdf sdf sd',0,1565692164,1565688564,1565688564),(22,1,'ARHIP','erger',0,1565692209,1565688609,1565688609),(23,2,'ARHIP1','eargregrth',0,1565693292,1565689692,1565689692),(24,2,'ARHIP1','ststh strh',0,1565699631,1565696031,1565696031),(25,2,'ARHIP1','',0,1565699631,1565696031,1565696031),(26,2,'ARHIP1','',0,1565699632,1565696032,1565696032),(27,2,'ARHIP1','strhstrh',0,1565699633,1565696033,1565696033),(28,2,'ARHIP1','strhstrh',0,1565699635,1565696035,1565696035),(29,2,'ARHIP1','srthstrh',0,1565699636,1565696036,1565696036),(30,2,'ARHIP1','strhsrth',0,1565699637,1565696037,1565696037),(31,2,'ARHIP1','strhstrhsr',0,1565699638,1565696038,1565696038),(32,2,'ARHIP1','srthstrh',0,1565699639,1565696039,1565696039),(33,2,'ARHIP1','srthsrth',0,1565699641,1565696041,1565696041),(34,2,'ARHIP1','hrsthstrh',0,1565699642,1565696042,1565696042),(35,2,'ARHIP1','tsrhsrth',0,1565699643,1565696043,1565696043),(36,1,'ARHIP','message 0',0,1565700876,1565697276,1565697276),(37,1,'ARHIP','message 1',0,1565700876,1565697276,1565697276),(38,1,'ARHIP','message 2',0,1565700876,1565697276,1565697276),(39,1,'ARHIP','message 3',0,1565700876,1565697276,1565697276),(40,1,'ARHIP','message 4',0,1565700876,1565697276,1565697276),(41,1,'ARHIP','message 5',0,1565700876,1565697276,1565697276),(42,1,'ARHIP','message 6',0,1565700876,1565697276,1565697276),(43,1,'ARHIP','message 7',0,1565700876,1565697276,1565697276),(44,1,'ARHIP','message 8',0,1565700876,1565697276,1565697276),(45,1,'ARHIP','message 9',0,1565700876,1565697276,1565697276),(46,1,'ARHIP','message 10',0,1565700876,1565697276,1565697276),(47,1,'ARHIP','message 11',0,1565700876,1565697276,1565697276),(48,1,'ARHIP','message 12',0,1565700876,1565697276,1565697276),(49,1,'ARHIP','message 13',0,1565700876,1565697276,1565697276),(50,1,'ARHIP','message 14',0,1565700876,1565697276,1565697276),(51,1,'ARHIP','message 15',0,1565700876,1565697276,1565697276),(52,1,'ARHIP','message 16',0,1565700876,1565697276,1565697276),(53,1,'ARHIP','message 17',0,1565700876,1565697276,1565697276),(54,1,'ARHIP','message 18',0,1565700876,1565697276,1565697276),(55,1,'ARHIP','message 19',0,1565700876,1565697276,1565697276),(56,1,'ARHIP','message 20',0,1565700876,1565697276,1565697276),(57,1,'ARHIP','message 21',0,1565700876,1565697276,1565697276),(58,1,'ARHIP','message 22',0,1565700876,1565697276,1565697276),(59,1,'ARHIP','message 23',0,1565700876,1565697276,1565697276),(60,1,'ARHIP','message 24',0,1565700876,1565697276,1565697276),(61,1,'ARHIP','message 25',0,1565700876,1565697276,1565697276),(62,1,'ARHIP','message 26',0,1565700876,1565697276,1565697276),(63,1,'ARHIP','message 27',0,1565700876,1565697276,1565697276),(64,1,'ARHIP','message 28',0,1565700876,1565697276,1565697276),(65,1,'ARHIP','message 29',0,1565700876,1565697276,1565697276),(66,1,'ARHIP','message 0',0,1565700937,1565697337,1565697337),(67,1,'ARHIP','message 1',0,1565700937,1565697337,1565697337),(68,1,'ARHIP','message 2',0,1565700937,1565697337,1565697337),(69,1,'ARHIP','message 3',0,1565700937,1565697337,1565697337),(70,1,'ARHIP','message 4',0,1565700937,1565697337,1565697337),(71,1,'ARHIP','message 5',0,1565700937,1565697337,1565697337),(72,1,'ARHIP','message 6',0,1565700937,1565697337,1565697337),(73,1,'ARHIP','message 7',0,1565700937,1565697337,1565697337),(74,1,'ARHIP','message 8',0,1565700937,1565697337,1565697337),(75,1,'ARHIP','message 9',0,1565700937,1565697337,1565697337),(76,1,'ARHIP','message 10',0,1565700937,1565697337,1565697337),(77,1,'ARHIP','message 11',0,1565700937,1565697337,1565697337),(78,1,'ARHIP','message 12',0,1565700937,1565697337,1565697337),(79,1,'ARHIP','message 13',0,1565700937,1565697337,1565697337),(80,1,'ARHIP','message 14',0,1565700937,1565697337,1565697337),(81,1,'ARHIP','message 15',0,1565700937,1565697337,1565697337),(82,1,'ARHIP','message 16',0,1565700937,1565697337,1565697337),(83,1,'ARHIP','message 17',0,1565700937,1565697337,1565697337),(84,1,'ARHIP','message 18',0,1565700937,1565697337,1565697337),(85,1,'ARHIP','message 19',0,1565700937,1565697337,1565697337),(86,1,'ARHIP','message 20',0,1565700937,1565697337,1565697337),(87,1,'ARHIP','message 21',0,1565700937,1565697337,1565697337),(88,1,'ARHIP','message 22',0,1565700938,1565697338,1565697338),(89,1,'ARHIP','message 23',0,1565700938,1565697338,1565697338),(90,1,'ARHIP','message 24',0,1565700938,1565697338,1565697338),(91,1,'ARHIP','message 25',0,1565700938,1565697338,1565697338),(92,1,'ARHIP','message 26',0,1565700938,1565697338,1565697338),(93,1,'ARHIP','message 27',0,1565700938,1565697338,1565697338),(94,1,'ARHIP','message 28',0,1565700938,1565697338,1565697338),(95,1,'ARHIP','message 29',0,1565700938,1565697338,1565697338),(96,2,'ARHIP1','snsrth srhn srnh;srt',0,1565728661,1565725061,1565725061),(97,2,'ARHIP1','aergearg aegaer gaer',0,1565728712,1565725112,1565725112),(98,2,'ARHIP1','arg earg aerg aega er',0,1565728719,1565725119,1565725119),(99,2,'ARHIP1','aerg aerg aerg',0,1565729041,1565725441,1565725441),(100,2,'ARHIP1','srthtrsh',0,1565729072,1565725472,1565725472),(101,2,'ARHIP1','1',0,1565729143,1565725543,1565725543),(102,2,'ARHIP1','2',0,1565729155,1565725555,1565725555),(103,2,'ARHIP1','3',0,1565729163,1565725563,1565725563),(104,2,'ARHIP1','4',0,1565729193,1565725593,1565725593),(105,2,'ARHIP1','5',0,1565729205,1565725605,1565725605),(106,2,'ARHIP1','6',0,1565729231,1565725631,1565725631),(107,2,'ARHIP1','7',0,1565729256,1565725656,1565725656),(108,2,'ARHIP1','8',0,1565729310,1565725710,1565725710),(109,2,'ARHIP1','9',0,1565729357,1565725757,1565725757),(110,2,'ARHIP1','10',0,1565729405,1565725805,1565725805),(111,2,'ARHIP1','11',0,1565729436,1565725836,1565725836),(112,2,'ARHIP1','12',0,1565729657,1565726057,1565726057),(113,1,'ARHIP','wefwefwef',0,1565771966,1565768366,1565768366),(114,1,'ARHIP','regreg',0,1565772034,1565768434,1565768434),(115,1,'ARHIP','1',0,1565772089,1565768489,1565768489),(116,1,'ARHIP','2',0,1565772096,1565768496,1565768496),(117,1,'ARHIP','3',0,1565772114,1565768514,1565768514),(118,1,'ARHIP','4',0,1565772118,1565768518,1565768518),(119,1,'ARHIP','5',0,1565772210,1565768610,1565768610),(120,1,'ARHIP','6',0,1565772214,1565768614,1565768614),(121,1,'ARHIP','7',0,1565772268,1565768668,1565768668),(122,1,'ARHIP','8',0,1565772273,1565768673,1565768673),(123,1,'ARHIP','9',0,1565772288,1565768688,1565768688),(124,1,'ARHIP','10',0,1565772416,1565768816,1565768816),(125,1,'ARHIP','1',0,1565772696,1565769096,1565769096),(126,1,'ARHIP','2',0,1565773109,1565769509,1565769509),(127,1,'ARHIP','3',0,1565773339,1565769739,1565769739),(128,1,'ARHIP','4',0,1565773648,1565770048,1565770048),(129,1,'ARHIP','5',0,1565773838,1565770238,1565770238),(130,1,'ARHIP','6',0,1565774273,1565770673,1565770673),(131,1,'ARHIP','7',0,1565774290,1565770690,1565770690),(132,1,'ARHIP','8',0,1565774323,1565770723,1565770723),(133,1,'ARHIP','9',0,1565774427,1565770827,1565770827),(134,1,'ARHIP','10',0,1565774562,1565770962,1565770962),(135,1,'ARHIP','11',0,1565774585,1565770985,1565770985),(136,1,'ARHIP','12',0,1565774627,1565771027,1565771027),(137,1,'ARHIP','13',0,1565774651,1565771051,1565771051),(138,1,'ARHIP','14',0,1565774744,1565771144,1565771144),(139,1,'ARHIP','15',0,1565774807,1565771207,1565771207),(140,1,'ARHIP','16',0,1565774946,1565771346,1565771346),(141,1,'ARHIP','17',0,1565775004,1565771404,1565771404),(142,1,'ARHIP','18',0,1565775034,1565771434,1565771434),(143,1,'ARHIP','1',0,1565775099,1565771499,1565771499),(144,1,'ARHIP','2',0,1565775138,1565771538,1565771538),(145,1,'ARHIP','3',0,1565775196,1565771596,1565771596),(146,1,'ARHIP','4',0,1565775256,1565771656,1565771656),(147,1,'ARHIP','5',0,1565775368,1565771768,1565771768),(148,1,'ARHIP','6',0,1565775442,1565771842,1565771842),(149,1,'ARHIP','7',0,1565775495,1565771895,1565771895),(150,1,'ARHIP','8',0,1565775568,1565771968,1565771968),(151,1,'ARHIP','9',0,1565775619,1565772019,1565772019),(152,1,'ARHIP','10',0,1565775671,1565772071,1565772071),(153,1,'ARHIP','11',0,1565775731,1565772131,1565772131),(154,1,'ARHIP','12',0,1565775766,1565772166,1565772166),(155,1,'ARHIP','13',0,1565775820,1565772220,1565772220),(156,1,'ARHIP','14',0,1565775855,1565772255,1565772255),(157,1,'ARHIP','1',0,1565775932,1565772332,1565772332),(158,1,'ARHIP','2',0,1565775968,1565772368,1565772368),(159,1,'ARHIP','3',0,1565776015,1565772415,1565772415),(160,1,'ARHIP','4',0,1565776052,1565772452,1565772452),(161,1,'ARHIP','5',0,1565776085,1565772485,1565772485),(162,1,'ARHIP','1',0,1565776098,1565772498,1565772498),(163,1,'ARHIP','2',0,1565776188,1565772588,1565772588),(164,1,'ARHIP','3',0,1565776212,1565772612,1565772612),(165,1,'ARHIP','4',0,1565776230,1565772630,1565772630),(166,1,'ARHIP','5',0,1565776265,1565772665,1565772665),(167,1,'ARHIP','1',0,1565776283,1565772683,1565772683),(168,1,'ARHIP','2',0,1565776416,1565772816,1565772816),(169,1,'ARHIP','3',0,1565776441,1565772841,1565772841),(170,1,'ARHIP','4',0,1565776477,1565772877,1565772877),(171,1,'ARHIP','5',0,1565776925,1565773325,1565773325),(172,1,'ARHIP','11111',0,1565776942,1565773342,1565773342),(173,1,'ARHIP','1',0,1565776952,1565773352,1565773352),(174,1,'ARHIP','2',0,1565776988,1565773388,1565773388),(175,1,'ARHIP','3',0,1565777070,1565773470,1565773470),(176,1,'ARHIP','4',0,1565777076,1565773476,1565773476),(177,1,'ARHIP','5',0,1565777083,1565773483,1565773483),(178,1,'ARHIP','6',0,1565777167,1565773567,1565773567),(179,1,'ARHIP','7',0,1565777184,1565773584,1565773584),(180,1,'ARHIP','8',0,1565777249,1565773649,1565773649),(181,1,'ARHIP','9',0,1565777270,1565773670,1565773670),(182,1,'ARHIP','1',0,1565782509,1565778909,1565778909),(183,1,'ARHIP','2',0,1565782713,1565779113,1565779113),(184,1,'ARHIP','3',0,1565782737,1565779137,1565779137),(185,1,'ARHIP','4',0,1565783036,1565779436,1565779436),(186,1,'ARHIP','5',0,1565783103,1565779503,1565779503),(187,1,'ARHIP','6',0,1565783111,1565779511,1565779511),(188,1,'ARHIP','7',0,1565783125,1565779525,1565779525),(189,1,'ARHIP','8',0,1565783137,1565779537,1565779537),(190,1,'ARHIP','1',0,1565786919,1565783319,1565783319),(191,1,'ARHIP','2',0,1565786943,1565783343,1565783343),(192,1,'ARHIP','3',0,1565787134,1565783534,1565783534),(193,1,'ARHIP','4',0,1565787507,1565783907,1565783907),(194,1,'ARHIP','1',0,1565787566,1565783966,1565783966),(195,1,'ARHIP','2',0,1565787569,1565783969,1565783969),(196,1,'ARHIP','3',0,1565787607,1565784007,1565784007),(197,1,'ARHIP','4',0,1565787638,1565784038,1565784038),(198,1,'ARHIP','1',0,1565787693,1565784093,1565784093),(199,1,'ARHIP','2',0,1565787717,1565784117,1565784117),(200,1,'ARHIP','3',0,1565787731,1565784131,1565784131),(201,1,'ARHIP','4',0,1565787752,1565784152,1565784152),(202,1,'ARHIP','1',0,1565787836,1565784236,1565784236),(203,1,'ARHIP','2',0,1565787907,1565784307,1565784307),(204,1,'ARHIP','1',0,1565788005,1565784405,1565784405),(205,1,'ARHIP','2',0,1565788189,1565784589,1565784589),(206,1,'ARHIP','3',0,1565788246,1565784646,1565784646),(207,1,'ARHIP','4',0,1565788280,1565784680,1565784680),(208,1,'ARHIP','1',0,1565788345,1565784745,1565784745),(209,1,'ARHIP','2',0,1565788366,1565784766,1565784766),(210,1,'ARHIP','3',0,1565788399,1565784799,1565784799),(211,1,'ARHIP','1',0,1565788421,1565784821,1565784821),(212,1,'ARHIP','2',0,1565788790,1565785190,1565785190),(213,1,'ARHIP','3',0,1565788806,1565785206,1565785206),(214,1,'ARHIP','4',0,1565788889,1565785289,1565785289),(215,1,'ARHIP','1',0,1565788946,1565785346,1565785346),(216,1,'ARHIP','2',0,1565788966,1565785366,1565785366),(217,1,'ARHIP','3',0,1565788993,1565785393,1565785393),(218,1,'ARHIP','1',0,1565789027,1565785427,1565785427),(219,1,'ARHIP','12',0,1565789054,1565785454,1565785454),(220,1,'ARHIP','3',0,1565789060,1565785460,1565785460),(221,1,'ARHIP','2',0,1565789103,1565785503,1565785503),(222,1,'ARHIP','3',0,1565789155,1565785555,1565785555),(223,1,'ARHIP','4',0,1565789337,1565785737,1565785737),(224,1,'ARHIP','1',0,1565789385,1565785785,1565785785),(225,1,'ARHIP','2',0,1565789425,1565785825,1565785825),(226,1,'ARHIP','3',0,1565789509,1565785909,1565785909),(227,1,'ARHIP','1',0,1565789560,1565785960,1565785960),(228,1,'ARHIP','2',0,1565789578,1565785978,1565785978),(229,1,'ARHIP','3',0,1565789685,1565786085,1565786085),(230,1,'ARHIP','2',0,1565789750,1565786150,1565786150),(231,1,'ARHIP','1',0,1565789777,1565786177,1565786177),(232,1,'ARHIP','2',0,1565789818,1565786218,1565786218),(233,1,'ARHIP','3',0,1565789911,1565786311,1565786311),(234,1,'ARHIP','1',0,1565789953,1565786353,1565786353),(235,1,'ARHIP','2',0,1565789993,1565786393,1565786393),(236,1,'ARHIP','3',0,1565800537,1565796937,1565796937),(237,1,'ARHIP','1',0,1565800825,1565797225,1565797225),(238,1,'ARHIP','2',0,1565800836,1565797236,1565797236),(239,1,'ARHIP','1',0,1565800866,1565797266,1565797266),(240,1,'ARHIP','2',0,1565801009,1565797409,1565797409),(241,1,'ARHIP','1',0,1565801086,1565797486,1565797486),(242,1,'ARHIP','3',0,1565801156,1565797556,1565797556),(243,1,'ARHIP','4',0,1565801354,1565797754,1565797754),(244,1,'ARHIP','5',0,1565803448,1565799848,1565799848),(245,1,'ARHIP','\nwefewfewf',0,1565803454,1565799854,1565799854),(246,1,'ARHIP','123',0,1565803504,1565799904,1565799904),(247,1,'ARHIP','321',0,1565803513,1565799913,1565799913),(248,1,'ARHIP','\nefesarg',0,1565803517,1565799917,1565799917),(249,1,'ARHIP','\naergae',0,1565803519,1565799919,1565799919),(250,1,'ARHIP','3',0,1565803904,1565800304,1565800304),(251,1,'ARHIP','\n2',0,1565803905,1565800305,1565800305),(252,1,'ARHIP','\n1',0,1565803906,1565800306,1565800306),(253,1,'ARHIP','2',0,1565804600,1565801000,1565801000),(254,1,'ARHIP','2\n3',0,1565804603,1565801003,1565801003),(255,1,'ARHIP','3',0,1565804632,1565801032,1565801032),(256,1,'ARHIP','\n2',0,1565804635,1565801035,1565801035),(257,1,'ARHIP','4',0,1565804643,1565801043,1565801043),(258,1,'ARHIP',' \n2',0,1565804645,1565801045,1565801045),(259,1,'ARHIP',' 1',0,1565804648,1565801048,1565801048),(260,1,'ARHIP','123',0,1565804658,1565801058,1565801058),(261,1,'ARHIP','3',0,1565804665,1565801065,1565801065),(262,1,'ARHIP','123',0,1565804666,1565801066,1565801066),(263,1,'ARHIP','1',0,1565804996,1565801396,1565801396),(264,1,'ARHIP','ewfwef ewf ew fewf eaf',0,1565805039,1565801439,1565801439),(265,2,'ARHIP1','123',0,1565805156,1565801556,1565801556),(266,2,'ARHIP1','321',0,1565805240,1565801640,1565801640),(267,2,'ARHIP1','aregaerng;n aerng laernl/ n/are hg',0,1565805264,1565801664,1565801664),(268,2,'ARHIP1',',areglaeng;enarg /m/aergAREg,ARE,g:a',0,1565805271,1565801671,1565801671),(269,2,'ARHIP1','aerkg l/earkm glereragmeagm',0,1565805279,1565801679,1565801679),(270,2,'ARHIP1',';',0,1565805281,1565801681,1565801681),(271,2,'ARHIP1','[',0,1565805310,1565801710,1565801710),(272,2,'ARHIP1',']',0,1565805312,1565801712,1565801712),(273,2,'ARHIP1','{',0,1565805313,1565801713,1565801713),(274,2,'ARHIP1','}',0,1565805314,1565801714,1565801714),(275,2,'ARHIP1',':',0,1565805315,1565801715,1565801715),(276,2,'ARHIP1','\"',0,1565805316,1565801716,1565801716),(277,2,'ARHIP1','>',0,1565805318,1565801718,1565801718),(278,2,'ARHIP1','<',0,1565805319,1565801719,1565801719),(279,2,'ARHIP1',',',0,1565805320,1565801720,1565801720),(280,2,'ARHIP1','/',0,1565805322,1565801722,1565801722),(281,2,'ARHIP1','`',0,1565805326,1565801726,1565801726),(282,2,'ARHIP1','~',0,1565805328,1565801728,1565801728),(283,2,'ARHIP1','@',0,1565805339,1565801739,1565801739),(284,2,'ARHIP1','!',0,1565805340,1565801740,1565801740),(285,2,'ARHIP1','\"',0,1565805347,1565801747,1565801747),(286,2,'ARHIP1','^',0,1565805350,1565801750,1565801750),(287,2,'ARHIP1','&',0,1565805354,1565801754,1565801754),(288,2,'ARHIP1','123',0,1565805448,1565801848,1565801848),(289,2,'ARHIP1','1',0,1565805710,1565802110,1565802110),(290,2,'ARHIP1','  ',0,1565805817,1565802217,1565802217),(291,2,'ARHIP1','       3',0,1565805830,1565802230,1565802230),(292,2,'ARHIP1','                 5',0,1565805855,1565802255,1565802255),(293,2,'ARHIP1','      1',0,1565805882,1565802282,1565802282),(294,2,'ARHIP1','       3',0,1565805904,1565802304,1565802304),(295,2,'ARHIP1','       2',0,1565805918,1565802318,1565802318),(296,2,'ARHIP1','         2',0,1565805951,1565802351,1565802351),(297,2,'ARHIP1','                 1',0,1565805990,1565802390,1565802390),(298,2,'ARHIP1','           2',0,1565806001,1565802401,1565802401),(299,2,'ARHIP1','123',0,1565806597,1565802997,1565802997),(300,2,'ARHIP1','         13',0,1565806601,1565803001,1565803001),(301,2,'ARHIP1','       12321                 12         3',0,1565806735,1565803135,1565803135),(302,2,'ARHIP1','      23    12      1           2',0,1565806774,1565803174,1565803174),(303,2,'ARHIP1','        23       21      12  21      ',0,1565806799,1565803199,1565803199),(304,2,'ARHIP1','21 12 2',0,1565806916,1565803316,1565803316),(305,2,'ARHIP1','123',0,1565809342,1565805742,1565805742),(306,1,'ARHIP','123123',0,1565810025,1565806425,1565806425),(307,1,'ARHIP','321',0,1565810167,1565806567,1565806567),(308,2,'ARHIP1','123',0,1565810175,1565806575,1565806575),(309,2,'ARHIP1','321',0,1565812533,1565838308,1565808933),(310,1,'ARHIP','rtkgnk.nr;khatrh arth arth arh',0,1565872021,1565868421,1565868421),(311,1,'ARHIP','egnf al/enrg areng. nare/n a.rhna/ren hlaren hlknaerlhknerhnkl /ernhlkna reha/ lerknhl/ enrhl/ nerahn laenrh l/earnhl/ near hl/ernak h/earkn h/lenark h/laern/ hnae rkn/le ar',0,1565872306,1565868706,1565868706),(312,1,'ARHIP','agare gaerg',0,1565875407,1565871807,1565871807),(313,1,'ARHIP','earg ea',0,1565875408,1565871808,1565871808),(314,1,'ARHIP','rg ea',0,1565875408,1565871808,1565871808),(315,1,'ARHIP','rg e',0,1565875409,1565871809,1565871809),(316,1,'ARHIP','arg',0,1565875409,1565871809,1565871809),(317,1,'ARHIP','earg',0,1565875409,1565871809,1565871809),(318,1,'ARHIP','er',0,1565875409,1565871809,1565871809),(319,1,'ARHIP','ga ergera',0,1565875410,1565871810,1565871810),(320,1,'ARHIP','g reag',0,1565875410,1565871810,1565871810),(321,1,'ARHIP','earg era',0,1565875411,1565871811,1565871811),(322,1,'ARHIP','gear',0,1565875412,1565871812,1565871812),(323,1,'ARHIP','g ear g',0,1565875412,1565871812,1565871812),(324,1,'ARHIP','aerg ear',0,1565875413,1565871813,1565871813),(325,1,'ARHIP','g earg',0,1565875413,1565871813,1565871813),(326,1,'ARHIP','earg',0,1565875414,1565871814,1565871814),(327,1,'ARHIP','earg ea',0,1565875414,1565871814,1565871814),(328,1,'ARHIP','rg ea',0,1565875415,1565871815,1565871815),(329,1,'ARHIP','r ge',0,1565875415,1565871815,1565871815),(330,1,'ARHIP','ar gea',0,1565875415,1565871815,1565871815),(331,1,'ARHIP','r gear',0,1565875416,1565871816,1565871816),(332,1,'ARHIP','gear',0,1565875417,1565871817,1565871817),(333,2,'ARHIP1','123',0,1565875417,1565871817,1565871817),(334,2,'ARHIP1','321',0,1565875417,1565871817,1565871817),(335,1,'ARHIP','123',0,1565894879,1565891279,1565891279),(336,1,'ARHIP','123',0,1565895080,1565891480,1565891480),(337,1,'ARHIP','321',0,1565895082,1565891482,1565891482),(338,2,'ARHIP1','DONE',0,1565895090,1565891490,1565891490),(339,1,'ARHIP','321',0,1565895090,1565891490,1565891490),(340,1,'ARHIP','123',0,1565895088,1565891488,1565891488),(341,1,'ARHIP','2',0,1565903755,1565900155,1565900155),(342,1,'ARHIP','32',0,1565903800,1565900200,1565900200),(343,1,'ARHIP','321',0,1565903864,1565900264,1565900264),(344,1,'ARHIP','123',0,1565903868,1565900268,1565900268),(345,1,'ARHIP','2',0,1565903872,1565900272,1565900272),(346,1,'ARHIP','321',0,1565903901,1565900301,1565900301),(347,1,'ARHIP','123',0,1565903904,1565900304,1565900304),(348,1,'ARHIP','21',0,1565904156,1565900556,1565900556),(349,1,'ARHIP','123',0,1565904265,1565900665,1565900665),(350,1,'ARHIP','1',0,1565903775,1565900775,1565900775),(351,1,'ARHIP','2',0,1565903870,1565900870,1565900870),(352,1,'ARHIP','3',0,1565903881,1565900881,1565900881),(353,1,'ARHIP','4',0,1565903894,1565900894,1565900894),(354,1,'ARHIP','1',0,1565903974,1565900974,1565900974),(355,1,'ARHIP','2',0,1565903980,1565900980,1565900980),(356,1,'ARHIP','21',0,1565904023,1565901023,1565901023),(357,1,'ARHIP','123',0,1565904144,1565901144,1565901144),(358,1,'ARHIP','321',0,1565904148,1565901148,1565901148),(359,1,'ARHIP','123',0,1565904155,1565901155,1565901155),(360,1,'ARHIP','21',0,1565906709,1565903709,1565903709),(361,1,'ARHIP','321',0,1565950741,1565947741,1565947741),(362,1,'ARHIP','12',0,1565950781,1565947781,1565947781),(363,1,'ARHIP','21',0,1565950786,1565947786,1565947786),(364,1,'ARHIP','21',0,1565950983,1565947983,1565947983),(365,1,'ARHIP','21',0,1565951007,1565948007,1565948007),(366,1,'ARHIP','321',0,1565951019,1565948019,1565948019),(367,1,'ARHIP','21',0,1565951031,1565948031,1565948031),(368,1,'ARHIP','321',0,1565951056,1565948056,1565948056),(369,1,'ARHIP','3211',0,1565951082,1565948082,1565948082),(370,1,'ARHIP','21',0,1565951127,1565948127,1565948127),(371,1,'ARHIP','12',0,1565951136,1565948136,1565948136),(372,1,'ARHIP','321',0,1565951143,1565948143,1565948143),(373,1,'ARHIP','12',0,1565951408,1565948408,1565948408),(374,1,'ARHIP','321',0,1565948872,1565948572,1565948572),(375,1,'ARHIP','21',0,1565950041,1565949741,1565949741),(376,1,'ARHIP','2112',0,1565950538,1565950238,1565950238),(377,1,'ARHIP','12',0,1565950860,1565950560,1565950560),(378,1,'ARHIP','123',0,1565950867,1565950567,1565950567),(379,1,'ARHIP','321',0,1565951210,1565950910,1565950910),(380,1,'ARHIP','1',0,1565951570,1565951270,1565951270),(381,1,'ARHIP','21',0,1565951588,1565951288,1565951288),(382,1,'ARHIP','21',0,1565951896,1565951596,1565951596),(383,1,'ARHIP','1',0,1565952316,1565952016,1565952016),(384,1,'ARHIP','21',0,1565952324,1565952024,1565952024),(385,1,'ARHIP','321',0,1565952447,1565952147,1565952147),(386,1,'ARHIP','32112',0,1565952481,1565952181,1565952181),(387,1,'ARHIP','123123',0,1565955893,1565955593,1565955593),(388,1,'ARHIP','21',0,1565955896,1565955596,1565955596),(389,1,'ARHIP','123213',0,1565955912,1565955612,1565955612),(390,1,'ARHIP','123',0,1565955934,1565955634,1565955634),(391,1,'ARHIP','321',0,1565955957,1565955657,1565955657),(392,1,'ARHIP','12',0,1565955969,1565955669,1565955669),(393,1,'ARHIP','21',0,1565956039,1565955739,1565955739),(394,1,'ARHIP','321',0,1565956042,1565955742,1565955742),(395,1,'ARHIP','12',0,1565956077,1565955777,1565955777),(396,1,'ARHIP','21',0,1565956080,1565955780,1565955780),(397,1,'ARHIP','12',0,1565956083,1565955783,1565955783),(398,1,'ARHIP','123',0,1565956104,1565955804,1565955804),(399,1,'ARHIP','21',0,1565956107,1565955807,1565955807),(400,1,'ARHIP','123',0,1565956197,1565955897,1565955897),(401,1,'ARHIP','1233',0,1565956636,1565956336,1565956336),(402,1,'ARHIP','21',0,1565956637,1565956337,1565956337),(403,2,'ARHIP1','NEW MESSAGE',0,1565956637,1565956337,1565956337),(404,1,'ARHIP','s;mh;sth',0,1565956950,1565956650,1565956650),(405,1,'ARHIP','strhsrt',0,1565956951,1565956651,1565956651),(406,1,'ARHIP','hrtsh',0,1565956952,1565956652,1565956652),(407,1,'ARHIP','rsth',0,1565956952,1565956652,1565956652),(408,1,'ARHIP','rsth',0,1565956952,1565956652,1565956652),(409,1,'ARHIP','rtsh',0,1565956953,1565956653,1565956653),(410,1,'ARHIP','rtsh',0,1565956953,1565956653,1565956653),(411,1,'ARHIP','rtsh',0,1565956953,1565956653,1565956653),(412,1,'ARHIP','rtsh',0,1565956954,1565956654,1565956654),(413,1,'ARHIP','rts',0,1565956954,1565956654,1565956654),(414,1,'ARHIP','htr',0,1565956954,1565956654,1565956654),(415,1,'ARHIP','shrts',0,1565956955,1565956655,1565956655),(416,1,'ARHIP','rst',0,1565956955,1565956655,1565956655),(417,1,'ARHIP','jrtj',0,1565956956,1565956656,1565956656),(418,1,'ARHIP','rtj',0,1565956956,1565956656,1565956656),(419,1,'ARHIP','rtsj',0,1565956956,1565956656,1565956656),(420,1,'ARHIP','rtsj',0,1565956957,1565956657,1565956657),(421,1,'ARHIP','trsj',0,1565956957,1565956657,1565956657),(422,1,'ARHIP','rtj',0,1565956958,1565956658,1565956658),(423,1,'ARHIP','rstj',0,1565956958,1565956658,1565956658),(424,1,'ARHIP','rtsj',0,1565956958,1565956658,1565956658),(425,1,'ARHIP','rstj',0,1565956959,1565956659,1565956659),(426,1,'ARHIP','rtj',0,1565956959,1565956659,1565956659),(427,1,'ARHIP','jtrs',0,1565956959,1565956659,1565956659),(428,1,'ARHIP','jtrj',0,1565956960,1565956660,1565956660),(429,1,'ARHIP','1231',0,1565957025,1565956725,1565956725),(430,1,'ARHIP','2',0,1565957025,1565956725,1565956725),(431,1,'ARHIP','21',0,1565957025,1565956725,1565956725),(432,1,'ARHIP','3',0,1565957025,1565956725,1565956725),(433,1,'ARHIP','123',0,1565957025,1565956725,1565956725),(434,1,'ARHIP','12',0,1565957026,1565956726,1565956726),(435,1,'ARHIP','3',0,1565957026,1565956726,1565956726),(436,1,'ARHIP','21',0,1565957026,1565956726,1565956726),(437,1,'ARHIP','3',0,1565957026,1565956726,1565956726),(438,1,'ARHIP','123',0,1565957026,1565956726,1565956726),(439,1,'ARHIP','123',0,1565957027,1565956727,1565956727),(440,1,'ARHIP','21',0,1565957027,1565956727,1565956727),(441,1,'ARHIP','3',0,1565957027,1565956727,1565956727),(442,1,'ARHIP','12',0,1565957027,1565956727,1565956727),(443,1,'ARHIP','3',0,1565957027,1565956727,1565956727),(444,1,'ARHIP','123',0,1565957028,1565956728,1565956728),(445,1,'ARHIP','1',0,1565957028,1565956728,1565956728),(446,1,'ARHIP','23',0,1565957028,1565956728,1565956728),(447,1,'ARHIP','12',0,1565957028,1565956728,1565956728),(448,1,'ARHIP','3',0,1565957028,1565956728,1565956728),(449,1,'ARHIP','1',0,1565957029,1565956729,1565956729),(450,1,'ARHIP','23',0,1565957029,1565956729,1565956729),(451,1,'ARHIP','123',0,1565957029,1565956729,1565956729),(452,1,'ARHIP','21',0,1565957029,1565956729,1565956729),(453,1,'ARHIP','3',0,1565957029,1565956729,1565956729),(454,1,'ARHIP','123',0,1565957030,1565956730,1565956730),(455,1,'ARHIP','12',0,1565957030,1565956730,1565956730),(456,2,'ARHIP1','NEW MESSAGE',0,1565957030,1565956730,1565956730),(457,1,'ARHIP','wefe',0,1565957265,1565956965,1565956965),(458,1,'ARHIP','few',0,1565957266,1565956966,1565956966),(459,1,'ARHIP','few',0,1565957266,1565956966,1565956966),(460,1,'ARHIP','fwe',0,1565957266,1565956966,1565956966),(461,1,'ARHIP','few',0,1565957267,1565956967,1565956967),(462,1,'ARHIP','f',0,1565957267,1565956967,1565956967),(463,1,'ARHIP','ewf',0,1565957267,1565956967,1565956967),(464,1,'ARHIP','ew',0,1565957267,1565956967,1565956967),(465,1,'ARHIP','f',0,1565957268,1565956968,1565956968),(466,1,'ARHIP','ew',0,1565957268,1565956968,1565956968),(467,1,'ARHIP','f',0,1565957268,1565956968,1565956968),(468,1,'ARHIP','ew f',0,1565957268,1565956968,1565956968),(469,1,'ARHIP','we',0,1565957268,1565956968,1565956968),(470,1,'ARHIP','f',0,1565957269,1565956969,1565956969),(471,1,'ARHIP','ew',0,1565957272,1565956972,1565956972),(472,1,'ARHIP','wef',0,1565957273,1565956973,1565956973),(473,1,'ARHIP','wef',0,1565957273,1565956973,1565956973),(474,1,'ARHIP','ewf',0,1565957274,1565956974,1565956974),(475,1,'ARHIP','ewf',0,1565957274,1565956974,1565956974),(476,1,'ARHIP','wef',0,1565957275,1565956975,1565956975),(477,1,'ARHIP','wef',0,1565957277,1565956977,1565956977),(478,1,'ARHIP','ew',0,1565957280,1565956980,1565956980),(479,1,'ARHIP','few',0,1565957280,1565956980,1565956980),(480,1,'ARHIP','few',0,1565957280,1565956980,1565956980),(481,1,'ARHIP','f',0,1565957280,1565956980,1565956980),(482,1,'ARHIP','ewf',0,1565957280,1565956980,1565956980),(483,1,'ARHIP','ew',0,1565957281,1565956981,1565956981),(484,1,'ARHIP','f',0,1565957281,1565956981,1565956981),(485,1,'ARHIP','ew',0,1565957281,1565956981,1565956981),(486,1,'ARHIP','f',0,1565957281,1565956981,1565956981),(487,1,'ARHIP','ewf',0,1565957281,1565956981,1565956981),(488,1,'ARHIP','ew',0,1565957281,1565956981,1565956981),(489,1,'ARHIP','f',0,1565957282,1565956982,1565956982),(490,1,'ARHIP','ew',0,1565957282,1565956982,1565956982),(491,1,'ARHIP','f',0,1565957282,1565956982,1565956982),(492,1,'ARHIP','wef',0,1565957282,1565956982,1565956982),(493,1,'ARHIP','wef',0,1565957286,1565956986,1565956986),(494,1,'ARHIP','ewf',0,1565957286,1565956986,1565956986),(495,1,'ARHIP','wef',0,1565957287,1565956987,1565956987),(496,1,'ARHIP','wef',0,1565957287,1565956987,1565956987),(497,1,'ARHIP','wef',0,1565957295,1565956995,1565956995),(498,1,'ARHIP','ewf',0,1565957295,1565956995,1565956995),(499,2,'ARHIP1','NEW MESSAGE',0,1565957295,1565956995,1565956995),(500,1,'ARHIP','ewf',0,1565957492,1565957192,1565957192),(501,1,'ARHIP','ew',0,1565957492,1565957192,1565957192),(502,1,'ARHIP','f',0,1565957492,1565957192,1565957192),(503,1,'ARHIP','ew',0,1565957492,1565957192,1565957192),(504,1,'ARHIP','fw',0,1565957493,1565957193,1565957193),(505,1,'ARHIP','ef',0,1565957493,1565957193,1565957193),(506,1,'ARHIP','ew',0,1565957493,1565957193,1565957193),(507,1,'ARHIP','f',0,1565957493,1565957193,1565957193),(508,1,'ARHIP','ew',0,1565957493,1565957193,1565957193),(509,1,'ARHIP','f',0,1565957493,1565957193,1565957193),(510,1,'ARHIP','ew',0,1565957493,1565957193,1565957193),(511,1,'ARHIP','f',0,1565957494,1565957194,1565957194),(512,1,'ARHIP','we',0,1565957494,1565957194,1565957194),(513,1,'ARHIP','fwe',0,1565957494,1565957194,1565957194),(514,1,'ARHIP','f',0,1565957494,1565957194,1565957194),(515,1,'ARHIP','we',0,1565957494,1565957194,1565957194),(516,1,'ARHIP','f',0,1565957494,1565957194,1565957194),(517,1,'ARHIP','we',0,1565957494,1565957194,1565957194),(518,1,'ARHIP','f',0,1565957495,1565957195,1565957195),(519,1,'ARHIP','ew',0,1565957495,1565957195,1565957195),(520,1,'ARHIP','f',0,1565957495,1565957195,1565957195),(521,1,'ARHIP','ew',0,1565957495,1565957195,1565957195),(522,1,'ARHIP','f',0,1565957495,1565957195,1565957195),(523,1,'ARHIP','ewew',0,1565957497,1565957197,1565957197),(524,1,'ARHIP','f',0,1565957497,1565957197,1565957197),(525,1,'ARHIP','ew',0,1565957497,1565957197,1565957197),(526,1,'ARHIP','f',0,1565957497,1565957197,1565957197),(527,1,'ARHIP','ew',0,1565957497,1565957197,1565957197),(528,1,'ARHIP','f',0,1565957497,1565957197,1565957197),(529,1,'ARHIP','ew',0,1565957498,1565957198,1565957198),(530,1,'ARHIP','f',0,1565957498,1565957198,1565957198),(531,1,'ARHIP','ewf',0,1565957498,1565957198,1565957198),(532,1,'ARHIP','we',0,1565957498,1565957198,1565957198),(533,1,'ARHIP','few',0,1565957498,1565957198,1565957198),(534,1,'ARHIP','fe',0,1565957498,1565957198,1565957198),(535,1,'ARHIP','wew',0,1565957502,1565957202,1565957202),(536,1,'ARHIP','fe',0,1565957502,1565957202,1565957202),(537,1,'ARHIP','wf',0,1565957503,1565957203,1565957203),(538,1,'ARHIP','efw',0,1565957503,1565957203,1565957203),(539,1,'ARHIP','few',0,1565957503,1565957203,1565957203),(540,1,'ARHIP','e',0,1565957503,1565957203,1565957203),(541,1,'ARHIP','ewf',0,1565957503,1565957203,1565957203),(542,2,'ARHIP1','NEW MESSAGE',0,1565957503,1565957203,1565957203),(543,1,'ARHIP','wefwef',0,1565957822,1565957522,1565957522),(544,1,'ARHIP','321',0,1565977724,1565977424,1565977424),(545,1,'ARHIP','21',0,1565978229,1565977929,1565977929),(546,1,'ARHIP','321123',1,1565978581,1565978281,1565978281),(547,1,'ARHIP','ddqwdqw',0,1565978945,1565978645,1565978645),(548,1,'ARHIP','213213',0,1565979256,1565978956,1565978956),(549,1,'ARHIP','123213123',0,1565979672,1565979372,1565979372),(550,1,'ARHIP','123',0,1565979986,1565979686,1565979686),(551,1,'ARHIP','12323',1,1565980781,1565980248,1565980248),(552,1,'ARHIP','232rr',0,1565981196,1565980896,1565981039),(553,1,'ARHIP','jop;jop',0,1565981567,1565981267,1565982219),(554,1,'ARHIP','123',0,1565986653,1565986353,1565986353),(555,1,'ARHIP','321',0,1565987000,1565986700,1565986700),(556,1,'ARHIP','21',0,1565993657,1565987256,1565993357),(557,2,'ARHIP1','ssrthsrtgs',1,1565993605,1565987479,1565993354),(558,2,'ARHIP1','asdas',1,1565988347,1565988047,1565988050),(559,2,'ARHIP1','213123',1,1565988395,1565988095,1565988097),(560,2,'ARHIP1','123213',1,1565988404,1565988104,1565988106),(561,2,'ARHIP1','212',1,1565988454,1565988154,1565988155),(562,2,'ARHIP1','213',1,1565988492,1565988192,1565988194),(563,2,'ARHIP1','12312',1,1565989566,1565988248,1565990724),(564,4,'ADMIN','2',0,1565993719,1565993384,1565993419),(565,5,'qwerty','qwerty',0,1565993769,1565993469,1565993469);
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_role` tinyint(1) NOT NULL DEFAULT '1',
  `email` varchar(255) COLLATE utf8_bin NOT NULL,
  `password` varchar(255) COLLATE utf8_bin NOT NULL,
  `user_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `avatar` varchar(255) COLLATE utf8_bin DEFAULT '',
  `created_at` int(10) NOT NULL,
  `updated_at` int(10) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='информация о зарегистрированных пользователях';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,1,'arhip@gmail.com','720a792a24bc5abe62ce7aca1390f6b2373e2079','ARHIP','_bfF-U6QWww.jpg',1565167501,1565990358),(2,1,'arhip@gmail.com1','720a792a24bc5abe62ce7aca1390f6b2373e2079','ARHIP1','5UQcHdJq-qs.jpg',1565167561,1565167561),(3,1,'arhip@gmail.com2','720a792a24bc5abe62ce7aca1390f6b2373e2079','ARHIP2','',1565167938,1565167938),(4,0,'|','720a792a24bc5abe62ce7aca1390f6b2373e2079','ADMIN','Z1kwFwvN-HA.jpg',1565167501,1565990752),(5,1,'qwerty','dbdc9118137ce7b51805d853d60ca7c4dae31299','qwerty','',1565993463,1565993463);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-17  3:56:48