-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               10.6.4-MariaDB - mariadb.org binary distribution
-- Операционная система:         Win64
-- HeidiSQL Версия:              11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- Дамп структуры для таблица acore_world.areatable_dbc
DROP TABLE IF EXISTS `areatable_dbc`;
CREATE TABLE IF NOT EXISTS `areatable_dbc` (
  `ID` INT NOT NULL DEFAULT 0,
  `ContinentID` INT NOT NULL DEFAULT 0,
  `ParentAreaID` INT NOT NULL DEFAULT 0,
  `AreaBit` INT NOT NULL DEFAULT 0,
  `Flags` INT NOT NULL DEFAULT 0,
  `SoundProviderPref` INT NOT NULL DEFAULT 0,
  `SoundProviderPrefUnderwater` INT NOT NULL DEFAULT 0,
  `AmbienceID` INT NOT NULL DEFAULT 0,
  `ZoneMusic` INT NOT NULL DEFAULT 0,
  `IntroSound` INT NOT NULL DEFAULT 0,
  `ExplorationLevel` INT NOT NULL DEFAULT 0,
  `AreaName_Lang_enUS` varchar(100) DEFAULT NULL,
  `AreaName_Lang_enGB` varchar(100) DEFAULT NULL,
  `AreaName_Lang_koKR` varchar(100) DEFAULT NULL,
  `AreaName_Lang_frFR` varchar(100) DEFAULT NULL,
  `AreaName_Lang_deDE` varchar(100) DEFAULT NULL,
  `AreaName_Lang_enCN` varchar(100) DEFAULT NULL,
  `AreaName_Lang_zhCN` varchar(100) DEFAULT NULL,
  `AreaName_Lang_enTW` varchar(100) DEFAULT NULL,
  `AreaName_Lang_zhTW` varchar(100) DEFAULT NULL,
  `AreaName_Lang_esES` varchar(100) DEFAULT NULL,
  `AreaName_Lang_esMX` varchar(100) DEFAULT NULL,
  `AreaName_Lang_ruRU` varchar(100) DEFAULT NULL,
  `AreaName_Lang_ptPT` varchar(100) DEFAULT NULL,
  `AreaName_Lang_ptBR` varchar(100) DEFAULT NULL,
  `AreaName_Lang_itIT` varchar(100) DEFAULT NULL,
  `AreaName_Lang_Unk` varchar(100) DEFAULT NULL,
  `AreaName_Lang_Mask` INT unsigned NOT NULL DEFAULT 0,
  `FactionGroupMask` INT NOT NULL DEFAULT 0,
  `LiquidTypeID_1` INT NOT NULL DEFAULT 0,
  `LiquidTypeID_2` INT NOT NULL DEFAULT 0,
  `LiquidTypeID_3` INT NOT NULL DEFAULT 0,
  `LiquidTypeID_4` INT NOT NULL DEFAULT 0,
  `MinElevation` float NOT NULL DEFAULT 0,
  `Ambient_Multiplier` float NOT NULL DEFAULT 0,
  `Lightid` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- Дамп данных таблицы acore_world.areatable_dbc: 0 rows
DELETE FROM `areatable_dbc`;
/*!40000 ALTER TABLE `areatable_dbc` DISABLE KEYS */;
/*!40000 ALTER TABLE `areatable_dbc` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
