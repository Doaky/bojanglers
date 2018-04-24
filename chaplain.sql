-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 19, 2018 at 05:53 PM
-- Server version: 5.6.39
-- PHP Version: 7.0.27

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
(1, 'John P. Washington', 'Diocesan', 1, 'Lieutenant 1st Class', 'Newark, New Jersey', 2, '2018-03-29 15:56:24'),
(2, 'Joseph T. O\'Callahan', 'Jesuit', 1, 'Lieutenant Commander', 'Roxbury, Massachusetts', 1, '2018-03-29 15:57:19'),
(3, 'Aloysius H. Schmitt ', 'Roman Catholic', 1, 'Lieutenant', 'St. Lucas, Iowa', 3, '2018-03-30 02:12:09'),
(15, 'Arun Antho', NULL, 0, '106', 'Tamilnadu chennai', 0, '2018-04-15 11:47:42'),
(16, 'Divya Antho', NULL, 0, '202', 'Chennai', 0, '2018-04-15 11:53:09'),
(17, 'Johannes Maria Assmann', 'Baptist', 1, 'Catholic Prussian military bishop', 'Branice, Poland', 0, '2018-04-16 15:24:43'),
(18, 'John Johnson', NULL, 0, 'Chaplain', 'Johnsonville', 0, '2018-04-16 15:32:04'),
(19, 'George S. Rentz', NULL, 2, 'Chaplain', 'Lebanon, Pennsylvania', 0, '2018-04-17 03:20:19'),
(20, 'Franz Rarkowski', 'Bishop', 1, 'officer', 'Poland', 0, '2018-04-17 16:00:41'),
(21, 'George L. Fox', NULL, 2, 'Chaplain lieutenant', 'Lewistown', 0, '2018-04-17 20:25:31'),
(22, 'Joseph T. O\'Callahan', 'N/A', 1, 'Captain', 'Roxbury, Massachusetts', 0, '2018-04-17 21:00:17'),
(23, 'Herman Felhoelter', NULL, 2, 'Chaplain', 'Lousiville, KY', 0, '2018-04-18 15:39:58'),
(24, 'Edwin J. Kozak', 'Uh Catholic?', 1, 'CPT', 'Baltimore City, MD', 0, '2018-04-18 17:15:05'),
(25, 'Franz Justus Rarkowski', 'Catholic', 1, 'Catholic Military Bishop', 'Allenstein', 0, '2018-04-18 18:48:31'),
(27, 'John Doe', NULL, 0, 'Captain', NULL, 0, '2018-04-18 19:25:24'),
(28, 'Joseph T. O\'Callahan', NULL, 2, 'Captain', 'Boston, MA', 0, '2018-04-18 20:45:02'),
(29, 'William Kelt', NULL, 0, 'Major', 'Wahroonga', 0, '2018-04-18 23:43:30'),
(30, 'Charles I. Carpenter ', NULL, 2, 'Major General', 'Wilmington, Delaware ', 0, '2018-04-19 15:19:37'),
(31, 'Robert P. Taylor', NULL, 2, 'Major General', 'Henderson, Texas', 0, '2018-04-19 15:23:20'),
(32, 'George S.Renz', NULL, 2, 'Commander', 'Lebanon, Pennsylvania', 0, '2018-04-19 17:40:01');

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
(57, 5, 'John P. Washington', 5, '2018-04-19 17:41:34');

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
(7, 5, 1);

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
(8, 5, 1, 0, '2018-04-18 23:44:53');

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
(17, 17, 'Birth', 1833, 'Was born on August 26, 1833 in Branice, Poland', 0, '2018-04-16 15:26:10'),
(18, 17, 'Death', 1903, 'Died on May 27, 1903 in Ahrweiler, Germany', 0, '2018-04-16 15:26:37'),
(19, 1, 'Born', 1908, 'Born as one of seven children to Irish immigrants Frank and Mary Washington in Newark, New Jersey.', 0, '2018-04-17 03:25:34'),
(20, 20, 'Associate of President', 1935, 'He was a former associate of President Paul von Hindenburg, and Ambassador Diego von Bergen was informed in July 1935 that he was the favored candidate of the Nazi Party. Rarkowski had not graduated from high school, but was admitted to study theology for the priesthood in Switzerland, where he left his religious order.', 0, '2018-04-17 16:02:23'),
(21, 20, 'Died', 1950, 'Franz died peaceful in 1950 shortly after the second world war ended. He was 76 when he passed away.', 0, '2018-04-17 16:03:15'),
(22, 15, 'officer', 1935, 'fought in famous war battle.', 0, '2018-04-17 16:06:48'),
(23, 21, 'Birth', 1900, 'Lt. George L. Fox was born in Lewistown, PA', 0, '2018-04-17 20:27:22'),
(24, 21, 'Death', 1943, 'Lt. Fox died on the SS Dorchester with his fellow chaplains', 0, '2018-04-17 20:28:16'),
(25, 23, 'Ordained', 1939, 'Felhoelter was ordained in 1939.', 0, '2018-04-18 15:40:33'),
(26, 23, 'Died during Battle', 1950, 'Felhoelter died in the Battle of Taejon in July of 1950 in North Korea.', 0, '2018-04-18 15:42:22'),
(27, 2, 'Retired', 1953, 'O\'Callahan retired in 1953 with the rank of Captain', 0, '2018-04-18 15:47:01'),
(28, 28, 'Born', 1905, 'Born on May 14th, 1905 in Boston, MA.', 0, '2018-04-18 20:46:07'),
(29, 28, 'Appointed Lieutenant, J.G. in the Chaplain Corps of the U.S. Navy Reserve', 1940, 'Appointed Lieutenant, J.G. in the Chaplain Corps of the U.S. Navy Reserve on August 7, 1940.', 0, '2018-04-18 20:47:08'),
(31, 20, 'Warren', 1979, 'Born on August the 12th', 0, '2018-04-18 23:44:14');

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
(4, 'parker45', 'bojanglers18', 'parker45@vt.edu', '2018-03-30 17:44:48', 'Parker', 'Irving', 0, 3),
(5, 'mturk', 'cs3744s18', 'mturk@gmail.com', '2018-04-14 02:03:58', 'm', 'turk', 0, 2),
(6, 'emilys97', 'bojanglers18', 'emilys97@vt.edu', '2018-04-14 02:05:47', 'Emily ', 'Stewart', 2, 2),
(7, 'grader', 'bojanglers18', 'grader@vt.edu', '2018-04-14 02:07:06', 'Grader', 'Grader', 2, 2),
(8, 'mario', 'luigisucks', 'mario@me.com', '2018-04-18 19:02:00', 'Mario', 'Plumber', 0, 0);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `chaplain_actions`
--
ALTER TABLE `chaplain_actions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `following`
--
ALTER TABLE `following`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `following_actions`
--
ALTER TABLE `following_actions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `timeline_entries`
--
ALTER TABLE `timeline_entries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
