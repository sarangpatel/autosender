-- Adminer 4.8.1 MySQL 8.0.27-0ubuntu0.20.04.1 dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

DROP TABLE IF EXISTS `channels`;
CREATE TABLE `channels` (
  `id` int NOT NULL AUTO_INCREMENT,
  `channel_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `is_active` int NOT NULL DEFAULT '1',
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `is_active` (`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

INSERT INTO `channels` (`id`, `channel_name`, `is_active`, `created_on`) VALUES
(1,	'Email',	1,	'2021-12-28 19:13:23'),
(2,	'SMS',	0,	'2021-12-28 19:13:41');

DROP TABLE IF EXISTS `contacts`;
CREATE TABLE `contacts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `first_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT 'NULL',
  `start_date` datetime NOT NULL,
  `scheduled_at` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `last_sent_on` datetime DEFAULT NULL,
  `send_frequency` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `template_id` int NOT NULL,
  `proximity` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `closeness` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tags` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint DEFAULT '1',
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id_email` (`user_id`,`email`),
  UNIQUE KEY `user_id_phone` (`user_id`,`phone`),
  KEY `user_id` (`user_id`),
  KEY `created_on` (`created_on`),
  KEY `start_date_end_date_status` (`start_date`,`end_date`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

INSERT INTO `contacts` (`id`, `user_id`, `first_name`, `last_name`, `email`, `phone`, `start_date`, `scheduled_at`, `end_date`, `last_sent_on`, `send_frequency`, `template_id`, `proximity`, `closeness`, `tags`, `status`, `created_on`, `updated_on`) VALUES
(104,	1,	'Sarang',	'',	'responsemee@gmail.com',	'',	'2022-01-08 13:27:13',	'2022-01-08 13:27:13',	NULL,	NULL,	'+7 day',	15,	'',	'',	'',	1,	'2022-01-09 13:27:13',	'2022-01-09 13:27:13');

DROP TABLE IF EXISTS `message_queue`;
CREATE TABLE `message_queue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contact_id` int NOT NULL,
  `send_via` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `send_to` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `template_id` int NOT NULL,
  `meta` varchar(300) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sent` tinyint NOT NULL DEFAULT '0',
  `created_on` datetime NOT NULL,
  `updated_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `status` (`sent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;


DROP TABLE IF EXISTS `plans`;
CREATE TABLE `plans` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8_unicode_ci NOT NULL,
  `currency` varchar(5) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT 'USD',
  `price` float NOT NULL DEFAULT '0',
  `max_contacts` int NOT NULL DEFAULT '3',
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

INSERT INTO `plans` (`id`, `name`, `currency`, `price`, `max_contacts`, `created_on`) VALUES
(1,	'Free',	'USD',	0,	3,	'2022-01-09 17:43:03'),
(2,	'Monthly',	'USD',	10,	10000,	'2022-01-09 17:42:16');

DROP TABLE IF EXISTS `templates`;
CREATE TABLE `templates` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `template_name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT '',
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('sms','text','email') COLLATE utf8_unicode_ci NOT NULL,
  `is_active` int NOT NULL DEFAULT '1',
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id_is_active` (`user_id`,`is_active`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

INSERT INTO `templates` (`id`, `user_id`, `template_name`, `subject`, `content`, `type`, `is_active`, `created_on`, `updated_on`) VALUES
(1,	1,	'Email Template',	'Subject',	'MX\r\nXX',	'email',	1,	'2021-12-29 16:28:36',	'2022-01-01 17:04:37'),
(2,	1,	'Templkate 2 emai',	'email subjet',	'emial ocnanct',	'email',	1,	'2021-12-29 16:28:54',	'2021-12-29 16:28:54'),
(5,	1,	'NEWW',	'SuASDFSFD',	'SFDsa\r\nsf\r\n\r\nfsa',	'email',	1,	'2022-01-01 17:17:23',	'2022-01-01 17:17:23'),
(6,	1,	'LASTA',	'last',	'lasfjsaldfa .s,fa smf.s mfsamfsmf.sa.,m',	'email',	1,	'2022-01-01 17:17:35',	'2022-01-01 17:17:35'),
(7,	1,	'xx',	'ss',	'xsd\r\ns\r\nfsfd',	'email',	1,	'2022-01-01 17:32:12',	'2022-01-01 17:32:12'),
(8,	1,	'x',	NULL,	's\r\ns\r\ns',	'email',	1,	'2022-01-01 17:33:03',	'2022-01-01 17:33:03');

DROP TABLE IF EXISTS `user_channels`;
CREATE TABLE `user_channels` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `contact_id` int NOT NULL,
  `channel_id` int NOT NULL,
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `user_id_contact_id` (`user_id`,`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

INSERT INTO `user_channels` (`id`, `user_id`, `contact_id`, `channel_id`, `created_on`) VALUES
(43,	1,	104,	1,	'2022-01-10 02:17:38');

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `password` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `full_name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `stripe_cus_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `plan_id` int DEFAULT NULL,
  `plan_valid_till` datetime DEFAULT NULL,
  `user_type` enum('user','admin') CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'user',
  `payment_status` enum('pending','paid') CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT 'pending',
  `status` int DEFAULT '1',
  `created_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_on` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `email_password_status` (`email`,`password`,`status`),
  KEY `plan_valid_till` (`plan_valid_till`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

INSERT INTO `users` (`id`, `email`, `password`, `full_name`, `stripe_cus_id`, `plan_id`, `plan_valid_till`, `user_type`, `payment_status`, `status`, `created_on`, `updated_on`) VALUES
(1,	'sarangpatel23@gmail.com',	'ceb6c970658f31504a901b89dcd3e461',	'Sarang Patel',	NULL,	1,	'2022-03-10 02:14:07',	'user',	'paid',	1,	'2021-12-28 17:59:14',	'2021-12-28 17:59:14');

-- 2022-01-09 20:48:48
