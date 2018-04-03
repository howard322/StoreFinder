-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 12, 2017 at 03:58 PM
-- Server version: 5.6.24
-- PHP Version: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `storefinderdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `checkout`
--

CREATE TABLE IF NOT EXISTS `checkout` (
  `checkout_id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `address` varchar(60) NOT NULL,
  `city` int(11) NOT NULL,
  `number` varchar(60) NOT NULL,
  `delivery` tinyint(4) NOT NULL DEFAULT '1',
  `orderDate` varchar(60) NOT NULL,
  `creditpayment` tinyint(4) NOT NULL DEFAULT '1',
  `cardNumber` varchar(20) DEFAULT NULL,
  `cardExpiry` varchar(5) DEFAULT NULL,
  `cardCVC` varchar(3) DEFAULT NULL,
  `orders_id` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `checkout`
--

INSERT INTO `checkout` (`checkout_id`, `name`, `address`, `city`, `number`, `delivery`, `orderDate`, `creditpayment`, `cardNumber`, `cardExpiry`, `cardCVC`, `orders_id`) VALUES
(1, 'Test buyer', 'Test address', 1, '92929292', 0, '10/28/2017', 1, '', '', '', '20171028401626651');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE IF NOT EXISTS `locations` (
  `loc_id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `parent_loc` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`loc_id`, `name`, `parent_loc`) VALUES
(1, 'Manila City', 1),
(2, 'Quezon City', 2),
(3, 'Makati City', 3),
(4, 'Taguig City', 4),
(5, 'Sampaloc', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` varchar(20) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `product_id`, `qty`, `price`) VALUES
('20171028401626651', 1, 3, '30.00'),
('20171028401626651', 2, 5, '25.00');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE IF NOT EXISTS `products` (
  `product_id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `description` varchar(60) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `name`, `description`) VALUES
(1, 'Apple', 'Apple desc'),
(2, 'Banana', 'Banana desc');

-- --------------------------------------------------------

--
-- Table structure for table `store`
--

CREATE TABLE IF NOT EXISTS `store` (
  `store_id` int(11) NOT NULL,
  `name` varchar(60) NOT NULL,
  `creditpayable` tinyint(4) NOT NULL DEFAULT '1',
  `loc_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `store`
--

INSERT INTO `store` (`store_id`, `name`, `creditpayable`, `loc_id`) VALUES
(1, 'Store1', 1, 1),
(2, 'Store2', 0, 1),
(3, 'Store3', 1, 1),
(4, 'Store4', 0, 2);

-- --------------------------------------------------------

--
-- Table structure for table `store_products`
--

CREATE TABLE IF NOT EXISTS `store_products` (
  `stor_prod_id` int(11) NOT NULL,
  `store_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `price` decimal(4,2) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `store_products`
--

INSERT INTO `store_products` (`stor_prod_id`, `store_id`, `product_id`, `price`) VALUES
(1, 1, 1, '30.00'),
(2, 1, 2, '25.00'),
(3, 2, 1, '32.00'),
(4, 2, 2, '26.00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `username` varchar(45) NOT NULL,
  `password` varchar(60) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`username`, `password`, `enabled`) VALUES
('chris', '$2a$10$.y4M0CGT7VzwcO27qqjO2uAc3IOlCkaErBLaag8eU25l1Xs/414xC', 1),
('ciri', '$2a$10$.y4M0CGT7VzwcO27qqjO2uAc3IOlCkaErBLaag8eU25l1Xs/414xC', 1),
('testuser', '$2a$10$b4EEyKN8edWoBVdcjqcgkuy1Vg9A2/yX9KuE1V2u2kIWMZrOlUhMK', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE IF NOT EXISTS `user_info` (
  `username` varchar(45) NOT NULL,
  `email` varchar(60) NOT NULL,
  `name` varchar(60) NOT NULL,
  `city_id` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`username`, `email`, `name`, `city_id`) VALUES
('chris', 'test2@email.com', 'Chris', ''),
('ciri', 'test@email.com', 'Ciri', ''),
('testuser', 'testuser@email.com', 'Test User', '1');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE IF NOT EXISTS `user_roles` (
  `user_role_id` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `role` varchar(45) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`user_role_id`, `username`, `role`) VALUES
(2, 'chris', 'ROLE_ADMIN'),
(1, 'chris', 'ROLE_USER'),
(3, 'ciri', 'ROLE_USER'),
(4, 'testuser', 'ROLE_USER');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `checkout`
--
ALTER TABLE `checkout`
  ADD PRIMARY KEY (`checkout_id`), ADD KEY `fk_citycheck_id` (`city`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`loc_id`), ADD KEY `fk_loc_id` (`parent_loc`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD KEY `fk_prodorder_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `store`
--
ALTER TABLE `store`
  ADD PRIMARY KEY (`store_id`), ADD KEY `fk_store_loc` (`loc_id`);

--
-- Indexes for table `store_products`
--
ALTER TABLE `store_products`
  ADD PRIMARY KEY (`stor_prod_id`), ADD UNIQUE KEY `uni_store_prodx` (`store_id`,`product_id`), ADD KEY `fk_productidxn_idx` (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`username`), ADD KEY `fk_username_infox` (`username`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`user_role_id`), ADD UNIQUE KEY `uni_username_role` (`role`,`username`), ADD KEY `fk_username_idx` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `checkout`
--
ALTER TABLE `checkout`
  MODIFY `checkout_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `loc_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `store`
--
ALTER TABLE `store`
  MODIFY `store_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `store_products`
--
ALTER TABLE `store_products`
  MODIFY `stor_prod_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `user_role_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `checkout`
--
ALTER TABLE `checkout`
ADD CONSTRAINT `fk_citycheck_id` FOREIGN KEY (`city`) REFERENCES `locations` (`loc_id`);

--
-- Constraints for table `locations`
--
ALTER TABLE `locations`
ADD CONSTRAINT `fk_loc_id` FOREIGN KEY (`parent_loc`) REFERENCES `locations` (`loc_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
ADD CONSTRAINT `fk_prodorder_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `store`
--
ALTER TABLE `store`
ADD CONSTRAINT `fk_store_loc` FOREIGN KEY (`loc_id`) REFERENCES `locations` (`loc_id`);

--
-- Constraints for table `store_products`
--
ALTER TABLE `store_products`
ADD CONSTRAINT `fk_productidxn` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_storeidn` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `user_info`
--
ALTER TABLE `user_info`
ADD CONSTRAINT `fk_username_info` FOREIGN KEY (`username`) REFERENCES `users` (`username`);

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
ADD CONSTRAINT `fk_username` FOREIGN KEY (`username`) REFERENCES `users` (`username`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
