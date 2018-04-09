-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 09, 2018 at 06:40 PM
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
(1, 'John P. Washington', 'Diocesan', 1, 'Lieutenant', 'Newark, New Jersey', 2, '2018-03-29 15:56:24'),
(2, 'Joseph T. O\'Callahan', 'Jesuit', 1, 'Lieutenant Commander', 'Roxbury, Massachusetts', 1, '2018-03-29 15:57:19'),
(3, 'Aloysius H. Schmitt ', 'Roman Catholic', 1, 'Lieutenant', 'St. Lucas, Iowa', 3, '2018-03-30 02:12:09');

-- --------------------------------------------------------

--
-- Table structure for table `chaplain_actions`
--

CREATE TABLE `chaplain_actions` (
  `id` int(11) NOT NULL,
  `fkUser` int(11) NOT NULL,
  `actionType` int(11) NOT NULL COMMENT '0 add chaplain, 1 edit, 2 delete, 3 add timeline, 4 edit, 5 delete',
  `timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `following`
--

CREATE TABLE `following` (
  `id` int(11) NOT NULL,
  `fkUser` int(11) NOT NULL,
  `timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `following_actions`
--

CREATE TABLE `following_actions` (
  `id` int(11) NOT NULL,
  `fkFriend` int(11) NOT NULL,
  `actionType` int(11) NOT NULL COMMENT '0 add friend, 1 edit, 2 delete',
  `timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `timeline_entries`
--

CREATE TABLE `timeline_entries` (
  `id` int(11) NOT NULL,
  `chaplain_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `year` year(4) NOT NULL,
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
(13, 3, 'Death', 1941, 'During the attack on Pearl Harbor, Schmitt\'s ship was hit, in which he helped people escaped and died in action.', 3, '2018-03-30 17:58:03'),
(14, 3, 'Ordain', 1935, 'Ordained on December 8th, 1935', 3, '2018-03-30 17:59:09'),
(15, 3, 'Graduation', 1932, 'Graduate from Columbia College in 1932', 3, '2018-03-30 18:02:25');

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
  `permission` int(11) NOT NULL, COMMENT '0 registered and 1 is admin'
  `education` int(11) DEFAULT NULL COMMENT '0 no finish hs, 1 hs, 2 some college, 3 bachelors, 4 graduate'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `date_created`, `firstName`, `lastName`, `permission`, `education`) VALUES
(1, 'djo96', 'bojanglers18', 'djo96@vt.edu', '2018-03-29 15:54:18', '', '', 0, NULL),
(2, 'bgregos', 'bojanglers18', 'bgregos@vt.edu', '2018-03-29 15:54:51', '', '', 0, NULL),
(3, 'jpark96', 'bojanglers18', 'jpark96@vt.edu', '2018-03-30 02:13:49', '', '', 0, NULL),
(4, 'parker45', 'bojanglers18', 'parker45@vt.edu', '2018-03-30 17:44:48', '', '', 0, NULL);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `chaplain_actions`
--
ALTER TABLE `chaplain_actions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `following`
--
ALTER TABLE `following`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `following_actions`
--
ALTER TABLE `following_actions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `timeline_entries`
--
ALTER TABLE `timeline_entries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
