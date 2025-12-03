-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2025 at 11:54 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bank`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `password` varchar(255) NOT NULL,
  `id` bigint(20) NOT NULL,
  `branchid` bigint(20) DEFAULT NULL,
  `divisiid` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`password`, `id`, `branchid`, `divisiid`) VALUES
('ADMIN', 1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `akun`
--

CREATE TABLE `akun` (
  `id` bigint(20) NOT NULL,
  `pin` varchar(6) NOT NULL,
  `idakun` varchar(255) NOT NULL,
  `saldo` int(11) NOT NULL,
  `clientid` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `akun`
--

INSERT INTO `akun` (`id`, `pin`, `idakun`, `saldo`, `clientid`) VALUES
(1, '123456', '02012511', 300000, 4);

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE `bank` (
  `id` bigint(20) NOT NULL,
  `idbank` varchar(8) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bank`
--

INSERT INTO `bank` (`id`, `idbank`, `name`) VALUES
(1, '01121960', 'Bank ABC'),
(2, '04111988', 'Bank CKD');

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `id` bigint(20) NOT NULL,
  `idbranch` varchar(8) NOT NULL,
  `name` varchar(30) NOT NULL,
  `bankid` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`id`, `idbranch`, `name`, `bankid`) VALUES
(1, '11250001', 'Branch A', 1),
(2, '11230001', 'Branch B', 1),
(3, '12220030', 'Branch G', 2),
(5, '12240056', 'Branch C', 1);

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `age` int(11) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `password` varchar(255) NOT NULL,
  `id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`age`, `gender`, `password`, `id`) VALUES
(30, 'Male', 'CLIENT', 4);

-- --------------------------------------------------------

--
-- Table structure for table `divisi`
--

CREATE TABLE `divisi` (
  `id` bigint(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `branchid` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `divisi`
--

INSERT INTO `divisi` (`id`, `name`, `branchid`) VALUES
(1, 'Divisi AB', 1),
(2, 'Divisi AC', 1),
(3, 'Divisi BA', 2),
(4, 'Divisi CA', 3),
(5, 'Divisi CB', 3),
(6, 'Divisi BB', 2);

-- --------------------------------------------------------

--
-- Table structure for table `loans`
--

CREATE TABLE `loans` (
  `id` bigint(20) NOT NULL,
  `amount` int(11) NOT NULL,
  `idloan` varchar(255) NOT NULL,
  `clientid` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `loans`
--

INSERT INTO `loans` (`id`, `amount`, `idloan`, `clientid`) VALUES
(1, 150000, '5833c975-d056-43c3-ac8c-bab496f9a109', 4);

-- --------------------------------------------------------

--
-- Table structure for table `person`
--

CREATE TABLE `person` (
  `role` varchar(31) NOT NULL,
  `id` bigint(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `userid` varchar(8) NOT NULL,
  `bankid` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `person`
--

INSERT INTO `person` (`role`, `id`, `name`, `userid`, `bankid`) VALUES
('Admin', 1, 'John Doe', '12345678', 1),
('Client', 4, 'Buyer Smiths', '12345679', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKnaojfmi9yqpsi624emurckk11` (`branchid`),
  ADD KEY `FKkiyxc5ax50104ih0ywcx0jeip` (`divisiid`);

--
-- Indexes for table `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UKtrap8l2r5dolexujbwfx4kkju` (`clientid`);

--
-- Indexes for table `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKeyqlirpvqni8e5tt9s6yvcgqm` (`bankid`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `divisi`
--
ALTER TABLE `divisi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK2cd191f8cs99hg043ybayyvjd` (`branchid`);

--
-- Indexes for table `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK7svo8gjlbq7ghwyj1ikiwqhn6` (`clientid`);

--
-- Indexes for table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKovx7o47jdip24n8ll4iybrepb` (`bankid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `akun`
--
ALTER TABLE `akun`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bank`
--
ALTER TABLE `bank`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=110003;

--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `divisi`
--
ALTER TABLE `divisi`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `loans`
--
ALTER TABLE `loans`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `person`
--
ALTER TABLE `person`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `FKkiyxc5ax50104ih0ywcx0jeip` FOREIGN KEY (`divisiid`) REFERENCES `divisi` (`id`),
  ADD CONSTRAINT `FKnaojfmi9yqpsi624emurckk11` FOREIGN KEY (`branchid`) REFERENCES `branch` (`id`),
  ADD CONSTRAINT `FKsplda61kmlib6vk6qmwfv08dh` FOREIGN KEY (`id`) REFERENCES `person` (`id`);

--
-- Constraints for table `akun`
--
ALTER TABLE `akun`
  ADD CONSTRAINT `FKtrvej563ovu71cw598f3bdjx2` FOREIGN KEY (`clientid`) REFERENCES `client` (`id`);

--
-- Constraints for table `branch`
--
ALTER TABLE `branch`
  ADD CONSTRAINT `FKeyqlirpvqni8e5tt9s6yvcgqm` FOREIGN KEY (`bankid`) REFERENCES `bank` (`id`);

--
-- Constraints for table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `FKr1e0j10i9v9i52l6tqfa69nj0` FOREIGN KEY (`id`) REFERENCES `person` (`id`);

--
-- Constraints for table `divisi`
--
ALTER TABLE `divisi`
  ADD CONSTRAINT `FK2cd191f8cs99hg043ybayyvjd` FOREIGN KEY (`branchid`) REFERENCES `branch` (`id`);

--
-- Constraints for table `loans`
--
ALTER TABLE `loans`
  ADD CONSTRAINT `FKidv6i72ubravs6k4s0pf614ac` FOREIGN KEY (`clientid`) REFERENCES `client` (`id`);

--
-- Constraints for table `person`
--
ALTER TABLE `person`
  ADD CONSTRAINT `FKovx7o47jdip24n8ll4iybrepb` FOREIGN KEY (`bankid`) REFERENCES `bank` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
