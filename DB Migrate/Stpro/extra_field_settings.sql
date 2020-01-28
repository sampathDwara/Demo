-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 08, 2017 at 03:21 AM
-- Server version: 5.6.35
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `stpro_oc`
--

--
-- Dumping data for table `extra_field_settings`
--

INSERT INTO `extra_field_settings` (`extra_field_settings_id`, `field_name`, `import_id`, `site_id`, `date_created`, `data_item_type`, `extra_field_type`, `extra_field_options`, `position`) VALUES
(1, 'AdminUser', NULL, 180, '2005-06-01 00:00:00', 200, 1, NULL, 1),
(2, 'UnixName', NULL, 180, '2005-06-01 00:00:00', 200, 1, NULL, 2),
(3, 'BillingNotes', NULL, 180, '2005-06-01 00:00:00', 200, 1, NULL, 3),
(4, 'IPAddress', NULL, 180, '2005-06-01 00:00:00', 300, 1, NULL, 4),
(5, 'Pay rate', NULL, 1, '2016-10-19 15:24:48', 400, 1, NULL, 5),
(6, 'TC Applicants', NULL, 1, '2016-10-19 16:02:25', 100, 3, NULL, 6),
(7, 'Contact', NULL, 1, '2016-10-24 19:18:22', 300, 1, NULL, 7);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
