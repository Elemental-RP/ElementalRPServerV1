-- --------------------------------------------------------
-- Anfitrião:                    185.113.142.208
-- Versão do servidor:           10.4.12-MariaDB-1:10.4.12+maria~bionic-log - mariadb.org binary distribution
-- Server OS:                    debian-linux-gnu
-- HeidiSQL Versão:              11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for s4_erpv1
CREATE DATABASE IF NOT EXISTS `s4_erpv1` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `s4_erpv1`;

-- Dumping structure for table s4_erpv1.addon_account
CREATE TABLE IF NOT EXISTS `addon_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table s4_erpv1.addon_account_data
CREATE TABLE IF NOT EXISTS `addon_account_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `money` double NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7308 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table s4_erpv1.addon_inventory
CREATE TABLE IF NOT EXISTS `addon_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table s4_erpv1.addon_inventory_items
CREATE TABLE IF NOT EXISTS `addon_inventory_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_name` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=884 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table s4_erpv1.billing
CREATE TABLE IF NOT EXISTS `billing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `sender` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `target_type` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `target` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `label` longtext CHARACTER SET utf8mb4 NOT NULL DEFAULT '0',
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5231 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table s4_erpv1.bought_houses
CREATE TABLE IF NOT EXISTS `bought_houses` (
  `houseid` int(50) NOT NULL,
  PRIMARY KEY (`houseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table s4_erpv1.cardealer_vehicles
CREATE TABLE IF NOT EXISTS `cardealer_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table s4_erpv1.characters
CREATE TABLE IF NOT EXISTS `characters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `firstname` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `lastname` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `dateofbirth` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `sex` varchar(1) CHARACTER SET utf8mb4 NOT NULL DEFAULT 'f',
  `height` varchar(128) CHARACTER SET utf8mb4 NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4739 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table s4_erpv1.datastore
CREATE TABLE IF NOT EXISTS `datastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `label` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table s4_erpv1.datastore_data
CREATE TABLE IF NOT EXISTS `datastore_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `owner` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `data` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19388 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table s4_erpv1.erpm_furnishings
CREATE TABLE IF NOT EXISTS `erpm_furnishings` (
  `motelId` bigint(20) NOT NULL DEFAULT 0,
  `furnishingData` longtext DEFAULT NULL,
  `ownedFurnishingData` longtext DEFAULT NULL,
  PRIMARY KEY (`motelId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table s4_erpv1.erpm_keys
CREATE TABLE IF NOT EXISTS `erpm_keys` (
  `uuid` bigint(20) NOT NULL DEFAULT 0,
  `owner` varchar(50) NOT NULL,
  `keyData` longtext NOT NULL,
  PRIMARY KEY (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table s4_erpv1.erpm_motels
CREATE TABLE IF NOT EXISTS `erpm_motels` (
  `userIdentifier` varchar(50) NOT NULL,
  `motelData` longtext NOT NULL,
  `motelCreated` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table s4_erpv1.erpm_storages
CREATE TABLE IF NOT EXISTS `erpm_storages` (
  `storageId` varchar(255) NOT NULL,
  `storageData` longtext NOT NULL,
  PRIMARY KEY (`storageId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table s4_erpv1.fine_types
CREATE TABLE IF NOT EXISTS `fine_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `jailtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1315 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table s4_erpv1.fine_types_tap
CREATE TABLE IF NOT EXISTS `fine_types_tap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table s4_erpv1.imported_veh
CREATE TABLE IF NOT EXISTS `imported_veh` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table s4_erpv1.imported_veh_categories
CREATE TABLE IF NOT EXISTS `imported_veh_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table s4_erpv1.insto_accounts
CREATE TABLE IF NOT EXISTS `insto_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `forename` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `surname` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `username` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '0',
  `password` varchar(50) COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `avatar_url` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Data exporting was unselected.

-- Dumping structure for table s4_erpv1.insto_instas
CREATE TABLE IF NOT EXISTS `insto_instas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) NOT NULL,
  `realUser` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filters` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `FK_insto_instas_insto_accounts` (`authorId`),
  CONSTRAINT `FK_insto_instas_insto_accounts` FOREIGN KEY (`authorId`) REFERENCES `insto_accounts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=311 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Data exporting was unselected.

-- Dumping structure for table s4_erpv1.insto_likes
CREATE TABLE IF NOT EXISTS `insto_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) DEFAULT NULL,
  `inapId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_insto_likes_insto_accounts` (`authorId`),
  KEY `FK_insto_likes_insto_instas` (`inapId`),
  CONSTRAINT `FK_insto_likes_insto_accounts` FOREIGN KEY (`authorId`) REFERENCES `insto_accounts` (`id`),
  CONSTRAINT `FK_insto_likes_insto_instas` FOREIGN KEY (`inapId`) REFERENCES `insto_instas` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=390 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- Data exporting was unselected.

-- Dumping structure for table s4_erpv1.items
CREATE TABLE IF NOT EXISTS `items` (
  `name` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `label` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `weight` int(11) NOT NULL DEFAULT -1,
  `rare` int(11) NOT NULL DEFAULT 0,
  `can_remove` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table s4_erpv1.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `name` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `label` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table s4_erpv1.job_grades
CREATE TABLE IF NOT EXISTS `job_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `label` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext CHARACTER SET utf8mb4 NOT NULL,
  `skin_female` longtext CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table s4_erpv1.licenses
CREATE TABLE IF NOT EXISTS `licenses` (
  `type` varchar(60) CHARACTER SET utf8mb4 NOT NULL,
  `label` varchar(60) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table s4_erpv1.mdt_reports
CREATE TABLE IF NOT EXISTS `mdt_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `char_id` int(11) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `incident` longtext DEFAULT NULL,
  `charges` longtext DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `jailtime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=895 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table s4_erpv1.mdt_warrants
CREATE TABLE IF NOT EXISTS `mdt_warrants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `char_id` int(11) DEFAULT NULL,
  `report_id` int(11) DEFAULT NULL,
  `report_title` varchar(255) DEFAULT NULL,
  `charges` longtext DEFAULT NULL,
  `date` varchar(255) DEFAULT NULL,
  `expire` varchar(255) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table s4_erpv1.owned_vehicles
CREATE TABLE IF NOT EXISTS `owned_vehicles` (
  `vehicle` longtext NOT NULL,
  `owner` varchar(60) NOT NULL,
  `stored` int(11) NOT NULL DEFAULT 0 COMMENT 'State of the vehicle',
  `plate` varchar(50) NOT NULL,
  `type` varchar(10) NOT NULL DEFAULT 'car',
  `job` varchar(50) DEFAULT NULL,
  `modelname` varchar(255) DEFAULT NULL,
  `tunerdata` longtext DEFAULT NULL,
  PRIMARY KEY (`plate`),
  KEY `vehsowned` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table s4_erpv1.owned_vehicles_jobs
CREATE TABLE IF NOT EXISTS `owned_vehicles_jobs` (
  `vehicle` longtext CHARACTER SET latin1 NOT NULL,
  `owner` varchar(60) CHARACTER SET latin1 NOT NULL,
  `stored` tinyint(1) NOT NULL DEFAULT 0,
  `garage_name` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT 'Garage_Centre',
  `pound` tinyint(1) NOT NULL DEFAULT 0,
  `plate` varchar(50) CHARACTER SET latin1 NOT NULL,
  `vehiclename` varchar(50) CHARACTER SET latin1 NOT NULL DEFAULT 'vehicle',
  `type` varchar(10) CHARACTER SET latin1 NOT NULL DEFAULT 'car',
  `job` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`plate`),
  KEY `vehsowned` (`owner`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Data exporting was unselected.

-- Dumping structure for table s4_erpv1.phone_app_chat
CREATE TABLE IF NOT EXISTS `phone_app_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(20) NOT NULL,
  `message` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=291 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table s4_erpv1.phone_calls
CREATE TABLE IF NOT EXISTS `phone_calls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(10) NOT NULL COMMENT 'Num tel proprio',
  `num` varchar(10) NOT NULL COMMENT 'Num reférence du contact',
  `incoming` int(11) NOT NULL COMMENT 'Défini si on est à l''origine de l''appels',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `accepts` int(11) NOT NULL COMMENT 'Appels accepter ou pas',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15934 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table s4_erpv1.phone_ch_reddit
CREATE TABLE IF NOT EXISTS `phone_ch_reddit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `redgkit` varchar(20) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table s4_erpv1.phone_messages
CREATE TABLE IF NOT EXISTS `phone_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `transmitter` varchar(255) NOT NULL,
  `receiver` varchar(255) NOT NULL,
  `message` varchar(255) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `isRead` int(11) NOT NULL DEFAULT 0,
  `owner` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=56938 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table s4_erpv1.phone_reddit
CREATE TABLE IF NOT EXISTS `phone_reddit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `redgkit` varchar(20) DEFAULT NULL,
  `reditsage` varchar(255) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table s4_erpv1.phone_shops
CREATE TABLE IF NOT EXISTS `phone_shops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store` varchar(255) NOT NULL,
  `item` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `label` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table s4_erpv1.phone_users_contacts
CREATE TABLE IF NOT EXISTS `phone_users_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL,
  `number` varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL,
  `display` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1729 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table s4_erpv1.rented_vehicles
CREATE TABLE IF NOT EXISTS `rented_vehicles` (
  `vehicle` varchar(60) CHARACTER SET utf8mb4 NOT NULL,
  `plate` varchar(12) CHARACTER SET utf8mb4 NOT NULL,
  `player_name` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(30) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table s4_erpv1.shops
CREATE TABLE IF NOT EXISTS `shops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `item` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table s4_erpv1.sim
CREATE TABLE IF NOT EXISTS `sim` (
  `identifier` varchar(50) NOT NULL,
  `phone_number` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table s4_erpv1.society_moneywash
CREATE TABLE IF NOT EXISTS `society_moneywash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) CHARACTER SET utf8mb4 NOT NULL,
  `society` varchar(60) CHARACTER SET utf8mb4 NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table s4_erpv1.trunk_inventory
CREATE TABLE IF NOT EXISTS `trunk_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(8) CHARACTER SET latin1 NOT NULL,
  `data` longtext CHARACTER SET latin1 NOT NULL DEFAULT '',
  `owned` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `plate` (`plate`)
) ENGINE=InnoDB AUTO_INCREMENT=1110 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table s4_erpv1.twitter_accounts
CREATE TABLE IF NOT EXISTS `twitter_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL DEFAULT '0',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '0',
  `avatar_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=547 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table s4_erpv1.twitter_likes
CREATE TABLE IF NOT EXISTS `twitter_likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) DEFAULT NULL,
  `tweetId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_twitter_likes_twitter_accounts` (`authorId`),
  KEY `FK_twitter_likes_twitter_tweets` (`tweetId`),
  CONSTRAINT `FK_twitter_likes_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`),
  CONSTRAINT `FK_twitter_likes_twitter_tweets` FOREIGN KEY (`tweetId`) REFERENCES `twitter_tweets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table s4_erpv1.twitter_tweets
CREATE TABLE IF NOT EXISTS `twitter_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `authorId` int(11) NOT NULL,
  `realUser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `likes` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `FK_twitter_tweets_twitter_accounts` (`authorId`),
  CONSTRAINT `FK_twitter_tweets_twitter_accounts` FOREIGN KEY (`authorId`) REFERENCES `twitter_accounts` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7778 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table s4_erpv1.users
CREATE TABLE IF NOT EXISTS `users` (
  `identifier` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `license` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `money` int(255) DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 DEFAULT '',
  `skin` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `job` varchar(50) CHARACTER SET utf8mb4 DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `loadout` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `inventory` longtext DEFAULT NULL,
  `position` varchar(255) CHARACTER SET utf8mb4 DEFAULT '{"x":-269.4,"y":-955.3,"z":31.2,"heading":205.8}',
  `bank` int(255) DEFAULT NULL,
  `permission_level` int(11) DEFAULT NULL,
  `group` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `firstname` varchar(50) CHARACTER SET utf8mb4 DEFAULT '',
  `lastname` varchar(50) CHARACTER SET utf8mb4 DEFAULT '',
  `dateofbirth` varchar(25) CHARACTER SET utf8mb4 DEFAULT '',
  `sex` varchar(10) CHARACTER SET utf8mb4 DEFAULT '',
  `height` varchar(5) CHARACTER SET utf8mb4 DEFAULT '',
  `status` longtext CHARACTER SET utf8mb4 DEFAULT NULL,
  `is_dead` tinyint(1) DEFAULT 0,
  `phone_number` varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL,
  `jail` int(11) NOT NULL DEFAULT 0,
  `house` longtext NOT NULL DEFAULT '{"owns":false,"furniture":[],"houseId":0}',
  `bought_furniture` longtext NOT NULL DEFAULT '{}',
  `last_house` int(11) DEFAULT 0,
  `tattoos` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table s4_erpv1.user_accounts
CREATE TABLE IF NOT EXISTS `user_accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `money` double NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4966 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table s4_erpv1.user_convictions
CREATE TABLE IF NOT EXISTS `user_convictions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `char_id` int(11) DEFAULT NULL,
  `offense` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1511 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table s4_erpv1.user_lastcharacter
CREATE TABLE IF NOT EXISTS `user_lastcharacter` (
  `steamid` varchar(255) CHARACTER SET latin1 NOT NULL,
  `charid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table s4_erpv1.user_licenses
CREATE TABLE IF NOT EXISTS `user_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(60) CHARACTER SET utf8mb4 NOT NULL,
  `owner` varchar(60) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1847 DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table s4_erpv1.user_mdt
CREATE TABLE IF NOT EXISTS `user_mdt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `char_id` int(11) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `mugshot_url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table s4_erpv1.user_whitelist
CREATE TABLE IF NOT EXISTS `user_whitelist` (
  `identifier` varchar(255) NOT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table s4_erpv1.vehicles
CREATE TABLE IF NOT EXISTS `vehicles` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table s4_erpv1.vehicle_categories
CREATE TABLE IF NOT EXISTS `vehicle_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Data exporting was unselected.

-- Dumping structure for table s4_erpv1.vehicle_sold
CREATE TABLE IF NOT EXISTS `vehicle_sold` (
  `client` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `model` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `plate` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `soldby` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `date` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Data exporting was unselected.

-- Dumping structure for table s4_erpv1.yellow_tweets
CREATE TABLE IF NOT EXISTS `yellow_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone_number` int(11) DEFAULT NULL,
  `firstname` varchar(256) DEFAULT NULL,
  `lastname` varchar(256) DEFAULT NULL,
  `message` varchar(256) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
