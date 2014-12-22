-- phpMyAdmin SQL Dump
-- version 4.2.7.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Dec 16, 2014 at 10:37 PM
-- Server version: 5.5.39
-- PHP Version: 5.4.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `university`
--

-- --------------------------------------------------------

--
-- Table structure for table `jurusan`
--

CREATE TABLE IF NOT EXISTS `jurusan` (
  `id_jurusan` int(7) NOT NULL,
  `nama_jurusan` varchar(250) NOT NULL,
  `prog_pendidikan` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jurusan`
--

INSERT INTO `jurusan` (`id_jurusan`, `nama_jurusan`, `prog_pendidikan`) VALUES
(1, 'Ilmu Komputer', 1),
(2, 'Ilmu Komputer', 2),
(3, 'Teknologi Informasi', 2),
(4, 'Statistika', 1),
(5, 'Ekonomi', 2),
(6, 'Kedokteran', 2);

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE IF NOT EXISTS `mahasiswa` (
  `nim` varchar(10) NOT NULL,
  `password` varchar(250) NOT NULL,
  `nama` varchar(250) NOT NULL,
  `kelamin` tinyint(1) NOT NULL,
  `alamat` text NOT NULL,
  `tgl_lahir` date NOT NULL,
  `id_jurusan` int(7) NOT NULL,
  `tgl_masuk` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`nim`, `password`, `nama`, `kelamin`, `alamat`, `tgl_lahir`, `id_jurusan`, `tgl_masuk`) VALUES
('1500200001', 'af61985fab499287e2e0608e71c8a4006a3c4a2c', 'Agung Laksana', 1, 'Komplek Seroja No. 2, Medan', '1986-09-30', 2, '2012-07-10'),
('1500300001', 'ca3ac029c90fcec8a0043aca23b6d3a1a3729553', 'Muhammad Zulham', 1, 'Jl. Seroja No.12, Medan', '1989-10-17', 3, '2013-07-12');

-- --------------------------------------------------------

--
-- Table structure for table `mata_kuliah`
--

CREATE TABLE IF NOT EXISTS `mata_kuliah` (
  `kode_matakul` varchar(5) NOT NULL,
  `nama_matkul` varchar(255) NOT NULL,
  `id_jurusan` int(7) NOT NULL,
  `type_semester` tinyint(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mata_kuliah`
--

INSERT INTO `mata_kuliah` (`kode_matakul`, `nama_matkul`, `id_jurusan`, `type_semester`) VALUES
('01001', 'Aljabar Linear', 1, 1),
('01002', 'Object Oriented Programming', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `matkul_mahasiswa`
--

CREATE TABLE IF NOT EXISTS `matkul_mahasiswa` (
`id_mkms` int(8) NOT NULL,
  `id_smms` int(8) NOT NULL,
  `kode_matkul` varchar(5) NOT NULL,
  `ip` decimal(2,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `semester_mahasiswa`
--

CREATE TABLE IF NOT EXISTS `semester_mahasiswa` (
`id_smms` int(8) NOT NULL,
  `nim` varchar(10) NOT NULL,
  `type_semester` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jurusan`
--
ALTER TABLE `jurusan`
 ADD PRIMARY KEY (`id_jurusan`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
 ADD PRIMARY KEY (`nim`);

--
-- Indexes for table `mata_kuliah`
--
ALTER TABLE `mata_kuliah`
 ADD PRIMARY KEY (`kode_matakul`);

--
-- Indexes for table `matkul_mahasiswa`
--
ALTER TABLE `matkul_mahasiswa`
 ADD PRIMARY KEY (`id_mkms`);

--
-- Indexes for table `semester_mahasiswa`
--
ALTER TABLE `semester_mahasiswa`
 ADD PRIMARY KEY (`id_smms`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `matkul_mahasiswa`
--
ALTER TABLE `matkul_mahasiswa`
MODIFY `id_mkms` int(8) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `semester_mahasiswa`
--
ALTER TABLE `semester_mahasiswa`
MODIFY `id_smms` int(8) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
