-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 15, 2023 at 04:07 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cafeteria`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`) VALUES
(1, 'BREAKFAST', 'BREAKFAST'),
(2, 'LUNCH', 'LUNCH'),
(3, 'SUPPER', 'SUPPER');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(200) NOT NULL,
  `email` varchar(255) NOT NULL,
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `username`, `password`, `email`, `create_at`) VALUES
(1, '2017', '$2y$10$zCX0JK/KZbftr9P5TB0cUepR66kw7Qs1VsglWrdapjvaWQNYanGqS', 'jacksonmichelo@icloud.com', '2023-05-10 06:58:46'),
(2, 'jack', '$2y$10$3gMta.db812/rJyAYsfwA.bWbauW.D5h/VDdlQKY1eHEOFOy.b2JS', 'jacksonmichelo2@gmail.com', '2023-05-10 16:48:00'),
(3, 'bills', '$2y$10$gazaLzO1TU3RXfvkT9jQJOHLmuOE0juRjMzY1WN5SG9pRxTVU.S/2', 'bills@gmail.com', '2023-06-05 15:48:48');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_no` varchar(50) NOT NULL,
  `total_amount` float NOT NULL,
  `amount_tendered` float NOT NULL,
  `order_number` int(30) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `ref_no`, `total_amount`, `amount_tendered`, `order_number`, `date_created`) VALUES
(6, '804084087974', 30, 100, 20170336, '2023-04-19 13:55:55'),
(7, '659707334950', 10, 20, 20140152, '2023-04-20 10:16:22'),
(8, '015204241676', 10, 100, 20171234, '2023-04-23 13:16:19'),
(9, '889125514502', 10, 100, 10, '2023-04-30 17:23:35'),
(10, '752378684758', 10, 100, 2017, '2023-05-01 09:19:14'),
(11, '453380678728', 10, 140, 2014, '2023-05-01 09:21:06'),
(12, '684013915254', 30, 50, 14455, '2023-05-01 09:22:00'),
(13, '116497187431', 10, 100, 2555, '2023-05-01 14:40:52'),
(14, '721877717126', 64, 100, 2017, '2023-05-15 16:03:59');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
CREATE TABLE IF NOT EXISTS `order_items` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `qty` int(30) NOT NULL,
  `price` float NOT NULL,
  `amount` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `qty`, `price`, `amount`) VALUES
(1, 1, 4, 1, 70, 70),
(2, 1, 3, 1, 100, 100),
(5, 3, 4, 1, 70, 70),
(6, 4, 2, 1, 15, 15),
(7, 5, 4, 1, 70, 70),
(8, 6, 5, 3, 10, 30),
(9, 7, 5, 1, 10, 10),
(10, 8, 5, 1, 10, 10),
(11, 9, 1, 1, 10, 10),
(12, 10, 2, 1, 10, 10),
(13, 11, 1, 1, 10, 10),
(14, 12, 1, 1, 10, 10),
(15, 13, 1, 1, 10, 10),
(16, 12, 3, 1, 10, 10),
(17, 12, 9, 1, 2, 2),
(18, 12, 5, 1, 8, 8),
(19, 14, 6, 3, 8, 24),
(20, 14, 7, 4, 5, 20),
(21, 14, 3, 2, 10, 20);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `category_id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `price` float NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0=Unavailable,1=Available',
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `name`, `description`, `price`, `status`) VALUES
(1, 1, 'Bread and Tea', 'Bread / Green Pepper / Tomates / Eggs', 15, 1),
(3, 2, 'Roasted Chicken / Boiled Chicken', 'Onion Powder/ Chicken Spice / Vinegar', 10, 1),
(4, 2, 'Sausage', 'Chilli Spice/ Vinegar / Salt', 10, 1),
(5, 2, 'Scrambled-Eggs', 'Tomato / Green Pepper / Onion', 8, 1),
(6, 2, 'Beans', 'Tomatoes/ Onion / Garlic', 8, 1),
(7, 2, 'Nshima', 'Nshima', 5, 1),
(8, 2, 'Rice', 'Vegetables / Chicken', 20, 1),
(9, 2, 'Vegetables', 'Vegetables', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

DROP TABLE IF EXISTS `system_settings`;
CREATE TABLE IF NOT EXISTS `system_settings` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `cover_img` text NOT NULL,
  `about_content` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `cover_img`, `about_content`) VALUES
(1, 'WELCOME RUSANGU UNVERSITY CAFETERIA MANAGEMENT SYSTEM', 'jacksonmichelo@gmail.com', '1234567', '1681978500_ru.jpg', 'Rusangu Unversity Cafeteria Management');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '3' COMMENT '1=Admin,2=Staff',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `type`) VALUES
(1, 'admin', 'admin', '0192023a7bbd73250516f069df18b500', 1),
(2, 'JAY', 'jax', 'fbade9e36a3f36d3d676c1b808451dd7', 2),
(3, 'JACKSON MICHELO', '20170336', '7215ee9c7d9dc229d2921a40e899ec5f', 1),
(4, 'Kapuka', 'kapuka', 'fb76431bc754c01891c31d705ad4df55', 2);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
