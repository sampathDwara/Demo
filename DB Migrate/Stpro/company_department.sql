-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 08, 2017 at 03:18 AM
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
-- Dumping data for table `company_department`
--

INSERT INTO `company_department` (`company_department_id`, `name`, `company_id`, `site_id`, `date_created`, `created_by`) VALUES
(1, 'Department of Health (ISDH)', 3087, 1, '2016-10-17 19:29:09', NULL),
(2, 'Indiana Office of Technology (IOT)', 3087, 1, '2016-10-17 19:29:09', NULL),
(3, 'CJI', 3087, 1, '2016-11-17 17:14:30', NULL),
(4, 'DHS', 3087, 1, '2016-11-17 17:14:31', NULL),
(5, 'DOC', 3087, 1, '2016-11-17 17:14:31', NULL),
(6, 'Department of Child Services (DCS)', 3087, 1, '2016-11-17 17:14:31', NULL),
(7, 'Department of Environmental matters (IDEM)', 3087, 1, '2016-11-17 17:14:31', NULL),
(8, 'Department of Revenue (DOR) ', 3087, 1, '2016-11-17 17:14:31', NULL),
(9, 'Family Social Services Administration (FSSA)', 3087, 1, '2016-11-17 17:14:31', NULL),
(10, 'Indiana State Police (ISP)', 3087, 1, '2016-11-17 17:14:31', NULL),
(11, 'National Guard (NG)', 3087, 1, '2017-01-09 20:43:28', NULL),
(12, 'Indiana Civil Rights Commision (ICRC)', 3087, 1, '2017-04-26 13:46:54', NULL),
(13, '(IARA) Archives & Records Association ', 3087, 1, '2017-04-28 16:48:03', NULL),
(14, 'IDOA (Department of Administration) ', 3087, 1, '2017-05-09 19:23:15', NULL),
(15, 'Abbey Bolinger | Progam Executive', 3951, 1, '2017-05-22 14:59:54', NULL),
(16, 'Alex Foit | Program Executive', 3951, 1, '2017-05-22 14:59:54', NULL),
(17, 'VSDH (Department of Health)', 3952, 1, '2017-06-19 15:04:27', NULL);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
