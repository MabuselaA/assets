-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 09, 2016 at 08:48 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tsc_assets`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE IF NOT EXISTS `address` (
  `ADDRESS_ID` int(10) NOT NULL AUTO_INCREMENT,
  `STREEET_NAME` varchar(20) NOT NULL,
  `CODE` int(4) NOT NULL,
  PRIMARY KEY (`ADDRESS_ID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`ADDRESS_ID`, `STREEET_NAME`, `CODE`) VALUES
(3, 'West', 2195),
(4, 'east', 2430);

-- --------------------------------------------------------

--
-- Table structure for table `asset`
--

CREATE TABLE IF NOT EXISTS `asset` (
  `ASSET_ID` varchar(7) NOT NULL,
  `SERIAL_NO` varchar(30) NOT NULL,
  `STATUS` varchar(25) NOT NULL,
  `DESCRIPTION` varchar(35) NOT NULL,
  `AVAILABLILITY` varchar(3) NOT NULL,
  `SERVICE_INTERVAL` varchar(35) NOT NULL,
  PRIMARY KEY (`ASSET_ID`),
  UNIQUE KEY `ASSET_ID` (`ASSET_ID`),
  UNIQUE KEY `SERIAL_NO` (`SERIAL_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `asset`
--

INSERT INTO `asset` (`ASSET_ID`, `SERIAL_NO`, `STATUS`, `DESCRIPTION`, `AVAILABLILITY`, `SERVICE_INTERVAL`) VALUES
('', '', 'Excellent', '', 'YES', '3 Months'),
('LPT001', '1234567890KSY12', 'GOOD CONDITION', 'LAPTOP-LENOVO i3', 'YES', '3 months'),
('USB002', '12345678UFD90K', 'GOOD CONDITION', 'USB STICK', 'YES', '4 MONTHS'),
('USB003', '2345678UKDGHAH23', 'Good', 'USE STICK', 'YES', '3 Months');

-- --------------------------------------------------------

--
-- Table structure for table `assetregister`
--

CREATE TABLE IF NOT EXISTS `assetregister` (
  `serialnumber` varchar(35) NOT NULL,
  `assetid` varchar(10) NOT NULL,
  `status` varchar(10) NOT NULL,
  `department` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`serialnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE IF NOT EXISTS `book` (
  `ASSET_ID` varchar(7) NOT NULL,
  `Equipment` varchar(50) NOT NULL,
  `SignOut` datetime NOT NULL,
  `SignIn` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`ASSET_ID`, `Equipment`, `SignOut`, `SignIn`) VALUES
('A001', 'Camera', '2015-08-13 07:15:10', '2015-08-14 08:20:20');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE IF NOT EXISTS `booking` (
  `bookingid` int(5) NOT NULL,
  `assetid` varchar(10) NOT NULL,
  `description` varchar(25) NOT NULL,
  `datepurchased` date DEFAULT NULL,
  PRIMARY KEY (`bookingid`),
  KEY `assetid` (`assetid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE IF NOT EXISTS `employee` (
  `Employee_ID` int(25) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Surname` varchar(30) DEFAULT NULL,
  `User_name` varchar(15) NOT NULL,
  PRIMARY KEY (`Employee_ID`,`User_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `userId` varchar(13) NOT NULL,
  `name` varchar(50) NOT NULL,
  `surname` varchar(50) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `role` varchar(5) NOT NULL DEFAULT 'user',
  PRIMARY KEY (`userId`),
  UNIQUE KEY `voter_id_2` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userId`, `name`, `surname`, `username`, `password`, `role`) VALUES
('0002', 'khokhoni', 'ramaphosa', 'khokhoni', 'khokhoni', 'user'),
('001', 'aisha', 'justin', 'aisha.justin', 'aisha', 'admin'),
('003', 'lorna', 'kamunga', 'lorna', '0', 'user'),
('006', 'christina', 'madiba', 'chris', 'chris', 'user'),
('09', 'elsa', 'heldenberg', 'elsa', 'anadel', 'user'),
('090289238', 'mark', 'nkosi', 'mark', 'mark', 'user'),
('09099', 'leah', 'justin', 'leah', 'leah', 'user');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
