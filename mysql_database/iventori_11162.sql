-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 15, 2023 at 01:06 AM
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
-- Database: `iventori_11162`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_barang` (`a` CHAR(10))   BEGIN
DELETE FROM barang WHERE kd_brg = a; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_dbeli` (`a` INT)   BEGIN
DELETE FROM d_beli  WHERE id = a; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_djual` (`a` INT)   BEGIN
DELETE FROM d_jual WHERE id = a; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_tbeli` (`a` CHAR(10))   BEGIN
DELETE FROM t_beli  WHERE kd_beli = a; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_tjual` (`a` CHAR(10))   BEGIN
DELETE FROM t_jual  WHERE kd_jual = a; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_users` (`a` INT)   BEGIN
UPDATE users set status = 0 WHERE id = a; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_barang` ()   BEGIN
SELECT * FROM barang; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_dbeli` ()   BEGIN
SELECT * FROM d_beli;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_djual` ()   BEGIN
SELECT * FROM d_jual;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_end_iddb` ()   BEGIN
SELECT MAX(id) FROM d_beli;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_end_iddj` ()   BEGIN
SELECT MAX(id) FROM d_jual;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_tbeli` ()   BEGIN
SELECT * FROM t_beli;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_tjual` ()   BEGIN
SELECT * FROM t_jual;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_transaksi_bk2` (`a` CHAR(10))   BEGIN
SELECT d_jual.id,d_jual.kd_brg,barang.nm_brg as nama_barang,barang.satuan,barang.hrg_jual as harga,d_jual.jml_jual as jumlah,(d_jual.jml_jual * barang.hrg_jual ) as total FROM barang INNER JOIN d_jual ON barang.kd_brg = d_jual.kd_brg WHERE d_jual.kd_jual = a;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_transaksi_bm2` (`a` CHAR(10))   BEGIN
SELECT d_beli.id,d_beli.kd_brg,barang.nm_brg as nama_barang,barang.satuan,barang.hrg_beli as harga,d_beli.jml_beli as jumlah,(d_beli.jml_beli * barang.hrg_beli ) as total FROM barang INNER JOIN d_beli ON barang.kd_brg = d_beli.kd_brg WHERE d_beli.kd_beli = a;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_transaksi_brgk` ()   BEGIN
SELECT t_jual.kd_jual,tgl_jual,users.name as User,COUNT(*) as item ,SUM((hrg_jual * jml_jual)) as total FROM t_jual LEFT JOIN d_jual ON t_jual.kd_jual = d_jual.kd_jual LEFT JOIN barang ON barang.kd_brg = d_jual.kd_brg LEFT JOIN users ON users.id = t_jual.id_user GROUP BY kd_jual;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_transaksi_brgm` ()   BEGIN
SELECT t_beli.kd_beli,tgl_beli,users.name as User,COUNT(*) as item ,SUM((hrg_beli * jml_beli)) as total FROM t_beli LEFT JOIN d_beli ON t_beli.kd_beli = d_beli.kd_beli LEFT JOIN barang ON barang.kd_brg = d_beli.kd_brg LEFT JOIN users ON users.id = t_beli.id_user GROUP BY kd_beli;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_user` (`a` VARCHAR(50), `b` VARCHAR(20))   BEGIN
SELECT * FROM users WHERE status = 1 AND name = a AND pswd = b; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_users` ()   BEGIN
SELECT * FROM users WHERE status = 1; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_users2` ()   BEGIN
SELECT * FROM users;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_view_laporan_ppbarang` ()   BEGIN
SELECT * FROM laporan_ppbarang;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_view_laporan_totsiventaris` ()   BEGIN
SELECT * FROM laporan_totsiventaris;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_barang` (`a` CHAR(10), `b` VARCHAR(15), `c` VARCHAR(15), `d` INT, `e` INT, `f` INT, `g` INT)   BEGIN
INSERT INTO barang VALUES(a,b,c,d,e,f,g); 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_dbeli` (`a` INT, `b` CHAR(10), `c` CHAR(10), `d` INT)   BEGIN
INSERT INTO d_beli VALUES(a,b,c,d); 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_djual` (`a` INT, `b` CHAR(10), `c` CHAR(10), `d` INT)   BEGIN
INSERT INTO d_jual VALUES(a,b,c,d); 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_tbeli` (`a` CHAR(10), `b` DATE, `c` INT)   BEGIN
INSERT INTO t_beli VALUES(a,b,c); 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_tjual` (`a` CHAR(10), `b` DATE, `c` INT)   BEGIN
INSERT INTO t_jual VALUES(a,b,c); 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_users` (`a` INT, `b` VARCHAR(20), `c` VARCHAR(50), `d` ENUM("administrator","user"), `e` BOOLEAN)   begin
insert into users values(a,b,c,d,e);
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_barang` (`a` CHAR(10), `b` VARCHAR(15), `c` VARCHAR(15), `d` INT, `e` INT, `f` INT, `g` INT)   BEGIN
UPDATE barang SET nm_brg = b , satuan = c , hrg_beli = d, hrg_jual = e, stok = f , stok_min = g
WHERE kd_brg = a; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_dbeli` (`a` INT, `b` CHAR(10), `c` CHAR(10), `d` INT)   BEGIN
UPDATE d_beli SET kd_beli = b , kd_brg = c , jml_beli = d  WHERE id = a; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_djual` (`a` INT, `b` CHAR(10), `c` CHAR(10), `d` INT)   BEGIN
UPDATE d_jual SET kd_jual = b , kd_brg = c , jml_jual = d  WHERE id = a; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_tbeli` (`a` CHAR(10), `b` DATE, `c` INT)   BEGIN
UPDATE t_beli SET tgl_beli = b , id_user = c  WHERE kd_beli = a; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_tjual` (`a` CHAR(10), `b` DATE, `c` INT)   BEGIN
UPDATE t_jual SET tgl_jual = b , id_user = c  WHERE kd_jual = a; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_users` (`a` INT, `b` VARCHAR(20), `c` VARCHAR(50), `d` ENUM("administrator","user"), `e` BOOLEAN)   BEGIN
UPDATE users SET pswd = b , name = c , level = d, status = e WHERE id = a; 
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `kd_brg` char(10) NOT NULL,
  `nm_brg` varchar(15) NOT NULL,
  `satuan` varchar(15) NOT NULL,
  `hrg_beli` int(11) NOT NULL,
  `hrg_jual` int(11) NOT NULL,
  `stok` int(11) NOT NULL,
  `stok_min` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`kd_brg`, `nm_brg`, `satuan`, `hrg_beli`, `hrg_jual`, `stok`, `stok_min`) VALUES
('B0001', 'Pulpen', 'PCS', 3000, 4500, 40, 5),
('B0002', 'Pensil Mekanik', 'PCS', 5000, 6500, 50, 5),
('B0003', 'Krayon', 'PCS', 8000, 9500, 35, 5),
('B0004', 'Pensil 1B', 'PCS', 2000, 2500, 35, 5),
('B0005', 'Tip-x', 'PCS', 2000, 2500, 40, 10),
('B0006', 'Buku Tulis', 'PCS', 3000, 4000, 40, 10),
('B0007', 'Buku Gambar', 'PCS', 3000, 4000, 45, 15),
('B0008', 'Penggaris', 'PCS', 3000, 4000, 35, 5),
('B0009', 'Bujur Sangkar', 'PCS', 3500, 5000, 40, 10),
('B0010', 'Spidol Permanen', 'PCS', 10000, 12000, 40, 10),
('B0011', 'Kapor ', 'PCS', 15000, 16000, 35, 5),
('B0012', 'Kapor barus', 'PCS', 20000, 21000, 35, 5),
('B0013', 'Cutter', 'PCS', 15000, 16000, 35, 5),
('B0014', 'Sillet', 'PCS', 16000, 18000, 40, 10),
('B0015', 'Papan Tulis(sp)', 'PCS', 30000, 35000, 38, 8),
('B0016', 'Papan Tulis(kp)', 'PCS', 35000, 40000, 88, 8),
('B0017', 'Penghapus', 'PCS', 5000, 8000, 40, 10),
('B0018', 'Pensil 2B', 'PCS', 3000, 4000, 40, 10),
('B0019', 'Pensil 3B', 'PCS', 4000, 5000, 45, 15),
('B0020', 'Pensil 4B', 'PCS', 8000, 11000, 45, 15),
('B0021', 'Pensil 5B', 'PCS', 10000, 12000, 40, 10),
('B0022', 'Pensil 6B', 'PCS', 15000, 20000, 40, 10),
('B0023', 'Pensil 7B', 'PCS', 18000, 25000, 40, 10),
('B0024', 'Pensil 8B', 'PCS', 20000, 30000, 40, 10),
('B0025', 'Pensil 9B', 'PCS', 30000, 60000, 35, 5),
('B0026', 'Sabuk Kulit', 'PCS', 25000, 30000, 35, 5);

-- --------------------------------------------------------

--
-- Table structure for table `d_beli`
--

CREATE TABLE `d_beli` (
  `id` int(11) NOT NULL,
  `kd_beli` char(10) NOT NULL,
  `kd_brg` char(10) NOT NULL,
  `jml_beli` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `d_beli`
--

INSERT INTO `d_beli` (`id`, `kd_beli`, `kd_brg`, `jml_beli`) VALUES
(1, 'KDB1', 'B0001', 5),
(2, 'KDB1', 'B0002', 5),
(3, 'KDB1', 'B0002', 10),
(4, 'KDB2', 'B0001', 50),
(5, 'KDB2', 'B0002', 50),
(6, 'KDB2', 'B0003', 50),
(7, 'KDB2', 'B0004', 50),
(8, 'KDB2', 'B0005', 50),
(9, 'KDB2', 'B0006', 50),
(10, 'KDB2', 'B0007', 50),
(11, 'KDB2', 'B0008', 50),
(12, 'KDB2', 'B0009', 50),
(13, 'KDB2', 'B0010', 50),
(14, 'KDB2', 'B0011', 50),
(15, 'KDB2', 'B0012', 50),
(16, 'KDB2', 'B0013', 50),
(17, 'KDB2', 'B0014', 50),
(18, 'KDB2', 'B0015', 50),
(19, 'KDB2', 'B0016', 50),
(20, 'KDB2', 'B0016', 50),
(21, 'KDB2', 'B0017', 50),
(22, 'KDB2', 'B0018', 50),
(23, 'KDB2', 'B0019', 50),
(24, 'KDB2', 'B0020', 50),
(25, 'KDB2', 'B0021', 50),
(26, 'KDB2', 'B0022', 50),
(27, 'KDB2', 'B0023', 50),
(28, 'KDB2', 'B0024', 50),
(29, 'KDB2', 'B0025', 50),
(30, 'KDB2', 'B0026', 50);

--
-- Triggers `d_beli`
--
DELIMITER $$
CREATE TRIGGER `before_jml_beli_delete` BEFORE DELETE ON `d_beli` FOR EACH ROW UPDATE barang SET stok = stok - old.jml_beli WHERE barang.kd_brg = old.kd_brg
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_jml_beli_insert` BEFORE INSERT ON `d_beli` FOR EACH ROW UPDATE barang SET stok = stok + new.jml_beli WHERE barang.kd_brg = new.kd_brg
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_jml_beli_update_kondisi_1` BEFORE UPDATE ON `d_beli` FOR EACH ROW UPDATE barang SET stok = stok - (old.jml_beli - new.jml_beli) WHERE barang.kd_brg = old.kd_brg && new.kd_brg = old.kd_brg
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_jml_beli_update_kondisi_2` BEFORE UPDATE ON `d_beli` FOR EACH ROW UPDATE barang SET stok = stok - old.jml_beli WHERE barang.kd_brg = old.kd_brg && new.kd_brg != old.kd_brg
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_jml_beli_update_kondisi_3` BEFORE UPDATE ON `d_beli` FOR EACH ROW UPDATE barang SET stok = stok + new.jml_beli WHERE barang.kd_brg = new.kd_brg && new.kd_brg != old.kd_brg
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `d_jual`
--

CREATE TABLE `d_jual` (
  `id` int(11) NOT NULL,
  `kd_jual` char(10) NOT NULL,
  `kd_brg` char(10) NOT NULL,
  `jml_jual` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `d_jual`
--

INSERT INTO `d_jual` (`id`, `kd_jual`, `kd_brg`, `jml_jual`) VALUES
(1, 'KDJ1', 'B0001', 20),
(2, 'KDJ1', 'B0002', 20),
(3, 'KDJ1', 'B0003', 20),
(4, 'KDJ1', 'B0004', 20),
(5, 'KDJ1', 'B0005', 20),
(6, 'KDJ1', 'B0006', 20),
(7, 'KDJ1', 'B0007', 20),
(8, 'KDJ1', 'B0008', 20),
(9, 'KDJ1', 'B0009', 20),
(10, 'KDJ1', 'B0010', 20),
(11, 'KDJ1', 'B0011', 20),
(12, 'KDJ1', 'B0012', 20),
(13, 'KDJ1', 'B0013', 20),
(14, 'KDJ1', 'B0014', 20),
(15, 'KDJ1', 'B0015', 20),
(16, 'KDJ1', 'B0016', 20),
(17, 'KDJ1', 'B0017', 20),
(18, 'KDJ1', 'B0018', 20),
(19, 'KDJ1', 'B0019', 20),
(20, 'KDJ1', 'B0020', 20),
(21, 'KDJ1', 'B0021', 20),
(22, 'KDJ1', 'B0022', 20),
(23, 'KDJ1', 'B0023', 20),
(24, 'KDJ1', 'B0024', 20),
(25, 'KDJ1', 'B0025', 20),
(26, 'KDJ1', 'B0026', 20);

--
-- Triggers `d_jual`
--
DELIMITER $$
CREATE TRIGGER `before_jml_jual_delete` BEFORE DELETE ON `d_jual` FOR EACH ROW UPDATE barang SET stok = stok + old.jml_jual WHERE barang.kd_brg = old.kd_brg
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_jml_jual_insert` BEFORE INSERT ON `d_jual` FOR EACH ROW UPDATE barang SET stok = stok - new.jml_jual WHERE barang.kd_brg = new.kd_brg
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_jml_jual_update_kondisi_1` BEFORE UPDATE ON `d_jual` FOR EACH ROW UPDATE barang SET stok = stok + (old.jml_jual - new.jml_jual) WHERE barang.kd_brg = old.kd_brg && new.kd_brg = old.kd_brg
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_jml_jual_update_kondisi_2` BEFORE UPDATE ON `d_jual` FOR EACH ROW UPDATE barang SET stok = stok + old.jml_jual WHERE barang.kd_brg = old.kd_brg && new.kd_brg != old.kd_brg
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_jml_jual_update_kondisi_3` BEFORE UPDATE ON `d_jual` FOR EACH ROW UPDATE barang SET stok = stok - new.jml_jual WHERE barang.kd_brg = new.kd_brg && new.kd_brg != old.kd_brg
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `laporan_ppbarang`
-- (See below for the actual view)
--
CREATE TABLE `laporan_ppbarang` (
`Kode_Barang` char(10)
,`Nama_Barang` varchar(15)
,`Satuan` varchar(15)
,`Harga_Beli` int(11)
,`Harga_Jual` int(11)
,`Stok_Awal` int(11)
,`Jml_Beli` decimal(32,0)
,`Jml_jual` decimal(32,0)
,`Stok_Akhir` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `laporan_totsiventaris`
-- (See below for the actual view)
--
CREATE TABLE `laporan_totsiventaris` (
`kd_brg` char(10)
,`nm_brg` varchar(15)
,`nilai_iventari` bigint(21)
);

-- --------------------------------------------------------

--
-- Table structure for table `t_beli`
--

CREATE TABLE `t_beli` (
  `kd_beli` char(10) NOT NULL,
  `tgl_beli` date NOT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_beli`
--

INSERT INTO `t_beli` (`kd_beli`, `tgl_beli`, `id_user`) VALUES
('KDB1', '2023-07-15', 2),
('KDB2', '2023-07-15', 3);

--
-- Triggers `t_beli`
--
DELIMITER $$
CREATE TRIGGER `before_kd_beli_delete` BEFORE DELETE ON `t_beli` FOR EACH ROW DELETE FROM d_beli WHERE d_beli.kd_beli = old.kd_beli
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `t_jual`
--

CREATE TABLE `t_jual` (
  `kd_jual` char(10) NOT NULL,
  `tgl_jual` date NOT NULL,
  `id_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `t_jual`
--

INSERT INTO `t_jual` (`kd_jual`, `tgl_jual`, `id_user`) VALUES
('KDJ1', '2023-07-15', 3);

--
-- Triggers `t_jual`
--
DELIMITER $$
CREATE TRIGGER `before_kd_jual_delete` BEFORE DELETE ON `t_jual` FOR EACH ROW DELETE FROM d_jual WHERE d_jual.kd_jual = old.kd_jual
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `pswd` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `level` enum('administrator','user') NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `pswd`, `name`, `level`, `status`) VALUES
(1, '!@#$%', 'HeathCliff', 'administrator', 1),
(2, 'admin', 'admin', 'administrator', 1),
(3, '123', 'user', 'user', 1),
(4, '123', 'ali', 'user', 1),
(5, '123', 'udin', 'user', 1),
(6, 'kimbo', 'Zaenal', 'administrator', 1);

-- --------------------------------------------------------

--
-- Structure for view `laporan_ppbarang`
--
DROP TABLE IF EXISTS `laporan_ppbarang`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `laporan_ppbarang`  AS SELECT `barang`.`kd_brg` AS `Kode_Barang`, `barang`.`nm_brg` AS `Nama_Barang`, `barang`.`satuan` AS `Satuan`, `barang`.`hrg_beli` AS `Harga_Beli`, `barang`.`hrg_jual` AS `Harga_Jual`, `barang`.`stok_min` AS `Stok_Awal`, sum(`d_beli`.`jml_beli`) AS `Jml_Beli`, sum(`d_jual`.`jml_jual`) AS `Jml_jual`, `barang`.`stok` AS `Stok_Akhir` FROM ((`barang` left join `d_jual` on(`barang`.`kd_brg` = `d_jual`.`kd_brg`)) left join `d_beli` on(`d_beli`.`kd_brg` = `barang`.`kd_brg`)) GROUP BY `barang`.`kd_brg` ;

-- --------------------------------------------------------

--
-- Structure for view `laporan_totsiventaris`
--
DROP TABLE IF EXISTS `laporan_totsiventaris`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `laporan_totsiventaris`  AS SELECT `barang`.`kd_brg` AS `kd_brg`, `barang`.`nm_brg` AS `nm_brg`, `barang`.`hrg_beli`* `barang`.`stok` AS `nilai_iventari` FROM `barang` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`kd_brg`);

--
-- Indexes for table `d_beli`
--
ALTER TABLE `d_beli`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kd_beli` (`kd_beli`),
  ADD KEY `kd_brg` (`kd_brg`);

--
-- Indexes for table `d_jual`
--
ALTER TABLE `d_jual`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kd_jual` (`kd_jual`),
  ADD KEY `kd_brg` (`kd_brg`);

--
-- Indexes for table `t_beli`
--
ALTER TABLE `t_beli`
  ADD PRIMARY KEY (`kd_beli`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `t_jual`
--
ALTER TABLE `t_jual`
  ADD PRIMARY KEY (`kd_jual`),
  ADD KEY `id_user` (`id_user`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `d_beli`
--
ALTER TABLE `d_beli`
  ADD CONSTRAINT `d_beli_ibfk_1` FOREIGN KEY (`kd_beli`) REFERENCES `t_beli` (`kd_beli`) ON DELETE CASCADE,
  ADD CONSTRAINT `d_beli_ibfk_2` FOREIGN KEY (`kd_brg`) REFERENCES `barang` (`kd_brg`) ON DELETE CASCADE;

--
-- Constraints for table `d_jual`
--
ALTER TABLE `d_jual`
  ADD CONSTRAINT `d_jual_ibfk_1` FOREIGN KEY (`kd_jual`) REFERENCES `t_jual` (`kd_jual`) ON DELETE CASCADE,
  ADD CONSTRAINT `d_jual_ibfk_2` FOREIGN KEY (`kd_brg`) REFERENCES `barang` (`kd_brg`) ON DELETE CASCADE;

--
-- Constraints for table `t_beli`
--
ALTER TABLE `t_beli`
  ADD CONSTRAINT `t_beli_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `t_jual`
--
ALTER TABLE `t_jual`
  ADD CONSTRAINT `t_jual_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
