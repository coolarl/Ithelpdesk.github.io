-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 17, 2024 at 12:08 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_helpdesk`
--

-- --------------------------------------------------------

--
-- Table structure for table `divisi`
--

CREATE TABLE `divisi` (
  `id` int(11) NOT NULL,
  `kodedivisi` varchar(255) DEFAULT NULL,
  `divisi` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `divisi`
--

INSERT INTO `divisi` (`id`, `kodedivisi`, `divisi`) VALUES
(1, 'TI', 'Teknologi Informasi'),
(3, 'SPI', 'Satuan Pengawasan Intern'),
(8, 'KEU', 'Keuangan'),
(10, 'SEKPER', 'Sekretaris Perusahaan');

-- --------------------------------------------------------

--
-- Table structure for table `h_user`
--

CREATE TABLE `h_user` (
  `user_id` varchar(16) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `Role` varchar(30) NOT NULL,
  `img` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `idkategori` int(11) NOT NULL,
  `namakategori` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`idkategori`, `namakategori`) VALUES
(1, 'Motherboard'),
(2, 'Laptop');

-- --------------------------------------------------------

--
-- Table structure for table `komponen`
--

CREATE TABLE `komponen` (
  `idkomponen` int(11) NOT NULL,
  `idkategori` int(11) NOT NULL,
  `idmerk` int(11) NOT NULL,
  `tipe` varchar(255) DEFAULT NULL,
  `spesifikasi` varchar(255) DEFAULT NULL,
  `keterangan` varchar(255) DEFAULT NULL,
  `hdd` varchar(50) NOT NULL,
  `ram` varchar(50) NOT NULL,
  `stats` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `komponen`
--

INSERT INTO `komponen` (`idkomponen`, `idkategori`, `idmerk`, `tipe`, `spesifikasi`, `keterangan`, `hdd`, `ram`, `stats`) VALUES
(1, 1, 1, 'X453MA', 'Intel Celeron', 'Ready', '2tb', '8GB', 'AKTIF'),
(5, 2, 1, 'A1G34', 'i9', 'ready', '1tb', '16GB', 'AKTIF');

-- --------------------------------------------------------

--
-- Table structure for table `merk`
--

CREATE TABLE `merk` (
  `idmerk` int(11) NOT NULL,
  `namamerk` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `merk`
--

INSERT INTO `merk` (`idmerk`, `namamerk`) VALUES
(1, 'ASUS');

-- --------------------------------------------------------

--
-- Table structure for table `pc`
--

CREATE TABLE `pc` (
  `idpc` int(11) NOT NULL,
  `idpengguna` int(11) NOT NULL,
  `namapc` varchar(255) DEFAULT NULL,
  `usrlogin` varchar(255) NOT NULL,
  `ipaddress` varchar(255) DEFAULT NULL,
  `internet` varchar(255) DEFAULT NULL,
  `catatan` varchar(255) DEFAULT NULL,
  `is_delete` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `pc`
--

INSERT INTO `pc` (`idpc`, `idpengguna`, `namapc`, `usrlogin`, `ipaddress`, `internet`, `catatan`, `is_delete`) VALUES
(20, 8, 'ty-yt', '', '43.5', 'YA', '', 0),
(21, 8, 'ty-123', '', '43.5', 'YA', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `pengaduan`
--

CREATE TABLE `pengaduan` (
  `id` varchar(9) NOT NULL,
  `n_pelapor` varchar(30) NOT NULL,
  `j_pelapor` varchar(30) NOT NULL,
  `d_pelapor` varchar(30) NOT NULL,
  `n_barang` varchar(30) NOT NULL,
  `ket` varchar(100) NOT NULL,
  `status` text NOT NULL,
  `ket_petugas` varchar(100) NOT NULL,
  `tgl_lapor` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `pengaduan`
--

INSERT INTO `pengaduan` (`id`, `n_pelapor`, `j_pelapor`, `d_pelapor`, `n_barang`, `ket`, `status`, `ket_petugas`, `tgl_lapor`) VALUES
('SNMC-0001', 'arul', 'STAFF', 'Keuangan', 'PC rusak', 'rusak', 'Selesai diproses', 'mantap', '2024-01-08');

-- --------------------------------------------------------

--
-- Table structure for table `pengguna`
--

CREATE TABLE `pengguna` (
  `idkary` int(11) NOT NULL,
  `nama` varchar(255) DEFAULT NULL,
  `jabatan` varchar(255) DEFAULT NULL,
  `unitkerja` varchar(255) DEFAULT NULL,
  `statkary` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `pengguna`
--

INSERT INTO `pengguna` (`idkary`, `nama`, `jabatan`, `unitkerja`, `statkary`) VALUES
(5, 'Rudi', 'DIREKSI-KOMISARIS', '1', 'AKTIF'),
(7, 'yudha', 'DIREKSI-KOMISARIS', '8', 'AKTIF'),
(8, 'defano', 'STAFF', '8', 'AKTIF'),
(10, 'dapa', 'MANAGER', '8', 'AKTIF'),
(14, 'ronaldo', 'ASSISTEN MANAGER', '3', 'AKTIF');

-- --------------------------------------------------------

--
-- Table structure for table `rakitan`
--

CREATE TABLE `rakitan` (
  `idrakitan` int(11) NOT NULL,
  `idpc` int(11) NOT NULL,
  `idkomponen` int(11) NOT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `jumlah` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `rakitan`
--

INSERT INTO `rakitan` (`idrakitan`, `idpc`, `idkomponen`, `barcode`, `jumlah`) VALUES
(78, 20, 1, '', '1'),
(79, 21, 5, '', '1');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` varchar(16) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `Role` varchar(30) NOT NULL,
  `img` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `username`, `password`, `Role`, `img`, `status`) VALUES
('12223445', 'rafi', '$2y$10$MMwue9lBLKItR1bBdJBGtufjUZs8eCkGV1Sdso0cs45wsfsWrX8q2', 'karyawan', 'default.jpg', 1),
('34354545', 'dendi', '$2y$10$4/SmNLHHFSxATkVGt6V.QuqF7At3Nl3UUd7y5MdXC1DTyVTQzFPyO', 'karyawan', 'default.jpg', 1),
('389483948398', 'tes', '$2y$10$5sR1bajWP5xOa2asFxjxY.vUS1c744TA9yavAeSvZz9RM27tbrU3m', 'karyawan', 'default.jpg', 1),
('e34435454', 'yoga', '$2y$10$oycGO9cZTfAzK41VQvZfieHBd7AHzBjQhZAdZku3ra1yMg.P3MoDS', 'karyawan', '1401516792_hayu.jpg', 1),
('M0701001', 'admin', '$2y$10$tFkLOG2KPaOL0Wpa5h4U7us1AIMGJnVSsAgR3Kkl0xNu9URjDCfT.', 'Administrator', '816575042_307632272_3170286679860499_7013164238378598201_n.jpg', 1);

--
-- Triggers `user`
--
DELIMITER $$
CREATE TRIGGER `trg_insert_histori_user` AFTER INSERT ON `user` FOR EACH ROW BEGIN
	
	INSERT INTO `h_user`
	(
		`user_id`, 
		`username`, 
		`password`, 
		`Role`, 
		`img`, 
		`status`
	)
	VALUES
	(
		NEW.`user_id`, 
		NEW.`username`, 
		NEW.`password`, 
		NEW.`Role`, 
		NEW.`img`, 
		NEW.`status`
	);

END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `vw_user_activity`
-- (See below for the actual view)
--
CREATE TABLE `vw_user_activity` (
`sedang_diajukan` bigint(21)
,`sedang_diproses` bigint(21)
,`selesai_diproses` bigint(21)
,`total_laporan` bigint(21)
,`jumlah_karyawan` bigint(21)
,`jumlah_hardware` bigint(21)
,`jumlah_software` bigint(21)
,`jumlah_network` bigint(21)
);

-- --------------------------------------------------------

--
-- Structure for view `vw_user_activity`
--
DROP TABLE IF EXISTS `vw_user_activity`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vw_user_activity`  AS SELECT (select count(`pengaduan`.`id`) from `pengaduan` where `pengaduan`.`status` = 'Sedang Diajukan') AS `sedang_diajukan`, (select count(`pengaduan`.`id`) from `pengaduan` where `pengaduan`.`status` = 'Sedang Diproses') AS `sedang_diproses`, (select count(`pengaduan`.`id`) from `pengaduan` where `pengaduan`.`status` = 'Selesai Diproses') AS `selesai_diproses`, (select count(`pengaduan`.`id`) from `pengaduan`) AS `total_laporan`, (select count(`pengguna`.`idkary`) from `pengguna`) AS `jumlah_karyawan`, (select count(`kategori`.`idkategori`) from `kategori`) AS `jumlah_hardware`, (select count(`merk`.`idmerk`) from `merk`) AS `jumlah_software`, (select count(`komponen`.`idkomponen`) from `komponen`) AS `jumlah_network` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `divisi`
--
ALTER TABLE `divisi`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `h_user`
--
ALTER TABLE `h_user`
  ADD PRIMARY KEY (`user_id`) USING BTREE;

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`idkategori`) USING BTREE;

--
-- Indexes for table `komponen`
--
ALTER TABLE `komponen`
  ADD PRIMARY KEY (`idkomponen`) USING BTREE,
  ADD KEY `fk_komponen_kategori` (`idkategori`),
  ADD KEY `fk_komponen_merk` (`idmerk`);

--
-- Indexes for table `merk`
--
ALTER TABLE `merk`
  ADD PRIMARY KEY (`idmerk`) USING BTREE;

--
-- Indexes for table `pc`
--
ALTER TABLE `pc`
  ADD PRIMARY KEY (`idpc`) USING BTREE,
  ADD KEY `fk_pc_pengguna` (`idpengguna`);

--
-- Indexes for table `pengaduan`
--
ALTER TABLE `pengaduan`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `pengguna`
--
ALTER TABLE `pengguna`
  ADD PRIMARY KEY (`idkary`) USING BTREE;

--
-- Indexes for table `rakitan`
--
ALTER TABLE `rakitan`
  ADD PRIMARY KEY (`idrakitan`) USING BTREE,
  ADD KEY `fk_rakitan_pc` (`idpc`),
  ADD KEY `fk_rakitan_komponen` (`idkomponen`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `divisi`
--
ALTER TABLE `divisi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `idkategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `komponen`
--
ALTER TABLE `komponen`
  MODIFY `idkomponen` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `merk`
--
ALTER TABLE `merk`
  MODIFY `idmerk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pc`
--
ALTER TABLE `pc`
  MODIFY `idpc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `pengguna`
--
ALTER TABLE `pengguna`
  MODIFY `idkary` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `rakitan`
--
ALTER TABLE `rakitan`
  MODIFY `idrakitan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `komponen`
--
ALTER TABLE `komponen`
  ADD CONSTRAINT `fk_komponen_kategori` FOREIGN KEY (`idkategori`) REFERENCES `kategori` (`idkategori`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_komponen_merk` FOREIGN KEY (`idmerk`) REFERENCES `merk` (`idmerk`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pc`
--
ALTER TABLE `pc`
  ADD CONSTRAINT `fk_pc_pengguna` FOREIGN KEY (`idpengguna`) REFERENCES `pengguna` (`idkary`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rakitan`
--
ALTER TABLE `rakitan`
  ADD CONSTRAINT `fk_rakitan_komponen` FOREIGN KEY (`idkomponen`) REFERENCES `komponen` (`idkomponen`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_rakitan_pc` FOREIGN KEY (`idpc`) REFERENCES `pc` (`idpc`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
