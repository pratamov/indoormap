-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 14, 2017 at 10:41 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `indoormap-db`
--

-- --------------------------------------------------------

--
-- Table structure for table `geofence`
--

CREATE TABLE `geofence` (
  `id` int(11) NOT NULL,
  `id_lokasi` varchar(100) DEFAULT NULL,
  `nama` varchar(100) NOT NULL,
  `deskripsi` text,
  `x1` double NOT NULL,
  `y1` double NOT NULL,
  `x2` double NOT NULL,
  `y2` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `geofence`
--

INSERT INTO `geofence` (`id`, `id_lokasi`, `nama`, `deskripsi`, `x1`, `y1`, `x2`, `y2`) VALUES
(6, 'V2', 'R. Penelitian', 'R. Penelitian Labtek V Lantai 2 Institut Teknologi Bandung', 4.4, 1.4, 12, 12.2),
(7, 'V2', 'R. Seminar', 'R. Seminar Labtek V Lantai 2 Institut Teknologi Bandung', 11.9, 1.4, 18.1, 12.1),
(8, 'V2', 'Lab Programming', 'Lab Programming Labtek V Lantai 2 Institut Teknologi Bandung', 17.8, 1.4, 24, 12.1),
(9, 'V2', 'R. Dosen', 'R. Dosen Labtek V Lantai 2 Institut Teknologi Bandung', 23.9, 1.5, 30, 9.6),
(10, 'V2', 'R. Diskusi', 'R. Diskusi Labtek V Lantai 2 Institut Teknologi Bandung', 23.9, 9.5, 30, 12),
(11, 'V2', 'Dapur', 'Dapur Labtek V Lantai 2 Institut Teknologi Bandung', 29.9, 5.9, 31.6, 12),
(12, 'V2', 'Internal Corridor', 'Internal Corridor Labtek V Lantai 2 Institut Teknologi Bandung', 10.4, 12, 30, 15.1),
(13, 'V2', 'R. Dosen', 'R. Dosen Labtek V Lantai 2 Institut Teknologi Bandung', 10.4, 15, 21, 22.5),
(14, 'V2', 'Lab. Basis Data', 'Lab. Basis Data Labtek V Lantai 2 Institut Teknologi Bandung', 20.9, 15, 27.8, 22.6),
(15, 'V2', 'TU', 'TU Labtek V Lantai 2 Institut Teknologi Bandung', 27.8, 15, 31.5, 22.6),
(16, 'V2', 'Lab Thesis', 'Lab Thesis Labtek V Lantai 2 Institut Teknologi Bandung', 42, 1.4, 48.1, 12.1),
(17, 'V2', 'Lab Thesis', 'Lab Thesis Labtek V Lantai 2 Institut Teknologi Bandung', 48, 1.5, 54.1, 12.1),
(18, 'V2', 'Lab Komputer', 'Lab Komputer Labtek V Lantai 2 Institut Teknologi Bandung', 54, 1.4, 60.1, 12.1),
(19, 'V2', 'R. Bersama', 'R. Bersama Labtek V Lantai 2 Institut Teknologi Bandung', 60, 1.5, 66.1, 12.1),
(20, 'V2', 'R. Rapat', 'R. Rapat Labtek V Lantai 2 Institut Teknologi Bandung', 66, 1.5, 69.2, 6.7),
(21, 'V2', 'R. Rapat', 'R. Rapat Labtek V Lantai 2 Institut Teknologi Bandung', 66.1, 6.7, 69.1, 12.1),
(22, 'V2', 'R. Rapat Dekan', 'R. Rapat Dekan Labtek V Lantai 2 Institut Teknologi Bandung', 69.1, 1.5, 78.1, 12.1),
(23, 'V2', 'R. Administrasi', 'R. Administrasi Labtek V Lantai 2 Institut Teknologi Bandung', 78.1, 1.4, 90.2, 12.1),
(24, 'V2', 'R. SI', 'R. SI Labtek V Lantai 2 Institut Teknologi Bandung', 90.1, 1.6, 97.7, 12.1),
(25, 'V2', 'Internal Corridor', 'Internal Corridor Labtek V Lantai 2 Institut Teknologi Bandung', 41.9, 12, 90.3, 15.1),
(26, 'V2', 'Gudang', 'Gudang Labtek V Lantai 2 Institut Teknologi Bandung', 40.4, 15, 48.1, 22.6),
(27, 'V2', 'R. Diskusi S2', 'R. Diskusi S2 Labtek V Lantai 2 Institut Teknologi Bandung', 47.9, 14.9, 52.4, 19),
(28, 'V2', 'R. Diskusi S2', 'R. Diskusi S2 Labtek V Lantai 2 Institut Teknologi Bandung', 52.4, 15, 57.1, 19.1),
(29, 'V2', 'R. Diskusi S2', 'R. Diskusi S2 Labtek V Lantai 2 Institut Teknologi Bandung', 48, 19, 52.4, 22.6),
(30, 'V2', 'R. Diskusi S2', 'R. Diskusi S2 Labtek V Lantai 2 Institut Teknologi Bandung', 52.3, 19, 57.1, 22.6),
(31, 'V2', 'R. Arsip', 'R. Arsip Labtek V Lantai 2 Institut Teknologi Bandung', 57, 15, 61.6, 19),
(32, 'V2', 'R. Arsip', 'R. Arsip Labtek V Lantai 2 Institut Teknologi Bandung', 57, 19, 61.6, 22.6),
(33, 'V2', 'R. Arsip', 'R. Arsip Labtek V Lantai 2 Institut Teknologi Bandung', 61.5, 15, 66.1, 22.6),
(34, 'V2', 'R. Dosen', 'R. Dosen Labtek V Lantai 2 Institut Teknologi Bandung', 66, 15, 69.2, 18.1),
(35, 'V2', 'R. Dosen', 'R. Dosen Labtek V Lantai 2 Institut Teknologi Bandung', 69.1, 15, 72.1, 18),
(36, 'V2', 'R. Dosen', 'R. Dosen Labtek V Lantai 2 Institut Teknologi Bandung', 72.1, 15, 75.2, 18.1),
(37, 'V2', 'R. Dosen', 'R. Dosen Labtek V Lantai 2 Institut Teknologi Bandung', 66, 19.5, 69.2, 22.6),
(38, 'V2', 'R. Dosen', 'R. Dosen Labtek V Lantai 2 Institut Teknologi Bandung', 69, 19.5, 72.2, 22.6),
(39, 'V2', 'R. Dosen', 'R. Dosen Labtek V Lantai 2 Institut Teknologi Bandung', 72.1, 19.5, 75.2, 22.6),
(40, 'V2', 'R. Dosen', 'R. Dosen Labtek V Lantai 2 Institut Teknologi Bandung', 75.1, 19.6, 78.2, 22.5),
(41, 'V2', 'R. Administrasi', 'R. Administrasi Labtek V Lantai 2 Institut Teknologi Bandung', 75.1, 15.1, 84.2, 22.5),
(42, 'V2', 'R. Seminar', 'R. Seminar Labtek V Lantai 2 Institut Teknologi Bandung', 84.1, 14.9, 91.8, 22.6),
(43, 'V2', 'Labtek V Lantai 2', 'Labtek V Lantai 2 Institut Teknologi Bandung', 0, 0, 102, 23.9),
(44, 'V3', 'R. Kelas', 'R. Kelas Labtek V Lantai 3 Institut Teknologi Bandung', 0, 0, 6.3, 12.2),
(45, 'V3', 'R. Baca', 'R. Baca Labtek V Lantai 3 Institut Teknologi Bandung', 6.2, 0.1, 12.3, 12.2),
(46, 'V3', 'R. Baca', 'R. Baca Labtek V Lantai 3 Institut Teknologi Bandung', 12.2, 0.2, 18.3, 12.2),
(47, 'V3', 'Perpustakaan', 'Perpustakaan Labtek V Lantai 3 Institut Teknologi Bandung', 18.1, 0.2, 24.3, 12.2),
(48, 'V3', 'R. Kelas', 'R. Kelas Labtek V Lantai 3 Institut Teknologi Bandung', 24.2, 0.1, 30.3, 12.1),
(49, 'V3', 'R. Kelas', 'R. Kelas Labtek V Lantai 3 Institut Teknologi Bandung', 30.2, 0.2, 36.2, 12.2),
(50, 'V3', 'Rest Room', 'Rest Room Labtek V Lantai 3 Institut Teknologi Bandung', 36.1, 0.2, 42.2, 4.9),
(51, 'V3', 'Internal Corridor', 'Internal Corridor Labtek V Lantai 3 Institut Teknologi Bandung', 36.2, 4.8, 42.2, 15.1),
(52, 'V3', 'Internal Corridor', 'Internal Corridor Labtek V Lantai 3 Institut Teknologi Bandung', 0.3, 12.2, 102, 15.2),
(53, 'V3', 'R. Kelas', 'R. Kelas Labtek V Lantai 3 Institut Teknologi Bandung', 0, 15.2, 6.4, 24.2),
(54, 'V3', 'R. Seminar', 'R. Seminar Labtek V Lantai 3 Institut Teknologi Bandung', 10.5, 15.1, 15.3, 24.2),
(55, 'V3', 'R. Kelas', 'R. Kelas Labtek V Lantai 3 Institut Teknologi Bandung', 15.1, 15.1, 24.2, 24.2),
(56, 'V3', 'R. Kelas', 'R. Kelas Labtek V Lantai 3 Institut Teknologi Bandung', 24.1, 15.1, 30.2, 24.2),
(57, 'V3', 'R. Kelas', 'R. Kelas Labtek V Lantai 3 Institut Teknologi Bandung', 30.1, 15.1, 36.5, 24.2),
(58, 'V3', 'R. Kelas', 'R. Kelas Labtek V Lantai 3 Institut Teknologi Bandung', 42, 0, 48.1, 12.1),
(59, 'V3', 'R. Server', 'R. Server Labtek V Lantai 3 Institut Teknologi Bandung', 48.1, 0, 54.2, 5.6),
(60, 'V3', 'R. OSSC', 'R. OSSC Labtek V Lantai 3 Institut Teknologi Bandung', 54.1, 0, 60.2, 5.6),
(61, 'V3', 'R. Rapat', 'R. Rapat Labtek V Lantai 3 Institut Teknologi Bandung', 48.1, 5.6, 55.6, 12.2),
(62, 'V3', 'R. Dosen', 'R. Dosen Labtek V Lantai 3 Institut Teknologi Bandung', 55.6, 5.6, 60, 9),
(63, 'V3', 'R. SDM', 'R. SDM Labtek V Lantai 3 Institut Teknologi Bandung', 55.5, 9.1, 60.2, 12.2),
(64, 'V3', 'R. Dosen', 'R. Dosen Labtek V Lantai 3 Institut Teknologi Bandung', 60.1, 0, 63.1, 3.6),
(65, 'V3', 'R. Dosen', 'R. Dosen Labtek V Lantai 3 Institut Teknologi Bandung', 63.1, 0, 66, 3.6),
(66, 'V3', 'R. Penelitian Flu Burung', 'R. Penelitian Flu Burung Labtek V Lantai 3 Institut Teknologi Bandung', 60.1, 3.7, 66, 12.2),
(67, 'V3', 'Bengkel', 'Bengkel Labtek V Lantai 3 Institut Teknologi Bandung', 66, 0, 81, 6.1),
(68, 'V3', 'R. Penelitian', 'R. Penelitian Labtek V Lantai 3 Institut Teknologi Bandung', 66.1, 6.2, 72, 12.2),
(69, 'V3', 'Gudang', 'Gudang Labtek V Lantai 3 Institut Teknologi Bandung', 75, 6.1, 81, 12.1),
(70, 'V3', 'Bengkel', 'Bengkel Labtek V Lantai 3 Institut Teknologi Bandung', 72, 6.1, 75.2, 12.2),
(71, 'V3', 'R. Kelas', 'R. Kelas Labtek V Lantai 3 Institut Teknologi Bandung', 81, 0.2, 90.1, 12.2),
(72, 'V3', 'Gudang', 'Gudang Labtek V Lantai 3 Institut Teknologi Bandung', 84, 6.1, 90.1, 12.2),
(73, 'V3', 'Lab MIC', 'Lab MIC Labtek V Lantai 3 Institut Teknologi Bandung', 90, 0, 102, 12.1),
(74, 'V3', 'R. Diskusi', 'R. Diskusi Labtek V Lantai 3 Institut Teknologi Bandung', 40.5, 15.2, 48, 24.2),
(75, 'V3', 'R. Seminar', 'R. Seminar Labtek V Lantai 3 Institut Teknologi Bandung', 47.9, 15.1, 51.2, 24.2),
(76, 'V3', 'R. Diskusi', 'R. Diskusi Labtek V Lantai 3 Institut Teknologi Bandung', 51.1, 15, 54.2, 20.1),
(77, 'V3', 'Mushola', 'Mushola Labtek V Lantai 3 Institut Teknologi Bandung', 51, 20, 54.2, 24.2),
(78, 'V3', 'Lab Sistem Informatika', 'Lab Sistem Informatika Labtek V Lantai 3 Institut Teknologi Bandung', 54.2, 15, 60, 24.2),
(79, 'V3', 'R. Dosen', 'R. Dosen Labtek V Lantai 3 Institut Teknologi Bandung', 60, 15, 66.2, 24.2),
(80, 'V3', 'Lab Dasar', 'Lab Dasar Labtek V Lantai 3 Institut Teknologi Bandung', 65.9, 15, 87, 24.2),
(81, 'V3', 'Lab Dasar', 'Lab Dasar Labtek V Lantai 3 Institut Teknologi Bandung', 86.9, 15.1, 91.5, 24.2),
(82, 'V3', 'Lab MIC', 'Lab MIC Labtek V Lantai 3 Institut Teknologi Bandung', 95.6, 15.1, 102, 24.2),
(83, 'V3', 'Labtek V Lantai 3', 'Labtek V Lantai 3 Institut Teknologi Bandung', 0, 0, 102, 24.2),
(84, 'V4', 'R. Dosen', 'R. Dosen Labtek V Lantai 4 Institut Teknologi Bandung', 6.2, 1.6, 15.3, 12.3),
(85, 'V4', 'Lab Sister', 'Lab Sister Labtek V Lantai 4 Institut Teknologi Bandung', 15.2, 1.8, 21.2, 12.3),
(86, 'V4', 'R. Diskusi', 'R. Diskusi Labtek V Lantai 4 Institut Teknologi Bandung', 12.1, 9.2, 18.3, 12.2),
(87, 'V4', 'R. Dosen + Server', 'R. Dosen + Server Labtek V Lantai 4 Institut Teknologi Bandung', 21.1, 1.7, 24.2, 7.4),
(88, 'V4', 'Mushola', 'Mushola Labtek V Lantai 4 Institut Teknologi Bandung', 24.2, 1.7, 27.2, 4.8),
(89, 'V4', 'R. Dosen', 'R. Dosen Labtek V Lantai 4 Institut Teknologi Bandung', 27.1, 1.7, 30.4, 4.8),
(90, 'V4', 'Lab LRK', 'Lab LRK Labtek V Lantai 4 Institut Teknologi Bandung', 24.2, 4.7, 30.4, 12.3),
(91, 'V4', 'R. Dosen', 'R. Dosen Labtek V Lantai 4 Institut Teknologi Bandung', 30.3, 1.8, 36.2, 12.3),
(92, 'V4', 'Internal Corridor', 'Internal Corridor Labtek V Lantai 4 Institut Teknologi Bandung', 6.3, 12.2, 36.1, 14.2),
(93, 'V4', 'Internal Corridor', 'Internal Corridor Labtek V Lantai 4 Institut Teknologi Bandung', 36, 12.1, 95.6, 15.2),
(94, 'V4', 'Internal Corridor', 'Internal Corridor Labtek V Lantai 4 Institut Teknologi Bandung', 35.9, 1.6, 42, 12.3),
(95, 'V4', 'R. Rapat', 'R. Rapat Labtek V Lantai 4 Institut Teknologi Bandung', 10.7, 14.2, 18.3, 22.8),
(96, 'V4', 'R. Dosen', 'R. Dosen Labtek V Lantai 4 Institut Teknologi Bandung', 18.1, 14.2, 27.1, 22.8),
(97, 'V4', 'Lab Gaib', 'Lab Gaib Labtek V Lantai 4 Institut Teknologi Bandung', 27, 14.2, 33.1, 22.8),
(98, 'V4', 'R. Diskusi', 'R. Diskusi Labtek V Lantai 4 Institut Teknologi Bandung', 33, 14.2, 36.4, 18.4),
(99, 'V4', 'R. Dosen', 'R. Dosen Labtek V Lantai 4 Institut Teknologi Bandung', 33.1, 18.4, 36.3, 22.7),
(100, 'V4', 'Mushola', 'Mushola Labtek V Lantai 4 Institut Teknologi Bandung', 42.1, 1.7, 45.1, 7.3),
(101, 'V4', 'Dapur', 'Dapur Labtek V Lantai 4 Institut Teknologi Bandung', 42, 7.2, 45.1, 12.3),
(102, 'V4', 'Lab RPL', 'Lab RPL Labtek V Lantai 4 Institut Teknologi Bandung', 45, 1.7, 51.1, 12.3),
(103, 'V4', 'R. Dosen', 'R. Dosen Labtek V Lantai 4 Institut Teknologi Bandung', 50.9, 1.7, 60, 12.3),
(104, 'V4', 'R. Diskusi', 'R. Diskusi Labtek V Lantai 4 Institut Teknologi Bandung', 50.9, 6.9, 54.2, 12.2),
(105, 'V4', 'Lab Dasar', 'Lab Dasar Labtek V Lantai 4 Institut Teknologi Bandung', 59.9, 1.7, 69, 12.3),
(106, 'V4', 'Lab Dasar', 'Lab Dasar Labtek V Lantai 4 Institut Teknologi Bandung', 68.8, 1.6, 83.9, 12.2),
(107, 'V4', 'Lab Dasar', 'Lab Dasar Labtek V Lantai 4 Institut Teknologi Bandung', 83.8, 1.6, 89.8, 12.3),
(108, 'V4', 'HMS', 'HMS Labtek V Lantai 4 Institut Teknologi Bandung', 89.7, 1.7, 95.8, 12.2),
(109, 'V4', 'R. Multimedia', 'R. Multimedia Labtek V Lantai 4 Institut Teknologi Bandung', 40.4, 15.2, 51.1, 22.8),
(110, 'V4', 'TU', 'TU Labtek V Lantai 4 Institut Teknologi Bandung', 50.9, 15.2, 54.1, 22.8),
(111, 'V4', 'R. Administrasi', 'R. Administrasi Labtek V Lantai 4 Institut Teknologi Bandung', 54, 15.2, 60, 22.7),
(112, 'V4', 'Mushola', 'Mushola Labtek V Lantai 4 Institut Teknologi Bandung', 56.7, 15.2, 63.2, 18.3),
(113, 'V4', 'R. Server', 'R. Server Labtek V Lantai 4 Institut Teknologi Bandung', 59.9, 15.1, 66, 22.8),
(114, 'V4', 'R. Rapat', 'R. Rapat Labtek V Lantai 4 Institut Teknologi Bandung', 65.9, 15.2, 71.9, 19.6),
(115, 'V4', 'R. Dosen', 'R. Dosen Labtek V Lantai 4 Institut Teknologi Bandung', 65.8, 19.6, 72, 22.7),
(116, 'V4', 'R. Dosen', 'R. Dosen Labtek V Lantai 4 Institut Teknologi Bandung', 71.8, 15.2, 77.8, 19.7),
(117, 'V4', 'R. Rapat', 'R. Rapat Labtek V Lantai 4 Institut Teknologi Bandung', 71.8, 19.5, 78, 22.8),
(118, 'V4', 'Lab Thesis S3', 'Lab Thesis S3 Labtek V Lantai 4 Institut Teknologi Bandung', 77.7, 15.1, 83.8, 22.8),
(119, 'V4', 'Gudang', 'Gudang Labtek V Lantai 4 Institut Teknologi Bandung', 83.7, 15.1, 91.4, 22.8),
(120, 'V4', 'Labtek V Lantai 4', 'Labtek V Lantai 4 Institut Teknologi Bandung', 0, 0, 102, 24.1),
(121, 'VIII2', 'ADM STEI', 'ADM STEI Labtek VIII Lantai 2 Institut Teknologi Bandung', 6.2, 1.9, 15.4, 12.7),
(122, 'VIII2', 'WDA', 'WDA Labtek VIII Lantai 2 Institut Teknologi Bandung', 15.2, 1.9, 18.3, 8.1),
(123, 'VIII2', 'Dekan STEI', 'Dekan STEI Labtek VIII Lantai 2 Institut Teknologi Bandung', 18.2, 2, 24.2, 7.9),
(124, 'VIII2', 'RDM', 'RDM Labtek VIII Lantai 2 Institut Teknologi Bandung', 15.2, 8.1, 18.3, 12.7),
(125, 'VIII2', 'Kabag TU STEI', 'Kabag TU STEI Labtek VIII Lantai 2 Institut Teknologi Bandung', 18.2, 8, 21.3, 12.7),
(126, 'VIII2', 'WDSD STEI', 'WDSD STEI Labtek VIII Lantai 2 Institut Teknologi Bandung', 21.2, 7.8, 24.2, 12.6),
(127, 'VIII2', 'R. Rapat STEI', 'R. Rapat STEI Labtek VIII Lantai 2 Institut Teknologi Bandung', 24.2, 1.8, 36.2, 12.7),
(128, 'VIII2', 'Mushola STEI', 'Mushola STEI Labtek VIII Lantai 2 Institut Teknologi Bandung', 36, 1.9, 39.1, 7.1),
(129, 'VIII2', 'Gudang STEI', 'Gudang STEI Labtek VIII Lantai 2 Institut Teknologi Bandung', 36.1, 7.1, 39.1, 12.7),
(130, 'VIII2', 'R. Dosen LSKK', 'R. Dosen LSKK Labtek VIII Lantai 2 Institut Teknologi Bandung', 39, 1.9, 51.2, 12.7),
(131, 'VIII2', 'R. Rapat LSKK', 'R. Rapat LSKK Labtek VIII Lantai 2 Institut Teknologi Bandung', 39.1, 7.1, 45.1, 12.7),
(132, 'VIII2', 'R. Praktek LSKK', 'R. Praktek LSKK Labtek VIII Lantai 2 Institut Teknologi Bandung', 51, 1.9, 60.1, 8.5),
(133, 'VIII2', 'T. TK LSKK', 'T. TK LSKK Labtek VIII Lantai 2 Institut Teknologi Bandung', 51, 8.4, 60.1, 12.7),
(134, 'VIII2', 'Internal Corridor', 'Internal Corridor Labtek VIII Lantai 2 Institut Teknologi Bandung', 6.2, 12.6, 100.4, 14.8),
(135, 'VIII2', 'R. Multimedia STEI', 'R. Multimedia STEI Labtek VIII Lantai 2 Institut Teknologi Bandung', 10.7, 14.7, 24.5, 22.9),
(136, 'VIII2', 'R. Jasinfo STEI', 'R. Jasinfo STEI Labtek VIII Lantai 2 Institut Teknologi Bandung', 24.3, 14.7, 30.2, 22.9),
(137, 'VIII2', 'R. Dosen LSKK', 'R. Dosen LSKK Labtek VIII Lantai 2 Institut Teknologi Bandung', 30, 14.7, 51, 22.9),
(138, 'VIII2', 'Lab LSKK', 'Lab LSKK Labtek VIII Lantai 2 Institut Teknologi Bandung', 51, 14.7, 57.1, 22.9),
(139, 'VIII2', 'R. Arsip LSKK', 'R. Arsip LSKK Labtek VIII Lantai 2 Institut Teknologi Bandung', 56.9, 14.7, 60.1, 22.9),
(140, 'VIII2', 'Dapur LSKK', 'Dapur LSKK Labtek VIII Lantai 2 Institut Teknologi Bandung', 60, 14.4, 61.7, 22.8),
(141, 'VIII2', 'R. Labkom / Kelas LSKK', 'R. Labkom / Kelas LSKK Labtek VIII Lantai 2 Institut Teknologi Bandung', 68.8, 1.9, 77.9, 12.7),
(142, 'VIII2', 'Gudang LSKK', 'Gudang LSKK Labtek VIII Lantai 2 Institut Teknologi Bandung', 71.8, 10.4, 78, 12.8),
(143, 'VIII2', 'R. Teknis LSKK', 'R. Teknis LSKK Labtek VIII Lantai 2 Institut Teknologi Bandung', 77.8, 1.9, 83.9, 12.8),
(144, 'VIII2', 'R. Server LSKK', 'R. Server LSKK Labtek VIII Lantai 2 Institut Teknologi Bandung', 77.8, 10.4, 81.8, 12.6),
(145, 'VIII2', 'R. JJCC LSKK', 'R. JJCC LSKK Labtek VIII Lantai 2 Institut Teknologi Bandung', 83.8, 1.9, 92.9, 12.7),
(146, 'VIII2', 'Kelas 90 Umum', 'Kelas 90 Umum Labtek VIII Lantai 2 Institut Teknologi Bandung', 92.8, 1.9, 100.3, 12.7),
(147, 'VIII2', 'R. Lab Robotik', 'R. Lab Robotik Labtek VIII Lantai 2 Institut Teknologi Bandung', 65.6, 14.7, 72, 23),
(148, 'VIII2', 'Lab LSKK', 'Lab LSKK Labtek VIII Lantai 2 Institut Teknologi Bandung', 71.9, 14.7, 83.9, 22.9),
(149, 'VIII2', 'R. Teknis LSKK', 'R. Teknis LSKK Labtek VIII Lantai 2 Institut Teknologi Bandung', 71.8, 19.6, 75, 22.9),
(150, 'VIII2', 'R. S2 dan S3 LSKK', 'R. S2 dan S3 LSKK Labtek VIII Lantai 2 Institut Teknologi Bandung', 83.8, 14.7, 91.5, 23),
(151, 'VIII2', 'Kelas Umum', 'Kelas Umum Labtek VIII Lantai 2 Institut Teknologi Bandung', 95.5, 14.7, 100.4, 22.9),
(152, 'VIII2', 'Labtek VIII Lantai 2', 'Labtek VIII Lantai 2 Institut Teknologi Bandung', 0, 0, 102, 24.4),
(153, 'VIII3', 'R. Dosen', 'R. Dosen Labtek VIII Lantai 3 Institut Teknologi Bandung', 0.1, 0.1, 12.3, 6.2),
(154, 'VIII3', 'R. TA ELKA', 'R. TA ELKA Labtek VIII Lantai 3 Institut Teknologi Bandung', 0.2, 6.1, 12.3, 12.4),
(155, 'VIII3', 'R. Robovis', 'R. Robovis Labtek VIII Lantai 3 Institut Teknologi Bandung', 12.1, 0.2, 18.3, 12.4),
(156, 'VIII3', 'R. Dosen ELKA', 'R. Dosen ELKA Labtek VIII Lantai 3 Institut Teknologi Bandung', 18.2, 0.1, 24.2, 12.3),
(157, 'VIII3', 'R. Penelitian ELKA', 'R. Penelitian ELKA Labtek VIII Lantai 3 Institut Teknologi Bandung', 24.1, 0.1, 30.2, 12.4),
(158, 'VIII3', 'Lab ELKA', 'Lab ELKA Labtek VIII Lantai 3 Institut Teknologi Bandung', 30.1, 0.1, 36.2, 12.4),
(159, 'VIII3', 'R. Dosen ELKA', 'R. Dosen ELKA Labtek VIII Lantai 3 Institut Teknologi Bandung', 36.1, 0.1, 42.2, 9.2),
(160, 'VIII3', 'R. S3 BME', 'R. S3 BME Labtek VIII Lantai 3 Institut Teknologi Bandung', 36.1, 9, 42.2, 12.4),
(161, 'VIII3', 'Lab Multimedia', 'Lab Multimedia Labtek VIII Lantai 3 Institut Teknologi Bandung', 42.1, 0.1, 48.2, 12.4),
(162, 'VIII3', 'R. Dosen ISME', 'R. Dosen ISME Labtek VIII Lantai 3 Institut Teknologi Bandung', 48.1, 6, 51.1, 12.4),
(163, 'VIII3', 'R. Dosen BME', 'R. Dosen BME Labtek VIII Lantai 3 Institut Teknologi Bandung', 48, 0.1, 54.3, 6.2),
(164, 'VIII3', 'R. Rapat BME', 'R. Rapat BME Labtek VIII Lantai 3 Institut Teknologi Bandung', 54.1, 0.1, 60.1, 6.2),
(165, 'VIII3', 'TU BME', 'TU BME Labtek VIII Lantai 3 Institut Teknologi Bandung', 51, 6.1, 60.1, 12.3),
(166, 'VIII3', 'Sekertariat Alumni', 'Sekertariat Alumni Labtek VIII Lantai 3 Institut Teknologi Bandung', 0, 12.2, 4.6, 15.2),
(167, 'VIII3', 'Internal Corridor', 'Internal Corridor Labtek VIII Lantai 3 Institut Teknologi Bandung', 4.5, 12.3, 95.8, 14.6),
(168, 'VIII3', 'Internal Corridor', 'Internal Corridor Labtek VIII Lantai 3 Institut Teknologi Bandung', 60, 0.2, 66.1, 14.5),
(169, 'VIII3', 'R. Alumni STEI', 'R. Alumni STEI Labtek VIII Lantai 3 Institut Teknologi Bandung', 0, 15.1, 6.4, 24),
(170, 'VIII3', 'Balkon', 'Balkon Labtek VIII Lantai 3 Institut Teknologi Bandung', 6.2, 20.9, 10.8, 24),
(171, 'VIII3', 'TU ELKA', 'TU ELKA Labtek VIII Lantai 3 Institut Teknologi Bandung', 10.6, 14.4, 18.3, 19.7),
(172, 'VIII3', 'R. Rapat ELKA', 'R. Rapat ELKA Labtek VIII Lantai 3 Institut Teknologi Bandung', 10.6, 19.6, 18.2, 24),
(173, 'VIII3', 'Lab ELKA', 'Lab ELKA Labtek VIII Lantai 3 Institut Teknologi Bandung', 18.2, 14.4, 24.2, 24),
(174, 'VIII3', 'R. Praktek BME', 'R. Praktek BME Labtek VIII Lantai 3 Institut Teknologi Bandung', 24.1, 14.5, 30.2, 21.1),
(175, 'VIII3', 'R. Dosen BME', 'R. Dosen BME Labtek VIII Lantai 3 Institut Teknologi Bandung', 24.2, 21, 30.2, 24),
(176, 'VIII3', 'R. Optik', 'R. Optik Labtek VIII Lantai 3 Institut Teknologi Bandung', 30.1, 14.4, 36.2, 19.6),
(177, 'VIII3', 'R. Kerja Praktek', 'R. Kerja Praktek Labtek VIII Lantai 3 Institut Teknologi Bandung', 30.1, 19.6, 36.2, 24),
(178, 'VIII3', 'Kelas BME', 'Kelas BME Labtek VIII Lantai 3 Institut Teknologi Bandung', 36, 14.4, 42.2, 24),
(179, 'VIII3', 'R. Dosen ELKA', 'R. Dosen ELKA Labtek VIII Lantai 3 Institut Teknologi Bandung', 42, 14.5, 48.4, 24),
(180, 'VIII3', 'Mushola', 'Mushola Labtek VIII Lantai 3 Institut Teknologi Bandung', 45, 14.4, 48.4, 17.6),
(181, 'VIII3', 'R. Sensor Dasar', 'R. Sensor Dasar Labtek VIII Lantai 3 Institut Teknologi Bandung', 48.2, 14.3, 51.1, 17.7),
(182, 'VIII3', 'R. Gelap Dasar', 'R. Gelap Dasar Labtek VIII Lantai 3 Institut Teknologi Bandung', 48.3, 17.5, 51, 21.1),
(183, 'VIII3', 'TU Lab Dasar', 'TU Lab Dasar Labtek VIII Lantai 3 Institut Teknologi Bandung', 48.3, 14.4, 57, 24),
(184, 'VIII3', 'R. KI Dasar', 'R. KI Dasar Labtek VIII Lantai 3 Institut Teknologi Bandung', 57, 14.4, 61.7, 24),
(185, 'VIII3', 'Dapur', 'Dapur Labtek VIII Lantai 3 Institut Teknologi Bandung', 60, 14.3, 61.6, 17),
(186, 'VIII3', 'Lab Dasar', 'Lab Dasar Labtek VIII Lantai 3 Institut Teknologi Bandung', 66.1, 0, 75.1, 12.3),
(187, 'VIII3', 'R. Asisten Dasar', 'R. Asisten Dasar Labtek VIII Lantai 3 Institut Teknologi Bandung', 72, 0, 75, 7),
(188, 'VIII3', 'ELKA', 'ELKA Labtek VIII Lantai 3 Institut Teknologi Bandung', 75, 0, 78.1, 12.2),
(189, 'VIII3', 'R. Multimedia KKTI', 'R. Multimedia KKTI Labtek VIII Lantai 3 Institut Teknologi Bandung', 78, 0, 83.9, 12.4),
(190, 'VIII3', 'R. Praktek KKTI', 'R. Praktek KKTI Labtek VIII Lantai 3 Institut Teknologi Bandung', 84, 0, 90, 12.2),
(191, 'VIII3', 'R. Rapat KKTI', 'R. Rapat KKTI Labtek VIII Lantai 3 Institut Teknologi Bandung', 90, 0, 96, 6.1),
(192, 'VIII3', 'Bengkel KKTI', 'Bengkel KKTI Labtek VIII Lantai 3 Institut Teknologi Bandung', 90, 6.1, 92.9, 12.2),
(193, 'VIII3', 'Server KKTI', 'Server KKTI Labtek VIII Lantai 3 Institut Teknologi Bandung', 92.9, 6, 96, 12.4),
(194, 'VIII3', 'R. Dosen KKTI', 'R. Dosen KKTI Labtek VIII Lantai 3 Institut Teknologi Bandung', 95.9, 0, 102, 6.2),
(195, 'VIII3', 'R. Tamu KKTI', 'R. Tamu KKTI Labtek VIII Lantai 3 Institut Teknologi Bandung', 95.8, 6, 99, 12.4),
(196, 'VIII3', 'R. Ketua Lab KKTI', 'R. Ketua Lab KKTI Labtek VIII Lantai 3 Institut Teknologi Bandung', 98.8, 6, 102, 12.3),
(197, 'VIII3', 'Lab Dasar', 'Lab Dasar Labtek VIII Lantai 3 Institut Teknologi Bandung', 65.7, 14.4, 75, 24),
(198, 'VIII3', 'R. Asisten Dasar', 'R. Asisten Dasar Labtek VIII Lantai 3 Institut Teknologi Bandung', 74.9, 14.4, 78.1, 17.6),
(199, 'VIII3', 'Dapur Dasar', 'Dapur Dasar Labtek VIII Lantai 3 Institut Teknologi Bandung', 74.9, 17.6, 78, 24),
(200, 'VIII3', 'R. DS ELKA', 'R. DS ELKA Labtek VIII Lantai 3 Institut Teknologi Bandung', 77.9, 14.4, 81.1, 24),
(201, 'VIII3', 'ATK KKTI', 'ATK KKTI Labtek VIII Lantai 3 Institut Teknologi Bandung', 80.9, 14.4, 84, 24),
(202, 'VIII3', 'R. Seminar KKTI', 'R. Seminar KKTI Labtek VIII Lantai 3 Institut Teknologi Bandung', 83.9, 14.4, 91.6, 24),
(203, 'VIII3', 'Gudang KKTI', 'Gudang KKTI Labtek VIII Lantai 3 Institut Teknologi Bandung', 91.4, 20.9, 96, 24),
(204, 'VIII3', 'TU KKTI', 'TU KKTI Labtek VIII Lantai 3 Institut Teknologi Bandung', 95.7, 12.3, 102, 18.1),
(205, 'VIII3', 'R. Seminar KKTI', 'R. Seminar KKTI Labtek VIII Lantai 3 Institut Teknologi Bandung', 95.6, 18, 102, 24),
(206, 'VIII3', 'Labtek VIII Lantai 3', 'Labtek VIII Lantai 3 Institut Teknologi Bandung', 0, 0, 102, 24),
(207, 'VIII4', 'R. Residensi Lab Telematik', 'R. Residensi Lab Telematik Labtek VIII Lantai 4 Institut Teknologi Bandung', 1.2, 6, 5.9, 18.2),
(208, 'VIII4', 'R. Teknisi Lab Telematik', 'R. Teknisi Lab Telematik Labtek VIII Lantai 4 Institut Teknologi Bandung', 5.7, 1.4, 11.9, 12.4),
(209, 'VIII4', 'R. Riset Lab Telematik', 'R. Riset Lab Telematik Labtek VIII Lantai 4 Institut Teknologi Bandung', 5.8, 6, 10.4, 12.4),
(210, 'VIII4', 'R. Huawei', 'R. Huawei Labtek VIII Lantai 4 Institut Teknologi Bandung', 11.7, 1.4, 17.9, 12.3),
(211, 'VIII4', 'R. Kelas Lab. Telematik', 'R. Kelas Lab. Telematik Labtek VIII Lantai 4 Institut Teknologi Bandung', 17.8, 1.4, 23.9, 12.4),
(212, 'VIII4', 'R. Jaringan Lab Telematik', 'R. Jaringan Lab Telematik Labtek VIII Lantai 4 Institut Teknologi Bandung', 23.8, 1.5, 29.9, 12.4),
(213, 'VIII4', 'R. Residensi S2 dan S3', 'R. Residensi S2 dan S3 Labtek VIII Lantai 4 Institut Teknologi Bandung', 29.8, 1.5, 35.9, 12.4),
(214, 'VIII4', 'R. Penelitian Lab. Telematik', 'R. Penelitian Lab. Telematik Labtek VIII Lantai 4 Institut Teknologi Bandung', 35.9, 1.4, 42, 12.4),
(215, 'VIII4', 'R. Rapat Lab. Telematik', 'R. Rapat Lab. Telematik Labtek VIII Lantai 4 Institut Teknologi Bandung', 41.8, 1.4, 47.9, 12.4),
(216, 'VIII4', 'R. Kelas Lab. Telematik', 'R. Kelas Lab. Telematik Labtek VIII Lantai 4 Institut Teknologi Bandung', 47.9, 1.4, 54, 12.3),
(217, 'VIII4', 'R. Compnet', 'R. Compnet Labtek VIII Lantai 4 Institut Teknologi Bandung', 53.9, 1.4, 59.9, 12.3),
(218, 'VIII4', 'Internal Corridor', 'Internal Corridor Labtek VIII Lantai 4 Institut Teknologi Bandung', 5.7, 12.1, 95.8, 14.5),
(219, 'VIII4', 'Internal Corridor', 'Internal Corridor Labtek VIII Lantai 4 Institut Teknologi Bandung', 59.9, 1.3, 66, 12.4),
(220, 'VIII4', 'R. Kelas S2 Lab. Telematik', 'R. Kelas S2 Lab. Telematik Labtek VIII Lantai 4 Institut Teknologi Bandung', 10.2, 14.4, 17.9, 22.7),
(221, 'VIII4', 'R. Dosen Lab Telematik', 'R. Dosen Lab Telematik Labtek VIII Lantai 4 Institut Teknologi Bandung', 17.7, 14.5, 26.9, 22.7),
(222, 'VIII4', 'R. Tamu Lab Telematik', 'R. Tamu Lab Telematik Labtek VIII Lantai 4 Institut Teknologi Bandung', 20.8, 14.4, 26.9, 19.4),
(223, 'VIII4', 'R. TA Lab. Telematik', 'R. TA Lab. Telematik Labtek VIII Lantai 4 Institut Teknologi Bandung', 26.8, 14.4, 35.9, 22.7),
(224, 'VIII4', 'R. Server Lab Telematik', 'R. Server Lab Telematik Labtek VIII Lantai 4 Institut Teknologi Bandung', 35.8, 14.4, 38.9, 22.7),
(225, 'VIII4', 'R. Lab', 'R. Lab Labtek VIII Lantai 4 Institut Teknologi Bandung', 38.8, 14.4, 47.9, 22.7),
(226, 'VIII4', 'R. Dosen Lab Telematik', 'R. Dosen Lab Telematik Labtek VIII Lantai 4 Institut Teknologi Bandung', 47.8, 14.4, 54, 22.7),
(227, 'VIII4', 'TU Lab Telematik', 'TU Lab Telematik Labtek VIII Lantai 4 Institut Teknologi Bandung', 53.9, 14.4, 61.5, 22.7),
(228, 'VIII4', 'R. Ketua Lab Telematika', 'R. Ketua Lab Telematika Labtek VIII Lantai 4 Institut Teknologi Bandung', 53.9, 17.6, 57, 22.8),
(229, 'VIII4', 'R. Dosen Lab. Sinyal dan Sistem / KKTI', 'R. Dosen Lab. Sinyal dan Sistem / KKTI Labtek VIII Lantai 4 Institut Teknologi Bandung', 65.9, 1.5, 72, 4.7),
(230, 'VIII4', 'R. Penelitian Lab. Sinyal dan Sistem / KKTI', 'R. Penelitian Lab. Sinyal dan Sistem / KKTI Labtek VIII Lantai 4 Institut Teknologi Bandung', 65.9, 4.6, 71.9, 12.3),
(231, 'VIII4', 'R. AV. RG. Lab Sinyal dan Sistem / KKTI', 'R. AV. RG. Lab Sinyal dan Sistem / KKTI Labtek VIII Lantai 4 Institut Teknologi Bandung', 71.9, 1.4, 84, 12.3),
(232, 'VIII4', 'R. Dosen Lab. Sinyal dan Sistem / KKTI', 'R. Dosen Lab. Sinyal dan Sistem / KKTI Labtek VIII Lantai 4 Institut Teknologi Bandung', 77.9, 1.4, 84, 9.2),
(233, 'VIII4', 'R. Dosen Lab. Sinyal dan Sistem / KKTI', 'R. Dosen Lab. Sinyal dan Sistem / KKTI Labtek VIII Lantai 4 Institut Teknologi Bandung', 84, 1.4, 96.1, 4.7),
(234, 'VIII4', 'R. Residensi S1 S2 S3 Lab Sinyal dan Sistem / KKTI', 'R. Residensi S1 S2 S3 Lab Sinyal dan Sistem / KKTI Labtek VIII Lantai 4 Institut Teknologi Bandung', 83.9, 4.6, 90.1, 12.4),
(235, 'VIII4', 'R. Residensi S1 S2 Lab Sinyal dan Sistem / KKTI', 'R. Residensi S1 S2 Lab Sinyal dan Sistem / KKTI Labtek VIII Lantai 4 Institut Teknologi Bandung', 90, 4.5, 96.1, 12.4),
(236, 'VIII4', 'R. Kedap', 'R. Kedap Labtek VIII Lantai 4 Institut Teknologi Bandung', 93.8, 10.1, 96.1, 12.3),
(237, 'VIII4', 'R. Penelitian S2 dan S3 Lab Sinyal dan Sistem / KKTI', 'R. Penelitian S2 dan S3 Lab Sinyal dan Sistem / KKTI Labtek VIII Lantai 4 Institut Teknologi Bandung', 96, 6, 100.6, 18.2),
(238, 'VIII4', 'R. Penelitian Lab. Sinyal dan Sistem / KKTI', 'R. Penelitian Lab. Sinyal dan Sistem / KKTI Labtek VIII Lantai 4 Institut Teknologi Bandung', 65.6, 14.4, 75, 22.7),
(239, 'VIII4', 'R. Dosen Lab. Sinyal dan Sistem / KKTI', 'R. Dosen Lab. Sinyal dan Sistem / KKTI Labtek VIII Lantai 4 Institut Teknologi Bandung', 71.9, 18.6, 75, 22.6),
(240, 'VIII4', 'R. TA S2, S3 Lab Sinyal dan Sistem / KKTI', 'R. TA S2, S3 Lab Sinyal dan Sistem / KKTI Labtek VIII Lantai 4 Institut Teknologi Bandung', 74.9, 14.4, 84, 22.7),
(241, 'VIII4', 'R. Penelitian S2, S3 INS', 'R. Penelitian S2, S3 INS Labtek VIII Lantai 4 Institut Teknologi Bandung', 83.9, 14.4, 91.6, 18.6),
(242, 'VIII4', 'R. Dosen Lab. Sinyal dan Sistem / KKTI', 'R. Dosen Lab. Sinyal dan Sistem / KKTI Labtek VIII Lantai 4 Institut Teknologi Bandung', 83.9, 18.5, 91.6, 22.7),
(243, 'VIII4', 'Labtek VIII Lantai 4', 'Labtek VIII Lantai 4 Institut Teknologi Bandung', 0, 0, 102, 23.7);

-- --------------------------------------------------------

--
-- Table structure for table `lokasi`
--

CREATE TABLE `lokasi` (
  `id` varchar(100) NOT NULL,
  `id_lokasi` varchar(100) DEFAULT NULL,
  `id_role` varchar(100) DEFAULT NULL,
  `denah_file` varchar(100) NOT NULL,
  `denah_lebar` int(11) NOT NULL,
  `deskripsi` text,
  `denah_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lokasi`
--

INSERT INTO `lokasi` (`id`, `id_lokasi`, `id_role`, `denah_file`, `denah_lebar`, `deskripsi`, `denah_url`) VALUES
('V2', NULL, NULL, 'V2.png', 102, 'Labtek V lantai 2 Institut Teknologi Bandung', NULL),
('V3', NULL, NULL, 'V3.png', 102, 'Labtek V lantai 3 Institut Teknologi Bandung', NULL),
('V4', NULL, NULL, 'V4.png', 102, 'Labtek V lantai 4 Institut Teknologi Bandung', NULL),
('VIII2', NULL, NULL, 'VIII2.png', 102, 'Labtek VIII lantai 2 Institut Teknologi Bandung', NULL),
('VIII3', NULL, NULL, 'VIII3.png', 102, 'Labtek VIII lantai 3 Institut Teknologi Bandung', NULL),
('VIII4', NULL, NULL, 'VIII4.png', 102, 'Labtek VIII lantai 4 Institut Teknologi Bandung', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` varchar(100) NOT NULL,
  `deskripsi` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `deskripsi`) VALUES
('admin', 'Administrator Role');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` varchar(100) NOT NULL,
  `password` varchar(700) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `password`) VALUES
('admin', 'Administrator User');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `id_user` varchar(100) NOT NULL,
  `id_role` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`id_user`, `id_role`) VALUES
('admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `whitelist`
--

CREATE TABLE `whitelist` (
  `id` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `whitelist`
--

INSERT INTO `whitelist` (`id`) VALUES
('cb10023f-a318-3394-4199-a8730c7c1aec');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `geofence`
--
ALTER TABLE `geofence`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_lokasi` (`id_lokasi`);

--
-- Indexes for table `lokasi`
--
ALTER TABLE `lokasi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_lokasi` (`id_lokasi`),
  ADD KEY `id_role` (`id_role`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD KEY `FK2aam9nt2tv8vcfymi3jo9c314` (`id_role`),
  ADD KEY `FKfhxaael2m459kbk8lv8smr5iv` (`id_user`);

--
-- Indexes for table `whitelist`
--
ALTER TABLE `whitelist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `geofence`
--
ALTER TABLE `geofence`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=244;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `geofence`
--
ALTER TABLE `geofence`
  ADD CONSTRAINT `geofence_ibfk_1` FOREIGN KEY (`id_lokasi`) REFERENCES `lokasi` (`id`);

--
-- Constraints for table `lokasi`
--
ALTER TABLE `lokasi`
  ADD CONSTRAINT `lokasi_ibfk_1` FOREIGN KEY (`id_lokasi`) REFERENCES `lokasi` (`id`),
  ADD CONSTRAINT `lokasi_ibfk_2` FOREIGN KEY (`id_role`) REFERENCES `role` (`id`);

--
-- Constraints for table `user_role`
--
ALTER TABLE `user_role`
  ADD CONSTRAINT `FK2aam9nt2tv8vcfymi3jo9c314` FOREIGN KEY (`id_role`) REFERENCES `role` (`id`),
  ADD CONSTRAINT `FKfhxaael2m459kbk8lv8smr5iv` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`id_role`) REFERENCES `role` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
