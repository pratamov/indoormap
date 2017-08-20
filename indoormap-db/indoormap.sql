-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 28, 2017 at 09:22 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `indoormap`
--

-- --------------------------------------------------------

--
-- Table structure for table `building`
--

CREATE TABLE `building` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `latitude` varchar(100) NOT NULL,
  `longitude` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `building`
--

INSERT INTO `building` (`id`, `title`, `description`, `latitude`, `longitude`) VALUES
(1, 'Gedung Achmad Bakrie (Labtek VIII)', 'Institut Teknologi Bandung Labtek VIII, Jl. Ganesha No. 10, Lebak Siliwangi, Coblong, Lb. Siliwangi, Coblong, Kota Bandung, Jawa Barat 40132', '-6.890618', '107.610993'),
(2, 'Gedung Benny Subianto (Labtek V)', 'Institut Teknologi Bandung Labtek V, Jl. Ganesha No. 10, Lebak Siliwangi, Coblong, Lb. Siliwangi, Coblong, Kota Bandung, Jawa Barat 40132', '-6.890566', '107.609957');

-- --------------------------------------------------------

--
-- Table structure for table `floor`
--

CREATE TABLE `floor` (
  `id` int(11) NOT NULL,
  `id_building` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(100) NOT NULL,
  `width` double NOT NULL,
  `height` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `floor`
--

INSERT INTO `floor` (`id`, `id_building`, `title`, `description`, `image`, `width`, `height`) VALUES
(1, 1, 'Labtek VIII Lantai 2', '', 'http://5.135.160.204/VIII2.png', 102, 24),
(2, 1, 'Labtek VIII Lantai 3', '', 'http://5.135.160.204/VIII3.png', 102, 24),
(3, 1, 'Labtek VIII Lantai 4', '', 'http://5.135.160.204/VIII4.png', 102, 24),
(4, 2, 'Labtek V Lantai 2', '', 'http://5.135.160.204/VIII2.png', 102, 24),
(5, 2, 'Labtek V Lantai 3', '', 'http://5.135.160.204/VIII3.png', 102, 24),
(6, 2, 'Labtek V Lantai 4', '', 'http://5.135.160.204/VIII4.png', 102, 24);

-- --------------------------------------------------------

--
-- Stand-in structure for view `get_building`
-- (See below for the actual view)
--
CREATE TABLE `get_building` (
`id` int(11)
,`title` varchar(100)
,`description` text
,`latitude` varchar(100)
,`longitude` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `get_floor`
-- (See below for the actual view)
--
CREATE TABLE `get_floor` (
`id` int(11)
,`title` varchar(100)
,`description` text
,`image` varchar(100)
,`width` double
,`height` double
,`id_building` int(11)
,`title_building` varchar(100)
,`description_building` text
,`latitude` varchar(100)
,`longitude` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `get_ibeacon`
-- (See below for the actual view)
--
CREATE TABLE `get_ibeacon` (
`uuid` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `get_room`
-- (See below for the actual view)
--
CREATE TABLE `get_room` (
`id` int(11)
,`title` varchar(100)
,`description` text
,`x1` double
,`x2` double
,`y1` double
,`y2` double
,`id_floor` int(11)
,`title_floor` varchar(100)
,`description_floor` text
,`id_building` int(11)
,`title_building` varchar(100)
,`description_building` text
,`latitude` varchar(100)
,`longitude` varchar(100)
);

-- --------------------------------------------------------

--
-- Table structure for table `ibeacon`
--

CREATE TABLE `ibeacon` (
  `uuid` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ibeacon`
--

INSERT INTO `ibeacon` (`uuid`) VALUES
('cb10023f-a318-3394-4199-a8730c7c1aec');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `id` int(11) NOT NULL,
  `id_floor` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `x1` double NOT NULL,
  `x2` double NOT NULL,
  `y1` double NOT NULL,
  `y2` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`id`, `id_floor`, `title`, `description`, `x1`, `x2`, `y1`, `y2`) VALUES
(1, 4, 'R. Penelitian', 'R. Penelitian Labtek V Lantai 2 Institut Teknologi Bandung', 4.4, 12, 1.4, 12.2),
(2, 4, 'R. Seminar', 'R. Seminar Labtek V Lantai 2 Institut Teknologi Bandung', 11.9, 18.1, 1.4, 12.1),
(3, 4, 'Lab Programming', 'Lab Programming Labtek V Lantai 2 Institut Teknologi Bandung', 17.8, 24, 1.4, 12.1),
(4, 4, 'R. Dosen', 'R. Dosen Labtek V Lantai 2 Institut Teknologi Bandung', 23.9, 30, 1.5, 9.6),
(5, 4, 'R. Diskusi', 'R. Diskusi Labtek V Lantai 2 Institut Teknologi Bandung', 23.9, 30, 9.5, 12),
(6, 4, 'Dapur', 'Dapur Labtek V Lantai 2 Institut Teknologi Bandung', 29.9, 31.6, 5.9, 12),
(7, 4, 'Internal Corridor', 'Internal Corridor Labtek V Lantai 2 Institut Teknologi Bandung', 10.4, 30, 12, 15.1),
(8, 4, 'R. Dosen', 'R. Dosen Labtek V Lantai 2 Institut Teknologi Bandung', 10.4, 21, 15, 22.5),
(9, 4, 'Lab. Basis Data', 'Lab. Basis Data Labtek V Lantai 2 Institut Teknologi Bandung', 20.9, 27.8, 15, 22.6),
(10, 4, 'TU', 'TU Labtek V Lantai 2 Institut Teknologi Bandung', 27.8, 31.5, 15, 22.6),
(11, 4, 'Lab Thesis', 'Lab Thesis Labtek V Lantai 2 Institut Teknologi Bandung', 42, 48.1, 1.4, 12.1),
(12, 4, 'Lab Thesis', 'Lab Thesis Labtek V Lantai 2 Institut Teknologi Bandung', 48, 54.1, 1.5, 12.1),
(13, 4, 'Lab Komputer', 'Lab Komputer Labtek V Lantai 2 Institut Teknologi Bandung', 54, 60.1, 1.4, 12.1),
(14, 4, 'R. Bersama', 'R. Bersama Labtek V Lantai 2 Institut Teknologi Bandung', 60, 66.1, 1.5, 12.1),
(15, 4, 'R. Rapat', 'R. Rapat Labtek V Lantai 2 Institut Teknologi Bandung', 66, 69.2, 1.5, 6.7),
(16, 4, 'R. Rapat', 'R. Rapat Labtek V Lantai 2 Institut Teknologi Bandung', 66.1, 69.1, 6.7, 12.1),
(17, 4, 'R. Rapat Dekan', 'R. Rapat Dekan Labtek V Lantai 2 Institut Teknologi Bandung', 69.1, 78.1, 1.5, 12.1),
(18, 4, 'R. Administrasi', 'R. Administrasi Labtek V Lantai 2 Institut Teknologi Bandung', 78.1, 90.2, 1.4, 12.1),
(19, 4, 'R. SI', 'R. SI Labtek V Lantai 2 Institut Teknologi Bandung', 90.1, 97.7, 1.6, 12.1),
(20, 4, 'Internal Corridor', 'Internal Corridor Labtek V Lantai 2 Institut Teknologi Bandung', 41.9, 90.3, 12, 15.1),
(21, 4, 'Gudang', 'Gudang Labtek V Lantai 2 Institut Teknologi Bandung', 40.4, 48.1, 15, 22.6),
(22, 4, 'R. Diskusi S2', 'R. Diskusi S2 Labtek V Lantai 2 Institut Teknologi Bandung', 47.9, 52.4, 14.9, 19),
(23, 4, 'R. Diskusi S2', 'R. Diskusi S2 Labtek V Lantai 2 Institut Teknologi Bandung', 52.4, 57.1, 15, 19.1),
(24, 4, 'R. Diskusi S2', 'R. Diskusi S2 Labtek V Lantai 2 Institut Teknologi Bandung', 48, 52.4, 19, 22.6),
(25, 4, 'R. Diskusi S2', 'R. Diskusi S2 Labtek V Lantai 2 Institut Teknologi Bandung', 52.3, 57.1, 19, 22.6),
(26, 4, 'R. Arsip', 'R. Arsip Labtek V Lantai 2 Institut Teknologi Bandung', 57, 61.6, 15, 19),
(27, 4, 'R. Arsip', 'R. Arsip Labtek V Lantai 2 Institut Teknologi Bandung', 57, 61.6, 19, 22.6),
(28, 4, 'R. Arsip', 'R. Arsip Labtek V Lantai 2 Institut Teknologi Bandung', 61.5, 66.1, 15, 22.6),
(29, 4, 'R. Dosen', 'R. Dosen Labtek V Lantai 2 Institut Teknologi Bandung', 66, 69.2, 15, 18.1),
(30, 4, 'R. Dosen', 'R. Dosen Labtek V Lantai 2 Institut Teknologi Bandung', 69.1, 72.1, 15, 18),
(31, 4, 'R. Dosen', 'R. Dosen Labtek V Lantai 2 Institut Teknologi Bandung', 72.1, 75.2, 15, 18.1),
(32, 4, 'R. Dosen', 'R. Dosen Labtek V Lantai 2 Institut Teknologi Bandung', 66, 69.2, 19.5, 22.6),
(33, 4, 'R. Dosen', 'R. Dosen Labtek V Lantai 2 Institut Teknologi Bandung', 69, 72.2, 19.5, 22.6),
(34, 4, 'R. Dosen', 'R. Dosen Labtek V Lantai 2 Institut Teknologi Bandung', 72.1, 75.2, 19.5, 22.6),
(35, 4, 'R. Dosen', 'R. Dosen Labtek V Lantai 2 Institut Teknologi Bandung', 75.1, 78.2, 19.6, 22.5),
(36, 4, 'R. Administrasi', 'R. Administrasi Labtek V Lantai 2 Institut Teknologi Bandung', 75.1, 84.2, 15.1, 22.5),
(37, 4, 'R. Seminar', 'R. Seminar Labtek V Lantai 2 Institut Teknologi Bandung', 84.1, 91.8, 14.9, 22.6),
(38, 4, 'Labtek V Lantai 2', 'Labtek V Lantai 2 Institut Teknologi Bandung', 0, 102, 0, 23.9),
(39, 5, 'R. Kelas', 'R. Kelas Labtek V Lantai 3 Institut Teknologi Bandung', 0, 6.3, 0, 12.2),
(40, 5, 'R. Baca', 'R. Baca Labtek V Lantai 3 Institut Teknologi Bandung', 6.2, 12.3, 0.1, 12.2),
(41, 5, 'R. Baca', 'R. Baca Labtek V Lantai 3 Institut Teknologi Bandung', 12.2, 18.3, 0.2, 12.2),
(42, 5, 'Perpustakaan', 'Perpustakaan Labtek V Lantai 3 Institut Teknologi Bandung', 18.1, 24.3, 0.2, 12.2),
(43, 5, 'R. Kelas', 'R. Kelas Labtek V Lantai 3 Institut Teknologi Bandung', 24.2, 30.3, 0.1, 12.1),
(44, 5, 'R. Kelas', 'R. Kelas Labtek V Lantai 3 Institut Teknologi Bandung', 30.2, 36.2, 0.2, 12.2),
(45, 5, 'Rest Room', 'Rest Room Labtek V Lantai 3 Institut Teknologi Bandung', 36.1, 42.2, 0.2, 4.9),
(46, 5, 'Internal Corridor', 'Internal Corridor Labtek V Lantai 3 Institut Teknologi Bandung', 36.2, 42.2, 4.8, 15.1),
(47, 5, 'Internal Corridor', 'Internal Corridor Labtek V Lantai 3 Institut Teknologi Bandung', 0.3, 102, 12.2, 15.2),
(48, 5, 'R. Kelas', 'R. Kelas Labtek V Lantai 3 Institut Teknologi Bandung', 0, 6.4, 15.2, 24.2),
(49, 5, 'R. Seminar', 'R. Seminar Labtek V Lantai 3 Institut Teknologi Bandung', 10.5, 15.3, 15.1, 24.2),
(50, 5, 'R. Kelas', 'R. Kelas Labtek V Lantai 3 Institut Teknologi Bandung', 15.1, 24.2, 15.1, 24.2),
(51, 5, 'R. Kelas', 'R. Kelas Labtek V Lantai 3 Institut Teknologi Bandung', 24.1, 30.2, 15.1, 24.2),
(52, 5, 'R. Kelas', 'R. Kelas Labtek V Lantai 3 Institut Teknologi Bandung', 30.1, 36.5, 15.1, 24.2),
(53, 5, 'R. Kelas', 'R. Kelas Labtek V Lantai 3 Institut Teknologi Bandung', 42, 48.1, 0, 12.1),
(54, 5, 'R. Server', 'R. Server Labtek V Lantai 3 Institut Teknologi Bandung', 48.1, 54.2, 0, 5.6),
(55, 5, 'R. OSSC', 'R. OSSC Labtek V Lantai 3 Institut Teknologi Bandung', 54.1, 60.2, 0, 5.6),
(56, 5, 'R. Rapat', 'R. Rapat Labtek V Lantai 3 Institut Teknologi Bandung', 48.1, 55.6, 5.6, 12.2),
(57, 5, 'R. Dosen', 'R. Dosen Labtek V Lantai 3 Institut Teknologi Bandung', 55.6, 60, 5.6, 9),
(58, 5, 'R. SDM', 'R. SDM Labtek V Lantai 3 Institut Teknologi Bandung', 55.5, 60.2, 9.1, 12.2),
(59, 5, 'R. Dosen', 'R. Dosen Labtek V Lantai 3 Institut Teknologi Bandung', 60.1, 63.1, 0, 3.6),
(60, 5, 'R. Dosen', 'R. Dosen Labtek V Lantai 3 Institut Teknologi Bandung', 63.1, 66, 0, 3.6),
(61, 5, 'R. Penelitian Flu Burung', 'R. Penelitian Flu Burung Labtek V Lantai 3 Institut Teknologi Bandung', 60.1, 66, 3.7, 12.2),
(62, 5, 'Bengkel', 'Bengkel Labtek V Lantai 3 Institut Teknologi Bandung', 66, 81, 0, 6.1),
(63, 5, 'R. Penelitian', 'R. Penelitian Labtek V Lantai 3 Institut Teknologi Bandung', 66.1, 72, 6.2, 12.2),
(64, 5, 'Gudang', 'Gudang Labtek V Lantai 3 Institut Teknologi Bandung', 75, 81, 6.1, 12.1),
(65, 5, 'Bengkel', 'Bengkel Labtek V Lantai 3 Institut Teknologi Bandung', 72, 75.2, 6.1, 12.2),
(66, 5, 'R. Kelas', 'R. Kelas Labtek V Lantai 3 Institut Teknologi Bandung', 81, 90.1, 0.2, 12.2),
(67, 5, 'Gudang', 'Gudang Labtek V Lantai 3 Institut Teknologi Bandung', 84, 90.1, 6.1, 12.2),
(68, 5, 'Lab MIC', 'Lab MIC Labtek V Lantai 3 Institut Teknologi Bandung', 90, 102, 0, 12.1),
(69, 5, 'R. Diskusi', 'R. Diskusi Labtek V Lantai 3 Institut Teknologi Bandung', 40.5, 48, 15.2, 24.2),
(70, 5, 'R. Seminar', 'R. Seminar Labtek V Lantai 3 Institut Teknologi Bandung', 47.9, 51.2, 15.1, 24.2),
(71, 5, 'R. Diskusi', 'R. Diskusi Labtek V Lantai 3 Institut Teknologi Bandung', 51.1, 54.2, 15, 20.1),
(72, 5, 'Mushola', 'Mushola Labtek V Lantai 3 Institut Teknologi Bandung', 51, 54.2, 20, 24.2),
(73, 5, 'Lab Sistem Informatika', 'Lab Sistem Informatika Labtek V Lantai 3 Institut Teknologi Bandung', 54.2, 60, 15, 24.2),
(74, 5, 'R. Dosen', 'R. Dosen Labtek V Lantai 3 Institut Teknologi Bandung', 60, 66.2, 15, 24.2),
(75, 5, 'Lab Dasar', 'Lab Dasar Labtek V Lantai 3 Institut Teknologi Bandung', 65.9, 87, 15, 24.2),
(76, 5, 'Lab Dasar', 'Lab Dasar Labtek V Lantai 3 Institut Teknologi Bandung', 86.9, 91.5, 15.1, 24.2),
(77, 5, 'Lab MIC', 'Lab MIC Labtek V Lantai 3 Institut Teknologi Bandung', 95.6, 102, 15.1, 24.2),
(78, 5, 'Labtek V Lantai 3', 'Labtek V Lantai 3 Institut Teknologi Bandung', 0, 102, 0, 24.2),
(79, 6, 'R. Dosen', 'R. Dosen Labtek V Lantai 4 Institut Teknologi Bandung', 6.2, 15.3, 1.6, 12.3),
(80, 6, 'Lab Sister', 'Lab Sister Labtek V Lantai 4 Institut Teknologi Bandung', 15.2, 21.2, 1.8, 12.3),
(81, 6, 'R. Diskusi', 'R. Diskusi Labtek V Lantai 4 Institut Teknologi Bandung', 12.1, 18.3, 9.2, 12.2),
(82, 6, 'R. Dosen + Server', 'R. Dosen + Server Labtek V Lantai 4 Institut Teknologi Bandung', 21.1, 24.2, 1.7, 7.4),
(83, 6, 'Mushola', 'Mushola Labtek V Lantai 4 Institut Teknologi Bandung', 24.2, 27.2, 1.7, 4.8),
(84, 6, 'R. Dosen', 'R. Dosen Labtek V Lantai 4 Institut Teknologi Bandung', 27.1, 30.4, 1.7, 4.8),
(85, 6, 'Lab LRK', 'Lab LRK Labtek V Lantai 4 Institut Teknologi Bandung', 24.2, 30.4, 4.7, 12.3),
(86, 6, 'R. Dosen', 'R. Dosen Labtek V Lantai 4 Institut Teknologi Bandung', 30.3, 36.2, 1.8, 12.3),
(87, 6, 'Internal Corridor', 'Internal Corridor Labtek V Lantai 4 Institut Teknologi Bandung', 6.3, 36.1, 12.2, 14.2),
(88, 6, 'Internal Corridor', 'Internal Corridor Labtek V Lantai 4 Institut Teknologi Bandung', 36, 95.6, 12.1, 15.2),
(89, 6, 'Internal Corridor', 'Internal Corridor Labtek V Lantai 4 Institut Teknologi Bandung', 35.9, 42, 1.6, 12.3),
(90, 6, 'R. Rapat', 'R. Rapat Labtek V Lantai 4 Institut Teknologi Bandung', 10.7, 18.3, 14.2, 22.8),
(91, 6, 'R. Dosen', 'R. Dosen Labtek V Lantai 4 Institut Teknologi Bandung', 18.1, 27.1, 14.2, 22.8),
(92, 6, 'Lab Gaib', 'Lab Gaib Labtek V Lantai 4 Institut Teknologi Bandung', 27, 33.1, 14.2, 22.8),
(93, 6, 'R. Diskusi', 'R. Diskusi Labtek V Lantai 4 Institut Teknologi Bandung', 33, 36.4, 14.2, 18.4),
(94, 6, 'R. Dosen', 'R. Dosen Labtek V Lantai 4 Institut Teknologi Bandung', 33.1, 36.3, 18.4, 22.7),
(95, 6, 'Mushola', 'Mushola Labtek V Lantai 4 Institut Teknologi Bandung', 42.1, 45.1, 1.7, 7.3),
(96, 6, 'Dapur', 'Dapur Labtek V Lantai 4 Institut Teknologi Bandung', 42, 45.1, 7.2, 12.3),
(97, 6, 'Lab RPL', 'Lab RPL Labtek V Lantai 4 Institut Teknologi Bandung', 45, 51.1, 1.7, 12.3),
(98, 6, 'R. Dosen', 'R. Dosen Labtek V Lantai 4 Institut Teknologi Bandung', 50.9, 60, 1.7, 12.3),
(99, 6, 'R. Diskusi', 'R. Diskusi Labtek V Lantai 4 Institut Teknologi Bandung', 50.9, 54.2, 6.9, 12.2),
(100, 6, 'Lab Dasar', 'Lab Dasar Labtek V Lantai 4 Institut Teknologi Bandung', 59.9, 69, 1.7, 12.3),
(101, 6, 'Lab Dasar', 'Lab Dasar Labtek V Lantai 4 Institut Teknologi Bandung', 68.8, 83.9, 1.6, 12.2),
(102, 6, 'Lab Dasar', 'Lab Dasar Labtek V Lantai 4 Institut Teknologi Bandung', 83.8, 89.8, 1.6, 12.3),
(103, 6, 'HMS', 'HMS Labtek V Lantai 4 Institut Teknologi Bandung', 89.7, 95.8, 1.7, 12.2),
(104, 6, 'R. Multimedia', 'R. Multimedia Labtek V Lantai 4 Institut Teknologi Bandung', 40.4, 51.1, 15.2, 22.8),
(105, 6, 'TU', 'TU Labtek V Lantai 4 Institut Teknologi Bandung', 50.9, 54.1, 15.2, 22.8),
(106, 6, 'R. Administrasi', 'R. Administrasi Labtek V Lantai 4 Institut Teknologi Bandung', 54, 60, 15.2, 22.7),
(107, 6, 'Mushola', 'Mushola Labtek V Lantai 4 Institut Teknologi Bandung', 56.7, 63.2, 15.2, 18.3),
(108, 6, 'R. Server', 'R. Server Labtek V Lantai 4 Institut Teknologi Bandung', 59.9, 66, 15.1, 22.8),
(109, 6, 'R. Rapat', 'R. Rapat Labtek V Lantai 4 Institut Teknologi Bandung', 65.9, 71.9, 15.2, 19.6),
(110, 6, 'R. Dosen', 'R. Dosen Labtek V Lantai 4 Institut Teknologi Bandung', 65.8, 72, 19.6, 22.7),
(111, 6, 'R. Dosen', 'R. Dosen Labtek V Lantai 4 Institut Teknologi Bandung', 71.8, 77.8, 15.2, 19.7),
(112, 6, 'R. Rapat', 'R. Rapat Labtek V Lantai 4 Institut Teknologi Bandung', 71.8, 78, 19.5, 22.8),
(113, 6, 'Lab Thesis S3', 'Lab Thesis S3 Labtek V Lantai 4 Institut Teknologi Bandung', 77.7, 83.8, 15.1, 22.8),
(114, 6, 'Gudang', 'Gudang Labtek V Lantai 4 Institut Teknologi Bandung', 83.7, 91.4, 15.1, 22.8),
(115, 6, 'Labtek V Lantai 4', 'Labtek V Lantai 4 Institut Teknologi Bandung', 0, 102, 0, 24.1),
(116, 1, 'ADM STEI', 'ADM STEI Labtek VIII Lantai 2 Institut Teknologi Bandung', 6.2, 15.4, 1.9, 12.7),
(117, 1, 'WDA', 'WDA Labtek VIII Lantai 2 Institut Teknologi Bandung', 15.2, 18.3, 1.9, 8.1),
(118, 1, 'Dekan STEI', 'Dekan STEI Labtek VIII Lantai 2 Institut Teknologi Bandung', 18.2, 24.2, 2, 7.9),
(119, 1, 'RDM', 'RDM Labtek VIII Lantai 2 Institut Teknologi Bandung', 15.2, 18.3, 8.1, 12.7),
(120, 1, 'Kabag TU STEI', 'Kabag TU STEI Labtek VIII Lantai 2 Institut Teknologi Bandung', 18.2, 21.3, 8, 12.7),
(121, 1, 'WDSD STEI', 'WDSD STEI Labtek VIII Lantai 2 Institut Teknologi Bandung', 21.2, 24.2, 7.8, 12.6),
(122, 1, 'R. Rapat STEI', 'R. Rapat STEI Labtek VIII Lantai 2 Institut Teknologi Bandung', 24.2, 36.2, 1.8, 12.7),
(123, 1, 'Mushola STEI', 'Mushola STEI Labtek VIII Lantai 2 Institut Teknologi Bandung', 36, 39.1, 1.9, 7.1),
(124, 1, 'Gudang STEI', 'Gudang STEI Labtek VIII Lantai 2 Institut Teknologi Bandung', 36.1, 39.1, 7.1, 12.7),
(125, 1, 'R. Dosen LSKK', 'R. Dosen LSKK Labtek VIII Lantai 2 Institut Teknologi Bandung', 39, 51.2, 1.9, 12.7),
(126, 1, 'R. Rapat LSKK', 'R. Rapat LSKK Labtek VIII Lantai 2 Institut Teknologi Bandung', 39.1, 45.1, 7.1, 12.7),
(127, 1, 'R. Praktek LSKK', 'R. Praktek LSKK Labtek VIII Lantai 2 Institut Teknologi Bandung', 51, 60.1, 1.9, 8.5),
(128, 1, 'T. TK LSKK', 'T. TK LSKK Labtek VIII Lantai 2 Institut Teknologi Bandung', 51, 60.1, 8.4, 12.7),
(129, 1, 'Internal Corridor', 'Internal Corridor Labtek VIII Lantai 2 Institut Teknologi Bandung', 6.2, 100.4, 12.6, 14.8),
(130, 1, 'R. Multimedia STEI', 'R. Multimedia STEI Labtek VIII Lantai 2 Institut Teknologi Bandung', 10.7, 24.5, 14.7, 22.9),
(131, 1, 'R. Jasinfo STEI', 'R. Jasinfo STEI Labtek VIII Lantai 2 Institut Teknologi Bandung', 24.3, 30.2, 14.7, 22.9),
(132, 1, 'R. Dosen LSKK', 'R. Dosen LSKK Labtek VIII Lantai 2 Institut Teknologi Bandung', 30, 51, 14.7, 22.9),
(133, 1, 'Lab LSKK', 'Lab LSKK Labtek VIII Lantai 2 Institut Teknologi Bandung', 51, 57.1, 14.7, 22.9),
(134, 1, 'R. Arsip LSKK', 'R. Arsip LSKK Labtek VIII Lantai 2 Institut Teknologi Bandung', 56.9, 60.1, 14.7, 22.9),
(135, 1, 'Dapur LSKK', 'Dapur LSKK Labtek VIII Lantai 2 Institut Teknologi Bandung', 60, 61.7, 14.4, 22.8),
(136, 1, 'R. Labkom / Kelas LSKK', 'R. Labkom / Kelas LSKK Labtek VIII Lantai 2 Institut Teknologi Bandung', 68.8, 77.9, 1.9, 12.7),
(137, 1, 'Gudang LSKK', 'Gudang LSKK Labtek VIII Lantai 2 Institut Teknologi Bandung', 71.8, 78, 10.4, 12.8),
(138, 1, 'R. Teknis LSKK', 'R. Teknis LSKK Labtek VIII Lantai 2 Institut Teknologi Bandung', 77.8, 83.9, 1.9, 12.8),
(139, 1, 'R. Server LSKK', 'R. Server LSKK Labtek VIII Lantai 2 Institut Teknologi Bandung', 77.8, 81.8, 10.4, 12.6),
(140, 1, 'R. JJCC LSKK', 'R. JJCC LSKK Labtek VIII Lantai 2 Institut Teknologi Bandung', 83.8, 92.9, 1.9, 12.7),
(141, 1, 'Kelas 90 Umum', 'Kelas 90 Umum Labtek VIII Lantai 2 Institut Teknologi Bandung', 92.8, 100.3, 1.9, 12.7),
(142, 1, 'R. Lab Robotik', 'R. Lab Robotik Labtek VIII Lantai 2 Institut Teknologi Bandung', 65.6, 72, 14.7, 23),
(143, 1, 'Lab LSKK', 'Lab LSKK Labtek VIII Lantai 2 Institut Teknologi Bandung', 71.9, 83.9, 14.7, 22.9),
(144, 1, 'R. Teknis LSKK', 'R. Teknis LSKK Labtek VIII Lantai 2 Institut Teknologi Bandung', 71.8, 75, 19.6, 22.9),
(145, 1, 'R. S2 dan S3 LSKK', 'R. S2 dan S3 LSKK Labtek VIII Lantai 2 Institut Teknologi Bandung', 83.8, 91.5, 14.7, 23),
(146, 1, 'Kelas Umum', 'Kelas Umum Labtek VIII Lantai 2 Institut Teknologi Bandung', 95.5, 100.4, 14.7, 22.9),
(147, 1, 'Labtek VIII Lantai 2', 'Labtek VIII Lantai 2 Institut Teknologi Bandung', 0, 102, 0, 24.4),
(148, 2, 'R. Dosen', 'R. Dosen Labtek VIII Lantai 3 Institut Teknologi Bandung', 0.1, 12.3, 0.1, 6.2),
(149, 2, 'R. TA ELKA', 'R. TA ELKA Labtek VIII Lantai 3 Institut Teknologi Bandung', 0.2, 12.3, 6.1, 12.4),
(150, 2, 'R. Robovis', 'R. Robovis Labtek VIII Lantai 3 Institut Teknologi Bandung', 12.1, 18.3, 0.2, 12.4),
(151, 2, 'R. Dosen ELKA', 'R. Dosen ELKA Labtek VIII Lantai 3 Institut Teknologi Bandung', 18.2, 24.2, 0.1, 12.3),
(152, 2, 'R. Penelitian ELKA', 'R. Penelitian ELKA Labtek VIII Lantai 3 Institut Teknologi Bandung', 24.1, 30.2, 0.1, 12.4),
(153, 2, 'Lab ELKA', 'Lab ELKA Labtek VIII Lantai 3 Institut Teknologi Bandung', 30.1, 36.2, 0.1, 12.4),
(154, 2, 'R. Dosen ELKA', 'R. Dosen ELKA Labtek VIII Lantai 3 Institut Teknologi Bandung', 36.1, 42.2, 0.1, 9.2),
(155, 2, 'R. S3 BME', 'R. S3 BME Labtek VIII Lantai 3 Institut Teknologi Bandung', 36.1, 42.2, 9, 12.4),
(156, 2, 'Lab Multimedia', 'Lab Multimedia Labtek VIII Lantai 3 Institut Teknologi Bandung', 42.1, 48.2, 0.1, 12.4),
(157, 2, 'R. Dosen ISME', 'R. Dosen ISME Labtek VIII Lantai 3 Institut Teknologi Bandung', 48.1, 51.1, 6, 12.4),
(158, 2, 'R. Dosen BME', 'R. Dosen BME Labtek VIII Lantai 3 Institut Teknologi Bandung', 48, 54.3, 0.1, 6.2),
(159, 2, 'R. Rapat BME', 'R. Rapat BME Labtek VIII Lantai 3 Institut Teknologi Bandung', 54.1, 60.1, 0.1, 6.2),
(160, 2, 'TU BME', 'TU BME Labtek VIII Lantai 3 Institut Teknologi Bandung', 51, 60.1, 6.1, 12.3),
(161, 2, 'Sekertariat Alumni', 'Sekertariat Alumni Labtek VIII Lantai 3 Institut Teknologi Bandung', 0, 4.6, 12.2, 15.2),
(162, 2, 'Internal Corridor', 'Internal Corridor Labtek VIII Lantai 3 Institut Teknologi Bandung', 4.5, 95.8, 12.3, 14.6),
(163, 2, 'Internal Corridor', 'Internal Corridor Labtek VIII Lantai 3 Institut Teknologi Bandung', 60, 66.1, 0.2, 14.5),
(164, 2, 'R. Alumni STEI', 'R. Alumni STEI Labtek VIII Lantai 3 Institut Teknologi Bandung', 0, 6.4, 15.1, 24),
(165, 2, 'Balkon', 'Balkon Labtek VIII Lantai 3 Institut Teknologi Bandung', 6.2, 10.8, 20.9, 24),
(166, 2, 'TU ELKA', 'TU ELKA Labtek VIII Lantai 3 Institut Teknologi Bandung', 10.6, 18.3, 14.4, 19.7),
(167, 2, 'R. Rapat ELKA', 'R. Rapat ELKA Labtek VIII Lantai 3 Institut Teknologi Bandung', 10.6, 18.2, 19.6, 24),
(168, 2, 'Lab ELKA', 'Lab ELKA Labtek VIII Lantai 3 Institut Teknologi Bandung', 18.2, 24.2, 14.4, 24),
(169, 2, 'R. Praktek BME', 'R. Praktek BME Labtek VIII Lantai 3 Institut Teknologi Bandung', 24.1, 30.2, 14.5, 21.1),
(170, 2, 'R. Dosen BME', 'R. Dosen BME Labtek VIII Lantai 3 Institut Teknologi Bandung', 24.2, 30.2, 21, 24),
(171, 2, 'R. Optik', 'R. Optik Labtek VIII Lantai 3 Institut Teknologi Bandung', 30.1, 36.2, 14.4, 19.6),
(172, 2, 'R. Kerja Praktek', 'R. Kerja Praktek Labtek VIII Lantai 3 Institut Teknologi Bandung', 30.1, 36.2, 19.6, 24),
(173, 2, 'Kelas BME', 'Kelas BME Labtek VIII Lantai 3 Institut Teknologi Bandung', 36, 42.2, 14.4, 24),
(174, 2, 'R. Dosen ELKA', 'R. Dosen ELKA Labtek VIII Lantai 3 Institut Teknologi Bandung', 42, 48.4, 14.5, 24),
(175, 2, 'Mushola', 'Mushola Labtek VIII Lantai 3 Institut Teknologi Bandung', 45, 48.4, 14.4, 17.6),
(176, 2, 'R. Sensor Dasar', 'R. Sensor Dasar Labtek VIII Lantai 3 Institut Teknologi Bandung', 48.2, 51.1, 14.3, 17.7),
(177, 2, 'R. Gelap Dasar', 'R. Gelap Dasar Labtek VIII Lantai 3 Institut Teknologi Bandung', 48.3, 51, 17.5, 21.1),
(178, 2, 'TU Lab Dasar', 'TU Lab Dasar Labtek VIII Lantai 3 Institut Teknologi Bandung', 48.3, 57, 14.4, 24),
(179, 2, 'R. KI Dasar', 'R. KI Dasar Labtek VIII Lantai 3 Institut Teknologi Bandung', 57, 61.7, 14.4, 24),
(180, 2, 'Dapur', 'Dapur Labtek VIII Lantai 3 Institut Teknologi Bandung', 60, 61.6, 14.3, 17),
(181, 2, 'Lab Dasar', 'Lab Dasar Labtek VIII Lantai 3 Institut Teknologi Bandung', 66.1, 75.1, 0, 12.3),
(182, 2, 'R. Asisten Dasar', 'R. Asisten Dasar Labtek VIII Lantai 3 Institut Teknologi Bandung', 72, 75, 0, 7),
(183, 2, 'ELKA', 'ELKA Labtek VIII Lantai 3 Institut Teknologi Bandung', 75, 78.1, 0, 12.2),
(184, 2, 'R. Multimedia KKTI', 'R. Multimedia KKTI Labtek VIII Lantai 3 Institut Teknologi Bandung', 78, 83.9, 0, 12.4),
(185, 2, 'R. Praktek KKTI', 'R. Praktek KKTI Labtek VIII Lantai 3 Institut Teknologi Bandung', 84, 90, 0, 12.2),
(186, 2, 'R. Rapat KKTI', 'R. Rapat KKTI Labtek VIII Lantai 3 Institut Teknologi Bandung', 90, 96, 0, 6.1),
(187, 2, 'Bengkel KKTI', 'Bengkel KKTI Labtek VIII Lantai 3 Institut Teknologi Bandung', 90, 92.9, 6.1, 12.2),
(188, 2, 'Server KKTI', 'Server KKTI Labtek VIII Lantai 3 Institut Teknologi Bandung', 92.9, 96, 6, 12.4),
(189, 2, 'R. Dosen KKTI', 'R. Dosen KKTI Labtek VIII Lantai 3 Institut Teknologi Bandung', 95.9, 102, 0, 6.2),
(190, 2, 'R. Tamu KKTI', 'R. Tamu KKTI Labtek VIII Lantai 3 Institut Teknologi Bandung', 95.8, 99, 6, 12.4),
(191, 2, 'R. Ketua Lab KKTI', 'R. Ketua Lab KKTI Labtek VIII Lantai 3 Institut Teknologi Bandung', 98.8, 102, 6, 12.3),
(192, 2, 'Lab Dasar', 'Lab Dasar Labtek VIII Lantai 3 Institut Teknologi Bandung', 65.7, 75, 14.4, 24),
(193, 2, 'R. Asisten Dasar', 'R. Asisten Dasar Labtek VIII Lantai 3 Institut Teknologi Bandung', 74.9, 78.1, 14.4, 17.6),
(194, 2, 'Dapur Dasar', 'Dapur Dasar Labtek VIII Lantai 3 Institut Teknologi Bandung', 74.9, 78, 17.6, 24),
(195, 2, 'R. DS ELKA', 'R. DS ELKA Labtek VIII Lantai 3 Institut Teknologi Bandung', 77.9, 81.1, 14.4, 24),
(196, 2, 'ATK KKTI', 'ATK KKTI Labtek VIII Lantai 3 Institut Teknologi Bandung', 80.9, 84, 14.4, 24),
(197, 2, 'R. Seminar KKTI', 'R. Seminar KKTI Labtek VIII Lantai 3 Institut Teknologi Bandung', 83.9, 91.6, 14.4, 24),
(198, 2, 'Gudang KKTI', 'Gudang KKTI Labtek VIII Lantai 3 Institut Teknologi Bandung', 91.4, 96, 20.9, 24),
(199, 2, 'TU KKTI', 'TU KKTI Labtek VIII Lantai 3 Institut Teknologi Bandung', 95.7, 102, 12.3, 18.1),
(200, 2, 'R. Seminar KKTI', 'R. Seminar KKTI Labtek VIII Lantai 3 Institut Teknologi Bandung', 95.6, 102, 18, 24),
(201, 2, 'Labtek VIII Lantai 3', 'Labtek VIII Lantai 3 Institut Teknologi Bandung', 0, 102, 0, 24),
(202, 3, 'R. Residensi Lab Telematik', 'R. Residensi Lab Telematik Labtek VIII Lantai 4 Institut Teknologi Bandung', 1.2, 5.9, 6, 18.2),
(203, 3, 'R. Teknisi Lab Telematik', 'R. Teknisi Lab Telematik Labtek VIII Lantai 4 Institut Teknologi Bandung', 5.7, 11.9, 1.4, 12.4),
(204, 3, 'R. Riset Lab Telematik', 'R. Riset Lab Telematik Labtek VIII Lantai 4 Institut Teknologi Bandung', 5.8, 10.4, 6, 12.4),
(205, 3, 'R. Huawei', 'R. Huawei Labtek VIII Lantai 4 Institut Teknologi Bandung', 11.7, 17.9, 1.4, 12.3),
(206, 3, 'R. Kelas Lab. Telematik', 'R. Kelas Lab. Telematik Labtek VIII Lantai 4 Institut Teknologi Bandung', 17.8, 23.9, 1.4, 12.4),
(207, 3, 'R. Jaringan Lab Telematik', 'R. Jaringan Lab Telematik Labtek VIII Lantai 4 Institut Teknologi Bandung', 23.8, 29.9, 1.5, 12.4),
(208, 3, 'R. Residensi S2 dan S3', 'R. Residensi S2 dan S3 Labtek VIII Lantai 4 Institut Teknologi Bandung', 29.8, 35.9, 1.5, 12.4),
(209, 3, 'R. Penelitian Lab. Telematik', 'R. Penelitian Lab. Telematik Labtek VIII Lantai 4 Institut Teknologi Bandung', 35.9, 42, 1.4, 12.4),
(210, 3, 'R. Rapat Lab. Telematik', 'R. Rapat Lab. Telematik Labtek VIII Lantai 4 Institut Teknologi Bandung', 41.8, 47.9, 1.4, 12.4),
(211, 3, 'R. Kelas Lab. Telematik', 'R. Kelas Lab. Telematik Labtek VIII Lantai 4 Institut Teknologi Bandung', 47.9, 54, 1.4, 12.3),
(212, 3, 'R. Compnet', 'R. Compnet Labtek VIII Lantai 4 Institut Teknologi Bandung', 53.9, 59.9, 1.4, 12.3),
(213, 3, 'Internal Corridor', 'Internal Corridor Labtek VIII Lantai 4 Institut Teknologi Bandung', 5.7, 95.8, 12.1, 14.5),
(214, 3, 'Internal Corridor', 'Internal Corridor Labtek VIII Lantai 4 Institut Teknologi Bandung', 59.9, 66, 1.3, 12.4),
(215, 3, 'R. Kelas S2 Lab. Telematik', 'R. Kelas S2 Lab. Telematik Labtek VIII Lantai 4 Institut Teknologi Bandung', 10.2, 17.9, 14.4, 22.7),
(216, 3, 'R. Dosen Lab Telematik', 'R. Dosen Lab Telematik Labtek VIII Lantai 4 Institut Teknologi Bandung', 17.7, 26.9, 14.5, 22.7),
(217, 3, 'R. Tamu Lab Telematik', 'R. Tamu Lab Telematik Labtek VIII Lantai 4 Institut Teknologi Bandung', 20.8, 26.9, 14.4, 19.4),
(218, 3, 'R. TA Lab. Telematik', 'R. TA Lab. Telematik Labtek VIII Lantai 4 Institut Teknologi Bandung', 26.8, 35.9, 14.4, 22.7),
(219, 3, 'R. Server Lab Telematik', 'R. Server Lab Telematik Labtek VIII Lantai 4 Institut Teknologi Bandung', 35.8, 38.9, 14.4, 22.7),
(220, 3, 'R. Lab', 'R. Lab Labtek VIII Lantai 4 Institut Teknologi Bandung', 38.8, 47.9, 14.4, 22.7),
(221, 3, 'R. Dosen Lab Telematik', 'R. Dosen Lab Telematik Labtek VIII Lantai 4 Institut Teknologi Bandung', 47.8, 54, 14.4, 22.7),
(222, 3, 'TU Lab Telematik', 'TU Lab Telematik Labtek VIII Lantai 4 Institut Teknologi Bandung', 53.9, 61.5, 14.4, 22.7),
(223, 3, 'R. Ketua Lab Telematika', 'R. Ketua Lab Telematika Labtek VIII Lantai 4 Institut Teknologi Bandung', 53.9, 57, 17.6, 22.8),
(224, 3, 'R. Dosen Lab. Sinyal dan Sistem / KKTI', 'R. Dosen Lab. Sinyal dan Sistem / KKTI Labtek VIII Lantai 4 Institut Teknologi Bandung', 65.9, 72, 1.5, 4.7),
(225, 3, 'R. Penelitian Lab. Sinyal dan Sistem / KKTI', 'R. Penelitian Lab. Sinyal dan Sistem / KKTI Labtek VIII Lantai 4 Institut Teknologi Bandung', 65.9, 71.9, 4.6, 12.3),
(226, 3, 'R. AV. RG. Lab Sinyal dan Sistem / KKTI', 'R. AV. RG. Lab Sinyal dan Sistem / KKTI Labtek VIII Lantai 4 Institut Teknologi Bandung', 71.9, 84, 1.4, 12.3),
(227, 3, 'R. Dosen Lab. Sinyal dan Sistem / KKTI', 'R. Dosen Lab. Sinyal dan Sistem / KKTI Labtek VIII Lantai 4 Institut Teknologi Bandung', 77.9, 84, 1.4, 9.2),
(228, 3, 'R. Dosen Lab. Sinyal dan Sistem / KKTI', 'R. Dosen Lab. Sinyal dan Sistem / KKTI Labtek VIII Lantai 4 Institut Teknologi Bandung', 84, 96.1, 1.4, 4.7),
(229, 3, 'R. Residensi S1 S2 S3 Lab Sinyal dan Sistem / KKTI', 'R. Residensi S1 S2 S3 Lab Sinyal dan Sistem / KKTI Labtek VIII Lantai 4 Institut Teknologi Bandung', 83.9, 90.1, 4.6, 12.4),
(230, 3, 'R. Residensi S1 S2 Lab Sinyal dan Sistem / KKTI', 'R. Residensi S1 S2 Lab Sinyal dan Sistem / KKTI Labtek VIII Lantai 4 Institut Teknologi Bandung', 90, 96.1, 4.5, 12.4),
(231, 3, 'R. Kedap', 'R. Kedap Labtek VIII Lantai 4 Institut Teknologi Bandung', 93.8, 96.1, 10.1, 12.3),
(232, 3, 'R. Penelitian S2 dan S3 Lab Sinyal dan Sistem / KKTI', 'R. Penelitian S2 dan S3 Lab Sinyal dan Sistem / KKTI Labtek VIII Lantai 4 Institut Teknologi Bandung', 96, 100.6, 6, 18.2),
(233, 3, 'R. Penelitian Lab. Sinyal dan Sistem / KKTI', 'R. Penelitian Lab. Sinyal dan Sistem / KKTI Labtek VIII Lantai 4 Institut Teknologi Bandung', 65.6, 75, 14.4, 22.7),
(234, 3, 'R. Dosen Lab. Sinyal dan Sistem / KKTI', 'R. Dosen Lab. Sinyal dan Sistem / KKTI Labtek VIII Lantai 4 Institut Teknologi Bandung', 71.9, 75, 18.6, 22.6),
(235, 3, 'R. TA S2, S3 Lab Sinyal dan Sistem / KKTI', 'R. TA S2, S3 Lab Sinyal dan Sistem / KKTI Labtek VIII Lantai 4 Institut Teknologi Bandung', 74.9, 84, 14.4, 22.7),
(236, 3, 'R. Penelitian S2, S3 INS', 'R. Penelitian S2, S3 INS Labtek VIII Lantai 4 Institut Teknologi Bandung', 83.9, 91.6, 14.4, 18.6),
(237, 3, 'R. Dosen Lab. Sinyal dan Sistem / KKTI', 'R. Dosen Lab. Sinyal dan Sistem / KKTI Labtek VIII Lantai 4 Institut Teknologi Bandung', 83.9, 91.6, 18.5, 22.7),
(238, 3, 'Labtek VIII Lantai 4', 'Labtek VIII Lantai 4 Institut Teknologi Bandung', 0, 102, 0, 23.7);

-- --------------------------------------------------------

--
-- Structure for view `get_building`
--
DROP TABLE IF EXISTS `get_building`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `get_building`  AS  select `b`.`id` AS `id`,`b`.`title` AS `title`,`b`.`description` AS `description`,`b`.`latitude` AS `latitude`,`b`.`longitude` AS `longitude` from `building` `b` ;

-- --------------------------------------------------------

--
-- Structure for view `get_floor`
--
DROP TABLE IF EXISTS `get_floor`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `get_floor`  AS  select `f`.`id` AS `id`,`f`.`title` AS `title`,`f`.`description` AS `description`,`f`.`image` AS `image`,`f`.`width` AS `width`,`f`.`height` AS `height`,`b`.`id` AS `id_building`,`b`.`title` AS `title_building`,`b`.`description` AS `description_building`,`b`.`latitude` AS `latitude`,`b`.`longitude` AS `longitude` from (`building` `b` join `floor` `f`) where (`b`.`id` = `f`.`id_building`) ;

-- --------------------------------------------------------

--
-- Structure for view `get_ibeacon`
--
DROP TABLE IF EXISTS `get_ibeacon`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `get_ibeacon`  AS  select `i`.`uuid` AS `uuid` from `ibeacon` `i` ;

-- --------------------------------------------------------

--
-- Structure for view `get_room`
--
DROP TABLE IF EXISTS `get_room`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `get_room`  AS  select `r`.`id` AS `id`,`r`.`title` AS `title`,`r`.`description` AS `description`,`r`.`x1` AS `x1`,`r`.`x2` AS `x2`,`r`.`y1` AS `y1`,`r`.`y2` AS `y2`,`f`.`id` AS `id_floor`,`f`.`title` AS `title_floor`,`f`.`description` AS `description_floor`,`b`.`id` AS `id_building`,`b`.`title` AS `title_building`,`b`.`description` AS `description_building`,`b`.`latitude` AS `latitude`,`b`.`longitude` AS `longitude` from ((`building` `b` join `floor` `f`) join `room` `r`) where ((`b`.`id` = `f`.`id_building`) and (`f`.`id` = `r`.`id_floor`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `building`
--
ALTER TABLE `building`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `floor`
--
ALTER TABLE `floor`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_building` (`id_building`);

--
-- Indexes for table `ibeacon`
--
ALTER TABLE `ibeacon`
  ADD PRIMARY KEY (`uuid`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_floor` (`id_floor`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `building`
--
ALTER TABLE `building`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `floor`
--
ALTER TABLE `floor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=239;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `floor`
--
ALTER TABLE `floor`
  ADD CONSTRAINT `floor_ibfk_1` FOREIGN KEY (`id_building`) REFERENCES `building` (`id`);

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`id_floor`) REFERENCES `floor` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
