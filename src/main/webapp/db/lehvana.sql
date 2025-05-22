-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 22, 2025 at 07:38 AM
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
-- Database: `lehvanya`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `cart_id` int(50) NOT NULL,
  `user_id` int(50) NOT NULL,
  `cart_total_amount` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`cart_id`, `user_id`, `cart_total_amount`) VALUES
(1, 5, 13600),
(2, 24, 13000),
(3, 25, 20000),
(4, 26, 2000),
(5, 28, 3500);

-- --------------------------------------------------------

--
-- Table structure for table `cart_product`
--

CREATE TABLE `cart_product` (
  `cart_item_id` int(50) NOT NULL,
  `cart_id` int(50) NOT NULL,
  `product_id` int(50) NOT NULL,
  `quantity` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart_product`
--

INSERT INTO `cart_product` (`cart_item_id`, `cart_id`, `product_id`, `quantity`) VALUES
(1, 1, 8, 3),
(2, 1, 20, 1),
(3, 2, 13, 1),
(4, 2, 20, 1),
(6, 4, 23, 1),
(7, 5, 13, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(20) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `category_description` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`, `category_description`) VALUES
(1, 'Saree', 'Experience the grace of tradition with this finely woven saree, made from luxurious fabric that offers a soft and flattering drape. Featuring subtle embroidery and elegant designs, it is an excellent pick for formal events, cultural functions, and special'),
(2, 'Lehenga ', 'A lehenga is a traditional South Asian outfit consisting of a flared skirt (lehenga), a fitted blouse (choli), and a decorative scarf (dupatta). Often worn for weddings and festivals, it features intricate embroidery and embellishments, combining elegance'),
(3, 'Kurtha', 'A kurta for girls is a stylish, knee-length tunic that comes in various fabrics and designs. It is often paired with leggings, salwars, or skirts and is perfect for both casual and festive occasions. Kurtas can be simple or adorned with embroidery, making'),
(4, 'Gown', 'A gown is a formal, elegant dress typically worn for special occasions like weddings, parties, or galas. It features a long, flowing design that reaches the floor, often with a fitted bodice and a skirt that flares out. Gowns come in various styles, mater');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(50) NOT NULL,
  `user_id` int(50) NOT NULL,
  `order_date` date NOT NULL,
  `total_amount` int(50) NOT NULL,
  `order_status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_product`
--

CREATE TABLE `order_product` (
  `order_id` int(50) NOT NULL,
  `product_id` int(50) NOT NULL,
  `quatity` int(50) NOT NULL,
  `price` int(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(255) NOT NULL,
  `price` int(50) NOT NULL,
  `quantity` int(50) NOT NULL,
  `image` varchar(255) NOT NULL,
  `category_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `name`, `description`, `price`, `quantity`, `image`, `category_id`) VALUES
(8, 'Banarasi Sari', 'Multi color soft fabric sari  ', 9000, 10, 'download (4).jpeg', 2),
(13, 'silk saree', 'soft and light weight elegant saree in purple color', 3000, 2, 'saree.jpeg', 1),
(20, 'Red net lehenga', 'Heavy embroided lehenga', 10000, 1, 'Indian Wedding Lehenga.jpg', 2),
(23, 'lehnga', 'beautiful gown with comfortable fabric', 2000, 6, 'bright_maroon_silk_saree_for_wedding_17417615967305_copy.jpg', 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address` varchar(50) NOT NULL,
  `role` varchar(50) NOT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `photo` varchar(155) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `email`, `password`, `address`, `role`, `user_name`, `phone_number`, `photo`, `dob`, `gender`) VALUES
(5, 'Riya', 'Nepali', 'riya@gmail.com', 'riya123', 'Pokhara', 'customer', NULL, NULL, NULL, NULL, NULL),
(23, 'Riya', 'Gaire', 'riya12@gmail.com', 'W+ZXKlXlMo+imIlqqdmZBhjswAYxs/a7MRNbOV0LX1w=', 'Pokhara riya', 'Admin', 'reeyu', '9876543213', 'capital one.jpg', '2010-02-02', 'Female'),
(24, 'Asmita', 'Rana', 'rana@gmail.com', 'HLU1ELP1ldqFw4pLRLw53tDOkN4JuwJhU74E/pTx4JU=', 'rana', 'Customer', 'rana', '9999999999', 'Screenshot (57).png', '2025-05-01', 'Male'),
(25, 'Kripa', 'Pandey', 'kripa@gmail.com', '1wXCc6ZMqwYSv5gR+iWi/A==', 'Malepatan', 'Customer', 'kripaaa', '9812345670', 'cc.jpg', '2003-06-10', 'Female'),
(26, 'Sunita', 'Poudel', 'sunita@gmail.com', 'F39oEhMoHYVWcf/c9knQ4w==', 'Bindabasini', 'Customer', 'sunita12', '9804566667', 'capital one.jpg', '2009-02-10', 'Female'),
(28, 'Diljit ', 'Pandey', 'abc@gmail.com', 'FPly/FuyDL9ipSu00eFj+w==', 'Pokhara', 'Admin', 'diljitp', '9876543210', 'cc.jpg', '2003-06-25', 'Male'),
(30, 'Asmita', 'Rana Magar', 'rana9@gmail.com', 'uWZS3QWNfDKHQ0E9uO7+yw==', 'Pokhara', 'Customer', 'rana99r', '9847723045', 'Screenshot 2025-05-22 063756.png', '2025-05-03', 'Male'),
(31, 'Rita', 'Pun', 'rita9@gmail.com', 'InO4HDxU1Rbk3NV2VMJ7aA==', 'Pokhara, Fulbari', 'Customer', 'Rita09', '9847723044', 'Screenshot 2025-05-22 063756.png', '2025-05-08', 'Male');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `cart_product`
--
ALTER TABLE `cart_product`
  ADD PRIMARY KEY (`cart_item_id`),
  ADD KEY `cart_id` (`cart_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_name` (`user_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `cart_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cart_product`
--
ALTER TABLE `cart_product`
  MODIFY `cart_item_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_product`
--
ALTER TABLE `order_product`
  MODIFY `order_id` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `cart_product`
--
ALTER TABLE `cart_product`
  ADD CONSTRAINT `cart_product_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`),
  ADD CONSTRAINT `cart_product_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `order_product` (`order_id`);

--
-- Constraints for table `order_product`
--
ALTER TABLE `order_product`
  ADD CONSTRAINT `order_product_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
