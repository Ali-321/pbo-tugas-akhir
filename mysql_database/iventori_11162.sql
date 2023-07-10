-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 07, 2023 at 09:49 PM
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_tbeli` ()   BEGIN
SELECT * FROM t_beli;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_tjual` ()   BEGIN
SELECT * FROM t_jual;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_users` ()   BEGIN
SELECT * FROM users WHERE status = 1; 
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
('B0001', 'Pulpen', 'PCS', 3000, 4500, 35, 5),
('B0002', 'Pensil Mekanik', 'PCS', 5000, 6500, 35, 5),
('B0003', 'Krayon', 'PCS', 8000, 9500, 30, 5),
('B0004', 'Pensil', 'PCS', 2000, 2500, 15, 5),
('B0005', 'tip-x', 'PCS', 2000, 2500, 7, 2);

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
(1, 'KDB0004', 'B0001', 50),
(2, 'KDB0003', 'B0002', 40),
(3, 'KDB0003', 'B0003', 30),
(4, 'KDB0004', 'B0004', 20),
(5, 'KDB0003', 'B0005', 10);

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
(1, 'KDBJ0003', 'B0001', 20),
(2, 'KDBJ0003', 'B0002', 10),
(3, 'KDBJ0002', 'B0003', 5),
(4, 'KDBJ0002', 'B0004', 10),
(5, 'KDBJ0003', 'B0005', 5);

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
,`Jml_Beli` int(11)
,`Jml_jual` int(11)
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
('KDB0001', '2022-01-02', 3),
('KDB0002', '2022-01-03', 2),
('KDB0003', '2022-02-03', 3),
('KDB0004', '2022-03-20', 3),
('KDB0005', '2022-03-22', 3);

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
('KDBJ0001', '2022-02-22', 3),
('KDBJ0002', '2022-02-23', 3),
('KDBJ0003', '2022-02-24', 2);

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
(1, '123', 'HeathCliff', 'administrator', 1),
(2, 'admin', 'admin', 'administrator', 1),
(3, '123', 'user', 'user', 1);

-- --------------------------------------------------------

--
-- Structure for view `laporan_ppbarang`
--
DROP TABLE IF EXISTS `laporan_ppbarang`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `laporan_ppbarang`  AS SELECT `barang`.`kd_brg` AS `Kode_Barang`, `barang`.`nm_brg` AS `Nama_Barang`, `barang`.`satuan` AS `Satuan`, `barang`.`hrg_beli` AS `Harga_Beli`, `barang`.`hrg_jual` AS `Harga_Jual`, `barang`.`stok_min` AS `Stok_Awal`, `d_beli`.`jml_beli` AS `Jml_Beli`, `d_jual`.`jml_jual` AS `Jml_jual`, `barang`.`stok` AS `Stok_Akhir` FROM ((`barang` join `d_beli` on(`d_beli`.`kd_brg` = `barang`.`kd_brg`)) join `d_jual` on(`d_jual`.`kd_brg` = `barang`.`kd_brg`)) ;

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
