-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 08, 2017 at 02:59 AM
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
-- Dumping data for table `company`
--

INSERT INTO `company` (`company_id`, `site_id`, `billing_contact`, `name`, `email`, `address`, `city`, `state`, `zip`, `phone1`, `phone2`, `url`, `key_technologies`, `notes`, `entered_by`, `owner`, `date_created`, `date_modified`, `is_hot`, `fax_number`, `import_id`, `default_company`) VALUES
(1, 1, NULL, 'Internal Postings', NULL, '', '', '', '', '', '', '', '', '', 0, 0, '2009-11-19 10:00:20', '2009-11-19 10:00:20', 0, '', NULL, 1),
(2, 1, NULL, 'Finner n Finner, LLC (Jimmy Johns)', NULL, '', '', '', '', '', '', '', '', '', 1254, 1254, '2016-10-17 19:27:49', '2016-10-17 19:27:49', 0, '', NULL, 0),
(3, 1, -1, 'LCP Transportation LLC', NULL, '4310 Guion Rd', 'Indianapolis', 'IN', '46268', '317-291-9318', '', '', '', '', 1254, 1254, '2016-10-17 19:28:02', '2016-10-31 19:04:35', 0, '', NULL, 0),
(4, 1, NULL, 'Stratosphere Quality', NULL, '', '', '', '', '', '', '', '', '', 1254, 1254, '2016-10-17 19:28:13', '2016-10-17 19:28:13', 0, '', NULL, 0),
(3087, 1, -1, 'State of Indiana', '', '', 'Indianapolis', 'IN', '46204', '317-234-1684', '', '', '', '', 1254, 1254, '2016-04-30 09:14:42', '2017-01-09 20:43:28', 0, '', NULL, 0),
(3952, 1, NULL, 'State of Virginia', NULL, '', 'Richmond', 'Virginia', '', '', '', '', '', '', 1254, 1254, '2017-06-19 15:04:27', '2017-06-19 15:04:27', 0, '', NULL, 0),
(3951, 1, -1, 'Parker Aerospace - CDI Corporation', NULL, 'Abbey Bolinger | Program Executive\r\n\r\nCDI Corporation\r\nIndianapolis, IN \r\nDesk: 317.527.9727 | Cell: 317.445.8281', '', '', '', '317-527-9727', '317-445-8281', '', '', '', 1255, 1255, '2017-04-25 08:19:57', '2017-05-22 14:59:54', 0, '', NULL, 0),
(3950, 1, NULL, 'STProfessionals', '', '', '', '', '', '', '', '', '', '', 1, 1, '2016-06-03 07:37:08', '2016-06-06 09:06:07', 0, '', NULL, 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
