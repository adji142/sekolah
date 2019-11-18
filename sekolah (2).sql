-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 17, 2019 at 04:29 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sekolah`
--

-- --------------------------------------------------------

--
-- Table structure for table `academic_years`
--

CREATE TABLE IF NOT EXISTS `academic_years` (
`id` bigint(20) unsigned NOT NULL,
  `academic_year` varchar(9) NOT NULL COMMENT 'Tahun Pelajaran',
  `semester` enum('odd','even') NOT NULL DEFAULT 'odd' COMMENT 'odd = Ganjil, even = Genap',
  `current_semester` enum('true','false') NOT NULL DEFAULT 'false',
  `admission_semester` enum('true','false') NOT NULL DEFAULT 'false',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `achievements`
--

CREATE TABLE IF NOT EXISTS `achievements` (
`id` bigint(20) unsigned NOT NULL,
  `student_id` bigint(20) DEFAULT '0',
  `achievement_description` varchar(255) NOT NULL,
  `achievement_type` bigint(20) DEFAULT '0',
  `achievement_level` smallint(6) NOT NULL DEFAULT '0',
  `achievement_year` year(4) NOT NULL,
  `achievement_organizer` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `admission_phases`
--

CREATE TABLE IF NOT EXISTS `admission_phases` (
`id` bigint(20) unsigned NOT NULL,
  `academic_year_id` bigint(20) DEFAULT '0' COMMENT 'Tahun Pelajaran',
  `phase_name` varchar(255) NOT NULL COMMENT 'Gelombang Pendaftaran',
  `phase_start_date` date DEFAULT NULL COMMENT 'Tanggal Mulai',
  `phase_end_date` date DEFAULT NULL COMMENT 'Tanggal Selesai',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `admission_quotas`
--

CREATE TABLE IF NOT EXISTS `admission_quotas` (
`id` bigint(20) unsigned NOT NULL,
  `academic_year_id` bigint(20) DEFAULT '0' COMMENT 'Tahun Pelajaran',
  `admission_type_id` bigint(20) DEFAULT '0' COMMENT 'Jalur Pendaftaran',
  `major_id` bigint(20) DEFAULT '0' COMMENT 'Program Keahlian',
  `quota` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Kuota Pendaftaran',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `albums`
--

CREATE TABLE IF NOT EXISTS `albums` (
`id` bigint(20) unsigned NOT NULL,
  `album_title` varchar(255) NOT NULL,
  `album_description` varchar(255) DEFAULT NULL,
  `album_slug` varchar(255) DEFAULT NULL,
  `album_cover` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `albums`
--

INSERT INTO `albums` (`id`, `album_title`, `album_description`, `album_slug`, `album_cover`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Juara 1 Lomba Krenova Pelajar Tingkat Kabupaten', '', 'juara-1-lomba-krenova-pelajar-tingkat-kabupaten', '653b74e23e5eacc56df56a630a89d5b0.jpg', '2019-10-24 12:55:26', '2019-10-24 05:57:11', NULL, NULL, 1, 1, 0, 0, 'false'),
(2, 'CONTOH', '', 'contoh', 'f9ccabfad1b6a9b90e54a76c47e87567.jpg', '2019-10-25 14:00:55', '2019-10-25 07:01:45', NULL, NULL, 2, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `answers`
--

CREATE TABLE IF NOT EXISTS `answers` (
`id` bigint(20) unsigned NOT NULL,
  `question_id` bigint(20) DEFAULT '0',
  `answer` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
`id` bigint(20) unsigned NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `category_slug` varchar(255) DEFAULT NULL,
  `category_description` varchar(255) DEFAULT NULL,
  `category_type` enum('post','file') DEFAULT 'post',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `category_slug`, `category_description`, `category_type`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Kegiatan', 'kegiatan', 'kegiatan', 'post', '2019-09-14 08:57:42', '2019-10-17 05:55:16', NULL, NULL, 0, 1, 0, 0, 'false'),
(2, 'Download', 'download', 'download', 'file', '2019-09-14 08:57:42', '2019-10-24 05:42:57', NULL, NULL, 0, 1, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `class_groups`
--

CREATE TABLE IF NOT EXISTS `class_groups` (
`id` bigint(20) unsigned NOT NULL,
  `class_group` varchar(100) DEFAULT NULL,
  `sub_class_group` varchar(100) DEFAULT NULL,
  `major_id` bigint(20) DEFAULT '0' COMMENT 'Program Keahlian',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `class_group_settings`
--

CREATE TABLE IF NOT EXISTS `class_group_settings` (
`id` bigint(20) unsigned NOT NULL,
  `academic_year_id` bigint(20) DEFAULT '0' COMMENT 'FK dari academic_years',
  `class_group_id` bigint(20) DEFAULT '0' COMMENT 'Kelas, FK dari class_groups',
  `employee_id` bigint(20) DEFAULT '0' COMMENT 'Wali Kelas, FK dari employees',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `class_group_students`
--

CREATE TABLE IF NOT EXISTS `class_group_students` (
`id` bigint(20) unsigned NOT NULL,
  `class_group_setting_id` bigint(20) DEFAULT '0',
  `student_id` bigint(20) DEFAULT '0',
  `is_class_manager` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Ketua Kelas ?',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
`id` bigint(20) unsigned NOT NULL,
  `comment_post_id` bigint(20) DEFAULT '0',
  `comment_author` varchar(255) NOT NULL,
  `comment_email` varchar(255) DEFAULT NULL,
  `comment_url` varchar(255) DEFAULT NULL,
  `comment_ip_address` varchar(255) NOT NULL,
  `comment_content` text NOT NULL,
  `comment_subject` varchar(255) DEFAULT NULL,
  `comment_reply` text,
  `comment_status` enum('approved','unapproved','spam') DEFAULT 'approved',
  `comment_agent` varchar(255) DEFAULT NULL,
  `comment_parent_id` varchar(255) DEFAULT NULL,
  `comment_type` enum('post','message') DEFAULT 'post',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE IF NOT EXISTS `employees` (
`id` bigint(20) unsigned NOT NULL,
  `assignment_letter_number` varchar(255) DEFAULT NULL COMMENT 'Nomor Surat Tugas',
  `assignment_letter_date` date DEFAULT NULL COMMENT 'Tanggal Surat Tugas',
  `assignment_start_date` date DEFAULT NULL COMMENT 'TMT Tugas',
  `parent_school_status` enum('true','false') NOT NULL DEFAULT 'true' COMMENT 'Status Sekolah Induk',
  `full_name` varchar(150) NOT NULL,
  `gender` enum('M','F') NOT NULL DEFAULT 'M',
  `nik` varchar(50) DEFAULT NULL,
  `birth_place` varchar(255) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `mother_name` varchar(150) DEFAULT NULL,
  `street_address` varchar(255) DEFAULT NULL COMMENT 'Alamat Jalan',
  `rt` varchar(10) DEFAULT NULL COMMENT 'Rukun Tetangga',
  `rw` varchar(10) DEFAULT NULL COMMENT 'Rukun Warga',
  `sub_village` varchar(255) DEFAULT NULL COMMENT 'Nama Dusun',
  `village` varchar(255) DEFAULT NULL COMMENT 'Nama Kelurahan/ Desa',
  `sub_district` varchar(255) DEFAULT NULL COMMENT 'Kecamatan',
  `district` varchar(255) DEFAULT NULL COMMENT 'Kabupaten',
  `postal_code` varchar(20) DEFAULT NULL COMMENT 'Kode POS',
  `religion_id` bigint(20) DEFAULT '0',
  `marriage_status_id` bigint(20) DEFAULT '0',
  `spouse_name` varchar(255) DEFAULT NULL COMMENT 'Nama Pasangan : Suami / Istri',
  `spouse_employment_id` bigint(20) DEFAULT '0' COMMENT 'Pekerjaan Pasangan : Suami / Istri',
  `citizenship` enum('WNI','WNA') NOT NULL DEFAULT 'WNI' COMMENT 'Kewarganegaraan',
  `country` varchar(255) DEFAULT NULL,
  `npwp` varchar(100) DEFAULT NULL,
  `employment_status_id` bigint(20) DEFAULT '0' COMMENT 'Status Kepegawaian',
  `nip` varchar(100) DEFAULT NULL,
  `niy` varchar(100) DEFAULT NULL COMMENT 'NIY/NIGK',
  `nuptk` varchar(100) DEFAULT NULL,
  `employment_type_id` bigint(20) DEFAULT '0' COMMENT 'Jenis Guru dan Tenaga Kependidikan (GTK)',
  `decree_appointment` varchar(255) DEFAULT NULL COMMENT 'SK Pengangkatan',
  `appointment_start_date` date DEFAULT NULL COMMENT 'TMT Pengangkatan',
  `institution_lifter_id` bigint(20) DEFAULT '0' COMMENT 'Lembaga Pengangkat',
  `decree_cpns` varchar(100) DEFAULT NULL COMMENT 'SK CPNS',
  `pns_start_date` date DEFAULT NULL COMMENT 'TMT CPNS',
  `rank_id` bigint(20) DEFAULT '0' COMMENT 'Pangkat / Golongan',
  `salary_source_id` bigint(20) DEFAULT '0' COMMENT 'Sumber Gaji',
  `headmaster_license` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Punya Lisensi Kepala Sekolah ?',
  `laboratory_skill_id` bigint(20) DEFAULT '0' COMMENT 'Keahlian Lab oratorium',
  `special_need_id` bigint(20) DEFAULT '0' COMMENT 'Mampu Menangani Kebutuhan Khusus',
  `braille_skills` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Keahlian Braile ?',
  `sign_language_skills` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Keahlian Bahasa Isyarat ?',
  `phone` varchar(255) DEFAULT NULL,
  `mobile_phone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `assignment_letter_number`, `assignment_letter_date`, `assignment_start_date`, `parent_school_status`, `full_name`, `gender`, `nik`, `birth_place`, `birth_date`, `mother_name`, `street_address`, `rt`, `rw`, `sub_village`, `village`, `sub_district`, `district`, `postal_code`, `religion_id`, `marriage_status_id`, `spouse_name`, `spouse_employment_id`, `citizenship`, `country`, `npwp`, `employment_status_id`, `nip`, `niy`, `nuptk`, `employment_type_id`, `decree_appointment`, `appointment_start_date`, `institution_lifter_id`, `decree_cpns`, `pns_start_date`, `rank_id`, `salary_source_id`, `headmaster_license`, `laboratory_skill_id`, `special_need_id`, `braille_skills`, `sign_language_skills`, `phone`, `mobile_phone`, `email`, `photo`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, '12345', '0000-00-00', '0000-00-00', 'true', 'bambang', 'M', '1', '', '0000-00-00', '', '', '', '', '', '', '', '', '', 89, 103, '', 10, 'WNI', '', NULL, 113, NULL, NULL, '', 124, '', '0000-00-00', 106, '', '0000-00-00', 135, 152, 'true', 159, 23, 'true', 'true', '', '', 'a@email.com', NULL, '2019-10-17 11:22:52', '2019-10-17 04:22:52', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `files`
--

CREATE TABLE IF NOT EXISTS `files` (
`id` bigint(20) unsigned NOT NULL,
  `file_title` varchar(255) DEFAULT NULL,
  `file_description` varchar(255) DEFAULT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  `file_category_id` bigint(20) DEFAULT '0',
  `file_path` varchar(255) DEFAULT NULL,
  `file_ext` varchar(255) DEFAULT NULL,
  `file_size` varchar(255) DEFAULT NULL,
  `file_visibility` enum('public','private') DEFAULT 'public',
  `file_counter` bigint(20) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `files`
--

INSERT INTO `files` (`id`, `file_title`, `file_description`, `file_name`, `file_type`, `file_category_id`, `file_path`, `file_ext`, `file_size`, `file_visibility`, `file_counter`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Pengumuman Kegiatan PPTA Kelas X Tahun Ajaran 2018/2019', NULL, 'd305bdf4171a776bb6d0401e7b38244c.pdf', 'application/pdf', 2, 'C:/xampp/htdocs/sekolah/media_library/files/', '.pdf', '569.69', 'public', 1, '2019-10-24 12:40:11', '2019-10-24 05:49:25', NULL, NULL, 1, 1, 0, 0, 'false'),
(2, 'Perlengkapan Siswa Baru Pada Kegiatan Pengenalan Lingkungan Sekolah 2018/ 2019', NULL, '4e81d43b0b265e49f30c55bbf478d81f.pdf', 'application/pdf', 2, 'C:/xampp/htdocs/sekolah/media_library/files/', '.pdf', '143.14', 'public', 0, '2019-10-24 12:49:55', '2019-10-24 05:50:05', NULL, NULL, 1, 0, 0, 0, 'false'),
(3, 'Rundown Kegiatan Pengenalan Lingkungan Sekolah 2018/2019', NULL, 'dabc6d54d111057b10dd3134552334cb.pdf', 'application/pdf', 2, 'C:/xampp/htdocs/sekolah/media_library/files/', '.pdf', '93.96', 'public', 0, '2019-10-24 12:50:25', '2019-10-24 05:50:34', NULL, NULL, 1, 0, 0, 0, 'false'),
(4, 'gambar', NULL, '73fb2976e309d9442791a8b581003ad6.pdf', 'application/pdf', 2, 'C:/xampp/htdocs/sekolah/media_library/files/', '.pdf', '274.69', 'public', 0, '2019-11-04 13:26:46', '2019-11-04 06:27:24', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `image_sliders`
--

CREATE TABLE IF NOT EXISTS `image_sliders` (
`id` bigint(20) unsigned NOT NULL,
  `caption` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `image_sliders`
--

INSERT INTO `image_sliders` (`id`, `caption`, `image`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Smait Nur Hidayah Mengusung Kearifan Lokal Jamu dalam Upacara HUT Pramuka ke-58', '860a2a0e65b0ad41248be9315fa1b6f7.jpeg', '2019-09-14 08:57:43', '2019-10-17 05:33:15', NULL, NULL, 0, 1, 0, 0, 'false'),
(2, 'Qurban Go Green Ala SMA IT Nur Hidayah', '6a265f68cd6f9e4f9d75effb80fbc3a1.jpg', '2019-09-14 08:57:43', '2019-10-17 05:35:20', NULL, NULL, 0, 1, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `links`
--

CREATE TABLE IF NOT EXISTS `links` (
`id` bigint(20) unsigned NOT NULL,
  `link_title` varchar(255) NOT NULL,
  `link_url` varchar(255) DEFAULT NULL,
  `link_target` enum('_blank','_self','_parent','_top') DEFAULT '_blank',
  `link_image` varchar(100) DEFAULT NULL,
  `link_type` enum('link','banner') DEFAULT 'link',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `links`
--

INSERT INTO `links` (`id`, `link_title`, `link_url`, `link_target`, `link_image`, `link_type`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Yayasan Nur Hidayah', 'http://ynhsolo.or.id/', '_blank', NULL, 'link', '2019-09-14 08:57:43', '2019-11-03 04:59:36', NULL, NULL, 0, 1, 0, 0, 'false'),
(2, 'CMS Sekolahku', 'https://sekolahku.web.id', '_blank', '1.png', 'banner', '2019-09-14 08:57:43', '2019-09-14 01:57:43', NULL, NULL, 0, 0, 0, 0, 'false'),
(3, 'SMPIT Nur Hidayah', 'http://smpitnurhidayah.sch.id/', '_blank', NULL, 'link', '2019-11-03 11:58:29', '2019-11-03 04:58:29', NULL, NULL, 1, 0, 0, 0, 'false'),
(4, 'SDIT Nur Hidayah', 'http://sditnurhidayah.sch.id/', '_blank', NULL, 'link', '2019-11-03 12:00:34', '2019-11-03 05:00:34', NULL, NULL, 1, 0, 0, 0, 'false'),
(5, 'PAUDIT Nur Hidayah', 'http://pauditnurhidayah.sch.id/', '_blank', NULL, 'link', '2019-11-03 12:01:09', '2019-11-03 05:01:09', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE IF NOT EXISTS `login_attempts` (
`id` bigint(20) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `counter` int(11) unsigned NOT NULL DEFAULT '1',
  `datetime` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `majors`
--

CREATE TABLE IF NOT EXISTS `majors` (
`id` bigint(20) unsigned NOT NULL,
  `major_name` varchar(255) DEFAULT NULL COMMENT 'Program Keahlian / Jurusan',
  `major_short_name` varchar(255) DEFAULT NULL COMMENT 'Nama Singkat',
  `is_active` enum('true','false') DEFAULT 'true',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE IF NOT EXISTS `menus` (
`id` bigint(20) unsigned NOT NULL,
  `menu_title` varchar(150) NOT NULL,
  `menu_url` varchar(150) NOT NULL,
  `menu_target` enum('_blank','_self','_parent','_top') DEFAULT '_self',
  `menu_type` varchar(100) NOT NULL DEFAULT 'pages',
  `menu_parent_id` bigint(20) DEFAULT '0',
  `menu_position` bigint(20) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menus`
--

INSERT INTO `menus` (`id`, `menu_title`, `menu_url`, `menu_target`, `menu_type`, `menu_parent_id`, `menu_position`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(2, 'Galeri Foto', 'galeri-foto', '_self', 'modules', 9, 1, '2019-09-14 08:57:43', '2019-10-17 05:40:31', NULL, NULL, 0, 0, 0, 0, 'false'),
(3, 'Galeri Video', 'galeri-video', '_self', 'modules', 9, 2, '2019-09-14 08:57:43', '2019-10-17 05:40:31', NULL, NULL, 0, 0, 0, 0, 'false'),
(8, 'INFO PPDB', 'https://sis.smaitnurhidayah.sch.id/pendaftaran', '_blank', 'links', 0, 5, '2019-09-14 08:57:43', '2019-11-17 15:10:36', NULL, '2019-11-17 22:10:36', 0, 2, 0, 2, 'false'),
(9, 'Galeri', '#', '_self', 'links', 0, 6, '2019-09-14 08:57:43', '2019-11-04 06:30:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(10, 'Kesiswaan', '#', '', 'links', 0, 2, '2019-09-14 08:57:43', '2019-11-04 06:30:22', NULL, '2019-10-17 11:41:12', 0, 1, 0, 1, 'false'),
(12, 'Direktori', '#', '', 'links', 0, 3, '2019-09-14 08:57:43', '2019-10-17 04:24:24', '2019-10-17 11:24:24', NULL, 0, 1, 1, 0, 'true'),
(15, 'Direktori Guru dan Tenaga Kependidikan', 'direktori-guru-dan-tenaga-kependidikan', '_self', 'modules', 12, 1, '2019-09-14 08:57:43', '2019-10-17 04:19:33', NULL, NULL, 0, 0, 0, 0, 'false'),
(17, 'Profil', 'read/2/profil', '', 'pages', 0, 1, '2019-09-14 08:57:43', '2019-10-17 04:20:02', NULL, '2019-10-17 11:20:02', 0, 1, 0, 1, 'false'),
(18, 'Visi dan Misi', 'read/3/visi-dan-misi', '', 'pages', 17, 1, '2019-09-14 08:57:43', '2019-10-17 04:19:33', NULL, '2019-10-17 11:09:04', 0, 1, 0, 1, 'false'),
(19, 'Struktur Organisasi', 'read/9/struktur-organisasi', '_self', 'pages', 17, 2, '2019-10-17 11:28:56', '2019-10-17 04:29:09', NULL, NULL, 1, 0, 0, 0, 'false'),
(20, 'Civitas', 'read/10/civitas', '_self', 'pages', 17, 3, '2019-10-17 11:36:01', '2019-10-17 04:36:08', NULL, NULL, 1, 0, 0, 0, 'false'),
(21, 'Karakteristik', 'read/11/karakteristik', '_self', 'pages', 17, 4, '2019-10-17 11:38:55', '2019-10-17 04:39:19', NULL, NULL, 1, 0, 0, 0, 'false'),
(22, 'Prestasi', 'read/12/prestasi', '_self', 'pages', 10, 1, '2019-10-17 11:47:37', '2019-11-02 16:08:52', NULL, NULL, 1, 0, 0, 0, 'false'),
(23, 'Organisasi', '#', '_self', 'links', 10, 2, '2019-10-17 11:52:00', '2019-11-02 16:08:52', NULL, NULL, 1, 0, 0, 0, 'false'),
(24, 'Osis', 'read/13/osis', '_self', 'pages', 23, 1, '2019-10-17 11:52:46', '2019-10-17 04:53:07', NULL, NULL, 1, 0, 0, 0, 'false'),
(25, 'Pramuka', 'read/14/pramuka', '_self', 'pages', 23, 2, '2019-10-17 11:53:49', '2019-10-17 04:54:06', NULL, NULL, 1, 0, 0, 0, 'false'),
(26, 'Ekstrakulikuler', 'read/15/ekstrakulikuler', '_self', 'pages', 10, 3, '2019-10-17 11:56:18', '2019-11-02 16:08:52', NULL, NULL, 1, 0, 0, 0, 'false'),
(27, 'Alumni', 'read/16/alumni', '_self', 'pages', 10, 4, '2019-10-17 11:56:58', '2019-11-02 16:08:52', NULL, NULL, 1, 0, 0, 0, 'false'),
(28, 'Akademik', '#', '_self', 'links', 0, 3, '2019-10-17 11:57:44', '2019-11-04 06:30:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(29, 'Kurikulum', 'read/17/kurikulum', '_self', 'pages', 28, 1, '2019-10-17 11:58:26', '2019-10-17 04:58:39', NULL, NULL, 1, 0, 0, 0, 'false'),
(30, 'Pedoman Akademik', 'read/18/pedoman-akademik', '_self', 'pages', 28, 2, '2019-10-17 11:59:06', '2019-10-17 04:59:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(31, 'Fasilitas', '#', '_self', 'links', 0, 4, '2019-10-17 11:59:57', '2019-11-04 06:30:22', NULL, NULL, 1, 0, 0, 0, 'false'),
(32, 'Kampus 1', 'read/19/kampus-1', '_self', 'pages', 31, 1, '2019-10-17 12:01:11', '2019-10-17 05:01:26', NULL, NULL, 1, 0, 0, 0, 'false'),
(33, 'Kampus 2', 'read/20/kampus-2', '_self', 'pages', 31, 2, '2019-10-17 12:01:11', '2019-10-17 05:01:26', NULL, NULL, 1, 0, 0, 0, 'false'),
(34, 'Wisma', 'read/21/wisma', '_self', 'pages', 31, 3, '2019-10-17 12:01:12', '2019-10-17 05:01:26', NULL, NULL, 1, 0, 0, 0, 'false'),
(36, 'Download', 'download/download', '_self', 'file_categories', 0, 7, '2019-11-04 13:39:07', '2019-11-04 06:39:29', NULL, NULL, 1, 0, 0, 0, 'false'),
(37, 'MPS', 'read/28/mps', '_self', 'pages', 23, 3, '2019-11-06 11:34:59', '2019-11-06 04:35:16', NULL, NULL, 2, 0, 0, 0, 'false'),
(38, 'Hubungi Kami', 'read/24/hubungi-kami', '_self', 'pages', 0, 8, '2019-11-17 22:20:18', '2019-11-17 15:20:40', NULL, NULL, 2, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE IF NOT EXISTS `modules` (
`id` bigint(20) unsigned NOT NULL,
  `module_name` varchar(255) NOT NULL,
  `module_description` varchar(255) DEFAULT NULL,
  `module_url` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `module_name`, `module_description`, `module_url`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Pengguna', 'Pengguna', 'users', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(3, 'Tampilan', 'Tampilan', 'appearance', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(4, 'Blog', 'Blog', 'blog', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(6, 'Media', 'Media', 'media', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(7, 'Plugins', 'Plugins', 'plugins', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(9, 'Pengaturan', 'Pengaturan', 'settings', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE IF NOT EXISTS `options` (
`id` bigint(20) unsigned NOT NULL,
  `option_group` varchar(100) NOT NULL,
  `option_name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `option_group`, `option_name`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'student_status', 'Aktif', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(2, 'student_status', 'Lulus', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(3, 'student_status', 'Mutasi', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(4, 'student_status', 'Dikeluarkan', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(5, 'student_status', 'Mengundurkan Diri', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(6, 'student_status', 'Putus Sekolah', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(7, 'student_status', 'Meninggal', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(8, 'student_status', 'Hilang', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(9, 'student_status', 'Lainnya', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(10, 'employments', 'Tidak bekerja', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(11, 'employments', 'Nelayan', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(12, 'employments', 'Petani', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(13, 'employments', 'Peternak', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(14, 'employments', 'PNS/TNI/POLRI', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(15, 'employments', 'Karyawan Swasta', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(16, 'employments', 'Pedagang Kecil', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(17, 'employments', 'Pedagang Besar', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(18, 'employments', 'Wiraswasta', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(19, 'employments', 'Wirausaha', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(20, 'employments', 'Buruh', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(21, 'employments', 'Pensiunan', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(22, 'employments', 'Lain-lain', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(23, 'special_needs', 'Tidak', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(24, 'special_needs', 'Tuna Netra', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(25, 'special_needs', 'Tuna Rungu', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(26, 'special_needs', 'Tuna Grahita ringan', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(27, 'special_needs', 'Tuna Grahita Sedang', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(28, 'special_needs', 'Tuna Daksa Ringan', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(29, 'special_needs', 'Tuna Daksa Sedang', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(30, 'special_needs', 'Tuna Laras', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(31, 'special_needs', 'Tuna Wicara', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(32, 'special_needs', 'Tuna ganda', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(33, 'special_needs', 'Hiper aktif', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(34, 'special_needs', 'Cerdas Istimewa', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(35, 'special_needs', 'Bakat Istimewa', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(36, 'special_needs', 'Kesulitan Belajar', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(37, 'special_needs', 'Narkoba', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(38, 'special_needs', 'Indigo', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(39, 'special_needs', 'Down Sindrome', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(40, 'special_needs', 'Autis', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(41, 'special_needs', 'Lainnya', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(42, 'educations', 'Tidak sekolah', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(43, 'educations', 'Putus SD', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(44, 'educations', 'SD Sederajat', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(45, 'educations', 'SMP Sederajat', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(46, 'educations', 'SMA Sederajat', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(47, 'educations', 'D1', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(48, 'educations', 'D2', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(49, 'educations', 'D3', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(50, 'educations', 'D4/S1', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(51, 'educations', 'S2', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(52, 'educations', 'S3', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(53, 'scholarships', 'Anak berprestasi', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(54, 'scholarships', 'Anak Miskin', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(55, 'scholarships', 'Pendidikan', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(56, 'scholarships', 'Unggulan', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(57, 'scholarships', 'Lain-lain', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(58, 'achievement_types', 'Sains', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(59, 'achievement_types', 'Seni', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(60, 'achievement_types', 'Olahraga', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(61, 'achievement_types', 'Lain-lain', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(62, 'achievement_levels', 'Sekolah', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(63, 'achievement_levels', 'Kecamatan', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(64, 'achievement_levels', 'Kabupaten', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(65, 'achievement_levels', 'Provinsi', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(66, 'achievement_levels', 'Nasional', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(67, 'achievement_levels', 'Internasional', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(68, 'monthly_incomes', 'Kurang dari 500,000', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(69, 'monthly_incomes', '500.000 - 999.9999', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(70, 'monthly_incomes', '1 Juta - 1.999.999', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(71, 'monthly_incomes', '2 Juta - 4.999.999', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(72, 'monthly_incomes', '5 Juta - 20 Juta', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(73, 'monthly_incomes', 'Lebih dari 20 Juta', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(74, 'residences', 'Bersama orang tua', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(75, 'residences', 'Wali', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(76, 'residences', 'Kos', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(77, 'residences', 'Asrama', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(78, 'residences', 'Panti Asuhan', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(79, 'residences', 'Lainnya', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(80, 'transportations', 'Jalan kaki', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(81, 'transportations', 'Kendaraan pribadi', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(82, 'transportations', 'Kendaraan Umum / angkot / Pete-pete', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(83, 'transportations', 'Jemputan Sekolah', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(84, 'transportations', 'Kereta Api', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(85, 'transportations', 'Ojek', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(86, 'transportations', 'Andong / Bendi / Sado / Dokar / Delman / Beca', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(87, 'transportations', 'Perahu penyebrangan / Rakit / Getek', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(88, 'transportations', 'Lainnya', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(89, 'religions', 'Islam', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(90, 'religions', 'Kristen / protestan', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(91, 'religions', 'Katholik', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(92, 'religions', 'Hindu', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(93, 'religions', 'Budha', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(94, 'religions', 'Khong Hu Chu', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(95, 'religions', 'Lainnya', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(96, 'school_levels', '1 - Sekolah Dasar (SD) / Sederajat', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(97, 'school_levels', '2 - Sekolah Menengah Pertama (SMP) / Sederajat', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(98, 'school_levels', '3 - Sekolah Menengah Atas (SMA) / Aliyah', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(99, 'school_levels', '4 - Sekolah Menengah Kejuruan (SMK)', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(100, 'school_levels', '5 - Universitas', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(101, 'school_levels', '6 - Sekolah Tinggi', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(102, 'school_levels', '7 - Politeknik', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(103, 'marriage_status', 'Kawin', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(104, 'marriage_status', 'Belum Kawin', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(105, 'marriage_status', 'Berpisah', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(106, 'institution_lifters', 'Pemerintah Pusat', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(107, 'institution_lifters', 'Pemerintah Provinsi', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(108, 'institution_lifters', 'Pemerintah Kab/Kota', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(109, 'institution_lifters', 'Ketua yayasan', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(110, 'institution_lifters', 'Kepala Sekolah', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(111, 'institution_lifters', 'Komite Sekolah', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(112, 'institution_lifters', 'Lainnya', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(113, 'employment_status', 'PNS ', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(114, 'employment_status', 'PNS Diperbantukan ', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(115, 'employment_status', 'PNS DEPAG ', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(116, 'employment_status', 'GTY/PTY ', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(117, 'employment_status', 'GTT/PTT Provinsi ', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(118, 'employment_status', 'GTT/PTT Kabupaten/Kota', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(119, 'employment_status', 'Guru Bantu Pusat ', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(120, 'employment_status', 'Guru Honor Sekolah ', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(121, 'employment_status', 'Tenaga Honor Sekolah ', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(122, 'employment_status', 'CPNS', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(123, 'employment_status', 'Lainnya', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(124, 'employment_types', 'Guru Kelas', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(125, 'employment_types', 'Guru Mata Pelajaran', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(126, 'employment_types', 'Guru BK', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(127, 'employment_types', 'Guru Inklusi', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(128, 'employment_types', 'Tenaga Administrasi Sekolah', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(129, 'employment_types', 'Guru Pendamping', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(130, 'employment_types', 'Guru Magang', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(131, 'employment_types', 'Guru TIK', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(132, 'employment_types', 'Laboran', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(133, 'employment_types', 'Pustakawan', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(134, 'employment_types', 'Lainnya', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(135, 'ranks', 'I/A', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(136, 'ranks', 'I/B', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(137, 'ranks', 'I/C', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(138, 'ranks', 'I/D', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(139, 'ranks', 'II/A', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(140, 'ranks', 'II/B', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(141, 'ranks', 'II/C', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(142, 'ranks', 'II/D', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(143, 'ranks', 'III/A', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(144, 'ranks', 'III/B', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(145, 'ranks', 'III/C', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(146, 'ranks', 'III/D', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(147, 'ranks', 'IV/A', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(148, 'ranks', 'IV/B', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(149, 'ranks', 'IV/C', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(150, 'ranks', 'IV/D', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(151, 'ranks', 'IV/E', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(152, 'salary_sources', 'APBN', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(153, 'salary_sources', 'APBD Provinsi', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(154, 'salary_sources', 'APBD Kab/Kota', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(155, 'salary_sources', 'Yayasan', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(156, 'salary_sources', 'Sekolah', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(157, 'salary_sources', 'Lembaga Donor', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(158, 'salary_sources', 'Lainnya', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(159, 'laboratory_skills', 'Lab IPA', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(160, 'laboratory_skills', 'Lab Fisika', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(161, 'laboratory_skills', 'Lab Biologi', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(162, 'laboratory_skills', 'Lab Kimia', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(163, 'laboratory_skills', 'Lab Bahasa', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(164, 'laboratory_skills', 'Lab Komputer', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(165, 'laboratory_skills', 'Teknik Bangunan', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(166, 'laboratory_skills', 'Teknik Survei & Pemetaan', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(167, 'laboratory_skills', 'Teknik Ketenagakerjaan', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(168, 'laboratory_skills', 'Teknik Pendinginan & Tata Udara', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(169, 'laboratory_skills', 'Teknik Mesin', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `photos`
--

CREATE TABLE IF NOT EXISTS `photos` (
`id` bigint(20) unsigned NOT NULL,
  `photo_album_id` bigint(20) DEFAULT '0',
  `photo_name` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `photos`
--

INSERT INTO `photos` (`id`, `photo_album_id`, `photo_name`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 1, '17bffddaab143e3fac7e1d50afc3aef0.jpg', '2019-10-24 12:55:45', '2019-10-24 05:55:45', NULL, NULL, 1, 0, 0, 0, 'false'),
(2, 2, '35ad0a8dc91052dec5db07f81f851134.jpg', '2019-10-25 14:01:11', '2019-10-25 07:01:11', NULL, NULL, 2, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `pollings`
--

CREATE TABLE IF NOT EXISTS `pollings` (
`id` bigint(20) unsigned NOT NULL,
  `answer_id` bigint(20) DEFAULT '0',
  `ip_address` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
`id` bigint(20) unsigned NOT NULL,
  `post_title` varchar(255) DEFAULT NULL,
  `post_content` longtext,
  `post_image` varchar(100) DEFAULT NULL,
  `post_author` bigint(20) DEFAULT '0',
  `post_categories` varchar(255) DEFAULT NULL,
  `post_type` varchar(50) NOT NULL DEFAULT 'post',
  `post_status` enum('publish','draft') DEFAULT 'draft',
  `post_visibility` enum('public','private') DEFAULT 'public',
  `post_comment_status` enum('open','close') DEFAULT 'close',
  `post_slug` varchar(255) DEFAULT NULL,
  `post_tags` varchar(255) DEFAULT NULL,
  `post_counter` bigint(20) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `post_title`, `post_content`, `post_image`, `post_author`, `post_categories`, `post_type`, `post_status`, `post_visibility`, `post_comment_status`, `post_slug`, `post_tags`, `post_counter`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, '', '<p>-</p>', 'headmaster_photo.png', 0, '', 'opening_speech', 'publish', 'public', 'open', '', '', 0, '2019-09-14 08:57:43', '2019-10-16 08:20:17', NULL, NULL, 0, 1, 0, 0, 'false'),
(2, 'Profil', '<p><strong>Landasan Filosofis SMAIT NurHidayah</strong></p>\n<p><strong>Landasan Konstitusional SMAIT NurHidayah</strong></p>\n<p><strong>Muqadimah UUD 45</strong>:&rdquo;&hellip; melindungi segenap bangsa dan seluruh tumpah darah Indonesia, mencerdaskan kehidupan bangsa, memajukan kesejahteraan umum dan ikut melaksakan ketertiban dunia yang berdasarkan kemerdekaan, perdamaian abadi, dan keadilan sosial&rdquo;.</p>\n<p><strong>Amandemen II UUD 1945 Pasal 28C Ayat (1) pada tahun 2000</strong>&nbsp;dimana hak memperoleh pendidikan bagi warga negara ditetapkan menjadi bagian dari Hak Asasi Manusia : &ldquo;Setiap orang berhak mengembangkan diri melalui pemenuhan kebutuhan dasarnya, berhak mendapat pendidikan dan memperoleh manfaat dari ilmu pengetahuan dan teknologi, seni dan budaya, demi meningkatkan kualitas hidupnya dan demi kesejahteraan umat manusia&rdquo;.</p>\n<p><strong>Pasal 3 UU no 20/2003</strong>&nbsp;&ldquo;Pendidikan Nasional berfungsi mengembangkan kemampuan dan membentuk watak serta peradaban bangsa yang bermartabat dalam rangka mencerdaskan kehidupan bangsa, bertujuan untuk berkembangnya potensipeserta didik agar menjadi manusia yang beriman dan bertakwa kepada Tuhan yang Maha Esa, berakhlak mulia, sehat, berilmu, cakap, kreatif, mandiri, dan menjadi warga Negara yang demokratis dan bertanggung jawab.&rdquo;</p>\n<p><strong>UU No. 20/2003 Sisdiknas pasal 1 ayat 1 tentang definisi pendidikan</strong>&nbsp;yaitu Pendidikan adalah usaha sadar dan terencana untuk mewujudkan suasana belajar dan proses pembelajaran agar peserta didik secara aktif mengembangkan potensi dirinya untuk memiliki kekuatan spiritual keagamaan, pengendalian diri, kepribadian, kecerdasan, akhlak mulia, serta keterampilan yang diperlukan dirinya, masyarakat bangsa dan negara</p>\n<p><strong>Lembaga penopang SMAIT Nur Hidayah</strong></p>\n<p>SMAIT Nur Hidayah merupakan lembaga pendidikan di bawah naungan Yayasan Nur Hidayah Surakarta. Akta notaris pendirian Yayasan Nur Hidayah Surakarta oleh Notaris Anton Wahyu Pramono, SH dengan Nomor 10 tanggal 7 Februari 1992 dan telah diadakan perubahan melalui Notaris Tjondro Santoso, SH dengan Akta Perubahan Nomor 75 tanggal 24 April 1993 dan Notaris H. Made Tony Rodhiyarto, SE, SH Nomor 07 tanggal 15 Januari 2004.</p>\n<p><strong>Para pendiri Yayasan Nur Hidayah Surakarta adalah:</strong></p>\n<ul>\n<li>H. Siswo Oetomo,</li>\n<li>H. Pujo Seputro, BA dan</li>\n<li>H. Al Hisyam, SE, MM.</li>\n</ul>\n<p><strong>Dewan Pembina Yayasan Nur Hidayah Surakarta terdiri atas:</strong></p>\n<ul>\n<li>Ketua : H. Siswo Oetomo</li>\n</ul>\n<p>Wakil Ketua :</p>\n<ul>\n<li>Drs. H. Yulisto</li>\n<li>H. Slamet Pujo Seputro, B.A.</li>\n<li>H. Al Hisyam, S.E., M.M.</li>\n</ul>\n<p><strong>Dewan Pengawas Yayasan Nur Hidayah Surakarta terdiri atas:</strong></p>\n<ul>\n<li>Ketua : Sukarmin, M.Si, Ph.D.</li>\n</ul>\n<p>Wakil ketua :</p>\n<ul>\n<li>Madi Mulyana, S.Pd.</li>\n<li>Indratno, S.Si.</li>\n</ul>\n<p><strong>Dewan Pengurus Yayasan Nur Hidayah Surakarta terdiri atas:</strong></p>\n<ul>\n<li>Ketua Umum : Drs. Wiranto, M.Kom.</li>\n<li>Wakil Ketua&nbsp; : Heri Sucitro, S.Pd.</li>\n<li>Ketua Bidang Sosial : Muji Tri Priyono</li>\n<li>Ketua Bidang Pendidikan : Anis Tanwir Hadi, S.Ag.</li>\n<li>Ketua Bidang Dakwah : Drs. Kasori Mujahid, M.Ag.</li>\n<li>Ketua Bidang Sarana dan Prasarana : Sholikun, A.Md</li>\n<li>Sekretaris : Aspriyanto</li>\n<li>Wakil Sekretaris : Ahmad Rasyid Ridha, S.Pd.I, M.PI.</li>\n<li>Bendahara : Usman Sudarmaji, SE.,M.Acc.</li>\n<li>Wakil Bendahara : Drs. Joko Pramono</li>\n</ul>\n<p>Yayasan Nur Hidayah Surakarta sudah berkecimpung dalam dunia pendidikan sejak tahun 1999. Adapun lembaga yang didirikan dalam pengelolaan bidang pendidikan antara lain:</p>\n<ol start="1">\n<li>Sekolah Dasar Islam Terpadu Nur Hidayah, berdiri tahun 1999, terakreditasi A tahun 2006, jumlah siswa terkini 839 anak</li>\n<li>Sekolah Menengah Pertama Islam Terpadu Nur Hidayah, berdiri tahun 2004, terakreditasi B tahun 2007, jumlah siswa terkini 221 anak</li>\n<li>Taman Kanak-kanak Islam Terpadu Nur Hidayah, berdiri tahun 2004, terakreditasi A tahun 2007, jumlah anak didik terkini 110 anak</li>\n<li>Play Group Islam Terpadu Nur Hidayah, berdiri tahun 2004, jumlah anak didik terkini 17 anak</li>\n<li>Pendidikan Batita Islam Terpadu Nur Hidayah, berdiri tahun 2004, jumlah peserta didik terkini 18 anak</li>\n<li>Al Quran Center Nur Hidayah, berdiri tahun 2007, jumlah binaan terkini 38 orang</li>\n</ol>\n<p>"Dan hendaklah takut kepada Allah orang-orang yang seandainya meninggalkan dibelakang mereka anak-anak yang lemah, yang mereka khawatir terhadap (kesejahteraan) mereka. oleh sebab itu hendaklah mereka bertakwa kepada Allah dan hendaklah mereka mengucapkan perkataan yang benar (QS. An-Nisa&rsquo; ; 9)."</p>\n<p>&nbsp;&nbsp;</p>\n<p><strong>Kompetensi</strong></p>\n<p>Untuk mencapai tujuan pendidikan sebagaimana yang telah ditetapkan, diperlukan acuan kompetensi yang jelas dan terukur mengenai kompetensi ( kemapuan untuk menguasai suatu oengetahuan, sikap dan atau ketrampilan tertentu) yang mesti dicapai oleh setiap siswa. Kompetensi yang harus dicapai oleh siswa SMAIT meliputi kompetensi yang terkait dengan :</p>\n<ol start="1">\n<li><strong>Kompetensi Imani</strong><br />Para pelajar diberikan informasi dan pengajaran tentang dasar-dasar Islam, dibimbing ruhaninya, diarahkan potensinya, diluruskan akhlaknya, baik terhadap Allah SWT, orang tua, guru dan sesama pelajar. Mereka mampu mengaktualisasikan nilai-nilai tauhid dalam kesehariannya. Aqidah yang lurus, akhlak yang baik, ruhani yang bersih, ibadah yang benar, wawasan keislaman yang baik, pandai menjaga waktu dan mengatur urusannya adalah bagian dari kompetensi imani seorang pelajar. Dalam perkembangan yang lebih jauh, mereka dapat mengimplementasikan nilai-nilai ukhuwah dan mujahadah dalam dakwah sebagai cerminan kualitas keimanan mereka.</li>\n<li><strong>Kompetensi Ilmiyah</strong><br />Para pelajar dimotivasi, dibimbing, diarahkan dan dilatih agar memiliki kemampuan dan disiplin belajar yang tinggi, kecerdasan intelektual dalam menyerap pelajaran, kecerdasan emosional, wawasan yang luas, minat mencari ilmu yang tiada habis-habisnya. Para pelajar juga mulai diarahkan untuk mengenali potensi akademiknya agar dapat melanjutkan ke jenjang pendidikan yang lebih tinggi sesuai dengan bakat dan minat yang telah teridentifikasi secara optimal, sehingga potensinya akan tumbuh sumbur karena ditanam pada lahan yang tepat.</li>\n<li><strong>Kompetensi Fanni-Jasadi</strong><br />Para pelajar harus ditumbuhkembangkan potensi skill dan ketrampilan (<em>fanniyah</em>) secara optimal sesuai dengan minat dan bakatnya. Ketrampilan yang dimaksud meliputi&nbsp;<em>ketrampilan dasar</em>&nbsp;dan&nbsp;<strong><em>ketrampilan operasional.&nbsp;</em></strong>Ketrampilan dasar&nbsp;<em>(basic-life skill)</em>&nbsp;meliputi diantaranya apa yang dinamakan mega skills:&nbsp;<em>confidence, motivation, effort, responsibility, initiative, perseverance, caring, teamwork, common sense, problem solving.</em>&nbsp;Sedangkan ketrampilan operasional seperti: dasar-dasar manajemen dan keorganisasian, kepemimpinan, teknik komunikasi efektif, hingga kemampuan bahasa asing dan komputer. Menumbuhkan sejak dini jiwa&nbsp;<em>entrepreneurship</em>&nbsp;hendaknya juga mendapat perhatian penting. Ketrampilan pilihan sesuai dengan minat dan bakatnya biasanya telah terakomodasi dalam sistem ekstra kurikuler sekolah dimana kita patut mendorongnya seperti: fotografi, pecinta alam, bela diri, karya ilmiah remaja,pramuka, palang merah, dsb.</li>\n</ol>\n<p><strong>Tujuan</strong></p>\n<p>Tujuan Umum Pendidikan Islam Terpadu adalah membina peserta didik untuk Menjadi insan bertaqwa yang cerdas, berakhlaq mulia dan memiliki ketrampilan yang memberi manfaat dan maslahat bagi umat manusia, dengan rincian karakter sebagai berikut:</p>\n<ol start="1">\n<li><strong>Aqidah Yang Bersih</strong><br />Meyakini Allah SWT sebagai Pencipta,Pemilik, Pemelihara dan Penguasa alam semesta danmenjauhkandiri dari segala fikiran, sikap dan perilaku Bid&rsquo;ah, khurafat dan syirik.</li>\n<li><strong>Ibadah Yang Benar</strong><br />Terbiasa dan gemar melakukan ibadah yang meliputi: shalat, shaum,tilawah alquran, dzikir dan doa sesuai Quran dan Sunnah.</li>\n<li><strong>Pribadi Yang Matang</strong><br />Menampilkan perilaku yang santun, tertib dan disiplin, peduli terhadap sesama, dan lingkungan serta sabar, ulet dan pemberani dalam menghadapi permasalahan sehari-hari.</li>\n<li><strong>Mandiri</strong><br />Mandiri dalam memenuhi kebutuhan hidupnya dan memiliki bekal yang cukup dalam pengetahyan, kecakapan, dan ketrampilan usaha dalam memenuhi kebutuhan nafqahnya.</li>\n<li><strong>Cerdas dan Berpengetahuan</strong><br />Memiliki ketrampilan berfikir yang logis, kritis, sistematis dan kreatif yang menjadikan dirinya berpengetahuanluas dan menguasai bahan ajar dengan sebaik-baiknya dan cermat serta cerdik dalam mengatasi persoalan yang dihadapi.</li>\n<li><strong>Sehat dan Kuat</strong><br />Memiliki badan dan jiwa yang sehat dan bugar, stamina yang kuat , serta ketrampilan beladiri yang cukup untukmenjaga diri dari kejahatan pihak lain.</li>\n<li><strong>Bersungguh-sungguh dan disiplin</strong><br />Memiliki kesungguhan dan motivasi yang tinggi dalam memperbaiki diri dan lingkunagnnya yang ditunjukkan dengan etos dan kedisiplinan kerja yang baik.</li>\n<li><strong>Tertib dan Cermat</strong><br />Tertib dalam menata segala pekerjaan, tugas dan kewajiban; berani dalam mengambil resiko namun tetap cermat dan penh perhitungan dalam melangkah.</li>\n<li><strong>Efisien</strong><br />Selalu memanfaatkan waktu dengan pekerjaan yang bermanfaat, mampu mengatur jadwal sesuai dengan skala prioritas.</li>\n<li><strong>bermanfaat</strong><br />Peduli kepada sesama dan memiliki kepekaan dan ketrampilan untuk membantu orang lain yang memerlukan pertolongan.</li>\n</ol>', NULL, 1, '+1+', 'page', 'publish', 'public', 'close', 'profil', 'berita, pengumuman, sekilas-info', 68, '2019-09-14 08:57:43', '2019-11-12 08:42:20', NULL, NULL, 0, 1, 0, 0, 'false'),
(3, 'Visi dan Misi', '<p>Visi :</p>\n<p>Menjadi sekolah Islami berwawasan lingkungan pembina generasi cerdas, berbudaya, berdaya saing dan peduli</p>\n<p>&nbsp;</p>\n<p>Misi :</p>\n<ol>\n<li>Mewujudkan nilai islam melalui penyelengaraan sekolah</li>\n<li>Melakukan islamisasi dalam isi dan proses pendidikan</li>\n<li>Menerapkan pembelajaran aktif, inovatif, kreatif dan menyenangkan dengan multimetode dan multimedia</li>\n<li>Melakukan pembinaan terarah, bertahap, dan menyeluruh dalam rangka membentuk pribadi Islami yang siap menjadi dai dan pemimpin</li>\n<li>Mewujudkan sarana prasarana sekolah sesuai standar mutu</li>\n<li>menyebarluaskan citra positif sekolah ke masyarakat</li>\n<li>Mewujudkan wisma pelajar yang aman dan nyaman</li>\n<li>Menampilkan budaya hidup Islami</li>\n<li>Menanamkan sikap dan pembiasaan perilaku peduli lingkungan</li>\n</ol>', NULL, 1, '+1+', 'page', 'publish', 'public', 'close', 'visi-dan-misi', 'berita, pengumuman, sekilas-info', 55, '2019-09-14 08:57:43', '2019-11-12 08:19:13', NULL, NULL, 0, 1, 0, 0, 'false'),
(4, 'Smait Nur Hidayah Mengusung Kearifan Lokal Jamu dalam Upacara HUT Pramuka ke-58', '<p style="text-align: justify;">Rabu, 14 Agustus 2019 Upacara Peringatan Hari Ulang Tahun Pramuka yang ke 58 dilaksanakan di SMA Islam Terpadu Nur Hidayah.</p>\r\n<p style="text-align: justify;">Sejak 14 Agustus 1961 nama Pramuka resmi digunakan di Indonesia bertepatan dengan pemberian tanda penghargaan kepada para pandu yang telah ikut serta mengisi kemerdekaan Republik Indonesia.</p>\r\n<p style="text-align: justify;">Tema HUT Pramuka pada tahun ini adalah Siap Sedia Membangun Keutuhan NKRI, sehingga diharapkan pramuka menjadi benteng terdepan dalam membangun karakter pemuda Indonesia yang tangguh, tangkas dan teguh dalam memegang prinsip trisatya dan dasadarma untuk menghadapi tantangan zaman.</p>\r\n<p style="text-align: justify;">Selain memperingati HUT Pramuka ke 58, Gugus Depan SMA IT Nur Hidayah juga mengadakan kegiatan serah terima jabatan Dewan Ambalan Hamka dan Malahayati tahun ajaran 2019/2020</p>\r\n<p style="text-align: justify;">Kegiatan Serah Terima Jabatan Dewan Ambalan ini, Dewan Guru dan siswa diberikan hidangan berupa Jamu Gendong dimana jamu gendong merupakan minuman tradisional kabupaten Sukoharjo. Hidangan ini juga dimaksudkan untuk mengenalkan kearifan lokal kabupaten Sukoharjo kepada Siswa-siswi SMA IT Nur Hidayah yang berasal dari penjuru Indonesia.</p>\r\n<p style="text-align: justify;">Satyaku ku darmakan, darmaku ku baktikan</p>\r\n<p style="text-align: justify;">Jayalah Pramuka Indonesia!!!</p>\r\n<p style="text-align: justify;">SALAM PRAMUKA !!!</p>', 'b4de819406dcdc36ef2e638bcd3d84e5.jpeg', 1, '+1+', 'post', 'publish', 'public', 'close', 'smait-nur-hidayah-mengusung-kearifan-lokal-jamu-dalam-upacara-hut-pramuka-ke-58', 'berita, pengumuman, sekilas-info', 48, '2019-10-24 12:54:43', '2019-11-17 15:15:35', NULL, NULL, 0, 2, 0, 0, 'false'),
(5, 'Qurban Go Green Ala SMA IT Nur Hidayah', '<p>Pada Senin, 12 Agustus 2019 lalu telah dilakukan penyembelihan hewan qurban di lingkungan SMA IT Nur Hidayah. Ada yang istimewa dalam penyembelihan tahun ini, yaitu digunakannya kreneng (wadah yang berasal dari anyaman bambu) serta daun jati. Hal ini dilakukan sejalan dengan visi sekolah sebagai sekolah adiwiyata yang peduli lingkungan.</p>\r\n<p>Tahun ini, SMA IT Nur Hidayah menyembelih dan menyalurkan hewan qurbab sebanyak 3 sapi dan 15 kambing.</p>', '043f0369bbce0cf14a6a3cd7ba403b00.jpg', 1, '+1+', 'post', 'publish', 'public', 'open', 'qurban-go-green-ala-sma-it-nur-hidayah', 'berita, pengumuman, sekilas-info', 11, '2019-10-24 12:54:36', '2019-11-12 08:24:51', NULL, NULL, 0, 1, 0, 0, 'false'),
(6, 'OSIS SMAIT Nur Hidayah Selenggarakan Pemilu Capres dan Cawapres 2019', '<p><img src="http://localhost/sekolah/media_library/posts/post-image-1571291852713.jpg" alt="" width="389" height="550" /></p>\n<p>Pada Sabtu, 27 Juli 2019 yang lalu, OSIS SMA IT Nur Hidayah telah sukses melaksanakan pesta demokrasi yaitu Pemilu Capres dan Cawapres 2019. Ada 3 kandidat capres dan 3 kandidat cawapres yang maju dalam pemilihan tersebut. Kandidat capres adalah Ayub Nasrurohman Fahri, Muhammad Zaki Romadhoni, dan Akmal Musyaffa&rsquo;. Sedangkan kandidat Cawapres adalah Himmatul Ulya Firdausi, Nataya Putri, dan Imroati Fatimatuzzahra.</p>\n<p>Proses pemilihan berlangsung jujur dan adil. Pemilihan dilakukan secara e-voting sehingga beberapa saat setelah waktu pelaksanaan pemilihan selesai segera bisa diketahui pemenang pemilu.</p>\n<p>Alhamdulillah akhirnya terpilih Presiden dan wakil presiden OSIS masa jabatan 2019/2020 yaitu Akmal Musyaffa&rsquo; dan Imroati Fatimatuzzahro. Barokalloh wa innalillah semoga bisa menjalankan amanah dengan baik dan tawazun dengan semua amanah yang diemban</p>', '3ce3fd10e2f1c62feca4f86667b73d28.jpeg', 1, '+1+', 'post', 'publish', 'public', 'close', 'osis-smait-nur-hidayah-selenggarakan-pemilu-capres-dan-cawapres-2019', 'berita, pengumuman, sekilas-info', 115, '2019-10-24 12:54:27', '2019-11-17 15:14:47', NULL, NULL, 0, 1, 0, 0, 'false'),
(7, 'SMA IT Nur Hidayah Juara 1 Lomba Krenova Pelajar Tingkat Kabupaten', '<p>Alhamdulillah...tahun 2019 ini, SMAIT Nur Hidayah meraih posisi tertinggi yaitu sebagai juara 1 lomba Krenova Pelajar se Kabupaten Sukoharjo. Siswa yang telah berhasil meraih juara 1 ini berasal dari kelas XI MIPA 3 yaitu Hafizha Izzati Nasri, Munq Nabilatul Wahidah, dan Ninda Pradani Futana. Dalam ajang lomba tersebut, ketiga siswa tersebut berhasil menjuarai lomba dengan judul karya " Smart QR Acessories"&nbsp;</p>\r\n<p>Semoga prestasi yang diraih mendapat ridho dan barokah dari Alloh SWT</p>', '972411e5351c5a3a71fef28670ff026e.jpg', 1, '+1+', 'post', 'publish', 'public', 'close', 'sma-it-nur-hidayah-juara-1-lomba-krenova-pelajar-tingkat-kabupaten', 'berita, pengumuman, sekilas-info', 20, '2019-10-24 12:54:22', '2019-11-17 15:16:37', NULL, NULL, 0, 2, 0, 0, 'false'),
(8, 'Pelantikan Pramuka Laksana SMAIT Nur Hidayah', '<p>Barokalloh... Pada hari Senin, 15 Juli 2019 lalu telah dilaksanakan pelantikan anggota pramuka dewan ambalan hamka-malahayati SMAIT Nur Hidayah menjadi pramuka laksana. Sebanyak 40 siswa dan siswi telah lulus ujian SKU untuk bisa dilantik menjadi pramuka laksana. Pramuka laksana merupakan tingkat tertinggi setelah pramuka bantara di jenjang pramuka penegak. Semoga dengan pelantikan tersebut akan menambah prestasi untuk tim pramuka SMA IT Nur Hidayah dan memacu anggota yang masih bantara untuk bisa naik ke tingkat laksana</p>', 'cf25ad3a6cbb1111b3494e4ebf3a9364.jpg', 1, '+1+', 'post', 'publish', 'public', 'close', 'pelantikan-pramuka-laksana-smait-nur-hidayah', 'berita, pengumuman, sekilas-info', 12, '2019-10-24 12:54:15', '2019-11-17 15:17:47', NULL, NULL, 0, 2, 0, 0, 'false'),
(9, 'Struktur Organisasi', '<p><img src="http://localhost/sekolah/media_library/posts/post-image-1573011030494.jpg" alt="" width="656" height="938" /></p>', NULL, 1, NULL, 'page', 'publish', 'public', 'close', 'struktur-organisasi', NULL, 21, '2019-10-17 11:28:17', '2019-11-17 15:18:22', NULL, NULL, 1, 2, 0, 0, 'false'),
(10, 'Civitas', '<table border="0" cellspacing="0" cellpadding="0">\n<tbody>\n<tr>\n<td class="xl76" width="66" height="18">No.</td>\n<td class="xl75" width="138">Nama</td>\n<td class="xl75" width="199">Jabatan&nbsp;</td>\n</tr>\n<tr>\n<td class="xl76" height="18">1</td>\n<td class="xl75">Heri Sucitro, S.Pd.</td>\n<td class="xl75">Guru Mapel Kimia</td>\n</tr>\n<tr>\n<td class="xl76" height="18">2</td>\n<td class="xl75">Rahardjo, S.TP.</td>\n<td class="xl75">Guru Mapel TIK</td>\n</tr>\n<tr>\n<td class="xl76" height="18">3</td>\n<td class="xl75">Mariono Sandwi, S.Pd.</td>\n<td class="xl75">Guru Mapel Ekonomi</td>\n</tr>\n<tr>\n<td class="xl76" height="18">4</td>\n<td class="xl75">Muhammad Ihsan Fauzi, S.Si.,MM.</td>\n<td class="xl75">Waka Kesiswaan/Guru Mapel Fisika</td>\n</tr>\n<tr>\n<td class="xl76" height="18">5</td>\n<td class="xl75">Eliza Widyastuti, S.Pd.</td>\n<td class="xl75">Guru Mapel Matematika</td>\n</tr>\n<tr>\n<td class="xl76" height="18">6</td>\n<td class="xl75">Fitri Nur Hartati, S.Pd.</td>\n<td class="xl75">Waka Humas/Guru Mapel Ekonomi</td>\n</tr>\n<tr>\n<td class="xl76" height="18">7</td>\n<td class="xl75">Budi Lenggono, S.Pd.</td>\n<td class="xl75">Waka Akademik/Guru Mapel Biologi</td>\n</tr>\n<tr>\n<td class="xl76" height="18">8</td>\n<td class="xl75">Heni Wijayanti, S.Pd., M.Hum.</td>\n<td class="xl75">Staff Kesiswaan/Guru Mapel Bahasa Inggris</td>\n</tr>\n<tr>\n<td class="xl76" height="18">9</td>\n<td class="xl75">Rosnendya Yudha Wiguna, SH.</td>\n<td class="xl75">Staff Humas/Guru Mapel PKn Sejarah</td>\n</tr>\n<tr>\n<td class="xl76" height="18">10</td>\n<td class="xl75">Kholifatun Nasriyah, S.Pd.I.</td>\n<td class="xl75">Guru Mapel Bahasa Arab</td>\n</tr>\n<tr>\n<td class="xl76" height="18">11</td>\n<td class="xl75">Karsini, S.Sos.I.</td>\n<td class="xl75">Guru Bimbingan Konserling</td>\n</tr>\n<tr>\n<td class="xl76" height="18">12</td>\n<td class="xl75">Muhammad Athoillah, S.Pd.I</td>\n<td class="xl75">Staff Kesiswaan/Guru Mapel PAI</td>\n</tr>\n<tr>\n<td class="xl76" height="18">13</td>\n<td class="xl75">Sutri Wibowo, S.Pd.</td>\n<td class="xl75">Waka Sarpras/Guru Mapel Penjasorkes</td>\n</tr>\n<tr>\n<td class="xl76" height="18">14</td>\n<td class="xl75">Sri Handayani, S.Pd.I</td>\n<td class="xl75">Koor Wisma Putri/Guru Tahfidz</td>\n</tr>\n<tr>\n<td class="xl76" height="18">15</td>\n<td class="xl75">Sumarsih, S.Pd., M.PI.</td>\n<td class="xl75">Staff Kesiswaan/Guru Sosiologi</td>\n</tr>\n<tr>\n<td class="xl76" height="18">16</td>\n<td class="xl75">Neni Setyaningsih, S.Pd.</td>\n<td class="xl75">Guru Mapel Sosiologi</td>\n</tr>\n<tr>\n<td class="xl76" height="18">17</td>\n<td class="xl75">Dewi Rahmawati, S.Pd.</td>\n<td class="xl75">Guru Bahasa Indonesia</td>\n</tr>\n<tr>\n<td class="xl76" height="18">18</td>\n<td class="xl75">Nurmawati, SS</td>\n<td class="xl75">Staff Kesiswaan/ Guru Mapel Bahasa Inggris</td>\n</tr>\n<tr>\n<td class="xl76" height="18">19</td>\n<td class="xl75">Agus Muhammad Farhan,Lc.</td>\n<td class="xl75">Waka Kewismaan/Guru Mapel Tahfidz</td>\n</tr>\n<tr>\n<td class="xl76" height="18">20</td>\n<td class="xl75">Aviya Lisana, S.Pd.</td>\n<td class="xl75">Staff Humas/Guru Mapel Fisika</td>\n</tr>\n<tr>\n<td class="xl76" height="18">21</td>\n<td class="xl75">Kastoto, S.Pd.</td>\n<td class="xl75">Guru Mapel Sejarah</td>\n</tr>\n<tr>\n<td class="xl76" height="18">22</td>\n<td class="xl75">Nursuci Aprilianto, S.Pd.</td>\n<td class="xl75">Staff Kesiswaan/ Guru Mapel Bahasa Inggris</td>\n</tr>\n</tbody>\n</table>', NULL, 1, NULL, 'page', 'publish', 'public', 'close', 'civitas', NULL, 8, '2019-10-17 11:35:46', '2019-11-06 03:41:40', NULL, NULL, 1, 0, 0, 0, 'false'),
(11, 'Karakteristik', '<p>1. Menjadikan Islam sebagai landasan filosofis.<br />2. Mengintegrasikan nilai Islam ke dalam bangunan kurikulum.<br />3. Menerapkan dan mengembangkan metode pembelajaran untuk mencapai optimalisasi proses belajar mengajar.<br />4. Mengedepankan keteladanan dalam membentuk karakter peserta didik.<br />5. Menumbuhkan atmosfir kebaikan dalam iklim dan lingkungan sekolah, menumbuhkan kemaslahatan dan meniadakan kemaksiatan.<br />6. Melibatkan peran serta orang tua dan masyarakat dalam mendukung tercapainya tujuan pendidikan.<br />7. Mengutamakan nilai persaudaraan dalam semua interaksi antarwarga sekolah.<br />8. Membangun budaya rawat, resik, rapih, runut, ringkas, sehat, dan asri.<br />9. Menjamin seluruh proses kegiatan sekolah untuk berorientasi pada mutu.<br />10. Menumbuhkan budaya profesionalisme yang tinggi di kalangan tenaga pendidik dan tenaga kependidikan.</p>', NULL, 1, NULL, 'page', 'publish', 'public', 'close', 'karakteristik', NULL, 5, '2019-10-17 11:38:47', '2019-11-06 03:41:49', NULL, NULL, 1, 1, 0, 0, 'false'),
(12, 'Prestasi', '<p>-</p>', NULL, 1, NULL, 'page', 'publish', 'public', 'close', 'prestasi', NULL, 28, '2019-10-17 11:47:11', '2019-11-12 08:23:00', NULL, NULL, 1, 0, 0, 0, 'false'),
(13, 'Osis', '<p>-</p>', NULL, 1, NULL, 'page', 'publish', 'public', 'close', 'osis', NULL, 10, '2019-10-17 11:52:34', '2019-11-06 03:42:24', NULL, NULL, 1, 0, 0, 0, 'false'),
(14, 'Pramuka', '<p>-</p>', NULL, 1, NULL, 'page', 'publish', 'public', 'close', 'pramuka', NULL, 4, '2019-10-17 11:53:35', '2019-11-06 03:42:30', NULL, NULL, 1, 0, 0, 0, 'false'),
(15, 'Ekstrakulikuler', '<p>-</p>', NULL, 1, NULL, 'page', 'publish', 'public', 'close', 'ekstrakulikuler', NULL, 4, '2019-10-17 11:56:02', '2019-11-06 03:42:37', NULL, NULL, 1, 0, 0, 0, 'false'),
(16, 'Alumni', '<p>-</p>', NULL, 1, NULL, 'page', 'publish', 'public', 'close', 'alumni', NULL, 3, '2019-10-17 11:56:50', '2019-11-06 03:42:52', NULL, NULL, 1, 0, 0, 0, 'false'),
(17, 'Kurikulum', '<p>-</p>', NULL, 1, NULL, 'page', 'publish', 'public', 'close', 'kurikulum', NULL, 6, '2019-10-17 11:58:15', '2019-11-12 06:39:12', NULL, NULL, 1, 0, 0, 0, 'false'),
(18, 'Pedoman Akademik', '<p>-</p>', NULL, 1, NULL, 'page', 'publish', 'public', 'close', 'pedoman-akademik', NULL, 6, '2019-10-17 11:58:56', '2019-11-06 03:44:51', NULL, NULL, 1, 0, 0, 0, 'false'),
(19, 'Kampus 1', '<p>-</p>', NULL, 1, NULL, 'page', 'publish', 'public', 'close', 'kampus-1', NULL, 5, '2019-10-17 12:00:31', '2019-11-06 03:45:08', NULL, NULL, 1, 0, 0, 0, 'false'),
(20, 'Kampus 2', '<p>-</p>', NULL, 1, NULL, 'page', 'publish', 'public', 'close', 'kampus-2', NULL, 1, '2019-10-17 12:00:47', '2019-10-17 06:00:39', NULL, NULL, 1, 0, 0, 0, 'false'),
(21, 'Wisma', '<p>-</p>', NULL, 1, NULL, 'page', 'publish', 'public', 'close', 'wisma', NULL, 3, '2019-10-17 12:01:01', '2019-11-04 08:40:11', NULL, NULL, 1, 0, 0, 0, 'false'),
(22, 'Maroon 5 - Memories', 'SlPhMPnQ58k', NULL, 0, NULL, 'video', 'draft', 'public', 'close', NULL, NULL, 0, '2019-10-17 12:38:22', '2019-11-06 03:32:45', NULL, NULL, 1, 2, 0, 0, 'false'),
(23, 'Hubungi Kami', '<p><span style="color: #ff9900;"><strong><span class="judul">SMAIT Nur Hidayah</span></strong></span></p>\n<h4>Jl. Pandawa No. 10 Pucangan, Kartasura, Sukoharjo 57168<br />Tlp. (+62271) 7686520, Fax (+62271) 7686521<br />Web: http://smait.nurhidayahsolo.com<br />Email: smait[at]nurhidayahsolo.com</h4>', NULL, 1, NULL, 'page', 'draft', 'private', 'close', 'hubungi-kami', NULL, 3, '2019-10-17 12:43:47', '2019-10-24 05:33:31', '2019-10-24 12:33:31', NULL, 1, 1, 1, 0, 'true'),
(24, 'Hubungi Kami', '<h4 style="color: #000000; font-family: Verdana,Arial,Helvetica,sans-serif; font-size: 14px; font-style: normal; font-variant: normal; font-weight: bold; letter-spacing: normal; line-height: 1.2em; orphans: 2; text-align: left; text-decoration: none; text-indent: 0px; text-transform: none; -webkit-text-stroke-width: 0px; white-space: normal; word-spacing: 0px;">SMA IT NUR HIDAYAH</h4>\n<h4>Jl. Pandawa No. 10 Pucangan, Kartasura, Sukoharjo 57168<br />Tlp. (+62271) 7686520, Fax (+62271) 7686521<br />Web: http://smait.nurhidayahsolo.com<br />Email: smait@nurhidayahsolo.com</h4>', NULL, 1, NULL, 'page', 'publish', 'public', 'close', 'hubungi-kami', NULL, 13, '2019-10-17 12:43:57', '2019-11-17 15:23:45', NULL, NULL, 1, 2, 0, 0, 'false'),
(25, 'SOMG dan Pengambilan LHBS Semester 2 Tahun Pelajaran 2018/2019', '<p>Alhamdulillah pada hari ini Sabtu 25 Mei 2019 SMA IT Nur Hidayah melaksanakan SOMG (Silaturahim Orangtua Murid dan Guru) dan Pengambilan LHBS (Lembar Hasil Belajar Siswa) Semester 2 Tahun Pelajaran 2018/2019.</p>\n<p>SOMG dibuka oleh Ustadz Heri Sucitro selaku Kepala Sekolah SMA IT Nur Hidayah kemudian persembahan Tim Nasyid SMA IT Nur Hidayah.</p>\n<p>SOMG diisi dengan agenda Seminar Parenting "Dahsyatnya Kekuatan Doa dalam Keluarga" dengan pembicara Ustadz Bambang Nugroho.</p>\n<p>&nbsp;</p>\n<p>Alhamdulillah antusiasme orang tua murid sangat bagus dalam mengikuti seminar parenting. Semoga Alloh menjadikan ananda menjadi anak yang sholeh sholihah aamiin</p>', NULL, 2, '', 'post', 'publish', 'public', 'close', 'somg-dan-pengambilan-lhbs-semester-2-tahun-pelajaran-20182019', 'Berita', 0, '2019-10-24 12:54:09', '2019-10-24 05:54:10', NULL, NULL, 2, 1, 0, 0, 'false'),
(26, 'Lisensi SMA IT Nur Hidayah dari JSIT INDONESIA tahun 2019', '<p style="text-align: justify;">Barokallahu... SMA IT Nur Hidayah mendapat lisensi "Amat Baik" dari JSIT Indonesia. Semoga kedepan SMA IT Nur Hidayah tetap istiqomah memberikan pelayanan dan pendidikan yang terbaik, dan semakin baik kepada siswa siswinya aamiin</p>\r\n<p style="text-align: justify;">Dan dengan predikat Amat Baik semakin menjadikan SMA IT Nur Hidayah merunduk dan semakin berkhidmat untuk pendidikan yang terbaik bagi putra putri generasi penerus Bangsa Indonesia.</p>', '0105807367c892e18931e15705251d48.jpeg', 2, '', 'post', 'publish', 'public', 'close', 'lisensi-sma-it-nur-hidayah-dari-jsit-indonesia-tahun-2019', 'Berita', 0, '2019-10-24 12:54:05', '2019-11-17 15:17:03', NULL, NULL, 2, 2, 0, 0, 'false'),
(27, 'SELAMAT HARI KEBANGKITAN NASIONAL 20 MEI 2019', '<p style="text-align: justify;">Pada hari ini guru dan siswa melaksanakan upacara untuk memperingati Hari Kebangkitan Nasional 20 Mei 2019 di gedung timur. Upacara dilaksanakan dari pukul 07.30 - 08.20.</p>\r\n<p style="text-align: justify;">Semoga kebangkitan di negeri ini segera bangkit kembali dengan terpilihnya para pemimpin-pemimpin yang jujur dan amanah aamiin</p>', '2f19f6a26c916b6e8505fba109d325e0.jpeg', 2, '', 'post', 'publish', 'public', 'close', 'selamat-hari-kebangkitan-nasional-20-mei-2019', 'Berita', 1, '2019-10-24 12:54:00', '2019-11-17 15:17:17', NULL, NULL, 2, 2, 0, 0, 'false'),
(28, 'MPS', '<p>=</p>', NULL, 2, NULL, 'page', 'publish', 'public', 'close', 'mps', NULL, 1, '2019-11-06 11:34:24', '2019-11-06 04:35:32', NULL, NULL, 2, 0, 0, 0, 'false'),
(29, 'profil', 'm7F6dy_ifEw', NULL, 0, NULL, 'videoprofile', 'draft', 'public', 'close', NULL, NULL, 0, '2019-11-12 11:16:18', '2019-11-12 04:19:48', NULL, NULL, 2, 2, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE IF NOT EXISTS `questions` (
`id` bigint(20) unsigned NOT NULL,
  `question` varchar(255) DEFAULT NULL,
  `is_active` enum('true','false') DEFAULT 'false',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `quotes`
--

CREATE TABLE IF NOT EXISTS `quotes` (
`id` bigint(20) unsigned NOT NULL,
  `quote` varchar(255) DEFAULT NULL,
  `quote_by` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `quotes`
--

INSERT INTO `quotes` (`id`, `quote`, `quote_by`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Pendidikan merupakan tiket untuk masa depan. Hari esok untuk orang-orang yang telah mempersiapkan dirinya hari ini', 'Anonim', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 1, 0, 0, 0, 'false'),
(2, 'Agama tanpa ilmu pengetahuan adalah buta. Dan ilmu pengetahuan tanpa agama adalah lumpuh', 'Anonim', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 1, 0, 0, 0, 'false'),
(3, 'Hiduplah seakan-akan kau akan mati besok. Belajarlah seakan-akan kau akan hidup selamanya', 'Anonim', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `scholarships`
--

CREATE TABLE IF NOT EXISTS `scholarships` (
`id` bigint(20) unsigned NOT NULL,
  `student_id` bigint(20) DEFAULT '0',
  `scholarship_type` bigint(20) DEFAULT '0',
  `scholarship_description` varchar(255) NOT NULL,
  `scholarship_start_year` year(4) NOT NULL,
  `scholarship_end_year` year(4) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
`id` bigint(20) unsigned NOT NULL,
  `setting_group` varchar(100) NOT NULL,
  `setting_variable` varchar(255) DEFAULT NULL,
  `setting_value` text,
  `setting_default_value` text,
  `setting_access_group` varchar(255) DEFAULT NULL,
  `setting_description` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `setting_group`, `setting_variable`, `setting_value`, `setting_default_value`, `setting_access_group`, `setting_description`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'general', 'site_maintenance', NULL, 'false', 'public', 'Pemeliharaan situs', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(2, 'general', 'site_maintenance_end_date', NULL, '2019-01-01', 'public', 'Tanggal Berakhir Pemeliharaan Situs', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(3, 'general', 'site_cache', NULL, 'false', 'public', 'Cache situs', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(4, 'general', 'site_cache_time', NULL, '10', 'public', 'Lama Cache Situs', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(5, 'general', 'meta_description', NULL, 'CMS Sekolahku adalah Content Management System dan PPDB Online gratis untuk SD SMP/Sederajat SMA/Sederajat', 'public', 'Deskripsi Meta', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(6, 'general', 'meta_keywords', NULL, 'CMS, Website Sekolah Gratis, Cara Membuat Website Sekolah, membuat web sekolah, contoh website sekolah, fitur website sekolah, Sekolah, Website, Internet,Situs, CMS Sekolah, Web Sekolah, Website Sekolah Gratis, Website Sekolah, Aplikasi Sekolah, PPDB Online, PSB Online, PSB Online Gratis, Penerimaan Siswa Baru Online, Raport Online, Kurikulum 2013, SD, SMP, SMA, Aliyah, MTs, SMK', 'public', 'Kata Kunci Meta', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(7, 'general', 'map_location', NULL, '', 'public', 'Lokasi di Google Maps', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(8, 'general', 'favicon', NULL, 'favicon.png', 'public', 'Favicon', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(9, 'general', 'header', NULL, 'header.png', 'public', 'Gambar Header', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(10, 'general', 'recaptcha_status', NULL, 'disable', 'public', 'reCAPTCHA Status', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(11, 'general', 'recaptcha_site_key', NULL, '6LeNCTAUAAAAAADTbL1rDw8GT1DF2DUjVtEXzdMu', 'public', 'Recaptcha Site Key', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(12, 'general', 'recaptcha_secret_key', NULL, '6LeNCTAUAAAAAGq8O0ItkzG8fsA9KeJ7mFMMFF1s', 'public', 'Recaptcha Secret Key', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(13, 'general', 'timezone', NULL, 'Asia/Jakarta', 'public', 'Time Zone', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(14, 'media', 'file_allowed_types', 'pdf, jpg, png, jpeg, gif', 'jpg, jpeg, png, gif', 'public', 'Tipe file yang diizinkan', '2019-09-14 08:57:41', '2019-10-24 05:48:43', NULL, NULL, 0, 1, 0, 0, 'false'),
(15, 'media', 'upload_max_filesize', NULL, '0', 'public', 'Maksimal Ukuran File yang Diupload', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(16, 'media', 'thumbnail_size_height', NULL, '100', 'public', 'Tinggi Gambar Thumbnail', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(17, 'media', 'thumbnail_size_width', NULL, '150', 'public', 'Lebar Gambar Thumbnail', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(18, 'media', 'medium_size_height', NULL, '308', 'public', 'Tinggi Gambar Sedang', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(19, 'media', 'medium_size_width', NULL, '460', 'public', 'Lebar Gambar Sedang', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(20, 'media', 'large_size_height', NULL, '600', 'public', 'Tinggi Gambar Besar', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(21, 'media', 'large_size_width', NULL, '800', 'public', 'Lebar Gambar Besar', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(22, 'media', 'album_cover_height', NULL, '250', 'public', 'Tinggi Cover Album Foto', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(23, 'media', 'album_cover_width', NULL, '400', 'public', 'Lebar Cover Album Foto', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(24, 'media', 'banner_height', NULL, '81', 'public', 'Tinggi Iklan', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(25, 'media', 'banner_width', NULL, '245', 'public', 'Lebar Iklan', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(26, 'media', 'image_slider_height', NULL, '400', 'public', 'Tinggi Gambar Slide', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(27, 'media', 'image_slider_width', NULL, '900', 'public', 'Lebar Gambar Slide', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(28, 'media', 'student_photo_height', NULL, '400', 'public', 'Tinggi Photo Peserta Didik', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(29, 'media', 'student_photo_width', NULL, '300', 'public', 'Lebar Photo Peserta Didik', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(30, 'media', 'employee_photo_height', NULL, '400', 'public', 'Tinggi Photo Guru dan Tenaga Kependidikan', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(31, 'media', 'employee_photo_width', NULL, '300', 'public', 'Lebar Photo Guru dan Tenaga Kependidikan', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(32, 'media', 'headmaster_photo_height', NULL, '400', 'public', 'Tinggi Photo Kepala Sekolah', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(33, 'media', 'headmaster_photo_width', NULL, '300', 'public', 'Lebar Photo Kepala Sekolah', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(34, 'media', 'header_height', NULL, '80', 'public', 'Tinggi Gambar Header', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(35, 'media', 'header_width', NULL, '200', 'public', 'Lebar Gambar Header', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(36, 'media', 'logo_height', NULL, '120', 'public', 'Tinggi Logo Sekolah', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(37, 'media', 'logo_width', NULL, '120', 'public', 'Lebar Logo Sekolah', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(38, 'writing', 'default_post_category', NULL, '1', 'public', 'Default Kategori Tulisan', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(39, 'writing', 'default_post_status', NULL, 'publish', 'public', 'Default Status Tulisan', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(40, 'writing', 'default_post_visibility', NULL, 'public', 'public', 'Default Akses Tulisan', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(41, 'writing', 'default_post_discussion', NULL, 'open', 'public', 'Default Komentar Tulisan', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(42, 'writing', 'post_image_thumbnail_height', NULL, '100', 'public', 'Tinggi Gambar Kecil', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(43, 'writing', 'post_image_thumbnail_width', NULL, '150', 'public', 'Lebar Gambar Kecil', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(44, 'writing', 'post_image_medium_height', NULL, '250', 'public', 'Tinggi Gambar Sedang', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(45, 'writing', 'post_image_medium_width', NULL, '400', 'public', 'Lebar Gambar Sedang', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(46, 'writing', 'post_image_large_height', NULL, '450', 'public', 'Tinggi Gambar Besar', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(47, 'writing', 'post_image_large_width', NULL, '840', 'public', 'Lebar Gambar Besar', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(48, 'reading', 'post_per_page', NULL, '10', 'public', 'Tulisan per halaman', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(49, 'reading', 'post_rss_count', NULL, '10', 'public', 'Jumlah RSS', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(50, 'reading', 'post_related_count', NULL, '10', 'public', 'Jumlah Tulisan Terkait', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(51, 'reading', 'comment_per_page', NULL, '10', 'public', 'Komentar per halaman', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(52, 'discussion', 'comment_moderation', NULL, 'false', 'public', 'Komentar harus disetujui secara manual', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(53, 'discussion', 'comment_registration', NULL, 'false', 'public', 'Pengguna harus terdaftar dan login untuk komentar', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(54, 'discussion', 'comment_blacklist', NULL, 'kampret', 'public', 'Komentar disaring', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(55, 'discussion', 'comment_order', NULL, 'asc', 'public', 'Urutan Komentar', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(56, 'social_account', 'facebook', 'https://facebook.com/SmaitNurHidayahOfficial', '', 'public', 'Facebook', '2019-09-14 08:57:41', '2019-10-16 08:45:13', NULL, NULL, 0, 1, 0, 0, 'false'),
(57, 'social_account', 'twitter', 'https://twitter.com/smaitnh_ID', '', 'public', 'Twitter', '2019-09-14 08:57:41', '2019-11-17 15:06:13', NULL, NULL, 0, 2, 0, 0, 'false'),
(58, 'social_account', 'linked_in', NULL, '', 'public', 'Linked In', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(59, 'social_account', 'youtube', 'https://www.youtube.com/channel/UCBrjvg86TTT_YvK0TXIueGw', '', 'public', 'Youtube', '2019-09-14 08:57:41', '2019-11-12 04:36:29', NULL, NULL, 0, 2, 0, 0, 'false'),
(60, 'social_account', 'instagram', 'https://www.instagram.com/smaitnh/', '', 'public', 'Instagram', '2019-09-14 08:57:41', '2019-11-17 15:07:02', NULL, NULL, 0, 2, 0, 0, 'false'),
(61, 'mail_server', 'sendgrid_username', NULL, '', 'public', 'Sendgrid Username', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(62, 'mail_server', 'sendgrid_password', NULL, '', 'public', 'Sendgrid Password', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(63, 'mail_server', 'sendgrid_api_key', '-', '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', 'public', 'Sendgrid API Key', '2019-09-14 08:57:41', '2019-10-16 08:25:54', NULL, NULL, 0, 1, 0, 0, 'false'),
(64, 'school_profile', 'npsn', NULL, '123', 'public', 'NPSN', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(65, 'school_profile', 'school_name', 'SMA IT Nur Hidayah', 'SMA Negeri 9 Kuningan', 'public', 'Nama Sekolah', '2019-09-14 08:57:41', '2019-11-12 06:14:46', NULL, NULL, 0, 2, 0, 0, 'false'),
(66, 'school_profile', 'headmaster', 'Heri Sucitro, S.Pd', 'Anton Sofyan', 'public', 'Kepala Sekolah', '2019-09-14 08:57:41', '2019-10-17 05:48:55', NULL, NULL, 0, 1, 0, 0, 'false'),
(67, 'school_profile', 'headmaster_photo', NULL, 'headmaster_photo.png', 'public', 'Photo Kepala Sekolah', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(68, 'school_profile', 'school_level', NULL, '3', 'public', 'Bentuk Pendidikan', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(69, 'school_profile', 'school_status', '2', '1', 'public', 'Status Sekolah', '2019-09-14 08:57:41', '2019-10-16 07:18:47', NULL, NULL, 0, 1, 0, 0, 'false'),
(70, 'school_profile', 'ownership_status', NULL, '1', 'public', 'Status Kepemilikan', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(71, 'school_profile', 'decree_operating_permit', NULL, '-', 'public', 'SK Izin Operasional', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(72, 'school_profile', 'decree_operating_permit_date', NULL, '2019-09-14', 'public', 'Tanggal SK Izin Operasional', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(73, 'school_profile', 'tagline', 'Sekolah Menengah Atas Islam Terpadu Nur Hidayah', 'Where Tomorrow''s Leaders Come Together', 'public', 'Slogan', '2019-09-14 08:57:41', '2019-10-16 08:25:09', NULL, NULL, 0, 1, 0, 0, 'false'),
(74, 'school_profile', 'rt', '-', '12', 'public', 'RT', '2019-09-14 08:57:41', '2019-10-16 07:19:55', NULL, NULL, 0, 1, 0, 0, 'false'),
(75, 'school_profile', 'rw', '-', '06', 'public', 'RW', '2019-09-14 08:57:41', '2019-10-16 07:19:59', NULL, NULL, 0, 1, 0, 0, 'false'),
(76, 'school_profile', 'sub_village', 'Pucangan', 'Wage', 'public', 'Dusun', '2019-09-14 08:57:41', '2019-10-16 07:17:48', NULL, NULL, 0, 1, 0, 0, 'false'),
(77, 'school_profile', 'village', 'Pucangan', 'Kadugede', 'public', 'Kelurahan / Desa', '2019-09-14 08:57:41', '2019-10-16 07:17:54', NULL, NULL, 0, 1, 0, 0, 'false'),
(78, 'school_profile', 'sub_district', 'Kartasura', 'Kadugede', 'public', 'Kecamatan', '2019-09-14 08:57:41', '2019-10-16 07:17:40', NULL, NULL, 0, 1, 0, 0, 'false'),
(79, 'school_profile', 'district', 'Sukoharjo', 'Kuningan', 'public', 'Kabupaten', '2019-09-14 08:57:41', '2019-10-16 07:15:50', NULL, NULL, 0, 1, 0, 0, 'false'),
(80, 'school_profile', 'postal_code', '57168', '45561', 'public', 'Kode Pos', '2019-09-14 08:57:41', '2019-10-16 07:20:12', NULL, NULL, 0, 1, 0, 0, 'false'),
(81, 'school_profile', 'street_address', 'Jl. Pandawa No. 10 Pucangan, Kartasura, Sukoharjo 57168', 'Jalan Raya Kadugede No. 11', 'public', 'Alamat Jalan', '2019-09-14 08:57:41', '2019-10-16 07:16:21', NULL, NULL, 0, 1, 0, 0, 'false'),
(82, 'school_profile', 'phone', '(+62271) 7686520', '0232123456', 'public', 'Telepon', '2019-09-14 08:57:41', '2019-10-16 07:16:34', NULL, NULL, 0, 1, 0, 0, 'false'),
(83, 'school_profile', 'fax', '(+62271) 7686521', '0232123456', 'public', 'Fax', '2019-09-14 08:57:41', '2019-10-16 07:16:45', NULL, NULL, 0, 1, 0, 0, 'false'),
(84, 'school_profile', 'email', 'smait@nurhidayahsolo.com', 'info@sman9kuningan.sch.id', 'public', 'Email', '2019-09-14 08:57:41', '2019-10-16 07:19:27', NULL, NULL, 0, 1, 0, 0, 'false'),
(85, 'school_profile', 'website', 'http://smait.nurhidayahsolo.com', 'http://www.sman9kuningan.sch.id', 'public', 'Website', '2019-09-14 08:57:41', '2019-10-16 07:19:41', NULL, NULL, 0, 1, 0, 0, 'false'),
(86, 'school_profile', 'logo', '05db369212ad1b21496fbcea4d6366df.png', 'logo.png', 'public', 'Logo', '2019-09-14 08:57:41', '2019-10-24 04:50:22', NULL, NULL, 0, 0, 0, 0, 'false'),
(87, 'admission', 'admission_status', NULL, 'open', 'public', 'Status Penerimaan Peserta Didik Baru', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(88, 'admission', 'admission_year', NULL, '2019', 'public', 'Tahun Penerimaan Peserta Didik Baru', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(89, 'admission', 'admission_start_date', NULL, '2019-01-01', 'public', 'Tanggal Mulai PPDB', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(90, 'admission', 'admission_end_date', NULL, '2019-12-31', 'public', 'Tanggal Selesai PPDB', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(91, 'admission', 'announcement_start_date', NULL, '2019-01-01', 'public', 'Tanggal Mulai Pengumuman Hasil Seleksi PPDB', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false'),
(92, 'admission', 'announcement_end_date', NULL, '2019-12-31', 'public', 'Tanggal Selesai Pengumuman Hasil Seleksi PPDB', '2019-09-14 08:57:41', '2019-09-14 01:57:41', NULL, NULL, 0, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE IF NOT EXISTS `students` (
`id` bigint(20) unsigned NOT NULL,
  `major_id` bigint(20) DEFAULT '0' COMMENT 'Program Keahlian',
  `first_choice_id` bigint(20) DEFAULT '0' COMMENT 'Pilihan Pertama PPDB',
  `second_choice_id` bigint(20) DEFAULT '0' COMMENT 'Pilihan Kedua PPDB',
  `registration_number` varchar(10) DEFAULT NULL COMMENT 'Nomor Pendaftaran',
  `admission_exam_number` varchar(10) DEFAULT NULL COMMENT 'Nomor Ujian Tes Tulis',
  `selection_result` varchar(100) DEFAULT NULL COMMENT 'Hasil Seleksi PPDB/PMB',
  `admission_phase_id` bigint(20) DEFAULT '0' COMMENT 'Gelombang Pendaftaran',
  `admission_type_id` bigint(20) DEFAULT '0' COMMENT 'Jalur Pendaftaran',
  `photo` varchar(100) DEFAULT NULL,
  `achievement` text COMMENT 'Prestasi Calon Peserta Didik / Mahasiswa',
  `is_student` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Apakah Siswa Aktif ? Set true jika lolos seleksi PPDB dan set FALSE jika sudah lulus',
  `is_prospective_student` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Apakah Calon Siswa Baru ?',
  `is_alumni` enum('true','false','unverified') NOT NULL DEFAULT 'false' COMMENT 'Apakah Alumni ?',
  `is_transfer` enum('true','false') NOT NULL DEFAULT 'false' COMMENT 'Jenis Pendaftaran : Baru / Pindahan ?',
  `re_registration` enum('true','false') DEFAULT NULL COMMENT 'Konfirmasi Pendaftaran Ulang Calon Siswa Baru',
  `start_date` date DEFAULT NULL COMMENT 'Tanggal Masuk Sekolah',
  `identity_number` varchar(50) DEFAULT NULL COMMENT 'NIS/NIM',
  `nisn` varchar(50) DEFAULT NULL COMMENT 'Nomor Induk Siswa Nasional',
  `nik` varchar(50) DEFAULT NULL COMMENT 'Nomor Induk Kependudukan / KTP',
  `prev_exam_number` varchar(50) DEFAULT NULL COMMENT 'Nomor Peserta Ujian Sebelumnya',
  `prev_diploma_number` varchar(50) DEFAULT NULL COMMENT 'Nomor Ijazah Sebelumnya',
  `paud` enum('true','false') DEFAULT NULL COMMENT 'Apakah pernah PAUD',
  `tk` enum('true','false') DEFAULT NULL COMMENT 'Apakah pernah TK',
  `skhun` varchar(50) DEFAULT NULL COMMENT 'No. Seri Surat Keterangan Hasil Ujian Nasional Sebelumnya',
  `prev_school_name` varchar(255) DEFAULT NULL COMMENT 'Nama Sekolah Sebelumnya',
  `prev_school_address` varchar(255) DEFAULT NULL COMMENT 'Alamat Sekolah Sebelumnya',
  `hobby` varchar(255) DEFAULT NULL,
  `ambition` varchar(255) DEFAULT NULL COMMENT 'Cita-cita',
  `full_name` varchar(150) NOT NULL,
  `gender` enum('M','F') NOT NULL DEFAULT 'M',
  `birth_place` varchar(255) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `religion_id` bigint(20) DEFAULT '0',
  `special_need_id` bigint(20) DEFAULT '0' COMMENT 'Berkeburuhan Khusus',
  `street_address` varchar(255) DEFAULT NULL COMMENT 'Alamat Jalan',
  `rt` varchar(10) DEFAULT NULL COMMENT 'Alamat Jalan',
  `rw` varchar(10) DEFAULT NULL COMMENT 'Alamat Jalan',
  `sub_village` varchar(255) DEFAULT NULL COMMENT 'Nama Dusun',
  `village` varchar(255) DEFAULT NULL COMMENT 'Nama Kelurahan/ Desa',
  `sub_district` varchar(255) DEFAULT NULL COMMENT 'Kecamatan',
  `district` varchar(255) DEFAULT NULL COMMENT 'Kabupaten',
  `postal_code` varchar(20) DEFAULT NULL COMMENT 'Kode POS',
  `residence_id` bigint(20) DEFAULT '0' COMMENT 'Tempat Tinggal',
  `transportation_id` bigint(20) DEFAULT '0' COMMENT 'Moda Transportasi',
  `phone` varchar(50) DEFAULT NULL,
  `mobile_phone` varchar(50) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `sktm` varchar(100) DEFAULT NULL COMMENT 'Surat Keterangan Tidak Mampu (SKTM)',
  `kks` varchar(100) DEFAULT NULL COMMENT 'Kartu Keluarga Sejahtera (KKS)',
  `kps` varchar(100) DEFAULT NULL COMMENT 'Kartu Pra Sejahtera (KPS)',
  `kip` varchar(100) DEFAULT NULL COMMENT 'Kartu Indonesia Pintar (KIP)',
  `kis` varchar(100) DEFAULT NULL COMMENT 'Kartu Indonesia Sehat (KIS)',
  `citizenship` enum('WNI','WNA') NOT NULL DEFAULT 'WNI' COMMENT 'Kewarganegaraan',
  `country` varchar(255) DEFAULT NULL,
  `father_name` varchar(150) DEFAULT NULL,
  `father_birth_year` year(4) DEFAULT NULL,
  `father_education_id` bigint(20) DEFAULT '0',
  `father_employment_id` bigint(20) DEFAULT '0',
  `father_monthly_income_id` bigint(20) DEFAULT '0',
  `father_special_need_id` bigint(20) DEFAULT '0',
  `mother_name` varchar(150) DEFAULT NULL,
  `mother_birth_year` year(4) DEFAULT NULL,
  `mother_education_id` bigint(20) DEFAULT '0',
  `mother_employment_id` bigint(20) DEFAULT '0',
  `mother_monthly_income_id` bigint(20) DEFAULT '0',
  `mother_special_need_id` bigint(20) DEFAULT '0',
  `guardian_name` varchar(150) DEFAULT NULL,
  `guardian_birth_year` year(4) DEFAULT NULL,
  `guardian_education_id` bigint(20) DEFAULT '0',
  `guardian_employment_id` bigint(20) DEFAULT '0',
  `guardian_monthly_income_id` bigint(20) DEFAULT '0',
  `mileage` smallint(6) DEFAULT NULL COMMENT 'Jarak tempat tinggal ke sekolah',
  `traveling_time` smallint(6) DEFAULT NULL COMMENT 'Waktu Tempuh',
  `height` smallint(3) DEFAULT NULL COMMENT 'Tinggi Badan',
  `weight` smallint(3) DEFAULT NULL COMMENT 'Berat Badan',
  `sibling_number` smallint(2) DEFAULT '0' COMMENT 'Jumlah Saudara Kandng',
  `student_status_id` bigint(20) DEFAULT '0' COMMENT 'Status siswa',
  `end_date` date DEFAULT NULL COMMENT 'Tanggal Keluar',
  `reason` varchar(255) DEFAULT NULL COMMENT 'Diisi jika peserta didik sudah keluar',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE IF NOT EXISTS `subscribers` (
`id` bigint(20) unsigned NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
`id` bigint(20) unsigned NOT NULL,
  `tag` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `tag`, `slug`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Berita', 'berita', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(2, 'Pengumuman', 'pengumuman', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(3, 'Sekilas Info', 'sekilas-info', '2019-09-14 08:57:42', '2019-09-14 01:57:42', NULL, NULL, 0, 0, 0, 0, 'false'),
(6, 'Pramuka', 'pramuka', '2019-10-16 14:13:30', '2019-10-16 07:35:24', NULL, NULL, 1, 1, 0, 0, 'false'),
(10, 'Osis', 'osis', '2019-10-16 14:35:33', '2019-10-16 07:35:33', NULL, NULL, 1, 0, 0, 0, 'false'),
(13, 'sekilas-info', 'sekilas-info', '2019-10-17 12:54:15', '2019-10-17 05:54:15', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `themes`
--

CREATE TABLE IF NOT EXISTS `themes` (
`id` bigint(20) unsigned NOT NULL,
  `theme_name` varchar(255) NOT NULL,
  `theme_folder` varchar(255) DEFAULT NULL,
  `theme_author` varchar(255) DEFAULT NULL,
  `is_active` enum('true','false') DEFAULT 'false',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `themes`
--

INSERT INTO `themes` (`id`, `theme_name`, `theme_folder`, `theme_author`, `is_active`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'Sky Light', 'sky_light', '-', 'false', '2019-09-14 08:57:42', '2019-11-04 06:50:39', NULL, NULL, 1, 1, 0, 0, 'false'),
(2, 'Blue Sky', 'blue_sky', '-', 'false', '2019-09-14 08:57:42', '2019-10-16 08:16:36', NULL, NULL, 1, 1, 0, 0, 'false'),
(3, 'Green Land', 'green_land', '-', 'false', '2019-09-14 08:57:42', '2019-11-03 03:30:50', NULL, NULL, 1, 1, 0, 0, 'false'),
(4, 'minty', 'minty', 'admin', 'true', '2019-10-17 12:18:44', '2019-11-04 06:50:39', NULL, NULL, 1, 1, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id` bigint(20) unsigned NOT NULL,
  `user_name` varchar(60) NOT NULL,
  `user_password` varchar(100) NOT NULL,
  `user_full_name` varchar(100) DEFAULT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `user_url` varchar(100) DEFAULT NULL,
  `user_group_id` bigint(20) DEFAULT '0',
  `user_type` enum('super_user','administrator','employee','student') NOT NULL DEFAULT 'administrator',
  `user_profile_id` bigint(20) unsigned DEFAULT NULL COMMENT 'student_id OR employee_id',
  `user_biography` text,
  `user_forgot_password_key` varchar(100) DEFAULT NULL,
  `user_forgot_password_request_date` date DEFAULT NULL,
  `has_login` enum('true','false') DEFAULT 'false',
  `last_logged_in` datetime DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `user_name`, `user_password`, `user_full_name`, `user_email`, `user_url`, `user_group_id`, `user_type`, `user_profile_id`, `user_biography`, `user_forgot_password_key`, `user_forgot_password_request_date`, `has_login`, `last_logged_in`, `ip_address`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'roxhsas', '$2y$10$4wGUjCpagICmYyB06BaafOXsbhYubqEWH5eAh0XSFRhEf58O7Amma', 'admin', 'admin@admin.com', 'https://web.facebook.com/5434.dirgantara?_rdc=1&_rdr', 0, 'super_user', NULL, '', NULL, NULL, 'false', '2019-11-17 16:03:11', '::1', '2019-09-14 08:57:42', '2019-11-17 15:14:41', NULL, NULL, 0, 1, 0, 0, 'false'),
(2, 'admin', '$2y$10$xwCEdPX.ak8aEreXsQRu5u/8kAuBYFHEvPyJogXt/qd4rC5/bC9JW', 'admistrator', 'smait@nurhidayahsolo.com', 'http://smait.nurhidayahsolo.com', 1, 'administrator', NULL, '', NULL, NULL, 'true', '2019-11-17 16:03:28', '::1', '2019-10-16 14:37:27', '2019-11-17 15:03:28', NULL, NULL, 1, 2, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `user_groups`
--

CREATE TABLE IF NOT EXISTS `user_groups` (
`id` bigint(20) unsigned NOT NULL,
  `user_group` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_groups`
--

INSERT INTO `user_groups` (`id`, `user_group`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 'admin', '2019-10-16 14:26:05', '2019-10-16 07:26:09', NULL, NULL, 1, 1, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `user_privileges`
--

CREATE TABLE IF NOT EXISTS `user_privileges` (
`id` bigint(20) unsigned NOT NULL,
  `user_group_id` bigint(20) DEFAULT '0',
  `module_id` bigint(20) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` datetime DEFAULT NULL,
  `restored_at` datetime DEFAULT NULL,
  `created_by` bigint(20) DEFAULT '0',
  `updated_by` bigint(20) DEFAULT '0',
  `deleted_by` bigint(20) DEFAULT '0',
  `restored_by` bigint(20) DEFAULT '0',
  `is_deleted` enum('true','false') DEFAULT 'false'
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_privileges`
--

INSERT INTO `user_privileges` (`id`, `user_group_id`, `module_id`, `created_at`, `updated_at`, `deleted_at`, `restored_at`, `created_by`, `updated_by`, `deleted_by`, `restored_by`, `is_deleted`) VALUES
(1, 1, 6, '2019-10-16 14:26:46', '2019-10-16 07:30:34', NULL, NULL, 1, 1, 0, 0, 'false'),
(2, 1, 4, '2019-10-16 14:30:47', '2019-10-16 07:30:47', NULL, NULL, 1, 0, 0, 0, 'false'),
(3, 1, 7, '2019-10-16 14:31:39', '2019-10-16 07:31:54', NULL, NULL, 1, 1, 0, 0, 'false'),
(4, 1, 9, '2019-11-06 10:09:38', '2019-11-06 03:09:38', NULL, NULL, 1, 0, 0, 0, 'false'),
(5, 1, 3, '2019-11-06 10:10:00', '2019-11-06 03:10:00', NULL, NULL, 1, 0, 0, 0, 'false');

-- --------------------------------------------------------

--
-- Table structure for table `_sessions`
--

CREATE TABLE IF NOT EXISTS `_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0',
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `_sessions`
--

INSERT INTO `_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('57f22rblcad9frelftttp8mrr2li60ut', '::1', 1574004261, 0x5f5f63695f6c6173745f726567656e65726174657c693a313537343030343234383b736974655f6d61696e74656e616e63657c733a353a2266616c7365223b736974655f6d61696e74656e616e63655f656e645f646174657c733a31303a22323031392d30312d3031223b736974655f63616368657c733a353a2266616c7365223b736974655f63616368655f74696d657c733a323a223130223b6d6574615f6465736372697074696f6e7c733a3130363a22434d532053656b6f6c61686b75206164616c616820436f6e74656e74204d616e6167656d656e742053797374656d2064616e2050504442204f6e6c696e652067726174697320756e74756b20534420534d502f5365646572616a617420534d412f5365646572616a6174223b6d6574615f6b6579776f7264737c733a3338313a22434d532c20576562736974652053656b6f6c6168204772617469732c2043617261204d656d6275617420576562736974652053656b6f6c61682c206d656d62756174207765622073656b6f6c61682c20636f6e746f6820776562736974652073656b6f6c61682c20666974757220776562736974652073656b6f6c61682c2053656b6f6c61682c20576562736974652c20496e7465726e65742c53697475732c20434d532053656b6f6c61682c205765622053656b6f6c61682c20576562736974652053656b6f6c6168204772617469732c20576562736974652053656b6f6c61682c2041706c696b6173692053656b6f6c61682c2050504442204f6e6c696e652c20505342204f6e6c696e652c20505342204f6e6c696e65204772617469732c2050656e6572696d61616e2053697377612042617275204f6e6c696e652c205261706f7274204f6e6c696e652c204b7572696b756c756d20323031332c2053442c20534d502c20534d412c20416c697961682c204d54732c20534d4b223b6d61705f6c6f636174696f6e7c733a303a22223b66617669636f6e7c733a31313a2266617669636f6e2e706e67223b6865616465727c733a31303a226865616465722e706e67223b7265636170746368615f7374617475737c733a373a2264697361626c65223b7265636170746368615f736974655f6b65797c733a34303a22364c654e435441554141414141414454624c317244773847543144463244556a567445587a644d75223b7265636170746368615f7365637265745f6b65797c733a34303a22364c654e4354415541414141414771384f3049746b7a4738667341394b654a376d464d4d46463173223b74696d657a6f6e657c733a31323a22417369612f4a616b61727461223b66696c655f616c6c6f7765645f74797065737c733a32343a227064662c206a70672c20706e672c206a7065672c20676966223b75706c6f61645f6d61785f66696c6573697a657c733a313a2230223b7468756d626e61696c5f73697a655f6865696768747c733a333a22313030223b7468756d626e61696c5f73697a655f77696474687c733a333a22313530223b6d656469756d5f73697a655f6865696768747c733a333a22333038223b6d656469756d5f73697a655f77696474687c733a333a22343630223b6c617267655f73697a655f6865696768747c733a333a22363030223b6c617267655f73697a655f77696474687c733a333a22383030223b616c62756d5f636f7665725f6865696768747c733a333a22323530223b616c62756d5f636f7665725f77696474687c733a333a22343030223b62616e6e65725f6865696768747c733a323a223831223b62616e6e65725f77696474687c733a333a22323435223b696d6167655f736c696465725f6865696768747c733a333a22343030223b696d6167655f736c696465725f77696474687c733a333a22393030223b73747564656e745f70686f746f5f6865696768747c733a333a22343030223b73747564656e745f70686f746f5f77696474687c733a333a22333030223b656d706c6f7965655f70686f746f5f6865696768747c733a333a22343030223b656d706c6f7965655f70686f746f5f77696474687c733a333a22333030223b686561646d61737465725f70686f746f5f6865696768747c733a333a22343030223b686561646d61737465725f70686f746f5f77696474687c733a333a22333030223b6865616465725f6865696768747c733a323a223830223b6865616465725f77696474687c733a333a22323030223b6c6f676f5f6865696768747c733a333a22313230223b6c6f676f5f77696474687c733a333a22313230223b64656661756c745f706f73745f63617465676f72797c733a313a2231223b64656661756c745f706f73745f7374617475737c733a373a227075626c697368223b64656661756c745f706f73745f7669736962696c6974797c733a363a227075626c6963223b64656661756c745f706f73745f64697363757373696f6e7c733a343a226f70656e223b706f73745f696d6167655f7468756d626e61696c5f6865696768747c733a333a22313030223b706f73745f696d6167655f7468756d626e61696c5f77696474687c733a333a22313530223b706f73745f696d6167655f6d656469756d5f6865696768747c733a333a22323530223b706f73745f696d6167655f6d656469756d5f77696474687c733a333a22343030223b706f73745f696d6167655f6c617267655f6865696768747c733a333a22343530223b706f73745f696d6167655f6c617267655f77696474687c733a333a22383430223b706f73745f7065725f706167657c733a323a223130223b706f73745f7273735f636f756e747c733a323a223130223b706f73745f72656c617465645f636f756e747c733a323a223130223b636f6d6d656e745f7065725f706167657c733a323a223130223b636f6d6d656e745f6d6f6465726174696f6e7c733a353a2266616c7365223b636f6d6d656e745f726567697374726174696f6e7c733a353a2266616c7365223b636f6d6d656e745f626c61636b6c6973747c733a373a226b616d70726574223b636f6d6d656e745f6f726465727c733a333a22617363223b66616365626f6f6b7c733a34343a2268747470733a2f2f66616365626f6f6b2e636f6d2f536d6169744e7572486964617961684f6666696369616c223b747769747465727c733a33303a2268747470733a2f2f747769747465722e636f6d2f736d6169746e685f4944223b6c696e6b65645f696e7c733a303a22223b796f75747562657c733a35363a2268747470733a2f2f7777772e796f75747562652e636f6d2f6368616e6e656c2f554342726a766738365454545f59764b3054584975654777223b696e7374616772616d7c733a33343a2268747470733a2f2f7777772e696e7374616772616d2e636f6d2f736d6169746e682f223b73656e64677269645f757365726e616d657c733a303a22223b73656e64677269645f70617373776f72647c733a303a22223b73656e64677269645f6170695f6b65797c733a313a222d223b6e70736e7c733a333a22313233223b7363686f6f6c5f6e616d657c733a31383a22534d41204954204e75722048696461796168223b686561646d61737465727c733a31383a2248657269205375636974726f2c20532e5064223b686561646d61737465725f70686f746f7c733a32303a22686561646d61737465725f70686f746f2e706e67223b7363686f6f6c5f6c6576656c7c733a313a224d223b7363686f6f6c5f7374617475737c733a313a2232223b6f776e6572736869705f7374617475737c733a313a2231223b6465637265655f6f7065726174696e675f7065726d69747c733a313a222d223b6465637265655f6f7065726174696e675f7065726d69745f646174657c733a31303a22323031392d30392d3134223b7461676c696e657c733a34373a2253656b6f6c6168204d656e656e67616820417461732049736c616d2054657270616475204e75722048696461796168223b72747c733a313a222d223b72777c733a313a222d223b7375625f76696c6c6167657c733a383a22507563616e67616e223b76696c6c6167657c733a383a22507563616e67616e223b7375625f64697374726963747c733a393a224b6172746173757261223b64697374726963747c733a393a2253756b6f6861726a6f223b706f7374616c5f636f64657c733a353a223537313638223b7374726565745f616464726573737c733a35353a224a6c2e2050616e64617761204e6f2e20313020507563616e67616e2c204b61727461737572612c2053756b6f6861726a6f203537313638223b70686f6e657c733a31363a22282b3632323731292037363836353230223b6661787c733a31363a22282b3632323731292037363836353231223b656d61696c7c733a32343a22736d616974406e757268696461796168736f6c6f2e636f6d223b776562736974657c733a33313a22687474703a2f2f736d6169742e6e757268696461796168736f6c6f2e636f6d223b6c6f676f7c733a33363a2230356462333639323132616431623231343936666263656134643633363664662e706e67223b61646d697373696f6e5f7374617475737c733a343a226f70656e223b61646d697373696f6e5f796561727c733a343a2232303139223b61646d697373696f6e5f73746172745f646174657c733a31303a22323031392d30312d3031223b61646d697373696f6e5f656e645f646174657c733a31303a22323031392d31322d3331223b616e6e6f756e63656d656e745f73746172745f646174657c733a31303a22323031392d30312d3031223b616e6e6f756e63656d656e745f656e645f646174657c733a31303a22323031392d31322d3331223b5f61636164656d69635f796561727c733a31353a22546168756e2050656c616a6172616e223b5f73747564656e747c733a31333a225065736572746120446964696b223b5f6964656e746974795f6e756d6265727c733a333a224e4953223b5f656d706c6f7965657c733a333a2247544b223b5f5f656d706c6f7965657c733a32383a22477572752064616e2054656e616761204b6570656e646964696b616e223b5f7375626a6563747c733a31343a224d6174612050656c616a6172616e223b5f61646d697373696f6e7c733a343a2250504442223b5f6d616a6f727c733a373a224a75727573616e223b5f686561646d61737465727c733a31343a224b6570616c612053656b6f6c6168223b7468656d657c733a353a226d696e7479223b6d616a6f725f636f756e747c623a303b757365725f69647c733a313a2232223b757365725f6e616d657c733a353a2261646d696e223b757365725f747970657c733a31333a2261646d696e6973747261746f72223b757365725f70726f66696c655f69647c4e3b6861735f6c6f67696e7c623a313b757365725f70726976696c656765737c613a383a7b693a303b733a393a2264617368626f617264223b693a313b733a31353a226368616e67655f70617373776f7264223b693a323b733a373a2270726f66696c65223b693a333b733a353a226d65646961223b693a343b733a343a22626c6f67223b693a353b733a373a22706c7567696e73223b693a363b733a383a2273657474696e6773223b693a373b733a31303a22617070656172616e6365223b7d746f6b656e7c733a33323a226263313138643961613934653334383962666634343538336132393938386161223b637372665f746f6b656e7c733a33323a226263313138643961613934653334383962666634343538336132393938386161223b);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `academic_years`
--
ALTER TABLE `academic_years`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `academic_year` (`academic_year`);

--
-- Indexes for table `achievements`
--
ALTER TABLE `achievements`
 ADD PRIMARY KEY (`id`), ADD KEY `achievements_student_id__idx` (`student_id`) USING BTREE;

--
-- Indexes for table `admission_phases`
--
ALTER TABLE `admission_phases`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `unique_field` (`academic_year_id`,`phase_name`), ADD KEY `admission_phases_academic_year_id__idx` (`academic_year_id`) USING BTREE;

--
-- Indexes for table `admission_quotas`
--
ALTER TABLE `admission_quotas`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `unique_field` (`academic_year_id`,`admission_type_id`,`major_id`), ADD KEY `admission_quotas_academic_year_id__idx` (`academic_year_id`) USING BTREE, ADD KEY `admission_quotas_admission_type_id__idx` (`admission_type_id`) USING BTREE, ADD KEY `admission_quotas_major_id__idx` (`major_id`) USING BTREE;

--
-- Indexes for table `albums`
--
ALTER TABLE `albums`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `album_title` (`album_title`);

--
-- Indexes for table `answers`
--
ALTER TABLE `answers`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `unique_field` (`question_id`,`answer`), ADD KEY `answers_question_id__idx` (`question_id`) USING BTREE;

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `unique_field` (`category_name`,`category_type`);

--
-- Indexes for table `class_groups`
--
ALTER TABLE `class_groups`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `unique_field` (`class_group`,`sub_class_group`,`major_id`), ADD KEY `class_groups_major_id__idx` (`major_id`) USING BTREE;

--
-- Indexes for table `class_group_settings`
--
ALTER TABLE `class_group_settings`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `unique_field` (`academic_year_id`,`class_group_id`), ADD KEY `class_group_settings_academic_year_id__idx` (`academic_year_id`) USING BTREE, ADD KEY `class_group_settings_class_group_id__idx` (`class_group_id`) USING BTREE;

--
-- Indexes for table `class_group_students`
--
ALTER TABLE `class_group_students`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `unique_field` (`class_group_setting_id`,`student_id`), ADD KEY `class_group_students_class_group_setting_id__idx` (`class_group_setting_id`) USING BTREE, ADD KEY `class_group_students_student_id__idx` (`student_id`) USING BTREE;

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
 ADD PRIMARY KEY (`id`), ADD KEY `comments_comment_post_id__idx` (`comment_post_id`) USING BTREE;

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
 ADD PRIMARY KEY (`id`), ADD KEY `employees_nik__idx` (`nik`) USING BTREE, ADD KEY `employees_full_name__idx` (`full_name`) USING BTREE, ADD KEY `employees_email__idx` (`email`) USING BTREE, ADD KEY `employees_religion_id__idx` (`religion_id`) USING BTREE, ADD KEY `employees_marriage_status_id__idx` (`marriage_status_id`) USING BTREE, ADD KEY `employees_spouse_employment_id__idx` (`spouse_employment_id`) USING BTREE, ADD KEY `employees_employment_status_id__idx` (`employment_status_id`) USING BTREE, ADD KEY `employees_employment_type_id__idx` (`employment_type_id`) USING BTREE, ADD KEY `employees_institution_lifter_id__idx` (`institution_lifter_id`) USING BTREE, ADD KEY `employees_rank_id__idx` (`rank_id`) USING BTREE, ADD KEY `employees_salary_source_id__idx` (`salary_source_id`) USING BTREE, ADD KEY `employees_laboratory_skill_id__idx` (`laboratory_skill_id`) USING BTREE, ADD KEY `employees_special_need_id__idx` (`special_need_id`) USING BTREE;

--
-- Indexes for table `files`
--
ALTER TABLE `files`
 ADD PRIMARY KEY (`id`), ADD KEY `files_file_category_id__idx` (`file_category_id`) USING BTREE;

--
-- Indexes for table `image_sliders`
--
ALTER TABLE `image_sliders`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `links`
--
ALTER TABLE `links`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `unique_field` (`link_url`,`link_type`);

--
-- Indexes for table `login_attempts`
--
ALTER TABLE `login_attempts`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `majors`
--
ALTER TABLE `majors`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `major_name` (`major_name`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `module_name` (`module_name`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `unique_field` (`option_group`,`option_name`), ADD KEY `options_option_group__idx` (`option_group`) USING BTREE;

--
-- Indexes for table `photos`
--
ALTER TABLE `photos`
 ADD PRIMARY KEY (`id`), ADD KEY `photos_photo_album_id__idx` (`photo_album_id`) USING BTREE;

--
-- Indexes for table `pollings`
--
ALTER TABLE `pollings`
 ADD PRIMARY KEY (`id`), ADD KEY `pollings_answer_id__idx` (`answer_id`) USING BTREE;

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
 ADD PRIMARY KEY (`id`), ADD KEY `posts_post_author__idx` (`post_author`) USING BTREE;

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `question` (`question`);

--
-- Indexes for table `quotes`
--
ALTER TABLE `quotes`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `unique_field` (`quote`,`quote_by`);

--
-- Indexes for table `scholarships`
--
ALTER TABLE `scholarships`
 ADD PRIMARY KEY (`id`), ADD KEY `scholarships_student_id__idx` (`student_id`) USING BTREE;

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `unique_field` (`setting_group`,`setting_variable`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
 ADD PRIMARY KEY (`id`), ADD KEY `students_registration_number__idx` (`registration_number`) USING BTREE, ADD KEY `students_identity_number__idx` (`identity_number`) USING BTREE, ADD KEY `students_full_name__idx` (`full_name`) USING BTREE, ADD KEY `students_first_choice_id__idx` (`first_choice_id`) USING BTREE, ADD KEY `students_second_choice_id__idx` (`second_choice_id`) USING BTREE, ADD KEY `students_major_id__idx` (`major_id`) USING BTREE, ADD KEY `students_admission_phase_id__idx` (`admission_phase_id`) USING BTREE, ADD KEY `students_admission_type_id__idx` (`admission_type_id`) USING BTREE, ADD KEY `students_student_status_id__idx` (`student_status_id`) USING BTREE;

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `tag` (`tag`);

--
-- Indexes for table `themes`
--
ALTER TABLE `themes`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `theme_name` (`theme_name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`), ADD KEY `users_user_group_id__idx` (`user_group_id`) USING BTREE, ADD KEY `users_user_profile_id__idx` (`user_profile_id`) USING BTREE;

--
-- Indexes for table `user_groups`
--
ALTER TABLE `user_groups`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `user_group` (`user_group`);

--
-- Indexes for table `user_privileges`
--
ALTER TABLE `user_privileges`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `unique_field` (`user_group_id`,`module_id`), ADD KEY `user_privileges_user_group_id__idx` (`user_group_id`) USING BTREE, ADD KEY `user_privileges_module_id__idx` (`module_id`) USING BTREE;

--
-- Indexes for table `_sessions`
--
ALTER TABLE `_sessions`
 ADD KEY `ci_sessions_TIMESTAMP` (`timestamp`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `academic_years`
--
ALTER TABLE `academic_years`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `achievements`
--
ALTER TABLE `achievements`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `admission_phases`
--
ALTER TABLE `admission_phases`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `admission_quotas`
--
ALTER TABLE `admission_quotas`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `albums`
--
ALTER TABLE `albums`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `answers`
--
ALTER TABLE `answers`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `class_groups`
--
ALTER TABLE `class_groups`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `class_group_settings`
--
ALTER TABLE `class_group_settings`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `class_group_students`
--
ALTER TABLE `class_group_students`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `files`
--
ALTER TABLE `files`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `image_sliders`
--
ALTER TABLE `image_sliders`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `links`
--
ALTER TABLE `links`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `login_attempts`
--
ALTER TABLE `login_attempts`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `majors`
--
ALTER TABLE `majors`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=170;
--
-- AUTO_INCREMENT for table `photos`
--
ALTER TABLE `photos`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `pollings`
--
ALTER TABLE `pollings`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `quotes`
--
ALTER TABLE `quotes`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `scholarships`
--
ALTER TABLE `scholarships`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=93;
--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT for table `themes`
--
ALTER TABLE `themes`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `user_groups`
--
ALTER TABLE `user_groups`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `user_privileges`
--
ALTER TABLE `user_privileges`
MODIFY `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
