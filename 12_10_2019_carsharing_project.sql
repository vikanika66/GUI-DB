-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Окт 12 2019 г., 05:16
-- Версия сервера: 5.5.57-MariaDB
-- Версия PHP: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `carsharing_project`
--
CREATE DATABASE IF NOT EXISTS `carsharing_project` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `carsharing_project`;

-- --------------------------------------------------------

--
-- Структура таблицы `cars`
--

CREATE TABLE IF NOT EXISTS `cars` (
  `license_plate` varchar(9) NOT NULL,
  `model` varchar(20) DEFAULT NULL,
  `manufacturer` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`license_plate`),
  UNIQUE KEY `license_plate_UNIQUE` (`license_plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Очистить таблицу перед добавлением данных `cars`
--

TRUNCATE TABLE `cars`;
--
-- Дамп данных таблицы `cars`
--

INSERT INTO `cars` (`license_plate`, `model`, `manufacturer`) VALUES
('а332мк777', 'Skoda', 'Fabia'),
('а834ск99', 'Opel', 'Astra'),
('к421ро97', 'Ford', 'Focus'),
('о124нс777', 'Renault', 'Logan'),
('с551ер77', 'Skoda', 'Yeti'),
('т428кх777', 'Skoda', 'Octavia');

-- --------------------------------------------------------

--
-- Структура таблицы `clients`
--

CREATE TABLE IF NOT EXISTS `clients` (
  `idclients` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `middle_name` varchar(45) DEFAULT NULL,
  `pass_id` bigint(10) UNSIGNED DEFAULT NULL,
  `contract_id` varchar(45) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `drivers_license_id` bigint(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`idclients`),
  UNIQUE KEY `idclients_UNIQUE` (`idclients`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Очистить таблицу перед добавлением данных `clients`
--

TRUNCATE TABLE `clients`;
--
-- Дамп данных таблицы `clients`
--

INSERT INTO `clients` (`idclients`, `first_name`, `last_name`, `middle_name`, `pass_id`, `contract_id`, `birth_date`, `drivers_license_id`) VALUES
(1, 'Иван', 'Иванович', 'Иванов', 4521, '5423-1.3', '1975-06-05', 123456);

-- --------------------------------------------------------

--
-- Структура таблицы `employees`
--

CREATE TABLE IF NOT EXISTS `employees` (
  `idemployees` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `middle_name` varchar(45) DEFAULT NULL,
  `pass_id` bigint(10) DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `birthh_date` date DEFAULT NULL,
  `employee_contract_id` varchar(45) NOT NULL,
  `drivers_license_id` bigint(10) NOT NULL,
  PRIMARY KEY (`idemployees`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Очистить таблицу перед добавлением данных `employees`
--

TRUNCATE TABLE `employees`;
--
-- Дамп данных таблицы `employees`
--

INSERT INTO `employees` (`idemployees`, `first_name`, `last_name`, `middle_name`, `pass_id`, `hire_date`, `birthh_date`, `employee_contract_id`, `drivers_license_id`) VALUES
(1, 'Игорь', 'Кузнецов', 'Кириллович', 3011549283, '2019-02-04', '2000-03-06', '32910-21221', 4332123);

-- --------------------------------------------------------

--
-- Структура таблицы `employees_on_serv_order`
--

CREATE TABLE IF NOT EXISTS `employees_on_serv_order` (
  `service_order_idservice_order` int(11) NOT NULL,
  `employees_idemployees` int(11) NOT NULL,
  KEY `fk_employees_on_serv_order_service_order1` (`service_order_idservice_order`),
  KEY `fk_employees_on_serv_order_employees1_idx` (`employees_idemployees`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Очистить таблицу перед добавлением данных `employees_on_serv_order`
--

TRUNCATE TABLE `employees_on_serv_order`;
--
-- Дамп данных таблицы `employees_on_serv_order`
--

INSERT INTO `employees_on_serv_order` (`service_order_idservice_order`, `employees_idemployees`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `incidents`
--

CREATE TABLE IF NOT EXISTS `incidents` (
  `idincidents` int(11) NOT NULL AUTO_INCREMENT,
  `date_time` datetime DEFAULT NULL,
  `place` varchar(45) DEFAULT NULL,
  `damage_rub` mediumint(20) UNSIGNED DEFAULT NULL,
  `client_fault` tinyint(1) DEFAULT NULL,
  `order_idorder` int(11) DEFAULT NULL,
  `service_order_idservice_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`idincidents`),
  UNIQUE KEY `idincidents_UNIQUE` (`idincidents`),
  KEY `fk_incidents_order1_idx` (`order_idorder`),
  KEY `fk_incidents_service_order1_idx` (`service_order_idservice_order`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Очистить таблицу перед добавлением данных `incidents`
--

TRUNCATE TABLE `incidents`;
--
-- Дамп данных таблицы `incidents`
--

INSERT INTO `incidents` (`idincidents`, `date_time`, `place`, `damage_rub`, `client_fault`, `order_idorder`, `service_order_idservice_order`) VALUES
(2, '2019-10-01 12:00:00', 'Земляной вал у дома 23', 32111, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `order`
--

CREATE TABLE IF NOT EXISTS `order` (
  `idorder` int(11) NOT NULL AUTO_INCREMENT,
  `datetime_start` datetime DEFAULT NULL,
  `datetime_finish` datetime DEFAULT NULL,
  `cars_license_plate` varchar(9) NOT NULL,
  `clients_idclients` int(11) NOT NULL,
  PRIMARY KEY (`idorder`),
  UNIQUE KEY `idorder_UNIQUE` (`idorder`),
  KEY `fk_order_cars_idx` (`cars_license_plate`),
  KEY `fk_order_clients1_idx` (`clients_idclients`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Очистить таблицу перед добавлением данных `order`
--

TRUNCATE TABLE `order`;
--
-- Дамп данных таблицы `order`
--

INSERT INTO `order` (`idorder`, `datetime_start`, `datetime_finish`, `cars_license_plate`, `clients_idclients`) VALUES
(1, '2019-10-03 00:00:00', '2019-10-04 00:00:00', 'а834ск99', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `service_order`
--

CREATE TABLE IF NOT EXISTS `service_order` (
  `idservice_order` int(11) NOT NULL AUTO_INCREMENT,
  `datetime_start` datetime DEFAULT NULL,
  `datetime_end` datetime DEFAULT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `cars_license_plate` varchar(9) NOT NULL,
  PRIMARY KEY (`idservice_order`),
  UNIQUE KEY `idservice_order_UNIQUE` (`idservice_order`),
  KEY `fk_service_order_cars1_idx` (`cars_license_plate`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Очистить таблицу перед добавлением данных `service_order`
--

TRUNCATE TABLE `service_order`;
--
-- Дамп данных таблицы `service_order`
--

INSERT INTO `service_order` (`idservice_order`, `datetime_start`, `datetime_end`, `reason`, `cars_license_plate`) VALUES
(1, '2019-10-01 00:00:00', '2019-10-02 00:00:00', 'Перегон в парк', 'с551ер77');

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `employees_on_serv_order`
--
ALTER TABLE `employees_on_serv_order`
  ADD CONSTRAINT `fk_employees_on_serv_order_service_order1` FOREIGN KEY (`service_order_idservice_order`) REFERENCES `service_order` (`idservice_order`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_employees_on_serv_order_employees1` FOREIGN KEY (`employees_idemployees`) REFERENCES `employees` (`idemployees`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `incidents`
--
ALTER TABLE `incidents`
  ADD CONSTRAINT `fk_incidents_order1` FOREIGN KEY (`order_idorder`) REFERENCES `order` (`idorder`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_incidents_service_order1` FOREIGN KEY (`service_order_idservice_order`) REFERENCES `service_order` (`idservice_order`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `fk_order_cars` FOREIGN KEY (`cars_license_plate`) REFERENCES `cars` (`license_plate`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_order_clients1` FOREIGN KEY (`clients_idclients`) REFERENCES `clients` (`idclients`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `service_order`
--
ALTER TABLE `service_order`
  ADD CONSTRAINT `fk_service_order_cars1` FOREIGN KEY (`cars_license_plate`) REFERENCES `cars` (`license_plate`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
