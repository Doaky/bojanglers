-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 16, 2018 at 09:15 PM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pandata`
--

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `location` varchar(200) NOT NULL,
  `date` date DEFAULT NULL,
  `file` varchar(200) NOT NULL,
  `panda_id` int(11) NOT NULL,
  `creator_id` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id`, `title`, `location`, `date`, `file`, `panda_id`, `creator_id`, `date_created`) VALUES
(1, 'First Birthday', 'National Zoo, Washington, D.C.', '2016-08-22', 'Bei Bei/birthday.jpg', 1, 1, '2018-02-27 03:29:06'),
(2, 'Celebration Sticker', 'National Zoo, Washington, D.C.', '2016-08-22', 'Bei Bei/sticker.png', 1, 1, '2018-02-27 03:35:58'),
(3, 'With Tai Shan', 'National Zoo, Washington, D.C.', '2005-12-22', 'Mei Xiang/with-tai-shan.jpg', 2, 1, '2018-02-27 04:28:50'),
(4, 'Smithsonian Panda Agreement 2011', 'National Zoo, Washington, D.C.', '2011-01-20', 'Mei Xiang/smithsonian-panda-agreement-2011.pdf', 2, 1, '2018-02-27 04:29:26');

-- --------------------------------------------------------

--
-- Table structure for table `pandas`
--

CREATE TABLE `pandas` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `born` year(4) DEFAULT NULL,
  `died` year(4) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `parents` varchar(100) DEFAULT NULL,
  `siblings` varchar(600) DEFAULT NULL,
  `children` varchar(600) DEFAULT NULL,
  `file` varchar(200) DEFAULT NULL,
  `creator_id` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pandas`
--

INSERT INTO `pandas` (`id`, `name`, `born`, `died`, `location`, `parents`, `siblings`, `children`, `file`, `creator_id`, `date_created`) VALUES
(1, 'Bei Bei', 2015, NULL, 'National Zoo, Washington, D.C.', 'Tian Tian,Mei Xiang', 'Tai Shan,Bao Bao', NULL, 'bei-bei.jpg', 1, '2018-02-27 03:24:56'),
(2, 'Mei Xiang', 1998, NULL, 'National Zoo, Washington, D.C.', 'Lin Nan (M),Xue Xue (F)', NULL, 'Bei Bei (M),Tai Shan (M),Bao Bao (F)', 'mei-xiang.jpg', 1, '2018-02-27 04:07:51');

-- --------------------------------------------------------

--
-- Table structure for table `timeline_entries`
--

CREATE TABLE `timeline_entries` (
  `id` int(11) NOT NULL,
  `panda_id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `year` year(4) NOT NULL,
  `description` text NOT NULL,
  `creator_id` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `timeline_entries`
--

INSERT INTO `timeline_entries` (`id`, `panda_id`, `title`, `year`, `description`, `creator_id`, `date_created`) VALUES
(1, 1, 'Born', 2015, 'Born on August 22, 2015 in the National Zoo, Washington, D.C. Bei Bei had a twin, but it died 4 days after birth. Mei Xiang conceived Bei Bei with Tian Tian via artificial insemination. He was named by Michelle Obama and Peng Liyuan, the first ladies of the United States and the Rebuplic of China.', 1, '2018-02-27 03:31:14'),
(2, 1, 'First Public Viewing', 2016, 'First public viewing on January 15, 2016 at the National Zoo, Washington, D.C.. He and his mother can now be viewed with the zoo\'s panda-cam.', 1, '2018-02-27 03:32:44'),
(3, 1, 'Weaning', 2016, 'Started weaning on March 4, 2017.', 1, '2018-02-27 03:32:44'),
(4, 1, 'Vet Exam', 2017, 'Fully recovered from a vet exam on November 28, 2017. Bei Bei was having stomach issues, but is now able to consume small amounts of bamboo, apples, biscuits, and honey water.', 1, '2018-02-27 03:32:44'),
(5, 1, 'Moved to China', 2019, 'Bei Bei will be sent back to live in China on August 22, 2019.', 1, '2018-02-27 03:32:44'),
(6, 2, 'Moved to China', 2010, 'Bei Bei will be sent back to live in China on August 22, 2019.', 1, '2018-02-27 04:30:08'),
(7, 2, 'US Arrival', 2000, 'Mei Xiang arrived at the National Zoo, Washington, D.C. with Tian Tian December 6, 2000. They are both a loan from China, they will live in the zoo for 10 years in exchange for $10 million. This was later extended.', 1, '2018-02-27 04:34:22'),
(8, 2, 'Mating Attempt', 2003, 'Mei Xiang and Tian Tian attempted to mate but were unsuccessful.', 1, '2018-02-27 04:34:47'),
(9, 2, 'Artificial Insemination', 2004, 'Scientists artificially inseminated Mei Xiang with Tian Tian\'s sperm after natural breeding was unsuccessful. She had a pseudopregnancy.', 1, '2018-02-27 04:35:41'),
(10, 2, 'Birth of Tai Shan', 2005, 'On July 9, 2005 Mei Xiang gave birth to Tai Shan after being artificially inseminated on March 11, 2005. This is the National Zoo\'s first surviving giant panda cub.', 1, '2018-02-27 04:47:54'),
(11, 2, 'Artificial Insemination', 2007, 'Mei Xiang had yet another artificial insemination on April 4 and 5 of 2007, but this time with sperm from Gao Gao, an adult male at the San Diego Zoo. This resulted in another pseudopregnancy.', 1, '2018-02-27 04:48:42'),
(12, 2, 'US Extension', 2011, 'Mei Xiang, along with Tian Tian, had her stay extended with the Giant Panda Cooperative Research and Breeding Agreement on January 20, 2011. This agreement let them both stay at the National Zoo until December 15, 2015. This was later extended to December 7, 2020.', 1, '2018-02-27 04:49:49'),
(13, 0, 'Test', 0000, 'New event', 0, '2018-03-15 14:31:43'),
(14, 0, 'Test', 0000, 'Testing', 0, '2018-03-16 15:34:38'),
(17, 3, 'Test', 2009, 'delete me', 0, '2018-03-16 16:17:57'),
(19, 3, 'Test', 2019, 'Testse', 0, '2018-03-16 16:31:30');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `date_created`) VALUES
(1, 'admin', 'root', 'djo96@vt.edu', '2018-02-27 03:05:21'),
(2, 'doaky', 'panda', 'danielocheltree@gmail.com', '2018-02-27 03:10:40');

-- --------------------------------------------------------

--
-- Table structure for table `zoos`
--

CREATE TABLE `zoos` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `location` varchar(200) NOT NULL,
  `first_panda` year(4) NOT NULL,
  `last_panda` year(4) DEFAULT NULL,
  `creator_id` int(11) NOT NULL,
  `date_created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `zoos`
--

INSERT INTO `zoos` (`id`, `name`, `location`, `first_panda`, `last_panda`, `creator_id`, `date_created`) VALUES
(1, 'National Zoo', 'Washington, D.C.', 1969, NULL, 1, '2018-03-03 01:28:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pandas`
--
ALTER TABLE `pandas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `timeline_entries`
--
ALTER TABLE `timeline_entries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `zoos`
--
ALTER TABLE `zoos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pandas`
--
ALTER TABLE `pandas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `timeline_entries`
--
ALTER TABLE `timeline_entries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `zoos`
--
ALTER TABLE `zoos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
