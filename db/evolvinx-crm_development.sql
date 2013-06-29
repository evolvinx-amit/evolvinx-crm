-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 29, 2013 at 04:20 PM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `evolvinx-crm_development`
--

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT NULL,
  `list_position` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `enabled`, `list_position`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 1, 1, '2013-06-18 12:03:03', '2013-06-18 12:03:03'),
(2, 'Recruiter', 1, 2, '2013-06-18 12:03:03', '2013-06-18 12:03:03'),
(3, 'Sales', 1, 3, '2013-06-18 12:03:03', '2013-06-18 12:03:03');

-- --------------------------------------------------------

--
-- Table structure for table `schema_migrations`
--

CREATE TABLE IF NOT EXISTS `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` text,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role_id`, `name`, `address`, `city`, `state`, `zip`, `phone`, `fax`, `active`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@example.com', '0b4e7a0e5fe84ad35fb5f95b9ceeac79', 1, 'Company Admin', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2013-06-18 12:03:03', '2013-06-18 19:49:11'),
(2, 'recruiter', 'recruiter@example.com', '0b4e7a0e5fe84ad35fb5f95b9ceeac79', 2, 'Company recruiter', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2013-06-18 12:03:03', '2013-06-18 19:49:11'),
(3, 'sales', 'sales@example.com', '0b4e7a0e5fe84ad35fb5f95b9ceeac79', 3, 'Company sales', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2013-06-18 12:03:03', '2013-06-18 19:49:11'),
(18, 'asdfasd', 'test1@gmail.comaa', '0b4e7a0e5fe84ad35fb5f95b9ceeac79', 3, 'asdds', NULL, NULL, NULL, NULL, NULL, NULL, 1, '2013-06-29 13:29:00', '2013-06-29 13:29:00');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
