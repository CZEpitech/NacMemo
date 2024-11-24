-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost
-- Généré le : dim. 24 nov. 2024 à 10:53
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `nac`
--

-- --------------------------------------------------------

--
-- Structure de la table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `name`, `slug`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Tes Category', 'tes-category', 'sdfcdsf', 1, '2024-10-06 08:44:31', '2024-10-06 08:45:09'),
(2, 'New Category', 'new-category', 'dsfcds', 1, '2024-10-07 07:59:50', '2024-10-07 07:59:50'),
(3, 'Cat Cat 1', 'cat-cat-1', 'testt', 1, '2024-10-20 04:15:57', '2024-11-18 23:22:43');

-- --------------------------------------------------------

--
-- Structure de la table `blog_comments`
--

CREATE TABLE `blog_comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `comment` text NOT NULL,
  `commented_by` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `blog_comments`
--

INSERT INTO `blog_comments` (`id`, `comment`, `commented_by`, `post_id`, `status`, `created_at`, `updated_at`) VALUES
(31, '<p>daffdsfasdfasdfsadf</p>', 1, 19, 1, '2024-11-21 16:34:44', '2024-11-21 16:46:48'),
(32, 'sfdgfdsaf', 1, 20, 1, '2024-11-22 15:40:23', '2024-11-22 16:27:19'),
(33, 'gfhhdf', 1, 20, 1, '2024-11-22 15:41:31', '2024-11-22 16:27:26'),
(34, 'fdgfg', 1, 20, 1, '2024-11-22 15:42:32', '2024-11-22 16:31:29'),
(35, 'sadfsdfsad', 1, 19, 1, '2024-11-22 16:34:14', '2024-11-23 11:15:28');

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED DEFAULT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `slug` text NOT NULL,
  `status` enum('1','0') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `parent_id`, `name`, `description`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Rongeurs', 'Blabla fff', 'rongeurs', '1', '2021-07-04 12:22:44', '2024-11-23 19:11:10'),
(2, NULL, 'Oiseaux', 'Blablallala', 'oiseaux', '1', '2021-07-04 12:45:56', '2024-10-20 14:33:17'),
(3, NULL, 'Poissons', 'Blabllalala', 'poissons', '1', '2021-07-04 12:46:24', '2024-11-22 15:53:18'),
(4, NULL, 'Lézards', 'Blalbllala', 'lézards', '1', '2021-07-04 12:47:54', '2024-10-20 14:35:03'),
(8, NULL, 'Serpents', 'Blablabla', 'serpents', '1', '2024-10-20 14:36:35', '2024-10-20 14:36:35'),
(9, NULL, 'Autres', 'Blalalala', 'autres', '1', '2024-10-20 14:37:31', '2024-11-18 23:11:24');

-- --------------------------------------------------------

--
-- Structure de la table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `content` text NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `status` enum('1','0') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `comments`
--

INSERT INTO `comments` (`id`, `content`, `user_id`, `item_id`, `status`, `created_at`, `updated_at`) VALUES
(45, 'sadfsdfsdfasdf', 1, 31, '1', '2024-11-19 06:01:27', '2024-11-19 06:01:41'),
(46, 'dsfsdfs', 1, 31, '1', '2024-11-19 06:05:12', '2024-11-19 06:05:17'),
(47, 'Hello admin', 1, 31, '1', '2024-11-19 06:36:51', '2024-11-19 06:37:14'),
(48, 'sdfasdfasd', 31, 31, '1', '2024-11-19 06:39:39', '2024-11-19 18:06:15'),
(49, 'sdfsdf', 31, 31, '1', '2024-11-19 06:42:11', '2024-11-19 18:06:35'),
(50, 'sdfsdf', 31, 31, '1', '2024-11-19 06:43:07', '2024-11-20 17:38:38'),
(51, 'sdafsdfsd', 1, 35, '1', '2024-11-20 17:45:43', '2024-11-20 17:50:14'),
(52, 'dsasdfasd', 1, 35, '1', '2024-11-20 17:46:17', '2024-11-20 17:50:27'),
(53, 'sdafsdf', 1, 35, '1', '2024-11-20 17:46:34', '2024-11-21 04:57:48'),
(54, 'asdfsdf', 1, 35, '1', '2024-11-20 17:51:51', '2024-11-22 15:53:34'),
(55, 'asdfsdfasdf', 1, 35, '1', '2024-11-20 17:52:06', '2024-11-22 15:55:02'),
(56, 'dfdsfs', 1, 35, '1', '2024-11-20 17:58:02', '2024-11-22 15:55:12'),
(57, 'sdfasd', 1, 35, '1', '2024-11-20 18:02:17', '2024-11-22 15:56:53'),
(58, 'asdfsdf', 1, 35, '1', '2024-11-20 18:02:30', '2024-11-22 16:19:59'),
(59, 'sdafsdf', 1, 35, '1', '2024-11-20 18:02:36', '2024-11-22 16:22:17'),
(60, 'asdfasfsd', 31, 38, '1', '2024-11-21 03:26:45', '2024-11-22 16:23:05'),
(61, 'adsfsd', 36, 31, '1', '2024-11-21 04:11:09', '2024-11-22 16:27:38'),
(62, 'dsasdfasd', 1, 43, '1', '2024-11-21 04:57:39', '2024-11-22 16:31:39'),
(63, 'dsdfsdf', 1, 31, '1', '2024-11-23 00:06:13', '2024-11-23 00:06:24'),
(64, 'gdgdsfg', 1, 44, '1', '2024-11-23 00:54:49', '2024-11-23 12:11:34'),
(65, 'Test Fromsss', 1, 29, '1', '2024-11-23 19:52:39', '2024-11-23 19:52:59'),
(66, 'test6', 1, 29, '1', '2024-11-23 19:54:41', '2024-11-23 19:54:50'),
(67, 'qsqsdqsdqsdqs', 1, 49, '0', '2024-11-24 08:52:17', '2024-11-24 08:52:17');

-- --------------------------------------------------------

--
-- Structure de la table `details`
--

CREATE TABLE `details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sex` enum('male','female') DEFAULT NULL,
  `birth_date` date NOT NULL,
  `death_date` date NOT NULL,
  `funeral_date` datetime DEFAULT NULL,
  `funeral_place` text DEFAULT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `details`
--

INSERT INTO `details` (`id`, `sex`, `birth_date`, `death_date`, `funeral_date`, `funeral_place`, `item_id`, `created_at`, `updated_at`) VALUES
(29, 'male', '2024-11-12', '2024-11-12', NULL, 'Paris', 29, '2024-11-13 04:10:01', '2024-11-13 04:10:47'),
(30, 'male', '2024-11-12', '2024-11-12', NULL, 'Paris', 30, '2024-11-13 08:22:04', '2024-11-13 08:22:04'),
(31, 'male', '2024-11-18', '2024-11-28', NULL, 'Paris', 31, '2024-11-19 05:58:53', '2024-11-19 05:58:53'),
(34, 'male', '2024-11-18', '2024-11-22', NULL, 'Paris', 34, '2024-11-19 06:38:45', '2024-11-19 06:38:45'),
(35, 'male', '2024-11-19', '2024-12-07', NULL, 'Paris', 35, '2024-11-19 17:05:48', '2024-11-19 17:05:48'),
(37, 'male', '2024-11-20', '2024-12-07', NULL, 'Paris', 37, '2024-11-20 19:23:51', '2024-11-21 15:35:46'),
(38, 'male', '2024-11-21', '2024-11-30', NULL, 'Paris', 38, '2024-11-20 19:28:22', '2024-11-20 19:28:22'),
(43, 'male', '2024-11-20', '2024-11-30', NULL, 'Paris', 43, '2024-11-21 04:14:06', '2024-11-21 04:14:06'),
(44, 'male', '2024-11-20', '2024-11-21', NULL, 'Paris', 44, '2024-11-21 04:26:26', '2024-11-21 06:52:34'),
(46, 'male', '2024-11-23', '2024-11-23', NULL, 'Test', 46, '2024-11-23 12:51:59', '2024-11-23 12:51:59'),
(47, 'male', '2024-11-24', '2024-11-25', NULL, 'WqsxqsSQ', 47, '2024-11-24 06:04:48', '2024-11-24 06:04:48'),
(48, 'male', '2024-11-24', '2024-11-29', NULL, 'QsxqsqS', 48, '2024-11-24 06:34:37', '2024-11-24 06:34:37'),
(49, 'male', '2024-11-24', '2024-11-26', NULL, 'Azeaze', 49, '2024-11-24 06:58:59', '2024-11-24 06:58:59'),
(50, 'male', '2024-11-25', '2024-11-26', NULL, 'Sdsdqsdsqdqsdqs', 50, '2024-11-24 07:06:26', '2024-11-24 07:06:26'),
(51, 'male', '2024-11-24', '2024-11-28', NULL, 'Qsdqsdqs', 51, '2024-11-24 07:44:49', '2024-11-24 07:44:49');

-- --------------------------------------------------------

--
-- Structure de la table `email_contents`
--

CREATE TABLE `email_contents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `sub_title` varchar(255) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `footer` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `email_contents`
--

INSERT INTO `email_contents` (`id`, `key`, `subject`, `title`, `sub_title`, `content`, `footer`, `created_at`, `updated_at`) VALUES
(1, 'memorial_panding ', 'memorial_panding_subject', 'memorial_panding_title', 'memorial_panding_subtitle', 'memorial_panding_content', 'memorial_panding_footer', '2024-11-20 11:01:52', '2024-11-20 11:01:52'),
(2, 'otp', 'otp subject', 'otp title', 'otp sub title', 'otp content', 'otp footer', '2024-11-20 11:40:39', '2024-11-20 11:40:39'),
(5, 'memorial_approved', 'memorial_Appr_subject', 'memorial_Appr_title', 'memorial_Appr_sub_title', 'memorial_Appr_content', 'memorial_Appr_footer', '2024-11-20 16:15:27', '2024-11-20 16:15:27'),
(6, 'email_verify', 'email_verify_subject', 'email_verify_title', 'email_verify_sub_title', 'email_verify_content', 'email_verify_footer', '2024-11-20 16:16:57', '2024-11-20 16:16:57'),
(7, 'comment_notification', 'comment_notification_subject', 'comment_notification_Title', 'comment_notification_Sub Title', 'comment_notification_Content', 'comment_notification_Footer', '2024-11-20 20:49:14', '2024-11-20 20:49:14'),
(8, 'password_reset', 'password_reset_subject', 'password_reset_title', 'password_reset_sub_title', 'password_reset_content', 'password_reset_footer', '2024-11-23 06:06:19', '2024-11-23 06:06:19');

-- --------------------------------------------------------

--
-- Structure de la table `error_pages`
--

CREATE TABLE `error_pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `error_code` varchar(255) NOT NULL,
  `error_title` varchar(255) NOT NULL,
  `error_message` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `error_pages`
--

INSERT INTO `error_pages` (`id`, `error_code`, `error_title`, `error_message`, `created_at`, `updated_at`) VALUES
(1, '404', '404', 'The page you are looking for is not found. Please go back to home :)', '2024-11-18 21:19:23', '2024-11-19 05:37:27'),
(2, '403', '403 Forbidden!', 'You do not have permission to access this page. Please go back to Home.', '2024-11-18 21:19:29', '2024-11-18 21:19:32'),
(3, '500', 'Whoops! Something Went Wrong', 'We\'re sorry, but the server encountered an error. Please try again later.', '2024-11-18 21:19:35', '2024-11-19 05:30:32'),
(4, '419', 'Session Expired', 'Your session has expired. Please refresh the page and try again.', '2024-11-18 21:19:40', '2024-11-18 21:19:42');

-- --------------------------------------------------------

--
-- Structure de la table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(150) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `footer_descriptions`
--

CREATE TABLE `footer_descriptions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `footer_descriptions`
--

INSERT INTO `footer_descriptions` (`id`, `description`, `address`, `phone`, `email`, `created_at`, `updated_at`) VALUES
(1, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.sdf sdfsd', '205 Helga Spring Rd, Crawford, TN 38752', '+1 23456789', 'my@company.com', '2024-11-20 20:39:30', '2024-11-13 05:39:12');

-- --------------------------------------------------------

--
-- Structure de la table `images`
--

CREATE TABLE `images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `filename` text NOT NULL,
  `imageable_id` bigint(20) UNSIGNED NOT NULL,
  `imageable_type` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `images`
--

INSERT INTO `images` (`id`, `filename`, `imageable_id`, `imageable_type`, `created_at`, `updated_at`) VALUES
(1, 'gr9Oh5kTw9sFHbFPaaDHQSvtTqr6YyxxMoM.jpg', 1, 'App\\Models\\Item', '2024-09-15 17:47:36', '2024-09-15 17:47:36'),
(4, 'FI9VDBjlhYZKUaDZUEhHED8VTZtT8wcy2L6.jpg', 3, 'App\\Models\\Admin\\Blog\\Post', '2024-10-06 09:05:40', '2024-10-06 09:05:40'),
(5, 'DKMHJzAJHwoUKogz1mWMMT25jtLun3N81vU.jpg', 3, 'App\\Models\\Item', '2024-10-14 21:07:49', '2024-10-14 21:07:49'),
(6, 'n7fGyn6TN1PEythUOGpEV5EK0ebfBHk2DEX.jpg', 4, 'App\\Models\\Item', '2024-10-18 11:41:11', '2024-10-18 13:52:06'),
(7, 'PM0iFIdWOKTC5atqrzmuCowK88TpEnahi4b.jpg', 5, 'App\\Models\\Item', '2024-10-18 11:54:52', '2024-10-18 13:51:06'),
(8, 'eh566mDkcKzabZcfz95z5S4yl105e8ysoY8.jpg', 6, 'App\\Models\\Item', '2024-10-18 11:55:58', '2024-10-18 13:52:36'),
(9, 'dQFUaiPaGcnjQ2sWiaUGFPEnIrPzAeWRbC4.jpg', 7, 'App\\Models\\Item', '2024-10-27 21:03:40', '2024-10-27 21:03:40'),
(10, 's6GkLepwbgWqKt4m0EBiJI5HoNg4BANv071.jpg', 8, 'App\\Models\\Item', '2024-10-27 21:04:19', '2024-10-27 21:04:19'),
(11, 'S7NPxcuuKlVuB1siMDvTlFqVqV9eEcbD64n.jpg', 9, 'App\\Models\\Item', '2024-10-27 21:05:51', '2024-10-27 21:05:51'),
(12, 'BIh2xcz9wPB3L5BmIkbzgiF9WveopPbOHr4.jpg', 10, 'App\\Models\\Item', '2024-10-27 21:06:40', '2024-10-27 21:06:40'),
(13, '6qHSA0mAv57tnv7skAUuAMMFKAzQK1e30cw.png', 11, 'App\\Models\\Item', '2024-10-30 09:05:08', '2024-10-30 09:05:08'),
(14, '3zYSJraLov9DSMei1wXfhWyifvqRGHriOui.png', 12, 'App\\Models\\Item', '2024-10-30 09:07:32', '2024-10-30 09:07:32'),
(15, 'FPVjZi6Om6sTXpOZm81YswTLexTwe8EZaCl.jpg', 13, 'App\\Models\\Item', '2024-10-30 09:10:05', '2024-10-30 09:10:05'),
(16, 'YzkhlmRLG4ymmkjVfluIwdg3CYvWXZFU3LB.png', 14, 'App\\Models\\Item', '2024-10-30 09:37:49', '2024-10-30 09:37:49'),
(17, 'DY4fhLEUJiDz24Bdjdzl5i9XHXXmupFkbJL.jpg', 15, 'App\\Models\\Item', '2024-10-30 10:12:54', '2024-10-30 10:12:54'),
(18, 'AaJYoQZaCq1rr9JLaZg4qcHKumsvcQyAPHv.jpg', 16, 'App\\Models\\Item', '2024-10-30 12:58:47', '2024-10-30 12:58:47'),
(19, 'FGvG9M8oiCTgkQVSJ0LLWyjmunH5seksL5D.jpg', 17, 'App\\Models\\Item', '2024-10-30 13:00:15', '2024-10-30 13:00:15'),
(20, 'J2Ad8WoD9XOXdJOilcpCnRZKAwO9snIj1UO.jpg', 18, 'App\\Models\\Item', '2024-11-03 08:33:49', '2024-11-03 08:33:49'),
(21, '1EbdPBFXcjABFX6I8eAUNoAu4EbnZcmPRLh.png', 19, 'App\\Models\\Item', '2024-11-03 21:47:50', '2024-11-03 21:47:50'),
(22, '3xWuVAJ7KlyzRirb5sw4JDlfNlXxQ2Lax0U.jpg', 20, 'App\\Models\\Item', '2024-11-09 20:51:51', '2024-11-09 20:51:51'),
(23, 'wU84bmY91JS1zerARddloOQ22tTVeq5OnI4.jpg', 21, 'App\\Models\\Item', '2024-11-10 03:49:49', '2024-11-10 03:49:49'),
(24, 'X7JtuhSaHAdWx92KiBFBWGuZIx2HCnAv6xG.jpg', 21, 'App\\Models\\Item', '2024-11-10 03:49:50', '2024-11-10 03:49:50'),
(25, 'w7sUsgdNMqjEORg9B6qXu73FbWQPCV0674P.jpg', 21, 'App\\Models\\Item', '2024-11-10 03:49:50', '2024-11-10 03:49:50'),
(26, 'ISe207dfEp0ILFPM4Y9UAcYEndkEG7xBuz7.jpg', 21, 'App\\Models\\Item', '2024-11-10 03:49:50', '2024-11-10 03:49:50'),
(27, 'GM6EBtZqlPG8np7r2Rqr5TZcw7yXdbwRrVx.jpg', 21, 'App\\Models\\Item', '2024-11-10 03:49:50', '2024-11-10 03:49:50'),
(28, 'A7eJyZwvloXQbkIXjIQPNS9xyb9T51AH0GD.jpg', 22, 'App\\Models\\Item', '2024-11-10 05:20:40', '2024-11-10 05:20:40'),
(29, '2M90ElLiAUxmWGIhErqQb8ymEU1iRCuEnoH.jpg', 22, 'App\\Models\\Item', '2024-11-10 05:20:40', '2024-11-10 05:20:40'),
(30, 'klCDnudRkzAa5x2rUhacvlpm4vwDEasIDaY.jpg', 22, 'App\\Models\\Item', '2024-11-10 05:20:40', '2024-11-10 05:20:40'),
(31, 'oETxJfsg5CMlhmqzMKkFOmujKcTExpCfiZb.jpg', 22, 'App\\Models\\Item', '2024-11-10 05:20:40', '2024-11-10 05:20:40'),
(32, 'qFHOqtQubZL8l7wWBye3gsqko8kqUVuFLJG.jpg', 22, 'App\\Models\\Item', '2024-11-10 05:20:41', '2024-11-10 05:20:41'),
(33, 'bUAPuCbg0sCgTSJb8NXmmbNSHzpZuYc1N6i.jpg', 23, 'App\\Models\\Item', '2024-11-11 06:04:06', '2024-11-11 06:04:06'),
(34, '74oZap9jgoC2m7whFvZC7HHFcsZzMfkpoGc.jpg', 23, 'App\\Models\\Item', '2024-11-11 06:04:06', '2024-11-11 06:04:06'),
(35, 'lhJv4mblJKDDUneXj9ajeVXTkz40stQ9IEQ.jpg', 23, 'App\\Models\\Item', '2024-11-11 06:04:06', '2024-11-11 06:04:06'),
(36, 'J28gGJeRPYwQL48jRriCtauOZzwJzOPnkOO.jpg', 23, 'App\\Models\\Item', '2024-11-11 06:04:06', '2024-11-11 06:04:06'),
(37, 'vMjPKLc4Sj28YlwaNB4xUbeYhentx0YJOvl.jpg', 23, 'App\\Models\\Item', '2024-11-11 06:04:06', '2024-11-11 06:04:06'),
(38, '4klaiuI6uKM7CmW5ygsetGmiYuKJ2yT9hlx.jpg', 24, 'App\\Models\\Item', '2024-11-12 21:40:39', '2024-11-12 21:40:39'),
(39, 'b7nbdCgiE5FYM8SlEgCWFofmcSfuXQw6x3b.jpg', 25, 'App\\Models\\Item', '2024-11-12 21:42:14', '2024-11-12 21:42:14'),
(40, '9neKFG1EASg29oZtMWYwPFnyK0mRaJWGWmN.jpg', 26, 'App\\Models\\Item', '2024-11-12 21:43:52', '2024-11-12 21:43:52'),
(42, '5eINIMh0YU4K9rqRgKxyTlrVlAfJXpyxMBu.jpg', 28, 'App\\Models\\Item', '2024-11-12 22:23:46', '2024-11-12 22:23:46'),
(43, 'CKvuB6DCGnaHJycrsaAkCmSQsLXFwcDZMsy.jpg', 27, 'App\\Models\\Item', '2024-11-13 00:14:17', '2024-11-13 00:14:17'),
(44, 'yg2tKR0IiO45HLzu4Oq3TNG28CTACUWdHcj.jpg', 27, 'App\\Models\\Item', '2024-11-13 00:19:22', '2024-11-13 00:19:22'),
(46, '0vZF1bEboAOFywkJmSvfJlCuwHWRMfzTKvK.jpg', 30, 'App\\Models\\Item', '2024-11-13 08:22:04', '2024-11-13 08:22:04'),
(47, 'npKpyZgtmhEx0AVtyGmBwLU2KvqNOqjUuTT.jpg', 31, 'App\\Models\\Item', '2024-11-19 05:58:53', '2024-11-19 05:58:53'),
(48, 'sx5vshm0dILfDJeBEvxiM1aA5kTzQ2bcEN6.jpg', 32, 'App\\Models\\Item', '2024-11-19 06:26:06', '2024-11-19 06:26:06'),
(49, 'uRFr2WxwHjRwTyHA2pz45k2VF3ikG8AIC6Q.jpg', 33, 'App\\Models\\Item', '2024-11-19 06:26:27', '2024-11-19 06:26:27'),
(50, 'OHF9nbArPM3YI0tyDwSDN22ZxDvCeUtWAkS.jpg', 34, 'App\\Models\\Item', '2024-11-19 06:38:45', '2024-11-19 06:38:45'),
(51, '3zrToldsYZ6oShOrL4rizP7v4SiCmRm2o0B.jpg', 35, 'App\\Models\\Item', '2024-11-19 17:05:48', '2024-11-19 17:05:48'),
(52, '2FApjHUDFPRuWflGHVrTN8XP7c8Ktunp1pk.jpg', 36, 'App\\Models\\Item', '2024-11-20 18:08:59', '2024-11-20 18:08:59'),
(53, 'HyOeDGSQU2WZKCEttPbWVyBgRhwz4GkYShs.jpg', 37, 'App\\Models\\Item', '2024-11-20 19:23:51', '2024-11-20 19:23:51'),
(54, 'ZDVQIDmNIXQ2vEjbmUdJWGngGD5FKvptCYK.jpg', 38, 'App\\Models\\Item', '2024-11-20 19:28:22', '2024-11-20 19:28:22'),
(55, 'c86ps392F75secob8CUuriOiFoWNxso4oGS.jpg', 39, 'App\\Models\\Item', '2024-11-20 20:12:52', '2024-11-20 20:12:52'),
(56, '1HhKd3pXSMgDFp5QOJ8JXZH6WsH3U5aSXSV.jpg', 40, 'App\\Models\\Item', '2024-11-20 20:17:01', '2024-11-20 20:17:01'),
(57, 'YknVvJPtfcXpBdX6vJRYbmLD5yBJI7XG4Qm.jpg', 41, 'App\\Models\\Item', '2024-11-20 20:17:16', '2024-11-20 20:17:16'),
(58, 'dDwBUueyVvumH6EjOrVO1t9OpwwuGrorTdz.jpg', 42, 'App\\Models\\Item', '2024-11-20 20:21:40', '2024-11-20 20:21:40'),
(59, 'X6HqFPYLPPYFDqevHBnQRnrL1f1T8wbemJP.jpg', 43, 'App\\Models\\Item', '2024-11-21 04:14:06', '2024-11-21 04:14:06'),
(60, '4MaKKeevKT69vtgZEJvBotixKZS1bu42qXj.jpg', 44, 'App\\Models\\Item', '2024-11-21 04:26:26', '2024-11-21 04:26:26'),
(61, 'FwMUKPZ9VsaFwbJo5zIFEit8PudiuZi6Akq.jpg', 20, 'App\\Models\\Admin\\Blog\\Post', '2024-11-21 06:34:26', '2024-11-21 06:34:26'),
(65, '2RkcrdzkiidgzAUK1QlQ7IgN1RiBzVLcSvn.jpg', 22, 'App\\Models\\Admin\\Blog\\Post', '2024-11-22 22:50:06', '2024-11-22 22:50:06'),
(66, 'PWMGsKYqk9b3yrneHwwv3PK8idUKcVtL3jT.jpg', 23, 'App\\Models\\Admin\\Blog\\Post', '2024-11-22 22:50:45', '2024-11-22 22:50:45'),
(67, 'UEQCfjF8W5dbl06q8Ie25n71OrBTJNjHXsQ.jpg', 24, 'App\\Models\\Admin\\Blog\\Post', '2024-11-23 19:15:44', '2024-11-23 18:47:34'),
(68, 'hYVCNrw3XGm7WO07kOIiMiEqQY2VaxX7DyZ.jpg', 25, 'App\\Models\\Admin\\Blog\\Post', '2024-11-23 19:37:39', '2024-11-23 19:37:39'),
(69, '44q2iRA0tSbbFcBEBxXhXe4vNVoyBRIHdF7.png', 46, 'App\\Models\\Item', '2024-11-23 12:51:59', '2024-11-23 12:51:59'),
(70, '2Xh4xhuyWLLP4PvL73rSJVZe5RHvkBhrbmF.jpg', 26, 'App\\Models\\Admin\\Blog\\Post', '2024-11-23 18:45:41', '2024-11-23 18:45:53'),
(74, '7yMeZrpgtyIZXkv42DciUCsxL33jROuImxs.jpg', 47, 'App\\Models\\Item', '2024-11-24 06:32:01', '2024-11-24 06:32:01'),
(77, 'DvdHdxvduyTr0KplIsYH8BJ9bPNU63ddfT3.jpg', 48, 'App\\Models\\Item', '2024-11-24 06:44:54', '2024-11-24 06:44:54'),
(78, 'Z4hfCGINg2tNs3q0QXBKuhKAnDRIU3T0ISA.jpg', 49, 'App\\Models\\Item', '2024-11-24 06:58:59', '2024-11-24 06:58:59'),
(79, 'e21SJ7wi9g7GRfsLC9uFKVZUiUxA5EvBI2h.jpg', 50, 'App\\Models\\Item', '2024-11-24 07:06:26', '2024-11-24 07:06:26'),
(80, 'xYc5DvC8p1HLIRyXPBRME9BHHK5fYDqDQm8.jpg', 51, 'App\\Models\\Item', '2024-11-24 07:44:49', '2024-11-24 07:44:49');

-- --------------------------------------------------------

--
-- Structure de la table `items`
--

CREATE TABLE `items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `slug` text NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '0',
  `terms` enum('1') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `items`
--

INSERT INTO `items` (`id`, `title`, `description`, `user_id`, `category_id`, `slug`, `status`, `terms`, `created_at`, `updated_at`) VALUES
(29, 'Hello Hello 1', '<p>Hello HelloHello HelloHello HelloHello HelloHello HelloHello HelloHello HelloHello HelloHello HelloHello HelloHello HelloHello HelloHello HelloHello HelloHello HelloHello HelloHello HelloHello HelsdfaloHello HelloHello HelloHello HelloHello HelloHello HelloHello HelloHello HelloHello HelloHello HedsfsdflloHello HelloHello HelloHello HelloHello HelloHello HelloHello HelloHello HelloHello HelloHello HxzcelloHello Hello 😀😀😀😀</p>', 1, 1, 'hello-hello-1', '1', '1', '2024-11-13 04:10:01', '2024-11-19 18:28:02'),
(30, 'The Importance of Regular Exercise', '<p>Regular exercise is essential for maintaining overall health and well-being. It helps improve cardiovascular health, boosts the immune system, and reduces the risk of chronic diseases such as diabetes and hypertension. Exercise also plays a significant role in mental health by reducing stress, anxiety, and symptoms of depression. Whether it\'s a brisk walk, a session at the gym, or a fun activity like dancing, staying active can enhance both physical and emotional resilience.</p>', 31, 2, 'the-importance-of-regular-exercise', '1', '1', '2024-11-13 08:22:04', '2024-11-19 18:28:34'),
(31, 'Hello Weoldasdf', '<p>Hello WeoldasdfHello WeoldasdfHello WeoldasdfHello WeoldasdfHello WeoldasdfHello WeoldasdfHello WeoldasdfHello WeoldasdfHello WeoldasdfHello WeoldasdfHello WeoldasdfHello WeoldasdfHello WeoldasdfHello WeoldasdfHello WeoldasdfHello WeoldasdfHello WeoldasdfHello WeoldasdfHello WeoldasdfHello WeoldasdfHello WeoldasdfHello WeoldasdfHello WeoldasdfHello WeoldasdfHello WeoldasdfHello Weoldasdf</p>', 31, 2, 'hello-weoldasdf', '1', '1', '2024-11-19 05:58:53', '2024-11-19 18:33:00'),
(34, 'Hello dsfasdf', '<p>Hello dsfasdfHello dsfasdfHello dsfasdfHello dsfasdfHello dsfasdfHello dsfasdfHello dsfasdfHello dsfasdfHello dsfasdfHello dsfasdfHello dsfasdfHello dsfasdfHello dsfasdfHello dsfasdfHello dsfasdfHello dsfasdfHello dsfasdfHello dsfasdfHello dsfasdfHello dsfasdfHello dsfasdfHello dsfasdfHello dsfasdfHello dsfasdfHello dsfasdfHello dsfasdfHello dsfasdfHello dsfasdf</p>', 31, 4, 'hello-dsfasdf', '1', '1', '2024-11-19 06:38:45', '2024-11-19 18:35:38'),
(35, 'Hello world', '<p>Hello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello worldHello world</p>', 31, 8, 'hello-world', '1', '1', '2024-11-19 17:05:48', '2024-11-19 18:52:50'),
(37, 'sadfsdafsdf', '<p>sadfsdafsdfsadfsdafsdfsadfsdafsdfsadfsdafsdfsadfsdafsdfsadfsdafsdfsadfsdafsdfsadfsdafsdfsadfsdafsdfsadfsdafsdfsadfsdafsdfsadfsdafsdfsadfsdafsdfsadfsdafsdfsadfsdafsdfsadfsdafsdfsadfsdafsdfsadfsdafsdfsadfsdafsdfsadfsdafsdfsadfsdafsdfsadfsdafsdfsadfsdafsdfsadfsdafsdfsadfsdafsdfsadfsdafsdfsadfsdafsdfsadfsdafsdfsadfsdafsdfsadfsdafsdfsadfsdafsdfsadfsdafsdfsadfsdafsdfsadfsdafsdfsadfsdafsdfsadfsdafsdfsadfsdafsdfsadfsdafsdfsadfsdafsdf dsfasdf</p>', 31, 2, 'sadfsdafsdf', '1', '1', '2024-11-20 19:23:51', '2024-11-22 16:37:06'),
(38, 'safdsfsdfsdfasdfsdfas', '<p>safdsfsdfsdfasdfsdfassafdsfsdfsdfasdfsdfassafdsfsdfsdfasdfsdfassafdsfsdfsdfasdfsdfassafdsfsdfsdfasdfsdfassafdsfsdfsdfasdfsdfassafdsfsdfsdfasdfsdfassafdsfsdfsdfasdfsdfassafdsfsdfsdfasdfsdfassafdsfsdfsdfasdfsdfassafdsfsdfsdfasdfsdfassafdsfsdfsdfasdfsdfassafdsfsdfsdfasdfsdfassafdsfsdfsdfasdfsdfassafdsfsdfsdfasdfsdfassafdsfsdfsdfasdfsdfassafdsfsdfsdfasdfsdfassafdsfsdfsdfasdfsdfassafdsfsdfsdfasdfsdfassafdsfsdfsdfasdfsdfassafdsfsdfsdfasdfsdfassafdsfsdfsdfasdfsdfassafdsfsdfsdfasdfsdfas</p>', 31, 2, 'safdsfsdfsdfasdfsdfas', '1', '1', '2024-11-20 19:28:22', '2024-11-21 00:32:02'),
(43, 'Test safsd;fsdaf', '<p>Test safsd;fsdafTest safsd;fsdafTest safsd;fsdafTest safsd;fsdafTest safsd;fsdafTest safsd;fsdafTest safsd;fsdafTest safsd;fsdafTest safsd;fsdafTest safsd;fsdafTest safsd;fsdafTest safsd;fsdafTest safsd;fsdafTest safsd;fsdafTest safsd;fsdafTest safsd;fsdafTest safsd;fsdafTest safsd;fsdafTest safsd;fsdafTest safsd;fsdafTest safsd;fsdafTest safsd;fsdafTest safsd;fsdafTest safsd;fsdafTest safsd;fsdaf</p>', 36, 4, 'test-safsd-fsdaf', '1', '1', '2024-11-21 04:14:06', '2024-11-23 11:07:40'),
(44, 'test 1werwer', '<p>test 1werwertest 1werwertest 1werwertest 1werwertest 1werwertest 1werwertest 1werwertest 1werwertest 1werwertest 1werwertest 1werwertest 1werwertest 1werwertest 1werwertest 1werwertest 1werwertest 1werwertest 1werwertest 1werwertest 1werwertest 1werwertest 1werwertest 1werwertest 1werwertest 1werwertest 1werwertest 1werwertest 1werwertest 1werwertest 1werwertest 1werwertest 1werwertest 1werwertest 1werwertest 1werwertest 1werwertest 1werwertest 1werwertest 1werwertest 1werwertest 1werwertest 1werwertest 1werwertest 1werwerdsf</p>', 1, 2, 'test-1werwer', '0', '1', '2024-11-21 04:26:26', '2024-11-23 14:10:07'),
(46, 'Test', '<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>\n<p>test</p>', 1, 2, 'test', '0', '1', '2024-11-23 12:51:59', '2024-11-23 12:51:59'),
(47, 'Sqsqsdqsqdqsdqsdqsqdsd', '<p>sqsqsdqsqdqsdqsdqsqdsdsqsqsdqsqdqsdqsdqsqdsdsqsqsdqsqdqsdqsdqsqdsdsqsqsdqsqdqsdqsdqsqdsdsqsqsdqsqdqsdqsdqsqdsdsqsqsdqsqdqsdqsdqsqdsdsqsqsdqsqdqsdqsdqsqdsdsqsqsdqsqdqsdqsdqsqdsdsqsqsdqsqdqsdqsdqsqdsdsqsqsdqsqdqsdqsdqsqdsdsqsqsdqsqdqsdqsdqsqdsdsqsqsdqsqdqsdqsdqsqdsdsqsqsdqsqdqsdqsdqsqdsdsqsqsdqsqdqsdqsdqsqdsdsqsqsdqsqdqsdqsdqsqdsdsqsqsdqsqdqsdqsdqsqdsdsqsqsdqsqdqsdqsdqsqdsdsqsqsdqsqdqsdqsdqsqdsdsqsqsdqsqdqsdqsdqsqdsdsqsqsdqsqdqsdqsdqsqdsdsqsqsdqsqdqsdqsdqsqdsdsqsqsdqsqdqsdqsdqsqdsd</p>', 1, 1, 'sqsqsdqsqdqsdqsdqsqdsd', '0', '1', '2024-11-24 06:04:48', '2024-11-24 06:31:53'),
(48, 'Yoyoyoyo', '<p>yoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyoyo</p>', 1, 1, 'yoyoyoyo', '0', '1', '2024-11-24 06:34:37', '2024-11-24 06:34:37'),
(49, 'Qsdqsdqsdqsdqs', '<p>qsdqsdqsdqsdqsqsdqsdqsdqsdqsqsdqsdqsdqsdqsqsdqsdqsdqsdqsqsdqsdqsdqsdqsqsdqsdqsdqsdqsqsdqsdqsdqsdqsqsdqsdqsdqsdqsqsdqsdqsdqsdqsqsdqsdqsdqsdqsqsdqsdqsdqsdqsqsdqsdqsdqsdqsqsdqsdqsdqsdqsqsdqsdqsdqsdqsqsdqsdqsdqsdqsqsdqsdqsdqsdqsqsdqsdqsdqsdqsqsdqsdqsdqsdqsqsdqsdqsdqsdqsqsdqsdqsdqsdqsqsdqsdqsdqsdqsqsdqsdqsdqsdqsqsdqsdqsdqsdqsqsdqsdqsdqsdqsqsdqsdqsdqsdqs</p>', 1, 4, 'qsdqsdqsdqsdqs', '1', '1', '2024-11-24 06:58:59', '2024-11-24 06:59:48'),
(50, 'Wxwsxcwssqqsqsd', '<p>wxwsxcwssqqsqsdwxwsxcwssqqsqsdwxwsxcwssqqsqsdwxwsxcwssqqsqsdwxwsxcwssqqsqsdwxwsxcwssqqsqsdwxwsxcwssqqsqsdwxwsxcwssqqsqsdwxwsxcwssqqsqsdwxwsxcwssqqsqsdwxwsxcwssqqsqsdwxwsxcwssqqsqsdwxwsxcwssqqsqsdwxwsxcwssqqsqsdwxwsxcwssqqsqsdwxwsxcwssqqsqsdwxwsxcwssqqsqsdwxwsxcwssqqsqsdwxwsxcwssqqsqsdwxwsxcwssqqsqsdwxwsxcwssqqsqsdwxwsxcwssqqsqsdwxwsxcwssqqsqsdwxwsxcwssqqsqsdwxwsxcwssqqsqsd</p>', 1, 1, 'wxwsxcwssqqsqsd', '0', '1', '2024-11-24 07:06:26', '2024-11-24 07:06:26'),
(51, 'Qsdqsdqsqsdqs22 Dqsqsdqsdqsqsdqsdqsqsdqsdqsqsdqsdqsqsdqsdqsqsdqsdqsqsdqsdqsv', '<p>qsdqsdqsqsdqsdqsqsdqsdqsqsdqsdqsqsdqsdqsqsdqsdqsqsdqsdqsqsdqsdqsqsdqsdqsvqsdqsdqsqsdqsdqsqsdqsdqsqsdqsdqsqsdqsdqsqsdqsdqsqsdqsdqsqsdqsdqsqsdqsdqsvqsdqsdqsqsdqsdqsqsdqsdqsqsdqsdqsqsdqsdqsqsdqsdqsqsdqsdqsqsdqsdqsqsdqsdqsvqsdqsdqsqsdqsdqsqsdqsdqsqsdqsdqsqsdqsdqsqsdqsdqsqsdqsdqsqsdqsdqsqsdqsdqsvqsdqsdqsqsdqsdqsqsdqsdqsqsdqsdqsqsdqsdqsqsdqsdqsqsdqsdqsqsdqsdqsqsdqsdqsvqsdqsdqsqsdqsdqsqsdqsdqsqsdqsdqsqsdqsdqsqsdqsdqsqsdqsdqsqsdqsdqsqsdqsdqsvqsdqsdqsqsdqsdqsqsdqsdqsqsdqsdqsqsdqsdqsqsdqsdqsqsdqsdqsqsdqsdqsqsdqsdqsvqsdqsdqsqsdqsdqsqsdqsdqsqsdqsdqsqsdqsdqsqsdqsdqsqsdqsdqsqsdqsdqsqsdqsdqsv</p>', 1, 8, 'qsdqsdqsqsdqs22-dqsqsdqsdqsqsdqsdqsqsdqsdqsqsdqsdqsqsdqsdqsqsdqsdqsqsdqsdqsv', '0', '1', '2024-11-24 07:44:49', '2024-11-24 07:44:49');

-- --------------------------------------------------------

--
-- Structure de la table `item_additional_images`
--

CREATE TABLE `item_additional_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `filename` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `item_additional_images`
--

INSERT INTO `item_additional_images` (`id`, `item_id`, `filename`, `created_at`, `updated_at`) VALUES
(34, 30, 'BeY6mZXzRWpfVNlfpn1X62vG2Se4030Bhgw.jpg', '2024-11-13 08:22:43', '2024-11-13 08:22:43'),
(35, 31, 'ZrmTZFgpjBvBlt0glqjLrgLM6gLoQPK4Q0e.jpg', '2024-11-19 05:58:53', '2024-11-19 05:58:53'),
(36, 31, '8uopW3XUCods2CcYsaNmpcVVfKseYoawAvP.jpg', '2024-11-19 05:58:53', '2024-11-19 05:58:53'),
(37, 31, 'WCocEVVZTVezCzaByBZvTPP7W11Z4N99lso.jpg', '2024-11-19 05:58:53', '2024-11-19 05:58:53'),
(46, 34, 'mkZIHNnfkJuLFTrWybU3llapzoyU5zUjHQo.jpg', '2024-11-19 06:38:45', '2024-11-19 06:38:45'),
(47, 34, 'cmUvkFHfGumbrT0FCn5gM0dM4jpibIDBeMZ.jpg', '2024-11-19 06:38:45', '2024-11-19 06:38:45'),
(48, 34, 'HpdYctsEaYQQ4loBU2TfA7kV9ZW3gf9scbs.jpg', '2024-11-19 06:38:45', '2024-11-19 06:38:45'),
(49, 34, 'ked3lB8NPJVOsAcLbAs1XN7fAkZcSRb5PBa.jpg', '2024-11-19 06:38:45', '2024-11-19 06:38:45'),
(50, 34, 'vQVhsgOhRwTANFn4qkzmCD6V1YnBuGJQ1yP.jpg', '2024-11-19 06:38:45', '2024-11-19 06:38:45'),
(51, 35, 'nJC6TaMmRPXRW8diYx37dvSOHV14EPRBxcy.jpg', '2024-11-19 17:05:48', '2024-11-19 17:05:48'),
(52, 35, 'nY97rai15e2g450lxoAt9HmuO0bwakbcIHn.jpg', '2024-11-19 17:05:48', '2024-11-19 17:05:48'),
(53, 35, 'kv1ggmimrGBARcGB176xb5dtoT0QYnzompE.jpg', '2024-11-19 17:05:48', '2024-11-19 17:05:48'),
(54, 35, 'NSICycnDmH1lrdnmV9V4V6g3dEAHpPIXe2c.jpg', '2024-11-19 17:05:48', '2024-11-19 17:05:48'),
(60, 38, 'jAy7hKVrTp5VTCTMXriEM0rkcyQvzppocPB.jpg', '2024-11-20 19:28:22', '2024-11-20 19:28:22'),
(61, 38, 'RgZSMMdPCrHuHTidgBJLtuDt3s6jwSGpNQq.jpg', '2024-11-20 19:28:22', '2024-11-20 19:28:22'),
(62, 38, 'j1Wn8LFPLoEmN0yM7MmwGRq1ja59SbUrdO9.jpg', '2024-11-20 19:28:22', '2024-11-20 19:28:22'),
(63, 38, 'Q4B4bEIPe0wLdH03eFtXBdveXpDZSeiTCfn.jpg', '2024-11-20 19:28:22', '2024-11-20 19:28:22'),
(64, 38, 'FM0gEJRvS4XBp74lrh3sSP6mN2eq5B8O39B.jpg', '2024-11-20 19:28:22', '2024-11-20 19:28:22'),
(84, 43, 'scQ4S6W8VT6AC1zDWuf275pDrfZuIyX5MST.jpg', '2024-11-21 04:14:06', '2024-11-21 04:14:06'),
(104, 46, 'HTC1APqTOBn97qY2bLL8FbQEiB3jFyz1xFX.png', '2024-11-23 12:51:59', '2024-11-23 12:51:59'),
(105, 47, 'UkDUgAiCBJXqKRgLDNMXLtp1NYaEkHp7SOM.jpg', '2024-11-24 06:04:48', '2024-11-24 06:04:48'),
(106, 47, 'bLr391geWoK3culS79mjiKixzDy2c1Ey5kk.jpg', '2024-11-24 06:04:48', '2024-11-24 06:04:48'),
(107, 48, 'IeuUEKKuI0NkJzK9BjCNZJNjT8sxEGSqTwn.jpg', '2024-11-24 06:34:37', '2024-11-24 06:34:37'),
(108, 48, 'KsaGgCb2i7VvEMiCzbjpYnAJwKwUkPAapGn.jpg', '2024-11-24 06:34:37', '2024-11-24 06:34:37'),
(109, 49, 'fEmKLq6l5vhyL9HNQ8oUURTdXSvvrCTEGj3.jpg', '2024-11-24 06:58:59', '2024-11-24 06:58:59'),
(110, 49, 's9vwLePUx09LwrBuWbQm8oc9cIOVp8BEsMK.jpg', '2024-11-24 06:58:59', '2024-11-24 06:58:59'),
(111, 49, '4LDHgZ8QEPM1NYPYvTEKY00MV4DJRfXPXDq.jpg', '2024-11-24 06:58:59', '2024-11-24 06:58:59'),
(112, 49, 'Ag2XFOWBrSBX3f8DTPxmdW631GOFfiIbsZg.jpg', '2024-11-24 06:58:59', '2024-11-24 06:58:59'),
(113, 50, 'VL8MpAyYr2Pc32f7wPcEf1mgSLYKmUZov3y.jpg', '2024-11-24 07:06:26', '2024-11-24 07:06:26'),
(114, 50, '3EoDfrqphMkW1uVagRyLsmleOVOqZwrOunP.jpg', '2024-11-24 07:06:26', '2024-11-24 07:06:26'),
(115, 50, 'xAev06h7TMUC3e86AThcIM1jNKXLXeRDjRm.jpg', '2024-11-24 07:06:26', '2024-11-24 07:06:26'),
(116, 50, '0Zg6ZID1P0h4embZ2Vgn08MhH8K9pvg8MMy.jpg', '2024-11-24 07:06:26', '2024-11-24 07:06:26'),
(117, 51, 't7ot8ZdCrHyGma6gQbiWcYZGfji7GgSk1a2.jpg', '2024-11-24 07:44:49', '2024-11-24 07:44:49'),
(118, 51, 'PI2akdtSf8ADwxEDDADPggLzJTUP113gmaY.jpg', '2024-11-24 07:44:49', '2024-11-24 07:44:49'),
(119, 51, '38iUewIGDA8Eek04nDhCFOSzVa9fDS66DXt.jpg', '2024-11-24 07:44:49', '2024-11-24 07:44:49'),
(120, 51, 'miPQE5c42ZWlJxYyLm1EmzaShDelxXXsayX.jpg', '2024-11-24 07:44:49', '2024-11-24 07:44:49');

-- --------------------------------------------------------

--
-- Structure de la table `jobs`
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
-- Structure de la table `likes`
--

CREATE TABLE `likes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `likeable_type` varchar(255) NOT NULL,
  `likeable_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `messages`
--

INSERT INTO `messages` (`id`, `name`, `email`, `subject`, `message`, `created_at`, `updated_at`) VALUES
(7, 'Helder Jouy', 'wacholderjoris@gmail.com', 'Trappe de visite Booster', 'Test', '2024-10-31 05:34:02', '2024-10-31 05:34:02'),
(8, 'Monarch', 'monaarch.mkt@gmail.com', 'Re: Google’s guidelines - SEO Support', 'Hi Team,\r\n\r\nHow would you like your business to rank high on Google for a range of search phrases connected to your products and services?\r\n\r\nWould you like your company [ http://www.nac.memorial ] to be listed at the top of Google for multiple search phrases (Keywords) relevant to your products / services?\r\n\r\n1.      SEO - Full SEO Packages with Plan and Activities\r\n2.      SMO - Facebook, Twitter, LinkedIn, YouTube & Marketing etc.\r\n3.      PPC - Pay-per-Click\r\n4.      Web Designing – (Responsive, Re-Designing)\r\n\r\nWe will help them find you by putting you 1st page on Google with guaranteed!\r\n\r\nPlease let me know if you are interested. We have some special offers this season.\r\n\r\nI\'ll be happy to send you a free proposal and pricing list.\r\n\r\nThanks & Regards,\r\nLucy Jhonson - Sr SEO consultant\r\n\r\n \r\n\r\n\r\n\r\n\r\n\r\n If you don’t want me to contact you again about this, reply with “no thanks”', '2024-11-04 08:51:40', '2024-11-04 08:51:40');

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2021_05_27_141122_create_permission_tables', 2),
(5, '2018_12_14_000000_create_likes_table', 3),
(8, '2024_09_20_094844_add_sex_field_to_details_table', 4),
(9, '2024_10_01_145319_create_posts_table', 4),
(10, '2024_10_06_130000_create_blog_categories_table', 4),
(12, '2024_10_06_130308_create_blog_comments_table', 5),
(13, '2024_11_07_123648_add_two_factor_columns_to_users_table', 6),
(14, '2024_11_09_103938_create_page_images_table', 7),
(15, '2024_11_12_131324_create_item_images_table', 8),
(16, '2024_11_12_210527_create_footer_descriptions_table', 9),
(18, '2024_11_12_220352_create_otps_table', 10),
(19, '2024_11_18_205450_create_error_pages_table', 11),
(20, '2024_11_18_220338_create_jobs_table', 12),
(21, '2024_11_20_102501_create_email_contents_table', 13),
(22, '2024_11_24_094048_add_notification_comment_to_users_table', 14);

-- --------------------------------------------------------

--
-- Structure de la table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(150) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(150) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(1, 'App\\Models\\User', 3),
(1, 'App\\Models\\User', 5),
(2, 'App\\Models\\User', 2),
(2, 'App\\Models\\User', 4),
(2, 'App\\Models\\User', 6),
(2, 'App\\Models\\User', 7),
(2, 'App\\Models\\User', 13),
(2, 'App\\Models\\User', 15),
(2, 'App\\Models\\User', 16),
(2, 'App\\Models\\User', 17),
(2, 'App\\Models\\User', 18),
(2, 'App\\Models\\User', 19),
(2, 'App\\Models\\User', 20),
(2, 'App\\Models\\User', 21),
(2, 'App\\Models\\User', 22),
(2, 'App\\Models\\User', 23),
(2, 'App\\Models\\User', 24),
(2, 'App\\Models\\User', 25),
(2, 'App\\Models\\User', 27),
(2, 'App\\Models\\User', 29),
(2, 'App\\Models\\User', 30),
(2, 'App\\Models\\User', 31),
(2, 'App\\Models\\User', 32),
(2, 'App\\Models\\User', 33),
(2, 'App\\Models\\User', 34),
(2, 'App\\Models\\User', 35),
(2, 'App\\Models\\User', 37),
(2, 'App\\Models\\User', 38),
(2, 'App\\Models\\User', 39);

-- --------------------------------------------------------

--
-- Structure de la table `otps`
--

CREATE TABLE `otps` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `otp_key` varchar(64) NOT NULL,
  `exp_date` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `otps`
--

INSERT INTO `otps` (`id`, `user_id`, `otp_key`, `exp_date`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, '62985', '2024-11-13 07:30:50', 0, '2024-11-13 06:22:14', '2024-11-13 07:28:50'),
(2, 31, '00000', '2024-11-22 18:49:00', 0, '2024-11-13 06:41:38', '2024-11-22 18:49:00');

-- --------------------------------------------------------

--
-- Structure de la table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` text NOT NULL,
  `description` varchar(155) DEFAULT NULL,
  `content` text NOT NULL,
  `slug` text NOT NULL,
  `status` enum('1','0') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `pages`
--

INSERT INTO `pages` (`id`, `title`, `description`, `content`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Bonjour Test', 'La Poste est prête à prendre en charge votre envoi. Dès qu’il nous sera confié, vous pourrez suivre son trajet ici.', '<h3>Test Mise en page</h3>\n<p><strong>L</strong>orem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.</p>\n<p>It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', 'bonjour-test', '1', '2021-06-25 09:39:18', '2024-11-23 14:26:52'),
(3, 'Remembering Our Beloved Companions', 'Pets bring unconditional love, joy, and comfort into our lives. They are more than just animal the happiness they brought can help us heal.', '<p>Pets bring unconditional love, joy, and comfort into our lives. They are more than just animals—they are family members who leave a lasting impact on our hearts. When they leave us, the grief can feel overwhelming, but remembering the happiness they brought can help us heal.</p>\r\n\r\n<p>Creating a pet memorial is a beautiful way to honor their memory. It serves as a reminder of the special bond you shared and allows you to celebrate their unique personality. Whether through photos, stories, or a dedicated space, a memorial keeps their spirit alive in your heart forever.</p>\r\n\r\n<p>Let us cherish the moments they gave us and continue to find comfort in the love they left behind.</p>', 'remembering-our-beloved-companions', '1', '2024-11-19 00:24:41', '2024-11-23 14:01:45'),
(4, 'Honoring the Unforgettable Bonds', 'The love we share with our pets is pure and unconditional. They are our loyal friends, our gentle comforters', '<p>The love we share with our pets is pure and unconditional. They are our loyal friends, our gentle comforters, and our constant companions through life’s highs and lows. Losing them leaves an irreplaceable void, but their memory remains a source of warmth and solace.</p>\r\n\r\n<p>A pet memorial is a heartfelt way to celebrate the joy they brought into our lives. It’s a tribute to their unique quirks, their endless affection, and the irreplaceable role they played in our journey. Through stories, pictures, or keepsakes, we can keep their legacy alive, ensuring they are never forgotten.</p>\r\n\r\n<p>Though their time with us may be fleeting, the love they leave behind is eternal.</p>', 'honoring-the-unforgettable-bonds', '1', '2024-11-19 00:25:23', '2024-11-23 14:01:45'),
(5, 'A Tribute to Our Cherished Pets', 'Our pets are more than just animals; they are family, confidants, and sources of endless joy.', '<p>Our pets are more than just animals; they are family, confidants, and sources of endless joy. Their wagging tails, gentle purrs, or playful antics fill our days with happiness. When they leave us, the loss is profound, but their memory becomes a treasure we hold close to our hearts.</p>\r\n\r\n<p>Creating a memorial is a way to honor their life and the special bond you shared. Whether through heartfelt words, photographs, or a quiet space of remembrance, it’s a chance to reflect on the love and companionship they gave unconditionally.</p>\r\n\r\n<p>Though they may no longer walk beside us, their paw prints remain forever on our souls.</p>', 'a-tribute-to-our-cherished-pets', '1', '2024-11-19 00:26:07', '2024-11-23 13:55:28');

-- --------------------------------------------------------

--
-- Structure de la table `page_images`
--

CREATE TABLE `page_images` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `text` varchar(255) DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `page_images`
--

INSERT INTO `page_images` (`id`, `image_url`, `text`, `order`, `created_at`, `updated_at`) VALUES
(1, 'img/page_images/1/JOrM8QoxXxgi0vS8gtxr0FfX74urr8BvXvo.jpg', 'Text for image 12sdaf sdfasd', 1, '2024-11-09 11:04:12', '2024-11-13 04:13:32'),
(2, 'img/page_images/2/VuUTPJHM3wS08lfuH8bqxg73GfV2jSoCGU0.jpg', 'Text for image 2', 2, '2024-11-09 11:04:12', '2024-11-09 19:34:28'),
(3, 'img/page_images/3/Mh9PcWoTLePxnq5gTk6ozT9niixdTDFeU4W.jpg', 'Text for image 3', 3, '2024-11-09 11:04:12', '2024-11-09 20:14:15'),
(4, 'img/page_images/4/OIR3swCcU15Mp7epIQjFh8l78bGORNDuQ3v.jpg', 'Text for image 4', 4, '2024-11-09 11:04:12', '2024-11-09 19:34:49'),
(5, 'img/page_images/5/8r8uG1LmE60iuILnmLkVoDxCn9aLU8FSZvm.jpg', 'Landing Page Image sadfsd', 5, '2024-11-09 16:35:08', '2024-11-13 04:13:42');

-- --------------------------------------------------------

--
-- Structure de la table `page_titles`
--

CREATE TABLE `page_titles` (
  `id` int(11) NOT NULL,
  `page_identifier` varchar(255) DEFAULT NULL,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subtitle` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `page_titles`
--

INSERT INTO `page_titles` (`id`, `page_identifier`, `title`, `subtitle`, `created_at`, `updated_at`) VALUES
(1, 'home', '<p>Honoring Our Smallest Friends😁</p>', '<p>An oasis for remembering and celebrating the joy brought by our smallest companions.😛</p>', '2024-10-30 07:49:08', '2024-11-21 06:39:59'),
(2, 'blog', 'Cherishing Our Tiny Companions', 'An oasis for remembering and celebrating the joy brought by our smallest companions.', '2024-10-30 07:49:08', '2024-10-31 13:43:18'),
(4, 'add_memorial', 'A Tribute to Our Tiny Friends', 'An oasis for remembering and celebrating the joy brought by our smallest companions.', '2024-10-30 07:49:08', '2024-10-31 13:43:26'),
(5, 'profile', 'Profile', 'An oasis for remembering and celebrating the joy brought by our smallest companions.', '2024-10-30 07:49:08', '2024-10-31 13:43:33'),
(6, 'account', 'Honoring Our Smallest Friends', 'An oasis for remembering and celebrating the joy brought by our smallest companions.', '2024-10-30 07:49:08', '2024-10-31 13:43:40'),
(9, 'search', 'Honoring Our Smallest Friends', 'An oasis for remembering and celebrating the joy brought by our smallest companions.', '2024-10-30 07:49:08', '2024-10-31 13:44:41'),
(10, 'contact', 'Honoring Our Smallest Friends', 'An oasis for remembering and celebrating the joy brought by our smallest companions.', '2024-10-30 07:49:08', '2024-10-31 13:44:48');

-- --------------------------------------------------------

--
-- Structure de la table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(150) NOT NULL,
  `token` varchar(150) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('contact@nac.memorial', '$2y$10$fuSIU/dcqvrzL9wZolex3eIaryDdggNJbfAF8eZ/To4L.L.WfLxF6', '2024-11-18 08:45:54'),
('mahmudul.elahi@gmail.com', '$2y$10$iz.4/OgmM/Zk0UCx8JpyZObvfdFUUAY6MWnUVlcUAQO5U1VocKFGG', '2024-11-23 14:10:55'),
('info.mahmudul.elahi@gmail.com', '$2y$10$V9l5KoslXWBMe0ado1UiremEq5Udpt0R4a.crChwujZG9gedZkgRy', '2024-11-23 14:11:26');

-- --------------------------------------------------------

--
-- Structure de la table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL,
  `guard_name` varchar(150) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `posts`
--

CREATE TABLE `posts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `body` text NOT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `description`, `body`, `category_id`, `status`, `created_at`, `updated_at`) VALUES
(3, 'sfsdf', 'sfsdf', 'sdfsf', '<p>dscfdsf</p>', 2, 1, '2024-10-06 09:05:40', '2024-10-07 08:03:59'),
(4, 'dffgf', 'fbfgf', 'dfvfdb dv', '<p>dfjhhs jhf jyv fv</p>', 1, 1, '2024-10-06 09:05:40', '2024-10-07 08:03:59'),
(5, 'Ms.', 'ms', 'Eum beatae amet eligendi explicabo. Debitis provident deleniti voluptatum sed. Quo sit sint quia. Ullam vel blanditiis fugit ipsa dolores.', 'Eaque sed itaque autem et accusantium inventore. Perspiciatis quia libero impedit enim provident dolores. Commodi sunt quibusdam ut nisi necessitatibus dicta. Recusandae velit ab et earum. Ratione qui minus numquam laboriosam quas asperiores. Tempore consequuntur quo sint nemo laborum ab. Distinctio sunt aut aspernatur nam nobis aut. Rerum voluptates sed omnis excepturi perferendis quidem sed. Omnis a blanditiis vero dolor pariatur necessitatibus. Quae error illo veritatis optio quasi et iure. Est velit necessitatibus iste repellendus commodi suscipit illum. Qui enim quia et ab totam quidem. Est excepturi accusamus eum minima. Consequatur et voluptatem a. Nostrum quia et deleniti et alias. Totam omnis sapiente doloribus ut debitis aut distinctio quaerat. Culpa odio eum qui natus nam voluptate. Voluptas sit qui voluptate. Velit ut unde quia voluptatem mollitia mollitia. Quos aut et quibusdam. Eligendi sapiente quis adipisci labore dolorum reiciendis autem maiores.', 1, 1, '2024-10-08 15:04:25', '2024-10-08 15:04:25'),
(6, 'Mr.', 'mr', 'Consequuntur sed fugit numquam sint officia magni saepe. Aliquid molestias occaecati ex nobis est.', 'Mollitia blanditiis omnis vero nobis adipisci vel. Molestias aut consequuntur impedit illum et. Sit aut fugit et consectetur. Ad nostrum voluptatem ut itaque non qui omnis. A voluptatem iure sint animi aliquid exercitationem reiciendis in. At sit assumenda doloremque culpa id. Animi nesciunt sed deleniti illum et. Ex voluptates inventore doloremque consequatur quis molestias esse. Odio veritatis illo reiciendis ipsa excepturi corrupti facere. Ipsum ipsa dolores voluptatem et. Vitae minus necessitatibus dolor amet. Iste et minus dignissimos quod inventore enim nulla. Quia quo id rem. Nam nam soluta enim laboriosam officiis maiores doloribus. Voluptatem adipisci aut voluptatem porro adipisci hic. Quo impedit sit ducimus cum aliquam. Vero aspernatur nam accusantium sunt voluptatem. Est modi tenetur amet aut. Atque optio dolorem iste qui facere.', 2, 1, '2024-10-08 15:04:25', '2024-10-08 15:04:25'),
(7, 'Dr.', 'dr', 'Facilis sequi officia quia minus. Cumque qui repellendus est animi officia nisi. Fugiat officia corporis distinctio.', 'Eveniet non accusantium dolorem cupiditate enim. Possimus voluptate cumque molestiae vel eveniet dolores. Rerum omnis dignissimos non. Eos natus est possimus. Consequatur accusamus soluta voluptatem alias neque. Ut facere praesentium culpa amet necessitatibus in. Tempore sapiente distinctio suscipit quis ut autem numquam. Soluta eum non voluptatibus iste mollitia ut. Quam nihil rerum beatae. Et voluptas id cum voluptatum quasi corporis omnis. Voluptas quisquam delectus nobis ullam voluptas reprehenderit vitae. Magni ut debitis asperiores nobis laudantium. Sunt error aut quisquam voluptas. Ducimus et aliquam cum asperiores unde itaque et. Modi rerum id enim placeat et praesentium dolores. Aspernatur illo voluptatum quam ipsum quod sit quis consequuntur. Atque aliquam expedita impedit ex. Non autem ex molestiae vel unde. Officia est deleniti dolore voluptatem ut impedit illum. Fugiat blanditiis nesciunt saepe omnis. Porro et aliquam numquam ipsa.', 2, 1, '2024-10-08 15:04:25', '2024-10-08 15:04:25'),
(9, 'Velit ea fuga ratione voluptatem rerum eligendi a omnis.', 'velit-ea-fuga-ratione-voluptatem-rerum-eligendi-a-omnis', 'Et fuga sint dolor nihil. Repellat soluta dolorem quibusdam adipisci. Tempora nostrum et veritatis rerum nesciunt quia.', 'Itaque animi quis quasi temporibus quo. Eaque quasi consequatur qui. Similique dolores molestiae cupiditate ipsa asperiores. Quia veniam minus voluptatem. Ut laboriosam cupiditate non vero aliquam nam. Maxime quam dolor ut similique commodi libero velit. Eligendi earum perferendis modi molestiae ut veniam. Quo eaque nihil aut vero dignissimos voluptas delectus omnis. Omnis assumenda qui enim enim beatae assumenda. Placeat fuga aliquam beatae ipsam placeat. Consequatur quam adipisci maxime nesciunt quia voluptatibus quae. Facilis quo laudantium ratione asperiores velit provident expedita quis. Dolorum pariatur debitis eum non. Maiores laboriosam dolor in voluptatem accusamus ab tempore. Eos quibusdam ut ducimus aut sit corporis. Non doloribus assumenda itaque adipisci nobis. Iusto sed aut quas est eos. Ullam aut odio dolorum ex aut. Vel ex quibusdam vel quos ut. Sunt sed ut velit corporis commodi veritatis consectetur est.', 2, 1, '2024-10-08 15:05:13', '2024-10-08 15:05:13'),
(10, 'Nostrum exercitationem quam ipsa et nihil et ab veritatis.', 'nostrum-exercitationem-quam-ipsa-et-nihil-et-ab-veritatis', 'In eaque voluptas consequatur error sit veritatis veniam tempore. Porro nesciunt odio consequatur. Laudantium omnis ut ut minus in.', 'Necessitatibus quam quam debitis. Enim optio quos dignissimos fuga. Quos magnam ut earum maxime quis. Sint repellendus quae vel eum modi. Corrupti quo eos quia ullam. Amet ab sequi sit vel. Sed laborum quod ut maxime aut. Et hic est ut omnis earum est amet. Est totam voluptatem aut facilis aliquam. Cupiditate explicabo ratione dolorem nihil. Maxime consectetur consequatur ut molestiae officiis provident ducimus. Itaque aliquid laudantium necessitatibus laborum assumenda ut. Ipsam architecto aut et quis cum. Hic omnis repellat nihil. Expedita qui aliquam aperiam dolorem inventore nesciunt aliquam. Repudiandae rerum id non dolore. Voluptas asperiores unde quisquam voluptatem delectus deleniti dolorem. Suscipit minima qui sit itaque cumque sunt ducimus quae. Aut et quam ut repudiandae reiciendis iusto sunt. Asperiores voluptatem saepe non molestias. Expedita et quos est culpa sed.', 2, 1, '2024-10-08 15:05:13', '2024-11-23 18:58:04'),
(11, 'Aut doloribus odit corporis ad tenetur.', 'aut-doloribus-odit-corporis-ad-tenetur', 'Asperiores iure atque aperiam sunt vitae repellendus. Ut in ullam sed ullam magnam ea quidem.', 'Ducimus omnis qui et architecto pariatur. Saepe cupiditate reprehenderit voluptatem facere veritatis. Id dolor qui modi in nihil. Dolores libero veritatis fuga nisi. Ea nam nulla possimus minima eum et non. Officia omnis fugit voluptatibus neque porro nihil. Minus asperiores ducimus ducimus provident impedit aut nobis. Qui repudiandae aut non quaerat aut qui. Odio quia laboriosam reprehenderit officiis est rem. Eius doloremque maxime dolorem et. Eos sequi facere omnis magni. Modi voluptatibus nostrum qui et animi sit sint. Nihil explicabo itaque ea vel dolorem. Laborum omnis tenetur ut magni nam eligendi. Id sunt eum nesciunt dolor rerum modi autem. Unde et debitis facilis quaerat accusamus eos neque suscipit. Voluptatem fuga odio ad non nam rerum sunt. Voluptatem iusto soluta corrupti voluptas provident maxime est. Sit ipsam corporis suscipit itaque possimus rem vero. Odio ut incidunt nisi.', 1, 1, '2024-10-08 15:05:13', '2024-11-23 18:54:57'),
(12, 'Et maxime nihil minus modi blanditiis quis.', 'et-maxime-nihil-minus-modi-blanditiis-quis', 'Deleniti odit expedita ducimus nemo libero. Suscipit omnis consequatur officiis eveniet enim. Delectus eum id optio qui occaecati.', 'Excepturi ipsum omnis reprehenderit ut rerum perferendis. Ex non est neque dolor praesentium consequatur. Qui eos quibusdam numquam quis officia unde et. Sunt dolore sed asperiores ad dolores. Debitis porro optio delectus accusantium. Non reiciendis voluptatem fugiat rerum earum sit qui. At ut optio qui odio est. Aut dolor et illum possimus suscipit quia. Nesciunt provident quos non hic exercitationem iste. Aut autem fugit nam non nesciunt pariatur est. Assumenda eos ex quia fuga aut nulla. Enim excepturi rerum eveniet aut. Dolorum reiciendis dicta illum et officiis qui suscipit et. Nisi recusandae omnis dolor officia nihil similique. Doloremque mollitia hic perferendis doloremque quis ad numquam. Vel dolorum rem repudiandae nihil sit magnam labore. Deleniti doloremque porro est numquam omnis blanditiis ipsum. Expedita ut ratione repellendus esse consequatur quos. Id quia similique temporibus provident nostrum quibusdam aut. Magnam provident tempora incidunt illo perferendis quod sit.', 1, 1, '2024-10-08 15:05:13', '2024-10-08 15:05:13'),
(13, 'Aliquam repudiandae fugiat doloremque ea id aut est sed.', 'aliquam-repudiandae-fugiat-doloremque-ea-id-aut-est-sed', 'Consequatur quae et voluptatum aut voluptatibus. Vitae voluptates magnam aliquid quia.', 'Quia sit sunt esse quis ut. Eum voluptate aut vero minus. Odio modi eum harum repellendus. Esse possimus maxime facere qui beatae. Cum ab repellendus aut alias non asperiores qui. Minima suscipit itaque mollitia quis nisi eum. Autem eum provident odit atque quod voluptas ipsa. Et est numquam reiciendis maxime est optio reprehenderit. Et autem quos asperiores reprehenderit reprehenderit nihil deserunt. Omnis voluptas impedit quo natus veritatis. Omnis est aperiam magnam dignissimos et. Optio earum eum qui dolorem sed suscipit. Magni eaque eos ea enim laborum. Omnis aut pariatur mollitia corrupti placeat laudantium omnis. Sequi aut quia officia non. Nostrum facere ea et. Esse a reiciendis dicta deleniti impedit nesciunt maiores. Natus cumque ut mollitia quia quod aut. Asperiores aut soluta modi magnam. Laboriosam odit eveniet odio quam. Quibusdam blanditiis qui delectus. Molestiae doloremque occaecati eum sunt a aut officiis. Aut rerum qui quis sunt harum voluptas.', 2, 1, '2024-10-08 15:05:13', '2024-10-08 15:05:13'),
(14, 'Quia qui dignissimos debitis natus impedit qui velit dolorem.', 'quia-qui-dignissimos-debitis-natus-impedit-qui-velit-dolorem', 'Necessitatibus est aperiam enim. Officiis quia distinctio eius dolorem. Et aut nostrum nemo non amet dolor.', 'Suscipit maxime deserunt quis quo et quod. Illum iusto labore alias eveniet architecto qui. Sunt saepe mollitia quia consequuntur explicabo. Consectetur consequatur aspernatur voluptatem consequuntur ducimus. Ducimus eos consequuntur impedit quo. Dolorem omnis aliquid qui facilis. Nihil enim perferendis fugit impedit qui blanditiis. Adipisci animi consequatur ut. Iusto ex dolorem ad dicta odit deserunt. Aut ut enim est iusto sunt. Quibusdam magni aut praesentium minus explicabo dolorum vel. Officiis molestiae aperiam perspiciatis voluptate. Nihil ipsam excepturi culpa. Pariatur recusandae non omnis impedit quaerat esse. Voluptatem et ea tempora aspernatur voluptatem esse. Perferendis officia tenetur aliquam facere. Et maxime in omnis veritatis quidem. Nisi at cum at vel. Saepe excepturi sed temporibus. Accusantium et et velit unde dolorum. Et qui veritatis hic nisi. Rerum fugiat molestiae vel.', 2, 1, '2024-10-08 15:05:13', '2024-10-08 15:05:13'),
(15, 'Quia natus nam quo numquam veniam.', 'quia-natus-nam-quo-numquam-veniam', 'Quo illo amet quibusdam dolorem non qui. Eligendi nulla et rerum omnis labore. Mollitia voluptate ex nihil omnis.', 'Praesentium ut sapiente illo distinctio aliquam culpa modi. Architecto expedita magnam non quia in deleniti. Ab magni perferendis fugiat quo dolores architecto. Voluptatum autem aut dolore in. Delectus qui optio voluptatem numquam et asperiores in. Earum qui quisquam reprehenderit molestiae. Magnam similique nihil laborum magni ratione. Qui in inventore modi error quo neque iste iste. Inventore omnis ut aut eum accusamus. Veniam ipsa maiores eius quae cupiditate quis sed autem. Et repellat vero labore vitae eius. Delectus reiciendis adipisci molestias excepturi ipsa fuga. Deserunt exercitationem consequatur nostrum debitis. Ut veritatis dolor eum quidem. Omnis deleniti et est et rerum laboriosam qui nisi. Illo eum quia sed ex quisquam consequatur. Omnis eum temporibus numquam iste accusantium. Dolorum et et temporibus id laboriosam. Non qui alias nulla magni ut necessitatibus nisi. Qui doloremque mollitia sapiente numquam assumenda exercitationem.', 2, 1, '2024-10-08 15:05:13', '2024-10-08 15:05:13'),
(16, 'Qui qui quas eveniet ut tenetur enim asperiores.', 'qui-qui-quas-eveniet-ut-tenetur-enim-asperiores', 'Ut ipsam sit quia quidem. Odit iure praesentium veniam et aspernatur nihil. Doloribus dolores aperiam rerum voluptatum est ut. Et est fuga ut.', 'Vel voluptas veritatis harum quasi reiciendis quo. Ipsam tempora doloribus tenetur. Ipsa quas tenetur rerum eaque quisquam sed. Laborum id architecto distinctio corrupti. Iure illum vel sint nihil distinctio. Voluptatum ex aliquid itaque temporibus ipsa eius. Ut iste qui veniam nostrum quia. Voluptate molestiae beatae quia repellendus. Minima alias harum quis qui repudiandae. Pariatur expedita officiis est quibusdam officia excepturi qui. Neque id dignissimos rerum. Adipisci ex quis reiciendis id maxime incidunt nesciunt. Ut molestiae culpa ipsa officia. Fugit aut vero dolorem et provident nulla. Officia autem in et. Sint dicta ut non est. Voluptas nesciunt voluptatem ea aut esse reiciendis tempore nihil. Sapiente vel unde perferendis qui dolores. Nisi laudantium doloribus omnis omnis fugiat quo. Vero laborum officiis nisi similique eos. Non molestiae voluptas nesciunt non nisi. Tempore saepe tempora et nemo consequatur maiores facilis. Incidunt qui a eum.', 1, 1, '2024-10-08 15:05:13', '2024-10-08 15:05:13'),
(17, 'Itaque deserunt sint ut est excepturi.', 'itaque-deserunt-sint-ut-est-excepturi', 'Corrupti ut ipsa alias modi a qui et. Quia veritatis sint non deleniti nihil ut ullam fugit. Voluptas magnam ut quas porro facilis.', 'Libero sequi saepe et quisquam mollitia autem voluptatem nesciunt. Quas accusantium temporibus cupiditate doloribus earum qui. Quidem quas accusamus velit earum ut. Quibusdam distinctio rerum expedita. Odit suscipit voluptas enim optio cupiditate autem. Ipsum enim maxime architecto est aut odio natus. Vero eligendi iure nisi placeat. In quia nihil odio officiis impedit explicabo qui. Quis cumque quia et officia. Consequatur mollitia et ut voluptatem est. Adipisci impedit maxime sunt quis magnam vitae et. Doloremque ab tempora rem facilis ut. Voluptas est aut nihil fugiat maiores ut doloremque iusto. Quas iure porro at ut voluptas aliquam aut. Rerum aut nihil minima saepe. Suscipit facilis fuga mollitia ut consequatur maiores autem. Provident eum quisquam fuga ad dignissimos reprehenderit. Nostrum magnam quam nemo rerum qui et. Assumenda veritatis consequatur aut velit atque non eligendi. Debitis earum quia architecto dolore voluptate quo ducimus.', 1, 1, '2024-10-08 15:05:13', '2024-10-08 15:05:13'),
(18, 'Odio aperiam sunt nam molestias consequuntur quas quos.', 'odio-aperiam-sunt-nam-molestias-consequuntur-quas-quos', 'Et eos laudantium fugit corrupti. Soluta officia modi provident assumenda repellendus.', 'Quibusdam ut saepe rerum sit quia unde repellendus. Similique saepe sed molestias odio dignissimos consequatur. Magnam vitae iste sed totam cum. Ex eveniet doloribus beatae beatae est officia. Ut fugiat eum nulla aut voluptatem assumenda. Fugiat in dolores aut odit natus. Non inventore totam aliquid exercitationem error laborum temporibus. Enim esse aut minus assumenda suscipit eum. Quas placeat voluptatum esse voluptas eaque sunt maiores odit. Rerum sit dolore libero praesentium debitis dolorem et. Nihil quas vel saepe voluptatem. Officiis hic nemo voluptatem quo dignissimos doloremque. Perspiciatis fuga repellendus architecto aut consequatur. Molestiae perferendis sint iusto. Aut porro facilis sequi hic delectus quisquam velit. Praesentium laborum id id neque ut ut nam. Facilis a vitae tempora totam quo dolorem distinctio. In magni veritatis aut dolorem aspernatur qui. Officiis est amet non sapiente rerum. Ea libero voluptatem velit consequatur.', 1, 1, '2024-10-08 15:05:13', '2024-10-08 15:05:13'),
(19, 'Hello', 'hello', 'TEST META', '<p>In today\'s rapidly advancing world, technology has become an indispensable part of education. It not only enhances learning but also reshapes how students interact with knowledge. Traditional classroom methods, while valuable, often limit access to information, whereas technology opens up a world of endless learning possibilities. With the internet and digital platforms, students now have access to vast resources, educational tools, and interactive learning experiences. From online tutorials to virtual labs, the variety of learning options ensures that students can learn at their own pace, catering to different learning styles. Educational apps and software programs have further personalized learning, offering students and educators alike a range of tools to better engage with the curriculum. For instance, adaptive learning platforms like Khan Academy provide tailored lessons that adjust to the learner\'s progress. This dynamic approach to education ensures that no student is left behind, while also challenging advanced learners with more complex materials.</p><p>In addition, technology has broken down geographical barriers, allowing students to connect with peers, experts, and teachers from around the globe. Online forums, video conferencing, and global collaborative projects enable a diverse exchange of ideas, enriching the educational experience. Schools that incorporate technology also prepare students for the future workplace, where digital literacy is a fundamental skill. Understanding how to navigate digital platforms, work in virtual teams, and use technology to solve problems is crucial for career success in almost every field today. Moreover, teachers benefit from technology by automating routine tasks, such as grading and attendance, which allows them to focus more on personalized instruction and mentorship. Tools like Learning Management Systems (LMS) streamline the organization of course materials, assignments, and assessments, making it easier for both students and educators to track progress and communicate.</p><p>However, while the benefits of technology in education are evident, there are also challenges that must be addressed. The digital divide is one such issue, as not all students have equal access to technology. Socioeconomic disparities often determine whether a student has a reliable internet connection or the necessary devices for online learning. Schools and governments must work together to ensure that all students have access to the technological tools they need to succeed. Cybersecurity is another concern, as the increasing use of online platforms for education opens up the risk of data breaches and cyberattacks. Protecting students\' personal information should be a priority, and institutions must invest in robust cybersecurity measures to ensure the safety of their systems.</p><p>Moreover, while technology enhances education, it should not entirely replace traditional learning methods. Face-to-face interactions, hands-on experiences, and social learning remain critical aspects of education that technology cannot fully replicate. Blended learning models, which combine the best of both worlds, offer a balanced approach. By integrating technology with traditional classroom practices, educators can create a more engaging and effective learning environment. Overall, the role of technology in education continues to evolve, shaping a future where learning is more accessible, personalized, and interconnected than ever before. It is essential for educators, policymakers, and students to embrace these changes while also addressing the accompanying challenges, ensuring that the integration of technology leads to more equitable and effective educational outcomes for all.</p>', 3, 1, '2024-10-19 19:06:39', '2024-10-21 15:14:24'),
(20, '<p>dfasdf😅</p>', 'pdfasdfp', 'sdafsdfasdfsdf', '<p>dgfdsafsdf😄</p>', 1, 1, '2024-11-21 06:34:26', '2024-11-23 19:10:26'),
(22, '<p>rjgfkhfkfkfkfkjfjfjfkffk</p>', 'prjgfkhfkfkfkfkjfjfjfkffkp', 'rjgfkhfkfkfkfkjfjfjfkffkrjgfkhfkfkfkfkjfjfjfkffk', '<p>rjgfkhfkfkfkfkjfjfjfkffkrjgfkhfkfkfkfkjfjfjfkffkrjgfkhfkfkfkfkjfjfjfkffkrjgfkhfkfkfkfkjfjfjfkffkrjgfkhfkfkfkfkjfjfjfkffkrjgfkhfkfkfkfkjfjfjfkffkrjgfkhfkfkfkfkjfjfjfkffkrjgfkhfkfkfkfkjfjfjfkffkrjgfkhfkfkfkfkjfjfjfkffkrjgfkhfkfkfkfkjfjfjfkffkrjgfkhfkfkfkfkjfjfjfkffkrjgfkhfkfkfkfkjfjfjfkffkrjgfkhfkfkfkfkjfjfjfkffkrjgfkhfkfkfkfkjfjfjfkffkrjgfkhfkfkfkfkjfjfjfkffkrjgfkhfkfkfkfkjfjfjfkffkrjgfkhfkfkfkfkjfjfjfkffkrjgfkhfkfkfkfkjfjfjfkffkrjgfkhfkfkfkfkjfjfjfkffkrjgfkhfkfkfkfkjfjfjfkffkrjgfkhfkfkfkfkjfjfjfkffkrjgfkhfkfkfkfkjfjfjfkffkrjgfkhfkfkfkfkjfjfjfkffkrjgfkhfkfkfkfkjfjfjfkffkrjgfkhfkfkfkfkjfjfjfkffkrjgfkhfkfkfkfkjfjfjfkffkrjgfkhfkfkfkfkjfjfjfkffkrjgfkhfkfkfkfkjfjfjfkffkrjgfkhfkfkfkfkjfjfjfkffkrjgfkhfkfkfkfkjfjfjfkffkrjgfkhfkfkfkfkjfjfjfkffkrjgfkhfkfkfkfkjfjfjfkffkrjgfkhfkfkfkfkjfjfjfkffkrjgfkhfkfkfkfkjfjfjfkffkrjgfkhfkfkfkfkjfjfjfkffk</p>', 1, 1, '2024-11-22 22:50:06', '2024-11-23 19:10:20');
INSERT INTO `posts` (`id`, `title`, `slug`, `description`, `body`, `category_id`, `status`, `created_at`, `updated_at`) VALUES
(23, '<p>In Loving Memory of Buddy 🐾</p>', 'pin-loving-memory-of-buddy-p', 'It is with heavy hearts that we share the passing of our beloved dog, Buddy.', '<p><span style=\"font-size: 14pt;\"><strong>A Friend Through Thick and Thin 👏</strong></span></p>\r\n<p><span style=\"font-size: 12pt;\">Buddy came into our lives as a tiny puppy, with big, curious eyes and boundless energy. Over the years, he grew into the most loyal friend anyone could ask for. He was always by our side, whether it was a walk in the park, cuddling on the couch, or comforting us during tough times. His playful bark and wagging tail were a constant reminder of his love for us.</span></p>\r\n<p><img src=\"data:image/jpeg;base64,/9j/4QAYRXhpZgAASUkqAAgAAAAAAAAAAAAAAP/sABFEdWNreQABAAQAAAA8AAD/4QMfaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLwA8P3hwYWNrZXQgYmVnaW49Iu+7vyIgaWQ9Ilc1TTBNcENlaGlIenJlU3pOVGN6a2M5ZCI/PiA8eDp4bXBtZXRhIHhtbG5zOng9ImFkb2JlOm5zOm1ldGEvIiB4OnhtcHRrPSJBZG9iZSBYTVAgQ29yZSA1LjYtYzE0MCA3OS4xNjA0NTEsIDIwMTcvMDUvMDYtMDE6MDg6MjEgICAgICAgICI+IDxyZGY6UkRGIHhtbG5zOnJkZj0iaHR0cDovL3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyI+IDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIiIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIiB4bWxuczpzdFJlZj0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlUmVmIyIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkMwRTFDQjA3OUM1NTExRUM4MzZCQzNEMTA3QjUyMTNFIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkMwRTFDQjA2OUM1NTExRUM4MzZCQzNEMTA3QjUyMTNFIiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBob3Rvc2hvcCBDQyAyMDE4IE1hY2ludG9zaCI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSI3NUJGRUE5RDkzODgxNkM1RUQ3MDQ2RkFEMjlDMjEwRSIgc3RSZWY6ZG9jdW1lbnRJRD0iNzVCRkVBOUQ5Mzg4MTZDNUVENzA0NkZBRDI5QzIxMEUiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz7/7gAOQWRvYmUAZMAAAAAB/9sAhAAGBAQEBQQGBQUGCQYFBgkLCAYGCAsMCgoLCgoMEAwMDAwMDBAMDg8QDw4MExMUFBMTHBsbGxwfHx8fHx8fHx8fAQcHBw0MDRgQEBgaFREVGh8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx//wAARCAI7A4QDAREAAhEBAxEB/8QAnwABAQADAQEBAAAAAAAAAAAAAAECAwQFBgcBAQEBAQEBAAAAAAAAAAAAAAABAgMEBRAAAgEDAgMEBggDBgQDBwUAAAECEQMEIQUxQRJRYSIGcYGRMkITobHB0VJiIxRyM0PhgpIkFQfwosJTstI08WNzVDUWJuKTs0QlEQEBAQEAAgICAgMBAQEAAAAAARECMQMhEkFREwRhIjJxQlL/2gAMAwEAAhEDEQA/APu6nzn1CoBgQCgKgKgAIAAAAAAAAAAAAAAAAlAq0YEAAALUiFQFQFQFQIMAYAwBgAUAAAAAAAAAAAAAEoAoAQFAAAAEqAqAqBQAAAAAAAAAAAAAUAAAlGAowFGAowKAAABgDAGAMAYAwBgDAoA4AWoCoAoAAAAAAAJAKAKAWoCoAAAAAAAAABiAAAAAAAAAAAAAAAAAAAAAAAAAMahVqBKgAAAAAAAAAAAAAACYgMCoCoCoCoCoCoABUBUBUBUBUBUBUBUBUBUBUBUBUCgAAAAAAAAAACAALUBUBUBUBUBUBUCpgAAEKoAAAAAAC1CFQFQAACgAAAAAAAKgKgKgKgKgUAAAAAAAABiAAAAAAAAAAAAAAAAgCoCoCoCoCoFAAYgAAAAAAAAAABUBUAAAMCAAAAKAAAAAAIgAAAAAAAAAAAAFQFAAYgAKgKAAlQFQFRBKlUqBQAAAAKgQAKgKBGAAoAAAAAAAAAAAAUAAAlQFQKAAAAAAAAqGatQFQFQFQAAABgUAAAAAAAKgSoFqBSABKAKMACGgaNAGgDQAAAAQAAAAAAAAAAPgBAAAAAAAAAAAAAASjAUYCjAUIFAKUAAAAAAAAAAgAAAAoEAABdAGhQ0AaANAGgDQAAAAAAAAAAAAKgAACgAAAAAAAAAAAACKEAAAAAAAQoAFxAugDQCAAAEAAAAAAAAlAFAFAFQFQFQFQFRgExdBhoMNBhoDQGgNAaA0BoDQGoFAAAAAAAAAAAAAlQFQFQFQFQFQFQFQFQFQFQFQFQFQFQKAAAAAAAAAAAAAAAAAAAAAATAtQFQAAAAAAAAAJoDVQNUGgNAaA0BoDQGgNAaA0BoDQIAQC6lDUAAAoEAAAAAAAAxqAqAYAAAAAAAAAAAAAAAAAAAQBUmBUYAwBgAAAALoDRg1Kg0qDSoNKg0BoDQGgUAAAAAAAAAAAAAAAAAAAAAAAAAABUBUBUBUBUCgAAAAACaA0BoDQGgNAaJg1ag0qDQGgNAgAAtQFQIAAAAAAYAwVMYAwBgDAGBUotQFQIAAq4AUAAAAAAADAAAAAAAAABKgKgKgKgKgAAAAAAAGBAAAAAAtSYFRgaANAIwIAAoACAAAIBQAAAAAAAAAAAAAAAAAAAAAAAAAAKAAAAACoCoCoCoCoCoQqAQFAAAAAAAAVAVAVAVAVAVAVAtQAAAAAFABUBUBUBVgKsBUCgAAACoIVAVAoAAAAAYAAFQJUBUBUBUAAAAAAE5hVAASoCoCoCoBgQAAAAAAAAAAhKAAC1YCrAgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABagKgKgKgKgAACoCoCoFAAAAABVgKsBUCgAAABUAAEEKAAAAAoAABQAAAACAACoAAAAUAAAAAFQFQFQMAAAAAAAAAAAAAAAAEYAAAAAQKAAFQFUBAFQFQAAAAAAQABSAAAlAFAKAqAqAqAqBAAABUBUAAAAKgKgKgKgKgKgKgVMAAqAAAAAAAAAAALUBUBUBUBUBVFCqAAAAAAAAAALUBUBUAAAoQAAAAAAAAtQFQFQFQFQFQKmAqgFUAqgFUAqgKAA11AVAVAVAVAVAVAVAVAVAVAVAVAVAjbAVAVAAAGgDTtCmnaBKoCAGwFQFQFQFQJXvAVAAAAD1kD1gPWA9YD1gUCNgAFQFQFQFQFQFQFQFQFQFQFQKBKgKgKgKgUCVAqYABUC1AlQFQFQFQFQFQFQFShUBUBUBUABQACoCoCoCoCoFAaAKoBVAAAF0CFAFAKAAAAAAAAAAAAACoAAAAAAFTAoGsAAAAQBUBUBUBUBUBUBUBUBUABAAAAAaAUAUAxClQAAABKgKgAFCaFBoUGhQaKAAAQAAqAqAqBAAAAAAAAAAABagKgNAGgABUABQACoAAAqAqAqAqAAoACFAAAAAALUBUBUBUCgAJVAVtATQC1AVAAAKgKEAAAAAAAAFQKgAAAAAAKgWoAAAAAAMKgKgEAAAAABgQAAAAKgKgKgAAEqAqAqAqAqBAoAYEqAAAACJRQAAAAAARgQAAAAAAACVAVAtQFQFQAAAAAAAAAABUAAAUAAAAAAAAAqAqBKlCoFQAAAAAAAAC1AVAAAFAKAAAACABACgAAACgAAABUBUCgAAAAAqAqAqAqAqBgAAAAAAAAAAAAAAAAMCVAVAAAAEqgFUBApUAAAAAAAlCoCoCoCoCoCoCoEAANQJUBUBUBUBUBUAAAAAAAAAAugAAAAAAAFAVAVAAAAAAAAAUoAKgSoCrAoAAAAAAAAAAqBagKgSoFAoAIAAAACoABQAAAAAoACagNQGoFAAAAADAAAAAAFQFQFQFQFQFQFQFQFQIwAABUBUCOgVNAGgAAAAAYgUgAAAABUBUBUBUBUBUBUBUCAAIAAVAVAVAaANAGgDQBoA0AaAKgKgUAAQFAAAAAAAAAAAAABSgAAAAAAAAAAWoCoE0AaAEBQAAABUBaoIVQAAAAAALUBUBUBUBUCgAACoCoCoCoFAAAMKgKgKgKgAIAAAAAAAAAAAFQFQMQoAAAAFUAqgJUAAAEAAAqA0AgAAAAAAAEqAAgCoCoCoFAgWGgDQBoA0AaANAGgDQBoBahKVAVAVAVAqYCoCoCoCoFAAAAAAUAACoCrAtUAqgFUAqgFQAAAAAAWqAVQAAAAAAMqhCoAAAAAAAAABagKgAKAAAAAFqAqBrAAAAAAAAmoDUBqA1AagNQGoBgSoUqAAARgKgKgAAACE0BotQJUBUCVAtQACoACAAAXCoMSoMKgwqDCoMKgxKgwqDCoCoUqAqAqAQF0AaAQABahMKgwqDFBiAxkgYAwABABUBUBUBUBUC0Q0KIaFENCiGhRDQohoUQ0KIaFENAaLQaA0ENCiGhRDQohoUQ0UoAAAABqAqBUBQgAAAAAAAAAqAoAAAAAAAGAAAAqAqAqAqAqAqBGwJ1BTqAVAVAVAVQCqAVQCqAjYEqAqBQAEZKAAAAAmgDQLhoEwC4lQYVBgDAGFQpUCVAVAVAVAVAlQFQFQFQFQFQFQFQFQFQFQFQFQLUAAqBaoBUBUC1CAMAYoMAYAwBgDAIAAKmAAAAAAABQAEAqYFAAAIUAGoBMCgAAFAVYCrABACoAAAAAAACoCgAAAABrqAqAAAAJVAKoBUAACgAAAAjAAAAACAAADUBqAIFQFQJUGAECwqFKgKgKgAFQIAqAqBAACoCoCoEAAAAAAAAAAAAAAQFAVAAAKAAqAoAAAAAAAFqEwCAAC8gJUBUCoAAAAAAAC1AVAVAVAVAVEAoVAVAVAqAAAKEAACoCoFqAqAAAALUBUABQAGsAAAAQCUClAAAAAAAAAAAAAAAIwIAAtSBUCNgSoCoCoaKgRsBUBUBUBUBVASqAVQAABKgAAACAKgKgRsIVAVAVClQFQFQFQh/xQGslBvjp6Qaz+XHm37KBFULXNv2/2AVW7P4pIA7KfuzT7noDWMoTjxVAaxTQUYXFXAGCbAN6A0TAtQLR8ggoyBq9MuwJqN0C6cRgBRUCVahAAAAVAtQFQFQAAAAAAAAAQUoAAACoFqAqAAAUAEAAACoAAAAALUBUBUDUFAAAAAAAAAAAAAlQFQFQIAAAADAEAAAAjCxAoAAARgAAAABGAAASoCoEAAKgKgRsCaBF0AlQpXuBhXuBhUKVAVYQTAyUahGyNFwCLUCVAVQCoCpRnG44/cBXSdOCl38AmtUtJOHuzXGMvsZK3Ma1dj1uEvDNcYy4kX6X8M+RUxU+0CVAtQMkIzWaKjJAZIDF24PufcDWLtyXB1JTWFFz0CxfQGgAAqBQASgQAtQFQFQAAAAAAAAAoVAVAoAAAAJgWoCoFCAAAAAtQFQAAABrCgAAAAAAAE5AQAAAAAACqAVQDQgVAAQLgDAGDBiAApUCVAVAAAJUBUCdQBsiJVlUqDAgVLoxckuLoTWpzWLvRXeT7LOKwd9cifZf4z50nwQ+y/SJ1XWT7VfrD9Qi/BS4D4KXO0HwdM+0HwdNzkF2NsbORzpFd5qa53rltjZivenX0I3HO1l8uz+b2r7is6fKsfm9qCazVu21o2vpBp8hv3ZJ93AKwlGcX4lQDGoCoFqgpVBDQDKLoEq3IRvQUXpJe5LsBHFOMbtcfJrGUdIzXvRfaiWOk7s+XLbzrmNk/s8zSXG3dXuzjyaOX2suV364nU2PSTTSa4M668/hGBYsJWaYiMkUZoItSooMVMIShCfHTvQxZWmcZQdH6mMa1KmVKhV0AtQFQiaAw0BigwBgACKAAAAAAAUACAoAAAAAAAFAAAAFABAAAAAa6hSoCoCoCoEAAAAAAAAVAVAnEANAaBFwBgAqFQAAAcAIAAVAVAlQBBKgR17S6FRoVM0xJOK4ug1ZGt34cFq+4fZqcVi7l18I09JnWvpIxpcfGQxfhflx5uow0UYLgMXayp2KoxFUZvgmXKmsvlXC4n2Pkz7aDD7KrL/EMPsyWO5cG2XEvTJYyXvTS9f3DGb7GahbitJpLuTGM3qihb/7n0MqfKq12Tj9KKg7V1aqNfRr9QNYdUk9dAKpgZKQwZxuNKldOwYDhaucV0S7Vw9ZcTWq5ZnDV6x/EuAxZWuoaWpEKgZRAqYGOdYd2x86Gt20tVzcf7ASvOy8eO5bfK1H/wBRbTnjvn1LjH+9Qx3zsdvV19enBse7yb/b3nRrRV41XJnHnrHo9vq2bHuN6p8mdteSTFT9hUrNPXQsRmmVGaeoRalRQCYFTCLVUo9VzQI1XIOOq4Pg/sI3rFdpFNQqgAAACoAACAMAYBAAAAAUuhQaAAABAMkwAAAAAAAABAZAAAQAAagoAAAAFQFQABjRBoo0BoxaY0NRq4EAJgDFqFQKAAIAAAAIwAAABKkD6QJUKnUkFxrd5fDr6Cav1YuV2X5frJrUifLjxlWT7yLrLwrhoWCqE3wRcTWXyXzaGJ9mStRprqX6p92XRFcEhjOskUHQBUIJOuvAiI7sYOi8T+gKwldk+L9XIaYx6l2jQ612jRVJhMXrLpjKNxp6OnoGpY3LIbVJpSXfxKmHyrcnWEul9j1QGu5CcHSS9DKIptAZqSA2QuSjw4Pj3gSeOp1lb0/J9wTXM01oRoCskwjKLA3WZ9M06ekM2PKvReFucra0hJ9dr+GT4ergK3LsfP8AmLH/AGe7q/b0tZa+bGnKVfGvbr6zz9z5e/8Ar9bzn6e3teb+4xkpPxQ0ZeenL3c47ovSh0jhWxM1GKyTKjNcQjJF1FGgNFbpoNAKyUuMXqmBpnHonTj2MlajEigFAAKgUAAAJgKgUJgEwBgDAGLUBUAIBdAaAEAtQFQFQKAAAAAAABUwKAA1AAAAABAABcCUUAAAASoWIFAAAAAAMDGoFqBKgKgKgAJUCVAVIpUKxcktW6Igwc38PDtZNa+rGSUvede58CLgmuC9iCs425y5UXazUS1mrEebr3DGdbIwjFaKhcZtGVEAKr4A1krU2DWatPmwlq/LguJcTVpFRqEcl7IctE6IzrcjU5KvEzWsTrEMOsqYdYMXrBiqY0xVIqMusqYzjNlTG63kNR6X4oP4WEwnYUk52W2ucHxXoKmtClqFbIz1A2Rm/uCM7lpXlWOl1f8AMLCXHFVptUo1xTMtqijJMI2xbCOXzDbriWMuPGzLom/yy4fSKvF+XieZo/P2G1kpeLGuqr/LcXS/pocvZPh6v69zr/15/l/N6b0VXwz0f2HKXHp9nOx9VFnePBW2JqMVmqlRmmEZJgWoBMCsIqoBK+waK4udt096Oq9BautJloCgFAaAKgKgKgUAAAAEBQAAM4AwQFqAqAKAAABALUBUBUBUBUCgAAABUDWQAAAABAAAAAABoAAAIAAASrAVYBsAAAxAAAJUKJgUgkpIisHJvhoTVxh6ePaya0dVdEm33EGcbEpe86Ls5msS1ujbhHgte3mXGb0tWaQqvQASk3oqiJrNWpPjoU1krcVyDOsqIAwCdAiVqUc+bd6IqK4v6jFrfEcLk36DGumIpk1cOosSw6iodQF6u8aL1d40VTaLqKpV5lTGanTgypjZCQTG2FxxlVPUqWN1y3DIVY0je9ikWJjkrKEnGacWuKA2Rmu0DbCbVCpjLItO9D5kV+pH3l2oliyuKMiNRsiwNkXQIzyrPz9ryrPGTtycV3rVfSis/l87ZSzPL2dY4ydmUku+C6l9Riz4d+bnUr5TaMjxRo+DPK+jX3tqfVCMu1J+09HPh4e58t8WbjjWxFQTCMuoC9QFTYFqEWrAqaoKjZaklONe2j9YHnyzowvTtXF7smvYzH2d/wCO2N9u9ZuLwv6fsNbrF5sZdL9IEqAQAAAAtQFQFQKAAAAFQFQKEoEAFQFQKAAACgAAAAFQFQFQKAAwIoAAAQCAAAAAACgCoE6gJUBUBUCVAVAVAlQAAAACpoAqQYSuV0jq1z5E1uRjV8+JFYyn2akMbIY82qy0XZzKl6boxjGiSoXGdUrKdQGcbcnq9EWJrJW4riqlRnoEKgKgSqAUb4IDP5fayglFILjg3NPqhP4aU9Zz7dPW4HJmHXE6mDDqYTDqAvUEOtmjFUnwIyvUWCqRRkpAZxnqNTGyEyst9u5R8TUZsbrlqOTDsvx92Xb3MMW44k3GThJUktGmVpuhPQDotXGuD1KjRmWVGSuQVLc3r3S4krpzWqEtTI2wbr6ysuzFfjo+D4moxXzWxQ6Nwy8OXCM7lqndVx+oy63w+F27qt5M7b4wk4v1Oh5LH1ObsfoWHKuNZf5EduHi9vl1RZ0cK2psIyTCFSgmBUwKpAZJhGVWBnBNzWnMI0Zm0wvXZ3Lc3Ccm209UZvGuvHuz4edewszH8Tg5RXxw1/tOd4sd57Oeizn3YaS8S7+InZ165XdbzLF1Uej7GbnUcOvXY29D4xdUbxnUqQSoUQFAAAAFQFAAAABBFAAAAAJQABQAAAAAFAAAAAayNAAAAAAAIwAAAAAjAAAJUBUCVAVAAAoBAgQAMJzjBVloNxZNa6znrLwxfBc36TFrpOcHRLTQKkOu5Lpj6+4YV027UIcNXzbLI53pnx9BURyXPgVSNuc+5FS1vjbjDvfawxVZRKuoBsIKr4AWXRCLnckoxXFsluLJrzMnf8Oy2rS+Y+18DnfbPw78f17fLzr3mTJk30UijnfZXef1+XJPesyXG59Jn710nq5anumU/jJ9q1/HE/1PJ/HUbT6Rsjul74qP1DU+kbIbon78F6tCzpm+tvhmY0+bj6dTX2YvrrdFKSrCSl6Hqa+zneanU1o1RlTDqLqYqY1F6gh1FGSmBkpoamNkZlRujPUupW+3daZYxY25NlZFp3bf86C8S/El9pWZ8OC3d0K1jqt3NC6jqgo3bcrL4T4PsfJhNx51JQk4S0lHR+oy6eW229QV2YsvHHvNRzrwLX6Pm7Lj+OSmv78VIzW5/wAvh8uHyfMWfaWnTk3Ul3dbPL35fT9V/wBZ/wCPu8R0xrK/Ijpx4eX2+XVFnVwrbFhGVQmA0xU9BpioaKhqMkNGSXMo6LEaVnL3Vw9JWayUq+nmVnFqBzZG34t/WUOmX4o6P1mbxK6c+2x5uRteTZrK3+rbXNcV6UcuuLHo590vlrs5t23o9VzTMzqtXiV32Mm1d46Ps5nWdSuF4sZuDWqdV2lZ1EFWoCoAAAAtQFQFQCYFAAAFQFQKEAYAwBgDAIAEBRoDQKAADXUjRUBUBUBUCAAFQJUBUBUBUCNgKgKgQaA0QaA0BoDRBotSCMDVeyIW/CtZvhFEtbnLXGEm1cuusuS5Iw6SYynJJcSwrG1Cd2XGkebKzrttxjGNEqIuM2jYxGLlyWr7Cjdbs856vsKza2KpUAjEDKMGwMuiK4qoMVugHi7/AGs+50uzFzspaxhVuva0jl7Ja9Po65nny+duYmcnrjXV/cl9xx+t/T0/yc/tzXI5EH47co+lNfWTG51Gh3dRjTF3u8gfPKjJXwqq+EbI5HeMG+GTKNGnQJjus7nNKk6TXZIsrF9bst3ce77kumb+F8Dc6jlfXYkozg9VTs7DTnh1lReoiHUUVSKNkZoJjbC4i6zY3wmWVnHVYvOMlJcjWs2NO44/S1k2lS1N0kl8Mv7S1Jfw02rtQO6zPTjqaLGO429Y30tJ6S/iRmxeK0W3/YTWnZjPxR7mWVivE3RfL84QfBXLVt+xyj9hK1x/y+M3yHR5xzor4r3V/iSl9p5/Z5fR9F/0j7SHhVtLlCP1GufDz+zy6YPQ6RxbEzTLJMgtQKnoBU1UDKoRkteANdNuy1HqueGC1dS4xWE7/W0l4Yrgirixmys42KaCWMk6gZAc2Tt+NkVco9Nz8cdH6+0z1xK6ceyx5WTg5GL4vehyuLh6+w4dcWPTx7J0zxs+UfDN1Xaanf7Z79W+Hcui4k4M6S64XYxdU6PiGioBMC1AVAVAAAAFqAqBQAABUBUBUCgAAQBgDAGAMUIULoUGjURoAAAAAABGBKgKgSoUAAAAAiAEAAAIwuAMSvs5FVz5OUoLphrL6jn106ccftjYstfqXPfZGmc5pAarcZXrqhH0t9iLEr0YQjbgorgjTnaN09IRrncSRRuxbfh+Y1q/d9BYza3FZRgRsK1yuUIrlv5F1LwzaM2tSOd5t3nNk1r6xP3Vz8bGr9YyWXc/G/aNZ+rNZk18T9pdPqzWbJ8WEvKSlj3FS7Zt3F+aCYyJJY57m07LeXjxYxfbbbh9TJ9I3PZ3Py4r/lHb7muPkXLL7JpTX0dLJfXHSf2ep5jzcnyhuttdWPK3kxXKD6ZeyVPrMX1105/s83z8PGybGZiz6MizOzLkpxar6KozebHady+K1K+zLTYskDfDK04gdVvL4ageli7k1Hpn44fhZZXPrjXaoW70eqw9edt8fUdJXDrnGlSaTTVGuJqMHUBVIDOMgNkJhLG+EzUYsdFuZpLHdYlC5GVq7rbuKkvvNSuVjyrtu5jX5Wp8Y8H2rtDU+XTYuVKV3Sj87Gna4unVH0rUlZnw861LgZdHbjS8SLGK8jzD4fM+DP8AHZp7Jv7y1fV4r5TzDa//ADm6vxqzL224nm9nl9D+v/w+qbpcp2UXsRvlx78uiDNuVbEys1a+wIyqFKsI2W4XJvwxbYxLXXDBuOjm1HuWrLjNrphZsWlWmvazWMtN287jp8PChFnw8/Iu/t5r5mlqTpG5yT7GZtx1k+3hthcTVU00+DRZWLG1TT0KmNkZNDUxsUypjJSCMtGqPVcyYPMzNoi27mN4Zc7fJ+jsOfXrd/X7s+K8+F67Ym06xknSUGYnw73mdR6VjIhfj3rlzOnPWvPefqsk4vuNGpUiiAVCKAqBagKgKgALUCgAAAAAqAqAqAqAqBQAAIBMAY1hoAjAAAAACPiBAoAAlABEAAAABAAALEYUA5MrKUU4x482Y66dOeGrEtdcvnT4L3V2vtMRu11SdFxNI5bt3iKsd2FYVu0pS9+aq/sNcxz6uuhySNMNUpEWRy3rlERrHp412Fy1FxdVT2GpXLqNjKywkw01TkBzXblDNWRxX73HuM10keffvtOqZG5Gq3uMK9MtH28gY3q+nwYMZfuEDGSyEXUxksksqWNsckus42wyl2l1MboZXfQaz9W934XYdF2MbsHxjNKS9jKmY8vM8qbLlpytdWJdfOGsK/wv7DF9crrz7+p/l81unlXd8FO5GH7mwv6lmraXfHijn1xY9HHv5rxo32nro+zmZx2n7breUZV1Wct14geji58otNOlAlj17OVYyko3Wo3PhudvpOnPTj162FyFy1Jqa9HY13GtcbGHWgjJTQGyNwDbCeppmum1M0ljss3NSxixnuVr5+KsiP8AMsqku+H9jNOfPw8/Hu8A3XrYl1KSYY6ceVD5OVcguFax9D1Rmx05ux0Yz4GoxXnealTdtrudquL2OL+0tX1/l815hh/+d26fFZsS+hr7Dzezy939b/l78n+tL0mo5deXRB6G3OtkWwjJMI6rGDeuJSkuiPa+PsNSM3p2W8GxDVrrfazU5YvVdHhiqJU7kaZtYudNW6ImrHNdu9bpyJrTFEGN61bu23buKsHxRLNXm5deDd/c7dfdtSrbesK8Gjz23mvZM9kehiZ9q7p7s+aZ1571w79d5diua0rU25WNiZUZqQZxsjIqM06gc2Zg2cqOq6bq92a4+sz1xK3x7Ly8WUL+Le6J+GS4NcGu44WXmvXLOo9DGy43I9Mve7DpLrz98WVnOFOHA0REFGAQFAAAARagKgAAFqAqAqBQAAAAAVAVAuoDUBqBpCgAAAAgAASooEYCoEAASgALAKlQAAAAbA5srI6E4x958THVdfXy8+3F3byh26yfdzOcdXqaRj0rRLgjbm0XZ0CxzW/1cu3Dk3r6ET8rfiPbZ1edhJ8QrRdkZajivz4ma1HE8zIsScrU3HtXJ+pjW8ldOP5nSfTkx6eXXHVess6c76np2dysXo9UJKUe1OprXO8s3dty5tFTGqdqE1pOnpRDXNc2+5L3bkHXt0I1O3DkbPnuvTBTX5ZL7Q3948rJ2vcYLxY9yi5qLf1VCzqVwfucrGnRp9POEqoY067G5Wrqon0y5xfEmDesjvIjJZAGxZPeBsjkrtKjbDJ7wmN0MrvNSpjohl6rUsrN5ddnNpwZdYvLm3HY9n3ROV638rI5ZFrwy/vLhL1k65la49vXL4zefK+67Z1Xen5+Itfn29Ul+ZfCceuLHs9funTx432uZh1dVnKaerKr0cbOo1qQe7h7hbuwVm/4oPg+a9BZXLr16uVYlZknXqty9ya4M3HBpUyjZGYStsJhHRbucCxHXauGmLHoYl5Jrq1i9JRfNM6Ry6jysmxLFyp2vhrWDfOL4ErUuuzEu8CxLGzdlrYvcpR6H6Y/+0lOExZcCxa5PNq/X2mf57kfaov7C9Hr/Lwd/gv/ALzwpfjxbT9k5o83s8vZ/W/5r02/1p/xP6zcc+nRCRYxXTj2Ll6XTbXpZWL1j2LGFasxTfim+MmdJy4ddVtbKiORFYSnRCrHPcuuWhGmKegF70FZLUI05uHbyrLty0fGEux9pOudb47vN181KN2zdlamumcXRnl8PfLLNd+LuMoUjddY8pdhvn2ftx9np3w9W1djOKcXVPg0d5deSyxtUgjOMio2RkVGadSo15GLayLbhNfwyXFPtRnrnWuO/q8K9ZvYt3pnxWsZLg12o89lleyWdR34mTG5GkuPNHWdPP3xYznDpdV7vIpKxT7eIUAAALUBUABQi1AVAVAAAAAC1AoEqAAoAAAA0kAAAAAQAAAAAAXEBgDCoMSoUAlQFQFQI5Aa795Qj3sza1xzry7tx1bZyteiR1bbbpCV18ZOi9CLGenTNmmXJkT0M2rGva5dWen2RbX0Ic+V9nh7ctDs87VN8SK5rr0ZmtuK8zNajzsjgRuPPvLUqudXr9ifXZm4S7UUx34vme5bpHKg5L/uQ4+w1rN4e1i7rj5EeqzcU1zXBr0oa5Xh2Qv15lZ+rYryB9Wcb0u0J9WUnC7HpuRjOPZJJ/WVMcGR5f2S/wC/iqE38dpuD+h0GL9q5Z+V7fCxlSVOCupP6Y0+oWNTu/lw5GxbtZ1VtXornafV9DozH1ancrz53LltuM4uMlxi9H7CNKr77SjOOS+0DdHJ7wjdHJ7yjpt5XeEsdVnLfaNZ+rvsZq4cno09Ublc7y8bfPJuDuEZX9t6cXLesrT/AJU3/wBL9Ghm+uXw68e+8/FfCZeNmYGTLHyrcrV6HGMvrXajjZj2c9SzYWsnvJY1r0sTOcaakV9Ht2527lv5N5dVqXFdneiy4598ayy8aViSafVZn/Ln29z7zpHnxpjMDbGYRuhMsR1WrjKzXfj3NUbjnY2bvZd3Dhkx1nYfTP8AgfD2M1WJflxYdzxeoRa9LNXzNtcudqUZep6P6xU58ubDnWhI101+bv5O2T7L7VfTB/8AlNdJ6/Lw9/jXzVtc/wAWLFey5L7zh7Hs/rf813/1bn8T+ssc66sSxO/dVuHHm+xGpHPq4+jtWYWLahBU7e9nTHC3VlMqNcpkXGEp0QXGid1vQVWMWQZJVAoGyFtvV6ICZN+dqEXGnRWkqhHl7riwy7H7myv1rSrKHFuPP2HL2c7Nej0+z63L4eLbnVanne11Y2TctS8Puviizqzw59+v7PXx8mF2Oj8S4x5no5714+/XY6YyNubNMqNkZllStsXoNRpysWGRacJ8fhl2MnU2NcdfWvCcb2PecJqkoP2rtPP4e2WdR6Vi8rkPTxR1l15uucpOHRKnHsfcElQaoNBDRQBRAqgUqAAgVAtQJUCgAJUCgAKBQAADUQSoCoCoCoEC4AwBgDEBgFSoAABGAqTRBogXAqJKSSqyW41I8/IuuTq+Bytd+Y4L82Ytbx7ePDox7cOxI6RyvlLr4gjz8mXEza1I1bVd6dyhXhJNfb9hefJ7J8PopM668zXMlajmu8GRpxXloZajgvxeobjhuxdakVyXYlXXLdgVNcz+Zbkp25OE1qpLRhHo4nmXNsNRvr50PxaKVPoRWbHu4W94mVpbnSf4HpL2FS8u+GSGcbo5BdTGyN9F1MbI3kNTGxXu8qYXreNkw6ci3G6vzJV9vEDysrythXavFuSsS5Rl4o/+YmLO68PO2bc8KsrttytL+rDxR9fNesmNTuOGN5omNNscgYrdDJ7xiOm3lU5gx1Wct14jWcehj5rVNTU6ZvLozsLbN5xlYzodUor9O8tJwb7H9hqyVjm3m/D868weXNw2W9+ovm4k3+jkx9190uyXccO+bHs9ftnX/rzbWRSlWYx116WJnuLWoxqPqNr3S1dt/t8jxWp6eh8mhKx3xpmY1zFu9LfVbkq25rg0dHnYRmBvhII3wuFK7rF1GoxY9XElC5GVmfuXYuEvWdOXHuPEgp2MidqekrcnF+oivbxl87Fu2vxwkvXTT6TUYvw83b51aqZjr22+bf8A6Xhz/DkQ+mM0a6Y9fl4e/wCm97Jc/FZnH2Si/wDqOHsev+t4sdv9a5/FL6yxmvoNmx/l2fnSXinw9COnMebu/h2zlqaYxqlILjCU0NVzznV8RqoBUQZx1CNkILmXEbUMTWNy3GduUJcJfXyYI8Wd29iZDi9JR9jX9pzrvJrzs23ahkddn+Vd8UY/hfxRPP3Mr1+rq2fKQRl0brTnGXVF0aLGbNeri5LmqS0a5nfnvXj9nr+rqUkzo4s0y6ljbGXt5FTGaftKlcu5Yf7i11QX60F4H2r8Jz751v1d/W/4eRi3+iarwejRylx6++dj1I0uQSr3pnXy8vhr1XHloyNpUGKDCoMKgBqKXQqFKgEBQAAByAVAAEBQgBasBVgKsDVUi4gMAYAwAlQpUA2BKsBUBUABGwJUAwFTKlQMWyhxA58m5pRGOq68xwXpaaHOusjinKs4+ojT6RaRil2HSOFaL3BirHnZL0MVuPNlelZvwuLjCSl7HUjVmx9dZuwvWo3IOsZKqZ3jyWYS4FWNFxGWnJdjoRqOK9AjUcV2GpGnLO2Uc120Ucty0Ec87YHPcg06rRrWpR14m+bhitRlL5tv8M+PqYZe7heZMK/SMpfKufhnpr3PgDHqRyk+D0JpeW2GRUsZxtjkd5dTG2GQWVnG6N/tKmN0b/Yys2OPO2Pa85dUofIvf921Rf4o8GTFlsfM7j5c3PCrcjH9xjrX5lurovzR4omNzuPKV9rmRptjlUZR028vvJiOuzmPtGD0MbOaa1KmPXs5WPlWJY2VBXbF1dM7ctU0zUrj1zl2PhPNnk69tnVm4Nb22vWXOVrun+XsZz64x6vV7vt8Xy+atX6PjQy7yvUws9wkmmZrevr9tz7Gdjftb74/y584yErl3z+Wm7au492Vq4qSj7GuTRtxZRnwCVthPUDrs3NTWpY9TEu6rXgzfNcu41b9b6cm1lRVI3o+J/nj/ZQ1WOXXtN7WIidxw2Y/Kz71nlC5JL0V0+gjpfmOnzUk9ghL8F61Jf4un/qN1z48vC8xfzfL93vux/8A42cPY9f9fzXdGNcqcfxTp7RE7fVKluEYL4VQ6x4/y1SmVWqUwrTKZFYpgXqAyimwN8IUQRsRWdWgRaFHLue3rNxnCMvl3kv0rnY+x9xnrnY6evv618c8bLxsl2cqLV1dvBrtT7Dx9Sy/L6fFlmx3WouiqZG1NIqOvDuLqkjrw4e6fDvhJHfXkbosIzWn2FGyL5lYZphHj7ti/KvLIgvBcdJLkpdvrOPsmPX6O9mUw72nS3quA5qezn8uu7Drh1LiuPoNuXNaKkdFqAqACKDFBiFAABasBVgEAAAUABagKgKgAAGoigEqAqAqBKgKgAIAqBKkCoCoVKkAAAAnMoknRNi1ZHDelVtnGvRI4rz0Zmtxw3Z9Mk+x/aRX1FuXVbi+1L6jrHnrVe4MVY87IXExW48rJXEy29Ly3uaUnhXXRcbLf0o6cdOXs4/L6CSOjg1SRGnPdgRqOS5bI05LtviRpyTtoK5rlso57lsDmuWyjnnbCOe5bKNE7aLEsbMfcc3FdLU24L4HqhUexh+Z7Mmo5EXal+LjEYPZs51u5FSjNSi+DTqZMdEMpdoMbY5PeXUxthkuhdT6t9vKb9RdS8uq1mNOtaMuud5cW57Dtm5JySWNkvX5ttaN/mjzKm2PkN22Xcdsdb0Oqy/cvw1g/ufpI3OtcML7TCt9vKoyK7LOY6geljZtGtQWPcwNzi04TpKE10yi9U09GmjUrl1w+O85eS/2sZ7ptUerC96/YXGz3r8n1Geuf07er2/ivkLOR0unYc3plext24ytzi0zNiyvtMe9b3bDUU0su0v03+JfhLzXLvlxxck+mSpJOjXeacq2xkCN1uYV6GJeo16TUrFj0863+42i6o6zs0ux9C0l9DOvmOHiuLZ72qQi9Ms5fL3qT5XFCftVPrRCeHV5hip+W7/5FCf+G5Fm6xz5fPeYJf8A+Xs17/t5HT/ih/8ApOPs8PX/AF/+q9LG8W62Ic5yU/UopmefK+yfFr6K5PU7vHGicyK0ymBimFWoGcVUDdFJBGxFRkgyyQFRRSjTk4djKt9F6Naaxlzi+4x1zL5b47vN2PAz9uycN9T8dl8Li+3sPN168e/1+6d/+uL5hh1xuxb3TdXZLQ1zWO+dj1rU0d48NjojIsZbk/CmVGUHQrNbEVEv2YX7M7UuElSvY+TJediy5dfPwc7V1wmqTg+mSPP4r235j1bNyqT5M78+Hm6mXGN630uq4EWXWvQjQBUAAoAMgBAUAAQBAUAAAAABQCgGupFQAAAAQABCUR8QoQAAEAAAIwAEZRhdfhMdN8OK49DnXaOG++JluPPyGG30ez5CvYFvWsorpfq0OnLz9z5b7yDMcORDiZrpHk5MdWSNx5l1zt3FODpKNGmu0qvrNi3uGdZVu5SOTD3o8Kr8SN815vZxj05RNsNU4kWOadsjUc1y1UjTmu2SLHLctBqVzztBXNctFg57lopXNO0EaJ2io0TtsqWNE7fcVlLd7Jx5dVm5KDXJcPYy4PTxPMk40jkxp+eH2ozeVnT2sbc7N+PVbmpLuMtOqGUnzA3Ryu8JjdDK7yys2Om3ltcy6mO21mxnF25pShJUlGWqa70zUrl1w8PdvJ1jIjK/tT+Xd4vFk/C/4G+HoZcNs8vj70L+PelavQlbuwdJQkqNP1hrWdu+RddlnJpTUGvSxs2lNSD6Hbd2S8MnWL0afBp9pqVjrl8h528lxxYz3fao9WHJ9WRYX9GvxR/J9Rnrn8x09ft/FfH2chxdG9Tm9Mr6DZd3nYuwkpcHoZsb8vsMpW8vHW4WeLp8+K7fxGpXn75xyRlwNObZbmRp141yjLKzY9/a7sZSUZ6xkulrueh14rh7I8rFjLFzrmPLjam4+x6FPw6970y8K9+ODhX+F1/6hUju3CHzfL2VHjWxcf8Ahj1fYa/DM8vlt4fX5RsXeLs5NmXorWP/AFHH2f8AL1en/t3bbc6vMOHro7EWvY19hz4vy6+6f6V9DcnVs9DwtE58grXqBkqsDZCLA2xQRsRYMwzWSAyQRSgUVASkZJxkqxfGL4Ewm+Y8LdNi6Oq/hpuPGdni1/D9x5+/V+Y93p/s78dPGjcocNeqx7GJeVy2nz4P0no4vw8fs5yuy3I2410Ql+lX832FjDJNlStq4L2/eVlkmWDyN6suF+GQl4bi6Zv8y4e1HD2TPl6vR18YYV1OCj+HQvFT28u10lB86cfQbcZ5c0l0yoZddSuoFQAABagUAAAAUAACUCACoFqAAAANNSNFWBAKFAMRoDQAj4gCAAAxKAVGQAIAqFa7r0RjprhyXOBzd3Df5kajz8gK6tgzlZynjzdIXfd/iX3mpWe+fh9JNVRtwcd6DM1qPNybXFmXWPKyrXHQNOFzu2bsbluThcg6xkuRUx9bsnmOzmRjYyGreStNdFPvX3HTmvP3xl17Mo6GnNqlAitE7epGtc1yyRpzTtdwVzXLRGnPOzx0CxzzsrsKOe5Z7gOadllRona5UKjRO32IqNE7ZUaJ2u4I10uW5dVtuEl8SZWcrtxd/wAqzSN9fMgviWkvuJY1Ons4m7Y+Qv05rq5xej9hnGtdsMjvIrdDJfaDHRby2uYTHZj7g4teIsrN5dOZj7ZvFhWcxUuJUt34+/H1813G5XK82Pid78vZ+0z6pr5uLJ0t5MPdfdL8LKkrzoX2qINa67OQ+0GvRxc1p8dDOK+l2neEv050lbkqSi9U09HVGpWOuXxnnnycttl/qu2xrtl5+O2tXZk+X8D5dhm8unq9v4r5WxkuLWph6JX2XlbflavRt3HW1Pwzi+DTM+GrNj287GWPdTtvqsXPFan3dnqNx5rMaIzCN9q5RojT2dvv6x11Rvi/Ln7J8M97h8vc7ORHSORbTb/NHR/RQ61w5/TZvC69sxby/pXUm+6cafWiVZ5enir523/LfCcZQ/xQaNTwzfL5CSd7yTnQ+K0o3P8A9ucX9jOXc+Hf1X/eNu13aZ+zXuVy3K23/DT/AMxw48vV7Z8V9NefS3Xk2j1PnudurCqotsDbGNAM6gZRYRsTLBkmGayTAyTCMqlCpRUwLoAA8fetnV2LycZUvLW5bXxLtXeef2+rfmPX6PfnxXj7fk9N3pfCWnoZx46x6fZzsexCWp6JXhrssrqsT7mmbjFZII2QlpXs19XBlZZUo6dhRpz7Pz8O5BKs0uqHpjqY7mxv19Z1HjYU6SXYzjz5ev2TY9a3L28ztHjY3YJppcYcPQK3K5+OnYYdFKFQKACKmBQAAAAAIC1AVABMAYVClQmFQY1EVAFQpUgVAgCoCoEAFEqAbAxqRSoCoEqBGARFYXORjprhy3VxMO0cV6LI3Hn5EQ08+45Ql1xdJRacX2UCvrNm3SGbiqr/AFoKlyPf2m5XDvnHXcjVaCsSuG/a0ZMdJXmZNnmRuPLyLIVxXItNNaNaposHu7P5unZUbG4VnDhG+tZL+LtNzpx79X6fV2L1nItK7ZmrkJcJRdUbccwlDUhrTO2MXWidojWue5ZI1K552aIY1K552Qa552Rq657lgaY552NSmOa5ZGpjnna1enoLKmOedpl1MaZ2hqY0TtJl1nGidpp1WjXBoqOrG3nMsUjc/Vgu33vaSxfs9jE3nHv6RlSf4HozONTp3wyF2hpuhkNPQI6rOZJOtSD1MXdouErN+Ku2Zqk4S1TT7amp059ca8LfPJ6cJ52zt3LPvXMT44dvR+Jd3E3Plyvw+XhccXTmXFjqtX6EXXoYuZKLTTMtSvqdo3azdtyxcqKu492Lhcty1TT0aaNSsdcfmPgPO3lO5seXHIxlK5teS38i49XCXH5cu/s7UZ65dPX7N+Hh4eY7c006NGbHfnp+i+Xdzt7ngvAvSSuJdVmXZJGZT2c78sZqdu5KE10zg6ST5NGnBnC5qRY9LAv0miwr193h87Z43l72LcUv7s/C/pod54ea/FS4/neXMjtgo3F/ckn9RE/Lt2e71YVuXZONfqNQ68vCwcfqxd725caZFqK/xKJjpvm5ZXj7bkv/AErbMnnj34xfcpr+w808vodvssudb7UdVJKXtVT1PmMYQbSrzCttKIC1AoFTCM0wM0y6YyTCYyTCYqZTGSY1FTApQqBa8CD57zBtqtT/AH9hUhJ/rxXBP8Xr5nm9vGfMe3+v7d/1qY1/5lqMufCXpLxU9vPy9bBfVCce1/YzrHn6ZRNMs4UrTk9AjJtuMXz91+oIzi6NMqV87dt/IzLttcIzfT6HqvoPNfivfzd5enanVV7UduXm7ny2z92MvUy1mOa7HpnpweqMV15rEmqo0KgKlFAtQhUBUBUBUABQABMBUBUBUBUDVUyqAAAAoaATQBoA0AjYE0IqVABUqDCrAgRALWgqtcjHUa5abkao5u0cl6PEjcrzsiIaedkR1YVoxc2/hZMb1ritJLk1zQSzX2uBn2M7HV20/wCKPNPsN689mMrluqYWOK/YquBMbleXk4zoyNa82/jtci6rhuWmiyqzwdzz9uudeNccU9ZQesX6Ua1nrmV9btPnDAy+m1lf5a+9NX4G+6XL1l15uvXY91xjJVi6p80Vza5WkMa1qnaXYTFlaJ2Q3K552KciLK552GMaaZ2O4YrmuWNOAHPcx9OA0c1zH7i6mOa5Y7hpjnnYfYUxonZKzjmuWtSpY0TtcdCs2Oedqj00faEdGPuuXjtJv5kOyXH2jD7Y9fD3fGv6KXTP8D0ZnGp1r0IXuddCY03wyGqNMDvwt1vY9xShIeEslbN02TA32MsjC6cbdOMrb0hdf2S7zpz1rh1zY+Mv2cjFvzsZEHavW3ScJcUys62Wrui1JjUd+LmShJajG5X1m3Z2FueDc2zcIq7jX10yT4rsa7GuTLHPrn8x+XeavLuZ5d3SWNcrPHn48XI5XLdf/EuaM2OvHemybtPGyIzjKjTOdj0cdP0TJuQ3HBhuVmnXFKOTFfRIkrn3zlcMbmppjXbi3aTQV9RttMrGvYsnpehKC9NNPpOvF+Hm9sc+x1vYORiyXinbnBrvaaKz02+X7vVtku2HTJ+pqpeV6jTj0seas2214bzjdp29cU39JL5Pw+UxbXytu3bD+LCvSaX/AMC4/sieW+X0t/1j7PEvQyNuxMni5Q6JPviejm/D5/smdVtV1cDTK9deAGSYFTAyQRkgMkwMkyoyqBkmErJMC1KKmEZIBQDGVuE4StzXVCacZRfNMlWXHzELUsLPu4cvdr+m3zT1izzZ9bj379+dezts9XXlRv20+078vH3HQ1STXY2aZZIIz4ua9EkEIsDyN6t9GZC4uFyCr6Yun1UOHs8vX6LvLbiS6raOnF+HP2T5da8UHH1+w05tV1dVuvOP1Ga1K56mXRakFqgIaFAVYCrCFQKAAVAtQFQFQFQAFAAaamVQAAAASqCoAAVQEYEBhUGI2FKgRsBUIUASFIwkSrKxkqpnKx3lc12FTLccF+2G5XnZFrVhXm3o0YEwNxyMC/8ANtPw/HB8Gis3nX2u3bni7hZ+Zal4qeOD4p95ZXGzG65brwRSVw5GOtdCNSvNycbjoR015t7H7iwcV6z3FlHJctal0dm279um3SXybvVaX9GdZR9XZ6i6x1xK+r23zntuTSGV/lbr/FrB/wB5cPWXXHr12eHuxdu7BTtyU4vhKLTT9hXO7GMrXcFlap2UyLK0Tsdwa1pnY7g1rnnjrsIutE8dUJiytE8dc0VXNcxteAHNPF7hquW7i8RqY5rmMXUsc1zH46FjNjmuWH2Gozjlu2X2GmbHPK2/R3hnHTjbpmY9FJ/NtrlJ6+0mLr2cPdse/RRlSf4HoyWNTp6ELy01M1XTaypwalF0adU1xDT07727fcdY+e1ZzIqmPnJa90Z9qNzpx64/T5Lctrztrynj5UOl/wBOa9ycfxRZpzabd6npIsrvw86VuaknSjDcr62VnbvNGzT2vNaV1Lqxb71lbuUopL7UHOz63Y/HtzwM/Ztyu4Obb+XkWXRrimuUovmmuBLy789vrvJPmKNm98i8+qzc8M4Pg0zlZjv/ANR7ufivEyZQWtqXjsz7YPh9xqOFiWLmoI+k2PKcbkH2M1zWPZzsduKnieYL9rhC5P5sPRc8R0cPwx2iDt5e44f4Z3VFd1W4/Qywvhzbnc+Xvu35XBZGOouX5oSf2SRK1z4eNfsqz5w3HFl/Kzoq4uxq9Dxf81Tz9z5e31XeP/Hp+TLqvbbewb38zFk9OdYtxZ09bh75+XtPBXwya7E9To4I7M4ceHaUVakGSAyQRlQDICoIyQFRUrNMChFQGSaAtQAHjeZMf9Oxlx0lal0Ta/DLh7H9Zy9vP5er+t184y2+fVKbXCVvqReKz7p8vRue+320ftR0cUjxCNidHF8nWLCIlR0fFAcG+wrj2p84To/RJf2HP2T4d/69+a0YEvC13k9db90ehbomvpOrglKSa5apmasck04ycexma6xCAQUAgKAAAKgKgKgKsC1KBQAq4BAABoMtAAAAAgACMCAARAoBGAAARKr0IVm+7kEYMoxfEgxrT0GK681jOGn1GMdJXJetEblefkWeIbeZkWQrzr1tqoGnHysjEvq/Ym4TXGnBrsZUsfZbL5kxs+KtXP0sn8D4P+FmnHrjHqzt9WoYlcl7HqRuV5+Rh6VSJW9edfxHqFefdxqciq5blhlRz3LT05lMbcPc9ywJqWLflbS4w4wfpi9CsXmV9Nt/n1UUNwx/Tdtf+V/eXXPr1fp9Hg7ttefGuLkQnLnCtJL0xepY5WWOqVutdDSa0ysmV1qlYI1K0zsdwalaJ4+vAiytFzH1I1rRcx6hdc1zE7grmu4hYOS7iMqY5LuI1Uupjju4z1ZdTHHexnqXWLHJctSVdDTNjQ1R1To1wYYx24m737TSu+OC58yYsr3MTcbN6KcJV7VzJjc6dsL1OdTLWvXx9wxM3EW3brH5uM/5V7+pafJxfYblc+udfO77sOXs96LnJXsS7/Iyoe7Jdj7Gacnm272vGgWPV2zcp496MlJqj4huPf8AM+w2fOOzRu4vTHe8ONbMnp82HF2m/wDw94jn/wA3/D8ixcm/iZPTNSt3LcmpQkqNNPVNPmjPXLv6+36ps+bb3zZfk1rmY66rL5tJax9Zynw6dzfmOS1cafZ3GnOPa2rJ6ZopX0O4Spf27NXxp2bnpjrH62dXmk8xm6WfMvWl4Mq1Cde9Lpf1Fifhw+YrbW3WLy97AypW5fwzdPrjEVeb8vJ81P5Wdsu6w4XIuxdffFqcP/FI4e2PV/WvmNm2ZCwPNk1ws50Y3Ivl+p73/MmOL8te3nea+1cKOh2eEpyoUYSsQfp7URWp2WteK7gC05AZJAZUAJBFAqCVkijJAVAUChFQHPuFlXsHItc3bk4/xJVX0onc2N+vrOpXj7Jc6lbXOko+1VOXqr1f2I9qWsLcu2OvqZ2eNFQDJ+4u6S+kIylpKvbr7QOXdY9W33X+Fxl7JJfaY9nh19Nzp5+A9Wu45+t393h6MeCOzzMpL9Rvk9faBzZMf1E+Ul9KM9OnLVXQy2JkRagUBUBUBUCgAAAAgKAAAWoCoHOFAAAABAoBGBAAACACKNkEKM4rpVOYSowlYviUYPiZViwspGXJ8GZsblY3Laap7DFdY5L9hc0RqV5uRj6PQNx5eTjtN6BXnXrOr0KOSalFpptNaprRlR7+z+cL1ilnPrctLRXeMl6e0rn1w+ux8jGyrSu2JxuQlqpJ1DnmMblhNPQmLK4r+GnyGNyvPv4a7CNPPv4ncVXHdxmk9CjlnYfYEaJ2X2Fg1dM4y6otxkuDWjQR6uD5u33DpH5vz7a+G94tP4uJdYvrlfSbf5+266lHNsyx58OuPjj9CqjWuV9N/D6DFzMDNj14t+3eT/DJN+tcQxlnlslZ14Fw1qnZjXQYs6aZ2O4mNfZonj9xMXWmeN3BrXPPG7iVdc88XuIuua5hrXQGuW7gRfI0OO9t+nAamPOyNulyVTUqXl51/DlHjGhqVi8uK5baqVixhG7ctS6oycZdqKy9TC3ulI3tH+JcCWLr2sfMt3EmpVM43K9vbt2sqxPAz4fuduu6TtvjGvxQ7GWM9c68HzJ5dubVKOXiyeRtV7+TfWvS38M+xm45PJtZHeF19D5f3y5iZEWpaEa8/DH/AHL8q29wxH5o2mNbkUv9TswXFLT5yp/ze3tK5y2Pk/KPmC5g5luXVRKWpy75er1d7MffbzZtv5e443/psrWSXw3Oa9fES6nUyteBkdMoikfYQl+62O/Fa3Mfpvw/uPxf8tTfLh7JnS7hcTsbZnxf8u58qb7pqq+mJuOc8unPxv3VvcMP/wCasq9Z/jS0/wCaAR81uEHuPkm+0q3sHpyYdq+V7/8AydRjqbHf19Z08vMyvnbPgbnD+ZiXPl3ZLj0T4eyS+k4Svb1z8v0TaM2GfttnJi6ycUp+lHp5ux832c/W46nErB0g1OkGsZW0+Qqxj8toioAoEZUABKqKKgKBQKgigVJNpPm6AfNbJ4b3Ryjdp9aOHr8vf/Y8Pfiv0I/lk17dTu8KRAy+CXt+lBGUvcg/UBpz1XAv/wAD+wnfhv1/9R5GA/H6jjx5er2+Hqw4HZ5WU9JL0AasmP6dfwtMz03y5KmXUQZUKVAtQAAC1QCqAoQIACoCoACgAOeoawqDCoMKgxKkUqioVAVIJUgMCNlVKgKkACwVdQVkzTKPiBiyarBkGEijFslaiwuJKhixuVk4xmjONyuW9j1WqI3K87IxK10CyvKyMSlQ1rzb+PQo4rlprkVTD3HO2+983GuOD+KPGL9KKlmvsdn854OWo2sumNffxN+Bv0vgHHr154fQOEZx6k6p8GuBWNc13GUiVuVw3sKrZluVwX8N11Kriu4ncTVcd3F7i6uOaeMxqY0Tx2nwKjU7VDSsY/Mty67cpQmuEotp+1BK9fB8377h9MXe/cW18N5dX/N7xdc76pX0GD/uBgXKRzcedhvjOHjj9jNfZyvqr38Tc9qzUni5Vu5L8HVSX+F6lYvNjolZXYRNapY6JjX2aJY5MalaJ4/cMX7NE8fuJjUrRcxn2Bdc1zGVHoRpy3MVU4F0cl7BjLjGoHm5Wz2p1ouls1OkvMrycrZsiGsEpr2M39nK+t5l2zO3KkouPpVCyudjKxk5FmScJerkVHsYW+wbUL/gl2vg/WTFnT6naN5VmErN2Kydvvql/HlrFp81XmDrnXheaPLL2xLcduk8jZrz8FxaytN/Bc+81K5eHj2Mt1WvDgF19t5S8x/In8m61K1c8M4PVNPTgyNWa+Q/3C8oS8v7jHctvi5bLmy6rMo8LU3q7T/6e70FY5uV73kjeLO4YU9qypeC6vA38MuTRw8V7b/tGco3cTLnYuqly1Kkl9q7mbcn2PljMg7kbc34LicJrukqDms+2bNddnGnd2zP2163sfqdtc+q0+qPtodHn/OttjLrj7dnxfuS+VdfdOlPpRVscOJCGF5hzdvuKuLktzhF8HbvVdPVVoiy/D5jZseOPnbp5ay9I1nZg5fhetufsaZ5uucr38d/bnf09TyDvE8LNu7LmvpkpOMFL8UXSmpv19fhy/s+vZ9o/QZRO7wMGgpSoACdINSUAawcSKUYFoEoBSi0AqQBcQigWL8S9ISvmtndbrnyd2q9tTz+vy+h7/D6GP8AKursdfpoeh4GKCskvDL0MIr1t+hlg05f/o7/APBL6ideGvX/ANR5GD/MXoOHHl6/Z4erE7PJWU+EQRjcSdqSfNErU8vPObuqCVasBVgVAKlCoFqAAtQCCKAAAAFWAqwNBnWgaA0Bog0QapUaFSCNgSoBsCVAVCkfE6II3UoqIIxZdRixoxbIrFvUDFhWDCtckRUjccHpw7DONSt8Llu4u/sJjcrG5j15ErUrhyMNOuhF15eVt9Fog3K8nJwmq6F1XnXsV6l0cc7LTGju2nzHum2NRhP5lhcbM9V6nxRdZ6519ntPm3atx6bcpft8h6fKuNJN/llwZXHrix68rSfrDMrRcxYtdrJjc6cN7CppQljc6cV7DdHoRrXHdxGuQVyXMVrkXUaJ4xrTHPPHa5F0xpnZfYNTGt2qMaMXFp1WjXNBMelg+Zt9wqK1kynbX9O741T16/SXWL65Xv4f+4UdI52I123bMq/8r+81OnO+q/h7+F5h2POSVnKhGb4Wrngl7JcfUXWLzY75WKqq1XJjGdaZYxLGp00TxjONfZz3MbiTGpXLcxXTgRuVzXMbQq65buM9Ro5LuMxo4MjChOLUoprsaqUseRl7LbdXbbg+zijU6c+vW8u9iX7NeuPVHtRqVyvFjbgblcxJUTcrT96FeHeisyvtNk3+FqDVI5ODkLpycaesZRfHR8GF6mvA81+Wf9LjHdNsk7+yX5UUuM7En8Fzu7H/AMPpuuF+HmYGe4uLTJWua/RNjz9v3var2x7n48bJj0V0rCXwyj3xeqMr1zvy/N8rb9y8peY54OS34H1WbyVI3LTfhnH0/Q9DPfOuno9n4fd58o7rtNrdrGt+xFQyYri48pequpnmuvfP5ZbDn9F2GvNA8x9tK8rW642ZF0tZttKXZ8yCSf0UOrx2fhpsY3TkbjtHCNz9XFfYpeOHsloWLvw4d5c7u3YW8QVL+DJWcpLj0SaWv8M/rFTn4rxPO0VZvbZ5nx9IzccXMa7Vrak/+aPsOfs52PT6O8uOXzBa654u94r6fnKKuSj8N2HB1719R53tk/D9B8q77b3jboybSyrVI5EO/wDEu6R6vX1sfM93q+letKOuppxY8AFAABoCdPcFYuIEoAoAoAAqAoQA0Z15WMK/d4dMH0v8zVI/STq5G/XzvUjxtptONu3pxdfpOXqj0/2OnvWl/NXapfed8eNgnoFZLg/QyIyiq25eosGjMdMK+/8A3bJ14b9f/UeRgL9Reg4ceXq9nh6sTs8lZT4R9f1gglXTt0FV5z0dDk9EEABgDFQMUGAMAYAwCKgAAABdAADUDSZaKgRsAESoUqBKgQCVAVAlQuJUGFQrdbjRV5sM1kwjFgYsDBgYyYXGLCxgyDCTA1SDTGTdarRkWNtrMlHSeq7TNjUrpi7V1Vi0+7mTF1pvYkWuAxqV5+RtyddCNyvKytsetIhdeTkYDVdCq869iyXIo47llrgipXq7V5t3fbqQc/3Fhf07mrS7pcQ53nX2W0ebdp3GkOv9vk/9q66Vf5XwZXO817ErcZLk+8JK0XMZPkG50472H3GbG504ruH3ExXLcxF2Bdcs8SldBqueeN3GpUrRPH7hpjTPH7i6Y1Ss9xdTGqVp9g0YO3TkB34W97tg6Y2VchFfA31R/wAMqous3iV72D/uFfi1HOxY3Y87lp9Mv8L0LOnLr0/p9Fg+ZthzmlbyVauP+ne8Dr3V0ftNbHO+ux6E8dNdS8UXwaGM/ZpnjdxnGvs5buJ3EsbnTlu4nHTQmNzpxXcXuI0472LSuhocV7F46E0edkYikqOJdLHhZ+1ySbt6NcuRuVx64edjbjk4N+qelaTg+DOmON2PuvLvmOy4STir+HfXRl4k6OMovimnpUnhbJ1Hi+bPKv8Ao/Tuu1OV/YshqkuM8eb/AKdzu7JP0enc+XD55+HLtG6zs3YzjLmiWOnPT7zdtsx/O3l1WE4x3jDTng3npXTW3J9kvr1InfOXY+O8jb7e2/Ont+fFwSk7V+zc0aa0akmcupj1+vr7R7WZjT2rdPlRdca5+pjT7YPgvSuAZ8V9lhX3m7HOMHW9iNZFrtpH31/hqb4rj7ZldWbkOWNg7xaethq1kNf9ub8L9UvrNuc/TOSsx3G7i3VXA3i3JpcuqSpcXpq6+sJXj4GHbyLW4+Vd01i07Slz7bdyP0SRGv8AL5/y871meb5W3Z0vQbjam+bXuTR5/Zzle/1+z7TfzDas7N2LdvmR0lal0X7XKUa6r7mTnrK6ez1zvnK/VsDPxtwxIZOPNTtz4NdvY+89Uuvk983m5W5rUMsaAUCUAtAJRARxQGPSAoAoASAugADxN/yVcnbwbfGqlep/yr7Tj7Ltx6/6/Gf7VtxIrrhFcFRI3zMcvZdr1MfWfpbOji1oDNcH6ALH+XL0Acu4vp2+9XnRL1yRO/Dfrm9POwF4/UceJ8vT7fD04nZ5aynwiQguQV513S5Ndjf1nKu/PhgGmVQgAAoAAgFQAFTBhUGFQYVBihABr2gaamWkAVAVAlQFQIBAAECjCoBYR6pJBHR9hpmozIxYGLAwlQKxbIsYtgYSCtciKwYGEmFapOpKsY9UoyrF0YWOi1uUo+G6qrtXEjTtt3Me+vA032cyYNd3EUtQsrz8na4yroRqV5OTtD10DWvJydslGuhVebfwZLkVMcN3Fmtaamkx6W1+ad62xxirn7jHX9K7rp3S4oM3mPtNp86bPuHTbuT/AGuQ/wCnc0TfdLgw53nHtuEZKq1T4MM60zxk+RManTluYnHQjcrku4nKhGtct3E7gsrmni8QrnnjFGmeN3FGiVjuA1SsIqVqlZ1A1ytFGt2mgOvB3jdcCSeLkzgl8DfVH/C6ous3iV9Jgf7g3VSG4Y6mud21o/XF6FnTj16P0+jwd92XcKKxkxVx/wBK54J+x8fUX4crzY654tUy4k6cl3Dq+BnHSduK/hvXQjc61w3sJ66GW3m5GJrUsHnZOJx0KPn9z2hXIuUV4jfPTl3xrwLGTl7fldUG1KPGL4Ndh1zXmuyv0Lyt5qsytyjOKvYd5dGViTpJOvczPhv46jyPNnlOWyyjue11v7FkOsJLWViT/pz7uxv0cTc+XCz61s8r+YLmLkQlGdEnoSx1l34e1/uDsEdxxoebdnj/AJizFLdLEFrKK4XqLnH4u7XkzN+U5t4rHacu35i2BYtU8/FXXiy5tpaw/vcDl4+Hr6+Zseh5L3l2MuMLmlH03Iy9jTRqfFc++dj6vCtWcfNytovOuJkpys1/7dyvTT+Hh6jq834c9u1evYF/bZuu47bPrxnzk4aqndciC/tx73dlk7fi+YcRf5jDShnRXF2fxv8Agf0PuFSfDzvN2EtywMbzHgOmTjJLIceNF7sn3Lg/7DPU2OnHX16ct+UN522G5WV/mrEVDNtLjp8R5bMfS46ZbBv2VtGR1263MeX82y3o+9djLx3jPu9M7n+X6Vtu64W5Y6vY1xS/FH4ovsa5HqnUr5XfF5uV1NU4FZQBQBQCJAVoCUAlGBKAKAKAcW5blawodKpLIkvBDs75Ge+8dfV6r1f8PCw7dy7dnkXW5Tk2+p8XJ8TjxNuvX7OpzMj18SNJp9mrO8jxWvQxk04m3OsFSpGmT91+wRFXuP0FRwbzKmJCH47i9kVU5ey/Dv6J8ufb1rJmfW6e6/D0IrQ7PMs+NOxEqwiiVXnXl+tc/if1nKvRz4YEUQFAAVFQAAAKgFQAFAAKgKhCoGmplpAAACAA0iYAAQGBjVAKoDdYSo5epFZrPsKyjIrFgYsDCQVi6EWMX6QrWwawkRWtkVhJhWuQVrkCNcuIVh1SjKsXR9wHTY3e/b0uL5kO3gyK9CxuGJkadXS38MgfLbPGhJaapkxdcWRtkJLgRqdPKy9lqm0itSvGytonGvhGq8rI22SfAupjgvYTXIupjs2zzHvW1Pps3XcsLjZueKPq5orN5fZbT582nMcbeVXEvyovH/Lb7pfeHK8V9H+ncipwalB6qS1QxNarliLfAmNTpz3MXuJY19nLcxe4mNSua5i9xF1zXMZ9gaaJ4z7CjRLH7ijRPH7hBqlYfYUapWO4DXKzRcCjVK0ErW4dgR6m2+Zt729xVq+7lpf0bvjjTub1XqZqVjr1Svqdv897bfpHNtSxrj4zXjt/+Zew1rjfTZ4e/aeLl2Vdx7kL1t8JQaf1Fc/DnvYNeCM2NTt52RgVroTHWdPKycF66BvXlZWHxqgPnd32eN6DoqT5M3z1jn3xK+Zhfy9ry+qOklxT4Nd51ny8l3mv0fyl5qxb2POxkRV/ByF8vKxZ0apLR6GfDp8dR4nm3ytd8u34bhgzd/Y8mX6F6tZWpPhbufY+fpN+XG/617vknzUrNxW7j6rVzw3IPVNNGL8On/Uce/bRd8ob/Z3Lb9dj3CbnjNaq1J6ytP0fD3egz1Nb9PefFd28xtwuWd/w3/lsppZMV8F18/RL6zEuu1mV9TbyXuGzWdwsOuVt2s0uMrL97/DSvtOvNefvnK69wv8A6eJ5gxdXZUbeclxcHpGf918TTlL+GFy/Z23c4ZiSntO7VjOHGMbkl44tdk1V+0J/h5Fq4vK++Pbb/wCrsm4pvDuS1j0S0lalXnGtPQMWXfh5OfYv+Vt9jdtL5m25Wtp8VO0+MHX4oVOffGvT6fbnxXRn4NqKhl4b68LI8Vt/hfOLPM9/HWtGJk5OLeV3HuStXF8UX9D7Sy2HXE68vrdt88SSUM+y5U/q2vti/vO3Pu/bxd/0/wD8voMTfdqyqfKyIdT+CT6ZexnSdyvL16eufMdqlFqqej5m3NfQQK9oAAgLRgYzlCGs5KK7ZNL6yklrjvbvt1qtbym/ww8T+4xe468+nq/h5uX5guzTjjR+Un8ctZfcjl17f09HH9aTy8qMZ3btW+qcnrJ6s5ZrvbJHqWLaUYxWiR6eecjxezva7saLUW+3Q6RxrutaSXdq/UVhqjQy2y5LvdSxGT9x+oqPI3mdci1b/BFyfpk/7Dj7L8vV6J8azwYUtJ9peE91+XdFcDbhWMvfYqxkuRFeZfl+vc/if1nLp6OfDCplRMCpgUoAUAVAAAAqAoAAAAAaTDSMCAUDEChUAtUEY1ABUYEA6MdxcKV5lZsbGjUrOMW1V1aXeSq1yuWVxmQytcsrHXbIauVqnnWU9LftZNWctct0UeFuPsGr9GuW8zWqhFeoa19Gt75dXwR9hPsfxsHv95f04P0ofZf42t+YJLjjWn6mPsfT/LH/AO4LEvfwoU7pND7H0v7Vb7szdLmJcj/BKv1tCWJeem2Of5cuOnzblp/mTp/1F+EzqN8MTacj+RnQb5JtV9mhfrE+/U8xLvl/JpW3chNcuKJ9Fntjiv7Tudr+j1pc4uv2E+tancedfnkWv5mPcVOxVI6alnzFPH0Urij+GUaoD0cbzhts6LIbtt/Ek6Ewx61i/iZUOuzcjci+cWmSxEu4Nqdaoi68zJ2WEq0Qanbx8vYnrSJWtePlbPOPwsauPKyNukuRdZxs27d952mdcS/JW+dqXig/U+HqNazedfX7R/uFg5FLW5Q/a3eHzVrbf2orneH1Vm7Yv2ldszjdtyVYzi0016gylyynyIsrnnjImNSue5irsJjUrmni9wb1z3MXuIa554/cF1onY7gNMrHcUaZWe4DTKz3FGp2ANc7IGt2mBniZmZhXfmY16dqfbB0r6VwZdS8yvpts8/34tW9zs/Ojwd+3SMvXHRM1O/28/f8AX/MfVYebtm52+vDvRuvnDhNemL1N44WXnywydvTrREsb57eNmba9axMu0614mZgUroGnzW8bLbvwap4uT5m+esc+/XLHyMbmbtOZ1Rqmnqnwkjv8WPHZea/TPKPmnAz8OeDmxV/b8ldGTjz5VOfhu51HgeZvLuT5V3G3fx5yv7NlOuJk8en/AN3N/iX0r1m/LlL9bj7Dy9um37/s93Ytz8WNkxpCfxQmvdnHvi9THh16+fl5Gyu/su6ZXlXfF1Wbi6Yz+G5bk/Bcg32/Qzl1MuvR6+/tMr09hzr/AJe3uW35L67L/lyfC5Zlon9/eal/LPXOzH0uLO1te53NvvJT2vPi5Y1dYu1c0cP7taHV5LGq1jWrN/I8s7k3LEvr5m35HOjfglF/ig9H/aF8xzW8aO5YuR5U3tqGbYfVg5PCkkvBOL7GuJqVL8vM27J/dwv+UPMf6WVal0YmQ+Vxe40+da6dqFhOtcG3ZeTsWff2bd4f5ZukuaVfduQfYzj7PXr1+r2vSzduePNOMlcszXVauLVOLPLXv562OZJhWyKBY6rGTk2v5V2cO6MmvqLLYx1xL5dtved1j7uVcXpdfrqa+9/bl/Bx+m+G+7u+OTJ/3YfcPvf2n8HP6bFvW6N65EvZFfUi/e/tP4ef0y/1TcZccift+4v3qfxc/o/dZUvevTdfzMXqp/HzPw1tSbq3V95ls6Ri6dL0JhruxbHSqteJ/Ud+OXm9vf4dluDOseau63GiS5R+s0xW+Oik+xP6Qy1ruDbJPxacFoGayaeke3UI+fyJq9mXJrWLlSL7lojzdXa9/EzmPTsxpCK7jtzHm7u1vj9WpWIw4sjTZEI8rIVL0u919py68vTx4YVMtgTFTBihFqAAVAtQJUC1AAUABUEAAGipGkAMKlQAEqAqBKgKgSoAKgEr2BDqk2uPoLhZj0bViMLcYtJtcXo9TpI8/XRK3b5wXsQyM/atTtWfwR9iGRftWuViw/gj7BkPtWmWNjP+nH2E+sb+9a5YmN/24k+sandYf6fYnwsVfcmPrD+Sn+i9XDFl9K+0fU/lv7R+X5v/APqv20+0n0X+b/LB+W5//LP1SX3k+i/zNM/Ldz/5Wa9DT+0X1rPfHPPy5Ncce76aD6LPfHLd2SMeMLi9K/sJeWv5GFvHnYdbWRdtPulQmVftrus7xutmi/cq8uy5FP6VRl2sXmV32/MNqSplYyfbKFH9EvvNTpLx+icfLmb7zjbk+Ul0/wBgyJvUcWV5Jw7ycsefHhzQ+rc937eJk+Ut3w5/NxpSi1wlBtMljpPZKtnzF5gwKQzLP7m2vifhn7VoYsV7GF5u2fJpG5N41x/DeVNf4uBMR66jZuxUk1OL4SWqJhrmyNtszroManbycvy/GSbig3Onh5mwTjXwhdeNlbROPwl0xoxcnddru/Mw707TT1inWL9MXoXWfq+s2n/cW1Jq1utl2pcPn21WP96PFGtc+vW+txMzDzbKvYt2N63LhKLqGPmNkrNRiytNzHM41OnPPH7iWNSue5i6PQmLK5rmM+FA1rnnYoFaZWOI0aJ2GNVqlZ7i6NMrA0aZWqcho1Ss9xUapWtAJbletTjctSduceEotpr1o1pY+k2rzzm49LW4R/dWl/UVFdS+qRqdftw79Evh9ZhZ+1brb6sS9GcqVlbek16Ys15eey8+XPm7TVNpaGbHTnt87n7U1WsSOsr5PetkhfhJSjryZvnrGO+Nj4tPO2fNUo6NPjyku87/ABY8XUvFfqHlPzTtm8bbc2rc4K9g5C6L1mfGL5NPlR6pmPDpZO4+e3Pa9w8n7xC3OTu7ZffVgZq4Sjx6ZU+OK4mrNjHNsuV9lm41rznsEP28lHftvXzMG49HcVPFak+yX1+sxm/Df/N2PKwb0vMW0PFmvlb7tjatRnpKsdJ2pemlPScvFx6t2bHt7HnLftlltdzwbpiNywnLRxuw4232dVKM6c15/bz+Y67NyXmTZZYkJfI3zbpSliufhcbsNJWp90qdL9vI6PPufMaLV5+Ztubtp43mbaW4Tsy0m3D3rb76+6/vBv5a8qxY83bakl8jzLgRpR+F3VH4X314djLKZ+XFi5NvzHiLZt2f7fe8WscLLmulza0+VcDUrTs+539rvXNn3m3KNmMqeLV25Pmvys4d8a9Xq9uPWy9vcGpwalbkqwmuEk+DR5rHu561yqDqGmcUEbY6kRtgVmt8EVlsVCstseBRmkEXiFbrFmsk2dOOdcfZ3JHdbhRaHbHkdVmNF1P0L0mozXTCNEuZWKzm6QS5t/UCME6VfrDTKK/tDLXm3nZx7lxcUumHpehnu5G+OdrxMS25XIxXLX2HDmPZ31kexFHoeKspOkPToZIxS4BpsWmvJBHmZS92Xboc+no4aKmHRlUAAAoMUJiIGLUGFQKEAAACrgAAAaSNFQI2BKhSoEAVAgEqAqAGiMaI3/aSmOnCtdU+t6qPD0m+I5+zr4djZ0edg2UY0lJ0jGpFbYYF+Wr8KYxNdFvarXGbcvo+ofUvTohhY8F4YpeouM62q3BchhavSuSKLQmBUuCadgxE6YdgEcI9gVpu4WNcXjtxl6UgbXBkeXNqvVrZin2on1jU7ry8nyRhzVbbcX2JtGfq6T214+V5Myrabhcn6pMn1bnuedLbN6w5dVnKvW2uyT+ojWyuvH8z79i+HKtxyra4tron7Vp9BdZvEeja8xbBnLoyrbx5vT9VVj/iVfpJhnU8Mcryjtebb+ZjyTjLWLi04/QT6tT3X8vEn5Z3vbJOe335wjxpF1i/TF6EsdZ3K2WfNW6YlIbji/MS43LXhl/hen0mfq09jA8w7Rm0jbvKF1/0rngl9PH1EsHfPHtzWupDXBk7PZu10oRudPHzfLadelBrXz+b5euQb8IV51u1uG3Xvm4l2di4ucXx9K4M1Kl5fS7X/uHft9NrdrHUlp+4tL6ZR+41rneH2GBuWBuNr5uHejejz6XqvSuKDlmN7tJkXWqdlDGpWieP3ExqVz3MbuI1rmuY7VdCY1rRcsBdaJ2NOAVonZ7gNMrPcNGmVouo0ytDRqla7i6NUrWvAoxg7tm6rtqTt3IusZRdGn6iypY+o2nz1kWkrW5wd+3/AN6CSmvStEzU6cOvRvh9RbW37nj/ADsW5G7B8acU+xrijWa4fa835eHumxtVajVGcd+e5XxO/eX43rcoyjryZeesO+JY+Gms7Zs5Tg3Frg+TXYz0Syx4eubxX6h5Z8x7T5l2W5sm7LqsXkotP37Vz4ZxfanwZj55rdzuf5eLb/1byT5ghhZc+uxN9eFmR9y7brx7pL4kas35jHHX4r6LzRhyvq3502NfrWUv9YxocZRX9ZJdi97u1Mdc/aOvPX0v+HBuOS1G15w2h1trplutmPGLVP10v/H7e0xx+vy69/Hz+Hr7rkTyLFvzpsXiyLUY/wCsY0P6luK0vJdsUte47c3fh5e+frf8Luqubtj2fOvliSW6YkUtxxlxvW4KrrFfFFfQVjwwlkWt+xl5o2F/J3TGpLc8Je8pR/qRXPT2rvIsrdlY2J5vxXuGDFWd+x41ycdOnzox064d5VasW/jb9Zhte7y+Tu9nwYudJU66PSFzvM2NSsMPMz9jvy2zdLbnip0XNxr8UHzRx6416ePZj1ruJbnbjfx5K5YnrGceBwsx6+PZrmdpp8COhFNExNbYplZbY8Qlbo8Cs1si9CstmpcRus2m6VOnHLl7e8dtu2lwO0+Hlt10WrddeCXE0za6IJNp8EuAYrfFN0KYxuNSlpwWiCxKa09oGyOlX2BMeRu95yuwsxdVDxT9L4fQcvZfw9Xp5/LLAtUTm+eiJ64ntruitTo4Jc1kl2EXFXBBS66W336EpI4clVtV7GjHTvz5cph0WoACgFUC6gNQLQAEAYoMAYAwBgDAGNJGgCVAjYCoEqQSoAAAAjYEAgV6li2rdmMefF+k7SPL3fln0Sk6R1ZWG+1gt6zZR127NuCpFDGdZ8ORRagQAAAAYgAFUAqgIAqBAI0uwI0XcWxdT6o8SYstedleX8e4m4omNz2WPDzfLNKtRqiY6z2R5f8Ap2bhXHPGnOzL8jpX1cyN/Fd2L5o3Gy+jNsxvwXxx8M/uYZvD0beRsW6rpqo3Zf05rpl9PH1EJbHnbl5Ix7icrSo3yH1bnteP+18w7Q6Y96Ttx4Wp+OPsfD1GbHWWV14vnFxahuGM4S53LWsfXF6mfqr3MTcNvzY1xr0LnbFcV6U9TOIyu4dq5pKJGp083L8v2bqbSGNTt8/uHleaq4xqg1Lrw5bdnYN5Xsac7N2PCcHRmtLHubX5/wA7GatbrZ+dBafOtqk/XHg/Ua1zvrfZbbuu3bla+bh343VzitJL0p6hzssdUoVQNapWaoYutFzHMY1K0Tx+4N65p2O4iytE7C1C60TsBXPOy+wqtMrJBolaLEapWijTK0BqlbpyKNmJl5mFeV7FuytXFzjz7muYlxnrmXy+w2nzni5dMfdIqxceivR9x+n8J0ne+Xm79Nnh37nsNq/b67VJRkqprVU7heU59n7fn/mPyxG5CUZw9D5jnrG+uJ1H57ct5+y5yu230yg/C+TXYz0TK8XXN4r9Q2Pedm86bF/ou7PpmqOxeX8yzdSpGUX2fWjP/NaudTZ5cOwbvu3k7f5bLu6Uo8Ldz+nfsyqlKNe0tmfMTnrfiuzc8ZeUt0t7lhR+d5U3eXTK3SsbE5+9Zkvwur6fYY6535jr6/Zn+vXhxwzbnkbdrOdiN3/Km5ukU/ErLlrK1L8tOHd6BLvz+U6n1+L4ejnK/wCVM+z5l8uP5uwZ7Tu2E6xjKWrhpw/I/UdJdefqZcbNxw5Y1y3548ozpYua5+GuEJNpzjKK+Fvj2cipG9RsbhaXmXyy3j5dl9W4bfH3rUucopcYuhluPRjj7f5uxpX7Sjjb7aVb9laRu0+OJV8GNnW8iH+keYoPrt+CxmPSUOxTf2mbFlxhc27dtgut26XsOb4cYtfYzl1zrvx27bMsXOh1476bnxWJe8vR2nHrjHq49n7aZ2JRbTVGuRh1RRoEbIoJWxFZrdbhKS0VTUjNsjrtY/BvU688ft5vZ7f064W12HZwt10W7VdeCXF8hjNrbGKeiVEv+KljLfGNKdpRlLwx/NLRegDBKmr4cvSBlGPNgY3rsbNmVyXCCq+/sRLcXnnbjwYdd265y1nN1b72efy91yR61mCjBR5I7yPH1dretFXs19gZa0+qVe3UjTLQIwvukUu8lbjkyP5MvSjF8OvPlxnN1i1AyTAVQQqgKAqBQBQAVAoABUCgKgc9TKgACMAAAgALgDEqDECoBvw7XXfTfux1fp5G+I5+zrI9e1jSnq9I9p1eS12W7UIKiXrETWZROAAABGAqAqAqBjUAAAUAgAABGBAFQI+mSpJVDTmv7fZup0WvYMJ1jyMzYo60iZx0nseJlbLJN+EmOk6jHGzt1wGowuO5aX9K54lTu5oheZXr42/7dlL5eVD5E3+LWL/vfeVn62eEzvLuHkw67dNeDVGifVvn2/t81n+VrtmXXbTTWqktGjFjrO5Wqxu+/wCBSMpfuLS+C6m3TuktSY09jC82bdeSjkxli3Pzax/xImJj14uxegp23G5CXCUWmvoJg5cnasa9F1jqStzp4ef5VtzTcFUjU6fN5OxZuHe+bY67VyOsbkHRr2FlXy9Xa/O+44clZ3S18+1/3oqk0u9cGa1jr1vsNu3jbNyt9eJfjNr3ocJL0xepXKyx1yhUGtU7OoxrWmdgliyue5j1M1qVzXMd1DWtE7DC6552TKtMrJYrROwUaZ2QNErTKNU7YRqlbA9LZvMO47VJRty+bjfFjyfh/u9jNyuffqnT7DHytn3/AB38hqF+njsS0mvvXejfxXmv24r47zV5PbhNOFYv3ZIktjfx3H5jesbjse4Ru2m4OD8MuTXYz0SzqPH1zeK/TNtztl8/bCtrz5/J3PH1wsn47VynbzjKmv3mfnlrqTqbPLn8t71PAyMryZ5ttfo3k7E1L3ZRekbkH/zJizPmM79vhoeO/LGbd8seYH+78tbmn/p+a9U4N6OvKcKr16k6n5jpx7Jf9emjad0yfIu53Nj3lfvvKm5J/Ku06l8uXxrvj8SXpRZd+Yx3z9blew7Wf5P3KG47ZcWbsGck469Vu7Zlr0S5KaT4mnOx139u/bXIeavKF1vH/r43O2+MrdyPHoYWO63Zxt9h/q+xv9pu9h9WVgp0kpL44dqZG49XFzNv8x2lh7jFYu82/CpNUVxrs7+4eWb8MbFzc9kf7TMtvIwHp0PVpfkf2GWp8+G+5seDmR/dbZc04uK0cX6OJLG57LPLWln2v08m2r0VpWS8XtOd4dufb+lVrHnynB9mjOf8bp/MyjiQ7ZP1JFnrS++N0MSFfdr3vU3PW59e6uuFg6TnHDrrW+FpFZbY24x97Tu5srOtiTlTSi5IqWtsY9KWhRsSS1fBfSBrbcnVgWtdeS4IDONFq/YEeRu2T8y4rEXWMHW41zl2eo4d9a9fo4yamFaq+trTkOOdT29Z8PQjE7SPOt2VEl2/URYkVwIrJLUDRffVOn4dCVqNGTRWJeox14dePLh5mHWKQVAUABagAKmAqBQARUEAABsBUDSRpiAAaAKgQBUCNkaiAGBALGMpSUYqrfBIqWvd27Adq3W5TqerO/M+Hk762u+NEqGnKowoAAAAIwIAAgAABGAAARgQAAAmgVKgPUDFqmqMJjRdw7VxPtCz4eXl7SmnoS8unPbx8nakq6GcdJ05rNzcNvnWxNqHO29Yv1Bceti79iX6W8uHyZvjLjB/cGcbsvZse/Dqik09VJcCXlqd2Pns/wAttVaVTNjrO9eT+1zsG5141yVqX5XSvpRG3o4vmzLtUjm2FdS+O34Zex6MmGPcwt227Op8i6uvnbl4ZexkxG+7i2ripONTOLK8jP8ALONfi3FUYxudvmczy1m4d35+PKVucfdnBtNewa18V27d503PCas7paeRaWnzoqk0u9cGalY69b67bt223crXzMS9G52x4SXpi9SuVljqlbqCVqlZ4ixZWidivImNa552O4jWue5j9xGtaJ2O4lalc87HcFaJ2O4DTKz3FGiVnuA1TtKvADTK13FGEHes3I3bMnbuQdYzi6NMRLNfW7T5tsZcI4e7RSlLwrIS8L/i7H3nWdb5eXv02fPLh82eSLWTjyu2Up25Kqpr6yz4ZlnXxX5Lk4u5eX9xV6y3GUH4ZcmuxnedTqPN1xeLr9Ds5G1f7h7Lbxrko4vmPCjXEyHo68eiT5xdPUTx5Op9vmNGzbnZ3fFv+RvN8Hj5dt9OHky963ejVRafDn6Gh4Y/6/8AXClLb7l3yR5xTdhuu27lx6OrS3OMn8L/ALGTrnPmOnHe/wCvRs2953k3Nu+WfMlt5flzKfguKrUIyel+y9dNauPH7bzZWe+bzcr6ZYm4+Vsy3um1XY5m0ZaVJJ1tXrb1pKnBlZelLarGfCPmDyvcdjJtut7FWk4S5qnNPsC66LN3b/MNIXorA32Gv4Y3JLnF9v0mbGtepibxcg/9N3+3qvDDLa9nV94S8fmN9/YbuPNZO33Gk1VOL4r7RhOv2zt7g3SGdZpLg7kF9cSGfp0Rx8W7ranGS9j9jBq/sWnpF+wsGaxZfh+wDL5cI+9Jehav6CpRN0atqne+IZbIW31NvVviUbVGgGSj4epuiQGEpOb7FyQGPHRartA2Rjy4Ac+4ZkcezWL/AFJaW13/AIvUY76yN+vj7V41m05zUVz1bOEmvZbj17UFGKiloj0T4eLq7W7RKr4IpGpPqfUzKtiAjlSLb4JCkcurdebdTDq1Zbas+lonTfHlxo5uoUUAAAyAERUAAAVMC1CFSi1AVIFSjnqZawBgDEGrhUhiVLphUaYhAAgBJtpLVvRID3du26NhfMuKtx8e7uO/PLx+32b8PQ5KhtxR8Q3BhAABAIAAAKgQAAAjAAAIwIAAMCNBUoAboFYucV8SAx+fbXOoE/c2paSWnaExjdw7d2HVGjXIE6eXlbb3EsdOe3lZG3UroZdJ01Y9/Own+jJ9HO3LWL9QV6+Ju2Jlfp318m89KP3X6GGcq5e02rldFUzY1O3hZux0r4aoljrz28XI2twlVJprgyN634u9bthNRcvn218FzV07pcSUe7g+ZNvyaQu1xrr5T931S4ExLK9OVqFyNaKUXwa4EPs8vO8v4mTF+GkmTG52+ZzPLOZh3f3GJOVu5H3ZwdGNa2V1bf5zzsOSs7tady2tP3EF4l/FHn6jUrF9b67Cz8LPsK9i3Y3IS7OK9K5GnKyxtcCLK1SsoYutNyyZxqVzXMcmN60XLAalc87JF1zysjRonZ1GjTO0XVaZ2u4DTOz3DRqlaGj19k8x5m3NWblb+G9HZfGK/I39RvnrHH2eqX/16G+eWNr8w4EsrAam2vFHg0+xrkzrP3HDc+On5Dn7du3lvdY5GO5Wp2pVhPhSj4PuOvPU68vP3xeLsfat7f8A7ibUrlpxxfNeBDwOvT85R4Rb9Puy5Dx8MXL8xq23PxfNOE/Kfmr/ACu+Yrlb2zPuKklNafLuelrVc/SXwz5cVu87c5eTfOMHBWZdGBuD1lZk9IeL4rctKPs+jHXP5jrx7P8A56deybvuvkfMns29Wv3vl3IfurxKKk6/NtfbH7Sc96vfqs8Pr7m2X9udrf8Ayzk/PwLyUlOPii4v4ZrsN657r04WNo80Wfm2V+z3e2uq5Z4Vkvii9OfMqS55RZ961/kPMNpztx0t5qXjj/FTj6UZtb/zHoYzztrgp4s1mbdPVRrVJP8AC1wBcr1bF3b9xhW3/M+K3LSSKxZYwntcE6rRkxNFiXY8Jyp6SjL9vP4m36QNkbCRTWatpLtCayUQasumHHj2BWDlKWr4L2JAStXRaJ8X2gZKNO8CXrtuzalcuOkY+93vkkS3FnNtyPAu3bmRedyfF6Rj2LsPNba9vPMkehiY/Qqv3mdeI8/t711xRtyS660guWsvuCwSoRWXII05E6JRXPV+glb5jXEy25c2VZRj2Jv2mOq68RzJmG6tC6gNFGijQGqo1AaA0VMANAaA0VAUABoM60lSgQQBUCAAABgQD19nwVT9xcWvwJ/WdeOfy8/u9n4j1anV50SAoACagKgQAAANgQAAAASoDUAFxi5RXFoGMHetL4q+gGMXkQXBNgxi8nsjqDGDv3H2BWLuXH8TAxdXxbAjAASgGVuc4OsXTtXIJjpjO1e0ek+wDmv4XHQYs6eXk4Or0JjpOnnX8Olaoy3K2Yu45eJSLbuWecJcl3MGa9ezkYedHwPx0q7b0kE8OXL2uMq6GbGue3i5W00roZx2nTysjb2q6EblY4uZuOBL9C41DnblrD2Ax7uF5nxrtLeXH5E/xrWH3omM3l66Vu7BShKM4S4NOqYxNefnbFi5KdYJSfcTG52+YyfLu47dfeTgXJ2prWsHStO1cyOmyvQ2zzpO1JWN4tfLa0/cQT6X/FHVo1OnPr1/p9VYvWMm0rticbluSqpRdV9BXK/CyhUErTO1oMb1zzs9xLGpXPOwZxdc87T7BjeuedomLrRO0FaZ2+4aNMrfcBpdvuKMJWgN+BmZeBkK7jTcZfFH4ZLskuZqdYx1xOnvZuFs/mrClblCNnP6dYPn3p80dOetebrm8/F8PyXedh3vyvukcnGc7M7Uuq3cj2J93FHfnrfivP368+Y+nnHA/wBwdtWXi9OL5sw4/q2VSP7iMeDT017H6nyHjyxk6+YYG4YfmfEj5a80Uxt8xq2tt3K4mpSktFZuvjx/4rxePDP/AKxxMm/tk5eWPN9mUsJaYuVPxSst8KS1rB8mc+ufzHf192fF8O3Au795GzevG/z+wZTrOxWtuUZfFDioyp7Sc9/tvv0zr5j7COBte+Y0d48uX+m5F1lai+m5bnzTWjR115rLPiu3E3uzkxWDv9tQvLSOTSkX/F+F/QEyzw2T2fcNun87bLvVYlq7L8UJf3ftRMa2XyQysG9NfPi8DKXxfA33SXD1hXqWsrOspfNSybXKa4+1FZsldVvMxLi1k7b7JL7QzebG1RhJVjKLXpRUVxpzXtQRi5Wk/e9moXGErjbpBU7+YMYOkX4vE+xBTWT10S4IDOMKgS5ct2oSnKSjCKrKXL1EtxeZbXhZeXPLuVXhsx/lx+195w662vZxxOZ/luw8bXqkvQjXPLn309G3FUqdHnrOUlFd/JAjXFc+fMauMkQXRLXgUz5ccpOVxvkYrtIySdQV59+fXdk1w4L1HHq678z4a0xjTKpEwBioChAABeIAAgKAAAC6A0Bo01MtIAANgQAAqBAqAdGFj/PyIw16a1l6FxLzNrHfWR9JFKMVGPBHox4b8qUAIAqBAKAr3AxKoGCBiMGKmDGDuwXMGMHkW13gxg8lco+1hcR5FzkkgYwd64+fsBjFyk+LbAmgCgUogGgCgEoAoBGgJQAAAlOYG+1k8I3NVykDGVzHjNVWqfBhNcGRh8dCY1Onn38TjpoZx0nTjlYlCSlFuMlwa0Ya16GJu7VLeXquV1cfWgl5d1zHt3YKcaSi+ElwJifax5mVtqo6Iljrz28jJ29p8DOOs6edfw2uRGpWONkZuFPqxrjh2x4xfpQXHu4Xmexcat5kfkz4fMWsH9wZvL1+m3dtqUWpwlwa1TJjLy9x8v4mVF+BKXaTHSdvnJbfvGyXndwbjVutZWnrCXpiTw1ZK97aPN+FlyjYzF+1y+FJe5J/ll9hqVy69dnh7zinRrVcmVhrnbTQWNErQxWmdkmNyuW5Z7jONa5rlmnImNStE7QxdaZ2grS7RRhK2QYfLQGdrrt3I3LcnGcXWMlo0yylj3fnbfv2I8DdYRV9qlq/Rav7Gdee9eXv13n5nh+Y+ZfKW8+Vt0hnYM5Q+XLrs37fKn/GqO/PW/FeXrj88vZS23z7hu9aUcTzTjwrfsKkVkKKp1w/MXwzmurat3xd5x4eXPNa+Xl2vBgbpcXiUuHy7tfr+0l/wTY3W5bj5VvPad3s/vNmue58XQn8Vt9ncY651347x0f6RmbXfjvvlnJ6sea6pRjrGUePTOPNHP7WO1557j6fat/2XzLH9vlW1g7qlrbl7s6c4SfH0cTrz3ryez19cf8AjttWt22WXRD9fE4/KlqkvyvkdHP4rut3tq3NdLSt3udqdE693aTE+YxW0ZGLKuNdlb/Kn4fZwJi/bV+ZmR0vWYXKfFFdL+gDON63zszj60ylbY3bXK3P6EVnWauv4bdO+T+4DJfOl7zouxaAZQtpcgNlElV6Aar+Ras23O5Loh9Mu5EvUi8823I8PLy7mXPVdFqPuW/tfazh11r2ceuctuNjdcqvgOeE77x6MIKNO4648t6bvDGLlJ0igy1Ks31PTsXYits6EBIDRk3Kfpri9WZ1rmNUQ2l+4rVmT5vResz0vE2vNTOT0KnzLRSC1AoQqDFqDAGFQYqCAAABagKgKgKgaCNAEqAAARhQABGB7WyWUrM7rWsnRehHX1x5ff1849M6uAAAgEAdSXFgxi7sF8SAxeRbXawrCWT2R9rAweRc7kBi7s3xkwMXV86gEmAp3AWiCp0oBRAKBCgEoAoACgABQCNASgEAARgSgGyzfdvvi+KBjp6bd2PVHmGXHexSNSuC9i9xG5XFdx//AGErepj5GRiSrB1hzg+DC2PXx8nHyo6eG4vetviGfDXkYcZVoiY1z08rK2/jRGcdee3mXsJqtUR01w3cajehF1cTNzcKVbFxqPO29Yv1BbNfQYHmHFyKW8hfIuvRNvwt+nkGby9K7Zt3I0klKLIkrwN28r42QpStqkuwljc7eVibnvWxTVq6pZWGtOmbfVFflkyat5lfV7XvGBudn5mNOrXv23pKL70blceubHa4plTWmduoa1onaRlrXPcs6ma1K5rloNStE7S1I1K55WyK1yggMHACq2BlGBR6+NmY+VjPA3SKu48lSNyWridOe/283s9X5j4DzZ5Hz9izYbts85K3CSuWb1vjB8VwPRz283XO+PLvwcrbfPGNKzfhDE8z2Y1mtIwyUtOqPZL/AI9FsYl/b0No36WLD/7e81WpXMOL6LGVOruWXwSk+PT3hfrnzHXkbPu/lq7+72uf7va7vilb4wlF89K0dOZjrnXTjpse37J5gtfPw3+3zIaztPSUWuen1o5WY9PPs+Pl1YPmXfdnksXdrbzsNaK69bsV/E/e9Zrn255cu/606+Y+jxv9C3i383Auxc/it+7OL74vU7TqV5eueufLdCO64i6Yz+bbXw3Nfp4mmfhvhuFqSpesyty5uPiRExthcw5rS7GvY9PrKjardulYyi16UBemEfiivS0Bj82yvir6FUCq5J+5Gi5t6kqV5+Xu1izJxg/3F7h+RemX2IxfY78em3y8yc7+Td+Zfl1S+FckuxI4269PMnM+HRj4taNr1G+eHPr2PStWkkdZMebq63Uik2+C4sqY0Sk7rXKC91faZXGdAqgSc1CHU/QvSBx1lJ9UuPaZdIzj9IqOLNu9dzoXCHH0nLqvRxHM+feYdFQRkUAAFQACpgUAEoEAMlQC0AmgCq7AFV2AaSNpUCAUDEAQAIwAg93ab9qOClKcYuMnWrS51O3F+Hk93N+zfPccKPG9F/w+L6jX3jE9XV/DmnveHH3VKXqp9ZP5I6T0dNFzfnwt2fXJ/cjN9jU/rfuue5vObLg4wXcvvqT71uejlzzzsyfvXp07E6fUZvVdJ6+Z+DCvSWXBzk31eFtuvH0l4vyns5/1e1Q9DxFAFAh0gKAWgCgCgCgCgEoAAAAIBKAAFAAVGAAlAFAMWAAxYGdu7O3JOPDsBjsi4Xo1i9eaDPhz3bHHQLK4b+PTkZrcriu2Kslb1z/LlCalFtSWqa0Dcr0cTc1cpbyaRlwVzgn6QxeXVdsRlGvHSqYwlefkYdeRLHSdPMyMNrkYrpK8+7ivXQjpK5LuMQ104G752E1FP5lnnbl2dz5GksfSYO6YebGluXTcpralo195GbMZZWBYvwcZxrUzYs6fLbj5cycW7+6wJytXI6qUHQy6TrXbtHm2ko4u7L5N5aRv8IS9P4WbnTHXr/T6ZOMoqSaafBo05sJW6kNaLloNStE7RlqVzXLPEmNSuadoNa0ytkalYO33EVOhgZxgBuhBBHdjZqtQePfj83FnpOEtaJ9lTfPWOHs9e/M8vkPN3kOVqS3jYptKDU4u06Ttta1TWp6Oenn653z5b9l3vb/NFiO1b704u+2102cprpjfpwT4eLu9nYWuc2eXbt+fvPlXIeFm2nk7XJ0dqWvSn8Vtv/wl1bzvh6+R5e27c7S3TYMjoucemDo0+a7V6GZwndnlotbtetf5TfMfVaLIUdGvzLl6jF5ejnv9Mrnl7GvUytvvdD4wnal9TRjHWd75dGNvXmXb0oX0s2ytEripL/EvtRqeyxy79HPXj4ejY83bXd0y8e5jy56da9q1+g6T2xx6/q9fh1w3Py9dVY5duPdOsf8AxUNfyRzvp7/TZ+72Plm2PVND7xn+Lv8ATGW6bJDhkK4+yEZS+pE/ljU9PV/DRc3+0qrFxnJ8p3H0r2LUzfb+nSf1/wB1x3snPytL1ykH/Th4Y/Rx9ZzvVrrz6+efC2sbRUQnK3p3WMV6V9p1nLh33rthaUeC0NONrY2oxrLRdrCY0SnK46cIdgVmopUAypoFXRR1dEuLCOK5dd2X5FwX2kdZFigMci6rVuvxPSPpM9XIvPO15n09pxr0qRRcAKBVwABBAUABUAAAUAiigAAADSZVAABsCDQAjYALACAAqBAKjIMWAUmpKSeqdU+8aV9HZmrlqFxcJpP2nrl2Pn9TKyoioUQQogFAFAFAFAFAIAAASgAAwIAAARhQABAJUCUAgEYDl3AWFx25KSdAO23OF6FV7y4xDONN2zV6hZXFesUI3K47tklblc07XcRqVvw8+5Yahc8drhTmilj030XYKdtqUXwaIy5L+MnyJY3K86/icdDGOk6efdxQ3K47uP3Gdac0rc4SUotxkuElpRgextvmOdulrOXXDgrq4r0rmEvL3oytZFpTtyU4S4SWqIw8fdvL2PlRdElLkTHTnp4mJuG67Bd+VdUsjC/7b4x/hf2FlXrmV9ft+5Ye4WFexpqcecfii+xo043nG+cUypK1Ttkalc07ZLGpXPO0yN60TtEXWqVtmWtY9AXVUQmtsYhGV2PALG3DzLuLOsfFbl79t8GjfNxj2cSx5PmXyTh7rbe4bUlbyI6ytLRqXHSnBnaV5b8fFc+x+bIzhHYvNMNY/p2dwn28ErjfB/m9pvyxebHpZGx7psWSs3a7rdt8aaxlHslHmPC7K9fB33aN6j+23GysbM4dMvdl/DJ09hXO83nwwv8AlbKw7ru7deduuvRyfpXAzeWufd+2H+oZtnwZ2K5dty3/AOV/eZvDtO4yjPa8haSjGT+Gfhf0mLG/vWT2vHlqoxa7VqTGvvRbVZXCBMPu2RwrcfhS9JcS9s42oduvYtSzli+yN9rHcuC9bNzhz69rttYqTVTrJjh13a6IwikGUuXYWtG6zfCKIuNPjuy6p+qPJBWyMUuAFoEVNCq479/5kuiHuLi+0jfMSMeFODI0zajBOTdIrVsVMeZkXpXrjlwj8K7jhetenjnI1ojSgFwAoFXAAEAKAAqAAAAFAVAVAVAVA0kUAAQAAC4lAYAAIwFQIAIqAYsggHs7Rd67Dtvjbenoep6fVfh5PfMuu7kdHDQJogaNA0oDSgNAaBUoAoAoBAFAIAoAoBAAVKAAIwJQCAKAYsCEXEKMrc5W2pR0oCx6EZwuw6lx5oMY0XrVaixY47trQjUrku2uVCY3K5Z2iNMsbJu48/DrF+9F8GB61u5ayIdcPWuaCNN2wnUljUrgv42pmx0leffxjNblcV6xo1QY1K5LtkjTLDzszBudVifhfvW3rF+oJfl9Pt274mdHpT6L6XitPj6u0MWYyzcCxkwcZxWvMliyvlMvbc/acr91gycHzS1jJdklzJ4dfjqY+g2PzHjblH5VylnNj71l86c49qNyuHXFj12isytU7YWVonb7CWNyuadomNStM7ZnGta3bJioouoxWyMRiF1PqS7iLGuhStljIvY81O06Pn2PuZZ1jPXMs+WW67FtnmCxKSjG1mpa9/pOvPWvN/z58PE2ret38s3/ANhucJZO2rRJ6ztrtjX3o9x0nTPXG/MfS3tl2jeMaObt1yMo3FVOL0r9jK5zqz4rRYzd92dq1NPJxo/BPVpd0uI1q8zp7OLve056UZP5N1/0rumvc+DK5Xixuu7Nh3NflrXmhifeud7DYi/A3H0OhPq1PZWS2aK+OXtY+sX71shtlmPHX0l+rN6rot4luPBIuM63RtrkE1J3bVpeOdH+Hi/YRWiWVdueG0uiL4t6spiQspOr1fayK3JaAVU7fUUKaa8O3sIRx3sh3awtOkOcu0mtzlIW6BWxKnoISuDNylN/Lg/AuL7WceutenniRymW1QFBgDFCFQCYFCAFAAAKAoAAAAKAoBpIoAAgMAuAE5AAAEYEAAQijIMWBAOvbb/ysqKfuz8L9fA6evrK5e7nY97Q9LwjAdgABQCAKASgIUC6UBoBKAAIBAAEYAByCoBGAAjAgEfAEY0qRQCPiBss3pW59S4c12lTHeumcOpe6ysue5a4/QRqOS5b7SLK5LlvuI3rnnb9qI0wt3blm4pwdGuK5Nd4Hr49+1k2246SXvR5oJjG5aT5CxZXDfx+4zY3K4L2PxM46SuC7Y7iNyuS7ZfYRXM4zhJSg3GS4NcUB7m1eY1Jxx85pS4Rv6Uf8RcT6vau2bd2FHSUX6yYzK+T3nYJ25/uMZuE4+KLjVNP1GXbnrXfsHmd3ZRwtyahkcLd56Kfc+xmpXPv154fRtcOztNOWtc46/aF1puQ/sI1rnlAmNa1ygRqMegi6yjEGtV3+Y+4y1GLQKKgJVg5QkpwbUlwaKlkr0HPC3Wz+2zoL5nCNzhU68975ebv13n5jwL+zbz5dy3lbZNuy9Z2+MJLslH7TpuM/HT6HaPM+2brFWL8Vj5r0lZuc3+R8yy65dcWOnK2DGu6xjQpO65YYG5Yj/y1+cYr4a1XsdUF2Xy6Ibpu1vS7ahd76OL+gbU+kb471P48Vr+GX3ofZm8f5Z/6w3wxpf4v7C6n0X/UcmXuWYx722/uLp9Ucs2779xpdkfCiDO3ipaviEb1BIDJIBQDG5chbj1XHRcu19yQ0k1xXb92++lLotL4eb9JHSTGVuCRFtbUqLsCOHMzK1tWn4fil29yOfXTt6/X+XF2nPXZewgqKKAAoQAICgAAFAAAi1AVAVAAALUDSRQAFiAAAE5AAAEYEIAECoyCMCAKtariij6TDvq/jQn8VNfTzPXzdj53fOXG2hWVoBKAAJQAAAAAIFAIwIAYEAjAAGFQCMABAIBHwAhFAI6MgFG7Gv8ARLpb8D4ljNjtnBP1lRyXbZF1y3bdPtI1HLdh2Eblc04L+0jUa43J2binB0kgPXxsq3k29NJr3ohmly2qBZXHesrXQljpK4L9gxW5XBes6ErpK47lviRXHft0TfZxZpXl+U/PGRt3TiZ3Vewm/DLjO3Xs7Y93sGMWP0mE8fKx43rMlcs3FWE1qmmZR83vuwqSdy2te4zXbno8v+Zp48lgblJuNaWr7pp3S+81K5+z1/mPraJvjVcnyZpyYShz9QXWqdpEa1onAjUa5QIqxiRXNdp8yXpI3GJCrFOtWEVVAUKPQw90lBfKyF8y09E3q0dOe/24d+r8xo3LyxhZ0fn4zUZPVNcK/YdM/Mcp3Z8VyYu7b9s0vk5cHl4sdE376XdLn6xOv2t4l8Podv3za9wSVq70Xedm54Z+x8fUalceuLHa7UXxRWGLxo9gVFZhwoBkrSXBFRkorsAyoAAkpRguqT6Y9rC45Lu4Rq42I9b/ABvgS1Zy0q3cuT6rj6pduhGvDfGCQGWkU23RdrFpJXn5ea5pwtVUOcnxZy67d+PX+a4+S7Dm7Kgh2AZIQUoAAigEBQAAABkAAgAIAAKAA1EaAAEYAABGAAjAhBSABiFTkAAxAjA9PZMjpuSsyek9Y+lHb09fOPN/Y5+Neyeh5UIFAFAAEAMCAAIAAj4BYgB8AIAAjAAAqVAmgEIIAAxYUAlAAAlV24l7rj0S95cPQajFjZOBWZXJdgnUjbkuQRGo57kaErUrmuR4kaaFcuWbiuW5Ua5BXtYeXazLXVHScdJw7H9wY8Fy3qFlcd61oZsdJXDftKhix0lcF20tSNyvL3JfLxL0vwwk/oZYr87gqGoPpfK3mnJ2i8rVxu5gXH+pa5xb+KH3EqWP0+1cxs3FjesyVyxdVYSXChlPD5rftlWs4R0M2OvPWp5b8xTxrkdvzp1s16bF58YdkZPsLz0x7PX+X2DXOtVyNuLGUQsaZw9pK01uJGoxUSVXFOnXJ97+szXT8IRFAqAAAN2PlXrEuq3Ki5x4pmp1Yx3xOvL1LOXiZcei7FRm/hlwfoO3PUrzdeu8+HFneWcS7WVuPRLk0W8pPY0W15gwElavfOtR+C4urT0+99I2rnNdVrzNejpl4bXbK06/Q6fWX7J/F+q67XmLa5+9Kdt9kov7Kl+0YvrrojvG1vhkxNbGf4+iW7bav66foTZNi/x1g95xv6cJ3PVRfST7L/HWuW4Zlx/pW420/ifif3DV+kYKxduvqvTc5d/3Ab7dmMUqA1sSowjC9kWrMaydZfhWrM9dSNc82vNyMq7eeukeUVwOPXWvTzxI0pakUogMkAAqEFKABcAigEBQAACoCgAAAAAAAANRFAAEYAABGAAjAhBSABiFTkAAxAjAyt3JW7kZxdJRdUXcSzZj6fHvK9ZjcjwktV2M9nN2Pndc5cZlQIAACAQBQCAAIA5BYlAFAIBAAEABUaAlAIQQABiwoAAlABKLCThJTXFAr0oyVyCmuZuOdjTchxC65btsjTluwdOBGo5bkQ3HHeSo0RY+Yzd8ycHfYXcWWlhKNyHKXVrJMNY++2/cMbccOGVjusZrxRfGMucWRzzGVy3UNSuG/a7iVuVw37SMOkrwfMK6Nqyn/wC7a9uhG5X54lQqtsfRyCx9L5T8yT2rIVm83LBuv9SP4W/jX2kXrnX6RchZybClBqdu4qwktU0+DI5S4+N3ra3anKSiYr0c3XpeVd+kqbfmS4aWLr5flf2GuenP2+v8x9U+824Nco+wLK1uDI0wlGifcjNWPN7e8zXaeBERQKBQKBAHoKOvG3HIs6V64c4y+xmue7HLv1Tp6NrccS8qSfy5dkuHtOk7jz31dRtljWpxrRST5m2NaJbfjt+4Vr7Mf9NsfhBrJYNlfADWxY8I8IhLWxW12BGSi+CA13MnHte/NV7FqyXqRZxb4cV3cpzqrfgXbzOV7d+fVI45Nt1fHmYrrMEwKEUAgKBUIKUAC4BFAICgAAFQFAAAAAAAAAaiKAADQEAAKAQCAGQCCMCBUfAABiBGACvT2XK6ZvGk9JusH380dvV1nw839jjfl7J6HkCAAAjAgACAAAEoFgBGBAFAIwIACowAGJAoBAI0AoFQAAoShwCx04NyknbfPgWVnqOmcVqaYjluxDTkurVmWnJeXMNx52bcjatXLsvdhFyl6Eqkaj89nOV29O7L3rknJ+sOkez5a3u5teX1OrxrtFfh3fiXegl51+kKVu5bjcttStzSlGS4NMOTnu26r0ksalcGRa4mLHSV8x5t8GzX/wA3SvbNEdeX5+ohtshEK3QjqFfaeSt++U1tmTL9Ob/y8n8Mvw+h8jLHfP5fT7phq9ZlprTQz1E46fFZVh2rzXB8mYr0yvrvLe9fvLf7a+/8zbXhb+OK5+ntOnPTze3158vaaNuTCUQsab3htTfczNjXPl5lDDstCABQFCikCgBVAtAhqBstXr1p1tycfQzUuM9cyumG65Ka6kp+k1965/xRvju8eE7PsZr+Rm+j/K/6tY/7cvai/wAjP8N/Y91t8rT9bJ/Iv8LXPdbzVIwjH6SfyNT0xz3MvIue9N07FovoM3rW5xI1IjSjVACCKBQigAKAAAVAxQYLiEqgBoFABUCoCgAAAAAA1EUAAAIAAAQABGQCABiFGBAIBGBAqxcoyUoukouqZYWa+lwslZNiNxe9wmu89nHWx832cfW438fSKzR6AQCUAUAgACAAAWDQGLAgACMA0BAoBKARoggBgQCBSgEAEofYATcZKS4oD0k1OCkuZqMVqnHmUjkuw0qZacV5aMNx8v5syflYCtRfjvypT8q1f2EdeXyUI6BvHRCIV9f5P3dxl/p1+XglV47fKXFx9ZNc++fy+ouQ4hycV+3xJY6Svj/O6cdpp+K7GP0N/YYejh8GosOjOCIrfBak1ZHTaTUk06NaomtP0nYNyW47bFzf69rwXV2vk/WHDqZXheYcb5WRF8nUxXf134ebj3r1i7C9al03IOsWSV0s2Pvttz4Z2JC/Gik9LkVykuJ2l14u+frcdLWhWY58zTHn36Ga1x5eZQ5uygKAALQABQCAoSgQAtC6qlNAgACKgqgAFAKAAyDIAAoAABQAFQSqAAFAABUBQAAAAAAa6EVAABgQAAAgAAQGQQCMKjAgACMDEKFHXt2Z+2v1b/TlpNfb6jfHWOfs52Poq1VVquTXM9XL56aloGQAARgQCAAAWANRgYgAIwAAKgACEEYEYEAgUAMCIlABqFjswp1hKD4rVIsY6bZrQ0kct6OjJWnBkJdLI1H595myfn7pKCfgsLoXp4yDvy823BkbdNuJB0WuqMlOLpJOsWuTRNV+gbPuC3DAhdel6Phux/MufrK8/XONl6FahY+I8/PpwbEPxXa09EX95zr0ep8OokdsZxiiLjdbiSrHVaiSrHv+Wct4m4wq6WrvguL08H7RKnfOx7Pm6zSFiSXGTX0GemfU+bMvQ9Py/uLw85Rk6WL9I3FyT5SN83HL28faPt+KOrxxybhpYXe0Z6dOPLzqHN1UAAoBQACgAChKBCgFKKgFChQC0AoAAgKACLQChAABQAACgUBUFWoTAAAAAVAGBNQGoFQDUBqBiFYgAAEAAAIwAAgMggECoBKAAJQCMKgEKPZ2bO6l+2uPWK/Tb5rsPR6u/wAPJ7/X+Y9U6vMjIAAABiAaAgAAwIBGFQAwIAAgUAhBAFAIBiFAAEJRQAG3Gn03V+bQROnbNcTbEct7gzNaeRumRHHxb1+XC3Fyp20XAN8x+aScrk5TlrOTcpPvepK9ONsIkVvtxIrotw+glV7Xl7MeJmqMnSze8EuxPkxGO+dj6y7HRmnCPgP9wn4sO2u2cvqRz6ev0Pjugy7soxA3wgRXTahwJVj0MaNGqGVfSb9d/cbPhX+MnKkvT0upevDl65nVfO0MPQUKPtfL+d+62+Km63bXgn9j9h15rx+3nK3blpbtrtf1Ds9bgOboAAKAAUAoABQJVSCLQoUKKkwFGAoBaAACAoAChFCAAABUAAAVAUAAAAUIAACYFAAAAAABiFYgAAACAAAEYAgMggECjAgEYADEKAQCxlKMlKLo06plLNfRbfmrKs1el2Gk19p6uO9j5/t9X1rpZpzAAADEAAaAgBgQAFRoCAGgIACoAaIIBGBAAVKAQAShQBQCrRp9moWx6TdYp9qNRzrmvLiWrHyHnTL6MWGMuN+Tcv4Y0+0xXf1Pj4w4UI7N0IkV0W4kV0W4EHRCAH2WBf8A3GDbuP36dM/StDUebqZXwX+4TruWNbXCNlv/ABSf3GOnq/r+HyygzD0M4wA6LcCK6bcCVY78eHAivZzNfL9pfgvUXriyXw5z/p4tCOxQJXr+WMj5W4fLekby6Wu9ao1xfly9s2PoNzfitx7E2b6cfW4TDotAFAFALQAAAoAJVQRSgUEBWAArAUAAALQChAIAAAFQAABUBQAAABQgAAAEBQAAAAAxCpQAwMdQGoCgCgACMAQGQQCBQCAAI0BGgIBGgoBsx787F2N229Vo12rsNS2J1zL5fR4uTbyLKuQfH3lzT7D1c9bHz++LzcbqFYRgAJQCAADAgEYAKjAgEAAUgxABUAAQCACKlAAAAACvQsuuPFmo59eWi+WrH5x5kyv3O63UnWFr9OP933vpOder1z4edGLI6N1u2RXRbtkHRbhqB0QgB7uwXGldsvg/HH6jUcvZHxvnqTnvtPwWoL2tv7Tn3fl6PRP9Xz0YmHdthADotwZFjptwehFehjwMj081U2OCfxXvqiy/hj/6eK0ZdFSCN+JL5WTauLRxnF+xlidTY+r3KXVeh/Cn7Wdenn4ctDDaagUAAQFAUCaA1aAUIFAoqAAAKgAABRgXUAgihFQEoAoBUAAtAAFAAEBaAAgAAAAKAAAAAGIUAjAgAAAAgACUIBAAjQVAAEAARgQCMKiVQDoyjfhZdzFudUdYP349qNc9ZWPZxOo+isXrd60rlt1i/wDijPTLr5/XNlxmyoAAMQABgQACIFAIwIAChEQCBUaAAQCACKAKAKAKAEtSK7cZ/oes3HPry4t4yo4uFevv+nFtLv4L6RWuJtfmXinJyk6yk6t97Odr2yM4QJo3wtkV0QgQdFuAHTCIHobW+jLg+T8L9ZqVjvw+O83Nz8wZXPp6I+yCOXd+Xo9H/MeTGDqZ11boWho6Ldsiuq1b4Equ6xDh9JB2by+ixiY3OMXcn6Z8PqLWOfOvJcTLaqIGyEPEgPp8ptzjXlCP1HWvNy0GWwBQC0AUAAAyqQFAAWhQKAAABQAFoBQAAIBFQAAAAqAoAAAAICgAgAAAAKAAAAAGIUAjAgAAAAgAAQGQQAFTmBADAgBgQCPmFTkwIBGKR6uw1rc96mlaU6PXzqdvW839l7B3eWgQAxAAGBAABhUAjAgFChEQDEKARgAAGJFAAAAAIrsxv5L9JuOfXl4PnSv+kv3vfjwpTj8XcOnX1eXw0Tk9bfD1EG+PqFG+36iDohxA3w4hK7sL/wBRb/iLGevD4zzN/wDX83/4nP0I5d+Xp9P/ADHnx48jLq3x9QG+1x5BXZa4LgZo7cWnzIVpxXHh66CF8M97/wDqNzjwjx9C938vYKzx4eeRoiBvs/zFw9ZYXw+izP5z9EfqOlefloMtKgAACoAwC4BlQABAUoFAAgKAAAZAAAAIBFQAAAAqAoAAAAICgAgAAAAKAAAAAH//2Q==\" width=\"660\" height=\"419\" alt=\"post-landscape-5.jpg\"></p>', 1, 1, '2024-11-22 22:50:45', '2024-11-23 18:59:14');
INSERT INTO `posts` (`id`, `title`, `slug`, `description`, `body`, `category_id`, `status`, `created_at`, `updated_at`) VALUES
(24, '<p>Buddy came into our lives as a tiny puppy,&nbsp;</p>', 'pbuddy-came-into-our-lives-as-a-tiny-puppynbspp', 'Buddy came into our lives as a tiny puppy, Buddy came into our lives as a tiny puppy,', '<p>Buddy came into our lives as a tiny puppy, Buddy came into our lives as a tiny puppy, Buddy came into our lives as a tiny puppy, Buddy came into our lives as a tiny puppy, Buddy came into our lives as a tiny puppy, Buddy came into our lives as a tiny puppy, Buddy came into our lives as a tiny puppy, Buddy came into our lives as a tiny puppy, Buddy came into our lives as a tiny puppy, Buddy came into our lives as a tiny puppy, Buddy came into our lives as a tiny puppy, Buddy came into our lives as a tiny puppy,&nbsp;</p>\r\n<p></p>\r\n<p><img src=\"data:image/jpeg;base64,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\" width=\"208\" height=\"243\" alt=\"UEQCfjF8W5dbl06q8Ie25n71OrBTJNjHXsQ.jpg\"></p>\r\n<p></p>\r\n<p><img src=\"blob:http://127.0.0.1:8000/c8fc1d48-8162-4765-9628-7f0ee93bdf58\" width=\"900\" height=\"571\" alt=\"post-landscape-5.jpg\"></p>', 2, 1, '2024-11-23 19:15:44', '2024-11-23 20:25:25');
INSERT INTO `posts` (`id`, `title`, `slug`, `description`, `body`, `category_id`, `status`, `created_at`, `updated_at`) VALUES
(25, '<p>Buddy came into our lives as a tiny puppy, Budd</p>', 'pbuddy-came-into-our-lives-as-a-tiny-puppy-buddp', 'Buddy came into our lives as a tiny puppy, BuddBuddy came into our lives as a tiny puppy', '<p><strong>Buddy came into our lives as a tiny puppy, Bu</strong>ddy came into our lives as a tiny puppy, Buddy came into our lives as a tiny puppy, Buddy came into our lives as a tiny puppy, Buddy came into our lives as a tiny puppy, Buddy came into our lives as a tiny puppy, Buddy came into our lives as a tiny puppy, Buddy came into our lives as a tiny puppy, Buddy came into our lives as a tiny puppy, Buddy came into our lives as a tiny puppy, Buddy came into our lives as a tiny puppy, Buddy came into our lives as a tiny puppy,😆</p>\r\n<p></p>\r\n<p><img src=\"data:image/jpeg;base64,/9j/4QAYRXhpZgAASUkqAAgAAAAAAAAAAAAAAP/sABFEdWNreQABAAQAAAA8AAD/4QMfaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wLwA8P3hwYWNrZXQgYmVnaW49Iu+7vyIgaWQ9Ilc1TTBNcENlaGlIenJlU3pOVGN6a2M5ZCI/PiA8eDp4bXBtZXRhIHhtbG5zOng9ImFkb2JlOm5zOm1ldGEvIiB4OnhtcHRrPSJBZG9iZSBYTVAgQ29yZSA1LjYtYzE0MCA3OS4xNjA0NTEsIDIwMTcvMDUvMDYtMDE6MDg6MjEgICAgICAgICI+IDxyZGY6UkRGIHhtbG5zOnJkZj0iaHR0cDovL3d3dy53My5vcmcvMTk5OS8wMi8yMi1yZGYtc3ludGF4LW5zIyI+IDxyZGY6RGVzY3JpcHRpb24gcmRmOmFib3V0PSIiIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIiB4bWxuczpzdFJlZj0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlUmVmIyIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkMwRTFDQjA3OUM1NTExRUM4MzZCQzNEMTA3QjUyMTNFIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkMwRTFDQjA2OUM1NTExRUM4MzZCQzNEMTA3QjUyMTNFIiB4bXA6Q3JlYXRvclRvb2w9IkFkb2JlIFBob3Rvc2hvcCBDQyAyMDE4IE1hY2ludG9zaCI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSI3NUJGRUE5RDkzODgxNkM1RUQ3MDQ2RkFEMjlDMjEwRSIgc3RSZWY6ZG9jdW1lbnRJRD0iNzVCRkVBOUQ5Mzg4MTZDNUVENzA0NkZBRDI5QzIxMEUiLz4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw/eHBhY2tldCBlbmQ9InIiPz7/7gAOQWRvYmUAZMAAAAAB/9sAhAAGBAQEBQQGBQUGCQYFBgkLCAYGCAsMCgoLCgoMEAwMDAwMDBAMDg8QDw4MExMUFBMTHBsbGxwfHx8fHx8fHx8fAQcHBw0MDRgQEBgaFREVGh8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx8fHx//wAARCAI7A4QDAREAAhEBAxEB/8QAnwABAQADAQEBAAAAAAAAAAAAAAECAwQFBgcBAQEBAQEBAAAAAAAAAAAAAAABAgMEBRAAAgEDAgMEBggDBgQDBwUAAAECEQMEIQUxQRJRYSIGcYGRMkITobHB0VJiIxRyM0PhgpIkFQfwosJTstI08WNzVDUWJuKTs0QlEQEBAQEAAgICAgMBAQEAAAAAARECMQMhEkFREwRhIjJxQlL/2gAMAwEAAhEDEQA/APu6nzn1CoBgQCgKgKgAIAAAAAAAAAAAAAAAAlAq0YEAAALUiFQFQFQFQIMAYAwBgAUAAAAAAAAAAAAAEoAoAQFAAAAEqAqAqBQAAAAAAAAAAAAAUAAAlGAowFGAowKAAABgDAGAMAYAwBgDAoA4AWoCoAoAAAAAAAJAKAKAWoCoAAAAAAAAABiAAAAAAAAAAAAAAAAAAAAAAAAAMahVqBKgAAAAAAAAAAAAAACYgMCoCoCoCoCoCoABUBUBUBUBUBUBUBUBUBUBUBUBUCgAAAAAAAAAACAALUBUBUBUBUBUBUCpgAAEKoAAAAAAC1CFQFQAACgAAAAAAAKgKgKgKgKgUAAAAAAAABiAAAAAAAAAAAAAAAAgCoCoCoCoCoFAAYgAAAAAAAAAABUBUAAAMCAAAAKAAAAAAIgAAAAAAAAAAAAFQFAAYgAKgKAAlQFQFRBKlUqBQAAAAKgQAKgKBGAAoAAAAAAAAAAAAUAAAlQFQKAAAAAAAAqGatQFQFQFQAAABgUAAAAAAAKgSoFqBSABKAKMACGgaNAGgDQAAAAQAAAAAAAAAAPgBAAAAAAAAAAAAAASjAUYCjAUIFAKUAAAAAAAAAAgAAAAoEAABdAGhQ0AaANAGgDQAAAAAAAAAAAAKgAACgAAAAAAAAAAAACKEAAAAAAAQoAFxAugDQCAAAEAAAAAAAAlAFAFAFQFQFQFQFRgExdBhoMNBhoDQGgNAaA0BoDQGoFAAAAAAAAAAAAAlQFQFQFQFQFQFQFQFQFQFQFQFQFQFQKAAAAAAAAAAAAAAAAAAAAAATAtQFQAAAAAAAAAJoDVQNUGgNAaA0BoDQGgNAaA0BoDQIAQC6lDUAAAoEAAAAAAAAxqAqAYAAAAAAAAAAAAAAAAAAAQBUmBUYAwBgAAAALoDRg1Kg0qDSoNKg0BoDQGgUAAAAAAAAAAAAAAAAAAAAAAAAAABUBUBUBUBUCgAAAAACaA0BoDQGgNAaJg1ag0qDQGgNAgAAtQFQIAAAAAAYAwVMYAwBgDAGBUotQFQIAAq4AUAAAAAAADAAAAAAAAABKgKgKgKgKgAAAAAAAGBAAAAAAtSYFRgaANAIwIAAoACAAAIBQAAAAAAAAAAAAAAAAAAAAAAAAAAKAAAAACoCoCoCoCoCoQqAQFAAAAAAAAVAVAVAVAVAVAVAtQAAAAAFABUBUBUBVgKsBUCgAAACoIVAVAoAAAAAYAAFQJUBUBUBUAAAAAAE5hVAASoCoCoCoBgQAAAAAAAAAAhKAAC1YCrAgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABagKgKgKgKgAACoCoCoFAAAAABVgKsBUCgAAABUAAEEKAAAAAoAABQAAAACAACoAAAAUAAAAAFQFQFQMAAAAAAAAAAAAAAAAEYAAAAAQKAAFQFUBAFQFQAAAAAAQABSAAAlAFAKAqAqAqAqBAAABUBUAAAAKgKgKgKgKgKgKgVMAAqAAAAAAAAAAALUBUBUBUBUBVFCqAAAAAAAAAALUBUBUAAAoQAAAAAAAAtQFQFQFQFQFQKmAqgFUAqgFUAqgKAA11AVAVAVAVAVAVAVAVAVAVAVAVAVAjbAVAVAAAGgDTtCmnaBKoCAGwFQFQFQFQJXvAVAAAAD1kD1gPWA9YD1gUCNgAFQFQFQFQFQFQFQFQFQFQFQKBKgKgKgKgUCVAqYABUC1AlQFQFQFQFQFQFQFShUBUBUBUABQACoCoCoCoCoFAaAKoBVAAAF0CFAFAKAAAAAAAAAAAAACoAAAAAAFTAoGsAAAAQBUBUBUBUBUBUBUBUBUABAAAAAaAUAUAxClQAAABKgKgAFCaFBoUGhQaKAAAQAAqAqAqBAAAAAAAAAAABagKgNAGgABUABQACoAAAqAqAqAqAAoACFAAAAAALUBUBUBUCgAJVAVtATQC1AVAAAKgKEAAAAAAAAFQKgAAAAAAKgWoAAAAAAMKgKgEAAAAABgQAAAAKgKgKgAAEqAqAqAqAqBAoAYEqAAAACJRQAAAAAARgQAAAAAAACVAVAtQFQFQAAAAAAAAAABUAAAUAAAAAAAAAqAqBKlCoFQAAAAAAAAC1AVAAAFAKAAAACABACgAAACgAAABUBUCgAAAAAqAqAqAqAqBgAAAAAAAAAAAAAAAAMCVAVAAAAEqgFUBApUAAAAAAAlCoCoCoCoCoCoCoEAANQJUBUBUBUBUBUAAAAAAAAAAugAAAAAAAFAVAVAAAAAAAAAUoAKgSoCrAoAAAAAAAAAAqBagKgSoFAoAIAAAACoABQAAAAAoACagNQGoFAAAAADAAAAAAFQFQFQFQFQFQFQFQFQIwAABUBUCOgVNAGgAAAAAYgUgAAAABUBUBUBUBUBUBUBUCAAIAAVAVAVAaANAGgDQBoA0AaAKgKgUAAQFAAAAAAAAAAAAABSgAAAAAAAAAAWoCoE0AaAEBQAAABUBaoIVQAAAAAALUBUBUBUBUCgAACoCoCoCoFAAAMKgKgKgKgAIAAAAAAAAAAAFQFQMQoAAAAFUAqgJUAAAEAAAqA0AgAAAAAAAEqAAgCoCoCoFAgWGgDQBoA0AaANAGgDQBoBahKVAVAVAVAqYCoCoCoCoFAAAAAAUAACoCrAtUAqgFUAqgFQAAAAAAWqAVQAAAAAAMqhCoAAAAAAAAABagKgAKAAAAAFqAqBrAAAAAAAAmoDUBqA1AagNQGoBgSoUqAAARgKgKgAAACE0BotQJUBUCVAtQACoACAAAXCoMSoMKgwqDCoMKgxKgwqDCoCoUqAqAqAQF0AaAQABahMKgwqDFBiAxkgYAwABABUBUBUBUBUC0Q0KIaFENCiGhRDQohoUQ0KIaFENAaLQaA0ENCiGhRDQohoUQ0UoAAAABqAqBUBQgAAAAAAAAAqAoAAAAAAAGAAAAqAqAqAqAqAqBGwJ1BTqAVAVAVAVQCqAVQCqAjYEqAqBQAEZKAAAAAmgDQLhoEwC4lQYVBgDAGFQpUCVAVAVAVAVAlQFQFQFQFQFQFQFQFQFQFQFQFQLUAAqBaoBUBUC1CAMAYoMAYAwBgDAIAAKmAAAAAAABQAEAqYFAAAIUAGoBMCgAAFAVYCrABACoAAAAAAACoCgAAAABrqAqAAAAJVAKoBUAACgAAAAjAAAAACAAADUBqAIFQFQJUGAECwqFKgKgKgAFQIAqAqBAACoCoCoEAAAAAAAAAAAAAAQFAVAAAKAAqAoAAAAAAAFqEwCAAC8gJUBUCoAAAAAAAC1AVAVAVAVAVEAoVAVAVAqAAAKEAACoCoFqAqAAAALUBUABQAGsAAAAQCUClAAAAAAAAAAAAAAAIwIAAtSBUCNgSoCoCoaKgRsBUBUBUBUBVASqAVQAABKgAAACAKgKgRsIVAVAVClQFQFQFQh/xQGslBvjp6Qaz+XHm37KBFULXNv2/2AVW7P4pIA7KfuzT7noDWMoTjxVAaxTQUYXFXAGCbAN6A0TAtQLR8ggoyBq9MuwJqN0C6cRgBRUCVahAAAAVAtQFQFQAAAAAAAAAQUoAAACoFqAqAAAUAEAAACoAAAAALUBUBUDUFAAAAAAAAAAAAAlQFQFQIAAAADAEAAAAjCxAoAAARgAAAABGAAASoCoEAAKgKgRsCaBF0AlQpXuBhXuBhUKVAVYQTAyUahGyNFwCLUCVAVQCoCpRnG44/cBXSdOCl38AmtUtJOHuzXGMvsZK3Ma1dj1uEvDNcYy4kX6X8M+RUxU+0CVAtQMkIzWaKjJAZIDF24PufcDWLtyXB1JTWFFz0CxfQGgAAqBQASgQAtQFQFQAAAAAAAAAoVAVAoAAAAJgWoCoFCAAAAAtQFQAAABrCgAAAAAAAE5AQAAAAAACqAVQDQgVAAQLgDAGDBiAApUCVAVAAAJUBUCdQBsiJVlUqDAgVLoxckuLoTWpzWLvRXeT7LOKwd9cifZf4z50nwQ+y/SJ1XWT7VfrD9Qi/BS4D4KXO0HwdM+0HwdNzkF2NsbORzpFd5qa53rltjZivenX0I3HO1l8uz+b2r7is6fKsfm9qCazVu21o2vpBp8hv3ZJ93AKwlGcX4lQDGoCoFqgpVBDQDKLoEq3IRvQUXpJe5LsBHFOMbtcfJrGUdIzXvRfaiWOk7s+XLbzrmNk/s8zSXG3dXuzjyaOX2suV364nU2PSTTSa4M668/hGBYsJWaYiMkUZoItSooMVMIShCfHTvQxZWmcZQdH6mMa1KmVKhV0AtQFQiaAw0BigwBgACKAAAAAAAUACAoAAAAAAAFAAAAFABAAAAAa6hSoCoCoCoEAAAAAAAAVAVAnEANAaBFwBgAqFQAAAcAIAAVAVAlQBBKgR17S6FRoVM0xJOK4ug1ZGt34cFq+4fZqcVi7l18I09JnWvpIxpcfGQxfhflx5uow0UYLgMXayp2KoxFUZvgmXKmsvlXC4n2Pkz7aDD7KrL/EMPsyWO5cG2XEvTJYyXvTS9f3DGb7GahbitJpLuTGM3qihb/7n0MqfKq12Tj9KKg7V1aqNfRr9QNYdUk9dAKpgZKQwZxuNKldOwYDhaucV0S7Vw9ZcTWq5ZnDV6x/EuAxZWuoaWpEKgZRAqYGOdYd2x86Gt20tVzcf7ASvOy8eO5bfK1H/wBRbTnjvn1LjH+9Qx3zsdvV19enBse7yb/b3nRrRV41XJnHnrHo9vq2bHuN6p8mdteSTFT9hUrNPXQsRmmVGaeoRalRQCYFTCLVUo9VzQI1XIOOq4Pg/sI3rFdpFNQqgAAACoAACAMAYBAAAAAUuhQaAAABAMkwAAAAAAAABAZAAAQAAagoAAAAFQFQABjRBoo0BoxaY0NRq4EAJgDFqFQKAAIAAAAIwAAABKkD6QJUKnUkFxrd5fDr6Cav1YuV2X5frJrUifLjxlWT7yLrLwrhoWCqE3wRcTWXyXzaGJ9mStRprqX6p92XRFcEhjOskUHQBUIJOuvAiI7sYOi8T+gKwldk+L9XIaYx6l2jQ612jRVJhMXrLpjKNxp6OnoGpY3LIbVJpSXfxKmHyrcnWEul9j1QGu5CcHSS9DKIptAZqSA2QuSjw4Pj3gSeOp1lb0/J9wTXM01oRoCskwjKLA3WZ9M06ekM2PKvReFucra0hJ9dr+GT4ergK3LsfP8AmLH/AGe7q/b0tZa+bGnKVfGvbr6zz9z5e/8Ar9bzn6e3teb+4xkpPxQ0ZeenL3c47ovSh0jhWxM1GKyTKjNcQjJF1FGgNFbpoNAKyUuMXqmBpnHonTj2MlajEigFAAKgUAAAJgKgUJgEwBgDAGLUBUAIBdAaAEAtQFQFQKAAAAAAABUwKAA1AAAAABAABcCUUAAAASoWIFAAAAAAMDGoFqBKgKgKgAJUCVAVIpUKxcktW6Igwc38PDtZNa+rGSUvede58CLgmuC9iCs425y5UXazUS1mrEebr3DGdbIwjFaKhcZtGVEAKr4A1krU2DWatPmwlq/LguJcTVpFRqEcl7IctE6IzrcjU5KvEzWsTrEMOsqYdYMXrBiqY0xVIqMusqYzjNlTG63kNR6X4oP4WEwnYUk52W2ucHxXoKmtClqFbIz1A2Rm/uCM7lpXlWOl1f8AMLCXHFVptUo1xTMtqijJMI2xbCOXzDbriWMuPGzLom/yy4fSKvF+XieZo/P2G1kpeLGuqr/LcXS/pocvZPh6v69zr/15/l/N6b0VXwz0f2HKXHp9nOx9VFnePBW2JqMVmqlRmmEZJgWoBMCsIqoBK+waK4udt096Oq9BautJloCgFAaAKgKgKgUAAAAEBQAAM4AwQFqAqAKAAABALUBUBUBUBUCgAAABUDWQAAAABAAAAAABoAAAIAAASrAVYBsAAAxAAAJUKJgUgkpIisHJvhoTVxh6ePaya0dVdEm33EGcbEpe86Ls5msS1ujbhHgte3mXGb0tWaQqvQASk3oqiJrNWpPjoU1krcVyDOsqIAwCdAiVqUc+bd6IqK4v6jFrfEcLk36DGumIpk1cOosSw6iodQF6u8aL1d40VTaLqKpV5lTGanTgypjZCQTG2FxxlVPUqWN1y3DIVY0je9ikWJjkrKEnGacWuKA2Rmu0DbCbVCpjLItO9D5kV+pH3l2oliyuKMiNRsiwNkXQIzyrPz9ryrPGTtycV3rVfSis/l87ZSzPL2dY4ydmUku+C6l9Riz4d+bnUr5TaMjxRo+DPK+jX3tqfVCMu1J+09HPh4e58t8WbjjWxFQTCMuoC9QFTYFqEWrAqaoKjZaklONe2j9YHnyzowvTtXF7smvYzH2d/wCO2N9u9ZuLwv6fsNbrF5sZdL9IEqAQAAAAtQFQFQKAAAAFQFQKEoEAFQFQKAAACgAAAAFQFQFQKAAwIoAAAQCAAAAAACgCoE6gJUBUBUCVAVAVAlQAAAACpoAqQYSuV0jq1z5E1uRjV8+JFYyn2akMbIY82qy0XZzKl6boxjGiSoXGdUrKdQGcbcnq9EWJrJW4riqlRnoEKgKgSqAUb4IDP5fayglFILjg3NPqhP4aU9Zz7dPW4HJmHXE6mDDqYTDqAvUEOtmjFUnwIyvUWCqRRkpAZxnqNTGyEyst9u5R8TUZsbrlqOTDsvx92Xb3MMW44k3GThJUktGmVpuhPQDotXGuD1KjRmWVGSuQVLc3r3S4krpzWqEtTI2wbr6ysuzFfjo+D4moxXzWxQ6Nwy8OXCM7lqndVx+oy63w+F27qt5M7b4wk4v1Oh5LH1ObsfoWHKuNZf5EduHi9vl1RZ0cK2psIyTCFSgmBUwKpAZJhGVWBnBNzWnMI0Zm0wvXZ3Lc3Ccm209UZvGuvHuz4edewszH8Tg5RXxw1/tOd4sd57Oeizn3YaS8S7+InZ165XdbzLF1Uej7GbnUcOvXY29D4xdUbxnUqQSoUQFAAAAFQFAAAABBFAAAAAJQABQAAAAAFAAAAAayNAAAAAAAIwAAAAAjAAAJUBUCVAVAAAoBAgQAMJzjBVloNxZNa6znrLwxfBc36TFrpOcHRLTQKkOu5Lpj6+4YV027UIcNXzbLI53pnx9BURyXPgVSNuc+5FS1vjbjDvfawxVZRKuoBsIKr4AWXRCLnckoxXFsluLJrzMnf8Oy2rS+Y+18DnfbPw78f17fLzr3mTJk30UijnfZXef1+XJPesyXG59Jn710nq5anumU/jJ9q1/HE/1PJ/HUbT6Rsjul74qP1DU+kbIbon78F6tCzpm+tvhmY0+bj6dTX2YvrrdFKSrCSl6Hqa+zneanU1o1RlTDqLqYqY1F6gh1FGSmBkpoamNkZlRujPUupW+3daZYxY25NlZFp3bf86C8S/El9pWZ8OC3d0K1jqt3NC6jqgo3bcrL4T4PsfJhNx51JQk4S0lHR+oy6eW229QV2YsvHHvNRzrwLX6Pm7Lj+OSmv78VIzW5/wAvh8uHyfMWfaWnTk3Ul3dbPL35fT9V/wBZ/wCPu8R0xrK/Ijpx4eX2+XVFnVwrbFhGVQmA0xU9BpioaKhqMkNGSXMo6LEaVnL3Vw9JWayUq+nmVnFqBzZG34t/WUOmX4o6P1mbxK6c+2x5uRteTZrK3+rbXNcV6UcuuLHo590vlrs5t23o9VzTMzqtXiV32Mm1d46Ps5nWdSuF4sZuDWqdV2lZ1EFWoCoAAAAtQFQFQCYFAAAFQFQKEAYAwBgDAIAEBRoDQKAADXUjRUBUBUBUCAAFQJUBUBUBUCNgKgKgQaA0QaA0BoDRBotSCMDVeyIW/CtZvhFEtbnLXGEm1cuusuS5Iw6SYynJJcSwrG1Cd2XGkebKzrttxjGNEqIuM2jYxGLlyWr7Cjdbs856vsKza2KpUAjEDKMGwMuiK4qoMVugHi7/AGs+50uzFzspaxhVuva0jl7Ja9Po65nny+duYmcnrjXV/cl9xx+t/T0/yc/tzXI5EH47co+lNfWTG51Gh3dRjTF3u8gfPKjJXwqq+EbI5HeMG+GTKNGnQJjus7nNKk6TXZIsrF9bst3ce77kumb+F8Dc6jlfXYkozg9VTs7DTnh1lReoiHUUVSKNkZoJjbC4i6zY3wmWVnHVYvOMlJcjWs2NO44/S1k2lS1N0kl8Mv7S1Jfw02rtQO6zPTjqaLGO429Y30tJ6S/iRmxeK0W3/YTWnZjPxR7mWVivE3RfL84QfBXLVt+xyj9hK1x/y+M3yHR5xzor4r3V/iSl9p5/Z5fR9F/0j7SHhVtLlCP1GufDz+zy6YPQ6RxbEzTLJMgtQKnoBU1UDKoRkteANdNuy1HqueGC1dS4xWE7/W0l4Yrgirixmys42KaCWMk6gZAc2Tt+NkVco9Nz8cdH6+0z1xK6ceyx5WTg5GL4vehyuLh6+w4dcWPTx7J0zxs+UfDN1Xaanf7Z79W+Hcui4k4M6S64XYxdU6PiGioBMC1AVAVAAAAFqAqBQAABUBUBUCgAAQBgDAGAMUIULoUGjURoAAAAAABGBKgKgSoUAAAAAiAEAAAIwuAMSvs5FVz5OUoLphrL6jn106ccftjYstfqXPfZGmc5pAarcZXrqhH0t9iLEr0YQjbgorgjTnaN09IRrncSRRuxbfh+Y1q/d9BYza3FZRgRsK1yuUIrlv5F1LwzaM2tSOd5t3nNk1r6xP3Vz8bGr9YyWXc/G/aNZ+rNZk18T9pdPqzWbJ8WEvKSlj3FS7Zt3F+aCYyJJY57m07LeXjxYxfbbbh9TJ9I3PZ3Py4r/lHb7muPkXLL7JpTX0dLJfXHSf2ep5jzcnyhuttdWPK3kxXKD6ZeyVPrMX1105/s83z8PGybGZiz6MizOzLkpxar6KozebHady+K1K+zLTYskDfDK04gdVvL4ageli7k1Hpn44fhZZXPrjXaoW70eqw9edt8fUdJXDrnGlSaTTVGuJqMHUBVIDOMgNkJhLG+EzUYsdFuZpLHdYlC5GVq7rbuKkvvNSuVjyrtu5jX5Wp8Y8H2rtDU+XTYuVKV3Sj87Gna4unVH0rUlZnw861LgZdHbjS8SLGK8jzD4fM+DP8AHZp7Jv7y1fV4r5TzDa//ADm6vxqzL224nm9nl9D+v/w+qbpcp2UXsRvlx78uiDNuVbEys1a+wIyqFKsI2W4XJvwxbYxLXXDBuOjm1HuWrLjNrphZsWlWmvazWMtN287jp8PChFnw8/Iu/t5r5mlqTpG5yT7GZtx1k+3hthcTVU00+DRZWLG1TT0KmNkZNDUxsUypjJSCMtGqPVcyYPMzNoi27mN4Zc7fJ+jsOfXrd/X7s+K8+F67Ym06xknSUGYnw73mdR6VjIhfj3rlzOnPWvPefqsk4vuNGpUiiAVCKAqBagKgKgALUCgAAAAAqAqAqAqAqBQAAIBMAY1hoAjAAAAACPiBAoAAlABEAAAABAAALEYUA5MrKUU4x482Y66dOeGrEtdcvnT4L3V2vtMRu11SdFxNI5bt3iKsd2FYVu0pS9+aq/sNcxz6uuhySNMNUpEWRy3rlERrHp412Fy1FxdVT2GpXLqNjKywkw01TkBzXblDNWRxX73HuM10keffvtOqZG5Gq3uMK9MtH28gY3q+nwYMZfuEDGSyEXUxksksqWNsckus42wyl2l1MboZXfQaz9W934XYdF2MbsHxjNKS9jKmY8vM8qbLlpytdWJdfOGsK/wv7DF9crrz7+p/l81unlXd8FO5GH7mwv6lmraXfHijn1xY9HHv5rxo32nro+zmZx2n7breUZV1Wct14geji58otNOlAlj17OVYyko3Wo3PhudvpOnPTj162FyFy1Jqa9HY13GtcbGHWgjJTQGyNwDbCeppmum1M0ljss3NSxixnuVr5+KsiP8AMsqku+H9jNOfPw8/Hu8A3XrYl1KSYY6ceVD5OVcguFax9D1Rmx05ux0Yz4GoxXnealTdtrudquL2OL+0tX1/l815hh/+d26fFZsS+hr7Dzezy939b/l78n+tL0mo5deXRB6G3OtkWwjJMI6rGDeuJSkuiPa+PsNSM3p2W8GxDVrrfazU5YvVdHhiqJU7kaZtYudNW6ImrHNdu9bpyJrTFEGN61bu23buKsHxRLNXm5deDd/c7dfdtSrbesK8Gjz23mvZM9kehiZ9q7p7s+aZ1571w79d5diua0rU25WNiZUZqQZxsjIqM06gc2Zg2cqOq6bq92a4+sz1xK3x7Ly8WUL+Le6J+GS4NcGu44WXmvXLOo9DGy43I9Mve7DpLrz98WVnOFOHA0REFGAQFAAAARagKgAAFqAqAqBQAAAAAVAVAuoDUBqBpCgAAAAgAASooEYCoEAASgALAKlQAAAAbA5srI6E4x958THVdfXy8+3F3byh26yfdzOcdXqaRj0rRLgjbm0XZ0CxzW/1cu3Dk3r6ET8rfiPbZ1edhJ8QrRdkZajivz4ma1HE8zIsScrU3HtXJ+pjW8ldOP5nSfTkx6eXXHVess6c76np2dysXo9UJKUe1OprXO8s3dty5tFTGqdqE1pOnpRDXNc2+5L3bkHXt0I1O3DkbPnuvTBTX5ZL7Q3948rJ2vcYLxY9yi5qLf1VCzqVwfucrGnRp9POEqoY067G5Wrqon0y5xfEmDesjvIjJZAGxZPeBsjkrtKjbDJ7wmN0MrvNSpjohl6rUsrN5ddnNpwZdYvLm3HY9n3ROV638rI5ZFrwy/vLhL1k65la49vXL4zefK+67Z1Xen5+Itfn29Ul+ZfCceuLHs9funTx432uZh1dVnKaerKr0cbOo1qQe7h7hbuwVm/4oPg+a9BZXLr16uVYlZknXqty9ya4M3HBpUyjZGYStsJhHRbucCxHXauGmLHoYl5Jrq1i9JRfNM6Ry6jysmxLFyp2vhrWDfOL4ErUuuzEu8CxLGzdlrYvcpR6H6Y/+0lOExZcCxa5PNq/X2mf57kfaov7C9Hr/Lwd/gv/ALzwpfjxbT9k5o83s8vZ/W/5r02/1p/xP6zcc+nRCRYxXTj2Ll6XTbXpZWL1j2LGFasxTfim+MmdJy4ddVtbKiORFYSnRCrHPcuuWhGmKegF70FZLUI05uHbyrLty0fGEux9pOudb47vN181KN2zdlamumcXRnl8PfLLNd+LuMoUjddY8pdhvn2ftx9np3w9W1djOKcXVPg0d5deSyxtUgjOMio2RkVGadSo15GLayLbhNfwyXFPtRnrnWuO/q8K9ZvYt3pnxWsZLg12o89lleyWdR34mTG5GkuPNHWdPP3xYznDpdV7vIpKxT7eIUAAALUBUABQi1AVAVAAAAAC1AoEqAAoAAAA0kAAAAAQAAAAAAXEBgDCoMSoUAlQFQFQI5Aa795Qj3sza1xzry7tx1bZyteiR1bbbpCV18ZOi9CLGenTNmmXJkT0M2rGva5dWen2RbX0Ic+V9nh7ctDs87VN8SK5rr0ZmtuK8zNajzsjgRuPPvLUqudXr9ifXZm4S7UUx34vme5bpHKg5L/uQ4+w1rN4e1i7rj5EeqzcU1zXBr0oa5Xh2Qv15lZ+rYryB9Wcb0u0J9WUnC7HpuRjOPZJJ/WVMcGR5f2S/wC/iqE38dpuD+h0GL9q5Z+V7fCxlSVOCupP6Y0+oWNTu/lw5GxbtZ1VtXornafV9DozH1ancrz53LltuM4uMlxi9H7CNKr77SjOOS+0DdHJ7wjdHJ7yjpt5XeEsdVnLfaNZ+rvsZq4cno09Ublc7y8bfPJuDuEZX9t6cXLesrT/AJU3/wBL9Ghm+uXw68e+8/FfCZeNmYGTLHyrcrV6HGMvrXajjZj2c9SzYWsnvJY1r0sTOcaakV9Ht2527lv5N5dVqXFdneiy4598ayy8aViSafVZn/Ln29z7zpHnxpjMDbGYRuhMsR1WrjKzXfj3NUbjnY2bvZd3Dhkx1nYfTP8AgfD2M1WJflxYdzxeoRa9LNXzNtcudqUZep6P6xU58ubDnWhI101+bv5O2T7L7VfTB/8AlNdJ6/Lw9/jXzVtc/wAWLFey5L7zh7Hs/rf813/1bn8T+ssc66sSxO/dVuHHm+xGpHPq4+jtWYWLahBU7e9nTHC3VlMqNcpkXGEp0QXGid1vQVWMWQZJVAoGyFtvV6ICZN+dqEXGnRWkqhHl7riwy7H7myv1rSrKHFuPP2HL2c7Nej0+z63L4eLbnVanne11Y2TctS8Puviizqzw59+v7PXx8mF2Oj8S4x5no5714+/XY6YyNubNMqNkZllStsXoNRpysWGRacJ8fhl2MnU2NcdfWvCcb2PecJqkoP2rtPP4e2WdR6Vi8rkPTxR1l15uucpOHRKnHsfcElQaoNBDRQBRAqgUqAAgVAtQJUCgAJUCgAKBQAADUQSoCoCoCoEC4AwBgDEBgFSoAABGAqTRBogXAqJKSSqyW41I8/IuuTq+Bytd+Y4L82Ytbx7ePDox7cOxI6RyvlLr4gjz8mXEza1I1bVd6dyhXhJNfb9hefJ7J8PopM668zXMlajmu8GRpxXloZajgvxeobjhuxdakVyXYlXXLdgVNcz+Zbkp25OE1qpLRhHo4nmXNsNRvr50PxaKVPoRWbHu4W94mVpbnSf4HpL2FS8u+GSGcbo5BdTGyN9F1MbI3kNTGxXu8qYXreNkw6ci3G6vzJV9vEDysrythXavFuSsS5Rl4o/+YmLO68PO2bc8KsrttytL+rDxR9fNesmNTuOGN5omNNscgYrdDJ7xiOm3lU5gx1Wct14jWcehj5rVNTU6ZvLozsLbN5xlYzodUor9O8tJwb7H9hqyVjm3m/D868weXNw2W9+ovm4k3+jkx9190uyXccO+bHs9ftnX/rzbWRSlWYx116WJnuLWoxqPqNr3S1dt/t8jxWp6eh8mhKx3xpmY1zFu9LfVbkq25rg0dHnYRmBvhII3wuFK7rF1GoxY9XElC5GVmfuXYuEvWdOXHuPEgp2MidqekrcnF+oivbxl87Fu2vxwkvXTT6TUYvw83b51aqZjr22+bf8A6Xhz/DkQ+mM0a6Y9fl4e/wCm97Jc/FZnH2Si/wDqOHsev+t4sdv9a5/FL6yxmvoNmx/l2fnSXinw9COnMebu/h2zlqaYxqlILjCU0NVzznV8RqoBUQZx1CNkILmXEbUMTWNy3GduUJcJfXyYI8Wd29iZDi9JR9jX9pzrvJrzs23ahkddn+Vd8UY/hfxRPP3Mr1+rq2fKQRl0brTnGXVF0aLGbNeri5LmqS0a5nfnvXj9nr+rqUkzo4s0y6ljbGXt5FTGaftKlcu5Yf7i11QX60F4H2r8Jz751v1d/W/4eRi3+iarwejRylx6++dj1I0uQSr3pnXy8vhr1XHloyNpUGKDCoMKgBqKXQqFKgEBQAAByAVAAEBQgBasBVgKsDVUi4gMAYAwAlQpUA2BKsBUBUABGwJUAwFTKlQMWyhxA58m5pRGOq68xwXpaaHOusjinKs4+ojT6RaRil2HSOFaL3BirHnZL0MVuPNlelZvwuLjCSl7HUjVmx9dZuwvWo3IOsZKqZ3jyWYS4FWNFxGWnJdjoRqOK9AjUcV2GpGnLO2Uc120Ucty0Ec87YHPcg06rRrWpR14m+bhitRlL5tv8M+PqYZe7heZMK/SMpfKufhnpr3PgDHqRyk+D0JpeW2GRUsZxtjkd5dTG2GQWVnG6N/tKmN0b/Yys2OPO2Pa85dUofIvf921Rf4o8GTFlsfM7j5c3PCrcjH9xjrX5lurovzR4omNzuPKV9rmRptjlUZR028vvJiOuzmPtGD0MbOaa1KmPXs5WPlWJY2VBXbF1dM7ctU0zUrj1zl2PhPNnk69tnVm4Nb22vWXOVrun+XsZz64x6vV7vt8Xy+atX6PjQy7yvUws9wkmmZrevr9tz7Gdjftb74/y584yErl3z+Wm7au492Vq4qSj7GuTRtxZRnwCVthPUDrs3NTWpY9TEu6rXgzfNcu41b9b6cm1lRVI3o+J/nj/ZQ1WOXXtN7WIidxw2Y/Kz71nlC5JL0V0+gjpfmOnzUk9ghL8F61Jf4un/qN1z48vC8xfzfL93vux/8A42cPY9f9fzXdGNcqcfxTp7RE7fVKluEYL4VQ6x4/y1SmVWqUwrTKZFYpgXqAyimwN8IUQRsRWdWgRaFHLue3rNxnCMvl3kv0rnY+x9xnrnY6evv618c8bLxsl2cqLV1dvBrtT7Dx9Sy/L6fFlmx3WouiqZG1NIqOvDuLqkjrw4e6fDvhJHfXkbosIzWn2FGyL5lYZphHj7ti/KvLIgvBcdJLkpdvrOPsmPX6O9mUw72nS3quA5qezn8uu7Drh1LiuPoNuXNaKkdFqAqACKDFBiFAABasBVgEAAAUABagKgKgAAGoigEqAqAqBKgKgAIAqBKkCoCoVKkAAAAnMoknRNi1ZHDelVtnGvRI4rz0Zmtxw3Z9Mk+x/aRX1FuXVbi+1L6jrHnrVe4MVY87IXExW48rJXEy29Ly3uaUnhXXRcbLf0o6cdOXs4/L6CSOjg1SRGnPdgRqOS5bI05LtviRpyTtoK5rlso57lsDmuWyjnnbCOe5bKNE7aLEsbMfcc3FdLU24L4HqhUexh+Z7Mmo5EXal+LjEYPZs51u5FSjNSi+DTqZMdEMpdoMbY5PeXUxthkuhdT6t9vKb9RdS8uq1mNOtaMuud5cW57Dtm5JySWNkvX5ttaN/mjzKm2PkN22Xcdsdb0Oqy/cvw1g/ufpI3OtcML7TCt9vKoyK7LOY6geljZtGtQWPcwNzi04TpKE10yi9U09GmjUrl1w+O85eS/2sZ7ptUerC96/YXGz3r8n1Geuf07er2/ivkLOR0unYc3plext24ytzi0zNiyvtMe9b3bDUU0su0v03+JfhLzXLvlxxck+mSpJOjXeacq2xkCN1uYV6GJeo16TUrFj0863+42i6o6zs0ux9C0l9DOvmOHiuLZ72qQi9Ms5fL3qT5XFCftVPrRCeHV5hip+W7/5FCf+G5Fm6xz5fPeYJf8A+Xs17/t5HT/ih/8ApOPs8PX/AF/+q9LG8W62Ic5yU/UopmefK+yfFr6K5PU7vHGicyK0ymBimFWoGcVUDdFJBGxFRkgyyQFRRSjTk4djKt9F6Naaxlzi+4x1zL5b47vN2PAz9uycN9T8dl8Li+3sPN168e/1+6d/+uL5hh1xuxb3TdXZLQ1zWO+dj1rU0d48NjojIsZbk/CmVGUHQrNbEVEv2YX7M7UuElSvY+TJediy5dfPwc7V1wmqTg+mSPP4r235j1bNyqT5M78+Hm6mXGN630uq4EWXWvQjQBUAAoAMgBAUAAQBAUAAAAABQCgGupFQAAAAQABCUR8QoQAAEAAAIwAEZRhdfhMdN8OK49DnXaOG++JluPPyGG30ez5CvYFvWsorpfq0OnLz9z5b7yDMcORDiZrpHk5MdWSNx5l1zt3FODpKNGmu0qvrNi3uGdZVu5SOTD3o8Kr8SN815vZxj05RNsNU4kWOadsjUc1y1UjTmu2SLHLctBqVzztBXNctFg57lopXNO0EaJ2io0TtsqWNE7fcVlLd7Jx5dVm5KDXJcPYy4PTxPMk40jkxp+eH2ozeVnT2sbc7N+PVbmpLuMtOqGUnzA3Ryu8JjdDK7yys2Om3ltcy6mO21mxnF25pShJUlGWqa70zUrl1w8PdvJ1jIjK/tT+Xd4vFk/C/4G+HoZcNs8vj70L+PelavQlbuwdJQkqNP1hrWdu+RddlnJpTUGvSxs2lNSD6Hbd2S8MnWL0afBp9pqVjrl8h528lxxYz3fao9WHJ9WRYX9GvxR/J9Rnrn8x09ft/FfH2chxdG9Tm9Mr6DZd3nYuwkpcHoZsb8vsMpW8vHW4WeLp8+K7fxGpXn75xyRlwNObZbmRp141yjLKzY9/a7sZSUZ6xkulrueh14rh7I8rFjLFzrmPLjam4+x6FPw6970y8K9+ODhX+F1/6hUju3CHzfL2VHjWxcf8Ahj1fYa/DM8vlt4fX5RsXeLs5NmXorWP/AFHH2f8AL1en/t3bbc6vMOHro7EWvY19hz4vy6+6f6V9DcnVs9DwtE58grXqBkqsDZCLA2xQRsRYMwzWSAyQRSgUVASkZJxkqxfGL4Ewm+Y8LdNi6Oq/hpuPGdni1/D9x5+/V+Y93p/s78dPGjcocNeqx7GJeVy2nz4P0no4vw8fs5yuy3I2410Ql+lX832FjDJNlStq4L2/eVlkmWDyN6suF+GQl4bi6Zv8y4e1HD2TPl6vR18YYV1OCj+HQvFT28u10lB86cfQbcZ5c0l0yoZddSuoFQAABagUAAAAUAACUCACoFqAAAANNSNFWBAKFAMRoDQAj4gCAAAxKAVGQAIAqFa7r0RjprhyXOBzd3Df5kajz8gK6tgzlZynjzdIXfd/iX3mpWe+fh9JNVRtwcd6DM1qPNybXFmXWPKyrXHQNOFzu2bsbluThcg6xkuRUx9bsnmOzmRjYyGreStNdFPvX3HTmvP3xl17Mo6GnNqlAitE7epGtc1yyRpzTtdwVzXLRGnPOzx0CxzzsrsKOe5Z7gOadllRona5UKjRO32IqNE7ZUaJ2u4I10uW5dVtuEl8SZWcrtxd/wAqzSN9fMgviWkvuJY1Ons4m7Y+Qv05rq5xej9hnGtdsMjvIrdDJfaDHRby2uYTHZj7g4teIsrN5dOZj7ZvFhWcxUuJUt34+/H1813G5XK82Pid78vZ+0z6pr5uLJ0t5MPdfdL8LKkrzoX2qINa67OQ+0GvRxc1p8dDOK+l2neEv050lbkqSi9U09HVGpWOuXxnnnycttl/qu2xrtl5+O2tXZk+X8D5dhm8unq9v4r5WxkuLWph6JX2XlbflavRt3HW1Pwzi+DTM+GrNj287GWPdTtvqsXPFan3dnqNx5rMaIzCN9q5RojT2dvv6x11Rvi/Ln7J8M97h8vc7ORHSORbTb/NHR/RQ61w5/TZvC69sxby/pXUm+6cafWiVZ5enir523/LfCcZQ/xQaNTwzfL5CSd7yTnQ+K0o3P8A9ucX9jOXc+Hf1X/eNu13aZ+zXuVy3K23/DT/AMxw48vV7Z8V9NefS3Xk2j1PnudurCqotsDbGNAM6gZRYRsTLBkmGayTAyTCMqlCpRUwLoAA8fetnV2LycZUvLW5bXxLtXeef2+rfmPX6PfnxXj7fk9N3pfCWnoZx46x6fZzsexCWp6JXhrssrqsT7mmbjFZII2QlpXs19XBlZZUo6dhRpz7Pz8O5BKs0uqHpjqY7mxv19Z1HjYU6SXYzjz5ev2TY9a3L28ztHjY3YJppcYcPQK3K5+OnYYdFKFQKACKmBQAAAAAIC1AVABMAYVClQmFQY1EVAFQpUgVAgCoCoEAFEqAbAxqRSoCoEqBGARFYXORjprhy3VxMO0cV6LI3Hn5EQ08+45Ql1xdJRacX2UCvrNm3SGbiqr/AFoKlyPf2m5XDvnHXcjVaCsSuG/a0ZMdJXmZNnmRuPLyLIVxXItNNaNaposHu7P5unZUbG4VnDhG+tZL+LtNzpx79X6fV2L1nItK7ZmrkJcJRdUbccwlDUhrTO2MXWidojWue5ZI1K552aIY1K552Qa552Rq657lgaY552NSmOa5ZGpjnna1enoLKmOedpl1MaZ2hqY0TtJl1nGidpp1WjXBoqOrG3nMsUjc/Vgu33vaSxfs9jE3nHv6RlSf4HozONTp3wyF2hpuhkNPQI6rOZJOtSD1MXdouErN+Ku2Zqk4S1TT7amp059ca8LfPJ6cJ52zt3LPvXMT44dvR+Jd3E3Plyvw+XhccXTmXFjqtX6EXXoYuZKLTTMtSvqdo3azdtyxcqKu492Lhcty1TT0aaNSsdcfmPgPO3lO5seXHIxlK5teS38i49XCXH5cu/s7UZ65dPX7N+Hh4eY7c006NGbHfnp+i+Xdzt7ngvAvSSuJdVmXZJGZT2c78sZqdu5KE10zg6ST5NGnBnC5qRY9LAv0miwr193h87Z43l72LcUv7s/C/pod54ea/FS4/neXMjtgo3F/ckn9RE/Lt2e71YVuXZONfqNQ68vCwcfqxd725caZFqK/xKJjpvm5ZXj7bkv/AErbMnnj34xfcpr+w808vodvssudb7UdVJKXtVT1PmMYQbSrzCttKIC1AoFTCM0wM0y6YyTCYyTCYqZTGSY1FTApQqBa8CD57zBtqtT/AH9hUhJ/rxXBP8Xr5nm9vGfMe3+v7d/1qY1/5lqMufCXpLxU9vPy9bBfVCce1/YzrHn6ZRNMs4UrTk9AjJtuMXz91+oIzi6NMqV87dt/IzLttcIzfT6HqvoPNfivfzd5enanVV7UduXm7ny2z92MvUy1mOa7HpnpweqMV15rEmqo0KgKlFAtQhUBUBUBUABQABMBUBUBUBUDVUyqAAAAoaATQBoA0AjYE0IqVABUqDCrAgRALWgqtcjHUa5abkao5u0cl6PEjcrzsiIaedkR1YVoxc2/hZMb1ritJLk1zQSzX2uBn2M7HV20/wCKPNPsN689mMrluqYWOK/YquBMbleXk4zoyNa82/jtci6rhuWmiyqzwdzz9uudeNccU9ZQesX6Ua1nrmV9btPnDAy+m1lf5a+9NX4G+6XL1l15uvXY91xjJVi6p80Vza5WkMa1qnaXYTFlaJ2Q3K552KciLK552GMaaZ2O4YrmuWNOAHPcx9OA0c1zH7i6mOa5Y7hpjnnYfYUxonZKzjmuWtSpY0TtcdCs2Oedqj00faEdGPuuXjtJv5kOyXH2jD7Y9fD3fGv6KXTP8D0ZnGp1r0IXuddCY03wyGqNMDvwt1vY9xShIeEslbN02TA32MsjC6cbdOMrb0hdf2S7zpz1rh1zY+Mv2cjFvzsZEHavW3ScJcUys62Wrui1JjUd+LmShJajG5X1m3Z2FueDc2zcIq7jX10yT4rsa7GuTLHPrn8x+XeavLuZ5d3SWNcrPHn48XI5XLdf/EuaM2OvHemybtPGyIzjKjTOdj0cdP0TJuQ3HBhuVmnXFKOTFfRIkrn3zlcMbmppjXbi3aTQV9RttMrGvYsnpehKC9NNPpOvF+Hm9sc+x1vYORiyXinbnBrvaaKz02+X7vVtku2HTJ+pqpeV6jTj0seas2214bzjdp29cU39JL5Pw+UxbXytu3bD+LCvSaX/AMC4/sieW+X0t/1j7PEvQyNuxMni5Q6JPviejm/D5/smdVtV1cDTK9deAGSYFTAyQRkgMkwMkyoyqBkmErJMC1KKmEZIBQDGVuE4StzXVCacZRfNMlWXHzELUsLPu4cvdr+m3zT1izzZ9bj379+dezts9XXlRv20+078vH3HQ1STXY2aZZIIz4ua9EkEIsDyN6t9GZC4uFyCr6Yun1UOHs8vX6LvLbiS6raOnF+HP2T5da8UHH1+w05tV1dVuvOP1Ga1K56mXRakFqgIaFAVYCrCFQKAAVAtQFQFQFQAFAAaamVQAAAASqCoAAVQEYEBhUGI2FKgRsBUIUASFIwkSrKxkqpnKx3lc12FTLccF+2G5XnZFrVhXm3o0YEwNxyMC/8ANtPw/HB8Gis3nX2u3bni7hZ+Zal4qeOD4p95ZXGzG65brwRSVw5GOtdCNSvNycbjoR015t7H7iwcV6z3FlHJctal0dm279um3SXybvVaX9GdZR9XZ6i6x1xK+r23zntuTSGV/lbr/FrB/wB5cPWXXHr12eHuxdu7BTtyU4vhKLTT9hXO7GMrXcFlap2UyLK0Tsdwa1pnY7g1rnnjrsIutE8dUJiytE8dc0VXNcxteAHNPF7hquW7i8RqY5rmMXUsc1zH46FjNjmuWH2Gozjlu2X2GmbHPK2/R3hnHTjbpmY9FJ/NtrlJ6+0mLr2cPdse/RRlSf4HoyWNTp6ELy01M1XTaypwalF0adU1xDT07727fcdY+e1ZzIqmPnJa90Z9qNzpx64/T5Lctrztrynj5UOl/wBOa9ycfxRZpzabd6npIsrvw86VuaknSjDcr62VnbvNGzT2vNaV1Lqxb71lbuUopL7UHOz63Y/HtzwM/Ztyu4Obb+XkWXRrimuUovmmuBLy789vrvJPmKNm98i8+qzc8M4Pg0zlZjv/ANR7ufivEyZQWtqXjsz7YPh9xqOFiWLmoI+k2PKcbkH2M1zWPZzsduKnieYL9rhC5P5sPRc8R0cPwx2iDt5e44f4Z3VFd1W4/Qywvhzbnc+Xvu35XBZGOouX5oSf2SRK1z4eNfsqz5w3HFl/Kzoq4uxq9Dxf81Tz9z5e31XeP/Hp+TLqvbbewb38zFk9OdYtxZ09bh75+XtPBXwya7E9To4I7M4ceHaUVakGSAyQRlQDICoIyQFRUrNMChFQGSaAtQAHjeZMf9Oxlx0lal0Ta/DLh7H9Zy9vP5er+t184y2+fVKbXCVvqReKz7p8vRue+320ftR0cUjxCNidHF8nWLCIlR0fFAcG+wrj2p84To/RJf2HP2T4d/69+a0YEvC13k9db90ehbomvpOrglKSa5apmasck04ycexma6xCAQUAgKAAAKgKgKgKsC1KBQAq4BAABoMtAAAAAgACMCAARAoBGAAARKr0IVm+7kEYMoxfEgxrT0GK681jOGn1GMdJXJetEblefkWeIbeZkWQrzr1tqoGnHysjEvq/Ym4TXGnBrsZUsfZbL5kxs+KtXP0sn8D4P+FmnHrjHqzt9WoYlcl7HqRuV5+Rh6VSJW9edfxHqFefdxqciq5blhlRz3LT05lMbcPc9ywJqWLflbS4w4wfpi9CsXmV9Nt/n1UUNwx/Tdtf+V/eXXPr1fp9Hg7ttefGuLkQnLnCtJL0xepY5WWOqVutdDSa0ysmV1qlYI1K0zsdwalaJ4+vAiytFzH1I1rRcx6hdc1zE7grmu4hYOS7iMqY5LuI1Uupjju4z1ZdTHHexnqXWLHJctSVdDTNjQ1R1To1wYYx24m737TSu+OC58yYsr3MTcbN6KcJV7VzJjc6dsL1OdTLWvXx9wxM3EW3brH5uM/5V7+pafJxfYblc+udfO77sOXs96LnJXsS7/Iyoe7Jdj7Gacnm272vGgWPV2zcp496MlJqj4huPf8AM+w2fOOzRu4vTHe8ONbMnp82HF2m/wDw94jn/wA3/D8ixcm/iZPTNSt3LcmpQkqNNPVNPmjPXLv6+36ps+bb3zZfk1rmY66rL5tJax9Zynw6dzfmOS1cafZ3GnOPa2rJ6ZopX0O4Spf27NXxp2bnpjrH62dXmk8xm6WfMvWl4Mq1Cde9Lpf1Fifhw+YrbW3WLy97AypW5fwzdPrjEVeb8vJ81P5Wdsu6w4XIuxdffFqcP/FI4e2PV/WvmNm2ZCwPNk1ws50Y3Ivl+p73/MmOL8te3nea+1cKOh2eEpyoUYSsQfp7URWp2WteK7gC05AZJAZUAJBFAqCVkijJAVAUChFQHPuFlXsHItc3bk4/xJVX0onc2N+vrOpXj7Jc6lbXOko+1VOXqr1f2I9qWsLcu2OvqZ2eNFQDJ+4u6S+kIylpKvbr7QOXdY9W33X+Fxl7JJfaY9nh19Nzp5+A9Wu45+t393h6MeCOzzMpL9Rvk9faBzZMf1E+Ul9KM9OnLVXQy2JkRagUBUBUBUCgAAAAgKAAAWoCoHOFAAAABAoBGBAAACACKNkEKM4rpVOYSowlYviUYPiZViwspGXJ8GZsblY3Laap7DFdY5L9hc0RqV5uRj6PQNx5eTjtN6BXnXrOr0KOSalFpptNaprRlR7+z+cL1ilnPrctLRXeMl6e0rn1w+ux8jGyrSu2JxuQlqpJ1DnmMblhNPQmLK4r+GnyGNyvPv4a7CNPPv4ncVXHdxmk9CjlnYfYEaJ2X2Fg1dM4y6otxkuDWjQR6uD5u33DpH5vz7a+G94tP4uJdYvrlfSbf5+266lHNsyx58OuPjj9CqjWuV9N/D6DFzMDNj14t+3eT/DJN+tcQxlnlslZ14Fw1qnZjXQYs6aZ2O4mNfZonj9xMXWmeN3BrXPPG7iVdc88XuIuua5hrXQGuW7gRfI0OO9t+nAamPOyNulyVTUqXl51/DlHjGhqVi8uK5baqVixhG7ctS6oycZdqKy9TC3ulI3tH+JcCWLr2sfMt3EmpVM43K9vbt2sqxPAz4fuduu6TtvjGvxQ7GWM9c68HzJ5dubVKOXiyeRtV7+TfWvS38M+xm45PJtZHeF19D5f3y5iZEWpaEa8/DH/AHL8q29wxH5o2mNbkUv9TswXFLT5yp/ze3tK5y2Pk/KPmC5g5luXVRKWpy75er1d7MffbzZtv5e443/psrWSXw3Oa9fES6nUyteBkdMoikfYQl+62O/Fa3Mfpvw/uPxf8tTfLh7JnS7hcTsbZnxf8u58qb7pqq+mJuOc8unPxv3VvcMP/wCasq9Z/jS0/wCaAR81uEHuPkm+0q3sHpyYdq+V7/8AydRjqbHf19Z08vMyvnbPgbnD+ZiXPl3ZLj0T4eyS+k4Svb1z8v0TaM2GfttnJi6ycUp+lHp5ux832c/W46nErB0g1OkGsZW0+Qqxj8toioAoEZUABKqKKgKBQKgigVJNpPm6AfNbJ4b3Ryjdp9aOHr8vf/Y8Pfiv0I/lk17dTu8KRAy+CXt+lBGUvcg/UBpz1XAv/wAD+wnfhv1/9R5GA/H6jjx5er2+Hqw4HZ5WU9JL0AasmP6dfwtMz03y5KmXUQZUKVAtQAAC1QCqAoQIACoCoACgAOeoawqDCoMKgxKkUqioVAVIJUgMCNlVKgKkACwVdQVkzTKPiBiyarBkGEijFslaiwuJKhixuVk4xmjONyuW9j1WqI3K87IxK10CyvKyMSlQ1rzb+PQo4rlprkVTD3HO2+983GuOD+KPGL9KKlmvsdn854OWo2sumNffxN+Bv0vgHHr154fQOEZx6k6p8GuBWNc13GUiVuVw3sKrZluVwX8N11Kriu4ncTVcd3F7i6uOaeMxqY0Tx2nwKjU7VDSsY/Mty67cpQmuEotp+1BK9fB8377h9MXe/cW18N5dX/N7xdc76pX0GD/uBgXKRzcedhvjOHjj9jNfZyvqr38Tc9qzUni5Vu5L8HVSX+F6lYvNjolZXYRNapY6JjX2aJY5MalaJ4/cMX7NE8fuJjUrRcxn2Bdc1zGVHoRpy3MVU4F0cl7BjLjGoHm5Wz2p1ouls1OkvMrycrZsiGsEpr2M39nK+t5l2zO3KkouPpVCyudjKxk5FmScJerkVHsYW+wbUL/gl2vg/WTFnT6naN5VmErN2Kydvvql/HlrFp81XmDrnXheaPLL2xLcduk8jZrz8FxaytN/Bc+81K5eHj2Mt1WvDgF19t5S8x/In8m61K1c8M4PVNPTgyNWa+Q/3C8oS8v7jHctvi5bLmy6rMo8LU3q7T/6e70FY5uV73kjeLO4YU9qypeC6vA38MuTRw8V7b/tGco3cTLnYuqly1Kkl9q7mbcn2PljMg7kbc34LicJrukqDms+2bNddnGnd2zP2163sfqdtc+q0+qPtodHn/OttjLrj7dnxfuS+VdfdOlPpRVscOJCGF5hzdvuKuLktzhF8HbvVdPVVoiy/D5jZseOPnbp5ay9I1nZg5fhetufsaZ5uucr38d/bnf09TyDvE8LNu7LmvpkpOMFL8UXSmpv19fhy/s+vZ9o/QZRO7wMGgpSoACdINSUAawcSKUYFoEoBSi0AqQBcQigWL8S9ISvmtndbrnyd2q9tTz+vy+h7/D6GP8AKursdfpoeh4GKCskvDL0MIr1t+hlg05f/o7/APBL6ideGvX/ANR5GD/MXoOHHl6/Z4erE7PJWU+EQRjcSdqSfNErU8vPObuqCVasBVgVAKlCoFqAAtQCCKAAAAFWAqwNBnWgaA0Bog0QapUaFSCNgSoBsCVAVCkfE6II3UoqIIxZdRixoxbIrFvUDFhWDCtckRUjccHpw7DONSt8Llu4u/sJjcrG5j15ErUrhyMNOuhF15eVt9Fog3K8nJwmq6F1XnXsV6l0cc7LTGju2nzHum2NRhP5lhcbM9V6nxRdZ6519ntPm3atx6bcpft8h6fKuNJN/llwZXHrix68rSfrDMrRcxYtdrJjc6cN7CppQljc6cV7DdHoRrXHdxGuQVyXMVrkXUaJ4xrTHPPHa5F0xpnZfYNTGt2qMaMXFp1WjXNBMelg+Zt9wqK1kynbX9O741T16/SXWL65Xv4f+4UdI52I123bMq/8r+81OnO+q/h7+F5h2POSVnKhGb4Wrngl7JcfUXWLzY75WKqq1XJjGdaZYxLGp00TxjONfZz3MbiTGpXLcxXTgRuVzXMbQq65buM9Ro5LuMxo4MjChOLUoprsaqUseRl7LbdXbbg+zijU6c+vW8u9iX7NeuPVHtRqVyvFjbgblcxJUTcrT96FeHeisyvtNk3+FqDVI5ODkLpycaesZRfHR8GF6mvA81+Wf9LjHdNsk7+yX5UUuM7En8Fzu7H/AMPpuuF+HmYGe4uLTJWua/RNjz9v3var2x7n48bJj0V0rCXwyj3xeqMr1zvy/N8rb9y8peY54OS34H1WbyVI3LTfhnH0/Q9DPfOuno9n4fd58o7rtNrdrGt+xFQyYri48pequpnmuvfP5ZbDn9F2GvNA8x9tK8rW642ZF0tZttKXZ8yCSf0UOrx2fhpsY3TkbjtHCNz9XFfYpeOHsloWLvw4d5c7u3YW8QVL+DJWcpLj0SaWv8M/rFTn4rxPO0VZvbZ5nx9IzccXMa7Vrak/+aPsOfs52PT6O8uOXzBa654u94r6fnKKuSj8N2HB1719R53tk/D9B8q77b3jboybSyrVI5EO/wDEu6R6vX1sfM93q+letKOuppxY8AFAABoCdPcFYuIEoAoAoAAqAoQA0Z15WMK/d4dMH0v8zVI/STq5G/XzvUjxtptONu3pxdfpOXqj0/2OnvWl/NXapfed8eNgnoFZLg/QyIyiq25eosGjMdMK+/8A3bJ14b9f/UeRgL9Reg4ceXq9nh6sTs8lZT4R9f1gglXTt0FV5z0dDk9EEABgDFQMUGAMAYAwCKgAAABdAADUDSZaKgRsAESoUqBKgQCVAVAlQuJUGFQrdbjRV5sM1kwjFgYsDBgYyYXGLCxgyDCTA1SDTGTdarRkWNtrMlHSeq7TNjUrpi7V1Vi0+7mTF1pvYkWuAxqV5+RtyddCNyvKytsetIhdeTkYDVdCq869iyXIo47llrgipXq7V5t3fbqQc/3Fhf07mrS7pcQ53nX2W0ebdp3GkOv9vk/9q66Vf5XwZXO817ErcZLk+8JK0XMZPkG50472H3GbG504ruH3ExXLcxF2Bdcs8SldBqueeN3GpUrRPH7hpjTPH7i6Y1Ss9xdTGqVp9g0YO3TkB34W97tg6Y2VchFfA31R/wAMqous3iV72D/uFfi1HOxY3Y87lp9Mv8L0LOnLr0/p9Fg+ZthzmlbyVauP+ne8Dr3V0ftNbHO+ux6E8dNdS8UXwaGM/ZpnjdxnGvs5buJ3EsbnTlu4nHTQmNzpxXcXuI0472LSuhocV7F46E0edkYikqOJdLHhZ+1ySbt6NcuRuVx64edjbjk4N+qelaTg+DOmON2PuvLvmOy4STir+HfXRl4k6OMovimnpUnhbJ1Hi+bPKv8Ao/Tuu1OV/YshqkuM8eb/AKdzu7JP0enc+XD55+HLtG6zs3YzjLmiWOnPT7zdtsx/O3l1WE4x3jDTng3npXTW3J9kvr1InfOXY+O8jb7e2/Ont+fFwSk7V+zc0aa0akmcupj1+vr7R7WZjT2rdPlRdca5+pjT7YPgvSuAZ8V9lhX3m7HOMHW9iNZFrtpH31/hqb4rj7ZldWbkOWNg7xaethq1kNf9ub8L9UvrNuc/TOSsx3G7i3VXA3i3JpcuqSpcXpq6+sJXj4GHbyLW4+Vd01i07Slz7bdyP0SRGv8AL5/y871meb5W3Z0vQbjam+bXuTR5/Zzle/1+z7TfzDas7N2LdvmR0lal0X7XKUa6r7mTnrK6ez1zvnK/VsDPxtwxIZOPNTtz4NdvY+89Uuvk983m5W5rUMsaAUCUAtAJRARxQGPSAoAoASAugADxN/yVcnbwbfGqlep/yr7Tj7Ltx6/6/Gf7VtxIrrhFcFRI3zMcvZdr1MfWfpbOji1oDNcH6ALH+XL0Acu4vp2+9XnRL1yRO/Dfrm9POwF4/UceJ8vT7fD04nZ5aynwiQguQV513S5Ndjf1nKu/PhgGmVQgAAoAAgFQAFTBhUGFQYVBihABr2gaamWkAVAVAlQFQIBAAECjCoBYR6pJBHR9hpmozIxYGLAwlQKxbIsYtgYSCtciKwYGEmFapOpKsY9UoyrF0YWOi1uUo+G6qrtXEjTtt3Me+vA032cyYNd3EUtQsrz8na4yroRqV5OTtD10DWvJydslGuhVebfwZLkVMcN3Fmtaamkx6W1+ad62xxirn7jHX9K7rp3S4oM3mPtNp86bPuHTbuT/AGuQ/wCnc0TfdLgw53nHtuEZKq1T4MM60zxk+RManTluYnHQjcrku4nKhGtct3E7gsrmni8QrnnjFGmeN3FGiVjuA1SsIqVqlZ1A1ytFGt2mgOvB3jdcCSeLkzgl8DfVH/C6ous3iV9Jgf7g3VSG4Y6mud21o/XF6FnTj16P0+jwd92XcKKxkxVx/wBK54J+x8fUX4crzY654tUy4k6cl3Dq+BnHSduK/hvXQjc61w3sJ66GW3m5GJrUsHnZOJx0KPn9z2hXIuUV4jfPTl3xrwLGTl7fldUG1KPGL4Ndh1zXmuyv0Lyt5qsytyjOKvYd5dGViTpJOvczPhv46jyPNnlOWyyjue11v7FkOsJLWViT/pz7uxv0cTc+XCz61s8r+YLmLkQlGdEnoSx1l34e1/uDsEdxxoebdnj/AJizFLdLEFrKK4XqLnH4u7XkzN+U5t4rHacu35i2BYtU8/FXXiy5tpaw/vcDl4+Hr6+Zseh5L3l2MuMLmlH03Iy9jTRqfFc++dj6vCtWcfNytovOuJkpys1/7dyvTT+Hh6jq834c9u1evYF/bZuu47bPrxnzk4aqndciC/tx73dlk7fi+YcRf5jDShnRXF2fxv8Agf0PuFSfDzvN2EtywMbzHgOmTjJLIceNF7sn3Lg/7DPU2OnHX16ct+UN522G5WV/mrEVDNtLjp8R5bMfS46ZbBv2VtGR1263MeX82y3o+9djLx3jPu9M7n+X6Vtu64W5Y6vY1xS/FH4ovsa5HqnUr5XfF5uV1NU4FZQBQBQCJAVoCUAlGBKAKAKAcW5blawodKpLIkvBDs75Ge+8dfV6r1f8PCw7dy7dnkXW5Tk2+p8XJ8TjxNuvX7OpzMj18SNJp9mrO8jxWvQxk04m3OsFSpGmT91+wRFXuP0FRwbzKmJCH47i9kVU5ey/Dv6J8ufb1rJmfW6e6/D0IrQ7PMs+NOxEqwiiVXnXl+tc/if1nKvRz4YEUQFAAVFQAAAKgFQAFAAKgKhCoGmplpAAACAA0iYAAQGBjVAKoDdYSo5epFZrPsKyjIrFgYsDCQVi6EWMX6QrWwawkRWtkVhJhWuQVrkCNcuIVh1SjKsXR9wHTY3e/b0uL5kO3gyK9CxuGJkadXS38MgfLbPGhJaapkxdcWRtkJLgRqdPKy9lqm0itSvGytonGvhGq8rI22SfAupjgvYTXIupjs2zzHvW1Pps3XcsLjZueKPq5orN5fZbT582nMcbeVXEvyovH/Lb7pfeHK8V9H+ncipwalB6qS1QxNarliLfAmNTpz3MXuJY19nLcxe4mNSua5i9xF1zXMZ9gaaJ4z7CjRLH7ijRPH7hBqlYfYUapWO4DXKzRcCjVK0ErW4dgR6m2+Zt729xVq+7lpf0bvjjTub1XqZqVjr1Svqdv897bfpHNtSxrj4zXjt/+Zew1rjfTZ4e/aeLl2Vdx7kL1t8JQaf1Fc/DnvYNeCM2NTt52RgVroTHWdPKycF66BvXlZWHxqgPnd32eN6DoqT5M3z1jn3xK+Zhfy9ry+qOklxT4Nd51ny8l3mv0fyl5qxb2POxkRV/ByF8vKxZ0apLR6GfDp8dR4nm3ytd8u34bhgzd/Y8mX6F6tZWpPhbufY+fpN+XG/617vknzUrNxW7j6rVzw3IPVNNGL8On/Uce/bRd8ob/Z3Lb9dj3CbnjNaq1J6ytP0fD3egz1Nb9PefFd28xtwuWd/w3/lsppZMV8F18/RL6zEuu1mV9TbyXuGzWdwsOuVt2s0uMrL97/DSvtOvNefvnK69wv8A6eJ5gxdXZUbeclxcHpGf918TTlL+GFy/Z23c4ZiSntO7VjOHGMbkl44tdk1V+0J/h5Fq4vK++Pbb/wCrsm4pvDuS1j0S0lalXnGtPQMWXfh5OfYv+Vt9jdtL5m25Wtp8VO0+MHX4oVOffGvT6fbnxXRn4NqKhl4b68LI8Vt/hfOLPM9/HWtGJk5OLeV3HuStXF8UX9D7Sy2HXE68vrdt88SSUM+y5U/q2vti/vO3Pu/bxd/0/wD8voMTfdqyqfKyIdT+CT6ZexnSdyvL16eufMdqlFqqej5m3NfQQK9oAAgLRgYzlCGs5KK7ZNL6yklrjvbvt1qtbym/ww8T+4xe468+nq/h5uX5guzTjjR+Un8ctZfcjl17f09HH9aTy8qMZ3btW+qcnrJ6s5ZrvbJHqWLaUYxWiR6eecjxezva7saLUW+3Q6RxrutaSXdq/UVhqjQy2y5LvdSxGT9x+oqPI3mdci1b/BFyfpk/7Dj7L8vV6J8azwYUtJ9peE91+XdFcDbhWMvfYqxkuRFeZfl+vc/if1nLp6OfDCplRMCpgUoAUAVAAAAqAoAAAAAaTDSMCAUDEChUAtUEY1ABUYEA6MdxcKV5lZsbGjUrOMW1V1aXeSq1yuWVxmQytcsrHXbIauVqnnWU9LftZNWctct0UeFuPsGr9GuW8zWqhFeoa19Gt75dXwR9hPsfxsHv95f04P0ofZf42t+YJLjjWn6mPsfT/LH/AO4LEvfwoU7pND7H0v7Vb7szdLmJcj/BKv1tCWJeem2Of5cuOnzblp/mTp/1F+EzqN8MTacj+RnQb5JtV9mhfrE+/U8xLvl/JpW3chNcuKJ9Fntjiv7Tudr+j1pc4uv2E+tancedfnkWv5mPcVOxVI6alnzFPH0Urij+GUaoD0cbzhts6LIbtt/Ek6Ewx61i/iZUOuzcjci+cWmSxEu4Nqdaoi68zJ2WEq0Qanbx8vYnrSJWtePlbPOPwsauPKyNukuRdZxs27d952mdcS/JW+dqXig/U+HqNazedfX7R/uFg5FLW5Q/a3eHzVrbf2orneH1Vm7Yv2ldszjdtyVYzi0016gylyynyIsrnnjImNSue5irsJjUrmni9wb1z3MXuIa554/cF1onY7gNMrHcUaZWe4DTKz3FGp2ANc7IGt2mBniZmZhXfmY16dqfbB0r6VwZdS8yvpts8/34tW9zs/Ojwd+3SMvXHRM1O/28/f8AX/MfVYebtm52+vDvRuvnDhNemL1N44WXnywydvTrREsb57eNmba9axMu0614mZgUroGnzW8bLbvwap4uT5m+esc+/XLHyMbmbtOZ1Rqmnqnwkjv8WPHZea/TPKPmnAz8OeDmxV/b8ldGTjz5VOfhu51HgeZvLuT5V3G3fx5yv7NlOuJk8en/AN3N/iX0r1m/LlL9bj7Dy9um37/s93Ytz8WNkxpCfxQmvdnHvi9THh16+fl5Gyu/su6ZXlXfF1Wbi6Yz+G5bk/Bcg32/Qzl1MuvR6+/tMr09hzr/AJe3uW35L67L/lyfC5Zlon9/eal/LPXOzH0uLO1te53NvvJT2vPi5Y1dYu1c0cP7taHV5LGq1jWrN/I8s7k3LEvr5m35HOjfglF/ig9H/aF8xzW8aO5YuR5U3tqGbYfVg5PCkkvBOL7GuJqVL8vM27J/dwv+UPMf6WVal0YmQ+Vxe40+da6dqFhOtcG3ZeTsWff2bd4f5ZukuaVfduQfYzj7PXr1+r2vSzduePNOMlcszXVauLVOLPLXv562OZJhWyKBY6rGTk2v5V2cO6MmvqLLYx1xL5dtved1j7uVcXpdfrqa+9/bl/Bx+m+G+7u+OTJ/3YfcPvf2n8HP6bFvW6N65EvZFfUi/e/tP4ef0y/1TcZccift+4v3qfxc/o/dZUvevTdfzMXqp/HzPw1tSbq3V95ls6Ri6dL0JhruxbHSqteJ/Ud+OXm9vf4dluDOseau63GiS5R+s0xW+Oik+xP6Qy1ruDbJPxacFoGayaeke3UI+fyJq9mXJrWLlSL7lojzdXa9/EzmPTsxpCK7jtzHm7u1vj9WpWIw4sjTZEI8rIVL0u919py68vTx4YVMtgTFTBihFqAAVAtQJUC1AAUABUEAAGipGkAMKlQAEqAqBKgKgSoAKgEr2BDqk2uPoLhZj0bViMLcYtJtcXo9TpI8/XRK3b5wXsQyM/atTtWfwR9iGRftWuViw/gj7BkPtWmWNjP+nH2E+sb+9a5YmN/24k+sandYf6fYnwsVfcmPrD+Sn+i9XDFl9K+0fU/lv7R+X5v/APqv20+0n0X+b/LB+W5//LP1SX3k+i/zNM/Ldz/5Wa9DT+0X1rPfHPPy5Ncce76aD6LPfHLd2SMeMLi9K/sJeWv5GFvHnYdbWRdtPulQmVftrus7xutmi/cq8uy5FP6VRl2sXmV32/MNqSplYyfbKFH9EvvNTpLx+icfLmb7zjbk+Ul0/wBgyJvUcWV5Jw7ycsefHhzQ+rc937eJk+Ut3w5/NxpSi1wlBtMljpPZKtnzF5gwKQzLP7m2vifhn7VoYsV7GF5u2fJpG5N41x/DeVNf4uBMR66jZuxUk1OL4SWqJhrmyNtszroManbycvy/GSbig3Onh5mwTjXwhdeNlbROPwl0xoxcnddru/Mw707TT1inWL9MXoXWfq+s2n/cW1Jq1utl2pcPn21WP96PFGtc+vW+txMzDzbKvYt2N63LhKLqGPmNkrNRiytNzHM41OnPPH7iWNSue5i6PQmLK5rmM+FA1rnnYoFaZWOI0aJ2GNVqlZ7i6NMrA0aZWqcho1Ss9xUapWtAJbletTjctSduceEotpr1o1pY+k2rzzm49LW4R/dWl/UVFdS+qRqdftw79Evh9ZhZ+1brb6sS9GcqVlbek16Ys15eey8+XPm7TVNpaGbHTnt87n7U1WsSOsr5PetkhfhJSjryZvnrGO+Nj4tPO2fNUo6NPjyku87/ABY8XUvFfqHlPzTtm8bbc2rc4K9g5C6L1mfGL5NPlR6pmPDpZO4+e3Pa9w8n7xC3OTu7ZffVgZq4Sjx6ZU+OK4mrNjHNsuV9lm41rznsEP28lHftvXzMG49HcVPFak+yX1+sxm/Df/N2PKwb0vMW0PFmvlb7tjatRnpKsdJ2pemlPScvFx6t2bHt7HnLftlltdzwbpiNywnLRxuw4232dVKM6c15/bz+Y67NyXmTZZYkJfI3zbpSliufhcbsNJWp90qdL9vI6PPufMaLV5+Ztubtp43mbaW4Tsy0m3D3rb76+6/vBv5a8qxY83bakl8jzLgRpR+F3VH4X314djLKZ+XFi5NvzHiLZt2f7fe8WscLLmulza0+VcDUrTs+539rvXNn3m3KNmMqeLV25Pmvys4d8a9Xq9uPWy9vcGpwalbkqwmuEk+DR5rHu561yqDqGmcUEbY6kRtgVmt8EVlsVCstseBRmkEXiFbrFmsk2dOOdcfZ3JHdbhRaHbHkdVmNF1P0L0mozXTCNEuZWKzm6QS5t/UCME6VfrDTKK/tDLXm3nZx7lxcUumHpehnu5G+OdrxMS25XIxXLX2HDmPZ31kexFHoeKspOkPToZIxS4BpsWmvJBHmZS92Xboc+no4aKmHRlUAAAoMUJiIGLUGFQKEAAACrgAAAaSNFQI2BKhSoEAVAgEqAqAGiMaI3/aSmOnCtdU+t6qPD0m+I5+zr4djZ0edg2UY0lJ0jGpFbYYF+Wr8KYxNdFvarXGbcvo+ofUvTohhY8F4YpeouM62q3BchhavSuSKLQmBUuCadgxE6YdgEcI9gVpu4WNcXjtxl6UgbXBkeXNqvVrZin2on1jU7ry8nyRhzVbbcX2JtGfq6T214+V5Myrabhcn6pMn1bnuedLbN6w5dVnKvW2uyT+ojWyuvH8z79i+HKtxyra4tron7Vp9BdZvEeja8xbBnLoyrbx5vT9VVj/iVfpJhnU8Mcryjtebb+ZjyTjLWLi04/QT6tT3X8vEn5Z3vbJOe335wjxpF1i/TF6EsdZ3K2WfNW6YlIbji/MS43LXhl/hen0mfq09jA8w7Rm0jbvKF1/0rngl9PH1EsHfPHtzWupDXBk7PZu10oRudPHzfLadelBrXz+b5euQb8IV51u1uG3Xvm4l2di4ucXx9K4M1Kl5fS7X/uHft9NrdrHUlp+4tL6ZR+41rneH2GBuWBuNr5uHejejz6XqvSuKDlmN7tJkXWqdlDGpWieP3ExqVz3MbuI1rmuY7VdCY1rRcsBdaJ2NOAVonZ7gNMrPcNGmVouo0ytDRqla7i6NUrWvAoxg7tm6rtqTt3IusZRdGn6iypY+o2nz1kWkrW5wd+3/AN6CSmvStEzU6cOvRvh9RbW37nj/ADsW5G7B8acU+xrijWa4fa835eHumxtVajVGcd+e5XxO/eX43rcoyjryZeesO+JY+Gms7Zs5Tg3Frg+TXYz0Syx4eubxX6h5Z8x7T5l2W5sm7LqsXkotP37Vz4ZxfanwZj55rdzuf5eLb/1byT5ghhZc+uxN9eFmR9y7brx7pL4kas35jHHX4r6LzRhyvq3502NfrWUv9YxocZRX9ZJdi97u1Mdc/aOvPX0v+HBuOS1G15w2h1trplutmPGLVP10v/H7e0xx+vy69/Hz+Hr7rkTyLFvzpsXiyLUY/wCsY0P6luK0vJdsUte47c3fh5e+frf8Luqubtj2fOvliSW6YkUtxxlxvW4KrrFfFFfQVjwwlkWt+xl5o2F/J3TGpLc8Je8pR/qRXPT2rvIsrdlY2J5vxXuGDFWd+x41ycdOnzox064d5VasW/jb9Zhte7y+Tu9nwYudJU66PSFzvM2NSsMPMz9jvy2zdLbnip0XNxr8UHzRx6416ePZj1ruJbnbjfx5K5YnrGceBwsx6+PZrmdpp8COhFNExNbYplZbY8Qlbo8Cs1si9CstmpcRus2m6VOnHLl7e8dtu2lwO0+Hlt10WrddeCXE0za6IJNp8EuAYrfFN0KYxuNSlpwWiCxKa09oGyOlX2BMeRu95yuwsxdVDxT9L4fQcvZfw9Xp5/LLAtUTm+eiJ64ntruitTo4Jc1kl2EXFXBBS66W336EpI4clVtV7GjHTvz5cph0WoACgFUC6gNQLQAEAYoMAYAwBgDAGNJGgCVAjYCoEqQSoAAAAjYEAgV6li2rdmMefF+k7SPL3fln0Sk6R1ZWG+1gt6zZR127NuCpFDGdZ8ORRagQAAAAYgAFUAqgIAqBAI0uwI0XcWxdT6o8SYstedleX8e4m4omNz2WPDzfLNKtRqiY6z2R5f8Ap2bhXHPGnOzL8jpX1cyN/Fd2L5o3Gy+jNsxvwXxx8M/uYZvD0beRsW6rpqo3Zf05rpl9PH1EJbHnbl5Ix7icrSo3yH1bnteP+18w7Q6Y96Ttx4Wp+OPsfD1GbHWWV14vnFxahuGM4S53LWsfXF6mfqr3MTcNvzY1xr0LnbFcV6U9TOIyu4dq5pKJGp083L8v2bqbSGNTt8/uHleaq4xqg1Lrw5bdnYN5Xsac7N2PCcHRmtLHubX5/wA7GatbrZ+dBafOtqk/XHg/Ua1zvrfZbbuu3bla+bh343VzitJL0p6hzssdUoVQNapWaoYutFzHMY1K0Tx+4N65p2O4iytE7C1C60TsBXPOy+wqtMrJBolaLEapWijTK0BqlbpyKNmJl5mFeV7FuytXFzjz7muYlxnrmXy+w2nzni5dMfdIqxceivR9x+n8J0ne+Xm79Nnh37nsNq/b67VJRkqprVU7heU59n7fn/mPyxG5CUZw9D5jnrG+uJ1H57ct5+y5yu230yg/C+TXYz0TK8XXN4r9Q2Pedm86bF/ou7PpmqOxeX8yzdSpGUX2fWjP/NaudTZ5cOwbvu3k7f5bLu6Uo8Ldz+nfsyqlKNe0tmfMTnrfiuzc8ZeUt0t7lhR+d5U3eXTK3SsbE5+9Zkvwur6fYY6535jr6/Zn+vXhxwzbnkbdrOdiN3/Km5ukU/ErLlrK1L8tOHd6BLvz+U6n1+L4ejnK/wCVM+z5l8uP5uwZ7Tu2E6xjKWrhpw/I/UdJdefqZcbNxw5Y1y3548ozpYua5+GuEJNpzjKK+Fvj2cipG9RsbhaXmXyy3j5dl9W4bfH3rUucopcYuhluPRjj7f5uxpX7Sjjb7aVb9laRu0+OJV8GNnW8iH+keYoPrt+CxmPSUOxTf2mbFlxhc27dtgut26XsOb4cYtfYzl1zrvx27bMsXOh1476bnxWJe8vR2nHrjHq49n7aZ2JRbTVGuRh1RRoEbIoJWxFZrdbhKS0VTUjNsjrtY/BvU688ft5vZ7f064W12HZwt10W7VdeCXF8hjNrbGKeiVEv+KljLfGNKdpRlLwx/NLRegDBKmr4cvSBlGPNgY3rsbNmVyXCCq+/sRLcXnnbjwYdd265y1nN1b72efy91yR61mCjBR5I7yPH1dretFXs19gZa0+qVe3UjTLQIwvukUu8lbjkyP5MvSjF8OvPlxnN1i1AyTAVQQqgKAqBQBQAVAoABUCgKgc9TKgACMAAAgALgDEqDECoBvw7XXfTfux1fp5G+I5+zrI9e1jSnq9I9p1eS12W7UIKiXrETWZROAAABGAqAqAqBjUAAAUAgAABGBAFQI+mSpJVDTmv7fZup0WvYMJ1jyMzYo60iZx0nseJlbLJN+EmOk6jHGzt1wGowuO5aX9K54lTu5oheZXr42/7dlL5eVD5E3+LWL/vfeVn62eEzvLuHkw67dNeDVGifVvn2/t81n+VrtmXXbTTWqktGjFjrO5Wqxu+/wCBSMpfuLS+C6m3TuktSY09jC82bdeSjkxli3Pzax/xImJj14uxegp23G5CXCUWmvoJg5cnasa9F1jqStzp4ef5VtzTcFUjU6fN5OxZuHe+bY67VyOsbkHRr2FlXy9Xa/O+44clZ3S18+1/3oqk0u9cGa1jr1vsNu3jbNyt9eJfjNr3ocJL0xepXKyx1yhUGtU7OoxrWmdgliyue5j1M1qVzXMd1DWtE7DC6552TKtMrJYrROwUaZ2QNErTKNU7YRqlbA9LZvMO47VJRty+bjfFjyfh/u9jNyuffqnT7DHytn3/AB38hqF+njsS0mvvXejfxXmv24r47zV5PbhNOFYv3ZIktjfx3H5jesbjse4Ru2m4OD8MuTXYz0SzqPH1zeK/TNtztl8/bCtrz5/J3PH1wsn47VynbzjKmv3mfnlrqTqbPLn8t71PAyMryZ5ttfo3k7E1L3ZRekbkH/zJizPmM79vhoeO/LGbd8seYH+78tbmn/p+a9U4N6OvKcKr16k6n5jpx7Jf9emjad0yfIu53Nj3lfvvKm5J/Ku06l8uXxrvj8SXpRZd+Yx3z9blew7Wf5P3KG47ZcWbsGck469Vu7Zlr0S5KaT4mnOx139u/bXIeavKF1vH/r43O2+MrdyPHoYWO63Zxt9h/q+xv9pu9h9WVgp0kpL44dqZG49XFzNv8x2lh7jFYu82/CpNUVxrs7+4eWb8MbFzc9kf7TMtvIwHp0PVpfkf2GWp8+G+5seDmR/dbZc04uK0cX6OJLG57LPLWln2v08m2r0VpWS8XtOd4dufb+lVrHnynB9mjOf8bp/MyjiQ7ZP1JFnrS++N0MSFfdr3vU3PW59e6uuFg6TnHDrrW+FpFZbY24x97Tu5srOtiTlTSi5IqWtsY9KWhRsSS1fBfSBrbcnVgWtdeS4IDONFq/YEeRu2T8y4rEXWMHW41zl2eo4d9a9fo4yamFaq+trTkOOdT29Z8PQjE7SPOt2VEl2/URYkVwIrJLUDRffVOn4dCVqNGTRWJeox14dePLh5mHWKQVAUABagAKmAqBQARUEAABsBUDSRpiAAaAKgQBUCNkaiAGBALGMpSUYqrfBIqWvd27Adq3W5TqerO/M+Hk762u+NEqGnKowoAAAAIwIAAgAABGAAARgQAAAmgVKgPUDFqmqMJjRdw7VxPtCz4eXl7SmnoS8unPbx8nakq6GcdJ05rNzcNvnWxNqHO29Yv1Bceti79iX6W8uHyZvjLjB/cGcbsvZse/Dqik09VJcCXlqd2Pns/wAttVaVTNjrO9eT+1zsG5141yVqX5XSvpRG3o4vmzLtUjm2FdS+O34Zex6MmGPcwt227Op8i6uvnbl4ZexkxG+7i2ripONTOLK8jP8ALONfi3FUYxudvmczy1m4d35+PKVucfdnBtNewa18V27d503PCas7paeRaWnzoqk0u9cGalY69b67bt223crXzMS9G52x4SXpi9SuVljqlbqCVqlZ4ixZWidivImNa552O4jWue5j9xGtaJ2O4lalc87HcFaJ2O4DTKz3FGiVnuA1TtKvADTK13FGEHes3I3bMnbuQdYzi6NMRLNfW7T5tsZcI4e7RSlLwrIS8L/i7H3nWdb5eXv02fPLh82eSLWTjyu2Up25Kqpr6yz4ZlnXxX5Lk4u5eX9xV6y3GUH4ZcmuxnedTqPN1xeLr9Ds5G1f7h7Lbxrko4vmPCjXEyHo68eiT5xdPUTx5Op9vmNGzbnZ3fFv+RvN8Hj5dt9OHky963ejVRafDn6Gh4Y/6/8AXClLb7l3yR5xTdhuu27lx6OrS3OMn8L/ALGTrnPmOnHe/wCvRs2953k3Nu+WfMlt5flzKfguKrUIyel+y9dNauPH7bzZWe+bzcr6ZYm4+Vsy3um1XY5m0ZaVJJ1tXrb1pKnBlZelLarGfCPmDyvcdjJtut7FWk4S5qnNPsC66LN3b/MNIXorA32Gv4Y3JLnF9v0mbGtepibxcg/9N3+3qvDDLa9nV94S8fmN9/YbuPNZO33Gk1VOL4r7RhOv2zt7g3SGdZpLg7kF9cSGfp0Rx8W7ranGS9j9jBq/sWnpF+wsGaxZfh+wDL5cI+9Jehav6CpRN0atqne+IZbIW31NvVviUbVGgGSj4epuiQGEpOb7FyQGPHRartA2Rjy4Ac+4ZkcezWL/AFJaW13/AIvUY76yN+vj7V41m05zUVz1bOEmvZbj17UFGKiloj0T4eLq7W7RKr4IpGpPqfUzKtiAjlSLb4JCkcurdebdTDq1Zbas+lonTfHlxo5uoUUAAAyAERUAAAVMC1CFSi1AVIFSjnqZawBgDEGrhUhiVLphUaYhAAgBJtpLVvRID3du26NhfMuKtx8e7uO/PLx+32b8PQ5KhtxR8Q3BhAABAIAAAKgQAAAjAAAIwIAAMCNBUoAboFYucV8SAx+fbXOoE/c2paSWnaExjdw7d2HVGjXIE6eXlbb3EsdOe3lZG3UroZdJ01Y9/Own+jJ9HO3LWL9QV6+Ju2Jlfp318m89KP3X6GGcq5e02rldFUzY1O3hZux0r4aoljrz28XI2twlVJprgyN634u9bthNRcvn218FzV07pcSUe7g+ZNvyaQu1xrr5T931S4ExLK9OVqFyNaKUXwa4EPs8vO8v4mTF+GkmTG52+ZzPLOZh3f3GJOVu5H3ZwdGNa2V1bf5zzsOSs7tady2tP3EF4l/FHn6jUrF9b67Cz8LPsK9i3Y3IS7OK9K5GnKyxtcCLK1SsoYutNyyZxqVzXMcmN60XLAalc87JF1zysjRonZ1GjTO0XVaZ2u4DTOz3DRqlaGj19k8x5m3NWblb+G9HZfGK/I39RvnrHH2eqX/16G+eWNr8w4EsrAam2vFHg0+xrkzrP3HDc+On5Dn7du3lvdY5GO5Wp2pVhPhSj4PuOvPU68vP3xeLsfat7f8A7ibUrlpxxfNeBDwOvT85R4Rb9Puy5Dx8MXL8xq23PxfNOE/Kfmr/ACu+Yrlb2zPuKklNafLuelrVc/SXwz5cVu87c5eTfOMHBWZdGBuD1lZk9IeL4rctKPs+jHXP5jrx7P8A56deybvuvkfMns29Wv3vl3IfurxKKk6/NtfbH7Sc96vfqs8Pr7m2X9udrf8Ayzk/PwLyUlOPii4v4ZrsN657r04WNo80Wfm2V+z3e2uq5Z4Vkvii9OfMqS55RZ961/kPMNpztx0t5qXjj/FTj6UZtb/zHoYzztrgp4s1mbdPVRrVJP8AC1wBcr1bF3b9xhW3/M+K3LSSKxZYwntcE6rRkxNFiXY8Jyp6SjL9vP4m36QNkbCRTWatpLtCayUQasumHHj2BWDlKWr4L2JAStXRaJ8X2gZKNO8CXrtuzalcuOkY+93vkkS3FnNtyPAu3bmRedyfF6Rj2LsPNba9vPMkehiY/Qqv3mdeI8/t711xRtyS660guWsvuCwSoRWXII05E6JRXPV+glb5jXEy25c2VZRj2Jv2mOq68RzJmG6tC6gNFGijQGqo1AaA0VMANAaA0VAUABoM60lSgQQBUCAAABgQD19nwVT9xcWvwJ/WdeOfy8/u9n4j1anV50SAoACagKgQAAANgQAAAASoDUAFxi5RXFoGMHetL4q+gGMXkQXBNgxi8nsjqDGDv3H2BWLuXH8TAxdXxbAjAASgGVuc4OsXTtXIJjpjO1e0ek+wDmv4XHQYs6eXk4Or0JjpOnnX8Olaoy3K2Yu45eJSLbuWecJcl3MGa9ezkYedHwPx0q7b0kE8OXL2uMq6GbGue3i5W00roZx2nTysjb2q6EblY4uZuOBL9C41DnblrD2Ax7uF5nxrtLeXH5E/xrWH3omM3l66Vu7BShKM4S4NOqYxNefnbFi5KdYJSfcTG52+YyfLu47dfeTgXJ2prWsHStO1cyOmyvQ2zzpO1JWN4tfLa0/cQT6X/FHVo1OnPr1/p9VYvWMm0rticbluSqpRdV9BXK/CyhUErTO1oMb1zzs9xLGpXPOwZxdc87T7BjeuedomLrRO0FaZ2+4aNMrfcBpdvuKMJWgN+BmZeBkK7jTcZfFH4ZLskuZqdYx1xOnvZuFs/mrClblCNnP6dYPn3p80dOetebrm8/F8PyXedh3vyvukcnGc7M7Uuq3cj2J93FHfnrfivP368+Y+nnHA/wBwdtWXi9OL5sw4/q2VSP7iMeDT017H6nyHjyxk6+YYG4YfmfEj5a80Uxt8xq2tt3K4mpSktFZuvjx/4rxePDP/AKxxMm/tk5eWPN9mUsJaYuVPxSst8KS1rB8mc+ufzHf192fF8O3Au795GzevG/z+wZTrOxWtuUZfFDioyp7Sc9/tvv0zr5j7COBte+Y0d48uX+m5F1lai+m5bnzTWjR115rLPiu3E3uzkxWDv9tQvLSOTSkX/F+F/QEyzw2T2fcNun87bLvVYlq7L8UJf3ftRMa2XyQysG9NfPi8DKXxfA33SXD1hXqWsrOspfNSybXKa4+1FZsldVvMxLi1k7b7JL7QzebG1RhJVjKLXpRUVxpzXtQRi5Wk/e9moXGErjbpBU7+YMYOkX4vE+xBTWT10S4IDOMKgS5ct2oSnKSjCKrKXL1EtxeZbXhZeXPLuVXhsx/lx+195w662vZxxOZ/luw8bXqkvQjXPLn309G3FUqdHnrOUlFd/JAjXFc+fMauMkQXRLXgUz5ccpOVxvkYrtIySdQV59+fXdk1w4L1HHq678z4a0xjTKpEwBioChAABeIAAgKAAAC6A0Bo01MtIAANgQAAqBAqAdGFj/PyIw16a1l6FxLzNrHfWR9JFKMVGPBHox4b8qUAIAqBAKAr3AxKoGCBiMGKmDGDuwXMGMHkW13gxg8lco+1hcR5FzkkgYwd64+fsBjFyk+LbAmgCgUogGgCgEoAoBGgJQAAAlOYG+1k8I3NVykDGVzHjNVWqfBhNcGRh8dCY1Onn38TjpoZx0nTjlYlCSlFuMlwa0Ya16GJu7VLeXquV1cfWgl5d1zHt3YKcaSi+ElwJifax5mVtqo6Iljrz28jJ29p8DOOs6edfw2uRGpWONkZuFPqxrjh2x4xfpQXHu4Xmexcat5kfkz4fMWsH9wZvL1+m3dtqUWpwlwa1TJjLy9x8v4mVF+BKXaTHSdvnJbfvGyXndwbjVutZWnrCXpiTw1ZK97aPN+FlyjYzF+1y+FJe5J/ll9hqVy69dnh7zinRrVcmVhrnbTQWNErQxWmdkmNyuW5Z7jONa5rlmnImNStE7QxdaZ2grS7RRhK2QYfLQGdrrt3I3LcnGcXWMlo0yylj3fnbfv2I8DdYRV9qlq/Rav7Gdee9eXv13n5nh+Y+ZfKW8+Vt0hnYM5Q+XLrs37fKn/GqO/PW/FeXrj88vZS23z7hu9aUcTzTjwrfsKkVkKKp1w/MXwzmurat3xd5x4eXPNa+Xl2vBgbpcXiUuHy7tfr+0l/wTY3W5bj5VvPad3s/vNmue58XQn8Vt9ncY651347x0f6RmbXfjvvlnJ6sea6pRjrGUePTOPNHP7WO1557j6fat/2XzLH9vlW1g7qlrbl7s6c4SfH0cTrz3ryez19cf8AjttWt22WXRD9fE4/KlqkvyvkdHP4rut3tq3NdLSt3udqdE693aTE+YxW0ZGLKuNdlb/Kn4fZwJi/bV+ZmR0vWYXKfFFdL+gDON63zszj60ylbY3bXK3P6EVnWauv4bdO+T+4DJfOl7zouxaAZQtpcgNlElV6Aar+Ras23O5Loh9Mu5EvUi8823I8PLy7mXPVdFqPuW/tfazh11r2ceuctuNjdcqvgOeE77x6MIKNO4648t6bvDGLlJ0igy1Ks31PTsXYits6EBIDRk3Kfpri9WZ1rmNUQ2l+4rVmT5vResz0vE2vNTOT0KnzLRSC1AoQqDFqDAGFQYqCAAABagKgKgKgaCNAEqAAARhQABGB7WyWUrM7rWsnRehHX1x5ff1849M6uAAAgEAdSXFgxi7sF8SAxeRbXawrCWT2R9rAweRc7kBi7s3xkwMXV86gEmAp3AWiCp0oBRAKBCgEoAoACgABQCNASgEAARgSgGyzfdvvi+KBjp6bd2PVHmGXHexSNSuC9i9xG5XFdx//AGErepj5GRiSrB1hzg+DC2PXx8nHyo6eG4vetviGfDXkYcZVoiY1z08rK2/jRGcdee3mXsJqtUR01w3cajehF1cTNzcKVbFxqPO29Yv1BbNfQYHmHFyKW8hfIuvRNvwt+nkGby9K7Zt3I0klKLIkrwN28r42QpStqkuwljc7eVibnvWxTVq6pZWGtOmbfVFflkyat5lfV7XvGBudn5mNOrXv23pKL70blceubHa4plTWmduoa1onaRlrXPcs6ma1K5rloNStE7S1I1K55WyK1yggMHACq2BlGBR6+NmY+VjPA3SKu48lSNyWridOe/283s9X5j4DzZ5Hz9izYbts85K3CSuWb1vjB8VwPRz283XO+PLvwcrbfPGNKzfhDE8z2Y1mtIwyUtOqPZL/AI9FsYl/b0No36WLD/7e81WpXMOL6LGVOruWXwSk+PT3hfrnzHXkbPu/lq7+72uf7va7vilb4wlF89K0dOZjrnXTjpse37J5gtfPw3+3zIaztPSUWuen1o5WY9PPs+Pl1YPmXfdnksXdrbzsNaK69bsV/E/e9Zrn255cu/606+Y+jxv9C3i383Auxc/it+7OL74vU7TqV5eueufLdCO64i6Yz+bbXw3Nfp4mmfhvhuFqSpesyty5uPiRExthcw5rS7GvY9PrKjardulYyi16UBemEfiivS0Bj82yvir6FUCq5J+5Gi5t6kqV5+Xu1izJxg/3F7h+RemX2IxfY78em3y8yc7+Td+Zfl1S+FckuxI4269PMnM+HRj4taNr1G+eHPr2PStWkkdZMebq63Uik2+C4sqY0Sk7rXKC91faZXGdAqgSc1CHU/QvSBx1lJ9UuPaZdIzj9IqOLNu9dzoXCHH0nLqvRxHM+feYdFQRkUAAFQACpgUAEoEAMlQC0AmgCq7AFV2AaSNpUCAUDEAQAIwAg93ab9qOClKcYuMnWrS51O3F+Hk93N+zfPccKPG9F/w+L6jX3jE9XV/DmnveHH3VKXqp9ZP5I6T0dNFzfnwt2fXJ/cjN9jU/rfuue5vObLg4wXcvvqT71uejlzzzsyfvXp07E6fUZvVdJ6+Z+DCvSWXBzk31eFtuvH0l4vyns5/1e1Q9DxFAFAh0gKAWgCgCgCgCgEoAAAAIBKAAFAAVGAAlAFAMWAAxYGdu7O3JOPDsBjsi4Xo1i9eaDPhz3bHHQLK4b+PTkZrcriu2Kslb1z/LlCalFtSWqa0Dcr0cTc1cpbyaRlwVzgn6QxeXVdsRlGvHSqYwlefkYdeRLHSdPMyMNrkYrpK8+7ivXQjpK5LuMQ104G752E1FP5lnnbl2dz5GksfSYO6YebGluXTcpralo195GbMZZWBYvwcZxrUzYs6fLbj5cycW7+6wJytXI6qUHQy6TrXbtHm2ko4u7L5N5aRv8IS9P4WbnTHXr/T6ZOMoqSaafBo05sJW6kNaLloNStE7RlqVzXLPEmNSuadoNa0ytkalYO33EVOhgZxgBuhBBHdjZqtQePfj83FnpOEtaJ9lTfPWOHs9e/M8vkPN3kOVqS3jYptKDU4u06Ttta1TWp6Oenn653z5b9l3vb/NFiO1b704u+2102cprpjfpwT4eLu9nYWuc2eXbt+fvPlXIeFm2nk7XJ0dqWvSn8Vtv/wl1bzvh6+R5e27c7S3TYMjoucemDo0+a7V6GZwndnlotbtetf5TfMfVaLIUdGvzLl6jF5ejnv9Mrnl7GvUytvvdD4wnal9TRjHWd75dGNvXmXb0oX0s2ytEripL/EvtRqeyxy79HPXj4ejY83bXd0y8e5jy56da9q1+g6T2xx6/q9fh1w3Py9dVY5duPdOsf8AxUNfyRzvp7/TZ+72Plm2PVND7xn+Lv8ATGW6bJDhkK4+yEZS+pE/ljU9PV/DRc3+0qrFxnJ8p3H0r2LUzfb+nSf1/wB1x3snPytL1ykH/Th4Y/Rx9ZzvVrrz6+efC2sbRUQnK3p3WMV6V9p1nLh33rthaUeC0NONrY2oxrLRdrCY0SnK46cIdgVmopUAypoFXRR1dEuLCOK5dd2X5FwX2kdZFigMci6rVuvxPSPpM9XIvPO15n09pxr0qRRcAKBVwABBAUABUAAAUAiigAAADSZVAABsCDQAjYALACAAqBAKjIMWAUmpKSeqdU+8aV9HZmrlqFxcJpP2nrl2Pn9TKyoioUQQogFAFAFAFAFAIAAASgAAwIAAARhQABAJUCUAgEYDl3AWFx25KSdAO23OF6FV7y4xDONN2zV6hZXFesUI3K47tklblc07XcRqVvw8+5Yahc8drhTmilj030XYKdtqUXwaIy5L+MnyJY3K86/icdDGOk6efdxQ3K47uP3Gdac0rc4SUotxkuElpRgextvmOdulrOXXDgrq4r0rmEvL3oytZFpTtyU4S4SWqIw8fdvL2PlRdElLkTHTnp4mJuG67Bd+VdUsjC/7b4x/hf2FlXrmV9ft+5Ye4WFexpqcecfii+xo043nG+cUypK1Ttkalc07ZLGpXPO0yN60TtEXWqVtmWtY9AXVUQmtsYhGV2PALG3DzLuLOsfFbl79t8GjfNxj2cSx5PmXyTh7rbe4bUlbyI6ytLRqXHSnBnaV5b8fFc+x+bIzhHYvNMNY/p2dwn28ErjfB/m9pvyxebHpZGx7psWSs3a7rdt8aaxlHslHmPC7K9fB33aN6j+23GysbM4dMvdl/DJ09hXO83nwwv8AlbKw7ru7deduuvRyfpXAzeWufd+2H+oZtnwZ2K5dty3/AOV/eZvDtO4yjPa8haSjGT+Gfhf0mLG/vWT2vHlqoxa7VqTGvvRbVZXCBMPu2RwrcfhS9JcS9s42oduvYtSzli+yN9rHcuC9bNzhz69rttYqTVTrJjh13a6IwikGUuXYWtG6zfCKIuNPjuy6p+qPJBWyMUuAFoEVNCq479/5kuiHuLi+0jfMSMeFODI0zajBOTdIrVsVMeZkXpXrjlwj8K7jhetenjnI1ojSgFwAoFXAAEAKAAqAAAAFAVAVAVAVA0kUAAQAAC4lAYAAIwFQIAIqAYsggHs7Rd67Dtvjbenoep6fVfh5PfMuu7kdHDQJogaNA0oDSgNAaBUoAoAoBAFAIAoAoBAAVKAAIwJQCAKAYsCEXEKMrc5W2pR0oCx6EZwuw6lx5oMY0XrVaixY47trQjUrku2uVCY3K5Z2iNMsbJu48/DrF+9F8GB61u5ayIdcPWuaCNN2wnUljUrgv42pmx0leffxjNblcV6xo1QY1K5LtkjTLDzszBudVifhfvW3rF+oJfl9Pt274mdHpT6L6XitPj6u0MWYyzcCxkwcZxWvMliyvlMvbc/acr91gycHzS1jJdklzJ4dfjqY+g2PzHjblH5VylnNj71l86c49qNyuHXFj12isytU7YWVonb7CWNyuadomNStM7ZnGta3bJioouoxWyMRiF1PqS7iLGuhStljIvY81O06Pn2PuZZ1jPXMs+WW67FtnmCxKSjG1mpa9/pOvPWvN/z58PE2ret38s3/ANhucJZO2rRJ6ztrtjX3o9x0nTPXG/MfS3tl2jeMaObt1yMo3FVOL0r9jK5zqz4rRYzd92dq1NPJxo/BPVpd0uI1q8zp7OLve056UZP5N1/0rumvc+DK5Xixuu7Nh3NflrXmhifeud7DYi/A3H0OhPq1PZWS2aK+OXtY+sX71shtlmPHX0l+rN6rot4luPBIuM63RtrkE1J3bVpeOdH+Hi/YRWiWVdueG0uiL4t6spiQspOr1fayK3JaAVU7fUUKaa8O3sIRx3sh3awtOkOcu0mtzlIW6BWxKnoISuDNylN/Lg/AuL7WceutenniRymW1QFBgDFCFQCYFCAFAAAKAoAAAAKAoBpIoAAgMAuAE5AAAEYEAAQijIMWBAOvbb/ysqKfuz8L9fA6evrK5e7nY97Q9LwjAdgABQCAKASgIUC6UBoBKAAIBAAEYAByCoBGAAjAgEfAEY0qRQCPiBss3pW59S4c12lTHeumcOpe6ysue5a4/QRqOS5b7SLK5LlvuI3rnnb9qI0wt3blm4pwdGuK5Nd4Hr49+1k2246SXvR5oJjG5aT5CxZXDfx+4zY3K4L2PxM46SuC7Y7iNyuS7ZfYRXM4zhJSg3GS4NcUB7m1eY1Jxx85pS4Rv6Uf8RcT6vau2bd2FHSUX6yYzK+T3nYJ25/uMZuE4+KLjVNP1GXbnrXfsHmd3ZRwtyahkcLd56Kfc+xmpXPv154fRtcOztNOWtc46/aF1puQ/sI1rnlAmNa1ygRqMegi6yjEGtV3+Y+4y1GLQKKgJVg5QkpwbUlwaKlkr0HPC3Wz+2zoL5nCNzhU68975ebv13n5jwL+zbz5dy3lbZNuy9Z2+MJLslH7TpuM/HT6HaPM+2brFWL8Vj5r0lZuc3+R8yy65dcWOnK2DGu6xjQpO65YYG5Yj/y1+cYr4a1XsdUF2Xy6Ibpu1vS7ahd76OL+gbU+kb471P48Vr+GX3ofZm8f5Z/6w3wxpf4v7C6n0X/UcmXuWYx722/uLp9Ucs2779xpdkfCiDO3ipaviEb1BIDJIBQDG5chbj1XHRcu19yQ0k1xXb92++lLotL4eb9JHSTGVuCRFtbUqLsCOHMzK1tWn4fil29yOfXTt6/X+XF2nPXZewgqKKAAoQAICgAAFAAAi1AVAVAAALUDSRQAFiAAAE5AAAEYEIAECoyCMCAKtariij6TDvq/jQn8VNfTzPXzdj53fOXG2hWVoBKAAJQAAAAAIFAIwIAYEAjAAGFQCMABAIBHwAhFAI6MgFG7Gv8ARLpb8D4ljNjtnBP1lRyXbZF1y3bdPtI1HLdh2Eblc04L+0jUa43J2binB0kgPXxsq3k29NJr3ohmly2qBZXHesrXQljpK4L9gxW5XBes6ErpK47lviRXHft0TfZxZpXl+U/PGRt3TiZ3Vewm/DLjO3Xs7Y93sGMWP0mE8fKx43rMlcs3FWE1qmmZR83vuwqSdy2te4zXbno8v+Zp48lgblJuNaWr7pp3S+81K5+z1/mPraJvjVcnyZpyYShz9QXWqdpEa1onAjUa5QIqxiRXNdp8yXpI3GJCrFOtWEVVAUKPQw90lBfKyF8y09E3q0dOe/24d+r8xo3LyxhZ0fn4zUZPVNcK/YdM/Mcp3Z8VyYu7b9s0vk5cHl4sdE376XdLn6xOv2t4l8Podv3za9wSVq70Xedm54Z+x8fUalceuLHa7UXxRWGLxo9gVFZhwoBkrSXBFRkorsAyoAAkpRguqT6Y9rC45Lu4Rq42I9b/ABvgS1Zy0q3cuT6rj6pduhGvDfGCQGWkU23RdrFpJXn5ea5pwtVUOcnxZy67d+PX+a4+S7Dm7Kgh2AZIQUoAAigEBQAAABkAAgAIAAKAA1EaAAEYAABGAAjAhBSABiFTkAAxAjA9PZMjpuSsyek9Y+lHb09fOPN/Y5+Neyeh5UIFAFAAEAMCAAIAAj4BYgB8AIAAjAAAqVAmgEIIAAxYUAlAAAlV24l7rj0S95cPQajFjZOBWZXJdgnUjbkuQRGo57kaErUrmuR4kaaFcuWbiuW5Ua5BXtYeXazLXVHScdJw7H9wY8Fy3qFlcd61oZsdJXDftKhix0lcF20tSNyvL3JfLxL0vwwk/oZYr87gqGoPpfK3mnJ2i8rVxu5gXH+pa5xb+KH3EqWP0+1cxs3FjesyVyxdVYSXChlPD5rftlWs4R0M2OvPWp5b8xTxrkdvzp1s16bF58YdkZPsLz0x7PX+X2DXOtVyNuLGUQsaZw9pK01uJGoxUSVXFOnXJ97+szXT8IRFAqAAAN2PlXrEuq3Ki5x4pmp1Yx3xOvL1LOXiZcei7FRm/hlwfoO3PUrzdeu8+HFneWcS7WVuPRLk0W8pPY0W15gwElavfOtR+C4urT0+99I2rnNdVrzNejpl4bXbK06/Q6fWX7J/F+q67XmLa5+9Kdt9kov7Kl+0YvrrojvG1vhkxNbGf4+iW7bav66foTZNi/x1g95xv6cJ3PVRfST7L/HWuW4Zlx/pW420/ifif3DV+kYKxduvqvTc5d/3Ab7dmMUqA1sSowjC9kWrMaydZfhWrM9dSNc82vNyMq7eeukeUVwOPXWvTzxI0pakUogMkAAqEFKABcAigEBQAACoCgAAAAAAAANRFAAEYAABGAAjAhBSABiFTkAAxAjAyt3JW7kZxdJRdUXcSzZj6fHvK9ZjcjwktV2M9nN2Pndc5cZlQIAACAQBQCAAIA5BYlAFAIBAAEABUaAlAIQQABiwoAAlABKLCThJTXFAr0oyVyCmuZuOdjTchxC65btsjTluwdOBGo5bkQ3HHeSo0RY+Yzd8ycHfYXcWWlhKNyHKXVrJMNY++2/cMbccOGVjusZrxRfGMucWRzzGVy3UNSuG/a7iVuVw37SMOkrwfMK6Nqyn/wC7a9uhG5X54lQqtsfRyCx9L5T8yT2rIVm83LBuv9SP4W/jX2kXrnX6RchZybClBqdu4qwktU0+DI5S4+N3ra3anKSiYr0c3XpeVd+kqbfmS4aWLr5flf2GuenP2+v8x9U+824Nco+wLK1uDI0wlGifcjNWPN7e8zXaeBERQKBQKBAHoKOvG3HIs6V64c4y+xmue7HLv1Tp6NrccS8qSfy5dkuHtOk7jz31dRtljWpxrRST5m2NaJbfjt+4Vr7Mf9NsfhBrJYNlfADWxY8I8IhLWxW12BGSi+CA13MnHte/NV7FqyXqRZxb4cV3cpzqrfgXbzOV7d+fVI45Nt1fHmYrrMEwKEUAgKBUIKUAC4BFAICgAAFQFAAAAAAAAAaiKAADQEAAKAQCAGQCCMCBUfAABiBGACvT2XK6ZvGk9JusH380dvV1nw839jjfl7J6HkCAAAjAgACAAAEoFgBGBAFAIwIACowAGJAoBAI0AoFQAAoShwCx04NyknbfPgWVnqOmcVqaYjluxDTkurVmWnJeXMNx52bcjatXLsvdhFyl6Eqkaj89nOV29O7L3rknJ+sOkez5a3u5teX1OrxrtFfh3fiXegl51+kKVu5bjcttStzSlGS4NMOTnu26r0ksalcGRa4mLHSV8x5t8GzX/wA3SvbNEdeX5+ohtshEK3QjqFfaeSt++U1tmTL9Ob/y8n8Mvw+h8jLHfP5fT7phq9ZlprTQz1E46fFZVh2rzXB8mYr0yvrvLe9fvLf7a+/8zbXhb+OK5+ntOnPTze3158vaaNuTCUQsab3htTfczNjXPl5lDDstCABQFCikCgBVAtAhqBstXr1p1tycfQzUuM9cyumG65Ka6kp+k1965/xRvju8eE7PsZr+Rm+j/K/6tY/7cvai/wAjP8N/Y91t8rT9bJ/Iv8LXPdbzVIwjH6SfyNT0xz3MvIue9N07FovoM3rW5xI1IjSjVACCKBQigAKAAAVAxQYLiEqgBoFABUCoCgAAAAAA1EUAAAIAAAQABGQCABiFGBAIBGBAqxcoyUoukouqZYWa+lwslZNiNxe9wmu89nHWx832cfW438fSKzR6AQCUAUAgACAAAWDQGLAgACMA0BAoBKARoggBgQCBSgEAEofYATcZKS4oD0k1OCkuZqMVqnHmUjkuw0qZacV5aMNx8v5syflYCtRfjvypT8q1f2EdeXyUI6BvHRCIV9f5P3dxl/p1+XglV47fKXFx9ZNc++fy+ouQ4hycV+3xJY6Svj/O6cdpp+K7GP0N/YYejh8GosOjOCIrfBak1ZHTaTUk06NaomtP0nYNyW47bFzf69rwXV2vk/WHDqZXheYcb5WRF8nUxXf134ebj3r1i7C9al03IOsWSV0s2Pvttz4Z2JC/Gik9LkVykuJ2l14u+frcdLWhWY58zTHn36Ga1x5eZQ5uygKAALQABQCAoSgQAtC6qlNAgACKgqgAFAKAAyDIAAoAABQAFQSqAAFAABUBQAAAAAAa6EVAABgQAAAgAAQGQQCMKjAgACMDEKFHXt2Z+2v1b/TlpNfb6jfHWOfs52Poq1VVquTXM9XL56aloGQAARgQCAAAWANRgYgAIwAAKgACEEYEYEAgUAMCIlABqFjswp1hKD4rVIsY6bZrQ0kct6OjJWnBkJdLI1H595myfn7pKCfgsLoXp4yDvy823BkbdNuJB0WuqMlOLpJOsWuTRNV+gbPuC3DAhdel6Phux/MufrK8/XONl6FahY+I8/PpwbEPxXa09EX95zr0ep8OokdsZxiiLjdbiSrHVaiSrHv+Wct4m4wq6WrvguL08H7RKnfOx7Pm6zSFiSXGTX0GemfU+bMvQ9Py/uLw85Rk6WL9I3FyT5SN83HL28faPt+KOrxxybhpYXe0Z6dOPLzqHN1UAAoBQACgAChKBCgFKKgFChQC0AoAAgKACLQChAABQAACgUBUFWoTAAAAAVAGBNQGoFQDUBqBiFYgAAEAAAIwAAgMggECoBKAAJQCMKgEKPZ2bO6l+2uPWK/Tb5rsPR6u/wAPJ7/X+Y9U6vMjIAAABiAaAgAAwIBGFQAwIAAgUAhBAFAIBiFAAEJRQAG3Gn03V+bQROnbNcTbEct7gzNaeRumRHHxb1+XC3Fyp20XAN8x+aScrk5TlrOTcpPvepK9ONsIkVvtxIrotw+glV7Xl7MeJmqMnSze8EuxPkxGO+dj6y7HRmnCPgP9wn4sO2u2cvqRz6ev0Pjugy7soxA3wgRXTahwJVj0MaNGqGVfSb9d/cbPhX+MnKkvT0upevDl65nVfO0MPQUKPtfL+d+62+Km63bXgn9j9h15rx+3nK3blpbtrtf1Ds9bgOboAAKAAUAoABQJVSCLQoUKKkwFGAoBaAACAoAChFCAAABUAAAVAUAAAAUIAACYFAAAAAABiFYgAAACAAAEYAgMggECjAgEYADEKAQCxlKMlKLo06plLNfRbfmrKs1el2Gk19p6uO9j5/t9X1rpZpzAAADEAAaAgBgQAFRoCAGgIACoAaIIBGBAAVKAQAShQBQCrRp9moWx6TdYp9qNRzrmvLiWrHyHnTL6MWGMuN+Tcv4Y0+0xXf1Pj4w4UI7N0IkV0W4kV0W4EHRCAH2WBf8A3GDbuP36dM/StDUebqZXwX+4TruWNbXCNlv/ABSf3GOnq/r+HyygzD0M4wA6LcCK6bcCVY78eHAivZzNfL9pfgvUXriyXw5z/p4tCOxQJXr+WMj5W4fLekby6Wu9ao1xfly9s2PoNzfitx7E2b6cfW4TDotAFAFALQAAAoAJVQRSgUEBWAArAUAAALQChAIAAAFQAABUBQAAABQgAAAEBQAAAAAxCpQAwMdQGoCgCgACMAQGQQCBQCAAI0BGgIBGgoBsx787F2N229Vo12rsNS2J1zL5fR4uTbyLKuQfH3lzT7D1c9bHz++LzcbqFYRgAJQCAADAgEYAKjAgEAAUgxABUAAQCACKlAAAAACvQsuuPFmo59eWi+WrH5x5kyv3O63UnWFr9OP933vpOder1z4edGLI6N1u2RXRbtkHRbhqB0QgB7uwXGldsvg/HH6jUcvZHxvnqTnvtPwWoL2tv7Tn3fl6PRP9Xz0YmHdthADotwZFjptwehFehjwMj081U2OCfxXvqiy/hj/6eK0ZdFSCN+JL5WTauLRxnF+xlidTY+r3KXVeh/Cn7Wdenn4ctDDaagUAAQFAUCaA1aAUIFAoqAAAKgAABRgXUAgihFQEoAoBUAAtAAFAAEBaAAgAAAAKAAAAAGIUAjAgAAAAgACUIBAAjQVAAEAARgQCMKiVQDoyjfhZdzFudUdYP349qNc9ZWPZxOo+isXrd60rlt1i/wDijPTLr5/XNlxmyoAAMQABgQACIFAIwIAChEQCBUaAAQCACKAKAKAKAEtSK7cZ/oes3HPry4t4yo4uFevv+nFtLv4L6RWuJtfmXinJyk6yk6t97Odr2yM4QJo3wtkV0QgQdFuAHTCIHobW+jLg+T8L9ZqVjvw+O83Nz8wZXPp6I+yCOXd+Xo9H/MeTGDqZ11boWho6Ldsiuq1b4Equ6xDh9JB2by+ixiY3OMXcn6Z8PqLWOfOvJcTLaqIGyEPEgPp8ptzjXlCP1HWvNy0GWwBQC0AUAAAyqQFAAWhQKAAABQAFoBQAAIBFQAAAAqAoAAAAICgAgAAAAKAAAAAGIUAjAgAAAAgAAQGQQAFTmBADAgBgQCPmFTkwIBGKR6uw1rc96mlaU6PXzqdvW839l7B3eWgQAxAAGBAABhUAjAgFChEQDEKARgAAGJFAAAAAIrsxv5L9JuOfXl4PnSv+kv3vfjwpTj8XcOnX1eXw0Tk9bfD1EG+PqFG+36iDohxA3w4hK7sL/wBRb/iLGevD4zzN/wDX83/4nP0I5d+Xp9P/ADHnx48jLq3x9QG+1x5BXZa4LgZo7cWnzIVpxXHh66CF8M97/wDqNzjwjx9C938vYKzx4eeRoiBvs/zFw9ZYXw+izP5z9EfqOlefloMtKgAACoAwC4BlQABAUoFAAgKAAAZAAAAIBFQAAAAqAoAAAAICgAgAAAAKAAAAAH//2Q==\" width=\"410\" height=\"260\" alt=\"post-landscape-5.jpg\"></p>', 2, 0, '2024-11-23 19:37:39', '2024-11-23 11:07:36');
INSERT INTO `posts` (`id`, `title`, `slug`, `description`, `body`, `category_id`, `status`, `created_at`, `updated_at`) VALUES
(26, '<p>ssssssssssssssssssssssssss</p>', 'pssssssssssssssssssssssssssp', 'Blanditiis labore ea', '<p>ssssssssssssssssssssssssss</p>', 1, 1, '2024-11-23 18:45:41', '2024-11-23 18:45:41');

-- --------------------------------------------------------

--
-- Structure de la table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL,
  `guard_name` varchar(150) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2021-05-27 14:12:32', NULL),
(2, 'user', 'web', '2021-05-27 14:12:32', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` text DEFAULT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `settings`
--

INSERT INTO `settings` (`id`, `name`, `value`, `created_at`, `updated_at`) VALUES
(1, 'app_name', 'Nac.Memorial', '2021-06-04 09:39:02', '2024-11-23 13:27:48'),
(2, 'app_tagline', 'Cimetière virtuel pour les petits animaux de compagnie', '2021-06-04 09:40:19', '2024-11-23 13:27:48'),
(3, 'app_description', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.', '2021-06-04 13:36:20', '2024-11-23 13:27:48'),
(4, 'num_of_results', '9', '2021-06-04 13:37:37', '2024-11-23 13:27:48'),
(5, 'num_comments_at_time', '5', '2021-06-04 13:38:46', '2024-11-23 13:27:48'),
(6, 'app_logo', '7rUFONBQ7t6EZwz5rGc1Baw2c6eRQ3SXrhg.jpg', NULL, '2024-11-13 04:46:49'),
(7, 'app_color', '#ebd8bf', '2021-06-04 14:22:49', '2024-11-01 14:14:02'),
(8, 'new_entries', '0', '2021-06-04 15:08:56', '2024-11-23 13:27:48'),
(9, 'about', '<h1>About Page</h1>\r\n\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. </p>\r\n\r\n<h3>Text label</h3>\r\n<p>It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<h3>Text label</h3>\r\n<p>It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<h3>Text label</h3>\r\n<p>It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<p><strong>Hello</strong></p>', '2021-06-09 15:07:56', '2021-06-18 12:03:23'),
(10, 'terms', '<h1>Terms &amp; Conditions</h1>\r\n\r\n<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\r\n\r\n<h3>Why do we use it?</h3>\r\n\r\n<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>\r\n\r\n<h3>Where does it come from?</h3><p>\r\nContrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p>\r\n\r\n<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', '2021-06-09 15:07:56', '2021-06-18 12:18:29'),
(11, 'new_comments', '0', '2021-06-16 11:09:13', '2024-11-23 13:27:48'),
(12, 'jumbotron', '1', NULL, '2024-11-01 14:14:02'),
(13, 'dir', 'ltr', '2021-07-08 12:41:00', '2024-11-01 14:14:02'),
(14, 'recaptcha_site_key', '6Ld0QYUqAAAAAPAWI_eLlq7jTdC9qOMiEDMLG3R8', '2024-11-20 21:21:52', '2024-11-23 13:27:48'),
(15, 'recaptcha_secret_key', '6Ld0QYUqAAAAAFAvIU3KBButzE_LAqCvPLbemECZ', NULL, '2024-11-23 13:27:48'),
(16, 'GOOGLE_CLIENT_ID', '293268577134-t67pdcmktjo5ahvneuk3v6fqdqds9vid.apps.googleusercontent.com', '2024-11-22 09:00:27', '2024-11-23 13:27:48'),
(17, 'GOOGLE_CLIENT_SECRET', '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', '2024-11-22 09:00:27', '2024-11-23 13:27:48'),
(18, 'GOOGLE_REDIRECT_URI', 'https://nac.memorial/auth/google/callback', '2024-11-22 09:00:27', '2024-11-23 13:27:48'),
(19, 'FACEBOOK_CLIENT_ID', '696709915114695', '2024-11-22 09:00:27', '2024-11-23 13:27:48'),
(20, 'FACEBOOK_CLIENT_SECRET', 'a4264dfb69a83b99b9ea173fc7f16534', '2024-11-22 09:00:27', '2024-11-23 13:27:48'),
(21, 'FACEBOOK_REDIRECT_URI', 'https://nac.memorial/auth/facebook/callback', '2024-11-22 09:00:27', '2024-11-23 13:27:48'),
(22, 'description_min_length', '60', '2024-11-22 13:34:31', '2024-11-23 13:27:48');

-- --------------------------------------------------------

--
-- Structure de la table `social_links`
--

CREATE TABLE `social_links` (
  `id` int(10) UNSIGNED NOT NULL,
  `platform` varchar(50) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `icon` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `social_links`
--

INSERT INTO `social_links` (`id`, `platform`, `url`, `icon`, `created_at`, `updated_at`) VALUES
(1, 'Facebook', 'https://facebook.com/', 'fab fa-facebook', '2024-10-29 09:14:22', '2024-10-30 06:19:35'),
(2, 'Twitter', 'https://twitter.com/yourpage/1', 'fab fa-twitter', '2024-10-29 09:14:58', '2024-10-30 06:13:02'),
(3, 'Instagram', 'https://instagram.com/yourpage/4', 'fab fa-instagram', '2024-10-29 09:15:15', '2024-10-30 06:13:16'),
(4, 'linkedin', 'https://instagram.com/yourpage', 'fab fa-linkedin', '2024-10-29 09:15:22', '2024-10-29 09:15:32');

-- --------------------------------------------------------

--
-- Structure de la table `success_messages`
--

CREATE TABLE `success_messages` (
  `id` int(11) NOT NULL,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `success_messages`
--

INSERT INTO `success_messages` (`id`, `key`, `message`, `created_at`, `updated_at`) VALUES
(1, 'memorial_post_success', 'Your memorial posted successfully.', '2024-10-30 10:30:22', '2024-10-30 13:01:50'),
(2, 'comment_post_success', 'Your comment is in the process of validation', '2024-11-11 13:49:49', '2024-11-13 04:12:32'),
(3, 'message_send_error', 'You cant send message within 2 hour', '2024-11-18 00:26:20', '2024-11-19 22:54:32'),
(4, 'message_send_success', 'Your message send successfully.', '2024-11-18 00:26:20', '2024-11-19 22:54:48'),
(5, 'registration_success', 'Thank you for validating your registration by email.', '2024-11-18 00:28:31', '2024-11-22 10:37:26'),
(6, 'reset_password_message', 'We send a password reset link in your email', '2024-11-18 00:28:31', '2024-11-19 22:55:21'),
(9, 'memorial_post_updated', 'Your memorial updated wait for review.', '2024-11-18 15:57:39', '2024-11-20 17:18:24'),
(10, 'user_unverify_comment', 'You cant comment if your not verify your email', '2024-11-20 19:24:40', '2024-11-20 19:24:40'),
(11, 'error_delay_comment', 'You cant comment under 1 minute', '2024-11-20 20:08:59', '2024-11-20 20:08:59'),
(12, 'verification_sent_success', 'Your email verification email sent to your email', '2024-11-22 10:56:40', '2024-11-22 20:15:24'),
(13, 'verify_confirm', 'Your email verify successfully', '2024-11-22 10:56:40', '2024-11-22 20:15:46'),
(14, 'error_min_comment', 'sdfsd', '2024-11-22 12:05:46', '2024-11-23 19:38:30'),
(15, 'user_unverify', 'You have to verify your account :)', '2024-11-22 13:12:12', '2024-11-22 13:22:42'),
(16, 'logout_message', 'You have logged out. sdafsd', '2024-11-23 10:48:33', '2024-11-23 19:10:08');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `notification_comment` tinyint(1) NOT NULL DEFAULT 1,
  `password` varchar(150) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `avatar` text DEFAULT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `provider_id` varchar(255) DEFAULT NULL,
  `two_factor_enabled` tinyint(1) NOT NULL DEFAULT 0,
  `two_factor_code` varchar(255) DEFAULT NULL,
  `two_factor_code_sent_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `notification_comment`, `password`, `remember_token`, `created_at`, `updated_at`, `avatar`, `provider`, `provider_id`, `two_factor_enabled`, `two_factor_code`, `two_factor_code_sent_at`) VALUES
(1, 'Joris', 'demo@gmail.com', '2021-06-07 09:47:45', 0, '$2y$10$zANi/PDdllaY/nnZ6AiMseyy88G9V4mdnIy8y7VuZB6bm1HLZPHWS', 'jTcSABhMNF5Snvenjo1jWWXHGjizdad5Ud0bqBdPSSewHQ19UGobDeoHiHzi', '2021-05-27 12:13:50', '2024-11-24 08:47:33', NULL, NULL, NULL, 0, NULL, NULL),
(4, 'Jawad Ul Hassan', 'intelligentjawad@gmail.com', NULL, 1, '$2y$10$1pt/omgibMO0cynUOjCsG.ccPX3MtH2P5jFC3gjN3GzsEwEin.FGe', NULL, '2024-09-20 18:23:14', '2024-09-20 18:23:14', NULL, NULL, NULL, 0, NULL, NULL),
(31, 'Mahmudul Elahi', 'mahmudul.elahi@gmail.com', '2024-11-22 21:31:09', 1, '$2y$10$9fIF3CBLOCpeLrr5wmcCmOvGu6sCuvjmVSJTSoFpb0fosO8fqXEEC', 'kNPJApEvqX7XLVXDsatH5SCPB65Sa85kBJn3acaIBw2ZJdzw793i57JugqcR', '2024-11-12 03:22:42', '2024-11-23 11:52:11', 'https://lh3.googleusercontent.com/a/ACg8ocI3tEUn1_fMod8m3XnLhOoPJDCXUrmVrNFbgV0zibdTXSEvS5c=s96-c', 'google', '106410217763914370311', 0, NULL, NULL),
(36, 'Mahamudul', 'elahi44888799@gmail.com', '2024-11-21 16:20:21', 1, '$2y$10$GcXK55YT.S6WNebjZiJatO8eSEjdoDs.WRKxKdE7eSatJmNcYanIa', NULL, '2024-11-21 04:10:59', '2024-11-21 16:20:21', 'https://lh3.googleusercontent.com/a/ACg8ocLIwJRTO59Yh-SyAcJaqrITEqNnf6s6fo4B5_FmSB2b7iThTM9I=s96-c', 'google', '116591259589491661822', 0, NULL, NULL),
(37, 'Mahmudul', 'info.mahmudul.elahi@gmail.com', '2024-11-22 18:34:30', 1, '$2y$10$kiZcy61TLIFWObhQOrkXhu2FWF.fUNtVnOL6fzTMrdvEyg39bF57W', NULL, '2024-11-22 18:34:30', '2024-11-22 18:34:30', 'https://lh3.googleusercontent.com/a/ACg8ocLkTUn7cLZP3H2bk5wJ7i5lNf36Lap6h-SKakrgiYcbLAFVLD4=s96-c', 'google', '114740859085315240686', 0, NULL, NULL),
(38, 'MahmudulElahi', 'test12@test.com', NULL, 1, '$2y$10$6M8eL1/vi7iBgwyc5BcTpO.rjLoTBEh5/Y8MYbxSFKx1sLw/vmej.', NULL, '2024-11-22 18:50:22', '2024-11-22 18:50:22', NULL, NULL, NULL, 0, NULL, NULL),
(39, 'Joris', 'wacholderjoris@gmail.com', '2024-11-23 14:38:26', 1, '$2y$10$Ig9TX1Bo/Prc4rYDjTJU/uiw97Pdnve7/gfHm6Ed1JAEWikOW/dDm', NULL, '2024-11-23 14:38:26', '2024-11-23 16:01:52', 'https://graph.facebook.com/v3.3/4946343022126992/picture', 'facebook', '4946343022126992', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `views`
--

CREATE TABLE `views` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `fingerprint` text NOT NULL,
  `item_id` bigint(20) UNSIGNED DEFAULT NULL,
  `page_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `views`
--

INSERT INTO `views` (`id`, `fingerprint`, `item_id`, `page_id`, `created_at`, `updated_at`) VALUES
(303, 'b3d398f171ca80d75d66c9aad20a9da5de28a96f', 29, NULL, '2024-11-13 04:11:36', '2024-11-13 04:11:36'),
(304, 'b3d398f171ca80d75d66c9aad20a9da5de28a96f', 30, NULL, '2024-11-18 23:25:09', '2024-11-18 23:25:09'),
(305, 'b3d398f171ca80d75d66c9aad20a9da5de28a96f', 31, NULL, '2024-11-19 06:01:22', '2024-11-19 06:01:22'),
(306, 'b3d398f171ca80d75d66c9aad20a9da5de28a96f', 34, NULL, '2024-11-19 18:49:22', '2024-11-19 18:49:22'),
(307, 'b3d398f171ca80d75d66c9aad20a9da5de28a96f', 35, NULL, '2024-11-19 22:15:35', '2024-11-19 22:15:35'),
(308, 'b3d398f171ca80d75d66c9aad20a9da5de28a96f', 38, NULL, '2024-11-21 03:17:34', '2024-11-21 03:17:34'),
(309, 'b3d398f171ca80d75d66c9aad20a9da5de28a96f', 43, NULL, '2024-11-21 04:14:48', '2024-11-21 04:14:48'),
(310, 'b3d398f171ca80d75d66c9aad20a9da5de28a96f', 44, NULL, '2024-11-21 04:27:07', '2024-11-21 04:27:07'),
(312, 'b3d398f171ca80d75d66c9aad20a9da5de28a96f', 37, NULL, '2024-11-22 17:41:51', '2024-11-22 17:41:51'),
(314, 'd95c1b440d29a89d6494557a3908ca87d6d7f48b', 29, NULL, '2024-11-23 11:02:33', '2024-11-23 11:02:33'),
(315, 'd95c1b440d29a89d6494557a3908ca87d6d7f48b', 44, NULL, '2024-11-23 11:41:22', '2024-11-23 11:41:22'),
(316, 'd95c1b440d29a89d6494557a3908ca87d6d7f48b', 35, NULL, '2024-11-23 11:41:45', '2024-11-23 11:41:45'),
(317, 'd95c1b440d29a89d6494557a3908ca87d6d7f48b', 31, NULL, '2024-11-23 11:51:16', '2024-11-23 11:51:16'),
(318, 'e4ab611c92c5af44f8f8dba012180c119b4f0203', 35, NULL, '2024-11-23 12:07:48', '2024-11-23 12:07:48'),
(319, '7c6df412e9ecf761a24257ad55c8dca3756f6c93', 35, NULL, '2024-11-23 12:14:04', '2024-11-23 12:14:04'),
(320, '4c96c7cc2dcb46936312c4a30c77dae0a748f89f', 35, NULL, '2024-11-23 12:39:06', '2024-11-23 12:39:06'),
(321, '31afc3d68aa59750e1d2bff29beca0b051223b1c', 35, NULL, '2024-11-23 12:48:03', '2024-11-23 12:48:03'),
(322, '7c6df412e9ecf761a24257ad55c8dca3756f6c93', 44, NULL, '2024-11-23 13:52:28', '2024-11-23 13:52:28'),
(323, 'd95c1b440d29a89d6494557a3908ca87d6d7f48b', 38, NULL, '2024-11-23 15:34:00', '2024-11-23 15:34:00'),
(324, 'd95c1b440d29a89d6494557a3908ca87d6d7f48b', 30, NULL, '2024-11-23 16:22:39', '2024-11-23 16:22:39'),
(325, 'd95c1b440d29a89d6494557a3908ca87d6d7f48b', 34, NULL, '2024-11-23 16:55:52', '2024-11-23 16:55:52'),
(326, 'd95c1b440d29a89d6494557a3908ca87d6d7f48b', 43, NULL, '2024-11-23 16:58:31', '2024-11-23 16:58:31'),
(327, '7c6df412e9ecf761a24257ad55c8dca3756f6c93', 29, NULL, '2024-11-23 18:48:01', '2024-11-23 18:48:01'),
(328, 'a7193f58c76bfb0e5fb2d1d2836425f28ce4d0b0', 43, NULL, '2024-11-23 20:21:46', '2024-11-23 20:21:46'),
(329, 'a7193f58c76bfb0e5fb2d1d2836425f28ce4d0b0', 38, NULL, '2024-11-23 20:27:49', '2024-11-23 20:27:49'),
(330, 'b3d398f171ca80d75d66c9aad20a9da5de28a96f', 49, NULL, '2024-11-24 07:46:18', '2024-11-24 07:46:18');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blog_categories_name_unique` (`name`),
  ADD UNIQUE KEY `blog_categories_slug_unique` (`slug`);

--
-- Index pour la table `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blog_comments_commented_by_foreign` (`commented_by`),
  ADD KEY `blog_comments_post_id_foreign` (`post_id`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_ibfk_1` (`user_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Index pour la table `details`
--
ALTER TABLE `details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`);

--
-- Index pour la table `email_contents`
--
ALTER TABLE `email_contents`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_contents_key_unique` (`key`);

--
-- Index pour la table `error_pages`
--
ALTER TABLE `error_pages`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Index pour la table `footer_descriptions`
--
ALTER TABLE `footer_descriptions`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `imageable_id` (`imageable_id`);

--
-- Index pour la table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `category_id` (`category_id`);
ALTER TABLE `items` ADD FULLTEXT KEY `title` (`title`,`description`);

--
-- Index pour la table `item_additional_images`
--
ALTER TABLE `item_additional_images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_additional_image_item_id_foreign` (`item_id`);

--
-- Index pour la table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Index pour la table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `likeable_id` (`likeable_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Index pour la table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Index pour la table `otps`
--
ALTER TABLE `otps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `otps_user_id_foreign` (`user_id`);

--
-- Index pour la table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `page_images`
--
ALTER TABLE `page_images`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `page_titles`
--
ALTER TABLE `page_titles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `page_identifier` (`page_identifier`);

--
-- Index pour la table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Index pour la table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Index pour la table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_title_unique` (`title`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`),
  ADD KEY `posts_category_id_foreign` (`category_id`);

--
-- Index pour la table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Index pour la table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Index pour la table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `social_links`
--
ALTER TABLE `social_links`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `success_messages`
--
ALTER TABLE `success_messages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `key` (`key`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Index pour la table `views`
--
ALTER TABLE `views`
  ADD PRIMARY KEY (`id`),
  ADD KEY `item_id` (`item_id`),
  ADD KEY `page_id` (`page_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `blog_comments`
--
ALTER TABLE `blog_comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT pour la table `details`
--
ALTER TABLE `details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT pour la table `email_contents`
--
ALTER TABLE `email_contents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `error_pages`
--
ALTER TABLE `error_pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `footer_descriptions`
--
ALTER TABLE `footer_descriptions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT pour la table `items`
--
ALTER TABLE `items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT pour la table `item_additional_images`
--
ALTER TABLE `item_additional_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT pour la table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT pour la table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT pour la table `otps`
--
ALTER TABLE `otps`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `page_images`
--
ALTER TABLE `page_images`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `page_titles`
--
ALTER TABLE `page_titles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT pour la table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT pour la table `social_links`
--
ALTER TABLE `social_links`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `success_messages`
--
ALTER TABLE `success_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT pour la table `views`
--
ALTER TABLE `views`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=331;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `blog_comments`
--
ALTER TABLE `blog_comments`
  ADD CONSTRAINT `blog_comments_commented_by_foreign` FOREIGN KEY (`commented_by`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blog_comments_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `details`
--
ALTER TABLE `details`
  ADD CONSTRAINT `details_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `items_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `item_additional_images`
--
ALTER TABLE `item_additional_images`
  ADD CONSTRAINT `item_additional_image_item_id_foreign` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `likes`
--
ALTER TABLE `likes`
  ADD CONSTRAINT `likes_ibfk_2` FOREIGN KEY (`likeable_id`) REFERENCES `items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `likes_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `otps`
--
ALTER TABLE `otps`
  ADD CONSTRAINT `otps_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `blog_categories` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `views`
--
ALTER TABLE `views`
  ADD CONSTRAINT `views_ibfk_1` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `views_ibfk_2` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
