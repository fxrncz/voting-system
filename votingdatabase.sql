-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: votingdatabase
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
-- Table structure for table `candidate_table`
--

DROP TABLE IF EXISTS candidate_table;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE candidate_table (
  candidate_id int NOT NULL AUTO_INCREMENT,
  candidate_name varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  party_affiliation varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  election_position varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (candidate_id)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidate_table`
--

LOCK TABLES candidate_table WRITE;
/*!40000 ALTER TABLE candidate_table DISABLE KEYS */;
INSERT INTO candidate_table VALUES (1,'ABALOS, BENHUR','PFP','Senator'),(2,'ADONIS, JEROME','MKBYN','Senator'),(3,'AMAD, WILSON','IND','Senator'),(4,'ANDAMO, NARS ALYN','MKBYN','Senator'),(5,'AQUINO, BAM','KNP','Senator'),(6,'ARAMBULO, RONNEL','MKBYN','Senator'),(7,'ARELLANO, ERNESTO','KTPNAN','Senator'),(8,'BALLON, ROBERTO','IND','Senator'),(9,'BINAY, ABBY','NPC','Senator'),(10,'BONDOC, JIMMY','PDPLBN','Senator'),(11,'BONG REVILLA,RAMON, JR.','LAKAS','Senator'),(12,'BOSITA, COLONEL','IND','Senator'),(13,'BROSAS, ARLENE','MKBYN','Senator'),(14,'CABONEGRO, ROY','DPP','Senator'),(15,'CAPUYAN, ALLEN','PPP','Senator'),(16,'CASIÑO, TEDDY','MKBYN','Senator'),(17,'CASTRO, TEACHER FRANCE','MKBYN','Senator'),(18,'CAYETANO, PIA','NP','Senator'),(19,'D\'ANGELO, DAVID','BUNYOG','Senator'),(20,'DE ALBAN,ATTORNEY ANGELO','IND','Senator'),(21,'DE GUZMAN, KA LEODY','PLM','Senator'),(22,'DELA ROSA, BATO','PDPLBN','Senator'),(23,'DORINGO, NANAY MIMI','MKBYN','Senator'),(24,'ESCOBAL, ARNEL','PM','Senator'),(25,'ESPIRITU, LUKE','PLM','Senator'),(26,'FLORANDA, MODY PISTON','MKBYN','Senator'),(27,'GAMBOA, MARC LOUIE','IND','Senator'),(28,'GO, BONG GO','PDPLBN','Senator'),(29,'GONZALES, NORBERTO','PDSP','Senator'),(30,'HINLO, JAYVEE','PDPLBN','Senator'),(31,'HONASAN, GRINGO','RP','Senator'),(32,'JOSE, RELLY JR.','KBL','Senator'),(33,'LACSON, PING','IND','Senator'),(34,'LAMBINO, RAUL','PDPLBN','Senator'),(35,'LAPID, LITO','NPC','Senator'),(37,'LIDASAN, AMIRAH','MKBYN','Senator'),(38,'MARCOLETA, RODANTE','IND','Senator'),(39,'MARCOS, IMEE R.','NP','Senator'),(40,'MARQUEZ, NORMAN','IND','Senator'),(41,'MARTINEZ, ERIC','IND','Senator'),(42,'MATA, DOC MARITES','IND','Senator'),(43,'MATULA, ATTY. SONNY','WPP','Senator'),(44,'MAZA, LIZA','MKBYN','Senator'),(45,'MENDOZA, HEIDI','IND','Senator'),(46,'MONTEMAYOR, JOEY','IND','Senator'),(47,'MUSTAPHA, SUBAIR','WPP','Senator'),(48,'OLIVAR, JOSE JESSIE','IND','Senator'),(50,'PACQUIAO, MANNY PACMAN','PFP','Senator'),(51,'PANGILINAN, KIKO','LP','Senator'),(52,'QUERUBIN, ARIEL PORFIRIO','NP','Senator'),(53,'QUIBOLOY, APOLLO','IND','Senator'),(54,'RAMOS, DANILO','MKBYN','Senator'),(55,'REVILLAME, WILLIE WIL','IND','Senator'),(56,'RODRIGUEZ, ATTY. VIC','IND','Senator'),(57,'SAHIDULLA, NUR-ANA','IND','Senator'),(58,'SALVADOR, PHILLIP IPE','PDPLBN','Senator'),(59,'SOTTO, TITO','NPC','Senator'),(60,'TAPADO, MICHAEL BONGBONG','PM','Senator'),(61,'TOLENTINO, FRANCIS TOL','PFP','Senator'),(62,'TULFO, BEN BITAG','IND','Senator'),(63,'TULFO, ERWIN','LAKAS','Senator'),(64,'VALBUENA, MAR MANIBELA','IND','Senator'),(65,'VERCELES, LEANDRO','IND','Senator'),(66,'VILLAR, CAMILLE','NP','Senator');
/*!40000 ALTER TABLE candidate_table ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pma__bookmark`
--

DROP TABLE IF EXISTS pma__bookmark;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE pma__bookmark (
  id int unsigned NOT NULL AUTO_INCREMENT,
  dbase varchar(255) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  label varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `query` text COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Bookmarks';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pma__bookmark`
--

LOCK TABLES pma__bookmark WRITE;
/*!40000 ALTER TABLE pma__bookmark DISABLE KEYS */;
/*!40000 ALTER TABLE pma__bookmark ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pma__central_columns`
--

DROP TABLE IF EXISTS pma__central_columns;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE pma__central_columns (
  db_name varchar(64) COLLATE utf8mb3_bin NOT NULL,
  col_name varchar(64) COLLATE utf8mb3_bin NOT NULL,
  col_type varchar(64) COLLATE utf8mb3_bin NOT NULL,
  col_length text COLLATE utf8mb3_bin,
  col_collation varchar(64) COLLATE utf8mb3_bin NOT NULL,
  col_isNull tinyint(1) NOT NULL,
  col_extra varchar(255) COLLATE utf8mb3_bin DEFAULT '',
  col_default text COLLATE utf8mb3_bin,
  PRIMARY KEY (db_name,col_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Central list of columns';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pma__central_columns`
--

LOCK TABLES pma__central_columns WRITE;
/*!40000 ALTER TABLE pma__central_columns DISABLE KEYS */;
/*!40000 ALTER TABLE pma__central_columns ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pma__column_info`
--

DROP TABLE IF EXISTS pma__column_info;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE pma__column_info (
  id int unsigned NOT NULL AUTO_INCREMENT,
  db_name varchar(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  mimetype varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  transformation varchar(255) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  transformation_options varchar(255) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  input_transformation varchar(255) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  input_transformation_options varchar(255) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (id),
  UNIQUE KEY db_name (db_name,`table_name`,`column_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Column information for phpMyAdmin';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pma__column_info`
--

LOCK TABLES pma__column_info WRITE;
/*!40000 ALTER TABLE pma__column_info DISABLE KEYS */;
/*!40000 ALTER TABLE pma__column_info ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pma__designer_settings`
--

DROP TABLE IF EXISTS pma__designer_settings;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE pma__designer_settings (
  username varchar(64) COLLATE utf8mb3_bin NOT NULL,
  settings_data text COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (username)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Settings related to Designer';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pma__designer_settings`
--

LOCK TABLES pma__designer_settings WRITE;
/*!40000 ALTER TABLE pma__designer_settings DISABLE KEYS */;
/*!40000 ALTER TABLE pma__designer_settings ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pma__export_templates`
--

DROP TABLE IF EXISTS pma__export_templates;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE pma__export_templates (
  id int unsigned NOT NULL AUTO_INCREMENT,
  username varchar(64) COLLATE utf8mb3_bin NOT NULL,
  export_type varchar(10) COLLATE utf8mb3_bin NOT NULL,
  template_name varchar(64) COLLATE utf8mb3_bin NOT NULL,
  template_data text COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY u_user_type_template (username,export_type,template_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Saved export templates';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pma__export_templates`
--

LOCK TABLES pma__export_templates WRITE;
/*!40000 ALTER TABLE pma__export_templates DISABLE KEYS */;
/*!40000 ALTER TABLE pma__export_templates ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pma__favorite`
--

DROP TABLE IF EXISTS pma__favorite;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE pma__favorite (
  username varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `tables` text COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (username)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Favorite tables';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pma__favorite`
--

LOCK TABLES pma__favorite WRITE;
/*!40000 ALTER TABLE pma__favorite DISABLE KEYS */;
/*!40000 ALTER TABLE pma__favorite ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pma__history`
--

DROP TABLE IF EXISTS pma__history;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE pma__history (
  id bigint unsigned NOT NULL AUTO_INCREMENT,
  username varchar(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  db varchar(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  timevalue timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  sqlquery text COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (id),
  KEY username (username,db,`table`,timevalue)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='SQL history for phpMyAdmin';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pma__history`
--

LOCK TABLES pma__history WRITE;
/*!40000 ALTER TABLE pma__history DISABLE KEYS */;
/*!40000 ALTER TABLE pma__history ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pma__navigationhiding`
--

DROP TABLE IF EXISTS pma__navigationhiding;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE pma__navigationhiding (
  username varchar(64) COLLATE utf8mb3_bin NOT NULL,
  item_name varchar(64) COLLATE utf8mb3_bin NOT NULL,
  item_type varchar(64) COLLATE utf8mb3_bin NOT NULL,
  db_name varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (username,item_name,item_type,db_name,`table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Hidden items of navigation tree';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pma__navigationhiding`
--

LOCK TABLES pma__navigationhiding WRITE;
/*!40000 ALTER TABLE pma__navigationhiding DISABLE KEYS */;
/*!40000 ALTER TABLE pma__navigationhiding ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pma__pdf_pages`
--

DROP TABLE IF EXISTS pma__pdf_pages;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE pma__pdf_pages (
  db_name varchar(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  page_nr int unsigned NOT NULL AUTO_INCREMENT,
  page_descr varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  PRIMARY KEY (page_nr),
  KEY db_name (db_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='PDF relation pages for phpMyAdmin';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pma__pdf_pages`
--

LOCK TABLES pma__pdf_pages WRITE;
/*!40000 ALTER TABLE pma__pdf_pages DISABLE KEYS */;
/*!40000 ALTER TABLE pma__pdf_pages ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pma__recent`
--

DROP TABLE IF EXISTS pma__recent;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE pma__recent (
  username varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `tables` text COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (username)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Recently accessed tables';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pma__recent`
--

LOCK TABLES pma__recent WRITE;
/*!40000 ALTER TABLE pma__recent DISABLE KEYS */;
/*!40000 ALTER TABLE pma__recent ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pma__relation`
--

DROP TABLE IF EXISTS pma__relation;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE pma__relation (
  master_db varchar(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  master_table varchar(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  master_field varchar(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  foreign_db varchar(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  foreign_table varchar(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  foreign_field varchar(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (master_db,master_table,master_field),
  KEY foreign_field (foreign_db,foreign_table)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Relation table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pma__relation`
--

LOCK TABLES pma__relation WRITE;
/*!40000 ALTER TABLE pma__relation DISABLE KEYS */;
/*!40000 ALTER TABLE pma__relation ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pma__savedsearches`
--

DROP TABLE IF EXISTS pma__savedsearches;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE pma__savedsearches (
  id int unsigned NOT NULL AUTO_INCREMENT,
  username varchar(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  db_name varchar(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  search_name varchar(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  search_data text COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY u_savedsearches_username_dbname (username,db_name,search_name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Saved searches';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pma__savedsearches`
--

LOCK TABLES pma__savedsearches WRITE;
/*!40000 ALTER TABLE pma__savedsearches DISABLE KEYS */;
/*!40000 ALTER TABLE pma__savedsearches ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pma__table_coords`
--

DROP TABLE IF EXISTS pma__table_coords;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE pma__table_coords (
  db_name varchar(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  pdf_page_number int NOT NULL DEFAULT '0',
  x float unsigned NOT NULL DEFAULT '0',
  y float unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (db_name,`table_name`,pdf_page_number)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Table coordinates for phpMyAdmin PDF output';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pma__table_coords`
--

LOCK TABLES pma__table_coords WRITE;
/*!40000 ALTER TABLE pma__table_coords DISABLE KEYS */;
/*!40000 ALTER TABLE pma__table_coords ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pma__table_info`
--

DROP TABLE IF EXISTS pma__table_info;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE pma__table_info (
  db_name varchar(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  display_field varchar(64) COLLATE utf8mb3_bin NOT NULL DEFAULT '',
  PRIMARY KEY (db_name,`table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Table information for phpMyAdmin';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pma__table_info`
--

LOCK TABLES pma__table_info WRITE;
/*!40000 ALTER TABLE pma__table_info DISABLE KEYS */;
/*!40000 ALTER TABLE pma__table_info ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pma__table_uiprefs`
--

DROP TABLE IF EXISTS pma__table_uiprefs;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE pma__table_uiprefs (
  username varchar(64) COLLATE utf8mb3_bin NOT NULL,
  db_name varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  prefs text COLLATE utf8mb3_bin NOT NULL,
  last_update timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (username,db_name,`table_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Tables'' UI preferences';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pma__table_uiprefs`
--

LOCK TABLES pma__table_uiprefs WRITE;
/*!40000 ALTER TABLE pma__table_uiprefs DISABLE KEYS */;
/*!40000 ALTER TABLE pma__table_uiprefs ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pma__tracking`
--

DROP TABLE IF EXISTS pma__tracking;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE pma__tracking (
  db_name varchar(64) COLLATE utf8mb3_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8mb3_bin NOT NULL,
  version int unsigned NOT NULL,
  date_created datetime NOT NULL,
  date_updated datetime NOT NULL,
  schema_snapshot text COLLATE utf8mb3_bin NOT NULL,
  schema_sql text COLLATE utf8mb3_bin,
  data_sql longtext COLLATE utf8mb3_bin,
  tracking set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8mb3_bin DEFAULT NULL,
  tracking_active int unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (db_name,`table_name`,version)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Database changes tracking for phpMyAdmin';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pma__tracking`
--

LOCK TABLES pma__tracking WRITE;
/*!40000 ALTER TABLE pma__tracking DISABLE KEYS */;
/*!40000 ALTER TABLE pma__tracking ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pma__userconfig`
--

DROP TABLE IF EXISTS pma__userconfig;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE pma__userconfig (
  username varchar(64) COLLATE utf8mb3_bin NOT NULL,
  timevalue timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  config_data text COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (username)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='User preferences storage for phpMyAdmin';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pma__userconfig`
--

LOCK TABLES pma__userconfig WRITE;
/*!40000 ALTER TABLE pma__userconfig DISABLE KEYS */;
INSERT INTO pma__userconfig VALUES ('root','2019-10-21 13:37:09','{\"Console\\/Mode\":\"collapse\"}');
/*!40000 ALTER TABLE pma__userconfig ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pma__usergroups`
--

DROP TABLE IF EXISTS pma__usergroups;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE pma__usergroups (
  usergroup varchar(64) COLLATE utf8mb3_bin NOT NULL,
  tab varchar(64) COLLATE utf8mb3_bin NOT NULL,
  allowed enum('Y','N') COLLATE utf8mb3_bin NOT NULL DEFAULT 'N',
  PRIMARY KEY (usergroup,tab,allowed)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='User groups with configured menu items';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pma__usergroups`
--

LOCK TABLES pma__usergroups WRITE;
/*!40000 ALTER TABLE pma__usergroups DISABLE KEYS */;
/*!40000 ALTER TABLE pma__usergroups ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pma__users`
--

DROP TABLE IF EXISTS pma__users;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE pma__users (
  username varchar(64) COLLATE utf8mb3_bin NOT NULL,
  usergroup varchar(64) COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (username,usergroup)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin COMMENT='Users and their assignments to user groups';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pma__users`
--

LOCK TABLES pma__users WRITE;
/*!40000 ALTER TABLE pma__users DISABLE KEYS */;
/*!40000 ALTER TABLE pma__users ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pma_register`
--

DROP TABLE IF EXISTS pma_register;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE pma_register (
  id int NOT NULL AUTO_INCREMENT,
  full_name varchar(100) NOT NULL,
  date_of_birth date NOT NULL,
  gender enum('Male','Female') NOT NULL,
  contact_number varchar(15) NOT NULL,
  email varchar(100) NOT NULL,
  username varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('Admin','Organizer','Voter') DEFAULT 'Voter',
  created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY email (email),
  UNIQUE KEY username (username)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pma_register`
--

LOCK TABLES pma_register WRITE;
/*!40000 ALTER TABLE pma_register DISABLE KEYS */;
INSERT INTO pma_register VALUES (24,'Francis Oliver','2025-05-14','Male','123123123','francisoliver21@gmail.com','1366123','$2y$10$z3IIHLN6PV2ojIb/xTd9I.ia6UFjdRB6XbmU99RRCasWnaG6V4aY2','Voter','2025-05-30 13:08:42'),(25,'Test','2025-05-21','Male','12312312312','stixxayhayes21@gmail.com','123123','$2y$10$72V6vAVT9IEkDtRPWPwxzu6/gizquOGNx/wByVihSjIasQK/ua0YC','Voter','2025-05-30 13:17:53');
/*!40000 ALTER TABLE pma_register ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position_table`
--

DROP TABLE IF EXISTS position_table;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE position_table (
  position_id int NOT NULL AUTO_INCREMENT,
  position_name varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (position_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position_table`
--

LOCK TABLES position_table WRITE;
/*!40000 ALTER TABLE position_table DISABLE KEYS */;
/*!40000 ALTER TABLE position_table ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vote_table`
--

DROP TABLE IF EXISTS vote_table;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE vote_table (
  vote_id varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  voter_id varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  candidate_id varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  vote_timestamps datetime DEFAULT NULL,
  PRIMARY KEY (vote_id,candidate_id),
  KEY v_voter_id (voter_id),
  KEY v_candidate_id (candidate_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vote_table`
--

LOCK TABLES vote_table WRITE;
/*!40000 ALTER TABLE vote_table DISABLE KEYS */;
INSERT INTO vote_table VALUES ('REF6839B018BC13D','123123','1,2,3','2025-05-30 21:18:16');
/*!40000 ALTER TABLE vote_table ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `votecount_table`
--

DROP TABLE IF EXISTS votecount_table;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE votecount_table (
  vote_count_id int NOT NULL AUTO_INCREMENT,
  candidate_id int NOT NULL,
  vote_count int DEFAULT NULL,
  PRIMARY KEY (vote_count_id),
  KEY c_candidate_id (candidate_id),
  CONSTRAINT c_candidate_id FOREIGN KEY (candidate_id) REFERENCES candidate_table (candidate_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `votecount_table`
--

LOCK TABLES votecount_table WRITE;
/*!40000 ALTER TABLE votecount_table DISABLE KEYS */;
/*!40000 ALTER TABLE votecount_table ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voter_table`
--

DROP TABLE IF EXISTS voter_table;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE voter_table (
  voter_id int NOT NULL AUTO_INCREMENT,
  voter_name varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  date_of_birth varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  gender varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  contact_information bigint DEFAULT NULL,
  voter_accesscode varchar(45) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (voter_id)
) ENGINE=InnoDB AUTO_INCREMENT=2022313432 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voter_table`
--

LOCK TABLES voter_table WRITE;
/*!40000 ALTER TABLE voter_table DISABLE KEYS */;
INSERT INTO voter_table VALUES (2022313431,NULL,NULL,NULL,NULL,'vaamps4dwin');
/*!40000 ALTER TABLE voter_table ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-31 22:08:25
