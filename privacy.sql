-- phpMyAdmin SQL Dump
-- version 3.2.0.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 27, 2015 at 06:04 AM
-- Server version: 5.1.36
-- PHP Version: 5.3.0

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `privacy`
--

-- --------------------------------------------------------

--
-- Table structure for table `clouddetails`
--

CREATE TABLE IF NOT EXISTS `clouddetails` (
  `ip` varchar(30) DEFAULT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT NULL,
  `rdate` date DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `clouddetails`
--

INSERT INTO `clouddetails` (`ip`, `username`, `password`, `status`, `rdate`) VALUES
('ftp.drivehq.com', 'coignieee', 'coignieee', 'Active', '2015-03-19');

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE IF NOT EXISTS `registration` (
  `NAME` varchar(30) DEFAULT NULL,
  `UNAME` varchar(30) NOT NULL,
  `PWD` varchar(30) DEFAULT NULL,
  `EMAIL` varchar(40) DEFAULT NULL,
  `GENDER` varchar(20) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `QUESTION` varchar(100) DEFAULT NULL,
  `ANSWER` varchar(200) DEFAULT NULL,
  `PNO` varchar(20) DEFAULT NULL,
  `CITY` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`UNAME`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registration`
--

INSERT INTO `registration` (`NAME`, `UNAME`, `PWD`, `EMAIL`, `GENDER`, `DOB`, `QUESTION`, `ANSWER`, `PNO`, `CITY`) VALUES
('krishna', 'krishna', 'krishna', 'krishna@gmail.com', 'male', '2015-03-06', 'nickname', 'krishna', '9989959950', 'hyd'),
('Vinay', 'Vinay', 'Vinay', 'vinay@gmail.com', 'male', '2015-03-05', 'nickname', 'Vinay', '9966332211', 'Hyd');

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE IF NOT EXISTS `request` (
  `username` varchar(45) DEFAULT NULL,
  `filename` varchar(45) DEFAULT NULL,
  `cloud` varchar(45) DEFAULT NULL,
  `tdate` date DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `owner` varchar(30) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`username`, `filename`, `cloud`, `tdate`, `status`, `owner`) VALUES
('surender', 'Essays.docx', 'coignieee', '2015-03-19', 'download', 'Vinay'),
('surender', 'Chrysanthemum.jpg', 'coignieee', '2015-03-25', 'download', 'Vinay');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE IF NOT EXISTS `transaction` (
  `username` varchar(45) DEFAULT NULL,
  `filename` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `cloud` varchar(45) DEFAULT NULL,
  `tdate` date DEFAULT NULL,
  `report` varchar(45) DEFAULT NULL,
  `FILEOWNERNAME` varchar(45) DEFAULT NULL,
  `key` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`username`, `filename`, `status`, `cloud`, `tdate`, `report`, `FILEOWNERNAME`, `key`) VALUES
('coignieee', 'Essays.docx', 'Success', 'ftp.drivehq.com', '2015-03-19', 'Upload', 'Vinay', '63526887'),
('coignieee', 'Chrysanthemum.jpg', 'Success', 'ftp.drivehq.com', '2015-03-25', 'Upload', 'Vinay', '11727515'),
('coignieee', 'Chrysanthemum.jpg', 'Success', 'ftp.drivehq.com', '2015-03-26', 'Upload', 'krishna', '87627052');

-- --------------------------------------------------------

--
-- Table structure for table `userregistration`
--

CREATE TABLE IF NOT EXISTS `userregistration` (
  `NAME` varchar(30) DEFAULT NULL,
  `UNAME` varchar(30) NOT NULL,
  `PWD` varchar(30) DEFAULT NULL,
  `EMAIL` varchar(40) DEFAULT NULL,
  `GENDER` varchar(20) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  `QUESTION` varchar(100) DEFAULT NULL,
  `ANSWER` varchar(200) DEFAULT NULL,
  `PNO` varchar(20) DEFAULT NULL,
  `CITY` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`UNAME`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userregistration`
--

INSERT INTO `userregistration` (`NAME`, `UNAME`, `PWD`, `EMAIL`, `GENDER`, `DOB`, `QUESTION`, `ANSWER`, `PNO`, `CITY`) VALUES
('surender', 'surender', 'surender', 'surendermeesala14@gmail.com', 'male', '2015-03-03', 'nickname', 'surender', '9988774411', 'Hyderabad');

-- --------------------------------------------------------

--
-- Table structure for table `usertransaction`
--

CREATE TABLE IF NOT EXISTS `usertransaction` (
  `username` varchar(45) DEFAULT NULL,
  `filename` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `cloud` varchar(45) DEFAULT NULL,
  `tdate` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `usertransaction`
--

INSERT INTO `usertransaction` (`username`, `filename`, `status`, `cloud`, `tdate`) VALUES
('surender', 'Essays.docx', 'DownLoaded', 'coignieee', '2015-03-19'),
('surender', 'Chrysanthemum.jpg', 'DownLoaded', 'coignieee', '2015-03-25');
