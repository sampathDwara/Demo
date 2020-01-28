-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 10, 2017 at 12:40 PM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `skd0709`
--

--
-- Dumping data for table `calendar_event`
--

INSERT INTO `calendar_event` (`calendar_event_id`, `type`, `date`, `title`, `all_day`, `data_item_id`, `data_item_type`, `entered_by`, `date_created`, `date_modified`, `site_id`, `joborder_id`, `description`, `duration`, `reminder_enabled`, `reminder_email`, `reminder_time`, `public`) VALUES
(319, 300, '2016-11-26 10:00:00', 'CATS', 0, -1, -1, 1258, '2016-11-16 15:51:42', '2016-11-16 15:51:42', 1, -1, 'CATS WORKFLOW', 60, 0, 'shineyr@radcube.com', 15, 1),
(320, 400, '2016-11-18 10:00:00', 'qa analyst', 0, 16036, 300, 1258, '2016-11-17 20:42:32', '2016-11-17 20:42:32', 1, -1, '', -1, 0, 'shineyr@radcube.com', 15, 1),
(322, 400, '2016-11-18 13:00:00', 'INTERVIEW', 0, 22792, 100, 1258, '2016-11-18 14:47:38', '2016-11-18 14:47:38', 1, -1, '', 60, 0, 'shineyr@radcube.com', 15, 0),
(323, 400, '2017-03-01 13:00:00', 'BMV interview', 0, 23246, 100, 1265, '2017-02-20 16:12:28', '2017-02-20 16:12:28', 1, -1, 'This interview will take place at IGCN, in BMV which is on the 4th floor.  Please ask Sandeep to allot plenty of time to find parking on his own (street or mall parking) and make it through security.  He can ask for Barb Tuttle upon arrival.  He will be interviewing with Jacki Webster & a couple of other developers.', 60, 0, 'Rogerr@skilldemand.com', 15, 0),
(512, 400, '2017-05-12 08:30:00', 'Jonathan Decoro', 0, 23407, -1, 2536, '2017-05-11 10:24:44', '2017-05-11 10:24:44', 1, 5669, 'Tim Smart', 60, 0, 'joys@stprofessionals.com', 15, 1),
(508, 400, '2017-05-10 09:00:00', 'Grace Theofanis', 0, 23407, -1, 2536, '2017-05-10 09:00:44', '2017-05-10 09:00:44', 1, 5669, 'Wendy Harrold\r\n\r\n402 W Washington St Room W353,\r\nIndianapolis, IN 46204', 60, 0, 'joys@stprofessionals.com', 15, 0),
(498, 400, '2017-05-09 09:30:00', 'Glennolia Reeves', 0, 23407, -1, 2531, '2017-05-05 17:13:58', '2017-05-05 17:13:58', 1, 5669, 'Glennolia Reeves\r\n\r\nInterview details:\r\nBrian Taylor\r\n100 N Senate Ave Room N055\r\nIndianapolis, IN 46204', 60, 0, 'sams@stprofessionals.com', 15, 1),
(477, 400, '2017-04-28 10:00:00', 'Mariana Dunville', 0, 23408, 0, 2536, '2017-04-26 15:03:38', '2017-04-26 15:15:27', 1, 5670, 'Lyndsey Zweig.\r\n\r\n132 E Washington St \r\nChild Abuse Hotline Call Center (Bld 132) \r\nIndianapolis, IN 46204', 60, 0, 'joys@stprofessionals.com', 15, 1),
(486, 400, '2017-05-02 15:00:00', 'robbin Orr', 0, 23408, 0, 2531, '2017-05-01 10:58:29', '2017-05-01 10:59:09', 1, 5670, 'Robbin Orr\r\n\r\nInterview details:\r\nJ Michelle Chadd\r\nDepartment of Child Services\r\n121 Ridgeland Road\r\nGreencastle, IN  46135', 60, 0, 'sams@stprofessionals.com', 15, 1),
(476, 400, '2017-04-26 10:30:00', 'Sheronda Johnson', 0, 23407, -1, 2536, '2017-04-26 09:16:34', '2017-04-26 09:16:34', 1, 5669, 'Katie Byers and Tracy Hicks.\r\n\r\n402 W Washington St Room W072 \r\nIndianapolis, IN 46204.', 60, 0, 'joys@stprofessionals.com', 15, 1),
(462, 400, '2017-04-18 12:00:00', 'frank james', 0, 23407, -1, 2536, '2017-04-12 16:01:12', '2017-04-12 16:01:12', 1, 5669, '', 60, 0, 'joys@stprofessionals.com', 15, 1),
(463, 400, '2017-04-18 13:30:00', 'Ashley Wildman', 0, 23407, -1, 2533, '2017-04-12 16:05:39', '2017-04-12 16:05:39', 1, 5669, '', 60, 0, 'kevinj@skilldemand.com', 15, 1),
(455, 400, '2017-04-11 10:00:00', 'Gary Bush', 0, 23408, 0, 2533, '2017-04-10 10:45:14', '2017-04-10 10:49:33', 1, 5670, '201 E Rudisill Blvd Fort Wayne, IN 46806', 60, 0, 'kevinj@skilldemand.com', 15, 1),
(444, 400, '2017-04-05 09:00:00', 'Logan Wolfschlag', 0, 23407, -1, 2530, '2017-03-30 14:10:35', '2017-03-30 14:10:35', 1, 5669, 'Wednesday, April 5th at 09:00 AM\r\nWednesday, April 5th at 09:00 AM', 60, 0, 'markr@stprofessionals.com', 15, 1),
(443, 400, '2017-03-31 10:00:00', 'Hillary Montgomery', 0, 23408, 0, 2536, '2017-03-29 10:46:43', '2017-03-31 10:40:38', 1, 5670, 'Tiffany Houchin\r\nIndiana Department of Child Services\r\n1045 Wernsing Road\r\nJasper, IN 47546', 60, 0, 'joys@stprofessionals.com', 15, 1),
(442, 400, '2017-04-05 09:00:00', 'Yolanda', 0, 23408, 0, 2530, '2017-03-29 09:48:44', '2017-03-30 15:26:09', 1, 5670, 'On Tuesday, you''ll report to the address below and ask for Kimberly Simmons upon arrival:\r\n \r\n100 North Senate Avenue Room N103 Room \r\nIndianapolis, IN 46204', 60, 0, 'markr@stprofessionals.com', 15, 1),
(441, 400, '2017-03-31 09:00:00', 'Mamadou diallo', 0, 23407, -1, 2530, '2017-03-28 15:14:57', '2017-03-28 15:14:57', 1, 5669, '2 N Meridian St Room 2N06105 \r\nIndianapolis, IN 46204\r\n\r\nRamzi Nimry', 60, 0, 'markr@stprofessionals.com', 15, 1),
(438, 400, '2017-03-29 09:00:00', 'Dorian Ursery', 0, 23407, -1, 2530, '2017-03-24 09:11:21', '2017-03-24 09:11:21', 1, 5669, 'Interview Requested requested for 3/29 @ 9 am (wednesday)', 60, 0, 'markr@stprofessionals.com', 15, 1),
(437, 400, '2017-03-27 13:00:00', 'Veronica Halsell', 0, 23407, -1, 2530, '2017-03-23 09:57:49', '2017-03-23 09:57:49', 1, 5669, 'Interview details:\r\nLyndsey Zweig\r\nIndiana Department of Child Services\r\n132 E. Washington St., 3rd Floor\r\nIndianapolis, IN 46204', 60, 0, 'markr@stprofessionals.com', 15, 1),
(434, 400, '2017-03-23 14:00:00', 'Jessica Gresko', 0, 23407, -1, 2536, '2017-03-21 15:04:51', '2017-03-21 15:04:51', 1, 5669, 'Michell Avieo\r\n201 East Rudisill Boulevard\r\nSuite 200\r\nFort Wayne, Indiana 46806', 60, 0, 'joys@stprofessionals.com', 15, 1),
(433, 400, '2017-04-03 13:00:00', 'Heather Heck', 0, 23408, 0, 2536, '2017-03-21 13:11:56', '2017-03-29 08:58:13', 1, 5670, '3528 W Two Mile House Rd \r\nColumbus, IN 47201', 60, 0, 'joys@stprofessionals.com', 15, 1),
(436, 400, '2017-03-27 10:00:00', 'Brittney McLucas', 0, 23408, 0, 2530, '2017-03-23 09:57:14', '2017-03-23 09:57:20', 1, 5670, 'Interview details:\r\nLyndsey Zweig\r\nIndiana Department of Child Services\r\n132 E. Washington St., 3rd Floor\r\nIndianapolis, IN 46204', 60, 0, 'markr@stprofessionals.com', 15, 1),
(422, 400, '2017-03-07 13:00:00', 'Mabelle Garcia', 0, 23408, 0, 2530, '2017-03-03 12:00:02', '2017-03-06 09:40:28', 1, 5670, 'March 7th Tuesday at 1p at 230 Mary Ave., Greenfield, IN.', 60, 0, 'markr@stprofessionals.com', 15, 1),
(423, 400, '2017-03-09 14:00:00', 'Delma Warren', 0, 23407, -1, 2530, '2017-03-06 14:53:56', '2017-03-06 14:53:56', 1, 5669, 'Thursday, March 9th at 02:00 PM\r\nOn Thursday, you''ll report to the address below and ask for Jaclyn Allemon upon arrival:\r\n \r\nBoone County Department of Child Services\r\n1614 North Lebanon Street\r\nLebanon, In 46052', 60, 0, 'markr@stprofessionals.com', 15, 1),
(424, 400, '2017-03-09 13:00:00', 'Nicole King', 0, 23407, -1, 2530, '2017-03-07 09:51:15', '2017-03-07 09:51:15', 1, 5669, 'Thank you for confirming the interview on Thursday, March 9th at 01:00 PM\r\n\r\n\r\nOn Thursday, you''ll report to the address below and ask for Sandy Widener upon arrival:\r\n \r\n840 N Miller Ave  \r\nMarion, IN 46952', 60, 0, 'markr@stprofessionals.com', 15, 1),
(419, 400, '2017-03-02 13:00:00', 'Maria Saravia', 0, 23407, -1, 2530, '2017-03-01 06:52:54', '2017-03-01 06:52:54', 1, 5669, '03/02/2017 (Thursday) @ 13:00.', 60, 0, 'markr@stprofessionals.com', 15, 1),
(420, 400, '2017-03-08 14:00:00', 'Anita Nzenwa', 0, 23407, -1, 2530, '2017-03-01 11:17:50', '2017-03-01 11:17:50', 1, 5669, 'Anita confirmed her interview on Wednesday March 8th at 02:00 PM\r\n\r\nInterview details:\r\nKatie Hokanson and Murray Lawry\r\n2 N Meridian St Room 2N06105\r\nIndianapolis, IN 46204', 60, 0, 'markr@stprofessionals.com', 15, 1),
(417, 400, '2017-03-03 16:00:00', 'Noah Wurl', 0, 23407, -1, 2530, '2017-02-24 08:39:56', '2017-02-24 08:39:56', 1, 5669, 'Interview Confirmed on Friday, March 3rd at 04:00 PM', 60, 0, 'markr@stprofessionals.com', 15, 1),
(415, 400, '2017-02-22 10:00:00', 'Kiana Goodlow', 0, 23407, -1, 2530, '2017-02-21 15:09:04', '2017-02-21 15:09:04', 1, 5669, 'Interview Confirmed on Wednesday, February 22nd at 10:00 AM', 60, 0, 'markr@stprofessionals.com', 15, 1),
(414, 400, '2017-02-27 14:00:00', 'Mabelle Garcia', 0, 23407, -1, 2530, '2017-02-21 14:54:23', '2017-02-21 14:54:23', 1, 5669, 'Interview Confirmed on Monday, February 27th at 02:00 PM', 60, 0, 'markr@stprofessionals.com', 15, 1),
(413, 400, '2017-02-24 10:00:00', 'Robin D''Agostino', 0, 23407, -1, 2530, '2017-02-21 12:49:52', '2017-02-21 12:49:52', 1, 5669, 'Robin D/Agostino\r\n \r\nInterview details:\r\nSandra Lock\r\n57 W Washington St\r\nFrankfort, IN 46041', 60, 0, 'markr@stprofessionals.com', 15, 1),
(412, 400, '2017-02-23 14:00:00', 'Tammico Manns', 0, 23407, -1, 2530, '2017-02-21 09:14:15', '2017-02-21 09:14:15', 1, 5669, 'Tammico Manns\r\n \r\nInterview details:\r\nKimberly Snyder\r\n302 W Washington St Room E208\r\nIndianapolis, IN 46204', 60, 0, 'markr@stprofessionals.com', 15, 1),
(411, 400, '2017-02-23 12:00:00', 'Sherrie Davidson Balazs', 0, 23407, -1, 2530, '2017-02-21 06:35:16', '2017-02-21 06:35:16', 1, 5669, 'Thursday, February 23rd  at 12:00 PM', 60, 0, 'markr@stprofessionals.com', 15, 1),
(405, 400, '2017-02-21 12:00:00', 'Nathanael Kilburg', 0, 23407, -1, 2530, '2017-02-16 12:18:24', '2017-02-16 12:18:24', 1, 5669, 'Tuesday, February 21st  at 12:00 PM', 60, 0, 'markr@stprofessionals.com', 15, 1),
(401, 400, '2017-02-22 10:00:00', 'Latasha Ross', 0, 23407, -1, 2530, '2017-02-14 07:16:05', '2017-02-14 07:16:05', 1, 5669, 'Latasha Ross\r\nConfirmed @ 10:00 am on Wednesdat Feb 22nd.', 60, 0, 'markr@stprofessionals.com', 15, 1),
(400, 400, '2017-02-22 09:00:00', 'Jama Lynn Bales', 0, 23407, -1, 2530, '2017-02-14 07:14:52', '2017-02-14 07:14:52', 1, 5669, '09:00 am on Wednesday Feb 22nd.\r\nJama Lynn Bales', 60, 0, 'markr@stprofessionals.com', 15, 1),
(397, 400, '2017-02-22 09:00:00', 'Jama Bales', 0, 23407, -1, 2531, '2017-02-13 14:58:47', '2017-02-13 14:58:47', 1, 5669, '', 60, 0, 'sams@stprofessionals.com', 15, 0),
(393, 400, '2017-02-16 12:00:00', 'Nathanael Kilburg', 0, 23407, -1, 2530, '2017-02-06 13:36:53', '2017-02-06 13:36:53', 1, 5669, '', 60, 0, 'markr@stprofessionals.com', 15, 1),
(392, 400, '2017-02-09 15:30:00', 'Marie Harness', 0, 23407, -1, 2530, '2017-02-06 07:12:46', '2017-02-06 07:12:46', 1, 5669, '', 60, 0, 'markr@stprofessionals.com', 15, 1),
(391, 400, '2017-02-09 15:00:00', 'Mary Jo Woodruff', 0, 23407, -1, 2530, '2017-02-06 07:12:04', '2017-02-06 07:12:04', 1, 5669, '', 60, 0, 'markr@stprofessionals.com', 15, 1),
(388, 400, '2017-02-06 11:00:00', 'Teresa Kelsey', 0, 23408, 0, 2530, '2017-02-03 11:31:54', '2017-02-03 11:32:01', 1, 5670, 'Monday, February 6th at 11:00 AM', 60, 0, 'markr@stprofessionals.com', 15, 1),
(384, 400, '2017-02-03 15:00:00', 'Caleb Myers', 0, 23408, 0, 2530, '2017-01-31 10:51:16', '2017-02-02 13:39:13', 1, 5670, 'Interview Confirmed Feburary 3rd Friday 03:00 PM', 60, 0, 'markr@stprofessionals.com', 15, 1),
(385, 400, '2017-02-07 11:30:00', 'Deal Mason', 0, 23408, 0, 2530, '2017-01-31 11:41:50', '2017-02-02 13:39:36', 1, 5670, 'Interview on Feb 7th Tuesday @ 11:30 AM.', 60, 0, 'markr@stprofessionals.com', 15, 1),
(383, 400, '2017-02-01 11:00:00', 'victoria 2nd', 0, 23407, -1, 2530, '2017-01-30 09:42:40', '2017-01-30 09:42:40', 1, 5669, '', 60, 0, 'markr@stprofessionals.com', 15, 0),
(381, 400, '2017-01-26 14:00:00', 'Vicky McCallister', 0, 23407, -1, 2530, '2017-01-24 12:38:34', '2017-01-24 12:38:34', 1, 5669, '', 60, 0, 'markr@stprofessionals.com', 15, 0),
(377, 400, '2017-01-18 08:30:00', 'Robert branham', 0, 23407, -1, 2530, '2017-01-17 10:23:55', '2017-01-17 10:23:55', 1, 5669, '', 60, 0, 'markr@stprofessionals.com', 15, 0),
(371, 400, '2017-01-18 10:00:00', 'Hannah Woodward', 0, 23407, -1, 2530, '2017-01-16 08:23:26', '2017-01-16 08:23:26', 1, 5669, '', 60, 0, 'markr@stprofessionals.com', 15, 0),
(372, 400, '2017-01-18 09:00:00', 'Marie Harness', 0, 23407, -1, 2530, '2017-01-16 08:23:58', '2017-01-16 08:23:58', 1, 5669, '', 60, 0, 'markr@stprofessionals.com', 15, 0),
(373, 400, '2017-01-18 13:00:00', 'Marian Freeman', 0, 23407, -1, 2530, '2017-01-16 08:24:15', '2017-01-16 08:24:15', 1, 5669, '', 60, 0, 'markr@stprofessionals.com', 15, 0),
(367, 400, '2017-01-17 14:30:00', 'Rain Weaver', 0, 23407, -1, 2530, '2017-01-12 19:59:53', '2017-01-12 19:59:53', 1, 5669, '', 60, 0, 'markr@stprofessionals.com', 15, 0),
(364, 400, '2017-01-19 10:00:00', 'Victoria Chiatula', 0, 23407, -1, 2530, '2017-01-11 15:02:07', '2017-01-11 15:02:07', 1, 5669, '', 60, 0, 'markr@stprofessionals.com', 15, 0),
(365, 400, '2017-01-18 12:00:00', 'Susan Haagsma', 0, 23407, -1, 2530, '2017-01-11 15:26:05', '2017-01-11 15:26:05', 1, 5669, '', 60, 0, 'markr@stprofessionals.com', 15, 0),
(366, 400, '2017-01-12 15:00:00', 'Samantha Brown Hurley', 0, 23407, -1, 2530, '2017-01-11 15:53:43', '2017-01-11 15:53:43', 1, 5669, '', 60, 0, 'markr@stprofessionals.com', 15, 0),
(361, 400, '2017-01-18 08:00:00', 'Robin Orr', 0, 23407, -1, 2530, '2017-01-10 15:24:07', '2017-01-10 15:24:07', 1, 5669, '', 60, 0, 'markr@stprofessionals.com', 15, 0),
(362, 400, '2017-01-11 10:00:00', 'Morgan Rees', 0, 23408, 0, 2530, '2017-01-10 15:35:18', '2017-01-10 16:17:04', 1, 5670, '', 60, 0, 'markr@stprofessionals.com', 15, 0),
(356, 400, '2017-01-12 12:00:00', 'Wil', 0, 23408, 0, 2530, '2017-01-09 19:35:11', '2017-01-09 19:36:33', 1, 5670, '', 60, 0, 'markr@stprofessionals.com', 15, 0),
(357, 400, '2017-01-12 10:00:00', 'Latosha', 0, 23407, -1, 2530, '2017-01-09 19:36:21', '2017-01-09 19:36:21', 1, 5669, '', 60, 0, 'markr@stprofessionals.com', 15, 0),
(358, 400, '2017-01-12 11:00:00', 'Jenny M. Phelps', 0, 23407, -1, 2530, '2017-01-09 19:37:34', '2017-01-09 19:37:34', 1, 5669, '', 60, 0, 'markr@stprofessionals.com', 15, 0),
(582, 400, '2017-06-02 14:30:00', 'Jonathan Decoro-CDI', 0, 23407, -1, 2536, '2017-06-01 14:39:50', '2017-06-01 14:39:50', 1, 5669, 'BRYAN PLOEG\r\n\r\n3580 Shaw Blvd, Naples, FL 34117, USA', 60, 0, 'joys@stprofessionals.com', 15, 1),
(586, 400, '2017-06-05 13:00:00', 'Shamone R. Christmas', 0, 23407, -1, 2531, '2017-06-02 12:10:50', '2017-06-02 12:10:50', 1, 5669, 'Shamone R. Christmas June 2nd at 3PM Interview details: Katie Byers 402 W Washington St Room W072 Indianapolis, IN 46204', 60, 0, 'sams@stprofessionals.com', 15, 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
