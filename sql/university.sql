-- MySQL dump 10.13  Distrib 5.6.21, for Win32 (x86)
--
-- Host: localhost    Database: university
-- ------------------------------------------------------
-- Server version	5.6.21

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
-- Table structure for table `jurusan`
--

DROP TABLE IF EXISTS `jurusan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jurusan` (
  `id_jurusan` int(7) NOT NULL,
  `nama_jurusan` varchar(250) NOT NULL,
  `prog_pendidikan` int(5) NOT NULL,
  PRIMARY KEY (`id_jurusan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jurusan`
--

LOCK TABLES `jurusan` WRITE;
/*!40000 ALTER TABLE `jurusan` DISABLE KEYS */;
INSERT INTO `jurusan` VALUES (1,'Ilmu Komputer',1),(2,'Ilmu Komputer',2),(3,'Teknologi Informasi',2),(4,'Statistika',1),(5,'Ekonomi',2),(6,'Kedokteran',2);
/*!40000 ALTER TABLE `jurusan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mahasiswa`
--

DROP TABLE IF EXISTS `mahasiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mahasiswa` (
  `nim` varchar(10) NOT NULL,
  `password` varchar(250) NOT NULL,
  `nama` varchar(250) NOT NULL,
  `kelamin` tinyint(1) NOT NULL,
  `alamat` text NOT NULL,
  `tgl_lahir` date NOT NULL,
  `id_jurusan` int(7) NOT NULL,
  `tgl_masuk` date NOT NULL,
  PRIMARY KEY (`nim`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mahasiswa`
--

LOCK TABLES `mahasiswa` WRITE;
/*!40000 ALTER TABLE `mahasiswa` DISABLE KEYS */;
INSERT INTO `mahasiswa` VALUES ('1500200001','af61985fab499287e2e0608e71c8a4006a3c4a2c','Agung Laksana',1,'Komplek Seroja No. 2, Medan','1986-09-30',2,'2012-07-10'),('1500300001','ca3ac029c90fcec8a0043aca23b6d3a1a3729553','Muhammad Zulham',1,'Jl. Karet Raya No.113C Simalingkar','1989-05-27',3,'2013-07-12');
/*!40000 ALTER TABLE `mahasiswa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mata_kuliah`
--

DROP TABLE IF EXISTS `mata_kuliah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mata_kuliah` (
  `kode_matkul` varchar(7) NOT NULL,
  `nama_matkul` varchar(255) NOT NULL,
  `id_jurusan` int(7) NOT NULL,
  `type_semester` tinyint(2) NOT NULL,
  PRIMARY KEY (`kode_matkul`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mata_kuliah`
--

LOCK TABLES `mata_kuliah` WRITE;
/*!40000 ALTER TABLE `mata_kuliah` DISABLE KEYS */;
INSERT INTO `mata_kuliah` VALUES ('0201001','Aljabar Linear',2,1),('0201002','Object Oriented Programming',2,1),('0301001','Aljabar Linear',3,1),('0301002','Sistem Informasi',3,1),('0301003','Bahasa Indonesia',3,1);
/*!40000 ALTER TABLE `mata_kuliah` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matkul_mahasiswa`
--

DROP TABLE IF EXISTS `matkul_mahasiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matkul_mahasiswa` (
  `id_mkms` int(8) NOT NULL AUTO_INCREMENT,
  `id_smms` int(8) NOT NULL,
  `kode_matkul` varchar(7) NOT NULL,
  `ip` decimal(2,2) DEFAULT NULL,
  PRIMARY KEY (`id_mkms`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matkul_mahasiswa`
--

LOCK TABLES `matkul_mahasiswa` WRITE;
/*!40000 ALTER TABLE `matkul_mahasiswa` DISABLE KEYS */;
INSERT INTO `matkul_mahasiswa` VALUES (1,1,'0301001',NULL),(2,1,'0301002',NULL);
/*!40000 ALTER TABLE `matkul_mahasiswa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `judul` varchar(200) NOT NULL,
  `isi` text NOT NULL,
  `tanggalBerita` datetime NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (1,'Berita Pertama','Contoh isi berita pertama. Ini hanyalah sebuah contoh berita utama yang digunakan untuk project skripsi saja.','2015-03-19 21:48:31',0),(2,'Berita Kedua','Isi berita kedua. Contoh isi berita kedua, berupa text sample untuk keterangan isi berita, dengan judul berita kedua.','2015-03-19 21:48:31',0);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semester_mahasiswa`
--

DROP TABLE IF EXISTS `semester_mahasiswa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `semester_mahasiswa` (
  `id_smms` int(8) NOT NULL AUTO_INCREMENT,
  `nim` varchar(10) NOT NULL,
  `type_semester` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_smms`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semester_mahasiswa`
--

LOCK TABLES `semester_mahasiswa` WRITE;
/*!40000 ALTER TABLE `semester_mahasiswa` DISABLE KEYS */;
INSERT INTO `semester_mahasiswa` VALUES (1,'1500300001',1),(2,'1500200001',1),(3,'1500200001',2);
/*!40000 ALTER TABLE `semester_mahasiswa` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-19 22:05:41
