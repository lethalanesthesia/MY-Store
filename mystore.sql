-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 16, 2023 at 04:42 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mystore`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_table`
--

CREATE TABLE `admin_table` (
  `admin_id` int(11) NOT NULL,
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(200) NOT NULL,
  `admin_password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin_table`
--

INSERT INTO `admin_table` (`admin_id`, `admin_name`, `admin_email`, `admin_password`) VALUES
(1, 'tua', 'lloricotua69@gmail.com', '$2y$10$9K/IqY4fWXJecFO0Ir58Mervyc2D9xnRNEm1QmnJq/ZIVdwi38Eea'),
(2, 'YURI', 'LLORICOTUA6666@GMAIL.COM', '$2y$10$DFPs5aei4nKbHvIShI6/.ut2WWXlDx16QWKCTaVuJUnvXbvP2UlIe');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(11) NOT NULL,
  `brand_title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_title`) VALUES
(1, 'Alfonso'),
(2, 'Fundador'),
(3, 'Red Horse'),
(4, 'Emperador'),
(5, 'GSM Blue'),
(6, 'The Bar'),
(7, 'Black Label'),
(8, 'Soju'),
(9, 'Martini'),
(16, 'Bacardi');

-- --------------------------------------------------------

--
-- Table structure for table `cart_details`
--

CREATE TABLE `cart_details` (
  `product_id` int(11) NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `quantity` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart_details`
--

INSERT INTO `cart_details` (`product_id`, `ip_address`, `quantity`) VALUES
(19, '::1', 0);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `category_title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_title`) VALUES
(1, 'Alcoholic Drinks'),
(2, 'Flavor Liquids'),
(3, 'Herbs/Fruit'),
(4, 'Add Ons'),
(6, 'Wine'),
(8, 'Whiskey');

-- --------------------------------------------------------

--
-- Table structure for table `orders_pending`
--

CREATE TABLE `orders_pending` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `invoice_number` int(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(255) NOT NULL,
  `order_status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `product_title` varchar(100) NOT NULL,
  `product_description` varchar(255) NOT NULL,
  `product_keywords` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `product_image1` varchar(255) NOT NULL,
  `product_image2` varchar(255) NOT NULL,
  `product_image3` varchar(255) NOT NULL,
  `product_price` varchar(100) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `product_title`, `product_description`, `product_keywords`, `category_id`, `brand_id`, `product_image1`, `product_image2`, `product_image3`, `product_price`, `date`, `status`) VALUES
(2, 'Alfonso', 'Alfonso is an amber-colored brandy of extraordinary character, with a very balanced flavor and fragrant finish.A medium and high-strength wine spirits.', 'Alfonso Solera, Alfonso Light, Alfonso Platinum', 1, 1, 'ALFONSO LIGHT.jpg', 'ALFONSO PLATINUM.jpg', 'ALFONSO SOLERA.jpg', '365', '2023-11-25 12:46:35', 'true'),
(3, 'Emperador', 'a holding company which operates an integrated business of manufacturing, bottling and distributing distilled spirits and other alcoholic beverages from the Philippines and Europe.', 'Light, Coffee, Double Light', 1, 4, 'EMPERADOR LIGHT.jpg', 'EMPERADOR DOUBLE LIGHT.jpg', 'EMPERADOR COFFEE.jpg', '240', '2023-11-13 03:32:29', 'true'),
(4, 'The Bar Pink Gin', 'The Bar Pink Gin has a pretty pink hue and sweet berry taste. Lean into the berry flavor by adding strawberries and a touch of spice with pink peppercorns, and tonic.', 'pink, the bar, gin', 2, 6, 'BARPINK.jpg', 'PINK.jpg', 'THEBARPINK.jpg', '125', '2023-11-11 00:27:13', 'true'),
(5, 'Black Label', 'A blend of malt and grain whiskies from across Scotland, aged for at least 12 years. A timeless classic with depth and balance of flavor.', 'whisky, double, black label', 1, 7, 'BLACK LABEL WHISKY.jpg', 'DOUBLE BLACK LABEL.jpg', 'BLACK LABEL.jpg', '1800', '2023-10-20 23:40:44', 'true'),
(7, 'The Bar Premium Gin', 'The Bar Premium Dry Gin has floral, juniper notes, and a grapefruit finish. It holds itself well against stronger flavors, so this is a good gin you can experiment with G&T mixes.', 'Premium, dry, gin, the bar', 1, 6, 'THEBAR PREMIUM.jpg', 'PREMIUM DRY GIN.jpg', 'THEBAR DRY GIN.jpg', '125', '2023-11-11 00:25:40', 'true'),
(9, 'Soju', 'Soju is fermented white rice with a crisp flavor, a little apple, and sometimes a touch of burnt rice. Soju is often called the Korean vodka, since it\'s smooth, mild, and mostly neutral', 'korean, soju, vodka', 2, 8, 'SOJU.jpg', 'SOJU1.jpg', 'SOJU2.jpg', '99', '2023-11-14 00:50:53', 'true'),
(13, 'Red Horse', 'A strong beer with a high alcohol content. It is deeply hued lager with a unique, sweetish flavor.', 'beer, red horse', 1, 3, 'RH.jpg', 'REDHORSE.png', 'REDHORSE-CAN.jpg', '170', '2023-11-26 02:25:58', 'true'),
(14, 'Martini', 'A classic Martini is made from gin and vermouth and garnished with either an olive or lemon twist.', 'alcohol, gin', 1, 9, 'MARTINI.jpg', 'MARTINI1.jpg', 'MARTINI2.jpg', '600', '2023-11-26 02:27:49', 'true'),
(15, 'Fundador', 'Fundador is the market-leading Spanish grape brandy.', 'double light, light, fundador, alcohol, gold', 1, 2, 'FUNDADOR DOUBLE LIGHT.jpg', 'FUNDADOR LIGHT.jpg', 'FUNDADOR GOLD.jpg', '350', '2023-11-26 02:31:10', 'true'),
(16, 'Bacardi', 'Bacardi Superior is a light and aromatic rum with light floral and fruity notes.', 'rum bacardi', 0, 16, 'BACARDI.jpg', 'BACARDI1.jpg', 'BACARDI2.jpg', '459', '2023-12-03 11:45:13', 'true'),
(17, 'Bloody Mary', ' While its origins may be debated, most recipes involve equal parts vodka and tomato juice mixed with additions like lemon juice, hot sauce, Worcestershire sauce, horseradish, fresh herbs, brown sugar and cracked black pepper. ', 'drinks HERBS', 3, 9, 'BLOODYMARY.jpg', 'BLOODYMARY.jpg', 'BLOODYMARY.jpg', '299', '2023-12-03 09:39:45', 'true'),
(18, 'Ammareto Sour', 'The exact origins of this sweet drink are mostly a mystery. Many believe it became popular in the 1970s when Italian spirits started making their way to the U.S. Traditionally made with amaretto liqueur and fresh lemon juice, some also add an egg white to', 'cocktail, lemon, juice sweet', 2, 9, 'AMMARETO SOUR.jpg', 'AMMARETO SOUR.jpg', 'AMMARETO SOUR.jpg', '299', '2023-12-03 11:35:15', 'true'),
(19, 'Bellini', 'Made with Prosecco, peach puree and a little raspberry juice.', 'peach juice ', 2, 9, 'BELLINI.jpg', 'BELLINI.jpg', 'BELLINI.jpg', '189', '2023-12-03 11:36:38', 'true'),
(20, 'Black Russian', 'Made simply with two parts coffee liqueur and five parts vodka.', 'coffee drinks liquor vodka', 1, 9, 'BLACK RUSSIAN.jpg', 'BLACK RUSSIAN.jpg', 'BLACK RUSSIAN.jpg', '169', '2023-12-03 11:38:18', 'true'),
(21, 'Boulivarder', 'Made with sweet vermouth and Campari. However, rather than gin, a Boulevardier is made with bourbon.', 'sweet vermouth campari gin  bourbon', 3, 9, 'BOULIVARDER.jpg', 'BOULIVARDER.jpg', 'BOULIVARDER.jpg', '349', '2023-12-03 11:40:28', 'true'),
(22, 'Brandy Alexander', ' Served straight up and made with brandy, cognac, creme de cacao and cream, a brandy Alexander is a variation of the gin-based drink known simply as an Alexander', 'brandy cognac cream cacao gin ', 3, 9, 'BRANDY ALEXANDER.jpg', 'BRANDY ALEXANDER.jpg', 'BRANDY ALEXANDER.jpg', '389', '2023-12-03 11:42:04', 'true'),
(23, 'Bronx Cocktail', 'This drink is basically a gin martini with a splash of orange juice.', 'cocktail gin orange jucie', 3, 9, 'BRONX COCKTAIL.jpg', 'BRONX COCKTAIL.jpg', 'BRONX COCKTAIL.jpg', '269', '2023-12-03 11:43:04', 'true');

-- --------------------------------------------------------

--
-- Table structure for table `user_orders`
--

CREATE TABLE `user_orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount_due` int(255) NOT NULL,
  `invoice_number` int(255) NOT NULL,
  `total_products` int(255) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `order_status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_payments`
--

CREATE TABLE `user_payments` (
  `payment_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `invoice_number` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `payment_mode` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_payments`
--

INSERT INTO `user_payments` (`payment_id`, `order_id`, `invoice_number`, `amount`, `payment_mode`, `date`) VALUES
(1, 1, 72329474, 2094, 'Cash on Delivery', '2023-12-16 02:29:39');

-- --------------------------------------------------------

--
-- Table structure for table `user_table`
--

CREATE TABLE `user_table` (
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_image` varchar(255) NOT NULL,
  `user_ip` varchar(100) NOT NULL,
  `user_address` varchar(255) NOT NULL,
  `user_mobile` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_table`
--

INSERT INTO `user_table` (`user_id`, `username`, `user_email`, `user_password`, `user_image`, `user_ip`, `user_address`, `user_mobile`) VALUES
(1, 'Tua', 'lloricosalalima.tua@bicol-u.edu.ph', '$2y$10$.bmBfiNzaizlYZzLVRGY2O3zGlxtl8hhA43NBxJKaDMhA/jmIJVci', 'luffyWano.png.jpg', '::1', 'Busay Ligao City', '09935381322');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_table`
--
ALTER TABLE `admin_table`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `cart_details`
--
ALTER TABLE `cart_details`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `orders_pending`
--
ALTER TABLE `orders_pending`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `user_orders`
--
ALTER TABLE `user_orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `user_payments`
--
ALTER TABLE `user_payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `user_table`
--
ALTER TABLE `user_table`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_table`
--
ALTER TABLE `admin_table`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `orders_pending`
--
ALTER TABLE `orders_pending`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `user_orders`
--
ALTER TABLE `user_orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_payments`
--
ALTER TABLE `user_payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_table`
--
ALTER TABLE `user_table`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
