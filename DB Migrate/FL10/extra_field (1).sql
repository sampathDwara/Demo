-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 10, 2017 at 02:05 PM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ats`
--

-- --------------------------------------------------------

--
-- Table structure for table `extra_field`
--

CREATE TABLE `extra_field` (
  `extra_field_id` int(11) NOT NULL,
  `data_item_id` int(11) DEFAULT '0',
  `field_name` varchar(255) DEFAULT NULL,
  `value` text,
  `import_id` int(11) DEFAULT NULL,
  `site_id` int(11) DEFAULT '0',
  `data_item_type` int(11) DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `extra_field`
--

INSERT INTO `extra_field` (`extra_field_id`, `data_item_id`, `field_name`, `value`, `import_id`, `site_id`, `data_item_type`) VALUES
(1, 19, 'TC Applicants', 'Yes', 0, 1, 100),
(2, 2, 'Pay rate', '10.00', 0, 1, 400),
(3, 4, 'Pay rate', '12', 0, 1, 400),
(4, 7, 'Pay rate', '45', 0, 1, 400),
(5, 14, 'Pay rate', '10 $ / hr', 0, 1, 400),
(6, 15, 'Pay rate', '10 $ / hr', 0, 1, 400),
(8, 2409, 'Pay rate', '$22 p/hr on 1099', 0, 1, 400),
(9, 2411, 'Pay rate', '$11.50 p/hr', 0, 1, 400),
(10, 2414, 'Pay rate', ' $11.50 p/hr', 0, 1, 400),
(11, 2419, 'Pay rate', '$11.50 p/hr', 0, 1, 400),
(12, 2420, 'Pay rate', '$11.50 p/hr', 0, 1, 400),
(13, 2426, 'Pay rate', '$12.50 p/hr', 0, 1, 400),
(14, 2431, 'Pay rate', '$28.69/hr', 0, 1, 400),
(26, 2529, 'Pay rate', '$10.00 - $11.00', 0, 1, 400),
(16, 2454, 'Pay rate', '$10/hr', 0, 1, 400),
(17, 2455, 'Pay rate', '$8.50 p/hr', 0, 1, 400),
(18, 2459, 'Pay rate', '$12.50 p/hr', 0, 1, 400),
(19, 2461, 'Pay rate', '$10/hr', 0, 1, 400),
(20, 2467, 'Pay rate', '$11.75/Hr', 0, 1, 400),
(21, 2470, 'Pay rate', '11.50', 0, 1, 400),
(22, 2480, 'Pay rate', '$11.00 p/hr', 0, 1, 400),
(39, 2499, 'Pay rate', '$13.50 ', 0, 1, 400),
(24, 2512, 'Pay rate', '$10.00', 0, 1, 400),
(27, 2528, 'Pay rate', '$21.00 - $23.00', 0, 1, 400),
(28, 2518, 'Pay rate', '$8.50 - $9.50', 0, 1, 400),
(29, 2517, 'Pay rate', '$8.50-$9.50', 0, 1, 400),
(30, 2514, 'Pay rate', '$13.00 - $14.25', 0, 1, 400),
(31, 2532, 'Pay rate', '$9.50 ', 0, 1, 400),
(32, 2513, 'Pay rate', '$10.00', 0, 1, 400),
(33, 2511, 'Pay rate', '$8.50', 0, 1, 400),
(34, 2506, 'Pay rate', '$19.50', 0, 1, 400),
(35, 2508, 'Pay rate', '$19.00', 0, 1, 400),
(36, 2533, 'Pay rate', '$10.00', 0, 1, 400),
(37, 2534, 'Pay rate', '$10.00', 0, 1, 400),
(38, 2535, 'Pay rate', '$18.00 ', 0, 1, 400),
(40, 2497, 'Pay rate', '$8.50', 0, 1, 400),
(41, 2492, 'Pay rate', '$11.50 hr', 0, 1, 400),
(42, 2490, 'Pay rate', '$20.00', 0, 1, 400),
(43, 2471, 'Pay rate', '$9.00 - $10.00', 0, 1, 400),
(44, 2540, 'Pay rate', '$11.25 p/hr', 0, 1, 400),
(45, 2538, 'Pay rate', '$14.00', 0, 1, 400),
(46, 2443, 'Pay rate', '$8.50', 0, 1, 400),
(47, 2554, 'Pay rate', '08:00am to 04:30pm', 0, 1, 400),
(48, 2559, 'Pay rate', '19 - 21/hr', 0, 1, 400),
(49, 2560, 'Pay rate', '12.50', 0, 1, 400),
(50, 2561, 'Pay rate', '$8.50 - $9.00', 0, 1, 400),
(51, 2456, 'Pay rate', '12', 0, 1, 400),
(52, 2565, 'Pay rate', '$09.00/hr', 0, 1, 400),
(54, 2569, 'Pay rate', '$11.50/hr', 0, 1, 400),
(55, 2570, 'Pay rate', '8.50-9.50', 0, 1, 400),
(56, 2525, 'Pay rate', '8.50-9.50', 0, 1, 400),
(57, 2571, 'Pay rate', '$12.50 - $13.50', 0, 1, 400),
(58, 2539, 'Pay rate', '8.50-9.50', 0, 1, 400),
(59, 2548, 'Pay rate', '$8.50- $9.50', 0, 1, 400),
(68, 2572, 'Pay rate', '$9.00 - $10.00', 0, 1, 400),
(62, 2573, 'Pay rate', '$8.50 - $9.50', 0, 1, 400),
(63, 2575, 'Pay rate', '$10-$12', 0, 1, 400),
(64, 2486, 'Pay rate', '8.50 - 9.50', 0, 1, 400),
(65, 2578, 'Pay rate', 'Mandated Pay rate : $28.69/hr ', 0, 1, 400),
(66, 2581, 'Pay rate', ' $11.50', 0, 1, 400),
(67, 2482, 'Pay rate', '8.50 - 9.50', 0, 1, 400),
(69, 2586, 'Pay rate', '$11.50', 0, 1, 400),
(70, 2531, 'Pay rate', '$9 - $9.50', 0, 1, 400),
(71, 2595, 'Pay rate', '9.50', 0, 1, 400),
(72, 2574, 'Pay rate', '$14.50 - $15.50', 0, 1, 400),
(79, 2600, 'Pay rate', '8.50-9.50 ', 0, 1, 400),
(74, 2583, 'Pay rate', '8.50 - 9.00', 0, 1, 400),
(75, 2588, 'Pay rate', '$18/hr', 0, 1, 400),
(76, 2597, 'Pay rate', '13.50', 0, 1, 400),
(77, 2594, 'Pay rate', '27.00 - 32.00', 0, 1, 400),
(78, 2545, 'Pay rate', '24.00 - 26.00', 0, 1, 400),
(80, 2601, 'Pay rate', '8.50-9.50', 0, 1, 400),
(82, 2602, 'Pay rate', '22', 0, 1, 400),
(83, 2607, 'Pay rate', '$10 - $11/hr', 0, 1, 400),
(84, 2606, 'Pay rate', '11', 0, 1, 400),
(85, 2614, 'Pay rate', '18', 0, 1, 400),
(86, 2577, 'Pay rate', '9-10', 0, 1, 400),
(87, 2587, 'Pay rate', '8.50 - 9.50 ', 0, 1, 400),
(88, 2615, 'Pay rate', '13.50', 0, 1, 400),
(89, 2619, 'Pay rate', '$29', 0, 1, 400),
(91, 2624, 'Pay rate', '20-22', 0, 1, 400),
(92, 2627, 'Pay rate', '16.25', 0, 1, 400),
(93, 2476, 'Pay rate', '9.50', 0, 1, 400),
(94, 2475, 'Pay rate', '11.75', 0, 1, 400),
(95, 2632, 'Pay rate', '8.50 - 9.50', 0, 1, 400),
(96, 2621, 'Pay rate', '$8.50 - 9', 0, 1, 400),
(97, 2516, 'Pay rate', '9.50', 0, 1, 400),
(98, 2709, 'TC Applicants', 'Yes', 0, 1, 100),
(99, 2582, 'Pay rate', '9.00', 0, 1, 400),
(100, 2585, 'Pay rate', '9.50', 0, 1, 400),
(101, 2593, 'Pay rate', '12.00', 0, 1, 400),
(102, 2642, 'Pay rate', '$10.25/hr', 0, 1, 400),
(104, 2635, 'Pay rate', '9.00', 0, 1, 400),
(105, 2646, 'Pay rate', '25.00', 0, 1, 400),
(106, 2644, 'Pay rate', '9.50', 0, 1, 400),
(107, 2598, 'Pay rate', '9.50', 0, 1, 400),
(116, 2662, 'Pay rate', '$10.00', 0, 1, 400),
(109, 2650, 'Pay rate', '$20.42 - $22.73 - $25.04', 0, 1, 400),
(110, 2653, 'Pay rate', '11.50', 0, 1, 400),
(111, 2654, 'Pay rate', '20-22/hr', 0, 1, 400),
(112, 2658, 'Pay rate', '11.50', 0, 1, 400),
(123, 2652, 'Pay rate', '8.00 - 9.50', 0, 1, 400),
(114, 12528, 'Contact', '4/28/17', 0, 1, 300),
(115, 12529, 'Contact', '4/28/17', 0, 1, 300),
(117, 2669, 'Pay rate', '8.50 - 9.00', 0, 1, 400),
(118, 2640, 'Pay rate', '$23.00', 0, 1, 400),
(119, 2672, 'Pay rate', '11.50 mandated', 0, 1, 400),
(120, 2657, 'Pay rate', '12.50', 0, 1, 400),
(121, 12531, 'Contact', '5/09/17 ', 0, 1, 300),
(122, 2677, 'Pay rate', '15.35', 0, 1, 400),
(124, 12533, 'Contact', '5/09/17', 0, 1, 300),
(125, 12534, 'Contact', '5/10/17', 0, 1, 300),
(126, 2682, 'Pay rate', '17.00 - 22.00 /hr', 0, 1, 400),
(127, 2683, 'Pay rate', '9.00 - 9.50', 0, 1, 400),
(128, 2684, 'Pay rate', '14', 0, 1, 400),
(129, 2685, 'Pay rate', '14', 0, 1, 400),
(130, 2686, 'Pay rate', '14', 0, 1, 400),
(131, 2605, 'Pay rate', '09.50', 0, 1, 400),
(132, 2724, 'Pay rate', '$20-$25', 0, 1, 400),
(133, 2725, 'Pay rate', '$10.00 - $11.00', 0, 1, 400),
(134, 2727, 'Pay rate', '$12-$14/hr ', 0, 1, 400),
(135, 12536, 'Contact', '5/17/17 vm', 0, 1, 300),
(136, 2730, 'Pay rate', '18 - 25', 0, 1, 400),
(137, 2735, 'Pay rate', '13  to  16', 0, 1, 400),
(138, 2743, 'Pay rate', '$9.00 - $9.50', 0, 1, 400),
(139, 2750, 'Pay rate', '$15/hr', 0, 1, 400),
(140, 2751, 'Pay rate', 'Suggest Pay Rate $16/hr', 0, 1, 400),
(155, 2773, 'Pay rate', '22.73', 0, 1, 400),
(142, 2755, 'Pay rate', 'Suggest Pay Rate $16/hr', 0, 1, 400),
(157, 2775, 'Pay rate', 'Target Rate $15.44', 0, 1, 400),
(153, 2758, 'Pay rate', 'Target rate $22.39/hr', 0, 1, 400),
(154, 2770, 'Pay rate', '$21', 0, 1, 400),
(147, 2760, 'Pay rate', 'Pay Rate - $22/hr', 0, 1, 400),
(148, 2761, 'Pay rate', 'Target Rate $19.00', 0, 1, 400),
(149, 2762, 'Pay rate', 'Pay Rate Range between $13-$16/hr - DOE', 0, 1, 400),
(150, 2764, 'Pay rate', 'Wage:  $13-$25 DOE with $.90 shift differential.', 0, 1, 400),
(151, 2768, 'Pay rate', 'Target Rate $11.50 - ', 0, 1, 400),
(156, 2771, 'Pay rate', '9.00 - 9.50', 0, 1, 400),
(158, 2680, 'Pay rate', '9 - 9.50', 0, 1, 400),
(159, 2777, 'Pay rate', '14.55', 0, 1, 400),
(160, 2779, 'Pay rate', 'Suggest Pay Rate $16/hr ', 0, 1, 400),
(162, 2784, 'Pay rate', 'PAY RATE  $14 - $17/hr', 0, 1, 400),
(163, 2786, 'Pay rate', '$14 -$16', 0, 1, 400),
(164, 2787, 'Pay rate', '$14 -$16', 0, 1, 400),
(165, 2789, 'Pay rate', '$12 - $14', 0, 1, 400),
(166, 2792, 'Pay rate', '$26-$40 DOE', 0, 1, 400),
(167, 2794, 'Pay rate', '12. - 13.50', 0, 1, 400),
(168, 2799, 'Pay rate', '17.16', 0, 1, 400),
(169, 2802, 'Pay rate', '17.16', 0, 1, 400),
(170, 2804, 'Pay rate', 'PAY RATE $18-$22 hr.  ', 0, 1, 400),
(171, 2805, 'Pay rate', 'PAY RATE $15/hr   Max Bill Rate $20.10', 0, 1, 400),
(172, 2806, 'Pay rate', '$14 -$16', 0, 1, 400),
(173, 2807, 'Pay rate', '$14 -$16', 0, 1, 400),
(174, 2810, 'Pay rate', '15.44', 0, 1, 400),
(175, 2811, 'Pay rate', '15.44', 0, 1, 400),
(176, 2814, 'Pay rate', '$13-$16/hr', 0, 1, 400),
(177, 2815, 'Pay rate', '$10.50 - $11.50', 0, 1, 400),
(178, 2816, 'Pay rate', '$9.50', 0, 1, 400),
(179, 2818, 'Pay rate', '$16/hr', 0, 1, 400),
(180, 2820, 'Pay rate', '$18-$25', 0, 1, 400),
(181, 2821, 'Pay rate', '$18/hr', 0, 1, 400),
(185, 2822, 'Pay rate', '45 - 50/hr', 0, 1, 400),
(186, 2823, 'Pay rate', '45- 48/hr', 0, 1, 400),
(184, 2824, 'Pay rate', '$16.44 to Mid $20/hr', 0, 1, 400),
(187, 2825, 'Pay rate', '$13.50', 0, 1, 400),
(188, 2826, 'Pay rate', '$13.50 ', 0, 1, 400),
(189, 2827, 'Pay rate', '$14.50', 0, 1, 400),
(190, 2828, 'Pay rate', '$12.50', 0, 1, 400),
(191, 2829, 'Pay rate', '$12.50', 0, 1, 400),
(192, 2830, 'Pay rate', '$12.50', 0, 1, 400),
(193, 2831, 'Pay rate', '13 - 16', 0, 1, 400),
(194, 2834, 'Pay rate', '$ 13.47', 0, 1, 400),
(195, 2835, 'Pay rate', '$23.33', 0, 1, 400),
(205, 2838, 'Pay rate', 'Pay 30- 40/hr  Bill rate: $60.20', 0, 1, 400),
(201, 2839, 'Pay rate', '20 - 24  / Bill :41.44/hr', 0, 1, 400),
(199, 2841, 'Pay rate', '$14 - $17/hr', 0, 1, 400),
(210, 2852, 'Pay rate', '$13.62 - Max $20.95 ', 0, 1, 400),
(208, 2848, 'Pay rate', '$13.50 - 2nd  shift position', 0, 1, 400),
(209, 2819, 'Pay rate', '20.00 - 21.00', 0, 1, 400),
(211, 2853, 'Pay rate', '$13.62 - Max $20.95', 0, 1, 400),
(212, 2856, 'Pay rate', '11.50', 0, 1, 400),
(213, 22787, 'Open Rate', 'YES', 0, 1, 100),
(214, 22787, 'Is Qualified', 'YES', 0, 1, 100),
(218, 22792, 'Open Rate', 'YES', 0, 1, 100),
(217, 22414, 'Is Qualified', 'YES', 0, 1, 100),
(219, 22792, 'Is Qualified', 'YES', 0, 1, 100),
(220, 22793, 'Open Rate', 'YES', 0, 1, 100),
(221, 22793, 'Is Qualified', 'YES', 0, 1, 100),
(222, 22794, 'Open Rate', 'YES', 0, 1, 100),
(223, 22794, 'Is Qualified', 'YES', 0, 1, 100),
(224, 22795, 'Open Rate', 'YES', 0, 1, 100),
(225, 22795, 'Is Qualified', 'YES', 0, 1, 100),
(226, 23179, 'Open Rate', 'YES', 0, 1, 100),
(227, 23179, 'Comments', 'Submitted to quintlies for $75 on w2', 0, 1, 100),
(228, 23179, 'Is Qualified', 'YES', 0, 1, 100),
(232, 27518, 'Open Rate', 'YES', 0, 1, 100),
(233, 27518, 'Is Qualified', 'YES', 0, 1, 100),
(234, 27518, 'VISA', 'H4', 0, 1, 100),
(335, 23275, 'VISA', 'H1', 0, 1, 100),
(237, 3958, 'Company Type', 'Client', 0, 1, 200),
(238, 23236, 'Is Qualified', 'YES', 0, 1, 100),
(239, 23236, 'VISA', 'H1', 0, 1, 100),
(240, 23237, 'Open Rate', 'YES', 0, 1, 100),
(241, 23237, 'Is Qualified', 'YES', 0, 1, 100),
(242, 23237, 'VISA', 'H1', 0, 1, 100),
(243, 23238, 'Open Rate', 'YES', 0, 1, 100),
(244, 23238, 'Is Qualified', 'YES', 0, 1, 100),
(245, 23238, 'VISA', 'H1', 0, 1, 100),
(246, 23239, 'Open Rate', 'YES', 0, 1, 100),
(247, 23239, 'Is Qualified', 'YES', 0, 1, 100),
(248, 23239, 'VISA', 'H1', 0, 1, 100),
(249, 23240, 'Is Qualified', 'YES', 0, 1, 100),
(250, 23240, 'VISA', 'H1', 0, 1, 100),
(251, 23241, 'Open Rate', 'YES', 0, 1, 100),
(252, 23241, 'Is Qualified', 'YES', 0, 1, 100),
(253, 23241, 'VISA', 'H1', 0, 1, 100),
(254, 23242, 'Open Rate', 'YES', 0, 1, 100),
(255, 23242, 'Is Qualified', 'YES', 0, 1, 100),
(256, 23242, 'VISA', 'H1', 0, 1, 100),
(257, 23243, 'Open Rate', 'YES', 0, 1, 100),
(258, 23243, 'Is Qualified', 'YES', 0, 1, 100),
(259, 23243, 'VISA', 'H1', 0, 1, 100),
(260, 23244, 'Open Rate', 'YES', 0, 1, 100),
(261, 23244, 'Is Qualified', 'YES', 0, 1, 100),
(262, 23244, 'VISA', 'GC', 0, 1, 100),
(263, 23245, 'Is Qualified', 'YES', 0, 1, 100),
(264, 23245, 'VISA', 'H1', 0, 1, 100),
(265, 23246, 'Open Rate', 'YES', 0, 1, 100),
(266, 23246, 'Is Qualified', 'YES', 0, 1, 100),
(267, 23246, 'VISA', 'H1', 0, 1, 100),
(268, 23247, 'Open Rate', 'YES', 0, 1, 100),
(269, 23247, 'Is Qualified', 'YES', 0, 1, 100),
(270, 23247, 'VISA', 'H1', 0, 1, 100),
(271, 23248, 'Open Rate', 'YES', 0, 1, 100),
(272, 23248, 'Is Qualified', 'YES', 0, 1, 100),
(273, 23248, 'VISA', 'OPT', 0, 1, 100),
(274, 23249, 'Open Rate', 'YES', 0, 1, 100),
(275, 23249, 'Is Qualified', 'YES', 0, 1, 100),
(276, 23249, 'VISA', 'H1', 0, 1, 100),
(277, 23250, 'Open Rate', 'NO', 0, 1, 100),
(278, 23250, 'Is Qualified', 'YES', 0, 1, 100),
(279, 23250, 'VISA', 'H1', 0, 1, 100),
(280, 22094, 'Is Qualified', 'YES', 0, 1, 100),
(281, 22094, 'VISA', 'US Citizen', 0, 1, 100),
(282, 23251, 'Open Rate', 'YES', 0, 1, 100),
(283, 23251, 'Is Qualified', 'YES', 0, 1, 100),
(284, 23251, 'VISA', 'US Citizen', 0, 1, 100),
(285, 23253, 'Open Rate', 'YES', 0, 1, 100),
(286, 23253, 'Is Qualified', 'YES', 0, 1, 100),
(287, 23253, 'VISA', 'H1', 0, 1, 100),
(288, 9381, 'Is Qualified', 'YES', 0, 1, 100),
(289, 23254, 'Open Rate', 'YES', 0, 1, 100),
(290, 23254, 'Is Qualified', 'YES', 0, 1, 100),
(291, 23254, 'VISA', 'H1', 0, 1, 100),
(292, 23255, 'Open Rate', 'YES', 0, 1, 100),
(293, 23255, 'Is Qualified', 'YES', 0, 1, 100),
(294, 23255, 'VISA', 'H1', 0, 1, 100),
(295, 23256, 'Is Qualified', 'YES', 0, 1, 100),
(296, 23256, 'VISA', 'H1', 0, 1, 100),
(297, 23257, 'Open Rate', 'YES', 0, 1, 100),
(298, 23257, 'Is Qualified', 'YES', 0, 1, 100),
(299, 23257, 'VISA', 'H1', 0, 1, 100),
(300, 23258, 'Is Qualified', 'YES', 0, 1, 100),
(301, 23258, 'VISA', 'Others', 0, 1, 100),
(302, 23259, 'Open Rate', 'NO', 0, 1, 100),
(303, 23259, 'Is Qualified', 'YES', 0, 1, 100),
(304, 23259, 'VISA', 'H1', 0, 1, 100),
(305, 23260, 'Is Qualified', 'YES', 0, 1, 100),
(306, 23260, 'VISA', 'US Citizen', 0, 1, 100),
(307, 23261, 'Open Rate', 'NO', 0, 1, 100),
(308, 23261, 'Is Qualified', 'YES', 0, 1, 100),
(309, 23261, 'VISA', 'H1', 0, 1, 100),
(310, 23262, 'Is Qualified', 'YES', 0, 1, 100),
(311, 23263, 'Is Qualified', 'YES', 0, 1, 100),
(312, 23264, 'Is Qualified', 'YES', 0, 1, 100),
(313, 23265, 'Is Qualified', 'YES', 0, 1, 100),
(314, 23266, 'Is Qualified', 'YES', 0, 1, 100),
(315, 23266, 'VISA', 'US Citizen', 0, 1, 100),
(316, 23267, 'Is Qualified', 'YES', 0, 1, 100),
(317, 23267, 'VISA', 'US Citizen', 0, 1, 100),
(318, 23268, 'Is Qualified', 'YES', 0, 1, 100),
(319, 23268, 'VISA', 'US Citizen', 0, 1, 100),
(320, 23269, 'Open Rate', 'YES', 0, 1, 100),
(321, 23269, 'Is Qualified', 'YES', 0, 1, 100),
(322, 23269, 'VISA', 'H1', 0, 1, 100),
(323, 23270, 'Is Qualified', 'YES', 0, 1, 100),
(324, 23270, 'VISA', 'US Citizen', 0, 1, 100),
(325, 23271, 'Is Qualified', 'YES', 0, 1, 100),
(326, 23271, 'VISA', 'US Citizen', 0, 1, 100),
(327, 23272, 'Is Qualified', 'YES', 0, 1, 100),
(328, 23273, 'Is Qualified', 'YES', 0, 1, 100),
(329, 23273, 'VISA', 'US Citizen', 0, 1, 100),
(330, 23207, 'Is Qualified', 'YES', 0, 1, 100),
(331, 23207, 'VISA', 'H1', 0, 1, 100),
(332, 23206, 'Is Qualified', 'YES', 0, 1, 100),
(333, 23206, 'VISA', 'H1', 0, 1, 100),
(334, 23274, 'Is Qualified', 'YES', 0, 1, 100),
(336, 23276, 'Open Rate', 'NO', 0, 1, 100),
(337, 23276, 'Is Qualified', 'YES', 0, 1, 100),
(338, 23276, 'VISA', 'US Citizen', 0, 1, 100),
(339, 23277, 'Is Qualified', 'YES', 0, 1, 100),
(340, 23277, 'VISA', 'US Citizen', 0, 1, 100),
(341, 8295, 'Is Qualified', 'YES', 0, 1, 100),
(342, 8295, 'VISA', 'H1', 0, 1, 100),
(343, 23278, 'Is Qualified', 'YES', 0, 1, 100),
(344, 23278, 'VISA', 'GC', 0, 1, 100),
(345, 23279, 'Open Rate', 'YES', 0, 1, 100),
(346, 23279, 'Is Qualified', 'YES', 0, 1, 100),
(358, 23279, 'VISA', 'US Citizen', 0, 1, 100),
(348, 23280, 'Open Rate', 'YES', 0, 1, 100),
(349, 23280, 'Is Qualified', 'YES', 0, 1, 100),
(350, 23280, 'VISA', 'H1', 0, 1, 100),
(351, 23281, 'Open Rate', 'YES', 0, 1, 100),
(352, 23281, 'Is Qualified', 'YES', 0, 1, 100),
(353, 23281, 'VISA', 'H1', 0, 1, 100),
(354, 23282, 'Is Qualified', 'YES', 0, 1, 100),
(355, 23282, 'VISA', 'US Citizen', 0, 1, 100),
(356, 23283, 'Is Qualified', 'YES', 0, 1, 100),
(357, 23283, 'VISA', 'US Citizen', 0, 1, 100),
(359, 23284, 'Is Qualified', 'YES', 0, 1, 100),
(360, 23284, 'VISA', 'US Citizen', 0, 1, 100),
(361, 23286, 'Is Qualified', 'YES', 0, 1, 100),
(362, 23286, 'VISA', 'H1', 0, 1, 100),
(363, 23288, 'Open Rate', 'YES', 0, 1, 100),
(364, 23288, 'VISA', 'H1', 0, 1, 100),
(365, 23289, 'Open Rate', 'YES', 0, 1, 100),
(366, 23289, 'Is Qualified', 'YES', 0, 1, 100),
(367, 23289, 'VISA', 'H1', 0, 1, 100),
(368, 23287, 'Open Rate', 'YES', 0, 1, 100),
(369, 23287, 'Is Qualified', 'YES', 0, 1, 100),
(370, 23287, 'VISA', 'H1', 0, 1, 100),
(371, 23290, 'Open Rate', 'YES', 0, 1, 100),
(372, 23290, 'Is Qualified', 'YES', 0, 1, 100),
(373, 23290, 'VISA', 'US Citizen', 0, 1, 100),
(374, 23291, 'Open Rate', 'YES', 0, 1, 100),
(375, 23291, 'Is Qualified', 'YES', 0, 1, 100),
(376, 23291, 'VISA', 'GC', 0, 1, 100),
(377, 23292, 'Is Qualified', 'YES', 0, 1, 100),
(378, 23292, 'VISA', 'US Citizen', 0, 1, 100),
(379, 23293, 'Open Rate', 'YES', 0, 1, 100),
(380, 23293, 'Is Qualified', 'YES', 0, 1, 100),
(381, 23293, 'VISA', 'US Citizen', 0, 1, 100),
(404, 23303, 'Open Rate', 'NO', 0, 1, 100),
(383, 23295, 'Open Rate', 'YES', 0, 1, 100),
(384, 23295, 'Is Qualified', 'YES', 0, 1, 100),
(385, 23295, 'VISA', 'US Citizen', 0, 1, 100),
(386, 23296, 'Open Rate', 'NO', 0, 1, 100),
(387, 23296, 'Is Qualified', 'YES', 0, 1, 100),
(388, 23296, 'VISA', 'H1', 0, 1, 100),
(389, 22684, 'Open Rate', 'YES', 0, 1, 100),
(390, 22684, 'Is Qualified', 'YES', 0, 1, 100),
(391, 22684, 'VISA', 'H1', 0, 1, 100),
(392, 3962, 'Company Type', 'Client', 0, 1, 200),
(393, 23299, 'Open Rate', 'YES', 0, 1, 100),
(394, 23299, 'Is Qualified', 'YES', 0, 1, 100),
(395, 23300, 'Open Rate', 'YES', 0, 1, 100),
(396, 23300, 'Is Qualified', 'YES', 0, 1, 100),
(397, 23300, 'VISA', 'H1', 0, 1, 100),
(398, 23301, 'Open Rate', 'YES', 0, 1, 100),
(399, 23301, 'Is Qualified', 'YES', 0, 1, 100),
(400, 23301, 'VISA', 'H1', 0, 1, 100),
(401, 23302, 'Open Rate', 'NO', 0, 1, 100),
(402, 23302, 'Is Qualified', 'YES', 0, 1, 100),
(403, 23302, 'VISA', 'US Citizen', 0, 1, 100),
(405, 23303, 'Is Qualified', 'YES', 0, 1, 100),
(406, 23303, 'VISA', 'H1', 0, 1, 100),
(407, 23303, 'LinkedinProfile', 'https://www.linkedin.com/in/sridhar-nyalamadugula-1052107/', 0, 1, 100),
(408, 23304, 'Open Rate', 'YES', 0, 1, 100),
(409, 23304, 'Is Qualified', 'YES', 0, 1, 100),
(410, 23304, 'VISA', 'US Citizen', 0, 1, 100),
(411, 23305, 'Open Rate', 'YES', 0, 1, 100),
(412, 23305, 'Is Qualified', 'YES', 0, 1, 100),
(413, 23305, 'VISA', 'L1', 0, 1, 100),
(414, 23306, 'Is Qualified', 'YES', 0, 1, 100),
(415, 23306, 'VISA', 'US Citizen', 0, 1, 100),
(416, 23307, 'Open Rate', 'YES', 0, 1, 100),
(417, 23307, 'Is Qualified', 'YES', 0, 1, 100),
(418, 23307, 'VISA', 'US Citizen', 0, 1, 100),
(419, 23308, 'Is Qualified', 'YES', 0, 1, 100),
(420, 23308, 'VISA', 'US Citizen', 0, 1, 100),
(421, 23309, 'Open Rate', 'YES', 0, 1, 100),
(422, 23309, 'Is Qualified', 'YES', 0, 1, 100),
(423, 23309, 'VISA', 'US Citizen', 0, 1, 100),
(424, 23310, 'Open Rate', 'YES', 0, 1, 100),
(425, 23310, 'Is Qualified', 'YES', 0, 1, 100),
(426, 23310, 'VISA', 'H1', 0, 1, 100),
(427, 23311, 'Open Rate', 'YES', 0, 1, 100),
(428, 23311, 'Is Qualified', 'YES', 0, 1, 100),
(429, 23311, 'VISA', 'US Citizen', 0, 1, 100),
(430, 23312, 'Open Rate', 'YES', 0, 1, 100),
(431, 23312, 'Is Qualified', 'YES', 0, 1, 100),
(432, 23312, 'VISA', 'US Citizen', 0, 1, 100),
(441, 23316, 'Open Rate', 'YES', 0, 1, 100),
(440, 23315, 'VISA', 'H1', 0, 1, 100),
(439, 23315, 'Is Qualified', 'YES', 0, 1, 100),
(436, 23314, 'Open Rate', 'YES', 0, 1, 100),
(437, 23314, 'Is Qualified', 'YES', 0, 1, 100),
(438, 23314, 'VISA', 'US Citizen', 0, 1, 100),
(442, 23316, 'Is Qualified', 'YES', 0, 1, 100),
(443, 23316, 'VISA', 'H1', 0, 1, 100),
(444, 23317, 'Open Rate', 'YES', 0, 1, 100),
(445, 23317, 'Is Qualified', 'YES', 0, 1, 100),
(446, 23317, 'VISA', 'H1', 0, 1, 100),
(447, 23318, 'Open Rate', 'NO', 0, 1, 100),
(448, 23318, 'Is Qualified', 'YES', 0, 1, 100),
(449, 23318, 'VISA', 'H1', 0, 1, 100),
(450, 23318, 'LinkedinProfile', 'https://www.linkedin.com/in/nithya-moorthi-02b97b1a/', 0, 1, 100),
(451, 23319, 'Open Rate', 'NO', 0, 1, 100),
(452, 23319, 'Is Qualified', 'YES', 0, 1, 100),
(453, 23319, 'VISA', 'US Citizen', 0, 1, 100),
(454, 23319, 'LinkedinProfile', 'https://www.linkedin.com/in/keri-geiger-04210831/  ', 0, 1, 100),
(455, 23320, 'Open Rate', 'YES', 0, 1, 100),
(456, 23320, 'Is Qualified', 'YES', 0, 1, 100),
(457, 23320, 'VISA', 'H1', 0, 1, 100),
(458, 23321, 'Open Rate', 'YES', 0, 1, 100),
(459, 23321, 'Is Qualified', 'YES', 0, 1, 100),
(460, 23321, 'VISA', 'US Citizen', 0, 1, 100),
(461, 23321, 'LinkedinProfile', 'https://www.linkedin.com/in/omar-abuhasan-0b2041123', 0, 1, 100),
(462, 23322, 'Open Rate', 'YES', 0, 1, 100),
(463, 23322, 'Is Qualified', 'YES', 0, 1, 100),
(464, 23322, 'VISA', 'US Citizen', 0, 1, 100),
(465, 23323, 'Open Rate', 'YES', 0, 1, 100),
(466, 23323, 'Is Qualified', 'YES', 0, 1, 100),
(467, 23323, 'VISA', 'US Citizen', 0, 1, 100),
(468, 23324, 'Open Rate', 'YES', 0, 1, 100),
(469, 23324, 'Is Qualified', 'YES', 0, 1, 100),
(470, 23324, 'VISA', 'US Citizen', 0, 1, 100),
(471, 23325, 'Open Rate', 'NO', 0, 1, 100),
(472, 23325, 'Is Qualified', 'YES', 0, 1, 100),
(473, 23325, 'VISA', 'H1', 0, 1, 100),
(474, 23326, 'Open Rate', 'NO', 0, 1, 100),
(475, 23326, 'Is Qualified', 'YES', 0, 1, 100),
(476, 23326, 'VISA', 'US Citizen', 0, 1, 100),
(477, 23327, 'VISA', 'H1', 0, 1, 100),
(478, 23328, 'Open Rate', 'NO', 0, 1, 100),
(479, 23328, 'Is Qualified', 'YES', 0, 1, 100),
(480, 23328, 'VISA', 'H1', 0, 1, 100),
(481, 23328, 'LinkedinProfile', 'https://www.linkedin.com/in/aneesur-rahaman-mohammed-2a7420137/', 0, 1, 100),
(482, 23329, 'Is Qualified', 'YES', 0, 1, 100),
(483, 23329, 'VISA', 'H1', 0, 1, 100),
(484, 23330, 'Open Rate', 'YES', 0, 1, 100),
(485, 23330, 'Is Qualified', 'YES', 0, 1, 100),
(486, 23330, 'VISA', 'US Citizen', 0, 1, 100),
(487, 23331, 'Is Qualified', 'YES', 0, 1, 100),
(488, 23331, 'VISA', 'US Citizen', 0, 1, 100),
(489, 23332, 'Open Rate', 'NO', 0, 1, 100),
(490, 23332, 'Is Qualified', 'YES', 0, 1, 100),
(491, 23332, 'VISA', 'US Citizen', 0, 1, 100),
(492, 23332, 'LinkedinProfile', 'https://www.linkedin.com/in/faisal-lateef-80ba5017/', 0, 1, 100),
(493, 23333, 'Is Qualified', 'YES', 0, 1, 100),
(494, 23333, 'VISA', 'H1', 0, 1, 100),
(495, 22899, 'Is Qualified', 'YES', 0, 1, 100),
(496, 22843, 'Is Qualified', 'YES', 0, 1, 100),
(497, 23334, 'Is Qualified', 'YES', 0, 1, 100),
(498, 23334, 'VISA', 'H1', 0, 1, 100),
(499, 23335, 'Open Rate', 'NO', 0, 1, 100),
(500, 23335, 'Is Qualified', 'YES', 0, 1, 100),
(501, 23335, 'VISA', 'GC', 0, 1, 100),
(502, 23335, 'LinkedinProfile', 'https://www.linkedin.com/in/nishanth-reddy-chintal-a8a8b6134', 0, 1, 100),
(503, 23336, 'Open Rate', 'NO', 0, 1, 100),
(504, 23336, 'Is Qualified', 'YES', 0, 1, 100),
(505, 23336, 'VISA', 'H1', 0, 1, 100),
(506, 23336, 'LinkedinProfile', 'https://www.linkedin.com/in/raj-ganne-890440125/', 0, 1, 100),
(507, 23337, 'Is Qualified', 'YES', 0, 1, 100),
(508, 23337, 'VISA', 'GC', 0, 1, 100),
(509, 23338, 'Open Rate', 'YES', 0, 1, 100),
(510, 23338, 'Is Qualified', 'YES', 0, 1, 100),
(511, 23338, 'VISA', 'H1', 0, 1, 100),
(512, 23339, 'Open Rate', 'YES', 0, 1, 100),
(513, 23339, 'Is Qualified', 'YES', 0, 1, 100),
(514, 23339, 'VISA', 'US Citizen', 0, 1, 100),
(515, 18522, 'Open Rate', 'YES', 0, 1, 100),
(516, 18522, 'Is Qualified', 'YES', 0, 1, 100),
(517, 18522, 'VISA', 'H4', 0, 1, 100),
(518, 23340, 'Open Rate', 'YES', 0, 1, 100),
(519, 23340, 'Is Qualified', 'YES', 0, 1, 100),
(520, 23340, 'VISA', 'H1', 0, 1, 100),
(521, 23341, 'Open Rate', 'YES', 0, 1, 100),
(522, 23341, 'Is Qualified', 'YES', 0, 1, 100),
(523, 23341, 'VISA', 'H1', 0, 1, 100),
(524, 23342, 'Open Rate', 'NO', 0, 1, 100),
(525, 23342, 'Is Qualified', 'YES', 0, 1, 100),
(526, 23342, 'VISA', 'US Citizen', 0, 1, 100),
(527, 23342, 'LinkedinProfile', 'https://www.linkedin.com/in/rahel-araia-11b2228/', 0, 1, 100),
(528, 23343, 'Is Qualified', 'YES', 0, 1, 100),
(529, 23343, 'VISA', 'GC', 0, 1, 100),
(530, 16434, 'Is Qualified', 'YES', 0, 1, 100),
(531, 16434, 'VISA', 'US Citizen', 0, 1, 100),
(532, 23344, 'Is Qualified', 'YES', 0, 1, 100),
(533, 23344, 'VISA', 'US Citizen', 0, 1, 100),
(539, 23347, 'VISA', 'US Citizen', 0, 1, 100),
(538, 23347, 'Is Qualified', 'YES', 0, 1, 100),
(536, 23346, 'Is Qualified', 'YES', 0, 1, 100),
(537, 23346, 'VISA', 'US Citizen', 0, 1, 100),
(540, 23348, 'Open Rate', 'NO', 0, 1, 100),
(541, 23348, 'Is Qualified', 'YES', 0, 1, 100),
(542, 23348, 'VISA', 'US Citizen', 0, 1, 100),
(543, 23348, 'LinkedinProfile', 'https://www.linkedin.com/in/tomdavisiv/', 0, 1, 100),
(544, 23349, 'Open Rate', 'NO', 0, 1, 100),
(545, 23349, 'Is Qualified', 'YES', 0, 1, 100),
(546, 23349, 'VISA', 'Others', 0, 1, 100),
(547, 23349, 'LinkedinProfile', 'https://www.linkedin.com/in/myprofile-linkedin', 0, 1, 100),
(548, 23350, 'Is Qualified', 'YES', 0, 1, 100),
(549, 23350, 'VISA', 'H1', 0, 1, 100),
(550, 23350, 'LinkedinProfile', 'https://www.linkedin.com/in/navdeep-gill-20032817/', 0, 1, 100),
(551, 23351, 'Open Rate', 'NO', 0, 1, 100),
(552, 23351, 'Is Qualified', 'YES', 0, 1, 100),
(553, 23351, 'VISA', 'H1', 0, 1, 100),
(554, 23351, 'LinkedinProfile', 'LinkedIn.com/in/vpakala', 0, 1, 100),
(555, 3964, 'Company Type', 'Client', 0, 1, 200),
(556, 23352, 'Is Qualified', 'YES', 0, 1, 100),
(557, 23352, 'VISA', 'H1', 0, 1, 100),
(558, 23353, 'Is Qualified', 'YES', 0, 1, 100),
(559, 23353, 'VISA', 'H1', 0, 1, 100),
(560, 23354, 'Open Rate', 'YES', 0, 1, 100),
(561, 23354, 'Is Qualified', 'YES', 0, 1, 100),
(562, 23354, 'VISA', 'OPT', 0, 1, 100),
(563, 23355, 'Open Rate', 'NO', 0, 1, 100),
(564, 23355, 'Is Qualified', 'YES', 0, 1, 100),
(565, 23355, 'VISA', 'H1', 0, 1, 100),
(566, 23357, 'Is Qualified', 'YES', 0, 1, 100),
(567, 23357, 'VISA', 'H1', 0, 1, 100),
(568, 23358, 'Is Qualified', 'YES', 0, 1, 100),
(569, 23358, 'VISA', 'H1', 0, 1, 100),
(570, 23359, 'Is Qualified', 'YES', 0, 1, 100),
(571, 23359, 'VISA', 'H1', 0, 1, 100),
(572, 23360, 'Is Qualified', 'YES', 0, 1, 100),
(573, 23360, 'VISA', 'H1', 0, 1, 100),
(574, 23361, 'Open Rate', 'YES', 0, 1, 100),
(575, 23361, 'Is Qualified', 'YES', 0, 1, 100),
(576, 23361, 'VISA', 'US Citizen', 0, 1, 100),
(577, 23362, 'Open Rate', 'YES', 0, 1, 100),
(578, 23362, 'Is Qualified', 'YES', 0, 1, 100),
(579, 23362, 'VISA', 'H1', 0, 1, 100),
(580, 23363, 'Open Rate', 'YES', 0, 1, 100),
(581, 23363, 'Is Qualified', 'YES', 0, 1, 100),
(582, 23363, 'VISA', 'H1', 0, 1, 100),
(583, 23364, 'Open Rate', 'NO', 0, 1, 100),
(584, 23364, 'Is Qualified', 'YES', 0, 1, 100),
(585, 23364, 'VISA', 'H1', 0, 1, 100),
(586, 23364, 'LinkedinProfile', 'N/A', 0, 1, 100),
(587, 23365, 'Open Rate', 'NO', 0, 1, 100),
(588, 23365, 'Is Qualified', 'YES', 0, 1, 100),
(589, 23365, 'VISA', 'US Citizen', 0, 1, 100),
(590, 23365, 'LinkedinProfile', 'https://www.linkedin.com/mynetwork/invite-sent/bonita-bush-mba-735703b/', 0, 1, 100),
(591, 23366, 'Open Rate', 'NO', 0, 1, 100),
(592, 23366, 'Is Qualified', 'YES', 0, 1, 100),
(593, 23366, 'VISA', 'US Citizen', 0, 1, 100),
(594, 23366, 'LinkedinProfile', 'https://www.linkedin.com/in/prasun-srivastava-0a30b96/', 0, 1, 100),
(595, 23367, 'Open Rate', 'NO', 0, 1, 100),
(596, 23367, 'Is Qualified', 'YES', 0, 1, 100),
(597, 23367, 'VISA', 'H1', 0, 1, 100),
(598, 23368, 'Open Rate', 'YES', 0, 1, 100),
(599, 23368, 'Is Qualified', 'YES', 0, 1, 100),
(600, 23368, 'VISA', 'H1', 0, 1, 100),
(601, 23369, 'Open Rate', 'YES', 0, 1, 100),
(602, 23369, 'Is Qualified', 'YES', 0, 1, 100),
(603, 23369, 'VISA', 'H1', 0, 1, 100),
(604, 23370, 'Open Rate', 'YES', 0, 1, 100),
(605, 23370, 'Is Qualified', 'YES', 0, 1, 100),
(606, 23370, 'VISA', 'H1', 0, 1, 100),
(607, 23371, 'Open Rate', 'NO', 0, 1, 100),
(608, 23371, 'Is Qualified', 'YES', 0, 1, 100),
(609, 23371, 'VISA', 'GC', 0, 1, 100),
(610, 23371, 'LinkedinProfile', 'https://www.linkedin.com/in/vasutha-ramachandran-77748511/', 0, 1, 100),
(611, 23372, 'VISA', 'H1', 0, 1, 100),
(612, 23373, 'Open Rate', 'NO', 0, 1, 100),
(613, 23373, 'Is Qualified', 'YES', 0, 1, 100),
(614, 23373, 'VISA', 'US Citizen', 0, 1, 100),
(615, 23374, 'Open Rate', 'NO', 0, 1, 100),
(616, 23374, 'Is Qualified', 'YES', 0, 1, 100),
(617, 23374, 'VISA', 'GC', 0, 1, 100),
(618, 23374, 'LinkedinProfile', 'https://www.linkedin.com/in/wladislawapte/', 0, 1, 100),
(619, 23375, 'Open Rate', 'NO', 0, 1, 100),
(620, 23375, 'Is Qualified', 'YES', 0, 1, 100),
(621, 23375, 'VISA', 'GC', 0, 1, 100),
(622, 23375, 'LinkedinProfile', 'https://www.linkedin.com/in/venugopal-sankineni-ba520519/', 0, 1, 100),
(623, 23376, 'Is Qualified', 'YES', 0, 1, 100),
(624, 23376, 'VISA', 'H1', 0, 1, 100),
(625, 23376, 'LinkedinProfile', 'www.linkedin.com/in/sandeep-nawkar-70046940', 0, 1, 100),
(626, 23377, 'Open Rate', 'YES', 0, 1, 100),
(627, 23377, 'Is Qualified', 'YES', 0, 1, 100),
(628, 23377, 'VISA', 'GC', 0, 1, 100),
(629, 23378, 'Open Rate', 'YES', 0, 1, 100),
(630, 23378, 'Is Qualified', 'YES', 0, 1, 100),
(631, 23378, 'VISA', 'H1', 0, 1, 100),
(632, 23378, 'LinkedinProfile', 'https://www.linkedin.com/in/pmanchu ', 0, 1, 100),
(633, 23379, 'Open Rate', 'YES', 0, 1, 100),
(634, 23379, 'Is Qualified', 'YES', 0, 1, 100),
(635, 23379, 'VISA', 'H1', 0, 1, 100),
(636, 23379, 'LinkedinProfile', 'https://www.linkedin.com/in/rajesh-kumar-ac-995b544/', 0, 1, 100),
(637, 23380, 'Open Rate', 'NO', 0, 1, 100),
(638, 23380, 'Is Qualified', 'YES', 0, 1, 100),
(639, 23380, 'VISA', 'US Citizen', 0, 1, 100),
(640, 23381, 'Open Rate', 'YES', 0, 1, 100),
(641, 23381, 'Is Qualified', 'YES', 0, 1, 100),
(642, 23381, 'VISA', 'H1', 0, 1, 100),
(643, 23382, 'Open Rate', 'YES', 0, 1, 100),
(644, 23382, 'Is Qualified', 'YES', 0, 1, 100),
(645, 23382, 'VISA', 'US Citizen', 0, 1, 100),
(646, 23382, 'LinkedinProfile', 'www.linkedin.com/in/georgeskragbe', 0, 1, 100),
(647, 23383, 'Open Rate', 'YES', 0, 1, 100),
(648, 23383, 'Is Qualified', 'YES', 0, 1, 100),
(649, 23383, 'VISA', 'GC', 0, 1, 100),
(650, 23384, 'Open Rate', 'YES', 0, 1, 100),
(651, 23384, 'Is Qualified', 'YES', 0, 1, 100),
(652, 23384, 'VISA', 'US Citizen', 0, 1, 100),
(653, 23384, 'LinkedinProfile', 'https://www.linkedin.com/in/craigtreisch/', 0, 1, 100),
(654, 23385, 'Open Rate', 'NO', 0, 1, 100),
(655, 23385, 'Is Qualified', 'YES', 0, 1, 100),
(656, 23385, 'VISA', 'H1', 0, 1, 100),
(657, 23386, 'Open Rate', 'YES', 0, 1, 100),
(658, 23386, 'Is Qualified', 'YES', 0, 1, 100),
(659, 23386, 'VISA', 'H1', 0, 1, 100),
(660, 23386, 'LinkedinProfile', 'https://www.linkedin.com/in/vamsitari/', 0, 1, 100),
(661, 23387, 'Is Qualified', 'YES', 0, 1, 100),
(662, 23387, 'VISA', 'H1', 0, 1, 100),
(663, 23388, 'Is Qualified', 'YES', 0, 1, 100),
(664, 23388, 'VISA', 'H1', 0, 1, 100),
(665, 23389, 'Open Rate', 'YES', 0, 1, 100),
(666, 23389, 'Is Qualified', 'YES', 0, 1, 100),
(667, 23389, 'VISA', 'Others', 0, 1, 100),
(668, 23390, 'Open Rate', 'YES', 0, 1, 100),
(669, 23390, 'Is Qualified', 'YES', 0, 1, 100),
(670, 23390, 'VISA', 'H1', 0, 1, 100),
(671, 23391, 'Open Rate', 'YES', 0, 1, 100),
(672, 23391, 'VISA', 'US Citizen', 0, 1, 100),
(673, 23392, 'Is Qualified', 'YES', 0, 1, 100),
(674, 23392, 'VISA', 'US Citizen', 0, 1, 100),
(675, 23393, 'Open Rate', 'YES', 0, 1, 100),
(676, 23393, 'Is Qualified', 'YES', 0, 1, 100),
(677, 23393, 'VISA', 'H1', 0, 1, 100),
(678, 23394, 'Open Rate', 'YES', 0, 1, 100),
(679, 23394, 'Is Qualified', 'YES', 0, 1, 100),
(680, 23394, 'VISA', 'Others', 0, 1, 100),
(681, 23395, 'Open Rate', 'YES', 0, 1, 100),
(682, 23395, 'Is Qualified', 'YES', 0, 1, 100),
(683, 23395, 'VISA', 'H1', 0, 1, 100),
(684, 23396, 'Open Rate', 'YES', 0, 1, 100),
(685, 23396, 'Is Qualified', 'YES', 0, 1, 100),
(686, 23396, 'VISA', 'H1', 0, 1, 100),
(687, 23396, 'LinkedinProfile', 'http://linkedin.com/in/gautham-reddy-r-7a7a0910a', 0, 1, 100),
(688, 23397, 'Open Rate', 'YES', 0, 1, 100),
(689, 23397, 'Is Qualified', 'YES', 0, 1, 100),
(690, 23397, 'VISA', 'H1', 0, 1, 100),
(691, 23398, 'Open Rate', 'YES', 0, 1, 100),
(692, 23398, 'Is Qualified', 'YES', 0, 1, 100),
(693, 23398, 'VISA', 'US Citizen', 0, 1, 100),
(694, 23398, 'LinkedinProfile', 'linkedin.com/in/james-guenes-21290a56', 0, 1, 100),
(695, 23399, 'Open Rate', 'YES', 0, 1, 100),
(696, 23399, 'Is Qualified', 'YES', 0, 1, 100),
(697, 23399, 'VISA', 'Others', 0, 1, 100),
(698, 23400, 'Open Rate', 'NO', 0, 1, 100),
(699, 23400, 'Is Qualified', 'YES', 0, 1, 100),
(700, 23400, 'VISA', 'H1', 0, 1, 100),
(701, 23401, 'Is Qualified', 'YES', 0, 1, 100),
(702, 23401, 'VISA', 'H1', 0, 1, 100),
(703, 7858, 'Open Rate', 'YES', 0, 1, 100),
(704, 7858, 'Is Qualified', 'YES', 0, 1, 100),
(705, 7858, 'VISA', 'H1', 0, 1, 100),
(706, 23402, 'Open Rate', 'YES', 0, 1, 100),
(707, 23402, 'Is Qualified', 'YES', 0, 1, 100),
(708, 23402, 'VISA', 'GC', 0, 1, 100),
(709, 23402, 'LinkedinProfile', 'https://www.linkedin.com/in/raquib-hasan-74118447/', 0, 1, 100),
(710, 23022, 'Open Rate', 'YES', 0, 1, 100),
(711, 23022, 'Is Qualified', 'YES', 0, 1, 100),
(712, 23022, 'VISA', 'H1', 0, 1, 100),
(713, 23403, 'Open Rate', 'YES', 0, 1, 100),
(714, 23403, 'Is Qualified', 'YES', 0, 1, 100),
(715, 23403, 'VISA', 'US Citizen', 0, 1, 100),
(716, 23404, 'Open Rate', 'YES', 0, 1, 100),
(717, 23404, 'Is Qualified', 'YES', 0, 1, 100),
(718, 23404, 'VISA', 'US Citizen', 0, 1, 100),
(719, 23405, 'Open Rate', 'YES', 0, 1, 100),
(720, 23405, 'Is Qualified', 'YES', 0, 1, 100),
(721, 23405, 'VISA', 'US Citizen', 0, 1, 100),
(722, 23406, 'Is Qualified', 'YES', 0, 1, 100),
(723, 23406, 'LinkedinProfile', 'linkedin.com/in/kishore-nadimpalli-b157a6127', 0, 1, 100),
(724, 23407, 'Open Rate', 'YES', 0, 1, 100),
(725, 23407, 'Is Qualified', 'YES', 0, 1, 100),
(726, 23407, 'VISA', 'H1', 0, 1, 100),
(840, 32424, 'Contact', '4/28/17', 0, 1, 300),
(841, 32425, 'Contact', '4/28/17', 0, 1, 300),
(847, 32427, 'Contact', '5/09/17 ', 0, 1, 300),
(850, 32429, 'Contact', '5/09/17', 0, 1, 300),
(851, 32430, 'Contact', '5/10/17', 0, 1, 300),
(861, 32432, 'Contact', '5/17/17 vm', 0, 1, 300),
(890, 26675, 'Open Rate', 'NO', 0, 1, 100),
(891, 26675, 'Is Qualified', 'YES', 0, 1, 100),
(892, 26675, 'VISA', 'H1', 0, 1, 100),
(893, 26675, 'LinkedinProfile', 'https://www.linkedin.com/in/vinay-vaddempudi-712b97115/', 0, 1, 100),
(894, 26676, 'Is Qualified', 'YES', 0, 1, 100),
(895, 26676, 'VISA', 'GC', 0, 1, 100),
(896, 26677, 'Open Rate', 'YES', 0, 1, 100),
(897, 26677, 'Is Qualified', 'YES', 0, 1, 100),
(898, 26677, 'VISA', 'Others', 0, 1, 100),
(899, 26677, 'LinkedinProfile', 'https://www.linkedin.com/in/carlos-hernandez-21375732/', 0, 1, 100),
(900, 26678, 'Open Rate', 'YES', 0, 1, 100),
(901, 26678, 'Is Qualified', 'YES', 0, 1, 100),
(902, 26678, 'VISA', 'US Citizen', 0, 1, 100),
(903, 26678, 'LinkedinProfile', 'https://www.linkedin.com/in/rajnishkaushik/', 0, 1, 100),
(904, 26679, 'Open Rate', 'YES', 0, 1, 100),
(905, 26679, 'Is Qualified', 'YES', 0, 1, 100),
(906, 26679, 'VISA', 'H1', 0, 1, 100),
(907, 26680, 'Open Rate', 'YES', 0, 1, 100),
(908, 26680, 'Is Qualified', 'YES', 0, 1, 100),
(909, 26680, 'VISA', 'US Citizen', 0, 1, 100),
(910, 26681, 'Open Rate', 'YES', 0, 1, 100),
(911, 26681, 'Is Qualified', 'YES', 0, 1, 100),
(912, 26681, 'VISA', 'H1', 0, 1, 100),
(913, 5985, 'Is Qualified', 'YES', 0, 1, 100),
(914, 5985, 'VISA', 'US Citizen', 0, 1, 100),
(915, 5970, 'Is Qualified', 'YES', 0, 1, 100),
(916, 5970, 'VISA', 'US Citizen', 0, 1, 100),
(917, 26682, 'Is Qualified', 'YES', 0, 1, 100),
(918, 26682, 'VISA', 'US Citizen', 0, 1, 100),
(919, 26683, 'Is Qualified', 'YES', 0, 1, 100),
(920, 26683, 'VISA', 'US Citizen', 0, 1, 100),
(921, 26684, 'Open Rate', 'YES', 0, 1, 100),
(922, 26684, 'Is Qualified', 'YES', 0, 1, 100),
(923, 26684, 'VISA', 'H1', 0, 1, 100),
(924, 26685, 'Is Qualified', 'YES', 0, 1, 100),
(925, 26685, 'VISA', 'GC', 0, 1, 100),
(926, 26685, 'LinkedinProfile', 'https://www.linkedin.com/in/narasimha-r-45986b13b/', 0, 1, 100),
(927, 26686, 'Open Rate', 'YES', 0, 1, 100),
(928, 26686, 'Is Qualified', 'YES', 0, 1, 100),
(929, 26686, 'VISA', 'GC', 0, 1, 100),
(930, 26687, 'Open Rate', 'YES', 0, 1, 100),
(931, 26687, 'Is Qualified', 'YES', 0, 1, 100),
(932, 26687, 'VISA', 'US Citizen', 0, 1, 100),
(933, 26688, 'Is Qualified', 'YES', 0, 1, 100),
(934, 26688, 'VISA', 'H1', 0, 1, 100),
(935, 26689, 'VISA', 'H1', 0, 1, 100),
(936, 26690, 'Is Qualified', 'YES', 0, 1, 100),
(937, 26690, 'VISA', 'US Citizen', 0, 1, 100),
(938, 26691, 'Open Rate', 'YES', 0, 1, 100),
(939, 26691, 'Is Qualified', 'YES', 0, 1, 100),
(940, 26691, 'VISA', 'H1', 0, 1, 100),
(941, 26692, 'Open Rate', 'YES', 0, 1, 100),
(942, 26692, 'Is Qualified', 'YES', 0, 1, 100),
(943, 26692, 'VISA', 'GC', 0, 1, 100),
(944, 26693, 'Open Rate', 'YES', 0, 1, 100),
(945, 26693, 'Is Qualified', 'YES', 0, 1, 100),
(946, 26693, 'VISA', 'H1', 0, 1, 100),
(947, 26694, 'Is Qualified', 'YES', 0, 1, 100),
(948, 26694, 'VISA', 'US Citizen', 0, 1, 100),
(949, 26695, 'Is Qualified', 'YES', 0, 1, 100),
(950, 26695, 'VISA', 'GC', 0, 1, 100),
(951, 26696, 'Open Rate', 'YES', 0, 1, 100),
(952, 26696, 'Is Qualified', 'YES', 0, 1, 100),
(953, 26696, 'VISA', 'US Citizen', 0, 1, 100),
(954, 26697, 'Is Qualified', 'YES', 0, 1, 100),
(955, 26697, 'VISA', 'GC', 0, 1, 100),
(956, 26698, 'Open Rate', 'YES', 0, 1, 100),
(957, 26698, 'Is Qualified', 'YES', 0, 1, 100),
(958, 26698, 'VISA', 'US Citizen', 0, 1, 100),
(959, 26699, 'Open Rate', 'YES', 0, 1, 100),
(960, 26699, 'Is Qualified', 'YES', 0, 1, 100),
(961, 26699, 'VISA', 'H4', 0, 1, 100),
(962, 26700, 'Open Rate', 'YES', 0, 1, 100),
(963, 26700, 'Is Qualified', 'YES', 0, 1, 100),
(964, 26700, 'VISA', 'US Citizen', 0, 1, 100),
(965, 26701, 'Open Rate', 'YES', 0, 1, 100),
(966, 26701, 'Is Qualified', 'YES', 0, 1, 100),
(967, 26701, 'VISA', 'US Citizen', 0, 1, 100),
(968, 26702, 'Open Rate', 'YES', 0, 1, 100),
(969, 26702, 'Is Qualified', 'YES', 0, 1, 100),
(970, 26702, 'VISA', 'US Citizen', 0, 1, 100),
(971, 26703, 'Open Rate', 'YES', 0, 1, 100),
(972, 26703, 'Is Qualified', 'YES', 0, 1, 100),
(973, 26703, 'VISA', 'US Citizen', 0, 1, 100),
(974, 26704, 'Open Rate', 'YES', 0, 1, 100),
(975, 26704, 'Is Qualified', 'YES', 0, 1, 100),
(976, 26704, 'VISA', 'H1', 0, 1, 100),
(977, 26705, 'Open Rate', 'NO', 0, 1, 100),
(978, 26705, 'Is Qualified', 'YES', 0, 1, 100),
(979, 26705, 'VISA', 'H1', 0, 1, 100),
(980, 26705, 'LinkedinProfile', 'https://www.linkedin.com/in/vijaykumarnanjappa', 0, 1, 100),
(981, 26706, 'Open Rate', 'YES', 0, 1, 100),
(982, 26706, 'Is Qualified', 'YES', 0, 1, 100),
(983, 26706, 'VISA', 'H1', 0, 1, 100),
(984, 26707, 'Is Qualified', 'YES', 0, 1, 100),
(985, 26707, 'VISA', 'US Citizen', 0, 1, 100),
(986, 26708, 'Open Rate', 'NO', 0, 1, 100),
(987, 26708, 'Is Qualified', 'YES', 0, 1, 100),
(988, 26708, 'VISA', 'H1', 0, 1, 100),
(989, 26709, 'Open Rate', 'YES', 0, 1, 100),
(990, 26709, 'Is Qualified', 'YES', 0, 1, 100),
(991, 26709, 'VISA', 'US Citizen', 0, 1, 100),
(992, 26710, 'Open Rate', 'YES', 0, 1, 100),
(993, 26710, 'Is Qualified', 'YES', 0, 1, 100),
(994, 26710, 'VISA', 'H1', 0, 1, 100),
(995, 26710, 'LinkedinProfile', 'https://www.linkedin.com/in/sanjeev-raghuvanshi-b50b967/', 0, 1, 100),
(996, 26711, 'Is Qualified', 'YES', 0, 1, 100),
(997, 26711, 'VISA', 'US Citizen', 0, 1, 100),
(998, 26711, 'LinkedinProfile', 'https://www.linkedin.com/in/ed-pilote-pmp-a932032', 0, 1, 100),
(1004, 26713, 'VISA', 'US Citizen', 0, 1, 100),
(1002, 26713, 'Open Rate', 'YES', 0, 1, 100),
(1003, 26713, 'Is Qualified', 'YES', 0, 1, 100),
(1005, 26713, 'LinkedinProfile', ' https://www.linkedin.com/in/eylemalper', 0, 1, 100),
(1006, 26714, 'Open Rate', 'YES', 0, 1, 100),
(1007, 26714, 'Is Qualified', 'YES', 0, 1, 100),
(1008, 26714, 'VISA', 'US Citizen', 0, 1, 100),
(1009, 26715, 'Is Qualified', 'YES', 0, 1, 100),
(1010, 26715, 'VISA', 'H1', 0, 1, 100),
(1011, 26716, 'Open Rate', 'YES', 0, 1, 100),
(1012, 26716, 'Is Qualified', 'YES', 0, 1, 100),
(1013, 26716, 'VISA', 'GC', 0, 1, 100),
(1014, 26717, 'Open Rate', 'YES', 0, 1, 100),
(1015, 26717, 'Is Qualified', 'YES', 0, 1, 100),
(1016, 26717, 'VISA', 'US Citizen', 0, 1, 100),
(1017, 26718, 'Is Qualified', 'YES', 0, 1, 100),
(1018, 26718, 'VISA', 'H1', 0, 1, 100),
(1019, 26719, 'Is Qualified', 'YES', 0, 1, 100),
(1020, 26719, 'VISA', 'H1', 0, 1, 100),
(1021, 26720, 'Open Rate', 'YES', 0, 1, 100),
(1022, 26720, 'Is Qualified', 'YES', 0, 1, 100),
(1023, 26720, 'VISA', 'H1', 0, 1, 100),
(1024, 26720, 'LinkedinProfile', 'https://www.linkedin.com/in/nithish-mule-0120a7143/', 0, 1, 100),
(1025, 26721, 'Open Rate', 'YES', 0, 1, 100),
(1026, 26721, 'Is Qualified', 'YES', 0, 1, 100),
(1027, 26721, 'VISA', 'US Citizen', 0, 1, 100),
(1028, 26721, 'LinkedinProfile', 'https://www.linkedin.com/in/max-gomez-52639164/', 0, 1, 100),
(1036, 26724, 'Is Qualified', 'YES', 0, 1, 100),
(1035, 26723, 'VISA', 'H1', 0, 1, 100),
(1033, 26723, 'Open Rate', 'YES', 0, 1, 100),
(1034, 26723, 'Is Qualified', 'YES', 0, 1, 100),
(1037, 26724, 'VISA', 'GC', 0, 1, 100),
(1038, 26725, 'Is Qualified', 'YES', 0, 1, 100),
(1039, 26725, 'VISA', 'US Citizen', 0, 1, 100),
(1040, 26726, 'Is Qualified', 'YES', 0, 1, 100),
(1041, 26726, 'VISA', 'US Citizen', 0, 1, 100),
(1042, 26727, 'Open Rate', 'YES', 0, 1, 100),
(1043, 26727, 'Is Qualified', 'YES', 0, 1, 100),
(1044, 26727, 'VISA', 'H1', 0, 1, 100),
(1045, 26728, 'Open Rate', 'YES', 0, 1, 100),
(1046, 26728, 'Is Qualified', 'YES', 0, 1, 100),
(1047, 26728, 'VISA', 'H1', 0, 1, 100),
(1048, 26729, 'Open Rate', 'YES', 0, 1, 100),
(1049, 26729, 'Is Qualified', 'YES', 0, 1, 100),
(1050, 26729, 'VISA', 'US Citizen', 0, 1, 100),
(1051, 26729, 'LinkedinProfile', 'linkedin.com/in/larsbell', 0, 1, 100),
(1052, 26730, 'Open Rate', 'YES', 0, 1, 100),
(1053, 26730, 'Is Qualified', 'YES', 0, 1, 100),
(1054, 26730, 'VISA', 'H1', 0, 1, 100),
(1055, 26730, 'LinkedinProfile', 'https://www.linkedin.com/in/bishal-sinha-04630787/', 0, 1, 100),
(1056, 26731, 'Open Rate', 'YES', 0, 1, 100),
(1057, 26731, 'Is Qualified', 'YES', 0, 1, 100),
(1058, 26731, 'VISA', 'GC', 0, 1, 100),
(1059, 26732, 'Open Rate', 'YES', 0, 1, 100),
(1060, 26732, 'Is Qualified', 'YES', 0, 1, 100),
(1061, 26732, 'VISA', 'H1', 0, 1, 100),
(1062, 26733, 'Open Rate', 'YES', 0, 1, 100),
(1063, 26733, 'Is Qualified', 'YES', 0, 1, 100),
(1064, 26733, 'VISA', 'US Citizen', 0, 1, 100),
(1065, 26734, 'Is Qualified', 'YES', 0, 1, 100),
(1066, 26734, 'VISA', 'US Citizen', 0, 1, 100),
(1067, 26735, 'Is Qualified', 'YES', 0, 1, 100),
(1068, 26735, 'VISA', 'H1', 0, 1, 100),
(1069, 26736, 'Is Qualified', 'YES', 0, 1, 100),
(1070, 26736, 'VISA', 'GC', 0, 1, 100),
(1071, 26737, 'Is Qualified', 'YES', 0, 1, 100),
(1072, 26737, 'VISA', 'GC', 0, 1, 100),
(1073, 26738, 'Is Qualified', 'YES', 0, 1, 100),
(1074, 26738, 'VISA', 'H1', 0, 1, 100),
(1075, 7243, 'Open Rate', 'NO', 0, 1, 100),
(1076, 7243, 'VISA', 'H1', 0, 1, 100),
(1077, 26739, 'Is Qualified', 'YES', 0, 1, 100),
(1078, 26739, 'VISA', 'H1', 0, 1, 100),
(1079, 26740, 'Is Qualified', 'YES', 0, 1, 100),
(1080, 26740, 'VISA', 'H1', 0, 1, 100),
(1081, 26741, 'Open Rate', 'YES', 0, 1, 100),
(1082, 26741, 'Is Qualified', 'YES', 0, 1, 100),
(1083, 26741, 'VISA', 'H1', 0, 1, 100),
(1084, 26742, 'Is Qualified', 'YES', 0, 1, 100),
(1085, 26742, 'VISA', 'H4', 0, 1, 100),
(1086, 26742, 'LinkedinProfile', 'https://www.linkedin.com/in/avani-v-717055135/', 0, 1, 100),
(1087, 26743, 'Open Rate', 'YES', 0, 1, 100),
(1088, 26743, 'Is Qualified', 'YES', 0, 1, 100),
(1089, 26743, 'VISA', 'H1', 0, 1, 100),
(1090, 3946, 'Company Type', 'Client', 0, 1, 200),
(1091, 26744, 'Is Qualified', 'YES', 0, 1, 100),
(1092, 26744, 'VISA', 'US Citizen', 0, 1, 100),
(1093, 26745, 'Open Rate', 'YES', 0, 1, 100),
(1094, 26745, 'Is Qualified', 'YES', 0, 1, 100),
(1095, 26745, 'VISA', 'GC', 0, 1, 100),
(1096, 26745, 'LinkedinProfile', 'https://www.linkedin.com/in/indrakaran-reddy-soma-281a8b12b/', 0, 1, 100),
(1097, 15994, 'Is Qualified', 'YES', 0, 1, 100),
(1098, 15994, 'VISA', 'US Citizen', 0, 1, 100),
(1099, 26746, 'Is Qualified', 'YES', 0, 1, 100),
(1100, 26746, 'VISA', 'US Citizen', 0, 1, 100),
(1101, 26747, 'Is Qualified', 'YES', 0, 1, 100),
(1102, 26747, 'VISA', 'US Citizen', 0, 1, 100),
(1103, 26748, 'Open Rate', 'YES', 0, 1, 100),
(1104, 26748, 'Is Qualified', 'YES', 0, 1, 100),
(1105, 26748, 'VISA', 'US Citizen', 0, 1, 100),
(1106, 26749, 'Open Rate', 'YES', 0, 1, 100),
(1107, 26749, 'Is Qualified', 'YES', 0, 1, 100),
(1108, 26749, 'VISA', 'US Citizen', 0, 1, 100),
(1109, 26750, 'Is Qualified', 'YES', 0, 1, 100),
(1110, 26750, 'VISA', 'US Citizen', 0, 1, 100),
(1111, 26751, 'Open Rate', 'YES', 0, 1, 100),
(1112, 26751, 'Is Qualified', 'YES', 0, 1, 100),
(1113, 26751, 'VISA', 'H1', 0, 1, 100),
(1114, 26752, 'Open Rate', 'YES', 0, 1, 100),
(1115, 26752, 'Is Qualified', 'YES', 0, 1, 100),
(1116, 26752, 'VISA', 'US Citizen', 0, 1, 100),
(1117, 26753, 'Open Rate', 'YES', 0, 1, 100),
(1118, 26753, 'Is Qualified', 'YES', 0, 1, 100),
(1119, 26753, 'VISA', 'H1', 0, 1, 100),
(1120, 26753, 'LinkedinProfile', 'https://www.linkedin.com/in/sindhuri-ch-29b377114/', 0, 1, 100),
(1121, 26754, 'Open Rate', 'YES', 0, 1, 100),
(1122, 26754, 'Is Qualified', 'YES', 0, 1, 100),
(1123, 26754, 'VISA', 'US Citizen', 0, 1, 100),
(1124, 26755, 'Open Rate', 'YES', 0, 1, 100),
(1125, 26755, 'Is Qualified', 'YES', 0, 1, 100),
(1126, 26755, 'VISA', 'H1', 0, 1, 100),
(1127, 26756, 'Open Rate', 'YES', 0, 1, 100),
(1128, 26756, 'Is Qualified', 'YES', 0, 1, 100),
(1129, 26756, 'VISA', 'US Citizen', 0, 1, 100),
(1130, 26757, 'Open Rate', 'YES', 0, 1, 100),
(1131, 26757, 'Is Qualified', 'YES', 0, 1, 100),
(1132, 26757, 'VISA', 'H1', 0, 1, 100),
(1133, 26757, 'LinkedinProfile', 'https://www.linkedin.com/in/sheeba-chambadandavida-168b6820/', 0, 1, 100),
(1134, 26758, 'Is Qualified', 'YES', 0, 1, 100),
(1135, 26758, 'VISA', 'H1', 0, 1, 100),
(1136, 26759, 'Open Rate', 'YES', 0, 1, 100),
(1137, 26759, 'Is Qualified', 'YES', 0, 1, 100),
(1138, 26759, 'VISA', 'H1', 0, 1, 100),
(1139, 26759, 'LinkedinProfile', 'https://www.linkedin.com/in/prathibha-nakka-497564141/', 0, 1, 100),
(1140, 26760, 'Open Rate', 'YES', 0, 1, 100),
(1141, 26760, 'Is Qualified', 'YES', 0, 1, 100),
(1142, 26760, 'VISA', 'H1', 0, 1, 100),
(1143, 26760, 'LinkedinProfile', 'https://www.linkedin.com/in/sudipta-mukhopadhyay-5515921/', 0, 1, 100),
(1144, 26761, 'Is Qualified', 'YES', 0, 1, 100),
(1145, 26761, 'VISA', 'US Citizen', 0, 1, 100),
(1146, 26762, 'Is Qualified', 'YES', 0, 1, 100),
(1147, 26762, 'VISA', 'US Citizen', 0, 1, 100),
(1148, 26763, 'Open Rate', 'YES', 0, 1, 100),
(1149, 26763, 'Is Qualified', 'YES', 0, 1, 100),
(1150, 26763, 'VISA', 'H4', 0, 1, 100),
(1151, 26763, 'LinkedinProfile', 'https://www.linkedin.com/in/manu-rajput-a0969569/', 0, 1, 100),
(1152, 26764, 'Open Rate', 'YES', 0, 1, 100),
(1153, 26764, 'Is Qualified', 'YES', 0, 1, 100),
(1154, 26764, 'VISA', 'US Citizen', 0, 1, 100),
(1155, 26765, 'Open Rate', 'YES', 0, 1, 100),
(1156, 26765, 'Is Qualified', 'YES', 0, 1, 100),
(1157, 26765, 'VISA', 'US Citizen', 0, 1, 100),
(1158, 26765, 'LinkedinProfile', 'https://www.linkedin.com/in/reazul-huq-0ba702137/', 0, 1, 100),
(1159, 26766, 'Open Rate', 'YES', 0, 1, 100),
(1160, 26766, 'Is Qualified', 'YES', 0, 1, 100),
(1161, 26766, 'VISA', 'H1', 0, 1, 100),
(1162, 26766, 'LinkedinProfile', 'https://www.linkedin.com/in/raghavaiahchandu/', 0, 1, 100);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `extra_field`
--
ALTER TABLE `extra_field`
  ADD PRIMARY KEY (`extra_field_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `extra_field`
--
ALTER TABLE `extra_field`
  MODIFY `extra_field_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1163;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
