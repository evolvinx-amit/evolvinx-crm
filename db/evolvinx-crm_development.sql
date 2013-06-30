-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 30, 2013 at 04:43 PM
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
-- Table structure for table `contacts`
--

CREATE TABLE IF NOT EXISTS `contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `acoount` int(11) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `m_street` varchar(255) DEFAULT NULL,
  `m_city` varchar(255) DEFAULT NULL,
  `m_state` varchar(255) DEFAULT NULL,
  `m_zip` varchar(255) DEFAULT NULL,
  `m_country` varchar(255) DEFAULT NULL,
  `o_street` varchar(255) DEFAULT NULL,
  `o_city` varchar(255) DEFAULT NULL,
  `o_state` varchar(255) DEFAULT NULL,
  `o_zip` varchar(255) DEFAULT NULL,
  `o_country` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int(11) DEFAULT NULL,
  `owner` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `firstname`, `lastname`, `title`, `status`, `phone`, `email`, `acoount`, `position`, `m_street`, `m_city`, `m_state`, `m_zip`, `m_country`, `o_street`, `o_city`, `o_state`, `o_zip`, `o_country`, `created_at`, `created_by`, `updated_at`, `updated_by`, `owner`) VALUES
(1, NULL, 'aaaa', NULL, NULL, NULL, 'amit@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2013-06-30 14:39:56', NULL, '2013-06-30 08:39:56', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `leads`
--

CREATE TABLE IF NOT EXISTS `leads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `company` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `ratting` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `annual_revenue` double DEFAULT NULL,
  `employee_no` int(32) DEFAULT NULL,
  `lead_source` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `owner` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `leads`
--

INSERT INTO `leads` (`id`, `firstname`, `lastname`, `title`, `company`, `status`, `phone`, `email`, `ratting`, `website`, `street`, `city`, `state`, `zip`, `country`, `annual_revenue`, `employee_no`, `lead_source`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `owner`) VALUES
(4, 'Amit', 'Kumar Paul', 'Mr', 'Phase3solution', 'Qualified', '01721322184', 'amit@phase3solution.com', 'Hot', NULL, '9/1', 'Dhaka', 'Mirpur', '1207', NULL, 100000, 15, 'Meeting', 'Very nice person', '2013-06-30 11:11:42', '2013-06-30 08:43:08', NULL, NULL, 1);

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
