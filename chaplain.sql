-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 25, 2018 at 03:47 PM
-- Server version: 5.6.39
-- PHP Version: 7.0.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chaplain`
--

-- --------------------------------------------------------

--
-- Table structure for table `chaplains`
--

CREATE TABLE `chaplains` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `faith` varchar(50) DEFAULT NULL,
  `faith_type` int(11) NOT NULL,
  `rank` varchar(50) DEFAULT NULL,
  `hometown` varchar(100) DEFAULT NULL,
  `creator_id` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `chaplains`
--

INSERT INTO `chaplains` (`id`, `name`, `faith`, `faith_type`, `rank`, `hometown`, `creator_id`, `date_created`) VALUES
(1, 'John P. Washington', 'Roman Catholic', 1, 'Lieutenant 1st Class', 'Newark, New Jersey', 2, '2018-03-29 15:56:24'),
(2, 'Joseph T. O\'Callahan', 'Jesuit', 1, 'Lieutenant Commander', 'Roxbury, Massachusetts', 1, '2018-03-29 15:57:19'),
(3, 'Aloysius H. Schmitt ', 'Roman Catholic', 1, 'Lieutenant', 'St. Lucas, Iowa', 3, '2018-03-30 02:12:09'),
(19, 'George S. Rentz', NULL, 2, 'Commander', 'Lebanon, Pennsylvania', 0, '2018-04-17 03:20:19'),
(20, 'Franz Justus Rarkowski', 'Roman', 1, 'Episcopus Castrensis', 'Olsztyn, Poland', 0, '2018-04-17 16:00:41'),
(21, 'George L. Fox', NULL, 2, 'Lieutenant', 'Lewistown, Pennsylvania', 0, '2018-04-17 20:25:31'),
(23, 'Herman Felhoelter', NULL, 2, 'Chaplain', 'Lousiville, KY', 0, '2018-04-18 15:39:58'),
(24, 'Edwin J. Kozak', 'Roman', 1, 'Colonel', 'Baltimore, Maryland', 0, '2018-04-18 17:15:05'),
(30, 'Charles I. Carpenter ', NULL, 2, 'Major General', 'Wilmington, Delaware ', 0, '2018-04-19 15:19:37'),
(31, 'Robert P. Taylor', NULL, 2, 'Major General', 'Henderson, Texas', 0, '2018-04-19 15:23:20'),
(37, 'Alexander D. Goode', NULL, 0, 'Lieutenant', 'Brooklyn, New York', 5, '2018-04-20 16:22:08'),
(43, 'Ruth Louise Kinzeler ', NULL, 2, 'Captain', NULL, 5, '2018-04-20 20:05:39'),
(46, 'Ivan Neill', NULL, 2, 'Chaplain to the Forces 3rd class', 'County Tipperary', 5, '2018-04-21 01:37:41');

-- --------------------------------------------------------

--
-- Table structure for table `chaplain_actions`
--

CREATE TABLE `chaplain_actions` (
  `id` int(11) NOT NULL,
  `fkUser` int(11) NOT NULL,
  `chaplainName` varchar(50) NOT NULL,
  `actionType` int(11) NOT NULL COMMENT '0 add chaplain, 1 edit, 2 delete, 3 add timeline, 4 edit, 5 delete',
  `timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `chaplain_actions`
--

INSERT INTO `chaplain_actions` (`id`, `fkUser`, `chaplainName`, `actionType`, `timestamp`) VALUES
(1, 4, 'John P. Washington', 1, '2018-04-14 02:11:30'),
(2, 4, 'John Washington', 1, '2018-04-14 02:12:19'),
(3, 1, 'Test Person', 1, '2018-04-14 02:12:30'),
(4, 2, 'Test priest', 0, '2018-04-14 02:12:36'),
(5, 1, 'Test Person', 1, '2018-04-14 02:12:39'),
(6, 1, 'Test Personj', 1, '2018-04-14 02:12:45'),
(7, 1, 'Hello', 1, '2018-04-14 02:29:48'),
(8, 4, 'John P. Washington', 1, '2018-04-14 02:51:26'),
(9, 2, 'Test chaplain 2', 0, '2018-04-14 02:51:33'),
(10, 4, 'John P. Washington', 1, '2018-04-14 02:53:11'),
(11, 2, 'Test chaplain 3', 0, '2018-04-14 03:03:23'),
(12, 2, 'Test chaplain 3', 3, '2018-04-14 03:03:41'),
(13, 2, 'mr. bogus', 0, '2018-04-14 03:40:47'),
(14, 2, 'mr. bogus', 2, '2018-04-14 03:41:02'),
(15, 5, 'Arun Antho', 0, '2018-04-15 11:47:42'),
(16, 5, 'divya arun', 0, '2018-04-15 11:53:09'),
(17, 5, 'divya antho', 1, '2018-04-15 11:53:41'),
(18, 5, 'Johannes Maria Assmann', 0, '2018-04-16 15:24:43'),
(19, 5, 'Johannes Maria Assmann', 3, '2018-04-16 15:26:10'),
(20, 5, 'Johannes Maria Assmann', 3, '2018-04-16 15:26:37'),
(21, 5, 'Aloysius H. Schmitt ', 4, '2018-04-16 15:29:48'),
(22, 5, 'John Johnson', 0, '2018-04-16 15:32:04'),
(23, 5, 'divya antho', 1, '2018-04-16 15:32:52'),
(24, 5, 'George S. Rentz', 0, '2018-04-17 03:20:19'),
(25, 5, 'John P. Washington', 3, '2018-04-17 03:25:34'),
(26, 5, 'Franz Rarkowski', 0, '2018-04-17 16:00:41'),
(27, 5, 'Franz Rarkowski', 3, '2018-04-17 16:02:23'),
(28, 5, 'Franz Rarkowski', 3, '2018-04-17 16:03:15'),
(29, 5, 'Arun Antho', 1, '2018-04-17 16:06:30'),
(30, 5, 'Arun Antho', 3, '2018-04-17 16:06:48'),
(31, 5, 'George L. Fox', 0, '2018-04-17 20:25:31'),
(32, 5, 'George L. Fox', 3, '2018-04-17 20:27:22'),
(33, 5, 'George L. Fox', 3, '2018-04-17 20:28:16'),
(34, 5, 'Joseph T. O\'Callahan', 0, '2018-04-17 21:00:17'),
(35, 5, 'Herman Felhoelter', 0, '2018-04-18 15:39:58'),
(36, 5, 'Herman Felhoelter', 3, '2018-04-18 15:40:33'),
(37, 5, 'Herman Felhoelter', 3, '2018-04-18 15:42:22'),
(38, 5, 'Joseph T. O\'Callahan', 3, '2018-04-18 15:47:01'),
(39, 5, 'Edwin J. Kozak', 0, '2018-04-18 17:15:05'),
(40, 5, 'Divya Antho', 1, '2018-04-18 17:18:51'),
(41, 5, 'Franz Justus Rarkowski', 0, '2018-04-18 18:48:31'),
(42, 8, 'Mario', 0, '2018-04-18 19:02:51'),
(43, 8, 'Mario', 1, '2018-04-18 19:04:32'),
(44, 5, 'John Doe', 0, '2018-04-18 19:25:24'),
(45, 5, 'John Doe', 1, '2018-04-18 19:26:35'),
(46, 5, 'Joseph T. O\'Callahan', 0, '2018-04-18 20:45:02'),
(47, 5, 'Joseph T. O\'Callahan', 3, '2018-04-18 20:46:07'),
(48, 5, 'Joseph T. O\'Callahan', 3, '2018-04-18 20:47:08'),
(49, 5, 'John P. Washington', 4, '2018-04-18 20:49:03'),
(50, 5, 'John P. Washington', 3, '2018-04-18 20:50:06'),
(51, 5, 'William Kelt', 0, '2018-04-18 23:43:30'),
(52, 5, 'Franz Rarkowski', 3, '2018-04-18 23:44:14'),
(53, 6, 'Charles I. Carpenter ', 0, '2018-04-19 15:19:37'),
(54, 6, 'Robert P. Taylor', 0, '2018-04-19 15:23:20'),
(55, 6, 'Mario', 2, '2018-04-19 15:27:35'),
(56, 5, 'George S.Renz', 0, '2018-04-19 17:40:01'),
(57, 5, 'John P. Washington', 5, '2018-04-19 17:41:34'),
(58, 5, 'BigD McGee', 0, '2018-04-20 04:31:11'),
(59, 9, 'Herman G. Felhoelter', 0, '2018-04-20 04:31:49'),
(60, 9, 'John Johnson', 1, '2018-04-20 04:33:09'),
(61, 5, 'William R. Arnold', 0, '2018-04-20 15:32:52'),
(62, 5, 'William R. Arnold', 3, '2018-04-20 15:37:01'),
(63, 10, 'Connor Rudy', 0, '2018-04-20 15:56:49'),
(64, 10, 'John Johnson', 1, '2018-04-20 15:58:07'),
(65, 5, 'Rabbi Alexander D. Goode', 0, '2018-04-20 16:22:08'),
(66, 5, 'Rabbi Alexander D. Goode', 3, '2018-04-20 16:23:29'),
(67, 5, 'Rabbi Alexander D. Goode', 3, '2018-04-20 16:24:09'),
(68, 5, 'Somya Malasri', 0, '2018-04-20 17:05:01'),
(69, 5, 'Somya Malasri', 3, '2018-04-20 17:05:44'),
(70, 5, 'Somya Malasri', 3, '2018-04-20 17:06:11'),
(71, 5, 'Joseph T. O\'Callahan', 4, '2018-04-20 17:08:20'),
(72, 5, 'Joseph T. O\'Callahan', 4, '2018-04-20 17:08:34'),
(73, 5, 'Steve Jordanson', 0, '2018-04-20 18:28:05'),
(74, 5, 'Joseph T. O\'Callahan', 3, '2018-04-20 18:28:52'),
(75, 5, 'William R. Arnold', 0, '2018-04-20 18:45:32'),
(76, 5, 'William Addison', 0, '2018-04-20 19:01:06'),
(77, 5, 'William Addison', 3, '2018-04-20 19:01:33'),
(78, 5, 'William Addison', 3, '2018-04-20 19:02:07'),
(79, 5, 'Divya Antho', 3, '2018-04-20 19:02:49'),
(80, 5, 'John Man', 0, '2018-04-20 19:13:36'),
(81, 5, 'John P. Washington', 1, '2018-04-20 19:14:43'),
(82, 5, 'Ruth L. Kinzeler ', 0, '2018-04-20 20:05:39'),
(83, 5, 'Ruth L. Kinzeler ', 3, '2018-04-20 20:07:46'),
(84, 5, 'Ruth L. Kinzeler ', 3, '2018-04-20 20:08:43'),
(85, 5, 'George L. Fox', 1, '2018-04-20 20:12:03'),
(86, 5, 'George L. Fox', 1, '2018-04-20 20:12:28'),
(87, 5, 'George L. Fox', 4, '2018-04-20 20:13:10'),
(88, 5, 'Charles Symons', 0, '2018-04-20 21:03:38'),
(89, 5, 'John Man', 1, '2018-04-20 21:06:53'),
(90, 11, 'Johannes Maria Assmann', 0, '2018-04-20 21:22:31'),
(91, 5, 'Arun Antho', 3, '2018-04-20 21:38:16'),
(92, 5, 'Ivan Neill', 0, '2018-04-21 01:37:41'),
(93, 5, 'Ivan Neill', 3, '2018-04-21 01:59:58'),
(94, 5, 'Ivan Neill', 3, '2018-04-21 02:01:24'),
(95, 5, 'John Johnson', 3, '2018-04-21 02:05:01'),
(96, 5, 'Divya Antho', 4, '2018-04-21 02:06:16'),
(97, 5, 'Judah Nadich', 0, '2018-04-21 04:39:06'),
(98, 5, 'John Doe', 3, '2018-04-21 04:41:55'),
(99, 1, 'Herman Felhoelter', 3, '2018-04-23 23:42:48'),
(100, 1, 'Herman Felhoelter', 5, '2018-04-23 23:42:51'),
(101, 1, 'John P. Washington', 3, '2018-04-23 23:49:05'),
(102, 1, 'John P. Washington', 5, '2018-04-25 14:57:41'),
(103, 1, 'Joseph T. O\'Callahan', 4, '2018-04-25 14:58:49'),
(104, 1, 'Aloysius H. Schmitt ', 3, '2018-04-25 15:00:05'),
(105, 1, 'Aloysius H. Schmitt ', 4, '2018-04-25 15:02:39'),
(106, 1, 'Arun Antho', 2, '2018-04-25 15:03:54'),
(107, 1, 'Divya Antho', 2, '2018-04-25 15:04:26'),
(108, 1, 'Johannes Maria Assmann', 4, '2018-04-25 15:05:57'),
(109, 1, 'Johannes Maria Assmann', 2, '2018-04-25 15:06:26'),
(110, 1, 'John Johnson', 2, '2018-04-25 15:06:34'),
(111, 1, 'George S. Rentz', 1, '2018-04-25 15:07:16'),
(112, 1, 'George S. Rentz', 3, '2018-04-25 15:07:51'),
(113, 1, 'George S. Rentz', 3, '2018-04-25 15:09:29'),
(114, 1, 'George S. Rentz', 3, '2018-04-25 15:11:51'),
(115, 1, 'George S. Rentz', 4, '2018-04-25 15:12:24'),
(116, 1, 'Franz Justus Rarkowski', 1, '2018-04-25 15:17:22'),
(117, 1, 'Franz Justus Rarkowski', 4, '2018-04-25 15:21:01'),
(118, 1, 'Franz Justus Rarkowski', 3, '2018-04-25 15:22:35'),
(119, 1, 'Franz Justus Rarkowski', 1, '2018-04-25 15:22:43'),
(120, 1, 'Franz Justus Rarkowski', 3, '2018-04-25 15:23:23'),
(121, 1, 'Franz Justus Rarkowski', 1, '2018-04-25 15:23:53'),
(122, 1, 'John P. Washington', 1, '2018-04-25 15:24:24'),
(123, 1, 'Joseph T. O\'Callahan', 2, '2018-04-25 15:24:34'),
(124, 1, 'George L. Fox', 1, '2018-04-25 15:25:07'),
(125, 1, 'Edwin J. Kozak', 1, '2018-04-25 15:27:42'),
(126, 1, 'Edwin J. Kozak', 3, '2018-04-25 15:28:44'),
(127, 1, 'Edwin J. Kozak', 3, '2018-04-25 15:29:16'),
(128, 1, 'Edwin J. Kozak', 1, '2018-04-25 15:29:37'),
(129, 1, 'Edwin J. Kozak', 3, '2018-04-25 15:30:15'),
(130, 1, 'Franz Justus Rarkowski', 2, '2018-04-25 15:30:36'),
(131, 1, 'John Doe', 2, '2018-04-25 15:30:55'),
(132, 1, 'Joseph T. O\'Callahan', 2, '2018-04-25 15:31:04'),
(133, 1, 'William Kelt', 2, '2018-04-25 15:31:22'),
(134, 1, 'Charles I. Carpenter ', 3, '2018-04-25 15:32:07'),
(135, 1, 'Charles I. Carpenter ', 3, '2018-04-25 15:33:06'),
(136, 1, 'Charles I. Carpenter ', 3, '2018-04-25 15:33:48'),
(137, 1, 'Charles I. Carpenter ', 3, '2018-04-25 15:34:13'),
(138, 1, 'Charles I. Carpenter ', 3, '2018-04-25 15:34:45'),
(139, 1, 'Robert P. Taylor', 3, '2018-04-25 15:35:17'),
(140, 1, 'Robert P. Taylor', 3, '2018-04-25 15:36:01'),
(141, 1, 'Robert P. Taylor', 3, '2018-04-25 15:36:30'),
(142, 1, 'Robert P. Taylor', 3, '2018-04-25 15:37:22'),
(143, 1, 'George S.Renz', 2, '2018-04-25 15:38:12'),
(144, 1, 'BigD McGee', 2, '2018-04-25 15:38:42'),
(145, 1, 'Herman G. Felhoelter', 2, '2018-04-25 15:39:21'),
(146, 1, 'Judah Nadich', 2, '2018-04-25 15:39:37'),
(147, 1, 'Ivan Neill', 4, '2018-04-25 15:40:19'),
(148, 1, 'Ivan Neill', 4, '2018-04-25 15:40:26'),
(149, 1, 'Johannes Maria Assmann', 2, '2018-04-25 15:40:38'),
(150, 1, 'Charles Symons', 2, '2018-04-25 15:40:45'),
(151, 1, 'Ruth Louise Kinzeler ', 1, '2018-04-25 15:41:57'),
(152, 1, 'Ruth Louise Kinzeler ', 3, '2018-04-25 15:42:16'),
(153, 1, 'John Man', 2, '2018-04-25 15:42:25'),
(154, 1, 'William Addison', 2, '2018-04-25 15:42:32'),
(155, 1, 'William R. Arnold', 2, '2018-04-25 15:42:39'),
(156, 1, 'Steve Jordanson', 2, '2018-04-25 15:42:44'),
(157, 1, 'Somya Malasri', 2, '2018-04-25 15:42:53'),
(158, 1, 'Alexander D. Goode', 1, '2018-04-25 15:43:22'),
(159, 1, 'Connor Rudy', 2, '2018-04-25 15:43:37'),
(160, 1, 'William R. Arnold', 2, '2018-04-25 15:43:44');

-- --------------------------------------------------------

--
-- Table structure for table `following`
--

CREATE TABLE `following` (
  `id` int(11) NOT NULL,
  `fkFollower` int(11) NOT NULL,
  `fkFollowed` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `following`
--

INSERT INTO `following` (`id`, `fkFollower`, `fkFollowed`) VALUES
(2, 1, 3),
(3, 1, 2),
(4, 1, 4),
(5, 4, 1),
(6, 2, 3),
(7, 5, 1),
(8, 1, 6),
(9, 1, 7);

-- --------------------------------------------------------

--
-- Table structure for table `following_actions`
--

CREATE TABLE `following_actions` (
  `id` int(11) NOT NULL,
  `fkFollower` int(11) NOT NULL,
  `fkFollowed` int(11) NOT NULL,
  `actionType` int(11) NOT NULL COMMENT '0 add following, 1 remove',
  `timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `following_actions`
--

INSERT INTO `following_actions` (`id`, `fkFollower`, `fkFollowed`, `actionType`, `timestamp`) VALUES
(1, 1, 4, 0, '2018-04-14 01:21:44'),
(2, 1, 3, 0, '2018-04-14 01:21:48'),
(3, 1, 2, 0, '2018-04-14 01:21:51'),
(4, 1, 4, 1, '2018-04-14 02:04:45'),
(5, 1, 4, 0, '2018-04-14 02:04:46'),
(6, 4, 1, 0, '2018-04-14 02:16:20'),
(7, 2, 3, 0, '2018-04-14 03:02:32'),
(8, 5, 1, 0, '2018-04-18 23:44:53'),
(9, 1, 6, 0, '2018-04-25 14:55:57'),
(10, 1, 7, 0, '2018-04-25 14:56:04');

-- --------------------------------------------------------

--
-- Table structure for table `timeline_entries`
--

CREATE TABLE `timeline_entries` (
  `id` int(11) NOT NULL,
  `chaplain_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `year` int(4) NOT NULL,
  `description` mediumtext NOT NULL,
  `creator_id` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `timeline_entries`
--

INSERT INTO `timeline_entries` (`id`, `chaplain_id`, `title`, `year`, `description`, `creator_id`, `date_created`) VALUES
(1, 2, 'Joined Society of Jesuits', 1922, 'O\'Callahan joined the Society of Jesus at the Novitiate of St. Andrew-on-Hudson in Poughkeepsie, New York.', 1, '2018-03-29 17:19:24'),
(2, 2, 'Commissioned', 1940, 'O\'Callahan was commissioned as a Lieutenant (Junior Grade) in the Chaplain Corps and was assigned to Naval Air Station, Pensacola, Florida, in 1940-42, to the aircraft carrier Ranger where he saw combat.', 1, '2018-03-29 17:20:29'),
(3, 2, 'Assigned to USS Franklin', 1945, 'On March 2, 1945, he was assigned as Chaplain aboard CV-13, the USS Franklin.', 1, '2018-03-29 17:21:07'),
(4, 2, 'Published Memoir', 1956, 'Father Joe published his best-selling memoir in 1956 called \"I Was Chaplain on the Franklin.\"', 1, '2018-03-29 17:21:48'),
(5, 2, 'Promoted to Commander', 1945, 'Promoted to the rank of Commander in July 1945, O\'Callahan served at the Navy Department and at the Naval Training Station, Newport, Rhode Island, until October 1945.  At that time he reported for duty as Chaplain on board the new aircraft carrier the USS Franklin D. Roosevelt.  This was on the very day President Truman placed the Congressional Medal of Honor around his neck.', 1, '2018-03-29 17:35:07'),
(6, 1, 'Became a deacon', 1933, 'Took minor orders as a diocesan.', 2, '2018-03-29 17:43:44'),
(7, 1, 'Became a priest', 1935, 'Was ordained a diocesan priest.', 2, '2018-03-29 17:43:44'),
(10, 1, 'Joined the Army', 1941, 'Joined the army after hearing about the Japanese attack on Pearl Harbor. Was enrolled into a course at Harvard to train him to deploy into Europe.', 2, '2018-03-29 17:53:32'),
(11, 1, 'Died', 1943, 'Boarded the S.S. Dorchester, which was torpedoed by German U-Boat U-233. He and 3 other chaplains aided in the distribution of life boats and jackets, giving theirs away when they ran out. They then sat and prayed on the deck with all 672 men still aboard when the ship sank.', 2, '2018-03-29 17:53:32'),
(12, 3, 'Promoted rank', 1939, 'Received a rank of Lieutenant (Junior Grade) ', 3, '2018-03-30 17:53:01'),
(13, 3, 'Death', 1941, 'During the attack on Pearl Harbar, his ship was hit. While trying to help people escape, he died in action', 3, '2018-03-30 17:58:03'),
(14, 3, 'Ordain', 1935, 'Ordained on December 8th, 1935', 3, '2018-03-30 17:59:09'),
(15, 3, 'Graduation', 1932, 'Graduate from Columbia College in 1932', 3, '2018-03-30 18:02:25'),
(16, 13, 'Attacked England', 1044, 'and lost', 0, '2018-04-14 03:03:41'),
(17, 17, 'Born', 1833, 'Was born on August 26, 1833 in Branice, Poland', 0, '2018-04-16 15:26:10'),
(18, 17, 'Death', 1903, 'Died on May 27, 1903 in Ahrweiler, Germany', 0, '2018-04-16 15:26:37'),
(19, 1, 'Born', 1908, 'Born as one of seven children to Irish immigrants Frank and Mary Washington in Newark, New Jersey.', 0, '2018-04-17 03:25:34'),
(20, 20, 'Associate of President', 1935, 'He was a former associate of President Paul von Hindenburg, and Ambassador Diego von Bergen was informed in July 1935 that he was the favored candidate of the Nazi Party. Rarkowski had not graduated from high school, but was admitted to study theology for the priesthood in Switzerland, where he left his religious order.', 0, '2018-04-17 16:02:23'),
(21, 20, 'Died', 1950, 'Franz died peaceful in 1950 shortly after the second world war ended. He was 76 when he passed away.', 0, '2018-04-17 16:03:15'),
(22, 15, 'officer', 1935, 'fought in famous war battle.', 0, '2018-04-17 16:06:48'),
(23, 21, 'Birth', 1901, 'Lt. George L. Fox was born in Lewistown, PA', 0, '2018-04-17 20:27:22'),
(24, 21, 'Death', 1943, 'Lt. Fox died on the SS Dorchester with his fellow chaplains', 0, '2018-04-17 20:28:16'),
(25, 23, 'Ordained', 1939, 'Felhoelter was ordained in 1939.', 0, '2018-04-18 15:40:33'),
(26, 23, 'Died during Battle', 1950, 'Felhoelter died in the Battle of Taejon in July of 1950 in North Korea.', 0, '2018-04-18 15:42:22'),
(27, 2, 'Retired', 1953, 'He retired in 1953 as a Captain.', 0, '2018-04-18 15:47:01'),
(28, 28, 'Born', 1905, 'Born on May 14th, 1905 in Boston, MA.', 0, '2018-04-18 20:46:07'),
(29, 28, 'Appointed Lieutenant, J.G. in the Chaplain Corps of the U.S. Navy Reserve', 1940, 'Appointed Lieutenant, J.G. in the Chaplain Corps of the U.S. Navy Reserve on August 7, 1940.', 0, '2018-04-18 20:47:08'),
(31, 20, 'Born', 1873, 'Born June 8, 1873', 0, '2018-04-18 23:44:14'),
(32, 35, 'Born', 1881, 'William was born to Augustine Adam and Catherine Mary (nÃ©e Dalton) Arnold.', 0, '2018-04-20 15:37:01'),
(33, 37, 'Born', 1911, 'Was born in Brooklyn', 0, '2018-04-20 16:23:29'),
(34, 37, 'Death', 1942, 'From a torpedo', 0, '2018-04-20 16:24:09'),
(35, 38, 'Captain', 1925, 'He earned the rank of Captain.', 0, '2018-04-20 17:05:44'),
(36, 38, 'Army', 1910, 'He enlisted in the army.', 0, '2018-04-20 17:06:11'),
(37, 2, 'Born', 1905, 'Born May 14, 1905 in Boston, Massachusetts.', 0, '2018-04-20 18:28:52'),
(38, 16, 'Supposed Event', 1920, 'There could be one.', 0, '2018-04-20 19:02:49'),
(39, 43, 'boarded the USAT â€œThomas H. Barryâ€ ', 1942, 'Our roommates are Jane Ingram and Gladys Hanes. Unpacked handbags. Dinner at 1830 hours. Arranged our bath schedule then tried to go on deck with no success. We visited around a bit, then went to bed at 2230.', 0, '2018-04-20 20:07:46'),
(40, 43, 'Mustered Out', 1945, 'Ruth was honorably discharged from the United States Army in September 1945. After leaving the service, she attended â€œCase Western Reserve Universityâ€ and graduated from the â€œFrances Payne Bolton School of Nursingâ€ in 1947 with a Bachelor of Science in Nursing.', 0, '2018-04-20 20:08:43'),
(41, 15, 'Test', 1999, 'Test event', 0, '2018-04-20 21:38:16'),
(42, 46, 'Birth', 1912, 'Neill was born on 10 July 1912 at the Templeharry rectory in County Tipperary, Ireland.', 0, '2018-04-21 01:59:58'),
(43, 46, 'Death', 2001, 'Neill died on 18 June 2001.', 0, '2018-04-21 02:01:24'),
(44, 18, 'Birth', 1908, 'John Johnson was born to Joanna Johnson and Johnny Johnson (Sr.) in Johnsonville.', 0, '2018-04-21 02:05:01'),
(45, 27, 'World War II', 1939, 'War started in Europe', 0, '2018-04-21 04:41:55'),
(48, 3, 'Born', 1909, 'Born December 4, 1909 in St. Lucas Iowa', 0, '2018-04-25 15:00:05'),
(49, 19, 'Born', 1882, 'Born on March 1, 1882 in Lebanon, Pennsylvania.', 0, '2018-04-25 15:07:51'),
(50, 19, 'Died', 1942, 'February 4, 1942 his ship sank during a Japanese Attack. He gave his life helping other crew members stay calm and survive.', 0, '2018-04-25 15:09:29'),
(51, 19, 'Graduated College', 1903, 'Graduated from Gettysburg College Class of 1903.', 0, '2018-04-25 15:11:51'),
(52, 20, 'Consecrated', 1938, 'On Febraury 29, 1938 he was consecrated as episcopus castrensis, which translates to Field Bisop of the German Army', 0, '2018-04-25 15:22:35'),
(53, 20, 'End of Term', 1945, 'On February 1, 1945 his term ended.', 0, '2018-04-25 15:23:23'),
(54, 24, 'First Jump', 1943, 'Jumped in both the Sicilian and Italian Invasions and recieved the Bronze Star with oak leaf cluster for meritorious service from Fifth Army Headquarters.', 0, '2018-04-25 15:28:44'),
(55, 24, 'Died', 1980, 'Died on Febraury 4, 1980', 0, '2018-04-25 15:29:16'),
(56, 24, 'Born', 1911, 'Born August 24, 1911 in Baltamore, Maryland.', 0, '2018-04-25 15:30:15'),
(57, 30, 'Born', 1906, 'Born on January 13, 1906 in Wilmington, Delaware.', 0, '2018-04-25 15:32:07'),
(58, 30, 'Joined the Army', 1936, 'He joined the United States Army in 1936 and was assigned to Fort H. G. Wright.', 0, '2018-04-25 15:33:06'),
(59, 30, 'Reassigned', 1942, 'He was assigned to the Pentagon to establish chaplaincy work in the United States Army Air Forces.', 0, '2018-04-25 15:33:48'),
(60, 30, 'Promotion', 1948, 'Named the first Chief of Chaplains.', 0, '2018-04-25 15:34:13'),
(61, 30, 'Died', 1994, 'Died on Febraury 22, 1994.', 0, '2018-04-25 15:34:45'),
(62, 31, 'Born', 1909, 'Born April 11, 1909 in Henderson, Texas', 0, '2018-04-25 15:35:17'),
(63, 31, 'Promotion', 1962, 'Began his tenure as Chief of Chaplains on Septermber 1, 1962', 0, '2018-04-25 15:36:01'),
(64, 31, 'Retired', 1966, 'Retired from Chief of Chaplains on August 1, 1966.', 0, '2018-04-25 15:36:30'),
(65, 31, 'Died', 1997, 'Died on February 1, 1997.', 0, '2018-04-25 15:37:22'),
(66, 43, 'Died', 1994, 'Died in 1994', 0, '2018-04-25 15:42:16');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `firstName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `permission` int(11) NOT NULL COMMENT '0 user, 1 admin, 2 superadmin',
  `education` int(11) DEFAULT NULL COMMENT '0 no finish hs, 1 hs, 2 some college, 3 bachelors, 4 graduate'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `date_created`, `firstName`, `lastName`, `permission`, `education`) VALUES
(1, 'djo96', 'bojanglers18', 'djo96@vt.edu', '2018-03-29 15:54:18', 'Daniel', 'Ocheltree', 2, 2),
(2, 'bgregos', 'bojanglers18', 'bgregos@vt.edu', '2018-03-29 15:54:51', '', '', 2, NULL),
(3, 'jpark96', 'bojanglers18', 'jpark96@vt.edu', '2018-03-30 02:13:49', NULL, NULL, 2, NULL),
(4, 'parker45', 'bojanglers18', 'parker45@vt.edu', '2018-03-30 17:44:48', 'Parker', 'Irving', 2, 3),
(5, 'mturk', 'cs3744s18!', '', '2018-04-14 02:03:58', NULL, NULL, 0, 2),
(6, 'emilys97', 'bojanglers18', 'emilys97@vt.edu', '2018-04-14 02:05:47', 'Emily ', 'Stewart', 2, 2),
(7, 'grader', 'bojanglers18', 'grader@vt.edu', '2018-04-14 02:07:06', 'Grader', 'Grader', 2, 2),
(10, 'cmrudy', 'cs09', 'cmrudy@vt.edu', '2018-04-20 15:55:42', 'Connor', 'Rudy', 0, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chaplains`
--
ALTER TABLE `chaplains`
  ADD PRIMARY KEY (`id`),
  ADD KEY `name` (`name`),
  ADD KEY `creator_id` (`creator_id`),
  ADD KEY `date_created` (`date_created`),
  ADD KEY `faith` (`faith`),
  ADD KEY `faith_type` (`faith_type`),
  ADD KEY `rank` (`rank`);

--
-- Indexes for table `chaplain_actions`
--
ALTER TABLE `chaplain_actions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `following`
--
ALTER TABLE `following`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `following_actions`
--
ALTER TABLE `following_actions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `timeline_entries`
--
ALTER TABLE `timeline_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_chaplain` (`chaplain_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chaplains`
--
ALTER TABLE `chaplains`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `chaplain_actions`
--
ALTER TABLE `chaplain_actions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=161;

--
-- AUTO_INCREMENT for table `following`
--
ALTER TABLE `following`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `following_actions`
--
ALTER TABLE `following_actions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `timeline_entries`
--
ALTER TABLE `timeline_entries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
