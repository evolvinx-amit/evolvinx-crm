-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 01, 2013 at 03:45 PM
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
-- Table structure for table `accounts`
--

CREATE TABLE IF NOT EXISTS `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `fax` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `industry` varchar(255) DEFAULT NULL,
  `employees` int(11) DEFAULT NULL,
  `annual_revenue` float DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `b_street` varchar(255) DEFAULT NULL,
  `b_city` varchar(255) DEFAULT NULL,
  `b_state` varchar(255) DEFAULT NULL,
  `b_zip` varchar(255) DEFAULT NULL,
  `b_country` varchar(255) DEFAULT NULL,
  `s_street` varchar(255) DEFAULT NULL,
  `s_city` varchar(255) DEFAULT NULL,
  `s_state` varchar(255) DEFAULT NULL,
  `s_zip` varchar(255) DEFAULT NULL,
  `s_country` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_by` int(11) DEFAULT NULL,
  `owner` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `account_name`, `status`, `phone`, `fax`, `website`, `discount`, `type`, `industry`, `employees`, `annual_revenue`, `description`, `b_street`, `b_city`, `b_state`, `b_zip`, `b_country`, `s_street`, `s_city`, `s_state`, `s_zip`, `s_country`, `created_at`, `created_by`, `updated_at`, `updated_by`, `owner`) VALUES
(1, 'Phase3solution1', 1, '01721322184', NULL, NULL, NULL, NULL, NULL, 15, 100000, 'Very nice person', '9/1', 'Dhaka', 'Mirpur', '1207', NULL, NULL, NULL, NULL, NULL, NULL, '2013-07-01 10:27:25', NULL, '2013-07-01 04:27:25', NULL, 1),
(2, 'ssss', 1, '', '', '', NULL, '', '', NULL, 111, '', '', '', '', '', NULL, '', '', '', '', NULL, '2013-07-01 10:58:41', NULL, '2013-07-01 07:41:00', NULL, 1),
(3, 'asdas', 1, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '2013-07-01 13:42:52', NULL, '2013-07-01 07:42:52', NULL, 1);

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
  `account_name` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `firstname`, `lastname`, `title`, `status`, `phone`, `email`, `account_name`, `position`, `m_street`, `m_city`, `m_state`, `m_zip`, `m_country`, `o_street`, `o_city`, `o_state`, `o_zip`, `o_country`, `created_at`, `created_by`, `updated_at`, `updated_by`, `owner`) VALUES
(2, 'Amit', 'Kumar Paul', 'Mr', 1, '01721322184', 'amit@phase3solution.com', 1, NULL, '9/1', 'Dhaka', 'Mirpur', '1207', NULL, NULL, NULL, NULL, NULL, NULL, '2013-07-01 10:52:22', NULL, '2013-07-01 04:52:22', NULL, 1),
(3, '', 'sss', '', 1, '', 'amit@ss.comaaa', 2, NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '2013-07-01 10:58:41', NULL, '2013-07-01 04:58:41', NULL, 1),
(4, '', 'sss', '', 1, '', 'amit@ss.comaaaa', 2, NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '2013-07-01 11:00:37', NULL, '2013-07-01 05:00:37', NULL, 1),
(5, '', 'pauld', '', 1, '', 'amit@ss.comd', 3, NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, '2013-07-01 13:42:52', NULL, '2013-07-01 07:42:52', NULL, 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `leads`
--

INSERT INTO `leads` (`id`, `firstname`, `lastname`, `title`, `company`, `status`, `phone`, `email`, `ratting`, `website`, `street`, `city`, `state`, `zip`, `country`, `annual_revenue`, `employee_no`, `lead_source`, `description`, `created_at`, `updated_at`, `created_by`, `updated_by`, `owner`) VALUES
(4, 'Amit', 'Kumar Paul', 'Mr', 'Phase3solution1', 'Qualified', '01721322184', 'amit@phase3solution.com', 'Hot', NULL, '9/1', 'Dhaka', 'Mirpur', '1207', NULL, 100000, 15, 'Meeting', 'Very nice person', '2013-06-30 11:11:42', '2013-07-01 02:45:27', NULL, NULL, 1),
(5, '', 'sss', '', 'ssss', 'Qualified', '', 'amit@ss.comaaaa', '', NULL, '', '', '', '', NULL, NULL, NULL, '', '', '2013-07-01 10:54:13', '2013-07-01 05:00:37', NULL, NULL, 1),
(6, '', 'pauld', '', 'asdas', 'Qualified', '', 'amit@ss.comd', '', NULL, '', '', '', '', NULL, NULL, NULL, '', '', '2013-07-01 12:44:52', '2013-07-01 07:42:52', NULL, NULL, 1);

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
