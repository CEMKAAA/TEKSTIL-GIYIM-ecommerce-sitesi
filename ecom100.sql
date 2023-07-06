-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 16, 2020 at 03:25 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecom6`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` int(11) NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `type`, `mobile`, `email`, `email_verified_at`, `password`, `image`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'amit gupta', 'admin', '1230000000', 'admin@admin.com', NULL, '$2y$10$l0PdwaVyyGTr1cWZIhdWv.QaZJvdEFYR6zRZ6vmTWVkjPp/BeJSLu', '98185.jpg', 1, NULL, NULL, '2020-09-06 15:37:57'),
(2, 'john', 'subadmin', '980000000', 'john@admin.com', NULL, '$2y$10$l0PdwaVyyGTr1cWZIhdWv.QaZJvdEFYR6zRZ6vmTWVkjPp/BeJSLu', '', 1, NULL, NULL, NULL),
(3, 'steve', 'subadmin', '980000000', 'steve@admin.com', NULL, '$2y$10$l0PdwaVyyGTr1cWZIhdWv.QaZJvdEFYR6zRZ6vmTWVkjPp/BeJSLu', '', 1, NULL, NULL, NULL),
(4, 'amit', 'admin', '980000000', 'amit@admin.com', NULL, '$2y$10$l0PdwaVyyGTr1cWZIhdWv.QaZJvdEFYR6zRZ6vmTWVkjPp/BeJSLu', '', 1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `banners`
--

CREATE TABLE `banners` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `banners`
--

INSERT INTO `banners` (`id`, `image`, `link`, `title`, `alt`, `status`, `created_at`, `updated_at`) VALUES
(1, '1.png-57514.png', 'http://www.sitemakers.in', 'Black Jacket', 'Black Jacket', 1, '2020-08-06 09:56:49', '2020-08-09 07:46:42'),
(2, '2.png-50065.png', NULL, NULL, NULL, 1, '2020-08-06 09:57:06', '2020-08-09 07:46:43'),
(3, '3.png-32521.png', NULL, 'Blue T-Shirt', 'Blue T-Shirt on discount', 1, '2020-08-06 09:57:17', '2020-08-09 07:46:44');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Gap', 1, '2020-07-02 08:45:52', '2020-07-02 09:00:29'),
(2, 'Lee', 1, '2020-07-02 08:49:32', '2020-07-02 08:59:47'),
(3, 'Monte Carlo', 1, '2020-07-02 08:53:21', '2020-07-05 06:16:08'),
(4, 'Arrow', 1, '2020-07-02 08:53:32', '2020-07-02 08:53:32');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `session_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `session_id`, `user_id`, `product_id`, `size`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 'zZcBWVxc4ffiQtuwHYGMTV7kaEVeee5RyVsgqghB', 0, 1, 'Medium', 1, '2020-11-16 08:28:26', '2020-11-16 08:28:26'),
(3, 'mbL0TpSHcD1qNke7wtOcUmAdknDftmw239anD90s', 1, 1, 'Large', 1, '2020-11-16 08:47:22', '2020-11-16 08:47:22'),
(4, 'mbL0TpSHcD1qNke7wtOcUmAdknDftmw239anD90s', 0, 5, 'Small', 1, '2020-11-16 08:52:06', '2020-11-16 08:52:06');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `category_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_discount` double(8,2) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_keywords` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `section_id`, `category_name`, `category_image`, `category_discount`, `description`, `url`, `meta_title`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 0, 1, 'T-Shirts', '70905.jpg', 20.00, 'T-Shirts is having lot of variety', 'tshirts', 'T-Shirts', 'T-Shirts is having lot of variety', 't-shirts, good quality', 1, '2020-04-05 03:17:17', '2020-08-13 09:52:39'),
(2, 0, 1, 'Shirts', '', 0.00, '', 'shirts', '', '', '', 1, '2020-04-05 03:25:46', '2020-08-13 09:14:45'),
(3, 0, 1, 'Denims', '', 0.00, '', 'denims', '', '', '', 1, '2020-04-05 03:26:55', '2020-07-25 09:23:49'),
(4, 1, 1, 'Casual T-Shirts', '', 0.00, 'This is the Casual T-Shirts Category having the variety of casual t-shirts of various brands.', 'casual-t-shirts', '', '', '', 1, '2020-04-30 11:09:53', '2020-10-08 09:53:54'),
(5, 0, 2, 'Denims', '', 0.00, '', 'denims-women', '', '', '', 1, '2020-05-09 22:30:55', '2020-05-09 22:30:55'),
(6, 0, 3, 'T-Shirts', '', 0.00, '', 'kids-tshirts', '', '', '', 1, '2020-07-21 09:23:07', '2020-07-25 09:22:38'),
(7, 1, 1, 'Formal T-shirts', '', 0.00, '', 'formal-t-shirts', '', '', '', 1, '2020-07-21 09:24:13', '2020-07-25 09:23:50'),
(9, 8, 1, 'testa', '', 0.00, '', 'testa', '', '', '', 1, '2020-07-30 08:22:02', '2020-07-30 08:22:02'),
(10, 8, 1, 'testb', '', 0.00, '', 'testb', '', '', '', 1, '2020-07-30 08:22:25', '2020-07-30 08:22:25');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_02_16_103242_create_admins_table', 2),
(5, '2020_03_19_164829_create_sections_table', 3),
(6, '2020_04_05_064412_create_categories_table', 4),
(7, '2020_04_30_161949_create_products_table', 5),
(8, '2020_05_29_021158_create_products_attributes_table', 6),
(9, '2020_06_19_142017_create_products_images_table', 7),
(10, '2020_06_28_125628_create_brands_table', 8),
(11, '2020_07_05_113748_add_column_to_products', 9),
(12, '2020_08_03_120709_create_banners_table', 10),
(13, '2020_09_24_124906_create_carts_table', 11),
(15, '2020_11_08_032234_add_columns_to_users_table', 12);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `brand_id` int(11) NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_price` double(8,2) NOT NULL,
  `product_discount` double(8,2) DEFAULT 0.00,
  `product_weight` double(8,2) DEFAULT NULL,
  `product_video` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `main_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `wash_care` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fabric` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pattern` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sleeve` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fit` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `occasion` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_featured` enum('No','Yes') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'No',
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `section_id`, `brand_id`, `product_name`, `product_code`, `product_color`, `product_price`, `product_discount`, `product_weight`, `product_video`, `main_image`, `description`, `wash_care`, `fabric`, `pattern`, `sleeve`, `fit`, `occasion`, `meta_title`, `meta_description`, `meta_keywords`, `is_featured`, `status`, `created_at`, `updated_at`) VALUES
(1, 4, 1, 4, 'Blue Casual T-shirt', 'BT001', 'Blue', 500.00, 10.00, NULL, '', 'plain-t-shirt-500x500.png-84845.png', 'This is the cotton Blue Casual T-Shirt for every person. You can wear in summers and feel good.', NULL, 'Cotton', NULL, 'Half Sleeve', 'Slim', NULL, NULL, NULL, NULL, 'Yes', 1, '2020-05-13 09:23:42', '2020-10-08 09:54:24'),
(2, 4, 1, 1, 'Red Casual Tshirt', 'RC001', 'Red', 500.00, 15.00, NULL, '', 'mens-t-shirt-500x500-2.jpg-15168.jpg', NULL, NULL, 'Cotton', 'Plain', 'Half Sleeve', 'Slim', 'Casual', NULL, NULL, NULL, 'Yes', 1, '2020-05-16 22:27:58', '2020-10-11 06:08:42'),
(3, 4, 1, 2, 'Red Casual Tshirt', 'Red101', 'Red', 1500.00, 0.00, NULL, 'SampleVideo_640x360_1mb.mp4-1163624454.mp4', '', NULL, NULL, 'Polyester', 'Checked', 'Full Sleeve', 'Regular', 'Formal', NULL, NULL, NULL, 'Yes', 1, '2020-05-16 22:37:47', '2020-10-08 09:33:10'),
(4, 4, 1, 2, 'Black Casual T-Shirt', 'BL0001', 'Black', 1500.00, NULL, NULL, '', 'images.jpeg-92918.jpeg', NULL, NULL, 'Polyester', 'Printed', 'Half Sleeve', 'Regular', 'Casual', 'test title', 'test desc', 'test keywords', 'Yes', 1, '2020-05-20 08:51:34', '2020-09-05 08:59:52'),
(5, 4, 1, 1, 'Purple Casual T-Shirt', 'PCT001', 'Purple', 300.00, 0.00, NULL, '', 'blank-t-shirt-500x500.jpg-69653.jpg', 'test product', NULL, 'Cotton', 'Plain', 'Half Sleeve', 'Regular', 'Casual', NULL, NULL, NULL, 'Yes', 1, '2020-07-05 06:28:25', '2020-10-11 06:32:31'),
(6, 4, 1, 3, 'MC Casual Tshirt', 'MCT001', 'Blue', 1000.00, NULL, NULL, '', 'plain-t-shirt-500x500.png-61576.png', NULL, NULL, 'Cotton', 'Plain', 'Half Sleeve', 'Regular', 'Casual', NULL, NULL, NULL, 'Yes', 1, '2020-07-30 08:34:44', '2020-09-05 09:00:37'),
(7, 7, 1, 1, 'Blue Formal T-shirt', 'BDT001', 'Blue', 1500.00, NULL, NULL, '', '', NULL, NULL, 'Wool', 'Self', 'Full Sleeve', 'Regular', 'Formal', NULL, NULL, NULL, 'No', 1, '2020-08-13 09:39:15', '2020-09-05 09:01:00'),
(8, 9, 1, 1, 'testa pro', 'testapro', 'red', 1000.00, NULL, NULL, '', 'mens-t-shirt-500x500.jpg-3583.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'No', 1, '2020-10-04 21:13:26', '2020-10-04 21:13:26');

-- --------------------------------------------------------

--
-- Table structure for table `products_attributes`
--

CREATE TABLE `products_attributes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `size` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(8,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products_attributes`
--

INSERT INTO `products_attributes` (`id`, `product_id`, `size`, `price`, `stock`, `sku`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'Small', 500.00, 10, 'BTS001-S', 0, '2020-06-05 09:24:45', '2020-10-08 09:07:32'),
(2, 1, 'Medium', 600.00, 20, 'BTS001-M', 1, '2020-06-05 09:24:45', '2020-10-08 09:07:32'),
(5, 4, 'Small', 1500.00, 10, 'BL0001-S', 0, '2020-06-09 09:13:27', '2020-06-09 09:13:27'),
(6, 4, 'Medium', 1600.00, 10, 'BL0001-M', 0, '2020-06-09 09:13:27', '2020-06-09 09:13:27'),
(7, 4, 'Large', 1700.00, 10, 'BL0002-L', 0, '2020-06-09 09:13:27', '2020-06-09 09:13:27'),
(8, 1, 'Large', 700.00, 10, 'BTS001-L', 1, '2020-06-16 09:12:17', '2020-10-08 09:07:32'),
(9, 5, 'Small', 1000.00, 10, 'PCT001-S', 1, '2020-10-02 08:11:22', '2020-10-02 08:11:22'),
(10, 5, 'Medium', 1100.00, 10, 'PCT001-M', 1, '2020-10-02 08:11:22', '2020-10-02 08:11:22'),
(11, 2, 'Small', 500.00, 5, 'RC001-S', 1, '2020-10-02 08:58:45', '2020-10-02 08:58:45'),
(12, 2, 'Medium', 600.00, 10, 'RC001-M', 1, '2020-10-02 08:58:45', '2020-10-02 08:58:45');

-- --------------------------------------------------------

--
-- Table structure for table `products_images`
--

CREATE TABLE `products_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products_images`
--

INSERT INTO `products_images` (`id`, `product_id`, `image`, `status`, `created_at`, `updated_at`) VALUES
(5, 1, '8647561593183114.jpg', 1, '2020-06-26 09:21:54', '2020-06-26 09:21:54'),
(6, 1, '5926441593183114.jpg', 1, '2020-06-26 09:21:54', '2020-06-26 09:21:54');

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE `sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`id`, `name`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Men', 1, NULL, '2020-07-25 09:21:34'),
(2, 'Women', 1, NULL, '2020-07-25 09:21:36'),
(3, 'Kids', 1, NULL, '2020-07-25 09:21:37');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pincode` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `address`, `city`, `state`, `country`, `pincode`, `mobile`, `email`, `email_verified_at`, `password`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'amit', '', '', '', '', '', '9800000000', 'amit@yopmail.com', NULL, '$2y$10$CSRnszgpszki8uOy9XEqYu4KQ6qX/8LX1BpvveAjnVrRLep7TI5G2', 1, NULL, '2020-11-07 22:21:01', '2020-11-07 22:21:01'),
(2, 'amit', '', '', '', '', '', '9800000000', 'amit100@yopmail.com', NULL, '$2y$10$G9yESTtXAxoljzyRPD.JnOokL69/sVGiMaQipZh6tjczyLGj.qYya', 1, NULL, '2020-11-07 22:24:12', '2020-11-07 22:24:12'),
(3, 'amit', '', '', '', '', '', '9800000000', 'amit200@yopmail.com', NULL, '$2y$10$mQyfk.mTOchoNB8EZhtNu.P3Hkks1rIheCjIT6W.0z8F1vcPgtz6.', 1, NULL, '2020-11-07 22:33:56', '2020-11-07 22:33:56'),
(4, 'amit', '', '', '', '', '', '9800000000', 'amit1000@yopmail.com', NULL, '$2y$10$fqifGZCE9Odh/WAzr13LAeNm79xok1Qe4LeAe4bAFEjhmrFgU5BZO', 1, NULL, '2020-11-12 09:23:55', '2020-11-12 09:23:55'),
(5, 'Amit Gupta', '', '', '', '', '', '9800000000', 'amit10000@yopmail.com', NULL, '$2y$10$jrfRvHr4AqA4NAdJJg1a0uZDejVZGpw1EtMWuaUcTVoZtzqy0p49y', 1, NULL, '2020-11-12 09:55:36', '2020-11-12 09:55:36'),
(6, 'Amit Gupta', '', '', '', '', '', '9876543210', 'amit3000@yopmail.com', NULL, '$2y$10$0eDvd89E3CzXbqpnsmzfC.7OfYkC6CucLjBswqR7q6/OONQQrocEy', 1, NULL, '2020-11-14 21:38:28', '2020-11-14 21:38:28');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banners`
--
ALTER TABLE `banners`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`(191));

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products_attributes`
--
ALTER TABLE `products_attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products_images`
--
ALTER TABLE `products_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banners`
--
ALTER TABLE `banners`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `products_attributes`
--
ALTER TABLE `products_attributes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `products_images`
--
ALTER TABLE `products_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `sections`
--
ALTER TABLE `sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
