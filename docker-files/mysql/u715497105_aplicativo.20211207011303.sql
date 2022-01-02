-- MariaDB dump 10.19  Distrib 10.5.12-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: u715497105_aplicativo
-- ------------------------------------------------------
-- Server version	10.5.12-MariaDB-cll-lve

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accept_deliveries`
--

DROP TABLE IF EXISTS `accept_deliveries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accept_deliveries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `is_complete` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accept_deliveries_order_id_unique` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accept_deliveries`
--

/*!40000 ALTER TABLE `accept_deliveries` DISABLE KEYS */;
/*!40000 ALTER TABLE `accept_deliveries` ENABLE KEYS */;

--
-- Table structure for table `activity_log`
--

DROP TABLE IF EXISTS `activity_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `activity_log` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `log_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_id` bigint(20) unsigned DEFAULT NULL,
  `subject_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `causer_id` bigint(20) unsigned DEFAULT NULL,
  `causer_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `properties` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activity_log_log_name_index` (`log_name`),
  KEY `subject` (`subject_id`,`subject_type`),
  KEY `causer` (`causer_id`,`causer_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_log`
--

/*!40000 ALTER TABLE `activity_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `activity_log` ENABLE KEYS */;

--
-- Table structure for table `addon_categories`
--

DROP TABLE IF EXISTS `addon_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addon_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addon_limit` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addon_categories`
--

/*!40000 ALTER TABLE `addon_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `addon_categories` ENABLE KEYS */;

--
-- Table structure for table `addon_category_item`
--

DROP TABLE IF EXISTS `addon_category_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addon_category_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `addon_category_id` int(10) unsigned NOT NULL,
  `item_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addon_category_item`
--

/*!40000 ALTER TABLE `addon_category_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `addon_category_item` ENABLE KEYS */;

--
-- Table structure for table `addons`
--

DROP TABLE IF EXISTS `addons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(20,2) NOT NULL,
  `addon_category_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addons`
--

/*!40000 ALTER TABLE `addons` DISABLE KEYS */;
/*!40000 ALTER TABLE `addons` ENABLE KEYS */;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `house` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landmark` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tag` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (1,2,'Rua da Rocinha, Saubara, Saubara, Bahia, Brazil, 44220-000','Casa',NULL,NULL,'2021-10-15 15:11:01','2021-10-15 15:11:01','-12.740299663058183','-38.76322144238048');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;

--
-- Table structure for table `alerts`
--

DROP TABLE IF EXISTS `alerts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alerts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `data` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alerts`
--

/*!40000 ALTER TABLE `alerts` DISABLE KEYS */;
/*!40000 ALTER TABLE `alerts` ENABLE KEYS */;

--
-- Table structure for table `cashback_reports`
--

DROP TABLE IF EXISTS `cashback_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashback_reports` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `restaurant_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `percentage` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount_real` decimal(8,2) NOT NULL DEFAULT 0.00,
  `amount_paid` decimal(8,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cashback_reports`
--

/*!40000 ALTER TABLE `cashback_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashback_reports` ENABLE KEYS */;

--
-- Table structure for table `cashback_settings`
--

DROP TABLE IF EXISTS `cashback_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashback_settings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `restaurant_edit` tinyint(4) NOT NULL DEFAULT 1,
  `sum_total_amount` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cashback_settings`
--

/*!40000 ALTER TABLE `cashback_settings` DISABLE KEYS */;
INSERT INTO `cashback_settings` VALUES (1,1,0,NULL,NULL);
/*!40000 ALTER TABLE `cashback_settings` ENABLE KEYS */;

--
-- Table structure for table `coupon_restaurant`
--

DROP TABLE IF EXISTS `coupon_restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupon_restaurant` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon_restaurant`
--

/*!40000 ALTER TABLE `coupon_restaurant` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupon_restaurant` ENABLE KEYS */;

--
-- Table structure for table `coupons`
--

DROP TABLE IF EXISTS `coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiry_date` datetime DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `restaurant_id` int(11) DEFAULT NULL,
  `count` int(11) NOT NULL DEFAULT 0,
  `max_count` int(11) NOT NULL DEFAULT 1,
  `min_subtotal` decimal(20,2) NOT NULL DEFAULT 0.00,
  `max_discount` decimal(20,2) DEFAULT NULL,
  `subtotal_message` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'ALL',
  `max_count_per_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupons`
--

/*!40000 ALTER TABLE `coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `coupons` ENABLE KEYS */;

--
-- Table structure for table `delivery_area_restaurant`
--

DROP TABLE IF EXISTS `delivery_area_restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery_area_restaurant` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `delivery_area_id` int(10) unsigned NOT NULL,
  `restaurant_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_area_restaurant`
--

/*!40000 ALTER TABLE `delivery_area_restaurant` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery_area_restaurant` ENABLE KEYS */;

--
-- Table structure for table `delivery_areas`
--

DROP TABLE IF EXISTS `delivery_areas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery_areas` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `areas` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `geojson` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_areas`
--

/*!40000 ALTER TABLE `delivery_areas` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery_areas` ENABLE KEYS */;

--
-- Table structure for table `delivery_collection_logs`
--

DROP TABLE IF EXISTS `delivery_collection_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery_collection_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `delivery_collection_id` int(11) NOT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_collection_logs`
--

/*!40000 ALTER TABLE `delivery_collection_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery_collection_logs` ENABLE KEYS */;

--
-- Table structure for table `delivery_collections`
--

DROP TABLE IF EXISTS `delivery_collections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery_collections` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_collections`
--

/*!40000 ALTER TABLE `delivery_collections` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery_collections` ENABLE KEYS */;

--
-- Table structure for table `delivery_guy_details`
--

DROP TABLE IF EXISTS `delivery_guy_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery_guy_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vehicle_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `commission_rate` decimal(8,2) NOT NULL DEFAULT 5.00,
  `is_notifiable` tinyint(1) DEFAULT 0,
  `max_accept_delivery_limit` int(11) NOT NULL DEFAULT 100,
  `delivery_lat` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_long` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `heading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tip_commission_rate` decimal(8,2) NOT NULL DEFAULT 100.00,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_guy_details`
--

/*!40000 ALTER TABLE `delivery_guy_details` DISABLE KEYS */;
INSERT INTO `delivery_guy_details` VALUES (1,'Teste entregado',NULL,NULL,NULL,NULL,NULL,'2021-10-15 15:14:20','2021-10-15 15:14:20',5.00,0,100,NULL,NULL,NULL,100.00,1);
/*!40000 ALTER TABLE `delivery_guy_details` ENABLE KEYS */;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favorites` (
  `user_id` int(10) unsigned NOT NULL,
  `favoriteable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `favoriteable_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`favoriteable_id`,`favoriteable_type`),
  KEY `favorites_favoriteable_type_favoriteable_id_index` (`favoriteable_type`,`favoriteable_id`),
  KEY `favorites_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;

--
-- Table structure for table `item_categories`
--

DROP TABLE IF EXISTS `item_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_column` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_categories`
--

/*!40000 ALTER TABLE `item_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_categories` ENABLE KEYS */;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `restaurant_id` int(11) NOT NULL,
  `item_category_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(20,2) NOT NULL,
  `old_price` decimal(20,2) NOT NULL DEFAULT 0.00,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_recommended` tinyint(1) NOT NULL,
  `is_popular` tinyint(1) NOT NULL,
  `is_new` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `desc` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `placeholder_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_veg` tinyint(1) DEFAULT NULL,
  `order_column` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

/*!40000 ALTER TABLE `items` DISABLE KEYS */;
/*!40000 ALTER TABLE `items` ENABLE KEYS */;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_popular` tinyint(1) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `locations_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2018_11_06_222923_create_transactions_table',1),(4,'2018_11_07_192923_create_transfers_table',1),(5,'2018_11_07_202152_update_transfers_table',1),(6,'2018_11_15_124230_create_wallets_table',1),(7,'2018_11_19_164609_update_transactions_table',1),(8,'2018_11_20_133759_add_fee_transfers_table',1),(9,'2018_11_22_131953_add_status_transfers_table',1),(10,'2018_11_22_133438_drop_refund_transfers_table',1),(11,'2019_01_19_062844_create_settings_table',1),(12,'2019_01_19_132750_create_locations_table',1),(13,'2019_01_21_055516_create_promo_sliders_table',1),(14,'2019_01_21_073753_create_restaurants_table',1),(15,'2019_01_22_045205_add_slug_to_restaurants_table',1),(16,'2019_01_26_103144_create_items_table',1),(17,'2019_01_26_103412_create_item_categories_table',1),(18,'2019_02_01_095905_add_extras_to_items_table',1),(19,'2019_02_01_103027_add_placeholder_image_to_restaurants_table',1),(20,'2019_02_02_032957_add_lat_long_to_restaurants_table',1),(21,'2019_02_02_033139_add_certificate_to_restaurants_table',1),(22,'2019_02_08_061116_add_restaurant_charges_to_restaurants_table',1),(23,'2019_02_08_101537_create_coupons_table',1),(24,'2019_02_16_042718_add_auth_token_to_users_table',1),(25,'2019_02_17_031843_add_phobe_number_to_users_table',1),(26,'2019_02_18_054807_create_pages_table',1),(27,'2019_02_19_084731_create_orders_table',1),(28,'2019_02_19_084930_create_orderstatuses_table',1),(29,'2019_02_19_085232_create_orderitems_table',1),(30,'2019_02_20_044738_create_addresses_table',1),(31,'2019_02_20_104553_add_default_address_id_to_users_table',1),(32,'2019_02_25_051228_add_payment_mode_to_orders_table',1),(33,'2019_02_28_053038_add_order_comment_to_orders_table',1),(34,'2019_05_13_111553_update_status_transfers_table',1),(35,'2019_05_21_074923_create_permission_tables',1),(36,'2019_06_25_103755_add_exchange_status_transfers_table',1),(37,'2019_07_09_054236_create_payment_gateways_table',1),(38,'2019_07_11_054103_create_user_restaurant_table',1),(39,'2019_07_11_135603_add_restaurant_id_to_orders_table',1),(40,'2019_07_13_054323_add_delivery_pin_to_users_table',1),(41,'2019_07_15_053733_create_accept_deliveries_table',1),(42,'2019_07_16_062435_add_address_pincode_landmark_to_restaurants_table',1),(43,'2019_07_23_030953_create_slides_table',1),(44,'2019_07_24_031824_add_sku_to_restaurants_table',1),(45,'2019_07_29_184926_decimal_places_wallets_table',1),(46,'2019_07_31_032042_add_is_active_to_restaurants_table',1),(47,'2019_08_11_172547_add_transaction_id_to_orders_table',1),(48,'2019_08_13_130103_add_is_accepted_to_restaurants_table',1),(49,'2019_08_13_140046_add_is_active_to_items_table',1),(50,'2019_08_14_093404_add_restaurant_id_to_coupons_table',1),(51,'2019_08_14_112249_add_count_to_coupons_table',1),(52,'2019_08_16_105252_create_push_tokens_table',1),(53,'2019_08_18_102353_add_is_featured_to_restaurants_table',1),(54,'2019_08_20_084106_add_user_id_to_itemcategories_table',1),(55,'2019_08_24_182445_add_location_id_to_promo_sliders_table',1),(56,'2019_09_15_044915_create_addons_table',1),(57,'2019_09_18_234250_create_addon_categories_table',1),(58,'2019_09_19_000319_create_addon_category_item_table',1),(59,'2019_09_20_054300_create_order_item_addons_table',1),(60,'2019_09_23_225754_create_restaurant_earnings_table',1),(61,'2019_09_25_005540_add_commission_rate_to_restaurants_table',1),(62,'2019_09_25_014138_create_restaurant_payouts_table',1),(63,'2019_09_25_025705_add_restaurant_payout_id_to_restaurant_earnings_table',1),(64,'2019_10_02_193759_add_discount_transfers_table',1),(65,'2019_11_06_232008_add_delivery_type_to_restaurants_table',1),(66,'2019_11_07_050958_add_delivery_type_to_orders_table',1),(67,'2019_11_08_022754_create_delivery_guy_details_table',1),(68,'2019_11_08_023100_add_delivery_guy_detail_id_to_users_table',1),(69,'2019_11_17_223225_add_nullable_constraint_to_pincode_landmark_in_restaurants_table',1),(70,'2019_11_20_042206_add_payable_to_orders_table',1),(71,'2019_11_28_052028_add_delivery_radius_to_restaurants_table',1),(72,'2019_12_02_015709_add_lat_lng_to_addresses_table',1),(73,'2019_12_05_223129_add_gps_delivery_charges_fields_to_restaurants_table',1),(74,'2019_12_09_000038_create_popular_geo_places_table',1),(75,'2019_12_13_043245_add_postion_id_and_size_to_promo_sliders_table',1),(76,'2019_12_15_223236_add_long_text_constrait_for_body_to_pages_table',1),(77,'2019_12_18_002035_create_translations_table',1),(78,'2019_12_18_011559_add_default_language_and_is_active_to_translations_table',1),(79,'2019_12_19_221313_change_desc_contraints_to_items_table',1),(80,'2019_12_20_061211_add_commission_rate_to_delivery_guy_details_table',1),(81,'2019_12_29_063818_create_modules_table',1),(82,'2019_12_30_235034_change_price_constraints_on_every_table_increase_limit',1),(83,'2020_01_05_223346_create_delivery_collections_table',1),(84,'2020_01_05_223712_create_delivery_collection_logs_table',1),(85,'2020_01_06_005737_create_restaurant_categories_table',1),(86,'2020_01_06_012659_create_restaurant_category_restaurant_table',1),(87,'2020_01_06_024126_create_restaurant_category_sliders_table',1),(88,'2020_01_12_225036_create_password_reset_otps_table',1),(89,'2020_01_26_055400_change_constraints_of_location_in_orders_table',1),(90,'2020_01_28_075230_add_short_name_and_code_to_modules_table',1),(91,'2020_02_03_223654_add_old_price_to_items_table',1),(92,'2020_02_07_003016_add_is_veg_to_items_table',1),(93,'2020_03_13_234146_change_address_constraints_on_addresses_table',1),(94,'2020_03_31_001623_add_min_order_price_to_restaurants_table',1),(95,'2020_04_01_011619_create_alerts_table',1),(96,'2020_04_09_125640_create_sms_otps_table',1),(97,'2020_04_09_125652_create_sms_gateways_table',1),(98,'2020_04_15_120225_change_restaurant_owner_role_to_store_owner',1),(99,'2020_04_15_184850_change_order_id_constraints_in_accept_deliveries_table',1),(100,'2020_04_17_140857_add_is_sms_notifiable_to_restaurants_table',1),(101,'2020_04_17_141115_add_is_sms_notifiable_to_delivery_guy_details_table',1),(102,'2020_04_19_113902_add_auto_acceptable_to_restaurants_table',1),(103,'2020_04_21_132439_add_max_accept_delivery_limit_to_delivery_guy_details_table',1),(104,'2020_04_25_161840_add_is_active_to_addons_table',1),(105,'2020_05_06_123402_change_columns_datatypes_for_many_tables',1),(106,'2020_05_06_125302_add_schedule_data_to_restaurants_table',1),(107,'2020_05_06_125339_add_is_schedulable_to_restaurants_table',1),(108,'2020_06_10_231926_add_sort_position_to_slides_table',1),(109,'2020_06_11_100217_add_order_column_to_restaurant_category_sliders_table',1),(110,'2020_06_11_170707_add_order_column_to_restaurants_table',1),(111,'2020_06_20_102953_add_avatar_to_users_table',1),(112,'2020_06_29_120302_add_min_max_to_coupons_table',1),(113,'2020_07_12_104136_make_slug_unique_in_restaurants_table',1),(114,'2020_07_20_092301_add_is_active_to_users_table',1),(115,'2020_08_25_144443_add_custom_message_block_to_restaurants_table',1),(116,'2020_09_03_124043_add_description_to_addon_categories_table',1),(117,'2020_09_25_154535_add_wallet_amount_to_orders_table',1),(118,'2020_10_08_115632_create_coupon_restaurant_table',1),(119,'2020_10_08_125459_add_user_type_to_coupons_table',1),(120,'2020_10_08_210058_add_max_count_per_user_to_coupons_table',1),(121,'2020_10_27_134053_create_payment_gateway_restaurant_table',1),(122,'2020_10_30_190509_create_activity_log_table',1),(123,'2020_11_09_135056_add_lat_lng_heading_to_delivery_guy_details_table',1),(124,'2020_11_09_142747_drop_gps_tables',1),(125,'2020_11_25_101915_create_store_payout_details_table',1),(126,'2020_12_15_112726_add_tip_amount_to_orders_table',1),(127,'2020_12_15_112906_add_tip_commission_rate_to_delivery_guy_details_table',1),(128,'2020_12_17_140134_add_tax_amount_and_coupon_amount_to_orders_table',1),(129,'2020_12_17_141422_add_sub_total_to_orders_table',1),(130,'2021_01_15_175643_add_location_properties_to_slides_table',1),(131,'2021_02_03_184231_add_readable_name_column_to_permissions_table',1),(132,'2021_02_06_184705_create_favorites_table',1),(133,'2021_02_10_193407_add_tax_number_to_users_table',1),(134,'2021_02_15_224443_add_order_column_to_items_table',1),(135,'2021_02_20_151804_add_order_column_to_item_categories_table',1),(136,'2021_02_23_233045_add_is_orderscheduling_to_restaurants_table',1),(137,'2021_04_11_230312_drop_old_ratings_table',1),(138,'2021_04_11_230354_create_ratings_table',1),(139,'2021_06_02_063447_add_addonlimit_to_addon_categories_table',1),(140,'2021_06_04_063120_add_cash_change_amount_to_orders_table',1),(141,'2021_06_18_081806_add_status_to_delivery_guy_details_table',1),(142,'2021_06_27_160814_update_src_logo_to_payment_gateways_table_by_marketdev',1),(143,'2021_07_18_121205_add_user_ip_to_users_table',1),(144,'2020_09_12_202747_add_cashback_to_restaurants_table',2),(145,'2020_09_13_030938_create_cashback_reports_table',2),(146,'2020_09_16_170252_create_cash_back_settings_table',2),(147,'2020_09_18_202748_add_cashback_to_restaurants_table_field_cashback_limit_value',2),(148,'2020_07_31_051522_create_delivery_areas_table',3),(149,'2020_08_01_050551_delivery_area_restaurant',3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

--
-- Table structure for table `model_has_permissions`
--

DROP TABLE IF EXISTS `model_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_permissions`
--

/*!40000 ALTER TABLE `model_has_permissions` DISABLE KEYS */;
INSERT INTO `model_has_permissions` VALUES (1,'App\\User',1),(2,'App\\User',1),(3,'App\\User',1),(4,'App\\User',1),(5,'App\\User',1),(6,'App\\User',1),(7,'App\\User',1),(8,'App\\User',1),(9,'App\\User',1),(10,'App\\User',1),(11,'App\\User',1),(12,'App\\User',1),(13,'App\\User',1),(14,'App\\User',1),(15,'App\\User',1),(16,'App\\User',1),(17,'App\\User',1),(18,'App\\User',1),(19,'App\\User',1),(20,'App\\User',1),(21,'App\\User',1),(22,'App\\User',1),(23,'App\\User',1),(24,'App\\User',1),(25,'App\\User',1),(26,'App\\User',1),(27,'App\\User',1),(28,'App\\User',1),(29,'App\\User',1),(30,'App\\User',1),(31,'App\\User',1),(32,'App\\User',1),(33,'App\\User',1),(34,'App\\User',1),(35,'App\\User',1),(36,'App\\User',1),(37,'App\\User',1),(38,'App\\User',1),(39,'App\\User',1),(40,'App\\User',1),(41,'App\\User',1),(42,'App\\User',1),(43,'App\\User',1),(44,'App\\User',1);
/*!40000 ALTER TABLE `model_has_permissions` ENABLE KEYS */;

--
-- Table structure for table `model_has_roles`
--

DROP TABLE IF EXISTS `model_has_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `model_has_roles` (
  `role_id` int(10) unsigned NOT NULL,
  `model_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `model_has_roles`
--

/*!40000 ALTER TABLE `model_has_roles` DISABLE KEYS */;
INSERT INTO `model_has_roles` VALUES (1,'App\\User',1),(2,'App\\User',3),(4,'App\\User',2);
/*!40000 ALTER TABLE `model_has_roles` ENABLE KEYS */;

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modules` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `is_installed` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `short_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `settings_path` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `update_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules`
--

/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;

--
-- Table structure for table `order_item_addons`
--

DROP TABLE IF EXISTS `order_item_addons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_item_addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `orderitem_id` int(11) NOT NULL,
  `addon_category_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `addon_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `addon_price` decimal(20,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item_addons`
--

/*!40000 ALTER TABLE `order_item_addons` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_item_addons` ENABLE KEYS */;

--
-- Table structure for table `orderitems`
--

DROP TABLE IF EXISTS `orderitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderitems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(20,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderitems`
--

/*!40000 ALTER TABLE `orderitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `orderitems` ENABLE KEYS */;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `unique_order_id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `orderstatus_id` int(11) NOT NULL DEFAULT 1,
  `user_id` int(11) NOT NULL,
  `coupon_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax` decimal(20,2) DEFAULT NULL,
  `restaurant_charge` decimal(20,2) DEFAULT NULL,
  `delivery_charge` decimal(20,2) DEFAULT NULL,
  `total` decimal(20,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payment_mode` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_comment` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `restaurant_id` int(11) DEFAULT NULL,
  `transaction_id` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_type` int(11) NOT NULL DEFAULT 1,
  `payable` decimal(20,2) NOT NULL DEFAULT 0.00,
  `wallet_amount` decimal(8,2) DEFAULT NULL,
  `tip_amount` decimal(8,2) DEFAULT NULL,
  `tax_amount` decimal(8,2) DEFAULT NULL,
  `coupon_amount` decimal(8,2) DEFAULT NULL,
  `sub_total` decimal(8,2) DEFAULT NULL,
  `cash_change_amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

--
-- Table structure for table `orderstatuses`
--

DROP TABLE IF EXISTS `orderstatuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderstatuses` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderstatuses`
--

/*!40000 ALTER TABLE `orderstatuses` DISABLE KEYS */;
INSERT INTO `orderstatuses` VALUES (1,'Order Placed'),(2,'Preparing Order'),(3,'Delivery Guy Assigned'),(4,'Order Picked Up'),(5,'Delivered'),(6,'Canceled'),(7,'Ready For Pick Up'),(8,'Awaiting Payment'),(9,'Payment Failed');
/*!40000 ALTER TABLE `orderstatuses` ENABLE KEYS */;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;

--
-- Table structure for table `password_reset_otps`
--

DROP TABLE IF EXISTS `password_reset_otps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_reset_otps` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_otps`
--

/*!40000 ALTER TABLE `password_reset_otps` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_otps` ENABLE KEYS */;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

--
-- Table structure for table `payment_gateway_restaurant`
--

DROP TABLE IF EXISTS `payment_gateway_restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_gateway_restaurant` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payment_gateway_id` int(11) NOT NULL,
  `restaurant_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_gateway_restaurant`
--

/*!40000 ALTER TABLE `payment_gateway_restaurant` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_gateway_restaurant` ENABLE KEYS */;

--
-- Table structure for table `payment_gateways`
--

DROP TABLE IF EXISTS `payment_gateways`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_gateways` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_gateways`
--

/*!40000 ALTER TABLE `payment_gateways` DISABLE KEYS */;
INSERT INTO `payment_gateways` VALUES (1,'COD','Pagamento em Dinheiro',NULL,1,'2020-05-11 21:58:55','2021-06-19 14:00:51'),(2,'Stripe','Online Payment with Stripe',NULL,0,'2020-05-11 21:58:55','2021-04-20 21:31:49'),(3,'Paypal','Paypal Express Checkout',NULL,0,'2020-05-11 21:58:55','2020-10-30 20:30:16'),(4,'PayStack','PayStack Payment Gateway',NULL,0,'2020-05-11 21:58:55','2021-07-06 23:09:25'),(5,'Razorpay','PayStack Payment Gateway',NULL,0,'2020-05-11 21:58:55','2021-07-06 23:09:25'),(6,'PayMongo','PayMongo Payment Gateway',NULL,0,'2020-10-06 17:30:35','2021-07-06 23:09:26'),(7,'MercadoPago','MercadoPago payment gateway',NULL,0,'2020-10-06 17:30:35','2021-05-25 17:01:58'),(8,'Paytm','Paytm Payment Gateway',NULL,0,'2020-10-30 14:45:02','2021-07-06 23:09:29'),(9,'Pix','Pagamento via Pix no ato da entrega',NULL,1,'2021-04-20 22:57:57','2021-07-10 05:35:01'),(11,'Cartão','Efetue seu pagamento através da maquininha de cartão.',NULL,1,'2021-04-20 23:00:55','2021-06-22 00:46:58'),(12,'Ticket Refeição','Pague com Ticket Refeição',NULL,1,'2021-04-20 23:00:55','2021-04-20 23:00:55'),(17,'CAIXA TEM','Pagar via QRCode na maquininha utilizando o app do Caixa TEM',NULL,1,'2021-04-20 23:00:55','2021-07-06 23:09:34'),(18,'Flutterwave','Flutterwave Payment Gateway',NULL,0,'2021-07-09 15:08:41','2021-07-09 15:08:41'),(19,'Khalti','Khalti Payment Gateway',NULL,0,'2021-10-15 15:34:34','2021-10-15 15:34:34');
/*!40000 ALTER TABLE `payment_gateways` ENABLE KEYS */;

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `readable_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permissions`
--

/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` VALUES (1,'dashboard_view','web','2021-10-15 15:45:02','2021-10-15 15:45:02','View Admin Dashboard'),(2,'stores_view','web','2021-10-15 15:45:02','2021-10-15 15:45:02','View Stores'),(3,'stores_edit','web','2021-10-15 15:45:02','2021-10-15 15:45:02','Edit Stores'),(4,'stores_sort','web','2021-10-15 15:45:02','2021-10-15 15:45:02','Sort Stores'),(5,'approve_stores','web','2021-10-15 15:45:02','2021-10-15 15:45:02','Approve Pending Stores'),(6,'stores_add','web','2021-10-15 15:45:02','2021-10-15 15:45:02','Add Store'),(7,'login_as_store_owner','web','2021-10-15 15:45:02','2021-10-15 15:45:02','Login as Store Owner'),(8,'addon_categories_view','web','2021-10-15 15:45:02','2021-10-15 15:45:02','View Addon Categories'),(9,'addon_categories_edit','web','2021-10-15 15:45:02','2021-10-15 15:45:02','Edit Addon Categories'),(10,'addon_categories_add','web','2021-10-15 15:45:02','2021-10-15 15:45:02','Add Addon Category'),(11,'addons_view','web','2021-10-15 15:45:02','2021-10-15 15:45:02','View Addons'),(12,'addons_edit','web','2021-10-15 15:45:02','2021-10-15 15:45:02','Edit Addons'),(13,'addons_add','web','2021-10-15 15:45:02','2021-10-15 15:45:02','Add Addon'),(14,'addons_actions','web','2021-10-15 15:45:02','2021-10-15 15:45:02','Addon Actions'),(15,'menu_categories_view','web','2021-10-15 15:45:02','2021-10-15 15:45:02','View Menu Categories'),(16,'menu_categories_edit','web','2021-10-15 15:45:02','2021-10-15 15:45:02','Edit Menu Categories'),(17,'menu_categories_add','web','2021-10-15 15:45:02','2021-10-15 15:45:02','Add Menu Category'),(18,'menu_categories_actions','web','2021-10-15 15:45:02','2021-10-15 15:45:02','Menu Category Actions'),(19,'items_view','web','2021-10-15 15:45:02','2021-10-15 15:45:02','View Items'),(20,'items_edit','web','2021-10-15 15:45:02','2021-10-15 15:45:02','Edit Items'),(21,'items_add','web','2021-10-15 15:45:02','2021-10-15 15:45:02','Add Item'),(22,'items_actions','web','2021-10-15 15:45:02','2021-10-15 15:45:02','Item Actions'),(23,'all_users_view','web','2021-10-15 15:45:02','2021-10-15 15:45:02','View All Users'),(24,'all_users_edit','web','2021-10-15 15:45:02','2021-10-15 15:45:02','Edit All Users'),(25,'all_users_wallet','web','2021-10-15 15:45:02','2021-10-15 15:45:02','Users Wallet Transactions'),(26,'delivery_guys_view','web','2021-10-15 15:45:02','2021-10-15 15:45:02','View Delivery Guy Users'),(27,'delivery_guys_manage_stores','web','2021-10-15 15:45:02','2021-10-15 15:45:02','Manage Delivery Guy Stores'),(28,'store_owners_view','web','2021-10-15 15:45:02','2021-10-15 15:45:02','View Store Owner Users'),(29,'store_owners_manage_stores','web','2021-10-15 15:45:02','2021-10-15 15:45:02','Manage Store Owner Stores'),(30,'order_view','web','2021-10-15 15:45:02','2021-10-15 15:45:02','View Orders'),(31,'order_actions','web','2021-10-15 15:45:02','2021-10-15 15:45:02','Order Actions'),(32,'promo_sliders_manage','web','2021-10-15 15:45:02','2021-10-15 15:45:02','Manage Promo Sliders'),(33,'store_category_sliders_manage','web','2021-10-15 15:45:02','2021-10-15 15:45:02','Manage Category Sliders'),(34,'coupons_manage','web','2021-10-15 15:45:02','2021-10-15 15:45:02','Manage Coupons'),(35,'pages_manage','web','2021-10-15 15:45:02','2021-10-15 15:45:02','Manage Pages'),(36,'popular_location_manage','web','2021-10-15 15:45:02','2021-10-15 15:45:02','Manage Popular Geo Locations'),(37,'send_notification_manage','web','2021-10-15 15:45:02','2021-10-15 15:45:02','Send Notifications'),(38,'store_payouts_manage','web','2021-10-15 15:45:02','2021-10-15 15:45:02','Manage Store Payouts'),(39,'translations_manage','web','2021-10-15 15:45:02','2021-10-15 15:45:02','Manage Translations'),(40,'delivery_collection_manage','web','2021-10-15 15:45:02','2021-10-15 15:45:02','Manage Delivery Collection'),(41,'delivery_collection_logs_view','web','2021-10-15 15:45:02','2021-10-15 15:45:02','View Delivery Collection Logs'),(42,'wallet_transactions_view','web','2021-10-15 15:45:02','2021-10-15 15:45:02','View Wallet Transactions'),(43,'reports_view','web','2021-10-15 15:45:02','2021-10-15 15:45:02','View Reports'),(44,'settings_manage','web','2021-10-15 15:45:02','2021-10-15 15:45:02','Manage Settings');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

--
-- Table structure for table `popular_geo_places`
--

DROP TABLE IF EXISTS `popular_geo_places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `popular_geo_places` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `popular_geo_places`
--

/*!40000 ALTER TABLE `popular_geo_places` DISABLE KEYS */;
/*!40000 ALTER TABLE `popular_geo_places` ENABLE KEYS */;

--
-- Table structure for table `promo_sliders`
--

DROP TABLE IF EXISTS `promo_sliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `promo_sliders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `position_id` int(11) NOT NULL DEFAULT 0,
  `size` int(11) NOT NULL DEFAULT 5,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promo_sliders`
--

/*!40000 ALTER TABLE `promo_sliders` DISABLE KEYS */;
/*!40000 ALTER TABLE `promo_sliders` ENABLE KEYS */;

--
-- Table structure for table `push_tokens`
--

DROP TABLE IF EXISTS `push_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `push_tokens` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `token` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `is_sent` tinyint(1) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `push_tokens`
--

/*!40000 ALTER TABLE `push_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `push_tokens` ENABLE KEYS */;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ratings` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `restaurant_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating_store` int(11) DEFAULT NULL,
  `rating_delivery` int(11) DEFAULT NULL,
  `review_store` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `review_delivery` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;

--
-- Table structure for table `restaurant_categories`
--

DROP TABLE IF EXISTS `restaurant_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restaurant_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_categories`
--

/*!40000 ALTER TABLE `restaurant_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `restaurant_categories` ENABLE KEYS */;

--
-- Table structure for table `restaurant_category_restaurant`
--

DROP TABLE IF EXISTS `restaurant_category_restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restaurant_category_restaurant` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `restaurant_category_id` int(10) unsigned NOT NULL,
  `restaurant_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_category_restaurant`
--

/*!40000 ALTER TABLE `restaurant_category_restaurant` DISABLE KEYS */;
/*!40000 ALTER TABLE `restaurant_category_restaurant` ENABLE KEYS */;

--
-- Table structure for table `restaurant_category_sliders`
--

DROP TABLE IF EXISTS `restaurant_category_sliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restaurant_category_sliders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_placeholder` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `categories_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_column` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_category_sliders`
--

/*!40000 ALTER TABLE `restaurant_category_sliders` DISABLE KEYS */;
/*!40000 ALTER TABLE `restaurant_category_sliders` ENABLE KEYS */;

--
-- Table structure for table `restaurant_earnings`
--

DROP TABLE IF EXISTS `restaurant_earnings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restaurant_earnings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `restaurant_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `amount` decimal(20,2) NOT NULL DEFAULT 0.00,
  `is_requested` tinyint(1) NOT NULL DEFAULT 0,
  `is_processed` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `restaurant_payout_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_earnings`
--

/*!40000 ALTER TABLE `restaurant_earnings` DISABLE KEYS */;
/*!40000 ALTER TABLE `restaurant_earnings` ENABLE KEYS */;

--
-- Table structure for table `restaurant_payouts`
--

DROP TABLE IF EXISTS `restaurant_payouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restaurant_payouts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `restaurant_id` int(11) NOT NULL,
  `restaurant_earning_id` int(11) NOT NULL,
  `amount` decimal(20,2) NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `transaction_mode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `transaction_id` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_payouts`
--

/*!40000 ALTER TABLE `restaurant_payouts` DISABLE KEYS */;
/*!40000 ALTER TABLE `restaurant_payouts` ENABLE KEYS */;

--
-- Table structure for table `restaurant_user`
--

DROP TABLE IF EXISTS `restaurant_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restaurant_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `restaurant_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant_user`
--

/*!40000 ALTER TABLE `restaurant_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `restaurant_user` ENABLE KEYS */;

--
-- Table structure for table `restaurants`
--

DROP TABLE IF EXISTS `restaurants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `restaurants` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_time` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price_range` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_pureveg` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `placeholder_image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `certificate` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `restaurant_charges` decimal(20,2) DEFAULT NULL,
  `delivery_charges` decimal(20,2) DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pincode` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `landmark` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `is_accepted` tinyint(1) NOT NULL DEFAULT 0,
  `is_featured` tinyint(1) NOT NULL DEFAULT 0,
  `commission_rate` decimal(8,2) NOT NULL DEFAULT 0.00,
  `delivery_type` int(11) NOT NULL DEFAULT 1,
  `delivery_radius` decimal(8,2) NOT NULL DEFAULT 10.00,
  `delivery_charge_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'FIXED',
  `base_delivery_charge` decimal(20,2) DEFAULT NULL,
  `base_delivery_distance` int(11) DEFAULT NULL,
  `extra_delivery_charge` decimal(20,2) DEFAULT NULL,
  `extra_delivery_distance` int(11) DEFAULT NULL,
  `min_order_price` decimal(20,2) NOT NULL DEFAULT 0.00,
  `is_notifiable` tinyint(1) DEFAULT 0,
  `auto_acceptable` tinyint(1) NOT NULL DEFAULT 0,
  `schedule_data` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_schedulable` tinyint(1) NOT NULL DEFAULT 0,
  `order_column` int(11) DEFAULT NULL,
  `custom_message` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_orderscheduling` tinyint(1) NOT NULL DEFAULT 0,
  `storewhatsappApiKey` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `storewhatsAppNumber` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cashback_status` tinyint(4) NOT NULL DEFAULT 0,
  `cashback_value` decimal(8,2) NOT NULL DEFAULT 0.00,
  `cashback_percentage` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cashback_limit_value` decimal(8,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`),
  UNIQUE KEY `restaurants_sku_unique` (`sku`),
  UNIQUE KEY `restaurants_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants`
--

/*!40000 ALTER TABLE `restaurants` DISABLE KEYS */;
/*!40000 ALTER TABLE `restaurants` ENABLE KEYS */;

--
-- Table structure for table `role_has_permissions`
--

DROP TABLE IF EXISTS `role_has_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_has_permissions`
--

/*!40000 ALTER TABLE `role_has_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_has_permissions` ENABLE KEYS */;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin','web','2021-10-15 12:16:59','2021-10-15 12:16:59'),(2,'Delivery Guy','web','2021-10-15 12:16:59','2021-10-15 12:16:59'),(3,'Store Owner','web','2021-10-15 12:16:59','2021-10-15 12:16:59'),(4,'Customer','web','2021-10-15 12:16:59','2021-10-15 12:16:59');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=534 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'storeColor','rgb(255, 76, 2)'),(2,'splashLogo','splash.jpg'),(3,'firstScreenHeading','Order from top & favourite restaurants'),(4,'firstScreenSubHeading','Ready to see top restaurant to order?'),(5,'firstScreenSetupLocation','setup your location'),(6,'firstScreenLoginText','Have an account?'),(7,'footerNearme','Near Me'),(8,'footerExplore','Explore'),(9,'footerCart','Cart'),(10,'footerAccount','Account'),(11,'restaurantCountText','Restaurants Near You'),(12,'searchAreaPlaceholder','Search your area...'),(13,'searchPopularPlaces','Popular Places'),(14,'recommendedBadgeText','Recommended'),(15,'recommendedBadgeColor','#d53d4c'),(16,'popularBadgeText','Popular'),(17,'popularBadgeColor','#ff5722'),(18,'newBadgeText','New'),(19,'newBadgeColor','#2196F3'),(20,'currencyFormat','R$'),(21,'currencyId','BRL'),(22,'cartColorBg','rgb(34, 216, 27)'),(23,'cartColorText','#ffffff'),(24,'cartEmptyText','Your Cart is Empty'),(25,'firstScreenHeroImage','assets/img/various/156662819939lzR3gB2i.png'),(26,'restaurantSearchPlaceholder','Search for restaurants and items...'),(27,'accountManageAddress','Manage Address'),(28,'accountMyOrders','My Orders'),(29,'accountHelpFaq','Help & FAQs'),(30,'accountLogout','Logout'),(31,'cartMakePayment','Make Payment'),(32,'cartLoginHeader','Almost There'),(33,'cartLoginSubHeader','Login or Signup to place your order'),(34,'cartLoginButtonText','Continue'),(35,'cartDeliverTo','Deliver To'),(36,'cartChangeLocation','Change'),(37,'buttonNewAddress','New Address'),(38,'buttonSaveAddress','Save Address'),(39,'editAddressAddress','Flat/Apartment Number'),(40,'editAddressHouse','House / Flat No.'),(41,'editAddressLandmark','Landmark'),(42,'editAddressTag','Tag'),(43,'addressTagPlaceholder','Eg. Home, Work'),(44,'cartApplyCoupon','Apply Coupon'),(45,'cartInvalidCoupon','Invalid Coupon'),(46,'cartSuggestionPlaceholder','Suggestion for the restaurant...'),(47,'editAddressText','Edit'),(48,'deleteAddressText','Delete'),(49,'noAddressText','You don\'t have any saved addresses.'),(50,'cartSetAddressText','Set Your Address'),(51,'cartPageTitle','Cart'),(52,'checkoutPageTitle','Checkout'),(53,'checkoutPlaceOrder','Place Order'),(54,'runningOrderPlacedTitle','Order Placed Successfully'),(55,'runningOrderPlacedSub','Waiting for the restaurant to confirm your order'),(56,'runningOrderPreparingTitle','Chef at work!!'),(57,'runningOrderPreparingSub','Restaurant is preparing your order'),(58,'runningOrderOnwayTitle','Vroom Vroom!!'),(59,'runningOrderOnwaySub','Order has been picked up and is on its way'),(60,'runningOrderRefreshButton','Refresh Order Status'),(61,'noOrdersText','You have not placed any order yet.'),(62,'orderTextTotal','Total:'),(63,'checkoutPaymentListTitle','Select your prefered payment method'),(64,'checkoutSelectPayment','Select Payment Method'),(65,'mapApiKey',NULL),(66,'storeName','Hot Box Delivery'),(67,'storeLogo','logo.png'),(68,'runningOrderDeliveryAssignedTitle','Delivery Guy Assigned'),(69,'runningOrderDeliveryAssignedSub','On the way to pick up your order.'),(70,'runningOrderCanceledTitle','Order Canceled'),(71,'runningOrderCanceledSub','Sorry. Your order has been canceled.'),(72,'stripePublicKey',NULL),(73,'stripeSecretKey',NULL),(74,'firstScreenWelcomeMessage','Welcome,'),(75,'firstScreenLoginBtn','Login'),(76,'loginErrorMessage','Woopss!! Something went wrong. Please try again.'),(77,'pleaseWaitText','Please Wait...'),(78,'loginLoginTitle','LOGIN'),(79,'loginLoginSubTitle','Enter your email and password'),(80,'loginLoginEmailLabel','Email'),(81,'loginLoginPasswordLabel','Password'),(82,'homePageMinsText','MINS'),(83,'homePageForTwoText','FOR TWO'),(84,'itemsPageRecommendedText','RECOMMENDED'),(85,'floatCartItemsText','Items'),(86,'floatCartViewCartText','View Cart'),(87,'cartItemsInCartText','Items in Cart'),(88,'cartBillDetailsText','Bill Details'),(89,'cartItemTotalText','Item Total'),(90,'cartRestaurantCharges','Restaurant Charges'),(91,'cartDeliveryCharges','Delivery Charges'),(92,'cartCouponText','Coupon'),(93,'cartToPayText','To Pay'),(94,'cartSetYourAddress','Set Your Address'),(95,'checkoutPaymentInProcess','Payment in process. Do not hit refresh or go back.'),(96,'checkoutStripeText','Stripe'),(97,'checkoutStripeSubText','Online Payment'),(98,'checkoutCodText','COD'),(99,'checkoutCodSubText','Cash On Delivery'),(100,'showPromoSlider','true'),(101,'loginLoginPhoneLabel','Phone'),(102,'loginLoginNameLabel','Name'),(103,'registerErrorMessage','Woppss!! Something went wrong. Please try again.'),(104,'registerRegisterTitle','Register'),(105,'registerRegisterSubTitle','Regsiter now for free'),(106,'firstScreenRegisterBtn','Register'),(107,'loginDontHaveAccount','Don\'t have an account yet? '),(108,'regsiterAlreadyHaveAccount','Already have an account? '),(109,'favicon-16x16','favicon-16x16.png'),(110,'favicon-32x32','favicon-32x32.png'),(111,'favicon-96x96','favicon-96x96.png'),(112,'favicon-128x128','favicon-128x128.png'),(113,'storeEmail','admin@apphotboxdelivery.com.br'),(114,'seoMetaTitle','Hot Box Delivery'),(115,'seoMetaDescription',NULL),(116,'storeUrl','https://apphotboxdelivery.com.br/'),(117,'twitterUsername','twitter-username'),(118,'seoOgTitle',NULL),(119,'seoOgDescription',NULL),(120,'seoTwitterTitle',NULL),(121,'seoTwitterDescription',NULL),(122,'seoOgImage',NULL),(123,'seoTwitterImage',NULL),(124,'accountMyAccount','My Account'),(125,'desktopHeading','Order from restaurants near you'),(126,'desktopSubHeading','Easy way to get the food you love delivered.\r\nWe bring food from the best restaurants and desserts to your doorstep. We have <b style=\"\">hundreds</b> of restaurants to choose from.'),(127,'desktopUseAppButton','Use App'),(128,'desktopAchievementOneTitle','Restaurants'),(129,'desktopAchievementOneSub','2300+'),(130,'desktopAchievementTwoTitle','Items'),(131,'desktopAchievementTwoSub','65000+'),(132,'desktopAchievementThreeTitle','Customers'),(133,'desktopAchievementThreeSub','1M+'),(134,'desktopAchievementFourTitle','Deliveries'),(135,'desktopAchievementFourSub','5M+'),(136,'desktopSocialFacebookLink','https://www.facebook.com'),(137,'desktopSocialGoogleLink','https://www.google.com'),(138,'desktopSocialYoutubeLink',NULL),(139,'desktopSocialInstagramLink','https://www.instagram.com'),(140,'desktopFooterSocialHeader','We Are Social'),(141,'desktopFooterAddress','#1201, Someplace, Near Somewhere'),(142,'runningOrderDeliveryPin','Delivery Pin: '),(143,'deliveryNoOrdersAccepted','No Orders Accepted Yet'),(144,'deliveryNoNewOrders','No New Orders Yet'),(145,'firstScreenHeroImageSm','assets/img/various/156662819939lzR3gB2i-sm.png'),(146,'showMap','false'),(147,'paypalEnv','sandbox'),(148,'paypalSandboxKey',NULL),(149,'paypalProductionKey',NULL),(150,'enablePushNotification','false'),(151,'enablePushNotificationOrders','false'),(152,'firebaseSenderId','803652648989'),(153,'firebaseSecret','BIvnnnw0m1lwqsbhR1O1m5T4fmGxTGBztojKqtpcn7r_ajLtpdDzs_y_uF-lGURVIgwHhpKF6IbhOO_3MWiKRPo'),(154,'runningOrderDelivered','Order Delivered'),(155,'runningOrderDeliveredSub','The order has been delivered to you. Enjoy.'),(156,'showGdpr','false'),(157,'gdprMessage','We use Cookies to give you the best possible service. By continuing to browse our site you are agreeing to our use of Cookies'),(158,'gdprConfirmButton','Okay'),(159,'restaurantFeaturedText','Featured'),(160,'deliveryNewOrdersTitle','New Orders'),(161,'deliveryAcceptedOrdersTitle','Accepted Orders'),(162,'deliveryWelcomeMessage','Welcome'),(163,'deliveryOrderItems','Order Items'),(164,'deliveryRestaurantAddress','Restaurant Address'),(165,'deliveryGetDirectionButton','Get Direction'),(166,'deliveryDeliveryAddress','Delivery Address'),(167,'deliveryOnlinePayment','Online Payment'),(168,'deliveryDeliveryPinPlaceholder','ENTER DELIVERY PIN'),(169,'deliveryAcceptOrderButton','Accept'),(170,'deliveryPickedUpButton','Picked Up'),(171,'deliveryDeliveredButton','Delivered'),(172,'deliveryOrderCompletedButton','Order Completed'),(173,'deliveryInvalidDeliveryPin','Incorrect delivery pin. Please try again.'),(174,'deliveryAlreadyAccepted','This delivery has been accepted by someone else.'),(175,'deliveryLogoutDelivery','Logout Delivery'),(176,'enableGoogleAnalytics','false'),(177,'googleAnalyticsId',NULL),(178,'taxApplicable','false'),(179,'taxPercentage',NULL),(180,'firebasePublic','AAAAux1uQB0:APA91bHE3u5LgNaEguRyrkZvqD55fTkvoeS4tPoIuFDo7dnq4ubBPDNOJDYP9oZ2HjPWDOmUlXh45cQZqYelfeJZ5j-gysSr7D32gdHp7hqO1yI0VPYVTlEysklmR1u8VpPdZPOzmkQP'),(181,'deliveryLogoutConfirmation','Are you sure?'),(182,'customizationHeading','Customizations'),(183,'customizableItemText','Customizable'),(184,'customizationDoneBtnText','Continue'),(185,'paystackPublicKey','pk_test_ecf3496bdf36bced2112a502f5f5bb96e1340124'),(186,'paystackPrivateKey',NULL),(187,'paystackPayText','PAY WITH PAYSLACK'),(188,'minPayout','150'),(189,'enableFacebookLogin','false'),(190,'facebookAppId',NULL),(191,'facebookLoginButtonText','Login with Facebook'),(192,'enableGoogleLogin','false'),(193,'googleAppId','144924943455-4vpab5v4cf49t0pc96es1h8ou59h9v4f.apps.googleusercontent.com'),(194,'googleLoginButtonText','Entrar com Google'),(195,'customCSS','/*-------------------------------------\r\nBlocos de lojas e Imagem Quadrada \r\n--------------------------------------*/\r\n\r\n\r\n.magic-checkbox + label:before {\r\nborder-radius: 30px;\r\n}\r\n.magic-radio + label:after {\r\nbackground: #ef5350;\r\n}\r\n.magic-checkbox:checked + label:before {\r\nborder: #1cdc98;\r\nborder-radius: 30px;\r\nbackground: #dc2e1c;\r\n}\r\n.restaurant-image {\r\nheight: 85px!important;\r\nwidth: 85px!important;\r\nbox-shadow: 0px 8px 20px 1px #d5959591f;\r\nborder-radius: 13px;\r\n\r\n}\r\n.restaurant-info {\r\nheight: 119px;\r\n\r\n}\r\n\r\n\r\n/*--------------------------------------\r\nFaixa do Destaque\r\n--------------------------------------*/\r\n\r\n.ribbon-warning.ribbon-bookmark .ribbon-box::before {\r\ndisplay:none;\r\n}\r\n.ribbon-warning .ribbon-box {\r\n    color: #fafafa;\r\n    background: linear-gradient(to left, #e94266, #f0664e);\r\n    text-transform: uppercase;\r\n    font-weight: 700;\r\n    box-shadow: 0px 0px 1px #ff00008f;\r\n    border-radius: 5px;\r\n    font-size: 8px!important;\r\n    margin-right: 15px;\r\n}\r\n\r\n\r\n\r\n/*--------------------------------------\r\nBarra de Pesquisa Tela Inicial\r\n--------------------------------------*/\r\n\r\n.mock-search-block > div {\r\n    box-shadow: 0px 0px 5px 0px #3c3c3c1a;\r\n    border-radius: 30px;\r\n    border: 0px solid #e4e4e49c;\r\n    margin-left: 5px;\r\n    width: 99.4%!important;\r\n    padding-bottom: 1px;\r\n    padding-right: 20px!important;\r\n    margin-top: 10px;\r\n    padding-left: 20px!important;\r\n}\r\n.mock-search-block i {\r\n    color: #ffffff;\r\n    padding: 9px;\r\n    margin-right: -15px;\r\n    box-shadow: 0px 0px 0px 0px #ffffff;\r\n    line-height: 3rem!important;\r\n    border-radius: 20px;\r\n    font-weight: 900;\r\n    background: linear-gradient(to left, #FF4C02, #FF4C02);\r\n}\r\n\r\n\r\n/*--------------------------------------\r\nBarra Delivery / Vou buscar\r\n--------------------------------------*/\r\n\r\n.user-preferred {\r\n    background: linear-gradient(to left, #FF4C02, #FF4C02);\r\n    border-bottom: 0px solid #fc8019;\r\n    color: #fff;\r\n    font-weight: 600;\r\n    border-radius: 25px !important;\r\n    transition: 0.25s ease-in-out;\r\n    transition-property: border-radius;\r\n}\r\n/*--------------------------------------\r\nBotão Sair\r\n--------------------------------------*/\r\n\r\n.account-logout {\r\n    background-color: #5e01e5;\r\n    border: 1px solid #f4f4f4;\r\n    text-align: center;\r\n    padding: 10px;\r\n    border-radius: 8px;\r\n}\r\n.logout-text {\r\n    color: #ffffff;\r\n    font-weight: 600;\r\n}\r\n.logout-icon {\r\n    color: #ffffff;\r\n    font-weight: 900;\r\n}\r\n\r\n/*--------------------------------------\r\nItens e Tamanho da imagem\r\n--------------------------------------*/\r\n\r\n.flex-item-image {\r\n    height: 160px;\r\n    width: 160px;\r\n    border-radius: 12px!important;\r\n}\r\n.flex-item-name .item-name {\r\n    font-weight: 800;\r\n    color: #272727;\r\n    font-size: 14px;\r\n}\r\n.recommended-item-image {\r\n    border-radius: 4px;\r\n    height: 160px;\r\n    width: 160px;\r\n}\r\n.item-badge {\r\n    color: #ffffff;\r\n    \r\n    font-size: 8px;\r\n    text-transform: uppercase!important;\r\n    padding: 0.25rem 1em;\r\n    font-weight: 900;\r\n    letter-spacing: 0.3px;\r\n    border-radius: 3px;\r\n}\r\n.Collapsible__trigger {\r\n    border-bottom: 1px dashed #dadada !important;\r\n}\r\n\r\n/*--------------------------------------\r\nTela de Complementos do Item\r\n--------------------------------------*/\r\n\r\n.addon-category-name {\r\n    height: 36px;\r\n    font-weight: 700;\r\n    border-radius: 0px 15px 15px 0px;\r\n    background: linear-gradient(to left, #6300f1, #9885fa);\r\n    border-bottom: none;\r\n    color: #ffffff;\r\n    box-shadow: 0px 0px 7px #00000045;\r\n    font-size: 1rem;\r\n    display: block;\r\n    border: none;\r\n    padding: 8px 33px;\r\n    width: fit-content;\r\n    margin-left: -34px;\r\n}\r\n\r\n.btn-customization-done {\r\n    position: absolute;\r\n    bottom: 0;\r\n    width: 90%;\r\n    z-index: 99999;\r\n    margin: 0;\r\n        height: 4rem;\r\n    background-color: rgb(51 217 110)!important;\r\n    border-radius: 10px;\r\n}\r\n\r\n/*--------------------------------------\r\nBotão Ver Carrinho\r\n--------------------------------------*/\r\n\r\n.float-cart {\r\n    border-radius: 10px;\r\n    position: fixed;\r\n    width: 95%;\r\n    margin: 10px;\r\n    \r\n}\r\n\r\n/*--------------------------------------\r\nBotão Lista de categorias\r\n--------------------------------------*/\r\n\r\n.btn-menu-list {\r\n    min-width: 88px;\r\n    background-color: #2a272f!important;\r\n    border-radius: 21px;\r\n    border-top: 0px!important;\r\n    height: 2.3rem;\r\n    text-transform: capitalize;\r\n    box-shadow: none;\r\n    border-left: 0px !important;\r\n    color: #b1b1b1;\r\n    line-height: 14px;\r\n    font-size: 0.8rem;\r\n    z-index: 9;\r\n    font-weight: 700;\r\n    margin-bottom: 7px!important;\r\n}\r\n\r\n/*--------------------------------------\r\nBotão Selecionar Método de  Pagamento\r\n--------------------------------------*/\r\n\r\n.btn-make-payment {\r\n    font-size: 13px;\r\n    background: linear-gradient(to left, #FF4C02, #FF4C02)!important;\r\n    bottom: 5px;\r\n    border-radius: 10px!important;\r\n    width: 92%!important;\r\n    font-size: 13px;\r\n    background-size: 12px;\r\n    background-image: url(https://s3.gifyu.com/images/ezgif-4-c0deee15beab.gif);\r\n    background-position-x: 238px;\r\n    background-position-y: 18px;\r\n    background-repeat: no-repeat;\r\n    margin-left: 15px;\r\n    border-bottom: none;\r\n    padding-right: 20px;\r\n    text-transform: none;\r\n    line-height: 17px;\r\n    padding-left: 20px;\r\n    height: 8px;\r\n    margin-bottom: 13px;\r\n    border-left: none!important;\r\n    border-top: none!important;\r\n    padding-top: 16px;\r\n    padding-bottom: 31px;\r\n    font-weight: 600;\r\n}\r\n\r\n/*--------------------------------------\r\nBotão de Titulo de página\r\n--------------------------------------*/\r\n\r\n.nav-page-title {\r\n    font-size: 1rem!important;\r\n    margin-left: -12px;\r\n    padding: 0px 19px 0px 15px;\r\n    background: #2b2130!important;\r\n    border-radius: 10px;\r\n    color: #ffffff!important;\r\n    text-align: center;\r\n    height: 34px;\r\n    font-weight: 700!important;\r\n    text-transform: capitalize!important;\r\n    line-height: 35px!important;\r\n}\r\n\r\n/*--------------------------------------\r\nPágina de Selecionar Método de Pagamento\r\n--------------------------------------*/\r\n\r\n#root > span > div > div.pt-50 {\r\n    box-shadow: none!important;\r\n    background-size: 100%!important;\r\n    background-image: url(/assets/img/pay.png)!important;\r\n    padding-top: 140px !important;\r\n    margin-bottom: 2px!important;\r\n    background-repeat: no-repeat!important;\r\n    max-height: 245px!important;\r\n}\r\n#root > span > div > div.pt-50 > div.col-12.mb-50 > div > div > div {\r\n    padding-top: 10px;\r\n}\r\n.shadow-light {\r\n    border-bottom: none!important;\r\n    border-radius: 10px!important;\r\n}\r\n\r\n\r\n#root > span > div > div.pt-50 > div.col-12.mb-50 > div > div.col-12.text-center.mb-0.mt-4 > h4 {\r\n    color: #ffffff !important;\r\n    font-weight: 500;\r\n    margin-top: -45px;\r\n}\r\n\r\n/*--------------------------------------\r\nPágina de Acompanhar Pedido \r\n--------------------------------------*/\r\n\r\n.order-track-button {\r\ncolor: #2ae78f;\r\n}\r\n.pulse {\r\nwidth: 9.5px;\r\nheight: 9.5px;\r\nbackground: #22e68b;\r\n}\r\n.order-item-quantity {\r\n    border: 0px;\r\n    font-weight: 800;\r\n    color: rgb(255 255 255 / 90%);\r\n    padding: 1px 0px;\r\n    padding-top: 1px!important;\r\n    font-size: 13px;\r\n    min-width: 32px;\r\n    height: 23px;\r\n    border-radius: 7px;\r\n    text-align: center;\r\n    background: #6641d8;\r\n}\r\n\r\n/*--------------------------------------\r\nTexto ativo do rodapé\r\n--------------------------------------*/\r\n\r\n.active-footer-tab {\r\n    color: #FF4C02;\r\n    font-weight: 600;\r\n}\r\n\r\n/*--------------------------------------\r\nBotão inicial Selecionar Local\r\n--------------------------------------*/\r\n#firstScreenMain > div:nth-child(2) > div > a {\r\n    height: 3.5rem;\r\n    font-size: 1rem;\r\n    \r\n    font-weight: 600;\r\n    width: 100%;\r\n    background-position-x: 230px;\r\n    background-position-y: 15px;\r\n    text-transform: capitalize!important;\r\n    display: block;\r\n    color: #ffffff;\r\n    border-radius: 25px;\r\n    text-align: center;\r\n    line-height: 26px;\r\n}\r\n\r\n\r\n/*--------------------------------------\r\nBotão Salvar Endereço\r\n--------------------------------------*/\r\n\r\n#root > span > div > button.btn-save-address {\r\n    position: fixed !important;\r\n    margin: 0 auto;\r\n    margin-left: 15px;\r\n    padding: 0.9375rem 0;\r\n    line-height: 2.15rem;\r\n    width: 92%;\r\n    font-size: 1rem;\r\n    font-weight: 600;\r\n    text-transform: capitalize!important;\r\n    margin-bottom: 13px;\r\n    display: block;\r\n   \r\n    border-radius: 8px;\r\n    bottom: 0;\r\n    color: #fff;\r\n    text-align: center;\r\n}\r\n\r\n.edit-address-input {\r\n    margin-bottom: 1.5rem;\r\n    border: 0;\r\n    border-bottom: 1.2px solid #eee;\r\n    border-radius: 8px;\r\n    padding: 0;\r\n    background-color: #ebeefd;\r\n    height: 40px;\r\n}\r\n\r\n/*--------------------------------------\r\nDesktop\r\n--------------------------------------*/\r\n.desktop-logo {\r\n    margin-bottom: 0.5rem;\r\n    height: 5.5rem;\r\n}\r\n\r\n.desktop-title {\r\n    color: #000000;\r\n    font-size: 3.5rem;\r\n    font-weight: 900;\r\n}\r\n\r\n#root > span > div.container-fluid.p-0.main-container-desktop > div > div > div:nth-child(1) > div > div {\r\n    height: 4rem;\r\n    width: 200px;\r\n    border: 0px solid #fff;\r\n    background: linear-gradient( \r\n45deg , #FF4C02, #FF4C02);\r\n    box-shadow: 0px 0px 0px 0px #fa586887;\r\n    text-align: center;\r\n    font-size: 20px;\r\n    font-weight: 600;\r\n    color: #ffffff;\r\n    border-radius: 15px;\r\n    line-height: 46px;\r\n    transition: 0.2s linear all;\r\n}\r\n\r\n\r\n.use-on-phone {\r\n    position: fixed;\r\n    bottom: 20px;\r\n    left: 20px;\r\n    display: flex;\r\n    color: rgb(0, 0, 0);\r\n    box-shadow: rgba(0, 0, 0, 0.12) 0px 3px 6px -1px, rgba(137, 137, 137, 0.3) 0px 6px 25px -4px;\r\n    align-items: center;\r\n    z-index: 2147483647;\r\n    max-width: 90% !important;\r\n    font-family: \"Open Sans\", -apple-system, \"Segoe UI\", BlinkMacSystemFont, Roboto, \"Helvetica Neue\", Arial, sans-serif !important;\r\n    padding: 10px 20px;\r\n    background: rgba(255, 255, 255, 0.45);\r\n    border-radius: 0.275rem;\r\n}\r\n.main-container-desktop {\r\n    min-height: 100vh;\r\n    background: -o-linear-gradient( 135deg, rgba(103, 58, 183, 0.9), rgba(255, 87, 34, 0.7), rgba(103, 58, 183, 0.9), rgba(255, 87, 34, 0.7) );\r\n    background: linear-gradient( \r\n-45deg , #FF4C02, #FF4C02, #FF4C02, #FF4C02 );\r\n    background-size: 500% 500%;\r\n    -webkit-animation: Gradient 50s ease infinite;\r\n    animation: Gradient 50s ease infinite;\r\n    position: absolute;\r\n    z-index: 1;\r\n    display: -webkit-box;\r\n    display: -ms-flexbox;\r\n    display: flex;\r\n    -webkit-box-align: center;\r\n    -ms-flex-align: center;\r\n    align-items: center;\r\n    overflow: hidden;\r\n}\r\n\r\n\r\n\r\n\r\n.desktop-footer {\r\n    min-height: 70vh;\r\n    background: -o-linear-gradient( 135deg, rgba(255, 87, 34, 0.7), rgba(103, 58, 183, 0.9), rgba(255, 87, 34, 0.7), rgba(103, 58, 183, 0.9) );\r\n    background: linear-gradient( \r\n-45deg\r\n, rgb(104 9 241), rgb(162 119 239 / 90%), rgb(116 29 242), rgb(155 111 232 / 90%) );\r\n    background-size: 500% 500%;\r\n    -webkit-animation: Gradient 50s ease infinite;\r\n    animation: Gradient 50s ease infinite;\r\n    position: relative;\r\n    z-index: 1;\r\n    display: none;\r\n    overflow: hidden;\r\n}\r\n\r\n.desktop-footer::before {\r\n    display: none;\r\n}\r\n\r\n\r\n/*--------------------------------------\r\nBotão Entre\r\n--------------------------------------*/\r\n\r\n.btn-main {\r\n    \r\n    height: 4rem;\r\n    font-size: 1.2rem;\r\n    border-radius: 25px;\r\n    color: #fff;\r\n    font-weight: 600;\r\n    text-transform: uppercase;\r\n    border-radius: 25px !important;\r\n}\r\n\r\n/*--------------------------------------\r\nSlides\r\n--------------------------------------*/\r\n#root > span > div > div > div.slider-wrapper.bg-light.py-20.my-0 img {\r\n    WIDTH: 340px!important;\r\n    height: 140px!important;\r\n}\r\n\r\n/*--------------------------------------\r\nBotão Confirmar (Pagamento Dinheiro)\r\n--------------------------------------*/\r\n\r\n/*.btn-success {\r\n    color: #fff;\r\n    border-color: #18b1b1;\r\n    margin-left: 10px;\r\n    background: linear-gradient( \r\n90deg\r\n , #2fd5c9 49%, rgb(24 177 177) 49%);\r\n    margin-top: 5px;\r\n}\r\n.btn.btn-square {\r\n    border-radius: 8px !important;\r\n}*/\r\n\r\n/*--------------------------------------\r\nBotão CADASTRAR (entregador)\r\n--------------------------------------*/\r\n\r\n.btn-delivery-login-cadastrar {\r\n\r\ncolor: #ffffff;\r\nwidth: 100%;\r\nheight: 4rem;\r\nfont-size: 1.2rem;\r\nborder-radius: 4px;\r\nborder-color: #fd2441;\r\nfont-weight: 700;\r\ntext-transform: uppercase;\r\n}\r\n\r\n/*--------------------------------------\r\nNão mexer se não souber o que está fazendo\r\n--------------------------------------*/\r\n/*\r\n\r\n/* Icone Proximos \r\n.si.si-pointer.fa-2x {\r\nbackground-image: url(\"https://i.ibb.co/CJcPGdS/proximos.png\") !important;\r\nbackground-repeat: no-repeat;\r\nbackground-size: 100%;\r\ncolor: transparent !important;\r\n}\r\n\r\n/* Icone Pedidos \r\n.si.si-bag.fa-2x {\r\nbackground-image: url(\"https://i.ibb.co/8YTc4w8/carrinho.png\") !important;\r\nbackground-repeat: no-repeat;\r\nbackground-size: 100%;\r\ncolor: transparent !important;\r\n}\r\n\r\n/* Icone Carrinho \r\n.si.si-magnifier.fa-2x {\r\nbackground-image: url(\"https://i.ibb.co/g4wMvxD/cart.png\") !important;\r\nbackground-repeat: no-repeat;\r\nbackground-size: 100%;\r\ncolor: transparent !important;\r\n\r\n}\r\n\r\n/* Icone Conta \r\n.si.si-user.fa-2x {\r\nbackground-image: url(\"https://i.ibb.co/fYGYqB6/login.png\") !important;\r\nbackground-repeat: no-repeat;\r\nbackground-size: 100%;\r\ncolor: transparent !important;\r\n}\r\n\r\n/* Icone Chat \r\n.si.si-envelope.fa-2x {\r\nbackground-image: url(\"https://i.ibb.co/BGfzkM4/chat.png\") !important;\r\nbackground-repeat: no-repeat;\r\nbackground-size: 100%;\r\ncolor: transparent !important;\r\n}\r\n\r\n\r\n\r\n\r\n/* Icone Alertas \r\n.si.si-bell {\r\nbackground-image: url(\"https://i.ibb.co/sgp8HpW/alerta.png\") !important;\r\nbackground-repeat: no-repeat;\r\nbackground-size: 100%;\r\ncolor: transparent !important;\r\n}\r\n\r\n\r\n\r\n/* Icone Grid Entregador \r\n.si.si-grid.fa-2x {\r\nbackground-image: url(\"https://i.ibb.co/DzCFS4K/aceito.png\") !important;\r\nbackground-repeat: no-repeat;\r\nbackground-size: 100%;\r\ncolor: transparent !important;\r\n\r\n}\r\n*/'),(196,'enSOV','false'),(197,'twilioSid',NULL),(198,'twilioAccessToken',NULL),(199,'twilioServiceId',NULL),(200,'fieldValidationMsg','This is a required field.'),(201,'nameValidationMsg','Please enter your full name.'),(202,'emailValidationMsg','Please enter a valid email.'),(203,'phoneValidationMsg','Please enter a phone number in this format: +1123456789'),(204,'minimumLengthValidationMessage','This field must be at least 8 characters long.'),(205,'emailPhoneAlreadyRegistered','Email or Phone has already been registered.'),(206,'enterPhoneToVerify','Please enter your phone number to verify'),(207,'invalidOtpMsg','Invalid OTP. Please check and try again.'),(208,'otpSentMsg','An OTP has been sent to '),(209,'resendOtpMsg','Resend OTP to '),(210,'resendOtpCountdownMsg','Resend OTP in '),(211,'verifyOtpBtnText','Verify OTP'),(212,'socialWelcomeText','Hi '),(213,'emailPassDonotMatch','Email & Password do not match.'),(214,'enSPU','true'),(215,'runningOrderReadyForPickup','Food is Ready'),(216,'runningOrderReadyForPickupSub','Your order is ready for self pickup.'),(217,'deliveryTypeDelivery','Delivery'),(218,'deliveryTypeSelfPickup','Self Pickup'),(219,'noRestaurantMessage','No restaurants are available.'),(220,'selectedSelfPickupMessage','You have selected Self Pickup.'),(221,'vehicleText','Vehicle:'),(222,'deliveryGuyAfterName','is your delivery valet today.'),(223,'callNowButton','Call Now'),(224,'enableGoogleAPI','false'),(225,'checkoutRazorpayText','Razorpay'),(226,'checkoutRazorpaySubText','Pay with cards, wallet or UPI'),(227,'razorpayKeyId','rzp_test_VWcp86nfU6T7rV'),(228,'razorpayKeySecret','eLzMBr1cycRG0iEjgMptgjMs'),(229,'allowLocationAccessMessage','Kindly allow location access for live tracking.'),(230,'enableDeliveryPin','false'),(231,'deliveryOrdersRefreshBtn','Refresh'),(232,'restaurantAcceptTimeThreshold','10'),(233,'deliveryAcceptTimeThreshold','45'),(234,'taxText','Tax'),(235,'itemsRemovedMsg','Items added from the previous restaurant have been removed.'),(236,'ongoingOrderMsg','You have some on-going orders. VIEW'),(237,'trackOrderText','Track Order'),(238,'orderPlacedStatusText','Order Placed'),(239,'preparingOrderStatusText','Preparing Order'),(240,'deliveryGuyAssignedStatusText','Delivery Guy Assigned'),(241,'orderPickedUpStatusText','Order Picked Up'),(242,'deliveredStatusText','Delivered'),(243,'canceledStatusText','Canceled'),(244,'readyForPickupStatusText','Ready For Pickup'),(245,'pureVegText','Pure Veg'),(246,'certificateCodeText','Certificate Code: '),(247,'showMoreButtonText','Show More'),(248,'showLessButtonText','Show Less'),(249,'walletName','Wallet'),(250,'accountMyWallet','My Wallet'),(251,'noWalletTransactionsText','No Wallet Transactions Yet!!!'),(252,'walletDepositText','Deposit'),(253,'walletWithdrawText','Withdraw'),(254,'payPartialWithWalletText','Pay partial amount with wallet'),(255,'willbeDeductedText','will be deducted from your balance of'),(256,'payFullWithWalletText','Pay full amount with Wallet.'),(257,'orderPaymentWalletComment','Payment for order:'),(258,'orderPartialPaymentWalletComment','Partial payment for order:'),(259,'orderRefundWalletComment','Refund for order cancellation.'),(260,'orderPartialRefundWalletComment','Partial Refund for order cancellation.'),(261,'enDevMode','false'),(262,'walletRedeemBtnText','Redeem'),(263,'restaurantNewOrderNotificationMsg','Chegou um novo pedido!!'),(264,'restaurantNewOrderNotificationMsgSub','New Order Notification'),(265,'deliveryGuyNewOrderNotificationMsg','A New Order is Waiting !!!'),(266,'deliveryGuyNewOrderNotificationMsgSub','New Order Notification'),(267,'firebaseSDKSnippet',''),(268,'cartCouponOffText','OFF'),(269,'willBeRefundedText','will be refunded back to your wallet.'),(270,'willNotBeRefundedText','No Refund will be made to your wallet as the restaurant has already prepared the order.'),(271,'cartRestaurantNotOperational','Restaurant is not operational on your selected location.'),(272,'addressDoesnotDeliverToText','Does not deliver to'),(273,'googleApiKey','AIzaSyCcD6UnflG5VaL0ot_okF2NfM7UmoI8RFA'),(274,'useCurrentLocationText','Use Current Location'),(275,'gpsAccessNotGrantedMsg','GPS access is not granted or was denied.'),(276,'yourLocationText','YOUR LOCATION'),(277,'notAcceptingOrdersMsg','Currently Not Accepting Any Orders'),(278,'exploreRestautantsText','RESTAURANTS'),(279,'exploreItemsText','ITEMS'),(280,'hidePriceWhenZero','true'),(281,'phoneCountryCode','+55'),(282,'orderCancellationConfirmationText','Do you want to cancel this order?'),(283,'yesCancelOrderBtn','Yes, Cancel Order'),(284,'cancelGoBackBtn','Go back'),(285,'cancelOrderMainButton','Cancel Order'),(286,'deliveryOrderPlacedText','Order Placed'),(287,'deliveryCashOnDelivery','Cash On Delivery'),(288,'socialLoginOrText','OR'),(289,'orderCancelledText','Order Cancelled'),(290,'searchAtleastThreeCharsMsg','Enter at least 3 characters to search.'),(291,'multiLanguageSelection','true'),(292,'changeLanguageText','Change Language'),(293,'deliveryFooterNewTitle','New Orders'),(294,'deliveryFooterAcceptedTitle','Accepted'),(295,'deliveryFooterAccount','Account'),(296,'enableDeliveryGuyEarning','true'),(297,'deliveryGuyCommissionFrom','FULLORDER'),(298,'deliveryEarningsText','Earnings'),(299,'deliveryOnGoingText','On-Going'),(300,'deliveryCompletedText','Completed'),(301,'deliveryCommissionMessage','Commission for order: '),(302,'itemSearchText','Search results for: '),(303,'itemSearchNoResultText','No results found for: '),(304,'itemSearchPlaceholder','Search for items...'),(305,'googleApiKeyIP','AIzaSyDrSRict96mAg5fxTccm21_fJmKjWadGko'),(306,'itemsMenuButtonText','MENU'),(307,'enPassResetEmail','false'),(308,'mail_host',NULL),(309,'mail_port',NULL),(310,'mail_username',NULL),(311,'mail_password',NULL),(312,'mail_encryption',NULL),(313,'enRestaurantCategorySlider','0'),(314,'restaurantCategorySliderPosition','2'),(315,'restaurantCategorySliderSize','3'),(316,'showRestaurantCategorySliderLabel','false'),(317,'restaurantCategorySliderStyle','0.4'),(318,'enRAR','true'),(319,'showPercentageDiscount','true'),(320,'itemPercentageDiscountText','% OFF'),(321,'showVegNonVegBadge','true'),(322,'exploreNoResults','No Items or Restaurants Found'),(323,'updatingMessage','Updating...'),(324,'userNotFoundErrorMessage','No user found with this email.'),(325,'invalidOtpErrorMessage','Invalid OTP Entered'),(326,'resetPasswordPageTitle','Reset Password'),(327,'resetPasswordPageSubTitle','Enter your email address to continue'),(328,'sendOtpOnEmailButtonText','Send OTP on Email'),(329,'alreadyHaveResetOtpButtonText','I already have an OTP'),(330,'enterResetOtpMessageText','Enter the OTP sent to you email'),(331,'verifyResetOtpButtonText','Verify OTP'),(332,'dontHaveResetOtpButtonText','I dont have an OTP'),(333,'enterNewPasswordText','Please enter a new password below'),(334,'newPasswordLabelText','New Password'),(335,'setNewPasswordButtonText','Set New Password'),(336,'exlporeByRestaurantText','By'),(337,'forgotPasswordLinkText','Forgot Password?'),(338,'categoriesNoRestaurantsFoundText','No Restaurants Found'),(339,'categoriesFiltersText','Filters'),(340,'sendEmailFromEmailAddress','do-not-reply@foodomaa.com'),(341,'sendEmailFromEmailName','Foodomaa'),(342,'passwordResetEmailSubject','Reset Password OTP'),(343,'registrationPolicyMessage',NULL),(344,'locationSavedAddresses','Saved Addresses'),(345,'restaurantMinOrderMessage','Min cart value should be atleast '),(346,'footerAlerts','Alerts'),(347,'showFromNowDate','true'),(348,'markAllAlertReadText','Mark all read'),(349,'noNewAlertsText','No new alerts'),(350,'currencySymbolAlign','left'),(351,'restaurantNotificationAudioTrack','Alert-5'),(352,'restaurantNewOrderRefreshRate','15'),(353,'enDelChrRnd','true'),(354,'expandAllItemMenu','true'),(355,'msg91AuthKey',NULL),(356,'msg91SenderId',NULL),(357,'defaultSmsGateway','1'),(358,'otpMessage','Your OTP verification code is:'),(359,'twilioFromPhone',NULL),(360,'smsRestaurantNotify','false'),(361,'smsDeliveryNotify','false'),(362,'defaultSmsRestaurantMsg','You have received a new order.'),(363,'smsRestOrderValue','false'),(364,'smsOrderNotify','false'),(365,'defaultSmsDeliveryMsg','A new order has arrived.'),(366,'showOrderAddonsDelivery','true'),(367,'showDeliveryFullAddressOnList','false'),(368,'sendgrid_api_key',NULL),(369,'showUserInfoBeforePickup','true'),(370,'recommendedLayoutV2','true'),(371,'cartItemNotAvailable','Item Not Available'),(372,'cartRemoveItemButton','Remove Item'),(373,'deliveryTotalEarningsText','Total Earnings'),(374,'flatApartmentAddressRequired','false'),(375,'deliveryUsePhoneToAccessMsg','Use your mobile phone to login to the Delivery Application.'),(376,'restaurantNotActiveMsg','Not Accepting Orders'),(377,'uploadImageQuality','75'),(378,'deliveryMaxOrderReachedMsg','Max Order Limit Reached'),(379,'showInActiveItemsToo','false'),(380,'enGDMA','true'),(381,'showPriceAndOrderCommentsDelivery','true'),(382,'useSimpleSpinner','false'),(383,'randomizeStores','false'),(384,'showCouponDescriptionOnSuccess','false'),(385,'chooseAvatarText','Choose your avatar'),(386,'stripeAcceptAliPay','false'),(387,'stripeAcceptBitCoin','false'),(388,'stripeLocale','auto'),(389,'customCartMessage','<p><br></p>'),(390,'customHomeMessage','<p><br></p>'),(391,'inAppCloseButton','Close'),(392,'inAppOpenLinkButton','Open'),(393,'iOSPWAPopupTitle','Add to Home Screen'),(394,'iOSPWAPopupBody','This website has app functionality. Add it to your home screen to use it in fullscreen and while offline.'),(395,'iOSPWAPopupShareButtonLabel','1) Press the \'Share\' button'),(396,'iOSPWAPopupAddButtonLabel','2) Press \'Add to Home Screen\''),(397,'iOSPWAPopupCloseButtonLabel','Cancel'),(398,'defaultEmailGateway','sendgrid'),(399,'enIOSPWAPopup','true'),(400,'offlineTitleMessage','You Are Offline'),(401,'offlineSubTitleMessage','Please check your internet connection.'),(402,'userInActiveMessage','You are banned from placing orders'),(403,'googleApiKeyNoRestriction','AIzaSyB_NxZ-7gwsKnnluTjBaicnIAZrOVIgg1w'),(404,'footerStyleType','FLOAT'),(405,'mockSearchOnHomepage','true'),(406,'mockSearchPlaceholder','Search for stores or items...'),(407,'tooManyApiCallMessage','Please try again in a minute...'),(408,'paymongoPK',NULL),(409,'paymongoSK',NULL),(410,'awaitingPaymentStatusText','Awaiting Payment'),(411,'paymentFailedStatusText','Payment Failed'),(412,'awaitingPaymentTitle','Awaiting Payment'),(413,'awaitingPaymentSubTitle','Awaiting payment from your bank. Order will be canceled if not processed in time.'),(414,'checkoutStripeIdealText','Stripe Ideal'),(415,'checkoutStripeIdealSubText','Pay with Ideal Netherlands'),(416,'checkoutStripeFpxText','Stripe FPX'),(417,'checkoutStripeFpxSubText','Pay with FPX Malaysia'),(418,'checkoutMercadoPagoText','MercadoPago'),(419,'checkoutMercadoPagoSubText','Pay with MerecadoPago for Brazil'),(420,'checkoutPayMongoText','Pay with PayMongo'),(421,'checkoutPayMongoSubText','Pay with PayMongo for Philippines'),(422,'checkoutPayText','Pay'),(423,'checkoutCardNumber','Card Number'),(424,'checkoutCardExpiration','Expiration'),(425,'checkoutCardCvv','CVV'),(426,'checkoutCardPostalCode','Postal Code'),(427,'checkoutCardFullname','Full Name'),(428,'checkoutIdealSelectBankText','Select Bank'),(429,'checkoutFpxSelectBankText','Select Bank'),(430,'mercadopagoAccessToken',NULL),(431,'stripeInlineCardCheckout','false'),(432,'stripeAcceptIdealPayment','false'),(433,'stripeAcceptFpxPayment','false'),(434,'stripeCheckoutPostalCode','true'),(435,'googleFullAddress','false'),(436,'couponNotLoggedin','Login to apply coupon'),(437,'checkoutPaytmText','Paytm'),(438,'checkoutPaytmSubText','Pay with Paytm Wallet | Credit/Debit Card'),(439,'paytm_environment','local'),(440,'paytm_merchant_id',NULL),(441,'paytm_merchant_key',NULL),(442,'paytm_merchant_website',NULL),(443,'paytm_channel',NULL),(444,'paytm_industry_type',NULL),(445,'showDeliveryCollection','true'),(446,'deliveryCollectionText','COD In-Hand'),(447,'allowPaymentGatewaySelection','false'),(448,'orderDetailsPaymentMode','Payment Mode: '),(449,'oneSignalAppId','f6befa3a-24a5-457f-a42a-834e99a9ae40'),(450,'oneSignalRestApiKey','YTRiNTc3NzMtZDVmMS00MzRkLWIzY2QtMzA4YjYxZjgxZGI0'),(451,'sortSelfpickupStoresByDistance','false'),(452,'deliveryEarningCommissionText','Commission: '),(453,'applyCouponButtonText','Apply'),(454,'countQuantityAsTotalItemsOnCart','false'),(455,'deliveryPickedupOrdersTitle','Picked-up Orders'),(456,'deliveryNoPickedupOrdersMsg','No Picked-up orders in queue.'),(457,'deliveryFooterPickedup','Picked-Up'),(458,'tips','10,20,30'),(459,'tips_percentage','2,5,10'),(460,'showTipsPercentage','false'),(461,'showTipsAmount','false'),(462,'tipText','Delivery Tip'),(463,'tipsForDeliveryText','Tip your delivery partner'),(464,'tipsThanksText','Thank your delivery partner for helping you stay safe indoors. Support them through these tough times with a tip.'),(465,'tipsOtherText','Other'),(466,'deliveryTipTransactionMessage','Delivery Tip: '),(467,'deliveryEarningTipText','Delivery Tip: '),(468,'deliveryEarningTotalEarningText','Total Earnings'),(469,'deliveryLastSevenDaysEarningTitle','Last 7 Days Earning'),(470,'cartRemoveTipText','Remove Tip'),(471,'cartTipAmountPlaceholderText','Tip Amount'),(472,'cartTipPercentagePlaceholderText','Tip percentage'),(473,'showTryItOnPhone','true'),(474,'desktopTryItOnPhoneTitle','Try it on your phone'),(475,'desktopTryItOnPhoneSubTitle','to get the ultimate experience.'),(476,'orderAmountPaidWithWallet','Paid with wallet'),(477,'orderAmountRemainingToPay','Amount remaining to pay'),(478,'deliveryToggleLightDarkMode','Toggle Light/Dark Mode'),(479,'flutterwavePublicKey',NULL),(480,'checkoutFlutterwaveText','Flutterwave'),(481,'checkoutFlutterwaveSubText','Pay with Flutterwave'),(482,'cartDeliveryTypeChangeButtonText','Change'),(483,'cartChooseDeliveryTypeTitle','Choose Delivery Type'),(484,'accountMyFavouriteStores','My Favourites'),(485,'favouriteStoresPageTitle','My Favourite Stores'),(486,'cartReplaceItemTitle','Replace items already in the cart?'),(487,'cartReplaceItemSubTitle','Your cart contains items from other store. Do you want to discard the selection and add items from this store?'),(488,'cartReplaceItemActionNo','No'),(489,'cartReplaceItemActionYes','Yes'),(490,'showAddonPricesOnCart','false'),(491,'cartDeliveryTypeOptionAvailableText','This store provides both Delivery and Self-Pickup options.'),(492,'cartDeliveryTypeSelectedText','You have selected'),(493,'showCustomerVatNumber','false'),(494,'accountTaxVatText','Tax/VAT Number'),(495,'customerVatSave','Save'),(496,'showPwaInstallPromptFooter','true'),(497,'pwaInstallFooterMessage','Would you like to install this application on your phone?'),(498,'pwaInstallFooterInstallText','Install'),(499,'msg91OtpDltTemplateId',NULL),(500,'msg91NewOrderDltTemplateId',NULL),(501,'msg91NewOrderDeliveryDltTemplateId',NULL),(502,'reviewsPageTitle','Reviews'),(503,'rarModRatingPageTitle','Rate your order'),(504,'rarModDeliveryRatingTitle','Rate the Delivery'),(505,'rarReviewBoxTitleDeliveryFeedback','Your Feedback'),(506,'rarModRestaurantRatingTitle','Rate the Store'),(507,'rarReviewBoxTitleStoreFeedback','Your Feedback'),(508,'rarReviewBoxTextPlaceHolderText','Your Feedback'),(509,'orderRateOrderButton','Rate Order'),(510,'ratingsRequiredMessage','Rating is required'),(511,'rarSubmitButtonText','Submit'),(512,'checkoutKhaltiText','Pay with Khalti'),(513,'checkoutKhaltiSubText','Pay with Credit/Debit Card or Khalti Wallet'),(514,'cashChangeTitle','Enter cash change amount'),(515,'cashChangeInputPlaceholder','Cash change amount'),(516,'cashChangeConfirmButton','Confirm'),(517,'cashChangeHelpText','Leave the field empty if you don\'t require any cash change for Cash On Delivery of your order.'),(518,'showCashChange','false'),(519,'khaltiPublicKey',NULL),(520,'khaltiSecretKey',NULL),(521,'sortDeliveryStoresByDistance','false'),(523,'enableStoreWhatsappNotification','false'),(525,'whatsappStore','Chegou um novo pedido !!!'),(526,'rarModEnHomeBanner','true'),(527,'rarModShowBannerRestaurantName','true'),(528,'rarModHomeBannerPosition','2'),(529,'rarModHomeBannerBgColor','rgb(255, 235, 59)'),(530,'rarModHomeBannerTextColor','rgb(0, 0, 0)'),(531,'rarModHomeBannerStarsColor','rgb(255, 162, 0)'),(532,'rarModHomeBannerText','Rate and Review'),(533,'rarReviewBoxTitle','Your Feedback');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;

--
-- Table structure for table `slides`
--

DROP TABLE IF EXISTS `slides`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `slides` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `promo_slider_id` int(11) NOT NULL,
  `unique_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image_placeholder` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `order_column` int(11) DEFAULT NULL,
  `model` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `restaurant_id` int(11) DEFAULT NULL,
  `is_locationset` tinyint(1) NOT NULL DEFAULT 0,
  `latitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `radius` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slides`
--

/*!40000 ALTER TABLE `slides` DISABLE KEYS */;
/*!40000 ALTER TABLE `slides` ENABLE KEYS */;

--
-- Table structure for table `sms_gateways`
--

DROP TABLE IF EXISTS `sms_gateways`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_gateways` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `gateway_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_gateways`
--

/*!40000 ALTER TABLE `sms_gateways` DISABLE KEYS */;
INSERT INTO `sms_gateways` VALUES (1,'MSG91','2021-10-15 12:17:00','2021-10-15 12:17:00'),(2,'TWILIO','2021-10-15 12:17:00','2021-10-15 12:17:00');
/*!40000 ALTER TABLE `sms_gateways` ENABLE KEYS */;

--
-- Table structure for table `sms_otps`
--

DROP TABLE IF EXISTS `sms_otps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sms_otps` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `otp` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sms_otps`
--

/*!40000 ALTER TABLE `sms_otps` DISABLE KEYS */;
/*!40000 ALTER TABLE `sms_otps` ENABLE KEYS */;

--
-- Table structure for table `store_payout_details`
--

DROP TABLE IF EXISTS `store_payout_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_payout_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `restaurant_id` int(11) NOT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_payout_details`
--

/*!40000 ALTER TABLE `store_payout_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_payout_details` ENABLE KEYS */;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transactions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `payable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payable_id` bigint(20) unsigned NOT NULL,
  `wallet_id` int(10) unsigned DEFAULT NULL,
  `type` enum('deposit','withdraw') COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` bigint(20) NOT NULL,
  `confirmed` tinyint(1) NOT NULL,
  `meta` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`meta`)),
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `transactions_uuid_unique` (`uuid`),
  KEY `transactions_payable_type_payable_id_index` (`payable_type`,`payable_id`),
  KEY `payable_type_ind` (`payable_type`,`payable_id`,`type`),
  KEY `payable_confirmed_ind` (`payable_type`,`payable_id`,`confirmed`),
  KEY `payable_type_confirmed_ind` (`payable_type`,`payable_id`,`type`,`confirmed`),
  KEY `transactions_type_index` (`type`),
  KEY `transactions_wallet_id_foreign` (`wallet_id`),
  CONSTRAINT `transactions_wallet_id_foreign` FOREIGN KEY (`wallet_id`) REFERENCES `wallets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;

--
-- Table structure for table `transfers`
--

DROP TABLE IF EXISTS `transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transfers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `from_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_id` bigint(20) unsigned NOT NULL,
  `to_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `to_id` bigint(20) unsigned NOT NULL,
  `status` enum('exchange','transfer','paid','refund','gift') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'transfer',
  `status_last` enum('exchange','transfer','paid','refund','gift') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `deposit_id` int(10) unsigned NOT NULL,
  `withdraw_id` int(10) unsigned NOT NULL,
  `discount` bigint(20) NOT NULL DEFAULT 0,
  `fee` bigint(20) NOT NULL DEFAULT 0,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `transfers_uuid_unique` (`uuid`),
  KEY `transfers_from_type_from_id_index` (`from_type`,`from_id`),
  KEY `transfers_to_type_to_id_index` (`to_type`,`to_id`),
  KEY `transfers_deposit_id_foreign` (`deposit_id`),
  KEY `transfers_withdraw_id_foreign` (`withdraw_id`),
  CONSTRAINT `transfers_deposit_id_foreign` FOREIGN KEY (`deposit_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `transfers_withdraw_id_foreign` FOREIGN KEY (`withdraw_id`) REFERENCES `transactions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transfers`
--

/*!40000 ALTER TABLE `transfers` DISABLE KEYS */;
/*!40000 ALTER TABLE `transfers` ENABLE KEYS */;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `language_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
INSERT INTO `translations` VALUES (1,'Português-BR','{\"desktopHeading\":\"Compre de lojas perto de voc\\u00ea\",\"desktopSubHeading\":\"<p><\\/p><p><\\/p><p><\\/p><h1><a href=\\\"http:\\/\\/meuappon.com\\\" target=\\\"_blank\\\" style=\\\"background-color: rgb(255, 255, 255); font-size: 0.9rem;\\\"><b style=\\\"color: rgb(0, 0, 0);\\\"><span style=\\\"font-family: Helvetica;\\\">Baixar app Android<\\/span><\\/b><\\/a><span style=\\\"font-size: 0.9rem;\\\">&nbsp;<\\/span><span style=\\\"font-size: 0.9rem;\\\">&nbsp; &nbsp;&nbsp;<\\/span><\\/h1><p><img src=\\\"data:image\\/png;base64,iVBORw0KGgoAAAANSUhEUgAAACoAAAAtCAYAAADYxvnjAAAACXBIWXMAAAsTAAALEwEAmpwYAAAF8WlUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNS42LWMxNDggNzkuMTY0MDM2LCAyMDE5LzA4LzEzLTAxOjA2OjU3ICAgICAgICAiPiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3JnLzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0iIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtbG5zOmRjPSJodHRwOi8vcHVybC5vcmcvZGMvZWxlbWVudHMvMS4xLyIgeG1sbnM6cGhvdG9zaG9wPSJodHRwOi8vbnMuYWRvYmUuY29tL3Bob3Rvc2hvcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZUV2ZW50IyIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgMjEuMCAoV2luZG93cykiIHhtcDpDcmVhdGVEYXRlPSIyMDIxLTA3LTE1VDE2OjMwOjI3LTAzOjAwIiB4bXA6TW9kaWZ5RGF0ZT0iMjAyMS0wNy0xNVQxNjozMTozMC0wMzowMCIgeG1wOk1ldGFkYXRhRGF0ZT0iMjAyMS0wNy0xNVQxNjozMTozMC0wMzowMCIgZGM6Zm9ybWF0PSJpbWFnZS9wbmciIHBob3Rvc2hvcDpDb2xvck1vZGU9IjMiIHBob3Rvc2hvcDpJQ0NQcm9maWxlPSJzUkdCIElFQzYxOTY2LTIuMSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDo2ODJlZGRkNC1mNDVjLTEyNDQtOTQyZC0zYWMzZmQxMDgxZDQiIHhtcE1NOkRvY3VtZW50SUQ9ImFkb2JlOmRvY2lkOnBob3Rvc2hvcDpjOGZiNDcwZC0yZDIzLTI0NDgtYjA4YS00OWNjMWY1ODc3Y2YiIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo5MzU5NzBjZi1iYWQ2LTIwNDQtYjE0My0wOWVlNTBhZDI4NjMiPiA8eG1wTU06SGlzdG9yeT4gPHJkZjpTZXE+IDxyZGY6bGkgc3RFdnQ6YWN0aW9uPSJjcmVhdGVkIiBzdEV2dDppbnN0YW5jZUlEPSJ4bXAuaWlkOjkzNTk3MGNmLWJhZDYtMjA0NC1iMTQzLTA5ZWU1MGFkMjg2MyIgc3RFdnQ6d2hlbj0iMjAyMS0wNy0xNVQxNjozMDoyNy0wMzowMCIgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWRvYmUgUGhvdG9zaG9wIDIxLjAgKFdpbmRvd3MpIi8+IDxyZGY6bGkgc3RFdnQ6YWN0aW9uPSJzYXZlZCIgc3RFdnQ6aW5zdGFuY2VJRD0ieG1wLmlpZDo2ODJlZGRkNC1mNDVjLTEyNDQtOTQyZC0zYWMzZmQxMDgxZDQiIHN0RXZ0OndoZW49IjIwMjEtMDctMTVUMTY6MzE6MzAtMDM6MDAiIHN0RXZ0OnNvZnR3YXJlQWdlbnQ9IkFkb2JlIFBob3Rvc2hvcCAyMS4wIChXaW5kb3dzKSIgc3RFdnQ6Y2hhbmdlZD0iLyIvPiA8L3JkZjpTZXE+IDwveG1wTU06SGlzdG9yeT4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+IDw\\/eHBhY2tldCBlbmQ9InIiPz6VCm5PAAAHTElEQVRYhc2Xe2xUxxWHv5nZ9e56DeaVAGlCwKTmbVMDMRgVEqVFSlIpoEJVHiJulFApldq0qlQhobYSClWF1LRpqgKBhKSlNBAT5Kqp1NAKCiQKAdvZNe+UR0KT1gQHdv3avffO6R93ba\\/BBuys7Zz9Y1f3zp359nd+c+4ZNf9tKRbjVA0pfvoeM6y6Spj7S4t7RnAwBABIkSKQ+SgUFttxLUgQi0UQFAoHB4vtuO7hYTCECAFg8DjBECqaGtj+wX5QkFnGD5X5lszvVuBO0CbI89jg9MSp3xe6iUefMNTUCHo9mNF8gUJ7inIdArwAyfiLkk4sigapXaehDsxaICr4n0EFBVrFgo4AYlQy\\/oJ1mh+UAHVjBLtBUEc1agUQHGxQDwABHQVURCdjmySd\\/LpniAOByUHCOzT6oCCPDiZoZ7Qra6M6GX9ZO4mHPE1NZmCwXLDVFvsmUD7QVtA3XOmANSpZ\\/zvlNi\\/0AtQgeIDWgn0YOGww24DxgwcKnTYgXydjm0g3PeQZ6vFtahDEBAk+YTC1FrsBuGNwQKFTWSkwyfhLOMmFnqEOv7iZTB2QYRa7VpA48H26VsQBAs2G9fJMMr5Fuc3zPUONfwMDgPIr9GjgN8ApYBmQ83J2c9B22HxAIjoR36Sc5gWZaqBveFyQiQECu4IE9wMVuYS9NahP4MPaobrTBjF8VU03k+qFBnPYYPYIUpIL4NsDhQ4biJtvkvGtymmeaw3H\\/H9xHWz7m0yjl4QIHTGYzYKMHxjQDKyJAjask7HNuC0VGWUVnd1EV2CFCmn0Gg8vLshaQYb3Rd\\/egWZgdRSwhToZ36bc5nnW92yw2+my+oQCF3eDYI8aeMrBRPoXNAvWOkN1IvYqTlO59UsXdOdZsu64qKIrBLcMs22HEBZ3k4gcggJ4vg3EDetk\\/Ra81lleoKPOdl29vbUMIMQZwYLUf1n\\/4XtlaN7A8BZQ0X+g4Hu2APAK9bXYNuW0VFj\\/DZbXZWqDkIclxgjKWy\\/bl08dlBHpdHs\\/9jUU+xH+CEzrH9AMrI6COMN1IvYqbvP9WcoaNIICahnJzLYr3vYzBxjqphVh6KhaQhDFSuBdhBeAUbkHhU4bOBGdiG9WbmuZZ6jLoML7jKAk9am39fS\\/VIHjaCJZkF0jCnwPIQb8ECjILShk2WCYvhZ7UdnWOTaf9znOSGamGr1tZw6qkW5KE+0RMjvGAr8CjgErUaDmH5WPgLtzBmxAEhAIX7UXZ\\/+cGfqQ7IjXq6Fttw3ZGQpIA0PYlHNQJRAQeG8MzIzVenuDFTLq\\/rYAl7IW720IidylPsMQSkN9EZR+dlH+9PSP1ajKMZqPo5ZJgEPvFAXf5B4\\/yxmoFgg6ECuG4ksX7N7l35BxzjsaPUHz2DSoz7dMxT+h2ducVPgHARag+XVOQBVgPKidCuMbPrGvr3qMOy6d1txbCuOuwuU8zbLpwtmwZTq+qjdTVqhDWIJiEXAQcrDrFRBKwfH7YMInV+zO1YsZ+\\/FZzdRZ4HngaJjSAo0hw9ISOBPylXW7ne5DFM+gmYewlyztPxeoEshLw4kiGNfwH3lj+cNq4vl6zaQycF2w1lfOVTClCRrzNEtK4HTEMplszyaBdQil+CeFtuvX6jOoEgh4UDcZ7kw2SPWKxeres7WK4hJwUiBZuRUgpeHLzfC\\/iGbpdM3xiH+AEbYiTAOeBa72tF6fQcNpODERxn6WYNfqJdx1Pk5HuqUHA6YVTG6C81F45r6\\/oSmjkKcQPrrVer0GVQLhFJyYAKOvfip7VjwixadqFFNn+am2N9vSGkSOMCK9CEc\\/gkdtv7R5SiDo+hunsO2K7F25RBXXv6OYNBOcNEg3kKqD5ANEVoAqB\\/UWwdutUX706hye58DxiTA01ULV6mUUHT8M02ZnNk2P9aYRkY3A86BaekXXF9BwGs7eA4VtzfJa5TeZEj+kmDHX96T1ug4WAaXasPYVtP4pSjVgbba6uQdVAnkunB4P+c412btqqZpS+0+YXu6XoBvT7aH1nxF5FjjZZ7Lr4pYezXPgZBEEVCt7Hv82U47sg8ll4Lkg3vXDDyDyALAql5C3BA2n4dzdEHZddld+i2nH9ilKy0Fr35cq87hScWAZ1j4AHMolYHt0m3qF\\/8b595dA6RZer1xO2dtvwoxyX0nr+aNELiDyHPASSjX1B2CPoIKf7tMTAJ3ir6tXUHqgGkpm+xvHL+gJjP4tIs8hcuXzbJI+gYqCSArO3eXfee3Jxyk9mIHUBlynFa13ILIRpc70O11PoJEUXBwNXshhd+VK5u2vgpK54DjgudVovR5rjw6Egt2BGvA787PjIB32qK5cxZy\\/74bSWeB572K9dRizb8DpskGtJhRpgwtjobUAqtY8yZx9u2DGV86hA7\\/ATW9H6+67xwEMXZjkZMNwSBXAzjXf4at\\/2d5IydwfgSnBdbaCGnRIgMCpIn4SSrHzDz\\/4rnpwz\\/adlJZtxJjLpNv8evkFif8DzfkT+sMwHa0AAAAASUVORK5CYII=\\\" data-filename=\\\"aaaa.png\\\" style=\\\"font-size: 0.9rem; width: 26.5px; height: 28.3929px;\\\"><span style=\\\"font-size: 14.4px;\\\">&nbsp;&nbsp;<\\/span><span style=\\\"font-size: 0.9rem;\\\"><br><\\/span><br><\\/p><p><\\/p><p><\\/p><p><\\/p>\",\"desktopUseAppButton\":\"Pedir agora\",\"desktopAchievementOneTitle\":\"Lojas\",\"desktopAchievementOneSub\":\"20+\",\"desktopAchievementTwoTitle\":\"Itens\",\"desktopAchievementTwoSub\":\"100+\",\"desktopAchievementThreeTitle\":\"Clientes\",\"desktopAchievementThreeSub\":\"200+\",\"desktopAchievementFourTitle\":\"Entregadores\",\"desktopAchievementFourSub\":\"40+\",\"desktopFooterAddress\":\"<p><span style=\\\"font-size: 14.4px;\\\"><font style=\\\"vertical-align: inherit;\\\"><font style=\\\"vertical-align: inherit;\\\">Buy Delivery | <\\/font><font style=\\\"vertical-align: inherit;\\\">Todos os direitos reservados.<\\/font><\\/font><\\/span><br><\\/p><p><font style=\\\"vertical-align: inherit;\\\"><font style=\\\"vertical-align: inherit;\\\"><a href=\\\"#\\\" target=\\\"_blank\\\">Termos e Condi\\u00e7\\u00f5es de uso<\\/a><\\/font><\\/font><\\/p><p><font style=\\\"vertical-align: inherit;\\\"><font style=\\\"vertical-align: inherit;\\\"><font style=\\\"vertical-align: inherit;\\\"><font style=\\\"vertical-align: inherit;\\\"><a href=\\\"#\\\" target=\\\"_blank\\\">Pol\\u00edtica de Privacidade<\\/a><\\/font><\\/font><br><\\/font><\\/font><br><\\/p>\",\"desktopFooterSocialHeader\":\"Nossas redes\",\"desktopSocialFacebookLink\":\"https:\\/\\/www.facebook.com\\/\",\"desktopSocialGoogleLink\":null,\"desktopSocialYoutubeLink\":null,\"desktopSocialInstagramLink\":\"https:\\/\\/www.instagram.com\\/\",\"gdprMessage\":\"<p><span style=\\\"font-size: 14.4px;\\\">Utilizamos cookies para oferecer o melhor servi\\u00e7o poss\\u00edvel. Ao continuar navegando em nosso site, voc\\u00ea concorda com o uso de cookies<\\/span><br><\\/p>\",\"gdprConfirmButton\":\"Ok\",\"changeLanguageText\":\"Mudar Idioma\",\"desktopTryItOnPhoneTitle\":\"Experimente no seu Telefone\",\"desktopTryItOnPhoneSubTitle\":\"Para obter a melhor experi\\u00eancia.\",\"firstScreenHeading\":\"Compre das melhores lojas da cidade\",\"firstScreenSubHeading\":\"Receba em minutos, t\\u00e1 pronto?\",\"firstScreenSetupLocation\":\"Sua localiza\\u00e7\\u00e3o\",\"firstScreenWelcomeMessage\":\"Bem vindo,\",\"firstScreenLoginText\":\"Tem uma conta?\",\"firstScreenLoginBtn\":\"Entrar\",\"loginErrorMessage\":\"Woopss!! Algo deu errado, tente novamente!\",\"pleaseWaitText\":\"Aguarde...\",\"loginLoginTitle\":\"ENTRAR\",\"loginLoginSubTitle\":\"Digite seu e-mail e senha\",\"loginLoginEmailLabel\":\"E-mail\",\"loginLoginPasswordLabel\":\"Senha\",\"loginDontHaveAccount\":\"Ainda n\\u00e3o tem conta?\",\"firstScreenRegisterBtn\":\"Cadastrar\",\"registerRegisterTitle\":\"Cadastrar\",\"registerRegisterSubTitle\":\"Cadastre-se gr\\u00e1tis j\\u00e1!\",\"loginLoginNameLabel\":\"Nome\",\"loginLoginPhoneLabel\":\"Telefone\",\"regsiterAlreadyHaveAccount\":\"J\\u00e1 tem uma conta?\",\"fieldValidationMsg\":\"Esse campo \\u00e9 necess\\u00e1rio.\",\"nameValidationMsg\":\"Digite seu nome completo.\",\"emailValidationMsg\":\"Digite um e-mail v\\u00e1lido.\",\"phoneValidationMsg\":\"Digite um telefone v\\u00e1lido nesse formato: +5591985580000\",\"minimumLengthValidationMessage\":\"Esse campo precisa ter ao menos 8 caracteres.\",\"emailPhoneAlreadyRegistered\":\"E-mail ou telefone j\\u00e1 registrado!\",\"emailPassDonotMatch\":\"E-mail e senha n\\u00e3o correspondem!\",\"enterPhoneToVerify\":\"Digite seu n\\u00famero de telefone para verifica\\u00e7\\u00e3o.\",\"invalidOtpMsg\":\"C\\u00f3digo inv\\u00e1lido, verifique e tente novamente\",\"otpSentMsg\":\"C\\u00f3digo enviado para\",\"resendOtpMsg\":\"Re-enviar c\\u00f3digo para\",\"resendOtpCountdownMsg\":\"Re-enviar c\\u00f3digo em\",\"verifyOtpBtnText\":\"Verificar c\\u00f3digo\",\"socialWelcomeText\":\"Ol\\u00e1\",\"socialLoginOrText\":\"OU\",\"forgotPasswordLinkText\":\"Esqueceu a senha?\",\"resetPasswordPageTitle\":\"Recuperar senha\",\"resetPasswordPageSubTitle\":\"Digite seu e-mail para continuar\",\"userNotFoundErrorMessage\":\"Nenhum usu\\u00e1rio encontrado\",\"invalidOtpErrorMessage\":\"C\\u00f3digo inv\\u00e1lido\",\"sendOtpOnEmailButtonText\":\"Enviar c\\u00f3digo ao e-mail\",\"alreadyHaveResetOtpButtonText\":\"Eu j\\u00e1 possuo um c\\u00f3digo\",\"dontHaveResetOtpButtonText\":\"Eu n\\u00e3o tenho um c\\u00f3digo\",\"enterResetOtpMessageText\":\"Digite o c\\u00f3digo enviado ao seu e-mail\",\"verifyResetOtpButtonText\":\"Verificar c\\u00f3digo\",\"enterNewPasswordText\":\"Digite uma nova senha abaixo\",\"newPasswordLabelText\":\"Nova senha\",\"setNewPasswordButtonText\":\"Definir nova senha\",\"registrationPolicyMessage\":null,\"customHomeMessage\":\"<p><br><\\/p>\",\"deliveryTypeDelivery\":\"Delivery\",\"deliveryTypeSelfPickup\":\"Vou buscar\",\"noRestaurantMessage\":\"Nenhuma loja dispon\\u00edvel\",\"restaurantCountText\":\"Lojas perto de voc\\u00ea\",\"restaurantFeaturedText\":\"DESTAQUE\",\"homePageMinsText\":\"MINS\",\"homePageForTwoText\":\"EM M\\u00c9DIA\",\"footerNearme\":\"Pr\\u00f3ximos\",\"footerExplore\":\"Explorar\",\"footerCart\":\"Carrinho\",\"footerAccount\":\"Conta\",\"footerAlerts\":\"Alertas\",\"exploreNoResults\":\"Nenhum item ou loja encontrados\",\"restaurantNotActiveMsg\":\"N\\u00e3o aceitando pedidos\",\"mockSearchPlaceholder\":\"Pesquise lojas ou itens ...\",\"pwaInstallFooterMessage\":\"Gostaria de instalar este aplicativo em seu telefone?\",\"pwaInstallFooterInstallText\":\"Instalar\",\"markAllAlertReadText\":\"Marcar todas como lidas\",\"noNewAlertsText\":\"Sem novos alertas\",\"restaurantSearchPlaceholder\":\"Procurar por lojas ou itens...\",\"exploreRestautantsText\":\"LOJAS\",\"exploreItemsText\":\"ITENS\",\"searchAtleastThreeCharsMsg\":\"Digite ao menos 3 caracteres para procurar.\",\"exlporeByRestaurantText\":\"Por\",\"recommendedBadgeText\":\"Recomendado\",\"popularBadgeText\":\"Popular\",\"newBadgeText\":\"Novo\",\"itemsPageRecommendedText\":\"RECOMENDADO\",\"floatCartViewCartText\":\"Ver carrinho\",\"floatCartItemsText\":\"Itens\",\"customizableItemText\":\"Selecione..\",\"customizationHeading\":\"Adicionar\",\"customizationDoneBtnText\":\"Continuar\",\"pureVegText\":\"Vegetariano\",\"certificateCodeText\":\"Certificado\",\"showMoreButtonText\":\"Mostrar mais\",\"showLessButtonText\":\"Mostrar menos\",\"notAcceptingOrdersMsg\":\"N\\u00e3o aceitando pedidos no momento\",\"itemSearchPlaceholder\":\"Procure por itens...\",\"itemSearchText\":\"Resultados para:\",\"itemSearchNoResultText\":\"Nenhum resultado para:\",\"itemsMenuButtonText\":\"CATEGORIAS\",\"itemPercentageDiscountText\":\"% DESC\",\"customCartMessage\":\"<p><br><\\/p>\",\"cartPageTitle\":\"Carrinho\",\"cartItemsInCartText\":\"Itens no carrinho\",\"cartEmptyText\":\"Seu carrinho est\\u00e1 vazio\",\"cartSuggestionPlaceholder\":\"Gostaria de adicionar uma observa\\u00e7\\u00e3o para a loja?\",\"cartCouponText\":\"Cupom\",\"cartApplyCoupon\":\"Aplicar cupom\",\"cartInvalidCoupon\":\"Cupom inv\\u00e1lido\",\"cartCouponOffText\":\"OFF\",\"couponNotLoggedin\":\"Fa\\u00e7a o Login para aplicar o cupom\",\"applyCouponButtonText\":\"Aplicar\",\"cartBillDetailsText\":\"Detalhes da compra\",\"cartItemTotalText\":\"Total dos itens\",\"cartToPayText\":\"A pagar\",\"cartDeliveryCharges\":\"Taxas de entrega\",\"cartRestaurantCharges\":\"Taxas da loja\",\"cartSetYourAddress\":\"Defina seu endere\\u00e7o\",\"buttonNewAddress\":\"Novo endere\\u00e7o\",\"cartChangeLocation\":\"Mudar\",\"cartDeliverTo\":\"Entregar em\",\"checkoutSelectPayment\":\"Selecionar m\\u00e9todo de pagamento\",\"cartLoginHeader\":\"Quase l\\u00e1\",\"cartLoginSubHeader\":\"Entre ou cadastre-se para fazer seu pedido\",\"cartLoginButtonText\":\"Continuar\",\"selectedSelfPickupMessage\":\"Voc\\u00ea optou por buscar.\",\"taxText\":\"Taxa\",\"itemsRemovedMsg\":\"Os itens adicionados na loja anterior foram removidos.\",\"ongoingOrderMsg\":\"Voc\\u00ea tem alguns pedidos em andamento. VER\",\"cartRestaurantNotOperational\":\"A loja n\\u00e3o est\\u00e1 operacional no local selecionado.\",\"restaurantMinOrderMessage\":\"O valor m\\u00ednimo do pedido \\u00e9\",\"cartRemoveItemButton\":\"Remover Item\",\"cartItemNotAvailable\":\"Item n\\u00e3o dispon\\u00edvel\",\"orderTextTotal\":\"Total:\",\"tipText\":\"Gorjeta do Entregador\",\"tipsForDeliveryText\":\"D\\u00ca UMA GORJETA AO SEU ENTREGADOR\",\"tipsThanksText\":\"Agrade\\u00e7a ao seu parceiro de entrega por ajud\\u00e1-lo a se manter seguro dentro de casa. Apoie-os nestes tempos dif\\u00edceis \\u2665\",\"tipsOtherText\":\"Outro valor\",\"deliveryTipTransactionMessage\":\"Gorjeta do Entregador:\",\"cartRemoveTipText\":\"Remover Gorjeta\",\"cartTipAmountPlaceholderText\":\"Valor da gorjeta\",\"cartTipPercentagePlaceholderText\":\"Porcentagem da gorjeta\",\"orderAmountPaidWithWallet\":\"Pago com carteira\",\"orderAmountRemainingToPay\":\"Quantia restante a pagar\",\"cartDeliveryTypeOptionAvailableText\":\"Esta loja oferece op\\u00e7\\u00f5es de entrega e auto-retirada.\",\"cartDeliveryTypeSelectedText\":\"Voc\\u00ea selecionou\",\"cartDeliveryTypeChangeButtonText\":\"Mudar\",\"cartChooseDeliveryTypeTitle\":\"Escolha o tipo de entrega\",\"cartReplaceItemTitle\":\"Substituir itens que j\\u00e1 est\\u00e3o no carrinho?\",\"cartReplaceItemSubTitle\":\"Seu carrinho cont\\u00e9m itens de outra loja. Quer descartar a sele\\u00e7\\u00e3o e adicionar itens desta loja?\",\"cartReplaceItemActionNo\":\"N\\u00e3o\",\"cartReplaceItemActionYes\":\"Sim\",\"checkoutPageTitle\":\"Finalizar\",\"checkoutPaymentListTitle\":\"Selecione seu m\\u00e9todo de pagamento preferido\",\"checkoutPaymentInProcess\":\"Pagamento em processo. N\\u00e3o aperte atualizar ou voltar.\",\"checkoutStripeText\":\"Stripe\",\"checkoutStripeSubText\":\"D\\u00e9bito online\",\"checkoutCodText\":\"Dinheiro\",\"checkoutCodSubText\":\"Facilite a vida dos nossos queridos entregadores, esteja com o dinheiro trocado por favor \\u2665\",\"paystackPayText\":\"Pay with PayStack\",\"checkoutPaytmText\":\"Paytm\",\"checkoutPaytmSubText\":\"Pay with Paytm Wallet | Credit\\/Debit Card\",\"checkoutRazorpayText\":\"Razorpay\",\"checkoutRazorpaySubText\":\"Pay with cards, wallet or UPI\",\"userInActiveMessage\":\"You are banned from placing orders\",\"tooManyApiCallMessage\":\"Please try again in a minute...\",\"checkoutStripeIdealText\":\"Stripe Ideal\",\"checkoutStripeIdealSubText\":\"Pay with Ideal Netherlands\",\"checkoutStripeFpxText\":\"Stripe FPX\",\"checkoutStripeFpxSubText\":\"Pay with FPX Malaysia\",\"checkoutMercadoPagoText\":\"MercadoPago\",\"checkoutMercadoPagoSubText\":\"Pagamento online\",\"checkoutPayMongoText\":\"Pay with PayMongo\",\"checkoutPayMongoSubText\":\"Pay with PayMongo for Philippines\",\"checkoutPayText\":\"Pagar\",\"checkoutCardNumber\":\"N\\u00famero do Cart\\u00e3o\",\"checkoutCardExpiration\":\"Data de Expira\\u00e7\\u00e3o do Cart\\u00e3o\",\"checkoutCardCvv\":\"CVV\",\"checkoutCardPostalCode\":\"C\\u00f3digo Postal\",\"checkoutCardFullname\":\"Nome Completo\",\"checkoutIdealSelectBankText\":\"Selecionar Banco\",\"checkoutFpxSelectBankText\":\"Selecionar Banco\",\"checkoutFlutterwaveText\":\"Flutterwave\",\"checkoutFlutterwaveSubText\":\"Pay with Flutterwave\",\"checkoutKhaltiText\":\"Pay with Khalti\",\"checkoutKhaltiSubText\":\"Pay with Credit\\/Debit Card or Khalti Wallet\",\"cashChangeTitle\":\"Enter cash change amount\",\"cashChangeInputPlaceholder\":\"Cash change amount\",\"cashChangeConfirmButton\":\"Confirm\",\"cashChangeHelpText\":\"Leave the field empty if you don\'t require any cash change for Cash On Delivery of your order.\",\"runningOrderPlacedTitle\":\"Pedido realizado com sucesso\",\"runningOrderPlacedSub\":\"Aguardando confirma\\u00e7\\u00e3o da loja.\",\"runningOrderPreparingTitle\":\"Pedido confirmado!\",\"runningOrderPreparingSub\":\"J\\u00e1 estamos embalando seu produto!\",\"runningOrderOnwayTitle\":\"ooopaa!!\",\"runningOrderOnwaySub\":\"Pedido recolhido, \\u00e0 caminho!\",\"runningOrderDeliveryAssignedTitle\":\"Entregador atribu\\u00eddo\",\"runningOrderDeliveryAssignedSub\":\"No caminho pra pegar seu pedido.\",\"runningOrderCanceledTitle\":\"Pedido cancelado\",\"runningOrderCanceledSub\":\"Desculpe. Seu pedido foi cancelado.\",\"runningOrderReadyForPickup\":\"O produto est\\u00e1 pronto\",\"runningOrderReadyForPickupSub\":\"Seu pedido est\\u00e1 pronto para a retirada.\",\"awaitingPaymentStatusText\":\"Aguardando Pagamento\",\"paymentFailedStatusText\":\"Pagamento falhou\",\"runningOrderDelivered\":\"Pedido entregue\",\"runningOrderDeliveredSub\":\"O pedido foi entregue a voc\\u00ea.\",\"runningOrderRefreshButton\":\"Atualizar status do pedido\",\"deliveryGuyAfterName\":\"\\u00e9 seu entregador hoje.\",\"vehicleText\":\"Ve\\u00edculo:\",\"callNowButton\":\"Ligar agora\",\"allowLocationAccessMessage\":\"Permita o acesso \\u00e0 localiza\\u00e7\\u00e3o para rastreamento ao vivo.\",\"trackOrderText\":\"Acompanhar Pedido\",\"orderPlacedStatusText\":\"Pedido realizado\",\"preparingOrderStatusText\":\"Chamando Entregador\",\"deliveryGuyAssignedStatusText\":\"Entregador atribu\\u00eddo\",\"orderPickedUpStatusText\":\"Pedido recolhido\",\"deliveredStatusText\":\"Entregue\",\"canceledStatusText\":\"Cancelado\",\"readyForPickupStatusText\":\"Pronto para retirar\",\"deliveryGuyNewOrderNotificationMsg\":\"Novo pedido aguardando!\",\"deliveryGuyNewOrderNotificationMsgSub\":\"Notifica\\u00e7\\u00e3o de novo pedido\",\"runningOrderDeliveryPin\":\"Pin de entrega:\",\"awaitingPaymentTitle\":\"Aguardando Pagamento\",\"awaitingPaymentSubTitle\":\"Aguardando pagamento de seu banco. O pedido ser\\u00e1 cancelado se n\\u00e3o for processado a tempo.\",\"orderDetailsPaymentMode\":\"Modo de pagamento:\",\"accountMyAccount\":\"Minha Conta\",\"accountManageAddress\":\"Gerenciar endere\\u00e7os\",\"addressDoesnotDeliverToText\":\"N\\u00e3o entrega para\",\"accountMyOrders\":\"Meus pedidos \\/ Acompanhar entrega\",\"accountHelpFaq\":\"P\\u00e1ginas\",\"accountLogout\":\"Sair\",\"accountMyWallet\":\"Carteira\",\"noOrdersText\":\"Voc\\u00ea ainda n\\u00e3o fez nenhum pedido\",\"orderCancelledText\":\"Pedido cancelado\",\"chooseAvatarText\":\"Escolha seu Avatar\",\"accountMyFavouriteStores\":\"Meus Favoritos\",\"favouriteStoresPageTitle\":\"Minhas Lojas Favoritas\",\"accountTaxVatText\":\"Tax\\/VAT Number\",\"customerVatSave\":\"Salvar\",\"searchAreaPlaceholder\":\"Procure seu bairro...\",\"searchPopularPlaces\":\"Lugares populares\",\"useCurrentLocationText\":\"Usar Localiza\\u00e7\\u00e3o Atual\",\"gpsAccessNotGrantedMsg\":\"Acesso ao GPS n\\u00e3o aceito! (permita acesso a localiza\\u00e7\\u00e3o).\",\"yourLocationText\":\"LOCAL APROXIMADO\",\"editAddressAddress\":\"SEU ENDERE\\u00c7O\",\"editAddressTag\":\"TAG\",\"addressTagPlaceholder\":\"Casa, Trabalho etc.\",\"buttonSaveAddress\":\"Salvar endere\\u00e7o\",\"locationSavedAddresses\":\"Endere\\u00e7os salvos\",\"deleteAddressText\":\"Deletar\",\"noAddressText\":\"Voc\\u00ea n\\u00e3o tem nenhum endere\\u00e7o salvo.\",\"noWalletTransactionsText\":\"Ainda n\\u00e3o h\\u00e1 transa\\u00e7\\u00f5es com a Carteira!!!\",\"walletDepositText\":\"Dep\\u00f3sito\",\"walletWithdrawText\":\"Saque\",\"payPartialWithWalletText\":\"Pagar valor parcial com a Carteira\",\"willbeDeductedText\":\"ser\\u00e1 descontado do seu saldo de\",\"payFullWithWalletText\":\"Pague o valor total com sua Carteira Digital\",\"orderPaymentWalletComment\":\"Pagamento pelo pedido:\",\"orderPartialPaymentWalletComment\":\"Pagamento parcial pelo pedido:\",\"orderRefundWalletComment\":\"Reembolso pelo cancelamento do pedido.\",\"orderPartialRefundWalletComment\":\"Reembolso parcial para cancelamento de pedidos.\",\"walletRedeemBtnText\":\"Resgatar\",\"cancelOrderMainButton\":\"Cancelar pedido\",\"willBeRefundedText\":\"\\u00e9 o valor do pedido\",\"willNotBeRefundedText\":\"Nenhum reembolso ser\\u00e1 feito em sua Carteira, pois a loja j\\u00e1 preparou o pedido.\",\"orderCancellationConfirmationText\":\"Deseja cancelar este pedido?\",\"yesCancelOrderBtn\":\"Sim, cancelar pedido\",\"cancelGoBackBtn\":\"Voltar\",\"deliveryWelcomeMessage\":\"Bem vindo\",\"deliveryAcceptedOrdersTitle\":\"Pedidos aceitos\",\"deliveryNoOrdersAccepted\":\"Nenhum pedido aceito ainda\",\"deliveryNewOrdersTitle\":\"Novos pedidos\",\"deliveryNoNewOrders\":\"Nenhum pedido novo\",\"deliveryPickedupOrdersTitle\":\"Pedidos recolhidos\",\"deliveryNoPickedupOrdersMsg\":\"Pedidos recolhidos na fila\",\"deliveryOrderItems\":\"Itens do pedido\",\"deliveryRestaurantAddress\":\"Endere\\u00e7o da loja\",\"deliveryDeliveryAddress\":\"Endere\\u00e7o da entrega\",\"deliveryGetDirectionButton\":\"Ver no mapa\",\"deliveryOnlinePayment\":\"Pagamento online\",\"deliveryCashOnDelivery\":\"Valor do Pedido\",\"deliveryDeliveryPinPlaceholder\":\"INSERIR PIN DE ENTREGA (pe\\u00e7a sempre para o cliente)\",\"deliveryAcceptOrderButton\":\"Aceitar\",\"deliveryPickedUpButton\":\"J\\u00e1 peguei!\",\"deliveryDeliveredButton\":\"Entreguei!\",\"deliveryOrderCompletedButton\":\"Pedido completo\",\"deliveryAlreadyAccepted\":\"Essa entrega j\\u00e1 foi aceita por algu\\u00e9m.\",\"deliveryInvalidDeliveryPin\":\"PIN incorreto, tente novamente!\",\"deliveryLogoutDelivery\":\"Sair\",\"deliveryLogoutConfirmation\":\"Tem certeza?\",\"deliveryOrdersRefreshBtn\":\"Atualizar\",\"deliveryOrderPlacedText\":\"Pedido realizado\",\"deliveryFooterNewTitle\":\"Novos pedidos\",\"deliveryFooterAcceptedTitle\":\"Aceito\",\"deliveryFooterPickedup\":\"Peguei\",\"deliveryFooterAccount\":\"Minha conta\",\"deliveryEarningsText\":\"Ganhos\",\"deliveryCollectionText\":\"DINHEIRO em m\\u00e3os\",\"deliveryOnGoingText\":\"Em andamento\",\"deliveryCompletedText\":\"Completo\",\"deliveryCommissionMessage\":\"Comiss\\u00e3o de pedidos:\",\"updatingMessage\":\"Atualizando sistema\",\"categoriesFiltersText\":\"Filtros\",\"categoriesNoRestaurantsFoundText\":\"Nenhuma loja encontrada.\",\"deliveryTotalEarningsText\":\"Ganhos Totais\",\"deliveryUsePhoneToAccessMsg\":\"Use seu celular para acessar a p\\u00e1gina de entregador..\",\"deliveryMaxOrderReachedMsg\":\"Limite m\\u00e1ximo de pedido atingido\",\"deliveryEarningCommissionText\":\"Taxa de Entrega\",\"deliveryEarningTipText\":\"Sua gorjeta:\",\"deliveryEarningTotalEarningText\":\"Ganhos totais\",\"deliveryLastSevenDaysEarningTitle\":\"Ganhos dos \\u00faltimos 7 dias\",\"deliveryToggleLightDarkMode\":\"Alternar modo claro \\/ escuro\",\"inAppCloseButton\":\"Fechar\",\"inAppOpenLinkButton\":\"Abrir\",\"iOSPWAPopupTitle\":\"Adicionar \\u00e0 tela inicial\",\"iOSPWAPopupBody\":\"Este site possui funcionalidade de aplicativo. Adicione-o \\u00e0 sua tela inicial para us\\u00e1-lo em tela cheia e offline.\",\"iOSPWAPopupShareButtonLabel\":\"1) Pressione o bot\\u00e3o \'Compartilhar\'\",\"iOSPWAPopupAddButtonLabel\":\"2) Pressione \'Adicionar \\u00e0 tela inicial\'\",\"iOSPWAPopupCloseButtonLabel\":\"Cancelar\",\"offlineTitleMessage\":\"Voc\\u00ea est\\u00e1 offline\",\"offlineSubTitleMessage\":\"Por favor, verifique sua conex\\u00e3o \\u00e0 internet.\",\"orderRateOrderButton\":\"Avaliar Pedido\",\"reviewsPageTitle\":\"Reviews\",\"rarModRatingPageTitle\":\"Avalie seu pedido\",\"rarModDeliveryRatingTitle\":\"Avalie o entregador\",\"rarReviewBoxTitleDeliveryFeedback\":\"Seu Feedback\",\"rarModRestaurantRatingTitle\":\"Avalie a loja\",\"rarReviewBoxTitleStoreFeedback\":\"Seu Feedback\",\"rarReviewBoxTextPlaceHolderText\":\"Seu Feedback\",\"ratingsRequiredMessage\":\"Classifica\\u00e7\\u00e3o \\u00e9 obrigat\\u00f3ria\",\"rarSubmitButtonText\":\"Enviar\"}','2020-12-15 03:12:40','2021-10-15 16:02:13',1,1);
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `auth_token` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_address_id` int(11) DEFAULT 0,
  `delivery_pin` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery_guy_detail_id` int(11) DEFAULT NULL,
  `avatar` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_ip` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','admin@apphotboxdelivery.com.br',NULL,'$2y$10$HeISWCsmUFHzAdL5iPY.EOavriqnCX9BCu63LrDCk91WzktXfEdx6','CuiKXlObQQmglNA4h6Or49HpOESCbLKANntlqUBMWHsIWs8iAYm2QOCDYNRH','2021-10-15 12:16:59','2021-10-15 12:16:59',NULL,NULL,0,'Z2RAT',NULL,NULL,1,NULL,NULL),(2,'Teste','flipnoar@gmail.com',NULL,'$2y$10$Sx0iHmhwcE3IGYTXJC8iOOlODsM4ePXcV6lx6P2VZEXyvldA7uuse',NULL,'2021-10-15 15:11:01','2021-10-15 15:11:01','eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2FwcGhvdGJveGRlbGl2ZXJ5LmNvbS5ici9wdWJsaWMvYXBpL3JlZ2lzdGVyIiwiaWF0IjoxNjM0MzIxNDYxLCJuYmYiOjE2MzQzMjE0NjEsImp0aSI6InRYRWU4Rmw0UDZhQmJ2aE4iLCJzdWIiOjIsInBydiI6Ijg3ZTBhZjFlZjlmZDE1ODEyZmRlYzk3MTUzYTE0ZTBiMDQ3NTQ2YWEifQ.4NoD04xuLBh0VO3117c8ANtOiq0Kg3ZicizzLuD_zNg','+5571953442210',1,'C2ZKP',NULL,NULL,1,NULL,NULL),(3,'Teste entregado','hotboxadm@gmail.com',NULL,'$2y$10$6f9MaUUsRKVJ0h.lbBIqeeDWaSS8w1WokJ5U02e.7ARd/9QWqFtCu',NULL,'2021-10-15 15:14:20','2021-10-15 15:14:20',NULL,'71955221423',0,'2WFL1',1,NULL,1,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

--
-- Table structure for table `wallets`
--

DROP TABLE IF EXISTS `wallets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wallets` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `holder_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `holder_id` bigint(20) unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `balance` bigint(20) NOT NULL DEFAULT 0,
  `decimal_places` smallint(6) NOT NULL DEFAULT 2,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wallets_holder_type_holder_id_slug_unique` (`holder_type`,`holder_id`,`slug`),
  KEY `wallets_holder_type_holder_id_index` (`holder_type`,`holder_id`),
  KEY `wallets_slug_index` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wallets`
--

/*!40000 ALTER TABLE `wallets` DISABLE KEYS */;
INSERT INTO `wallets` VALUES (1,'App\\User',2,'Default Wallet','default',NULL,0,2,'2021-10-15 15:11:01','2021-10-15 15:11:01');
/*!40000 ALTER TABLE `wallets` ENABLE KEYS */;

--
-- Dumping routines for database 'u715497105_aplicativo'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-07  1:13:29
