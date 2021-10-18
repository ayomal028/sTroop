-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 16, 2021 at 11:27 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 7.3.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `supplytroop`
--

-- --------------------------------------------------------

--
-- Table structure for table `ad`
--

CREATE TABLE `ad` (
  `ad_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `ad_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `main_category` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sub_category` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `district` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `ad_status` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `posted_timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ad`
--

INSERT INTO `ad` (`ad_id`, `user_id`, `ad_type`, `main_category`, `sub_category`, `district`, `title`, `description`, `ad_status`, `posted_timestamp`) VALUES
(1, 2, 'buy', 'vehicles', 'Bicycle', 'Matara', 'Hello world', 'Hello wold desc', 'pending', '2021-10-16 09:02:02');

-- --------------------------------------------------------

--
-- Table structure for table `ad_image`
--

CREATE TABLE `ad_image` (
  `ad_id` int(11) NOT NULL,
  `image_1` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_2` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_3` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_4` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `image_5` text COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `ad_image`
--

INSERT INTO `ad_image` (`ad_id`, `image_1`, `image_2`, `image_3`, `image_4`, `image_5`) VALUES
(1, 'http://localhost/supplytroop/ad_images/buy/no-prev.jpeg', 'NULL', 'NULL', 'NULL', 'NULL');

-- --------------------------------------------------------

--
-- Table structure for table `pricing`
--

CREATE TABLE `pricing` (
  `ad_id` int(11) NOT NULL,
  `price` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nego_status` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `pricing`
--

INSERT INTO `pricing` (`ad_id`, `price`, `nego_status`) VALUES
(1, '100', 'NULL');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `user_email` varchar(70) COLLATE utf8_unicode_ci NOT NULL,
  `user_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_type` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `user_status` int(1) NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `first_name`, `last_name`, `user_email`, `user_password`, `user_type`, `user_status`, `last_login`) VALUES
(1, 'Nimesha', 'tester', 'tester@tester.com', '6adfb183a4a2c94a2f92dab5ade762a47889a5a1', 'user', 1, '2021-10-05 12:06:25'),
(2, 'nimesha', 'Lakshan', 'nimesha1.lakshan1@gmail.com', '6adfb183a4a2c94a2f92dab5ade762a47889a5a1', 'user', 1, '2021-10-14 03:49:51');

-- --------------------------------------------------------

--
-- Table structure for table `user_number`
--

CREATE TABLE `user_number` (
  `user_id` int(11) NOT NULL,
  `phone_1` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_2` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_3` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user_number`
--

INSERT INTO `user_number` (`user_id`, `phone_1`, `phone_2`, `phone_3`) VALUES
(2, '0774576848', '0718053592', '0768884954');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ad`
--
ALTER TABLE `ad`
  ADD PRIMARY KEY (`ad_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `ad_image`
--
ALTER TABLE `ad_image`
  ADD PRIMARY KEY (`ad_id`);

--
-- Indexes for table `pricing`
--
ALTER TABLE `pricing`
  ADD PRIMARY KEY (`ad_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `user_number`
--
ALTER TABLE `user_number`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ad`
--
ALTER TABLE `ad`
  MODIFY `ad_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ad`
--
ALTER TABLE `ad`
  ADD CONSTRAINT `ad_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `ad_image`
--
ALTER TABLE `ad_image`
  ADD CONSTRAINT `ad_image_ibfk_1` FOREIGN KEY (`ad_id`) REFERENCES `ad` (`ad_id`);

--
-- Constraints for table `pricing`
--
ALTER TABLE `pricing`
  ADD CONSTRAINT `pricing_ibfk_1` FOREIGN KEY (`ad_id`) REFERENCES `ad` (`ad_id`);

--
-- Constraints for table `user_number`
--
ALTER TABLE `user_number`
  ADD CONSTRAINT `user_number_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
