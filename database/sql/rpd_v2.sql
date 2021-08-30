# ************************************************************
# Sequel Pro SQL dump
# Version 5446
#
# https://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 192.168.108.46 (MySQL 5.7.23-25)
# Database: rpd_v2
# Generation Time: 2021-04-26 21:34:10 +0000
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
	(1,'app_logo','images/logo/logo_2.png','2021-03-19 14:07:17','2021-04-19 13:48:10',NULL,NULL,NULL,NULL),
	(2,'app_company_name','PT. Bobb','2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,NULL,NULL,NULL),
	(3,'app_company_desc','Company for Bobb','2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,NULL,NULL,NULL),
	(4,'app_company_address','St. San Joseph','2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,NULL,NULL,NULL),
	(5,'app_company_logo','logo.png','2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,NULL,NULL,NULL),
	(6,'app_year','2021','2021-03-19 14:07:17','2021-04-19 14:56:27',NULL,NULL,1,NULL),
	(7,'app_company_site','https://hendi.web.id','2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `app_setting` ENABLE KEYS */;
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
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
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
	(14,'2021_04_21_122946_create_validasi_table',3);

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



# Dump of table rpd_kegiatan
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rpd_kegiatan`;

CREATE TABLE `rpd_kegiatan` (
  `id_rpd` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `k_id` int(11) NOT NULL,
  `unit_asli` int(11) NOT NULL,
  `unit` int(11) NOT NULL,
  `nomor` int(11) NOT NULL,
  `nm_kegiatan` varchar(192) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tahun` int(4) NOT NULL,
  `bulan_rpd` int(2) NOT NULL,
  `ls` bigint(25) DEFAULT NULL,
  `up` bigint(25) DEFAULT NULL,
  `kd_anggaran` varchar(192) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ex_id_rpd` int(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_rpd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table rpd_kegiatan_valid
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rpd_kegiatan_valid`;

CREATE TABLE `rpd_kegiatan_valid` (
  `id_rpd_valid` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `id_validasi_rpd` int(10) NOT NULL,
  `id_rpd` int(10) NOT NULL,
  `k_id` int(11) NOT NULL,
  `unit_asli` int(11) NOT NULL,
  `unit` int(11) NOT NULL,
  `nomor` int(11) NOT NULL,
  `nm_kegiatan` varchar(192) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tahun` int(4) NOT NULL,
  `bulan_rpd` int(2) NOT NULL,
  `ls` bigint(25) DEFAULT NULL,
  `up` bigint(25) DEFAULT NULL,
  `kd_anggaran` varchar(192) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ex_id_rpd` int(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_rpd_valid`),
  KEY `id_valid_rpd` (`id_validasi_rpd`),
  KEY `id_rpd` (`id_rpd`),
  KEY `id_valid_rpd_2` (`id_validasi_rpd`,`id_rpd_valid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table rpd_validasi
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rpd_validasi`;

CREATE TABLE `rpd_validasi` (
  `id_validasi_rpd` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `unit` int(10) unsigned NOT NULL,
  `tahun` int(11) NOT NULL,
  `bulan` tinyint(4) NOT NULL,
  `versi` tinyint(4) NOT NULL,
  `sts_valid` int(1) NOT NULL DEFAULT '0',
  `wkt_valid` datetime DEFAULT NULL,
  `ket_valid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `validator` int(10) unsigned DEFAULT NULL,
  `saldo_rpd_lalu` bigint(20) DEFAULT NULL,
  `pk_lalu` bigint(20) DEFAULT NULL,
  `bpt_lalu` bigint(20) DEFAULT NULL,
  `spp_up_ini` bigint(20) DEFAULT NULL,
  `rpd_final` bigint(20) DEFAULT '0',
  `is_transfered` tinyint(1) NOT NULL DEFAULT '0',
  `wkt_transfer` datetime DEFAULT NULL,
  `transfered_by` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_validasi_rpd`),
  KEY `unit` (`unit`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table rpd_validasi_unit
# ------------------------------------------------------------

DROP TABLE IF EXISTS `rpd_validasi_unit`;

CREATE TABLE `rpd_validasi_unit` (
  `id_validasi_unit` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sub_unit` int(10) DEFAULT NULL,
  `unit` int(11) DEFAULT NULL,
  `tahun` int(11) NOT NULL,
  `bulan` tinyint(4) NOT NULL,
  `is_valid` tinyint(1) NOT NULL DEFAULT '0',
  `wkt_valid` datetime NOT NULL,
  `validator` int(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_validasi_unit`),
  KEY `unit` (`sub_unit`),
  KEY `unit_2` (`unit`)
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
  `is_processed` tinyint(1) NOT NULL DEFAULT '0',
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
  `data_a` text COLLATE utf8mb4_unicode_ci,
  `data_b` text COLLATE utf8mb4_unicode_ci,
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
	(200,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data RPD Kegiatan. id=1.','{\"id_rpd\":null,\"k_id\":\"98428\",\"unit\":\"5020\",\"unit_asli\":\"9156\",\"nm_kegiatan\":\"Biaya Operasional Penyusunan Disertasi Tenaga Kependidikan Mei Tahun 2021\",\"bulan_rpd\":\"5\",\"ls\":\"50,000,000\",\"up\":\"0\"}','null','2021-04-26 09:26:49','2021-04-26 09:26:49'),
	(201,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data RPD Kegiatan. id=2.','{\"id_rpd\":null,\"k_id\":\"98427\",\"unit\":\"5020\",\"unit_asli\":\"9156\",\"nm_kegiatan\":\"Biaya Operasional Penyusunan Disertasi Tenaga Pendidik Mei Tahun 2021\",\"bulan_rpd\":\"5\",\"ls\":\"0\",\"up\":\"10,000,000\"}','null','2021-04-26 09:27:48','2021-04-26 09:27:48'),
	(202,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data RPD Kegiatan. id=3.','{\"id_rpd\":null,\"k_id\":\"100255\",\"unit\":\"5020\",\"unit_asli\":\"9156\",\"nm_kegiatan\":\"Perjalanan Dinas Akuntansi\",\"bulan_rpd\":\"5\",\"ls\":\"0\",\"up\":\"75,000,000\"}','null','2021-04-26 09:28:21','2021-04-26 09:28:21'),
	(203,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Kegiatan RPD. id=3.','{\"id_rpd\":3,\"k_id\":100255,\"unit_asli\":9156,\"unit\":5020,\"nomor\":3,\"nm_kegiatan\":\"Perjalanan Dinas Akuntansi\",\"tahun\":2021,\"bulan_rpd\":5,\"ls\":0,\"up\":75000000,\"kd_anggaran\":\"4471.TAA.001.051.A\",\"ex_id_rpd\":null,\"created_at\":\"2021-04-26T02:28:21.000000Z\",\"updated_at\":\"2021-04-26T02:28:21.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','{\"id_rpd\":\"3\",\"k_id\":\"100255\",\"unit\":\"5020\",\"unit_asli\":\"9156\",\"nm_kegiatan\":\"Perjalanan Dinas Akuntansi\",\"bulan_rpd\":\"5\",\"ls\":\"10,000,000\",\"up\":\"75,000,000\"}','2021-04-26 09:28:58','2021-04-26 09:28:58'),
	(204,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data Role User. id=14.','{\"id_user\":\"1\",\"id_user_role\":null,\"id_role\":\"4\",\"unit\":\"9111\"}','null','2021-04-26 09:31:52','2021-04-26 09:31:52'),
	(205,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data RPD Kegiatan. id=4.','{\"id_rpd\":null,\"k_id\":\"99337\",\"unit\":\"5020\",\"unit_asli\":\"9111\",\"nm_kegiatan\":\"Pelatihan Web Programming Full Package (Vue JS+Laravel)\",\"bulan_rpd\":\"5\",\"ls\":\"0\",\"up\":\"12,999,999\"}','null','2021-04-26 09:32:25','2021-04-26 09:32:25'),
	(206,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data RPD Kegiatan. id=5.','{\"id_rpd\":null,\"k_id\":\"99340\",\"unit\":\"5020\",\"unit_asli\":\"9111\",\"nm_kegiatan\":\"Pelatihan Oracle Database Troubleshoot and Tuning\",\"bulan_rpd\":\"5\",\"ls\":\"29,999,888\",\"up\":\"0\"}','null','2021-04-26 09:32:39','2021-04-26 09:32:39'),
	(207,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Melakukan validasi sub unit','{\"bulan\":\"5\",\"validasi\":[\"9156\"]}','null','2021-04-26 09:35:47','2021-04-26 09:35:47'),
	(208,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Melakukan validasi sub unit','{\"bulan\":\"5\",\"validasi\":[\"9156\",\"9111\"]}','null','2021-04-26 09:37:48','2021-04-26 09:37:48'),
	(209,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengajukan RPD versi 1 bulan 5 unit 5020','{\"unit\":\"5020\",\"tahun\":\"2021\",\"bulan\":\"5\",\"versi\":1,\"sts_valid\":0,\"created_by\":1,\"updated_at\":\"2021-04-26T02:38:23.000000Z\",\"created_at\":\"2021-04-26T02:38:23.000000Z\",\"id_validasi_rpd\":1}','null','2021-04-26 09:38:23','2021-04-26 09:38:23'),
	(210,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Memvalidasi RPD versi 1 bulan 5 unit 5020','{\"id_validasi_rpd\":1,\"unit\":5020,\"tahun\":2021,\"bulan\":5,\"versi\":1,\"sts_valid\":\"2\",\"wkt_valid\":\"2021-04-26 09:40:29\",\"ket_valid\":\"Nominal tidak sesuai PAGU\",\"validator\":1,\"saldo_rpd_lalu\":57432230,\"pk_lalu\":\"694546242\",\"bpt_lalu\":0,\"spp_up_ini\":0,\"rpd_final\":40567769,\"is_transfered\":0,\"wkt_transfer\":null,\"transfered_by\":null,\"created_at\":\"2021-04-26T02:38:23.000000Z\",\"updated_at\":\"2021-04-26T02:40:29.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','null','2021-04-26 09:40:29','2021-04-26 09:40:29'),
	(211,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Melakukan validasi sub unit','{\"bulan\":\"5\"}','null','2021-04-26 09:41:15','2021-04-26 09:41:15'),
	(212,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Kegiatan RPD. id=1.','{\"id_rpd\":1,\"k_id\":98428,\"unit_asli\":9156,\"unit\":5020,\"nomor\":1,\"nm_kegiatan\":\"Biaya Operasional Penyusunan Disertasi Tenaga Kependidikan Mei Tahun 2021\",\"tahun\":2021,\"bulan_rpd\":5,\"ls\":50000000,\"up\":0,\"kd_anggaran\":\"4471.TAM.001.052.A\",\"ex_id_rpd\":null,\"created_at\":\"2021-04-26T02:26:49.000000Z\",\"updated_at\":\"2021-04-26T02:26:49.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','{\"id_rpd\":\"1\",\"k_id\":\"98428\",\"unit\":\"5020\",\"unit_asli\":\"9156\",\"nm_kegiatan\":\"Biaya Operasional Penyusunan Disertasi Tenaga Kependidikan Tahun 2021\",\"bulan_rpd\":\"5\",\"ls\":\"45,000,000\",\"up\":\"0\"}','2021-04-26 09:41:29','2021-04-26 09:41:29'),
	(213,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Melakukan validasi sub unit','{\"bulan\":\"5\",\"validasi\":[\"9156\",\"9111\"]}','null','2021-04-26 09:41:43','2021-04-26 09:41:43'),
	(214,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengajukan ulang RPD versi 1 bulan 5 unit 5020','\"1\"','null','2021-04-26 09:42:01','2021-04-26 09:42:01'),
	(215,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Memvalidasi RPD versi 1 bulan 5 unit 5020','{\"id_validasi_rpd\":1,\"unit\":5020,\"tahun\":2021,\"bulan\":5,\"versi\":1,\"sts_valid\":\"1\",\"wkt_valid\":\"2021-04-26 09:42:31\",\"ket_valid\":\"OK\",\"validator\":1,\"saldo_rpd_lalu\":57432230,\"pk_lalu\":\"694546242\",\"bpt_lalu\":0,\"spp_up_ini\":0,\"rpd_final\":40567769,\"is_transfered\":0,\"wkt_transfer\":null,\"transfered_by\":null,\"created_at\":\"2021-04-26T02:38:23.000000Z\",\"updated_at\":\"2021-04-26T02:42:31.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','null','2021-04-26 09:42:31','2021-04-26 09:42:31'),
	(216,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Melakukan validasi sub unit','{\"bulan\":\"5\"}','null','2021-04-26 09:43:58','2021-04-26 09:43:58'),
	(217,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Kegiatan RPD. id=1.','{\"id_rpd\":1,\"k_id\":98428,\"unit_asli\":9156,\"unit\":5020,\"nomor\":1,\"nm_kegiatan\":\"Biaya Operasional Penyusunan Disertasi Tenaga Kependidikan Tahun 2021\",\"tahun\":2021,\"bulan_rpd\":5,\"ls\":45000000,\"up\":0,\"kd_anggaran\":\"4471.TAM.001.052.A\",\"ex_id_rpd\":null,\"created_at\":\"2021-04-26T02:26:49.000000Z\",\"updated_at\":\"2021-04-26T02:41:29.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','{\"id_rpd\":\"1\",\"k_id\":\"98428\",\"unit\":\"5020\",\"unit_asli\":\"9156\",\"nm_kegiatan\":\"Biaya Operasional Penyusunan Disertasi Tenaga Kependidikan Tahun 2021\",\"bulan_rpd\":\"5\",\"ls\":\"75,000,000\",\"up\":\"0\"}','2021-04-26 09:44:20','2021-04-26 09:44:20'),
	(218,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Melakukan validasi sub unit','{\"bulan\":\"5\",\"validasi\":[\"9156\",\"9111\"]}','null','2021-04-26 09:44:37','2021-04-26 09:44:37'),
	(219,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengajukan RPD versi 2 bulan 5 unit 5020','{\"unit\":\"5020\",\"tahun\":\"2021\",\"bulan\":\"5\",\"versi\":2,\"sts_valid\":0,\"created_by\":1,\"updated_at\":\"2021-04-26T02:45:32.000000Z\",\"created_at\":\"2021-04-26T02:45:32.000000Z\",\"id_validasi_rpd\":2}','null','2021-04-26 09:45:32','2021-04-26 09:45:32'),
	(220,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Memvalidasi RPD versi 2 bulan 5 unit 5020','{\"id_validasi_rpd\":2,\"unit\":5020,\"tahun\":2021,\"bulan\":5,\"versi\":2,\"sts_valid\":\"1\",\"wkt_valid\":\"2021-04-26 09:45:53\",\"ket_valid\":\"OK\",\"validator\":1,\"saldo_rpd_lalu\":57432230,\"pk_lalu\":\"694546242\",\"bpt_lalu\":0,\"spp_up_ini\":0,\"rpd_final\":40567769,\"is_transfered\":0,\"wkt_transfer\":null,\"transfered_by\":null,\"created_at\":\"2021-04-26T02:45:32.000000Z\",\"updated_at\":\"2021-04-26T02:45:53.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','null','2021-04-26 09:45:53','2021-04-26 09:45:53'),
	(221,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menduplikasi data RPD bulan 5 ke bulan 6','{\"bulan\":\"5\",\"rpd\":{\"1\":\"1\",\"3\":\"1\",\"4\":\"1\"}}','null','2021-04-26 09:50:51','2021-04-26 09:50:51'),
	(222,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data Role User. id=15.','{\"id_user\":\"1\",\"id_user_role\":null,\"id_role\":\"1\",\"unit\":\"1010\"}','null','2021-04-26 10:07:51','2021-04-26 10:07:51'),
	(223,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data RPD Kegiatan. id=9.','{\"id_rpd\":null,\"k_id\":\"98424\",\"unit\":\"5020\",\"unit_asli\":\"9156\",\"nm_kegiatan\":\"Pembayaran Pegawai Kontrak PPK TA 2021\",\"bulan_rpd\":\"5\",\"ls\":\"0\",\"up\":\"30,000,000\"}','null','2021-04-26 10:39:04','2021-04-26 10:39:04'),
	(224,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Melakukan validasi sub unit','{\"bulan\":\"5\",\"validasi\":[\"9156\",\"9111\"]}','null','2021-04-26 10:39:51','2021-04-26 10:39:51'),
	(225,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengajukan RPD versi 2 bulan 5 unit 5020','{\"unit\":\"5020\",\"tahun\":\"2021\",\"bulan\":\"5\",\"versi\":2,\"sts_valid\":0,\"created_by\":1,\"updated_at\":\"2021-04-26T03:39:53.000000Z\",\"created_at\":\"2021-04-26T03:39:53.000000Z\",\"id_validasi_rpd\":3}','null','2021-04-26 10:39:53','2021-04-26 10:39:53'),
	(226,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Memvalidasi RPD versi 2 bulan 5 unit 5020','{\"id_validasi_rpd\":3,\"unit\":5020,\"tahun\":2021,\"bulan\":5,\"versi\":2,\"sts_valid\":\"1\",\"wkt_valid\":\"2021-04-26 10:40:13\",\"ket_valid\":\"OK\",\"validator\":1,\"saldo_rpd_lalu\":57432230,\"pk_lalu\":\"694546242\",\"bpt_lalu\":0,\"spp_up_ini\":0,\"rpd_final\":70567769,\"is_transfered\":0,\"wkt_transfer\":null,\"transfered_by\":null,\"created_at\":\"2021-04-26T03:39:53.000000Z\",\"updated_at\":\"2021-04-26T03:40:13.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','null','2021-04-26 10:40:13','2021-04-26 10:40:13'),
	(227,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data RPD Kegiatan. id=1.','{\"id_rpd\":null,\"k_id\":\"98428\",\"unit\":\"5020\",\"unit_asli\":\"9156\",\"nm_kegiatan\":\"Biaya Operasional Penyusunan Disertasi Tenaga Kependidikan Mei Tahun 2021\",\"bulan_rpd\":\"5\",\"ls\":\"0\",\"up\":\"13,000,000\"}','null','2021-04-26 10:52:57','2021-04-26 10:52:57'),
	(228,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data RPD Kegiatan. id=2.','{\"id_rpd\":null,\"k_id\":\"100252\",\"unit\":\"5020\",\"unit_asli\":\"9156\",\"nm_kegiatan\":\"Perjalanan Dinas UPT Humas\",\"bulan_rpd\":\"5\",\"ls\":\"0\",\"up\":\"50,000,000\"}','null','2021-04-26 10:53:32','2021-04-26 10:53:32'),
	(229,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data RPD Kegiatan. id=3.','{\"id_rpd\":null,\"k_id\":\"100255\",\"unit\":\"5020\",\"unit_asli\":\"9156\",\"nm_kegiatan\":\"Perjalanan Dinas Akuntansi\",\"bulan_rpd\":\"5\",\"ls\":\"1,000,000\",\"up\":\"25,000,000\"}','null','2021-04-26 10:53:48','2021-04-26 10:53:48'),
	(230,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data RPD Kegiatan. id=4.','{\"id_rpd\":null,\"k_id\":\"99339\",\"unit\":\"5020\",\"unit_asli\":\"9111\",\"nm_kegiatan\":\"Pelatihan Front-End Web Programming with Vue JS\",\"bulan_rpd\":\"5\",\"ls\":\"0\",\"up\":\"10,000,000\"}','null','2021-04-26 10:55:31','2021-04-26 10:55:31'),
	(231,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data RPD Kegiatan. id=5.','{\"id_rpd\":null,\"k_id\":\"99341\",\"unit\":\"5020\",\"unit_asli\":\"9111\",\"nm_kegiatan\":\"Pelatihan Search Engine Optimization (SEO) Fundamental\",\"bulan_rpd\":\"5\",\"ls\":\"2,000,000\",\"up\":\"0\"}','null','2021-04-26 10:55:46','2021-04-26 10:55:46'),
	(232,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Melakukan validasi sub unit','{\"bulan\":\"5\",\"validasi\":[\"9156\",\"9111\"]}','null','2021-04-26 10:59:55','2021-04-26 10:59:55'),
	(233,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengajukan RPD versi 1 bulan 5 unit 5020','{\"unit\":\"5020\",\"tahun\":\"2021\",\"bulan\":\"5\",\"versi\":1,\"sts_valid\":0,\"created_by\":1,\"updated_at\":\"2021-04-26T04:01:04.000000Z\",\"created_at\":\"2021-04-26T04:01:04.000000Z\",\"id_validasi_rpd\":1}','null','2021-04-26 11:01:04','2021-04-26 11:01:04'),
	(234,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Memvalidasi RPD versi 1 bulan 5 unit 5020','{\"id_validasi_rpd\":1,\"unit\":5020,\"tahun\":2021,\"bulan\":5,\"versi\":1,\"sts_valid\":\"2\",\"wkt_valid\":\"2021-04-26 11:02:09\",\"ket_valid\":\"Nominal Melebihi PAGU\",\"validator\":1,\"saldo_rpd_lalu\":57432230,\"pk_lalu\":\"694546242\",\"bpt_lalu\":0,\"spp_up_ini\":0,\"rpd_final\":40567770,\"is_transfered\":0,\"wkt_transfer\":null,\"transfered_by\":null,\"created_at\":\"2021-04-26T04:01:04.000000Z\",\"updated_at\":\"2021-04-26T04:02:09.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','null','2021-04-26 11:02:09','2021-04-26 11:02:09'),
	(235,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Melakukan validasi sub unit','{\"bulan\":\"5\"}','null','2021-04-26 11:02:39','2021-04-26 11:02:39'),
	(236,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Kegiatan RPD. id=1.','{\"id_rpd\":1,\"k_id\":98428,\"unit_asli\":9156,\"unit\":5020,\"nomor\":1,\"nm_kegiatan\":\"Biaya Operasional Penyusunan Disertasi Tenaga Kependidikan Mei Tahun 2021\",\"tahun\":2021,\"bulan_rpd\":5,\"ls\":0,\"up\":13000000,\"kd_anggaran\":\"4471.TAM.001.052.A\",\"ex_id_rpd\":null,\"created_at\":\"2021-04-26T03:52:57.000000Z\",\"updated_at\":\"2021-04-26T03:52:57.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','{\"id_rpd\":\"1\",\"k_id\":\"98428\",\"unit\":\"5020\",\"unit_asli\":\"9156\",\"nm_kegiatan\":\"Biaya Operasional Penyusunan Disertasi Tenaga Kependidikan Tahun 2021\",\"bulan_rpd\":\"5\",\"ls\":\"0\",\"up\":\"12,000,000\"}','2021-04-26 11:03:12','2021-04-26 11:03:12'),
	(237,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Melakukan validasi sub unit','{\"bulan\":\"5\",\"validasi\":[\"9156\",\"9111\"]}','null','2021-04-26 11:03:29','2021-04-26 11:03:29'),
	(238,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengajukan ulang RPD versi 1 bulan 5 unit 5020','\"1\"','null','2021-04-26 11:03:58','2021-04-26 11:03:58'),
	(239,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Memvalidasi RPD versi 1 bulan 5 unit 5020','{\"id_validasi_rpd\":1,\"unit\":5020,\"tahun\":2021,\"bulan\":5,\"versi\":1,\"sts_valid\":\"1\",\"wkt_valid\":\"2021-04-26 11:04:14\",\"ket_valid\":\"OK\",\"validator\":1,\"saldo_rpd_lalu\":57432230,\"pk_lalu\":\"694546242\",\"bpt_lalu\":0,\"spp_up_ini\":0,\"rpd_final\":39567770,\"is_transfered\":0,\"wkt_transfer\":null,\"transfered_by\":null,\"created_at\":\"2021-04-26T04:01:04.000000Z\",\"updated_at\":\"2021-04-26T04:04:14.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','null','2021-04-26 11:04:14','2021-04-26 11:04:14'),
	(240,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Melakukan validasi sub unit','{\"bulan\":\"5\"}','null','2021-04-26 11:05:19','2021-04-26 11:05:19'),
	(241,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data RPD Kegiatan. id=6.','{\"id_rpd\":null,\"k_id\":\"99803\",\"unit\":\"5020\",\"unit_asli\":\"9111\",\"nm_kegiatan\":\"Pelatihan Docker Administration with Kubernetes\",\"bulan_rpd\":\"5\",\"ls\":\"0\",\"up\":\"30,000,000\"}','null','2021-04-26 11:05:51','2021-04-26 11:05:51'),
	(242,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Melakukan validasi sub unit','{\"bulan\":\"5\",\"validasi\":[\"9156\",\"9111\"]}','null','2021-04-26 11:06:15','2021-04-26 11:06:15'),
	(243,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengajukan RPD versi 2 bulan 5 unit 5020','{\"unit\":\"5020\",\"tahun\":\"2021\",\"bulan\":\"5\",\"versi\":2,\"sts_valid\":0,\"created_by\":1,\"updated_at\":\"2021-04-26T04:06:26.000000Z\",\"created_at\":\"2021-04-26T04:06:26.000000Z\",\"id_validasi_rpd\":2}','null','2021-04-26 11:06:26','2021-04-26 11:06:26'),
	(244,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Memvalidasi RPD versi 2 bulan 5 unit 5020','{\"id_validasi_rpd\":2,\"unit\":5020,\"tahun\":2021,\"bulan\":5,\"versi\":2,\"sts_valid\":\"1\",\"wkt_valid\":\"2021-04-26 11:06:55\",\"ket_valid\":\"OK\",\"validator\":1,\"saldo_rpd_lalu\":57432230,\"pk_lalu\":\"694546242\",\"bpt_lalu\":0,\"spp_up_ini\":0,\"rpd_final\":69567770,\"is_transfered\":0,\"wkt_transfer\":null,\"transfered_by\":null,\"created_at\":\"2021-04-26T04:06:26.000000Z\",\"updated_at\":\"2021-04-26T04:06:55.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','null','2021-04-26 11:06:55','2021-04-26 11:06:55'),
	(245,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menduplikasi data RPD bulan 5 ke bulan 6','{\"bulan\":\"5\",\"rpd\":{\"2\":\"1\",\"4\":\"1\",\"6\":\"1\"}}','null','2021-04-26 11:09:08','2021-04-26 11:09:08'),
	(246,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Melakukan validasi sub unit','{\"bulan\":\"5\"}','null','2021-04-26 11:14:25','2021-04-26 11:14:25'),
	(247,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data RPD Kegiatan. id=10.','{\"id_rpd\":null,\"k_id\":\"100258\",\"unit\":\"5020\",\"unit_asli\":\"9156\",\"nm_kegiatan\":\"Penghargaan Kepada Pegawai atas Pengabdiannya TA 2021 Termin 1\",\"bulan_rpd\":\"5\",\"ls\":\"0\",\"up\":\"20,000,000\"}','null','2021-04-26 11:14:27','2021-04-26 11:14:27'),
	(248,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data RPD Kegiatan. id=11.','{\"id_rpd\":null,\"k_id\":\"100258\",\"unit\":\"5020\",\"unit_asli\":\"9156\",\"nm_kegiatan\":\"Penghargaan Kepada Pegawai atas Pengabdiannya TA 2021 Termin 2\",\"bulan_rpd\":\"8\",\"ls\":\"0\",\"up\":\"1,000,000\"}','null','2021-04-26 11:14:40','2021-04-26 11:14:40'),
	(249,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data RPD Kegiatan. id=12.','{\"id_rpd\":null,\"k_id\":\"100258\",\"unit\":\"5020\",\"unit_asli\":\"9156\",\"nm_kegiatan\":\"Penghargaan Kepada Pegawai atas Pengabdiannya TA 2021 Termin 3\",\"bulan_rpd\":\"10\",\"ls\":\"0\",\"up\":\"1,999,999\"}','null','2021-04-26 11:14:50','2021-04-26 11:14:50'),
	(250,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data RPD Kegiatan. id=1.','{\"id_rpd\":null,\"k_id\":\"98428\",\"unit\":\"5020\",\"unit_asli\":\"9156\",\"nm_kegiatan\":\"Biaya Operasional Penyusunan Disertasi Tenaga Kependidikan Mei Tahun 2021\",\"bulan_rpd\":\"5\",\"ls\":\"0\",\"up\":\"35,000,000\"}','null','2021-04-26 13:26:21','2021-04-26 13:26:21'),
	(251,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data RPD Kegiatan. id=2.','{\"id_rpd\":null,\"k_id\":\"98428\",\"unit\":\"5020\",\"unit_asli\":\"9156\",\"nm_kegiatan\":\"Biaya Operasional Penyusunan Disertasi Tenaga Kependidikan Juni Tahun 2021\",\"bulan_rpd\":\"1\",\"ls\":\"0\",\"up\":\"2,000,000\"}','null','2021-04-26 13:26:46','2021-04-26 13:26:46'),
	(252,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data RPD Kegiatan. id=3.','{\"id_rpd\":null,\"k_id\":\"98428\",\"unit\":\"5020\",\"unit_asli\":\"9156\",\"nm_kegiatan\":\"Biaya Operasional Penyusunan Disertasi Tenaga Kependidikan Juli Tahun 2021\",\"bulan_rpd\":\"7\",\"ls\":\"0\",\"up\":\"2,500,000\"}','null','2021-04-26 13:27:07','2021-04-26 13:27:07'),
	(253,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Kegiatan RPD. id=2.','{\"id_rpd\":2,\"k_id\":98428,\"unit_asli\":9156,\"unit\":5020,\"nomor\":1,\"nm_kegiatan\":\"Biaya Operasional Penyusunan Disertasi Tenaga Kependidikan Juni Tahun 2021\",\"tahun\":2021,\"bulan_rpd\":1,\"ls\":0,\"up\":2000000,\"kd_anggaran\":\"4471.TAM.001.052.A\",\"ex_id_rpd\":null,\"created_at\":\"2021-04-26T06:26:46.000000Z\",\"updated_at\":\"2021-04-26T06:26:46.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','{\"id_rpd\":\"2\",\"k_id\":\"98428\",\"unit\":\"5020\",\"unit_asli\":\"9156\",\"nm_kegiatan\":\"Biaya Operasional Penyusunan Disertasi Tenaga Kependidikan Juni Tahun 2021\",\"bulan_rpd\":\"6\",\"ls\":\"0\",\"up\":\"2,000,000\"}','2021-04-26 13:27:34','2021-04-26 13:27:34'),
	(254,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data RPD Kegiatan. id=4.','{\"id_rpd\":null,\"k_id\":\"100252\",\"unit\":\"5020\",\"unit_asli\":\"9156\",\"nm_kegiatan\":\"Perjalanan Dinas UPT Humas\",\"bulan_rpd\":\"5\",\"ls\":\"1,200,000\",\"up\":\"50,000,000\"}','null','2021-04-26 13:28:06','2021-04-26 13:28:06'),
	(255,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menambah data RPD Kegiatan. id=5.','{\"id_rpd\":null,\"k_id\":\"98424\",\"unit\":\"5020\",\"unit_asli\":\"9156\",\"nm_kegiatan\":\"Pembayaran Pegawai Kontrak PPK TA 2021\",\"bulan_rpd\":\"5\",\"ls\":\"23,999,999\",\"up\":\"1,000,000\"}','null','2021-04-26 13:28:26','2021-04-26 13:28:26'),
	(256,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menghapus data Role User. id=3.','{\"id_rpd\":3,\"k_id\":98428,\"unit_asli\":9156,\"unit\":5020,\"nomor\":1,\"nm_kegiatan\":\"Biaya Operasional Penyusunan Disertasi Tenaga Kependidikan Juli Tahun 2021\",\"tahun\":2021,\"bulan_rpd\":7,\"ls\":0,\"up\":2500000,\"kd_anggaran\":\"4471.TAM.001.052.A\",\"ex_id_rpd\":null,\"created_at\":\"2021-04-26 13:27:07\",\"updated_at\":\"2021-04-26 13:27:07\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','null','2021-04-26 13:29:15','2021-04-26 13:29:15'),
	(257,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menghapus data Role User. id=2.','{\"id_rpd\":2,\"k_id\":98428,\"unit_asli\":9156,\"unit\":5020,\"nomor\":1,\"nm_kegiatan\":\"Biaya Operasional Penyusunan Disertasi Tenaga Kependidikan Juni Tahun 2021\",\"tahun\":2021,\"bulan_rpd\":6,\"ls\":0,\"up\":2000000,\"kd_anggaran\":\"4471.TAM.001.052.A\",\"ex_id_rpd\":null,\"created_at\":\"2021-04-26 13:26:46\",\"updated_at\":\"2021-04-26 13:27:34\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','null','2021-04-26 13:29:17','2021-04-26 13:29:17'),
	(258,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Melakukan validasi sub unit','{\"bulan\":\"5\",\"validasi\":[\"9156\"]}','null','2021-04-26 13:32:53','2021-04-26 13:32:53'),
	(259,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengajukan RPD versi 1 bulan 5 unit 5020','{\"unit\":\"5020\",\"tahun\":\"2021\",\"bulan\":\"5\",\"versi\":1,\"sts_valid\":0,\"created_by\":1,\"updated_at\":\"2021-04-26T06:33:29.000000Z\",\"created_at\":\"2021-04-26T06:33:29.000000Z\",\"id_validasi_rpd\":1}','null','2021-04-26 13:33:29','2021-04-26 13:33:29'),
	(260,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Memvalidasi RPD versi 1 bulan 5 unit 5020','{\"id_validasi_rpd\":1,\"unit\":5020,\"tahun\":2021,\"bulan\":5,\"versi\":1,\"sts_valid\":\"2\",\"wkt_valid\":\"2021-04-26 13:34:32\",\"ket_valid\":\"Kode anggaran tidak sesuai\",\"validator\":1,\"saldo_rpd_lalu\":57432230,\"pk_lalu\":\"694546242\",\"bpt_lalu\":0,\"spp_up_ini\":0,\"rpd_final\":28567770,\"is_transfered\":0,\"wkt_transfer\":null,\"transfered_by\":null,\"created_at\":\"2021-04-26T06:33:29.000000Z\",\"updated_at\":\"2021-04-26T06:34:32.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','null','2021-04-26 13:34:32','2021-04-26 13:34:32'),
	(261,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Melakukan validasi sub unit','{\"bulan\":\"5\"}','null','2021-04-26 13:35:34','2021-04-26 13:35:34'),
	(262,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Kegiatan RPD. id=5.','{\"id_rpd\":5,\"k_id\":98424,\"unit_asli\":9156,\"unit\":5020,\"nomor\":3,\"nm_kegiatan\":\"Pembayaran Pegawai Kontrak PPK TA 2021\",\"tahun\":2021,\"bulan_rpd\":5,\"ls\":23999999,\"up\":1000000,\"kd_anggaran\":\"4471.TAA.001.053.A\",\"ex_id_rpd\":null,\"created_at\":\"2021-04-26T06:28:26.000000Z\",\"updated_at\":\"2021-04-26T06:28:26.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":null,\"deleted_by\":null}','{\"id_rpd\":\"5\",\"k_id\":\"98424\",\"unit\":\"5020\",\"unit_asli\":\"9156\",\"nm_kegiatan\":\"Pembayaran Pegawai Kontrak PPK TA 2021\",\"bulan_rpd\":\"5\",\"ls\":\"23,999,999\",\"up\":\"5,000,000\"}','2021-04-26 13:35:52','2021-04-26 13:35:52'),
	(263,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Melakukan validasi sub unit','{\"bulan\":\"5\",\"validasi\":[\"9156\"]}','null','2021-04-26 13:36:10','2021-04-26 13:36:10'),
	(264,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengajukan ulang RPD versi 1 bulan 5 unit 5020','\"1\"','null','2021-04-26 13:36:37','2021-04-26 13:36:37'),
	(265,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Memvalidasi RPD versi 1 bulan 5 unit 5020','{\"id_validasi_rpd\":1,\"unit\":5020,\"tahun\":2021,\"bulan\":5,\"versi\":1,\"sts_valid\":\"1\",\"wkt_valid\":\"2021-04-26 13:36:53\",\"ket_valid\":\"OK\",\"validator\":1,\"saldo_rpd_lalu\":57432230,\"pk_lalu\":\"694546242\",\"bpt_lalu\":0,\"spp_up_ini\":0,\"rpd_final\":32567770,\"is_transfered\":0,\"wkt_transfer\":null,\"transfered_by\":null,\"created_at\":\"2021-04-26T06:33:29.000000Z\",\"updated_at\":\"2021-04-26T06:36:53.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','null','2021-04-26 13:36:53','2021-04-26 13:36:53'),
	(266,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Melakukan validasi sub unit','{\"bulan\":\"5\"}','null','2021-04-26 13:37:43','2021-04-26 13:37:43'),
	(267,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengubah data Kegiatan RPD. id=5.','{\"id_rpd\":5,\"k_id\":98424,\"unit_asli\":9156,\"unit\":5020,\"nomor\":3,\"nm_kegiatan\":\"Pembayaran Pegawai Kontrak PPK TA 2021\",\"tahun\":2021,\"bulan_rpd\":5,\"ls\":23999999,\"up\":5000000,\"kd_anggaran\":\"4471.TAA.001.053.A\",\"ex_id_rpd\":null,\"created_at\":\"2021-04-26T06:28:26.000000Z\",\"updated_at\":\"2021-04-26T06:35:52.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','{\"id_rpd\":\"5\",\"k_id\":\"98424\",\"unit\":\"5020\",\"unit_asli\":\"9156\",\"nm_kegiatan\":\"Pembayaran Pegawai Kontrak PPK TA 2021\",\"bulan_rpd\":\"5\",\"ls\":\"23,999,999\",\"up\":\"10,000,000\"}','2021-04-26 13:37:57','2021-04-26 13:37:57'),
	(268,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Melakukan validasi sub unit','{\"bulan\":\"5\",\"validasi\":[\"9156\"]}','null','2021-04-26 13:38:16','2021-04-26 13:38:16'),
	(269,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Mengajukan RPD versi 2 bulan 5 unit 5020','{\"unit\":\"5020\",\"tahun\":\"2021\",\"bulan\":\"5\",\"versi\":2,\"sts_valid\":0,\"created_by\":1,\"updated_at\":\"2021-04-26T06:38:39.000000Z\",\"created_at\":\"2021-04-26T06:38:39.000000Z\",\"id_validasi_rpd\":2}','null','2021-04-26 13:38:39','2021-04-26 13:38:39'),
	(270,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Memvalidasi RPD versi 2 bulan 5 unit 5020','{\"id_validasi_rpd\":2,\"unit\":5020,\"tahun\":2021,\"bulan\":5,\"versi\":2,\"sts_valid\":\"1\",\"wkt_valid\":\"2021-04-26 13:38:56\",\"ket_valid\":\"OK\",\"validator\":1,\"saldo_rpd_lalu\":57432230,\"pk_lalu\":\"694546242\",\"bpt_lalu\":0,\"spp_up_ini\":0,\"rpd_final\":37567770,\"is_transfered\":0,\"wkt_transfer\":null,\"transfered_by\":null,\"created_at\":\"2021-04-26T06:38:39.000000Z\",\"updated_at\":\"2021-04-26T06:38:56.000000Z\",\"deleted_at\":null,\"created_by\":1,\"updated_by\":1,\"deleted_by\":null}','null','2021-04-26 13:38:56','2021-04-26 13:38:56'),
	(271,1,'Hendi','103.23.103.66','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/89.0.4389.72 Safari/537.36','Menduplikasi data RPD bulan 5 ke bulan 6','{\"bulan\":\"5\",\"rpd\":{\"1\":\"1\",\"5\":\"1\"}}','null','2021-04-26 13:42:12','2021-04-26 13:42:12');

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
	(4,'RPD',1,'2021-04-20 12:44:14','2021-04-22 14:52:06',NULL,1,1,NULL);

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
	(9,6,'kegiatan_rpd','Input Kegiatan','',1,1,'2021-04-20 13:01:04','2021-04-20 16:33:37',NULL,1,1,NULL),
	(10,7,'rincian_rpd','RPD Bulanan','',1,1,'2021-04-20 14:59:27','2021-04-21 11:11:53',NULL,1,1,NULL),
	(11,8,'realisasi_rpd','Realisasi Bulanan','',1,1,'2021-04-20 15:50:31','2021-04-21 11:16:50',NULL,1,1,NULL),
	(12,9,'laporan_saldo_rpd','B.A. Saldo RPD','',1,1,'2021-04-20 16:26:05','2021-04-20 16:26:05',NULL,1,NULL,NULL),
	(13,4,'sys_user_role','User Role','',2,0,'2021-04-21 08:59:20','2021-04-21 08:59:20',NULL,1,NULL,NULL),
	(14,7,'usulan_rpd','Usulan RPD','',2,1,'2021-04-21 11:06:10','2021-04-21 11:06:10',NULL,1,NULL,NULL),
	(15,8,'realisasi_usulan','Realisasi Usulan','',2,1,'2021-04-21 11:14:53','2021-04-21 11:14:53',NULL,1,NULL,NULL),
	(16,10,'validasi_unit','Validasi Unit','',1,1,'2021-04-22 11:13:31','2021-04-22 11:13:31',NULL,1,NULL,NULL),
	(17,10,'validasi_rpd','Validasi RPD','',2,1,'2021-04-22 11:13:53','2021-04-22 11:13:53',NULL,1,NULL,NULL);

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
	(6,4,NULL,'Kegiatan RPD','bi bi-archive-fill',1,'2021-04-20 12:57:41','2021-04-20 12:57:41',NULL,1,NULL,NULL),
	(7,4,NULL,'Rincian RPD','bi bi-credit-card',2,'2021-04-20 14:58:55','2021-04-21 11:11:38',NULL,1,1,NULL),
	(8,4,NULL,'Rincian Realisasi','bi bi-cash-stack',3,'2021-04-20 15:48:52','2021-04-21 11:13:17',NULL,1,1,NULL),
	(9,4,NULL,'Dok. Laporan RPD','bi bi-file-earmark-ruled',4,'2021-04-20 16:24:50','2021-04-20 16:24:50',NULL,1,NULL,NULL),
	(10,4,NULL,'Validasi','bi bi-shield-lock',5,'2021-04-22 11:12:50','2021-04-22 11:13:08',NULL,1,1,NULL);

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
	(4,2,1,1,1,1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(5,1,1,1,1,1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(5,2,1,1,1,1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(6,1,1,1,1,1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(6,2,1,1,1,1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(7,1,1,1,1,1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(7,2,1,1,1,1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(9,1,1,1,1,1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(9,2,1,1,1,1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(9,3,1,1,1,1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(9,4,1,1,1,1,0,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(9,6,1,1,1,1,0,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(9,7,1,1,1,1,0,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(10,1,1,1,1,1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(10,2,1,1,1,1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(10,3,1,1,1,1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(10,4,1,1,1,1,0,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(10,6,1,1,1,1,0,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(10,7,1,1,1,1,0,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(11,1,1,1,1,1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(11,2,1,1,1,1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(11,3,1,1,1,1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(11,4,1,1,1,1,0,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(11,6,1,1,1,1,0,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(11,7,1,1,1,1,0,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(12,1,1,1,1,1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(12,2,1,1,1,1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(12,3,1,1,1,1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(12,4,1,1,1,1,0,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(12,6,1,1,1,1,0,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(12,7,1,1,1,1,0,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(13,1,1,1,1,1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(13,2,1,1,1,1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(14,1,1,1,1,1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(14,2,1,1,1,1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(14,3,1,1,1,1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(14,4,1,1,1,1,0,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(14,6,1,1,1,1,0,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(14,7,1,1,1,1,0,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(15,1,1,1,1,1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(15,2,1,1,1,1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(15,3,1,1,1,1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(15,4,1,1,1,1,0,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(15,6,1,1,1,1,0,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(15,7,1,1,1,1,0,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(16,1,1,1,1,1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(16,6,1,1,1,1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(16,7,1,1,1,1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(17,1,1,1,1,1,1,'2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL);

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
	(2,'Admin','Admin Aplikasi','2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,1,NULL,NULL),
	(3,'Operator Unit','Untuk operator keu','2021-04-20 07:36:13','2021-04-20 07:48:02',NULL,NULL,NULL,NULL),
	(4,'Operator Subunit','Operator sub unit keu','2021-04-20 07:45:26','2021-04-20 07:45:26',NULL,NULL,NULL,NULL),
	(5,'Operator Khusus','Khususon','2021-04-20 09:46:16','2021-04-20 09:49:01','2021-04-20 09:49:01',NULL,NULL,1),
	(6,'PPK','PPK Unit','2021-04-20 13:21:23','2021-04-20 13:21:23',NULL,1,NULL,NULL),
	(7,'Staf PPK','Staff PPK Unit','2021-04-20 13:21:31','2021-04-20 13:21:31',NULL,1,NULL,NULL),
	(8,'Penguji','Penguji pusat','2021-04-20 13:21:51','2021-04-20 13:21:51',NULL,1,NULL,NULL),
	(9,'BPP','BPP Unit','2021-04-20 13:22:11','2021-04-20 13:22:11',NULL,1,NULL,NULL);

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
	(1,'sys_name','RPD','2021-03-19 14:07:17','2021-04-20 12:42:07',NULL,NULL,1,NULL),
	(2,'sys_desc','Sistem Informasi Rencana Penarikan Dana','2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,NULL,NULL,NULL),
	(3,'sys_author_name','UPT TIK','2021-03-19 14:07:17','2021-04-26 07:16:55',NULL,NULL,1,NULL),
	(4,'sys_author_link','https://hendi.web.id','2021-03-19 14:07:17','2021-03-19 14:07:17',NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `sys_setting` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id_user` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username_user` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_user` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
	(5,'bambang007','bambang@gmail.com','Bambang','$2y$10$up9wmb6fTAdYBWNEyB0u6OM.lYh7XLH1X6hqy4CwnZVKYgVgPlmD.','192187364732',1,'2021-04-21 08:57:41','2021-04-21 09:34:01',NULL,1,1,NULL);

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
	(14,1,4,9111,'2021-04-26 09:31:52','2021-04-26 09:31:52',NULL,1,NULL,NULL),
	(15,1,1,1010,'2021-04-26 10:07:51','2021-04-26 10:07:51',NULL,1,NULL,NULL);

/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
