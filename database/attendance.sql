-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 16, 2025 at 06:21 AM
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
-- Database: `attendance`
--

-- --------------------------------------------------------

--
-- Table structure for table `academic_holidays`
--

CREATE TABLE `academic_holidays` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `note` text DEFAULT NULL,
  `status` enum('Approved','Pending') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
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
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_04_16_035501_create_academic_holidays_table', 2),
(5, '2025_04_16_035909_create_teacher_machine_attendances_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `office_holidays`
--

CREATE TABLE `office_holidays` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` text NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `note` text DEFAULT NULL,
  `holiday_type` varchar(20) NOT NULL DEFAULT 'H',
  `status` enum('Pending','Approved','Canceled','Rejected') NOT NULL DEFAULT 'Approved',
  `entry_user_id` int(10) UNSIGNED NOT NULL,
  `approved_id` int(10) UNSIGNED DEFAULT NULL,
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
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
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
  `id` bigint(20) UNSIGNED NOT NULL,
  `tuid` varchar(20) DEFAULT NULL,
  `rfid` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `name_bn` varchar(250) DEFAULT NULL,
  `designation` varchar(250) DEFAULT NULL,
  `designation_bn` varchar(250) DEFAULT NULL,
  `subject` varchar(250) DEFAULT NULL,
  `subject_bn` varchar(250) DEFAULT NULL,
  `department_id` bigint(20) DEFAULT NULL,
  `mobile` varchar(250) DEFAULT NULL,
  `alter_mobile` varchar(250) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `alter_email` varchar(250) DEFAULT NULL,
  `password` varchar(250) DEFAULT NULL,
  `father` varchar(255) DEFAULT NULL,
  `mother` varchar(255) DEFAULT NULL,
  `dob` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `blood_group` varchar(20) DEFAULT NULL,
  `marrage_status` varchar(255) DEFAULT NULL,
  `nid` varchar(255) DEFAULT NULL,
  `religion_id` int(10) DEFAULT NULL,
  `joindate` varchar(255) DEFAULT NULL,
  `country_id` bigint(20) UNSIGNED DEFAULT NULL,
  `district_id` bigint(20) UNSIGNED DEFAULT NULL,
  `policestation` varchar(255) DEFAULT NULL,
  `postoffice` varchar(255) DEFAULT NULL,
  `monthly_basic` double DEFAULT NULL,
  `house_rent` double DEFAULT NULL,
  `medical_allowance` double DEFAULT NULL,
  `tada_bill` double DEFAULT NULL,
  `honours_allowance` double DEFAULT NULL,
  `social_allowance` double DEFAULT NULL,
  `songsad_deduction` double DEFAULT NULL,
  `provident_fund` double DEFAULT NULL,
  `total_salary` double DEFAULT NULL,
  `avatar` varchar(250) DEFAULT NULL,
  `position` int(10) DEFAULT NULL,
  `status` enum('Active','Deactive','Trash') NOT NULL DEFAULT 'Active',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `tuid`, `rfid`, `name`, `name_bn`, `designation`, `designation_bn`, `subject`, `subject_bn`, `department_id`, `mobile`, `alter_mobile`, `email`, `alter_email`, `password`, `father`, `mother`, `dob`, `gender`, `blood_group`, `marrage_status`, `nid`, `religion_id`, `joindate`, `country_id`, `district_id`, `policestation`, `postoffice`, `monthly_basic`, `house_rent`, `medical_allowance`, `tada_bill`, `honours_allowance`, `social_allowance`, `songsad_deduction`, `provident_fund`, `total_salary`, `avatar`, `position`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(3, 'NCT-001', '2022004005', 'MD ZAKIR HOSSAIN', 'জনাব মোঃ জাকির হোসেন', 'Assistant Professor', 'সহকারী অধ্যাপক', 'Political Science', 'রাষ্ট্রবিজ্ঞান', NULL, '01772937417', NULL, 'mdzakirh2207@gmail.com', NULL, '$2y$10$lPrnPgN3v9BhVoC.63hmbOfa65xkurBRLcixTkHJ..cvSRgKzsD3O', NULL, NULL, NULL, 'Male', NULL, 'Married', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-657fcc28d08f8.png', 1, 'Deactive', NULL, '2023-11-23 07:49:46', '2024-10-14 07:24:06'),
(4, 'NCT-021', '2022004001', 'MUSAMMAT SURAIYA NAZNIN', 'জনাব সুরাইয়া নাজনীন', 'Lecturer', 'প্রভাষক', 'Economics', 'অর্থনীতি', NULL, '01725260085', NULL, 'suraiyanaznin79@gmail.com', NULL, '$2y$12$DNuxDxfarIB5tf38ZzRpp.YiV6wi1P93yffrFjrCyeO0hHFnKLkRu', NULL, NULL, '11979-02-01', 'Female', 'B+', 'Married', '৫০৬৮৪৬৩৮১৮', NULL, NULL, 1, NULL, NULL, NULL, 8970, 15544, 1000, 4000, 6500, NULL, 50, 4136, 36014, 'uploads/teacher_users/images/teacher_users-65924c8d49348.jpg', 19, 'Active', NULL, '2023-11-27 17:50:05', '2025-03-24 06:49:17'),
(5, 'NCT-010', '2022004017', 'MD. FORKAN', 'জনাব মোঃ ফোরকান', 'Assistant Professor', 'সহকারী অধ্যাপক', 'Islamic Studies', 'ইসলাম শিক্ষা', NULL, '01914961198', NULL, 'forkanmd898@gmail.com', NULL, '$2y$12$ktuJFsuI0xX/xGHYWf8XZeXdz4.3ZE3HG9NsdDVr0bQ1Q9cyRAHsK', NULL, NULL, '1979-02-15', 'Male', NULL, 'Married', '২৩৮০১৬৭৪১৭', 1, '2004-02-29', 1, NULL, NULL, NULL, 19660, 23308, 1000, NULL, 0, 0, 50, 6077, 43968, 'uploads/teacher_users/images/teacher_users-657fccdf3b4ea.jpg', 8, 'Active', NULL, '2023-11-27 17:52:02', '2025-03-24 06:50:03'),
(6, 'NCT-011', '2022004039', 'MOHD HABIBUR RAHMAN AKANDA', 'মোঃ হাবিবুর রহমান আকন্দ', 'Assistant Professor', 'সহকারী অধ্যাপক', 'Management', 'ব্যবস্থাপনা', NULL, '01553618803', NULL, 'habib_akanda@yahoo.com', NULL, '$2y$10$lPrnPgN3v9BhVoC.63hmbOfa65xkurBRLcixTkHJ..cvSRgKzsD3O', NULL, NULL, '1974-12-06', 'Male', NULL, NULL, '৩৭৩০৫৪৩৬৩৮', NULL, NULL, 1, NULL, NULL, NULL, 19660, 23308, 1000, NULL, 6500, NULL, 50, 6077, 50468, 'uploads/teacher_users/images/teacher_users-657fcd0e5f202.png', 9, 'Active', NULL, '2023-11-27 17:53:32', '2025-03-24 06:51:16'),
(7, 'NCT-012', '2022004018', 'MARJIA KONIKA SULTANA', 'মার্জিয়া কনিকা সুলতানা', 'Assistant Professor', 'সহকারী অধ্যাপক', 'Philosophy', 'দর্শন', NULL, '01915838285', NULL, 'mksnc15@gmail.com', NULL, '$2y$10$lPrnPgN3v9BhVoC.63hmbOfa65xkurBRLcixTkHJ..cvSRgKzsD3O', NULL, NULL, '1976-01-11', 'Female', NULL, NULL, '৩২৯০৮৪১১৪১', NULL, NULL, 1, NULL, NULL, NULL, 14000, 21044, 1000, NULL, NULL, NULL, 50, 5511, 36044, 'uploads/teacher_users/images/teacher_users-657fcd745a0a1.jpg', 10, 'Active', NULL, '2023-11-27 17:54:40', '2025-03-24 06:52:29'),
(8, 'NT-013', '005283432', 'MORSHADA SANJID', 'জনাব মোর্শেদা সানজিদ', 'Library Lecturer', 'গ্রন্থাগার প্রভাষক', 'Library', 'গ্রন্থাগার', NULL, '01717955832', NULL, 'morshadasunjid9444@gmail.com', NULL, '$2y$10$lPrnPgN3v9BhVoC.63hmbOfa65xkurBRLcixTkHJ..cvSRgKzsD3O', NULL, NULL, '51967-02-06', 'Female', NULL, NULL, '৯৫৬৫২৪০২০৮', NULL, NULL, 1, NULL, NULL, NULL, 19550, 23156, 1000, NULL, NULL, NULL, 50, 6039, 43706, 'uploads/teacher_users/images/teacher_users-657fce143095f.jpg', 18, 'Active', NULL, '2023-11-27 18:02:53', '2025-03-24 06:53:12'),
(9, 'NCT-014', '2022004023', 'TOSLIMA BEGUM', 'জনাব তসলিমা বেগম', 'Assistant Professor', 'সহকারী অধ্যাপক', 'Chemistry', 'রসায়ন', NULL, '01717042420', NULL, 'toslima19.bd@gmail.com', NULL, '$2y$10$lPrnPgN3v9BhVoC.63hmbOfa65xkurBRLcixTkHJ..cvSRgKzsD3O', NULL, NULL, '1977-02-07', 'Female', NULL, NULL, '১৯৭৭৬১২৭২০৫১৬৯৪৯৭', NULL, NULL, 1, NULL, NULL, NULL, 11370, 19992, 1000, 3000, 2000, NULL, 50, 5248, 37362, 'uploads/teacher_users/images/teacher_users-657fce74972a7.jpg', 11, 'Active', NULL, '2023-11-27 18:04:35', '2025-03-24 06:54:00'),
(10, 'NCT-015', '2022004024', 'MAHBUBA BEGUM', 'জনাব মাহবুবা বেগম', 'Assistant Professor', 'সহকারী অধ্যাপক', 'Chemistry', 'রসায়ন', NULL, '01735969112', NULL, 'tasnimmahbuba1974@gmail.com', NULL, '$2y$12$3zgEoqrYBm0GnooX0GkTnufySL6ZtglefZ62e2e2vN0tBAUvG40nu', NULL, NULL, '1974-05-01', 'Female', NULL, NULL, '১৯৭৪৯৩১২৫৫৭৪৪৭৮০২', NULL, NULL, 1, NULL, NULL, NULL, 12700, 18992, 1000, 3000, NULL, NULL, 50, 4998, 35692, 'uploads/teacher_users/images/teacher_users-657fcf90ea46f.jpg', 12, 'Active', NULL, '2023-11-27 18:05:43', '2025-03-24 06:54:48'),
(11, 'NCT-016', '0002385556', 'FERDOUS SHIRIN HAQUE', 'জনাব ফেরদৌস শিরীন হক', 'Assistant Professor', 'সহকারী অধ্যাপক', 'Botany', 'উদ্ভিদবিদ্যা', NULL, '01918106873', NULL, 'shirinnasirabad@gmail.com', NULL, '$2y$10$lPrnPgN3v9BhVoC.63hmbOfa65xkurBRLcixTkHJ..cvSRgKzsD3O', NULL, NULL, '1967-01-01', 'Female', NULL, NULL, '৩২৮০৭৯১১৪০', NULL, NULL, 1, NULL, NULL, NULL, 20590, 22148, 1000, NULL, NULL, NULL, 50, 5787, 43738, 'uploads/teacher_users/images/teacher_users-657fd087e0f18.jpg', 13, 'Active', NULL, '2023-11-27 18:07:39', '2025-03-24 06:55:19'),
(12, 'NCT-017', '2022004013', 'MUSAMMAD SHARIFUNNAHAR BEGUM', 'জনাব মোছাম্মদ শরিফুন্নাহার বেগম', 'Assistant Professor', 'সহকারী অধ্যাপক', 'Islamic History & Culture', 'ইসলামের ইতিহাস ও সংস্কৃতি', NULL, '01721142740', NULL, 'snbegum79@gmail.com', NULL, '$2y$12$JuAmaWfuEE6PqydyMRXx6eTSW3Plhpu2rjr5eOeYEtTLcGbiF.2ri', NULL, NULL, '1979-04-01', 'Female', NULL, NULL, '৪১৭৮৮০৪৩১৮', NULL, NULL, 1, NULL, NULL, NULL, 12700, 18992, 1000, NULL, 6500, NULL, 50, 4998, 39192, 'uploads/teacher_users/images/teacher_users-657fd0c4c39c8.jpg', 14, 'Active', NULL, '2023-11-27 18:08:46', '2025-03-24 06:55:47'),
(13, 'NCT-018', '2022004032', 'MURSHIDA KHANAM', 'জনাব মুর্শিদা খানম', 'Assistant Professor', 'সহকারী অধ্যাপক', 'Zoology', 'প্রাণিবিদ্যা', NULL, '01742219493', NULL, 'murshidancm@gmail.com', NULL, '$2y$12$9dcNyGDRpM6DLW0vwEBFNuqQ5msFmC1fgm/Xiaefnha9f3AxA7Dwe', NULL, NULL, '1979-03-12', 'Female', NULL, NULL, '৩৭৩১১৭১৮৫০', NULL, NULL, 1, NULL, NULL, NULL, 12700, 18992, 1000, NULL, NULL, NULL, 50, 4998, 32692, 'uploads/teacher_users/images/teacher_users-657fd10d8d8cc.jpg', 15, 'Active', NULL, '2023-11-27 18:09:38', '2025-03-24 06:56:25'),
(14, 'NCT-019', '0005281987', 'ISMATARA YESMEN', 'জনাব ইসমত আরা ইয়াসমিন', 'Assistant Professor', 'সহকারী অধ্যাপক', 'Social Work', 'সমাজকর্ম', NULL, '01717608999', '01717608999', 'ismatarayesmin3@gmail.com', 'ismatarayesmin3@gmail.com', '$2y$12$hFN5KVQs.5tLdN2KKH9JGu.MvrNgQC/XO6C3UR2sLqNWREA7iaXxi', NULL, NULL, '1982-07-09', NULL, NULL, NULL, '২৩৬৬৭১৪০৫৯', NULL, NULL, 1, NULL, NULL, NULL, 12700, 18992, 1000, NULL, 6500, NULL, 50, 4998, 39192, 'uploads/teacher_users/images/teacher_users-657fd138c48d0.jpg', 16, 'Active', NULL, '2023-11-27 18:10:21', '2025-03-24 06:57:02'),
(15, 'NCT-020', '2022004044', 'SAJIA NASRIN ETE', 'সাজিয়া নাসরীন ইতি', 'Assistant Professor', 'সহকারী অধ্যাপক', 'Accounting', 'হিসাববিজ্ঞান', NULL, '01716817419', NULL, 'sajianasrinete@gmail.com', NULL, '$2y$12$pMrq4UCF3r.XidCm/cxIT.Mwxtr.fgnKjb.9OF2WDaPUPh1tBm7vm', NULL, NULL, '1983-04-03', 'Female', NULL, NULL, '১৯৮৩৭২১৮৩৩৯২৩৩১৩২', NULL, NULL, 1, NULL, NULL, NULL, 10320, 18040, 1000, NULL, 6500, NULL, 50, 4760, 35860, 'uploads/teacher_users/images/teacher_users-657fd1667a021.jpg', 17, 'Active', NULL, '2023-11-27 18:11:24', '2025-03-24 06:58:18'),
(16, 'NCT-022', '2022004020', 'ABEDA SULTANA', 'আবিদা সুলতানা', 'Lecturer', 'প্রভাষক', 'Physics', 'পদার্থবিজ্ঞান', NULL, '01725912922', NULL, 'abidasultana1980@gmail.com', NULL, '$2y$12$qDzF3c/Wp8AfQfZYVSSYeeM6K2mnpUKr/G6N9TK49cO3qi9QOTXn2', NULL, NULL, '1980-11-24', 'Female', NULL, NULL, '১৯৮০৬১২১৩০৬৬০৮৭৫৭', NULL, NULL, 1, NULL, NULL, NULL, 8970, 15544, 1000, 3000, 2000, NULL, 50, 4136, 30514, 'uploads/teacher_users/images/teacher_users-657fd19b2a964.jpg', 20, 'Active', NULL, '2023-11-27 18:12:22', '2025-03-24 06:57:41'),
(17, 'NCT-023', '0005283986', 'TANZILA AREFIN', 'তানজিলা আরেফীন', 'Lecturer', 'প্রভাষক', 'Zoology', 'প্রাণিবিদ্যা', NULL, '01714239925', NULL, 'tanzilaarefin4@gmail.com', NULL, '$2y$10$lPrnPgN3v9BhVoC.63hmbOfa65xkurBRLcixTkHJ..cvSRgKzsD3O', NULL, NULL, '1981-07-23', 'Female', NULL, NULL, '৩২৮০৩৭৪৭১৫', NULL, NULL, 1, NULL, NULL, NULL, 6690, 15000, 1000, NULL, NULL, NULL, 50, 3768, 22690, 'uploads/teacher_users/images/teacher_users-657fd1ed230ab.jpg', 21, 'Active', NULL, '2023-11-27 18:13:13', '2025-03-24 06:58:51'),
(18, 'NCT-024', '2022004021', 'TANGINA ALIN', 'তানজিনা এলিন', 'Lecturer', 'প্রভাষক', 'Bangla', 'বাংলা', NULL, '01739496027', NULL, 'tanginabd@gmail.com', NULL, '$2y$10$lPrnPgN3v9BhVoC.63hmbOfa65xkurBRLcixTkHJ..cvSRgKzsD3O', NULL, NULL, '1981-12-30', 'Female', NULL, NULL, '৭৭৮০৮১৯৮৩০', NULL, NULL, 1, NULL, NULL, NULL, 4890, 15000, 1000, NULL, 5500, NULL, 50, 3588, 26390, 'uploads/teacher_users/images/teacher_users-657fd21ce60c8.jpg', 22, 'Active', NULL, '2023-11-27 18:14:35', '2025-03-24 06:59:29'),
(19, 'NCT-025', '0005289611', 'SYEDA NAZNIN SULTANA', 'সৈয়দা নাজনীন সুলতানা', 'Lecturer', 'প্রভাষক', 'Social Work', 'সমাজকর্ম', NULL, '01722003887', NULL, 'snazninsultana1984@gmail.com', NULL, '$2y$12$tV3Rfdz9nwsZExLN7wPvHunDBUcD5kKA7lNr9jynXogKQOUSqdtQm', NULL, NULL, '1983-10-01', 'Female', NULL, NULL, '১৯৮৩৬১২৫২০৩১১৯৭৫৯', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-657fd2468cd59.jpg', 23, 'Active', NULL, '2023-11-27 18:15:33', '2025-01-01 23:52:03'),
(20, 'NCT-026', '2022004014', 'MUHAMMED MUKLASUR RAHMAN', 'মুহাম্মদ মোখলেছুর রহমান', 'Lecturer', 'প্রভাষক', 'Islamic History & Culture', 'ইসলামের ইতিহাস ও সংস্কৃতি', NULL, '01710544878', NULL, 'muklasur84@gmail.com', NULL, '$2y$10$lPrnPgN3v9BhVoC.63hmbOfa65xkurBRLcixTkHJ..cvSRgKzsD3O', NULL, NULL, '1984-04-02', 'Male', NULL, NULL, '১৯৮৪৬১১২৩২৭৮৪০৫৩৬', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-657fd26e60d36.png', 24, 'Active', NULL, '2023-11-27 18:16:24', '2024-07-02 04:58:04'),
(21, 'NCT-027', '2022004038', 'LUTFOR RAHMAN', 'লুৎফর রহমান রুবেল', 'Lecturer', 'প্রভাষক', 'Geography', 'ভূগোল ও পরিবেশ', NULL, '01677155846', NULL, 'rrlutfor75@gmail.com', NULL, '$2y$10$lPrnPgN3v9BhVoC.63hmbOfa65xkurBRLcixTkHJ..cvSRgKzsD3O', NULL, NULL, '1975-12-31', 'Male', NULL, NULL, '১৯৭৫৬১১৫২৪৭৬৭৫১১১', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-657fd6fec3e32.jpg', 25, 'Active', NULL, '2023-11-27 18:17:10', '2024-07-02 04:58:04'),
(22, 'NCT-028', '2022004035', 'MD. SAIFUL ISLAM', 'মোঃ সাইফুল ইসলাম', 'Lecturer', 'প্রভাষক', 'Mathematics', 'গণিত', NULL, '01913017295', NULL, 'sirana7184@gmail.com', NULL, '$2y$10$lPrnPgN3v9BhVoC.63hmbOfa65xkurBRLcixTkHJ..cvSRgKzsD3O', NULL, NULL, '1984-01-15', 'Male', NULL, NULL, '১৯৮৫৬১১৫২৩৩৫১১৮৫০', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-657fd7359da9f.jpg', 26, 'Active', NULL, '2023-11-27 18:18:39', '2024-07-02 04:58:04'),
(23, 'NCT-029', '2022004037', 'MD. NAZMUL HASSAN', 'মোঃ নাজমুল হাসান', 'Lecturer', 'প্রভাষক', 'Psychology', 'মনোবিজ্ঞান', NULL, '01736299993', NULL, 'n.hassan160715@gmail.com', NULL, '$2y$10$lPrnPgN3v9BhVoC.63hmbOfa65xkurBRLcixTkHJ..cvSRgKzsD3O', NULL, NULL, '1988-07-17', 'Male', NULL, NULL, '১৯৮৮৬১১২০১১৪৭৬০৮৭', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-659256f967a39.jpg', 27, 'Active', NULL, '2023-11-27 18:19:27', '2024-07-02 04:58:05'),
(25, 'NCT-030', '2022004002', 'REZAUL KARIM', 'রেজাউল করিম', 'Lecturer', 'প্রভাষক', 'Economics', 'অর্থনীতি', NULL, '01712396602', NULL, 'rezaulk08@gmail.com', NULL, '$2y$10$lPrnPgN3v9BhVoC.63hmbOfa65xkurBRLcixTkHJ..cvSRgKzsD3O', NULL, NULL, '1985-12-31', 'Male', NULL, NULL, '১৯৮৫৭২১৪৭২৭৮৭০১১০', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-657fd7feab12f.jpg', 28, 'Active', NULL, '2023-11-27 18:21:31', '2024-07-02 04:58:05'),
(26, 'NCT-031', '2022004019', 'MUKTA AKTER', 'মুক্তা আক্তার', 'Lecturer', 'প্রভাষক', 'Philosophy', 'দর্শন', NULL, '01739856176', NULL, 'muktabdit88@gmail.com', NULL, '$2y$12$EQZjnu8GscZVeo1lvb87gOPPvGRFcNG7cA89qdqb.TWMHEjnamBM.', NULL, NULL, '1988-10-20', 'Female', NULL, NULL, '১৯৮৮৩৯১৮৫৭৩০০৬৯৭৪', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-6581268f5de99.jpg', 29, 'Active', NULL, '2023-11-27 18:22:09', '2025-01-02 00:43:42'),
(27, 'NCT-032', '2022004091', 'ABU NAYEM', 'আবু নাঈম', 'Lecturer', 'প্রভাষক', 'Marketing', 'মার্কেটিং', NULL, '01973476933', NULL, 'abunayemfbl@gmail.com', NULL, '$2y$12$QO/2/IXC.H/w8RDBICJhTu/8Gr8kTCRmjjJNhqZs5.Jjh8WznffC6', NULL, NULL, '1983-12-31', 'Male', NULL, NULL, '১৯৮৩৩৯১০৭৭১৪৩৯৮৩৪', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-65925db882907.jpg', 30, 'Active', NULL, '2023-11-27 18:22:52', '2025-01-01 01:33:10'),
(28, 'NCT-033', '2022004025', 'MD. MONIRUL ISLAM', 'মোঃ মনিরুল ইসলাম', 'Lecturer', 'প্রভাষক', 'Physics', 'পদার্থবিজ্ঞান', NULL, '01762861112', NULL, 'mdmoniruli771@gmail.com', NULL, '$2y$12$HzYPbcFYmEeYGBN1rwEGNuTNMZpoxpBfho5X4NtBEiWDpYEvOXUom', NULL, NULL, '1991-11-10', 'Male', NULL, NULL, '১৯৯১৬১১১৩৭৭০০০০১৩', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-657fd970d61ed.jpg', 31, 'Active', NULL, '2023-11-27 18:23:41', '2025-01-16 04:24:50'),
(29, 'NCT-034', '0008267609', 'HASANUL ISLAM', 'হাসানুল ইসলাম', 'Lecturer', 'প্রভাষক', 'Geography', 'ভূগোল ও পরিবেশ', NULL, '01718055556', NULL, 'painkillerhasan@gmail.com', NULL, '$2y$10$lPrnPgN3v9BhVoC.63hmbOfa65xkurBRLcixTkHJ..cvSRgKzsD3O', NULL, NULL, '1982-12-02', 'Male', NULL, NULL, '১৯৮২১৫৯১০১৯৯০৫২৯৩', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-65925e153045b.jpg', 32, 'Active', NULL, '2023-11-27 18:24:51', '2024-07-02 04:58:05'),
(30, 'NCT-035', '2022004028', 'HANIF KHAN', 'হানিফ খান', 'Lecturer', 'প্রভাষক', 'Management', 'ব্যবস্থাপনা', NULL, '01735773891', NULL, 'hanif91fnf@gmail.com', NULL, '$2y$12$03SEVLSVsHlPg//tvwNppeRNSkQr8YmnQaUrlVYn8kivFbbdGYuJi', NULL, NULL, '1988-09-15', 'Male', NULL, NULL, '৬৮৭৬৪৩৯৬৬৯', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-657fda1a6db94.jpg', 33, 'Active', NULL, '2023-11-27 18:25:33', '2025-01-02 01:39:24'),
(31, 'NCT-036', '2022004030', 'RABEYA SULTANA BITHEE', 'রাবিয়া সুলতানা বীথি', 'Lecturer', 'প্রভাষক', 'Political Science', 'রাষ্ট্রবিজ্ঞান', NULL, '01953414996', NULL, NULL, NULL, '$2y$10$lPrnPgN3v9BhVoC.63hmbOfa65xkurBRLcixTkHJ..cvSRgKzsD3O', NULL, NULL, NULL, 'Female', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-65925eb46b84c.jpg', 34, 'Active', NULL, '2023-11-27 18:26:26', '2024-07-02 04:58:05'),
(34, 'NCD-39', '2022004031', 'NASRIN SULTANA', 'নাসরিন সুলতানা', 'Demonstrating', 'প্রদর্শক', 'Biology', 'জীববিজ্ঞান', NULL, '01684696996', NULL, 'nasrinsultananazu@gmail.com', NULL, '$2y$10$lPrnPgN3v9BhVoC.63hmbOfa65xkurBRLcixTkHJ..cvSRgKzsD3O', NULL, NULL, '1965-04-20', 'Female', NULL, NULL, '৫৫৩০৪১১৯৭৩', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 35, 'Active', NULL, '2023-11-27 18:30:21', '2024-07-02 04:58:05'),
(35, 'NCT-004', '2022004048', 'MD. LUTFOR RAHMAN AKANDA', 'মোঃ লুৎফর রহমান আকন্দ', 'Assistant Professor', 'সহকারী অধ্যাপক', 'Mathematics', 'গণিত', NULL, '01711147452', NULL, 'prof.lutfor1967@gmail.com', NULL, '$2y$12$9i2DKo/eKX2aia8BZz.Ivus2n9HH3iKtJzr8zcDNtrCEtCZ/3HBUi', NULL, NULL, NULL, 'Male', NULL, NULL, '৩৭৩০৫২৬৬৪১', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-6592537885007.jpg', 2, 'Active', NULL, '2023-11-27 18:31:10', '2025-02-09 06:36:18'),
(36, 'NCT-040', '2022004045', 'MD. ABDUL KHALEQUE KHAN', 'মোহাম্মদ আব্দুল খালেক খান', 'Lecturer', 'প্রভাষক', 'Accounting', 'হিসাববিজ্ঞান', NULL, '01712934595', '01712934595', 'khalequekhan786@gmail.com', 'khalequekhan786@gmail.com', '$2y$12$6pMMXXLKbYjIAIzeCJkwB.PVN/GakZF2Rx172QR5lWmkY4WICJWOi', 'Md. Abdul Latif Khan', 'Rahima Akter Khatun.', '1976-10-01', 'Male', NULL, 'Married', '১৯৩৯৯৩৫৩৮১', 1, '2010-04-01', 1, 64, 'Mohanganj', 'Mohanganj- 2446', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-658bdf764a717.jpg', 36, 'Active', NULL, '2023-11-27 18:32:00', '2025-01-05 23:46:24'),
(37, 'NCT-041', '2022004049', 'MAMUNUR RASHID', 'মামুনুর রশীদ', 'Lecturer', 'প্রভাষক', 'Marketing', 'মার্কেটিং', NULL, '01770272671', NULL, 'mmrashidnc@gmail.com', NULL, '$2y$12$s6y6lnLZDIf76EdBuUfVQu76xtZjuZbEWBheU06p5s.e7MYB6ZGaa', NULL, NULL, '1972-12-31', NULL, NULL, NULL, '১৯৭১৩৯১৫৮৩৫১৯২৪৩৫', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-659249c9e81b2.jpg', 37, 'Active', NULL, '2023-11-27 18:32:49', '2025-01-01 01:42:37'),
(38, 'NCT-042', '2022004011', 'RUBIAT JAHAN NUR', 'রুবাইয়াৎ জাহান নূর', 'Lecturer', 'প্রভাষক', 'Social Work', 'সমাজকর্ম', NULL, '01926731979', NULL, 'rubiatjahannur35@gmail.com', NULL, '$2y$10$lPrnPgN3v9BhVoC.63hmbOfa65xkurBRLcixTkHJ..cvSRgKzsD3O', NULL, NULL, '1985-10-29', 'Female', NULL, NULL, '৬৮৮১২৭৭১০৪', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-659249f99f40b.jpg', 38, 'Active', NULL, '2023-11-27 18:33:35', '2024-07-02 04:58:05'),
(39, 'NCT-043', '0005290024', 'SOHANI LAYLA', 'সোহানী লায়লা', 'Lecturer', 'প্রভাষক', 'Social Work', 'সমাজকর্ম', NULL, '01922405624', NULL, 'sohanilayla@gmail.com', NULL, '$2y$12$9GJ8FuAcr9DwTSv/zi/KXOTcLUKiE5jo67v1LExeIW/Romz30WAsa', NULL, NULL, '1982-01-04', 'Female', NULL, NULL, '১৯৮২৬১২৫২০৫২৮৯৬১৩', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-65924a7d9f288.jpg', 39, 'Active', NULL, '2023-11-27 18:34:35', '2025-01-01 01:03:40'),
(40, 'NCT-045', '2022004042', 'MAUDUD AHMED', 'মওদুদ আহমদ', 'Lecturer', 'প্রভাষক', 'Management', 'ব্যবস্থাপনা', NULL, '01717627787', NULL, 'mamnuc@gmail.com', NULL, '$2y$10$lPrnPgN3v9BhVoC.63hmbOfa65xkurBRLcixTkHJ..cvSRgKzsD3O', NULL, NULL, '1980-02-01', 'Male', NULL, NULL, '৪৬১৫৯৮৫২২৫', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-65924a9eae57b.jpg', 41, 'Active', NULL, '2023-11-27 18:35:27', '2024-07-02 04:58:05'),
(41, 'NCT-046', '2022004043', 'MASUM BILLAH', 'মোঃ মাসুম বিল্লাহ', 'Lecturer', 'প্রভাষক', 'Management', 'ব্যবস্থাপনা', NULL, '01723477151', NULL, 'masumbnuc@gmail.com', NULL, '$2y$10$lPrnPgN3v9BhVoC.63hmbOfa65xkurBRLcixTkHJ..cvSRgKzsD3O', NULL, NULL, '1982-08-29', 'Male', NULL, NULL, '১৯৮২৬১১২৪৪০৫৫৬৯৫৯', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-663865403038d.jpg', 42, 'Active', NULL, '2023-11-27 18:36:14', '2024-07-02 04:58:05'),
(42, 'NCT-047', '2022004041', 'HASINA JAHAN', 'হাসিনা জাহান', 'Lecturer', 'প্রভাষক', 'Bangla', 'বাংলা', NULL, '01727451651', NULL, 'jahanhasina1971@gmail.com', NULL, '$2y$10$lPrnPgN3v9BhVoC.63hmbOfa65xkurBRLcixTkHJ..cvSRgKzsD3O', NULL, NULL, '1971-01-08', 'Female', NULL, NULL, '৪৬৩২১৪৮০৭০', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-65924b129916d.jpg', 43, 'Active', NULL, '2023-11-27 18:37:07', '2024-07-02 04:58:05'),
(43, 'NCT-048', '2022004034', 'ALHAMRA PERVIN', 'আলহামরা পারভীন', 'Lecturer', 'প্রভাষক', 'Bangla', 'বাংলা', NULL, '01715625690', NULL, 'alhamrapervin14@gmail.com', NULL, '$2y$10$lPrnPgN3v9BhVoC.63hmbOfa65xkurBRLcixTkHJ..cvSRgKzsD3O', NULL, NULL, '1979-01-13', 'Female', NULL, NULL, '১৯৩১১৬২৩৬৪', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-65924b2f04396.jpg', 44, 'Active', NULL, '2023-11-27 18:38:02', '2024-07-02 04:58:05'),
(44, 'NCT-049', '2022004006', 'JUI TALUKDAR', 'জুঁই তালুকদার', 'Lecturer', 'প্রভাষক', 'Political Science', 'রাষ্ট্রবিজ্ঞান', NULL, '01681887756', NULL, 'jnuitalukdar@gmail.com', NULL, '$2y$10$lPrnPgN3v9BhVoC.63hmbOfa65xkurBRLcixTkHJ..cvSRgKzsD3O', NULL, NULL, '1980-09-22', 'Female', NULL, NULL, '৯১৩০৯৬৫০৫৭', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-65924b55357db.jpg', 45, 'Active', NULL, '2023-11-27 18:38:52', '2024-07-02 04:58:05'),
(45, 'NCT-044', '2022004040', 'MD. KAMRUL ISLAM', 'মোঃ কামরুল ইসলাম', 'Lecturer', 'প্রভাষক', 'Management', 'ব্যবস্থাপনা', NULL, '01726321214', NULL, 'mkislam196@gmail.com', NULL, '$2y$10$lPrnPgN3v9BhVoC.63hmbOfa65xkurBRLcixTkHJ..cvSRgKzsD3O', NULL, NULL, '1976-12-16', 'Male', NULL, NULL, '১৯৭৬৬১২৫২০৭১৫৬২৪২', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-65924bab166d1.jpg', 40, 'Active', NULL, '2023-11-27 18:39:33', '2024-07-02 04:58:05'),
(46, 'NCT-0005', '0005284993', 'MD. MAHBUBUL ALAM', 'মোঃ মাহবুবুল আলম', 'Assistant Professor', 'সহকারী অধ্যাপক', 'Psychology', 'মনোবিজ্ঞান', NULL, '01712721326', NULL, 'mahbubulalam6944@gmail.com', NULL, '$2y$12$Z8cqLI5pZ4npE10AM5fXeOiWbcYbnddemmsy.22mpOTLiDSlVeDxS', NULL, NULL, NULL, 'Male', NULL, NULL, '১৯৭৯৬১১১৩৭৭৬৩৯০০৯', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-65924bd79b73d.jpg', 3, 'Active', NULL, '2023-11-27 18:40:24', '2025-01-02 06:34:06'),
(47, 'NCT-050', '2022004007', 'ZANNAT SULTANA', 'জান্নাত সুলতানা', 'Lecturer', 'প্রভাষক', 'Political Science', 'রাষ্ট্রবিজ্ঞান', NULL, '01717364099', NULL, 'jannatsultanalecturer@gmail.com', NULL, '$2y$10$lPrnPgN3v9BhVoC.63hmbOfa65xkurBRLcixTkHJ..cvSRgKzsD3O', NULL, NULL, '1983-11-01', 'Female', NULL, 'Married', '৭৩৩০২৫৫২৪৬', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-65924c1d73208.jpg', 46, 'Active', NULL, '2023-11-27 18:41:22', '2024-07-02 04:58:05'),
(50, 'NCT-055', '2022004047', 'ISHRAT JAHAN', 'ইশরাত জাহান', 'Assistant Teacher', 'সহকারী শিক্ষক', 'Library and Information Science', 'গ্রস্থাগার ও তথ্য বিজ্ঞান', NULL, '01716006329', NULL, 'ishratjahansimu685@gmail.com', NULL, '$2y$10$lPrnPgN3v9BhVoC.63hmbOfa65xkurBRLcixTkHJ..cvSRgKzsD3O', NULL, NULL, '1982-06-05', 'Female', NULL, NULL, '৬৮৮০২১৯৩১৩', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-65924d5d2d472.jpg', 47, 'Active', NULL, '2023-11-27 18:44:41', '2024-07-02 04:58:05'),
(51, 'NCT-056', '2022004050', 'RUPON CHANDRA SARKER', 'রুপন চন্দ্র সরকার', 'Lecturer (Part Time)', 'প্রভাষক (খন্ডকালীন)', 'Mathematics', 'গণিত', NULL, '01735546654', '01735546654', 'ruponsarker1986@gmail.com', NULL, '$2y$10$lPrnPgN3v9BhVoC.63hmbOfa65xkurBRLcixTkHJ..cvSRgKzsD3O', NULL, NULL, '1986-12-31', 'Male', NULL, 'Unmarried', '৫০৮১৬৯৩২৮৪', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-6592533779095.jpg', 49, 'Active', NULL, '2023-11-27 18:45:49', '2024-11-13 06:41:13'),
(52, 'NCT-057', '2022004057', 'MD. TAIJUL ISLAM', 'মোঃ তাইজুল ইসলাম', 'Lecturer', 'প্রভাষক', 'Political Science', 'রাষ্ট্রবিজ্ঞান', NULL, '01719719732', NULL, 'taijulislam1989@gmail.com', NULL, NULL, 'Md. Mahbub Alam', 'Nazma Khatun', '1989-10-13', 'Male', NULL, 'Married', '১৯৮৯৬১১২৪৬১৪৪৩৩৫৪', 1, '2019-01-02', 1, 62, 'Haluaghat', 'Haluaghat', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-659253fd33eeb.jpg', 50, 'Active', NULL, '2023-11-27 18:46:45', '2025-04-13 03:15:12'),
(53, 'NCT-058', '2022004058', 'MD. ASHRAFUL ALAM', 'আশরাফুল আলম', 'Lecturer (Part Time)', 'প্রভাষক (খন্ডকালীন)', 'Mathematics', 'গণিত', NULL, '01758627451', NULL, 'alamashraful140@gmail.com', NULL, '$2y$10$lPrnPgN3v9BhVoC.63hmbOfa65xkurBRLcixTkHJ..cvSRgKzsD3O', NULL, NULL, '1992-03-03', 'Male', NULL, NULL, '১৯৯২৬১১৩১১৩০০০১৯৯', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-65925481cb03e.jpg', 51, 'Active', NULL, '2023-11-27 18:47:47', '2024-07-02 04:58:06'),
(54, 'NCT-059', '0178015289', 'FATEMATUZZOHORA', 'ফাতিমাতুজজহুরা', 'Lecturer (Part Time)', 'প্রভাষক (খন্ডকালীন)', 'Psychology', 'মনোবিজ্ঞান', NULL, '01780152891', NULL, 'fatima.afa07@gmail.com', NULL, '$2y$10$lPrnPgN3v9BhVoC.63hmbOfa65xkurBRLcixTkHJ..cvSRgKzsD3O', NULL, NULL, '1987-07-05', 'Female', NULL, NULL, '৮৬৬৬২৪১৪৬১', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-65e59c3db0160.jpg', 52, 'Active', NULL, '2023-11-27 18:49:21', '2024-07-02 04:58:06'),
(55, 'NCT-006', '2022004096', 'MOHAMMAD JALAL UDDIN', 'মোহাম্মদ জালাল উদ্দিন', 'Assistant Professor', 'সহকারী অধ্যাপক', 'English', 'ইংরেজি', NULL, '01713067985', NULL, 'muhammadjalaluddin74@gmail.com', NULL, '$2y$12$tEP8y75B/1YnvnWQwAIbYu3OBxDjCB7S64U546sOmQ/fJXWqvo7VW', NULL, NULL, NULL, 'Male', NULL, NULL, '৭৩০৯১৫০৬৭৫', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-659255287f0c8.jpg', 5, 'Active', NULL, '2023-11-27 18:50:15', '2024-12-31 05:08:25'),
(56, 'NCT-060', '2022004093', 'MD. IMAMUL HUDA', 'মোঃ ইমামুল হুদা', 'Lecturer (Part Time)', 'প্রভাষক (খন্ডকালীন)', 'English', 'ইংরেজি', NULL, '01680020977', NULL, 'imamulbdit@gmail.com', NULL, '$2y$10$lPrnPgN3v9BhVoC.63hmbOfa65xkurBRLcixTkHJ..cvSRgKzsD3O', NULL, NULL, '1989-07-01', 'Male', NULL, NULL, '১৯৮৯৬১১৬৫৫১০৪৯৭২২', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-65d738d9d0e9a.jpg', 53, 'Active', NULL, '2023-11-27 18:51:07', '2024-07-02 04:58:06'),
(57, 'NCT-007', '2022004016', 'MD. MUSARRAF HOSSAIN', 'মোঃ মোশাররফ হোসাইন', 'Assistant Professor', 'সহকারী অধ্যাপক', 'Islamic Studies', 'ইসলাম শিক্ষা', NULL, '01717315388', NULL, 'musarraf434@gmail.com', 'musarraf434@gmail.com', '$2y$12$ZAQsWz0EUwy9uZfpSpmykezni2Af8y2v9op/t//i5wMqYogkfipPq', NULL, NULL, NULL, 'Male', NULL, NULL, '১৯৭৫৬১১৯৪২৮৭৪৩৭৪৬', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 'uploads/teacher_users/images/teacher_users-6592556e227e8.jpg', 6, 'Active', NULL, '2023-11-27 18:52:19', '2025-04-15 00:28:30'),
(58, 'NCT-008', '2022004097', 'MD ABDUL KADIR', 'মোঃ আব্দুল কাদির', 'Assistant Professor', 'সহকারী অধ্যাপক', 'Information and Communication Technology', 'তথ্য ও যোগাযোগ প্রযুক্তি', NULL, '01914982104', NULL, 'kadirmd159@gmail.com', NULL, '$2y$12$l0eKw4lfJqHM/fuVhi2q2endIgE3PyaZ1mEFAiXDCXrnbAu4XjVTO', NULL, NULL, NULL, 'Male', NULL, NULL, '৭৩৩১০১৪৯২৩', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-659255d9c427e.jpg', 7, 'Active', NULL, '2023-11-27 18:53:20', '2024-12-02 02:25:28'),
(59, 'NCT-009', '2022004010', 'A. T. M. SHAFIQUL ISLAM', 'এ.টি.এম. শফিকুল ইসলাম', 'Assistant Professor', 'সহকারী অধ্যাপক', 'Bangla', 'বাংলা', NULL, '01717786146', NULL, 'atmshafiq71@gmail.com', NULL, '$2y$10$lPrnPgN3v9BhVoC.63hmbOfa65xkurBRLcixTkHJ..cvSRgKzsD3O', NULL, NULL, NULL, 'Male', NULL, NULL, '৫৯৮২৩০৪৩৬১', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-6592564f0a9dc.jpg', 4, 'Active', NULL, '2023-11-27 18:54:15', '2024-12-02 00:29:06'),
(60, 'NCT-061', '2024020061', 'MD. SAKHAWAT HOSSAIN', 'মোঃ শাখাওয়াৎ হোসেন', 'LECTURER', 'প্রভাষক', 'Social Work', 'সমাজকর্ম', NULL, '01719217712', '01719217712', 'shssakhawat@gmail.com', 'shssakhawat@gmail.com', '$2y$12$4GAn0r63dOPr2PvNFdWeLuKdXxqiOt3CrVyIb3cvyUEvWCh7M98Su', NULL, NULL, NULL, 'Male', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/teacher_users/images/teacher_users-659257c52beee.jpg', 54, 'Active', NULL, '2023-12-10 08:42:24', '2025-01-01 23:42:17'),
(62, 'NCT-062', '0107202406', 'Mahfuza Khatun', 'মাহফুজা খাতুন', 'Lecturer', 'প্রভাষক', 'Bangla', 'বাংলা', NULL, '01742970619', '01742970619', 'mahfuzakhatun29@gmail.com', 'mahfuzakhatun29@gmail.com', '$2y$10$lPrnPgN3v9BhVoC.63hmbOfa65xkurBRLcixTkHJ..cvSRgKzsD3O', 'Mahfuz Ali', 'Lutfun Nesa', '1984-03-15', 'Female', NULL, 'Married', '2831515966', 1, '2019-01-02', NULL, 62, 'Mymensingh Sadar', 'Mymensingh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/teachers/images/teachers-668a4b686a4f2.jpg', 55, 'Active', NULL, '2024-07-07 05:39:03', '2024-10-23 04:54:06'),
(63, 'NCT-063', '1072024063', 'Mufassel Hosen Akanda (Bablu)', 'মোফাচ্ছেল হোসেন আকন্দ (বাবলু)', 'Lecturer', 'প্রভাষক', 'Accounting', 'হিসাববিজ্ঞান', NULL, '01610163333', '01717317325', 'mufasselbablu10@gmail.com', 'mufasselbablu10@gmail.com', '$2y$10$swnHrGP7Fbhi.5bnBdL47.vWKPx6s3B.ooOntJ10pDW5u53ia2eCK', 'Md. Abdul Jalil Akanda', 'Mrs. Saleha Akter', '1985-02-10', 'Male', NULL, 'Married', '6113194627883', 1, '2019-01-02', NULL, 62, 'Mymensingh Sadar', 'Mymensingh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/teachers/images/teachers-668fa6d9dd43d.jpg', 56, 'Active', NULL, '2024-07-07 05:40:51', '2025-01-30 04:45:32'),
(64, 'NCT-064', '01072024064', 'শহীদুল ইসলাম', 'শহীদুল ইসলাম', NULL, 'প্রভাষক', 'Management', 'ব্যবস্থাপনা', NULL, NULL, NULL, NULL, NULL, '$2y$10$lPrnPgN3v9BhVoC.63hmbOfa65xkurBRLcixTkHJ..cvSRgKzsD3O', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-01-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 57, 'Deactive', NULL, '2024-07-07 05:42:52', '2024-10-14 07:24:28'),
(65, 'NCT-065', '01072024065', 'Anisuzzaman', 'আনিছুজ্জামান', 'Lecturer', 'প্রভাষক', 'Bangla', 'বাংলা', NULL, '01729692817', '01600098770', 'aniszefc@gmail.com', 'aniszefc@gmail.com', NULL, 'Islam Uddin', 'Suriya Akter', '1986-05-10', 'Male', NULL, 'Married', '2367744436', 1, '2019-01-02', NULL, 62, 'Tarakanda', 'Changnapara', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/teachers/images/teachers-668e06dd7eb64.jpg', 58, 'Active', NULL, '2024-07-07 05:43:56', '2025-01-09 04:08:33'),
(66, 'NCT-066', '01072024066', 'Md. Ataur Rahman', 'মোঃ আতাউর রহমান', 'Lecturer', 'প্রভাষক', 'Political Science', 'রাষ্ট্রবিজ্ঞান', NULL, '01911701675', NULL, 'mdataur01675@gmail.com', NULL, '$2y$12$1turd47n6b5028EmfG8tbeXl/ZDy7GlS.V/eUwCzYnyBo4AJNuaFi', 'Md. Nowab Ali', 'Lutfa Begum', '1987-04-15', 'Male', NULL, 'Married', '4632094191', 1, '2019-01-02', NULL, 62, 'Mymensingh Sadar', 'Mymensingh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/teachers/images/teachers-668a2f2458130.jpg', 59, 'Active', NULL, '2024-07-07 05:45:44', '2025-04-15 02:13:10'),
(67, 'NCT-067', '01072024067', 'Md. Rajon Parvez', 'মোঃ রাজন পারভেজ', 'Lecturer', 'প্রভাষক', 'Accounting', 'হিসাববিজ্ঞান', NULL, '01711165590', '01711165590', 'rajonamc@gmail.com', 'rajonamc@gmail.com', '$2y$12$I/GylaGQMrgg0Qu5Nbim7OGCtsGeRgsv4Um7ratGHxnOHxNo5t4MO', 'Md. Abdul Hamid Talukder', 'PARVIN AKTER', '1988-01-01', 'Male', NULL, 'Married', '7777730248', 1, '12019-02-01', NULL, 62, 'Mymensingh Sadar', 'Mymensingh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/teachers/images/teachers-6694cbd0c6c31.jpg', 60, 'Active', NULL, '2024-07-07 05:47:38', '2025-01-29 22:39:13'),
(68, 'NCT-068', '01072024068', 'Mohammad Monir Mostofa', 'মোহাম্মদ মনির মোস্তফা', 'Lecturer', 'প্রভাষক', 'Accounting', 'হিসাববিজ্ঞান', NULL, '01712364776', '01688622864', 'mmostofa78@gmail.com', 'mmostofa78@gmail.com', '$2y$10$lPrnPgN3v9BhVoC.63hmbOfa65xkurBRLcixTkHJ..cvSRgKzsD3O', 'Md. Abdus Shobhan', 'Mst. Monuwara', '1978-11-01', 'Male', NULL, 'Married', '1927207595', 1, '2019-01-02', NULL, 62, 'Mymensingh Sadar', 'Mymensingh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/teachers/images/teachers-668a2efdd591b.jpg', 61, 'Active', NULL, '2024-07-07 05:48:56', '2024-07-10 04:17:27'),
(69, 'NCT-069', '01072024069', 'Md. Golam Rabbani', 'মোঃ গোলাম রাব্বানী', 'Lecturer', 'প্রভাষক', 'Management', 'ব্যবস্থাপনা', NULL, '01724735831', NULL, 'rabbanincm@gmail.com', 'rabbanincm@gmail.com', '$2y$10$lPrnPgN3v9BhVoC.63hmbOfa65xkurBRLcixTkHJ..cvSRgKzsD3O', 'Late. Jamal Uddin', 'Mst. Rehana Begum', '1990-10-10', 'Male', NULL, 'Unmarried', '2815585159', 1, '2019-01-03', NULL, 62, 'Mymensingh Sadar', 'Mymensingh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/teachers/images/teachers-668a2d45a9552.jpg', 62, 'Active', NULL, '2024-07-07 05:50:04', '2025-01-01 09:25:08'),
(70, 'NCT-054', '0005302073', 'Hafsa Akter', 'হাফছা আক্তার', 'Lecturer', 'প্রভাষক', 'Islamic History & Culture', 'ইসলামের ইতিহাস ও সংস্কৃতি', NULL, '01738939738', '01738939738', 'hafsaakterbdit@gmail.com', 'hafsaakterbdit@gmail.com', '$2y$10$lPrnPgN3v9BhVoC.63hmbOfa65xkurBRLcixTkHJ..cvSRgKzsD3O', 'ABDUL MANNAN', 'RAHIMA BEGUM', '1989-11-26', 'Female', NULL, 'Married', '8205332904', 1, '2016-03-01', NULL, 62, 'Mymensingh Sadar', 'Mymensingh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/teachers/images/teachers-66ea745a757a2.jpg', 59, 'Active', NULL, '2024-09-18 06:34:02', '2024-09-19 03:48:08'),
(71, 'NCT-071', '2022004004', 'Mufserun - Nahar', 'মোফছেরুন নাহার', 'Lecturer', 'প্রভাষক', 'ECONOMICS', 'অর্থনীতি', NULL, '01725403080', '01725403080', 'mufserun89@gmail.com', 'mufserun89@gmail.com', '$2y$10$lPrnPgN3v9BhVoC.63hmbOfa65xkurBRLcixTkHJ..cvSRgKzsD3O', 'Md. Mozammel Hoque', 'Morium Hoque', '1989-01-01', 'Female', NULL, 'Married', '3730313347', 1, '2015-08-16', NULL, 62, 'Mymensingh Sadar', 'Mymensingh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/teachers/images/teachers-66ea755815027.jpg', 58, 'Active', NULL, '2024-09-18 06:38:16', '2024-09-24 05:46:02'),
(72, 'NCT-052', '2022004003', 'Jannatul Naima', 'জান্নাতুল নাঈমা', 'Lecturer', 'প্রভাষক', 'ECONOMICS', 'অর্থনীতি', NULL, '01712422727', '01712422727', 'jannatulnaimaema@gmail.com', 'jannatulnaimaema@gmail.com', '$2y$10$lPrnPgN3v9BhVoC.63hmbOfa65xkurBRLcixTkHJ..cvSRgKzsD3O', 'MD. KHALILUR RAHMAN', 'Rowson Ara', '1982-06-04', 'Female', NULL, 'Married', '1226305598511', 1, '2012-12-02', NULL, 62, 'Mymensingh Sadar', 'Mymensingh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/teachers/images/teachers-66f26b84eacff.jpg', 52, 'Active', NULL, '2024-09-24 07:34:28', '2024-09-24 07:34:28'),
(73, 'NCT-071', '01911700197', 'Md. Ansarul Islam', 'মোঃ আনছারুল ইসলাম', 'Lecturer', 'প্রভাষক', 'English', 'ইংরেজি', NULL, '01911700197', '01911700197', 'ansarulislam420@gmail.com', 'ansarulislam420@gmail.com', '$2y$12$MckLDFm7BZsKwRnRXLb5d.lEGiRLNkXFNFcVWAfhB/fjSoqTsZny.', 'Md. Sirajul Islam', 'Hafiza Akter', '1991-10-01', 'Male', NULL, 'Married', '19916117213000331', 1, '2024-08-28', NULL, 62, 'Nandail', '2300', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/teachers/images/teachers-674d3c78586a5.jpg', 63, 'Active', NULL, '2024-12-02 04:50:00', '2025-04-15 00:30:10'),
(74, 'NCT-070', '01970495772', 'Md. Rakibul Hasan', 'মোঃ রাকিবুল হাসান', 'Physical Education', 'শরীর চর্চা শিক্ষক', 'Physical Education Teacher', 'শারীরিক শিক্ষা', NULL, '01970495772', '01970495772', 'mroni6655@gmail.com', 'mroni6655@gmail.com', '$2y$10$lPrnPgN3v9BhVoC.63hmbOfa65xkurBRLcixTkHJ..cvSRgKzsD3O', 'Md. Shohidul Islam', 'seuly Khatun', '1989-05-07', 'Male', NULL, 'Married', '6116594904985', 1, '2024-08-28', NULL, 62, 'Muktagacha', 'Khamar Bazar', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/teachers/images/teachers-674d3fae32a2c.jpg', 70, 'Active', NULL, '2024-12-02 04:57:41', '2024-12-03 09:44:10'),
(75, 'NCT-072', '01764790300', 'Md. Ariful Islam', 'মোঃ আরিফুল ইসলাম', 'Lecturer', 'প্রভাষক', 'Management', 'ব্যবস্থাপনা', NULL, '01764790300', '01764790300', 'arifulislam76491@gamil.com', 'arifulislam76491@gamil.com', '$2y$10$lPrnPgN3v9BhVoC.63hmbOfa65xkurBRLcixTkHJ..cvSRgKzsD3O', 'Md. Mokbul Hossain', 'Jahera Khatun', '1987-10-25', 'Male', NULL, 'Unmarried', '2355319043', 1, '2019-01-03', NULL, 62, 'Mymensingh Sadar', 'Mymensingh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'uploads/teachers/images/teachers-674ed23724724.png', 72, 'Active', NULL, '2024-12-02 06:35:57', '2024-12-05 06:47:11'),
(76, 'NCT-051', '2022004094', 'Mohamed Rakibul Hasan', 'জনাব মোহাম্মদ রাকিবুল হাসান', 'Lecturer', 'প্রভাষক (খন্ডকালীন)', 'Marketing', 'মার্কেটিং', NULL, '০১৭৭২৯৫০৮৮৮', '০১৭৭২৯৫০৮৮৮', 'rakib.nuc@gmail.com', 'rakib.nuc@gmail.com', NULL, 'Md. Rafiqul Alam', 'Rabeya Begum', '1975-06-16', 'Male', NULL, 'Married', NULL, 1, '2012-01-01', NULL, 62, 'Mymensingh Sadar', 'Mymensingh', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 90, 'Active', NULL, '2025-01-02 05:05:49', '2025-01-02 05:53:41');

-- --------------------------------------------------------

--
-- Table structure for table `teacher_attendances`
--

CREATE TABLE `teacher_attendances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `teacher_id` bigint(20) UNSIGNED DEFAULT NULL,
  `rfid` varchar(50) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `intime` varchar(255) NOT NULL,
  `outtime` varchar(255) NOT NULL,
  `attendance` enum('Present','Absent','Leave','Holiday') NOT NULL DEFAULT 'Present',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `teacher_leave_applications`
--

CREATE TABLE `teacher_leave_applications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `teacher_id` int(10) UNSIGNED NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `reason` text DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `leave_type` varchar(20) NOT NULL DEFAULT 'CL',
  `status` enum('Pending','Approved','Canceled','Rejected') NOT NULL,
  `entry_user_id` int(10) UNSIGNED NOT NULL,
  `approved_id` int(10) UNSIGNED DEFAULT NULL,
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
-- Table structure for table `teacher_machine_attendances`
--

CREATE TABLE `teacher_machine_attendances` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `teacher_id` int(10) UNSIGNED NOT NULL,
  `rfid` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `intime` varchar(100) NOT NULL,
  `outtime` varchar(100) NOT NULL,
  `attendance` enum('Present','Absent') NOT NULL DEFAULT 'Absent',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teacher_machine_attendances`
--

INSERT INTO `teacher_machine_attendances` (`id`, `teacher_id`, `rfid`, `date`, `intime`, `outtime`, `attendance`, `created_at`, `updated_at`) VALUES
(1, 4, '2022004001', '2025-04-06', '11:18:44', '12:51:56', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(2, 4, '2022004001', '2025-04-15', '10:38:44', '---', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(3, 5, '2022004017', '2025-04-07', '10:32:10', '---', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(4, 5, '2022004017', '2025-04-08', '09:15:02', '14:07:44', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(5, 5, '2022004017', '2025-04-09', '09:13:48', '14:18:32', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(6, 5, '2022004017', '2025-04-10', '09:19:05', '14:06:15', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(7, 5, '2022004017', '2025-04-13', '16:15:46', '---', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(8, 5, '2022004017', '2025-04-15', '09:27:32', '14:07:53', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(9, 5, '2022004017', '2025-04-16', '09:29:46', '---', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(10, 6, '2022004039', '2025-04-07', '09:08:26', '---', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(11, 6, '2022004039', '2025-04-08', '16:27:13', '---', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(12, 6, '2022004039', '2025-04-09', '09:54:40', '---', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(13, 6, '2022004039', '2025-04-15', '10:27:15', '---', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(14, 7, '2022004018', '2025-04-07', '10:51:40', '13:14:09', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(15, 7, '2022004018', '2025-04-08', '11:41:08', '14:06:29', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(16, 7, '2022004018', '2025-04-09', '11:38:26', '14:04:47', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(17, 7, '2022004018', '2025-04-10', '11:58:16', '14:14:20', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(18, 7, '2022004018', '2025-04-13', '16:45:39', '---', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(19, 7, '2022004018', '2025-04-15', '10:12:52', '14:42:03', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(20, 8, '005283432', '2025-04-06', '11:36:06', '14:38:13', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(21, 8, '005283432', '2025-04-07', '13:11:14', '---', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(22, 8, '005283432', '2025-04-08', '10:35:53', '14:38:11', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(23, 8, '005283432', '2025-04-09', '10:25:37', '13:45:33', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(24, 8, '005283432', '2025-04-10', '10:37:03', '13:57:13', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(25, 8, '005283432', '2025-04-13', '16:15:55', '---', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(26, 8, '005283432', '2025-04-15', '10:21:10', '14:39:04', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(27, 9, '2022004023', '2025-04-06', '10:05:12', '---', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(28, 9, '2022004023', '2025-04-07', '12:19:13', '---', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(29, 9, '2022004023', '2025-04-08', '14:00:10', '---', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(30, 9, '2022004023', '2025-04-09', '08:43:55', '14:32:51', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(31, 9, '2022004023', '2025-04-15', '08:43:47', '---', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(32, 9, '2022004023', '2025-04-16', '08:56:33', '---', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(33, 10, '2022004024', '2025-04-06', '11:01:56', '---', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(34, 10, '2022004024', '2025-04-08', '09:01:37', '14:06:44', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(35, 10, '2022004024', '2025-04-09', '14:10:21', '---', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(36, 10, '2022004024', '2025-04-10', '10:55:13', '13:26:09', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(37, 10, '2022004024', '2025-04-13', '14:12:34', '---', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(38, 10, '2022004024', '2025-04-15', '14:42:06', '---', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(39, 11, '0002385556', '2025-04-06', '12:22:33', '14:38:19', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(40, 11, '0002385556', '2025-04-07', '12:00:40', '13:11:18', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(41, 11, '0002385556', '2025-04-08', '09:35:37', '14:38:17', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(42, 11, '0002385556', '2025-04-09', '12:16:23', '14:05:04', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(43, 11, '0002385556', '2025-04-10', '09:23:21', '---', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(44, 11, '0002385556', '2025-04-13', '12:41:15', '16:16:32', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(45, 11, '0002385556', '2025-04-15', '09:42:15', '14:47:00', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(46, 12, '2022004013', '2025-04-07', '10:52:12', '13:51:24', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(47, 12, '2022004013', '2025-04-08', '10:26:06', '14:14:59', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(48, 12, '2022004013', '2025-04-09', '10:07:36', '14:32:44', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(49, 12, '2022004013', '2025-04-10', '10:24:10', '14:11:50', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(50, 12, '2022004013', '2025-04-13', '16:12:04', '---', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(51, 12, '2022004013', '2025-04-15', '09:49:50', '---', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(52, 12, '2022004013', '2025-04-16', '09:41:57', '---', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(53, 13, '2022004032', '2025-04-06', '08:53:37', '---', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(54, 13, '2022004032', '2025-04-07', '12:16:22', '13:25:44', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(55, 13, '2022004032', '2025-04-08', '12:34:47', '14:06:35', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(56, 13, '2022004032', '2025-04-09', '14:09:49', '---', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(57, 13, '2022004032', '2025-04-10', '14:14:29', '---', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(58, 13, '2022004032', '2025-04-13', '16:45:30', '---', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(59, 13, '2022004032', '2025-04-15', '14:42:10', '---', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(60, 14, '0005281987', '2025-04-06', '10:57:42', '12:04:42', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(61, 14, '0005281987', '2025-04-07', '10:19:49', '12:30:00', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(62, 14, '0005281987', '2025-04-08', '10:28:19', '12:53:07', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(63, 14, '0005281987', '2025-04-09', '10:03:22', '12:32:34', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(64, 14, '0005281987', '2025-04-13', '16:12:07', '---', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(65, 14, '0005281987', '2025-04-15', '09:37:47', '12:39:45', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(66, 14, '0005281987', '2025-04-16', '09:47:25', '---', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(67, 15, '2022004044', '2025-04-06', '10:33:09', '13:18:22', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(68, 15, '2022004044', '2025-04-07', '10:49:30', '13:12:21', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(69, 15, '2022004044', '2025-04-08', '10:13:18', '13:41:21', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(70, 15, '2022004044', '2025-04-09', '11:05:15', '13:44:20', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(71, 15, '2022004044', '2025-04-10', '10:26:43', '13:45:44', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(72, 15, '2022004044', '2025-04-15', '09:44:40', '14:08:22', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(73, 15, '2022004044', '2025-04-16', '09:50:34', '---', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(74, 17, '0005283986', '2025-04-06', '11:58:19', '13:49:22', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(75, 17, '0005283986', '2025-04-07', '08:49:38', '---', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(76, 17, '0005283986', '2025-04-08', '12:29:03', '14:02:46', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(77, 17, '0005283986', '2025-04-09', '10:01:23', '14:04:51', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(78, 17, '0005283986', '2025-04-10', '11:59:01', '14:14:25', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(79, 17, '0005283986', '2025-04-13', '12:40:10', '16:48:44', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(80, 18, '2022004021', '2025-04-06', '13:49:10', '---', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(81, 18, '2022004021', '2025-04-07', '10:52:38', '13:12:27', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(82, 18, '2022004021', '2025-04-08', '10:49:59', '14:06:47', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(83, 18, '2022004021', '2025-04-09', '11:15:18', '14:04:21', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(84, 18, '2022004021', '2025-04-10', '11:37:27', '14:14:12', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(85, 18, '2022004021', '2025-04-13', '16:12:22', '---', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(86, 18, '2022004021', '2025-04-15', '10:10:28', '14:27:09', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(87, 19, '0005289611', '2025-04-06', '11:02:06', '12:06:56', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(88, 19, '0005289611', '2025-04-07', '11:22:52', '13:12:18', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(89, 19, '0005289611', '2025-04-08', '09:30:20', '12:58:17', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(90, 19, '0005289611', '2025-04-09', '11:17:53', '12:41:42', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(91, 19, '0005289611', '2025-04-10', '09:44:03', '---', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(92, 19, '0005289611', '2025-04-13', '16:12:13', '---', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(93, 19, '0005289611', '2025-04-15', '09:49:00', '13:59:55', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(94, 20, '2022004014', '2025-04-06', '10:40:11', '---', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(95, 20, '2022004014', '2025-04-07', '10:39:53', '---', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(96, 20, '2022004014', '2025-04-08', '10:39:31', '14:23:09', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(97, 20, '2022004014', '2025-04-09', '10:29:45', '14:02:30', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(98, 20, '2022004014', '2025-04-10', '10:20:21', '14:11:53', 'Present', '2025-04-16 04:09:30', '2025-04-16 04:09:30'),
(99, 20, '2022004014', '2025-04-13', '16:12:24', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(100, 20, '2022004014', '2025-04-15', '10:04:03', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(101, 20, '2022004014', '2025-04-16', '09:55:06', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(102, 22, '2022004035', '2025-04-06', '09:46:05', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(103, 22, '2022004035', '2025-04-07', '16:22:40', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(104, 22, '2022004035', '2025-04-08', '10:17:07', '16:27:10', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(105, 22, '2022004035', '2025-04-09', '10:13:52', '15:17:25', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(106, 22, '2022004035', '2025-04-13', '16:12:29', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(107, 22, '2022004035', '2025-04-15', '10:15:38', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(108, 23, '2022004037', '2025-04-06', '11:10:12', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(109, 23, '2022004037', '2025-04-07', '11:25:51', '15:32:37', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(110, 23, '2022004037', '2025-04-08', '12:06:43', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(111, 23, '2022004037', '2025-04-09', '10:43:05', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(112, 23, '2022004037', '2025-04-10', '10:44:49', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(113, 23, '2022004037', '2025-04-15', '09:54:08', '09:54:10', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(114, 23, '2022004037', '2025-04-16', '09:48:24', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(115, 25, '2022004002', '2025-04-06', '10:24:18', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(116, 25, '2022004002', '2025-04-07', '11:07:30', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(117, 25, '2022004002', '2025-04-08', '10:57:01', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(118, 25, '2022004002', '2025-04-09', '11:12:40', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(119, 25, '2022004002', '2025-04-10', '11:00:37', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(120, 25, '2022004002', '2025-04-15', '09:54:21', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(121, 25, '2022004002', '2025-04-16', '09:43:58', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(122, 26, '2022004019', '2025-04-06', '12:05:32', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(123, 26, '2022004019', '2025-04-07', '12:10:10', '13:14:13', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(124, 26, '2022004019', '2025-04-08', '09:29:14', '13:55:21', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(125, 26, '2022004019', '2025-04-09', '10:01:28', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(126, 26, '2022004019', '2025-04-10', '09:04:42', '12:57:31', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(127, 26, '2022004019', '2025-04-13', '12:41:24', '16:10:48', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(128, 26, '2022004019', '2025-04-15', '10:41:19', '14:48:42', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(129, 27, '2022004091', '2025-04-06', '09:38:15', '13:42:47', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(130, 27, '2022004091', '2025-04-07', '10:14:12', '16:22:14', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(131, 27, '2022004091', '2025-04-08', '10:07:21', '16:27:17', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(132, 27, '2022004091', '2025-04-09', '15:17:31', '16:31:38', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(133, 27, '2022004091', '2025-04-10', '11:18:02', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(134, 27, '2022004091', '2025-04-13', '16:14:28', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(135, 27, '2022004091', '2025-04-14', '19:47:09', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(136, 27, '2022004091', '2025-04-15', '09:37:45', '17:06:49', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(137, 27, '2022004091', '2025-04-16', '09:51:39', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(138, 28, '2022004025', '2025-04-06', '10:24:10', '10:24:13', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(139, 28, '2022004025', '2025-04-07', '09:01:31', '13:45:32', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(140, 28, '2022004025', '2025-04-08', '09:38:45', '14:14:03', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(141, 28, '2022004025', '2025-04-09', '09:26:15', '13:42:56', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(142, 28, '2022004025', '2025-04-10', '09:35:34', '14:29:13', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(143, 28, '2022004025', '2025-04-15', '09:41:12', '15:38:58', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(144, 28, '2022004025', '2025-04-16', '09:27:44', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(145, 29, '0008267609', '2025-04-09', '09:34:05', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(146, 29, '0008267609', '2025-04-10', '09:39:25', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(147, 29, '0008267609', '2025-04-15', '09:29:12', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(148, 29, '0008267609', '2025-04-16', '09:41:32', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(149, 30, '2022004028', '2025-04-06', '10:20:52', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(150, 30, '2022004028', '2025-04-09', '09:55:27', '13:10:27', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(151, 30, '2022004028', '2025-04-10', '08:59:20', '15:29:07', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(152, 30, '2022004028', '2025-04-13', '16:14:43', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(153, 30, '2022004028', '2025-04-15', '09:58:28', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(154, 30, '2022004028', '2025-04-16', '09:47:28', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(155, 31, '2022004030', '2025-04-06', '11:10:17', '12:10:24', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(156, 31, '2022004030', '2025-04-07', '11:14:23', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(157, 31, '2022004030', '2025-04-08', '09:28:16', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(158, 31, '2022004030', '2025-04-09', '10:07:23', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(159, 31, '2022004030', '2025-04-10', '11:22:01', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(160, 31, '2022004030', '2025-04-13', '16:11:24', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(161, 31, '2022004030', '2025-04-15', '09:53:57', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(162, 34, '2022004031', '2025-04-06', '11:42:15', '14:38:23', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(163, 34, '2022004031', '2025-04-07', '13:11:26', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(164, 34, '2022004031', '2025-04-08', '11:27:30', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(165, 34, '2022004031', '2025-04-09', '12:16:29', '14:05:11', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(166, 34, '2022004031', '2025-04-10', '11:23:50', '13:57:19', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(167, 34, '2022004031', '2025-04-13', '16:16:02', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(168, 34, '2022004031', '2025-04-15', '09:52:22', '13:50:01', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(169, 35, '2022004048', '2025-04-06', '10:40:07', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(170, 35, '2022004048', '2025-04-07', '09:24:53', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(171, 35, '2022004048', '2025-04-08', '11:08:00', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(172, 35, '2022004048', '2025-04-09', '11:08:52', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(173, 36, '2022004045', '2025-04-06', '12:07:37', '13:07:09', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(174, 36, '2022004045', '2025-04-07', '10:29:34', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(175, 36, '2022004045', '2025-04-08', '11:05:07', '13:45:52', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(176, 36, '2022004045', '2025-04-09', '11:55:58', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(177, 36, '2022004045', '2025-04-10', '10:58:06', '12:04:54', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(178, 36, '2022004045', '2025-04-15', '09:58:04', '14:09:23', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(179, 37, '2022004049', '2025-04-06', '10:32:35', '13:41:39', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(180, 37, '2022004049', '2025-04-07', '11:00:06', '13:11:33', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(181, 37, '2022004049', '2025-04-08', '11:01:38', '13:45:46', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(182, 37, '2022004049', '2025-04-09', '16:31:30', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(183, 37, '2022004049', '2025-04-10', '11:17:45', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(184, 37, '2022004049', '2025-04-13', '16:12:42', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(185, 37, '2022004049', '2025-04-15', '09:50:44', '14:54:08', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(186, 37, '2022004049', '2025-04-16', '09:56:15', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(187, 38, '2022004011', '2025-04-07', '11:47:28', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(188, 38, '2022004011', '2025-04-08', '11:17:42', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(189, 38, '2022004011', '2025-04-09', '10:22:12', '13:03:07', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(190, 38, '2022004011', '2025-04-10', '09:13:00', '14:02:06', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(191, 38, '2022004011', '2025-04-13', '16:11:20', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(192, 38, '2022004011', '2025-04-15', '09:40:24', '14:06:19', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(193, 38, '2022004011', '2025-04-16', '09:42:52', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(194, 39, '0005290024', '2025-04-06', '09:35:48', '12:24:39', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(195, 39, '0005290024', '2025-04-07', '11:16:52', '12:21:13', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(196, 39, '0005290024', '2025-04-08', '09:48:08', '12:55:53', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(197, 39, '0005290024', '2025-04-09', '10:39:39', '13:03:14', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(198, 39, '0005290024', '2025-04-10', '11:28:23', '12:43:20', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(199, 39, '0005290024', '2025-04-15', '09:39:07', '12:40:14', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(200, 39, '0005290024', '2025-04-16', '09:34:56', '09:34:58', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(201, 40, '2022004042', '2025-04-06', '11:12:14', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(202, 40, '2022004042', '2025-04-07', '11:02:59', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(203, 40, '2022004042', '2025-04-08', '10:12:55', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(204, 40, '2022004042', '2025-04-09', '11:18:12', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(205, 40, '2022004042', '2025-04-10', '10:15:25', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(206, 40, '2022004042', '2025-04-15', '10:04:21', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(207, 40, '2022004042', '2025-04-16', '09:58:12', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(208, 41, '2022004043', '2025-04-06', '13:07:30', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(209, 41, '2022004043', '2025-04-07', '12:19:59', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(210, 41, '2022004043', '2025-04-09', '11:30:44', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(211, 41, '2022004043', '2025-04-13', '16:11:17', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(212, 41, '2022004043', '2025-04-15', '10:04:14', '14:58:05', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(213, 42, '2022004041', '2025-04-06', '11:10:05', '13:44:11', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(214, 42, '2022004041', '2025-04-07', '09:51:14', '12:47:41', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(215, 42, '2022004041', '2025-04-08', '09:50:18', '13:50:59', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(216, 42, '2022004041', '2025-04-09', '09:53:06', '13:31:28', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(217, 42, '2022004041', '2025-04-10', '11:09:09', '13:55:01', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(218, 42, '2022004041', '2025-04-13', '16:48:32', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(219, 42, '2022004041', '2025-04-15', '10:08:03', '16:16:03', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(220, 42, '2022004041', '2025-04-16', '09:47:42', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(221, 43, '2022004034', '2025-04-06', '10:13:33', '13:28:31', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(222, 43, '2022004034', '2025-04-07', '10:19:03', '13:18:43', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(223, 43, '2022004034', '2025-04-08', '11:41:00', '14:30:54', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(224, 43, '2022004034', '2025-04-09', '11:52:41', '14:15:51', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(225, 43, '2022004034', '2025-04-10', '14:56:41', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(226, 43, '2022004034', '2025-04-13', '16:17:16', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(227, 43, '2022004034', '2025-04-15', '09:58:37', '14:27:47', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(228, 43, '2022004034', '2025-04-16', '09:52:08', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(229, 44, '2022004006', '2025-04-06', '10:17:03', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(230, 44, '2022004006', '2025-04-07', '09:46:50', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(231, 44, '2022004006', '2025-04-08', '10:30:05', '12:56:23', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(232, 44, '2022004006', '2025-04-09', '10:10:37', '13:06:27', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(233, 44, '2022004006', '2025-04-10', '09:59:59', '13:46:12', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(234, 44, '2022004006', '2025-04-16', '09:41:25', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(235, 45, '2022004040', '2025-04-06', '11:24:23', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(236, 45, '2022004040', '2025-04-07', '12:16:02', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(237, 45, '2022004040', '2025-04-08', '11:40:11', '13:05:34', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(238, 45, '2022004040', '2025-04-09', '11:23:27', '13:08:27', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(239, 45, '2022004040', '2025-04-10', '10:52:28', '13:00:47', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(240, 45, '2022004040', '2025-04-15', '10:18:06', '13:28:21', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(241, 46, '0005284993', '2025-04-08', '11:16:32', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(242, 46, '0005284993', '2025-04-09', '11:48:22', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(243, 46, '0005284993', '2025-04-16', '09:49:08', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(244, 47, '2022004007', '2025-04-06', '11:56:34', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(245, 50, '2022004047', '2025-04-06', '10:27:20', '14:01:23', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(246, 50, '2022004047', '2025-04-07', '10:31:57', '13:49:25', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(247, 50, '2022004047', '2025-04-08', '10:38:59', '14:00:51', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(248, 50, '2022004047', '2025-04-09', '10:38:14', '13:25:39', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(249, 50, '2022004047', '2025-04-10', '10:14:08', '12:37:46', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(250, 50, '2022004047', '2025-04-13', '16:10:50', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(251, 50, '2022004047', '2025-04-15', '10:16:16', '12:35:38', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(252, 51, '2022004050', '2025-04-06', '09:38:12', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(253, 51, '2022004050', '2025-04-07', '11:26:06', '12:35:58', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(254, 51, '2022004050', '2025-04-08', '09:49:23', '14:15:41', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(255, 51, '2022004050', '2025-04-09', '09:55:06', '14:34:20', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(256, 51, '2022004050', '2025-04-10', '09:36:36', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(257, 51, '2022004050', '2025-04-15', '09:45:50', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(258, 51, '2022004050', '2025-04-16', '09:59:25', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(259, 52, '2022004057', '2025-04-06', '10:03:12', '14:18:30', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(260, 52, '2022004057', '2025-04-08', '10:56:02', '13:20:28', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(261, 52, '2022004057', '2025-04-09', '12:12:58', '14:30:46', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(262, 52, '2022004057', '2025-04-10', '11:03:10', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(263, 52, '2022004057', '2025-04-15', '09:47:32', '14:31:54', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(264, 52, '2022004057', '2025-04-16', '09:43:42', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(265, 53, '2022004058', '2025-04-06', '10:26:01', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(266, 53, '2022004058', '2025-04-07', '10:23:17', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(267, 53, '2022004058', '2025-04-08', '11:00:49', '14:15:53', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(268, 53, '2022004058', '2025-04-09', '09:55:59', '14:34:23', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(269, 53, '2022004058', '2025-04-10', '08:52:07', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(270, 53, '2022004058', '2025-04-13', '10:33:05', '16:11:36', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(271, 53, '2022004058', '2025-04-15', '10:18:09', '14:31:46', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(272, 53, '2022004058', '2025-04-16', '09:47:30', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(273, 54, '0178015289', '2025-04-06', '14:30:02', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(274, 54, '0178015289', '2025-04-07', '10:54:05', '13:12:05', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(275, 54, '0178015289', '2025-04-08', '10:12:44', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(276, 54, '0178015289', '2025-04-09', '11:21:34', '13:59:47', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(277, 54, '0178015289', '2025-04-10', '11:23:55', '13:47:40', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(278, 54, '0178015289', '2025-04-15', '09:41:56', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(279, 54, '0178015289', '2025-04-16', '09:40:11', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(280, 55, '2022004096', '2025-04-07', '10:25:13', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(281, 55, '2022004096', '2025-04-08', '10:18:22', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(282, 55, '2022004096', '2025-04-09', '14:18:43', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(283, 55, '2022004096', '2025-04-10', '11:16:39', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(284, 55, '2022004096', '2025-04-13', '12:01:05', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(285, 55, '2022004096', '2025-04-15', '10:19:44', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(286, 55, '2022004096', '2025-04-16', '10:00:24', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(287, 56, '2022004093', '2025-04-06', '09:47:07', '14:43:51', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(288, 56, '2022004093', '2025-04-07', '09:41:45', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(289, 56, '2022004093', '2025-04-08', '09:23:42', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(290, 56, '2022004093', '2025-04-09', '10:02:20', '13:10:45', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(291, 56, '2022004093', '2025-04-10', '09:32:00', '11:11:25', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(292, 56, '2022004093', '2025-04-13', '16:12:44', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(293, 56, '2022004093', '2025-04-15', '09:31:16', '12:54:39', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(294, 56, '2022004093', '2025-04-16', '09:56:52', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(295, 57, '2022004016', '2025-04-06', '10:13:50', '13:28:23', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(296, 57, '2022004016', '2025-04-08', '10:06:59', '13:41:30', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(297, 57, '2022004016', '2025-04-09', '11:11:51', '13:45:06', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(298, 57, '2022004016', '2025-04-10', '11:13:59', '14:07:17', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(299, 57, '2022004016', '2025-04-13', '16:15:36', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(300, 57, '2022004016', '2025-04-15', '10:05:29', '14:58:00', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(301, 58, '2022004097', '2025-04-06', '09:44:47', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(302, 58, '2022004097', '2025-04-08', '09:01:24', '13:11:29', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(303, 58, '2022004097', '2025-04-09', '09:06:23', '13:44:58', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(304, 58, '2022004097', '2025-04-10', '10:17:26', '13:28:04', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(305, 58, '2022004097', '2025-04-13', '16:10:55', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(306, 58, '2022004097', '2025-04-15', '09:02:42', '13:23:46', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(307, 58, '2022004097', '2025-04-16', '09:07:45', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(308, 59, '2022004010', '2025-04-06', '10:16:21', '14:59:54', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(309, 59, '2022004010', '2025-04-09', '11:15:31', '15:14:58', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(310, 59, '2022004010', '2025-04-10', '10:01:15', '15:27:57', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(311, 59, '2022004010', '2025-04-15', '09:54:35', '16:15:58', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(312, 59, '2022004010', '2025-04-16', '09:54:24', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(313, 60, '2024020061', '2025-04-06', '11:00:56', '11:00:59', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(314, 60, '2024020061', '2025-04-07', '12:38:37', '12:38:40', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(315, 60, '2024020061', '2025-04-08', '11:17:47', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(316, 60, '2024020061', '2025-04-09', '10:25:14', '10:25:16', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(317, 60, '2024020061', '2025-04-10', '11:24:30', '11:24:32', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(318, 60, '2024020061', '2025-04-15', '09:45:12', '09:45:15', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(319, 60, '2024020061', '2025-04-16', '10:01:21', '10:01:23', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(320, 62, '0107202406', '2025-04-06', '11:38:44', '13:59:52', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(321, 62, '0107202406', '2025-04-07', '12:11:00', '13:18:29', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(322, 62, '0107202406', '2025-04-08', '09:09:15', '12:35:26', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(323, 62, '0107202406', '2025-04-09', '12:37:36', '14:28:44', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(324, 62, '0107202406', '2025-04-10', '09:32:16', '13:18:49', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(325, 62, '0107202406', '2025-04-13', '12:13:32', '16:13:55', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(326, 62, '0107202406', '2025-04-15', '08:54:40', '14:26:11', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(327, 63, '1072024063', '2025-04-06', '14:00:53', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(328, 63, '1072024063', '2025-04-07', '09:59:38', '12:45:44', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(329, 63, '1072024063', '2025-04-08', '09:53:45', '13:46:03', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(330, 65, '01072024065', '2025-04-06', '09:23:28', '13:47:43', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(331, 65, '01072024065', '2025-04-07', '09:31:29', '13:47:14', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(332, 65, '01072024065', '2025-04-08', '09:41:28', '13:50:28', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(333, 65, '01072024065', '2025-04-09', '09:27:33', '13:46:17', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(334, 65, '01072024065', '2025-04-10', '09:39:13', '13:15:52', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(335, 65, '01072024065', '2025-04-13', '16:12:58', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(336, 65, '01072024065', '2025-04-15', '09:20:50', '14:07:27', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(337, 65, '01072024065', '2025-04-16', '09:31:20', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(338, 66, '01072024066', '2025-04-06', '09:10:09', '12:52:03', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(339, 66, '01072024066', '2025-04-07', '09:52:59', '12:45:49', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(340, 66, '01072024066', '2025-04-08', '08:46:19', '14:16:34', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(341, 66, '01072024066', '2025-04-09', '09:43:34', '14:31:14', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(342, 66, '01072024066', '2025-04-10', '10:47:07', '14:02:02', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(343, 66, '01072024066', '2025-04-15', '08:46:13', '14:42:16', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(344, 66, '01072024066', '2025-04-16', '09:18:59', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(345, 67, '01072024067', '2025-04-06', '09:40:56', '14:00:56', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(346, 67, '01072024067', '2025-04-07', '09:36:16', '13:45:05', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(347, 67, '01072024067', '2025-04-08', '09:55:59', '14:31:08', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(348, 67, '01072024067', '2025-04-09', '09:45:46', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(349, 67, '01072024067', '2025-04-10', '08:50:11', '14:01:56', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(350, 67, '01072024067', '2025-04-13', '12:29:07', '16:12:39', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(351, 67, '01072024067', '2025-04-15', '09:42:55', '14:48:59', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(352, 67, '01072024067', '2025-04-16', '09:46:00', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(353, 68, '01072024068', '2025-04-06', '09:30:09', '13:27:25', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(354, 68, '01072024068', '2025-04-07', '13:45:22', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(355, 68, '01072024068', '2025-04-08', '09:59:34', '14:03:27', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(356, 68, '01072024068', '2025-04-09', '09:00:31', '13:46:26', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(357, 68, '01072024068', '2025-04-10', '09:55:16', '13:49:10', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(358, 68, '01072024068', '2025-04-13', '12:29:17', '16:13:04', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(359, 68, '01072024068', '2025-04-15', '09:38:00', '14:54:44', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(360, 68, '01072024068', '2025-04-16', '09:00:19', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(361, 69, '01072024069', '2025-04-06', '09:45:04', '13:19:28', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(362, 69, '01072024069', '2025-04-07', '09:42:05', '13:20:20', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(363, 69, '01072024069', '2025-04-08', '10:08:04', '14:08:59', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(364, 69, '01072024069', '2025-04-09', '10:05:46', '14:06:14', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(365, 69, '01072024069', '2025-04-10', '09:44:45', '13:49:16', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(366, 69, '01072024069', '2025-04-13', '16:19:00', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(367, 69, '01072024069', '2025-04-15', '09:00:33', '14:03:57', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(368, 69, '01072024069', '2025-04-16', '09:35:28', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(369, 70, '0005302073', '2025-04-06', '08:51:29', '13:18:10', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(370, 70, '0005302073', '2025-04-07', '09:47:28', '13:51:21', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(371, 70, '0005302073', '2025-04-08', '10:23:35', '14:14:55', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(372, 70, '0005302073', '2025-04-09', '10:23:55', '14:32:40', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(373, 70, '0005302073', '2025-04-10', '10:28:48', '14:11:41', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(374, 70, '0005302073', '2025-04-13', '08:57:33', '16:10:46', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(375, 70, '0005302073', '2025-04-15', '09:51:57', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(376, 70, '0005302073', '2025-04-16', '09:45:16', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(377, 71, '2022004004', '2025-04-06', '13:18:08', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(378, 71, '2022004004', '2025-04-10', '09:31:44', '14:02:00', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(379, 71, '2022004004', '2025-04-15', '09:49:54', '14:28:17', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(380, 72, '2022004003', '2025-04-06', '10:24:53', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(381, 72, '2022004003', '2025-04-07', '11:09:22', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(382, 72, '2022004003', '2025-04-08', '11:30:01', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(383, 72, '2022004003', '2025-04-09', '11:52:12', '13:02:08', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(384, 72, '2022004003', '2025-04-10', '10:59:43', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(385, 72, '2022004003', '2025-04-15', '11:33:11', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(386, 74, '01970495772', '2025-04-06', '09:59:35', '13:27:52', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(387, 74, '01970495772', '2025-04-07', '10:06:34', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(388, 74, '01970495772', '2025-04-08', '09:44:20', '14:29:44', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(389, 74, '01970495772', '2025-04-09', '11:19:00', '13:41:13', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(390, 74, '01970495772', '2025-04-13', '16:12:32', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(391, 74, '01970495772', '2025-04-15', '10:07:54', '14:40:19', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31'),
(392, 74, '01970495772', '2025-04-16', '09:27:46', '---', 'Present', '2025-04-16 04:09:31', '2025-04-16 04:09:31');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academic_holidays`
--
ALTER TABLE `academic_holidays`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `teacher_machine_attendances`
--
ALTER TABLE `teacher_machine_attendances`
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
-- AUTO_INCREMENT for table `academic_holidays`
--
ALTER TABLE `academic_holidays`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `office_holidays`
--
ALTER TABLE `office_holidays`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `teacher_attendances`
--
ALTER TABLE `teacher_attendances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teacher_leave_applications`
--
ALTER TABLE `teacher_leave_applications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `teacher_machine_attendances`
--
ALTER TABLE `teacher_machine_attendances`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=393;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
