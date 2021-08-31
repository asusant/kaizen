# ************************************************************
# Sequel Pro SQL dump
# Version 5446
#
# https://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.5-10.4.6-MariaDB)
# Database: kaizen
# Generation Time: 2021-08-30 18:05:59 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table app_setting
# ------------------------------------------------------------

DROP TABLE IF EXISTS `app_setting`;

CREATE TABLE `app_setting` (
  `id_app_setting` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(192) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_app_setting`),
  UNIQUE KEY `app_setting_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `app_setting` WRITE;
/*!40000 ALTER TABLE `app_setting` DISABLE KEYS */;

INSERT INTO `app_setting` (`id_app_setting`, `key`, `content`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`)
VALUES
	(1,'app_logo','images/logo/LogoCapitalTech.png','2021-03-19 14:07:17','2021-08-30 13:56:33',NULL,NULL,1,NULL),
	(2,'app_company_name','Capital Technology','2021-03-19 14:07:17','2021-08-29 16:57:39',NULL,NULL,1,NULL),
	(3,'app_company_desc','Every Tech Thing(s) You Need','2021-03-19 14:07:17','2021-08-29 16:57:39',NULL,NULL,1,NULL),
	(4,'app_company_address','St. San Joseph','2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,NULL,NULL,NULL),
	(5,'app_company_logo','logo.png','2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,NULL,NULL,NULL),
	(6,'app_year','2021','2021-03-19 14:07:17','2021-04-19 14:56:27',NULL,NULL,1,NULL),
	(7,'app_company_site','https://capitaltech.id','2021-03-19 14:07:17','2021-08-29 16:57:39',NULL,NULL,1,NULL);

/*!40000 ALTER TABLE `app_setting` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table certification_class
# ------------------------------------------------------------

DROP TABLE IF EXISTS `certification_class`;

CREATE TABLE `certification_class` (
  `class_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `desc` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `n_repeat` tinyint(4) NOT NULL,
  `order` tinyint(4) NOT NULL,
  `group` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `certification_class` WRITE;
/*!40000 ALTER TABLE `certification_class` DISABLE KEYS */;

INSERT INTO `certification_class` (`class_id`, `key`, `desc`, `n_repeat`, `order`, `group`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`)
VALUES
	(1,'LEVEL 1','Initiate Level 1',4,1,'LEVEL 1','2021-08-30 10:52:46','2021-08-30 10:54:14',NULL,1,1,NULL),
	(2,'RE LEVEL 1','Repeat Level 1',4,2,'LEVEL 1','2021-08-30 10:53:08','2021-08-30 10:54:18',NULL,1,1,NULL),
	(3,'LEVEL 2','Initiate Level 2',4,3,'LEVEL 2','2021-08-30 10:53:37','2021-08-30 10:53:37',NULL,1,NULL,NULL),
	(4,'RE LEVEL 2','Repeat Level 2',4,4,'LEVEL 2','2021-08-30 10:54:38','2021-08-30 10:54:38',NULL,1,NULL,NULL),
	(5,'LEVEL 3','Initiate Level 3',2,5,'LEVEL 3','2021-08-30 10:54:51','2021-08-30 10:54:51',NULL,1,NULL,NULL),
	(6,'RE LEVEL 3','Repeat Level 3',2,6,'LEVEL 3','2021-08-30 10:55:04','2021-08-30 10:55:04',NULL,1,NULL,NULL),
	(7,'LEVEL 4','Initiate Level 4',2,7,'LEVEL 4','2021-08-30 10:55:19','2021-08-30 10:55:19',NULL,1,NULL,NULL),
	(8,'RE LEVEL 4','Initiate Level 4',2,8,'LEVEL 4','2021-08-30 10:55:32','2021-08-30 10:55:32',NULL,1,NULL,NULL),
	(9,'LEVEL 5','Initiate Level 5',2,9,'LEVEL 5','2021-08-30 10:55:46','2021-08-30 10:55:46',NULL,1,NULL,NULL),
	(10,'RE LEVEL 5','Repeat Level 5',2,10,'LEVEL 5','2021-08-30 10:56:05','2021-08-30 10:56:05',NULL,1,NULL,NULL),
	(11,'LEVEL 6','Initiate Level 6',3,11,NULL,'2021-08-30 21:03:18','2021-08-30 21:03:26','2021-08-30 21:03:26',1,NULL,1);

/*!40000 ALTER TABLE `certification_class` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table certification_history
# ------------------------------------------------------------

DROP TABLE IF EXISTS `certification_history`;

CREATE TABLE `certification_history` (
  `cert_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int(10) unsigned NOT NULL,
  `class_id` int(10) unsigned NOT NULL,
  `date_start` date NOT NULL,
  `date_end` date NOT NULL,
  `cert_desc` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cert_pass` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `final_mark` tinyint(4) NOT NULL,
  `publication_no` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subgroup_name` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `personel_area` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`cert_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `certification_history` WRITE;
/*!40000 ALTER TABLE `certification_history` DISABLE KEYS */;

INSERT INTO `certification_history` (`cert_id`, `employee_id`, `class_id`, `date_start`, `date_end`, `cert_desc`, `cert_pass`, `final_mark`, `publication_no`, `subgroup_name`, `personel_area`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`)
VALUES
	(1,41,6,'2020-08-02','2020-08-02','SERTIFIKASI MANAJEMEN RISIKO','Lulus',95,'','S4 - DM','KANTOR PUSAT','2021-08-30 21:14:46','2021-08-30 21:14:46',NULL,NULL,NULL,NULL),
	(2,41,6,'2018-08-20','2018-08-20','SERTIFIKASI MANAJEMEN RISIKO','Lulus',95,'','S4 - DM','KANTOR PUSAT','2021-08-30 21:14:46','2021-08-30 21:14:46',NULL,NULL,NULL,NULL),
	(3,41,5,'2016-09-03','2016-09-03','SERTIFIKASI MANAJEMEN RISIKO','Lulus',95,'','S4 - DM','KANTOR PUSAT','2021-08-30 21:14:46','2021-08-30 21:14:46',NULL,NULL,NULL,NULL),
	(4,41,3,'2015-09-03','2015-09-03','SERTIFIKASI MANAJEMEN RISIKO','Lulus',95,'','S4 - DM','KANTOR PUSAT','2021-08-30 21:14:46','2021-08-30 21:14:46',NULL,NULL,NULL,NULL),
	(5,41,2,'2014-09-03','2014-09-03','SERTIFIKASI MANAJEMEN RISIKO','Lulus',95,'','S4 - DM','KANTOR PUSAT','2021-08-30 21:14:46','2021-08-30 21:14:46',NULL,NULL,NULL,NULL),
	(6,41,1,'2010-09-03','2010-09-03','SERTIFIKASI MANAJEMEN RISIKO','Lulus',95,'','S4 - DM','KANTOR PUSAT','2021-08-30 21:14:46','2021-08-30 21:14:46',NULL,NULL,NULL,NULL),
	(7,44,8,'2020-08-02','2020-08-02','SERTIFIKASI MANAJEMEN RISIKO','Lulus',95,'','S4 - DM','KANTOR PUSAT','2021-08-30 21:14:46','2021-08-30 21:14:46',NULL,NULL,NULL,NULL),
	(8,44,8,'2018-08-20','2018-08-20','SERTIFIKASI MANAJEMEN RISIKO','Lulus',95,'','S4 - DM','KANTOR PUSAT','2021-08-30 21:14:46','2021-08-30 21:14:46',NULL,NULL,NULL,NULL),
	(9,44,7,'2016-09-07','2016-09-07','SERTIFIKASI MANAJEMEN RISIKO','Tidak Lulus',95,'','S4 - DM','KANTOR PUSAT','2021-08-30 21:14:46','2021-08-30 21:14:46',NULL,NULL,NULL,NULL),
	(10,44,5,'2015-09-07','2015-09-07','SERTIFIKASI MANAJEMEN RISIKO','Tidak Lulus',95,'','S4 - DM','KANTOR PUSAT','2021-08-30 21:14:46','2021-08-30 21:14:46',NULL,NULL,NULL,NULL),
	(11,44,6,'2014-09-07','2014-09-07','SERTIFIKASI MANAJEMEN RISIKO','Lulus',95,'','S4 - DM','KANTOR PUSAT','2021-08-30 21:14:46','2021-08-30 21:14:46',NULL,NULL,NULL,NULL),
	(12,44,5,'2012-09-07','2012-09-07','SERTIFIKASI MANAJEMEN RISIKO','Lulus',95,'','S4 - DM','KANTOR PUSAT','2021-08-30 21:14:46','2021-08-30 21:14:46',NULL,NULL,NULL,NULL),
	(13,44,3,'2011-09-07','2011-09-07','SERTIFIKASI MANAJEMEN RISIKO','Lulus',95,'','S4 - DM','KANTOR PUSAT','2021-08-30 21:14:46','2021-08-30 21:14:46',NULL,NULL,NULL,NULL),
	(14,44,2,'2009-09-07','2009-09-07','SERTIFIKASI MANAJEMEN RISIKO','Tidak Lulus',95,'','S4 - DM','KANTOR PUSAT','2021-08-30 21:14:46','2021-08-30 21:14:46',NULL,NULL,NULL,NULL),
	(15,44,2,'2005-09-07','2005-09-07','SERTIFIKASI MANAJEMEN RISIKO','Lulus',96,'','S4 - DM','KANTOR PUSAT','2021-08-30 21:14:46','2021-08-30 21:14:46',NULL,NULL,NULL,NULL),
	(16,44,1,'2001-09-07','2001-09-07','SERTIFIKASI MANAJEMEN RISIKO','Lulus',97,'','S4 - DM','KANTOR PUSAT','2021-08-30 21:14:46','2021-08-30 21:14:46',NULL,NULL,NULL,NULL),
	(17,47,5,'2020-01-12','2020-01-12','SERTIFIKASI MANAJEMEN RISIKO','Lulus',95,'','S4 - DM','KANTOR PUSAT','2021-08-30 21:14:46','2021-08-30 21:14:46',NULL,NULL,NULL,NULL),
	(18,47,4,'2017-09-03','2017-09-03','SERTIFIKASI MANAJEMEN RISIKO','Lulus',95,'','S4 - DM','KANTOR PUSAT','2021-08-30 21:14:46','2021-08-30 21:14:46',NULL,NULL,NULL,NULL),
	(19,47,3,'2015-09-03','2015-09-03','SERTIFIKASI MANAJEMEN RISIKO','Lulus',95,'','S4 - DM','KANTOR PUSAT','2021-08-30 21:14:46','2021-08-30 21:14:46',NULL,NULL,NULL,NULL),
	(20,47,2,'2014-09-03','2014-09-03','SERTIFIKASI MANAJEMEN RISIKO','Lulus',95,'','S4 - DM','KANTOR PUSAT','2021-08-30 21:14:47','2021-08-30 21:14:47',NULL,NULL,NULL,NULL),
	(21,47,1,'2010-09-03','2010-09-03','SERTIFIKASI MANAJEMEN RISIKO','Lulus',95,'','S4 - DM','KANTOR PUSAT','2021-08-30 21:14:47','2021-08-30 21:14:47',NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `certification_history` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table employee
# ------------------------------------------------------------

DROP TABLE IF EXISTS `employee`;

CREATE TABLE `employee` (
  `employee_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nip` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` enum('Male','Female') COLLATE utf8mb4_unicode_ci NOT NULL,
  `position_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position_desc` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_birth` date DEFAULT NULL,
  `status` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `personel_area` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;

INSERT INTO `employee` (`employee_id`, `nip`, `full_name`, `gender`, `position_code`, `position_desc`, `date_of_birth`, `status`, `personel_area`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`)
VALUES
	(41,'5030656','DOJA CAT','Female','S3 - M','ADVISER CREDIT','1969-01-15','Active employee','KANTOR PUSAT','2021-08-30 21:13:13','2021-08-30 21:13:13',NULL,NULL,NULL,NULL),
	(42,'5031423','BRUNO MARS','Male','S5 - DM','IT ANALYST IT','1970-07-13','Active employee','KANTOR PUSAT','2021-08-30 21:13:13','2021-08-30 21:13:13',NULL,NULL,NULL,NULL),
	(43,'5031643','JAY Z','Male','S4 - AM','SO SUBDIV','1969-12-28','Active employee','KANTOR PUSAT','2021-08-30 21:13:13','2021-08-30 21:13:13',NULL,NULL,NULL,NULL),
	(44,'5031821','ARIANA GRANDE','Female','S4 - DM','SO FINANCE ','1969-08-24','Active employee','KANTOR PUSAT','2021-08-30 21:13:13','2021-08-30 21:13:13',NULL,NULL,NULL,NULL),
	(45,'5031942','BEYONCE','Female','S6 - PM','ASO ACCOUNT','1971-04-04','Active employee','KANTOR PUSAT','2021-08-30 21:13:13','2021-08-30 21:13:13',NULL,NULL,NULL,NULL),
	(46,'5032042','SHAWN MENDES','Male','S5 - AM','ADVISER CREDIT','1970-02-01','Active employee','KANTOR PUSAT','2021-08-30 21:13:13','2021-08-30 21:13:13',NULL,NULL,NULL,NULL),
	(47,'5032143','TYGA','Male','S6 - AM','IT ANALYST IT','1968-08-28','Active employee','KANTOR PUSAT','2021-08-30 21:13:13','2021-08-30 21:13:13',NULL,NULL,NULL,NULL),
	(48,'5032299','DRAKE','Male','S7A  - SPV','STAF ADMINISTRASI SENIOR','1972-01-05','Active employee','KANTOR PUSAT','2021-08-30 21:13:13','2021-08-30 21:13:13',NULL,NULL,NULL,NULL),
	(49,'5032387','NICKI MINAJ','Female','S5 - DM','SO FINANCE ','1971-12-21','Active employee','WILAYAH IX','2021-08-30 21:13:13','2021-08-30 21:13:13',NULL,NULL,NULL,NULL),
	(50,'5032465','THE WEEKEND','Male','S5 - DM','ASO ACCOUNT','1971-02-24','Active employee','KANTOR PUSAT','2021-08-30 21:13:13','2021-08-30 21:13:13',NULL,NULL,NULL,NULL),
	(51,'5032565','BILLY PORTER','Male','S5 - DM','KEPALA OPERASI & LAYANAN KREDIT','1971-09-21','Active employee','KANTOR PUSAT','2021-08-30 21:13:13','2021-08-30 21:13:13',NULL,NULL,NULL,NULL),
	(52,'5032645','FUTURE','Male','S6 - AM','IT ANALYST IT','1970-05-31','Active employee','WILAYAH IV','2021-08-30 21:13:13','2021-08-30 21:13:13',NULL,NULL,NULL,NULL),
	(53,'5032875','SZA','Female','S4 - M','SO LAYANAN','1972-03-01','Active employee','KANTOR PUSAT','2021-08-30 21:13:13','2021-08-30 21:13:13',NULL,NULL,NULL,NULL),
	(54,'5033030','JUSTIN TIMBERLAKE','Male','S4 - M','SO FINANCE ','1968-10-03','Active employee','KANTOR PUSAT','2021-08-30 21:13:13','2021-08-30 21:13:13',NULL,NULL,NULL,NULL),
	(55,'5033351','LADY GAGA','Female','S5 - DM','ASO ACCOUNT','1970-12-21','Active employee','WILAYAH X','2021-08-30 21:13:13','2021-08-30 21:13:13',NULL,NULL,NULL,NULL),
	(56,'5033654','NORMANI','Female','S5 - DM','ADVISER CREDIT','1972-03-21','Active employee','WILAYAH VIII','2021-08-30 21:13:13','2021-08-30 21:13:13',NULL,NULL,NULL,NULL),
	(57,'5034000','CARDI B','Female','S4 - DM','IT ANALYST IT','1970-05-31','Active employee','KANTOR PUSAT','2021-08-30 21:13:13','2021-08-30 21:13:13',NULL,NULL,NULL,NULL),
	(58,'5034143','MIGOS','Male','S5 - DM','ACCOUNT OFF','1972-03-01','Active employee','KANTOR PUSAT','2021-08-30 21:13:13','2021-08-30 21:13:13',NULL,NULL,NULL,NULL),
	(59,'5034689','GIVEON','Male','S5 - AM','SO FINANCE ','1968-10-03','Active employee','KANTOR PUSAT','2021-08-30 21:13:13','2021-08-30 21:13:13',NULL,NULL,NULL,NULL),
	(60,'5034787','RIHANNA','Female','S6 - PM','ASO ACCOUNT','1970-12-21','Active employee','WILAYAH X','2021-08-30 21:13:13','2021-08-30 21:13:13',NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table failed_jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `failed_jobs`;

CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_100000_create_password_resets_table',1),
	(2,'2019_08_19_000000_create_failed_jobs_table',1),
	(3,'2021_03_18_000005_create_sys_menu_groups_table',1),
	(4,'2021_03_18_062628_create_sys_modul_groups_table',1),
	(5,'2021_03_18_062639_create_sys_moduls_table',1),
	(6,'2021_03_18_062650_create_sys_roles_table',1),
	(7,'2021_03_18_062650_create_sys_users_table',1),
	(8,'2021_03_18_062651_create_sys_privileges_table',1),
	(9,'2021_03_18_062800_create_sys_user_roles_table',1),
	(10,'2021_03_18_142319_create_sys_settings_table',1),
	(11,'2021_03_18_142328_create_app_settings_table',1),
	(12,'2021_04_09_095149_create_sys_logs_table',2),
	(13,'2021_04_09_101356_create_sys_emails_table',2),
	(14,'2021_04_21_122946_create_validasi_table',3),
	(15,'2021_05_04_080537_create_p_category_table',4),
	(16,'2021_05_04_080550_create_p_item_table',4),
	(17,'2021_05_04_081156_create_p_item_img_table',4),
	(18,'2021_05_17_114508_create_p_promo_header_table',5),
	(22,'2021_08_29_190207_add_employee_table',6),
	(23,'2021_08_30_074802_add_certification_table',6),
	(24,'2021_08_30_080705_add_class_table',6);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table sys_email
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_email`;

CREATE TABLE `sys_email` (
  `id_sys_email` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `to` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_processed` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_sys_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table sys_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_log`;

CREATE TABLE `sys_log` (
  `id_sys_log` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` int(10) unsigned NOT NULL,
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_address` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` varchar(192) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `kegiatan` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_a` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `data_b` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id_sys_log`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `sys_log` WRITE;
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;

INSERT INTO `sys_log` (`id_sys_log`, `id_user`, `user_name`, `ip_address`, `user_agent`, `kegiatan`, `data_a`, `data_b`, `created_at`, `updated_at`)
VALUES
	(1,1,'Hendi','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.1 Safari/605.1.15','Menambah data app_setting. id=12.','{\"key\":\"app_contoh_5\",\"content\":\"CONTOH\"}','null','2021-04-19 14:47:07','2021-04-19 14:47:07'),
	(2,1,'Hendi','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.1 Safari/605.1.15','Menambah data app_setting. id=13.','{\"key\":\"app_contoh_2\",\"content\":\"CONTOH\"}','null','2021-04-19 14:47:42','2021-04-19 14:47:42'),
	(3,1,'Hendi','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.1 Safari/605.1.15','Mengubah data app_setting. id=6.','{\"id_app_setting\":6,\"key\":\"app_year\",\"content\":\"2021\",\"created_at\":\"2021-03-19T07:07:17.000000Z\",\"updated_at\":\"2021-03-19T07:07:17.000000Z\",\"deleted_at\":null,\"created_by\":null,\"updated_by\":null,\"deleted_by\":null}','{\"id_app_setting\":6,\"key\":\"app_year\",\"content\":\"20212\",\"created_at\":\"2021-03-19 14:07:17\",\"updated_at\":\"2021-03-19 14:07:17\",\"deleted_at\":null,\"created_by\":null,\"updated_by\":1,\"deleted_by\":null}','2021-04-19 14:54:41','2021-04-19 14:54:41'),
	(6,1,'Hendi','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.1 Safari/605.1.15','Mengubah data app_setting. id=6.','{\"id_app_setting\":6,\"key\":\"app_year\",\"content\":\"20212\",\"created_at\":\"2021-03-19T07:07:17.000000Z\",\"updated_at\":\"2021-04-19T07:54:41.000000Z\",\"deleted_at\":null,\"created_by\":null,\"updated_by\":1,\"deleted_by\":null}','{\"id_app_setting\":6,\"key\":\"app_year\",\"content\":\"2021\",\"created_at\":\"2021-03-19 14:07:17\",\"updated_at\":\"2021-04-19 14:54:41\",\"deleted_at\":null,\"created_by\":null,\"updated_by\":1,\"deleted_by\":null}','2021-04-19 14:56:27','2021-04-19 14:56:27'),
	(7,1,'Hendi','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.1 Safari/605.1.15','Menambah data app_setting. id=5.','{\"key\":\"sys_coba\",\"content\":\"COBAH\"}','null','2021-04-19 15:08:14','2021-04-19 15:08:14'),
	(8,1,'Hendi','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data Role User. id=3.','{\"id_role\":null,\"nm_role\":\"Operator\",\"ket_role\":\"Untuk operator\"}','null','2021-04-20 07:36:13','2021-04-20 07:36:13'),
	(9,1,'Hendi','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data Role User. id=4.','{\"id_role\":null,\"nm_role\":\"Operator Subunit\",\"ket_role\":\"Operator sub unit keu\"}','null','2021-04-20 07:45:26','2021-04-20 07:45:26'),
	(10,1,'Hendi','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Role User. id=3.','{\"id_role\":3,\"nm_role\":\"Operator\",\"ket_role\":\"Untuk operator\",\"created_at\":\"2021-04-20T00:36:13.000000Z\",\"updated_at\":\"2021-04-20T00:36:13.000000Z\",\"deleted_at\":null,\"created_by\":null,\"updated_by\":null,\"deleted_by\":null}','{\"id_role\":\"3\",\"nm_role\":\"Operator Unit\",\"ket_role\":\"Untuk operator keu\"}','2021-04-20 07:48:02','2021-04-20 07:48:02'),
	(11,1,'Hendi','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Role User. id=3.','{\"id_role\":3,\"nm_role\":\"Operator Unit\",\"ket_role\":\"Untuk operator keu\",\"created_at\":\"2021-04-20T00:36:13.000000Z\",\"updated_at\":\"2021-04-20T00:48:02.000000Z\",\"deleted_at\":null,\"created_by\":null,\"updated_by\":null,\"deleted_by\":null}','{\"id_role\":\"3\",\"nm_role\":\"Operator Unit\",\"ket_role\":\"Untuk operator keu\"}','2021-04-20 07:48:14','2021-04-20 07:48:14'),
	(12,1,'Hendi','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data Role User. id=5.','{\"id_role\":null,\"nm_role\":\"Operator Khusus\",\"ket_role\":\"Khususon\"}','null','2021-04-20 09:46:16','2021-04-20 09:46:16'),
	(13,1,'Hendi','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menghapus data Role User. id=5.','{\"id_role\":5,\"nm_role\":\"Operator Khusus\",\"ket_role\":\"Khususon\",\"created_at\":\"2021-04-20 09:46:16\",\"updated_at\":\"2021-04-20 09:46:16\",\"deleted_at\":null,\"created_by\":null,\"updated_by\":null,\"deleted_by\":null}','null','2021-04-20 09:48:25','2021-04-20 09:48:25'),
	(14,1,'Hendi','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menghapus data Role User. id=5.','{\"id_role\":5,\"nm_role\":\"Operator Khusus\",\"ket_role\":\"Khususon\",\"created_at\":\"2021-04-20 09:46:16\",\"updated_at\":\"2021-04-20 09:46:16\",\"deleted_at\":null,\"created_by\":null,\"updated_by\":null,\"deleted_by\":null}','null','2021-04-20 09:48:54','2021-04-20 09:48:54'),
	(15,1,'Hendi','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menghapus data Role User. id=5.','{\"id_role\":5,\"nm_role\":\"Operator Khusus\",\"ket_role\":\"Khususon\",\"created_at\":\"2021-04-20 09:46:16\",\"updated_at\":\"2021-04-20 09:48:54\",\"deleted_at\":null,\"created_by\":null,\"updated_by\":null,\"deleted_by\":1}','null','2021-04-20 09:49:01','2021-04-20 09:49:01'),
	(16,1,'Hendi','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data Menu Group. id=3.','{\"id_role\":null,\"nm_menu_group\":\"Data Referensi\",\"urutan\":\"3\"}','null','2021-04-20 10:08:18','2021-04-20 10:08:18'),
	(17,1,'Hendi','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Menu Group. id=3.','{\"id_menu_group\":3,\"nm_menu_group\":\"Data Referensi\",\"urutan\":3,\"created_at\":\"2021-04-20T03:08:18.000000Z\",\"updated_at\":\"2021-04-20T03:08:18.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','{\"id_menu_group\":\"3\",\"nm_menu_group\":\"Data Referensis\",\"urutan\":\"3\"}','2021-04-20 10:09:12','2021-04-20 10:09:12'),
	(18,1,'Hendi','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menghapus data Menu Group. id=.','{\"id_menu_group\":3,\"nm_menu_group\":\"Data Referensis\",\"urutan\":3,\"created_at\":\"2021-04-20 10:08:18\",\"updated_at\":\"2021-04-20 10:09:12\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','null','2021-04-20 10:09:19','2021-04-20 10:09:19'),
	(19,1,'Hendi','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data Modul Grup. id=5.','{\"id_menu_group\":\"2\",\"id_module_group\":null,\"nm_modul_group\":\"Data Referensi\",\"urutan\":\"10\",\"icon_modul_group\":\"bi bi-gear\"}','null','2021-04-20 11:52:04','2021-04-20 11:52:04'),
	(20,1,'Hendi','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menghapus data Menu Group. id=.','{\"id_modul_group\":5,\"id_menu_group\":2,\"route_prefix\":null,\"nm_modul_group\":\"Data Referensi\",\"icon_modul_group\":\"bi bi-gear\",\"urutan\":10,\"created_at\":\"2021-04-20 11:52:04\",\"updated_at\":\"2021-04-20 11:52:04\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','null','2021-04-20 11:56:53','2021-04-20 11:56:53'),
	(21,1,'Hendi','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data Modul. id=8.','{\"id_modul_group\":\"3\",\"id_modul\":null,\"nm_modul\":\"Nama Modul\",\"urutan\":\"200\",\"route_prefix\":\"nama_modul\",\"is_tampil\":\"1\"}','null','2021-04-20 12:27:02','2021-04-20 12:27:02'),
	(22,1,'Hendi','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Modul. id=8.','{\"id_modul\":8,\"id_modul_group\":3,\"route_prefix\":\"nama_modul\",\"nm_modul\":\"Nama Modul\",\"icon_modul\":\"\",\"urutan\":200,\"is_tampil\":1,\"created_at\":\"2021-04-20T05:27:02.000000Z\",\"updated_at\":\"2021-04-20T05:27:02.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','{\"id_modul_group\":\"3\",\"id_modul\":\"8\",\"nm_modul\":\"Nama Modul\",\"urutan\":\"200\",\"route_prefix\":\"nama_modul\",\"is_tampil\":\"0\"}','2021-04-20 12:30:33','2021-04-20 12:30:33'),
	(23,1,'Hendi','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Modul. id=8.','{\"id_modul\":8,\"id_modul_group\":3,\"route_prefix\":\"nama_modul\",\"nm_modul\":\"Nama Modul\",\"icon_modul\":\"\",\"urutan\":200,\"is_tampil\":0,\"created_at\":\"2021-04-20T05:27:02.000000Z\",\"updated_at\":\"2021-04-20T05:30:33.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','{\"id_modul_group\":\"3\",\"id_modul\":\"8\",\"nm_modul\":\"Nama Modul\",\"urutan\":\"200\",\"route_prefix\":\"nama_modul\",\"is_tampil\":\"0\"}','2021-04-20 12:30:36','2021-04-20 12:30:36'),
	(24,1,'Hendi','127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menghapus data Modul. id=8.','{\"id_modul\":8,\"id_modul_group\":3,\"route_prefix\":\"nama_modul\",\"nm_modul\":\"Nama Modul\",\"icon_modul\":\"\",\"urutan\":200,\"is_tampil\":0,\"created_at\":\"2021-04-20 12:27:02\",\"updated_at\":\"2021-04-20 12:30:33\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','null','2021-04-20 12:31:05','2021-04-20 12:31:05'),
	(25,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data app_setting. id=1.','{\"id_sys_setting\":1,\"key\":\"sys_name\",\"content\":\"Bobb\",\"created_at\":\"2021-03-19T07:07:17.000000Z\",\"updated_at\":\"2021-03-19T07:07:17.000000Z\",\"deleted_at\":null,\"created_by\":null,\"updated_by\":null,\"deleted_by\":null}','{\"id_sys_setting\":1,\"key\":\"sys_name\",\"content\":\"RPD\",\"created_at\":\"2021-03-19 14:07:17\",\"updated_at\":\"2021-03-19 14:07:17\",\"deleted_at\":null,\"created_by\":null,\"updated_by\":1,\"deleted_by\":null}','2021-04-20 12:42:07','2021-04-20 12:42:07'),
	(26,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data app_setting. id=3.','{\"id_sys_setting\":3,\"key\":\"sys_author_name\",\"content\":\"Bobby\",\"created_at\":\"2021-03-19T07:07:17.000000Z\",\"updated_at\":\"2021-03-19T07:07:17.000000Z\",\"deleted_at\":null,\"created_by\":null,\"updated_by\":null,\"deleted_by\":null}','{\"id_sys_setting\":3,\"key\":\"sys_author_name\",\"content\":\"UNNES\",\"created_at\":\"2021-03-19 14:07:17\",\"updated_at\":\"2021-03-19 14:07:17\",\"deleted_at\":null,\"created_by\":null,\"updated_by\":1,\"deleted_by\":null}','2021-04-20 12:43:43','2021-04-20 12:43:43'),
	(27,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data Grup Menu. id=4.','{\"id_menu_group\":null,\"nm_menu_group\":\"RPD\",\"urutan\":\"3\"}','null','2021-04-20 12:44:14','2021-04-20 12:44:14'),
	(28,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data Modul Grup. id=6.','{\"id_menu_group\":\"4\",\"id_module_group\":null,\"nm_modul_group\":\"Kegiatan RPD\",\"urutan\":\"1\",\"icon_modul_group\":\"bi bi-achive-fill\"}','null','2021-04-20 12:57:41','2021-04-20 12:57:41'),
	(29,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data Modul. id=9.','{\"id_modul_group\":\"6\",\"id_modul\":null,\"nm_modul\":\"Kegiatan RPD\",\"urutan\":\"1\",\"route_prefix\":\"kegiatan_rpd\",\"is_tampil\":\"1\"}','null','2021-04-20 13:01:04','2021-04-20 13:01:04'),
	(30,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data Role User. id=6.','{\"id_role\":null,\"nm_role\":\"PPK\",\"ket_role\":\"PPK Unit\"}','null','2021-04-20 13:21:23','2021-04-20 13:21:23'),
	(31,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data Role User. id=7.','{\"id_role\":null,\"nm_role\":\"Staf PPK\",\"ket_role\":\"Staff PPK Unit\"}','null','2021-04-20 13:21:31','2021-04-20 13:21:31'),
	(32,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data Role User. id=8.','{\"id_role\":null,\"nm_role\":\"Penguji\",\"ket_role\":\"Penguji pusat\"}','null','2021-04-20 13:21:51','2021-04-20 13:21:51'),
	(33,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data Role User. id=9.','{\"id_role\":null,\"nm_role\":\"BPP\",\"ket_role\":\"BPP Unit\"}','null','2021-04-20 13:22:11','2021-04-20 13:22:11'),
	(34,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data RPD Kegiatan. id=1.','{\"k_id\":\"98951\",\"unit\":\"1010\",\"unit_asli\":\"9008\",\"nm_kegiatan\":\"Pembayaran Remun 2022\",\"bulan_rpd\":\"5\",\"ls\":\"10000000\",\"up\":\"0\"}','null','2021-04-20 14:11:05','2021-04-20 14:11:05'),
	(35,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menghapus data Role User. id=1.','{\"id_rpd\":1,\"k_id\":98951,\"unit_asli\":9008,\"unit\":1010,\"nm_kegiatan\":\"Pembayaran Remun 2022\",\"bulan_rpd\":5,\"ls\":10000000,\"up\":0,\"created_at\":\"2021-04-20 14:11:05\",\"updated_at\":\"2021-04-20 14:11:05\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','null','2021-04-20 14:20:21','2021-04-20 14:20:21'),
	(36,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data RPD Kegiatan. id=2.','{\"id_rpd\":null,\"k_id\":\"98951\",\"unit\":\"1010\",\"unit_asli\":\"9008\",\"nm_kegiatan\":\"Remunerasi Mei 2021\",\"bulan_rpd\":\"5\",\"ls\":\"10000000\",\"up\":\"0\"}','null','2021-04-20 14:21:37','2021-04-20 14:21:37'),
	(37,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data RPD Kegiatan. id=3.','{\"id_rpd\":null,\"k_id\":\"98951\",\"unit\":\"1010\",\"unit_asli\":\"9008\",\"nm_kegiatan\":\"Pembayaran Remun Mei 2022\",\"bulan_rpd\":\"5\",\"ls\":\"25,000,000\",\"up\":\"0\"}','null','2021-04-20 14:45:24','2021-04-20 14:45:24'),
	(38,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menghapus data Role User. id=2.','{\"id_rpd\":2,\"k_id\":98951,\"unit_asli\":9008,\"unit\":1010,\"nm_kegiatan\":\"Remunerasi Mei 2021\",\"bulan_rpd\":5,\"ls\":10000000,\"up\":0,\"created_at\":\"2021-04-20 14:21:37\",\"updated_at\":\"2021-04-20 14:21:37\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','null','2021-04-20 14:45:34','2021-04-20 14:45:34'),
	(39,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data RPD Kegiatan. id=4.','{\"id_rpd\":null,\"k_id\":\"98951\",\"unit\":\"1010\",\"unit_asli\":\"9008\",\"nm_kegiatan\":\"Pembayaran RPD Juni 2021\",\"bulan_rpd\":\"5\",\"ls\":\"0\",\"up\":\"50,000,000\"}','null','2021-04-20 14:46:22','2021-04-20 14:46:22'),
	(40,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Kegiatan RPD. id=4.','{\"id_rpd\":4,\"k_id\":98951,\"unit_asli\":9008,\"unit\":1010,\"nm_kegiatan\":\"Pembayaran RPD Juni 2021\",\"bulan_rpd\":5,\"ls\":0,\"up\":50000000,\"created_at\":\"2021-04-20T07:46:22.000000Z\",\"updated_at\":\"2021-04-20T07:46:22.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','{\"id_rpd\":\"4\",\"k_id\":\"98951\",\"unit\":\"1010\",\"unit_asli\":\"9008\",\"nm_kegiatan\":\"Pembayaran RPD Juni 2021\",\"bulan_rpd\":\"5\",\"ls\":\"0\",\"up\":\"50000000\"}','2021-04-20 14:46:37','2021-04-20 14:46:37'),
	(41,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Kegiatan RPD. id=4.','{\"id_rpd\":4,\"k_id\":98951,\"unit_asli\":9008,\"unit\":1010,\"nm_kegiatan\":\"Pembayaran RPD Juni 2021\",\"bulan_rpd\":5,\"ls\":0,\"up\":50000000,\"created_at\":\"2021-04-20T07:46:22.000000Z\",\"updated_at\":\"2021-04-20T07:46:37.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','{\"id_rpd\":\"4\",\"k_id\":\"98951\",\"unit\":\"1010\",\"unit_asli\":\"9008\",\"nm_kegiatan\":\"Pembayaran RPD Juni 2021\",\"bulan_rpd\":\"5\",\"ls\":\"0\",\"up\":\"100,000,000\"}','2021-04-20 14:46:41','2021-04-20 14:46:41'),
	(42,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data RPD Kegiatan. id=5.','{\"id_rpd\":null,\"k_id\":\"98951\",\"unit\":\"1010\",\"unit_asli\":\"9008\",\"nm_kegiatan\":\"Pembayaran Remun susulan Mei 2021\",\"bulan_rpd\":\"5\",\"ls\":\"15,000,000\",\"up\":\"0\"}','null','2021-04-20 14:49:48','2021-04-20 14:49:48'),
	(43,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data Modul Grup. id=7.','{\"id_menu_group\":\"4\",\"id_module_group\":null,\"nm_modul_group\":\"Rincian RPD\",\"urutan\":\"2\",\"icon_modul_group\":\"bi bi-credit-card\"}','null','2021-04-20 14:58:55','2021-04-20 14:58:55'),
	(44,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data Modul. id=10.','{\"id_modul_group\":\"7\",\"id_modul\":null,\"nm_modul\":\"Rincian RPD\",\"urutan\":\"1\",\"route_prefix\":\"rincian_rpd\",\"is_tampil\":\"1\"}','null','2021-04-20 14:59:27','2021-04-20 14:59:27'),
	(45,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data RPD Kegiatan. id=6.','{\"id_rpd\":null,\"k_id\":\"98951\",\"unit\":\"1010\",\"unit_asli\":\"9008\",\"nm_kegiatan\":\"Kegiatan Ke-4\",\"bulan_rpd\":\"5\",\"ls\":\"100,000\",\"up\":\"0\"}','null','2021-04-20 15:47:37','2021-04-20 15:47:37'),
	(46,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data Modul Grup. id=8.','{\"id_menu_group\":\"4\",\"id_module_group\":null,\"nm_modul_group\":\"Realisasi RPD\",\"urutan\":\"3\",\"icon_modul_group\":\"bi bi-cash-stack\"}','null','2021-04-20 15:48:52','2021-04-20 15:48:52'),
	(47,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data Modul. id=11.','{\"id_modul_group\":\"8\",\"id_modul\":null,\"nm_modul\":\"Realisasi RPD\",\"urutan\":\"1\",\"route_prefix\":\"realisasi_rpd\",\"is_tampil\":\"1\"}','null','2021-04-20 15:50:31','2021-04-20 15:50:31'),
	(48,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data Modul Grup. id=9.','{\"id_menu_group\":\"4\",\"id_module_group\":null,\"nm_modul_group\":\"Dok. Laporan RPD\",\"urutan\":\"4\",\"icon_modul_group\":\"bi bi-file-earmark-ruled\"}','null','2021-04-20 16:24:50','2021-04-20 16:24:50'),
	(49,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data Modul. id=12.','{\"id_modul_group\":\"9\",\"id_modul\":null,\"nm_modul\":\"B.A. Saldo RPD\",\"urutan\":\"1\",\"route_prefix\":\"laporan_saldo_rpd\",\"is_tampil\":\"1\"}','null','2021-04-20 16:26:05','2021-04-20 16:26:05'),
	(50,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Modul. id=9.','{\"id_modul\":9,\"id_modul_group\":6,\"route_prefix\":\"kegiatan_rpd\",\"nm_modul\":\"Kegiatan RPD\",\"icon_modul\":\"\",\"urutan\":1,\"is_tampil\":1,\"created_at\":\"2021-04-20T06:01:04.000000Z\",\"updated_at\":\"2021-04-20T06:01:04.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','{\"id_modul_group\":\"6\",\"id_modul\":\"9\",\"nm_modul\":\"Input Kegiatan\",\"urutan\":\"1\",\"route_prefix\":\"kegiatan_rpd\",\"is_tampil\":\"1\"}','2021-04-20 16:33:37','2021-04-20 16:33:37'),
	(51,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data RPD Kegiatan. id=7.','{\"id_rpd\":null,\"k_id\":\"98951\",\"unit\":\"1010\",\"unit_asli\":\"9008\",\"nm_kegiatan\":\"Kegiatan\",\"bulan_rpd\":\"5\",\"ls\":\"10,000\",\"up\":\"20,000\"}','null','2021-04-21 08:03:22','2021-04-21 08:03:22'),
	(52,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Kegiatan RPD. id=3.','{\"id_rpd\":3,\"k_id\":98951,\"unit_asli\":9008,\"unit\":1010,\"nomor\":1,\"nm_kegiatan\":\"Pembayaran Remun Mei 2022\",\"tahun\":2021,\"bulan_rpd\":5,\"ls\":25000000,\"up\":0,\"created_at\":\"2021-04-20T07:45:24.000000Z\",\"updated_at\":\"2021-04-20T07:45:24.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','{\"id_rpd\":\"3\",\"k_id\":\"98951\",\"unit\":\"1010\",\"unit_asli\":\"9008\",\"nm_kegiatan\":\"Pembayaran Remun Mei 2022\",\"bulan_rpd\":\"5\",\"ls\":\"25,000,000\",\"up\":\"0\"}','2021-04-21 08:05:52','2021-04-21 08:05:52'),
	(53,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Kegiatan RPD. id=4.','{\"id_rpd\":4,\"k_id\":98951,\"unit_asli\":9008,\"unit\":1010,\"nomor\":2,\"nm_kegiatan\":\"Pembayaran RPD Juni 2021\",\"tahun\":2021,\"bulan_rpd\":5,\"ls\":0,\"up\":100000000,\"created_at\":\"2021-04-20T07:46:22.000000Z\",\"updated_at\":\"2021-04-20T07:46:41.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','{\"id_rpd\":\"4\",\"k_id\":\"98951\",\"unit\":\"1010\",\"unit_asli\":\"9008\",\"nm_kegiatan\":\"Pembayaran RPD Juni 2021\",\"bulan_rpd\":\"5\",\"ls\":\"0\",\"up\":\"100,000,000\"}','2021-04-21 08:05:57','2021-04-21 08:05:57'),
	(54,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data User. id=3.','{\"id_user\":null,\"nm_user\":\"Bambang\",\"email_user\":\"bambang@gmail.com\",\"username_user\":\"bambang007\",\"password_user\":\"password\",\"identitas_user\":\"192187364732\",\"is_aktif\":\"1\"}','null','2021-04-21 08:49:55','2021-04-21 08:49:55'),
	(55,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data User. id=3.','{\"id_user\":3,\"username_user\":\"bambang007\",\"email_user\":\"bambang@gmail.com\",\"nm_user\":\"Bambang\",\"password_user\":\"password\",\"identitas_user\":\"192187364732\",\"is_aktif\":1,\"created_at\":\"2021-04-21T01:49:55.000000Z\",\"updated_at\":\"2021-04-21T01:49:55.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','{\"id_user\":\"3\",\"nm_user\":\"Bambang\",\"email_user\":\"bambang@gmail.com\",\"username_user\":\"bambang007\",\"password_user\":null,\"identitas_user\":\"192187364732\",\"is_aktif\":\"1\"}','2021-04-21 08:56:21','2021-04-21 08:56:21'),
	(56,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menghapus data User. id=3.','{\"id_user\":3,\"username_user\":\"bambang007\",\"email_user\":\"bambang@gmail.com\",\"nm_user\":\"Bambang\",\"password_user\":\"password\",\"identitas_user\":\"192187364732\",\"is_aktif\":1,\"created_at\":\"2021-04-21 08:49:55\",\"updated_at\":\"2021-04-21 08:56:21\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','null','2021-04-21 08:56:29','2021-04-21 08:56:29'),
	(57,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data User. id=5.','{\"id_user\":null,\"nm_user\":\"Bambang\",\"email_user\":\"bambang@gmail.com\",\"username_user\":\"bambang007\",\"password_user\":\"password\",\"identitas_user\":\"192187364732\",\"is_aktif\":\"1\"}','null','2021-04-21 08:57:41','2021-04-21 08:57:41'),
	(58,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data Modul. id=13.','{\"id_modul_group\":\"4\",\"id_modul\":null,\"nm_modul\":\"User Role\",\"urutan\":\"2\",\"route_prefix\":\"sys_user_role\",\"is_tampil\":\"0\"}','null','2021-04-21 08:59:20','2021-04-21 08:59:20'),
	(59,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data Role User. id=6.','{\"id_user\":\"5\",\"id_user_role\":null,\"id_role\":\"4\",\"unit\":\"9027\"}','null','2021-04-21 09:29:03','2021-04-21 09:29:03'),
	(60,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data Role User. id=7.','{\"id_user\":\"5\",\"id_user_role\":null,\"id_role\":\"3\",\"unit\":\"1010\"}','null','2021-04-21 09:29:11','2021-04-21 09:29:11'),
	(61,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Role User. id=6.','{\"id_user_role\":6,\"id_user\":5,\"id_role\":4,\"unit\":9027,\"created_at\":\"2021-04-21T02:29:03.000000Z\",\"updated_at\":\"2021-04-21T02:29:03.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','{\"id_user\":\"5\",\"id_user_role\":\"6\",\"id_role\":\"6\",\"unit\":\"1020\"}','2021-04-21 09:32:19','2021-04-21 09:32:19'),
	(62,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Role User. id=7.','{\"id_user_role\":7,\"id_user\":5,\"id_role\":3,\"unit\":1010,\"created_at\":\"2021-04-21T02:29:11.000000Z\",\"updated_at\":\"2021-04-21T02:29:11.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','{\"id_user\":\"5\",\"id_user_role\":\"7\",\"id_role\":\"3\",\"unit\":\"1020\"}','2021-04-21 09:32:34','2021-04-21 09:32:34'),
	(63,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data User. id=5.','{\"id_user\":5,\"username_user\":\"bambang007\",\"email_user\":\"bambang@gmail.com\",\"nm_user\":\"Bambang\",\"password_user\":\"password\",\"identitas_user\":\"192187364732\",\"is_aktif\":1,\"created_at\":\"2021-04-21T01:57:41.000000Z\",\"updated_at\":\"2021-04-21T01:57:41.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','{\"id_user\":\"5\",\"nm_user\":\"Bambang\",\"email_user\":\"bambang@gmail.com\",\"username_user\":\"bambang007\",\"password_user\":\"password\",\"identitas_user\":\"192187364732\",\"is_aktif\":\"1\"}','2021-04-21 09:34:01','2021-04-21 09:34:01'),
	(64,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Role User. id=4.','{\"id_user_role\":4,\"id_user\":2,\"id_role\":2,\"unit\":null,\"created_at\":\"2021-03-19T07:07:17.000000Z\",\"updated_at\":\"2021-03-19T07:07:17.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','{\"id_user\":\"2\",\"id_user_role\":\"4\",\"id_role\":\"2\",\"unit\":\"1010\"}','2021-04-21 09:52:59','2021-04-21 09:52:59'),
	(65,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Role User. id=4.','{\"id_user_role\":4,\"id_user\":2,\"id_role\":2,\"unit\":1010,\"created_at\":\"2021-03-19T07:07:17.000000Z\",\"updated_at\":\"2021-04-21T02:52:59.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','{\"id_user\":\"2\",\"id_user_role\":\"4\",\"id_role\":\"2\",\"unit\":\"1010\"}','2021-04-21 09:53:01','2021-04-21 09:53:01'),
	(66,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Role User. id=4.','{\"id_user_role\":4,\"id_user\":2,\"id_role\":2,\"unit\":1010,\"created_at\":\"2021-03-19T07:07:17.000000Z\",\"updated_at\":\"2021-04-21T02:52:59.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','{\"id_user\":\"2\",\"id_user_role\":\"4\",\"id_role\":\"2\",\"unit\":\"1010\"}','2021-04-21 09:53:03','2021-04-21 09:53:03'),
	(67,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Role User. id=4.','{\"id_user_role\":4,\"id_user\":2,\"id_role\":2,\"unit\":1010,\"created_at\":\"2021-03-19T07:07:17.000000Z\",\"updated_at\":\"2021-04-21T02:52:59.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','{\"id_user\":\"2\",\"id_user_role\":\"4\",\"id_role\":\"2\",\"unit\":\"1010\"}','2021-04-21 09:53:07','2021-04-21 09:53:07'),
	(68,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Role User. id=4.','{\"id_user_role\":4,\"id_user\":2,\"id_role\":2,\"unit\":1010,\"created_at\":\"2021-03-19T07:07:17.000000Z\",\"updated_at\":\"2021-04-21T02:52:59.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','{\"id_user\":\"2\",\"id_user_role\":\"4\",\"id_role\":\"2\",\"unit\":\"1010\"}','2021-04-21 09:53:17','2021-04-21 09:53:17'),
	(69,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Role User. id=4.','{\"id_user_role\":4,\"id_user\":2,\"id_role\":2,\"unit\":1010,\"created_at\":\"2021-03-19T07:07:17.000000Z\",\"updated_at\":\"2021-04-21T02:52:59.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','{\"id_user\":\"2\",\"id_user_role\":\"4\",\"id_role\":\"2\",\"unit\":\"1010\"}','2021-04-21 09:53:25','2021-04-21 09:53:25'),
	(70,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Role User. id=4.','{\"id_user_role\":4,\"id_user\":2,\"id_role\":2,\"unit\":1010,\"created_at\":\"2021-03-19T07:07:17.000000Z\",\"updated_at\":\"2021-04-21T02:52:59.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','{\"id_user\":\"2\",\"id_user_role\":\"4\",\"id_role\":\"2\",\"unit\":\"1010\"}','2021-04-21 09:53:33','2021-04-21 09:53:33'),
	(71,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Kegiatan RPD. id=3.','{\"id_rpd\":3,\"k_id\":98951,\"unit_asli\":9008,\"unit\":1010,\"nomor\":1,\"nm_kegiatan\":\"Pembayaran Remun Mei 2022\",\"tahun\":2021,\"bulan_rpd\":5,\"ls\":25000000,\"up\":0,\"created_at\":\"2021-04-20T07:45:24.000000Z\",\"updated_at\":\"2021-04-21T01:05:52.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','{\"id_rpd\":\"3\",\"k_id\":\"98951\",\"unit\":\"1010\",\"unit_asli\":\"9008\",\"nm_kegiatan\":\"Pembayaran Remun Mei 2022\",\"bulan_rpd\":\"5\",\"ls\":\"25,000,000\",\"up\":\"0\"}','2021-04-21 09:56:48','2021-04-21 09:56:48'),
	(72,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Role User. id=7.','{\"id_user_role\":7,\"id_user\":5,\"id_role\":3,\"unit\":1020,\"created_at\":\"2021-04-21T02:29:11.000000Z\",\"updated_at\":\"2021-04-21T02:32:34.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','{\"id_user\":\"5\",\"id_user_role\":\"7\",\"id_role\":\"3\",\"unit\":\"3079\"}','2021-04-21 10:58:32','2021-04-21 10:58:32'),
	(73,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Modul. id=10.','{\"id_modul\":10,\"id_modul_group\":7,\"route_prefix\":\"rincian_rpd\",\"nm_modul\":\"Rincian RPD\",\"icon_modul\":\"\",\"urutan\":1,\"is_tampil\":1,\"created_at\":\"2021-04-20T07:59:27.000000Z\",\"updated_at\":\"2021-04-20T07:59:27.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','{\"id_modul_group\":\"7\",\"id_modul\":\"10\",\"nm_modul\":\"Usulan RPD\",\"urutan\":\"1\",\"route_prefix\":\"rincian_rpd\",\"is_tampil\":\"1\"}','2021-04-21 11:05:26','2021-04-21 11:05:26'),
	(74,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Modul. id=10.','{\"id_modul\":10,\"id_modul_group\":7,\"route_prefix\":\"rincian_rpd\",\"nm_modul\":\"Usulan RPD\",\"icon_modul\":\"\",\"urutan\":1,\"is_tampil\":1,\"created_at\":\"2021-04-20T07:59:27.000000Z\",\"updated_at\":\"2021-04-21T04:05:26.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','{\"id_modul_group\":\"7\",\"id_modul\":\"10\",\"nm_modul\":\"Rincian RPD\",\"urutan\":\"1\",\"route_prefix\":\"rincian_rpd\",\"is_tampil\":\"1\"}','2021-04-21 11:05:56','2021-04-21 11:05:56'),
	(75,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data Modul. id=14.','{\"id_modul_group\":\"7\",\"id_modul\":null,\"nm_modul\":\"Usulan RPD\",\"urutan\":\"2\",\"route_prefix\":\"usulan_rpd\",\"is_tampil\":\"1\"}','null','2021-04-21 11:06:10','2021-04-21 11:06:10'),
	(76,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Grup Modul. id=7.','{\"id_modul_group\":7,\"id_menu_group\":4,\"route_prefix\":null,\"nm_modul_group\":\"Rincian RPD\",\"icon_modul_group\":\"bi bi-credit-card\",\"urutan\":2,\"created_at\":\"2021-04-20T07:58:55.000000Z\",\"updated_at\":\"2021-04-20T07:58:55.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','{\"id_menu_group\":\"4\",\"id_modul_group\":\"7\",\"nm_modul_group\":\"RPD Bulanan\",\"urutan\":\"2\",\"icon_modul_group\":\"bi bi-credit-card\"}','2021-04-21 11:10:16','2021-04-21 11:10:16'),
	(77,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Grup Modul. id=7.','{\"id_modul_group\":7,\"id_menu_group\":4,\"route_prefix\":null,\"nm_modul_group\":\"RPD Bulanan\",\"icon_modul_group\":\"bi bi-credit-card\",\"urutan\":2,\"created_at\":\"2021-04-20T07:58:55.000000Z\",\"updated_at\":\"2021-04-21T04:10:16.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','{\"id_menu_group\":\"4\",\"id_modul_group\":\"7\",\"nm_modul_group\":\"Rincian RPD\",\"urutan\":\"2\",\"icon_modul_group\":\"bi bi-credit-card\"}','2021-04-21 11:11:38','2021-04-21 11:11:38'),
	(78,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Modul. id=10.','{\"id_modul\":10,\"id_modul_group\":7,\"route_prefix\":\"rincian_rpd\",\"nm_modul\":\"Rincian RPD\",\"icon_modul\":\"\",\"urutan\":1,\"is_tampil\":1,\"created_at\":\"2021-04-20T07:59:27.000000Z\",\"updated_at\":\"2021-04-21T04:05:56.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','{\"id_modul_group\":\"7\",\"id_modul\":\"10\",\"nm_modul\":\"RPD Bulanna\",\"urutan\":\"1\",\"route_prefix\":\"rincian_rpd\",\"is_tampil\":\"1\"}','2021-04-21 11:11:48','2021-04-21 11:11:48'),
	(79,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Modul. id=10.','{\"id_modul\":10,\"id_modul_group\":7,\"route_prefix\":\"rincian_rpd\",\"nm_modul\":\"RPD Bulanna\",\"icon_modul\":\"\",\"urutan\":1,\"is_tampil\":1,\"created_at\":\"2021-04-20T07:59:27.000000Z\",\"updated_at\":\"2021-04-21T04:11:48.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','{\"id_modul_group\":\"7\",\"id_modul\":\"10\",\"nm_modul\":\"RPD Bulanan\",\"urutan\":\"1\",\"route_prefix\":\"rincian_rpd\",\"is_tampil\":\"1\"}','2021-04-21 11:11:53','2021-04-21 11:11:53'),
	(80,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Grup Modul. id=8.','{\"id_modul_group\":8,\"id_menu_group\":4,\"route_prefix\":null,\"nm_modul_group\":\"Realisasi RPD\",\"icon_modul_group\":\"bi bi-cash-stack\",\"urutan\":3,\"created_at\":\"2021-04-20T08:48:52.000000Z\",\"updated_at\":\"2021-04-20T08:48:52.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','{\"id_menu_group\":\"4\",\"id_modul_group\":\"8\",\"nm_modul_group\":\"Rincian Realisasi\",\"urutan\":\"3\",\"icon_modul_group\":\"bi bi-cash-stack\"}','2021-04-21 11:13:17','2021-04-21 11:13:17'),
	(81,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data Modul. id=15.','{\"id_modul_group\":\"8\",\"id_modul\":null,\"nm_modul\":\"Realisasi Usulan\",\"urutan\":\"2\",\"route_prefix\":\"realisasi_usulan\",\"is_tampil\":\"1\"}','null','2021-04-21 11:14:53','2021-04-21 11:14:53'),
	(82,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Modul. id=11.','{\"id_modul\":11,\"id_modul_group\":8,\"route_prefix\":\"realisasi_rpd\",\"nm_modul\":\"Realisasi RPD\",\"icon_modul\":\"\",\"urutan\":1,\"is_tampil\":1,\"created_at\":\"2021-04-20T08:50:31.000000Z\",\"updated_at\":\"2021-04-20T08:50:31.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','{\"id_modul_group\":\"8\",\"id_modul\":\"11\",\"nm_modul\":\"Realisasi Bulanan\",\"urutan\":\"1\",\"route_prefix\":\"realisasi_rpd\",\"is_tampil\":\"1\"}','2021-04-21 11:16:50','2021-04-21 11:16:50'),
	(83,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menghapus data Role User. id=7.','{\"id_rpd\":7,\"k_id\":98951,\"unit_asli\":9008,\"unit\":1010,\"nomor\":5,\"nm_kegiatan\":\"Kegiatan\",\"tahun\":2021,\"bulan_rpd\":5,\"ls\":10000,\"up\":20000,\"created_at\":\"2021-04-21 08:03:22\",\"updated_at\":\"2021-04-21 08:03:22\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','null','2021-04-21 13:06:54','2021-04-21 13:06:54'),
	(84,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menghapus data Role User. id=5.','{\"id_rpd\":5,\"k_id\":98951,\"unit_asli\":9008,\"unit\":1010,\"nomor\":3,\"nm_kegiatan\":\"Pembayaran Remun susulan Mei 2021\",\"tahun\":2021,\"bulan_rpd\":5,\"ls\":15000000,\"up\":0,\"created_at\":\"2021-04-20 14:49:48\",\"updated_at\":\"2021-04-20 14:49:48\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','null','2021-04-21 13:06:57','2021-04-21 13:06:57'),
	(85,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menghapus data Role User. id=6.','{\"id_rpd\":6,\"k_id\":98951,\"unit_asli\":9008,\"unit\":1010,\"nomor\":4,\"nm_kegiatan\":\"Kegiatan Ke-4\",\"tahun\":2021,\"bulan_rpd\":5,\"ls\":100000,\"up\":0,\"created_at\":\"2021-04-20 15:47:37\",\"updated_at\":\"2021-04-20 15:47:37\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','null','2021-04-21 13:06:59','2021-04-21 13:06:59'),
	(86,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menghapus data Role User. id=4.','{\"id_rpd\":4,\"k_id\":98951,\"unit_asli\":9008,\"unit\":1010,\"nomor\":2,\"nm_kegiatan\":\"Pembayaran RPD Juni 2021\",\"tahun\":2021,\"bulan_rpd\":5,\"ls\":0,\"up\":100000000,\"created_at\":\"2021-04-20 14:46:22\",\"updated_at\":\"2021-04-20 14:46:41\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','null','2021-04-21 13:07:01','2021-04-21 13:07:01'),
	(87,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Kegiatan RPD. id=3.','{\"id_rpd\":3,\"k_id\":98951,\"unit_asli\":9008,\"unit\":1010,\"nomor\":1,\"nm_kegiatan\":\"Pembayaran Remun Mei 2022\",\"tahun\":2021,\"bulan_rpd\":5,\"ls\":25000000,\"up\":0,\"created_at\":\"2021-04-20T07:45:24.000000Z\",\"updated_at\":\"2021-04-21T01:05:52.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','{\"id_rpd\":\"3\",\"k_id\":\"98951\",\"unit\":\"1010\",\"unit_asli\":\"9008\",\"nm_kegiatan\":\"Pembayaran Remun Mei 2022\",\"bulan_rpd\":\"5\",\"ls\":\"0\",\"up\":\"25,000,000\"}','2021-04-21 13:07:10','2021-04-21 13:07:10'),
	(88,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data RPD Kegiatan. id=8.','{\"id_rpd\":null,\"k_id\":\"98428\",\"unit\":\"1010\",\"unit_asli\":\"9008\",\"nm_kegiatan\":\"Remun Mei 2021\",\"bulan_rpd\":\"5\",\"ls\":\"0\",\"up\":\"50,000,000\"}','null','2021-04-21 13:52:40','2021-04-21 13:52:40'),
	(89,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data RPD Kegiatan. id=9.','{\"id_rpd\":null,\"k_id\":\"98428\",\"unit\":\"5020\",\"unit_asli\":\"9156\",\"nm_kegiatan\":\"Keg\",\"bulan_rpd\":\"7\",\"ls\":\"10,000\",\"up\":\"0\"}','null','2021-04-21 14:03:45','2021-04-21 14:03:45'),
	(90,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data RPD Kegiatan. id=10.','{\"id_rpd\":null,\"k_id\":\"98427\",\"unit\":\"5020\",\"unit_asli\":\"9156\",\"nm_kegiatan\":\"Operasional disertasi\",\"bulan_rpd\":\"5\",\"ls\":\"0\",\"up\":\"10,000,000\"}','null','2021-04-21 14:11:42','2021-04-21 14:11:42'),
	(91,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data Role User. id=8.','{\"id_user\":\"1\",\"id_user_role\":null,\"id_role\":\"2\",\"unit\":\"5134\"}','null','2021-04-21 14:21:12','2021-04-21 14:21:12'),
	(92,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data RPD Kegiatan. id=11.','{\"id_rpd\":null,\"k_id\":\"98725\",\"unit\":\"5020\",\"unit_asli\":\"9156\",\"nm_kegiatan\":\"Tambah Kegiatan\",\"bulan_rpd\":\"5\",\"ls\":\"0\",\"up\":\"15,000,000\"}','null','2021-04-21 14:30:51','2021-04-21 14:30:51'),
	(93,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data RPD Kegiatan. id=12.','{\"id_rpd\":null,\"k_id\":\"98726\",\"unit\":\"5020\",\"unit_asli\":\"9156\",\"nm_kegiatan\":\"Kegiatan ke-5\",\"bulan_rpd\":\"5\",\"ls\":\"10,000\",\"up\":\"50,000\"}','null','2021-04-21 15:16:05','2021-04-21 15:16:05'),
	(94,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data RPD Kegiatan. id=13.','{\"id_rpd\":null,\"k_id\":\"99510\",\"unit\":\"5020\",\"unit_asli\":\"9156\",\"nm_kegiatan\":\"Cek Kode Anggaran\",\"bulan_rpd\":\"5\",\"ls\":\"10,000,000\",\"up\":\"20,000\"}','null','2021-04-21 15:22:33','2021-04-21 15:22:33'),
	(95,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Kegiatan RPD. id=8.','{\"id_rpd\":8,\"k_id\":98428,\"unit_asli\":9156,\"unit\":5020,\"nomor\":2,\"nm_kegiatan\":\"Remun Mei 2021\",\"tahun\":2021,\"bulan_rpd\":5,\"ls\":0,\"up\":50000000,\"kd_anggaran\":null,\"created_at\":\"2021-04-21T06:52:40.000000Z\",\"updated_at\":\"2021-04-21T06:52:40.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','{\"id_rpd\":\"8\",\"k_id\":\"98428\",\"unit\":\"5020\",\"unit_asli\":\"9156\",\"nm_kegiatan\":\"Remun Mei 2021\",\"bulan_rpd\":\"5\",\"ls\":\"0\",\"up\":\"50,000,000\"}','2021-04-21 15:22:44','2021-04-21 15:22:44'),
	(96,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Kegiatan RPD. id=9.','{\"id_rpd\":9,\"k_id\":98428,\"unit_asli\":9156,\"unit\":5020,\"nomor\":2,\"nm_kegiatan\":\"Keg\",\"tahun\":2021,\"bulan_rpd\":7,\"ls\":10000,\"up\":0,\"kd_anggaran\":null,\"created_at\":\"2021-04-21T07:03:45.000000Z\",\"updated_at\":\"2021-04-21T07:03:45.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','{\"id_rpd\":\"9\",\"k_id\":\"98428\",\"unit\":\"5020\",\"unit_asli\":\"9156\",\"nm_kegiatan\":\"Keg\",\"bulan_rpd\":\"7\",\"ls\":\"10,000\",\"up\":\"0\"}','2021-04-21 15:22:53','2021-04-21 15:22:53'),
	(97,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Kegiatan RPD. id=10.','{\"id_rpd\":10,\"k_id\":98427,\"unit_asli\":9156,\"unit\":5020,\"nomor\":1,\"nm_kegiatan\":\"Operasional disertasi\",\"tahun\":2021,\"bulan_rpd\":5,\"ls\":0,\"up\":10000000,\"kd_anggaran\":null,\"created_at\":\"2021-04-21T07:11:42.000000Z\",\"updated_at\":\"2021-04-21T07:11:42.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','{\"id_rpd\":\"10\",\"k_id\":\"98427\",\"unit\":\"5020\",\"unit_asli\":\"9156\",\"nm_kegiatan\":\"Operasional disertasi\",\"bulan_rpd\":\"5\",\"ls\":\"0\",\"up\":\"10,000,000\"}','2021-04-21 15:23:02','2021-04-21 15:23:02'),
	(98,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Kegiatan RPD. id=11.','{\"id_rpd\":11,\"k_id\":98725,\"unit_asli\":9156,\"unit\":5020,\"nomor\":1,\"nm_kegiatan\":\"Tambah Kegiatan\",\"tahun\":2021,\"bulan_rpd\":5,\"ls\":0,\"up\":15000000,\"kd_anggaran\":null,\"created_at\":\"2021-04-21T07:30:51.000000Z\",\"updated_at\":\"2021-04-21T07:30:51.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','{\"id_rpd\":\"11\",\"k_id\":\"98725\",\"unit\":\"5020\",\"unit_asli\":\"9156\",\"nm_kegiatan\":\"Tambah Kegiatan\",\"bulan_rpd\":\"5\",\"ls\":\"0\",\"up\":\"15,000,000\"}','2021-04-21 15:23:11','2021-04-21 15:23:11'),
	(99,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data RPD Kegiatan. id=14.','{\"id_rpd\":null,\"k_id\":\"99435\",\"unit\":\"5020\",\"unit_asli\":\"9156\",\"nm_kegiatan\":\"Kegggg\",\"bulan_rpd\":\"5\",\"ls\":\"0\",\"up\":\"2,123,323\"}','null','2021-04-21 15:25:05','2021-04-21 15:25:05'),
	(100,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menduplikasi data RPD bulan 5 ke bulan 6','{\"bulan\":\"5\",\"rpd\":{\"12\":\"1\",\"13\":\"1\"}}','null','2021-04-22 10:57:05','2021-04-22 10:57:05'),
	(101,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menduplikasi data RPD bulan 6 ke bulan 7','{\"bulan\":\"6\",\"rpd\":{\"16\":\"1\"}}','null','2021-04-22 10:57:23','2021-04-22 10:57:23'),
	(102,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menduplikasi data RPD bulan 7 ke bulan 8','{\"bulan\":\"7\",\"rpd\":{\"17\":\"1\"}}','null','2021-04-22 10:57:41','2021-04-22 10:57:41'),
	(103,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data RPD Kegiatan. id=19.','{\"id_rpd\":null,\"k_id\":\"100252\",\"unit\":\"5020\",\"unit_asli\":\"9156\",\"nm_kegiatan\":\"Perjalanan Dinas UPT Humas\",\"bulan_rpd\":\"5\",\"ls\":\"0\",\"up\":\"100,000\"}','null','2021-04-22 11:04:57','2021-04-22 11:04:57'),
	(104,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data RPD Kegiatan. id=20.','{\"id_rpd\":null,\"k_id\":\"98045\",\"unit\":\"5020\",\"unit_asli\":\"9156\",\"nm_kegiatan\":\"Pembayaran Gaji Pegawai BLU UNNES Bulan Tahun 2021\",\"bulan_rpd\":\"5\",\"ls\":\"0\",\"up\":\"100,000\"}','null','2021-04-22 11:06:54','2021-04-22 11:06:54'),
	(105,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data RPD Kegiatan. id=1.','{\"id_rpd\":null,\"k_id\":\"98428\",\"unit\":\"5020\",\"unit_asli\":\"9156\",\"nm_kegiatan\":\"Biaya Operasional Penyusunan Disertasi Tenaga Kependidikan Tahun 2021\",\"bulan_rpd\":\"5\",\"ls\":\"0\",\"up\":\"10,000\"}','null','2021-04-22 11:08:03','2021-04-22 11:08:03'),
	(106,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data RPD Kegiatan. id=2.','{\"id_rpd\":null,\"k_id\":\"98427\",\"unit\":\"5020\",\"unit_asli\":\"9156\",\"nm_kegiatan\":\"Biaya Operasional Penyusunan Disertasi Tenaga Pendidik Tahun 2021\",\"bulan_rpd\":\"5\",\"ls\":\"0\",\"up\":\"10,000,000\"}','null','2021-04-22 11:08:18','2021-04-22 11:08:18'),
	(107,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data RPD Kegiatan. id=3.','{\"id_rpd\":null,\"k_id\":\"99344\",\"unit\":\"5020\",\"unit_asli\":\"9156\",\"nm_kegiatan\":\"Biaya Operasional Penyusunan Disertasi Tenaga Pendidik Tahun 2021\",\"bulan_rpd\":\"5\",\"ls\":\"2,000,000\",\"up\":\"0\"}','null','2021-04-22 11:08:30','2021-04-22 11:08:30'),
	(108,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data RPD Kegiatan. id=4.','{\"id_rpd\":null,\"k_id\":\"98725\",\"unit\":\"5020\",\"unit_asli\":\"9156\",\"nm_kegiatan\":\"Biaya Perjalanan Dinas Kesekretariatan Rektor Februari\",\"bulan_rpd\":\"5\",\"ls\":\"0\",\"up\":\"15,000,000\"}','null','2021-04-22 11:08:43','2021-04-22 11:08:43'),
	(109,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menduplikasi data RPD bulan 5 ke bulan 6','{\"bulan\":\"5\",\"rpd\":{\"2\":\"1\",\"3\":\"1\"}}','null','2021-04-22 11:09:10','2021-04-22 11:09:10'),
	(110,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menduplikasi data RPD bulan 5 ke bulan 6','{\"bulan\":\"5\",\"rpd\":{\"2\":\"1\",\"3\":\"1\"}}','null','2021-04-22 11:10:41','2021-04-22 11:10:41'),
	(111,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data Modul Grup. id=10.','{\"id_menu_group\":\"4\",\"id_modul_group\":null,\"nm_modul_group\":\"Validasi Unit\",\"urutan\":\"4\",\"icon_modul_group\":\"bi bi-shield-lock\"}','null','2021-04-22 11:12:50','2021-04-22 11:12:50'),
	(112,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Grup Modul. id=10.','{\"id_modul_group\":10,\"id_menu_group\":4,\"route_prefix\":null,\"nm_modul_group\":\"Validasi Unit\",\"icon_modul_group\":\"bi bi-shield-lock\",\"urutan\":4,\"created_at\":\"2021-04-22T04:12:50.000000Z\",\"updated_at\":\"2021-04-22T04:12:50.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','{\"id_menu_group\":\"4\",\"id_modul_group\":\"10\",\"nm_modul_group\":\"Validasi\",\"urutan\":\"4\",\"icon_modul_group\":\"bi bi-shield-lock\"}','2021-04-22 11:13:08','2021-04-22 11:13:08'),
	(113,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data Modul. id=16.','{\"id_modul_group\":\"10\",\"id_modul\":null,\"nm_modul\":\"Validasi Unit\",\"urutan\":\"1\",\"route_prefix\":\"validasi_unit\",\"is_tampil\":\"1\"}','null','2021-04-22 11:13:31','2021-04-22 11:13:31'),
	(114,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data Modul. id=17.','{\"id_modul_group\":\"10\",\"id_modul\":null,\"nm_modul\":\"Validasi RPD\",\"urutan\":\"2\",\"route_prefix\":\"validasi_rpd\",\"is_tampil\":\"1\"}','null','2021-04-22 11:13:53','2021-04-22 11:13:53'),
	(115,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data Role User. id=9.','{\"id_user\":\"1\",\"id_user_role\":null,\"id_role\":\"4\",\"unit\":\"9111\"}','null','2021-04-22 12:04:42','2021-04-22 12:04:42'),
	(116,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Role User. id=9.','{\"id_user_role\":9,\"id_user\":1,\"id_role\":4,\"unit\":9111,\"created_at\":\"2021-04-22T05:04:42.000000Z\",\"updated_at\":\"2021-04-22T05:04:42.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','{\"id_user\":\"1\",\"id_user_role\":\"9\",\"id_role\":\"3\",\"unit\":\"9111\"}','2021-04-22 12:05:10','2021-04-22 12:05:10'),
	(117,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data RPD Kegiatan. id=7.','{\"id_rpd\":null,\"k_id\":\"98730\",\"unit\":\"5020\",\"unit_asli\":\"9111\",\"nm_kegiatan\":\"Layanan Perkantoran dan Pendidikan Bulan Januari 2021\",\"bulan_rpd\":\"5\",\"ls\":\"0\",\"up\":\"100,000\"}','null','2021-04-22 12:06:11','2021-04-22 12:06:11'),
	(118,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menduplikasi data RPD bulan 5 ke bulan 6','{\"bulan\":\"5\",\"rpd\":{\"2\":\"1\",\"3\":\"1\",\"7\":\"1\"}}','null','2021-04-22 12:35:27','2021-04-22 12:35:27'),
	(119,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Melakukan validasi sub unit','{\"bulan\":\"5\",\"validasi\":[\"9156\",\"9111\"]}','null','2021-04-22 12:52:44','2021-04-22 12:52:44'),
	(120,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Melakukan validasi sub unit','{\"bulan\":\"5\"}','null','2021-04-22 12:52:53','2021-04-22 12:52:53'),
	(121,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Melakukan validasi sub unit','{\"bulan\":\"5\"}','null','2021-04-22 12:53:38','2021-04-22 12:53:38'),
	(122,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Melakukan validasi sub unit','{\"bulan\":\"5\"}','null','2021-04-22 12:54:05','2021-04-22 12:54:05'),
	(123,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Melakukan validasi sub unit','{\"bulan\":\"5\"}','null','2021-04-22 12:56:38','2021-04-22 12:56:38'),
	(124,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Melakukan validasi sub unit','{\"bulan\":\"5\",\"validasi\":[\"9156\"]}','null','2021-04-22 12:56:49','2021-04-22 12:56:49'),
	(125,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Melakukan validasi sub unit','{\"bulan\":\"5\",\"validasi\":[\"9111\"]}','null','2021-04-22 12:56:56','2021-04-22 12:56:56'),
	(126,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Melakukan validasi sub unit','{\"bulan\":\"5\",\"validasi\":[\"9156\",\"9111\"]}','null','2021-04-22 12:57:00','2021-04-22 12:57:00'),
	(127,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data RPD Kegiatan. id=11.','{\"id_rpd\":null,\"k_id\":\"98726\",\"unit\":\"5020\",\"unit_asli\":\"9156\",\"nm_kegiatan\":\"Biaya Perjalanan Dinas UPT Humas Februari\",\"bulan_rpd\":\"5\",\"ls\":\"0\",\"up\":\"75,000,000\"}','null','2021-04-22 12:57:50','2021-04-22 12:57:50'),
	(128,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menduplikasi data RPD bulan 6 ke bulan 7','{\"bulan\":\"6\",\"rpd\":{\"9\":\"1\",\"10\":\"1\"}}','null','2021-04-22 13:41:31','2021-04-22 13:41:31'),
	(129,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Melakukan validasi sub unit','{\"bulan\":\"5\",\"validasi\":[\"9111\"]}','null','2021-04-22 13:42:15','2021-04-22 13:42:15'),
	(130,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Melakukan validasi sub unit','{\"bulan\":\"5\",\"validasi\":[\"9156\",\"9111\"]}','null','2021-04-22 13:42:35','2021-04-22 13:42:35'),
	(131,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Melakukan validasi sub unit','{\"bulan\":\"5\",\"validasi\":[\"9111\"]}','null','2021-04-22 13:42:55','2021-04-22 13:42:55'),
	(132,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Melakukan validasi sub unit','{\"bulan\":\"5\"}','null','2021-04-22 13:42:59','2021-04-22 13:42:59'),
	(133,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Melakukan validasi sub unit','{\"bulan\":\"5\",\"validasi\":[\"9156\",\"9111\"]}','null','2021-04-22 13:43:02','2021-04-22 13:43:02'),
	(134,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Kegiatan RPD. id=1.','{\"id_rpd\":1,\"k_id\":98428,\"unit_asli\":9156,\"unit\":5020,\"nomor\":1,\"nm_kegiatan\":\"Biaya Operasional Penyusunan Disertasi Tenaga Kependidikan Tahun 2021\",\"tahun\":2021,\"bulan_rpd\":5,\"ls\":0,\"up\":10000,\"kd_anggaran\":\"4471.TAM.001.052.A\",\"ex_id_rpd\":null,\"created_at\":\"2021-04-22T04:08:03.000000Z\",\"updated_at\":\"2021-04-22T04:08:03.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','{\"id_rpd\":\"1\",\"k_id\":\"98428\",\"unit\":\"5020\",\"unit_asli\":\"9156\",\"nm_kegiatan\":\"Biaya Operasional Penyusunan Disertasi Tenaga Kependidikan Tahun 2021\",\"bulan_rpd\":\"5\",\"ls\":\"0\",\"up\":\"10,000\"}','2021-04-22 14:17:40','2021-04-22 14:17:40'),
	(135,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menghapus data Role User. id=1.','{\"id_rpd\":1,\"k_id\":98428,\"unit_asli\":9156,\"unit\":5020,\"nomor\":1,\"nm_kegiatan\":\"Biaya Operasional Penyusunan Disertasi Tenaga Kependidikan Tahun 2021\",\"tahun\":2021,\"bulan_rpd\":5,\"ls\":0,\"up\":10000,\"kd_anggaran\":\"4471.TAM.001.052.A\",\"ex_id_rpd\":null,\"created_at\":\"2021-04-22 11:08:03\",\"updated_at\":\"2021-04-22 14:17:40\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','null','2021-04-22 14:17:44','2021-04-22 14:17:44'),
	(136,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Melakukan validasi sub unit','{\"bulan\":\"5\",\"validasi\":[\"9156\",\"9111\"]}','null','2021-04-22 14:19:15','2021-04-22 14:19:15'),
	(137,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Kegiatan RPD. id=2.','{\"id_rpd\":2,\"k_id\":98427,\"unit_asli\":9156,\"unit\":5020,\"nomor\":2,\"nm_kegiatan\":\"Biaya Operasional Penyusunan Disertasi Tenaga Pendidik Tahun 2021\",\"tahun\":2021,\"bulan_rpd\":5,\"ls\":0,\"up\":10000000,\"kd_anggaran\":\"4471.SBA.001.064.A\",\"ex_id_rpd\":null,\"created_at\":\"2021-04-22T04:08:18.000000Z\",\"updated_at\":\"2021-04-22T04:08:18.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','{\"id_rpd\":\"2\",\"k_id\":\"98427\",\"unit\":\"5020\",\"unit_asli\":\"9156\",\"nm_kegiatan\":\"Biaya Operasional Penyusunan Disertasi Tenaga Pendidik Tahun 2021\",\"bulan_rpd\":\"5\",\"ls\":\"0\",\"up\":\"10,000,000\"}','2021-04-22 14:36:54','2021-04-22 14:36:54'),
	(138,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Kegiatan RPD. id=2.','{\"id_rpd\":2,\"k_id\":98427,\"unit_asli\":9156,\"unit\":5020,\"nomor\":2,\"nm_kegiatan\":\"Biaya Operasional Penyusunan Disertasi Tenaga Pendidik Tahun 2021\",\"tahun\":2021,\"bulan_rpd\":5,\"ls\":0,\"up\":10000000,\"kd_anggaran\":\"4471.SBA.001.064.A\",\"ex_id_rpd\":null,\"created_at\":\"2021-04-22T04:08:18.000000Z\",\"updated_at\":\"2021-04-22T07:36:54.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','{\"id_rpd\":\"2\",\"k_id\":\"98427\",\"unit\":\"5020\",\"unit_asli\":\"9156\",\"nm_kegiatan\":\"Biaya Operasional Penyusunan Disertasi Tenaga Pendidik Tahun 2021\",\"bulan_rpd\":\"5\",\"ls\":\"0\",\"up\":\"10,000,000\"}','2021-04-22 14:37:00','2021-04-22 14:37:00'),
	(139,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Melakukan validasi sub unit','{\"bulan\":\"5\",\"validasi\":[\"9156\",\"9111\"]}','null','2021-04-22 14:37:13','2021-04-22 14:37:13'),
	(140,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Kegiatan RPD. id=2.','{\"id_rpd\":2,\"k_id\":98427,\"unit_asli\":9156,\"unit\":5020,\"nomor\":2,\"nm_kegiatan\":\"Biaya Operasional Penyusunan Disertasi Tenaga Pendidik Tahun 2021\",\"tahun\":2021,\"bulan_rpd\":5,\"ls\":0,\"up\":10000000,\"kd_anggaran\":\"4471.SBA.001.064.A\",\"ex_id_rpd\":null,\"created_at\":\"2021-04-22T04:08:18.000000Z\",\"updated_at\":\"2021-04-22T07:36:54.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','{\"id_rpd\":\"2\",\"k_id\":\"98427\",\"unit\":\"5020\",\"unit_asli\":\"9156\",\"nm_kegiatan\":\"Biaya Operasional Penyusunan Disertasi Tenaga Pendidik Tahun 2021\",\"bulan_rpd\":\"5\",\"ls\":\"0\",\"up\":\"10,000,000\"}','2021-04-22 14:37:29','2021-04-22 14:37:29'),
	(141,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Kegiatan RPD. id=2.','{\"id_rpd\":2,\"k_id\":98427,\"unit_asli\":9156,\"unit\":5020,\"nomor\":2,\"nm_kegiatan\":\"Biaya Operasional Penyusunan Disertasi Tenaga Pendidik Tahun 2021\",\"tahun\":2021,\"bulan_rpd\":5,\"ls\":0,\"up\":10000000,\"kd_anggaran\":\"4471.SBA.001.064.A\",\"ex_id_rpd\":null,\"created_at\":\"2021-04-22T04:08:18.000000Z\",\"updated_at\":\"2021-04-22T07:36:54.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','{\"id_rpd\":\"2\",\"k_id\":\"98427\",\"unit\":\"5020\",\"unit_asli\":\"9156\",\"nm_kegiatan\":\"Biaya Operasional Penyusunan Disertasi Tenaga Pendidik Tahun 2021\",\"bulan_rpd\":\"5\",\"ls\":\"0\",\"up\":\"10,000,000\"}','2021-04-22 14:39:01','2021-04-22 14:39:01'),
	(142,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menghapus data Role User. id=8.','{\"id_rpd\":8,\"k_id\":98427,\"unit_asli\":9156,\"unit\":5020,\"nomor\":1,\"nm_kegiatan\":\"Biaya Operasional Penyusunan Disertasi Tenaga Pendidik Tahun 2021\",\"tahun\":2021,\"bulan_rpd\":6,\"ls\":0,\"up\":10000000,\"kd_anggaran\":\"4471.SBA.001.064.A\",\"ex_id_rpd\":2,\"created_at\":null,\"updated_at\":null,\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','null','2021-04-22 14:44:30','2021-04-22 14:44:30'),
	(143,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Grup Menu. id=2.','{\"id_menu_group\":2,\"nm_menu_group\":\"Application Setting\",\"urutan\":1,\"created_at\":\"2021-03-19T07:07:17.000000Z\",\"updated_at\":\"2021-03-19T07:07:17.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','{\"id_menu_group\":\"2\",\"nm_menu_group\":\"Application Setting\",\"urutan\":\"2\"}','2021-04-22 14:51:54','2021-04-22 14:51:54'),
	(144,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Grup Menu. id=2.','{\"id_menu_group\":2,\"nm_menu_group\":\"Application Setting\",\"urutan\":2,\"created_at\":\"2021-03-19T07:07:17.000000Z\",\"updated_at\":\"2021-04-22T07:51:54.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','{\"id_menu_group\":\"2\",\"nm_menu_group\":\"Application Setting\",\"urutan\":\"3\"}','2021-04-22 14:51:59','2021-04-22 14:51:59'),
	(145,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Grup Menu. id=4.','{\"id_menu_group\":4,\"nm_menu_group\":\"RPD\",\"urutan\":3,\"created_at\":\"2021-04-20T05:44:14.000000Z\",\"updated_at\":\"2021-04-20T05:44:14.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','{\"id_menu_group\":\"4\",\"nm_menu_group\":\"RPD\",\"urutan\":\"1\"}','2021-04-22 14:52:06','2021-04-22 14:52:06'),
	(146,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Melakukan validasi sub unit','{\"bulan\":\"5\"}','null','2021-04-22 16:07:10','2021-04-22 16:07:10'),
	(147,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data RPD Kegiatan. id=14.','{\"id_rpd\":null,\"k_id\":\"98299\",\"unit\":\"5020\",\"unit_asli\":\"9156\",\"nm_kegiatan\":\"Pembayaran Operasional Pada Bidang II TA 2021 - Bagian Umum\",\"bulan_rpd\":\"5\",\"ls\":\"0\",\"up\":\"100,000\"}','null','2021-04-22 16:07:50','2021-04-22 16:07:50'),
	(148,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Kegiatan RPD. id=14.','{\"id_rpd\":14,\"k_id\":98299,\"unit_asli\":9156,\"unit\":5020,\"nomor\":6,\"nm_kegiatan\":\"Pembayaran Operasional Pada Bidang II TA 2021 - Bagian Umum\",\"tahun\":2021,\"bulan_rpd\":5,\"ls\":0,\"up\":100000,\"kd_anggaran\":\"4471.TAA.001.051.B,4471.TAA.001.051.B,4471.TAA.001.051.B\",\"ex_id_rpd\":null,\"created_at\":\"2021-04-22T09:07:50.000000Z\",\"updated_at\":\"2021-04-22T09:07:50.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','{\"id_rpd\":\"14\",\"k_id\":\"98299\",\"unit\":\"5020\",\"unit_asli\":\"9156\",\"nm_kegiatan\":\"Pembayaran Operasional Pada Bidang II TA 2021 - Bagian Umum\",\"bulan_rpd\":\"5\",\"ls\":\"0\",\"up\":\"1,000,000\"}','2021-04-22 16:08:01','2021-04-22 16:08:01'),
	(149,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data RPD Kegiatan. id=15.','{\"id_rpd\":null,\"k_id\":\"99325\",\"unit\":\"5020\",\"unit_asli\":\"9156\",\"nm_kegiatan\":\"Iuran BPJS Pegawai BLU Tahun 2021\",\"bulan_rpd\":\"5\",\"ls\":\"0\",\"up\":\"500,000\"}','null','2021-04-22 16:08:15','2021-04-22 16:08:15'),
	(150,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menduplikasi data RPD bulan 5 ke bulan 6','{\"bulan\":\"5\",\"rpd\":{\"7\":\"1\",\"11\":\"1\",\"14\":\"1\"}}','null','2021-04-22 16:12:43','2021-04-22 16:12:43'),
	(151,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Melakukan validasi sub unit','{\"bulan\":\"5\",\"validasi\":[\"9156\"]}','null','2021-04-22 16:15:13','2021-04-22 16:15:13'),
	(152,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Melakukan validasi sub unit','{\"bulan\":\"5\",\"validasi\":[\"9156\",\"9111\"]}','null','2021-04-22 16:15:30','2021-04-22 16:15:30'),
	(153,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengajukan RPD versi 1 bulan 5 unit 5020','{\"unit\":5020,\"tahun\":\"2021\",\"bulan\":\"5\",\"versi\":1,\"sts_valid\":0,\"created_by\":1,\"updated_at\":\"2021-04-23T04:15:49.000000Z\",\"created_at\":\"2021-04-23T04:15:49.000000Z\",\"id_validasi_rpd\":1}','null','2021-04-23 11:15:49','2021-04-23 11:15:49'),
	(154,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengajukan RPD versi 1 bulan 5 unit 5020','{\"unit\":5020,\"tahun\":\"2021\",\"bulan\":\"5\",\"versi\":1,\"sts_valid\":0,\"created_by\":1,\"updated_at\":\"2021-04-23T04:28:47.000000Z\",\"created_at\":\"2021-04-23T04:28:47.000000Z\",\"id_validasi_rpd\":2}','null','2021-04-23 11:28:47','2021-04-23 11:28:47'),
	(155,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Memvalidasi RPD versi 1 bulan 5 unit 5020','{\"id_validasi_rpd\":2,\"unit\":5020,\"tahun\":2021,\"bulan\":5,\"versi\":1,\"sts_valid\":\"2\",\"wkt_valid\":\"2021-04-23 13:42:58\",\"ket_valid\":\"Tolak\",\"validator\":1,\"created_at\":\"2021-04-23T04:28:47.000000Z\",\"updated_at\":\"2021-04-23T06:42:58.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','null','2021-04-23 13:42:58','2021-04-23 13:42:58'),
	(156,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Memvalidasi RPD versi 1 bulan 5 unit 5020','{\"id_validasi_rpd\":2,\"unit\":5020,\"tahun\":2021,\"bulan\":5,\"versi\":1,\"sts_valid\":\"2\",\"wkt_valid\":\"2021-04-23 13:43:37\",\"ket_valid\":\"nominal melebihi anggaran\",\"validator\":1,\"created_at\":\"2021-04-23T04:28:47.000000Z\",\"updated_at\":\"2021-04-23T06:43:37.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','null','2021-04-23 13:43:37','2021-04-23 13:43:37'),
	(157,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Memvalidasi RPD versi 1 bulan 5 unit 5020','{\"id_validasi_rpd\":2,\"unit\":5020,\"tahun\":2021,\"bulan\":5,\"versi\":1,\"sts_valid\":\"1\",\"wkt_valid\":\"2021-04-23 13:44:14\",\"ket_valid\":\"ok\",\"validator\":1,\"created_at\":\"2021-04-23T04:28:47.000000Z\",\"updated_at\":\"2021-04-23T06:44:14.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','null','2021-04-23 13:44:14','2021-04-23 13:44:14'),
	(158,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data RPD Kegiatan. id=19.','{\"id_rpd\":null,\"k_id\":\"98731\",\"unit\":\"5020\",\"unit_asli\":\"9111\",\"nm_kegiatan\":\"Layanan Perkantoran dan Pendidikan Bulan Februari 2021\",\"bulan_rpd\":\"6\",\"ls\":\"700,000\",\"up\":\"0\"}','null','2021-04-23 13:52:42','2021-04-23 13:52:42'),
	(159,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Kegiatan RPD. id=19.','{\"id_rpd\":19,\"k_id\":98731,\"unit_asli\":9111,\"unit\":5020,\"nomor\":3,\"nm_kegiatan\":\"Layanan Perkantoran dan Pendidikan Bulan Februari 2021\",\"tahun\":2021,\"bulan_rpd\":6,\"ls\":700000,\"up\":0,\"kd_anggaran\":\"4471.TAA.001.051.B\",\"ex_id_rpd\":null,\"created_at\":\"2021-04-23T06:52:42.000000Z\",\"updated_at\":\"2021-04-23T06:52:42.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','{\"id_rpd\":\"19\",\"k_id\":\"98731\",\"unit\":\"5020\",\"unit_asli\":\"9111\",\"nm_kegiatan\":\"Layanan Perkantoran dan Pendidikan Bulan Februari 2021\",\"bulan_rpd\":\"6\",\"ls\":\"700,000\",\"up\":\"0\"}','2021-04-23 13:52:46','2021-04-23 13:52:46'),
	(160,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menghapus data Role User. id=19.','{\"id_rpd\":19,\"k_id\":98731,\"unit_asli\":9111,\"unit\":5020,\"nomor\":3,\"nm_kegiatan\":\"Layanan Perkantoran dan Pendidikan Bulan Februari 2021\",\"tahun\":2021,\"bulan_rpd\":6,\"ls\":700000,\"up\":0,\"kd_anggaran\":\"4471.TAA.001.051.B\",\"ex_id_rpd\":null,\"created_at\":\"2021-04-23 13:52:42\",\"updated_at\":\"2021-04-23 13:52:46\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','null','2021-04-23 13:52:50','2021-04-23 13:52:50'),
	(161,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Memvalidasi RPD versi 1 bulan 5 unit 5020','{\"id_validasi_rpd\":2,\"unit\":5020,\"tahun\":2021,\"bulan\":5,\"versi\":1,\"sts_valid\":\"1\",\"wkt_valid\":\"2021-04-23 13:56:59\",\"ket_valid\":\"OK\",\"validator\":1,\"created_at\":\"2021-04-23T04:28:47.000000Z\",\"updated_at\":\"2021-04-23T06:56:59.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','null','2021-04-23 13:56:59','2021-04-23 13:56:59'),
	(162,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengajukan RPD versi 2 bulan 5 unit 5020','{\"unit\":\"5020\",\"tahun\":\"2021\",\"bulan\":\"5\",\"versi\":2,\"sts_valid\":0,\"created_by\":1,\"updated_at\":\"2021-04-23T06:57:40.000000Z\",\"created_at\":\"2021-04-23T06:57:40.000000Z\",\"id_validasi_rpd\":3}','null','2021-04-23 13:57:40','2021-04-23 13:57:40'),
	(163,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Memvalidasi RPD versi 2 bulan 5 unit 5020','{\"id_validasi_rpd\":3,\"unit\":5020,\"tahun\":2021,\"bulan\":5,\"versi\":2,\"sts_valid\":\"2\",\"wkt_valid\":\"2021-04-23 13:59:20\",\"ket_valid\":\"Tolak\",\"validator\":1,\"created_at\":\"2021-04-23T06:57:40.000000Z\",\"updated_at\":\"2021-04-23T06:59:20.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','null','2021-04-23 13:59:20','2021-04-23 13:59:20'),
	(164,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Memvalidasi RPD versi 2 bulan 5 unit 5020','{\"id_validasi_rpd\":3,\"unit\":5020,\"tahun\":2021,\"bulan\":5,\"versi\":2,\"sts_valid\":\"1\",\"wkt_valid\":\"2021-04-23 13:59:49\",\"ket_valid\":\"ok\",\"validator\":1,\"created_at\":\"2021-04-23T06:57:40.000000Z\",\"updated_at\":\"2021-04-23T06:59:49.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','null','2021-04-23 13:59:49','2021-04-23 13:59:49'),
	(165,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengajukan RPD versi 3 bulan 5 unit 5020','{\"unit\":\"5020\",\"tahun\":\"2021\",\"bulan\":\"5\",\"versi\":3,\"sts_valid\":0,\"created_by\":1,\"updated_at\":\"2021-04-23T07:01:06.000000Z\",\"created_at\":\"2021-04-23T07:01:06.000000Z\",\"id_validasi_rpd\":4}','null','2021-04-23 14:01:06','2021-04-23 14:01:06'),
	(166,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Memvalidasi RPD versi 3 bulan 5 unit 5020','{\"id_validasi_rpd\":4,\"unit\":5020,\"tahun\":2021,\"bulan\":5,\"versi\":3,\"sts_valid\":\"1\",\"wkt_valid\":\"2021-04-23 14:01:19\",\"ket_valid\":\"OK\",\"validator\":1,\"created_at\":\"2021-04-23T07:01:06.000000Z\",\"updated_at\":\"2021-04-23T07:01:19.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','null','2021-04-23 14:01:19','2021-04-23 14:01:19'),
	(167,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Melakukan validasi sub unit','{\"bulan\":\"5\"}','null','2021-04-23 14:30:11','2021-04-23 14:30:11'),
	(168,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Melakukan validasi sub unit','{\"bulan\":\"5\"}','null','2021-04-23 14:30:17','2021-04-23 14:30:17'),
	(169,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Melakukan validasi sub unit','{\"bulan\":\"5\"}','null','2021-04-23 14:30:23','2021-04-23 14:30:23'),
	(170,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Melakukan validasi sub unit','{\"bulan\":\"5\"}','null','2021-04-23 14:30:38','2021-04-23 14:30:38'),
	(171,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menduplikasi data RPD bulan 5 ke bulan 6','{\"bulan\":\"5\",\"rpd\":{\"7\":\"1\",\"11\":\"1\",\"14\":\"1\"}}','null','2021-04-23 14:48:53','2021-04-23 14:48:53'),
	(172,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menduplikasi data RPD bulan 7 ke bulan 8','{\"bulan\":\"7\",\"rpd\":{\"12\":\"1\",\"13\":\"1\"}}','null','2021-04-23 14:49:14','2021-04-23 14:49:14'),
	(173,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengajukan RPD versi 4 bulan 5 unit 5020','{\"unit\":\"5020\",\"tahun\":\"2021\",\"bulan\":\"5\",\"versi\":4,\"sts_valid\":0,\"created_by\":1,\"updated_at\":\"2021-04-23T07:50:11.000000Z\",\"created_at\":\"2021-04-23T07:50:11.000000Z\",\"id_validasi_rpd\":5}','null','2021-04-23 14:50:11','2021-04-23 14:50:11'),
	(174,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Memvalidasi RPD versi 4 bulan 5 unit 5020','{\"id_validasi_rpd\":5,\"unit\":5020,\"tahun\":2021,\"bulan\":5,\"versi\":4,\"sts_valid\":\"2\",\"wkt_valid\":\"2021-04-23 14:50:29\",\"ket_valid\":\"Kamu jelek\",\"validator\":1,\"saldo_rpd_lalu\":null,\"created_at\":\"2021-04-23T07:50:11.000000Z\",\"updated_at\":\"2021-04-23T07:50:29.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','null','2021-04-23 14:50:29','2021-04-23 14:50:29'),
	(175,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Memvalidasi RPD versi 4 bulan 5 unit 5020','{\"id_validasi_rpd\":5,\"unit\":5020,\"tahun\":2021,\"bulan\":5,\"versi\":4,\"sts_valid\":\"1\",\"wkt_valid\":\"2021-04-23 14:50:55\",\"ket_valid\":\"OK\",\"validator\":1,\"saldo_rpd_lalu\":null,\"created_at\":\"2021-04-23T07:50:11.000000Z\",\"updated_at\":\"2021-04-23T07:50:55.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','null','2021-04-23 14:50:55','2021-04-23 14:50:55'),
	(176,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Melakukan validasi sub unit','{\"bulan\":\"5\",\"validasi\":[\"9156\",\"9111\"]}','null','2021-04-23 14:51:13','2021-04-23 14:51:13'),
	(177,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengajukan RPD versi 5 bulan 5 unit 5020','{\"unit\":\"5020\",\"tahun\":\"2021\",\"bulan\":\"5\",\"versi\":5,\"sts_valid\":0,\"created_by\":1,\"updated_at\":\"2021-04-23T08:15:58.000000Z\",\"created_at\":\"2021-04-23T08:15:58.000000Z\",\"id_validasi_rpd\":6}','null','2021-04-23 15:15:58','2021-04-23 15:15:58'),
	(178,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Memvalidasi RPD versi 5 bulan 5 unit 5020','{\"id_validasi_rpd\":6,\"unit\":5020,\"tahun\":2021,\"bulan\":5,\"versi\":5,\"sts_valid\":\"1\",\"wkt_valid\":\"2021-04-23 15:17:09\",\"ket_valid\":\"ok\",\"validator\":1,\"saldo_rpd_lalu\":null,\"bpt_lalu\":null,\"spp_up_ini\":null,\"created_at\":\"2021-04-23T08:15:58.000000Z\",\"updated_at\":\"2021-04-23T08:17:09.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','null','2021-04-23 15:17:09','2021-04-23 15:17:09'),
	(179,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data RPD Kegiatan. id=1.','{\"id_rpd\":null,\"k_id\":\"98428\",\"unit\":\"5020\",\"unit_asli\":\"9156\",\"nm_kegiatan\":\"Biaya Operasional Penyusunan Disertasi Tenaga Kependidikan Tahun 2021\",\"bulan_rpd\":\"5\",\"ls\":\"0\",\"up\":\"25,000,000\"}','null','2021-04-26 05:22:05','2021-04-26 05:22:05'),
	(180,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data RPD Kegiatan. id=2.','{\"id_rpd\":null,\"k_id\":\"99344\",\"unit\":\"5020\",\"unit_asli\":\"9156\",\"nm_kegiatan\":\"Biaya Operasional Penyusunan Disertasi Tenaga Pendidik Tahun 2021\",\"bulan_rpd\":\"5\",\"ls\":\"0\",\"up\":\"20,000,000\"}','null','2021-04-26 05:22:23','2021-04-26 05:22:23'),
	(181,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data RPD Kegiatan. id=3.','{\"id_rpd\":null,\"k_id\":\"99704\",\"unit\":\"5020\",\"unit_asli\":\"9156\",\"nm_kegiatan\":\"Biaya Perjalanan Dinas Bagian Perencanaan\",\"bulan_rpd\":\"5\",\"ls\":\"10,000,000\",\"up\":\"0\"}','null','2021-04-26 05:22:43','2021-04-26 05:22:43'),
	(182,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data RPD Kegiatan. id=4.','{\"id_rpd\":null,\"k_id\":\"99435\",\"unit\":\"5020\",\"unit_asli\":\"9156\",\"nm_kegiatan\":\"Penghargaan Kepada Pegawai atas Pengabdiannya TA 2021 Bulan Maret\",\"bulan_rpd\":\"5\",\"ls\":\"0\",\"up\":\"10,000,000\"}','null','2021-04-26 05:23:02','2021-04-26 05:23:02'),
	(183,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data RPD Kegiatan. id=5.','{\"id_rpd\":null,\"k_id\":\"99337\",\"unit\":\"5020\",\"unit_asli\":\"9111\",\"nm_kegiatan\":\"Pelatihan Web Programming Full Package (Vue JS+Laravel)\",\"bulan_rpd\":\"5\",\"ls\":\"0\",\"up\":\"10,000,000\"}','null','2021-04-26 05:24:18','2021-04-26 05:24:18'),
	(184,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data RPD Kegiatan. id=6.','{\"id_rpd\":null,\"k_id\":\"99339\",\"unit\":\"5020\",\"unit_asli\":\"9111\",\"nm_kegiatan\":\"Pelatihan Front-End Web Programming with Vue JS\",\"bulan_rpd\":\"5\",\"ls\":\"0\",\"up\":\"25,000,000\"}','null','2021-04-26 05:24:35','2021-04-26 05:24:35'),
	(185,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data RPD Kegiatan. id=7.','{\"id_rpd\":null,\"k_id\":\"99803\",\"unit\":\"5020\",\"unit_asli\":\"9111\",\"nm_kegiatan\":\"Pelatihan Docker Administration with Kubernetes\",\"bulan_rpd\":\"5\",\"ls\":\"15,000,000\",\"up\":\"0\"}','null','2021-04-26 05:24:54','2021-04-26 05:24:54'),
	(186,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Melakukan validasi sub unit','{\"bulan\":\"5\",\"validasi\":[\"9156\",\"9111\"]}','null','2021-04-26 05:26:48','2021-04-26 05:26:48'),
	(187,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengajukan RPD versi 1 bulan 5 unit 5020','{\"unit\":\"5020\",\"tahun\":\"2021\",\"bulan\":\"5\",\"versi\":1,\"sts_valid\":0,\"created_by\":1,\"updated_at\":\"2021-04-25T22:26:55.000000Z\",\"created_at\":\"2021-04-25T22:26:55.000000Z\",\"id_validasi_rpd\":1}','null','2021-04-26 05:26:55','2021-04-26 05:26:55'),
	(188,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Memvalidasi RPD versi 1 bulan 5 unit 5020','{\"id_validasi_rpd\":1,\"unit\":5020,\"tahun\":2021,\"bulan\":5,\"versi\":1,\"sts_valid\":\"2\",\"wkt_valid\":\"2021-04-26 05:27:15\",\"ket_valid\":\"Nominal terlalu berlebihan\",\"validator\":1,\"saldo_rpd_lalu\":null,\"pk_lalu\":null,\"bpt_lalu\":null,\"spp_up_ini\":null,\"created_at\":\"2021-04-25T22:26:55.000000Z\",\"updated_at\":\"2021-04-25T22:27:15.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','null','2021-04-26 05:27:15','2021-04-26 05:27:15'),
	(189,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengajukan ulang RPD versi 1 bulan 5 unit 5020','\"1\"','null','2021-04-26 05:40:21','2021-04-26 05:40:21'),
	(190,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Memvalidasi RPD versi 1 bulan 5 unit 5020','{\"id_validasi_rpd\":1,\"unit\":5020,\"tahun\":2021,\"bulan\":5,\"versi\":1,\"sts_valid\":\"1\",\"wkt_valid\":\"2021-04-26 05:56:39\",\"ket_valid\":\"Valid\",\"validator\":1,\"saldo_rpd_lalu\":70878730,\"pk_lalu\":\"681099742\",\"bpt_lalu\":0,\"spp_up_ini\":0,\"rpd_final\":19121270,\"is_transfered\":0,\"created_at\":\"2021-04-25T22:26:55.000000Z\",\"updated_at\":\"2021-04-25T22:56:39.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','null','2021-04-26 05:56:39','2021-04-26 05:56:39'),
	(191,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data app_setting. id=3.','{\"id_sys_setting\":3,\"key\":\"sys_author_name\",\"content\":\"UNNES\",\"created_at\":\"2021-03-19T07:07:17.000000Z\",\"updated_at\":\"2021-04-20T05:43:43.000000Z\",\"deleted_at\":null,\"created_by\":null,\"updated_by\":1,\"deleted_by\":null}','{\"id_sys_setting\":3,\"key\":\"sys_author_name\",\"content\":\"UPT TIK\",\"created_at\":\"2021-03-19 14:07:17\",\"updated_at\":\"2021-04-20 12:43:43\",\"deleted_at\":null,\"created_by\":null,\"updated_by\":1,\"deleted_by\":null}','2021-04-26 07:16:55','2021-04-26 07:16:55'),
	(192,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Role User. id=2.','{\"id_user_role\":2,\"id_user\":1,\"id_role\":2,\"unit\":5020,\"created_at\":\"2021-03-19T07:07:17.000000Z\",\"updated_at\":\"2021-03-19T07:07:17.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','{\"id_user\":\"1\",\"id_user_role\":\"2\",\"id_role\":\"2\",\"unit\":\"7777\"}','2021-04-26 07:20:37','2021-04-26 07:20:37'),
	(193,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Role User. id=3.','{\"id_user_role\":3,\"id_user\":1,\"id_role\":3,\"unit\":9156,\"created_at\":\"2021-03-19T07:07:17.000000Z\",\"updated_at\":\"2021-03-19T07:07:17.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','{\"id_user\":\"1\",\"id_user_role\":\"3\",\"id_role\":\"3\",\"unit\":\"5020\"}','2021-04-26 07:20:51','2021-04-26 07:20:51'),
	(194,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Role User. id=8.','{\"id_user_role\":8,\"id_user\":1,\"id_role\":4,\"unit\":5134,\"created_at\":\"2021-04-21T07:21:12.000000Z\",\"updated_at\":\"2021-04-21T07:21:12.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','{\"id_user\":\"1\",\"id_user_role\":\"8\",\"id_role\":\"4\",\"unit\":\"9156\"}','2021-04-26 07:21:12','2021-04-26 07:21:12'),
	(195,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Role User. id=10.','{\"id_user_role\":10,\"id_user\":1,\"id_role\":6,\"unit\":9111,\"created_at\":\"2021-04-22T05:04:42.000000Z\",\"updated_at\":\"2021-04-22T05:05:10.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','{\"id_user\":\"1\",\"id_user_role\":\"10\",\"id_role\":\"6\",\"unit\":\"5020\"}','2021-04-26 07:21:23','2021-04-26 07:21:23'),
	(196,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Role User. id=11.','{\"id_user_role\":11,\"id_user\":1,\"id_role\":7,\"unit\":9111,\"created_at\":\"2021-04-22T05:04:42.000000Z\",\"updated_at\":\"2021-04-22T05:05:10.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','{\"id_user\":\"1\",\"id_user_role\":\"11\",\"id_role\":\"7\",\"unit\":\"5020\"}','2021-04-26 07:21:33','2021-04-26 07:21:33'),
	(197,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Role User. id=12.','{\"id_user_role\":12,\"id_user\":1,\"id_role\":8,\"unit\":5020,\"created_at\":\"2021-03-19T07:07:17.000000Z\",\"updated_at\":\"2021-03-19T07:07:17.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','{\"id_user\":\"1\",\"id_user_role\":\"12\",\"id_role\":\"8\",\"unit\":\"7777\"}','2021-04-26 07:21:49','2021-04-26 07:21:49'),
	(198,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Melakukan validasi sub unit','{\"bulan\":\"5\",\"validasi\":[\"9111\"]}','null','2021-04-26 07:32:59','2021-04-26 07:32:59'),
	(199,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Melakukan validasi sub unit','{\"bulan\":\"5\",\"validasi\":[\"9156\",\"9111\"]}','null','2021-04-26 07:33:02','2021-04-26 07:33:02'),
	(200,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data RPD Kegiatan. id=8.','{\"id_rpd\":null,\"k_id\":\"98427\",\"unit\":\"5020\",\"unit_asli\":\"9156\",\"nm_kegiatan\":\"Biaya Operasional Penyusunan Disertasi Tenaga Pendidik Tahun 2021\",\"bulan_rpd\":\"5\",\"ls\":\"0\",\"up\":\"30,000,000\"}','null','2021-04-26 09:01:15','2021-04-26 09:01:15'),
	(201,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Melakukan validasi sub unit','{\"bulan\":\"5\",\"validasi\":[\"9156\",\"9111\"]}','null','2021-04-26 10:25:57','2021-04-26 10:25:57'),
	(202,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengajukan RPD versi 2 bulan 5 unit 5020','{\"unit\":\"5020\",\"tahun\":\"2021\",\"bulan\":\"5\",\"versi\":2,\"sts_valid\":0,\"created_by\":1,\"updated_at\":\"2021-04-26T03:28:36.000000Z\",\"created_at\":\"2021-04-26T03:28:36.000000Z\",\"id_validasi_rpd\":2}','null','2021-04-26 10:28:36','2021-04-26 10:28:36'),
	(203,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Memvalidasi RPD versi 2 bulan 5 unit 5020','{\"id_validasi_rpd\":2,\"unit\":5020,\"tahun\":2021,\"bulan\":5,\"versi\":2,\"sts_valid\":\"2\",\"wkt_valid\":\"2021-04-26 10:29:22\",\"ket_valid\":\"Nominal tidak sesuai PAGU\",\"validator\":1,\"saldo_rpd_lalu\":70878730,\"pk_lalu\":\"681099742\",\"bpt_lalu\":0,\"spp_up_ini\":0,\"rpd_final\":49121270,\"is_transfered\":0,\"wkt_transfer\":null,\"transfered_by\":null,\"created_at\":\"2021-04-26T03:28:36.000000Z\",\"updated_at\":\"2021-04-26T03:29:22.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','null','2021-04-26 10:29:22','2021-04-26 10:29:22'),
	(204,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Memvalidasi RPD versi 2 bulan 5 unit 5020','{\"id_validasi_rpd\":2,\"unit\":5020,\"tahun\":2021,\"bulan\":5,\"versi\":2,\"sts_valid\":\"1\",\"wkt_valid\":\"2021-04-26 10:33:43\",\"ket_valid\":\"OK\",\"validator\":1,\"saldo_rpd_lalu\":70878730,\"pk_lalu\":\"681099742\",\"bpt_lalu\":0,\"spp_up_ini\":0,\"rpd_final\":49121270,\"is_transfered\":0,\"wkt_transfer\":null,\"transfered_by\":null,\"created_at\":\"2021-04-26T03:28:36.000000Z\",\"updated_at\":\"2021-04-26T03:33:43.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','null','2021-04-26 10:33:43','2021-04-26 10:33:43'),
	(205,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data Modul Grup. id=11.','{\"id_menu_group\":\"2\",\"id_modul_group\":null,\"nm_modul_group\":\"Ganti Unit\",\"urutan\":\"5\",\"icon_modul_group\":\"bi bi-sliders\"}','null','2021-04-27 14:28:04','2021-04-27 14:28:04'),
	(206,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data Modul. id=18.','{\"id_modul_group\":\"11\",\"id_modul\":null,\"nm_modul\":\"Ganti Unit\",\"urutan\":\"1\",\"route_prefix\":\"ganti_unit\",\"is_tampil\":\"1\"}','null','2021-04-27 14:28:24','2021-04-27 14:28:24'),
	(207,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data RPD Kegiatan. id=9.','{\"id_rpd\":null,\"k_id\":\"99803\",\"unit\":\"5020\",\"unit_asli\":\"9111\",\"nm_kegiatan\":\"Pelatihan Docker Administration with Kubernetes\",\"bulan_rpd\":\"6\",\"ls\":\"0\",\"up\":\"10,000,000\"}','null','2021-04-27 16:05:37','2021-04-27 16:05:37'),
	(208,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.1 Safari/605.1.15','Mentransfer Pagu Transito dari ID Validasi 1.','null','null','2021-04-30 23:21:49','2021-04-30 23:21:49'),
	(209,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menghapus data Role User. id=895.','{\"id_rpd\":895,\"k_id\":100551,\"unit_asli\":9094,\"unit\":2020,\"nomor\":158,\"nm_kegiatan\":\"STRUCTURAL HEALTH MONITORING OF MERAH PUTIH AMBON CABLE-STAYED BRIDGES SUBJECTED TO NEAR FAULT EARTHQUAKE A.N Dr RINI KUSUMAWARDANI S. T., M. T., M. Sc\",\"tahun\":2021,\"bulan_rpd\":5,\"ls\":70000000,\"up\":0,\"kd_anggaran\":\"4471.QEI.001.052.A\",\"ex_id_rpd\":null,\"created_at\":\"2021-04-30 15:20:37\",\"updated_at\":\"2021-04-30 15:20:37\",\"deleted_at\":null,\"created_by\":37,\"updated_by\":null,\"deleted_by\":null}','null','2021-05-01 10:14:43','2021-05-01 10:14:43'),
	(210,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data RPD Kegiatan. id=1080.','{\"id_rpd\":null,\"k_id\":\"100551\",\"unit\":\"2020\",\"unit_asli\":\"9094\",\"nm_kegiatan\":\"STRUCTURAL HEALTH MONITORING OF MERAH PUTIH AMBON CABLE-STAYED BRIDGES SUBJECTED TO NEAR FAULT EARTHQUAKE\",\"bulan_rpd\":\"1\",\"ls\":\"70,000,000\",\"up\":\"0\"}','null','2021-05-01 10:14:47','2021-05-01 10:14:47'),
	(211,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data RPD Kegiatan. id=1081.','{\"id_rpd\":null,\"k_id\":\"100551\",\"unit\":\"2020\",\"unit_asli\":\"9094\",\"nm_kegiatan\":\"STRUCTURAL HEALTH MONITORING OF MERAH PUTIH AMBON CABLE-STAYED BRIDGES SUBJECTED TO NEAR FAULT EARTHQUAKE\",\"bulan_rpd\":\"1\",\"ls\":\"30,000,000\",\"up\":\"0\"}','null','2021-05-01 10:14:50','2021-05-01 10:14:50'),
	(212,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menghapus data Role User. id=1081.','{\"id_rpd\":1081,\"k_id\":100551,\"unit_asli\":9094,\"unit\":2020,\"nomor\":2,\"nm_kegiatan\":\"STRUCTURAL HEALTH MONITORING OF MERAH PUTIH AMBON CABLE-STAYED BRIDGES SUBJECTED TO NEAR FAULT EARTHQUAKE\",\"tahun\":2021,\"bulan_rpd\":1,\"ls\":30000000,\"up\":0,\"kd_anggaran\":\"4471.QEI.001.052.A\",\"ex_id_rpd\":null,\"created_at\":\"2021-05-01 10:14:50\",\"updated_at\":\"2021-05-01 10:14:50\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','null','2021-05-01 10:15:07','2021-05-01 10:15:07'),
	(213,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data RPD Kegiatan. id=1082.','{\"id_rpd\":null,\"k_id\":\"101584\",\"unit\":\"2020\",\"unit_asli\":\"9094\",\"nm_kegiatan\":\"MERAWAT TOLERANSI ANTARETNIS DAN AGAMA, MEMPERKUAT INTEGRATED SOCIETY:POTRET KEBHINEKAAN DI KAMPUNG MELAYU SEMARANG\",\"bulan_rpd\":\"1\",\"ls\":\"24,500,000\",\"up\":\"0\"}','null','2021-05-01 10:17:09','2021-05-01 10:17:09'),
	(214,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data RPD Kegiatan. id=1083.','{\"id_rpd\":null,\"k_id\":\"101584\",\"unit\":\"2020\",\"unit_asli\":\"9094\",\"nm_kegiatan\":\"MERAWAT TOLERANSI ANTARETNIS DAN AGAMA, MEMPERKUAT INTEGRATED SOCIETY:POTRET KEBHINEKAAN DI KAMPUNG MELAYU SEMARANG\",\"bulan_rpd\":\"6\",\"ls\":\"10,500,000\",\"up\":\"0\"}','null','2021-05-01 10:17:22','2021-05-01 10:17:22'),
	(215,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menghapus data Role User. id=1083.','{\"id_rpd\":1083,\"k_id\":101584,\"unit_asli\":9094,\"unit\":2020,\"nomor\":1,\"nm_kegiatan\":\"MERAWAT TOLERANSI ANTARETNIS DAN AGAMA, MEMPERKUAT INTEGRATED SOCIETY:POTRET KEBHINEKAAN DI KAMPUNG MELAYU SEMARANG\",\"tahun\":2021,\"bulan_rpd\":6,\"ls\":10500000,\"up\":0,\"kd_anggaran\":\"4471.QEI.001.052.A\",\"ex_id_rpd\":null,\"created_at\":\"2021-05-01 10:17:22\",\"updated_at\":\"2021-05-01 10:17:22\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','null','2021-05-01 10:33:53','2021-05-01 10:33:53'),
	(216,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.1 Safari/605.1.15','Memvalidasi RPD versi 1 bulan 5 unit 1070','{\"id_validasi_rpd\":3,\"unit\":1070,\"tahun\":2021,\"bulan\":5,\"versi\":1,\"sts_valid\":\"1\",\"wkt_valid\":\"2021-05-01 13:25:10\",\"ket_valid\":\"OK\",\"validator\":1,\"saldo_rpd_lalu\":264917669,\"pk_lalu\":\"203864924\",\"bpt_lalu\":0,\"spp_up_ini\":0,\"rpd_final\":-25052354,\"is_transfered\":0,\"wkt_transfer\":null,\"transfered_by\":null,\"created_at\":\"2021-04-29T03:57:52.000000Z\",\"updated_at\":\"2021-05-01T06:25:10.000000Z\",\"deleted_at\":null,\"created_by\":24,\"updated_by\":1,\"deleted_by\":null}','null','2021-05-01 13:25:10','2021-05-01 13:25:10'),
	(217,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.1 Safari/605.1.15','Memvalidasi RPD versi 1 bulan 5 unit 2040','{\"id_validasi_rpd\":1,\"unit\":2040,\"tahun\":2021,\"bulan\":5,\"versi\":1,\"sts_valid\":\"1\",\"wkt_valid\":\"2021-05-01 13:25:40\",\"ket_valid\":\"OK\",\"validator\":1,\"saldo_rpd_lalu\":132623650,\"pk_lalu\":\"140579100\",\"bpt_lalu\":0,\"spp_up_ini\":0,\"rpd_final\":40596350,\"is_transfered\":0,\"wkt_transfer\":null,\"transfered_by\":null,\"created_at\":\"2021-04-27T08:36:06.000000Z\",\"updated_at\":\"2021-05-01T06:25:40.000000Z\",\"deleted_at\":null,\"created_by\":32,\"updated_by\":1,\"deleted_by\":null}','null','2021-05-01 13:25:40','2021-05-01 13:25:40'),
	(218,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.1 Safari/605.1.15','Mentransfer Pagu Transito dari ID Validasi 1.','null','null','2021-05-01 13:29:10','2021-05-01 13:29:10'),
	(219,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/13.1.1 Safari/605.1.15','Mentransfer Pagu Transito dari ID Validasi 1.','null','null','2021-05-01 13:31:47','2021-05-01 13:31:47'),
	(220,6,'FARIDA RAHMAWATI','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menghapus data Role User. id=492.','{\"id_rpd\":492,\"k_id\":101208,\"unit_asli\":9028,\"unit\":1030,\"nomor\":7,\"nm_kegiatan\":\"Uang makan Tenaga Kependidikan non PNS April 2021\",\"tahun\":2021,\"bulan_rpd\":5,\"ls\":8500000,\"up\":0,\"kd_anggaran\":\"4471.TAA.001.053.A\",\"ex_id_rpd\":null,\"created_at\":\"2021-04-30 00:53:13\",\"updated_at\":\"2021-04-30 00:53:13\",\"deleted_at\":null,\"created_by\":33,\"updated_by\":null,\"deleted_by\":null}','null','2021-05-03 14:42:00','2021-05-03 14:42:00'),
	(221,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data Grup Menu. id=4.','{\"id_menu_group\":null,\"nm_menu_group\":\"E-Promosi\",\"urutan\":\"1\"}','null','2021-05-04 08:31:08','2021-05-04 08:31:08'),
	(222,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data Modul Grup. id=6.','{\"id_menu_group\":\"4\",\"id_modul_group\":null,\"nm_modul_group\":\"Data Layanan\",\"urutan\":\"1\",\"icon_modul_group\":\"bi bi-cart-3\"}','null','2021-05-04 08:32:11','2021-05-04 08:32:11'),
	(223,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data Modul. id=9.','{\"id_modul_group\":\"6\",\"id_modul\":null,\"nm_modul\":\"Kategori Layanan\",\"urutan\":\"1\",\"route_prefix\":\"p-kategori\",\"is_tampil\":\"1\"}','null','2021-05-04 08:32:31','2021-05-04 08:32:31'),
	(224,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data Modul. id=10.','{\"id_modul_group\":\"6\",\"id_modul\":null,\"nm_modul\":\"Data Layanan\",\"urutan\":\"2\",\"route_prefix\":\"p-item\",\"is_tampil\":\"1\"}','null','2021-05-04 08:34:06','2021-05-04 08:34:06'),
	(225,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data Kategori. id=1.','{\"nm_kategori\":\"Layanan \\/ Aset\",\"desc_kategori\":\"Penyewaan Lapangan, Gedung, dan peralatan lainnya\",\"img_kategori\":\"kategori\\/fkssSJotggHiqKSFKKVoqZ98gCpR8qmrl8i5JuVI.jpg\",\"created_by\":1,\"updated_at\":\"2021-05-04T02:20:22.000000Z\",\"created_at\":\"2021-05-04T02:20:22.000000Z\",\"id_kategori\":1}','null','2021-05-04 09:20:22','2021-05-04 09:20:22'),
	(226,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Kategori. id=1.','{\"id_kategori\":1,\"nm_kategori\":\"Layanan \\/ Aset\",\"desc_kategori\":\"Penyewaan Lapangan, Gedung, dan peralatan lainnya\",\"img_kategori\":\"kategori\\/fkssSJotggHiqKSFKKVoqZ98gCpR8qmrl8i5JuVI.jpg\",\"created_at\":\"2021-05-04T02:20:22.000000Z\",\"updated_at\":\"2021-05-04T02:20:22.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','{\"id_kategori\":\"1\",\"nm_kategori\":\"Layanan \\/ Aset\",\"desc_kategori\":\"Penyewaan Lapangan, Gedung, dan peralatan lainnya\"}','2021-05-04 09:40:06','2021-05-04 09:40:06'),
	(227,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Kategori. id=1.','{\"id_kategori\":1,\"nm_kategori\":\"Layanan \\/ Aset\",\"desc_kategori\":\"Penyewaan Lapangan, Gedung, dan peralatan lainnya\",\"img_kategori\":\"kategori\\/zGSR4YMXcREZQ2PD0f78ggrESt79ZBtPpZLKYPSp.jpg\",\"created_at\":\"2021-05-04T02:20:22.000000Z\",\"updated_at\":\"2021-05-04T02:40:06.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','{\"id_kategori\":\"1\",\"nm_kategori\":\"Layanan \\/ Aset\",\"desc_kategori\":\"Penyewaan Lapangan, Gedung, dan peralatan lainnya\"}','2021-05-04 09:45:18','2021-05-04 09:45:18'),
	(228,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Kategori. id=1.','{\"id_kategori\":1,\"nm_kategori\":\"Layanan \\/ Aset\",\"desc_kategori\":\"Penyewaan Lapangan, Gedung, dan peralatan lainnya\",\"img_kategori\":\"public\\/kategori\\/HEVsuhOc5CpUv6EPOYbFdL0U1lNUJ6GOj5SAoU5F.jpg\",\"created_at\":\"2021-05-04T02:20:22.000000Z\",\"updated_at\":\"2021-05-04T02:45:18.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','{\"id_kategori\":\"1\",\"nm_kategori\":\"Layanan \\/ Aset\",\"desc_kategori\":\"Penyewaan Lapangan, Gedung, dan peralatan lainnya\"}','2021-05-04 09:52:38','2021-05-04 09:52:38'),
	(229,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data Kategori. id=2.','{\"nm_kategori\":\"Contoh-contoh\",\"desc_kategori\":\"kategori contoh contih\",\"img_kategori\":\"kategori\\/cdgaLDUTEJphFBWBO6pcK2LmPhUkFzhWgafq01k9\",\"created_by\":1,\"updated_at\":\"2021-05-04T02:55:06.000000Z\",\"created_at\":\"2021-05-04T02:55:06.000000Z\",\"id_kategori\":2}','null','2021-05-04 09:55:06','2021-05-04 09:55:06'),
	(230,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menghapus data Kategori. id=2.','{\"id_kategori\":2,\"nm_kategori\":\"Contoh-contoh\",\"desc_kategori\":\"kategori contoh contih\",\"img_kategori\":\"kategori\\/cdgaLDUTEJphFBWBO6pcK2LmPhUkFzhWgafq01k9\",\"created_at\":\"2021-05-04 09:55:06\",\"updated_at\":\"2021-05-04 09:55:06\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','null','2021-05-04 09:55:11','2021-05-04 09:55:11'),
	(231,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data Kategori. id=3.','{\"nm_kategori\":\"Pelatihan\",\"desc_kategori\":\"Jasa berupa pengadaan pelatihan yang diajarkan oleh para ahli terseritikasi.\",\"img_kategori\":\"kategori\\/Pm9WmcjnKUOozplFPudTt17AXuwVv5CXQhqUFSOr\",\"created_by\":1,\"updated_at\":\"2021-05-04T02:56:48.000000Z\",\"created_at\":\"2021-05-04T02:56:48.000000Z\",\"id_kategori\":3}','null','2021-05-04 09:56:48','2021-05-04 09:56:48'),
	(232,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Kategori. id=3.','{\"id_kategori\":3,\"nm_kategori\":\"Pelatihan\",\"desc_kategori\":\"Jasa berupa pengadaan pelatihan yang diajarkan oleh para ahli terseritikasi.\",\"img_kategori\":\"kategori\\/Pm9WmcjnKUOozplFPudTt17AXuwVv5CXQhqUFSOr\",\"created_at\":\"2021-05-04T02:56:48.000000Z\",\"updated_at\":\"2021-05-04T02:56:48.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','{\"id_kategori\":\"3\",\"nm_kategori\":\"Pelatihan\",\"desc_kategori\":\"Jasa berupa pengadaan pelatihan yang diajarkan oleh para ahli terseritikasi.\"}','2021-05-04 10:31:18','2021-05-04 10:31:18'),
	(233,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Kategori. id=3.','{\"id_kategori\":3,\"nm_kategori\":\"Pelatihan\",\"desc_kategori\":\"Jasa berupa pengadaan pelatihan yang diajarkan oleh para ahli terseritikasi.\",\"img_kategori\":\"kategori\\/Pm9WmcjnKUOozplFPudTt17AXuwVv5CXQhqUFSOr\",\"created_at\":\"2021-05-04T02:56:48.000000Z\",\"updated_at\":\"2021-05-04T03:31:18.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','{\"id_kategori\":\"3\",\"nm_kategori\":\"Pelatihan\",\"desc_kategori\":\"Jasa berupa pengadaan pelatihan yang diajarkan oleh para ahli terseritikasi.\"}','2021-05-04 11:11:56','2021-05-04 11:11:56'),
	(234,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Kategori. id=3.','{\"id_kategori\":3,\"nm_kategori\":\"Pelatihan\",\"desc_kategori\":\"Jasa berupa pengadaan pelatihan yang diajarkan oleh para ahli terseritikasi.\",\"img_kategori\":\"public\\/kategori\\/DJ6JKU5Gh4DcKIWUbsKIUMtCndpxExyeF5x6hxio.png\",\"created_at\":\"2021-05-04T02:56:48.000000Z\",\"updated_at\":\"2021-05-04T04:11:56.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','{\"id_kategori\":\"3\",\"nm_kategori\":\"Pelatihan\",\"desc_kategori\":\"Jasa berupa pengadaan pelatihan yang diajarkan oleh para ahli terseritikasi.\"}','2021-05-04 11:12:14','2021-05-04 11:12:14'),
	(235,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Kategori. id=3.','{\"id_kategori\":3,\"nm_kategori\":\"Pelatihan\",\"desc_kategori\":\"Jasa berupa pengadaan pelatihan yang diajarkan oleh para ahli terseritikasi.\",\"img_kategori\":\"public\\/kategori\\/NRLIsr5qHeb9SI0uz8xUnLGiQuFd2TEW8R2htdjn.png\",\"created_at\":\"2021-05-04T02:56:48.000000Z\",\"updated_at\":\"2021-05-04T04:12:14.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','{\"id_kategori\":\"3\",\"nm_kategori\":\"Pelatihan\",\"desc_kategori\":\"Jasa berupa pengadaan pelatihan yang diajarkan oleh para ahli terseritikasi.\"}','2021-05-04 11:13:39','2021-05-04 11:13:39'),
	(236,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data Item. id=3.','{\"id_kategori\":\"1\",\"nm_item\":\"Laboratorium Komputer A1\",\"desc_item\":\"Kapasitas 20 Orang\",\"max_stok\":\"2\",\"created_by\":1,\"updated_at\":\"2021-05-04T05:19:34.000000Z\",\"created_at\":\"2021-05-04T05:19:34.000000Z\",\"id_item\":3}','null','2021-05-04 12:19:34','2021-05-04 12:19:34'),
	(237,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Item. id=3.','{\"id_item\":3,\"id_kategori\":1,\"nm_item\":\"Laboratorium Komputer A1\",\"desc_item\":\"Kapasitas 20 Orang\",\"max_stok\":\"2\",\"created_at\":\"2021-05-04T05:19:34.000000Z\",\"updated_at\":\"2021-05-04T05:19:34.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','{\"id_item\":\"3\",\"nm_item\":\"Laboratorium Komputer A1\",\"id_kategori\":\"1\",\"desc_item\":\"Kapasitas 20 Orang\",\"max_stok\":\"2\"}','2021-05-04 13:51:25','2021-05-04 13:51:25'),
	(238,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Item. id=3.','{\"id_item\":3,\"id_kategori\":1,\"nm_item\":\"Laboratorium Komputer A1\",\"desc_item\":\"Kapasitas 20 Orang\",\"max_stok\":\"2\",\"created_at\":\"2021-05-04T05:19:34.000000Z\",\"updated_at\":\"2021-05-04T06:51:25.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','{\"id_item\":\"3\",\"nm_item\":\"Laboratorium Komputer A1\",\"id_kategori\":\"1\",\"desc_item\":\"Kapasitas 20 Orang\",\"max_stok\":\"2\"}','2021-05-04 13:52:13','2021-05-04 13:52:13'),
	(239,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data Kategori. id=4.','{\"nm_kategori\":\"Olahraga\",\"desc_kategori\":\"Deksripsi Kategori\",\"img_kategori\":\"kategori\\/UFvw2lMGBk4crbfnHKMuVmJdpWIwQCWWD3oynSJb.png\",\"created_by\":1,\"updated_at\":\"2021-05-04T07:09:21.000000Z\",\"created_at\":\"2021-05-04T07:09:21.000000Z\",\"id_kategori\":4}','null','2021-05-04 14:09:21','2021-05-04 14:09:21'),
	(240,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Modul. id=9.','{\"id_modul\":9,\"id_modul_group\":6,\"route_prefix\":\"p-kategori\",\"nm_modul\":\"Kategori Layanan\",\"icon_modul\":\"\",\"urutan\":1,\"is_tampil\":1,\"created_at\":\"2021-05-04T01:32:31.000000Z\",\"updated_at\":\"2021-05-04T01:32:31.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','{\"id_modul_group\":\"6\",\"id_modul\":\"9\",\"nm_modul\":\"Kategori\",\"urutan\":\"1\",\"route_prefix\":\"p-kategori\",\"is_tampil\":\"1\"}','2021-05-04 14:09:51','2021-05-04 14:09:51'),
	(241,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Modul. id=10.','{\"id_modul\":10,\"id_modul_group\":6,\"route_prefix\":\"p-item\",\"nm_modul\":\"Data Layanan\",\"icon_modul\":\"\",\"urutan\":2,\"is_tampil\":1,\"created_at\":\"2021-05-04T01:34:06.000000Z\",\"updated_at\":\"2021-05-04T01:34:06.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','{\"id_modul_group\":\"6\",\"id_modul\":\"10\",\"nm_modul\":\"Produk\\/Item\",\"urutan\":\"2\",\"route_prefix\":\"p-item\",\"is_tampil\":\"1\"}','2021-05-04 14:10:03','2021-05-04 14:10:03'),
	(242,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Modul. id=10.','{\"id_modul\":10,\"id_modul_group\":6,\"route_prefix\":\"p-item\",\"nm_modul\":\"Produk\\/Item\",\"icon_modul\":\"\",\"urutan\":2,\"is_tampil\":1,\"created_at\":\"2021-05-04T01:34:06.000000Z\",\"updated_at\":\"2021-05-04T07:10:03.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','{\"id_modul_group\":\"6\",\"id_modul\":\"10\",\"nm_modul\":\"Layanan\",\"urutan\":\"2\",\"route_prefix\":\"p-item\",\"is_tampil\":\"1\"}','2021-05-04 14:10:19','2021-05-04 14:10:19'),
	(243,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data Item. id=4.','{\"id_kategori\":\"1\",\"nm_item\":\"Laboratorium Komputer\",\"desc_item\":\"Kapasitas maksimum 30 orang\",\"max_stok\":\"10\",\"created_by\":1,\"updated_at\":\"2021-05-04T07:11:34.000000Z\",\"created_at\":\"2021-05-04T07:11:34.000000Z\",\"id_item\":4}','null','2021-05-04 14:11:34','2021-05-04 14:11:34'),
	(244,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Item. id=3.','{\"id_item\":3,\"id_kategori\":1,\"nm_item\":\"Laboratorium Komputer A1\",\"desc_item\":\"Kapasitas 20 Orang\",\"max_stok\":\"2\",\"created_at\":\"2021-05-04T05:19:34.000000Z\",\"updated_at\":\"2021-05-04T06:51:25.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','{\"id_item\":\"3\",\"nm_item\":\"Laboratorium Komputer A1\",\"id_kategori\":\"3\",\"desc_item\":\"Kapasitas 20 Orang\",\"max_stok\":\"2\"}','2021-05-04 15:30:48','2021-05-04 15:30:48'),
	(245,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Item. id=3.','{\"id_item\":3,\"id_kategori\":3,\"nm_item\":\"Laboratorium Komputer A1\",\"desc_item\":\"Kapasitas 20 Orang\",\"max_stok\":\"2\",\"created_at\":\"2021-05-04T05:19:34.000000Z\",\"updated_at\":\"2021-05-04T08:30:48.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','{\"id_item\":\"3\",\"nm_item\":\"Laboratorium Komputer A1\",\"id_kategori\":\"3\",\"desc_item\":\"Kapasitas 20 Orang\",\"max_stok\":\"2\"}','2021-05-04 16:23:07','2021-05-04 16:23:07'),
	(246,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data Role User. id=75.','{\"id_user\":\"1\",\"id_user_role\":null,\"id_role\":\"1\"}','null','2021-05-10 11:49:08','2021-05-10 11:49:08'),
	(247,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menghapus data Role User. id=75.','{\"id_user_role\":75,\"id_user\":1,\"id_role\":1,\"unit\":null,\"created_at\":\"2021-05-10 11:49:08\",\"updated_at\":\"2021-05-10 11:49:08\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','null','2021-05-10 11:49:14','2021-05-10 11:49:14'),
	(248,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Item. id=3.','{\"id_item\":3,\"id_kategori\":3,\"nm_item\":\"Laboratorium Komputer A1\",\"desc_item\":\"Kapasitas 20 Orang\",\"max_stok\":\"2\",\"harga\":0,\"desc_harga\":null,\"created_at\":\"2021-05-04T05:19:34.000000Z\",\"updated_at\":\"2021-05-04T08:30:48.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','{\"id_item\":\"3\",\"nm_item\":\"Laboratorium Komputer A1\",\"id_kategori\":\"3\",\"desc_item\":\"Kapasitas 20 Orang\",\"harga\":\"1,000,000\",\"max_stok\":\"2\"}','2021-05-17 11:22:16','2021-05-17 11:22:16'),
	(249,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data Modul Grup. id=7.','{\"id_menu_group\":\"4\",\"id_modul_group\":null,\"nm_modul_group\":\"Promo\",\"urutan\":\"2\",\"icon_modul_group\":\"bi bi-percent\"}','null','2021-05-17 11:53:24','2021-05-17 11:53:24'),
	(250,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data Modul. id=11.','{\"id_modul_group\":\"7\",\"id_modul\":null,\"nm_modul\":\"Promo\",\"urutan\":\"1\",\"route_prefix\":\"p-promo\",\"is_tampil\":\"1\"}','null','2021-05-17 11:53:42','2021-05-17 11:53:42'),
	(251,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data promo. id=1.','{\"nm_promo\":\"Lab. Bahasa Terpadu\",\"desc_promo\":\"Lab bahasa terpadu dengan kualitas tertinggi\",\"img_promo\":\"promo\\/bs19rfEECZHtF0tW91HoAO5xwW8zOy78DbiZmbdI.jpg\",\"created_by\":1,\"updated_at\":\"2021-05-17T04:57:31.000000Z\",\"created_at\":\"2021-05-17T04:57:31.000000Z\",\"id_promo\":1}','null','2021-05-17 11:57:31','2021-05-17 11:57:31'),
	(252,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data promo. id=2.','{\"nm_promo\":\"Lab Layanan Akademik\",\"desc_promo\":\"Lab layanan Akademik terpadu untuk indonesia\",\"img_promo\":\"promo\\/bhcFP6oMRjLC5NPU36mqCbWPivFq5RXWJu7loAqs.jpg\",\"created_by\":1,\"updated_at\":\"2021-05-17T04:58:03.000000Z\",\"created_at\":\"2021-05-17T04:58:03.000000Z\",\"id_promo\":2}','null','2021-05-17 11:58:03','2021-05-17 11:58:03'),
	(253,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data promo. id=3.','{\"nm_promo\":\"Lab. Bahasa Terpadu Oke\",\"desc_promo\":\"Contoh deskripsi\",\"img_promo\":\"promo\\/F3j50wgiUfasnl37aAwGgSdh0VTqJlZeEoO2qJrX.jpg\",\"created_by\":1,\"updated_at\":\"2021-05-17T05:02:25.000000Z\",\"created_at\":\"2021-05-17T05:02:25.000000Z\",\"id_promo\":3}','null','2021-05-17 12:02:25','2021-05-17 12:02:25'),
	(254,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menghapus data Kategori. id=2.','{\"id_item\":2,\"id_kategori\":1,\"nm_item\":\"Laboratorium Komputer A1\",\"desc_item\":\"Kapasitas 20 Orang\",\"max_stok\":\"2\",\"harga\":0,\"desc_harga\":null,\"created_at\":\"2021-05-04 12:18:59\",\"updated_at\":\"2021-05-04 12:18:59\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','null','2021-05-18 09:57:56','2021-05-18 09:57:56'),
	(255,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.1 Safari/605.1.15','Mengubah data app_setting. id=1.','{\"id_sys_setting\":1,\"key\":\"sys_name\",\"content\":\"E-Promosi\",\"created_at\":\"2021-03-19T07:07:17.000000Z\",\"updated_at\":\"2021-04-20T05:42:07.000000Z\",\"deleted_at\":null,\"created_by\":null,\"updated_by\":1,\"deleted_by\":null}','{\"id_sys_setting\":1,\"key\":\"sys_name\",\"content\":\"Project Kaizen\",\"created_at\":\"2021-03-19 14:07:17\",\"updated_at\":\"2021-04-20 12:42:07\",\"deleted_at\":null,\"created_by\":null,\"updated_by\":1,\"deleted_by\":null}','2021-08-29 16:57:01','2021-08-29 16:57:01'),
	(256,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.1 Safari/605.1.15','Mengubah data app_setting. id=2.','{\"id_sys_setting\":2,\"key\":\"sys_desc\",\"content\":\"Promosi Jasa Universitas Negeri Semarang\",\"created_at\":\"2021-03-19T07:07:17.000000Z\",\"updated_at\":\"2021-03-19T07:07:17.000000Z\",\"deleted_at\":null,\"created_by\":null,\"updated_by\":null,\"deleted_by\":null}','{\"id_sys_setting\":2,\"key\":\"sys_desc\",\"content\":\"Project Simplifikasi Proses Bisnis\",\"created_at\":\"2021-03-19 14:07:17\",\"updated_at\":\"2021-03-19 14:07:17\",\"deleted_at\":null,\"created_by\":null,\"updated_by\":1,\"deleted_by\":null}','2021-08-29 16:57:02','2021-08-29 16:57:02'),
	(257,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.1 Safari/605.1.15','Mengubah data app_setting. id=3.','{\"id_sys_setting\":3,\"key\":\"sys_author_name\",\"content\":\"UPT TIK\",\"created_at\":\"2021-03-19T07:07:17.000000Z\",\"updated_at\":\"2021-04-26T00:16:55.000000Z\",\"deleted_at\":null,\"created_by\":null,\"updated_by\":1,\"deleted_by\":null}','{\"id_sys_setting\":3,\"key\":\"sys_author_name\",\"content\":\"CapitalTech\",\"created_at\":\"2021-03-19 14:07:17\",\"updated_at\":\"2021-04-26 07:16:55\",\"deleted_at\":null,\"created_by\":null,\"updated_by\":1,\"deleted_by\":null}','2021-08-29 16:57:02','2021-08-29 16:57:02'),
	(258,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.1 Safari/605.1.15','Mengubah data app_setting. id=4.','{\"id_sys_setting\":4,\"key\":\"sys_author_link\",\"content\":\"https:\\/\\/ict.unnes.ac.id\",\"created_at\":\"2021-03-19T07:07:17.000000Z\",\"updated_at\":\"2021-03-19T07:07:17.000000Z\",\"deleted_at\":null,\"created_by\":null,\"updated_by\":null,\"deleted_by\":null}','{\"id_sys_setting\":4,\"key\":\"sys_author_link\",\"content\":\"https:\\/\\/capitaltech.id\",\"created_at\":\"2021-03-19 14:07:17\",\"updated_at\":\"2021-03-19 14:07:17\",\"deleted_at\":null,\"created_by\":null,\"updated_by\":1,\"deleted_by\":null}','2021-08-29 16:57:02','2021-08-29 16:57:02'),
	(259,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.1 Safari/605.1.15','Mengubah data app_setting. id=2.','{\"id_app_setting\":2,\"key\":\"app_company_name\",\"content\":\"PT. Bobb\",\"created_at\":\"2021-03-19T07:07:17.000000Z\",\"updated_at\":\"2021-03-19T07:07:17.000000Z\",\"deleted_at\":null,\"created_by\":null,\"updated_by\":null,\"deleted_by\":null}','{\"id_app_setting\":2,\"key\":\"app_company_name\",\"content\":\"Capital Technology\",\"created_at\":\"2021-03-19 14:07:17\",\"updated_at\":\"2021-03-19 14:07:17\",\"deleted_at\":null,\"created_by\":null,\"updated_by\":1,\"deleted_by\":null}','2021-08-29 16:57:39','2021-08-29 16:57:39'),
	(260,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.1 Safari/605.1.15','Mengubah data app_setting. id=3.','{\"id_app_setting\":3,\"key\":\"app_company_desc\",\"content\":\"Company for Bobb\",\"created_at\":\"2021-03-19T07:07:17.000000Z\",\"updated_at\":\"2021-03-19T07:07:17.000000Z\",\"deleted_at\":null,\"created_by\":null,\"updated_by\":null,\"deleted_by\":null}','{\"id_app_setting\":3,\"key\":\"app_company_desc\",\"content\":\"Every Tech Thing(s) You Need\",\"created_at\":\"2021-03-19 14:07:17\",\"updated_at\":\"2021-03-19 14:07:17\",\"deleted_at\":null,\"created_by\":null,\"updated_by\":1,\"deleted_by\":null}','2021-08-29 16:57:39','2021-08-29 16:57:39'),
	(261,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.1 Safari/605.1.15','Mengubah data app_setting. id=7.','{\"id_app_setting\":7,\"key\":\"app_company_site\",\"content\":\"https:\\/\\/hendi.web.id\",\"created_at\":\"2021-03-19T07:07:17.000000Z\",\"updated_at\":\"2021-03-19T07:07:17.000000Z\",\"deleted_at\":null,\"created_by\":null,\"updated_by\":null,\"deleted_by\":null}','{\"id_app_setting\":7,\"key\":\"app_company_site\",\"content\":\"https:\\/\\/capitaltech.id\",\"created_at\":\"2021-03-19 14:07:17\",\"updated_at\":\"2021-03-19 14:07:17\",\"deleted_at\":null,\"created_by\":null,\"updated_by\":1,\"deleted_by\":null}','2021-08-29 16:57:39','2021-08-29 16:57:39'),
	(262,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.1 Safari/605.1.15','Menghapus data Grup Menu. id=4.','{\"id_menu_group\":4,\"nm_menu_group\":\"E-Promosi\",\"urutan\":1,\"created_at\":\"2021-05-04 08:31:08\",\"updated_at\":\"2021-05-04 08:31:08\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','null','2021-08-29 16:57:48','2021-08-29 16:57:48'),
	(263,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.1 Safari/605.1.15','Menambah data Grup Menu. id=5.','{\"id_menu_group\":null,\"nm_menu_group\":\"Kaizen\",\"urutan\":\"1\"}','null','2021-08-29 18:38:49','2021-08-29 18:38:49'),
	(264,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.1 Safari/605.1.15','Menambah data Modul Grup. id=8.','{\"id_menu_group\":\"5\",\"id_modul_group\":null,\"nm_modul_group\":\"Employee\",\"urutan\":\"1\",\"icon_modul_group\":\"bi bi-person-badge\"}','null','2021-08-29 18:41:30','2021-08-29 18:41:30'),
	(265,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.1 Safari/605.1.15','Menambah data Modul. id=12.','{\"id_modul_group\":\"8\",\"id_modul\":null,\"nm_modul\":\"Employee\",\"urutan\":\"1\",\"route_prefix\":\"employee\",\"is_tampil\":\"1\"}','null','2021-08-29 18:44:04','2021-08-29 18:44:04'),
	(266,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.1 Safari/605.1.15','Menambah data Employee. id=1.','{\"employee_id\":null,\"nip\":\"5030656\",\"full_name\":\"DOJA CAT\",\"gender\":\"Female\",\"position_code\":\"S3 - M\",\"position_desc\":\"ADVISER CREDIT\",\"date_of_birth\":\"1994-06-14\",\"status\":\"Active employee\"}','null','2021-08-30 09:52:09','2021-08-30 09:52:09'),
	(267,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.1 Safari/605.1.15','Menambah data Employee. id=2.','{\"employee_id\":null,\"nip\":\"5031821\",\"full_name\":\"ARIANA GRANDE\",\"gender\":\"Female\",\"position_code\":\"S4 - DM\",\"position_desc\":\"SO FINANCE\",\"date_of_birth\":\"1990-06-12\",\"status\":\"Active employee\"}','null','2021-08-30 09:54:32','2021-08-30 09:54:32'),
	(268,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.1 Safari/605.1.15','Mengubah data Grup Modul. id=8.','{\"id_modul_group\":8,\"id_menu_group\":5,\"route_prefix\":null,\"nm_modul_group\":\"Employee\",\"icon_modul_group\":\"bi bi-person-badge\",\"urutan\":1,\"created_at\":\"2021-08-29T11:41:30.000000Z\",\"updated_at\":\"2021-08-29T11:41:30.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','{\"id_menu_group\":\"5\",\"id_modul_group\":\"8\",\"nm_modul_group\":\"Employee\",\"urutan\":\"2\",\"icon_modul_group\":\"bi bi-person-badge\"}','2021-08-30 10:48:39','2021-08-30 10:48:39'),
	(269,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.1 Safari/605.1.15','Menambah data Modul Grup. id=9.','{\"id_menu_group\":\"5\",\"id_modul_group\":null,\"nm_modul_group\":\"Certification Class\",\"urutan\":\"1\",\"icon_modul_group\":\"bi bi-card-checklist\"}','null','2021-08-30 10:50:47','2021-08-30 10:50:47'),
	(270,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.1 Safari/605.1.15','Menambah data Modul. id=13.','{\"id_modul_group\":\"9\",\"id_modul\":null,\"nm_modul\":\"Certification Class\",\"urutan\":\"1\",\"route_prefix\":\"certification_class\",\"is_tampil\":\"1\"}','null','2021-08-30 10:51:10','2021-08-30 10:51:10'),
	(271,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.1 Safari/605.1.15','Menambah data Certification Class. id=1.','{\"class_id\":null,\"key\":\"LEVEL 1\",\"desc\":\"Initiate Level 1\",\"n_repeat\":\"1\",\"order\":\"1\"}','null','2021-08-30 10:52:46','2021-08-30 10:52:46'),
	(272,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.1 Safari/605.1.15','Menambah data Certification Class. id=2.','{\"class_id\":null,\"key\":\"RE LEVEL 1\",\"desc\":\"Repeat Level 1\",\"n_repeat\":\"1\",\"order\":\"2\"}','null','2021-08-30 10:53:08','2021-08-30 10:53:08'),
	(273,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.1 Safari/605.1.15','Menambah data Certification Class. id=3.','{\"class_id\":null,\"key\":\"LEVEL 2\",\"desc\":\"Initiate Level 2\",\"n_repeat\":\"4\",\"order\":\"3\"}','null','2021-08-30 10:53:37','2021-08-30 10:53:37'),
	(274,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.1 Safari/605.1.15','Mengubah data Certification Class. id=1.','{\"class_id\":1,\"key\":\"LEVEL 1\",\"desc\":\"Initiate Level 1\",\"n_repeat\":1,\"order\":1,\"created_at\":\"2021-08-30T03:52:46.000000Z\",\"updated_at\":\"2021-08-30T03:52:46.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','{\"class_id\":\"1\",\"key\":\"LEVEL 1\",\"desc\":\"Initiate Level 1\",\"n_repeat\":\"4\",\"order\":\"1\"}','2021-08-30 10:54:14','2021-08-30 10:54:14'),
	(275,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.1 Safari/605.1.15','Mengubah data Certification Class. id=2.','{\"class_id\":2,\"key\":\"RE LEVEL 1\",\"desc\":\"Repeat Level 1\",\"n_repeat\":1,\"order\":2,\"created_at\":\"2021-08-30T03:53:08.000000Z\",\"updated_at\":\"2021-08-30T03:53:08.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','{\"class_id\":\"2\",\"key\":\"RE LEVEL 1\",\"desc\":\"Repeat Level 1\",\"n_repeat\":\"4\",\"order\":\"2\"}','2021-08-30 10:54:18','2021-08-30 10:54:18'),
	(276,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.1 Safari/605.1.15','Menambah data Certification Class. id=4.','{\"class_id\":null,\"key\":\"RE LEVEL 2\",\"desc\":\"Repeat Level 2\",\"n_repeat\":\"4\",\"order\":\"4\"}','null','2021-08-30 10:54:38','2021-08-30 10:54:38'),
	(277,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.1 Safari/605.1.15','Menambah data Certification Class. id=5.','{\"class_id\":null,\"key\":\"LEVEL 3\",\"desc\":\"Initiate Level 3\",\"n_repeat\":\"2\",\"order\":\"5\"}','null','2021-08-30 10:54:51','2021-08-30 10:54:51'),
	(278,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.1 Safari/605.1.15','Menambah data Certification Class. id=6.','{\"class_id\":null,\"key\":\"RE LEVEL 3\",\"desc\":\"Repeat Level 3\",\"n_repeat\":\"2\",\"order\":\"6\"}','null','2021-08-30 10:55:04','2021-08-30 10:55:04'),
	(279,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.1 Safari/605.1.15','Menambah data Certification Class. id=7.','{\"class_id\":null,\"key\":\"LEVEL 4\",\"desc\":\"Initiate Level 4\",\"n_repeat\":\"2\",\"order\":\"7\"}','null','2021-08-30 10:55:19','2021-08-30 10:55:19'),
	(280,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.1 Safari/605.1.15','Menambah data Certification Class. id=8.','{\"class_id\":null,\"key\":\"RE LEVEL 4\",\"desc\":\"Initiate Level 4\",\"n_repeat\":\"2\",\"order\":\"8\"}','null','2021-08-30 10:55:32','2021-08-30 10:55:32'),
	(281,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.1 Safari/605.1.15','Menambah data Certification Class. id=9.','{\"class_id\":null,\"key\":\"LEVEL 5\",\"desc\":\"Initiate Level 5\",\"n_repeat\":\"2\",\"order\":\"9\"}','null','2021-08-30 10:55:46','2021-08-30 10:55:46'),
	(282,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.1 Safari/605.1.15','Menambah data Certification Class. id=10.','{\"class_id\":null,\"key\":\"RE LEVEL 5\",\"desc\":\"Repeat Level 5\",\"n_repeat\":\"2\",\"order\":\"10\"}','null','2021-08-30 10:56:05','2021-08-30 10:56:05'),
	(283,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.1 Safari/605.1.15','Mengubah data Employee. id=1.','{\"employee_id\":1,\"nip\":\"5030656\",\"full_name\":\"COKOKOKOK\",\"gender\":\"Female\",\"position_code\":\"S3 - M\",\"position_desc\":\"ADVISER CREDIT\",\"date_of_birth\":\"1976-08-01\",\"status\":\"Active employee\",\"created_at\":\"2021-08-30T02:52:09.000000Z\",\"updated_at\":\"2021-08-30T06:51:38.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','{\"employee_id\":\"1\",\"nip\":\"5030656\",\"full_name\":\"DOJA CAT\",\"gender\":\"Female\",\"position_code\":\"S3 - M\",\"position_desc\":\"ADVISER CREDIT\",\"date_of_birth\":\"1976-08-01\",\"status\":\"Active employee\"}','2021-08-30 13:51:58','2021-08-30 13:51:58'),
	(284,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.1 Safari/605.1.15','Mengubah data Employee. id=19.','{\"employee_id\":19,\"nip\":\"5030657\",\"full_name\":\"COKOKOKOK\",\"gender\":\"Female\",\"position_code\":\"S3 - M\",\"position_desc\":\"ADVISER CREDIT\",\"date_of_birth\":\"1976-08-02\",\"status\":\"Active employee\",\"created_at\":\"2021-08-30T06:50:49.000000Z\",\"updated_at\":\"2021-08-30T06:51:38.000000Z\",\"deleted_at\":null,\"created_by\":null,\"updated_by\":null,\"deleted_by\":null}','{\"employee_id\":\"19\",\"nip\":\"5030657\",\"full_name\":\"DOJA DOG\",\"gender\":\"Female\",\"position_code\":\"S3 - M\",\"position_desc\":\"ADVISER CREDIT\",\"date_of_birth\":\"1976-08-02\",\"status\":\"Active employee\"}','2021-08-30 13:52:09','2021-08-30 13:52:09'),
	(285,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.1 Safari/605.1.15','Menghapus data Employee. id=19.','{\"employee_id\":19,\"nip\":\"5030657\",\"full_name\":\"DOGJA DOG\",\"gender\":\"Female\",\"position_code\":\"S3 - M\",\"position_desc\":\"ADVISER CREDIT\",\"date_of_birth\":\"1976-08-02\",\"status\":\"Active employee\",\"created_at\":\"2021-08-30 13:50:49\",\"updated_at\":\"2021-08-30 13:53:24\",\"deleted_at\":null,\"created_by\":null,\"updated_by\":1,\"deleted_by\":null}','null','2021-08-30 13:53:35','2021-08-30 13:53:35'),
	(286,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.1 Safari/605.1.15','Mengubah data app_setting. id=1.','{\"id_app_setting\":1,\"key\":\"app_logo\",\"content\":\"images\\/logo\\/logo_2.png\",\"created_at\":\"2021-03-19T07:07:17.000000Z\",\"updated_at\":\"2021-04-19T06:48:10.000000Z\",\"deleted_at\":null,\"created_by\":null,\"updated_by\":null,\"deleted_by\":null}','{\"id_app_setting\":1,\"key\":\"app_logo\",\"content\":\"images\\/logo\\/LogoCapitalTech.png\",\"created_at\":\"2021-03-19 14:07:17\",\"updated_at\":\"2021-04-19 13:48:10\",\"deleted_at\":null,\"created_by\":null,\"updated_by\":1,\"deleted_by\":null}','2021-08-30 13:56:33','2021-08-30 13:56:33'),
	(287,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.1 Safari/605.1.15','Menghapus data User. id=5.','{\"id_user\":5,\"username_user\":\"bambang007\",\"email_user\":\"bambang@gmail.com\",\"nm_user\":\"Bambang\",\"password_user\":\"$2y$10$up9wmb6fTAdYBWNEyB0u6OM.lYh7XLH1X6hqy4CwnZVKYgVgPlmD.\",\"identitas_user\":\"192187364732\",\"is_aktif\":1,\"created_at\":\"2021-04-21 08:57:41\",\"updated_at\":\"2021-04-21 09:34:01\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','null','2021-08-30 14:01:07','2021-08-30 14:01:07'),
	(288,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.1 Safari/605.1.15','Menambah data Modul Grup. id=10.','{\"id_menu_group\":\"5\",\"id_modul_group\":null,\"nm_modul_group\":\"Certification History\",\"urutan\":\"3\",\"icon_modul_group\":\"bi bi-bar-chart-fill\"}','null','2021-08-30 14:23:09','2021-08-30 14:23:09'),
	(289,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.1 Safari/605.1.15','Menambah data Modul. id=14.','{\"id_modul_group\":\"10\",\"id_modul\":null,\"nm_modul\":\"Certification History\",\"urutan\":\"1\",\"route_prefix\":\"certification_history\",\"is_tampil\":\"1\"}','null','2021-08-30 14:23:23','2021-08-30 14:23:23'),
	(290,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.1 Safari/605.1.15','Mengubah data Grup Modul. id=10.','{\"id_modul_group\":10,\"id_menu_group\":5,\"route_prefix\":null,\"nm_modul_group\":\"Certification History\",\"icon_modul_group\":\"bi bi-bar-chart-fill\",\"urutan\":3,\"created_at\":\"2021-08-30T07:23:09.000000Z\",\"updated_at\":\"2021-08-30T07:23:09.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','{\"id_menu_group\":\"5\",\"id_modul_group\":\"10\",\"nm_modul_group\":\"Certification History\",\"urutan\":\"3\",\"icon_modul_group\":\"bi bi-bar-chart-steps\"}','2021-08-30 14:24:48','2021-08-30 14:24:48'),
	(291,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36','Menambah data Certification Class. id=11.','{\"class_id\":null,\"key\":\"LEVEL 6\",\"desc\":\"Initiate Level 6\",\"n_repeat\":\"3\",\"order\":\"11\"}','null','2021-08-30 21:03:18','2021-08-30 21:03:18'),
	(292,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36','Menghapus data Certification Class. id=11.','{\"class_id\":11,\"key\":\"LEVEL 6\",\"desc\":\"Initiate Level 6\",\"n_repeat\":3,\"order\":11,\"created_at\":\"2021-08-30 21:03:18\",\"updated_at\":\"2021-08-30 21:03:18\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','null','2021-08-30 21:03:26','2021-08-30 21:03:26'),
	(293,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36','Menambah data Employee. id=1.','{\"employee_id\":null,\"nip\":\"1234567213\",\"full_name\":\"John Doe\",\"gender\":\"Male\",\"position_code\":\"S6 - PRO\",\"position_desc\":\"Samsung S6 PRO\",\"date_of_birth\":\"2000-02-22\",\"status\":\"Active employee\"}','null','2021-08-30 21:05:04','2021-08-30 21:05:04'),
	(294,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36','Mengubah data Employee. id=1.','{\"employee_id\":1,\"nip\":\"1234567213\",\"full_name\":\"John Doe\",\"gender\":\"Male\",\"position_code\":\"S6 - PRO\",\"position_desc\":\"Samsung S6 PRO\",\"date_of_birth\":\"2000-02-22\",\"status\":\"Active employee\",\"created_at\":\"2021-08-30T14:05:04.000000Z\",\"updated_at\":\"2021-08-30T14:05:04.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','{\"employee_id\":\"1\",\"nip\":\"1234567213\",\"full_name\":\"John Doe\",\"gender\":\"Male\",\"position_code\":\"S6 - PRO\",\"position_desc\":\"Samsung S6 PRO\",\"date_of_birth\":\"2000-02-22\",\"status\":\"Active employee\"}','2021-08-30 21:05:13','2021-08-30 21:05:13'),
	(295,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36','Menghapus data Employee. id=1.','{\"employee_id\":1,\"nip\":\"1234567213\",\"full_name\":\"John Doe\",\"gender\":\"Male\",\"position_code\":\"S6 - PRO\",\"position_desc\":\"Samsung S6 PRO\",\"date_of_birth\":\"2000-02-22\",\"status\":\"Active employee\",\"created_at\":\"2021-08-30 21:05:04\",\"updated_at\":\"2021-08-30 21:05:13\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','null','2021-08-30 21:05:18','2021-08-30 21:05:18'),
	(296,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36','Menambah data Modul Grup. id=11.','{\"id_menu_group\":\"5\",\"id_modul_group\":null,\"nm_modul_group\":\"Refreshment\",\"urutan\":\"4\",\"icon_modul_group\":\"bi bi-file-earmark-medical\"}','null','2021-08-30 21:16:31','2021-08-30 21:16:31'),
	(297,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36','Menambah data Modul. id=15.','{\"id_modul_group\":\"11\",\"id_modul\":null,\"nm_modul\":\"Refreshment\",\"urutan\":\"1\",\"route_prefix\":\"refreshment\",\"is_tampil\":\"1\"}','null','2021-08-30 21:16:46','2021-08-30 21:16:46'),
	(298,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36','Mengubah data Grup Menu. id=5.','{\"id_menu_group\":5,\"nm_menu_group\":\"Kaizen\",\"urutan\":1,\"created_at\":\"2021-08-29T11:38:49.000000Z\",\"updated_at\":\"2021-08-29T11:38:49.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','{\"id_menu_group\":\"5\",\"nm_menu_group\":\"Certification\",\"urutan\":\"1\"}','2021-08-31 00:45:30','2021-08-31 00:45:30'),
	(299,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36','Mengubah data Grup Modul. id=10.','{\"id_modul_group\":10,\"id_menu_group\":5,\"route_prefix\":null,\"nm_modul_group\":\"Certification History\",\"icon_modul_group\":\"bi bi-bar-chart-steps\",\"urutan\":3,\"created_at\":\"2021-08-30T07:23:09.000000Z\",\"updated_at\":\"2021-08-30T07:24:48.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','{\"id_menu_group\":\"5\",\"id_modul_group\":\"10\",\"nm_modul_group\":\"Certification Database\",\"urutan\":\"3\",\"icon_modul_group\":\"bi bi-bar-chart-steps\"}','2021-08-31 00:48:07','2021-08-31 00:48:07'),
	(300,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36','Mengubah data Grup Modul. id=10.','{\"id_modul_group\":10,\"id_menu_group\":5,\"route_prefix\":null,\"nm_modul_group\":\"Certification Database\",\"icon_modul_group\":\"bi bi-bar-chart-steps\",\"urutan\":3,\"created_at\":\"2021-08-30T07:23:09.000000Z\",\"updated_at\":\"2021-08-30T17:48:07.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','{\"id_menu_group\":\"5\",\"id_modul_group\":\"10\",\"nm_modul_group\":\"Data Certification\",\"urutan\":\"3\",\"icon_modul_group\":\"bi bi-bar-database\"}','2021-08-31 00:48:23','2021-08-31 00:48:23'),
	(301,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36','Mengubah data Grup Modul. id=10.','{\"id_modul_group\":10,\"id_menu_group\":5,\"route_prefix\":null,\"nm_modul_group\":\"Data Certification\",\"icon_modul_group\":\"bi bi-bar-database\",\"urutan\":3,\"created_at\":\"2021-08-30T07:23:09.000000Z\",\"updated_at\":\"2021-08-30T17:48:23.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','{\"id_menu_group\":\"5\",\"id_modul_group\":\"10\",\"nm_modul_group\":\"Data Certification\",\"urutan\":\"3\",\"icon_modul_group\":\"bi bi-server\"}','2021-08-31 00:49:06','2021-08-31 00:49:06'),
	(302,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36','Mengubah data Modul. id=14.','{\"id_modul\":14,\"id_modul_group\":10,\"route_prefix\":\"certification_history\",\"nm_modul\":\"Certification History\",\"icon_modul\":\"\",\"urutan\":1,\"is_tampil\":1,\"created_at\":\"2021-08-30T07:23:23.000000Z\",\"updated_at\":\"2021-08-30T07:23:23.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','{\"id_modul_group\":\"10\",\"id_modul\":\"14\",\"nm_modul\":\"Data Certification\",\"urutan\":\"1\",\"route_prefix\":\"certification_history\",\"is_tampil\":\"1\"}','2021-08-31 00:49:39','2021-08-31 00:49:39'),
	(303,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36','Mengubah data Grup Modul. id=11.','{\"id_modul_group\":11,\"id_menu_group\":5,\"route_prefix\":null,\"nm_modul_group\":\"Refreshment\",\"icon_modul_group\":\"bi bi-file-earmark-medical\",\"urutan\":4,\"created_at\":\"2021-08-30T14:16:31.000000Z\",\"updated_at\":\"2021-08-30T14:16:31.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','{\"id_menu_group\":\"5\",\"id_modul_group\":\"11\",\"nm_modul_group\":\"Refreshment\",\"urutan\":\"5\",\"icon_modul_group\":\"bi bi-file-earmark-medical\"}','2021-08-31 00:49:54','2021-08-31 00:49:54'),
	(304,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36','Menambah data Modul Grup. id=12.','{\"id_menu_group\":\"5\",\"id_modul_group\":null,\"nm_modul_group\":\"Certification\",\"urutan\":\"4\",\"icon_modul_group\":\"bi bi-file-code\"}','null','2021-08-31 00:50:51','2021-08-31 00:50:51'),
	(305,1,'Hendi','::1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/92.0.4515.107 Safari/537.36','Menambah data Modul. id=16.','{\"id_modul_group\":\"12\",\"id_modul\":null,\"nm_modul\":\"Certification\",\"urutan\":\"1\",\"route_prefix\":\"certification\",\"is_tampil\":\"1\"}','null','2021-08-31 00:51:09','2021-08-31 00:51:09');

/*!40000 ALTER TABLE `sys_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_menu_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_menu_group`;

CREATE TABLE `sys_menu_group` (
  `id_menu_group` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nm_menu_group` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `urutan` smallint(6) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_menu_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `sys_menu_group` WRITE;
/*!40000 ALTER TABLE `sys_menu_group` DISABLE KEYS */;

INSERT INTO `sys_menu_group` (`id_menu_group`, `nm_menu_group`, `urutan`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`)
VALUES
	(1,'System Setting',2,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(2,'Application Setting',3,'2021-03-19 14:07:17','2021-04-22 14:51:59',NULL,1,1,NULL),
	(3,'Data Referensis',3,'2021-04-20 10:08:18','2021-04-20 10:09:19','2021-04-20 10:09:19',1,1,1),
	(4,'E-Promosi',1,'2021-05-04 08:31:08','2021-08-29 16:57:48','2021-08-29 16:57:48',1,NULL,1),
	(5,'Certification',1,'2021-08-29 18:38:49','2021-08-31 00:45:30',NULL,1,1,NULL);

/*!40000 ALTER TABLE `sys_menu_group` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_modul
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_modul`;

CREATE TABLE `sys_modul` (
  `id_modul` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_modul_group` int(10) unsigned NOT NULL,
  `route_prefix` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nm_modul` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon_modul` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `urutan` smallint(6) NOT NULL,
  `is_tampil` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_modul`),
  UNIQUE KEY `sys_modul_route_prefix_unique` (`route_prefix`),
  KEY `sys_modul_id_modul_group_foreign` (`id_modul_group`),
  CONSTRAINT `sys_modul_id_modul_group_foreign` FOREIGN KEY (`id_modul_group`) REFERENCES `sys_modul_group` (`id_modul_group`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `sys_modul` WRITE;
/*!40000 ALTER TABLE `sys_modul` DISABLE KEYS */;

INSERT INTO `sys_modul` (`id_modul`, `id_modul_group`, `route_prefix`, `nm_modul`, `icon_modul`, `urutan`, `is_tampil`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`)
VALUES
	(1,1,'sys_module_group','Module Group','bi bi-gear-wide-connected',2,0,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(2,1,'sys_module','Module','bi bi-gear-wide-connected',3,0,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(3,2,'sys_setting','System Setting','bi bi-gear-wide-connected',1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(4,3,'sys_role','Role User','bi bi-person-bounding-box',2,1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(5,3,'app_setting','App Setting','bi bi-gear',1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(6,4,'sys_user','User','bi bi-person-badge-fill',1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(7,1,'sys_menu_group','Menu','bi bi-gear-wide-connected',1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(8,4,'sys_user_role','User Role','',2,0,'2021-04-21 08:59:20','2021-04-21 08:59:20',NULL,1,NULL,NULL),
	(9,6,'p-kategori','Kategori','',1,1,'2021-05-04 08:32:31','2021-05-04 14:09:51',NULL,1,1,NULL),
	(10,6,'p-item','Layanan','',2,1,'2021-05-04 08:34:06','2021-05-04 14:10:19',NULL,1,1,NULL),
	(11,7,'p-promo','Promo','',1,1,'2021-05-17 11:53:42','2021-05-17 11:53:42',NULL,1,NULL,NULL),
	(12,8,'employee','Employee','',1,1,'2021-08-29 18:44:04','2021-08-29 18:44:04',NULL,1,NULL,NULL),
	(13,9,'certification_class','Certification Class','',1,1,'2021-08-30 10:51:10','2021-08-30 10:51:10',NULL,1,NULL,NULL),
	(14,10,'certification_history','Data Certification','',1,1,'2021-08-30 14:23:23','2021-08-31 00:49:39',NULL,1,1,NULL),
	(15,11,'refreshment','Refreshment','',1,1,'2021-08-30 21:16:46','2021-08-30 21:16:46',NULL,1,NULL,NULL),
	(16,12,'certification','Certification','',1,1,'2021-08-31 00:51:09','2021-08-31 00:51:09',NULL,1,NULL,NULL);

/*!40000 ALTER TABLE `sys_modul` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_modul_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_modul_group`;

CREATE TABLE `sys_modul_group` (
  `id_modul_group` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_menu_group` int(10) unsigned NOT NULL,
  `route_prefix` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nm_modul_group` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon_modul_group` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `urutan` smallint(6) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_modul_group`),
  UNIQUE KEY `sys_modul_group_route_prefix_unique` (`route_prefix`),
  KEY `sys_modul_group_id_menu_group_foreign` (`id_menu_group`),
  CONSTRAINT `sys_modul_group_id_menu_group_foreign` FOREIGN KEY (`id_menu_group`) REFERENCES `sys_menu_group` (`id_menu_group`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `sys_modul_group` WRITE;
/*!40000 ALTER TABLE `sys_modul_group` DISABLE KEYS */;

INSERT INTO `sys_modul_group` (`id_modul_group`, `id_menu_group`, `route_prefix`, `nm_modul_group`, `icon_modul_group`, `urutan`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`)
VALUES
	(1,1,NULL,'System Menu','bi bi-menu-button-wide-fill',1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(2,1,'sys_setting','System Setting','bi bi-gear-wide-connected',2,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(3,2,NULL,'App Setting','bi bi-gear-fill',1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(4,2,'sys_user','User','bi bi-person-badge-fill',2,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(5,2,NULL,'Data Referensi','bi bi-gear',10,'2021-04-20 11:52:04','2021-04-20 11:56:53','2021-04-20 11:56:53',1,NULL,1),
	(6,4,NULL,'Data Layanan','bi bi-cart4',1,'2021-05-04 08:32:10','2021-05-04 08:32:10',NULL,1,NULL,NULL),
	(7,4,NULL,'Promo','bi bi-percent',2,'2021-05-17 11:53:24','2021-05-17 11:53:24',NULL,1,NULL,NULL),
	(8,5,NULL,'Employee','bi bi-person-badge',2,'2021-08-29 18:41:30','2021-08-30 10:48:39',NULL,1,1,NULL),
	(9,5,NULL,'Certification Class','bi bi-card-checklist',1,'2021-08-30 10:50:47','2021-08-30 10:50:47',NULL,1,NULL,NULL),
	(10,5,NULL,'Data Certification','bi bi-server',3,'2021-08-30 14:23:09','2021-08-31 00:49:06',NULL,1,1,NULL),
	(11,5,NULL,'Refreshment','bi bi-file-earmark-medical',5,'2021-08-30 21:16:31','2021-08-31 00:49:54',NULL,1,1,NULL),
	(12,5,NULL,'Certification','bi bi-file-code',4,'2021-08-31 00:50:50','2021-08-31 00:50:50',NULL,1,NULL,NULL);

/*!40000 ALTER TABLE `sys_modul_group` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_privilege
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_privilege`;

CREATE TABLE `sys_privilege` (
  `id_modul` int(10) unsigned NOT NULL,
  `id_role` int(10) unsigned NOT NULL,
  `a_read` tinyint(1) NOT NULL,
  `a_create` tinyint(1) NOT NULL,
  `a_update` tinyint(1) NOT NULL,
  `a_delete` tinyint(1) NOT NULL,
  `a_validate` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_modul`,`id_role`),
  KEY `sys_privilege_id_role_foreign` (`id_role`),
  CONSTRAINT `sys_privilege_id_modul_foreign` FOREIGN KEY (`id_modul`) REFERENCES `sys_modul` (`id_modul`) ON DELETE CASCADE,
  CONSTRAINT `sys_privilege_id_role_foreign` FOREIGN KEY (`id_role`) REFERENCES `sys_role` (`id_role`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `sys_privilege` WRITE;
/*!40000 ALTER TABLE `sys_privilege` DISABLE KEYS */;

INSERT INTO `sys_privilege` (`id_modul`, `id_role`, `a_read`, `a_create`, `a_update`, `a_delete`, `a_validate`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`)
VALUES
	(1,1,1,1,1,1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(2,1,1,1,1,1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(3,1,1,1,1,1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(4,1,1,1,1,1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(4,2,1,1,1,1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17','2021-08-31 00:46:31',1,NULL,NULL),
	(5,1,1,1,1,1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(5,2,1,1,1,1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17','2021-08-31 00:46:27',1,NULL,NULL),
	(6,1,1,1,1,1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(6,2,1,1,1,1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17','2021-08-31 00:46:26',1,NULL,NULL),
	(7,1,1,1,1,1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(7,2,1,1,1,1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17','2021-08-31 00:46:25',1,NULL,NULL),
	(8,1,1,1,1,1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(8,2,1,1,1,1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17','2021-08-31 00:46:23',1,NULL,NULL),
	(9,1,1,1,1,1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(10,1,1,1,1,1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(11,1,1,1,1,1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(12,1,1,1,1,1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(12,2,1,1,1,1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(13,1,1,1,1,1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(13,2,1,1,1,1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(14,1,1,1,1,1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(14,2,1,1,1,1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(15,1,1,1,1,1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(15,2,1,1,1,1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(16,1,1,1,1,1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(16,2,1,1,1,1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL);

/*!40000 ALTER TABLE `sys_privilege` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_role`;

CREATE TABLE `sys_role` (
  `id_role` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nm_role` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ket_role` varchar(192) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;

INSERT INTO `sys_role` (`id_role`, `nm_role`, `ket_role`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`)
VALUES
	(1,'Root','Developer Only','2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(2,'Admin','Admin Aplikasi','2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL);

/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_setting
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_setting`;

CREATE TABLE `sys_setting` (
  `id_sys_setting` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` varchar(192) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_sys_setting`),
  UNIQUE KEY `sys_setting_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `sys_setting` WRITE;
/*!40000 ALTER TABLE `sys_setting` DISABLE KEYS */;

INSERT INTO `sys_setting` (`id_sys_setting`, `key`, `content`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`)
VALUES
	(1,'sys_name','Project Kaizen','2021-03-19 14:07:17','2021-08-29 16:57:01',NULL,NULL,1,NULL),
	(2,'sys_desc','Project Simplifikasi Proses Bisnis','2021-03-19 14:07:17','2021-08-29 16:57:02',NULL,NULL,1,NULL),
	(3,'sys_author_name','CapitalTech','2021-03-19 14:07:17','2021-08-29 16:57:02',NULL,NULL,1,NULL),
	(4,'sys_author_link','https://capitaltech.id','2021-03-19 14:07:17','2021-08-29 16:57:02',NULL,NULL,1,NULL);

/*!40000 ALTER TABLE `sys_setting` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id_user` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username_user` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nm_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password_user` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `identitas_user` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_aktif` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  KEY `username_user` (`username_user`),
  KEY `email_user` (`email_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;

INSERT INTO `sys_user` (`id_user`, `username_user`, `email_user`, `nm_user`, `password_user`, `identitas_user`, `is_aktif`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`)
VALUES
	(1,'hendi','hendi@mail.com','Hendi','$2y$10$0H.GvGQhRyL6Dl6ueZ4Ay.VLt3qxuvDlTdn1vf7TNz70Z1tJs.gL.','100001',1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(2,'admin','admin@mail.com','Admin','$2y$10$Qe.q8Em32hGUIcwg4iRgb.9SMkEgZOMvh2qeUqEAq43o4Vd8QHDCm','100002',1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(3,'bambang007','bambang@gmail.com','Bambang','password','192187364732',1,'2021-04-21 08:49:55','2021-04-21 08:56:29','2021-04-21 08:56:29',1,1,1),
	(5,'bambang007','bambang@gmail.com','Bambang','$2y$10$up9wmb6fTAdYBWNEyB0u6OM.lYh7XLH1X6hqy4CwnZVKYgVgPlmD.','192187364732',1,'2021-04-21 08:57:41','2021-08-30 14:01:07','2021-08-30 14:01:07',1,1,1);

/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_user_role
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_user_role`;

CREATE TABLE `sys_user_role` (
  `id_user_role` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_user` int(10) unsigned NOT NULL,
  `id_role` int(10) unsigned NOT NULL,
  `unit` int(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_user_role`),
  KEY `id_user` (`id_user`,`id_role`),
  CONSTRAINT `sys_user_role_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `sys_user` (`id_user`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;

INSERT INTO `sys_user_role` (`id_user_role`, `id_user`, `id_role`, `unit`, `created_at`, `updated_at`, `deleted_at`, `created_by`, `updated_by`, `deleted_by`)
VALUES
	(1,1,1,5020,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(2,1,2,7777,'2021-03-19 14:07:17','2021-04-26 07:20:37',NULL,1,1,NULL),
	(3,1,3,5020,'2021-03-19 14:07:17','2021-04-26 07:20:51',NULL,1,1,NULL),
	(4,2,2,1010,'2021-03-19 14:07:17','2021-04-21 09:52:59',NULL,1,1,NULL),
	(6,5,6,1020,'2021-04-21 09:29:03','2021-04-21 09:32:19',NULL,1,1,NULL),
	(7,5,3,3079,'2021-04-21 09:29:11','2021-04-21 10:58:32',NULL,1,1,NULL),
	(8,1,4,9156,'2021-04-21 14:21:12','2021-04-26 07:21:12',NULL,1,1,NULL),
	(9,1,5,9111,'2021-04-22 12:04:42','2021-04-22 12:05:10',NULL,1,1,NULL),
	(10,1,6,5020,'2021-04-22 12:04:42','2021-04-26 07:21:23',NULL,1,1,NULL),
	(11,1,7,5020,'2021-04-22 12:04:42','2021-04-26 07:21:33',NULL,1,1,NULL),
	(12,1,8,7777,'2021-03-19 14:07:17','2021-04-26 07:21:49',NULL,1,1,NULL),
	(13,1,9,5020,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(75,1,1,NULL,'2021-05-10 11:49:08','2021-05-10 11:49:14','2021-05-10 11:49:14',1,NULL,1);

/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
