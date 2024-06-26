-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 04, 2024 at 11:52 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `alternate_arc`
--

-- --------------------------------------------------------

--
-- Table structure for table `chapters`
--

CREATE TABLE `chapters` (
  `id` int(11) NOT NULL,
  `story_id` int(11) NOT NULL,
  `chapter_title` varchar(255) NOT NULL,
  `chapter_content` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chapters`
--

INSERT INTO `chapters` (`id`, `story_id`, `chapter_title`, `chapter_content`, `created_at`) VALUES
(16, 37, 'testes', 'tes', '2024-06-04 09:31:31');

-- --------------------------------------------------------

--
-- Table structure for table `chapter_likes`
--

CREATE TABLE `chapter_likes` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `chapter_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chapter_likes`
--

INSERT INTO `chapter_likes` (`id`, `user_id`, `chapter_id`, `created_at`) VALUES
(107, 31, 16, '2024-06-04 09:32:20');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `comment_text` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `chapter_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `comment_text`, `created_at`, `chapter_id`) VALUES
(32, NULL, '', '2024-05-30 05:55:44', NULL),
(35, NULL, '', '2024-05-31 02:44:46', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `comment_id` int(11) NOT NULL,
  `reported_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `reason` text DEFAULT NULL,
  `report_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `stories`
--

CREATE TABLE `stories` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `author` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `Fandom` varchar(255) DEFAULT NULL,
  `Language` varchar(50) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `Series` varchar(255) DEFAULT NULL,
  `Characters` text DEFAULT NULL,
  `Relationship` varchar(255) DEFAULT NULL,
  `Addtags` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stories`
--

INSERT INTO `stories` (`id`, `title`, `author`, `description`, `user_id`, `image_path`, `Fandom`, `Language`, `Status`, `Series`, `Characters`, `Relationship`, `Addtags`) VALUES
(20, 'tes', 'reader', 'ts', NULL, NULL, 'tes', 'tes', 'te', 'tes', 'tes', 'tes', 'adventure, romance'),
(37, 'testes', 'writer', 'tes', NULL, 'uploads/register v3.png', 'testes', 'Japan', 'ts', '13', '12', 'broken home', 'rw, ancient');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `role` enum('reader','writer','admin') NOT NULL DEFAULT 'writer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `created_at`, `updated_at`, `role`) VALUES
(1, '', '', '$2y$10$k8GG.04NmVbEDWqfYuf6weuwmBsZwh7yqolVJDiYuR3R6fBPISZm2', '2024-04-02 08:01:23', '2024-04-02 08:01:23', 'reader'),
(2, 'nopal', 'testbench@gmail.com', '$2y$10$4CypywF5xGFHJFLvnuMmPeyo.NQ48iND6qjX18mSFDHril6EJIPiC', '2024-04-02 08:05:13', '2024-04-02 08:05:13', 'reader'),
(3, 'nopal45', 'blabla@gmail.com', '$2y$10$T5BqY5eK6U9F5jcJSgcMieRpF8Gd0g8QSkgBmEeiHngnntmlnWy4y', '2024-04-02 08:16:41', '2024-04-02 08:16:41', 'reader'),
(5, 'nopal56757', 'black@gmail.com', '$2y$10$OU4Q6IXxWjWq1zKrHlR./.859IbngQj/oREKc/o92cwjxhMjhMLzO', '2024-04-02 08:17:55', '2024-04-02 08:17:55', 'reader'),
(7, 'blabla', 'blabla453@gmail.com', '$2y$10$ZLOx.AThUwaWLtpBs68vgOotlArcVYs7R.7XatrVYicuCbV4i9eFe', '2024-04-02 08:18:45', '2024-04-02 08:18:45', 'reader'),
(9, 'nopaltetet', 'tetetet@gmail.com', '$2y$10$EL1dbqq0bBkmfYfK0tZwNOI.xCzvV3dUcERGMMvcslhj.eNfwyKc6', '2024-04-02 08:19:43', '2024-04-02 08:19:43', 'reader'),
(14, 'nopal999', 'blackspot444@gmail.com', '$2y$10$nl/tB.VojDOdmJT7Re1MHuIGNraFudF5QfE9cSB8PHduCfvm066Vu', '2024-04-03 18:45:24', '2024-04-03 18:45:24', 'reader'),
(16, 'nopal7777', 'fafafa@gmail.com', '$2y$10$njuDH7UMKAtCZB5izZyq3eQcD5phVGwD52fqWGxR371OhBo6z3bEe', '2024-04-03 19:32:55', '2024-04-03 19:32:55', 'reader'),
(17, 'nopal45434', 'Naufal@gmail.com', '$2y$10$5O6Ab3Xx0XGkgegOfMmJMuS47AMCeo3BOesQXIsIPd/wxQrbA3xYC', '2024-04-03 19:33:54', '2024-04-03 19:33:54', 'reader'),
(18, 'test', 'testtest@gmail.com', '$2y$10$eijOqDwPVeDpvYrfY7vSFOQlHsGTEzdyqDKJaPFOcjpig4q1wzU4K', '2024-04-03 19:34:46', '2024-04-03 19:34:46', 'reader'),
(19, 'nopal4542424', '42424@gmail.com', '$2y$10$BpuWln5qqVD1ciWpSYxV7Ot0Rn6SXL/xawXzif.5nwOlfQqlR6OJG', '2024-04-03 19:35:04', '2024-04-03 19:35:04', 'reader'),
(20, 'GOPAAAAAAALLLL', 'gopallll@gmail.com', '$2y$10$YOu2FYII1fqXd4nRn.Llsez5AMk7.MtK/YAstgSMVNADPSB8Q6VGy', '2024-04-04 03:36:21', '2024-04-04 03:36:21', 'reader'),
(21, 'Fawwazalamsyahnaufal', 'alamsyahnaufal453@gmail.com', '$2y$10$M8XKuy0t6QlVnlJbgZTJOeCf.NNw1DkptD9/ZDwfNc6aYaAZTzXqy', '2024-04-08 08:04:14', '2024-04-08 08:04:14', 'reader'),
(22, 'Gopal', 'insideme35@gmail.com', '$2y$10$FdMxaWcfdYsNJhODTz3AfOK/hrpuHqSm4eDcnGG4b3KEGzADIIPAS', '2024-04-09 13:37:12', '2024-04-09 13:37:12', 'reader'),
(23, 'inside35', 'testbench58@gmail.com', '$2y$10$jmKGXJ2/XIA95utZJG3FgesbSofQgqoEqU0UW/ZguCuDLiHBxXtWe', '2024-04-22 23:17:53', '2024-04-22 23:17:53', 'reader'),
(24, 'Gopal453', 'Npl@gmail.com', '$2y$10$k4ulyNhmNcN.DIl8FeONe.Rjsu91K1QXcZdGRibEnygGo.lLQpdm6', '2024-04-22 23:32:32', '2024-04-22 23:32:32', 'reader'),
(25, 'tes123', 'tes123@gmail.com', '$2y$10$92vitoEoTbyMfy7HfDbcHueWBwwTlvcAoG/dJCNyUsEPxiY.9EhQS', '2024-04-23 05:00:22', '2024-04-23 05:00:22', 'writer'),
(26, 'rwes', 'rwes@gmail.com', '$2y$10$kya1gyGUPiR84qfTqV3JjelaCzLaYQjie2chaE8VzYO9OHjNzUAMu', '2024-04-23 05:02:15', '2024-04-23 05:02:15', 'writer'),
(27, '54321', 'weriter@gmail.com', '$2y$10$7ChQANTl3MQ9/3SHYaK/kea.jY.EWgz71vX3SPZRJ.pRo65rZZG1W', '2024-04-23 05:03:30', '2024-04-23 05:03:30', 'writer'),
(28, '321', '2@1.com', '$2y$10$AQnVE7Vi8XVsvT49FimHHeLZkdKahgAYJsqJRfLl5EXJ1NaBsUit6', '2024-04-23 05:04:00', '2024-04-23 05:04:00', 'writer'),
(29, 'writer43', 'writer431@gmail.com', '$2y$10$eaRxGyalDbY4e6vo4ukLXOqdXp.WpdC4M5zodQ0ePpG30G6qNoQve', '2024-04-23 05:09:01', '2024-04-23 05:09:01', 'reader'),
(30, 'nopal1234', 'nopal1234@gmail.com', '$2y$10$.OrQAbbnJoNMNV6mZRFMFOJsAlkVWfuZnnx8BLNc02iv8Lf7Ptx1e', '2024-04-23 06:20:43', '2024-04-23 06:20:43', 'writer'),
(31, 'writer', 'writer@gmail.com', '$2y$10$xDcH69QyY6MYoiiMoaNFbOwqFYDKUjspWR4x7SWtWHhGsOCV7gIyC', '2024-05-07 03:41:11', '2024-05-07 03:41:11', 'writer'),
(32, 'reader', 'reader@gmail.com', '$2y$10$V.XeW0q.uicyhCFtDIIz2u0qEbaw.D0kAG.Giwvs9ltzD1jzqSIJC', '2024-05-07 08:43:57', '2024-05-07 08:43:57', 'reader'),
(99, 'admin', 'admin@gmail.com', '$2y$10$IHywfaaW3qIUEylqDmdrGeAnd.YD5S6NFelF40XN9e9DiFuAGWwzW', '2024-05-28 17:00:00', '2024-05-29 05:46:09', 'admin'),
(100, 'Snake', 'Snake@gmail.com', '$2y$10$/nZhy5a8hnTb/9hVKjAtteMa5.YxHNu.bbuf9ZtEDuAvPRRvB3Wbi', '2024-05-30 12:04:42', '2024-05-30 12:04:42', 'writer'),
(101, 'Snake1', 'Snake1@gmail.com', '$2y$10$LNTHkE93UeZHUnLDA9Jjye9rG3iqfwRmnliAgkIlx5rqeB1v3IWTO', '2024-05-30 12:22:39', '2024-05-30 12:22:39', 'reader'),
(102, 'admin11', 'insideme355541@gmail.com', '$2y$10$3xZLC5uuDFNLKaKCA/E5wOXQEj5r7KlLpQHyEakYyP6S.AXhB1KVS', '2024-06-02 08:03:36', '2024-06-02 08:03:36', 'writer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chapters`
--
ALTER TABLE `chapters`
  ADD PRIMARY KEY (`id`),
  ADD KEY `story_id` (`story_id`);

--
-- Indexes for table `chapter_likes`
--
ALTER TABLE `chapter_likes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`chapter_id`),
  ADD KEY `chapter_id` (`chapter_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `fk_comments_chapters` (`chapter_id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`report_id`);

--
-- Indexes for table `stories`
--
ALTER TABLE `stories`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `chapters`
--
ALTER TABLE `chapters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `chapter_likes`
--
ALTER TABLE `chapter_likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `stories`
--
ALTER TABLE `stories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chapters`
--
ALTER TABLE `chapters`
  ADD CONSTRAINT `chapters_ibfk_1` FOREIGN KEY (`story_id`) REFERENCES `stories` (`id`);

--
-- Constraints for table `chapter_likes`
--
ALTER TABLE `chapter_likes`
  ADD CONSTRAINT `chapter_likes_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `chapter_likes_ibfk_2` FOREIGN KEY (`chapter_id`) REFERENCES `chapters` (`id`);

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_comments_chapters` FOREIGN KEY (`chapter_id`) REFERENCES `chapters` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
