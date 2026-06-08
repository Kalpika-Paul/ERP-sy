-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 27, 2026 at 03:18 PM
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
-- Database: `emportal`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `phone`, `address`, `created_at`, `updated_at`) VALUES
(1, 'dffs', '3425663', 'ecxercf te ge ertg', '2026-04-26 07:24:39', '2026-04-26 07:24:39'),
(2, 'dfsg', '4537', 'dgdvvg', '2026-04-26 07:27:01', '2026-04-26 07:27:01');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2026_03_01_063656_create_products_table', 1),
(6, '2026_03_02_045906_create_purchases_table', 1),
(7, '2026_03_07_085828_create_customers_table', 1),
(8, '2026_03_10_112458_create_sales_table', 1),
(9, '2026_03_10_112610_create_sales_items_table', 1),
(10, '2026_03_24_071744_create_stock_manages_table', 1),
(11, '2026_04_01_062747_create_jobs_table', 1),
(12, '2026_04_07_082907_create_purchase_returns_table', 1),
(13, '2026_04_09_075318_add_return_price_to_purchase_returns_table', 1),
(14, '2026_04_11_124236_create_sales_returns_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 2, 'auth_token', '52be61df413c7b29d1c4f7035e329b6dfed655190777a5eaa6c66eb97b4c9d91', '[\"*\"]', '2026-04-26 07:27:44', NULL, '2026-04-26 07:20:36', '2026-04-26 07:27:44');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `brand` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `brand`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Google Pixel 8A', 'Google', 'product-images/5H9cYiuFqSDtqdf3Nju5.webp', '2026-04-26 07:22:13', '2026-04-26 07:22:13'),
(2, 'Ipad pro 11 m4', 'Apple', 'product-images/x3I372LZH7Y8ADgKCEMM.jpg', '2026-04-26 07:22:37', '2026-04-26 07:22:37');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `barcode` varchar(255) NOT NULL,
  `brand` varchar(255) NOT NULL,
  `model` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `color` varchar(255) NOT NULL,
  `variant` varchar(255) NOT NULL,
  `battery_health` varchar(255) NOT NULL,
  `branch` varchar(255) NOT NULL,
  `memo` varchar(255) NOT NULL,
  `month` varchar(255) NOT NULL,
  `supplier_name` varchar(255) NOT NULL,
  `contact_number` varchar(255) NOT NULL,
  `nid_number` varchar(255) NOT NULL,
  `condition` varchar(255) DEFAULT NULL,
  `ram` varchar(255) DEFAULT NULL,
  `rom` varchar(255) DEFAULT NULL,
  `box` varchar(255) DEFAULT NULL,
  `imei` varchar(255) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `available_stock` int(11) NOT NULL DEFAULT 0,
  `salesPrice` decimal(10,2) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `nid_image` varchar(255) NOT NULL,
  `memo_image` varchar(255) DEFAULT NULL,
  `prepared_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `product_id`, `barcode`, `brand`, `model`, `price`, `color`, `variant`, `battery_health`, `branch`, `memo`, `month`, `supplier_name`, `contact_number`, `nid_number`, `condition`, `ram`, `rom`, `box`, `imei`, `quantity`, `available_stock`, `salesPrice`, `status`, `nid_image`, `memo_image`, `prepared_by`, `created_at`, `updated_at`) VALUES
(1, 1, '20260901', 'Google', NULL, 128.00, 'Phantom Green', 'China', '90', 'WareHouse', '82', '1983-02-11', 'Whitney Shaffer', '307', '496', 'New', '2GB', '512GB', 'Yes', '987665465', 1, 0, 60000.00, 'approved', 'purchases/NID/Mf8yss0f8hLBtcOxkdMQ.png', 'purchases/Memo/qvVM2k5TuyOKiFz3IDr5.png', 2, '2026-04-26 07:23:16', '2026-04-26 07:27:01');

-- --------------------------------------------------------

--
-- Table structure for table `purchase_returns`
--

CREATE TABLE `purchase_returns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_id` bigint(20) UNSIGNED DEFAULT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `barcode` varchar(255) NOT NULL,
  `brand` varchar(255) NOT NULL,
  `model` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `return_price` decimal(10,2) DEFAULT NULL,
  `color` varchar(255) NOT NULL,
  `variant` varchar(255) NOT NULL,
  `battery_health` varchar(255) NOT NULL,
  `branch` varchar(255) NOT NULL,
  `memo` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `supplier_name` varchar(255) NOT NULL,
  `contact_number` varchar(255) NOT NULL,
  `nid_number` varchar(255) NOT NULL,
  `condition` varchar(255) NOT NULL,
  `ram` varchar(255) NOT NULL,
  `rom` varchar(255) NOT NULL,
  `box` varchar(255) NOT NULL,
  `imei` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `available_stock` int(11) NOT NULL DEFAULT 0,
  `salesPrice` decimal(10,2) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `nid_image` varchar(255) NOT NULL,
  `memo_image` varchar(255) DEFAULT NULL,
  `note` text DEFAULT NULL,
  `prepared_by` bigint(20) UNSIGNED NOT NULL,
  `returned_by` bigint(20) UNSIGNED DEFAULT NULL,
  `returned_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `prepared_by` bigint(20) UNSIGNED NOT NULL,
  `sub_total` decimal(10,2) NOT NULL,
  `grand_total` decimal(10,2) NOT NULL,
  `discount` decimal(8,2) DEFAULT NULL,
  `payment_method` varchar(255) NOT NULL,
  `account` varchar(255) DEFAULT NULL,
  `current_stock` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`current_stock`)),
  `invoice_code` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `customer_id`, `prepared_by`, `sub_total`, `grand_total`, `discount`, `payment_method`, `account`, `current_stock`, `invoice_code`, `date`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 60000.00, 60000.00, 0.00, 'Cash', NULL, '{\"1\":0}', '200401', '2026-04-26', '2026-04-26 07:24:39', '2026-04-26 07:24:39'),
(2, 2, 2, 60000.00, 55000.00, 5000.00, 'Cash', NULL, '{\"1\":0}', '200402', '2026-04-26', '2026-04-26 07:27:01', '2026-04-26 07:27:01');

-- --------------------------------------------------------

--
-- Table structure for table `sales_items`
--

CREATE TABLE `sales_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_id` bigint(20) UNSIGNED NOT NULL,
  `purchase_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `brand` varchar(255) NOT NULL,
  `model` varchar(255) DEFAULT NULL,
  `variant` varchar(255) DEFAULT NULL,
  `ram` varchar(255) DEFAULT NULL,
  `rom` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `imei` varchar(255) DEFAULT NULL,
  `battery_health` varchar(255) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `custom_price` decimal(10,2) DEFAULT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'sold',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales_items`
--

INSERT INTO `sales_items` (`id`, `sale_id`, `purchase_id`, `product_id`, `brand`, `model`, `variant`, `ram`, `rom`, `color`, `imei`, `battery_health`, `quantity`, `price`, `custom_price`, `subtotal`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 'Google', 'Google Pixel 8A', 'China', '2GB', '512GB', 'Phantom Green', '987665465', '90', 1, 60000.00, NULL, 60000.00, 'returned', '2026-04-26 07:24:39', '2026-04-26 07:26:20'),
(2, 2, 1, 1, 'Google', 'Google Pixel 8A', 'China', '2GB', '512GB', 'Phantom Green', '987665465', '90', 1, 60000.00, NULL, 60000.00, 'sold', '2026-04-26 07:27:01', '2026-04-26 07:27:01');

-- --------------------------------------------------------

--
-- Table structure for table `sales_returns`
--

CREATE TABLE `sales_returns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `purchase_id` bigint(20) UNSIGNED DEFAULT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `brand` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  `variant` varchar(255) DEFAULT NULL,
  `battery_health` varchar(255) DEFAULT NULL,
  `condition` varchar(255) DEFAULT NULL,
  `ram` varchar(255) DEFAULT NULL,
  `rom` varchar(255) DEFAULT NULL,
  `box` varchar(255) DEFAULT NULL,
  `imei` varchar(255) DEFAULT NULL,
  `branch` varchar(255) DEFAULT NULL,
  `customer_phone` varchar(255) DEFAULT NULL,
  `grand_total` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `available_stock` int(11) DEFAULT NULL,
  `buy_date` date NOT NULL,
  `note` text DEFAULT NULL,
  `prepared_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales_returns`
--

INSERT INTO `sales_returns` (`id`, `sale_id`, `product_id`, `purchase_id`, `customer_id`, `brand`, `color`, `variant`, `battery_health`, `condition`, `ram`, `rom`, `box`, `imei`, `branch`, `customer_phone`, `grand_total`, `quantity`, `available_stock`, `buy_date`, `note`, `prepared_by`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 1, 'Google', 'Phantom Green', 'China', '90', NULL, '2GB', '512GB', NULL, '987665465', 'WareHouse', '3425663', 60000.00, 1, 0, '2026-04-26', 'defected', 2, '2026-04-26 07:26:20', '2026-04-26 07:26:20');

-- --------------------------------------------------------

--
-- Table structure for table `stock_manages`
--

CREATE TABLE `stock_manages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_id` bigint(20) UNSIGNED NOT NULL,
  `from_branch` varchar(255) NOT NULL,
  `to_branch` varchar(255) NOT NULL,
  `quantity` int(11) NOT NULL,
  `transfer_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('user','admin','Sales Person') NOT NULL DEFAULT 'user',
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `branch` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `auth_type` varchar(255) DEFAULT NULL,
  `auth_id` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `phone_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `type`, `name`, `phone`, `branch`, `email`, `password`, `auth_type`, `auth_id`, `is_active`, `email_verified_at`, `phone_verified_at`, `remember_token`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'admin', 'Emran', '017XXXXXXXX', 'EM Center', 'admin@easternmobile.com', '$2y$12$ufV7hpNkZ4KVBWxwJ4T9V.fy4H41ybgfo3OVoLazT5ZNIJHxW5/VK', NULL, NULL, 1, '2026-04-26 06:46:14', NULL, NULL, '2026-04-26 06:46:14', '2026-04-26 06:46:14', NULL),
(2, 'admin', 'Jhini', '017XXXXXXXX', 'EM Center', 'adminm@easternmobile.com', '$2y$12$1RDY/E98vZQ0SN5sdy92zO4S7ACaazqOlWTNXKWTaJXk8OPMQGbiy', NULL, NULL, 1, '2026-04-26 06:46:14', NULL, NULL, '2026-04-26 06:46:14', '2026-04-26 06:46:14', NULL),
(3, 'admin', 'Abir', '017XXXXXXXX', 'EM Center', 'admind@easternmobile.com', '$2y$12$bMDjvtU6bc8TSjSFONYFse/SlQLTIwEa1jN3MZRs0A02if8RBxPSW', NULL, NULL, 1, '2026-04-26 06:46:14', NULL, NULL, '2026-04-26 06:46:14', '2026-04-26 06:46:14', NULL),
(4, 'admin', 'Nur Mohammad', '018XXXXXXXX', 'Jamuna Future Park', 'jfp01#sales@easternmobile.com', '$2y$12$113PLTw6j7vzu3tF57u9AObAmR7I4KLSYbvm9iJk7/gQfcJf9mtom', NULL, NULL, 1, '2026-04-26 06:46:15', NULL, NULL, '2026-04-26 06:46:15', '2026-04-26 06:46:15', NULL),
(5, 'Sales Person', 'Ahsan', '018XXXXXXXX', 'Jamuna Future Park', 'jfp02#sales@easternmobile.com', '$2y$12$Z88rrDNUIwiNY32BX.WbQeCUBT.4SzhG3fVn7grjlaZ6VlTP2xAGa', NULL, NULL, 1, '2026-04-26 06:46:15', NULL, NULL, '2026-04-26 06:46:15', '2026-04-26 06:46:15', NULL),
(6, 'Sales Person', 'Joy', '018XXXXXXXX', 'Bashundhara City Shopping Complex', 'bdcl01sales@easternmobile.com', '$2y$12$PWB4VW46KAycRvSDXo.tQO1.88.rhwRl46jggASfAiZLaHF0C7l4i', NULL, NULL, 1, '2026-04-26 06:46:15', NULL, NULL, '2026-04-26 06:46:15', '2026-04-26 06:46:15', NULL),
(7, 'Sales Person', 'Pappu', '018XXXXXXXX', 'Jamuna Future Park', 'bdcl02sales@easternmobile.com', '$2y$12$wlxrBvhbDpGAewRi/IpdaeyE.BuUCJfYXdkAGKJpR/QlW.xgnW1De', NULL, NULL, 1, '2026-04-26 06:46:16', NULL, NULL, '2026-04-26 06:46:16', '2026-04-26 06:46:16', NULL),
(8, 'Sales Person', 'Tanjid', '018XXXXXXXX', 'Eastern Plaza', 'ep01sales@easternmobile.com', '$2y$12$wC6EGpgQOhmDq.w.uK7s4Omx/Se6eMYDx54A6pxVGCeIXoyO71gsm', NULL, NULL, 1, '2026-04-26 06:46:16', NULL, NULL, '2026-04-26 06:46:16', '2026-04-26 06:46:16', NULL),
(9, 'Sales Person', 'Fida', '018XXXXXXXX', 'Eastern Plaza', 'ep02sales@easternmobile.com', '$2y$12$MzfGLUCMhisYRkqMJd8idu10epBmWil6ItogvtzRl36km5xBV.luW', NULL, NULL, 1, '2026-04-26 06:46:16', NULL, NULL, '2026-04-26 06:46:16', '2026-04-26 06:46:16', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchases_product_id_foreign` (`product_id`),
  ADD KEY `purchases_prepared_by_foreign` (`prepared_by`);

--
-- Indexes for table `purchase_returns`
--
ALTER TABLE `purchase_returns`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_returns_purchase_id_foreign` (`purchase_id`),
  ADD KEY `purchase_returns_product_id_foreign` (`product_id`),
  ADD KEY `purchase_returns_prepared_by_foreign` (`prepared_by`),
  ADD KEY `purchase_returns_returned_by_foreign` (`returned_by`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sales_invoice_code_unique` (`invoice_code`),
  ADD KEY `sales_customer_id_foreign` (`customer_id`),
  ADD KEY `sales_prepared_by_foreign` (`prepared_by`);

--
-- Indexes for table `sales_items`
--
ALTER TABLE `sales_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_items_sale_id_foreign` (`sale_id`),
  ADD KEY `sales_items_purchase_id_foreign` (`purchase_id`),
  ADD KEY `sales_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `sales_returns`
--
ALTER TABLE `sales_returns`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sales_returns_imei_unique` (`imei`),
  ADD KEY `sales_returns_prepared_by_foreign` (`prepared_by`),
  ADD KEY `sales_returns_sale_id_index` (`sale_id`),
  ADD KEY `sales_returns_product_id_index` (`product_id`),
  ADD KEY `sales_returns_purchase_id_index` (`purchase_id`),
  ADD KEY `sales_returns_customer_id_index` (`customer_id`);

--
-- Indexes for table `stock_manages`
--
ALTER TABLE `stock_manages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_manages_purchase_id_foreign` (`purchase_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `purchase_returns`
--
ALTER TABLE `purchase_returns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sales_items`
--
ALTER TABLE `sales_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sales_returns`
--
ALTER TABLE `sales_returns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `stock_manages`
--
ALTER TABLE `stock_manages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `purchases_prepared_by_foreign` FOREIGN KEY (`prepared_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchases_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_returns`
--
ALTER TABLE `purchase_returns`
  ADD CONSTRAINT `purchase_returns_prepared_by_foreign` FOREIGN KEY (`prepared_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_returns_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_returns_purchase_id_foreign` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `purchase_returns_returned_by_foreign` FOREIGN KEY (`returned_by`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sales_prepared_by_foreign` FOREIGN KEY (`prepared_by`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sales_items`
--
ALTER TABLE `sales_items`
  ADD CONSTRAINT `sales_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sales_items_purchase_id_foreign` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sales_items_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sales_returns`
--
ALTER TABLE `sales_returns`
  ADD CONSTRAINT `sales_returns_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sales_returns_prepared_by_foreign` FOREIGN KEY (`prepared_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sales_returns_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sales_returns_purchase_id_foreign` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `sales_returns_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stock_manages`
--
ALTER TABLE `stock_manages`
  ADD CONSTRAINT `stock_manages_purchase_id_foreign` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
