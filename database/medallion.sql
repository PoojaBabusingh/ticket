-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 18, 2017 at 11:20 AM
-- Server version: 10.1.16-MariaDB
-- PHP Version: 7.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `medallion`
--

-- --------------------------------------------------------

--
-- Table structure for table `accomodation`
--

CREATE TABLE `accomodation` (
  `acc_id` int(11) NOT NULL,
  `acc_type` varchar(35) NOT NULL,
  `acc_price` double NOT NULL,
  `acc_slot` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accomodation`
--

INSERT INTO `accomodation` (`acc_id`, `acc_type`, `acc_price`, `acc_slot`) VALUES
(1, 'AC 1st Class', 1000, 30),
(2, 'AC 2nd Class', 800, 30),
(3, 'AC 3rd Class', 600, 30),
(4, 'Sleeper Class', 400, 30),
(5, 'Chair Car', 350, 30),
(6, 'General Class', 250, 30);

-- --------------------------------------------------------

--
-- Table structure for table `booked`
--

CREATE TABLE `booked` (
  `book_id` int(11) NOT NULL,
  `book_by` varchar(50) NOT NULL,
  `book_contact` varchar(15) NOT NULL,
  `book_address` varchar(100) NOT NULL,
  `book_name` varchar(100) NOT NULL,
  `book_age` int(11) NOT NULL,
  `book_gender` varchar(15) NOT NULL,
  `book_departure` date NOT NULL,
  `dest_id` int(11) NOT NULL,
  `acc_id` int(11) NOT NULL,
  `origin_id` int(11) NOT NULL,
  `book_tracker` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `destination`
--

CREATE TABLE `destination` (
  `dest_id` int(11) NOT NULL,
  `dest_destination` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `destination`
--

INSERT INTO `destination` (`dest_id`, `dest_destination`) VALUES
(1, 'Bangalore'),
(2, 'Goa'),
(3, 'Mumbai'),
(4, 'Delhi'),
(5, 'Chennai'),
(6, 'Hyderbad');

-- --------------------------------------------------------

--
-- Table structure for table `origin`
--

CREATE TABLE `origin` (
  `origin_id` int(11) NOT NULL,
  `origin_desc` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `origin`
--

INSERT INTO `origin` (`origin_id`, `origin_desc`) VALUES
(1, 'Hubballi'),
(2, 'Pune'),
(3, 'Vadodara'),
(4, 'Mysore'),
(5, 'Kochi'),
(6, 'Mirzapur');


-- --------------------------------------------------------

--
-- Table structure for table `status`
--

CREATE TABLE `status` (
  `stat_id` int(11) NOT NULL,
  `stat_desc` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `status`
--

INSERT INTO `status` (`stat_id`, `stat_desc`) VALUES
(1, 'Paid'),
(2, 'Refunded');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `trans_id` int(11) NOT NULL,
  `trans_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `trans_payment` double NOT NULL,
  `trans_passenger` varchar(100) NOT NULL,
  `trans_age` int(11) NOT NULL,
  `trans_gender` varchar(15) NOT NULL,
  `acc_id` int(11) NOT NULL,
  `origin_id` int(11) NOT NULL,
  `dest_id` int(11) NOT NULL,
  `stat_id` int(11) DEFAULT '1',
  `trans_refunded` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`trans_id`, `trans_time`, `trans_payment`, `trans_passenger`, `trans_age`, `trans_gender`, `acc_id`, `origin_id`, `dest_id`, `stat_id`, `trans_refunded`) VALUES
(1, '2017-02-27 16:06:37', 351, 'winnie a damayo', 23, 'Male', 2, 1, 1, 1, 1),
(2, '2017-03-28 15:08:34', 280.8, '323423', 25, 'Male', 2, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_account` varchar(50) NOT NULL,
  `user_password` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_account`, `user_password`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3'),
(2, 'admin2', 'c84258e9c39059a89ab77d846ddab909'),
(3, 'badri', '9a28fb87457b22727dd4c6108187b868'),
(4, 'pooja', '9cbb6aebcf5ae14a9248b4c08165212e');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accomodation`
--
ALTER TABLE `accomodation`
  ADD PRIMARY KEY (`acc_id`);

--
-- Indexes for table `booked`
--
ALTER TABLE `booked`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `dest_id` (`dest_id`,`acc_id`),
  ADD KEY `acc_id` (`acc_id`),
  ADD KEY `origin_id` (`origin_id`);

--
-- Indexes for table `destination`
--
ALTER TABLE `destination`
  ADD PRIMARY KEY (`dest_id`);

--
-- Indexes for table `origin`
--
ALTER TABLE `origin`
  ADD PRIMARY KEY (`origin_id`);

--
-- Indexes for table `status`
--
ALTER TABLE `status`
  ADD PRIMARY KEY (`stat_id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`trans_id`),
  ADD KEY `acc_id` (`acc_id`,`origin_id`,`dest_id`,`stat_id`),
  ADD KEY `origin_id` (`origin_id`),
  ADD KEY `dest_id` (`dest_id`),
  ADD KEY `stat_id` (`stat_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accomodation`
--
ALTER TABLE `accomodation`
  MODIFY `acc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `booked`
--
ALTER TABLE `booked`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `destination`
--
ALTER TABLE `destination`
  MODIFY `dest_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `origin`
--
ALTER TABLE `origin`
  MODIFY `origin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `status`
--
ALTER TABLE `status`
  MODIFY `stat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `trans_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `booked`
--
ALTER TABLE `booked`
  ADD CONSTRAINT `booked_ibfk_1` FOREIGN KEY (`dest_id`) REFERENCES `destination` (`dest_id`),
  ADD CONSTRAINT `booked_ibfk_2` FOREIGN KEY (`acc_id`) REFERENCES `accomodation` (`acc_id`),
  ADD CONSTRAINT `booked_ibfk_3` FOREIGN KEY (`origin_id`) REFERENCES `origin` (`origin_id`);

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`acc_id`) REFERENCES `accomodation` (`acc_id`),
  ADD CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`origin_id`) REFERENCES `origin` (`origin_id`),
  ADD CONSTRAINT `transaction_ibfk_3` FOREIGN KEY (`dest_id`) REFERENCES `destination` (`dest_id`),
  ADD CONSTRAINT `transaction_ibfk_4` FOREIGN KEY (`stat_id`) REFERENCES `status` (`stat_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
