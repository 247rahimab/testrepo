-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Sep 30, 2014 at 08:49 PM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `pizza_inn`
--

-- --------------------------------------------------------

--
-- Table structure for table `billing_details`
--

CREATE TABLE IF NOT EXISTS `billing_details` (
  `billing_id` int(10) NOT NULL AUTO_INCREMENT,
  `member_id` int(15) NOT NULL,
  `Street_Address` varchar(100) NOT NULL,
  `P_O_Box_No` varchar(15) NOT NULL,
  `City` text NOT NULL,
  `Mobile_No` varchar(15) NOT NULL,
  `Landline_No` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`billing_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `billing_details`
--

INSERT INTO `billing_details` (`billing_id`, `member_id`, `Street_Address`, `P_O_Box_No`, `City`, `Mobile_No`, `Landline_No`) VALUES
(8, 15, '361/A, MMH Hall, JU', '1342', 'Savar, Dhaka', '01737115397', '');

-- --------------------------------------------------------

--
-- Table structure for table `cart_details`
--

CREATE TABLE IF NOT EXISTS `cart_details` (
  `cart_id` int(15) NOT NULL AUTO_INCREMENT,
  `member_id` int(15) NOT NULL,
  `food_id` int(15) NOT NULL,
  `quantity_id` int(15) NOT NULL,
  `total` float NOT NULL,
  `flag` int(1) NOT NULL,
  PRIMARY KEY (`cart_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `cart_details`
--

INSERT INTO `cart_details` (`cart_id`, `member_id`, `food_id`, `quantity_id`, `total`, `flag`) VALUES
(1, 15, 25, 2, 80, 1),
(2, 15, 25, 1, 40, 1),
(3, 15, 28, 4, 360, 0),
(4, 15, 28, 4, 360, 1),
(5, 15, 25, 1, 40, 0);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `category_id` int(15) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(45) NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`) VALUES
(15, 'Lunch'),
(16, 'Breakfast'),
(17, 'Specials');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE IF NOT EXISTS `currencies` (
  `currency_id` int(5) NOT NULL AUTO_INCREMENT,
  `currency_symbol` varchar(15) NOT NULL,
  `flag` int(1) NOT NULL,
  PRIMARY KEY (`currency_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`currency_id`, `currency_symbol`, `flag`) VALUES
(1, 'Tk.', 1);

-- --------------------------------------------------------

--
-- Table structure for table `food_details`
--

CREATE TABLE IF NOT EXISTS `food_details` (
  `food_id` int(15) NOT NULL AUTO_INCREMENT,
  `food_name` varchar(45) NOT NULL,
  `food_description` text NOT NULL,
  `food_price` float NOT NULL,
  `food_photo` varchar(45) NOT NULL,
  `food_category` int(15) NOT NULL,
  PRIMARY KEY (`food_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29 ;

--
-- Dumping data for table `food_details`
--

INSERT INTO `food_details` (`food_id`, `food_name`, `food_description`, `food_price`, `food_photo`, `food_category`) VALUES
(25, 'Bread and butter', 'Breakfast item.', 40, 'Chrysanthemum.jpg', 16),
(26, 'Roll and cutlet', 'Breakfast item.', 40, 'Desert.jpg', 16),
(27, 'Rice and vegetables', 'Lunch item.', 50, 'Hydrangeas.jpg', 15),
(28, 'Khicuri with beaf', 'Tasty lunch item.', 120, 'Koala.jpg', 17);

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE IF NOT EXISTS `members` (
  `member_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `login` varchar(100) NOT NULL DEFAULT '',
  `passwd` varchar(32) NOT NULL DEFAULT '',
  `question_id` int(5) NOT NULL,
  `answer` varchar(45) NOT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`member_id`, `firstname`, `lastname`, `login`, `passwd`, `question_id`, `answer`) VALUES
(15, 'Abu Bakar', 'Siddique', 'abc@gmail.com', '202cb962ac59075b964b07152d234b70', 1, '1ce322ec4920fa4d0f5673f226fa8988');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `message_id` int(15) NOT NULL AUTO_INCREMENT,
  `message_from` varchar(25) NOT NULL,
  `message_date` date NOT NULL,
  `message_time` time NOT NULL,
  `message_subject` text NOT NULL,
  `message_text` text NOT NULL,
  PRIMARY KEY (`message_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`message_id`, `message_from`, `message_date`, `message_time`, `message_subject`, `message_text`) VALUES
(4, 'administrator', '2014-09-08', '13:38:02', 'Nice food.', 'Buy one and get one free.');

-- --------------------------------------------------------

--
-- Table structure for table `orders_details`
--

CREATE TABLE IF NOT EXISTS `orders_details` (
  `order_id` int(10) NOT NULL AUTO_INCREMENT,
  `member_id` int(10) NOT NULL,
  `billing_id` int(10) NOT NULL,
  `cart_id` int(15) NOT NULL,
  `delivery_date` date NOT NULL,
  `StaffID` int(15) NOT NULL,
  `flag` int(1) NOT NULL,
  `time_stamp` time NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

--
-- Dumping data for table `orders_details`
--

INSERT INTO `orders_details` (`order_id`, `member_id`, `billing_id`, `cart_id`, `delivery_date`, `StaffID`, `flag`, `time_stamp`) VALUES
(16, 15, 8, 1, '2014-09-08', 4, 1, '13:22:14'),
(17, 15, 8, 2, '2014-09-14', 0, 0, '18:38:07'),
(18, 15, 8, 4, '2014-09-14', 0, 0, '18:41:11');

-- --------------------------------------------------------

--
-- Table structure for table `partyhalls`
--

CREATE TABLE IF NOT EXISTS `partyhalls` (
  `partyhall_id` int(5) NOT NULL AUTO_INCREMENT,
  `partyhall_name` varchar(45) NOT NULL,
  PRIMARY KEY (`partyhall_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `partyhalls`
--

INSERT INTO `partyhalls` (`partyhall_id`, `partyhall_name`) VALUES
(1, '201'),
(2, '202');

-- --------------------------------------------------------

--
-- Table structure for table `pizza_admin`
--

CREATE TABLE IF NOT EXISTS `pizza_admin` (
  `Admin_ID` int(45) NOT NULL AUTO_INCREMENT,
  `Username` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  PRIMARY KEY (`Admin_ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `pizza_admin`
--

INSERT INTO `pizza_admin` (`Admin_ID`, `Username`, `Password`) VALUES
(3, 'admin', '123');

-- --------------------------------------------------------

--
-- Table structure for table `polls_details`
--

CREATE TABLE IF NOT EXISTS `polls_details` (
  `poll_id` int(15) NOT NULL AUTO_INCREMENT,
  `member_id` int(15) NOT NULL,
  `food_id` int(15) NOT NULL,
  `rate_id` int(5) NOT NULL,
  PRIMARY KEY (`poll_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `polls_details`
--

INSERT INTO `polls_details` (`poll_id`, `member_id`, `food_id`, `rate_id`) VALUES
(25, 15, 25, 5),
(26, 15, 26, 3);

-- --------------------------------------------------------

--
-- Table structure for table `quantities`
--

CREATE TABLE IF NOT EXISTS `quantities` (
  `quantity_id` int(5) NOT NULL AUTO_INCREMENT,
  `quantity_value` int(5) NOT NULL,
  PRIMARY KEY (`quantity_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `quantities`
--

INSERT INTO `quantities` (`quantity_id`, `quantity_value`) VALUES
(1, 1),
(2, 2),
(4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE IF NOT EXISTS `questions` (
  `question_id` int(5) NOT NULL AUTO_INCREMENT,
  `question_text` text NOT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`question_id`, `question_text`) VALUES
(1, 'What is your department name?'),
(2, 'What is your name?');

-- --------------------------------------------------------

--
-- Table structure for table `ratings`
--

CREATE TABLE IF NOT EXISTS `ratings` (
  `rate_id` int(5) NOT NULL AUTO_INCREMENT,
  `rate_name` varchar(15) NOT NULL,
  PRIMARY KEY (`rate_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ratings`
--

INSERT INTO `ratings` (`rate_id`, `rate_name`) VALUES
(1, '1'),
(2, '2'),
(3, '3'),
(4, '4'),
(5, '5');

-- --------------------------------------------------------

--
-- Table structure for table `reservations_details`
--

CREATE TABLE IF NOT EXISTS `reservations_details` (
  `ReservationID` int(15) NOT NULL AUTO_INCREMENT,
  `member_id` int(15) NOT NULL,
  `table_id` int(5) NOT NULL,
  `partyhall_id` int(5) NOT NULL,
  `Reserve_Date` date NOT NULL,
  `Reserve_Time` time NOT NULL,
  `StaffID` int(15) NOT NULL,
  `flag` int(1) NOT NULL,
  `table_flag` int(1) NOT NULL,
  `partyhall_flag` int(1) NOT NULL,
  PRIMARY KEY (`ReservationID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `reservations_details`
--

INSERT INTO `reservations_details` (`ReservationID`, `member_id`, `table_id`, `partyhall_id`, `Reserve_Date`, `Reserve_Time`, `StaffID`, `flag`, `table_flag`, `partyhall_flag`) VALUES
(7, 15, 2, 0, '2014-09-09', '17:18:00', 4, 1, 1, 0),
(8, 15, 0, 1, '2014-09-09', '17:22:00', 4, 1, 0, 1),
(9, 15, 3, 0, '2014-09-14', '22:27:00', 0, 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `specials`
--

CREATE TABLE IF NOT EXISTS `specials` (
  `special_id` int(15) NOT NULL AUTO_INCREMENT,
  `special_name` varchar(25) NOT NULL,
  `special_description` text NOT NULL,
  `special_price` float NOT NULL,
  `special_start_date` date NOT NULL,
  `special_end_date` date NOT NULL,
  `special_photo` varchar(45) NOT NULL,
  PRIMARY KEY (`special_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `specials`
--

INSERT INTO `specials` (`special_id`, `special_name`, `special_description`, `special_price`, `special_start_date`, `special_end_date`, `special_photo`) VALUES
(7, 'Khicuri with beaf', 'Tasty lunch item.', 120, '2014-09-09', '2014-09-15', 'Penguins.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE IF NOT EXISTS `staff` (
  `StaffID` int(15) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(25) NOT NULL,
  `lastname` varchar(25) NOT NULL,
  `Street_Address` text NOT NULL,
  `Mobile_Tel` varchar(20) NOT NULL,
  PRIMARY KEY (`StaffID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`StaffID`, `firstname`, `lastname`, `Street_Address`, `Mobile_Tel`) VALUES
(4, 'Kader', 'Hossain', '361/A, MMH Hall, JU', '01722631766');

-- --------------------------------------------------------

--
-- Table structure for table `tables`
--

CREATE TABLE IF NOT EXISTS `tables` (
  `table_id` int(5) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(45) NOT NULL,
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `tables`
--

INSERT INTO `tables` (`table_id`, `table_name`) VALUES
(2, '101'),
(3, '102');

-- --------------------------------------------------------

--
-- Table structure for table `timezones`
--

CREATE TABLE IF NOT EXISTS `timezones` (
  `timezone_id` int(5) NOT NULL AUTO_INCREMENT,
  `timezone_reference` varchar(45) NOT NULL,
  `flag` int(1) NOT NULL,
  PRIMARY KEY (`timezone_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `timezones`
--

INSERT INTO `timezones` (`timezone_id`, `timezone_reference`, `flag`) VALUES
(1, 'Dhaka(+GMT6)', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(32) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`) VALUES
(2, 'user', '123', 'user@juniv.edu');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
