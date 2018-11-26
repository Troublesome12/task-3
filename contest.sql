-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 26, 2018 at 01:42 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `contest`
--

-- --------------------------------------------------------

--
-- Table structure for table `contests`
--

CREATE TABLE `contests` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contests`
--

INSERT INTO `contests` (`id`, `name`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Contest 1', 1, '2018-11-25 12:42:18', '2018-11-25 12:42:18'),
(2, 'Contest 2', 1, '2018-11-25 12:42:18', '2018-11-25 12:42:18'),
(3, 'Contest 3', 1, '2018-11-25 12:42:38', '2018-11-25 12:42:38');

-- --------------------------------------------------------

--
-- Table structure for table `players`
--

CREATE TABLE `players` (
  `id` int(10) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `team_id` int(10) UNSIGNED NOT NULL,
  `created_by` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `players`
--

INSERT INTO `players` (`id`, `name`, `team_id`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Player 1', 1, 3, '2018-11-25 18:52:10', '2018-11-25 18:52:10'),
(2, 'Player 2', 1, NULL, '2018-11-25 18:52:20', '2018-11-25 18:52:20'),
(3, 'Player 3', 1, NULL, '2018-11-25 18:52:42', '2018-11-25 18:52:42'),
(4, 'Player 4', 1, NULL, '2018-11-25 18:52:42', '2018-11-25 18:52:42'),
(5, 'Player 5', 1, NULL, '2018-11-25 18:52:53', '2018-11-25 18:52:53'),
(6, 'Player 6', 2, 3, '2018-11-25 18:53:31', '2018-11-25 18:53:31'),
(7, 'Player 7', 2, NULL, '2018-11-25 18:53:31', '2018-11-25 18:53:31'),
(8, 'Player 8', 2, NULL, '2018-11-25 18:53:48', '2018-11-25 18:53:48'),
(9, 'Player 9', 2, NULL, '2018-11-25 18:53:48', '2018-11-25 18:53:48'),
(10, 'Player 10', 2, NULL, '2018-11-25 18:53:58', '2018-11-25 18:53:58');

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contest_id` int(10) UNSIGNED NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`id`, `name`, `contest_id`, `created_by`, `created_at`, `updated_at`) VALUES
(1, 'Team A', 1, 2, '2018-11-25 18:36:15', '2018-11-25 18:36:15'),
(2, 'Team B', 1, 2, '2018-11-25 18:36:15', '2018-11-25 18:36:15'),
(3, 'Team C', 1, 2, '2018-11-25 18:36:46', '2018-11-25 18:36:46'),
(4, 'Team D', 2, 2, '2018-11-25 18:37:19', '2018-11-25 18:37:19'),
(5, 'Team E', 2, 2, '2018-11-25 18:59:15', '2018-11-25 18:59:15');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_type` enum('contest_maker','team_owner','player') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `user_type`, `created_at`, `updated_at`) VALUES
(1, 'Arafat', 'arafat@gmail.com', '$2y$10$ManJDbnQuqN.zurvQ3MAYuV5orK02Z5Nv51wm/m4cfK2en.nHchDS', 'contest_maker', '2018-11-25 12:40:54', '2018-11-25 12:40:54'),
(2, 'Robin', 'robin@gmail.com', '$2y$10$ManJDbnQuqN.zurvQ3MAYuV5orK02Z5Nv51wm/m4cfK2en.nHchDS', 'team_owner', '2018-11-25 12:41:20', '2018-11-25 12:41:20'),
(3, 'Abu', 'abu@gmail.com', '$2y$10$ManJDbnQuqN.zurvQ3MAYuV5orK02Z5Nv51wm/m4cfK2en.nHchDS', 'player', '2018-11-25 12:41:46', '2018-11-25 12:41:46');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contests`
--
ALTER TABLE `contests`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_foreign_key` (`created_by`);

--
-- Indexes for table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`),
  ADD KEY `team_id` (`team_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contest_id_foreign_key` (`contest_id`),
  ADD KEY `user_id_foreign_key` (`created_by`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contests`
--
ALTER TABLE `contests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `players`
--
ALTER TABLE `players`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `contests`
--
ALTER TABLE `contests`
  ADD CONSTRAINT `user_foreign_key` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `players`
--
ALTER TABLE `players`
  ADD CONSTRAINT `players_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`),
  ADD CONSTRAINT `players_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `teams`
--
ALTER TABLE `teams`
  ADD CONSTRAINT `contest_id_foreign_key` FOREIGN KEY (`contest_id`) REFERENCES `contests` (`id`),
  ADD CONSTRAINT `user_id_foreign_key` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
