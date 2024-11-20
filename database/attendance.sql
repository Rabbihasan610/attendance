-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 20, 2024 at 07:43 AM
-- Server version: 8.0.30
-- PHP Version: 8.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `attendance`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `office_holidays`
--

CREATE TABLE `office_holidays` (
  `id` bigint UNSIGNED NOT NULL,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci,
  `holiday_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'H',
  `status` enum('Pending','Approved','Canceled','Rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Approved',
  `entry_user_id` int UNSIGNED NOT NULL,
  `approved_id` int UNSIGNED DEFAULT NULL,
  `approved_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `office_holidays`
--

INSERT INTO `office_holidays` (`id`, `title`, `start_date`, `end_date`, `note`, `holiday_type`, `status`, `entry_user_id`, `approved_id`, `approved_at`, `created_at`, `updated_at`) VALUES
(2, 'Weekend', '2024-11-01', '2024-11-02', NULL, 'H', 'Approved', 0, NULL, NULL, '2024-11-19 17:14:39', '2024-11-19 17:14:39'),
(3, 'Weekend', '2024-11-08', '2024-11-09', NULL, 'H', 'Approved', 0, NULL, NULL, '2024-11-19 17:14:56', '2024-11-19 17:14:56'),
(4, 'Weekend', '2024-11-15', '2024-11-16', NULL, 'H', 'Approved', 0, NULL, NULL, '2024-11-19 17:15:10', '2024-11-19 17:15:10'),
(5, 'Weekend', '2024-11-22', '2024-11-23', NULL, 'H', 'Approved', 0, NULL, NULL, '2024-11-19 17:15:25', '2024-11-19 17:15:25'),
(6, 'Weekend', '2024-11-29', '2024-11-30', NULL, 'H', 'Approved', 0, NULL, NULL, '2024-11-19 17:15:37', '2024-11-19 17:15:37'),
(7, 'General Holiday', '2024-11-05', '2024-11-05', NULL, 'G', 'Approved', 0, NULL, NULL, '2024-11-20 05:01:01', '2024-11-20 05:01:01');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('6H7SOk4vu1WU0oB4BATkescv01lGHraciXyjwagT', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiWXVIWUxpWmFKbk9CcVV2eE9tVjBOUUZvQzlNQkljdGpkWXVZZnVURyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9yZXBvcnQiO319', 1732088204);

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` bigint UNSIGNED NOT NULL,
  `tuid` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rfid` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name_bn` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `designation` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `designation_bn` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_bn` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `department_id` bigint DEFAULT NULL,
  `mobile` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alter_mobile` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alter_email` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `father` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mother` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dob` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marrage_status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `religion_id` int DEFAULT NULL,
  `joindate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` bigint UNSIGNED DEFAULT NULL,
  `district_id` bigint UNSIGNED DEFAULT NULL,
  `policestation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postoffice` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int DEFAULT NULL,
  `status` enum('Active','Deactive','Trash') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `tuid`, `rfid`, `name`, `name_bn`, `designation`, `designation_bn`, `subject`, `subject_bn`, `department_id`, `mobile`, `alter_mobile`, `email`, `alter_email`, `password`, `father`, `mother`, `dob`, `gender`, `marrage_status`, `nid`, `religion_id`, `joindate`, `country_id`, `district_id`, `policestation`, `postoffice`, `avatar`, `position`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(3, 'NCT-001', '2022004005', 'MD ZAKIR HOSSAIN', 'জনাব মোঃ জাকির হোসেন', 'Assistant Professor', 'সহকারী অধ্যাপক', 'Political Science', 'রাষ্ট্রবিজ্ঞান', NULL, '01772937417', NULL, 'mdzakirh2207@gmail.com', NULL, NULL, NULL, NULL, NULL, 'Male', 'Married', NULL, NULL, NULL, 1, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-657fcc28d08f8.png', 1, 'Deactive', NULL, '2023-11-23 07:49:46', '2024-10-14 07:24:06'),
(4, 'NCT-021', '2022004001', 'MUSAMMAT SURAIYA NAZNIN', 'জনাব সুরাইয়া নাজনীন', 'Lecturer', 'প্রভাষক', 'Economics', 'অর্থনীতি', NULL, '01725260085', NULL, 'suraiyanaznin79@gmail.com', NULL, '$2y$10$m0QMekxISvzlxxvPYxhD1.Yq5XgK6V3KDwwwC7Yb06PIM4ePSUKpO', NULL, NULL, '11979-02-01', 'Female', NULL, '৫০৬৮৪৬৩৮১৮', NULL, NULL, 1, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-65924c8d49348.jpg', 19, 'Active', NULL, '2023-11-27 17:50:05', '2024-09-14 08:17:20'),
(5, 'NCT-010', '2022004017', 'MD. FORKAN', 'জনাব মোঃ ফোরকান', 'Assistant Professor', 'সহকারী অধ্যাপক', 'Islamic Studies', 'ইসলাম শিক্ষা', NULL, '01914961198', NULL, 'forkanmd898@gmail.com', NULL, '$2y$10$m0QMekxISvzlxxvPYxhD1.Yq5XgK6V3KDwwwC7Yb06PIM4ePSUKpO', NULL, NULL, NULL, 'Male', NULL, '২৩৮০১৬৭৪১৭', NULL, NULL, 1, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-657fccdf3b4ea.jpg', 8, 'Active', NULL, '2023-11-27 17:52:02', '2024-07-02 04:58:04'),
(6, 'NCT-011', '2022004039', 'MOHD HABIBUR RAHMAN AKANDA', 'মোঃ হাবিবুর রহমান আকন্দ', 'Assistant Professor', 'সহকারী অধ্যাপক', 'Management', 'ব্যবস্থাপনা', NULL, '01553618803', NULL, 'habib_akanda@yahoo.com', NULL, '$2y$10$m0QMekxISvzlxxvPYxhD1.Yq5XgK6V3KDwwwC7Yb06PIM4ePSUKpO', NULL, NULL, '1974-12-06', 'Male', NULL, '৩৭৩০৫৪৩৬৩৮', NULL, NULL, 1, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-657fcd0e5f202.png', 9, 'Active', NULL, '2023-11-27 17:53:32', '2024-07-02 04:58:04'),
(7, 'NCT-012', '2022004018', 'MARJIA KONIKA SULTANA', 'মার্জিয়া কনিকা সুলতানা', 'Assistant Professor', 'সহকারী অধ্যাপক', 'Philosophy', 'দর্শন', NULL, '01915838285', NULL, 'mksnc15@gmail.com', NULL, NULL, NULL, NULL, '1976-01-11', 'Female', NULL, '৩২৯০৮৪১১৪১', NULL, NULL, 1, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-657fcd745a0a1.jpg', 10, 'Active', NULL, '2023-11-27 17:54:40', '2024-09-23 07:41:26'),
(8, 'NT-013', '005283432', 'MORSHADA SANJID', 'জনাব মোর্শেদা সানজিদ', 'Library Lecturer', 'গ্রন্থাগার প্রভাষক', 'Library', 'গ্রন্থাগার', NULL, '01717955832', NULL, 'morshadasunjid9444@gmail.com', NULL, '$2y$10$m0QMekxISvzlxxvPYxhD1.Yq5XgK6V3KDwwwC7Yb06PIM4ePSUKpO', NULL, NULL, '51967-02-06', 'Female', NULL, '৯৫৬৫২৪০২০৮', NULL, NULL, 1, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-657fce143095f.jpg', 18, 'Active', NULL, '2023-11-27 18:02:53', '2024-07-02 04:58:04'),
(9, 'NCT-014', '2022004023', 'TOSLIMA BEGUM', 'জনাব তসলিমা বেগম', 'Assistant Professor', 'সহকারী অধ্যাপক', 'Chemistry', 'রসায়ন', NULL, '01717042420', NULL, 'toslima19.bd@gmail.com', NULL, '$2y$12$D6/HDoJvOBkfcOETwCtIcuMrp/S5MV6KONl4vUmRBC.PdoPer3DZ.', NULL, NULL, '1977-02-07', 'Female', NULL, '১৯৭৭৬১২৭২০৫১৬৯৪৯৭', NULL, NULL, 1, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-657fce74972a7.jpg', 11, 'Active', NULL, '2023-11-27 18:04:35', '2024-09-14 11:24:42'),
(10, 'NCT-015', '2022004024', 'MAHBUBA BEGUM', 'জনাব মাহবুবা বেগম', 'Assistant Professor', 'সহকারী অধ্যাপক', 'Chemistry', 'রসায়ন', NULL, '01735969112', NULL, 'tasnimmabbuba1974@gmail.com', NULL, '$2y$10$m0QMekxISvzlxxvPYxhD1.Yq5XgK6V3KDwwwC7Yb06PIM4ePSUKpO', NULL, NULL, '1974-05-01', 'Female', NULL, '১৯৭৪৯৩১২৫৫৭৪৪৭৮০২', NULL, NULL, 1, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-657fcf90ea46f.jpg', 12, 'Active', NULL, '2023-11-27 18:05:43', '2024-07-02 04:58:04'),
(11, 'NCT-016', '0002385556', 'FERDOUS SHIRIN HAQUE', 'জনাব ফেরদৌস শিরিন হক', 'Assistant Professor', 'সহকারী অধ্যাপক', 'Botany', 'উদ্ভিদবিদ্যা', NULL, '01918106873', NULL, 'shirinnasirabad@gmail.com', NULL, NULL, NULL, NULL, '1967-01-01', 'Female', NULL, '৩২৮০৭৯১১৪০', NULL, NULL, 1, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-657fd087e0f18.jpg', 13, 'Active', NULL, '2023-11-27 18:07:39', '2024-11-11 06:12:36'),
(12, 'NCT-017', '2022004013', 'MUSAMMAD SHARIFUNNAHAR BEGUM', 'জনাব মোছাম্মদ শরিফুন্নাহার বেগম', 'Assistant Professor', 'সহকারী অধ্যাপক', 'Islamic History & Culture', 'ইসলামের ইতিহাস ও সংস্কৃতি', NULL, '01721142740', NULL, 'snbegum79@gmail.com', NULL, '$2y$10$m0QMekxISvzlxxvPYxhD1.Yq5XgK6V3KDwwwC7Yb06PIM4ePSUKpO', NULL, NULL, '1979-04-01', 'Female', NULL, '৪১৭৮৮০৪৩১৮', NULL, NULL, 1, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-657fd0c4c39c8.jpg', 14, 'Active', NULL, '2023-11-27 18:08:46', '2024-07-02 04:58:04'),
(13, 'NCT-018', '2022004032', 'MURSHIDA KHANOM', 'জনাব মুর্শিদা খানম', 'Assistant Professor', 'সহকারী অধ্যাপক', 'Zoology', 'প্রাণিবিদ্যা', NULL, '01742219493', NULL, 'murshidakhanam324@gmail.com', NULL, '$2y$10$m0QMekxISvzlxxvPYxhD1.Yq5XgK6V3KDwwwC7Yb06PIM4ePSUKpO', NULL, NULL, '1979-03-12', 'Female', NULL, '৩৭৩১১৭১৮৫০', NULL, NULL, 1, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-657fd10d8d8cc.jpg', 15, 'Active', NULL, '2023-11-27 18:09:38', '2024-07-03 03:40:21'),
(14, 'NCT-019', '0005281987', 'ISMATARA YESMEN', 'জনাব ইসমত আরা ইয়াসমিন', 'Assistant Professor', 'সহকারী অধ্যাপক', 'Social Work', 'সমাজকর্ম', NULL, '01717608999', NULL, 'ismatarayesmen@gmail.com', NULL, '$2y$10$m0QMekxISvzlxxvPYxhD1.Yq5XgK6V3KDwwwC7Yb06PIM4ePSUKpO', NULL, NULL, '1982-07-09', NULL, NULL, '২৩৬৬৭১৪০৫৯', NULL, NULL, 1, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-657fd138c48d0.jpg', 16, 'Active', NULL, '2023-11-27 18:10:21', '2024-07-02 04:58:04'),
(15, 'NCT-020', '2022004044', 'SAJIA NASRIN ETE', 'সাজিয়া নাসরীন ইতি', 'Assistant Professor', 'সহকারী অধ্যাপক', 'Accounting', 'হিসাববিজ্ঞান', NULL, '01716817419', NULL, 'sajianasrinete@gmail.com', NULL, '$2y$10$m0QMekxISvzlxxvPYxhD1.Yq5XgK6V3KDwwwC7Yb06PIM4ePSUKpO', NULL, NULL, '1983-04-03', 'Female', NULL, '১৯৮৩৭২১৮৩৩৯২৩৩১৩২', NULL, NULL, 1, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-657fd1667a021.jpg', 17, 'Active', NULL, '2023-11-27 18:11:24', '2024-07-02 04:58:04'),
(16, 'NCT-022', '2022004020', 'ABEDA SULTANA', 'আবিদা সুলতানা', 'Lecturer', 'প্রভাষক', 'Physics', 'পদার্থবিজ্ঞান', NULL, '01725912922', NULL, 'abidasultana1980000@gmail.com', NULL, '$2y$10$m0QMekxISvzlxxvPYxhD1.Yq5XgK6V3KDwwwC7Yb06PIM4ePSUKpO', NULL, NULL, '1980-11-24', 'Female', NULL, '১৯৮০৬১২১৩০৬৬০৮৭৫৭', NULL, NULL, 1, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-657fd19b2a964.jpg', 20, 'Active', NULL, '2023-11-27 18:12:22', '2024-07-02 04:58:04'),
(17, 'NCT-023', '0005283986', 'TANZILA AREFIN', 'তানজিলা আরেফীন', 'Lecturer', 'প্রভাষক', 'Zoology', 'প্রাণিবিদ্যা', NULL, '01714239925', NULL, 'tanzilaarefin4@gmail.com', NULL, NULL, NULL, NULL, '1981-07-23', 'Female', NULL, '৩২৮০৩৭৪৭১৫', NULL, NULL, 1, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-657fd1ed230ab.jpg', 21, 'Active', NULL, '2023-11-27 18:13:13', '2024-10-23 04:51:02'),
(18, 'NCT-024', '2022004021', 'TANGINA ALIN', 'তানজিনা এলিন', 'Lecturer', 'প্রভাষক', 'Bangla', 'বাংলা', NULL, '01739496027', NULL, 'tanginabd@gmail.com', NULL, '$2y$10$m0QMekxISvzlxxvPYxhD1.Yq5XgK6V3KDwwwC7Yb06PIM4ePSUKpO', NULL, NULL, '1981-12-30', 'Female', NULL, '৭৭৮০৮১৯৮৩০', NULL, NULL, 1, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-657fd21ce60c8.jpg', 22, 'Active', NULL, '2023-11-27 18:14:35', '2024-07-02 04:58:04'),
(19, 'NCT-025', '0005289611', 'SYEDA NAZNIN SULTANA', 'সৈয়দা নাজনীন সুলতানা', 'Lecturer', 'প্রভাষক', 'Social Work', 'সমাজকর্ম', NULL, '01722003887', NULL, 'snazninsultana1984@gmail.com', NULL, NULL, NULL, NULL, '1983-10-01', 'Female', NULL, '১৯৮৩৬১২৫২০৩১১৯৭৫৯', NULL, NULL, 1, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-657fd2468cd59.jpg', 23, 'Active', NULL, '2023-11-27 18:15:33', '2024-10-23 04:52:09'),
(20, 'NCT-026', '2022004014', 'MUHAMMED MUKLASUR RAHMAN', 'মুহাম্মদ মোখলেছুর রহমান', 'Lecturer', 'প্রভাষক', 'Islamic History & Culture', 'ইসলামের ইতিহাস ও সংস্কৃতি', NULL, '01710544878', NULL, 'muklasur84@gmail.com', NULL, '$2y$10$m0QMekxISvzlxxvPYxhD1.Yq5XgK6V3KDwwwC7Yb06PIM4ePSUKpO', NULL, NULL, '1984-04-02', 'Male', NULL, '১৯৮৪৬১১২৩২৭৮৪০৫৩৬', NULL, NULL, 1, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-657fd26e60d36.png', 24, 'Active', NULL, '2023-11-27 18:16:24', '2024-07-02 04:58:04'),
(21, 'NCT-027', '2022004038', 'LUTFOR RAHMAN', 'লুৎফর রহমান রুবেল', 'Lecturer', 'প্রভাষক', 'Geography', 'ভূগোল ও পরিবেশ', NULL, '01677155846', NULL, 'rrlutfor75@gmail.com', NULL, '$2y$10$m0QMekxISvzlxxvPYxhD1.Yq5XgK6V3KDwwwC7Yb06PIM4ePSUKpO', NULL, NULL, '1975-12-31', 'Male', NULL, '১৯৭৫৬১১৫২৪৭৬৭৫১১১', NULL, NULL, 1, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-657fd6fec3e32.jpg', 25, 'Active', NULL, '2023-11-27 18:17:10', '2024-07-02 04:58:04'),
(22, 'NCT-028', '2022004035', 'MD. SAIFUL ISLAM', 'মোঃ সাইফুল ইসলাম', 'Lecturer', 'প্রভাষক', 'Mathematics', 'গণিত', NULL, '01913017295', NULL, 'sirana7184@gmail.com', NULL, '$2y$10$m0QMekxISvzlxxvPYxhD1.Yq5XgK6V3KDwwwC7Yb06PIM4ePSUKpO', NULL, NULL, '1984-01-15', 'Male', NULL, '১৯৮৫৬১১৫২৩৩৫১১৮৫০', NULL, NULL, 1, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-657fd7359da9f.jpg', 26, 'Active', NULL, '2023-11-27 18:18:39', '2024-07-02 04:58:04'),
(23, 'NCT-029', '2022004037', 'MD. NAZMUL HASSAN', 'মোঃ নাজমুল হাসান', 'Lecturer', 'প্রভাষক', 'Psychology', 'মনোবিজ্ঞান', NULL, '01736299993', NULL, 'n.hassan160715@gmail.com', NULL, '$2y$10$m0QMekxISvzlxxvPYxhD1.Yq5XgK6V3KDwwwC7Yb06PIM4ePSUKpO', NULL, NULL, '1988-07-17', 'Male', NULL, '১৯৮৮৬১১২০১১৪৭৬০৮৭', NULL, NULL, 1, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-659256f967a39.jpg', 27, 'Active', NULL, '2023-11-27 18:19:27', '2024-07-02 04:58:05'),
(25, 'NCT-030', '2022004002', 'REZAUL KARIM', 'রেজাউল করিম', 'Lecturer', 'প্রভাষক', 'Economics', 'অর্থনীতি', NULL, '01712396602', NULL, 'rezaulk08@gmail.com', NULL, '$2y$10$m0QMekxISvzlxxvPYxhD1.Yq5XgK6V3KDwwwC7Yb06PIM4ePSUKpO', NULL, NULL, '1985-12-31', 'Male', NULL, '১৯৮৫৭২১৪৭২৭৮৭০১১০', NULL, NULL, 1, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-657fd7feab12f.jpg', 28, 'Active', NULL, '2023-11-27 18:21:31', '2024-07-02 04:58:05'),
(26, 'NCT-031', '2022004019', 'MUKTA AKTER', 'মুক্তা আক্তার', 'Lecturer', 'প্রভাষক', 'Philosophy', 'দর্শন', NULL, '01739856176', NULL, 'muktabdit88@gmail.com', NULL, NULL, NULL, NULL, '1988-10-20', 'Female', NULL, '১৯৮৮৩৯১৮৫৭৩০০৬৯৭৪', NULL, NULL, 1, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-6581268f5de99.jpg', 29, 'Active', NULL, '2023-11-27 18:22:09', '2024-09-23 07:41:42'),
(27, 'NCT-032', '2022004091', 'ABU NAYEM', 'আবু নাঈম', 'Lecturer', 'প্রভাষক', 'Marketing', 'মার্কেটিং', NULL, '01973476933', NULL, 'abunayemfbl@gmail.com', NULL, '$2y$10$m0QMekxISvzlxxvPYxhD1.Yq5XgK6V3KDwwwC7Yb06PIM4ePSUKpO', NULL, NULL, '1983-12-31', 'Male', NULL, '১৯৮৩৩৯১০৭৭১৪৩৯৮৩৪', NULL, NULL, 1, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-65925db882907.jpg', 30, 'Active', NULL, '2023-11-27 18:22:52', '2024-07-02 04:58:05'),
(28, 'NCT-033', '2022004025', 'MD. MANIRUL ISLAM', 'মোঃ মনিরুল ইসলাম', 'Lecturer', 'প্রভাষক', 'Physics', 'পদার্থবিজ্ঞান', NULL, '01762861112', NULL, 'mdmoniruli771@gmail.com', NULL, '$2y$10$m0QMekxISvzlxxvPYxhD1.Yq5XgK6V3KDwwwC7Yb06PIM4ePSUKpO', NULL, NULL, '1991-11-10', 'Male', NULL, '১৯৯১৬১১১৩৭৭০০০০১৩', NULL, NULL, 1, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-657fd970d61ed.jpg', 31, 'Active', NULL, '2023-11-27 18:23:41', '2024-07-02 04:58:05'),
(29, 'NCT-034', '0008267609', 'HASANUL ISLAM', 'হাসানুল ইসলাম', 'Lecturer', 'প্রভাষক', 'Geography', 'ভূগোল ও পরিবেশ', NULL, '01718055556', NULL, 'painkillerhasan@gmail.com', NULL, '$2y$10$m0QMekxISvzlxxvPYxhD1.Yq5XgK6V3KDwwwC7Yb06PIM4ePSUKpO', NULL, NULL, '1982-12-02', 'Male', NULL, '১৯৮২১৫৯১০১৯৯০৫২৯৩', NULL, NULL, 1, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-65925e153045b.jpg', 32, 'Active', NULL, '2023-11-27 18:24:51', '2024-07-02 04:58:05'),
(30, 'NCT-035', '2022004028', 'HANIF KHAN', 'হানিফ খান', 'Lecturer', 'প্রভাষক', 'Management', 'ব্যবস্থাপনা', NULL, '01735773891', NULL, 'hanif91fnf@gmail.com', NULL, '$2y$10$m0QMekxISvzlxxvPYxhD1.Yq5XgK6V3KDwwwC7Yb06PIM4ePSUKpO', NULL, NULL, '1988-09-15', 'Male', NULL, '৬৮৭৬৪৩৯৬৬৯', NULL, NULL, 1, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-657fda1a6db94.jpg', 33, 'Active', NULL, '2023-11-27 18:25:33', '2024-07-02 04:58:05'),
(31, 'NCT-036', '2022004030', 'RABEYA SULTANA BITHEE', 'রাবিয়া সুলতানা বীথি', 'Lecturer', 'প্রভাষক', 'Political Science', 'রাষ্ট্রবিজ্ঞান', NULL, '01953414996', NULL, NULL, NULL, '$2y$10$m0QMekxISvzlxxvPYxhD1.Yq5XgK6V3KDwwwC7Yb06PIM4ePSUKpO', NULL, NULL, NULL, 'Female', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-65925eb46b84c.jpg', 34, 'Active', NULL, '2023-11-27 18:26:26', '2024-07-02 04:58:05'),
(34, 'NCD-39', '2022004031', 'NASRIN SULTANA', 'নাসরিন সুলতানা', 'Demonstrating', 'প্রদর্শক', 'Biology', 'জীববিজ্ঞান', NULL, '01684696996', NULL, 'nasrinsultananazu@gmail.com', NULL, '$2y$10$m0QMekxISvzlxxvPYxhD1.Yq5XgK6V3KDwwwC7Yb06PIM4ePSUKpO', NULL, NULL, '1965-04-20', 'Female', NULL, '৫৫৩০৪১১৯৭৩', NULL, NULL, 1, NULL, NULL, NULL, NULL, 35, 'Active', NULL, '2023-11-27 18:30:21', '2024-07-02 04:58:05'),
(35, 'NCT-004', '2022004048', 'MD. LUTFOR RAHMAN AKANDA', 'মোঃ লুৎফর রহমান আকন্দ', 'সহকারী অধ্যাপক', 'Assistant Professor', 'Mathematics', 'গণিত', NULL, '01711147452', NULL, 'prof.lutfor1967@gmail.com', NULL, '$2y$10$m0QMekxISvzlxxvPYxhD1.Yq5XgK6V3KDwwwC7Yb06PIM4ePSUKpO', NULL, NULL, NULL, 'Male', NULL, '৩৭৩০৫২৬৬৪১', NULL, NULL, 1, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-6592537885007.jpg', 2, 'Active', NULL, '2023-11-27 18:31:10', '2024-07-02 04:58:05'),
(36, 'NCT-040', '2022004045', 'MD. ABDUL KHALEQUE KHAN', 'মোহাম্মদ আব্দুল খালেক খান', 'Lecturer', NULL, 'Accounting', NULL, NULL, '01712934595', NULL, 'khalequekhan786@gmail.com', NULL, '$2y$10$m0QMekxISvzlxxvPYxhD1.Yq5XgK6V3KDwwwC7Yb06PIM4ePSUKpO', NULL, NULL, '1976-10-01', 'Male', NULL, '১৯৩৯৯৩৫৩৮১', 1, NULL, 1, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-658bdf764a717.jpg', 36, 'Active', NULL, '2023-11-27 18:32:00', '2024-07-02 04:58:05'),
(37, 'NCT-041', '2022004049', 'MAMUNUR RASHID', 'মামুনুর রশীদ', 'Lecturer', 'প্রভাষক', 'Marketing', 'মার্কেটিং', NULL, '01770272671', NULL, 'mmrashidnc@gmail.com', NULL, '$2y$10$m0QMekxISvzlxxvPYxhD1.Yq5XgK6V3KDwwwC7Yb06PIM4ePSUKpO', NULL, NULL, '1972-12-31', NULL, NULL, '১৯৭১৩৯১৫৮৩৫১৯২৪৩৫', NULL, NULL, 1, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-659249c9e81b2.jpg', 37, 'Active', NULL, '2023-11-27 18:32:49', '2024-07-02 04:58:05'),
(38, 'NCT-042', '2022004011', 'RUBIAT JAHAN NUR', 'রুবাইয়াৎ জাহান নূর', 'Lecturer', 'প্রভাষক', 'Social Work', 'সমাজকর্ম', NULL, '01926731979', NULL, 'rubiatjahannur35@gmail.com', NULL, '$2y$10$m0QMekxISvzlxxvPYxhD1.Yq5XgK6V3KDwwwC7Yb06PIM4ePSUKpO', NULL, NULL, '1985-10-29', 'Female', NULL, '৬৮৮১২৭৭১০৪', NULL, NULL, 1, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-659249f99f40b.jpg', 38, 'Active', NULL, '2023-11-27 18:33:35', '2024-07-02 04:58:05'),
(39, 'NCT-043', '0005290024', 'SOHANI LAYLA', 'সোহানী লায়লা', 'Lecturer', 'প্রভাষক', 'Social Work', 'সমাজকর্ম', NULL, '01922405624', NULL, 'sohanilayla@gmail.com', NULL, '$2y$10$m0QMekxISvzlxxvPYxhD1.Yq5XgK6V3KDwwwC7Yb06PIM4ePSUKpO', NULL, NULL, '1982-01-04', 'Female', NULL, '১৯৮২৬১২৫২০৫২৮৯৬১৩', NULL, NULL, 1, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-65924a7d9f288.jpg', 39, 'Active', NULL, '2023-11-27 18:34:35', '2024-07-02 04:58:05'),
(40, 'NCT-045', '2022004042', 'MAUDUD AHMED', 'মওদুদ আহমদ', 'Lecturer', 'প্রভাষক', 'Management', 'ব্যবস্থাপনা', NULL, '01717627787', NULL, 'mamnuc@gmail.com', NULL, '$2y$10$m0QMekxISvzlxxvPYxhD1.Yq5XgK6V3KDwwwC7Yb06PIM4ePSUKpO', NULL, NULL, '1980-02-01', 'Male', NULL, '৪৬১৫৯৮৫২২৫', NULL, NULL, 1, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-65924a9eae57b.jpg', 41, 'Active', NULL, '2023-11-27 18:35:27', '2024-07-02 04:58:05'),
(41, 'NCT-046', '2022004043', 'MASUM BILLAH', 'মোঃ মাসুম বিল্লাহ', 'Lecturer', 'প্রভাষক', 'Management', 'ব্যবস্থাপনা', NULL, '01723477151', NULL, 'masumbnuc@gmail.com', NULL, '$2y$10$m0QMekxISvzlxxvPYxhD1.Yq5XgK6V3KDwwwC7Yb06PIM4ePSUKpO', NULL, NULL, '1982-08-29', 'Male', NULL, '১৯৮২৬১১২৪৪০৫৫৬৯৫৯', NULL, NULL, 1, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-663865403038d.jpg', 42, 'Active', NULL, '2023-11-27 18:36:14', '2024-07-02 04:58:05'),
(42, 'NCT-047', '2022004041', 'HASINA JAHAN', 'হাসিনা জাহান', 'Lecturer', 'প্রভাষক', 'Bangla', 'বাংলা', NULL, '01727451651', NULL, 'jahanhasina1971@gmail.com', NULL, '$2y$10$m0QMekxISvzlxxvPYxhD1.Yq5XgK6V3KDwwwC7Yb06PIM4ePSUKpO', NULL, NULL, '1971-01-08', 'Female', NULL, '৪৬৩২১৪৮০৭০', NULL, NULL, 1, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-65924b129916d.jpg', 43, 'Active', NULL, '2023-11-27 18:37:07', '2024-07-02 04:58:05'),
(43, 'NCT-048', '2022004034', 'ALHAMRA PERVIN', 'আলহামরা পারভীন', 'Lecturer', 'প্রভাষক', 'Bangla', 'বাংলা', NULL, '01715625690', NULL, 'alhamrapervin14@gmail.com', NULL, '$2y$10$m0QMekxISvzlxxvPYxhD1.Yq5XgK6V3KDwwwC7Yb06PIM4ePSUKpO', NULL, NULL, '1979-01-13', 'Female', NULL, '১৯৩১১৬২৩৬৪', NULL, NULL, 1, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-65924b2f04396.jpg', 44, 'Active', NULL, '2023-11-27 18:38:02', '2024-07-02 04:58:05'),
(44, 'NCT-049', '2022004006', 'JUI TALUKDAR', 'জুঁই তালুকদার', 'Lecturer', 'প্রভাষক', 'Political Science', 'রাষ্ট্রবিজ্ঞান', NULL, '01681887756', NULL, 'jnuitalukdar@gmail.com', NULL, '$2y$10$m0QMekxISvzlxxvPYxhD1.Yq5XgK6V3KDwwwC7Yb06PIM4ePSUKpO', NULL, NULL, '1980-09-22', 'Female', NULL, '৯১৩০৯৬৫০৫৭', NULL, NULL, 1, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-65924b55357db.jpg', 45, 'Active', NULL, '2023-11-27 18:38:52', '2024-07-02 04:58:05'),
(45, 'NCT-044', '2022004040', 'MD. KAMRUL ISLAM', 'মোঃ কামরুল ইসলাম', 'Lecturer', 'প্রভাষক', 'Management', 'ব্যবস্থাপনা', NULL, '01726321214', NULL, 'mkislam196@gmail.com', NULL, '$2y$10$m0QMekxISvzlxxvPYxhD1.Yq5XgK6V3KDwwwC7Yb06PIM4ePSUKpO', NULL, NULL, '1976-12-16', 'Male', NULL, '১৯৭৬৬১২৫২০৭১৫৬২৪২', NULL, NULL, 1, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-65924bab166d1.jpg', 40, 'Active', NULL, '2023-11-27 18:39:33', '2024-07-02 04:58:05'),
(46, 'NCT-005', '2022004036', 'MD. MAHBUBUL ALAM', 'মোঃ মাহবুবুল আলম', 'Assistant Professor', 'সহকারী অধ্যাপক', 'Psychology', 'মনোবিজ্ঞান', NULL, '01712721326', NULL, 'mahbubulalam6944@gmail.com', NULL, '$2y$12$89MG.4YZ0SVYxP.v3Jcat.xxrjiP7N6ki1pm5f1hYHsviQW1nFsJm', NULL, NULL, NULL, 'Male', NULL, '১৯৭৯৬১১১৩৭৭৬৩৯০০৯', NULL, NULL, 1, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-65924bd79b73d.jpg', 3, 'Active', NULL, '2023-11-27 18:40:24', '2024-09-14 11:14:31'),
(47, 'NCT-050', '2022004007', 'ZANNAT SULTANA', 'জান্নাত সুলতানা', 'Lecturer', 'প্রভাষক', 'Political Science', 'রাষ্ট্রবিজ্ঞান', NULL, '01717364099', NULL, 'jannatsultanalecturer@gmail.com', NULL, '$2y$10$m0QMekxISvzlxxvPYxhD1.Yq5XgK6V3KDwwwC7Yb06PIM4ePSUKpO', NULL, NULL, '1983-11-01', 'Female', 'Married', '৭৩৩০২৫৫২৪৬', NULL, NULL, 1, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-65924c1d73208.jpg', 46, 'Active', NULL, '2023-11-27 18:41:22', '2024-07-02 04:58:05'),
(50, 'NCT-055', '2022004047', 'ISHRAT JAHAN', 'ইশরাত জাহান', 'Assistant Teacher', 'সহকারী শিক্ষক', 'Library and Information Science', 'গ্রস্থাগার ও তথ্য বিজ্ঞান', NULL, '01716006329', NULL, 'ishratjahansimu685@gmail.com', NULL, '$2y$10$m0QMekxISvzlxxvPYxhD1.Yq5XgK6V3KDwwwC7Yb06PIM4ePSUKpO', NULL, NULL, '1982-06-05', 'Female', NULL, '৬৮৮০২১৯৩১৩', NULL, NULL, 1, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-65924d5d2d472.jpg', 47, 'Active', NULL, '2023-11-27 18:44:41', '2024-07-02 04:58:05'),
(51, 'NCT-056', '2022004050', 'RUPON CHANDRA SARKER', 'রুপন চন্দ্র সরকার', 'Lecturer (Part Time)', 'প্রভাষক (খন্ডকালীন)', 'Mathematics', 'গণিত', NULL, '01735546654', '01735546654', 'ruponsarker1986@gmail.com', NULL, NULL, NULL, NULL, '1986-12-31', 'Male', 'Unmarried', '৫০৮১৬৯৩২৮৪', NULL, NULL, 1, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-6592533779095.jpg', 49, 'Active', NULL, '2023-11-27 18:45:49', '2024-11-13 06:41:13'),
(52, 'NCT-057', '2022004057', 'MD. TAIJUL ISLAM', 'মোঃ তাইজুল ইসলাম', 'Lecturer', 'প্রভাষক', 'Political Science', 'রাষ্ট্রবিজ্ঞান', NULL, '01719719732', NULL, 'taijulislam1989@gmail.com', NULL, '$2y$10$m0QMekxISvzlxxvPYxhD1.Yq5XgK6V3KDwwwC7Yb06PIM4ePSUKpO', NULL, NULL, '1979-12-13', 'Male', 'Married', '১৯৮৯৬১১২৪৬১৪৪৩৩৫৪', NULL, NULL, 1, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-659253fd33eeb.jpg', 50, 'Active', NULL, '2023-11-27 18:46:45', '2024-07-02 04:58:05'),
(53, 'NCT-058', '2022004058', 'MD. ASHRAFUL ALAM', 'আশরাফুল আলম', 'Lecturer (Part Time)', 'প্রভাষক (খন্ডকালীন)', 'Mathematics', 'গণিত', NULL, '01758627451', NULL, 'alamashraful140@gmail.com', NULL, '$2y$10$m0QMekxISvzlxxvPYxhD1.Yq5XgK6V3KDwwwC7Yb06PIM4ePSUKpO', NULL, NULL, '1992-03-03', 'Male', NULL, '১৯৯২৬১১৩১১৩০০০১৯৯', NULL, NULL, 1, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-65925481cb03e.jpg', 51, 'Active', NULL, '2023-11-27 18:47:47', '2024-07-02 04:58:06'),
(54, 'NCT-059', '0178015289', 'FATEMATUZZOHORA', 'ফাতিমাতুজজহুরা', 'Lecturer (Part Time)', 'প্রভাষক (খন্ডকালীন)', 'Psychology', 'মনোবিজ্ঞান', NULL, '01780152891', NULL, 'fatima.afa07@gmail.com', NULL, '$2y$10$m0QMekxISvzlxxvPYxhD1.Yq5XgK6V3KDwwwC7Yb06PIM4ePSUKpO', NULL, NULL, '1987-07-05', 'Female', NULL, '৮৬৬৬২৪১৪৬১', NULL, NULL, 1, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-65e59c3db0160.jpg', 52, 'Active', NULL, '2023-11-27 18:49:21', '2024-07-02 04:58:06'),
(55, 'NCT-006', '2022004096', 'MOHAMMAD JALAL UDDIN', 'মোহাম্মদ জালাল উদ্দিন', 'Assistant Professor', 'সহকারী অধ্যাপক', 'English', 'ইংরেজি', NULL, '01713067985', NULL, 'muhammadjalaluddin74@gmail.com', NULL, '$2y$10$m0QMekxISvzlxxvPYxhD1.Yq5XgK6V3KDwwwC7Yb06PIM4ePSUKpO', NULL, NULL, NULL, 'Male', NULL, '৭৩০৯১৫০৬৭৫', NULL, NULL, 1, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-659255287f0c8.jpg', 5, 'Active', NULL, '2023-11-27 18:50:15', '2024-07-02 04:58:06'),
(56, 'NCT-060', '2022004093', 'MD. IMAMUL HUDA', 'মোঃ ইমামুল হুদা', 'Lecturer (Part Time)', 'প্রভাষক (খন্ডকালীন)', 'English', 'ইংরেজি', NULL, '01680020977', NULL, 'imamulbdit@gmail.com', NULL, '$2y$10$m0QMekxISvzlxxvPYxhD1.Yq5XgK6V3KDwwwC7Yb06PIM4ePSUKpO', NULL, NULL, '1989-07-01', 'Male', NULL, '১৯৮৯৬১১৬৫৫১০৪৯৭২২', NULL, NULL, 1, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-65d738d9d0e9a.jpg', 53, 'Active', NULL, '2023-11-27 18:51:07', '2024-07-02 04:58:06'),
(57, 'NCT-007', '2022004016', 'MD. MUSARRAF HOSSAIN', 'মোঃ মোশাররফ হোসাইন', 'Assistant Professor', 'সহকারী অধ্যাপক', 'Islamic Studies', 'ইসলাম শিক্ষা', NULL, '01717315388', NULL, 'musarraf.mukul@gmail.com', NULL, '$2y$10$m0QMekxISvzlxxvPYxhD1.Yq5XgK6V3KDwwwC7Yb06PIM4ePSUKpO', NULL, NULL, NULL, 'Male', NULL, '১৯৭৫৬১১৯৪২৮৭৪৩৭৪৬', NULL, NULL, 1, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-6592556e227e8.jpg', 6, 'Active', NULL, '2023-11-27 18:52:19', '2024-07-02 04:58:06'),
(58, 'NCT-008', '2022004097', 'MD ABDUL KADIR', 'মোঃ আব্দুল কাদির', 'Assistant Professor', 'সহকারী অধ্যাপক', 'Information and Communication Technology', 'তথ্য ও যোগাযোগ প্রযুক্তি', NULL, '01914982104', NULL, 'kadirmd159@gmail.com', NULL, '$2y$10$m0QMekxISvzlxxvPYxhD1.Yq5XgK6V3KDwwwC7Yb06PIM4ePSUKpO', NULL, NULL, NULL, 'Male', NULL, '৭৩৩১০১৪৯২৩', NULL, NULL, 1, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-659255d9c427e.jpg', 7, 'Active', NULL, '2023-11-27 18:53:20', '2024-07-02 04:58:06'),
(59, 'NCT-009', '2022004010', 'A. T. M. SHAFIQUL ISLAM', 'এ.টি.এম. শফিকুল ইসলাম', 'Assistant Professor', 'সহকারী অধ্যাপক', 'Bangla', 'বাংলা', NULL, '01717786146', NULL, 'atmshafiq71@gmail.com', NULL, '$2y$10$m0QMekxISvzlxxvPYxhD1.Yq5XgK6V3KDwwwC7Yb06PIM4ePSUKpO', NULL, NULL, NULL, 'Male', NULL, '৫৯৮২৩০৪৩৬১', NULL, NULL, 1, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-6592564f0a9dc.jpg', 4, 'Active', NULL, '2023-11-27 18:54:15', '2024-07-02 04:58:06'),
(60, 'NCT-061', '2024020061', 'MD. SAKHAWAT HOSSAIN', 'মোঃ শাখাওয়াৎ হোসেন', 'LECTURER', 'প্রভাষক', 'Social Work', 'সমাজকর্ম', NULL, '01719217712', '01719217712', 'shssakhawat@gmail.com', 'shssakhawat@gmail.com', '$2y$10$m0QMekxISvzlxxvPYxhD1.Yq5XgK6V3KDwwwC7Yb06PIM4ePSUKpO', NULL, NULL, NULL, 'Male', NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-659257c52beee.jpg', 54, 'Active', NULL, '2023-12-10 08:42:24', '2024-07-07 05:36:04'),
(62, 'NCT-062', '0107202406', 'Mahfuza Khatun', 'মাহফুজা খাতুন', 'Lecturer', 'প্রভাষক', 'Bangla', 'বাংলা', NULL, '01742970619', '01742970619', 'mahfuzakhatun29@gmail.com', 'mahfuzakhatun29@gmail.com', NULL, 'Mahfuz Ali', 'Lutfun Nesa', '1984-03-15', 'Female', 'Married', '2831515966', 1, '2019-01-02', NULL, 62, 'Mymensingh Sadar', 'Mymensingh', 'uploads/teachers/images/teachers-668a4b686a4f2.jpg', 55, 'Active', NULL, '2024-07-07 05:39:03', '2024-10-23 04:54:06'),
(63, 'NCT-063', '1072024063', 'Mufassel Hosen Akanda (Bablu)', 'মোফাচ্ছেল হোসেন আকন্দ (বাবলু)', 'Lecturer', 'প্রভাষক', 'Accounting', 'হিসাববিজ্ঞান', NULL, '01610163333', '01717317325', 'babluakanda10@gmail.com', 'babluakanda10@gmail.com', NULL, 'Md. Abdul Jalil Akanda', 'Mrs. Saleha Akter', '1985-02-10', 'Male', 'Married', '6113194627883', 1, '2019-01-02', NULL, 62, 'Mymensingh Sadar', 'Mymensingh', 'uploads/teachers/images/teachers-668fa6d9dd43d.jpg', 56, 'Active', NULL, '2024-07-07 05:40:51', '2024-10-23 04:54:56'),
(64, 'NCT-064', '01072024064', 'শহীদুল ইসলাম', 'শহীদুল ইসলাম', NULL, 'প্রভাষক', 'Management', 'ব্যবস্থাপনা', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-02', NULL, NULL, NULL, NULL, NULL, 57, 'Deactive', NULL, '2024-07-07 05:42:52', '2024-10-14 07:24:28'),
(65, 'NCT-065', '01072024065', 'Anisuzzaman', 'আনিছুজ্জামান', 'Lecturer', 'প্রভাষক', 'Bangla', 'বাংলা', NULL, '01729692817', '01600098770', 'aniszefc@gmail.com', 'aniszefc@gmail.com', '$2y$10$m0QMekxISvzlxxvPYxhD1.Yq5XgK6V3KDwwwC7Yb06PIM4ePSUKpO', 'Islam Uddin', 'Suriya Akter', '1986-05-10', 'Male', 'Married', '2367744436', 1, '2019-01-02', NULL, 62, 'Tarakanda', 'Changnapara', 'uploads/teachers/images/teachers-668e06dd7eb64.jpg', 58, 'Active', NULL, '2024-07-07 05:43:56', '2024-07-10 04:16:32'),
(66, 'NCT-066', '01072024066', 'Md. Ataur Rahman', 'মোঃ আতাউর রহমান', 'Lecturer', 'প্রভাষক', 'Political Science', 'রাষ্ট্রবিজ্ঞান', NULL, '01911701675', NULL, 'mdataur01675@gmail.com', NULL, '$2y$10$m0QMekxISvzlxxvPYxhD1.Yq5XgK6V3KDwwwC7Yb06PIM4ePSUKpO', 'Md. Nowab Ali', 'Lutfa Begum', '1987-04-15', 'Male', 'Married', '4632094191', 1, '2019-01-02', NULL, 62, 'Mymensingh Sadar', 'Mymensingh', 'uploads/teachers/images/teachers-668a2f2458130.jpg', 59, 'Active', NULL, '2024-07-07 05:45:44', '2024-07-10 04:16:46'),
(67, 'NCT-067', '01072024067', 'Md. Rajon Parvez', 'মোঃ রাজন পারভেজ', 'Lecturer', 'প্রভাষক', 'Accounting', 'হিসাববিজ্ঞান', NULL, '01711165590', '01711165590', 'rajonamc@gmail.com', 'rajonamc@gmail.com', '$2y$10$m0QMekxISvzlxxvPYxhD1.Yq5XgK6V3KDwwwC7Yb06PIM4ePSUKpO', 'Md. Abdul Hamid Talukder', 'PARVIN AKTER', '1988-01-01', 'Male', 'Married', '7777730248', 1, '12019-02-01', NULL, 62, 'Mymensingh Sadar', 'Mymensingh', 'uploads/teachers/images/teachers-6694cbd0c6c31.jpg', 60, 'Active', NULL, '2024-07-07 05:47:38', '2024-07-15 07:12:16'),
(68, 'NCT-068', '01072024068', 'Mohammad Monir Mostofa', 'মোহাম্মদ মনির মোস্তফা', 'Lecturer', 'প্রভাষক', 'Accounting', 'হিসাববিজ্ঞান', NULL, '01712364776', '01688622864', 'mmostofa78@gmail.com', 'mmostofa78@gmail.com', '$2y$10$m0QMekxISvzlxxvPYxhD1.Yq5XgK6V3KDwwwC7Yb06PIM4ePSUKpO', 'Md. Abdus Shobhan', 'Mst. Monuwara', '1978-11-01', 'Male', 'Married', '1927207595', 1, '2019-01-02', NULL, 62, 'Mymensingh Sadar', 'Mymensingh', 'uploads/teachers/images/teachers-668a2efdd591b.jpg', 61, 'Active', NULL, '2024-07-07 05:48:56', '2024-07-10 04:17:27'),
(69, 'NCT-069', '01072024069', 'Md. Golam Rabbani', 'মোঃ গোলাম রাব্বানী', 'Lecturer', 'প্রভাষক', 'Management', 'ব্যবস্থাপনা', NULL, '01724735831', NULL, 'rabbanincm@gmail.com', 'rabbanincm@gmail.com', '$2y$10$m0QMekxISvzlxxvPYxhD1.Yq5XgK6V3KDwwwC7Yb06PIM4ePSUKpO', 'Late. Jamal Uddin', 'Mst. Rehana Begum', '1990-10-10', 'Male', 'Unmarried', '2815585159', 1, '2019-01-02', NULL, 62, 'Mymensingh Sadar', 'Mymensingh', 'uploads/teachers/images/teachers-668a2d45a9552.jpg', 62, 'Active', NULL, '2024-07-07 05:50:04', '2024-07-16 03:52:14'),
(70, 'NCT-054', '0005302073', 'Hafsa Akter', 'হাফছা আক্তার', 'Lecturer', 'প্রভাষক', 'Islamic History & Culture', 'ইসলামের ইতিহাস ও সংস্কৃতি', NULL, '01738939738', '01738939738', 'hafsaakterbdit@gmail.com', 'hafsaakterbdit@gmail.com', NULL, 'ABDUL MANNAN', 'RAHIMA BEGUM', '1989-11-26', 'Female', 'Married', '8205332904', 1, '2016-03-01', NULL, 62, 'Mymensingh Sadar', 'Mymensingh', 'uploads/teachers/images/teachers-66ea745a757a2.jpg', 59, 'Active', NULL, '2024-09-18 06:34:02', '2024-09-19 03:48:08'),
(71, 'NCT-071', '2022004004', 'Mufserun - Nahar', 'মোফছেরুন নাহার', 'Lecturer', 'প্রভাষক', 'ECONOMICS', 'অর্থনীতি', NULL, '01725403080', '01725403080', 'mufserun89@gmail.com', 'mufserun89@gmail.com', NULL, 'Md. Mozammel Hoque', 'Morium Hoque', '1989-01-01', 'Female', 'Married', '3730313347', 1, '2015-08-16', NULL, 62, 'Mymensingh Sadar', 'Mymensingh', 'uploads/teachers/images/teachers-66ea755815027.jpg', 58, 'Active', NULL, '2024-09-18 06:38:16', '2024-09-24 05:46:02'),
(72, 'NCT-052', '2022004003', 'Jannatul Naima', 'জান্নাতুল নাঈমা', 'Lecturer', 'প্রভাষক', 'ECONOMICS', 'অর্থনীতি', NULL, '01712422727', '01712422727', 'jannatulnaimaema@gmail.com', 'jannatulnaimaema@gmail.com', NULL, 'MD. KHALILUR RAHMAN', 'Rowson Ara', '1982-06-04', 'Female', 'Married', '1226305598511', 1, '2012-12-02', NULL, 62, 'Mymensingh Sadar', 'Mymensingh', 'uploads/teachers/images/teachers-66f26b84eacff.jpg', 52, 'Active', NULL, '2024-09-24 07:34:28', '2024-09-24 07:34:28');

-- --------------------------------------------------------

--
-- Table structure for table `teacher_attendances`
--

CREATE TABLE `teacher_attendances` (
  `id` bigint UNSIGNED NOT NULL,
  `teacher_id` bigint UNSIGNED DEFAULT NULL,
  `rfid` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date DEFAULT NULL,
  `intime` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `outtime` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attendance` enum('Present','Absent','Leave','Holiday') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Present',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teacher_attendances`
--

INSERT INTO `teacher_attendances` (`id`, `teacher_id`, `rfid`, `date`, `intime`, `outtime`, `attendance`, `created_at`, `updated_at`) VALUES
(1, 3, '2022004001', '2024-11-19', '09:44:06', '13:48:59', 'Present', '2024-11-19 16:41:18', '2024-11-19 16:41:18'),
(2, 7, '2022004018', '2024-11-19', '11:34:00', '11:34:02', 'Present', '2024-11-19 16:41:18', '2024-11-19 16:41:18'),
(3, 9, '2022004023', '2024-11-19', '11:20:47', '13:16:26', 'Present', '2024-11-19 16:41:18', '2024-11-19 16:41:18'),
(4, 10, '2022004024', '2024-11-19', '08:52:05', '13:11:27', 'Present', '2024-11-19 16:41:18', '2024-11-19 16:41:18'),
(5, 11, '0002385556', '2024-11-19', '09:39:50', '17:05:44', 'Present', '2024-11-19 16:41:18', '2024-11-19 16:41:18'),
(6, 12, '2022004013', '2024-11-19', '09:40:49', '15:06:25', 'Present', '2024-11-19 16:41:18', '2024-11-19 16:41:18'),
(7, 13, '2022004032', '2024-11-19', '09:31:50', '---', 'Present', '2024-11-19 16:41:18', '2024-11-19 18:06:52'),
(8, 14, '0005281987', '2024-11-19', '09:31:18', '17:05:03', 'Present', '2024-11-19 16:41:18', '2024-11-19 16:41:18'),
(9, 15, '2022004044', '2024-11-19', '09:44:10', '13:00:26', 'Present', '2024-11-19 16:41:18', '2024-11-19 16:41:18'),
(10, 17, '0005283986', '2024-11-19', '08:49:32', '14:24:24', 'Present', '2024-11-19 16:41:18', '2024-11-19 16:41:18'),
(11, 19, '0005289611', '2024-11-19', '09:36:38', '17:09:16', 'Present', '2024-11-19 16:41:18', '2024-11-19 16:41:18'),
(12, 20, '2022004014', '2024-11-19', '09:48:20', '17:12:27', 'Present', '2024-11-19 16:41:18', '2024-11-19 16:41:18'),
(13, 22, '2022004035', '2024-11-19', '10:34:09', '---', 'Present', '2024-11-19 16:41:18', '2024-11-19 18:06:54'),
(14, 26, '2022004019', '2024-11-19', '08:55:35', '14:24:28', 'Present', '2024-11-19 16:41:18', '2024-11-19 16:41:18'),
(15, 27, '2022004091', '2024-11-19', '09:51:35', '17:06:44', 'Present', '2024-11-19 16:41:18', '2024-11-19 16:41:18'),
(16, 28, '2022004025', '2024-11-19', '08:55:05', '15:58:30', 'Present', '2024-11-19 16:41:18', '2024-11-19 16:41:18'),
(17, 29, '0008267609', '2024-11-19', '08:43:11', '17:05:26', 'Present', '2024-11-19 16:41:18', '2024-11-19 16:41:18'),
(18, 30, '2022004028', '2024-11-19', '08:54:14', '17:10:57', 'Present', '2024-11-19 16:41:18', '2024-11-19 16:41:18'),
(19, 31, '2022004030', '2024-11-19', '09:45:17', '12:24:34', 'Present', '2024-11-19 16:41:18', '2024-11-19 16:41:18'),
(20, 34, '2022004031', '2024-11-19', '08:54:53', '---', 'Present', '2024-11-19 16:41:18', '2024-11-19 18:06:56'),
(21, 36, '2022004045', '2024-11-19', '10:15:02', '14:28:24', 'Present', '2024-11-19 16:41:18', '2024-11-19 16:41:18'),
(22, 37, '2022004049', '2024-11-19', '09:51:41', '14:35:54', 'Present', '2024-11-19 16:41:18', '2024-11-19 16:41:18'),
(23, 38, '2022004011', '2024-11-19', '09:36:21', '12:18:22', 'Present', '2024-11-19 16:41:18', '2024-11-19 16:41:18'),
(24, 39, '0005290024', '2024-11-19', '09:36:17', '17:08:32', 'Present', '2024-11-19 16:41:18', '2024-11-19 16:41:18'),
(25, 40, '2022004042', '2024-11-19', '10:13:06', '---', 'Present', '2024-11-19 16:41:18', '2024-11-19 18:06:57'),
(26, 41, '2022004043', '2024-11-19', '10:52:56', '17:05:19', 'Present', '2024-11-19 16:41:18', '2024-11-19 16:41:18'),
(27, 42, '2022004041', '2024-11-19', '08:45:13', '12:43:28', 'Present', '2024-11-19 16:41:18', '2024-11-19 16:41:18'),
(28, 43, '2022004034', '2024-11-19', '10:03:28', '17:26:33', 'Present', '2024-11-19 16:41:18', '2024-11-19 16:41:18'),
(29, 44, '2022004006', '2024-11-19', '10:01:46', '17:08:19', 'Present', '2024-11-19 16:41:18', '2024-11-19 16:41:18'),
(30, 45, '2022004040', '2024-11-19', '10:32:27', '---', 'Present', '2024-11-19 16:41:18', '2024-11-19 18:06:58'),
(31, 46, '2022004036', '2024-11-19', '13:49:08', '---', 'Present', '2024-11-19 16:41:18', '2024-11-19 18:06:58'),
(32, 50, '2022004047', '2024-11-19', '11:59:24', '---', 'Present', '2024-11-19 16:41:18', '2024-11-19 18:06:59'),
(33, 51, '2022004050', '2024-11-19', '09:32:05', '17:16:23', 'Present', '2024-11-19 16:41:18', '2024-11-19 16:41:18'),
(34, 52, '2022004057', '2024-11-19', '09:45:53', '---', 'Present', '2024-11-19 16:41:18', '2024-11-19 18:06:59'),
(35, 53, '2022004058', '2024-11-19', '09:00:29', '17:16:25', 'Present', '2024-11-19 16:41:18', '2024-11-19 16:41:18'),
(36, 54, '0178015289', '2024-11-19', '09:42:56', '17:08:23', 'Present', '2024-11-19 16:41:18', '2024-11-19 16:41:18'),
(37, 55, '2022004096', '2024-11-19', '11:28:02', '17:05:09', 'Present', '2024-11-19 16:41:18', '2024-11-19 16:41:18'),
(38, 56, '2022004093', '2024-11-19', '09:32:08', '17:11:56', 'Present', '2024-11-19 16:41:18', '2024-11-19 16:41:18'),
(39, 57, '2022004016', '2024-11-19', '09:33:25', '17:06:52', 'Present', '2024-11-19 16:41:18', '2024-11-19 16:41:18'),
(40, 58, '2022004097', '2024-11-19', '09:01:36', '14:25:48', 'Present', '2024-11-19 16:41:18', '2024-11-19 16:41:18'),
(41, 59, '2022004010', '2024-11-19', '09:54:41', '13:07:43', 'Present', '2024-11-19 16:41:18', '2024-11-19 16:41:18'),
(42, 60, '2024020061', '2024-11-19', '11:32:07', '11:32:12', 'Present', '2024-11-19 16:41:18', '2024-11-19 16:41:18'),
(43, 62, '0107202406', '2024-11-19', '09:46:14', '12:43:14', 'Present', '2024-11-19 16:41:18', '2024-11-19 16:41:18'),
(44, 63, '1072024063', '2024-11-19', '09:37:43', '---', 'Present', '2024-11-19 16:41:18', '2024-11-19 18:07:01'),
(45, 65, '01072024065', '2024-11-19', '10:15:30', '14:29:14', 'Present', '2024-11-19 16:41:18', '2024-11-19 16:41:18'),
(46, 67, '01072024067', '2024-11-19', '08:58:36', '15:10:33', 'Present', '2024-11-19 16:41:18', '2024-11-19 16:41:18'),
(47, 68, '01072024068', '2024-11-19', '09:16:10', '15:38:29', 'Present', '2024-11-19 16:41:18', '2024-11-19 16:41:18'),
(48, 70, '0005302073', '2024-11-19', '09:44:40', '15:06:37', 'Present', '2024-11-19 16:41:18', '2024-11-19 16:41:18'),
(49, 71, '2022004004', '2024-11-19', '10:09:39', '---', 'Present', '2024-11-19 16:41:18', '2024-11-19 18:07:02'),
(50, 72, '2022004003', '2024-11-19', '09:57:02', '15:06:34', 'Present', '2024-11-19 16:41:18', '2024-11-19 16:41:18'),
(51, 5, '2022004017', '2024-11-19', '', '---', 'Absent', '2024-11-19 16:42:14', '2024-11-19 18:06:51'),
(52, 6, '2022004039', '2024-11-19', '', '---', 'Absent', '2024-11-19 16:42:14', '2024-11-19 18:06:51'),
(53, 8, '005283432', '2024-11-19', '', '---', 'Absent', '2024-11-19 16:42:14', '2024-11-19 18:06:51'),
(54, 16, '2022004020', '2024-11-19', '', '---', 'Absent', '2024-11-19 16:42:14', '2024-11-19 18:06:53'),
(55, 18, '2022004021', '2024-11-19', '', '---', 'Absent', '2024-11-19 16:42:14', '2024-11-19 18:06:53'),
(56, 21, '2022004038', '2024-11-19', '', '---', 'Absent', '2024-11-19 16:42:14', '2024-11-19 18:06:54'),
(57, 23, '2022004037', '2024-11-19', '', '---', 'Absent', '2024-11-19 16:42:14', '2024-11-19 18:06:54'),
(58, 25, '2022004002', '2024-11-19', '', '---', 'Absent', '2024-11-19 16:42:14', '2024-11-19 18:06:54'),
(59, 35, '2022004048', '2024-11-19', '', '---', 'Absent', '2024-11-19 16:42:14', '2024-11-19 18:06:56'),
(60, 47, '2022004007', '2024-11-19', '', '---', 'Absent', '2024-11-19 16:42:14', '2024-11-19 18:06:58'),
(61, 66, '01072024066', '2024-11-19', '', '---', 'Absent', '2024-11-19 16:42:14', '2024-11-19 18:07:01'),
(62, 69, '01072024069', '2024-11-19', '', '---', 'Absent', '2024-11-19 16:42:14', '2024-11-19 18:07:02'),
(63, 4, '2022004001', '2024-11-03', '10:07:51', '17:11:44', 'Present', '2024-11-19 18:06:51', '2024-11-19 18:06:51'),
(64, 4, '2022004001', '2024-11-04', '10:17:30', '17:05:19', 'Present', '2024-11-19 18:06:51', '2024-11-19 18:06:51'),
(65, 4, '2022004001', '2024-11-05', '09:24:55', '---', 'Present', '2024-11-19 18:06:51', '2024-11-19 18:06:51'),
(66, 4, '2022004001', '2024-11-06', '09:01:51', '13:44:18', 'Present', '2024-11-19 18:06:51', '2024-11-19 18:06:51'),
(67, 4, '2022004001', '2024-11-07', '10:32:12', '17:06:27', 'Present', '2024-11-19 18:06:51', '2024-11-19 18:06:51'),
(68, 4, '2022004001', '2024-11-10', '10:13:29', '13:05:02', 'Present', '2024-11-19 18:06:51', '2024-11-19 18:06:51'),
(69, 4, '2022004001', '2024-11-11', '09:56:50', '13:16:05', 'Present', '2024-11-19 18:06:51', '2024-11-19 18:06:51'),
(70, 4, '2022004001', '2024-11-12', '08:54:29', '12:53:16', 'Present', '2024-11-19 18:06:51', '2024-11-19 18:06:51'),
(71, 4, '2022004001', '2024-11-13', '08:45:12', '12:57:52', 'Present', '2024-11-19 18:06:51', '2024-11-19 18:06:51'),
(72, 4, '2022004001', '2024-11-14', '13:14:47', '---', 'Present', '2024-11-19 18:06:51', '2024-11-19 18:06:51'),
(73, 4, '2022004001', '2024-11-17', '09:54:58', '---', 'Present', '2024-11-19 18:06:51', '2024-11-19 18:06:51'),
(74, 5, '2022004017', '2024-11-03', '08:58:10', '17:11:13', 'Present', '2024-11-19 18:06:51', '2024-11-19 18:06:51'),
(75, 5, '2022004017', '2024-11-04', '09:34:32', '17:14:51', 'Present', '2024-11-19 18:06:51', '2024-11-19 18:06:51'),
(76, 5, '2022004017', '2024-11-05', '09:29:59', '17:03:21', 'Present', '2024-11-19 18:06:51', '2024-11-19 18:06:51'),
(77, 5, '2022004017', '2024-11-06', '09:35:40', '---', 'Present', '2024-11-19 18:06:51', '2024-11-19 18:06:51'),
(78, 5, '2022004017', '2024-11-07', '09:36:33', '---', 'Present', '2024-11-19 18:06:51', '2024-11-19 18:06:51'),
(79, 5, '2022004017', '2024-11-10', '08:59:24', '14:00:25', 'Present', '2024-11-19 18:06:51', '2024-11-19 18:06:51'),
(80, 5, '2022004017', '2024-11-11', '09:39:16', '14:03:39', 'Present', '2024-11-19 18:06:51', '2024-11-19 18:06:51'),
(81, 5, '2022004017', '2024-11-12', '09:45:17', '13:22:16', 'Present', '2024-11-19 18:06:51', '2024-11-19 18:06:51'),
(82, 5, '2022004017', '2024-11-13', '09:40:29', '14:01:51', 'Present', '2024-11-19 18:06:51', '2024-11-19 18:06:51'),
(83, 5, '2022004017', '2024-11-14', '09:25:31', '14:04:10', 'Present', '2024-11-19 18:06:51', '2024-11-19 18:06:51'),
(84, 5, '2022004017', '2024-11-17', '09:38:01', '14:02:56', 'Present', '2024-11-19 18:06:51', '2024-11-19 18:06:51'),
(85, 5, '2022004017', '2024-11-18', '09:37:41', '---', 'Present', '2024-11-19 18:06:51', '2024-11-19 18:06:51'),
(86, 6, '2022004039', '2024-11-04', '10:45:44', '---', 'Present', '2024-11-19 18:06:51', '2024-11-19 18:06:51'),
(87, 6, '2022004039', '2024-11-05', '10:36:54', '---', 'Present', '2024-11-19 18:06:51', '2024-11-19 18:06:51'),
(88, 6, '2022004039', '2024-11-06', '18:22:03', '---', 'Present', '2024-11-19 18:06:51', '2024-11-19 18:06:51'),
(89, 6, '2022004039', '2024-11-10', '17:19:00', '17:19:03', 'Present', '2024-11-19 18:06:51', '2024-11-19 18:06:51'),
(90, 6, '2022004039', '2024-11-11', '10:31:46', '---', 'Present', '2024-11-19 18:06:51', '2024-11-19 18:06:51'),
(91, 7, '2022004018', '2024-11-03', '11:52:23', '17:16:17', 'Present', '2024-11-19 18:06:51', '2024-11-19 18:06:51'),
(92, 7, '2022004018', '2024-11-04', '14:39:41', '---', 'Present', '2024-11-19 18:06:51', '2024-11-19 18:06:51'),
(93, 7, '2022004018', '2024-11-05', '11:14:13', '17:01:58', 'Present', '2024-11-19 18:06:51', '2024-11-19 18:06:51'),
(94, 7, '2022004018', '2024-11-06', '11:47:35', '17:13:17', 'Present', '2024-11-19 18:06:51', '2024-11-19 18:06:51'),
(95, 7, '2022004018', '2024-11-07', '11:49:05', '17:06:46', 'Present', '2024-11-19 18:06:51', '2024-11-19 18:06:51'),
(96, 7, '2022004018', '2024-11-10', '11:26:37', '14:57:50', 'Present', '2024-11-19 18:06:51', '2024-11-19 18:06:51'),
(97, 7, '2022004018', '2024-11-11', '10:36:26', '17:08:20', 'Present', '2024-11-19 18:06:51', '2024-11-19 18:06:51'),
(98, 7, '2022004018', '2024-11-12', '11:31:00', '13:44:10', 'Present', '2024-11-19 18:06:51', '2024-11-19 18:06:51'),
(99, 7, '2022004018', '2024-11-13', '11:38:41', '---', 'Present', '2024-11-19 18:06:51', '2024-11-19 18:06:51'),
(100, 7, '2022004018', '2024-11-14', '11:43:33', '13:42:12', 'Present', '2024-11-19 18:06:51', '2024-11-19 18:06:51'),
(101, 7, '2022004018', '2024-11-17', '11:44:09', '17:12:45', 'Present', '2024-11-19 18:06:51', '2024-11-19 18:06:51'),
(102, 7, '2022004018', '2024-11-18', '10:46:46', '14:42:11', 'Present', '2024-11-19 18:06:51', '2024-11-19 18:06:51'),
(103, 8, '005283432', '2024-11-03', '09:44:54', '12:52:11', 'Present', '2024-11-19 18:06:51', '2024-11-19 18:06:51'),
(104, 8, '005283432', '2024-11-04', '09:40:24', '13:45:49', 'Present', '2024-11-19 18:06:51', '2024-11-19 18:06:51'),
(105, 8, '005283432', '2024-11-05', '09:17:55', '---', 'Present', '2024-11-19 18:06:51', '2024-11-19 18:06:51'),
(106, 8, '005283432', '2024-11-06', '09:40:29', '14:04:03', 'Present', '2024-11-19 18:06:51', '2024-11-19 18:06:51'),
(107, 8, '005283432', '2024-11-07', '09:53:55', '---', 'Present', '2024-11-19 18:06:51', '2024-11-19 18:06:51'),
(108, 8, '005283432', '2024-11-10', '08:50:15', '13:17:31', 'Present', '2024-11-19 18:06:51', '2024-11-19 18:06:51'),
(109, 8, '005283432', '2024-11-11', '09:49:41', '12:54:50', 'Present', '2024-11-19 18:06:51', '2024-11-19 18:06:51'),
(110, 8, '005283432', '2024-11-12', '08:47:43', '14:50:05', 'Present', '2024-11-19 18:06:51', '2024-11-19 18:06:51'),
(111, 8, '005283432', '2024-11-13', '09:43:32', '14:31:05', 'Present', '2024-11-19 18:06:51', '2024-11-19 18:06:51'),
(112, 8, '005283432', '2024-11-14', '09:50:48', '14:03:59', 'Present', '2024-11-19 18:06:51', '2024-11-19 18:06:51'),
(113, 9, '2022004023', '2024-11-03', '08:42:45', '---', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(114, 9, '2022004023', '2024-11-04', '12:58:45', '---', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(115, 9, '2022004023', '2024-11-05', '16:50:46', '---', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(116, 9, '2022004023', '2024-11-06', '08:53:02', '13:07:28', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(117, 9, '2022004023', '2024-11-07', '10:14:11', '---', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(118, 9, '2022004023', '2024-11-10', '10:07:37', '12:39:18', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(119, 9, '2022004023', '2024-11-11', '12:37:33', '---', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(120, 9, '2022004023', '2024-11-12', '08:51:53', '12:22:16', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(121, 9, '2022004023', '2024-11-13', '08:51:44', '14:00:49', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(122, 9, '2022004023', '2024-11-14', '10:56:03', '14:01:42', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(123, 9, '2022004023', '2024-11-17', '10:10:19', '12:42:21', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(124, 9, '2022004023', '2024-11-18', '10:49:41', '14:22:20', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(125, 10, '2022004024', '2024-11-04', '17:10:12', '---', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(126, 10, '2022004024', '2024-11-05', '09:01:38', '17:01:52', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(127, 10, '2022004024', '2024-11-06', '17:13:09', '---', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(128, 10, '2022004024', '2024-11-07', '08:53:07', '13:19:01', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(129, 10, '2022004024', '2024-11-10', '17:04:57', '---', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(130, 10, '2022004024', '2024-11-11', '17:08:16', '---', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(131, 10, '2022004024', '2024-11-12', '08:51:58', '13:44:02', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(132, 10, '2022004024', '2024-11-13', '17:03:41', '---', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(133, 10, '2022004024', '2024-11-14', '08:51:17', '12:38:16', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(134, 10, '2022004024', '2024-11-18', '14:22:11', '---', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(135, 11, '0002385556', '2024-11-03', '11:31:47', '17:15:20', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(136, 11, '0002385556', '2024-11-04', '11:17:20', '17:10:26', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(137, 11, '0002385556', '2024-11-05', '08:54:06', '16:51:08', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(138, 11, '0002385556', '2024-11-06', '11:21:40', '14:04:14', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(139, 11, '0002385556', '2024-11-07', '10:12:10', '17:04:55', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(140, 11, '0002385556', '2024-11-10', '11:21:44', '13:17:41', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(141, 11, '0002385556', '2024-11-11', '11:41:51', '17:08:32', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(142, 11, '0002385556', '2024-11-12', '08:58:33', '13:31:48', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(143, 11, '0002385556', '2024-11-13', '10:24:21', '14:21:54', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(144, 11, '0002385556', '2024-11-14', '10:57:58', '14:04:27', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(145, 11, '0002385556', '2024-11-17', '10:02:33', '13:36:25', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(146, 11, '0002385556', '2024-11-18', '12:27:04', '14:29:19', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(147, 12, '2022004013', '2024-11-03', '09:54:31', '12:52:15', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(148, 12, '2022004013', '2024-11-04', '10:37:17', '17:10:09', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(149, 12, '2022004013', '2024-11-05', '09:50:33', '---', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(150, 12, '2022004013', '2024-11-06', '09:57:42', '17:09:01', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(151, 12, '2022004013', '2024-11-07', '10:08:07', '13:46:51', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(152, 12, '2022004013', '2024-11-10', '08:54:51', '14:48:42', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(153, 12, '2022004013', '2024-11-11', '09:38:04', '---', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(154, 12, '2022004013', '2024-11-12', '09:44:11', '14:57:48', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(155, 12, '2022004013', '2024-11-13', '09:46:45', '14:01:03', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(156, 12, '2022004013', '2024-11-14', '10:03:34', '14:01:33', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(157, 12, '2022004013', '2024-11-17', '09:40:47', '14:55:16', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(158, 12, '2022004013', '2024-11-18', '09:54:18', '---', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(159, 13, '2022004032', '2024-11-03', '08:59:54', '17:16:05', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(160, 13, '2022004032', '2024-11-04', '10:59:21', '13:02:01', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(161, 13, '2022004032', '2024-11-05', '09:03:02', '16:51:30', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(162, 13, '2022004032', '2024-11-06', '14:54:06', '---', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(163, 13, '2022004032', '2024-11-07', '17:06:39', '---', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(164, 13, '2022004032', '2024-11-10', '08:54:07', '17:04:48', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(165, 13, '2022004032', '2024-11-11', '09:10:09', '13:04:08', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(166, 13, '2022004032', '2024-11-12', '09:13:12', '13:00:20', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(167, 13, '2022004032', '2024-11-13', '17:03:43', '---', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(168, 13, '2022004032', '2024-11-14', '08:45:50', '13:13:27', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(169, 13, '2022004032', '2024-11-17', '08:49:02', '13:12:06', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(170, 13, '2022004032', '2024-11-18', '11:53:16', '14:22:14', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(171, 14, '0005281987', '2024-11-03', '09:59:36', '12:04:07', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(172, 14, '0005281987', '2024-11-04', '11:28:47', '---', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(173, 14, '0005281987', '2024-11-05', '09:55:59', '16:50:18', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(174, 14, '0005281987', '2024-11-06', '11:54:43', '17:09:19', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(175, 14, '0005281987', '2024-11-07', '10:55:19', '17:06:14', 'Present', '2024-11-19 18:06:52', '2024-11-19 18:06:52'),
(176, 14, '0005281987', '2024-11-10', '09:29:39', '13:05:08', 'Present', '2024-11-19 18:06:53', '2024-11-19 18:06:53'),
(177, 14, '0005281987', '2024-11-11', '09:42:46', '17:07:41', 'Present', '2024-11-19 18:06:53', '2024-11-19 18:06:53'),
(178, 14, '0005281987', '2024-11-12', '12:52:54', '---', 'Present', '2024-11-19 18:06:53', '2024-11-19 18:06:53'),
(179, 14, '0005281987', '2024-11-13', '09:29:21', '13:34:31', 'Present', '2024-11-19 18:06:53', '2024-11-19 18:06:53'),
(180, 14, '0005281987', '2024-11-14', '09:37:43', '13:15:20', 'Present', '2024-11-19 18:06:53', '2024-11-19 18:06:53'),
(181, 14, '0005281987', '2024-11-17', '09:37:54', '17:05:27', 'Present', '2024-11-19 18:06:53', '2024-11-19 18:06:53'),
(182, 14, '0005281987', '2024-11-18', '09:30:39', '14:21:27', 'Present', '2024-11-19 18:06:53', '2024-11-19 18:06:53'),
(183, 15, '2022004044', '2024-11-03', '11:21:06', '17:06:05', 'Present', '2024-11-19 18:06:53', '2024-11-19 18:06:53'),
(184, 15, '2022004044', '2024-11-10', '09:43:43', '14:16:49', 'Present', '2024-11-19 18:06:53', '2024-11-19 18:06:53'),
(185, 15, '2022004044', '2024-11-11', '09:37:12', '12:58:47', 'Present', '2024-11-19 18:06:53', '2024-11-19 18:06:53'),
(186, 15, '2022004044', '2024-11-12', '10:03:19', '---', 'Present', '2024-11-19 18:06:53', '2024-11-19 18:06:53'),
(187, 15, '2022004044', '2024-11-13', '08:51:09', '12:57:57', 'Present', '2024-11-19 18:06:53', '2024-11-19 18:06:53'),
(188, 15, '2022004044', '2024-11-14', '08:51:34', '12:57:25', 'Present', '2024-11-19 18:06:53', '2024-11-19 18:06:53'),
(189, 15, '2022004044', '2024-11-17', '09:37:34', '13:26:50', 'Present', '2024-11-19 18:06:53', '2024-11-19 18:06:53'),
(190, 15, '2022004044', '2024-11-18', '09:39:01', '14:23:42', 'Present', '2024-11-19 18:06:53', '2024-11-19 18:06:53'),
(191, 16, '2022004020', '2024-11-03', '09:13:23', '---', 'Present', '2024-11-19 18:06:53', '2024-11-19 18:06:53'),
(192, 16, '2022004020', '2024-11-04', '09:35:30', '17:15:19', 'Present', '2024-11-19 18:06:53', '2024-11-19 18:06:53'),
(193, 16, '2022004020', '2024-11-05', '12:29:35', '---', 'Present', '2024-11-19 18:06:53', '2024-11-19 18:06:53'),
(194, 16, '2022004020', '2024-11-06', '11:29:48', '14:41:54', 'Present', '2024-11-19 18:06:53', '2024-11-19 18:06:53'),
(195, 16, '2022004020', '2024-11-10', '09:10:36', '14:42:40', 'Present', '2024-11-19 18:06:53', '2024-11-19 18:06:53'),
(196, 16, '2022004020', '2024-11-11', '09:13:07', '---', 'Present', '2024-11-19 18:06:53', '2024-11-19 18:06:53'),
(197, 16, '2022004020', '2024-11-13', '12:52:15', '---', 'Present', '2024-11-19 18:06:53', '2024-11-19 18:06:53'),
(198, 16, '2022004020', '2024-11-14', '13:28:20', '14:02:31', 'Present', '2024-11-19 18:06:53', '2024-11-19 18:06:53'),
(199, 17, '0005283986', '2024-11-03', '08:49:16', '17:16:40', 'Present', '2024-11-19 18:06:53', '2024-11-19 18:06:53'),
(200, 17, '0005283986', '2024-11-04', '08:56:49', '---', 'Present', '2024-11-19 18:06:53', '2024-11-19 18:06:53'),
(201, 17, '0005283986', '2024-11-05', '08:46:50', '16:51:55', 'Present', '2024-11-19 18:06:53', '2024-11-19 18:06:53'),
(202, 17, '0005283986', '2024-11-06', '10:14:27', '17:13:41', 'Present', '2024-11-19 18:06:53', '2024-11-19 18:06:53'),
(203, 17, '0005283986', '2024-11-07', '09:34:00', '---', 'Present', '2024-11-19 18:06:53', '2024-11-19 18:06:53'),
(204, 17, '0005283986', '2024-11-10', '08:53:21', '14:57:54', 'Present', '2024-11-19 18:06:53', '2024-11-19 18:06:53'),
(205, 17, '0005283986', '2024-11-11', '09:00:53', '14:09:48', 'Present', '2024-11-19 18:06:53', '2024-11-19 18:06:53'),
(206, 17, '0005283986', '2024-11-12', '08:49:06', '---', 'Present', '2024-11-19 18:06:53', '2024-11-19 18:06:53'),
(207, 17, '0005283986', '2024-11-14', '08:39:48', '12:18:36', 'Present', '2024-11-19 18:06:53', '2024-11-19 18:06:53'),
(208, 17, '0005283986', '2024-11-17', '08:47:00', '15:12:05', 'Present', '2024-11-19 18:06:53', '2024-11-19 18:06:53'),
(209, 17, '0005283986', '2024-11-18', '08:41:59', '14:42:14', 'Present', '2024-11-19 18:06:53', '2024-11-19 18:06:53'),
(210, 18, '2022004021', '2024-11-03', '11:08:55', '---', 'Present', '2024-11-19 18:06:53', '2024-11-19 18:06:53'),
(211, 18, '2022004021', '2024-11-04', '11:07:28', '12:40:36', 'Present', '2024-11-19 18:06:53', '2024-11-19 18:06:53'),
(212, 18, '2022004021', '2024-11-05', '08:52:03', '17:03:18', 'Present', '2024-11-19 18:06:53', '2024-11-19 18:06:53'),
(213, 18, '2022004021', '2024-11-06', '11:35:55', '13:33:33', 'Present', '2024-11-19 18:06:53', '2024-11-19 18:06:53'),
(214, 18, '2022004021', '2024-11-07', '11:41:43', '12:20:10', 'Present', '2024-11-19 18:06:53', '2024-11-19 18:06:53'),
(215, 18, '2022004021', '2024-11-10', '09:56:44', '14:46:05', 'Present', '2024-11-19 18:06:53', '2024-11-19 18:06:53'),
(216, 18, '2022004021', '2024-11-11', '09:56:15', '---', 'Present', '2024-11-19 18:06:53', '2024-11-19 18:06:53'),
(217, 18, '2022004021', '2024-11-13', '09:51:55', '14:22:14', 'Present', '2024-11-19 18:06:53', '2024-11-19 18:06:53'),
(218, 18, '2022004021', '2024-11-14', '09:48:05', '13:14:21', 'Present', '2024-11-19 18:06:53', '2024-11-19 18:06:53'),
(219, 18, '2022004021', '2024-11-17', '09:58:28', '13:30:45', 'Present', '2024-11-19 18:06:53', '2024-11-19 18:06:53'),
(220, 18, '2022004021', '2024-11-18', '10:01:39', '14:27:02', 'Present', '2024-11-19 18:06:53', '2024-11-19 18:06:53'),
(221, 19, '0005289611', '2024-11-03', '10:46:45', '13:00:00', 'Present', '2024-11-19 18:06:53', '2024-11-19 18:06:53'),
(222, 19, '0005289611', '2024-11-04', '10:49:47', '17:15:40', 'Present', '2024-11-19 18:06:53', '2024-11-19 18:06:53'),
(223, 19, '0005289611', '2024-11-05', '09:32:45', '16:50:41', 'Present', '2024-11-19 18:06:53', '2024-11-19 18:06:53'),
(224, 19, '0005289611', '2024-11-06', '10:39:43', '17:13:06', 'Present', '2024-11-19 18:06:53', '2024-11-19 18:06:53'),
(225, 19, '0005289611', '2024-11-07', '08:56:46', '12:39:36', 'Present', '2024-11-19 18:06:53', '2024-11-19 18:06:53'),
(226, 19, '0005289611', '2024-11-10', '09:36:15', '13:21:30', 'Present', '2024-11-19 18:06:53', '2024-11-19 18:06:53'),
(227, 19, '0005289611', '2024-11-11', '09:37:34', '12:58:28', 'Present', '2024-11-19 18:06:53', '2024-11-19 18:06:53'),
(228, 19, '0005289611', '2024-11-12', '09:35:20', '13:44:43', 'Present', '2024-11-19 18:06:53', '2024-11-19 18:06:53'),
(229, 19, '0005289611', '2024-11-13', '09:51:47', '14:37:27', 'Present', '2024-11-19 18:06:53', '2024-11-19 18:06:53'),
(230, 19, '0005289611', '2024-11-14', '09:51:21', '13:34:08', 'Present', '2024-11-19 18:06:53', '2024-11-19 18:06:53'),
(231, 19, '0005289611', '2024-11-17', '09:49:30', '13:28:10', 'Present', '2024-11-19 18:06:53', '2024-11-19 18:06:53'),
(232, 19, '0005289611', '2024-11-18', '09:48:14', '13:40:40', 'Present', '2024-11-19 18:06:53', '2024-11-19 18:06:53'),
(233, 20, '2022004014', '2024-11-03', '10:33:12', '---', 'Present', '2024-11-19 18:06:54', '2024-11-19 18:06:54'),
(234, 20, '2022004014', '2024-11-04', '10:43:57', '---', 'Present', '2024-11-19 18:06:54', '2024-11-19 18:06:54'),
(235, 20, '2022004014', '2024-11-05', '10:20:23', '---', 'Present', '2024-11-19 18:06:54', '2024-11-19 18:06:54'),
(236, 20, '2022004014', '2024-11-06', '09:42:26', '17:09:26', 'Present', '2024-11-19 18:06:54', '2024-11-19 18:06:54'),
(237, 20, '2022004014', '2024-11-07', '17:07:09', '---', 'Present', '2024-11-19 18:06:54', '2024-11-19 18:06:54'),
(238, 20, '2022004014', '2024-11-10', '09:52:38', '---', 'Present', '2024-11-19 18:06:54', '2024-11-19 18:06:54'),
(239, 20, '2022004014', '2024-11-11', '09:58:38', '14:04:02', 'Present', '2024-11-19 18:06:54', '2024-11-19 18:06:54'),
(240, 20, '2022004014', '2024-11-12', '10:05:44', '14:53:20', 'Present', '2024-11-19 18:06:54', '2024-11-19 18:06:54'),
(241, 20, '2022004014', '2024-11-13', '09:44:30', '14:02:01', 'Present', '2024-11-19 18:06:54', '2024-11-19 18:06:54'),
(242, 20, '2022004014', '2024-11-14', '10:02:29', '14:02:17', 'Present', '2024-11-19 18:06:54', '2024-11-19 18:06:54'),
(243, 20, '2022004014', '2024-11-17', '09:56:07', '14:05:23', 'Present', '2024-11-19 18:06:54', '2024-11-19 18:06:54'),
(244, 20, '2022004014', '2024-11-18', '14:16:14', '---', 'Present', '2024-11-19 18:06:54', '2024-11-19 18:06:54'),
(245, 21, '2022004038', '2024-11-03', '08:49:20', '17:06:10', 'Present', '2024-11-19 18:06:54', '2024-11-19 18:06:54'),
(246, 21, '2022004038', '2024-11-10', '12:49:36', '---', 'Present', '2024-11-19 18:06:54', '2024-11-19 18:06:54'),
(247, 21, '2022004038', '2024-11-13', '14:02:12', '---', 'Present', '2024-11-19 18:06:54', '2024-11-19 18:06:54'),
(248, 21, '2022004038', '2024-11-14', '14:02:26', '---', 'Present', '2024-11-19 18:06:54', '2024-11-19 18:06:54'),
(249, 22, '2022004035', '2024-11-03', '09:44:13', '---', 'Present', '2024-11-19 18:06:54', '2024-11-19 18:06:54'),
(250, 22, '2022004035', '2024-11-04', '10:08:04', '---', 'Present', '2024-11-19 18:06:54', '2024-11-19 18:06:54'),
(251, 22, '2022004035', '2024-11-05', '10:33:26', '16:50:56', 'Present', '2024-11-19 18:06:54', '2024-11-19 18:06:54'),
(252, 22, '2022004035', '2024-11-06', '10:22:54', '18:22:00', 'Present', '2024-11-19 18:06:54', '2024-11-19 18:06:54'),
(253, 22, '2022004035', '2024-11-07', '10:39:18', '17:29:47', 'Present', '2024-11-19 18:06:54', '2024-11-19 18:06:54'),
(254, 22, '2022004035', '2024-11-10', '08:59:20', '---', 'Present', '2024-11-19 18:06:54', '2024-11-19 18:06:54'),
(255, 22, '2022004035', '2024-11-11', '10:14:22', '---', 'Present', '2024-11-19 18:06:54', '2024-11-19 18:06:54'),
(256, 22, '2022004035', '2024-11-13', '10:23:15', '16:27:30', 'Present', '2024-11-19 18:06:54', '2024-11-19 18:06:54'),
(257, 22, '2022004035', '2024-11-17', '09:47:08', '---', 'Present', '2024-11-19 18:06:54', '2024-11-19 18:06:54'),
(258, 22, '2022004035', '2024-11-18', '10:39:10', '---', 'Present', '2024-11-19 18:06:54', '2024-11-19 18:06:54'),
(259, 23, '2022004037', '2024-11-03', '08:52:37', '---', 'Present', '2024-11-19 18:06:54', '2024-11-19 18:06:54'),
(260, 23, '2022004037', '2024-11-04', '11:02:06', '---', 'Present', '2024-11-19 18:06:54', '2024-11-19 18:06:54'),
(261, 23, '2022004037', '2024-11-05', '11:38:47', '16:50:53', 'Present', '2024-11-19 18:06:54', '2024-11-19 18:06:54'),
(262, 23, '2022004037', '2024-11-06', '10:59:14', '---', 'Present', '2024-11-19 18:06:54', '2024-11-19 18:06:54'),
(263, 23, '2022004037', '2024-11-07', '10:27:25', '17:29:50', 'Present', '2024-11-19 18:06:54', '2024-11-19 18:06:54'),
(264, 23, '2022004037', '2024-11-10', '09:50:26', '14:56:35', 'Present', '2024-11-19 18:06:54', '2024-11-19 18:06:54'),
(265, 23, '2022004037', '2024-11-11', '09:47:35', '---', 'Present', '2024-11-19 18:06:54', '2024-11-19 18:06:54'),
(266, 23, '2022004037', '2024-11-12', '09:55:14', '---', 'Present', '2024-11-19 18:06:54', '2024-11-19 18:06:54'),
(267, 23, '2022004037', '2024-11-13', '09:55:42', '14:36:37', 'Present', '2024-11-19 18:06:54', '2024-11-19 18:06:54'),
(268, 23, '2022004037', '2024-11-14', '10:23:47', '10:23:50', 'Present', '2024-11-19 18:06:54', '2024-11-19 18:06:54'),
(269, 23, '2022004037', '2024-11-17', '09:56:31', '---', 'Present', '2024-11-19 18:06:54', '2024-11-19 18:06:54'),
(270, 23, '2022004037', '2024-11-18', '09:36:38', '---', 'Present', '2024-11-19 18:06:54', '2024-11-19 18:06:54'),
(271, 25, '2022004002', '2024-11-04', '10:37:07', '---', 'Present', '2024-11-19 18:06:54', '2024-11-19 18:06:54'),
(272, 25, '2022004002', '2024-11-05', '10:25:50', '16:50:13', 'Present', '2024-11-19 18:06:54', '2024-11-19 18:06:54'),
(273, 25, '2022004002', '2024-11-06', '10:26:28', '---', 'Present', '2024-11-19 18:06:54', '2024-11-19 18:06:54'),
(274, 25, '2022004002', '2024-11-07', '10:06:34', '---', 'Present', '2024-11-19 18:06:54', '2024-11-19 18:06:54'),
(275, 25, '2022004002', '2024-11-12', '09:51:42', '---', 'Present', '2024-11-19 18:06:54', '2024-11-19 18:06:54'),
(276, 25, '2022004002', '2024-11-13', '09:49:48', '---', 'Present', '2024-11-19 18:06:54', '2024-11-19 18:06:54'),
(277, 25, '2022004002', '2024-11-14', '09:36:41', '---', 'Present', '2024-11-19 18:06:54', '2024-11-19 18:06:54'),
(278, 25, '2022004002', '2024-11-17', '12:32:10', '---', 'Present', '2024-11-19 18:06:54', '2024-11-19 18:06:54'),
(279, 26, '2022004019', '2024-11-03', '09:11:59', '17:15:26', 'Present', '2024-11-19 18:06:54', '2024-11-19 18:06:54'),
(280, 26, '2022004019', '2024-11-04', '09:12:29', '17:15:45', 'Present', '2024-11-19 18:06:54', '2024-11-19 18:06:54'),
(281, 26, '2022004019', '2024-11-05', '08:50:51', '---', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(282, 26, '2022004019', '2024-11-06', '09:19:44', '17:13:36', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(283, 26, '2022004019', '2024-11-07', '09:00:09', '17:13:37', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(284, 26, '2022004019', '2024-11-10', '09:04:56', '14:01:39', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(285, 26, '2022004019', '2024-11-11', '09:49:53', '17:08:28', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(286, 26, '2022004019', '2024-11-12', '08:50:07', '13:46:04', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(287, 26, '2022004019', '2024-11-13', '09:46:25', '14:37:22', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(288, 26, '2022004019', '2024-11-14', '08:50:36', '13:37:03', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(289, 26, '2022004019', '2024-11-17', '09:54:53', '---', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(290, 26, '2022004019', '2024-11-18', '10:31:18', '14:26:05', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(291, 27, '2022004091', '2024-11-03', '08:53:55', '17:08:52', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(292, 27, '2022004091', '2024-11-04', '10:18:16', '---', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(293, 27, '2022004091', '2024-11-05', '10:08:45', '17:07:05', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(294, 27, '2022004091', '2024-11-06', '10:26:14', '18:22:52', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(295, 27, '2022004091', '2024-11-07', '08:52:48', '---', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(296, 27, '2022004091', '2024-11-10', '09:32:36', '17:22:53', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(297, 27, '2022004091', '2024-11-11', '09:52:02', '17:06:42', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(298, 27, '2022004091', '2024-11-12', '09:53:20', '16:16:01', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(299, 27, '2022004091', '2024-11-13', '09:51:18', '16:35:56', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(300, 27, '2022004091', '2024-11-14', '09:52:38', '16:31:04', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(301, 27, '2022004091', '2024-11-17', '09:52:35', '16:55:35', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(302, 27, '2022004091', '2024-11-18', '09:53:07', '---', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(303, 28, '2022004025', '2024-11-03', '09:21:20', '---', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(304, 28, '2022004025', '2024-11-04', '09:17:49', '17:19:26', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(305, 28, '2022004025', '2024-11-05', '08:59:24', '17:50:16', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(306, 28, '2022004025', '2024-11-06', '09:26:15', '17:10:41', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(307, 28, '2022004025', '2024-11-07', '08:54:40', '17:14:02', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(308, 28, '2022004025', '2024-11-10', '08:39:29', '15:17:51', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(309, 28, '2022004025', '2024-11-11', '09:53:33', '---', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(310, 28, '2022004025', '2024-11-12', '09:36:43', '14:12:21', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(311, 28, '2022004025', '2024-11-13', '09:18:51', '14:15:37', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(312, 28, '2022004025', '2024-11-14', '08:38:53', '17:04:06', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(313, 28, '2022004025', '2024-11-17', '08:40:10', '14:40:18', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(314, 28, '2022004025', '2024-11-18', '09:36:07', '14:34:32', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(315, 29, '0008267609', '2024-11-03', '12:38:02', '---', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(316, 29, '0008267609', '2024-11-04', '09:32:16', '17:19:17', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(317, 29, '0008267609', '2024-11-05', '08:25:42', '17:50:22', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(318, 29, '0008267609', '2024-11-06', '11:54:18', '17:05:31', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(319, 29, '0008267609', '2024-11-07', '08:26:32', '17:14:07', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(320, 29, '0008267609', '2024-11-10', '08:39:51', '---', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(321, 29, '0008267609', '2024-11-11', '09:35:42', '09:35:47', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(322, 29, '0008267609', '2024-11-12', '08:33:32', '---', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(323, 29, '0008267609', '2024-11-13', '10:41:00', '---', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(324, 29, '0008267609', '2024-11-14', '08:38:06', '15:31:41', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(325, 29, '0008267609', '2024-11-17', '08:49:30', '14:41:31', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(326, 29, '0008267609', '2024-11-18', '09:26:57', '---', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(327, 30, '2022004028', '2024-11-03', '10:59:57', '---', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(328, 30, '2022004028', '2024-11-04', '10:21:33', '17:19:20', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(329, 30, '2022004028', '2024-11-05', '08:57:28', '17:29:51', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(330, 30, '2022004028', '2024-11-06', '10:40:53', '17:10:38', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(331, 30, '2022004028', '2024-11-07', '09:01:32', '17:16:27', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(332, 30, '2022004028', '2024-11-10', '09:01:25', '15:18:02', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(333, 30, '2022004028', '2024-11-11', '09:47:43', '---', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(334, 30, '2022004028', '2024-11-12', '10:05:19', '---', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(335, 30, '2022004028', '2024-11-13', '09:52:58', '14:15:42', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(336, 30, '2022004028', '2024-11-14', '09:07:49', '12:21:10', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(337, 30, '2022004028', '2024-11-17', '09:38:10', '---', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(338, 30, '2022004028', '2024-11-18', '10:14:18', '14:34:09', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(339, 31, '2022004030', '2024-11-04', '11:01:15', '12:37:55', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(340, 31, '2022004030', '2024-11-05', '11:25:31', '16:07:24', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(341, 31, '2022004030', '2024-11-06', '10:08:21', '17:07:12', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(342, 31, '2022004030', '2024-11-07', '11:41:47', '17:06:50', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(343, 31, '2022004030', '2024-11-10', '09:42:04', '12:23:54', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(344, 31, '2022004030', '2024-11-11', '09:50:32', '17:03:25', 'Present', '2024-11-19 18:06:55', '2024-11-19 18:06:55'),
(345, 31, '2022004030', '2024-11-12', '09:59:47', '12:06:06', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(346, 31, '2022004030', '2024-11-13', '09:41:13', '12:48:35', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(347, 31, '2022004030', '2024-11-14', '09:47:12', '11:50:10', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(348, 31, '2022004030', '2024-11-17', '09:47:27', '12:02:57', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(349, 31, '2022004030', '2024-11-18', '10:05:15', '14:13:01', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(350, 34, '2022004031', '2024-11-03', '17:15:18', '---', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(351, 34, '2022004031', '2024-11-04', '13:45:47', '---', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(352, 34, '2022004031', '2024-11-05', '16:52:14', '---', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(353, 34, '2022004031', '2024-11-06', '12:04:22', '17:14:08', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(354, 34, '2022004031', '2024-11-07', '12:16:03', '17:05:52', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(355, 34, '2022004031', '2024-11-10', '11:21:42', '13:17:20', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(356, 34, '2022004031', '2024-11-11', '11:49:17', '12:54:46', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(357, 34, '2022004031', '2024-11-12', '08:49:24', '---', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(358, 34, '2022004031', '2024-11-13', '14:22:06', '---', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(359, 34, '2022004031', '2024-11-14', '08:50:47', '13:07:17', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(360, 34, '2022004031', '2024-11-17', '11:38:21', '13:34:58', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(361, 34, '2022004031', '2024-11-18', '14:29:17', '---', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(362, 35, '2022004048', '2024-11-03', '09:22:29', '---', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(363, 35, '2022004048', '2024-11-05', '10:37:05', '16:51:37', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(364, 35, '2022004048', '2024-11-06', '10:20:58', '---', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(365, 35, '2022004048', '2024-11-10', '09:39:05', '---', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(366, 35, '2022004048', '2024-11-11', '09:42:52', '---', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(367, 35, '2022004048', '2024-11-12', '10:03:09', '---', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(368, 35, '2022004048', '2024-11-13', '09:53:49', '---', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(369, 35, '2022004048', '2024-11-14', '09:57:00', '14:03:15', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(370, 35, '2022004048', '2024-11-17', '11:04:37', '11:04:44', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(371, 35, '2022004048', '2024-11-18', '10:06:13', '---', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(372, 36, '2022004045', '2024-11-03', '08:51:26', '17:13:30', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(373, 36, '2022004045', '2024-11-04', '10:51:09', '17:06:18', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(374, 36, '2022004045', '2024-11-05', '10:49:04', '17:07:54', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(375, 36, '2022004045', '2024-11-06', '11:08:34', '14:14:40', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(376, 36, '2022004045', '2024-11-07', '11:14:44', '17:11:52', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(377, 36, '2022004045', '2024-11-10', '09:45:56', '13:34:50', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(378, 36, '2022004045', '2024-11-11', '09:47:06', '17:54:44', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(379, 36, '2022004045', '2024-11-12', '09:49:10', '14:12:11', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(380, 36, '2022004045', '2024-11-13', '10:06:16', '13:37:00', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(381, 36, '2022004045', '2024-11-14', '08:49:24', '12:48:31', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(382, 36, '2022004045', '2024-11-17', '09:51:02', '17:18:37', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(383, 36, '2022004045', '2024-11-18', '09:54:24', '16:31:57', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(384, 37, '2022004049', '2024-11-03', '08:53:58', '---', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(385, 37, '2022004049', '2024-11-04', '10:18:20', '13:05:53', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(386, 37, '2022004049', '2024-11-05', '10:43:17', '17:08:03', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(387, 37, '2022004049', '2024-11-06', '10:59:23', '14:29:03', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(388, 37, '2022004049', '2024-11-07', '08:52:57', '17:12:54', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(389, 37, '2022004049', '2024-11-10', '09:32:41', '---', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(390, 37, '2022004049', '2024-11-11', '09:52:08', '17:05:43', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(391, 37, '2022004049', '2024-11-12', '09:53:27', '14:12:16', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(392, 37, '2022004049', '2024-11-13', '09:51:23', '13:43:07', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(393, 37, '2022004049', '2024-11-14', '09:52:43', '13:04:33', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(394, 37, '2022004049', '2024-11-17', '09:52:28', '17:18:59', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(395, 37, '2022004049', '2024-11-18', '09:53:24', '14:47:09', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(396, 38, '2022004011', '2024-11-03', '09:01:15', '17:07:13', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(397, 38, '2022004011', '2024-11-04', '17:07:44', '---', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(398, 38, '2022004011', '2024-11-05', '11:00:42', '---', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(399, 38, '2022004011', '2024-11-06', '11:41:55', '17:09:53', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(400, 38, '2022004011', '2024-11-07', '08:56:44', '12:41:45', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(401, 38, '2022004011', '2024-11-10', '09:26:27', '13:23:02', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(402, 38, '2022004011', '2024-11-11', '09:46:39', '17:04:48', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(403, 38, '2022004011', '2024-11-12', '08:49:32', '13:05:48', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(404, 38, '2022004011', '2024-11-13', '09:49:45', '---', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(405, 38, '2022004011', '2024-11-14', '09:01:53', '17:04:25', 'Present', '2024-11-19 18:06:56', '2024-11-19 18:06:56'),
(406, 38, '2022004011', '2024-11-17', '09:11:15', '13:36:37', 'Present', '2024-11-19 18:06:57', '2024-11-19 18:06:57'),
(407, 38, '2022004011', '2024-11-18', '09:37:15', '---', 'Present', '2024-11-19 18:06:57', '2024-11-19 18:06:57'),
(408, 39, '0005290024', '2024-11-03', '09:55:38', '17:11:04', 'Present', '2024-11-19 18:06:57', '2024-11-19 18:06:57'),
(409, 39, '0005290024', '2024-11-04', '10:39:24', '17:13:03', 'Present', '2024-11-19 18:06:57', '2024-11-19 18:06:57'),
(410, 39, '0005290024', '2024-11-05', '08:48:03', '16:57:15', 'Present', '2024-11-19 18:06:57', '2024-11-19 18:06:57'),
(411, 39, '0005290024', '2024-11-06', '10:42:49', '10:42:52', 'Present', '2024-11-19 18:06:57', '2024-11-19 18:06:57'),
(412, 39, '0005290024', '2024-11-07', '11:51:59', '17:07:31', 'Present', '2024-11-19 18:06:57', '2024-11-19 18:06:57'),
(413, 39, '0005290024', '2024-11-10', '09:22:25', '12:49:39', 'Present', '2024-11-19 18:06:57', '2024-11-19 18:06:57'),
(414, 39, '0005290024', '2024-11-11', '09:38:47', '17:22:00', 'Present', '2024-11-19 18:06:57', '2024-11-19 18:06:57'),
(415, 39, '0005290024', '2024-11-12', '09:30:12', '09:30:14', 'Present', '2024-11-19 18:06:57', '2024-11-19 18:06:57'),
(416, 39, '0005290024', '2024-11-13', '09:32:45', '12:30:52', 'Present', '2024-11-19 18:06:57', '2024-11-19 18:06:57'),
(417, 39, '0005290024', '2024-11-14', '09:35:30', '13:52:23', 'Present', '2024-11-19 18:06:57', '2024-11-19 18:06:57'),
(418, 39, '0005290024', '2024-11-17', '09:40:37', '13:51:36', 'Present', '2024-11-19 18:06:57', '2024-11-19 18:06:57'),
(419, 39, '0005290024', '2024-11-18', '09:42:38', '16:35:55', 'Present', '2024-11-19 18:06:57', '2024-11-19 18:06:57'),
(420, 40, '2022004042', '2024-11-03', '12:09:58', '---', 'Present', '2024-11-19 18:06:57', '2024-11-19 18:06:57'),
(421, 40, '2022004042', '2024-11-04', '08:48:01', '---', 'Present', '2024-11-19 18:06:57', '2024-11-19 18:06:57'),
(422, 40, '2022004042', '2024-11-05', '08:55:43', '---', 'Present', '2024-11-19 18:06:57', '2024-11-19 18:06:57'),
(423, 40, '2022004042', '2024-11-06', '09:16:53', '---', 'Present', '2024-11-19 18:06:57', '2024-11-19 18:06:57'),
(424, 40, '2022004042', '2024-11-07', '10:11:05', '---', 'Present', '2024-11-19 18:06:57', '2024-11-19 18:06:57'),
(425, 40, '2022004042', '2024-11-10', '08:57:18', '---', 'Present', '2024-11-19 18:06:57', '2024-11-19 18:06:57'),
(426, 40, '2022004042', '2024-11-11', '09:02:31', '17:05:33', 'Present', '2024-11-19 18:06:57', '2024-11-19 18:06:57'),
(427, 40, '2022004042', '2024-11-12', '11:56:08', '---', 'Present', '2024-11-19 18:06:57', '2024-11-19 18:06:57'),
(428, 40, '2022004042', '2024-11-13', '10:14:09', '---', 'Present', '2024-11-19 18:06:57', '2024-11-19 18:06:57'),
(429, 40, '2022004042', '2024-11-17', '09:11:13', '---', 'Present', '2024-11-19 18:06:57', '2024-11-19 18:06:57'),
(430, 40, '2022004042', '2024-11-18', '09:01:12', '16:36:18', 'Present', '2024-11-19 18:06:57', '2024-11-19 18:06:57');
INSERT INTO `teacher_attendances` (`id`, `teacher_id`, `rfid`, `date`, `intime`, `outtime`, `attendance`, `created_at`, `updated_at`) VALUES
(431, 41, '2022004043', '2024-11-03', '14:31:56', '---', 'Present', '2024-11-19 18:06:57', '2024-11-19 18:06:57'),
(432, 41, '2022004043', '2024-11-04', '10:38:25', '---', 'Present', '2024-11-19 18:06:57', '2024-11-19 18:06:57'),
(433, 41, '2022004043', '2024-11-06', '10:59:08', '17:12:48', 'Present', '2024-11-19 18:06:57', '2024-11-19 18:06:57'),
(434, 41, '2022004043', '2024-11-10', '10:14:22', '---', 'Present', '2024-11-19 18:06:57', '2024-11-19 18:06:57'),
(435, 41, '2022004043', '2024-11-11', '10:04:02', '---', 'Present', '2024-11-19 18:06:57', '2024-11-19 18:06:57'),
(436, 41, '2022004043', '2024-11-12', '10:08:08', '---', 'Present', '2024-11-19 18:06:57', '2024-11-19 18:06:57'),
(437, 41, '2022004043', '2024-11-17', '10:43:46', '---', 'Present', '2024-11-19 18:06:57', '2024-11-19 18:06:57'),
(438, 41, '2022004043', '2024-11-18', '10:46:51', '14:14:52', 'Present', '2024-11-19 18:06:57', '2024-11-19 18:06:57'),
(439, 42, '2022004041', '2024-11-03', '08:49:04', '17:07:08', 'Present', '2024-11-19 18:06:57', '2024-11-19 18:06:57'),
(440, 42, '2022004041', '2024-11-04', '09:52:41', '17:05:43', 'Present', '2024-11-19 18:06:57', '2024-11-19 18:06:57'),
(441, 42, '2022004041', '2024-11-05', '08:43:40', '17:06:47', 'Present', '2024-11-19 18:06:57', '2024-11-19 18:06:57'),
(442, 42, '2022004041', '2024-11-06', '11:28:59', '13:37:21', 'Present', '2024-11-19 18:06:57', '2024-11-19 18:06:57'),
(443, 42, '2022004041', '2024-11-07', '08:46:17', '10:15:30', 'Present', '2024-11-19 18:06:57', '2024-11-19 18:06:57'),
(444, 42, '2022004041', '2024-11-09', '13:03:00', '17:05:05', 'Present', '2024-11-19 18:06:57', '2024-11-19 18:06:57'),
(445, 42, '2022004041', '2024-11-10', '08:48:26', '12:06:28', 'Present', '2024-11-19 18:06:57', '2024-11-19 18:06:57'),
(446, 42, '2022004041', '2024-11-11', '08:54:36', '17:31:10', 'Present', '2024-11-19 18:06:57', '2024-11-19 18:06:57'),
(447, 42, '2022004041', '2024-11-12', '09:59:27', '15:17:25', 'Present', '2024-11-19 18:06:57', '2024-11-19 18:06:57'),
(448, 42, '2022004041', '2024-11-13', '09:57:52', '13:40:30', 'Present', '2024-11-19 18:06:57', '2024-11-19 18:06:57'),
(449, 42, '2022004041', '2024-11-14', '08:51:14', '12:09:54', 'Present', '2024-11-19 18:06:57', '2024-11-19 18:06:57'),
(450, 42, '2022004041', '2024-11-17', '08:51:25', '11:57:42', 'Present', '2024-11-19 18:06:57', '2024-11-19 18:06:57'),
(451, 42, '2022004041', '2024-11-18', '09:43:12', '16:36:03', 'Present', '2024-11-19 18:06:57', '2024-11-19 18:06:57'),
(452, 43, '2022004034', '2024-11-03', '10:27:42', '13:46:54', 'Present', '2024-11-19 18:06:58', '2024-11-19 18:06:58'),
(453, 43, '2022004034', '2024-11-04', '10:05:13', '17:16:11', 'Present', '2024-11-19 18:06:58', '2024-11-19 18:06:58'),
(454, 43, '2022004034', '2024-11-05', '08:53:44', '17:04:27', 'Present', '2024-11-19 18:06:58', '2024-11-19 18:06:58'),
(455, 43, '2022004034', '2024-11-06', '11:43:29', '17:14:03', 'Present', '2024-11-19 18:06:58', '2024-11-19 18:06:58'),
(456, 43, '2022004034', '2024-11-07', '11:38:09', '17:21:56', 'Present', '2024-11-19 18:06:58', '2024-11-19 18:06:58'),
(457, 43, '2022004034', '2024-11-10', '10:04:46', '15:21:56', 'Present', '2024-11-19 18:06:58', '2024-11-19 18:06:58'),
(458, 43, '2022004034', '2024-11-11', '10:03:16', '17:28:34', 'Present', '2024-11-19 18:06:58', '2024-11-19 18:06:58'),
(459, 43, '2022004034', '2024-11-12', '08:52:13', '14:47:22', 'Present', '2024-11-19 18:06:58', '2024-11-19 18:06:58'),
(460, 43, '2022004034', '2024-11-13', '09:56:47', '13:39:50', 'Present', '2024-11-19 18:06:58', '2024-11-19 18:06:58'),
(461, 43, '2022004034', '2024-11-14', '09:57:06', '14:24:47', 'Present', '2024-11-19 18:06:58', '2024-11-19 18:06:58'),
(462, 43, '2022004034', '2024-11-17', '09:52:54', '13:51:46', 'Present', '2024-11-19 18:06:58', '2024-11-19 18:06:58'),
(463, 43, '2022004034', '2024-11-18', '10:01:45', '16:36:11', 'Present', '2024-11-19 18:06:58', '2024-11-19 18:06:58'),
(464, 44, '2022004006', '2024-11-03', '10:46:26', '17:15:42', 'Present', '2024-11-19 18:06:58', '2024-11-19 18:06:58'),
(465, 44, '2022004006', '2024-11-04', '11:07:08', '17:11:25', 'Present', '2024-11-19 18:06:58', '2024-11-19 18:06:58'),
(466, 44, '2022004006', '2024-11-05', '10:30:50', '16:52:19', 'Present', '2024-11-19 18:06:58', '2024-11-19 18:06:58'),
(467, 44, '2022004006', '2024-11-06', '10:23:31', '13:45:54', 'Present', '2024-11-19 18:06:58', '2024-11-19 18:06:58'),
(468, 44, '2022004006', '2024-11-07', '11:12:54', '17:13:24', 'Present', '2024-11-19 18:06:58', '2024-11-19 18:06:58'),
(469, 44, '2022004006', '2024-11-10', '09:44:07', '14:47:09', 'Present', '2024-11-19 18:06:58', '2024-11-19 18:06:58'),
(470, 44, '2022004006', '2024-11-11', '09:57:05', '17:09:22', 'Present', '2024-11-19 18:06:58', '2024-11-19 18:06:58'),
(471, 44, '2022004006', '2024-11-12', '09:53:48', '13:53:32', 'Present', '2024-11-19 18:06:58', '2024-11-19 18:06:58'),
(472, 44, '2022004006', '2024-11-13', '09:51:51', '12:30:57', 'Present', '2024-11-19 18:06:58', '2024-11-19 18:06:58'),
(473, 44, '2022004006', '2024-11-14', '09:53:36', '14:00:38', 'Present', '2024-11-19 18:06:58', '2024-11-19 18:06:58'),
(474, 44, '2022004006', '2024-11-18', '09:52:16', '16:35:25', 'Present', '2024-11-19 18:06:58', '2024-11-19 18:06:58'),
(475, 45, '2022004040', '2024-11-03', '10:51:52', '12:32:40', 'Present', '2024-11-19 18:06:58', '2024-11-19 18:06:58'),
(476, 45, '2022004040', '2024-11-04', '12:27:31', '---', 'Present', '2024-11-19 18:06:58', '2024-11-19 18:06:58'),
(477, 45, '2022004040', '2024-11-06', '10:01:25', '---', 'Present', '2024-11-19 18:06:58', '2024-11-19 18:06:58'),
(478, 45, '2022004040', '2024-11-07', '10:59:03', '---', 'Present', '2024-11-19 18:06:58', '2024-11-19 18:06:58'),
(479, 45, '2022004040', '2024-11-09', '12:12:52', '---', 'Present', '2024-11-19 18:06:58', '2024-11-19 18:06:58'),
(480, 45, '2022004040', '2024-11-10', '09:38:58', '---', 'Present', '2024-11-19 18:06:58', '2024-11-19 18:06:58'),
(481, 45, '2022004040', '2024-11-11', '10:34:37', '17:09:44', 'Present', '2024-11-19 18:06:58', '2024-11-19 18:06:58'),
(482, 45, '2022004040', '2024-11-12', '09:47:17', '14:30:53', 'Present', '2024-11-19 18:06:58', '2024-11-19 18:06:58'),
(483, 45, '2022004040', '2024-11-13', '10:17:35', '---', 'Present', '2024-11-19 18:06:58', '2024-11-19 18:06:58'),
(484, 45, '2022004040', '2024-11-14', '08:35:51', '13:04:23', 'Present', '2024-11-19 18:06:58', '2024-11-19 18:06:58'),
(485, 45, '2022004040', '2024-11-17', '10:14:28', '13:11:08', 'Present', '2024-11-19 18:06:58', '2024-11-19 18:06:58'),
(486, 45, '2022004040', '2024-11-18', '14:20:43', '14:22:05', 'Present', '2024-11-19 18:06:58', '2024-11-19 18:06:58'),
(487, 46, '2022004036', '2024-11-03', '10:14:27', '17:12:42', 'Present', '2024-11-19 18:06:58', '2024-11-19 18:06:58'),
(488, 46, '2022004036', '2024-11-04', '10:13:55', '---', 'Present', '2024-11-19 18:06:58', '2024-11-19 18:06:58'),
(489, 46, '2022004036', '2024-11-05', '10:58:56', '16:50:28', 'Present', '2024-11-19 18:06:58', '2024-11-19 18:06:58'),
(490, 46, '2022004036', '2024-11-06', '10:26:05', '---', 'Present', '2024-11-19 18:06:58', '2024-11-19 18:06:58'),
(491, 46, '2022004036', '2024-11-07', '08:39:07', '---', 'Present', '2024-11-19 18:06:58', '2024-11-19 18:06:58'),
(492, 46, '2022004036', '2024-11-10', '09:56:39', '---', 'Present', '2024-11-19 18:06:58', '2024-11-19 18:06:58'),
(493, 46, '2022004036', '2024-11-11', '09:39:11', '17:09:35', 'Present', '2024-11-19 18:06:58', '2024-11-19 18:06:58'),
(494, 46, '2022004036', '2024-11-12', '09:39:35', '13:22:25', 'Present', '2024-11-19 18:06:58', '2024-11-19 18:06:58'),
(495, 46, '2022004036', '2024-11-13', '09:41:29', '13:08:06', 'Present', '2024-11-19 18:06:58', '2024-11-19 18:06:58'),
(496, 46, '2022004036', '2024-11-14', '09:59:14', '14:02:12', 'Present', '2024-11-19 18:06:58', '2024-11-19 18:06:58'),
(497, 46, '2022004036', '2024-11-17', '09:59:58', '---', 'Present', '2024-11-19 18:06:58', '2024-11-19 18:06:58'),
(498, 46, '2022004036', '2024-11-18', '09:53:02', '---', 'Present', '2024-11-19 18:06:58', '2024-11-19 18:06:58'),
(499, 47, '2022004007', '2024-11-03', '08:48:31', '17:15:37', 'Present', '2024-11-19 18:06:58', '2024-11-19 18:06:58'),
(500, 47, '2022004007', '2024-11-04', '12:21:41', '17:12:40', 'Present', '2024-11-19 18:06:58', '2024-11-19 18:06:58'),
(501, 47, '2022004007', '2024-11-05', '10:28:48', '16:52:27', 'Present', '2024-11-19 18:06:58', '2024-11-19 18:06:58'),
(502, 47, '2022004007', '2024-11-07', '12:26:35', '17:13:17', 'Present', '2024-11-19 18:06:58', '2024-11-19 18:06:58'),
(503, 47, '2022004007', '2024-11-10', '09:55:00', '14:47:05', 'Present', '2024-11-19 18:06:58', '2024-11-19 18:06:58'),
(504, 47, '2022004007', '2024-11-11', '09:36:54', '17:09:19', 'Present', '2024-11-19 18:06:58', '2024-11-19 18:06:58'),
(505, 47, '2022004007', '2024-11-12', '10:01:20', '12:52:39', 'Present', '2024-11-19 18:06:58', '2024-11-19 18:06:58'),
(506, 47, '2022004007', '2024-11-13', '09:48:03', '17:07:50', 'Present', '2024-11-19 18:06:58', '2024-11-19 18:06:58'),
(507, 47, '2022004007', '2024-11-14', '08:37:14', '14:00:45', 'Present', '2024-11-19 18:06:58', '2024-11-19 18:06:58'),
(508, 47, '2022004007', '2024-11-17', '09:45:29', '17:07:25', 'Present', '2024-11-19 18:06:58', '2024-11-19 18:06:58'),
(509, 47, '2022004007', '2024-11-18', '09:48:41', '16:35:38', 'Present', '2024-11-19 18:06:58', '2024-11-19 18:06:58'),
(510, 50, '2022004047', '2024-11-03', '10:10:41', '17:11:23', 'Present', '2024-11-19 18:06:59', '2024-11-19 18:06:59'),
(511, 50, '2022004047', '2024-11-04', '10:49:24', '17:08:26', 'Present', '2024-11-19 18:06:59', '2024-11-19 18:06:59'),
(512, 50, '2022004047', '2024-11-06', '10:08:18', '12:39:10', 'Present', '2024-11-19 18:06:59', '2024-11-19 18:06:59'),
(513, 50, '2022004047', '2024-11-07', '12:25:02', '17:04:19', 'Present', '2024-11-19 18:06:59', '2024-11-19 18:06:59'),
(514, 50, '2022004047', '2024-11-10', '10:04:06', '13:43:06', 'Present', '2024-11-19 18:06:59', '2024-11-19 18:06:59'),
(515, 50, '2022004047', '2024-11-11', '11:26:12', '17:08:24', 'Present', '2024-11-19 18:06:59', '2024-11-19 18:06:59'),
(516, 50, '2022004047', '2024-11-12', '10:20:41', '14:49:54', 'Present', '2024-11-19 18:06:59', '2024-11-19 18:06:59'),
(517, 50, '2022004047', '2024-11-13', '10:02:50', '14:04:45', 'Present', '2024-11-19 18:06:59', '2024-11-19 18:06:59'),
(518, 50, '2022004047', '2024-11-14', '09:48:36', '12:53:27', 'Present', '2024-11-19 18:06:59', '2024-11-19 18:06:59'),
(519, 50, '2022004047', '2024-11-17', '09:00:20', '12:38:47', 'Present', '2024-11-19 18:06:59', '2024-11-19 18:06:59'),
(520, 50, '2022004047', '2024-11-18', '09:49:02', '---', 'Present', '2024-11-19 18:06:59', '2024-11-19 18:06:59'),
(521, 51, '2022004050', '2024-11-03', '09:21:15', '17:12:05', 'Present', '2024-11-19 18:06:59', '2024-11-19 18:06:59'),
(522, 51, '2022004050', '2024-11-04', '10:26:08', '13:24:33', 'Present', '2024-11-19 18:06:59', '2024-11-19 18:06:59'),
(523, 51, '2022004050', '2024-11-05', '09:36:45', '16:50:30', 'Present', '2024-11-19 18:06:59', '2024-11-19 18:06:59'),
(524, 51, '2022004050', '2024-11-06', '10:19:34', '17:09:04', 'Present', '2024-11-19 18:06:59', '2024-11-19 18:06:59'),
(525, 51, '2022004050', '2024-11-07', '09:32:44', '12:05:42', 'Present', '2024-11-19 18:06:59', '2024-11-19 18:06:59'),
(526, 51, '2022004050', '2024-11-10', '13:11:21', '---', 'Present', '2024-11-19 18:06:59', '2024-11-19 18:06:59'),
(527, 51, '2022004050', '2024-11-11', '09:23:16', '---', 'Present', '2024-11-19 18:06:59', '2024-11-19 18:06:59'),
(528, 51, '2022004050', '2024-11-12', '09:37:27', '11:53:49', 'Present', '2024-11-19 18:06:59', '2024-11-19 18:06:59'),
(529, 51, '2022004050', '2024-11-13', '09:27:35', '---', 'Present', '2024-11-19 18:06:59', '2024-11-19 18:06:59'),
(530, 51, '2022004050', '2024-11-14', '09:27:10', '09:27:12', 'Present', '2024-11-19 18:06:59', '2024-11-19 18:06:59'),
(531, 51, '2022004050', '2024-11-17', '09:30:54', '13:12:01', 'Present', '2024-11-19 18:06:59', '2024-11-19 18:06:59'),
(532, 51, '2022004050', '2024-11-18', '09:45:01', '---', 'Present', '2024-11-19 18:06:59', '2024-11-19 18:06:59'),
(533, 52, '2022004057', '2024-11-03', '12:31:15', '17:02:11', 'Present', '2024-11-19 18:06:59', '2024-11-19 18:06:59'),
(534, 52, '2022004057', '2024-11-04', '10:17:34', '17:10:45', 'Present', '2024-11-19 18:06:59', '2024-11-19 18:06:59'),
(535, 52, '2022004057', '2024-11-05', '09:32:19', '16:49:47', 'Present', '2024-11-19 18:06:59', '2024-11-19 18:06:59'),
(536, 52, '2022004057', '2024-11-06', '09:49:28', '14:33:25', 'Present', '2024-11-19 18:06:59', '2024-11-19 18:06:59'),
(537, 52, '2022004057', '2024-11-07', '10:34:01', '17:50:31', 'Present', '2024-11-19 18:06:59', '2024-11-19 18:06:59'),
(538, 52, '2022004057', '2024-11-10', '09:38:25', '---', 'Present', '2024-11-19 18:06:59', '2024-11-19 18:06:59'),
(539, 52, '2022004057', '2024-11-11', '09:55:38', '17:44:31', 'Present', '2024-11-19 18:06:59', '2024-11-19 18:06:59'),
(540, 52, '2022004057', '2024-11-12', '09:54:34', '15:56:08', 'Present', '2024-11-19 18:06:59', '2024-11-19 18:06:59'),
(541, 52, '2022004057', '2024-11-13', '09:49:07', '14:45:01', 'Present', '2024-11-19 18:06:59', '2024-11-19 18:06:59'),
(542, 52, '2022004057', '2024-11-14', '09:47:18', '---', 'Present', '2024-11-19 18:06:59', '2024-11-19 18:06:59'),
(543, 52, '2022004057', '2024-11-17', '09:45:00', '13:51:39', 'Present', '2024-11-19 18:06:59', '2024-11-19 18:06:59'),
(544, 52, '2022004057', '2024-11-18', '09:31:54', '17:26:30', 'Present', '2024-11-19 18:06:59', '2024-11-19 18:06:59'),
(545, 53, '2022004058', '2024-11-03', '10:58:56', '12:52:29', 'Present', '2024-11-19 18:06:59', '2024-11-19 18:06:59'),
(546, 53, '2022004058', '2024-11-04', '10:35:54', '---', 'Present', '2024-11-19 18:06:59', '2024-11-19 18:06:59'),
(547, 53, '2022004058', '2024-11-05', '08:33:26', '16:51:02', 'Present', '2024-11-19 18:06:59', '2024-11-19 18:06:59'),
(548, 53, '2022004058', '2024-11-06', '10:57:26', '17:09:07', 'Present', '2024-11-19 18:06:59', '2024-11-19 18:06:59'),
(549, 53, '2022004058', '2024-11-07', '08:39:11', '---', 'Present', '2024-11-19 18:06:59', '2024-11-19 18:06:59'),
(550, 53, '2022004058', '2024-11-10', '09:44:42', '13:11:31', 'Present', '2024-11-19 18:06:59', '2024-11-19 18:06:59'),
(551, 53, '2022004058', '2024-11-11', '09:36:44', '17:05:55', 'Present', '2024-11-19 18:06:59', '2024-11-19 18:06:59'),
(552, 53, '2022004058', '2024-11-12', '08:40:00', '---', 'Present', '2024-11-19 18:06:59', '2024-11-19 18:06:59'),
(553, 53, '2022004058', '2024-11-13', '10:02:28', '13:01:14', 'Present', '2024-11-19 18:06:59', '2024-11-19 18:06:59'),
(554, 53, '2022004058', '2024-11-14', '08:37:49', '13:38:33', 'Present', '2024-11-19 18:06:59', '2024-11-19 18:06:59'),
(555, 53, '2022004058', '2024-11-17', '08:41:19', '13:12:27', 'Present', '2024-11-19 18:06:59', '2024-11-19 18:06:59'),
(556, 53, '2022004058', '2024-11-18', '09:53:56', '---', 'Present', '2024-11-19 18:06:59', '2024-11-19 18:06:59'),
(557, 54, '0178015289', '2024-11-03', '08:48:16', '12:52:25', 'Present', '2024-11-19 18:06:59', '2024-11-19 18:06:59'),
(558, 54, '0178015289', '2024-11-04', '10:34:03', '17:10:22', 'Present', '2024-11-19 18:06:59', '2024-11-19 18:06:59'),
(559, 54, '0178015289', '2024-11-05', '09:58:39', '16:50:23', 'Present', '2024-11-19 18:06:59', '2024-11-19 18:06:59'),
(560, 54, '0178015289', '2024-11-06', '10:34:03', '17:12:39', 'Present', '2024-11-19 18:06:59', '2024-11-19 18:06:59'),
(561, 54, '0178015289', '2024-11-07', '11:09:08', '17:05:41', 'Present', '2024-11-19 18:06:59', '2024-11-19 18:06:59'),
(562, 54, '0178015289', '2024-11-10', '09:34:05', '13:36:14', 'Present', '2024-11-19 18:06:59', '2024-11-19 18:06:59'),
(563, 54, '0178015289', '2024-11-11', '09:45:26', '17:07:47', 'Present', '2024-11-19 18:06:59', '2024-11-19 18:06:59'),
(564, 54, '0178015289', '2024-11-12', '09:38:29', '---', 'Present', '2024-11-19 18:06:59', '2024-11-19 18:06:59'),
(565, 54, '0178015289', '2024-11-13', '09:41:57', '14:01:12', 'Present', '2024-11-19 18:06:59', '2024-11-19 18:06:59'),
(566, 54, '0178015289', '2024-11-14', '09:40:57', '13:25:07', 'Present', '2024-11-19 18:06:59', '2024-11-19 18:06:59'),
(567, 54, '0178015289', '2024-11-17', '09:03:51', '---', 'Present', '2024-11-19 18:06:59', '2024-11-19 18:06:59'),
(568, 54, '0178015289', '2024-11-18', '09:30:18', '14:29:24', 'Present', '2024-11-19 18:06:59', '2024-11-19 18:06:59'),
(569, 55, '2022004096', '2024-11-03', '09:42:54', '---', 'Present', '2024-11-19 18:07:00', '2024-11-19 18:07:00'),
(570, 55, '2022004096', '2024-11-04', '10:13:25', '---', 'Present', '2024-11-19 18:07:00', '2024-11-19 18:07:00'),
(571, 55, '2022004096', '2024-11-05', '10:34:31', '16:51:33', 'Present', '2024-11-19 18:07:00', '2024-11-19 18:07:00'),
(572, 55, '2022004096', '2024-11-06', '10:03:07', '12:37:17', 'Present', '2024-11-19 18:07:00', '2024-11-19 18:07:00'),
(573, 55, '2022004096', '2024-11-07', '10:14:06', '---', 'Present', '2024-11-19 18:07:00', '2024-11-19 18:07:00'),
(574, 55, '2022004096', '2024-11-10', '10:55:39', '---', 'Present', '2024-11-19 18:07:00', '2024-11-19 18:07:00'),
(575, 55, '2022004096', '2024-11-11', '10:19:26', '12:34:03', 'Present', '2024-11-19 18:07:00', '2024-11-19 18:07:00'),
(576, 55, '2022004096', '2024-11-12', '10:42:59', '13:22:54', 'Present', '2024-11-19 18:07:00', '2024-11-19 18:07:00'),
(577, 55, '2022004096', '2024-11-13', '10:33:59', '---', 'Present', '2024-11-19 18:07:00', '2024-11-19 18:07:00'),
(578, 55, '2022004096', '2024-11-14', '10:59:08', '---', 'Present', '2024-11-19 18:07:00', '2024-11-19 18:07:00'),
(579, 55, '2022004096', '2024-11-17', '11:37:50', '---', 'Present', '2024-11-19 18:07:00', '2024-11-19 18:07:00'),
(580, 55, '2022004096', '2024-11-18', '10:46:39', '---', 'Present', '2024-11-19 18:07:00', '2024-11-19 18:07:00'),
(581, 56, '2022004093', '2024-11-03', '08:39:17', '17:08:33', 'Present', '2024-11-19 18:07:00', '2024-11-19 18:07:00'),
(582, 56, '2022004093', '2024-11-04', '09:39:13', '17:08:03', 'Present', '2024-11-19 18:07:00', '2024-11-19 18:07:00'),
(583, 56, '2022004093', '2024-11-05', '09:14:11', '16:51:45', 'Present', '2024-11-19 18:07:00', '2024-11-19 18:07:00'),
(584, 56, '2022004093', '2024-11-06', '09:36:26', '17:09:22', 'Present', '2024-11-19 18:07:00', '2024-11-19 18:07:00'),
(585, 56, '2022004093', '2024-11-07', '08:39:39', '17:07:11', 'Present', '2024-11-19 18:07:00', '2024-11-19 18:07:00'),
(586, 56, '2022004093', '2024-11-10', '10:36:08', '12:49:31', 'Present', '2024-11-19 18:07:00', '2024-11-19 18:07:00'),
(587, 56, '2022004093', '2024-11-11', '09:34:49', '17:06:24', 'Present', '2024-11-19 18:07:00', '2024-11-19 18:07:00'),
(588, 56, '2022004093', '2024-11-12', '09:31:26', '---', 'Present', '2024-11-19 18:07:00', '2024-11-19 18:07:00'),
(589, 56, '2022004093', '2024-11-13', '10:07:57', '12:38:45', 'Present', '2024-11-19 18:07:00', '2024-11-19 18:07:00'),
(590, 56, '2022004093', '2024-11-17', '09:40:43', '13:18:59', 'Present', '2024-11-19 18:07:00', '2024-11-19 18:07:00'),
(591, 56, '2022004093', '2024-11-18', '09:36:56', '14:16:07', 'Present', '2024-11-19 18:07:00', '2024-11-19 18:07:00'),
(592, 57, '2022004016', '2024-11-03', '08:52:09', '13:00:46', 'Present', '2024-11-19 18:07:00', '2024-11-19 18:07:00'),
(593, 57, '2022004016', '2024-11-04', '11:00:46', '17:14:47', 'Present', '2024-11-19 18:07:00', '2024-11-19 18:07:00'),
(594, 57, '2022004016', '2024-11-05', '09:24:08', '17:08:19', 'Present', '2024-11-19 18:07:00', '2024-11-19 18:07:00'),
(595, 57, '2022004016', '2024-11-06', '10:15:02', '17:14:25', 'Present', '2024-11-19 18:07:00', '2024-11-19 18:07:00'),
(596, 57, '2022004016', '2024-11-07', '10:17:24', '12:31:27', 'Present', '2024-11-19 18:07:00', '2024-11-19 18:07:00'),
(597, 57, '2022004016', '2024-11-10', '11:36:54', '11:36:57', 'Present', '2024-11-19 18:07:00', '2024-11-19 18:07:00'),
(598, 57, '2022004016', '2024-11-11', '12:45:55', '17:05:51', 'Present', '2024-11-19 18:07:00', '2024-11-19 18:07:00'),
(599, 57, '2022004016', '2024-11-12', '09:53:44', '12:49:50', 'Present', '2024-11-19 18:07:00', '2024-11-19 18:07:00'),
(600, 57, '2022004016', '2024-11-13', '10:15:52', '---', 'Present', '2024-11-19 18:07:00', '2024-11-19 18:07:00'),
(601, 57, '2022004016', '2024-11-14', '08:55:58', '13:43:39', 'Present', '2024-11-19 18:07:00', '2024-11-19 18:07:00'),
(602, 57, '2022004016', '2024-11-17', '09:45:59', '14:16:51', 'Present', '2024-11-19 18:07:00', '2024-11-19 18:07:00'),
(603, 57, '2022004016', '2024-11-18', '10:53:21', '14:14:00', 'Present', '2024-11-19 18:07:00', '2024-11-19 18:07:00'),
(604, 58, '2022004097', '2024-11-03', '08:45:46', '17:15:32', 'Present', '2024-11-19 18:07:00', '2024-11-19 18:07:00'),
(605, 58, '2022004097', '2024-11-04', '08:48:14', '---', 'Present', '2024-11-19 18:07:00', '2024-11-19 18:07:00'),
(606, 58, '2022004097', '2024-11-06', '08:49:30', '14:49:01', 'Present', '2024-11-19 18:07:00', '2024-11-19 18:07:00'),
(607, 58, '2022004097', '2024-11-07', '08:46:07', '---', 'Present', '2024-11-19 18:07:00', '2024-11-19 18:07:00'),
(608, 58, '2022004097', '2024-11-10', '08:47:07', '14:25:12', 'Present', '2024-11-19 18:07:00', '2024-11-19 18:07:00'),
(609, 58, '2022004097', '2024-11-11', '17:16:13', '---', 'Present', '2024-11-19 18:07:00', '2024-11-19 18:07:00'),
(610, 58, '2022004097', '2024-11-12', '08:43:34', '12:59:54', 'Present', '2024-11-19 18:07:00', '2024-11-19 18:07:00'),
(611, 58, '2022004097', '2024-11-13', '08:44:51', '13:51:24', 'Present', '2024-11-19 18:07:00', '2024-11-19 18:07:00'),
(612, 58, '2022004097', '2024-11-14', '08:49:08', '14:16:47', 'Present', '2024-11-19 18:07:00', '2024-11-19 18:07:00'),
(613, 58, '2022004097', '2024-11-17', '08:51:59', '13:17:19', 'Present', '2024-11-19 18:07:00', '2024-11-19 18:07:00'),
(614, 58, '2022004097', '2024-11-18', '08:49:58', '09:05:23', 'Present', '2024-11-19 18:07:00', '2024-11-19 18:07:00'),
(615, 59, '2022004010', '2024-11-03', '08:55:58', '---', 'Present', '2024-11-19 18:07:00', '2024-11-19 18:07:00'),
(616, 59, '2022004010', '2024-11-04', '10:13:07', '17:20:18', 'Present', '2024-11-19 18:07:00', '2024-11-19 18:07:00'),
(617, 59, '2022004010', '2024-11-06', '09:45:38', '17:05:26', 'Present', '2024-11-19 18:07:00', '2024-11-19 18:07:00'),
(618, 59, '2022004010', '2024-11-07', '08:57:41', '---', 'Present', '2024-11-19 18:07:00', '2024-11-19 18:07:00'),
(619, 59, '2022004010', '2024-11-10', '09:54:42', '14:28:45', 'Present', '2024-11-19 18:07:00', '2024-11-19 18:07:00'),
(620, 59, '2022004010', '2024-11-12', '10:03:14', '14:43:18', 'Present', '2024-11-19 18:07:00', '2024-11-19 18:07:00'),
(621, 59, '2022004010', '2024-11-13', '09:39:57', '---', 'Present', '2024-11-19 18:07:00', '2024-11-19 18:07:00'),
(622, 59, '2022004010', '2024-11-14', '09:46:10', '---', 'Present', '2024-11-19 18:07:00', '2024-11-19 18:07:00'),
(623, 59, '2022004010', '2024-11-17', '09:58:36', '12:58:09', 'Present', '2024-11-19 18:07:00', '2024-11-19 18:07:00'),
(624, 59, '2022004010', '2024-11-18', '09:59:06', '14:14:56', 'Present', '2024-11-19 18:07:00', '2024-11-19 18:07:00'),
(625, 60, '2024020061', '2024-11-03', '12:09:35', '---', 'Present', '2024-11-19 18:07:01', '2024-11-19 18:07:01'),
(626, 60, '2024020061', '2024-11-04', '11:06:07', '---', 'Present', '2024-11-19 18:07:01', '2024-11-19 18:07:01'),
(627, 60, '2024020061', '2024-11-05', '08:56:23', '14:03:21', 'Present', '2024-11-19 18:07:01', '2024-11-19 18:07:01'),
(628, 60, '2024020061', '2024-11-07', '11:06:33', '11:06:35', 'Present', '2024-11-19 18:07:01', '2024-11-19 18:07:01'),
(629, 60, '2024020061', '2024-11-10', '09:49:07', '09:49:10', 'Present', '2024-11-19 18:07:01', '2024-11-19 18:07:01'),
(630, 60, '2024020061', '2024-11-11', '08:48:11', '08:48:17', 'Present', '2024-11-19 18:07:01', '2024-11-19 18:07:01'),
(631, 60, '2024020061', '2024-11-13', '09:43:25', '09:43:30', 'Present', '2024-11-19 18:07:01', '2024-11-19 18:07:01'),
(632, 60, '2024020061', '2024-11-14', '09:54:26', '13:09:12', 'Present', '2024-11-19 18:07:01', '2024-11-19 18:07:01'),
(633, 60, '2024020061', '2024-11-17', '08:59:02', '08:59:04', 'Present', '2024-11-19 18:07:01', '2024-11-19 18:07:01'),
(634, 60, '2024020061', '2024-11-18', '08:55:52', '---', 'Present', '2024-11-19 18:07:01', '2024-11-19 18:07:01'),
(635, 62, '0107202406', '2024-11-03', '12:09:43', '17:08:09', 'Present', '2024-11-19 18:07:01', '2024-11-19 18:07:01'),
(636, 62, '0107202406', '2024-11-04', '11:53:57', '13:58:24', 'Present', '2024-11-19 18:07:01', '2024-11-19 18:07:01'),
(637, 62, '0107202406', '2024-11-05', '08:56:00', '17:04:17', 'Present', '2024-11-19 18:07:01', '2024-11-19 18:07:01'),
(638, 62, '0107202406', '2024-11-06', '11:33:20', '17:06:42', 'Present', '2024-11-19 18:07:01', '2024-11-19 18:07:01'),
(639, 62, '0107202406', '2024-11-07', '09:38:01', '---', 'Present', '2024-11-19 18:07:01', '2024-11-19 18:07:01'),
(640, 62, '0107202406', '2024-11-10', '08:34:20', '13:42:33', 'Present', '2024-11-19 18:07:01', '2024-11-19 18:07:01'),
(641, 62, '0107202406', '2024-11-11', '10:40:50', '17:20:38', 'Present', '2024-11-19 18:07:01', '2024-11-19 18:07:01'),
(642, 62, '0107202406', '2024-11-12', '09:04:03', '13:21:01', 'Present', '2024-11-19 18:07:01', '2024-11-19 18:07:01'),
(643, 62, '0107202406', '2024-11-13', '09:55:21', '14:00:23', 'Present', '2024-11-19 18:07:01', '2024-11-19 18:07:01'),
(644, 62, '0107202406', '2024-11-14', '09:36:17', '13:43:44', 'Present', '2024-11-19 18:07:01', '2024-11-19 18:07:01'),
(645, 62, '0107202406', '2024-11-17', '10:08:35', '13:09:27', 'Present', '2024-11-19 18:07:01', '2024-11-19 18:07:01'),
(646, 62, '0107202406', '2024-11-18', '11:11:54', '14:28:06', 'Present', '2024-11-19 18:07:01', '2024-11-19 18:07:01'),
(647, 63, '1072024063', '2024-11-06', '09:44:20', '14:33:29', 'Present', '2024-11-19 18:07:01', '2024-11-19 18:07:01'),
(648, 63, '1072024063', '2024-11-07', '10:24:21', '10:24:24', 'Present', '2024-11-19 18:07:01', '2024-11-19 18:07:01'),
(649, 63, '1072024063', '2024-11-10', '10:12:53', '14:56:03', 'Present', '2024-11-19 18:07:01', '2024-11-19 18:07:01'),
(650, 63, '1072024063', '2024-11-11', '09:21:27', '17:08:06', 'Present', '2024-11-19 18:07:01', '2024-11-19 18:07:01'),
(651, 63, '1072024063', '2024-11-12', '09:17:09', '---', 'Present', '2024-11-19 18:07:01', '2024-11-19 18:07:01'),
(652, 63, '1072024063', '2024-11-13', '09:03:35', '17:05:19', 'Present', '2024-11-19 18:07:01', '2024-11-19 18:07:01'),
(653, 63, '1072024063', '2024-11-14', '10:13:40', '14:40:58', 'Present', '2024-11-19 18:07:01', '2024-11-19 18:07:01'),
(654, 63, '1072024063', '2024-11-17', '10:27:06', '17:07:19', 'Present', '2024-11-19 18:07:01', '2024-11-19 18:07:01'),
(655, 63, '1072024063', '2024-11-18', '09:54:27', '---', 'Present', '2024-11-19 18:07:01', '2024-11-19 18:07:01'),
(656, 65, '01072024065', '2024-11-03', '08:32:28', '17:05:57', 'Present', '2024-11-19 18:07:01', '2024-11-19 18:07:01'),
(657, 65, '01072024065', '2024-11-04', '11:07:21', '17:05:37', 'Present', '2024-11-19 18:07:01', '2024-11-19 18:07:01'),
(658, 65, '01072024065', '2024-11-05', '09:32:30', '17:04:34', 'Present', '2024-11-19 18:07:01', '2024-11-19 18:07:01'),
(659, 65, '01072024065', '2024-11-06', '10:01:46', '15:35:45', 'Present', '2024-11-19 18:07:01', '2024-11-19 18:07:01'),
(660, 65, '01072024065', '2024-11-07', '09:18:04', '14:00:05', 'Present', '2024-11-19 18:07:01', '2024-11-19 18:07:01'),
(661, 65, '01072024065', '2024-11-10', '10:46:43', '---', 'Present', '2024-11-19 18:07:01', '2024-11-19 18:07:01'),
(662, 65, '01072024065', '2024-11-11', '09:54:30', '12:49:54', 'Present', '2024-11-19 18:07:01', '2024-11-19 18:07:01'),
(663, 65, '01072024065', '2024-11-12', '09:08:32', '14:12:28', 'Present', '2024-11-19 18:07:01', '2024-11-19 18:07:01'),
(664, 65, '01072024065', '2024-11-13', '09:40:13', '14:04:52', 'Present', '2024-11-19 18:07:01', '2024-11-19 18:07:01'),
(665, 65, '01072024065', '2024-11-14', '08:52:56', '14:20:28', 'Present', '2024-11-19 18:07:01', '2024-11-19 18:07:01'),
(666, 65, '01072024065', '2024-11-17', '10:15:01', '13:32:00', 'Present', '2024-11-19 18:07:01', '2024-11-19 18:07:01'),
(667, 65, '01072024065', '2024-11-18', '09:59:14', '14:13:51', 'Present', '2024-11-19 18:07:01', '2024-11-19 18:07:01'),
(668, 66, '01072024066', '2024-11-05', '08:49:47', '---', 'Present', '2024-11-19 18:07:01', '2024-11-19 18:07:01'),
(669, 67, '01072024067', '2024-11-04', '09:00:02', '12:27:40', 'Present', '2024-11-19 18:07:02', '2024-11-19 18:07:02'),
(670, 67, '01072024067', '2024-11-05', '08:56:57', '16:51:15', 'Present', '2024-11-19 18:07:02', '2024-11-19 18:07:02'),
(671, 67, '01072024067', '2024-11-06', '08:58:57', '17:12:43', 'Present', '2024-11-19 18:07:02', '2024-11-19 18:07:02'),
(672, 67, '01072024067', '2024-11-07', '08:48:20', '17:08:25', 'Present', '2024-11-19 18:07:02', '2024-11-19 18:07:02'),
(673, 67, '01072024067', '2024-11-10', '08:55:33', '14:56:17', 'Present', '2024-11-19 18:07:02', '2024-11-19 18:07:02'),
(674, 67, '01072024067', '2024-11-11', '08:50:32', '17:08:02', 'Present', '2024-11-19 18:07:02', '2024-11-19 18:07:02'),
(675, 67, '01072024067', '2024-11-12', '08:57:25', '13:36:00', 'Present', '2024-11-19 18:07:02', '2024-11-19 18:07:02'),
(676, 67, '01072024067', '2024-11-13', '08:53:51', '14:26:26', 'Present', '2024-11-19 18:07:02', '2024-11-19 18:07:02'),
(677, 67, '01072024067', '2024-11-14', '08:52:59', '13:38:28', 'Present', '2024-11-19 18:07:02', '2024-11-19 18:07:02'),
(678, 67, '01072024067', '2024-11-17', '08:43:53', '17:05:19', 'Present', '2024-11-19 18:07:02', '2024-11-19 18:07:02'),
(679, 67, '01072024067', '2024-11-18', '08:55:55', '14:16:25', 'Present', '2024-11-19 18:07:02', '2024-11-19 18:07:02'),
(680, 68, '01072024068', '2024-11-03', '08:51:21', '17:05:33', 'Present', '2024-11-19 18:07:02', '2024-11-19 18:07:02'),
(681, 68, '01072024068', '2024-11-04', '09:38:57', '17:10:50', 'Present', '2024-11-19 18:07:02', '2024-11-19 18:07:02'),
(682, 68, '01072024068', '2024-11-05', '08:47:32', '16:51:20', 'Present', '2024-11-19 18:07:02', '2024-11-19 18:07:02'),
(683, 68, '01072024068', '2024-11-06', '08:59:52', '17:06:36', 'Present', '2024-11-19 18:07:02', '2024-11-19 18:07:02'),
(684, 68, '01072024068', '2024-11-07', '09:07:46', '17:06:19', 'Present', '2024-11-19 18:07:02', '2024-11-19 18:07:02'),
(685, 68, '01072024068', '2024-11-10', '09:16:58', '14:56:13', 'Present', '2024-11-19 18:07:02', '2024-11-19 18:07:02'),
(686, 68, '01072024068', '2024-11-11', '09:13:17', '17:07:58', 'Present', '2024-11-19 18:07:02', '2024-11-19 18:07:02'),
(687, 68, '01072024068', '2024-11-12', '08:49:12', '14:52:52', 'Present', '2024-11-19 18:07:02', '2024-11-19 18:07:02'),
(688, 68, '01072024068', '2024-11-13', '08:57:57', '14:26:23', 'Present', '2024-11-19 18:07:02', '2024-11-19 18:07:02'),
(689, 68, '01072024068', '2024-11-14', '08:53:58', '14:40:53', 'Present', '2024-11-19 18:07:02', '2024-11-19 18:07:02'),
(690, 68, '01072024068', '2024-11-17', '08:54:46', '13:32:07', 'Present', '2024-11-19 18:07:02', '2024-11-19 18:07:02'),
(691, 68, '01072024068', '2024-11-18', '09:37:06', '14:16:21', 'Present', '2024-11-19 18:07:02', '2024-11-19 18:07:02'),
(692, 70, '0005302073', '2024-11-03', '08:48:44', '17:05:50', 'Present', '2024-11-19 18:07:02', '2024-11-19 18:07:02'),
(693, 70, '0005302073', '2024-11-04', '09:46:01', '13:46:10', 'Present', '2024-11-19 18:07:02', '2024-11-19 18:07:02'),
(694, 70, '0005302073', '2024-11-05', '11:13:26', '16:50:10', 'Present', '2024-11-19 18:07:02', '2024-11-19 18:07:02'),
(695, 70, '0005302073', '2024-11-06', '11:55:56', '17:12:37', 'Present', '2024-11-19 18:07:02', '2024-11-19 18:07:02'),
(696, 70, '0005302073', '2024-11-07', '08:47:50', '13:46:53', 'Present', '2024-11-19 18:07:02', '2024-11-19 18:07:02'),
(697, 70, '0005302073', '2024-11-10', '08:52:29', '13:36:22', 'Present', '2024-11-19 18:07:02', '2024-11-19 18:07:02'),
(698, 70, '0005302073', '2024-11-11', '10:18:46', '17:07:44', 'Present', '2024-11-19 18:07:02', '2024-11-19 18:07:02'),
(699, 70, '0005302073', '2024-11-12', '09:44:28', '14:57:51', 'Present', '2024-11-19 18:07:02', '2024-11-19 18:07:02'),
(700, 70, '0005302073', '2024-11-13', '09:49:43', '14:02:17', 'Present', '2024-11-19 18:07:02', '2024-11-19 18:07:02'),
(701, 70, '0005302073', '2024-11-14', '09:41:21', '14:01:51', 'Present', '2024-11-19 18:07:02', '2024-11-19 18:07:02'),
(702, 70, '0005302073', '2024-11-17', '08:55:39', '14:18:09', 'Present', '2024-11-19 18:07:02', '2024-11-19 18:07:02'),
(703, 70, '0005302073', '2024-11-18', '09:42:54', '14:24:11', 'Present', '2024-11-19 18:07:02', '2024-11-19 18:07:02'),
(704, 71, '2022004004', '2024-11-05', '16:49:52', '---', 'Present', '2024-11-19 18:07:02', '2024-11-19 18:07:02'),
(705, 71, '2022004004', '2024-11-06', '11:06:51', '12:44:58', 'Present', '2024-11-19 18:07:02', '2024-11-19 18:07:02'),
(706, 71, '2022004004', '2024-11-07', '08:59:50', '17:04:04', 'Present', '2024-11-19 18:07:02', '2024-11-19 18:07:02'),
(707, 71, '2022004004', '2024-11-10', '09:55:57', '12:48:30', 'Present', '2024-11-19 18:07:02', '2024-11-19 18:07:02'),
(708, 71, '2022004004', '2024-11-11', '09:54:58', '17:07:38', 'Present', '2024-11-19 18:07:02', '2024-11-19 18:07:02'),
(709, 71, '2022004004', '2024-11-12', '09:55:03', '---', 'Present', '2024-11-19 18:07:02', '2024-11-19 18:07:02'),
(710, 71, '2022004004', '2024-11-13', '09:53:35', '12:30:20', 'Present', '2024-11-19 18:07:02', '2024-11-19 18:07:02'),
(711, 71, '2022004004', '2024-11-14', '09:36:33', '13:55:14', 'Present', '2024-11-19 18:07:02', '2024-11-19 18:07:02'),
(712, 72, '2022004003', '2024-11-03', '10:15:00', '12:52:21', 'Present', '2024-11-19 18:07:03', '2024-11-19 18:07:03'),
(713, 72, '2022004003', '2024-11-04', '11:00:27', '13:45:53', 'Present', '2024-11-19 18:07:03', '2024-11-19 18:07:03'),
(714, 72, '2022004003', '2024-11-05', '11:19:00', '16:50:00', 'Present', '2024-11-19 18:07:03', '2024-11-19 18:07:03'),
(715, 72, '2022004003', '2024-11-06', '12:06:11', '14:16:19', 'Present', '2024-11-19 18:07:03', '2024-11-19 18:07:03'),
(716, 72, '2022004003', '2024-11-07', '12:33:27', '17:14:18', 'Present', '2024-11-19 18:07:03', '2024-11-19 18:07:03'),
(717, 72, '2022004003', '2024-11-10', '09:56:05', '13:37:29', 'Present', '2024-11-19 18:07:03', '2024-11-19 18:07:03'),
(718, 72, '2022004003', '2024-11-11', '09:45:20', '17:05:03', 'Present', '2024-11-19 18:07:03', '2024-11-19 18:07:03'),
(719, 72, '2022004003', '2024-11-12', '09:51:46', '12:53:22', 'Present', '2024-11-19 18:07:03', '2024-11-19 18:07:03'),
(720, 72, '2022004003', '2024-11-13', '09:53:39', '13:03:39', 'Present', '2024-11-19 18:07:03', '2024-11-19 18:07:03'),
(721, 72, '2022004003', '2024-11-14', '09:48:59', '09:49:02', 'Present', '2024-11-19 18:07:03', '2024-11-19 18:07:03'),
(722, 72, '2022004003', '2024-11-17', '09:54:21', '17:04:44', 'Present', '2024-11-19 18:07:03', '2024-11-19 18:07:03'),
(723, 72, '2022004003', '2024-11-18', '09:54:15', '14:24:02', 'Present', '2024-11-19 18:07:03', '2024-11-19 18:07:03'),
(724, 4, '2022004001', '2024-11-20', '08:49:50', '06:00:00', 'Present', '2024-11-20 04:41:10', '2024-11-20 04:41:23'),
(725, 5, '2022004017', '2024-11-20', '09:30:07', '06:00:00', 'Present', '2024-11-20 04:41:10', '2024-11-20 04:41:23'),
(726, 6, '2022004039', '2024-11-20', '10:01:09', '06:00:00', 'Present', '2024-11-20 04:41:10', '2024-11-20 04:41:23'),
(727, 11, '0002385556', '2024-11-20', '10:25:00', '06:00:00', 'Present', '2024-11-20 04:41:10', '2024-11-20 04:41:23'),
(728, 12, '2022004013', '2024-11-20', '09:53:36', '06:00:00', 'Present', '2024-11-20 04:41:10', '2024-11-20 04:41:23'),
(729, 14, '0005281987', '2024-11-20', '09:45:38', '06:00:00', 'Present', '2024-11-20 04:41:10', '2024-11-20 04:41:23'),
(730, 15, '2022004044', '2024-11-20', '08:46:58', '06:00:00', 'Present', '2024-11-20 04:41:10', '2024-11-20 04:41:23'),
(731, 18, '2022004021', '2024-11-20', '10:29:16', '06:00:00', 'Present', '2024-11-20 04:41:10', '2024-11-20 04:41:23'),
(732, 19, '0005289611', '2024-11-20', '09:51:02', '06:00:00', 'Present', '2024-11-20 04:41:10', '2024-11-20 04:41:23'),
(733, 20, '2022004014', '2024-11-20', '10:00:35', '06:00:00', 'Present', '2024-11-20 04:41:10', '2024-11-20 04:41:23'),
(734, 22, '2022004035', '2024-11-20', '10:15:09', '06:00:00', 'Present', '2024-11-20 04:41:10', '2024-11-20 04:41:23'),
(735, 23, '2022004037', '2024-11-20', '09:55:14', '06:00:00', 'Present', '2024-11-20 04:41:10', '2024-11-20 04:41:23'),
(736, 25, '2022004002', '2024-11-20', '10:34:15', '06:00:00', 'Present', '2024-11-20 04:41:10', '2024-11-20 04:41:23'),
(737, 26, '2022004019', '2024-11-20', '09:19:28', '06:00:00', 'Present', '2024-11-20 04:41:10', '2024-11-20 04:41:23'),
(738, 28, '2022004025', '2024-11-20', '09:23:13', '06:00:00', 'Present', '2024-11-20 04:41:10', '2024-11-20 04:41:23'),
(739, 31, '2022004030', '2024-11-20', '09:45:48', '06:00:00', 'Present', '2024-11-20 04:41:10', '2024-11-20 04:41:23'),
(740, 35, '2022004048', '2024-11-20', '10:29:35', '06:00:00', 'Present', '2024-11-20 04:41:10', '2024-11-20 04:41:23'),
(741, 36, '2022004045', '2024-11-20', '10:03:38', '06:00:00', 'Present', '2024-11-20 04:41:10', '2024-11-20 04:41:23'),
(742, 37, '2022004049', '2024-11-20', '10:36:23', '06:00:00', 'Present', '2024-11-20 04:41:10', '2024-11-20 04:41:23'),
(743, 38, '2022004011', '2024-11-20', '09:43:19', '09:43:22', 'Present', '2024-11-20 04:41:10', '2024-11-20 04:41:10'),
(744, 39, '0005290024', '2024-11-20', '09:44:55', '06:00:00', 'Present', '2024-11-20 04:41:10', '2024-11-20 04:41:23'),
(745, 40, '2022004042', '2024-11-20', '10:03:15', '06:00:00', 'Present', '2024-11-20 04:41:10', '2024-11-20 04:41:23'),
(746, 41, '2022004043', '2024-11-20', '10:20:35', '06:00:00', 'Present', '2024-11-20 04:41:10', '2024-11-20 04:41:23'),
(747, 42, '2022004041', '2024-11-20', '10:04:32', '06:00:00', 'Present', '2024-11-20 04:41:10', '2024-11-20 04:41:23'),
(748, 43, '2022004034', '2024-11-20', '09:58:30', '06:00:00', 'Present', '2024-11-20 04:41:10', '2024-11-20 04:41:23'),
(749, 44, '2022004006', '2024-11-20', '10:03:21', '06:00:00', 'Present', '2024-11-20 04:41:10', '2024-11-20 04:41:23'),
(750, 45, '2022004040', '2024-11-20', '09:46:27', '06:00:00', 'Present', '2024-11-20 04:41:10', '2024-11-20 04:41:23'),
(751, 47, '2022004007', '2024-11-20', '09:49:43', '06:00:00', 'Present', '2024-11-20 04:41:10', '2024-11-20 04:41:23'),
(752, 50, '2022004047', '2024-11-20', '10:05:18', '06:00:00', 'Present', '2024-11-20 04:41:10', '2024-11-20 04:41:23'),
(753, 51, '2022004050', '2024-11-20', '09:29:08', '06:00:00', 'Present', '2024-11-20 04:41:10', '2024-11-20 04:41:23'),
(754, 52, '2022004057', '2024-11-20', '10:06:44', '06:00:00', 'Present', '2024-11-20 04:41:10', '2024-11-20 04:41:23'),
(755, 53, '2022004058', '2024-11-20', '08:42:20', '06:00:00', 'Present', '2024-11-20 04:41:11', '2024-11-20 04:41:23'),
(756, 54, '0178015289', '2024-11-20', '09:40:35', '06:00:00', 'Present', '2024-11-20 04:41:11', '2024-11-20 04:41:23'),
(757, 56, '2022004093', '2024-11-20', '09:39:09', '06:00:00', 'Present', '2024-11-20 04:41:11', '2024-11-20 04:41:23'),
(758, 58, '2022004097', '2024-11-20', '08:49:35', '06:00:00', 'Present', '2024-11-20 04:41:11', '2024-11-20 04:41:23'),
(759, 59, '2022004010', '2024-11-20', '09:39:46', '06:00:00', 'Present', '2024-11-20 04:41:11', '2024-11-20 04:41:24'),
(760, 60, '2024020061', '2024-11-20', '10:00:05', '10:00:08', 'Present', '2024-11-20 04:41:11', '2024-11-20 04:41:11'),
(761, 62, '0107202406', '2024-11-20', '10:25:17', '06:00:00', 'Present', '2024-11-20 04:41:11', '2024-11-20 04:41:24'),
(762, 65, '01072024065', '2024-11-20', '10:16:26', '06:00:00', 'Present', '2024-11-20 04:41:11', '2024-11-20 04:41:24'),
(763, 67, '01072024067', '2024-11-20', '08:52:41', '06:00:00', 'Present', '2024-11-20 04:41:11', '2024-11-20 04:41:24'),
(764, 68, '01072024068', '2024-11-20', '08:55:10', '06:00:00', 'Present', '2024-11-20 04:41:11', '2024-11-20 04:41:24'),
(765, 71, '2022004004', '2024-11-20', '09:54:54', '06:00:00', 'Present', '2024-11-20 04:41:11', '2024-11-20 04:41:24'),
(766, 72, '2022004003', '2024-11-20', '09:53:43', '06:00:00', 'Present', '2024-11-20 04:41:11', '2024-11-20 04:41:24'),
(767, 7, '2022004018', '2024-11-20', '', '', 'Absent', '2024-11-20 04:41:23', '2024-11-20 04:41:23'),
(768, 8, '005283432', '2024-11-20', '', '', 'Absent', '2024-11-20 04:41:23', '2024-11-20 04:41:23'),
(769, 9, '2022004023', '2024-11-20', '', '', 'Absent', '2024-11-20 04:41:23', '2024-11-20 04:41:23'),
(770, 10, '2022004024', '2024-11-20', '', '', 'Absent', '2024-11-20 04:41:23', '2024-11-20 04:41:23'),
(771, 13, '2022004032', '2024-11-20', '', '', 'Absent', '2024-11-20 04:41:23', '2024-11-20 04:41:23'),
(772, 16, '2022004020', '2024-11-20', '', '', 'Absent', '2024-11-20 04:41:23', '2024-11-20 04:41:23'),
(773, 17, '0005283986', '2024-11-20', '', '', 'Absent', '2024-11-20 04:41:23', '2024-11-20 04:41:23'),
(774, 21, '2022004038', '2024-11-20', '', '', 'Absent', '2024-11-20 04:41:23', '2024-11-20 04:41:23'),
(775, 27, '2022004091', '2024-11-20', '', '', 'Absent', '2024-11-20 04:41:23', '2024-11-20 04:41:23'),
(776, 29, '0008267609', '2024-11-20', '', '', 'Absent', '2024-11-20 04:41:23', '2024-11-20 04:41:23'),
(777, 30, '2022004028', '2024-11-20', '', '', 'Absent', '2024-11-20 04:41:23', '2024-11-20 04:41:23'),
(778, 34, '2022004031', '2024-11-20', '', '', 'Absent', '2024-11-20 04:41:23', '2024-11-20 04:41:23'),
(779, 46, '2022004036', '2024-11-20', '', '', 'Absent', '2024-11-20 04:41:23', '2024-11-20 04:41:23'),
(780, 55, '2022004096', '2024-11-20', '', '', 'Absent', '2024-11-20 04:41:23', '2024-11-20 04:41:23'),
(781, 57, '2022004016', '2024-11-20', '', '', 'Absent', '2024-11-20 04:41:23', '2024-11-20 04:41:23'),
(782, 63, '1072024063', '2024-11-20', '', '', 'Absent', '2024-11-20 04:41:24', '2024-11-20 04:41:24'),
(783, 66, '01072024066', '2024-11-20', '', '', 'Absent', '2024-11-20 04:41:24', '2024-11-20 04:41:24'),
(784, 69, '01072024069', '2024-11-20', '', '', 'Absent', '2024-11-20 04:41:24', '2024-11-20 04:41:24'),
(785, 70, '0005302073', '2024-11-20', '', '', 'Absent', '2024-11-20 04:41:24', '2024-11-20 04:41:24');

-- --------------------------------------------------------

--
-- Table structure for table `teacher_leave_applications`
--

CREATE TABLE `teacher_leave_applications` (
  `id` bigint UNSIGNED NOT NULL,
  `teacher_id` int UNSIGNED NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `reason` text COLLATE utf8mb4_unicode_ci,
  `attachment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `leave_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'CL',
  `status` enum('Pending','Approved','Canceled','Rejected') COLLATE utf8mb4_unicode_ci NOT NULL,
  `entry_user_id` int UNSIGNED NOT NULL,
  `approved_id` int UNSIGNED DEFAULT NULL,
  `approved_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teacher_leave_applications`
--

INSERT INTO `teacher_leave_applications` (`id`, `teacher_id`, `start_date`, `end_date`, `reason`, `attachment`, `leave_type`, `status`, `entry_user_id`, `approved_id`, `approved_at`, `created_at`, `updated_at`) VALUES
(1, 6, '2024-11-05', '2024-11-05', 'na', NULL, 'ML', 'Pending', 0, NULL, NULL, '2024-11-19 17:31:16', '2024-11-20 04:56:38');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

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
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `office_holidays`
--
ALTER TABLE `office_holidays`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teacher_attendances`
--
ALTER TABLE `teacher_attendances`
  ADD PRIMARY KEY (`id`),
  ADD KEY `teacher_attendances_teacher_id_foreign` (`teacher_id`);

--
-- Indexes for table `teacher_leave_applications`
--
ALTER TABLE `teacher_leave_applications`
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
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `office_holidays`
--
ALTER TABLE `office_holidays`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT for table `teacher_attendances`
--
ALTER TABLE `teacher_attendances`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=786;

--
-- AUTO_INCREMENT for table `teacher_leave_applications`
--
ALTER TABLE `teacher_leave_applications`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
