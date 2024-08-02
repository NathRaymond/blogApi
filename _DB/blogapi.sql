-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Aug 02, 2024 at 02:50 PM
-- Server version: 8.2.0
-- PHP Version: 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blogapi`
--

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

DROP TABLE IF EXISTS `blogs`;
CREATE TABLE IF NOT EXISTS `blogs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `title`, `content`, `created_at`, `updated_at`) VALUES
(1, 'Protest in Lagos, Nigeria', 'The protest has been peaceful, thank God, i got the Job in CourierPlus', '2024-08-02 09:32:36', '2024-08-02 09:48:12'),
(4, 'Protest in Lagos, Nigeria', 'The protest has been peaceful, thank God, i got the Job in CourierPlus', '2024-08-02 13:22:43', '2024-08-02 13:22:43');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_post_id_foreign` (`post_id`),
  KEY `comments_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `post_id`, `user_id`, `content`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Here is the Comement, thank God it works', '2024-08-02 12:34:07', '2024-08-02 12:34:07');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
CREATE TABLE IF NOT EXISTS `likes` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `post_id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `likes_post_id_foreign` (`post_id`),
  KEY `likes_user_id_foreign` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `likes`
--

INSERT INTO `likes` (`id`, `post_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2024-08-02 12:08:20', '2024-08-02 12:08:20');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_08_02_090233_create_blogs_table', 1),
(6, '2024_08_02_090239_create_posts_table', 1),
(7, '2024_08_02_090244_create_likes_table', 1),
(8, '2024_08_02_090305_create_comments_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE IF NOT EXISTS `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `blog_id` bigint UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_blog_id_foreign` (`blog_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `blog_id`, `title`, `content`, `created_at`, `updated_at`) VALUES
(1, 1, 'The protest is going well, Nigeria will be fine', 'God bless nigeria...No record of killing, GLory be to God', '2024-08-02 10:36:46', '2024-08-02 11:02:41');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Mr. Xzavier Wilkinson Sr.', 'zschultz@example.com', '2024-08-02 08:31:02', '$2y$12$iV43KtvqdZ9aLc2DZCkU1O4cZfEdNPoP7sYAQ.yCorHXldowQu4n6', 'dO91jynVyW', '2024-08-02 08:31:02', '2024-08-02 08:31:02'),
(2, 'Angelita Terry', 'hauck.wallace@example.org', '2024-08-02 08:31:02', '$2y$12$iV43KtvqdZ9aLc2DZCkU1O4cZfEdNPoP7sYAQ.yCorHXldowQu4n6', 'Dp8XMvcjzg', '2024-08-02 08:31:02', '2024-08-02 08:31:02'),
(3, 'Dillan Cruickshank', 'boyle.edd@example.net', '2024-08-02 08:31:02', '$2y$12$iV43KtvqdZ9aLc2DZCkU1O4cZfEdNPoP7sYAQ.yCorHXldowQu4n6', 'NoXcsgLNe0', '2024-08-02 08:31:02', '2024-08-02 08:31:02'),
(4, 'Pietro Harber', 'nettie42@example.org', '2024-08-02 08:31:02', '$2y$12$iV43KtvqdZ9aLc2DZCkU1O4cZfEdNPoP7sYAQ.yCorHXldowQu4n6', 'bkHwBgEcPz', '2024-08-02 08:31:02', '2024-08-02 08:31:02'),
(5, 'Ryann Fadel', 'garnett02@example.org', '2024-08-02 08:31:02', '$2y$12$iV43KtvqdZ9aLc2DZCkU1O4cZfEdNPoP7sYAQ.yCorHXldowQu4n6', 'k8mGj2oL8D', '2024-08-02 08:31:02', '2024-08-02 08:31:02'),
(6, 'Desiree Price Sr.', 'keebler.dortha@example.org', '2024-08-02 08:31:02', '$2y$12$iV43KtvqdZ9aLc2DZCkU1O4cZfEdNPoP7sYAQ.yCorHXldowQu4n6', '4eyGAUt2br', '2024-08-02 08:31:02', '2024-08-02 08:31:02'),
(7, 'Myrtle Stokes', 'maegan79@example.org', '2024-08-02 08:31:02', '$2y$12$iV43KtvqdZ9aLc2DZCkU1O4cZfEdNPoP7sYAQ.yCorHXldowQu4n6', 'VU0eMh9wMy', '2024-08-02 08:31:02', '2024-08-02 08:31:02'),
(8, 'Mr. Bartholome Reichel', 'gokeefe@example.com', '2024-08-02 08:31:02', '$2y$12$iV43KtvqdZ9aLc2DZCkU1O4cZfEdNPoP7sYAQ.yCorHXldowQu4n6', 'Xv7FQC5RKE', '2024-08-02 08:31:02', '2024-08-02 08:31:02'),
(9, 'Mollie Kihn', 'aliya28@example.net', '2024-08-02 08:31:02', '$2y$12$iV43KtvqdZ9aLc2DZCkU1O4cZfEdNPoP7sYAQ.yCorHXldowQu4n6', 'qRwJ3DB6SB', '2024-08-02 08:31:02', '2024-08-02 08:31:02'),
(10, 'Dr. Timothy Hand MD', 'mjohnston@example.org', '2024-08-02 08:31:02', '$2y$12$iV43KtvqdZ9aLc2DZCkU1O4cZfEdNPoP7sYAQ.yCorHXldowQu4n6', 'l9ooZwZSAJ', '2024-08-02 08:31:02', '2024-08-02 08:31:02'),
(11, 'Prof. Aliza Gorczany V', 'breanna81@example.net', '2024-08-02 08:56:04', '$2y$12$c6KUpK4WNBRQFlNdJjzTUuCYEFs86Z0aOGlKmQ8SArAm4AWTd/Ez2', 'OYIucOWVHz', '2024-08-02 08:56:04', '2024-08-02 08:56:04'),
(12, 'Dr. Reed Braun', 'nlesch@example.com', '2024-08-02 08:56:04', '$2y$12$c6KUpK4WNBRQFlNdJjzTUuCYEFs86Z0aOGlKmQ8SArAm4AWTd/Ez2', 'c670qypo1a', '2024-08-02 08:56:04', '2024-08-02 08:56:04'),
(13, 'Ona Grimes', 'mclaughlin.viviane@example.com', '2024-08-02 08:56:04', '$2y$12$c6KUpK4WNBRQFlNdJjzTUuCYEFs86Z0aOGlKmQ8SArAm4AWTd/Ez2', 'jChEmDzJ2w', '2024-08-02 08:56:04', '2024-08-02 08:56:04'),
(14, 'Miss Destiny Lowe', 'morar.valentina@example.com', '2024-08-02 08:56:04', '$2y$12$c6KUpK4WNBRQFlNdJjzTUuCYEFs86Z0aOGlKmQ8SArAm4AWTd/Ez2', 'rTUcbG0RZM', '2024-08-02 08:56:04', '2024-08-02 08:56:04'),
(15, 'Abby Balistreri', 'rita.pouros@example.com', '2024-08-02 08:56:04', '$2y$12$c6KUpK4WNBRQFlNdJjzTUuCYEFs86Z0aOGlKmQ8SArAm4AWTd/Ez2', 'VuhNaIMlD5', '2024-08-02 08:56:04', '2024-08-02 08:56:04'),
(16, 'Aletha Ledner II', 'jakubowski.roger@example.net', '2024-08-02 08:56:04', '$2y$12$c6KUpK4WNBRQFlNdJjzTUuCYEFs86Z0aOGlKmQ8SArAm4AWTd/Ez2', 'm0SktWoUU2', '2024-08-02 08:56:04', '2024-08-02 08:56:04'),
(17, 'Crystel Casper', 'bernhard.arjun@example.com', '2024-08-02 08:56:04', '$2y$12$c6KUpK4WNBRQFlNdJjzTUuCYEFs86Z0aOGlKmQ8SArAm4AWTd/Ez2', 'SK2bkjpWea', '2024-08-02 08:56:04', '2024-08-02 08:56:04'),
(18, 'Arden Koepp', 'turcotte.adeline@example.net', '2024-08-02 08:56:04', '$2y$12$c6KUpK4WNBRQFlNdJjzTUuCYEFs86Z0aOGlKmQ8SArAm4AWTd/Ez2', 'R972JUb06l', '2024-08-02 08:56:04', '2024-08-02 08:56:04'),
(19, 'Milford Will', 'burley32@example.org', '2024-08-02 08:56:04', '$2y$12$c6KUpK4WNBRQFlNdJjzTUuCYEFs86Z0aOGlKmQ8SArAm4AWTd/Ez2', 'HKIx1FstSY', '2024-08-02 08:56:04', '2024-08-02 08:56:04'),
(20, 'Mrs. Scarlett Kozey V', 'howell.aracely@example.org', '2024-08-02 08:56:04', '$2y$12$c6KUpK4WNBRQFlNdJjzTUuCYEFs86Z0aOGlKmQ8SArAm4AWTd/Ez2', 'RpUWU7jsx4', '2024-08-02 08:56:04', '2024-08-02 08:56:04');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
