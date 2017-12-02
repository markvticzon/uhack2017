-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 02, 2017 at 08:32 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uhack`
--

-- --------------------------------------------------------

--
-- Table structure for table `merchants`
--

CREATE TABLE `merchants` (
  `merchantID` int(11) NOT NULL,
  `serviceID` varchar(9) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `merchants`
--

INSERT INTO `merchants` (`merchantID`, `serviceID`, `name`) VALUES
(1, '1', 'ms. chef'),
(2, '2', 'ms. printer');

-- --------------------------------------------------------

--
-- Table structure for table `school services`
--

CREATE TABLE `school services` (
  `id` int(11) NOT NULL,
  `service` varchar(10) NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `school services`
--

INSERT INTO `school services` (`id`, `service`, `price`) VALUES
(1, 'food', 55),
(2, 'print', 2);

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `studentNo` int(9) NOT NULL,
  `lastName` varchar(20) NOT NULL,
  `firstName` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(20) NOT NULL,
  `yearLevel` varchar(20) NOT NULL,
  `status` varchar(7) NOT NULL,
  `accountNumber` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`studentNo`, `lastName`, `firstName`, `email`, `password`, `yearLevel`, `status`, `accountNumber`) VALUES
(1, 'Abalos', 'Daniel Carlo', 'abalos@gmail.com', 'abalosdaniel', '3rd', 'regular', ''),
(2, 'Alviz', 'Matthew', 'alviz@gmail.com', 'alvizmatthew', '3rd', 'regular', ''),
(3, 'Ticzon', 'Mark', 'ticzon@gmail.com', 'ticzonmark', '3rd', 'regular', '');

-- --------------------------------------------------------

--
-- Table structure for table `transaction history`
--

CREATE TABLE `transaction history` (
  `studentNo` varchar(9) NOT NULL,
  `serviceID` varchar(10) NOT NULL,
  `merchantID` varchar(9) NOT NULL,
  `timeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `merchants`
--
ALTER TABLE `merchants`
  ADD PRIMARY KEY (`merchantID`);

--
-- Indexes for table `school services`
--
ALTER TABLE `school services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`studentNo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `merchants`
--
ALTER TABLE `merchants`
  MODIFY `merchantID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `school services`
--
ALTER TABLE `school services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `studentNo` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
