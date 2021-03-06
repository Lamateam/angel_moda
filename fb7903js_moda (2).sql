-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Фев 22 2016 г., 04:32
-- Версия сервера: 5.5.47-0ubuntu0.14.04.1
-- Версия PHP: 5.5.9-1ubuntu4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `fb7903js_moda`
--

-- --------------------------------------------------------

--
-- Структура таблицы `ma_address`
--

CREATE TABLE IF NOT EXISTS `ma_address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `company` varchar(40) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Дамп данных таблицы `ma_address`
--

INSERT INTO `ma_address` (`address_id`, `customer_id`, `firstname`, `lastname`, `company`, `address_1`, `address_2`, `city`, `postcode`, `country_id`, `zone_id`, `custom_field`) VALUES
(1, 1, 'test', 'test', '', 'test', '', 'test', '', 176, 51, ''),
(2, 2, '', '', '', '', '', '', '', 0, 0, ''),
(3, 3, 'Nikita', '01', '', '', '', '', '', 0, 0, ''),
(4, 4, 'Nikita', '01', '', '', '', '', '', 0, 0, ''),
(5, 5, 'Nikita', '01', '', '', '', '', '', 0, 0, ''),
(6, 6, 'Nikita', '01', '', '', '', '', '', 0, 0, ''),
(7, 8, 'Дмитрий', 'Шмаков', 'Москва', 'akget', '', 'Город', '', 80, 13, ''),
(8, 9, 'Дмитрий', 'Шмаков', 'Москва', 'akget', '', 'Город', '', 80, 13, ''),
(9, 10, 'Дмитрий', 'Шмаков', '', '2243', '', 'Moscow', '', 109, 20, ''),
(10, 11, 'Дмитрий', 'Шмаков', '', '123432', '', 'Moscow', '', 80, 11, ''),
(11, 12, 'Дмитрий', 'Шмаков', '', '234132', '', 'Moscow', '', 109, 23, ''),
(12, 13, 'Дмитрий', 'Шмаков', '', '2413314', '', '2314342', '', 115, 40, ''),
(13, 14, 'Maria', 'Chamaeva', '', 'test', '', 'test', '', 80, 18, '');

-- --------------------------------------------------------

--
-- Структура таблицы `ma_affiliate`
--

CREATE TABLE IF NOT EXISTS `ma_affiliate` (
  `affiliate_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `company` varchar(40) NOT NULL,
  `website` varchar(255) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `commission` decimal(4,2) NOT NULL DEFAULT '0.00',
  `tax` varchar(64) NOT NULL,
  `payment` varchar(6) NOT NULL,
  `cheque` varchar(100) NOT NULL,
  `paypal` varchar(64) NOT NULL,
  `bank_name` varchar(64) NOT NULL,
  `bank_branch_number` varchar(64) NOT NULL,
  `bank_swift_code` varchar(64) NOT NULL,
  `bank_account_name` varchar(64) NOT NULL,
  `bank_account_number` varchar(64) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ma_affiliate_activity`
--

CREATE TABLE IF NOT EXISTS `ma_affiliate_activity` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ma_affiliate_login`
--

CREATE TABLE IF NOT EXISTS `ma_affiliate_login` (
  `affiliate_login_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`affiliate_login_id`),
  KEY `email` (`email`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ma_affiliate_transaction`
--

CREATE TABLE IF NOT EXISTS `ma_affiliate_transaction` (
  `affiliate_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ma_api`
--

CREATE TABLE IF NOT EXISTS `ma_api` (
  `api_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `key` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`api_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `ma_api`
--

INSERT INTO `ma_api` (`api_id`, `name`, `key`, `status`, `date_added`, `date_modified`) VALUES
(1, 'Default', 'HRHqeBUIHxihPWDHuONwDzLF1S8LSR3k3u6qM8gkzlXPSepD9FXeF6RcB7KCq4OhvDKxav1N1etY4Q892Vc9agXMfCOEaSkZgHldEWxw2ArHulHSzwvms9C9VyfWCsnQ0YAlY2edLaJXsJoHrN1V5sd8KR3xSHUfVKNvDxqIMBRRviHtKe0qnhUIsMbK0F2ZNFTQInsSrrvUugerO0wSEn1v2OimyJhHkICydQCzcsSv8cGv4fDRiYKZX3nJqQPr', 1, '2016-01-11 14:13:11', '2016-01-11 14:13:11');

-- --------------------------------------------------------

--
-- Структура таблицы `ma_api_ip`
--

CREATE TABLE IF NOT EXISTS `ma_api_ip` (
  `api_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `api_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  PRIMARY KEY (`api_ip_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `ma_api_ip`
--

INSERT INTO `ma_api_ip` (`api_ip_id`, `api_id`, `ip`) VALUES
(1, 1, '109.252.67.151'),
(2, 1, '127.0.0.1');

-- --------------------------------------------------------

--
-- Структура таблицы `ma_api_session`
--

CREATE TABLE IF NOT EXISTS `ma_api_session` (
  `api_session_id` int(11) NOT NULL AUTO_INCREMENT,
  `api_id` int(11) NOT NULL,
  `token` varchar(32) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `session_name` varchar(32) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`api_session_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `ma_api_session`
--

INSERT INTO `ma_api_session` (`api_session_id`, `api_id`, `token`, `session_id`, `session_name`, `ip`, `date_added`, `date_modified`) VALUES
(1, 1, 'bcsNvdTSlsdsVXYREJVslxcUhmH7moAy', '65082a4ab8da2c2e0b362379b20f9d26', 'temp_session_56bcd5f980acb', '109.252.67.151', '2016-02-11 21:42:01', '2016-02-11 21:42:01'),
(2, 1, 'p6wBK277fEbrRQEmnV3xwhydlxdYjv9T', 'g4lpu2q8loa36h8n229r0mvdm1', 'temp_session_56c7558a5deb9', '127.0.0.1', '2016-02-19 20:48:58', '2016-02-19 20:48:58'),
(3, 1, 'NdMvRrf2G0DyG1QanYnXJhHDsyzeAmRJ', 'g4lpu2q8loa36h8n229r0mvdm1', 'temp_session_56c757d605d23', '127.0.0.1', '2016-02-19 20:58:46', '2016-02-19 20:58:46'),
(4, 1, 'pS9h8bFyzzPVu50kJIMUAJiX3FmjZdXy', 'g4lpu2q8loa36h8n229r0mvdm1', 'temp_session_56c75e8f516d1', '127.0.0.1', '2016-02-19 21:27:27', '2016-02-19 21:27:27');

-- --------------------------------------------------------

--
-- Структура таблицы `ma_attribute`
--

CREATE TABLE IF NOT EXISTS `ma_attribute` (
  `attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Дамп данных таблицы `ma_attribute`
--

INSERT INTO `ma_attribute` (`attribute_id`, `attribute_group_id`, `sort_order`) VALUES
(16, 7, 0),
(15, 7, 0),
(14, 7, 0),
(13, 7, 0),
(12, 7, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `ma_attribute_description`
--

CREATE TABLE IF NOT EXISTS `ma_attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ma_attribute_description`
--

INSERT INTO `ma_attribute_description` (`attribute_id`, `language_id`, `name`) VALUES
(16, 1, 'Рекомендации по уходу'),
(14, 1, 'Особенности модели'),
(13, 2, 'Materials'),
(12, 2, 'Production'),
(15, 2, 'Colour'),
(15, 1, 'Цвет'),
(14, 2, 'Model features'),
(13, 1, 'Материалы'),
(12, 1, 'Производство'),
(16, 2, 'Recommendations for care');

-- --------------------------------------------------------

--
-- Структура таблицы `ma_attribute_group`
--

CREATE TABLE IF NOT EXISTS `ma_attribute_group` (
  `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Дамп данных таблицы `ma_attribute_group`
--

INSERT INTO `ma_attribute_group` (`attribute_group_id`, `sort_order`) VALUES
(7, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `ma_attribute_group_description`
--

CREATE TABLE IF NOT EXISTS `ma_attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`attribute_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ma_attribute_group_description`
--

INSERT INTO `ma_attribute_group_description` (`attribute_group_id`, `language_id`, `name`) VALUES
(7, 2, 'Attributes of product'),
(7, 1, 'Атрибуты товара');

-- --------------------------------------------------------

--
-- Структура таблицы `ma_banner`
--

CREATE TABLE IF NOT EXISTS `ma_banner` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`banner_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Дамп данных таблицы `ma_banner`
--

INSERT INTO `ma_banner` (`banner_id`, `name`, `status`) VALUES
(6, 'HP Products', 1),
(7, 'Home Page Slideshow', 1),
(8, 'Manufacturers', 1),
(9, 'Баннеры на главной странице', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `ma_banner_image`
--

CREATE TABLE IF NOT EXISTS `ma_banner_image` (
  `banner_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_id` int(11) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `has_end_date` int(11) NOT NULL,
  `end_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `is_html` int(11) NOT NULL,
  PRIMARY KEY (`banner_image_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=188 ;

--
-- Дамп данных таблицы `ma_banner_image`
--

INSERT INTO `ma_banner_image` (`banner_image_id`, `banner_id`, `link`, `image`, `sort_order`, `has_end_date`, `end_date`, `is_html`) VALUES
(120, 6, 'index.php?route=product/manufacturer/info&amp;manufacturer_id=7', 'catalog/demo/compaq_presario.jpg', 0, 0, '0000-00-00 00:00:00', 0),
(182, 8, 'marina-yachting', 'catalog/marina-yachting.png', 12, 0, '0000-00-00 00:00:00', 0),
(183, 8, 'met', 'catalog/met.jpg', 13, 0, '0000-00-00 00:00:00', 0),
(184, 8, 'severi-darling', 'catalog/severi-darling.jpg', 14, 0, '0000-00-00 00:00:00', 0),
(185, 8, 'vdp', 'catalog/VDP.png', 15, 0, '0000-00-00 00:00:00', 0),
(181, 8, 'maria-grazia-severi', 'catalog/Maria Grazia Severi.jpg', 11, 0, '0000-00-00 00:00:00', 0),
(180, 8, 'kuss', 'catalog/KUSS.png', 10, 0, '0000-00-00 00:00:00', 0),
(179, 8, 'fly-girl-brand', 'catalog/logo2 FLY GIRL groot.jpg', 9, 0, '0000-00-00 00:00:00', 0),
(118, 7, 'http://google.com', 'catalog/slide5.png', 1, 0, '0000-00-00 00:00:00', 0),
(176, 8, 'clips', 'catalog/Clips.jpg', 6, 0, '0000-00-00 00:00:00', 0),
(177, 8, 'ean13', 'catalog/EAN13.jpg', 7, 0, '0000-00-00 00:00:00', 0),
(187, 9, 'http://weblama.me/admin/index.php?route=design/banner/edit&amp;token=Kf38Jwaii9egW72Ttk2jCi1CF8lFV0PX&amp;banner_id=9', 'catalog/118728-800w-900x350w.jpg', 0, 0, '0000-00-00 00:00:00', 1),
(117, 7, '', 'catalog/slide5.png', 0, 0, '0000-00-00 00:00:00', 0),
(178, 8, 'elisa-fanti', 'catalog/ElisaFanti.png', 8, 0, '0000-00-00 00:00:00', 0),
(175, 8, 'cavalli-class', 'catalog/cavalli class.png', 5, 0, '0000-00-00 00:00:00', 0),
(174, 8, 'babylon', 'catalog/0_9457b_e01e1b8b_XL9999-873x220.png', 4, 0, '0000-00-00 00:00:00', 0),
(173, 8, 'angels', 'catalog/Angels logo.png', 3, 0, '0000-00-00 00:00:00', 0),
(172, 8, 'angeletto', 'catalog/Angeletto logo.jpg', 2, 0, '0000-00-00 00:00:00', 0),
(171, 8, 'guess', 'catalog/guess.jpg', 1, 0, '0000-00-00 00:00:00', 0),
(170, 8, '22-maggio', 'catalog/22-Maggio.jpg', 0, 0, '0000-00-00 00:00:00', 0),
(186, 8, 'who-s-who', 'catalog/whoswho.png', 15, 0, '0000-00-00 00:00:00', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `ma_banner_image_description`
--

CREATE TABLE IF NOT EXISTS `ma_banner_image_description` (
  `banner_image_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  PRIMARY KEY (`banner_image_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ma_banner_image_description`
--

INSERT INTO `ma_banner_image_description` (`banner_image_id`, `language_id`, `banner_id`, `title`) VALUES
(187, 2, 9, '12'),
(120, 2, 6, 'HP Banner'),
(184, 1, 8, 'Severi Darling'),
(183, 2, 8, 'MET'),
(187, 1, 9, '12'),
(183, 1, 8, 'MET'),
(182, 2, 8, 'Marina Yachting'),
(182, 1, 8, 'Marina Yachting'),
(118, 2, 7, '2 слайд'),
(120, 1, 6, 'HP Banner'),
(181, 2, 8, 'Maria Grazia Severi'),
(181, 1, 8, 'Maria Grazia Severi'),
(180, 2, 8, 'KUSS'),
(180, 1, 8, 'KUSS'),
(179, 2, 8, 'Fly-girl'),
(178, 2, 8, 'Elisa Fanti'),
(118, 1, 7, '2 слайд'),
(117, 2, 7, '1 слайд'),
(117, 1, 7, '1 слайд'),
(179, 1, 8, 'Fly-girl'),
(178, 1, 8, 'Elisa Fanti'),
(177, 2, 8, 'EAN13'),
(177, 1, 8, 'EAN13'),
(176, 2, 8, 'Clips'),
(176, 1, 8, 'Clips'),
(175, 2, 8, 'Cavalli Class'),
(175, 1, 8, 'Cavalli Class'),
(174, 2, 8, 'Babylon'),
(174, 1, 8, 'Babylon'),
(173, 2, 8, 'Angels'),
(173, 1, 8, 'Angels'),
(172, 2, 8, 'Angeletto'),
(172, 1, 8, 'Angeletto'),
(171, 2, 8, 'Guess'),
(171, 1, 8, 'Guess'),
(170, 2, 8, '22 Maggio'),
(170, 1, 8, '22 Maggio'),
(184, 2, 8, 'Severi Darling'),
(185, 1, 8, 'VDP'),
(185, 2, 8, 'VDP'),
(186, 1, 8, 'Who''s Who'),
(186, 2, 8, 'Who''s Who');

-- --------------------------------------------------------

--
-- Структура таблицы `ma_cart`
--

CREATE TABLE IF NOT EXISTS `ma_cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `option` text NOT NULL,
  `quantity` int(5) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `cart_id` (`customer_id`,`session_id`,`product_id`,`recurring_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ma_category`
--

CREATE TABLE IF NOT EXISTS `ma_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `is_topsub` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`category_id`),
  KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=136 ;

--
-- Дамп данных таблицы `ma_category`
--

INSERT INTO `ma_category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `is_topsub`, `banner_id`, `date_added`, `date_modified`) VALUES
(59, '', 0, 1, 1, 1, 1, 0, 0, '2016-01-11 14:46:59', '2016-01-14 13:20:16'),
(60, '', 0, 1, 2, 2, 1, 0, 0, '2016-01-11 14:47:19', '2016-01-27 16:05:43'),
(85, '', 0, 1, 1, 8, 1, 0, 0, '2016-02-11 00:47:09', '2016-02-20 18:05:31'),
(78, '', 0, 0, 1, 0, 0, 0, 0, '2016-02-03 17:53:48', '2016-02-03 17:53:48'),
(86, '', 85, 0, 1, 0, 1, 0, 0, '2016-02-20 18:07:40', '2016-02-20 18:07:48'),
(65, '', 0, 1, 1, 7, 1, 0, 0, '2016-01-11 14:49:07', '2016-01-14 13:21:42'),
(80, '', 79, 0, 1, 0, 1, 0, 0, '2016-02-05 19:59:36', '2016-02-05 19:59:57'),
(77, '', 0, 0, 1, 0, 0, 0, 0, '2016-01-20 14:29:09', '2016-02-03 17:56:26'),
(68, '', 108, 0, 1, 1, 1, 0, 0, '2016-01-11 15:15:43', '2016-02-20 19:17:37'),
(69, '', 108, 0, 1, 2, 1, 0, 0, '2016-01-11 15:16:21', '2016-02-20 19:17:49'),
(72, '', 60, 0, 1, 0, 1, 1, 0, '2016-01-11 23:59:23', '2016-01-15 11:10:46'),
(71, '', 60, 0, 1, 2, 1, 1, 0, '2016-01-11 23:53:56', '2016-01-15 11:11:17'),
(73, '', 60, 0, 1, 1, 1, 1, 0, '2016-01-12 00:02:21', '2016-01-15 11:11:07'),
(79, '', 59, 0, 1, 0, 1, 0, 0, '2016-02-05 19:58:12', '2016-02-05 19:58:12'),
(81, '', 59, 0, 1, 0, 1, 1, 0, '2016-02-08 14:15:46', '2016-02-09 15:30:30'),
(82, '', 79, 0, 1, 0, 1, 0, 0, '2016-02-08 14:51:38', '2016-02-08 15:07:01'),
(83, '', 79, 0, 1, 0, 1, 0, 0, '2016-02-08 15:11:28', '2016-02-08 15:11:28'),
(84, '', 79, 0, 1, 0, 1, 0, 0, '2016-02-08 15:25:34', '2016-02-08 15:25:34'),
(87, '', 85, 0, 1, 0, 1, 0, 0, '2016-02-20 18:10:35', '2016-02-20 18:10:35'),
(88, '', 85, 0, 1, 0, 1, 0, 0, '2016-02-20 18:12:03', '2016-02-20 18:12:03'),
(89, '', 85, 0, 1, 0, 1, 0, 0, '2016-02-20 18:14:50', '2016-02-20 18:14:50'),
(90, '', 85, 0, 1, 0, 1, 0, 0, '2016-02-20 18:16:32', '2016-02-20 18:16:32'),
(91, '', 85, 0, 1, 0, 1, 0, 0, '2016-02-20 18:19:09', '2016-02-20 18:19:09'),
(92, '', 59, 0, 1, 0, 1, 1, 0, '2016-02-20 18:20:43', '2016-02-20 18:20:43'),
(93, '', 59, 0, 1, 0, 1, 1, 0, '2016-02-20 18:21:22', '2016-02-20 18:21:34'),
(94, '', 59, 0, 1, 1, 1, 0, 0, '2016-02-20 18:23:53', '2016-02-20 18:35:24'),
(95, '', 94, 0, 1, 0, 1, 0, 0, '2016-02-20 18:35:01', '2016-02-20 18:35:01'),
(96, '', 94, 0, 1, 0, 1, 0, 0, '2016-02-20 18:44:48', '2016-02-20 18:44:48'),
(97, '', 94, 0, 1, 0, 1, 0, 0, '2016-02-20 18:46:24', '2016-02-20 18:46:24'),
(98, '', 94, 0, 1, 0, 1, 0, 0, '2016-02-20 18:48:55', '2016-02-20 18:48:55'),
(99, '', 94, 0, 1, 0, 1, 0, 0, '2016-02-20 18:52:10', '2016-02-20 18:52:10'),
(100, '', 79, 0, 1, 0, 1, 0, 0, '2016-02-20 18:56:08', '2016-02-20 18:56:08'),
(101, '', 79, 0, 1, 0, 1, 0, 0, '2016-02-20 18:58:06', '2016-02-20 18:58:06'),
(102, '', 79, 0, 1, 0, 1, 0, 0, '2016-02-20 19:01:19', '2016-02-20 19:01:19'),
(103, '', 79, 0, 1, 0, 1, 0, 0, '2016-02-20 19:03:55', '2016-02-20 19:03:55'),
(104, '', 79, 0, 1, 0, 1, 0, 0, '2016-02-20 19:06:06', '2016-02-20 19:06:06'),
(105, '', 79, 0, 1, 0, 1, 0, 0, '2016-02-20 19:09:42', '2016-02-20 19:09:42'),
(106, '', 79, 0, 1, 0, 1, 0, 0, '2016-02-20 19:11:34', '2016-02-20 19:11:34'),
(107, '', 79, 0, 1, 0, 1, 0, 0, '2016-02-20 19:13:04', '2016-02-20 19:13:04'),
(108, '', 60, 0, 1, 0, 1, 0, 0, '2016-02-20 19:17:05', '2016-02-20 19:17:05'),
(109, '', 60, 0, 1, 2, 1, 0, 0, '2016-02-20 19:20:21', '2016-02-20 19:28:15'),
(110, '', 60, 0, 1, 1, 1, 0, 0, '2016-02-20 19:21:43', '2016-02-20 19:28:05'),
(111, '', 109, 0, 1, 0, 1, 0, 0, '2016-02-20 19:24:09', '2016-02-20 19:24:09'),
(112, '', 109, 0, 1, 0, 1, 0, 0, '2016-02-20 19:25:49', '2016-02-20 19:25:49'),
(113, '', 110, 0, 1, 0, 1, 0, 0, '2016-02-20 19:27:36', '2016-02-20 19:27:36'),
(114, '', 110, 0, 1, 0, 1, 0, 0, '2016-02-20 19:30:30', '2016-02-20 19:30:30'),
(115, '', 110, 0, 1, 0, 1, 0, 0, '2016-02-20 19:32:48', '2016-02-20 19:32:48'),
(116, '', 110, 0, 1, 0, 1, 0, 0, '2016-02-20 19:34:35', '2016-02-20 19:34:35'),
(117, '', 110, 0, 1, 0, 1, 0, 0, '2016-02-20 19:36:40', '2016-02-20 19:36:40'),
(118, '', 108, 0, 1, 0, 1, 0, 0, '2016-02-20 19:38:33', '2016-02-20 19:38:33'),
(119, '', 108, 0, 1, 0, 1, 0, 0, '2016-02-20 19:40:07', '2016-02-20 19:40:07'),
(120, '', 108, 0, 1, 0, 1, 0, 0, '2016-02-20 19:43:22', '2016-02-20 19:43:22'),
(121, '', 108, 0, 1, 0, 1, 0, 0, '2016-02-20 19:45:28', '2016-02-20 19:45:28'),
(122, '', 108, 0, 1, 0, 1, 0, 0, '2016-02-20 19:46:54', '2016-02-20 19:46:54'),
(123, '', 108, 0, 1, 0, 1, 0, 0, '2016-02-20 19:48:53', '2016-02-20 19:48:53'),
(124, '', 108, 0, 1, 0, 1, 0, 0, '2016-02-20 19:52:13', '2016-02-20 19:52:13'),
(125, '', 108, 0, 1, 0, 1, 0, 0, '2016-02-20 19:53:44', '2016-02-20 19:53:44'),
(126, '', 108, 0, 1, 0, 1, 0, 0, '2016-02-20 19:56:40', '2016-02-20 19:56:40'),
(127, '', 108, 0, 1, 0, 1, 0, 0, '2016-02-20 19:58:08', '2016-02-20 19:58:08'),
(128, '', 108, 0, 1, 0, 1, 0, 0, '2016-02-20 19:59:23', '2016-02-20 19:59:23'),
(129, '', 108, 0, 1, 0, 1, 0, 0, '2016-02-20 20:00:52', '2016-02-20 20:00:52'),
(130, '', 108, 0, 1, 0, 1, 0, 0, '2016-02-20 20:03:17', '2016-02-20 20:03:17'),
(131, '', 108, 0, 1, 0, 1, 0, 0, '2016-02-20 20:04:37', '2016-02-20 20:04:37'),
(132, '', 108, 0, 1, 0, 1, 0, 0, '2016-02-20 20:07:10', '2016-02-20 20:07:10'),
(133, '', 108, 0, 1, 0, 1, 0, 0, '2016-02-20 20:08:34', '2016-02-20 20:08:34'),
(134, '', 108, 0, 1, 0, 1, 0, 0, '2016-02-20 20:09:57', '2016-02-20 20:09:57'),
(135, '', 108, 0, 1, 0, 1, 0, 0, '2016-02-20 20:11:14', '2016-02-20 20:11:14');

-- --------------------------------------------------------

--
-- Структура таблицы `ma_category_description`
--

CREATE TABLE IF NOT EXISTS `ma_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ma_category_description`
--

INSERT INTO `ma_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(59, 2, 'Men', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'man', '', ''),
(60, 1, 'Женщинам', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'woman', '', ''),
(78, 1, 'Товары на инфостраницах', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Товары на инфостраницах', '', ''),
(65, 1, 'Распродажи', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'discount', '', ''),
(77, 1, 'Хиты продаж', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Хиты продаж', '', ''),
(68, 1, 'Нижнее бельё', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Женское нижнее бельё', '', ''),
(69, 2, 'Socks', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Женские носки', '', ''),
(72, 2, 'SALE', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'woman sale', '', ''),
(71, 2, 'New this week', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'woman new', '', ''),
(73, 1, 'Новая коллекция', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'woman new collection', '', ''),
(71, 1, 'Новинки недели', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'woman new', '', ''),
(59, 1, 'Мужчинам', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'man', '', ''),
(60, 2, 'Women', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'woman', '', ''),
(85, 1, 'Бижутерия', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Брендовая бижутерия, Италия | Купить элитные украшения в интернет магазине итальянской бижутерии Angel-Moda', 'Купить брендовую бижутерию, итальянские украшения в интернет магазине. Продажа элитной бижутерии по доступным ценам. Магазин брендовой бижутерии Angel-Moda. Принимаем заказы по тел. +7(929)580-08-10.', 'брендовая бижутерия, итальянские украшения, итальянская бижутерия, брендовые украшения, продажа, заказать, купить, цена, интернет магазин, angel-moda, Италия'),
(65, 2, 'Overstock', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'discount', '', ''),
(77, 2, 'Most popular', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Most popular', '', ''),
(80, 2, 'Suits', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Angel-moda | Suits', '', ''),
(68, 2, 'Underwear', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Женское нижнее бельё', '', ''),
(69, 1, 'Носки', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Женские носки', '', ''),
(72, 1, 'SALE', '&lt;p&gt;123&lt;/p&gt;', 'woman sale', '', ''),
(73, 2, 'New collection', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'woman new collection', '', ''),
(79, 2, 'Clothing', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Angel-moda | Clothing', '', ''),
(79, 1, 'Одежда', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Angel-moda | Одежда', '', ''),
(78, 2, 'Товары на инфостраницах', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Товары на инфостраницах', '', ''),
(80, 1, 'Костюмы', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Angel-moda | Костюмы', '', ''),
(81, 1, 'SALE', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Angel-moda | Мужчины | SALE', '', ''),
(81, 2, 'SALE', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Angel-moda | MAN | SALE', '', ''),
(82, 2, 'Sweaters and cardigans', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Angel-moda | Man | Sweaters and cardigans', '', ''),
(82, 1, 'Джемперы и кардиганы', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Angel-moda | Мужчинам | Джемперы и кардиганы', '', ''),
(83, 1, 'Спортивная одежда', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Angel-moda | Мужчинам | Спортивная одежда', '', ''),
(83, 2, 'Sport wear', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Angel-moda | Man | Sport wear', '', ''),
(84, 1, 'Рубашки', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Angel-moda | Мужчинам | Рубашки', '', ''),
(84, 2, 'Shirts', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Angel-moda | Man | Shirts', '', ''),
(85, 2, 'Jewellery', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Jewellery | Angel-moda', '', ''),
(86, 2, 'Brooches', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Elegant brooches, Italy - price, catalog, photo | Buy luxury jewelry, brooches online store Angel-Moda', 'Buy elegant brooches - jewelry online store Angel-Moda. Brooches Italy - Luxury jewelry. We accept orders by phone. +7 (929) 580-08-10.', 'brooches, jewelry, luxury, buy, branded, price, shop, angel-moda'),
(86, 1, 'Броши', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Элегантные броши, Италия  - цена, каталог, фото | Купить элитную бижутерию, броши  в интернет магазине Angel-Moda', ' Купить элегантные броши - бижутерия интернет магазина Angel-Moda. Броши Италия - элитная бижутерия. Принимаем заказы по тел. +7(929)580-08-10.', 'броши, бижутерия, элитная, купить, брендовая, цена, интернет магазин, angel-moda'),
(87, 1, 'Кольца', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Брендовые кольца, Италия | Купить итальянские кольца с камнями — элитная бижутерия', 'Предлагаем купить итальянские кольца в интернет магазине Angel-Moda. Брендовые кольца, Италия. Элитные  бижутерия, кольца с камнями. Принимаем заказы по тел. +7(929)580-08-10.', 'кольца, бижутерия, продажа, купить, брендовая, цена, интернет магазин, angel-moda, заказать, итальянские, Италия, элитные'),
(87, 2, 'Rings', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Brand Ring, Italy | Buy Italian rings with stones - Luxury jewelry', 'Offer to buy the Italian rings online store Angel-Moda. Brand Ring, Italy. Fine jewelry, rings with stones. We accept orders by phone. +7 (929) 580-08-10.', 'rings, jewelry, sale, buy, branded, price, shop, angel-moda, order, Italian, Italy, elite'),
(88, 1, 'Комплекты', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Купить комплекты бижутерии в интернет магазине Angel-Moda', 'Бижутерия комплекты - купить по доступной цене. Комплекты бижутерии в интернет магазине  Angel-Moda.  Принимаем заказы по тел. +7(929)580-08-10.', 'комплекты, бижутерия, каталог, продажа, купить, брендовая, цена, интернет магазин, angel-moda'),
(88, 2, 'kits', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Buy jewelry sets online store Angel-Moda', 'Jewelry kits - buy at an affordable price. jewelry kits online store Angel-Moda. We accept orders by phone. +7 (929) 580-08-10.', 'kits, jewelry, catalog, sale, buy, branded, price, shop, angel-moda'),
(89, 1, 'Колье', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Женские колье, Италия — каталог с ценами | Купить женское колье, бижутерию в интернет магазине Angel-Moda', 'Женское колье - купить в интернет магазине Angel-Moda. Элитная бижутерия, колье по доступной цене. Смотреть каталог колье из Италии. Принимаем заказы по тел. +7(929)580-08-10.', 'колье, бижутерия, каталог, продажа, купить, брендовая, цена, интернет магазин, angel-moda, Италия, элитные'),
(89, 2, 'Necklace', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Women''s necklace, Italy - catalog with prices | Buy women''s necklace, jewelry online store Angel-Moda', 'Women''s necklace - buy online store Angel-Moda. Luxurious jewelry, necklace at an affordable price. See catalog necklace from Italy. We accept orders by phone. +7 (929) 580-08-10.', '\r\n\r\nnecklace, jewelry, catalog, sale, buy, branded, price, shop, angel-moda, Italy, elite'),
(90, 1, 'Серьги', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Итальянские серьги | Купить брендовые сережки из Италии в интернет магазине Angel-Moda', 'Предлагаем купить сережки в интернет магазине Angel-Moda. Брендовые серьги, Италия. Элитные серьги бижутерия - продажа. Принимаем заказы по тел. +7(929)580-08-10.\r\n', ''),
(90, 2, 'Earrings', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Italian earrings | Buy branded earrings from Italy in the online store Angel-Moda', 'Offer to buy earrings online store Angel-Moda. Brand earring, Italy. Luxury jewelry earrings - for sale. We accept orders by phone. +7 (929) 580-08-10.', ''),
(91, 1, 'Браслеты', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Итальянские браслеты — продажа | Купить брендовый браслет из Италии в интернет магазине Angel-Moda', 'Купить брендовый браслет в интернет магазине Angel-Moda. Итальянские браслеты - продажи, каталог, цены. Женские элитные браслеты. Принимаем заказы по тел. +7(929)580-08-10.', ''),
(91, 2, 'Bracelets', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Italian bracelets - for sale | Buy branded bracelet from Italy in the online store Angel-Moda', 'Buy branded bracelet online store Angel-Moda. Italian bracelets - sale catalog prices. Women''s elite bracelets. We accept orders by phone. +7 (929) 580-08-10.', ''),
(92, 1, 'Новая коллекция', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Новая коллекция', '', ''),
(92, 2, 'New collection', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'New collection', '', ''),
(93, 2, 'New this week', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'New this week', '', ''),
(93, 1, 'Новинки недели', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Новинки недели', '', ''),
(94, 2, 'accessories', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Angel-Moda Italian brand men''s belts | Buy pants men''s belt from Italy in the online store Angel-Moda', 'Buy men''s accessories online store Angel-Moda. Brand Men''s accessories Italy. We accept orders by phone. +7 (929) 580-08-10.', 'men''s accessories, buy, brand, price, shop, angel-moda, Italy, Italian'),
(94, 1, 'Аксессуары', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Итальянские брендовые мужские ремни | Купить брючный мужской ремень из Италии в интернет магазине ', 'Купить мужские аксессуары в интернет магазине Angel-Moda. Брендовые мужские аксессуары Италия. Принимаем заказы по тел. +7(929)580-08-10.', 'мужская аксессуары, купить, брендовые, цена, интернет магазин, angel-moda, Италия, итальянский'),
(95, 1, 'Головные уборы', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Итальянские брендовые мужские шапки - головные уборы в интернет магазине Angel-Moda', 'Купить мужские головные уборы - интернет магазин Angel-Moda. Брендовые итальянские мужские шапки по доступным ценам. Мужские шапки Италия. Принимаем заказы по тел. +7(929)580-08-10.', 'мужская шапки, головные уборы, купить, брендовые, цена, интернет магазин, angel-moda, Италия, итальянский'),
(95, 2, 'Hats', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Italian brand men''s hats - hats online store Angel-Moda', 'Buy Men''s hats - Angel-Moda online shop. Brand Italian men''s hats at reasonable prices. Men''s hats Italy. We accept orders by phone. +7 (929) 580-08-10.', 'men''s caps, hats, buy, brand, price, shop, angel-moda, Italy, Italian'),
(96, 1, 'Перчатки', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Итальянские мужские Перчатки - купить по доступным ценам | Angel-moda', 'Мужские перчатки - купить оптом и в розницу в интернет магазине ''Angel-moda''. Мужские аксессуары - большой ассортимент товаров из Италии по приемлемым ценам. Принимаем заказы по тел. +7(929)580-08-10.', 'мужские перчатки, аксессуары, брендовые, итальянский, из Италии, купить, цена, продажа, оптом'),
(96, 2, 'gloves', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Italian men''s gloves - buy at affordable prices | Angel-moda', 'Men''s gloves - buy wholesale and retail online store ''Angel-moda''. Men''s Accessories - large range of goods from Italy at competitive prices. We accept orders by phone. +7 (929) 580-08-10.', 'men''s gloves, accessories, branded, Italian, from Italy, buy, price, sale, wholesale'),
(97, 1, 'Ремни', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Брендовый мужской ремень | Купить брючный мужской ремень фирменный | Заказать мужские итальянские ремни | Интернет магазин Angel-Moda ', 'Брендовый мужской ремень - купить в интернет магазине Angel-Moda. Итальянские брючные ремни мужские. Заказать элитный ремень мужской Италия. Принимаем заказы по тел. +7(929)580-08-10.', 'мужской ремень, заказать, элитный, фирменный, брючный, купить, брендовая, цена, интернет магазин, angel-moda, итальянские, Италия'),
(97, 2, 'Belts', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Branded men''s belt | Buy pants men''s belt brand | Order the Italian men''s belts | Online Shop Angel-Moda', 'Branded men''s belt - buy online store Angel-Moda. Italian men''s trouser belts. Order luxury belt male Italy. We accept orders by phone. +7 (929) 580-08-10.', 'men''s belt, order, elite, corporate, pants, buy branded, price, shop, angel-moda, Italian, Italy'),
(98, 1, 'Сумки', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Итальянские мужские Сумки - купить по доступным ценам | Angel-moda', 'Мужские сумки - купить оптом и в розницу в интернет магазине ''Angel-moda''. Мужские аксессуары - большой ассортимент товаров из Италии по приемлемым ценам. Принимаем заказы по тел. +7(929)580-08-10.', 'мужские сумки, аксессуары, брендовые, итальянский, из Италии, купить, цена, продажа, оптом'),
(98, 2, 'Bags', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Italian men''s Bags - buy at affordable prices | Angel-moda', 'Men''s bags - buy wholesale and retail online store ''Angel-moda''. Men''s Accessories - large range of goods from Italy at competitive prices. We accept orders by phone. +7 (929) 580-08-10.', 'men''s bags, accessories, branded, Italian, from Italy, buy, price, sale, wholesale'),
(99, 1, 'Шарфы', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Шарф Италия мужской | Итальянские мужские шарфы | Купить мужской шарф брендовый | Интернет магазин Angel-Moda', 'Купить мужские брендовые шарфы - интернет магазин Angel-Moda. Итальянские мужские шарфы по доступным ценам. Принимаем заказы по тел. +7(929)580-08-10.', 'мужская шарфы, купить, брендовые, цена, интернет магазин, angel-moda, Италия, итальянский'),
(99, 2, 'Scarves', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Italy Scarf men''s | Italian men''s scarves | Buy branded men''s scarf | Online Shop Angel-Moda', 'Buy men''s branded scarves - Online Shop Angel-Moda. Italian men''s scarves at affordable rates. We accept orders by phone. +7 (929) 580-08-10.', 'men''s scarves, buy, brand, price, shop, angel-moda, Italy, Italian'),
(100, 1, 'Бермуды', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Итальянские мужские Бермуды - купить по доступным ценам | Angel-moda', 'Мужские бермуды - купить оптом и в розницу в интернет магазине ''Angel-moda''. Мужская одежда - большой ассортимент товаров из Италии по приемлемым ценам. Принимаем заказы по тел. +7(929)580-08-10.', 'мужские бермуды, одежда, брендовые, итальянский, из Италии, купить, цена, продажа, оптом'),
(100, 2, 'Bermudas', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Italian men''s Bermuda - buy at affordable prices | Angel-moda', 'Men''s Bermuda - buy wholesale and retail online store ''Angel-moda''. Men''s clothing - large range of goods from Italy at competitive prices. We accept orders by phone. +7 (929) 580-08-10.', 'Men''s Bermuda, clothing, brand, Italian, from Italy, buy, price, sale, wholesale'),
(101, 1, 'Жилеты', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Мужские жилеты утепленные | Брендовые  мужские зимние жилеты (пуховые) - купить в Angel-Moda ', 'Предлагаем купить брендовые мужские жилеты зимние, утепленные в магазине мужских жилетов Angel-Moda. Жилет пуховый мужской по доступной цене. Принимаем заказы по тел. +7(929)580-08-10.\r\n', 'мужской жилет, пуховый, купить, брендовые, зимний, утепленный,  интернет магазин, angel-moda, Италия, итальянский'),
(101, 2, 'Vests', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Men''s insulated jackets | Brand men''s winter jackets (down) - buy in Angel-Moda', 'Offer to buy branded men''s winter jackets, insulated vests male in the store Angel-Moda. Vest feather male at an affordable price. We accept orders by phone. +7 (929) 580-08-10.', 'men''s vest, feather, buy, brand, winter, insulated, shop, angel-moda, Italy, Italian'),
(102, 1, 'Футболки', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Брендовые итальянские мужские футболки  - продажа | Купить футболку мужскую в Интернет магазине Angel-Moda', 'Купить брендовую мужскую футболку в интернет магазине Angel-Moda. Итальянские мужские футболки по доступной цене. Принимаем заказы по тел. +7(929)580-08-10.', 'мужские футболки, купить, брендовые, цена, интернет магазин, angel-moda, Италия, итальянский\r\n'),
(102, 2, 'T-shirts', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Brand Italian men''s shirts - sale | Buy a T-shirt internet shop men''s Angel-Moda', 'Buy branded shirts for men online store Angel-Moda. Italian men''s shirts at an affordable price. We accept orders by phone. +7 (929) 580-08-10.', 'men''s shirts, buy, brand, price, shop, angel-moda, Italy, Italian'),
(103, 1, 'куртки ', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Итальянские мужские куртки |  Брендовые куртки - Италия ', 'Итальяснкую брендовую куртку мужскую купить в интернет магазине. Брендовые мужские куртки Италия. Принимаем заказы по тел. +7(929)580-08-10.', ''),
(103, 2, 'jackets', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Italian men''s jackets | Brand Jackets - Italy', 'Italian branded Jackets buy in the online store. Brand men''s jackets Italy. We accept orders by phone. +7 (929) 580-08-10.', ''),
(104, 1, 'Пальто', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Пальто мужское из Италии - продажа | Купить брендовое итальянское мужское пальто', 'Пальто брендовое мужское - купить в интернет магазине Angel-Moda. Итальянское мужские пальто - продажа, цена, описание. Мужские пальто из Италии. Принимаем заказы по тел. +7(929)580-08-10.', 'мужские пальто, купить, брендовые, цена, интернет магазин, angel-moda, Италия, итальянский'),
(104, 2, 'Coat', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Coats male from Italy - for sale | Buy under brand Italian male coat', 'Coats male under brand - buy online store Angel-Moda. Italian men''s coat - sales, price, description. Men''s coats from Italy. We accept orders by phone. +7 (929) 580-08-10.', 'men''s coat, buy, brand, price, shop, angel-moda, Italy, Italian'),
(105, 1, 'Джинсы', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Итальянские джинсы мужские | Купить брендовые мужские джинсы из Италии', 'Купить брендовые мужские джинсы в интернет магазине Angel-Moda. Джинсы из Италии мужские по доступным ценам. Продажа джинсов мужских. Принимаем заказы по тел. +7(929)580-08-10.', 'мужские джинсы, купить, брендовые, цена, интернет магазин, angel-moda, Италия, итальянский'),
(105, 2, 'Jeans', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Italian men''s jeans | Buy branded men''s jeans from Italy', 'Buy branded mens jeans online store Angel-Moda. Jeans for men from Italy at affordable rates. Sale of men''s jeans. We accept orders by phone. +7 (929) 580-08-10.', 'men''s jeans, buy, brand, price, shop, angel-moda, Italy, Italian'),
(106, 1, 'Пуховики', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Итальянские мужские пуховики - продажа | Купить мужской брендовую куртку, пуховик - Angel Moda', 'Купить куртку пуховик мужскую из Италии по доступной цене. Каталог мужских пуховиков брендовых - интернет магазин Angel-Moda. Принимаем заказы по тел. +7(929)580-08-10.', 'мужские пуховик, куртка пуховик, купить, брендовые, цена, интернет магазин, angel-moda, Италия, итальянский'),
(106, 2, 'Jackets', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Italian men''s jackets - sale | Buy branded men''s jacket, down jacket - Angel Moda', 'Buy jacket down jacket male from Italy at an affordable price. Directory men''s down jacket brand - Angel-Moda online shop. We accept orders by phone. +7 (929) 580-08-10.', 'men''s jacket, coat jacket, buy, brand, price, shop, angel-moda, Italy, Italian'),
(107, 1, 'Брюки', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Итальянские мужские Брюки - купить по доступным ценам | Angel-moda', 'Мужские брюки - купить оптом и в розницу в интернет магазине ''Angel-moda''. Мужская одежда - большой ассортимент товаров из Италии по приемлемым ценам. Принимаем заказы по тел. +7(929)580-08-10.', 'мужские брюки, одежда, брендовые, итальянский, из Италии, купить, цена, продажа, оптом'),
(107, 2, 'Pants', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Italian men''s trousers - buy at affordable prices | Angel-moda', 'Men''s pants - buy wholesale and retail online store ''Angel-moda''. Men''s clothing - large range of goods from Italy at competitive prices. We accept orders by phone. +7 (929) 580-08-10.', 'men''s trousers, clothing, brand, Italian, from Italy, buy, price, sale, wholesale'),
(108, 1, 'Одежда', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Итальянская женская одежда — купить в Москве | Интернет магазин брендовой женской одежды из Италии', 'Купить женскую одежду оптом и в розницу из Италии по доступным ценам. Магазин женской брендовой одежды онлайн &quot;Angel-Moda&quot;. Элегантная итальянская одежда для женщин - заказать через интернет. Принимаем заказы по тел. +7(929)580-08-10.', 'женская одежда из Италии, итальянская, брендовая, заказать, купить, продажа, цена, онлайн, интернет магазин, оптом, в розницу, элегантная, angel-moda, через интернет'),
(108, 2, 'clothing', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Italian women''s clothing - buy in Moscow | Online store brand of women''s clothing from Italy', 'Buy women''s clothing wholesale and retail of Italy at reasonable prices. Shop women''s fashion apparel online &quot;Angel-Moda&quot;. Elegant Italian clothes for women - order via the Internet. We accept orders by phone. +7 (929) 580-08-10.', 'women''s clothing from Italy, italian, branded, order, purchase, sale, price, online, online store, wholesale, retail, elegant, angel-moda, via the Internet'),
(109, 2, 'Footwear', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Brand women''s shoes | Buy Female footwear Internet shop online | Women''s shoes Italy - catalog with the prices, sale | Angel-Moda', 'Italian women''s shoes - buy online Online store &quot;Angel-Moda&quot;. Brand women''s shoes from Italy. Elegant shoes for women at reasonable prices. We accept orders by phone. +7 (929) 580-08-10.', 'branded shoes, elegant, Italian, Italy, women''s shoes, price, buy, shop, angel-moda'),
(109, 1, 'Обувь', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Брендовая женская обувь | Купить обувь женскую в интернет магазине онлайн | Женская обувь Италия  - каталог с ценами, продажа | Angel-Moda', 'Итальянская женская обувь - купить в интернет магазине онлайн &quot;Angel-Moda&quot;. Брендовая женская обувь из Италии. Элегантная обувь для женщин по доступным ценам. Принимаем заказы по тел. +7(929)580-08-10.', 'брендовая обувь, элегантная, итальянская, Италия, женская обувь, цена, купить, интернет магазин, angel-moda'),
(110, 2, 'accessories', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Shop women''s accessories | Buy branded women''s accessories | Online Shop Angel-Moda', 'Buy women''s fashion accessories online store Angel-Moda. Shop women''s accessories. We accept orders by phone. +7 (929) 580-08-10.', 'Women''s Accessories, buy, brand, price, shop, angel-moda, italian, italy'),
(110, 1, 'Аксессуары', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Магазин женских аксессуаров | Купить брендовые женские аксессуары | Интернет магазин Angel-Moda', 'Купить женские брендовые аксессуары в интернет магазине Angel-Moda. Магазин женских аксессуаров. Принимаем заказы по тел. +7(929)580-08-10. ', 'женские аксессуары, купить, брендовые, цена, интернет магазин, angel-moda, итальянская, италия'),
(111, 1, 'Туфли', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Брендовые женские туфли Италия | Купить итальянские туфли женские | Интернет магазин Angel-Moda', 'Предлагаем купить итальянские туфли в Москве. Туфли женские Италия - интернет магазин Angel-Moda. Продажа брендовых женских туфель на каблуке. Принимаем заказы по тел. +7(929)580-08-10.', 'туфли женские, итальянские, италия, продажа, купить, цена, интернет магазин, angel-moda, москва'),
(111, 2, 'Shoes', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Brand women''s shoes Italy | Buy Italian shoes for women | Online Shop Angel-Moda', 'Offer to buy Italian shoes in Moscow. Women''s shoes Italy - Angel-Moda online shop. Sale of branded women''s shoes with heels. We accept orders by phone. +7 (929) 580-08-10.', 'Women''s shoes, Italian, Italy, sale, buy, price, shop, angel-moda, Moscow'),
(112, 1, 'Сапоги', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Брендовые женские сапоги | Купить сапоги ботфорты женские | Интернет магазин Angel-Moda ', 'Купить женские сапоги ботфортыв интернет магазине Angel-Moda. Сапоги женские брендовые по доступной цене.  Принимаем заказы по тел. +7(929)580-08-10.', 'женские сапоги, ботфорты, купить, брендовая, цена, интернет магазин, angel-moda'),
(112, 2, 'Boots', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Brand women''s boots | Buy boots boots for women | Online Shop Angel-Moda', 'Buy women''s boots boots online store Angel-Moda. Boots women''s brand at an affordable price. We accept orders by phone. +7 (929) 580-08-10.', 'women''s boots, boots, buy, branded, price, shop, angel-moda'),
(113, 1, 'Головные уборы', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Итальянские шапки женские | Купить брендовую женскую шапку с шарфом | Женские зимние головные уборы  | Интернет магазин Angel-Moda ', 'Купить брендовую женскую шапку по доступной цене. Каталог женских головных уборов. Заказать женские шапки с шарфом. Принимаем заказы по тел. +7(929)580-08-10.', 'женские шапки, головные уборы, шарфы, купить, брендовая, цена, интернет магазин, angel-moda, заказать, итальянские, Италия'),
(113, 2, 'Hats', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Italian women''s hats | Buy branded feminine hat with a scarf | Women''s winter hats | Online Shop Angel-Moda', 'Buy branded women''s cap at an affordable price. Catalog female hats. Order Women''s hats with a scarf. We accept orders by phone. +7 (929) 580-08-10.', 'Ladies caps, hats, scarves, buy branded, price, shop, angel-moda, order, Italian, Italy'),
(114, 1, 'Шарфы', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Женские брендовые шарфы | Купить женский шарф в Москве | Интернет магазин Angel-Moda', 'Брендовые итальянские женские шарфы - интернет магазин Angel-Moda. Купить женский шарф в Москве по доступной цене. Принимаем заказы по тел. +7(929)580-08-10. ', 'женские шарфы, купить, брендовые, цена, интернет магазин, angel-moda, москва, итальянский'),
(114, 2, 'Scarves', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Women branded scarves | Buy female scarf in Moscow | Online Shop Angel-Moda', 'Brand Italian women scarves - Online Shop Angel-Moda. Buy female scarf in Moscow at an affordable price. We accept orders by phone. +7 (929) 580-08-10.', 'Women''s scarves, buy, brand, price, shop, angel-moda, Moscow, Italian'),
(115, 1, 'Перчатки', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Брендовые женские перчатки, Италия | Купить итальянские женские перчатки - цены, описание, фото  | Интернет магазин Angel-Moda', 'Брендовые перчатки женские - купить в интернет магазине Angel-Moda. Женские перчатки Италия. Принимаем заказы по тел. +7(929)580-08-10. ', 'женские перчатки, купить, брендовые, цена, интернет магазин, angel-moda, итальянский'),
(115, 2, 'gloves', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Brand women''s gloves, Italy | Buy Italian women''s gloves - prices, description, photos | Online Shop Angel-Moda', 'Brand women''s gloves - buy online store Angel-Moda. Women gloves Italy. We accept orders by phone. +7 (929) 580-08-10.', 'women''s gloves, buy, brand, price, shop, angel-moda, Italian'),
(116, 1, 'Сумки', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Брендовая женская сумка - продажа | Элитные итальянские женские сумки, оригинал | Купить женскую сумку из Италии в интернет магазине Angel-Moda', 'Продажа оригинальных женских сумок из Италии по доступным ценам. Купить брендовые элитные женские сумки в интернет магазине &quot;Angel-Moda&quot;. Смотреть каталог лучших итальянских женских сумок. Принимаем заказы по тел. +7(929)580-08-10.', 'сумки женские, брендовые, оригинал, купить, цена, продажа, каталог, италья, итальянская, брендовая сумка, элитные'),
(116, 2, 'Bags', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Brand''s bag - for sale | Italian Luxury handbags, original | Buy handbags from Italy in the online store Angel-Moda', 'Sale of original handbags from Italy at an affordable price. Buy branded luxury handbags online store &quot;Angel-Moda&quot;. See the catalog of the best Italian women''s handbags. We accept orders by phone. +7 (929) 580-08-10.', 'women''s handbags, brand, original, buy, price, sale, catalog, italy, italian, branded bag, luxury'),
(117, 1, 'Ремни', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Итальянские женские ремни и пояса | Купить женский брендовый ремень в интернет магазине Angel-Moda', 'Ремни женские брендовые - купить в интернет магазине Angel-Moda. Итальянские ремни женские по доступным ценам.  Принимаем заказы по тел. +7(929)580-08-10.', 'женский ремень, пояс, купить, брендовая, цена, интернет магазин, angel-moda, итальянские, Италия'),
(117, 2, 'Belts', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Italian women''s belts | Buy branded women belt online store Angel-Moda', 'Belts female brand - buy online store Angel-Moda. Italian women''s belts at reasonable prices. We accept orders by phone. +7 (929) 580-08-10.', 'women belt, belt, buy branded, price, shop, angel-moda, Italian, Italy'),
(118, 1, 'Платья', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Брендовые платья, Италия | Купить дорогое итальянское платье мировых брендов в интернет магазине Angel-Moda', 'Продажа брендовых платьев из Италии по доступным ценам. Посмотреть каталог женских платьев. Купить итальянское платье в интернет магазине &quot;Angel-moda&quot;. Принимаем заказы по тел. +7(929)580-08-10.', 'брендовые платья, италия, итальянские, купить, продажа, каталог, интернет магазин, цена, мировые бренды, дорогие'),
(118, 2, 'Dresses', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Branded dresses, Italy | Buy an expensive Italian dress brands in the online store Angel-Moda', 'Sale of branded dresses from Italy at an affordable price. See the catalog of women''s dresses. Buy Italian dress online store &quot;Angel-moda&quot;. We accept orders by phone. +7 (929) 580-08-10.', 'brand dress, Italy, Italian, purchase, sale, catalog, online store, price, world brands, expensive'),
(119, 1, 'Шорты', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Брендовые женские шорты | Купить женские итальянские шорты в интернет магазин Angel-Moda', 'Предлагаем купить шорты женские в интернет магазине Angel-Moda. Итальянский женский интернет магазин -шорты брендовые по доступной цене. Принимаем заказы по тел. +7(929)580-08-10.', 'женские шорты, одежда, брендовые, итальянский, из Италии, купить, цена, продажа, оптомженские шорты, купить, брендовые, цена, интернет магазин, angel-moda, итальянский'),
(119, 2, 'Shorts', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Brand women''s shorts | Buy women''s Italian shorts online Angel-Moda Shop', 'Offer to buy shorts for women online store Angel-Moda. Italian women shop -shorts brand at an affordable price. We accept orders by phone. +7 (929) 580-08-10.', 'women''s shorts, clothing, brand, Italian, from Italy, buy, price, sale, optomzhenskie shorts, buy, brand, price, shop, angel-moda, Italian'),
(120, 1, 'Рубашки', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Итальянские женские рубашки | Купить брендовую женскую рубашку из Италии', 'Итальянские рубашки женские - купить по доступной цене.  Интернет магазин брендовых рубашек Angel-Moda. Заказать женские рубашки Италия. Принимаем заказы по тел. +7(929)580-08-10.', 'женские рубашки, шарфы, купить, брендовая, цена, интернет магазин, angel-moda, заказать, итальянские, Италия'),
(120, 2, 'shirts', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Italian women''s shirts | Buy branded women''s shirt from Italy', 'Italian women''s shirts - to buy at an affordable price. Online store branded shirts Angel-Moda. Order Women shirts Italy. We accept orders by phone. +7 (929) 580-08-10.', 'women''s shirts, scarves, buy branded, price, shop, angel-moda, order, Italian, Italy'),
(121, 1, 'Юбки', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Брендовые юбки, Италия | Купить итальянскую юбку в интернет магазине Angel-Moda', 'Продажа юбок. Купить брендовую юбку до доступной цене. Интернет магазин женских юбок из Италии. Принимаем заказы по тел. +7(929)580-08-10.', 'женские юбки, купить, брендовые, цена, интернет магазин, angel-moda, итальянская, италия'),
(121, 2, 'Skirts', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Brand handbags, Italy | Buy Italian skirt online store Angel-Moda', 'Selling skirts. Buy branded skirt to an affordable price. Online store of women''s skirts from Italy. We accept orders by phone. +7 (929) 580-08-10.', 'women''s skirts, to buy, brand, price, shop, angel-moda, italian, italy'),
(122, 1, 'Джинсы', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Брендовые джинсы женские | Купить итальянские женские джинсы - каталог с ценами, продажа | Интернет магазин Angel-Moda', 'Купить женские джинсы фирменные в интернет магазине &quot;Angel-Moda&quot;. Итальянские брендовые женские джинсы по доступным ценам. Посмотреть каталог джинсов женских из Италии. Принимаем заказы по тел. +7(929)580-08-10.', 'женские джинсы, итальянская, Италия, цена, купить, интернет магазин, angel-moda, класстка, каталог'),
(122, 2, 'Jeans', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Brand women''s jeans | Buy Italian women''s jeans - a catalog with the prices, sale | Online Shop Angel-Moda', 'Buy women''s jeans brand in the online store &quot;Angel-Moda&quot;. Italian brand women''s jeans at an affordable price. See the catalog of women''s jeans from Italy. We accept orders by phone. +7 (929) 580-08-10.', 'women''s jeans, Italian, Italy, price, buy, shop, angel-moda, klasstka directory'),
(123, 1, 'Пальто', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Элегантные итальянские женские пальто - продажа | Купить женское брендовое пальто из Италии', 'Пальто женское Италия - купить по доступным ценам. продажа пальто женских. Элегантное женское пальто -  смотреть каталог. Принимаем заказы по тел. +7(929)580-08-10.', 'женские пальто, купить, брендовые, цена, интернет магазин, angel-moda, итальянская, италия, элегантное'),
(123, 2, 'Coat', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Elegant Italian women''s coats - sale | Buy women''s coat under brand from Italy', 'Coat female Italy - to buy at reasonable prices. selling women''s coats. Elegant women''s coat - watch catalog. We accept orders by phone. +7 (929) 580-08-10.', 'women''s coats, buy, brand, price, shop, angel-moda, italian, italy, elegant'),
(124, 1, 'Куртки', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Брендовые женские куртки, Италия | Купить итальянскую женскую куртку в интернет магазине Angel-Moda', 'Итальянские куртки женские известных брендов. Купить женскую куртку из Италии в Москве. Посмотреть каталог женских курток интернет магазина &quot;Angel-Moda&quot;. Принимаем заказы по тел. +7(929)580-08-10.', 'женские куртки, элегантные, продажа, цена, купить, итальянские куртки, Италия, каталог, интернет магазин, angel-moda, брендовые'),
(124, 2, 'Jackets', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Brand women''s jackets, Italy | Buy Italian women''s jacket in the online store Angel-Moda', 'Italian women''s jackets of famous brands. Buy women''s jacket from Italy to Moscow. View the catalog Women''s coats online store &quot;Angel-Moda&quot;. We accept orders by phone. +7 (929) 580-08-10.', 'women''s jackets, elegant, selling, price, buy Italian Jacket, Italy, catalog, e-shop, angel-moda, brand'),
(125, 1, 'Пуховики', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Итальянские женские пуховики, куртки - продажа | Купить брендовый женский пуховик из Италии', 'Купить брендовый пуховик женский по доступной цене. Итальянские пуховики женские в интернет магазине Angel-Moda. Продажа пуховиков женских из Италии. Принимаем заказы по тел. +7(929)580-08-10.', 'женский пуховик, пальто, купить, брендовые, цена, интернет магазин, angel-moda, итальянская, италия, продажа'),
(125, 2, 'Jackets', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Italian women''s down jackets, jackets - sale | Buy branded women''s jacket from Italy', 'Buy branded jacket for women at an affordable price. Italian jackets for women online store Angel-Moda. Selling feather female from Italy. We accept orders by phone. +7 (929) 580-08-10.', 'Women''s down jacket, coat, buy, brand, price, shop, angel-moda, italian, italy, sale'),
(126, 1, 'Спортивная одежда', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Женская спортивная одежда | Купить брендовую женскую спортивную одежду в интернет магазине Angel-Moda', 'Купить женскую спортивную одежду в интернет магазине Angel-Moda. Брендовая спортивная одежда. Женская спортивная одежда магазины. Принимаем заказы по тел. +7(929)580-08-10.', 'спортивная одежда, женская, купить, брендовые, цена, интернет магазин, angel-moda, итальянская, италия, продажа'),
(126, 2, 'Sportswear', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Women''s sportswear | Buy branded women''s sportswear online store Angel-Moda', 'Buy Women''s sportswear online store Angel-Moda. Branded sportswear. Women''s sportswear shops. We accept orders by phone. +7 (929) 580-08-10.', 'sportswear, women''s, buy, brand, price, shop, angel-moda, italian, italy, sale'),
(127, 1, 'Брюки', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Брюки женские, итальянские | Купить женские брюки из Италии в интернет магазине Angel-Moda', 'Женские брюки - цены, каталог, продажа. Купить брюки Италия женские в интернет магазине Angel-Moda. Брюки женские итальянские.  Принимаем заказы по тел. +7(929)580-08-10.', 'женские брюки, купить, брендовая, цена, интернет магазин, angel-moda, итальянские, Италия'),
(127, 2, 'Pants', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Trousers for women, Italian | Buy women''s pants from Italy in the online store Angel-Moda', 'Women''s pants - prices, catalog sales. Buy pants Italy women online store Angel-Moda. Trousers for women Italian. We accept orders by phone. +7 (929) 580-08-10.', 'women''s pants, buy branded, price, shop, angel-moda, Italian, Italy'),
(128, 1, 'Джемперы и кардиганы', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Итальянские джемпера в Москве | Купить женский кардиган, брендовый джемпер в интернет магазине Angel-Moda', 'Купить джемпер женский в интернет магазине Angel-Moda. Женские кардиганы по доступной цене. Итальянские джемпера для женщин в Москве. Принимаем заказы по тел. +7(929)580-08-10.', 'женский джемпер, кардиган итальянские, италия, продажа, купить, цена, интернет магазин, angel-moda, москва'),
(128, 2, 'Sweaters and cardigans', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Italian jumper in Moscow | Buy Women''s cardigan sweater branded online store Angel-Moda', 'Buy Female jumpers online store Angel-Moda. Women cardigans at an affordable price. Italian sweaters for women in Moscow. We accept orders by phone. +7 (929) 580-08-10.', 'Women''s sweater, cardigan Italian, Italy, sale, buy, price, shop, angel-moda, Moscow'),
(129, 1, 'Комбинезоны', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Брендовые женские комбинезоны, Италия | Купить женский комбинезон в интернет магазине Angel-Moda', 'Купить комбинезон женский в интернет магазине Angel-Moda. Каталог комбинезонов женских - цены, описание, фото. Комбинезоны  брендовые женские, Италия.', 'комбинезон, женский, каталог, купить, брендовые, цена, интернет магазин, angel-moda, итальянская, италия, продажа');
INSERT INTO `ma_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(129, 2, 'Overalls', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Brand women''s overalls, Italy | Buy Women''s jumpsuit online store Angel-Moda', 'Buy jumpsuit women online store Angel-Moda. Catalog overalls female - prices, description, photos. Overalls female brand, Italy.', 'overall, female, catalog, buy, brand, price, shop, angel-moda, italian, italy, sale'),
(130, 1, 'Топы', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Купить женский топ, Италия | Продажа женских спортивных топов в интернет магазине Angel-Moda', 'Предлагаем купить женский топ по доступной цене. Топы женские - интернет магазин Angel-Moda. Выбрать итальянские женские спортивные топы. Принимаем заказы по тел. +7(929)580-08-10. ', 'женские топы, спортивные топы, каталог, купить, брендовые, цена, интернет магазин, angel-moda, итальянская, италия, продажа'),
(130, 2, 'Tops', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Buy female celebrity, Italy | Selling women''s sports tops online store Angel-Moda', 'Offer to buy ladies top at affordable price. Women''s tops - Angel-Moda online shop. Select the Italian women''s sports tops. We accept orders by phone. +7 (929) 580-08-10.', 'Women''s tops, sports tops, catalog, buy, brand, price, shop, angel-moda, italian, italy, sale'),
(131, 1, 'Блузки', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Блузки женские брендовые — цена, описание, фото | Купить итальянские брендовые блузки | Интернет магазин женских блузок', 'Итальянские блузки женские - купить по доступной цене. Интернет магазин женских блузок Angel-Moda. Блузки женские брендовые. Принимаем заказы по тел. +7(929)580-08-10. ', 'женские блузки, купить, брендовые, цена, интернет магазин, angel-moda, итальянская, италия, продажа'),
(131, 2, 'Shirts', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Blouses Women brand - price, description, photo | Buy Italian brand blouses | Online store of women''s blouses', 'Italian blouses for women - buy at an affordable price. Online store of women''s blouses Angel-Moda. Blouses Women brand. We accept orders by phone. +7 (929) 580-08-10.', 'women''s blouses, buy, brand, price, shop, angel-moda, italian, italy, sale'),
(132, 1, 'Жилеты', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Жилет женский купить в Москве | Купить женские  жилеты в  Интернет магазине Angel-Moda', 'Жилеты женские - купить в интернет магазине Angel-Moda. Доступные цены на брендовые женские жилеты в Москве.  Принимаем заказы по тел. +7(929)580-08-10. ', 'женские жилеты, купить, брендовые, цена, интернет магазин, angel-moda, итальянская, италия, продажа'),
(132, 2, 'Vests', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Women vests bought in Moscow | Buy Women vests internet store Angel-Moda', 'Women vests - Buy online store Angel-Moda. Affordable prices for brand-name women''s jackets in Moscow. We accept orders by phone. +7 (929) 580-08-10.', 'Women vests, buy, brand, price, shop, angel-moda, italian, italy, sale'),
(133, 1, 'Футболки', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Брендовая женская футболка - купить в Москве | Интернет магазин женских футболок Angel-Moda', 'Женская футболка - купить в Москве по доступной цене. Интернет магазин брендовых женских футболок Angel-Moda. Закзать женскую футболку. Принимаем заказы по тел. +7(929)580-08-10.', 'женская футболка, купить, брендовая, цена, интернет магазин, angel-moda, заказать, итальянские, Италия'),
(133, 2, 'T-shirts', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Brand women''s T-shirt - bought in Moscow | Online store of women''s T-shirts Angel-Moda', 'Women''s T-shirt - bought in Moscow at an affordable price. Online store brand of women''s T-shirts Angel-Moda. Zakzat women''s t-shirt. We accept orders by phone. +7 (929) 580-08-10.', 'Women''s T-shirt, buy branded, price, shop, angel-moda, order, Italian, Italy'),
(134, 1, 'Пиджаки', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Магазин женских пиджаков,  Италия | Купить брендовые женские пиджаки  | Интернет магазин Angel-Moda', 'Брендовые женские пиджаки Италия. Купить пиджаки женские - интернет магазин Angel-Moda. Принимаем заказы по тел. +7(929)580-08-10. ', 'женские пиджаки, купить, брендовые, цена, интернет магазин, angel-moda, итальянская, италия'),
(134, 2, 'Jackets', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Shop women''s jackets, Italy | Buy branded women''s jackets | Online Shop Angel-Moda', 'Brand women''s jackets Italy. Buy jackets for women - Angel-Moda online shop. We accept orders by phone. +7 (929) 580-08-10.', 'Women''s jackets, buy, brand, price, shop, angel-moda, italian, italy'),
(135, 1, 'Туники', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Итальянские женские Туники - купить по доступным ценам | Angel-moda', 'женские одежда - купить оптом и в розницу в интернет магазине ''Angel-moda''. Женщинам - большой ассортимент товаров из Италии по приемлимым ценам. Принимаем заказы по тел. +7(929)580-08-10.', 'женские одежда, брендовые, итальянский, из Италии, купить, цена, продажа, оптом'),
(135, 2, 'Tunics', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Italian Women''s Tunics - buy at affordable prices | Angel-moda', 'Women''s clothing - buy wholesale and retail online store ''Angel-moda''. Women - large range of goods from Italy at reasonable prices. We accept orders by phone. +7 (929) 580-08-10.', 'Women''s clothing, brand, Italian, from Italy, buy, price, sale, wholesale');

-- --------------------------------------------------------

--
-- Структура таблицы `ma_category_filter`
--

CREATE TABLE IF NOT EXISTS `ma_category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ma_category_filter`
--

INSERT INTO `ma_category_filter` (`category_id`, `filter_id`) VALUES
(60, 4),
(60, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `ma_category_path`
--

CREATE TABLE IF NOT EXISTS `ma_category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`path_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ma_category_path`
--

INSERT INTO `ma_category_path` (`category_id`, `path_id`, `level`) VALUES
(83, 59, 0),
(82, 79, 1),
(82, 59, 0),
(82, 82, 2),
(81, 81, 1),
(81, 59, 0),
(80, 79, 1),
(80, 59, 0),
(79, 59, 0),
(79, 79, 1),
(73, 60, 0),
(73, 73, 1),
(71, 60, 0),
(71, 71, 1),
(72, 72, 1),
(72, 60, 0),
(69, 60, 0),
(69, 69, 2),
(68, 60, 0),
(68, 68, 2),
(77, 77, 0),
(80, 80, 2),
(59, 59, 0),
(65, 65, 0),
(86, 86, 1),
(78, 78, 0),
(85, 85, 0),
(60, 60, 0),
(83, 79, 1),
(84, 84, 2),
(84, 79, 1),
(84, 59, 0),
(83, 83, 2),
(86, 85, 0),
(87, 85, 0),
(87, 87, 1),
(88, 85, 0),
(88, 88, 1),
(89, 85, 0),
(89, 89, 1),
(90, 85, 0),
(90, 90, 1),
(91, 85, 0),
(91, 91, 1),
(92, 59, 0),
(92, 92, 1),
(93, 59, 0),
(93, 93, 1),
(94, 59, 0),
(94, 94, 1),
(95, 59, 0),
(95, 94, 1),
(95, 95, 2),
(96, 59, 0),
(96, 94, 1),
(96, 96, 2),
(97, 59, 0),
(97, 94, 1),
(97, 97, 2),
(98, 59, 0),
(98, 94, 1),
(98, 98, 2),
(99, 59, 0),
(99, 94, 1),
(99, 99, 2),
(100, 59, 0),
(100, 79, 1),
(100, 100, 2),
(101, 59, 0),
(101, 79, 1),
(101, 101, 2),
(102, 59, 0),
(102, 79, 1),
(102, 102, 2),
(103, 59, 0),
(103, 79, 1),
(103, 103, 2),
(104, 59, 0),
(104, 79, 1),
(104, 104, 2),
(105, 59, 0),
(105, 79, 1),
(105, 105, 2),
(106, 59, 0),
(106, 79, 1),
(106, 106, 2),
(107, 59, 0),
(107, 79, 1),
(107, 107, 2),
(108, 60, 0),
(108, 108, 1),
(68, 108, 1),
(69, 108, 1),
(109, 60, 0),
(109, 109, 1),
(110, 60, 0),
(110, 110, 1),
(111, 60, 0),
(111, 109, 1),
(111, 111, 2),
(112, 60, 0),
(112, 109, 1),
(112, 112, 2),
(113, 60, 0),
(113, 110, 1),
(113, 113, 2),
(114, 60, 0),
(114, 110, 1),
(114, 114, 2),
(115, 60, 0),
(115, 110, 1),
(115, 115, 2),
(116, 60, 0),
(116, 110, 1),
(116, 116, 2),
(117, 60, 0),
(117, 110, 1),
(117, 117, 2),
(118, 60, 0),
(118, 108, 1),
(118, 118, 2),
(119, 60, 0),
(119, 108, 1),
(119, 119, 2),
(120, 60, 0),
(120, 108, 1),
(120, 120, 2),
(121, 60, 0),
(121, 108, 1),
(121, 121, 2),
(122, 60, 0),
(122, 108, 1),
(122, 122, 2),
(123, 60, 0),
(123, 108, 1),
(123, 123, 2),
(124, 60, 0),
(124, 108, 1),
(124, 124, 2),
(125, 60, 0),
(125, 108, 1),
(125, 125, 2),
(126, 60, 0),
(126, 108, 1),
(126, 126, 2),
(127, 60, 0),
(127, 108, 1),
(127, 127, 2),
(128, 60, 0),
(128, 108, 1),
(128, 128, 2),
(129, 60, 0),
(129, 108, 1),
(129, 129, 2),
(130, 60, 0),
(130, 108, 1),
(130, 130, 2),
(131, 60, 0),
(131, 108, 1),
(131, 131, 2),
(132, 60, 0),
(132, 108, 1),
(132, 132, 2),
(133, 60, 0),
(133, 108, 1),
(133, 133, 2),
(134, 60, 0),
(134, 108, 1),
(134, 134, 2),
(135, 60, 0),
(135, 108, 1),
(135, 135, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `ma_category_to_layout`
--

CREATE TABLE IF NOT EXISTS `ma_category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ma_category_to_layout`
--

INSERT INTO `ma_category_to_layout` (`category_id`, `store_id`, `layout_id`) VALUES
(59, 0, 3),
(60, 0, 0),
(85, 0, 0),
(78, 0, 0),
(86, 0, 0),
(65, 0, 0),
(80, 0, 0),
(77, 0, 0),
(68, 0, 0),
(69, 0, 0),
(72, 0, 0),
(71, 0, 0),
(73, 0, 0),
(79, 0, 0),
(81, 0, 0),
(82, 0, 0),
(83, 0, 0),
(84, 0, 0),
(87, 0, 0),
(88, 0, 0),
(89, 0, 0),
(90, 0, 0),
(91, 0, 0),
(92, 0, 0),
(93, 0, 0),
(94, 0, 0),
(95, 0, 0),
(96, 0, 0),
(97, 0, 0),
(98, 0, 0),
(99, 0, 0),
(100, 0, 0),
(101, 0, 0),
(102, 0, 0),
(103, 0, 0),
(104, 0, 0),
(105, 0, 0),
(106, 0, 0),
(107, 0, 0),
(108, 0, 0),
(109, 0, 0),
(110, 0, 0),
(111, 0, 0),
(112, 0, 0),
(113, 0, 0),
(114, 0, 0),
(115, 0, 0),
(116, 0, 0),
(117, 0, 0),
(118, 0, 0),
(119, 0, 0),
(120, 0, 0),
(121, 0, 0),
(122, 0, 0),
(123, 0, 0),
(124, 0, 0),
(125, 0, 0),
(126, 0, 0),
(127, 0, 0),
(128, 0, 0),
(129, 0, 0),
(130, 0, 0),
(131, 0, 0),
(132, 0, 0),
(133, 0, 0),
(134, 0, 0),
(135, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `ma_category_to_store`
--

CREATE TABLE IF NOT EXISTS `ma_category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ma_category_to_store`
--

INSERT INTO `ma_category_to_store` (`category_id`, `store_id`) VALUES
(59, 0),
(60, 0),
(65, 0),
(68, 0),
(69, 0),
(71, 0),
(72, 0),
(73, 0),
(77, 0),
(78, 0),
(79, 0),
(80, 0),
(81, 0),
(82, 0),
(83, 0),
(84, 0),
(85, 0),
(86, 0),
(87, 0),
(88, 0),
(89, 0),
(90, 0),
(91, 0),
(92, 0),
(93, 0),
(94, 0),
(95, 0),
(96, 0),
(97, 0),
(98, 0),
(99, 0),
(100, 0),
(101, 0),
(102, 0),
(103, 0),
(104, 0),
(105, 0),
(106, 0),
(107, 0),
(108, 0),
(109, 0),
(110, 0),
(111, 0),
(112, 0),
(113, 0),
(114, 0),
(115, 0),
(116, 0),
(117, 0),
(118, 0),
(119, 0),
(120, 0),
(121, 0),
(122, 0),
(123, 0),
(124, 0),
(125, 0),
(126, 0),
(127, 0),
(128, 0),
(129, 0),
(130, 0),
(131, 0),
(132, 0),
(133, 0),
(134, 0),
(135, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `ma_country`
--

CREATE TABLE IF NOT EXISTS `ma_country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`country_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=258 ;

--
-- Дамп данных таблицы `ma_country`
--

INSERT INTO `ma_country` (`country_id`, `name`, `iso_code_2`, `iso_code_3`, `address_format`, `postcode_required`, `status`) VALUES
(1, 'Afghanistan', 'AF', 'AFG', '', 0, 1),
(2, 'Albania', 'AL', 'ALB', '', 0, 1),
(3, 'Algeria', 'DZ', 'DZA', '', 0, 1),
(4, 'American Samoa', 'AS', 'ASM', '', 0, 1),
(5, 'Andorra', 'AD', 'AND', '', 0, 1),
(6, 'Angola', 'AO', 'AGO', '', 0, 1),
(7, 'Anguilla', 'AI', 'AIA', '', 0, 1),
(8, 'Antarctica', 'AQ', 'ATA', '', 0, 1),
(9, 'Antigua and Barbuda', 'AG', 'ATG', '', 0, 1),
(10, 'Argentina', 'AR', 'ARG', '', 0, 1),
(11, 'Armenia', 'AM', 'ARM', '', 0, 1),
(12, 'Aruba', 'AW', 'ABW', '', 0, 1),
(13, 'Australia', 'AU', 'AUS', '', 0, 1),
(14, 'Austria', 'AT', 'AUT', '', 0, 1),
(15, 'Azerbaijan', 'AZ', 'AZE', '', 0, 1),
(16, 'Bahamas', 'BS', 'BHS', '', 0, 1),
(17, 'Bahrain', 'BH', 'BHR', '', 0, 1),
(18, 'Bangladesh', 'BD', 'BGD', '', 0, 1),
(19, 'Barbados', 'BB', 'BRB', '', 0, 1),
(20, 'Belarus', 'BY', 'BLR', '', 0, 1),
(21, 'Belgium', 'BE', 'BEL', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 0, 1),
(22, 'Belize', 'BZ', 'BLZ', '', 0, 1),
(23, 'Benin', 'BJ', 'BEN', '', 0, 1),
(24, 'Bermuda', 'BM', 'BMU', '', 0, 1),
(25, 'Bhutan', 'BT', 'BTN', '', 0, 1),
(26, 'Bolivia', 'BO', 'BOL', '', 0, 1),
(27, 'Bosnia and Herzegovina', 'BA', 'BIH', '', 0, 1),
(28, 'Botswana', 'BW', 'BWA', '', 0, 1),
(29, 'Bouvet Island', 'BV', 'BVT', '', 0, 1),
(30, 'Brazil', 'BR', 'BRA', '', 0, 1),
(31, 'British Indian Ocean Territory', 'IO', 'IOT', '', 0, 1),
(32, 'Brunei Darussalam', 'BN', 'BRN', '', 0, 1),
(33, 'Bulgaria', 'BG', 'BGR', '', 0, 1),
(34, 'Burkina Faso', 'BF', 'BFA', '', 0, 1),
(35, 'Burundi', 'BI', 'BDI', '', 0, 1),
(36, 'Cambodia', 'KH', 'KHM', '', 0, 1),
(37, 'Cameroon', 'CM', 'CMR', '', 0, 1),
(38, 'Canada', 'CA', 'CAN', '', 0, 1),
(39, 'Cape Verde', 'CV', 'CPV', '', 0, 1),
(40, 'Cayman Islands', 'KY', 'CYM', '', 0, 1),
(41, 'Central African Republic', 'CF', 'CAF', '', 0, 1),
(42, 'Chad', 'TD', 'TCD', '', 0, 1),
(43, 'Chile', 'CL', 'CHL', '', 0, 1),
(44, 'China', 'CN', 'CHN', '', 0, 1),
(45, 'Christmas Island', 'CX', 'CXR', '', 0, 1),
(46, 'Cocos (Keeling) Islands', 'CC', 'CCK', '', 0, 1),
(47, 'Colombia', 'CO', 'COL', '', 0, 1),
(48, 'Comoros', 'KM', 'COM', '', 0, 1),
(49, 'Congo', 'CG', 'COG', '', 0, 1),
(50, 'Cook Islands', 'CK', 'COK', '', 0, 1),
(51, 'Costa Rica', 'CR', 'CRI', '', 0, 1),
(52, 'Cote D''Ivoire', 'CI', 'CIV', '', 0, 1),
(53, 'Croatia', 'HR', 'HRV', '', 0, 1),
(54, 'Cuba', 'CU', 'CUB', '', 0, 1),
(55, 'Cyprus', 'CY', 'CYP', '', 0, 1),
(56, 'Czech Republic', 'CZ', 'CZE', '', 0, 1),
(57, 'Denmark', 'DK', 'DNK', '', 0, 1),
(58, 'Djibouti', 'DJ', 'DJI', '', 0, 1),
(59, 'Dominica', 'DM', 'DMA', '', 0, 1),
(60, 'Dominican Republic', 'DO', 'DOM', '', 0, 1),
(61, 'East Timor', 'TL', 'TLS', '', 0, 1),
(62, 'Ecuador', 'EC', 'ECU', '', 0, 1),
(63, 'Egypt', 'EG', 'EGY', '', 0, 1),
(64, 'El Salvador', 'SV', 'SLV', '', 0, 1),
(65, 'Equatorial Guinea', 'GQ', 'GNQ', '', 0, 1),
(66, 'Eritrea', 'ER', 'ERI', '', 0, 1),
(67, 'Estonia', 'EE', 'EST', '', 0, 1),
(68, 'Ethiopia', 'ET', 'ETH', '', 0, 1),
(69, 'Falkland Islands (Malvinas)', 'FK', 'FLK', '', 0, 1),
(70, 'Faroe Islands', 'FO', 'FRO', '', 0, 1),
(71, 'Fiji', 'FJ', 'FJI', '', 0, 1),
(72, 'Finland', 'FI', 'FIN', '', 0, 1),
(74, 'France, Metropolitan', 'FR', 'FRA', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(75, 'French Guiana', 'GF', 'GUF', '', 0, 1),
(76, 'French Polynesia', 'PF', 'PYF', '', 0, 1),
(77, 'French Southern Territories', 'TF', 'ATF', '', 0, 1),
(78, 'Gabon', 'GA', 'GAB', '', 0, 1),
(79, 'Gambia', 'GM', 'GMB', '', 0, 1),
(80, 'Georgia', 'GE', 'GEO', '', 0, 1),
(81, 'Germany', 'DE', 'DEU', '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(82, 'Ghana', 'GH', 'GHA', '', 0, 1),
(83, 'Gibraltar', 'GI', 'GIB', '', 0, 1),
(84, 'Greece', 'GR', 'GRC', '', 0, 1),
(85, 'Greenland', 'GL', 'GRL', '', 0, 1),
(86, 'Grenada', 'GD', 'GRD', '', 0, 1),
(87, 'Guadeloupe', 'GP', 'GLP', '', 0, 1),
(88, 'Guam', 'GU', 'GUM', '', 0, 1),
(89, 'Guatemala', 'GT', 'GTM', '', 0, 1),
(90, 'Guinea', 'GN', 'GIN', '', 0, 1),
(91, 'Guinea-Bissau', 'GW', 'GNB', '', 0, 1),
(92, 'Guyana', 'GY', 'GUY', '', 0, 1),
(93, 'Haiti', 'HT', 'HTI', '', 0, 1),
(94, 'Heard and Mc Donald Islands', 'HM', 'HMD', '', 0, 1),
(95, 'Honduras', 'HN', 'HND', '', 0, 1),
(96, 'Hong Kong', 'HK', 'HKG', '', 0, 1),
(97, 'Hungary', 'HU', 'HUN', '', 0, 1),
(98, 'Iceland', 'IS', 'ISL', '', 0, 1),
(99, 'India', 'IN', 'IND', '', 0, 1),
(100, 'Indonesia', 'ID', 'IDN', '', 0, 1),
(101, 'Iran (Islamic Republic of)', 'IR', 'IRN', '', 0, 1),
(102, 'Iraq', 'IQ', 'IRQ', '', 0, 1),
(103, 'Ireland', 'IE', 'IRL', '', 0, 1),
(104, 'Israel', 'IL', 'ISR', '', 0, 1),
(105, 'Italy', 'IT', 'ITA', '', 0, 1),
(106, 'Jamaica', 'JM', 'JAM', '', 0, 1),
(107, 'Japan', 'JP', 'JPN', '', 0, 1),
(108, 'Jordan', 'JO', 'JOR', '', 0, 1),
(109, 'Kazakhstan', 'KZ', 'KAZ', '', 0, 1),
(110, 'Kenya', 'KE', 'KEN', '', 0, 1),
(111, 'Kiribati', 'KI', 'KIR', '', 0, 1),
(112, 'North Korea', 'KP', 'PRK', '', 0, 1),
(113, 'South Korea', 'KR', 'KOR', '', 0, 1),
(114, 'Kuwait', 'KW', 'KWT', '', 0, 1),
(115, 'Kyrgyzstan', 'KG', 'KGZ', '', 0, 1),
(116, 'Lao People''s Democratic Republic', 'LA', 'LAO', '', 0, 1),
(117, 'Latvia', 'LV', 'LVA', '', 0, 1),
(118, 'Lebanon', 'LB', 'LBN', '', 0, 1),
(119, 'Lesotho', 'LS', 'LSO', '', 0, 1),
(120, 'Liberia', 'LR', 'LBR', '', 0, 1),
(121, 'Libyan Arab Jamahiriya', 'LY', 'LBY', '', 0, 1),
(122, 'Liechtenstein', 'LI', 'LIE', '', 0, 1),
(123, 'Lithuania', 'LT', 'LTU', '', 0, 1),
(124, 'Luxembourg', 'LU', 'LUX', '', 0, 1),
(125, 'Macau', 'MO', 'MAC', '', 0, 1),
(126, 'FYROM', 'MK', 'MKD', '', 0, 1),
(127, 'Madagascar', 'MG', 'MDG', '', 0, 1),
(128, 'Malawi', 'MW', 'MWI', '', 0, 1),
(129, 'Malaysia', 'MY', 'MYS', '', 0, 1),
(130, 'Maldives', 'MV', 'MDV', '', 0, 1),
(131, 'Mali', 'ML', 'MLI', '', 0, 1),
(132, 'Malta', 'MT', 'MLT', '', 0, 1),
(133, 'Marshall Islands', 'MH', 'MHL', '', 0, 1),
(134, 'Martinique', 'MQ', 'MTQ', '', 0, 1),
(135, 'Mauritania', 'MR', 'MRT', '', 0, 1),
(136, 'Mauritius', 'MU', 'MUS', '', 0, 1),
(137, 'Mayotte', 'YT', 'MYT', '', 0, 1),
(138, 'Mexico', 'MX', 'MEX', '', 0, 1),
(139, 'Micronesia, Federated States of', 'FM', 'FSM', '', 0, 1),
(140, 'Moldova, Republic of', 'MD', 'MDA', '', 0, 1),
(141, 'Monaco', 'MC', 'MCO', '', 0, 1),
(142, 'Mongolia', 'MN', 'MNG', '', 0, 1),
(143, 'Montserrat', 'MS', 'MSR', '', 0, 1),
(144, 'Morocco', 'MA', 'MAR', '', 0, 1),
(145, 'Mozambique', 'MZ', 'MOZ', '', 0, 1),
(146, 'Myanmar', 'MM', 'MMR', '', 0, 1),
(147, 'Namibia', 'NA', 'NAM', '', 0, 1),
(148, 'Nauru', 'NR', 'NRU', '', 0, 1),
(149, 'Nepal', 'NP', 'NPL', '', 0, 1),
(150, 'Netherlands', 'NL', 'NLD', '', 0, 1),
(151, 'Netherlands Antilles', 'AN', 'ANT', '', 0, 1),
(152, 'New Caledonia', 'NC', 'NCL', '', 0, 1),
(153, 'New Zealand', 'NZ', 'NZL', '', 0, 1),
(154, 'Nicaragua', 'NI', 'NIC', '', 0, 1),
(155, 'Niger', 'NE', 'NER', '', 0, 1),
(156, 'Nigeria', 'NG', 'NGA', '', 0, 1),
(157, 'Niue', 'NU', 'NIU', '', 0, 1),
(158, 'Norfolk Island', 'NF', 'NFK', '', 0, 1),
(159, 'Northern Mariana Islands', 'MP', 'MNP', '', 0, 1),
(160, 'Norway', 'NO', 'NOR', '', 0, 1),
(161, 'Oman', 'OM', 'OMN', '', 0, 1),
(162, 'Pakistan', 'PK', 'PAK', '', 0, 1),
(163, 'Palau', 'PW', 'PLW', '', 0, 1),
(164, 'Panama', 'PA', 'PAN', '', 0, 1),
(165, 'Papua New Guinea', 'PG', 'PNG', '', 0, 1),
(166, 'Paraguay', 'PY', 'PRY', '', 0, 1),
(167, 'Peru', 'PE', 'PER', '', 0, 1),
(168, 'Philippines', 'PH', 'PHL', '', 0, 1),
(169, 'Pitcairn', 'PN', 'PCN', '', 0, 1),
(170, 'Poland', 'PL', 'POL', '', 0, 1),
(171, 'Portugal', 'PT', 'PRT', '', 0, 1),
(172, 'Puerto Rico', 'PR', 'PRI', '', 0, 1),
(173, 'Qatar', 'QA', 'QAT', '', 0, 1),
(174, 'Reunion', 'RE', 'REU', '', 0, 1),
(175, 'Romania', 'RO', 'ROM', '', 0, 1),
(176, 'Russian Federation', 'RU', 'RUS', '', 0, 1),
(177, 'Rwanda', 'RW', 'RWA', '', 0, 1),
(178, 'Saint Kitts and Nevis', 'KN', 'KNA', '', 0, 1),
(179, 'Saint Lucia', 'LC', 'LCA', '', 0, 1),
(180, 'Saint Vincent and the Grenadines', 'VC', 'VCT', '', 0, 1),
(181, 'Samoa', 'WS', 'WSM', '', 0, 1),
(182, 'San Marino', 'SM', 'SMR', '', 0, 1),
(183, 'Sao Tome and Principe', 'ST', 'STP', '', 0, 1),
(184, 'Saudi Arabia', 'SA', 'SAU', '', 0, 1),
(185, 'Senegal', 'SN', 'SEN', '', 0, 1),
(186, 'Seychelles', 'SC', 'SYC', '', 0, 1),
(187, 'Sierra Leone', 'SL', 'SLE', '', 0, 1),
(188, 'Singapore', 'SG', 'SGP', '', 0, 1),
(189, 'Slovak Republic', 'SK', 'SVK', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city} {postcode}\r\n{zone}\r\n{country}', 0, 1),
(190, 'Slovenia', 'SI', 'SVN', '', 0, 1),
(191, 'Solomon Islands', 'SB', 'SLB', '', 0, 1),
(192, 'Somalia', 'SO', 'SOM', '', 0, 1),
(193, 'South Africa', 'ZA', 'ZAF', '', 0, 1),
(194, 'South Georgia &amp; South Sandwich Islands', 'GS', 'SGS', '', 0, 1),
(195, 'Spain', 'ES', 'ESP', '', 0, 1),
(196, 'Sri Lanka', 'LK', 'LKA', '', 0, 1),
(197, 'St. Helena', 'SH', 'SHN', '', 0, 1),
(198, 'St. Pierre and Miquelon', 'PM', 'SPM', '', 0, 1),
(199, 'Sudan', 'SD', 'SDN', '', 0, 1),
(200, 'Suriname', 'SR', 'SUR', '', 0, 1),
(201, 'Svalbard and Jan Mayen Islands', 'SJ', 'SJM', '', 0, 1),
(202, 'Swaziland', 'SZ', 'SWZ', '', 0, 1),
(203, 'Sweden', 'SE', 'SWE', '{company}\r\n{firstname} {lastname}\r\n{address_1}\r\n{address_2}\r\n{postcode} {city}\r\n{country}', 1, 1),
(204, 'Switzerland', 'CH', 'CHE', '', 0, 1),
(205, 'Syrian Arab Republic', 'SY', 'SYR', '', 0, 1),
(206, 'Taiwan', 'TW', 'TWN', '', 0, 1),
(207, 'Tajikistan', 'TJ', 'TJK', '', 0, 1),
(208, 'Tanzania, United Republic of', 'TZ', 'TZA', '', 0, 1),
(209, 'Thailand', 'TH', 'THA', '', 0, 1),
(210, 'Togo', 'TG', 'TGO', '', 0, 1),
(211, 'Tokelau', 'TK', 'TKL', '', 0, 1),
(212, 'Tonga', 'TO', 'TON', '', 0, 1),
(213, 'Trinidad and Tobago', 'TT', 'TTO', '', 0, 1),
(214, 'Tunisia', 'TN', 'TUN', '', 0, 1),
(215, 'Turkey', 'TR', 'TUR', '', 0, 1),
(216, 'Turkmenistan', 'TM', 'TKM', '', 0, 1),
(217, 'Turks and Caicos Islands', 'TC', 'TCA', '', 0, 1),
(218, 'Tuvalu', 'TV', 'TUV', '', 0, 1),
(219, 'Uganda', 'UG', 'UGA', '', 0, 1),
(220, 'Ukraine', 'UA', 'UKR', '', 0, 1),
(221, 'United Arab Emirates', 'AE', 'ARE', '', 0, 1),
(222, 'United Kingdom', 'GB', 'GBR', '', 1, 1),
(223, 'United States', 'US', 'USA', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city}, {zone} {postcode}\r\n{country}', 0, 1),
(224, 'United States Minor Outlying Islands', 'UM', 'UMI', '', 0, 1),
(225, 'Uruguay', 'UY', 'URY', '', 0, 1),
(226, 'Uzbekistan', 'UZ', 'UZB', '', 0, 1),
(227, 'Vanuatu', 'VU', 'VUT', '', 0, 1),
(228, 'Vatican City State (Holy See)', 'VA', 'VAT', '', 0, 1),
(229, 'Venezuela', 'VE', 'VEN', '', 0, 1),
(230, 'Viet Nam', 'VN', 'VNM', '', 0, 1),
(231, 'Virgin Islands (British)', 'VG', 'VGB', '', 0, 1),
(232, 'Virgin Islands (U.S.)', 'VI', 'VIR', '', 0, 1),
(233, 'Wallis and Futuna Islands', 'WF', 'WLF', '', 0, 1),
(234, 'Western Sahara', 'EH', 'ESH', '', 0, 1),
(235, 'Yemen', 'YE', 'YEM', '', 0, 1),
(237, 'Democratic Republic of Congo', 'CD', 'COD', '', 0, 1),
(238, 'Zambia', 'ZM', 'ZMB', '', 0, 1),
(239, 'Zimbabwe', 'ZW', 'ZWE', '', 0, 1),
(242, 'Montenegro', 'ME', 'MNE', '', 0, 1),
(243, 'Serbia', 'RS', 'SRB', '', 0, 1),
(244, 'Aaland Islands', 'AX', 'ALA', '', 0, 1),
(245, 'Bonaire, Sint Eustatius and Saba', 'BQ', 'BES', '', 0, 1),
(246, 'Curacao', 'CW', 'CUW', '', 0, 1),
(247, 'Palestinian Territory, Occupied', 'PS', 'PSE', '', 0, 1),
(248, 'South Sudan', 'SS', 'SSD', '', 0, 1),
(249, 'St. Barthelemy', 'BL', 'BLM', '', 0, 1),
(250, 'St. Martin (French part)', 'MF', 'MAF', '', 0, 1),
(251, 'Canary Islands', 'IC', 'ICA', '', 0, 1),
(252, 'Ascension Island (British)', 'AC', 'ASC', '', 0, 1),
(253, 'Kosovo, Republic of', 'XK', 'UNK', '', 0, 1),
(254, 'Isle of Man', 'IM', 'IMN', '', 0, 1),
(255, 'Tristan da Cunha', 'TA', 'SHN', '', 0, 1),
(256, 'Guernsey', 'GG', 'GGY', '', 0, 1),
(257, 'Jersey', 'JE', 'JEY', '', 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `ma_country_backup`
--

CREATE TABLE IF NOT EXISTS `ma_country_backup` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format` text NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`country_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=227 ;

--
-- Дамп данных таблицы `ma_country_backup`
--

INSERT INTO `ma_country_backup` (`country_id`, `name`, `iso_code_2`, `iso_code_3`, `address_format`, `postcode_required`, `status`) VALUES
(20, 'Белоруссия (Беларусь)', 'BY', 'BLR', '', 0, 1),
(80, 'Грузия', 'GE', 'GEO', '', 0, 1),
(109, 'Казахстан', 'KZ', 'KAZ', '', 0, 1),
(115, 'Киргизия (Кыргызстан)', 'KG', 'KGZ', '', 0, 1),
(176, 'Российская Федерация', 'RU', 'RUS', '', 0, 1),
(220, 'Украина', 'UA', 'UKR', '', 0, 1),
(226, 'Узбекистан', 'UZ', 'UZB', '', 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `ma_coupon`
--

CREATE TABLE IF NOT EXISTS `ma_coupon` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `code` varchar(10) NOT NULL,
  `type` char(1) NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `uses_total` int(11) NOT NULL,
  `uses_customer` varchar(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `ma_coupon`
--

INSERT INTO `ma_coupon` (`coupon_id`, `name`, `code`, `type`, `discount`, `logged`, `shipping`, `total`, `date_start`, `date_end`, `uses_total`, `uses_customer`, `status`, `date_added`) VALUES
(4, '-10% Discount', '2222', 'P', 10.0000, 0, 0, 0.0000, '2014-01-01', '2020-01-01', 10, '10', 0, '2009-01-27 13:55:03'),
(5, 'Free Shipping', '3333', 'P', 0.0000, 0, 1, 100.0000, '2014-01-01', '2014-02-01', 10, '10', 0, '2009-03-14 21:13:53'),
(6, '-10.00 Discount', '1111', 'F', 10.0000, 0, 0, 10.0000, '2014-01-01', '2020-01-01', 100000, '10000', 0, '2009-03-14 21:15:18');

-- --------------------------------------------------------

--
-- Структура таблицы `ma_coupon_category`
--

CREATE TABLE IF NOT EXISTS `ma_coupon_category` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ma_coupon_history`
--

CREATE TABLE IF NOT EXISTS `ma_coupon_history` (
  `coupon_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ma_coupon_product`
--

CREATE TABLE IF NOT EXISTS `ma_coupon_product` (
  `coupon_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ma_currency`
--

CREATE TABLE IF NOT EXISTS `ma_currency` (
  `currency_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` char(1) NOT NULL,
  `value` float(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`currency_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `ma_currency`
--

INSERT INTO `ma_currency` (`currency_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `status`, `date_modified`) VALUES
(1, 'Рубль', 'RUB', '', ' руб.', '0', 1.00000000, 1, '2016-02-22 01:11:27'),
(2, 'Доллар', 'USD', '', ' $', '0', 0.01300000, 1, '2016-02-21 12:54:38');

-- --------------------------------------------------------

--
-- Структура таблицы `ma_customer`
--

CREATE TABLE IF NOT EXISTS `ma_customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_group_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `cart` text,
  `wishlist` text,
  `newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `address_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `safe` tinyint(1) NOT NULL,
  `token` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Дамп данных таблицы `ma_customer`
--

INSERT INTO `ma_customer` (`customer_id`, `customer_group_id`, `store_id`, `firstname`, `lastname`, `email`, `telephone`, `fax`, `password`, `salt`, `cart`, `wishlist`, `newsletter`, `address_id`, `custom_field`, `ip`, `status`, `approved`, `safe`, `token`, `date_added`) VALUES
(1, 1, 0, 'test', 'test', 'test@test.com', '111', '', 'bfad4095aa36050571a4eb8206f1204cd0299bad', 'Or329McP1', NULL, NULL, 0, 1, '', '91.76.100.94', 1, 1, 0, '', '2016-01-14 15:37:55'),
(2, 1, 0, '', '', '', '', '', 'b44eb786ca6a09fa93f1c91539a823b49bd1059b', 'DRYK813xM', NULL, NULL, 0, 2, '', '184.73.31.6', 1, 1, 0, '', '2016-01-14 15:55:33'),
(3, 1, 0, 'Nikita', '01', '', '', '', 'dcc13b7e200b51511a6f83582e0a435e18882451', 'sGeBdr83V', NULL, NULL, 0, 3, '', '184.73.31.6', 1, 1, 0, '', '2016-01-14 15:56:38'),
(4, 1, 0, 'Nikita', '01', '1@1.com', '', '', 'f473bceb8f7f34d337952b5bbb599bba6ff702fb', 'kGCuwv454', NULL, NULL, 0, 4, '', '184.73.31.6', 1, 1, 0, '', '2016-01-14 15:56:54'),
(5, 1, 0, 'Nikita', '01', '1@1.com', '0000000000000', '', 'c8e64d7338728314bb1f03a563a41d3c8f5486ef', 'ciruBDpAj', NULL, NULL, 0, 5, '', '184.73.31.6', 1, 1, 0, '', '2016-01-14 15:57:34'),
(6, 1, 0, 'Nikita', '01', '1@1.com', '0000000000000', '', '23e91ee50ea5d4dae44e052e95252397bc90126c', 'G8BFgiKfr', NULL, NULL, 0, 6, '', '184.73.31.6', 1, 1, 0, '', '2016-01-14 15:59:04'),
(7, 1, 0, 'Дима', 'Шмаков', 'contact@shmakovdima.ru', '89035742365', '', '778aa62acdcc3649a9150ccfc4c628b0fc63841d', '8hHQqkENu', NULL, NULL, 1, 0, '', '127.0.0.1', 1, 1, 1, '', '2016-01-14 16:46:33'),
(8, 1, 0, 'Дмитрий', 'Шмаков', 'Hot-a-dog@mail.ru', '+7(421) 341-42-31', '123432', 'd9bd5c0823be99ceaac23f13e03bc98de1ad955e', '1Sq1hNBlJ', NULL, NULL, 1, 7, '', '91.76.100.94', 1, 1, 0, '', '2016-01-18 15:52:21'),
(9, 1, 0, 'Дмитрий', 'Шмаков', 'shmakovdima@yandex.ru', '+7(421) 341-42-31', '123432', '9198f7e8fc3b845d44b2b0fcada65b394a722971', 'Hnfxnlemt', NULL, NULL, 1, 8, '', '91.76.100.94', 1, 1, 0, '', '2016-01-18 15:53:03'),
(10, 1, 0, 'Дмитрий', 'Шмаков', 'shmakovdima2101@gmail.com', '+7(452) 435-43-24', '', 'a963126aae45ab05ba7b10f3f8d5ec2c5ea2d5f7', 'q2RISv9ac', NULL, NULL, 1, 9, '', '91.76.100.94', 1, 1, 0, '', '2016-01-18 15:54:10'),
(11, 1, 0, 'Дмитрий', 'Шмаков', 'test@shmakovdima.ru', '+7(245) 435-45-23', '', '24612db2124b84eeb55d28497af6916897d00461', 'JZSyT2SjF', NULL, NULL, 1, 10, '', '91.76.100.94', 1, 1, 0, '', '2016-01-18 15:55:16'),
(12, 1, 0, 'Дмитрий', 'Шмаков', 'сontact@shmakovdima.ru', '+7(425) 435-34-25', '', '6ab460b409dec1837cb8968c7346746bd26da942', 'hWtoHjCLR', NULL, NULL, 1, 11, '', '91.76.100.94', 1, 1, 0, '', '2016-01-18 15:56:11'),
(13, 1, 0, 'Дмитрий', 'Шмаков', 'Ho-a-dog@mail.ru', '+7(342) 134-32-41', '', 'ce3ac49d9d6b6b4331c9afb4d6fa3ea66f99bf26', 'qlTlx0Kjy', NULL, NULL, 1, 12, '', '91.76.100.94', 1, 1, 0, '', '2016-01-18 15:57:14'),
(14, 1, 0, 'Maria', 'Chamaeva', 'allformoney2008@yandex.ru', '+7(925) 381-19-22', '', 'c9dff9d0f790fc9f5132fb2c65fcbf7648abdacc', 'tasI5AR5P', NULL, NULL, 0, 13, '', '91.76.100.94', 1, 1, 0, '', '2016-01-18 16:14:14');

-- --------------------------------------------------------

--
-- Структура таблицы `ma_customer_activity`
--

CREATE TABLE IF NOT EXISTS `ma_customer_activity` (
  `activity_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`activity_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=45 ;

--
-- Дамп данных таблицы `ma_customer_activity`
--

INSERT INTO `ma_customer_activity` (`activity_id`, `customer_id`, `key`, `data`, `ip`, `date_added`) VALUES
(1, 1, 'register', '{"customer_id":1,"name":"test test"}', '91.76.100.94', '2016-01-14 15:37:56'),
(2, 4, 'register', '{"customer_id":4,"name":"Nikita 01"}', '184.73.31.6', '2016-01-14 15:56:54'),
(3, 5, 'register', '{"customer_id":5,"name":"Nikita 01"}', '184.73.31.6', '2016-01-14 15:57:34'),
(4, 6, 'register', '{"customer_id":6,"name":"Nikita 01"}', '184.73.31.6', '2016-01-14 15:59:04'),
(5, 7, 'login', '{"customer_id":"7","name":"\\u0414\\u0438\\u043c\\u0430 \\u0428\\u043c\\u0430\\u043a\\u043e\\u0432"}', '92.242.58.11', '2016-01-14 16:46:42'),
(6, 7, 'login', '{"customer_id":"7","name":"\\u0414\\u0438\\u043c\\u0430 \\u0428\\u043c\\u0430\\u043a\\u043e\\u0432"}', '92.242.58.11', '2016-01-14 17:33:12'),
(7, 8, 'register', '{"customer_id":8,"name":"\\u0414\\u043c\\u0438\\u0442\\u0440\\u0438\\u0439 \\u0428\\u043c\\u0430\\u043a\\u043e\\u0432"}', '91.76.100.94', '2016-01-18 15:52:21'),
(8, 9, 'register', '{"customer_id":9,"name":"\\u0414\\u043c\\u0438\\u0442\\u0440\\u0438\\u0439 \\u0428\\u043c\\u0430\\u043a\\u043e\\u0432"}', '91.76.100.94', '2016-01-18 15:53:03'),
(9, 10, 'register', '{"customer_id":10,"name":"\\u0414\\u043c\\u0438\\u0442\\u0440\\u0438\\u0439 \\u0428\\u043c\\u0430\\u043a\\u043e\\u0432"}', '91.76.100.94', '2016-01-18 15:54:10'),
(10, 11, 'register', '{"customer_id":11,"name":"\\u0414\\u043c\\u0438\\u0442\\u0440\\u0438\\u0439 \\u0428\\u043c\\u0430\\u043a\\u043e\\u0432"}', '91.76.100.94', '2016-01-18 15:55:16'),
(11, 12, 'register', '{"customer_id":12,"name":"\\u0414\\u043c\\u0438\\u0442\\u0440\\u0438\\u0439 \\u0428\\u043c\\u0430\\u043a\\u043e\\u0432"}', '91.76.100.94', '2016-01-18 15:56:11'),
(12, 13, 'register', '{"customer_id":13,"name":"\\u0414\\u043c\\u0438\\u0442\\u0440\\u0438\\u0439 \\u0428\\u043c\\u0430\\u043a\\u043e\\u0432"}', '91.76.100.94', '2016-01-18 15:57:14'),
(13, 14, 'register', '{"customer_id":14,"name":"Maria Chamaeva"}', '91.76.100.94', '2016-01-18 16:14:14'),
(14, 7, 'login', '{"customer_id":"7","name":"\\u0414\\u0438\\u043c\\u0430 \\u0428\\u043c\\u0430\\u043a\\u043e\\u0432"}', '91.76.100.94', '2016-01-18 16:22:03'),
(15, 14, 'login', '{"customer_id":"14","name":"Maria Chamaeva"}', '91.76.100.94', '2016-01-18 16:29:28'),
(16, 14, 'login', '{"customer_id":"14","name":"Maria Chamaeva"}', '91.76.100.94', '2016-01-18 16:30:07'),
(17, 7, 'login', '{"customer_id":"7","name":"\\u0414\\u0438\\u043c\\u0430 \\u0428\\u043c\\u0430\\u043a\\u043e\\u0432"}', '91.76.100.94', '2016-01-18 16:30:32'),
(18, 7, 'login', '{"customer_id":"7","name":"\\u0414\\u0438\\u043c\\u0430 \\u0428\\u043c\\u0430\\u043a\\u043e\\u0432"}', '91.76.100.94', '2016-01-18 16:30:51'),
(19, 7, 'login', '{"customer_id":"7","name":"\\u0414\\u0438\\u043c\\u0430 \\u0428\\u043c\\u0430\\u043a\\u043e\\u0432"}', '91.76.100.94', '2016-01-18 20:29:56'),
(20, 7, 'forgotten', '{"customer_id":"7","name":"\\u0414\\u0438\\u043c\\u0430 \\u0428\\u043c\\u0430\\u043a\\u043e\\u0432"}', '91.76.100.94', '2016-01-19 13:05:03'),
(21, 7, 'login', '{"customer_id":"7","name":"\\u0414\\u0438\\u043c\\u0430 \\u0428\\u043c\\u0430\\u043a\\u043e\\u0432"}', '91.76.100.94', '2016-01-19 15:33:48'),
(22, 7, 'forgotten', '{"customer_id":"7","name":"\\u0414\\u0438\\u043c\\u0430 \\u0428\\u043c\\u0430\\u043a\\u043e\\u0432"}', '109.252.67.151', '2016-02-08 14:24:47'),
(23, 7, 'login', '{"customer_id":"7","name":"\\u0414\\u0438\\u043c\\u0430 \\u0428\\u043c\\u0430\\u043a\\u043e\\u0432"}', '109.252.67.151', '2016-02-08 14:25:21'),
(24, 7, 'login', '{"customer_id":"7","name":"\\u0414\\u0438\\u043c\\u0430 \\u0428\\u043c\\u0430\\u043a\\u043e\\u0432"}', '109.252.67.151', '2016-02-08 15:49:50'),
(25, 7, 'login', '{"customer_id":"7","name":"\\u0414\\u0438\\u043c\\u0430 \\u0428\\u043c\\u0430\\u043a\\u043e\\u0432"}', '109.252.67.151', '2016-02-08 16:20:19'),
(26, 0, 'order_guest', '{"name":"dsfds dfsdfs","order_id":1}', '109.252.67.151', '2016-02-08 17:05:43'),
(27, 7, 'login', '{"customer_id":"7","name":"\\u0414\\u0438\\u043c\\u0430 \\u0428\\u043c\\u0430\\u043a\\u043e\\u0432"}', '109.252.67.151', '2016-02-08 18:17:43'),
(28, 7, 'login', '{"customer_id":"7","name":"\\u0414\\u0438\\u043c\\u0430 \\u0428\\u043c\\u0430\\u043a\\u043e\\u0432"}', '109.252.67.151', '2016-02-08 18:28:14'),
(29, 7, 'login', '{"customer_id":"7","name":"\\u0414\\u0438\\u043c\\u0430 \\u0428\\u043c\\u0430\\u043a\\u043e\\u0432"}', '194.186.220.68', '2016-02-08 21:02:34'),
(30, 7, 'password', '{"customer_id":"7","name":"\\u0414\\u0438\\u043c\\u0430 \\u0428\\u043c\\u0430\\u043a\\u043e\\u0432"}', '194.186.220.68', '2016-02-08 21:06:40'),
(31, 7, 'login', '{"customer_id":"7","name":"\\u0414\\u0438\\u043c\\u0430 \\u0428\\u043c\\u0430\\u043a\\u043e\\u0432"}', '87.240.37.78', '2016-02-09 00:19:42'),
(32, 7, 'login', '{"customer_id":"7","name":"\\u0414\\u0438\\u043c\\u0430 \\u0428\\u043c\\u0430\\u043a\\u043e\\u0432"}', '98.167.34.228', '2016-02-09 00:48:56'),
(33, 7, 'login', '{"customer_id":"7","name":"\\u0414\\u0438\\u043c\\u0430 \\u0428\\u043c\\u0430\\u043a\\u043e\\u0432"}', '87.240.37.78', '2016-02-09 00:49:20'),
(34, 7, 'login', '{"customer_id":"7","name":"\\u0414\\u0438\\u043c\\u0430 \\u0428\\u043c\\u0430\\u043a\\u043e\\u0432"}', '98.167.34.228', '2016-02-10 11:37:15'),
(35, 7, 'login', '{"customer_id":"7","name":"\\u0414\\u0438\\u043c\\u0430 \\u0428\\u043c\\u0430\\u043a\\u043e\\u0432"}', '87.240.37.78', '2016-02-10 16:48:56'),
(36, 7, 'login', '{"customer_id":"7","name":"\\u0414\\u0438\\u043c\\u0430 \\u0428\\u043c\\u0430\\u043a\\u043e\\u0432"}', '79.104.6.30', '2016-02-10 20:03:17'),
(37, 7, 'login', '{"customer_id":"7","name":"\\u0414\\u0438\\u043c\\u0430 \\u0428\\u043c\\u0430\\u043a\\u043e\\u0432"}', '98.167.34.228', '2016-02-11 08:40:13'),
(38, 7, 'login', '{"customer_id":"7","name":"\\u0414\\u0438\\u043c\\u0430 \\u0428\\u043c\\u0430\\u043a\\u043e\\u0432"}', '127.0.0.1', '2016-02-19 22:01:37'),
(39, 7, 'login', '{"customer_id":"7","name":"\\u0414\\u0438\\u043c\\u0430 \\u0428\\u043c\\u0430\\u043a\\u043e\\u0432"}', '127.0.0.1', '2016-02-19 22:01:53'),
(40, 7, 'login', '{"customer_id":"7","name":"\\u0414\\u0438\\u043c\\u0430 \\u0428\\u043c\\u0430\\u043a\\u043e\\u0432"}', '127.0.0.1', '2016-02-20 02:31:01'),
(41, 7, 'login', '{"customer_id":"7","name":"\\u0414\\u0438\\u043c\\u0430 \\u0428\\u043c\\u0430\\u043a\\u043e\\u0432"}', '127.0.0.1', '2016-02-20 20:44:39'),
(42, 7, 'edit', '{"customer_id":"7","name":"\\u0414\\u0438\\u043c\\u0430 \\u0428\\u043c\\u0430\\u043a\\u043e\\u0432"}', '127.0.0.1', '2016-02-21 16:41:32'),
(43, 7, 'login', '{"customer_id":"7","name":"\\u0414\\u0438\\u043c\\u0430 \\u0428\\u043c\\u0430\\u043a\\u043e\\u0432"}', '127.0.0.1', '2016-02-21 20:08:24'),
(44, 7, 'login', '{"customer_id":"7","name":"\\u0414\\u0438\\u043c\\u0430 \\u0428\\u043c\\u0430\\u043a\\u043e\\u0432"}', '127.0.0.1', '2016-02-21 20:47:39');

-- --------------------------------------------------------

--
-- Структура таблицы `ma_customer_group`
--

CREATE TABLE IF NOT EXISTS `ma_customer_group` (
  `customer_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `approval` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`customer_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `ma_customer_group`
--

INSERT INTO `ma_customer_group` (`customer_group_id`, `approval`, `sort_order`) VALUES
(1, 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `ma_customer_group_description`
--

CREATE TABLE IF NOT EXISTS `ma_customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`customer_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ma_customer_group_description`
--

INSERT INTO `ma_customer_group_description` (`customer_group_id`, `language_id`, `name`, `description`) VALUES
(1, 1, 'Default', 'test'),
(1, 2, 'Default', 'test');

-- --------------------------------------------------------

--
-- Структура таблицы `ma_customer_history`
--

CREATE TABLE IF NOT EXISTS `ma_customer_history` (
  `customer_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ma_customer_ip`
--

CREATE TABLE IF NOT EXISTS `ma_customer_ip` (
  `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=18 ;

--
-- Дамп данных таблицы `ma_customer_ip`
--

INSERT INTO `ma_customer_ip` (`customer_ip_id`, `customer_id`, `ip`, `date_added`) VALUES
(1, 1, '91.76.100.94', '2016-01-14 15:37:56'),
(2, 7, '92.242.58.11', '2016-01-14 16:46:42'),
(3, 8, '91.76.100.94', '2016-01-18 15:52:31'),
(4, 9, '91.76.100.94', '2016-01-18 15:53:09'),
(5, 10, '91.76.100.94', '2016-01-18 15:54:32'),
(6, 11, '91.76.100.94', '2016-01-18 15:55:33'),
(7, 12, '91.76.100.94', '2016-01-18 15:56:11'),
(8, 13, '91.76.100.94', '2016-01-18 15:57:14'),
(9, 14, '91.76.100.94', '2016-01-18 16:14:14'),
(10, 7, '91.76.100.94', '2016-01-18 16:22:03'),
(11, 7, '194.186.53.33', '2016-01-19 21:56:55'),
(12, 7, '109.252.67.151', '2016-02-08 14:25:21'),
(13, 7, '194.186.220.68', '2016-02-08 21:02:34'),
(14, 7, '87.240.37.78', '2016-02-09 00:19:42'),
(15, 7, '98.167.34.228', '2016-02-09 00:48:56'),
(16, 7, '79.104.6.30', '2016-02-10 20:03:17'),
(17, 7, '127.0.0.1', '2016-02-19 22:01:37');

-- --------------------------------------------------------

--
-- Структура таблицы `ma_customer_login`
--

CREATE TABLE IF NOT EXISTS `ma_customer_login` (
  `customer_login_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`customer_login_id`),
  KEY `email` (`email`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- Дамп данных таблицы `ma_customer_login`
--

INSERT INTO `ma_customer_login` (`customer_login_id`, `email`, `ip`, `total`, `date_added`, `date_modified`) VALUES
(1, 'admin', '91.76.100.94', 1, '2016-01-11 14:53:37', '2016-01-11 14:53:37'),
(2, 'admin', '87.240.37.78', 2, '2016-01-13 23:39:35', '2016-02-09 00:48:21'),
(3, 'admin', '92.242.58.11', 1, '2016-01-14 16:44:47', '2016-01-14 16:44:47'),
(7, 'admin', '127.0.0.1', 1, '2016-02-19 19:01:49', '2016-02-19 19:01:49');

-- --------------------------------------------------------

--
-- Структура таблицы `ma_customer_online`
--

CREATE TABLE IF NOT EXISTS `ma_customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ma_customer_reward`
--

CREATE TABLE IF NOT EXISTS `ma_customer_reward` (
  `customer_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `points` int(8) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_reward_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ma_customer_transaction`
--

CREATE TABLE IF NOT EXISTS `ma_customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ma_customer_wishlist`
--

CREATE TABLE IF NOT EXISTS `ma_customer_wishlist` (
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_id`,`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ma_customer_wishlist`
--

INSERT INTO `ma_customer_wishlist` (`customer_id`, `product_id`, `date_added`) VALUES
(7, 51, '2016-02-10 20:55:36'),
(7, 65, '2016-02-21 20:47:39'),
(7, 67, '2016-02-21 19:41:05'),
(7, 52, '2016-02-21 20:51:03'),
(7, 66, '2016-02-21 19:40:53');

-- --------------------------------------------------------

--
-- Структура таблицы `ma_custom_field`
--

CREATE TABLE IF NOT EXISTS `ma_custom_field` (
  `custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `location` varchar(7) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ma_custom_field_customer_group`
--

CREATE TABLE IF NOT EXISTS `ma_custom_field_customer_group` (
  `custom_field_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ma_custom_field_description`
--

CREATE TABLE IF NOT EXISTS `ma_custom_field_description` (
  `custom_field_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ma_custom_field_value`
--

CREATE TABLE IF NOT EXISTS `ma_custom_field_value` (
  `custom_field_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `custom_field_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ma_custom_field_value_description`
--

CREATE TABLE IF NOT EXISTS `ma_custom_field_value_description` (
  `custom_field_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`custom_field_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ma_download`
--

CREATE TABLE IF NOT EXISTS `ma_download` (
  `download_id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(128) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ma_download_description`
--

CREATE TABLE IF NOT EXISTS `ma_download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`download_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ma_easy_blog_article`
--

CREATE TABLE IF NOT EXISTS `ma_easy_blog_article` (
  `article_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_modified` datetime NOT NULL,
  `viewed` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `ma_easy_blog_article`
--

INSERT INTO `ma_easy_blog_article` (`article_id`, `sort_order`, `status`, `date_modified`, `viewed`) VALUES
(1, 1, 1, '2016-02-19 18:10:42', 0),
(2, 1, 1, '2016-02-19 17:32:12', 0),
(3, 1, 1, '2016-02-19 17:32:08', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `ma_easy_blog_article_description`
--

CREATE TABLE IF NOT EXISTS `ma_easy_blog_article_description` (
  `article_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `intro_text` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `tag` text,
  PRIMARY KEY (`article_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ma_easy_blog_article_description`
--

INSERT INTO `ma_easy_blog_article_description` (`article_id`, `language_id`, `name`, `description`, `intro_text`, `meta_title`, `meta_description`, `meta_keyword`, `author`, `tag`) VALUES
(1, 1, 'Бренд TRONA – это показатель Вашего престижа в эпоху Золотого Века.', '&lt;p&gt;\r\n	&lt;img src=&quot;http://localhost/image/catalog/1200081396-900x350w.jpg&quot;&gt;Бренд TRONA – это показатель Вашего престижа в эпоху Золотого Века. Украшения TRONA ослепляют своим блеском, притягивают как магнит и будоражат фантазии прохожих. Это не просто символ Вашего статуса, это показатель Вашего вкуса. Все украшения TRONA обладают высоким качеством, о котором свидетельствует внутренняя богатая отделка и классический дизайн.&lt;/p&gt;\r\n\r\n&lt;p&gt;\r\n	Браслеты TRONA – это ручная работа итальянских мастеров, сделанная из хромированного палладия и золота в 23 карат. Все веревочки плетутся вручную. Каждый браслет обладает своим шармом, а геральдическая эмблема TRONA, выгравированная в металле, будет роскошно смотреться на Вашей руке.&lt;/p&gt;\r\n\r\n&lt;p&gt;\r\n	Помимо браслетов, TRONA также производит эксклюзивную плавающую мебель для бассейнов. Кресло TRONA является единственным на рынке креслом, которое можно использовать не только в воде, но и на суше. Такие кресла идеально впишутся в интерьер уличной мебели и всегда роскошно будут смотреться на пляже, в бассейне, в саду.&lt;/p&gt;\r\n\r\n&lt;p&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n\r\n&lt;p&gt;\r\n	Итальянскую мебель TRONA действительно можно назвать инновационным продуктом с рядом встроенных функций. Эта мебель выполнена из материалов, на которые погодные условия мало оказывают влияние. Каждая деталь обработана специальными средствами против плесени и пятен. Все материалы обладают водоотталкивающим эффектом и устойчивы к солнечному свету и атмосферным осадкам. Т&lt;/p&gt;\r\n\r\n\r\n&lt;p&gt;\r\n	Технология изготовления мебели TRONA запатентована, все детали производятся на территории Италии вручную. Каждую товарную позицию можно персонализировать путем нанесения Вашего логотипа, семейного Герба или просто любимых крылатых фраз.&lt;/p&gt;', '&lt;p&gt;&lt;img src=&quot;http://localhost/image/catalog/1200081396-900x350w.jpg&quot;&gt;Украшения TRONA ослепляют своим блеском, притягивают как магнит и будоражат фантазии прохожих. Это не просто символ Вашего статуса, это показатель Вашего вкуса. Все украшения TRONA обладают высоким качеством, о котором свидетельствует внутренняя богатая отделка и классический дизайн.&lt;/p&gt;\r\n', 'Тестовая статья', '', '', '', NULL),
(1, 2, 'Тестовая статья', '&lt;p&gt;Тестовая статья Полный текст&lt;/p&gt;', '&lt;p&gt;Тестовая статья Вводный текст&lt;/p&gt;', 'Тестовая статья', '', '', '', NULL),
(2, 1, 'Уход за искусственным мехом', '&lt;p&gt;	&lt;/p&gt;&lt;p&gt;&lt;img src=&quot;http://localhost/image/catalog/521-900x350w.jpg&quot;&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Чтобы недорогое изделие из искусственного меха прослужило не один сезон, следует учитывать особенности ухода за ним.&lt;/p&gt;&lt;h2&gt;	Основные принципы ухода за искусственным мехом&lt;/h2&gt;&lt;ul&gt;	&lt;li&gt;		Изделие из искусственного меха до осени следует хранить на вешалке в бумажном пакете. Во избежание образования заломов и сгибов, вещь должна находиться в свободном состоянии.&lt;/li&gt;	&lt;li&gt;		Воротники с женских осенних курток можно отстегивать и бережно хранить в расправленном состоянии.&lt;/li&gt;	&lt;li&gt;		Искусственный мех осенних женских изделий можно стирать. Но стоит помнить, что нельзя использовать машинный отжим. Стирка возможна при температуре 45 градусов. В противном случае мех деформируется и даст усадку.&lt;/li&gt;	&lt;li&gt;		Запылившуюся вещь можно просто выколотить, разложив изделие на простыне. Это дешевый способ освежить шубу в домашних условиях.&lt;/li&gt;	&lt;li&gt;		Чтобы добиться ослепительного блеска искусственного меха, следует воспользоваться древним рецептом: смочить ватный тампон в одной части глицерина 99 частей денатурата в 100 частях воды. Этой смесью обработать изделие. Но для окрашенного меха этот вариант запретный, так как можно испортить целостность цвета.&lt;/li&gt;	&lt;li&gt;		На шубы из искусственного меха нельзя вешать сумки через плечо. Это действие может безвозвратно испортить вещь. Периодическое расчесывание поможет меху сохранить первоначальный вид.&lt;/li&gt;	&lt;li&gt;		Размер осеннего мехового изделия должен быть подобран с учетом особенностей фигуры.&lt;/li&gt;	&lt;li&gt;		Искусственный мех следует защищать от влажных осенних погодных условий, снега и дождя. Глажка утюгом недопустима.&lt;/li&gt;	&lt;li&gt;		Молодежные кожаные куртки на осень могут быть разных фасонов, но искусственный мех придает каждой из них особый шарм. Наполнителем для недорогих коротких осенних курток в большинстве случаев служит синтепон.&lt;/li&gt;	&lt;li&gt;		Изделие на осень из искусственного меха – недорогой способ выглядеть стильно. Зимние искусственные шубы стоят недорого, но можно попасть на сезонную распродажу и порадовать себя вдвойне.&lt;/li&gt;&lt;/ul&gt;', '&lt;img src=&quot;http://localhost/image/catalog/521-900x350w.jpg&quot;&gt;\r\n&lt;p&gt;Кожаные осенние куртки с шикарными воротниками и капюшонами смотрятся великолепно, однако натуральные меха – дорогое удовольствие, доступное не каждому человеку. Сегодня женские шубы и воротники из искусственного меха являются дешевой альтернативой настоящему меху. Именно поэтом молодежный вариант женских коротких шуб и осенних курток на синтепоне с меховой отстрочкой очень популярен. Примечательно, что современные дизайнеры создают такие модели на осень и зиму, которые по виду не отличаются от натуральных. Выбор искусственных осенних и зимних изделий в наши дни огромен, на любой вкус и размер.&lt;/p&gt;', 'Уход за искусственным мехом', '', '', '', NULL),
(2, 2, 'Уход за искусственным мехом', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Уход за искусственным мехом', '', '', '', NULL),
(3, 1, 'Стоит ли экономить на мужской обуви', '&lt;img src=&quot;http://localhost/image/catalog/118728-800w-900x350w.jpg&quot;&gt;\r\n&lt;h2&gt;Возможные последствия экономии на качественной обуви&lt;/h2&gt;\r\n&lt;p&gt;	Недорогой вариант мужской обуви, как правило, обладает невысоким качеством материалов, он не позволяет ноге дышать и доставляет дискомфорт. Среди последствий использования некачественной и дешевой обуви находятся:&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;		Некачественная и неудобная мужская обувь может способствовать появлению натоптышей и мозолей.&lt;/li&gt;\r\n	&lt;li&gt;		Недорогой материал низкого качества из которого изготавливают обувь не позволяет ноге дышать и может способствовать возникновению грибкового заболевания.&lt;/li&gt;\r\n	&lt;li&gt;		Обувь, размер которой подобран неправильно способствует появлению дискомфорта и различных осложнений. Слишком маленький размер приводит к искривлению пальцев ног, исправить которое можно в основном при помощи хирургического вмешательства. Слишком большой размер – появлению волдырей. Следует отметить, что для каждой марки обуви существует свой размерный ряд, благодаря которому можно подобрать правильный размер.&lt;/li&gt;\r\n	&lt;li&gt;		Тяжелая мужская обувь может привести к расширению вен на ногах.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;h2&gt;	Как правильно выбрать мужскую обувь&lt;/h2&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;		Мужская обувь должна быть легкой и прочной.&lt;/li&gt;\r\n	&lt;li&gt;		При примерке обуви необходимо обратить внимание, чтобы ее размер подходил вам идеально. Как слишком маленький, так и слишком большой размер может способствовать развитию искривления стопы и возникновению различных заболеваний. Размер обуви поможет определить специальная размерная сетка или таблица.&lt;/li&gt;\r\n	&lt;li&gt;		Перед покупкой следует тщательно прощупать задники, которые должны быть упругими, но не сильно жесткими. Также необходимо проверить упругость носка, нажав на него пальцем.&lt;/li&gt;\r\n	&lt;li&gt;		Эластичность подошвы проверяется путем сгибания последней. Недорогой вариант подошвы, как правило, не сгибается. В подобной обуви ноги зачастую быстро устают.&lt;/li&gt;\r\n	&lt;li&gt;		Рекомендуется выбирать обувь с натуральной подкладкой и анатомической стелькой.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;	Существует несколько вещей на которых ни в коем случает не следует экономить, например, на обуви. Она должна быть качественной, удобной и иметь привлекательный внешний вид. Перед покупкой обуви важно правильно определить свой размер и обратить внимание на размерный ряд определенной марки и модели обуви.&lt;/p&gt;', '&lt;p&gt;&lt;img src=&quot;http://localhost/image/catalog/118728-800w-900x350w.jpg&quot;&gt;&lt;/p&gt;\r\n&lt;p&gt;Мужская обувь является показателем социального статуса представителя сильного пола. Неаккуратная, некачественная и дешевая обувь оставляет неприятное впечатление о ее владельце. Однако не только по этой причине не следует экономить на этом предмете гардероба. Известно, что обувь отвечает за здоровье человека и его комфорт.&lt;/p&gt;', 'Стоит ли экономить на мужской обуви', '', '', '', NULL),
(3, 2, 'Стоит ли экономить на мужской обуви', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Стоит ли экономить на мужской обуви', '', '', '', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `ma_event`
--

CREATE TABLE IF NOT EXISTS `ma_event` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `trigger` text NOT NULL,
  `action` text NOT NULL,
  PRIMARY KEY (`event_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `ma_event`
--

INSERT INTO `ma_event` (`event_id`, `code`, `trigger`, `action`) VALUES
(1, 'voucher', 'post.order.history.add', 'total/voucher/send');

-- --------------------------------------------------------

--
-- Структура таблицы `ma_extension`
--

CREATE TABLE IF NOT EXISTS `ma_extension` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `code` varchar(32) NOT NULL,
  PRIMARY KEY (`extension_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- Дамп данных таблицы `ma_extension`
--

INSERT INTO `ma_extension` (`extension_id`, `type`, `code`) VALUES
(1, 'payment', 'cod'),
(2, 'total', 'shipping'),
(3, 'total', 'sub_total'),
(4, 'total', 'tax'),
(5, 'total', 'total'),
(6, 'module', 'banner'),
(7, 'module', 'carousel'),
(8, 'total', 'credit'),
(9, 'shipping', 'flat'),
(10, 'total', 'handling'),
(11, 'total', 'low_order_fee'),
(12, 'total', 'coupon'),
(13, 'module', 'category'),
(14, 'module', 'account'),
(15, 'total', 'reward'),
(16, 'total', 'voucher'),
(17, 'payment', 'free_checkout'),
(18, 'module', 'featured'),
(19, 'module', 'slideshow'),
(21, 'module', 'filter'),
(22, 'module', 'special'),
(23, 'module', 'google_hangouts'),
(24, 'feed', 'google_base'),
(25, 'feed', 'google_sitemap'),
(26, 'analytics', 'google_analytics');

-- --------------------------------------------------------

--
-- Структура таблицы `ma_filter`
--

CREATE TABLE IF NOT EXISTS `ma_filter` (
  `filter_id` int(11) NOT NULL AUTO_INCREMENT,
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=63 ;

--
-- Дамп данных таблицы `ma_filter`
--

INSERT INTO `ma_filter` (`filter_id`, `filter_group_id`, `sort_order`) VALUES
(32, 2, 0),
(31, 2, 0),
(30, 2, 0),
(29, 2, 0),
(28, 2, 0),
(27, 2, 0),
(26, 2, 0),
(25, 2, 0),
(24, 2, 0),
(23, 2, 0),
(22, 2, 0),
(21, 2, 0),
(20, 2, 0),
(19, 2, 0),
(18, 2, 0),
(17, 2, 0),
(16, 2, 0),
(15, 2, 0),
(14, 2, 0),
(13, 2, 0),
(12, 2, 0),
(11, 2, 0),
(10, 2, 0),
(9, 2, 0),
(8, 2, 0),
(7, 2, 0),
(4, 2, 0),
(5, 2, 0),
(6, 2, 0),
(36, 3, 0),
(35, 3, 0),
(34, 3, 0),
(33, 3, 0),
(37, 2, 0),
(38, 2, 0),
(39, 2, 0),
(40, 2, 0),
(41, 2, 0),
(42, 3, 0),
(43, 3, 0),
(44, 3, 0),
(45, 3, 0),
(46, 3, 0),
(47, 3, 0),
(48, 3, 0),
(49, 3, 0),
(50, 3, 0),
(51, 3, 0),
(52, 3, 0),
(53, 3, 0),
(54, 3, 0),
(55, 3, 0),
(56, 3, 0),
(57, 3, 0),
(58, 3, 0),
(59, 3, 0),
(60, 3, 0),
(61, 3, 0),
(62, 3, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `ma_filter_description`
--

CREATE TABLE IF NOT EXISTS `ma_filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ma_filter_description`
--

INSERT INTO `ma_filter_description` (`filter_id`, `language_id`, `filter_group_id`, `name`) VALUES
(24, 1, 2, 'Аквамарин'),
(23, 2, 2, 'Sand-coloured'),
(23, 1, 2, 'Песочный'),
(22, 2, 2, 'Olive-green'),
(22, 1, 2, 'Оливковый'),
(21, 2, 2, 'Emerald-green'),
(21, 1, 2, 'Изумрудный'),
(20, 2, 2, 'Azure'),
(20, 1, 2, 'Голубой'),
(19, 2, 2, 'Indigo'),
(19, 1, 2, 'Индиго'),
(18, 2, 2, 'Lilac'),
(18, 1, 2, 'Сиреневый'),
(17, 2, 2, 'Raspberry-red'),
(17, 1, 2, 'Малиновый'),
(16, 2, 2, 'Brown'),
(16, 1, 2, 'Коричневый'),
(15, 2, 2, 'Ivory'),
(15, 1, 2, 'Айвори'),
(14, 2, 2, 'Grey'),
(14, 1, 2, 'Серый'),
(13, 2, 2, 'Black'),
(13, 1, 2, 'Черный'),
(12, 2, 2, 'White'),
(12, 1, 2, 'Белый'),
(11, 2, 2, 'Purple'),
(11, 1, 2, 'Фиолетовый'),
(10, 2, 2, 'Pink'),
(10, 1, 2, 'Розовый'),
(9, 2, 2, 'Green'),
(9, 1, 2, 'Зеленый'),
(8, 2, 2, 'Blue'),
(8, 1, 2, 'Синий'),
(7, 2, 2, 'Red'),
(7, 1, 2, 'Красный'),
(4, 2, 2, 'Beige'),
(4, 1, 2, 'Бежевый'),
(5, 2, 2, 'Orange'),
(5, 1, 2, 'Оранжевый'),
(6, 2, 2, 'Yellow'),
(6, 1, 2, 'Желтый'),
(36, 2, 3, 'L'),
(36, 1, 3, 'L'),
(35, 2, 3, 'M'),
(35, 1, 3, 'M'),
(34, 2, 3, 'S'),
(34, 1, 3, 'S'),
(33, 2, 3, 'XS'),
(33, 1, 3, 'XS'),
(24, 2, 2, 'Aquamarine'),
(25, 1, 2, 'Шоколадный'),
(25, 2, 2, 'Chocolate-brown'),
(26, 1, 2, 'Хаки'),
(26, 2, 2, 'Khaki'),
(27, 1, 2, 'Коралловый'),
(27, 2, 2, 'Coralline '),
(28, 1, 2, 'Бирюзовый'),
(28, 2, 2, 'Cyan'),
(29, 1, 2, 'Бордовый'),
(29, 2, 2, 'Maroon'),
(30, 1, 2, 'Терракотовый'),
(30, 2, 2, 'Terra-cotta'),
(31, 1, 2, 'Золотой'),
(31, 2, 2, 'Gold'),
(32, 1, 2, 'Серебряный'),
(32, 2, 2, 'Silver'),
(37, 1, 2, 'Клетка'),
(37, 2, 2, 'checkwork'),
(38, 1, 2, 'Полоска'),
(38, 2, 2, 'stripe'),
(39, 1, 2, 'Горох'),
(39, 2, 2, 'polka dot'),
(40, 1, 2, 'Леопард'),
(40, 2, 2, 'leopard'),
(41, 1, 2, 'Зебра'),
(41, 2, 2, 'zebra'),
(42, 1, 3, 'XL'),
(42, 2, 3, 'XL'),
(43, 1, 3, 'XXL'),
(43, 2, 3, 'XXL'),
(44, 1, 3, '26'),
(44, 2, 3, '26'),
(45, 1, 3, '27'),
(45, 2, 3, '27'),
(46, 1, 3, '28'),
(46, 2, 3, '28'),
(47, 1, 3, '29'),
(47, 2, 3, '29'),
(48, 1, 3, '30'),
(48, 2, 3, '30'),
(49, 1, 3, '36'),
(49, 2, 3, '36'),
(50, 1, 3, '37'),
(50, 2, 3, '37'),
(51, 1, 3, '38'),
(51, 2, 3, '38'),
(52, 1, 3, '39'),
(52, 2, 3, '39'),
(53, 1, 3, '40'),
(53, 2, 3, '40'),
(54, 1, 3, '42'),
(54, 2, 3, '42'),
(55, 1, 3, '44'),
(55, 2, 3, '44'),
(56, 1, 3, '46'),
(56, 2, 3, '46'),
(57, 1, 3, '48'),
(57, 2, 3, '48'),
(58, 1, 3, '50'),
(58, 2, 3, '50'),
(59, 1, 3, '52'),
(59, 2, 3, '52'),
(60, 1, 3, '54'),
(60, 2, 3, '54'),
(61, 1, 3, '56'),
(61, 2, 3, '56'),
(62, 1, 3, '58'),
(62, 2, 3, '58');

-- --------------------------------------------------------

--
-- Структура таблицы `ma_filter_group`
--

CREATE TABLE IF NOT EXISTS `ma_filter_group` (
  `filter_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`filter_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `ma_filter_group`
--

INSERT INTO `ma_filter_group` (`filter_group_id`, `sort_order`) VALUES
(2, 1),
(3, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `ma_filter_group_description`
--

CREATE TABLE IF NOT EXISTS `ma_filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`filter_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ma_filter_group_description`
--

INSERT INTO `ma_filter_group_description` (`filter_group_id`, `language_id`, `name`) VALUES
(2, 1, 'Цвет'),
(3, 1, 'Размер'),
(2, 2, 'Color'),
(3, 2, 'Size');

-- --------------------------------------------------------

--
-- Структура таблицы `ma_geo_zone`
--

CREATE TABLE IF NOT EXISTS `ma_geo_zone` (
  `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_modified` datetime NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`geo_zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `ma_geo_zone`
--

INSERT INTO `ma_geo_zone` (`geo_zone_id`, `name`, `description`, `date_modified`, `date_added`) VALUES
(3, 'Зона НДС', 'Облагаемые НДС', '2014-09-09 11:48:13', '2014-05-21 22:30:20');

-- --------------------------------------------------------

--
-- Структура таблицы `ma_google_base_category`
--

CREATE TABLE IF NOT EXISTS `ma_google_base_category` (
  `google_base_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`google_base_category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ma_google_base_category_to_category`
--

CREATE TABLE IF NOT EXISTS `ma_google_base_category_to_category` (
  `google_base_category_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`google_base_category_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ma_information`
--

CREATE TABLE IF NOT EXISTS `ma_information` (
  `information_id` int(11) NOT NULL AUTO_INCREMENT,
  `bottom` int(1) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`information_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- Дамп данных таблицы `ma_information`
--

INSERT INTO `ma_information` (`information_id`, `bottom`, `sort_order`, `status`) VALUES
(3, 1, 3, 1),
(4, 0, 1, 1),
(5, 1, 4, 1),
(7, 1, 0, 1),
(8, 0, 0, 1),
(9, 0, 0, 1),
(10, 0, 0, 1),
(11, 0, 0, 1),
(12, 0, 0, 1),
(13, 0, 0, 1),
(14, 0, 0, 1),
(15, 0, 0, 1),
(16, 0, 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `ma_information_description`
--

CREATE TABLE IF NOT EXISTS `ma_information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`information_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ma_information_description`
--

INSERT INTO `ma_information_description` (`information_id`, `language_id`, `title`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(5, 1, 'Условия соглашения', '&lt;p&gt;\r\n	Terms &amp;amp; Conditions&lt;/p&gt;', 'Условия соглашения', '', ''),
(3, 1, 'Политика Безопасности', '&lt;p&gt;\r\n	Privacy Policy&lt;/p&gt;', 'Политика Безопасности', '', ''),
(7, 1, 'Доставка и оплата', '&lt;p&gt;Эта статья редактируется в админ-панели Каталог &amp;gt;&amp;gt; Статьи &amp;gt;&amp;gt; Доставка и оплата&lt;/p&gt;', 'delivery', '', ''),
(9, 1, 'Программа лояльности', '&lt;p&gt;&lt;span style=&quot;line-height: 17.1428394317627px;&quot;&gt;Эта статья редактируется в админ-панели Каталог &amp;gt;&amp;gt; Статьи &amp;gt;&amp;gt; Программа лояльности&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 'Программа лояльности', '', ''),
(11, 1, 'Как выбрать размер', '&lt;p&gt;&lt;span style=&quot;font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 20px;&quot;&gt;Эта статья редактируется в админ-панели Каталог &amp;gt;&amp;gt; Статьи &amp;gt;&amp;gt; Как выбрать размер&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 'Как выбрать размер', '', ''),
(5, 2, 'Условия соглашения', '&lt;p&gt;\r\n	Terms &amp;amp; Conditions&lt;/p&gt;', 'Условия соглашения', '', ''),
(3, 2, 'Политика Безопасности', '&lt;p&gt;\r\n	Privacy Policy&lt;/p&gt;', 'Политика Безопасности', '', ''),
(7, 2, 'Доставка и оплата', '&lt;p&gt;Эта статья редактируется в админ-панели Каталог &amp;gt;&amp;gt; Статьи &amp;gt;&amp;gt; Доставка и оплата&lt;/p&gt;', 'delivery', '', ''),
(9, 2, 'Программа лояльности', '&lt;p&gt;&lt;span style=&quot;line-height: 17.1428394317627px;&quot;&gt;Эта статья редактируется в админ-панели Каталог &amp;gt;&amp;gt; Статьи &amp;gt;&amp;gt; Программа лояльности&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 'Программа лояльности', '', ''),
(10, 2, 'Wholesailors', '&lt;p&gt;&lt;span style=&quot;line-height: 17.1428394317627px;&quot;&gt;Эта статья редактируется в админ-панели Каталог &amp;gt;&amp;gt; Статьи &amp;gt;&amp;gt; Оптовикам&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 'Оптовикам', '', ''),
(11, 2, 'Как выбрать размер', '&lt;p&gt;&lt;span style=&quot;font-family: ''Helvetica Neue'', Helvetica, Arial, sans-serif; line-height: 20px;&quot;&gt;Эта статья редактируется в админ-панели Каталог &amp;gt;&amp;gt; Статьи &amp;gt;&amp;gt; Как выбрать размер&lt;/span&gt;&lt;br&gt;&lt;/p&gt;', 'Как выбрать размер', '', ''),
(4, 1, 'О нас', '&lt;p&gt;&lt;span&gt;Angel Moda&amp;nbsp;– молодой онлайн проект российского предпринимателя, работающего на рынке fashion вот уже более 15 лет.&amp;nbsp; В интернет-магазине Angel Moda представлено 16 брендов итальянской одежды, обуви, аксессуаров и бижутерии. Также мы являемся официальным и единственным представителем эксклюзивной мебели ручной работы для бассейнов от итальянского бренда TRONA.&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span&gt;За много лет работы в индустрии моды у нас появилась широкая сеть оптовиков из 30 городов России и стран СНГ. Мы регулярно посещаем европейские недели моды и всегда в курсе последних fashion тенденций на грядущий сезон.&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span&gt;Для всех клиентов мы проводим регулярные акции, конкурсы и специальные предложения. А самые лояльные покупатели работают с нами на индивидуальных условиях.&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span&gt;Для любителей умопомрачительного шоппинга мы организовываем шоп-туры по всей Италии, помогаем с оформлением визы, покупкой авиабилетов, выбором отеля, трансфером на комфортабельном автомобиле, учитывая пожелания каждого клиента. Мы имеем доступ ко всем итальянским фабрикам по производству одежды, обуви, сумок, шуб, аксессуаров и украшений. Те, кого заинтересует итальянская мебель и предметы интерьера, также могут отправиться с нами в шоп-тур и сделать выгодные покупки.&lt;/span&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span&gt;Компания Angel Moda гарантирует Вам подлинность и высокое качество брендов, представленных на сайте. Мы также ручаемся за качественную организацию Вашего итальянского шоп-тура. И всегда рады новому сотрудничеству с надеждой на плодотворную совместную работу.&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;span&gt;Свои вопросы и пожелания Вы можете направить на почту, которую ежедневно проверяет Директор компании Angel Moda: &lt;a href=&quot;mailto:order@angel-moda.com&quot;&gt;order@angel-moda.com&lt;/a&gt;.&lt;/span&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;', 'О нас', '', ''),
(4, 2, 'About us', '&lt;p&gt;Angel Moda - online project young Russian businessman operating in the market of fashion for more than 15 years. In the online store Angel Moda represented 16 brands of Italian fashion clothing, shoes, accessories and jewelry. Also we are the official and sole representative of exclusive handmade furniture for swimming pools from the Italian brand TRONA.&lt;/p&gt;\r\n&lt;p&gt;After many years of working in the fashion industry we have a wide network of wholesalers from 30 cities of Russia and CIS countries. We regularly visit the European fashion week, and always aware of the latest fashion trends for the coming season.&lt;/p&gt;\r\n&lt;p&gt;For all clients, we conduct regular promotions, contests and special offers. And the most loyal customers are working with us on individual conditions.&lt;/p&gt;\r\n&lt;p&gt;For lovers of shopping bewildering we organize shopping tours throughout Italy, helping with visa, buy tickets, choice of hotel, transfer to a comfortable car, taking into account the wishes of each client. We have access to all the Italian factories for the production of clothing, shoes, handbags, coats, accessories and jewelry. Those who are interested in Italian furniture and home furnishings can also go with us in the shopping tour and make a bargain.&lt;/p&gt;\r\n&lt;p&gt;Angel Moda Company guarantees you authenticity and high quality brands on the site. We also vouch for the quality of the organization of your Italian shopping tour. And always welcome new cooperation with the hope of a fruitful collaboration.&lt;/p&gt;\r\n&lt;p&gt;Send your questions and suggestions you can send mail that daily checks Director of Angel Moda: &lt;a href=&quot;mailto:order@angel-moda.com&quot;&gt;order@angel-moda.com&lt;/a&gt;.&lt;/p&gt;', 'About us', '', ''),
(10, 1, 'Оптовикам', '&lt;p&gt;Уважаемые оптовики! Если у Вас нет возможности посетить наш шоу-рум в городе Римини, то Вы можете изучить весь ассортимент на сайте Angel-Moda.com и сделать заказ онлайн.&lt;/p&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-weight: bold;&quot;&gt;Обращаем Ваше внимание, что на сайте указаны розничные цены. Для того, чтобы получить доступ к оптовым ценам необходимо связаться с нами по телефону &lt;a href=&quot;tel:+39-329-29-41-410&quot; title=&quot;Телефон в Римини&quot;&gt; +39-329-29-41-410&lt;/a&gt; или e-mail &lt;a href=&quot;mailto:order@angel-moda.com&quot; title=&quot;Наша почта&quot;&gt;order@angel-moda.com&lt;/a&gt;.&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;span style=&quot;color: rgb(255, 0, 0); font-weight: bold;&quot;&gt;Минимальная сумма оптового заказа составляет 2000 euro.&lt;/span&gt;&lt;/p&gt;\r\n&lt;h2&gt;ДОСТАВКА ТОВАРА&lt;/h2&gt;\r\n&lt;p&gt;Компания Angel Moda осуществляет доставку заказа любым удобным для Вас видом транспорта и(или) любой транспортной компанией. Обратите внимание, что отправка заказа осуществляется за счет клиента! Если у Вас есть какие-либо пожелания относительно доставки груза, не забудьте их указать в своем письме и(или) заявке, а также сообщить менеджеру по телефону.&lt;/p&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-weight: bold;&quot;&gt;ВНИМАНИЕ! Наша компания несет ответственность за своевременность отправки в сроки, оговоренные с клиентом, но не несет ответственность за работу курьерской службы или Почты России!&lt;/span&gt;&lt;/p&gt;\r\n&lt;h2&gt;ЗАКАЗ ТОВАРА&lt;/h2&gt;\r\n&lt;p&gt;Прежде чем оформлять заказ тщательно изучите размерный ряд, цветовую гамму, состав изделий, а также рекомендации по уходу за тканями и бижутерией. Обращаем Ваше внимание, что цвет изделия, представленный на сайте может немного отличаться от цвета оригинала в связи с искажением монитора компьютера.&lt;/p&gt;\r\n&lt;p&gt;Все товары на нашем сайте, как правило, комбинируются друг с другом. Например, к перчаткам можно подобрать шарф, к обуви – сумку, к платью – аксессуар.&lt;/p&gt;\r\n&lt;p&gt;Как только Вы примите окончательное решение о заказе и оформите его на сайте, с Вами свяжется наш менеджер. Если вдруг, в течение дня Вам не перезвонил наш менеджер, значит по техническим причинам до нас не дошел Ваш заказ. В этом случае перенаправьте нам его на наш электронный ящик order@angel-moda.com. В своем заказе необходимо указать бренд, артикул, размер изделий и цвет. Не забудьте также оставить свои контактные данные, ФИО, точный адрес с индексом, способ доставки и оплаты.&lt;/p&gt;\r\n&lt;p&gt;&lt;span style=&quot;font-weight: bold;&quot;&gt;С целью экономии своего и нашего времени для удобства обработки отправляйте заказы в табличной форме в программе Excel.&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;Если у Вас нет доступа в интернет или Вы не имеете возможность использовать средства электронной коммуникации, свяжитесь с нами по телефону из раздела «Контакты».&lt;/p&gt;\r\n&lt;p&gt;При получении Вашего письма сотрудники нашей компании обязательно свяжутся с Вами для уточнения информации и согласования Вашего заказа.&lt;/p&gt;\r\n&lt;p&gt;Angel Moda находит индивидуальный подход к каждому клиенту, стараясь решить любой вопрос, связанный с покупкой, оплатой и доставкой товара в кратчайшие сроки. Мы ценим Ваше время!&lt;/p&gt;', 'Оптовикам', '', ''),
(15, 1, 'I-lab', '&lt;h2 style=&quot;font-family: ''Noto Sans'', sans-serif; line-height: 31px; color: rgb(0, 0, 0); margin: 30px 0px; font-size: 33px; text-transform: uppercase; padding: 0px;&quot;&gt;ОБЩАЯ ОЦЕНКА ВАШЕГО ИМИДЖА С&amp;nbsp;&lt;br&gt;&lt;h2&gt;&lt;span class=&quot;smaller&quot; style=&quot;font-size: 24px; line-height: 26px;&quot;&gt;ПЕРСОНАЛЬНЫМ ПОДБОРОМ ГАРДЕРОБА&lt;/span&gt;&lt;/h2&gt;&lt;/h2&gt;&lt;p style=&quot;margin-top: 35px; margin-bottom: 0px; line-height: 26px; color: rgb(0, 0, 0); text-transform: uppercase; font-size: 15px; padding-bottom: 57px; font-family: ''Noto Sans'', sans-serif;&quot;&gt;MY KIDDOS PRETTY MUCH LIVE IN THEM RIGHT NOW. THEY ARE ALL ABOUT COMFORT AND LOVE WEARING ATHLETIC PANTS/SHORTS PAIRED WITH A SPORTY T-SHIRT. I NEED TO STOCK UP ON MORE FOR THIS SUMMER. I LIKE TO HAVE A GOOD MIX OF T-SHIRTS AND SLEEVELESS TEES FOR MY BOYS. THE SLEEVELESS TEES ARE PERFECT FOR THE DAYS THEY GO TO SUMMER CAMP. IT HELPS KEEP THEM COOL WHILE THEY RUN AROUND PLAYING SPORTS AND PARTICIPATING IN OUTDOOR ACTIVITIES.&lt;/p&gt;', 'I-lab', '', ''),
(15, 2, 'I-lab', '&lt;h2 style=&quot;font-family: ''Noto Sans'', sans-serif; line-height: 31px; color: rgb(0, 0, 0); margin: 30px 0px; font-size: 29px; text-transform: uppercase; padding: 0px;&quot;&gt;OVERALL ASSESSMENT OF YOUR IMAGE WITH&amp;nbsp;&lt;br&gt;&lt;h2&gt;&lt;span class=&quot;smaller&quot; style=&quot;font-size: 24px; line-height: 26px;&quot;&gt;A PERSONAL SELECTION OF WARDROBE&lt;/span&gt;&lt;/h2&gt;&lt;/h2&gt;&lt;p style=&quot;margin-top: 35px; margin-bottom: 0px; line-height: 26px; color: rgb(0, 0, 0); text-transform: uppercase; font-size: 15px; padding-bottom: 57px; font-family: ''Noto Sans'', sans-serif;&quot;&gt;MY KIDDOS PRETTY MUCH LIVE IN THEM RIGHT NOW. THEY ARE ALL ABOUT COMFORT AND LOVE WEARING ATHLETIC PANTS/SHORTS PAIRED WITH A SPORTY T-SHIRT. I NEED TO STOCK UP ON MORE FOR THIS SUMMER. I LIKE TO HAVE A GOOD MIX OF T-SHIRTS AND SLEEVELESS TEES FOR MY BOYS. THE SLEEVELESS TEES ARE PERFECT FOR THE DAYS THEY GO TO SUMMER CAMP. IT HELPS KEEP THEM COOL WHILE THEY RUN AROUND PLAYING SPORTS AND PARTICIPATING IN OUTDOOR ACTIVITIES.&lt;/p&gt;', 'I-lab', '', ''),
(14, 2, 'Contacts', '&lt;div class=&quot;row row_contact&quot;&gt;\r\n  &lt;div class=&quot;col-sm-5&quot;&gt;\r\n  	&lt;h2&gt;OUR HEAD OFFICE&lt;/h2&gt;\r\n\r\n  	&lt;p&gt;\r\n  		&lt;span class=&quot;headings&quot;&gt;Our Address&lt;/span&gt;\r\n  		&lt;br&gt;\r\n  		&lt;span&gt;47924, Rimini (Italy), Via Coriano 58, blocco 92F, shop and office &quot;Angels&quot;&lt;/span&gt;\r\n  	&lt;/p&gt;\r\n\r\n  	&lt;p&gt;   \r\n  		&lt;span class=&quot;headings&quot;&gt;Сontact number&lt;/span&gt;\r\n  		&lt;br&gt;   \r\n  		&lt;a class=&quot;phone&quot; href=&quot;tel:+393 292 94 14 10&quot; title=&quot;Our phone in Rimini&quot;&gt;(+39) 32-929-41-41-0&lt;/a&gt;\r\n  	&lt;/p&gt;\r\n\r\n  	&lt;p&gt;\r\n  		&lt;span class=&quot;headings&quot;&gt;E-mail&lt;/span&gt;&lt;br&gt;\r\n  		&lt;a class=&quot;mail&quot; href=&quot;mailto:angels-777@libero.it&quot; title=&quot;Our e-mail&quot;&gt;angels-777@libero.it&lt;/a&gt;\r\n  	&lt;/p&gt;  \r\n\r\n  	&lt;p&gt;\r\n  		&lt;span class=&quot;headings&quot;&gt;Opening hours&lt;/span&gt;&lt;br&gt;\r\n  		&lt;span&gt;9:00 - 17:00, Saturday - closed\r\n       &lt;br&gt;\r\n\r\nSunday from 9:00 - 14:00&lt;/span&gt;\r\n  	&lt;/p&gt;\r\n\r\n  	&lt;ul class=&quot;social_buttons&quot;&gt;\r\n  		&lt;li&gt;&lt;a title=&quot;ВКонтакте&quot; class=&quot;vk&quot; href=&quot;http://vk.com/angelsitalia&quot;&gt;&lt;/a&gt;&lt;/li&gt;   												&lt;li&gt;&lt;a title=&quot;Facebook&quot; class=&quot;fb&quot; href=&quot;https://www.facebook.com/angelsitalia&quot;&gt;&lt;/a&gt;&lt;/li&gt;   												&lt;li&gt;&lt;a title=&quot;Twitter&quot; class=&quot;tw&quot; href=&quot;https://twitter.com/angelsitalia&quot;&gt;&lt;/a&gt;&lt;/li&gt;   												&lt;li&gt;\r\n  					&lt;a title=&quot;Instagram&quot; class=&quot;instagram&quot; href=&quot;https://www.instagram.com/angelsitalia/&quot;&gt;&lt;/a&gt;\r\n  					&lt;/li&gt;   											\r\n  	&lt;/ul&gt;\r\n  &lt;/div&gt;\r\n  &lt;div class=&quot;col-sm-7&quot;&gt;\r\n  	&lt;div class=&quot;map&quot;&gt;\r\n  			&lt;iframe src=&quot;https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2868.244035603958!2d12.578954151053255!3d44.03701413544219!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x132cc2f96bd310d5%3A0x64c013d0a104b5cc!2sGrosRimini!5e0!3m2!1sru!2sru!4v1455810544744&quot; width=&quot;100%&quot; height=&quot;350&quot; frameborder=&quot;0&quot; style=&quot;border:0&quot; allowfullscreen&gt;&lt;/iframe&gt;\r\n  	&lt;/div&gt;\r\n  &lt;/div&gt;\r\n&lt;/div&gt;  \r\n\r\n&lt;div class=&quot;row row_contact&quot;&gt;\r\n  &lt;div class=&quot;col-sm-5&quot;&gt;\r\n  	&lt;h2&gt;OUR OFFICE IN MOSCOW&lt;/h2&gt;\r\n\r\n  	&lt;p&gt;\r\n  		&lt;span class=&quot;headings&quot;&gt;Our Address&lt;/span&gt;\r\n  		&lt;br&gt;\r\n  		&lt;span&gt;119361, Moscow, Bolshaya Ochakovskaya house 3&lt;/span&gt;\r\n  	&lt;/p&gt;\r\n\r\n  	&lt;p&gt;   \r\n  		&lt;span class=&quot;headings&quot;&gt;Сontact number&lt;/span&gt;\r\n  		&lt;br&gt;   \r\n  		&lt;a class=&quot;phone&quot; href=&quot;tel:+7-929-588-53-99&quot; title=&quot;Phone in Moscow&quot;&gt;+7-929-588-53-99&lt;/a&gt;\r\n  	&lt;/p&gt;\r\n\r\n  	&lt;p&gt;\r\n  		&lt;span class=&quot;headings&quot;&gt;E-mail&lt;/span&gt;&lt;br&gt;\r\n  		&lt;a class=&quot;mail&quot; href=&quot;mailto:order@angel-moda.com&quot; title=&quot;Our e-mail&quot;&gt;order@angel-moda.com&lt;/a&gt;\r\n  	&lt;/p&gt;  \r\n\r\n  	&lt;p&gt;\r\n  		&lt;span class=&quot;headings&quot;&gt;Opening hours&lt;/span&gt;&lt;br&gt;\r\n  		&lt;span&gt;10:00 - 20:00, seven days a week\r\n  		&lt;/span&gt;\r\n  	&lt;/p&gt;\r\n  																	\r\n  	&lt;ul class=&quot;social_buttons&quot;&gt;\r\n  		&lt;li&gt;&lt;a title=&quot;ВКонтакте&quot; class=&quot;vk&quot; href=&quot;http://vk.com/angelsitalia&quot;&gt;&lt;/a&gt;&lt;/li&gt;   												&lt;li&gt;&lt;a title=&quot;Facebook&quot; class=&quot;fb&quot; href=&quot;https://www.facebook.com/angelsitalia&quot;&gt;&lt;/a&gt;&lt;/li&gt;   												&lt;li&gt;&lt;a title=&quot;Twitter&quot; class=&quot;tw&quot; href=&quot;https://twitter.com/angelsitalia&quot;&gt;&lt;/a&gt;&lt;/li&gt;   												&lt;li&gt;\r\n  					&lt;a title=&quot;Instagram&quot; class=&quot;instagram&quot; href=&quot;https://www.instagram.com/angelsitalia/&quot;&gt;&lt;/a&gt;\r\n  					&lt;/li&gt;   											\r\n  	&lt;/ul&gt;\r\n  &lt;/div&gt;\r\n  &lt;div class=&quot;col-sm-7&quot;&gt;\r\n  	&lt;div class=&quot;map&quot;&gt;\r\n  			&lt;iframe src=&quot;https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2248.9789915269603!2d37.4648578514218!3d55.68935300425584!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x46b54dcb0fcfbc71%3A0x26317bd63dcdf0b2!2z0JHQvtC70YzRiNCw0Y8g0J7Rh9Cw0LrQvtCy0YHQutCw0Y8g0YPQuy4sIDMsINCc0L7RgdC60LLQsCwgMTE5MzYx!5e0!3m2!1sru!2sru!4v1455812964975&quot; width=&quot;100%&quot; height=&quot;350&quot; frameborder=&quot;0&quot; style=&quot;border:0&quot; allowfullscreen&gt;&lt;/iframe&gt;\r\n  	&lt;/div&gt;\r\n  &lt;/div&gt;\r\n&lt;/div&gt;\r\n\r\n\r\n\r\n\r\n&lt;div class=&quot;row row_contact&quot;&gt;\r\n  &lt;div class=&quot;col-sm-5&quot;&gt;\r\n  	&lt;h2&gt;Shop in Taganrog&lt;/h2&gt;\r\n\r\n  	&lt;p&gt;\r\n  		&lt;span class=&quot;headings&quot;&gt;Our Address&lt;/span&gt;\r\n  		&lt;br&gt;\r\n  		&lt;span&gt;347924, Taganrog, Dzerzhinskogo Street 191, the store &quot;Angel&quot;&lt;/span&gt;\r\n  	&lt;/p&gt;\r\n\r\n  	&lt;p&gt;   \r\n  		&lt;span class=&quot;headings&quot;&gt;Сontact number&lt;/span&gt;\r\n  		&lt;br&gt;   \r\n  		&lt;a class=&quot;phone&quot; href=&quot;tel:+7-928-125-81-25&quot; title=&quot;Phone in Taganrog&quot;&gt;+7-928-125-81-25&lt;/a&gt;\r\n  	&lt;/p&gt;\r\n\r\n  \r\n  	&lt;p&gt;\r\n  		&lt;span class=&quot;headings&quot;&gt;Opening hours&lt;/span&gt;&lt;br&gt;\r\n  		&lt;span&gt;10:00 - 20:00, seven days a week\r\n  		&lt;/span&gt;\r\n  	&lt;/p&gt;\r\n  																	\r\n  	&lt;ul class=&quot;social_buttons&quot;&gt;\r\n  		&lt;li&gt;&lt;a title=&quot;ВКонтакте&quot; class=&quot;vk&quot; href=&quot;http://vk.com/angelsitalia&quot;&gt;&lt;/a&gt;&lt;/li&gt;   												&lt;li&gt;&lt;a title=&quot;Facebook&quot; class=&quot;fb&quot; href=&quot;https://www.facebook.com/angelsitalia&quot;&gt;&lt;/a&gt;&lt;/li&gt;   												&lt;li&gt;&lt;a title=&quot;Twitter&quot; class=&quot;tw&quot; href=&quot;https://twitter.com/angelsitalia&quot;&gt;&lt;/a&gt;&lt;/li&gt;   												&lt;li&gt;\r\n  					&lt;a title=&quot;Instagram&quot; class=&quot;instagram&quot; href=&quot;https://www.instagram.com/angelsitalia/&quot;&gt;&lt;/a&gt;\r\n  					&lt;/li&gt;   											\r\n  	&lt;/ul&gt;\r\n  &lt;/div&gt;\r\n  &lt;div class=&quot;col-sm-7&quot;&gt;\r\n  	&lt;div class=&quot;map&quot;&gt;\r\n  			&lt;iframe src=&quot;https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2707.7619192481375!2d38.91552885114773!3d47.26035861972279!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x40e15841e84c2b7f%3A0x7d677e172e361428!2z0K3QvdC20LXQuw!5e0!3m2!1sru!2sru!4v1455813286060&quot; width=&quot;100%&quot; height=&quot;350px&quot; frameborder=&quot;0&quot; style=&quot;border:0&quot; allowfullscreen&gt;&lt;/iframe&gt;\r\n  	&lt;/div&gt;\r\n  &lt;/div&gt;\r\n&lt;/div&gt;\r\n\r\n\r\n\r\n\r\n&lt;div class=&quot;row row_contact&quot;&gt;\r\n  &lt;div class=&quot;col-sm-5&quot;&gt;\r\n  	&lt;h2&gt;Shop in Taganrog&lt;/h2&gt;\r\n\r\n  	&lt;p&gt;\r\n  		&lt;span class=&quot;headings&quot;&gt;Our Address&lt;/span&gt;\r\n  		&lt;br&gt;\r\n  		&lt;span&gt;347900, Taganrog, Lermontovskiy lane 13, a shop &quot;Angel Elite&quot;&lt;/span&gt;\r\n  	&lt;/p&gt;\r\n\r\n  	&lt;p&gt;   \r\n  		&lt;span class=&quot;headings&quot;&gt;Сontact number&lt;/span&gt;\r\n  		&lt;br&gt;   \r\n  		&lt;a class=&quot;phone&quot; href=&quot;tel:+7-928-125-81-25&quot; title=&quot;Phone in Taganrog&quot;&gt;+7-928-125-81-25&lt;/a&gt;\r\n  	&lt;/p&gt;\r\n\r\n  \r\n  	&lt;p&gt;\r\n  		&lt;span class=&quot;headings&quot;&gt;Opening hours&lt;/span&gt;&lt;br&gt;\r\n  		&lt;span&gt;10:00 - 20:00, seven days a week\r\n  		&lt;/span&gt;\r\n  	&lt;/p&gt;\r\n  																	\r\n  	&lt;ul class=&quot;social_buttons&quot;&gt;\r\n  		&lt;li&gt;&lt;a title=&quot;ВКонтакте&quot; class=&quot;vk&quot; href=&quot;http://vk.com/angelsitalia&quot;&gt;&lt;/a&gt;&lt;/li&gt;   												&lt;li&gt;&lt;a title=&quot;Facebook&quot; class=&quot;fb&quot; href=&quot;https://www.facebook.com/angelsitalia&quot;&gt;&lt;/a&gt;&lt;/li&gt;   												&lt;li&gt;&lt;a title=&quot;Twitter&quot; class=&quot;tw&quot; href=&quot;https://twitter.com/angelsitalia&quot;&gt;&lt;/a&gt;&lt;/li&gt;   												&lt;li&gt;\r\n  					&lt;a title=&quot;Instagram&quot; class=&quot;instagram&quot; href=&quot;https://www.instagram.com/angelsitalia/&quot;&gt;&lt;/a&gt;\r\n  					&lt;/li&gt;   											\r\n  	&lt;/ul&gt;\r\n  &lt;/div&gt;\r\n  &lt;div class=&quot;col-sm-7&quot;&gt;\r\n  	&lt;div class=&quot;map&quot;&gt;\r\n  		&lt;iframe src=&quot;https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2710.1713008540655!2d38.92815085114625!3d47.21323042295951!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x40e3fd3888b90c09%3A0xf2e5687b1ab7bfe6!2z0JvQtdGA0LzQvtC90YLQvtCy0YHQutC40Lkg0L_QtdGALiwgMTMsINCi0LDQs9Cw0L3RgNC-0LMsINCg0L7RgdGC0L7QstGB0LrQsNGPINC-0LHQuy4sIDM0NzkwMA!5e0!3m2!1sru!2sru!4v1455813181542&quot; width=&quot;100%&quot; height=&quot;350px&quot; frameborder=&quot;0&quot; style=&quot;border:0&quot; allowfullscreen&gt;&lt;/iframe&gt;\r\n  	&lt;/div&gt;\r\n  &lt;/div&gt;\r\n&lt;/div&gt;\r\n\r\n\r\n\r\n\r\n&lt;div class=&quot;row row_contact&quot;&gt;\r\n  &lt;div class=&quot;col-sm-5&quot;&gt;\r\n  	&lt;h2&gt;Shop in Taganrog&lt;/h2&gt;\r\n\r\n  	&lt;p&gt;\r\n  		&lt;span class=&quot;headings&quot;&gt;Our Address&lt;/span&gt;\r\n  		&lt;br&gt;\r\n  		&lt;span&gt;347942, Taganrog, SEC Marmalade, Peace Square 7, shop &quot;Angels&quot;&lt;/span&gt;\r\n  	&lt;/p&gt;\r\n\r\n  	&lt;p&gt;   \r\n  		&lt;span class=&quot;headings&quot;&gt;Сontact number&lt;/span&gt;\r\n  		&lt;br&gt;   \r\n  		&lt;a class=&quot;phone&quot; href=&quot;tel:+7-928-125-81-25&quot; title=&quot;Phone in Taganrog&quot;&gt;+7-928-125-81-25&lt;/a&gt;\r\n  	&lt;/p&gt;\r\n\r\n  \r\n  	&lt;p&gt;\r\n  		&lt;span class=&quot;headings&quot;&gt;Opening hours&lt;/span&gt;&lt;br&gt;\r\n  		&lt;span&gt;10:00 - 20:00, seven days a week\r\n  		&lt;/span&gt;\r\n  	&lt;/p&gt;\r\n  																	\r\n  	&lt;ul class=&quot;social_buttons&quot;&gt;\r\n  		&lt;li&gt;&lt;a title=&quot;ВКонтакте&quot; class=&quot;vk&quot; href=&quot;http://vk.com/angelsitalia&quot;&gt;&lt;/a&gt;&lt;/li&gt;   												&lt;li&gt;&lt;a title=&quot;Facebook&quot; class=&quot;fb&quot; href=&quot;https://www.facebook.com/angelsitalia&quot;&gt;&lt;/a&gt;&lt;/li&gt;   												&lt;li&gt;&lt;a title=&quot;Twitter&quot; class=&quot;tw&quot; href=&quot;https://twitter.com/angelsitalia&quot;&gt;&lt;/a&gt;&lt;/li&gt;   												&lt;li&gt;\r\n  					&lt;a title=&quot;Instagram&quot; class=&quot;instagram&quot; href=&quot;https://www.instagram.com/angelsitalia/&quot;&gt;&lt;/a&gt;\r\n  					&lt;/li&gt;   											\r\n  	&lt;/ul&gt;\r\n  &lt;/div&gt;\r\n  &lt;div class=&quot;col-sm-7&quot;&gt;\r\n  	&lt;div class=&quot;map&quot;&gt;\r\n  		&lt;iframe src=&quot;https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2709.9522898708833!2d38.89641715114645!3d47.21751582266538!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x40e3fd5e267a4b0b%3A0xf8eabd82ae9bf1f7!2z0JzQsNGA0LzQtdC70LDQtA!5e0!3m2!1sru!2sru!4v1455813597627&quot; width=&quot;100%&quot; height=&quot;350px&quot; frameborder=&quot;0&quot; style=&quot;border:0&quot; allowfullscreen&gt;&lt;/iframe&gt;\r\n  	&lt;/div&gt;\r\n  &lt;/div&gt;\r\n&lt;/div&gt;\r\n\r\n\r\n\r\n\r\n&lt;div class=&quot;row contact_row_form&quot;&gt; &lt;h2 class=&quot;col-xs-12&quot;&gt;У вас есть вопросы?&lt;br&gt; Задайте их нам!&lt;/h2&gt;   							&lt;div class=&quot;col15-lg-9 col-md-8 col-sm-12&quot;&gt;    &lt;div class=&quot;row&quot;&gt;       &lt;div class=&quot;col-xs-5&quot;&gt;           &lt;span&gt;Ваше имя&lt;/span&gt;       &lt;/div&gt;   										&lt;div class=&quot;col-xs-7&quot;&gt;           &lt;input class=&quot;form-control&quot; placeholder=&quot;Ваше имя&quot; name=&quot;name&quot; id=&quot;contact_name&quot;&gt;       &lt;/div&gt;   								 &lt;/div&gt;   																									 &lt;div class=&quot;row&quot;&gt;       &lt;div class=&quot;col-xs-5&quot;&gt;           &lt;span&gt;Сontact number&lt;/span&gt;       &lt;/div&gt;   										&lt;div class=&quot;col-xs-7&quot;&gt;           &lt;input class=&quot;form-control phone&quot; placeholder=&quot;Сontact number&quot; name=&quot;phone&quot; id=&quot;contact_phone&quot;&gt;       &lt;/div&gt;   								 &lt;/div&gt;   																									 &lt;div class=&quot;row&quot;&gt;       &lt;div class=&quot;col-xs-5&quot;&gt;           &lt;span&gt;E-mail&lt;/span&gt;       &lt;/div&gt;   										&lt;div class=&quot;col-xs-7&quot;&gt;           &lt;input class=&quot;form-control&quot; placeholder=&quot;E-mail&quot; name=&quot;mail&quot; id=&quot;contact_mail&quot;&gt;       &lt;/div&gt;   								 &lt;/div&gt;   																									 &lt;div class=&quot;row&quot;&gt;       &lt;div class=&quot;col-xs-5&quot;&gt;           &lt;span&gt;Ваш вопрос&lt;/span&gt;       &lt;/div&gt;   										&lt;div class=&quot;col-xs-7&quot;&gt;           &lt;textarea class=&quot;form-control&quot; placeholder=&quot;Ваш вопрос&quot; name=&quot;name&quot; id=&quot;contact_text&quot;&gt;&lt;/textarea&gt;       &lt;/div&gt;   								 &lt;/div&gt;   								 &lt;div class=&quot;row&quot;&gt;       &lt;div class=&quot;col-xs-5&quot;&gt;     &lt;/div&gt;   										&lt;div class=&quot;col-xs-7&quot;&gt;           &lt;button class=&quot;btn btn-primary contact_send&quot;&gt;Отправить&lt;/button&gt;       &lt;/div&gt;   								 &lt;/div&gt;   																	 &lt;/div&gt;   					&lt;/div&gt;', 'Контакты', '', ''),
(13, 1, 'Письмо директору', '&lt;h2&gt;Мы ежедневно подбираем для Вас эксклюзивные товары по лучшей цене&lt;/h2&gt;\r\n&lt;p&gt;Чтобы сделать предложение наиболее выгодным для Вас, мы доставляем товары напрямую от производителей ведущих марок мира. В качестве гарантий, покупателю предоставляются Купоны номиналом в размере разницы между стоимостью приобретенного Участником Товара, соответствующего условиям Гарантии и стоимостью аналогичного Товара в другом Магазине.&lt;/p&gt;\r\n&lt;p&gt;Мы с радостью ответим на все Ваши вопросы в любое время дня и ночи. Наша клиентская служба работает круглосуточно, без выходных. Мы обеспечиваем Вам максимально комфортный шопинг!&lt;/p&gt;\r\n&lt;div class=&quot;row contact_row_form&quot;&gt;              &lt;h2 class=&quot;col-xs-12&quot;&gt;Отправьте письмо директору&lt;/h2&gt;\r\n              &lt;div class=&quot;col15-lg-12 col-md-12&quot;&gt;                 &lt;div class=&quot;row&quot;&gt;                    &lt;div class=&quot;col-xs-5&quot;&gt;                        &lt;span&gt;Ваше имя&lt;/span&gt;                    &lt;/div&gt;\r\n                    &lt;div class=&quot;col-xs-7&quot;&gt;                        &lt;input class=&quot;form-control&quot; placeholder=&quot;Ваше имя&quot; name=&quot;name&quot; id=&quot;contact_name&quot;&gt;                    &lt;/div&gt;\r\n                 &lt;/div&gt;\r\n                                                   &lt;div class=&quot;row&quot;&gt;                    &lt;div class=&quot;col-xs-5&quot;&gt;                        &lt;span&gt;Контактный телефон&lt;/span&gt;                    &lt;/div&gt;\r\n                    &lt;div class=&quot;col-xs-7&quot;&gt;                        &lt;input class=&quot;form-control phone&quot; placeholder=&quot;Контактный телефон&quot; name=&quot;phone&quot; id=&quot;contact_phone&quot;&gt;                    &lt;/div&gt;\r\n                 &lt;/div&gt;\r\n                                                   &lt;div class=&quot;row&quot;&gt;                    &lt;div class=&quot;col-xs-5&quot;&gt;                        &lt;span&gt;Электронная почта&lt;/span&gt;                    &lt;/div&gt;\r\n                    &lt;div class=&quot;col-xs-7&quot;&gt;                        &lt;input class=&quot;form-control&quot; placeholder=&quot;Электронная почта&quot; name=&quot;mail&quot; id=&quot;contact_mail&quot;&gt;                    &lt;/div&gt;\r\n                 &lt;/div&gt;\r\n                                                   &lt;div class=&quot;row&quot;&gt;                    &lt;div class=&quot;col-xs-5&quot;&gt;                        &lt;span&gt;Ваш вопрос&lt;/span&gt;                    &lt;/div&gt;\r\n                    &lt;div class=&quot;col-xs-7&quot;&gt;                        &lt;textarea class=&quot;form-control&quot; placeholder=&quot;Ваш вопрос&quot; name=&quot;name&quot; id=&quot;contact_text&quot;&gt;&lt;/textarea&gt;                    &lt;/div&gt;\r\n                 &lt;/div&gt;\r\n                 &lt;div class=&quot;row&quot;&gt;                    &lt;div class=&quot;col-xs-5&quot;&gt;                                            &lt;/div&gt;\r\n                    &lt;div class=&quot;col-xs-7&quot;&gt;                        &lt;button class=&quot;btn btn-primary contact_send&quot;&gt;Отправить&lt;/button&gt;                    &lt;/div&gt;\r\n                 &lt;/div&gt;\r\n                                   &lt;/div&gt;\r\n          &lt;/div&gt;', 'Письмо директору', '', ''),
(13, 2, 'Письмо директору', '&lt;h2&gt; Every day we select for you exclusive products at the best price &lt;/h2&gt;\r\n\r\n\r\n\r\n\r\n&lt;p&gt; To make an offer to the most profitable for you, we deliver the products directly from the manufacturers of leading brands in the world. As a guarantee, the customer Discounts are available in denominations equal to the difference between the acquisition cost of the goods participant, as warranted and the cost of similar goods in other stores. &lt;/p&gt;\r\n\r\n\r\n\r\n\r\n&lt;p&gt; We are happy to answer all your questions at any time of the day or night. Our customer service works around the clock, seven days a week. We provide you the most comfortable shopping! &lt;/p&gt;\r\n\r\n\r\n\r\n\r\n\r\n\r\n&lt;div class=&quot;row contact_row_form&quot;&gt;\r\n\r\n              &lt;h2 class=&quot;col-xs-12&quot;&gt;Send a letter to the Director&lt;/h2&gt;\r\n\r\n\r\n\r\n\r\n              &lt;div class=&quot;col15-lg-12 col-md-12&quot;&gt;\r\n\r\n                 &lt;div class=&quot;row&quot;&gt;\r\n\r\n                    &lt;div class=&quot;col-xs-5&quot;&gt;\r\n\r\n                        &lt;span&gt;Your name&lt;/span&gt;\r\n\r\n                    &lt;/div&gt;\r\n\r\n\r\n\r\n\r\n                    &lt;div class=&quot;col-xs-7&quot;&gt;\r\n\r\n                        &lt;input class=&quot;form-control&quot; placeholder=&quot;Your name&quot; name=&quot;name&quot; id=&quot;contact_name&quot;&gt;\r\n\r\n                    &lt;/div&gt;\r\n\r\n\r\n\r\n\r\n                 &lt;/div&gt;\r\n\r\n\r\n\r\n\r\n                 \r\n\r\n                 \r\n\r\n                 &lt;div class=&quot;row&quot;&gt;\r\n\r\n                    &lt;div class=&quot;col-xs-5&quot;&gt;\r\n\r\n                        &lt;span&gt;Contact phone&lt;/span&gt;\r\n\r\n                    &lt;/div&gt;\r\n\r\n\r\n\r\n\r\n                    &lt;div class=&quot;col-xs-7&quot;&gt;\r\n\r\n                        &lt;input class=&quot;form-control phone&quot; placeholder=&quot;Contact phone&quot; name=&quot;phone&quot; id=&quot;contact_phone&quot;&gt;\r\n\r\n                    &lt;/div&gt;\r\n\r\n\r\n\r\n\r\n                 &lt;/div&gt;\r\n\r\n\r\n\r\n\r\n                 \r\n\r\n                 \r\n\r\n                 &lt;div class=&quot;row&quot;&gt;\r\n\r\n                    &lt;div class=&quot;col-xs-5&quot;&gt;\r\n\r\n                        &lt;span&gt;E-mail&lt;/span&gt;\r\n\r\n                    &lt;/div&gt;\r\n\r\n\r\n\r\n\r\n                    &lt;div class=&quot;col-xs-7&quot;&gt;\r\n\r\n                        &lt;input class=&quot;form-control&quot; placeholder=&quot;E-mail&quot; name=&quot;mail&quot; id=&quot;contact_mail&quot;&gt;\r\n\r\n                    &lt;/div&gt;\r\n\r\n\r\n\r\n\r\n                 &lt;/div&gt;\r\n\r\n\r\n\r\n\r\n                 \r\n\r\n                 \r\n\r\n                 &lt;div class=&quot;row&quot;&gt;\r\n\r\n                    &lt;div class=&quot;col-xs-5&quot;&gt;\r\n\r\n                        &lt;span&gt;Your question&lt;/span&gt;\r\n\r\n                    &lt;/div&gt;\r\n\r\n\r\n\r\n\r\n                    &lt;div class=&quot;col-xs-7&quot;&gt;\r\n\r\n                        &lt;textarea class=&quot;form-control&quot; placeholder=&quot;Your question&quot; name=&quot;name&quot; id=&quot;contact_text&quot;&gt;&lt;/textarea&gt;\r\n\r\n                    &lt;/div&gt;\r\n\r\n\r\n\r\n\r\n                 &lt;/div&gt;\r\n\r\n\r\n\r\n\r\n                 &lt;div class=&quot;row&quot;&gt;\r\n\r\n                    &lt;div class=&quot;col-xs-5&quot;&gt;\r\n\r\n                        \r\n\r\n                    &lt;/div&gt;\r\n\r\n\r\n\r\n\r\n                    &lt;div class=&quot;col-xs-7&quot;&gt;\r\n\r\n                        &lt;button class=&quot;btn btn-primary contact_send&quot;&gt;Send&lt;/button&gt;\r\n\r\n                    &lt;/div&gt;\r\n\r\n\r\n\r\n\r\n                 &lt;/div&gt;\r\n\r\n\r\n\r\n\r\n              &lt;/div&gt;\r\n\r\n\r\n\r\n\r\n          &lt;/div&gt;', 'Письмо директору', '', ''),
(12, 1, 'Шоп-туры', '&lt;h2&gt;Мы ежедневно подбираем для Вас эксклюзивные товары по лучшей цене&lt;/h2&gt;\r\n\r\n&lt;p&gt;Чтобы сделать предложение наиболее выгодным для Вас, мы доставляем товары напрямую от производителей ведущих марок мира. В качестве гарантий, покупателю предоставляются Купоны номиналом в размере разницы между стоимостью приобретенного Участником Товара, соответствующего условиям Гарантии и стоимостью аналогичного Товара в другом Магазине.&lt;/p&gt;\r\n\r\n&lt;p&gt;Мы с радостью ответим на все Ваши вопросы в любое время дня и ночи. Наша клиентская служба работает круглосуточно, без выходных. Мы обеспечиваем Вам максимально комфортный шопинг!&lt;/p&gt;\r\n\r\n  &lt;div class=&quot;row contact_row_form shop_tour&quot;&gt;              &lt;h2 class=&quot;col-xs-12&quot;&gt;Отправьте заявку на шопинг-тур&lt;/h2&gt;\r\n\r\n              &lt;div class=&quot;col15-lg-12 col-md-12&quot;&gt;                 &lt;div class=&quot;row&quot;&gt;                    &lt;div class=&quot;col-xs-5&quot;&gt;                        &lt;span&gt;Ваше имя&lt;/span&gt;                    &lt;/div&gt;\r\n\r\n                    &lt;div class=&quot;col-xs-7&quot;&gt;                        &lt;input class=&quot;form-control&quot; placeholder=&quot;Ваше имя&quot; name=&quot;name&quot; id=&quot;contact_name&quot;&gt;                    &lt;/div&gt;\r\n\r\n                 &lt;/div&gt;\r\n\r\n                                                   &lt;div class=&quot;row&quot;&gt;                    &lt;div class=&quot;col-xs-5&quot;&gt;                        &lt;span&gt;Контактный телефон&lt;/span&gt;                    &lt;/div&gt;\r\n\r\n                    &lt;div class=&quot;col-xs-7&quot;&gt;                        &lt;input class=&quot;form-control phone&quot; placeholder=&quot;Контактный телефон&quot; name=&quot;phone&quot; id=&quot;contact_phone&quot;&gt;                    &lt;/div&gt;\r\n\r\n                 &lt;/div&gt;\r\n\r\n                                                   &lt;div class=&quot;row&quot;&gt;                    &lt;div class=&quot;col-xs-5&quot;&gt;                        &lt;span&gt;E-mail&lt;/span&gt;                    &lt;/div&gt;\r\n\r\n                    &lt;div class=&quot;col-xs-7&quot;&gt;                        &lt;input class=&quot;form-control&quot; placeholder=&quot;E-mail&quot; name=&quot;mail&quot; id=&quot;contact_mail&quot;&gt;                    &lt;/div&gt;\r\n\r\n                 &lt;/div&gt;\r\n\r\n                                  &lt;div class=&quot;row&quot;&gt;                    &lt;div class=&quot;col-xs-5&quot;&gt;                        &lt;span&gt;Дата начала&lt;/span&gt;                    &lt;/div&gt;\r\n\r\n                    &lt;div class=&quot;col-xs-7&quot;&gt;                        &lt;input class=&quot;form-control date&quot; placeholder=&quot;Выберите дату&quot; name=&quot;date_start&quot; id=&quot;date_start&quot;&gt;                                           &lt;/div&gt;\r\n\r\n                 &lt;/div&gt;\r\n\r\n                                   &lt;div class=&quot;row&quot;&gt;                    &lt;div class=&quot;col-xs-5&quot;&gt;                        &lt;span&gt;Дата окончания&lt;/span&gt;                    &lt;/div&gt;\r\n\r\n                    &lt;div class=&quot;col-xs-7&quot;&gt;                                 &lt;input class=&quot;form-control date&quot; placeholder=&quot;Выберите дату&quot; name=&quot;date_end&quot; id=&quot;date_end&quot;&gt;                                                                   &lt;/div&gt;\r\n\r\n                 &lt;/div&gt;\r\n\r\n                                                   &lt;div class=&quot;row&quot;&gt;                    &lt;div class=&quot;col-xs-5&quot;&gt;                        &lt;span&gt;Ваши вопросы или комментарии&lt;/span&gt;                    &lt;/div&gt;\r\n\r\n                    &lt;div class=&quot;col-xs-7&quot;&gt;                        &lt;textarea class=&quot;form-control&quot; placeholder=&quot;Ваши вопросы или комментарии&quot; name=&quot;name&quot; id=&quot;contact_text&quot;&gt;&lt;/textarea&gt;                    &lt;/div&gt;\r\n\r\n                 &lt;/div&gt;\r\n\r\n                 &lt;div class=&quot;row&quot;&gt;                    &lt;div class=&quot;col-xs-5&quot;&gt;                                            &lt;/div&gt;\r\n\r\n                    &lt;div class=&quot;col-xs-7&quot;&gt;                        &lt;button class=&quot;btn btn-primary shop_tour&quot;&gt;Отправить&lt;/button&gt;                    &lt;/div&gt;\r\n\r\n                 &lt;/div&gt;\r\n\r\n                               &lt;/div&gt;\r\n\r\n          &lt;/div&gt;', 'Шоп-туры', '', ''),
(12, 2, 'Шоп-туры', '&lt;h2&gt;Мы ежедневно подбираем для Вас эксклюзивные товары по лучшей цене&lt;/h2&gt;\r\n\r\n\r\n\r\n\r\n\r\n&lt;p&gt;Чтобы сделать предложение наиболее выгодным для Вас, мы доставляем товары напрямую от производителей ведущих марок мира. В качестве гарантий, покупателю предоставляются Купоны номиналом в размере разницы между стоимостью приобретенного Участником Товара, соответствующего условиям Гарантии и стоимостью аналогичного Товара в другом Магазине.&lt;/p&gt;\r\n\r\n\r\n\r\n\r\n\r\n&lt;p&gt;Мы с радостью ответим на все Ваши вопросы в любое время дня и ночи. Наша клиентская служба работает круглосуточно, без выходных. Мы обеспечиваем Вам максимально комфортный шопинг!&lt;/p&gt;\r\n\r\n\r\n\r\n\r\n\r\n  &lt;div class=&quot;row contact_row_form shop_tour&quot;&gt;\r\n              &lt;h2 class=&quot;col-xs-12&quot;&gt;Send request to the shopping tour!&lt;/h2&gt;\r\n\r\n\r\n\r\n\r\n\r\n              &lt;div class=&quot;col15-lg-12 col-md-12&quot;&gt;\r\n                 &lt;div class=&quot;row&quot;&gt;\r\n                    &lt;div class=&quot;col-xs-5&quot;&gt;\r\n                        &lt;span&gt;Your name&lt;/span&gt;\r\n                    &lt;/div&gt;\r\n\r\n\r\n\r\n\r\n\r\n                    &lt;div class=&quot;col-xs-7&quot;&gt;\r\n                        &lt;input class=&quot;form-control&quot; placeholder=&quot;Your name&quot; name=&quot;name&quot; id=&quot;contact_name&quot;&gt;\r\n                    &lt;/div&gt;\r\n\r\n\r\n\r\n\r\n\r\n                 &lt;/div&gt;\r\n\r\n\r\n\r\n\r\n\r\n                 \r\n                 \r\n                 &lt;div class=&quot;row&quot;&gt;\r\n                    &lt;div class=&quot;col-xs-5&quot;&gt;\r\n                        &lt;span&gt;Contact phone&lt;/span&gt;\r\n                    &lt;/div&gt;\r\n\r\n\r\n\r\n\r\n\r\n                    &lt;div class=&quot;col-xs-7&quot;&gt;\r\n                        &lt;input class=&quot;form-control phone&quot; placeholder=&quot;Contact phone&quot; name=&quot;phone&quot; id=&quot;contact_phone&quot;&gt;\r\n                    &lt;/div&gt;\r\n\r\n\r\n\r\n\r\n\r\n                 &lt;/div&gt;\r\n\r\n\r\n\r\n\r\n\r\n                 \r\n                 \r\n                 &lt;div class=&quot;row&quot;&gt;\r\n                    &lt;div class=&quot;col-xs-5&quot;&gt;\r\n                        &lt;span&gt;E-mail&lt;/span&gt;\r\n                    &lt;/div&gt;\r\n\r\n\r\n\r\n\r\n\r\n                    &lt;div class=&quot;col-xs-7&quot;&gt;\r\n                        &lt;input class=&quot;form-control&quot; placeholder=&quot;E-mail&quot; name=&quot;mail&quot; id=&quot;contact_mail&quot;&gt;\r\n                    &lt;/div&gt;\r\n\r\n\r\n\r\n\r\n\r\n                 &lt;/div&gt;\r\n\r\n\r\n\r\n\r\n\r\n                 \r\n                 &lt;div class=&quot;row&quot;&gt;\r\n                    &lt;div class=&quot;col-xs-5&quot;&gt;\r\n                        &lt;span&gt;Date start&lt;/span&gt;\r\n                    &lt;/div&gt;\r\n\r\n\r\n\r\n\r\n\r\n                    &lt;div class=&quot;col-xs-7&quot;&gt;\r\n                        &lt;input class=&quot;form-control date&quot; placeholder=&quot;Select date&quot; name=&quot;date_start&quot; id=&quot;date_start&quot;&gt;\r\n                       \r\n                    &lt;/div&gt;\r\n\r\n\r\n\r\n\r\n\r\n                 &lt;/div&gt;\r\n\r\n\r\n\r\n\r\n\r\n                 \r\n \r\n                 &lt;div class=&quot;row&quot;&gt;\r\n                    &lt;div class=&quot;col-xs-5&quot;&gt;\r\n                        &lt;span&gt;Date end&lt;/span&gt;\r\n                    &lt;/div&gt;\r\n\r\n\r\n\r\n\r\n\r\n                    &lt;div class=&quot;col-xs-7&quot;&gt;\r\n         \r\n                        &lt;input class=&quot;form-control date&quot; placeholder=&quot;Select date&quot; name=&quot;date_end&quot; id=&quot;date_end&quot;&gt;\r\n                        \r\n                       \r\n                    &lt;/div&gt;\r\n\r\n\r\n\r\n\r\n\r\n                 &lt;/div&gt;\r\n\r\n\r\n\r\n\r\n\r\n                 \r\n                 \r\n                 &lt;div class=&quot;row&quot;&gt;\r\n                    &lt;div class=&quot;col-xs-5&quot;&gt;\r\n                        &lt;span&gt;Your question or comments&lt;/span&gt;\r\n                    &lt;/div&gt;\r\n\r\n\r\n\r\n\r\n\r\n                    &lt;div class=&quot;col-xs-7&quot;&gt;\r\n                        &lt;textarea class=&quot;form-control&quot; placeholder=&quot;Your question or comments&quot; name=&quot;name&quot; id=&quot;contact_text&quot;&gt;&lt;/textarea&gt;\r\n                    &lt;/div&gt;\r\n\r\n\r\n\r\n\r\n\r\n                 &lt;/div&gt;\r\n\r\n\r\n\r\n\r\n\r\n                 &lt;div class=&quot;row&quot;&gt;\r\n                    &lt;div class=&quot;col-xs-5&quot;&gt;\r\n                        \r\n                    &lt;/div&gt;\r\n\r\n\r\n\r\n\r\n\r\n                    &lt;div class=&quot;col-xs-7&quot;&gt;\r\n                        &lt;button class=&quot;btn btn-primary shop_tour&quot;&gt;Send&lt;/button&gt;\r\n                    &lt;/div&gt;\r\n\r\n\r\n                 &lt;/div&gt;\r\n\r\n\r\n                 \r\n              &lt;/div&gt;\r\n\r\n\r\n\r\n\r\n\r\n          &lt;/div&gt;', 'Шоп-туры', '', '');
INSERT INTO `ma_information_description` (`information_id`, `language_id`, `title`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(14, 1, 'Контакты', '&lt;div class=&quot;row row_contact&quot;&gt;\r\n  &lt;div class=&quot;col-sm-5&quot;&gt;\r\n  	&lt;h2&gt;НАШ ГОЛОВНОЙ ОФИС&lt;/h2&gt;\r\n\r\n  	&lt;p&gt;\r\n  		&lt;span class=&quot;headings&quot;&gt;Наш Адрес&lt;/span&gt;\r\n  		&lt;br&gt;\r\n  		&lt;span&gt;47924, Римини (Италия) Rimini, Via Coriano 58, blocco 92/F, магазин и офис Angels&lt;/span&gt;\r\n  	&lt;/p&gt;\r\n\r\n  	&lt;p&gt;   \r\n  		&lt;span class=&quot;headings&quot;&gt;Контактный телефон&lt;/span&gt;\r\n  		&lt;br&gt;   \r\n  		&lt;a class=&quot;phone&quot; href=&quot;tel:+393 292 94 14 10&quot; title=&quot;Наш телефон в Rimini&quot;&gt;(+39) 32-929-41-41-0&lt;/a&gt;\r\n  	&lt;/p&gt;\r\n\r\n  	&lt;p&gt;\r\n  		&lt;span class=&quot;headings&quot;&gt;Электронная почта&lt;/span&gt;&lt;br&gt;\r\n  		&lt;a class=&quot;mail&quot; href=&quot;mailto:angels-777@libero.it&quot; title=&quot;Наш почтовый ящик&quot;&gt;angels-777@libero.it&lt;/a&gt;\r\n  	&lt;/p&gt;  \r\n\r\n  	&lt;p&gt;\r\n  		&lt;span class=&quot;headings&quot;&gt;Часы работы&lt;/span&gt;&lt;br&gt;\r\n  		&lt;span&gt;с 9:00 – 17:00, суббота – выходной&lt;br&gt;\r\n\r\nВоскресенье с 9:00 – 14:00&lt;/span&gt;\r\n  	&lt;/p&gt;\r\n\r\n  	&lt;ul class=&quot;social_buttons&quot;&gt;\r\n  		&lt;li&gt;&lt;a title=&quot;ВКонтакте&quot; class=&quot;vk&quot; href=&quot;http://vk.com/angelsitalia&quot;&gt;&lt;/a&gt;&lt;/li&gt;   												&lt;li&gt;&lt;a title=&quot;Facebook&quot; class=&quot;fb&quot; href=&quot;https://www.facebook.com/angelsitalia&quot;&gt;&lt;/a&gt;&lt;/li&gt;   												&lt;li&gt;&lt;a title=&quot;Twitter&quot; class=&quot;tw&quot; href=&quot;https://twitter.com/angelsitalia&quot;&gt;&lt;/a&gt;&lt;/li&gt;   												&lt;li&gt;\r\n  					&lt;a title=&quot;Instagram&quot; class=&quot;instagram&quot; href=&quot;https://www.instagram.com/angelsitalia/&quot;&gt;&lt;/a&gt;\r\n  					&lt;/li&gt;   											\r\n  	&lt;/ul&gt;\r\n  &lt;/div&gt;\r\n  &lt;div class=&quot;col-sm-7&quot;&gt;\r\n  	&lt;div class=&quot;map&quot;&gt;\r\n  			&lt;iframe src=&quot;https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2868.244035603958!2d12.578954151053255!3d44.03701413544219!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x132cc2f96bd310d5%3A0x64c013d0a104b5cc!2sGrosRimini!5e0!3m2!1sru!2sru!4v1455810544744&quot; width=&quot;100%&quot; height=&quot;350&quot; frameborder=&quot;0&quot; style=&quot;border:0&quot; allowfullscreen=&quot;&quot;&gt;&lt;/iframe&gt;\r\n  	&lt;/div&gt;\r\n  &lt;/div&gt;\r\n&lt;/div&gt;  \r\n\r\n&lt;div class=&quot;row row_contact&quot;&gt;\r\n  &lt;div class=&quot;col-sm-5&quot;&gt;\r\n  	&lt;h2&gt;НАШЕ ПРЕДСТАВИТЕЛЬСТВО В МОСКВЕ&lt;/h2&gt;\r\n\r\n  	&lt;p&gt;\r\n  		&lt;span class=&quot;headings&quot;&gt;Наш Адрес&lt;/span&gt;\r\n  		&lt;br&gt;\r\n  		&lt;span&gt;119361, Москва, улица Большая Очаковская дом 3&lt;/span&gt;\r\n  	&lt;/p&gt;\r\n\r\n  	&lt;p&gt;   \r\n  		&lt;span class=&quot;headings&quot;&gt;Контактный телефон&lt;/span&gt;\r\n  		&lt;br&gt;   \r\n  		&lt;a class=&quot;phone&quot; href=&quot;tel:+7-929-588-53-99&quot; title=&quot;Телефон в Москве&quot;&gt;+7-929-588-53-99&lt;/a&gt;\r\n  	&lt;/p&gt;\r\n\r\n  	&lt;p&gt;\r\n  		&lt;span class=&quot;headings&quot;&gt;Электронная почта&lt;/span&gt;&lt;br&gt;\r\n  		&lt;a class=&quot;mail&quot; href=&quot;mailto:order@angel-moda.com&quot; title=&quot;Наш почтовый ящик&quot;&gt;order@angel-moda.com&lt;/a&gt;\r\n  	&lt;/p&gt;  \r\n\r\n  	&lt;p&gt;\r\n  		&lt;span class=&quot;headings&quot;&gt;Часы работы&lt;/span&gt;&lt;br&gt;\r\n  		&lt;span&gt; с 10:00 – 20:00, без выходных\r\n  		&lt;/span&gt;\r\n  	&lt;/p&gt;\r\n  																	\r\n  	&lt;ul class=&quot;social_buttons&quot;&gt;\r\n  		&lt;li&gt;&lt;a title=&quot;ВКонтакте&quot; class=&quot;vk&quot; href=&quot;http://vk.com/angelsitalia&quot;&gt;&lt;/a&gt;&lt;/li&gt;   												&lt;li&gt;&lt;a title=&quot;Facebook&quot; class=&quot;fb&quot; href=&quot;https://www.facebook.com/angelsitalia&quot;&gt;&lt;/a&gt;&lt;/li&gt;   												&lt;li&gt;&lt;a title=&quot;Twitter&quot; class=&quot;tw&quot; href=&quot;https://twitter.com/angelsitalia&quot;&gt;&lt;/a&gt;&lt;/li&gt;   												&lt;li&gt;\r\n  					&lt;a title=&quot;Instagram&quot; class=&quot;instagram&quot; href=&quot;https://www.instagram.com/angelsitalia/&quot;&gt;&lt;/a&gt;\r\n  					&lt;/li&gt;   											\r\n  	&lt;/ul&gt;\r\n  &lt;/div&gt;\r\n  &lt;div class=&quot;col-sm-7&quot;&gt;\r\n  	&lt;div class=&quot;map&quot;&gt;\r\n  			&lt;iframe src=&quot;https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2248.9789915269603!2d37.4648578514218!3d55.68935300425584!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x46b54dcb0fcfbc71%3A0x26317bd63dcdf0b2!2z0JHQvtC70YzRiNCw0Y8g0J7Rh9Cw0LrQvtCy0YHQutCw0Y8g0YPQuy4sIDMsINCc0L7RgdC60LLQsCwgMTE5MzYx!5e0!3m2!1sru!2sru!4v1455812964975&quot; width=&quot;100%&quot; height=&quot;350&quot; frameborder=&quot;0&quot; style=&quot;border:0&quot; allowfullscreen=&quot;&quot;&gt;&lt;/iframe&gt;\r\n  	&lt;/div&gt;\r\n  &lt;/div&gt;\r\n&lt;/div&gt;\r\n\r\n\r\n\r\n\r\n&lt;div class=&quot;row row_contact&quot;&gt;\r\n  &lt;div class=&quot;col-sm-5&quot;&gt;\r\n  	&lt;h2&gt;Магазин В Таганроге&lt;/h2&gt;\r\n\r\n  	&lt;p&gt;\r\n  		&lt;span class=&quot;headings&quot;&gt;Наш Адрес&lt;/span&gt;\r\n  		&lt;br&gt;\r\n  		&lt;span&gt;347924, Таганрог, улица Дзержинского 191, магазин «Энжел»&lt;/span&gt;\r\n  	&lt;/p&gt;\r\n\r\n  	&lt;p&gt;   \r\n  		&lt;span class=&quot;headings&quot;&gt;Контактный телефон&lt;/span&gt;\r\n  		&lt;br&gt;   \r\n  		&lt;a class=&quot;phone&quot; href=&quot;tel:+7-928-125-81-25&quot; title=&quot;Телефон в Таганроге&quot;&gt;+7-928-125-81-25&lt;/a&gt;\r\n  	&lt;/p&gt;\r\n\r\n  \r\n  	&lt;p&gt;\r\n  		&lt;span class=&quot;headings&quot;&gt;Часы работы&lt;/span&gt;&lt;br&gt;\r\n  		&lt;span&gt; с 10:00 – 20:00, без выходных\r\n  		&lt;/span&gt;\r\n  	&lt;/p&gt;\r\n  																	\r\n  	&lt;ul class=&quot;social_buttons&quot;&gt;\r\n  		&lt;li&gt;&lt;a title=&quot;ВКонтакте&quot; class=&quot;vk&quot; href=&quot;http://vk.com/angelsitalia&quot;&gt;&lt;/a&gt;&lt;/li&gt;   												&lt;li&gt;&lt;a title=&quot;Facebook&quot; class=&quot;fb&quot; href=&quot;https://www.facebook.com/angelsitalia&quot;&gt;&lt;/a&gt;&lt;/li&gt;   												&lt;li&gt;&lt;a title=&quot;Twitter&quot; class=&quot;tw&quot; href=&quot;https://twitter.com/angelsitalia&quot;&gt;&lt;/a&gt;&lt;/li&gt;   												&lt;li&gt;\r\n  					&lt;a title=&quot;Instagram&quot; class=&quot;instagram&quot; href=&quot;https://www.instagram.com/angelsitalia/&quot;&gt;&lt;/a&gt;\r\n  					&lt;/li&gt;   											\r\n  	&lt;/ul&gt;\r\n  &lt;/div&gt;\r\n  &lt;div class=&quot;col-sm-7&quot;&gt;\r\n  	&lt;div class=&quot;map&quot;&gt;\r\n  			&lt;iframe src=&quot;https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2707.7619192481375!2d38.91552885114773!3d47.26035861972279!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x40e15841e84c2b7f%3A0x7d677e172e361428!2z0K3QvdC20LXQuw!5e0!3m2!1sru!2sru!4v1455813286060&quot; width=&quot;100%&quot; height=&quot;350px&quot; frameborder=&quot;0&quot; style=&quot;border:0&quot; allowfullscreen=&quot;&quot;&gt;&lt;/iframe&gt;\r\n  	&lt;/div&gt;\r\n  &lt;/div&gt;\r\n&lt;/div&gt;\r\n\r\n\r\n\r\n\r\n&lt;div class=&quot;row row_contact&quot;&gt;\r\n  &lt;div class=&quot;col-sm-5&quot;&gt;\r\n  	&lt;h2&gt;Магазин В Таганроге&lt;/h2&gt;\r\n\r\n  	&lt;p&gt;\r\n  		&lt;span class=&quot;headings&quot;&gt;Наш Адрес&lt;/span&gt;\r\n  		&lt;br&gt;\r\n  		&lt;span&gt;347900, Таганрог, переулок Лермонтовский 13, магазин «Энжел Элит»&lt;/span&gt;\r\n  	&lt;/p&gt;\r\n\r\n  	&lt;p&gt;   \r\n  		&lt;span class=&quot;headings&quot;&gt;Контактный телефон&lt;/span&gt;\r\n  		&lt;br&gt;   \r\n  		&lt;a class=&quot;phone&quot; href=&quot;tel:+7-928-125-81-25&quot; title=&quot;Телефон в Таганроге&quot;&gt;+7-928-125-81-25&lt;/a&gt;\r\n  	&lt;/p&gt;\r\n\r\n  \r\n  	&lt;p&gt;\r\n  		&lt;span class=&quot;headings&quot;&gt;Часы работы&lt;/span&gt;&lt;br&gt;\r\n  		&lt;span&gt; с 10:00 – 20:00, без выходных\r\n  		&lt;/span&gt;\r\n  	&lt;/p&gt;\r\n  																	\r\n  	&lt;ul class=&quot;social_buttons&quot;&gt;\r\n  		&lt;li&gt;&lt;a title=&quot;ВКонтакте&quot; class=&quot;vk&quot; href=&quot;http://vk.com/angelsitalia&quot;&gt;&lt;/a&gt;&lt;/li&gt;   												&lt;li&gt;&lt;a title=&quot;Facebook&quot; class=&quot;fb&quot; href=&quot;https://www.facebook.com/angelsitalia&quot;&gt;&lt;/a&gt;&lt;/li&gt;   												&lt;li&gt;&lt;a title=&quot;Twitter&quot; class=&quot;tw&quot; href=&quot;https://twitter.com/angelsitalia&quot;&gt;&lt;/a&gt;&lt;/li&gt;   												&lt;li&gt;\r\n  					&lt;a title=&quot;Instagram&quot; class=&quot;instagram&quot; href=&quot;https://www.instagram.com/angelsitalia/&quot;&gt;&lt;/a&gt;\r\n  					&lt;/li&gt;   											\r\n  	&lt;/ul&gt;\r\n  &lt;/div&gt;\r\n  &lt;div class=&quot;col-sm-7&quot;&gt;\r\n  	&lt;div class=&quot;map&quot;&gt;\r\n  		&lt;iframe src=&quot;https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2710.1713008540655!2d38.92815085114625!3d47.21323042295951!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x40e3fd3888b90c09%3A0xf2e5687b1ab7bfe6!2z0JvQtdGA0LzQvtC90YLQvtCy0YHQutC40Lkg0L_QtdGALiwgMTMsINCi0LDQs9Cw0L3RgNC-0LMsINCg0L7RgdGC0L7QstGB0LrQsNGPINC-0LHQuy4sIDM0NzkwMA!5e0!3m2!1sru!2sru!4v1455813181542&quot; width=&quot;100%&quot; height=&quot;350px&quot; frameborder=&quot;0&quot; style=&quot;border:0&quot; allowfullscreen=&quot;&quot;&gt;&lt;/iframe&gt;\r\n  	&lt;/div&gt;\r\n  &lt;/div&gt;\r\n&lt;/div&gt;\r\n\r\n\r\n\r\n\r\n&lt;div class=&quot;row row_contact&quot;&gt;\r\n  &lt;div class=&quot;col-sm-5&quot;&gt;\r\n  	&lt;h2&gt;Магазин В Таганроге&lt;/h2&gt;\r\n\r\n  	&lt;p&gt;\r\n  		&lt;span class=&quot;headings&quot;&gt;Наш Адрес&lt;/span&gt;\r\n  		&lt;br&gt;\r\n  		&lt;span&gt;347942, Таганрог, ТРЦ Мармелад, Площадь Мира 7, магазин “Angels”&lt;/span&gt;\r\n  	&lt;/p&gt;\r\n\r\n  	&lt;p&gt;   \r\n  		&lt;span class=&quot;headings&quot;&gt;Контактный телефон&lt;/span&gt;\r\n  		&lt;br&gt;   \r\n  		&lt;a class=&quot;phone&quot; href=&quot;tel:+7-928-125-81-25&quot; title=&quot;Телефон в Таганроге&quot;&gt;+7-928-125-81-25&lt;/a&gt;\r\n  	&lt;/p&gt;\r\n\r\n  \r\n  	&lt;p&gt;\r\n  		&lt;span class=&quot;headings&quot;&gt;Часы работы&lt;/span&gt;&lt;br&gt;\r\n  		&lt;span&gt; с 10:00 – 20:00, без выходных\r\n  		&lt;/span&gt;\r\n  	&lt;/p&gt;\r\n  																	\r\n  	&lt;ul class=&quot;social_buttons&quot;&gt;\r\n  		&lt;li&gt;&lt;a title=&quot;ВКонтакте&quot; class=&quot;vk&quot; href=&quot;http://vk.com/angelsitalia&quot;&gt;&lt;/a&gt;&lt;/li&gt;   												&lt;li&gt;&lt;a title=&quot;Facebook&quot; class=&quot;fb&quot; href=&quot;https://www.facebook.com/angelsitalia&quot;&gt;&lt;/a&gt;&lt;/li&gt;   												&lt;li&gt;&lt;a title=&quot;Twitter&quot; class=&quot;tw&quot; href=&quot;https://twitter.com/angelsitalia&quot;&gt;&lt;/a&gt;&lt;/li&gt;   												&lt;li&gt;\r\n  					&lt;a title=&quot;Instagram&quot; class=&quot;instagram&quot; href=&quot;https://www.instagram.com/angelsitalia/&quot;&gt;&lt;/a&gt;\r\n  					&lt;/li&gt;   											\r\n  	&lt;/ul&gt;\r\n  &lt;/div&gt;\r\n  &lt;div class=&quot;col-sm-7&quot;&gt;\r\n  	&lt;div class=&quot;map&quot;&gt;\r\n  		&lt;iframe src=&quot;https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2709.9522898708833!2d38.89641715114645!3d47.21751582266538!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x40e3fd5e267a4b0b%3A0xf8eabd82ae9bf1f7!2z0JzQsNGA0LzQtdC70LDQtA!5e0!3m2!1sru!2sru!4v1455813597627&quot; width=&quot;100%&quot; height=&quot;350px&quot; frameborder=&quot;0&quot; style=&quot;border:0&quot; allowfullscreen=&quot;&quot;&gt;&lt;/iframe&gt;\r\n  	&lt;/div&gt;\r\n  &lt;/div&gt;\r\n&lt;/div&gt;\r\n\r\n\r\n\r\n\r\n&lt;div class=&quot;row contact_row_form&quot;&gt; &lt;h2 class=&quot;col-xs-12&quot;&gt;У вас есть вопросы?&lt;br&gt; Задайте их нам!&lt;/h2&gt;   							&lt;div class=&quot;col15-lg-9 col-md-8 col-sm-12&quot;&gt;    &lt;div class=&quot;row&quot;&gt;       &lt;div class=&quot;col-xs-5&quot;&gt;           &lt;span&gt;Ваше имя&lt;/span&gt;       &lt;/div&gt;   										&lt;div class=&quot;col-xs-7&quot;&gt;           &lt;input class=&quot;form-control&quot; placeholder=&quot;Ваше имя&quot; name=&quot;name&quot; id=&quot;contact_name&quot;&gt;       &lt;/div&gt;   								 &lt;/div&gt;   																									 &lt;div class=&quot;row&quot;&gt;       &lt;div class=&quot;col-xs-5&quot;&gt;           &lt;span&gt;Контактный телефон&lt;/span&gt;       &lt;/div&gt;   										&lt;div class=&quot;col-xs-7&quot;&gt;           &lt;input class=&quot;form-control phone&quot; placeholder=&quot;Контактный телефон&quot; name=&quot;phone&quot; id=&quot;contact_phone&quot;&gt;       &lt;/div&gt;   								 &lt;/div&gt;   																									 &lt;div class=&quot;row&quot;&gt;       &lt;div class=&quot;col-xs-5&quot;&gt;           &lt;span&gt;Электронная почта&lt;/span&gt;       &lt;/div&gt;   										&lt;div class=&quot;col-xs-7&quot;&gt;           &lt;input class=&quot;form-control&quot; placeholder=&quot;Электронная почта&quot; name=&quot;mail&quot; id=&quot;contact_mail&quot;&gt;       &lt;/div&gt;   								 &lt;/div&gt;   																									 &lt;div class=&quot;row&quot;&gt;       &lt;div class=&quot;col-xs-5&quot;&gt;           &lt;span&gt;Ваш вопрос&lt;/span&gt;       &lt;/div&gt;   										&lt;div class=&quot;col-xs-7&quot;&gt;           &lt;textarea class=&quot;form-control&quot; placeholder=&quot;Ваш вопрос&quot; name=&quot;name&quot; id=&quot;contact_text&quot;&gt;&lt;/textarea&gt;       &lt;/div&gt;   								 &lt;/div&gt;   								 &lt;div class=&quot;row&quot;&gt;       &lt;div class=&quot;col-xs-5&quot;&gt;     &lt;/div&gt;   										&lt;div class=&quot;col-xs-7&quot;&gt;           &lt;button class=&quot;btn btn-primary contact_send&quot;&gt;Отправить&lt;/button&gt;       &lt;/div&gt;   								 &lt;/div&gt;   																	 &lt;/div&gt;   					&lt;/div&gt;', 'Контакты', '', ''),
(16, 2, 'Brands', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Бренды | Магазин брендовой одежды из Италии — Angel-Moda', '', ''),
(16, 1, 'Бренды', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', 'Бренды | Магазин брендовой одежды из Италии — Angel-Moda', '', ''),
(8, 1, 'Обмен и возврат', '&lt;ul&gt;\r\n  &lt;li&gt;В соответствии с законом РФ «О защите прав потребителей» покупатель вправе отказаться от товара в любое время до его передачи, а после передачи товара – в течение 14 дней.&lt;/li&gt;\r\n  &lt;li&gt;\r\n    Возврат товара надлежащего качества возможен лишь при условии сохранения его потребительских свойств и товарного вида (отсутствие следов эксплуатации и носки, наличие оригинальной и неповрежденной упаковки и ярлыков).&lt;/li&gt;\r\n  &lt;li&gt;\r\n    Возврат осуществляется на основании заполненного &lt;a href=&quot;/return_blanc.pdf&quot;&gt;заявления&lt;/a&gt;&lt;a href=&quot;/return_blanc.pdf&quot;&gt; &lt;/a&gt;и товарного чека, подтверждающего факт и условия покупки.&lt;/li&gt;\r\n  &lt;li&gt;\r\n    Срок возврата денежных средств зависит от способа возврата и составляет не более 10 дней с даты поступления возвращенного товара на склад Продавца вместе с заполненным Покупателем &lt;a href=&quot;/return_blanc.pdf&quot;&gt;заявлением на возврат&lt;/a&gt;.&lt;/li&gt;\r\n  &lt;li&gt;\r\n    Информация о гарантийном сроке на конкретную модель, предоставляемая производителем, прилагается к товару.&lt;/li&gt;\r\n  &lt;li&gt;\r\n    Возврат товара надлежащего качества возможен лишь при условии сохранения его потребительских свойств и товарного вида (отсутствие следов эксплуатации и носки, наличие оригинальной и неповрежденной упаковки и ярлыков).&lt;/li&gt;\r\n  &lt;li&gt;\r\n    Для рассмотрения заявки на возврат Вам необходимо выслать товар и пакет документов: заполненное заявление на возврат&lt;/li&gt;\r\n  &lt;li&gt;\r\n    (прилагается к каждому заказу), копию паспорта, товарный чек на адрес: 119361 Москва, улица Большая Очаковская 3, офис 244.&lt;/li&gt;\r\n  &lt;li&gt;\r\n    Товар с браком/неверной комплектации должен быть возвращен нам с оригинальными ярлыками и в оригинальной упаковке.&lt;/li&gt;\r\n  &lt;li&gt;\r\n    В случае возврата товара ненадлежащего качества, мы берем на себя расходы по пересылке товара обратно нам.&lt;/li&gt;\r\n  &lt;li&gt;\r\n    Если возвращаемый товар был предоплачен, возврат осуществляется на ту карту, с которой была предоплата или на тот кошелек, на который был выставлен счет.&lt;/li&gt;\r\n  &lt;li&gt;\r\n    Потребитель не вправе отказаться от товара надлежащего качества, имеющего индивидуально-определенные свойства, если указанный товар может быть использован исключительно приобретающим его потребителем.&lt;/li&gt;\r\n  &lt;li&gt;\r\n    Обращаем Ваше внимание, что подлинные цвета изделий могут отличаться от цветов и оттенков на сайте, в зависимости от цветопередачи вашего монитора.&lt;/li&gt;\r\n  &lt;li&gt;\r\n    Просим вас, внимательно ознакомиться с общепринятыми стандартами в таблице размеров, чтобы удостовериться в размере приобретаемого товара в интернет-магазине Angel Moda.&lt;/li&gt;\r\n  &lt;li&gt;\r\n    Рассмотрение Вашего заявления и возврат денежных средств осуществляется в течение 10 банковских/рабочих дней с момента поступления комплекта возврата и всех необходимых документов (перечисленных выше) продавцу. Пожалуйста, сохраняйте квитанцию об отправке товара до момента получения уведомления о том, что Ваш возврат поступил продавцу.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;h2&gt;\r\n  Способы возврата денежных средств&lt;/h2&gt;\r\n&lt;p&gt;\r\n  Если Вы производили оплату наличными курьеру, тогда возврат денежных средств производится почтовым переводом на адрес почтового отделения, указанного в заявлении.&lt;/p&gt;\r\n&lt;p&gt;\r\n  Если Вы производили оплату банковской картой, тогда возврат денежных средств производится на ваш счет.&lt;/p&gt;\r\n&lt;p&gt;\r\n  Товары надлежащего качества, которые нельзя обменять (вернуть), перечислены в Перечне, утвержденном постановлением Правительства РФ от 19 января 1998 г. № 55. Приводим его полностью.&lt;/p&gt;\r\n&lt;ul&gt;\r\n  &lt;li&gt;\r\n    Товары для профилактики и лечения заболеваний в домашних условиях (предметы санитарии и гигиены из металла, резины, текстиля и других материалов, инструменты, приборы и аппаратура медицинские, средства гигиены полости рта, линзы очковые, предметы по уходу за детьми), лекарственные препараты.&lt;/li&gt;\r\n  &lt;li&gt;\r\n    Предметы личной гигиены (зубные щетки, расчески, заколки, бигуди для волос, парики, шиньоны и другие аналогичные товары).&lt;/li&gt;\r\n  &lt;li&gt;\r\n    Парфюмерно-косметические товары.&lt;/li&gt;\r\n  &lt;li&gt;\r\n    Текстильные товары (хлопчатобумажные, льняные, шелковые, шерстяные и синтетические ткани, товары из нетканых материалов типа тканей — ленты, тесьма, кружево и другие); кабельная продукция (провода, шнуры, кабели); строительные и отделочные материалы (линолеум, пленка, ковровые покрытия и другие) и другие товары, отпускаемые на метраж.&lt;/li&gt;\r\n  &lt;li&gt;\r\n    Швейные и трикотажные изделия (белье, чулочно-носочные изделия).&lt;/li&gt;\r\n  &lt;li&gt;\r\n    Изделия и материалы, контактирующие с пищевыми продуктами, из полимерных материалов, в том числе для разового использования (посуда и принадлежности столовые и кухонные, емкости и упаковочные материалы для хранения и транспортирования пищевых продуктов).&lt;/li&gt;\r\n  &lt;li&gt;\r\n    Товары бытовой химии, пестициды и агрохимикаты.&lt;/li&gt;\r\n  &lt;li&gt;\r\n    Мебель бытовая (мебельные гарнитуры и комплекты)&lt;/li&gt;\r\n  &lt;li&gt;\r\n    Изделия из драгоценных металлов с драгоценными камнями, из драгоценных металлов со вставками из полудрагоценных и синтетических камней, ограненные драгоценные камни.&lt;/li&gt;\r\n  &lt;li&gt;\r\n    Автомобили и мотовелотовары, прицепы и номерные агрегаты к ним; мобильные средства малой механизации сельскохозяйственных работ; прогулочные суда и иные плав.средства бытового назначения.&lt;/li&gt;\r\n  &lt;li&gt;\r\n    Технически сложные товары бытового назначения, на которые установлены гарантийные сроки (станки металлорежущие и деревообрабатывающие бытовые; электробытовые машины и приборы; бытовая радиоэлектронная аппаратура; бытовая вычислительная и множительная техника; фото- и киноаппаратура; телефонные аппараты и факсимильная аппаратура; электромузыкальные инструменты; игрушки электронные, бытовое газовое оборудование и устройства).&lt;/li&gt;\r\n  &lt;li&gt;\r\n    Гражданское оружие, основные части гражданского и служебного огнестрельного оружия, патроны к нему.&lt;/li&gt;\r\n  &lt;li&gt;\r\n    Животные и растения.&lt;/li&gt;\r\n  &lt;li&gt;\r\n    Непериодические издания (книги, брошюры, альбомы, картографические и нотные издания, листовые изоиздания, календари, буклеты, открытки, издания, воспроизведенные на технических носителях информации).&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', 'Обмен и возврат', '', ''),
(8, 2, 'Exchange &amp; Returns', '&lt;Ul&gt;\r\n  &lt;Li&gt;\r\n    In accordance with the RF Law &quot;On protection of consumers'' buyer has the right to refuse the goods at any time before the transfer and after the transfer of goods - within 14 days &lt;/ li&gt;.\r\n  &lt;Li&gt;\r\n    Return of goods of good quality is possible only under condition of preservation of the product''s functionality and presentation (no traces of exploitation and socks, the presence of the original, undamaged packaging and labels). &lt;/ Li&gt;\r\n  &lt;Li&gt;\r\n    Returns are based on the completed application &lt;a href=&quot;/return_blanc.pdf&quot;&gt; &lt;/a&gt; &lt;a href=&quot;/return_blanc.pdf&quot;&gt; &lt;/a&gt; and sales receipt, confirming the fact and conditions of purchase. &lt;/ Li&gt;\r\n  &lt;Li&gt;\r\n    The term of refund depends on the method return and is not more than 10 days from the date of receipt of the returned goods to the warehouse of the Seller together with the Buyer filled &lt;a href=&quot;/return_blanc.pdf&quot;&gt; application for refund &lt;/a&gt;. &lt;/ Li&gt;\r\n  &lt;Li&gt;\r\n    Details of the warranty period on the particular model, provided by the manufacturer, is attached to the product. &lt;/ Li&gt;\r\n  &lt;Li&gt;\r\n    Return of goods of good quality is possible only under condition of preservation of the product''s functionality and presentation (no traces of exploitation and socks, the presence of the original, undamaged packaging and labels). &lt;/ Li&gt;\r\n  &lt;Li&gt;\r\n    For the consideration of the application for a refund you must send the goods and documents: a completed application for a refund &lt;/ li&gt;\r\n  &lt;Li&gt;\r\n    (Supplied with each order), copy of your passport, purchase receipt to the address: 119361, Moscow, Bolshaya Ochakovskaya 3, office 244 &lt;/ li&gt;.\r\n  &lt;Li&gt;\r\n    Goods with marriage / incorrect configuration must be returned to us with the original labels and in their original packaging. &lt;/ Li&gt;\r\n  &lt;Li&gt;\r\n    In the case of returning the goods of improper quality, we take on the costs of sending the goods back to us. &lt;/ Li&gt;\r\n  &lt;Li&gt;\r\n    If the returned product was is prepaid, return is carried out on the map, which was the prepayment or the purse, which was billed. &lt;/ Li&gt;\r\n  &lt;Li&gt;\r\n    The consumer is not entitled to refuse the goods of good quality, having individually defined properties if the specified goods may be used only to acquire it by the consumer. &lt;/ Li&gt;\r\n  &lt;Li&gt;\r\n    Please note that the original color of products may differ from the colors and shades on the site, depending on the color of your monitor. &lt;/ Li&gt;\r\n  &lt;Li&gt;\r\n    We ask you to carefully read the generally accepted standards in the size of the table to make sure the amount of purchased goods in the online store Angel Moda. &lt;/ Li&gt;\r\n  &lt;Li&gt;\r\n    Review your application and refund shall be made within 10 business / working days from receipt of the kit and return all required documents (listed above) to the seller. Please keep the receipt of dispatch to the receipt of the notification that your return arrived seller. &lt;/ Li&gt;\r\n&lt;/ Ul&gt;\r\n&lt;H2&gt;\r\n  Methods return of funds &lt;/ h2&gt;\r\n&lt;P&gt;\r\n  If you pay cash to the courier, then refund is made by postal order to the address of the post office, said in a statement. &lt;/ P&gt;\r\n&lt;P&gt;\r\n  If you pay by credit card, then the refund is made to your account. &lt;/ P&gt;\r\n&lt;P&gt;\r\n  Goods of good quality, which can not be exchanged (returned), are listed in the list approved by the RF Government Decree of 19 January 1998 number 55. Here is it completely. &lt;/ P&gt;\r\n&lt;Ul&gt;\r\n  &lt;Li&gt;\r\n    Products for the prevention and treatment of diseases in the home (sanitary and hygiene of metal, rubber, textiles and other materials, tools, medical instruments and apparatus, tools oral hygiene, Spectacle lenses, subjects of child care), pharmaceuticals. &lt; / li&gt;\r\n  &lt;Li&gt;\r\n    personal hygiene items (toothbrushes, combs, barrettes, hair curlers, wigs, hairpieces and other similar products). &lt;/ li&gt;\r\n  &lt;Li&gt;\r\n    Perfume and beauty products. &lt;/ Li&gt;\r\n  &lt;Li&gt;\r\n    Textile products (cotton, linen, silk, wool and synthetic fabrics, non-woven products such as fabrics - tape ribbons, lace, etc.); cable products (wires, cords, cables); building and finishing materials (linoleum, film, carpet and others) and other products, take-footage. &lt;/ li&gt;\r\n  &lt;Li&gt;\r\n    Sewing and knitwear (underwear, hosiery). &lt;/ Li&gt;\r\n  &lt;Li&gt;\r\n    Products and materials in contact with food products, made of polymer materials, including single-use (dishes and accessories tableware and kitchenware, containers and packing materials for storage and transportation of food products). &lt;/ Li&gt;\r\n  &lt;Li&gt;\r\n    Household chemicals, pesticides and agricultural chemicals. &lt;/ Li&gt;\r\n  &lt;Li&gt;\r\n    Household furniture (furniture sets and kits) &lt;/ li&gt;\r\n  &lt;Li&gt;\r\n    Articles of precious metals with precious stones, precious metals with inserts of semi-precious and synthetic stones, faceted gemstones. &lt;/ Li&gt;\r\n  &lt;Li&gt;\r\n    Cars and motovelotovary, trailers and number units to them; mobile small-scale mechanization of agricultural work; pleasure craft and other plav.sredstva domestic purposes. &lt;/ li&gt;\r\n  &lt;Li&gt;\r\n    Technically complex products, household purpose for which the warranty periods set (Metal-cutting machine and wood, household, household electrical machines and appliances; household electronic equipment, household computer and copying equipment, photo and video equipment, telephones and facsimile equipment, electronic musical instruments, electronic toys, household gas appliances and devices). &lt;/ li&gt;\r\n  &lt;Li&gt;\r\n    Civil weapons, the main part of the civil service and fire weapons, ammo for it. &lt;/ Li&gt;\r\n  &lt;Li&gt;\r\n    Animals and plants. &lt;/ Li&gt;\r\n  &lt;Li&gt;\r\n    Non-recurrent publications (books, brochures, albums, maps and printed music, sheet publications, calendars, booklets, postcards, publications, reproduced on the technical media of information). &lt;/ Li&gt;\r\n&lt;/ Ul&gt;\r\n', 'Обмен и возврат', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `ma_information_to_layout`
--

CREATE TABLE IF NOT EXISTS `ma_information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ma_information_to_layout`
--

INSERT INTO `ma_information_to_layout` (`information_id`, `store_id`, `layout_id`) VALUES
(7, 0, 0),
(4, 0, 0),
(8, 0, 0),
(9, 0, 0),
(10, 0, 0),
(11, 0, 0),
(12, 0, 0),
(13, 0, 0),
(14, 0, 0),
(15, 0, 0),
(16, 0, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `ma_information_to_store`
--

CREATE TABLE IF NOT EXISTS `ma_information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ma_information_to_store`
--

INSERT INTO `ma_information_to_store` (`information_id`, `store_id`) VALUES
(3, 0),
(4, 0),
(5, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(11, 0),
(12, 0),
(13, 0),
(14, 0),
(15, 0),
(16, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `ma_language`
--

CREATE TABLE IF NOT EXISTS `ma_language` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `image` varchar(64) NOT NULL,
  `directory` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `ma_language`
--

INSERT INTO `ma_language` (`language_id`, `name`, `code`, `locale`, `image`, `directory`, `sort_order`, `status`) VALUES
(1, 'Russian', 'ru', 'ru_RU.UTF-8,ru_RU,russian', 'ru.png', 'russian', 1, 1),
(2, 'English', 'en', 'en_US.utf8 ', 'en.png', 'english', 2, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `ma_layout`
--

CREATE TABLE IF NOT EXISTS `ma_layout` (
  `layout_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`layout_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Дамп данных таблицы `ma_layout`
--

INSERT INTO `ma_layout` (`layout_id`, `name`) VALUES
(1, 'Home'),
(2, 'Product'),
(3, 'Category'),
(4, 'Default'),
(5, 'Manufacturer'),
(6, 'Account'),
(7, 'Checkout'),
(8, 'Contact'),
(9, 'Sitemap'),
(10, 'Affiliate'),
(11, 'Information'),
(12, 'Compare'),
(13, 'Search'),
(14, 'Delivery'),
(15, 'Easy Blog');

-- --------------------------------------------------------

--
-- Структура таблицы `ma_layout_module`
--

CREATE TABLE IF NOT EXISTS `ma_layout_module` (
  `layout_module_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `position` varchar(14) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`layout_module_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=104 ;

--
-- Дамп данных таблицы `ma_layout_module`
--

INSERT INTO `ma_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES
(2, 4, '0', 'content_top', 0),
(3, 4, '0', 'content_top', 1),
(20, 5, '0', 'column_left', 2),
(69, 10, 'affiliate', 'column_right', 1),
(68, 6, 'account', 'column_right', 1),
(103, 1, 'carousel.29', 'content_bottom', 2),
(102, 1, 'featured.28', 'content_top', 3),
(81, 3, 'category', 'column_left', 1),
(80, 3, 'filter', 'column_left', 2),
(82, 3, 'special.32', 'content_top', 3),
(101, 1, 'slideshow.27', 'content_top', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `ma_layout_route`
--

CREATE TABLE IF NOT EXISTS `ma_layout_route` (
  `layout_route_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(255) NOT NULL,
  PRIMARY KEY (`layout_route_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=67 ;

--
-- Дамп данных таблицы `ma_layout_route`
--

INSERT INTO `ma_layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES
(38, 6, 0, 'account/%'),
(17, 10, 0, 'affiliate/%'),
(58, 3, 0, 'product/category'),
(66, 1, 0, 'common/home'),
(20, 2, 0, 'product/product'),
(24, 11, 0, 'information/information'),
(23, 7, 0, 'checkout/%'),
(31, 8, 0, 'information/contact'),
(32, 9, 0, 'information/sitemap'),
(34, 4, 0, ''),
(45, 5, 0, 'product/manufacturer'),
(52, 12, 0, 'product/compare'),
(53, 13, 0, 'product/search'),
(54, 14, 0, 'information/delivery'),
(59, 15, 0, 'blog/%');

-- --------------------------------------------------------

--
-- Структура таблицы `ma_length_class`
--

CREATE TABLE IF NOT EXISTS `ma_length_class` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL,
  PRIMARY KEY (`length_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `ma_length_class`
--

INSERT INTO `ma_length_class` (`length_class_id`, `value`) VALUES
(1, 1.00000000),
(2, 10.00000000),
(3, 0.39370000);

-- --------------------------------------------------------

--
-- Структура таблицы `ma_length_class_description`
--

CREATE TABLE IF NOT EXISTS `ma_length_class_description` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`length_class_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `ma_length_class_description`
--

INSERT INTO `ma_length_class_description` (`length_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Сантиметр', 'см'),
(2, 1, 'Миллиметр', 'мм'),
(1, 2, 'Сантиметр', 'см'),
(2, 2, 'Миллиметр', 'мм');

-- --------------------------------------------------------

--
-- Структура таблицы `ma_location`
--

CREATE TABLE IF NOT EXISTS `ma_location` (
  `location_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `address` text NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `geocode` varchar(32) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `open` text NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`location_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ma_manufacturer`
--

CREATE TABLE IF NOT EXISTS `ma_manufacturer` (
  `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL,
  `description` text NOT NULL,
  `description_en` text NOT NULL,
  PRIMARY KEY (`manufacturer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=22 ;

--
-- Дамп данных таблицы `ma_manufacturer`
--

INSERT INTO `ma_manufacturer` (`manufacturer_id`, `name`, `image`, `sort_order`, `description`, `description_en`) VALUES
(5, 'VDP', 'catalog/VDP.png', 0, '', ''),
(6, 'EAN13', 'catalog/EAN13.jpg', 0, '', ''),
(7, 'Elisa Fanti', 'catalog/ElisaFanti.png', 0, '', ''),
(8, 'KUSS', 'catalog/KUSS.png', 0, '', ''),
(9, 'Guess', 'catalog/Guess.jpg', 0, '', ''),
(10, 'Clips', 'catalog/Clips.jpg', 0, '', ''),
(11, 'Fly-girl', 'catalog/FLY.jpg', 0, '', ''),
(12, 'Cavalli Class', 'catalog/cavalli class.png', 0, '', ''),
(13, 'Angels', 'catalog/Angels.png', 0, '', ''),
(14, 'Babylon', 'catalog/0_9457b_e01e1b8b_XL9999-873x220.png', 0, '', ''),
(15, 'Angeletto', 'catalog/Angeletto.jpg', 0, '', ''),
(16, '22 Maggio', 'catalog/22-Maggio.jpg', 0, 'Американская компания, специализирующаяся на производстве обуви. Ее история началась в 1908 году, когда Маркис М. Конверс, имеющий солидный опыт работы в обувной сфере, запатентовал новый бренд Converse Rubber Shoe Company в городе Молден (штат Массачусетс) и начал производство обуви на толстой подошве.', 'The American company specializing in the production of shoes. Her story began in 1908 when Marquis M. Converse, having a solid experience in the footwear sector, patented a new brand Converse Rubber Shoe Company in the city of Malden (Massachusetts) and began producing shoes with thick soles.'),
(17, 'Who''s Who', 'catalog/whoswho.png', 0, '', ''),
(18, 'Maria Grazia Severi', 'catalog/Maria.jpg', 0, '', ''),
(19, 'Severi Darling', 'catalog/severi-darling.jpg', 0, '', ''),
(20, 'MET', 'catalog/met.jpg', 0, '', ''),
(21, 'Marina Yachting', 'catalog/marina-yachting.png', 0, '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `ma_manufacturer_to_store`
--

CREATE TABLE IF NOT EXISTS `ma_manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`manufacturer_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ma_manufacturer_to_store`
--

INSERT INTO `ma_manufacturer_to_store` (`manufacturer_id`, `store_id`) VALUES
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(11, 0),
(12, 0),
(13, 0),
(14, 0),
(15, 0),
(16, 0),
(17, 0),
(18, 0),
(19, 0),
(20, 0),
(21, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `ma_marketing`
--

CREATE TABLE IF NOT EXISTS `ma_marketing` (
  `marketing_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  `code` varchar(64) NOT NULL,
  `clicks` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`marketing_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ma_modification`
--

CREATE TABLE IF NOT EXISTS `ma_modification` (
  `modification_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `author` varchar(64) NOT NULL,
  `version` varchar(32) NOT NULL,
  `link` varchar(255) NOT NULL,
  `xml` mediumtext NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`modification_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `ma_modification`
--

INSERT INTO `ma_modification` (`modification_id`, `name`, `code`, `author`, `version`, `link`, `xml`, `status`, `date_added`) VALUES
(1, 'Easy Blog Simple for oc2011+', 'easy_blog_simple', 'CarAn', '2.0', '', '<?xml version="1.0" encoding="utf-8"?>\n<modification>\n    <code>easy_blog_simple</code>\n    <name>Easy Blog Simple for oc2011+</name>\n    <version>2.0</version>\n    <author>CarAn</author>\n    <file path="admin/controller/common/menu.php">\n        <operation>\n            <search trim="true" index="0"><![CDATA[\n				return $this->load->view(''common/menu.tpl'', $data);\n            ]]></search>\n            <add position="before" trim="false" offset="0"><![CDATA[\n				$data[''blog_article''] = $this->url->link(''blog/article'', ''token='' . $this->session->data[''token''], ''SSL'');\n                $data[''blog_setting''] = $this->url->link(''blog/setting'', ''token='' . $this->session->data[''token''], ''SSL'');\n            ]]></add>\n        </operation>\n    </file>\n	\n	<file path="admin/view/template/common/menu.tpl">\n        <operation>\n            <search trim="true" index="0"><![CDATA[\n				<li id="system"><a class="parent"><i class="fa fa-cog fa-fw"></i> <span><?php echo $text_system; ?></span></a>\n            ]]></search>\n            <add position="before" trim="false" offset="0"><![CDATA[\n				<li id="blog"><a class="parent"><i class="fa fa-pencil-square-o fa-fw"></i> <span>Blog</span></a>\n					<ul>\n						<li><a href="<?php echo $blog_article; ?>">Articles</a></li>\n						<li><a href="<?php echo $blog_setting; ?>">Settings</a></li>\n						<li><a href="http://www.opencart.com/index.php?route=extension/extension/info&extension_id=23490" target="_blank">More functions</a></li>\n					</ul>\n				</li>\n            ]]></add>\n        </operation>\n    </file>\n	\n	<file path="catalog/view/theme/default/template/common/footer.tpl">\n        <operation>\n            <search trim="true" index="0"><![CDATA[\n          <?php foreach ($informations as $information) { ?>\n            ]]></search>\n            <add position="before" trim="false" offset="0"><![CDATA[\n				<li><a href="<?php echo $blog[''href'']; ?>"><?php echo $blog[''name'']; ?></a></li>\n            ]]></add>\n        </operation>\n    </file>\n	\n	<file path="catalog/controller/common/footer.php">\n        <operation>\n            <search trim="true" index="0"><![CDATA[\n				$data[''informations''] = array();\n            ]]></search>\n            <add position="before" trim="false" offset="0"><![CDATA[\n				$data[''blog''] = array(\n					''name'' => $this->config->get(''easy_blog_home_page_name''),\n					''href''  => $this->url->link(''blog/blog'')\n				);\n            ]]></add>\n        </operation>\n    </file>\n	\n</modification>\n', 1, '2016-02-10 18:02:47'),
(2, 'Y.CMS', 'ycms.mws', 'Yandex.Money', '1.0.2', '', '<?xml version="1.0" encoding="UTF-8"?>\r\n<modification>\r\n	<name>Y.CMS</name>\r\n	<code>ycms.mws</code>\r\n	<version>1.0.2</version>\r\n	<author>Yandex.Money</author>\r\n	\r\n	<file path="admin/model/sale/order.php">\r\n		<operation>\r\n			<search position="replace"><![CDATA[$sql = "SELECT o.order_id, CONCAT(o.firstname, '' '', o.lastname) AS customer, (SELECT os.name FROM " . DB_PREFIX . "order_status os WHERE os.order_status_id = o.order_status_id AND os.language_id = ''" . (int)$this->config->get(''config_language_id'') . "'') AS status, o.shipping_code, o.total, o.currency_code, o.currency_value, o.date_added, o.date_modified FROM `" . DB_PREFIX . "order` o";]]></search>\r\n			<add><![CDATA[$sql = "SELECT o.order_id, CONCAT(o.firstname, '' '', o.lastname) AS customer, (SELECT os.name FROM " . DB_PREFIX . "order_status os WHERE os.order_status_id = o.order_status_id AND os.language_id = ''" . (int)$this->config->get(''config_language_id'') . "'') AS status, o.shipping_code, o.total, o.currency_code, o.currency_value, o.date_added, o.date_modified, o.payment_code FROM `" . DB_PREFIX . "order` o";\r\n			]]></add>\r\n		</operation>\r\n	</file>\r\n	<file path="admin/controller/sale/order.php">\r\n		<operation>\r\n			<search position="replace"><![CDATA[''view''          => $this->url->link(''sale/order/info'', ''token='' . $this->session->data[''token''] . ''&order_id='' . $result[''order_id''] . $url, ''SSL''),]]></search>\r\n			<add><![CDATA[\r\n			''mws''		=> $this->url->link(''yamodule/mws'', ''token='' . $this->session->data[''token''] . ''&order_id='' . $result[''order_id''] . $url, ''SSL''),\r\n			''payment_code''		=> $result[''payment_code''],\r\n			''view''	=> $this->url->link(''sale/order/info'', ''token='' . $this->session->data[''token''] . ''&order_id='' . $result[''order_id''] . $url, ''SSL''),\r\n			]]></add>\r\n		</operation>\r\n	</file>\r\n	<file path="admin/view/template/sale/order_list.tpl">\r\n		<operation>\r\n			<search position="replace"><![CDATA[<td class="text-right"><a href="<?php echo $order[''view'']; ?>" data-toggle="tooltip" title="<?php echo $button_view; ?>" class="btn btn-info"><i class="fa fa-eye"></i></a> <a href="<?php echo $order[''edit'']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a>]]></search>\r\n			<add><![CDATA[<td class="text-right">\r\n				<a href="<?php echo $order[''view'']; ?>" data-toggle="tooltip" title="<?php echo $button_view; ?>" class="btn btn-info"><i class="fa fa-eye"></i></a>\r\n				<?php if($order[''payment_code'']==''yamodule''){ ?>\r\n				<a href="<?php echo $order[''mws'']; ?>" data-toggle="tooltip" title="Управление заказом" class="btn btn-success"><i class="fa fa-briefcase"></i></a>\r\n				<?php } ?>\r\n				<a href="<?php echo $order[''edit'']; ?>" data-toggle="tooltip" title="<?php echo $button_edit; ?>" class="btn btn-primary"><i class="fa fa-pencil"></i></a>]]></add>\r\n		</operation>\r\n	</file>\r\n	<file path="catalog/controller/common/footer.php">\r\n		<operation>\r\n			<search position="replace"><![CDATA[$data[''newsletter''] = $this->url->link(''account/newsletter'', '''', ''SSL'');]]></search>\r\n			<add><![CDATA[ $data[''newsletter''] = $this->url->link(''account/newsletter'', '''', ''SSL'');\r\n			$data[''yandex_metrika''] = $this->config->get(''ya_metrika_code'') ? html_entity_decode($this->config->get(''ya_metrika_code''), ENT_QUOTES, ''UTF-8'') : '''';\r\n			$data[''ya_metrika_active''] = $this->config->get(''ya_metrika_active'') ? true : false;\r\n			]]></add>\r\n		</operation>\r\n	</file>\r\n	<file path="catalog/controller/checkout/success.php">\r\n		<operation>\r\n			<search position="replace"><![CDATA[if (isset($this->session->data[''order_id''])) {]]></search>\r\n			<add><![CDATA[ if (isset($this->session->data[''order_id''])) {\r\n			$this->load->model(''yamodel/pokupki'');\r\n			$data[''script_order''] = $this->model_yamodel_pokupki->getscript($this->session->data[''order_id'']);\r\n			]]></add>\r\n		</operation>\r\n	</file>\r\n	<file path="catalog/view/theme/*/template/common/success.tpl">\r\n		<operation>\r\n			<search position="replace"><![CDATA[<?php echo $footer; ?>]]></search>\r\n			<add><![CDATA[\r\n			<?php if (isset($script_order)) { echo $script_order; } ?>\r\n			<?php echo $footer; ?>\r\n			]]></add>\r\n		</operation>\r\n	</file>\r\n	<file path="catalog/view/theme/*/template/common/footer.tpl">\r\n		<operation>\r\n			<search position="replace"><![CDATA[<footer>]]></search>\r\n			<add><![CDATA[\r\n			<?php if ($ya_metrika_active){ ?>\r\n				<?php echo $yandex_metrika; ?>\r\n				<script type="text/javascript">\r\n					var old_addCart = cart.add;\r\n					cart.add = function (product_id, quantity)\r\n					{\r\n						var params_cart = new Array();\r\n						params_cart[''name''] = ''product id = ''+product_id;\r\n						params_cart[''quantity''] = quantity;\r\n						params_cart[''price''] = 0;\r\n						old_addCart(product_id, quantity);\r\n						metrikaReach(''metrikaCart'', params_cart);\r\n					}\r\n\r\n					$(''#button-cart'').on(''click'', function() {\r\n						var params_cart = new Array();\r\n						params_cart[''name''] = ''product id = ''+ $(''#product input[name="product_id"]'').val();\r\n						params_cart[''quantity''] = $(''#product input[name="quantity"]'').val();\r\n						params_cart[''price''] = 0;\r\n						metrikaReach(''metrikaCart'', params_cart);\r\n					});\r\n\r\n					function metrikaReach(goal_name, params) {\r\n					for (var i in window) {\r\n						if (/^yaCounter\\d+/.test(i)) {\r\n							window[i].reachGoal(goal_name, params);\r\n						}\r\n					}\r\n				}\r\n				</script>\r\n			<?php } ?>\r\n			<footer>\r\n			]]></add>\r\n		</operation>\r\n	</file>\r\n</modification>', 1, '2016-02-19 20:46:57');

-- --------------------------------------------------------

--
-- Структура таблицы `ma_module`
--

CREATE TABLE IF NOT EXISTS `ma_module` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `code` varchar(32) NOT NULL,
  `setting` text NOT NULL,
  PRIMARY KEY (`module_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=33 ;

--
-- Дамп данных таблицы `ma_module`
--

INSERT INTO `ma_module` (`module_id`, `name`, `code`, `setting`) VALUES
(30, 'Category', 'banner', '{"name":"Category","banner_id":"6","width":"182","height":"182","status":"1"}'),
(29, 'Home Page', 'carousel', '{"name":"Home Page","banner_id":"8","width":"130","height":"100","status":"1"}'),
(28, 'Home Page', 'featured', '{"name":"Home Page","product":["43","40","42","30"],"limit":"4","width":"200","height":"200","status":"1"}'),
(27, 'Home Page', 'slideshow', '{"name":"Home Page","banner_id":"7","width":"1140","height":"380","status":"1"}'),
(31, 'Banner 1', 'banner', '{"name":"Banner 1","banner_id":"6","width":"182","height":"182","status":"1"}'),
(32, 'Акции в категориях', 'special', '{"name":"\\u0410\\u043a\\u0446\\u0438\\u0438 \\u0432 \\u043a\\u0430\\u0442\\u0435\\u0433\\u043e\\u0440\\u0438\\u044f\\u0445","limit":"5","width":"200","height":"200","status":"1"}');

-- --------------------------------------------------------

--
-- Структура таблицы `ma_mws_return`
--

CREATE TABLE IF NOT EXISTS `ma_mws_return` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_id` text NOT NULL,
  `amount` varchar(10) NOT NULL,
  `status` int(11) NOT NULL,
  `techMessage` text NOT NULL,
  `error` int(11) NOT NULL,
  `cause` text NOT NULL,
  `clientOrderId` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `response` text NOT NULL,
  `request` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ma_oneclickbuy`
--

CREATE TABLE IF NOT EXISTS `ma_oneclickbuy` (
  `name` varchar(32) NOT NULL,
  `phone` varchar(32) NOT NULL,
  `address` varchar(128) NOT NULL,
  `delivery_type` int(11) NOT NULL,
  `is_gift` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `ma_oneclickbuy`
--

INSERT INTO `ma_oneclickbuy` (`name`, `phone`, `address`, `delivery_type`, `is_gift`, `created_at`, `id`, `product_id`, `quantity`, `price`) VALUES
('12124', '+79253811922', 'f;lwejf;wekefwewwe', 0, 1, '2016-02-12 01:01:58', 2, 52, 3, '37037034');

-- --------------------------------------------------------

--
-- Структура таблицы `ma_option`
--

CREATE TABLE IF NOT EXISTS `ma_option` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- Дамп данных таблицы `ma_option`
--

INSERT INTO `ma_option` (`option_id`, `type`, `sort_order`) VALUES
(1, 'radio', 1),
(2, 'checkbox', 2),
(4, 'text', 3),
(5, 'select', 4),
(6, 'textarea', 5),
(7, 'file', 6),
(8, 'date', 7),
(9, 'time', 8),
(10, 'datetime', 9),
(11, 'select', 10),
(12, 'date', 11),
(13, 'radio', 2),
(14, 'radio', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `ma_option_description`
--

CREATE TABLE IF NOT EXISTS `ma_option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ma_option_description`
--

INSERT INTO `ma_option_description` (`option_id`, `language_id`, `name`) VALUES
(1, 1, 'Radio'),
(2, 1, 'Checkbox'),
(4, 1, 'Text'),
(6, 1, 'Textarea'),
(8, 1, 'Date'),
(7, 1, 'File'),
(5, 1, 'Select'),
(9, 1, 'Time'),
(10, 1, 'Date &amp; Time'),
(12, 1, 'Delivery Date'),
(11, 1, 'Size'),
(1, 2, 'Radio'),
(2, 2, 'Checkbox'),
(4, 2, 'Text'),
(6, 2, 'Textarea'),
(8, 2, 'Date'),
(7, 2, 'File'),
(5, 2, 'Select'),
(9, 2, 'Time'),
(10, 2, 'Date &amp; Time'),
(12, 2, 'Delivery Date'),
(11, 2, 'Size'),
(13, 2, 'Color'),
(14, 1, 'Размер'),
(13, 1, 'Цвет'),
(14, 2, 'Size');

-- --------------------------------------------------------

--
-- Структура таблицы `ma_option_value`
--

CREATE TABLE IF NOT EXISTS `ma_option_value` (
  `option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_value_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=108 ;

--
-- Дамп данных таблицы `ma_option_value`
--

INSERT INTO `ma_option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES
(43, 1, '', 3),
(32, 1, '', 1),
(45, 2, '', 4),
(44, 2, '', 3),
(42, 5, '', 4),
(41, 5, '', 3),
(39, 5, '', 1),
(40, 5, '', 2),
(31, 1, '', 2),
(23, 2, '', 1),
(24, 2, '', 2),
(46, 11, '', 1),
(47, 11, '', 2),
(48, 11, '', 3),
(69, 13, '', 0),
(57, 13, '', 0),
(56, 13, '', 0),
(55, 13, '', 0),
(54, 13, '', 0),
(53, 13, '', 0),
(52, 13, '', 0),
(51, 13, '', 0),
(50, 13, '', 0),
(58, 13, '', 0),
(59, 13, '', 0),
(60, 13, '', 0),
(68, 13, '', 0),
(67, 13, '', 0),
(66, 13, '', 0),
(65, 13, '', 0),
(64, 13, '', 0),
(63, 13, '', 0),
(62, 13, '', 0),
(61, 13, '', 0),
(49, 13, '', 0),
(70, 13, '', 0),
(71, 13, '', 0),
(72, 13, '', 0),
(73, 13, '', 0),
(74, 13, '', 0),
(75, 13, '', 0),
(76, 13, '', 0),
(77, 13, '', 0),
(78, 13, '', 0),
(79, 13, '', 0),
(80, 13, '', 0),
(81, 13, '', 0),
(82, 13, '', 0),
(83, 14, '', 0),
(84, 14, '', 0),
(85, 14, '', 0),
(86, 14, '', 0),
(87, 14, '', 0),
(88, 14, '', 0),
(89, 14, '', 0),
(90, 14, '', 0),
(91, 14, '', 0),
(92, 14, '', 0),
(93, 14, '', 0),
(94, 14, '', 0),
(95, 14, '', 0),
(96, 14, '', 0),
(97, 14, '', 0),
(98, 14, '', 0),
(99, 14, '', 0),
(100, 14, '', 0),
(101, 14, '', 0),
(102, 14, '', 0),
(103, 14, '', 0),
(104, 14, '', 0),
(105, 14, '', 0),
(106, 14, '', 0),
(107, 14, '', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `ma_option_value_description`
--

CREATE TABLE IF NOT EXISTS `ma_option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`option_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ma_option_value_description`
--

INSERT INTO `ma_option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES
(43, 1, 1, 'Large'),
(32, 1, 1, 'Small'),
(45, 1, 2, 'Checkbox 4'),
(44, 1, 2, 'Checkbox 3'),
(31, 1, 1, 'Medium'),
(42, 1, 5, 'Yellow'),
(41, 1, 5, 'Green'),
(39, 1, 5, 'Red'),
(40, 1, 5, 'Blue'),
(23, 1, 2, 'Checkbox 1'),
(24, 1, 2, 'Checkbox 2'),
(48, 1, 11, 'Large'),
(47, 1, 11, 'Medium'),
(46, 1, 11, 'Small'),
(43, 2, 1, 'Large'),
(32, 2, 1, 'Small'),
(45, 2, 2, 'Checkbox 4'),
(44, 2, 2, 'Checkbox 3'),
(31, 2, 1, 'Medium'),
(42, 2, 5, 'Yellow'),
(41, 2, 5, 'Green'),
(39, 2, 5, 'Red'),
(40, 2, 5, 'Blue'),
(23, 2, 2, 'Checkbox 1'),
(24, 2, 2, 'Checkbox 2'),
(48, 2, 11, 'Large'),
(47, 2, 11, 'Medium'),
(46, 2, 11, 'Small'),
(54, 1, 13, 'Коралловый'),
(53, 2, 13, 'Cyan'),
(53, 1, 13, 'Бирюзовый'),
(52, 2, 13, 'Maroon'),
(52, 1, 13, 'Бордовый'),
(51, 2, 13, 'Terra-cotta'),
(50, 2, 13, 'Gold'),
(51, 1, 13, 'Терракотовый'),
(50, 1, 13, 'Золотой'),
(58, 2, 13, 'Sand-coloured'),
(58, 1, 13, 'Песочный'),
(59, 2, 13, 'Olive-green'),
(59, 1, 13, 'Оливковый'),
(60, 2, 13, 'Emerald-green'),
(60, 1, 13, 'Изумрудный'),
(68, 2, 13, 'Black'),
(68, 1, 13, 'Черный'),
(67, 2, 13, 'Grey'),
(67, 1, 13, 'Серый'),
(66, 2, 13, 'Ivory'),
(66, 1, 13, 'Айвори'),
(65, 2, 13, 'Brown'),
(64, 2, 13, 'Raspberry-red'),
(65, 1, 13, 'Коричневый'),
(64, 1, 13, 'Малиновый'),
(63, 2, 13, 'Lilac'),
(63, 1, 13, 'Сиреневый'),
(62, 2, 13, 'Indigo'),
(62, 1, 13, 'Индиго'),
(61, 2, 13, 'Azure'),
(61, 1, 13, 'Голубой'),
(49, 2, 13, 'Silver'),
(49, 1, 13, 'Серебряный'),
(70, 2, 13, 'Purple'),
(70, 1, 13, 'Фиолетовый'),
(71, 2, 13, 'Pink'),
(71, 1, 13, 'Розовый'),
(72, 2, 13, 'Green'),
(72, 1, 13, 'Зеленый'),
(73, 2, 13, 'Blue'),
(73, 1, 13, 'Синий'),
(74, 2, 13, 'Red'),
(74, 1, 13, 'Красный'),
(75, 2, 13, 'Beige'),
(75, 1, 13, 'Бежевый'),
(76, 2, 13, 'Orange'),
(76, 1, 13, 'Оранжевый'),
(77, 2, 13, 'Yellow'),
(77, 1, 13, 'Желтый'),
(83, 2, 14, 'L'),
(83, 1, 14, 'L'),
(84, 2, 14, 'M'),
(84, 1, 14, 'M'),
(85, 2, 14, 'S'),
(85, 1, 14, 'S'),
(86, 2, 14, 'XS'),
(86, 1, 14, 'XS'),
(87, 2, 14, 'XL'),
(87, 1, 14, 'XL'),
(88, 2, 14, 'XXL'),
(88, 1, 14, 'XXL'),
(89, 2, 14, '26'),
(89, 1, 14, '26'),
(90, 2, 14, '27'),
(90, 1, 14, '27'),
(91, 2, 14, '28'),
(91, 1, 14, '28'),
(92, 2, 14, '29'),
(92, 1, 14, '29'),
(93, 2, 14, '30'),
(93, 1, 14, '30'),
(94, 2, 14, '36'),
(94, 1, 14, '36'),
(95, 2, 14, '37'),
(95, 1, 14, '37'),
(96, 2, 14, '38'),
(96, 1, 14, '38'),
(97, 2, 14, '39'),
(97, 1, 14, '39'),
(98, 2, 14, '40'),
(98, 1, 14, '40'),
(99, 2, 14, '42'),
(99, 1, 14, '42'),
(100, 2, 14, '44'),
(100, 1, 14, '44'),
(101, 2, 14, '46'),
(101, 1, 14, '46'),
(102, 2, 14, '48'),
(102, 1, 14, '48'),
(103, 2, 14, '50'),
(103, 1, 14, '50'),
(104, 2, 14, '52'),
(104, 1, 14, '52'),
(105, 2, 14, '54'),
(105, 1, 14, '54'),
(106, 2, 14, '56'),
(106, 1, 14, '56'),
(107, 2, 14, '58'),
(107, 1, 14, '58'),
(78, 2, 13, 'checkwork'),
(78, 1, 13, 'Клетка'),
(79, 2, 13, 'stripe'),
(79, 1, 13, 'Полоска'),
(80, 2, 13, 'polka dot'),
(80, 1, 13, 'Горох'),
(81, 2, 13, 'leopard'),
(81, 1, 13, 'Леопард'),
(82, 2, 13, 'zebra'),
(82, 1, 13, 'Зебра'),
(54, 2, 13, 'Coralline '),
(55, 1, 13, 'Хаки'),
(55, 2, 13, 'Khaki'),
(56, 1, 13, 'Шоколадный'),
(56, 2, 13, 'Chocolate-brown'),
(57, 1, 13, 'Аквамарин'),
(57, 2, 13, 'Aquamarine'),
(69, 1, 13, 'Белый'),
(69, 2, 13, 'White');

-- --------------------------------------------------------

--
-- Структура таблицы `ma_order`
--

CREATE TABLE IF NOT EXISTS `ma_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_no` int(11) NOT NULL DEFAULT '0',
  `invoice_prefix` varchar(26) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `store_name` varchar(64) NOT NULL,
  `store_url` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `fax` varchar(32) NOT NULL,
  `custom_field` text NOT NULL,
  `payment_firstname` varchar(32) NOT NULL,
  `payment_lastname` varchar(32) NOT NULL,
  `payment_company` varchar(40) NOT NULL,
  `payment_address_1` varchar(128) NOT NULL,
  `payment_address_2` varchar(128) NOT NULL,
  `payment_city` varchar(128) NOT NULL,
  `payment_postcode` varchar(10) NOT NULL,
  `payment_country` varchar(128) NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text NOT NULL,
  `payment_custom_field` text NOT NULL,
  `payment_method` varchar(128) NOT NULL,
  `payment_code` varchar(128) NOT NULL,
  `shipping_firstname` varchar(32) NOT NULL,
  `shipping_lastname` varchar(32) NOT NULL,
  `shipping_company` varchar(40) NOT NULL,
  `shipping_address_1` varchar(128) NOT NULL,
  `shipping_address_2` varchar(128) NOT NULL,
  `shipping_city` varchar(128) NOT NULL,
  `shipping_postcode` varchar(10) NOT NULL,
  `shipping_country` varchar(128) NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text NOT NULL,
  `shipping_custom_field` text NOT NULL,
  `shipping_method` varchar(128) NOT NULL,
  `shipping_code` varchar(128) NOT NULL,
  `comment` text NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `order_status_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_id` int(11) NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `marketing_id` int(11) NOT NULL,
  `tracking` varchar(64) NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(15,8) NOT NULL DEFAULT '1.00000000',
  `ip` varchar(40) NOT NULL,
  `forwarded_ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `accept_language` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `ma_order`
--

INSERT INTO `ma_order` (`order_id`, `invoice_no`, `invoice_prefix`, `store_id`, `store_name`, `store_url`, `customer_id`, `customer_group_id`, `firstname`, `lastname`, `email`, `telephone`, `fax`, `custom_field`, `payment_firstname`, `payment_lastname`, `payment_company`, `payment_address_1`, `payment_address_2`, `payment_city`, `payment_postcode`, `payment_country`, `payment_country_id`, `payment_zone`, `payment_zone_id`, `payment_address_format`, `payment_custom_field`, `payment_method`, `payment_code`, `shipping_firstname`, `shipping_lastname`, `shipping_company`, `shipping_address_1`, `shipping_address_2`, `shipping_city`, `shipping_postcode`, `shipping_country`, `shipping_country_id`, `shipping_zone`, `shipping_zone_id`, `shipping_address_format`, `shipping_custom_field`, `shipping_method`, `shipping_code`, `comment`, `total`, `order_status_id`, `affiliate_id`, `commission`, `marketing_id`, `tracking`, `language_id`, `currency_id`, `currency_code`, `currency_value`, `ip`, `forwarded_ip`, `user_agent`, `accept_language`, `date_added`, `date_modified`) VALUES
(1, 0, 'INV-2015-00', 0, 'Интернет магазин Opencart &quot;Русская сборка&quot;', 'http://weblama.me/', 0, 1, 'dsfds', 'dfsdfs', 'dsaf@dsf.ru', '324324324', '', '[]', 'dsfds', 'dfsdfs', '', '34232432', '', '234234', '', 'Russian Federation', 176, 'Chita', 2734, '', '[]', 'Оплата при доставке', 'cod', 'dsfds', 'dfsdfs', '', '34232432', '', '234234', '', 'Russian Federation', 176, 'Chita', 2734, '', '[]', 'Доставка с фиксированной стоимостью доставки', 'flat.flat', '', 100005.0000, 1, 0, 0.0000, 0, '', 1, 1, 'RUB', 1.00000000, '109.252.67.151', '', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36', 'ru-RU,ru;q=0.8,en-US;q=0.6,en;q=0.4', '2016-02-08 17:05:39', '2016-02-08 17:05:43');

-- --------------------------------------------------------

--
-- Структура таблицы `ma_order_custom_field`
--

CREATE TABLE IF NOT EXISTS `ma_order_custom_field` (
  `order_custom_field_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `custom_field_value_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  `location` varchar(16) NOT NULL,
  PRIMARY KEY (`order_custom_field_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ma_order_history`
--

CREATE TABLE IF NOT EXISTS `ma_order_history` (
  `order_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_history_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `ma_order_history`
--

INSERT INTO `ma_order_history` (`order_history_id`, `order_id`, `order_status_id`, `notify`, `comment`, `date_added`) VALUES
(1, 1, 1, 0, '', '2016-02-08 17:05:43');

-- --------------------------------------------------------

--
-- Структура таблицы `ma_order_option`
--

CREATE TABLE IF NOT EXISTS `ma_order_option` (
  `order_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL,
  PRIMARY KEY (`order_option_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ma_order_product`
--

CREATE TABLE IF NOT EXISTS `ma_order_product` (
  `order_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `reward` int(8) NOT NULL,
  PRIMARY KEY (`order_product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `ma_order_product`
--

INSERT INTO `ma_order_product` (`order_product_id`, `order_id`, `product_id`, `name`, `model`, `quantity`, `price`, `total`, `tax`, `reward`) VALUES
(1, 1, 51, 'Fly-girl для женщин', 'XS', 1, 100000.0000, 100000.0000, 0.0000, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `ma_order_recurring`
--

CREATE TABLE IF NOT EXISTS `ma_order_recurring` (
  `order_recurring_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_quantity` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `recurring_name` varchar(255) NOT NULL,
  `recurring_description` varchar(255) NOT NULL,
  `recurring_frequency` varchar(25) NOT NULL,
  `recurring_cycle` smallint(6) NOT NULL,
  `recurring_duration` smallint(6) NOT NULL,
  `recurring_price` decimal(10,4) NOT NULL,
  `trial` tinyint(1) NOT NULL,
  `trial_frequency` varchar(25) NOT NULL,
  `trial_cycle` smallint(6) NOT NULL,
  `trial_duration` smallint(6) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_recurring_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ma_order_recurring_transaction`
--

CREATE TABLE IF NOT EXISTS `ma_order_recurring_transaction` (
  `order_recurring_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_recurring_id` int(11) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `amount` decimal(10,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`order_recurring_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ma_order_status`
--

CREATE TABLE IF NOT EXISTS `ma_order_status` (
  `order_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`order_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

--
-- Дамп данных таблицы `ma_order_status`
--

INSERT INTO `ma_order_status` (`order_status_id`, `language_id`, `name`) VALUES
(1, 1, 'Ожидание'),
(2, 1, 'В обработке'),
(3, 1, 'Доставлено'),
(7, 1, 'Отменено'),
(5, 1, 'Сделка завершена'),
(8, 1, 'Возврат'),
(9, 1, 'Отмена и аннулирование'),
(10, 1, 'Неудавшийся'),
(11, 1, 'Возмещенный'),
(12, 1, 'Полностью измененный'),
(13, 1, 'Полный возврат'),
(1, 2, 'Ожидание'),
(2, 2, 'В обработке'),
(3, 2, 'Доставлено'),
(7, 2, 'Отменено'),
(5, 2, 'Сделка завершена'),
(8, 2, 'Возврат'),
(9, 2, 'Отмена и аннулирование'),
(10, 2, 'Неудавшийся'),
(11, 2, 'Возмещенный'),
(12, 2, 'Полностью измененный'),
(13, 2, 'Полный возврат');

-- --------------------------------------------------------

--
-- Структура таблицы `ma_order_total`
--

CREATE TABLE IF NOT EXISTS `ma_order_total` (
  `order_total_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`order_total_id`),
  KEY `order_id` (`order_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `ma_order_total`
--

INSERT INTO `ma_order_total` (`order_total_id`, `order_id`, `code`, `title`, `value`, `sort_order`) VALUES
(1, 1, 'sub_total', 'Сумма', 100000.0000, 1),
(2, 1, 'shipping', 'Доставка с фиксированной стоимостью доставки', 5.0000, 3),
(3, 1, 'total', 'Итого', 100005.0000, 9);

-- --------------------------------------------------------

--
-- Структура таблицы `ma_order_voucher`
--

CREATE TABLE IF NOT EXISTS `ma_order_voucher` (
  `order_voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  PRIMARY KEY (`order_voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ma_product`
--

CREATE TABLE IF NOT EXISTS `ma_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(64) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `upc` varchar(12) NOT NULL,
  `ean` varchar(14) NOT NULL,
  `jan` varchar(13) NOT NULL,
  `isbn` varchar(17) NOT NULL,
  `mpn` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `points` int(8) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL,
  `date_available` date NOT NULL DEFAULT '0000-00-00',
  `weight` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `weight_class_id` int(11) NOT NULL DEFAULT '0',
  `length` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `width` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `height` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `length_class_id` int(11) NOT NULL DEFAULT '0',
  `subtract` tinyint(1) NOT NULL DEFAULT '1',
  `minimum` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `viewed` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=68 ;

--
-- Дамп данных таблицы `ma_product`
--

INSERT INTO `ma_product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `viewed`, `date_added`, `date_modified`) VALUES
(52, 'xxs', '', '', '', '', '', '', '', 1, 7, 'catalog/main_2_1.jpg', 11, 1, 12348.0000, 0, 0, '2016-01-20', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, 68, '2016-01-20 14:34:56', '2016-02-22 00:51:57'),
(67, 'xxs', '5', '', '', '', '', '', '', 1, 7, 'catalog/main_2_1.jpg', 11, 1, 12348.0000, 0, 0, '2016-01-20', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, 4, '2016-02-21 16:09:53', '2016-02-21 17:07:52'),
(66, 'xxs', '4', '', '', '', '', '', '', 1, 7, 'catalog/main_2_1.jpg', 11, 1, 12348.0000, 0, 0, '2016-01-20', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, 4, '2016-02-21 16:09:50', '2016-02-21 17:07:59'),
(65, 'xxs', '3', '', '', '', '', '', '', 1, 7, 'catalog/86.jpg', 11, 1, 1634.0000, 0, 0, '2016-01-20', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, 332, '2016-02-21 16:09:47', '2016-02-22 04:12:06'),
(63, 'xxs', '1', '', '', '', '', '', '', 1, 7, 'catalog/main_2_1.jpg', 11, 1, 12348.0000, 0, 0, '2016-01-20', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, 5, '2016-02-21 16:09:42', '2016-02-21 17:08:12'),
(64, 'xxs', '2', '', '', '', '', '', '', 1, 7, 'catalog/main_2_1.jpg', 11, 1, 12348.0000, 0, 0, '2016-01-20', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, 1, '2016-02-21 16:09:45', '2016-02-21 17:08:17');

-- --------------------------------------------------------

--
-- Структура таблицы `ma_product_attribute`
--

CREATE TABLE IF NOT EXISTS `ma_product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`product_id`,`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ma_product_attribute`
--

INSERT INTO `ma_product_attribute` (`product_id`, `attribute_id`, `language_id`, `text`) VALUES
(65, 16, 1, 'ваываыавы '),
(65, 15, 2, 'red'),
(65, 15, 1, 'красный'),
(65, 14, 2, 'sadfdsaf'),
(65, 14, 1, 'ываыв'),
(65, 13, 2, 'dfsafads'),
(65, 13, 1, 'ывфа'),
(65, 12, 2, 'China'),
(65, 12, 1, 'Китай'),
(65, 16, 2, 'dfsfdasfs');

-- --------------------------------------------------------

--
-- Структура таблицы `ma_product_description`
--

CREATE TABLE IF NOT EXISTS `ma_product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `tag` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`product_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ma_product_description`
--

INSERT INTO `ma_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(66, 2, 'Хит №1', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'Buy Хит №1 in online - shop Angel - moda', 'Buy Хит №1 in online - shop Angel - moda. Phone: +79295885399. Call us!', ''),
(63, 1, 'Хит №5', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'Купить Хит №5 в интернет - магазине Angel - moda', 'Купить Хит №5 в интернет - магазине Angel - moda. Телефон: +79295885399. Звоните!', ''),
(63, 2, 'Хит №1', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'Buy Хит №1 in online - shop Angel - moda', 'Buy Хит №1 in online - shop Angel - moda. Phone: +79295885399. Call us!', ''),
(67, 1, 'Хит №2', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'Купить Хит №2 в интернет - магазине Angel - moda', 'Купить Хит №2 в интернет - магазине Angel - moda. Телефон: +79295885399. Звоните!', ''),
(67, 2, 'Хит №1', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'Buy Хит №1 in online - shop Angel - moda', 'Buy Хит №1 in online - shop Angel - moda. Phone: +79295885399. Call us!', ''),
(66, 1, 'Хит №3', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'Купить Хит №3 в интернет - магазине Angel - moda', 'Купить Хит №3 в интернет - магазине Angel - moda. Телефон: +79295885399. Звоните!', ''),
(64, 1, 'Хит №6', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'Купить Хит №6 в интернет - магазине Angel - moda', 'Купить Хит №6 в интернет - магазине Angel - moda. Телефон: +79295885399. Звоните!', ''),
(64, 2, 'Хит №1', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'Buy Хит №1 in online - shop Angel - moda', 'Buy Хит №1 in online - shop Angel - moda. Phone: +79295885399. Call us!', ''),
(65, 1, 'Хит №4', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'Купить Хит №4 в интернет - магазине Angel - moda', 'Купить Хит №4 в интернет - магазине Angel - moda. Телефон: +79295885399. Звоните!', ''),
(65, 2, 'Хит №1', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'Buy Хит №1 in online - shop Angel - moda', 'Buy Хит №1 in online - shop Angel - moda. Phone: +79295885399. Call us!', ''),
(52, 1, 'Хит №1', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'Купить Хит №1 в интернет - магазине Angel - moda', 'Купить Хит №1 в интернет - магазине Angel - moda. Телефон: +79295885399. Звоните!', ''),
(52, 2, 'hit №1', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;', '', 'Buy hit №1 in online - shop Angel - moda', 'Buy hit №1 in online - shop Angel - moda. Phone: +79295885399. Call us!', '');

-- --------------------------------------------------------

--
-- Структура таблицы `ma_product_discount`
--

CREATE TABLE IF NOT EXISTS `ma_product_discount` (
  `product_discount_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_discount_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=472 ;

--
-- Дамп данных таблицы `ma_product_discount`
--

INSERT INTO `ma_product_discount` (`product_discount_id`, `product_id`, `customer_group_id`, `quantity`, `priority`, `price`, `date_start`, `date_end`) VALUES
(470, 52, 1, 1434, 0, 1500.0000, '0000-00-00', '0000-00-00'),
(458, 63, 1, 1434, 0, 1500.0000, '0000-00-00', '0000-00-00'),
(459, 64, 1, 1434, 0, 1500.0000, '0000-00-00', '0000-00-00'),
(471, 65, 1, 1434, 0, 1500.0000, '0000-00-00', '0000-00-00'),
(456, 66, 1, 1434, 0, 1500.0000, '0000-00-00', '0000-00-00'),
(455, 67, 1, 1434, 0, 1500.0000, '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Структура таблицы `ma_product_filter`
--

CREATE TABLE IF NOT EXISTS `ma_product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`filter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ma_product_image`
--

CREATE TABLE IF NOT EXISTS `ma_product_image` (
  `product_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_image_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2423 ;

--
-- Дамп данных таблицы `ma_product_image`
--

INSERT INTO `ma_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES
(2419, 52, 'catalog/w_3734b7ce.jpg', 0),
(2405, 63, 'catalog/w_3734b7ce.jpg', 0),
(2406, 64, 'catalog/w_3734b7ce.jpg', 0),
(2403, 66, 'catalog/w_3734b7ce.jpg', 0),
(2402, 67, 'catalog/w_3734b7ce.jpg', 0),
(2420, 65, 'catalog/w_3734b7ce.jpg', 0),
(2421, 65, 'catalog/DSC06436.jpg', 0),
(2422, 65, 'catalog/DSC06423.jpg', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `ma_product_option`
--

CREATE TABLE IF NOT EXISTS `ma_product_option` (
  `product_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `value` text NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`product_option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=243 ;

--
-- Дамп данных таблицы `ma_product_option`
--

INSERT INTO `ma_product_option` (`product_option_id`, `product_id`, `option_id`, `value`, `required`) VALUES
(234, 64, 13, '', 1),
(233, 63, 14, '', 1),
(232, 63, 13, '', 1),
(230, 52, 13, '', 1),
(231, 52, 14, '', 1),
(235, 64, 14, '', 1),
(236, 65, 13, '', 1),
(242, 65, 14, '', 1),
(238, 66, 13, '', 1),
(239, 66, 14, '', 1),
(240, 67, 13, '', 1),
(241, 67, 14, '', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `ma_product_option_value`
--

CREATE TABLE IF NOT EXISTS `ma_product_option_value` (
  `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL,
  PRIMARY KEY (`product_option_value_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=91 ;

--
-- Дамп данных таблицы `ma_product_option_value`
--

INSERT INTO `ma_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES
(37, 235, 64, 14, 101, 0, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(33, 233, 63, 14, 86, 0, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(32, 233, 63, 14, 101, 0, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(31, 233, 63, 14, 89, 0, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(30, 232, 63, 13, 78, 0, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(29, 232, 63, 13, 66, 0, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(26, 231, 52, 14, 89, 0, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(27, 231, 52, 14, 101, 342, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(28, 231, 52, 14, 86, 234, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(34, 234, 64, 13, 66, 0, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(36, 235, 64, 14, 89, 0, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(38, 235, 64, 14, 86, 0, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(56, 236, 65, 13, 75, 4354, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(54, 236, 65, 13, 66, 4353, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(44, 238, 66, 13, 66, 0, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(45, 238, 66, 13, 78, 0, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(46, 239, 66, 14, 89, 0, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(47, 239, 66, 14, 101, 0, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(48, 239, 66, 14, 86, 0, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(49, 240, 67, 13, 66, 0, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(50, 240, 67, 13, 78, 0, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(51, 241, 67, 14, 89, 0, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(52, 241, 67, 14, 101, 0, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(53, 241, 67, 14, 86, 0, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(35, 234, 64, 13, 78, 0, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(57, 236, 65, 13, 69, 435, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(55, 236, 65, 13, 57, 43534, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(58, 236, 65, 13, 53, 342, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(59, 236, 65, 13, 52, 342, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(60, 236, 65, 13, 61, 342, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(61, 236, 65, 13, 80, 324, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(62, 236, 65, 13, 77, 342, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(63, 236, 65, 13, 82, 234, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(64, 236, 65, 13, 72, 342, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(65, 236, 65, 13, 50, 342, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(66, 236, 65, 13, 60, 234, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(67, 236, 65, 13, 62, 324, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(69, 236, 65, 13, 78, 554, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(70, 236, 65, 13, 54, 234, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(71, 236, 65, 13, 65, 342, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(72, 236, 65, 13, 74, 432, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(73, 236, 65, 13, 81, 324, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(74, 236, 65, 13, 64, 45, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(75, 236, 65, 13, 59, 325, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(76, 236, 65, 13, 76, 45, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(77, 236, 65, 13, 58, 342, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(78, 236, 65, 13, 79, 234, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(79, 236, 65, 13, 71, 342, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(80, 236, 65, 13, 49, 534, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(81, 236, 65, 13, 67, 432, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(82, 236, 65, 13, 73, 5, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(83, 236, 65, 13, 63, 32, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(84, 236, 65, 13, 51, 4, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(85, 236, 65, 13, 70, 5, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(88, 236, 65, 13, 56, 423, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(87, 236, 65, 13, 68, 234, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(86, 236, 65, 13, 55, 4, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(89, 242, 65, 14, 93, 32, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(90, 242, 65, 14, 89, 12, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(25, 230, 52, 13, 78, 23, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(24, 230, 52, 13, 66, 342, 1, 0.0000, '+', 0, '+', 0.00000000, '+');

-- --------------------------------------------------------

--
-- Структура таблицы `ma_product_recurring`
--

CREATE TABLE IF NOT EXISTS `ma_product_recurring` (
  `product_id` int(11) NOT NULL,
  `recurring_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`recurring_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ma_product_related`
--

CREATE TABLE IF NOT EXISTS `ma_product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`related_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ma_product_reward`
--

CREATE TABLE IF NOT EXISTS `ma_product_reward` (
  `product_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `points` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_reward_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=546 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ma_product_special`
--

CREATE TABLE IF NOT EXISTS `ma_product_special` (
  `product_special_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_special_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=450 ;

--
-- Дамп данных таблицы `ma_product_special`
--

INSERT INTO `ma_product_special` (`product_special_id`, `product_id`, `customer_group_id`, `priority`, `price`, `date_start`, `date_end`) VALUES
(449, 65, 1, 0, 1245.0000, '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Структура таблицы `ma_product_to_category`
--

CREATE TABLE IF NOT EXISTS `ma_product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`),
  KEY `category_id` (`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ma_product_to_category`
--

INSERT INTO `ma_product_to_category` (`product_id`, `category_id`) VALUES
(52, 68),
(52, 77),
(52, 78),
(63, 68),
(63, 77),
(63, 78),
(64, 68),
(64, 77),
(64, 78),
(65, 68),
(65, 77),
(65, 78),
(66, 68),
(66, 77),
(66, 78),
(67, 68),
(67, 77),
(67, 78);

-- --------------------------------------------------------

--
-- Структура таблицы `ma_product_to_download`
--

CREATE TABLE IF NOT EXISTS `ma_product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ma_product_to_layout`
--

CREATE TABLE IF NOT EXISTS `ma_product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ma_product_to_layout`
--

INSERT INTO `ma_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES
(52, 0, 0),
(67, 0, 0),
(65, 0, 0),
(64, 0, 0),
(63, 0, 0),
(66, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `ma_product_to_store`
--

CREATE TABLE IF NOT EXISTS `ma_product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ma_product_to_store`
--

INSERT INTO `ma_product_to_store` (`product_id`, `store_id`) VALUES
(52, 0),
(63, 0),
(64, 0),
(65, 0),
(66, 0),
(67, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `ma_recurring`
--

CREATE TABLE IF NOT EXISTS `ma_recurring` (
  `recurring_id` int(11) NOT NULL AUTO_INCREMENT,
  `price` decimal(10,4) NOT NULL,
  `frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `duration` int(10) unsigned NOT NULL,
  `cycle` int(10) unsigned NOT NULL,
  `trial_status` tinyint(4) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `trial_frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `trial_duration` int(10) unsigned NOT NULL,
  `trial_cycle` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL,
  `sort_order` int(11) NOT NULL,
  PRIMARY KEY (`recurring_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ma_recurring_description`
--

CREATE TABLE IF NOT EXISTS `ma_recurring_description` (
  `recurring_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`recurring_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `ma_return`
--

CREATE TABLE IF NOT EXISTS `ma_return` (
  `return_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `product` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int(11) NOT NULL,
  `return_action_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `comment` text,
  `date_ordered` date NOT NULL DEFAULT '0000-00-00',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`return_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ma_return_action`
--

CREATE TABLE IF NOT EXISTS `ma_return_action` (
  `return_action_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL,
  PRIMARY KEY (`return_action_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `ma_return_action`
--

INSERT INTO `ma_return_action` (`return_action_id`, `language_id`, `name`) VALUES
(1, 1, 'Возвращены средства'),
(2, 1, 'Выдан в кредит'),
(3, 1, 'Отправлен другой товар для замены'),
(1, 2, 'Возвращены средства'),
(2, 2, 'Выдан в кредит'),
(3, 2, 'Отправлен другой товар для замены');

-- --------------------------------------------------------

--
-- Структура таблицы `ma_return_history`
--

CREATE TABLE IF NOT EXISTS `ma_return_history` (
  `return_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`return_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ma_return_reason`
--

CREATE TABLE IF NOT EXISTS `ma_return_reason` (
  `return_reason_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  PRIMARY KEY (`return_reason_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `ma_return_reason`
--

INSERT INTO `ma_return_reason` (`return_reason_id`, `language_id`, `name`) VALUES
(1, 1, 'Получен/доставлен неисправным (сломан)'),
(2, 1, 'Получен не тот (ошибочный) товар'),
(4, 1, 'Ошибка, пожалуйста укажите/приложите подробности'),
(5, 1, 'Другое (другая причина), пожалуйста укажите/приложите подробности'),
(1, 2, 'Получен/доставлен неисправным (сломан)'),
(2, 2, 'Получен не тот (ошибочный) товар'),
(4, 2, 'Ошибка, пожалуйста укажите/приложите подробности'),
(5, 2, 'Другое (другая причина), пожалуйста укажите/приложите подробности');

-- --------------------------------------------------------

--
-- Структура таблицы `ma_return_status`
--

CREATE TABLE IF NOT EXISTS `ma_return_status` (
  `return_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`return_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `ma_return_status`
--

INSERT INTO `ma_return_status` (`return_status_id`, `language_id`, `name`) VALUES
(1, 1, 'Рассматриваемый'),
(3, 1, 'Готов (к отправке)'),
(2, 1, 'Заказ в ожидании'),
(1, 2, 'Рассматриваемый'),
(3, 2, 'Готов (к отправке)'),
(2, 2, 'Заказ в ожидании');

-- --------------------------------------------------------

--
-- Структура таблицы `ma_review`
--

CREATE TABLE IF NOT EXISTS `ma_review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`review_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `ma_review`
--

INSERT INTO `ma_review` (`review_id`, `product_id`, `customer_id`, `author`, `text`, `rating`, `status`, `date_added`, `date_modified`) VALUES
(1, 65, 7, 'Дима', 'Все гуд мфпыпоавыфафвы вфыбаорвыфрфваы чм мфрыварврфвы ывфравылрфваыолавыф', 5, 1, '2016-02-21 16:56:24', '2016-02-21 16:56:50');

-- --------------------------------------------------------

--
-- Структура таблицы `ma_setting`
--

CREATE TABLE IF NOT EXISTS `ma_setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(32) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `serialized` tinyint(1) NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4542 ;

--
-- Дамп данных таблицы `ma_setting`
--

INSERT INTO `ma_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES
(1, 0, 'shipping', 'shipping_sort_order', '3', 0),
(2, 0, 'sub_total', 'sub_total_sort_order', '1', 0),
(3, 0, 'sub_total', 'sub_total_status', '1', 0),
(5, 0, 'total', 'total_sort_order', '9', 0),
(6, 0, 'total', 'total_status', '1', 0),
(8, 0, 'free_checkout', 'free_checkout_sort_order', '1', 0),
(9, 0, 'cod', 'cod_sort_order', '5', 0),
(10, 0, 'cod', 'cod_total', '0.01', 0),
(11, 0, 'cod', 'cod_order_status_id', '1', 0),
(12, 0, 'cod', 'cod_geo_zone_id', '0', 0),
(13, 0, 'cod', 'cod_status', '1', 0),
(14, 0, 'shipping', 'shipping_status', '1', 0),
(15, 0, 'shipping', 'shipping_estimator', '1', 0),
(27, 0, 'coupon', 'coupon_sort_order', '4', 0),
(28, 0, 'coupon', 'coupon_status', '1', 0),
(34, 0, 'flat', 'flat_sort_order', '1', 0),
(35, 0, 'flat', 'flat_status', '1', 0),
(36, 0, 'flat', 'flat_geo_zone_id', '0', 0),
(37, 0, 'flat', 'flat_tax_class_id', '0', 0),
(41, 0, 'flat', 'flat_cost', '5.00', 0),
(42, 0, 'credit', 'credit_sort_order', '7', 0),
(43, 0, 'credit', 'credit_status', '1', 0),
(53, 0, 'reward', 'reward_sort_order', '2', 0),
(54, 0, 'reward', 'reward_status', '1', 0),
(146, 0, 'category', 'category_status', '1', 0),
(158, 0, 'account', 'account_status', '1', 0),
(159, 0, 'affiliate', 'affiliate_status', '1', 0),
(1851, 0, 'filter', 'filter_status', '1', 0),
(3438, 0, 'easy_blog', 'easy_blog_global_article_limit', '9', 0),
(3439, 0, 'easy_blog', 'easy_blog_home_page_meta_title', 'Блог', 0),
(4540, 0, 'config', 'config_error_log', '1', 0),
(4539, 0, 'config', 'config_error_display', '1', 0),
(94, 0, 'voucher', 'voucher_sort_order', '8', 0),
(95, 0, 'voucher', 'voucher_status', '1', 0),
(103, 0, 'free_checkout', 'free_checkout_status', '1', 0),
(104, 0, 'free_checkout', 'free_checkout_order_status_id', '1', 0),
(4537, 0, 'config', 'config_file_ext_allowed', 'zip\r\ntxt\r\npng\r\njpe\r\njpeg\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc\r\nsvg', 0),
(4538, 0, 'config', 'config_file_mime_allowed', 'text/plain\r\nimage/png\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/tiff\r\nimage/svg+xml\r\napplication/zip\r\n&quot;application/zip&quot;\r\napplication/x-zip\r\n&quot;application/x-zip&quot;\r\napplication/x-zip-compressed\r\n&quot;application/x-zip-compressed&quot;\r\napplication/rar\r\n&quot;application/rar&quot;\r\napplication/x-rar\r\n&quot;application/x-rar&quot;\r\napplication/x-rar-compressed\r\n&quot;application/x-rar-compressed&quot;\r\napplication/octet-stream\r\n&quot;application/octet-stream&quot;\r\naudio/mpeg\r\nvideo/quicktime\r\napplication/pdf\r\nimage/svg+xml\r\nimage/svg\r\n&quot;image/svg+xml&quot;', 0),
(4447, 0, 'config', 'config_currency', 'RUB', 0),
(4448, 0, 'config', 'config_currency_auto', '1', 0),
(4449, 0, 'config', 'config_length_class_id', '1', 0),
(4450, 0, 'config', 'config_weight_class_id', '1', 0),
(4451, 0, 'config', 'config_product_count', '1', 0),
(4452, 0, 'config', 'config_product_limit', '15', 0),
(4453, 0, 'config', 'config_product_description_length', '100', 0),
(4535, 0, 'config', 'config_encryption', 'DvtJ5NYQhXhYLPPIYAs3DReC3CQmcPBPgWzlZUjdepDNd5s1NkG6PgKmVz8LZXKtqro5ItnaSB9M45x6QLhwdeFUq7X9Hi7hjSsBcRcWersAsCFRkEb843iFeOcFYjOkc8c8svVzQJYrBOLNk06zEDYNG1zlQOus8RiZUmCHeJqVVk0IFdUeWh16ChUURJiTlNWkZOA1NrOLnn0q8L3zRnWec8QP5A39VLY40bdyRhvTOTyxl7twNNbrWzhfQOvIHb1cYxJJ43RebHMiG5nuWH0Ha4u7UazhRqBL8g0wHL9NZvm1ZUAgPX3SlWbML7zVRpXqrNtA0Pp5QiT1MexueL61nwXksiLjXkpKS2i4gBdWSLuGIHIjQIMv0hGZi7pUnXtrUH8B0CXkVirMbByN3wyxg0IPxl5BXc2vRvkJM3qpmx8ioZzyCwMH043jPxuskFOtGNOXk9Uk5rqTaFLkPFqQ0FyKCfvKpH3p3XpYx8FpWbqAeR0GhqKBM8QSVB73AFB9GfgYIaY3mP69uhWo7a6PS4GxcuI3LVEyY57rCnAsAlhg5GSnS92nFtGhBftFlAjuMNoFaojHxMO3QmFOc9EPZQGY2Jiwq5HdsBnWLZjNiIjx0w20uHI7nWog1l5EI1eXqO09gOL4qkluLcz97pVYrIZq79osObx4MmmKkz01hcjbulsdnrHh1RHlPFH07hBubyyT2y9mcr13y5m7sVne1VVkLKva10a5GvuTkGOESFyVIs0plUgqyN8OiwvfW5rjEDXwYCe3RNisZxcdp7fjHd7fxysaYTwkqMiu3HgACGOOiQ98cjXArMdXKVZBC0uQxi3taNb9XZr2J35EIjGmG3dBlLUwChInUPnxDeRfhIPaaqJc0eIZqYpr8ucObZHrlJ3hVwXgJpJgdFU0yZljlZ6Sngjg2MbM29xuK6BzAWoXx3Lue1dzhskgmWn2W1P2ymR7PW4LOiVY6bgVUUqedwGj0COygWbyXFzFKDv5FJw2N4MGm0RzK9iQLTmV', 0),
(4534, 0, 'config', 'config_shared', '0', 0),
(4533, 0, 'config', 'config_password', '1', 0),
(4532, 0, 'config', 'config_secure', '0', 0),
(4531, 0, 'config', 'config_compression', '0', 0),
(4454, 0, 'config', 'config_limit_admin', '20', 0),
(4455, 0, 'config', 'config_review_status', '1', 0),
(4456, 0, 'config', 'config_review_guest', '1', 0),
(4457, 0, 'config', 'config_review_mail', '0', 0),
(4458, 0, 'config', 'config_voucher_min', '1', 0),
(4459, 0, 'config', 'config_voucher_max', '1000', 0),
(4460, 0, 'config', 'config_tax', '0', 0),
(4461, 0, 'config', 'config_tax_default', 'shipping', 0),
(4462, 0, 'config', 'config_tax_customer', 'shipping', 0),
(4463, 0, 'config', 'config_customer_online', '0', 0),
(4464, 0, 'config', 'config_customer_group_id', '1', 0),
(4465, 0, 'config', 'config_customer_group_display', '["1"]', 1),
(4466, 0, 'config', 'config_customer_price', '0', 0),
(4467, 0, 'config', 'config_login_attempts', '5', 0),
(4468, 0, 'config', 'config_account_id', '3', 0),
(4469, 0, 'config', 'config_account_mail', '0', 0),
(4470, 0, 'config', 'config_invoice_prefix', 'INV-2015-00', 0),
(4471, 0, 'config', 'config_cart_weight', '1', 0),
(4472, 0, 'config', 'config_checkout_guest', '1', 0),
(4473, 0, 'config', 'config_checkout_id', '5', 0),
(4474, 0, 'config', 'config_order_status_id', '1', 0),
(4475, 0, 'config', 'config_processing_status', '["2","3","1","12","5"]', 1),
(4476, 0, 'config', 'config_complete_status', '["3","5"]', 1),
(4477, 0, 'config', 'config_fraud_status_id', '2', 0),
(4478, 0, 'config', 'config_order_mail', '1', 0),
(4479, 0, 'config', 'config_api_id', '1', 0),
(4480, 0, 'config', 'config_stock_display', '0', 0),
(4481, 0, 'config', 'config_stock_warning', '1', 0),
(4482, 0, 'config', 'config_stock_checkout', '0', 0),
(4483, 0, 'config', 'config_affiliate_approval', '0', 0),
(4484, 0, 'config', 'config_affiliate_auto', '0', 0),
(4485, 0, 'config', 'config_affiliate_commission', '5', 0),
(4486, 0, 'config', 'config_affiliate_id', '4', 0),
(4487, 0, 'config', 'config_affiliate_mail', '0', 0),
(4488, 0, 'config', 'config_return_id', '0', 0),
(4489, 0, 'config', 'config_return_status_id', '2', 0),
(4490, 0, 'config', 'config_captcha', '', 0),
(4491, 0, 'config', 'config_captcha_page', '["review","return","contact"]', 1),
(4492, 0, 'config', 'config_logo', 'catalog/_eps.png', 0),
(4493, 0, 'config', 'config_icon', 'catalog/cart.png', 0),
(4494, 0, 'config', 'config_image_category_width', '80', 0),
(4495, 0, 'config', 'config_image_category_height', '80', 0),
(4496, 0, 'config', 'config_image_thumb_width', '219', 0),
(4497, 0, 'config', 'config_image_thumb_height', '286', 0),
(4498, 0, 'config', 'config_image_popup_width', '500', 0),
(4499, 0, 'config', 'config_image_popup_height', '500', 0),
(4500, 0, 'config', 'config_image_product_width', '219', 0),
(4501, 0, 'config', 'config_image_product_height', '286', 0),
(4502, 0, 'config', 'config_image_additional_width', '101', 0),
(4503, 0, 'config', 'config_image_additional_height', '94', 0),
(4504, 0, 'config', 'config_image_related_width', '80', 0),
(3440, 0, 'easy_blog', 'easy_blog_home_page_name', 'Блог', 0),
(3441, 0, 'easy_blog', 'easy_blog_home_page_meta_description', '', 0),
(3442, 0, 'easy_blog', 'easy_blog_home_page_meta_keyword', '', 0),
(3443, 0, 'easy_blog', 'easy_blog_global_status', '1', 0),
(4536, 0, 'config', 'config_file_max_size', '300000', 0),
(4530, 0, 'config', 'config_robots', 'abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai''hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg', 0),
(4519, 0, 'config', 'config_ftp_status', '1', 0),
(4520, 0, 'config', 'config_mail_protocol', 'mail', 0),
(4521, 0, 'config', 'config_mail_parameter', '', 0),
(4522, 0, 'config', 'config_mail_smtp_hostname', '', 0),
(4523, 0, 'config', 'config_mail_smtp_username', '', 0),
(4524, 0, 'config', 'config_mail_smtp_password', '', 0),
(4525, 0, 'config', 'config_mail_smtp_port', '25', 0),
(4526, 0, 'config', 'config_mail_smtp_timeout', '5', 0),
(4527, 0, 'config', 'config_mail_alert', '', 0),
(4528, 0, 'config', 'config_maintenance', '0', 0),
(4529, 0, 'config', 'config_seo_url', '0', 0),
(4505, 0, 'config', 'config_image_related_height', '80', 0),
(4506, 0, 'config', 'config_image_compare_width', '90', 0),
(4507, 0, 'config', 'config_image_compare_height', '90', 0),
(4508, 0, 'config', 'config_image_wishlist_width', '47', 0),
(4509, 0, 'config', 'config_image_wishlist_height', '47', 0),
(4510, 0, 'config', 'config_image_cart_width', '74', 0),
(4511, 0, 'config', 'config_image_cart_height', '88', 0),
(4512, 0, 'config', 'config_image_location_width', '268', 0),
(4513, 0, 'config', 'config_image_location_height', '50', 0),
(4514, 0, 'config', 'config_ftp_hostname', 'weblama.me', 0),
(4515, 0, 'config', 'config_ftp_port', '21', 0),
(4516, 0, 'config', 'config_ftp_username', 'fb7903js_moda', 0),
(4517, 0, 'config', 'config_ftp_password', 'as210100', 0),
(4518, 0, 'config', 'config_ftp_root', 'public_html', 0),
(4444, 0, 'config', 'config_zone_id', '', 0),
(4445, 0, 'config', 'config_language', 'ru', 0),
(4446, 0, 'config', 'config_admin_language', 'ru', 0),
(4443, 0, 'config', 'config_country_id', '176', 0),
(4442, 0, 'config', 'config_head_email', 'contact@shmakovdima.ru', 0),
(4441, 0, 'config', 'config_personal_guide_email', 'contact@shmakovdima.ru', 0),
(4439, 0, 'config', 'config_instagram_link', 'https://www.instagram.com/angelsitalia/', 0),
(4440, 0, 'config', 'config_callback_email', 'contact@shmakovdima.ru', 0),
(4438, 0, 'config', 'config_twitter_link', 'https://twitter.com/angelsitalia', 0),
(4437, 0, 'config', 'config_facebook_link', 'https://www.facebook.com/angelsitalia', 0),
(4436, 0, 'config', 'config_vk_link', 'http://vk.com/angelsitalia', 0),
(4435, 0, 'config', 'config_comment', '', 0),
(4433, 0, 'config', 'config_image', '', 0),
(4434, 0, 'config', 'config_open', '', 0),
(4432, 0, 'config', 'config_fax', '495 888-88-88', 0),
(4431, 0, 'config', 'config_telephone_rostov', '+7(928) 125-81-25', 0),
(4430, 0, 'config', 'config_telephone', '+7(929) 588-53-99', 0),
(4427, 0, 'config', 'config_address', 'г. Москва, ул. Ленина 10 оф. 32', 0),
(4428, 0, 'config', 'config_geocode', '', 0),
(4429, 0, 'config', 'config_email', 'contact@shmakovdima.ru', 0),
(4426, 0, 'config', 'config_owner', 'Ольга Алексеева', 0),
(4424, 0, 'config', 'config_layout_id', '4', 0),
(4425, 0, 'config', 'config_name', 'Интернет магазин Opencart &quot;Русская сборка&quot;', 0),
(4423, 0, 'config', 'config_template', 'default', 0),
(4421, 0, 'config', 'config_meta_description', 'Брендовая\r\nодежда, обувь и аксессуары итальянских производителей | Магазин брендовой\r\nодежды из Италии — Angel-Moda\r\nКупить\r\nитальянскую одежду, обувь и аксессуары в интернет магазине Angel-Moda по\r\nдоступной цене. Брендовая одежда итальянских производителей - смотреть\r\nкаталог. Сайты брендовой одежды из Италии. Принимаем заказы по тел.\r\n+7-929-588-53-99.', 0),
(4422, 0, 'config', 'config_meta_keyword', 'итальянская,\r\nбрендовая одежда, интернет магазин, италия, сайты, каталог, цены, angel-moda', 0),
(4420, 0, 'config', 'config_meta_title', 'Брендовая одежда, обувь и аксессуары итальянских производителей | Магазин брендовой одежды из Италии — Angel-Moda', 0),
(4541, 0, 'config', 'config_error_filename', 'error.log', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `ma_stock_status`
--

CREATE TABLE IF NOT EXISTS `ma_stock_status` (
  `stock_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`stock_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Дамп данных таблицы `ma_stock_status`
--

INSERT INTO `ma_stock_status` (`stock_status_id`, `language_id`, `name`) VALUES
(7, 1, 'В наличии'),
(8, 1, 'Предзаказ'),
(5, 1, 'Нет в наличии'),
(6, 1, 'Ожидание 2-3 дня'),
(7, 2, 'В наличии'),
(8, 2, 'Предзаказ'),
(5, 2, 'Нет в наличии'),
(6, 2, 'Ожидание 2-3 дня');

-- --------------------------------------------------------

--
-- Структура таблицы `ma_store`
--

CREATE TABLE IF NOT EXISTS `ma_store` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ma_tax_class`
--

CREATE TABLE IF NOT EXISTS `ma_tax_class` (
  `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`tax_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Дамп данных таблицы `ma_tax_class`
--

INSERT INTO `ma_tax_class` (`tax_class_id`, `title`, `description`, `date_added`, `date_modified`) VALUES
(9, 'Налоги', 'Облагаемые налогом', '2014-06-06 23:00:00', '2014-09-09 11:50:31');

-- --------------------------------------------------------

--
-- Структура таблицы `ma_tax_rate`
--

CREATE TABLE IF NOT EXISTS `ma_tax_rate` (
  `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `type` char(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`tax_rate_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=88 ;

--
-- Дамп данных таблицы `ma_tax_rate`
--

INSERT INTO `ma_tax_rate` (`tax_rate_id`, `geo_zone_id`, `name`, `rate`, `type`, `date_added`, `date_modified`) VALUES
(87, 3, 'НДС', 18.0000, 'F', '2011-09-21 21:49:23', '2014-09-09 11:49:32');

-- --------------------------------------------------------

--
-- Структура таблицы `ma_tax_rate_to_customer_group`
--

CREATE TABLE IF NOT EXISTS `ma_tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`tax_rate_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ma_tax_rate_to_customer_group`
--

INSERT INTO `ma_tax_rate_to_customer_group` (`tax_rate_id`, `customer_group_id`) VALUES
(86, 1),
(87, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `ma_tax_rule`
--

CREATE TABLE IF NOT EXISTS `ma_tax_rule` (
  `tax_rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`tax_rule_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=129 ;

--
-- Дамп данных таблицы `ma_tax_rule`
--

INSERT INTO `ma_tax_rule` (`tax_rule_id`, `tax_class_id`, `tax_rate_id`, `based`, `priority`) VALUES
(121, 10, 86, 'payment', 1),
(120, 10, 87, 'store', 0),
(128, 9, 86, 'shipping', 1),
(127, 9, 87, 'shipping', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `ma_upload`
--

CREATE TABLE IF NOT EXISTS `ma_upload` (
  `upload_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`upload_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ma_url_alias`
--

CREATE TABLE IF NOT EXISTS `ma_url_alias` (
  `url_alias_id` int(11) NOT NULL AUTO_INCREMENT,
  `query` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  PRIMARY KEY (`url_alias_id`),
  KEY `query` (`query`),
  KEY `keyword` (`keyword`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1217 ;

--
-- Дамп данных таблицы `ma_url_alias`
--

INSERT INTO `ma_url_alias` (`url_alias_id`, `query`, `keyword`) VALUES
(987, 'category_id=71', 'novinki-nedeli'),
(1124, 'manufacturer_id=8', 'kuss'),
(1005, 'information_id=4', 'aboutus'),
(1055, 'category_id=79', 'odezhda'),
(986, 'category_id=73', 'novaja-kollektsija'),
(1032, 'category_id=78', 'tovary-na-infostranitsax'),
(1118, 'manufacturer_id=11', 'fly-girl-brand'),
(961, 'category_id=65', 'rasprodazhi'),
(1033, 'category_id=77', 'xity-prodazh'),
(1010, 'information_id=15', 'i-lab'),
(985, 'category_id=72', 'sale'),
(958, 'category_id=59', 'muzhchinam'),
(1012, 'category_id=60', 'zhenschinam'),
(1146, 'category_id=85', 'bizhuterija'),
(1170, 'category_id=68', 'nizhnee-belje'),
(1171, 'category_id=69', 'noski'),
(1049, 'information_id=13', 'mailus'),
(1101, 'information_id=14', 'contacts'),
(1052, 'information_id=12', 'shoptour'),
(1206, 'information_id=8', 'return'),
(937, 'information_id=9', 'loyaty'),
(1015, 'information_id=10', 'wholesale'),
(939, 'information_id=11', 'choose_size'),
(1130, 'manufacturer_id=17', 'who-s-who'),
(1110, 'manufacturer_id=16', '22-maggio'),
(1132, 'manufacturer_id=15', 'angeletto'),
(1121, 'manufacturer_id=14', 'babylon'),
(1112, 'manufacturer_id=13', 'angels'),
(1114, 'manufacturer_id=12', 'cavalli-class'),
(1067, 'category_id=84', 'rubashki'),
(1066, 'category_id=83', 'sportivnaja-odezhda'),
(1216, 'product_id=52', 'xit-1'),
(1057, 'category_id=80', 'kostjumy'),
(1069, 'category_id=81', 'sale'),
(1065, 'category_id=82', 'dzhempery-i-kardigany'),
(1119, 'manufacturer_id=9', 'guess'),
(1129, 'manufacturer_id=5', 'vdp'),
(1123, 'manufacturer_id=7', 'elisa-fanti'),
(1122, 'manufacturer_id=6', 'ean13'),
(1115, 'manufacturer_id=10', 'clips'),
(932, 'information_id=7', 'delivery'),
(842, 'information_id=3', 'privacy'),
(843, 'information_id=5', 'terms'),
(845, 'common/home', ''),
(846, 'information/contact', 'contact-us'),
(847, 'information/sitemap', 'sitemap'),
(848, 'product/special', 'specials'),
(849, 'product/manufacturer', 'brands'),
(850, 'product/compare', 'compare-products'),
(851, 'product/search', 'search'),
(852, 'checkout/cart', 'cart'),
(853, 'checkout/checkout', 'checkout'),
(854, 'account/login', 'login'),
(855, 'account/logout', 'logout'),
(856, 'account/voucher', 'vouchers'),
(857, 'account/wishlist', 'wishlist'),
(858, 'account/account', 'my-account'),
(859, 'account/order', 'order-history'),
(860, 'account/newsletter', 'newsletter'),
(861, 'account/return/add', 'return-add'),
(862, 'account/forgotten', 'forgot-password'),
(863, 'account/download', 'downloads'),
(864, 'account/return', 'returns'),
(865, 'account/transaction', 'transactions'),
(866, 'account/register', 'create-account'),
(867, 'account/recurring', 'recurring'),
(868, 'account/address', 'address-book'),
(869, 'account/reward', 'reward-points'),
(870, 'account/edit', 'edit-account'),
(871, 'account/password', 'change-password'),
(880, 'affiliate/forgotten', 'affiliate-forgot-password'),
(881, 'affiliate/register', 'create-affiliate-account'),
(882, 'affiliate/login', 'affiliate-login'),
(883, 'affiliate/payment', 'affiliate-payment'),
(884, 'affiliate/tracking', 'affiliate-tracking'),
(885, 'affiliate/transaction', 'affiliate-transaction'),
(886, 'affiliate/account', 'affiliates'),
(1125, 'manufacturer_id=18', 'maria-grazia-severi'),
(1128, 'manufacturer_id=19', 'severi-darling'),
(1127, 'manufacturer_id=20', 'met'),
(1126, 'manufacturer_id=21', 'marina-yachting'),
(1104, 'information_id=16', 'manufacturers'),
(1148, 'category_id=87', ''),
(1149, 'category_id=88', ''),
(1150, 'category_id=89', ''),
(1151, 'category_id=90', ''),
(1152, 'category_id=91', ''),
(1153, 'category_id=92', ''),
(1157, 'category_id=96', ''),
(1156, 'category_id=95', ''),
(1158, 'category_id=97', ''),
(1159, 'category_id=98', ''),
(1160, 'category_id=99', ''),
(1161, 'category_id=100', ''),
(1162, 'category_id=101', ''),
(1163, 'category_id=102', ''),
(1164, 'category_id=103', ''),
(1165, 'category_id=104', ''),
(1166, 'category_id=105', ''),
(1167, 'category_id=106', ''),
(1168, 'category_id=107', ''),
(1169, 'category_id=108', ''),
(1177, 'category_id=114', ''),
(1174, 'category_id=111', ''),
(1175, 'category_id=112', ''),
(1176, 'category_id=113', ''),
(1178, 'category_id=115', ''),
(1179, 'category_id=116', ''),
(1180, 'category_id=117', ''),
(1181, 'category_id=118', ''),
(1182, 'category_id=119', ''),
(1183, 'category_id=120', ''),
(1184, 'category_id=121', ''),
(1185, 'category_id=122', ''),
(1186, 'category_id=123', ''),
(1187, 'category_id=124', ''),
(1188, 'category_id=125', ''),
(1189, 'category_id=126', ''),
(1190, 'category_id=127', ''),
(1191, 'category_id=128', ''),
(1192, 'category_id=129', ''),
(1193, 'category_id=130', ''),
(1194, 'category_id=131', ''),
(1195, 'category_id=132', ''),
(1196, 'category_id=133', ''),
(1197, 'category_id=134', ''),
(1198, 'category_id=135', '');

-- --------------------------------------------------------

--
-- Структура таблицы `ma_user`
--

CREATE TABLE IF NOT EXISTS `ma_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salt` varchar(9) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `image` varchar(255) NOT NULL,
  `code` varchar(40) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `ma_user`
--

INSERT INTO `ma_user` (`user_id`, `user_group_id`, `username`, `password`, `salt`, `firstname`, `lastname`, `email`, `image`, `code`, `ip`, `status`, `date_added`) VALUES
(1, 1, 'admin', 'f4b09f368c2aae5b27d58a8c7df094e7a40593f9', 'KgNRyNiUE', 'Дмитрий', 'Шмаков', 'contact@shmakovdima.ru', 'catalog/w_3734b7ce.jpg', '', '127.0.0.1', 1, '2016-01-11 14:13:11');

-- --------------------------------------------------------

--
-- Структура таблицы `ma_user_group`
--

CREATE TABLE IF NOT EXISTS `ma_user_group` (
  `user_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL,
  PRIMARY KEY (`user_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- Дамп данных таблицы `ma_user_group`
--

INSERT INTO `ma_user_group` (`user_group_id`, `name`, `permission`) VALUES
(1, 'Administrator', '{"access":["analytics\\/google_analytics","captcha\\/basic_captcha","captcha\\/google_captcha","catalog\\/attribute","catalog\\/attribute_group","catalog\\/category","catalog\\/download","catalog\\/filter","catalog\\/information","catalog\\/manufacturer","catalog\\/option","catalog\\/product","catalog\\/recurring","catalog\\/review","common\\/column_left","common\\/filemanager","common\\/menu","common\\/profile","common\\/stats","customer\\/custom_field","customer\\/customer","customer\\/customer_group","design\\/banner","design\\/layout","extension\\/analytics","extension\\/captcha","extension\\/feed","extension\\/fraud","extension\\/installer","extension\\/modification","extension\\/module","extension\\/openbay","extension\\/payment","extension\\/shipping","extension\\/total","feed\\/google_base","feed\\/google_sitemap","feed\\/openbaypro","fraud\\/fraudlabspro","fraud\\/ip","fraud\\/maxmind","localisation\\/country","localisation\\/currency","localisation\\/geo_zone","localisation\\/language","localisation\\/length_class","localisation\\/location","localisation\\/order_status","localisation\\/return_action","localisation\\/return_reason","localisation\\/return_status","localisation\\/stock_status","localisation\\/tax_class","localisation\\/tax_rate","localisation\\/weight_class","localisation\\/zone","marketing\\/affiliate","marketing\\/contact","marketing\\/coupon","marketing\\/marketing","module\\/account","module\\/affiliate","module\\/amazon_login","module\\/amazon_pay","module\\/banner","module\\/bestseller","module\\/carousel","module\\/category","module\\/ebay_listing","module\\/featured","module\\/filter","module\\/google_hangouts","module\\/html","module\\/information","module\\/latest","module\\/pp_button","module\\/pp_login","module\\/slideshow","module\\/special","module\\/store","openbay\\/amazon","openbay\\/amazon_listing","openbay\\/amazon_product","openbay\\/amazonus","openbay\\/amazonus_listing","openbay\\/amazonus_product","openbay\\/ebay","openbay\\/ebay_profile","openbay\\/ebay_template","openbay\\/etsy","openbay\\/etsy_product","openbay\\/etsy_shipping","openbay\\/etsy_shop","payment\\/amazon_login_pay","payment\\/authorizenet_aim","payment\\/authorizenet_sim","payment\\/bank_transfer","payment\\/bluepay_hosted","payment\\/bluepay_redirect","payment\\/cheque","payment\\/cod","payment\\/firstdata","payment\\/firstdata_remote","payment\\/free_checkout","payment\\/g2apay","payment\\/globalpay","payment\\/globalpay_remote","payment\\/klarna_account","payment\\/klarna_invoice","payment\\/liqpay","payment\\/nochex","payment\\/paymate","payment\\/paypoint","payment\\/payza","payment\\/perpetual_payments","payment\\/pp_express","payment\\/pp_payflow","payment\\/pp_payflow_iframe","payment\\/pp_pro","payment\\/pp_pro_iframe","payment\\/pp_standard","payment\\/realex","payment\\/realex_remote","payment\\/sagepay_direct","payment\\/sagepay_server","payment\\/sagepay_us","payment\\/securetrading_pp","payment\\/securetrading_ws","payment\\/skrill","payment\\/twocheckout","payment\\/web_payment_software","payment\\/worldpay","report\\/affiliate","report\\/affiliate_activity","report\\/affiliate_login","report\\/customer_activity","report\\/customer_credit","report\\/customer_login","report\\/customer_online","report\\/customer_order","report\\/customer_reward","report\\/marketing","report\\/product_purchased","report\\/product_viewed","report\\/sale_coupon","report\\/sale_order","report\\/sale_return","report\\/sale_shipping","report\\/sale_tax","sale\\/order","sale\\/recurring","sale\\/return","sale\\/voucher","sale\\/voucher_theme","setting\\/setting","setting\\/store","shipping\\/auspost","shipping\\/citylink","shipping\\/fedex","shipping\\/flat","shipping\\/free","shipping\\/item","shipping\\/parcelforce_48","shipping\\/pickup","shipping\\/royal_mail","shipping\\/ups","shipping\\/usps","shipping\\/weight","tool\\/backup","tool\\/error_log","tool\\/upload","total\\/coupon","total\\/credit","total\\/handling","total\\/klarna_fee","total\\/low_order_fee","total\\/reward","total\\/shipping","total\\/sub_total","total\\/tax","total\\/total","total\\/voucher","user\\/api","user\\/user","user\\/user_permission","module\\/callme","module\\/filter","module\\/special","blog\\/article","blog\\/setting","module\\/google_hangouts","feed\\/google_base","feed\\/google_sitemap","analytics\\/google_analytics"],"modify":["analytics\\/google_analytics","captcha\\/basic_captcha","captcha\\/google_captcha","catalog\\/attribute","catalog\\/attribute_group","catalog\\/category","catalog\\/download","catalog\\/filter","catalog\\/information","catalog\\/manufacturer","catalog\\/option","catalog\\/product","catalog\\/recurring","catalog\\/review","common\\/column_left","common\\/filemanager","common\\/menu","common\\/profile","common\\/stats","customer\\/custom_field","customer\\/customer","customer\\/customer_group","design\\/banner","design\\/layout","extension\\/analytics","extension\\/captcha","extension\\/feed","extension\\/fraud","extension\\/installer","extension\\/modification","extension\\/module","extension\\/openbay","extension\\/payment","extension\\/shipping","extension\\/total","feed\\/google_base","feed\\/google_sitemap","feed\\/openbaypro","fraud\\/fraudlabspro","fraud\\/ip","fraud\\/maxmind","localisation\\/country","localisation\\/currency","localisation\\/geo_zone","localisation\\/language","localisation\\/length_class","localisation\\/location","localisation\\/order_status","localisation\\/return_action","localisation\\/return_reason","localisation\\/return_status","localisation\\/stock_status","localisation\\/tax_class","localisation\\/tax_rate","localisation\\/weight_class","localisation\\/zone","marketing\\/affiliate","marketing\\/contact","marketing\\/coupon","marketing\\/marketing","module\\/account","module\\/affiliate","module\\/amazon_login","module\\/amazon_pay","module\\/banner","module\\/bestseller","module\\/carousel","module\\/category","module\\/ebay_listing","module\\/featured","module\\/filter","module\\/google_hangouts","module\\/html","module\\/information","module\\/latest","module\\/pp_button","module\\/pp_login","module\\/slideshow","module\\/special","module\\/store","openbay\\/amazon","openbay\\/amazon_listing","openbay\\/amazon_product","openbay\\/amazonus","openbay\\/amazonus_listing","openbay\\/amazonus_product","openbay\\/ebay","openbay\\/ebay_profile","openbay\\/ebay_template","openbay\\/etsy","openbay\\/etsy_product","openbay\\/etsy_shipping","openbay\\/etsy_shop","payment\\/amazon_login_pay","payment\\/authorizenet_aim","payment\\/authorizenet_sim","payment\\/bank_transfer","payment\\/bluepay_hosted","payment\\/bluepay_redirect","payment\\/cheque","payment\\/cod","payment\\/firstdata","payment\\/firstdata_remote","payment\\/free_checkout","payment\\/g2apay","payment\\/globalpay","payment\\/globalpay_remote","payment\\/klarna_account","payment\\/klarna_invoice","payment\\/liqpay","payment\\/nochex","payment\\/paymate","payment\\/paypoint","payment\\/payza","payment\\/perpetual_payments","payment\\/pp_express","payment\\/pp_payflow","payment\\/pp_payflow_iframe","payment\\/pp_pro","payment\\/pp_pro_iframe","payment\\/pp_standard","payment\\/realex","payment\\/realex_remote","payment\\/sagepay_direct","payment\\/sagepay_server","payment\\/sagepay_us","payment\\/securetrading_pp","payment\\/securetrading_ws","payment\\/skrill","payment\\/twocheckout","payment\\/web_payment_software","payment\\/worldpay","report\\/affiliate","report\\/affiliate_activity","report\\/affiliate_login","report\\/customer_activity","report\\/customer_credit","report\\/customer_login","report\\/customer_online","report\\/customer_order","report\\/customer_reward","report\\/marketing","report\\/product_purchased","report\\/product_viewed","report\\/sale_coupon","report\\/sale_order","report\\/sale_return","report\\/sale_shipping","report\\/sale_tax","sale\\/order","sale\\/recurring","sale\\/return","sale\\/voucher","sale\\/voucher_theme","setting\\/setting","setting\\/store","shipping\\/auspost","shipping\\/citylink","shipping\\/fedex","shipping\\/flat","shipping\\/free","shipping\\/item","shipping\\/parcelforce_48","shipping\\/pickup","shipping\\/royal_mail","shipping\\/ups","shipping\\/usps","shipping\\/weight","tool\\/backup","tool\\/error_log","tool\\/upload","total\\/coupon","total\\/credit","total\\/handling","total\\/klarna_fee","total\\/low_order_fee","total\\/reward","total\\/shipping","total\\/sub_total","total\\/tax","total\\/total","total\\/voucher","user\\/api","user\\/user","user\\/user_permission","module\\/callme","module\\/filter","module\\/special","blog\\/article","blog\\/setting","module\\/google_hangouts","feed\\/google_base","feed\\/google_sitemap","analytics\\/google_analytics"]}'),
(10, 'Demonstration', '');

-- --------------------------------------------------------

--
-- Структура таблицы `ma_voucher`
--

CREATE TABLE IF NOT EXISTS `ma_voucher` (
  `voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ma_voucher_history`
--

CREATE TABLE IF NOT EXISTS `ma_voucher_history` (
  `voucher_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `ma_voucher_theme`
--

CREATE TABLE IF NOT EXISTS `ma_voucher_theme` (
  `voucher_theme_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Дамп данных таблицы `ma_voucher_theme`
--

INSERT INTO `ma_voucher_theme` (`voucher_theme_id`, `image`) VALUES
(8, 'catalog/demo/canon_eos_5d_2.jpg'),
(7, 'catalog/demo/gift-voucher-birthday.jpg'),
(6, 'catalog/demo/apple_logo.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `ma_voucher_theme_description`
--

CREATE TABLE IF NOT EXISTS `ma_voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`voucher_theme_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `ma_voucher_theme_description`
--

INSERT INTO `ma_voucher_theme_description` (`voucher_theme_id`, `language_id`, `name`) VALUES
(6, 1, 'Новый год'),
(7, 1, 'День рождения'),
(8, 1, 'Другое'),
(6, 2, 'Новый год'),
(7, 2, 'День рождения'),
(8, 2, 'Другое');

-- --------------------------------------------------------

--
-- Структура таблицы `ma_weight_class`
--

CREATE TABLE IF NOT EXISTS `ma_weight_class` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  PRIMARY KEY (`weight_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `ma_weight_class`
--

INSERT INTO `ma_weight_class` (`weight_class_id`, `value`) VALUES
(1, 1.00000000),
(2, 1000.00000000),
(5, 2.20460000),
(6, 35.27400000);

-- --------------------------------------------------------

--
-- Структура таблицы `ma_weight_class_description`
--

CREATE TABLE IF NOT EXISTS `ma_weight_class_description` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL,
  PRIMARY KEY (`weight_class_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `ma_weight_class_description`
--

INSERT INTO `ma_weight_class_description` (`weight_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Килограмм', 'кг'),
(2, 1, 'Грамм', 'г'),
(1, 2, 'Килограмм', 'кг'),
(2, 2, 'Грамм', 'г');

-- --------------------------------------------------------

--
-- Структура таблицы `ma_zone`
--

CREATE TABLE IF NOT EXISTS `ma_zone` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4232 ;

--
-- Дамп данных таблицы `ma_zone`
--

INSERT INTO `ma_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1, 1, 'Badakhshan', 'BDS', 1),
(2, 1, 'Badghis', 'BDG', 1),
(3, 1, 'Baghlan', 'BGL', 1),
(4, 1, 'Balkh', 'BAL', 1),
(5, 1, 'Bamian', 'BAM', 1),
(6, 1, 'Farah', 'FRA', 1),
(7, 1, 'Faryab', 'FYB', 1),
(8, 1, 'Ghazni', 'GHA', 1),
(9, 1, 'Ghowr', 'GHO', 1),
(10, 1, 'Helmand', 'HEL', 1),
(11, 1, 'Herat', 'HER', 1),
(12, 1, 'Jowzjan', 'JOW', 1),
(13, 1, 'Kabul', 'KAB', 1),
(14, 1, 'Kandahar', 'KAN', 1),
(15, 1, 'Kapisa', 'KAP', 1),
(16, 1, 'Khost', 'KHO', 1),
(17, 1, 'Konar', 'KNR', 1),
(18, 1, 'Kondoz', 'KDZ', 1),
(19, 1, 'Laghman', 'LAG', 1),
(20, 1, 'Lowgar', 'LOW', 1),
(21, 1, 'Nangrahar', 'NAN', 1),
(22, 1, 'Nimruz', 'NIM', 1),
(23, 1, 'Nurestan', 'NUR', 1),
(24, 1, 'Oruzgan', 'ORU', 1),
(25, 1, 'Paktia', 'PIA', 1),
(26, 1, 'Paktika', 'PKA', 1),
(27, 1, 'Parwan', 'PAR', 1),
(28, 1, 'Samangan', 'SAM', 1),
(29, 1, 'Sar-e Pol', 'SAR', 1),
(30, 1, 'Takhar', 'TAK', 1),
(31, 1, 'Wardak', 'WAR', 1),
(32, 1, 'Zabol', 'ZAB', 1),
(33, 2, 'Berat', 'BR', 1),
(34, 2, 'Bulqize', 'BU', 1),
(35, 2, 'Delvine', 'DL', 1),
(36, 2, 'Devoll', 'DV', 1),
(37, 2, 'Diber', 'DI', 1),
(38, 2, 'Durres', 'DR', 1),
(39, 2, 'Elbasan', 'EL', 1),
(40, 2, 'Kolonje', 'ER', 1),
(41, 2, 'Fier', 'FR', 1),
(42, 2, 'Gjirokaster', 'GJ', 1),
(43, 2, 'Gramsh', 'GR', 1),
(44, 2, 'Has', 'HA', 1),
(45, 2, 'Kavaje', 'KA', 1),
(46, 2, 'Kurbin', 'KB', 1),
(47, 2, 'Kucove', 'KC', 1),
(48, 2, 'Korce', 'KO', 1),
(49, 2, 'Kruje', 'KR', 1),
(50, 2, 'Kukes', 'KU', 1),
(51, 2, 'Librazhd', 'LB', 1),
(52, 2, 'Lezhe', 'LE', 1),
(53, 2, 'Lushnje', 'LU', 1),
(54, 2, 'Malesi e Madhe', 'MM', 1),
(55, 2, 'Mallakaster', 'MK', 1),
(56, 2, 'Mat', 'MT', 1),
(57, 2, 'Mirdite', 'MR', 1),
(58, 2, 'Peqin', 'PQ', 1),
(59, 2, 'Permet', 'PR', 1),
(60, 2, 'Pogradec', 'PG', 1),
(61, 2, 'Puke', 'PU', 1),
(62, 2, 'Shkoder', 'SH', 1),
(63, 2, 'Skrapar', 'SK', 1),
(64, 2, 'Sarande', 'SR', 1),
(65, 2, 'Tepelene', 'TE', 1),
(66, 2, 'Tropoje', 'TP', 1),
(67, 2, 'Tirane', 'TR', 1),
(68, 2, 'Vlore', 'VL', 1),
(69, 3, 'Adrar', 'ADR', 1),
(70, 3, 'Ain Defla', 'ADE', 1),
(71, 3, 'Ain Temouchent', 'ATE', 1),
(72, 3, 'Alger', 'ALG', 1),
(73, 3, 'Annaba', 'ANN', 1),
(74, 3, 'Batna', 'BAT', 1),
(75, 3, 'Bechar', 'BEC', 1),
(76, 3, 'Bejaia', 'BEJ', 1),
(77, 3, 'Biskra', 'BIS', 1),
(78, 3, 'Blida', 'BLI', 1),
(79, 3, 'Bordj Bou Arreridj', 'BBA', 1),
(80, 3, 'Bouira', 'BOA', 1),
(81, 3, 'Boumerdes', 'BMD', 1),
(82, 3, 'Chlef', 'CHL', 1),
(83, 3, 'Constantine', 'CON', 1),
(84, 3, 'Djelfa', 'DJE', 1),
(85, 3, 'El Bayadh', 'EBA', 1),
(86, 3, 'El Oued', 'EOU', 1),
(87, 3, 'El Tarf', 'ETA', 1),
(88, 3, 'Ghardaia', 'GHA', 1),
(89, 3, 'Guelma', 'GUE', 1),
(90, 3, 'Illizi', 'ILL', 1),
(91, 3, 'Jijel', 'JIJ', 1),
(92, 3, 'Khenchela', 'KHE', 1),
(93, 3, 'Laghouat', 'LAG', 1),
(94, 3, 'Muaskar', 'MUA', 1),
(95, 3, 'Medea', 'MED', 1),
(96, 3, 'Mila', 'MIL', 1),
(97, 3, 'Mostaganem', 'MOS', 1),
(98, 3, 'M''Sila', 'MSI', 1),
(99, 3, 'Naama', 'NAA', 1),
(100, 3, 'Oran', 'ORA', 1),
(101, 3, 'Ouargla', 'OUA', 1),
(102, 3, 'Oum el-Bouaghi', 'OEB', 1),
(103, 3, 'Relizane', 'REL', 1),
(104, 3, 'Saida', 'SAI', 1),
(105, 3, 'Setif', 'SET', 1),
(106, 3, 'Sidi Bel Abbes', 'SBA', 1),
(107, 3, 'Skikda', 'SKI', 1),
(108, 3, 'Souk Ahras', 'SAH', 1),
(109, 3, 'Tamanghasset', 'TAM', 1),
(110, 3, 'Tebessa', 'TEB', 1),
(111, 3, 'Tiaret', 'TIA', 1),
(112, 3, 'Tindouf', 'TIN', 1),
(113, 3, 'Tipaza', 'TIP', 1),
(114, 3, 'Tissemsilt', 'TIS', 1),
(115, 3, 'Tizi Ouzou', 'TOU', 1),
(116, 3, 'Tlemcen', 'TLE', 1),
(117, 4, 'Eastern', 'E', 1),
(118, 4, 'Manu''a', 'M', 1),
(119, 4, 'Rose Island', 'R', 1),
(120, 4, 'Swains Island', 'S', 1),
(121, 4, 'Western', 'W', 1),
(122, 5, 'Andorra la Vella', 'ALV', 1),
(123, 5, 'Canillo', 'CAN', 1),
(124, 5, 'Encamp', 'ENC', 1),
(125, 5, 'Escaldes-Engordany', 'ESE', 1),
(126, 5, 'La Massana', 'LMA', 1),
(127, 5, 'Ordino', 'ORD', 1),
(128, 5, 'Sant Julia de Loria', 'SJL', 1),
(129, 6, 'Bengo', 'BGO', 1),
(130, 6, 'Benguela', 'BGU', 1),
(131, 6, 'Bie', 'BIE', 1),
(132, 6, 'Cabinda', 'CAB', 1),
(133, 6, 'Cuando-Cubango', 'CCU', 1),
(134, 6, 'Cuanza Norte', 'CNO', 1),
(135, 6, 'Cuanza Sul', 'CUS', 1),
(136, 6, 'Cunene', 'CNN', 1),
(137, 6, 'Huambo', 'HUA', 1),
(138, 6, 'Huila', 'HUI', 1),
(139, 6, 'Luanda', 'LUA', 1),
(140, 6, 'Lunda Norte', 'LNO', 1),
(141, 6, 'Lunda Sul', 'LSU', 1),
(142, 6, 'Malange', 'MAL', 1),
(143, 6, 'Moxico', 'MOX', 1),
(144, 6, 'Namibe', 'NAM', 1),
(145, 6, 'Uige', 'UIG', 1),
(146, 6, 'Zaire', 'ZAI', 1),
(147, 9, 'Saint George', 'ASG', 1),
(148, 9, 'Saint John', 'ASJ', 1),
(149, 9, 'Saint Mary', 'ASM', 1),
(150, 9, 'Saint Paul', 'ASL', 1),
(151, 9, 'Saint Peter', 'ASR', 1),
(152, 9, 'Saint Philip', 'ASH', 1),
(153, 9, 'Barbuda', 'BAR', 1),
(154, 9, 'Redonda', 'RED', 1),
(155, 10, 'Antartida e Islas del Atlantico', 'AN', 1),
(156, 10, 'Buenos Aires', 'BA', 1),
(157, 10, 'Catamarca', 'CA', 1),
(158, 10, 'Chaco', 'CH', 1),
(159, 10, 'Chubut', 'CU', 1),
(160, 10, 'Cordoba', 'CO', 1),
(161, 10, 'Corrientes', 'CR', 1),
(162, 10, 'Distrito Federal', 'DF', 1),
(163, 10, 'Entre Rios', 'ER', 1),
(164, 10, 'Formosa', 'FO', 1),
(165, 10, 'Jujuy', 'JU', 1),
(166, 10, 'La Pampa', 'LP', 1),
(167, 10, 'La Rioja', 'LR', 1),
(168, 10, 'Mendoza', 'ME', 1),
(169, 10, 'Misiones', 'MI', 1),
(170, 10, 'Neuquen', 'NE', 1),
(171, 10, 'Rio Negro', 'RN', 1),
(172, 10, 'Salta', 'SA', 1),
(173, 10, 'San Juan', 'SJ', 1),
(174, 10, 'San Luis', 'SL', 1),
(175, 10, 'Santa Cruz', 'SC', 1),
(176, 10, 'Santa Fe', 'SF', 1),
(177, 10, 'Santiago del Estero', 'SD', 1),
(178, 10, 'Tierra del Fuego', 'TF', 1),
(179, 10, 'Tucuman', 'TU', 1),
(180, 11, 'Aragatsotn', 'AGT', 1),
(181, 11, 'Ararat', 'ARR', 1),
(182, 11, 'Armavir', 'ARM', 1),
(183, 11, 'Geghark''unik''', 'GEG', 1),
(184, 11, 'Kotayk''', 'KOT', 1),
(185, 11, 'Lorri', 'LOR', 1),
(186, 11, 'Shirak', 'SHI', 1),
(187, 11, 'Syunik''', 'SYU', 1),
(188, 11, 'Tavush', 'TAV', 1),
(189, 11, 'Vayots'' Dzor', 'VAY', 1),
(190, 11, 'Yerevan', 'YER', 1),
(191, 13, 'Australian Capital Territory', 'ACT', 1),
(192, 13, 'New South Wales', 'NSW', 1),
(193, 13, 'Northern Territory', 'NT', 1),
(194, 13, 'Queensland', 'QLD', 1),
(195, 13, 'South Australia', 'SA', 1),
(196, 13, 'Tasmania', 'TAS', 1),
(197, 13, 'Victoria', 'VIC', 1),
(198, 13, 'Western Australia', 'WA', 1),
(199, 14, 'Burgenland', 'BUR', 1),
(200, 14, 'Kärnten', 'KAR', 1),
(201, 14, 'Nieder&ouml;sterreich', 'NOS', 1),
(202, 14, 'Ober&ouml;sterreich', 'OOS', 1),
(203, 14, 'Salzburg', 'SAL', 1),
(204, 14, 'Steiermark', 'STE', 1),
(205, 14, 'Tirol', 'TIR', 1),
(206, 14, 'Vorarlberg', 'VOR', 1),
(207, 14, 'Wien', 'WIE', 1),
(208, 15, 'Ali Bayramli', 'AB', 1),
(209, 15, 'Abseron', 'ABS', 1),
(210, 15, 'AgcabAdi', 'AGC', 1),
(211, 15, 'Agdam', 'AGM', 1),
(212, 15, 'Agdas', 'AGS', 1),
(213, 15, 'Agstafa', 'AGA', 1),
(214, 15, 'Agsu', 'AGU', 1),
(215, 15, 'Astara', 'AST', 1),
(216, 15, 'Baki', 'BA', 1),
(217, 15, 'BabAk', 'BAB', 1),
(218, 15, 'BalakAn', 'BAL', 1),
(219, 15, 'BArdA', 'BAR', 1),
(220, 15, 'Beylaqan', 'BEY', 1),
(221, 15, 'Bilasuvar', 'BIL', 1),
(222, 15, 'Cabrayil', 'CAB', 1),
(223, 15, 'Calilabab', 'CAL', 1),
(224, 15, 'Culfa', 'CUL', 1),
(225, 15, 'Daskasan', 'DAS', 1),
(226, 15, 'Davaci', 'DAV', 1),
(227, 15, 'Fuzuli', 'FUZ', 1),
(228, 15, 'Ganca', 'GA', 1),
(229, 15, 'Gadabay', 'GAD', 1),
(230, 15, 'Goranboy', 'GOR', 1),
(231, 15, 'Goycay', 'GOY', 1),
(232, 15, 'Haciqabul', 'HAC', 1),
(233, 15, 'Imisli', 'IMI', 1),
(234, 15, 'Ismayilli', 'ISM', 1),
(235, 15, 'Kalbacar', 'KAL', 1),
(236, 15, 'Kurdamir', 'KUR', 1),
(237, 15, 'Lankaran', 'LA', 1),
(238, 15, 'Lacin', 'LAC', 1),
(239, 15, 'Lankaran', 'LAN', 1),
(240, 15, 'Lerik', 'LER', 1),
(241, 15, 'Masalli', 'MAS', 1),
(242, 15, 'Mingacevir', 'MI', 1),
(243, 15, 'Naftalan', 'NA', 1),
(244, 15, 'Neftcala', 'NEF', 1),
(245, 15, 'Oguz', 'OGU', 1),
(246, 15, 'Ordubad', 'ORD', 1),
(247, 15, 'Qabala', 'QAB', 1),
(248, 15, 'Qax', 'QAX', 1),
(249, 15, 'Qazax', 'QAZ', 1),
(250, 15, 'Qobustan', 'QOB', 1),
(251, 15, 'Quba', 'QBA', 1),
(252, 15, 'Qubadli', 'QBI', 1),
(253, 15, 'Qusar', 'QUS', 1),
(254, 15, 'Saki', 'SA', 1),
(255, 15, 'Saatli', 'SAT', 1),
(256, 15, 'Sabirabad', 'SAB', 1),
(257, 15, 'Sadarak', 'SAD', 1),
(258, 15, 'Sahbuz', 'SAH', 1),
(259, 15, 'Saki', 'SAK', 1),
(260, 15, 'Salyan', 'SAL', 1),
(261, 15, 'Sumqayit', 'SM', 1),
(262, 15, 'Samaxi', 'SMI', 1),
(263, 15, 'Samkir', 'SKR', 1),
(264, 15, 'Samux', 'SMX', 1),
(265, 15, 'Sarur', 'SAR', 1),
(266, 15, 'Siyazan', 'SIY', 1),
(267, 15, 'Susa', 'SS', 1),
(268, 15, 'Susa', 'SUS', 1),
(269, 15, 'Tartar', 'TAR', 1),
(270, 15, 'Tovuz', 'TOV', 1),
(271, 15, 'Ucar', 'UCA', 1),
(272, 15, 'Xankandi', 'XA', 1),
(273, 15, 'Xacmaz', 'XAC', 1),
(274, 15, 'Xanlar', 'XAN', 1),
(275, 15, 'Xizi', 'XIZ', 1),
(276, 15, 'Xocali', 'XCI', 1),
(277, 15, 'Xocavand', 'XVD', 1),
(278, 15, 'Yardimli', 'YAR', 1),
(279, 15, 'Yevlax', 'YEV', 1),
(280, 15, 'Zangilan', 'ZAN', 1),
(281, 15, 'Zaqatala', 'ZAQ', 1),
(282, 15, 'Zardab', 'ZAR', 1),
(283, 15, 'Naxcivan', 'NX', 1),
(284, 16, 'Acklins', 'ACK', 1),
(285, 16, 'Berry Islands', 'BER', 1),
(286, 16, 'Bimini', 'BIM', 1),
(287, 16, 'Black Point', 'BLK', 1),
(288, 16, 'Cat Island', 'CAT', 1),
(289, 16, 'Central Abaco', 'CAB', 1),
(290, 16, 'Central Andros', 'CAN', 1),
(291, 16, 'Central Eleuthera', 'CEL', 1),
(292, 16, 'City of Freeport', 'FRE', 1),
(293, 16, 'Crooked Island', 'CRO', 1),
(294, 16, 'East Grand Bahama', 'EGB', 1),
(295, 16, 'Exuma', 'EXU', 1),
(296, 16, 'Grand Cay', 'GRD', 1),
(297, 16, 'Harbour Island', 'HAR', 1),
(298, 16, 'Hope Town', 'HOP', 1),
(299, 16, 'Inagua', 'INA', 1),
(300, 16, 'Long Island', 'LNG', 1),
(301, 16, 'Mangrove Cay', 'MAN', 1),
(302, 16, 'Mayaguana', 'MAY', 1),
(303, 16, 'Moore''s Island', 'MOO', 1),
(304, 16, 'North Abaco', 'NAB', 1),
(305, 16, 'North Andros', 'NAN', 1),
(306, 16, 'North Eleuthera', 'NEL', 1),
(307, 16, 'Ragged Island', 'RAG', 1),
(308, 16, 'Rum Cay', 'RUM', 1),
(309, 16, 'San Salvador', 'SAL', 1),
(310, 16, 'South Abaco', 'SAB', 1),
(311, 16, 'South Andros', 'SAN', 1),
(312, 16, 'South Eleuthera', 'SEL', 1),
(313, 16, 'Spanish Wells', 'SWE', 1),
(314, 16, 'West Grand Bahama', 'WGB', 1),
(315, 17, 'Capital', 'CAP', 1),
(316, 17, 'Central', 'CEN', 1),
(317, 17, 'Muharraq', 'MUH', 1),
(318, 17, 'Northern', 'NOR', 1),
(319, 17, 'Southern', 'SOU', 1),
(320, 18, 'Barisal', 'BAR', 1),
(321, 18, 'Chittagong', 'CHI', 1),
(322, 18, 'Dhaka', 'DHA', 1),
(323, 18, 'Khulna', 'KHU', 1),
(324, 18, 'Rajshahi', 'RAJ', 1),
(325, 18, 'Sylhet', 'SYL', 1),
(326, 19, 'Christ Church', 'CC', 1),
(327, 19, 'Saint Andrew', 'AND', 1),
(328, 19, 'Saint George', 'GEO', 1),
(329, 19, 'Saint James', 'JAM', 1),
(330, 19, 'Saint John', 'JOH', 1),
(331, 19, 'Saint Joseph', 'JOS', 1),
(332, 19, 'Saint Lucy', 'LUC', 1),
(333, 19, 'Saint Michael', 'MIC', 1),
(334, 19, 'Saint Peter', 'PET', 1),
(335, 19, 'Saint Philip', 'PHI', 1),
(336, 19, 'Saint Thomas', 'THO', 1),
(337, 20, 'Brestskaya (Brest)', 'BR', 1),
(338, 20, 'Homyel''skaya (Homyel'')', 'HO', 1),
(339, 20, 'Horad Minsk', 'HM', 1),
(340, 20, 'Hrodzyenskaya (Hrodna)', 'HR', 1),
(341, 20, 'Mahilyowskaya (Mahilyow)', 'MA', 1),
(342, 20, 'Minskaya', 'MI', 1),
(343, 20, 'Vitsyebskaya (Vitsyebsk)', 'VI', 1),
(344, 21, 'Antwerpen', 'VAN', 1),
(345, 21, 'Brabant Wallon', 'WBR', 1),
(346, 21, 'Hainaut', 'WHT', 1),
(347, 21, 'Liège', 'WLG', 1),
(348, 21, 'Limburg', 'VLI', 1),
(349, 21, 'Luxembourg', 'WLX', 1),
(350, 21, 'Namur', 'WNA', 1),
(351, 21, 'Oost-Vlaanderen', 'VOV', 1),
(352, 21, 'Vlaams Brabant', 'VBR', 1),
(353, 21, 'West-Vlaanderen', 'VWV', 1),
(354, 22, 'Belize', 'BZ', 1),
(355, 22, 'Cayo', 'CY', 1),
(356, 22, 'Corozal', 'CR', 1),
(357, 22, 'Orange Walk', 'OW', 1),
(358, 22, 'Stann Creek', 'SC', 1),
(359, 22, 'Toledo', 'TO', 1),
(360, 23, 'Alibori', 'AL', 1),
(361, 23, 'Atakora', 'AK', 1),
(362, 23, 'Atlantique', 'AQ', 1),
(363, 23, 'Borgou', 'BO', 1),
(364, 23, 'Collines', 'CO', 1),
(365, 23, 'Donga', 'DO', 1),
(366, 23, 'Kouffo', 'KO', 1),
(367, 23, 'Littoral', 'LI', 1),
(368, 23, 'Mono', 'MO', 1),
(369, 23, 'Oueme', 'OU', 1),
(370, 23, 'Plateau', 'PL', 1),
(371, 23, 'Zou', 'ZO', 1),
(372, 24, 'Devonshire', 'DS', 1),
(373, 24, 'Hamilton City', 'HC', 1),
(374, 24, 'Hamilton', 'HA', 1),
(375, 24, 'Paget', 'PG', 1),
(376, 24, 'Pembroke', 'PB', 1),
(377, 24, 'Saint George City', 'GC', 1),
(378, 24, 'Saint George''s', 'SG', 1),
(379, 24, 'Sandys', 'SA', 1),
(380, 24, 'Smith''s', 'SM', 1),
(381, 24, 'Southampton', 'SH', 1),
(382, 24, 'Warwick', 'WA', 1),
(383, 25, 'Bumthang', 'BUM', 1),
(384, 25, 'Chukha', 'CHU', 1),
(385, 25, 'Dagana', 'DAG', 1),
(386, 25, 'Gasa', 'GAS', 1),
(387, 25, 'Haa', 'HAA', 1),
(388, 25, 'Lhuntse', 'LHU', 1),
(389, 25, 'Mongar', 'MON', 1),
(390, 25, 'Paro', 'PAR', 1),
(391, 25, 'Pemagatshel', 'PEM', 1),
(392, 25, 'Punakha', 'PUN', 1),
(393, 25, 'Samdrup Jongkhar', 'SJO', 1),
(394, 25, 'Samtse', 'SAT', 1),
(395, 25, 'Sarpang', 'SAR', 1),
(396, 25, 'Thimphu', 'THI', 1),
(397, 25, 'Trashigang', 'TRG', 1),
(398, 25, 'Trashiyangste', 'TRY', 1),
(399, 25, 'Trongsa', 'TRO', 1),
(400, 25, 'Tsirang', 'TSI', 1),
(401, 25, 'Wangdue Phodrang', 'WPH', 1),
(402, 25, 'Zhemgang', 'ZHE', 1),
(403, 26, 'Beni', 'BEN', 1),
(404, 26, 'Chuquisaca', 'CHU', 1),
(405, 26, 'Cochabamba', 'COC', 1),
(406, 26, 'La Paz', 'LPZ', 1),
(407, 26, 'Oruro', 'ORU', 1),
(408, 26, 'Pando', 'PAN', 1),
(409, 26, 'Potosi', 'POT', 1),
(410, 26, 'Santa Cruz', 'SCZ', 1),
(411, 26, 'Tarija', 'TAR', 1),
(412, 27, 'Brcko district', 'BRO', 1),
(413, 27, 'Unsko-Sanski Kanton', 'FUS', 1),
(414, 27, 'Posavski Kanton', 'FPO', 1),
(415, 27, 'Tuzlanski Kanton', 'FTU', 1),
(416, 27, 'Zenicko-Dobojski Kanton', 'FZE', 1),
(417, 27, 'Bosanskopodrinjski Kanton', 'FBP', 1),
(418, 27, 'Srednjebosanski Kanton', 'FSB', 1),
(419, 27, 'Hercegovacko-neretvanski Kanton', 'FHN', 1),
(420, 27, 'Zapadnohercegovacka Zupanija', 'FZH', 1),
(421, 27, 'Kanton Sarajevo', 'FSA', 1),
(422, 27, 'Zapadnobosanska', 'FZA', 1),
(423, 27, 'Banja Luka', 'SBL', 1),
(424, 27, 'Doboj', 'SDO', 1),
(425, 27, 'Bijeljina', 'SBI', 1),
(426, 27, 'Vlasenica', 'SVL', 1),
(427, 27, 'Sarajevo-Romanija or Sokolac', 'SSR', 1),
(428, 27, 'Foca', 'SFO', 1),
(429, 27, 'Trebinje', 'STR', 1),
(430, 28, 'Central', 'CE', 1),
(431, 28, 'Ghanzi', 'GH', 1),
(432, 28, 'Kgalagadi', 'KD', 1),
(433, 28, 'Kgatleng', 'KT', 1),
(434, 28, 'Kweneng', 'KW', 1),
(435, 28, 'Ngamiland', 'NG', 1),
(436, 28, 'North East', 'NE', 1),
(437, 28, 'North West', 'NW', 1),
(438, 28, 'South East', 'SE', 1),
(439, 28, 'Southern', 'SO', 1),
(440, 30, 'Acre', 'AC', 1),
(441, 30, 'Alagoas', 'AL', 1),
(442, 30, 'Amapá', 'AP', 1),
(443, 30, 'Amazonas', 'AM', 1),
(444, 30, 'Bahia', 'BA', 1),
(445, 30, 'Ceará', 'CE', 1),
(446, 30, 'Distrito Federal', 'DF', 1),
(447, 30, 'Espírito Santo', 'ES', 1),
(448, 30, 'Goiás', 'GO', 1),
(449, 30, 'Maranhão', 'MA', 1),
(450, 30, 'Mato Grosso', 'MT', 1),
(451, 30, 'Mato Grosso do Sul', 'MS', 1),
(452, 30, 'Minas Gerais', 'MG', 1),
(453, 30, 'Pará', 'PA', 1),
(454, 30, 'Paraíba', 'PB', 1),
(455, 30, 'Paraná', 'PR', 1),
(456, 30, 'Pernambuco', 'PE', 1),
(457, 30, 'Piauí', 'PI', 1),
(458, 30, 'Rio de Janeiro', 'RJ', 1),
(459, 30, 'Rio Grande do Norte', 'RN', 1),
(460, 30, 'Rio Grande do Sul', 'RS', 1),
(461, 30, 'Rondônia', 'RO', 1),
(462, 30, 'Roraima', 'RR', 1),
(463, 30, 'Santa Catarina', 'SC', 1),
(464, 30, 'São Paulo', 'SP', 1),
(465, 30, 'Sergipe', 'SE', 1),
(466, 30, 'Tocantins', 'TO', 1),
(467, 31, 'Peros Banhos', 'PB', 1),
(468, 31, 'Salomon Islands', 'SI', 1),
(469, 31, 'Nelsons Island', 'NI', 1),
(470, 31, 'Three Brothers', 'TB', 1),
(471, 31, 'Eagle Islands', 'EA', 1),
(472, 31, 'Danger Island', 'DI', 1),
(473, 31, 'Egmont Islands', 'EG', 1),
(474, 31, 'Diego Garcia', 'DG', 1),
(475, 32, 'Belait', 'BEL', 1),
(476, 32, 'Brunei and Muara', 'BRM', 1),
(477, 32, 'Temburong', 'TEM', 1),
(478, 32, 'Tutong', 'TUT', 1),
(479, 33, 'Blagoevgrad', '', 1),
(480, 33, 'Burgas', '', 1),
(481, 33, 'Dobrich', '', 1),
(482, 33, 'Gabrovo', '', 1),
(483, 33, 'Haskovo', '', 1),
(484, 33, 'Kardjali', '', 1),
(485, 33, 'Kyustendil', '', 1),
(486, 33, 'Lovech', '', 1),
(487, 33, 'Montana', '', 1),
(488, 33, 'Pazardjik', '', 1),
(489, 33, 'Pernik', '', 1),
(490, 33, 'Pleven', '', 1),
(491, 33, 'Plovdiv', '', 1),
(492, 33, 'Razgrad', '', 1),
(493, 33, 'Shumen', '', 1),
(494, 33, 'Silistra', '', 1),
(495, 33, 'Sliven', '', 1),
(496, 33, 'Smolyan', '', 1),
(497, 33, 'Sofia', '', 1),
(498, 33, 'Sofia - town', '', 1),
(499, 33, 'Stara Zagora', '', 1),
(500, 33, 'Targovishte', '', 1),
(501, 33, 'Varna', '', 1),
(502, 33, 'Veliko Tarnovo', '', 1),
(503, 33, 'Vidin', '', 1),
(504, 33, 'Vratza', '', 1),
(505, 33, 'Yambol', '', 1),
(506, 34, 'Bale', 'BAL', 1),
(507, 34, 'Bam', 'BAM', 1),
(508, 34, 'Banwa', 'BAN', 1),
(509, 34, 'Bazega', 'BAZ', 1),
(510, 34, 'Bougouriba', 'BOR', 1),
(511, 34, 'Boulgou', 'BLG', 1),
(512, 34, 'Boulkiemde', 'BOK', 1),
(513, 34, 'Comoe', 'COM', 1),
(514, 34, 'Ganzourgou', 'GAN', 1),
(515, 34, 'Gnagna', 'GNA', 1),
(516, 34, 'Gourma', 'GOU', 1),
(517, 34, 'Houet', 'HOU', 1),
(518, 34, 'Ioba', 'IOA', 1),
(519, 34, 'Kadiogo', 'KAD', 1),
(520, 34, 'Kenedougou', 'KEN', 1),
(521, 34, 'Komondjari', 'KOD', 1),
(522, 34, 'Kompienga', 'KOP', 1),
(523, 34, 'Kossi', 'KOS', 1),
(524, 34, 'Koulpelogo', 'KOL', 1),
(525, 34, 'Kouritenga', 'KOT', 1),
(526, 34, 'Kourweogo', 'KOW', 1),
(527, 34, 'Leraba', 'LER', 1),
(528, 34, 'Loroum', 'LOR', 1),
(529, 34, 'Mouhoun', 'MOU', 1),
(530, 34, 'Nahouri', 'NAH', 1),
(531, 34, 'Namentenga', 'NAM', 1),
(532, 34, 'Nayala', 'NAY', 1),
(533, 34, 'Noumbiel', 'NOU', 1),
(534, 34, 'Oubritenga', 'OUB', 1),
(535, 34, 'Oudalan', 'OUD', 1),
(536, 34, 'Passore', 'PAS', 1),
(537, 34, 'Poni', 'PON', 1),
(538, 34, 'Sanguie', 'SAG', 1),
(539, 34, 'Sanmatenga', 'SAM', 1),
(540, 34, 'Seno', 'SEN', 1),
(541, 34, 'Sissili', 'SIS', 1),
(542, 34, 'Soum', 'SOM', 1),
(543, 34, 'Sourou', 'SOR', 1),
(544, 34, 'Tapoa', 'TAP', 1),
(545, 34, 'Tuy', 'TUY', 1),
(546, 34, 'Yagha', 'YAG', 1),
(547, 34, 'Yatenga', 'YAT', 1),
(548, 34, 'Ziro', 'ZIR', 1),
(549, 34, 'Zondoma', 'ZOD', 1),
(550, 34, 'Zoundweogo', 'ZOW', 1),
(551, 35, 'Bubanza', 'BB', 1),
(552, 35, 'Bujumbura', 'BJ', 1),
(553, 35, 'Bururi', 'BR', 1),
(554, 35, 'Cankuzo', 'CA', 1),
(555, 35, 'Cibitoke', 'CI', 1),
(556, 35, 'Gitega', 'GI', 1),
(557, 35, 'Karuzi', 'KR', 1),
(558, 35, 'Kayanza', 'KY', 1),
(559, 35, 'Kirundo', 'KI', 1),
(560, 35, 'Makamba', 'MA', 1),
(561, 35, 'Muramvya', 'MU', 1),
(562, 35, 'Muyinga', 'MY', 1),
(563, 35, 'Mwaro', 'MW', 1),
(564, 35, 'Ngozi', 'NG', 1),
(565, 35, 'Rutana', 'RT', 1),
(566, 35, 'Ruyigi', 'RY', 1),
(567, 36, 'Phnom Penh', 'PP', 1),
(568, 36, 'Preah Seihanu (Kompong Som or Sihanoukville)', 'PS', 1),
(569, 36, 'Pailin', 'PA', 1),
(570, 36, 'Keb', 'KB', 1),
(571, 36, 'Banteay Meanchey', 'BM', 1),
(572, 36, 'Battambang', 'BA', 1),
(573, 36, 'Kampong Cham', 'KM', 1),
(574, 36, 'Kampong Chhnang', 'KN', 1),
(575, 36, 'Kampong Speu', 'KU', 1),
(576, 36, 'Kampong Som', 'KO', 1),
(577, 36, 'Kampong Thom', 'KT', 1),
(578, 36, 'Kampot', 'KP', 1),
(579, 36, 'Kandal', 'KL', 1),
(580, 36, 'Kaoh Kong', 'KK', 1),
(581, 36, 'Kratie', 'KR', 1),
(582, 36, 'Mondul Kiri', 'MK', 1),
(583, 36, 'Oddar Meancheay', 'OM', 1),
(584, 36, 'Pursat', 'PU', 1),
(585, 36, 'Preah Vihear', 'PR', 1),
(586, 36, 'Prey Veng', 'PG', 1),
(587, 36, 'Ratanak Kiri', 'RK', 1),
(588, 36, 'Siemreap', 'SI', 1),
(589, 36, 'Stung Treng', 'ST', 1),
(590, 36, 'Svay Rieng', 'SR', 1),
(591, 36, 'Takeo', 'TK', 1),
(592, 37, 'Adamawa (Adamaoua)', 'ADA', 1),
(593, 37, 'Centre', 'CEN', 1),
(594, 37, 'East (Est)', 'EST', 1),
(595, 37, 'Extreme North (Extreme-Nord)', 'EXN', 1),
(596, 37, 'Littoral', 'LIT', 1),
(597, 37, 'North (Nord)', 'NOR', 1),
(598, 37, 'Northwest (Nord-Ouest)', 'NOT', 1),
(599, 37, 'West (Ouest)', 'OUE', 1),
(600, 37, 'South (Sud)', 'SUD', 1),
(601, 37, 'Southwest (Sud-Ouest).', 'SOU', 1),
(602, 38, 'Alberta', 'AB', 1),
(603, 38, 'British Columbia', 'BC', 1),
(604, 38, 'Manitoba', 'MB', 1),
(605, 38, 'New Brunswick', 'NB', 1),
(606, 38, 'Newfoundland and Labrador', 'NL', 1),
(607, 38, 'Northwest Territories', 'NT', 1),
(608, 38, 'Nova Scotia', 'NS', 1),
(609, 38, 'Nunavut', 'NU', 1),
(610, 38, 'Ontario', 'ON', 1),
(611, 38, 'Prince Edward Island', 'PE', 1),
(612, 38, 'Qu&eacute;bec', 'QC', 1),
(613, 38, 'Saskatchewan', 'SK', 1),
(614, 38, 'Yukon Territory', 'YT', 1),
(615, 39, 'Boa Vista', 'BV', 1),
(616, 39, 'Brava', 'BR', 1),
(617, 39, 'Calheta de Sao Miguel', 'CS', 1),
(618, 39, 'Maio', 'MA', 1),
(619, 39, 'Mosteiros', 'MO', 1),
(620, 39, 'Paul', 'PA', 1),
(621, 39, 'Porto Novo', 'PN', 1),
(622, 39, 'Praia', 'PR', 1),
(623, 39, 'Ribeira Grande', 'RG', 1),
(624, 39, 'Sal', 'SL', 1),
(625, 39, 'Santa Catarina', 'CA', 1),
(626, 39, 'Santa Cruz', 'CR', 1),
(627, 39, 'Sao Domingos', 'SD', 1),
(628, 39, 'Sao Filipe', 'SF', 1),
(629, 39, 'Sao Nicolau', 'SN', 1),
(630, 39, 'Sao Vicente', 'SV', 1),
(631, 39, 'Tarrafal', 'TA', 1),
(632, 40, 'Creek', 'CR', 1),
(633, 40, 'Eastern', 'EA', 1),
(634, 40, 'Midland', 'ML', 1),
(635, 40, 'South Town', 'ST', 1),
(636, 40, 'Spot Bay', 'SP', 1),
(637, 40, 'Stake Bay', 'SK', 1),
(638, 40, 'West End', 'WD', 1),
(639, 40, 'Western', 'WN', 1),
(640, 41, 'Bamingui-Bangoran', 'BBA', 1),
(641, 41, 'Basse-Kotto', 'BKO', 1),
(642, 41, 'Haute-Kotto', 'HKO', 1),
(643, 41, 'Haut-Mbomou', 'HMB', 1),
(644, 41, 'Kemo', 'KEM', 1),
(645, 41, 'Lobaye', 'LOB', 1),
(646, 41, 'Mambere-KadeÔ', 'MKD', 1),
(647, 41, 'Mbomou', 'MBO', 1),
(648, 41, 'Nana-Mambere', 'NMM', 1),
(649, 41, 'Ombella-M''Poko', 'OMP', 1),
(650, 41, 'Ouaka', 'OUK', 1),
(651, 41, 'Ouham', 'OUH', 1),
(652, 41, 'Ouham-Pende', 'OPE', 1),
(653, 41, 'Vakaga', 'VAK', 1),
(654, 41, 'Nana-Grebizi', 'NGR', 1),
(655, 41, 'Sangha-Mbaere', 'SMB', 1),
(656, 41, 'Bangui', 'BAN', 1),
(657, 42, 'Batha', 'BA', 1),
(658, 42, 'Biltine', 'BI', 1),
(659, 42, 'Borkou-Ennedi-Tibesti', 'BE', 1),
(660, 42, 'Chari-Baguirmi', 'CB', 1),
(661, 42, 'Guera', 'GU', 1),
(662, 42, 'Kanem', 'KA', 1),
(663, 42, 'Lac', 'LA', 1),
(664, 42, 'Logone Occidental', 'LC', 1),
(665, 42, 'Logone Oriental', 'LR', 1),
(666, 42, 'Mayo-Kebbi', 'MK', 1),
(667, 42, 'Moyen-Chari', 'MC', 1),
(668, 42, 'Ouaddai', 'OU', 1),
(669, 42, 'Salamat', 'SA', 1),
(670, 42, 'Tandjile', 'TA', 1),
(671, 43, 'Aisen del General Carlos Ibanez', 'AI', 1),
(672, 43, 'Antofagasta', 'AN', 1),
(673, 43, 'Araucania', 'AR', 1),
(674, 43, 'Atacama', 'AT', 1),
(675, 43, 'Bio-Bio', 'BI', 1),
(676, 43, 'Coquimbo', 'CO', 1),
(677, 43, 'Libertador General Bernardo O''Higgins', 'LI', 1),
(678, 43, 'Los Lagos', 'LL', 1),
(679, 43, 'Magallanes y de la Antartica Chilena', 'MA', 1),
(680, 43, 'Maule', 'ML', 1),
(681, 43, 'Region Metropolitana', 'RM', 1),
(682, 43, 'Tarapaca', 'TA', 1),
(683, 43, 'Valparaiso', 'VS', 1),
(684, 44, 'Anhui', 'AN', 1),
(685, 44, 'Beijing', 'BE', 1),
(686, 44, 'Chongqing', 'CH', 1),
(687, 44, 'Fujian', 'FU', 1),
(688, 44, 'Gansu', 'GA', 1),
(689, 44, 'Guangdong', 'GU', 1),
(690, 44, 'Guangxi', 'GX', 1),
(691, 44, 'Guizhou', 'GZ', 1),
(692, 44, 'Hainan', 'HA', 1),
(693, 44, 'Hebei', 'HB', 1),
(694, 44, 'Heilongjiang', 'HL', 1),
(695, 44, 'Henan', 'HE', 1),
(696, 44, 'Hong Kong', 'HK', 1),
(697, 44, 'Hubei', 'HU', 1),
(698, 44, 'Hunan', 'HN', 1),
(699, 44, 'Inner Mongolia', 'IM', 1),
(700, 44, 'Jiangsu', 'JI', 1),
(701, 44, 'Jiangxi', 'JX', 1),
(702, 44, 'Jilin', 'JL', 1),
(703, 44, 'Liaoning', 'LI', 1),
(704, 44, 'Macau', 'MA', 1),
(705, 44, 'Ningxia', 'NI', 1),
(706, 44, 'Shaanxi', 'SH', 1),
(707, 44, 'Shandong', 'SA', 1),
(708, 44, 'Shanghai', 'SG', 1),
(709, 44, 'Shanxi', 'SX', 1),
(710, 44, 'Sichuan', 'SI', 1),
(711, 44, 'Tianjin', 'TI', 1),
(712, 44, 'Xinjiang', 'XI', 1),
(713, 44, 'Yunnan', 'YU', 1),
(714, 44, 'Zhejiang', 'ZH', 1),
(715, 46, 'Direction Island', 'D', 1),
(716, 46, 'Home Island', 'H', 1),
(717, 46, 'Horsburgh Island', 'O', 1),
(718, 46, 'South Island', 'S', 1),
(719, 46, 'West Island', 'W', 1),
(720, 47, 'Amazonas', 'AMZ', 1),
(721, 47, 'Antioquia', 'ANT', 1),
(722, 47, 'Arauca', 'ARA', 1),
(723, 47, 'Atlantico', 'ATL', 1),
(724, 47, 'Bogota D.C.', 'BDC', 1),
(725, 47, 'Bolivar', 'BOL', 1),
(726, 47, 'Boyaca', 'BOY', 1),
(727, 47, 'Caldas', 'CAL', 1),
(728, 47, 'Caqueta', 'CAQ', 1),
(729, 47, 'Casanare', 'CAS', 1),
(730, 47, 'Cauca', 'CAU', 1),
(731, 47, 'Cesar', 'CES', 1),
(732, 47, 'Choco', 'CHO', 1),
(733, 47, 'Cordoba', 'COR', 1),
(734, 47, 'Cundinamarca', 'CAM', 1),
(735, 47, 'Guainia', 'GNA', 1),
(736, 47, 'Guajira', 'GJR', 1),
(737, 47, 'Guaviare', 'GVR', 1),
(738, 47, 'Huila', 'HUI', 1),
(739, 47, 'Magdalena', 'MAG', 1),
(740, 47, 'Meta', 'MET', 1),
(741, 47, 'Narino', 'NAR', 1),
(742, 47, 'Norte de Santander', 'NDS', 1),
(743, 47, 'Putumayo', 'PUT', 1),
(744, 47, 'Quindio', 'QUI', 1),
(745, 47, 'Risaralda', 'RIS', 1),
(746, 47, 'San Andres y Providencia', 'SAP', 1),
(747, 47, 'Santander', 'SAN', 1),
(748, 47, 'Sucre', 'SUC', 1),
(749, 47, 'Tolima', 'TOL', 1),
(750, 47, 'Valle del Cauca', 'VDC', 1),
(751, 47, 'Vaupes', 'VAU', 1),
(752, 47, 'Vichada', 'VIC', 1),
(753, 48, 'Grande Comore', 'G', 1),
(754, 48, 'Anjouan', 'A', 1),
(755, 48, 'Moheli', 'M', 1),
(756, 49, 'Bouenza', 'BO', 1),
(757, 49, 'Brazzaville', 'BR', 1),
(758, 49, 'Cuvette', 'CU', 1),
(759, 49, 'Cuvette-Ouest', 'CO', 1),
(760, 49, 'Kouilou', 'KO', 1),
(761, 49, 'Lekoumou', 'LE', 1),
(762, 49, 'Likouala', 'LI', 1),
(763, 49, 'Niari', 'NI', 1),
(764, 49, 'Plateaux', 'PL', 1),
(765, 49, 'Pool', 'PO', 1),
(766, 49, 'Sangha', 'SA', 1),
(767, 50, 'Pukapuka', 'PU', 1),
(768, 50, 'Rakahanga', 'RK', 1),
(769, 50, 'Manihiki', 'MK', 1),
(770, 50, 'Penrhyn', 'PE', 1),
(771, 50, 'Nassau Island', 'NI', 1),
(772, 50, 'Surwarrow', 'SU', 1),
(773, 50, 'Palmerston', 'PA', 1),
(774, 50, 'Aitutaki', 'AI', 1),
(775, 50, 'Manuae', 'MA', 1),
(776, 50, 'Takutea', 'TA', 1),
(777, 50, 'Mitiaro', 'MT', 1),
(778, 50, 'Atiu', 'AT', 1),
(779, 50, 'Mauke', 'MU', 1),
(780, 50, 'Rarotonga', 'RR', 1),
(781, 50, 'Mangaia', 'MG', 1),
(782, 51, 'Alajuela', 'AL', 1),
(783, 51, 'Cartago', 'CA', 1),
(784, 51, 'Guanacaste', 'GU', 1),
(785, 51, 'Heredia', 'HE', 1),
(786, 51, 'Limon', 'LI', 1),
(787, 51, 'Puntarenas', 'PU', 1),
(788, 51, 'San Jose', 'SJ', 1),
(789, 52, 'Abengourou', 'ABE', 1),
(790, 52, 'Abidjan', 'ABI', 1),
(791, 52, 'Aboisso', 'ABO', 1),
(792, 52, 'Adiake', 'ADI', 1),
(793, 52, 'Adzope', 'ADZ', 1),
(794, 52, 'Agboville', 'AGB', 1),
(795, 52, 'Agnibilekrou', 'AGN', 1),
(796, 52, 'Alepe', 'ALE', 1),
(797, 52, 'Bocanda', 'BOC', 1),
(798, 52, 'Bangolo', 'BAN', 1),
(799, 52, 'Beoumi', 'BEO', 1),
(800, 52, 'Biankouma', 'BIA', 1),
(801, 52, 'Bondoukou', 'BDK', 1),
(802, 52, 'Bongouanou', 'BGN', 1),
(803, 52, 'Bouafle', 'BFL', 1),
(804, 52, 'Bouake', 'BKE', 1),
(805, 52, 'Bouna', 'BNA', 1),
(806, 52, 'Boundiali', 'BDL', 1),
(807, 52, 'Dabakala', 'DKL', 1),
(808, 52, 'Dabou', 'DBU', 1),
(809, 52, 'Daloa', 'DAL', 1),
(810, 52, 'Danane', 'DAN', 1),
(811, 52, 'Daoukro', 'DAO', 1),
(812, 52, 'Dimbokro', 'DIM', 1),
(813, 52, 'Divo', 'DIV', 1),
(814, 52, 'Duekoue', 'DUE', 1),
(815, 52, 'Ferkessedougou', 'FER', 1),
(816, 52, 'Gagnoa', 'GAG', 1),
(817, 52, 'Grand-Bassam', 'GBA', 1),
(818, 52, 'Grand-Lahou', 'GLA', 1),
(819, 52, 'Guiglo', 'GUI', 1),
(820, 52, 'Issia', 'ISS', 1),
(821, 52, 'Jacqueville', 'JAC', 1),
(822, 52, 'Katiola', 'KAT', 1),
(823, 52, 'Korhogo', 'KOR', 1),
(824, 52, 'Lakota', 'LAK', 1),
(825, 52, 'Man', 'MAN', 1),
(826, 52, 'Mankono', 'MKN', 1),
(827, 52, 'Mbahiakro', 'MBA', 1),
(828, 52, 'Odienne', 'ODI', 1),
(829, 52, 'Oume', 'OUM', 1),
(830, 52, 'Sakassou', 'SAK', 1),
(831, 52, 'San-Pedro', 'SPE', 1),
(832, 52, 'Sassandra', 'SAS', 1),
(833, 52, 'Seguela', 'SEG', 1),
(834, 52, 'Sinfra', 'SIN', 1),
(835, 52, 'Soubre', 'SOU', 1),
(836, 52, 'Tabou', 'TAB', 1),
(837, 52, 'Tanda', 'TAN', 1),
(838, 52, 'Tiebissou', 'TIE', 1),
(839, 52, 'Tingrela', 'TIN', 1),
(840, 52, 'Tiassale', 'TIA', 1),
(841, 52, 'Touba', 'TBA', 1),
(842, 52, 'Toulepleu', 'TLP', 1),
(843, 52, 'Toumodi', 'TMD', 1),
(844, 52, 'Vavoua', 'VAV', 1),
(845, 52, 'Yamoussoukro', 'YAM', 1),
(846, 52, 'Zuenoula', 'ZUE', 1),
(847, 53, 'Bjelovarsko-bilogorska', 'BB', 1),
(848, 53, 'Grad Zagreb', 'GZ', 1),
(849, 53, 'Dubrovačko-neretvanska', 'DN', 1),
(850, 53, 'Istarska', 'IS', 1),
(851, 53, 'Karlovačka', 'KA', 1),
(852, 53, 'Koprivničko-križevačka', 'KK', 1),
(853, 53, 'Krapinsko-zagorska', 'KZ', 1),
(854, 53, 'Ličko-senjska', 'LS', 1),
(855, 53, 'Međimurska', 'ME', 1),
(856, 53, 'Osječko-baranjska', 'OB', 1),
(857, 53, 'Požeško-slavonska', 'PS', 1),
(858, 53, 'Primorsko-goranska', 'PG', 1),
(859, 53, 'Šibensko-kninska', 'SK', 1),
(860, 53, 'Sisačko-moslavačka', 'SM', 1),
(861, 53, 'Brodsko-posavska', 'BP', 1),
(862, 53, 'Splitsko-dalmatinska', 'SD', 1),
(863, 53, 'Varaždinska', 'VA', 1),
(864, 53, 'Virovitičko-podravska', 'VP', 1),
(865, 53, 'Vukovarsko-srijemska', 'VS', 1),
(866, 53, 'Zadarska', 'ZA', 1),
(867, 53, 'Zagrebačka', 'ZG', 1),
(868, 54, 'Camaguey', 'CA', 1),
(869, 54, 'Ciego de Avila', 'CD', 1),
(870, 54, 'Cienfuegos', 'CI', 1),
(871, 54, 'Ciudad de La Habana', 'CH', 1),
(872, 54, 'Granma', 'GR', 1),
(873, 54, 'Guantanamo', 'GU', 1),
(874, 54, 'Holguin', 'HO', 1),
(875, 54, 'Isla de la Juventud', 'IJ', 1),
(876, 54, 'La Habana', 'LH', 1),
(877, 54, 'Las Tunas', 'LT', 1),
(878, 54, 'Matanzas', 'MA', 1),
(879, 54, 'Pinar del Rio', 'PR', 1),
(880, 54, 'Sancti Spiritus', 'SS', 1),
(881, 54, 'Santiago de Cuba', 'SC', 1),
(882, 54, 'Villa Clara', 'VC', 1),
(883, 55, 'Famagusta', 'F', 1),
(884, 55, 'Kyrenia', 'K', 1),
(885, 55, 'Larnaca', 'A', 1),
(886, 55, 'Limassol', 'I', 1),
(887, 55, 'Nicosia', 'N', 1),
(888, 55, 'Paphos', 'P', 1),
(889, 56, 'Ústecký', 'U', 1),
(890, 56, 'Jihočeský', 'C', 1),
(891, 56, 'Jihomoravský', 'B', 1),
(892, 56, 'Karlovarský', 'K', 1),
(893, 56, 'Královehradecký', 'H', 1),
(894, 56, 'Liberecký', 'L', 1),
(895, 56, 'Moravskoslezský', 'T', 1),
(896, 56, 'Olomoucký', 'M', 1),
(897, 56, 'Pardubický', 'E', 1),
(898, 56, 'Plzeňský', 'P', 1),
(899, 56, 'Praha', 'A', 1),
(900, 56, 'Středočeský', 'S', 1),
(901, 56, 'Vysočina', 'J', 1),
(902, 56, 'Zlínský', 'Z', 1),
(903, 57, 'Arhus', 'AR', 1),
(904, 57, 'Bornholm', 'BH', 1),
(905, 57, 'Copenhagen', 'CO', 1),
(906, 57, 'Faroe Islands', 'FO', 1),
(907, 57, 'Frederiksborg', 'FR', 1),
(908, 57, 'Fyn', 'FY', 1),
(909, 57, 'Kobenhavn', 'KO', 1),
(910, 57, 'Nordjylland', 'NO', 1),
(911, 57, 'Ribe', 'RI', 1),
(912, 57, 'Ringkobing', 'RK', 1),
(913, 57, 'Roskilde', 'RO', 1),
(914, 57, 'Sonderjylland', 'SO', 1),
(915, 57, 'Storstrom', 'ST', 1),
(916, 57, 'Vejle', 'VK', 1),
(917, 57, 'Vestj&aelig;lland', 'VJ', 1),
(918, 57, 'Viborg', 'VB', 1),
(919, 58, '''Ali Sabih', 'S', 1),
(920, 58, 'Dikhil', 'K', 1),
(921, 58, 'Djibouti', 'J', 1),
(922, 58, 'Obock', 'O', 1),
(923, 58, 'Tadjoura', 'T', 1),
(924, 59, 'Saint Andrew Parish', 'AND', 1),
(925, 59, 'Saint David Parish', 'DAV', 1),
(926, 59, 'Saint George Parish', 'GEO', 1),
(927, 59, 'Saint John Parish', 'JOH', 1),
(928, 59, 'Saint Joseph Parish', 'JOS', 1),
(929, 59, 'Saint Luke Parish', 'LUK', 1),
(930, 59, 'Saint Mark Parish', 'MAR', 1),
(931, 59, 'Saint Patrick Parish', 'PAT', 1),
(932, 59, 'Saint Paul Parish', 'PAU', 1),
(933, 59, 'Saint Peter Parish', 'PET', 1),
(934, 60, 'Distrito Nacional', 'DN', 1),
(935, 60, 'Azua', 'AZ', 1),
(936, 60, 'Baoruco', 'BC', 1),
(937, 60, 'Barahona', 'BH', 1),
(938, 60, 'Dajabon', 'DJ', 1),
(939, 60, 'Duarte', 'DU', 1),
(940, 60, 'Elias Pina', 'EL', 1),
(941, 60, 'El Seybo', 'SY', 1),
(942, 60, 'Espaillat', 'ET', 1),
(943, 60, 'Hato Mayor', 'HM', 1),
(944, 60, 'Independencia', 'IN', 1),
(945, 60, 'La Altagracia', 'AL', 1),
(946, 60, 'La Romana', 'RO', 1),
(947, 60, 'La Vega', 'VE', 1),
(948, 60, 'Maria Trinidad Sanchez', 'MT', 1),
(949, 60, 'Monsenor Nouel', 'MN', 1),
(950, 60, 'Monte Cristi', 'MC', 1),
(951, 60, 'Monte Plata', 'MP', 1),
(952, 60, 'Pedernales', 'PD', 1),
(953, 60, 'Peravia (Bani)', 'PR', 1),
(954, 60, 'Puerto Plata', 'PP', 1),
(955, 60, 'Salcedo', 'SL', 1),
(956, 60, 'Samana', 'SM', 1),
(957, 60, 'Sanchez Ramirez', 'SH', 1),
(958, 60, 'San Cristobal', 'SC', 1),
(959, 60, 'San Jose de Ocoa', 'JO', 1),
(960, 60, 'San Juan', 'SJ', 1),
(961, 60, 'San Pedro de Macoris', 'PM', 1),
(962, 60, 'Santiago', 'SA', 1),
(963, 60, 'Santiago Rodriguez', 'ST', 1),
(964, 60, 'Santo Domingo', 'SD', 1),
(965, 60, 'Valverde', 'VA', 1),
(966, 61, 'Aileu', 'AL', 1),
(967, 61, 'Ainaro', 'AN', 1),
(968, 61, 'Baucau', 'BA', 1),
(969, 61, 'Bobonaro', 'BO', 1),
(970, 61, 'Cova Lima', 'CO', 1),
(971, 61, 'Dili', 'DI', 1),
(972, 61, 'Ermera', 'ER', 1),
(973, 61, 'Lautem', 'LA', 1),
(974, 61, 'Liquica', 'LI', 1),
(975, 61, 'Manatuto', 'MT', 1),
(976, 61, 'Manufahi', 'MF', 1),
(977, 61, 'Oecussi', 'OE', 1),
(978, 61, 'Viqueque', 'VI', 1),
(979, 62, 'Azuay', 'AZU', 1),
(980, 62, 'Bolivar', 'BOL', 1),
(981, 62, 'Ca&ntilde;ar', 'CAN', 1),
(982, 62, 'Carchi', 'CAR', 1),
(983, 62, 'Chimborazo', 'CHI', 1),
(984, 62, 'Cotopaxi', 'COT', 1),
(985, 62, 'El Oro', 'EOR', 1),
(986, 62, 'Esmeraldas', 'ESM', 1),
(987, 62, 'Gal&aacute;pagos', 'GPS', 1),
(988, 62, 'Guayas', 'GUA', 1),
(989, 62, 'Imbabura', 'IMB', 1),
(990, 62, 'Loja', 'LOJ', 1),
(991, 62, 'Los Rios', 'LRO', 1),
(992, 62, 'Manab&iacute;', 'MAN', 1),
(993, 62, 'Morona Santiago', 'MSA', 1),
(994, 62, 'Napo', 'NAP', 1),
(995, 62, 'Orellana', 'ORE', 1),
(996, 62, 'Pastaza', 'PAS', 1),
(997, 62, 'Pichincha', 'PIC', 1),
(998, 62, 'Sucumb&iacute;os', 'SUC', 1),
(999, 62, 'Tungurahua', 'TUN', 1),
(1000, 62, 'Zamora Chinchipe', 'ZCH', 1),
(1001, 63, 'Ad Daqahliyah', 'DHY', 1),
(1002, 63, 'Al Bahr al Ahmar', 'BAM', 1),
(1003, 63, 'Al Buhayrah', 'BHY', 1),
(1004, 63, 'Al Fayyum', 'FYM', 1),
(1005, 63, 'Al Gharbiyah', 'GBY', 1),
(1006, 63, 'Al Iskandariyah', 'IDR', 1),
(1007, 63, 'Al Isma''iliyah', 'IML', 1),
(1008, 63, 'Al Jizah', 'JZH', 1),
(1009, 63, 'Al Minufiyah', 'MFY', 1),
(1010, 63, 'Al Minya', 'MNY', 1),
(1011, 63, 'Al Qahirah', 'QHR', 1),
(1012, 63, 'Al Qalyubiyah', 'QLY', 1),
(1013, 63, 'Al Wadi al Jadid', 'WJD', 1),
(1014, 63, 'Ash Sharqiyah', 'SHQ', 1),
(1015, 63, 'As Suways', 'SWY', 1),
(1016, 63, 'Aswan', 'ASW', 1),
(1017, 63, 'Asyut', 'ASY', 1),
(1018, 63, 'Bani Suwayf', 'BSW', 1),
(1019, 63, 'Bur Sa''id', 'BSD', 1),
(1020, 63, 'Dumyat', 'DMY', 1),
(1021, 63, 'Janub Sina''', 'JNS', 1),
(1022, 63, 'Kafr ash Shaykh', 'KSH', 1),
(1023, 63, 'Matruh', 'MAT', 1),
(1024, 63, 'Qina', 'QIN', 1),
(1025, 63, 'Shamal Sina''', 'SHS', 1),
(1026, 63, 'Suhaj', 'SUH', 1),
(1027, 64, 'Ahuachapan', 'AH', 1),
(1028, 64, 'Cabanas', 'CA', 1),
(1029, 64, 'Chalatenango', 'CH', 1),
(1030, 64, 'Cuscatlan', 'CU', 1),
(1031, 64, 'La Libertad', 'LB', 1),
(1032, 64, 'La Paz', 'PZ', 1),
(1033, 64, 'La Union', 'UN', 1),
(1034, 64, 'Morazan', 'MO', 1),
(1035, 64, 'San Miguel', 'SM', 1),
(1036, 64, 'San Salvador', 'SS', 1),
(1037, 64, 'San Vicente', 'SV', 1),
(1038, 64, 'Santa Ana', 'SA', 1),
(1039, 64, 'Sonsonate', 'SO', 1),
(1040, 64, 'Usulutan', 'US', 1),
(1041, 65, 'Provincia Annobon', 'AN', 1),
(1042, 65, 'Provincia Bioko Norte', 'BN', 1),
(1043, 65, 'Provincia Bioko Sur', 'BS', 1),
(1044, 65, 'Provincia Centro Sur', 'CS', 1),
(1045, 65, 'Provincia Kie-Ntem', 'KN', 1),
(1046, 65, 'Provincia Litoral', 'LI', 1),
(1047, 65, 'Provincia Wele-Nzas', 'WN', 1),
(1048, 66, 'Central (Maekel)', 'MA', 1),
(1049, 66, 'Anseba (Keren)', 'KE', 1),
(1050, 66, 'Southern Red Sea (Debub-Keih-Bahri)', 'DK', 1),
(1051, 66, 'Northern Red Sea (Semien-Keih-Bahri)', 'SK', 1),
(1052, 66, 'Southern (Debub)', 'DE', 1),
(1053, 66, 'Gash-Barka (Barentu)', 'BR', 1),
(1054, 67, 'Harjumaa (Tallinn)', 'HA', 1),
(1055, 67, 'Hiiumaa (Kardla)', 'HI', 1),
(1056, 67, 'Ida-Virumaa (Johvi)', 'IV', 1),
(1057, 67, 'Jarvamaa (Paide)', 'JA', 1),
(1058, 67, 'Jogevamaa (Jogeva)', 'JO', 1),
(1059, 67, 'Laane-Virumaa (Rakvere)', 'LV', 1),
(1060, 67, 'Laanemaa (Haapsalu)', 'LA', 1),
(1061, 67, 'Parnumaa (Parnu)', 'PA', 1),
(1062, 67, 'Polvamaa (Polva)', 'PO', 1),
(1063, 67, 'Raplamaa (Rapla)', 'RA', 1),
(1064, 67, 'Saaremaa (Kuessaare)', 'SA', 1),
(1065, 67, 'Tartumaa (Tartu)', 'TA', 1),
(1066, 67, 'Valgamaa (Valga)', 'VA', 1),
(1067, 67, 'Viljandimaa (Viljandi)', 'VI', 1),
(1068, 67, 'Vorumaa (Voru)', 'VO', 1),
(1069, 68, 'Afar', 'AF', 1),
(1070, 68, 'Amhara', 'AH', 1),
(1071, 68, 'Benishangul-Gumaz', 'BG', 1),
(1072, 68, 'Gambela', 'GB', 1),
(1073, 68, 'Hariai', 'HR', 1),
(1074, 68, 'Oromia', 'OR', 1),
(1075, 68, 'Somali', 'SM', 1),
(1076, 68, 'Southern Nations - Nationalities and Peoples Region', 'SN', 1),
(1077, 68, 'Tigray', 'TG', 1),
(1078, 68, 'Addis Ababa', 'AA', 1),
(1079, 68, 'Dire Dawa', 'DD', 1),
(1080, 71, 'Central Division', 'C', 1),
(1081, 71, 'Northern Division', 'N', 1),
(1082, 71, 'Eastern Division', 'E', 1),
(1083, 71, 'Western Division', 'W', 1),
(1084, 71, 'Rotuma', 'R', 1),
(1085, 72, 'Ahvenanmaan lääni', 'AL', 1),
(1086, 72, 'Etelä-Suomen lääni', 'ES', 1),
(1087, 72, 'Itä-Suomen lääni', 'IS', 1),
(1088, 72, 'Länsi-Suomen lääni', 'LS', 1),
(1089, 72, 'Lapin lääni', 'LA', 1),
(1090, 72, 'Oulun lääni', 'OU', 1),
(1114, 74, 'Ain', '01', 1),
(1115, 74, 'Aisne', '02', 1),
(1116, 74, 'Allier', '03', 1),
(1117, 74, 'Alpes de Haute Provence', '04', 1),
(1118, 74, 'Hautes-Alpes', '05', 1),
(1119, 74, 'Alpes Maritimes', '06', 1),
(1120, 74, 'Ard&egrave;che', '07', 1),
(1121, 74, 'Ardennes', '08', 1),
(1122, 74, 'Ari&egrave;ge', '09', 1),
(1123, 74, 'Aube', '10', 1),
(1124, 74, 'Aude', '11', 1),
(1125, 74, 'Aveyron', '12', 1),
(1126, 74, 'Bouches du Rh&ocirc;ne', '13', 1),
(1127, 74, 'Calvados', '14', 1),
(1128, 74, 'Cantal', '15', 1),
(1129, 74, 'Charente', '16', 1),
(1130, 74, 'Charente Maritime', '17', 1),
(1131, 74, 'Cher', '18', 1),
(1132, 74, 'Corr&egrave;ze', '19', 1),
(1133, 74, 'Corse du Sud', '2A', 1),
(1134, 74, 'Haute Corse', '2B', 1),
(1135, 74, 'C&ocirc;te d&#039;or', '21', 1),
(1136, 74, 'C&ocirc;tes d&#039;Armor', '22', 1),
(1137, 74, 'Creuse', '23', 1),
(1138, 74, 'Dordogne', '24', 1),
(1139, 74, 'Doubs', '25', 1),
(1140, 74, 'Dr&ocirc;me', '26', 1),
(1141, 74, 'Eure', '27', 1),
(1142, 74, 'Eure et Loir', '28', 1),
(1143, 74, 'Finist&egrave;re', '29', 1),
(1144, 74, 'Gard', '30', 1),
(1145, 74, 'Haute Garonne', '31', 1),
(1146, 74, 'Gers', '32', 1),
(1147, 74, 'Gironde', '33', 1),
(1148, 74, 'H&eacute;rault', '34', 1),
(1149, 74, 'Ille et Vilaine', '35', 1),
(1150, 74, 'Indre', '36', 1),
(1151, 74, 'Indre et Loire', '37', 1),
(1152, 74, 'Is&eacute;re', '38', 1),
(1153, 74, 'Jura', '39', 1),
(1154, 74, 'Landes', '40', 1),
(1155, 74, 'Loir et Cher', '41', 1),
(1156, 74, 'Loire', '42', 1),
(1157, 74, 'Haute Loire', '43', 1),
(1158, 74, 'Loire Atlantique', '44', 1),
(1159, 74, 'Loiret', '45', 1),
(1160, 74, 'Lot', '46', 1),
(1161, 74, 'Lot et Garonne', '47', 1),
(1162, 74, 'Loz&egrave;re', '48', 1),
(1163, 74, 'Maine et Loire', '49', 1),
(1164, 74, 'Manche', '50', 1),
(1165, 74, 'Marne', '51', 1),
(1166, 74, 'Haute Marne', '52', 1),
(1167, 74, 'Mayenne', '53', 1),
(1168, 74, 'Meurthe et Moselle', '54', 1),
(1169, 74, 'Meuse', '55', 1),
(1170, 74, 'Morbihan', '56', 1),
(1171, 74, 'Moselle', '57', 1),
(1172, 74, 'Ni&egrave;vre', '58', 1),
(1173, 74, 'Nord', '59', 1),
(1174, 74, 'Oise', '60', 1),
(1175, 74, 'Orne', '61', 1),
(1176, 74, 'Pas de Calais', '62', 1),
(1177, 74, 'Puy de D&ocirc;me', '63', 1),
(1178, 74, 'Pyr&eacute;n&eacute;es Atlantiques', '64', 1),
(1179, 74, 'Hautes Pyr&eacute;n&eacute;es', '65', 1),
(1180, 74, 'Pyr&eacute;n&eacute;es Orientales', '66', 1),
(1181, 74, 'Bas Rhin', '67', 1),
(1182, 74, 'Haut Rhin', '68', 1),
(1183, 74, 'Rh&ocirc;ne', '69', 1),
(1184, 74, 'Haute Sa&ocirc;ne', '70', 1),
(1185, 74, 'Sa&ocirc;ne et Loire', '71', 1),
(1186, 74, 'Sarthe', '72', 1),
(1187, 74, 'Savoie', '73', 1),
(1188, 74, 'Haute Savoie', '74', 1),
(1189, 74, 'Paris', '75', 1),
(1190, 74, 'Seine Maritime', '76', 1),
(1191, 74, 'Seine et Marne', '77', 1),
(1192, 74, 'Yvelines', '78', 1),
(1193, 74, 'Deux S&egrave;vres', '79', 1),
(1194, 74, 'Somme', '80', 1),
(1195, 74, 'Tarn', '81', 1),
(1196, 74, 'Tarn et Garonne', '82', 1),
(1197, 74, 'Var', '83', 1),
(1198, 74, 'Vaucluse', '84', 1),
(1199, 74, 'Vend&eacute;e', '85', 1),
(1200, 74, 'Vienne', '86', 1),
(1201, 74, 'Haute Vienne', '87', 1),
(1202, 74, 'Vosges', '88', 1),
(1203, 74, 'Yonne', '89', 1),
(1204, 74, 'Territoire de Belfort', '90', 1),
(1205, 74, 'Essonne', '91', 1),
(1206, 74, 'Hauts de Seine', '92', 1),
(1207, 74, 'Seine St-Denis', '93', 1),
(1208, 74, 'Val de Marne', '94', 1),
(1209, 74, 'Val d''Oise', '95', 1),
(1210, 76, 'Archipel des Marquises', 'M', 1),
(1211, 76, 'Archipel des Tuamotu', 'T', 1),
(1212, 76, 'Archipel des Tubuai', 'I', 1),
(1213, 76, 'Iles du Vent', 'V', 1),
(1214, 76, 'Iles Sous-le-Vent', 'S', 1),
(1215, 77, 'Iles Crozet', 'C', 1),
(1216, 77, 'Iles Kerguelen', 'K', 1),
(1217, 77, 'Ile Amsterdam', 'A', 1),
(1218, 77, 'Ile Saint-Paul', 'P', 1),
(1219, 77, 'Adelie Land', 'D', 1),
(1220, 78, 'Estuaire', 'ES', 1),
(1221, 78, 'Haut-Ogooue', 'HO', 1),
(1222, 78, 'Moyen-Ogooue', 'MO', 1),
(1223, 78, 'Ngounie', 'NG', 1),
(1224, 78, 'Nyanga', 'NY', 1),
(1225, 78, 'Ogooue-Ivindo', 'OI', 1),
(1226, 78, 'Ogooue-Lolo', 'OL', 1),
(1227, 78, 'Ogooue-Maritime', 'OM', 1),
(1228, 78, 'Woleu-Ntem', 'WN', 1),
(1229, 79, 'Banjul', 'BJ', 1),
(1230, 79, 'Basse', 'BS', 1),
(1231, 79, 'Brikama', 'BR', 1),
(1232, 79, 'Janjangbure', 'JA', 1),
(1233, 79, 'Kanifeng', 'KA', 1),
(1234, 79, 'Kerewan', 'KE', 1),
(1235, 79, 'Kuntaur', 'KU', 1),
(1236, 79, 'Mansakonko', 'MA', 1),
(1237, 79, 'Lower River', 'LR', 1),
(1238, 79, 'Central River', 'CR', 1),
(1239, 79, 'North Bank', 'NB', 1),
(1240, 79, 'Upper River', 'UR', 1),
(1241, 79, 'Western', 'WE', 1),
(1242, 80, 'Abkhazia', 'AB', 1),
(1243, 80, 'Ajaria', 'AJ', 1),
(1244, 80, 'Tbilisi', 'TB', 1),
(1245, 80, 'Guria', 'GU', 1),
(1246, 80, 'Imereti', 'IM', 1),
(1247, 80, 'Kakheti', 'KA', 1),
(1248, 80, 'Kvemo Kartli', 'KK', 1),
(1249, 80, 'Mtskheta-Mtianeti', 'MM', 1),
(1250, 80, 'Racha Lechkhumi and Kvemo Svanet', 'RL', 1),
(1251, 80, 'Samegrelo-Zemo Svaneti', 'SZ', 1),
(1252, 80, 'Samtskhe-Javakheti', 'SJ', 1),
(1253, 80, 'Shida Kartli', 'SK', 1),
(1254, 81, 'Baden-W&uuml;rttemberg', 'BAW', 1),
(1255, 81, 'Bayern', 'BAY', 1),
(1256, 81, 'Berlin', 'BER', 1),
(1257, 81, 'Brandenburg', 'BRG', 1),
(1258, 81, 'Bremen', 'BRE', 1),
(1259, 81, 'Hamburg', 'HAM', 1),
(1260, 81, 'Hessen', 'HES', 1),
(1261, 81, 'Mecklenburg-Vorpommern', 'MEC', 1),
(1262, 81, 'Niedersachsen', 'NDS', 1),
(1263, 81, 'Nordrhein-Westfalen', 'NRW', 1),
(1264, 81, 'Rheinland-Pfalz', 'RHE', 1),
(1265, 81, 'Saarland', 'SAR', 1),
(1266, 81, 'Sachsen', 'SAS', 1),
(1267, 81, 'Sachsen-Anhalt', 'SAC', 1),
(1268, 81, 'Schleswig-Holstein', 'SCN', 1),
(1269, 81, 'Th&uuml;ringen', 'THE', 1),
(1270, 82, 'Ashanti Region', 'AS', 1),
(1271, 82, 'Brong-Ahafo Region', 'BA', 1),
(1272, 82, 'Central Region', 'CE', 1),
(1273, 82, 'Eastern Region', 'EA', 1),
(1274, 82, 'Greater Accra Region', 'GA', 1),
(1275, 82, 'Northern Region', 'NO', 1),
(1276, 82, 'Upper East Region', 'UE', 1),
(1277, 82, 'Upper West Region', 'UW', 1),
(1278, 82, 'Volta Region', 'VO', 1),
(1279, 82, 'Western Region', 'WE', 1),
(1280, 84, 'Attica', 'AT', 1),
(1281, 84, 'Central Greece', 'CN', 1),
(1282, 84, 'Central Macedonia', 'CM', 1),
(1283, 84, 'Crete', 'CR', 1),
(1284, 84, 'East Macedonia and Thrace', 'EM', 1),
(1285, 84, 'Epirus', 'EP', 1),
(1286, 84, 'Ionian Islands', 'II', 1),
(1287, 84, 'North Aegean', 'NA', 1),
(1288, 84, 'Peloponnesos', 'PP', 1),
(1289, 84, 'South Aegean', 'SA', 1),
(1290, 84, 'Thessaly', 'TH', 1),
(1291, 84, 'West Greece', 'WG', 1),
(1292, 84, 'West Macedonia', 'WM', 1),
(1293, 85, 'Avannaa', 'A', 1),
(1294, 85, 'Tunu', 'T', 1),
(1295, 85, 'Kitaa', 'K', 1),
(1296, 86, 'Saint Andrew', 'A', 1),
(1297, 86, 'Saint David', 'D', 1),
(1298, 86, 'Saint George', 'G', 1),
(1299, 86, 'Saint John', 'J', 1),
(1300, 86, 'Saint Mark', 'M', 1),
(1301, 86, 'Saint Patrick', 'P', 1),
(1302, 86, 'Carriacou', 'C', 1),
(1303, 86, 'Petit Martinique', 'Q', 1),
(1304, 89, 'Alta Verapaz', 'AV', 1),
(1305, 89, 'Baja Verapaz', 'BV', 1),
(1306, 89, 'Chimaltenango', 'CM', 1),
(1307, 89, 'Chiquimula', 'CQ', 1),
(1308, 89, 'El Peten', 'PE', 1),
(1309, 89, 'El Progreso', 'PR', 1),
(1310, 89, 'El Quiche', 'QC', 1),
(1311, 89, 'Escuintla', 'ES', 1),
(1312, 89, 'Guatemala', 'GU', 1),
(1313, 89, 'Huehuetenango', 'HU', 1),
(1314, 89, 'Izabal', 'IZ', 1),
(1315, 89, 'Jalapa', 'JA', 1),
(1316, 89, 'Jutiapa', 'JU', 1),
(1317, 89, 'Quetzaltenango', 'QZ', 1),
(1318, 89, 'Retalhuleu', 'RE', 1),
(1319, 89, 'Sacatepequez', 'ST', 1),
(1320, 89, 'San Marcos', 'SM', 1),
(1321, 89, 'Santa Rosa', 'SR', 1),
(1322, 89, 'Solola', 'SO', 1),
(1323, 89, 'Suchitepequez', 'SU', 1),
(1324, 89, 'Totonicapan', 'TO', 1),
(1325, 89, 'Zacapa', 'ZA', 1),
(1326, 90, 'Conakry', 'CNK', 1),
(1327, 90, 'Beyla', 'BYL', 1),
(1328, 90, 'Boffa', 'BFA', 1),
(1329, 90, 'Boke', 'BOK', 1),
(1330, 90, 'Coyah', 'COY', 1),
(1331, 90, 'Dabola', 'DBL', 1),
(1332, 90, 'Dalaba', 'DLB', 1),
(1333, 90, 'Dinguiraye', 'DGR', 1),
(1334, 90, 'Dubreka', 'DBR', 1),
(1335, 90, 'Faranah', 'FRN', 1),
(1336, 90, 'Forecariah', 'FRC', 1),
(1337, 90, 'Fria', 'FRI', 1),
(1338, 90, 'Gaoual', 'GAO', 1),
(1339, 90, 'Gueckedou', 'GCD', 1),
(1340, 90, 'Kankan', 'KNK', 1),
(1341, 90, 'Kerouane', 'KRN', 1),
(1342, 90, 'Kindia', 'KND', 1),
(1343, 90, 'Kissidougou', 'KSD', 1),
(1344, 90, 'Koubia', 'KBA', 1),
(1345, 90, 'Koundara', 'KDA', 1),
(1346, 90, 'Kouroussa', 'KRA', 1),
(1347, 90, 'Labe', 'LAB', 1),
(1348, 90, 'Lelouma', 'LLM', 1),
(1349, 90, 'Lola', 'LOL', 1),
(1350, 90, 'Macenta', 'MCT', 1),
(1351, 90, 'Mali', 'MAL', 1),
(1352, 90, 'Mamou', 'MAM', 1),
(1353, 90, 'Mandiana', 'MAN', 1),
(1354, 90, 'Nzerekore', 'NZR', 1),
(1355, 90, 'Pita', 'PIT', 1),
(1356, 90, 'Siguiri', 'SIG', 1),
(1357, 90, 'Telimele', 'TLM', 1),
(1358, 90, 'Tougue', 'TOG', 1),
(1359, 90, 'Yomou', 'YOM', 1),
(1360, 91, 'Bafata Region', 'BF', 1),
(1361, 91, 'Biombo Region', 'BB', 1),
(1362, 91, 'Bissau Region', 'BS', 1),
(1363, 91, 'Bolama Region', 'BL', 1),
(1364, 91, 'Cacheu Region', 'CA', 1),
(1365, 91, 'Gabu Region', 'GA', 1),
(1366, 91, 'Oio Region', 'OI', 1),
(1367, 91, 'Quinara Region', 'QU', 1),
(1368, 91, 'Tombali Region', 'TO', 1),
(1369, 92, 'Barima-Waini', 'BW', 1),
(1370, 92, 'Cuyuni-Mazaruni', 'CM', 1),
(1371, 92, 'Demerara-Mahaica', 'DM', 1),
(1372, 92, 'East Berbice-Corentyne', 'EC', 1),
(1373, 92, 'Essequibo Islands-West Demerara', 'EW', 1),
(1374, 92, 'Mahaica-Berbice', 'MB', 1),
(1375, 92, 'Pomeroon-Supenaam', 'PM', 1),
(1376, 92, 'Potaro-Siparuni', 'PI', 1),
(1377, 92, 'Upper Demerara-Berbice', 'UD', 1),
(1378, 92, 'Upper Takutu-Upper Essequibo', 'UT', 1),
(1379, 93, 'Artibonite', 'AR', 1),
(1380, 93, 'Centre', 'CE', 1),
(1381, 93, 'Grand''Anse', 'GA', 1),
(1382, 93, 'Nord', 'ND', 1),
(1383, 93, 'Nord-Est', 'NE', 1),
(1384, 93, 'Nord-Ouest', 'NO', 1),
(1385, 93, 'Ouest', 'OU', 1),
(1386, 93, 'Sud', 'SD', 1),
(1387, 93, 'Sud-Est', 'SE', 1),
(1388, 94, 'Flat Island', 'F', 1),
(1389, 94, 'McDonald Island', 'M', 1),
(1390, 94, 'Shag Island', 'S', 1),
(1391, 94, 'Heard Island', 'H', 1),
(1392, 95, 'Atlantida', 'AT', 1),
(1393, 95, 'Choluteca', 'CH', 1),
(1394, 95, 'Colon', 'CL', 1),
(1395, 95, 'Comayagua', 'CM', 1),
(1396, 95, 'Copan', 'CP', 1),
(1397, 95, 'Cortes', 'CR', 1),
(1398, 95, 'El Paraiso', 'PA', 1),
(1399, 95, 'Francisco Morazan', 'FM', 1),
(1400, 95, 'Gracias a Dios', 'GD', 1),
(1401, 95, 'Intibuca', 'IN', 1),
(1402, 95, 'Islas de la Bahia (Bay Islands)', 'IB', 1),
(1403, 95, 'La Paz', 'PZ', 1),
(1404, 95, 'Lempira', 'LE', 1),
(1405, 95, 'Ocotepeque', 'OC', 1),
(1406, 95, 'Olancho', 'OL', 1),
(1407, 95, 'Santa Barbara', 'SB', 1),
(1408, 95, 'Valle', 'VA', 1),
(1409, 95, 'Yoro', 'YO', 1),
(1410, 96, 'Central and Western Hong Kong Island', 'HCW', 1),
(1411, 96, 'Eastern Hong Kong Island', 'HEA', 1),
(1412, 96, 'Southern Hong Kong Island', 'HSO', 1),
(1413, 96, 'Wan Chai Hong Kong Island', 'HWC', 1),
(1414, 96, 'Kowloon City Kowloon', 'KKC', 1),
(1415, 96, 'Kwun Tong Kowloon', 'KKT', 1),
(1416, 96, 'Sham Shui Po Kowloon', 'KSS', 1),
(1417, 96, 'Wong Tai Sin Kowloon', 'KWT', 1),
(1418, 96, 'Yau Tsim Mong Kowloon', 'KYT', 1),
(1419, 96, 'Islands New Territories', 'NIS', 1),
(1420, 96, 'Kwai Tsing New Territories', 'NKT', 1),
(1421, 96, 'North New Territories', 'NNO', 1),
(1422, 96, 'Sai Kung New Territories', 'NSK', 1),
(1423, 96, 'Sha Tin New Territories', 'NST', 1),
(1424, 96, 'Tai Po New Territories', 'NTP', 1),
(1425, 96, 'Tsuen Wan New Territories', 'NTW', 1),
(1426, 96, 'Tuen Mun New Territories', 'NTM', 1),
(1427, 96, 'Yuen Long New Territories', 'NYL', 1),
(1467, 98, 'Austurland', 'AL', 1),
(1468, 98, 'Hofuoborgarsvaeoi', 'HF', 1),
(1469, 98, 'Norourland eystra', 'NE', 1),
(1470, 98, 'Norourland vestra', 'NV', 1),
(1471, 98, 'Suourland', 'SL', 1),
(1472, 98, 'Suournes', 'SN', 1),
(1473, 98, 'Vestfiroir', 'VF', 1),
(1474, 98, 'Vesturland', 'VL', 1),
(1475, 99, 'Andaman and Nicobar Islands', 'AN', 1),
(1476, 99, 'Andhra Pradesh', 'AP', 1),
(1477, 99, 'Arunachal Pradesh', 'AR', 1),
(1478, 99, 'Assam', 'AS', 1),
(1479, 99, 'Bihar', 'BI', 1),
(1480, 99, 'Chandigarh', 'CH', 1),
(1481, 99, 'Dadra and Nagar Haveli', 'DA', 1),
(1482, 99, 'Daman and Diu', 'DM', 1),
(1483, 99, 'Delhi', 'DE', 1),
(1484, 99, 'Goa', 'GO', 1),
(1485, 99, 'Gujarat', 'GU', 1),
(1486, 99, 'Haryana', 'HA', 1),
(1487, 99, 'Himachal Pradesh', 'HP', 1),
(1488, 99, 'Jammu and Kashmir', 'JA', 1),
(1489, 99, 'Karnataka', 'KA', 1),
(1490, 99, 'Kerala', 'KE', 1),
(1491, 99, 'Lakshadweep Islands', 'LI', 1),
(1492, 99, 'Madhya Pradesh', 'MP', 1),
(1493, 99, 'Maharashtra', 'MA', 1),
(1494, 99, 'Manipur', 'MN', 1),
(1495, 99, 'Meghalaya', 'ME', 1),
(1496, 99, 'Mizoram', 'MI', 1),
(1497, 99, 'Nagaland', 'NA', 1),
(1498, 99, 'Orissa', 'OR', 1),
(1499, 99, 'Puducherry', 'PO', 1),
(1500, 99, 'Punjab', 'PU', 1),
(1501, 99, 'Rajasthan', 'RA', 1),
(1502, 99, 'Sikkim', 'SI', 1),
(1503, 99, 'Tamil Nadu', 'TN', 1),
(1504, 99, 'Tripura', 'TR', 1),
(1505, 99, 'Uttar Pradesh', 'UP', 1),
(1506, 99, 'West Bengal', 'WB', 1),
(1507, 100, 'Aceh', 'AC', 1),
(1508, 100, 'Bali', 'BA', 1),
(1509, 100, 'Banten', 'BT', 1),
(1510, 100, 'Bengkulu', 'BE', 1),
(1511, 100, 'BoDeTaBek', 'BD', 1),
(1512, 100, 'Gorontalo', 'GO', 1),
(1513, 100, 'Jakarta Raya', 'JK', 1),
(1514, 100, 'Jambi', 'JA', 1),
(1515, 100, 'Jawa Barat', 'JB', 1),
(1516, 100, 'Jawa Tengah', 'JT', 1),
(1517, 100, 'Jawa Timur', 'JI', 1),
(1518, 100, 'Kalimantan Barat', 'KB', 1),
(1519, 100, 'Kalimantan Selatan', 'KS', 1),
(1520, 100, 'Kalimantan Tengah', 'KT', 1),
(1521, 100, 'Kalimantan Timur', 'KI', 1),
(1522, 100, 'Kepulauan Bangka Belitung', 'BB', 1),
(1523, 100, 'Lampung', 'LA', 1),
(1524, 100, 'Maluku', 'MA', 1),
(1525, 100, 'Maluku Utara', 'MU', 1),
(1526, 100, 'Nusa Tenggara Barat', 'NB', 1),
(1527, 100, 'Nusa Tenggara Timur', 'NT', 1),
(1528, 100, 'Papua', 'PA', 1),
(1529, 100, 'Riau', 'RI', 1),
(1530, 100, 'Sulawesi Selatan', 'SN', 1),
(1531, 100, 'Sulawesi Tengah', 'ST', 1),
(1532, 100, 'Sulawesi Tenggara', 'SG', 1),
(1533, 100, 'Sulawesi Utara', 'SA', 1),
(1534, 100, 'Sumatera Barat', 'SB', 1),
(1535, 100, 'Sumatera Selatan', 'SS', 1),
(1536, 100, 'Sumatera Utara', 'SU', 1),
(1537, 100, 'Yogyakarta', 'YO', 1),
(1538, 101, 'Tehran', 'TEH', 1),
(1539, 101, 'Qom', 'QOM', 1),
(1540, 101, 'Markazi', 'MKZ', 1),
(1541, 101, 'Qazvin', 'QAZ', 1),
(1542, 101, 'Gilan', 'GIL', 1),
(1543, 101, 'Ardabil', 'ARD', 1),
(1544, 101, 'Zanjan', 'ZAN', 1),
(1545, 101, 'East Azarbaijan', 'EAZ', 1),
(1546, 101, 'West Azarbaijan', 'WEZ', 1),
(1547, 101, 'Kurdistan', 'KRD', 1),
(1548, 101, 'Hamadan', 'HMD', 1),
(1549, 101, 'Kermanshah', 'KRM', 1),
(1550, 101, 'Ilam', 'ILM', 1),
(1551, 101, 'Lorestan', 'LRS', 1),
(1552, 101, 'Khuzestan', 'KZT', 1),
(1553, 101, 'Chahar Mahaal and Bakhtiari', 'CMB', 1),
(1554, 101, 'Kohkiluyeh and Buyer Ahmad', 'KBA', 1),
(1555, 101, 'Bushehr', 'BSH', 1),
(1556, 101, 'Fars', 'FAR', 1),
(1557, 101, 'Hormozgan', 'HRM', 1),
(1558, 101, 'Sistan and Baluchistan', 'SBL', 1),
(1559, 101, 'Kerman', 'KRB', 1),
(1560, 101, 'Yazd', 'YZD', 1),
(1561, 101, 'Esfahan', 'EFH', 1),
(1562, 101, 'Semnan', 'SMN', 1),
(1563, 101, 'Mazandaran', 'MZD', 1),
(1564, 101, 'Golestan', 'GLS', 1),
(1565, 101, 'North Khorasan', 'NKH', 1),
(1566, 101, 'Razavi Khorasan', 'RKH', 1),
(1567, 101, 'South Khorasan', 'SKH', 1),
(1568, 102, 'Baghdad', 'BD', 1),
(1569, 102, 'Salah ad Din', 'SD', 1),
(1570, 102, 'Diyala', 'DY', 1),
(1571, 102, 'Wasit', 'WS', 1),
(1572, 102, 'Maysan', 'MY', 1),
(1573, 102, 'Al Basrah', 'BA', 1),
(1574, 102, 'Dhi Qar', 'DQ', 1),
(1575, 102, 'Al Muthanna', 'MU', 1),
(1576, 102, 'Al Qadisyah', 'QA', 1),
(1577, 102, 'Babil', 'BB', 1),
(1578, 102, 'Al Karbala', 'KB', 1),
(1579, 102, 'An Najaf', 'NJ', 1),
(1580, 102, 'Al Anbar', 'AB', 1),
(1581, 102, 'Ninawa', 'NN', 1),
(1582, 102, 'Dahuk', 'DH', 1),
(1583, 102, 'Arbil', 'AL', 1),
(1584, 102, 'At Ta''mim', 'TM', 1),
(1585, 102, 'As Sulaymaniyah', 'SL', 1),
(1586, 103, 'Carlow', 'CA', 1),
(1587, 103, 'Cavan', 'CV', 1),
(1588, 103, 'Clare', 'CL', 1),
(1589, 103, 'Cork', 'CO', 1),
(1590, 103, 'Donegal', 'DO', 1),
(1591, 103, 'Dublin', 'DU', 1),
(1592, 103, 'Galway', 'GA', 1),
(1593, 103, 'Kerry', 'KE', 1),
(1594, 103, 'Kildare', 'KI', 1);
INSERT INTO `ma_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1595, 103, 'Kilkenny', 'KL', 1),
(1596, 103, 'Laois', 'LA', 1),
(1597, 103, 'Leitrim', 'LE', 1),
(1598, 103, 'Limerick', 'LI', 1),
(1599, 103, 'Longford', 'LO', 1),
(1600, 103, 'Louth', 'LU', 1),
(1601, 103, 'Mayo', 'MA', 1),
(1602, 103, 'Meath', 'ME', 1),
(1603, 103, 'Monaghan', 'MO', 1),
(1604, 103, 'Offaly', 'OF', 1),
(1605, 103, 'Roscommon', 'RO', 1),
(1606, 103, 'Sligo', 'SL', 1),
(1607, 103, 'Tipperary', 'TI', 1),
(1608, 103, 'Waterford', 'WA', 1),
(1609, 103, 'Westmeath', 'WE', 1),
(1610, 103, 'Wexford', 'WX', 1),
(1611, 103, 'Wicklow', 'WI', 1),
(1612, 104, 'Be''er Sheva', 'BS', 1),
(1613, 104, 'Bika''at Hayarden', 'BH', 1),
(1614, 104, 'Eilat and Arava', 'EA', 1),
(1615, 104, 'Galil', 'GA', 1),
(1616, 104, 'Haifa', 'HA', 1),
(1617, 104, 'Jehuda Mountains', 'JM', 1),
(1618, 104, 'Jerusalem', 'JE', 1),
(1619, 104, 'Negev', 'NE', 1),
(1620, 104, 'Semaria', 'SE', 1),
(1621, 104, 'Sharon', 'SH', 1),
(1622, 104, 'Tel Aviv (Gosh Dan)', 'TA', 1),
(3860, 105, 'Caltanissetta', 'CL', 1),
(3842, 105, 'Agrigento', 'AG', 1),
(3843, 105, 'Alessandria', 'AL', 1),
(3844, 105, 'Ancona', 'AN', 1),
(3845, 105, 'Aosta', 'AO', 1),
(3846, 105, 'Arezzo', 'AR', 1),
(3847, 105, 'Ascoli Piceno', 'AP', 1),
(3848, 105, 'Asti', 'AT', 1),
(3849, 105, 'Avellino', 'AV', 1),
(3850, 105, 'Bari', 'BA', 1),
(3851, 105, 'Belluno', 'BL', 1),
(3852, 105, 'Benevento', 'BN', 1),
(3853, 105, 'Bergamo', 'BG', 1),
(3854, 105, 'Biella', 'BI', 1),
(3855, 105, 'Bologna', 'BO', 1),
(3856, 105, 'Bolzano', 'BZ', 1),
(3857, 105, 'Brescia', 'BS', 1),
(3858, 105, 'Brindisi', 'BR', 1),
(3859, 105, 'Cagliari', 'CA', 1),
(1643, 106, 'Clarendon Parish', 'CLA', 1),
(1644, 106, 'Hanover Parish', 'HAN', 1),
(1645, 106, 'Kingston Parish', 'KIN', 1),
(1646, 106, 'Manchester Parish', 'MAN', 1),
(1647, 106, 'Portland Parish', 'POR', 1),
(1648, 106, 'Saint Andrew Parish', 'AND', 1),
(1649, 106, 'Saint Ann Parish', 'ANN', 1),
(1650, 106, 'Saint Catherine Parish', 'CAT', 1),
(1651, 106, 'Saint Elizabeth Parish', 'ELI', 1),
(1652, 106, 'Saint James Parish', 'JAM', 1),
(1653, 106, 'Saint Mary Parish', 'MAR', 1),
(1654, 106, 'Saint Thomas Parish', 'THO', 1),
(1655, 106, 'Trelawny Parish', 'TRL', 1),
(1656, 106, 'Westmoreland Parish', 'WML', 1),
(1657, 107, 'Aichi', 'AI', 1),
(1658, 107, 'Akita', 'AK', 1),
(1659, 107, 'Aomori', 'AO', 1),
(1660, 107, 'Chiba', 'CH', 1),
(1661, 107, 'Ehime', 'EH', 1),
(1662, 107, 'Fukui', 'FK', 1),
(1663, 107, 'Fukuoka', 'FU', 1),
(1664, 107, 'Fukushima', 'FS', 1),
(1665, 107, 'Gifu', 'GI', 1),
(1666, 107, 'Gumma', 'GU', 1),
(1667, 107, 'Hiroshima', 'HI', 1),
(1668, 107, 'Hokkaido', 'HO', 1),
(1669, 107, 'Hyogo', 'HY', 1),
(1670, 107, 'Ibaraki', 'IB', 1),
(1671, 107, 'Ishikawa', 'IS', 1),
(1672, 107, 'Iwate', 'IW', 1),
(1673, 107, 'Kagawa', 'KA', 1),
(1674, 107, 'Kagoshima', 'KG', 1),
(1675, 107, 'Kanagawa', 'KN', 1),
(1676, 107, 'Kochi', 'KO', 1),
(1677, 107, 'Kumamoto', 'KU', 1),
(1678, 107, 'Kyoto', 'KY', 1),
(1679, 107, 'Mie', 'MI', 1),
(1680, 107, 'Miyagi', 'MY', 1),
(1681, 107, 'Miyazaki', 'MZ', 1),
(1682, 107, 'Nagano', 'NA', 1),
(1683, 107, 'Nagasaki', 'NG', 1),
(1684, 107, 'Nara', 'NR', 1),
(1685, 107, 'Niigata', 'NI', 1),
(1686, 107, 'Oita', 'OI', 1),
(1687, 107, 'Okayama', 'OK', 1),
(1688, 107, 'Okinawa', 'ON', 1),
(1689, 107, 'Osaka', 'OS', 1),
(1690, 107, 'Saga', 'SA', 1),
(1691, 107, 'Saitama', 'SI', 1),
(1692, 107, 'Shiga', 'SH', 1),
(1693, 107, 'Shimane', 'SM', 1),
(1694, 107, 'Shizuoka', 'SZ', 1),
(1695, 107, 'Tochigi', 'TO', 1),
(1696, 107, 'Tokushima', 'TS', 1),
(1697, 107, 'Tokyo', 'TK', 1),
(1698, 107, 'Tottori', 'TT', 1),
(1699, 107, 'Toyama', 'TY', 1),
(1700, 107, 'Wakayama', 'WA', 1),
(1701, 107, 'Yamagata', 'YA', 1),
(1702, 107, 'Yamaguchi', 'YM', 1),
(1703, 107, 'Yamanashi', 'YN', 1),
(1704, 108, '''Amman', 'AM', 1),
(1705, 108, 'Ajlun', 'AJ', 1),
(1706, 108, 'Al ''Aqabah', 'AA', 1),
(1707, 108, 'Al Balqa''', 'AB', 1),
(1708, 108, 'Al Karak', 'AK', 1),
(1709, 108, 'Al Mafraq', 'AL', 1),
(1710, 108, 'At Tafilah', 'AT', 1),
(1711, 108, 'Az Zarqa''', 'AZ', 1),
(1712, 108, 'Irbid', 'IR', 1),
(1713, 108, 'Jarash', 'JA', 1),
(1714, 108, 'Ma''an', 'MA', 1),
(1715, 108, 'Madaba', 'MD', 1),
(1716, 109, 'Almaty', 'AL', 1),
(1717, 109, 'Almaty City', 'AC', 1),
(1718, 109, 'Aqmola', 'AM', 1),
(1719, 109, 'Aqtobe', 'AQ', 1),
(1720, 109, 'Astana City', 'AS', 1),
(1721, 109, 'Atyrau', 'AT', 1),
(1722, 109, 'Batys Qazaqstan', 'BA', 1),
(1723, 109, 'Bayqongyr City', 'BY', 1),
(1724, 109, 'Mangghystau', 'MA', 1),
(1725, 109, 'Ongtustik Qazaqstan', 'ON', 1),
(1726, 109, 'Pavlodar', 'PA', 1),
(1727, 109, 'Qaraghandy', 'QA', 1),
(1728, 109, 'Qostanay', 'QO', 1),
(1729, 109, 'Qyzylorda', 'QY', 1),
(1730, 109, 'Shyghys Qazaqstan', 'SH', 1),
(1731, 109, 'Soltustik Qazaqstan', 'SO', 1),
(1732, 109, 'Zhambyl', 'ZH', 1),
(1733, 110, 'Central', 'CE', 1),
(1734, 110, 'Coast', 'CO', 1),
(1735, 110, 'Eastern', 'EA', 1),
(1736, 110, 'Nairobi Area', 'NA', 1),
(1737, 110, 'North Eastern', 'NE', 1),
(1738, 110, 'Nyanza', 'NY', 1),
(1739, 110, 'Rift Valley', 'RV', 1),
(1740, 110, 'Western', 'WE', 1),
(1741, 111, 'Abaiang', 'AG', 1),
(1742, 111, 'Abemama', 'AM', 1),
(1743, 111, 'Aranuka', 'AK', 1),
(1744, 111, 'Arorae', 'AO', 1),
(1745, 111, 'Banaba', 'BA', 1),
(1746, 111, 'Beru', 'BE', 1),
(1747, 111, 'Butaritari', 'bT', 1),
(1748, 111, 'Kanton', 'KA', 1),
(1749, 111, 'Kiritimati', 'KR', 1),
(1750, 111, 'Kuria', 'KU', 1),
(1751, 111, 'Maiana', 'MI', 1),
(1752, 111, 'Makin', 'MN', 1),
(1753, 111, 'Marakei', 'ME', 1),
(1754, 111, 'Nikunau', 'NI', 1),
(1755, 111, 'Nonouti', 'NO', 1),
(1756, 111, 'Onotoa', 'ON', 1),
(1757, 111, 'Tabiteuea', 'TT', 1),
(1758, 111, 'Tabuaeran', 'TR', 1),
(1759, 111, 'Tamana', 'TM', 1),
(1760, 111, 'Tarawa', 'TW', 1),
(1761, 111, 'Teraina', 'TE', 1),
(1762, 112, 'Chagang-do', 'CHA', 1),
(1763, 112, 'Hamgyong-bukto', 'HAB', 1),
(1764, 112, 'Hamgyong-namdo', 'HAN', 1),
(1765, 112, 'Hwanghae-bukto', 'HWB', 1),
(1766, 112, 'Hwanghae-namdo', 'HWN', 1),
(1767, 112, 'Kangwon-do', 'KAN', 1),
(1768, 112, 'P''yongan-bukto', 'PYB', 1),
(1769, 112, 'P''yongan-namdo', 'PYN', 1),
(1770, 112, 'Ryanggang-do (Yanggang-do)', 'YAN', 1),
(1771, 112, 'Rason Directly Governed City', 'NAJ', 1),
(1772, 112, 'P''yongyang Special City', 'PYO', 1),
(1773, 113, 'Ch''ungch''ong-bukto', 'CO', 1),
(1774, 113, 'Ch''ungch''ong-namdo', 'CH', 1),
(1775, 113, 'Cheju-do', 'CD', 1),
(1776, 113, 'Cholla-bukto', 'CB', 1),
(1777, 113, 'Cholla-namdo', 'CN', 1),
(1778, 113, 'Inch''on-gwangyoksi', 'IG', 1),
(1779, 113, 'Kangwon-do', 'KA', 1),
(1780, 113, 'Kwangju-gwangyoksi', 'KG', 1),
(1781, 113, 'Kyonggi-do', 'KD', 1),
(1782, 113, 'Kyongsang-bukto', 'KB', 1),
(1783, 113, 'Kyongsang-namdo', 'KN', 1),
(1784, 113, 'Pusan-gwangyoksi', 'PG', 1),
(1785, 113, 'Soul-t''ukpyolsi', 'SO', 1),
(1786, 113, 'Taegu-gwangyoksi', 'TA', 1),
(1787, 113, 'Taejon-gwangyoksi', 'TG', 1),
(1788, 114, 'Al ''Asimah', 'AL', 1),
(1789, 114, 'Al Ahmadi', 'AA', 1),
(1790, 114, 'Al Farwaniyah', 'AF', 1),
(1791, 114, 'Al Jahra''', 'AJ', 1),
(1792, 114, 'Hawalli', 'HA', 1),
(1793, 115, 'Bishkek', 'GB', 1),
(1794, 115, 'Batken', 'B', 1),
(1795, 115, 'Chu', 'C', 1),
(1796, 115, 'Jalal-Abad', 'J', 1),
(1797, 115, 'Naryn', 'N', 1),
(1798, 115, 'Osh', 'O', 1),
(1799, 115, 'Talas', 'T', 1),
(1800, 115, 'Ysyk-Kol', 'Y', 1),
(1801, 116, 'Vientiane', 'VT', 1),
(1802, 116, 'Attapu', 'AT', 1),
(1803, 116, 'Bokeo', 'BK', 1),
(1804, 116, 'Bolikhamxai', 'BL', 1),
(1805, 116, 'Champasak', 'CH', 1),
(1806, 116, 'Houaphan', 'HO', 1),
(1807, 116, 'Khammouan', 'KH', 1),
(1808, 116, 'Louang Namtha', 'LM', 1),
(1809, 116, 'Louangphabang', 'LP', 1),
(1810, 116, 'Oudomxai', 'OU', 1),
(1811, 116, 'Phongsali', 'PH', 1),
(1812, 116, 'Salavan', 'SL', 1),
(1813, 116, 'Savannakhet', 'SV', 1),
(1814, 116, 'Vientiane', 'VI', 1),
(1815, 116, 'Xaignabouli', 'XA', 1),
(1816, 116, 'Xekong', 'XE', 1),
(1817, 116, 'Xiangkhoang', 'XI', 1),
(1818, 116, 'Xaisomboun', 'XN', 1),
(1852, 119, 'Berea', 'BE', 1),
(1853, 119, 'Butha-Buthe', 'BB', 1),
(1854, 119, 'Leribe', 'LE', 1),
(1855, 119, 'Mafeteng', 'MF', 1),
(1856, 119, 'Maseru', 'MS', 1),
(1857, 119, 'Mohale''s Hoek', 'MH', 1),
(1858, 119, 'Mokhotlong', 'MK', 1),
(1859, 119, 'Qacha''s Nek', 'QN', 1),
(1860, 119, 'Quthing', 'QT', 1),
(1861, 119, 'Thaba-Tseka', 'TT', 1),
(1862, 120, 'Bomi', 'BI', 1),
(1863, 120, 'Bong', 'BG', 1),
(1864, 120, 'Grand Bassa', 'GB', 1),
(1865, 120, 'Grand Cape Mount', 'CM', 1),
(1866, 120, 'Grand Gedeh', 'GG', 1),
(1867, 120, 'Grand Kru', 'GK', 1),
(1868, 120, 'Lofa', 'LO', 1),
(1869, 120, 'Margibi', 'MG', 1),
(1870, 120, 'Maryland', 'ML', 1),
(1871, 120, 'Montserrado', 'MS', 1),
(1872, 120, 'Nimba', 'NB', 1),
(1873, 120, 'River Cess', 'RC', 1),
(1874, 120, 'Sinoe', 'SN', 1),
(1875, 121, 'Ajdabiya', 'AJ', 1),
(1876, 121, 'Al ''Aziziyah', 'AZ', 1),
(1877, 121, 'Al Fatih', 'FA', 1),
(1878, 121, 'Al Jabal al Akhdar', 'JA', 1),
(1879, 121, 'Al Jufrah', 'JU', 1),
(1880, 121, 'Al Khums', 'KH', 1),
(1881, 121, 'Al Kufrah', 'KU', 1),
(1882, 121, 'An Nuqat al Khams', 'NK', 1),
(1883, 121, 'Ash Shati''', 'AS', 1),
(1884, 121, 'Awbari', 'AW', 1),
(1885, 121, 'Az Zawiyah', 'ZA', 1),
(1886, 121, 'Banghazi', 'BA', 1),
(1887, 121, 'Darnah', 'DA', 1),
(1888, 121, 'Ghadamis', 'GD', 1),
(1889, 121, 'Gharyan', 'GY', 1),
(1890, 121, 'Misratah', 'MI', 1),
(1891, 121, 'Murzuq', 'MZ', 1),
(1892, 121, 'Sabha', 'SB', 1),
(1893, 121, 'Sawfajjin', 'SW', 1),
(1894, 121, 'Surt', 'SU', 1),
(1895, 121, 'Tarabulus (Tripoli)', 'TL', 1),
(1896, 121, 'Tarhunah', 'TH', 1),
(1897, 121, 'Tubruq', 'TU', 1),
(1898, 121, 'Yafran', 'YA', 1),
(1899, 121, 'Zlitan', 'ZL', 1),
(1900, 122, 'Vaduz', 'V', 1),
(1901, 122, 'Schaan', 'A', 1),
(1902, 122, 'Balzers', 'B', 1),
(1903, 122, 'Triesen', 'N', 1),
(1904, 122, 'Eschen', 'E', 1),
(1905, 122, 'Mauren', 'M', 1),
(1906, 122, 'Triesenberg', 'T', 1),
(1907, 122, 'Ruggell', 'R', 1),
(1908, 122, 'Gamprin', 'G', 1),
(1909, 122, 'Schellenberg', 'L', 1),
(1910, 122, 'Planken', 'P', 1),
(1911, 123, 'Alytus', 'AL', 1),
(1912, 123, 'Kaunas', 'KA', 1),
(1913, 123, 'Klaipeda', 'KL', 1),
(1914, 123, 'Marijampole', 'MA', 1),
(1915, 123, 'Panevezys', 'PA', 1),
(1916, 123, 'Siauliai', 'SI', 1),
(1917, 123, 'Taurage', 'TA', 1),
(1918, 123, 'Telsiai', 'TE', 1),
(1919, 123, 'Utena', 'UT', 1),
(1920, 123, 'Vilnius', 'VI', 1),
(1921, 124, 'Diekirch', 'DD', 1),
(1922, 124, 'Clervaux', 'DC', 1),
(1923, 124, 'Redange', 'DR', 1),
(1924, 124, 'Vianden', 'DV', 1),
(1925, 124, 'Wiltz', 'DW', 1),
(1926, 124, 'Grevenmacher', 'GG', 1),
(1927, 124, 'Echternach', 'GE', 1),
(1928, 124, 'Remich', 'GR', 1),
(1929, 124, 'Luxembourg', 'LL', 1),
(1930, 124, 'Capellen', 'LC', 1),
(1931, 124, 'Esch-sur-Alzette', 'LE', 1),
(1932, 124, 'Mersch', 'LM', 1),
(1933, 125, 'Our Lady Fatima Parish', 'OLF', 1),
(1934, 125, 'St. Anthony Parish', 'ANT', 1),
(1935, 125, 'St. Lazarus Parish', 'LAZ', 1),
(1936, 125, 'Cathedral Parish', 'CAT', 1),
(1937, 125, 'St. Lawrence Parish', 'LAW', 1),
(1938, 127, 'Antananarivo', 'AN', 1),
(1939, 127, 'Antsiranana', 'AS', 1),
(1940, 127, 'Fianarantsoa', 'FN', 1),
(1941, 127, 'Mahajanga', 'MJ', 1),
(1942, 127, 'Toamasina', 'TM', 1),
(1943, 127, 'Toliara', 'TL', 1),
(1944, 128, 'Balaka', 'BLK', 1),
(1945, 128, 'Blantyre', 'BLT', 1),
(1946, 128, 'Chikwawa', 'CKW', 1),
(1947, 128, 'Chiradzulu', 'CRD', 1),
(1948, 128, 'Chitipa', 'CTP', 1),
(1949, 128, 'Dedza', 'DDZ', 1),
(1950, 128, 'Dowa', 'DWA', 1),
(1951, 128, 'Karonga', 'KRG', 1),
(1952, 128, 'Kasungu', 'KSG', 1),
(1953, 128, 'Likoma', 'LKM', 1),
(1954, 128, 'Lilongwe', 'LLG', 1),
(1955, 128, 'Machinga', 'MCG', 1),
(1956, 128, 'Mangochi', 'MGC', 1),
(1957, 128, 'Mchinji', 'MCH', 1),
(1958, 128, 'Mulanje', 'MLJ', 1),
(1959, 128, 'Mwanza', 'MWZ', 1),
(1960, 128, 'Mzimba', 'MZM', 1),
(1961, 128, 'Ntcheu', 'NTU', 1),
(1962, 128, 'Nkhata Bay', 'NKB', 1),
(1963, 128, 'Nkhotakota', 'NKH', 1),
(1964, 128, 'Nsanje', 'NSJ', 1),
(1965, 128, 'Ntchisi', 'NTI', 1),
(1966, 128, 'Phalombe', 'PHL', 1),
(1967, 128, 'Rumphi', 'RMP', 1),
(1968, 128, 'Salima', 'SLM', 1),
(1969, 128, 'Thyolo', 'THY', 1),
(1970, 128, 'Zomba', 'ZBA', 1),
(1971, 129, 'Johor', 'MY-01', 1),
(1972, 129, 'Kedah', 'MY-02', 1),
(1973, 129, 'Kelantan', 'MY-03', 1),
(1974, 129, 'Labuan', 'MY-15', 1),
(1975, 129, 'Melaka', 'MY-04', 1),
(1976, 129, 'Negeri Sembilan', 'MY-05', 1),
(1977, 129, 'Pahang', 'MY-06', 1),
(1978, 129, 'Perak', 'MY-08', 1),
(1979, 129, 'Perlis', 'MY-09', 1),
(1980, 129, 'Pulau Pinang', 'MY-07', 1),
(1981, 129, 'Sabah', 'MY-12', 1),
(1982, 129, 'Sarawak', 'MY-13', 1),
(1983, 129, 'Selangor', 'MY-10', 1),
(1984, 129, 'Terengganu', 'MY-11', 1),
(1985, 129, 'Kuala Lumpur', 'MY-14', 1),
(4035, 129, 'Putrajaya', 'MY-16', 1),
(1986, 130, 'Thiladhunmathi Uthuru', 'THU', 1),
(1987, 130, 'Thiladhunmathi Dhekunu', 'THD', 1),
(1988, 130, 'Miladhunmadulu Uthuru', 'MLU', 1),
(1989, 130, 'Miladhunmadulu Dhekunu', 'MLD', 1),
(1990, 130, 'Maalhosmadulu Uthuru', 'MAU', 1),
(1991, 130, 'Maalhosmadulu Dhekunu', 'MAD', 1),
(1992, 130, 'Faadhippolhu', 'FAA', 1),
(1993, 130, 'Male Atoll', 'MAA', 1),
(1994, 130, 'Ari Atoll Uthuru', 'AAU', 1),
(1995, 130, 'Ari Atoll Dheknu', 'AAD', 1),
(1996, 130, 'Felidhe Atoll', 'FEA', 1),
(1997, 130, 'Mulaku Atoll', 'MUA', 1),
(1998, 130, 'Nilandhe Atoll Uthuru', 'NAU', 1),
(1999, 130, 'Nilandhe Atoll Dhekunu', 'NAD', 1),
(2000, 130, 'Kolhumadulu', 'KLH', 1),
(2001, 130, 'Hadhdhunmathi', 'HDH', 1),
(2002, 130, 'Huvadhu Atoll Uthuru', 'HAU', 1),
(2003, 130, 'Huvadhu Atoll Dhekunu', 'HAD', 1),
(2004, 130, 'Fua Mulaku', 'FMU', 1),
(2005, 130, 'Addu', 'ADD', 1),
(2006, 131, 'Gao', 'GA', 1),
(2007, 131, 'Kayes', 'KY', 1),
(2008, 131, 'Kidal', 'KD', 1),
(2009, 131, 'Koulikoro', 'KL', 1),
(2010, 131, 'Mopti', 'MP', 1),
(2011, 131, 'Segou', 'SG', 1),
(2012, 131, 'Sikasso', 'SK', 1),
(2013, 131, 'Tombouctou', 'TB', 1),
(2014, 131, 'Bamako Capital District', 'CD', 1),
(2015, 132, 'Attard', 'ATT', 1),
(2016, 132, 'Balzan', 'BAL', 1),
(2017, 132, 'Birgu', 'BGU', 1),
(2018, 132, 'Birkirkara', 'BKK', 1),
(2019, 132, 'Birzebbuga', 'BRZ', 1),
(2020, 132, 'Bormla', 'BOR', 1),
(2021, 132, 'Dingli', 'DIN', 1),
(2022, 132, 'Fgura', 'FGU', 1),
(2023, 132, 'Floriana', 'FLO', 1),
(2024, 132, 'Gudja', 'GDJ', 1),
(2025, 132, 'Gzira', 'GZR', 1),
(2026, 132, 'Gargur', 'GRG', 1),
(2027, 132, 'Gaxaq', 'GXQ', 1),
(2028, 132, 'Hamrun', 'HMR', 1),
(2029, 132, 'Iklin', 'IKL', 1),
(2030, 132, 'Isla', 'ISL', 1),
(2031, 132, 'Kalkara', 'KLK', 1),
(2032, 132, 'Kirkop', 'KRK', 1),
(2033, 132, 'Lija', 'LIJ', 1),
(2034, 132, 'Luqa', 'LUQ', 1),
(2035, 132, 'Marsa', 'MRS', 1),
(2036, 132, 'Marsaskala', 'MKL', 1),
(2037, 132, 'Marsaxlokk', 'MXL', 1),
(2038, 132, 'Mdina', 'MDN', 1),
(2039, 132, 'Melliea', 'MEL', 1),
(2040, 132, 'Mgarr', 'MGR', 1),
(2041, 132, 'Mosta', 'MST', 1),
(2042, 132, 'Mqabba', 'MQA', 1),
(2043, 132, 'Msida', 'MSI', 1),
(2044, 132, 'Mtarfa', 'MTF', 1),
(2045, 132, 'Naxxar', 'NAX', 1),
(2046, 132, 'Paola', 'PAO', 1),
(2047, 132, 'Pembroke', 'PEM', 1),
(2048, 132, 'Pieta', 'PIE', 1),
(2049, 132, 'Qormi', 'QOR', 1),
(2050, 132, 'Qrendi', 'QRE', 1),
(2051, 132, 'Rabat', 'RAB', 1),
(2052, 132, 'Safi', 'SAF', 1),
(2053, 132, 'San Giljan', 'SGI', 1),
(2054, 132, 'Santa Lucija', 'SLU', 1),
(2055, 132, 'San Pawl il-Bahar', 'SPB', 1),
(2056, 132, 'San Gwann', 'SGW', 1),
(2057, 132, 'Santa Venera', 'SVE', 1),
(2058, 132, 'Siggiewi', 'SIG', 1),
(2059, 132, 'Sliema', 'SLM', 1),
(2060, 132, 'Swieqi', 'SWQ', 1),
(2061, 132, 'Ta Xbiex', 'TXB', 1),
(2062, 132, 'Tarxien', 'TRX', 1),
(2063, 132, 'Valletta', 'VLT', 1),
(2064, 132, 'Xgajra', 'XGJ', 1),
(2065, 132, 'Zabbar', 'ZBR', 1),
(2066, 132, 'Zebbug', 'ZBG', 1),
(2067, 132, 'Zejtun', 'ZJT', 1),
(2068, 132, 'Zurrieq', 'ZRQ', 1),
(2069, 132, 'Fontana', 'FNT', 1),
(2070, 132, 'Ghajnsielem', 'GHJ', 1),
(2071, 132, 'Gharb', 'GHR', 1),
(2072, 132, 'Ghasri', 'GHS', 1),
(2073, 132, 'Kercem', 'KRC', 1),
(2074, 132, 'Munxar', 'MUN', 1),
(2075, 132, 'Nadur', 'NAD', 1),
(2076, 132, 'Qala', 'QAL', 1),
(2077, 132, 'Victoria', 'VIC', 1),
(2078, 132, 'San Lawrenz', 'SLA', 1),
(2079, 132, 'Sannat', 'SNT', 1),
(2080, 132, 'Xagra', 'ZAG', 1),
(2081, 132, 'Xewkija', 'XEW', 1),
(2082, 132, 'Zebbug', 'ZEB', 1),
(2083, 133, 'Ailinginae', 'ALG', 1),
(2084, 133, 'Ailinglaplap', 'ALL', 1),
(2085, 133, 'Ailuk', 'ALK', 1),
(2086, 133, 'Arno', 'ARN', 1),
(2087, 133, 'Aur', 'AUR', 1),
(2088, 133, 'Bikar', 'BKR', 1),
(2089, 133, 'Bikini', 'BKN', 1),
(2090, 133, 'Bokak', 'BKK', 1),
(2091, 133, 'Ebon', 'EBN', 1),
(2092, 133, 'Enewetak', 'ENT', 1),
(2093, 133, 'Erikub', 'EKB', 1),
(2094, 133, 'Jabat', 'JBT', 1),
(2095, 133, 'Jaluit', 'JLT', 1),
(2096, 133, 'Jemo', 'JEM', 1),
(2097, 133, 'Kili', 'KIL', 1),
(2098, 133, 'Kwajalein', 'KWJ', 1),
(2099, 133, 'Lae', 'LAE', 1),
(2100, 133, 'Lib', 'LIB', 1),
(2101, 133, 'Likiep', 'LKP', 1),
(2102, 133, 'Majuro', 'MJR', 1),
(2103, 133, 'Maloelap', 'MLP', 1),
(2104, 133, 'Mejit', 'MJT', 1),
(2105, 133, 'Mili', 'MIL', 1),
(2106, 133, 'Namorik', 'NMK', 1),
(2107, 133, 'Namu', 'NAM', 1),
(2108, 133, 'Rongelap', 'RGL', 1),
(2109, 133, 'Rongrik', 'RGK', 1),
(2110, 133, 'Toke', 'TOK', 1),
(2111, 133, 'Ujae', 'UJA', 1),
(2112, 133, 'Ujelang', 'UJL', 1),
(2113, 133, 'Utirik', 'UTK', 1),
(2114, 133, 'Wotho', 'WTH', 1),
(2115, 133, 'Wotje', 'WTJ', 1),
(2116, 135, 'Adrar', 'AD', 1),
(2117, 135, 'Assaba', 'AS', 1),
(2118, 135, 'Brakna', 'BR', 1),
(2119, 135, 'Dakhlet Nouadhibou', 'DN', 1),
(2120, 135, 'Gorgol', 'GO', 1),
(2121, 135, 'Guidimaka', 'GM', 1),
(2122, 135, 'Hodh Ech Chargui', 'HC', 1),
(2123, 135, 'Hodh El Gharbi', 'HG', 1),
(2124, 135, 'Inchiri', 'IN', 1),
(2125, 135, 'Tagant', 'TA', 1),
(2126, 135, 'Tiris Zemmour', 'TZ', 1),
(2127, 135, 'Trarza', 'TR', 1),
(2128, 135, 'Nouakchott', 'NO', 1),
(2129, 136, 'Beau Bassin-Rose Hill', 'BR', 1),
(2130, 136, 'Curepipe', 'CU', 1),
(2131, 136, 'Port Louis', 'PU', 1),
(2132, 136, 'Quatre Bornes', 'QB', 1),
(2133, 136, 'Vacoas-Phoenix', 'VP', 1),
(2134, 136, 'Agalega Islands', 'AG', 1),
(2135, 136, 'Cargados Carajos Shoals (Saint Brandon Islands)', 'CC', 1),
(2136, 136, 'Rodrigues', 'RO', 1),
(2137, 136, 'Black River', 'BL', 1),
(2138, 136, 'Flacq', 'FL', 1),
(2139, 136, 'Grand Port', 'GP', 1),
(2140, 136, 'Moka', 'MO', 1),
(2141, 136, 'Pamplemousses', 'PA', 1),
(2142, 136, 'Plaines Wilhems', 'PW', 1),
(2143, 136, 'Port Louis', 'PL', 1),
(2144, 136, 'Riviere du Rempart', 'RR', 1),
(2145, 136, 'Savanne', 'SA', 1),
(2146, 138, 'Baja California Norte', 'BN', 1),
(2147, 138, 'Baja California Sur', 'BS', 1),
(2148, 138, 'Campeche', 'CA', 1),
(2149, 138, 'Chiapas', 'CI', 1),
(2150, 138, 'Chihuahua', 'CH', 1),
(2151, 138, 'Coahuila de Zaragoza', 'CZ', 1),
(2152, 138, 'Colima', 'CL', 1),
(2153, 138, 'Distrito Federal', 'DF', 1),
(2154, 138, 'Durango', 'DU', 1),
(2155, 138, 'Guanajuato', 'GA', 1),
(2156, 138, 'Guerrero', 'GE', 1),
(2157, 138, 'Hidalgo', 'HI', 1),
(2158, 138, 'Jalisco', 'JA', 1),
(2159, 138, 'Mexico', 'ME', 1),
(2160, 138, 'Michoacan de Ocampo', 'MI', 1),
(2161, 138, 'Morelos', 'MO', 1),
(2162, 138, 'Nayarit', 'NA', 1),
(2163, 138, 'Nuevo Leon', 'NL', 1),
(2164, 138, 'Oaxaca', 'OA', 1),
(2165, 138, 'Puebla', 'PU', 1),
(2166, 138, 'Queretaro de Arteaga', 'QA', 1),
(2167, 138, 'Quintana Roo', 'QR', 1),
(2168, 138, 'San Luis Potosi', 'SA', 1),
(2169, 138, 'Sinaloa', 'SI', 1),
(2170, 138, 'Sonora', 'SO', 1),
(2171, 138, 'Tabasco', 'TB', 1),
(2172, 138, 'Tamaulipas', 'TM', 1),
(2173, 138, 'Tlaxcala', 'TL', 1),
(2174, 138, 'Veracruz-Llave', 'VE', 1),
(2175, 138, 'Yucatan', 'YU', 1),
(2176, 138, 'Zacatecas', 'ZA', 1),
(2177, 139, 'Chuuk', 'C', 1),
(2178, 139, 'Kosrae', 'K', 1),
(2179, 139, 'Pohnpei', 'P', 1),
(2180, 139, 'Yap', 'Y', 1),
(2181, 140, 'Gagauzia', 'GA', 1),
(2182, 140, 'Chisinau', 'CU', 1),
(2183, 140, 'Balti', 'BA', 1),
(2184, 140, 'Cahul', 'CA', 1),
(2185, 140, 'Edinet', 'ED', 1),
(2186, 140, 'Lapusna', 'LA', 1),
(2187, 140, 'Orhei', 'OR', 1),
(2188, 140, 'Soroca', 'SO', 1),
(2189, 140, 'Tighina', 'TI', 1),
(2190, 140, 'Ungheni', 'UN', 1),
(2191, 140, 'St‚nga Nistrului', 'SN', 1),
(2192, 141, 'Fontvieille', 'FV', 1),
(2193, 141, 'La Condamine', 'LC', 1),
(2194, 141, 'Monaco-Ville', 'MV', 1),
(2195, 141, 'Monte-Carlo', 'MC', 1),
(2196, 142, 'Ulanbaatar', '1', 1),
(2197, 142, 'Orhon', '035', 1),
(2198, 142, 'Darhan uul', '037', 1),
(2199, 142, 'Hentiy', '039', 1),
(2200, 142, 'Hovsgol', '041', 1),
(2201, 142, 'Hovd', '043', 1),
(2202, 142, 'Uvs', '046', 1),
(2203, 142, 'Tov', '047', 1),
(2204, 142, 'Selenge', '049', 1),
(2205, 142, 'Suhbaatar', '051', 1),
(2206, 142, 'Omnogovi', '053', 1),
(2207, 142, 'Ovorhangay', '055', 1),
(2208, 142, 'Dzavhan', '057', 1),
(2209, 142, 'DundgovL', '059', 1),
(2210, 142, 'Dornod', '061', 1),
(2211, 142, 'Dornogov', '063', 1),
(2212, 142, 'Govi-Sumber', '064', 1),
(2213, 142, 'Govi-Altay', '065', 1),
(2214, 142, 'Bulgan', '067', 1),
(2215, 142, 'Bayanhongor', '069', 1),
(2216, 142, 'Bayan-Olgiy', '071', 1),
(2217, 142, 'Arhangay', '073', 1),
(2218, 143, 'Saint Anthony', 'A', 1),
(2219, 143, 'Saint Georges', 'G', 1),
(2220, 143, 'Saint Peter', 'P', 1),
(2221, 144, 'Agadir', 'AGD', 1),
(2222, 144, 'Al Hoceima', 'HOC', 1),
(2223, 144, 'Azilal', 'AZI', 1),
(2224, 144, 'Beni Mellal', 'BME', 1),
(2225, 144, 'Ben Slimane', 'BSL', 1),
(2226, 144, 'Boulemane', 'BLM', 1),
(2227, 144, 'Casablanca', 'CBL', 1),
(2228, 144, 'Chaouen', 'CHA', 1),
(2229, 144, 'El Jadida', 'EJA', 1),
(2230, 144, 'El Kelaa des Sraghna', 'EKS', 1),
(2231, 144, 'Er Rachidia', 'ERA', 1),
(2232, 144, 'Essaouira', 'ESS', 1),
(2233, 144, 'Fes', 'FES', 1),
(2234, 144, 'Figuig', 'FIG', 1),
(2235, 144, 'Guelmim', 'GLM', 1),
(2236, 144, 'Ifrane', 'IFR', 1),
(2237, 144, 'Kenitra', 'KEN', 1),
(2238, 144, 'Khemisset', 'KHM', 1),
(2239, 144, 'Khenifra', 'KHN', 1),
(2240, 144, 'Khouribga', 'KHO', 1),
(2241, 144, 'Laayoune', 'LYN', 1),
(2242, 144, 'Larache', 'LAR', 1),
(2243, 144, 'Marrakech', 'MRK', 1),
(2244, 144, 'Meknes', 'MKN', 1),
(2245, 144, 'Nador', 'NAD', 1),
(2246, 144, 'Ouarzazate', 'ORZ', 1),
(2247, 144, 'Oujda', 'OUJ', 1),
(2248, 144, 'Rabat-Sale', 'RSA', 1),
(2249, 144, 'Safi', 'SAF', 1),
(2250, 144, 'Settat', 'SET', 1),
(2251, 144, 'Sidi Kacem', 'SKA', 1),
(2252, 144, 'Tangier', 'TGR', 1),
(2253, 144, 'Tan-Tan', 'TAN', 1),
(2254, 144, 'Taounate', 'TAO', 1),
(2255, 144, 'Taroudannt', 'TRD', 1),
(2256, 144, 'Tata', 'TAT', 1),
(2257, 144, 'Taza', 'TAZ', 1),
(2258, 144, 'Tetouan', 'TET', 1),
(2259, 144, 'Tiznit', 'TIZ', 1),
(2260, 144, 'Ad Dakhla', 'ADK', 1),
(2261, 144, 'Boujdour', 'BJD', 1),
(2262, 144, 'Es Smara', 'ESM', 1),
(2263, 145, 'Cabo Delgado', 'CD', 1),
(2264, 145, 'Gaza', 'GZ', 1),
(2265, 145, 'Inhambane', 'IN', 1),
(2266, 145, 'Manica', 'MN', 1),
(2267, 145, 'Maputo (city)', 'MC', 1),
(2268, 145, 'Maputo', 'MP', 1),
(2269, 145, 'Nampula', 'NA', 1),
(2270, 145, 'Niassa', 'NI', 1),
(2271, 145, 'Sofala', 'SO', 1),
(2272, 145, 'Tete', 'TE', 1),
(2273, 145, 'Zambezia', 'ZA', 1),
(2274, 146, 'Ayeyarwady', 'AY', 1),
(2275, 146, 'Bago', 'BG', 1),
(2276, 146, 'Magway', 'MG', 1),
(2277, 146, 'Mandalay', 'MD', 1),
(2278, 146, 'Sagaing', 'SG', 1),
(2279, 146, 'Tanintharyi', 'TN', 1),
(2280, 146, 'Yangon', 'YG', 1),
(2281, 146, 'Chin State', 'CH', 1),
(2282, 146, 'Kachin State', 'KC', 1),
(2283, 146, 'Kayah State', 'KH', 1),
(2284, 146, 'Kayin State', 'KN', 1),
(2285, 146, 'Mon State', 'MN', 1),
(2286, 146, 'Rakhine State', 'RK', 1),
(2287, 146, 'Shan State', 'SH', 1),
(2288, 147, 'Caprivi', 'CA', 1),
(2289, 147, 'Erongo', 'ER', 1),
(2290, 147, 'Hardap', 'HA', 1),
(2291, 147, 'Karas', 'KR', 1),
(2292, 147, 'Kavango', 'KV', 1),
(2293, 147, 'Khomas', 'KH', 1),
(2294, 147, 'Kunene', 'KU', 1),
(2295, 147, 'Ohangwena', 'OW', 1),
(2296, 147, 'Omaheke', 'OK', 1),
(2297, 147, 'Omusati', 'OT', 1),
(2298, 147, 'Oshana', 'ON', 1),
(2299, 147, 'Oshikoto', 'OO', 1),
(2300, 147, 'Otjozondjupa', 'OJ', 1),
(2301, 148, 'Aiwo', 'AO', 1),
(2302, 148, 'Anabar', 'AA', 1),
(2303, 148, 'Anetan', 'AT', 1),
(2304, 148, 'Anibare', 'AI', 1),
(2305, 148, 'Baiti', 'BA', 1),
(2306, 148, 'Boe', 'BO', 1),
(2307, 148, 'Buada', 'BU', 1),
(2308, 148, 'Denigomodu', 'DE', 1),
(2309, 148, 'Ewa', 'EW', 1),
(2310, 148, 'Ijuw', 'IJ', 1),
(2311, 148, 'Meneng', 'ME', 1),
(2312, 148, 'Nibok', 'NI', 1),
(2313, 148, 'Uaboe', 'UA', 1),
(2314, 148, 'Yaren', 'YA', 1),
(2315, 149, 'Bagmati', 'BA', 1),
(2316, 149, 'Bheri', 'BH', 1),
(2317, 149, 'Dhawalagiri', 'DH', 1),
(2318, 149, 'Gandaki', 'GA', 1),
(2319, 149, 'Janakpur', 'JA', 1),
(2320, 149, 'Karnali', 'KA', 1),
(2321, 149, 'Kosi', 'KO', 1),
(2322, 149, 'Lumbini', 'LU', 1),
(2323, 149, 'Mahakali', 'MA', 1),
(2324, 149, 'Mechi', 'ME', 1),
(2325, 149, 'Narayani', 'NA', 1),
(2326, 149, 'Rapti', 'RA', 1),
(2327, 149, 'Sagarmatha', 'SA', 1),
(2328, 149, 'Seti', 'SE', 1),
(2329, 150, 'Drenthe', 'DR', 1),
(2330, 150, 'Flevoland', 'FL', 1),
(2331, 150, 'Friesland', 'FR', 1),
(2332, 150, 'Gelderland', 'GE', 1),
(2333, 150, 'Groningen', 'GR', 1),
(2334, 150, 'Limburg', 'LI', 1),
(2335, 150, 'Noord Brabant', 'NB', 1),
(2336, 150, 'Noord Holland', 'NH', 1),
(2337, 150, 'Overijssel', 'OV', 1),
(2338, 150, 'Utrecht', 'UT', 1),
(2339, 150, 'Zeeland', 'ZE', 1),
(2340, 150, 'Zuid Holland', 'ZH', 1),
(2341, 152, 'Iles Loyaute', 'L', 1),
(2342, 152, 'Nord', 'N', 1),
(2343, 152, 'Sud', 'S', 1),
(2344, 153, 'Auckland', 'AUK', 1),
(2345, 153, 'Bay of Plenty', 'BOP', 1),
(2346, 153, 'Canterbury', 'CAN', 1),
(2347, 153, 'Coromandel', 'COR', 1),
(2348, 153, 'Gisborne', 'GIS', 1),
(2349, 153, 'Fiordland', 'FIO', 1),
(2350, 153, 'Hawke''s Bay', 'HKB', 1),
(2351, 153, 'Marlborough', 'MBH', 1),
(2352, 153, 'Manawatu-Wanganui', 'MWT', 1),
(2353, 153, 'Mt Cook-Mackenzie', 'MCM', 1),
(2354, 153, 'Nelson', 'NSN', 1),
(2355, 153, 'Northland', 'NTL', 1),
(2356, 153, 'Otago', 'OTA', 1),
(2357, 153, 'Southland', 'STL', 1),
(2358, 153, 'Taranaki', 'TKI', 1),
(2359, 153, 'Wellington', 'WGN', 1),
(2360, 153, 'Waikato', 'WKO', 1),
(2361, 153, 'Wairarapa', 'WAI', 1),
(2362, 153, 'West Coast', 'WTC', 1),
(2363, 154, 'Atlantico Norte', 'AN', 1),
(2364, 154, 'Atlantico Sur', 'AS', 1),
(2365, 154, 'Boaco', 'BO', 1),
(2366, 154, 'Carazo', 'CA', 1),
(2367, 154, 'Chinandega', 'CI', 1),
(2368, 154, 'Chontales', 'CO', 1),
(2369, 154, 'Esteli', 'ES', 1),
(2370, 154, 'Granada', 'GR', 1),
(2371, 154, 'Jinotega', 'JI', 1),
(2372, 154, 'Leon', 'LE', 1),
(2373, 154, 'Madriz', 'MD', 1),
(2374, 154, 'Managua', 'MN', 1),
(2375, 154, 'Masaya', 'MS', 1),
(2376, 154, 'Matagalpa', 'MT', 1),
(2377, 154, 'Nuevo Segovia', 'NS', 1),
(2378, 154, 'Rio San Juan', 'RS', 1),
(2379, 154, 'Rivas', 'RI', 1),
(2380, 155, 'Agadez', 'AG', 1),
(2381, 155, 'Diffa', 'DF', 1),
(2382, 155, 'Dosso', 'DS', 1),
(2383, 155, 'Maradi', 'MA', 1),
(2384, 155, 'Niamey', 'NM', 1),
(2385, 155, 'Tahoua', 'TH', 1),
(2386, 155, 'Tillaberi', 'TL', 1),
(2387, 155, 'Zinder', 'ZD', 1),
(2388, 156, 'Abia', 'AB', 1),
(2389, 156, 'Abuja Federal Capital Territory', 'CT', 1),
(2390, 156, 'Adamawa', 'AD', 1),
(2391, 156, 'Akwa Ibom', 'AK', 1),
(2392, 156, 'Anambra', 'AN', 1),
(2393, 156, 'Bauchi', 'BC', 1),
(2394, 156, 'Bayelsa', 'BY', 1),
(2395, 156, 'Benue', 'BN', 1),
(2396, 156, 'Borno', 'BO', 1),
(2397, 156, 'Cross River', 'CR', 1),
(2398, 156, 'Delta', 'DE', 1),
(2399, 156, 'Ebonyi', 'EB', 1),
(2400, 156, 'Edo', 'ED', 1),
(2401, 156, 'Ekiti', 'EK', 1),
(2402, 156, 'Enugu', 'EN', 1),
(2403, 156, 'Gombe', 'GO', 1),
(2404, 156, 'Imo', 'IM', 1),
(2405, 156, 'Jigawa', 'JI', 1),
(2406, 156, 'Kaduna', 'KD', 1),
(2407, 156, 'Kano', 'KN', 1),
(2408, 156, 'Katsina', 'KT', 1),
(2409, 156, 'Kebbi', 'KE', 1),
(2410, 156, 'Kogi', 'KO', 1),
(2411, 156, 'Kwara', 'KW', 1),
(2412, 156, 'Lagos', 'LA', 1),
(2413, 156, 'Nassarawa', 'NA', 1),
(2414, 156, 'Niger', 'NI', 1),
(2415, 156, 'Ogun', 'OG', 1),
(2416, 156, 'Ondo', 'ONG', 1),
(2417, 156, 'Osun', 'OS', 1),
(2418, 156, 'Oyo', 'OY', 1),
(2419, 156, 'Plateau', 'PL', 1),
(2420, 156, 'Rivers', 'RI', 1),
(2421, 156, 'Sokoto', 'SO', 1),
(2422, 156, 'Taraba', 'TA', 1),
(2423, 156, 'Yobe', 'YO', 1),
(2424, 156, 'Zamfara', 'ZA', 1),
(2425, 159, 'Northern Islands', 'N', 1),
(2426, 159, 'Rota', 'R', 1),
(2427, 159, 'Saipan', 'S', 1),
(2428, 159, 'Tinian', 'T', 1),
(2429, 160, 'Akershus', 'AK', 1),
(2430, 160, 'Aust-Agder', 'AA', 1),
(2431, 160, 'Buskerud', 'BU', 1),
(2432, 160, 'Finnmark', 'FM', 1),
(2433, 160, 'Hedmark', 'HM', 1),
(2434, 160, 'Hordaland', 'HL', 1),
(2435, 160, 'More og Romdal', 'MR', 1),
(2436, 160, 'Nord-Trondelag', 'NT', 1),
(2437, 160, 'Nordland', 'NL', 1),
(2438, 160, 'Ostfold', 'OF', 1),
(2439, 160, 'Oppland', 'OP', 1),
(2440, 160, 'Oslo', 'OL', 1),
(2441, 160, 'Rogaland', 'RL', 1),
(2442, 160, 'Sor-Trondelag', 'ST', 1),
(2443, 160, 'Sogn og Fjordane', 'SJ', 1),
(2444, 160, 'Svalbard', 'SV', 1),
(2445, 160, 'Telemark', 'TM', 1),
(2446, 160, 'Troms', 'TR', 1),
(2447, 160, 'Vest-Agder', 'VA', 1),
(2448, 160, 'Vestfold', 'VF', 1),
(2449, 161, 'Ad Dakhiliyah', 'DA', 1),
(2450, 161, 'Al Batinah', 'BA', 1),
(2451, 161, 'Al Wusta', 'WU', 1),
(2452, 161, 'Ash Sharqiyah', 'SH', 1),
(2453, 161, 'Az Zahirah', 'ZA', 1),
(2454, 161, 'Masqat', 'MA', 1),
(2455, 161, 'Musandam', 'MU', 1),
(2456, 161, 'Zufar', 'ZU', 1),
(2457, 162, 'Balochistan', 'B', 1),
(2458, 162, 'Federally Administered Tribal Areas', 'T', 1),
(2459, 162, 'Islamabad Capital Territory', 'I', 1),
(2460, 162, 'North-West Frontier', 'N', 1),
(2461, 162, 'Punjab', 'P', 1),
(2462, 162, 'Sindh', 'S', 1),
(2463, 163, 'Aimeliik', 'AM', 1),
(2464, 163, 'Airai', 'AR', 1),
(2465, 163, 'Angaur', 'AN', 1),
(2466, 163, 'Hatohobei', 'HA', 1),
(2467, 163, 'Kayangel', 'KA', 1),
(2468, 163, 'Koror', 'KO', 1),
(2469, 163, 'Melekeok', 'ME', 1),
(2470, 163, 'Ngaraard', 'NA', 1),
(2471, 163, 'Ngarchelong', 'NG', 1),
(2472, 163, 'Ngardmau', 'ND', 1),
(2473, 163, 'Ngatpang', 'NT', 1),
(2474, 163, 'Ngchesar', 'NC', 1),
(2475, 163, 'Ngeremlengui', 'NR', 1),
(2476, 163, 'Ngiwal', 'NW', 1),
(2477, 163, 'Peleliu', 'PE', 1),
(2478, 163, 'Sonsorol', 'SO', 1),
(2479, 164, 'Bocas del Toro', 'BT', 1),
(2480, 164, 'Chiriqui', 'CH', 1),
(2481, 164, 'Cocle', 'CC', 1),
(2482, 164, 'Colon', 'CL', 1),
(2483, 164, 'Darien', 'DA', 1),
(2484, 164, 'Herrera', 'HE', 1),
(2485, 164, 'Los Santos', 'LS', 1),
(2486, 164, 'Panama', 'PA', 1),
(2487, 164, 'San Blas', 'SB', 1),
(2488, 164, 'Veraguas', 'VG', 1),
(2489, 165, 'Bougainville', 'BV', 1),
(2490, 165, 'Central', 'CE', 1),
(2491, 165, 'Chimbu', 'CH', 1),
(2492, 165, 'Eastern Highlands', 'EH', 1),
(2493, 165, 'East New Britain', 'EB', 1),
(2494, 165, 'East Sepik', 'ES', 1),
(2495, 165, 'Enga', 'EN', 1),
(2496, 165, 'Gulf', 'GU', 1),
(2497, 165, 'Madang', 'MD', 1),
(2498, 165, 'Manus', 'MN', 1),
(2499, 165, 'Milne Bay', 'MB', 1),
(2500, 165, 'Morobe', 'MR', 1),
(2501, 165, 'National Capital', 'NC', 1),
(2502, 165, 'New Ireland', 'NI', 1),
(2503, 165, 'Northern', 'NO', 1),
(2504, 165, 'Sandaun', 'SA', 1),
(2505, 165, 'Southern Highlands', 'SH', 1),
(2506, 165, 'Western', 'WE', 1),
(2507, 165, 'Western Highlands', 'WH', 1),
(2508, 165, 'West New Britain', 'WB', 1),
(2509, 166, 'Alto Paraguay', 'AG', 1),
(2510, 166, 'Alto Parana', 'AN', 1),
(2511, 166, 'Amambay', 'AM', 1),
(2512, 166, 'Asuncion', 'AS', 1),
(2513, 166, 'Boqueron', 'BO', 1),
(2514, 166, 'Caaguazu', 'CG', 1),
(2515, 166, 'Caazapa', 'CZ', 1),
(2516, 166, 'Canindeyu', 'CN', 1),
(2517, 166, 'Central', 'CE', 1),
(2518, 166, 'Concepcion', 'CC', 1),
(2519, 166, 'Cordillera', 'CD', 1),
(2520, 166, 'Guaira', 'GU', 1),
(2521, 166, 'Itapua', 'IT', 1),
(2522, 166, 'Misiones', 'MI', 1),
(2523, 166, 'Neembucu', 'NE', 1),
(2524, 166, 'Paraguari', 'PA', 1),
(2525, 166, 'Presidente Hayes', 'PH', 1),
(2526, 166, 'San Pedro', 'SP', 1),
(2527, 167, 'Amazonas', 'AM', 1),
(2528, 167, 'Ancash', 'AN', 1),
(2529, 167, 'Apurimac', 'AP', 1),
(2530, 167, 'Arequipa', 'AR', 1),
(2531, 167, 'Ayacucho', 'AY', 1),
(2532, 167, 'Cajamarca', 'CJ', 1),
(2533, 167, 'Callao', 'CL', 1),
(2534, 167, 'Cusco', 'CU', 1),
(2535, 167, 'Huancavelica', 'HV', 1),
(2536, 167, 'Huanuco', 'HO', 1),
(2537, 167, 'Ica', 'IC', 1),
(2538, 167, 'Junin', 'JU', 1),
(2539, 167, 'La Libertad', 'LD', 1),
(2540, 167, 'Lambayeque', 'LY', 1),
(2541, 167, 'Lima', 'LI', 1),
(2542, 167, 'Loreto', 'LO', 1),
(2543, 167, 'Madre de Dios', 'MD', 1),
(2544, 167, 'Moquegua', 'MO', 1),
(2545, 167, 'Pasco', 'PA', 1),
(2546, 167, 'Piura', 'PI', 1),
(2547, 167, 'Puno', 'PU', 1),
(2548, 167, 'San Martin', 'SM', 1),
(2549, 167, 'Tacna', 'TA', 1),
(2550, 167, 'Tumbes', 'TU', 1),
(2551, 167, 'Ucayali', 'UC', 1),
(2552, 168, 'Abra', 'ABR', 1),
(2553, 168, 'Agusan del Norte', 'ANO', 1),
(2554, 168, 'Agusan del Sur', 'ASU', 1),
(2555, 168, 'Aklan', 'AKL', 1),
(2556, 168, 'Albay', 'ALB', 1),
(2557, 168, 'Antique', 'ANT', 1),
(2558, 168, 'Apayao', 'APY', 1),
(2559, 168, 'Aurora', 'AUR', 1),
(2560, 168, 'Basilan', 'BAS', 1),
(2561, 168, 'Bataan', 'BTA', 1),
(2562, 168, 'Batanes', 'BTE', 1),
(2563, 168, 'Batangas', 'BTG', 1),
(2564, 168, 'Biliran', 'BLR', 1),
(2565, 168, 'Benguet', 'BEN', 1),
(2566, 168, 'Bohol', 'BOL', 1),
(2567, 168, 'Bukidnon', 'BUK', 1),
(2568, 168, 'Bulacan', 'BUL', 1),
(2569, 168, 'Cagayan', 'CAG', 1),
(2570, 168, 'Camarines Norte', 'CNO', 1),
(2571, 168, 'Camarines Sur', 'CSU', 1),
(2572, 168, 'Camiguin', 'CAM', 1),
(2573, 168, 'Capiz', 'CAP', 1),
(2574, 168, 'Catanduanes', 'CAT', 1),
(2575, 168, 'Cavite', 'CAV', 1),
(2576, 168, 'Cebu', 'CEB', 1),
(2577, 168, 'Compostela', 'CMP', 1),
(2578, 168, 'Davao del Norte', 'DNO', 1),
(2579, 168, 'Davao del Sur', 'DSU', 1),
(2580, 168, 'Davao Oriental', 'DOR', 1),
(2581, 168, 'Eastern Samar', 'ESA', 1),
(2582, 168, 'Guimaras', 'GUI', 1),
(2583, 168, 'Ifugao', 'IFU', 1),
(2584, 168, 'Ilocos Norte', 'INO', 1),
(2585, 168, 'Ilocos Sur', 'ISU', 1),
(2586, 168, 'Iloilo', 'ILO', 1),
(2587, 168, 'Isabela', 'ISA', 1),
(2588, 168, 'Kalinga', 'KAL', 1),
(2589, 168, 'Laguna', 'LAG', 1),
(2590, 168, 'Lanao del Norte', 'LNO', 1),
(2591, 168, 'Lanao del Sur', 'LSU', 1),
(2592, 168, 'La Union', 'UNI', 1),
(2593, 168, 'Leyte', 'LEY', 1),
(2594, 168, 'Maguindanao', 'MAG', 1),
(2595, 168, 'Marinduque', 'MRN', 1),
(2596, 168, 'Masbate', 'MSB', 1),
(2597, 168, 'Mindoro Occidental', 'MIC', 1),
(2598, 168, 'Mindoro Oriental', 'MIR', 1),
(2599, 168, 'Misamis Occidental', 'MSC', 1),
(2600, 168, 'Misamis Oriental', 'MOR', 1),
(2601, 168, 'Mountain', 'MOP', 1),
(2602, 168, 'Negros Occidental', 'NOC', 1),
(2603, 168, 'Negros Oriental', 'NOR', 1),
(2604, 168, 'North Cotabato', 'NCT', 1),
(2605, 168, 'Northern Samar', 'NSM', 1),
(2606, 168, 'Nueva Ecija', 'NEC', 1),
(2607, 168, 'Nueva Vizcaya', 'NVZ', 1),
(2608, 168, 'Palawan', 'PLW', 1),
(2609, 168, 'Pampanga', 'PMP', 1),
(2610, 168, 'Pangasinan', 'PNG', 1),
(2611, 168, 'Quezon', 'QZN', 1),
(2612, 168, 'Quirino', 'QRN', 1),
(2613, 168, 'Rizal', 'RIZ', 1),
(2614, 168, 'Romblon', 'ROM', 1),
(2615, 168, 'Samar', 'SMR', 1),
(2616, 168, 'Sarangani', 'SRG', 1),
(2617, 168, 'Siquijor', 'SQJ', 1),
(2618, 168, 'Sorsogon', 'SRS', 1),
(2619, 168, 'South Cotabato', 'SCO', 1),
(2620, 168, 'Southern Leyte', 'SLE', 1),
(2621, 168, 'Sultan Kudarat', 'SKU', 1),
(2622, 168, 'Sulu', 'SLU', 1),
(2623, 168, 'Surigao del Norte', 'SNO', 1),
(2624, 168, 'Surigao del Sur', 'SSU', 1),
(2625, 168, 'Tarlac', 'TAR', 1),
(2626, 168, 'Tawi-Tawi', 'TAW', 1),
(2627, 168, 'Zambales', 'ZBL', 1),
(2628, 168, 'Zamboanga del Norte', 'ZNO', 1),
(2629, 168, 'Zamboanga del Sur', 'ZSU', 1),
(2630, 168, 'Zamboanga Sibugay', 'ZSI', 1),
(2631, 170, 'Dolnoslaskie', 'DO', 1),
(2632, 170, 'Kujawsko-Pomorskie', 'KP', 1),
(2633, 170, 'Lodzkie', 'LO', 1),
(2634, 170, 'Lubelskie', 'LL', 1),
(2635, 170, 'Lubuskie', 'LU', 1),
(2636, 170, 'Malopolskie', 'ML', 1),
(2637, 170, 'Mazowieckie', 'MZ', 1),
(2638, 170, 'Opolskie', 'OP', 1),
(2639, 170, 'Podkarpackie', 'PP', 1),
(2640, 170, 'Podlaskie', 'PL', 1),
(2641, 170, 'Pomorskie', 'PM', 1),
(2642, 170, 'Slaskie', 'SL', 1),
(2643, 170, 'Swietokrzyskie', 'SW', 1),
(2644, 170, 'Warminsko-Mazurskie', 'WM', 1),
(2645, 170, 'Wielkopolskie', 'WP', 1),
(2646, 170, 'Zachodniopomorskie', 'ZA', 1),
(2647, 198, 'Saint Pierre', 'P', 1),
(2648, 198, 'Miquelon', 'M', 1),
(2649, 171, 'A&ccedil;ores', 'AC', 1),
(2650, 171, 'Aveiro', 'AV', 1),
(2651, 171, 'Beja', 'BE', 1),
(2652, 171, 'Braga', 'BR', 1),
(2653, 171, 'Bragan&ccedil;a', 'BA', 1),
(2654, 171, 'Castelo Branco', 'CB', 1),
(2655, 171, 'Coimbra', 'CO', 1),
(2656, 171, '&Eacute;vora', 'EV', 1),
(2657, 171, 'Faro', 'FA', 1),
(2658, 171, 'Guarda', 'GU', 1),
(2659, 171, 'Leiria', 'LE', 1),
(2660, 171, 'Lisboa', 'LI', 1),
(2661, 171, 'Madeira', 'ME', 1),
(2662, 171, 'Portalegre', 'PO', 1),
(2663, 171, 'Porto', 'PR', 1),
(2664, 171, 'Santar&eacute;m', 'SA', 1),
(2665, 171, 'Set&uacute;bal', 'SE', 1),
(2666, 171, 'Viana do Castelo', 'VC', 1),
(2667, 171, 'Vila Real', 'VR', 1),
(2668, 171, 'Viseu', 'VI', 1),
(2669, 173, 'Ad Dawhah', 'DW', 1),
(2670, 173, 'Al Ghuwayriyah', 'GW', 1),
(2671, 173, 'Al Jumayliyah', 'JM', 1),
(2672, 173, 'Al Khawr', 'KR', 1),
(2673, 173, 'Al Wakrah', 'WK', 1),
(2674, 173, 'Ar Rayyan', 'RN', 1),
(2675, 173, 'Jarayan al Batinah', 'JB', 1),
(2676, 173, 'Madinat ash Shamal', 'MS', 1),
(2677, 173, 'Umm Sa''id', 'UD', 1),
(2678, 173, 'Umm Salal', 'UL', 1),
(2679, 175, 'Alba', 'AB', 1),
(2680, 175, 'Arad', 'AR', 1),
(2681, 175, 'Arges', 'AG', 1),
(2682, 175, 'Bacau', 'BC', 1),
(2683, 175, 'Bihor', 'BH', 1),
(2684, 175, 'Bistrita-Nasaud', 'BN', 1),
(2685, 175, 'Botosani', 'BT', 1),
(2686, 175, 'Brasov', 'BV', 1),
(2687, 175, 'Braila', 'BR', 1),
(2688, 175, 'Bucuresti', 'B', 1),
(2689, 175, 'Buzau', 'BZ', 1),
(2690, 175, 'Caras-Severin', 'CS', 1),
(2691, 175, 'Calarasi', 'CL', 1),
(2692, 175, 'Cluj', 'CJ', 1),
(2693, 175, 'Constanta', 'CT', 1),
(2694, 175, 'Covasna', 'CV', 1),
(2695, 175, 'Dimbovita', 'DB', 1),
(2696, 175, 'Dolj', 'DJ', 1),
(2697, 175, 'Galati', 'GL', 1),
(2698, 175, 'Giurgiu', 'GR', 1),
(2699, 175, 'Gorj', 'GJ', 1),
(2700, 175, 'Harghita', 'HR', 1),
(2701, 175, 'Hunedoara', 'HD', 1),
(2702, 175, 'Ialomita', 'IL', 1),
(2703, 175, 'Iasi', 'IS', 1),
(2704, 175, 'Ilfov', 'IF', 1),
(2705, 175, 'Maramures', 'MM', 1),
(2706, 175, 'Mehedinti', 'MH', 1),
(2707, 175, 'Mures', 'MS', 1),
(2708, 175, 'Neamt', 'NT', 1),
(2709, 175, 'Olt', 'OT', 1),
(2710, 175, 'Prahova', 'PH', 1),
(2711, 175, 'Satu-Mare', 'SM', 1),
(2712, 175, 'Salaj', 'SJ', 1),
(2713, 175, 'Sibiu', 'SB', 1),
(2714, 175, 'Suceava', 'SV', 1),
(2715, 175, 'Teleorman', 'TR', 1),
(2716, 175, 'Timis', 'TM', 1),
(2717, 175, 'Tulcea', 'TL', 1),
(2718, 175, 'Vaslui', 'VS', 1),
(2719, 175, 'Valcea', 'VL', 1),
(2720, 175, 'Vrancea', 'VN', 1),
(2721, 176, 'Abakan', 'AB', 1),
(2722, 176, 'Aginskoye', 'AG', 1),
(2723, 176, 'Anadyr', 'AN', 1),
(2724, 176, 'Arkahangelsk', 'AR', 1),
(2725, 176, 'Astrakhan', 'AS', 1),
(2726, 176, 'Barnaul', 'BA', 1),
(2727, 176, 'Belgorod', 'BE', 1),
(2728, 176, 'Birobidzhan', 'BI', 1),
(2729, 176, 'Blagoveshchensk', 'BL', 1),
(2730, 176, 'Bryansk', 'BR', 1),
(2731, 176, 'Cheboksary', 'CH', 1),
(2732, 176, 'Chelyabinsk', 'CL', 1),
(2733, 176, 'Cherkessk', 'CR', 1),
(2734, 176, 'Chita', 'CI', 1),
(2735, 176, 'Dudinka', 'DU', 1),
(2736, 176, 'Elista', 'EL', 1),
(2737, 176, 'Gomo-Altaysk', 'GO', 1),
(2738, 176, 'Gorno-Altaysk', 'GA', 1),
(2739, 176, 'Groznyy', 'GR', 1),
(2740, 176, 'Irkutsk', 'IR', 1),
(2741, 176, 'Ivanovo', 'IV', 1),
(2742, 176, 'Izhevsk', 'IZ', 1),
(2743, 176, 'Kalinigrad', 'KA', 1),
(2744, 176, 'Kaluga', 'KL', 1),
(2745, 176, 'Kasnodar', 'KS', 1),
(2746, 176, 'Kazan', 'KZ', 1),
(2747, 176, 'Kemerovo', 'KE', 1),
(2748, 176, 'Khabarovsk', 'KH', 1),
(2749, 176, 'Khanty-Mansiysk', 'KM', 1),
(2750, 176, 'Kostroma', 'KO', 1),
(2751, 176, 'Krasnodar', 'KR', 1),
(2752, 176, 'Krasnoyarsk', 'KN', 1),
(2753, 176, 'Kudymkar', 'KU', 1),
(2754, 176, 'Kurgan', 'KG', 1),
(2755, 176, 'Kursk', 'KK', 1),
(2756, 176, 'Kyzyl', 'KY', 1),
(2757, 176, 'Lipetsk', 'LI', 1),
(2758, 176, 'Magadan', 'MA', 1),
(2759, 176, 'Makhachkala', 'MK', 1),
(2760, 176, 'Maykop', 'MY', 1),
(2761, 176, 'Moscow', 'MO', 1),
(2762, 176, 'Murmansk', 'MU', 1),
(2763, 176, 'Nalchik', 'NA', 1),
(2764, 176, 'Naryan Mar', 'NR', 1),
(2765, 176, 'Nazran', 'NZ', 1),
(2766, 176, 'Nizhniy Novgorod', 'NI', 1),
(2767, 176, 'Novgorod', 'NO', 1),
(2768, 176, 'Novosibirsk', 'NV', 1),
(2769, 176, 'Omsk', 'OM', 1),
(2770, 176, 'Orel', 'OR', 1),
(2771, 176, 'Orenburg', 'OE', 1),
(2772, 176, 'Palana', 'PA', 1),
(2773, 176, 'Penza', 'PE', 1),
(2774, 176, 'Perm', 'PR', 1),
(2775, 176, 'Petropavlovsk-Kamchatskiy', 'PK', 1),
(2776, 176, 'Petrozavodsk', 'PT', 1),
(2777, 176, 'Pskov', 'PS', 1),
(2778, 176, 'Rostov-na-Donu', 'RO', 1),
(2779, 176, 'Ryazan', 'RY', 1),
(2780, 176, 'Salekhard', 'SL', 1),
(2781, 176, 'Samara', 'SA', 1),
(2782, 176, 'Saransk', 'SR', 1),
(2783, 176, 'Saratov', 'SV', 1),
(2784, 176, 'Smolensk', 'SM', 1),
(2785, 176, 'St. Petersburg', 'SP', 1),
(2786, 176, 'Stavropol', 'ST', 1),
(2787, 176, 'Syktyvkar', 'SY', 1),
(2788, 176, 'Tambov', 'TA', 1),
(2789, 176, 'Tomsk', 'TO', 1),
(2790, 176, 'Tula', 'TU', 1),
(2791, 176, 'Tura', 'TR', 1),
(2792, 176, 'Tver', 'TV', 1),
(2793, 176, 'Tyumen', 'TY', 1),
(2794, 176, 'Ufa', 'UF', 1),
(2795, 176, 'Ul''yanovsk', 'UL', 1),
(2796, 176, 'Ulan-Ude', 'UU', 1),
(2797, 176, 'Ust''-Ordynskiy', 'US', 1),
(2798, 176, 'Vladikavkaz', 'VL', 1),
(2799, 176, 'Vladimir', 'VA', 1),
(2800, 176, 'Vladivostok', 'VV', 1),
(2801, 176, 'Volgograd', 'VG', 1),
(2802, 176, 'Vologda', 'VD', 1),
(2803, 176, 'Voronezh', 'VO', 1),
(2804, 176, 'Vyatka', 'VY', 1),
(2805, 176, 'Yakutsk', 'YA', 1),
(2806, 176, 'Yaroslavl', 'YR', 1),
(2807, 176, 'Yekaterinburg', 'YE', 1),
(2808, 176, 'Yoshkar-Ola', 'YO', 1),
(2809, 177, 'Butare', 'BU', 1),
(2810, 177, 'Byumba', 'BY', 1),
(2811, 177, 'Cyangugu', 'CY', 1),
(2812, 177, 'Gikongoro', 'GK', 1),
(2813, 177, 'Gisenyi', 'GS', 1),
(2814, 177, 'Gitarama', 'GT', 1),
(2815, 177, 'Kibungo', 'KG', 1),
(2816, 177, 'Kibuye', 'KY', 1),
(2817, 177, 'Kigali Rurale', 'KR', 1),
(2818, 177, 'Kigali-ville', 'KV', 1),
(2819, 177, 'Ruhengeri', 'RU', 1),
(2820, 177, 'Umutara', 'UM', 1),
(2821, 178, 'Christ Church Nichola Town', 'CCN', 1),
(2822, 178, 'Saint Anne Sandy Point', 'SAS', 1),
(2823, 178, 'Saint George Basseterre', 'SGB', 1),
(2824, 178, 'Saint George Gingerland', 'SGG', 1),
(2825, 178, 'Saint James Windward', 'SJW', 1),
(2826, 178, 'Saint John Capesterre', 'SJC', 1),
(2827, 178, 'Saint John Figtree', 'SJF', 1),
(2828, 178, 'Saint Mary Cayon', 'SMC', 1),
(2829, 178, 'Saint Paul Capesterre', 'CAP', 1),
(2830, 178, 'Saint Paul Charlestown', 'CHA', 1),
(2831, 178, 'Saint Peter Basseterre', 'SPB', 1),
(2832, 178, 'Saint Thomas Lowland', 'STL', 1),
(2833, 178, 'Saint Thomas Middle Island', 'STM', 1),
(2834, 178, 'Trinity Palmetto Point', 'TPP', 1),
(2835, 179, 'Anse-la-Raye', 'AR', 1),
(2836, 179, 'Castries', 'CA', 1),
(2837, 179, 'Choiseul', 'CH', 1),
(2838, 179, 'Dauphin', 'DA', 1),
(2839, 179, 'Dennery', 'DE', 1),
(2840, 179, 'Gros-Islet', 'GI', 1),
(2841, 179, 'Laborie', 'LA', 1),
(2842, 179, 'Micoud', 'MI', 1),
(2843, 179, 'Praslin', 'PR', 1),
(2844, 179, 'Soufriere', 'SO', 1),
(2845, 179, 'Vieux-Fort', 'VF', 1),
(2846, 180, 'Charlotte', 'C', 1),
(2847, 180, 'Grenadines', 'R', 1),
(2848, 180, 'Saint Andrew', 'A', 1),
(2849, 180, 'Saint David', 'D', 1),
(2850, 180, 'Saint George', 'G', 1),
(2851, 180, 'Saint Patrick', 'P', 1),
(2852, 181, 'A''ana', 'AN', 1),
(2853, 181, 'Aiga-i-le-Tai', 'AI', 1),
(2854, 181, 'Atua', 'AT', 1),
(2855, 181, 'Fa''asaleleaga', 'FA', 1),
(2856, 181, 'Gaga''emauga', 'GE', 1),
(2857, 181, 'Gagaifomauga', 'GF', 1),
(2858, 181, 'Palauli', 'PA', 1),
(2859, 181, 'Satupa''itea', 'SA', 1),
(2860, 181, 'Tuamasaga', 'TU', 1),
(2861, 181, 'Va''a-o-Fonoti', 'VF', 1),
(2862, 181, 'Vaisigano', 'VS', 1),
(2863, 182, 'Acquaviva', 'AC', 1),
(2864, 182, 'Borgo Maggiore', 'BM', 1),
(2865, 182, 'Chiesanuova', 'CH', 1),
(2866, 182, 'Domagnano', 'DO', 1),
(2867, 182, 'Faetano', 'FA', 1),
(2868, 182, 'Fiorentino', 'FI', 1),
(2869, 182, 'Montegiardino', 'MO', 1),
(2870, 182, 'Citta di San Marino', 'SM', 1),
(2871, 182, 'Serravalle', 'SE', 1),
(2872, 183, 'Sao Tome', 'S', 1),
(2873, 183, 'Principe', 'P', 1),
(2874, 184, 'Al Bahah', 'BH', 1),
(2875, 184, 'Al Hudud ash Shamaliyah', 'HS', 1),
(2876, 184, 'Al Jawf', 'JF', 1),
(2877, 184, 'Al Madinah', 'MD', 1),
(2878, 184, 'Al Qasim', 'QS', 1),
(2879, 184, 'Ar Riyad', 'RD', 1),
(2880, 184, 'Ash Sharqiyah (Eastern)', 'AQ', 1),
(2881, 184, '''Asir', 'AS', 1),
(2882, 184, 'Ha''il', 'HL', 1),
(2883, 184, 'Jizan', 'JZ', 1),
(2884, 184, 'Makkah', 'ML', 1),
(2885, 184, 'Najran', 'NR', 1),
(2886, 184, 'Tabuk', 'TB', 1),
(2887, 185, 'Dakar', 'DA', 1),
(2888, 185, 'Diourbel', 'DI', 1),
(2889, 185, 'Fatick', 'FA', 1),
(2890, 185, 'Kaolack', 'KA', 1),
(2891, 185, 'Kolda', 'KO', 1),
(2892, 185, 'Louga', 'LO', 1),
(2893, 185, 'Matam', 'MA', 1),
(2894, 185, 'Saint-Louis', 'SL', 1),
(2895, 185, 'Tambacounda', 'TA', 1),
(2896, 185, 'Thies', 'TH', 1),
(2897, 185, 'Ziguinchor', 'ZI', 1),
(2898, 186, 'Anse aux Pins', 'AP', 1),
(2899, 186, 'Anse Boileau', 'AB', 1),
(2900, 186, 'Anse Etoile', 'AE', 1),
(2901, 186, 'Anse Louis', 'AL', 1),
(2902, 186, 'Anse Royale', 'AR', 1),
(2903, 186, 'Baie Lazare', 'BL', 1),
(2904, 186, 'Baie Sainte Anne', 'BS', 1),
(2905, 186, 'Beau Vallon', 'BV', 1),
(2906, 186, 'Bel Air', 'BA', 1),
(2907, 186, 'Bel Ombre', 'BO', 1),
(2908, 186, 'Cascade', 'CA', 1),
(2909, 186, 'Glacis', 'GL', 1),
(2910, 186, 'Grand'' Anse (on Mahe)', 'GM', 1),
(2911, 186, 'Grand'' Anse (on Praslin)', 'GP', 1),
(2912, 186, 'La Digue', 'DG', 1),
(2913, 186, 'La Riviere Anglaise', 'RA', 1),
(2914, 186, 'Mont Buxton', 'MB', 1),
(2915, 186, 'Mont Fleuri', 'MF', 1),
(2916, 186, 'Plaisance', 'PL', 1),
(2917, 186, 'Pointe La Rue', 'PR', 1),
(2918, 186, 'Port Glaud', 'PG', 1),
(2919, 186, 'Saint Louis', 'SL', 1),
(2920, 186, 'Takamaka', 'TA', 1),
(2921, 187, 'Eastern', 'E', 1),
(2922, 187, 'Northern', 'N', 1),
(2923, 187, 'Southern', 'S', 1),
(2924, 187, 'Western', 'W', 1),
(2925, 189, 'Banskobystrický', 'BA', 1),
(2926, 189, 'Bratislavský', 'BR', 1),
(2927, 189, 'Košický', 'KO', 1),
(2928, 189, 'Nitriansky', 'NI', 1),
(2929, 189, 'Prešovský', 'PR', 1),
(2930, 189, 'Trenčiansky', 'TC', 1),
(2931, 189, 'Trnavský', 'TV', 1),
(2932, 189, 'Žilinský', 'ZI', 1),
(2933, 191, 'Central', 'CE', 1),
(2934, 191, 'Choiseul', 'CH', 1),
(2935, 191, 'Guadalcanal', 'GC', 1),
(2936, 191, 'Honiara', 'HO', 1),
(2937, 191, 'Isabel', 'IS', 1),
(2938, 191, 'Makira', 'MK', 1),
(2939, 191, 'Malaita', 'ML', 1),
(2940, 191, 'Rennell and Bellona', 'RB', 1),
(2941, 191, 'Temotu', 'TM', 1),
(2942, 191, 'Western', 'WE', 1),
(2943, 192, 'Awdal', 'AW', 1),
(2944, 192, 'Bakool', 'BK', 1),
(2945, 192, 'Banaadir', 'BN', 1),
(2946, 192, 'Bari', 'BR', 1),
(2947, 192, 'Bay', 'BY', 1),
(2948, 192, 'Galguduud', 'GA', 1),
(2949, 192, 'Gedo', 'GE', 1),
(2950, 192, 'Hiiraan', 'HI', 1),
(2951, 192, 'Jubbada Dhexe', 'JD', 1),
(2952, 192, 'Jubbada Hoose', 'JH', 1),
(2953, 192, 'Mudug', 'MU', 1),
(2954, 192, 'Nugaal', 'NU', 1),
(2955, 192, 'Sanaag', 'SA', 1),
(2956, 192, 'Shabeellaha Dhexe', 'SD', 1),
(2957, 192, 'Shabeellaha Hoose', 'SH', 1),
(2958, 192, 'Sool', 'SL', 1),
(2959, 192, 'Togdheer', 'TO', 1),
(2960, 192, 'Woqooyi Galbeed', 'WG', 1),
(2961, 193, 'Eastern Cape', 'EC', 1),
(2962, 193, 'Free State', 'FS', 1),
(2963, 193, 'Gauteng', 'GT', 1),
(2964, 193, 'KwaZulu-Natal', 'KN', 1),
(2965, 193, 'Limpopo', 'LP', 1),
(2966, 193, 'Mpumalanga', 'MP', 1),
(2967, 193, 'North West', 'NW', 1),
(2968, 193, 'Northern Cape', 'NC', 1),
(2969, 193, 'Western Cape', 'WC', 1),
(2970, 195, 'La Coru&ntilde;a', 'CA', 1),
(2971, 195, '&Aacute;lava', 'AL', 1),
(2972, 195, 'Albacete', 'AB', 1),
(2973, 195, 'Alicante', 'AC', 1),
(2974, 195, 'Almeria', 'AM', 1),
(2975, 195, 'Asturias', 'AS', 1),
(2976, 195, '&Aacute;vila', 'AV', 1),
(2977, 195, 'Badajoz', 'BJ', 1),
(2978, 195, 'Baleares', 'IB', 1),
(2979, 195, 'Barcelona', 'BA', 1),
(2980, 195, 'Burgos', 'BU', 1),
(2981, 195, 'C&aacute;ceres', 'CC', 1),
(2982, 195, 'C&aacute;diz', 'CZ', 1),
(2983, 195, 'Cantabria', 'CT', 1),
(2984, 195, 'Castell&oacute;n', 'CL', 1),
(2985, 195, 'Ceuta', 'CE', 1),
(2986, 195, 'Ciudad Real', 'CR', 1),
(2987, 195, 'C&oacute;rdoba', 'CD', 1),
(2988, 195, 'Cuenca', 'CU', 1),
(2989, 195, 'Girona', 'GI', 1),
(2990, 195, 'Granada', 'GD', 1),
(2991, 195, 'Guadalajara', 'GJ', 1),
(2992, 195, 'Guip&uacute;zcoa', 'GP', 1),
(2993, 195, 'Huelva', 'HL', 1),
(2994, 195, 'Huesca', 'HS', 1),
(2995, 195, 'Ja&eacute;n', 'JN', 1),
(2996, 195, 'La Rioja', 'RJ', 1),
(2997, 195, 'Las Palmas', 'PM', 1),
(2998, 195, 'Leon', 'LE', 1),
(2999, 195, 'Lleida', 'LL', 1),
(3000, 195, 'Lugo', 'LG', 1),
(3001, 195, 'Madrid', 'MD', 1),
(3002, 195, 'Malaga', 'MA', 1),
(3003, 195, 'Melilla', 'ML', 1),
(3004, 195, 'Murcia', 'MU', 1),
(3005, 195, 'Navarra', 'NV', 1),
(3006, 195, 'Ourense', 'OU', 1),
(3007, 195, 'Palencia', 'PL', 1),
(3008, 195, 'Pontevedra', 'PO', 1),
(3009, 195, 'Salamanca', 'SL', 1),
(3010, 195, 'Santa Cruz de Tenerife', 'SC', 1),
(3011, 195, 'Segovia', 'SG', 1),
(3012, 195, 'Sevilla', 'SV', 1),
(3013, 195, 'Soria', 'SO', 1),
(3014, 195, 'Tarragona', 'TA', 1),
(3015, 195, 'Teruel', 'TE', 1),
(3016, 195, 'Toledo', 'TO', 1),
(3017, 195, 'Valencia', 'VC', 1),
(3018, 195, 'Valladolid', 'VD', 1),
(3019, 195, 'Vizcaya', 'VZ', 1),
(3020, 195, 'Zamora', 'ZM', 1),
(3021, 195, 'Zaragoza', 'ZR', 1),
(3022, 196, 'Central', 'CE', 1),
(3023, 196, 'Eastern', 'EA', 1),
(3024, 196, 'North Central', 'NC', 1),
(3025, 196, 'Northern', 'NO', 1),
(3026, 196, 'North Western', 'NW', 1),
(3027, 196, 'Sabaragamuwa', 'SA', 1),
(3028, 196, 'Southern', 'SO', 1),
(3029, 196, 'Uva', 'UV', 1),
(3030, 196, 'Western', 'WE', 1),
(3032, 197, 'Saint Helena', 'S', 1),
(3034, 199, 'A''ali an Nil', 'ANL', 1),
(3035, 199, 'Al Bahr al Ahmar', 'BAM', 1),
(3036, 199, 'Al Buhayrat', 'BRT', 1),
(3037, 199, 'Al Jazirah', 'JZR', 1),
(3038, 199, 'Al Khartum', 'KRT', 1),
(3039, 199, 'Al Qadarif', 'QDR', 1),
(3040, 199, 'Al Wahdah', 'WDH', 1),
(3041, 199, 'An Nil al Abyad', 'ANB', 1),
(3042, 199, 'An Nil al Azraq', 'ANZ', 1),
(3043, 199, 'Ash Shamaliyah', 'ASH', 1),
(3044, 199, 'Bahr al Jabal', 'BJA', 1),
(3045, 199, 'Gharb al Istiwa''iyah', 'GIS', 1),
(3046, 199, 'Gharb Bahr al Ghazal', 'GBG', 1),
(3047, 199, 'Gharb Darfur', 'GDA', 1),
(3048, 199, 'Gharb Kurdufan', 'GKU', 1),
(3049, 199, 'Janub Darfur', 'JDA', 1),
(3050, 199, 'Janub Kurdufan', 'JKU', 1),
(3051, 199, 'Junqali', 'JQL', 1),
(3052, 199, 'Kassala', 'KSL', 1),
(3053, 199, 'Nahr an Nil', 'NNL', 1),
(3054, 199, 'Shamal Bahr al Ghazal', 'SBG', 1),
(3055, 199, 'Shamal Darfur', 'SDA', 1),
(3056, 199, 'Shamal Kurdufan', 'SKU', 1),
(3057, 199, 'Sharq al Istiwa''iyah', 'SIS', 1),
(3058, 199, 'Sinnar', 'SNR', 1),
(3059, 199, 'Warab', 'WRB', 1),
(3060, 200, 'Brokopondo', 'BR', 1),
(3061, 200, 'Commewijne', 'CM', 1),
(3062, 200, 'Coronie', 'CR', 1),
(3063, 200, 'Marowijne', 'MA', 1),
(3064, 200, 'Nickerie', 'NI', 1),
(3065, 200, 'Para', 'PA', 1),
(3066, 200, 'Paramaribo', 'PM', 1),
(3067, 200, 'Saramacca', 'SA', 1),
(3068, 200, 'Sipaliwini', 'SI', 1),
(3069, 200, 'Wanica', 'WA', 1),
(3070, 202, 'Hhohho', 'H', 1),
(3071, 202, 'Lubombo', 'L', 1),
(3072, 202, 'Manzini', 'M', 1),
(3073, 202, 'Shishelweni', 'S', 1),
(3074, 203, 'Blekinge', 'K', 1),
(3075, 203, 'Dalarna', 'W', 1),
(3076, 203, 'G&auml;vleborg', 'X', 1),
(3077, 203, 'Gotland', 'I', 1),
(3078, 203, 'Halland', 'N', 1),
(3079, 203, 'J&auml;mtland', 'Z', 1),
(3080, 203, 'J&ouml;nk&ouml;ping', 'F', 1),
(3081, 203, 'Kalmar', 'H', 1),
(3082, 203, 'Kronoberg', 'G', 1),
(3083, 203, 'Norrbotten', 'BD', 1),
(3084, 203, '&Ouml;rebro', 'T', 1),
(3085, 203, '&Ouml;sterg&ouml;tland', 'E', 1),
(3086, 203, 'Sk&aring;ne', 'M', 1),
(3087, 203, 'S&ouml;dermanland', 'D', 1),
(3088, 203, 'Stockholm', 'AB', 1),
(3089, 203, 'Uppsala', 'C', 1),
(3090, 203, 'V&auml;rmland', 'S', 1),
(3091, 203, 'V&auml;sterbotten', 'AC', 1),
(3092, 203, 'V&auml;sternorrland', 'Y', 1),
(3093, 203, 'V&auml;stmanland', 'U', 1),
(3094, 203, 'V&auml;stra G&ouml;taland', 'O', 1),
(3095, 204, 'Aargau', 'AG', 1),
(3096, 204, 'Appenzell Ausserrhoden', 'AR', 1),
(3097, 204, 'Appenzell Innerrhoden', 'AI', 1),
(3098, 204, 'Basel-Stadt', 'BS', 1),
(3099, 204, 'Basel-Landschaft', 'BL', 1),
(3100, 204, 'Bern', 'BE', 1),
(3101, 204, 'Fribourg', 'FR', 1),
(3102, 204, 'Gen&egrave;ve', 'GE', 1),
(3103, 204, 'Glarus', 'GL', 1),
(3104, 204, 'Graub&uuml;nden', 'GR', 1),
(3105, 204, 'Jura', 'JU', 1),
(3106, 204, 'Luzern', 'LU', 1),
(3107, 204, 'Neuch&acirc;tel', 'NE', 1),
(3108, 204, 'Nidwald', 'NW', 1),
(3109, 204, 'Obwald', 'OW', 1),
(3110, 204, 'St. Gallen', 'SG', 1),
(3111, 204, 'Schaffhausen', 'SH', 1),
(3112, 204, 'Schwyz', 'SZ', 1),
(3113, 204, 'Solothurn', 'SO', 1),
(3114, 204, 'Thurgau', 'TG', 1),
(3115, 204, 'Ticino', 'TI', 1),
(3116, 204, 'Uri', 'UR', 1),
(3117, 204, 'Valais', 'VS', 1),
(3118, 204, 'Vaud', 'VD', 1),
(3119, 204, 'Zug', 'ZG', 1),
(3120, 204, 'Z&uuml;rich', 'ZH', 1),
(3121, 205, 'Al Hasakah', 'HA', 1),
(3122, 205, 'Al Ladhiqiyah', 'LA', 1),
(3123, 205, 'Al Qunaytirah', 'QU', 1),
(3124, 205, 'Ar Raqqah', 'RQ', 1),
(3125, 205, 'As Suwayda', 'SU', 1),
(3126, 205, 'Dara', 'DA', 1),
(3127, 205, 'Dayr az Zawr', 'DZ', 1),
(3128, 205, 'Dimashq', 'DI', 1),
(3129, 205, 'Halab', 'HL', 1);
INSERT INTO `ma_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(3130, 205, 'Hamah', 'HM', 1),
(3131, 205, 'Hims', 'HI', 1),
(3132, 205, 'Idlib', 'ID', 1),
(3133, 205, 'Rif Dimashq', 'RD', 1),
(3134, 205, 'Tartus', 'TA', 1),
(3135, 206, 'Chang-hua', 'CH', 1),
(3136, 206, 'Chia-i', 'CI', 1),
(3137, 206, 'Hsin-chu', 'HS', 1),
(3138, 206, 'Hua-lien', 'HL', 1),
(3139, 206, 'I-lan', 'IL', 1),
(3140, 206, 'Kao-hsiung county', 'KH', 1),
(3141, 206, 'Kin-men', 'KM', 1),
(3142, 206, 'Lien-chiang', 'LC', 1),
(3143, 206, 'Miao-li', 'ML', 1),
(3144, 206, 'Nan-t''ou', 'NT', 1),
(3145, 206, 'P''eng-hu', 'PH', 1),
(3146, 206, 'P''ing-tung', 'PT', 1),
(3147, 206, 'T''ai-chung', 'TG', 1),
(3148, 206, 'T''ai-nan', 'TA', 1),
(3149, 206, 'T''ai-pei county', 'TP', 1),
(3150, 206, 'T''ai-tung', 'TT', 1),
(3151, 206, 'T''ao-yuan', 'TY', 1),
(3152, 206, 'Yun-lin', 'YL', 1),
(3153, 206, 'Chia-i city', 'CC', 1),
(3154, 206, 'Chi-lung', 'CL', 1),
(3155, 206, 'Hsin-chu', 'HC', 1),
(3156, 206, 'T''ai-chung', 'TH', 1),
(3157, 206, 'T''ai-nan', 'TN', 1),
(3158, 206, 'Kao-hsiung city', 'KC', 1),
(3159, 206, 'T''ai-pei city', 'TC', 1),
(3160, 207, 'Gorno-Badakhstan', 'GB', 1),
(3161, 207, 'Khatlon', 'KT', 1),
(3162, 207, 'Sughd', 'SU', 1),
(3163, 208, 'Arusha', 'AR', 1),
(3164, 208, 'Dar es Salaam', 'DS', 1),
(3165, 208, 'Dodoma', 'DO', 1),
(3166, 208, 'Iringa', 'IR', 1),
(3167, 208, 'Kagera', 'KA', 1),
(3168, 208, 'Kigoma', 'KI', 1),
(3169, 208, 'Kilimanjaro', 'KJ', 1),
(3170, 208, 'Lindi', 'LN', 1),
(3171, 208, 'Manyara', 'MY', 1),
(3172, 208, 'Mara', 'MR', 1),
(3173, 208, 'Mbeya', 'MB', 1),
(3174, 208, 'Morogoro', 'MO', 1),
(3175, 208, 'Mtwara', 'MT', 1),
(3176, 208, 'Mwanza', 'MW', 1),
(3177, 208, 'Pemba North', 'PN', 1),
(3178, 208, 'Pemba South', 'PS', 1),
(3179, 208, 'Pwani', 'PW', 1),
(3180, 208, 'Rukwa', 'RK', 1),
(3181, 208, 'Ruvuma', 'RV', 1),
(3182, 208, 'Shinyanga', 'SH', 1),
(3183, 208, 'Singida', 'SI', 1),
(3184, 208, 'Tabora', 'TB', 1),
(3185, 208, 'Tanga', 'TN', 1),
(3186, 208, 'Zanzibar Central/South', 'ZC', 1),
(3187, 208, 'Zanzibar North', 'ZN', 1),
(3188, 208, 'Zanzibar Urban/West', 'ZU', 1),
(3189, 209, 'Amnat Charoen', 'Amnat Charoen', 1),
(3190, 209, 'Ang Thong', 'Ang Thong', 1),
(3191, 209, 'Ayutthaya', 'Ayutthaya', 1),
(3192, 209, 'Bangkok', 'Bangkok', 1),
(3193, 209, 'Buriram', 'Buriram', 1),
(3194, 209, 'Chachoengsao', 'Chachoengsao', 1),
(3195, 209, 'Chai Nat', 'Chai Nat', 1),
(3196, 209, 'Chaiyaphum', 'Chaiyaphum', 1),
(3197, 209, 'Chanthaburi', 'Chanthaburi', 1),
(3198, 209, 'Chiang Mai', 'Chiang Mai', 1),
(3199, 209, 'Chiang Rai', 'Chiang Rai', 1),
(3200, 209, 'Chon Buri', 'Chon Buri', 1),
(3201, 209, 'Chumphon', 'Chumphon', 1),
(3202, 209, 'Kalasin', 'Kalasin', 1),
(3203, 209, 'Kamphaeng Phet', 'Kamphaeng Phet', 1),
(3204, 209, 'Kanchanaburi', 'Kanchanaburi', 1),
(3205, 209, 'Khon Kaen', 'Khon Kaen', 1),
(3206, 209, 'Krabi', 'Krabi', 1),
(3207, 209, 'Lampang', 'Lampang', 1),
(3208, 209, 'Lamphun', 'Lamphun', 1),
(3209, 209, 'Loei', 'Loei', 1),
(3210, 209, 'Lop Buri', 'Lop Buri', 1),
(3211, 209, 'Mae Hong Son', 'Mae Hong Son', 1),
(3212, 209, 'Maha Sarakham', 'Maha Sarakham', 1),
(3213, 209, 'Mukdahan', 'Mukdahan', 1),
(3214, 209, 'Nakhon Nayok', 'Nakhon Nayok', 1),
(3215, 209, 'Nakhon Pathom', 'Nakhon Pathom', 1),
(3216, 209, 'Nakhon Phanom', 'Nakhon Phanom', 1),
(3217, 209, 'Nakhon Ratchasima', 'Nakhon Ratchasima', 1),
(3218, 209, 'Nakhon Sawan', 'Nakhon Sawan', 1),
(3219, 209, 'Nakhon Si Thammarat', 'Nakhon Si Thammarat', 1),
(3220, 209, 'Nan', 'Nan', 1),
(3221, 209, 'Narathiwat', 'Narathiwat', 1),
(3222, 209, 'Nong Bua Lamphu', 'Nong Bua Lamphu', 1),
(3223, 209, 'Nong Khai', 'Nong Khai', 1),
(3224, 209, 'Nonthaburi', 'Nonthaburi', 1),
(3225, 209, 'Pathum Thani', 'Pathum Thani', 1),
(3226, 209, 'Pattani', 'Pattani', 1),
(3227, 209, 'Phangnga', 'Phangnga', 1),
(3228, 209, 'Phatthalung', 'Phatthalung', 1),
(3229, 209, 'Phayao', 'Phayao', 1),
(3230, 209, 'Phetchabun', 'Phetchabun', 1),
(3231, 209, 'Phetchaburi', 'Phetchaburi', 1),
(3232, 209, 'Phichit', 'Phichit', 1),
(3233, 209, 'Phitsanulok', 'Phitsanulok', 1),
(3234, 209, 'Phrae', 'Phrae', 1),
(3235, 209, 'Phuket', 'Phuket', 1),
(3236, 209, 'Prachin Buri', 'Prachin Buri', 1),
(3237, 209, 'Prachuap Khiri Khan', 'Prachuap Khiri Khan', 1),
(3238, 209, 'Ranong', 'Ranong', 1),
(3239, 209, 'Ratchaburi', 'Ratchaburi', 1),
(3240, 209, 'Rayong', 'Rayong', 1),
(3241, 209, 'Roi Et', 'Roi Et', 1),
(3242, 209, 'Sa Kaeo', 'Sa Kaeo', 1),
(3243, 209, 'Sakon Nakhon', 'Sakon Nakhon', 1),
(3244, 209, 'Samut Prakan', 'Samut Prakan', 1),
(3245, 209, 'Samut Sakhon', 'Samut Sakhon', 1),
(3246, 209, 'Samut Songkhram', 'Samut Songkhram', 1),
(3247, 209, 'Sara Buri', 'Sara Buri', 1),
(3248, 209, 'Satun', 'Satun', 1),
(3249, 209, 'Sing Buri', 'Sing Buri', 1),
(3250, 209, 'Sisaket', 'Sisaket', 1),
(3251, 209, 'Songkhla', 'Songkhla', 1),
(3252, 209, 'Sukhothai', 'Sukhothai', 1),
(3253, 209, 'Suphan Buri', 'Suphan Buri', 1),
(3254, 209, 'Surat Thani', 'Surat Thani', 1),
(3255, 209, 'Surin', 'Surin', 1),
(3256, 209, 'Tak', 'Tak', 1),
(3257, 209, 'Trang', 'Trang', 1),
(3258, 209, 'Trat', 'Trat', 1),
(3259, 209, 'Ubon Ratchathani', 'Ubon Ratchathani', 1),
(3260, 209, 'Udon Thani', 'Udon Thani', 1),
(3261, 209, 'Uthai Thani', 'Uthai Thani', 1),
(3262, 209, 'Uttaradit', 'Uttaradit', 1),
(3263, 209, 'Yala', 'Yala', 1),
(3264, 209, 'Yasothon', 'Yasothon', 1),
(3265, 210, 'Kara', 'K', 1),
(3266, 210, 'Plateaux', 'P', 1),
(3267, 210, 'Savanes', 'S', 1),
(3268, 210, 'Centrale', 'C', 1),
(3269, 210, 'Maritime', 'M', 1),
(3270, 211, 'Atafu', 'A', 1),
(3271, 211, 'Fakaofo', 'F', 1),
(3272, 211, 'Nukunonu', 'N', 1),
(3273, 212, 'Ha''apai', 'H', 1),
(3274, 212, 'Tongatapu', 'T', 1),
(3275, 212, 'Vava''u', 'V', 1),
(3276, 213, 'Couva/Tabaquite/Talparo', 'CT', 1),
(3277, 213, 'Diego Martin', 'DM', 1),
(3278, 213, 'Mayaro/Rio Claro', 'MR', 1),
(3279, 213, 'Penal/Debe', 'PD', 1),
(3280, 213, 'Princes Town', 'PT', 1),
(3281, 213, 'Sangre Grande', 'SG', 1),
(3282, 213, 'San Juan/Laventille', 'SL', 1),
(3283, 213, 'Siparia', 'SI', 1),
(3284, 213, 'Tunapuna/Piarco', 'TP', 1),
(3285, 213, 'Port of Spain', 'PS', 1),
(3286, 213, 'San Fernando', 'SF', 1),
(3287, 213, 'Arima', 'AR', 1),
(3288, 213, 'Point Fortin', 'PF', 1),
(3289, 213, 'Chaguanas', 'CH', 1),
(3290, 213, 'Tobago', 'TO', 1),
(3291, 214, 'Ariana', 'AR', 1),
(3292, 214, 'Beja', 'BJ', 1),
(3293, 214, 'Ben Arous', 'BA', 1),
(3294, 214, 'Bizerte', 'BI', 1),
(3295, 214, 'Gabes', 'GB', 1),
(3296, 214, 'Gafsa', 'GF', 1),
(3297, 214, 'Jendouba', 'JE', 1),
(3298, 214, 'Kairouan', 'KR', 1),
(3299, 214, 'Kasserine', 'KS', 1),
(3300, 214, 'Kebili', 'KB', 1),
(3301, 214, 'Kef', 'KF', 1),
(3302, 214, 'Mahdia', 'MH', 1),
(3303, 214, 'Manouba', 'MN', 1),
(3304, 214, 'Medenine', 'ME', 1),
(3305, 214, 'Monastir', 'MO', 1),
(3306, 214, 'Nabeul', 'NA', 1),
(3307, 214, 'Sfax', 'SF', 1),
(3308, 214, 'Sidi', 'SD', 1),
(3309, 214, 'Siliana', 'SL', 1),
(3310, 214, 'Sousse', 'SO', 1),
(3311, 214, 'Tataouine', 'TA', 1),
(3312, 214, 'Tozeur', 'TO', 1),
(3313, 214, 'Tunis', 'TU', 1),
(3314, 214, 'Zaghouan', 'ZA', 1),
(3315, 215, 'Adana', 'ADA', 1),
(3316, 215, 'Adıyaman', 'ADI', 1),
(3317, 215, 'Afyonkarahisar', 'AFY', 1),
(3318, 215, 'Ağrı', 'AGR', 1),
(3319, 215, 'Aksaray', 'AKS', 1),
(3320, 215, 'Amasya', 'AMA', 1),
(3321, 215, 'Ankara', 'ANK', 1),
(3322, 215, 'Antalya', 'ANT', 1),
(3323, 215, 'Ardahan', 'ARD', 1),
(3324, 215, 'Artvin', 'ART', 1),
(3325, 215, 'Aydın', 'AYI', 1),
(3326, 215, 'Balıkesir', 'BAL', 1),
(3327, 215, 'Bartın', 'BAR', 1),
(3328, 215, 'Batman', 'BAT', 1),
(3329, 215, 'Bayburt', 'BAY', 1),
(3330, 215, 'Bilecik', 'BIL', 1),
(3331, 215, 'Bingöl', 'BIN', 1),
(3332, 215, 'Bitlis', 'BIT', 1),
(3333, 215, 'Bolu', 'BOL', 1),
(3334, 215, 'Burdur', 'BRD', 1),
(3335, 215, 'Bursa', 'BRS', 1),
(3336, 215, 'Çanakkale', 'CKL', 1),
(3337, 215, 'Çankırı', 'CKR', 1),
(3338, 215, 'Çorum', 'COR', 1),
(3339, 215, 'Denizli', 'DEN', 1),
(3340, 215, 'Diyarbakır', 'DIY', 1),
(3341, 215, 'Düzce', 'DUZ', 1),
(3342, 215, 'Edirne', 'EDI', 1),
(3343, 215, 'Elazığ', 'ELA', 1),
(3344, 215, 'Erzincan', 'EZC', 1),
(3345, 215, 'Erzurum', 'EZR', 1),
(3346, 215, 'Eskişehir', 'ESK', 1),
(3347, 215, 'Gaziantep', 'GAZ', 1),
(3348, 215, 'Giresun', 'GIR', 1),
(3349, 215, 'Gümüşhane', 'GMS', 1),
(3350, 215, 'Hakkari', 'HKR', 1),
(3351, 215, 'Hatay', 'HTY', 1),
(3352, 215, 'Iğdır', 'IGD', 1),
(3353, 215, 'Isparta', 'ISP', 1),
(3354, 215, 'İstanbul', 'IST', 1),
(3355, 215, 'İzmir', 'IZM', 1),
(3356, 215, 'Kahramanmaraş', 'KAH', 1),
(3357, 215, 'Karabük', 'KRB', 1),
(3358, 215, 'Karaman', 'KRM', 1),
(3359, 215, 'Kars', 'KRS', 1),
(3360, 215, 'Kastamonu', 'KAS', 1),
(3361, 215, 'Kayseri', 'KAY', 1),
(3362, 215, 'Kilis', 'KLS', 1),
(3363, 215, 'Kırıkkale', 'KRK', 1),
(3364, 215, 'Kırklareli', 'KLR', 1),
(3365, 215, 'Kırşehir', 'KRH', 1),
(3366, 215, 'Kocaeli', 'KOC', 1),
(3367, 215, 'Konya', 'KON', 1),
(3368, 215, 'Kütahya', 'KUT', 1),
(3369, 215, 'Malatya', 'MAL', 1),
(3370, 215, 'Manisa', 'MAN', 1),
(3371, 215, 'Mardin', 'MAR', 1),
(3372, 215, 'Mersin', 'MER', 1),
(3373, 215, 'Muğla', 'MUG', 1),
(3374, 215, 'Muş', 'MUS', 1),
(3375, 215, 'Nevşehir', 'NEV', 1),
(3376, 215, 'Niğde', 'NIG', 1),
(3377, 215, 'Ordu', 'ORD', 1),
(3378, 215, 'Osmaniye', 'OSM', 1),
(3379, 215, 'Rize', 'RIZ', 1),
(3380, 215, 'Sakarya', 'SAK', 1),
(3381, 215, 'Samsun', 'SAM', 1),
(3382, 215, 'Şanlıurfa', 'SAN', 1),
(3383, 215, 'Siirt', 'SII', 1),
(3384, 215, 'Sinop', 'SIN', 1),
(3385, 215, 'Şırnak', 'SIR', 1),
(3386, 215, 'Sivas', 'SIV', 1),
(3387, 215, 'Tekirdağ', 'TEL', 1),
(3388, 215, 'Tokat', 'TOK', 1),
(3389, 215, 'Trabzon', 'TRA', 1),
(3390, 215, 'Tunceli', 'TUN', 1),
(3391, 215, 'Uşak', 'USK', 1),
(3392, 215, 'Van', 'VAN', 1),
(3393, 215, 'Yalova', 'YAL', 1),
(3394, 215, 'Yozgat', 'YOZ', 1),
(3395, 215, 'Zonguldak', 'ZON', 1),
(3396, 216, 'Ahal Welayaty', 'A', 1),
(3397, 216, 'Balkan Welayaty', 'B', 1),
(3398, 216, 'Dashhowuz Welayaty', 'D', 1),
(3399, 216, 'Lebap Welayaty', 'L', 1),
(3400, 216, 'Mary Welayaty', 'M', 1),
(3401, 217, 'Ambergris Cays', 'AC', 1),
(3402, 217, 'Dellis Cay', 'DC', 1),
(3403, 217, 'French Cay', 'FC', 1),
(3404, 217, 'Little Water Cay', 'LW', 1),
(3405, 217, 'Parrot Cay', 'RC', 1),
(3406, 217, 'Pine Cay', 'PN', 1),
(3407, 217, 'Salt Cay', 'SL', 1),
(3408, 217, 'Grand Turk', 'GT', 1),
(3409, 217, 'South Caicos', 'SC', 1),
(3410, 217, 'East Caicos', 'EC', 1),
(3411, 217, 'Middle Caicos', 'MC', 1),
(3412, 217, 'North Caicos', 'NC', 1),
(3413, 217, 'Providenciales', 'PR', 1),
(3414, 217, 'West Caicos', 'WC', 1),
(3415, 218, 'Nanumanga', 'NMG', 1),
(3416, 218, 'Niulakita', 'NLK', 1),
(3417, 218, 'Niutao', 'NTO', 1),
(3418, 218, 'Funafuti', 'FUN', 1),
(3419, 218, 'Nanumea', 'NME', 1),
(3420, 218, 'Nui', 'NUI', 1),
(3421, 218, 'Nukufetau', 'NFT', 1),
(3422, 218, 'Nukulaelae', 'NLL', 1),
(3423, 218, 'Vaitupu', 'VAI', 1),
(3424, 219, 'Kalangala', 'KAL', 1),
(3425, 219, 'Kampala', 'KMP', 1),
(3426, 219, 'Kayunga', 'KAY', 1),
(3427, 219, 'Kiboga', 'KIB', 1),
(3428, 219, 'Luwero', 'LUW', 1),
(3429, 219, 'Masaka', 'MAS', 1),
(3430, 219, 'Mpigi', 'MPI', 1),
(3431, 219, 'Mubende', 'MUB', 1),
(3432, 219, 'Mukono', 'MUK', 1),
(3433, 219, 'Nakasongola', 'NKS', 1),
(3434, 219, 'Rakai', 'RAK', 1),
(3435, 219, 'Sembabule', 'SEM', 1),
(3436, 219, 'Wakiso', 'WAK', 1),
(3437, 219, 'Bugiri', 'BUG', 1),
(3438, 219, 'Busia', 'BUS', 1),
(3439, 219, 'Iganga', 'IGA', 1),
(3440, 219, 'Jinja', 'JIN', 1),
(3441, 219, 'Kaberamaido', 'KAB', 1),
(3442, 219, 'Kamuli', 'KML', 1),
(3443, 219, 'Kapchorwa', 'KPC', 1),
(3444, 219, 'Katakwi', 'KTK', 1),
(3445, 219, 'Kumi', 'KUM', 1),
(3446, 219, 'Mayuge', 'MAY', 1),
(3447, 219, 'Mbale', 'MBA', 1),
(3448, 219, 'Pallisa', 'PAL', 1),
(3449, 219, 'Sironko', 'SIR', 1),
(3450, 219, 'Soroti', 'SOR', 1),
(3451, 219, 'Tororo', 'TOR', 1),
(3452, 219, 'Adjumani', 'ADJ', 1),
(3453, 219, 'Apac', 'APC', 1),
(3454, 219, 'Arua', 'ARU', 1),
(3455, 219, 'Gulu', 'GUL', 1),
(3456, 219, 'Kitgum', 'KIT', 1),
(3457, 219, 'Kotido', 'KOT', 1),
(3458, 219, 'Lira', 'LIR', 1),
(3459, 219, 'Moroto', 'MRT', 1),
(3460, 219, 'Moyo', 'MOY', 1),
(3461, 219, 'Nakapiripirit', 'NAK', 1),
(3462, 219, 'Nebbi', 'NEB', 1),
(3463, 219, 'Pader', 'PAD', 1),
(3464, 219, 'Yumbe', 'YUM', 1),
(3465, 219, 'Bundibugyo', 'BUN', 1),
(3466, 219, 'Bushenyi', 'BSH', 1),
(3467, 219, 'Hoima', 'HOI', 1),
(3468, 219, 'Kabale', 'KBL', 1),
(3469, 219, 'Kabarole', 'KAR', 1),
(3470, 219, 'Kamwenge', 'KAM', 1),
(3471, 219, 'Kanungu', 'KAN', 1),
(3472, 219, 'Kasese', 'KAS', 1),
(3473, 219, 'Kibaale', 'KBA', 1),
(3474, 219, 'Kisoro', 'KIS', 1),
(3475, 219, 'Kyenjojo', 'KYE', 1),
(3476, 219, 'Masindi', 'MSN', 1),
(3477, 219, 'Mbarara', 'MBR', 1),
(3478, 219, 'Ntungamo', 'NTU', 1),
(3479, 219, 'Rukungiri', 'RUK', 1),
(3480, 220, 'Cherkas''ka Oblast''', '71', 1),
(3481, 220, 'Chernihivs''ka Oblast''', '74', 1),
(3482, 220, 'Chernivets''ka Oblast''', '77', 1),
(3483, 220, 'Crimea', '43', 1),
(3484, 220, 'Dnipropetrovs''ka Oblast''', '12', 1),
(3485, 220, 'Donets''ka Oblast''', '14', 1),
(3486, 220, 'Ivano-Frankivs''ka Oblast''', '26', 1),
(3487, 220, 'Khersons''ka Oblast''', '65', 1),
(3488, 220, 'Khmel''nyts''ka Oblast''', '68', 1),
(3489, 220, 'Kirovohrads''ka Oblast''', '35', 1),
(3490, 220, 'Kyiv', '30', 1),
(3491, 220, 'Kyivs''ka Oblast''', '32', 1),
(3492, 220, 'Luhans''ka Oblast''', '09', 1),
(3493, 220, 'L''vivs''ka Oblast''', '46', 1),
(3494, 220, 'Mykolayivs''ka Oblast''', '48', 1),
(3495, 220, 'Odes''ka Oblast''', '51', 1),
(3496, 220, 'Poltavs''ka Oblast''', '53', 1),
(3497, 220, 'Rivnens''ka Oblast''', '56', 1),
(3498, 220, 'Sevastopol''', '40', 1),
(3499, 220, 'Sums''ka Oblast''', '59', 1),
(3500, 220, 'Ternopil''s''ka Oblast''', '61', 1),
(3501, 220, 'Vinnyts''ka Oblast''', '05', 1),
(3502, 220, 'Volyns''ka Oblast''', '07', 1),
(3503, 220, 'Zakarpats''ka Oblast''', '21', 1),
(3504, 220, 'Zaporiz''ka Oblast''', '23', 1),
(3505, 220, 'Zhytomyrs''ka oblast''', '18', 1),
(3506, 221, 'Abu Dhabi', 'ADH', 1),
(3507, 221, '''Ajman', 'AJ', 1),
(3508, 221, 'Al Fujayrah', 'FU', 1),
(3509, 221, 'Ash Shariqah', 'SH', 1),
(3510, 221, 'Dubai', 'DU', 1),
(3511, 221, 'R''as al Khaymah', 'RK', 1),
(3512, 221, 'Umm al Qaywayn', 'UQ', 1),
(3513, 222, 'Aberdeen', 'ABN', 1),
(3514, 222, 'Aberdeenshire', 'ABNS', 1),
(3515, 222, 'Anglesey', 'ANG', 1),
(3516, 222, 'Angus', 'AGS', 1),
(3517, 222, 'Argyll and Bute', 'ARY', 1),
(3518, 222, 'Bedfordshire', 'BEDS', 1),
(3519, 222, 'Berkshire', 'BERKS', 1),
(3520, 222, 'Blaenau Gwent', 'BLA', 1),
(3521, 222, 'Bridgend', 'BRI', 1),
(3522, 222, 'Bristol', 'BSTL', 1),
(3523, 222, 'Buckinghamshire', 'BUCKS', 1),
(3524, 222, 'Caerphilly', 'CAE', 1),
(3525, 222, 'Cambridgeshire', 'CAMBS', 1),
(3526, 222, 'Cardiff', 'CDF', 1),
(3527, 222, 'Carmarthenshire', 'CARM', 1),
(3528, 222, 'Ceredigion', 'CDGN', 1),
(3529, 222, 'Cheshire', 'CHES', 1),
(3530, 222, 'Clackmannanshire', 'CLACK', 1),
(3531, 222, 'Conwy', 'CON', 1),
(3532, 222, 'Cornwall', 'CORN', 1),
(3533, 222, 'Denbighshire', 'DNBG', 1),
(3534, 222, 'Derbyshire', 'DERBY', 1),
(3535, 222, 'Devon', 'DVN', 1),
(3536, 222, 'Dorset', 'DOR', 1),
(3537, 222, 'Dumfries and Galloway', 'DGL', 1),
(3538, 222, 'Dundee', 'DUND', 1),
(3539, 222, 'Durham', 'DHM', 1),
(3540, 222, 'East Ayrshire', 'ARYE', 1),
(3541, 222, 'East Dunbartonshire', 'DUNBE', 1),
(3542, 222, 'East Lothian', 'LOTE', 1),
(3543, 222, 'East Renfrewshire', 'RENE', 1),
(3544, 222, 'East Riding of Yorkshire', 'ERYS', 1),
(3545, 222, 'East Sussex', 'SXE', 1),
(3546, 222, 'Edinburgh', 'EDIN', 1),
(3547, 222, 'Essex', 'ESX', 1),
(3548, 222, 'Falkirk', 'FALK', 1),
(3549, 222, 'Fife', 'FFE', 1),
(3550, 222, 'Flintshire', 'FLINT', 1),
(3551, 222, 'Glasgow', 'GLAS', 1),
(3552, 222, 'Gloucestershire', 'GLOS', 1),
(3553, 222, 'Greater London', 'LDN', 1),
(3554, 222, 'Greater Manchester', 'MCH', 1),
(3555, 222, 'Gwynedd', 'GDD', 1),
(3556, 222, 'Hampshire', 'HANTS', 1),
(3557, 222, 'Herefordshire', 'HWR', 1),
(3558, 222, 'Hertfordshire', 'HERTS', 1),
(3559, 222, 'Highlands', 'HLD', 1),
(3560, 222, 'Inverclyde', 'IVER', 1),
(3561, 222, 'Isle of Wight', 'IOW', 1),
(3562, 222, 'Kent', 'KNT', 1),
(3563, 222, 'Lancashire', 'LANCS', 1),
(3564, 222, 'Leicestershire', 'LEICS', 1),
(3565, 222, 'Lincolnshire', 'LINCS', 1),
(3566, 222, 'Merseyside', 'MSY', 1),
(3567, 222, 'Merthyr Tydfil', 'MERT', 1),
(3568, 222, 'Midlothian', 'MLOT', 1),
(3569, 222, 'Monmouthshire', 'MMOUTH', 1),
(3570, 222, 'Moray', 'MORAY', 1),
(3571, 222, 'Neath Port Talbot', 'NPRTAL', 1),
(3572, 222, 'Newport', 'NEWPT', 1),
(3573, 222, 'Norfolk', 'NOR', 1),
(3574, 222, 'North Ayrshire', 'ARYN', 1),
(3575, 222, 'North Lanarkshire', 'LANN', 1),
(3576, 222, 'North Yorkshire', 'YSN', 1),
(3577, 222, 'Northamptonshire', 'NHM', 1),
(3578, 222, 'Northumberland', 'NLD', 1),
(3579, 222, 'Nottinghamshire', 'NOT', 1),
(3580, 222, 'Orkney Islands', 'ORK', 1),
(3581, 222, 'Oxfordshire', 'OFE', 1),
(3582, 222, 'Pembrokeshire', 'PEM', 1),
(3583, 222, 'Perth and Kinross', 'PERTH', 1),
(3584, 222, 'Powys', 'PWS', 1),
(3585, 222, 'Renfrewshire', 'REN', 1),
(3586, 222, 'Rhondda Cynon Taff', 'RHON', 1),
(3587, 222, 'Rutland', 'RUT', 1),
(3588, 222, 'Scottish Borders', 'BOR', 1),
(3589, 222, 'Shetland Islands', 'SHET', 1),
(3590, 222, 'Shropshire', 'SPE', 1),
(3591, 222, 'Somerset', 'SOM', 1),
(3592, 222, 'South Ayrshire', 'ARYS', 1),
(3593, 222, 'South Lanarkshire', 'LANS', 1),
(3594, 222, 'South Yorkshire', 'YSS', 1),
(3595, 222, 'Staffordshire', 'SFD', 1),
(3596, 222, 'Stirling', 'STIR', 1),
(3597, 222, 'Suffolk', 'SFK', 1),
(3598, 222, 'Surrey', 'SRY', 1),
(3599, 222, 'Swansea', 'SWAN', 1),
(3600, 222, 'Torfaen', 'TORF', 1),
(3601, 222, 'Tyne and Wear', 'TWR', 1),
(3602, 222, 'Vale of Glamorgan', 'VGLAM', 1),
(3603, 222, 'Warwickshire', 'WARKS', 1),
(3604, 222, 'West Dunbartonshire', 'WDUN', 1),
(3605, 222, 'West Lothian', 'WLOT', 1),
(3606, 222, 'West Midlands', 'WMD', 1),
(3607, 222, 'West Sussex', 'SXW', 1),
(3608, 222, 'West Yorkshire', 'YSW', 1),
(3609, 222, 'Western Isles', 'WIL', 1),
(3610, 222, 'Wiltshire', 'WLT', 1),
(3611, 222, 'Worcestershire', 'WORCS', 1),
(3612, 222, 'Wrexham', 'WRX', 1),
(3613, 223, 'Alabama', 'AL', 1),
(3614, 223, 'Alaska', 'AK', 1),
(3615, 223, 'American Samoa', 'AS', 1),
(3616, 223, 'Arizona', 'AZ', 1),
(3617, 223, 'Arkansas', 'AR', 1),
(3618, 223, 'Armed Forces Africa', 'AF', 1),
(3619, 223, 'Armed Forces Americas', 'AA', 1),
(3620, 223, 'Armed Forces Canada', 'AC', 1),
(3621, 223, 'Armed Forces Europe', 'AE', 1),
(3622, 223, 'Armed Forces Middle East', 'AM', 1),
(3623, 223, 'Armed Forces Pacific', 'AP', 1),
(3624, 223, 'California', 'CA', 1),
(3625, 223, 'Colorado', 'CO', 1),
(3626, 223, 'Connecticut', 'CT', 1),
(3627, 223, 'Delaware', 'DE', 1),
(3628, 223, 'District of Columbia', 'DC', 1),
(3629, 223, 'Federated States Of Micronesia', 'FM', 1),
(3630, 223, 'Florida', 'FL', 1),
(3631, 223, 'Georgia', 'GA', 1),
(3632, 223, 'Guam', 'GU', 1),
(3633, 223, 'Hawaii', 'HI', 1),
(3634, 223, 'Idaho', 'ID', 1),
(3635, 223, 'Illinois', 'IL', 1),
(3636, 223, 'Indiana', 'IN', 1),
(3637, 223, 'Iowa', 'IA', 1),
(3638, 223, 'Kansas', 'KS', 1),
(3639, 223, 'Kentucky', 'KY', 1),
(3640, 223, 'Louisiana', 'LA', 1),
(3641, 223, 'Maine', 'ME', 1),
(3642, 223, 'Marshall Islands', 'MH', 1),
(3643, 223, 'Maryland', 'MD', 1),
(3644, 223, 'Massachusetts', 'MA', 1),
(3645, 223, 'Michigan', 'MI', 1),
(3646, 223, 'Minnesota', 'MN', 1),
(3647, 223, 'Mississippi', 'MS', 1),
(3648, 223, 'Missouri', 'MO', 1),
(3649, 223, 'Montana', 'MT', 1),
(3650, 223, 'Nebraska', 'NE', 1),
(3651, 223, 'Nevada', 'NV', 1),
(3652, 223, 'New Hampshire', 'NH', 1),
(3653, 223, 'New Jersey', 'NJ', 1),
(3654, 223, 'New Mexico', 'NM', 1),
(3655, 223, 'New York', 'NY', 1),
(3656, 223, 'North Carolina', 'NC', 1),
(3657, 223, 'North Dakota', 'ND', 1),
(3658, 223, 'Northern Mariana Islands', 'MP', 1),
(3659, 223, 'Ohio', 'OH', 1),
(3660, 223, 'Oklahoma', 'OK', 1),
(3661, 223, 'Oregon', 'OR', 1),
(3662, 223, 'Palau', 'PW', 1),
(3663, 223, 'Pennsylvania', 'PA', 1),
(3664, 223, 'Puerto Rico', 'PR', 1),
(3665, 223, 'Rhode Island', 'RI', 1),
(3666, 223, 'South Carolina', 'SC', 1),
(3667, 223, 'South Dakota', 'SD', 1),
(3668, 223, 'Tennessee', 'TN', 1),
(3669, 223, 'Texas', 'TX', 1),
(3670, 223, 'Utah', 'UT', 1),
(3671, 223, 'Vermont', 'VT', 1),
(3672, 223, 'Virgin Islands', 'VI', 1),
(3673, 223, 'Virginia', 'VA', 1),
(3674, 223, 'Washington', 'WA', 1),
(3675, 223, 'West Virginia', 'WV', 1),
(3676, 223, 'Wisconsin', 'WI', 1),
(3677, 223, 'Wyoming', 'WY', 1),
(3678, 224, 'Baker Island', 'BI', 1),
(3679, 224, 'Howland Island', 'HI', 1),
(3680, 224, 'Jarvis Island', 'JI', 1),
(3681, 224, 'Johnston Atoll', 'JA', 1),
(3682, 224, 'Kingman Reef', 'KR', 1),
(3683, 224, 'Midway Atoll', 'MA', 1),
(3684, 224, 'Navassa Island', 'NI', 1),
(3685, 224, 'Palmyra Atoll', 'PA', 1),
(3686, 224, 'Wake Island', 'WI', 1),
(3687, 225, 'Artigas', 'AR', 1),
(3688, 225, 'Canelones', 'CA', 1),
(3689, 225, 'Cerro Largo', 'CL', 1),
(3690, 225, 'Colonia', 'CO', 1),
(3691, 225, 'Durazno', 'DU', 1),
(3692, 225, 'Flores', 'FS', 1),
(3693, 225, 'Florida', 'FA', 1),
(3694, 225, 'Lavalleja', 'LA', 1),
(3695, 225, 'Maldonado', 'MA', 1),
(3696, 225, 'Montevideo', 'MO', 1),
(3697, 225, 'Paysandu', 'PA', 1),
(3698, 225, 'Rio Negro', 'RN', 1),
(3699, 225, 'Rivera', 'RV', 1),
(3700, 225, 'Rocha', 'RO', 1),
(3701, 225, 'Salto', 'SL', 1),
(3702, 225, 'San Jose', 'SJ', 1),
(3703, 225, 'Soriano', 'SO', 1),
(3704, 225, 'Tacuarembo', 'TA', 1),
(3705, 225, 'Treinta y Tres', 'TT', 1),
(3706, 226, 'Andijon', 'AN', 1),
(3707, 226, 'Buxoro', 'BU', 1),
(3708, 226, 'Farg''ona', 'FA', 1),
(3709, 226, 'Jizzax', 'JI', 1),
(3710, 226, 'Namangan', 'NG', 1),
(3711, 226, 'Navoiy', 'NW', 1),
(3712, 226, 'Qashqadaryo', 'QA', 1),
(3713, 226, 'Qoraqalpog''iston Republikasi', 'QR', 1),
(3714, 226, 'Samarqand', 'SA', 1),
(3715, 226, 'Sirdaryo', 'SI', 1),
(3716, 226, 'Surxondaryo', 'SU', 1),
(3717, 226, 'Toshkent City', 'TK', 1),
(3718, 226, 'Toshkent Region', 'TO', 1),
(3719, 226, 'Xorazm', 'XO', 1),
(3720, 227, 'Malampa', 'MA', 1),
(3721, 227, 'Penama', 'PE', 1),
(3722, 227, 'Sanma', 'SA', 1),
(3723, 227, 'Shefa', 'SH', 1),
(3724, 227, 'Tafea', 'TA', 1),
(3725, 227, 'Torba', 'TO', 1),
(3726, 229, 'Amazonas', 'AM', 1),
(3727, 229, 'Anzoategui', 'AN', 1),
(3728, 229, 'Apure', 'AP', 1),
(3729, 229, 'Aragua', 'AR', 1),
(3730, 229, 'Barinas', 'BA', 1),
(3731, 229, 'Bolivar', 'BO', 1),
(3732, 229, 'Carabobo', 'CA', 1),
(3733, 229, 'Cojedes', 'CO', 1),
(3734, 229, 'Delta Amacuro', 'DA', 1),
(3735, 229, 'Dependencias Federales', 'DF', 1),
(3736, 229, 'Distrito Federal', 'DI', 1),
(3737, 229, 'Falcon', 'FA', 1),
(3738, 229, 'Guarico', 'GU', 1),
(3739, 229, 'Lara', 'LA', 1),
(3740, 229, 'Merida', 'ME', 1),
(3741, 229, 'Miranda', 'MI', 1),
(3742, 229, 'Monagas', 'MO', 1),
(3743, 229, 'Nueva Esparta', 'NE', 1),
(3744, 229, 'Portuguesa', 'PO', 1),
(3745, 229, 'Sucre', 'SU', 1),
(3746, 229, 'Tachira', 'TA', 1),
(3747, 229, 'Trujillo', 'TR', 1),
(3748, 229, 'Vargas', 'VA', 1),
(3749, 229, 'Yaracuy', 'YA', 1),
(3750, 229, 'Zulia', 'ZU', 1),
(3751, 230, 'An Giang', 'AG', 1),
(3752, 230, 'Bac Giang', 'BG', 1),
(3753, 230, 'Bac Kan', 'BK', 1),
(3754, 230, 'Bac Lieu', 'BL', 1),
(3755, 230, 'Bac Ninh', 'BC', 1),
(3756, 230, 'Ba Ria-Vung Tau', 'BR', 1),
(3757, 230, 'Ben Tre', 'BN', 1),
(3758, 230, 'Binh Dinh', 'BH', 1),
(3759, 230, 'Binh Duong', 'BU', 1),
(3760, 230, 'Binh Phuoc', 'BP', 1),
(3761, 230, 'Binh Thuan', 'BT', 1),
(3762, 230, 'Ca Mau', 'CM', 1),
(3763, 230, 'Can Tho', 'CT', 1),
(3764, 230, 'Cao Bang', 'CB', 1),
(3765, 230, 'Dak Lak', 'DL', 1),
(3766, 230, 'Dak Nong', 'DG', 1),
(3767, 230, 'Da Nang', 'DN', 1),
(3768, 230, 'Dien Bien', 'DB', 1),
(3769, 230, 'Dong Nai', 'DI', 1),
(3770, 230, 'Dong Thap', 'DT', 1),
(3771, 230, 'Gia Lai', 'GL', 1),
(3772, 230, 'Ha Giang', 'HG', 1),
(3773, 230, 'Hai Duong', 'HD', 1),
(3774, 230, 'Hai Phong', 'HP', 1),
(3775, 230, 'Ha Nam', 'HM', 1),
(3776, 230, 'Ha Noi', 'HI', 1),
(3777, 230, 'Ha Tay', 'HT', 1),
(3778, 230, 'Ha Tinh', 'HH', 1),
(3779, 230, 'Hoa Binh', 'HB', 1),
(3780, 230, 'Ho Chi Minh City', 'HC', 1),
(3781, 230, 'Hau Giang', 'HU', 1),
(3782, 230, 'Hung Yen', 'HY', 1),
(3783, 232, 'Saint Croix', 'C', 1),
(3784, 232, 'Saint John', 'J', 1),
(3785, 232, 'Saint Thomas', 'T', 1),
(3786, 233, 'Alo', 'A', 1),
(3787, 233, 'Sigave', 'S', 1),
(3788, 233, 'Wallis', 'W', 1),
(3789, 235, 'Abyan', 'AB', 1),
(3790, 235, 'Adan', 'AD', 1),
(3791, 235, 'Amran', 'AM', 1),
(3792, 235, 'Al Bayda', 'BA', 1),
(3793, 235, 'Ad Dali', 'DA', 1),
(3794, 235, 'Dhamar', 'DH', 1),
(3795, 235, 'Hadramawt', 'HD', 1),
(3796, 235, 'Hajjah', 'HJ', 1),
(3797, 235, 'Al Hudaydah', 'HU', 1),
(3798, 235, 'Ibb', 'IB', 1),
(3799, 235, 'Al Jawf', 'JA', 1),
(3800, 235, 'Lahij', 'LA', 1),
(3801, 235, 'Ma''rib', 'MA', 1),
(3802, 235, 'Al Mahrah', 'MR', 1),
(3803, 235, 'Al Mahwit', 'MW', 1),
(3804, 235, 'Sa''dah', 'SD', 1),
(3805, 235, 'San''a', 'SN', 1),
(3806, 235, 'Shabwah', 'SH', 1),
(3807, 235, 'Ta''izz', 'TA', 1),
(3812, 237, 'Bas-Congo', 'BC', 1),
(3813, 237, 'Bandundu', 'BN', 1),
(3814, 237, 'Equateur', 'EQ', 1),
(3815, 237, 'Katanga', 'KA', 1),
(3816, 237, 'Kasai-Oriental', 'KE', 1),
(3817, 237, 'Kinshasa', 'KN', 1),
(3818, 237, 'Kasai-Occidental', 'KW', 1),
(3819, 237, 'Maniema', 'MA', 1),
(3820, 237, 'Nord-Kivu', 'NK', 1),
(3821, 237, 'Orientale', 'OR', 1),
(3822, 237, 'Sud-Kivu', 'SK', 1),
(3823, 238, 'Central', 'CE', 1),
(3824, 238, 'Copperbelt', 'CB', 1),
(3825, 238, 'Eastern', 'EA', 1),
(3826, 238, 'Luapula', 'LP', 1),
(3827, 238, 'Lusaka', 'LK', 1),
(3828, 238, 'Northern', 'NO', 1),
(3829, 238, 'North-Western', 'NW', 1),
(3830, 238, 'Southern', 'SO', 1),
(3831, 238, 'Western', 'WE', 1),
(3832, 239, 'Bulawayo', 'BU', 1),
(3833, 239, 'Harare', 'HA', 1),
(3834, 239, 'Manicaland', 'ML', 1),
(3835, 239, 'Mashonaland Central', 'MC', 1),
(3836, 239, 'Mashonaland East', 'ME', 1),
(3837, 239, 'Mashonaland West', 'MW', 1),
(3838, 239, 'Masvingo', 'MV', 1),
(3839, 239, 'Matabeleland North', 'MN', 1),
(3840, 239, 'Matabeleland South', 'MS', 1),
(3841, 239, 'Midlands', 'MD', 1),
(3861, 105, 'Campobasso', 'CB', 1),
(3862, 105, 'Carbonia-Iglesias', 'CI', 1),
(3863, 105, 'Caserta', 'CE', 1),
(3864, 105, 'Catania', 'CT', 1),
(3865, 105, 'Catanzaro', 'CZ', 1),
(3866, 105, 'Chieti', 'CH', 1),
(3867, 105, 'Como', 'CO', 1),
(3868, 105, 'Cosenza', 'CS', 1),
(3869, 105, 'Cremona', 'CR', 1),
(3870, 105, 'Crotone', 'KR', 1),
(3871, 105, 'Cuneo', 'CN', 1),
(3872, 105, 'Enna', 'EN', 1),
(3873, 105, 'Ferrara', 'FE', 1),
(3874, 105, 'Firenze', 'FI', 1),
(3875, 105, 'Foggia', 'FG', 1),
(3876, 105, 'Forli-Cesena', 'FC', 1),
(3877, 105, 'Frosinone', 'FR', 1),
(3878, 105, 'Genova', 'GE', 1),
(3879, 105, 'Gorizia', 'GO', 1),
(3880, 105, 'Grosseto', 'GR', 1),
(3881, 105, 'Imperia', 'IM', 1),
(3882, 105, 'Isernia', 'IS', 1),
(3883, 105, 'L&#39;Aquila', 'AQ', 1),
(3884, 105, 'La Spezia', 'SP', 1),
(3885, 105, 'Latina', 'LT', 1),
(3886, 105, 'Lecce', 'LE', 1),
(3887, 105, 'Lecco', 'LC', 1),
(3888, 105, 'Livorno', 'LI', 1),
(3889, 105, 'Lodi', 'LO', 1),
(3890, 105, 'Lucca', 'LU', 1),
(3891, 105, 'Macerata', 'MC', 1),
(3892, 105, 'Mantova', 'MN', 1),
(3893, 105, 'Massa-Carrara', 'MS', 1),
(3894, 105, 'Matera', 'MT', 1),
(3895, 105, 'Medio Campidano', 'VS', 1),
(3896, 105, 'Messina', 'ME', 1),
(3897, 105, 'Milano', 'MI', 1),
(3898, 105, 'Modena', 'MO', 1),
(3899, 105, 'Napoli', 'NA', 1),
(3900, 105, 'Novara', 'NO', 1),
(3901, 105, 'Nuoro', 'NU', 1),
(3902, 105, 'Ogliastra', 'OG', 1),
(3903, 105, 'Olbia-Tempio', 'OT', 1),
(3904, 105, 'Oristano', 'OR', 1),
(3905, 105, 'Padova', 'PD', 1),
(3906, 105, 'Palermo', 'PA', 1),
(3907, 105, 'Parma', 'PR', 1),
(3908, 105, 'Pavia', 'PV', 1),
(3909, 105, 'Perugia', 'PG', 1),
(3910, 105, 'Pesaro e Urbino', 'PU', 1),
(3911, 105, 'Pescara', 'PE', 1),
(3912, 105, 'Piacenza', 'PC', 1),
(3913, 105, 'Pisa', 'PI', 1),
(3914, 105, 'Pistoia', 'PT', 1),
(3915, 105, 'Pordenone', 'PN', 1),
(3916, 105, 'Potenza', 'PZ', 1),
(3917, 105, 'Prato', 'PO', 1),
(3918, 105, 'Ragusa', 'RG', 1),
(3919, 105, 'Ravenna', 'RA', 1),
(3920, 105, 'Reggio Calabria', 'RC', 1),
(3921, 105, 'Reggio Emilia', 'RE', 1),
(3922, 105, 'Rieti', 'RI', 1),
(3923, 105, 'Rimini', 'RN', 1),
(3924, 105, 'Roma', 'RM', 1),
(3925, 105, 'Rovigo', 'RO', 1),
(3926, 105, 'Salerno', 'SA', 1),
(3927, 105, 'Sassari', 'SS', 1),
(3928, 105, 'Savona', 'SV', 1),
(3929, 105, 'Siena', 'SI', 1),
(3930, 105, 'Siracusa', 'SR', 1),
(3931, 105, 'Sondrio', 'SO', 1),
(3932, 105, 'Taranto', 'TA', 1),
(3933, 105, 'Teramo', 'TE', 1),
(3934, 105, 'Terni', 'TR', 1),
(3935, 105, 'Torino', 'TO', 1),
(3936, 105, 'Trapani', 'TP', 1),
(3937, 105, 'Trento', 'TN', 1),
(3938, 105, 'Treviso', 'TV', 1),
(3939, 105, 'Trieste', 'TS', 1),
(3940, 105, 'Udine', 'UD', 1),
(3941, 105, 'Varese', 'VA', 1),
(3942, 105, 'Venezia', 'VE', 1),
(3943, 105, 'Verbano-Cusio-Ossola', 'VB', 1),
(3944, 105, 'Vercelli', 'VC', 1),
(3945, 105, 'Verona', 'VR', 1),
(3946, 105, 'Vibo Valentia', 'VV', 1),
(3947, 105, 'Vicenza', 'VI', 1),
(3948, 105, 'Viterbo', 'VT', 1),
(3949, 222, 'County Antrim', 'ANT', 1),
(3950, 222, 'County Armagh', 'ARM', 1),
(3951, 222, 'County Down', 'DOW', 1),
(3952, 222, 'County Fermanagh', 'FER', 1),
(3953, 222, 'County Londonderry', 'LDY', 1),
(3954, 222, 'County Tyrone', 'TYR', 1),
(3955, 222, 'Cumbria', 'CMA', 1),
(3956, 190, 'Pomurska', '1', 1),
(3957, 190, 'Podravska', '2', 1),
(3958, 190, 'Koroška', '3', 1),
(3959, 190, 'Savinjska', '4', 1),
(3960, 190, 'Zasavska', '5', 1),
(3961, 190, 'Spodnjeposavska', '6', 1),
(3962, 190, 'Jugovzhodna Slovenija', '7', 1),
(3963, 190, 'Osrednjeslovenska', '8', 1),
(3964, 190, 'Gorenjska', '9', 1),
(3965, 190, 'Notranjsko-kraška', '10', 1),
(3966, 190, 'Goriška', '11', 1),
(3967, 190, 'Obalno-kraška', '12', 1),
(3968, 33, 'Ruse', '', 1),
(3969, 101, 'Alborz', 'ALB', 1),
(3970, 21, 'Brussels-Capital Region', 'BRU', 1),
(3971, 138, 'Aguascalientes', 'AG', 1),
(3973, 242, 'Andrijevica', '01', 1),
(3974, 242, 'Bar', '02', 1),
(3975, 242, 'Berane', '03', 1),
(3976, 242, 'Bijelo Polje', '04', 1),
(3977, 242, 'Budva', '05', 1),
(3978, 242, 'Cetinje', '06', 1),
(3979, 242, 'Danilovgrad', '07', 1),
(3980, 242, 'Herceg-Novi', '08', 1),
(3981, 242, 'Kolašin', '09', 1),
(3982, 242, 'Kotor', '10', 1),
(3983, 242, 'Mojkovac', '11', 1),
(3984, 242, 'Nikšić', '12', 1),
(3985, 242, 'Plav', '13', 1),
(3986, 242, 'Pljevlja', '14', 1),
(3987, 242, 'Plužine', '15', 1),
(3988, 242, 'Podgorica', '16', 1),
(3989, 242, 'Rožaje', '17', 1),
(3990, 242, 'Šavnik', '18', 1),
(3991, 242, 'Tivat', '19', 1),
(3992, 242, 'Ulcinj', '20', 1),
(3993, 242, 'Žabljak', '21', 1),
(3994, 243, 'Belgrade', '00', 1),
(3995, 243, 'North Bačka', '01', 1),
(3996, 243, 'Central Banat', '02', 1),
(3997, 243, 'North Banat', '03', 1),
(3998, 243, 'South Banat', '04', 1),
(3999, 243, 'West Bačka', '05', 1),
(4000, 243, 'South Bačka', '06', 1),
(4001, 243, 'Srem', '07', 1),
(4002, 243, 'Mačva', '08', 1),
(4003, 243, 'Kolubara', '09', 1),
(4004, 243, 'Podunavlje', '10', 1),
(4005, 243, 'Braničevo', '11', 1),
(4006, 243, 'Šumadija', '12', 1),
(4007, 243, 'Pomoravlje', '13', 1),
(4008, 243, 'Bor', '14', 1),
(4009, 243, 'Zaječar', '15', 1),
(4010, 243, 'Zlatibor', '16', 1),
(4011, 243, 'Moravica', '17', 1),
(4012, 243, 'Raška', '18', 1),
(4013, 243, 'Rasina', '19', 1),
(4014, 243, 'Nišava', '20', 1),
(4015, 243, 'Toplica', '21', 1),
(4016, 243, 'Pirot', '22', 1),
(4017, 243, 'Jablanica', '23', 1),
(4018, 243, 'Pčinja', '24', 1),
(4020, 245, 'Bonaire', 'BO', 1),
(4021, 245, 'Saba', 'SA', 1),
(4022, 245, 'Sint Eustatius', 'SE', 1),
(4023, 248, 'Central Equatoria', 'EC', 1),
(4024, 248, 'Eastern Equatoria', 'EE', 1),
(4025, 248, 'Jonglei', 'JG', 1),
(4026, 248, 'Lakes', 'LK', 1),
(4027, 248, 'Northern Bahr el-Ghazal', 'BN', 1),
(4028, 248, 'Unity', 'UY', 1),
(4029, 248, 'Upper Nile', 'NU', 1),
(4030, 248, 'Warrap', 'WR', 1),
(4031, 248, 'Western Bahr el-Ghazal', 'BW', 1),
(4032, 248, 'Western Equatoria', 'EW', 1),
(4036, 117, 'Ainaži, Salacgrīvas novads', '0661405', 1),
(4037, 117, 'Aizkraukle, Aizkraukles novads', '0320201', 1),
(4038, 117, 'Aizkraukles novads', '0320200', 1),
(4039, 117, 'Aizpute, Aizputes novads', '0640605', 1),
(4040, 117, 'Aizputes novads', '0640600', 1),
(4041, 117, 'Aknīste, Aknīstes novads', '0560805', 1),
(4042, 117, 'Aknīstes novads', '0560800', 1),
(4043, 117, 'Aloja, Alojas novads', '0661007', 1),
(4044, 117, 'Alojas novads', '0661000', 1),
(4045, 117, 'Alsungas novads', '0624200', 1),
(4046, 117, 'Alūksne, Alūksnes novads', '0360201', 1),
(4047, 117, 'Alūksnes novads', '0360200', 1),
(4048, 117, 'Amatas novads', '0424701', 1),
(4049, 117, 'Ape, Apes novads', '0360805', 1),
(4050, 117, 'Apes novads', '0360800', 1),
(4051, 117, 'Auce, Auces novads', '0460805', 1),
(4052, 117, 'Auces novads', '0460800', 1),
(4053, 117, 'Ādažu novads', '0804400', 1),
(4054, 117, 'Babītes novads', '0804900', 1),
(4055, 117, 'Baldone, Baldones novads', '0800605', 1),
(4056, 117, 'Baldones novads', '0800600', 1),
(4057, 117, 'Baloži, Ķekavas novads', '0800807', 1),
(4058, 117, 'Baltinavas novads', '0384400', 1),
(4059, 117, 'Balvi, Balvu novads', '0380201', 1),
(4060, 117, 'Balvu novads', '0380200', 1),
(4061, 117, 'Bauska, Bauskas novads', '0400201', 1),
(4062, 117, 'Bauskas novads', '0400200', 1),
(4063, 117, 'Beverīnas novads', '0964700', 1),
(4064, 117, 'Brocēni, Brocēnu novads', '0840605', 1),
(4065, 117, 'Brocēnu novads', '0840601', 1),
(4066, 117, 'Burtnieku novads', '0967101', 1),
(4067, 117, 'Carnikavas novads', '0805200', 1),
(4068, 117, 'Cesvaine, Cesvaines novads', '0700807', 1),
(4069, 117, 'Cesvaines novads', '0700800', 1),
(4070, 117, 'Cēsis, Cēsu novads', '0420201', 1),
(4071, 117, 'Cēsu novads', '0420200', 1),
(4072, 117, 'Ciblas novads', '0684901', 1),
(4073, 117, 'Dagda, Dagdas novads', '0601009', 1),
(4074, 117, 'Dagdas novads', '0601000', 1),
(4075, 117, 'Daugavpils', '0050000', 1),
(4076, 117, 'Daugavpils novads', '0440200', 1),
(4077, 117, 'Dobele, Dobeles novads', '0460201', 1),
(4078, 117, 'Dobeles novads', '0460200', 1),
(4079, 117, 'Dundagas novads', '0885100', 1),
(4080, 117, 'Durbe, Durbes novads', '0640807', 1),
(4081, 117, 'Durbes novads', '0640801', 1),
(4082, 117, 'Engures novads', '0905100', 1),
(4083, 117, 'Ērgļu novads', '0705500', 1),
(4084, 117, 'Garkalnes novads', '0806000', 1),
(4085, 117, 'Grobiņa, Grobiņas novads', '0641009', 1),
(4086, 117, 'Grobiņas novads', '0641000', 1),
(4087, 117, 'Gulbene, Gulbenes novads', '0500201', 1),
(4088, 117, 'Gulbenes novads', '0500200', 1),
(4089, 117, 'Iecavas novads', '0406400', 1),
(4090, 117, 'Ikšķile, Ikšķiles novads', '0740605', 1),
(4091, 117, 'Ikšķiles novads', '0740600', 1),
(4092, 117, 'Ilūkste, Ilūkstes novads', '0440807', 1),
(4093, 117, 'Ilūkstes novads', '0440801', 1),
(4094, 117, 'Inčukalna novads', '0801800', 1),
(4095, 117, 'Jaunjelgava, Jaunjelgavas novads', '0321007', 1),
(4096, 117, 'Jaunjelgavas novads', '0321000', 1),
(4097, 117, 'Jaunpiebalgas novads', '0425700', 1),
(4098, 117, 'Jaunpils novads', '0905700', 1),
(4099, 117, 'Jelgava', '0090000', 1),
(4100, 117, 'Jelgavas novads', '0540200', 1),
(4101, 117, 'Jēkabpils', '0110000', 1),
(4102, 117, 'Jēkabpils novads', '0560200', 1),
(4103, 117, 'Jūrmala', '0130000', 1),
(4104, 117, 'Kalnciems, Jelgavas novads', '0540211', 1),
(4105, 117, 'Kandava, Kandavas novads', '0901211', 1),
(4106, 117, 'Kandavas novads', '0901201', 1),
(4107, 117, 'Kārsava, Kārsavas novads', '0681009', 1),
(4108, 117, 'Kārsavas novads', '0681000', 1),
(4109, 117, 'Kocēnu novads ,bij. Valmieras)', '0960200', 1),
(4110, 117, 'Kokneses novads', '0326100', 1),
(4111, 117, 'Krāslava, Krāslavas novads', '0600201', 1),
(4112, 117, 'Krāslavas novads', '0600202', 1),
(4113, 117, 'Krimuldas novads', '0806900', 1),
(4114, 117, 'Krustpils novads', '0566900', 1),
(4115, 117, 'Kuldīga, Kuldīgas novads', '0620201', 1),
(4116, 117, 'Kuldīgas novads', '0620200', 1),
(4117, 117, 'Ķeguma novads', '0741001', 1),
(4118, 117, 'Ķegums, Ķeguma novads', '0741009', 1),
(4119, 117, 'Ķekavas novads', '0800800', 1),
(4120, 117, 'Lielvārde, Lielvārdes novads', '0741413', 1),
(4121, 117, 'Lielvārdes novads', '0741401', 1),
(4122, 117, 'Liepāja', '0170000', 1),
(4123, 117, 'Limbaži, Limbažu novads', '0660201', 1),
(4124, 117, 'Limbažu novads', '0660200', 1),
(4125, 117, 'Līgatne, Līgatnes novads', '0421211', 1),
(4126, 117, 'Līgatnes novads', '0421200', 1),
(4127, 117, 'Līvāni, Līvānu novads', '0761211', 1),
(4128, 117, 'Līvānu novads', '0761201', 1),
(4129, 117, 'Lubāna, Lubānas novads', '0701413', 1),
(4130, 117, 'Lubānas novads', '0701400', 1),
(4131, 117, 'Ludza, Ludzas novads', '0680201', 1),
(4132, 117, 'Ludzas novads', '0680200', 1),
(4133, 117, 'Madona, Madonas novads', '0700201', 1),
(4134, 117, 'Madonas novads', '0700200', 1),
(4135, 117, 'Mazsalaca, Mazsalacas novads', '0961011', 1),
(4136, 117, 'Mazsalacas novads', '0961000', 1),
(4137, 117, 'Mālpils novads', '0807400', 1),
(4138, 117, 'Mārupes novads', '0807600', 1),
(4139, 117, 'Mērsraga novads', '0887600', 1),
(4140, 117, 'Naukšēnu novads', '0967300', 1),
(4141, 117, 'Neretas novads', '0327100', 1),
(4142, 117, 'Nīcas novads', '0647900', 1),
(4143, 117, 'Ogre, Ogres novads', '0740201', 1),
(4144, 117, 'Ogres novads', '0740202', 1),
(4145, 117, 'Olaine, Olaines novads', '0801009', 1),
(4146, 117, 'Olaines novads', '0801000', 1),
(4147, 117, 'Ozolnieku novads', '0546701', 1),
(4148, 117, 'Pārgaujas novads', '0427500', 1),
(4149, 117, 'Pāvilosta, Pāvilostas novads', '0641413', 1),
(4150, 117, 'Pāvilostas novads', '0641401', 1),
(4151, 117, 'Piltene, Ventspils novads', '0980213', 1),
(4152, 117, 'Pļaviņas, Pļaviņu novads', '0321413', 1),
(4153, 117, 'Pļaviņu novads', '0321400', 1),
(4154, 117, 'Preiļi, Preiļu novads', '0760201', 1),
(4155, 117, 'Preiļu novads', '0760202', 1),
(4156, 117, 'Priekule, Priekules novads', '0641615', 1),
(4157, 117, 'Priekules novads', '0641600', 1),
(4158, 117, 'Priekuļu novads', '0427300', 1),
(4159, 117, 'Raunas novads', '0427700', 1),
(4160, 117, 'Rēzekne', '0210000', 1),
(4161, 117, 'Rēzeknes novads', '0780200', 1),
(4162, 117, 'Riebiņu novads', '0766300', 1),
(4163, 117, 'Rīga', '0010000', 1),
(4164, 117, 'Rojas novads', '0888300', 1),
(4165, 117, 'Ropažu novads', '0808400', 1),
(4166, 117, 'Rucavas novads', '0648500', 1),
(4167, 117, 'Rugāju novads', '0387500', 1),
(4168, 117, 'Rundāles novads', '0407700', 1),
(4169, 117, 'Rūjiena, Rūjienas novads', '0961615', 1),
(4170, 117, 'Rūjienas novads', '0961600', 1),
(4171, 117, 'Sabile, Talsu novads', '0880213', 1),
(4172, 117, 'Salacgrīva, Salacgrīvas novads', '0661415', 1),
(4173, 117, 'Salacgrīvas novads', '0661400', 1),
(4174, 117, 'Salas novads', '0568700', 1),
(4175, 117, 'Salaspils novads', '0801200', 1),
(4176, 117, 'Salaspils, Salaspils novads', '0801211', 1),
(4177, 117, 'Saldus novads', '0840200', 1),
(4178, 117, 'Saldus, Saldus novads', '0840201', 1),
(4179, 117, 'Saulkrasti, Saulkrastu novads', '0801413', 1),
(4180, 117, 'Saulkrastu novads', '0801400', 1),
(4181, 117, 'Seda, Strenču novads', '0941813', 1),
(4182, 117, 'Sējas novads', '0809200', 1),
(4183, 117, 'Sigulda, Siguldas novads', '0801615', 1),
(4184, 117, 'Siguldas novads', '0801601', 1),
(4185, 117, 'Skrīveru novads', '0328200', 1),
(4186, 117, 'Skrunda, Skrundas novads', '0621209', 1),
(4187, 117, 'Skrundas novads', '0621200', 1),
(4188, 117, 'Smiltene, Smiltenes novads', '0941615', 1),
(4189, 117, 'Smiltenes novads', '0941600', 1),
(4190, 117, 'Staicele, Alojas novads', '0661017', 1),
(4191, 117, 'Stende, Talsu novads', '0880215', 1),
(4192, 117, 'Stopiņu novads', '0809600', 1),
(4193, 117, 'Strenči, Strenču novads', '0941817', 1),
(4194, 117, 'Strenču novads', '0941800', 1),
(4195, 117, 'Subate, Ilūkstes novads', '0440815', 1),
(4196, 117, 'Talsi, Talsu novads', '0880201', 1),
(4197, 117, 'Talsu novads', '0880200', 1),
(4198, 117, 'Tērvetes novads', '0468900', 1),
(4199, 117, 'Tukuma novads', '0900200', 1),
(4200, 117, 'Tukums, Tukuma novads', '0900201', 1),
(4201, 117, 'Vaiņodes novads', '0649300', 1),
(4202, 117, 'Valdemārpils, Talsu novads', '0880217', 1),
(4203, 117, 'Valka, Valkas novads', '0940201', 1),
(4204, 117, 'Valkas novads', '0940200', 1),
(4205, 117, 'Valmiera', '0250000', 1),
(4206, 117, 'Vangaži, Inčukalna novads', '0801817', 1),
(4207, 117, 'Varakļāni, Varakļānu novads', '0701817', 1),
(4208, 117, 'Varakļānu novads', '0701800', 1),
(4209, 117, 'Vārkavas novads', '0769101', 1),
(4210, 117, 'Vecpiebalgas novads', '0429300', 1),
(4211, 117, 'Vecumnieku novads', '0409500', 1),
(4212, 117, 'Ventspils', '0270000', 1),
(4213, 117, 'Ventspils novads', '0980200', 1),
(4214, 117, 'Viesīte, Viesītes novads', '0561815', 1),
(4215, 117, 'Viesītes novads', '0561800', 1),
(4216, 117, 'Viļaka, Viļakas novads', '0381615', 1),
(4217, 117, 'Viļakas novads', '0381600', 1),
(4218, 117, 'Viļāni, Viļānu novads', '0781817', 1),
(4219, 117, 'Viļānu novads', '0781800', 1),
(4220, 117, 'Zilupe, Zilupes novads', '0681817', 1),
(4221, 117, 'Zilupes novads', '0681801', 1),
(4222, 43, 'Arica y Parinacota', 'AP', 1),
(4223, 43, 'Los Rios', 'LR', 1),
(4224, 220, 'Kharkivs''ka Oblast''', '63', 1),
(4225, 118, 'Beirut', 'LB-BR', 1),
(4226, 118, 'Bekaa', 'LB-BE', 1),
(4227, 118, 'Mount Lebanon', 'LB-ML', 1),
(4228, 118, 'Nabatieh', 'LB-NB', 1),
(4229, 118, 'North', 'LB-NR', 1),
(4230, 118, 'South', 'LB-ST', 1),
(4231, 99, 'Telangana', 'TS', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `ma_zone_backup`
--

CREATE TABLE IF NOT EXISTS `ma_zone_backup` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=169 ;

--
-- Дамп данных таблицы `ma_zone_backup`
--

INSERT INTO `ma_zone_backup` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1, 20, 'Брест', 'BR', 1),
(2, 20, 'Гомель', 'HO', 1),
(3, 20, 'Минск', 'HM', 1),
(4, 20, 'Гродно', 'HR', 1),
(5, 20, 'Могилев', 'MA', 1),
(6, 20, 'Минская область', 'MI', 1),
(7, 20, 'Витебск', 'VI', 1),
(8, 80, 'Abkhazia', 'AB', 1),
(9, 80, 'Ajaria', 'AJ', 1),
(10, 80, 'Tbilisi', 'TB', 1),
(11, 80, 'Guria', 'GU', 1),
(12, 80, 'Imereti', 'IM', 1),
(13, 80, 'Kakheti', 'KA', 1),
(14, 80, 'Kvemo Kartli', 'KK', 1),
(15, 80, 'Mtskheta-Mtianeti', 'MM', 1),
(16, 80, 'Racha Lechkhumi and Kvemo Svanet', 'RL', 1),
(17, 80, 'Samegrelo-Zemo Svaneti', 'SZ', 1),
(18, 80, 'Samtskhe-Javakheti', 'SJ', 1),
(19, 80, 'Shida Kartli', 'SK', 1),
(20, 109, 'Алматинская область', 'AL', 1),
(21, 109, 'Алматы - город республ-го значения', 'AC', 1),
(22, 109, 'Акмолинская область', 'AM', 1),
(23, 109, 'Актюбинская область', 'AQ', 1),
(24, 109, 'Астана - город республ-го значения', 'AS', 1),
(25, 109, 'Атырауская область', 'AT', 1),
(26, 109, 'Западно-Казахстанская область', 'BA', 1),
(27, 109, 'Байконур - город республ-го значения', 'BY', 1),
(28, 109, 'Мангистауская область', 'MA', 1),
(29, 109, 'Южно-Казахстанская область', 'ON', 1),
(30, 109, 'Павлодарская область', 'PA', 1),
(31, 109, 'Карагандинская область', 'QA', 1),
(32, 109, 'Костанайская область', 'QO', 1),
(33, 109, 'Кызылординская область', 'QY', 1),
(34, 109, 'Восточно-Казахстанская область', 'SH', 1),
(35, 109, 'Северо-Казахстанская область', 'SO', 1),
(36, 109, 'Жамбылская область', 'ZH', 1),
(37, 115, 'Bishkek', 'GB', 1),
(38, 115, 'Batken', 'B', 1),
(39, 115, 'Chu', 'C', 1),
(40, 115, 'Jalal-Abad', 'J', 1),
(41, 115, 'Naryn', 'N', 1),
(42, 115, 'Osh', 'O', 1),
(43, 115, 'Talas', 'T', 1),
(44, 115, 'Ysyk-Kol', 'Y', 1),
(45, 176, 'Республика Хакасия', 'KK', 1),
(46, 176, 'Московская область', 'MOS', 1),
(47, 176, 'Чукотский АО', 'CHU', 1),
(48, 176, 'Архангельская область', 'ARK', 1),
(49, 176, 'Астраханская область', 'AST', 1),
(50, 176, 'Алтайский край', 'ALT', 1),
(51, 176, 'Белгородская область', 'BEL', 1),
(52, 176, 'Еврейская АО', 'YEV', 1),
(53, 176, 'Амурская область', 'AMU', 1),
(54, 176, 'Брянская область', 'BRY', 1),
(55, 176, 'Чувашская Республика', 'CU', 1),
(56, 176, 'Челябинская область', 'CHE', 1),
(57, 176, 'Карачаево-Черкеcсия', 'KC', 1),
(58, 176, 'Забайкальский край', 'ZAB', 1),
(59, 176, 'Ленинградская область', 'LEN', 1),
(60, 176, 'Республика Калмыкия', 'KL', 1),
(61, 176, 'Сахалинская область', 'SAK', 1),
(62, 176, 'Республика Алтай', 'AL', 1),
(63, 176, 'Чеченская Республика', 'CE', 1),
(64, 176, 'Иркутская область', 'IRK', 1),
(65, 176, 'Ивановская область', 'IVA', 1),
(66, 176, 'Удмуртская Республика', 'UD', 1),
(67, 176, 'Калининградская область', 'KGD', 1),
(68, 176, 'Калужская область', 'KLU', 1),
(69, 176, 'Республика Татарстан', 'TA', 1),
(70, 176, 'Кемеровская область', 'KEM', 1),
(71, 176, 'Хабаровский край', 'KHA', 1),
(72, 176, 'Ханты-Мансийский АО - Югра', 'KHM', 1),
(73, 176, 'Костромская область', 'KOS', 1),
(74, 176, 'Краснодарский край', 'KDA', 1),
(75, 176, 'Красноярский край', 'KYA', 1),
(76, 176, 'Курганская область', 'KGN', 1),
(77, 176, 'Курская область', 'KRS', 1),
(78, 176, 'Республика Тыва', 'TY', 1),
(79, 176, 'Липецкая область', 'LIP', 1),
(80, 176, 'Магаданская область', 'MAG', 1),
(81, 176, 'Республика Дагестан', 'DA', 1),
(82, 176, 'Республика Адыгея', 'AD', 1),
(83, 176, 'Москва', 'MOW', 1),
(84, 176, 'Мурманская область', 'MUR', 1),
(85, 176, 'Республика Кабардино-Балкария', 'KB', 1),
(86, 176, 'Ненецкий АО', 'NEN', 1),
(87, 176, 'Республика Ингушетия', 'IN', 1),
(88, 176, 'Нижегородская область', 'NIZ', 1),
(89, 176, 'Новгородская область', 'NGR', 1),
(90, 176, 'Новосибирская область', 'NVS', 1),
(91, 176, 'Омская область', 'OMS', 1),
(92, 176, 'Орловская область', 'ORL', 1),
(93, 176, 'Оренбургская область', 'ORE', 1),
(94, 176, 'Пензенская область', 'PNZ', 1),
(95, 176, 'Пермский край', 'PER', 1),
(96, 176, 'Камчатский край', 'KAM', 1),
(97, 176, 'Республика Карелия', 'KR', 1),
(98, 176, 'Псковская область', 'PSK', 1),
(99, 176, 'Ростовская область', 'ROS', 1),
(100, 176, 'Рязанская область', 'RYA', 1),
(101, 176, 'Ямало-Ненецкий АО', 'YAN', 1),
(102, 176, 'Самарская область', 'SAM', 1),
(103, 176, 'Республика Мордовия', 'MO', 1),
(104, 176, 'Саратовская область', 'SAR', 1),
(105, 176, 'Смоленская область', 'SMO', 1),
(106, 176, 'Санкт-Петербург', 'SPE', 1),
(107, 176, 'Ставропольский край', 'STA', 1),
(108, 176, 'Республика Коми', 'KO', 1),
(109, 176, 'Тамбовская область', 'TAM', 1),
(110, 176, 'Томская область', 'TOM', 1),
(111, 176, 'Тульская область', 'TUL', 1),
(112, 176, 'Тверская область', 'TVE', 1),
(113, 176, 'Тюменская область', 'TYU', 1),
(114, 176, 'Республика Башкортостан', 'BA', 1),
(115, 176, 'Ульяновская область', 'ULY', 1),
(116, 176, 'Республика Бурятия', 'BU', 1),
(117, 176, 'Республика Северная Осетия', 'SE', 1),
(118, 176, 'Владимирская область', 'VLA', 1),
(119, 176, 'Приморский край', 'PRI', 1),
(120, 176, 'Волгоградская область', 'VGG', 1),
(121, 176, 'Вологодская область', 'VLG', 1),
(122, 176, 'Воронежская область', 'VOR', 1),
(123, 176, 'Кировская область', 'KIR', 1),
(124, 176, 'Республика Саха', 'SA', 1),
(125, 176, 'Ярославская область', 'YAR', 1),
(126, 176, 'Свердловская область', 'SVE', 1),
(127, 176, 'Республика Марий Эл', 'ME', 1),
(128, 176, 'Республика Крым', 'CR', 1),
(129, 220, 'Черкассы', 'CK', 1),
(130, 220, 'Чернигов', 'CH', 1),
(131, 220, 'Черновцы', 'CV', 1),
(132, 220, 'Днепропетровск', 'DN', 1),
(133, 220, 'Донецк', 'DO', 1),
(134, 220, 'Ивано-Франковск', 'IV', 1),
(135, 220, 'Харьков', 'KH', 1),
(136, 220, 'Хмельницкий', 'KM', 1),
(137, 220, 'Кировоград', 'KR', 1),
(138, 220, 'Киевская область', 'KV', 1),
(139, 220, 'Киев', 'KY', 1),
(140, 220, 'Луганск', 'LU', 1),
(141, 220, 'Львов', 'LV', 1),
(142, 220, 'Николаев', 'MY', 1),
(143, 220, 'Одесса', 'OD', 1),
(144, 220, 'Полтава', 'PO', 1),
(145, 220, 'Ровно', 'RI', 1),
(146, 176, 'Севастополь', 'SE', 1),
(147, 220, 'Сумы', 'SU', 1),
(148, 220, 'Тернополь', 'TE', 1),
(149, 220, 'Винница', 'VI', 1),
(150, 220, 'Луцк', 'VO', 1),
(151, 220, 'Ужгород', 'ZK', 1),
(152, 220, 'Запорожье', 'ZA', 1),
(153, 220, 'Житомир', 'ZH', 1),
(154, 220, 'Херсон', 'KE', 1),
(155, 226, 'Andijon', 'AN', 1),
(156, 226, 'Buxoro', 'BU', 1),
(157, 226, 'Farg''ona', 'FA', 1),
(158, 226, 'Jizzax', 'JI', 1),
(159, 226, 'Namangan', 'NG', 1),
(160, 226, 'Navoiy', 'NW', 1),
(161, 226, 'Qashqadaryo', 'QA', 1),
(162, 226, 'Qoraqalpog''iston Republikasi', 'QR', 1),
(163, 226, 'Samarqand', 'SA', 1),
(164, 226, 'Sirdaryo', 'SI', 1),
(165, 226, 'Surxondaryo', 'SU', 1),
(166, 226, 'Toshkent City', 'TK', 1),
(167, 226, 'Toshkent Region', 'TO', 1),
(168, 226, 'Xorazm', 'XO', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `ma_zone_to_geo_zone`
--

CREATE TABLE IF NOT EXISTS `ma_zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `geo_zone_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`zone_to_geo_zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=111 ;

--
-- Дамп данных таблицы `ma_zone_to_geo_zone`
--

INSERT INTO `ma_zone_to_geo_zone` (`zone_to_geo_zone_id`, `country_id`, `zone_id`, `geo_zone_id`, `date_added`, `date_modified`) VALUES
(1, 222, 0, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(110, 176, 0, 3, '2014-09-09 11:48:13', '0000-00-00 00:00:00');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
