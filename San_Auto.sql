-- phpMyAdmin SQL Dump
-- version 
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Авг 19 2021 г., 22:07
-- Версия сервера: 5.7.33-36-log
-- Версия PHP: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `host1642312_test14`
--

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_admin`
--

CREATE TABLE `oc_t_admin` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `s_name` varchar(100) NOT NULL,
  `s_username` varchar(40) NOT NULL,
  `s_password` char(60) NOT NULL,
  `s_email` varchar(100) DEFAULT NULL,
  `s_secret` varchar(40) DEFAULT NULL,
  `b_moderator` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_t_admin`
--

INSERT INTO `oc_t_admin` (`pk_i_id`, `s_name`, `s_username`, `s_password`, `s_email`, `s_secret`, `b_moderator`) VALUES
(1, 'Administrator', 'Artem', '$2y$15$aClCzVsBzrX2vTVfEjDdA.iLLk/zb2.ZjfCVUAd6S0Y2iAnK0JrIO', 'packpacki@yandex.ru', NULL, 0),
(3, 'admin', 'admin', '$2y$15$Qb2qhTyp84uSLwnjsGVHueyKTmJS.uQNMp8TX0B/DwQsbK9s6i7Em', 'admin@adgba.ru', NULL, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_alerts`
--

CREATE TABLE `oc_t_alerts` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `s_email` varchar(100) DEFAULT NULL,
  `fk_i_user_id` int(10) UNSIGNED DEFAULT NULL,
  `s_search` longtext,
  `s_secret` varchar(40) DEFAULT NULL,
  `b_active` tinyint(1) NOT NULL DEFAULT '0',
  `e_type` enum('INSTANT','HOURLY','DAILY','WEEKLY','CUSTOM') NOT NULL,
  `dt_date` datetime DEFAULT NULL,
  `dt_unsub_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_alerts_sent`
--

CREATE TABLE `oc_t_alerts_sent` (
  `d_date` date NOT NULL,
  `i_num_alerts_sent` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_attribute`
--

CREATE TABLE `oc_t_attribute` (
  `pk_i_id` int(11) NOT NULL,
  `s_identifier` varchar(100) DEFAULT NULL,
  `b_enabled` tinyint(1) DEFAULT '1',
  `b_required` tinyint(1) DEFAULT '0',
  `b_search` tinyint(1) DEFAULT '0',
  `b_hook` tinyint(1) DEFAULT '1',
  `b_values_all` tinyint(1) DEFAULT '0',
  `s_category_id` varchar(1000) DEFAULT NULL,
  `i_order` int(10) DEFAULT '1',
  `s_type` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_t_attribute`
--

INSERT INTO `oc_t_attribute` (`pk_i_id`, `s_identifier`, `b_enabled`, `b_required`, `b_search`, `b_hook`, `b_values_all`, `s_category_id`, `i_order`, `s_type`) VALUES
(9, 'tipdoma', 1, NULL, 1, 1, NULL, '4,43,44,45,46,47,50,51', 1, 'SELECT'),
(10, 'lifti', 1, NULL, 1, 1, NULL, '4,43,44,45,46,47,50,51', 4, 'SELECT'),
(11, 'remont', 1, NULL, 1, 1, NULL, '4,43,44,45,46,47,50,51', 9, 'SELECT'),
(12, 'godpostr', 1, NULL, 1, 1, NULL, '4,43,44,45,46,47,50,51', 5, 'TEXT'),
(13, 'srokvlad', 1, NULL, 1, 1, NULL, '4,43,44,45,46,47,50,51', 6, 'SELECT'),
(14, 'obshploshad', 1, NULL, 1, 1, NULL, '4,43,44,45,46,47,50,51', 7, 'TEXT'),
(16, 'ploshadkag', 1, NULL, NULL, 1, NULL, '4,43,44,45,46,47,50,51', 8, 'TEXTAREA'),
(17, 'etag', 1, NULL, NULL, 1, NULL, '4,43,44,45,46,47,50,51', 2, 'TEXT'),
(18, 'etagnost', 1, NULL, NULL, 1, NULL, '4,43,44,45,46,47,50,51', 3, 'TEXT'),
(19, 'sanuz', 1, NULL, NULL, 1, NULL, '4,43,44,45,46,47,50,51', 10, 'SELECT'),
(20, 'ktoraz', 1, NULL, NULL, 1, NULL, '4,43,44,45,46,47,50,51', 14, 'SELECT'),
(21, 'ballodg', 1, NULL, NULL, 1, NULL, '4,43,44,45,46,47,50,51', 11, 'SELECT'),
(22, 'infro', 1, NULL, NULL, 1, NULL, '4,43,44,45,46,47,50,51', 12, 'TEXTAREA'),
(23, 'metro', 1, NULL, NULL, 1, NULL, '4,43,44,45,46,47,50,51', 13, 'SELECT');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_attribute_locale`
--

CREATE TABLE `oc_t_attribute_locale` (
  `pk_i_id` int(11) NOT NULL,
  `fk_i_attribute_id` int(11) NOT NULL,
  `fk_c_locale_code` char(5) NOT NULL,
  `s_name` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_t_attribute_locale`
--

INSERT INTO `oc_t_attribute_locale` (`pk_i_id`, `fk_i_attribute_id`, `fk_c_locale_code`, `s_name`) VALUES
(9, 9, 'ru_RU', 'Тип дома'),
(10, 10, 'ru_RU', 'Лифты'),
(11, 11, 'ru_RU', 'Ремонт'),
(12, 12, 'ru_RU', 'Год постройки'),
(13, 13, 'ru_RU', 'Срок владения'),
(14, 14, 'ru_RU', 'Общ. Площадь (м2)'),
(15, 16, 'ru_RU', 'Каждая комната по площади:'),
(16, 17, 'ru_RU', 'Этаж'),
(17, 18, 'ru_RU', 'Этажность дома'),
(18, 19, 'ru_RU', 'Санузлы:'),
(19, 20, 'ru_RU', 'Кто разместил'),
(20, 21, 'ru_RU', 'Балкон или лоджия:'),
(21, 22, 'ru_RU', 'Инфраструктура. Школа, др.:'),
(22, 23, 'ru_RU', 'До метро:');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_attribute_value`
--

CREATE TABLE `oc_t_attribute_value` (
  `pk_i_id` int(11) NOT NULL,
  `fk_i_attribute_id` int(11) NOT NULL,
  `fk_i_parent_id` int(10) DEFAULT NULL,
  `s_image` varchar(200) DEFAULT NULL,
  `i_order` int(10) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_t_attribute_value`
--

INSERT INTO `oc_t_attribute_value` (`pk_i_id`, `fk_i_attribute_id`, `fk_i_parent_id`, `s_image`, `i_order`) VALUES
(51, 9, NULL, '', 9999),
(52, 9, NULL, '', 9999),
(53, 9, NULL, '', 9999),
(54, 9, NULL, '', 9999),
(55, 9, NULL, '', 9999),
(56, 9, NULL, '', 9999),
(57, 10, NULL, '', 9999),
(58, 10, NULL, '', 9999),
(59, 10, NULL, '', 9999),
(60, 10, NULL, '', 9999),
(61, 11, NULL, '', 9999),
(62, 11, NULL, '', 9999),
(63, 11, NULL, '', 9999),
(64, 11, NULL, '', 9999),
(65, 11, NULL, '', 9999),
(66, 11, NULL, '', 9999),
(67, 13, NULL, '', 9999),
(68, 13, NULL, '', 9999),
(69, 13, NULL, '', 9999),
(70, 19, NULL, '', 9999),
(71, 19, NULL, '', 9999),
(72, 19, NULL, '', 9999),
(73, 20, NULL, '', 9999),
(74, 20, NULL, '', 9999),
(75, 21, NULL, '', 9999),
(76, 21, NULL, '', 9999),
(77, 21, NULL, '', 9999),
(79, 23, NULL, '', 9999),
(80, 23, NULL, '', 9999),
(81, 23, NULL, '', 9999),
(82, 23, NULL, '', 9999),
(83, 23, NULL, '', 9999);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_attribute_value_locale`
--

CREATE TABLE `oc_t_attribute_value_locale` (
  `pk_i_id` int(11) NOT NULL,
  `fk_i_attribute_value_id` int(11) NOT NULL,
  `fk_c_locale_code` char(5) NOT NULL,
  `s_name` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_t_attribute_value_locale`
--

INSERT INTO `oc_t_attribute_value_locale` (`pk_i_id`, `fk_i_attribute_value_id`, `fk_c_locale_code`, `s_name`) VALUES
(50, 51, 'ru_RU', 'Панельный'),
(51, 52, 'ru_RU', 'Кирпичный'),
(52, 53, 'ru_RU', 'Монолит'),
(53, 54, 'ru_RU', 'Кирпично-Монолитный'),
(54, 55, 'ru_RU', 'Блочный'),
(55, 56, 'ru_RU', 'Деревянный'),
(56, 57, 'ru_RU', 'Нет'),
(57, 58, 'ru_RU', 'Легковой'),
(58, 59, 'ru_RU', 'Легковой и грузовой'),
(59, 60, 'ru_RU', '3 и более лифтов'),
(60, 61, 'ru_RU', 'Требуется'),
(61, 62, 'ru_RU', 'Не требуется'),
(62, 63, 'ru_RU', 'Косметический'),
(63, 64, 'ru_RU', 'Евроремонт'),
(64, 65, 'ru_RU', 'Дизайнерский'),
(65, 66, 'ru_RU', 'Капитальный'),
(66, 67, 'ru_RU', 'До 3-х лет'),
(67, 68, 'ru_RU', 'От 3-х до 5-ти лет'),
(68, 69, 'ru_RU', 'Более 5-ти лет'),
(69, 70, 'ru_RU', '1'),
(70, 71, 'ru_RU', '2'),
(71, 72, 'ru_RU', 'Более'),
(72, 73, 'ru_RU', 'Собственник'),
(73, 74, 'ru_RU', 'Агент'),
(74, 75, 'ru_RU', 'Нет'),
(75, 76, 'ru_RU', 'Балкон'),
(76, 77, 'ru_RU', 'Лоджия'),
(77, 79, 'ru_RU', 'До 5 мин. пешком'),
(78, 80, 'ru_RU', 'До 10-15 мин. пешком'),
(79, 81, 'ru_RU', 'Более 15 мин. пешком'),
(80, 82, 'ru_RU', 'На транспорте'),
(81, 83, 'ru_RU', 'Метро планируется');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_ban_rule`
--

CREATE TABLE `oc_t_ban_rule` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `s_name` varchar(250) NOT NULL DEFAULT '',
  `s_ip` varchar(50) NOT NULL DEFAULT '',
  `s_email` varchar(250) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_categories_seo`
--

CREATE TABLE `oc_t_categories_seo` (
  `seo_category_id` int(10) UNSIGNED NOT NULL,
  `seo_title` varchar(800) DEFAULT NULL,
  `seo_description` varchar(1200) DEFAULT NULL,
  `seo_keywords` varchar(800) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_category`
--

CREATE TABLE `oc_t_category` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `fk_i_parent_id` int(10) UNSIGNED DEFAULT NULL,
  `i_expiration_days` int(3) UNSIGNED NOT NULL DEFAULT '0',
  `i_position` int(2) UNSIGNED NOT NULL DEFAULT '0',
  `b_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `b_price_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `s_icon` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_t_category`
--

INSERT INTO `oc_t_category` (`pk_i_id`, `fk_i_parent_id`, `i_expiration_days`, `i_position`, `b_enabled`, `b_price_enabled`, `s_icon`) VALUES
(2, NULL, 0, 2, 1, 1, NULL),
(31, 2, 0, 1, 1, 1, NULL),
(96, NULL, 0, 0, 1, 1, NULL),
(97, NULL, 0, 1, 1, 1, NULL),
(98, NULL, 0, 2, 1, 1, NULL),
(99, NULL, 0, 3, 1, 1, NULL),
(100, NULL, 0, 4, 1, 1, NULL),
(101, NULL, 0, 5, 1, 1, NULL),
(102, NULL, 0, 6, 1, 1, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_category_description`
--

CREATE TABLE `oc_t_category_description` (
  `fk_i_category_id` int(10) UNSIGNED NOT NULL,
  `fk_c_locale_code` char(5) NOT NULL,
  `s_name` varchar(100) DEFAULT NULL,
  `s_description` text,
  `s_slug` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_t_category_description`
--

INSERT INTO `oc_t_category_description` (`fk_i_category_id`, `fk_c_locale_code`, `s_name`, `s_description`, `s_slug`) VALUES
(96, 'ru_RU', 'Легковые автомобили', NULL, 'legkovye-avtomobili'),
(97, 'ru_RU', 'Грузовые автомобили', NULL, 'gryzovye-avtomobili'),
(98, 'ru_RU', 'Фургоны, дома на колесах, трейлеры', NULL, 'fyrgony-doma-na-kolesax-trejlery'),
(99, 'ru_RU', 'Мотоциклы', NULL, 'motocikly'),
(100, 'ru_RU', 'Лодки, яхты', NULL, 'lodki-yaxty'),
(101, 'ru_RU', 'Другие транспортные средства', NULL, 'drygie-transportnye-sredstva'),
(102, 'ru_RU', 'Автозапчасти', NULL, 'avtozapchasti');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_category_stats`
--

CREATE TABLE `oc_t_category_stats` (
  `fk_i_category_id` int(10) UNSIGNED NOT NULL,
  `i_num_items` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_t_category_stats`
--

INSERT INTO `oc_t_category_stats` (`fk_i_category_id`, `i_num_items`) VALUES
(31, 0),
(96, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_category_veronika`
--

CREATE TABLE `oc_t_category_veronika` (
  `fk_i_category_id` int(11) UNSIGNED NOT NULL,
  `s_color` varchar(100) DEFAULT NULL,
  `s_icon` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_t_category_veronika`
--

INSERT INTO `oc_t_category_veronika` (`fk_i_category_id`, `s_color`, `s_icon`) VALUES
(2, NULL, NULL),
(31, NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_city`
--

CREATE TABLE `oc_t_city` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `fk_i_region_id` int(10) UNSIGNED NOT NULL,
  `s_name` varchar(60) NOT NULL,
  `s_slug` varchar(60) NOT NULL DEFAULT '',
  `fk_c_country_code` char(2) DEFAULT NULL,
  `b_active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_t_city`
--

INSERT INTO `oc_t_city` (`pk_i_id`, `fk_i_region_id`, `s_name`, `s_slug`, `fk_c_country_code`, `b_active`) VALUES
(1, 1, 'Адыгейск', '%d0%90%d0%b4%d1%8b%d0%b3%d0%b5%d0%b9%d1%81%d0%ba', 'RU', 1),
(2, 1, 'Майкоп', '%d0%9c%d0%b0%d0%b9%d0%ba%d0%be%d0%bf', 'RU', 1),
(3, 2, 'Горно-Алтайск', '%d0%93%d0%be%d1%80%d0%bd%d0%be-%d0%90%d0%bb%d1%82%d0%b0%d0%b', 'RU', 1),
(4, 3, 'Алейск', '%d0%90%d0%bb%d0%b5%d0%b9%d1%81%d0%ba', 'RU', 1),
(5, 3, 'Барнаул', '%d0%91%d0%b0%d1%80%d0%bd%d0%b0%d1%83%d0%bb', 'RU', 1),
(6, 3, 'Белокуриха', '%d0%91%d0%b5%d0%bb%d0%be%d0%ba%d1%83%d1%80%d0%b8%d1%85%d0%b0', 'RU', 1),
(7, 3, 'Бийск', '%d0%91%d0%b8%d0%b9%d1%81%d0%ba', 'RU', 1),
(8, 3, 'Горняк', '%d0%93%d0%be%d1%80%d0%bd%d1%8f%d0%ba', 'RU', 1),
(9, 3, 'Заринск', '%d0%97%d0%b0%d1%80%d0%b8%d0%bd%d1%81%d0%ba', 'RU', 1),
(10, 3, 'Змеиногорск', '%d0%97%d0%bc%d0%b5%d0%b8%d0%bd%d0%be%d0%b3%d0%be%d1%80%d1%81', 'RU', 1),
(11, 3, 'Камень-на-Оби', '%d0%9a%d0%b0%d0%bc%d0%b5%d0%bd%d1%8c-%d0%bd%d0%b0-%d0%9e%d0%', 'RU', 1),
(12, 3, 'Новоалтайск', '%d0%9d%d0%be%d0%b2%d0%be%d0%b0%d0%bb%d1%82%d0%b0%d0%b9%d1%81', 'RU', 1),
(13, 3, 'Рубцовск', '%d0%a0%d1%83%d0%b1%d1%86%d0%be%d0%b2%d1%81%d0%ba', 'RU', 1),
(14, 3, 'Славгород', '%d0%a1%d0%bb%d0%b0%d0%b2%d0%b3%d0%be%d1%80%d0%be%d0%b4', 'RU', 1),
(15, 3, 'Яровое', '%d0%af%d1%80%d0%be%d0%b2%d0%be%d0%b5', 'RU', 1),
(16, 3, 'Белогорск', '%d0%91%d0%b5%d0%bb%d0%be%d0%b3%d0%be%d1%80%d1%81%d0%ba', 'RU', 1),
(17, 4, 'Белогорск', '%d0%91%d0%b5%d0%bb%d0%be%d0%b3%d0%be%d1%80%d1%81%d0%ba-1', 'RU', 1),
(18, 4, 'Благовещенск', '%d0%91%d0%bb%d0%b0%d0%b3%d0%be%d0%b2%d0%b5%d1%89%d0%b5%d0%bd', 'RU', 1),
(19, 4, 'Завитинск', '%d0%97%d0%b0%d0%b2%d0%b8%d1%82%d0%b8%d0%bd%d1%81%d0%ba', 'RU', 1),
(20, 4, 'Зея', '%d0%97%d0%b5%d1%8f', 'RU', 1),
(21, 4, 'Райчихинск', '%d0%a0%d0%b0%d0%b9%d1%87%d0%b8%d1%85%d0%b8%d0%bd%d1%81%d0%ba', 'RU', 1),
(22, 4, 'Свободный', '%d0%a1%d0%b2%d0%be%d0%b1%d0%be%d0%b4%d0%bd%d1%8b%d0%b9', 'RU', 1),
(23, 4, 'Сковородино', '%d0%a1%d0%ba%d0%be%d0%b2%d0%be%d1%80%d0%be%d0%b4%d0%b8%d0%bd', 'RU', 1),
(24, 4, 'Тында', '%d0%a2%d1%8b%d0%bd%d0%b4%d0%b0', 'RU', 1),
(25, 4, 'Шимановск', '%d0%a8%d0%b8%d0%bc%d0%b0%d0%bd%d0%be%d0%b2%d1%81%d0%ba', 'RU', 1),
(26, 5, 'Архангельск', '%d0%90%d1%80%d1%85%d0%b0%d0%bd%d0%b3%d0%b5%d0%bb%d1%8c%d1%81', 'RU', 1),
(27, 5, 'Вельск', '%d0%92%d0%b5%d0%bb%d1%8c%d1%81%d0%ba', 'RU', 1),
(28, 5, 'Каргополь', '%d0%9a%d0%b0%d1%80%d0%b3%d0%be%d0%bf%d0%be%d0%bb%d1%8c', 'RU', 1),
(29, 5, 'Коряжма', '%d0%9a%d0%be%d1%80%d1%8f%d0%b6%d0%bc%d0%b0', 'RU', 1),
(30, 5, 'Котлас', '%d0%9a%d0%be%d1%82%d0%bb%d0%b0%d1%81', 'RU', 1),
(31, 5, 'Мезень', '%d0%9c%d0%b5%d0%b7%d0%b5%d0%bd%d1%8c', 'RU', 1),
(32, 5, 'Мирный', '%d0%9c%d0%b8%d1%80%d0%bd%d1%8b%d0%b9', 'RU', 1),
(33, 5, 'Новодвинск', '%d0%9d%d0%be%d0%b2%d0%be%d0%b4%d0%b2%d0%b8%d0%bd%d1%81%d0%ba', 'RU', 1),
(34, 5, 'Няндома', '%d0%9d%d1%8f%d0%bd%d0%b4%d0%be%d0%bc%d0%b0', 'RU', 1),
(35, 5, 'Онега', '%d0%9e%d0%bd%d0%b5%d0%b3%d0%b0', 'RU', 1),
(36, 5, 'Северодвинск', '%d0%a1%d0%b5%d0%b2%d0%b5%d1%80%d0%be%d0%b4%d0%b2%d0%b8%d0%bd', 'RU', 1),
(37, 5, 'Сольвычегодск', '%d0%a1%d0%be%d0%bb%d1%8c%d0%b2%d1%8b%d1%87%d0%b5%d0%b3%d0%be', 'RU', 1),
(39, 5, 'Астрахань', '%d0%90%d1%81%d1%82%d1%80%d0%b0%d1%85%d0%b0%d0%bd%d1%8c', 'RU', 1),
(41, 5, 'Шенкурск', '%d0%a8%d0%b5%d0%bd%d0%ba%d1%83%d1%80%d1%81%d0%ba', 'RU', 1),
(42, 6, 'Астрахань', '%d0%90%d1%81%d1%82%d1%80%d0%b0%d1%85%d0%b0%d0%bd%d1%8c-1', 'RU', 1),
(43, 6, 'Ахтубинск', '%d0%90%d1%85%d1%82%d1%83%d0%b1%d0%b8%d0%bd%d1%81%d0%ba', 'RU', 1),
(44, 6, 'Знаменск', '%d0%97%d0%bd%d0%b0%d0%bc%d0%b5%d0%bd%d1%81%d0%ba', 'RU', 1),
(45, 6, 'Камызяк', '%d0%9a%d0%b0%d0%bc%d1%8b%d0%b7%d1%8f%d0%ba', 'RU', 1),
(46, 6, 'Нариманов', '%d0%9d%d0%b0%d1%80%d0%b8%d0%bc%d0%b0%d0%bd%d0%be%d0%b2', 'RU', 1),
(47, 6, 'Харабали', '%d0%a5%d0%b0%d1%80%d0%b0%d0%b1%d0%b0%d0%bb%d0%b8', 'RU', 1),
(48, 7, 'Агидель', '%d0%90%d0%b3%d0%b8%d0%b4%d0%b5%d0%bb%d1%8c', 'RU', 1),
(49, 7, 'Баймак', '%d0%91%d0%b0%d0%b9%d0%bc%d0%b0%d0%ba', 'RU', 1),
(50, 7, 'Белебей', '%d0%91%d0%b5%d0%bb%d0%b5%d0%b1%d0%b5%d0%b9', 'RU', 1),
(51, 7, 'Белорецк', '%d0%91%d0%b5%d0%bb%d0%be%d1%80%d0%b5%d1%86%d0%ba', 'RU', 1),
(52, 7, 'Бирск', '%d0%91%d0%b8%d1%80%d1%81%d0%ba', 'RU', 1),
(53, 7, 'Благовещенск', '%d0%91%d0%bb%d0%b0%d0%b3%d0%be%d0%b2%d0%b5%d1%89%d0%b5%d0%bd', 'RU', 1),
(54, 7, 'Давлеканово', '%d0%94%d0%b0%d0%b2%d0%bb%d0%b5%d0%ba%d0%b0%d0%bd%d0%be%d0%b2', 'RU', 1),
(55, 7, 'Дюртюли', '%d0%94%d1%8e%d1%80%d1%82%d1%8e%d0%bb%d0%b8', 'RU', 1),
(56, 7, 'Ишимбай', '%d0%98%d1%88%d0%b8%d0%bc%d0%b1%d0%b0%d0%b9', 'RU', 1),
(57, 7, 'Кумертау', '%d0%9a%d1%83%d0%bc%d0%b5%d1%80%d1%82%d0%b0%d1%83', 'RU', 1),
(58, 7, 'Межгорье', '%d0%9c%d0%b5%d0%b6%d0%b3%d0%be%d1%80%d1%8c%d0%b5', 'RU', 1),
(59, 7, 'Мелеуз', '%d0%9c%d0%b5%d0%bb%d0%b5%d1%83%d0%b7', 'RU', 1),
(60, 7, 'Нефтекамск', '%d0%9d%d0%b5%d1%84%d1%82%d0%b5%d0%ba%d0%b0%d0%bc%d1%81%d0%ba', 'RU', 1),
(61, 7, 'Октябрьский', '%d0%9e%d0%ba%d1%82%d1%8f%d0%b1%d1%80%d1%8c%d1%81%d0%ba%d0%b8', 'RU', 1),
(62, 7, 'Салават', '%d0%a1%d0%b0%d0%bb%d0%b0%d0%b2%d0%b0%d1%82', 'RU', 1),
(63, 7, 'Сибай', '%d0%a1%d0%b8%d0%b1%d0%b0%d0%b9', 'RU', 1),
(64, 7, 'Стерлитамак', '%d0%a1%d1%82%d0%b5%d1%80%d0%bb%d0%b8%d1%82%d0%b0%d0%bc%d0%b0', 'RU', 1),
(65, 7, 'Туймазы', '%d0%a2%d1%83%d0%b9%d0%bc%d0%b0%d0%b7%d1%8b', 'RU', 1),
(66, 7, 'Уфа', '%d0%a3%d1%84%d0%b0', 'RU', 1),
(67, 7, 'Учалы', '%d0%a3%d1%87%d0%b0%d0%bb%d1%8b', 'RU', 1),
(68, 7, 'Янаул', '%d0%af%d0%bd%d0%b0%d1%83%d0%bb', 'RU', 1),
(69, 8, 'Алексеевка', '%d0%90%d0%bb%d0%b5%d0%ba%d1%81%d0%b5%d0%b5%d0%b2%d0%ba%d0%b0', 'RU', 1),
(70, 8, 'Белгород', '%d0%91%d0%b5%d0%bb%d0%b3%d0%be%d1%80%d0%be%d0%b4', 'RU', 1),
(71, 8, 'Бирюч', '%d0%91%d0%b8%d1%80%d1%8e%d1%87', 'RU', 1),
(72, 8, 'Валуйки', '%d0%92%d0%b0%d0%bb%d1%83%d0%b9%d0%ba%d0%b8', 'RU', 1),
(73, 8, 'Грайворон', '%d0%93%d1%80%d0%b0%d0%b9%d0%b2%d0%be%d1%80%d0%be%d0%bd', 'RU', 1),
(74, 8, 'Губкин', '%d0%93%d1%83%d0%b1%d0%ba%d0%b8%d0%bd', 'RU', 1),
(75, 8, 'Короча', '%d0%9a%d0%be%d1%80%d0%be%d1%87%d0%b0', 'RU', 1),
(76, 8, 'Новый Оскол', '%d0%9d%d0%be%d0%b2%d1%8b%d0%b9-%d0%9e%d1%81%d0%ba%d0%be%d0%b', 'RU', 1),
(77, 8, 'Старый Оскол', '%d0%a1%d1%82%d0%b0%d1%80%d1%8b%d0%b9-%d0%9e%d1%81%d0%ba%d0%b', 'RU', 1),
(78, 8, 'Строитель', '%d0%a1%d1%82%d1%80%d0%be%d0%b8%d1%82%d0%b5%d0%bb%d1%8c', 'RU', 1),
(79, 8, 'Шебекино', '%d0%a8%d0%b5%d0%b1%d0%b5%d0%ba%d0%b8%d0%bd%d0%be', 'RU', 1),
(80, 9, 'Брянск', '%d0%91%d1%80%d1%8f%d0%bd%d1%81%d0%ba', 'RU', 1),
(81, 9, 'Дятьково', '%d0%94%d1%8f%d1%82%d1%8c%d0%ba%d0%be%d0%b2%d0%be', 'RU', 1),
(82, 9, 'Жуковка', '%d0%96%d1%83%d0%ba%d0%be%d0%b2%d0%ba%d0%b0', 'RU', 1),
(83, 9, 'Злынка', '%d0%97%d0%bb%d1%8b%d0%bd%d0%ba%d0%b0', 'RU', 1),
(84, 9, 'Карачев', '%d0%9a%d0%b0%d1%80%d0%b0%d1%87%d0%b5%d0%b2', 'RU', 1),
(85, 9, 'Клинцы', '%d0%9a%d0%bb%d0%b8%d0%bd%d1%86%d1%8b', 'RU', 1),
(86, 9, 'Мглин', '%d0%9c%d0%b3%d0%bb%d0%b8%d0%bd', 'RU', 1),
(87, 9, 'Новозыбков', '%d0%9d%d0%be%d0%b2%d0%be%d0%b7%d1%8b%d0%b1%d0%ba%d0%be%d0%b2', 'RU', 1),
(88, 9, 'Почеп', '%d0%9f%d0%be%d1%87%d0%b5%d0%bf', 'RU', 1),
(89, 9, 'Севск', '%d0%a1%d0%b5%d0%b2%d1%81%d0%ba', 'RU', 1),
(90, 9, 'Сельцо', '%d0%a1%d0%b5%d0%bb%d1%8c%d1%86%d0%be', 'RU', 1),
(91, 9, 'Стародуб', '%d0%a1%d1%82%d0%b0%d1%80%d0%be%d0%b4%d1%83%d0%b1', 'RU', 1),
(92, 9, 'Сураж', '%d0%a1%d1%83%d1%80%d0%b0%d0%b6', 'RU', 1),
(93, 9, 'Трубчевск', '%d0%a2%d1%80%d1%83%d0%b1%d1%87%d0%b5%d0%b2%d1%81%d0%ba', 'RU', 1),
(94, 9, 'Унеча', '%d0%a3%d0%bd%d0%b5%d1%87%d0%b0', 'RU', 1),
(95, 9, 'Фокино', '%d0%a4%d0%be%d0%ba%d0%b8%d0%bd%d0%be', 'RU', 1),
(96, 10, 'Бабушкин', '%d0%91%d0%b0%d0%b1%d1%83%d1%88%d0%ba%d0%b8%d0%bd', 'RU', 1),
(97, 10, 'Гусиноозёрск', '%d0%93%d1%83%d1%81%d0%b8%d0%bd%d0%be%d0%be%d0%b7%d1%91%d1%80', 'RU', 1),
(98, 10, 'Закаменск', '%d0%97%d0%b0%d0%ba%d0%b0%d0%bc%d0%b5%d0%bd%d1%81%d0%ba', 'RU', 1),
(99, 10, 'Кяхта', '%d0%9a%d1%8f%d1%85%d1%82%d0%b0', 'RU', 1),
(100, 10, 'Северобайкальск', '%d0%a1%d0%b5%d0%b2%d0%b5%d1%80%d0%be%d0%b1%d0%b0%d0%b9%d0%ba', 'RU', 1),
(101, 10, 'Улан-Удэ', '%d0%a3%d0%bb%d0%b0%d0%bd-%d0%a3%d0%b4%d1%8d', 'RU', 1),
(102, 11, 'Александров', '%d0%90%d0%bb%d0%b5%d0%ba%d1%81%d0%b0%d0%bd%d0%b4%d1%80%d0%be', 'RU', 1),
(103, 11, 'Владимир', '%d0%92%d0%bb%d0%b0%d0%b4%d0%b8%d0%bc%d0%b8%d1%80', 'RU', 1),
(104, 11, 'Вязники', '%d0%92%d1%8f%d0%b7%d0%bd%d0%b8%d0%ba%d0%b8', 'RU', 1),
(105, 11, 'Гороховец', '%d0%93%d0%be%d1%80%d0%be%d1%85%d0%be%d0%b2%d0%b5%d1%86', 'RU', 1),
(106, 11, 'Гусь-Хрустальный', '%d0%93%d1%83%d1%81%d1%8c-%d0%a5%d1%80%d1%83%d1%81%d1%82%d0%b', 'RU', 1),
(107, 11, 'Камешково', '%d0%9a%d0%b0%d0%bc%d0%b5%d1%88%d0%ba%d0%be%d0%b2%d0%be', 'RU', 1),
(108, 11, 'Карабаново', '%d0%9a%d0%b0%d1%80%d0%b0%d0%b1%d0%b0%d0%bd%d0%be%d0%b2%d0%be', 'RU', 1),
(109, 11, 'Киржач', '%d0%9a%d0%b8%d1%80%d0%b6%d0%b0%d1%87', 'RU', 1),
(110, 11, 'Ковров', '%d0%9a%d0%be%d0%b2%d1%80%d0%be%d0%b2', 'RU', 1),
(111, 11, 'Кольчугино', '%d0%9a%d0%be%d0%bb%d1%8c%d1%87%d1%83%d0%b3%d0%b8%d0%bd%d0%be', 'RU', 1),
(112, 11, 'Костерёво', '%d0%9a%d0%be%d1%81%d1%82%d0%b5%d1%80%d1%91%d0%b2%d0%be', 'RU', 1),
(113, 11, 'Курлово', '%d0%9a%d1%83%d1%80%d0%bb%d0%be%d0%b2%d0%be', 'RU', 1),
(114, 11, 'Лакинск', '%d0%9b%d0%b0%d0%ba%d0%b8%d0%bd%d1%81%d0%ba', 'RU', 1),
(115, 11, 'Меленки', '%d0%9c%d0%b5%d0%bb%d0%b5%d0%bd%d0%ba%d0%b8', 'RU', 1),
(116, 11, 'Муром', '%d0%9c%d1%83%d1%80%d0%be%d0%bc', 'RU', 1),
(117, 11, 'Петушки', '%d0%9f%d0%b5%d1%82%d1%83%d1%88%d0%ba%d0%b8', 'RU', 1),
(118, 11, 'Покров', '%d0%9f%d0%be%d0%ba%d1%80%d0%be%d0%b2', 'RU', 1),
(119, 11, 'Радужный', '%d0%a0%d0%b0%d0%b4%d1%83%d0%b6%d0%bd%d1%8b%d0%b9', 'RU', 1),
(120, 11, 'Собинка', '%d0%a1%d0%be%d0%b1%d0%b8%d0%bd%d0%ba%d0%b0', 'RU', 1),
(121, 11, 'Струнино', '%d0%a1%d1%82%d1%80%d1%83%d0%bd%d0%b8%d0%bd%d0%be', 'RU', 1),
(122, 11, 'Судогда', '%d0%a1%d1%83%d0%b4%d0%be%d0%b3%d0%b4%d0%b0', 'RU', 1),
(123, 11, 'Суздаль', '%d0%a1%d1%83%d0%b7%d0%b4%d0%b0%d0%bb%d1%8c', 'RU', 1),
(124, 11, 'Юрьев-Польский', '%d0%ae%d1%80%d1%8c%d0%b5%d0%b2-%d0%9f%d0%be%d0%bb%d1%8c%d1%8', 'RU', 1),
(125, 12, 'Волгоград', '%d0%92%d0%be%d0%bb%d0%b3%d0%be%d0%b3%d1%80%d0%b0%d0%b4', 'RU', 1),
(126, 12, 'Волжский', '%d0%92%d0%be%d0%bb%d0%b6%d1%81%d0%ba%d0%b8%d0%b9', 'RU', 1),
(127, 12, 'Дубовка', '%d0%94%d1%83%d0%b1%d0%be%d0%b2%d0%ba%d0%b0', 'RU', 1),
(128, 12, 'Жирновск', '%d0%96%d0%b8%d1%80%d0%bd%d0%be%d0%b2%d1%81%d0%ba', 'RU', 1),
(129, 12, 'Калач-на-Дону', '%d0%9a%d0%b0%d0%bb%d0%b0%d1%87-%d0%bd%d0%b0-%d0%94%d0%be%d0%', 'RU', 1),
(130, 12, 'Камышин', '%d0%9a%d0%b0%d0%bc%d1%8b%d1%88%d0%b8%d0%bd', 'RU', 1),
(131, 12, 'Котельниково', '%d0%9a%d0%be%d1%82%d0%b5%d0%bb%d1%8c%d0%bd%d0%b8%d0%ba%d0%be', 'RU', 1),
(132, 12, 'Котово', '%d0%9a%d0%be%d1%82%d0%be%d0%b2%d0%be', 'RU', 1),
(133, 12, 'Краснослободск', '%d0%9a%d1%80%d0%b0%d1%81%d0%bd%d0%be%d1%81%d0%bb%d0%be%d0%b1', 'RU', 1),
(134, 12, 'Ленинск', '%d0%9b%d0%b5%d0%bd%d0%b8%d0%bd%d1%81%d0%ba', 'RU', 1),
(135, 12, 'Михайловка', '%d0%9c%d0%b8%d1%85%d0%b0%d0%b9%d0%bb%d0%be%d0%b2%d0%ba%d0%b0', 'RU', 1),
(136, 12, 'Николаевск', '%d0%9d%d0%b8%d0%ba%d0%be%d0%bb%d0%b0%d0%b5%d0%b2%d1%81%d0%ba', 'RU', 1),
(137, 12, 'Новоаннинский', '%d0%9d%d0%be%d0%b2%d0%be%d0%b0%d0%bd%d0%bd%d0%b8%d0%bd%d1%81', 'RU', 1),
(138, 12, 'Палласовка', '%d0%9f%d0%b0%d0%bb%d0%bb%d0%b0%d1%81%d0%be%d0%b2%d0%ba%d0%b0', 'RU', 1),
(139, 12, 'Петров Вал', '%d0%9f%d0%b5%d1%82%d1%80%d0%be%d0%b2-%d0%92%d0%b0%d0%bb', 'RU', 1),
(140, 12, 'Серафимович', '%d0%a1%d0%b5%d1%80%d0%b0%d1%84%d0%b8%d0%bc%d0%be%d0%b2%d0%b8', 'RU', 1),
(141, 12, 'Суровикино', '%d0%a1%d1%83%d1%80%d0%be%d0%b2%d0%b8%d0%ba%d0%b8%d0%bd%d0%be', 'RU', 1),
(142, 12, 'Урюпинск', '%d0%a3%d1%80%d1%8e%d0%bf%d0%b8%d0%bd%d1%81%d0%ba', 'RU', 1),
(143, 12, 'Фролово', '%d0%a4%d1%80%d0%be%d0%bb%d0%be%d0%b2%d0%be', 'RU', 1),
(154, 85, 'Бабаево', '%d0%91%d0%b0%d0%b1%d0%b0%d0%b5%d0%b2%d0%be', 'RU', 1),
(155, 85, 'Белозерск', '%d0%91%d0%b5%d0%bb%d0%be%d0%b7%d0%b5%d1%80%d1%81%d0%ba', 'RU', 1),
(156, 85, 'Великий Устюг', '%d0%92%d0%b5%d0%bb%d0%b8%d0%ba%d0%b8%d0%b9-%d0%a3%d1%81%d1%8', 'RU', 1),
(157, 85, 'Вологда', '%d0%92%d0%be%d0%bb%d0%be%d0%b3%d0%b4%d0%b0', 'RU', 1),
(158, 85, 'Вытегра', '%d0%92%d1%8b%d1%82%d0%b5%d0%b3%d1%80%d0%b0', 'RU', 1),
(159, 85, 'Грязовец', '%d0%93%d1%80%d1%8f%d0%b7%d0%be%d0%b2%d0%b5%d1%86', 'RU', 1),
(160, 85, 'Кадников', '%d0%9a%d0%b0%d0%b4%d0%bd%d0%b8%d0%ba%d0%be%d0%b2', 'RU', 1),
(161, 85, 'Кириллов', '%d0%9a%d0%b8%d1%80%d0%b8%d0%bb%d0%bb%d0%be%d0%b2', 'RU', 1),
(162, 85, 'Красавино', '%d0%9a%d1%80%d0%b0%d1%81%d0%b0%d0%b2%d0%b8%d0%bd%d0%be', 'RU', 1),
(163, 85, 'Никольск', '%d0%9d%d0%b8%d0%ba%d0%be%d0%bb%d1%8c%d1%81%d0%ba', 'RU', 1),
(164, 85, 'Сокол', '%d0%a1%d0%be%d0%ba%d0%be%d0%bb', 'RU', 1),
(165, 85, 'Тотьма', '%d0%a2%d0%be%d1%82%d1%8c%d0%bc%d0%b0', 'RU', 1),
(166, 85, 'Устюжна', '%d0%a3%d1%81%d1%82%d1%8e%d0%b6%d0%bd%d0%b0', 'RU', 1),
(167, 85, 'Харовск', '%d0%a5%d0%b0%d1%80%d0%be%d0%b2%d1%81%d0%ba', 'RU', 1),
(168, 85, 'Череповец', '%d0%a7%d0%b5%d1%80%d0%b5%d0%bf%d0%be%d0%b2%d0%b5%d1%86', 'RU', 1),
(169, 13, 'Бобров', '%d0%91%d0%be%d0%b1%d1%80%d0%be%d0%b2', 'RU', 1),
(170, 13, 'Богучар', '%d0%91%d0%be%d0%b3%d1%83%d1%87%d0%b0%d1%80', 'RU', 1),
(171, 13, 'Борисоглебск', '%d0%91%d0%be%d1%80%d0%b8%d1%81%d0%be%d0%b3%d0%bb%d0%b5%d0%b1', 'RU', 1),
(172, 13, 'Бутурлиновка', '%d0%91%d1%83%d1%82%d1%83%d1%80%d0%bb%d0%b8%d0%bd%d0%be%d0%b2', 'RU', 1),
(173, 13, 'Воронеж', '%d0%92%d0%be%d1%80%d0%be%d0%bd%d0%b5%d0%b6', 'RU', 1),
(174, 13, 'Калач', '%d0%9a%d0%b0%d0%bb%d0%b0%d1%87', 'RU', 1),
(175, 13, 'Лиски', '%d0%9b%d0%b8%d1%81%d0%ba%d0%b8', 'RU', 1),
(176, 13, 'Нововоронеж', '%d0%9d%d0%be%d0%b2%d0%be%d0%b2%d0%be%d1%80%d0%be%d0%bd%d0%b5', 'RU', 1),
(177, 13, 'Новохопёрск', '%d0%9d%d0%be%d0%b2%d0%be%d1%85%d0%be%d0%bf%d1%91%d1%80%d1%81', 'RU', 1),
(178, 13, 'Острогожск', '%d0%9e%d1%81%d1%82%d1%80%d0%be%d0%b3%d0%be%d0%b6%d1%81%d0%ba', 'RU', 1),
(179, 13, 'Павловск', '%d0%9f%d0%b0%d0%b2%d0%bb%d0%be%d0%b2%d1%81%d0%ba', 'RU', 1),
(180, 13, 'Поворино', '%d0%9f%d0%be%d0%b2%d0%be%d1%80%d0%b8%d0%bd%d0%be', 'RU', 1),
(181, 13, 'Россошь', '%d0%a0%d0%be%d1%81%d1%81%d0%be%d1%88%d1%8c', 'RU', 1),
(182, 13, 'Семилуки', '%d0%a1%d0%b5%d0%bc%d0%b8%d0%bb%d1%83%d0%ba%d0%b8', 'RU', 1),
(183, 13, 'Эртиль', '%d0%ad%d1%80%d1%82%d0%b8%d0%bb%d1%8c', 'RU', 1),
(184, 14, 'Буйнакск', '%d0%91%d1%83%d0%b9%d0%bd%d0%b0%d0%ba%d1%81%d0%ba', 'RU', 1),
(185, 14, 'Дагестанские Огни', '%d0%94%d0%b0%d0%b3%d0%b5%d1%81%d1%82%d0%b0%d0%bd%d1%81%d0%ba', 'RU', 1),
(186, 14, 'Дербент', '%d0%94%d0%b5%d1%80%d0%b1%d0%b5%d0%bd%d1%82', 'RU', 1),
(187, 14, 'Избербаш', '%d0%98%d0%b7%d0%b1%d0%b5%d1%80%d0%b1%d0%b0%d1%88', 'RU', 1),
(188, 14, 'Каспийск', '%d0%9a%d0%b0%d1%81%d0%bf%d0%b8%d0%b9%d1%81%d0%ba', 'RU', 1),
(189, 14, 'Кизилюрт', '%d0%9a%d0%b8%d0%b7%d0%b8%d0%bb%d1%8e%d1%80%d1%82', 'RU', 1),
(190, 14, 'Кизляр', '%d0%9a%d0%b8%d0%b7%d0%bb%d1%8f%d1%80', 'RU', 1),
(191, 14, 'Махачкала', '%d0%9c%d0%b0%d1%85%d0%b0%d1%87%d0%ba%d0%b0%d0%bb%d0%b0', 'RU', 1),
(192, 14, 'Хасавюрт', '%d0%a5%d0%b0%d1%81%d0%b0%d0%b2%d1%8e%d1%80%d1%82', 'RU', 1),
(193, 14, 'Южно-Сухокумск', '%d0%ae%d0%b6%d0%bd%d0%be-%d0%a1%d1%83%d1%85%d0%be%d0%ba%d1%8', 'RU', 1),
(194, 15, 'Биробиджан', '%d0%91%d0%b8%d1%80%d0%be%d0%b1%d0%b8%d0%b4%d0%b6%d0%b0%d0%bd', 'RU', 1),
(197, 15, 'Облучье', '%d0%9e%d0%b1%d0%bb%d1%83%d1%87%d1%8c%d0%b5', 'RU', 1),
(198, 16, 'Балей', '%d0%91%d0%b0%d0%bb%d0%b5%d0%b9', 'RU', 1),
(199, 16, 'Борзя', '%d0%91%d0%be%d1%80%d0%b7%d1%8f', 'RU', 1),
(200, 16, 'Краснокаменск', '%d0%9a%d1%80%d0%b0%d1%81%d0%bd%d0%be%d0%ba%d0%b0%d0%bc%d0%b5', 'RU', 1),
(201, 16, 'Могоча', '%d0%9c%d0%be%d0%b3%d0%be%d1%87%d0%b0', 'RU', 1),
(202, 16, 'Нерчинск', '%d0%9d%d0%b5%d1%80%d1%87%d0%b8%d0%bd%d1%81%d0%ba', 'RU', 1),
(203, 16, 'Петровск-Забайкальский', '%d0%9f%d0%b5%d1%82%d1%80%d0%be%d0%b2%d1%81%d0%ba-%d0%97%d0%b', 'RU', 1),
(204, 16, 'Сретенск', '%d0%a1%d1%80%d0%b5%d1%82%d0%b5%d0%bd%d1%81%d0%ba', 'RU', 1),
(205, 16, 'Хилок', '%d0%a5%d0%b8%d0%bb%d0%be%d0%ba', 'RU', 1),
(206, 16, 'Чита', '%d0%a7%d0%b8%d1%82%d0%b0', 'RU', 1),
(207, 16, 'Шилка', '%d0%a8%d0%b8%d0%bb%d0%ba%d0%b0', 'RU', 1),
(208, 17, 'Вичуга', '%d0%92%d0%b8%d1%87%d1%83%d0%b3%d0%b0', 'RU', 1),
(209, 17, 'Гаврилов Посад', '%d0%93%d0%b0%d0%b2%d1%80%d0%b8%d0%bb%d0%be%d0%b2-%d0%9f%d0%b', 'RU', 1),
(210, 17, 'Заволжск', '%d0%97%d0%b0%d0%b2%d0%be%d0%bb%d0%b6%d1%81%d0%ba', 'RU', 1),
(211, 17, 'Иваново', '%d0%98%d0%b2%d0%b0%d0%bd%d0%be%d0%b2%d0%be', 'RU', 1),
(212, 17, 'Кинешма', '%d0%9a%d0%b8%d0%bd%d0%b5%d1%88%d0%bc%d0%b0', 'RU', 1),
(213, 17, 'Комсомольск', '%d0%9a%d0%be%d0%bc%d1%81%d0%be%d0%bc%d0%be%d0%bb%d1%8c%d1%81', 'RU', 1),
(214, 17, 'Кохма', '%d0%9a%d0%be%d1%85%d0%bc%d0%b0', 'RU', 1),
(215, 17, 'Наволоки', '%d0%9d%d0%b0%d0%b2%d0%be%d0%bb%d0%be%d0%ba%d0%b8', 'RU', 1),
(216, 17, 'Плёс', '%d0%9f%d0%bb%d1%91%d1%81', 'RU', 1),
(217, 17, 'Приволжск', '%d0%9f%d1%80%d0%b8%d0%b2%d0%be%d0%bb%d0%b6%d1%81%d0%ba', 'RU', 1),
(218, 17, 'Пучеж', '%d0%9f%d1%83%d1%87%d0%b5%d0%b6', 'RU', 1),
(219, 17, 'Родники', '%d0%a0%d0%be%d0%b4%d0%bd%d0%b8%d0%ba%d0%b8', 'RU', 1),
(220, 17, 'Тейково', '%d0%a2%d0%b5%d0%b9%d0%ba%d0%be%d0%b2%d0%be', 'RU', 1),
(221, 17, 'Фурманов', '%d0%a4%d1%83%d1%80%d0%bc%d0%b0%d0%bd%d0%be%d0%b2', 'RU', 1),
(222, 17, 'Шуя', '%d0%a8%d1%83%d1%8f', 'RU', 1),
(223, 17, 'Южа', '%d0%ae%d0%b6%d0%b0', 'RU', 1),
(224, 17, 'Юрьевец', '%d0%ae%d1%80%d1%8c%d0%b5%d0%b2%d0%b5%d1%86', 'RU', 1),
(225, 18, 'Карабулак', '%d0%9a%d0%b0%d1%80%d0%b0%d0%b1%d1%83%d0%bb%d0%b0%d0%ba', 'RU', 1),
(226, 18, 'Магас', '%d0%9c%d0%b0%d0%b3%d0%b0%d1%81', 'RU', 1),
(227, 18, 'Малгобек', '%d0%9c%d0%b0%d0%bb%d0%b3%d0%be%d0%b1%d0%b5%d0%ba', 'RU', 1),
(228, 18, 'Назрань', '%d0%9d%d0%b0%d0%b7%d1%80%d0%b0%d0%bd%d1%8c', 'RU', 1),
(229, 19, 'Алзамай', '%d0%90%d0%bb%d0%b7%d0%b0%d0%bc%d0%b0%d0%b9', 'RU', 1),
(230, 19, 'Ангарск', '%d0%90%d0%bd%d0%b3%d0%b0%d1%80%d1%81%d0%ba', 'RU', 1),
(231, 19, 'Байкальск', '%d0%91%d0%b0%d0%b9%d0%ba%d0%b0%d0%bb%d1%8c%d1%81%d0%ba', 'RU', 1),
(232, 19, 'Бирюсинск', '%d0%91%d0%b8%d1%80%d1%8e%d1%81%d0%b8%d0%bd%d1%81%d0%ba', 'RU', 1),
(233, 19, 'Бодайбо', '%d0%91%d0%be%d0%b4%d0%b0%d0%b9%d0%b1%d0%be', 'RU', 1),
(234, 19, 'Братск', '%d0%91%d1%80%d0%b0%d1%82%d1%81%d0%ba', 'RU', 1),
(235, 19, 'Вихоревка', '%d0%92%d0%b8%d1%85%d0%be%d1%80%d0%b5%d0%b2%d0%ba%d0%b0', 'RU', 1),
(236, 19, 'Железногорск-Илимский', '%d0%96%d0%b5%d0%bb%d0%b5%d0%b7%d0%bd%d0%be%d0%b3%d0%be%d1%80', 'RU', 1),
(237, 19, 'Зима', '%d0%97%d0%b8%d0%bc%d0%b0', 'RU', 1),
(238, 19, 'Иркутск', '%d0%98%d1%80%d0%ba%d1%83%d1%82%d1%81%d0%ba', 'RU', 1),
(239, 19, 'Киренск', '%d0%9a%d0%b8%d1%80%d0%b5%d0%bd%d1%81%d0%ba', 'RU', 1),
(240, 19, 'Нижнеудинск', '%d0%9d%d0%b8%d0%b6%d0%bd%d0%b5%d1%83%d0%b4%d0%b8%d0%bd%d1%81', 'RU', 1),
(241, 19, 'Саянск', '%d0%a1%d0%b0%d1%8f%d0%bd%d1%81%d0%ba', 'RU', 1),
(242, 19, 'Свирск', '%d0%a1%d0%b2%d0%b8%d1%80%d1%81%d0%ba', 'RU', 1),
(243, 19, 'Слюдянка', '%d0%a1%d0%bb%d1%8e%d0%b4%d1%8f%d0%bd%d0%ba%d0%b0', 'RU', 1),
(244, 19, 'Тайшет', '%d0%a2%d0%b0%d0%b9%d1%88%d0%b5%d1%82', 'RU', 1),
(245, 19, 'Тулун', '%d0%a2%d1%83%d0%bb%d1%83%d0%bd', 'RU', 1),
(246, 19, 'Усолье-Сибирское', '%d0%a3%d1%81%d0%be%d0%bb%d1%8c%d0%b5-%d0%a1%d0%b8%d0%b1%d0%b', 'RU', 1),
(247, 19, 'Усть-Илимск', '%d0%a3%d1%81%d1%82%d1%8c-%d0%98%d0%bb%d0%b8%d0%bc%d1%81%d0%b', 'RU', 1),
(248, 19, 'Усть-Кут', '%d0%a3%d1%81%d1%82%d1%8c-%d0%9a%d1%83%d1%82', 'RU', 1),
(249, 19, 'Черемхово', '%d0%a7%d0%b5%d1%80%d0%b5%d0%bc%d1%85%d0%be%d0%b2%d0%be', 'RU', 1),
(250, 19, 'Шелехов', '%d0%a8%d0%b5%d0%bb%d0%b5%d1%85%d0%be%d0%b2', 'RU', 1),
(251, 20, 'Баксан', '%d0%91%d0%b0%d0%ba%d1%81%d0%b0%d0%bd', 'RU', 1),
(252, 20, 'Майский', '%d0%9c%d0%b0%d0%b9%d1%81%d0%ba%d0%b8%d0%b9', 'RU', 1),
(253, 20, 'Нальчик', '%d0%9d%d0%b0%d0%bb%d1%8c%d1%87%d0%b8%d0%ba', 'RU', 1),
(254, 20, 'Нарткала', '%d0%9d%d0%b0%d1%80%d1%82%d0%ba%d0%b0%d0%bb%d0%b0', 'RU', 1),
(255, 20, 'Прохладный', '%d0%9f%d1%80%d0%be%d1%85%d0%bb%d0%b0%d0%b4%d0%bd%d1%8b%d0%b9', 'RU', 1),
(256, 20, 'Терек', '%d0%a2%d0%b5%d1%80%d0%b5%d0%ba', 'RU', 1),
(257, 20, 'Тырныауз', '%d0%a2%d1%8b%d1%80%d0%bd%d1%8b%d0%b0%d1%83%d0%b7', 'RU', 1),
(258, 20, 'Чегем', '%d0%a7%d0%b5%d0%b3%d0%b5%d0%bc', 'RU', 1),
(259, 21, 'Багратионовск', '%d0%91%d0%b0%d0%b3%d1%80%d0%b0%d1%82%d0%b8%d0%be%d0%bd%d0%be', 'RU', 1),
(260, 21, 'Балтийск', '%d0%91%d0%b0%d0%bb%d1%82%d0%b8%d0%b9%d1%81%d0%ba', 'RU', 1),
(261, 21, 'Гвардейск', '%d0%93%d0%b2%d0%b0%d1%80%d0%b4%d0%b5%d0%b9%d1%81%d0%ba', 'RU', 1),
(262, 21, 'Гурьевск', '%d0%93%d1%83%d1%80%d1%8c%d0%b5%d0%b2%d1%81%d0%ba', 'RU', 1),
(263, 21, 'Гусев', '%d0%93%d1%83%d1%81%d0%b5%d0%b2', 'RU', 1),
(264, 21, 'Зеленоградск', '%d0%97%d0%b5%d0%bb%d0%b5%d0%bd%d0%be%d0%b3%d1%80%d0%b0%d0%b4', 'RU', 1),
(265, 21, 'Калининград', '%d0%9a%d0%b0%d0%bb%d0%b8%d0%bd%d0%b8%d0%bd%d0%b3%d1%80%d0%b0', 'RU', 1),
(266, 21, 'Краснознаменск', '%d0%9a%d1%80%d0%b0%d1%81%d0%bd%d0%be%d0%b7%d0%bd%d0%b0%d0%bc', 'RU', 1),
(267, 21, 'Ладушкин', '%d0%9b%d0%b0%d0%b4%d1%83%d1%88%d0%ba%d0%b8%d0%bd', 'RU', 1),
(268, 21, 'Мамоново', '%d0%9c%d0%b0%d0%bc%d0%be%d0%bd%d0%be%d0%b2%d0%be', 'RU', 1),
(269, 21, 'Неман', '%d0%9d%d0%b5%d0%bc%d0%b0%d0%bd', 'RU', 1),
(270, 21, 'Нестеров', '%d0%9d%d0%b5%d1%81%d1%82%d0%b5%d1%80%d0%be%d0%b2', 'RU', 1),
(271, 21, 'Озёрск', '%d0%9e%d0%b7%d1%91%d1%80%d1%81%d0%ba', 'RU', 1),
(272, 21, 'Пионерский', '%d0%9f%d0%b8%d0%be%d0%bd%d0%b5%d1%80%d1%81%d0%ba%d0%b8%d0%b9', 'RU', 1),
(273, 21, 'Полесск', '%d0%9f%d0%be%d0%bb%d0%b5%d1%81%d1%81%d0%ba', 'RU', 1),
(274, 21, 'Правдинск', '%d0%9f%d1%80%d0%b0%d0%b2%d0%b4%d0%b8%d0%bd%d1%81%d0%ba', 'RU', 1),
(275, 21, 'Светлогорск', '%d0%a1%d0%b2%d0%b5%d1%82%d0%bb%d0%be%d0%b3%d0%be%d1%80%d1%81', 'RU', 1),
(276, 21, 'Светлый', '%d0%a1%d0%b2%d0%b5%d1%82%d0%bb%d1%8b%d0%b9', 'RU', 1),
(277, 21, 'Славск', '%d0%a1%d0%bb%d0%b0%d0%b2%d1%81%d0%ba', 'RU', 1),
(278, 21, 'Советск', '%d0%a1%d0%be%d0%b2%d0%b5%d1%82%d1%81%d0%ba', 'RU', 1),
(279, 21, 'Черняховск', '%d0%a7%d0%b5%d1%80%d0%bd%d1%8f%d1%85%d0%be%d0%b2%d1%81%d0%ba', 'RU', 1),
(280, 21, 'Приморск', '%d0%9f%d1%80%d0%b8%d0%bc%d0%be%d1%80%d1%81%d0%ba', 'RU', 1),
(281, 22, 'Городовиковск', '%d0%93%d0%be%d1%80%d0%be%d0%b4%d0%be%d0%b2%d0%b8%d0%ba%d0%be', 'RU', 1),
(282, 22, 'Лагань', '%d0%9b%d0%b0%d0%b3%d0%b0%d0%bd%d1%8c', 'RU', 1),
(283, 22, 'Элиста', '%d0%ad%d0%bb%d0%b8%d1%81%d1%82%d0%b0', 'RU', 1),
(284, 23, 'Балабаново', '%d0%91%d0%b0%d0%bb%d0%b0%d0%b1%d0%b0%d0%bd%d0%be%d0%b2%d0%be', 'RU', 1),
(285, 23, 'Белоусово', '%d0%91%d0%b5%d0%bb%d0%be%d1%83%d1%81%d0%be%d0%b2%d0%be', 'RU', 1),
(286, 23, 'Боровск', '%d0%91%d0%be%d1%80%d0%be%d0%b2%d1%81%d0%ba', 'RU', 1),
(287, 23, 'Ермолино', '%d0%95%d1%80%d0%bc%d0%be%d0%bb%d0%b8%d0%bd%d0%be', 'RU', 1),
(288, 23, 'Жиздра', '%d0%96%d0%b8%d0%b7%d0%b4%d1%80%d0%b0', 'RU', 1),
(289, 23, 'Жуков', '%d0%96%d1%83%d0%ba%d0%be%d0%b2', 'RU', 1),
(290, 23, 'Калуга', '%d0%9a%d0%b0%d0%bb%d1%83%d0%b3%d0%b0', 'RU', 1),
(291, 23, 'Киров', '%d0%9a%d0%b8%d1%80%d0%be%d0%b2', 'RU', 1),
(292, 23, 'Козельск', '%d0%9a%d0%be%d0%b7%d0%b5%d0%bb%d1%8c%d1%81%d0%ba', 'RU', 1),
(293, 23, 'Кондрово', '%d0%9a%d0%be%d0%bd%d0%b4%d1%80%d0%be%d0%b2%d0%be', 'RU', 1),
(294, 23, 'Кремёнки', '%d0%9a%d1%80%d0%b5%d0%bc%d1%91%d0%bd%d0%ba%d0%b8', 'RU', 1),
(295, 23, 'Людиново', '%d0%9b%d1%8e%d0%b4%d0%b8%d0%bd%d0%be%d0%b2%d0%be', 'RU', 1),
(296, 23, 'Малоярославец', '%d0%9c%d0%b0%d0%bb%d0%be%d1%8f%d1%80%d0%be%d1%81%d0%bb%d0%b0', 'RU', 1),
(297, 23, 'Медынь', '%d0%9c%d0%b5%d0%b4%d1%8b%d0%bd%d1%8c', 'RU', 1),
(298, 23, 'Мещовск', '%d0%9c%d0%b5%d1%89%d0%be%d0%b2%d1%81%d0%ba', 'RU', 1),
(299, 23, 'Мосальск', '%d0%9c%d0%be%d1%81%d0%b0%d0%bb%d1%8c%d1%81%d0%ba', 'RU', 1),
(300, 23, 'Обнинск', '%d0%9e%d0%b1%d0%bd%d0%b8%d0%bd%d1%81%d0%ba', 'RU', 1),
(301, 23, 'Сосенский', '%d0%a1%d0%be%d1%81%d0%b5%d0%bd%d1%81%d0%ba%d0%b8%d0%b9', 'RU', 1),
(302, 23, 'Спас-Деменск', '%d0%a1%d0%bf%d0%b0%d1%81-%d0%94%d0%b5%d0%bc%d0%b5%d0%bd%d1%8', 'RU', 1),
(303, 23, 'Сухиничи', '%d0%a1%d1%83%d1%85%d0%b8%d0%bd%d0%b8%d1%87%d0%b8', 'RU', 1),
(304, 23, 'Таруса', '%d0%a2%d0%b0%d1%80%d1%83%d1%81%d0%b0', 'RU', 1),
(305, 23, 'Юхнов', '%d0%ae%d1%85%d0%bd%d0%be%d0%b2', 'RU', 1),
(306, 24, 'Вилючинск', '%d0%92%d0%b8%d0%bb%d1%8e%d1%87%d0%b8%d0%bd%d1%81%d0%ba', 'RU', 1),
(307, 24, 'Елизово', '%d0%95%d0%bb%d0%b8%d0%b7%d0%be%d0%b2%d0%be', 'RU', 1),
(308, 24, 'Петропавловск-Камчатский', '%d0%9f%d0%b5%d1%82%d1%80%d0%be%d0%bf%d0%b0%d0%b2%d0%bb%d0%be', 'RU', 1),
(311, 25, 'Карачаевск', '%d0%9a%d0%b0%d1%80%d0%b0%d1%87%d0%b0%d0%b5%d0%b2%d1%81%d0%ba', 'RU', 1),
(312, 25, 'Теберда', '%d0%a2%d0%b5%d0%b1%d0%b5%d1%80%d0%b4%d0%b0', 'RU', 1),
(313, 25, 'Усть-Джегута', '%d0%a3%d1%81%d1%82%d1%8c-%d0%94%d0%b6%d0%b5%d0%b3%d1%83%d1%8', 'RU', 1),
(314, 25, 'Черкесск', '%d0%a7%d0%b5%d1%80%d0%ba%d0%b5%d1%81%d1%81%d0%ba', 'RU', 1),
(315, 26, 'Беломорск', '%d0%91%d0%b5%d0%bb%d0%be%d0%bc%d0%be%d1%80%d1%81%d0%ba', 'RU', 1),
(316, 26, 'Кемь', '%d0%9a%d0%b5%d0%bc%d1%8c', 'RU', 1),
(317, 26, 'Кондопога', '%d0%9a%d0%be%d0%bd%d0%b4%d0%be%d0%bf%d0%be%d0%b3%d0%b0', 'RU', 1),
(318, 26, 'Костомукша', '%d0%9a%d0%be%d1%81%d1%82%d0%be%d0%bc%d1%83%d0%ba%d1%88%d0%b0', 'RU', 1),
(319, 26, 'Лахденпохья', '%d0%9b%d0%b0%d1%85%d0%b4%d0%b5%d0%bd%d0%bf%d0%be%d1%85%d1%8c', 'RU', 1),
(320, 26, 'Медвежьегорск', '%d0%9c%d0%b5%d0%b4%d0%b2%d0%b5%d0%b6%d1%8c%d0%b5%d0%b3%d0%be', 'RU', 1),
(321, 26, 'Олонец', '%d0%9e%d0%bb%d0%be%d0%bd%d0%b5%d1%86', 'RU', 1),
(322, 26, 'Петрозаводск', '%d0%9f%d0%b5%d1%82%d1%80%d0%be%d0%b7%d0%b0%d0%b2%d0%be%d0%b4', 'RU', 1),
(323, 26, 'Питкяранта', '%d0%9f%d0%b8%d1%82%d0%ba%d1%8f%d1%80%d0%b0%d0%bd%d1%82%d0%b0', 'RU', 1),
(324, 26, 'Пудож', '%d0%9f%d1%83%d0%b4%d0%be%d0%b6', 'RU', 1),
(325, 26, 'Сегежа', '%d0%a1%d0%b5%d0%b3%d0%b5%d0%b6%d0%b0', 'RU', 1),
(326, 26, 'Сортавала', '%d0%a1%d0%be%d1%80%d1%82%d0%b0%d0%b2%d0%b0%d0%bb%d0%b0', 'RU', 1),
(327, 26, 'Суоярви', '%d0%a1%d1%83%d0%be%d1%8f%d1%80%d0%b2%d0%b8', 'RU', 1),
(328, 27, 'Анжеро-Судженск', '%d0%90%d0%bd%d0%b6%d0%b5%d1%80%d0%be-%d0%a1%d1%83%d0%b4%d0%b', 'RU', 1),
(329, 27, 'Белово', '%d0%91%d0%b5%d0%bb%d0%be%d0%b2%d0%be', 'RU', 1),
(330, 27, 'Берёзовский', '%d0%91%d0%b5%d1%80%d1%91%d0%b7%d0%be%d0%b2%d1%81%d0%ba%d0%b8', 'RU', 1),
(331, 27, 'Гурьевск', '%d0%93%d1%83%d1%80%d1%8c%d0%b5%d0%b2%d1%81%d0%ba-1', 'RU', 1),
(332, 27, 'Калтан', '%d0%9a%d0%b0%d0%bb%d1%82%d0%b0%d0%bd', 'RU', 1),
(333, 27, 'Кемерово', '%d0%9a%d0%b5%d0%bc%d0%b5%d1%80%d0%be%d0%b2%d0%be', 'RU', 1),
(334, 27, 'Киселёвск', '%d0%9a%d0%b8%d1%81%d0%b5%d0%bb%d1%91%d0%b2%d1%81%d0%ba', 'RU', 1),
(335, 27, 'Ленинск-Кузнецкий', '%d0%9b%d0%b5%d0%bd%d0%b8%d0%bd%d1%81%d0%ba-%d0%9a%d1%83%d0%b', 'RU', 1),
(336, 27, 'Мариинск', '%d0%9c%d0%b0%d1%80%d0%b8%d0%b8%d0%bd%d1%81%d0%ba', 'RU', 1),
(337, 27, 'Междуреченск', '%d0%9c%d0%b5%d0%b6%d0%b4%d1%83%d1%80%d0%b5%d1%87%d0%b5%d0%bd', 'RU', 1),
(338, 27, 'Мыски', '%d0%9c%d1%8b%d1%81%d0%ba%d0%b8', 'RU', 1),
(339, 27, 'Новокузнецк', '%d0%9d%d0%be%d0%b2%d0%be%d0%ba%d1%83%d0%b7%d0%bd%d0%b5%d1%86', 'RU', 1),
(340, 27, 'Осинники', '%d0%9e%d1%81%d0%b8%d0%bd%d0%bd%d0%b8%d0%ba%d0%b8', 'RU', 1),
(341, 27, 'Полысаево', '%d0%9f%d0%be%d0%bb%d1%8b%d1%81%d0%b0%d0%b5%d0%b2%d0%be', 'RU', 1),
(342, 27, 'Прокопьевск', '%d0%9f%d1%80%d0%be%d0%ba%d0%be%d0%bf%d1%8c%d0%b5%d0%b2%d1%81', 'RU', 1),
(343, 27, 'Салаир', '%d0%a1%d0%b0%d0%bb%d0%b0%d0%b8%d1%80', 'RU', 1),
(344, 27, 'Тайга', '%d0%a2%d0%b0%d0%b9%d0%b3%d0%b0', 'RU', 1),
(345, 27, 'Таштагол', '%d0%a2%d0%b0%d1%88%d1%82%d0%b0%d0%b3%d0%be%d0%bb', 'RU', 1),
(346, 27, 'Топки', '%d0%a2%d0%be%d0%bf%d0%ba%d0%b8', 'RU', 1),
(347, 27, 'Юрга', '%d0%ae%d1%80%d0%b3%d0%b0', 'RU', 1),
(348, 28, 'Белая Холуница', '%d0%91%d0%b5%d0%bb%d0%b0%d1%8f-%d0%a5%d0%be%d0%bb%d1%83%d0%b', 'RU', 1),
(349, 28, 'Вятские Поляны', '%d0%92%d1%8f%d1%82%d1%81%d0%ba%d0%b8%d0%b5-%d0%9f%d0%be%d0%b', 'RU', 1),
(350, 28, 'Зуевка', '%d0%97%d1%83%d0%b5%d0%b2%d0%ba%d0%b0', 'RU', 1),
(351, 28, 'Киров', '%d0%9a%d0%b8%d1%80%d0%be%d0%b2-1', 'RU', 1),
(352, 28, 'Кирово-Чепецк', '%d0%9a%d0%b8%d1%80%d0%be%d0%b2%d0%be-%d0%a7%d0%b5%d0%bf%d0%b', 'RU', 1),
(353, 28, 'Кирс', '%d0%9a%d0%b8%d1%80%d1%81', 'RU', 1),
(354, 28, 'Котельнич', '%d0%9a%d0%be%d1%82%d0%b5%d0%bb%d1%8c%d0%bd%d0%b8%d1%87', 'RU', 1),
(355, 28, 'Луза', '%d0%9b%d1%83%d0%b7%d0%b0', 'RU', 1),
(356, 28, 'Малмыж', '%d0%9c%d0%b0%d0%bb%d0%bc%d1%8b%d0%b6', 'RU', 1),
(357, 28, 'Мураши', '%d0%9c%d1%83%d1%80%d0%b0%d1%88%d0%b8', 'RU', 1),
(358, 28, 'Нолинск', '%d0%9d%d0%be%d0%bb%d0%b8%d0%bd%d1%81%d0%ba', 'RU', 1),
(359, 28, 'Омутнинск', '%d0%9e%d0%bc%d1%83%d1%82%d0%bd%d0%b8%d0%bd%d1%81%d0%ba', 'RU', 1),
(360, 28, 'Орлов', '%d0%9e%d1%80%d0%bb%d0%be%d0%b2', 'RU', 1),
(361, 28, 'Слободской', '%d0%a1%d0%bb%d0%be%d0%b1%d0%be%d0%b4%d1%81%d0%ba%d0%be%d0%b9', 'RU', 1),
(362, 28, 'Советск', '%d0%a1%d0%be%d0%b2%d0%b5%d1%82%d1%81%d0%ba-1', 'RU', 1),
(363, 28, 'Сосновка', '%d0%a1%d0%be%d1%81%d0%bd%d0%be%d0%b2%d0%ba%d0%b0', 'RU', 1),
(364, 28, 'Уржум', '%d0%a3%d1%80%d0%b6%d1%83%d0%bc', 'RU', 1),
(365, 28, 'Яранск', '%d0%af%d1%80%d0%b0%d0%bd%d1%81%d0%ba', 'RU', 1),
(366, 29, 'Воркута', '%d0%92%d0%be%d1%80%d0%ba%d1%83%d1%82%d0%b0', 'RU', 1),
(367, 29, 'Вуктыл', '%d0%92%d1%83%d0%ba%d1%82%d1%8b%d0%bb', 'RU', 1),
(368, 29, 'Емва', '%d0%95%d0%bc%d0%b2%d0%b0', 'RU', 1),
(369, 29, 'Инта', '%d0%98%d0%bd%d1%82%d0%b0', 'RU', 1),
(370, 29, 'Микунь', '%d0%9c%d0%b8%d0%ba%d1%83%d0%bd%d1%8c', 'RU', 1),
(371, 29, 'Печора', '%d0%9f%d0%b5%d1%87%d0%be%d1%80%d0%b0', 'RU', 1),
(372, 29, 'Сосногорск', '%d0%a1%d0%be%d1%81%d0%bd%d0%be%d0%b3%d0%be%d1%80%d1%81%d0%ba', 'RU', 1),
(373, 29, 'Сыктывкар', '%d0%a1%d1%8b%d0%ba%d1%82%d1%8b%d0%b2%d0%ba%d0%b0%d1%80', 'RU', 1),
(374, 29, 'Усинск', '%d0%a3%d1%81%d0%b8%d0%bd%d1%81%d0%ba', 'RU', 1),
(375, 29, 'Ухта', '%d0%a3%d1%85%d1%82%d0%b0', 'RU', 1),
(376, 30, 'Буй', '%d0%91%d1%83%d0%b9', 'RU', 1),
(377, 30, 'Волгореченск', '%d0%92%d0%be%d0%bb%d0%b3%d0%be%d1%80%d0%b5%d1%87%d0%b5%d0%bd', 'RU', 1),
(378, 30, 'Галич', '%d0%93%d0%b0%d0%bb%d0%b8%d1%87', 'RU', 1),
(379, 30, 'Кологрив', '%d0%9a%d0%be%d0%bb%d0%be%d0%b3%d1%80%d0%b8%d0%b2', 'RU', 1),
(380, 30, 'Кострома', '%d0%9a%d0%be%d1%81%d1%82%d1%80%d0%be%d0%bc%d0%b0', 'RU', 1),
(381, 30, 'Макарьев', '%d0%9c%d0%b0%d0%ba%d0%b0%d1%80%d1%8c%d0%b5%d0%b2', 'RU', 1),
(382, 30, 'Мантурово', '%d0%9c%d0%b0%d0%bd%d1%82%d1%83%d1%80%d0%be%d0%b2%d0%be', 'RU', 1),
(383, 30, 'Нерехта', '%d0%9d%d0%b5%d1%80%d0%b5%d1%85%d1%82%d0%b0', 'RU', 1),
(384, 30, 'Нея', '%d0%9d%d0%b5%d1%8f', 'RU', 1),
(385, 30, 'Солигалич', '%d0%a1%d0%be%d0%bb%d0%b8%d0%b3%d0%b0%d0%bb%d0%b8%d1%87', 'RU', 1),
(386, 30, 'Чухлома', '%d0%a7%d1%83%d1%85%d0%bb%d0%be%d0%bc%d0%b0', 'RU', 1),
(387, 30, 'Шарья', '%d0%a8%d0%b0%d1%80%d1%8c%d1%8f', 'RU', 1),
(388, 31, 'Абинск', '%d0%90%d0%b1%d0%b8%d0%bd%d1%81%d0%ba', 'RU', 1),
(389, 31, 'Анапа', '%d0%90%d0%bd%d0%b0%d0%bf%d0%b0', 'RU', 1),
(390, 31, 'Апшеронск', '%d0%90%d0%bf%d1%88%d0%b5%d1%80%d0%be%d0%bd%d1%81%d0%ba', 'RU', 1),
(391, 31, 'Армавир', '%d0%90%d1%80%d0%bc%d0%b0%d0%b2%d0%b8%d1%80', 'RU', 1),
(392, 31, 'Белореченск', '%d0%91%d0%b5%d0%bb%d0%be%d1%80%d0%b5%d1%87%d0%b5%d0%bd%d1%81', 'RU', 1),
(393, 31, 'Геленджик', '%d0%93%d0%b5%d0%bb%d0%b5%d0%bd%d0%b4%d0%b6%d0%b8%d0%ba', 'RU', 1),
(394, 31, 'Горячий Ключ', '%d0%93%d0%be%d1%80%d1%8f%d1%87%d0%b8%d0%b9-%d0%9a%d0%bb%d1%8', 'RU', 1),
(395, 31, 'Гулькевичи', '%d0%93%d1%83%d0%bb%d1%8c%d0%ba%d0%b5%d0%b2%d0%b8%d1%87%d0%b8', 'RU', 1),
(396, 31, 'Ейск', '%d0%95%d0%b9%d1%81%d0%ba', 'RU', 1),
(397, 31, 'Кореновск', '%d0%9a%d0%be%d1%80%d0%b5%d0%bd%d0%be%d0%b2%d1%81%d0%ba', 'RU', 1),
(398, 31, 'Краснодар', '%d0%9a%d1%80%d0%b0%d1%81%d0%bd%d0%be%d0%b4%d0%b0%d1%80', 'RU', 1),
(399, 31, 'Кропоткин', '%d0%9a%d1%80%d0%be%d0%bf%d0%be%d1%82%d0%ba%d0%b8%d0%bd', 'RU', 1),
(400, 31, 'Крымск', '%d0%9a%d1%80%d1%8b%d0%bc%d1%81%d0%ba', 'RU', 1),
(401, 31, 'Курганинск', '%d0%9a%d1%83%d1%80%d0%b3%d0%b0%d0%bd%d0%b8%d0%bd%d1%81%d0%ba', 'RU', 1),
(402, 31, 'Лабинск', '%d0%9b%d0%b0%d0%b1%d0%b8%d0%bd%d1%81%d0%ba', 'RU', 1),
(403, 31, 'Новокубанск', '%d0%9d%d0%be%d0%b2%d0%be%d0%ba%d1%83%d0%b1%d0%b0%d0%bd%d1%81', 'RU', 1),
(404, 31, 'Новороссийск', '%d0%9d%d0%be%d0%b2%d0%be%d1%80%d0%be%d1%81%d1%81%d0%b8%d0%b9', 'RU', 1),
(405, 31, 'Приморско-Ахтарск', '%d0%9f%d1%80%d0%b8%d0%bc%d0%be%d1%80%d1%81%d0%ba%d0%be-%d0%9', 'RU', 1),
(406, 31, 'Славянск-на-Кубани', '%d0%a1%d0%bb%d0%b0%d0%b2%d1%8f%d0%bd%d1%81%d0%ba-%d0%bd%d0%b', 'RU', 1),
(407, 31, 'Сочи', '%d0%a1%d0%be%d1%87%d0%b8', 'RU', 1),
(408, 31, 'Темрюк', '%d0%a2%d0%b5%d0%bc%d1%80%d1%8e%d0%ba', 'RU', 1),
(409, 31, 'Тимашёвск', '%d0%a2%d0%b8%d0%bc%d0%b0%d1%88%d1%91%d0%b2%d1%81%d0%ba', 'RU', 1),
(410, 31, 'Тихорецк', '%d0%a2%d0%b8%d1%85%d0%be%d1%80%d0%b5%d1%86%d0%ba', 'RU', 1),
(411, 31, 'Туапсе', '%d0%a2%d1%83%d0%b0%d0%bf%d1%81%d0%b5', 'RU', 1),
(412, 31, 'Усть-Лабинск', '%d0%a3%d1%81%d1%82%d1%8c-%d0%9b%d0%b0%d0%b1%d0%b8%d0%bd%d1%8', 'RU', 1),
(413, 31, 'Хадыженск', '%d0%a5%d0%b0%d0%b4%d1%8b%d0%b6%d0%b5%d0%bd%d1%81%d0%ba', 'RU', 1),
(415, 32, 'Артёмовск', '%d0%90%d1%80%d1%82%d1%91%d0%bc%d0%be%d0%b2%d1%81%d0%ba', 'RU', 1),
(416, 32, 'Ачинск', '%d0%90%d1%87%d0%b8%d0%bd%d1%81%d0%ba', 'RU', 1),
(417, 32, 'Боготол', '%d0%91%d0%be%d0%b3%d0%be%d1%82%d0%be%d0%bb', 'RU', 1),
(418, 32, 'Бородино', '%d0%91%d0%be%d1%80%d0%be%d0%b4%d0%b8%d0%bd%d0%be', 'RU', 1),
(419, 32, 'Дивногорск', '%d0%94%d0%b8%d0%b2%d0%bd%d0%be%d0%b3%d0%be%d1%80%d1%81%d0%ba', 'RU', 1),
(420, 32, 'Дудинка', '%d0%94%d1%83%d0%b4%d0%b8%d0%bd%d0%ba%d0%b0', 'RU', 1),
(421, 32, 'Енисейск', '%d0%95%d0%bd%d0%b8%d1%81%d0%b5%d0%b9%d1%81%d0%ba', 'RU', 1),
(422, 32, 'Железногорск', '%d0%96%d0%b5%d0%bb%d0%b5%d0%b7%d0%bd%d0%be%d0%b3%d0%be%d1%80', 'RU', 1),
(423, 32, 'Заозёрный', '%d0%97%d0%b0%d0%be%d0%b7%d1%91%d1%80%d0%bd%d1%8b%d0%b9', 'RU', 1),
(424, 32, 'Зеленогорск', '%d0%97%d0%b5%d0%bb%d0%b5%d0%bd%d0%be%d0%b3%d0%be%d1%80%d1%81', 'RU', 1),
(425, 32, 'Игарка', '%d0%98%d0%b3%d0%b0%d1%80%d0%ba%d0%b0', 'RU', 1),
(426, 32, 'Иланский', '%d0%98%d0%bb%d0%b0%d0%bd%d1%81%d0%ba%d0%b8%d0%b9', 'RU', 1),
(427, 32, 'Канск', '%d0%9a%d0%b0%d0%bd%d1%81%d0%ba', 'RU', 1),
(428, 32, 'Кодинск', '%d0%9a%d0%be%d0%b4%d0%b8%d0%bd%d1%81%d0%ba', 'RU', 1),
(429, 32, 'Красноярск', '%d0%9a%d1%80%d0%b0%d1%81%d0%bd%d0%be%d1%8f%d1%80%d1%81%d0%ba', 'RU', 1),
(430, 32, 'Лесосибирск', '%d0%9b%d0%b5%d1%81%d0%be%d1%81%d0%b8%d0%b1%d0%b8%d1%80%d1%81', 'RU', 1),
(431, 32, 'Минусинск', '%d0%9c%d0%b8%d0%bd%d1%83%d1%81%d0%b8%d0%bd%d1%81%d0%ba', 'RU', 1),
(432, 32, 'Назарово', '%d0%9d%d0%b0%d0%b7%d0%b0%d1%80%d0%be%d0%b2%d0%be', 'RU', 1),
(433, 32, 'Норильск', '%d0%9d%d0%be%d1%80%d0%b8%d0%bb%d1%8c%d1%81%d0%ba', 'RU', 1),
(434, 32, 'Сосновоборск', '%d0%a1%d0%be%d1%81%d0%bd%d0%be%d0%b2%d0%be%d0%b1%d0%be%d1%80', 'RU', 1),
(435, 32, 'Ужур', '%d0%a3%d0%b6%d1%83%d1%80', 'RU', 1),
(436, 32, 'Уяр', '%d0%a3%d1%8f%d1%80', 'RU', 1),
(437, 32, 'Шарыпово', '%d0%a8%d0%b0%d1%80%d1%8b%d0%bf%d0%be%d0%b2%d0%be', 'RU', 1),
(438, 33, 'Алупка', '%d0%90%d0%bb%d1%83%d0%bf%d0%ba%d0%b0', 'RU', 1),
(439, 33, 'Алушта', '%d0%90%d0%bb%d1%83%d1%88%d1%82%d0%b0', 'RU', 1),
(440, 33, 'Армянск', '%d0%90%d1%80%d0%bc%d1%8f%d0%bd%d1%81%d0%ba', 'RU', 1),
(441, 33, 'Бахчисарай', '%d0%91%d0%b0%d1%85%d1%87%d0%b8%d1%81%d0%b0%d1%80%d0%b0%d0%b9', 'RU', 1),
(442, 33, 'Белогорск', '%d0%91%d0%b5%d0%bb%d0%be%d0%b3%d0%be%d1%80%d1%81%d0%ba-2', 'RU', 1),
(443, 33, 'Джанкой', '%d0%94%d0%b6%d0%b0%d0%bd%d0%ba%d0%be%d0%b9', 'RU', 1),
(444, 33, 'Евпатория', '%d0%95%d0%b2%d0%bf%d0%b0%d1%82%d0%be%d1%80%d0%b8%d1%8f', 'RU', 1),
(445, 33, 'Керчь', '%d0%9a%d0%b5%d1%80%d1%87%d1%8c', 'RU', 1),
(446, 33, 'Красноперекопск', '%d0%9a%d1%80%d0%b0%d1%81%d0%bd%d0%be%d0%bf%d0%b5%d1%80%d0%b5', 'RU', 1),
(447, 33, 'Саки', '%d0%a1%d0%b0%d0%ba%d0%b8', 'RU', 1),
(448, 33, 'Симферополь', '%d0%a1%d0%b8%d0%bc%d1%84%d0%b5%d1%80%d0%be%d0%bf%d0%be%d0%bb', 'RU', 1),
(449, 33, 'Старый Крым', '%d0%a1%d1%82%d0%b0%d1%80%d1%8b%d0%b9-%d0%9a%d1%80%d1%8b%d0%b', 'RU', 1),
(450, 33, 'Судак', '%d0%a1%d1%83%d0%b4%d0%b0%d0%ba', 'RU', 1),
(451, 33, 'Феодосия', '%d0%a4%d0%b5%d0%be%d0%b4%d0%be%d1%81%d0%b8%d1%8f', 'RU', 1),
(452, 33, 'Щёлкино', '%d0%a9%d1%91%d0%bb%d0%ba%d0%b8%d0%bd%d0%be', 'RU', 1),
(453, 33, 'Ялта', '%d0%af%d0%bb%d1%82%d0%b0', 'RU', 1),
(454, 34, 'Далматово', '%d0%94%d0%b0%d0%bb%d0%bc%d0%b0%d1%82%d0%be%d0%b2%d0%be', 'RU', 1),
(455, 34, 'Катайск', '%d0%9a%d0%b0%d1%82%d0%b0%d0%b9%d1%81%d0%ba', 'RU', 1),
(456, 34, 'Курган', '%d0%9a%d1%83%d1%80%d0%b3%d0%b0%d0%bd', 'RU', 1),
(457, 34, 'Куртамыш', '%d0%9a%d1%83%d1%80%d1%82%d0%b0%d0%bc%d1%8b%d1%88', 'RU', 1),
(458, 34, 'Макушино', '%d0%9c%d0%b0%d0%ba%d1%83%d1%88%d0%b8%d0%bd%d0%be', 'RU', 1),
(459, 34, 'Петухово', '%d0%9f%d0%b5%d1%82%d1%83%d1%85%d0%be%d0%b2%d0%be', 'RU', 1),
(460, 34, 'Шадринск', '%d0%a8%d0%b0%d0%b4%d1%80%d0%b8%d0%bd%d1%81%d0%ba', 'RU', 1),
(461, 34, 'Шумиха', '%d0%a8%d1%83%d0%bc%d0%b8%d1%85%d0%b0', 'RU', 1),
(462, 34, 'Щучье', '%d0%a9%d1%83%d1%87%d1%8c%d0%b5', 'RU', 1),
(463, 35, 'Дмитриев', '%d0%94%d0%bc%d0%b8%d1%82%d1%80%d0%b8%d0%b5%d0%b2', 'RU', 1),
(464, 35, 'Железногорск', '%d0%96%d0%b5%d0%bb%d0%b5%d0%b7%d0%bd%d0%be%d0%b3%d0%be%d1%80', 'RU', 1),
(465, 35, 'Курск', '%d0%9a%d1%83%d1%80%d1%81%d0%ba', 'RU', 1),
(466, 35, 'Курчатов', '%d0%9a%d1%83%d1%80%d1%87%d0%b0%d1%82%d0%be%d0%b2', 'RU', 1),
(467, 35, 'Льгов', '%d0%9b%d1%8c%d0%b3%d0%be%d0%b2', 'RU', 1),
(468, 35, 'Обоянь', '%d0%9e%d0%b1%d0%be%d1%8f%d0%bd%d1%8c', 'RU', 1),
(469, 35, 'Рыльск', '%d0%a0%d1%8b%d0%bb%d1%8c%d1%81%d0%ba', 'RU', 1),
(470, 35, 'Суджа', '%d0%a1%d1%83%d0%b4%d0%b6%d0%b0', 'RU', 1),
(471, 35, 'Фатеж', '%d0%a4%d0%b0%d1%82%d0%b5%d0%b6', 'RU', 1),
(472, 35, 'Щигры', '%d0%a9%d0%b8%d0%b3%d1%80%d1%8b', 'RU', 1),
(473, 36, 'Бокситогорск', '%d0%91%d0%be%d0%ba%d1%81%d0%b8%d1%82%d0%be%d0%b3%d0%be%d1%80', 'RU', 1),
(474, 36, 'Волосово', '%d0%92%d0%be%d0%bb%d0%be%d1%81%d0%be%d0%b2%d0%be', 'RU', 1),
(475, 36, 'Волхов', '%d0%92%d0%be%d0%bb%d1%85%d0%be%d0%b2', 'RU', 1),
(476, 36, 'Всеволожск', '%d0%92%d1%81%d0%b5%d0%b2%d0%be%d0%bb%d0%be%d0%b6%d1%81%d0%ba', 'RU', 1),
(477, 36, 'Выборг', '%d0%92%d1%8b%d0%b1%d0%be%d1%80%d0%b3', 'RU', 1),
(478, 36, 'Высоцк', '%d0%92%d1%8b%d1%81%d0%be%d1%86%d0%ba', 'RU', 1),
(479, 36, 'Гатчина', '%d0%93%d0%b0%d1%82%d1%87%d0%b8%d0%bd%d0%b0', 'RU', 1),
(480, 36, 'Ивангород', '%d0%98%d0%b2%d0%b0%d0%bd%d0%b3%d0%be%d1%80%d0%be%d0%b4', 'RU', 1),
(481, 36, 'Каменногорск', '%d0%9a%d0%b0%d0%bc%d0%b5%d0%bd%d0%bd%d0%be%d0%b3%d0%be%d1%80', 'RU', 1),
(482, 36, 'Кингисепп', '%d0%9a%d0%b8%d0%bd%d0%b3%d0%b8%d1%81%d0%b5%d0%bf%d0%bf', 'RU', 1),
(483, 36, 'Кириши', '%d0%9a%d0%b8%d1%80%d0%b8%d1%88%d0%b8', 'RU', 1),
(484, 36, 'Кировск', '%d0%9a%d0%b8%d1%80%d0%be%d0%b2%d1%81%d0%ba', 'RU', 1),
(485, 36, 'Коммунар', '%d0%9a%d0%be%d0%bc%d0%bc%d1%83%d0%bd%d0%b0%d1%80', 'RU', 1),
(486, 36, 'Лодейное Поле', '%d0%9b%d0%be%d0%b4%d0%b5%d0%b9%d0%bd%d0%be%d0%b5-%d0%9f%d0%b', 'RU', 1),
(487, 36, 'Луга', '%d0%9b%d1%83%d0%b3%d0%b0', 'RU', 1),
(488, 36, 'Любань', '%d0%9b%d1%8e%d0%b1%d0%b0%d0%bd%d1%8c', 'RU', 1),
(489, 36, 'Никольское', '%d0%9d%d0%b8%d0%ba%d0%be%d0%bb%d1%8c%d1%81%d0%ba%d0%be%d0%b5', 'RU', 1),
(490, 36, 'Новая Ладога', '%d0%9d%d0%be%d0%b2%d0%b0%d1%8f-%d0%9b%d0%b0%d0%b4%d0%be%d0%b', 'RU', 1),
(491, 36, 'Отрадное', '%d0%9e%d1%82%d1%80%d0%b0%d0%b4%d0%bd%d0%be%d0%b5', 'RU', 1),
(492, 36, 'Пикалёво', '%d0%9f%d0%b8%d0%ba%d0%b0%d0%bb%d1%91%d0%b2%d0%be', 'RU', 1),
(493, 36, 'Подпорожье', '%d0%9f%d0%be%d0%b4%d0%bf%d0%be%d1%80%d0%be%d0%b6%d1%8c%d0%b5', 'RU', 1),
(494, 36, 'Приморск', '%d0%9f%d1%80%d0%b8%d0%bc%d0%be%d1%80%d1%81%d0%ba-1', 'RU', 1),
(495, 36, 'Приозерск', '%d0%9f%d1%80%d0%b8%d0%be%d0%b7%d0%b5%d1%80%d1%81%d0%ba', 'RU', 1),
(496, 36, 'Светогорск', '%d0%a1%d0%b2%d0%b5%d1%82%d0%be%d0%b3%d0%be%d1%80%d1%81%d0%ba', 'RU', 1),
(497, 36, 'Сертолово', '%d0%a1%d0%b5%d1%80%d1%82%d0%be%d0%bb%d0%be%d0%b2%d0%be', 'RU', 1),
(498, 36, 'Сланцы', '%d0%a1%d0%bb%d0%b0%d0%bd%d1%86%d1%8b', 'RU', 1),
(499, 36, 'Сосновый Бор', '%d0%a1%d0%be%d1%81%d0%bd%d0%be%d0%b2%d1%8b%d0%b9-%d0%91%d0%b', 'RU', 1),
(500, 36, 'Сясьстрой', '%d0%a1%d1%8f%d1%81%d1%8c%d1%81%d1%82%d1%80%d0%be%d0%b9', 'RU', 1),
(501, 36, 'Тихвин', '%d0%a2%d0%b8%d1%85%d0%b2%d0%b8%d0%bd', 'RU', 1),
(502, 36, 'Тосно', '%d0%a2%d0%be%d1%81%d0%bd%d0%be', 'RU', 1),
(503, 36, 'Шлиссельбург', '%d0%a8%d0%bb%d0%b8%d1%81%d1%81%d0%b5%d0%bb%d1%8c%d0%b1%d1%83', 'RU', 1),
(504, 37, 'Грязи', '%d0%93%d1%80%d1%8f%d0%b7%d0%b8', 'RU', 1),
(505, 37, 'Данков', '%d0%94%d0%b0%d0%bd%d0%ba%d0%be%d0%b2', 'RU', 1),
(506, 37, 'Елец', '%d0%95%d0%bb%d0%b5%d1%86', 'RU', 1),
(507, 37, 'Задонск', '%d0%97%d0%b0%d0%b4%d0%be%d0%bd%d1%81%d0%ba', 'RU', 1),
(508, 37, 'Лебедянь', '%d0%9b%d0%b5%d0%b1%d0%b5%d0%b4%d1%8f%d0%bd%d1%8c', 'RU', 1),
(509, 37, 'Липецк', '%d0%9b%d0%b8%d0%bf%d0%b5%d1%86%d0%ba', 'RU', 1),
(510, 37, 'Усмань', '%d0%a3%d1%81%d0%bc%d0%b0%d0%bd%d1%8c', 'RU', 1),
(511, 37, 'Чаплыгин', '%d0%a7%d0%b0%d0%bf%d0%bb%d1%8b%d0%b3%d0%b8%d0%bd', 'RU', 1),
(512, 38, 'Магадан', '%d0%9c%d0%b0%d0%b3%d0%b0%d0%b4%d0%b0%d0%bd', 'RU', 1),
(513, 38, 'Сусуман', '%d0%a1%d1%83%d1%81%d1%83%d0%bc%d0%b0%d0%bd', 'RU', 1),
(514, 39, 'Волжск', '%d0%92%d0%be%d0%bb%d0%b6%d1%81%d0%ba', 'RU', 1),
(515, 39, 'Звенигово', '%d0%97%d0%b2%d0%b5%d0%bd%d0%b8%d0%b3%d0%be%d0%b2%d0%be', 'RU', 1),
(516, 39, 'Йошкар-Ола', '%d0%99%d0%be%d1%88%d0%ba%d0%b0%d1%80-%d0%9e%d0%bb%d0%b0', 'RU', 1),
(517, 39, 'Козьмодемьянск', '%d0%9a%d0%be%d0%b7%d1%8c%d0%bc%d0%be%d0%b4%d0%b5%d0%bc%d1%8c', 'RU', 1),
(518, 40, 'Ардатов', '%d0%90%d1%80%d0%b4%d0%b0%d1%82%d0%be%d0%b2', 'RU', 1),
(519, 40, 'Инсар', '%d0%98%d0%bd%d1%81%d0%b0%d1%80', 'RU', 1),
(520, 40, 'Ковылкино', '%d0%9a%d0%be%d0%b2%d1%8b%d0%bb%d0%ba%d0%b8%d0%bd%d0%be', 'RU', 1),
(521, 40, 'Краснослободск', '%d0%9a%d1%80%d0%b0%d1%81%d0%bd%d0%be%d1%81%d0%bb%d0%be%d0%b1', 'RU', 1),
(522, 40, 'Рузаевка', '%d0%a0%d1%83%d0%b7%d0%b0%d0%b5%d0%b2%d0%ba%d0%b0', 'RU', 1),
(523, 40, 'Саранск', '%d0%a1%d0%b0%d1%80%d0%b0%d0%bd%d1%81%d0%ba', 'RU', 1),
(524, 40, 'Темников', '%d0%a2%d0%b5%d0%bc%d0%bd%d0%b8%d0%ba%d0%be%d0%b2', 'RU', 1),
(525, 41, 'Москва', '%d0%9c%d0%be%d1%81%d0%ba%d0%b2%d0%b0', 'RU', 1),
(526, 41, 'Московский', '%d0%9c%d0%be%d1%81%d0%ba%d0%be%d0%b2%d1%81%d0%ba%d0%b8%d0%b9', 'RU', 1),
(527, 41, 'Троицк', '%d0%a2%d1%80%d0%be%d0%b8%d1%86%d0%ba', 'RU', 1),
(528, 41, 'Щербинка', '%d0%a9%d0%b5%d1%80%d0%b1%d0%b8%d0%bd%d0%ba%d0%b0', 'RU', 1),
(529, 42, 'Апрелевка', '%d0%90%d0%bf%d1%80%d0%b5%d0%bb%d0%b5%d0%b2%d0%ba%d0%b0', 'RU', 1),
(530, 42, 'Балашиха', '%d0%91%d0%b0%d0%bb%d0%b0%d1%88%d0%b8%d1%85%d0%b0', 'RU', 1),
(531, 42, 'Бронницы', '%d0%91%d1%80%d0%be%d0%bd%d0%bd%d0%b8%d1%86%d1%8b', 'RU', 1),
(532, 42, 'Верея', '%d0%92%d0%b5%d1%80%d0%b5%d1%8f', 'RU', 1),
(533, 42, 'Видное', '%d0%92%d0%b8%d0%b4%d0%bd%d0%be%d0%b5', 'RU', 1),
(534, 42, 'Волоколамск', '%d0%92%d0%be%d0%bb%d0%be%d0%ba%d0%be%d0%bb%d0%b0%d0%bc%d1%81', 'RU', 1),
(535, 42, 'Воскресенск', '%d0%92%d0%be%d1%81%d0%ba%d1%80%d0%b5%d1%81%d0%b5%d0%bd%d1%81', 'RU', 1),
(536, 42, 'Высоковск', '%d0%92%d1%8b%d1%81%d0%be%d0%ba%d0%be%d0%b2%d1%81%d0%ba', 'RU', 1),
(537, 42, 'Голицыно', '%d0%93%d0%be%d0%bb%d0%b8%d1%86%d1%8b%d0%bd%d0%be', 'RU', 1),
(538, 42, 'Дедовск', '%d0%94%d0%b5%d0%b4%d0%be%d0%b2%d1%81%d0%ba', 'RU', 1),
(539, 42, 'Дзержинский', '%d0%94%d0%b7%d0%b5%d1%80%d0%b6%d0%b8%d0%bd%d1%81%d0%ba%d0%b8', 'RU', 1),
(540, 42, 'Дмитров', '%d0%94%d0%bc%d0%b8%d1%82%d1%80%d0%be%d0%b2', 'RU', 1),
(541, 42, 'Долгопрудный', '%d0%94%d0%be%d0%bb%d0%b3%d0%be%d0%bf%d1%80%d1%83%d0%b4%d0%bd', 'RU', 1),
(542, 42, 'Домодедово', '%d0%94%d0%be%d0%bc%d0%be%d0%b4%d0%b5%d0%b4%d0%be%d0%b2%d0%be', 'RU', 1),
(543, 42, 'Дрезна', '%d0%94%d1%80%d0%b5%d0%b7%d0%bd%d0%b0', 'RU', 1),
(544, 42, 'Дубна', '%d0%94%d1%83%d0%b1%d0%bd%d0%b0', 'RU', 1),
(545, 42, 'Егорьевск', '%d0%95%d0%b3%d0%be%d1%80%d1%8c%d0%b5%d0%b2%d1%81%d0%ba', 'RU', 1),
(546, 42, 'Жуковский', '%d0%96%d1%83%d0%ba%d0%be%d0%b2%d1%81%d0%ba%d0%b8%d0%b9', 'RU', 1),
(547, 42, 'Зарайск', '%d0%97%d0%b0%d1%80%d0%b0%d0%b9%d1%81%d0%ba', 'RU', 1),
(548, 42, 'Звенигород', '%d0%97%d0%b2%d0%b5%d0%bd%d0%b8%d0%b3%d0%be%d1%80%d0%be%d0%b4', 'RU', 1),
(549, 42, 'Ивантеевка', '%d0%98%d0%b2%d0%b0%d0%bd%d1%82%d0%b5%d0%b5%d0%b2%d0%ba%d0%b0', 'RU', 1),
(550, 42, 'Истра', '%d0%98%d1%81%d1%82%d1%80%d0%b0', 'RU', 1),
(551, 42, 'Кашира', '%d0%9a%d0%b0%d1%88%d0%b8%d1%80%d0%b0', 'RU', 1),
(552, 42, 'Климовск', '%d0%9a%d0%bb%d0%b8%d0%bc%d0%be%d0%b2%d1%81%d0%ba', 'RU', 1),
(553, 42, 'Клин', '%d0%9a%d0%bb%d0%b8%d0%bd', 'RU', 1),
(554, 42, 'Коломна', '%d0%9a%d0%be%d0%bb%d0%be%d0%bc%d0%bd%d0%b0', 'RU', 1),
(555, 42, 'Котельники', '%d0%9a%d0%be%d1%82%d0%b5%d0%bb%d1%8c%d0%bd%d0%b8%d0%ba%d0%b8', 'RU', 1),
(556, 42, 'Королёв', '%d0%9a%d0%be%d1%80%d0%be%d0%bb%d1%91%d0%b2', 'RU', 1),
(557, 42, 'Красноармейск', '%d0%9a%d1%80%d0%b0%d1%81%d0%bd%d0%be%d0%b0%d1%80%d0%bc%d0%b5', 'RU', 1),
(558, 42, 'Красногорск', '%d0%9a%d1%80%d0%b0%d1%81%d0%bd%d0%be%d0%b3%d0%be%d1%80%d1%81', 'RU', 1),
(559, 42, 'Краснозаводск', '%d0%9a%d1%80%d0%b0%d1%81%d0%bd%d0%be%d0%b7%d0%b0%d0%b2%d0%be', 'RU', 1),
(560, 42, 'Краснознаменск', '%d0%9a%d1%80%d0%b0%d1%81%d0%bd%d0%be%d0%b7%d0%bd%d0%b0%d0%bc', 'RU', 1),
(561, 42, 'Кубинка', '%d0%9a%d1%83%d0%b1%d0%b8%d0%bd%d0%ba%d0%b0', 'RU', 1),
(562, 42, 'Куровское', '%d0%9a%d1%83%d1%80%d0%be%d0%b2%d1%81%d0%ba%d0%be%d0%b5', 'RU', 1),
(563, 42, 'Ликино-Дулёво', '%d0%9b%d0%b8%d0%ba%d0%b8%d0%bd%d0%be-%d0%94%d1%83%d0%bb%d1%9', 'RU', 1),
(564, 42, 'Лобня', '%d0%9b%d0%be%d0%b1%d0%bd%d1%8f', 'RU', 1),
(565, 42, 'Лосино-Петровский', '%d0%9b%d0%be%d1%81%d0%b8%d0%bd%d0%be-%d0%9f%d0%b5%d1%82%d1%8', 'RU', 1),
(566, 42, 'Луховицы', '%d0%9b%d1%83%d1%85%d0%be%d0%b2%d0%b8%d1%86%d1%8b', 'RU', 1),
(567, 42, 'Лыткарино', '%d0%9b%d1%8b%d1%82%d0%ba%d0%b0%d1%80%d0%b8%d0%bd%d0%be', 'RU', 1),
(568, 42, 'Люберцы', '%d0%9b%d1%8e%d0%b1%d0%b5%d1%80%d1%86%d1%8b', 'RU', 1),
(569, 42, 'Можайск', '%d0%9c%d0%be%d0%b6%d0%b0%d0%b9%d1%81%d0%ba', 'RU', 1),
(570, 42, 'Мытищи', '%d0%9c%d1%8b%d1%82%d0%b8%d1%89%d0%b8', 'RU', 1),
(571, 42, 'Наро-Фоминск', '%d0%9d%d0%b0%d1%80%d0%be-%d0%a4%d0%be%d0%bc%d0%b8%d0%bd%d1%8', 'RU', 1),
(572, 42, 'Ногинск', '%d0%9d%d0%be%d0%b3%d0%b8%d0%bd%d1%81%d0%ba', 'RU', 1),
(573, 42, 'Одинцово', '%d0%9e%d0%b4%d0%b8%d0%bd%d1%86%d0%be%d0%b2%d0%be', 'RU', 1),
(574, 42, 'Ожерелье', '%d0%9e%d0%b6%d0%b5%d1%80%d0%b5%d0%bb%d1%8c%d0%b5', 'RU', 1),
(575, 42, 'Озёры', '%d0%9e%d0%b7%d1%91%d1%80%d1%8b', 'RU', 1),
(576, 42, 'Орехово-Зуево', '%d0%9e%d1%80%d0%b5%d1%85%d0%be%d0%b2%d0%be-%d0%97%d1%83%d0%b', 'RU', 1),
(577, 42, 'Павловский Посад', '%d0%9f%d0%b0%d0%b2%d0%bb%d0%be%d0%b2%d1%81%d0%ba%d0%b8%d0%b9', 'RU', 1),
(578, 42, 'Пересвет', '%d0%9f%d0%b5%d1%80%d0%b5%d1%81%d0%b2%d0%b5%d1%82', 'RU', 1),
(579, 42, 'Подольск', '%d0%9f%d0%be%d0%b4%d0%be%d0%bb%d1%8c%d1%81%d0%ba', 'RU', 1),
(580, 42, 'Протвино', '%d0%9f%d1%80%d0%be%d1%82%d0%b2%d0%b8%d0%bd%d0%be', 'RU', 1),
(581, 42, 'Пушкино', '%d0%9f%d1%83%d1%88%d0%ba%d0%b8%d0%bd%d0%be', 'RU', 1),
(582, 42, 'Пущино', '%d0%9f%d1%83%d1%89%d0%b8%d0%bd%d0%be', 'RU', 1),
(583, 42, 'Раменское', '%d0%a0%d0%b0%d0%bc%d0%b5%d0%bd%d1%81%d0%ba%d0%be%d0%b5', 'RU', 1),
(584, 42, 'Реутов', '%d0%a0%d0%b5%d1%83%d1%82%d0%be%d0%b2', 'RU', 1),
(585, 42, 'Рошаль', '%d0%a0%d0%be%d1%88%d0%b0%d0%bb%d1%8c', 'RU', 1),
(586, 42, 'Руза', '%d0%a0%d1%83%d0%b7%d0%b0', 'RU', 1),
(587, 42, 'Сергиев Посад', '%d0%a1%d0%b5%d1%80%d0%b3%d0%b8%d0%b5%d0%b2-%d0%9f%d0%be%d1%8', 'RU', 1),
(588, 42, 'Серпухов', '%d0%a1%d0%b5%d1%80%d0%bf%d1%83%d1%85%d0%be%d0%b2', 'RU', 1),
(589, 42, 'Солнечногорск', '%d0%a1%d0%be%d0%bb%d0%bd%d0%b5%d1%87%d0%bd%d0%be%d0%b3%d0%be', 'RU', 1),
(590, 42, 'Старая Купавна', '%d0%a1%d1%82%d0%b0%d1%80%d0%b0%d1%8f-%d0%9a%d1%83%d0%bf%d0%b', 'RU', 1),
(591, 42, 'Ступино', '%d0%a1%d1%82%d1%83%d0%bf%d0%b8%d0%bd%d0%be', 'RU', 1),
(592, 42, 'Талдом', '%d0%a2%d0%b0%d0%bb%d0%b4%d0%be%d0%bc', 'RU', 1),
(593, 42, 'Фрязино', '%d0%a4%d1%80%d1%8f%d0%b7%d0%b8%d0%bd%d0%be', 'RU', 1),
(594, 42, 'Химки', '%d0%a5%d0%b8%d0%bc%d0%ba%d0%b8', 'RU', 1),
(595, 42, 'Хотьково', '%d0%a5%d0%be%d1%82%d1%8c%d0%ba%d0%be%d0%b2%d0%be', 'RU', 1),
(596, 42, 'Черноголовка', '%d0%a7%d0%b5%d1%80%d0%bd%d0%be%d0%b3%d0%be%d0%bb%d0%be%d0%b2', 'RU', 1),
(597, 42, 'Чехов', '%d0%a7%d0%b5%d1%85%d0%be%d0%b2', 'RU', 1),
(598, 42, 'Шатура', '%d0%a8%d0%b0%d1%82%d1%83%d1%80%d0%b0', 'RU', 1),
(599, 42, 'Щёлково', '%d0%a9%d1%91%d0%bb%d0%ba%d0%be%d0%b2%d0%be', 'RU', 1),
(600, 42, 'Электрогорск', '%d0%ad%d0%bb%d0%b5%d0%ba%d1%82%d1%80%d0%be%d0%b3%d0%be%d1%80', 'RU', 1),
(601, 42, 'Электросталь', '%d0%ad%d0%bb%d0%b5%d0%ba%d1%82%d1%80%d0%be%d1%81%d1%82%d0%b0', 'RU', 1),
(602, 42, 'Электроугли', '%d0%ad%d0%bb%d0%b5%d0%ba%d1%82%d1%80%d0%be%d1%83%d0%b3%d0%bb', 'RU', 1),
(603, 42, 'Яхрома', '%d0%af%d1%85%d1%80%d0%be%d0%bc%d0%b0', 'RU', 1),
(604, 43, 'Апатиты', '%d0%90%d0%bf%d0%b0%d1%82%d0%b8%d1%82%d1%8b', 'RU', 1),
(605, 43, 'Гаджиево', '%d0%93%d0%b0%d0%b4%d0%b6%d0%b8%d0%b5%d0%b2%d0%be', 'RU', 1),
(606, 43, 'Заозёрск', '%d0%97%d0%b0%d0%be%d0%b7%d1%91%d1%80%d1%81%d0%ba', 'RU', 1),
(607, 43, 'Заполярный', '%d0%97%d0%b0%d0%bf%d0%be%d0%bb%d1%8f%d1%80%d0%bd%d1%8b%d0%b9', 'RU', 1),
(608, 43, 'Кандалакша', '%d0%9a%d0%b0%d0%bd%d0%b4%d0%b0%d0%bb%d0%b0%d0%ba%d1%88%d0%b0', 'RU', 1),
(609, 43, 'Кировск', '%d0%9a%d0%b8%d1%80%d0%be%d0%b2%d1%81%d0%ba-1', 'RU', 1),
(610, 43, 'Ковдор', '%d0%9a%d0%be%d0%b2%d0%b4%d0%be%d1%80', 'RU', 1),
(611, 43, 'Кола', '%d0%9a%d0%be%d0%bb%d0%b0', 'RU', 1),
(612, 43, 'Мончегорск', '%d0%9c%d0%be%d0%bd%d1%87%d0%b5%d0%b3%d0%be%d1%80%d1%81%d0%ba', 'RU', 1),
(613, 43, 'Мурманск', '%d0%9c%d1%83%d1%80%d0%bc%d0%b0%d0%bd%d1%81%d0%ba', 'RU', 1),
(614, 43, 'Оленегорск', '%d0%9e%d0%bb%d0%b5%d0%bd%d0%b5%d0%b3%d0%be%d1%80%d1%81%d0%ba', 'RU', 1),
(615, 43, 'Островной', '%d0%9e%d1%81%d1%82%d1%80%d0%be%d0%b2%d0%bd%d0%be%d0%b9', 'RU', 1),
(616, 43, 'Полярные Зори', '%d0%9f%d0%be%d0%bb%d1%8f%d1%80%d0%bd%d1%8b%d0%b5-%d0%97%d0%b', 'RU', 1),
(617, 43, 'Полярный', '%d0%9f%d0%be%d0%bb%d1%8f%d1%80%d0%bd%d1%8b%d0%b9', 'RU', 1),
(618, 43, 'Североморск', '%d0%a1%d0%b5%d0%b2%d0%b5%d1%80%d0%be%d0%bc%d0%be%d1%80%d1%81', 'RU', 1),
(619, 43, 'Снежногорск', '%d0%a1%d0%bd%d0%b5%d0%b6%d0%bd%d0%be%d0%b3%d0%be%d1%80%d1%81', 'RU', 1),
(620, 44, 'Нарьян-Мар', '%d0%9d%d0%b0%d1%80%d1%8c%d1%8f%d0%bd-%d0%9c%d0%b0%d1%80', 'RU', 1),
(621, 45, 'Арзамас', '%d0%90%d1%80%d0%b7%d0%b0%d0%bc%d0%b0%d1%81', 'RU', 1),
(622, 45, 'Балахна', '%d0%91%d0%b0%d0%bb%d0%b0%d1%85%d0%bd%d0%b0', 'RU', 1),
(623, 45, 'Богородск', '%d0%91%d0%be%d0%b3%d0%be%d1%80%d0%be%d0%b4%d1%81%d0%ba', 'RU', 1),
(624, 45, 'Бор', '%d0%91%d0%be%d1%80', 'RU', 1),
(625, 45, 'Ветлуга', '%d0%92%d0%b5%d1%82%d0%bb%d1%83%d0%b3%d0%b0', 'RU', 1),
(626, 45, 'Володарск', '%d0%92%d0%be%d0%bb%d0%be%d0%b4%d0%b0%d1%80%d1%81%d0%ba', 'RU', 1),
(627, 45, 'Ворсма', '%d0%92%d0%be%d1%80%d1%81%d0%bc%d0%b0', 'RU', 1),
(628, 45, 'Выкса', '%d0%92%d1%8b%d0%ba%d1%81%d0%b0', 'RU', 1),
(629, 45, 'Горбатов', '%d0%93%d0%be%d1%80%d0%b1%d0%b0%d1%82%d0%be%d0%b2', 'RU', 1),
(630, 45, 'Городец', '%d0%93%d0%be%d1%80%d0%be%d0%b4%d0%b5%d1%86', 'RU', 1),
(631, 45, 'Дзержинск', '%d0%94%d0%b7%d0%b5%d1%80%d0%b6%d0%b8%d0%bd%d1%81%d0%ba', 'RU', 1),
(632, 45, 'Заволжье', '%d0%97%d0%b0%d0%b2%d0%be%d0%bb%d0%b6%d1%8c%d0%b5', 'RU', 1),
(633, 45, 'Княгинино', '%d0%9a%d0%bd%d1%8f%d0%b3%d0%b8%d0%bd%d0%b8%d0%bd%d0%be', 'RU', 1),
(634, 45, 'Кстово', '%d0%9a%d1%81%d1%82%d0%be%d0%b2%d0%be', 'RU', 1),
(635, 45, 'Кулебаки', '%d0%9a%d1%83%d0%bb%d0%b5%d0%b1%d0%b0%d0%ba%d0%b8', 'RU', 1),
(636, 45, 'Лукоянов', '%d0%9b%d1%83%d0%ba%d0%be%d1%8f%d0%bd%d0%be%d0%b2', 'RU', 1),
(637, 45, 'Лысково', '%d0%9b%d1%8b%d1%81%d0%ba%d0%be%d0%b2%d0%be', 'RU', 1),
(638, 45, 'Навашино', '%d0%9d%d0%b0%d0%b2%d0%b0%d1%88%d0%b8%d0%bd%d0%be', 'RU', 1),
(639, 45, 'Нижний Новгород', '%d0%9d%d0%b8%d0%b6%d0%bd%d0%b8%d0%b9-%d0%9d%d0%be%d0%b2%d0%b', 'RU', 1),
(640, 45, 'Павлово', '%d0%9f%d0%b0%d0%b2%d0%bb%d0%be%d0%b2%d0%be', 'RU', 1),
(641, 45, 'Первомайск', '%d0%9f%d0%b5%d1%80%d0%b2%d0%be%d0%bc%d0%b0%d0%b9%d1%81%d0%ba', 'RU', 1);
INSERT INTO `oc_t_city` (`pk_i_id`, `fk_i_region_id`, `s_name`, `s_slug`, `fk_c_country_code`, `b_active`) VALUES
(642, 45, 'Перевоз', '%d0%9f%d0%b5%d1%80%d0%b5%d0%b2%d0%be%d0%b7', 'RU', 1),
(643, 45, 'Саров', '%d0%a1%d0%b0%d1%80%d0%be%d0%b2', 'RU', 1),
(644, 45, 'Семёнов', '%d0%a1%d0%b5%d0%bc%d1%91%d0%bd%d0%be%d0%b2', 'RU', 1),
(645, 45, 'Сергач', '%d0%a1%d0%b5%d1%80%d0%b3%d0%b0%d1%87', 'RU', 1),
(646, 45, 'Урень', '%d0%a3%d1%80%d0%b5%d0%bd%d1%8c', 'RU', 1),
(647, 45, 'Чкаловск', '%d0%a7%d0%ba%d0%b0%d0%bb%d0%be%d0%b2%d1%81%d0%ba', 'RU', 1),
(648, 45, 'Шахунья', '%d0%a8%d0%b0%d1%85%d1%83%d0%bd%d1%8c%d1%8f', 'RU', 1),
(650, 46, 'Боровичи', '%d0%91%d0%be%d1%80%d0%be%d0%b2%d0%b8%d1%87%d0%b8', 'RU', 1),
(651, 46, 'Валдай', '%d0%92%d0%b0%d0%bb%d0%b4%d0%b0%d0%b9', 'RU', 1),
(652, 46, 'Великий Новгород', '%d0%92%d0%b5%d0%bb%d0%b8%d0%ba%d0%b8%d0%b9-%d0%9d%d0%be%d0%b', 'RU', 1),
(653, 46, 'Малая Вишера', '%d0%9c%d0%b0%d0%bb%d0%b0%d1%8f-%d0%92%d0%b8%d1%88%d0%b5%d1%8', 'RU', 1),
(654, 46, 'Окуловка', '%d0%9e%d0%ba%d1%83%d0%bb%d0%be%d0%b2%d0%ba%d0%b0', 'RU', 1),
(655, 46, 'Пестово', '%d0%9f%d0%b5%d1%81%d1%82%d0%be%d0%b2%d0%be', 'RU', 1),
(656, 46, 'Сольцы', '%d0%a1%d0%be%d0%bb%d1%8c%d1%86%d1%8b', 'RU', 1),
(657, 46, 'Старая Русса', '%d0%a1%d1%82%d0%b0%d1%80%d0%b0%d1%8f-%d0%a0%d1%83%d1%81%d1%8', 'RU', 1),
(658, 46, 'Холм', '%d0%a5%d0%be%d0%bb%d0%bc', 'RU', 1),
(659, 46, 'Чудово', '%d0%a7%d1%83%d0%b4%d0%be%d0%b2%d0%be', 'RU', 1),
(660, 47, 'Барабинск', '%d0%91%d0%b0%d1%80%d0%b0%d0%b1%d0%b8%d0%bd%d1%81%d0%ba', 'RU', 1),
(661, 47, 'Бердск', '%d0%91%d0%b5%d1%80%d0%b4%d1%81%d0%ba', 'RU', 1),
(662, 47, 'Болотное', '%d0%91%d0%be%d0%bb%d0%be%d1%82%d0%bd%d0%be%d0%b5', 'RU', 1),
(663, 47, 'Искитим', '%d0%98%d1%81%d0%ba%d0%b8%d1%82%d0%b8%d0%bc', 'RU', 1),
(664, 47, 'Карасук', '%d0%9a%d0%b0%d1%80%d0%b0%d1%81%d1%83%d0%ba', 'RU', 1),
(665, 47, 'Каргат', '%d0%9a%d0%b0%d1%80%d0%b3%d0%b0%d1%82', 'RU', 1),
(666, 47, 'Куйбышев', '%d0%9a%d1%83%d0%b9%d0%b1%d1%8b%d1%88%d0%b5%d0%b2', 'RU', 1),
(667, 47, 'Купино', '%d0%9a%d1%83%d0%bf%d0%b8%d0%bd%d0%be', 'RU', 1),
(668, 47, 'Новосибирск', '%d0%9d%d0%be%d0%b2%d0%be%d1%81%d0%b8%d0%b1%d0%b8%d1%80%d1%81', 'RU', 1),
(669, 47, 'Обь', '%d0%9e%d0%b1%d1%8c', 'RU', 1),
(670, 47, 'Татарск', '%d0%a2%d0%b0%d1%82%d0%b0%d1%80%d1%81%d0%ba', 'RU', 1),
(671, 47, 'Тогучин', '%d0%a2%d0%be%d0%b3%d1%83%d1%87%d0%b8%d0%bd', 'RU', 1),
(672, 47, 'Черепаново', '%d0%a7%d0%b5%d1%80%d0%b5%d0%bf%d0%b0%d0%bd%d0%be%d0%b2%d0%be', 'RU', 1),
(673, 47, 'Чулым', '%d0%a7%d1%83%d0%bb%d1%8b%d0%bc', 'RU', 1),
(674, 48, 'Исилькуль', '%d0%98%d1%81%d0%b8%d0%bb%d1%8c%d0%ba%d1%83%d0%bb%d1%8c', 'RU', 1),
(675, 48, 'Калачинск', '%d0%9a%d0%b0%d0%bb%d0%b0%d1%87%d0%b8%d0%bd%d1%81%d0%ba', 'RU', 1),
(676, 48, 'Называевск', '%d0%9d%d0%b0%d0%b7%d1%8b%d0%b2%d0%b0%d0%b5%d0%b2%d1%81%d0%ba', 'RU', 1),
(677, 48, 'Омск', '%d0%9e%d0%bc%d1%81%d0%ba', 'RU', 1),
(678, 48, 'Тара', '%d0%a2%d0%b0%d1%80%d0%b0', 'RU', 1),
(679, 48, 'Тюкалинск', '%d0%a2%d1%8e%d0%ba%d0%b0%d0%bb%d0%b8%d0%bd%d1%81%d0%ba', 'RU', 1),
(680, 49, 'Абдулино', '%d0%90%d0%b1%d0%b4%d1%83%d0%bb%d0%b8%d0%bd%d0%be', 'RU', 1),
(681, 49, 'Бугуруслан', '%d0%91%d1%83%d0%b3%d1%83%d1%80%d1%83%d1%81%d0%bb%d0%b0%d0%bd', 'RU', 1),
(682, 49, 'Бузулук', '%d0%91%d1%83%d0%b7%d1%83%d0%bb%d1%83%d0%ba', 'RU', 1),
(683, 49, 'Гай', '%d0%93%d0%b0%d0%b9', 'RU', 1),
(684, 49, 'Кувандык', '%d0%9a%d1%83%d0%b2%d0%b0%d0%bd%d0%b4%d1%8b%d0%ba', 'RU', 1),
(685, 49, 'Медногорск', '%d0%9c%d0%b5%d0%b4%d0%bd%d0%be%d0%b3%d0%be%d1%80%d1%81%d0%ba', 'RU', 1),
(686, 49, 'Новотроицк', '%d0%9d%d0%be%d0%b2%d0%be%d1%82%d1%80%d0%be%d0%b8%d1%86%d0%ba', 'RU', 1),
(687, 49, 'Оренбург', '%d0%9e%d1%80%d0%b5%d0%bd%d0%b1%d1%83%d1%80%d0%b3', 'RU', 1),
(688, 49, 'Орск', '%d0%9e%d1%80%d1%81%d0%ba', 'RU', 1),
(689, 49, 'Соль-Илецк', '%d0%a1%d0%be%d0%bb%d1%8c-%d0%98%d0%bb%d0%b5%d1%86%d0%ba', 'RU', 1),
(690, 49, 'Сорочинск', '%d0%a1%d0%be%d1%80%d0%be%d1%87%d0%b8%d0%bd%d1%81%d0%ba', 'RU', 1),
(691, 49, 'Ясный', '%d0%af%d1%81%d0%bd%d1%8b%d0%b9', 'RU', 1),
(692, 50, 'Болхов', '%d0%91%d0%be%d0%bb%d1%85%d0%be%d0%b2', 'RU', 1),
(693, 50, 'Дмитровск', '%d0%94%d0%bc%d0%b8%d1%82%d1%80%d0%be%d0%b2%d1%81%d0%ba', 'RU', 1),
(694, 50, 'Ливны', '%d0%9b%d0%b8%d0%b2%d0%bd%d1%8b', 'RU', 1),
(695, 50, 'Малоархангельск', '%d0%9c%d0%b0%d0%bb%d0%be%d0%b0%d1%80%d1%85%d0%b0%d0%bd%d0%b3', 'RU', 1),
(696, 50, 'Мценск', '%d0%9c%d1%86%d0%b5%d0%bd%d1%81%d0%ba', 'RU', 1),
(697, 50, 'Новосиль', '%d0%9d%d0%be%d0%b2%d0%be%d1%81%d0%b8%d0%bb%d1%8c', 'RU', 1),
(698, 50, 'Орёл', '%d0%9e%d1%80%d1%91%d0%bb', 'RU', 1),
(699, 51, 'Белинский', '%d0%91%d0%b5%d0%bb%d0%b8%d0%bd%d1%81%d0%ba%d0%b8%d0%b9', 'RU', 1),
(700, 51, 'Городище', '%d0%93%d0%be%d1%80%d0%be%d0%b4%d0%b8%d1%89%d0%b5', 'RU', 1),
(701, 51, 'Заречный', '%d0%97%d0%b0%d1%80%d0%b5%d1%87%d0%bd%d1%8b%d0%b9', 'RU', 1),
(702, 51, 'Каменка', '%d0%9a%d0%b0%d0%bc%d0%b5%d0%bd%d0%ba%d0%b0', 'RU', 1),
(703, 51, 'Кузнецк', '%d0%9a%d1%83%d0%b7%d0%bd%d0%b5%d1%86%d0%ba', 'RU', 1),
(704, 51, 'Нижний Ломов', '%d0%9d%d0%b8%d0%b6%d0%bd%d0%b8%d0%b9-%d0%9b%d0%be%d0%bc%d0%b', 'RU', 1),
(705, 51, 'Никольск', '%d0%9d%d0%b8%d0%ba%d0%be%d0%bb%d1%8c%d1%81%d0%ba-1', 'RU', 1),
(706, 51, 'Пенза', '%d0%9f%d0%b5%d0%bd%d0%b7%d0%b0', 'RU', 1),
(707, 51, 'Сердобск', '%d0%a1%d0%b5%d1%80%d0%b4%d0%be%d0%b1%d1%81%d0%ba', 'RU', 1),
(708, 51, 'Спасск', '%d0%a1%d0%bf%d0%b0%d1%81%d1%81%d0%ba', 'RU', 1),
(709, 51, 'Сурск', '%d0%a1%d1%83%d1%80%d1%81%d0%ba', 'RU', 1),
(710, 52, 'Александровск', '%d0%90%d0%bb%d0%b5%d0%ba%d1%81%d0%b0%d0%bd%d0%b4%d1%80%d0%be', 'RU', 1),
(711, 52, 'Березники', '%d0%91%d0%b5%d1%80%d0%b5%d0%b7%d0%bd%d0%b8%d0%ba%d0%b8', 'RU', 1),
(712, 52, 'Верещагино', '%d0%92%d0%b5%d1%80%d0%b5%d1%89%d0%b0%d0%b3%d0%b8%d0%bd%d0%be', 'RU', 1),
(713, 52, 'Горнозаводск', '%d0%93%d0%be%d1%80%d0%bd%d0%be%d0%b7%d0%b0%d0%b2%d0%be%d0%b4', 'RU', 1),
(714, 52, 'Гремячинск', '%d0%93%d1%80%d0%b5%d0%bc%d1%8f%d1%87%d0%b8%d0%bd%d1%81%d0%ba', 'RU', 1),
(715, 52, 'Губаха', '%d0%93%d1%83%d0%b1%d0%b0%d1%85%d0%b0', 'RU', 1),
(716, 52, 'Добрянка', '%d0%94%d0%be%d0%b1%d1%80%d1%8f%d0%bd%d0%ba%d0%b0', 'RU', 1),
(717, 52, 'Кизел', '%d0%9a%d0%b8%d0%b7%d0%b5%d0%bb', 'RU', 1),
(718, 52, 'Красновишерск', '%d0%9a%d1%80%d0%b0%d1%81%d0%bd%d0%be%d0%b2%d0%b8%d1%88%d0%b5', 'RU', 1),
(719, 52, 'Краснокамск', '%d0%9a%d1%80%d0%b0%d1%81%d0%bd%d0%be%d0%ba%d0%b0%d0%bc%d1%81', 'RU', 1),
(720, 52, 'Кудымкар', '%d0%9a%d1%83%d0%b4%d1%8b%d0%bc%d0%ba%d0%b0%d1%80', 'RU', 1),
(721, 52, 'Кунгур', '%d0%9a%d1%83%d0%bd%d0%b3%d1%83%d1%80', 'RU', 1),
(722, 52, 'Лысьва', '%d0%9b%d1%8b%d1%81%d1%8c%d0%b2%d0%b0', 'RU', 1),
(723, 52, 'Нытва', '%d0%9d%d1%8b%d1%82%d0%b2%d0%b0', 'RU', 1),
(724, 52, 'Оса', '%d0%9e%d1%81%d0%b0', 'RU', 1),
(725, 52, 'Оханск', '%d0%9e%d1%85%d0%b0%d0%bd%d1%81%d0%ba', 'RU', 1),
(726, 52, 'Очёр', '%d0%9e%d1%87%d1%91%d1%80', 'RU', 1),
(727, 52, 'Пермь', '%d0%9f%d0%b5%d1%80%d0%bc%d1%8c', 'RU', 1),
(728, 52, 'Соликамск', '%d0%a1%d0%be%d0%bb%d0%b8%d0%ba%d0%b0%d0%bc%d1%81%d0%ba', 'RU', 1),
(729, 52, 'Усолье', '%d0%a3%d1%81%d0%be%d0%bb%d1%8c%d0%b5', 'RU', 1),
(730, 52, 'Чайковский', '%d0%a7%d0%b0%d0%b9%d0%ba%d0%be%d0%b2%d1%81%d0%ba%d0%b8%d0%b9', 'RU', 1),
(731, 52, 'Чердынь', '%d0%a7%d0%b5%d1%80%d0%b4%d1%8b%d0%bd%d1%8c', 'RU', 1),
(732, 52, 'Чёрмоз', '%d0%a7%d1%91%d1%80%d0%bc%d0%be%d0%b7', 'RU', 1),
(733, 52, 'Чернушка', '%d0%a7%d0%b5%d1%80%d0%bd%d1%83%d1%88%d0%ba%d0%b0', 'RU', 1),
(734, 52, 'Чусовой', '%d0%a7%d1%83%d1%81%d0%be%d0%b2%d0%be%d0%b9', 'RU', 1),
(735, 53, 'Арсеньев', '%d0%90%d1%80%d1%81%d0%b5%d0%bd%d1%8c%d0%b5%d0%b2', 'RU', 1),
(736, 53, 'Артём', '%d0%90%d1%80%d1%82%d1%91%d0%bc', 'RU', 1),
(737, 53, 'Большой Камень', '%d0%91%d0%be%d0%bb%d1%8c%d1%88%d0%be%d0%b9-%d0%9a%d0%b0%d0%b', 'RU', 1),
(738, 53, 'Владивосток', '%d0%92%d0%bb%d0%b0%d0%b4%d0%b8%d0%b2%d0%be%d1%81%d1%82%d0%be', 'RU', 1),
(739, 53, 'Дальнегорск', '%d0%94%d0%b0%d0%bb%d1%8c%d0%bd%d0%b5%d0%b3%d0%be%d1%80%d1%81', 'RU', 1),
(740, 53, 'Дальнереченск', '%d0%94%d0%b0%d0%bb%d1%8c%d0%bd%d0%b5%d1%80%d0%b5%d1%87%d0%b5', 'RU', 1),
(741, 53, 'Лесозаводск', '%d0%9b%d0%b5%d1%81%d0%be%d0%b7%d0%b0%d0%b2%d0%be%d0%b4%d1%81', 'RU', 1),
(742, 53, 'Находка', '%d0%9d%d0%b0%d1%85%d0%be%d0%b4%d0%ba%d0%b0', 'RU', 1),
(743, 53, 'Партизанск', '%d0%9f%d0%b0%d1%80%d1%82%d0%b8%d0%b7%d0%b0%d0%bd%d1%81%d0%ba', 'RU', 1),
(744, 53, 'Спасск-Дальний', '%d0%a1%d0%bf%d0%b0%d1%81%d1%81%d0%ba-%d0%94%d0%b0%d0%bb%d1%8', 'RU', 1),
(745, 53, 'Уссурийск', '%d0%a3%d1%81%d1%81%d1%83%d1%80%d0%b8%d0%b9%d1%81%d0%ba', 'RU', 1),
(746, 53, 'Фокино', '%d0%a4%d0%be%d0%ba%d0%b8%d0%bd%d0%be-1', 'RU', 1),
(747, 54, 'Великие Луки', '%d0%92%d0%b5%d0%bb%d0%b8%d0%ba%d0%b8%d0%b5-%d0%9b%d1%83%d0%b', 'RU', 1),
(748, 54, 'Гдов', '%d0%93%d0%b4%d0%be%d0%b2', 'RU', 1),
(749, 54, 'Дно', '%d0%94%d0%bd%d0%be', 'RU', 1),
(750, 54, 'Невель', '%d0%9d%d0%b5%d0%b2%d0%b5%d0%bb%d1%8c', 'RU', 1),
(751, 54, 'Новоржев', '%d0%9d%d0%be%d0%b2%d0%be%d1%80%d0%b6%d0%b5%d0%b2', 'RU', 1),
(752, 54, 'Новосокольники', '%d0%9d%d0%be%d0%b2%d0%be%d1%81%d0%be%d0%ba%d0%be%d0%bb%d1%8c', 'RU', 1),
(753, 54, 'Опочка', '%d0%9e%d0%bf%d0%be%d1%87%d0%ba%d0%b0', 'RU', 1),
(754, 54, 'Остров', '%d0%9e%d1%81%d1%82%d1%80%d0%be%d0%b2', 'RU', 1),
(755, 54, 'Печоры', '%d0%9f%d0%b5%d1%87%d0%be%d1%80%d1%8b', 'RU', 1),
(756, 54, 'Порхов', '%d0%9f%d0%be%d1%80%d1%85%d0%be%d0%b2', 'RU', 1),
(757, 54, 'Псков', '%d0%9f%d1%81%d0%ba%d0%be%d0%b2', 'RU', 1),
(758, 54, 'Пустошка', '%d0%9f%d1%83%d1%81%d1%82%d0%be%d1%88%d0%ba%d0%b0', 'RU', 1),
(759, 54, 'Пыталово', '%d0%9f%d1%8b%d1%82%d0%b0%d0%bb%d0%be%d0%b2%d0%be', 'RU', 1),
(760, 54, 'Себеж', '%d0%a1%d0%b5%d0%b1%d0%b5%d0%b6', 'RU', 1),
(761, 55, 'Азов', '%d0%90%d0%b7%d0%be%d0%b2', 'RU', 1),
(762, 55, 'Аксай', '%d0%90%d0%ba%d1%81%d0%b0%d0%b9', 'RU', 1),
(763, 55, 'Батайск', '%d0%91%d0%b0%d1%82%d0%b0%d0%b9%d1%81%d0%ba', 'RU', 1),
(764, 55, 'Белая Калитва', '%d0%91%d0%b5%d0%bb%d0%b0%d1%8f-%d0%9a%d0%b0%d0%bb%d0%b8%d1%8', 'RU', 1),
(765, 55, 'Волгодонск', '%d0%92%d0%be%d0%bb%d0%b3%d0%be%d0%b4%d0%be%d0%bd%d1%81%d0%ba', 'RU', 1),
(766, 55, 'Гуково', '%d0%93%d1%83%d0%ba%d0%be%d0%b2%d0%be', 'RU', 1),
(767, 55, 'Донецк', '%d0%94%d0%be%d0%bd%d0%b5%d1%86%d0%ba', 'RU', 1),
(768, 55, 'Зверево', '%d0%97%d0%b2%d0%b5%d1%80%d0%b5%d0%b2%d0%be', 'RU', 1),
(769, 55, 'Зерноград', '%d0%97%d0%b5%d1%80%d0%bd%d0%be%d0%b3%d1%80%d0%b0%d0%b4', 'RU', 1),
(770, 55, 'Каменск-Шахтинский', '%d0%9a%d0%b0%d0%bc%d0%b5%d0%bd%d1%81%d0%ba-%d0%a8%d0%b0%d1%8', 'RU', 1),
(771, 55, 'Константиновск', '%d0%9a%d0%be%d0%bd%d1%81%d1%82%d0%b0%d0%bd%d1%82%d0%b8%d0%bd', 'RU', 1),
(772, 55, 'Красный Сулин', '%d0%9a%d1%80%d0%b0%d1%81%d0%bd%d1%8b%d0%b9-%d0%a1%d1%83%d0%b', 'RU', 1),
(773, 55, 'Миллерово', '%d0%9c%d0%b8%d0%bb%d0%bb%d0%b5%d1%80%d0%be%d0%b2%d0%be', 'RU', 1),
(774, 55, 'Морозовск', '%d0%9c%d0%be%d1%80%d0%be%d0%b7%d0%be%d0%b2%d1%81%d0%ba', 'RU', 1),
(775, 55, 'Новочеркасск', '%d0%9d%d0%be%d0%b2%d0%be%d1%87%d0%b5%d1%80%d0%ba%d0%b0%d1%81', 'RU', 1),
(776, 55, 'Новошахтинск', '%d0%9d%d0%be%d0%b2%d0%be%d1%88%d0%b0%d1%85%d1%82%d0%b8%d0%bd', 'RU', 1),
(777, 55, 'Пролетарск', '%d0%9f%d1%80%d0%be%d0%bb%d0%b5%d1%82%d0%b0%d1%80%d1%81%d0%ba', 'RU', 1),
(778, 55, 'Ростов-на-Дону', '%d0%a0%d0%be%d1%81%d1%82%d0%be%d0%b2-%d0%bd%d0%b0-%d0%94%d0%', 'RU', 1),
(779, 55, 'Сальск', '%d0%a1%d0%b0%d0%bb%d1%8c%d1%81%d0%ba', 'RU', 1),
(780, 55, 'Семикаракорск', '%d0%a1%d0%b5%d0%bc%d0%b8%d0%ba%d0%b0%d1%80%d0%b0%d0%ba%d0%be', 'RU', 1),
(781, 55, 'Таганрог', '%d0%a2%d0%b0%d0%b3%d0%b0%d0%bd%d1%80%d0%be%d0%b3', 'RU', 1),
(782, 55, 'Цимлянск', '%d0%a6%d0%b8%d0%bc%d0%bb%d1%8f%d0%bd%d1%81%d0%ba', 'RU', 1),
(783, 55, 'Шахты', '%d0%a8%d0%b0%d1%85%d1%82%d1%8b', 'RU', 1),
(784, 56, 'Касимов', '%d0%9a%d0%b0%d1%81%d0%b8%d0%bc%d0%be%d0%b2', 'RU', 1),
(785, 56, 'Кораблино', '%d0%9a%d0%be%d1%80%d0%b0%d0%b1%d0%bb%d0%b8%d0%bd%d0%be', 'RU', 1),
(786, 56, 'Михайлов', '%d0%9c%d0%b8%d1%85%d0%b0%d0%b9%d0%bb%d0%be%d0%b2', 'RU', 1),
(787, 56, 'Новомичуринск', '%d0%9d%d0%be%d0%b2%d0%be%d0%bc%d0%b8%d1%87%d1%83%d1%80%d0%b8', 'RU', 1),
(788, 56, 'Рыбное', '%d0%a0%d1%8b%d0%b1%d0%bd%d0%be%d0%b5', 'RU', 1),
(789, 56, 'Ряжск', '%d0%a0%d1%8f%d0%b6%d1%81%d0%ba', 'RU', 1),
(790, 56, 'Рязань', '%d0%a0%d1%8f%d0%b7%d0%b0%d0%bd%d1%8c', 'RU', 1),
(791, 56, 'Сасово', '%d0%a1%d0%b0%d1%81%d0%be%d0%b2%d0%be', 'RU', 1),
(792, 56, 'Скопин', '%d0%a1%d0%ba%d0%be%d0%bf%d0%b8%d0%bd', 'RU', 1),
(793, 56, 'Спас-Клепики', '%d0%a1%d0%bf%d0%b0%d1%81-%d0%9a%d0%bb%d0%b5%d0%bf%d0%b8%d0%b', 'RU', 1),
(794, 56, 'Спасск-Рязанский', '%d0%a1%d0%bf%d0%b0%d1%81%d1%81%d0%ba-%d0%a0%d1%8f%d0%b7%d0%b', 'RU', 1),
(795, 56, 'Шацк', '%d0%a8%d0%b0%d1%86%d0%ba', 'RU', 1),
(796, 57, 'Жигулёвск', '%d0%96%d0%b8%d0%b3%d1%83%d0%bb%d1%91%d0%b2%d1%81%d0%ba', 'RU', 1),
(797, 57, 'Кинель', '%d0%9a%d0%b8%d0%bd%d0%b5%d0%bb%d1%8c', 'RU', 1),
(798, 57, 'Нефтегорск', '%d0%9d%d0%b5%d1%84%d1%82%d0%b5%d0%b3%d0%be%d1%80%d1%81%d0%ba', 'RU', 1),
(799, 57, 'Октябрьск', '%d0%9e%d0%ba%d1%82%d1%8f%d0%b1%d1%80%d1%8c%d1%81%d0%ba', 'RU', 1),
(800, 57, 'Отрадный', '%d0%9e%d1%82%d1%80%d0%b0%d0%b4%d0%bd%d1%8b%d0%b9', 'RU', 1),
(801, 57, 'Похвистнево', '%d0%9f%d0%be%d1%85%d0%b2%d0%b8%d1%81%d1%82%d0%bd%d0%b5%d0%b2', 'RU', 1),
(802, 57, 'Самара', '%d0%a1%d0%b0%d0%bc%d0%b0%d1%80%d0%b0', 'RU', 1),
(803, 57, 'Сызрань', '%d0%a1%d1%8b%d0%b7%d1%80%d0%b0%d0%bd%d1%8c', 'RU', 1),
(804, 57, 'Тольятти', '%d0%a2%d0%be%d0%bb%d1%8c%d1%8f%d1%82%d1%82%d0%b8', 'RU', 1),
(805, 57, 'Чапаевск', '%d0%a7%d0%b0%d0%bf%d0%b0%d0%b5%d0%b2%d1%81%d0%ba', 'RU', 1),
(806, 58, 'Зеленогорск', '%d0%97%d0%b5%d0%bb%d0%b5%d0%bd%d0%be%d0%b3%d0%be%d1%80%d1%81', 'RU', 1),
(807, 58, 'Колпино', '%d0%9a%d0%be%d0%bb%d0%bf%d0%b8%d0%bd%d0%be', 'RU', 1),
(808, 58, 'Красное Село', '%d0%9a%d1%80%d0%b0%d1%81%d0%bd%d0%be%d0%b5-%d0%a1%d0%b5%d0%b', 'RU', 1),
(809, 58, 'Кронштадт', '%d0%9a%d1%80%d0%be%d0%bd%d1%88%d1%82%d0%b0%d0%b4%d1%82', 'RU', 1),
(810, 58, 'Ломоносов', '%d0%9b%d0%be%d0%bc%d0%be%d0%bd%d0%be%d1%81%d0%be%d0%b2', 'RU', 1),
(811, 58, 'Павловск', '%d0%9f%d0%b0%d0%b2%d0%bb%d0%be%d0%b2%d1%81%d0%ba-1', 'RU', 1),
(812, 58, 'Петергоф', '%d0%9f%d0%b5%d1%82%d0%b5%d1%80%d0%b3%d0%be%d1%84', 'RU', 1),
(813, 58, 'Пушкин', '%d0%9f%d1%83%d1%88%d0%ba%d0%b8%d0%bd', 'RU', 1),
(814, 58, 'Санкт-Петербург', '%d0%a1%d0%b0%d0%bd%d0%ba%d1%82-%d0%9f%d0%b5%d1%82%d0%b5%d1%8', 'RU', 1),
(815, 58, 'Сестрорецк', '%d0%a1%d0%b5%d1%81%d1%82%d1%80%d0%be%d1%80%d0%b5%d1%86%d0%ba', 'RU', 1),
(816, 59, 'Аркадак', '%d0%90%d1%80%d0%ba%d0%b0%d0%b4%d0%b0%d0%ba', 'RU', 1),
(817, 59, 'Аткарск', '%d0%90%d1%82%d0%ba%d0%b0%d1%80%d1%81%d0%ba', 'RU', 1),
(818, 59, 'Балаково', '%d0%91%d0%b0%d0%bb%d0%b0%d0%ba%d0%be%d0%b2%d0%be', 'RU', 1),
(819, 59, 'Балашов', '%d0%91%d0%b0%d0%bb%d0%b0%d1%88%d0%be%d0%b2', 'RU', 1),
(820, 59, 'Вольск', '%d0%92%d0%be%d0%bb%d1%8c%d1%81%d0%ba', 'RU', 1),
(821, 59, 'Ершов', '%d0%95%d1%80%d1%88%d0%be%d0%b2', 'RU', 1),
(822, 59, 'Калининск', '%d0%9a%d0%b0%d0%bb%d0%b8%d0%bd%d0%b8%d0%bd%d1%81%d0%ba', 'RU', 1),
(823, 59, 'Красноармейск', '%d0%9a%d1%80%d0%b0%d1%81%d0%bd%d0%be%d0%b0%d1%80%d0%bc%d0%b5', 'RU', 1),
(824, 59, 'Красный Кут', '%d0%9a%d1%80%d0%b0%d1%81%d0%bd%d1%8b%d0%b9-%d0%9a%d1%83%d1%8', 'RU', 1),
(825, 59, 'Маркс', '%d0%9c%d0%b0%d1%80%d0%ba%d1%81', 'RU', 1),
(826, 59, 'Новоузенск', '%d0%9d%d0%be%d0%b2%d0%be%d1%83%d0%b7%d0%b5%d0%bd%d1%81%d0%ba', 'RU', 1),
(827, 59, 'Петровск', '%d0%9f%d0%b5%d1%82%d1%80%d0%be%d0%b2%d1%81%d0%ba', 'RU', 1),
(828, 59, 'Пугачёв', '%d0%9f%d1%83%d0%b3%d0%b0%d1%87%d1%91%d0%b2', 'RU', 1),
(829, 59, 'Ртищево', '%d0%a0%d1%82%d0%b8%d1%89%d0%b5%d0%b2%d0%be', 'RU', 1),
(830, 59, 'Саратов', '%d0%a1%d0%b0%d1%80%d0%b0%d1%82%d0%be%d0%b2', 'RU', 1),
(831, 59, 'Хвалынск', '%d0%a5%d0%b2%d0%b0%d0%bb%d1%8b%d0%bd%d1%81%d0%ba', 'RU', 1),
(832, 59, 'Шиханы', '%d0%a8%d0%b8%d1%85%d0%b0%d0%bd%d1%8b', 'RU', 1),
(833, 59, 'Энгельс', '%d0%ad%d0%bd%d0%b3%d0%b5%d0%bb%d1%8c%d1%81', 'RU', 1),
(834, 60, 'Александровск-Сахалинский', '%d0%90%d0%bb%d0%b5%d0%ba%d1%81%d0%b0%d0%bd%d0%b4%d1%80%d0%be', 'RU', 1),
(835, 60, 'Анива', '%d0%90%d0%bd%d0%b8%d0%b2%d0%b0', 'RU', 1),
(836, 60, 'Долинск', '%d0%94%d0%be%d0%bb%d0%b8%d0%bd%d1%81%d0%ba', 'RU', 1),
(837, 60, 'Корсаков', '%d0%9a%d0%be%d1%80%d1%81%d0%b0%d0%ba%d0%be%d0%b2', 'RU', 1),
(838, 60, 'Курильск', '%d0%9a%d1%83%d1%80%d0%b8%d0%bb%d1%8c%d1%81%d0%ba', 'RU', 1),
(839, 60, 'Макаров', '%d0%9c%d0%b0%d0%ba%d0%b0%d1%80%d0%be%d0%b2', 'RU', 1),
(840, 60, 'Невельск', '%d0%9d%d0%b5%d0%b2%d0%b5%d0%bb%d1%8c%d1%81%d0%ba', 'RU', 1),
(841, 60, 'Оха', '%d0%9e%d1%85%d0%b0', 'RU', 1),
(842, 60, 'Поронайск', '%d0%9f%d0%be%d1%80%d0%be%d0%bd%d0%b0%d0%b9%d1%81%d0%ba', 'RU', 1),
(843, 60, 'Северо-Курильск', '%d0%a1%d0%b5%d0%b2%d0%b5%d1%80%d0%be-%d0%9a%d1%83%d1%80%d0%b', 'RU', 1),
(844, 60, 'Томари', '%d0%a2%d0%be%d0%bc%d0%b0%d1%80%d0%b8', 'RU', 1),
(845, 60, 'Углегорск', '%d0%a3%d0%b3%d0%bb%d0%b5%d0%b3%d0%be%d1%80%d1%81%d0%ba', 'RU', 1),
(846, 60, 'Холмск', '%d0%a5%d0%be%d0%bb%d0%bc%d1%81%d0%ba', 'RU', 1),
(847, 60, 'Шахтёрск', '%d0%a8%d0%b0%d1%85%d1%82%d1%91%d1%80%d1%81%d0%ba', 'RU', 1),
(848, 60, 'Южно-Сахалинск', '%d0%ae%d0%b6%d0%bd%d0%be-%d0%a1%d0%b0%d1%85%d0%b0%d0%bb%d0%b', 'RU', 1),
(849, 61, 'Алапаевск', '%d0%90%d0%bb%d0%b0%d0%bf%d0%b0%d0%b5%d0%b2%d1%81%d0%ba', 'RU', 1),
(850, 61, 'Арамиль', '%d0%90%d1%80%d0%b0%d0%bc%d0%b8%d0%bb%d1%8c', 'RU', 1),
(851, 61, 'Артёмовский', '%d0%90%d1%80%d1%82%d1%91%d0%bc%d0%be%d0%b2%d1%81%d0%ba%d0%b8', 'RU', 1),
(852, 61, 'Асбест', '%d0%90%d1%81%d0%b1%d0%b5%d1%81%d1%82', 'RU', 1),
(853, 61, 'Берёзовский', '%d0%91%d0%b5%d1%80%d1%91%d0%b7%d0%be%d0%b2%d1%81%d0%ba%d0%b8', 'RU', 1),
(854, 61, 'Богданович', '%d0%91%d0%be%d0%b3%d0%b4%d0%b0%d0%bd%d0%be%d0%b2%d0%b8%d1%87', 'RU', 1),
(855, 61, 'Верхний Тагил', '%d0%92%d0%b5%d1%80%d1%85%d0%bd%d0%b8%d0%b9-%d0%a2%d0%b0%d0%b', 'RU', 1),
(856, 61, 'Верхняя Пышма', '%d0%92%d0%b5%d1%80%d1%85%d0%bd%d1%8f%d1%8f-%d0%9f%d1%8b%d1%8', 'RU', 1),
(857, 61, 'Верхняя Салда', '%d0%92%d0%b5%d1%80%d1%85%d0%bd%d1%8f%d1%8f-%d0%a1%d0%b0%d0%b', 'RU', 1),
(858, 61, 'Верхняя Тура', '%d0%92%d0%b5%d1%80%d1%85%d0%bd%d1%8f%d1%8f-%d0%a2%d1%83%d1%8', 'RU', 1),
(859, 61, 'Верхотурье', '%d0%92%d0%b5%d1%80%d1%85%d0%be%d1%82%d1%83%d1%80%d1%8c%d0%b5', 'RU', 1),
(860, 61, 'Волчанск', '%d0%92%d0%be%d0%bb%d1%87%d0%b0%d0%bd%d1%81%d0%ba', 'RU', 1),
(861, 61, 'Дегтярск', '%d0%94%d0%b5%d0%b3%d1%82%d1%8f%d1%80%d1%81%d0%ba', 'RU', 1),
(862, 61, 'Екатеринбург', '%d0%95%d0%ba%d0%b0%d1%82%d0%b5%d1%80%d0%b8%d0%bd%d0%b1%d1%83', 'RU', 1),
(863, 61, 'Заречный', '%d0%97%d0%b0%d1%80%d0%b5%d1%87%d0%bd%d1%8b%d0%b9-1', 'RU', 1),
(864, 61, 'Ивдель', '%d0%98%d0%b2%d0%b4%d0%b5%d0%bb%d1%8c', 'RU', 1),
(865, 61, 'Ирбит', '%d0%98%d1%80%d0%b1%d0%b8%d1%82', 'RU', 1),
(866, 61, 'Каменск-Уральский', '%d0%9a%d0%b0%d0%bc%d0%b5%d0%bd%d1%81%d0%ba-%d0%a3%d1%80%d0%b', 'RU', 1),
(867, 61, 'Камышлов', '%d0%9a%d0%b0%d0%bc%d1%8b%d1%88%d0%bb%d0%be%d0%b2', 'RU', 1),
(868, 61, 'Карпинск', '%d0%9a%d0%b0%d1%80%d0%bf%d0%b8%d0%bd%d1%81%d0%ba', 'RU', 1),
(869, 61, 'Качканар', '%d0%9a%d0%b0%d1%87%d0%ba%d0%b0%d0%bd%d0%b0%d1%80', 'RU', 1),
(870, 61, 'Кировград', '%d0%9a%d0%b8%d1%80%d0%be%d0%b2%d0%b3%d1%80%d0%b0%d0%b4', 'RU', 1),
(871, 61, 'Краснотурьинск', '%d0%9a%d1%80%d0%b0%d1%81%d0%bd%d0%be%d1%82%d1%83%d1%80%d1%8c', 'RU', 1),
(872, 61, 'Красноуральск', '%d0%9a%d1%80%d0%b0%d1%81%d0%bd%d0%be%d1%83%d1%80%d0%b0%d0%bb', 'RU', 1),
(873, 61, 'Красноуфимск', '%d0%9a%d1%80%d0%b0%d1%81%d0%bd%d0%be%d1%83%d1%84%d0%b8%d0%bc', 'RU', 1),
(874, 61, 'Кушва', '%d0%9a%d1%83%d1%88%d0%b2%d0%b0', 'RU', 1),
(875, 61, 'Лесной', '%d0%9b%d0%b5%d1%81%d0%bd%d0%be%d0%b9', 'RU', 1),
(876, 61, 'Михайловск', '%d0%9c%d0%b8%d1%85%d0%b0%d0%b9%d0%bb%d0%be%d0%b2%d1%81%d0%ba', 'RU', 1),
(877, 61, 'Невьянск', '%d0%9d%d0%b5%d0%b2%d1%8c%d1%8f%d0%bd%d1%81%d0%ba', 'RU', 1),
(878, 61, 'Нижние Серги', '%d0%9d%d0%b8%d0%b6%d0%bd%d0%b8%d0%b5-%d0%a1%d0%b5%d1%80%d0%b', 'RU', 1),
(879, 61, 'Нижний Тагил', '%d0%9d%d0%b8%d0%b6%d0%bd%d0%b8%d0%b9-%d0%a2%d0%b0%d0%b3%d0%b', 'RU', 1),
(880, 61, 'Нижняя Салда', '%d0%9d%d0%b8%d0%b6%d0%bd%d1%8f%d1%8f-%d0%a1%d0%b0%d0%bb%d0%b', 'RU', 1),
(881, 61, 'Нижняя Тура', '%d0%9d%d0%b8%d0%b6%d0%bd%d1%8f%d1%8f-%d0%a2%d1%83%d1%80%d0%b', 'RU', 1),
(882, 61, 'Новая Ляля', '%d0%9d%d0%be%d0%b2%d0%b0%d1%8f-%d0%9b%d1%8f%d0%bb%d1%8f', 'RU', 1),
(883, 61, 'Новоуральск', '%d0%9d%d0%be%d0%b2%d0%be%d1%83%d1%80%d0%b0%d0%bb%d1%8c%d1%81', 'RU', 1),
(884, 61, 'Первоуральск', '%d0%9f%d0%b5%d1%80%d0%b2%d0%be%d1%83%d1%80%d0%b0%d0%bb%d1%8c', 'RU', 1),
(885, 61, 'Полевской', '%d0%9f%d0%be%d0%bb%d0%b5%d0%b2%d1%81%d0%ba%d0%be%d0%b9', 'RU', 1),
(886, 61, 'Ревда', '%d0%a0%d0%b5%d0%b2%d0%b4%d0%b0', 'RU', 1),
(887, 61, 'Реж', '%d0%a0%d0%b5%d0%b6', 'RU', 1),
(888, 61, 'Североуральск', '%d0%a1%d0%b5%d0%b2%d0%b5%d1%80%d0%be%d1%83%d1%80%d0%b0%d0%bb', 'RU', 1),
(889, 61, 'Серов', '%d0%a1%d0%b5%d1%80%d0%be%d0%b2', 'RU', 1),
(890, 61, 'Среднеуральск', '%d0%a1%d1%80%d0%b5%d0%b4%d0%bd%d0%b5%d1%83%d1%80%d0%b0%d0%bb', 'RU', 1),
(891, 61, 'Сухой Лог', '%d0%a1%d1%83%d1%85%d0%be%d0%b9-%d0%9b%d0%be%d0%b3', 'RU', 1),
(892, 61, 'Сысерть', '%d0%a1%d1%8b%d1%81%d0%b5%d1%80%d1%82%d1%8c', 'RU', 1),
(893, 61, 'Тавда', '%d0%a2%d0%b0%d0%b2%d0%b4%d0%b0', 'RU', 1),
(894, 61, 'Талица', '%d0%a2%d0%b0%d0%bb%d0%b8%d1%86%d0%b0', 'RU', 1),
(895, 61, 'Туринск', '%d0%a2%d1%83%d1%80%d0%b8%d0%bd%d1%81%d0%ba', 'RU', 1),
(896, 62, 'Инкерман', '%d0%98%d0%bd%d0%ba%d0%b5%d1%80%d0%bc%d0%b0%d0%bd', 'RU', 1),
(897, 62, 'Севастополь', '%d0%a1%d0%b5%d0%b2%d0%b0%d1%81%d1%82%d0%be%d0%bf%d0%be%d0%bb', 'RU', 1),
(898, 63, 'Алагир', '%d0%90%d0%bb%d0%b0%d0%b3%d0%b8%d1%80', 'RU', 1),
(899, 63, 'Ардон', '%d0%90%d1%80%d0%b4%d0%be%d0%bd', 'RU', 1),
(900, 63, 'Беслан', '%d0%91%d0%b5%d1%81%d0%bb%d0%b0%d0%bd', 'RU', 1),
(901, 63, 'Владикавказ', '%d0%92%d0%bb%d0%b0%d0%b4%d0%b8%d0%ba%d0%b0%d0%b2%d0%ba%d0%b0', 'RU', 1),
(902, 63, 'Дигора', '%d0%94%d0%b8%d0%b3%d0%be%d1%80%d0%b0', 'RU', 1),
(903, 63, 'Моздок', '%d0%9c%d0%be%d0%b7%d0%b4%d0%be%d0%ba', 'RU', 1),
(904, 64, 'Велиж', '%d0%92%d0%b5%d0%bb%d0%b8%d0%b6', 'RU', 1),
(905, 64, 'Вязьма', '%d0%92%d1%8f%d0%b7%d1%8c%d0%bc%d0%b0', 'RU', 1),
(906, 64, 'Гагарин', '%d0%93%d0%b0%d0%b3%d0%b0%d1%80%d0%b8%d0%bd', 'RU', 1),
(907, 64, 'Демидов', '%d0%94%d0%b5%d0%bc%d0%b8%d0%b4%d0%be%d0%b2', 'RU', 1),
(908, 64, 'Десногорск', '%d0%94%d0%b5%d1%81%d0%bd%d0%be%d0%b3%d0%be%d1%80%d1%81%d0%ba', 'RU', 1),
(909, 64, 'Дорогобуж', '%d0%94%d0%be%d1%80%d0%be%d0%b3%d0%be%d0%b1%d1%83%d0%b6', 'RU', 1),
(910, 64, 'Духовщина', '%d0%94%d1%83%d1%85%d0%be%d0%b2%d1%89%d0%b8%d0%bd%d0%b0', 'RU', 1),
(911, 64, 'Ельня', '%d0%95%d0%bb%d1%8c%d0%bd%d1%8f', 'RU', 1),
(912, 64, 'Починок', '%d0%9f%d0%be%d1%87%d0%b8%d0%bd%d0%be%d0%ba', 'RU', 1),
(913, 64, 'Рославль', '%d0%a0%d0%be%d1%81%d0%bb%d0%b0%d0%b2%d0%bb%d1%8c', 'RU', 1),
(914, 64, 'Рудня', '%d0%a0%d1%83%d0%b4%d0%bd%d1%8f', 'RU', 1),
(915, 64, 'Сафоново', '%d0%a1%d0%b0%d1%84%d0%be%d0%bd%d0%be%d0%b2%d0%be', 'RU', 1),
(916, 64, 'Смоленск', '%d0%a1%d0%bc%d0%be%d0%bb%d0%b5%d0%bd%d1%81%d0%ba', 'RU', 1),
(917, 64, 'Сычёвка', '%d0%a1%d1%8b%d1%87%d1%91%d0%b2%d0%ba%d0%b0', 'RU', 1),
(918, 64, 'Ярцево', '%d0%af%d1%80%d1%86%d0%b5%d0%b2%d0%be', 'RU', 1),
(919, 65, 'Благодарный', '%d0%91%d0%bb%d0%b0%d0%b3%d0%be%d0%b4%d0%b0%d1%80%d0%bd%d1%8b', 'RU', 1),
(920, 65, 'Будённовск', '%d0%91%d1%83%d0%b4%d1%91%d0%bd%d0%bd%d0%be%d0%b2%d1%81%d0%ba', 'RU', 1),
(921, 65, 'Георгиевск', '%d0%93%d0%b5%d0%be%d1%80%d0%b3%d0%b8%d0%b5%d0%b2%d1%81%d0%ba', 'RU', 1),
(922, 65, 'Ессентуки', '%d0%95%d1%81%d1%81%d0%b5%d0%bd%d1%82%d1%83%d0%ba%d0%b8', 'RU', 1),
(923, 65, 'Железноводск', '%d0%96%d0%b5%d0%bb%d0%b5%d0%b7%d0%bd%d0%be%d0%b2%d0%be%d0%b4', 'RU', 1),
(924, 65, 'Зеленокумск', '%d0%97%d0%b5%d0%bb%d0%b5%d0%bd%d0%be%d0%ba%d1%83%d0%bc%d1%81', 'RU', 1),
(925, 65, 'Изобильный', '%d0%98%d0%b7%d0%be%d0%b1%d0%b8%d0%bb%d1%8c%d0%bd%d1%8b%d0%b9', 'RU', 1),
(926, 65, 'Ипатово', '%d0%98%d0%bf%d0%b0%d1%82%d0%be%d0%b2%d0%be', 'RU', 1),
(927, 65, 'Кисловодск', '%d0%9a%d0%b8%d1%81%d0%bb%d0%be%d0%b2%d0%be%d0%b4%d1%81%d0%ba', 'RU', 1),
(928, 65, 'Лермонтов', '%d0%9b%d0%b5%d1%80%d0%bc%d0%be%d0%bd%d1%82%d0%be%d0%b2', 'RU', 1),
(929, 65, 'Минеральные Воды', '%d0%9c%d0%b8%d0%bd%d0%b5%d1%80%d0%b0%d0%bb%d1%8c%d0%bd%d1%8b', 'RU', 1),
(930, 65, 'Михайловск', '%d0%9c%d0%b8%d1%85%d0%b0%d0%b9%d0%bb%d0%be%d0%b2%d1%81%d0%ba', 'RU', 1),
(931, 65, 'Невинномысск', '%d0%9d%d0%b5%d0%b2%d0%b8%d0%bd%d0%bd%d0%be%d0%bc%d1%8b%d1%81', 'RU', 1),
(932, 65, 'Нефтекумск', '%d0%9d%d0%b5%d1%84%d1%82%d0%b5%d0%ba%d1%83%d0%bc%d1%81%d0%ba', 'RU', 1),
(933, 65, 'Новоалександровск', '%d0%9d%d0%be%d0%b2%d0%be%d0%b0%d0%bb%d0%b5%d0%ba%d1%81%d0%b0', 'RU', 1),
(934, 65, 'Новопавловск', '%d0%9d%d0%be%d0%b2%d0%be%d0%bf%d0%b0%d0%b2%d0%bb%d0%be%d0%b2', 'RU', 1),
(935, 65, 'Пятигорск', '%d0%9f%d1%8f%d1%82%d0%b8%d0%b3%d0%be%d1%80%d1%81%d0%ba', 'RU', 1),
(936, 65, 'Светлоград', '%d0%a1%d0%b2%d0%b5%d1%82%d0%bb%d0%be%d0%b3%d1%80%d0%b0%d0%b4', 'RU', 1),
(937, 65, 'Ставрополь', '%d0%a1%d1%82%d0%b0%d0%b2%d1%80%d0%be%d0%bf%d0%be%d0%bb%d1%8c', 'RU', 1),
(938, 66, 'Жердевка', '%d0%96%d0%b5%d1%80%d0%b4%d0%b5%d0%b2%d0%ba%d0%b0', 'RU', 1),
(939, 66, 'Кирсанов', '%d0%9a%d0%b8%d1%80%d1%81%d0%b0%d0%bd%d0%be%d0%b2', 'RU', 1),
(940, 66, 'Котовск', '%d0%9a%d0%be%d1%82%d0%be%d0%b2%d1%81%d0%ba', 'RU', 1),
(941, 66, 'Мичуринск', '%d0%9c%d0%b8%d1%87%d1%83%d1%80%d0%b8%d0%bd%d1%81%d0%ba', 'RU', 1),
(942, 66, 'Моршанск', '%d0%9c%d0%be%d1%80%d1%88%d0%b0%d0%bd%d1%81%d0%ba', 'RU', 1),
(943, 66, 'Рассказово', '%d0%a0%d0%b0%d1%81%d1%81%d0%ba%d0%b0%d0%b7%d0%be%d0%b2%d0%be', 'RU', 1),
(944, 66, 'Тамбов', '%d0%a2%d0%b0%d0%bc%d0%b1%d0%be%d0%b2', 'RU', 1),
(945, 66, 'Уварово', '%d0%a3%d0%b2%d0%b0%d1%80%d0%be%d0%b2%d0%be', 'RU', 1),
(946, 67, 'Агрыз', '%d0%90%d0%b3%d1%80%d1%8b%d0%b7', 'RU', 1),
(947, 67, 'Азнакаево', '%d0%90%d0%b7%d0%bd%d0%b0%d0%ba%d0%b0%d0%b5%d0%b2%d0%be', 'RU', 1),
(948, 67, 'Альметьевск', '%d0%90%d0%bb%d1%8c%d0%bc%d0%b5%d1%82%d1%8c%d0%b5%d0%b2%d1%81', 'RU', 1),
(949, 67, 'Арск', '%d0%90%d1%80%d1%81%d0%ba', 'RU', 1),
(950, 67, 'Бавлы', '%d0%91%d0%b0%d0%b2%d0%bb%d1%8b', 'RU', 1),
(951, 67, 'Болгар', '%d0%91%d0%be%d0%bb%d0%b3%d0%b0%d1%80', 'RU', 1),
(952, 67, 'Бугульма', '%d0%91%d1%83%d0%b3%d1%83%d0%bb%d1%8c%d0%bc%d0%b0', 'RU', 1),
(953, 67, 'Буинск', '%d0%91%d1%83%d0%b8%d0%bd%d1%81%d0%ba', 'RU', 1),
(954, 67, 'Елабуга', '%d0%95%d0%bb%d0%b0%d0%b1%d1%83%d0%b3%d0%b0', 'RU', 1),
(955, 67, 'Заинск', '%d0%97%d0%b0%d0%b8%d0%bd%d1%81%d0%ba', 'RU', 1),
(956, 67, 'Зеленодольск', '%d0%97%d0%b5%d0%bb%d0%b5%d0%bd%d0%be%d0%b4%d0%be%d0%bb%d1%8c', 'RU', 1),
(957, 67, 'Казань', '%d0%9a%d0%b0%d0%b7%d0%b0%d0%bd%d1%8c', 'RU', 1),
(958, 67, 'Лаишево', '%d0%9b%d0%b0%d0%b8%d1%88%d0%b5%d0%b2%d0%be', 'RU', 1),
(959, 67, 'Лениногорск', '%d0%9b%d0%b5%d0%bd%d0%b8%d0%bd%d0%be%d0%b3%d0%be%d1%80%d1%81', 'RU', 1),
(960, 67, 'Мамадыш', '%d0%9c%d0%b0%d0%bc%d0%b0%d0%b4%d1%8b%d1%88', 'RU', 1),
(961, 67, 'Менделеевск', '%d0%9c%d0%b5%d0%bd%d0%b4%d0%b5%d0%bb%d0%b5%d0%b5%d0%b2%d1%81', 'RU', 1),
(962, 67, 'Мензелинск', '%d0%9c%d0%b5%d0%bd%d0%b7%d0%b5%d0%bb%d0%b8%d0%bd%d1%81%d0%ba', 'RU', 1),
(963, 67, 'Набережные Челны', '%d0%9d%d0%b0%d0%b1%d0%b5%d1%80%d0%b5%d0%b6%d0%bd%d1%8b%d0%b5', 'RU', 1),
(964, 67, 'Нижнекамск', '%d0%9d%d0%b8%d0%b6%d0%bd%d0%b5%d0%ba%d0%b0%d0%bc%d1%81%d0%ba', 'RU', 1),
(965, 67, 'Нурлат', '%d0%9d%d1%83%d1%80%d0%bb%d0%b0%d1%82', 'RU', 1),
(966, 67, 'Тетюши', '%d0%a2%d0%b5%d1%82%d1%8e%d1%88%d0%b8', 'RU', 1),
(967, 67, 'Чистополь', '%d0%a7%d0%b8%d1%81%d1%82%d0%be%d0%bf%d0%be%d0%bb%d1%8c', 'RU', 1),
(968, 68, 'Андреаполь', '%d0%90%d0%bd%d0%b4%d1%80%d0%b5%d0%b0%d0%bf%d0%be%d0%bb%d1%8c', 'RU', 1),
(969, 68, 'Бежецк', '%d0%91%d0%b5%d0%b6%d0%b5%d1%86%d0%ba', 'RU', 1),
(970, 68, 'Белый', '%d0%91%d0%b5%d0%bb%d1%8b%d0%b9', 'RU', 1),
(971, 68, 'Бологое', '%d0%91%d0%be%d0%bb%d0%be%d0%b3%d0%be%d0%b5', 'RU', 1),
(972, 68, 'Весьегонск', '%d0%92%d0%b5%d1%81%d1%8c%d0%b5%d0%b3%d0%be%d0%bd%d1%81%d0%ba', 'RU', 1),
(973, 68, 'Вышний Волочёк', '%d0%92%d1%8b%d1%88%d0%bd%d0%b8%d0%b9-%d0%92%d0%be%d0%bb%d0%b', 'RU', 1),
(974, 68, 'Западная Двина', '%d0%97%d0%b0%d0%bf%d0%b0%d0%b4%d0%bd%d0%b0%d1%8f-%d0%94%d0%b', 'RU', 1),
(975, 68, 'Зубцов', '%d0%97%d1%83%d0%b1%d1%86%d0%be%d0%b2', 'RU', 1),
(976, 68, 'Калязин', '%d0%9a%d0%b0%d0%bb%d1%8f%d0%b7%d0%b8%d0%bd', 'RU', 1),
(977, 68, 'Кашин', '%d0%9a%d0%b0%d1%88%d0%b8%d0%bd', 'RU', 1),
(978, 68, 'Кимры', '%d0%9a%d0%b8%d0%bc%d1%80%d1%8b', 'RU', 1),
(979, 68, 'Конаково', '%d0%9a%d0%be%d0%bd%d0%b0%d0%ba%d0%be%d0%b2%d0%be', 'RU', 1),
(980, 68, 'Красный Холм', '%d0%9a%d1%80%d0%b0%d1%81%d0%bd%d1%8b%d0%b9-%d0%a5%d0%be%d0%b', 'RU', 1),
(981, 68, 'Кувшиново', '%d0%9a%d1%83%d0%b2%d1%88%d0%b8%d0%bd%d0%be%d0%b2%d0%be', 'RU', 1),
(982, 68, 'Лихославль', '%d0%9b%d0%b8%d1%85%d0%be%d1%81%d0%bb%d0%b0%d0%b2%d0%bb%d1%8c', 'RU', 1),
(983, 68, 'Нелидово', '%d0%9d%d0%b5%d0%bb%d0%b8%d0%b4%d0%be%d0%b2%d0%be', 'RU', 1),
(984, 68, 'Осташков', '%d0%9e%d1%81%d1%82%d0%b0%d1%88%d0%ba%d0%be%d0%b2', 'RU', 1),
(985, 68, 'Ржев', '%d0%a0%d0%b6%d0%b5%d0%b2', 'RU', 1),
(986, 68, 'Старица', '%d0%a1%d1%82%d0%b0%d1%80%d0%b8%d1%86%d0%b0', 'RU', 1),
(987, 68, 'Тверь', '%d0%a2%d0%b2%d0%b5%d1%80%d1%8c', 'RU', 1),
(988, 68, 'Торжок', '%d0%a2%d0%be%d1%80%d0%b6%d0%be%d0%ba', 'RU', 1),
(989, 68, 'Торопец', '%d0%a2%d0%be%d1%80%d0%be%d0%bf%d0%b5%d1%86', 'RU', 1),
(990, 68, 'Удомля', '%d0%a3%d0%b4%d0%be%d0%bc%d0%bb%d1%8f', 'RU', 1),
(992, 69, 'Асино', '%d0%90%d1%81%d0%b8%d0%bd%d0%be', 'RU', 1),
(993, 69, 'Колпашево', '%d0%9a%d0%be%d0%bb%d0%bf%d0%b0%d1%88%d0%b5%d0%b2%d0%be', 'RU', 1),
(994, 69, 'Кедровый', '%d0%9a%d0%b5%d0%b4%d1%80%d0%be%d0%b2%d1%8b%d0%b9', 'RU', 1),
(995, 69, 'Северск', '%d0%a1%d0%b5%d0%b2%d0%b5%d1%80%d1%81%d0%ba', 'RU', 1),
(996, 69, 'Стрежевой', '%d0%a1%d1%82%d1%80%d0%b5%d0%b6%d0%b5%d0%b2%d0%be%d0%b9', 'RU', 1),
(997, 69, 'Томск', '%d0%a2%d0%be%d0%bc%d1%81%d0%ba', 'RU', 1),
(998, 70, 'Алексин', '%d0%90%d0%bb%d0%b5%d0%ba%d1%81%d0%b8%d0%bd', 'RU', 1),
(999, 70, 'Белёв', '%d0%91%d0%b5%d0%bb%d1%91%d0%b2', 'RU', 1),
(1000, 70, 'Богородицк', '%d0%91%d0%be%d0%b3%d0%be%d1%80%d0%be%d0%b4%d0%b8%d1%86%d0%ba', 'RU', 1),
(1001, 70, 'Болохово', '%d0%91%d0%be%d0%bb%d0%be%d1%85%d0%be%d0%b2%d0%be', 'RU', 1),
(1002, 70, 'Венёв', '%d0%92%d0%b5%d0%bd%d1%91%d0%b2', 'RU', 1),
(1003, 70, 'Донской', '%d0%94%d0%be%d0%bd%d1%81%d0%ba%d0%be%d0%b9', 'RU', 1),
(1004, 70, 'Ефремов', '%d0%95%d1%84%d1%80%d0%b5%d0%bc%d0%be%d0%b2', 'RU', 1),
(1005, 70, 'Кимовск', '%d0%9a%d0%b8%d0%bc%d0%be%d0%b2%d1%81%d0%ba', 'RU', 1),
(1006, 70, 'Киреевск', '%d0%9a%d0%b8%d1%80%d0%b5%d0%b5%d0%b2%d1%81%d0%ba', 'RU', 1),
(1007, 70, 'Липки', '%d0%9b%d0%b8%d0%bf%d0%ba%d0%b8', 'RU', 1),
(1008, 70, 'Новомосковск', '%d0%9d%d0%be%d0%b2%d0%be%d0%bc%d0%be%d1%81%d0%ba%d0%be%d0%b2', 'RU', 1),
(1009, 70, 'Плавск', '%d0%9f%d0%bb%d0%b0%d0%b2%d1%81%d0%ba', 'RU', 1),
(1010, 70, 'Суворов', '%d0%a1%d1%83%d0%b2%d0%be%d1%80%d0%be%d0%b2', 'RU', 1),
(1011, 70, 'Тула', '%d0%a2%d1%83%d0%bb%d0%b0', 'RU', 1),
(1012, 70, 'Узловая', '%d0%a3%d0%b7%d0%bb%d0%be%d0%b2%d0%b0%d1%8f', 'RU', 1),
(1013, 70, 'Чекалин', '%d0%a7%d0%b5%d0%ba%d0%b0%d0%bb%d0%b8%d0%bd', 'RU', 1),
(1014, 70, 'Щёкино', '%d0%a9%d1%91%d0%ba%d0%b8%d0%bd%d0%be', 'RU', 1),
(1015, 70, 'Ясногорск', '%d0%af%d1%81%d0%bd%d0%be%d0%b3%d0%be%d1%80%d1%81%d0%ba', 'RU', 1),
(1016, 71, 'Ак-Довурак', '%d0%90%d0%ba-%d0%94%d0%be%d0%b2%d1%83%d1%80%d0%b0%d0%ba', 'RU', 1),
(1017, 71, 'Кызыл', '%d0%9a%d1%8b%d0%b7%d1%8b%d0%bb', 'RU', 1),
(1018, 71, 'Туран', '%d0%a2%d1%83%d1%80%d0%b0%d0%bd', 'RU', 1),
(1019, 71, 'Чадан', '%d0%a7%d0%b0%d0%b4%d0%b0%d0%bd', 'RU', 1),
(1020, 71, 'Шагонар', '%d0%a8%d0%b0%d0%b3%d0%be%d0%bd%d0%b0%d1%80', 'RU', 1),
(1021, 72, 'Заводоуковск', '%d0%97%d0%b0%d0%b2%d0%be%d0%b4%d0%be%d1%83%d0%ba%d0%be%d0%b2', 'RU', 1),
(1022, 72, 'Ишим', '%d0%98%d1%88%d0%b8%d0%bc', 'RU', 1),
(1023, 72, 'Тобольск', '%d0%a2%d0%be%d0%b1%d0%be%d0%bb%d1%8c%d1%81%d0%ba', 'RU', 1),
(1024, 72, 'Тюмень', '%d0%a2%d1%8e%d0%bc%d0%b5%d0%bd%d1%8c', 'RU', 1),
(1025, 72, 'Ялуторовск', '%d0%af%d0%bb%d1%83%d1%82%d0%be%d1%80%d0%be%d0%b2%d1%81%d0%ba', 'RU', 1),
(1026, 73, 'Воткинск', '%d0%92%d0%be%d1%82%d0%ba%d0%b8%d0%bd%d1%81%d0%ba', 'RU', 1),
(1027, 73, 'Глазов', '%d0%93%d0%bb%d0%b0%d0%b7%d0%be%d0%b2', 'RU', 1),
(1028, 73, 'Ижевск', '%d0%98%d0%b6%d0%b5%d0%b2%d1%81%d0%ba', 'RU', 1),
(1029, 73, 'Камбарка', '%d0%9a%d0%b0%d0%bc%d0%b1%d0%b0%d1%80%d0%ba%d0%b0', 'RU', 1),
(1030, 73, 'Можга', '%d0%9c%d0%be%d0%b6%d0%b3%d0%b0', 'RU', 1),
(1031, 73, 'Сарапул', '%d0%a1%d0%b0%d1%80%d0%b0%d0%bf%d1%83%d0%bb', 'RU', 1),
(1032, 74, 'Барыш', '%d0%91%d0%b0%d1%80%d1%8b%d1%88', 'RU', 1),
(1033, 74, 'Димитровград', '%d0%94%d0%b8%d0%bc%d0%b8%d1%82%d1%80%d0%be%d0%b2%d0%b3%d1%80', 'RU', 1),
(1034, 74, 'Инза', '%d0%98%d0%bd%d0%b7%d0%b0', 'RU', 1),
(1035, 74, 'Новоульяновск', '%d0%9d%d0%be%d0%b2%d0%be%d1%83%d0%bb%d1%8c%d1%8f%d0%bd%d0%be', 'RU', 1),
(1036, 74, 'Сенгилей', '%d0%a1%d0%b5%d0%bd%d0%b3%d0%b8%d0%bb%d0%b5%d0%b9', 'RU', 1),
(1037, 74, 'Ульяновск', '%d0%a3%d0%bb%d1%8c%d1%8f%d0%bd%d0%be%d0%b2%d1%81%d0%ba', 'RU', 1),
(1038, 75, 'Амурск', '%d0%90%d0%bc%d1%83%d1%80%d1%81%d0%ba', 'RU', 1),
(1039, 75, 'Бикин', '%d0%91%d0%b8%d0%ba%d0%b8%d0%bd', 'RU', 1),
(1040, 75, 'Вяземский', '%d0%92%d1%8f%d0%b7%d0%b5%d0%bc%d1%81%d0%ba%d0%b8%d0%b9', 'RU', 1),
(1041, 75, 'Комсомольск-на-Амуре', '%d0%9a%d0%be%d0%bc%d1%81%d0%be%d0%bc%d0%be%d0%bb%d1%8c%d1%81', 'RU', 1),
(1042, 75, 'Николаевск-на-Амуре', '%d0%9d%d0%b8%d0%ba%d0%be%d0%bb%d0%b0%d0%b5%d0%b2%d1%81%d0%ba', 'RU', 1),
(1043, 75, 'Советская Гавань', '%d0%a1%d0%be%d0%b2%d0%b5%d1%82%d1%81%d0%ba%d0%b0%d1%8f-%d0%9', 'RU', 1),
(1044, 75, 'Хабаровск', '%d0%a5%d0%b0%d0%b1%d0%b0%d1%80%d0%be%d0%b2%d1%81%d0%ba', 'RU', 1),
(1045, 76, 'Абаза', '%d0%90%d0%b1%d0%b0%d0%b7%d0%b0', 'RU', 1),
(1046, 76, 'Абакан', '%d0%90%d0%b1%d0%b0%d0%ba%d0%b0%d0%bd', 'RU', 1),
(1047, 76, 'Саяногорск', '%d0%a1%d0%b0%d1%8f%d0%bd%d0%be%d0%b3%d0%be%d1%80%d1%81%d0%ba', 'RU', 1),
(1048, 76, 'Сорск', '%d0%a1%d0%be%d1%80%d1%81%d0%ba', 'RU', 1),
(1049, 76, 'Черногорск', '%d0%a7%d0%b5%d1%80%d0%bd%d0%be%d0%b3%d0%be%d1%80%d1%81%d0%ba', 'RU', 1),
(1050, 77, 'Белоярский', '%d0%91%d0%b5%d0%bb%d0%be%d1%8f%d1%80%d1%81%d0%ba%d0%b8%d0%b9', 'RU', 1),
(1051, 77, 'Когалым', '%d0%9a%d0%be%d0%b3%d0%b0%d0%bb%d1%8b%d0%bc', 'RU', 1),
(1052, 77, 'Лангепас', '%d0%9b%d0%b0%d0%bd%d0%b3%d0%b5%d0%bf%d0%b0%d1%81', 'RU', 1),
(1053, 77, 'Лянтор', '%d0%9b%d1%8f%d0%bd%d1%82%d0%be%d1%80', 'RU', 1),
(1054, 77, 'Мегион', '%d0%9c%d0%b5%d0%b3%d0%b8%d0%be%d0%bd', 'RU', 1),
(1055, 77, 'Нефтеюганск', '%d0%9d%d0%b5%d1%84%d1%82%d0%b5%d1%8e%d0%b3%d0%b0%d0%bd%d1%81', 'RU', 1),
(1056, 77, 'Нижневартовск', '%d0%9d%d0%b8%d0%b6%d0%bd%d0%b5%d0%b2%d0%b0%d1%80%d1%82%d0%be', 'RU', 1),
(1057, 77, 'Нягань', '%d0%9d%d1%8f%d0%b3%d0%b0%d0%bd%d1%8c', 'RU', 1),
(1058, 77, 'Покачи', '%d0%9f%d0%be%d0%ba%d0%b0%d1%87%d0%b8', 'RU', 1),
(1059, 77, 'Пыть-Ях', '%d0%9f%d1%8b%d1%82%d1%8c-%d0%af%d1%85', 'RU', 1),
(1060, 77, 'Радужный', '%d0%a0%d0%b0%d0%b4%d1%83%d0%b6%d0%bd%d1%8b%d0%b9-1', 'RU', 1),
(1061, 77, 'Советский', '%d0%a1%d0%be%d0%b2%d0%b5%d1%82%d1%81%d0%ba%d0%b8%d0%b9', 'RU', 1),
(1062, 77, 'Сургут', '%d0%a1%d1%83%d1%80%d0%b3%d1%83%d1%82', 'RU', 1),
(1063, 77, 'Урай', '%d0%a3%d1%80%d0%b0%d0%b9', 'RU', 1),
(1064, 77, 'Ханты-Мансийск', '%d0%a5%d0%b0%d0%bd%d1%82%d1%8b-%d0%9c%d0%b0%d0%bd%d1%81%d0%b', 'RU', 1),
(1065, 77, 'Югорск', '%d0%ae%d0%b3%d0%be%d1%80%d1%81%d0%ba', 'RU', 1),
(1066, 78, 'Аша', '%d0%90%d1%88%d0%b0', 'RU', 1),
(1067, 78, 'Бакал', '%d0%91%d0%b0%d0%ba%d0%b0%d0%bb', 'RU', 1),
(1068, 78, 'Верхнеуральск', '%d0%92%d0%b5%d1%80%d1%85%d0%bd%d0%b5%d1%83%d1%80%d0%b0%d0%bb', 'RU', 1),
(1069, 78, 'Верхний Уфалей', '%d0%92%d0%b5%d1%80%d1%85%d0%bd%d0%b8%d0%b9-%d0%a3%d1%84%d0%b', 'RU', 1),
(1070, 78, 'Еманжелинск', '%d0%95%d0%bc%d0%b0%d0%bd%d0%b6%d0%b5%d0%bb%d0%b8%d0%bd%d1%81', 'RU', 1),
(1071, 78, 'Златоуст', '%d0%97%d0%bb%d0%b0%d1%82%d0%be%d1%83%d1%81%d1%82', 'RU', 1),
(1072, 78, 'Карабаш', '%d0%9a%d0%b0%d1%80%d0%b0%d0%b1%d0%b0%d1%88', 'RU', 1),
(1073, 78, 'Карталы', '%d0%9a%d0%b0%d1%80%d1%82%d0%b0%d0%bb%d1%8b', 'RU', 1),
(1074, 78, 'Касли', '%d0%9a%d0%b0%d1%81%d0%bb%d0%b8', 'RU', 1),
(1075, 78, 'Катав-Ивановск', '%d0%9a%d0%b0%d1%82%d0%b0%d0%b2-%d0%98%d0%b2%d0%b0%d0%bd%d0%b', 'RU', 1),
(1076, 78, 'Копейск', '%d0%9a%d0%be%d0%bf%d0%b5%d0%b9%d1%81%d0%ba', 'RU', 1),
(1077, 78, 'Коркино', '%d0%9a%d0%be%d1%80%d0%ba%d0%b8%d0%bd%d0%be', 'RU', 1),
(1078, 78, 'Куса', '%d0%9a%d1%83%d1%81%d0%b0', 'RU', 1),
(1079, 78, 'Кыштым', '%d0%9a%d1%8b%d1%88%d1%82%d1%8b%d0%bc', 'RU', 1),
(1080, 78, 'Магнитогорск', '%d0%9c%d0%b0%d0%b3%d0%bd%d0%b8%d1%82%d0%be%d0%b3%d0%be%d1%80', 'RU', 1),
(1081, 78, 'Миасс', '%d0%9c%d0%b8%d0%b0%d1%81%d1%81', 'RU', 1),
(1082, 78, 'Миньяр', '%d0%9c%d0%b8%d0%bd%d1%8c%d1%8f%d1%80', 'RU', 1),
(1083, 78, 'Нязепетровск', '%d0%9d%d1%8f%d0%b7%d0%b5%d0%bf%d0%b5%d1%82%d1%80%d0%be%d0%b2', 'RU', 1),
(1084, 78, 'Озёрск', '%d0%9e%d0%b7%d1%91%d1%80%d1%81%d0%ba-1', 'RU', 1),
(1085, 78, 'Пласт', '%d0%9f%d0%bb%d0%b0%d1%81%d1%82', 'RU', 1),
(1086, 78, 'Сатка', '%d0%a1%d0%b0%d1%82%d0%ba%d0%b0', 'RU', 1),
(1087, 78, 'Сим', '%d0%a1%d0%b8%d0%bc', 'RU', 1),
(1088, 78, 'Снежинск', '%d0%a1%d0%bd%d0%b5%d0%b6%d0%b8%d0%bd%d1%81%d0%ba', 'RU', 1),
(1089, 78, 'Трёхгорный', '%d0%a2%d1%80%d1%91%d1%85%d0%b3%d0%be%d1%80%d0%bd%d1%8b%d0%b9', 'RU', 1),
(1090, 78, 'Троицк', '%d0%a2%d1%80%d0%be%d0%b8%d1%86%d0%ba-1', 'RU', 1),
(1091, 78, 'Усть-Катав', '%d0%a3%d1%81%d1%82%d1%8c-%d0%9a%d0%b0%d1%82%d0%b0%d0%b2', 'RU', 1),
(1092, 78, 'Чебаркуль', '%d0%a7%d0%b5%d0%b1%d0%b0%d1%80%d0%ba%d1%83%d0%bb%d1%8c', 'RU', 1),
(1093, 78, 'Челябинск', '%d0%a7%d0%b5%d0%bb%d1%8f%d0%b1%d0%b8%d0%bd%d1%81%d0%ba', 'RU', 1),
(1094, 78, 'Южноуральск', '%d0%ae%d0%b6%d0%bd%d0%be%d1%83%d1%80%d0%b0%d0%bb%d1%8c%d1%81', 'RU', 1),
(1095, 78, 'Юрюзань', '%d0%ae%d1%80%d1%8e%d0%b7%d0%b0%d0%bd%d1%8c', 'RU', 1),
(1096, 79, 'Аргун', '%d0%90%d1%80%d0%b3%d1%83%d0%bd', 'RU', 1),
(1097, 79, 'Грозный', '%d0%93%d1%80%d0%be%d0%b7%d0%bd%d1%8b%d0%b9', 'RU', 1),
(1098, 79, 'Гудермес', '%d0%93%d1%83%d0%b4%d0%b5%d1%80%d0%bc%d0%b5%d1%81', 'RU', 1),
(1099, 79, 'Урус-Мартан', '%d0%a3%d1%80%d1%83%d1%81-%d0%9c%d0%b0%d1%80%d1%82%d0%b0%d0%b', 'RU', 1),
(1100, 79, 'Шали', '%d0%a8%d0%b0%d0%bb%d0%b8', 'RU', 1),
(1101, 80, 'Алатырь', '%d0%90%d0%bb%d0%b0%d1%82%d1%8b%d1%80%d1%8c', 'RU', 1),
(1102, 80, 'Канаш', '%d0%9a%d0%b0%d0%bd%d0%b0%d1%88', 'RU', 1),
(1103, 80, 'Козловка', '%d0%9a%d0%be%d0%b7%d0%bb%d0%be%d0%b2%d0%ba%d0%b0', 'RU', 1),
(1104, 80, 'Мариинский Посад', '%d0%9c%d0%b0%d1%80%d0%b8%d0%b8%d0%bd%d1%81%d0%ba%d0%b8%d0%b9', 'RU', 1),
(1105, 80, 'Новочебоксарск', '%d0%9d%d0%be%d0%b2%d0%be%d1%87%d0%b5%d0%b1%d0%be%d0%ba%d1%81', 'RU', 1),
(1106, 80, 'Цивильск', '%d0%a6%d0%b8%d0%b2%d0%b8%d0%bb%d1%8c%d1%81%d0%ba', 'RU', 1),
(1107, 80, 'Чебоксары', '%d0%a7%d0%b5%d0%b1%d0%be%d0%ba%d1%81%d0%b0%d1%80%d1%8b', 'RU', 1),
(1108, 80, 'Шумерля', '%d0%a8%d1%83%d0%bc%d0%b5%d1%80%d0%bb%d1%8f', 'RU', 1),
(1109, 80, 'Ядрин', '%d0%af%d0%b4%d1%80%d0%b8%d0%bd', 'RU', 1),
(1110, 81, 'Анадырь', '%d0%90%d0%bd%d0%b0%d0%b4%d1%8b%d1%80%d1%8c', 'RU', 1),
(1111, 81, 'Билибино', '%d0%91%d0%b8%d0%bb%d0%b8%d0%b1%d0%b8%d0%bd%d0%be', 'RU', 1),
(1112, 81, 'Певек', '%d0%9f%d0%b5%d0%b2%d0%b5%d0%ba', 'RU', 1),
(1113, 82, 'Алдан', '%d0%90%d0%bb%d0%b4%d0%b0%d0%bd', 'RU', 1),
(1114, 82, 'Верхоянск', '%d0%92%d0%b5%d1%80%d1%85%d0%be%d1%8f%d0%bd%d1%81%d0%ba', 'RU', 1),
(1115, 82, 'Вилюйск', '%d0%92%d0%b8%d0%bb%d1%8e%d0%b9%d1%81%d0%ba', 'RU', 1),
(1116, 82, 'Ленск', '%d0%9b%d0%b5%d0%bd%d1%81%d0%ba', 'RU', 1),
(1117, 82, 'Мирный', '%d0%9c%d0%b8%d1%80%d0%bd%d1%8b%d0%b9-1', 'RU', 1),
(1118, 82, 'Нерюнгри', '%d0%9d%d0%b5%d1%80%d1%8e%d0%bd%d0%b3%d1%80%d0%b8', 'RU', 1),
(1119, 82, 'Нюрба', '%d0%9d%d1%8e%d1%80%d0%b1%d0%b0', 'RU', 1),
(1120, 82, 'Олёкминск', '%d0%9e%d0%bb%d1%91%d0%ba%d0%bc%d0%b8%d0%bd%d1%81%d0%ba', 'RU', 1),
(1121, 82, 'Покровск', '%d0%9f%d0%be%d0%ba%d1%80%d0%be%d0%b2%d1%81%d0%ba', 'RU', 1),
(1122, 82, 'Среднеколымск', '%d0%a1%d1%80%d0%b5%d0%b4%d0%bd%d0%b5%d0%ba%d0%be%d0%bb%d1%8b', 'RU', 1),
(1123, 82, 'Томмот', '%d0%a2%d0%be%d0%bc%d0%bc%d0%be%d1%82', 'RU', 1),
(1124, 82, 'Удачный', '%d0%a3%d0%b4%d0%b0%d1%87%d0%bd%d1%8b%d0%b9', 'RU', 1),
(1125, 82, 'Якутск', '%d0%af%d0%ba%d1%83%d1%82%d1%81%d0%ba', 'RU', 1),
(1126, 83, 'Губкинский', '%d0%93%d1%83%d0%b1%d0%ba%d0%b8%d0%bd%d1%81%d0%ba%d0%b8%d0%b9', 'RU', 1),
(1127, 83, 'Лабытнанги', '%d0%9b%d0%b0%d0%b1%d1%8b%d1%82%d0%bd%d0%b0%d0%bd%d0%b3%d0%b8', 'RU', 1),
(1128, 83, 'Муравленко', '%d0%9c%d1%83%d1%80%d0%b0%d0%b2%d0%bb%d0%b5%d0%bd%d0%ba%d0%be', 'RU', 1),
(1129, 83, 'Надым', '%d0%9d%d0%b0%d0%b4%d1%8b%d0%bc', 'RU', 1),
(1130, 83, 'Новый Уренгой', '%d0%9d%d0%be%d0%b2%d1%8b%d0%b9-%d0%a3%d1%80%d0%b5%d0%bd%d0%b', 'RU', 1),
(1131, 83, 'Ноябрьск', '%d0%9d%d0%be%d1%8f%d0%b1%d1%80%d1%8c%d1%81%d0%ba', 'RU', 1),
(1132, 83, 'Салехард', '%d0%a1%d0%b0%d0%bb%d0%b5%d1%85%d0%b0%d1%80%d0%b4', 'RU', 1),
(1133, 83, 'Тарко-Сале', '%d0%a2%d0%b0%d1%80%d0%ba%d0%be-%d0%a1%d0%b0%d0%bb%d0%b5', 'RU', 1),
(1135, 84, 'Гаврилов-Ям', '%d0%93%d0%b0%d0%b2%d1%80%d0%b8%d0%bb%d0%be%d0%b2-%d0%af%d0%b', 'RU', 1),
(1136, 84, 'Любим', '%d0%9b%d1%8e%d0%b1%d0%b8%d0%bc', 'RU', 1),
(1137, 84, 'Мышкин', '%d0%9c%d1%8b%d1%88%d0%ba%d0%b8%d0%bd', 'RU', 1),
(1138, 84, 'Переславль-Залесский', '%d0%9f%d0%b5%d1%80%d0%b5%d1%81%d0%bb%d0%b0%d0%b2%d0%bb%d1%8c', 'RU', 1),
(1139, 84, 'Пошехонье', '%d0%9f%d0%be%d1%88%d0%b5%d1%85%d0%be%d0%bd%d1%8c%d0%b5', 'RU', 1),
(1140, 84, 'Ростов', '%d0%a0%d0%be%d1%81%d1%82%d0%be%d0%b2', 'RU', 1),
(1141, 84, 'Рыбинск', '%d0%a0%d1%8b%d0%b1%d0%b8%d0%bd%d1%81%d0%ba', 'RU', 1),
(1142, 84, 'Тутаев', '%d0%a2%d1%83%d1%82%d0%b0%d0%b5%d0%b2', 'RU', 1),
(1143, 84, 'Углич', '%d0%a3%d0%b3%d0%bb%d0%b8%d1%87', 'RU', 1),
(1144, 84, 'Ярославль', '%d0%af%d1%80%d0%be%d1%81%d0%bb%d0%b0%d0%b2%d0%bb%d1%8c', 'RU', 1),
(1145, 87, 'Винница', '%d0%92%d0%b8%d0%bd%d0%bd%d0%b8%d1%86%d0%b0', 'UA', 1),
(1146, 87, 'Ладыжин', '%d0%9b%d0%b0%d0%b4%d1%8b%d0%b6%d0%b8%d0%bd', 'UA', 1),
(1147, 87, 'Балановка', '%d0%91%d0%b0%d0%bb%d0%b0%d0%bd%d0%be%d0%b2%d0%ba%d0%b0', 'UA', 1),
(1148, 88, 'Луцк', '%d0%9b%d1%83%d1%86%d0%ba', 'UA', 1),
(1149, 88, 'Владимир-Волынский', '%d0%92%d0%bb%d0%b0%d0%b4%d0%b8%d0%bc%d0%b8%d1%80-%d0%92%d0%b', 'UA', 1),
(1150, 88, 'Ковель', '%d0%9a%d0%be%d0%b2%d0%b5%d0%bb%d1%8c', 'UA', 1),
(1151, 88, 'Нововолынск', '%d0%9d%d0%be%d0%b2%d0%be%d0%b2%d0%be%d0%bb%d1%8b%d0%bd%d1%81', 'UA', 1),
(1152, 89, 'Днепропетровск', '%d0%94%d0%bd%d0%b5%d0%bf%d1%80%d0%be%d0%bf%d0%b5%d1%82%d1%80', 'UA', 1),
(1153, 89, 'Булаховка', '%d0%91%d1%83%d0%bb%d0%b0%d1%85%d0%be%d0%b2%d0%ba%d0%b0', 'UA', 1),
(1154, 89, 'Вовниги', '%d0%92%d0%be%d0%b2%d0%bd%d0%b8%d0%b3%d0%b8', 'UA', 1),
(1155, 89, 'Днепродзержинск', '%d0%94%d0%bd%d0%b5%d0%bf%d1%80%d0%be%d0%b4%d0%b7%d0%b5%d1%80', 'UA', 1),
(1156, 89, 'Жёлтые Воды', '%d0%96%d1%91%d0%bb%d1%82%d1%8b%d0%b5-%d0%92%d0%be%d0%b4%d1%8', 'UA', 1),
(1157, 89, 'Зеленодольск', '%d0%97%d0%b5%d0%bb%d0%b5%d0%bd%d0%be%d0%b4%d0%be%d0%bb%d1%8c', 'UA', 1),
(1158, 89, 'Каменно-Зубиловка', '%d0%9a%d0%b0%d0%bc%d0%b5%d0%bd%d0%bd%d0%be-%d0%97%d1%83%d0%b', 'UA', 1),
(1159, 89, 'Кривой Рог', '%d0%9a%d1%80%d0%b8%d0%b2%d0%be%d0%b9-%d0%a0%d0%be%d0%b3', 'UA', 1),
(1160, 89, 'Кринички', '%d0%9a%d1%80%d0%b8%d0%bd%d0%b8%d1%87%d0%ba%d0%b8', 'UA', 1),
(1161, 89, 'Марганец', '%d0%9c%d0%b0%d1%80%d0%b3%d0%b0%d0%bd%d0%b5%d1%86', 'UA', 1),
(1162, 89, 'Никополь', '%d0%9d%d0%b8%d0%ba%d0%be%d0%bf%d0%be%d0%bb%d1%8c', 'UA', 1),
(1163, 89, 'Новомосковск', '%d0%9d%d0%be%d0%b2%d0%be%d0%bc%d0%be%d1%81%d0%ba%d0%be%d0%b2', 'UA', 1),
(1164, 89, 'Павлоград', '%d0%9f%d0%b0%d0%b2%d0%bb%d0%be%d0%b3%d1%80%d0%b0%d0%b4', 'UA', 1),
(1165, 90, 'Донецк', '%d0%94%d0%be%d0%bd%d0%b5%d1%86%d0%ba-1', 'UA', 1),
(1166, 90, 'Авдеевка', '%d0%90%d0%b2%d0%b4%d0%b5%d0%b5%d0%b2%d0%ba%d0%b0', 'UA', 1),
(1167, 90, 'Андреевка', '%d0%90%d0%bd%d0%b4%d1%80%d0%b5%d0%b5%d0%b2%d0%ba%d0%b0', 'UA', 1),
(1168, 90, 'Артёмовск', '%d0%90%d1%80%d1%82%d1%91%d0%bc%d0%be%d0%b2%d1%81%d0%ba-1', 'UA', 1),
(1169, 90, 'Безимянное', '%d0%91%d0%b5%d0%b7%d0%b8%d0%bc%d1%8f%d0%bd%d0%bd%d0%be%d0%b5', 'UA', 1),
(1170, 90, 'Белосарайская Коса', '%d0%91%d0%b5%d0%bb%d0%be%d1%81%d0%b0%d1%80%d0%b0%d0%b9%d1%81', 'UA', 1),
(1171, 90, 'Бересток', '%d0%91%d0%b5%d1%80%d0%b5%d1%81%d1%82%d0%be%d0%ba', 'UA', 1),
(1172, 90, 'Волноваха', '%d0%92%d0%be%d0%bb%d0%bd%d0%be%d0%b2%d0%b0%d1%85%d0%b0', 'UA', 1),
(1173, 90, 'Горловка', '%d0%93%d0%be%d1%80%d0%bb%d0%be%d0%b2%d0%ba%d0%b0', 'UA', 1),
(1174, 90, 'Енакиево', '%d0%95%d0%bd%d0%b0%d0%ba%d0%b8%d0%b5%d0%b2%d0%be', 'UA', 1),
(1175, 90, 'Зугрес', '%d0%97%d1%83%d0%b3%d1%80%d0%b5%d1%81', 'UA', 1),
(1176, 90, 'Константиновка', '%d0%9a%d0%be%d0%bd%d1%81%d1%82%d0%b0%d0%bd%d1%82%d0%b8%d0%bd', 'UA', 1),
(1177, 90, 'Краматорск', '%d0%9a%d1%80%d0%b0%d0%bc%d0%b0%d1%82%d0%be%d1%80%d1%81%d0%ba', 'UA', 1),
(1178, 90, 'Красноармейск', '%d0%9a%d1%80%d0%b0%d1%81%d0%bd%d0%be%d0%b0%d1%80%d0%bc%d0%b5', 'UA', 1),
(1179, 90, 'Курахово', '%d0%9a%d1%83%d1%80%d0%b0%d1%85%d0%be%d0%b2%d0%be', 'UA', 1),
(1180, 90, 'Макеевка', '%d0%9c%d0%b0%d0%ba%d0%b5%d0%b5%d0%b2%d0%ba%d0%b0', 'UA', 1),
(1181, 90, 'Мариуполь', '%d0%9c%d0%b0%d1%80%d0%b8%d1%83%d0%bf%d0%be%d0%bb%d1%8c', 'UA', 1),
(1182, 90, 'Николаевка', '%d0%9d%d0%b8%d0%ba%d0%be%d0%bb%d0%b0%d0%b5%d0%b2%d0%ba%d0%b0', 'UA', 1),
(1183, 90, 'Райгородок', '%d0%a0%d0%b0%d0%b9%d0%b3%d0%be%d1%80%d0%be%d0%b4%d0%be%d0%ba', 'UA', 1),
(1184, 90, 'Светлодарск', '%d0%a1%d0%b2%d0%b5%d1%82%d0%bb%d0%be%d0%b4%d0%b0%d1%80%d1%81', 'UA', 1),
(1185, 90, 'Святогорск', '%d0%a1%d0%b2%d1%8f%d1%82%d0%be%d0%b3%d0%be%d1%80%d1%81%d0%ba', 'UA', 1),
(1186, 90, 'Славянск', '%d0%a1%d0%bb%d0%b0%d0%b2%d1%8f%d0%bd%d1%81%d0%ba', 'UA', 1),
(1187, 90, 'Снежное', '%d0%a1%d0%bd%d0%b5%d0%b6%d0%bd%d0%be%d0%b5', 'UA', 1),
(1188, 90, 'Торез', '%d0%a2%d0%be%d1%80%d0%b5%d0%b7', 'UA', 1),
(1189, 90, 'Шахтёрск', '%d0%a8%d0%b0%d1%85%d1%82%d1%91%d1%80%d1%81%d0%ba-1', 'UA', 1),
(1190, 91, 'Житомир', '%d0%96%d0%b8%d1%82%d0%be%d0%bc%d0%b8%d1%80', 'UA', 1),
(1191, 91, 'Андреевка', '%d0%90%d0%bd%d0%b4%d1%80%d0%b5%d0%b5%d0%b2%d0%ba%d0%b0-1', 'UA', 1),
(1192, 91, 'Бердичев', '%d0%91%d0%b5%d1%80%d0%b4%d0%b8%d1%87%d0%b5%d0%b2', 'UA', 1),
(1193, 91, 'Коростень', '%d0%9a%d0%be%d1%80%d0%be%d1%81%d1%82%d0%b5%d0%bd%d1%8c', 'UA', 1),
(1194, 91, 'Новоград-Волынский', '%d0%9d%d0%be%d0%b2%d0%be%d0%b3%d1%80%d0%b0%d0%b4-%d0%92%d0%b', 'UA', 1),
(1195, 91, 'Олевск', '%d0%9e%d0%bb%d0%b5%d0%b2%d1%81%d0%ba', 'UA', 1),
(1196, 92, 'Ужгород', '%d0%a3%d0%b6%d0%b3%d0%be%d1%80%d0%be%d0%b4', 'UA', 1),
(1197, 92, 'Берегово', '%d0%91%d0%b5%d1%80%d0%b5%d0%b3%d0%be%d0%b2%d0%be', 'UA', 1),
(1198, 92, 'Виноградов', '%d0%92%d0%b8%d0%bd%d0%be%d0%b3%d1%80%d0%b0%d0%b4%d0%be%d0%b2', 'UA', 1),
(1199, 92, 'Иршава', '%d0%98%d1%80%d1%88%d0%b0%d0%b2%d0%b0', 'UA', 1),
(1200, 92, 'Мукачево', '%d0%9c%d1%83%d0%ba%d0%b0%d1%87%d0%b5%d0%b2%d0%be', 'UA', 1),
(1201, 92, 'Рахов', '%d0%a0%d0%b0%d1%85%d0%be%d0%b2', 'UA', 1),
(1202, 92, 'Свалява', '%d0%a1%d0%b2%d0%b0%d0%bb%d1%8f%d0%b2%d0%b0', 'UA', 1),
(1203, 92, 'Тячев', '%d0%a2%d1%8f%d1%87%d0%b5%d0%b2', 'UA', 1),
(1204, 92, 'Хуст', '%d0%a5%d1%83%d1%81%d1%82', 'UA', 1),
(1205, 93, 'Запорожье', '%d0%97%d0%b0%d0%bf%d0%be%d1%80%d0%be%d0%b6%d1%8c%d0%b5', 'UA', 1),
(1206, 93, 'Бердянск', '%d0%91%d0%b5%d1%80%d0%b4%d1%8f%d0%bd%d1%81%d0%ba', 'UA', 1),
(1207, 93, 'Днепрорудное', '%d0%94%d0%bd%d0%b5%d0%bf%d1%80%d0%be%d1%80%d1%83%d0%b4%d0%bd', 'UA', 1),
(1208, 93, 'Камыш-Заря', '%d0%9a%d0%b0%d0%bc%d1%8b%d1%88-%d0%97%d0%b0%d1%80%d1%8f', 'UA', 1),
(1209, 93, 'Мелитополь', '%d0%9c%d0%b5%d0%bb%d0%b8%d1%82%d0%be%d0%bf%d0%be%d0%bb%d1%8c', 'UA', 1),
(1210, 93, 'Токмак', '%d0%a2%d0%be%d0%ba%d0%bc%d0%b0%d0%ba', 'UA', 1),
(1211, 93, 'Орловское', '%d0%9e%d1%80%d0%bb%d0%be%d0%b2%d1%81%d0%ba%d0%be%d0%b5', 'UA', 1),
(1212, 93, 'Приморский Посад', '%d0%9f%d1%80%d0%b8%d0%bc%d0%be%d1%80%d1%81%d0%ba%d0%b8%d0%b9', 'UA', 1),
(1213, 93, 'Энергодар', '%d0%ad%d0%bd%d0%b5%d1%80%d0%b3%d0%be%d0%b4%d0%b0%d1%80', 'UA', 1),
(1214, 94, 'Ивано-Франковск', '%d0%98%d0%b2%d0%b0%d0%bd%d0%be-%d0%a4%d1%80%d0%b0%d0%bd%d0%b', 'UA', 1),
(1215, 94, 'Бурштын', '%d0%91%d1%83%d1%80%d1%88%d1%82%d1%8b%d0%bd', 'UA', 1),
(1216, 94, 'Калуш', '%d0%9a%d0%b0%d0%bb%d1%83%d1%88', 'UA', 1),
(1217, 94, 'Коломыя', '%d0%9a%d0%be%d0%bb%d0%be%d0%bc%d1%8b%d1%8f', 'UA', 1),
(1218, 86, 'Киев', '%d0%9a%d0%b8%d0%b5%d0%b2', 'UA', 1),
(1219, 95, 'Белая Церковь', '%d0%91%d0%b5%d0%bb%d0%b0%d1%8f-%d0%a6%d0%b5%d1%80%d0%ba%d0%b', 'UA', 1),
(1220, 95, 'Борисполь', '%d0%91%d0%be%d1%80%d0%b8%d1%81%d0%bf%d0%be%d0%bb%d1%8c', 'UA', 1),
(1221, 95, 'Бровары', '%d0%91%d1%80%d0%be%d0%b2%d0%b0%d1%80%d1%8b', 'UA', 1),
(1222, 95, 'Вышгород', '%d0%92%d1%8b%d1%88%d0%b3%d0%be%d1%80%d0%be%d0%b4', 'UA', 1),
(1223, 95, 'Ирпень', '%d0%98%d1%80%d0%bf%d0%b5%d0%bd%d1%8c', 'UA', 1),
(1224, 95, 'Коцюбинское', '%d0%9a%d0%be%d1%86%d1%8e%d0%b1%d0%b8%d0%bd%d1%81%d0%ba%d0%be', 'UA', 1),
(1225, 95, 'Петропавловская ', '%d0%9f%d0%b5%d1%82%d1%80%d0%be%d0%bf%d0%b0%d0%b2%d0%bb%d0%be', 'UA', 1),
(1226, 95, 'Борщаговка', '%d0%91%d0%be%d1%80%d1%89%d0%b0%d0%b3%d0%be%d0%b2%d0%ba%d0%b0', 'UA', 1),
(1227, 95, 'Припять', '%d0%9f%d1%80%d0%b8%d0%bf%d1%8f%d1%82%d1%8c', 'UA', 1),
(1228, 95, 'Украинка', '%d0%a3%d0%ba%d1%80%d0%b0%d0%b8%d0%bd%d0%ba%d0%b0', 'UA', 1),
(1229, 96, 'Кировоград', '%d0%9a%d0%b8%d1%80%d0%be%d0%b2%d0%be%d0%b3%d1%80%d0%b0%d0%b4', 'UA', 1),
(1230, 96, 'Александрия', '%d0%90%d0%bb%d0%b5%d0%ba%d1%81%d0%b0%d0%bd%d0%b4%d1%80%d0%b8', 'UA', 1),
(1231, 97, 'Луганск', '%d0%9b%d1%83%d0%b3%d0%b0%d0%bd%d1%81%d0%ba', 'UA', 1),
(1232, 97, 'Алчевск', '%d0%90%d0%bb%d1%87%d0%b5%d0%b2%d1%81%d0%ba', 'UA', 1),
(1233, 97, 'Антрацит', '%d0%90%d0%bd%d1%82%d1%80%d0%b0%d1%86%d0%b8%d1%82', 'UA', 1),
(1234, 97, 'Белолуцк', '%d0%91%d0%b5%d0%bb%d0%be%d0%bb%d1%83%d1%86%d0%ba', 'UA', 1),
(1235, 97, 'Верхнешевыревка', '%d0%92%d0%b5%d1%80%d1%85%d0%bd%d0%b5%d1%88%d0%b5%d0%b2%d1%8b', 'UA', 1),
(1236, 97, 'Ирмино', '%d0%98%d1%80%d0%bc%d0%b8%d0%bd%d0%be', 'UA', 1),
(1237, 97, 'Краснодон', '%d0%9a%d1%80%d0%b0%d1%81%d0%bd%d0%be%d0%b4%d0%be%d0%bd', 'UA', 1),
(1238, 97, 'Красный Луч', '%d0%9a%d1%80%d0%b0%d1%81%d0%bd%d1%8b%d0%b9-%d0%9b%d1%83%d1%8', 'UA', 1),
(1239, 97, 'Лисичанск', '%d0%9b%d0%b8%d1%81%d0%b8%d1%87%d0%b0%d0%bd%d1%81%d0%ba', 'UA', 1),
(1240, 97, 'Ровеньки', '%d0%a0%d0%be%d0%b2%d0%b5%d0%bd%d1%8c%d0%ba%d0%b8', 'UA', 1),
(1241, 97, 'Рубежное', '%d0%a0%d1%83%d0%b1%d0%b5%d0%b6%d0%bd%d0%be%d0%b5', 'UA', 1),
(1242, 97, 'Свердловск', '%d0%a1%d0%b2%d0%b5%d1%80%d0%b4%d0%bb%d0%be%d0%b2%d1%81%d0%ba', 'UA', 1),
(1243, 97, 'Северодонецк', '%d0%a1%d0%b5%d0%b2%d0%b5%d1%80%d0%be%d0%b4%d0%be%d0%bd%d0%b5', 'UA', 1),
(1244, 97, 'Старобельск', '%d0%a1%d1%82%d0%b0%d1%80%d0%be%d0%b1%d0%b5%d0%bb%d1%8c%d1%81', 'UA', 1),
(1245, 97, 'Стаханов', '%d0%a1%d1%82%d0%b0%d1%85%d0%b0%d0%bd%d0%be%d0%b2', 'UA', 1),
(1246, 97, 'Счастье', '%d0%a1%d1%87%d0%b0%d1%81%d1%82%d1%8c%d0%b5', 'UA', 1),
(1247, 97, 'Чернухино', '%d0%a7%d0%b5%d1%80%d0%bd%d1%83%d1%85%d0%b8%d0%bd%d0%be', 'UA', 1),
(1248, 98, 'Львов', '%d0%9b%d1%8c%d0%b2%d0%be%d0%b2', 'UA', 1),
(1249, 98, 'Дрогобыч', '%d0%94%d1%80%d0%be%d0%b3%d0%be%d0%b1%d1%8b%d1%87', 'UA', 1),
(1250, 98, 'Красное', '%d0%9a%d1%80%d0%b0%d1%81%d0%bd%d0%be%d0%b5', 'UA', 1),
(1252, 98, 'Трускавец', '%d0%a2%d1%80%d1%83%d1%81%d0%ba%d0%b0%d0%b2%d0%b5%d1%86', 'UA', 1),
(1253, 98, 'Червоноград', '%d0%a7%d0%b5%d1%80%d0%b2%d0%be%d0%bd%d0%be%d0%b3%d1%80%d0%b0', 'UA', 1),
(1254, 99, 'Николаев', '%d0%9d%d0%b8%d0%ba%d0%be%d0%bb%d0%b0%d0%b5%d0%b2', 'UA', 1),
(1255, 99, 'Вознесенск', '%d0%92%d0%be%d0%b7%d0%bd%d0%b5%d1%81%d0%b5%d0%bd%d1%81%d0%ba', 'UA', 1),
(1256, 99, 'Дмитровка', '%d0%94%d0%bc%d0%b8%d1%82%d1%80%d0%be%d0%b2%d0%ba%d0%b0', 'UA', 1),
(1257, 99, 'Луч', '%d0%9b%d1%83%d1%87', 'UA', 1),
(1258, 99, 'Очаков', '%d0%9e%d1%87%d0%b0%d0%ba%d0%be%d0%b2', 'UA', 1),
(1259, 99, 'Первомайск', '%d0%9f%d0%b5%d1%80%d0%b2%d0%be%d0%bc%d0%b0%d0%b9%d1%81%d0%ba', 'UA', 1);
INSERT INTO `oc_t_city` (`pk_i_id`, `fk_i_region_id`, `s_name`, `s_slug`, `fk_c_country_code`, `b_active`) VALUES
(1260, 99, 'Тузлы', '%d0%a2%d1%83%d0%b7%d0%bb%d1%8b', 'UA', 1),
(1261, 99, 'Южноукраинск', '%d0%ae%d0%b6%d0%bd%d0%be%d1%83%d0%ba%d1%80%d0%b0%d0%b8%d0%bd', 'UA', 1),
(1262, 100, 'Одесса', '%d0%9e%d0%b4%d0%b5%d1%81%d1%81%d0%b0', 'UA', 1),
(1263, 100, 'Белгород-Днестровский', '%d0%91%d0%b5%d0%bb%d0%b3%d0%be%d1%80%d0%be%d0%b4-%d0%94%d0%b', 'UA', 1),
(1264, 100, 'Вестерничаны', '%d0%92%d0%b5%d1%81%d1%82%d0%b5%d1%80%d0%bd%d0%b8%d1%87%d0%b0', 'UA', 1),
(1265, 100, 'Жовтень', '%d0%96%d0%be%d0%b2%d1%82%d0%b5%d0%bd%d1%8c', 'UA', 1),
(1266, 100, 'Измаил', '%d0%98%d0%b7%d0%bc%d0%b0%d0%b8%d0%bb', 'UA', 1),
(1267, 100, 'Ильичевск', '%d0%98%d0%bb%d1%8c%d0%b8%d1%87%d0%b5%d0%b2%d1%81%d0%ba', 'UA', 1),
(1268, 100, 'Каменское', '%d0%9a%d0%b0%d0%bc%d0%b5%d0%bd%d1%81%d0%ba%d0%be%d0%b5', 'UA', 1),
(1269, 100, 'Ковалёвка', '%d0%9a%d0%be%d0%b2%d0%b0%d0%bb%d1%91%d0%b2%d0%ba%d0%b0', 'UA', 1),
(1270, 100, 'Новокубанка', '%d0%9d%d0%be%d0%b2%d0%be%d0%ba%d1%83%d0%b1%d0%b0%d0%bd%d0%ba', 'UA', 1),
(1271, 100, 'Орловка', '%d0%9e%d1%80%d0%bb%d0%be%d0%b2%d0%ba%d0%b0', 'UA', 1),
(1272, 100, 'Петровка', '%d0%9f%d0%b5%d1%82%d1%80%d0%be%d0%b2%d0%ba%d0%b0', 'UA', 1),
(1273, 100, 'Южный', '%d0%ae%d0%b6%d0%bd%d1%8b%d0%b9', 'UA', 1),
(1274, 101, 'Полтава', '%d0%9f%d0%be%d0%bb%d1%82%d0%b0%d0%b2%d0%b0', 'UA', 1),
(1275, 101, 'Красногоровка', '%d0%9a%d1%80%d0%b0%d1%81%d0%bd%d0%be%d0%b3%d0%be%d1%80%d0%be', 'UA', 1),
(1276, 101, 'Кременчуг', '%d0%9a%d1%80%d0%b5%d0%bc%d0%b5%d0%bd%d1%87%d1%83%d0%b3', 'UA', 1),
(1277, 101, 'Лубны', '%d0%9b%d1%83%d0%b1%d0%bd%d1%8b', 'UA', 1),
(1278, 102, 'Ровно', '%d0%a0%d0%be%d0%b2%d0%bd%d0%be', 'UA', 1),
(1279, 102, 'Антополь', '%d0%90%d0%bd%d1%82%d0%be%d0%bf%d0%be%d0%bb%d1%8c', 'UA', 1),
(1280, 102, 'Кузнецовск', '%d0%9a%d1%83%d0%b7%d0%bd%d0%b5%d1%86%d0%be%d0%b2%d1%81%d0%ba', 'UA', 1),
(1281, 103, 'Сумы', '%d0%a1%d1%83%d0%bc%d1%8b', 'UA', 1),
(1282, 103, 'Ахтырка', '%d0%90%d1%85%d1%82%d1%8b%d1%80%d0%ba%d0%b0', 'UA', 1),
(1283, 103, 'Белополье', '%d0%91%d0%b5%d0%bb%d0%be%d0%bf%d0%be%d0%bb%d1%8c%d0%b5', 'UA', 1),
(1284, 103, 'Конотоп', '%d0%9a%d0%be%d0%bd%d0%be%d1%82%d0%be%d0%bf', 'UA', 1),
(1285, 103, 'Кролевец', '%d0%9a%d1%80%d0%be%d0%bb%d0%b5%d0%b2%d0%b5%d1%86', 'UA', 1),
(1286, 103, 'Ромны', '%d0%a0%d0%be%d0%bc%d0%bd%d1%8b', 'UA', 1),
(1287, 103, 'Тростянец', '%d0%a2%d1%80%d0%be%d1%81%d1%82%d1%8f%d0%bd%d0%b5%d1%86', 'UA', 1),
(1288, 103, 'Шостка', '%d0%a8%d0%be%d1%81%d1%82%d0%ba%d0%b0', 'UA', 1),
(1289, 104, 'Тернополь', '%d0%a2%d0%b5%d1%80%d0%bd%d0%be%d0%bf%d0%be%d0%bb%d1%8c', 'UA', 1),
(1290, 104, 'Лозовая', '%d0%9b%d0%be%d0%b7%d0%be%d0%b2%d0%b0%d1%8f', 'UA', 1),
(1291, 105, 'Харьков', '%d0%a5%d0%b0%d1%80%d1%8c%d0%ba%d0%be%d0%b2', 'UA', 1),
(1292, 105, 'Барвенково', '%d0%91%d0%b0%d1%80%d0%b2%d0%b5%d0%bd%d0%ba%d0%be%d0%b2%d0%be', 'UA', 1),
(1293, 105, 'Балаклея', '%d0%91%d0%b0%d0%bb%d0%b0%d0%ba%d0%bb%d0%b5%d1%8f', 'UA', 1),
(1294, 105, 'Змиёв', '%d0%97%d0%bc%d0%b8%d1%91%d0%b2', 'UA', 1),
(1295, 105, 'Изюм', '%d0%98%d0%b7%d1%8e%d0%bc', 'UA', 1),
(1296, 105, 'Кегичёвка', '%d0%9a%d0%b5%d0%b3%d0%b8%d1%87%d1%91%d0%b2%d0%ba%d0%b0', 'UA', 1),
(1297, 105, 'Комсомольское', '%d0%9a%d0%be%d0%bc%d1%81%d0%be%d0%bc%d0%be%d0%bb%d1%8c%d1%81', 'UA', 1),
(1298, 105, 'Мерефа', '%d0%9c%d0%b5%d1%80%d0%b5%d1%84%d0%b0', 'UA', 1),
(1299, 105, 'Лозовая', '%d0%9b%d0%be%d0%b7%d0%be%d0%b2%d0%b0%d1%8f-1', 'UA', 1),
(1300, 105, 'Подворки', '%d0%9f%d0%be%d0%b4%d0%b2%d0%be%d1%80%d0%ba%d0%b8', 'UA', 1),
(1301, 105, 'Тарановка', '%d0%a2%d0%b0%d1%80%d0%b0%d0%bd%d0%be%d0%b2%d0%ba%d0%b0', 'UA', 1),
(1302, 106, 'Херсон', '%d0%a5%d0%b5%d1%80%d1%81%d0%be%d0%bd', 'UA', 1),
(1303, 106, 'Васильевка', '%d0%92%d0%b0%d1%81%d0%b8%d0%bb%d1%8c%d0%b5%d0%b2%d0%ba%d0%b0', 'UA', 1),
(1304, 106, 'Геническ', '%d0%93%d0%b5%d0%bd%d0%b8%d1%87%d0%b5%d1%81%d0%ba', 'UA', 1),
(1305, 106, 'Большая ', '%d0%91%d0%be%d0%bb%d1%8c%d1%88%d0%b0%d1%8f', 'UA', 1),
(1306, 106, 'Александровка', '%d0%90%d0%bb%d0%b5%d0%ba%d1%81%d0%b0%d0%bd%d0%b4%d1%80%d0%be', 'UA', 1),
(1307, 106, 'Новая Каховка', '%d0%9d%d0%be%d0%b2%d0%b0%d1%8f-%d0%9a%d0%b0%d1%85%d0%be%d0%b', 'UA', 1),
(1308, 106, 'Новотроицкое', '%d0%9d%d0%be%d0%b2%d0%be%d1%82%d1%80%d0%be%d0%b8%d1%86%d0%ba', 'UA', 1),
(1309, 106, 'Рыбальче', '%d0%a0%d1%8b%d0%b1%d0%b0%d0%bb%d1%8c%d1%87%d0%b5', 'UA', 1),
(1310, 106, 'Чаплинка', '%d0%a7%d0%b0%d0%bf%d0%bb%d0%b8%d0%bd%d0%ba%d0%b0', 'UA', 1),
(1311, 107, 'Хмельницкий', '%d0%a5%d0%bc%d0%b5%d0%bb%d1%8c%d0%bd%d0%b8%d1%86%d0%ba%d0%b8', 'UA', 1),
(1312, 107, 'Волочиск', '%d0%92%d0%be%d0%bb%d0%be%d1%87%d0%b8%d1%81%d0%ba', 'UA', 1),
(1313, 107, 'Каменец-Подольский', '%d0%9a%d0%b0%d0%bc%d0%b5%d0%bd%d0%b5%d1%86-%d0%9f%d0%be%d0%b', 'UA', 1),
(1314, 107, 'Кульчиевцы', '%d0%9a%d1%83%d0%bb%d1%8c%d1%87%d0%b8%d0%b5%d0%b2%d1%86%d1%8b', 'UA', 1),
(1315, 107, 'Нетешин', '%d0%9d%d0%b5%d1%82%d0%b5%d1%88%d0%b8%d0%bd', 'UA', 1),
(1316, 108, 'Черкассы', '%d0%a7%d0%b5%d1%80%d0%ba%d0%b0%d1%81%d1%81%d1%8b', 'UA', 1),
(1317, 108, 'Буки', '%d0%91%d1%83%d0%ba%d0%b8', 'UA', 1),
(1318, 108, 'Канев', '%d0%9a%d0%b0%d0%bd%d0%b5%d0%b2', 'UA', 1),
(1319, 108, 'Смела', '%d0%a1%d0%bc%d0%b5%d0%bb%d0%b0', 'UA', 1),
(1320, 108, 'Умань', '%d0%a3%d0%bc%d0%b0%d0%bd%d1%8c', 'UA', 1),
(1321, 109, 'Чернигов', '%d0%a7%d0%b5%d1%80%d0%bd%d0%b8%d0%b3%d0%be%d0%b2', 'UA', 1),
(1322, 109, 'Козелец', '%d0%9a%d0%be%d0%b7%d0%b5%d0%bb%d0%b5%d1%86', 'UA', 1),
(1323, 109, 'Бахмач', '%d0%91%d0%b0%d1%85%d0%bc%d0%b0%d1%87', 'UA', 1),
(1324, 109, 'Круты', '%d0%9a%d1%80%d1%83%d1%82%d1%8b', 'UA', 1),
(1325, 109, 'Нежин', '%d0%9d%d0%b5%d0%b6%d0%b8%d0%bd', 'UA', 1),
(1326, 109, 'Новгород-Северский', '%d0%9d%d0%be%d0%b2%d0%b3%d0%be%d1%80%d0%be%d0%b4-%d0%a1%d0%b', 'UA', 1),
(1327, 109, 'Прилуки', '%d0%9f%d1%80%d0%b8%d0%bb%d1%83%d0%ba%d0%b8', 'UA', 1),
(1328, 110, 'Черновцы', '%d0%a7%d0%b5%d1%80%d0%bd%d0%be%d0%b2%d1%86%d1%8b', 'UA', 1),
(1329, 110, 'Новоднестровск', '%d0%9d%d0%be%d0%b2%d0%be%d0%b4%d0%bd%d0%b5%d1%81%d1%82%d1%80', 'UA', 1),
(1330, 112, 'Айдабул', '%d0%90%d0%b9%d0%b4%d0%b0%d0%b1%d1%83%d0%bb', 'KZ', 1),
(1331, 112, 'Акколь', '%d0%90%d0%ba%d0%ba%d0%be%d0%bb%d1%8c', 'KZ', 1),
(1332, 112, 'Аксу', '%d0%90%d0%ba%d1%81%d1%83', 'KZ', 1),
(1333, 112, 'Алексеевка', '%d0%90%d0%bb%d0%b5%d0%ba%d1%81%d0%b5%d0%b5%d0%b2%d0%ba%d0%b0', 'KZ', 1),
(1334, 112, 'Атбасар', '%d0%90%d1%82%d0%b1%d0%b0%d1%81%d0%b0%d1%80', 'KZ', 1),
(1335, 112, 'Баймурза', '%d0%91%d0%b0%d0%b9%d0%bc%d1%83%d1%80%d0%b7%d0%b0', 'KZ', 1),
(1336, 112, 'Бурабай', '%d0%91%d1%83%d1%80%d0%b0%d0%b1%d0%b0%d0%b9', 'KZ', 1),
(1337, 112, 'Державинск', '%d0%94%d0%b5%d1%80%d0%b6%d0%b0%d0%b2%d0%b8%d0%bd%d1%81%d0%ba', 'KZ', 1),
(1338, 112, 'Ерейментау', '%d0%95%d1%80%d0%b5%d0%b9%d0%bc%d0%b5%d0%bd%d1%82%d0%b0%d1%83', 'KZ', 1),
(1339, 112, 'Запорожье', '%d0%97%d0%b0%d0%bf%d0%be%d1%80%d0%be%d0%b6%d1%8c%d0%b5-1', 'KZ', 1),
(1340, 112, 'Зеренда', '%d0%97%d0%b5%d1%80%d0%b5%d0%bd%d0%b4%d0%b0', 'KZ', 1),
(1341, 112, 'Кабанбай Батыр', '%d0%9a%d0%b0%d0%b1%d0%b0%d0%bd%d0%b1%d0%b0%d0%b9-%d0%91%d0%b', 'KZ', 1),
(1342, 112, 'Кокшетау', '%d0%9a%d0%be%d0%ba%d1%88%d0%b5%d1%82%d0%b0%d1%83', 'KZ', 1),
(1343, 112, 'Куйгенжар', '%d0%9a%d1%83%d0%b9%d0%b3%d0%b5%d0%bd%d0%b6%d0%b0%d1%80', 'KZ', 1),
(1344, 112, 'Курское', '%d0%9a%d1%83%d1%80%d1%81%d0%ba%d0%be%d0%b5', 'KZ', 1),
(1345, 112, 'Макинск', '%d0%9c%d0%b0%d0%ba%d0%b8%d0%bd%d1%81%d0%ba', 'KZ', 1),
(1346, 112, 'Максимовка', '%d0%9c%d0%b0%d0%ba%d1%81%d0%b8%d0%bc%d0%be%d0%b2%d0%ba%d0%b0', 'KZ', 1),
(1347, 112, 'Малиновка', '%d0%9c%d0%b0%d0%bb%d0%b8%d0%bd%d0%be%d0%b2%d0%ba%d0%b0', 'KZ', 1),
(1348, 112, 'Новочеркаское', '%d0%9d%d0%be%d0%b2%d0%be%d1%87%d0%b5%d1%80%d0%ba%d0%b0%d1%81', 'KZ', 1),
(1349, 112, 'Степногорск', '%d0%a1%d1%82%d0%b5%d0%bf%d0%bd%d0%be%d0%b3%d0%be%d1%80%d1%81', 'KZ', 1),
(1350, 112, 'Талапкер', '%d0%a2%d0%b0%d0%bb%d0%b0%d0%bf%d0%ba%d0%b5%d1%80', 'KZ', 1),
(1351, 112, 'Шортанды', '%d0%a8%d0%be%d1%80%d1%82%d0%b0%d0%bd%d0%b4%d1%8b', 'KZ', 1),
(1352, 112, 'Щучинск', '%d0%a9%d1%83%d1%87%d0%b8%d0%bd%d1%81%d0%ba', 'KZ', 1),
(1353, 113, 'Актобе', '%d0%90%d0%ba%d1%82%d0%be%d0%b1%d0%b5', 'KZ', 1),
(1354, 113, 'Алга', '%d0%90%d0%bb%d0%b3%d0%b0', 'KZ', 1),
(1355, 113, 'Батамшинский', '%d0%91%d0%b0%d1%82%d0%b0%d0%bc%d1%88%d0%b8%d0%bd%d1%81%d0%ba', 'KZ', 1),
(1356, 113, 'Кандыагаш', '%d0%9a%d0%b0%d0%bd%d0%b4%d1%8b%d0%b0%d0%b3%d0%b0%d1%88', 'KZ', 1),
(1357, 113, 'Каргалинское', '%d0%9a%d0%b0%d1%80%d0%b3%d0%b0%d0%bb%d0%b8%d0%bd%d1%81%d0%ba', 'KZ', 1),
(1358, 113, 'Мартук', '%d0%9c%d0%b0%d1%80%d1%82%d1%83%d0%ba', 'KZ', 1),
(1359, 113, 'Хромтау', '%d0%a5%d1%80%d0%be%d0%bc%d1%82%d0%b0%d1%83', 'KZ', 1),
(1360, 113, 'Шалкар', '%d0%a8%d0%b0%d0%bb%d0%ba%d0%b0%d1%80', 'KZ', 1),
(1361, 113, 'Шубаркудук', '%d0%a8%d1%83%d0%b1%d0%b0%d1%80%d0%ba%d1%83%d0%b4%d1%83%d0%ba', 'KZ', 1),
(1362, 113, 'Эмба', '%d0%ad%d0%bc%d0%b1%d0%b0', 'KZ', 1),
(1363, 114, 'Абай', '%d0%90%d0%b1%d0%b0%d0%b9', 'KZ', 1),
(1364, 114, 'Азат', '%d0%90%d0%b7%d0%b0%d1%82', 'KZ', 1),
(1365, 114, 'Актерек', '%d0%90%d0%ba%d1%82%d0%b5%d1%80%d0%b5%d0%ba', 'KZ', 1),
(1366, 114, 'Алатау', '%d0%90%d0%bb%d0%b0%d1%82%d0%b0%d1%83', 'KZ', 1),
(1367, 114, 'Алгабас', '%d0%90%d0%bb%d0%b3%d0%b0%d0%b1%d0%b0%d1%81', 'KZ', 1),
(1368, 114, 'Алдабергенов', '%d0%90%d0%bb%d0%b4%d0%b0%d0%b1%d0%b5%d1%80%d0%b3%d0%b5%d0%bd', 'KZ', 1),
(1369, 114, 'Алмалыбак', '%d0%90%d0%bb%d0%bc%d0%b0%d0%bb%d1%8b%d0%b1%d0%b0%d0%ba', 'KZ', 1),
(1370, 114, 'Байсерке', '%d0%91%d0%b0%d0%b9%d1%81%d0%b5%d1%80%d0%ba%d0%b5', 'KZ', 1),
(1371, 114, 'Бахтыбай', '%d0%91%d0%b0%d1%85%d1%82%d1%8b%d0%b1%d0%b0%d0%b9', 'KZ', 1),
(1372, 114, 'Бесагаш', '%d0%91%d0%b5%d1%81%d0%b0%d0%b3%d0%b0%d1%88', 'KZ', 1),
(1373, 114, 'Боралдай', '%d0%91%d0%be%d1%80%d0%b0%d0%bb%d0%b4%d0%b0%d0%b9', 'KZ', 1),
(1374, 114, 'Булакты', '%d0%91%d1%83%d0%bb%d0%b0%d0%ba%d1%82%d1%8b', 'KZ', 1),
(1375, 114, 'Декабрь', '%d0%94%d0%b5%d0%ba%d0%b0%d0%b1%d1%80%d1%8c', 'KZ', 1),
(1376, 114, 'Екпенды', '%d0%95%d0%ba%d0%bf%d0%b5%d0%bd%d0%b4%d1%8b', 'KZ', 1),
(1377, 114, 'Енбекши', '%d0%95%d0%bd%d0%b1%d0%b5%d0%ba%d1%88%d0%b8', 'KZ', 1),
(1378, 114, 'Ерменсай', '%d0%95%d1%80%d0%bc%d0%b5%d0%bd%d1%81%d0%b0%d0%b9', 'KZ', 1),
(1379, 114, 'Есик', '%d0%95%d1%81%d0%b8%d0%ba', 'KZ', 1),
(1380, 114, 'Жана-Арна', '%d0%96%d0%b0%d0%bd%d0%b0-%d0%90%d1%80%d0%bd%d0%b0', 'KZ', 1),
(1381, 114, 'Жаркент', '%d0%96%d0%b0%d1%80%d0%ba%d0%b5%d0%bd%d1%82', 'KZ', 1),
(1382, 114, 'Кабанбай', '%d0%9a%d0%b0%d0%b1%d0%b0%d0%bd%d0%b1%d0%b0%d0%b9', 'KZ', 1),
(1383, 114, 'Каменка', '%d0%9a%d0%b0%d0%bc%d0%b5%d0%bd%d0%ba%d0%b0-1', 'KZ', 1),
(1384, 114, 'Капчагай', '%d0%9a%d0%b0%d0%bf%d1%87%d0%b0%d0%b3%d0%b0%d0%b9', 'KZ', 1),
(1385, 114, 'Карабулак', '%d0%9a%d0%b0%d1%80%d0%b0%d0%b1%d1%83%d0%bb%d0%b0%d0%ba-1', 'KZ', 1),
(1386, 114, 'Каскелен', '%d0%9a%d0%b0%d1%81%d0%ba%d0%b5%d0%bb%d0%b5%d0%bd', 'KZ', 1),
(1387, 114, 'Кемиртоган', '%d0%9a%d0%b5%d0%bc%d0%b8%d1%80%d1%82%d0%be%d0%b3%d0%b0%d0%bd', 'KZ', 1),
(1388, 114, 'Кендала', '%d0%9a%d0%b5%d0%bd%d0%b4%d0%b0%d0%bb%d0%b0', 'KZ', 1),
(1389, 114, 'Кербулак', '%d0%9a%d0%b5%d1%80%d0%b1%d1%83%d0%bb%d0%b0%d0%ba', 'KZ', 1),
(1390, 114, 'Ключи', '%d0%9a%d0%bb%d1%8e%d1%87%d0%b8', 'KZ', 1),
(1391, 114, 'Косозен', '%d0%9a%d0%be%d1%81%d0%be%d0%b7%d0%b5%d0%bd', 'KZ', 1),
(1392, 114, 'Маловодное', '%d0%9c%d0%b0%d0%bb%d0%be%d0%b2%d0%be%d0%b4%d0%bd%d0%be%d0%b5', 'KZ', 1),
(1393, 114, 'Мамыр', '%d0%9c%d0%b0%d0%bc%d1%8b%d1%80', 'KZ', 1),
(1394, 114, 'Мерке', '%d0%9c%d0%b5%d1%80%d0%ba%d0%b5', 'KZ', 1),
(1395, 114, 'Мухаметжан Туймебаева', '%d0%9c%d1%83%d1%85%d0%b0%d0%bc%d0%b5%d1%82%d0%b6%d0%b0%d0%bd', 'KZ', 1),
(1396, 114, 'Отеген Батыр', '%d0%9e%d1%82%d0%b5%d0%b3%d0%b5%d0%bd-%d0%91%d0%b0%d1%82%d1%8', 'KZ', 1),
(1397, 114, 'Мерей', '%d0%9c%d0%b5%d1%80%d0%b5%d0%b9', 'KZ', 1),
(1398, 114, 'Ынтымак', '%d0%ab%d0%bd%d1%82%d1%8b%d0%bc%d0%b0%d0%ba', 'KZ', 1),
(1399, 114, 'Первомайка', '%d0%9f%d0%b5%d1%80%d0%b2%d0%be%d0%bc%d0%b0%d0%b9%d0%ba%d0%b0', 'KZ', 1),
(1400, 114, 'Бастобе', '%d0%91%d0%b0%d1%81%d1%82%d0%be%d0%b1%d0%b5', 'KZ', 1),
(1401, 114, 'Саймасай', '%d0%a1%d0%b0%d0%b9%d0%bc%d0%b0%d1%81%d0%b0%d0%b9', 'KZ', 1),
(1402, 114, 'Сарыозек', '%d0%a1%d0%b0%d1%80%d1%8b%d0%be%d0%b7%d0%b5%d0%ba', 'KZ', 1),
(1403, 114, 'Талгар', '%d0%a2%d0%b0%d0%bb%d0%b3%d0%b0%d1%80', 'KZ', 1),
(1404, 114, 'Талдыкорган', '%d0%a2%d0%b0%d0%bb%d0%b4%d1%8b%d0%ba%d0%be%d1%80%d0%b3%d0%b0', 'KZ', 1),
(1405, 114, 'Текели', '%d0%a2%d0%b5%d0%ba%d0%b5%d0%bb%d0%b8', 'KZ', 1),
(1406, 114, 'Теректы', '%d0%a2%d0%b5%d1%80%d0%b5%d0%ba%d1%82%d1%8b', 'KZ', 1),
(1407, 114, 'Туздыбастау', '%d0%a2%d1%83%d0%b7%d0%b4%d1%8b%d0%b1%d0%b0%d1%81%d1%82%d0%b0', 'KZ', 1),
(1408, 114, 'Узынагаш', '%d0%a3%d0%b7%d1%8b%d0%bd%d0%b0%d0%b3%d0%b0%d1%88', 'KZ', 1),
(1409, 114, 'Умбеталы', '%d0%a3%d0%bc%d0%b1%d0%b5%d1%82%d0%b0%d0%bb%d1%8b', 'KZ', 1),
(1410, 114, 'Ушарал', '%d0%a3%d1%88%d0%b0%d1%80%d0%b0%d0%bb', 'KZ', 1),
(1411, 114, 'Ушконыр (Шамалган)', '%d0%a3%d1%88%d0%ba%d0%be%d0%bd%d1%8b%d1%80-%d0%a8%d0%b0%d0%b', 'KZ', 1),
(1412, 114, 'Уштобе', '%d0%a3%d1%88%d1%82%d0%be%d0%b1%d0%b5', 'KZ', 1),
(1413, 114, 'Фабричный', '%d0%a4%d0%b0%d0%b1%d1%80%d0%b8%d1%87%d0%bd%d1%8b%d0%b9', 'KZ', 1),
(1414, 114, 'Чемолган', '%d0%a7%d0%b5%d0%bc%d0%be%d0%bb%d0%b3%d0%b0%d0%bd', 'KZ', 1),
(1415, 114, 'Чимбулак', '%d0%a7%d0%b8%d0%bc%d0%b1%d1%83%d0%bb%d0%b0%d0%ba', 'KZ', 1),
(1416, 114, 'Чунджа', '%d0%a7%d1%83%d0%bd%d0%b4%d0%b6%d0%b0', 'KZ', 1),
(1417, 114, 'Шелек', '%d0%a8%d0%b5%d0%bb%d0%b5%d0%ba', 'KZ', 1),
(1418, 114, 'Шенгельды', '%d0%a8%d0%b5%d0%bd%d0%b3%d0%b5%d0%bb%d1%8c%d0%b4%d1%8b', 'KZ', 1),
(1419, 114, 'Шынты', '%d0%a8%d1%8b%d0%bd%d1%82%d1%8b', 'KZ', 1),
(1420, 115, 'Алматы', '%d0%90%d0%bb%d0%bc%d0%b0%d1%82%d1%8b', 'KZ', 1),
(1421, 115, 'Курылысши', '%d0%9a%d1%83%d1%80%d1%8b%d0%bb%d1%8b%d1%81%d1%88%d0%b8', 'KZ', 1),
(1422, 116, 'Астана', '%d0%90%d1%81%d1%82%d0%b0%d0%bd%d0%b0', 'KZ', 1),
(1423, 117, 'Акколь', '%d0%90%d0%ba%d0%ba%d0%be%d0%bb%d1%8c-1', 'KZ', 1),
(1424, 117, 'Атырау', '%d0%90%d1%82%d1%8b%d1%80%d0%b0%d1%83', 'KZ', 1),
(1425, 117, 'Ганюшкино', '%d0%93%d0%b0%d0%bd%d1%8e%d1%88%d0%ba%d0%b8%d0%bd%d0%be', 'KZ', 1),
(1426, 117, 'Жаскайрат', '%d0%96%d0%b0%d1%81%d0%ba%d0%b0%d0%b9%d1%80%d0%b0%d1%82', 'KZ', 1),
(1427, 117, 'Кульсары', '%d0%9a%d1%83%d0%bb%d1%8c%d1%81%d0%b0%d1%80%d1%8b', 'KZ', 1),
(1428, 117, 'Махамбет', '%d0%9c%d0%b0%d1%85%d0%b0%d0%bc%d0%b1%d0%b5%d1%82', 'KZ', 1),
(1429, 117, 'Тенгиз', '%d0%a2%d0%b5%d0%bd%d0%b3%d0%b8%d0%b7', 'KZ', 1),
(1430, 118, 'Асу-Булак', '%d0%90%d1%81%d1%83-%d0%91%d1%83%d0%bb%d0%b0%d0%ba', 'KZ', 1),
(1431, 118, 'Атыбай', '%d0%90%d1%82%d1%8b%d0%b1%d0%b0%d0%b9', 'KZ', 1),
(1432, 118, 'Аягоз', '%d0%90%d1%8f%d0%b3%d0%be%d0%b7', 'KZ', 1),
(1433, 118, 'Глубоков', '%d0%93%d0%bb%d1%83%d0%b1%d0%be%d0%ba%d0%be%d0%b2', 'KZ', 1),
(1434, 118, 'Зайсан', '%d0%97%d0%b0%d0%b9%d1%81%d0%b0%d0%bd', 'KZ', 1),
(1435, 118, 'Зыряновск', '%d0%97%d1%8b%d1%80%d1%8f%d0%bd%d0%be%d0%b2%d1%81%d0%ba', 'KZ', 1),
(1436, 118, 'Кабалтау', '%d0%9a%d0%b0%d0%b1%d0%b0%d0%bb%d1%82%d0%b0%d1%83', 'KZ', 1),
(1437, 118, 'Курчатов', '%d0%9a%d1%83%d1%80%d1%87%d0%b0%d1%82%d0%be%d0%b2-1', 'KZ', 1),
(1438, 118, 'Маканчи', '%d0%9c%d0%b0%d0%ba%d0%b0%d0%bd%d1%87%d0%b8', 'KZ', 1),
(1439, 118, 'Новая согра', '%d0%9d%d0%be%d0%b2%d0%b0%d1%8f-%d1%81%d0%be%d0%b3%d1%80%d0%b', 'KZ', 1),
(1440, 118, 'Ново-Хайрузовка', '%d0%9d%d0%be%d0%b2%d0%be-%d0%a5%d0%b0%d0%b9%d1%80%d1%83%d0%b', 'KZ', 1),
(1441, 118, 'Первомайский', '%d0%9f%d0%b5%d1%80%d0%b2%d0%be%d0%bc%d0%b0%d0%b9%d1%81%d0%ba', 'KZ', 1),
(1442, 118, 'Риддер', '%d0%a0%d0%b8%d0%b4%d0%b4%d0%b5%d1%80', 'KZ', 1),
(1443, 118, 'Семей', '%d0%a1%d0%b5%d0%bc%d0%b5%d0%b9', 'KZ', 1),
(1444, 118, 'Семипалатинск', '%d0%a1%d0%b5%d0%bc%d0%b8%d0%bf%d0%b0%d0%bb%d0%b0%d1%82%d0%b8', 'KZ', 1),
(1445, 118, 'Серебрянск', '%d0%a1%d0%b5%d1%80%d0%b5%d0%b1%d1%80%d1%8f%d0%bd%d1%81%d0%ba', 'KZ', 1),
(1446, 118, 'Солнечное', '%d0%a1%d0%be%d0%bb%d0%bd%d0%b5%d1%87%d0%bd%d0%be%d0%b5', 'KZ', 1),
(1447, 118, 'Теремшамка', '%d0%a2%d0%b5%d1%80%d0%b5%d0%bc%d1%88%d0%b0%d0%bc%d0%ba%d0%b0', 'KZ', 1),
(1448, 118, 'Тугул', '%d0%a2%d1%83%d0%b3%d1%83%d0%bb', 'KZ', 1),
(1449, 118, 'Усть-Каменогорск', '%d0%a3%d1%81%d1%82%d1%8c-%d0%9a%d0%b0%d0%bc%d0%b5%d0%bd%d0%b', 'KZ', 1),
(1450, 118, 'Шар', '%d0%a8%d0%b0%d1%80', 'KZ', 1),
(1451, 118, 'Шемонаиха', '%d0%a8%d0%b5%d0%bc%d0%be%d0%bd%d0%b0%d0%b8%d1%85%d0%b0', 'KZ', 1),
(1452, 119, 'Айша-Биби', '%d0%90%d0%b9%d1%88%d0%b0-%d0%91%d0%b8%d0%b1%d0%b8', 'KZ', 1),
(1453, 119, 'Ерназар', '%d0%95%d1%80%d0%bd%d0%b0%d0%b7%d0%b0%d1%80', 'KZ', 1),
(1454, 119, 'Жанатас', '%d0%96%d0%b0%d0%bd%d0%b0%d1%82%d0%b0%d1%81', 'KZ', 1),
(1455, 119, 'Каратау', '%d0%9a%d0%b0%d1%80%d0%b0%d1%82%d0%b0%d1%83', 'KZ', 1),
(1456, 119, 'Кордай', '%d0%9a%d0%be%d1%80%d0%b4%d0%b0%d0%b9', 'KZ', 1),
(1457, 119, 'Кулан', '%d0%9a%d1%83%d0%bb%d0%b0%d0%bd', 'KZ', 1),
(1458, 119, 'Мерке', '%d0%9c%d0%b5%d1%80%d0%ba%d0%b5-1', 'KZ', 1),
(1459, 119, 'Б.Момышулы', '%d0%91-%d0%9c%d0%be%d0%bc%d1%8b%d1%88%d1%83%d0%bb%d1%8b', 'KZ', 1),
(1460, 119, 'Степное', '%d0%a1%d1%82%d0%b5%d0%bf%d0%bd%d0%be%d0%b5', 'KZ', 1),
(1461, 119, 'Тараз', '%d0%a2%d0%b0%d1%80%d0%b0%d0%b7', 'KZ', 1),
(1462, 119, 'Шу', '%d0%a8%d1%83', 'KZ', 1),
(1463, 119, 'Шынты', '%d0%a8%d1%8b%d0%bd%d1%82%d1%8b-1', 'KZ', 1),
(1464, 120, 'Аксай', '%d0%90%d0%ba%d1%81%d0%b0%d0%b9-1', 'KZ', 1),
(1465, 120, 'Актау', '%d0%90%d0%ba%d1%82%d0%b0%d1%83', 'KZ', 1),
(1466, 120, 'Жангала', '%d0%96%d0%b0%d0%bd%d0%b3%d0%b0%d0%bb%d0%b0', 'KZ', 1),
(1467, 120, 'Зачаганск', '%d0%97%d0%b0%d1%87%d0%b0%d0%b3%d0%b0%d0%bd%d1%81%d0%ba', 'KZ', 1),
(1468, 120, 'Казталовка', '%d0%9a%d0%b0%d0%b7%d1%82%d0%b0%d0%bb%d0%be%d0%b2%d0%ba%d0%b0', 'KZ', 1),
(1469, 120, 'Каменка', '%d0%9a%d0%b0%d0%bc%d0%b5%d0%bd%d0%ba%d0%b0-2', 'KZ', 1),
(1470, 120, 'Переметное', '%d0%9f%d0%b5%d1%80%d0%b5%d0%bc%d0%b5%d1%82%d0%bd%d0%be%d0%b5', 'KZ', 1),
(1471, 120, 'Сайхин', '%d0%a1%d0%b0%d0%b9%d1%85%d0%b8%d0%bd', 'KZ', 1),
(1472, 120, 'Тайпак', '%d0%a2%d0%b0%d0%b9%d0%bf%d0%b0%d0%ba', 'KZ', 1),
(1473, 120, 'Трекино', '%d0%a2%d1%80%d0%b5%d0%ba%d0%b8%d0%bd%d0%be', 'KZ', 1),
(1474, 120, 'Уральск', '%d0%a3%d1%80%d0%b0%d0%bb%d1%8c%d1%81%d0%ba', 'KZ', 1),
(1475, 120, 'Федоровка', '%d0%a4%d0%b5%d0%b4%d0%be%d1%80%d0%be%d0%b2%d0%ba%d0%b0', 'KZ', 1),
(1476, 121, 'Абай', '%d0%90%d0%b1%d0%b0%d0%b9-1', 'KZ', 1),
(1477, 121, 'Агадырь', '%d0%90%d0%b3%d0%b0%d0%b4%d1%8b%d1%80%d1%8c', 'KZ', 1),
(1478, 121, 'Актау', '%d0%90%d0%ba%d1%82%d0%b0%d1%83-1', 'KZ', 1),
(1479, 121, 'Балхаш', '%d0%91%d0%b0%d0%bb%d1%85%d0%b0%d1%88', 'KZ', 1),
(1480, 121, 'Дубовка', '%d0%94%d1%83%d0%b1%d0%be%d0%b2%d0%ba%d0%b0-1', 'KZ', 1),
(1481, 121, 'Жезды', '%d0%96%d0%b5%d0%b7%d0%b4%d1%8b', 'KZ', 1),
(1482, 121, 'Жезказган', '%d0%96%d0%b5%d0%b7%d0%ba%d0%b0%d0%b7%d0%b3%d0%b0%d0%bd', 'KZ', 1),
(1483, 121, 'Караганда', '%d0%9a%d0%b0%d1%80%d0%b0%d0%b3%d0%b0%d0%bd%d0%b4%d0%b0', 'KZ', 1),
(1484, 121, 'Каражал', '%d0%9a%d0%b0%d1%80%d0%b0%d0%b6%d0%b0%d0%bb', 'KZ', 1),
(1485, 121, 'Каркаралинск', '%d0%9a%d0%b0%d1%80%d0%ba%d0%b0%d1%80%d0%b0%d0%bb%d0%b8%d0%bd', 'KZ', 1),
(1486, 121, 'Осакаровка', '%d0%9e%d1%81%d0%b0%d0%ba%d0%b0%d1%80%d0%be%d0%b2%d0%ba%d0%b0', 'KZ', 1),
(1487, 121, 'Сарань', '%d0%a1%d0%b0%d1%80%d0%b0%d0%bd%d1%8c', 'KZ', 1),
(1488, 121, 'Сатпаев', '%d0%a1%d0%b0%d1%82%d0%bf%d0%b0%d0%b5%d0%b2', 'KZ', 1),
(1489, 121, 'Темиртау', '%d0%a2%d0%b5%d0%bc%d0%b8%d1%80%d1%82%d0%b0%d1%83', 'KZ', 1),
(1490, 121, 'Топар', '%d0%a2%d0%be%d0%bf%d0%b0%d1%80', 'KZ', 1),
(1491, 121, 'Шахтинск', '%d0%a8%d0%b0%d1%85%d1%82%d0%b8%d0%bd%d1%81%d0%ba', 'KZ', 1),
(1492, 121, 'Шашубай', '%d0%a8%d0%b0%d1%88%d1%83%d0%b1%d0%b0%d0%b9', 'KZ', 1),
(1493, 122, 'Аманкарагай', '%d0%90%d0%bc%d0%b0%d0%bd%d0%ba%d0%b0%d1%80%d0%b0%d0%b3%d0%b0', 'KZ', 1),
(1494, 122, 'Аркалык', '%d0%90%d1%80%d0%ba%d0%b0%d0%bb%d1%8b%d0%ba', 'KZ', 1),
(1495, 122, 'Аулиеколь', '%d0%90%d1%83%d0%bb%d0%b8%d0%b5%d0%ba%d0%be%d0%bb%d1%8c', 'KZ', 1),
(1496, 122, 'Жалгыскан', '%d0%96%d0%b0%d0%bb%d0%b3%d1%8b%d1%81%d0%ba%d0%b0%d0%bd', 'KZ', 1),
(1497, 122, 'Житикара', '%d0%96%d0%b8%d1%82%d0%b8%d0%ba%d0%b0%d1%80%d0%b0', 'KZ', 1),
(1498, 122, 'Затобольск', '%d0%97%d0%b0%d1%82%d0%be%d0%b1%d0%be%d0%bb%d1%8c%d1%81%d0%ba', 'KZ', 1),
(1499, 122, 'Камысты', '%d0%9a%d0%b0%d0%bc%d1%8b%d1%81%d1%82%d1%8b', 'KZ', 1),
(1500, 122, 'Карабалык', '%d0%9a%d0%b0%d1%80%d0%b0%d0%b1%d0%b0%d0%bb%d1%8b%d0%ba', 'KZ', 1),
(1501, 122, 'Костанай', '%d0%9a%d0%be%d1%81%d1%82%d0%b0%d0%bd%d0%b0%d0%b9', 'KZ', 1),
(1502, 122, 'Кушмурун', '%d0%9a%d1%83%d1%88%d0%bc%d1%83%d1%80%d1%83%d0%bd', 'KZ', 1),
(1503, 122, 'Лисаковск', '%d0%9b%d0%b8%d1%81%d0%b0%d0%ba%d0%be%d0%b2%d1%81%d0%ba', 'KZ', 1),
(1504, 122, 'Приозёрный', '%d0%9f%d1%80%d0%b8%d0%be%d0%b7%d1%91%d1%80%d0%bd%d1%8b%d0%b9', 'KZ', 1),
(1505, 122, 'Раздольный', '%d0%a0%d0%b0%d0%b7%d0%b4%d0%be%d0%bb%d1%8c%d0%bd%d1%8b%d0%b9', 'KZ', 1),
(1506, 122, 'Рудный', '%d0%a0%d1%83%d0%b4%d0%bd%d1%8b%d0%b9', 'KZ', 1),
(1507, 122, 'Садовое', '%d0%a1%d0%b0%d0%b4%d0%be%d0%b2%d0%be%d0%b5', 'KZ', 1),
(1508, 122, 'Сарыколь', '%d0%a1%d0%b0%d1%80%d1%8b%d0%ba%d0%be%d0%bb%d1%8c', 'KZ', 1),
(1509, 122, 'Силантьевка', '%d0%a1%d0%b8%d0%bb%d0%b0%d0%bd%d1%82%d1%8c%d0%b5%d0%b2%d0%ba', 'KZ', 1),
(1510, 122, 'Тарановское', '%d0%a2%d0%b0%d1%80%d0%b0%d0%bd%d0%be%d0%b2%d1%81%d0%ba%d0%be', 'KZ', 1),
(1511, 122, 'Узунколь', '%d0%a3%d0%b7%d1%83%d0%bd%d0%ba%d0%be%d0%bb%d1%8c', 'KZ', 1),
(1512, 122, 'Федоровка', '%d0%a4%d0%b5%d0%b4%d0%be%d1%80%d0%be%d0%b2%d0%ba%d0%b0-1', 'KZ', 1),
(1513, 123, 'Айтеке Би', '%d0%90%d0%b9%d1%82%d0%b5%d0%ba%d0%b5-%d0%91%d0%b8', 'KZ', 1),
(1514, 123, 'Аральск', '%d0%90%d1%80%d0%b0%d0%bb%d1%8c%d1%81%d0%ba', 'KZ', 1),
(1515, 123, 'Жанакорган', '%d0%96%d0%b0%d0%bd%d0%b0%d0%ba%d0%be%d1%80%d0%b3%d0%b0%d0%bd', 'KZ', 1),
(1516, 123, 'Жосалы', '%d0%96%d0%be%d1%81%d0%b0%d0%bb%d1%8b', 'KZ', 1),
(1517, 123, 'Казалинск', '%d0%9a%d0%b0%d0%b7%d0%b0%d0%bb%d0%b8%d0%bd%d1%81%d0%ba', 'KZ', 1),
(1518, 123, 'Кызылорда', '%d0%9a%d1%8b%d0%b7%d1%8b%d0%bb%d0%be%d1%80%d0%b4%d0%b0', 'KZ', 1),
(1519, 123, 'Макпалколь', '%d0%9c%d0%b0%d0%ba%d0%bf%d0%b0%d0%bb%d0%ba%d0%be%d0%bb%d1%8c', 'KZ', 1),
(1520, 123, 'Теренозек', '%d0%a2%d0%b5%d1%80%d0%b5%d0%bd%d0%be%d0%b7%d0%b5%d0%ba', 'KZ', 1),
(1521, 123, 'Торебай Би', '%d0%a2%d0%be%d1%80%d0%b5%d0%b1%d0%b0%d0%b9-%d0%91%d0%b8', 'KZ', 1),
(1522, 123, 'Шиели', '%d0%a8%d0%b8%d0%b5%d0%bb%d0%b8', 'KZ', 1),
(1523, 124, 'Актау', '%d0%90%d0%ba%d1%82%d0%b0%d1%83-2', 'KZ', 1),
(1524, 124, 'Актобе', '%d0%90%d0%ba%d1%82%d0%be%d0%b1%d0%b5-1', 'KZ', 1),
(1525, 124, 'Бейнеу', '%d0%91%d0%b5%d0%b9%d0%bd%d0%b5%d1%83', 'KZ', 1),
(1526, 124, 'Жанаозен', '%d0%96%d0%b0%d0%bd%d0%b0%d0%be%d0%b7%d0%b5%d0%bd', 'KZ', 1),
(1527, 124, 'Умирзак', '%d0%a3%d0%bc%d0%b8%d1%80%d0%b7%d0%b0%d0%ba', 'KZ', 1),
(1528, 124, 'Форт-Шевченко', '%d0%a4%d0%be%d1%80%d1%82-%d0%a8%d0%b5%d0%b2%d1%87%d0%b5%d0%b', 'KZ', 1),
(1529, 124, 'Шетпе', '%d0%a8%d0%b5%d1%82%d0%bf%d0%b5', 'KZ', 1),
(1530, 125, 'Акжар', '%d0%90%d0%ba%d0%b6%d0%b0%d1%80', 'KZ', 1),
(1531, 125, 'Аксу', '%d0%90%d0%ba%d1%81%d1%83-1', 'KZ', 1),
(1532, 125, 'Актогай', '%d0%90%d0%ba%d1%82%d0%be%d0%b3%d0%b0%d0%b9', 'KZ', 1),
(1533, 125, 'Ефремовка', '%d0%95%d1%84%d1%80%d0%b5%d0%bc%d0%be%d0%b2%d0%ba%d0%b0', 'KZ', 1),
(1534, 125, 'Калкаман', '%d0%9a%d0%b0%d0%bb%d0%ba%d0%b0%d0%bc%d0%b0%d0%bd', 'KZ', 1),
(1535, 125, 'Коктобе', '%d0%9a%d0%be%d0%ba%d1%82%d0%be%d0%b1%d0%b5', 'KZ', 1),
(1536, 125, 'Майкаин', '%d0%9c%d0%b0%d0%b9%d0%ba%d0%b0%d0%b8%d0%bd', 'KZ', 1),
(1537, 125, 'Павлодар', '%d0%9f%d0%b0%d0%b2%d0%bb%d0%be%d0%b4%d0%b0%d1%80', 'KZ', 1),
(1538, 125, 'Шидерты', '%d0%a8%d0%b8%d0%b4%d0%b5%d1%80%d1%82%d1%8b', 'KZ', 1),
(1539, 125, 'Экибастуз', '%d0%ad%d0%ba%d0%b8%d0%b1%d0%b0%d1%81%d1%82%d1%83%d0%b7', 'KZ', 1),
(1540, 126, 'Бишкуль', '%d0%91%d0%b8%d1%88%d0%ba%d1%83%d0%bb%d1%8c', 'KZ', 1),
(1541, 126, 'Булаево', '%d0%91%d1%83%d0%bb%d0%b0%d0%b5%d0%b2%d0%be', 'KZ', 1),
(1542, 126, 'Имантау', '%d0%98%d0%bc%d0%b0%d0%bd%d1%82%d0%b0%d1%83', 'KZ', 1),
(1543, 126, 'Ленинградское', '%d0%9b%d0%b5%d0%bd%d0%b8%d0%bd%d0%b3%d1%80%d0%b0%d0%b4%d1%81', 'KZ', 1),
(1544, 126, 'Мамлютка', '%d0%9c%d0%b0%d0%bc%d0%bb%d1%8e%d1%82%d0%ba%d0%b0', 'KZ', 1),
(1545, 126, 'Новоишимское', '%d0%9d%d0%be%d0%b2%d0%be%d0%b8%d1%88%d0%b8%d0%bc%d1%81%d0%ba', 'KZ', 1),
(1546, 126, 'Петропавловск', '%d0%9f%d0%b5%d1%82%d1%80%d0%be%d0%bf%d0%b0%d0%b2%d0%bb%d0%be', 'KZ', 1),
(1547, 126, 'Саратов', '%d0%a1%d0%b0%d1%80%d0%b0%d1%82%d0%be%d0%b2-1', 'KZ', 1),
(1548, 126, 'Саумалколь', '%d0%a1%d0%b0%d1%83%d0%bc%d0%b0%d0%bb%d0%ba%d0%be%d0%bb%d1%8c', 'KZ', 1),
(1549, 126, 'Тайынша', '%d0%a2%d0%b0%d0%b9%d1%8b%d0%bd%d1%88%d0%b0', 'KZ', 1),
(1550, 127, 'Аксукент', '%d0%90%d0%ba%d1%81%d1%83%d0%ba%d0%b5%d0%bd%d1%82', 'KZ', 1),
(1551, 127, 'Арысь', '%d0%90%d1%80%d1%8b%d1%81%d1%8c', 'KZ', 1),
(1552, 127, 'Асык Ата', '%d0%90%d1%81%d1%8b%d0%ba-%d0%90%d1%82%d0%b0', 'KZ', 1),
(1553, 127, 'Атакент', '%d0%90%d1%82%d0%b0%d0%ba%d0%b5%d0%bd%d1%82', 'KZ', 1),
(1554, 127, 'Жетысай', '%d0%96%d0%b5%d1%82%d1%8b%d1%81%d0%b0%d0%b9', 'KZ', 1),
(1555, 127, 'Казыбек би', '%d0%9a%d0%b0%d0%b7%d1%8b%d0%b1%d0%b5%d0%ba-%d0%b1%d0%b8', 'KZ', 1),
(1556, 127, 'Кентау', '%d0%9a%d0%b5%d0%bd%d1%82%d0%b0%d1%83', 'KZ', 1),
(1557, 127, 'Коктерек', '%d0%9a%d0%be%d0%ba%d1%82%d0%b5%d1%80%d0%b5%d0%ba', 'KZ', 1),
(1558, 127, 'Кызылсай', '%d0%9a%d1%8b%d0%b7%d1%8b%d0%bb%d1%81%d0%b0%d0%b9', 'KZ', 1),
(1559, 127, 'Ленгер', '%d0%9b%d0%b5%d0%bd%d0%b3%d0%b5%d1%80', 'KZ', 1),
(1560, 127, 'Ошакты', '%d0%9e%d1%88%d0%b0%d0%ba%d1%82%d1%8b', 'KZ', 1),
(1561, 127, 'Шубар', '%d0%a8%d1%83%d0%b1%d0%b0%d1%80', 'KZ', 1),
(1562, 127, 'Сайрам', '%d0%a1%d0%b0%d0%b9%d1%80%d0%b0%d0%bc', 'KZ', 1),
(1563, 127, 'Сарыагаш', '%d0%a1%d0%b0%d1%80%d1%8b%d0%b0%d0%b3%d0%b0%d1%88', 'KZ', 1),
(1564, 127, 'Тайынша', '%d0%a2%d0%b0%d0%b9%d1%8b%d0%bd%d1%88%d0%b0-1', 'KZ', 1),
(1565, 127, 'Туркестан', '%d0%a2%d1%83%d1%80%d0%ba%d0%b5%d1%81%d1%82%d0%b0%d0%bd', 'KZ', 1),
(1566, 127, 'Чилик', '%d0%a7%d0%b8%d0%bb%d0%b8%d0%ba', 'KZ', 1),
(1567, 127, 'Шардара', '%d0%a8%d0%b0%d1%80%d0%b4%d0%b0%d1%80%d0%b0', 'KZ', 1),
(1568, 127, 'Шымкент', '%d0%a8%d1%8b%d0%bc%d0%ba%d0%b5%d0%bd%d1%82', 'KZ', 1),
(1569, 128, 'Минск', '%d0%9c%d0%b8%d0%bd%d1%81%d0%ba', 'BY', 1),
(1570, 128, 'Березино', '%d0%91%d0%b5%d1%80%d0%b5%d0%b7%d0%b8%d0%bd%d0%be', 'BY', 1),
(1571, 128, 'Борисов', '%d0%91%d0%be%d1%80%d0%b8%d1%81%d0%be%d0%b2', 'BY', 1),
(1572, 128, 'Вилейка', '%d0%92%d0%b8%d0%bb%d0%b5%d0%b9%d0%ba%d0%b0', 'BY', 1),
(1573, 128, 'Воложин', '%d0%92%d0%be%d0%bb%d0%be%d0%b6%d0%b8%d0%bd', 'BY', 1),
(1574, 128, 'Дзержинск', '%d0%94%d0%b7%d0%b5%d1%80%d0%b6%d0%b8%d0%bd%d1%81%d0%ba-1', 'BY', 1),
(1575, 128, 'Жодино', '%d0%96%d0%be%d0%b4%d0%b8%d0%bd%d0%be', 'BY', 1),
(1576, 128, 'Заславль', '%d0%97%d0%b0%d1%81%d0%bb%d0%b0%d0%b2%d0%bb%d1%8c', 'BY', 1),
(1577, 128, 'Клецк', '%d0%9a%d0%bb%d0%b5%d1%86%d0%ba', 'BY', 1),
(1578, 128, 'Копыль', '%d0%9a%d0%be%d0%bf%d1%8b%d0%bb%d1%8c', 'BY', 1),
(1579, 128, 'Крупки', '%d0%9a%d1%80%d1%83%d0%bf%d0%ba%d0%b8', 'BY', 1),
(1580, 128, 'Логойск', '%d0%9b%d0%be%d0%b3%d0%be%d0%b9%d1%81%d0%ba', 'BY', 1),
(1581, 128, 'Любань', '%d0%9b%d1%8e%d0%b1%d0%b0%d0%bd%d1%8c-1', 'BY', 1),
(1582, 128, 'Марьина Горка', '%d0%9c%d0%b0%d1%80%d1%8c%d0%b8%d0%bd%d0%b0-%d0%93%d0%be%d1%8', 'BY', 1),
(1583, 128, 'Молодечно', '%d0%9c%d0%be%d0%bb%d0%be%d0%b4%d0%b5%d1%87%d0%bd%d0%be', 'BY', 1),
(1584, 128, 'Мядель', '%d0%9c%d1%8f%d0%b4%d0%b5%d0%bb%d1%8c', 'BY', 1),
(1585, 128, 'Несвиж', '%d0%9d%d0%b5%d1%81%d0%b2%d0%b8%d0%b6', 'BY', 1),
(1586, 128, 'Слуцк', '%d0%a1%d0%bb%d1%83%d1%86%d0%ba', 'BY', 1),
(1587, 128, 'Смолевичи', '%d0%a1%d0%bc%d0%be%d0%bb%d0%b5%d0%b2%d0%b8%d1%87%d0%b8', 'BY', 1),
(1588, 128, 'Солигорск', '%d0%a1%d0%be%d0%bb%d0%b8%d0%b3%d0%be%d1%80%d1%81%d0%ba', 'BY', 1),
(1589, 128, 'Старые Дороги', '%d0%a1%d1%82%d0%b0%d1%80%d1%8b%d0%b5-%d0%94%d0%be%d1%80%d0%b', 'BY', 1),
(1590, 128, 'Столбцы', '%d0%a1%d1%82%d0%be%d0%bb%d0%b1%d1%86%d1%8b', 'BY', 1),
(1591, 128, 'Узда', '%d0%a3%d0%b7%d0%b4%d0%b0', 'BY', 1),
(1592, 128, 'Фаниполь', '%d0%a4%d0%b0%d0%bd%d0%b8%d0%bf%d0%be%d0%bb%d1%8c', 'BY', 1),
(1593, 128, 'Червень', '%d0%a7%d0%b5%d1%80%d0%b2%d0%b5%d0%bd%d1%8c', 'BY', 1),
(1594, 129, 'Витебск', '%d0%92%d0%b8%d1%82%d0%b5%d0%b1%d1%81%d0%ba', 'BY', 1),
(1595, 129, 'Барань', '%d0%91%d0%b0%d1%80%d0%b0%d0%bd%d1%8c', 'BY', 1),
(1596, 129, 'Браслав', '%d0%91%d1%80%d0%b0%d1%81%d0%bb%d0%b0%d0%b2', 'BY', 1),
(1597, 129, 'Верхнедвинск', '%d0%92%d0%b5%d1%80%d1%85%d0%bd%d0%b5%d0%b4%d0%b2%d0%b8%d0%bd', 'BY', 1),
(1598, 129, 'Глубокое', '%d0%93%d0%bb%d1%83%d0%b1%d0%be%d0%ba%d0%be%d0%b5', 'BY', 1),
(1599, 129, 'Городок', '%d0%93%d0%be%d1%80%d0%be%d0%b4%d0%be%d0%ba', 'BY', 1),
(1600, 129, 'Дисна', '%d0%94%d0%b8%d1%81%d0%bd%d0%b0', 'BY', 1),
(1601, 129, 'Докшицы', '%d0%94%d0%be%d0%ba%d1%88%d0%b8%d1%86%d1%8b', 'BY', 1),
(1602, 129, 'Дубровно', '%d0%94%d1%83%d0%b1%d1%80%d0%be%d0%b2%d0%bd%d0%be', 'BY', 1),
(1603, 129, 'Лепель', '%d0%9b%d0%b5%d0%bf%d0%b5%d0%bb%d1%8c', 'BY', 1),
(1604, 129, 'Лиозно', '%d0%9b%d0%b8%d0%be%d0%b7%d0%bd%d0%be', 'BY', 1),
(1605, 129, 'Миоры', '%d0%9c%d0%b8%d0%be%d1%80%d1%8b', 'BY', 1),
(1606, 129, 'Новолукомль', '%d0%9d%d0%be%d0%b2%d0%be%d0%bb%d1%83%d0%ba%d0%be%d0%bc%d0%bb', 'BY', 1),
(1607, 129, 'Новополоцк', '%d0%9d%d0%be%d0%b2%d0%be%d0%bf%d0%be%d0%bb%d0%be%d1%86%d0%ba', 'BY', 1),
(1608, 129, 'Орша', '%d0%9e%d1%80%d1%88%d0%b0', 'BY', 1),
(1609, 129, 'Полоцк', '%d0%9f%d0%be%d0%bb%d0%be%d1%86%d0%ba', 'BY', 1),
(1610, 129, 'Поставы', '%d0%9f%d0%be%d1%81%d1%82%d0%b0%d0%b2%d1%8b', 'BY', 1),
(1611, 129, 'Сенно', '%d0%a1%d0%b5%d0%bd%d0%bd%d0%be', 'BY', 1),
(1612, 129, 'Толочин', '%d0%a2%d0%be%d0%bb%d0%be%d1%87%d0%b8%d0%bd', 'BY', 1),
(1613, 129, 'Чашники', '%d0%a7%d0%b0%d1%88%d0%bd%d0%b8%d0%ba%d0%b8', 'BY', 1),
(1614, 130, 'Гомель', '%d0%93%d0%be%d0%bc%d0%b5%d0%bb%d1%8c', 'BY', 1),
(1615, 130, 'Буда-Кошелёво', '%d0%91%d1%83%d0%b4%d0%b0-%d0%9a%d0%be%d1%88%d0%b5%d0%bb%d1%9', 'BY', 1),
(1616, 130, 'Василевичи', '%d0%92%d0%b0%d1%81%d0%b8%d0%bb%d0%b5%d0%b2%d0%b8%d1%87%d0%b8', 'BY', 1),
(1617, 130, 'Ветка', '%d0%92%d0%b5%d1%82%d0%ba%d0%b0', 'BY', 1),
(1618, 130, 'Добруш', '%d0%94%d0%be%d0%b1%d1%80%d1%83%d1%88', 'BY', 1),
(1619, 130, 'Ельск', '%d0%95%d0%bb%d1%8c%d1%81%d0%ba', 'BY', 1),
(1620, 130, 'Житковичи', '%d0%96%d0%b8%d1%82%d0%ba%d0%be%d0%b2%d0%b8%d1%87%d0%b8', 'BY', 1),
(1621, 130, 'Жлобин', '%d0%96%d0%bb%d0%be%d0%b1%d0%b8%d0%bd', 'BY', 1),
(1622, 130, 'Калинковичи', '%d0%9a%d0%b0%d0%bb%d0%b8%d0%bd%d0%ba%d0%be%d0%b2%d0%b8%d1%87', 'BY', 1),
(1623, 130, 'Мозырь', '%d0%9c%d0%be%d0%b7%d1%8b%d1%80%d1%8c', 'BY', 1),
(1624, 130, 'Наровля', '%d0%9d%d0%b0%d1%80%d0%be%d0%b2%d0%bb%d1%8f', 'BY', 1),
(1625, 130, 'Петриков', '%d0%9f%d0%b5%d1%82%d1%80%d0%b8%d0%ba%d0%be%d0%b2', 'BY', 1),
(1626, 130, 'Речица', '%d0%a0%d0%b5%d1%87%d0%b8%d1%86%d0%b0', 'BY', 1),
(1627, 130, 'Рогачёв', '%d0%a0%d0%be%d0%b3%d0%b0%d1%87%d1%91%d0%b2', 'BY', 1),
(1628, 130, 'Светлогорск', '%d0%a1%d0%b2%d0%b5%d1%82%d0%bb%d0%be%d0%b3%d0%be%d1%80%d1%81', 'BY', 1),
(1629, 130, 'Туров', '%d0%a2%d1%83%d1%80%d0%be%d0%b2', 'BY', 1),
(1630, 130, 'Хойники', '%d0%a5%d0%be%d0%b9%d0%bd%d0%b8%d0%ba%d0%b8', 'BY', 1),
(1631, 130, 'Чечерск', '%d0%a7%d0%b5%d1%87%d0%b5%d1%80%d1%81%d0%ba', 'BY', 1),
(1632, 131, 'Брест', '%d0%91%d1%80%d0%b5%d1%81%d1%82', 'BY', 1),
(1633, 131, 'Барановичи', '%d0%91%d0%b0%d1%80%d0%b0%d0%bd%d0%be%d0%b2%d0%b8%d1%87%d0%b8', 'BY', 1),
(1634, 131, 'Белоозёрск', '%d0%91%d0%b5%d0%bb%d0%be%d0%be%d0%b7%d1%91%d1%80%d1%81%d0%ba', 'BY', 1),
(1635, 131, 'Берёза', '%d0%91%d0%b5%d1%80%d1%91%d0%b7%d0%b0', 'BY', 1),
(1636, 131, 'Высокое', '%d0%92%d1%8b%d1%81%d0%be%d0%ba%d0%be%d0%b5', 'BY', 1),
(1637, 131, 'Ганцевичи', '%d0%93%d0%b0%d0%bd%d1%86%d0%b5%d0%b2%d0%b8%d1%87%d0%b8', 'BY', 1),
(1638, 131, 'Давид-Городок', '%d0%94%d0%b0%d0%b2%d0%b8%d0%b4-%d0%93%d0%be%d1%80%d0%be%d0%b', 'BY', 1),
(1639, 131, 'Дрогичин', '%d0%94%d1%80%d0%be%d0%b3%d0%b8%d1%87%d0%b8%d0%bd', 'BY', 1),
(1640, 131, 'Жабинка', '%d0%96%d0%b0%d0%b1%d0%b8%d0%bd%d0%ba%d0%b0', 'BY', 1),
(1641, 131, 'Иваново', '%d0%98%d0%b2%d0%b0%d0%bd%d0%be%d0%b2%d0%be-1', 'BY', 1),
(1642, 131, 'Ивацевичи', '%d0%98%d0%b2%d0%b0%d1%86%d0%b5%d0%b2%d0%b8%d1%87%d0%b8', 'BY', 1),
(1643, 131, 'Каменец', '%d0%9a%d0%b0%d0%bc%d0%b5%d0%bd%d0%b5%d1%86', 'BY', 1),
(1644, 131, 'Кобрин', '%d0%9a%d0%be%d0%b1%d1%80%d0%b8%d0%bd', 'BY', 1),
(1645, 131, 'Коссово', '%d0%9a%d0%be%d1%81%d1%81%d0%be%d0%b2%d0%be', 'BY', 1),
(1646, 131, 'Лунинец', '%d0%9b%d1%83%d0%bd%d0%b8%d0%bd%d0%b5%d1%86', 'BY', 1),
(1647, 131, 'Ляховичи', '%d0%9b%d1%8f%d1%85%d0%be%d0%b2%d0%b8%d1%87%d0%b8', 'BY', 1),
(1648, 131, 'Малорита', '%d0%9c%d0%b0%d0%bb%d0%be%d1%80%d0%b8%d1%82%d0%b0', 'BY', 1),
(1649, 131, 'Микашевичи', '%d0%9c%d0%b8%d0%ba%d0%b0%d1%88%d0%b5%d0%b2%d0%b8%d1%87%d0%b8', 'BY', 1),
(1650, 131, 'Пинск', '%d0%9f%d0%b8%d0%bd%d1%81%d0%ba', 'BY', 1),
(1651, 131, 'Пружаны', '%d0%9f%d1%80%d1%83%d0%b6%d0%b0%d0%bd%d1%8b', 'BY', 1),
(1652, 131, 'Столин', '%d0%a1%d1%82%d0%be%d0%bb%d0%b8%d0%bd', 'BY', 1),
(1653, 132, 'Гродно', '%d0%93%d1%80%d0%be%d0%b4%d0%bd%d0%be', 'BY', 1),
(1654, 132, 'Берёзовка', '%d0%91%d0%b5%d1%80%d1%91%d0%b7%d0%be%d0%b2%d0%ba%d0%b0', 'BY', 1),
(1655, 132, 'Волковыск', '%d0%92%d0%be%d0%bb%d0%ba%d0%be%d0%b2%d1%8b%d1%81%d0%ba', 'BY', 1),
(1656, 132, 'Дятлово', '%d0%94%d1%8f%d1%82%d0%bb%d0%be%d0%b2%d0%be', 'BY', 1),
(1657, 132, 'Ивье', '%d0%98%d0%b2%d1%8c%d0%b5', 'BY', 1),
(1658, 132, 'Лида', '%d0%9b%d0%b8%d0%b4%d0%b0', 'BY', 1),
(1659, 132, 'Мосты', '%d0%9c%d0%be%d1%81%d1%82%d1%8b', 'BY', 1),
(1660, 132, 'Новогрудок', '%d0%9d%d0%be%d0%b2%d0%be%d0%b3%d1%80%d1%83%d0%b4%d0%be%d0%ba', 'BY', 1),
(1661, 132, 'Островец', '%d0%9e%d1%81%d1%82%d1%80%d0%be%d0%b2%d0%b5%d1%86', 'BY', 1),
(1662, 132, 'Ошмяны', '%d0%9e%d1%88%d0%bc%d1%8f%d0%bd%d1%8b', 'BY', 1),
(1663, 132, 'Свислочь', '%d0%a1%d0%b2%d0%b8%d1%81%d0%bb%d0%be%d1%87%d1%8c', 'BY', 1),
(1664, 132, 'Скидель', '%d0%a1%d0%ba%d0%b8%d0%b4%d0%b5%d0%bb%d1%8c', 'BY', 1),
(1665, 132, 'Слоним', '%d0%a1%d0%bb%d0%be%d0%bd%d0%b8%d0%bc', 'BY', 1),
(1666, 132, 'Сморгонь', '%d0%a1%d0%bc%d0%be%d1%80%d0%b3%d0%be%d0%bd%d1%8c', 'BY', 1),
(1667, 132, 'Щучин', '%d0%a9%d1%83%d1%87%d0%b8%d0%bd', 'BY', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_city_area`
--

CREATE TABLE `oc_t_city_area` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `fk_i_city_id` int(10) UNSIGNED NOT NULL,
  `s_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_city_seo`
--

CREATE TABLE `oc_t_city_seo` (
  `seo_city_id` int(10) UNSIGNED NOT NULL,
  `seo_title` varchar(800) DEFAULT NULL,
  `seo_description` varchar(1200) DEFAULT NULL,
  `seo_keywords` varchar(800) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_city_stats`
--

CREATE TABLE `oc_t_city_stats` (
  `fk_i_city_id` int(10) UNSIGNED NOT NULL,
  `i_num_items` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_t_city_stats`
--

INSERT INTO `oc_t_city_stats` (`fk_i_city_id`, `i_num_items`) VALUES
(19, 0),
(27, 0),
(127, 0),
(438, 0),
(5, 1),
(16, 1),
(29, 1),
(45, 1),
(78, 1),
(91, 1),
(132, 1),
(225, 1),
(376, 1),
(456, 1),
(607, 1),
(706, 1),
(774, 1),
(862, 1),
(964, 1),
(1044, 1),
(1093, 1),
(1165, 1),
(1218, 1),
(1554, 1),
(3, 2),
(802, 2),
(525, 5);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_country`
--

CREATE TABLE `oc_t_country` (
  `pk_c_code` char(2) NOT NULL,
  `s_name` varchar(80) NOT NULL,
  `s_slug` varchar(80) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_t_country`
--

INSERT INTO `oc_t_country` (`pk_c_code`, `s_name`, `s_slug`) VALUES
('BY', 'Беларусь', '%d0%91%d0%b5%d0%bb%d0%b0%d1%80%d1%83%d1%81%d1%8c'),
('KZ', 'Казахстан', '%d0%9a%d0%b0%d0%b7%d0%b0%d1%85%d1%81%d1%82%d0%b0%d0%bd'),
('RU', 'Россия', '%d0%a0%d0%be%d1%81%d1%81%d0%b8%d1%8f'),
('UA', 'Украина', '%d0%a3%d0%ba%d1%80%d0%b0%d0%b8%d0%bd%d0%b0');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_country_stats`
--

CREATE TABLE `oc_t_country_stats` (
  `fk_c_country_code` char(2) NOT NULL,
  `i_num_items` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_t_country_stats`
--

INSERT INTO `oc_t_country_stats` (`fk_c_country_code`, `i_num_items`) VALUES
('BY', 0),
('KZ', 0),
('UA', 2),
('RU', 8);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_cron`
--

CREATE TABLE `oc_t_cron` (
  `e_type` enum('INSTANT','HOURLY','DAILY','WEEKLY','CUSTOM') NOT NULL,
  `d_last_exec` datetime NOT NULL,
  `d_next_exec` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_t_cron`
--

INSERT INTO `oc_t_cron` (`e_type`, `d_last_exec`, `d_next_exec`) VALUES
('HOURLY', '2019-06-28 11:13:47', '2019-06-28 12:13:00'),
('DAILY', '2019-06-28 11:13:47', '2019-06-29 11:13:00'),
('WEEKLY', '2019-06-28 11:13:47', '2019-07-05 11:13:00');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_currency`
--

CREATE TABLE `oc_t_currency` (
  `pk_c_code` char(3) NOT NULL,
  `s_name` varchar(40) NOT NULL,
  `s_description` varchar(80) DEFAULT NULL,
  `b_enabled` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_t_currency`
--

INSERT INTO `oc_t_currency` (`pk_c_code`, `s_name`, `s_description`, `b_enabled`) VALUES
('EUR', 'European Union euro', 'Euro €', 1),
('RUB', 'Russia', 'Руб', 1),
('USD', 'United States dollar', 'Dollar US$', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_home_seo`
--

CREATE TABLE `oc_t_home_seo` (
  `seo_home_id` int(10) UNSIGNED NOT NULL,
  `seo_title` varchar(800) DEFAULT NULL,
  `seo_description` varchar(1200) DEFAULT NULL,
  `seo_keywords` varchar(800) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_im_block`
--

CREATE TABLE `oc_t_im_block` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `i_user_id` int(11) DEFAULT NULL,
  `s_block_email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_im_messages`
--

CREATE TABLE `oc_t_im_messages` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `fk_i_thread_id` int(11) DEFAULT NULL,
  `i_type` int(1) DEFAULT '0',
  `i_read` int(1) DEFAULT '0',
  `i_email_sent` int(1) DEFAULT '0',
  `s_message` varchar(5000) DEFAULT NULL,
  `s_file` varchar(100) DEFAULT NULL,
  `d_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_im_threads`
--

CREATE TABLE `oc_t_im_threads` (
  `i_thread_id` int(10) UNSIGNED NOT NULL,
  `s_title` varchar(200) DEFAULT NULL,
  `fk_i_item_id` int(11) DEFAULT NULL,
  `i_from_user_id` int(11) DEFAULT NULL,
  `s_from_user_name` varchar(100) DEFAULT NULL,
  `s_from_user_email` varchar(100) DEFAULT NULL,
  `i_from_user_notify` int(1) DEFAULT '1',
  `s_from_secret` varchar(20) DEFAULT NULL,
  `i_to_user_id` int(11) DEFAULT NULL,
  `s_to_user_name` varchar(100) DEFAULT NULL,
  `s_to_user_email` varchar(100) DEFAULT NULL,
  `i_to_user_notify` int(1) DEFAULT '1',
  `s_to_secret` varchar(20) DEFAULT NULL,
  `i_flag` int(1) DEFAULT '0',
  `i_offer_id` int(11) DEFAULT NULL,
  `d_datetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_item`
--

CREATE TABLE `oc_t_item` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `fk_i_user_id` int(10) UNSIGNED DEFAULT NULL,
  `fk_i_category_id` int(10) UNSIGNED NOT NULL,
  `dt_pub_date` datetime NOT NULL,
  `dt_mod_date` datetime DEFAULT NULL,
  `f_price` float DEFAULT NULL,
  `i_price` bigint(20) DEFAULT NULL,
  `fk_c_currency_code` char(3) DEFAULT NULL,
  `s_contact_name` varchar(100) DEFAULT NULL,
  `s_contact_email` varchar(140) NOT NULL,
  `s_ip` varchar(64) NOT NULL DEFAULT '',
  `b_premium` tinyint(1) NOT NULL DEFAULT '0',
  `b_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `b_active` tinyint(1) NOT NULL DEFAULT '0',
  `b_spam` tinyint(1) NOT NULL DEFAULT '0',
  `s_secret` varchar(40) DEFAULT NULL,
  `b_show_email` tinyint(1) DEFAULT NULL,
  `dt_expiration` datetime NOT NULL DEFAULT '9999-12-31 23:59:59'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_t_item`
--

INSERT INTO `oc_t_item` (`pk_i_id`, `fk_i_user_id`, `fk_i_category_id`, `dt_pub_date`, `dt_mod_date`, `f_price`, `i_price`, `fk_c_currency_code`, `s_contact_name`, `s_contact_email`, `s_ip`, `b_premium`, `b_enabled`, `b_active`, `b_spam`, `s_secret`, `b_show_email`, `dt_expiration`) VALUES
(49, NULL, 96, '2019-09-01 10:05:10', NULL, NULL, 10000000000, 'RUB', 'Артем', 'hotreferat@ya.ru', '109.254.130.36', 0, 1, 1, 0, 'u5VtSrKW', 0, '9999-12-31 23:59:59');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_item_attribute`
--

CREATE TABLE `oc_t_item_attribute` (
  `pk_i_id` int(11) NOT NULL,
  `fk_i_item_id` int(10) UNSIGNED NOT NULL,
  `fk_i_attribute_id` int(11) NOT NULL,
  `fk_i_attribute_value_id` int(11) DEFAULT NULL,
  `s_value` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_item_car_attr`
--

CREATE TABLE `oc_t_item_car_attr` (
  `fk_i_item_id` int(10) UNSIGNED NOT NULL,
  `i_year` int(4) UNSIGNED DEFAULT NULL,
  `i_doors` int(1) UNSIGNED DEFAULT NULL,
  `i_seats` int(4) UNSIGNED DEFAULT NULL,
  `i_mileage` int(10) UNSIGNED DEFAULT NULL,
  `i_engine_size` int(10) UNSIGNED DEFAULT NULL,
  `fk_i_make_id` int(2) UNSIGNED DEFAULT NULL,
  `fk_i_model_id` int(2) UNSIGNED DEFAULT NULL,
  `i_num_airbags` int(2) UNSIGNED DEFAULT NULL,
  `e_transmission` enum('MANUAL','AUTO') DEFAULT NULL,
  `e_fuel` enum('DIESEL','GASOLINE','ELECTRIC-HIBRID','OTHER') DEFAULT NULL,
  `e_seller` enum('DEALER','OWNER') DEFAULT NULL,
  `b_warranty` tinyint(1) DEFAULT NULL,
  `b_new` tinyint(1) DEFAULT NULL,
  `i_power` int(10) UNSIGNED DEFAULT NULL,
  `e_power_unit` enum('KW','CV','CH','KM','HP','PS','PK','CP') DEFAULT NULL,
  `i_gears` int(1) UNSIGNED DEFAULT NULL,
  `fk_vehicle_type_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_t_item_car_attr`
--

INSERT INTO `oc_t_item_car_attr` (`fk_i_item_id`, `i_year`, `i_doors`, `i_seats`, `i_mileage`, `i_engine_size`, `fk_i_make_id`, `fk_i_model_id`, `i_num_airbags`, `e_transmission`, `e_fuel`, `e_seller`, `b_warranty`, `b_new`, `i_power`, `e_power_unit`, `i_gears`, `fk_vehicle_type_id`) VALUES
(49, 2000, 3, 3, 10000, 500, 4, 630, 2, 'AUTO', 'ELECTRIC-HIBRID', 'OWNER', 1, 0, 1000, 'KW', 7, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_item_car_make_attr`
--

CREATE TABLE `oc_t_item_car_make_attr` (
  `pk_i_id` int(2) UNSIGNED NOT NULL,
  `s_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_t_item_car_make_attr`
--

INSERT INTO `oc_t_item_car_make_attr` (`pk_i_id`, `s_name`) VALUES
(1, 'Acura'),
(2, 'Audi'),
(3, 'Alfa Romeo'),
(4, 'Aston Martin'),
(5, 'BMW'),
(6, 'Buick'),
(7, 'Cadillac'),
(8, 'Chevrolet'),
(9, 'Chrysler'),
(10, 'Datsun'),
(11, 'Dodge'),
(12, 'FAW'),
(14, 'Ferrari'),
(15, 'Fiat'),
(16, 'Ford'),
(17, 'GEO'),
(18, 'GMC'),
(19, 'Honda'),
(20, 'Hummer'),
(21, 'Hyundai'),
(22, 'Infiniti'),
(24, 'Jaguar'),
(25, 'Jeep'),
(26, 'Lamborghini'),
(27, 'Land Rover'),
(28, 'Lincoln'),
(29, 'Maserati'),
(30, 'Mazda'),
(31, 'Mercedes Benz'),
(32, 'Mercury'),
(34, 'MG'),
(35, 'Mini'),
(36, 'Mitsubishi'),
(37, 'Nissan'),
(38, 'Oldsmobile'),
(39, 'Peugeot'),
(40, 'Plymouth'),
(41, 'Pontiac'),
(42, 'Porsche'),
(44, 'Renault'),
(45, 'RollsRoyce'),
(47, 'Saab'),
(48, 'Seat'),
(49, 'Smart'),
(50, 'Suzuki'),
(51, 'Toyota'),
(52, 'Volkswagen'),
(53, 'Volvo'),
(54, 'AC'),
(55, 'Adler'),
(56, 'Alpina'),
(57, 'Alpine'),
(58, 'AMC'),
(59, 'Ariel'),
(60, 'Aro'),
(61, 'Asia'),
(62, 'Austin'),
(63, 'Austin Healey'),
(64, 'Bentley'),
(65, 'Borgward'),
(66, 'Brilliance'),
(67, 'Bristol'),
(68, 'Bugatti'),
(70, 'BYD'),
(71, 'Callaway'),
(72, 'Carbodies'),
(73, 'Caterham'),
(74, 'Chana'),
(75, 'Changan'),
(76, 'ChangFeng'),
(77, 'Changhe'),
(78, 'Chery'),
(79, 'Citroen'),
(80, 'Coggiola'),
(81, 'Dacia'),
(82, 'Dadi'),
(83, 'Daewoo'),
(84, 'Daihatsu'),
(85, 'Daimler'),
(86, 'Dallas'),
(88, 'Derways'),
(89, 'DongFeng'),
(90, 'Doninvest'),
(91, 'DS'),
(92, 'Eagle'),
(93, 'Efini'),
(94, 'Excalibur'),
(95, 'Foton'),
(96, 'FSO'),
(97, 'Fuqi'),
(98, 'Geely'),
(99, 'Genesis'),
(100, 'Great Wall'),
(101, 'Groz'),
(102, 'Hafei'),
(103, 'Haima'),
(104, 'Haval'),
(105, 'Hawtai'),
(106, 'Hindustan'),
(107, 'Holden'),
(108, 'HuangHai'),
(109, 'Hurtan'),
(110, 'Innocenti'),
(111, 'Invicta'),
(112, 'Iran Khodro'),
(113, 'Isdera'),
(114, 'JAC'),
(115, 'Jiangnan'),
(116, 'Jinbei'),
(117, 'JMC'),
(118, 'Kia'),
(119, 'Koenigsegg'),
(120, 'Lancia'),
(122, 'Landwind'),
(123, 'Lexus'),
(124, 'Lifan'),
(126, 'Lotus'),
(127, 'LTI'),
(128, 'Luxgen'),
(129, 'Isuzu'),
(130, 'Mahindra'),
(131, 'Marcos'),
(132, 'Marlin'),
(133, 'Marussia'),
(134, 'Maruti'),
(135, 'Maybach'),
(136, 'McLaren'),
(137, 'Mega'),
(138, 'Metrocab'),
(139, 'Minelli'),
(140, 'Mitsuoka'),
(141, 'Monte Carlo'),
(142, 'Morgan'),
(143, 'Noble'),
(144, 'Nysa'),
(145, 'Opel'),
(146, 'Osca'),
(147, 'Packard'),
(148, 'Pagani'),
(149, 'Panoz'),
(150, 'Paykan'),
(151, 'Perodua'),
(152, 'Premier'),
(153, 'Proton'),
(154, 'Puma'),
(155, 'Qoros'),
(156, 'Qvale'),
(157, 'RAM'),
(158, 'Ravon'),
(159, 'Reliant'),
(160, 'Renaissance Cars'),
(161, 'Saleen'),
(162, 'Santana'),
(163, 'Saturn'),
(164, 'Scion'),
(165, 'Skoda'),
(166, 'SsangYong'),
(167, 'Subaru'),
(168, 'Talbot'),
(169, 'Tata'),
(170, 'Tatra'),
(171, 'Tesla'),
(172, 'Tianma'),
(173, 'Tianye'),
(174, 'Tofas'),
(175, 'TVR'),
(176, 'Vauxhall'),
(177, 'Vector'),
(178, 'Venturi'),
(179, 'Vortex'),
(180, 'Wartburg'),
(181, 'Westfield'),
(182, 'Wiesmann'),
(183, 'Willys'),
(184, 'Wuling'),
(185, 'Xin Kai'),
(186, 'Zastava'),
(187, 'Zibar'),
(188, 'Zotye'),
(189, 'ZX'),
(190, 'ВАЗ (Lada)'),
(191, 'ГАЗ'),
(192, 'ЗАЗ'),
(193, 'ЗИЛ'),
(194, 'ИЖ'),
(195, 'Комбат'),
(196, 'ЛуАЗ'),
(197, 'Москвич'),
(198, 'СМЗ'),
(199, 'ТагАЗ'),
(200, 'УАЗ'),
(201, 'Прочие авто'),
(202, 'Ronart'),
(203, 'Rover'),
(204, 'Samsung');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_item_car_model_attr`
--

CREATE TABLE `oc_t_item_car_model_attr` (
  `pk_i_id` int(2) UNSIGNED NOT NULL,
  `fk_i_make_id` int(2) UNSIGNED NOT NULL,
  `s_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_t_item_car_model_attr`
--

INSERT INTO `oc_t_item_car_model_attr` (`pk_i_id`, `fk_i_make_id`, `s_name`) VALUES
(1, 1, 'TL'),
(2, 1, 'MDX'),
(3, 1, 'RDX'),
(4, 1, 'RL'),
(5, 1, 'Integra'),
(6, 1, 'TSX'),
(7, 2, 'A1'),
(8, 2, 'A3'),
(9, 2, 'A4'),
(10, 2, 'A5'),
(11, 2, 'A6'),
(12, 2, 'A8'),
(13, 2, 'S3'),
(14, 2, 'S4'),
(15, 2, 'S5'),
(16, 2, 'S6'),
(17, 2, 'S8'),
(18, 2, 'RS4'),
(19, 2, 'RS6'),
(20, 2, 'R8'),
(21, 2, 'Allroad'),
(22, 2, 'Q5'),
(23, 2, 'Q7'),
(24, 3, '156'),
(25, 3, '147'),
(29, 5, '1600'),
(30, 5, 'M Z4'),
(31, 5, 'M1'),
(32, 5, 'M3'),
(33, 5, 'M5'),
(34, 5, 'M6'),
(35, 5, 'Serie 1'),
(36, 5, 'Serie 3'),
(37, 5, 'Serie 5'),
(38, 5, 'Serie 6'),
(39, 5, 'Serie 7'),
(40, 5, 'Serie 8'),
(41, 5, 'X1'),
(42, 5, 'X3'),
(43, 5, 'X5'),
(44, 5, 'X6'),
(45, 5, 'X6 M'),
(46, 5, 'Z3'),
(47, 5, 'Z4'),
(48, 6, 'Enclave'),
(49, 6, 'LaCrosse'),
(50, 6, 'LeSabre'),
(51, 6, 'Otro'),
(52, 6, 'Regal'),
(53, 6, 'Riviera'),
(54, 7, 'BLS'),
(55, 7, 'Catera'),
(56, 7, 'Concours'),
(57, 7, 'CTS'),
(58, 7, 'Deville'),
(59, 7, 'DHS'),
(60, 7, 'Escalade'),
(61, 7, 'Seville'),
(62, 7, 'SRX'),
(63, 7, 'STS'),
(64, 8, '1500'),
(65, 8, '210'),
(66, 8, '400'),
(67, 8, '454'),
(68, 8, 'Apache'),
(69, 8, 'Astra'),
(70, 8, 'Astro'),
(71, 8, 'Avalanche'),
(72, 8, 'Aveo'),
(73, 8, 'Bell Air'),
(74, 8, 'Blazer'),
(75, 8, 'Bravada'),
(76, 8, 'C 350'),
(77, 8, 'C 3500'),
(78, 8, 'C-15'),
(79, 8, 'C-20'),
(80, 8, 'C36'),
(81, 8, 'Camaro'),
(82, 8, 'Captiva'),
(83, 8, 'Cavalier'),
(84, 8, 'Chevy'),
(85, 8, 'Chevy Monza'),
(86, 8, 'Cheyenne'),
(87, 8, 'Citation-x11'),
(88, 8, 'Colorado'),
(89, 8, 'Corsa'),
(90, 8, 'Corsica'),
(91, 8, 'Corvette'),
(92, 8, 'Cruze'),
(93, 8, 'Custom'),
(94, 8, 'Cutlass'),
(95, 8, 'Deluxe'),
(96, 8, 'El Camino'),
(97, 8, 'Epica'),
(98, 8, 'Equinox'),
(99, 8, 'Eurocar'),
(100, 8, 'G-30'),
(101, 8, 'HHR'),
(102, 8, 'Impala'),
(103, 8, 'Kodiac'),
(104, 8, 'LUV'),
(105, 8, 'Malibu'),
(106, 8, 'Matiz'),
(107, 8, 'Meriva'),
(108, 8, 'Montecarlo'),
(109, 8, 'Monza'),
(110, 8, 'Monza C2'),
(111, 8, 'OldsMobile'),
(112, 8, 'Optra'),
(113, 8, 'Pop'),
(114, 8, 'S 10'),
(115, 8, 'Safari'),
(116, 8, 'Sierra'),
(117, 8, 'Silhouete'),
(118, 8, 'Silverado'),
(119, 8, 'Sonora'),
(120, 8, 'Spark'),
(121, 8, 'Suburban'),
(122, 8, 'Tahoe'),
(123, 8, 'Tornado'),
(124, 8, 'Tracker'),
(125, 8, 'Trailbalzer'),
(126, 8, 'Transport'),
(127, 8, 'Uplander'),
(128, 8, 'Vanette'),
(129, 8, 'Vectra'),
(130, 8, 'Venture'),
(131, 8, 'Yukon'),
(132, 8, 'Zafira'),
(133, 9, '300 C'),
(134, 9, '300 M'),
(135, 9, 'Aspen'),
(136, 9, 'Atos'),
(137, 9, 'Caravan'),
(138, 9, 'Cirrus'),
(139, 9, 'Concorde'),
(140, 9, 'Crossfire'),
(141, 9, 'D-350'),
(142, 9, 'Grand Caravan'),
(143, 9, 'Grand Voyager'),
(144, 9, 'Intrepid'),
(145, 9, 'Le Baron'),
(146, 9, 'LHS'),
(147, 9, 'Neon'),
(148, 9, 'New Yorker'),
(149, 9, 'Pacifica'),
(150, 9, 'PT Cruiser'),
(151, 9, 'RAM'),
(152, 9, 'Sebring'),
(153, 9, 'Shadow'),
(154, 9, 'Stratus'),
(155, 9, 'Town Country'),
(156, 9, 'Valiant'),
(157, 9, 'Voyager'),
(159, 11, '1000'),
(160, 11, 'Atos'),
(161, 11, 'Attitude'),
(162, 11, 'Avenger'),
(163, 11, 'Caravan'),
(164, 11, 'Challenger'),
(165, 11, 'Charger'),
(166, 11, 'Coronet'),
(167, 11, 'D 600'),
(168, 11, 'D-150'),
(169, 11, 'D-250'),
(170, 11, 'D-350'),
(171, 11, 'Dakota'),
(172, 11, 'Dart'),
(173, 11, 'Durango'),
(174, 11, 'Grand Caravan'),
(175, 11, 'H-100'),
(176, 11, 'Intrepid'),
(177, 11, 'Journey'),
(178, 11, 'Neon'),
(179, 11, 'Nitro'),
(180, 11, 'RAM'),
(181, 11, 'Royal Mónaco'),
(182, 11, 'Stealth'),
(183, 11, 'Stratus'),
(184, 11, 'Valiant'),
(185, 11, 'Vanette'),
(186, 11, 'Verna'),
(187, 11, 'Viper'),
(191, 14, '360'),
(192, 14, '430'),
(193, 14, '550'),
(194, 14, '575'),
(195, 14, '599'),
(196, 14, '612'),
(208, 16, 'Aerostar'),
(209, 16, 'Bronco'),
(210, 16, 'Contour'),
(211, 16, 'Cougar'),
(212, 16, 'Courier'),
(213, 16, 'Crown'),
(214, 16, 'E-150'),
(215, 16, 'Ecoline'),
(216, 16, 'EcoSport'),
(217, 16, 'Edge'),
(218, 16, 'Escape'),
(219, 16, 'Escort'),
(220, 16, 'Excurcion'),
(221, 16, 'Expedition'),
(222, 16, 'Explorer'),
(223, 16, 'F-100'),
(224, 16, 'F-150'),
(225, 16, 'F-200'),
(226, 16, 'F-250'),
(227, 16, 'F-350'),
(228, 16, 'F-450'),
(229, 16, 'F-550'),
(230, 16, 'Fairlane'),
(231, 16, 'Fairmont'),
(232, 16, 'Falcon'),
(233, 16, 'Fiesta'),
(234, 16, 'FiveHundred'),
(235, 16, 'Focus'),
(236, 16, 'Freestar'),
(237, 16, 'Fusion'),
(238, 16, 'Galaxie'),
(239, 16, 'Ghia'),
(240, 16, 'Grand Marquis'),
(241, 16, 'Ikon'),
(242, 16, 'Ka'),
(243, 16, 'Lobo'),
(244, 16, 'LTD'),
(245, 16, 'Maverick'),
(246, 16, 'Mercury'),
(247, 16, 'Mondeo'),
(248, 16, 'Mustang'),
(249, 16, 'Mystique'),
(250, 16, 'Ranger'),
(251, 16, 'Sable'),
(252, 16, 'Taurus'),
(253, 16, 'ThunderBird'),
(254, 16, 'Topaz'),
(255, 16, 'Transit'),
(256, 16, 'Vanette'),
(257, 16, 'Windstar'),
(258, 17, 'Metro'),
(259, 18, 'Acadia'),
(260, 18, 'Canyon'),
(261, 18, 'Jimmy'),
(262, 18, 'Safari'),
(263, 18, 'Savana Van'),
(264, 18, 'Sierra'),
(265, 18, 'Sonoma'),
(266, 18, 'Yukon'),
(267, 19, 'Accord'),
(268, 19, 'City'),
(269, 19, 'Civic'),
(270, 19, 'Crosstour'),
(271, 19, 'CR-V'),
(272, 19, 'Fit'),
(273, 19, 'Odissey'),
(274, 19, 'Passaport'),
(275, 19, 'Pilot'),
(276, 19, 'Ridgeline'),
(277, 20, 'H1'),
(278, 20, 'H2'),
(279, 20, 'H2 Alpha'),
(280, 20, 'H3'),
(281, 20, 'H3 Alpha'),
(289, 24, 'S-Type'),
(290, 24, 'Vanden Plas'),
(291, 24, 'XK8'),
(292, 24, 'XKR'),
(293, 24, 'X-Type'),
(294, 25, 'Cherokee'),
(295, 25, 'CJ7'),
(296, 25, 'Commander'),
(297, 25, 'Compass'),
(298, 25, 'Grand Cherokee'),
(299, 25, 'Grand Wagon'),
(300, 25, 'Laredo'),
(301, 25, 'Liberty'),
(302, 25, 'Patriot'),
(303, 25, 'Rubicon'),
(304, 25, 'Sahara'),
(305, 25, 'Wagoneer'),
(306, 25, 'Wrangler'),
(309, 27, 'Defender'),
(310, 27, 'Discovery'),
(311, 27, 'FreeLander'),
(312, 27, 'LR2'),
(313, 27, 'LR3'),
(314, 27, 'RangeRover'),
(335, 31, '220'),
(336, 31, '230'),
(337, 31, '280 SE'),
(338, 31, '450'),
(339, 31, '450 SLC'),
(340, 31, '500SEL'),
(341, 31, 'B-Class'),
(342, 31, 'C-Class'),
(343, 31, 'CL-Class'),
(344, 31, 'CLK-Class'),
(345, 31, 'CLS-Class'),
(346, 31, 'A-Class'),
(347, 31, 'E-Class'),
(348, 31, 'G-Class'),
(349, 31, 'GL-Class'),
(350, 31, 'GLK-Class'),
(351, 31, 'ML-Class'),
(352, 31, 'R-Class'),
(353, 31, 'S-Class'),
(354, 31, 'SL-Class'),
(355, 31, 'SLK-Class'),
(356, 31, 'Sprinter'),
(357, 31, 'Unimog'),
(358, 31, 'Vito'),
(366, 34, 'Magnett'),
(367, 34, 'MG'),
(368, 34, 'MGA'),
(369, 34, 'MGB'),
(370, 34, 'TF'),
(371, 34, 'ZR'),
(372, 34, 'ZT'),
(373, 35, 'Cooper'),
(374, 35, 'Morris'),
(384, 37, '350Z'),
(385, 37, 'Almera'),
(386, 37, 'Altima'),
(387, 37, 'Aprio'),
(388, 37, 'Armada'),
(389, 37, 'Cabstar'),
(390, 37, 'Datsun'),
(391, 37, 'Estacas'),
(392, 37, 'Frontier'),
(393, 37, 'Lucino'),
(394, 37, 'Maxima'),
(395, 37, 'Micra'),
(396, 37, 'Murano'),
(397, 37, 'Nx 2000'),
(398, 37, 'Pathfinder'),
(399, 37, 'Pick Up'),
(400, 37, 'Platina'),
(401, 37, 'Quest'),
(402, 37, 'Rogue'),
(403, 37, 'Sakura'),
(404, 37, 'Samurai'),
(405, 37, 'Sentra'),
(406, 37, 'Serie 200'),
(407, 37, 'Serie 240'),
(408, 37, 'Serie 300'),
(409, 37, 'TIIDA'),
(410, 37, 'Titan'),
(411, 37, 'Tsuru'),
(412, 37, 'Urban'),
(413, 37, 'X-Terra'),
(414, 37, 'X-Trail'),
(428, 40, 'Grand Voyager'),
(429, 41, 'Aztek'),
(430, 41, 'Boneville'),
(431, 41, 'Fiero'),
(432, 41, 'Firebird'),
(433, 41, 'G3'),
(434, 41, 'G4'),
(435, 41, 'G5'),
(436, 41, 'G6'),
(437, 41, 'Grand Am'),
(438, 41, 'Grand Prix'),
(439, 41, 'GTO'),
(440, 41, 'Matiz'),
(441, 41, 'Montana'),
(442, 41, 'Solstice'),
(443, 41, 'Sunfire'),
(444, 41, 'Torrent'),
(445, 41, 'Trans Am'),
(446, 41, 'Transport'),
(447, 42, '550'),
(448, 42, '911'),
(449, 42, '914'),
(450, 42, '924'),
(451, 42, 'Boxter'),
(452, 42, 'Carrera GT'),
(453, 42, 'Cayenne'),
(454, 42, 'Cayman'),
(455, 42, 'GT3 Cup'),
(456, 42, 'Panamera'),
(466, 45, 'Silver Shadow'),
(550, 54, '378 GT Zagato'),
(551, 54, 'ACE'),
(552, 54, 'Aceca'),
(553, 54, 'Cobra'),
(554, 54, 'Другая'),
(555, 1, 'Vigor'),
(556, 1, 'ZDX'),
(557, 1, 'Другая'),
(558, 55, 'Trumpf'),
(559, 55, 'Другая'),
(560, 3, '159'),
(561, 3, '164'),
(562, 3, '166'),
(563, 3, '1750'),
(564, 3, '1900'),
(565, 3, '2000'),
(566, 3, '2300'),
(567, 3, '2600'),
(568, 3, '33'),
(569, 3, '4C'),
(570, 3, '75'),
(571, 3, '8C Competizione'),
(572, 3, '90'),
(573, 3, 'Alfa 6'),
(574, 3, 'Alfasud'),
(575, 3, 'Alfetta'),
(576, 3, 'Arna'),
(577, 3, 'Brera'),
(578, 3, 'Dauphine'),
(579, 3, 'Giulia'),
(580, 3, 'Giulietta'),
(581, 3, 'GT'),
(582, 3, 'GTV'),
(583, 3, 'Milano'),
(584, 3, 'MiTo'),
(585, 3, 'Montreal'),
(586, 3, 'S.Z./R.Z.'),
(587, 3, 'Spider'),
(588, 3, 'Stelvio'),
(589, 3, 'Другая'),
(590, 56, 'B10'),
(591, 56, 'B11'),
(592, 56, 'B12'),
(593, 56, 'B3'),
(594, 56, 'B4'),
(595, 56, 'B5'),
(596, 56, 'B6'),
(597, 56, 'B7'),
(598, 56, 'B8'),
(599, 56, 'D10'),
(600, 56, 'D3'),
(601, 56, 'D5'),
(602, 56, 'Roadster S'),
(603, 56, 'Roadster V8'),
(604, 56, 'XD3'),
(605, 56, 'Другая'),
(606, 57, 'A110'),
(607, 57, 'A610'),
(608, 57, 'Другая'),
(609, 58, 'Gremlin'),
(610, 58, 'Другая'),
(611, 59, 'Atom'),
(612, 59, 'Другая'),
(613, 60, '10'),
(614, 60, '24'),
(615, 60, 'Spartana'),
(616, 60, 'Другая'),
(617, 61, 'Hi-topic'),
(618, 61, 'Rocsta'),
(619, 61, 'Другая'),
(620, 4, 'Cygnet'),
(621, 4, 'DB11'),
(622, 4, 'DB2'),
(623, 4, 'DB2/4'),
(624, 4, 'DB4'),
(625, 4, 'DB5'),
(626, 4, 'DB6'),
(627, 4, 'DB7'),
(628, 4, 'DB9'),
(629, 4, 'DBS'),
(630, 4, 'Lagonda'),
(631, 4, 'One-77'),
(632, 4, 'Rapide'),
(633, 4, 'V12 Zagato'),
(634, 4, 'Vanquish'),
(635, 4, 'Vantage'),
(636, 4, 'Virage'),
(637, 4, 'Другая'),
(638, 2, 'Другая'),
(639, 62, 'Allegro'),
(640, 62, 'Mini Metro'),
(641, 62, 'Montego'),
(642, 62, 'Другая'),
(643, 63, '3000'),
(644, 63, 'Другая'),
(645, 5, 'Z8'),
(646, 5, 'Другая'),
(647, 64, 'Arnage'),
(648, 64, 'Azure'),
(649, 64, 'Bentayga'),
(650, 64, 'Brooklands'),
(651, 64, 'Continental'),
(652, 64, 'Continental Flying Spur'),
(653, 64, 'Continental GT'),
(654, 64, 'Eight'),
(655, 64, 'Flying Spur'),
(656, 64, 'Mark VI'),
(657, 64, 'Mulsanne'),
(658, 64, 'R Type'),
(659, 64, 'S-series'),
(660, 64, 'T-series'),
(661, 64, 'Turbo R'),
(662, 64, 'Другая'),
(663, 65, 'BX5'),
(664, 65, 'BX7'),
(665, 65, 'Другая'),
(666, 66, 'BS2'),
(667, 66, 'BS4'),
(668, 66, 'BS6'),
(669, 66, 'H230'),
(670, 66, 'H530'),
(671, 66, 'M1'),
(672, 66, 'M2'),
(673, 66, 'M3'),
(674, 66, 'V3'),
(675, 66, 'V5'),
(676, 66, 'Другая'),
(677, 67, 'Blenheim'),
(678, 67, 'Fighter'),
(679, 67, 'Speedster'),
(680, 67, 'Другая'),
(681, 68, 'Chiron'),
(682, 68, 'EB 110'),
(683, 68, 'EB 112'),
(684, 68, 'Type 57'),
(685, 68, 'Veyron'),
(686, 68, 'Другая'),
(687, 6, 'Roadmaster'),
(688, 6, 'Skylark'),
(689, 6, 'Special'),
(690, 6, 'Terraza'),
(691, 6, 'Другая'),
(692, 70, 'e6'),
(693, 70, 'F0'),
(694, 70, 'F3'),
(695, 70, 'F5'),
(696, 70, 'F6'),
(697, 70, 'F7'),
(698, 70, 'F8'),
(699, 70, 'Flyer'),
(700, 70, 'G3'),
(701, 70, 'G6'),
(702, 70, 'i6'),
(703, 70, 'L3'),
(704, 70, 'M6'),
(705, 70, 'S6'),
(706, 70, 'Другая'),
(707, 7, 'Другая'),
(708, 71, 'C12'),
(709, 71, 'Другая'),
(710, 72, 'FX4'),
(711, 72, 'Другая'),
(712, 73, '21'),
(713, 73, 'CSR'),
(714, 73, 'Seven'),
(715, 73, 'Другая'),
(716, 74, 'BenBen Mini'),
(717, 74, 'CS35'),
(718, 74, 'Другая'),
(719, 75, 'CS35'),
(720, 75, 'CS75'),
(721, 75, 'Eado'),
(722, 75, 'Eado XT'),
(723, 75, 'Raeton'),
(724, 75, 'Star Truck'),
(725, 75, 'Другая'),
(726, 76, 'Flying'),
(727, 76, 'SUV'),
(728, 76, 'Другая'),
(729, 77, 'Ideal'),
(730, 77, 'Другая'),
(731, 78, 'Amulet'),
(732, 78, 'Arauca'),
(733, 78, 'Arrizo 7'),
(734, 78, 'Bonus'),
(735, 78, 'Cowin'),
(736, 78, 'CrossEastar'),
(737, 78, 'E5'),
(738, 78, 'Eastar'),
(739, 78, 'Ego'),
(740, 78, 'Elara'),
(741, 78, 'Face'),
(742, 78, 'Fengyun'),
(743, 78, 'Flagcloud'),
(744, 78, 'Fora'),
(745, 78, 'Fulwin'),
(746, 78, 'Fulwin 2'),
(747, 78, 'IndiS'),
(748, 78, 'J1'),
(749, 78, 'J11'),
(750, 78, 'Jaggi'),
(751, 78, 'Karry'),
(752, 78, 'Kimo'),
(753, 78, 'M11'),
(754, 78, 'Oriental Son'),
(755, 78, 'Qiyun'),
(756, 78, 'QQ'),
(757, 78, 'QQ3'),
(758, 78, 'QQ6'),
(759, 78, 'Riich 2'),
(760, 78, 'Storm 2'),
(761, 78, 'Tiggo'),
(762, 78, 'Tiggo 2'),
(763, 78, 'Tiggo 3'),
(764, 78, 'Tiggo 5'),
(765, 78, 'Tiggo 7'),
(766, 78, 'Very'),
(767, 78, 'Windcloud'),
(768, 78, 'Другая'),
(769, 8, 'Другая'),
(770, 9, 'Другая'),
(771, 79, '2 CV'),
(772, 79, 'Ami'),
(773, 79, 'AX'),
(774, 79, 'Axel'),
(775, 79, 'Berlingo'),
(776, 79, 'Bijou'),
(777, 79, 'BX'),
(778, 79, 'C-Crosser'),
(779, 79, 'C-Elysee'),
(780, 79, 'C-Quatre'),
(781, 79, 'C-Triomphe'),
(782, 79, 'C-Zero'),
(783, 79, 'C1'),
(784, 79, 'C15'),
(785, 79, 'C2'),
(786, 79, 'C3'),
(787, 79, 'C3 AirCross'),
(788, 79, 'C3 Picasso'),
(789, 79, 'C35'),
(790, 79, 'C4'),
(791, 79, 'C4 AirCross'),
(792, 79, 'C4 Cactus'),
(793, 79, 'C4 L'),
(794, 79, 'C4 Picasso'),
(795, 79, 'C5'),
(796, 79, 'C5 AirCross'),
(797, 79, 'C6'),
(798, 79, 'C8'),
(799, 79, 'Chanson'),
(800, 79, 'CX'),
(801, 79, 'Dispatch'),
(802, 79, 'DS'),
(803, 79, 'DS3'),
(804, 79, 'DS4'),
(805, 79, 'DS5'),
(806, 79, 'Dyane'),
(807, 79, 'Evasion'),
(808, 79, 'Fukang'),
(809, 79, 'GS'),
(810, 79, 'ID'),
(811, 79, 'Jumpy'),
(812, 79, 'LN'),
(813, 79, 'Mehari'),
(814, 79, 'Nemo'),
(815, 79, 'Saxo'),
(816, 79, 'SM'),
(817, 79, 'SpaceTourer'),
(818, 79, 'Synergie'),
(819, 79, 'Visa'),
(820, 79, 'Xantia'),
(821, 79, 'XM'),
(822, 79, 'Xsara'),
(823, 79, 'Xsara Picasso'),
(824, 79, 'ZX'),
(825, 79, 'Другая'),
(826, 80, 'T-Rex'),
(827, 80, 'Другая'),
(828, 81, '1100'),
(829, 81, '1300'),
(830, 81, '1310'),
(831, 81, '1320'),
(832, 81, '1325 Liberta'),
(833, 81, '2000'),
(834, 81, '500'),
(835, 81, 'D6'),
(836, 81, 'Denem'),
(837, 81, 'Dokker'),
(838, 81, 'Duster'),
(839, 81, 'Gamma'),
(840, 81, 'Lodgy'),
(841, 81, 'Logan'),
(842, 81, 'Nova'),
(843, 81, 'Pick-Up'),
(844, 81, 'Sandero'),
(845, 81, 'Shifter'),
(846, 81, 'Solenza'),
(847, 81, 'Другая'),
(848, 82, 'City Leading'),
(849, 82, 'Shuttle'),
(850, 82, 'Smoothing'),
(851, 82, 'Другая'),
(852, 83, 'Alpheon'),
(853, 83, 'Aranos'),
(854, 83, 'Arcadia'),
(855, 83, 'Brougham'),
(856, 83, 'Chairman'),
(857, 83, 'Cielo'),
(858, 83, 'Damas'),
(859, 83, 'Espero'),
(860, 83, 'Evanda'),
(861, 83, 'Fantasy'),
(862, 83, 'G2X'),
(863, 83, 'Gentra'),
(864, 83, 'Imperial'),
(865, 83, 'Kalos'),
(866, 83, 'Korando'),
(867, 83, 'Lacetti'),
(868, 83, 'Lanos'),
(869, 83, 'Leganza'),
(870, 83, 'LeMans'),
(871, 83, 'Maepsy'),
(872, 83, 'Magnus'),
(873, 83, 'Matiz'),
(874, 83, 'Musso'),
(875, 83, 'Nexia'),
(876, 83, 'Nubira'),
(877, 83, 'Pointer'),
(878, 83, 'Prince'),
(879, 83, 'Racer'),
(880, 83, 'Rezzo'),
(881, 83, 'Royale'),
(882, 83, 'Sens'),
(883, 83, 'Tacuma'),
(884, 83, 'Tico'),
(885, 83, 'Tosca'),
(886, 83, 'Veritas'),
(887, 83, 'Winstorm'),
(888, 83, 'Другая'),
(889, 84, '55 Wide'),
(890, 84, 'Altis'),
(891, 84, 'Applause'),
(892, 84, 'Atrai'),
(893, 84, 'Ayla'),
(894, 84, 'Be-go'),
(895, 84, 'Boon'),
(896, 84, 'Boon Luminas'),
(897, 84, 'Ceria'),
(898, 84, 'Charade'),
(899, 84, 'Charmant'),
(900, 84, 'Compagno'),
(901, 84, 'Consorte'),
(902, 84, 'Coo'),
(903, 84, 'Copen'),
(904, 84, 'Cuore'),
(905, 84, 'Domino'),
(906, 84, 'Esse'),
(907, 84, 'Extol'),
(908, 84, 'Feroza'),
(909, 84, 'Fourtrak'),
(910, 84, 'Gran Max'),
(911, 84, 'Gran Move'),
(912, 84, 'Hijet'),
(913, 84, 'Leeza'),
(914, 84, 'Luxio'),
(915, 84, 'Materia'),
(916, 84, 'MAX'),
(917, 84, 'Mebius'),
(918, 84, 'Mira'),
(919, 84, 'Mira Cocoa'),
(920, 84, 'Mira Gino'),
(921, 84, 'Move'),
(922, 84, 'Naked'),
(923, 84, 'Opti'),
(924, 84, 'Pyzar'),
(925, 84, 'Rocky'),
(926, 84, 'Rugger'),
(927, 84, 'Sirion'),
(928, 84, 'Sonica'),
(929, 84, 'Sportrak'),
(930, 84, 'Storia'),
(931, 84, 'Taft'),
(932, 84, 'Tanto'),
(933, 84, 'Taruna'),
(934, 84, 'Terios'),
(935, 84, 'Trevis'),
(936, 84, 'Valera'),
(937, 84, 'Wildcat'),
(938, 84, 'Xenia'),
(939, 84, 'YRV'),
(940, 84, 'Zebra'),
(941, 84, 'Другая'),
(942, 85, 'DH27'),
(943, 85, 'Super Eight'),
(944, 85, 'V8'),
(945, 85, 'Другая'),
(946, 86, 'Fun'),
(947, 86, 'Другая'),
(948, 10, '1000'),
(949, 10, '1200'),
(950, 10, '200SX'),
(951, 10, '240Z / 260Z / 280Z'),
(952, 10, '510'),
(953, 10, '610'),
(954, 10, '710'),
(955, 10, '810'),
(956, 10, 'B-210'),
(957, 10, 'Bluebird'),
(958, 10, 'Cherry'),
(959, 10, 'Fairlady'),
(960, 10, 'GO'),
(961, 10, 'GO Plus'),
(962, 10, 'Laurel'),
(963, 10, 'mi-Do'),
(964, 10, 'on-DO'),
(965, 10, 'Patrol'),
(966, 10, 'Pickup'),
(967, 10, 'Stanza'),
(968, 10, 'Sunny'),
(969, 10, 'Urvan'),
(970, 10, 'Другая'),
(971, 88, 'Antelope'),
(972, 88, 'Aurora'),
(973, 88, 'Cowboy'),
(974, 88, 'Land Crown'),
(975, 88, 'Plutus'),
(976, 88, 'Saladin'),
(977, 88, 'Shuttle'),
(978, 88, 'Другая'),
(979, 11, 'Другая'),
(980, 89, '580'),
(981, 89, 'A30'),
(982, 89, 'A60'),
(983, 89, 'AX3'),
(984, 89, 'AX7'),
(985, 89, 'Future'),
(986, 89, 'H30'),
(987, 89, 'MPV'),
(988, 89, 'Oting'),
(989, 89, 'Rich'),
(990, 89, 'S30'),
(991, 89, 'Другая'),
(992, 90, 'Assol'),
(993, 90, 'Kondor'),
(994, 90, 'Orion'),
(995, 90, 'Orion M'),
(996, 90, 'Другая'),
(997, 91, '3'),
(998, 91, '4'),
(999, 91, '7'),
(1000, 91, 'Другая'),
(1001, 91, '5'),
(1002, 91, '6'),
(1003, 92, 'Premier'),
(1004, 92, 'Summit'),
(1005, 92, 'Talon'),
(1006, 92, 'Vision'),
(1007, 92, 'Другая'),
(1008, 93, 'MPV'),
(1009, 93, 'MS-6'),
(1010, 93, 'MS-8'),
(1011, 93, 'MS-9'),
(1012, 93, 'RX-7'),
(1013, 93, 'Другая'),
(1014, 94, 'Series IV'),
(1015, 94, 'Series V'),
(1016, 94, 'Другая'),
(1017, 12, '1020'),
(1018, 12, '6371'),
(1019, 12, 'Audi 100'),
(1020, 12, 'Audi A6'),
(1021, 12, 'Besturn B50'),
(1022, 12, 'Besturn B70'),
(1023, 12, 'Besturn B90'),
(1024, 12, 'Besturn X80'),
(1025, 12, 'C131'),
(1026, 12, 'D60'),
(1027, 12, 'Jiabao'),
(1028, 12, 'Jinn'),
(1029, 12, 'Kun Cheng'),
(1030, 12, 'M80'),
(1031, 12, 'Oley'),
(1032, 12, 'S80'),
(1033, 12, 'Sirius S80'),
(1034, 12, 'V2'),
(1035, 12, 'V5'),
(1036, 12, 'Vela'),
(1037, 12, 'Vita'),
(1038, 12, 'Volkswagen Bora'),
(1039, 12, 'Volkswagen City Golf'),
(1040, 12, 'Volkswagen Jetta'),
(1041, 12, 'Xiali N3'),
(1042, 12, 'Xiali N5'),
(1043, 12, 'Xiali N7'),
(1044, 12, 'Другая'),
(1045, 14, '812 Superfast'),
(1046, 14, 'Berlinetta Boxer'),
(1047, 14, 'California'),
(1048, 14, 'Enzo'),
(1049, 14, 'F12berlinetta'),
(1050, 14, 'F355'),
(1051, 14, 'F40'),
(1052, 14, 'F430'),
(1053, 14, 'F50'),
(1054, 14, 'FF'),
(1055, 14, 'GTC4Lusso'),
(1056, 14, 'LaFerrari'),
(1057, 14, 'Mondial'),
(1058, 14, 'Portofino'),
(1059, 14, 'Testarossa'),
(1060, 14, 'Другая'),
(1061, 15, '1100'),
(1062, 15, '1200'),
(1063, 15, '124'),
(1064, 15, '125'),
(1065, 15, '126'),
(1066, 15, '127'),
(1067, 15, '128'),
(1068, 15, '130'),
(1069, 15, '1300/1500'),
(1070, 15, '131'),
(1071, 15, '132'),
(1072, 15, '133'),
(1073, 15, '1400'),
(1074, 15, '147'),
(1075, 15, '1800/2100'),
(1076, 15, '2300'),
(1077, 15, '238'),
(1078, 15, '500'),
(1079, 15, '500L'),
(1080, 15, '600'),
(1081, 15, '850'),
(1082, 15, 'Albea'),
(1083, 15, 'Argenta'),
(1084, 15, 'Barchetta'),
(1085, 15, 'Brava'),
(1086, 15, 'Bravo'),
(1087, 15, 'Brio'),
(1088, 15, 'Campagnola'),
(1089, 15, 'Cinquecento'),
(1090, 15, 'Coupe'),
(1091, 15, 'Croma'),
(1092, 15, 'Dino'),
(1093, 15, 'Doblo'),
(1094, 15, 'Duna'),
(1095, 15, 'Elba'),
(1096, 15, 'Fiorino'),
(1097, 15, 'Freemont'),
(1098, 15, 'Fullback'),
(1099, 15, 'Idea'),
(1100, 15, 'Linea'),
(1101, 15, 'Marea'),
(1102, 15, 'Marengo'),
(1103, 15, 'Mille'),
(1104, 15, 'Multipla'),
(1105, 15, 'Palio'),
(1106, 15, 'Panda'),
(1107, 15, 'Panorama'),
(1108, 15, 'Perla'),
(1109, 15, 'Premio'),
(1110, 15, 'Punto'),
(1111, 15, 'Qubo'),
(1112, 15, 'Regata'),
(1113, 15, 'Ritmo'),
(1114, 15, 'Scudo'),
(1115, 15, 'Sedici'),
(1116, 15, 'Seicento'),
(1117, 15, 'Siena'),
(1118, 15, 'Spazio'),
(1119, 15, 'Stilo'),
(1120, 15, 'Strada'),
(1121, 15, 'Talento'),
(1122, 15, 'Tempra'),
(1123, 15, 'Tipo'),
(1127, 15, 'Tucan'),
(1128, 15, 'Ulysse'),
(1129, 15, 'Uno'),
(1130, 15, 'Viaggio'),
(1131, 15, 'Vivace'),
(1132, 15, 'Weekend'),
(1133, 15, 'X1/9'),
(1134, 15, 'Другая'),
(1135, 16, 'Zephyr'),
(1136, 16, 'Zodiac'),
(1137, 16, 'Другая'),
(1138, 95, 'Gratour'),
(1139, 95, 'Midi'),
(1140, 95, 'Sapu'),
(1141, 95, 'Sauvana'),
(1142, 95, 'Tunland'),
(1143, 95, 'Другая'),
(1144, 96, 'Polonez'),
(1145, 96, 'Другая'),
(1146, 97, '6500 Land King'),
(1147, 97, 'Другая'),
(1148, 98, 'Atlas'),
(1149, 98, 'Beauty Leopard'),
(1150, 98, 'CD'),
(1151, 98, 'CK'),
(1152, 98, 'Emgrand 7'),
(1153, 98, 'Emgrand EC7'),
(1154, 98, 'Emgrand GT'),
(1155, 98, 'Emgrand X7'),
(1156, 98, 'FC'),
(1157, 98, 'GC6'),
(1158, 98, 'GE'),
(1159, 98, 'GX7'),
(1160, 98, 'HQ'),
(1161, 98, 'LC'),
(1162, 98, 'MK'),
(1163, 98, 'MR'),
(1164, 98, 'Otaka'),
(1165, 98, 'Panda'),
(1166, 98, 'SC7'),
(1167, 98, 'SL'),
(1168, 98, 'Uliou'),
(1169, 98, 'Vision'),
(1170, 98, 'Другая'),
(1171, 99, 'G70'),
(1172, 99, 'G80'),
(1173, 99, 'G90'),
(1174, 99, 'Другая'),
(1176, 17, 'Prizm'),
(1177, 17, 'Spectrum'),
(1178, 17, 'Storm'),
(1179, 17, 'Другая'),
(1180, 18, 'Другая'),
(1181, 100, 'CoolBear'),
(1182, 100, 'Cowry'),
(1183, 100, 'Deer'),
(1184, 100, 'Florid'),
(1185, 100, 'Hover H3'),
(1186, 100, 'Hover H5'),
(1187, 100, 'Hover H6'),
(1188, 100, 'Hover M2'),
(1189, 100, 'Hover M4'),
(1190, 100, 'Pegasus'),
(1191, 100, 'Peri'),
(1192, 100, 'Safe'),
(1193, 100, 'Sailor'),
(1194, 100, 'Sing RUV'),
(1195, 100, 'Socool'),
(1196, 100, 'Steed'),
(1197, 100, 'Voleex C10'),
(1198, 100, 'Voleex C20R'),
(1199, 100, 'Voleex C30'),
(1200, 100, 'Voleex C50'),
(1201, 100, 'Voleex V80'),
(1202, 100, 'Wingle 3'),
(1203, 100, 'Wingle 5'),
(1204, 100, 'X240'),
(1205, 100, 'Другая'),
(1206, 101, 'Bliss'),
(1207, 101, 'Dacota'),
(1208, 101, 'Fox'),
(1209, 101, 'Rocky'),
(1210, 101, 'Shuttle'),
(1211, 101, 'Target'),
(1212, 101, 'Vertus'),
(1213, 101, 'Другая'),
(1214, 102, 'Brio'),
(1215, 102, 'Junyi'),
(1216, 102, 'Lobo'),
(1217, 102, 'Luzun'),
(1218, 102, 'Minyi'),
(1219, 102, 'Princip'),
(1220, 102, 'Saibao'),
(1221, 102, 'Saima'),
(1222, 102, 'Sigma'),
(1223, 102, 'Simbo'),
(1224, 102, 'Zhongyi'),
(1225, 102, 'Другая'),
(1226, 103, '2'),
(1227, 103, '3'),
(1228, 103, '7'),
(1229, 103, 'CX20'),
(1230, 103, 'Family'),
(1231, 103, 'Freema'),
(1232, 103, 'Fstar'),
(1233, 103, 'H2'),
(1234, 103, 'M11'),
(1235, 103, 'M3'),
(1236, 103, 'M6'),
(1237, 103, 'M8'),
(1238, 103, 'S3'),
(1239, 103, 'S5'),
(1240, 103, 'S7'),
(1241, 104, 'H2'),
(1242, 104, 'H6'),
(1243, 104, 'H8'),
(1244, 104, 'H9'),
(1245, 104, 'Другая'),
(1246, 105, 'B21'),
(1247, 105, 'Boliger'),
(1248, 105, 'Laville'),
(1249, 105, 'Другая'),
(1250, 106, 'Ambassador'),
(1251, 106, 'Contessa'),
(1252, 106, 'Lancer'),
(1253, 106, 'Pajero'),
(1254, 106, 'Другая'),
(1255, 107, 'Adventra'),
(1256, 107, 'Apollo'),
(1257, 107, 'Astra'),
(1258, 107, 'Barina'),
(1259, 107, 'Barina Spark'),
(1260, 107, 'Belmont'),
(1261, 107, 'Berlina'),
(1262, 107, 'Brougham'),
(1263, 107, 'Calais'),
(1264, 107, 'Camira'),
(1265, 107, 'Caprice'),
(1266, 107, 'Captiva'),
(1267, 107, 'Colorado'),
(1268, 107, 'Commodore'),
(1269, 107, 'Crewman'),
(1270, 107, 'Cruze'),
(1271, 107, 'Drover'),
(1272, 107, 'Epica'),
(1273, 107, 'Frontera'),
(1274, 107, 'Gemini'),
(1275, 107, 'Jackaroo'),
(1276, 107, 'Kingswood'),
(1277, 107, 'Malibu'),
(1278, 107, 'Monaro'),
(1279, 107, 'Monterey'),
(1280, 107, 'Piazza'),
(1281, 107, 'Rodeo'),
(1282, 107, 'Sandman'),
(1283, 107, 'Statesman'),
(1284, 107, 'Suburban'),
(1285, 107, 'Tigra'),
(1286, 107, 'Torana'),
(1287, 107, 'UTE'),
(1288, 107, 'Vectra'),
(1289, 107, 'Viva'),
(1290, 107, 'Volt'),
(1291, 107, 'Zafira'),
(1292, 107, 'Другая'),
(1293, 19, '1300'),
(1294, 19, '145'),
(1295, 19, 'Acty'),
(1296, 19, 'Airwave'),
(1297, 19, 'Amaze'),
(1298, 19, 'Ascot'),
(1299, 19, 'Ascot Innova'),
(1300, 19, 'Avancier'),
(1301, 19, 'Ballade'),
(1302, 19, 'Beat'),
(1303, 19, 'Brio'),
(1304, 19, 'Capa'),
(1305, 19, 'Ciimo'),
(1306, 19, 'Concerto'),
(1307, 19, 'CR-X'),
(1308, 19, 'CR-Z'),
(1309, 19, 'Crider'),
(1310, 19, 'Crossroad'),
(1311, 19, 'Domani'),
(1312, 19, 'Edix'),
(1313, 19, 'Element'),
(1314, 19, 'Elysion'),
(1315, 19, 'FCX Clarity'),
(1316, 19, 'Fit Aria'),
(1317, 19, 'Fit Shuttle'),
(1318, 19, 'FR-V'),
(1319, 19, 'Freed'),
(1320, 19, 'HR-V'),
(1321, 19, 'Insight'),
(1322, 19, 'Inspire'),
(1323, 19, 'Integra'),
(1324, 19, 'Integra SJ'),
(1325, 19, 'Jazz'),
(1326, 19, 'Lagreat'),
(1327, 19, 'Legend'),
(1328, 19, 'Life'),
(1329, 19, 'Logo'),
(1330, 19, 'MDX'),
(1331, 19, 'Mobilio'),
(1332, 19, 'Mobilio Spike'),
(1333, 19, 'MR-V'),
(1334, 19, 'N Box'),
(1335, 19, 'N-One'),
(1336, 19, 'N360'),
(1337, 19, 'N600'),
(1338, 19, 'NSX'),
(1339, 19, 'Orthia'),
(1340, 19, 'Partner'),
(1341, 19, 'Prelude'),
(1342, 19, 'Quint'),
(1343, 19, 'Quintet'),
(1344, 19, 'Rafaga'),
(1345, 19, 'Ridgeline'),
(1346, 19, 'S-MX'),
(1347, 19, 'S2000'),
(1348, 19, 'S500'),
(1349, 19, 'S600'),
(1350, 19, 'S800'),
(1351, 19, 'Saber'),
(1352, 19, 'Shuttle'),
(1353, 19, 'Spirior'),
(1354, 19, 'Stepwgn'),
(1355, 19, 'Stream'),
(1356, 19, 'That\'s'),
(1357, 19, 'Today'),
(1358, 19, 'Torneo'),
(1359, 19, 'Vamos'),
(1361, 19, 'Vigor'),
(1362, 19, 'Z'),
(1363, 19, 'Zest'),
(1364, 108, 'Antelope'),
(1365, 108, 'Landscape'),
(1366, 108, 'Plutus'),
(1367, 108, 'Santa Fe'),
(1368, 108, 'Другая'),
(1369, 19, 'Другая'),
(1370, 20, 'Другая'),
(1371, 109, 'Albaycin'),
(1372, 109, 'Другая'),
(1373, 21, 'Accent'),
(1374, 21, 'Amica'),
(1375, 21, 'Aslan'),
(1376, 21, 'Atos'),
(1377, 21, 'Atos Prime'),
(1378, 21, 'Atoz'),
(1379, 21, 'Avante'),
(1380, 21, 'Avega'),
(1381, 21, 'Azera'),
(1382, 21, 'Brio'),
(1383, 21, 'Centennial'),
(1384, 21, 'Click'),
(1385, 21, 'Coupe'),
(1386, 21, 'Creta'),
(1387, 21, 'Dynasty'),
(1388, 21, 'Elantra'),
(1389, 21, 'Elantra GT'),
(1390, 21, 'Elantra Touring'),
(1391, 21, 'Entourage'),
(1392, 21, 'Eon'),
(1393, 21, 'Equus'),
(1394, 21, 'Excel'),
(1395, 21, 'Galloper'),
(1396, 21, 'Genesis'),
(1397, 21, 'Getz'),
(1398, 21, 'Grace'),
(1399, 21, 'Grandeur'),
(1400, 21, 'H-1'),
(1401, 21, 'H-100'),
(1402, 21, 'HB20'),
(1403, 21, 'i10'),
(1404, 21, 'i20'),
(1405, 21, 'i25'),
(1406, 21, 'i30'),
(1407, 21, 'i40'),
(1408, 21, 'i45'),
(1409, 21, 'ix20'),
(1410, 21, 'ix35'),
(1411, 21, 'ix55'),
(1412, 21, 'Kona'),
(1413, 21, 'Langdong'),
(1414, 21, 'Lantra'),
(1415, 21, 'Lavita'),
(1416, 21, 'Marcia'),
(1417, 21, 'Matrix'),
(1418, 21, 'Pony'),
(1419, 21, 'Presto'),
(1420, 21, 'Rohens'),
(1421, 21, 'S-Coupe'),
(1422, 21, 'Santa Fe'),
(1423, 21, 'Santamo'),
(1424, 21, 'Santro'),
(1425, 21, 'Santro Xing'),
(1426, 21, 'Solaris'),
(1427, 21, 'Sonata'),
(1428, 21, 'Sonica'),
(1429, 21, 'Stellar'),
(1430, 21, 'TB'),
(1431, 21, 'Terracan'),
(1432, 21, 'Tiburon'),
(1433, 21, 'TQ'),
(1434, 21, 'Trajet'),
(1435, 21, 'Trajet XG'),
(1436, 21, 'Tucson'),
(1437, 21, 'Tuscani'),
(1438, 21, 'Veloster'),
(1439, 21, 'Veracruz'),
(1440, 21, 'Verna'),
(1441, 21, 'XG'),
(1442, 21, 'Другая'),
(1443, 22, 'EX-Series'),
(1444, 22, 'FX-Series'),
(1445, 22, 'G-Series'),
(1446, 22, 'I-Series'),
(1447, 22, 'J30'),
(1448, 22, 'JX-Series'),
(1449, 22, 'M-Series'),
(1450, 22, 'Q30'),
(1451, 22, 'Q40'),
(1452, 22, 'Q45'),
(1453, 22, 'Q50'),
(1454, 22, 'Q60'),
(1455, 22, 'Q70'),
(1456, 22, 'QX-Series'),
(1457, 22, 'QX30'),
(1458, 22, 'QX50'),
(1459, 22, 'QX60'),
(1460, 22, 'QX70'),
(1461, 22, 'QX80'),
(1462, 22, 'Другая'),
(1463, 110, 'Elba'),
(1464, 110, 'Mille'),
(1465, 110, 'Small'),
(1466, 110, 'Другая'),
(1467, 111, 'S1'),
(1468, 111, 'Другая'),
(1469, 112, 'Bardo'),
(1470, 112, 'Dena'),
(1471, 112, 'Runna'),
(1472, 112, 'Samand'),
(1473, 112, 'Sarir'),
(1474, 112, 'Soren'),
(1475, 112, 'Другая'),
(1476, 113, 'Spyder'),
(1477, 113, 'Другая'),
(1478, 129, '117'),
(1479, 129, 'Alterra'),
(1480, 129, 'Amigo'),
(1481, 129, 'Ascender'),
(1482, 129, 'Aska'),
(1483, 129, 'Axiom'),
(1484, 129, 'Bellel'),
(1485, 129, 'Bellett'),
(1486, 129, 'Bighorn'),
(1487, 129, 'Campo'),
(1488, 129, 'Como'),
(1489, 129, 'Crosswind'),
(1490, 129, 'D-Max'),
(1491, 129, 'Fargo'),
(1492, 129, 'Filly'),
(1493, 129, 'Florian'),
(1495, 129, 'Fuego'),
(1496, 129, 'Gemini'),
(1497, 129, 'Hombre'),
(1498, 129, 'I-Mark'),
(1499, 129, 'i-Series'),
(1500, 129, 'Impulse'),
(1501, 129, 'KB'),
(1502, 129, 'Midi'),
(1503, 129, 'MU'),
(1504, 129, 'MU-7'),
(1505, 129, 'Oasis'),
(1506, 129, 'Panther'),
(1507, 129, 'Piazza'),
(1508, 129, 'Rodeo'),
(1509, 129, 'Statesman de Ville'),
(1510, 129, 'Stylus'),
(1511, 129, 'Trooper'),
(1512, 129, 'VehiCross'),
(1513, 129, 'Wasp'),
(1514, 129, 'WFR'),
(1515, 129, 'Wizard'),
(1516, 129, 'Другая'),
(1517, 114, 'J2'),
(1518, 114, 'J5'),
(1519, 114, 'Refine'),
(1520, 114, 'Rein'),
(1521, 114, 'S5'),
(1522, 114, 'Другая'),
(1523, 24, 'Другая'),
(1524, 25, 'Другая'),
(1525, 115, 'Alto'),
(1526, 115, 'Chuanqi'),
(1527, 115, 'City Spirit'),
(1528, 115, 'Другая'),
(1529, 116, 'Haise'),
(1530, 116, 'Другая'),
(1531, 117, 'Baodian'),
(1532, 117, 'Baowei'),
(1533, 117, 'X6'),
(1534, 117, 'Yuhu'),
(1535, 117, 'Yusheng'),
(1536, 117, 'Другая'),
(1537, 118, 'Amanti'),
(1538, 118, 'Avella'),
(1539, 118, 'Borrego'),
(1540, 118, 'Brisa'),
(1541, 118, 'Cadenza'),
(1542, 118, 'Capital'),
(1543, 118, 'Carens'),
(1544, 118, 'Carnival'),
(1545, 118, 'Carstar'),
(1546, 118, 'Cee\'d'),
(1547, 118, 'Cerato'),
(1548, 118, 'Clarus'),
(1549, 118, 'Concord'),
(1550, 118, 'Credos'),
(1551, 118, 'Elan'),
(1552, 118, 'Enterprise'),
(1553, 118, 'Forte'),
(1554, 118, 'Joice'),
(1555, 118, 'Lotze'),
(1556, 118, 'Magentis'),
(1557, 118, 'Mohave'),
(1558, 118, 'Morning'),
(1559, 118, 'Niro'),
(1560, 118, 'Opirus'),
(1561, 118, 'Optima'),
(1562, 118, 'Parktown'),
(1563, 118, 'Picanto'),
(1564, 118, 'Potentia'),
(1565, 118, 'Pride'),
(1566, 118, 'Quoris'),
(1567, 118, 'Ray'),
(1568, 118, 'Retona'),
(1569, 118, 'Rio'),
(1570, 118, 'Rondo'),
(1571, 118, 'Sedona'),
(1572, 118, 'Sephia'),
(1573, 118, 'Shuma'),
(1574, 118, 'Sorento'),
(1575, 118, 'Soul'),
(1576, 118, 'Spectra'),
(1577, 118, 'Sportage'),
(1578, 118, 'Stinger'),
(1579, 118, 'Stonic'),
(1580, 118, 'Towner'),
(1581, 118, 'Venga'),
(1582, 118, 'Visto'),
(1583, 118, 'X-Trek'),
(1584, 118, 'Другая'),
(1585, 119, 'CC8S'),
(1586, 119, 'CCR'),
(1587, 119, 'CCX'),
(1588, 119, 'CCXR'),
(1589, 119, 'Другая'),
(1590, 26, '350GT'),
(1591, 26, '400GT'),
(1592, 26, 'Aventador'),
(1593, 26, 'Centenario'),
(1594, 26, 'Countach'),
(1595, 26, 'Diablo'),
(1596, 26, 'Espada'),
(1597, 26, 'Gallardo'),
(1598, 26, 'Huracan'),
(1599, 26, 'Islero'),
(1600, 26, 'Jalpa'),
(1601, 26, 'Jarama'),
(1602, 26, 'LM002'),
(1603, 26, 'Miura'),
(1604, 26, 'Murcielago'),
(1605, 26, 'Reventon'),
(1606, 26, 'Sesto Elemento'),
(1607, 26, 'Silhouette'),
(1608, 26, 'Urraco'),
(1609, 26, 'Urus'),
(1610, 26, 'Другая'),
(1611, 120, '2000'),
(1612, 120, 'A112'),
(1613, 120, 'Appia'),
(1614, 120, 'Aurelia'),
(1615, 120, 'Beta'),
(1616, 120, 'Dedra'),
(1617, 120, 'Delta'),
(1618, 120, 'Flaminia'),
(1619, 120, 'Flavia'),
(1620, 120, 'Fulvia'),
(1621, 120, 'Gamma'),
(1622, 120, 'Hyena'),
(1623, 120, 'Kappa'),
(1624, 120, 'Lybra'),
(1625, 120, 'Montecarlo'),
(1626, 120, 'Musa'),
(1627, 120, 'Phedra'),
(1628, 120, 'Prisma'),
(1629, 120, 'Scorpion'),
(1630, 120, 'Stratos HF'),
(1631, 120, 'Thema'),
(1632, 120, 'Thesis'),
(1633, 120, 'Trevi'),
(1634, 120, 'Voyager'),
(1635, 120, 'Y'),
(1636, 120, 'Y10'),
(1637, 120, 'Ypsilon'),
(1638, 120, 'Zeta'),
(1639, 120, 'Другая'),
(1640, 27, 'Range Rover Evoque'),
(1641, 27, 'Range Rover Sport'),
(1642, 27, 'Range Rover Velar'),
(1643, 27, 'Series'),
(1644, 27, 'Другая'),
(1645, 122, 'X6'),
(1646, 122, 'Другая'),
(1647, 123, 'CT'),
(1648, 123, 'ES'),
(1649, 123, 'GS'),
(1650, 123, 'GX'),
(1651, 123, 'HS'),
(1652, 123, 'IS'),
(1653, 123, 'LC'),
(1654, 123, 'LFA'),
(1655, 123, 'LS'),
(1656, 123, 'LX'),
(1657, 123, 'NX'),
(1658, 123, 'RC'),
(1659, 123, 'RX'),
(1660, 123, 'SC'),
(1661, 123, 'Другая'),
(1662, 124, 'Breez'),
(1663, 124, 'Cebrium'),
(1664, 124, 'Celliya'),
(1665, 124, 'Foison'),
(1666, 124, 'Murman'),
(1667, 124, 'MyWay'),
(1668, 124, 'Smily'),
(1669, 124, 'Solano'),
(1670, 124, 'X50'),
(1671, 124, 'X60'),
(1672, 124, 'X70'),
(1673, 124, 'Другая'),
(1674, 28, 'Aviator'),
(1675, 28, 'Blackwood'),
(1676, 28, 'Capri'),
(1677, 28, 'Continental'),
(1678, 28, 'Continental Mark Series'),
(1679, 28, 'Cosmopolitan'),
(1680, 28, 'Custom'),
(1681, 28, 'K-Series'),
(1682, 28, 'LS'),
(1683, 28, 'Mark LT'),
(1684, 28, 'MKC'),
(1685, 28, 'MKS'),
(1686, 28, 'MKT'),
(1687, 28, 'MKX'),
(1688, 28, 'MKZ'),
(1689, 28, 'Navigator'),
(1690, 28, 'Premiere'),
(1691, 28, 'Town Car'),
(1692, 28, 'Versailles'),
(1693, 28, 'Zephyr'),
(1694, 28, 'Другая'),
(1695, 126, '2-Eleven'),
(1696, 126, '340R'),
(1697, 126, '7'),
(1698, 126, 'Carlton'),
(1699, 126, 'Eclat'),
(1700, 126, 'Elan'),
(1701, 126, 'Elise'),
(1702, 126, 'Elite'),
(1703, 126, 'Esprit'),
(1704, 126, 'Europa'),
(1705, 126, 'Evora'),
(1706, 126, 'Excel'),
(1707, 126, 'Exige'),
(1708, 126, 'Omega'),
(1709, 126, 'Другая'),
(1710, 127, 'TX'),
(1711, 127, 'Другая'),
(1712, 128, '5'),
(1713, 128, '7'),
(1714, 128, 'U6'),
(1715, 128, 'Другая'),
(1716, 130, 'Armada'),
(1717, 130, 'Bolero'),
(1718, 130, 'Commander'),
(1719, 130, 'Marshal'),
(1720, 130, 'MM 540/550'),
(1721, 130, 'MM 775'),
(1722, 130, 'Scorpio'),
(1723, 130, 'Другая'),
(1724, 131, 'TS'),
(1725, 131, 'Другая'),
(1726, 132, '5Exi'),
(1727, 132, 'Berlinetta'),
(1728, 132, 'RoadSter'),
(1729, 132, 'Sportster'),
(1730, 132, 'Другая'),
(1731, 133, 'B1'),
(1732, 133, 'B2'),
(1733, 133, 'Другая'),
(1734, 134, '1000'),
(1735, 134, '800'),
(1736, 134, 'Alto'),
(1737, 134, 'Baleno'),
(1738, 134, 'Esteem'),
(1739, 134, 'Gypsy'),
(1740, 134, 'Omni'),
(1741, 134, 'Versa'),
(1742, 134, 'Wagon R'),
(1743, 134, 'Zen'),
(1744, 134, 'Другая'),
(1745, 29, '228'),
(1746, 29, '3200 GT'),
(1747, 29, '3500 GT'),
(1748, 29, '420'),
(1749, 29, 'Biturbo'),
(1750, 29, 'Bora'),
(1751, 29, 'Coupe'),
(1752, 29, 'Ghibli'),
(1753, 29, 'GranCabrio'),
(1754, 29, 'GranSport'),
(1755, 29, 'GranTurismo'),
(1756, 29, 'Indy'),
(1757, 29, 'Karif'),
(1758, 29, 'Khamsin'),
(1759, 29, 'Kyalami'),
(1760, 29, 'Levante'),
(1761, 29, 'Merak'),
(1762, 29, 'Mexico'),
(1763, 29, 'Mistral'),
(1764, 29, 'Quattroporte'),
(1765, 29, 'Racing'),
(1766, 29, 'Royale'),
(1767, 29, 'Sebring'),
(1768, 29, 'Shamal'),
(1769, 29, 'Spyder'),
(1770, 29, 'Другая'),
(1771, 135, '57'),
(1772, 135, '62'),
(1773, 135, 'Zeppelin'),
(1774, 135, 'Другая'),
(1775, 30, '121'),
(1776, 30, '1300'),
(1777, 30, '2'),
(1778, 30, '3'),
(1779, 30, '323'),
(1780, 30, '5'),
(1781, 30, '6'),
(1782, 30, '616'),
(1783, 30, '626'),
(1784, 30, '8'),
(1785, 30, '808'),
(1786, 30, '818'),
(1787, 30, '929'),
(1788, 30, 'Allegro'),
(1789, 30, 'Atenza'),
(1790, 30, 'Axela'),
(1791, 30, 'AZ-1'),
(1792, 30, 'AZ-Offroad'),
(1793, 30, 'AZ-Wagon'),
(1794, 30, 'B-Series'),
(1795, 30, 'Biante'),
(1796, 30, 'Bongo'),
(1797, 30, 'Bongo Brawny'),
(1798, 30, 'Bongo Friendee'),
(1799, 30, 'Bravo'),
(1800, 30, 'BT-50'),
(1801, 30, 'Capella'),
(1802, 30, 'Carol'),
(1803, 30, 'Chantez'),
(1804, 30, 'Clef'),
(1805, 30, 'Cosmo'),
(1806, 30, 'Cronos'),
(1807, 30, 'CX-3'),
(1808, 30, 'CX-5'),
(1809, 30, 'CX-7'),
(1810, 30, 'CX-9'),
(1811, 30, 'Demio'),
(1812, 30, 'Drifter'),
(1813, 30, 'Etude'),
(1814, 30, 'Eunos 500'),
(1815, 30, 'Eunos 800'),
(1816, 30, 'Eunos Cosmo'),
(1817, 30, 'Familia'),
(1818, 30, 'Flair'),
(1819, 30, 'Flair Crossover'),
(1820, 30, 'Flair Wagon'),
(1821, 30, 'GLC'),
(1822, 30, 'Lantis'),
(1823, 30, 'Laputa'),
(1824, 30, 'Levante'),
(1825, 30, 'Luce'),
(1826, 30, 'Miata'),
(1827, 30, 'Millenia'),
(1828, 30, 'Montrose'),
(1829, 30, 'MPV'),
(1830, 30, 'MX-3'),
(1831, 30, 'MX-5'),
(1832, 30, 'MX-6'),
(1833, 30, 'Navajo'),
(1834, 30, 'Persona'),
(1835, 30, 'Porter'),
(1836, 30, 'Porter Cab'),
(1837, 30, 'Premacy'),
(1838, 30, 'Proceed'),
(1839, 30, 'Proceed Levante'),
(1840, 30, 'Protege'),
(1841, 30, 'R100'),
(1842, 30, 'R360'),
(1843, 30, 'Revue'),
(1844, 30, 'Roadpacer AP'),
(1845, 30, 'Roadster'),
(1846, 30, 'RX-2'),
(1847, 30, 'RX-5'),
(1848, 30, 'RX-7'),
(1849, 30, 'RX-8'),
(1850, 30, 'Scrum'),
(1851, 30, 'Sentia'),
(1852, 30, 'Spiano'),
(1853, 30, 'Tribute'),
(1854, 30, 'Verisa'),
(1855, 30, 'Xedos 6'),
(1856, 30, 'Xedos 9'),
(1857, 30, 'Другая'),
(1858, 136, 'F1'),
(1859, 136, 'MP4-12C'),
(1860, 136, 'P1'),
(1861, 136, 'Другая'),
(1862, 137, 'Club'),
(1863, 137, 'Monte Carlo'),
(1864, 137, 'Track'),
(1865, 137, 'Другая'),
(1866, 31, 'X-Класс'),
(1867, 31, 'Другая'),
(1868, 32, 'Bobcat'),
(1869, 32, 'Capri'),
(1870, 32, 'Colony Park'),
(1871, 32, 'Comet'),
(1872, 32, 'Commuter'),
(1873, 32, 'Cougar'),
(1874, 32, 'Custom'),
(1875, 32, 'Cyclone'),
(1876, 32, 'Eight'),
(1877, 32, 'Grand Marquis'),
(1878, 32, 'LN7'),
(1879, 32, 'Lynx'),
(1880, 32, 'M-47'),
(1881, 32, 'Marauder'),
(1882, 32, 'Mariner'),
(1883, 32, 'Marquis'),
(1884, 32, 'Medalist'),
(1885, 32, 'Meteor'),
(1886, 32, 'Milan'),
(1887, 32, 'Monarch'),
(1888, 32, 'Montclair'),
(1889, 32, 'Montego'),
(1890, 32, 'Monterey'),
(1891, 32, 'Mountaineer'),
(1892, 32, 'Mystique'),
(1893, 32, 'Park Lane'),
(1894, 32, 'S-55'),
(1895, 32, 'Sable'),
(1896, 32, 'Topaz'),
(1897, 32, 'Tracer'),
(1898, 32, 'Turnpike Cruiser'),
(1899, 32, 'Villager'),
(1900, 32, 'Voyager'),
(1901, 32, 'Zephyr'),
(1902, 32, 'Другая'),
(1903, 138, 'Taxi'),
(1904, 138, 'Другая'),
(1905, 34, 'Другая'),
(1906, 139, 'TF 1800'),
(1907, 139, 'Другая'),
(1908, 35, 'Cabrio'),
(1909, 35, 'Clubman'),
(1910, 35, 'Cooper S'),
(1911, 35, 'Countryman'),
(1912, 35, 'Coupe'),
(1913, 35, 'One'),
(1914, 35, 'Paceman'),
(1915, 35, 'Roadster'),
(1916, 35, 'Другая'),
(1917, 36, '3000 GT'),
(1918, 36, '380'),
(1919, 36, 'Adventure'),
(1920, 36, 'Airtrek'),
(1921, 36, 'Aspire'),
(1922, 36, 'ASX'),
(1923, 36, 'Carisma'),
(1924, 36, 'Challenger'),
(1925, 36, 'Chariot'),
(1926, 36, 'Colt'),
(1927, 36, 'Cordia'),
(1928, 36, 'Debonair'),
(1929, 36, 'Delica'),
(1930, 36, 'Diamante'),
(1931, 36, 'Dignity'),
(1932, 36, 'Dingo'),
(1933, 36, 'Dion'),
(1934, 36, 'Eclipse'),
(1935, 36, 'Eclipse Cross'),
(1936, 36, 'EK Wagon'),
(1937, 36, 'Emeraude'),
(1938, 36, 'Endeavor'),
(1939, 36, 'Eterna'),
(1940, 36, 'Expo'),
(1941, 36, 'Freeca'),
(1942, 36, 'FTO'),
(1943, 36, 'Fuzion'),
(1944, 36, 'Galant'),
(1945, 36, 'Galant Fortis'),
(1946, 36, 'Grandis'),
(1947, 36, 'Grunder'),
(1948, 36, 'GTO'),
(1949, 36, 'i'),
(1950, 36, 'i-MiEV'),
(1951, 36, 'Jeep'),
(1952, 36, 'L100'),
(1953, 36, 'L200'),
(1954, 36, 'L300'),
(1955, 36, 'L400'),
(1956, 36, 'Lancer'),
(1957, 36, 'Lancer Evolution'),
(1958, 36, 'Legnum'),
(1959, 36, 'Libero'),
(1960, 36, 'Magna'),
(1961, 36, 'Magnum'),
(1962, 36, 'Maven'),
(1963, 36, 'Mighty Max'),
(1964, 36, 'Minica'),
(1965, 36, 'Minicab'),
(1966, 36, 'Mirage'),
(1967, 36, 'Montero'),
(1968, 36, 'Montero iO'),
(1969, 36, 'Montero Sport'),
(1970, 36, 'Nimbus'),
(1971, 36, 'Outlander'),
(1972, 36, 'Pajero'),
(1973, 36, 'Pajero iO'),
(1974, 36, 'Pajero Junior'),
(1975, 36, 'Pajero Mini'),
(1976, 36, 'Pajero Pinin'),
(1977, 36, 'Pajero Sport'),
(1978, 36, 'Pinin'),
(1979, 36, 'Precis'),
(1980, 36, 'Proudia'),
(1981, 36, 'Raider'),
(1982, 36, 'RVR'),
(1983, 36, 'Sapporo'),
(1984, 36, 'Savrin'),
(1985, 36, 'Scorpion'),
(1986, 36, 'Shogun Pinin'),
(1987, 36, 'Shogun Sport'),
(1988, 36, 'Sigma'),
(1989, 36, 'Space Gear'),
(1990, 36, 'Space Runner'),
(1991, 36, 'Space Star'),
(1992, 36, 'Space Wagon'),
(1993, 36, 'Starion'),
(1994, 36, 'Strada'),
(1995, 36, 'Toppo'),
(1996, 36, 'Town BOX'),
(1997, 36, 'Towny'),
(1998, 36, 'Tredia'),
(1999, 36, 'Verada'),
(2000, 36, 'Warrior'),
(2001, 36, 'Zinger'),
(2002, 36, 'Другая'),
(2003, 140, 'Classic Type F'),
(2004, 140, 'Galue'),
(2005, 140, 'Le-Seyde'),
(2006, 140, 'Ryoga'),
(2007, 140, 'Viewt'),
(2008, 140, 'Другая'),
(2009, 141, 'GTB Centenaire'),
(2010, 141, 'Другая'),
(2011, 142, '4/4'),
(2012, 142, 'Aero 8'),
(2013, 142, 'Plus 4'),
(2014, 142, 'Plus 8'),
(2015, 142, 'Другая'),
(2016, 37, 'Другая'),
(2017, 143, 'M12 GTO'),
(2018, 143, 'Другая'),
(2019, 144, '522'),
(2020, 144, 'Другая'),
(2021, 38, '88'),
(2022, 38, '98'),
(2023, 38, 'Achieva'),
(2024, 38, 'Alero'),
(2025, 38, 'Aurora'),
(2026, 38, 'Bravada'),
(2027, 38, 'Cutlass'),
(2028, 38, 'Delta 88'),
(2029, 38, 'Deluxe 88'),
(2030, 38, 'Dynamic 88'),
(2031, 38, 'Intrigue'),
(2032, 38, 'Silhouette'),
(2033, 38, 'Super 88'),
(2034, 38, 'Toronado'),
(2035, 38, 'Другая'),
(2036, 145, 'Adam'),
(2037, 145, 'Admiral'),
(2038, 145, 'Agila'),
(2039, 145, 'Ampera'),
(2040, 145, 'Antara'),
(2041, 145, 'Arena'),
(2042, 145, 'Ascona'),
(2043, 145, 'Astra'),
(2044, 145, 'Bedford Blitz'),
(2045, 145, 'Blazer'),
(2046, 145, 'Cabrio'),
(2047, 145, 'Calais'),
(2048, 145, 'Calibra'),
(2049, 145, 'Campo'),
(2050, 145, 'Cascada'),
(2051, 145, 'Combo'),
(2052, 145, 'Commodore'),
(2053, 145, 'Corsa'),
(2054, 145, 'Crossland X'),
(2055, 145, 'Diplomat'),
(2056, 145, 'Frontera'),
(2057, 145, 'Grandland X'),
(2058, 145, 'GT'),
(2059, 145, 'Insignia'),
(2060, 145, 'Kadett'),
(2061, 145, 'Kapitan'),
(2062, 145, 'Karl'),
(2063, 145, 'Manta'),
(2064, 145, 'Meriva'),
(2065, 145, 'Mokka'),
(2066, 145, 'Monterey'),
(2067, 145, 'Monza'),
(2068, 145, 'Omega'),
(2069, 145, 'Rekord'),
(2070, 145, 'Senator'),
(2071, 145, 'Signum'),
(2072, 145, 'Sintra'),
(2073, 145, 'Speedster'),
(2074, 145, 'Super 6'),
(2075, 145, 'Tigra'),
(2076, 145, 'Vectra'),
(2077, 145, 'Vivaro'),
(2078, 145, 'Zafira'),
(2079, 145, 'Другая'),
(2080, 146, '2500 GT'),
(2081, 146, 'Другая'),
(2082, 147, 'Twelve'),
(2083, 147, 'Другая'),
(2084, 148, 'Zonda C12'),
(2085, 148, 'Другая'),
(2086, 149, 'Esperante'),
(2087, 149, 'Roadster'),
(2088, 149, 'Другая'),
(2089, 150, 'Saloon'),
(2090, 150, 'Другая'),
(2091, 151, 'Alza'),
(2092, 151, 'Kelisa'),
(2093, 151, 'Kenari'),
(2094, 151, 'Nippa'),
(2095, 151, 'Другая'),
(2096, 39, '1007'),
(2097, 39, '104'),
(2098, 39, '106'),
(2099, 39, '107'),
(2100, 39, '108'),
(2101, 39, '2008'),
(2102, 39, '201'),
(2103, 39, '202'),
(2104, 39, '203'),
(2105, 39, '204'),
(2106, 39, '205'),
(2107, 39, '206'),
(2108, 39, '207'),
(2109, 39, '208'),
(2110, 39, '3008'),
(2111, 39, '301'),
(2112, 39, '302'),
(2113, 39, '304'),
(2114, 39, '305'),
(2115, 39, '306'),
(2116, 39, '307'),
(2117, 39, '308'),
(2118, 39, '309'),
(2119, 39, '4007'),
(2120, 39, '4008'),
(2121, 39, '401'),
(2122, 39, '402'),
(2123, 39, '403'),
(2124, 39, '404'),
(2125, 39, '405'),
(2126, 39, '406'),
(2127, 39, '407'),
(2128, 39, '408'),
(2129, 39, '5008'),
(2130, 39, '504'),
(2131, 39, '505'),
(2132, 39, '508'),
(2133, 39, '604'),
(2134, 39, '605'),
(2135, 39, '607'),
(2136, 39, '806'),
(2137, 39, '807'),
(2138, 39, 'Bipper'),
(2139, 39, 'Expert'),
(2140, 39, 'Hoggar'),
(2141, 39, 'iOn'),
(2142, 39, 'Pars'),
(2143, 39, 'Partner'),
(2144, 39, 'Persia'),
(2145, 39, 'RCZ'),
(2146, 39, 'Rifter'),
(2147, 39, 'Roa'),
(2148, 39, 'Traveller'),
(2149, 39, 'Другая'),
(2150, 40, 'Acclaim'),
(2151, 40, 'Barracuda'),
(2152, 40, 'Breeze'),
(2153, 40, 'Fury'),
(2154, 40, 'Laser'),
(2155, 40, 'Neon'),
(2156, 40, 'Prowler'),
(2157, 40, 'Reliant'),
(2158, 40, 'Sundance'),
(2159, 40, 'Voyager'),
(2160, 40, 'Другая'),
(2161, 41, 'Другая'),
(2162, 42, 'Другая'),
(2163, 152, '118NE'),
(2164, 152, 'Другая'),
(2165, 153, 'Juara'),
(2166, 153, 'Perdana'),
(2167, 153, 'Persona 300 Compact'),
(2168, 153, 'Persona 400'),
(2169, 153, 'Saga'),
(2170, 153, 'Saloon'),
(2171, 153, 'Waja'),
(2172, 153, 'Другая'),
(2173, 154, ' AM4'),
(2174, 154, 'AMV'),
(2175, 154, 'Другая'),
(2176, 155, '3'),
(2177, 155, 'Другая'),
(2178, 156, 'Mangusta'),
(2179, 156, 'Другая'),
(2180, 157, '1500'),
(2181, 157, 'Другая'),
(2182, 158, 'Gentra'),
(2183, 158, 'Matiz'),
(2184, 158, 'Nexia'),
(2185, 158, 'R2'),
(2186, 158, 'R4'),
(2187, 158, 'Другая'),
(2188, 159, 'Scimitar SS1'),
(2189, 159, 'Другая'),
(2190, 160, 'Tropica Roadster'),
(2191, 160, 'Другая'),
(2192, 44, '10'),
(2193, 44, '11'),
(2194, 44, '12'),
(2195, 44, '14'),
(2196, 44, '15'),
(2197, 44, '16'),
(2198, 44, '17'),
(2199, 44, '18'),
(2200, 44, '19'),
(2201, 44, '20'),
(2202, 44, '21'),
(2203, 44, '25'),
(2204, 44, '3'),
(2205, 44, '30'),
(2206, 44, '4'),
(2207, 44, '5'),
(2208, 44, '6'),
(2209, 44, '7'),
(2210, 44, '8'),
(2211, 44, '9'),
(2212, 44, 'Alaskan'),
(2213, 44, 'Alliance'),
(2214, 44, 'Avantime'),
(2215, 44, 'Caravelle'),
(2216, 44, 'Celtaquatre'),
(2217, 44, 'Clio'),
(2218, 44, 'Colorale'),
(2219, 44, 'Dauphine'),
(2220, 44, 'Dokker'),
(2221, 44, 'Duster'),
(2222, 44, 'Espace'),
(2223, 44, 'Express'),
(2224, 44, 'Floride'),
(2225, 44, 'Fluence'),
(2226, 44, 'Fregate'),
(2227, 44, 'Fuego'),
(2228, 44, 'Juvaquatre'),
(2229, 44, 'Kadjar'),
(2230, 44, 'Kangoo'),
(2231, 44, 'Kaptur'),
(2232, 44, 'Koleos'),
(2233, 44, 'Kwid'),
(2234, 44, 'Laguna'),
(2235, 44, 'Latitude'),
(2236, 44, 'Le Car'),
(2237, 44, 'Logan'),
(2238, 44, 'Lutecia'),
(2239, 44, 'Megane'),
(2240, 44, 'Modus'),
(2241, 44, 'Monaquatre'),
(2242, 44, 'Primaquatre'),
(2243, 44, 'Pulse'),
(2244, 44, 'Rodeo'),
(2245, 44, 'Safrane'),
(2246, 44, 'Sandero'),
(2247, 44, 'Scala'),
(2248, 44, 'Scenic'),
(2249, 44, 'Sport Spider'),
(2250, 44, 'Symbol'),
(2251, 44, 'Talisman'),
(2252, 44, 'Thalia'),
(2253, 44, 'Torino'),
(2254, 44, 'Trafic'),
(2255, 44, 'Twingo'),
(2256, 44, 'Twizy'),
(2257, 44, 'Vel Satis'),
(2258, 44, 'Wind'),
(2259, 44, 'Zoe'),
(2260, 44, 'Другая'),
(2261, 45, 'Camargue'),
(2262, 45, 'Corniche'),
(2263, 45, 'Dawn'),
(2264, 45, 'Flying Spur'),
(2265, 45, 'Ghost'),
(2266, 45, 'Park Ward'),
(2267, 45, 'Phantom'),
(2268, 45, 'Silver Cloud'),
(2269, 45, 'Silver Dawn'),
(2270, 45, 'Silver Seraph'),
(2271, 45, 'Silver Spirit'),
(2272, 45, 'Silver Spur'),
(2273, 45, 'Silver Wraith'),
(2274, 45, 'Wraith'),
(2275, 45, 'Другая'),
(2276, 202, 'Lightning'),
(2277, 202, 'Другая'),
(2278, 203, '10'),
(2279, 203, '100'),
(2280, 203, '14'),
(2281, 203, '16'),
(2282, 203, '200 Series'),
(2283, 203, '25'),
(2284, 203, '400 Series'),
(2285, 203, '416i'),
(2286, 203, '45'),
(2287, 203, '600 Series'),
(2288, 203, '75'),
(2289, 203, '800 Series'),
(2290, 203, 'CityRover'),
(2291, 203, 'Maestro'),
(2292, 203, 'Metro'),
(2293, 203, 'Mini MK'),
(2294, 203, 'Montego'),
(2295, 203, 'P3'),
(2296, 203, 'P4'),
(2297, 203, 'P5'),
(2298, 203, 'P6'),
(2299, 203, 'Quintet'),
(2300, 203, 'SD1'),
(2301, 203, 'Streetwise'),
(2302, 203, 'Другая'),
(2303, 47, '9-2X'),
(2304, 47, '9-3'),
(2305, 47, '9-5'),
(2306, 47, '9-7X'),
(2307, 47, '90'),
(2308, 47, '900'),
(2309, 47, '9000'),
(2310, 47, '95'),
(2311, 47, '96'),
(2312, 47, '99'),
(2313, 47, 'Другая'),
(2314, 161, 'S7'),
(2315, 161, 'Другая'),
(2316, 162, 'PS10'),
(2317, 162, 'Другая'),
(2318, 204, 'SM3'),
(2319, 204, 'SM5'),
(2320, 204, 'SM7'),
(2321, 204, 'Другая'),
(2322, 163, 'Astra'),
(2323, 163, 'Aura'),
(2324, 163, 'ION'),
(2325, 163, 'L-Series'),
(2326, 163, 'Outlook'),
(2327, 163, 'Relay'),
(2328, 163, 'S-Series'),
(2329, 163, 'Sky'),
(2330, 163, 'VUE'),
(2331, 163, 'Другая'),
(2332, 164, 'FR-S'),
(2333, 164, 'iQ'),
(2334, 164, 'tC'),
(2335, 164, 'xA'),
(2336, 164, 'xB'),
(2337, 164, 'xD'),
(2338, 164, 'Другая'),
(2339, 48, '1200/1430 Sport'),
(2340, 48, '124'),
(2341, 48, '127'),
(2342, 48, '128'),
(2343, 48, '131'),
(2344, 48, '132'),
(2345, 48, '133'),
(2346, 48, '1400'),
(2347, 48, '1430'),
(2348, 48, '1500'),
(2349, 48, '600/800'),
(2350, 48, '850'),
(2351, 48, 'Alhambra'),
(2352, 48, 'Altea'),
(2353, 48, 'Arosa'),
(2354, 48, 'Ateca'),
(2355, 48, 'Cordoba'),
(2356, 48, 'Exeo'),
(2357, 48, 'Fura'),
(2358, 48, 'Ibiza'),
(2359, 48, 'Leon'),
(2360, 48, 'Malaga'),
(2361, 48, 'Marbella'),
(2362, 48, 'Mii'),
(2363, 48, 'Panda'),
(2364, 48, 'Ritmo'),
(2365, 48, 'Ronda'),
(2366, 48, 'Toledo'),
(2367, 48, 'Другая'),
(2368, 165, '100'),
(2369, 165, '1000 MB'),
(2370, 165, '105/120/130'),
(2371, 165, '1201'),
(2372, 165, '1202'),
(2373, 165, '440/445/450'),
(2374, 165, 'Citigo'),
(2375, 165, 'Fabia'),
(2376, 165, 'Favorit'),
(2377, 165, 'Felicia'),
(2378, 165, 'Forman'),
(2379, 165, 'Garde'),
(2380, 165, 'Karoq'),
(2381, 165, 'Kodiaq'),
(2382, 165, 'Laura'),
(2383, 165, 'Octavia'),
(2384, 165, 'Rapid'),
(2385, 165, 'Roomster'),
(2386, 165, 'Superb'),
(2387, 165, 'VOS'),
(2388, 165, 'Yeti'),
(2389, 165, 'Другая'),
(2390, 49, 'Forfour'),
(2391, 49, 'Fortwo'),
(2392, 49, 'Roadster'),
(2393, 49, 'Другая'),
(2394, 166, 'Actyon'),
(2395, 166, 'Chairman'),
(2396, 166, 'Kallista'),
(2397, 166, 'Korando'),
(2398, 166, 'Korando Family'),
(2399, 166, 'Korando Turismo'),
(2400, 166, 'Kyron'),
(2401, 166, 'Musso'),
(2402, 166, 'Nomad'),
(2403, 166, 'Rexton'),
(2404, 166, 'Rodius'),
(2405, 166, 'Stavic'),
(2406, 166, 'Tager'),
(2407, 166, 'Tivoli'),
(2408, 166, 'Другая'),
(2409, 167, '1000'),
(2410, 167, '1500'),
(2411, 167, 'Alcyone'),
(2412, 167, 'Baja'),
(2413, 167, 'Bighorn'),
(2414, 167, 'BRAT'),
(2415, 167, 'BRZ'),
(2416, 167, 'Dex'),
(2417, 167, 'Domingo'),
(2418, 167, 'Estratto'),
(2419, 167, 'Exiga'),
(2420, 167, 'Exiga Crossover 7'),
(2421, 167, 'FF-1'),
(2422, 167, 'Fiori'),
(2423, 167, 'Forester'),
(2424, 167, 'Impreza'),
(2425, 167, 'Justy'),
(2426, 167, 'Legacy'),
(2427, 167, 'Legacy Lancaster'),
(2428, 167, 'Leone'),
(2429, 167, 'Levorg'),
(2430, 167, 'Libero'),
(2431, 167, 'Loyale'),
(2432, 167, 'Lucra'),
(2433, 167, 'Mini Jumbo'),
(2434, 167, 'Outback'),
(2435, 167, 'Pleo'),
(2436, 167, 'R1'),
(2437, 167, 'R2'),
(2438, 167, 'Rex'),
(2439, 167, 'Sambar'),
(2440, 167, 'Stella'),
(2441, 167, 'SVX'),
(2442, 167, 'Traviq'),
(2443, 167, 'Trezia'),
(2444, 167, 'Tribeca'),
(2445, 167, 'Vivio'),
(2446, 167, 'Vortex'),
(2447, 167, 'XT'),
(2448, 167, 'XV'),
(2449, 167, 'Другая'),
(2450, 50, 'Aerio'),
(2451, 50, 'Alto'),
(2452, 50, 'APV'),
(2453, 50, 'Baleno'),
(2454, 50, 'Beidouxing'),
(2455, 50, 'Cappuccino'),
(2456, 50, 'Carry'),
(2457, 50, 'Celerio'),
(2458, 50, 'Cervo'),
(2459, 50, 'Cultus'),
(2460, 50, 'Cultus Crescent'),
(2461, 50, 'Equator'),
(2462, 50, 'Ertiga'),
(2463, 50, 'Escudo'),
(2464, 50, 'Esteem'),
(2465, 50, 'Every'),
(2466, 50, 'Forenza'),
(2467, 50, 'Forsa'),
(2468, 50, 'Fronte'),
(2469, 50, 'Fun'),
(2470, 50, 'Grand Escudo'),
(2471, 50, 'Grand Nomade'),
(2472, 50, 'Grand Vitara'),
(2473, 50, 'Hustler'),
(2474, 50, 'Ignis'),
(2475, 50, 'Jimny'),
(2476, 50, 'Karimun Estilo'),
(2477, 50, 'Kei'),
(2478, 50, 'Khyber'),
(2479, 50, 'Kizashi'),
(2480, 50, 'Landy'),
(2481, 50, 'Lapin'),
(2482, 50, 'Liana'),
(2483, 50, 'Margalla'),
(2484, 50, 'Mehran'),
(2485, 50, 'Mighty Boy'),
(2486, 50, 'MR Wagon'),
(2487, 50, 'Palette'),
(2488, 50, 'Potohar'),
(2489, 50, 'Reno'),
(2490, 50, 'Samurai'),
(2491, 50, 'Santana'),
(2492, 50, 'SC100'),
(2493, 50, 'Sidekick'),
(2494, 50, 'Sierra'),
(2495, 50, 'Solio'),
(2496, 50, 'Splash'),
(2497, 50, 'Swift'),
(2498, 50, 'SX4'),
(2499, 50, 'Verona'),
(2500, 50, 'Vitara'),
(2501, 50, 'Wagon R'),
(2502, 50, 'X-90'),
(2503, 50, 'XL7'),
(2504, 50, 'Другая'),
(2505, 168, 'Solara'),
(2506, 168, 'Другая'),
(2507, 169, 'Estate'),
(2508, 169, 'Indica'),
(2509, 169, 'Indigo'),
(2510, 169, 'Mint'),
(2511, 169, 'Safari'),
(2512, 169, 'Sierra'),
(2513, 169, 'Sumo'),
(2514, 169, 'Telcoline'),
(2515, 169, 'Xenon'),
(2516, 169, 'Другая'),
(2517, 170, 'Beta'),
(2518, 170, 'T600'),
(2519, 170, 'T603'),
(2520, 170, 'T613'),
(2521, 170, 'T700'),
(2522, 170, 'T87'),
(2523, 170, 'Другая'),
(2524, 171, 'Model 3'),
(2525, 171, 'Model S'),
(2526, 171, 'Model X'),
(2527, 171, 'Roadster'),
(2528, 171, 'Другая'),
(2529, 172, 'Century'),
(2530, 172, 'Chenglong'),
(2531, 172, 'Dragon'),
(2532, 172, 'Другая'),
(2533, 173, 'Admiral'),
(2534, 173, 'Другая'),
(2535, 174, '131'),
(2536, 174, 'Albea'),
(2537, 174, 'Brava'),
(2538, 174, 'Bravo'),
(2539, 174, 'Doblo'),
(2540, 174, 'Dogan'),
(2541, 174, 'Kartal'),
(2542, 174, 'Palio'),
(2543, 174, 'Sahin'),
(2544, 174, 'Serce'),
(2545, 174, 'Siena'),
(2546, 174, 'Tempra'),
(2547, 174, 'Tipo'),
(2548, 174, 'UNO'),
(2549, 174, 'Другая'),
(2550, 51, '2000GT'),
(2551, 51, '4Runner'),
(2552, 51, 'AA'),
(2553, 51, 'AB'),
(2554, 51, 'AC'),
(2555, 51, 'AE'),
(2556, 51, 'Agya'),
(2557, 51, 'Allex'),
(2558, 51, 'Allion'),
(2559, 51, 'Alphard'),
(2560, 51, 'Altezza'),
(2561, 51, 'Aqua'),
(2562, 51, 'Aristo'),
(2563, 51, 'Aurion'),
(2564, 51, 'Auris'),
(2565, 51, 'Avalon'),
(2566, 51, 'Avanza'),
(2567, 51, 'Avensis'),
(2568, 51, 'Avensis Verso'),
(2569, 51, 'Aygo'),
(2570, 51, 'bB'),
(2571, 51, 'Belta'),
(2572, 51, 'Blade'),
(2573, 51, 'Blizzard'),
(2574, 51, 'Brevis'),
(2575, 51, 'Briska'),
(2576, 51, 'C-HR'),
(2577, 51, 'Caldina'),
(2578, 51, 'Cami'),
(2579, 51, 'Camry'),
(2580, 51, 'Camry Solara'),
(2581, 51, 'Carina'),
(2582, 51, 'Carina ED'),
(2583, 51, 'Carri'),
(2584, 51, 'Cavalier'),
(2585, 51, 'Celica'),
(2586, 51, 'Celsior'),
(2587, 51, 'Century'),
(2588, 51, 'Chaser'),
(2589, 51, 'Classic'),
(2590, 51, 'Comfort'),
(2591, 51, 'Condor'),
(2592, 51, 'Corolla'),
(2593, 51, 'Corolla Axio'),
(2594, 51, 'Corolla Ceres'),
(2595, 51, 'Corolla Levin'),
(2596, 51, 'Corolla Rumion'),
(2597, 51, 'Corolla Spacio'),
(2598, 51, 'Corolla Verso'),
(2599, 51, 'Corona'),
(2600, 51, 'Corsa'),
(2601, 51, 'Cressida'),
(2602, 51, 'Cresta'),
(2603, 51, 'Crown'),
(2604, 51, 'Crown Majesta'),
(2605, 51, 'Crown Majesta'),
(2606, 51, 'Curren'),
(2607, 51, 'Cynos'),
(2608, 51, 'Duet'),
(2609, 51, 'Echo'),
(2610, 51, 'Esquire'),
(2611, 51, 'Estima'),
(2612, 51, 'Etios'),
(2613, 51, 'FJ Cruiser'),
(2614, 51, 'Fortuner'),
(2615, 51, 'Fun Cargo'),
(2616, 51, 'Gaia'),
(2617, 51, 'Granvia'),
(2618, 51, 'GT 86'),
(2619, 51, 'Harrier'),
(2620, 51, 'Hiace'),
(2621, 51, 'Highlander'),
(2622, 51, 'Hilux'),
(2623, 51, 'Hilux Surf'),
(2624, 51, 'Innova'),
(2625, 51, 'Ipsum'),
(2626, 51, 'iQ'),
(2627, 51, 'Isis'),
(2628, 51, 'Ist'),
(2629, 51, 'Kijang'),
(2630, 51, 'Kluger'),
(2631, 51, 'Land Cruiser'),
(2632, 51, 'Land Cruiser Prado'),
(2633, 51, 'Lexcen'),
(2634, 51, 'Lite Ace'),
(2635, 51, 'Lite Ace Noah'),
(2636, 51, 'Mark II'),
(2637, 51, 'Mark X'),
(2638, 51, 'Mark X Zio'),
(2639, 51, 'Master'),
(2640, 51, 'MasterAce'),
(2641, 51, 'Matrix'),
(2642, 51, 'Mega Cruiser'),
(2643, 51, 'MiniAce'),
(2644, 51, 'Mirai'),
(2645, 51, 'Model F'),
(2646, 51, 'MR-S'),
(2647, 51, 'MR2'),
(2648, 51, 'Nadia'),
(2649, 51, 'Noah'),
(2650, 51, 'Opa'),
(2651, 51, 'Origin'),
(2652, 51, 'Paseo'),
(2653, 51, 'Passo'),
(2654, 51, 'Passo Sette'),
(2655, 51, 'Picnic'),
(2656, 51, 'Pixis'),
(2657, 51, 'Platz'),
(2658, 51, 'Porte'),
(2659, 51, 'Premio'),
(2660, 51, 'Previa'),
(2661, 51, 'Prius'),
(2662, 51, 'Prius a'),
(2663, 51, 'Prius C'),
(2664, 51, 'Prius Plus'),
(2665, 51, 'Prius V'),
(2666, 51, 'Probox'),
(2667, 51, 'Progres'),
(2668, 51, 'Pronard'),
(2669, 51, 'Publica'),
(2670, 51, 'Quantum'),
(2671, 51, 'Ractis'),
(2672, 51, 'Raum'),
(2673, 51, 'RAV4'),
(2674, 51, 'Reiz'),
(2675, 51, 'Rukus'),
(2676, 51, 'Rush'),
(2677, 51, 'Sai'),
(2679, 51, 'Scepter'),
(2680, 51, 'Sequoia'),
(2681, 51, 'Sera'),
(2682, 51, 'Sienna'),
(2683, 51, 'Sienta'),
(2684, 51, 'Soarer'),
(2685, 51, 'Soluna'),
(2686, 51, 'Space Cruiser'),
(2687, 51, 'Sparky'),
(2688, 51, 'Sports 800'),
(2689, 51, 'Sprinter'),
(2690, 51, 'Sprinter Carib'),
(2691, 51, 'Sprinter Marino'),
(2692, 51, 'Sprinter Trueno'),
(2693, 51, 'Stallion'),
(2694, 51, 'Starlet'),
(2695, 51, 'Stout'),
(2696, 51, 'Succeed'),
(2697, 51, 'Super'),
(2698, 51, 'Supra'),
(2699, 51, 'T100'),
(2700, 51, 'Tacoma'),
(2701, 51, 'Tamaraw FX'),
(2702, 51, 'Tarago'),
(2703, 51, 'Tazz'),
(2704, 51, 'Tercel'),
(2705, 51, 'Tiara'),
(2706, 51, 'Town Ace'),
(2707, 51, 'Town Ace Noah'),
(2708, 51, 'Tundra'),
(2709, 51, 'Unser'),
(2710, 51, 'Urban Cruiser'),
(2711, 51, 'Vanguard'),
(2712, 51, 'Vellfire'),
(2713, 51, 'Venture');
INSERT INTO `oc_t_item_car_model_attr` (`pk_i_id`, `fk_i_make_id`, `s_name`) VALUES
(2714, 51, 'Venza'),
(2715, 51, 'Verossa'),
(2716, 51, 'Verso'),
(2717, 51, 'Verso-S'),
(2718, 51, 'Vienta'),
(2719, 51, 'Vios'),
(2720, 51, 'Vista'),
(2721, 51, 'Vitz'),
(2722, 51, 'Voltz'),
(2723, 51, 'Voxy'),
(2724, 51, 'Will Cypha'),
(2725, 51, 'Will Vi'),
(2726, 51, 'Will VS'),
(2727, 51, 'Windom'),
(2728, 51, 'Wish'),
(2729, 51, 'Yaris'),
(2730, 51, 'Yaris Verso'),
(2731, 51, 'Zace'),
(2732, 51, 'Zelas'),
(2733, 51, 'Другая'),
(2734, 175, '400'),
(2735, 175, 'Cerbera'),
(2736, 175, 'Chimaera'),
(2737, 175, 'Griffith'),
(2738, 175, 'S'),
(2739, 175, 'Tamora'),
(2740, 175, 'Tuscan'),
(2741, 175, 'Другая'),
(2742, 176, 'Adam'),
(2743, 176, 'Astra'),
(2744, 176, 'Carlton'),
(2745, 176, 'Royale'),
(2746, 176, 'Vectra'),
(2747, 176, 'Ventora'),
(2748, 176, 'Viceroy'),
(2749, 176, 'Victor'),
(2750, 176, 'Viva'),
(2751, 176, 'VXR8'),
(2752, 176, 'Другая'),
(2753, 177, 'W8'),
(2754, 177, 'Другая'),
(2755, 178, '210'),
(2756, 178, '260 LM'),
(2757, 178, '300'),
(2758, 178, '400'),
(2759, 178, 'Другая'),
(2760, 52, 'Amarok'),
(2761, 52, 'Arteon'),
(2762, 52, 'Beetle'),
(2763, 52, 'Bora'),
(2764, 52, 'Brasilia'),
(2765, 52, 'Caddy'),
(2766, 52, 'California'),
(2767, 52, 'Caravelle'),
(2768, 52, 'Citi Golf'),
(2769, 52, 'Clasico'),
(2770, 52, 'Corrado'),
(2771, 52, 'Country Buggy'),
(2772, 52, 'Derby'),
(2773, 52, 'Dune Buggy'),
(2774, 52, 'Eos'),
(2775, 52, 'Fox'),
(2776, 52, 'Gol'),
(2777, 52, 'Golf'),
(2778, 52, 'Iltis'),
(2779, 52, 'Jetta'),
(2780, 52, 'Karmann Ghia'),
(2781, 52, 'Lavida'),
(2782, 52, 'Lupo'),
(2783, 52, 'Magotan'),
(2784, 52, 'Multivan'),
(2785, 52, 'Parati'),
(2786, 52, 'Passat'),
(2787, 52, 'Passat CC'),
(2788, 52, 'Phaeton'),
(2789, 52, 'Pointer'),
(2790, 52, 'Polo'),
(2791, 52, 'Quantum'),
(2792, 52, 'Rabbit'),
(2793, 52, 'Routan'),
(2794, 52, 'Sagitar'),
(2795, 52, 'Santana'),
(2796, 52, 'Saveiro'),
(2797, 52, 'Scirocco'),
(2798, 52, 'Sharan'),
(2799, 52, 'SP2'),
(2800, 52, 'Suran'),
(2801, 52, 'T-Roc'),
(2802, 52, 'Taro'),
(2803, 52, 'Teramont'),
(2804, 52, 'Tiguan'),
(2805, 52, 'Touareg'),
(2806, 52, 'Touran'),
(2807, 52, 'Transporter'),
(2808, 52, 'Up'),
(2809, 52, 'Vento'),
(2810, 52, 'Voyage'),
(2811, 52, 'Другая'),
(2813, 53, '120'),
(2814, 53, '140'),
(2815, 53, '164'),
(2816, 53, '240'),
(2817, 53, '260'),
(2818, 53, '340'),
(2819, 53, '360'),
(2820, 53, '440'),
(2821, 53, '460'),
(2822, 53, '480'),
(2823, 53, '66'),
(2824, 53, '740'),
(2825, 53, '760'),
(2826, 53, '780'),
(2827, 53, '850'),
(2828, 53, '940'),
(2829, 53, '960'),
(2830, 53, 'Amazon'),
(2831, 53, 'C30'),
(2832, 53, 'C70'),
(2833, 53, 'Duett'),
(2834, 53, 'P1800'),
(2835, 53, 'PV444/544'),
(2836, 53, 'PV60'),
(2837, 53, 'S40'),
(2838, 53, 'S60'),
(2839, 53, 'S70'),
(2840, 53, 'S80'),
(2841, 53, 'S90'),
(2842, 53, 'V40'),
(2843, 53, 'V50'),
(2844, 53, 'V60'),
(2845, 53, 'V70'),
(2846, 53, 'V90'),
(2847, 53, 'XC40'),
(2848, 53, 'XC60'),
(2849, 53, 'XC70'),
(2850, 53, 'XC90'),
(2851, 53, 'Другая'),
(2852, 179, 'Corda'),
(2853, 179, 'Estina'),
(2854, 179, 'Tingo'),
(2855, 179, 'Другая'),
(2856, 180, '353'),
(2857, 180, 'Другая'),
(2858, 181, 'Megabusa'),
(2859, 181, 'Seight'),
(2860, 181, 'Другая'),
(2861, 182, 'GT MF4'),
(2862, 182, 'GT MF5'),
(2863, 182, 'MF3'),
(2864, 182, 'Другая'),
(2865, 183, 'MB'),
(2866, 183, 'Другая'),
(2867, 184, 'Sunshine'),
(2868, 184, 'Xingwang'),
(2869, 184, 'Другая'),
(2870, 185, 'PICKUP X3'),
(2871, 185, 'SR-V X3'),
(2872, 185, 'SUV X3'),
(2873, 185, 'Другая'),
(2874, 186, 'Yugo Florida'),
(2875, 186, 'Yugo Koral'),
(2876, 186, 'Yugo Skala'),
(2877, 186, 'Другая'),
(2878, 187, 'MK2'),
(2879, 187, 'Другая'),
(2880, 188, 'T600'),
(2881, 188, 'Z300'),
(2882, 188, 'Другая'),
(2883, 189, 'Admiral'),
(2884, 189, 'GrandTiger'),
(2885, 189, 'Landmark'),
(2886, 189, 'Другая'),
(2887, 190, '1111 Ока'),
(2888, 190, '2101'),
(2889, 190, '2102'),
(2890, 190, '2103'),
(2891, 190, '2104'),
(2892, 190, '2105'),
(2893, 190, '2106'),
(2894, 190, '2107'),
(2895, 190, '2108'),
(2896, 190, '2109'),
(2897, 190, '21099'),
(2898, 190, '2110'),
(2899, 190, '2111'),
(2900, 190, '2112'),
(2901, 190, '2113'),
(2902, 190, '2114'),
(2903, 190, '2115'),
(2904, 190, '2120 Надежда'),
(2905, 190, '2123'),
(2906, 190, '4x4'),
(2907, 190, 'Granta'),
(2908, 190, 'Kalina'),
(2909, 190, 'Largus'),
(2910, 190, 'Priora'),
(2911, 190, 'Vesta'),
(2912, 190, 'XRAY'),
(2913, 190, 'Другая'),
(2914, 191, '13 Чайка'),
(2915, 191, '14 Чайка'),
(2916, 191, '21 Волга'),
(2917, 191, '2308 Атаман'),
(2918, 191, '233001 Тигр'),
(2919, 191, '24 Волга'),
(2920, 191, '3102 Волга'),
(2921, 191, '310221 Волга'),
(2922, 191, '31029 Волга'),
(2923, 191, '3105 Волга'),
(2924, 191, '3110 Волга'),
(2925, 191, '31105 Волга'),
(2926, 191, '3111'),
(2927, 191, '67'),
(2928, 191, '69'),
(2929, 191, 'Siber'),
(2930, 191, 'М-1'),
(2931, 191, 'М-12 ЗиМ'),
(2932, 191, 'М-20 Победа'),
(2933, 191, 'Соболь'),
(2934, 192, '1102'),
(2935, 192, '1103'),
(2936, 192, '1105'),
(2937, 192, '965'),
(2938, 192, '966'),
(2939, 192, '968'),
(2940, 192, 'Chance'),
(2941, 192, 'Forza'),
(2942, 192, 'Lanos'),
(2943, 192, 'Sens'),
(2944, 192, 'Vida'),
(2945, 192, 'Другая'),
(2946, 193, '110'),
(2947, 193, '114'),
(2948, 193, '117'),
(2949, 193, '4104'),
(2950, 193, 'Другая'),
(2951, 194, '2125'),
(2952, 194, '2126'),
(2953, 194, '21261'),
(2954, 194, '2715'),
(2955, 194, '2717'),
(2956, 194, 'Другая'),
(2957, 195, 'T98'),
(2958, 195, 'Другая'),
(2959, 196, '1302'),
(2960, 196, '969'),
(2961, 196, 'Другая'),
(2962, 197, '2136'),
(2963, 197, '2137'),
(2964, 197, '2138'),
(2965, 197, '2140'),
(2966, 197, '2141'),
(2967, 197, '2315'),
(2968, 197, '2335'),
(2969, 197, '2733'),
(2970, 197, '2734'),
(2971, 197, '400'),
(2972, 197, '401'),
(2973, 197, '402'),
(2974, 197, '403'),
(2975, 197, '407'),
(2976, 197, '408'),
(2977, 197, '410'),
(2978, 197, '411'),
(2979, 197, '412'),
(2980, 197, '423'),
(2981, 197, '426'),
(2982, 197, '427'),
(2983, 197, '431'),
(2984, 197, 'Иван Калита'),
(2985, 197, 'Князь Владимир'),
(2986, 197, 'Святогор'),
(2987, 197, 'Юрий Долгорукий'),
(2988, 197, 'Другая'),
(2989, 201, 'Прочие иномарки'),
(2990, 201, 'Прочие русские машины'),
(2991, 201, 'Самособранные'),
(2992, 201, 'Другая'),
(2993, 198, 'Мотоколяска'),
(2994, 198, 'С-3Д'),
(2995, 198, 'Другая'),
(2996, 199, 'Aquila'),
(2997, 199, 'C10'),
(2998, 199, 'C190'),
(2999, 199, 'C30'),
(3000, 199, 'Road Partner'),
(3001, 199, 'Tager'),
(3002, 199, 'Vega'),
(3003, 199, 'Другая'),
(3008, 200, '3128 \"Астеро\"'),
(3009, 200, '3151'),
(3010, 200, '3153'),
(3011, 200, '3159 \"Барс\"'),
(3012, 200, '3160'),
(3013, 200, '3162 \"Simbir\"'),
(3014, 200, '452'),
(3015, 200, '469'),
(3016, 200, 'Hunter'),
(3017, 200, 'Patriot'),
(3018, 200, 'Pickup'),
(3019, 200, 'Другая');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_item_car_vehicle_type_attr`
--

CREATE TABLE `oc_t_item_car_vehicle_type_attr` (
  `pk_i_id` int(2) UNSIGNED NOT NULL,
  `fk_c_locale_code` char(5) NOT NULL,
  `s_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_t_item_car_vehicle_type_attr`
--

INSERT INTO `oc_t_item_car_vehicle_type_attr` (`pk_i_id`, `fk_c_locale_code`, `s_name`) VALUES
(1, 'ru_RU', 'седан'),
(2, 'ru_RU', 'хетчбэк'),
(3, 'ru_RU', 'универсал'),
(4, 'ru_RU', 'внедорожник'),
(5, 'ru_RU', 'кабриолет'),
(6, 'ru_RU', 'купе'),
(7, 'ru_RU', 'лимузин'),
(8, 'ru_RU', 'минивэн'),
(9, 'ru_RU', 'пикап'),
(10, 'ru_RU', 'фургон'),
(11, 'ru_RU', 'микроавтобус');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_item_comment`
--

CREATE TABLE `oc_t_item_comment` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `fk_i_item_id` int(10) UNSIGNED NOT NULL,
  `dt_pub_date` datetime NOT NULL,
  `s_title` varchar(200) NOT NULL,
  `s_author_name` varchar(100) NOT NULL,
  `s_author_email` varchar(100) NOT NULL,
  `s_body` text NOT NULL,
  `b_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `b_active` tinyint(1) NOT NULL DEFAULT '0',
  `b_spam` tinyint(1) NOT NULL DEFAULT '0',
  `fk_i_user_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_item_deleted_expired_ads`
--

CREATE TABLE `oc_t_item_deleted_expired_ads` (
  `fk_i_item_id` int(10) UNSIGNED NOT NULL,
  `status` varchar(28) NOT NULL,
  `user_id` int(10) NOT NULL,
  `item_title` varchar(240) NOT NULL,
  `deleted` varchar(140) NOT NULL,
  `deleted_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_item_description`
--

CREATE TABLE `oc_t_item_description` (
  `fk_i_item_id` int(10) UNSIGNED NOT NULL,
  `fk_c_locale_code` char(5) NOT NULL,
  `s_title` varchar(100) NOT NULL,
  `s_description` mediumtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_t_item_description`
--

INSERT INTO `oc_t_item_description` (`fk_i_item_id`, `fk_c_locale_code`, `s_title`, `s_description`) VALUES
(49, 'ru_RU', 'Пробное объявление', 'Пробное объявление - продам авто'),
(0, 'ru_RU', 'Продам кота', 'Хороший кот, ласковый, ест мало, мурчит');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_item_favorite_ads`
--

CREATE TABLE `oc_t_item_favorite_ads` (
  `id` int(10) UNSIGNED NOT NULL,
  `fk_i_item_id` int(10) UNSIGNED DEFAULT NULL,
  `fk_i_user_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_item_location`
--

CREATE TABLE `oc_t_item_location` (
  `fk_i_item_id` int(10) UNSIGNED NOT NULL,
  `fk_c_country_code` char(2) DEFAULT NULL,
  `s_country` varchar(40) DEFAULT NULL,
  `s_address` varchar(100) DEFAULT NULL,
  `s_zip` varchar(15) DEFAULT NULL,
  `fk_i_region_id` int(10) UNSIGNED DEFAULT NULL,
  `s_region` varchar(100) DEFAULT NULL,
  `fk_i_city_id` int(10) UNSIGNED DEFAULT NULL,
  `s_city` varchar(100) DEFAULT NULL,
  `fk_i_city_area_id` int(10) UNSIGNED DEFAULT NULL,
  `s_city_area` varchar(200) DEFAULT NULL,
  `d_coord_lat` decimal(10,6) DEFAULT NULL,
  `d_coord_long` decimal(10,6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_t_item_location`
--

INSERT INTO `oc_t_item_location` (`fk_i_item_id`, `fk_c_country_code`, `s_country`, `s_address`, `s_zip`, `fk_i_region_id`, `s_region`, `fk_i_city_id`, `s_city`, `fk_i_city_area_id`, `s_city_area`, `d_coord_lat`, `d_coord_long`) VALUES
(49, 'RU', 'Россия', 'ул. Ленина', NULL, 43, 'Мурманская область', 607, 'Заполярный', NULL, '123456789', NULL, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_item_meta`
--

CREATE TABLE `oc_t_item_meta` (
  `fk_i_item_id` int(10) UNSIGNED NOT NULL,
  `fk_i_field_id` int(10) UNSIGNED NOT NULL,
  `s_value` text,
  `s_multi` varchar(20) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_item_renew_ads`
--

CREATE TABLE `oc_t_item_renew_ads` (
  `fk_i_item_id` int(10) UNSIGNED NOT NULL,
  `d_renewed` int(20) NOT NULL,
  `published` datetime DEFAULT NULL,
  `last_renewed` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_item_resource`
--

CREATE TABLE `oc_t_item_resource` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `fk_i_item_id` int(10) UNSIGNED NOT NULL,
  `s_name` varchar(60) DEFAULT NULL,
  `s_extension` varchar(10) DEFAULT NULL,
  `s_content_type` varchar(40) DEFAULT NULL,
  `s_path` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_t_item_resource`
--

INSERT INTO `oc_t_item_resource` (`pk_i_id`, `fk_i_item_id`, `s_name`, `s_extension`, `s_content_type`, `s_path`) VALUES
(53, 49, '0vIiPiHn', 'jpg', 'image/jpeg', 'oc-content/uploads/0/'),
(54, 49, 'O40nRpe5', 'jpg', 'image/jpeg', 'oc-content/uploads/0/');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_item_seo`
--

CREATE TABLE `oc_t_item_seo` (
  `seo_item_id` int(10) UNSIGNED NOT NULL,
  `seo_title` varchar(800) DEFAULT NULL,
  `seo_description` varchar(1200) DEFAULT NULL,
  `seo_keywords` varchar(800) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_item_stats`
--

CREATE TABLE `oc_t_item_stats` (
  `fk_i_item_id` int(10) UNSIGNED NOT NULL,
  `i_num_views` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `i_num_spam` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `i_num_repeated` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `i_num_bad_classified` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `i_num_offensive` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `i_num_expired` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `i_num_premium_views` int(10) UNSIGNED NOT NULL DEFAULT '0',
  `dt_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_t_item_stats`
--

INSERT INTO `oc_t_item_stats` (`fk_i_item_id`, `i_num_views`, `i_num_spam`, `i_num_repeated`, `i_num_bad_classified`, `i_num_offensive`, `i_num_expired`, `i_num_premium_views`, `dt_date`) VALUES
(49, 1, 0, 0, 0, 0, 0, 0, '2019-09-01');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_item_stats_veronika`
--

CREATE TABLE `oc_t_item_stats_veronika` (
  `fk_i_item_id` int(11) UNSIGNED NOT NULL,
  `i_num_phone_clicks` int(10) DEFAULT '0',
  `dt_date` date NOT NULL DEFAULT '0000-00-00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_item_veronika`
--

CREATE TABLE `oc_t_item_veronika` (
  `fk_i_item_id` int(11) UNSIGNED NOT NULL,
  `s_phone` varchar(100) DEFAULT NULL,
  `i_condition` varchar(100) DEFAULT NULL,
  `i_transaction` varchar(100) DEFAULT NULL,
  `i_sold` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_item_watchlist`
--

CREATE TABLE `oc_t_item_watchlist` (
  `id` int(10) UNSIGNED NOT NULL,
  `fk_i_item_id` int(10) UNSIGNED DEFAULT NULL,
  `fk_i_user_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_keywords`
--

CREATE TABLE `oc_t_keywords` (
  `s_md5` varchar(32) NOT NULL,
  `fk_c_locale_code` char(5) NOT NULL,
  `s_original_text` varchar(255) NOT NULL,
  `s_anchor_text` varchar(255) NOT NULL,
  `s_normalized_text` varchar(255) NOT NULL,
  `fk_i_category_id` int(10) UNSIGNED DEFAULT NULL,
  `fk_i_city_id` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_latest_searches`
--

CREATE TABLE `oc_t_latest_searches` (
  `d_date` datetime NOT NULL,
  `s_search` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_locale`
--

CREATE TABLE `oc_t_locale` (
  `pk_c_code` char(5) NOT NULL,
  `s_name` varchar(100) NOT NULL,
  `s_short_name` varchar(40) NOT NULL,
  `s_description` varchar(100) NOT NULL,
  `s_version` varchar(20) NOT NULL,
  `s_author_name` varchar(100) NOT NULL,
  `s_author_url` varchar(100) NOT NULL,
  `s_currency_format` varchar(50) NOT NULL,
  `s_dec_point` varchar(2) DEFAULT '.',
  `s_thousands_sep` varchar(2) DEFAULT '',
  `i_num_dec` tinyint(4) DEFAULT '2',
  `s_date_format` varchar(20) NOT NULL,
  `s_stop_words` text,
  `b_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `b_enabled_bo` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_t_locale`
--

INSERT INTO `oc_t_locale` (`pk_c_code`, `s_name`, `s_short_name`, `s_description`, `s_version`, `s_author_name`, `s_author_url`, `s_currency_format`, `s_dec_point`, `s_thousands_sep`, `i_num_dec`, `s_date_format`, `s_stop_words`, `b_enabled`, `b_enabled_bo`) VALUES
('en_US', 'English (US)', 'English', 'American english translation', '2.3', 'Osclass', 'http://osclass.org/', '{NUMBER} {CURRENCY}', '.', '', 2, 'm/d/Y', 'i,a,about,an,are,as,at,be,by,com,for,from,how,in,is,it,of,on,or,that,the,this,to,was,what,when,where,who,will,with,the', 0, 0),
('ru_RU', 'Russian (RU)', 'Russian', 'Russian translation', 'Osclass 3.5.0', 'Osclass', 'http://os-class.ru/', '{NUMBER} {CURRENCY}', '.', '', 2, 'm/d/Y', 'я,около,являются,как,на,быть,в,потому что,с,как,это,на,или,что,то,тоже,когда,где,кто,будет,через', 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_locations_tmp`
--

CREATE TABLE `oc_t_locations_tmp` (
  `id_location` varchar(10) NOT NULL,
  `e_type` enum('COUNTRY','REGION','CITY') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_log`
--

CREATE TABLE `oc_t_log` (
  `dt_date` datetime NOT NULL,
  `s_section` varchar(50) NOT NULL,
  `s_action` varchar(50) NOT NULL,
  `fk_i_id` int(10) UNSIGNED NOT NULL,
  `s_data` varchar(250) NOT NULL,
  `s_ip` varchar(50) NOT NULL,
  `s_who` varchar(50) NOT NULL,
  `fk_i_who_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_t_log`
--

INSERT INTO `oc_t_log` (`dt_date`, `s_section`, `s_action`, `fk_i_id`, `s_data`, `s_ip`, `s_who`, `fk_i_who_id`) VALUES
('2017-11-22 22:40:32', 'item', 'add', 1, 'Пример объявления', '93.89.218.166', 'admin', 0),
('2017-11-22 20:44:53', 'item', 'add', 2, 'Продаю', '93.89.218.166', 'user', 0),
('2017-11-22 20:47:20', 'item', 'edit', 2, 'Продаю', '93.89.218.166', 'admin', 1),
('2017-11-23 05:36:56', 'itemActions', 'deleteResourcesFromHD', 1, '1', '93.89.218.166', 'admin', 1),
('2017-11-23 05:36:56', 'itemActions', 'deleteResourcesFromHD', 1, '0', '93.89.218.166', 'admin', 1),
('2017-11-23 05:36:56', 'item', 'delete', 1, 'Пример объявления', '93.89.218.166', 'admin', 1),
('2017-11-23 05:36:56', 'Item', 'deleteResourcesFromHD', 1, '1', '93.89.218.166', 'admin', 1),
('2017-11-23 05:36:56', 'Item', 'deleteResourcesFromHD', 1, '0', '93.89.218.166', 'admin', 1),
('2017-11-23 05:36:56', 'itemActions', 'deleteResourcesFromHD', 2, '2', '93.89.218.166', 'admin', 1),
('2017-11-23 05:36:56', 'itemActions', 'deleteResourcesFromHD', 2, '0', '93.89.218.166', 'admin', 1),
('2017-11-23 05:36:56', 'item', 'delete', 2, 'Продаю', '93.89.218.166', 'admin', 1),
('2017-11-23 05:36:56', 'Item', 'deleteResourcesFromHD', 2, '2', '93.89.218.166', 'admin', 1),
('2017-11-23 05:36:56', 'Item', 'deleteResourcesFromHD', 2, '0', '93.89.218.166', 'admin', 1),
('2017-11-23 05:39:01', 'item', 'add', 3, 'Продам слона', '93.89.218.166', 'user', 0),
('2017-11-23 05:44:32', 'itemActions', 'deleteResourcesFromHD', 3, '3', '93.89.218.166', 'admin', 1),
('2017-11-23 05:44:32', 'itemActions', 'deleteResourcesFromHD', 3, '0', '93.89.218.166', 'admin', 1),
('2017-11-23 05:44:32', 'item', 'delete', 3, 'Продам слона', '93.89.218.166', 'admin', 1),
('2017-11-23 05:44:32', 'Item', 'deleteResourcesFromHD', 3, '3', '93.89.218.166', 'admin', 1),
('2017-11-23 05:44:32', 'Item', 'deleteResourcesFromHD', 3, '0', '93.89.218.166', 'admin', 1),
('2017-11-23 05:46:06', 'item', 'add', 4, 'Продам слона', '93.89.218.166', 'user', 0),
('2017-11-23 06:11:59', 'itemActions', 'deleteResourcesFromHD', 4, '4', '93.89.218.166', 'admin', 1),
('2017-11-23 06:11:59', 'item', 'delete resource', 1, '1', '93.89.218.166', 'admin', 1),
('2017-11-23 06:11:59', 'item', 'delete resource backtrace', 1, '#0 osc_deleteResource called@ [/home/user11226/vizitka1.tk/oc-includes/osclass/ItemActions.php:810] / #1 deleteResourcesFromHD called@ [/home/user11226/vizitka1.tk/oc-includes/osclass/ItemActions.php:788] / #2 delete called@ [/home/user11226/vizitka1', '93.89.218.166', 'admin', 1),
('2017-11-23 06:11:59', 'itemActions', 'deleteResourcesFromHD', 4, '1,', '93.89.218.166', 'admin', 1),
('2017-11-23 06:11:59', 'item', 'delete', 4, 'Продам слона', '93.89.218.166', 'admin', 1),
('2017-11-23 06:11:59', 'Item', 'deleteResourcesFromHD', 4, '4', '93.89.218.166', 'admin', 1),
('2017-11-23 06:11:59', 'item', 'delete resource', 1, '1', '93.89.218.166', 'admin', 1),
('2017-11-23 06:11:59', 'item', 'delete resource backtrace', 1, '#0 osc_deleteResource called@ [/home/user11226/vizitka1.tk/oc-includes/osclass/model/Item.php:990] / #1 deleteResourcesFromHD called@ [/home/user11226/vizitka1.tk/oc-includes/osclass/model/Item.php:961] / #2 deleteByPrimaryKey called@ [/home/user1122', '93.89.218.166', 'admin', 1),
('2017-11-23 06:11:59', 'Item', 'deleteResourcesFromHD', 4, '1,', '93.89.218.166', 'admin', 1),
('2017-11-23 06:19:10', 'item', 'add', 5, 'Продам слона', '93.89.218.166', 'user', 0),
('2017-11-23 06:30:58', 'item', 'edit', 5, 'Продам слона', '93.89.218.166', 'admin', 2),
('2017-11-23 06:41:01', 'item', 'add', 6, 'Продам слоняру', '93.89.218.166', 'user', 0),
('2017-11-23 09:10:19', 'Item', 'deleteResourcesFromHD', 5, '5', '93.89.218.166', 'admin', 1),
('2017-11-23 09:10:19', 'item', 'delete resource', 2, '2', '93.89.218.166', 'admin', 1),
('2017-11-23 09:10:19', 'item', 'delete resource backtrace', 2, '#0 osc_deleteResource called@ [/home/user11226/vizitka1.tk/oc-includes/osclass/model/Item.php:990] / #1 deleteResourcesFromHD called@ [/home/user11226/vizitka1.tk/oc-includes/osclass/model/Item.php:961] / #2 deleteByPrimaryKey called@ [/home/user1122', '93.89.218.166', 'admin', 1),
('2017-11-23 09:10:19', 'item', 'delete resource', 3, '3', '93.89.218.166', 'admin', 1),
('2017-11-23 09:10:19', 'item', 'delete resource backtrace', 3, '#0 osc_deleteResource called@ [/home/user11226/vizitka1.tk/oc-includes/osclass/model/Item.php:990] / #1 deleteResourcesFromHD called@ [/home/user11226/vizitka1.tk/oc-includes/osclass/model/Item.php:961] / #2 deleteByPrimaryKey called@ [/home/user1122', '93.89.218.166', 'admin', 1),
('2017-11-23 09:10:19', 'Item', 'deleteResourcesFromHD', 5, '2,3,', '93.89.218.166', 'admin', 1),
('2017-11-23 09:10:19', 'Item', 'deleteResourcesFromHD', 6, '6', '93.89.218.166', 'admin', 1),
('2017-11-23 09:10:19', 'item', 'delete resource', 4, '4', '93.89.218.166', 'admin', 1),
('2017-11-23 09:10:19', 'item', 'delete resource backtrace', 4, '#0 osc_deleteResource called@ [/home/user11226/vizitka1.tk/oc-includes/osclass/model/Item.php:990] / #1 deleteResourcesFromHD called@ [/home/user11226/vizitka1.tk/oc-includes/osclass/model/Item.php:961] / #2 deleteByPrimaryKey called@ [/home/user1122', '93.89.218.166', 'admin', 1),
('2017-11-23 09:10:19', 'Item', 'deleteResourcesFromHD', 6, '4,', '93.89.218.166', 'admin', 1),
('2017-11-23 09:23:24', 'item', 'add', 7, 'Продам слона', '93.89.218.166', 'user', 0),
('2018-04-25 15:07:23', 'user', 'add', 1, 'mnogotovarov@gmail.com', '37.229.2.232', 'user', 1),
('2018-04-25 15:09:37', 'item', 'add', 8, 'bmw', '37.229.2.232', 'user', 1),
('2018-04-26 08:16:39', 'item', 'add', 9, 'Продам Мазду', '37.145.110.228', 'user', 0),
('2018-04-29 18:37:34', 'user', 'add', 2, 'zurbux@mail.ru', '94.51.71.8', 'user', 2),
('2018-04-29 18:40:44', 'item', 'add', 10, 'мотор', '94.51.71.8', 'user', 2),
('2018-05-09 19:05:12', 'user', 'add', 3, 'danik_kosta@mail.ru', '178.90.251.209', 'user', 3),
('2018-05-19 21:01:14', 'item', 'add', 11, 'ыфвыфвфыв', '37.57.68.206', 'user', 0),
('2018-05-21 21:32:32', 'item', 'delete', 11, 'ыфвыфвфыв', '146.185.134.129', 'admin', 1),
('2018-05-21 21:32:32', 'itemActions', 'deleteResourcesFromHD', 11, '11', '146.185.134.129', 'admin', 1),
('2018-05-21 21:32:32', 'item', 'delete resource', 12, '12', '146.185.134.129', 'admin', 1),
('2018-05-21 21:32:32', 'item', 'delete resource backtrace', 12, '#0 osc_deleteResource called@ [/home/host1642312/obyava.ga/htdocs/04/oc-includes/osclass/ItemActions.php:813] / #1 deleteResourcesFromHD called@ [/home/host1642312/obyava.ga/htdocs/04/oc-includes/osclass/model/Item.php:967] / #2 deleteByPrimaryKey ca', '146.185.134.129', 'admin', 1),
('2018-05-21 21:32:32', 'itemActions', 'deleteResourcesFromHD', 11, '12,', '146.185.134.129', 'admin', 1),
('2018-05-21 21:32:32', 'item', 'delete', 10, 'мотор', '146.185.134.129', 'admin', 1),
('2018-05-21 21:32:32', 'itemActions', 'deleteResourcesFromHD', 10, '10', '146.185.134.129', 'admin', 1),
('2018-05-21 21:32:32', 'item', 'delete resource', 11, '11', '146.185.134.129', 'admin', 1),
('2018-05-21 21:32:32', 'item', 'delete resource backtrace', 11, '#0 osc_deleteResource called@ [/home/host1642312/obyava.ga/htdocs/04/oc-includes/osclass/ItemActions.php:813] / #1 deleteResourcesFromHD called@ [/home/host1642312/obyava.ga/htdocs/04/oc-includes/osclass/model/Item.php:967] / #2 deleteByPrimaryKey ca', '146.185.134.129', 'admin', 1),
('2018-05-21 21:32:32', 'itemActions', 'deleteResourcesFromHD', 10, '11,', '146.185.134.129', 'admin', 1),
('2018-05-21 21:32:32', 'item', 'delete', 9, 'Продам Мазду', '146.185.134.129', 'admin', 1),
('2018-05-21 21:32:32', 'itemActions', 'deleteResourcesFromHD', 9, '9', '146.185.134.129', 'admin', 1),
('2018-05-21 21:32:32', 'item', 'delete resource', 8, '8', '146.185.134.129', 'admin', 1),
('2018-05-21 21:32:32', 'item', 'delete resource backtrace', 8, '#0 osc_deleteResource called@ [/home/host1642312/obyava.ga/htdocs/04/oc-includes/osclass/ItemActions.php:813] / #1 deleteResourcesFromHD called@ [/home/host1642312/obyava.ga/htdocs/04/oc-includes/osclass/model/Item.php:967] / #2 deleteByPrimaryKey ca', '146.185.134.129', 'admin', 1),
('2018-05-21 21:32:32', 'item', 'delete resource', 9, '9', '146.185.134.129', 'admin', 1),
('2018-05-21 21:32:32', 'item', 'delete resource backtrace', 9, '#0 osc_deleteResource called@ [/home/host1642312/obyava.ga/htdocs/04/oc-includes/osclass/ItemActions.php:813] / #1 deleteResourcesFromHD called@ [/home/host1642312/obyava.ga/htdocs/04/oc-includes/osclass/model/Item.php:967] / #2 deleteByPrimaryKey ca', '146.185.134.129', 'admin', 1),
('2018-05-21 21:32:32', 'item', 'delete resource', 10, '10', '146.185.134.129', 'admin', 1),
('2018-05-21 21:32:32', 'item', 'delete resource backtrace', 10, '#0 osc_deleteResource called@ [/home/host1642312/obyava.ga/htdocs/04/oc-includes/osclass/ItemActions.php:813] / #1 deleteResourcesFromHD called@ [/home/host1642312/obyava.ga/htdocs/04/oc-includes/osclass/model/Item.php:967] / #2 deleteByPrimaryKey ca', '146.185.134.129', 'admin', 1),
('2018-05-21 21:32:32', 'itemActions', 'deleteResourcesFromHD', 9, '8,9,10,', '146.185.134.129', 'admin', 1),
('2018-05-21 21:32:32', 'item', 'delete', 8, 'bmw', '146.185.134.129', 'admin', 1),
('2018-05-21 21:32:32', 'itemActions', 'deleteResourcesFromHD', 8, '8', '146.185.134.129', 'admin', 1),
('2018-05-21 21:32:32', 'item', 'delete resource', 7, '7', '146.185.134.129', 'admin', 1),
('2018-05-21 21:32:32', 'item', 'delete resource backtrace', 7, '#0 osc_deleteResource called@ [/home/host1642312/obyava.ga/htdocs/04/oc-includes/osclass/ItemActions.php:813] / #1 deleteResourcesFromHD called@ [/home/host1642312/obyava.ga/htdocs/04/oc-includes/osclass/model/Item.php:967] / #2 deleteByPrimaryKey ca', '146.185.134.129', 'admin', 1),
('2018-05-21 21:32:32', 'itemActions', 'deleteResourcesFromHD', 8, '7,', '146.185.134.129', 'admin', 1),
('2018-05-27 11:26:40', 'user', 'register', 4, 'Sibseno@mail.ru', '31.15.87.54', 'user', 4),
('2018-05-28 00:10:49', 'item', 'add', 8, 'Лл', '149.27.14.51', 'user', 0),
('2018-06-07 09:05:19', 'item', 'add', 9, 'нгнегн', '109.126.12.166', 'user', 0),
('2018-06-20 10:32:02', 'item', 'add', 10, 'Кентора', '188.162.72.76', 'user', 0),
('2018-06-21 01:06:02', 'user', 'register', 5, 'hits555@mail.ru', '91.78.207.21', 'user', 5),
('2018-06-25 11:03:44', 'user', 'register', 6, 'idven@BK.RU', '193.233.16.187', 'user', 6),
('2018-06-25 12:04:36', 'item', 'add', 11, 'робототехника', '95.85.90.184', 'user', 6),
('2018-06-25 19:43:35', 'item', 'add', 12, 'слон 2', '128.75.116.62', 'user', 0),
('2018-06-25 19:44:50', 'user', 'register', 7, 'umrilov.ev@gmail.com', '128.75.116.62', 'user', 7),
('2018-06-29 10:44:52', 'item', 'add', 13, 'Test', '37.25.126.114', 'user', 0),
('2018-06-29 10:49:05', 'item', 'edit', 13, 'Test345', '37.25.126.114', 'user', 0),
('2018-07-02 00:33:16', 'item', 'add', 14, 'ljhljlhlhg', '89.250.167.242', 'user', 0),
('2018-07-03 06:52:02', 'user', 'register', 8, 'miveres@mail.ru', '109.172.76.201', 'user', 8),
('2018-07-03 18:16:32', 'item', 'add', 15, 'Продам котика', '195.191.58.199', 'user', 0),
('2018-07-03 18:17:11', 'user', 'register', 9, 'mimistock10@gmail.com', '195.191.58.199', 'user', 9),
('2018-07-26 21:07:50', 'item', 'add', 16, 'https://novoflot.ru', '217.66.154.121', 'user', 0),
('2018-08-07 16:15:15', 'user', 'register', 10, 'mydragons@mail.ru', '212.96.79.128', 'user', 10),
('2018-08-07 16:29:44', 'item', 'add', 17, 'паджеро 1994', '212.96.79.128', 'user', 10),
('2018-08-12 12:12:29', 'item', 'add', 18, 'лада 14', '194.247.23.166', 'user', 0),
('2018-08-13 12:57:02', 'item', 'add', 19, 'Крот', '94.158.214.4', 'user', 0),
('2018-08-14 22:03:29', 'item', 'add', 20, 'рппо', '148.3.252.252', 'user', 0),
('2018-08-14 22:04:40', 'user', 'register', 11, 'kressoola@gmail.com', '148.3.252.252', 'user', 11),
('2018-08-23 22:35:30', 'user', 'register', 12, 'waefawfwafwafw@yandex.ru', '213.87.158.40', 'user', 12),
('2018-09-14 13:40:42', 'user', 'register', 13, 'qqw37572@nbzmr.com', '213.5.192.33', 'user', 13),
('2018-09-14 13:42:17', 'item', 'add', 21, 'ыфвыфв', '213.5.192.33', 'user', 13),
('2018-09-14 13:43:24', 'item', 'add', 22, 'qqw37572@nbzmr.com', '213.5.192.33', 'user', 13),
('2018-09-16 01:10:48', 'item', 'add', 23, 'трампампам', '5.248.83.100', 'user', 0),
('2018-09-17 16:24:02', 'item', 'add', 24, '123123123', '178.207.27.61', 'user', 0),
('2018-09-30 11:37:15', 'item', 'add', 25, 'Ероапбп', '94.79.96.41', 'user', 0),
('2018-10-02 16:52:17', 'item', 'add', 26, 'Andijon viloyati Andijon tumani Xartum QFY Zavroq MFY Shohizinda ko\'chasi 284-uy', '188.113.196.214', 'user', 0),
('2018-10-06 21:55:10', 'user', 'register', 14, 'kuba__95@inbox.ru', '192.162.242.132', 'user', 14),
('2018-10-11 21:51:42', 'user', 'register', 15, 'tzykin.alexandr@gmail.com', '109.254.254.150', 'user', 15),
('2018-10-11 21:52:59', 'item', 'add', 27, 'Тестовая услуга', '109.254.254.150', 'user', 15),
('2018-10-11 22:20:27', 'item', 'add', 28, '11111111', '109.254.254.150', 'user', 15),
('2018-10-25 11:41:02', 'user', 'register', 16, 'bgiant@yandex.ru', '89.151.186.177', 'user', 16),
('2018-10-25 11:50:44', 'item', 'add', 29, 'Пример', '89.151.186.177', 'user', 16),
('2018-10-27 12:35:08', 'user', 'register', 17, 'miro0@gmail.com', '85.143.228.93', 'user', 17),
('2018-11-03 00:45:56', 'user', 'register', 18, 'malukyan@yandex.kz', '77.222.124.34', 'user', 18),
('2018-11-03 00:47:38', 'item', 'add', 30, 'zzzzzzzzzzzzzz', '77.222.124.34', 'user', 18),
('2018-11-09 14:47:43', 'user', 'register', 19, 'victorchef@mail.ru', '109.251.81.52', 'user', 19),
('2018-11-16 19:39:11', 'item', 'add', 31, 'Мастер на 3 часа. Сборка новой мебели у Вас дома', '46.175.121.127', 'user', 0),
('2018-11-17 11:51:53', 'item', 'delete', 31, 'Мастер на 3 часа. Сборка новой мебели у Вас дома', '46.175.121.127', 'user', 0),
('2018-11-17 11:51:53', 'itemActions', 'deleteResourcesFromHD', 31, '31', '46.175.121.127', 'user', 0),
('2018-11-17 11:51:53', 'item', 'delete resource', 25, '25', '46.175.121.127', 'user', 0),
('2018-11-17 11:51:53', 'item', 'delete resource backtrace', 25, '#0 osc_deleteResource called@ [/home/host1642312/obyava.ga/htdocs/04/oc-includes/osclass/ItemActions.php:813] / #1 deleteResourcesFromHD called@ [/home/host1642312/obyava.ga/htdocs/04/oc-includes/osclass/model/Item.php:967] / #2 deleteByPrimaryKey ca', '46.175.121.127', 'user', 0),
('2018-11-17 11:51:53', 'item', 'delete resource', 26, '26', '46.175.121.127', 'user', 0),
('2018-11-17 11:51:54', 'item', 'delete resource backtrace', 26, '#0 osc_deleteResource called@ [/home/host1642312/obyava.ga/htdocs/04/oc-includes/osclass/ItemActions.php:813] / #1 deleteResourcesFromHD called@ [/home/host1642312/obyava.ga/htdocs/04/oc-includes/osclass/model/Item.php:967] / #2 deleteByPrimaryKey ca', '46.175.121.127', 'user', 0),
('2018-11-17 11:51:54', 'item', 'delete resource', 27, '27', '46.175.121.127', 'user', 0),
('2018-11-17 11:51:54', 'item', 'delete resource backtrace', 27, '#0 osc_deleteResource called@ [/home/host1642312/obyava.ga/htdocs/04/oc-includes/osclass/ItemActions.php:813] / #1 deleteResourcesFromHD called@ [/home/host1642312/obyava.ga/htdocs/04/oc-includes/osclass/model/Item.php:967] / #2 deleteByPrimaryKey ca', '46.175.121.127', 'user', 0),
('2018-11-17 11:51:54', 'item', 'delete resource', 28, '28', '46.175.121.127', 'user', 0),
('2018-11-17 11:51:54', 'item', 'delete resource backtrace', 28, '#0 osc_deleteResource called@ [/home/host1642312/obyava.ga/htdocs/04/oc-includes/osclass/ItemActions.php:813] / #1 deleteResourcesFromHD called@ [/home/host1642312/obyava.ga/htdocs/04/oc-includes/osclass/model/Item.php:967] / #2 deleteByPrimaryKey ca', '46.175.121.127', 'user', 0),
('2018-11-17 11:51:54', 'itemActions', 'deleteResourcesFromHD', 31, '25,26,27,28,', '46.175.121.127', 'user', 0),
('2018-11-23 13:20:59', 'user', 'register', 20, 'alex.crafty@icloud.com', '95.46.30.156', 'user', 20),
('2019-06-27 16:49:50', 'item', 'delete', 30, 'zzzzzzzzzzzzzz', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'itemActions', 'deleteResourcesFromHD', 30, '30', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'item', 'delete resource', 24, '24', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'item', 'delete resource backtrace', 24, '#0 osc_deleteResource called@ [/var/www/u0746345/data/www/aveld.ru/oc-includes/osclass/ItemActions.php:813] / #1 deleteResourcesFromHD called@ [/var/www/u0746345/data/www/aveld.ru/oc-includes/osclass/model/Item.php:967] / #2 deleteByPrimaryKey called', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'itemActions', 'deleteResourcesFromHD', 30, '24,', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'item', 'delete', 29, 'Пример', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'itemActions', 'deleteResourcesFromHD', 29, '29', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'itemActions', 'deleteResourcesFromHD', 29, '0', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'item', 'delete', 28, '11111111', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'itemActions', 'deleteResourcesFromHD', 28, '28', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'itemActions', 'deleteResourcesFromHD', 28, '0', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'item', 'delete', 27, 'Тестовая услуга', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'itemActions', 'deleteResourcesFromHD', 27, '27', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'itemActions', 'deleteResourcesFromHD', 27, '0', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'item', 'delete', 26, 'Andijon viloyati Andijon tumani Xartum QFY Zavroq MFY Shohizinda ko\'chasi 284-uy', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'itemActions', 'deleteResourcesFromHD', 26, '26', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'item', 'delete resource', 23, '23', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'item', 'delete resource backtrace', 23, '#0 osc_deleteResource called@ [/var/www/u0746345/data/www/aveld.ru/oc-includes/osclass/ItemActions.php:813] / #1 deleteResourcesFromHD called@ [/var/www/u0746345/data/www/aveld.ru/oc-includes/osclass/model/Item.php:967] / #2 deleteByPrimaryKey called', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'itemActions', 'deleteResourcesFromHD', 26, '23,', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'item', 'delete', 25, 'Ероапбп', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'itemActions', 'deleteResourcesFromHD', 25, '25', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'itemActions', 'deleteResourcesFromHD', 25, '0', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'item', 'delete', 24, '123123123', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'itemActions', 'deleteResourcesFromHD', 24, '24', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'item', 'delete resource', 22, '22', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'item', 'delete resource backtrace', 22, '#0 osc_deleteResource called@ [/var/www/u0746345/data/www/aveld.ru/oc-includes/osclass/ItemActions.php:813] / #1 deleteResourcesFromHD called@ [/var/www/u0746345/data/www/aveld.ru/oc-includes/osclass/model/Item.php:967] / #2 deleteByPrimaryKey called', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'itemActions', 'deleteResourcesFromHD', 24, '22,', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'item', 'delete', 23, 'трампампам', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'itemActions', 'deleteResourcesFromHD', 23, '23', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'item', 'delete resource', 21, '21', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'item', 'delete resource backtrace', 21, '#0 osc_deleteResource called@ [/var/www/u0746345/data/www/aveld.ru/oc-includes/osclass/ItemActions.php:813] / #1 deleteResourcesFromHD called@ [/var/www/u0746345/data/www/aveld.ru/oc-includes/osclass/model/Item.php:967] / #2 deleteByPrimaryKey called', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'itemActions', 'deleteResourcesFromHD', 23, '21,', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'item', 'delete', 22, 'qqw37572@nbzmr.com', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'itemActions', 'deleteResourcesFromHD', 22, '22', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'item', 'delete resource', 20, '20', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'item', 'delete resource backtrace', 20, '#0 osc_deleteResource called@ [/var/www/u0746345/data/www/aveld.ru/oc-includes/osclass/ItemActions.php:813] / #1 deleteResourcesFromHD called@ [/var/www/u0746345/data/www/aveld.ru/oc-includes/osclass/model/Item.php:967] / #2 deleteByPrimaryKey called', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'itemActions', 'deleteResourcesFromHD', 22, '20,', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'item', 'delete', 21, 'ыфвыфв', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'itemActions', 'deleteResourcesFromHD', 21, '21', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'item', 'delete resource', 19, '19', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'item', 'delete resource backtrace', 19, '#0 osc_deleteResource called@ [/var/www/u0746345/data/www/aveld.ru/oc-includes/osclass/ItemActions.php:813] / #1 deleteResourcesFromHD called@ [/var/www/u0746345/data/www/aveld.ru/oc-includes/osclass/model/Item.php:967] / #2 deleteByPrimaryKey called', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'itemActions', 'deleteResourcesFromHD', 21, '19,', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'item', 'delete', 20, 'рппо', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'itemActions', 'deleteResourcesFromHD', 20, '20', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'item', 'delete resource', 18, '18', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'item', 'delete resource backtrace', 18, '#0 osc_deleteResource called@ [/var/www/u0746345/data/www/aveld.ru/oc-includes/osclass/ItemActions.php:813] / #1 deleteResourcesFromHD called@ [/var/www/u0746345/data/www/aveld.ru/oc-includes/osclass/model/Item.php:967] / #2 deleteByPrimaryKey called', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'itemActions', 'deleteResourcesFromHD', 20, '18,', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'item', 'delete', 19, 'Крот', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'itemActions', 'deleteResourcesFromHD', 19, '19', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'item', 'delete resource', 17, '17', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'item', 'delete resource backtrace', 17, '#0 osc_deleteResource called@ [/var/www/u0746345/data/www/aveld.ru/oc-includes/osclass/ItemActions.php:813] / #1 deleteResourcesFromHD called@ [/var/www/u0746345/data/www/aveld.ru/oc-includes/osclass/model/Item.php:967] / #2 deleteByPrimaryKey called', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'itemActions', 'deleteResourcesFromHD', 19, '17,', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'item', 'delete', 18, 'лада 14', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'itemActions', 'deleteResourcesFromHD', 18, '18', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'itemActions', 'deleteResourcesFromHD', 18, '0', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'item', 'delete', 17, 'паджеро 1994', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'itemActions', 'deleteResourcesFromHD', 17, '17', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'item', 'delete resource', 16, '16', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'item', 'delete resource backtrace', 16, '#0 osc_deleteResource called@ [/var/www/u0746345/data/www/aveld.ru/oc-includes/osclass/ItemActions.php:813] / #1 deleteResourcesFromHD called@ [/var/www/u0746345/data/www/aveld.ru/oc-includes/osclass/model/Item.php:967] / #2 deleteByPrimaryKey called', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'itemActions', 'deleteResourcesFromHD', 17, '16,', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'item', 'delete', 16, 'https://novoflot.ru', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'itemActions', 'deleteResourcesFromHD', 16, '16', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'item', 'delete resource', 15, '15', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'item', 'delete resource backtrace', 15, '#0 osc_deleteResource called@ [/var/www/u0746345/data/www/aveld.ru/oc-includes/osclass/ItemActions.php:813] / #1 deleteResourcesFromHD called@ [/var/www/u0746345/data/www/aveld.ru/oc-includes/osclass/model/Item.php:967] / #2 deleteByPrimaryKey called', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'itemActions', 'deleteResourcesFromHD', 16, '15,', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'item', 'delete', 15, 'Продам котика', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'itemActions', 'deleteResourcesFromHD', 15, '15', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'itemActions', 'deleteResourcesFromHD', 15, '0', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'item', 'delete', 14, 'ljhljlhlhg', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'itemActions', 'deleteResourcesFromHD', 14, '14', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'item', 'delete resource', 13, '13', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'item', 'delete resource backtrace', 13, '#0 osc_deleteResource called@ [/var/www/u0746345/data/www/aveld.ru/oc-includes/osclass/ItemActions.php:813] / #1 deleteResourcesFromHD called@ [/var/www/u0746345/data/www/aveld.ru/oc-includes/osclass/model/Item.php:967] / #2 deleteByPrimaryKey called', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'item', 'delete resource', 14, '14', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'item', 'delete resource backtrace', 14, '#0 osc_deleteResource called@ [/var/www/u0746345/data/www/aveld.ru/oc-includes/osclass/ItemActions.php:813] / #1 deleteResourcesFromHD called@ [/var/www/u0746345/data/www/aveld.ru/oc-includes/osclass/model/Item.php:967] / #2 deleteByPrimaryKey called', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'itemActions', 'deleteResourcesFromHD', 14, '13,14,', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'item', 'delete', 13, 'Test345', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'itemActions', 'deleteResourcesFromHD', 13, '13', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'item', 'delete resource', 12, '12', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'item', 'delete resource backtrace', 12, '#0 osc_deleteResource called@ [/var/www/u0746345/data/www/aveld.ru/oc-includes/osclass/ItemActions.php:813] / #1 deleteResourcesFromHD called@ [/var/www/u0746345/data/www/aveld.ru/oc-includes/osclass/model/Item.php:967] / #2 deleteByPrimaryKey called', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'itemActions', 'deleteResourcesFromHD', 13, '12,', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'item', 'delete', 12, 'слон 2', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'itemActions', 'deleteResourcesFromHD', 12, '12', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'item', 'delete resource', 11, '11', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'item', 'delete resource backtrace', 11, '#0 osc_deleteResource called@ [/var/www/u0746345/data/www/aveld.ru/oc-includes/osclass/ItemActions.php:813] / #1 deleteResourcesFromHD called@ [/var/www/u0746345/data/www/aveld.ru/oc-includes/osclass/model/Item.php:967] / #2 deleteByPrimaryKey called', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'itemActions', 'deleteResourcesFromHD', 12, '11,', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'item', 'delete', 11, 'робототехника', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'itemActions', 'deleteResourcesFromHD', 11, '11', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'item', 'delete resource', 7, '7', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'item', 'delete resource backtrace', 7, '#0 osc_deleteResource called@ [/var/www/u0746345/data/www/aveld.ru/oc-includes/osclass/ItemActions.php:813] / #1 deleteResourcesFromHD called@ [/var/www/u0746345/data/www/aveld.ru/oc-includes/osclass/model/Item.php:967] / #2 deleteByPrimaryKey called', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'item', 'delete resource', 8, '8', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'item', 'delete resource backtrace', 8, '#0 osc_deleteResource called@ [/var/www/u0746345/data/www/aveld.ru/oc-includes/osclass/ItemActions.php:813] / #1 deleteResourcesFromHD called@ [/var/www/u0746345/data/www/aveld.ru/oc-includes/osclass/model/Item.php:967] / #2 deleteByPrimaryKey called', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'item', 'delete resource', 9, '9', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'item', 'delete resource backtrace', 9, '#0 osc_deleteResource called@ [/var/www/u0746345/data/www/aveld.ru/oc-includes/osclass/ItemActions.php:813] / #1 deleteResourcesFromHD called@ [/var/www/u0746345/data/www/aveld.ru/oc-includes/osclass/model/Item.php:967] / #2 deleteByPrimaryKey called', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'item', 'delete resource', 10, '10', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'item', 'delete resource backtrace', 10, '#0 osc_deleteResource called@ [/var/www/u0746345/data/www/aveld.ru/oc-includes/osclass/ItemActions.php:813] / #1 deleteResourcesFromHD called@ [/var/www/u0746345/data/www/aveld.ru/oc-includes/osclass/model/Item.php:967] / #2 deleteByPrimaryKey called', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'itemActions', 'deleteResourcesFromHD', 11, '7,8,9,10,', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'item', 'delete', 10, 'Кентора', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'itemActions', 'deleteResourcesFromHD', 10, '10', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'itemActions', 'deleteResourcesFromHD', 10, '0', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'item', 'delete', 9, 'нгнегн', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'itemActions', 'deleteResourcesFromHD', 9, '9', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'itemActions', 'deleteResourcesFromHD', 9, '0', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'item', 'delete', 8, 'Лл', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'itemActions', 'deleteResourcesFromHD', 8, '8', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:50', 'itemActions', 'deleteResourcesFromHD', 8, '0', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:57', 'item', 'delete', 7, 'Продам слона', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:57', 'itemActions', 'deleteResourcesFromHD', 7, '7', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:57', 'item', 'delete resource', 5, '5', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:57', 'item', 'delete resource backtrace', 5, '#0 osc_deleteResource called@ [/var/www/u0746345/data/www/aveld.ru/oc-includes/osclass/ItemActions.php:813] / #1 deleteResourcesFromHD called@ [/var/www/u0746345/data/www/aveld.ru/oc-includes/osclass/model/Item.php:967] / #2 deleteByPrimaryKey called', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:57', 'item', 'delete resource', 6, '6', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:57', 'item', 'delete resource backtrace', 6, '#0 osc_deleteResource called@ [/var/www/u0746345/data/www/aveld.ru/oc-includes/osclass/ItemActions.php:813] / #1 deleteResourcesFromHD called@ [/var/www/u0746345/data/www/aveld.ru/oc-includes/osclass/model/Item.php:967] / #2 deleteByPrimaryKey called', '141.105.141.3', 'admin', 1),
('2019-06-27 16:49:57', 'itemActions', 'deleteResourcesFromHD', 7, '5,6,', '141.105.141.3', 'admin', 1),
('2019-06-27 16:51:01', 'user', 'delete', 20, 'alex.crafty@icloud.com', '141.105.141.3', 'admin', 1),
('2019-06-27 16:51:01', 'user', 'delete', 19, 'victorchef@mail.ru', '141.105.141.3', 'admin', 1),
('2019-06-27 16:51:01', 'user', 'delete', 18, 'malukyan@yandex.kz', '141.105.141.3', 'admin', 1),
('2019-06-27 16:51:01', 'user', 'delete', 17, 'miro0@gmail.com', '141.105.141.3', 'admin', 1),
('2019-06-27 16:51:01', 'user', 'delete', 16, 'bgiant@yandex.ru', '141.105.141.3', 'admin', 1),
('2019-06-27 16:51:01', 'user', 'delete', 15, 'tzykin.alexandr@gmail.com', '141.105.141.3', 'admin', 1),
('2019-06-27 16:51:01', 'user', 'delete', 14, 'kuba__95@inbox.ru', '141.105.141.3', 'admin', 1),
('2019-06-27 16:51:01', 'user', 'delete', 13, 'qqw37572@nbzmr.com', '141.105.141.3', 'admin', 1),
('2019-06-27 16:51:01', 'user', 'delete', 12, 'waefawfwafwafw@yandex.ru', '141.105.141.3', 'admin', 1),
('2019-06-27 16:51:01', 'user', 'delete', 11, 'kressoola@gmail.com', '141.105.141.3', 'admin', 1),
('2019-06-27 16:51:01', 'user', 'delete', 10, 'mydragons@mail.ru', '141.105.141.3', 'admin', 1),
('2019-06-27 16:51:01', 'user', 'delete', 9, 'mimistock10@gmail.com', '141.105.141.3', 'admin', 1),
('2019-06-27 16:51:01', 'user', 'delete', 8, 'miveres@mail.ru', '141.105.141.3', 'admin', 1),
('2019-06-27 16:51:01', 'user', 'delete', 7, 'umrilov.ev@gmail.com', '141.105.141.3', 'admin', 1),
('2019-06-27 16:51:01', 'user', 'delete', 6, 'idven@BK.RU', '141.105.141.3', 'admin', 1),
('2019-06-27 16:51:01', 'user', 'delete', 5, 'hits555@mail.ru', '141.105.141.3', 'admin', 1),
('2019-06-27 16:51:01', 'user', 'delete', 4, 'Sibseno@mail.ru', '141.105.141.3', 'admin', 1),
('2019-06-27 16:51:01', 'user', 'delete', 3, 'danik_kosta@mail.ru', '141.105.141.3', 'admin', 1),
('2019-06-27 16:51:01', 'user', 'delete', 2, 'zurbux@mail.ru', '141.105.141.3', 'admin', 1),
('2019-06-27 16:51:01', 'user', 'delete', 1, 'mnogotovarov@gmail.com', '141.105.141.3', 'admin', 1),
('2019-06-27 16:59:30', 'item', 'add', 31, 'Продам авто', '141.105.141.3', 'user', 0),
('2019-06-27 17:00:25', 'item', 'delete', 31, 'Продам авто', '141.105.141.3', 'admin', 1),
('2019-06-27 17:00:25', 'itemActions', 'deleteResourcesFromHD', 31, '31', '141.105.141.3', 'admin', 1),
('2019-06-27 17:00:25', 'item', 'delete resource', 25, '25', '141.105.141.3', 'admin', 1),
('2019-06-27 17:00:25', 'item', 'delete resource backtrace', 25, '#0 osc_deleteResource called@ [/var/www/u0746345/data/www/aveld.ru/oc-includes/osclass/ItemActions.php:813] / #1 deleteResourcesFromHD called@ [/var/www/u0746345/data/www/aveld.ru/oc-includes/osclass/model/Item.php:967] / #2 deleteByPrimaryKey called', '141.105.141.3', 'admin', 1),
('2019-06-27 17:00:25', 'itemActions', 'deleteResourcesFromHD', 31, '25,', '141.105.141.3', 'admin', 1),
('2019-06-27 17:06:07', 'item', 'add', 32, 'Пробное обїявление', '141.105.141.3', 'user', 0),
('2019-06-27 17:06:23', 'item', 'delete', 32, 'Пробное обїявление', '141.105.141.3', 'admin', 1),
('2019-06-27 17:06:23', 'itemActions', 'deleteResourcesFromHD', 32, '32', '141.105.141.3', 'admin', 1),
('2019-06-27 17:06:23', 'item', 'delete resource', 26, '26', '141.105.141.3', 'admin', 1),
('2019-06-27 17:06:23', 'item', 'delete resource backtrace', 26, '#0 osc_deleteResource called@ [/var/www/u0746345/data/www/aveld.ru/oc-includes/osclass/ItemActions.php:813] / #1 deleteResourcesFromHD called@ [/var/www/u0746345/data/www/aveld.ru/oc-includes/osclass/model/Item.php:967] / #2 deleteByPrimaryKey called', '141.105.141.3', 'admin', 1),
('2019-06-27 17:06:23', 'itemActions', 'deleteResourcesFromHD', 32, '26,', '141.105.141.3', 'admin', 1),
('2019-06-27 17:24:41', 'item', 'add', 33, 'Продам квартиру', '141.105.141.3', 'user', 0),
('2019-06-27 17:25:00', 'item', 'delete', 33, 'Продам квартиру', '141.105.141.3', 'admin', 1),
('2019-06-27 17:25:00', 'itemActions', 'deleteResourcesFromHD', 33, '33', '141.105.141.3', 'admin', 1),
('2019-06-27 17:25:00', 'itemActions', 'deleteResourcesFromHD', 33, '0', '141.105.141.3', 'admin', 1),
('2019-06-29 12:38:22', 'item', 'add', 34, 'Продам авто', '109.254.130.36', 'user', 0),
('2019-06-29 12:55:28', 'item', 'add', 35, 'Продам авто, пробное объявление', '109.254.130.36', 'user', 0),
('2019-06-29 12:57:09', 'item', 'add', 36, 'Продам слона в квартиру', '109.254.130.36', 'user', 0),
('2019-06-29 16:23:55', 'item', 'add', 37, 'dwwdwad', '109.254.130.36', 'user', 0),
('2019-06-29 16:25:14', 'item', 'add', 38, 'dwwdwad', '109.254.130.36', 'user', 0),
('2019-06-29 16:27:28', 'item', 'add', 39, 'dawdw', '109.254.130.36', 'user', 0),
('2019-06-29 16:30:06', 'item', 'add', 40, 'dwwdwad', '109.254.130.36', 'user', 0),
('2019-06-30 08:56:13', 'item', 'delete', 40, 'dwwdwad', '92.42.41.242', 'admin', 1),
('2019-06-30 08:56:13', 'itemActions', 'deleteResourcesFromHD', 40, '40', '92.42.41.242', 'admin', 1),
('2019-06-30 08:56:13', 'item', 'delete resource', 31, '31', '92.42.41.242', 'admin', 1),
('2019-06-30 08:56:13', 'item', 'delete resource backtrace', 31, '#0 osc_deleteResource called@ [/home2/host1642312/web-dn.ru/htdocs/test1/oc-includes/osclass/ItemActions.php:813] / #1 deleteResourcesFromHD called@ [/home2/host1642312/web-dn.ru/htdocs/test1/oc-includes/osclass/model/Item.php:967] / #2 deleteByPrima', '92.42.41.242', 'admin', 1),
('2019-06-30 08:56:13', 'itemActions', 'deleteResourcesFromHD', 40, '31,', '92.42.41.242', 'admin', 1),
('2019-06-30 08:56:13', 'item', 'delete', 39, 'dawdw', '92.42.41.242', 'admin', 1),
('2019-06-30 08:56:13', 'itemActions', 'deleteResourcesFromHD', 39, '39', '92.42.41.242', 'admin', 1),
('2019-06-30 08:56:13', 'itemActions', 'deleteResourcesFromHD', 39, '0', '92.42.41.242', 'admin', 1),
('2019-06-30 08:56:13', 'item', 'delete', 38, 'dwwdwad', '92.42.41.242', 'admin', 1),
('2019-06-30 08:56:13', 'itemActions', 'deleteResourcesFromHD', 38, '38', '92.42.41.242', 'admin', 1),
('2019-06-30 08:56:13', 'itemActions', 'deleteResourcesFromHD', 38, '0', '92.42.41.242', 'admin', 1),
('2019-06-30 08:56:13', 'item', 'delete', 37, 'dwwdwad', '92.42.41.242', 'admin', 1),
('2019-06-30 08:56:13', 'itemActions', 'deleteResourcesFromHD', 37, '37', '92.42.41.242', 'admin', 1),
('2019-06-30 08:56:13', 'itemActions', 'deleteResourcesFromHD', 37, '0', '92.42.41.242', 'admin', 1),
('2019-06-30 08:56:13', 'item', 'delete', 36, 'Продам слона в квартиру', '92.42.41.242', 'admin', 1),
('2019-06-30 08:56:13', 'itemActions', 'deleteResourcesFromHD', 36, '36', '92.42.41.242', 'admin', 1),
('2019-06-30 08:56:13', 'item', 'delete resource', 29, '29', '92.42.41.242', 'admin', 1),
('2019-06-30 08:56:13', 'item', 'delete resource backtrace', 29, '#0 osc_deleteResource called@ [/home2/host1642312/web-dn.ru/htdocs/test1/oc-includes/osclass/ItemActions.php:813] / #1 deleteResourcesFromHD called@ [/home2/host1642312/web-dn.ru/htdocs/test1/oc-includes/osclass/model/Item.php:967] / #2 deleteByPrima', '92.42.41.242', 'admin', 1),
('2019-06-30 08:56:13', 'item', 'delete resource', 30, '30', '92.42.41.242', 'admin', 1),
('2019-06-30 08:56:13', 'item', 'delete resource backtrace', 30, '#0 osc_deleteResource called@ [/home2/host1642312/web-dn.ru/htdocs/test1/oc-includes/osclass/ItemActions.php:813] / #1 deleteResourcesFromHD called@ [/home2/host1642312/web-dn.ru/htdocs/test1/oc-includes/osclass/model/Item.php:967] / #2 deleteByPrima', '92.42.41.242', 'admin', 1),
('2019-06-30 08:56:13', 'itemActions', 'deleteResourcesFromHD', 36, '29,30,', '92.42.41.242', 'admin', 1),
('2019-06-30 08:56:13', 'item', 'delete', 35, 'Продам авто, пробное объявление', '92.42.41.242', 'admin', 1),
('2019-06-30 08:56:13', 'itemActions', 'deleteResourcesFromHD', 35, '35', '92.42.41.242', 'admin', 1),
('2019-06-30 08:56:13', 'item', 'delete resource', 28, '28', '92.42.41.242', 'admin', 1),
('2019-06-30 08:56:13', 'item', 'delete resource backtrace', 28, '#0 osc_deleteResource called@ [/home2/host1642312/web-dn.ru/htdocs/test1/oc-includes/osclass/ItemActions.php:813] / #1 deleteResourcesFromHD called@ [/home2/host1642312/web-dn.ru/htdocs/test1/oc-includes/osclass/model/Item.php:967] / #2 deleteByPrima', '92.42.41.242', 'admin', 1),
('2019-06-30 08:56:13', 'itemActions', 'deleteResourcesFromHD', 35, '28,', '92.42.41.242', 'admin', 1),
('2019-06-30 09:03:40', 'item', 'edit', 34, 'Продам авто', '92.42.41.242', 'admin', 1),
('2019-06-30 09:16:54', 'item', 'add', 41, 'ff fdf', '92.42.41.242', 'user', 0),
('2019-06-30 09:20:41', 'item', 'edit', 34, 'Продам авто', '92.42.41.242', 'admin', 1),
('2019-06-30 09:21:08', 'item', 'edit', 41, 'ff fdf', '92.42.41.242', 'admin', 1),
('2019-06-30 09:21:18', 'item', 'edit', 41, 'ff fdf', '92.42.41.242', 'admin', 1),
('2019-06-30 09:21:31', 'item', 'edit', 41, 'ff fdf', '92.42.41.242', 'admin', 1),
('2019-06-30 09:21:45', 'item', 'edit', 34, 'Продам авто', '92.42.41.242', 'admin', 1),
('2019-06-30 09:29:31', 'item', 'edit', 41, 'ff fdf', '92.42.41.242', 'admin', 1),
('2019-06-30 09:29:42', 'item', 'edit', 41, 'ff fdf', '92.42.41.242', 'admin', 1),
('2019-06-30 09:29:59', 'item', 'edit', 41, 'ff fdf', '92.42.41.242', 'admin', 1),
('2019-06-30 09:30:43', 'item', 'add', 42, 'dfdfd', '92.42.41.242', 'user', 0),
('2019-07-04 13:21:30', 'item', 'delete', 42, 'dfdfd', '109.254.130.36', 'admin', 1),
('2019-07-04 13:21:30', 'itemActions', 'deleteResourcesFromHD', 42, '42', '109.254.130.36', 'admin', 1),
('2019-07-04 13:21:30', 'itemActions', 'deleteResourcesFromHD', 42, '0', '109.254.130.36', 'admin', 1),
('2019-07-04 13:21:30', 'item', 'delete', 41, 'ff fdf', '109.254.130.36', 'admin', 1),
('2019-07-04 13:21:30', 'itemActions', 'deleteResourcesFromHD', 41, '41', '109.254.130.36', 'admin', 1),
('2019-07-04 13:21:30', 'item', 'delete resource', 32, '32', '109.254.130.36', 'admin', 1),
('2019-07-04 13:21:30', 'item', 'delete resource backtrace', 32, '#0 osc_deleteResource called@ [/home2/host1642312/web-dn.ru/htdocs/test1/oc-includes/osclass/ItemActions.php:813] / #1 deleteResourcesFromHD called@ [/home2/host1642312/web-dn.ru/htdocs/test1/oc-includes/osclass/model/Item.php:967] / #2 deleteByPrima', '109.254.130.36', 'admin', 1),
('2019-07-04 13:21:30', 'itemActions', 'deleteResourcesFromHD', 41, '32,', '109.254.130.36', 'admin', 1),
('2019-07-04 13:36:11', 'item', 'add', 0, 'Продам кота', '109.254.130.36', 'admin', 1),
('2019-07-04 13:38:09', 'item', 'add', 0, 'Продам кота', '109.254.130.36', 'admin', 1),
('2019-07-04 13:38:10', 'item', 'add', 0, '3-к квартира, 60 м, 2/9 эт.', '109.254.130.36', 'admin', 1),
('2019-07-04 13:38:11', 'item', 'add', 0, '2-к квартира, 43 м, 5/5 эт.', '109.254.130.36', 'admin', 1),
('2019-07-04 13:39:30', 'item', 'add', 0, '3-к квартира, 60 м, 2/9 эт.', '109.254.130.36', 'admin', 1),
('2019-07-04 13:39:31', 'item', 'add', 0, '2-к квартира, 43 м, 5/5 эт.', '109.254.130.36', 'admin', 1),
('2019-07-04 13:42:53', 'item', 'edit', 34, 'Продам авто', '109.254.130.36', 'admin', 1),
('2019-09-01 09:30:42', 'itemActions', 'deleteResourcesFromHD', 34, '34', '109.254.130.36', 'admin', 1),
('2019-09-01 09:30:42', 'item', 'delete resource', 27, '27', '109.254.130.36', 'admin', 1),
('2019-09-01 09:30:42', 'item', 'delete resource backtrace', 27, '#0 osc_deleteResource called@ [/home2/host1642312/adgba.ru/htdocs/test14/oc-includes/osclass/ItemActions.php:813] / #1 deleteResourcesFromHD called@ [/home2/host1642312/adgba.ru/htdocs/test14/oc-includes/osclass/model/Item.php:967] / #2 deleteByPrima', '109.254.130.36', 'admin', 1),
('2019-09-01 09:30:42', 'itemActions', 'deleteResourcesFromHD', 34, '27,', '109.254.130.36', 'admin', 1),
('2019-09-01 09:47:08', 'item', 'edit', 34, 'Продам авто', '109.254.130.36', 'admin', 1),
('2019-09-01 10:02:25', 'item', 'delete', 34, 'Продам авто', '109.254.130.36', 'admin', 1),
('2019-09-01 10:02:25', 'itemActions', 'deleteResourcesFromHD', 34, '34', '109.254.130.36', 'admin', 1),
('2019-09-01 10:02:25', 'item', 'delete resource', 51, '51', '109.254.130.36', 'admin', 1),
('2019-09-01 10:02:25', 'item', 'delete resource backtrace', 51, '#0 osc_deleteResource called@ [/home2/host1642312/adgba.ru/htdocs/test14/oc-includes/osclass/ItemActions.php:813] / #1 deleteResourcesFromHD called@ [/home2/host1642312/adgba.ru/htdocs/test14/oc-includes/osclass/model/Item.php:967] / #2 deleteByPrima', '109.254.130.36', 'admin', 1),
('2019-09-01 10:02:25', 'item', 'delete resource', 52, '52', '109.254.130.36', 'admin', 1),
('2019-09-01 10:02:25', 'item', 'delete resource backtrace', 52, '#0 osc_deleteResource called@ [/home2/host1642312/adgba.ru/htdocs/test14/oc-includes/osclass/ItemActions.php:813] / #1 deleteResourcesFromHD called@ [/home2/host1642312/adgba.ru/htdocs/test14/oc-includes/osclass/model/Item.php:967] / #2 deleteByPrima', '109.254.130.36', 'admin', 1),
('2019-09-01 10:02:25', 'itemActions', 'deleteResourcesFromHD', 34, '51,52,', '109.254.130.36', 'admin', 1),
('2019-09-01 10:05:10', 'item', 'add', 49, 'Пробное объявление', '109.254.130.36', 'user', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_meta_categories`
--

CREATE TABLE `oc_t_meta_categories` (
  `fk_i_category_id` int(10) UNSIGNED NOT NULL,
  `fk_i_field_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_meta_fields`
--

CREATE TABLE `oc_t_meta_fields` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `s_name` varchar(255) NOT NULL,
  `s_slug` varchar(255) NOT NULL,
  `e_type` enum('TEXT','TEXTAREA','DROPDOWN','RADIO','CHECKBOX','URL','DATE','DATEINTERVAL') NOT NULL DEFAULT 'TEXT',
  `s_options` varchar(2048) DEFAULT NULL,
  `b_required` tinyint(1) NOT NULL DEFAULT '0',
  `b_searchable` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_pages`
--

CREATE TABLE `oc_t_pages` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `s_internal_name` varchar(50) DEFAULT NULL,
  `b_indelible` tinyint(1) NOT NULL DEFAULT '0',
  `b_link` tinyint(1) NOT NULL DEFAULT '1',
  `dt_pub_date` datetime NOT NULL,
  `dt_mod_date` datetime DEFAULT NULL,
  `i_order` int(3) NOT NULL DEFAULT '0',
  `s_meta` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_t_pages`
--

INSERT INTO `oc_t_pages` (`pk_i_id`, `s_internal_name`, `b_indelible`, `b_link`, `dt_pub_date`, `dt_mod_date`, `i_order`, `s_meta`) VALUES
(1, 'email_item_inquiry', 1, 1, '2017-11-22 22:40:32', NULL, 0, NULL),
(2, 'email_user_validation', 1, 1, '2017-11-22 22:40:32', NULL, 0, NULL),
(3, 'email_user_registration', 1, 1, '2017-11-22 22:40:32', NULL, 0, NULL),
(4, 'email_send_friend', 1, 1, '2017-11-22 22:40:32', NULL, 0, NULL),
(5, 'alert_email_hourly', 1, 1, '2017-11-22 22:40:32', NULL, 0, NULL),
(6, 'alert_email_daily', 1, 1, '2017-11-22 22:40:32', NULL, 0, NULL),
(7, 'alert_email_weekly', 1, 1, '2017-11-22 22:40:32', NULL, 0, NULL),
(8, 'alert_email_instant', 1, 1, '2017-11-22 22:40:32', NULL, 0, NULL),
(9, 'email_new_comment_admin', 1, 1, '2017-11-22 22:40:32', NULL, 0, NULL),
(10, 'email_new_item_non_register_user', 1, 1, '2017-11-22 22:40:32', NULL, 0, NULL),
(11, 'email_item_validation', 1, 1, '2017-11-22 22:40:32', NULL, 0, NULL),
(12, 'email_admin_new_item', 1, 1, '2017-11-22 22:40:32', NULL, 0, NULL),
(13, 'email_user_forgot_password', 1, 1, '2017-11-22 22:40:32', NULL, 0, NULL),
(14, 'email_new_email', 1, 1, '2017-11-22 22:40:32', NULL, 0, NULL),
(15, 'email_alert_validation', 1, 1, '2017-11-22 22:40:32', NULL, 0, NULL),
(16, 'email_comment_validated', 1, 1, '2017-11-22 22:40:32', NULL, 0, NULL),
(17, 'email_item_validation_non_register_user', 1, 1, '2017-11-22 22:40:32', NULL, 0, NULL),
(18, 'email_admin_new_user', 1, 1, '2017-11-22 22:40:32', NULL, 0, NULL),
(19, 'email_contact_user', 1, 1, '2017-11-22 22:40:32', NULL, 0, NULL),
(20, 'email_new_comment_user', 1, 1, '2017-11-22 22:40:32', NULL, 0, NULL),
(21, 'email_new_admin', 1, 1, '2017-11-22 22:40:32', NULL, 0, NULL),
(22, 'email_warn_expiration', 1, 1, '2017-11-22 22:40:32', NULL, 0, NULL),
(23, 'example_page', 0, 0, '2017-11-22 22:40:32', '2017-11-22 22:40:32', 1, '\"\"'),
(40, 'email_admin_renew_item', 1, 0, '2017-11-23 05:59:11', '2017-11-23 05:59:11', 18, NULL),
(41, 'email_moreedit_notify_edit', 1, 1, '2017-11-23 09:31:22', NULL, 0, NULL),
(42, 'im_email_message_notify', 1, 0, '2019-07-05 07:52:10', '2019-07-05 07:52:10', 19, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_pages_description`
--

CREATE TABLE `oc_t_pages_description` (
  `fk_i_pages_id` int(10) UNSIGNED NOT NULL,
  `fk_c_locale_code` char(5) NOT NULL,
  `s_title` varchar(255) NOT NULL,
  `s_text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_t_pages_description`
--

INSERT INTO `oc_t_pages_description` (`fk_i_pages_id`, `fk_c_locale_code`, `s_title`, `s_text`) VALUES
(1, 'en_US', '{WEB_TITLE} - Someone has a question about your listing', '<p>Hi {CONTACT_NAME}!</p><p>{USER_NAME} ({USER_EMAIL}, {USER_PHONE}) left you a message about your listing <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a>:</p><p>{COMMENT}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(1, 'ru_RU', '{WEB_TITLE} - У кого-то есть вопрос о вашем объявлении', '<p>Привет {CONTACT_NAME}!</p>\r\n<p>{USER_NAME} ({USER_EMAIL}, {USER_PHONE}) написал сообщение по поводу Вашего объявления <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a>:</p>\r\n<p>{COMMENT}</p>\r\n<p>С уважением,</p>\r\n<p>{WEB_LINK}</p>'),
(2, 'en_US', 'Please validate your {WEB_TITLE} account', '<p>Hi {USER_NAME},</p><p>Please validate your registration by clicking on the following link: {VALIDATION_LINK}</p><p>Thank you!</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(2, 'ru_RU', 'Подтверждение регистрации на сайте {WEB_TITLE}', '<p>Привет {USER_NAME},</p>\r\n<p>Просьба подтвердить Вашу регистрацию, нажав на следующую ссылку: {VALIDATION_LINK}</p>\r\n<p>Спасибо!</p>\r\n<p>С уважением,</p>\r\n<p>{WEB_LINK}</p>'),
(3, 'en_US', '{WEB_TITLE} - Registration successful!', '<p>Hi {USER_NAME},</p><p>You\'ve successfully registered for {WEB_LINK}.</p><p>Thank you!</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(3, 'ru_RU', '{WEB_TITLE} - Успешная регистрация!', '<p>Привет {USER_NAME},</p>\r\n<p>Вы успешно зарегистрированы на {WEB_LINK}.</p>\r\n<p>Спасибо!</p>\r\n<p>С уважением,</p>\r\n<p>{WEB_LINK}</p>'),
(4, 'en_US', 'Look at what I discovered on {WEB_TITLE}', '<p>Hi {FRIEND_NAME},</p><p>Your friend {USER_NAME} wants to share this listing with you <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a>.</p><p>Message:</p><p>{COMMENT}</p><p>Regards,</p><p>{WEB_TITLE}</p>'),
(4, 'ru_RU', 'Посмотри, что я обнаружил на {WEB_TITLE}', '<p>Привет {FRIEND_NAME},</p>\r\n<p>Ваш друг {USER_NAME} хочет поделиться с Вами информацией <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a>.</p>\r\n<p>Сообщение:</p>\r\n<p>{COMMENT}</p>\r\n<p>С уважением,</p>\r\n<p>{WEB_TITLE}</p>'),
(5, 'en_US', '{WEB_TITLE} - New listings in the last hour', '<p>Hi {USER_NAME},</p><p>New listings have been published in the last hour. Take a look at them:</p><p>{ADS}</p><p>-------------</p><p>To unsubscribe from this alert, click on: {UNSUB_LINK}</p><p>{WEB_LINK}</p>'),
(5, 'ru_RU', '{WEB_TITLE} - Новое объявление in the last hour', '<p>Привет {USER_NAME},</p>\r\n<p>Новые объявления опубликованные за последний час. Взгляните на них:</p>\r\n<p>{ADS}</p>\r\n<p>-------------</p>\r\n<p>Чтобы отписаться от этой рассылки , перейдите по ссылке: {UNSUB_LINK}</p>\r\n<p>{WEB_LINK}</p>'),
(6, 'en_US', '{WEB_TITLE} - New listings in the last day', '<p>Hi {USER_NAME},</p><p>New listings have been published in the last day. Take a look at them:</p><p>{ADS}</p><p>-------------</p><p>To unsubscribe from this alert, click on: {UNSUB_LINK}</p><p>{WEB_LINK}</p>'),
(6, 'ru_RU', '{WEB_TITLE} - Новое объявление in the last day', '<p>Привет {USER_NAME},</p>\r\n<p>Новые объявления за прошедший день. Взгляните на них:</p>\r\n<p>{ADS}</p>\r\n<p>-------------</p>\r\n<p>Чтобы отписаться от этой рассылки, перейдите по ссылке: {UNSUB_LINK}</p>\r\n<p>{WEB_LINK}</p>'),
(7, 'en_US', '{WEB_TITLE} - New listings in the last week', '<p>Hi {USER_NAME},</p><p>New listings have been published in the last week. Take a look at them:</p><p>{ADS}</p><p>-------------</p><p>To unsubscribe from this alert, click on: {UNSUB_LINK}</p><p>{WEB_LINK}</p>'),
(7, 'ru_RU', '{WEB_TITLE} - Новое объявление in the last week', '<p>Привет {USER_NAME},</p>\r\n<p>Новые объявления опубликованные на прошлой неделе. Взгляните на них:</p>\r\n<p>{ADS}</p>\r\n<p>-------------</p>\r\n<p>Чтобы отписаться от этой рассылки, перейдите по ссылке: {UNSUB_LINK}</p>\r\n<p>{WEB_LINK}</p>'),
(8, 'en_US', '{WEB_TITLE} - New listings', '<p>Hi {USER_NAME},</p><p>A new listing has been published, check it out!</p><p>{ADS}</p><p>-------------</p><p>To unsubscribe from this alert, click on: {UNSUB_LINK}</p><p>{WEB_LINK}</p>'),
(8, 'ru_RU', '{WEB_TITLE} - Новое объявление', '<p>Привет {USER_NAME},</p>\r\n<p>Опубликовано новое объявление!</p>\r\n<p>{ADS}</p>\r\n<p>-------------</p>\r\n<p>Для того чтобы отписаться от этой рассылки, перейдите по ссылке: {UNSUB_LINK}</p>\r\n<p>{WEB_LINK}</p>'),
(9, 'en_US', '{WEB_TITLE} - New comment', '<p>Someone commented on the listing <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a>.</p><p>Commenter: {COMMENT_AUTHOR}<br />Commenter\'s email: {COMMENT_EMAIL}<br />Title: {COMMENT_TITLE}<br />Comment: {COMMENT_TEXT}</p>'),
(9, 'ru_RU', '{WEB_TITLE} - Новый комментарий', '<p>Кто-то оставил новый комментарий в <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a>.</p>\r\n<p>Комментатор: {COMMENT_AUTHOR}<br />Email комментатора: {COMMENT_EMAIL}<br />Заголдовок: {COMMENT_TITLE}<br />Комментарий: {COMMENT_TEXT}</p>'),
(10, 'en_US', '{WEB_TITLE} - Edit options for the listing {ITEM_TITLE}', '<p>Hi {USER_NAME},</p><p>You\'re not registered at {WEB_LINK}, but you can still edit or delete the listing <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a> for a short period of time.</p><p>You can edit your listing by following this link: {EDIT_LINK}</p><p>You can delete your listing by following this link: {DELETE_LINK}</p><p>If you register as a user, you will have full access to editing options.</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(10, 'ru_RU', '{WEB_TITLE} - Возможности редактирования для объявления {ITEM_TITLE}', '<p>Привет {USER_NAME},</p>\r\n<p><span id=\"result_box\" class=\"short_text\" lang=\"ru\"><span class=\"hps\">Вы</span> <span class=\"hps\">не зарегистрированы на</span></span> {WEB_LINK}, <span id=\"result_box\" class=\"short_text\" lang=\"ru\"><span class=\"hps\">но</span> <span class=\"hps alt-edited\">вы все равно можете</span> <span class=\"hps\">изменить или удалить</span> <span class=\"hps alt-edited\">объявление </span></span><a href=\"{ITEM_URL}\">{ITEM_TITLE}</a> <span id=\"result_box\" class=\"short_text\" lang=\"ru\"><span class=\"hps\">в течение короткого</span> <span class=\"hps\">периода времени</span></span>.</p>\r\n<p><span id=\"result_box\" lang=\"ru\"><span class=\"hps\">Вы</span> <span class=\"hps alt-edited\">можете изменить</span> <span class=\"hps alt-edited\">объявление</span><span class=\"alt-edited\"> перейдя по этой</span> <span class=\"hps\">ссылке</span></span>: {EDIT_LINK}</p>\r\n<p><span id=\"result_box\" lang=\"ru\"><span class=\"hps alt-edited\">Вы можете удалить </span> <span class=\"hps alt-edited\">объявление</span> <span class=\"hps\">перейдя по этой ссылке</span></span>: {DELETE_LINK}</p>\r\n<p><span id=\"result_box\" lang=\"ru\"><span class=\"hps\">Если</span> <span class=\"hps alt-edited\">вы зарегистрируетесь в качестве</span> <span class=\"hps alt-edited\">пользователя, </span> <span class=\"hps alt-edited\">получите полный доступ</span> <span class=\"hps\">к опциям</span> <span class=\"hps\">редактирования.</span></span></p>\r\n<p>С уважением,</p>\r\n<p>{WEB_LINK}</p>'),
(11, 'en_US', '{WEB_TITLE} - Validate your listing', '<p>Hi {USER_NAME},</p><p>You\'re receiving this e-mail because a listing has been published at {WEB_LINK}. Please validate this listing by clicking on the following link: {VALIDATION_LINK}. If you didn\'t publish this listing, please ignore this email.</p><p>Listing details:</p><p>Contact name: {USER_NAME}<br />Contact e-mail: {USER_EMAIL}</p><p>{ITEM_DESCRIPTION}</p><p>Url: {ITEM_URL}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(11, 'ru_RU', '{WEB_TITLE} - Подтверждение объявления', '<p>Привет {USER_NAME},</p>\r\n<p><span id=\"result_box\" lang=\"ru\"><span class=\"hps\">Вы получили</span> <span class=\"hps\">это письмо</span><span>, потому что</span> опубликовано <span class=\"hps alt-edited\">объявление </span><span class=\"hps alt-edited\">на</span></span> {WEB_LINK}. <span id=\"result_box\" lang=\"ru\"><span class=\"hps\">Пожалуйста,</span> <span class=\"hps\">подтвердите</span> <span class=\"hps alt-edited\">эту запись</span><span>, нажав</span> <span class=\"hps\">на следующую ссылку</span></span>: {VALIDATION_LINK}. <span id=\"result_box\" lang=\"ru\"><span class=\"hps\">Если вы не</span> <span class=\"hps alt-edited\">публиковали</span> <span class=\"hps alt-edited\">объявление</span><span>, не обращайте внимания</span> <span class=\"hps\">на это сообщение.</span></span></p>\r\n<p>Детали объявлени:</p>\r\n<p>Имя: {USER_NAME}<br />E-mail: {USER_EMAIL}</p>\r\n<p>{ITEM_DESCRIPTION}</p>\r\n<p>Ссылка: {ITEM_URL}</p>\r\n<p>С уважением,</p>\r\n<p>{WEB_LINK}</p>'),
(12, 'en_US', '{WEB_TITLE} - A new listing has been published', '<p>Dear {WEB_TITLE} admin,</p><p>You\'re receiving this email because a listing has been published at {WEB_LINK}.</p><p>Listing details:</p><p>Contact name: {USER_NAME}<br />Contact email: {USER_EMAIL}</p><p>{ITEM_DESCRIPTION}</p><p>Url: {ITEM_URL}</p><p>You can edit this listing by clicking on the following link: {EDIT_LINK}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(12, 'ru_RU', '{WEB_TITLE} - Опубликовано новое объявление', '<p>Уважаемый {WEB_TITLE} admin,</p>\r\n<p>Вы получили сообщение о новом объявлении {WEB_LINK}.</p>\r\n<p>Детали объявления:</p>\r\n<p>Имя: {USER_NAME}<br />Email: {USER_EMAIL}</p>\r\n<p>{ITEM_DESCRIPTION}</p>\r\n<p>Url: {ITEM_URL}</p>\r\n<p><span id=\"result_box\" lang=\"ru\"><span class=\"hps\">Вы можете оредактировать этот</span> <span class=\"hps alt-edited\">объявление</span><span>, нажав</span> <span class=\"hps\">на следующую ссылку</span></span>: {EDIT_LINK}</p>\r\n<p>С уважением,</p>\r\n<p>{WEB_LINK}</p>'),
(13, 'en_US', '{WEB_TITLE} - Recover your password', '<p>Hi {USER_NAME},</p><p>We\'ve sent you this e-mail because you\'ve requested a password reminder. Follow this link to recover it: {PASSWORD_LINK}</p><p>The link will be deactivated in 24 hours.</p><p>If you didn\'t request a password reminder, please ignore this message. This request was made from IP {IP_ADDRESS} on {DATE_TIME}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(13, 'ru_RU', '{WEB_TITLE} - Восстановления пароля', '<p>Привет {USER_NAME},</p>\r\n<p><span id=\"result_box\" lang=\"ru\"><span class=\"hps\">Мы отправили</span> <span class=\"hps\">вам</span> <span class=\"hps\">это письмо</span><span>, потому что</span> <span class=\"hps\">вы запросили</span> <span class=\"hps\">напоминание пароля</span><span>.</span> <span class=\"hps\">Перейдите по этой ссылке</span><span>, чтобы</span> <span class=\"hps\">восстановить его</span></span>: {PASSWORD_LINK}</p>\r\n<p><span id=\"result_box\" class=\"short_text\" lang=\"ru\"><span>Ссылка будет</span> <span class=\"hps alt-edited\">деактивируется</span> <span class=\"hps\">в течение 24</span> <span class=\"hps\">часов.</span></span></p>\r\n<p><span id=\"result_box\" lang=\"ru\"><span class=\"hps\">Если</span> <span class=\"hps\">вы не запрашивали</span> <span class=\"hps alt-edited\">напоминание пароля</span><span>, пожалуйста</span> <span class=\"hps\">игнорируйте это сообщение.</span> <span class=\"hps\">Этот запрос</span> <span class=\"hps\">был сделан из</span></span> IP {IP_ADDRESS} on {DATE_TIME}</p>\r\n<p>С уважением,</p>\r\n<p>{WEB_LINK}</p>'),
(14, 'en_US', '{WEB_TITLE} - You requested an email change', '<p>Hi {USER_NAME}</p><p>You\'re receiving this e-mail because you requested an e-mail change. Please confirm this new e-mail address by clicking on the following validation link: {VALIDATION_LINK}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(14, 'ru_RU', '{WEB_TITLE} - Запрос на смену адреса почты', '<p>Здравствуйте {USER_NAME}</p>\r\n<p><span id=\"result_box\" lang=\"ru\"><span class=\"hps\">Вы получили</span> <span class=\"hps\">это письмо</span><span>, потому что вы</span> <span class=\"hps\">запросили</span> и<span class=\"hps\">зменение e-mail</span><span>.</span> <span class=\"hps\">Пожалуйста, подтвердите</span> <span class=\"hps\">новый</span> <span class=\"hps\">адрес</span><span>, перейдя по</span> <span class=\"hps\">следующей ссылке</span><span class=\"hps\"></span></span>: {VALIDATION_LINK}</p>\r\n<p>С уважением,</p>\r\n<p>{WEB_LINK}</p>'),
(15, 'en_US', '{WEB_TITLE} - Please validate your alert', '<p>Hi {USER_NAME},</p><p>Please validate your alert registration by clicking on the following link: {VALIDATION_LINK}</p><p>Thank you!</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(15, 'ru_RU', '{WEB_TITLE} - Пожалуйста, подтвердите подписку', '<p>Привет {USER_NAME},</p>\r\n<p>подтвердите регистрацию, нажав на следующую ссылку: {VALIDATION_LINK}</p>\r\n<p>Спасибо!</p>\r\n<p>С уважением,</p>\r\n<p>{WEB_LINK}</p>'),
(16, 'en_US', '{WEB_TITLE} - Your comment has been approved', '<p>Hi {COMMENT_AUTHOR},</p><p>Your comment on <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a> has been approved.</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(16, 'ru_RU', '{WEB_TITLE} - Ваш комментарий одобрен', '<p>Привет {COMMENT_AUTHOR},</p>\r\n<p>Ваш комментарий на <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a> успешно утвержден.</p>\r\n<p>С уважением,</p>\r\n<p>{WEB_LINK}</p>'),
(17, 'en_US', '{WEB_TITLE} - Validate your listing', '<p>Hi {USER_NAME},</p><p>You\'re receiving this e-mail because you’ve published a listing at {WEB_LINK}. Please validate this listing by clicking on the following link: {VALIDATION_LINK}. If you didn\'t publish this listing, please ignore this e-mail.</p><p>Listing details:</p><p>Contact name: {USER_NAME}<br />Contact e-mail: {USER_EMAIL}</p><p>{ITEM_DESCRIPTION}</p><p>Url: {ITEM_URL}</p><p>Even if you\'re not registered at {WEB_LINK}, you can still edit or delete your listing:</p><p>You can edit your listing by following this link: {EDIT_LINK}</p><p>You can delete your listing by following this link: {DELETE_LINK}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(17, 'ru_RU', '{WEB_TITLE} - Подтверждение объявления', '<p>Здравствуйте {USER_NAME},</p>\r\n<p><span id=\"result_box\" lang=\"ru\"><span class=\"hps\">Вы получили</span> <span class=\"hps\">это письмо</span><span>, потому что</span> <span class=\"hps alt-edited\">опубликовали</span> <span class=\"hps alt-edited\">объявление на</span></span> {WEB_LINK}. <span id=\"result_box\" lang=\"ru\"><span class=\"hps\">Пожалуйста,</span> <span class=\"hps\">подтвердите</span> <span class=\"hps alt-edited\">объявление</span><span>, нажав</span> <span class=\"hps\">на ссылку</span></span>: {VALIDATION_LINK}. <span id=\"result_box\" lang=\"ru\"><span class=\"hps\">Если вы не</span> <span class=\"hps alt-edited\">публиковали</span> <span class=\"hps alt-edited\">объявление</span><span>, пожалуйста,</span> <span class=\"hps alt-edited\">проигнорируйте это письмо.</span></span></p>\r\n<p>Детали объявления:</p>\r\n<p>Имя: {USER_NAME}<br />E-mail: {USER_EMAIL}</p>\r\n<p>{ITEM_DESCRIPTION}</p>\r\n<p>Ссылка: {ITEM_URL}</p>\r\n<p><span id=\"result_box\" class=\"short_text\" lang=\"ru\"><span class=\"hps\">Даже если вы</span> <span class=\"hps\">не зарегистрированы на сайте</span></span> {WEB_LINK}, <span id=\"result_box\" lang=\"ru\"><span class=\"hps alt-edited\">вы все равно можете</span> <span class=\"hps\">редактировать или</span> <span class=\"hps\">удалить </span><span class=\"hps alt-edited\">объявление</span></span>:</p>\r\n<p><span id=\"result_box\" lang=\"ru\"><span class=\"hps\">Вы</span> <span class=\"hps alt-edited\">можете изменить</span> <span class=\"hps alt-edited\">объявление</span><span class=\"alt-edited\"> перейдя по </span><span class=\"hps\">ссылке</span></span>: {EDIT_LINK}</p>\r\n<p><span id=\"result_box\" lang=\"ru\"><span class=\"hps alt-edited\">Вы можете удалить </span> <span class=\"hps alt-edited\">объявление</span> <span class=\"hps\">перейдя по ссылке</span></span>: {DELETE_LINK}</p>\r\n<p>С уважением,</p>\r\n<p>{WEB_LINK}</p>'),
(18, 'en_US', '{WEB_TITLE} - A new user has registered', '<p>Dear {WEB_TITLE} admin,</p><p>You\'re receiving this email because a new user has been created at {WEB_LINK}.</p><p>User details:</p><p>Name: {USER_NAME}<br />E-mail: {USER_EMAIL}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(18, 'ru_RU', '{WEB_TITLE} - Регистрация нового пользователя', '<p>Dear {WEB_TITLE} admin,</p><p>You\'re receiving this email because a new user has been created at {WEB_LINK}.</p><p>User details:</p><p>Name: {USER_NAME}<br />E-mail: {USER_EMAIL}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(19, 'en_US', '{WEB_TITLE} - Someone has a question for you', '<p>Hi {CONTACT_NAME}!</p><p>{USER_NAME} ({USER_EMAIL}, {USER_PHONE}) left you a message:</p><p>{COMMENT}</p><p>Regards,</p><p>{WEB_LINK}</p>'),
(19, 'ru_RU', '{WEB_TITLE} - У кого то есть вопрос к Вам', '<p>Привет {CONTACT_NAME}!</p>\r\n<p>{USER_NAME} ({USER_EMAIL}, {USER_PHONE}) оставил Вам сообщение:</p>\r\n<p>{COMMENT}</p>\r\n<p>С уважением,</p>\r\n<p>{WEB_LINK}</p>'),
(20, 'en_US', '{WEB_TITLE} - Someone has commented on your listing', '<p>There\'s a new comment on the listing: <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a>.</p><p>Author: {COMMENT_AUTHOR}<br />Author\'s email: {COMMENT_EMAIL}<br />Title: {COMMENT_TITLE}<br />Comment: {COMMENT_TEXT}</p><p>{WEB_LINK}</p>'),
(20, 'ru_RU', '{WEB_TITLE} - Кто то оставил комментарий на Ваше объявление', '<p>Новый комментарий к объявлению: <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a>.</p>\r\n<p>Автор: {COMMENT_AUTHOR}<br />Email Автора: {COMMENT_EMAIL}<br />Заголовок: {COMMENT_TITLE}<br />Текст комментария: {COMMENT_TEXT}</p>\r\n<p>{WEB_LINK}</p>'),
(21, 'en_US', '{WEB_TITLE} - Success creating admin account!', '<p>Hi {ADMIN_NAME},</p><p>The admin of {WEB_LINK} has created an account for you,</p><ul><li>Username: {USERNAME}</li><li>Password: {PASSWORD}</li></ul><p>You can access the admin panel here {WEB_ADMIN_LINK}.</p><p>Thank you!</p><p>Regards,</p>'),
(21, 'ru_RU', '{WEB_TITLE} - Успешное создание учетной записи администратора!', '<p>Здравствуйте {ADMIN_NAME},</p>\r\n<p>Администратор {WEB_LINK} создал для Вас личный кабинет,</p>\r\n<ul>\r\n<li>Имя пользователя: {USERNAME}</li>\r\n<li>Пароль: {PASSWORD}</li>\r\n</ul>\r\n<p>Для управления вашим личным кабинетом перейдите по ссылке {WEB_ADMIN_LINK}.</p>\r\n<p>Благодарим Вас!</p>\r\n<p>С уважением,</p>'),
(22, 'en_US', '{WEB_TITLE} - Your ad is about to expire', '<p>Hi {USER_NAME},</p><p>Your listing <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a> is about to expire at {WEB_LINK}.'),
(22, 'ru_RU', '{WEB_TITLE} - Ваше объявление скоро станет не актуальным', '<p>Привет {USER_NAME},</p>\r\n<p>Ваше объявление <a href=\"{ITEM_URL}\">{ITEM_TITLE}</a> - уже не актуально {WEB_LINK}.</p>'),
(23, 'ru_RU', 'Заголовок примера страницы', 'Это описание примера страницы. На данной странице вы можете написать об условиях предоставления услуг или любой другой справочной информации.'),
(40, 'ru_RU', '{WEB_TITLE} - A listing has been renewed', '<p>Dear {WEB_TITLE} admin,</p>\r\n\r\n<p>You are receiving this email because a listing has been renewed at {WEB_LINK}.</p>\r\n\r\n<p>Listing details:</p>\r\n\r\n<p>Contact name: {USER_NAME}<br />Contact email: {USER_EMAIL}</p>\r\n\r\n<p>Title: {ITEM_TITLE}</p>\r\n\r\n<p>Url: {ITEM_URL}</p>\r\n\r\n<p>Regards,</p>\r\n\r\n<p>{WEB_LINK}</p>'),
(41, 'ru_RU', '{WEB_TITLE} - Notification of ad: {ITEM_TITLE}', '<p>Hi Admin!</p>\\r\\n<p> </p>\\r\\n<p>We just published an item ({ITEM_TITLE}) on {WEB_TITLE} from user {USER_NAME} ( {ITEM_URL} ).</p>\\r\\n<p>Edit it here : {EDIT_LINK}</p>\\r\\n<p> </p>\\r\\n<p>Thanks</p>'),
(42, 'ru_RU', '[{WEB_TITLE}] New message: {ITEM_TITLE}', '<p>Hi {TO_NAME},</p><p>{FROM_NAME} has sent you new message on your product {ITEM_LINK} and is listed below:<hr></p><p><strong>{THREAD_TITLE}</strong></p><p>{MESSAGE}</p><p><hr></p><p><br/></p><p>You can directly answer <a target=\"_blank\" href=\"{THREAD_LINK}\">clicking here</a>.<p>Remember, older conversations can always be viewed under \"Messages\" in your user account.</p><p></p><p>Thank you, <br />{WEB_TITLE}</p>');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_pages_seo`
--

CREATE TABLE `oc_t_pages_seo` (
  `seo_page_id` int(10) UNSIGNED NOT NULL,
  `seo_title` varchar(800) DEFAULT NULL,
  `seo_description` varchar(1200) DEFAULT NULL,
  `seo_keywords` varchar(800) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_plugin_category`
--

CREATE TABLE `oc_t_plugin_category` (
  `s_plugin_name` varchar(40) NOT NULL,
  `fk_i_category_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_t_plugin_category`
--

INSERT INTO `oc_t_plugin_category` (`s_plugin_name`, `fk_i_category_id`) VALUES
('cars_plugin', 96);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_preference`
--

CREATE TABLE `oc_t_preference` (
  `s_section` varchar(128) NOT NULL,
  `s_name` varchar(128) NOT NULL,
  `s_value` longtext NOT NULL,
  `e_type` enum('STRING','INTEGER','BOOLEAN') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_t_preference`
--

INSERT INTO `oc_t_preference` (`s_section`, `s_name`, `s_value`, `e_type`) VALUES
('bender_theme', 'defaultShowAs@all', 'list', 'STRING'),
('bender_theme', 'donation', '0', 'STRING'),
('bender_theme', 'footer_link', '1', 'STRING'),
('bender_theme', 'keyword_placeholder', 'например, программист PHP', 'STRING'),
('bender_theme', 'version', '1.0.1', 'STRING'),
('decent_mobile', 'body_background', '#f3f3f3', 'STRING'),
('decent_mobile', 'btn_color_2', '#028bd1', 'STRING'),
('decent_mobile', 'categories_in_row', '3', 'INTEGER'),
('decent_mobile', 'category_display_style', 'grid', 'STRING'),
('decent_mobile', 'cat_icon_color', '8BC34A', 'STRING'),
('decent_mobile', 'detail_public_info', '1', 'BOOLEAN'),
('decent_mobile', 'detail_publisher_info', '1', 'BOOLEAN'),
('decent_mobile', 'detail_related_slider', '1', 'BOOLEAN'),
('decent_mobile', 'floating_header', '1', 'BOOLEAN'),
('decent_mobile', 'header_location', '1', 'BOOLEAN'),
('decent_mobile', 'heading_color', '#354a5f', 'STRING'),
('decent_mobile', 'home_latest_slider', '1', 'BOOLEAN'),
('decent_mobile', 'home_premium_slider', '1', 'BOOLEAN'),
('decent_mobile', 'post_btn_bg', '#fceb42', 'STRING'),
('decent_mobile', 'post_btn_border', '#e1b70c', 'STRING'),
('decent_mobile', 'post_btn_color', '#494949', 'STRING'),
('decent_mobile', 'section_background', '#ffffff', 'STRING'),
('decent_mobile', 'show_cat_id', '0', 'BOOLEAN'),
('decent_mobile', 'show_main_banner', '1', 'BOOLEAN'),
('decent_mobile', 'slider_freemode', '1', 'BOOLEAN'),
('decent_mobile', 'slider_loop', '1', 'BOOLEAN'),
('decent_mobile', 'slidesperview', '3', 'INTEGER'),
('decent_mobile', 'text_color_1', '#ffffff', 'STRING'),
('decent_mobile', 'text_color_2', '#5e5e5e', 'STRING'),
('decent_mobile', 'theme_color', '#028bd1', 'STRING'),
('decent_mobile', 'touch_drag', '1', 'BOOLEAN'),
('glory_theme', 'address_text', 'Коллин Стрит Вест, Виктор 807, США.', 'STRING'),
('glory_theme', 'category_main', '1', 'STRING'),
('glory_theme', 'count_cat', '6', 'STRING'),
('glory_theme', 'count_pop', '4', 'STRING'),
('glory_theme', 'count_prem_home', '4', 'STRING'),
('glory_theme', 'defaultShowAs@search', 'list', 'STRING'),
('glory_theme', 'email_text', 'info@san-osclass.com', 'STRING'),
('glory_theme', 'fc_text', '', 'STRING'),
('glory_theme', 'fixed_search', 'search', 'STRING'),
('glory_theme', 'footer_link', '1', 'STRING'),
('glory_theme', 'gog_text', '', 'STRING'),
('glory_theme', 'h1_text', 'Ищите и находите свой дом', 'STRING'),
('glory_theme', 'h2_text', 'Недвижимость на продажу и в аренду', 'STRING'),
('glory_theme', 'hide_ads', '0', 'STRING'),
('glory_theme', 'ins_text', '', 'STRING'),
('glory_theme', 'keyword_placeholder', 'например Квартиры', 'STRING'),
('glory_theme', 'panorama_img', '0', 'STRING'),
('glory_theme', 'phone_text', '+1 246-345-0695', 'STRING'),
('glory_theme', 'pin_text', '', 'STRING'),
('glory_theme', 'post_location_select', '1', 'STRING'),
('glory_theme', 'rtl', '0', 'STRING'),
('glory_theme', 'show_last_main', '1', 'STRING'),
('glory_theme', 'show_markAs', 'on', 'STRING'),
('glory_theme', 'show_pop_ads', 'y', 'STRING'),
('glory_theme', 'show_premium_main', '1', 'STRING'),
('glory_theme', 'show_prem_search', '1', 'STRING'),
('glory_theme', 'show_users_main', '1', 'STRING'),
('glory_theme', 'tw_text', '', 'STRING'),
('glory_theme', 'useful_info_texten_US', 'Avoid scams by acting locally or paying with PayPal\r\nNever pay with Western Union, Moneygram or other anonymous payment services\r\nDon\'t buy or sell outside of your country. Don\'t accept cashier cheques from outside your country\r\nThis site is never involved in any transaction, and does not handle payments, shipping, guarantee transactions, provide escrow services, or offer \"buyer protection\" or \"seller certification\"', 'STRING'),
('glory_theme', 'useful_info_titleen_US', 'Useful information', 'STRING'),
('glory_theme', 'version', '1.0.0', 'STRING'),
('glory_theme', 'vk_text', '', 'STRING'),
('gmaps_plus', 'gmaps_plus_full_screen_control', '0', 'BOOLEAN'),
('gmaps_plus', 'gmaps_plus_map_type_control', '0', 'BOOLEAN'),
('gmaps_plus', 'gmaps_plus_scale_control', '1', 'BOOLEAN'),
('gmaps_plus', 'gmaps_plus_street_view_control', '0', 'BOOLEAN'),
('gmaps_plus', 'gmaps_plus_zoom_control', '1', 'BOOLEAN'),
('modern_admin_theme', 'compact_mode', '1', 'STRING'),
('moreedit', 'disable_edit', '', 'BOOLEAN'),
('moreedit', 'max_ads_month', '0', 'INTEGER'),
('moreedit', 'max_ads_week', '0', 'INTEGER'),
('moreedit', 'moderate_all', '1', 'BOOLEAN'),
('moreedit', 'moderate_edit', '1', 'BOOLEAN'),
('moreedit', 'notify_edit', '1', 'BOOLEAN'),
('osclass', 'active_plugins', 'a:13:{i:2;s:25:\"profile_picture/index.php\";i:3;s:20:\"spamkiller/index.php\";i:4;s:21:\"osclassmail/index.php\";i:6;s:19:\"renew_ads/index.php\";i:7;s:23:\"decent_mobile/index.php\";i:10;s:18:\"moreedit/index.php\";i:15;s:20:\"attributes/index.php\";i:18;s:27:\"instant_messenger/index.php\";i:19;s:25:\"yandex_maps_pro/index.php\";i:21;s:27:\"responsive_slides/index.php\";i:23;s:25:\"cars_attributes/index.php\";i:24;s:19:\"watchlist/index.php\";i:25;s:20:\"seo_plugin/index.php\";}', 'STRING'),
('osclass', 'admin_language', 'ru_RU', 'STRING'),
('osclass', 'admin_theme', 'modern', 'STRING'),
('osclass', 'akismetKey', '', 'STRING'),
('osclass', 'allowedExt', 'png,gif,jpg,jpeg', 'STRING'),
('osclass', 'allow_report_osclass', '0', 'BOOLEAN'),
('osclass', 'auto_cron', '1', 'STRING'),
('osclass', 'auto_update', 'disabled', 'STRING'),
('osclass', 'comments_per_page', '10', 'INTEGER'),
('osclass', 'contactEmail', 'packpacki@yandex.ru', 'STRING'),
('osclass', 'contact_attachment', '0', 'STRING'),
('osclass', 'csrf_name', 'CSRF1126068814', 'STRING'),
('osclass', 'currency', 'RUB', 'STRING'),
('osclass', 'dateFormat', 'F j, Y', 'STRING'),
('osclass', 'defaultOrderField@search', 'dt_pub_date', 'STRING'),
('osclass', 'defaultOrderType@search', '1', 'BOOLEAN'),
('osclass', 'defaultResultsPerPage@search', '36', 'STRING'),
('osclass', 'defaultShowAs@search', 'list', 'STRING'),
('osclass', 'description_character_length', '5000', 'INTEGER'),
('osclass', 'dimNormal', '640x480', 'STRING'),
('osclass', 'dimPreview', '480x340', 'STRING'),
('osclass', 'dimThumbnail', '240x200', 'STRING'),
('osclass', 'enabled_comments', '1', 'BOOLEAN'),
('osclass', 'enabled_recaptcha_items', '0', 'BOOLEAN'),
('osclass', 'enabled_users', '1', 'STRING'),
('osclass', 'enabled_user_registration', '1', 'STRING'),
('osclass', 'enabled_user_validation', '0', 'STRING'),
('osclass', 'enableField#f_price@items', '1', 'BOOLEAN'),
('osclass', 'enableField#images@items', '1', 'BOOLEAN'),
('osclass', 'force_aspect_image', '0', 'STRING'),
('osclass', 'force_jpeg', '0', 'STRING'),
('osclass', 'installed_plugins', 'a:14:{i:2;s:25:\"profile_picture/index.php\";i:3;s:20:\"spamkiller/index.php\";i:4;s:21:\"osclassmail/index.php\";i:6;s:19:\"renew_ads/index.php\";i:7;s:23:\"decent_mobile/index.php\";i:9;s:25:\"yandex_maps_pro/index.php\";i:10;s:18:\"moreedit/index.php\";i:11;s:27:\"responsive_slides/index.php\";i:12;s:16:\"slider/index.php\";i:14;s:25:\"cars_attributes/index.php\";i:15;s:20:\"attributes/index.php\";i:17;s:27:\"instant_messenger/index.php\";i:20;s:19:\"watchlist/index.php\";i:21;s:20:\"seo_plugin/index.php\";}', 'STRING'),
('osclass', 'items_wait_time', '0', 'INTEGER'),
('osclass', 'item_attachment', '0', 'BOOLEAN'),
('osclass', 'keep_original_image', '1', 'STRING'),
('osclass', 'language', 'ru_RU', 'STRING'),
('osclass', 'languages_downloaded', '[\"en_US\",\"ru_RU\"]', 'STRING'),
('osclass', 'languages_last_version_check', '1629399953', 'STRING'),
('osclass', 'languages_to_update', '[]', 'STRING'),
('osclass', 'languages_update_count', '0', 'STRING'),
('osclass', 'last_version_check', '1629317161', 'STRING'),
('osclass', 'location_todo', '1885', 'STRING'),
('osclass', 'logged_user_item_validation', '1', 'BOOLEAN'),
('osclass', 'mailserver_auth', '0', 'STRING'),
('osclass', 'mailserver_host', 'localhost', 'STRING'),
('osclass', 'mailserver_mail_from', 'packpacki@yandex.ru', 'STRING'),
('osclass', 'mailserver_name_from', 'Доска объявлений сайт', 'STRING'),
('osclass', 'mailserver_password', '', 'STRING'),
('osclass', 'mailserver_pop', '0', 'STRING'),
('osclass', 'mailserver_port', '0', 'STRING'),
('osclass', 'mailserver_ssl', '', 'STRING'),
('osclass', 'mailserver_type', 'custom', 'STRING'),
('osclass', 'mailserver_username', 'Доска объявлений сайт', 'STRING'),
('osclass', 'marketAllowExternalSources', '0', 'STRING'),
('osclass', 'marketAPIConnect', '', 'STRING'),
('osclass', 'marketCategories', '', 'STRING'),
('osclass', 'marketDataUpdate', '0', 'INTEGER'),
('osclass', 'marketURL', 'https://market.osclass.org/api/v3/', 'STRING'),
('osclass', 'maxLatestItems@home', '36', 'STRING'),
('osclass', 'maxResultsPerPage@search', '50', 'INTEGER'),
('osclass', 'maxSizeKb', '6000', 'STRING'),
('osclass', 'moderate_comments', '0', 'INTEGER'),
('osclass', 'moderate_items', '-1', 'INTEGER'),
('osclass', 'mod_rewrite_loaded', '0', 'STRING'),
('osclass', 'notify_contact_friends', '1', 'BOOLEAN'),
('osclass', 'notify_contact_item', '1', 'BOOLEAN'),
('osclass', 'notify_new_comment', '1', 'BOOLEAN'),
('osclass', 'notify_new_comment_user', '0', 'BOOLEAN'),
('osclass', 'notify_new_item', '1', 'BOOLEAN'),
('osclass', 'notify_new_user', '1', 'STRING'),
('osclass', 'numImages@items', '4', 'INTEGER'),
('osclass', 'num_rss_items', '50', 'STRING'),
('osclass', 'osclass_installed', '1', 'BOOLEAN'),
('osclass', 'pageDesc', '', 'STRING'),
('osclass', 'pageTitle', 'Доска объявлений', 'STRING'),
('osclass', 'ping_search_engines', '1', 'BOOLEAN'),
('osclass', 'plugins_downloaded', '[\"cars-attributes\",\"youtube\",\"instant-messenger-plugin\",\"more-edit\",\"\",\"\",\"http:\\/\\/plugins-zone.com\\/renew_ads\",\"responsive-slides\",\"\",\"\",\"watchlist\",\"xml-import-export-category\",\"yandex-maps-pro\"]', 'STRING'),
('osclass', 'plugins_last_version_check', '1629399953', 'STRING'),
('osclass', 'plugins_to_update', '[]', 'STRING'),
('osclass', 'plugins_update_count', '0', 'STRING'),
('osclass', 'purge_latest_searches', '1000', 'STRING'),
('osclass', 'recaptchaPrivKey', '', 'STRING'),
('osclass', 'recaptchaPubKey', '', 'STRING'),
('osclass', 'recaptcha_version', '1', 'STRING'),
('osclass', 'reg_user_can_contact', '0', 'BOOLEAN'),
('osclass', 'reg_user_post', '0', 'BOOLEAN'),
('osclass', 'reg_user_post_comments', '0', 'BOOLEAN'),
('osclass', 'rewriteEnabled', '0', 'STRING'),
('osclass', 'rewrite_cat_url', '{CATEGORIES}', 'STRING'),
('osclass', 'rewrite_contact', 'contact', 'STRING'),
('osclass', 'rewrite_feed', 'feed', 'STRING'),
('osclass', 'rewrite_item_activate', 'item/activate', 'STRING'),
('osclass', 'rewrite_item_contact', 'item/contact', 'STRING'),
('osclass', 'rewrite_item_delete', 'item/delete', 'STRING'),
('osclass', 'rewrite_item_edit', 'item/edit', 'STRING'),
('osclass', 'rewrite_item_mark', 'item/mark', 'STRING'),
('osclass', 'rewrite_item_new', 'item/new', 'STRING'),
('osclass', 'rewrite_item_resource_delete', 'resource/delete', 'STRING'),
('osclass', 'rewrite_item_send_friend', 'item/send-friend', 'STRING'),
('osclass', 'rewrite_item_url', '{CATEGORIES}/{ITEM_TITLE}_i{ITEM_ID}', 'STRING'),
('osclass', 'rewrite_language', 'language', 'STRING'),
('osclass', 'rewrite_page_url', '{PAGE_SLUG}-p{PAGE_ID}', 'STRING'),
('osclass', 'rewrite_rules', 'a:42:{s:11:\"^contact/?$\";s:22:\"index.php?page=contact\";s:8:\"^feed/?$\";s:31:\"index.php?page=search&sFeed=rss\";s:13:\"^feed/(.+)/?$\";s:30:\"index.php?page=search&sFeed=$1\";s:18:\"^language/(.*?)/?$\";s:33:\"index.php?page=language&locale=$1\";s:8:\"^search$\";s:21:\"index.php?page=search\";s:13:\"^search/(.*)$\";s:32:\"index.php?page=search&sParams=$1\";s:28:\"^item/mark/(.*?)/([0-9]+)/?$\";s:43:\"index.php?page=item&action=mark&as=$1&id=$2\";s:29:\"^item/send-friend/([0-9]+)/?$\";s:44:\"index.php?page=item&action=send_friend&id=$1\";s:25:\"^item/contact/([0-9]+)/?$\";s:40:\"index.php?page=item&action=contact&id=$1\";s:12:\"^item/new/?$\";s:35:\"index.php?page=item&action=item_add\";s:21:\"^item/new/([0-9]+)/?$\";s:44:\"index.php?page=item&action=item_add&catId=$1\";s:32:\"^item/activate/([0-9]+)/(.*?)/?$\";s:51:\"index.php?page=item&action=activate&id=$1&secret=$2\";s:28:\"^item/edit/([0-9]+)/(.*?)/?$\";s:52:\"index.php?page=item&action=item_edit&id=$1&secret=$2\";s:30:\"^item/delete/([0-9]+)/(.*?)/?$\";s:54:\"index.php?page=item&action=item_delete&id=$1&secret=$2\";s:59:\"^resource/delete/([0-9]+)/([0-9]+)/([0-9A-Za-z]+)/?(.*?)/?$\";s:73:\"index.php?page=item&action=deleteResource&id=$1&item=$2&code=$3&secret=$4\";s:65:\"^([a-z]{2})_([A-Z]{2})/.*/.*_i([0-9]+)\\?comments-page=([0-9al]*)$\";s:53:\"index.php?page=item&id=$3&lang=$1_$2&comments-page=$4\";s:43:\"^.*/.*_i([0-9]+)\\?comments-page=([0-9al]*)$\";s:42:\"index.php?page=item&id=$1&comments-page=$2\";s:39:\"^([a-z]{2})_([A-Z]{2})/.*/.*_i([0-9]+)$\";s:36:\"index.php?page=item&id=$3&lang=$1_$2\";s:17:\"^.*/.*_i([0-9]+)$\";s:25:\"index.php?page=item&id=$1\";s:14:\"^user/login/?$\";s:20:\"index.php?page=login\";s:18:\"^user/dashboard/?$\";s:36:\"index.php?page=user&action=dashboard\";s:15:\"^user/logout/?$\";s:33:\"index.php?page=main&action=logout\";s:17:\"^user/register/?$\";s:39:\"index.php?page=register&action=register\";s:32:\"^user/activate/([0-9]+)/(.*?)/?$\";s:53:\"index.php?page=register&action=validate&id=$1&code=$2\";s:44:\"^alert/confirm/([0-9]+)/([a-zA-Z0-9]+)/(.+)$\";s:66:\"index.php?page=user&action=activate_alert&id=$1&email=$3&secret=$2\";s:16:\"^user/profile/?$\";s:34:\"index.php?page=user&action=profile\";s:25:\"^user/profile/([0-9]+)/?$\";s:44:\"index.php?page=user&action=pub_profile&id=$1\";s:21:\"^user/profile/(.+)/?$\";s:50:\"index.php?page=user&action=pub_profile&username=$1\";s:14:\"^user/items/?$\";s:32:\"index.php?page=user&action=items\";s:15:\"^user/alerts/?$\";s:33:\"index.php?page=user&action=alerts\";s:16:\"^user/recover/?$\";s:35:\"index.php?page=login&action=recover\";s:29:\"^user/forgot/([0-9]+)/(.*)/?$\";s:52:\"index.php?page=login&action=forgot&userId=$1&code=$2\";s:19:\"^password/change/?$\";s:42:\"index.php?page=user&action=change_password\";s:16:\"^email/change/?$\";s:39:\"index.php?page=user&action=change_email\";s:19:\"^username/change/?$\";s:42:\"index.php?page=user&action=change_username\";s:32:\"^email/confirm/([0-9]+)/(.*?)/?$\";s:65:\"index.php?page=user&action=change_email_confirm&userId=$1&code=$2\";s:33:\"^([\\p{L}\\p{N}_\\-,]+)-p([0-9]+)/?$\";s:33:\"index.php?page=page&id=$2&slug=$1\";s:55:\"^([a-z]{2})_([A-Z]{2})/([\\p{L}\\p{N}_\\-,]+)-p([0-9]+)/?$\";s:44:\"index.php?page=page&lang=$1_$2&id=$4&slug=$3\";s:16:\"^(.+?)\\.php(.*)$\";s:8:\"$1.php$2\";s:15:\"^(.+)/([0-9]+)$\";s:30:\"index.php?page=search&iPage=$2\";s:8:\"^(.+)/?$\";s:34:\"index.php?page=search&sCategory=$1\";s:6:\"^(.+)$\";s:21:\"index.php?page=search\";}', 'STRING'),
('osclass', 'rewrite_search_category', 'category', 'STRING'),
('osclass', 'rewrite_search_city', 'city', 'STRING'),
('osclass', 'rewrite_search_city_area', 'cityarea', 'STRING'),
('osclass', 'rewrite_search_country', 'country', 'STRING'),
('osclass', 'rewrite_search_pattern', 'pattern', 'STRING'),
('osclass', 'rewrite_search_region', 'region', 'STRING'),
('osclass', 'rewrite_search_url', 'search', 'STRING'),
('osclass', 'rewrite_search_user', 'user', 'STRING'),
('osclass', 'rewrite_user_activate', 'user/activate', 'STRING'),
('osclass', 'rewrite_user_activate_alert', 'alert/confirm', 'STRING'),
('osclass', 'rewrite_user_alerts', 'user/alerts', 'STRING'),
('osclass', 'rewrite_user_change_email', 'email/change', 'STRING'),
('osclass', 'rewrite_user_change_email_confirm', 'email/confirm', 'STRING'),
('osclass', 'rewrite_user_change_password', 'password/change', 'STRING'),
('osclass', 'rewrite_user_change_username', 'username/change', 'STRING'),
('osclass', 'rewrite_user_dashboard', 'user/dashboard', 'STRING'),
('osclass', 'rewrite_user_forgot', 'user/forgot', 'STRING'),
('osclass', 'rewrite_user_items', 'user/items', 'STRING'),
('osclass', 'rewrite_user_login', 'user/login', 'STRING'),
('osclass', 'rewrite_user_logout', 'user/logout', 'STRING'),
('osclass', 'rewrite_user_profile', 'user/profile', 'STRING'),
('osclass', 'rewrite_user_recover', 'user/recover', 'STRING'),
('osclass', 'rewrite_user_register', 'user/register', 'STRING'),
('osclass', 'save_latest_searches', '0', 'BOOLEAN'),
('osclass', 'selectable_parent_categories', '1', 'STRING'),
('osclass', 'seo_url_search_prefix', '', 'STRING'),
('osclass', 'subdomain_host', '', 'STRING'),
('osclass', 'subdomain_type', '', 'STRING'),
('osclass', 'theme', 'san_auto', 'STRING'),
('osclass', 'themes_downloaded', '[\"bender\",\"san_auto\"]', 'STRING'),
('osclass', 'themes_last_version_check', '1629399953', 'STRING'),
('osclass', 'themes_to_update', '[]', 'STRING'),
('osclass', 'themes_update_count', '0', 'STRING'),
('osclass', 'timeFormat', 'g:i a', 'STRING'),
('osclass', 'timezone', 'Europe/Madrid', 'STRING'),
('osclass', 'title_character_length', '100', 'INTEGER'),
('osclass', 'update_core_json', '', 'STRING'),
('osclass', 'username_blacklist', 'admin,user', 'STRING'),
('osclass', 'use_imagick', '1', 'STRING'),
('osclass', 'version', '380', 'STRING'),
('osclass', 'warn_expiration', '0', 'INTEGER'),
('osclass', 'watermark_image', '', 'STRING'),
('osclass', 'watermark_place', 'centre', 'STRING'),
('osclass', 'watermark_text', '', 'STRING'),
('osclass', 'watermark_text_color', '', 'STRING'),
('osclass', 'weekStart', '1', 'STRING'),
('plugin-instant_messenger', 'att_days', '360', 'INTEGER'),
('plugin-instant_messenger', 'att_enable', '1', 'INTEGER'),
('plugin-instant_messenger', 'att_extension', 'jpg, jpeg, png, gif, doc, docx, pdf, txt', 'STRING'),
('plugin-instant_messenger', 'att_max_size', '512', 'INTEGER'),
('plugin-instant_messenger', 'contact_seller', '1', 'INTEGER'),
('plugin-instant_messenger', 'item_hook', '0', 'INTEGER'),
('plugin-instant_messenger', 'link_reg_only', '1', 'INTEGER'),
('plugin-instant_messenger', 'message_delete', '0', 'STRING'),
('plugin-instant_messenger', 'notify_once', '1', 'INTEGER'),
('plugin-instant_messenger', 'threads_per_page', '20', 'INTEGER'),
('plugin-instant_messenger', 'thread_days', '360', 'INTEGER'),
('plugin-instant_messenger', 'version', '101', 'INTEGER'),
('plugin-osclass_pay', 'version', '100', 'INTEGER'),
('plugin-seo_plugin', 'seoplugin_allow_custom_meta', '1', 'INTEGER'),
('plugin-seo_plugin', 'seoplugin_body_order', '6', 'INTEGER'),
('plugin-seo_plugin', 'seoplugin_category_order', '4', 'INTEGER'),
('plugin-seo_plugin', 'seoplugin_category_show', '1', 'INTEGER'),
('plugin-seo_plugin', 'seoplugin_city_order', '1', 'INTEGER'),
('plugin-seo_plugin', 'seoplugin_city_show', '1', 'INTEGER'),
('plugin-seo_plugin', 'seoplugin_country_order', '3', 'INTEGER'),
('plugin-seo_plugin', 'seoplugin_country_show', '1', 'INTEGER'),
('plugin-seo_plugin', 'seoplugin_delimiter', '|', 'STRING'),
('plugin-seo_plugin', 'seoplugin_description', '1', 'INTEGER'),
('plugin-seo_plugin', 'seoplugin_keywords', 'classifieds, ads, classifieds ads, buy, sell', 'STRING'),
('plugin-seo_plugin', 'seoplugin_keywords_enabled', '1', 'INTEGER'),
('plugin-seo_plugin', 'seoplugin_region_order', '2', 'INTEGER'),
('plugin-seo_plugin', 'seoplugin_region_show', '1', 'INTEGER'),
('plugin-seo_plugin', 'seoplugin_robots', 'User-agent: *\nDisallow: /oc-admin/', 'STRING'),
('plugin-seo_plugin', 'seoplugin_robots_enabled', '0', 'INTEGER'),
('plugin-seo_plugin', 'seoplugin_sitemap_freq', 'weekly', 'STRING'),
('plugin-seo_plugin', 'seoplugin_sitemap_items', '1', 'INTEGER'),
('plugin-seo_plugin', 'seoplugin_sitemap_items_limit', '1000', 'INTEGER'),
('plugin-seo_plugin', 'seoplugin_title_first', '0', 'INTEGER'),
('plugin-seo_plugin', 'seoplugin_title_order', '5', 'INTEGER'),
('plugin-seo_plugin', 'seoplugin_title_show', '1', 'INTEGER'),
('renew_ads', 'allow_to_expired', 'off', 'STRING'),
('renew_ads', 'days_to_clear_deleted_table', '5', 'INTEGER'),
('renew_ads', 'delete_expired_after_days', '0', 'INTEGER'),
('renew_ads', 'delete_expired_cron', 'off', 'STRING'),
('renew_ads', 'delete_spam_cron', 'off', 'STRING'),
('renew_ads', 'only_renew', '', 'STRING'),
('renew_ads', 'renew_times', '3', 'INTEGER'),
('renew_ads', 'send_admin_email', '', 'STRING'),
('renew_ads', 'time_between_renew', '86400', 'INTEGER'),
('responsive_slides', 'auto', '1', 'BOOLEAN'),
('responsive_slides', 'backgroundcolor', '#FFFFFF', 'STRING'),
('responsive_slides', 'bordercolor', '#FFFFFF', 'STRING'),
('responsive_slides', 'borderwidth', '0', 'STRING'),
('responsive_slides', 'caption', '1', 'BOOLEAN'),
('responsive_slides', 'description', '1', 'BOOLEAN'),
('responsive_slides', 'height', '440', 'STRING'),
('responsive_slides', 'link', '1', 'BOOLEAN'),
('responsive_slides', 'navigation', '1', 'BOOLEAN'),
('responsive_slides', 'openin', '1', 'BOOLEAN'),
('responsive_slides', 'pager', '1', 'BOOLEAN'),
('responsive_slides', 'shadowcolor', '#333333', 'STRING'),
('responsive_slides', 'speed', '500', 'STRING'),
('responsive_slides', 'width', '1300', 'STRING'),
('rupayments', 'color', 'F0E68C', 'STRING'),
('rupayments', 'language', 'en', 'STRING'),
('rupayments', 'paypal_email', '', 'STRING'),
('san_auto', 'about', '1', 'STRING'),
('san_auto', 'address_req', '1', 'STRING'),
('san_auto', 'agree', '0', 'STRING'),
('san_auto', 'agree2', '0', 'STRING'),
('san_auto', 'agree_link', '', 'STRING'),
('san_auto', 'agree_link2', '', 'STRING'),
('san_auto', 'cat', '1', 'STRING'),
('san_auto', 'cat_count', '2', 'STRING'),
('san_auto', 'cityarea', '1', 'STRING'),
('san_auto', 'cityarea_req', '1', 'STRING'),
('san_auto', 'color', 'green', 'STRING'),
('san_auto', 'cust', '1', 'STRING'),
('san_auto', 'defaultSlide', 'image', 'STRING'),
('san_auto', 'def_view', '1', 'STRING'),
('san_auto', 'email_text', 'info@adgba.ru', 'STRING'),
('san_auto', 'fc_text', 'https://www.facebook.com/', 'STRING'),
('san_auto', 'follow', '1', 'STRING'),
('san_auto', 'footer_link', '0', 'STRING'),
('san_auto', 'h1_text', 'Автомобильная доска объявлений', 'STRING'),
('san_auto', 'h2_text', 'Авто на продажу и в аренду', 'STRING'),
('san_auto', 'ins_text', '', 'STRING'),
('san_auto', 'keyword_placeholder', 'Например: Aston Martin', 'STRING'),
('san_auto', 'lastpos', '3', 'STRING'),
('san_auto', 'lat_items', 'on', 'STRING'),
('san_auto', 'loc', '0', 'STRING'),
('san_auto', 'loc_home', 'region', 'STRING'),
('san_auto', 'loc_req', '1', 'STRING'),
('san_auto', 'logo', 'logo-header.png', 'STRING'),
('san_auto', 'logo_footer', 'logo-footer.png', 'STRING'),
('san_auto', 'makepos', '2', 'STRING'),
('san_auto', 'make_count', '20', 'STRING'),
('san_auto', 'make_items', 'on', 'STRING'),
('san_auto', 'mark', '1', 'STRING'),
('san_auto', 'name_req', '1', 'STRING'),
('san_auto', 'phone', '0', 'STRING'),
('san_auto', 'phone_text', '', 'STRING'),
('san_auto', 'pin_text', '', 'STRING'),
('san_auto', 'poppos', '4', 'STRING'),
('san_auto', 'pop_count', '8', 'STRING'),
('san_auto', 'pop_items', 'on', 'STRING'),
('san_auto', 'prempos', '1', 'STRING'),
('san_auto', 'prem_count', '8', 'STRING'),
('san_auto', 'prem_items', 'on', 'STRING'),
('san_auto', 'price_req', '1', 'STRING'),
('san_auto', 'related_num', '4', 'STRING'),
('san_auto', 'rtl', '1', 'STRING'),
('san_auto', 'rtl2', '1', 'STRING'),
('san_auto', 'text_color', '#FFFFFF', 'STRING'),
('san_auto', 'tg_text', '', 'STRING'),
('san_auto', 'tw_text', 'https://twitter.com/', 'STRING'),
('san_auto', 'useful', '1', 'STRING'),
('san_auto', 'user_type', '0', 'STRING'),
('san_auto', 'version', '1.0.0', 'STRING'),
('san_auto', 'viber_text', '', 'STRING'),
('san_auto', 'vk_text', 'https://vk.com/', 'STRING'),
('san_auto', 'wt_text', '', 'STRING'),
('san_auto', 'you_text', '', 'STRING'),
('Slider', 'auto', '1', 'BOOLEAN'),
('Slider', 'backgroundcolor', '#FFFFFF', 'STRING'),
('Slider', 'bordercolor', '#FFFFFF', 'STRING'),
('Slider', 'borderwidth', '10', 'STRING'),
('Slider', 'caption', '0', 'BOOLEAN'),
('Slider', 'height', '0', 'STRING'),
('Slider', 'link', '1', 'BOOLEAN'),
('Slider', 'navigation', '1', 'BOOLEAN'),
('Slider', 'openin', '1', 'BOOLEAN'),
('Slider', 'pager', '1', 'BOOLEAN'),
('Slider', 'shadowcolor', 'transparent', 'STRING'),
('Slider', 'speed', '500', 'STRING'),
('Slider', 'width', '0', 'STRING'),
('SpamKiller', 'enableon', '1', 'STRING'),
('SpamKiller', 'stopwords', '6ля,6лядь,6лять,b3ъeб,cock,cunt,e6aль,ebal,eblan,eбaл,eбaть,eбyч,eбать,eбёт,eблантий,fuck,fucker,fucking,xyёв,xyй,xyя,xуе,xуй,xую,zaeb,zaebal,zaebali,zaebat,архипиздрит,ахуел,ахуеть,бздение,бздеть,бздех,бздецы,бздит,бздицы,бздло,бзднуть,бздун,бздунья,бздюха,бздюшка,бздюшко,бля,блябу,блябуду,бляд,бляди,блядина,блядище,блядки,блядовать,блядство,блядун,блядуны,блядунья,блядь,блядюга,блять,вафел,вафлёр,взъебка,взьебка,взьебывать,въеб,въебался,въебенн,въебусь,въебывать,выблядок,выблядыш,выеб,выебать,выебен,выебнулся,выебон,выебываться,выпердеть,высраться,выссаться,вьебен,гавно,гавнюк,гавнючка,гамно,гандон,гнид,гнида,гниды,говенка,говенный,говешка,говназия,говнецо,говнище,говно,говноед,говнолинк,говночист,говнюк,говнюха,говнядина,говняк,говняный,говнять,гондон,доебываться,долбоеб,долбоёб,долбоящер,дрисня,дрист,дристануть,дристать,дристун,дристуха,дрочелло,дрочена,дрочила,дрочилка,дрочистый,дрочить,дрочка,дрочун,е6ал,е6ут,ебтвоюмать,ёбтвоюмать,ёбaн,ебaть,ебyч,ебал,ебало,ебальник,ебан,ебанамать,ебанат,ебаная,ёбаная,ебанический,ебанный,ебанныйврот,ебаное,ебануть,ебануться,ёбаную,ебаный,ебанько,ебарь,ебат,ёбат,ебатория,ебать,ебать-копать,ебаться,ебашить,ебёна,ебет,ебёт,ебец,ебик,ебин,ебись,ебическая,ебки,ебла,еблан,ебливый,еблище,ебло,еблыст,ебля,ёбн,ебнуть,ебнуться,ебня,ебошить,ебская,ебский,ебтвоюмать,ебун,ебут,ебуч,ебуче,ебучее,ебучий,ебучим,ебущ,ебырь,елда,елдак,елдачить,жопа,жопу,заговнять,задрачивать,задристать,задрота,зае6,заё6,заеб,заёб,заеба,заебал,заебанец,заебастая,заебастый,заебать,заебаться,заебашить,заебистое,заёбистое,заебистые,заёбистые,заебистый,заёбистый,заебись,заебошить,заебываться,залуп,залупа,залупаться,залупить,залупиться,замудохаться,запиздячить,засерать,засерун,засеря,засирать,засрун,захуячить,заябестая,злоеб,злоебучая,злоебучее,злоебучий,ибанамат,ибонех,изговнять,изговняться,изъебнуться,ипать,ипаться,ипаццо,Какдвапальцаобоссать,конча,курва,курвятник,лох,лошарa,лошара,лошары,лошок,лярва,малафья,манда,мандавошек,мандавошка,мандавошки,мандей,мандень,мандеть,мандища,мандой,манду,мандюк,минет,минетчик,минетчица,млять,мокрощелка,мокрощёлка,мразь,мудak,мудaк,мудаг,мудак,муде,мудель,мудеть,муди,мудил,мудила,мудистый,мудня,мудоеб,мудозвон,мудоклюй,нахер,нахуй,набздел,набздеть,наговнять,надристать,надрочить,наебать,наебет,наебнуть,наебнуться,наебывать,напиздел,напиздели,напиздело,напиздили,насрать,настопиздить,нахер,нахрен,нахуй,нахуйник,неебет,неебёт,невротебучий,невъебенно,нехира,нехрен,Нехуй,нехуйственно,ниибацо,ниипацца,ниипаццо,ниипет,никуя,нихера,нихуя,обдристаться,обосранец,обосрать,обосцать,обосцаться,обсирать,объебос,обьебатьобьебос,однохуйственно,опездал,опизде,опизденивающе,остоебенить,остопиздеть,отмудохать,отпиздить,отпиздячить,отпороть,отъебись,охуевательский,охуевать,охуевающий,охуел,охуенно,охуеньчик,охуеть,охуительно,охуительный,охуяньчик,охуячивать,охуячить,очкун,падла,падонки,падонок,паскуда,педерас,педик,педрик,педрила,педрилло,педрило,педрилы,пездень,пездит,пездишь,пездо,пездят,пердануть,пердеж,пердение,пердеть,пердильник,перднуть,пёрднуть,пердун,пердунец,пердунина,пердунья,пердуха,пердь,переёбок,пернуть,пёрнуть,пи3д,пи3де,пи3ду,пиzдец,пидар,пидарaс,пидарас,пидарасы,пидары,пидор,пидорасы,пидорка,пидорок,пидоры,пидрас,пизда,пиздануть,пиздануться,пиздарваньчик,пиздато,пиздатое,пиздатый,пизденка,пизденыш,пиздёныш,пиздеть,пиздец,пиздит,пиздить,пиздиться,пиздишь,пиздища,пиздище,пиздобол,пиздоболы,пиздобратия,пиздоватая,пиздоватый,пиздолиз,пиздонутые,пиздорванец,пиздорванка,пиздострадатель,пизду,пиздуй,пиздун,пиздунья,пизды,пиздюга,пиздюк,пиздюлина,пиздюля,пиздят,пиздячить,писбшки,писька,писькострадатель,писюн,писюшка,похуй,похую,подговнять,подонки,подонок,подъебнуть,подъебнуться,поебать,поебень,поёбываает,поскуда,посрать,потаскуха,потаскушка,похер,похерил,похерила,похерили,похеру,похрен,похрену,похуй,похуист,похуистка,похую,придурок,приебаться,припиздень,припизднутый,припиздюлина,пробзделся,проблядь,проеб,проебанка,проебать,промандеть,промудеть,пропизделся,пропиздеть,пропиздячить,раздолбай,разхуячить,разъеб,разъеба,разъебай,разъебать,распиздай,распиздеться,распиздяй,распиздяйство,распроеть,сволота,сволочь,сговнять,секель,серун,серька,сестроеб,сикель,сила,сирать,сирывать,соси,спиздел,спиздеть,спиздил,спиздила,спиздили,спиздит,спиздить,срака,сраку,сраный,сранье,срать,срун,ссака,ссышь,стерва,страхопиздище,сука,суки,суходрочка,сучара,сучий,сучка,сучко,сучонок,сучье,сцание,сцать,сцука,сцуки,сцуконах,сцуль,сцыха,сцышь,съебаться,сыкун,трахае6,трахаеб,трахаёб,трахатель,ублюдок,уебать,уёбища,уебище,уёбище,уебищное,уёбищное,уебк,уебки,уёбки,уебок,уёбок,урюк,усраться,ушлепок,х_у_я_р_а,хyё,хyй,хyйня,хамло,хер,херня,херовато,херовина,херовый,хитровыебанный,хитрожопый,хуeм,хуе,хуё,хуевато,хуёвенький,хуевина,хуево,хуевый,хуёвый,хуек,хуёк,хуел,хуем,хуенч,хуеныш,хуенький,хуеплет,хуеплёт,хуепромышленник,хуерик,хуерыло,хуесос,хуесоска,хуета,хуетень,хуею,хуи,хуй,хуйком,хуйло,хуйня,хуйрик,хуище,хуля,хую,хуюл,хуя,хуяк,хуякать,хуякнуть,хуяра,хуясе,хуячить,целка,чмо,чмошник,чмырь,шалава,шалавой,шараёбиться,шлюха,шлюхой,шлюшка,ябывает', 'STRING'),
('veronika_theme', 'banner_home_bottom', '', 'STRING'),
('veronika_theme', 'banner_home_top', '', 'STRING'),
('veronika_theme', 'banner_item_bottom', '', 'STRING'),
('veronika_theme', 'banner_item_description', '', 'STRING'),
('veronika_theme', 'banner_item_sidebar', '', 'STRING'),
('veronika_theme', 'banner_item_top', '', 'STRING'),
('veronika_theme', 'banner_search_bottom', '', 'STRING'),
('veronika_theme', 'banner_search_list', '', 'STRING'),
('veronika_theme', 'banner_search_sidebar', '', 'STRING'),
('veronika_theme', 'banner_search_top', '', 'STRING'),
('veronika_theme', 'cat_icons', '1', 'STRING'),
('veronika_theme', 'date_format', 'mm/dd', 'STRING'),
('veronika_theme', 'default_logo', '1', 'STRING'),
('veronika_theme', 'def_cur', 'Руб', 'STRING'),
('veronika_theme', 'def_view', '0', 'STRING'),
('veronika_theme', 'donation', '0', 'STRING'),
('veronika_theme', 'footer_email', '', 'STRING'),
('veronika_theme', 'footer_link', '0', 'STRING'),
('veronika_theme', 'format_cur', '1', 'STRING'),
('veronika_theme', 'format_sep', '', 'STRING'),
('veronika_theme', 'forms_ajax', '1', 'STRING'),
('veronika_theme', 'item_ajax', '1', 'STRING'),
('veronika_theme', 'item_images', '2', 'STRING'),
('veronika_theme', 'item_pager', '0', 'STRING'),
('veronika_theme', 'latest_category', '', 'STRING'),
('veronika_theme', 'latest_picture', '0', 'STRING'),
('veronika_theme', 'latest_premium', '0', 'STRING'),
('veronika_theme', 'latest_random', '1', 'STRING'),
('veronika_theme', 'logo_text', 'mySite.com', 'STRING'),
('veronika_theme', 'phone', '+1 (800) 228-5651', 'STRING'),
('veronika_theme', 'post_extra_exclude', '', 'STRING'),
('veronika_theme', 'post_required', 'location,name,phone', 'STRING'),
('veronika_theme', 'premium_home', '1', 'STRING'),
('veronika_theme', 'premium_home_count', '5', 'STRING'),
('veronika_theme', 'premium_search_gallery', '0', 'STRING'),
('veronika_theme', 'premium_search_gallery_count', '5', 'STRING'),
('veronika_theme', 'premium_search_list', '0', 'STRING'),
('veronika_theme', 'premium_search_list_count', '5', 'STRING'),
('veronika_theme', 'publish_category', '2', 'STRING'),
('veronika_theme', 'search_ajax', '1', 'STRING'),
('veronika_theme', 'search_box_home', '1', 'STRING'),
('veronika_theme', 'search_cookies', '0', 'STRING'),
('veronika_theme', 'site_info', 'Widely known as Worlds no. 1 online classifieds platform, our is all about you. Our aim is to empower every person in the country to independently connect with buyers and sellers online. We care about you ďż˝ and the transactions that bring you closer to your dreams. Want to buy your first car? We are here for you. Want to sell commercial property to buy your dream home? We are here for you. Whatever job you have got, we promise to get it done.', 'STRING'),
('veronika_theme', 'stick_item', '1', 'STRING'),
('veronika_theme', 'stick_search', '1', 'STRING'),
('veronika_theme', 'theme_adsense', '1', 'STRING'),
('veronika_theme', 'version', '1.1.5', 'STRING'),
('veronika_theme', 'website_name', '', 'STRING'),
('yandex_maps_pro', 'api_key', '501a7ec4-5c93-447b-bb3a-7ddaaa1aa90f', 'STRING'),
('yandex_maps_pro', 'version', '100', 'INTEGER');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_profile_picture`
--

CREATE TABLE `oc_t_profile_picture` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) DEFAULT NULL,
  `pic_ext` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_t_profile_picture`
--

INSERT INTO `oc_t_profile_picture` (`id`, `user_id`, `pic_ext`) VALUES
(1, 1, '.png'),
(2, 11, '.jpg'),
(3, 17, '.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_region`
--

CREATE TABLE `oc_t_region` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `fk_c_country_code` char(2) NOT NULL,
  `s_name` varchar(60) NOT NULL,
  `s_slug` varchar(60) NOT NULL DEFAULT '',
  `b_active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_t_region`
--

INSERT INTO `oc_t_region` (`pk_i_id`, `fk_c_country_code`, `s_name`, `s_slug`, `b_active`) VALUES
(1, 'RU', 'Адыгея', '%d0%90%d0%b4%d1%8b%d0%b3%d0%b5%d1%8f', 1),
(2, 'RU', 'Алтай', '%d0%90%d0%bb%d1%82%d0%b0%d0%b9', 1),
(3, 'RU', 'Алтайский край', '%d0%90%d0%bb%d1%82%d0%b0%d0%b9%d1%81%d0%ba%d0%b8%d0%b9-%d0%b', 1),
(4, 'RU', 'Амурская область', '%d0%90%d0%bc%d1%83%d1%80%d1%81%d0%ba%d0%b0%d1%8f-%d0%be%d0%b', 1),
(5, 'RU', 'Архангельская область', '%d0%90%d1%80%d1%85%d0%b0%d0%bd%d0%b3%d0%b5%d0%bb%d1%8c%d1%81', 1),
(6, 'RU', 'Астраханская область', '%d0%90%d1%81%d1%82%d1%80%d0%b0%d1%85%d0%b0%d0%bd%d1%81%d0%ba', 1),
(7, 'RU', 'Башкортостан', '%d0%91%d0%b0%d1%88%d0%ba%d0%be%d1%80%d1%82%d0%be%d1%81%d1%82', 1),
(8, 'RU', 'Белгородская область', '%d0%91%d0%b5%d0%bb%d0%b3%d0%be%d1%80%d0%be%d0%b4%d1%81%d0%ba', 1),
(9, 'RU', 'Брянская область', '%d0%91%d1%80%d1%8f%d0%bd%d1%81%d0%ba%d0%b0%d1%8f-%d0%be%d0%b', 1),
(10, 'RU', 'Бурятия', '%d0%91%d1%83%d1%80%d1%8f%d1%82%d0%b8%d1%8f', 1),
(11, 'RU', 'Владимирская область', '%d0%92%d0%bb%d0%b0%d0%b4%d0%b8%d0%bc%d0%b8%d1%80%d1%81%d0%ba', 1),
(12, 'RU', 'Волгоградская область', '%d0%92%d0%be%d0%bb%d0%b3%d0%be%d0%b3%d1%80%d0%b0%d0%b4%d1%81', 1),
(13, 'RU', 'Воронежская область', '%d0%92%d0%be%d1%80%d0%be%d0%bd%d0%b5%d0%b6%d1%81%d0%ba%d0%b0', 1),
(14, 'RU', 'Дагестан', '%d0%94%d0%b0%d0%b3%d0%b5%d1%81%d1%82%d0%b0%d0%bd', 1),
(15, 'RU', 'Еврейская АО', '%d0%95%d0%b2%d1%80%d0%b5%d0%b9%d1%81%d0%ba%d0%b0%d1%8f-%d0%9', 1),
(16, 'RU', 'Забайкальский край', '%d0%97%d0%b0%d0%b1%d0%b0%d0%b9%d0%ba%d0%b0%d0%bb%d1%8c%d1%81', 1),
(17, 'RU', 'Ивановская область', '%d0%98%d0%b2%d0%b0%d0%bd%d0%be%d0%b2%d1%81%d0%ba%d0%b0%d1%8f', 1),
(18, 'RU', 'Ингушетия', '%d0%98%d0%bd%d0%b3%d1%83%d1%88%d0%b5%d1%82%d0%b8%d1%8f', 1),
(19, 'RU', 'Иркутская область', '%d0%98%d1%80%d0%ba%d1%83%d1%82%d1%81%d0%ba%d0%b0%d1%8f-%d0%b', 1),
(20, 'RU', 'Кабардино-Балкария', '%d0%9a%d0%b0%d0%b1%d0%b0%d1%80%d0%b4%d0%b8%d0%bd%d0%be-%d0%9', 1),
(21, 'RU', 'Калининградская область', '%d0%9a%d0%b0%d0%bb%d0%b8%d0%bd%d0%b8%d0%bd%d0%b3%d1%80%d0%b0', 1),
(22, 'RU', 'Калмыкия', '%d0%9a%d0%b0%d0%bb%d0%bc%d1%8b%d0%ba%d0%b8%d1%8f', 1),
(23, 'RU', 'Калужская область', '%d0%9a%d0%b0%d0%bb%d1%83%d0%b6%d1%81%d0%ba%d0%b0%d1%8f-%d0%b', 1),
(24, 'RU', 'Камчатский край', '%d0%9a%d0%b0%d0%bc%d1%87%d0%b0%d1%82%d1%81%d0%ba%d0%b8%d0%b9', 1),
(25, 'RU', 'Карачаево-Черкесия', '%d0%9a%d0%b0%d1%80%d0%b0%d1%87%d0%b0%d0%b5%d0%b2%d0%be-%d0%a', 1),
(26, 'RU', 'Карелия', '%d0%9a%d0%b0%d1%80%d0%b5%d0%bb%d0%b8%d1%8f', 1),
(27, 'RU', 'Кемеровская область', '%d0%9a%d0%b5%d0%bc%d0%b5%d1%80%d0%be%d0%b2%d1%81%d0%ba%d0%b0', 1),
(28, 'RU', 'Кировская область', '%d0%9a%d0%b8%d1%80%d0%be%d0%b2%d1%81%d0%ba%d0%b0%d1%8f-%d0%b', 1),
(29, 'RU', 'Коми', '%d0%9a%d0%be%d0%bc%d0%b8', 1),
(30, 'RU', 'Костромская область', '%d0%9a%d0%be%d1%81%d1%82%d1%80%d0%be%d0%bc%d1%81%d0%ba%d0%b0', 1),
(31, 'RU', 'Краснодарский край', '%d0%9a%d1%80%d0%b0%d1%81%d0%bd%d0%be%d0%b4%d0%b0%d1%80%d1%81', 1),
(32, 'RU', 'Красноярский край', '%d0%9a%d1%80%d0%b0%d1%81%d0%bd%d0%be%d1%8f%d1%80%d1%81%d0%ba', 1),
(33, 'RU', 'Крым', '%d0%9a%d1%80%d1%8b%d0%bc', 1),
(34, 'RU', 'Курганская область', '%d0%9a%d1%83%d1%80%d0%b3%d0%b0%d0%bd%d1%81%d0%ba%d0%b0%d1%8f', 1),
(35, 'RU', 'Курская область', '%d0%9a%d1%83%d1%80%d1%81%d0%ba%d0%b0%d1%8f-%d0%be%d0%b1%d0%b', 1),
(36, 'RU', 'Ленинградская область', '%d0%9b%d0%b5%d0%bd%d0%b8%d0%bd%d0%b3%d1%80%d0%b0%d0%b4%d1%81', 1),
(37, 'RU', 'Липецкая область', '%d0%9b%d0%b8%d0%bf%d0%b5%d1%86%d0%ba%d0%b0%d1%8f-%d0%be%d0%b', 1),
(38, 'RU', 'Магаданская область', '%d0%9c%d0%b0%d0%b3%d0%b0%d0%b4%d0%b0%d0%bd%d1%81%d0%ba%d0%b0', 1),
(39, 'RU', 'Марий Эл', '%d0%9c%d0%b0%d1%80%d0%b8%d0%b9-%d0%ad%d0%bb', 1),
(40, 'RU', 'Мордовия', '%d0%9c%d0%be%d1%80%d0%b4%d0%be%d0%b2%d0%b8%d1%8f', 1),
(41, 'RU', 'Москва', '%d0%9c%d0%be%d1%81%d0%ba%d0%b2%d0%b0', 1),
(42, 'RU', 'Московская область', '%d0%9c%d0%be%d1%81%d0%ba%d0%be%d0%b2%d1%81%d0%ba%d0%b0%d1%8f', 1),
(43, 'RU', 'Мурманская область', '%d0%9c%d1%83%d1%80%d0%bc%d0%b0%d0%bd%d1%81%d0%ba%d0%b0%d1%8f', 1),
(44, 'RU', 'Ненецкий Авт. Окр.', '%d0%9d%d0%b5%d0%bd%d0%b5%d1%86%d0%ba%d0%b8%d0%b9-%d0%90%d0%b', 1),
(45, 'RU', 'Нижегородская область', '%d0%9d%d0%b8%d0%b6%d0%b5%d0%b3%d0%be%d1%80%d0%be%d0%b4%d1%81', 1),
(46, 'RU', 'Новгородская область', '%d0%9d%d0%be%d0%b2%d0%b3%d0%be%d1%80%d0%be%d0%b4%d1%81%d0%ba', 1),
(47, 'RU', 'Новосибирская область', '%d0%9d%d0%be%d0%b2%d0%be%d1%81%d0%b8%d0%b1%d0%b8%d1%80%d1%81', 1),
(48, 'RU', 'Омская область', '%d0%9e%d0%bc%d1%81%d0%ba%d0%b0%d1%8f-%d0%be%d0%b1%d0%bb%d0%b', 1),
(49, 'RU', 'Оренбургская область', '%d0%9e%d1%80%d0%b5%d0%bd%d0%b1%d1%83%d1%80%d0%b3%d1%81%d0%ba', 1),
(50, 'RU', 'Орловская область', '%d0%9e%d1%80%d0%bb%d0%be%d0%b2%d1%81%d0%ba%d0%b0%d1%8f-%d0%b', 1),
(51, 'RU', 'Пензенская область', '%d0%9f%d0%b5%d0%bd%d0%b7%d0%b5%d0%bd%d1%81%d0%ba%d0%b0%d1%8f', 1),
(52, 'RU', 'Пермский край', '%d0%9f%d0%b5%d1%80%d0%bc%d1%81%d0%ba%d0%b8%d0%b9-%d0%ba%d1%8', 1),
(53, 'RU', 'Приморский край', '%d0%9f%d1%80%d0%b8%d0%bc%d0%be%d1%80%d1%81%d0%ba%d0%b8%d0%b9', 1),
(54, 'RU', 'Псковская область', '%d0%9f%d1%81%d0%ba%d0%be%d0%b2%d1%81%d0%ba%d0%b0%d1%8f-%d0%b', 1),
(55, 'RU', 'Ростовская область', '%d0%a0%d0%be%d1%81%d1%82%d0%be%d0%b2%d1%81%d0%ba%d0%b0%d1%8f', 1),
(56, 'RU', 'Рязанская область', '%d0%a0%d1%8f%d0%b7%d0%b0%d0%bd%d1%81%d0%ba%d0%b0%d1%8f-%d0%b', 1),
(57, 'RU', 'Самарская область', '%d0%a1%d0%b0%d0%bc%d0%b0%d1%80%d1%81%d0%ba%d0%b0%d1%8f-%d0%b', 1),
(58, 'RU', 'Санкт-Петербург', '%d0%a1%d0%b0%d0%bd%d0%ba%d1%82-%d0%9f%d0%b5%d1%82%d0%b5%d1%8', 1),
(59, 'RU', 'Саратовская область', '%d0%a1%d0%b0%d1%80%d0%b0%d1%82%d0%be%d0%b2%d1%81%d0%ba%d0%b0', 1),
(60, 'RU', 'Сахалинская область', '%d0%a1%d0%b0%d1%85%d0%b0%d0%bb%d0%b8%d0%bd%d1%81%d0%ba%d0%b0', 1),
(61, 'RU', 'Свердловская область', '%d0%a1%d0%b2%d0%b5%d1%80%d0%b4%d0%bb%d0%be%d0%b2%d1%81%d0%ba', 1),
(62, 'RU', 'Севастополь', '%d0%a1%d0%b5%d0%b2%d0%b0%d1%81%d1%82%d0%be%d0%bf%d0%be%d0%bb', 1),
(63, 'RU', 'Северная Осетия - Алания', '%d0%a1%d0%b5%d0%b2%d0%b5%d1%80%d0%bd%d0%b0%d1%8f-%d0%9e%d1%8', 1),
(64, 'RU', 'Смоленская область', '%d0%a1%d0%bc%d0%be%d0%bb%d0%b5%d0%bd%d1%81%d0%ba%d0%b0%d1%8f', 1),
(65, 'RU', 'Ставропольский край', '%d0%a1%d1%82%d0%b0%d0%b2%d1%80%d0%be%d0%bf%d0%be%d0%bb%d1%8c', 1),
(66, 'RU', 'Тамбовская область', '%d0%a2%d0%b0%d0%bc%d0%b1%d0%be%d0%b2%d1%81%d0%ba%d0%b0%d1%8f', 1),
(67, 'RU', 'Татарстан', '%d0%a2%d0%b0%d1%82%d0%b0%d1%80%d1%81%d1%82%d0%b0%d0%bd', 1),
(68, 'RU', 'Тверская область', '%d0%a2%d0%b2%d0%b5%d1%80%d1%81%d0%ba%d0%b0%d1%8f-%d0%be%d0%b', 1),
(69, 'RU', 'Томская область', '%d0%a2%d0%be%d0%bc%d1%81%d0%ba%d0%b0%d1%8f-%d0%be%d0%b1%d0%b', 1),
(70, 'RU', 'Тульская область', '%d0%a2%d1%83%d0%bb%d1%8c%d1%81%d0%ba%d0%b0%d1%8f-%d0%be%d0%b', 1),
(71, 'RU', 'Тыва', '%d0%a2%d1%8b%d0%b2%d0%b0', 1),
(72, 'RU', 'Тюменская область', '%d0%a2%d1%8e%d0%bc%d0%b5%d0%bd%d1%81%d0%ba%d0%b0%d1%8f-%d0%b', 1),
(73, 'RU', 'Удмуртия', '%d0%a3%d0%b4%d0%bc%d1%83%d1%80%d1%82%d0%b8%d1%8f', 1),
(74, 'RU', 'Ульяновская область', '%d0%a3%d0%bb%d1%8c%d1%8f%d0%bd%d0%be%d0%b2%d1%81%d0%ba%d0%b0', 1),
(75, 'RU', 'Хабаровский край', '%d0%a5%d0%b0%d0%b1%d0%b0%d1%80%d0%be%d0%b2%d1%81%d0%ba%d0%b8', 1),
(76, 'RU', 'Хакасия', '%d0%a5%d0%b0%d0%ba%d0%b0%d1%81%d0%b8%d1%8f', 1),
(77, 'RU', 'Ханты-Мансийский авт. окр.', '%d0%a5%d0%b0%d0%bd%d1%82%d1%8b-%d0%9c%d0%b0%d0%bd%d1%81%d0%b', 1),
(78, 'RU', 'Челябинская область', '%d0%a7%d0%b5%d0%bb%d1%8f%d0%b1%d0%b8%d0%bd%d1%81%d0%ba%d0%b0', 1),
(79, 'RU', 'Чечня', '%d0%a7%d0%b5%d1%87%d0%bd%d1%8f', 1),
(80, 'RU', 'Чувашия', '%d0%a7%d1%83%d0%b2%d0%b0%d1%88%d0%b8%d1%8f', 1),
(81, 'RU', 'Чукотский авт. окр.', '%d0%a7%d1%83%d0%ba%d0%be%d1%82%d1%81%d0%ba%d0%b8%d0%b9-%d0%b', 1),
(82, 'RU', 'Якутия', '%d0%af%d0%ba%d1%83%d1%82%d0%b8%d1%8f', 1),
(83, 'RU', 'Ямало-Ненецкий авт. окр.', '%d0%af%d0%bc%d0%b0%d0%bb%d0%be-%d0%9d%d0%b5%d0%bd%d0%b5%d1%8', 1),
(84, 'RU', 'Ярославская область', '%d0%af%d1%80%d0%be%d1%81%d0%bb%d0%b0%d0%b2%d1%81%d0%ba%d0%b0', 1),
(85, 'RU', 'Вологодская область', '%d0%92%d0%be%d0%bb%d0%be%d0%b3%d0%be%d0%b4%d1%81%d0%ba%d0%b0', 1),
(86, 'UA', 'Киев ', '%d0%9a%d0%b8%d0%b5%d0%b2', 1),
(87, 'UA', 'Винницкая область ', '%d0%92%d0%b8%d0%bd%d0%bd%d0%b8%d1%86%d0%ba%d0%b0%d1%8f-%d0%b', 1),
(88, 'UA', 'Волынская область', '%d0%92%d0%be%d0%bb%d1%8b%d0%bd%d1%81%d0%ba%d0%b0%d1%8f-%d0%b', 1),
(89, 'UA', 'Днепропетровская область	', '%d0%94%d0%bd%d0%b5%d0%bf%d1%80%d0%be%d0%bf%d0%b5%d1%82%d1%80', 1),
(90, 'UA', 'Донецкая область	', '%d0%94%d0%be%d0%bd%d0%b5%d1%86%d0%ba%d0%b0%d1%8f-%d0%be%d0%b', 1),
(91, 'UA', 'Житомирская область', '%d0%96%d0%b8%d1%82%d0%be%d0%bc%d0%b8%d1%80%d1%81%d0%ba%d0%b0', 1),
(92, 'UA', 'Закарпатская область', '%d0%97%d0%b0%d0%ba%d0%b0%d1%80%d0%bf%d0%b0%d1%82%d1%81%d0%ba', 1),
(93, 'UA', 'Запорожская область', '%d0%97%d0%b0%d0%bf%d0%be%d1%80%d0%be%d0%b6%d1%81%d0%ba%d0%b0', 1),
(94, 'UA', 'Ивано-Франковская область', '%d0%98%d0%b2%d0%b0%d0%bd%d0%be-%d0%a4%d1%80%d0%b0%d0%bd%d0%b', 1),
(95, 'UA', 'Киевская область	', '%d0%9a%d0%b8%d0%b5%d0%b2%d1%81%d0%ba%d0%b0%d1%8f-%d0%be%d0%b', 1),
(96, 'UA', 'Кировоградская область', '%d0%9a%d0%b8%d1%80%d0%be%d0%b2%d0%be%d0%b3%d1%80%d0%b0%d0%b4', 1),
(97, 'UA', 'Луганская область', '%d0%9b%d1%83%d0%b3%d0%b0%d0%bd%d1%81%d0%ba%d0%b0%d1%8f-%d0%b', 1),
(98, 'UA', 'Львовская область	', '%d0%9b%d1%8c%d0%b2%d0%be%d0%b2%d1%81%d0%ba%d0%b0%d1%8f-%d0%b', 1),
(99, 'UA', 'Николаевская область', '%d0%9d%d0%b8%d0%ba%d0%be%d0%bb%d0%b0%d0%b5%d0%b2%d1%81%d0%ba', 1),
(100, 'UA', 'Одесская область', '%d0%9e%d0%b4%d0%b5%d1%81%d1%81%d0%ba%d0%b0%d1%8f-%d0%be%d0%b', 1),
(101, 'UA', 'Полтавская область', '%d0%9f%d0%be%d0%bb%d1%82%d0%b0%d0%b2%d1%81%d0%ba%d0%b0%d1%8f', 1),
(102, 'UA', 'Ровенская область	', '%d0%a0%d0%be%d0%b2%d0%b5%d0%bd%d1%81%d0%ba%d0%b0%d1%8f-%d0%b', 1),
(103, 'UA', 'Сумская область', '%d0%a1%d1%83%d0%bc%d1%81%d0%ba%d0%b0%d1%8f-%d0%be%d0%b1%d0%b', 1),
(104, 'UA', 'Тернопольская область', '%d0%a2%d0%b5%d1%80%d0%bd%d0%be%d0%bf%d0%be%d0%bb%d1%8c%d1%81', 1),
(105, 'UA', 'Харьковская область', '%d0%a5%d0%b0%d1%80%d1%8c%d0%ba%d0%be%d0%b2%d1%81%d0%ba%d0%b0', 1),
(106, 'UA', 'Херсонская область	', '%d0%a5%d0%b5%d1%80%d1%81%d0%be%d0%bd%d1%81%d0%ba%d0%b0%d1%8f', 1),
(107, 'UA', 'Хмельницкая область', '%d0%a5%d0%bc%d0%b5%d0%bb%d1%8c%d0%bd%d0%b8%d1%86%d0%ba%d0%b0', 1),
(108, 'UA', 'Черкасская область', '%d0%a7%d0%b5%d1%80%d0%ba%d0%b0%d1%81%d1%81%d0%ba%d0%b0%d1%8f', 1),
(109, 'UA', 'Черниговская область', '%d0%a7%d0%b5%d1%80%d0%bd%d0%b8%d0%b3%d0%be%d0%b2%d1%81%d0%ba', 1),
(110, 'UA', 'Черновицкая область', '%d0%a7%d0%b5%d1%80%d0%bd%d0%be%d0%b2%d0%b8%d1%86%d0%ba%d0%b0', 1),
(112, 'KZ', 'Акмолинская область', '%d0%90%d0%ba%d0%bc%d0%be%d0%bb%d0%b8%d0%bd%d1%81%d0%ba%d0%b0', 1),
(113, 'KZ', 'Актюбинская область', '%d0%90%d0%ba%d1%82%d1%8e%d0%b1%d0%b8%d0%bd%d1%81%d0%ba%d0%b0', 1),
(114, 'KZ', 'Алматинская область', '%d0%90%d0%bb%d0%bc%d0%b0%d1%82%d0%b8%d0%bd%d1%81%d0%ba%d0%b0', 1),
(115, 'KZ', 'Алматы', '%d0%90%d0%bb%d0%bc%d0%b0%d1%82%d1%8b', 1),
(116, 'KZ', 'Астана', '%d0%90%d1%81%d1%82%d0%b0%d0%bd%d0%b0', 1),
(117, 'KZ', 'Атырауская область', '%d0%90%d1%82%d1%8b%d1%80%d0%b0%d1%83%d1%81%d0%ba%d0%b0%d1%8f', 1),
(118, 'KZ', 'Восточно-Казахстанская область', '%d0%92%d0%be%d1%81%d1%82%d0%be%d1%87%d0%bd%d0%be-%d0%9a%d0%b', 1),
(119, 'KZ', 'Жамбылская область', '%d0%96%d0%b0%d0%bc%d0%b1%d1%8b%d0%bb%d1%81%d0%ba%d0%b0%d1%8f', 1),
(120, 'KZ', 'Западно-Казахстанская область', '%d0%97%d0%b0%d0%bf%d0%b0%d0%b4%d0%bd%d0%be-%d0%9a%d0%b0%d0%b', 1),
(121, 'KZ', 'Карагандинская область', '%d0%9a%d0%b0%d1%80%d0%b0%d0%b3%d0%b0%d0%bd%d0%b4%d0%b8%d0%bd', 1),
(122, 'KZ', 'Костанайская область', '%d0%9a%d0%be%d1%81%d1%82%d0%b0%d0%bd%d0%b0%d0%b9%d1%81%d0%ba', 1),
(123, 'KZ', 'Кызылординская область', '%d0%9a%d1%8b%d0%b7%d1%8b%d0%bb%d0%be%d1%80%d0%b4%d0%b8%d0%bd', 1),
(124, 'KZ', 'Мангистауская область', '%d0%9c%d0%b0%d0%bd%d0%b3%d0%b8%d1%81%d1%82%d0%b0%d1%83%d1%81', 1),
(125, 'KZ', 'Павлодарская область', '%d0%9f%d0%b0%d0%b2%d0%bb%d0%be%d0%b4%d0%b0%d1%80%d1%81%d0%ba', 1),
(126, 'KZ', 'Северо-Казахстанская область', '%d0%a1%d0%b5%d0%b2%d0%b5%d1%80%d0%be-%d0%9a%d0%b0%d0%b7%d0%b', 1),
(127, 'KZ', 'Южно-Казахстанская область', '%d0%ae%d0%b6%d0%bd%d0%be-%d0%9a%d0%b0%d0%b7%d0%b0%d1%85%d1%8', 1),
(128, 'BY', 'Минская область', '%d0%9c%d0%b8%d0%bd%d1%81%d0%ba%d0%b0%d1%8f-%d0%be%d0%b1%d0%b', 1),
(129, 'BY', 'Витебская область', '%d0%92%d0%b8%d1%82%d0%b5%d0%b1%d1%81%d0%ba%d0%b0%d1%8f-%d0%b', 1),
(130, 'BY', 'Гомельская область', '%d0%93%d0%be%d0%bc%d0%b5%d0%bb%d1%8c%d1%81%d0%ba%d0%b0%d1%8f', 1),
(131, 'BY', 'Брестская область', '%d0%91%d1%80%d0%b5%d1%81%d1%82%d1%81%d0%ba%d0%b0%d1%8f-%d0%b', 1),
(132, 'BY', 'Гродненская область', '%d0%93%d1%80%d0%be%d0%b4%d0%bd%d0%b5%d0%bd%d1%81%d0%ba%d0%b0', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_region_seo`
--

CREATE TABLE `oc_t_region_seo` (
  `seo_region_id` int(10) UNSIGNED NOT NULL,
  `seo_title` varchar(800) DEFAULT NULL,
  `seo_description` varchar(1200) DEFAULT NULL,
  `seo_keywords` varchar(800) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_region_stats`
--

CREATE TABLE `oc_t_region_stats` (
  `fk_i_region_id` int(10) UNSIGNED NOT NULL,
  `i_num_items` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_t_region_stats`
--

INSERT INTO `oc_t_region_stats` (`fk_i_region_id`, `i_num_items`) VALUES
(4, 0),
(33, 0),
(1, 1),
(5, 1),
(6, 1),
(8, 1),
(9, 1),
(12, 1),
(18, 1),
(30, 1),
(34, 1),
(43, 1),
(51, 1),
(55, 1),
(61, 1),
(67, 1),
(75, 1),
(78, 1),
(86, 1),
(90, 1),
(98, 1),
(127, 1),
(2, 2),
(3, 2),
(41, 7);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_rslides`
--

CREATE TABLE `oc_t_rslides` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniqname` varchar(100) NOT NULL,
  `imagename` varchar(100) NOT NULL,
  `caption` varchar(200) NOT NULL,
  `description` varchar(600) NOT NULL,
  `link` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_t_rslides`
--

INSERT INTO `oc_t_rslides` (`id`, `uniqname`, `imagename`, `caption`, `description`, `link`) VALUES
(1, '5abfc1dff1eb1.jpg', '54ddab32e5b1f.jpg', '', '', ''),
(2, '5abfc1ebe713f.jpg', '54ddab759a1c4.jpg', '', '', ''),
(3, '5abfc1f8e4642.jpg', '549976b0892c7.jpg', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_slider`
--

CREATE TABLE `oc_t_slider` (
  `id` int(10) UNSIGNED NOT NULL,
  `uniqname` varchar(100) NOT NULL,
  `imagename` varchar(100) NOT NULL,
  `caption` varchar(300) NOT NULL,
  `link` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `oc_t_slider`
--

INSERT INTO `oc_t_slider` (`id`, `uniqname`, `imagename`, `caption`, `link`) VALUES
(1, '5ad1b258cba45.jpg', '54ddaae9282e2.jpg', 'Первый слайд (любой Ваш текст)', ''),
(2, '5ad1b2768fcef.jpg', '5863acbfbc92f.jpg', 'Второй слайд (любой Ваш текст)', ''),
(3, '5ad1b27daf1af.jpg', '5863acdd6edfa.jpg', '3-й слайд (любой Ваш текст)', '');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_user`
--

CREATE TABLE `oc_t_user` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `dt_reg_date` datetime NOT NULL,
  `dt_mod_date` datetime DEFAULT NULL,
  `s_name` varchar(100) NOT NULL,
  `s_username` varchar(100) NOT NULL,
  `s_password` char(60) NOT NULL,
  `s_secret` varchar(40) DEFAULT NULL,
  `s_email` varchar(100) NOT NULL,
  `s_website` varchar(100) DEFAULT NULL,
  `s_phone_land` varchar(45) DEFAULT NULL,
  `s_phone_mobile` varchar(45) DEFAULT NULL,
  `b_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `b_active` tinyint(1) NOT NULL DEFAULT '0',
  `s_pass_code` varchar(100) DEFAULT NULL,
  `s_pass_date` datetime DEFAULT NULL,
  `s_pass_ip` varchar(15) DEFAULT NULL,
  `fk_c_country_code` char(2) DEFAULT NULL,
  `s_country` varchar(40) DEFAULT NULL,
  `s_address` varchar(100) DEFAULT NULL,
  `s_zip` varchar(15) DEFAULT NULL,
  `fk_i_region_id` int(10) UNSIGNED DEFAULT NULL,
  `s_region` varchar(100) DEFAULT NULL,
  `fk_i_city_id` int(10) UNSIGNED DEFAULT NULL,
  `s_city` varchar(100) DEFAULT NULL,
  `fk_i_city_area_id` int(10) UNSIGNED DEFAULT NULL,
  `s_city_area` varchar(200) DEFAULT NULL,
  `d_coord_lat` decimal(10,6) DEFAULT NULL,
  `d_coord_long` decimal(10,6) DEFAULT NULL,
  `b_company` tinyint(1) NOT NULL DEFAULT '0',
  `i_items` int(10) UNSIGNED DEFAULT '0',
  `i_comments` int(10) UNSIGNED DEFAULT '0',
  `dt_access_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `s_access_ip` varchar(15) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_user_description`
--

CREATE TABLE `oc_t_user_description` (
  `fk_i_user_id` int(10) UNSIGNED NOT NULL,
  `fk_c_locale_code` char(5) NOT NULL,
  `s_info` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_user_email_tmp`
--

CREATE TABLE `oc_t_user_email_tmp` (
  `fk_i_user_id` int(10) UNSIGNED NOT NULL,
  `s_new_email` varchar(100) NOT NULL,
  `dt_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_t_widget`
--

CREATE TABLE `oc_t_widget` (
  `pk_i_id` int(10) UNSIGNED NOT NULL,
  `s_description` varchar(40) NOT NULL,
  `s_location` varchar(40) NOT NULL,
  `e_kind` enum('TEXT','HTML') NOT NULL,
  `s_content` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `oc_t_admin`
--
ALTER TABLE `oc_t_admin`
  ADD PRIMARY KEY (`pk_i_id`),
  ADD UNIQUE KEY `s_username` (`s_username`),
  ADD UNIQUE KEY `s_email` (`s_email`);

--
-- Индексы таблицы `oc_t_alerts`
--
ALTER TABLE `oc_t_alerts`
  ADD PRIMARY KEY (`pk_i_id`);

--
-- Индексы таблицы `oc_t_alerts_sent`
--
ALTER TABLE `oc_t_alerts_sent`
  ADD PRIMARY KEY (`d_date`);

--
-- Индексы таблицы `oc_t_attribute`
--
ALTER TABLE `oc_t_attribute`
  ADD PRIMARY KEY (`pk_i_id`);

--
-- Индексы таблицы `oc_t_attribute_locale`
--
ALTER TABLE `oc_t_attribute_locale`
  ADD PRIMARY KEY (`pk_i_id`),
  ADD KEY `fk_i_attribute_id` (`fk_i_attribute_id`);

--
-- Индексы таблицы `oc_t_attribute_value`
--
ALTER TABLE `oc_t_attribute_value`
  ADD PRIMARY KEY (`pk_i_id`),
  ADD KEY `fk_i_attribute_id` (`fk_i_attribute_id`);

--
-- Индексы таблицы `oc_t_attribute_value_locale`
--
ALTER TABLE `oc_t_attribute_value_locale`
  ADD PRIMARY KEY (`pk_i_id`),
  ADD KEY `fk_i_attribute_value_id` (`fk_i_attribute_value_id`);

--
-- Индексы таблицы `oc_t_ban_rule`
--
ALTER TABLE `oc_t_ban_rule`
  ADD PRIMARY KEY (`pk_i_id`);

--
-- Индексы таблицы `oc_t_categories_seo`
--
ALTER TABLE `oc_t_categories_seo`
  ADD PRIMARY KEY (`seo_category_id`);

--
-- Индексы таблицы `oc_t_category`
--
ALTER TABLE `oc_t_category`
  ADD PRIMARY KEY (`pk_i_id`),
  ADD KEY `fk_i_parent_id` (`fk_i_parent_id`),
  ADD KEY `i_position` (`i_position`);

--
-- Индексы таблицы `oc_t_category_description`
--
ALTER TABLE `oc_t_category_description`
  ADD PRIMARY KEY (`fk_i_category_id`,`fk_c_locale_code`),
  ADD KEY `idx_s_slug` (`s_slug`),
  ADD KEY `fk_c_locale_code` (`fk_c_locale_code`);

--
-- Индексы таблицы `oc_t_category_stats`
--
ALTER TABLE `oc_t_category_stats`
  ADD PRIMARY KEY (`fk_i_category_id`);

--
-- Индексы таблицы `oc_t_category_veronika`
--
ALTER TABLE `oc_t_category_veronika`
  ADD PRIMARY KEY (`fk_i_category_id`),
  ADD UNIQUE KEY `fk_i_category_id` (`fk_i_category_id`);

--
-- Индексы таблицы `oc_t_city`
--
ALTER TABLE `oc_t_city`
  ADD PRIMARY KEY (`pk_i_id`),
  ADD KEY `fk_i_region_id` (`fk_i_region_id`),
  ADD KEY `idx_s_name` (`s_name`),
  ADD KEY `idx_s_slug` (`s_slug`),
  ADD KEY `fk_c_country_code` (`fk_c_country_code`);

--
-- Индексы таблицы `oc_t_city_area`
--
ALTER TABLE `oc_t_city_area`
  ADD PRIMARY KEY (`pk_i_id`),
  ADD KEY `fk_i_city_id` (`fk_i_city_id`),
  ADD KEY `idx_s_name` (`s_name`);

--
-- Индексы таблицы `oc_t_city_seo`
--
ALTER TABLE `oc_t_city_seo`
  ADD PRIMARY KEY (`seo_city_id`);

--
-- Индексы таблицы `oc_t_city_stats`
--
ALTER TABLE `oc_t_city_stats`
  ADD PRIMARY KEY (`fk_i_city_id`),
  ADD KEY `idx_num_items` (`i_num_items`);

--
-- Индексы таблицы `oc_t_country`
--
ALTER TABLE `oc_t_country`
  ADD PRIMARY KEY (`pk_c_code`),
  ADD KEY `idx_s_slug` (`s_slug`),
  ADD KEY `idx_s_name` (`s_name`);

--
-- Индексы таблицы `oc_t_country_stats`
--
ALTER TABLE `oc_t_country_stats`
  ADD PRIMARY KEY (`fk_c_country_code`),
  ADD KEY `idx_num_items` (`i_num_items`);

--
-- Индексы таблицы `oc_t_currency`
--
ALTER TABLE `oc_t_currency`
  ADD PRIMARY KEY (`pk_c_code`),
  ADD UNIQUE KEY `s_name` (`s_name`);

--
-- Индексы таблицы `oc_t_home_seo`
--
ALTER TABLE `oc_t_home_seo`
  ADD PRIMARY KEY (`seo_home_id`);

--
-- Индексы таблицы `oc_t_im_block`
--
ALTER TABLE `oc_t_im_block`
  ADD PRIMARY KEY (`pk_i_id`);

--
-- Индексы таблицы `oc_t_im_messages`
--
ALTER TABLE `oc_t_im_messages`
  ADD PRIMARY KEY (`pk_i_id`);

--
-- Индексы таблицы `oc_t_im_threads`
--
ALTER TABLE `oc_t_im_threads`
  ADD PRIMARY KEY (`i_thread_id`);

--
-- Индексы таблицы `oc_t_item`
--
ALTER TABLE `oc_t_item`
  ADD PRIMARY KEY (`pk_i_id`),
  ADD KEY `fk_i_user_id` (`fk_i_user_id`),
  ADD KEY `idx_b_premium` (`b_premium`),
  ADD KEY `idx_s_contact_email` (`s_contact_email`(10)),
  ADD KEY `fk_i_category_id` (`fk_i_category_id`),
  ADD KEY `fk_c_currency_code` (`fk_c_currency_code`),
  ADD KEY `idx_pub_date` (`dt_pub_date`),
  ADD KEY `idx_price` (`i_price`);

--
-- Индексы таблицы `oc_t_item_attribute`
--
ALTER TABLE `oc_t_item_attribute`
  ADD PRIMARY KEY (`pk_i_id`),
  ADD KEY `fk_i_item_id` (`fk_i_item_id`),
  ADD KEY `fk_i_attribute_id` (`fk_i_attribute_id`);

--
-- Индексы таблицы `oc_t_item_car_attr`
--
ALTER TABLE `oc_t_item_car_attr`
  ADD PRIMARY KEY (`fk_i_item_id`),
  ADD KEY `fk_i_item_id` (`fk_i_item_id`),
  ADD KEY `fk_i_make_id` (`fk_i_make_id`),
  ADD KEY `fk_i_model_id` (`fk_i_model_id`);

--
-- Индексы таблицы `oc_t_item_car_make_attr`
--
ALTER TABLE `oc_t_item_car_make_attr`
  ADD PRIMARY KEY (`pk_i_id`);

--
-- Индексы таблицы `oc_t_item_car_model_attr`
--
ALTER TABLE `oc_t_item_car_model_attr`
  ADD PRIMARY KEY (`pk_i_id`),
  ADD KEY `fk_i_make_id` (`fk_i_make_id`);

--
-- Индексы таблицы `oc_t_item_car_vehicle_type_attr`
--
ALTER TABLE `oc_t_item_car_vehicle_type_attr`
  ADD PRIMARY KEY (`pk_i_id`,`fk_c_locale_code`),
  ADD KEY `fk_c_locale_code` (`fk_c_locale_code`);

--
-- Индексы таблицы `oc_t_item_comment`
--
ALTER TABLE `oc_t_item_comment`
  ADD PRIMARY KEY (`pk_i_id`),
  ADD KEY `fk_i_item_id` (`fk_i_item_id`),
  ADD KEY `fk_i_user_id` (`fk_i_user_id`);

--
-- Индексы таблицы `oc_t_item_deleted_expired_ads`
--
ALTER TABLE `oc_t_item_deleted_expired_ads`
  ADD PRIMARY KEY (`fk_i_item_id`);

--
-- Индексы таблицы `oc_t_item_description`
--
ALTER TABLE `oc_t_item_description`
  ADD PRIMARY KEY (`fk_i_item_id`,`fk_c_locale_code`);
ALTER TABLE `oc_t_item_description` ADD FULLTEXT KEY `s_description` (`s_description`,`s_title`);

--
-- Индексы таблицы `oc_t_item_favorite_ads`
--
ALTER TABLE `oc_t_item_favorite_ads`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `oc_t_item_location`
--
ALTER TABLE `oc_t_item_location`
  ADD PRIMARY KEY (`fk_i_item_id`),
  ADD KEY `fk_c_country_code` (`fk_c_country_code`),
  ADD KEY `fk_i_region_id` (`fk_i_region_id`),
  ADD KEY `fk_i_city_id` (`fk_i_city_id`),
  ADD KEY `fk_i_city_area_id` (`fk_i_city_area_id`);

--
-- Индексы таблицы `oc_t_item_meta`
--
ALTER TABLE `oc_t_item_meta`
  ADD PRIMARY KEY (`fk_i_item_id`,`fk_i_field_id`,`s_multi`),
  ADD KEY `s_value` (`s_value`(255)),
  ADD KEY `fk_i_field_id` (`fk_i_field_id`);

--
-- Индексы таблицы `oc_t_item_renew_ads`
--
ALTER TABLE `oc_t_item_renew_ads`
  ADD PRIMARY KEY (`fk_i_item_id`);

--
-- Индексы таблицы `oc_t_item_resource`
--
ALTER TABLE `oc_t_item_resource`
  ADD PRIMARY KEY (`pk_i_id`),
  ADD KEY `fk_i_item_id` (`fk_i_item_id`),
  ADD KEY `idx_s_content_type` (`pk_i_id`,`s_content_type`(10));

--
-- Индексы таблицы `oc_t_item_seo`
--
ALTER TABLE `oc_t_item_seo`
  ADD PRIMARY KEY (`seo_item_id`);

--
-- Индексы таблицы `oc_t_item_stats`
--
ALTER TABLE `oc_t_item_stats`
  ADD PRIMARY KEY (`fk_i_item_id`,`dt_date`),
  ADD KEY `dt_date` (`dt_date`,`fk_i_item_id`),
  ADD KEY `dt_date_fk_i_item_id` (`dt_date`,`fk_i_item_id`);

--
-- Индексы таблицы `oc_t_item_stats_veronika`
--
ALTER TABLE `oc_t_item_stats_veronika`
  ADD PRIMARY KEY (`fk_i_item_id`,`dt_date`),
  ADD UNIQUE KEY `fk_i_item_id` (`fk_i_item_id`);

--
-- Индексы таблицы `oc_t_item_veronika`
--
ALTER TABLE `oc_t_item_veronika`
  ADD PRIMARY KEY (`fk_i_item_id`),
  ADD UNIQUE KEY `fk_i_item_id` (`fk_i_item_id`);

--
-- Индексы таблицы `oc_t_item_watchlist`
--
ALTER TABLE `oc_t_item_watchlist`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `oc_t_keywords`
--
ALTER TABLE `oc_t_keywords`
  ADD PRIMARY KEY (`s_md5`,`fk_c_locale_code`),
  ADD KEY `fk_i_category_id` (`fk_i_category_id`),
  ADD KEY `fk_i_city_id` (`fk_i_city_id`),
  ADD KEY `fk_c_locale_code` (`fk_c_locale_code`);

--
-- Индексы таблицы `oc_t_locale`
--
ALTER TABLE `oc_t_locale`
  ADD PRIMARY KEY (`pk_c_code`),
  ADD UNIQUE KEY `s_short_name` (`s_short_name`);

--
-- Индексы таблицы `oc_t_locations_tmp`
--
ALTER TABLE `oc_t_locations_tmp`
  ADD PRIMARY KEY (`id_location`,`e_type`);

--
-- Индексы таблицы `oc_t_meta_categories`
--
ALTER TABLE `oc_t_meta_categories`
  ADD PRIMARY KEY (`fk_i_category_id`,`fk_i_field_id`),
  ADD KEY `fk_i_field_id` (`fk_i_field_id`);

--
-- Индексы таблицы `oc_t_meta_fields`
--
ALTER TABLE `oc_t_meta_fields`
  ADD PRIMARY KEY (`pk_i_id`);

--
-- Индексы таблицы `oc_t_pages`
--
ALTER TABLE `oc_t_pages`
  ADD PRIMARY KEY (`pk_i_id`);

--
-- Индексы таблицы `oc_t_pages_description`
--
ALTER TABLE `oc_t_pages_description`
  ADD PRIMARY KEY (`fk_i_pages_id`,`fk_c_locale_code`),
  ADD KEY `fk_c_locale_code` (`fk_c_locale_code`);

--
-- Индексы таблицы `oc_t_pages_seo`
--
ALTER TABLE `oc_t_pages_seo`
  ADD PRIMARY KEY (`seo_page_id`);

--
-- Индексы таблицы `oc_t_plugin_category`
--
ALTER TABLE `oc_t_plugin_category`
  ADD KEY `fk_i_category_id` (`fk_i_category_id`);

--
-- Индексы таблицы `oc_t_preference`
--
ALTER TABLE `oc_t_preference`
  ADD UNIQUE KEY `s_section` (`s_section`,`s_name`);

--
-- Индексы таблицы `oc_t_profile_picture`
--
ALTER TABLE `oc_t_profile_picture`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `oc_t_region`
--
ALTER TABLE `oc_t_region`
  ADD PRIMARY KEY (`pk_i_id`),
  ADD KEY `fk_c_country_code` (`fk_c_country_code`),
  ADD KEY `idx_s_name` (`s_name`),
  ADD KEY `idx_s_slug` (`s_slug`);

--
-- Индексы таблицы `oc_t_region_seo`
--
ALTER TABLE `oc_t_region_seo`
  ADD PRIMARY KEY (`seo_region_id`);

--
-- Индексы таблицы `oc_t_region_stats`
--
ALTER TABLE `oc_t_region_stats`
  ADD PRIMARY KEY (`fk_i_region_id`),
  ADD KEY `idx_num_items` (`i_num_items`);

--
-- Индексы таблицы `oc_t_rslides`
--
ALTER TABLE `oc_t_rslides`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `oc_t_slider`
--
ALTER TABLE `oc_t_slider`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `oc_t_user`
--
ALTER TABLE `oc_t_user`
  ADD PRIMARY KEY (`pk_i_id`),
  ADD UNIQUE KEY `s_email` (`s_email`),
  ADD KEY `idx_s_name` (`s_name`(6)),
  ADD KEY `idx_s_username` (`s_username`),
  ADD KEY `fk_c_country_code` (`fk_c_country_code`),
  ADD KEY `fk_i_region_id` (`fk_i_region_id`),
  ADD KEY `fk_i_city_id` (`fk_i_city_id`),
  ADD KEY `fk_i_city_area_id` (`fk_i_city_area_id`);

--
-- Индексы таблицы `oc_t_user_description`
--
ALTER TABLE `oc_t_user_description`
  ADD PRIMARY KEY (`fk_i_user_id`,`fk_c_locale_code`),
  ADD KEY `fk_c_locale_code` (`fk_c_locale_code`);

--
-- Индексы таблицы `oc_t_user_email_tmp`
--
ALTER TABLE `oc_t_user_email_tmp`
  ADD PRIMARY KEY (`fk_i_user_id`);

--
-- Индексы таблицы `oc_t_widget`
--
ALTER TABLE `oc_t_widget`
  ADD PRIMARY KEY (`pk_i_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `oc_t_admin`
--
ALTER TABLE `oc_t_admin`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `oc_t_alerts`
--
ALTER TABLE `oc_t_alerts`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `oc_t_attribute`
--
ALTER TABLE `oc_t_attribute`
  MODIFY `pk_i_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
--
-- AUTO_INCREMENT для таблицы `oc_t_attribute_locale`
--
ALTER TABLE `oc_t_attribute_locale`
  MODIFY `pk_i_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT для таблицы `oc_t_attribute_value`
--
ALTER TABLE `oc_t_attribute_value`
  MODIFY `pk_i_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=84;
--
-- AUTO_INCREMENT для таблицы `oc_t_attribute_value_locale`
--
ALTER TABLE `oc_t_attribute_value_locale`
  MODIFY `pk_i_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;
--
-- AUTO_INCREMENT для таблицы `oc_t_ban_rule`
--
ALTER TABLE `oc_t_ban_rule`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `oc_t_category`
--
ALTER TABLE `oc_t_category`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;
--
-- AUTO_INCREMENT для таблицы `oc_t_city`
--
ALTER TABLE `oc_t_city`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1668;
--
-- AUTO_INCREMENT для таблицы `oc_t_im_block`
--
ALTER TABLE `oc_t_im_block`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `oc_t_im_messages`
--
ALTER TABLE `oc_t_im_messages`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `oc_t_im_threads`
--
ALTER TABLE `oc_t_im_threads`
  MODIFY `i_thread_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `oc_t_item`
--
ALTER TABLE `oc_t_item`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;
--
-- AUTO_INCREMENT для таблицы `oc_t_item_attribute`
--
ALTER TABLE `oc_t_item_attribute`
  MODIFY `pk_i_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT для таблицы `oc_t_item_car_make_attr`
--
ALTER TABLE `oc_t_item_car_make_attr`
  MODIFY `pk_i_id` int(2) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=205;
--
-- AUTO_INCREMENT для таблицы `oc_t_item_car_model_attr`
--
ALTER TABLE `oc_t_item_car_model_attr`
  MODIFY `pk_i_id` int(2) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3020;
--
-- AUTO_INCREMENT для таблицы `oc_t_item_comment`
--
ALTER TABLE `oc_t_item_comment`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `oc_t_item_favorite_ads`
--
ALTER TABLE `oc_t_item_favorite_ads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `oc_t_item_resource`
--
ALTER TABLE `oc_t_item_resource`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;
--
-- AUTO_INCREMENT для таблицы `oc_t_item_watchlist`
--
ALTER TABLE `oc_t_item_watchlist`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `oc_t_meta_fields`
--
ALTER TABLE `oc_t_meta_fields`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `oc_t_pages`
--
ALTER TABLE `oc_t_pages`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT для таблицы `oc_t_profile_picture`
--
ALTER TABLE `oc_t_profile_picture`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `oc_t_region`
--
ALTER TABLE `oc_t_region`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;
--
-- AUTO_INCREMENT для таблицы `oc_t_rslides`
--
ALTER TABLE `oc_t_rslides`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `oc_t_slider`
--
ALTER TABLE `oc_t_slider`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `oc_t_user`
--
ALTER TABLE `oc_t_user`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT для таблицы `oc_t_widget`
--
ALTER TABLE `oc_t_widget`
  MODIFY `pk_i_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `oc_t_attribute_locale`
--
ALTER TABLE `oc_t_attribute_locale`
  ADD CONSTRAINT `oc_t_attribute_locale_ibfk_1` FOREIGN KEY (`fk_i_attribute_id`) REFERENCES `oc_t_attribute` (`pk_i_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `oc_t_attribute_value`
--
ALTER TABLE `oc_t_attribute_value`
  ADD CONSTRAINT `oc_t_attribute_value_ibfk_1` FOREIGN KEY (`fk_i_attribute_id`) REFERENCES `oc_t_attribute` (`pk_i_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `oc_t_attribute_value_locale`
--
ALTER TABLE `oc_t_attribute_value_locale`
  ADD CONSTRAINT `oc_t_attribute_value_locale_ibfk_1` FOREIGN KEY (`fk_i_attribute_value_id`) REFERENCES `oc_t_attribute_value` (`pk_i_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `oc_t_category`
--
ALTER TABLE `oc_t_category`
  ADD CONSTRAINT `oc_t_category_ibfk_1` FOREIGN KEY (`fk_i_parent_id`) REFERENCES `oc_t_category` (`pk_i_id`);

--
-- Ограничения внешнего ключа таблицы `oc_t_category_description`
--
ALTER TABLE `oc_t_category_description`
  ADD CONSTRAINT `oc_t_category_description_ibfk_1` FOREIGN KEY (`fk_i_category_id`) REFERENCES `oc_t_category` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_category_description_ibfk_2` FOREIGN KEY (`fk_c_locale_code`) REFERENCES `oc_t_locale` (`pk_c_code`);

--
-- Ограничения внешнего ключа таблицы `oc_t_category_stats`
--
ALTER TABLE `oc_t_category_stats`
  ADD CONSTRAINT `oc_t_category_stats_ibfk_1` FOREIGN KEY (`fk_i_category_id`) REFERENCES `oc_t_category` (`pk_i_id`);

--
-- Ограничения внешнего ключа таблицы `oc_t_category_veronika`
--
ALTER TABLE `oc_t_category_veronika`
  ADD CONSTRAINT `oc_t_category_veronika_ibfk_1` FOREIGN KEY (`fk_i_category_id`) REFERENCES `oc_t_category` (`pk_i_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `oc_t_city`
--
ALTER TABLE `oc_t_city`
  ADD CONSTRAINT `oc_t_city_ibfk_1` FOREIGN KEY (`fk_i_region_id`) REFERENCES `oc_t_region` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_city_ibfk_2` FOREIGN KEY (`fk_c_country_code`) REFERENCES `oc_t_country` (`pk_c_code`);

--
-- Ограничения внешнего ключа таблицы `oc_t_city_area`
--
ALTER TABLE `oc_t_city_area`
  ADD CONSTRAINT `oc_t_city_area_ibfk_1` FOREIGN KEY (`fk_i_city_id`) REFERENCES `oc_t_city` (`pk_i_id`);

--
-- Ограничения внешнего ключа таблицы `oc_t_city_stats`
--
ALTER TABLE `oc_t_city_stats`
  ADD CONSTRAINT `oc_t_city_stats_ibfk_1` FOREIGN KEY (`fk_i_city_id`) REFERENCES `oc_t_city` (`pk_i_id`);

--
-- Ограничения внешнего ключа таблицы `oc_t_country_stats`
--
ALTER TABLE `oc_t_country_stats`
  ADD CONSTRAINT `oc_t_country_stats_ibfk_1` FOREIGN KEY (`fk_c_country_code`) REFERENCES `oc_t_country` (`pk_c_code`);

--
-- Ограничения внешнего ключа таблицы `oc_t_item`
--
ALTER TABLE `oc_t_item`
  ADD CONSTRAINT `oc_t_item_ibfk_1` FOREIGN KEY (`fk_i_user_id`) REFERENCES `oc_t_user` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_item_ibfk_2` FOREIGN KEY (`fk_i_category_id`) REFERENCES `oc_t_category` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_item_ibfk_3` FOREIGN KEY (`fk_c_currency_code`) REFERENCES `oc_t_currency` (`pk_c_code`);

--
-- Ограничения внешнего ключа таблицы `oc_t_item_attribute`
--
ALTER TABLE `oc_t_item_attribute`
  ADD CONSTRAINT `oc_t_item_attribute_ibfk_1` FOREIGN KEY (`fk_i_item_id`) REFERENCES `oc_t_item` (`pk_i_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `oc_t_item_attribute_ibfk_2` FOREIGN KEY (`fk_i_attribute_id`) REFERENCES `oc_t_attribute` (`pk_i_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `oc_t_item_car_attr`
--
ALTER TABLE `oc_t_item_car_attr`
  ADD CONSTRAINT `oc_t_item_car_attr_ibfk_1` FOREIGN KEY (`fk_i_item_id`) REFERENCES `oc_t_item` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_item_car_attr_ibfk_2` FOREIGN KEY (`fk_i_make_id`) REFERENCES `oc_t_item_car_make_attr` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_item_car_attr_ibfk_3` FOREIGN KEY (`fk_i_model_id`) REFERENCES `oc_t_item_car_model_attr` (`pk_i_id`);

--
-- Ограничения внешнего ключа таблицы `oc_t_item_car_model_attr`
--
ALTER TABLE `oc_t_item_car_model_attr`
  ADD CONSTRAINT `oc_t_item_car_model_attr_ibfk_1` FOREIGN KEY (`fk_i_make_id`) REFERENCES `oc_t_item_car_make_attr` (`pk_i_id`);

--
-- Ограничения внешнего ключа таблицы `oc_t_item_car_vehicle_type_attr`
--
ALTER TABLE `oc_t_item_car_vehicle_type_attr`
  ADD CONSTRAINT `oc_t_item_car_vehicle_type_attr_ibfk_1` FOREIGN KEY (`fk_c_locale_code`) REFERENCES `oc_t_locale` (`pk_c_code`);

--
-- Ограничения внешнего ключа таблицы `oc_t_item_comment`
--
ALTER TABLE `oc_t_item_comment`
  ADD CONSTRAINT `oc_t_item_comment_ibfk_1` FOREIGN KEY (`fk_i_item_id`) REFERENCES `oc_t_item` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_item_comment_ibfk_2` FOREIGN KEY (`fk_i_user_id`) REFERENCES `oc_t_user` (`pk_i_id`);

--
-- Ограничения внешнего ключа таблицы `oc_t_item_location`
--
ALTER TABLE `oc_t_item_location`
  ADD CONSTRAINT `oc_t_item_location_ibfk_1` FOREIGN KEY (`fk_i_item_id`) REFERENCES `oc_t_item` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_item_location_ibfk_2` FOREIGN KEY (`fk_c_country_code`) REFERENCES `oc_t_country` (`pk_c_code`),
  ADD CONSTRAINT `oc_t_item_location_ibfk_3` FOREIGN KEY (`fk_i_region_id`) REFERENCES `oc_t_region` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_item_location_ibfk_4` FOREIGN KEY (`fk_i_city_id`) REFERENCES `oc_t_city` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_item_location_ibfk_5` FOREIGN KEY (`fk_i_city_area_id`) REFERENCES `oc_t_city_area` (`pk_i_id`);

--
-- Ограничения внешнего ключа таблицы `oc_t_item_meta`
--
ALTER TABLE `oc_t_item_meta`
  ADD CONSTRAINT `oc_t_item_meta_ibfk_1` FOREIGN KEY (`fk_i_item_id`) REFERENCES `oc_t_item` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_item_meta_ibfk_2` FOREIGN KEY (`fk_i_field_id`) REFERENCES `oc_t_meta_fields` (`pk_i_id`);

--
-- Ограничения внешнего ключа таблицы `oc_t_item_renew_ads`
--
ALTER TABLE `oc_t_item_renew_ads`
  ADD CONSTRAINT `oc_t_item_renew_ads_ibfk_1` FOREIGN KEY (`fk_i_item_id`) REFERENCES `oc_t_item` (`pk_i_id`);

--
-- Ограничения внешнего ключа таблицы `oc_t_item_resource`
--
ALTER TABLE `oc_t_item_resource`
  ADD CONSTRAINT `oc_t_item_resource_ibfk_1` FOREIGN KEY (`fk_i_item_id`) REFERENCES `oc_t_item` (`pk_i_id`);

--
-- Ограничения внешнего ключа таблицы `oc_t_item_stats`
--
ALTER TABLE `oc_t_item_stats`
  ADD CONSTRAINT `oc_t_item_stats_ibfk_1` FOREIGN KEY (`fk_i_item_id`) REFERENCES `oc_t_item` (`pk_i_id`);

--
-- Ограничения внешнего ключа таблицы `oc_t_item_stats_veronika`
--
ALTER TABLE `oc_t_item_stats_veronika`
  ADD CONSTRAINT `oc_t_item_stats_veronika_ibfk_1` FOREIGN KEY (`fk_i_item_id`) REFERENCES `oc_t_item` (`pk_i_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `oc_t_item_veronika`
--
ALTER TABLE `oc_t_item_veronika`
  ADD CONSTRAINT `oc_t_item_veronika_ibfk_1` FOREIGN KEY (`fk_i_item_id`) REFERENCES `oc_t_item` (`pk_i_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `oc_t_keywords`
--
ALTER TABLE `oc_t_keywords`
  ADD CONSTRAINT `oc_t_keywords_ibfk_1` FOREIGN KEY (`fk_i_category_id`) REFERENCES `oc_t_category` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_keywords_ibfk_2` FOREIGN KEY (`fk_i_city_id`) REFERENCES `oc_t_city` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_keywords_ibfk_3` FOREIGN KEY (`fk_c_locale_code`) REFERENCES `oc_t_locale` (`pk_c_code`);

--
-- Ограничения внешнего ключа таблицы `oc_t_meta_categories`
--
ALTER TABLE `oc_t_meta_categories`
  ADD CONSTRAINT `oc_t_meta_categories_ibfk_1` FOREIGN KEY (`fk_i_category_id`) REFERENCES `oc_t_category` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_meta_categories_ibfk_2` FOREIGN KEY (`fk_i_field_id`) REFERENCES `oc_t_meta_fields` (`pk_i_id`);

--
-- Ограничения внешнего ключа таблицы `oc_t_pages_description`
--
ALTER TABLE `oc_t_pages_description`
  ADD CONSTRAINT `oc_t_pages_description_ibfk_1` FOREIGN KEY (`fk_i_pages_id`) REFERENCES `oc_t_pages` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_pages_description_ibfk_2` FOREIGN KEY (`fk_c_locale_code`) REFERENCES `oc_t_locale` (`pk_c_code`);

--
-- Ограничения внешнего ключа таблицы `oc_t_plugin_category`
--
ALTER TABLE `oc_t_plugin_category`
  ADD CONSTRAINT `oc_t_plugin_category_ibfk_1` FOREIGN KEY (`fk_i_category_id`) REFERENCES `oc_t_category` (`pk_i_id`);

--
-- Ограничения внешнего ключа таблицы `oc_t_region`
--
ALTER TABLE `oc_t_region`
  ADD CONSTRAINT `oc_t_region_ibfk_1` FOREIGN KEY (`fk_c_country_code`) REFERENCES `oc_t_country` (`pk_c_code`);

--
-- Ограничения внешнего ключа таблицы `oc_t_region_stats`
--
ALTER TABLE `oc_t_region_stats`
  ADD CONSTRAINT `oc_t_region_stats_ibfk_1` FOREIGN KEY (`fk_i_region_id`) REFERENCES `oc_t_region` (`pk_i_id`);

--
-- Ограничения внешнего ключа таблицы `oc_t_user`
--
ALTER TABLE `oc_t_user`
  ADD CONSTRAINT `oc_t_user_ibfk_1` FOREIGN KEY (`fk_c_country_code`) REFERENCES `oc_t_country` (`pk_c_code`),
  ADD CONSTRAINT `oc_t_user_ibfk_2` FOREIGN KEY (`fk_i_region_id`) REFERENCES `oc_t_region` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_user_ibfk_3` FOREIGN KEY (`fk_i_city_id`) REFERENCES `oc_t_city` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_user_ibfk_4` FOREIGN KEY (`fk_i_city_area_id`) REFERENCES `oc_t_city_area` (`pk_i_id`);

--
-- Ограничения внешнего ключа таблицы `oc_t_user_description`
--
ALTER TABLE `oc_t_user_description`
  ADD CONSTRAINT `oc_t_user_description_ibfk_1` FOREIGN KEY (`fk_i_user_id`) REFERENCES `oc_t_user` (`pk_i_id`),
  ADD CONSTRAINT `oc_t_user_description_ibfk_2` FOREIGN KEY (`fk_c_locale_code`) REFERENCES `oc_t_locale` (`pk_c_code`);

--
-- Ограничения внешнего ключа таблицы `oc_t_user_email_tmp`
--
ALTER TABLE `oc_t_user_email_tmp`
  ADD CONSTRAINT `oc_t_user_email_tmp_ibfk_1` FOREIGN KEY (`fk_i_user_id`) REFERENCES `oc_t_user` (`pk_i_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
