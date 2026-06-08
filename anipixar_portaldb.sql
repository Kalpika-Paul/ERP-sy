-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 02, 2026 at 02:43 PM
-- Server version: 11.4.10-MariaDB
-- PHP Version: 8.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `anipixar_portaldb`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `address` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `phone`, `address`, `created_at`, `updated_at`) VALUES
(1, 'j', '9786543', 'dhaka', '2026-03-16 02:59:23', '2026-03-16 02:59:23'),
(2, 'Emran', '01983648435', 'Dhaka', '2026-03-16 03:30:09', '2026-03-16 03:30:09'),
(3, 'j', '09858935496', 'dhaka', '2026-03-16 03:49:46', '2026-03-16 03:49:46'),
(4, 'Emran', '01937359343', 'Dhaka', '2026-03-16 03:50:34', '2026-03-16 03:50:34'),
(5, 'Khan', '01993825492', 'Dhaka', '2026-03-16 04:47:19', '2026-03-16 04:47:19'),
(6, 'joy', '01607668882', 'keraniganj', '2026-03-16 05:54:01', '2026-03-16 05:54:01'),
(7, 'sogor', '01835653338', 'DHAKA', '2026-03-16 07:52:25', '2026-03-16 07:52:25'),
(8, 'RONI', '01311916445', 'Dhaka', '2026-03-16 08:01:21', '2026-03-16 08:01:21'),
(9, 'Romjan prodhan', '01875262729', NULL, '2026-03-17 04:19:53', '2026-03-17 04:19:53'),
(10, 'Nafiza', '675768565867', 'gfdsg', '2026-04-04 05:31:05', '2026-04-04 05:31:05'),
(11, 'dfg', '65865', 'jhft', '2026-04-04 05:34:38', '2026-04-04 05:34:38'),
(12, 'Hanif', '5445533', 'Gulisthan', '2026-04-04 05:40:17', '2026-04-04 05:40:17'),
(13, 'customer', '765462', 'Kathal bagan', '2026-04-04 05:42:52', '2026-04-04 05:42:52'),
(14, 'fytft', '68689687', NULL, '2026-04-04 05:48:48', '2026-04-04 05:48:48'),
(15, 'uriuqweyrp', '349823857234', NULL, '2026-04-04 05:53:14', '2026-04-04 05:53:14'),
(16, 'kjbnvkj', '435234243423', NULL, '2026-04-04 05:54:22', '2026-04-04 05:54:22'),
(17, 'v fvgv', '34543543554', NULL, '2026-04-04 05:55:34', '2026-04-04 05:55:34'),
(18, 'dfgds', '4353433', NULL, '2026-04-04 05:57:10', '2026-04-04 05:57:10'),
(19, 'sblhiads', '58734098572340', NULL, '2026-04-06 00:42:25', '2026-04-06 00:42:25'),
(20, 'cmxvnldjsk', '4438723908', NULL, '2026-04-06 00:45:38', '2026-04-06 00:45:38'),
(21, 'dasljhbdjsl', '489057389204758', NULL, '2026-04-06 00:46:58', '2026-04-06 00:46:58'),
(22, 'Company', '0174594296', NULL, '2026-04-06 00:52:44', '2026-04-06 00:52:44'),
(23, 'dfiadslj', '3489370842', NULL, '2026-04-06 01:01:56', '2026-04-06 01:01:56'),
(24, 'sdhfash', '328947328434', NULL, '2026-04-06 01:04:25', '2026-04-06 01:04:25'),
(25, 'ayman', '2938129387912', 'lalbag', '2026-04-06 01:27:29', '2026-04-06 01:27:29'),
(26, 'tanjid', '01745284296', NULL, '2026-04-09 00:14:53', '2026-04-09 00:14:53'),
(27, 'jani na', '0171542352432', NULL, '2026-04-09 00:22:39', '2026-04-09 00:22:39'),
(28, 'coustomar', '014481274981', NULL, '2026-04-09 00:24:31', '2026-04-09 00:24:31'),
(29, 'gg', '0178391237893', NULL, '2026-04-18 00:27:11', '2026-04-18 00:27:11'),
(30, 'sumon', '01681339881', NULL, '2026-04-18 00:32:16', '2026-04-18 00:32:16'),
(31, 'customer', '0100000000', NULL, '2026-04-18 00:37:57', '2026-04-18 00:37:57'),
(32, 'mahmud', '017000000', NULL, '2026-04-18 00:50:15', '2026-04-18 00:50:15'),
(33, 'dog', '017700000', NULL, '2026-04-18 00:52:20', '2026-04-18 00:52:20'),
(34, 'gfg', '5467543245643', NULL, '2026-04-21 23:40:39', '2026-04-21 23:40:39');

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
(15, '2014_10_12_000000_create_users_table', 1),
(16, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(17, '2019_08_19_000000_create_failed_jobs_table', 1),
(18, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(19, '2026_03_01_063656_create_products_table', 1),
(20, '2026_03_02_045906_create_purchases_table', 1),
(21, '2026_03_07_085828_create_customers_table', 1);

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
(135, 'App\\Models\\User', 8, 'auth_token', '008ea1aec05c949f9279e1de81f1475b96f7eb6b586830a88f634460e4d17488', '[\"*\"]', '2026-04-28 06:29:15', NULL, '2026-03-17 04:15:18', '2026-04-28 06:29:15'),
(144, 'App\\Models\\User', 5, 'auth_token', 'f6bb7a4a1282e96bfc7bb90f7c80506cf4adab7104e14d28315330841d23e4aa', '[\"*\"]', '2026-04-03 05:36:42', NULL, '2026-03-28 06:27:08', '2026-04-03 05:36:42'),
(169, 'App\\Models\\User', 5, 'auth_token', 'cb8c6035a8312d83f97c6583b7d2112d08fc76a716593d97b4699b250e1637b8', '[\"*\"]', '2026-04-09 01:03:17', NULL, '2026-04-04 04:50:17', '2026-04-09 01:03:17'),
(209, 'App\\Models\\User', 5, 'auth_token', '8c5c8c1b8545f079e75450666292e8869460cced543ac58df46fa6304d8c3589', '[\"*\"]', '2026-04-29 22:00:46', NULL, '2026-04-26 00:55:42', '2026-04-29 22:00:46');

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
(2, 'iPhone 7G', 'Apple', 'product-images/KQsbgHnQWoTopHEcW73H.jpg', '2026-03-07 08:58:06', '2026-03-08 23:50:17'),
(4, 'iPhone 8G', 'Apple', 'product-images/cR9V5zeIFlm55UORCxKB.webp', '2026-03-07 08:59:58', '2026-04-06 01:57:20'),
(5, 'iPhone 8 Plus', 'Apple', 'product-images/pW7A1IOHuS0hl7apfVCM.webp', '2026-03-07 09:01:23', '2026-04-06 01:56:45'),
(6, 'iPhone X', 'Apple', 'product-images/EYyskOHvLPfaiFEJJbIf.webp', '2026-03-07 09:02:00', '2026-04-06 01:56:18'),
(7, 'iPhone XS', 'Apple', 'product-images/tnM2WqiQksS7DoV2JEEe.jpg', '2026-03-07 09:02:37', '2026-04-06 01:55:40'),
(8, 'iPhone XS Max', 'Apple', 'product-images/g7298WpkeVmJvL2PHxym.webp', '2026-03-07 09:03:56', '2026-04-06 01:55:10'),
(9, 'iPhone SE 2020', 'Apple', 'product-images/qbj8AZTIZds3Z9itDMR4.jpg', '2026-03-07 09:04:43', '2026-04-06 01:54:25'),
(10, 'iPhone XR', 'Apple', 'product-images/btg0bN9NW71npf9zDizR.webp', '2026-03-07 09:07:37', '2026-04-06 01:53:49'),
(11, 'iPhone 11', 'Apple', 'product-images/eHLQWcNziK7sTVouCUWT.jpg', '2026-03-07 09:08:44', '2026-04-06 01:53:23'),
(12, 'iPhone 11 pro', 'Apple', 'product-images/Olz0DwaNmhlJ2PS0kjWG.webp', '2026-03-07 09:09:30', '2026-04-06 01:52:37'),
(13, 'iPhone 11 Pro Max', 'Apple', 'product-images/ybLJS5N208d7YAI5sHuT.webp', '2026-03-07 09:10:22', '2026-04-06 01:52:10'),
(14, 'iPhone 12', 'Apple', 'product-images/LnPPbb74INe8qAaFuxmo.webp', '2026-03-07 09:10:49', '2026-04-06 01:51:31'),
(15, 'iPhone 12 Pro', 'Apple', 'product-images/BHUHLfRS2jLNMobVBbYm.webp', '2026-03-07 09:11:23', '2026-04-06 01:51:06'),
(16, 'iPhone 12 Pro Max', 'Apple', 'product-images/ghKJxWPWBmCuzhQe3cH8.webp', '2026-03-07 09:12:11', '2026-04-06 01:50:40'),
(17, 'iPhone 13', 'Apple', 'product-images/0PuQhC8gdbCfEqWLBsNl.jpg', '2026-03-07 09:12:49', '2026-04-06 01:49:58'),
(18, 'iPhone 12 Mini', 'Apple', 'product-images/UXcQF4LCQp4ffWA5odAI.jpg', '2026-03-07 09:13:46', '2026-04-06 01:49:16'),
(19, 'iPhone 13 MIni', 'Apple', 'product-images/ikGysIIYndp56SmoIn93.jpg', '2026-03-07 09:14:10', '2026-04-06 01:48:46'),
(20, 'iPhone 13 Pro', 'Apple', 'product-images/Gdafz2U1Eur8q5N0uZwd.webp', '2026-03-07 09:14:30', '2026-04-06 01:48:16'),
(21, 'iPhone 13 Pro Max', 'Apple', 'product-images/PNszWUkEg6w6P6TXExgK.webp', '2026-03-07 09:15:34', '2026-03-10 03:10:29'),
(22, 'iPhone 14', 'Apple', 'product-images/7EkAbxuHeRyUmGoflZTa.jpg', '2026-03-07 09:22:13', '2026-04-06 01:47:43'),
(23, 'iPhone 14 Plus', 'Apple', 'product-images/oZOevORPbxvCkhFhIGHD.jpg', '2026-03-07 09:23:02', '2026-04-06 01:03:02'),
(24, 'iPhone 14 Pro', 'Apple', 'product-images/HLuB0PxTdBKrwuBRTWuE.webp', '2026-03-07 09:23:33', '2026-04-06 01:02:15'),
(25, 'iPhone 14 Pro Max', 'Apple', 'product-images/eaFpGd5NkIsHnQkpnSCc.jpg', '2026-03-07 09:24:22', '2026-04-06 01:00:32'),
(26, 'iPhone 15', 'Apple', 'product-images/vj5zCGIucR7V1WszjiJu.webp', '2026-03-07 09:25:35', '2026-04-06 00:59:24'),
(27, 'iPhone 15', 'Apple', 'product-images/HcaTvPLvR2XsMsRXHBeW.webp', '2026-03-07 09:25:35', '2026-04-06 00:59:05'),
(28, 'iPhone 15 Plus', 'Apple', 'product-images/dqFaKYICdTgSQ2IZIIaV.jpg', '2026-03-07 09:26:06', '2026-04-06 00:58:03'),
(29, 'iPhone 15 Pro', 'Apple', 'product-images/J4So8tNU3EZc74QPD8Ch.jpg', '2026-03-07 09:27:05', '2026-03-10 03:11:23'),
(30, 'iPhone 15 Pro Max', 'Apple', 'product-images/qK2BclKrAaWXpuHHpOAK.webp', '2026-03-07 09:28:16', '2026-04-06 00:57:09'),
(31, 'iPhone 16', 'Apple', 'product-images/GgF4ukUIIQSz6WSUnDcH.png', '2026-03-07 09:29:20', '2026-04-06 00:56:39'),
(32, 'iPhone 16 Plus', 'Apple', 'product-images/JtBMgnJpPGWNHcncqyLH.webp', '2026-03-07 09:29:42', '2026-04-06 00:56:12'),
(33, 'iPhone 16 Pro', 'Apple', 'product-images/veJQu0DxEYmEn7bfBmp5.png', '2026-03-07 09:32:03', '2026-04-06 00:55:40'),
(34, 'iPhone 16 Pro', 'Apple', 'product-images/GxhHrl9PzA9qMAzB5hDg.png', '2026-03-07 09:36:43', '2026-04-06 00:55:20'),
(35, 'iPhone 16 Pro Max', 'Apple', 'product-images/hU4oJrGO1afrzXoUxXti.png', '2026-03-07 09:37:33', '2026-04-06 00:54:42'),
(36, 'iPhone 16e', 'Apple', 'product-images/eIZSPBU9NVznWbnzTKSC.webp', '2026-03-07 09:38:32', '2026-04-06 00:53:16'),
(37, 'iPhone 17', 'Apple', 'product-images/X91Bs1Wksl466eKkqhMO.jpg', '2026-03-07 09:39:06', '2026-04-06 00:52:32'),
(38, 'iPhone 17 Air', 'Apple', 'product-images/L5eGxVTSsHTlTNEQmufM.webp', '2026-03-07 09:41:51', '2026-04-06 00:52:06'),
(39, 'iPhone 17 Pro', 'Apple', 'product-images/dfk2vl8GY1kafx608lFI.webp', '2026-03-07 09:43:22', '2026-03-10 03:12:59'),
(40, 'iPhone 17 Pro Max', 'Apple', 'product-images/DJqRcqtoR1qaXXN4nznf.webp', '2026-03-07 09:44:12', '2026-04-06 00:51:23'),
(47, 'Samsung Galaxy S24 Ultra', 'Samsung', 'product-images/xwM2O2pZnLwJWmEE6S2t.webp', '2026-03-08 23:40:56', '2026-03-08 23:40:56'),
(48, 'pixel 5', 'Google', 'product-images/GaJWX6FUefXHnxXnFdKZ.webp', '2026-03-11 03:03:40', '2026-04-06 00:50:28'),
(49, 'pixel 5A', 'Google Pixel', 'product-images/HRw7CqdpnN0LKs7HapyZ.webp', '2026-03-11 03:04:21', '2026-03-11 03:04:21'),
(50, 'Pixel 6', 'Google', 'product-images/1QI6xEN7cn3CrtFyQsYR.jpg', '2026-03-11 03:05:02', '2026-04-06 00:48:56'),
(51, 'Pixel 6A', 'Google Pixel', 'product-images/jLFP8YlmXmqgO9UWYyeW.webp', '2026-03-11 03:05:29', '2026-03-11 03:05:29'),
(52, 'Pixel 6 Pro', 'Google', 'product-images/NHswToTpVYbasuK4Mwtv.webp', '2026-03-11 03:08:32', '2026-04-06 00:48:07'),
(53, 'Pixel 7', 'Google Pixel', 'product-images/RjSbMenSawqM0Fm3fIie.webp', '2026-03-11 03:09:22', '2026-03-11 03:09:22'),
(54, 'Pixel 7 Pro', 'Google', 'product-images/lnMeN0BEQXAtKed2QqVo.jpg', '2026-03-11 03:10:56', '2026-04-06 00:47:22'),
(55, 'pixel 7A', 'Google Pixel', 'product-images/9h8vQjhD3kpxunhpSGui.webp', '2026-03-11 03:11:53', '2026-03-11 03:11:53'),
(56, 'Pixel 8', 'Google', 'product-images/gmg2Wuqhwh51DwFhkLMS.jpg', '2026-03-11 03:12:20', '2026-04-06 00:45:52'),
(57, 'Pixel 8 Pro', 'Google Pixel', 'product-images/d1ylSGYSVTN1TtfcXMRU.webp', '2026-03-11 03:22:00', '2026-03-11 03:22:00'),
(58, 'Pixel 8A', 'Google Pixel', 'product-images/D8epMaLvIMFMia0i4qzr.webp', '2026-03-11 03:25:19', '2026-03-11 03:25:19'),
(59, 'Samsung S20 5G', 'Samsung', 'product-images/UNQTPxQ0nJlOEZM9gurL.jpeg', '2026-03-11 07:12:52', '2026-04-06 00:44:28'),
(60, 'Samsung S21 Plus', 'Samsung', 'product-images/U2n72AI8F0eJFGIipc92.webp', '2026-03-11 07:14:30', '2026-03-11 07:14:30'),
(61, 'S26 Ultra', 'Samsung', 'product-images/UphbPKA3MTnpibRTLzPB.jpg', '2026-03-16 03:34:55', '2026-03-16 03:34:55'),
(62, 'S26+', 'Samsung', 'product-images/gu8y6TsTt6q47PKsuEcy.webp', '2026-03-16 03:36:15', '2026-03-16 03:36:15'),
(63, 'Galaxy S26', 'Samsung', 'product-images/gegffRWhLyYkUbnj3phJ.jpg', '2026-03-16 03:42:53', '2026-03-16 03:42:53'),
(64, 'Galaxy S25 FE', 'Samsung', 'product-images/ED4VLHDYHAMGeFgowk2A.png', '2026-03-16 03:43:36', '2026-03-16 03:43:36'),
(65, 'GALAXY S25 Edge', 'Samsung', 'product-images/BNoCkpUIU1gf6ejNs7He.webp', '2026-03-16 03:44:43', '2026-03-16 03:44:43'),
(66, 'Galaxy S25 Ultra', 'Samsung', 'product-images/XdJIJVFh6q6UMI9aN03k.jpg', '2026-03-16 03:46:03', '2026-03-16 03:46:03'),
(67, 'Galaxy S25+', 'Samsung', 'product-images/9Pt74zoDkFBlZHcq7LTg.jpeg', '2026-03-16 03:47:11', '2026-03-16 03:47:11'),
(68, 'Galaxy S25', 'Samsung', 'product-images/qq9VFPkSdLv9hxNu4H3T.jpg', '2026-03-16 03:47:50', '2026-03-16 03:47:50'),
(69, 'Galaxy S24 FE', 'Samsung', 'product-images/tlwRxW9Do4JQ2g7Cpux1.jpg', '2026-03-16 03:48:39', '2026-03-16 03:48:39'),
(70, 'Galaxy S24 Ultra', 'Samsung', 'product-images/Xkfazs7N2QQdBqWQk2g7.jpg', '2026-03-16 03:49:21', '2026-03-16 03:49:21'),
(71, 'Galaxy S24+', 'Samsung', 'product-images/yqpJcivQucaRCTQzesbb.jfif', '2026-03-16 03:50:31', '2026-03-16 03:50:31'),
(72, 'Galaxy S24', 'Samsung', 'product-images/2oiveKi2E18zni334yrh.jfif', '2026-03-16 03:55:02', '2026-03-16 03:55:02'),
(73, 'Galaxy S23 FE', 'Samsung', 'product-images/RoM3dR9N2xwu7q1DXfjZ.jfif', '2026-03-16 03:59:42', '2026-03-16 03:59:42'),
(74, 'Galaxy S23 Ultra', 'Samsung', 'product-images/DqhYPkfmOOeXG5i2hs7Q.jpg', '2026-03-16 04:00:49', '2026-03-16 04:00:49'),
(75, 'Galaxy S23+', 'Samsung', 'product-images/BYkn5FDvVd75JhZNiAyX.jfif', '2026-03-16 04:03:06', '2026-03-16 04:03:06'),
(76, 'Galaxy S23', 'Samsung', 'product-images/iqk0f6GOSUkOtzAWEPSo.jpg', '2026-03-16 04:04:48', '2026-03-16 04:04:48'),
(77, 'Galaxy S22 FE', 'Samsung', 'product-images/wArEzj9eorFXZ0v1G21E.jfif', '2026-03-16 04:10:18', '2026-03-16 04:10:18'),
(78, 'Galaxy S22 Ultra', 'Samsung', 'product-images/MlNRTvTWllYmABxFVzyf.jpg', '2026-03-16 04:11:58', '2026-03-16 04:11:58'),
(79, 'Galaxy S22', 'Samsung', 'product-images/QEZQj2hlpGaDN2aKn0p4.webp', '2026-03-16 04:24:03', '2026-03-16 04:24:03'),
(80, 'Galaxy S21 FE', 'Samsung', 'product-images/rTfDVjo4hK2qNQA7Uusm.jpg', '2026-03-16 04:46:25', '2026-03-16 04:46:25'),
(81, 'Motorola G96 5G', 'Motorola', 'product-images/yLgdskl6WuqfOXfnLl7P.png', '2026-03-16 07:54:39', '2026-03-16 07:54:39'),
(82, 'Galaxy Fold 4', 'Samsung', 'product-images/5ECsqeT92DyFMaAPM29i.jpg', '2026-03-17 00:09:08', '2026-03-17 00:09:08'),
(83, 'galaxy s22 plus', 'Samsung', 'product-images/7Ey1hccMswFpYe8Mprb4.jpg', '2026-03-17 00:17:18', '2026-03-17 00:17:18'),
(84, 'Galaxy S9 plus', 'Samsung', 'product-images/rE5TFjzZnOdq4LGLBY4O.jfif', '2026-03-17 00:36:52', '2026-03-17 00:36:52'),
(85, 'Galaxy Note 10 lite', 'Samsung', 'product-images/hgYevLXp0krlc12ZXGAr.jfif', '2026-03-17 00:45:41', '2026-03-17 00:45:41'),
(86, 'Narzo 50', 'Realme', 'product-images/58GjsC0XrKneC5NQ8BFC.png', '2026-03-17 00:50:09', '2026-03-17 00:50:09'),
(87, 'I pad 7th gen', 'Apple', 'product-images/XS2b3Bkva1AcO4FGNTRa.jpg', '2026-03-17 00:59:16', '2026-03-17 00:59:16'),
(88, 'Samsung A15', 'Samsung', 'product-images/704rOzGiIQ6tc16uFmGE.jpeg', '2026-04-01 05:33:12', '2026-04-01 05:33:12'),
(89, 'Samsung A13', 'Samsung', 'product-images/hYGM4g06EZZaKucWlQDh.webp', '2026-04-01 05:43:57', '2026-04-01 05:43:57'),
(90, '11 pro plus 5g', 'Redmi', 'product-images/eoHtrxfEoOpaL6makTBc.jfif', '2026-04-02 01:40:20', '2026-04-02 01:40:20'),
(91, 'Samsung F22', 'Samsung', 'product-images/iaeL6i4msd2ixGb2QWa0.png', '2026-04-06 00:53:23', '2026-04-06 01:01:15'),
(92, 'Samsung F13', 'Samsung', 'product-images/GrMIjB5hHtAI3ZZ22haV.jpeg', '2026-04-06 00:53:55', '2026-04-06 00:53:55'),
(93, 'Samsung Z flip 4', 'Samsung', 'product-images/GZlijy44Zy51lXxr1IAc.jpeg', '2026-04-06 01:40:47', '2026-04-06 01:40:47'),
(94, 'iPhone 7 plus', 'Apple', 'product-images/ATJ2FgJkzw28TflnnpMV.jpeg', '2026-04-06 04:14:17', '2026-04-06 04:14:17'),
(95, 'Samsung S10 Plus', 'Samsung', 'product-images/zlBUkFufYIpmYTJ7JCSs.jpeg', '2026-04-21 23:41:42', '2026-04-21 23:41:42');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `brand` varchar(255) NOT NULL,
  `model` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `variant` varchar(255) DEFAULT NULL,
  `battery_health` varchar(255) DEFAULT NULL,
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
  `available_stock` int(11) DEFAULT 0,
  `salesPrice` decimal(10,2) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `nid_image` varchar(255) NOT NULL,
  `memo_image` varchar(255) DEFAULT NULL,
  `prepared_by` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `product_id`, `barcode`, `brand`, `model`, `price`, `color`, `variant`, `battery_health`, `branch`, `memo`, `month`, `supplier_name`, `contact_number`, `nid_number`, `condition`, `ram`, `rom`, `box`, `imei`, `quantity`, `available_stock`, `salesPrice`, `status`, `nid_image`, `memo_image`, `prepared_by`, `created_at`, `updated_at`) VALUES
(43, 17, '20260902', 'Apple', NULL, 39500.00, 'White', 'India', '90', 'Bashundhara City', '8628', '2026-03-16', 'EM Center', '0173333333', '10000000001', 'Pre-Owned', '4GB', '128GB', 'Yes', '355160953062380', 1, 1, 42000.00, 'approved', 'purchases/NID/KvO8pRwH2bDuxm8MdRck.jpeg', 'purchases/Memo/yhj2HiJ5kqGtlMRd7ko0.jpeg', '1', '2026-03-16 05:57:09', '2026-03-16 05:57:46'),
(44, 20, '20260903', 'Apple', NULL, 52500.00, 'Graphite', 'Japan', '88', 'Bashundhara City', '0255', '2026-03-16', 'Company', '01780623881', '6019189692', 'Pre-Owned', '4GB', '256GB', 'No', '354980618151190', 1, 0, 55000.00, 'approved', 'purchases/NID/BmY0bokuYudqyS4XHUgz.jpg', 'purchases/Memo/1H7D9iFE1W4SzPREQr9K.jpg', '1', '2026-03-16 06:02:30', '2026-03-16 07:52:25'),
(45, 24, '20260904', 'Apple', NULL, 71500.00, 'Purple', 'Singapore', '91', 'Bashundhara City', '74584', '2026-03-16', 'EM Center', '0100000000', '10000000001', 'Pre-Owned', '6GB', '256GB', 'Yes', '350046781362990', 1, 1, 75000.00, 'approved', 'purchases/NID/W13wz8n8Bxmiomo30aUJ.jpeg', 'purchases/Memo/3OdYqQTmppu8pI3FDAOW.jpeg', '1', '2026-03-16 06:02:48', '2026-03-16 06:02:57'),
(46, 20, '20260905', 'Apple', NULL, 51000.00, 'Sky Blue', 'USA', '95', 'Bashundhara City', '8765', '2026-03-16', 'EM Center', '0100000000', '10000000001', 'Pre-Owned', '6GB', '128GB', 'No', '353501490815214', 1, 1, 54000.00, 'approved', 'purchases/NID/1G562jpkBWHlBzMeZyk9.jpeg', 'purchases/Memo/9mcqVVK903qi9gApSO9i.jpeg', '1', '2026-03-16 06:50:31', '2026-03-16 06:53:39'),
(47, 24, '20260906', 'Apple', NULL, 64000.00, 'Purple', 'Singapore', '88', 'Bashundhara City', '4674', '2026-03-16', 'EM Center', '0100000000', '10000000001', 'Pre-Owned', '6GB', '128GB', 'Yes', '354256831271911', 1, 1, 70000.00, 'approved', 'purchases/NID/Bx49JGfESeBchyWnArKM.jpeg', 'purchases/Memo/sydLXg0jGLd10fFHRbJp.jpeg', '1', '2026-03-16 06:53:03', '2026-03-16 06:54:03'),
(48, 22, '20260907', 'Apple', NULL, 45500.00, 'White', 'India', '90', 'Bashundhara City', '23678', '2026-03-16', 'EM Center', '0100000000', '1234567890123', 'Pre-Owned', '6GB', '128GB', 'Yes', '355308989738313', 1, 1, 50000.00, 'approved', 'purchases/NID/U2YzNq4gFYsCcvad0Bly.jpeg', 'purchases/Memo/BdS3JkHyiQDD7oCwFkzQ.jpeg', '1', '2026-03-16 06:55:57', '2026-03-16 07:01:45'),
(49, 31, '20260908', 'Apple', NULL, 72000.00, 'White', 'Australia', '91', 'Bashundhara City', '6538', '2026-03-16', 'EM Center', '0100000000', '10000000001', 'Pre-Owned', '6GB', '128GB', 'Yes', '351829314145688', 1, 1, 80000.00, 'approved', 'purchases/NID/BFN71GXgQubMs9taSmnC.jpeg', 'purchases/Memo/2rQV03eTH6o9renFoHdM.jpeg', '1', '2026-03-16 07:01:29', '2026-03-16 07:02:03'),
(50, 25, '20260909', 'Apple', NULL, 80000.00, 'Purple', 'Singapore', '91', 'Bashundhara City', '6969', '2026-03-16', 'EM Center', '0100000000', '10000000001', 'Pre-Owned', '8GB', '256GB', 'Yes', '356703853454444', 1, 1, 90000.00, 'approved', 'purchases/NID/wpQu7PXJmCrSExQo4A2l.jpeg', 'purchases/Memo/e6jKr8YqmuoAqbXKO5H6.jpeg', '1', '2026-03-16 07:03:46', '2026-03-16 07:04:10'),
(51, 31, '20260910', 'Apple', NULL, 70000.00, 'Blue', 'Australia', '100', 'Bashundhara City', '7864', '2026-03-16', 'EM Center', '0100000000', '10000000001', 'Pre-Owned', '6GB', '128GB', 'Yes', '356657552895267', 1, 1, 80000.00, 'approved', 'purchases/NID/fEKqjX99oGpBaSVipeSL.jpeg', 'purchases/Memo/qMZO1dP6p3CvG7KDLmUN.jpeg', '1', '2026-03-16 07:07:04', '2026-03-16 07:07:16'),
(52, 25, '20260911', 'Apple', NULL, 71000.00, 'Black', 'India', '81', 'Bashundhara City', '6831', '2026-03-16', 'EM Center', '0100000000', '10000000001', 'Pre-Owned', '6GB', '128GB', 'Yes', '358795287065836', 1, 1, 78000.00, 'approved', 'purchases/NID/mYCIRByXmwa21MzN2dWp.jpeg', 'purchases/Memo/0er14ezX5Bk5g8xZf4KR.jpeg', '1', '2026-03-16 07:09:55', '2026-03-16 07:10:24'),
(53, 16, '20260912', 'Apple', NULL, 50000.00, 'Black', 'Singapore', '87', 'Bashundhara City', '3574', '2026-03-16', 'EM Center', '0100000000', '10000000001', 'Pre-Owned', '6GB', '256GB', 'No', '356735114621932', 1, 1, 55000.00, 'approved', 'purchases/NID/XzgdFWCFAZXBWlUuk7v7.jpeg', 'purchases/Memo/fA2hteNVd5xWz6UydY90.jpeg', '1', '2026-03-16 07:13:10', '2026-03-16 07:14:01'),
(54, 16, '20260913', 'Apple', NULL, 43000.00, 'Green', 'Singapore', '88', 'Bashundhara City', '69478', '2026-03-16', 'EM Center', '0100000000', '10000000001', 'Pre-Owned', '6GB', '128GB', 'Yes', '354419337388601', 1, 1, 55000.00, 'approved', 'purchases/NID/KrhbNrs0KayhtVnjezuL.jpeg', 'purchases/Memo/5KzEY4LNQyhz6Pljjjz0.jpeg', '1', '2026-03-16 07:15:51', '2026-03-16 07:16:03'),
(55, 23, '20260914', 'Apple', NULL, 51000.00, 'Black', 'Japan', '84', 'Bashundhara City', '5795', '2026-03-16', 'EM Center', '0100000000', '10000000001', 'Pre-Owned', '6GB', '128GB', 'No', '351136716762973', 1, 1, 55000.00, 'approved', 'purchases/NID/XNox13nKQlwhns8QGaG2.jpeg', 'purchases/Memo/R8ypCsWj2H1kS2OtuEE1.jpeg', '1', '2026-03-16 07:17:59', '2026-03-16 07:18:09'),
(56, 17, '20260915', 'Apple', NULL, 39000.00, 'White', 'India', '84', 'Bashundhara City', '6383', '2026-03-16', 'EM Center', '0100000000', '10000000001', 'Pre-Owned', '6GB', '128GB', 'Yes', '359773711190834', 1, 1, 45000.00, 'approved', 'purchases/NID/5sDV8syBbQiEb3XAP8rF.jpeg', 'purchases/Memo/FK0ERIBXKKCbksv7byKy.jpeg', '1', '2026-03-16 07:21:43', '2026-03-16 07:22:06'),
(57, 20, '20260916', 'Apple', NULL, 52500.00, 'Gold', 'Japan', '88', 'Bashundhara City', '463289', '2026-03-16', 'EM Center', '0100000000', '10000000001', 'Pre-Owned', '6GB', '256GB', 'No', '356885196523058', 1, 1, 58000.00, 'approved', 'purchases/NID/JRHw30VQrzvpoLIzKKas.jpeg', 'purchases/Memo/ne0Cv6E1bu74j5Xu9MS5.jpeg', '1', '2026-03-16 07:45:54', '2026-03-16 07:46:08'),
(58, 17, '20260917', 'Apple', NULL, 38500.00, 'Phantom Pink', 'HongKong', '93', 'Bashundhara City', '12345', '2026-05-03', 'BASETO', '01607668882', '434325435435', 'Pre-Owned', '4GB', '128GB', 'No', '355628561512780', 1, 1, 45000.00, 'approved', 'purchases/NID/7QTwH7H3ARFSwjWaX7rl.jpg', 'purchases/Memo/YMzCoUXdnukE7ZQ1yjNB.jpg', '1', '2026-03-16 07:47:15', '2026-03-16 07:48:45'),
(61, 17, '20260920', 'Apple', NULL, 38500.00, 'Phantom Pink', 'HongKong', '92', 'Bashundhara City', '1254', '2026-05-03', 'BASETO', '01933682063', '434325435435', 'Pre-Owned', '4GB', '128GB', 'No', '359189532096292', 1, 1, 45000.00, 'approved', 'purchases/NID/jbcsljt9SqQAkqjmZe8q.jpg', 'purchases/Memo/Fv9Ks2Z0ZgdpULXe9ud7.jpg', '1', '2026-03-16 07:56:06', '2026-03-16 07:56:32'),
(62, 81, '20260921', 'Motorola', NULL, 23900.00, 'Green', 'India', '100', 'Bashundhara City', '213', '2026-03-16', 'bashundhara', '09090909', '988787987', 'New', '8GB', '128GB', 'Yes', '354080685909073', 1, 0, 25000.00, 'approved', 'purchases/NID/FyvxeiACbwT8hCYSmzCe.png', 'purchases/Memo/tr4fvzvhkuR3pHvee5hD.png', '1', '2026-03-16 07:58:11', '2026-03-16 08:01:21'),
(63, 20, '20260922', 'Apple', NULL, 52500.00, 'Gold', 'Japan', '89', 'Bashundhara City', '37493', '2026-03-16', 'EM Center', '0100000000', '10000000001', 'Pre-Owned', '6GB', '256GB', 'No', '356942285182559', 1, 1, 56000.00, 'approved', 'purchases/NID/icr7up7JrA4Qvcm7UJl7.jpeg', 'purchases/Memo/cTUh2kC7frrGcwhatsTF.jpeg', '1', '2026-03-16 07:58:46', '2026-03-16 08:04:17'),
(65, 17, '20260924', 'Apple', NULL, 39500.00, 'Blue', 'China', '82', 'Bashundhara City', '64834', '2026-03-16', 'EM Center', '0100000000', '10000000001', 'Pre-Owned', '6GB', '128GB', 'No', '359628540401267', 1, 1, 45000.00, 'approved', 'purchases/NID/1Z1qk8s2yMyavqIfSFRt.jpeg', 'purchases/Memo/cq8OsI8uLcwVevrOR6JM.jpeg', '1', '2026-03-16 08:00:28', '2026-03-16 08:04:35'),
(66, 13, '20260925', 'Apple', NULL, 36000.00, 'Gold', 'Singapore', '88', 'Bashundhara City', '3577', '2026-03-16', 'EM Center', '0100000000', '10000000001', 'Pre-Owned', '4GB', '256GB', 'Yes', '353896104836766', 1, 1, 42000.00, 'approved', 'purchases/NID/1hcWu96ua9Fcyog1F8xW.jpeg', 'purchases/Memo/Gzsleifjx9gKKYYpOx2j.jpeg', '1', '2026-03-16 08:04:06', '2026-03-16 08:04:43'),
(67, 8, '20260926', 'Apple', NULL, 24000.00, 'Black', 'Korean', '94', 'Bashundhara City', '212', '2026-03-16', 'bashundhara', '09090909', '988787987', 'Pre-Owned', '4GB', '256GB', 'No', '357261096929218', 1, 1, 30000.00, 'approved', 'purchases/NID/RUU1ehay35gSyI07jk8A.png', 'purchases/Memo/6N8zq3kOoStaHxxybUAJ.png', '1', '2026-03-16 09:52:00', '2026-03-17 04:12:33'),
(68, 80, '20260927', 'Samsung', NULL, 18000.00, 'Green', 'Bangladesh', '100', 'Bashundhara City', '102', '2026-03-16', 'bashundhara', '09090909', '988787987', 'Pre-Owned', '8GB', '256GB', 'No', '358841580228117', 1, 1, 23000.00, 'approved', 'purchases/NID/wupNUz4XPShaqjwtE5Af.png', 'purchases/Memo/1cB6eaapKZcfmKBYzkZG.png', '1', '2026-03-16 09:56:24', '2026-03-17 04:05:42'),
(69, 61, '20260928', 'Samsung', NULL, 138000.00, 'Blue', 'Vietnam', '100', 'Bashundhara City', '7635', '2026-03-16', 'bashundhara', '09090909', '988787987', 'New', '12GB', '256GB', 'Yes', '350145971752026', 1, 1, 150000.00, 'approved', 'purchases/NID/stcjnqOO3UbeAEVYhr5W.jfif', 'purchases/Memo/0AaqNjK2cz2XvRaM5v8P.png', '1', '2026-03-16 10:00:25', '2026-03-17 04:05:03'),
(71, 47, '20260929', 'Samsung', NULL, 74500.00, 'Natural Titanium', 'Vietnam', '1000', 'Bashundhara City', '2132', '2026-03-16', 'Arif', '01751315328', '988787987', 'Pre-Owned', '12GB', '256GB', 'No', '353578850090828', 1, 1, 80000.00, 'approved', 'purchases/NID/Kis3GNmWxStPwtYKqfFC.png', 'purchases/Memo/4BwrCDZ2OT4c4Dj7SnGm.jfif', '1', '2026-03-16 10:13:48', '2026-03-17 04:04:31'),
(72, 74, '20260930', 'Samsung', NULL, 60000.00, 'Green', 'USA', '100', 'Bashundhara City', '0165', '2026-03-16', 'Arif', '01751315328', '988787987', 'Pre-Owned', '12GB', '256GB', 'No', '350209361912010', 1, 1, 67000.00, 'approved', 'purchases/NID/TQFIUSmrJHvm1FmCNo8L.png', 'purchases/Memo/ggHqPPIskXLpJW8bEzOp.jfif', '1', '2026-03-16 10:41:29', '2026-03-17 04:03:54'),
(73, 82, '20260931', 'Samsung', NULL, 32000.00, 'Gold', 'USA', '100', 'Eastern Plaza', '2434', '2026-03-13', 'ibrahim', '01911385786', '98765564', 'Pre-Owned', '12GB', '512GB', 'No', '351787741538737', 1, 0, 37000.00, 'approved', 'purchases/NID/LFHAZvpVTC1XGG8ROKIF.jpg', 'purchases/Memo/EPjH8wmTUc4CD7IYLCfi.jpg', '1', '2026-03-17 00:13:09', '2026-04-06 00:52:44'),
(74, 83, '20260932', 'Samsung', NULL, 25000.00, 'Black', 'Japan', '100', 'Eastern Plaza', '9876', '2026-02-09', 'bashundhara', '01607668882', '98096689', 'Pre-Owned', '8GB', '128GB', 'No', '35723480677112', 1, 0, 30000.00, 'approved', 'purchases/NID/3lsiZycPy6wbIYI2vMzY.jpg', 'purchases/Memo/ZKdTRJ1STP5KPvF7I1sZ.jpg', '1', '2026-03-17 00:24:53', '2026-04-06 01:01:56'),
(75, 79, '20260933', 'Samsung', NULL, 25000.00, 'Pink', 'USA', '100', 'Eastern Plaza', '5456', '2025-01-01', 'unknown', '6577885', '457899444', 'Pre-Owned', '8GB', '128GB', 'No', '353459966426216', 1, 1, 30000.00, 'approved', 'purchases/NID/zuK80i5yyhduhkjU9PNx.jpg', 'purchases/Memo/hNYATq5Njg23kEc1FGLV.jpg', '1', '2026-03-17 00:31:32', '2026-03-17 04:01:16'),
(76, 79, '20260934', 'Samsung', NULL, 25000.00, 'Alpine Green', 'Global', '100', 'Eastern Plaza', '08765', '2025-08-25', 'sentu', '5678896', '467863456', 'Pre-Owned', '8GB', '128GB', 'No', '351334332081031', 1, 0, 30000.00, 'approved', 'purchases/NID/PTc65kJ3NcMHxdfpu2lY.jpg', 'purchases/Memo/kXC5JqAfZcFO3rolco8J.jpg', '1', '2026-03-17 00:34:37', '2026-04-06 00:42:25'),
(77, 84, '20260935', 'Samsung', NULL, 9000.00, 'Blue', 'India', '100', 'Eastern Plaza', '895', '2025-07-04', 'md madul', '6768585', '677843325', 'Pre-Owned', '6GB', '64GB', 'No', '357633093683750', 1, 1, 15000.00, 'approved', 'purchases/NID/lz57uBADnLWkpJokDaOo.jfif', 'purchases/Memo/3QQK6ZqjhiEuAnb9it56.jfif', '1', '2026-03-17 00:40:58', '2026-03-17 03:59:52'),
(78, 85, '20260936', 'Samsung', NULL, 7000.00, 'Black', 'India', '100', 'Eastern Plaza', '5688', '2025-06-04', 'Md madul', '5665788', '67794543', 'Pre-Owned', '8GB', '128GB', 'No', '357633093683750', 1, 1, 12000.00, 'approved', 'purchases/NID/WjZBAa6WTKsbkgUagq4G.jfif', 'purchases/Memo/NKB9mTPKBxdl4plEhoEx.jfif', '1', '2026-03-17 00:48:30', '2026-03-17 03:59:32'),
(79, 86, '20260937', 'Realme', NULL, 5300.00, 'Black', 'India', '100', 'Eastern Plaza', '7756', '2026-03-07', 'unknown', '98349349', '8499239999', 'Pre-Owned', '6GB', '128GB', 'No', '868296050528590', 1, 1, 10000.00, 'approved', 'purchases/NID/HiF7JM23DA9iOUCoJJtt.png', 'purchases/Memo/QXgyNTVgaZEhtISNGaEQ.png', '1', '2026-03-17 00:52:43', '2026-03-17 03:58:54'),
(80, 87, '20260938', 'Apple', NULL, 15000.00, 'Gray', 'Canada', '100', 'Eastern Plaza', '994977594', '2025-06-04', 'aiyub', '008873938', '75859939', 'Pre-Owned', '3GB', '64GB', 'No', '353204104573895', 1, 1, 20000.00, 'approved', 'purchases/NID/19Qb2NDcDsO5gjj0I7uu.jpg', 'purchases/Memo/i4gj3zrzOZmyVXVXyd4C.jpg', '1', '2026-03-17 01:01:17', '2026-03-17 03:58:37'),
(81, 17, '20260939', 'Apple', NULL, 39500.00, 'White', 'China', '89', 'Eastern Plaza', '1234', '2026-03-16', 'mt', '01973509053', '0197350905312', 'Pre-Owned', '6GB', '128GB', 'Yes', '35 5657926800986', 1, 0, 45000.00, 'approved', 'purchases/NID/798qHhqTxs0NnCxiNA59.jpg', 'purchases/Memo/ZJCLiBNXvNpuQoKEwCAU.jpg', '1', '2026-03-17 02:15:17', '2026-04-18 00:56:11'),
(82, 8, '20260940', 'Apple', NULL, 24000.00, 'Black', 'India', '92', 'Eastern Plaza', '1111', '2026-03-01', 'shahin gadget', '01973509053', '0197350905312', 'Pre-Owned', '4GB', '256GB', 'No', '357285098406602', 1, 0, 30000.00, 'approved', 'purchases/NID/0Z7Rqo1mDHupNxqDwjlR.jpg', 'purchases/Memo/cDMhFCXBPztZk0oMlvDt.jpg', '1', '2026-03-17 02:22:14', '2026-04-06 00:46:58'),
(83, 16, '20260941', 'Apple', NULL, 45500.00, 'Blue', 'Singapore', '84', 'Eastern Plaza', '1121', '2026-03-08', 'shahin gadget', '01836115572', '0197350905312', 'Pre-Owned', '6GB', '128GB', 'Yes', '353369288895883', 1, 0, 51000.00, 'approved', 'purchases/NID/SCZo7FEe2ywXJNWYObLU.jpeg', 'purchases/Memo/WeVvi8UEXvhkikDtcnsG.png', '1', '2026-03-17 02:31:33', '2026-04-09 00:24:31'),
(84, 15, '20260942', 'Apple', NULL, 38500.00, 'Gold', 'USA', '88', 'Eastern Plaza', '1231', '2026-03-08', 'dokan dar', '01973509053', '0197350905312', 'Pre-Owned', '6GB', '256GB', 'No', '356462520451768', 1, 0, 40500.00, 'approved', 'purchases/NID/OZqTLE7fnoVWskp1iQDL.jpg', 'purchases/Memo/DkHpIMcE0LWalzUylYGJ.jpg', '1', '2026-03-17 02:38:52', '2026-04-06 01:04:25'),
(85, 13, '20260943', 'Apple', NULL, 25500.00, 'Gray', 'Singapore', '64', 'Eastern Plaza', '1231', '2026-03-01', 'dokan dar', '01973509053', '0197350905312', 'Pre-Owned', '4GB', '64GB', 'Yes', '353918102051170', 1, 0, 31000.00, 'approved', 'purchases/NID/gG09hxUcnSGiwaBUBteT.jpeg', 'purchases/Memo/31GkbqW1V4a2mJuSjWVs.jpeg', '1', '2026-03-17 02:42:39', '2026-04-06 00:45:38'),
(86, 29, '20260944', 'Apple', NULL, 70000.00, 'Natural Titanium', 'HongKong', '82', 'Eastern Plaza', '9948', '2026-03-07', 'fozleh rabbi', '01836115572', '84849', 'Pre-Owned', '8GB', '256GB', 'No', '358819900082729', 1, 0, 81000.00, 'approved', 'purchases/NID/twlaAwg1aC7FjyLOl5gs.jpg', 'purchases/Memo/Uj1jNeRFC89AOH5eNfLr.jpg', '1', '2026-03-17 03:46:56', '2026-04-04 05:57:10'),
(87, 22, '20260945', 'Apple', NULL, 45500.00, 'White', 'China', '88', 'Eastern Plaza', '12332', '2026-03-16', 'dokan dar', '01973509053', '0197350905312', 'Pre-Owned', '6GB', '128GB', 'Yes', '359529189483022', 1, 0, 53000.00, 'approved', 'purchases/NID/ufiEa597lRKSWmO9nIfV.jpeg', 'purchases/Memo/sl22wDKiqGjVGEQMIUru.jpg', '1', '2026-03-17 03:59:36', '2026-04-18 00:52:20'),
(88, 26, '20260946', 'Apple', NULL, 54000.00, 'Black', 'Australia', '84', 'Eastern Plaza', '7364', '2026-03-15', 'unknown', '99764783', '08764300', 'Pre-Owned', '4GB', '128GB', 'No', '357261917718816', 1, 0, 60000.00, 'approved', 'purchases/NID/GSDAklXocW1E0LEuKy9f.jpg', 'purchases/Memo/qCxsr15ymwkzDLYyOvfE.jpg', '1', '2026-03-17 04:01:45', '2026-04-04 05:55:34'),
(89, 30, '20260947', 'Apple', NULL, 93000.00, 'Natural Titanium', 'Singapore', '90', 'Eastern Plaza', '7886564', '2026-03-10', 'kamal', '898887687', '656456789', 'Pre-Owned', '8GB', '256GB', 'Yes', '358560153457198', 1, 0, 98000.00, 'approved', 'purchases/NID/LkRbxTk7iKnWtMSFTHuk.jfif', 'purchases/Memo/hPhkqXcGMH2gciY3UIeR.jpg', '1', '2026-03-17 04:08:13', '2026-04-04 05:54:22'),
(90, 20, '20260948', 'Apple', NULL, 53000.00, 'Black', 'USA', '88', 'Eastern Plaza', '1231', '2026-03-16', 'dokan dar', '01973509053', '0197350905312', 'Pre-Owned', '6GB', '256GB', 'No', '358823340711699', 1, 0, 55000.00, 'approved', 'purchases/NID/BFcKaPp0Vtfnytp7smWZ.jpg', NULL, '1', '2026-03-17 04:09:41', '2026-03-17 04:19:53'),
(91, 15, '20260949', 'Apple', NULL, 29000.00, 'Gold', 'USA', '88', 'Eastern Plaza', '1231', '2026-03-01', 'dokan dar', '01973509053', '01973509053', 'Pre-Owned', '6GB', '128GB', 'No', '351001687583065', 1, 0, 34000.00, 'approved', 'purchases/NID/PJ8ZwXeUDBKfs6NlhdYQ.jpg', 'purchases/Memo/4rwdoQKOmWUW4q5M7qGT.jpg', '1', '2026-03-17 04:12:58', '2026-04-04 05:53:14'),
(92, 15, '20260950', 'Apple', NULL, 32000.00, 'Sierra Blue', 'USA', '100', 'Eastern Plaza', '987967', '2025-09-29', 'suman uncle', '854890', '656379', 'Pre-Owned', '4GB', '256GB', 'No', '358522142388181', 1, 1, 36000.00, 'approved', 'purchases/NID/TdQ1FeJIEi1F3An2Q5oi.jpg', 'purchases/Memo/zotqiSFaBbQWtCI4RTQ9.jpg', '1', '2026-03-17 04:13:36', '2026-03-17 04:17:02'),
(93, 15, '20260951', 'Apple', NULL, 32000.00, 'Sierra Blue', 'USA', '83', 'Eastern Plaza', '8976565354', '2026-03-12', 'joiiuug', '867539', '0954589', 'Pre-Owned', '6GB', '256GB', 'No', '358522145960853', 1, 0, 38000.00, 'approved', 'purchases/NID/VnjZJcUzMO4XLg8fiaVo.jfif', 'purchases/Memo/mLSpc8XpDkfjq7mkPwXV.jpg', '1', '2026-03-17 04:17:30', '2026-04-04 05:48:48'),
(95, 61, '20260953', 'Samsung', NULL, 152000.00, 'Blue', 'Vietnam', '100', 'Eastern Plaza', '1235', '2026-03-14', 'jomuna', '01973509053', '0197350905312', 'New', '12GB', '512GB', 'Yes', '356028673428059', 1, 0, 155000.00, 'approved', 'purchases/NID/mMLVgpcnO2wsRt6UojY0.jpeg', 'purchases/Memo/GB2ZgBzZYMnkiBWb73J7.jpeg', '1', '2026-03-17 04:27:41', '2026-04-04 05:42:52'),
(96, 24, '20260954', 'Apple', NULL, 62000.00, 'Black', 'Korean', '94', 'Eastern Plaza', '1212', '2026-03-15', 'dokan dar', '01973509053', '0197350905312', 'Pre-Owned', '6GB', '128GB', 'Yes', '358267719968847', 1, 0, 68000.00, 'approved', 'purchases/NID/PUGn6Vp3icgRml4aXjbg.jpg', NULL, '1', '2026-03-17 04:32:30', '2026-04-18 00:51:09'),
(97, 50, '20260955', 'Google Pixel', NULL, 12000.00, 'White', 'USA', '100', 'Bashundhara City', '1821', '2026-03-17', 'Irtaza', '01632343890', '6010160452', 'Pre-Owned', '8GB', '128GB', 'No', '357723165644689', 1, 1, 15000.00, 'approved', 'purchases/NID/9g2IJDdewtAxJvU0tMCl.jpeg', 'purchases/Memo/AtqQxpQPrRBgdsqmy5yu.jpeg', '1', '2026-03-17 06:37:19', '2026-03-28 06:01:06'),
(98, 20, '20260956', 'Apple', NULL, 47000.00, 'Sky Blue', 'USA', '87', 'Bashundhara City', '027', '2026-03-17', 'bashundhara', '09090909', '6010160452', 'Pre-Owned', '6GB', '128GB', 'No', '352668915747891', 1, 1, 55000.00, 'approved', 'purchases/NID/7Ae6AHX6HrPT4AlcwuOO.png', 'purchases/Memo/IQp4U1fd4dtACJAuzLU9.jfif', '1', '2026-03-17 08:13:15', '2026-03-28 06:00:53'),
(99, 17, '20260957', 'Apple', NULL, 38000.00, 'Pink', 'USA', '90', 'Bashundhara City', '6547', '2026-03-28', 'eastern', '01780523881', '6464297', 'Pre-Owned', '4GB', '128GB', 'No', '350980299883750', 1, 1, 45000.00, 'approved', 'purchases/NID/gqbj7jzyi6hlNM4rK1qs.png', 'purchases/Memo/MOwnvgBFJe37cfgjryBP.jfif', '1', '2026-03-28 06:25:57', '2026-03-28 07:04:21'),
(100, 21, '20260958', 'Apple', NULL, 53000.00, 'White', 'USA', '90', 'Bashundhara City', '5430', '2026-03-28', 'eastern', '01780523881', '6464297', 'Pre-Owned', '6GB', '128GB', 'No', '352996438262415', 1, 1, 60000.00, 'approved', 'purchases/NID/kznBo6AUZrOikYhvWz5K.png', 'purchases/Memo/IlXB376qnaHq33qbZ6kG.jfif', '1', '2026-03-28 06:30:42', '2026-03-28 06:41:57'),
(101, 17, '20260959', 'Apple', NULL, 34500.00, 'Black', 'China', '87', 'Eastern Plaza', '1231', '2026-03-27', 'tuhin', '01973509053', '0197350905312', 'Pre-Owned', '6GB', '128GB', 'No', '354865252436751', 1, 1, 40000.00, 'approved', 'purchases/NID/Tzn7vTRLxqiIsiLHP5C6.jpg', 'purchases/Memo/vNKeg4Wo9mqB9g6Oxqn7.jpg', '8', '2026-03-30 23:27:12', '2026-03-30 23:40:51'),
(102, 47, '20260960', 'Samsung', NULL, 77000.00, 'Gold', 'Global', '100', 'Eastern Plaza', '1212', '2026-03-27', 'coustomer', '01973509053', '01973509053', 'Pre-Owned', '12GB', '512GB', 'Yes', '3536074340366385', 1, 1, 85000.00, 'approved', 'purchases/NID/tXEwnNhKAFouGUx0cxff.jpg', 'purchases/Memo/l18Egl9uFiQobvozM6uQ.jpeg', '8', '2026-03-31 00:32:34', '2026-04-01 07:28:53'),
(103, 21, '20260961', 'Apple', NULL, 53500.00, 'Black', 'Brazil', '89', 'Eastern Plaza', '23236', '2026-03-27', 'Saiful vai', '2340823098', '4623984872364062', 'Pre-Owned', '6GB', '128GB', 'No', '352362883762666', 1, 0, 58000.00, 'approved', 'purchases/NID/rXt68qn9xUSQ3xW3WSSS.jpg', 'purchases/Memo/eePCcrLQTLW47jOaJH9v.jpeg', '8', '2026-03-31 01:51:11', '2026-04-18 00:50:15'),
(104, 24, '20260962', 'Apple', NULL, 57430.00, 'Gold', 'HongKong', '88', 'Eastern Plaza', '87563489', '2026-03-27', 'Saiful vai', '4576843568937658', '348638956', 'Pre-Owned', '6GB', '128GB', 'No', '351055826583287', 1, 1, 65000.00, 'approved', 'purchases/NID/dQ2EYnbM723i3Cj5UbVh.jpeg', 'purchases/Memo/LBtQD1oCx2MezWus9gku.jpeg', '8', '2026-03-31 02:08:27', '2026-04-01 07:28:26'),
(106, 17, '20260964', 'Apple', NULL, 38250.00, 'White', 'USA', '87', 'Eastern Plaza', '34876', '2026-03-27', 'Saiful vai', '75497438574', '34875623856897234', 'Pre-Owned', '6GB', '128GB', 'No', '350183987389319', 1, 1, 45000.00, 'approved', 'purchases/NID/eC2ezm1bkhYZcNldDh6Z.jpeg', NULL, '8', '2026-03-31 05:26:16', '2026-04-01 07:27:57'),
(107, 17, '20260965', 'Apple', NULL, 38250.00, 'Phantom Pink', 'USA', '89%', 'Eastern Plaza', '349873408', '2026-03-31', 'Saiful vai', '4987423087r23', '347856', 'Pre-Owned', '6GB', '128GB', 'No', '352941885260132', 1, 0, 45000.00, 'approved', 'purchases/NID/DAxqUPV8IYmboBLH4mOo.jpg', 'purchases/Memo/ILRj3wmSHITkw9eQeZws.jpeg', '8', '2026-04-01 05:14:53', '2026-04-04 05:40:17'),
(108, 17, '20260966', 'Apple', NULL, 38250.00, 'Pink', 'USA', '91%', 'Eastern Plaza', '76576575', '2026-03-31', 'Saiful vai', '48708347', '8374634897', 'Pre-Owned', '6GB', '128GB', 'No', '353762465423190', 1, 1, 45000.00, 'approved', 'purchases/NID/puTBd5MizvEczvQKM37Y.jpeg', 'purchases/Memo/zTLHQKkknVnZGy95AwFv.jpg', '8', '2026-04-01 05:21:36', '2026-04-01 07:27:28'),
(109, 17, '20260967', 'Apple', NULL, 38250.00, 'White', 'USA', '88%', 'Eastern Plaza', '348756348956', '2026-03-31', 'Saiful vai', '387462398762', '83475634298756', 'Pre-Owned', '6GB', '128GB', 'No', '359346679205033', 1, 1, 45000.00, 'approved', 'purchases/NID/G2l1Mvjy52ctNRFu4rzr.jpg', 'purchases/Memo/nsFySdCX8lBZ2IxyfNET.jpeg', '8', '2026-04-01 05:27:58', '2026-04-01 07:27:12'),
(110, 88, '20260968', 'Samsung', NULL, 11000.00, 'Blue', 'Japan', '100', 'Eastern Plaza', '43876234876', '2026-03-15', 'Saiful vai', '9847230845780293s', '384762389462', 'Pre-Owned', '8GB', '128GB', 'No', '351211130463746', 1, 0, 20000.00, 'approved', 'purchases/NID/6Ddxuh7aBQtBsIITLUYc.jpeg', 'purchases/Memo/T8eLZOqqPPYgezFvA1aL.jpg', '8', '2026-04-01 05:42:09', '2026-04-04 05:34:38'),
(112, 50, '20260970', 'Google Pixel', NULL, 15500.00, 'Pink', 'HongKong', '100', 'Eastern Plaza', '52354352345342', '2026-03-31', 'Saiful vai', '45634634634', '345235234', 'Pre-Owned', '8GB', '128GB', 'No', '357723169578461', 1, 1, 20000.00, 'approved', 'purchases/NID/BqguSxkpzNVCOv4yh5se.jpeg', 'purchases/Memo/9DXelI371AMstnrswW9D.jpeg', '8', '2026-04-01 05:55:51', '2026-04-01 07:26:22'),
(113, 14, '20260971', 'Apple', NULL, 22000.00, 'Green', 'HongKong', '79', 'Eastern Plaza', '4876328', '2026-03-31', 'Saiful vai', '394857302498', '324872380', 'Pre-Owned', '6GB', '128GB', 'No', '353032114098276', 1, 0, 30000.00, 'approved', 'purchases/NID/iAy05MiTCG328ImKzoOB.jpeg', 'purchases/Memo/gRbT0C4JDYFMrzvb2Dgk.jpg', '8', '2026-04-01 06:07:19', '2026-04-06 01:27:29'),
(114, 83, '20260972', 'Samsung', NULL, 30000.00, 'White', 'Japan', '100', 'Eastern Plaza', '1212', '2026-03-31', 'Saiful vai', '01836115572', '4623984872364062', 'Pre-Owned', '8GB', '256GB', 'No', '350865892275647', 1, 0, 40000.00, 'approved', 'purchases/NID/AG0wfnpOm09k1WxePFcR.jpg', 'purchases/Memo/2fDyaSY8XA0oiaHNy2YR.jpeg', '8', '2026-04-01 06:09:10', '2026-04-04 05:31:05'),
(115, 47, '20260973', 'Samsung', NULL, 650000.00, 'Natural Titanium', 'Global', '100', 'Eastern Plaza', '845723408572', '2026-03-31', 'Saiful vai', '01973509053', '75654764765', 'Pre-Owned', '6GB', '128GB', 'No', '350518498247259', 1, 1, 70000.00, 'approved', 'purchases/NID/UD2RCQh8NMmdH7yNfohw.jpg', 'purchases/Memo/jUvBznY8fvsR8Vl81KjP.jpeg', '8', '2026-04-01 06:22:33', '2026-04-01 07:25:13'),
(116, 53, '20260974', 'Google Pixel', NULL, 15500.00, 'Black', 'Japan', '100', 'Eastern Plaza', '23765276', '2026-03-31', 'Saiful vai', '87390370983', '387638732', 'Pre-Owned', '8GB', '128GB', 'No', '359099479712449', 1, 1, 20000.00, 'approved', 'purchases/NID/EltsL5Sn3woE7ag33xkH.jpg', 'purchases/Memo/vSzAiWKN1cIfC9xoteg8.jpeg', '8', '2026-04-01 07:18:36', '2026-04-01 07:25:01'),
(118, 25, '20260976', 'Apple', NULL, 79000.00, 'Purple', 'Vietnam', '93', 'Jamuna Future Park', '9775', '2026-03-02', 'unknown', '5665788', '67794543', 'Pre-Owned', '8GB', '256GB', 'Yes', '359761974191920', 1, 1, 83000.00, 'approved', 'purchases/NID/3L6Khzyp4iet4H1qtRPs.jpg', 'purchases/Memo/iL7XQgWXK2BlQsqEtF4A.jpg', '3', '2026-04-02 00:43:46', '2026-04-04 00:43:21'),
(119, 24, '20260977', 'Apple', NULL, 67500.00, 'Purple', 'Canada', '86', 'Jamuna Future Park', '6459', '2026-03-02', 'unknown', '6768585', '875764764', 'Pre-Owned', '6GB', '128GB', 'No', '350114362877784', 1, 1, 72000.00, 'approved', 'purchases/NID/44cRkXbp85d1zFvF6tyY.jpeg', 'purchases/Memo/eCrZrKIAw30PXFUB0gxC.jfif', '3', '2026-04-02 00:49:55', '2026-04-04 00:43:10'),
(120, 24, '20260978', 'Apple', NULL, 67500.00, 'White', 'Japan', '93', 'Jamuna Future Park', '8765', '2026-03-29', 'uhuyu', '01911385786', '98765', 'Pre-Owned', '6GB', '256GB', 'No', '357050831722164', 1, 1, 72000.00, 'approved', 'purchases/NID/PR6pHonRDCXzPdeC4kFP.jfif', 'purchases/Memo/AQe5HK33oYljuaUAr9Np.png', '3', '2026-04-02 00:54:30', '2026-04-04 00:42:58'),
(121, 24, '20260979', 'Apple', NULL, 67500.00, 'White', 'Japan', '93', 'Jamuna Future Park', '8765', '2026-03-29', 'uhuyu', '01911385786', '98765', 'Pre-Owned', '6GB', '256GB', 'No', '357050831722164', 1, 1, 72000.00, 'approved', 'purchases/NID/QfdjJibhKbBjiw2GZius.jfif', 'purchases/Memo/hWXuTecStFKFzgbvOULK.png', '3', '2026-04-02 00:54:31', '2026-04-04 00:42:40'),
(122, 24, '20260980', 'Apple', NULL, 67500.00, 'Purple', 'Japan', '88', 'Jamuna Future Park', '3456', '2026-03-29', 'jhsfre', '6763543678', '986532', 'Pre-Owned', '6GB', '256GB', 'No', '350114363023768', 1, 1, 72000.00, 'approved', 'purchases/NID/EzXrOdDR40ZeNyWq6EJ8.jpeg', 'purchases/Memo/N9362bjSeFWBYGnfLarB.jpeg', '3', '2026-04-02 00:57:47', '2026-04-04 00:42:24'),
(123, 24, '20260981', 'Apple', NULL, 67500.00, 'Purple', 'Japan', '88', 'Jamuna Future Park', '0860', '2026-03-29', 'oigffs', '9875643', '4567', 'Pre-Owned', '6GB', '256GB', 'No', '354811958920896', 1, 1, 70000.00, 'approved', 'purchases/NID/EtJCDRi7lm99OczAti4V.jpeg', 'purchases/Memo/Ua9vsobpAXjfw3EcKrup.jpeg', '3', '2026-04-02 01:01:26', '2026-04-04 00:42:10'),
(124, 21, '20260982', 'Apple', NULL, 53000.00, 'Gold', 'USA', '89', 'Jamuna Future Park', '09876', '2026-04-29', 'lkhydcv', '897566423', '5678', 'Pre-Owned', '8GB', '128GB', 'No', '356370167491379', 1, 1, 58000.00, 'approved', 'purchases/NID/RXAKWgp19krNAlKgVG1L.jpeg', 'purchases/Memo/zDCbsUIbMhoY6siBins7.jpeg', '3', '2026-04-02 01:07:22', '2026-04-04 00:41:54'),
(125, 21, '20260983', 'Apple', NULL, 53000.00, 'White', 'HongKong', '91', 'Jamuna Future Park', '76543', '2026-03-29', 'oijhgr', '45789', '867534', 'Pre-Owned', '6GB', '128GB', 'No', '359481987766317', 1, 1, 58000.00, 'approved', 'purchases/NID/AtYzA4CBnAk6dOR3lFcZ.jpeg', 'purchases/Memo/ZFCbbYxHRforDuYwYggw.jpeg', '3', '2026-04-02 01:11:14', '2026-04-04 00:41:44'),
(126, 20, '20260984', 'Apple', NULL, 52500.00, 'Sierra Blue', 'Japan', '89', 'Jamuna Future Park', '9786653', '2026-03-29', 'klkdsz', '7856543', '9873', 'Pre-Owned', '6GB', '256GB', 'No', '35631070346047', 1, 1, 58000.00, 'approved', 'purchases/NID/8oiAvPuw6HOmzymK5rGR.jpeg', 'purchases/Memo/DJFVquKGKgtJ40TSoTcB.jpeg', '3', '2026-04-02 01:14:21', '2026-04-04 00:41:33'),
(127, 20, '20260985', 'Apple', NULL, 48000.00, 'Sierra Blue', 'Dubai', '90', 'Jamuna Future Park', '987664', '2026-03-29', '9875', '0895425', '97543678', 'Pre-Owned', '6GB', '128GB', 'No', '357866896586487', 1, 1, 55000.00, 'approved', 'purchases/NID/ucDoTkmNItpChPYFXvQM.jpeg', 'purchases/Memo/XPl54TppPMQpT25FwlNa.jpeg', '3', '2026-04-02 01:17:39', '2026-04-04 00:41:19'),
(128, 20, '20260986', 'Apple', NULL, 48000.00, 'Sierra Blue', 'Dubai', '90', 'Jamuna Future Park', '987664', '2026-03-29', '9875', '0895425', '97543678', 'Pre-Owned', '6GB', '128GB', 'No', '357866896586487', 1, 1, 55000.00, 'approved', 'purchases/NID/Dye64DRpNYLJVAqrAJHx.jpeg', 'purchases/Memo/Yegij9DkaR4ebps07ven.jpeg', '3', '2026-04-02 01:17:44', '2026-04-04 00:41:08'),
(129, 20, '20260987', 'Apple', NULL, 48000.00, 'Gold', 'USA', '91', 'Jamuna Future Park', '08976', '2026-03-29', 'ddfsrdt', '987635', '65256', 'Pre-Owned', '6GB', '128GB', 'No', '359984987569730', 1, 1, 52000.00, 'approved', 'purchases/NID/tBfOYfPNuGcyVoIAxvMm.jpeg', 'purchases/Memo/2pdyuBwjEG30i8Qz6C2P.jpeg', '3', '2026-04-02 01:22:32', '2026-04-04 00:40:44'),
(130, 20, '20260988', 'Apple', NULL, 48000.00, 'Gold', 'USA', '91', 'Jamuna Future Park', '08976', '2026-03-29', 'ddfsrdt', '987635', '65256', 'Pre-Owned', '6GB', '128GB', 'No', '359984987569730', 1, 1, 55000.00, 'approved', 'purchases/NID/ggHLRBvzwhU3AQyqDH7c.jpeg', 'purchases/Memo/U1NrVW7XeHfDVkYxoeyu.jpeg', '3', '2026-04-02 01:22:32', '2026-04-04 00:40:56'),
(131, 20, '20260989', 'Apple', NULL, 48000.00, 'White', 'USA', '88', 'Jamuna Future Park', '563445356', '2026-03-29', 'yrysr', '987653', '565097', 'Pre-Owned', '6GB', '128GB', 'No', '359984981937891', 1, 1, 55000.00, 'approved', 'purchases/NID/95eVmzauaeBYhnbP8BNB.jpeg', 'purchases/Memo/1U5z1ahiHonWgcBMzuvV.jpeg', '3', '2026-04-02 01:25:29', '2026-04-04 00:40:30'),
(132, 17, '20260990', 'Apple', NULL, 38000.00, 'White', 'USA', '90', 'Jamuna Future Park', '7645', '2026-03-28', 'iuyrt', '645425', '9786456', 'Pre-Owned', '4GB', '128GB', 'No', '356815602822984', 1, 1, 45000.00, 'approved', 'purchases/NID/g8phpf6hRdNFJQPdIjPx.jpeg', 'purchases/Memo/JTfDVLPcV5qhqDRaglLi.jpeg', '3', '2026-04-02 01:30:52', '2026-04-04 00:40:20'),
(133, 17, '20260991', 'Apple', NULL, 38000.00, 'White', 'USA', '91', 'Jamuna Future Park', '5435', '2026-03-28', 'uiydz', '8675', '097653', 'Pre-Owned', '6GB', '128GB', 'No', '356010305948241', 1, 1, 45000.00, 'approved', 'purchases/NID/rZV7qniuLv2WP7qCK12P.jpeg', 'purchases/Memo/KOrHo4raLUJwF2qnrSYF.jpeg', '3', '2026-04-02 01:35:08', '2026-04-04 00:40:08'),
(134, 14, '20260992', 'Apple', NULL, 28360.00, 'White', 'USA', '89', 'Jamuna Future Park', '56636', '2026-03-29', 'oiuytsa', '4677', '987645', 'Pre-Owned', '4GB', '128GB', 'No', '351793391831380', 1, 1, 35000.00, 'approved', 'purchases/NID/9PoD1qk66OC13x9LNXSB.jpeg', 'purchases/Memo/MGiESys927uiVTpoQomq.jpeg', '3', '2026-04-02 01:37:49', '2026-04-04 00:39:57'),
(135, 90, '20260993', 'Redmi', NULL, 5000.00, 'Phantom White', 'India', '100', 'Jamuna Future Park', '43534', '2026-03-14', 'iasasd', '45457', '878769', 'Pre-Owned', '6GB', '128GB', 'No', '860041053751577', 1, 1, 15000.00, 'approved', 'purchases/NID/DV0sx5M12So7X0M5QgXX.jfif', 'purchases/Memo/XvFdSGBNcqTDSZWRDaU5.jpeg', '3', '2026-04-02 01:44:32', '2026-04-04 00:39:42'),
(136, 91, '20260994', 'Samsung', NULL, 9000.00, 'Black', 'Global', '100', 'Eastern Plaza', '32423423', '2026-04-02', 'sjkdhfblawh', '4872308573280', '34542352345234', 'Pre-Owned', '6GB', '128GB', 'No', '357661640115810', 1, 0, 13000.00, 'approved', 'purchases/NID/LPmGyx9PCyqdmLsRhZP6.jpg', 'purchases/Memo/GZsq5wj9fQFkC5g1vfAe.jpeg', '8', '2026-04-06 01:10:08', '2026-04-18 00:37:57'),
(137, 35, '20260995', 'Apple', NULL, 110000.00, 'Black', 'Japan', '90', 'Eastern Plaza', '23923', '2026-04-04', 'jani na', '017362366883', '3782873686268', 'Pre-Owned', '12GB', '256GB', 'Yes', '351037793670925', 1, 1, 118000.00, 'approved', 'purchases/NID/kuORa5iEiNC4TTXvsV4m.jpeg', 'purchases/Memo/i9bXsrZUZF2Frzo8kbm7.jpg', '8', '2026-04-06 01:23:26', '2026-04-09 00:17:38'),
(138, 59, '20260996', 'Samsung', NULL, 17500.00, 'Graphite', 'Global', '100', 'Eastern Plaza', '4321', '2026-04-03', 'weklfhw', '2384723802323', '2348723848230723', 'Pre-Owned', '12GB', '128GB', 'No', '357970621631699', 1, 0, 21000.00, 'approved', 'purchases/NID/zyd0hkFTE4q5LIA4UMA2.jpeg', 'purchases/Memo/TsWy6WxEo2ova0X042hH.jpg', '8', '2026-04-06 01:33:37', '2026-04-18 00:34:38'),
(139, 92, '20260997', 'Samsung', NULL, 8500.00, 'Blue', 'Global', '100', 'Eastern Plaza', '23432', '2026-04-03', 'fasfasdad', '34572379832', '24438762389745623', 'Pre-Owned', '6GB', '128GB', 'No', '353828958063345', 1, 0, 15000.00, 'approved', 'purchases/NID/9717avILLcOB6rXBT3Vv.jpg', 'purchases/Memo/ZxpjoEmkEIyQjmsrq1eE.jpeg', '8', '2026-04-06 01:36:02', '2026-04-18 00:32:16'),
(140, 93, '20260998', 'Samsung', NULL, 7000.00, 'Pink', 'Global', '100', 'Eastern Plaza', '3234', '2026-04-02', 'anti', '439893474278', '23432423423423', 'Pre-Owned', '8GB', '256GB', 'No', '353185441191220', 1, 1, 12000.00, 'approved', 'purchases/NID/bCGdA8WeRhXiTyCJVhbQ.jpeg', 'purchases/Memo/h2vL2HNG2bL9eKksQK0U.jpg', '8', '2026-04-06 01:41:53', '2026-04-09 00:16:14'),
(141, 30, '20260999', 'Apple', NULL, 50000.00, 'Natural Titanium', 'HongKong', '96', 'Eastern Plaza', '3113', '2026-04-02', 'riya', '019189317811', '138197381381', 'Pre-Owned', '12GB', '256GB', 'Yes', '350091872592931', 1, 0, 55000.00, 'approved', 'purchases/NID/1ZSyOTwqUXVqDX9Tdn0Q.jpeg', 'purchases/Memo/8SDRSUipVNRwytYTPXMW.jpg', '8', '2026-04-06 03:04:46', '2026-04-09 00:22:39'),
(142, 70, '20261000', 'Samsung', NULL, 71000.00, 'Natural Titanium', 'Global', '100', 'Eastern Plaza', '873246', '2026-04-02', 'wekfjhsadlkjf', '01782864826', '437569283475628394', 'Pre-Owned', '12GB', '256GB', 'Yes', '351123962602517', 1, 0, 78000.00, 'approved', 'purchases/NID/eNDALbUVXgU7LI7iCGZX.jpeg', 'purchases/Memo/Uq6cLfvIjwSvObbqTLBq.jpg', '8', '2026-04-06 03:57:48', '2026-04-21 23:40:39'),
(143, 94, '20261001', 'Apple', NULL, 10500.00, 'Gold', 'HongKong', '100', 'Eastern Plaza', '3245', '2026-04-06', 'eqwkduhwiuld', '348976502368', '3248765987234', 'Pre-Owned', '3GB', '256GB', 'Yes', '355354081357420', 1, 0, 15000.00, 'approved', 'purchases/NID/XqrvQI4oVUvba4WVVmAD.jpeg', 'purchases/Memo/A4ez3kztGEezTFULKrbG.jpg', '8', '2026-04-06 04:16:25', '2026-04-18 00:27:11'),
(144, 6, '20261002', 'Apple', NULL, 12000.00, 'Black', 'Dubai', '100', 'Eastern Plaza', '34857238', '2026-04-03', 'haisn', '34895743895723480', '43578263789523', 'Pre-Owned', '3GB', '64GB', 'No', '353049099497745', 1, 0, 18000.00, 'approved', 'purchases/NID/KO0yS2hj7txuwjyalJL9.jpeg', 'purchases/Memo/TYSG74Jh5LP9zT0z6bDi.jpg', '8', '2026-04-07 03:07:52', '2026-04-09 00:14:53'),
(145, 16, '20261003', 'Apple', NULL, 45500.00, 'Blue', 'USA', '87', 'Eastern Plaza', '231423', '2026-04-01', 'ldkjnf;aos', '329489274098213', '24512323145123', 'Pre-Owned', '6GB', '128GB', 'Yes', '354741667408448', 1, 1, NULL, 'pending', 'purchases/NID/tQAcmXrPKYzriYF2vphv.jpeg', 'purchases/Memo/mXsJIlNyaZmBSFJngJyc.jpg', '8', '2026-04-21 23:17:19', '2026-04-21 23:17:19'),
(146, 25, '20261004', 'Apple', NULL, 66000.00, 'Purple', 'Japan', '84', 'Eastern Plaza', '45678', '2026-04-19', 'customer', '078765435234567', '123456783456', 'Pre-Owned', '6GB', '128GB', 'Yes', '350550255402786', 1, 1, NULL, 'pending', 'purchases/NID/wsnfVuqPQm6IzdtwHUbn.jpeg', 'purchases/Memo/nUYy4HcDwPff7CsfNhHu.jpg', '8', '2026-04-21 23:38:06', '2026-04-21 23:38:06'),
(147, 95, '20261005', 'Samsung', NULL, 16000.00, 'Black', 'Vietnam', '100', 'Eastern Plaza', '23456', '2026-04-18', 'lhjgluh', '6786578754654685', '675432145678', 'Pre-Owned', '8GB', '128GB', 'No', '354652107290603', 1, 1, NULL, 'pending', 'purchases/NID/dSfj8hRZpAQLhTydYLVB.jpeg', 'purchases/Memo/YavFxMYfB3lq7w0jc4w2.jpg', '8', '2026-04-21 23:44:11', '2026-04-21 23:44:11'),
(148, 92, '20261006', 'Samsung', NULL, 5000.00, 'Black', 'Global', '100', 'Eastern Plaza', '3872368407123', '2026-04-21', 'coustomer', '0123456789', '3498723987462', 'Pre-Owned', '6GB', '64GB', 'No', '353825955021701', 1, 1, NULL, 'pending', 'purchases/NID/AULAblDG6WY7Mr4Tr4Ro.jpeg', 'purchases/Memo/2YQvI5SFGju6HNbKKD3K.jpg', '8', '2026-04-21 23:55:04', '2026-04-21 23:55:04'),
(149, 17, '20261007', 'Apple', NULL, 38000.00, 'White', 'Singapore', '82', 'Eastern Plaza', '2345654323456', '2026-04-19', 'roni vai.', '098765432123456789', '23456754321', 'Pre-Owned', '6GB', '128GB', 'Yes', '351075963091928', 1, 1, NULL, 'pending', 'purchases/NID/tMRENOstztNYGSshU3AO.jpeg', 'purchases/Memo/vZMgLNsjvNY5YY0ZOw5e.jpeg', '8', '2026-04-23 00:16:49', '2026-04-23 00:16:49'),
(150, 10, '20261008', 'Apple', NULL, 16000.00, 'Blue', 'USA', '87', 'Eastern Plaza', '3248723', '2026-04-21', 'khairul arif vai vhat er hotel', '0987654567890', '2347890237', 'Pre-Owned', '3GB', '128GB', 'No', '357331095777353', 1, 1, NULL, 'pending', 'purchases/NID/CRteUBXS295UE82TMD2l.jpg', NULL, '8', '2026-04-23 00:31:42', '2026-04-23 00:31:42');

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

--
-- Dumping data for table `purchase_returns`
--

INSERT INTO `purchase_returns` (`id`, `purchase_id`, `product_id`, `barcode`, `brand`, `model`, `price`, `return_price`, `color`, `variant`, `battery_health`, `branch`, `memo`, `date`, `supplier_name`, `contact_number`, `nid_number`, `condition`, `ram`, `rom`, `box`, `imei`, `quantity`, `available_stock`, `salesPrice`, `status`, `nid_image`, `memo_image`, `note`, `prepared_by`, `returned_by`, `returned_at`, `created_at`, `updated_at`) VALUES
(1, NULL, 21, '20260975', 'Apple', '-', 53500.00, 53500.00, 'Gold', 'USA', '88%', 'Eastern Plaza', '4352351', '-', 'saiful vai', '98239897', '55236234', 'Pre-Owned', '6GB', '128GB', 'No', '351678919381499', 1, 1, 58000.00, 'returned', 'purchases/NID/FNRuiUsj13u8FarJmzS1.jpeg', 'purchases/Memo/mHnTdtWNUMoUZaZXOjfH.jpg', 'product have some issue', 8, 8, '2026-04-18 00:42:23', '2026-04-18 00:42:23', '2026-04-18 00:42:23'),
(2, NULL, 20, '20260963', 'Apple', '-', 48222.00, 48222.00, 'Gold', 'USA', '92', 'Eastern Plaza', '45234', '-', 'Saiful vai', '349574099834', '34987563498756', 'Pre-Owned', '6GB', '128GB', 'No', '353165804850760', 1, 1, 55000.00, 'returned', 'purchases/NID/6t95F0ArgDi2cNvfTEs8.jpg', 'purchases/Memo/zShWuLeXpYlWiuMagwuI.jpeg', 'some issues', 8, 8, '2026-04-18 00:48:19', '2026-04-18 00:48:19', '2026-04-18 00:48:19');

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
  `discount` decimal(8,2) DEFAULT 0.00,
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
(1, 1, 2, 30000.00, 30000.00, 0.00, 'Cash', NULL, '{\"39\":0}', '200401', '2026-03-04', '2026-03-16 02:59:23', '2026-03-16 02:59:23'),
(2, 2, 1, 64500.00, 64500.00, 0.00, 'Cash', NULL, '{\"30\":0}', '200402', '2026-03-16', '2026-03-16 03:30:09', '2026-03-16 03:30:09'),
(3, 3, 2, 30000.00, 30000.00, 0.00, 'Cash', NULL, '{\"40\":9}', '200403', '2026-03-05', '2026-03-16 03:49:46', '2026-03-16 03:49:46'),
(4, 4, 1, 35000.00, 30000.00, 5000.00, 'Cash', NULL, '{\"40\":8}', '200404', '2026-03-16', '2026-03-16 03:50:34', '2026-03-16 03:50:34'),
(5, 5, 1, 105000.00, 104801.00, 199.00, 'Cash', NULL, '{\"41\":0}', '200405', '2026-03-16', '2026-03-16 04:47:19', '2026-03-16 04:47:19'),
(6, 6, 5, 153000.00, 151000.00, 2000.00, 'Cash', NULL, '{\"42\":0}', '200406', '2026-03-16', '2026-03-16 05:54:01', '2026-03-16 05:54:01'),
(7, 7, 5, 55000.00, 54000.00, 1000.00, 'Cash', NULL, '{\"44\":0}', '200407', '2026-03-16', '2026-03-16 07:52:25', '2026-03-16 07:52:25'),
(8, 8, 5, 25000.00, 24801.00, 199.00, 'Cash', NULL, '{\"62\":0}', '200408', '2026-03-16', '2026-03-16 08:01:21', '2026-03-16 08:01:21'),
(9, 9, 8, 56000.00, 53800.00, 2200.00, 'Cash', NULL, '{\"90\":0}', '200409', '2026-03-17', '2026-03-17 04:19:53', '2026-03-17 04:19:53'),
(10, 10, 8, 30000.00, 30000.00, 0.00, 'Cash', NULL, '{\"114\":0}', '200410', '2026-04-02', '2026-04-04 05:31:05', '2026-04-04 05:31:05'),
(11, 11, 8, 13000.00, 13000.00, 0.00, 'Cash', NULL, '{\"110\":0}', '200411', '2026-04-02', '2026-04-04 05:34:38', '2026-04-04 05:34:38'),
(12, 12, 8, 39000.00, 39000.00, 0.00, 'Cash', NULL, '{\"107\":0}', '200412', '2026-04-03', '2026-04-04 05:40:17', '2026-04-04 05:40:17'),
(13, 13, 8, 151000.00, 151000.00, 0.00, 'Cash', NULL, '{\"95\":0}', '200413', '2026-04-02', '2026-04-04 05:42:52', '2026-04-04 05:42:52'),
(14, 14, 8, 39000.00, 39000.00, 0.00, 'Cash', NULL, '{\"93\":0}', '200414', '2026-04-04', '2026-04-04 05:48:48', '2026-04-04 05:48:48'),
(15, 15, 8, 34000.00, 31000.00, 3000.00, 'Cash', NULL, '{\"91\":0}', '200415', '2026-04-04', '2026-04-04 05:53:14', '2026-04-04 05:53:14'),
(16, 16, 8, 98000.00, 97500.00, 500.00, 'Cash', NULL, '{\"89\":0}', '200416', '2026-04-04', '2026-04-04 05:54:22', '2026-04-04 05:54:22'),
(17, 17, 8, 60000.00, 59500.00, 500.00, 'Cash', NULL, '{\"88\":0}', '200417', '2026-04-04', '2026-04-04 05:55:34', '2026-04-04 05:55:34'),
(18, 18, 8, 81000.00, 77000.00, 4000.00, 'Cash', NULL, '{\"86\":0}', '200418', '2026-04-04', '2026-04-04 05:57:10', '2026-04-04 05:57:10'),
(19, 19, 8, 25000.00, 22000.00, 3000.00, 'Cash', NULL, '{\"76\":0}', '200419', '2026-04-02', '2026-04-06 00:42:25', '2026-04-06 00:42:25'),
(20, 20, 8, 27500.00, 27500.00, 0.00, 'Cash', NULL, '{\"85\":0}', '200420', '2026-04-03', '2026-04-06 00:45:38', '2026-04-06 00:45:38'),
(21, 21, 8, 30000.00, 25500.00, 4500.00, 'Cash', NULL, '{\"82\":0}', '200421', '2026-04-01', '2026-04-06 00:46:58', '2026-04-06 00:46:58'),
(22, 22, 8, 37000.00, 34000.00, 3000.00, 'Cash', NULL, '{\"73\":0}', '200422', '2026-04-06', '2026-04-06 00:52:44', '2026-04-06 00:52:44'),
(23, 23, 8, 30000.00, 30000.00, 0.00, 'Cash', NULL, '{\"74\":0}', '200423', '2026-04-02', '2026-04-06 01:01:56', '2026-04-06 01:01:56'),
(24, 24, 8, 40500.00, 39500.00, 1000.00, 'Cash', NULL, '{\"84\":0}', '200424', '2026-04-01', '2026-04-06 01:04:25', '2026-04-06 01:04:25'),
(25, 25, 8, 30000.00, 25000.00, 5000.00, 'Cash', NULL, '{\"113\":0}', '200425', '2026-04-06', '2026-04-06 01:27:29', '2026-04-06 01:27:29'),
(26, 26, 8, 18000.00, 12700.00, 5300.00, 'Cash', NULL, '{\"144\":0}', '200426', '2026-04-09', '2026-04-09 00:14:53', '2026-04-09 00:14:53'),
(27, 27, 8, 58000.00, 58000.00, 0.00, 'Cash', NULL, '{\"141\":0}', '200427', '2026-04-09', '2026-04-09 00:22:39', '2026-04-09 00:22:39'),
(28, 28, 8, 51000.00, 48000.00, 3000.00, 'Cash', NULL, '{\"83\":0}', '200428', '2026-04-09', '2026-04-09 00:24:31', '2026-04-09 00:24:31'),
(29, 29, 8, 15000.00, 13000.00, 2000.00, 'Cash', NULL, '{\"143\":0}', '200429', '2026-04-13', '2026-04-18 00:27:11', '2026-04-18 00:27:11'),
(30, 30, 8, 15000.00, 9100.00, 5900.00, 'Cash', NULL, '{\"139\":0}', '200430', '2026-04-18', '2026-04-18 00:32:16', '2026-04-18 00:32:16'),
(31, 26, 8, 21000.00, 19000.00, 2000.00, 'Cash', NULL, '{\"138\":0}', '200431', '2026-04-01', '2026-04-18 00:34:38', '2026-04-18 00:34:38'),
(32, 31, 8, 13000.00, 10000.00, 3000.00, 'Cash', NULL, '{\"136\":0}', '200432', '2026-04-01', '2026-04-18 00:37:57', '2026-04-18 00:37:57'),
(33, 32, 8, 58000.00, 56000.00, 2000.00, 'Cash', NULL, '{\"103\":0}', '200433', '2026-04-09', '2026-04-18 00:50:15', '2026-04-18 00:50:15'),
(34, 32, 8, 68000.00, 62000.00, 6000.00, 'Cash', NULL, '{\"96\":0}', '200434', '2026-04-14', '2026-04-18 00:51:09', '2026-04-18 00:51:09'),
(35, 33, 8, 53000.00, 46000.00, 7000.00, 'Cash', NULL, '{\"87\":0}', '200435', '2026-04-13', '2026-04-18 00:52:20', '2026-04-18 00:52:20'),
(36, 32, 8, 45000.00, 40500.00, 4500.00, 'Cash', NULL, '{\"81\":0}', '200436', '2026-04-13', '2026-04-18 00:56:11', '2026-04-18 00:56:11'),
(37, 34, 8, 78000.00, 78000.00, 0.00, 'Cash', NULL, '{\"142\":0}', '200437', '2026-04-22', '2026-04-21 23:40:39', '2026-04-21 23:40:39');

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
  `status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sales_items`
--

INSERT INTO `sales_items` (`id`, `sale_id`, `purchase_id`, `product_id`, `brand`, `model`, `variant`, `ram`, `rom`, `color`, `imei`, `battery_health`, `quantity`, `price`, `custom_price`, `subtotal`, `status`, `created_at`, `updated_at`) VALUES
(7, 7, 44, 20, 'Apple', 'iPhone 13 Pro', 'Japan', '4GB', '256GB', 'Graphite', '354980618151190', '88', 1, 55000.00, NULL, 55000.00, NULL, '2026-03-16 07:52:25', '2026-03-16 07:52:25'),
(8, 8, 62, 81, 'Motorola', 'Motorola G96 5G', 'India', '8GB', '128GB', 'Green', '354080685909073', '100', 1, 25000.00, NULL, 25000.00, NULL, '2026-03-16 08:01:21', '2026-03-16 08:01:21'),
(9, 9, 90, 20, 'Apple', 'iPhone 13 Pro', 'USA', '6GB', '256GB', 'Black', '358823340711699', '88', 1, 56000.00, 56000.00, 56000.00, NULL, '2026-03-17 04:19:53', '2026-03-17 04:19:53'),
(10, 10, 114, 83, 'Samsung', 'galaxy s22 plus', 'Japan', '8GB', '256GB', 'White', '350865892275647', '100', 1, 30000.00, 30000.00, 30000.00, NULL, '2026-04-04 05:31:05', '2026-04-04 05:31:05'),
(11, 11, 110, 88, 'Samsung', 'Samsung A15', 'Japan', '8GB', '128GB', 'Blue', '351211130463746', '100', 1, 13000.00, 13000.00, 13000.00, NULL, '2026-04-04 05:34:38', '2026-04-04 05:34:38'),
(12, 12, 107, 17, 'Apple', 'iPhone 13', 'USA', '6GB', '128GB', 'Phantom Pink', '352941885260132', '89%', 1, 39000.00, 39000.00, 39000.00, NULL, '2026-04-04 05:40:17', '2026-04-04 05:40:17'),
(13, 13, 95, 61, 'Samsung', 'S26 Ultra', 'Vietnam', '12GB', '512GB', 'Blue', '356028673428059', '100', 1, 151000.00, 151000.00, 151000.00, NULL, '2026-04-04 05:42:52', '2026-04-04 05:42:52'),
(14, 14, 93, 15, 'Apple', 'iPhone 12 Pro', 'USA', '6GB', '256GB', 'Sierra Blue', '358522145960853', '83', 1, 39000.00, 39000.00, 39000.00, NULL, '2026-04-04 05:48:48', '2026-04-04 05:48:48'),
(15, 15, 91, 15, 'Apple', 'iPhone 12 Pro', 'USA', '6GB', '128GB', 'Gold', '351001687583065', '88', 1, 34000.00, NULL, 34000.00, NULL, '2026-04-04 05:53:14', '2026-04-04 05:53:14'),
(16, 16, 89, 30, 'Apple', 'iPhone 15 Pro Max', 'Singapore', '8GB', '256GB', 'Natural Titanium', '358560153457198', '90', 1, 98000.00, NULL, 98000.00, NULL, '2026-04-04 05:54:22', '2026-04-04 05:54:22'),
(17, 17, 88, 26, 'Apple', 'iPhone 15', 'Australia', '4GB', '128GB', 'Black', '357261917718816', '84', 1, 60000.00, NULL, 60000.00, NULL, '2026-04-04 05:55:34', '2026-04-04 05:55:34'),
(18, 18, 86, 29, 'Apple', 'iPhone 15 Pro', 'HongKong', '8GB', '256GB', 'Natural Titanium', '358819900082729', '82', 1, 81000.00, NULL, 81000.00, NULL, '2026-04-04 05:57:10', '2026-04-04 05:57:10'),
(19, 19, 76, 79, 'Samsung', 'Galaxy S22', 'Global', '8GB', '128GB', 'Alpine Green', '351334332081031', '100', 1, 25000.00, 25000.00, 25000.00, NULL, '2026-04-06 00:42:25', '2026-04-06 00:42:25'),
(20, 20, 85, 13, 'Apple', 'iPhone 11 Pro Max', 'Singapore', '4GB', '64GB', 'Gray', '353918102051170', '64', 1, 27500.00, 27500.00, 27500.00, NULL, '2026-04-06 00:45:38', '2026-04-06 00:45:38'),
(21, 21, 82, 8, 'Apple', 'iPhone XS Max', 'India', '4GB', '256GB', 'Black', '357285098406602', '92', 1, 30000.00, NULL, 30000.00, NULL, '2026-04-06 00:46:58', '2026-04-06 00:46:58'),
(22, 22, 73, 82, 'Samsung', 'Galaxy Fold 4', 'USA', '12GB', '512GB', 'Gold', '351787741538737', '100', 1, 37000.00, NULL, 37000.00, NULL, '2026-04-06 00:52:44', '2026-04-06 00:52:44'),
(23, 23, 74, 83, 'Samsung', 'galaxy s22 plus', 'Japan', '8GB', '128GB', 'Black', '35723480677112', '100', 1, 30000.00, NULL, 30000.00, NULL, '2026-04-06 01:01:56', '2026-04-06 01:01:56'),
(24, 24, 84, 15, 'Apple', 'iPhone 12 Pro', 'USA', '6GB', '256GB', 'Gold', '356462520451768', '88', 1, 40500.00, NULL, 40500.00, NULL, '2026-04-06 01:04:25', '2026-04-06 01:04:25'),
(25, 25, 113, 14, 'Apple', 'iPhone 12', 'HongKong', '6GB', '128GB', 'Green', '353032114098276', '79', 1, 30000.00, NULL, 30000.00, NULL, '2026-04-06 01:27:29', '2026-04-06 01:27:29'),
(26, 26, 144, 6, 'Apple', 'iPhone X', 'Dubai', '3GB', '64GB', 'Black', '353049099497745', '100', 1, 18000.00, NULL, 18000.00, NULL, '2026-04-09 00:14:53', '2026-04-09 00:14:53'),
(27, 27, 141, 30, 'Apple', 'iPhone 15 Pro Max', 'HongKong', '12GB', '256GB', 'Natural Titanium', '350091872592931', '96', 1, 58000.00, 58000.00, 58000.00, NULL, '2026-04-09 00:22:39', '2026-04-09 00:22:39'),
(28, 28, 83, 16, 'Apple', 'iPhone 12 Pro Max', 'Singapore', '6GB', '128GB', 'Blue', '353369288895883', '84', 1, 51000.00, NULL, 51000.00, NULL, '2026-04-09 00:24:31', '2026-04-09 00:24:31'),
(29, 29, 143, 94, 'Apple', 'iPhone 7 plus', 'HongKong', '3GB', '256GB', 'Gold', '355354081357420', '100', 1, 15000.00, NULL, 15000.00, NULL, '2026-04-18 00:27:11', '2026-04-18 00:27:11'),
(30, 30, 139, 92, 'Samsung', 'Samsung F13', 'Global', '6GB', '128GB', 'Blue', '353828958063345', '100', 1, 15000.00, NULL, 15000.00, NULL, '2026-04-18 00:32:16', '2026-04-18 00:32:16'),
(31, 31, 138, 59, 'Samsung', 'Samsung S20 5G', 'Global', '12GB', '128GB', 'Graphite', '357970621631699', '100', 1, 21000.00, NULL, 21000.00, NULL, '2026-04-18 00:34:38', '2026-04-18 00:34:38'),
(32, 32, 136, 91, 'Samsung', 'Samsung F22', 'Global', '6GB', '128GB', 'Black', '357661640115810', '100', 1, 13000.00, NULL, 13000.00, NULL, '2026-04-18 00:37:57', '2026-04-18 00:37:57'),
(33, 33, 103, 21, 'Apple', 'iPhone 13 Pro Max', 'Brazil', '6GB', '128GB', 'Black', '352362883762666', '89', 1, 58000.00, NULL, 58000.00, NULL, '2026-04-18 00:50:15', '2026-04-18 00:50:15'),
(34, 34, 96, 24, 'Apple', 'iPhone 14 Pro', 'Korean', '6GB', '128GB', 'Black', '358267719968847', '94', 1, 68000.00, NULL, 68000.00, NULL, '2026-04-18 00:51:09', '2026-04-18 00:51:09'),
(35, 35, 87, 22, 'Apple', 'iPhone 14', 'China', '6GB', '128GB', 'White', '359529189483022', '88', 1, 53000.00, NULL, 53000.00, NULL, '2026-04-18 00:52:20', '2026-04-18 00:52:20'),
(36, 36, 81, 17, 'Apple', 'iPhone 13', 'China', '6GB', '128GB', 'White', '35 5657926800986', '89', 1, 45000.00, NULL, 45000.00, NULL, '2026-04-18 00:56:11', '2026-04-18 00:56:11'),
(37, 37, 142, 70, 'Samsung', 'Galaxy S24 Ultra', 'Global', '12GB', '256GB', 'Natural Titanium', '351123962602517', '100', 1, 78000.00, NULL, 78000.00, NULL, '2026-04-21 23:40:39', '2026-04-21 23:40:39');

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

--
-- Dumping data for table `stock_manages`
--

INSERT INTO `stock_manages` (`id`, `purchase_id`, `from_branch`, `to_branch`, `quantity`, `transfer_date`, `created_at`, `updated_at`) VALUES
(1, 102, 'Eastern Plaza', 'Bashundhara City', 1, '2026-04-01 07:42:56', '2026-04-01 07:42:56', '2026-04-01 07:42:56'),
(2, 92, 'Eastern Plaza', 'Bashundhara City', 1, '2026-04-04 05:28:02', '2026-04-04 05:28:02', '2026-04-04 05:28:02'),
(3, 94, 'Eastern Plaza', 'Bashundhara City', 1, '2026-04-04 05:43:55', '2026-04-04 05:43:55', '2026-04-04 05:43:55'),
(4, 80, 'Eastern Plaza', 'Bashundhara City', 1, '2026-04-05 23:10:32', '2026-04-05 23:10:32', '2026-04-05 23:10:32'),
(5, 112, 'Eastern Plaza', 'Bashundhara City', 1, '2026-04-06 00:43:25', '2026-04-06 00:43:25', '2026-04-06 00:43:25'),
(6, 104, 'Eastern Plaza', 'Bashundhara City', 1, '2026-04-06 00:44:19', '2026-04-06 00:44:19', '2026-04-06 00:44:19'),
(7, 137, 'Eastern Plaza', 'Bashundhara City', 1, '2026-04-18 00:35:27', '2026-04-18 00:35:27', '2026-04-18 00:35:27'),
(8, 52, 'Bashundhara City', 'Company', 1, '2026-04-21 23:35:01', '2026-04-21 23:35:01', '2026-04-21 23:35:01');

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
(1, 'admin', 'Emran', '017XXXXXXXX', 'EM Center', 'admin@easternmobile.com', '$2y$12$8C2cFVru1R7EsdScrIksRuWPax5vZGajYFEkKb141pueZunU5koGm', NULL, NULL, 1, '2026-03-07 07:16:22', NULL, NULL, '2026-03-07 07:16:22', '2026-03-07 07:16:22', NULL),
(2, 'admin', 'Jhini', '017XXXXXXXX', 'EM Center', 'adminm@easternmobile.com', '$2y$12$Da.UkaY0DfXUfGB6YiBh1eTYxwB/Sk1CUU4qgTuhF8IxNAGFNTeUm', NULL, NULL, 1, '2026-03-07 07:16:22', NULL, NULL, '2026-03-07 07:16:22', '2026-03-07 07:16:22', NULL),
(3, 'admin', 'Nur Mohammad', '018XXXXXXXX', 'Jamuna Future Park', 'jfp01#sales@easternmobile.com', '$2y$12$q9hK11jqFdKEBAmKI4NOWORDHKyXsc8MR866ZIztvSxx1hvwqQG1m', NULL, NULL, 1, '2026-03-07 07:16:23', NULL, NULL, '2026-03-07 07:16:23', '2026-03-07 07:16:23', NULL),
(4, 'Sales Person', 'Ahsan', '018XXXXXXXX', 'Jamuna Future Park', 'jfp02#sales@easternmobile.com', '$2y$12$4HEUXSe6WclP8Djtw9yDxOV1C8yqEW/LREsto76pw714ppeNdFRIu', NULL, NULL, 1, '2026-03-07 07:16:23', NULL, NULL, '2026-03-07 07:16:23', '2026-03-07 07:16:23', NULL),
(5, 'Sales Person', 'Joy', '018XXXXXXXX', 'Bashundhara City Shopping Complex', 'bdcl01sales@easternmobile.com', '$2y$12$xiH6S9M68i.97poGbREvYedBIomjaEUwvRNz4q.duEt9Q1HA8J6pO', NULL, NULL, 1, '2026-03-07 07:16:23', NULL, NULL, '2026-03-07 07:16:23', '2026-03-07 07:16:23', NULL),
(6, 'Sales Person', 'Pappu', '018XXXXXXXX', 'Bashundhara City Shopping Complex', 'bdcl02sales@easternmobile.com', '$2y$12$RL42ZbSj4sC3.OQjvRogu.8aSB.HOoFVI7M3wEXBuUprM4x6d39ne', NULL, NULL, 1, '2026-03-07 07:16:24', NULL, NULL, '2026-03-07 07:16:24', '2026-03-07 07:16:24', NULL),
(7, 'Sales Person', 'Tanjid', '018XXXXXXXX', 'Eastern Plaza', 'ep01sales@easternmobile.com', '$2y$12$kVpwsLx2wtbxiZMdzOVfjuuFg2si.jkfvIHPG6auxP87H8mjxlo4a', NULL, NULL, 1, '2026-03-07 07:16:24', NULL, NULL, '2026-03-07 07:16:24', '2026-03-07 07:16:24', NULL),
(8, 'Sales Person', 'Fida', '018XXXXXXXX', 'Eastern Plaza', 'ep02sales@easternmobile.com', '$2y$12$61iDhvkV6075gMW2s4bTpOS2Bo4MQG6R52E1Jzxy2ErZlWSeTGrue', NULL, NULL, 1, '2026-03-07 07:16:24', NULL, NULL, '2026-03-07 07:16:24', '2026-03-07 07:16:24', NULL),
(9, 'admin', 'Abir', '017XXXXXXXX', 'EM Center', 'admind@easternmobile.com', '$2y$12$5gVFfFm34cd4CSWZ1bGX2.Iej5ZSemZOhp9ZOuGXjlH.g/o77i3X6', NULL, NULL, 1, '2026-03-07 18:08:13', NULL, NULL, '2026-03-07 18:08:13', '2026-03-07 18:08:13', NULL);

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
  ADD KEY `purchases_product_id_foreign` (`product_id`);

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
  ADD UNIQUE KEY `invoice_code` (`invoice_code`);

--
-- Indexes for table `sales_items`
--
ALTER TABLE `sales_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_sale` (`sale_id`),
  ADD KEY `fk_purchase` (`purchase_id`);

--
-- Indexes for table `sales_returns`
--
ALTER TABLE `sales_returns`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sales_returns_imei_unique` (`imei`),
  ADD KEY `sales_returns_sale_id_index` (`sale_id`),
  ADD KEY `sales_returns_product_id_index` (`product_id`),
  ADD KEY `sales_returns_purchase_id_index` (`purchase_id`),
  ADD KEY `sales_returns_customer_id_index` (`customer_id`);

--
-- Indexes for table `stock_manages`
--
ALTER TABLE `stock_manages`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=214;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=96;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT for table `purchase_returns`
--
ALTER TABLE `purchase_returns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `sales_items`
--
ALTER TABLE `sales_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `sales_returns`
--
ALTER TABLE `sales_returns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stock_manages`
--
ALTER TABLE `stock_manages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
-- Constraints for table `sales_items`
--
ALTER TABLE `sales_items`
  ADD CONSTRAINT `fk_purchase` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_sale` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
