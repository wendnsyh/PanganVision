-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 12, 2024 at 06:25 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `panganvision`
--

-- --------------------------------------------------------

--
-- Table structure for table `distribusi`
--

CREATE TABLE `distribusi` (
  `ID_Distribusi` int(11) NOT NULL,
  `ID_Wilayah` int(11) DEFAULT NULL,
  `ID_Pangan` int(11) DEFAULT NULL,
  `Tanggal` date NOT NULL,
  `Tujuan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `distribusi`
--

INSERT INTO `distribusi` (`ID_Distribusi`, `ID_Wilayah`, `ID_Pangan`, `Tanggal`, `Tujuan`) VALUES
(1, 1, 1, '2024-12-01', 'Bandung'),
(2, 2, 2, '2024-12-02', 'Surabaya'),
(3, 3, 3, '2024-12-03', 'Jakarta');

-- --------------------------------------------------------

--
-- Table structure for table `impor`
--

CREATE TABLE `impor` (
  `ID_Impor` int(11) NOT NULL,
  `ID_Importir` int(11) DEFAULT NULL,
  `ID_Pangan` int(11) DEFAULT NULL,
  `Jumlah_Impor` int(11) NOT NULL,
  `Tahun` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `impor`
--

INSERT INTO `impor` (`ID_Impor`, `ID_Importir`, `ID_Pangan`, `Jumlah_Impor`, `Tahun`) VALUES
(1, 1, 1, 3000, 2024),
(2, 2, 2, 1500, 2024);

-- --------------------------------------------------------

--
-- Table structure for table `importir`
--

CREATE TABLE `importir` (
  `ID_Importir` int(11) NOT NULL,
  `Nama_Importir` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `importir`
--

INSERT INTO `importir` (`ID_Importir`, `Nama_Importir`) VALUES
(1, 'PT ABC'),
(2, 'PT XYZ');

-- --------------------------------------------------------

--
-- Table structure for table `logistik`
--

CREATE TABLE `logistik` (
  `ID_Logistik` int(11) NOT NULL,
  `ID_Wilayah_Asal` int(11) DEFAULT NULL,
  `ID_Wilayah_Tujuan` int(11) DEFAULT NULL,
  `ID_Pangan` int(11) DEFAULT NULL,
  `Jumlah` int(11) NOT NULL,
  `Tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `logistik`
--

INSERT INTO `logistik` (`ID_Logistik`, `ID_Wilayah_Asal`, `ID_Wilayah_Tujuan`, `ID_Pangan`, `Jumlah`, `Tanggal`) VALUES
(1, 1, 2, 1, 500, '2024-12-05'),
(2, 2, 3, 2, 700, '2024-12-06'),
(3, 3, 1, 3, 1000, '2024-12-07');

-- --------------------------------------------------------

--
-- Table structure for table `pangan`
--

CREATE TABLE `pangan` (
  `ID_Pangan` int(11) NOT NULL,
  `Jenis_Pangan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pangan`
--

INSERT INTO `pangan` (`ID_Pangan`, `Jenis_Pangan`) VALUES
(1, 'Beras'),
(2, 'Jagung'),
(3, 'Gandum'),
(4, 'Sagu'),
(5, 'Kedelai');

-- --------------------------------------------------------

--
-- Table structure for table `produksi`
--

CREATE TABLE `produksi` (
  `ID_Produksi` int(11) NOT NULL,
  `ID_Wilayah` int(11) DEFAULT NULL,
  `ID_Pangan` int(11) DEFAULT NULL,
  `Produksi` int(11) NOT NULL,
  `Tahun` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `produksi`
--

INSERT INTO `produksi` (`ID_Produksi`, `ID_Wilayah`, `ID_Pangan`, `Produksi`, `Tahun`) VALUES
(1, 1, 1, 5000, 2024),
(2, 2, 2, 3000, 2024),
(3, 3, 3, 7000, 2024);

-- --------------------------------------------------------

--
-- Table structure for table `stok`
--

CREATE TABLE `stok` (
  `ID_Stok` int(11) NOT NULL,
  `ID_Pangan` int(11) DEFAULT NULL,
  `ID_Wilayah` int(11) DEFAULT NULL,
  `Stok_Akhir` int(11) NOT NULL,
  `Tahun` year(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stok`
--

INSERT INTO `stok` (`ID_Stok`, `ID_Pangan`, `ID_Wilayah`, `Stok_Akhir`, `Tahun`) VALUES
(1, 1, 1, 2000, 2024),
(2, 2, 2, 1500, 2024),
(3, 3, 3, 3500, 2024);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `ID_User` int(11) NOT NULL,
  `Nama_User` varchar(255) NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Role` enum('Admin','Operator','Viewer') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`ID_User`, `Nama_User`, `Email`, `Password`, `Role`) VALUES
(1, 'Admin Pangan', 'admin@panganvision.id', 'admin123', 'Admin'),
(2, 'Operator Bandung', 'operator.bandung@panganvision.id', 'operator123', 'Operator'),
(3, 'Viewer Surabaya', 'viewer.surabaya@panganvision.id', 'viewer123', 'Viewer');

-- --------------------------------------------------------

--
-- Table structure for table `wilayah`
--

CREATE TABLE `wilayah` (
  `ID_Wilayah` int(11) NOT NULL,
  `Nama_Wilayah` varchar(255) NOT NULL,
  `Provinsi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wilayah`
--

INSERT INTO `wilayah` (`ID_Wilayah`, `Nama_Wilayah`, `Provinsi`) VALUES
(1, 'Jakarta', 'DKI Jakarta'),
(2, 'Bandung', 'Jawa Barat'),
(3, 'Surabaya', 'Jawa Timur'),
(4, 'Medan', 'Sumatera Utara'),
(5, 'Makassar', 'Sulawesi Selatan');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `distribusi`
--
ALTER TABLE `distribusi`
  ADD PRIMARY KEY (`ID_Distribusi`);

--
-- Indexes for table `impor`
--
ALTER TABLE `impor`
  ADD PRIMARY KEY (`ID_Impor`);

--
-- Indexes for table `importir`
--
ALTER TABLE `importir`
  ADD PRIMARY KEY (`ID_Importir`);

--
-- Indexes for table `logistik`
--
ALTER TABLE `logistik`
  ADD PRIMARY KEY (`ID_Logistik`);

--
-- Indexes for table `pangan`
--
ALTER TABLE `pangan`
  ADD PRIMARY KEY (`ID_Pangan`);

--
-- Indexes for table `produksi`
--
ALTER TABLE `produksi`
  ADD PRIMARY KEY (`ID_Produksi`);

--
-- Indexes for table `stok`
--
ALTER TABLE `stok`
  ADD PRIMARY KEY (`ID_Stok`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`ID_User`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `wilayah`
--
ALTER TABLE `wilayah`
  ADD PRIMARY KEY (`ID_Wilayah`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `distribusi`
--
ALTER TABLE `distribusi`
  MODIFY `ID_Distribusi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `impor`
--
ALTER TABLE `impor`
  MODIFY `ID_Impor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `importir`
--
ALTER TABLE `importir`
  MODIFY `ID_Importir` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `logistik`
--
ALTER TABLE `logistik`
  MODIFY `ID_Logistik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pangan`
--
ALTER TABLE `pangan`
  MODIFY `ID_Pangan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `produksi`
--
ALTER TABLE `produksi`
  MODIFY `ID_Produksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `stok`
--
ALTER TABLE `stok`
  MODIFY `ID_Stok` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `ID_User` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wilayah`
--
ALTER TABLE `wilayah`
  MODIFY `ID_Wilayah` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
