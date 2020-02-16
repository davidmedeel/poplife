-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.6.45-log - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para altislife
CREATE DATABASE IF NOT EXISTS `altislife` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `altislife`;

-- Volcando estructura para tabla altislife.containers
CREATE TABLE IF NOT EXISTS `containers` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `pid` varchar(17) NOT NULL,
  `classname` varchar(32) NOT NULL,
  `pos` varchar(64) DEFAULT NULL,
  `inventory` text NOT NULL,
  `gear` text NOT NULL,
  `dir` varchar(128) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `owned` tinyint(1) DEFAULT '0',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `apto` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla altislife.containers: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `containers` DISABLE KEYS */;
/*!40000 ALTER TABLE `containers` ENABLE KEYS */;

-- Volcando estructura para procedimiento altislife.deleteDeadVehicles
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteDeadVehicles`()
BEGIN
	DELETE FROM `vehicles` WHERE `alive` = 0;
END//
DELIMITER ;

-- Volcando estructura para procedimiento altislife.deleteOldContainers
DELIMITER //
CREATE DEFINER=`arma3`@`localhost` PROCEDURE `deleteOldContainers`()
BEGIN
  DELETE FROM `containers` WHERE `owned` = 0;
END//
DELIMITER ;

-- Volcando estructura para procedimiento altislife.deleteOldGangs
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteOldGangs`()
BEGIN
	DELETE FROM `gangs` WHERE `active` = 0;
END//
DELIMITER ;

-- Volcando estructura para procedimiento altislife.deleteOldHouses
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `deleteOldHouses`()
BEGIN
  DELETE FROM `houses` WHERE `owned` = 0;
END//
DELIMITER ;

-- Volcando estructura para procedimiento altislife.deleteOldWanted
DELIMITER //
CREATE DEFINER=`arma3`@`localhost` PROCEDURE `deleteOldWanted`()
BEGIN
  DELETE FROM `wanted` WHERE `active` = 0;
END//
DELIMITER ;

-- Volcando estructura para tabla altislife.facciones
CREATE TABLE IF NOT EXISTS `facciones` (
  `nombre` varchar(50) NOT NULL COMMENT 'ArmA3 side',
  `bank` int(50) unsigned NOT NULL DEFAULT '0' COMMENT 'Dinero',
  `history` text NOT NULL COMMENT 'Array',
  PRIMARY KEY (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla altislife.facciones: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `facciones` DISABLE KEYS */;
INSERT INTO `facciones` (`nombre`, `bank`, `history`) VALUES
	('EMS', 10, ''),
	('GOB', 350000, ''),
	('PD', 100, '');
/*!40000 ALTER TABLE `facciones` ENABLE KEYS */;

-- Volcando estructura para tabla altislife.gangs
CREATE TABLE IF NOT EXISTS `gangs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` varchar(32) DEFAULT NULL,
  `name` varchar(32) DEFAULT NULL,
  `members` text,
  `maxmembers` int(2) DEFAULT '8',
  `bank` int(100) DEFAULT '0',
  `active` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla altislife.gangs: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `gangs` DISABLE KEYS */;
INSERT INTO `gangs` (`id`, `owner`, `name`, `members`, `maxmembers`, `bank`, `active`) VALUES
	(1, '76561198167402365', 'Nombre de la Mafia', '"[`76561198167402365`]"', 8, 0, 1);
/*!40000 ALTER TABLE `gangs` ENABLE KEYS */;

-- Volcando estructura para tabla altislife.gov_impuestos
CREATE TABLE IF NOT EXISTS `gov_impuestos` (
  `id` int(50) NOT NULL DEFAULT '200000',
  `tax` int(50) NOT NULL DEFAULT '200000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla altislife.gov_impuestos: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `gov_impuestos` DISABLE KEYS */;
INSERT INTO `gov_impuestos` (`id`, `tax`) VALUES
	(1, 2222);
/*!40000 ALTER TABLE `gov_impuestos` ENABLE KEYS */;

-- Volcando estructura para tabla altislife.granjas
CREATE TABLE IF NOT EXISTS `granjas` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `pid` varchar(17) NOT NULL,
  `pos` varchar(64) DEFAULT NULL,
  `owned` tinyint(1) DEFAULT '0',
  `garage` tinyint(1) NOT NULL DEFAULT '0',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla altislife.granjas: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `granjas` DISABLE KEYS */;
/*!40000 ALTER TABLE `granjas` ENABLE KEYS */;

-- Volcando estructura para tabla altislife.houses
CREATE TABLE IF NOT EXISTS `houses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` varchar(32) NOT NULL,
  `pos` varchar(64) DEFAULT NULL,
  `inventory` text,
  `containers` text,
  `owned` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`,`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla altislife.houses: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `houses` DISABLE KEYS */;
INSERT INTO `houses` (`id`, `pid`, `pos`, `inventory`, `containers`, `owned`) VALUES
	(1, '76561198167402365', '[5497.92,3191.28,-0.0895491]', '[[],0]', '"[[`pop_caja_armariop_box`,[[[],[]],[[`pop_diamante`,`pop_armariop`],[64,8]],[[],[]],[[`streetv_mochila_grande`],[1]]]],[`pop_caja_armariop_box`,[[[],[]],[[],[]],[[],[]],[[],[]]]]]"', 1);
/*!40000 ALTER TABLE `houses` ENABLE KEYS */;

-- Volcando estructura para tabla altislife.logs
CREATE TABLE IF NOT EXISTS `logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `owner` int(11) NOT NULL,
  `ip` varchar(64) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `title` varchar(128) NOT NULL,
  `description` text NOT NULL,
  `level` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla altislife.logs: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` (`id`, `owner`, `ip`, `time`, `title`, `description`, `level`) VALUES
	(1, 1, '::1', '2019-11-08 22:43:23', 'login', 'Rex (76561198167402365) logged in', 1),
	(2, 0, '::1', '2019-11-08 22:43:37', 'login', '::1 (N\\/A) tried to login with non-existant information: [username:SergioRex], [password:*****]', 1),
	(3, 1, '::1', '2019-11-08 22:43:40', 'login', 'Rex (76561198167402365) logged in', 1),
	(4, 1, '::1', '2019-11-08 22:44:53', 'staff chat', 'Rex (76561198167402365) typed new chat message [test]', 4),
	(5, 1, '::1', '2019-11-08 22:45:17', 'vehicle', 'Rex (76561198167402365) stored [vehicle\\/V_stv_Vito_ToCannabis]', 2);
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;

-- Volcando estructura para tabla altislife.market
CREATE TABLE IF NOT EXISTS `market` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `prices` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla altislife.market: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `market` DISABLE KEYS */;
INSERT INTO `market` (`id`, `prices`) VALUES
	(1, '[304,0,1000,124,413,649,1000,45,326,152,425,0,115,157,508,0,228,246,635,0,487,103,428,20,0,0,0,73,116,0,16,0,6,1,200,29,151,176,0,0,0,0]');
/*!40000 ALTER TABLE `market` ENABLE KEYS */;

-- Volcando estructura para tabla altislife.negocios
CREATE TABLE IF NOT EXISTS `negocios` (
  `id` int(6) NOT NULL AUTO_INCREMENT,
  `pid` varchar(17) NOT NULL,
  `classname` varchar(50) DEFAULT NULL,
  `pos` varchar(64) DEFAULT NULL,
  `owned` tinyint(1) DEFAULT '0',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- Volcando datos para la tabla altislife.negocios: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `negocios` DISABLE KEYS */;
/*!40000 ALTER TABLE `negocios` ENABLE KEYS */;

-- Volcando estructura para tabla altislife.players
CREATE TABLE IF NOT EXISTS `players` (
  `uid` int(12) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `playerid` varchar(50) NOT NULL,
  `cash` int(100) NOT NULL DEFAULT '0',
  `bankacc` int(100) NOT NULL DEFAULT '0',
  `coplevel` enum('0','1','2','3','4','5','6','7') NOT NULL DEFAULT '0',
  `cop_licenses` text,
  `civ_licenses` text,
  `med_licenses` text,
  `cop_gear` text NOT NULL,
  `med_gear` text NOT NULL,
  `mediclevel` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `arrested` tinyint(1) NOT NULL DEFAULT '0',
  `aliases` text NOT NULL,
  `adminlevel` enum('0','1','2','3','4') NOT NULL DEFAULT '0',
  `donatorlvl` enum('0','1','2') NOT NULL DEFAULT '0',
  `civ_gear` text NOT NULL,
  `experiencia` text,
  `jailtime` int(100) DEFAULT '0',
  `arrestreason` text,
  `op_licenses` text,
  `op_gear` text NOT NULL,
  `oplevel` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `mafialvl` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  `terrolvl` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `playerid` (`playerid`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla altislife.players: ~8 rows (aproximadamente)
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` (`uid`, `name`, `playerid`, `cash`, `bankacc`, `coplevel`, `cop_licenses`, `civ_licenses`, `med_licenses`, `cop_gear`, `med_gear`, `mediclevel`, `arrested`, `aliases`, `adminlevel`, `donatorlvl`, `civ_gear`, `experiencia`, `jailtime`, `arrestreason`, `op_licenses`, `op_gear`, `oplevel`, `mafialvl`, `terrolvl`) VALUES
	(1, 'Daniel Reyes', '76561198310733961', 2000, 23567, '7', '"[]"', '"[[`license_cop_air`,0],[`license_cop_swat`,0],[`license_cop_cg`,0],[`license_civ_driver`,0],[`license_civ_air`,0],[`license_civ_heroin`,0],[`license_civ_gang`,0],[`license_civ_boat`,0],[`license_civ_truck`,0],[`license_civ_depan`,0],[`license_civ_gun`,0],[`license_civ_rebel`,0],[`license_civ_home`,0],[`license_civ_taxita`,0],[`license_civ_Periodista`,0],[`license_civ_policiaon`,0],[`license_civ_transporte`,0],[`license_civ_donator`,0]]"', '"[]"', '"[]"', '"[]"', '0', 0, '"[`Daniel Reyes`]"', '4', '0', '"[`U_C_Commoner1_1`,``,``,``,``,[`ItemMap`,`ItemCompass`,`Itemwatch`,`ItemRadio`],``,``,[],[],[],[],[],[],[``,``,``,``],[``,``,``,``]]"', '"[100,1,200,0,0,0,0,0,0,0,0,0,0,0]"', 4, '4', '"[]"', '"[]"', '0', '0', '0'),
	(21, 'John Castillo', '76561198039720751', 5000, 1584, '7', '"[]"', '"[[`license_cop_air`,0],[`license_cop_swat`,0],[`license_cop_cg`,0],[`license_civ_driver`,1],[`license_civ_air`,0],[`license_civ_heroin`,0],[`license_civ_gang`,0],[`license_civ_boat`,0],[`license_civ_truck`,0],[`license_civ_depan`,0],[`license_civ_gun`,0],[`license_civ_rebel`,0],[`license_civ_home`,0],[`license_civ_taxita`,0],[`license_civ_Periodista`,0],[`license_civ_policiaon`,1],[`license_civ_transporte`,0],[`license_civ_donator`,0]]"', '"[]"', '"[]"', '"[]"', '0', 0, '"[`John Castillo`]"', '4', '0', '"[``,``,``,``,``,[],``,`RH_usp`,[],[],[],[],[],[],[``,``,``,``],[``,``,``,``]]"', '"[12344,70,1000,0,0,0,0,0,0,0,0,0,0,0]"', 2, 'Tonto', '"[]"', '"[]"', '0', '0', '0'),
	(22, 'Vyacheslav Romanov', '76561198303663921', 0, 44691, '7', '"[]"', '"[[`license_civ_driver`,0],[`license_civ_air`,0],[`license_civ_heroin`,0],[`license_civ_gang`,0],[`license_civ_boat`,0],[`license_civ_truck`,0],[`license_civ_depan`,0],[`license_civ_gun`,0],[`license_civ_rebel`,0],[`license_civ_home`,0],[`license_civ_taxita`,0],[`license_civ_Periodista`,0],[`license_civ_policiaon`,0],[`license_civ_transporte`,0],[`license_civ_donator`,0]]"', '"[]"', '"[]"', '"[]"', '0', 0, '"[`Vyacheslav Romanov`]"', '4', '0', '"[`U_I_Soldier_VR`,``,``,``,``,[`ItemMap`,`ItemCompass`,`Itemwatch`,`ItemRadio`],``,``,[],[],[],[],[],[],[``,``,``,``],[``,``,``,``]]"', '"[103330,31,20022,7,0,0,0,0,0,0,0,0,0,8]"', 0, '"none"', '"[]"', '"[]"', '0', '0', '0'),
	(23, 'Rana Gustavo ', '76561198302422595', 0, 6276, '0', '"[]"', '"[[`license_cop_air`,0],[`license_cop_swat`,0],[`license_cop_cg`,0],[`license_civ_driver`,0],[`license_civ_air`,0],[`license_civ_heroin`,0],[`license_civ_gang`,0],[`license_civ_boat`,0],[`license_civ_truck`,0],[`license_civ_depan`,0],[`license_civ_gun`,0],[`license_civ_rebel`,0],[`license_civ_home`,0],[`license_civ_taxita`,0],[`license_civ_Periodista`,0],[`license_civ_policiaon`,0],[`license_civ_transporte`,0],[`license_civ_donator`,0]]"', '"[]"', '"[]"', '"[]"', '0', 0, '"[`Rana Gustavo Delano`]"', '4', '0', '"[`U_C_Commoner1_1`,``,``,``,``,[`ItemMap`,`ItemCompass`,`Itemwatch`,`ItemRadio`],``,``,[],[],[],[],[],[],[``,``,``,``],[``,``,``,``]]"', '"[100,1,130,0,0,0,0,0,0,0,0,0,0,0]"', 0, '""', '"[]"', '"[]"', '0', '0', '0'),
	(24, 'Aiden McAllister', '76561198226931204', 0, 91782560, '7', '"[[`license_cop_air`,0],[`license_cop_especialidad`,0],[`license_cop_swat`,0],[`license_cop_cg`,0]]"', '"[[`license_civ_driver`,0],[`license_civ_air`,0],[`license_civ_heroin`,0],[`license_civ_gang`,0],[`license_civ_boat`,0],[`license_civ_truck`,0],[`license_civ_depan`,0],[`license_civ_gun`,0],[`license_civ_rebel`,0],[`license_civ_home`,0],[`license_civ_taxita`,0],[`license_civ_Periodista`,0],[`license_civ_policiaon`,1],[`license_civ_transporte`,0],[`license_civ_donator`,0]]"', '"[]"', '"[`U_C_Commoner1_1`,``,``,``,``,[`ItemMap`,`ItemCompass`,`Itemwatch`],``,``,[],[],[],[],[],[],[``,``,``,``],[``,``,``,``]]"', '"[]"', '5', 0, '"[`Aiden McAllister`]"', '4', '0', '"[`CNP_comisario`,`streetv_cinturon`,`mochila_pequena`,`G_Lowprofile`,`GORRA_CNP`,[`ItemMap`,`ItemCompass`,`Itemwatch`,`ItemGPS`],``,`RH_usp`,[],[`RH_12Rnd_45cal_usp`,`RH_12Rnd_45cal_usp`,`RH_12Rnd_45cal_usp`,`pop_esposas`,`RH_12Rnd_45cal_usp`,`RH_12Rnd_45cal_usp`],[],[`RH_12Rnd_45cal_usp`,`RH_12Rnd_45cal_usp`,`RH_12Rnd_45cal_usp`,`RH_12Rnd_45cal_usp`,`RH_12Rnd_45cal_usp`,`RH_12Rnd_45cal_usp`,`RH_12Rnd_45cal_usp`,`RH_12Rnd_45cal_usp`,`RH_12Rnd_45cal_usp`,`pop_vendas_c`,`pop_vendas_c`,`pop_vendas_c`,`pop_vendas_c`,`pop_kiwi`,`pop_kiwi`,`pop_nokia`,`pop_esposas`,`pop_llaves`,`pop_esposas`,`pop_esposas`],[],[`RH_12Rnd_45cal_usp`],[``,``,``,``],[``,``,``,``]]"', '"[100,1,300,0,0,0,0,0,0,0,0,0,0,0]"', 0, '""', '"[]"', '"[]"', '0', '0', '0'),
	(25, 'Danny Corleone', '76561198156058816', 5000, 70700, '7', '"[]"', '"[[`license_cop_air`,0],[`license_cop_swat`,0],[`license_cop_cg`,0],[`license_civ_driver`,0],[`license_civ_air`,0],[`license_civ_heroin`,0],[`license_civ_gang`,0],[`license_civ_boat`,0],[`license_civ_truck`,0],[`license_civ_depan`,0],[`license_civ_gun`,0],[`license_civ_rebel`,0],[`license_civ_home`,0],[`license_civ_taxita`,0],[`license_civ_Periodista`,0],[`license_civ_policiaon`,0],[`license_civ_transporte`,0],[`license_civ_donator`,0]]"', '"[]"', '"[``,``,``,``,``,[],``,`Taser_26`,[],[],[],[],[],[],[``,``,``,``],[``,``,``,``]]"', '"[]"', '0', 1, '"[`Danny Corleone`]"', '0', '0', '"[`U_C_Commoner1_1`,``,``,``,``,[`ItemMap`,`ItemCompass`,`Itemwatch`,`ItemRadio`],``,``,[`acc_flashlight`],[],[],[],[],[],[``,``,``,``],[``,``,``,``]]"', '"[100,1,10,0,0,0,0,0,0,0,0,0,0,0]"', 1, 'rex', '"[]"', '"[]"', '0', '0', '0'),
	(29, 'Maria', '76561198453681787', 0, 20000, '0', '"[]"', '"[[`license_civ_driver`,0],[`license_civ_air`,0],[`license_civ_heroin`,0],[`license_civ_gang`,0],[`license_civ_boat`,0],[`license_civ_truck`,0],[`license_civ_depan`,0],[`license_civ_gun`,0],[`license_civ_rebel`,0],[`license_civ_home`,0],[`license_civ_taxita`,0],[`license_civ_Periodista`,0],[`license_civ_policiaon`,0],[`license_civ_transporte`,0],[`license_civ_donator`,0]]"', '"[]"', '"[]"', '"[]"', '0', 0, '"[`Maria`]"', '0', '0', '"[`A3L_Prisoner_Outfit`,``,``,``,``,[`ItemMap`,`ItemCompass`,`Itemwatch`,`ItemRadio`],``,``,[],[],[],[],[],[],[``,``,``,``],[``,``,``,``]]"', '"[100,1,0,0,0,0,0,0,0,0,0,0,0,0]"', 1, '"rex"', '"[]"', '"[]"', '0', '0', '0'),
	(30, 'Sergio Rex', '76561198167402365', 234743, 33749564, '7', '"[[`license_cop_air`,0],[`license_cop_especialidad`,0],[`license_cop_swat`,0],[`license_cop_cg`,0]]"', '"[[`license_civ_driver`,1],[`license_civ_air`,0],[`license_civ_heroin`,0],[`license_civ_gang`,0],[`license_civ_boat`,0],[`license_civ_truck`,1],[`license_civ_depan`,0],[`license_civ_gun`,0],[`license_civ_rebel`,0],[`license_civ_home`,0],[`license_civ_taxita`,0],[`license_civ_Periodista`,0],[`license_civ_policiaon`,0],[`license_civ_transporte`,0],[`license_civ_donator`,1]]"', '"[]"', '"[``,``,``,``,``,[`ItemMap`,`ItemCompass`,`Itemwatch`,`ItemGPS`],``,`Taser_26`,[],[],[],[],[],[],[``,``,``,``],[``,``,``,``]]"', '"[]"', '5', 0, '"[`Sergio Rex`]"', '4', '2', '"[`vvv_traje_dallas`,`TAC_Jvest_U`,`mochila_grande`,`G_Sport_BlackWhite`,`A3L_sombrero`,[`ItemMap`,`ItemCompass`,`Itemwatch`,`ItemRadio`],``,``,[],[],[],[],[],[],[``,``,``,``],[``,``,``,``]]"', '"[105,1,750,0,0,0,0,0,0,0,0,0,0,0]"', 0, '""', '"[]"', '"[]"', '0', '5', '0');
/*!40000 ALTER TABLE `players` ENABLE KEYS */;

-- Volcando estructura para tabla altislife.politica
CREATE TABLE IF NOT EXISTS `politica` (
  `id` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `votos` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla altislife.politica: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `politica` DISABLE KEYS */;
/*!40000 ALTER TABLE `politica` ENABLE KEYS */;

-- Volcando estructura para tabla altislife.politicados
CREATE TABLE IF NOT EXISTS `politicados` (
  `votantes` varchar(50) DEFAULT NULL,
  `candidato` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla altislife.politicados: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `politicados` DISABLE KEYS */;
/*!40000 ALTER TABLE `politicados` ENABLE KEYS */;

-- Volcando estructura para procedimiento altislife.resetLifeVehicles
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `resetLifeVehicles`()
BEGIN
	UPDATE vehicles SET `active`= 0;
END//
DELIMITER ;

-- Volcando estructura para tabla altislife.storages
CREATE TABLE IF NOT EXISTS `storages` (
  `pid` varchar(32) NOT NULL,
  `inventario` text,
  `capacidad` int(4) NOT NULL,
  `id` int(12) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pid` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla altislife.storages: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `storages` DISABLE KEYS */;
/*!40000 ALTER TABLE `storages` ENABLE KEYS */;

-- Volcando estructura para tabla altislife.vehicles
CREATE TABLE IF NOT EXISTS `vehicles` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `side` varchar(15) NOT NULL,
  `classname` varchar(100) NOT NULL,
  `damage` varchar(10000) NOT NULL,
  `type` varchar(12) NOT NULL,
  `pid` varchar(32) NOT NULL,
  `alive` tinyint(1) NOT NULL DEFAULT '1',
  `active` tinyint(1) NOT NULL DEFAULT '0',
  `plate` varchar(8) NOT NULL,
  `color` int(20) NOT NULL,
  `fuel` varchar(16) NOT NULL DEFAULT '"1"',
  PRIMARY KEY (`id`,`pid`),
  KEY `side` (`side`),
  KEY `pid` (`pid`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla altislife.vehicles: ~17 rows (aproximadamente)
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
INSERT INTO `vehicles` (`id`, `side`, `classname`, `damage`, `type`, `pid`, `alive`, `active`, `plate`, `color`, `fuel`) VALUES
	(1, 'civ', 'V_stv_Vito_ToCannabis', '"[]"', 'Car', '76561198167402365', 1, 0, '82718', 0, '"1"'),
	(2, 'civ', 'V_stv_Vito_ToCannabis', '"[]"', 'Car', '76561198167402365', 1, 0, '811181', 0, '"1"'),
	(3, 'civ', 'streetv_alfa_romeo_159_atgc1', '"[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]"', 'Car', '76561198167402365', 1, 0, '996542', 0, '1'),
	(4, 'civ', 'streetv_citroen_c4_picasso_2016_cnp1', '"[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]"', 'Car', '76561198167402365', 1, 0, '203659', 0, '1'),
	(5, 'civ', 'streetv_nissan_patrol_grs', '"[]"', 'Car', '76561198303663921', 1, 0, '41704', 0, '"1"'),
	(6, 'civ', 'V_stv_X6_Prefecture', '"[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]"', 'Car', '76561198167402365', 1, 0, '104815', 0, '1'),
	(7, 'civ', 'streetv_seat_altea_xl_cnp1', '"[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]"', 'Car', '76561198167402365', 1, 0, '311827', 0, '1'),
	(8, 'civ', 'V_stv_RS5', '"[]"', 'Car', '76561198167402365', 1, 0, '284500', 0, '"1"'),
	(9, 'civ', 'V_stv_R8', '"[]"', 'Car', '76561198167402365', 1, 0, '654182', 0, '"1"'),
	(10, 'civ', 'V_stv_R8', '"[]"', 'Car', '76561198167402365', 1, 0, '800783', 0, '"1"'),
	(11, 'civ', 'V_stv_4C', '"[]"', 'Car', '76561198167402365', 1, 0, '374366', 0, '"1"'),
	(12, 'civ', 'V_stv_RS3', '"[]"', 'Car', '76561198167402365', 1, 0, '990984', 0, '"1"'),
	(13, 'civ', 'V_stv_Cobra', '"[]"', 'Car', '76561198167402365', 1, 0, '876571', 0, '1'),
	(14, 'civ', 'streetv_citroen_c4_picasso_2016_cnp1', '"[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]"', 'Car', '76561198226931204', 1, 0, '894221', 0, '0.926326'),
	(15, 'civ', 'streetv_alfa_romeo_159_atgc1', '"[]"', 'Car', '76561198226931204', 1, 0, '416095', 0, '1'),
	(16, 'civ', 'streetv_renault_megane_ii_gc1', '"[]"', 'Car', '76561198226931204', 1, 0, '171221', 0, '1'),
	(17, 'cop', 'streetv_opel_astra_j_gc1', '"[]"', 'Car', '76561198226931204', 1, 0, '107502', 0, '1'),
	(18, 'civ', 'V_stv_Giulia_gris', '"[]"', 'Car', '76561198167402365', 1, 0, '402043', 0, '"1"'),
	(19, 'civ', 'V_stv_Giulia_gris', '"[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]"', 'Car', '76561198167402365', 1, 0, '45982', 0, '0.997086'),
	(20, 'civ', 'V_stv_Vito_rosa', '"[]"', 'Car', '76561198167402365', 1, 0, '93746', 0, '"1"'),
	(21, 'civ', 'V_stv_Sprinter_C_Laposte', '"[]"', 'Car', '76561198167402365', 1, 0, '415303', 0, '"1"'),
	(22, 'civ', 'V_stv_GT86_naranja', '"[]"', 'Car', '76561198167402365', 1, 0, '118443', 0, '"1"'),
	(23, 'civ', 'V_stv_Apollo_negro', '"[]"', 'Car', '76561198167402365', 1, 0, '626292', 0, '"1"'),
	(24, 'civ', 'V_stv_Hornet_rojo', '"[]"', 'Car', '76561198167402365', 1, 1, '706828', 0, '"1"');
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;

-- Volcando estructura para tabla altislife.wanted
CREATE TABLE IF NOT EXISTS `wanted` (
  `list` text,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla altislife.wanted: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `wanted` DISABLE KEYS */;
/*!40000 ALTER TABLE `wanted` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
