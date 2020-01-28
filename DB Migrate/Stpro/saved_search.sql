-- phpMyAdmin SQL Dump
-- version 4.6.6
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 08, 2017 at 03:10 AM
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
-- Dumping data for table `saved_search`
--

INSERT INTO `saved_search` (`search_id`, `data_item_text`, `url`, `is_custom`, `data_item_type`, `user_id`, `site_id`, `date_created`) VALUES
(1525, '317-413-0492', '/index.php?m=candidates&a=search&getback=getback&mode=phoneNumber&wildCardString=317-413-0492&searchCandidates=Search&advancedSearchParser=&advancedSearchOn=0', 0, 100, 1254, 1, '2017-05-24 10:02:51'),
(1349, '4062', '/index.php?m=joborders&a=search&getback=getback&mode=searchByJobTitle&wildCardString=4062&searchJobOrders=Search&advancedSearchParser=&advancedSearchOn=0', 0, 400, 1255, 1, '2017-05-12 12:01:46'),
(7, 'tax', '/index.php?m=candidates&a=search&getback=getback&mode=searchByResume&wildCardString=tax&searchCandidates=Search&advancedSearchParser=&advancedSearchOn=0', 0, 100, 1251, 1, '2017-01-19 13:30:53'),
(8, '44482', '/index.php?m=joborders&a=search&getback=getback&mode=searchByJobTitle&wildCardString=44482&searchJobOrders=Search&advancedSearchParser=&advancedSearchOn=0', 0, 400, 1253, 1, '2017-01-20 13:28:17'),
(10, '44320', '/index.php?m=joborders&a=search&getback=getback&mode=searchByJobTitle&wildCardString=44320&searchJobOrders=Search&advancedSearchParser=&advancedSearchOn=0', 0, 400, 1253, 1, '2017-01-20 13:28:25'),
(271, 'MAMADOU', '/index.php?m=candidates&a=search&getback=getback&mode=searchByResume&wildCardString=MAMADOU&searchCandidates=Search&advancedSearchParser=&advancedSearchOn=0', 0, 100, 1257, 1, '2017-04-04 11:25:18'),
(1678, 'attorney', '/index.php?m=candidates&a=search&getback=getback&mode=searchByResume&wildCardString=attorney&searchByResume=Search&page=2&sortBy=lastName&sortDirection=ASC', 0, 100, 1262, 1, '2017-06-20 16:14:02'),
(1274, 'monique', '/index.php?m=candidates&a=search&getback=getback&mode=searchByFullName&wildCardString=monique&searchCandidates=Search&advancedSearchParser=&advancedSearchOn=0', 0, 100, 1257, 1, '2017-05-08 09:17:32'),
(21, 'Clerical Asst 1', '/index.php?m=joborders&a=search&getback=getback&mode=searchByJobTitle&wildCardString=+Clerical+Asst+1&searchJobOrders=Search&advancedSearchParser=&advancedSearchOn=0', 0, 400, 1253, 1, '2017-01-25 15:02:15'),
(125, 'lab', '/index.php?m=candidates&a=search&getback=getback&mode=searchByResume&wildCardString=lab&searchCandidates=Search&advancedSearchParser=&advancedSearchOn=0', 1, 100, 1255, 1, '2017-02-28 10:31:09'),
(24, 'customer', '/index.php?m=candidates&a=search&getback=getback&mode=searchByResume&wildCardString=customer&searchCandidates=Search&advancedSearchParser=&advancedSearchOn=0', 0, 100, 1251, 1, '2017-02-07 14:09:08'),
(25, 'call center', '/index.php?m=candidates&a=search&getback=getback&mode=searchByResume&wildCardString=call+center&searchCandidates=Search&advancedSearchParser=&advancedSearchOn=0', 0, 100, 1251, 1, '2017-02-07 14:09:18'),
(26, 'csr', '/index.php?m=candidates&a=search&getback=getback&mode=searchByResume&wildCardString=csr&searchCandidates=Search&advancedSearchParser=&advancedSearchOn=0', 1, 100, 1255, 1, '2017-02-10 10:17:12'),
(662, 'Amy Davenport', '/index.php?m=candidates&a=search&getback=getback&mode=searchByFullName&wildCardString=Amy+Davenport&searchCandidates=Search&advancedSearchParser=&advancedSearchOn=0', 0, 100, 1258, 1, '2017-04-17 15:09:56'),
(131, 'phelps', '/index.php?m=candidates&a=search&getback=getback&mode=searchByResume&wildCardString=phelps&searchCandidates=Search&advancedSearchParser=&advancedSearchOn=0', 0, 100, 1257, 1, '2017-03-20 09:22:21'),
(1684, 'Dubois', '/index.php?m=candidates&a=search&getback=getback&mode=searchByCity&wildCardString=Dubois&searchCandidates=Search&advancedSearchParser=&advancedSearchOn=0', 0, 100, 1256, 1, '2017-06-21 14:43:53'),
(1433, 'CA', '/index.php?m=joborders&a=search&getback=getback&mode=searchByJobTitle&wildCardString=CA&searchJobOrders=Search&advancedSearchParser=&advancedSearchOn=0', 0, 400, 1264, 1, '2017-05-17 10:48:23'),
(628, 'healthcare', '/index.php?m=candidates&a=search&getback=getback&mode=searchByResume&wildCardString=healthcare&searchCandidates=Search&advancedSearchParser=&advancedSearchOn=0', 0, 100, 1254, 1, '2017-04-14 11:57:47'),
(1708, 'Kokomo', '/index.php?m=candidates&a=search&getback=getback&mode=searchByCity&wildCardString=Kokomo&searchCandidates=Search&advancedSearchParser=&advancedSearchOn=0', 0, 100, 1269, 1, '2017-06-29 13:52:24'),
(629, 'healthcare AND Indianapolis', '/index.php?m=candidates&a=search&getback=getback&mode=searchByResume&wildCardString=healthcare+AND+Indianapolis&advancedSearchParser=healthcare%5B%7C%5D+AND+%7B%5B%2BIndianapolis%5B%7C%5D&advancedSearchOn=1', 0, 100, 1254, 1, '2017-04-14 11:58:10'),
(1709, 'Research AND indianapolis', '/index.php?m=candidates&a=search&getback=getback&mode=searchByResume&wildCardString=Research+AND+indianapolis&searchCandidates=Search&advancedSearchParser=Research%5B%7C%5D+AND+%7B%5B%2Bindianapolis%5B%7C%5D&advancedSearchOn=0', 0, 100, 1266, 1, '2017-06-30 12:26:45'),
(668, 'Enrollment', '/index.php?m=candidates&a=search&getback=getback&mode=searchByResume&wildCardString=Enrollment&searchCandidates=Search&advancedSearchParser=&advancedSearchOn=0', 0, 100, 1258, 1, '2017-04-17 16:00:45'),
(1707, 'Coordinator  AND Indianapolis', '/index.php?m=candidates&a=search&getback=getback&mode=searchByResume&wildCardString=Coordinator++AND+Indianapolis&searchByResume=Search&page=5&sortBy=lastName&sortDirection=ASC', 0, 100, 1266, 1, '2017-06-29 11:47:07'),
(663, 'Amy', '/index.php?m=candidates&a=search&getback=getback&mode=searchByFullName&wildCardString=Amy&searchCandidates=Search&advancedSearchParser=&advancedSearchOn=0', 0, 100, 1258, 1, '2017-04-17 15:10:02'),
(1710, 'Peru', '/index.php?m=candidates&a=search&getback=getback&mode=searchByCity&wildCardString=Peru&searchCandidates=Search&advancedSearchParser=&advancedSearchOn=0', 0, 100, 1269, 1, '2017-06-30 16:01:23'),
(1348, '3971', '/index.php?m=joborders&a=search&getback=getback&mode=searchByJobTitle&wildCardString=3971&searchJobOrders=Search&advancedSearchParser=&advancedSearchOn=0', 0, 400, 1255, 1, '2017-05-12 12:01:30'),
(652, 'jessica brackket', '/index.php?m=candidates&a=search&getback=getback&mode=searchByResume&wildCardString=jessica+brackket&searchCandidates=Search&advancedSearchParser=&advancedSearchOn=0', 0, 100, 1258, 1, '2017-04-17 09:48:12'),
(1452, 'indianapolis', '/index.php?m=candidates&a=search&getback=getback&mode=searchByCity&wildCardString=indianapolis&searchCandidates=Search&advancedSearchParser=&advancedSearchOn=0', 0, 100, 1267, 1, '2017-05-18 12:56:26'),
(653, 'brackket', '/index.php?m=candidates&a=search&getback=getback&mode=searchByResume&wildCardString=brackket&searchCandidates=Search&advancedSearchParser=&advancedSearchOn=0', 0, 100, 1258, 1, '2017-04-17 09:48:23'),
(627, 'healthcare admin', '/index.php?m=candidates&a=search&getback=getback&mode=searchByResume&wildCardString=healthcare+admin&searchCandidates=Search&advancedSearchParser=&advancedSearchOn=0', 0, 100, 1254, 1, '2017-04-14 11:57:44'),
(1424, 'admin', '/index.php?m=candidates&a=search&getback=getback&mode=searchByResume&wildCardString=admin&searchCandidates=Search&advancedSearchParser=&advancedSearchOn=0', 0, 100, 1261, 1, '2017-05-16 15:10:32'),
(1703, 'richmond', '/index.php?m=candidates&a=search&getback=getback&mode=searchByCity&wildCardString=richmond&searchCandidates=Search&advancedSearchParser=&advancedSearchOn=0', 0, 100, 1256, 1, '2017-06-29 10:26:11'),
(1425, 'admin AND assistant', '/index.php?m=candidates&a=search&getback=getback&mode=searchByResume&wildCardString=admin+AND+assistant&searchCandidates=Search&advancedSearchParser=admin%5B%7C%5D+AND+%7B%5B%2Bassistant%5B%7C%5D&advancedSearchOn=0', 0, 100, 1261, 1, '2017-05-16 15:10:47'),
(1685, '3177167800', '/index.php?m=candidates&a=search&getback=getback&mode=phoneNumber&wildCardString=3177167800&searchCandidates=Search&advancedSearchParser=&advancedSearchOn=0', 0, 100, 1262, 1, '2017-06-22 11:21:03'),
(1603, 'admin', '/index.php?m=joborders&a=search&getback=getback&mode=searchByJobTitle&wildCardString=admin&searchJobOrders=Search&advancedSearchParser=&advancedSearchOn=0', 1, 400, 1266, 1, '2017-06-07 15:21:48'),
(1724, 'Project Manager', '/index.php?m=joborders&a=search&getback=getback&mode=searchByJobTitle&wildCardString=Project+Manager&searchJobOrders=Search&advancedSearchParser=&advancedSearchOn=0', 0, 400, 1265, 1, '2017-07-06 09:49:40'),
(1669, 'south bend AND customer AND', '/index.php?m=candidates&a=search&getback=getback&mode=searchByResume&wildCardString=south+bend+AND+customer+AND&searchByResume=Search&page=2&sortBy=lastName&sortDirection=ASC', 0, 100, 1266, 1, '2017-06-16 11:07:13'),
(1434, 'Assembler/Tester A-Camarillo,Ca', '/index.php?m=joborders&a=search&getback=getback&mode=searchByJobTitle&wildCardString=Assembler%2FTester+A-Camarillo%2CCa&searchJobOrders=Search&advancedSearchParser=&advancedSearchOn=0', 0, 400, 1264, 1, '2017-05-17 10:49:25'),
(1720, 'fort worth', '/index.php?m=candidates&a=search&getback=getback&mode=searchByCity&wildCardString=fort+worth&searchCandidates=Search&advancedSearchParser=&advancedSearchOn=0', 0, 100, 1265, 1, '2017-07-03 09:34:21'),
(1347, '4064', '/index.php?m=joborders&a=search&getback=getback&mode=searchByJobTitle&wildCardString=4064&searchJobOrders=Search&advancedSearchParser=&advancedSearchOn=0', 0, 400, 1255, 1, '2017-05-12 11:58:50'),
(1443, '4254', '/index.php?m=joborders&a=search&getback=getback&mode=searchByJobTitle&wildCardString=4254&searchJobOrders=Search&advancedSearchParser=&advancedSearchOn=0', 0, 400, 1257, 1, '2017-05-18 10:13:04'),
(1524, 'cjkj95@gmail.com', '/index.php?m=candidates&a=search&getback=getback&mode=searchByResume&wildCardString=cjkj95%40gmail.com&searchCandidates=Search&advancedSearchParser=&advancedSearchOn=0', 0, 100, 1254, 1, '2017-05-23 16:49:30'),
(1500, 'engineer', '/index.php?m=candidates&a=search&getback=getback&mode=searchByResume&wildCardString=engineer&searchByResume=Search&page=2&sortBy=lastName&sortDirection=ASC', 0, 100, 1267, 1, '2017-05-19 15:49:30'),
(1721, 'camarillo', '/index.php?m=joborders&a=search&getback=getback&mode=searchByJobTitle&wildCardString=camarillo&searchJobOrders=Search&advancedSearchParser=&advancedSearchOn=0', 0, 400, 1261, 1, '2017-07-03 12:10:00'),
(1346, '4093', '/index.php?m=joborders&a=search&getback=getback&mode=searchByJobTitle&wildCardString=4093&searchJobOrders=Search&advancedSearchParser=&advancedSearchOn=0', 0, 400, 1255, 1, '2017-05-12 11:56:11'),
(1697, 'Winchester', '/index.php?m=candidates&a=search&getback=getback&mode=searchByCity&wildCardString=Winchester&searchCandidates=Search&advancedSearchParser=&advancedSearchOn=0', 0, 100, 1256, 1, '2017-06-28 13:38:31'),
(1723, 'program coordinator', '/index.php?m=joborders&a=search&getback=getback&mode=searchByJobTitle&wildCardString=program+coordinator&searchJobOrders=Search&advancedSearchParser=&advancedSearchOn=0', 0, 400, 1261, 1, '2017-07-05 16:24:10'),
(1667, 'assembler/tester', '/index.php?m=joborders&a=search&getback=getback&mode=searchByJobTitle&wildCardString=assembler%2Ftester&searchJobOrders=Search&advancedSearchParser=&advancedSearchOn=0', 0, 400, 1261, 1, '2017-06-13 16:30:02'),
(1696, 'Muncie', '/index.php?m=candidates&a=search&getback=getback&mode=searchByCity&wildCardString=Muncie&searchCandidates=Search&advancedSearchParser=&advancedSearchOn=0', 0, 100, 1256, 1, '2017-06-28 13:27:17'),
(1722, 'Inspector Technician', '/index.php?m=joborders&a=search&getback=getback&mode=searchByJobTitle&wildCardString=Inspector+Technician&searchJobOrders=Search&advancedSearchParser=&advancedSearchOn=0', 0, 400, 1265, 1, '2017-07-03 15:10:32'),
(1345, '4065', '/index.php?m=joborders&a=search&getback=getback&mode=searchByJobTitle&wildCardString=4065&searchJobOrders=Search&advancedSearchParser=&advancedSearchOn=0', 0, 400, 1255, 1, '2017-05-12 11:53:41'),
(1692, 'Rockford', '/index.php?m=candidates&a=search&getback=getback&mode=searchByCity&wildCardString=Rockford&searchCandidates=Search&advancedSearchParser=&advancedSearchOn=0', 0, 100, 1269, 1, '2017-06-28 13:07:47'),
(1528, 'karimi', '/index.php?m=candidates&a=search&getback=getback&mode=searchByResume&wildCardString=karimi&searchCandidates=Search&advancedSearchParser=&advancedSearchOn=0', 0, 100, 1267, 1, '2017-05-26 15:26:49'),
(1435, 'Assembler/Tester -Camarillo,Ca', '/index.php?m=joborders&a=search&getback=getback&mode=searchByJobTitle&wildCardString=Assembler%2FTester+-Camarillo%2CCa&searchJobOrders=Search&advancedSearchParser=&advancedSearchOn=0', 0, 400, 1264, 1, '2017-05-17 10:49:38'),
(1436, 'Assembler/Tester -Irvine,Ca', '/index.php?m=joborders&a=search&getback=getback&mode=searchByJobTitle&wildCardString=Assembler%2FTester+-Irvine%2CCa&searchJobOrders=Search&advancedSearchParser=&advancedSearchOn=0', 0, 400, 1264, 1, '2017-05-17 10:50:03'),
(1567, '46024', '/index.php?m=joborders&a=search&getback=getback&mode=searchByJobTitle&wildCardString=46024&searchJobOrders=Search&advancedSearchParser=&advancedSearchOn=0', 0, 400, 1257, 1, '2017-06-06 09:26:17'),
(1725, '3176579269', '/index.php?m=candidates&a=search&getback=getback&mode=phoneNumber&wildCardString=3176579269&searchCandidates=Search&advancedSearchParser=&advancedSearchOn=0', 0, 100, 1262, 1, '2017-07-06 14:17:04'),
(1711, '4093', '/index.php?m=joborders&a=search&getback=getback&mode=searchByJobTitle&wildCardString=4093&searchJobOrders=Search&advancedSearchParser=&advancedSearchOn=0', 0, 400, 1264, 1, '2017-06-30 20:55:06'),
(1693, 'fortwayne', '/index.php?m=candidates&a=search&getback=getback&mode=searchByCity&wildCardString=fortwayne&searchCandidates=Search&advancedSearchParser=&advancedSearchOn=0', 0, 100, 1269, 1, '2017-06-28 13:08:08'),
(1698, 'KOKOMO', '/index.php?m=candidates&a=search&getback=getback&mode=searchByCity&wildCardString=KOKOMO&searchCandidates=Search&advancedSearchParser=&advancedSearchOn=0', 0, 100, 1256, 1, '2017-06-28 13:40:31'),
(1676, 'Naples', '/index.php?m=candidates&a=search&getback=getback&mode=searchByCity&wildCardString=Naples&searchCandidates=Search&advancedSearchParser=&advancedSearchOn=0', 0, 100, 1265, 1, '2017-06-19 16:49:01'),
(1695, 'fort wayne', '/index.php?m=candidates&a=search&getback=getback&mode=searchByCity&wildCardString=fort+wayne&searchCandidates=Search&advancedSearchParser=&advancedSearchOn=0&page=1&sortBy=dateCreated&sortDirection=ASC', 0, 100, 1269, 1, '2017-06-28 13:08:26'),
(1745, 'Maintenance Mechanic', '/index.php?m=joborders&a=search&getback=getback&mode=searchByJobTitle&wildCardString=Maintenance+Mechanic&searchJobOrders=Search&advancedSearchParser=&advancedSearchOn=0', 0, 400, 1265, 1, '2017-07-07 16:24:16'),
(1687, 'teacher AND LaPorte', '/index.php?m=candidates&a=search&getback=getback&mode=searchByResume&wildCardString=teacher+AND+LaPorte+&advancedSearchParser=teacher%5B%7C%5D+AND+%7B%5B%2BLaPorte+%5B%7C%5D&advancedSearchOn=1', 0, 100, 1266, 1, '2017-06-26 16:59:22'),
(1686, '3176546547', '/index.php?m=candidates&a=search&getback=getback&mode=phoneNumber&wildCardString=3176546547&searchCandidates=Search&advancedSearchParser=&advancedSearchOn=0', 0, 100, 1262, 1, '2017-06-22 13:04:20'),
(1646, 'Pendleton', '/index.php?m=candidates&a=search&getback=getback&mode=searchByResume&wildCardString=Pendleton&searchCandidates=Search&advancedSearchParser=&advancedSearchOn=0', 0, 100, 1266, 1, '2017-06-08 17:27:45'),
(1730, 'Program Manager-Disaster Recovery', '/index.php?m=joborders&a=search&getback=getback&mode=searchByJobTitle&wildCardString=Program+Manager-Disaster+Recovery&searchJobOrders=Search&advancedSearchParser=&advancedSearchOn=0', 0, 400, 1, 1, '2017-07-07 06:25:09'),
(1731, 'Disaster Recovery', '/index.php?m=joborders&a=search&getback=getback&mode=searchByJobTitle&wildCardString=Disaster+Recovery&searchJobOrders=Search&advancedSearchParser=&advancedSearchOn=0', 0, 400, 1, 1, '2017-07-07 06:25:11'),
(1732, 'In-Shop and Delivery Drivers: $8-12/hr', '/index.php?m=joborders&a=search&getback=getback&mode=searchByJobTitle&wildCardString=In-Shop+and+Delivery+Drivers%3A+%248-12%2Fhr&searchJobOrders=Search&advancedSearchParser=&advancedSearchOn=0', 0, 400, 1, 1, '2017-07-07 08:21:58'),
(1733, 'In-Shop and Delivery Drivers', '/index.php?m=joborders&a=search&getback=getback&mode=searchByJobTitle&wildCardString=In-Shop+and+Delivery+Drivers&searchJobOrders=Search&advancedSearchParser=&advancedSearchOn=0', 0, 400, 1, 1, '2017-07-07 08:22:03'),
(1744, 'account', '/index.php?m=candidates&a=search&getback=getback&mode=searchByResume&wildCardString=account&searchByResume=Search&page=10&sortBy=lastName&sortDirection=ASC', 0, 100, 1262, 1, '2017-07-07 15:54:26');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
