-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 10 Nov 2019 pada 07.51
-- Versi Server: 10.1.28-MariaDB
-- PHP Version: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `luxvian`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `jkl`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `jkl` (
`id` int(11)
,`nim` varchar(20)
,`nama_mhs` varchar(100)
,`alamat` varchar(30)
,`jk` varchar(2)
,`no_hp` varchar(15)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `log`
--

CREATE TABLE `log` (
  `id` int(11) NOT NULL,
  `nim_mhs` varchar(12) NOT NULL,
  `no_hp_lama` varchar(16) NOT NULL,
  `no_hp_baru` varchar(16) NOT NULL,
  `tgl_diubah` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `log`
--

INSERT INTO `log` (`id`, `nim_mhs`, `no_hp_lama`, `no_hp_baru`, `tgl_diubah`) VALUES
(1, '161240000526', '085656759008', '085656759007', '2019-11-10 10:53:41'),
(2, '161240000478', '082223034160', '082223034169', '2019-11-10 10:56:18'),
(3, '161240000526', '085656759007', '085656759001', '2019-11-10 12:50:07'),
(4, '1612478762', '087654325678', '087654325671111', '2019-11-10 13:08:01'),
(5, '1612478762', '087654325671111', '087654325671111', '2019-11-10 13:08:02');

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id` int(11) NOT NULL,
  `nim` varchar(20) NOT NULL,
  `nama_mhs` varchar(100) NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `jk` varchar(2) NOT NULL,
  `no_hp` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`id`, `nim`, `nama_mhs`, `alamat`, `jk`, `no_hp`) VALUES
(1, '161240000526', 'sigma luxvian', 'cepogo rt 02 rw 10 kembang jep', 'La', '085656759001'),
(2, '161240000523', 'ananda rizqi winantasya', 'srobyong rt 04 rw 02 mlonggo j', 'P', '089560567456'),
(3, '161240000478', 'adlin safira a', 'tegal sambi rt 05 rw 01 tahuna', 'P', '082223034169'),
(4, '161240000511', 'novia kris m', 'dermolo rt 04 rw 02', 'P', '089560361731'),
(5, '161240000482', 'ahmad feri setyawan', 'sukosono rt 28 rw 07 kedung je', 'L', '085225678908'),
(6, '1612478762', 'arki', 'tahunan', 'La', '087654325671111');

--
-- Trigger `mahasiswa`
--
DELIMITER $$
CREATE TRIGGER `sigma` BEFORE UPDATE ON `mahasiswa` FOR EACH ROW BEGIN
insert into log
set nim_mhs=old.nim,
no_hp_baru=new.no_hp,
no_hp_lama=old.no_hp,
tgl_diubah=NOW();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `tampil`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `tampil` (
`id` int(11)
,`nim` varchar(20)
,`nama_mhs` varchar(100)
,`alamat` varchar(30)
,`jk` varchar(2)
,`no_hp` varchar(15)
);

-- --------------------------------------------------------

--
-- Struktur untuk view `jkl`
--
DROP TABLE IF EXISTS `jkl`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `jkl`  AS  select `mahasiswa`.`id` AS `id`,`mahasiswa`.`nim` AS `nim`,`mahasiswa`.`nama_mhs` AS `nama_mhs`,`mahasiswa`.`alamat` AS `alamat`,`mahasiswa`.`jk` AS `jk`,`mahasiswa`.`no_hp` AS `no_hp` from `mahasiswa` where (`mahasiswa`.`jk` = 'L') ;

-- --------------------------------------------------------

--
-- Struktur untuk view `tampil`
--
DROP TABLE IF EXISTS `tampil`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tampil`  AS  (select `mahasiswa`.`id` AS `id`,`mahasiswa`.`nim` AS `nim`,`mahasiswa`.`nama_mhs` AS `nama_mhs`,`mahasiswa`.`alamat` AS `alamat`,`mahasiswa`.`jk` AS `jk`,`mahasiswa`.`no_hp` AS `no_hp` from `mahasiswa`) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
