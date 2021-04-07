-- MySQL dump 10.13  Distrib 5.7.26, for osx10.10 (x86_64)
--
-- Host: localhost    Database: boilerplate
-- ------------------------------------------------------
-- Server version	5.7.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `assetindexdata`
--

DROP TABLE IF EXISTS `assetindexdata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assetindexdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sessionId` varchar(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `volumeId` int(11) NOT NULL,
  `uri` text COLLATE utf8_unicode_ci,
  `size` bigint(20) unsigned DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_laabdxzgrlnhidvwrjjpcgglgbirsyzyftsu` (`sessionId`,`volumeId`),
  KEY `idx_yhmhvmunsgtyvifvlnrspvhawascakyokzat` (`volumeId`),
  CONSTRAINT `fk_mxvntvqgzanywnuozpdofrqbrhuuwpijszjd` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `kind` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `size` bigint(20) unsigned DEFAULT NULL,
  `focalPoint` varchar(13) COLLATE utf8_unicode_ci DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_dihxnuopqhuzhggibgkkosccubhdurtndssy` (`filename`,`folderId`),
  KEY `idx_mxwcjnztthmazjfnjwskeblbsztsbtsngwyx` (`folderId`),
  KEY `idx_jfqckhdptrnrarerdqbhjklmmcghmrsbwtrj` (`volumeId`),
  KEY `fk_cmpfjfsxmdmwgwueecdywltwrxzunlldvyys` (`uploaderId`),
  CONSTRAINT `fk_cmpfjfsxmdmwgwueecdywltwrxzunlldvyys` FOREIGN KEY (`uploaderId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_nsjiapaogaayxuqgaxgmptsdznfozturodmb` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_pndimwowulbmhtbiqauxlypoftakbnvmsvbh` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_suvqiivlhzoxztffyvflleyuxwjobidnhygm` FOREIGN KEY (`folderId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assettransformindex`
--

DROP TABLE IF EXISTS `assettransformindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assettransformindex` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetId` int(11) NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `error` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_eejdmftpjdhpxjxpirvvtrmmgpdymwkmivfw` (`volumeId`,`assetId`,`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `assettransforms`
--

DROP TABLE IF EXISTS `assettransforms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `assettransforms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mode` enum('stretch','fit','crop') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'center-center',
  `width` int(11) unsigned DEFAULT NULL,
  `height` int(11) unsigned DEFAULT NULL,
  `format` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ruuaxrmyjgamhshjrllmbofsqubuogjfrkig` (`name`),
  KEY `idx_pdwqvmoktpoabssfrtozlhzrdjzhjvrjogax` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gdbxqqjrjcjuniditaecdkzluppzydphtlpr` (`groupId`),
  KEY `fk_wrfkpqbejkdhqekbkrtvrnvwufibwtioaaak` (`parentId`),
  CONSTRAINT `fk_gblsiyrclkomdyymzonceaxlrlixrxhxqtgy` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qkcghhtdufiisdpiddnwpycvwdnmgobxwmva` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_wrfkpqbejkdhqekbkrtvrnvwufibwtioaaak` FOREIGN KEY (`parentId`) REFERENCES `categories` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups`
--

DROP TABLE IF EXISTS `categorygroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_hjuboonpgflacioqsnddvzdrlxwjmebpoljp` (`name`),
  KEY `idx_qqavjosgowrygdpriuixivpoepmfuohsicgn` (`handle`),
  KEY `idx_eqnorxvxdvqeyluxexbaayeqhhhsmyfxhkau` (`structureId`),
  KEY `idx_gokcrsznbwotdemejdtarjghdopbloplpipn` (`fieldLayoutId`),
  KEY `idx_gbakeznivwkouqbnwaqbdzelzrciifqxgfwz` (`dateDeleted`),
  CONSTRAINT `fk_sevtrpllochffxgwjudpjluyouirisruzsfv` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_umujnzdefqralvivderfnqsnzxxcuubgphha` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `categorygroups_sites`
--

DROP TABLE IF EXISTS `categorygroups_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorygroups_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text COLLATE utf8_unicode_ci,
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_giqradgkbljxyufyumlpqmnbkzfosxtxodpw` (`groupId`,`siteId`),
  KEY `idx_dzxdcpfbosmhxeltcvcdbeudtpcxkvapptzf` (`siteId`),
  CONSTRAINT `fk_crpirxirteyylkavzndeziwksopauubphyis` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_sfdhbvjmbwyzynkxpxeccmhveezhtarqavxx` FOREIGN KEY (`groupId`) REFERENCES `categorygroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedattributes`
--

DROP TABLE IF EXISTS `changedattributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  KEY `idx_cutcxxcxddjgcwnwpjzblafrwlnntknxsbnt` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_towronnxshqqfdacboejkgsezlivhsushswy` (`siteId`),
  KEY `fk_poffwldqmhofeuvirssuiirzxcspxhklxfwy` (`userId`),
  CONSTRAINT `fk_dlctfmuvkhmvlyxatkuluzxzrkfzzfqaoxsu` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_poffwldqmhofeuvirssuiirzxcspxhklxfwy` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_towronnxshqqfdacboejkgsezlivhsushswy` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `changedfields`
--

DROP TABLE IF EXISTS `changedfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  KEY `idx_mwwzspefvyemjmqxjvdlozkhayzxhildatek` (`elementId`,`siteId`,`dateUpdated`),
  KEY `fk_tabpsddiusdomhjpjmvfdegglsjlwyyeuwyc` (`siteId`),
  KEY `fk_ejlrnkpgqysxsyeumpzgbwtawvddclmbsecr` (`fieldId`),
  KEY `fk_etomixberqdbwzgczlliaweobyfiaqzkdkxj` (`userId`),
  CONSTRAINT `fk_ejlrnkpgqysxsyeumpzgbwtawvddclmbsecr` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_etomixberqdbwzgczlliaweobyfiaqzkdkxj` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_lzrjmvbysdhtgvfejjkmzlumysrqagxzyang` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tabpsddiusdomhjpjmvfdegglsjlwyyeuwyc` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `field_address` text COLLATE utf8_unicode_ci,
  `field_email` text COLLATE utf8_unicode_ci,
  `field_phoneNumber` text COLLATE utf8_unicode_ci,
  `field_backgroundColor` text COLLATE utf8_unicode_ci,
  `field_topSpacing` text COLLATE utf8_unicode_ci,
  `field_bottomSpacing` text COLLATE utf8_unicode_ci,
  `field_seo` text COLLATE utf8_unicode_ci,
  `field_pageSummary` text COLLATE utf8_unicode_ci,
  `field_copy` text COLLATE utf8_unicode_ci,
  `field_header` text COLLATE utf8_unicode_ci,
  `field_googleAnalytics` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_erjsjswwwhpelqdipbiitxhtkcrczepiqpba` (`elementId`,`siteId`),
  KEY `idx_grzumsbgbjygofwklncjpmqqcjqhedqnzbtx` (`siteId`),
  KEY `idx_jgzfucwmitgeppdnqxhnsmripyjbqrecgqfw` (`title`),
  CONSTRAINT `fk_gnqqsygrmhqhbablwtzooshmcrnxdwfvtoel` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_xeuprthoalggqwzokjhdxvmczvkmbksyujnf` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=176 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `craftidtokens`
--

DROP TABLE IF EXISTS `craftidtokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `craftidtokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `accessToken` text COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_fcckgsnhrivhvajlxxwcygqvbojtbbjkmtlk` (`userId`),
  CONSTRAINT `fk_fcckgsnhrivhvajlxxwcygqvbojtbbjkmtlk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deprecationerrors`
--

DROP TABLE IF EXISTS `deprecationerrors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deprecationerrors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fingerprint` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `line` smallint(6) unsigned DEFAULT NULL,
  `message` text COLLATE utf8_unicode_ci,
  `traces` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_yuixrlobnrbornzscuuygcuzxkthbkahybjz` (`key`,`fingerprint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drafts`
--

DROP TABLE IF EXISTS `drafts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `drafts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL,
  `saved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `idx_jjbbueyfnyjppzisennoqnyvlddfnawvdhss` (`saved`),
  KEY `fk_gfyyuyyqiuijcgljewxqrumrbrmulsmasfdp` (`creatorId`),
  KEY `fk_nughrazogqpbnbgvvawgroekhpwdlatpfwkc` (`sourceId`),
  CONSTRAINT `fk_gfyyuyyqiuijcgljewxqrumrbrmulsmasfdp` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_nughrazogqpbnbgvvawgroekhpwdlatpfwkc` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elementindexsettings`
--

DROP TABLE IF EXISTS `elementindexsettings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elementindexsettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xlybqrcajntafqwksaoexgeoacrginbiemiu` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_yedstabelyuyifgwvzpdqnacsyxznjelqdow` (`dateDeleted`),
  KEY `idx_mfajdaqdegvrsxijudbxylxsyjznmmqwsqrd` (`fieldLayoutId`),
  KEY `idx_tgobzothlbqnjigjinnbvidwollrvzpecgwk` (`type`),
  KEY `idx_mnwstaelqzjwnsgdpxipscrbqsmmghhgxrgj` (`enabled`),
  KEY `idx_avntrecoelshuxwujxhremuzcosvhruysumr` (`archived`,`dateCreated`),
  KEY `idx_birkrdolxwiwgqkgxzqjndltauvxflzptjoi` (`archived`,`dateDeleted`,`draftId`,`revisionId`),
  KEY `fk_znnqpfqjxzuplvqslaxozmlpdawycxxpkwbw` (`draftId`),
  KEY `fk_xmmcnvxcwrcjywdxjbtovluaxkibwebocnak` (`revisionId`),
  CONSTRAINT `fk_imykzbudumqoombogltngmdoonnebppjvqus` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_xmmcnvxcwrcjywdxjbtovluaxkibwebocnak` FOREIGN KEY (`revisionId`) REFERENCES `revisions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_znnqpfqjxzuplvqslaxozmlpdawycxxpkwbw` FOREIGN KEY (`draftId`) REFERENCES `drafts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `elements_sites`
--

DROP TABLE IF EXISTS `elements_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elements_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_iaggsybtlhaytndutvvzimwjvrowdylrlqdx` (`elementId`,`siteId`),
  KEY `idx_bjzaobxzhnwidbpyubtypcjxjpltcmoidoac` (`siteId`),
  KEY `idx_lnqcysmehotlrqvwazcywiehzwmskadkuuau` (`slug`,`siteId`),
  KEY `idx_mdwqahudqeibyuzlenafgfhawhlhqnodzvtq` (`enabled`),
  KEY `idx_yshtrodipoiqhmxgmkrhtobyudvfucoeaiza` (`uri`,`siteId`),
  CONSTRAINT `fk_dahttmxsviljaepztwgquuaygcrplbnrgfct` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_uoeabfeowxltshipatzspwzbawwxjyusdlru` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_aghbfwxmreftopvreaqtwgufmhuygmhnngam` (`postDate`),
  KEY `idx_jkgvtnxlwspxjdmjkfhleplddmaapbenepjz` (`expiryDate`),
  KEY `idx_njftwrgbjdszbpibryovhppstfzbnddriyug` (`authorId`),
  KEY `idx_qlxdcdkjkkozlqaocxnyykpevmluyludoewz` (`sectionId`),
  KEY `idx_lzgqqveakmjroqnuessyvdgntydmtqfsrjeb` (`typeId`),
  KEY `fk_gsylutfeyovkdwcvqxavajenowuizdsymuze` (`parentId`),
  CONSTRAINT `fk_emlokmautbiauxszhvgcecbvdzkwhumqyjhq` FOREIGN KEY (`typeId`) REFERENCES `entrytypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_gsylutfeyovkdwcvqxavajenowuizdsymuze` FOREIGN KEY (`parentId`) REFERENCES `entries` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_hqitvguumkjjlbicwchdegdefsmkyxgydplz` FOREIGN KEY (`authorId`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_kuzgoonaxxsoyczfxsayqkqxwslcrzlplwkp` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_oxcpsvlutcmhzpabzsdqcpzzbpdtxetqljtu` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `entrytypes`
--

DROP TABLE IF EXISTS `entrytypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrytypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleTranslationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8_unicode_ci,
  `titleFormat` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_szpcltscmvebvzhdxmrejqjjthwtcbyloacl` (`name`,`sectionId`),
  KEY `idx_wlsrlcihopmwmgbfftwujocirnrqexsuzgrk` (`handle`,`sectionId`),
  KEY `idx_wcxlhbkvchrsodbzogzeawbnbdvbyrwvfzfz` (`sectionId`),
  KEY `idx_dtetemrpilqfuiueoyyxsvevmgroihxjnrhd` (`fieldLayoutId`),
  KEY `idx_ugzaamuitabwpxfzkoihzvzzswgpjkbphljx` (`dateDeleted`),
  CONSTRAINT `fk_bexbvpbtqfsrbxojmnrbtytstyccspepodxq` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_ichiyumzewrksnjojbehulqmjdbzlcxabycl` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldgroups`
--

DROP TABLE IF EXISTS `fieldgroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldgroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ahabxccgceyirgscvubrhjutedhcnotpeknk` (`name`),
  KEY `idx_hvrhoiiikorgiuwnvgrbfsomqslzsifgwxtq` (`dateDeleted`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayoutfields`
--

DROP TABLE IF EXISTS `fieldlayoutfields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayoutfields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wlcbhmxrqizbeglfuifneaurqdbsemupfwzj` (`layoutId`,`fieldId`),
  KEY `idx_hfoketdhkluiearohtajxexekhtsczfpbqqi` (`sortOrder`),
  KEY `idx_trmrxspqrtadfbeyrkiduatoejsuyihsuznc` (`tabId`),
  KEY `idx_bxtmlyiekmxhhpywzmgevothxwegldatfjsu` (`fieldId`),
  CONSTRAINT `fk_mziubznvyhtxwisstdaaqjvdchsocashfobp` FOREIGN KEY (`tabId`) REFERENCES `fieldlayouttabs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_noifvfeiaffgbeipfopgordbupocfllcntva` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nyedxyyrxtxvxdqjtqbvjjqavrdbsrnnbith` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouts`
--

DROP TABLE IF EXISTS `fieldlayouts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rqpyyuwomzcubwvlihlaidvkiqpvnioxlfto` (`dateDeleted`),
  KEY `idx_sejzupargylkuybictbhoekhegctsvsmvwsj` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fieldlayouttabs`
--

DROP TABLE IF EXISTS `fieldlayouttabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fieldlayouttabs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `elements` text COLLATE utf8_unicode_ci,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_cjgfsxmqxwdyzdtrrcaoulhtaxrfunnuqkqp` (`sortOrder`),
  KEY `idx_ayhgjjiwqbbcxkghwytwngtqqeiwufeulrpy` (`layoutId`),
  CONSTRAINT `fk_mrudunugjpcicynunzvylyythzgbhatptoxd` FOREIGN KEY (`layoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `context` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'global',
  `instructions` text COLLATE utf8_unicode_ci,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'none',
  `translationKeyFormat` text COLLATE utf8_unicode_ci,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_dzalhemsfjfintfjvecqzykuyxmoobepnlub` (`handle`,`context`),
  KEY `idx_vkiyjgwtxmrmdprxexfftdcqimoptjsygqcp` (`groupId`),
  KEY `idx_ovvzljdzvtbxrvlvcuaaughifspgzclfbhro` (`context`),
  CONSTRAINT `fk_kyatzscyszztfbramdoelvqqrjihvhvizqgm` FOREIGN KEY (`groupId`) REFERENCES `fieldgroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `freeform_crm_fields`
--

DROP TABLE IF EXISTS `freeform_crm_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `freeform_crm_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `integrationId` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `required` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `freeform_crm_fields_type_idx` (`type`),
  KEY `freeform_crm_fields_integrationId_fk` (`integrationId`),
  CONSTRAINT `freeform_crm_fields_integrationId_fk` FOREIGN KEY (`integrationId`) REFERENCES `freeform_integrations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `freeform_export_profiles`
--

DROP TABLE IF EXISTS `freeform_export_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `freeform_export_profiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `formId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `limit` int(11) DEFAULT NULL,
  `dateRange` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rangeStart` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rangeEnd` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fields` text COLLATE utf8_unicode_ci NOT NULL,
  `filters` text COLLATE utf8_unicode_ci,
  `statuses` text COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `freeform_export_profiles_formId_fk` (`formId`),
  CONSTRAINT `freeform_export_profiles_formId_fk` FOREIGN KEY (`formId`) REFERENCES `freeform_forms` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `freeform_export_settings`
--

DROP TABLE IF EXISTS `freeform_export_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `freeform_export_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `setting` mediumtext COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `freeform_export_settings_userId_fk` (`userId`),
  CONSTRAINT `freeform_export_settings_userId_fk` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `freeform_feed_messages`
--

DROP TABLE IF EXISTS `freeform_feed_messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `freeform_feed_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `feedId` int(11) NOT NULL,
  `message` text COLLATE utf8_unicode_ci NOT NULL,
  `conditions` text COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT '0',
  `issueDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `freeform_feed_messages_feedId_fk` (`feedId`),
  CONSTRAINT `freeform_feed_messages_feedId_fk` FOREIGN KEY (`feedId`) REFERENCES `freeform_feeds` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `freeform_feeds`
--

DROP TABLE IF EXISTS `freeform_feeds`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `freeform_feeds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `min` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `max` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `issueDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `freeform_feeds_hash_unq_idx` (`hash`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `freeform_fields`
--

DROP TABLE IF EXISTS `freeform_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `freeform_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `required` tinyint(1) DEFAULT '0',
  `instructions` text COLLATE utf8_unicode_ci,
  `metaProperties` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `handle` (`handle`),
  KEY `freeform_fields_type_idx` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `freeform_forms`
--

DROP TABLE IF EXISTS `freeform_forms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `freeform_forms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `spamBlockCount` int(11) unsigned NOT NULL DEFAULT '0',
  `submissionTitleFormat` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `layoutJson` mediumtext COLLATE utf8_unicode_ci,
  `returnUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `defaultStatus` int(11) unsigned DEFAULT NULL,
  `formTemplateId` int(11) unsigned DEFAULT NULL,
  `color` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `optInDataStorageTargetHash` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `limitFormSubmissions` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extraPostUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extraPostTriggerPhrase` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `gtmEnabled` tinyint(1) DEFAULT '0',
  `gtmId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gtmEventName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `handle` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `freeform_integrations`
--

DROP TABLE IF EXISTS `freeform_integrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `freeform_integrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `accessToken` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `forceUpdate` tinyint(1) DEFAULT '0',
  `lastUpdate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `handle` (`handle`),
  KEY `freeform_integrations_type_idx` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `freeform_integrations_queue`
--

DROP TABLE IF EXISTS `freeform_integrations_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `freeform_integrations_queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `submissionId` int(11) NOT NULL,
  `integrationType` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `fieldHash` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `freeform_integrations_queue_status_idx` (`status`),
  KEY `freeform_integrations_queue_submissionId_fk` (`submissionId`),
  CONSTRAINT `freeform_integrations_queue_id_fk` FOREIGN KEY (`id`) REFERENCES `freeform_mailing_list_fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `freeform_integrations_queue_submissionId_fk` FOREIGN KEY (`submissionId`) REFERENCES `freeform_submissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `freeform_lock`
--

DROP TABLE IF EXISTS `freeform_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `freeform_lock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `freeform_lock_key_dateCreated_idx` (`key`,`dateCreated`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `freeform_mailing_list_fields`
--

DROP TABLE IF EXISTS `freeform_mailing_list_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `freeform_mailing_list_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mailingListId` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `required` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `freeform_mailing_list_fields_type_idx` (`type`),
  KEY `freeform_mailing_list_fields_mailingListId_fk` (`mailingListId`),
  CONSTRAINT `freeform_mailing_list_fields_mailingListId_fk` FOREIGN KEY (`mailingListId`) REFERENCES `freeform_mailing_lists` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `freeform_mailing_lists`
--

DROP TABLE IF EXISTS `freeform_mailing_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `freeform_mailing_lists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `integrationId` int(11) NOT NULL,
  `resourceId` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `memberCount` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `freeform_mailing_lists_integrationId_resourceId_unq_idx` (`integrationId`,`resourceId`),
  CONSTRAINT `freeform_mailing_lists_integrationId_fk` FOREIGN KEY (`integrationId`) REFERENCES `freeform_integrations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `freeform_notification_log`
--

DROP TABLE IF EXISTS `freeform_notification_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `freeform_notification_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `freeform_notification_log_type_dateCreated_idx` (`type`,`dateCreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `freeform_notifications`
--

DROP TABLE IF EXISTS `freeform_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `freeform_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `fromName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fromEmail` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `replyToName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `replyToEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bcc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bodyHtml` text COLLATE utf8_unicode_ci,
  `bodyText` text COLLATE utf8_unicode_ci,
  `autoText` tinyint(1) NOT NULL DEFAULT '1',
  `includeAttachments` tinyint(1) DEFAULT '1',
  `presetAssets` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `handle` (`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `freeform_payment_gateway_fields`
--

DROP TABLE IF EXISTS `freeform_payment_gateway_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `freeform_payment_gateway_fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `integrationId` int(11) NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `required` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `freeform_payment_gateway_fields_type_idx` (`type`),
  KEY `freeform_payment_gateway_fields_integrationId_fk` (`integrationId`),
  CONSTRAINT `freeform_payment_gateway_fields_integrationId_fk` FOREIGN KEY (`integrationId`) REFERENCES `freeform_integrations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `freeform_payments_payments`
--

DROP TABLE IF EXISTS `freeform_payments_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `freeform_payments_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `integrationId` int(11) NOT NULL,
  `submissionId` int(11) NOT NULL,
  `subscriptionId` int(11) DEFAULT NULL,
  `resourceId` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last4` smallint(6) DEFAULT NULL,
  `status` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `metadata` mediumtext COLLATE utf8_unicode_ci,
  `errorCode` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `errorMessage` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `freeform_payments_payments_integrationId_resourceId_unq_idx` (`integrationId`,`resourceId`),
  KEY `freeform_payments_payments_submissionId_fk` (`submissionId`),
  KEY `freeform_payments_payments_subscriptionId_fk` (`subscriptionId`),
  CONSTRAINT `freeform_payments_payments_integrationId_fk` FOREIGN KEY (`integrationId`) REFERENCES `freeform_integrations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `freeform_payments_payments_submissionId_fk` FOREIGN KEY (`submissionId`) REFERENCES `freeform_submissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `freeform_payments_payments_subscriptionId_fk` FOREIGN KEY (`subscriptionId`) REFERENCES `freeform_payments_subscriptions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `freeform_payments_subscription_plans`
--

DROP TABLE IF EXISTS `freeform_payments_subscription_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `freeform_payments_subscription_plans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `integrationId` int(11) NOT NULL,
  `resourceId` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `freeform_payments_subscription_plans_integrationId_fk` (`integrationId`),
  CONSTRAINT `freeform_payments_subscription_plans_integrationId_fk` FOREIGN KEY (`integrationId`) REFERENCES `freeform_integrations` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `freeform_payments_subscriptions`
--

DROP TABLE IF EXISTS `freeform_payments_subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `freeform_payments_subscriptions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `integrationId` int(11) NOT NULL,
  `submissionId` int(11) NOT NULL,
  `planId` int(11) NOT NULL,
  `resourceId` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` float DEFAULT NULL,
  `currency` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `interval` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `intervalCount` smallint(6) DEFAULT NULL,
  `last4` smallint(6) DEFAULT NULL,
  `status` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `metadata` mediumtext COLLATE utf8_unicode_ci,
  `errorCode` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `errorMessage` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `freeform_payments_subscriptions_integrationId_resourceId_unq_idx` (`integrationId`,`resourceId`),
  KEY `freeform_payments_subscriptions_submissionId_fk` (`submissionId`),
  KEY `freeform_payments_subscriptions_planId_fk` (`planId`),
  CONSTRAINT `freeform_payments_subscriptions_integrationId_fk` FOREIGN KEY (`integrationId`) REFERENCES `freeform_integrations` (`id`) ON DELETE CASCADE,
  CONSTRAINT `freeform_payments_subscriptions_planId_fk` FOREIGN KEY (`planId`) REFERENCES `freeform_payments_subscription_plans` (`id`) ON DELETE CASCADE,
  CONSTRAINT `freeform_payments_subscriptions_submissionId_fk` FOREIGN KEY (`submissionId`) REFERENCES `freeform_submissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `freeform_spam_reason`
--

DROP TABLE IF EXISTS `freeform_spam_reason`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `freeform_spam_reason` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `submissionId` int(11) NOT NULL,
  `reasonType` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `reasonMessage` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `freeform_spam_reason_submissionId_reasonType_idx` (`submissionId`,`reasonType`),
  CONSTRAINT `freeform_spam_reason_submissionId_fk` FOREIGN KEY (`submissionId`) REFERENCES `freeform_submissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `freeform_statuses`
--

DROP TABLE IF EXISTS `freeform_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `freeform_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `color` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isDefault` tinyint(1) DEFAULT NULL,
  `sortOrder` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `handle` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `freeform_submission_notes`
--

DROP TABLE IF EXISTS `freeform_submission_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `freeform_submission_notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `submissionId` int(11) NOT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `freeform_submission_notes_submissionId_fk` (`submissionId`),
  CONSTRAINT `freeform_submission_notes_submissionId_fk` FOREIGN KEY (`submissionId`) REFERENCES `freeform_submissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `freeform_submissions`
--

DROP TABLE IF EXISTS `freeform_submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `freeform_submissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `incrementalId` int(11) NOT NULL,
  `statusId` int(11) DEFAULT NULL,
  `formId` int(11) NOT NULL,
  `token` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ip` varchar(46) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isSpam` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `field_1` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_2` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_3` text COLLATE utf8_unicode_ci,
  `field_4` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_5` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_6` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_7` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_8` text COLLATE utf8_unicode_ci,
  `field_9` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_10` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_11` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_12` text COLLATE utf8_unicode_ci,
  `field_13` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `field_14` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `freeform_submissions_incrementalId_unq_idx` (`incrementalId`),
  UNIQUE KEY `freeform_submissions_token_unq_idx` (`token`),
  KEY `freeform_submissions_formId_fk` (`formId`),
  KEY `freeform_submissions_statusId_fk` (`statusId`),
  CONSTRAINT `freeform_submissions_formId_fk` FOREIGN KEY (`formId`) REFERENCES `freeform_forms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `freeform_submissions_id_fk` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `freeform_submissions_statusId_fk` FOREIGN KEY (`statusId`) REFERENCES `freeform_statuses` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `freeform_unfinalized_files`
--

DROP TABLE IF EXISTS `freeform_unfinalized_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `freeform_unfinalized_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assetId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `freeform_webhooks`
--

DROP TABLE IF EXISTS `freeform_webhooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `freeform_webhooks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `webhook` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `freeform_webhooks_type_idx` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `freeform_webhooks_form_relations`
--

DROP TABLE IF EXISTS `freeform_webhooks_form_relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `freeform_webhooks_form_relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `webhookId` int(11) NOT NULL,
  `formId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `freeform_webhooks_form_relations_webhookId_idx` (`webhookId`),
  KEY `freeform_webhooks_form_relations_formId_idx` (`formId`),
  CONSTRAINT `freeform_webhooks_form_relations_formId_fk` FOREIGN KEY (`formId`) REFERENCES `freeform_forms` (`id`) ON DELETE CASCADE,
  CONSTRAINT `freeform_webhooks_form_relations_webhookId_fk` FOREIGN KEY (`webhookId`) REFERENCES `freeform_webhooks` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `globalsets`
--

DROP TABLE IF EXISTS `globalsets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `globalsets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_llhvpmwqahoepcqrhbifzqnomwhpwzcmdfxm` (`name`),
  KEY `idx_seogndgwavpzxcoltpaerzptwapfyjfhkwal` (`handle`),
  KEY `idx_fljwycbjetqqzsubsxvmhjxnnffdwnicwrxz` (`fieldLayoutId`),
  CONSTRAINT `fk_naqbpsiuqjdxufnqekzjlxjonijjmnuzmbez` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nekpxirghoxroskgxpmrdsenfocbqxexomqr` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqlschemas`
--

DROP TABLE IF EXISTS `gqlschemas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqlschemas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `scope` text COLLATE utf8_unicode_ci,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gqltokens`
--

DROP TABLE IF EXISTS `gqltokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gqltokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `accessToken` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xajymbiokzjesemztxaaptelrchdsiqpvbxj` (`accessToken`),
  UNIQUE KEY `idx_jipmefvtdxzuylnjboqnilriywjciintrqvz` (`name`),
  KEY `fk_qwystkljanxcrftblfgxndylljmdlymdebmm` (`schemaId`),
  CONSTRAINT `fk_qwystkljanxcrftblfgxndylljmdlymdebmm` FOREIGN KEY (`schemaId`) REFERENCES `gqlschemas` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configVersion` char(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `fieldVersion` char(12) COLLATE utf8_unicode_ci NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocks`
--

DROP TABLE IF EXISTS `matrixblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_lftdthxezbwspzjmuaejohuypblssqkyxwaq` (`ownerId`),
  KEY `idx_npxoejyoojiccdiakthdyxpcfybicspqsbvh` (`fieldId`),
  KEY `idx_xbcqwpzwndcyugbujmocgsqgidkbkembbhtg` (`typeId`),
  KEY `idx_tedlmdqbmphqtzbgruvwkqfqbkxfdvdpbsct` (`sortOrder`),
  CONSTRAINT `fk_aerizozxeizezjkjxkngqbpsdvbwliwprgtr` FOREIGN KEY (`typeId`) REFERENCES `matrixblocktypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_eumwcjlsujzfntfvgevvybytstmdwlwgqjzd` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ickvlkohmkmvfxnimdodnfuvbttyxfqnquue` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_srclilzezhwfvuaonzjlixsebulnqoaireph` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixblocktypes`
--

DROP TABLE IF EXISTS `matrixblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_frdunekaxcgwljmgeqzdnzbkthpohagdxceu` (`name`,`fieldId`),
  KEY `idx_dntavkadnkmvckcopjmgvkpmazudmpnecemn` (`handle`,`fieldId`),
  KEY `idx_xkgonbaqfxggrrekejrjsvumpjsezkqezefh` (`fieldId`),
  KEY `idx_inkvcpdgagfnhjufuqvctzwmabltqrvhovff` (`fieldLayoutId`),
  CONSTRAINT `fk_drdfivzzpulxqjqhmqfcnqwdyncfenjluqnt` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mjexituyjjelghqxszlokhntkwxlsmwawyjd` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixcontent_accordionmatrix`
--

DROP TABLE IF EXISTS `matrixcontent_accordionmatrix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixcontent_accordionmatrix` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `field_item_question` text COLLATE utf8_unicode_ci,
  `field_item_answer` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_yhnmrdfpkkxjkqwjzyxeqshiefykrmwjavpj` (`elementId`,`siteId`),
  KEY `fk_proovyvgebwsgvznmqkxpzpajvmamfmgqcap` (`siteId`),
  CONSTRAINT `fk_kwlqlzzsfrjobusdhacmyopbrchhyvmtwqzl` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_proovyvgebwsgvznmqkxpzpajvmamfmgqcap` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixcontent_button`
--

DROP TABLE IF EXISTS `matrixcontent_button`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixcontent_button` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `field_internalLink_buttonTitle` text COLLATE utf8_unicode_ci,
  `field_externalLink_buttonLink` text COLLATE utf8_unicode_ci,
  `field_externalLink_buttonTitle` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_axvhewmxyncukolcsvpmwjixiprfebmxtrtv` (`elementId`,`siteId`),
  KEY `fk_pfrwavnjavgqzdwjwyfnekldzhkshyrcifmq` (`siteId`),
  CONSTRAINT `fk_pfrwavnjavgqzdwjwyfnekldzhkshyrcifmq` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_twamasogmjzcnaaadnirgtzcuvrdxaxglccs` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `matrixcontent_video`
--

DROP TABLE IF EXISTS `matrixcontent_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matrixcontent_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `field_externalVideo_video` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_kgllpfigureqcilomqzdguwueomngffbjtyw` (`elementId`,`siteId`),
  KEY `fk_njsnnemkyeyihfkchyoaniarlcjgjlupidbo` (`siteId`),
  CONSTRAINT `fk_njsnnemkyeyihfkchyoaniarlcjgjlupidbo` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_pthprjzfnucpzmjunudnmelseyikinrijiar` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `track` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_mlwelucbedymgznynbodbaffaosifqdswrst` (`track`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=282 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `navigation_navs`
--

DROP TABLE IF EXISTS `navigation_navs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `navigation_navs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `instructions` text COLLATE utf8_unicode_ci,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `propagateNodes` tinyint(1) DEFAULT '0',
  `maxNodes` int(11) DEFAULT NULL,
  `permissions` text COLLATE utf8_unicode_ci,
  `siteSettings` text COLLATE utf8_unicode_ci,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_gczmzdhyulmdlrcunfruwqadcffuuexdvqxs` (`handle`),
  KEY `idx_bycvxsuwbzehfjfiqftvjstrrhbrecojvvgh` (`structureId`),
  KEY `idx_vrziyfhyleomqnzadvmanbxurrzpizpomssv` (`fieldLayoutId`),
  KEY `idx_rysujuqpkdbkgbiqofoygbpchqckeubgwirf` (`dateDeleted`),
  CONSTRAINT `fk_pdwfjbtvncnqedeoooulupqwsfdkzwyjhhsi` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zavyzvavdasiiccibentsyqdokzlozqiuoza` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `navigation_nodes`
--

DROP TABLE IF EXISTS `navigation_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `navigation_nodes` (
  `id` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `navId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `classes` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `urlSuffix` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `customAttributes` text COLLATE utf8_unicode_ci,
  `data` text COLLATE utf8_unicode_ci,
  `newWindow` tinyint(1) DEFAULT '0',
  `deletedWithNav` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_akcrfagoyyyjpbgkqtxdiyvyajpenmpcambv` (`navId`),
  KEY `fk_dpzujqhpyrznydehbkwztikalovgcfyronao` (`elementId`),
  CONSTRAINT `fk_agidrtlwgasqzvdkeleuseekruoucvgwtaxv` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_crtoacfgirvqjbyisdzkjjfywmzzafkjuyje` FOREIGN KEY (`navId`) REFERENCES `navigation_navs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_dpzujqhpyrznydehbkwztikalovgcfyronao` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `neoblocks`
--

DROP TABLE IF EXISTS `neoblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `neoblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `ownerSiteId` int(11) DEFAULT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_beyldeapxzyjjfydinukccffizihkjmajugj` (`ownerId`),
  KEY `idx_afxbkrvvpzncalpvbmhzzwechdobgwndmyac` (`ownerSiteId`),
  KEY `idx_posofkvdeaqhzykwzsoezeahrpskfwahtxyn` (`fieldId`),
  KEY `idx_ezkmgvnmdqdzivhskkurxvpzixsiklmkeuyj` (`typeId`),
  CONSTRAINT `fk_cnqymsbqlsajqjgimqxfkeecvmwcyfjgrqij` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_daanxpflniqifncthkheozmtbarbrijmagnt` FOREIGN KEY (`typeId`) REFERENCES `neoblocktypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_lcslgennozdjpupcsbmnbhrfdkgarqwoztxl` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_llkzmewldsarmscpqqhmdonnqilyhcifqkqy` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_xyzihuxijrjzxmyohqnulfwrakgxjceazhnk` FOREIGN KEY (`ownerSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `neoblockstructures`
--

DROP TABLE IF EXISTS `neoblockstructures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `neoblockstructures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `ownerSiteId` int(11) DEFAULT NULL,
  `fieldId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_nhfocbtcgbtvyfqosofhubplmmzakaahvjtc` (`structureId`),
  KEY `idx_yhjwnzcnuafkxzlupnvdhnlkryvgljreokmr` (`ownerId`),
  KEY `idx_pfgrdhunkzkqxaerwejecrvwwqwiytkljkrs` (`ownerSiteId`),
  KEY `idx_smndsswybtcaubkfbdnianaaknokopyuytzr` (`fieldId`),
  CONSTRAINT `fk_gxwvfzwxwzyikymvhrzwwffubdlsptkvtsra` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_imljrxbnzutwmcdnluuhyrploxsneuetuhtp` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sfwvdtgbenngjeqppaezixlckgqkemtrxlda` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sormselproulfbzyiclluwcwowtefftztwrv` FOREIGN KEY (`ownerSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `neoblocktypegroups`
--

DROP TABLE IF EXISTS `neoblocktypegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `neoblocktypegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_vihibdwivffqitgaepyausbtzoeiljpvpvlv` (`name`,`fieldId`),
  KEY `idx_ogbosffuufqipbdpozswzoqtreqlgnjamwsl` (`fieldId`),
  CONSTRAINT `fk_tktbxrqenzrcsceccigyoghvesxbpmphfjxt` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `neoblocktypes`
--

DROP TABLE IF EXISTS `neoblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `neoblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `maxBlocks` smallint(6) unsigned DEFAULT NULL,
  `maxSiblingBlocks` smallint(6) unsigned DEFAULT '0',
  `maxChildBlocks` smallint(6) unsigned DEFAULT NULL,
  `childBlocks` text COLLATE utf8_unicode_ci,
  `topLevel` tinyint(1) NOT NULL DEFAULT '1',
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_lwwtzfrygstrjaleuiifqtyyhzgwloaufcob` (`handle`,`fieldId`),
  KEY `idx_ozrfppvdpaiolkdndpiagqjuqccnfmepfxbh` (`name`,`fieldId`),
  KEY `idx_bvvfllbzjybgizypqmzltgpsfptfktqehrov` (`fieldId`),
  KEY `idx_xwaijsbkzadsxaoyxxyreedauvpkmxefyxzj` (`fieldLayoutId`),
  CONSTRAINT `fk_qpfgafrmrxgfftavntyhlopixliphtccacfa` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_uvmfnhwflbjufjkmiesgxhafsxfyopoxlkba` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `plugins`
--

DROP TABLE IF EXISTS `plugins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plugins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `schemaVersion` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `licenseKeyStatus` enum('valid','trial','invalid','mismatched','astray','unknown') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_safcbljttmhiotwbnfmcnfjfxdeabdcaivkz` (`handle`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projectconfig`
--

DROP TABLE IF EXISTS `projectconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectconfig` (
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `value` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `projectconfignames`
--

DROP TABLE IF EXISTS `projectconfignames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `projectconfignames` (
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `channel` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) unsigned NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `idx_tizdkonjgbkpfjltylcrrvcytafvzrdqfttu` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  KEY `idx_zftexwixzmbulwvrhzklbdrxtfbsjoonlgev` (`channel`,`fail`,`timeUpdated`,`delay`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ftcsatbatssvfblhdujnarfgehrafslrvnbl` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  KEY `idx_eevoydwiatxgkwzaxxudixlasnaadnnydubv` (`sourceId`),
  KEY `idx_aepjianircugqyrbvirrtioonuqeupghhukn` (`targetId`),
  KEY `idx_svrpsjnnlhrlvycckcpnmyhrtcwxrofzcxpp` (`sourceSiteId`),
  CONSTRAINT `fk_anowszwkafifqwdafpbaurxezvqfvdxpkjkv` FOREIGN KEY (`sourceSiteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_clcbvagrcggoowtdgikkiqzythhuqrfbfitb` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_dtbortvfgzpvcgvjeghkrxmztmoiwmwxggts` FOREIGN KEY (`targetId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_mtlssbjzoatxgfpldbgrgzcbikocoxccrrbr` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `resourcepaths`
--

DROP TABLE IF EXISTS `resourcepaths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resourcepaths` (
  `hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`hash`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `revisions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sourceId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dcarzbxlitxfeoxselvvlhoydqvpnetsjysb` (`sourceId`,`num`),
  KEY `fk_miuzsxpjnczvgnfydsfkzwtroaekmairkowy` (`creatorId`),
  CONSTRAINT `fk_miuzsxpjnczvgnfydsfkzwtroaekmairkowy` FOREIGN KEY (`creatorId`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_mnoarenuzznsqlvymhpzfynfpsalstwvvoqq` FOREIGN KEY (`sourceId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `searchindex`
--

DROP TABLE IF EXISTS `searchindex`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`),
  FULLTEXT KEY `idx_cgxhezebbmxkovqxbsgzuvbogdxldsanhima` (`keywords`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('single','channel','structure') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'all',
  `previewTargets` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_abzpqkfxoqjvwgmvaqulrdrxsjuiogwjozyt` (`handle`),
  KEY `idx_mwbjjdhdfkamwtqbbqdxzppgofyeghaerujb` (`name`),
  KEY `idx_ntjmxakyusutufoihzyfsportvyfqfyexizn` (`structureId`),
  KEY `idx_obygnpvpsnuaocsnwbleasjqcqzsoejfqwey` (`dateDeleted`),
  CONSTRAINT `fk_ysudframbytuoqhzmpbcwpfhnxdwbkjjxzbm` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sections_sites`
--

DROP TABLE IF EXISTS `sections_sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sections_sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text COLLATE utf8_unicode_ci,
  `template` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_pmvvajokbiwneppvhjmsvstypcjgmsxbcdnn` (`sectionId`,`siteId`),
  KEY `idx_subarnrubglicwvgguxnuylpkkxnunkieqfv` (`siteId`),
  CONSTRAINT `fk_bjixidbgycftzkpcmxzoxahruydbjchrprza` FOREIGN KEY (`sectionId`) REFERENCES `sections` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_nkvvxbpuzvanuqmlkczkpjzdgbfiwcshrens` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seo_redirects`
--

DROP TABLE IF EXISTS `seo_redirects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seo_redirects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uri` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `to` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` enum('301','302') COLLATE utf8_unicode_ci NOT NULL,
  `siteId` int(11) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `seo_sitemap`
--

DROP TABLE IF EXISTS `seo_sitemap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seo_sitemap` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group` enum('sections','categories','customUrls') COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `frequency` enum('always','hourly','daily','weekly','monthly','yearly','never') COLLATE utf8_unicode_ci NOT NULL,
  `priority` float NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequences` (
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `next` int(11) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `token` char(100) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ryqsiwbsqoguzoqrblirsjaczpmltalbjmlv` (`uid`),
  KEY `idx_xlgtshjhjhwuqoyyebkbgkrfyzsuqlwnttjw` (`token`),
  KEY `idx_luvuknzuezzhrjbbiavjdcvmphfqldxsfvnd` (`dateUpdated`),
  KEY `idx_iqcwrgklvokorawcbicvvaxbmkjhcapsxfvg` (`userId`),
  CONSTRAINT `fk_iaausljyoeeaufyutrodmdiqqkpesitokier` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shunnedmessages`
--

DROP TABLE IF EXISTS `shunnedmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shunnedmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_wycppxxrwoefwjmdknxmfawqyjlpzmtyyzgb` (`userId`,`message`),
  CONSTRAINT `fk_twuvquentskgxaknbrqdfchzkobyzmcfikby` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sitegroups`
--

DROP TABLE IF EXISTS `sitegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sitegroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_rblosxqypugxxxjdougoqzqeekxsyqgzwzcq` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `language` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_nvrogovxwsfphkaxxschlvbsdpuqqmryldzp` (`dateDeleted`),
  KEY `idx_mmjpageeaevzeqkufahzmgdrkhvmyjzqsklk` (`handle`),
  KEY `idx_fkykpwpjgxfdmzrekxblnkyyinskiokkupep` (`sortOrder`),
  KEY `fk_xyzdvjfncuhxlztiqtmlgahnryobhuvhjwwl` (`groupId`),
  CONSTRAINT `fk_xyzdvjfncuhxlztiqtmlgahnryobhuvhjwwl` FOREIGN KEY (`groupId`) REFERENCES `sitegroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `stc_socialprofiles`
--

DROP TABLE IF EXISTS `stc_socialprofiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stc_socialprofiles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  `field_socialName` text COLLATE utf8_unicode_ci,
  `field_socialLink` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_kmsehmbiosyaukpqogsqvaaodxszzkvafhwx` (`elementId`,`siteId`),
  KEY `fk_zoljgahsjwrtmzcetpnaaacfyunuygmhsiue` (`siteId`),
  CONSTRAINT `fk_nwnijndfzfqbmztkrnzbpysckpniqbvfqicp` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zoljgahsjwrtmzcetpnaaacfyunuygmhsiue` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structureelements`
--

DROP TABLE IF EXISTS `structureelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structureelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) unsigned DEFAULT NULL,
  `lft` int(11) unsigned NOT NULL,
  `rgt` int(11) unsigned NOT NULL,
  `level` smallint(6) unsigned NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_fjaxzghunrtqyrjfiramxfoszxgpzduhnfyv` (`structureId`,`elementId`),
  KEY `idx_njqyvduxfoqbjcmtyniqzijmtmacadyszrlc` (`root`),
  KEY `idx_qboxhcgivnmmnzfonhcewkyeimetzctophox` (`lft`),
  KEY `idx_bljulkutkjzbpmimwkgnfrnwjlemusmkgegb` (`rgt`),
  KEY `idx_foijjevjegipsevsazkdjkylylmprelabzyi` (`level`),
  KEY `idx_nzlvtchaaxydajpeuwlfncdlwymjeeonwazx` (`elementId`),
  CONSTRAINT `fk_janihjjmeecrnkeinlsqecacbucreapdvhqy` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_vjiigzunrhplltvlsjlrapysbgjkjisbvafb` FOREIGN KEY (`structureId`) REFERENCES `structures` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `structures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maxLevels` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_xlnxeqbjhooqsymtbdxfkaoycpmttttvhgyg` (`dateDeleted`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `supertableblocks`
--

DROP TABLE IF EXISTS `supertableblocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supertableblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_nsjkwdxjngirzepccohtixrwdtkwgblhhlgr` (`ownerId`),
  KEY `idx_siugcrkhqhrmedtyqqdqfggcwevgrleyucbj` (`fieldId`),
  KEY `idx_haufnosuvwnomueksfjekpnocyatwvezqfmv` (`typeId`),
  KEY `idx_gharvfevucmjdxiiadfomdfqskiejzuxulkl` (`sortOrder`),
  CONSTRAINT `fk_ambwqujtldtzdsboalnbqidldzvpkxirssbq` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_hblzsxqtgurthshulovnvjctmdxgmkgpxhly` FOREIGN KEY (`typeId`) REFERENCES `supertableblocktypes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_suhjcplwvujejnsrmbqodwnffaefomfvkjoa` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_yibwwehpusciqisfokvhzqfbhgagaepdazyu` FOREIGN KEY (`ownerId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `supertableblocktypes`
--

DROP TABLE IF EXISTS `supertableblocktypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `supertableblocktypes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_bwxjbeejgxfkdwqjlnkfcdjdmnilcfjtjypz` (`fieldId`),
  KEY `idx_jirolfgmgajnsntaipawvglyjhcrqvfzynkd` (`fieldLayoutId`),
  CONSTRAINT `fk_cbrktaagzdildpfqrcarjctkrdxivpwesyji` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_lxflstzswecptafycemdptckzuowjivqnfcd` FOREIGN KEY (`fieldId`) REFERENCES `fields` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `systemmessages`
--

DROP TABLE IF EXISTS `systemmessages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemmessages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `subject` text COLLATE utf8_unicode_ci NOT NULL,
  `body` text COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_tzarjwyxfxrnoegtcmdmytvdpqckdtpbsicg` (`key`,`language`),
  KEY `idx_xrhlsxlbqeqwkbasfliykybnvpyinvgfjbvc` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taggroups`
--

DROP TABLE IF EXISTS `taggroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taggroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_kdzleppgsndxnmbndyvwfxmcuuyadzbsawqr` (`name`),
  KEY `idx_efdevyjoraetorziaihtdiewdwbxmytlnwvk` (`handle`),
  KEY `idx_qjutyjkrngdnictkilhypeplvktcvafoszqh` (`dateDeleted`),
  KEY `fk_cmfgpcqxnqyknvnhssceqqyliwwzvpflpzcg` (`fieldLayoutId`),
  CONSTRAINT `fk_cmfgpcqxnqyknvnhssceqqyliwwzvpflpzcg` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_zgjkfgvbnyptjvajevlwfeemjwrgzblppuvf` (`groupId`),
  CONSTRAINT `fk_grrcjnszduinkhxptcmsyxrzstdnltymgdya` FOREIGN KEY (`groupId`) REFERENCES `taggroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zcsnusllkxavvwktccledsubqqhwmuivswbi` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `templatecacheelements`
--

DROP TABLE IF EXISTS `templatecacheelements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatecacheelements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_hsjjqfoiyvuppyfjihfnrpkybevppmzsnhcu` (`cacheId`),
  KEY `idx_fwafawzualxunwwhkgovzwcvqczukmyqgrsq` (`elementId`),
  CONSTRAINT `fk_ijhtauclamhkbyeiruchbcoemzyrxpnjnqom` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_ontxkneujxcphvhyptavkwzbhoyoolbwhfst` FOREIGN KEY (`elementId`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `templatecachequeries`
--

DROP TABLE IF EXISTS `templatecachequeries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatecachequeries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `query` longtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_fusihsmspodzojwmvpxghveokgapyoqwxsxe` (`cacheId`),
  KEY `idx_yohdfbgvogutpeczvptgazbxswinytnhyqpy` (`type`),
  CONSTRAINT `fk_mubqkaljxaqoaxsfjhyblxlusppmrhtyymui` FOREIGN KEY (`cacheId`) REFERENCES `templatecaches` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `templatecaches`
--

DROP TABLE IF EXISTS `templatecaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `templatecaches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `siteId` int(11) NOT NULL,
  `cacheKey` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_jmbdvybflkknfvwiewcorqhhxlacecueipup` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  KEY `idx_rbixjoozcbegiernlkccuafnlfkukfocloms` (`cacheKey`,`siteId`,`expiryDate`),
  KEY `idx_uxijcojjtydviyczojadmeisfifduirxivke` (`siteId`),
  CONSTRAINT `fk_jxvdvdxqnulmavojelyedckpwygyezqayupz` FOREIGN KEY (`siteId`) REFERENCES `sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` char(32) COLLATE utf8_unicode_ci NOT NULL,
  `route` text COLLATE utf8_unicode_ci,
  `usageLimit` tinyint(3) unsigned DEFAULT NULL,
  `usageCount` tinyint(3) unsigned DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_xbizkftxwulnmfnjmhpbgztmktoqmzmyumpa` (`token`),
  KEY `idx_zjewyohtjwjadqpnzbrxibunzjsscecvxxdp` (`expiryDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups`
--

DROP TABLE IF EXISTS `usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_czppmqlkxrxosvgacnbwcerecrvpmummnouo` (`handle`),
  KEY `idx_bpuzuqeujtbxyiavnmhgcwjtlltgqjnnxwnf` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `usergroups_users`
--

DROP TABLE IF EXISTS `usergroups_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usergroups_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ozeftytmilyhnbczbvlknarntpasdczjlkgu` (`groupId`,`userId`),
  KEY `idx_fhjmmngskqjtbttqvriirmsjpswhrasktkeh` (`userId`),
  CONSTRAINT `fk_hsceitbrhduetfwnpshxrorgyjpgpzyeeztp` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zkdguzfcdqfnjcpmhvkeihttbaivekgbbzjs` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions`
--

DROP TABLE IF EXISTS `userpermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_khlvlojxqdwrzdlxgirybiwvdnjocwdssthi` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_usergroups`
--

DROP TABLE IF EXISTS `userpermissions_usergroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_usergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_ecregheetdfllutmbojbljujhlhuxgomgsjl` (`permissionId`,`groupId`),
  KEY `idx_brejninqnigsazpqprobaznzhxmnnkzasdwj` (`groupId`),
  CONSTRAINT `fk_riihmmqaatlcmwpsdylsrqsdwhrtbtwesaqd` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_zdhzbksfcdbcqgeecrqesrwsawqirvwebxoh` FOREIGN KEY (`groupId`) REFERENCES `usergroups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpermissions_users`
--

DROP TABLE IF EXISTS `userpermissions_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpermissions_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_dvdexhkdxoublspcwdyartnjdtvynrizofuf` (`permissionId`,`userId`),
  KEY `idx_hcrcvphgnhmtxavuaxackrcybwttsriipizn` (`userId`),
  CONSTRAINT `fk_cnfzrzwiufgopmyfcmgvbogizemlpffnuyvz` FOREIGN KEY (`permissionId`) REFERENCES `userpermissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_egzaysinqulzracgvklzsrwnjhhkcticcsrz` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `userpreferences`
--

DROP TABLE IF EXISTS `userpreferences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userpreferences` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `preferences` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`userId`),
  CONSTRAINT `fk_azivphroetbqncbixbcbnekxkduessxcsrzl` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) unsigned DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_zqrskmmhygzguosrsatjlayuyrkqzwirgllv` (`uid`),
  KEY `idx_kpatbwsmqamdrevlqcqlqcgxvnuzkchtbmnt` (`verificationCode`),
  KEY `idx_sweeftxqzbobkcjemvgxpwsfuxflqukeotps` (`email`),
  KEY `idx_tdmmqwqcyjigaxkigslxkrwkwdmpqhviqxsa` (`username`),
  KEY `fk_rggznpkgprajxkyayhntibzvqksnsyioielu` (`photoId`),
  CONSTRAINT `fk_rggznpkgprajxkyayhntibzvqksnsyioielu` FOREIGN KEY (`photoId`) REFERENCES `assets` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_wpwujuisyjvjgjiaxixyftkupkwrzizqnyjj` FOREIGN KEY (`id`) REFERENCES `elements` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumefolders`
--

DROP TABLE IF EXISTS `volumefolders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumefolders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_nzuorieecwuzpvkshbrdvahoyzzucwytrogn` (`name`,`parentId`,`volumeId`),
  KEY `idx_rpzgaqvnrtbeyuepbtsgiajgquauhdyimrdz` (`parentId`),
  KEY `idx_mjgypexeyysiozusccauzizcsoinowrnfgxd` (`volumeId`),
  CONSTRAINT `fk_bwjlyrootmjuuxsqpnlnxlneqdkoyboiicfy` FOREIGN KEY (`volumeId`) REFERENCES `volumes` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_qelwhphrxdjftwxmmkpccsqxsxoldparbgtb` FOREIGN KEY (`parentId`) REFERENCES `volumefolders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `volumes`
--

DROP TABLE IF EXISTS `volumes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `volumes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `handle` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `titleTranslationMethod` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'site',
  `titleTranslationKeyFormat` text COLLATE utf8_unicode_ci,
  `settings` text COLLATE utf8_unicode_ci,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_ksdtngrwyazgqjnmfyhyyjsvtxsajskuwiel` (`name`),
  KEY `idx_mqfucckqymnforuvbyafcabbhbtxjhvvzgiw` (`handle`),
  KEY `idx_txnlmemgjecowrwporsioogyheiwbngttlrm` (`fieldLayoutId`),
  KEY `idx_rsqqbfthieswkveyenyagyqelutynaqtfsxt` (`dateDeleted`),
  CONSTRAINT `fk_bilqtxxlkpbfzbrvenfllxmqudjggmnfnfvz` FOREIGN KEY (`fieldLayoutId`) REFERENCES `fieldlayouts` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `widgets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userId` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sortOrder` smallint(6) unsigned DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text COLLATE utf8_unicode_ci,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `idx_whhydlgvaqpjgqfbcipwsvudgiaygfsxfbml` (`userId`),
  CONSTRAINT `fk_ebargzrzuxlrlxjykrtovpveyhamrtrsgjdg` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'boilerplate'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-07 11:13:53
-- MySQL dump 10.13  Distrib 5.7.26, for osx10.10 (x86_64)
--
-- Host: localhost    Database: boilerplate
-- ------------------------------------------------------
-- Server version	5.7.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `assettransforms`
--

LOCK TABLES `assettransforms` WRITE;
/*!40000 ALTER TABLE `assettransforms` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `assettransforms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups`
--

LOCK TABLES `categorygroups` WRITE;
/*!40000 ALTER TABLE `categorygroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `categorygroups_sites`
--

LOCK TABLES `categorygroups_sites` WRITE;
/*!40000 ALTER TABLE `categorygroups_sites` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `categorygroups_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedattributes`
--

LOCK TABLES `changedattributes` WRITE;
/*!40000 ALTER TABLE `changedattributes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedattributes` VALUES (1,1,'firstName','2021-03-30 14:29:15',0,1),(1,1,'lastName','2021-03-30 14:29:15',0,1),(1,1,'lastPasswordChangeDate','2021-03-30 14:54:18',0,1),(1,1,'password','2021-03-30 14:54:18',0,1),(61,1,'uri','2021-03-31 11:26:20',0,1),(68,1,'slug','2021-03-31 11:34:48',0,1),(68,1,'title','2021-03-31 11:43:49',0,1),(109,1,'slug','2021-04-06 15:24:36',0,1),(109,1,'title','2021-04-06 15:24:36',0,1),(109,1,'uri','2021-04-06 15:24:36',0,1),(112,1,'slug','2021-04-06 15:24:57',0,1),(112,1,'title','2021-04-06 15:24:57',0,1),(112,1,'uri','2021-04-06 15:24:57',0,1);
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedfields` VALUES (3,1,12,'2021-03-30 10:33:15',0,1),(3,1,17,'2021-04-07 09:55:26',0,1),(3,1,18,'2021-03-30 15:00:15',0,1),(14,1,12,'2021-03-30 11:07:50',0,1),(14,1,17,'2021-03-30 11:07:50',0,1),(14,1,18,'2021-03-30 11:07:50',0,1),(17,1,12,'2021-03-30 11:07:21',0,1),(17,1,17,'2021-03-30 11:07:21',0,1),(17,1,18,'2021-03-30 11:07:21',0,1),(61,1,12,'2021-03-31 11:33:02',0,1),(61,1,13,'2021-03-31 11:26:22',0,1),(61,1,14,'2021-03-31 11:26:22',0,1),(61,1,17,'2021-03-31 11:33:02',0,1),(61,1,18,'2021-03-31 11:33:02',0,1),(64,1,12,'2021-03-31 11:33:39',0,1),(64,1,17,'2021-04-06 15:56:14',0,1),(64,1,18,'2021-03-31 11:33:39',0,1),(68,1,12,'2021-03-31 11:43:49',0,1),(68,1,17,'2021-03-31 11:34:48',0,1),(68,1,18,'2021-03-31 11:34:48',0,1),(109,1,12,'2021-04-06 15:24:36',0,1),(109,1,19,'2021-04-06 15:24:44',0,1),(112,1,19,'2021-04-06 15:24:57',0,1);
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `content` VALUES (1,1,1,NULL,'2021-03-30 09:20:10','2021-03-30 14:54:16','059cf906-eede-4bc3-a138-0badc14970ec',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,2,1,NULL,'2021-03-30 09:31:09','2021-04-06 15:39:52','24b982c0-4544-4d1b-8638-6c121774bc50','<p>99 Street,<br />City,<br />XX99 9XX,<br />Country</p>','john.doe@email.com','01234 567890',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,3,1,'Homepage','2021-03-30 09:38:29','2021-04-07 09:55:25','48c6866e-f1f0-409e-bf73-e8cb0d2fe8ec',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":{\"1\":\"Homepage\"},\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Homepage - Future Forestry\",\"imageId\":\"\",\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Homepage - Future Forestry\",\"imageId\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":\"\"}}',NULL,NULL,NULL,NULL),(4,4,1,'Homepage','2021-03-30 09:38:29','2021-03-30 09:38:29','532cc3b3-0fe3-4222-a4e5-334e78081ebf',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,5,1,'Homepage','2021-03-30 09:38:52','2021-03-30 09:38:52','3e46bab1-66ec-4a92-85d2-f10ffaa274dd',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":[],\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"neutral\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Homepage - Future Forestry\",\"imageId\":null,\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Homepage - Future Forestry\",\"imageId\":null,\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":null}}',NULL,NULL,NULL,NULL),(6,6,1,'Homepage','2021-03-30 10:13:09','2021-03-30 10:13:09','07695502-b576-4681-ac5d-2d60ba17ad53',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":[],\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"neutral\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Homepage - Future Forestry\",\"imageId\":null,\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Homepage - Future Forestry\",\"imageId\":null,\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":null}}',NULL,NULL,NULL,NULL),(7,7,1,NULL,'2021-03-30 10:33:15','2021-03-30 10:33:15','824d6e50-eca5-4e17-9f55-4786f49951fa',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Lorem Ipsum dolor sit amet...</p>','This is the main header',NULL),(8,8,1,NULL,'2021-03-30 10:33:15','2021-03-30 10:33:15','995c8b1f-3cdd-45f2-a063-e56cb22c5e18',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Some random copy</p>',NULL,NULL),(9,9,1,NULL,'2021-03-30 10:33:15','2021-03-30 10:33:15','e65f5409-e96b-4ef9-bf44-0fa770beeaff',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,NULL,NULL),(10,10,1,'Homepage','2021-03-30 10:33:15','2021-03-30 10:33:15','525cf901-2a8a-4a32-b98b-816a77b6e879',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":{\"1\":\"Homepage\"},\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Homepage - Future Forestry\",\"imageId\":\"\",\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Homepage - Future Forestry\",\"imageId\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":\"\"}}',NULL,NULL,NULL,NULL),(11,11,1,NULL,'2021-03-30 10:33:15','2021-03-30 10:33:15','58d6103f-2285-45cf-bf4b-27cc43debc3a',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Lorem Ipsum dolor sit amet...</p>','This is the main header',NULL),(12,12,1,NULL,'2021-03-30 10:33:15','2021-03-30 10:33:15','d9930864-e3f7-4f9f-952d-7f939dff1495',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Some random copy</p>',NULL,NULL),(13,13,1,NULL,'2021-03-30 10:33:15','2021-03-30 10:33:15','409b8ac9-4bdd-4d02-b829-2abd96c73de1',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,NULL,NULL),(14,14,1,'About us','2021-03-30 11:04:36','2021-03-30 11:09:56','7c0b3f90-0708-4fda-aa64-bbe57cb4ceb0',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":{\"1\":\"About us\"},\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"About us - Future Forestry\",\"imageId\":\"\",\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"About us - Future Forestry\",\"imageId\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":\"\"}}',NULL,NULL,NULL,NULL),(15,15,1,'About us','2021-03-30 11:04:36','2021-03-30 11:04:36','45400b45-9692-4e8c-af1a-6ad8aafd6085',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,16,1,'About us','2021-03-30 11:05:00','2021-03-30 11:05:00','34149107-6901-4aed-a5e5-0a558476018c',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":[],\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"neutral\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"About us - Future Forestry\",\"imageId\":null,\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"About us - Future Forestry\",\"imageId\":null,\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":null}}',NULL,NULL,NULL,NULL),(17,17,1,'Contact','2021-03-30 11:05:32','2021-03-30 11:10:02','8f7165fc-0ae9-4c76-b6f8-6163e643872c',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":{\"1\":\"Contact\"},\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Contact - Future Forestry\",\"imageId\":\"\",\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Contact - Future Forestry\",\"imageId\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":\"\"}}',NULL,NULL,NULL,NULL),(18,18,1,'Contact','2021-03-30 11:05:32','2021-03-30 11:05:32','8cf056af-3855-4726-86fe-51640da4d399',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,19,1,'Contact','2021-03-30 11:06:23','2021-03-30 11:06:23','9fcfcc19-b5af-4503-b002-eafcac42cf34',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":[],\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"neutral\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Contact - Future Forestry\",\"imageId\":null,\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Contact - Future Forestry\",\"imageId\":null,\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":null}}',NULL,NULL,NULL,NULL),(20,20,1,NULL,'2021-03-30 11:07:21','2021-03-30 11:07:21','ece25f30-7ce7-4661-a7aa-a32222e4eb95',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Lorem ipsum dolor sit amet ...</p>','Hi, this is the Contact page',NULL),(21,21,1,NULL,'2021-03-30 11:07:21','2021-03-30 11:07:21','3caa5cb1-4f73-4521-a807-4399af7b70e5',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,NULL,NULL),(22,22,1,'Contact','2021-03-30 11:07:21','2021-03-30 11:07:21','37d3ec6f-0e45-4f0d-ac34-9cce280bfdf8',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":{\"1\":\"Contact\"},\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Contact - Future Forestry\",\"imageId\":\"\",\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Contact - Future Forestry\",\"imageId\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":\"\"}}',NULL,NULL,NULL,NULL),(23,23,1,NULL,'2021-03-30 11:07:21','2021-03-30 11:07:21','c2f8a24a-b457-4d67-8322-cea0c87352e0',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Lorem ipsum dolor sit amet ...</p>','Hi, this is the Contact page',NULL),(24,24,1,NULL,'2021-03-30 11:07:21','2021-03-30 11:07:21','fb99cf12-4828-41ab-9abf-9c50f1b9fdb1',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,NULL,NULL),(25,25,1,NULL,'2021-03-30 11:07:50','2021-03-30 11:07:50','f4480c5d-1f7d-4684-8055-8ee2f3c05429',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Lorem ipsum dolor sit amet ...</p>','Hi this is the About us page',NULL),(26,26,1,NULL,'2021-03-30 11:07:50','2021-03-30 11:07:50','af4d4561-7e70-4d69-b999-f65b6c2d4798',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,NULL,NULL),(27,27,1,'About us','2021-03-30 11:07:50','2021-03-30 11:07:50','eca978c8-b729-4244-9602-6a9c71211b50',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":{\"1\":\"About us\"},\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"About us - Future Forestry\",\"imageId\":\"\",\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"About us - Future Forestry\",\"imageId\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":\"\"}}',NULL,NULL,NULL,NULL),(28,28,1,NULL,'2021-03-30 11:07:50','2021-03-30 11:07:50','3edf1e5f-74bb-4c69-84b3-15854e41c79b',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Lorem ipsum dolor sit amet ...</p>','Hi this is the About us page',NULL),(29,29,1,NULL,'2021-03-30 11:07:50','2021-03-30 11:07:50','6df7bafd-960b-4d2b-b338-64be41b07af7',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,NULL,NULL),(30,30,1,'About us','2021-03-30 11:09:07','2021-03-30 11:09:07','20613e9f-1dee-4fbf-8862-ea9bea0cf5a7',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":{\"1\":\"About us\"},\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"About us - Future Forestry\",\"imageId\":\"\",\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"About us - Future Forestry\",\"imageId\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":\"\"}}',NULL,NULL,NULL,NULL),(31,31,1,NULL,'2021-03-30 11:09:07','2021-03-30 11:09:07','d38604f8-9a5f-4bdf-94e6-e4966f308cf4',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Lorem ipsum dolor sit amet ...</p>','Hi this is the About us page',NULL),(32,32,1,NULL,'2021-03-30 11:09:07','2021-03-30 11:09:07','31c832a4-bec0-4f6a-997d-0af789b7dc0f',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,NULL,NULL),(33,33,1,'Contact','2021-03-30 11:09:29','2021-03-30 11:09:29','7d0bfdd2-3d4a-4c22-adb3-bd78557072b1',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":{\"1\":\"Contact\"},\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Contact - Future Forestry\",\"imageId\":\"\",\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Contact - Future Forestry\",\"imageId\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":\"\"}}',NULL,NULL,NULL,NULL),(34,34,1,NULL,'2021-03-30 11:09:29','2021-03-30 11:09:29','546e0f61-5633-4753-b16e-32e8082a8976',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Lorem ipsum dolor sit amet ...</p>','Hi, this is the Contact page',NULL),(35,35,1,NULL,'2021-03-30 11:09:29','2021-03-30 11:09:29','c6e91cb1-1cc5-4f1a-9439-f0ff54b6b56f',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,NULL,NULL),(36,36,1,'About us','2021-03-30 11:09:56','2021-03-30 11:09:56','9e3b1db8-6388-45cc-9318-8291c2bf29b6',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":{\"1\":\"About us\"},\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"About us - Future Forestry\",\"imageId\":\"\",\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"About us - Future Forestry\",\"imageId\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":\"\"}}',NULL,NULL,NULL,NULL),(37,37,1,NULL,'2021-03-30 11:09:56','2021-03-30 11:09:56','3ba0ecea-746d-4041-844a-11d10426353c',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Lorem ipsum dolor sit amet ...</p>','Hi this is the About us page',NULL),(38,38,1,NULL,'2021-03-30 11:09:56','2021-03-30 11:09:56','ea838449-31d9-4b89-b537-b7ab0ab6deab',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,NULL,NULL),(39,39,1,'Contact','2021-03-30 11:10:02','2021-03-30 11:10:02','1faa7e64-9567-4a18-9ae4-c34624f923f7',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":{\"1\":\"Contact\"},\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Contact - Future Forestry\",\"imageId\":\"\",\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Contact - Future Forestry\",\"imageId\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":\"\"}}',NULL,NULL,NULL,NULL),(40,40,1,NULL,'2021-03-30 11:10:02','2021-03-30 11:10:02','c7570e88-af96-4ca4-99fc-5ce9d36364f5',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Lorem ipsum dolor sit amet ...</p>','Hi, this is the Contact page',NULL),(41,41,1,NULL,'2021-03-30 11:10:02','2021-03-30 11:10:02','46d6b854-212c-4653-9977-749619886e5e',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,NULL,NULL),(42,42,1,'About us','2021-03-30 11:14:00','2021-03-30 11:14:00','4abf7390-9987-440b-88cc-7273dea8f1ad',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(43,43,1,'Contact','2021-03-30 11:14:00','2021-03-30 11:14:00','e93068c3-4b75-4bc0-9bc4-eb900c119e5c',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(44,44,1,'Homepage','2021-03-30 11:14:00','2021-03-30 11:14:00','8e54656d-0373-471d-ae5f-bd5baeab3c02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(45,45,1,NULL,'2021-03-30 13:16:05','2021-03-30 13:16:05','0aac892d-a1ef-4ccb-9406-c8c0d0ed811f',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(46,46,1,'2021-03-30 06:47:51','2021-03-30 13:47:51','2021-03-30 13:47:51','48c9ad55-68e6-454c-89ce-6b54f19f3d18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(47,47,1,'2021-03-30 06:53:33','2021-03-30 13:53:33','2021-03-30 13:53:33','a4369b28-e55e-4d65-8491-2ed04f5a6467',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(48,48,1,'2021-03-30 06:54:15','2021-03-30 13:54:15','2021-03-30 13:54:15','3967c8ae-8fcc-400f-9c8a-450ef5cc42eb',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(49,49,1,'Homepage','2021-03-30 14:30:04','2021-03-30 14:30:04','38f886d0-d761-483c-addb-2e4d2f2db481',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":{\"1\":\"Homepage\"},\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Homepage - Future Forestry\",\"imageId\":\"\",\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Homepage - Future Forestry\",\"imageId\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":\"\"}}',NULL,NULL,NULL,NULL),(50,50,1,NULL,'2021-03-30 14:58:55','2021-03-30 15:00:14','348ffa36-efb1-4b58-af02-6d5779873d05',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Edit this content in the Homepage single.</p>','Welcome to the homepage',NULL),(51,51,1,NULL,'2021-03-30 14:58:55','2021-03-30 15:00:14','f52100b5-7eef-4410-a4ec-5137fb0cc2a9',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac eros nibh. Aliquam erat volutpat. Aenean non sem sit amet massa efficitur pellentesque sit amet nec turpis. Maecenas ornare nibh id consequat vestibulum. Quisque eu sem a massa fringilla varius. Duis nec felis porta, consectetur augue sit amet, porta est. Morbi imperdiet justo mi, ut aliquet diam bibendum eu. Etiam id enim non sem sollicitudin ultrices vel in purus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed at nisi rutrum, sollicitudin tellus vel, eleifend velit. Praesent sed molestie dolor.</p>',NULL,NULL),(52,52,1,NULL,'2021-03-30 14:58:55','2021-03-30 14:58:55','53650b38-92b1-41e2-b00c-a7944b15058e',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,NULL,NULL),(53,53,1,'Homepage','2021-03-30 14:58:55','2021-03-30 14:58:55','a080b93a-88fb-46bc-abe6-045dfb4bbf74',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":{\"1\":\"Homepage\"},\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Homepage - Future Forestry\",\"imageId\":\"\",\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Homepage - Future Forestry\",\"imageId\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":\"\"}}',NULL,NULL,NULL,NULL),(54,54,1,NULL,'2021-03-30 14:58:55','2021-03-30 14:58:55','c12ff4ef-9650-4f81-972b-b586fbbfb7cd',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Hi, I\'m a copy in the header</p>','Hi, I\'m a title in the header.',NULL),(55,55,1,NULL,'2021-03-30 14:58:55','2021-03-30 14:58:55','8737fb0f-356d-4252-a542-b8fe89649c8d',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Hi, I\'m a copy block.</p>',NULL,NULL),(56,56,1,NULL,'2021-03-30 14:58:55','2021-03-30 14:58:55','a44e6c9f-80f8-46df-b95a-c3a1fff198f8',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,NULL,NULL),(57,57,1,'Homepage','2021-03-30 15:00:15','2021-03-30 15:00:15','165e881b-30c2-4ba8-be36-454884be7f64',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":{\"1\":\"Homepage\"},\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Homepage - Future Forestry\",\"imageId\":\"\",\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Homepage - Future Forestry\",\"imageId\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":\"\"}}',NULL,NULL,NULL,NULL),(58,58,1,NULL,'2021-03-30 15:00:15','2021-03-30 15:00:15','72e059dd-b5ff-46c4-b264-9e56237a58c9',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Edit this content in the Homepage single.</p>','Welcome to the homepage',NULL),(59,59,1,NULL,'2021-03-30 15:00:15','2021-03-30 15:00:15','e7041874-6c7e-47d5-a86f-508454bf3eec',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac eros nibh. Aliquam erat volutpat. Aenean non sem sit amet massa efficitur pellentesque sit amet nec turpis. Maecenas ornare nibh id consequat vestibulum. Quisque eu sem a massa fringilla varius. Duis nec felis porta, consectetur augue sit amet, porta est. Morbi imperdiet justo mi, ut aliquet diam bibendum eu. Etiam id enim non sem sollicitudin ultrices vel in purus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed at nisi rutrum, sollicitudin tellus vel, eleifend velit. Praesent sed molestie dolor.</p>',NULL,NULL),(60,60,1,NULL,'2021-03-30 15:00:15','2021-03-30 15:00:15','8573406a-81f8-4445-b739-d9aa8f61e4f7',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,NULL,NULL),(61,61,1,'About us','2021-03-31 11:24:42','2021-03-31 11:33:02','4c4b87dc-612e-47c4-ad21-fa12cee590d0',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":{\"1\":\"About us\"},\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"About us - Craft CMS Boilerplate\",\"imageId\":\"\",\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"About us - Craft CMS Boilerplate\",\"imageId\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":\"\"}}',NULL,NULL,NULL,NULL),(62,62,1,'About us','2021-03-31 11:24:42','2021-03-31 11:24:42','9a696679-9bdf-4514-9295-88203670892d',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(63,63,1,'About us','2021-03-31 11:25:22','2021-03-31 11:25:22','fd231605-8870-4fcd-af50-512879bd2705',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":[],\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"neutral\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"About us - Craft CMS Boilerplate\",\"imageId\":null,\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"About us - Craft CMS Boilerplate\",\"imageId\":null,\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":null}}',NULL,NULL,NULL,NULL),(64,64,1,'Contact','2021-03-31 11:25:46','2021-04-06 15:56:14','89f181d0-1c97-472f-858f-00cfa4a96d2e',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":{\"1\":\"Contact\"},\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Contact - Craft CMS Boilerplate\",\"imageId\":\"\",\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Contact - Craft CMS Boilerplate\",\"imageId\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":\"\"}}',NULL,NULL,NULL,NULL),(65,65,1,'Contact','2021-03-31 11:25:46','2021-03-31 11:25:46','bfa82dcc-038e-4770-9326-96bf09d5cba9',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(66,66,1,'About us','2021-03-31 11:26:20','2021-03-31 11:26:20','b51934e0-51f3-4fd0-9c23-34e4059b2271',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":[],\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"neutral\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"About us - Craft CMS Boilerplate\",\"imageId\":null,\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"About us - Craft CMS Boilerplate\",\"imageId\":null,\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":null}}',NULL,NULL,NULL,NULL),(67,67,1,'About us','2021-03-31 11:26:21','2021-03-31 11:26:21','1d917364-7c8d-4dfc-ad73-f1a2d50d9ae9',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":[],\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"neutral\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"About us - Craft CMS Boilerplate\",\"imageId\":null,\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"About us - Craft CMS Boilerplate\",\"imageId\":null,\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":null}}',NULL,NULL,NULL,NULL),(68,68,1,'Latest','2021-03-31 11:27:00','2021-04-06 15:37:48','dbba40c1-02ee-4079-8d66-19b7d1a401c5',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":{\"1\":\"Latest\"},\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Latest - Craft CMS Boilerplate\",\"imageId\":\"\",\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Latest - Craft CMS Boilerplate\",\"imageId\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":\"\"}}',NULL,NULL,NULL,NULL),(69,69,1,'Latest Index','2021-03-31 11:27:00','2021-03-31 11:27:00','31dafd0e-5379-4074-a003-a61c9b9adaad',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(70,70,1,'Latest Index','2021-03-31 11:28:06','2021-03-31 11:28:06','ee63b36b-aab5-45de-9581-f8bf6c57ad38',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":[],\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"neutral\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Latest Index - Craft CMS Boilerplate\",\"imageId\":null,\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Latest Index - Craft CMS Boilerplate\",\"imageId\":null,\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":null}}',NULL,NULL,NULL,NULL),(71,71,1,'Contact','2021-03-31 11:28:32','2021-03-31 11:28:32','f17b4e98-0886-484d-bd26-d556c71e5e46',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":[],\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"neutral\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Contact - Craft CMS Boilerplate\",\"imageId\":null,\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Contact - Craft CMS Boilerplate\",\"imageId\":null,\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":null}}',NULL,NULL,NULL,NULL),(72,72,1,NULL,'2021-03-31 11:33:02','2021-03-31 11:33:02','f7c6a661-e32f-46c9-a069-3920d4df62dc',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Edit this content in the About us single</p>','Welcome to the About us page',NULL),(73,73,1,NULL,'2021-03-31 11:33:02','2021-03-31 11:33:02','d841f416-890c-4997-9716-e25103bca33b',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac eros nibh. Aliquam erat volutpat. Aenean non sem sit amet massa efficitur pellentesque sit amet nec turpis. Maecenas ornare nibh id consequat vestibulum. Quisque eu sem a massa fringilla varius. Duis nec felis porta, consectetur augue sit amet, porta est. Morbi imperdiet justo mi, ut aliquet diam bibendum eu. Etiam id enim non sem sollicitudin ultrices vel in purus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed at nisi rutrum, sollicitudin tellus vel, eleifend velit. Praesent sed molestie dolor.</p>',NULL,NULL),(74,74,1,NULL,'2021-03-31 11:33:02','2021-03-31 11:33:02','33dab325-d7e7-4bd8-bf81-cf679a73ae3e',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,NULL,NULL),(75,75,1,'About us','2021-03-31 11:33:02','2021-03-31 11:33:02','ba58e434-9b1f-4b5a-8294-535950c54bc9',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":{\"1\":\"About us\"},\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"About us - Craft CMS Boilerplate\",\"imageId\":\"\",\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"About us - Craft CMS Boilerplate\",\"imageId\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":\"\"}}',NULL,NULL,NULL,NULL),(76,76,1,NULL,'2021-03-31 11:33:02','2021-03-31 11:33:02','d35f62e8-2a80-464b-acdf-ea60a82f317b',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Edit this content in the About us single</p>','Welcome to the About us page',NULL),(77,77,1,NULL,'2021-03-31 11:33:02','2021-03-31 11:33:02','780f6006-b915-43e7-b4cd-16f0112ec37c',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac eros nibh. Aliquam erat volutpat. Aenean non sem sit amet massa efficitur pellentesque sit amet nec turpis. Maecenas ornare nibh id consequat vestibulum. Quisque eu sem a massa fringilla varius. Duis nec felis porta, consectetur augue sit amet, porta est. Morbi imperdiet justo mi, ut aliquet diam bibendum eu. Etiam id enim non sem sollicitudin ultrices vel in purus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed at nisi rutrum, sollicitudin tellus vel, eleifend velit. Praesent sed molestie dolor.</p>',NULL,NULL),(78,78,1,NULL,'2021-03-31 11:33:02','2021-03-31 11:33:02','44323808-10ff-4ef8-b3ba-69cd2c732da0',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,NULL,NULL),(79,79,1,NULL,'2021-03-31 11:33:39','2021-03-31 11:33:39','e56510c2-b90e-4acf-bfdb-51a8d678b8b1',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Edit this content in the Contact single</p>','Welcome to the Contact page',NULL),(80,80,1,NULL,'2021-03-31 11:33:39','2021-03-31 11:33:39','1a3ee30b-2784-41b2-a8c1-84452e0014a4',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac eros nibh. Aliquam erat volutpat. Aenean non sem sit amet massa efficitur pellentesque sit amet nec turpis. Maecenas ornare nibh id consequat vestibulum. Quisque eu sem a massa fringilla varius. Duis nec felis porta, consectetur augue sit amet, porta est. Morbi imperdiet justo mi, ut aliquet diam bibendum eu. Etiam id enim non sem sollicitudin ultrices vel in purus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed at nisi rutrum, sollicitudin tellus vel, eleifend velit. Praesent sed molestie dolor.</p>',NULL,NULL),(81,81,1,NULL,'2021-03-31 11:33:39','2021-03-31 11:33:39','f32d4cd6-60d5-453c-bf12-520bdfccee30',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,NULL,NULL),(82,82,1,'Contact','2021-03-31 11:33:39','2021-03-31 11:33:39','8104c571-f873-4da9-8dfb-e12f275331cf',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":{\"1\":\"Contact\"},\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Contact - Craft CMS Boilerplate\",\"imageId\":\"\",\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Contact - Craft CMS Boilerplate\",\"imageId\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":\"\"}}',NULL,NULL,NULL,NULL),(83,83,1,NULL,'2021-03-31 11:33:39','2021-03-31 11:33:39','bd46c19f-a74b-4f13-bd8b-a2ea01cd94f5',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Edit this content in the Contact single</p>','Welcome to the Contact page',NULL),(84,84,1,NULL,'2021-03-31 11:33:39','2021-03-31 11:33:39','8fa0e71e-e246-43a5-a7c7-3e304bad33de',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac eros nibh. Aliquam erat volutpat. Aenean non sem sit amet massa efficitur pellentesque sit amet nec turpis. Maecenas ornare nibh id consequat vestibulum. Quisque eu sem a massa fringilla varius. Duis nec felis porta, consectetur augue sit amet, porta est. Morbi imperdiet justo mi, ut aliquet diam bibendum eu. Etiam id enim non sem sollicitudin ultrices vel in purus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed at nisi rutrum, sollicitudin tellus vel, eleifend velit. Praesent sed molestie dolor.</p>',NULL,NULL),(85,85,1,NULL,'2021-03-31 11:33:39','2021-03-31 11:33:39','c138cfed-3bff-4bd2-a90d-bd7bfb53a5ce',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,NULL,NULL),(86,86,1,NULL,'2021-03-31 11:34:47','2021-03-31 11:34:47','899259d6-9c82-4a53-95e6-c957d9ebf3da',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>You can edit this in the Latest Index single</p>','Welcome to the Latest Index page',NULL),(87,87,1,NULL,'2021-03-31 11:34:47','2021-03-31 11:34:47','71e52bcf-3eab-4dbb-a0bf-f4b876d6cd34',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac eros nibh. Aliquam erat volutpat. Aenean non sem sit amet massa efficitur pellentesque sit amet nec turpis. Maecenas ornare nibh id consequat vestibulum. Quisque eu sem a massa fringilla varius. Duis nec felis porta, consectetur augue sit amet, porta est. Morbi imperdiet justo mi, ut aliquet diam bibendum eu. Etiam id enim non sem sollicitudin ultrices vel in purus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed at nisi rutrum, sollicitudin tellus vel, eleifend velit. Praesent sed molestie dolor.</p>',NULL,NULL),(88,88,1,NULL,'2021-03-31 11:34:48','2021-03-31 11:34:48','96c3bf2e-aae3-4372-bcb4-e9194edabc16',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,NULL,NULL),(89,89,1,'Latest Index','2021-03-31 11:34:48','2021-03-31 11:34:48','28b36d78-8f0e-4220-8ac0-b4a6e459f0c1',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":{\"1\":\"Latest Index\"},\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Latest Index - Craft CMS Boilerplate\",\"imageId\":\"\",\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Latest Index - Craft CMS Boilerplate\",\"imageId\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":\"\"}}',NULL,NULL,NULL,NULL),(90,90,1,NULL,'2021-03-31 11:34:48','2021-03-31 11:34:48','346141ea-9e41-4492-a5bb-d2de6b73efe3',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>You can edit this in the Latest Index single</p>','Welcome to the Latest Index page',NULL),(91,91,1,NULL,'2021-03-31 11:34:48','2021-03-31 11:34:48','6fb8f970-08c0-448c-a3b4-8d7d1284f758',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac eros nibh. Aliquam erat volutpat. Aenean non sem sit amet massa efficitur pellentesque sit amet nec turpis. Maecenas ornare nibh id consequat vestibulum. Quisque eu sem a massa fringilla varius. Duis nec felis porta, consectetur augue sit amet, porta est. Morbi imperdiet justo mi, ut aliquet diam bibendum eu. Etiam id enim non sem sollicitudin ultrices vel in purus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed at nisi rutrum, sollicitudin tellus vel, eleifend velit. Praesent sed molestie dolor.</p>',NULL,NULL),(92,92,1,NULL,'2021-03-31 11:34:48','2021-03-31 11:34:48','6e58ed6c-b74d-4574-8866-cfc155049234',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,NULL,NULL),(94,94,1,'Article 1','2021-03-31 11:36:41','2021-03-31 11:36:41','651fc2ee-b1bb-4a6a-9447-1cc46734c518',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":[],\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"neutral\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Article 1 - Craft CMS Boilerplate\",\"imageId\":null,\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Article 1 - Craft CMS Boilerplate\",\"imageId\":null,\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":null}}','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac eros nibh. Aliquam erat volutpat. Aenean non sem sit amet massa efficitur pellentesque sit amet nec turpis. Maecenas ornare nibh id consequat vestibulum. Quisque eu sem a massa fringilla varius. Duis nec felis porta, consectetur augue sit amet, porta est. Morbi imperdiet justo mi, ut aliquet diam bibendum eu. Etiam id enim non sem sollicitudin ultrices vel in purus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed at nisi rutrum, sollicitudin tellus vel, eleifend velit. Praesent sed molestie dolor.','<p>This article is a part of the Latest channel</p>','Welcome to Article 1',NULL),(95,95,1,'Article 1','2021-03-31 11:36:41','2021-03-31 11:36:41','239cd599-6d17-4a26-bc1a-fabd6a1470ad',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":[],\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"neutral\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Article 1 - Craft CMS Boilerplate\",\"imageId\":null,\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Article 1 - Craft CMS Boilerplate\",\"imageId\":null,\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":null}}','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac eros nibh. Aliquam erat volutpat. Aenean non sem sit amet massa efficitur pellentesque sit amet nec turpis. Maecenas ornare nibh id consequat vestibulum. Quisque eu sem a massa fringilla varius. Duis nec felis porta, consectetur augue sit amet, porta est. Morbi imperdiet justo mi, ut aliquet diam bibendum eu. Etiam id enim non sem sollicitudin ultrices vel in purus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed at nisi rutrum, sollicitudin tellus vel, eleifend velit. Praesent sed molestie dolor.','<p>This article is a part of the Latest channel</p>','Welcome to Article 1',NULL),(96,96,1,'Latest','2021-03-31 11:37:26','2021-04-06 15:37:48','64abf752-ab25-46ea-931d-3de2315ef211',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(97,97,1,'Contact','2021-03-31 11:37:26','2021-04-06 15:56:14','95737e1d-9a3e-406f-a9b7-ff5514260686',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(98,98,1,'About us','2021-03-31 11:37:26','2021-03-31 11:37:26','6d02dfc9-a596-441d-946b-bc1029e2ec97',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(99,99,1,'Homepage','2021-03-31 11:37:26','2021-04-07 09:55:24','3126de61-b170-47a9-bdaf-22cfe289928d',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(100,100,1,'Latest','2021-03-31 11:38:08','2021-04-06 15:37:48','5ccbe4c7-93f0-4a4e-9f01-dd76450b80a4',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(101,101,1,'Contact','2021-03-31 11:38:08','2021-04-06 15:56:14','5160b77d-5edc-4cbb-9135-f2f97726e4b2',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(102,102,1,'About us','2021-03-31 11:38:08','2021-03-31 11:38:08','c00ba3a4-dd92-4f1a-b0be-acbdc7939469',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(103,103,1,'Homepage','2021-03-31 11:38:08','2021-04-07 09:55:24','b61ef7a2-f1f3-4ed7-9f14-0748db6b6cfa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(104,104,1,'Latest','2021-03-31 11:43:49','2021-03-31 11:43:49','ce90d9cb-bca2-4563-9c8b-edcaa01c0244',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":{\"1\":\"Latest\"},\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Latest - Craft CMS Boilerplate\",\"imageId\":\"\",\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Latest - Craft CMS Boilerplate\",\"imageId\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":\"\"}}',NULL,NULL,NULL,NULL),(105,105,1,NULL,'2021-03-31 11:43:49','2021-03-31 11:43:49','3174f577-bbf4-4b6f-84aa-7a2496d15d17',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>You can edit this in the Latest Index single</p>','Welcome to the Latest Index page',NULL),(106,106,1,NULL,'2021-03-31 11:43:49','2021-03-31 11:43:49','7ce9d5e4-efbb-4836-98aa-241e2b932aa6',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac eros nibh. Aliquam erat volutpat. Aenean non sem sit amet massa efficitur pellentesque sit amet nec turpis. Maecenas ornare nibh id consequat vestibulum. Quisque eu sem a massa fringilla varius. Duis nec felis porta, consectetur augue sit amet, porta est. Morbi imperdiet justo mi, ut aliquet diam bibendum eu. Etiam id enim non sem sollicitudin ultrices vel in purus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed at nisi rutrum, sollicitudin tellus vel, eleifend velit. Praesent sed molestie dolor.</p>',NULL,NULL),(107,107,1,NULL,'2021-03-31 11:43:49','2021-03-31 11:43:49','a15d8304-431c-4ed5-92fb-53f6316d61e8',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,NULL,NULL),(108,108,1,'Article 1','2021-03-31 13:07:33','2021-03-31 13:07:33','965407f7-63ee-4a7f-baa6-0868adabe3b3',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(109,109,1,'Article 2','2021-04-06 12:32:18','2021-04-06 15:24:44','53843aed-524c-4c64-8c0e-a08a629b794e',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":{\"1\":\"Article 2\"},\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Article 2 - Craft CMS Boilerplate\",\"imageId\":\"\",\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Article 2 - Craft CMS Boilerplate\",\"imageId\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":\"\"}}','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac eros nibh. Aliquam erat volutpat. Aenean non sem sit amet massa efficitur pellentesque sit amet nec turpis. Maecenas ornare nibh id consequat vestibulum. Quisque eu sem a massa fringilla varius. Duis nec felis porta, consectetur augue sit amet, porta est. Morbi imperdiet justo mi, ut aliquet diam bibendum eu. Etiam id enim non sem sollicitudin ultrices vel in purus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed at nisi rutrum, sollicitudin tellus vel, eleifend velit. Praesent sed molestie dolor.','<p>This article is a part of the Latest channel</p>','Welcome to Article 2',NULL),(110,110,1,'Article 1 copy','2021-04-06 12:32:18','2021-04-06 12:32:18','f82c1f55-a429-4985-8e24-02d1a9bf2fb0',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":[],\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"neutral\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Article 1 - Craft CMS Boilerplate\",\"imageId\":null,\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Article 1 - Craft CMS Boilerplate\",\"imageId\":null,\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":null}}','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac eros nibh. Aliquam erat volutpat. Aenean non sem sit amet massa efficitur pellentesque sit amet nec turpis. Maecenas ornare nibh id consequat vestibulum. Quisque eu sem a massa fringilla varius. Duis nec felis porta, consectetur augue sit amet, porta est. Morbi imperdiet justo mi, ut aliquet diam bibendum eu. Etiam id enim non sem sollicitudin ultrices vel in purus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed at nisi rutrum, sollicitudin tellus vel, eleifend velit. Praesent sed molestie dolor.','<p>This article is a part of the Latest channel</p>','Welcome to Article 1',NULL),(111,111,1,'Article 2','2021-04-06 12:32:41','2021-04-06 15:24:44','67fe46d2-f9d0-49cc-b756-2d9537ec27ff',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(112,112,1,'Article 3','2021-04-06 15:24:28','2021-04-06 15:24:57','7c810222-8f1e-4de0-8c92-9aa8b5fce42e',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":[],\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"neutral\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Article 1 - Craft CMS Boilerplate\",\"imageId\":null,\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Article 1 - Craft CMS Boilerplate\",\"imageId\":null,\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":null}}','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac eros nibh. Aliquam erat volutpat. Aenean non sem sit amet massa efficitur pellentesque sit amet nec turpis. Maecenas ornare nibh id consequat vestibulum. Quisque eu sem a massa fringilla varius. Duis nec felis porta, consectetur augue sit amet, porta est. Morbi imperdiet justo mi, ut aliquet diam bibendum eu. Etiam id enim non sem sollicitudin ultrices vel in purus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed at nisi rutrum, sollicitudin tellus vel, eleifend velit. Praesent sed molestie dolor.','<p>This article is a part of the Latest channel</p>','Welcome to Article 3',NULL),(113,113,1,'Article 1 copy copy','2021-04-06 15:24:28','2021-04-06 15:24:28','f8c58101-940f-47a9-9719-8794d1363d63',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":[],\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"neutral\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Article 1 - Craft CMS Boilerplate\",\"imageId\":null,\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Article 1 - Craft CMS Boilerplate\",\"imageId\":null,\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":null}}','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac eros nibh. Aliquam erat volutpat. Aenean non sem sit amet massa efficitur pellentesque sit amet nec turpis. Maecenas ornare nibh id consequat vestibulum. Quisque eu sem a massa fringilla varius. Duis nec felis porta, consectetur augue sit amet, porta est. Morbi imperdiet justo mi, ut aliquet diam bibendum eu. Etiam id enim non sem sollicitudin ultrices vel in purus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed at nisi rutrum, sollicitudin tellus vel, eleifend velit. Praesent sed molestie dolor.','<p>This article is a part of the Latest channel</p>','Welcome to Article 1',NULL),(114,114,1,'Article 2','2021-04-06 15:24:36','2021-04-06 15:24:36','ea72c75e-11ea-42be-b899-3a4cd0960957',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":{\"1\":\"Article 2\"},\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Article 2 - Craft CMS Boilerplate\",\"imageId\":\"\",\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Article 2 - Craft CMS Boilerplate\",\"imageId\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":\"\"}}','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac eros nibh. Aliquam erat volutpat. Aenean non sem sit amet massa efficitur pellentesque sit amet nec turpis. Maecenas ornare nibh id consequat vestibulum. Quisque eu sem a massa fringilla varius. Duis nec felis porta, consectetur augue sit amet, porta est. Morbi imperdiet justo mi, ut aliquet diam bibendum eu. Etiam id enim non sem sollicitudin ultrices vel in purus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed at nisi rutrum, sollicitudin tellus vel, eleifend velit. Praesent sed molestie dolor.','<p>This article is a part of the Latest channel</p>','Welcome to Article 1',NULL),(115,115,1,'Article 2','2021-04-06 15:24:44','2021-04-06 15:24:44','dc0f157c-33ae-4e3b-94fa-3f0d5428615f',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":{\"1\":\"Article 2\"},\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Article 2 - Craft CMS Boilerplate\",\"imageId\":\"\",\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Article 2 - Craft CMS Boilerplate\",\"imageId\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":\"\"}}','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac eros nibh. Aliquam erat volutpat. Aenean non sem sit amet massa efficitur pellentesque sit amet nec turpis. Maecenas ornare nibh id consequat vestibulum. Quisque eu sem a massa fringilla varius. Duis nec felis porta, consectetur augue sit amet, porta est. Morbi imperdiet justo mi, ut aliquet diam bibendum eu. Etiam id enim non sem sollicitudin ultrices vel in purus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed at nisi rutrum, sollicitudin tellus vel, eleifend velit. Praesent sed molestie dolor.','<p>This article is a part of the Latest channel</p>','Welcome to Article 2',NULL),(116,116,1,'Article 3','2021-04-06 15:24:57','2021-04-06 15:24:57','349c340f-54a3-431f-8df3-90c86963c360',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":[],\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"neutral\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Article 1 - Craft CMS Boilerplate\",\"imageId\":null,\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Article 1 - Craft CMS Boilerplate\",\"imageId\":null,\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":null}}','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac eros nibh. Aliquam erat volutpat. Aenean non sem sit amet massa efficitur pellentesque sit amet nec turpis. Maecenas ornare nibh id consequat vestibulum. Quisque eu sem a massa fringilla varius. Duis nec felis porta, consectetur augue sit amet, porta est. Morbi imperdiet justo mi, ut aliquet diam bibendum eu. Etiam id enim non sem sollicitudin ultrices vel in purus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed at nisi rutrum, sollicitudin tellus vel, eleifend velit. Praesent sed molestie dolor.','<p>This article is a part of the Latest channel</p>','Welcome to Article 3',NULL),(117,117,1,'Latest','2021-04-06 15:37:49','2021-04-06 15:37:49','baefefb5-1dab-476e-8453-dbc69b18fb2f',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":{\"1\":\"Latest\"},\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Latest - Craft CMS Boilerplate\",\"imageId\":\"\",\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Latest - Craft CMS Boilerplate\",\"imageId\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":\"\"}}',NULL,NULL,NULL,NULL),(118,118,1,NULL,'2021-04-06 15:37:49','2021-04-06 15:37:49','3e069789-0746-4c0c-a301-a2246d39ed35',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>You can edit this in the Latest Index single</p>','Welcome to the Latest Index page',NULL),(119,119,1,'Contact','2021-04-06 15:56:14','2021-04-06 15:56:14','4e403535-7a05-4f23-8dbb-1dc0a58f2fbe',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":{\"1\":\"Contact\"},\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Contact - Craft CMS Boilerplate\",\"imageId\":\"\",\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Contact - Craft CMS Boilerplate\",\"imageId\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":\"\"}}',NULL,NULL,NULL,NULL),(120,120,1,NULL,'2021-04-06 15:56:14','2021-04-06 15:56:14','80a236d7-4e1f-4ffd-aa2a-17b90516def1',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Edit this content in the Contact single</p>','Welcome to the Contact page',NULL),(121,121,1,NULL,'2021-04-06 15:56:14','2021-04-06 15:56:14','eb5c9359-aa91-41b6-888c-4163e23b1893',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac eros nibh. Aliquam erat volutpat. Aenean non sem sit amet massa efficitur pellentesque sit amet nec turpis. Maecenas ornare nibh id consequat vestibulum. Quisque eu sem a massa fringilla varius. Duis nec felis porta, consectetur augue sit amet, porta est. Morbi imperdiet justo mi, ut aliquet diam bibendum eu. Etiam id enim non sem sollicitudin ultrices vel in purus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed at nisi rutrum, sollicitudin tellus vel, eleifend velit. Praesent sed molestie dolor.</p>',NULL,NULL),(122,122,1,'2021-04-06 08:56:28','2021-04-06 15:56:28','2021-04-06 15:56:28','6a026be4-2937-4ff9-873b-800d7a96ae7f',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(123,123,1,'2021-04-06 08:58:40','2021-04-06 15:58:40','2021-04-06 15:58:40','5782bb27-c614-4ed1-8ca0-da54823b6f9e',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(124,124,1,'2021-04-06 08:59:01','2021-04-06 15:59:01','2021-04-06 15:59:01','333d3a73-5697-46fc-9f71-5460cdb94a4f',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(125,125,1,NULL,'2021-04-06 16:08:17','2021-04-07 08:54:20','0225750d-4d95-4de6-bb73-c7530fa2b83b',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,'Image Slider',NULL),(126,126,1,'Homepage','2021-04-06 16:08:17','2021-04-06 16:08:17','dfe5c494-cddb-4470-ab27-07df423db9c1',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":{\"1\":\"Homepage\"},\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Homepage - Future Forestry\",\"imageId\":\"\",\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Homepage - Future Forestry\",\"imageId\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":\"\"}}',NULL,NULL,NULL,NULL),(127,127,1,NULL,'2021-04-06 16:08:17','2021-04-06 16:08:17','f822b390-9dd0-4b06-a878-22eee1867176',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Edit this content in the Homepage single.</p>','Welcome to the homepage',NULL),(128,128,1,NULL,'2021-04-06 16:08:17','2021-04-06 16:08:17','f51d8329-62c0-4f6c-96e5-ff09da57b041',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac eros nibh. Aliquam erat volutpat. Aenean non sem sit amet massa efficitur pellentesque sit amet nec turpis. Maecenas ornare nibh id consequat vestibulum. Quisque eu sem a massa fringilla varius. Duis nec felis porta, consectetur augue sit amet, porta est. Morbi imperdiet justo mi, ut aliquet diam bibendum eu. Etiam id enim non sem sollicitudin ultrices vel in purus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed at nisi rutrum, sollicitudin tellus vel, eleifend velit. Praesent sed molestie dolor.</p>',NULL,NULL),(129,129,1,NULL,'2021-04-06 16:08:17','2021-04-06 16:08:17','fbda4725-368e-4906-bf10-a6750c37f50d',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,NULL,NULL),(130,130,1,NULL,'2021-04-06 16:08:17','2021-04-06 16:08:17','108d3159-2da5-4f15-a690-a2fd05094624',NULL,NULL,NULL,'bg-white',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(131,131,1,NULL,'2021-04-07 08:25:58','2021-04-07 09:42:14','98f4b006-0649-4c5c-9519-52370fe7aa0d',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,'Video',NULL),(132,132,1,'Homepage','2021-04-07 08:25:58','2021-04-07 08:25:58','e54fc80f-9942-4dc7-aa5a-6a5026838c96',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":{\"1\":\"Homepage\"},\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Homepage - Future Forestry\",\"imageId\":\"\",\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Homepage - Future Forestry\",\"imageId\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":\"\"}}',NULL,NULL,NULL,NULL),(133,133,1,NULL,'2021-04-07 08:25:58','2021-04-07 08:25:58','857caa00-3a02-42cb-a55b-6918487d2e0e',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Edit this content in the Homepage single.</p>','Welcome to the homepage',NULL),(134,134,1,NULL,'2021-04-07 08:25:58','2021-04-07 08:25:58','d775693f-1b3a-4541-97a4-1ca163b9094f',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac eros nibh. Aliquam erat volutpat. Aenean non sem sit amet massa efficitur pellentesque sit amet nec turpis. Maecenas ornare nibh id consequat vestibulum. Quisque eu sem a massa fringilla varius. Duis nec felis porta, consectetur augue sit amet, porta est. Morbi imperdiet justo mi, ut aliquet diam bibendum eu. Etiam id enim non sem sollicitudin ultrices vel in purus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed at nisi rutrum, sollicitudin tellus vel, eleifend velit. Praesent sed molestie dolor.</p>',NULL,NULL),(135,135,1,NULL,'2021-04-07 08:25:58','2021-04-07 08:25:58','e80ab370-5fbd-455b-950d-f98339e5236a',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,NULL,NULL),(136,136,1,NULL,'2021-04-07 08:25:58','2021-04-07 08:25:58','dcfbf8e5-c876-4c17-a5c5-a7ee56e9899b',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,NULL,NULL),(137,137,1,NULL,'2021-04-07 08:25:58','2021-04-07 08:25:58','5046f5c2-b59b-4086-b0ba-7ef3c9aa3881',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,NULL,NULL),(138,138,1,NULL,'2021-04-07 08:54:20','2021-04-07 09:24:32','1f9b0c52-5ddf-4e17-9d41-72960548b644',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,'Accordion',NULL),(139,141,1,'Homepage','2021-04-07 08:54:20','2021-04-07 08:54:20','874805f3-b992-42d1-be6a-71424c1f65b4',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":{\"1\":\"Homepage\"},\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Homepage - Future Forestry\",\"imageId\":\"\",\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Homepage - Future Forestry\",\"imageId\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":\"\"}}',NULL,NULL,NULL,NULL),(140,142,1,NULL,'2021-04-07 08:54:20','2021-04-07 08:54:20','14d7b0d7-3d5e-409b-9b55-c2600e7118c9',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Edit this content in the Homepage single.</p>','Welcome to the homepage',NULL),(141,143,1,NULL,'2021-04-07 08:54:20','2021-04-07 08:54:20','50019ffb-c0c0-48bf-b464-b8abd4182836',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac eros nibh. Aliquam erat volutpat. Aenean non sem sit amet massa efficitur pellentesque sit amet nec turpis. Maecenas ornare nibh id consequat vestibulum. Quisque eu sem a massa fringilla varius. Duis nec felis porta, consectetur augue sit amet, porta est. Morbi imperdiet justo mi, ut aliquet diam bibendum eu. Etiam id enim non sem sollicitudin ultrices vel in purus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed at nisi rutrum, sollicitudin tellus vel, eleifend velit. Praesent sed molestie dolor.</p>',NULL,NULL),(142,144,1,NULL,'2021-04-07 08:54:20','2021-04-07 08:54:20','ca4cdc04-56c0-4807-aefb-48333e569da5',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,NULL,NULL),(143,145,1,NULL,'2021-04-07 08:54:20','2021-04-07 08:54:20','f8f59e56-eb32-40d7-b3ad-034447db4f7f',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,'Image Slider',NULL),(144,146,1,NULL,'2021-04-07 08:54:20','2021-04-07 08:54:20','6f2d7ba1-9c83-4f02-a1d8-b96b966f4407',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,'Video',NULL),(145,147,1,NULL,'2021-04-07 08:54:20','2021-04-07 08:54:20','5dc7b10d-d5c9-472f-8ef2-8dd862811b66',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,'Accordion',NULL),(146,151,1,'Homepage','2021-04-07 09:24:33','2021-04-07 09:24:33','603e67bc-6357-4c75-ac42-1ced69887404',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":{\"1\":\"Homepage\"},\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Homepage - Future Forestry\",\"imageId\":\"\",\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Homepage - Future Forestry\",\"imageId\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":\"\"}}',NULL,NULL,NULL,NULL),(147,152,1,NULL,'2021-04-07 09:24:33','2021-04-07 09:24:33','d7bf012c-ba32-446a-b129-1dd0d2a6c167',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Edit this content in the Homepage single.</p>','Welcome to the homepage',NULL),(148,153,1,NULL,'2021-04-07 09:24:33','2021-04-07 09:24:33','1aae8881-3aad-4c45-b37a-db0d0c812d2f',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac eros nibh. Aliquam erat volutpat. Aenean non sem sit amet massa efficitur pellentesque sit amet nec turpis. Maecenas ornare nibh id consequat vestibulum. Quisque eu sem a massa fringilla varius. Duis nec felis porta, consectetur augue sit amet, porta est. Morbi imperdiet justo mi, ut aliquet diam bibendum eu. Etiam id enim non sem sollicitudin ultrices vel in purus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed at nisi rutrum, sollicitudin tellus vel, eleifend velit. Praesent sed molestie dolor.</p>',NULL,NULL),(149,154,1,NULL,'2021-04-07 09:24:33','2021-04-07 09:24:33','7d85ba12-4840-4e1b-aee9-8f4e49c3fe12',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,NULL,NULL),(150,155,1,NULL,'2021-04-07 09:24:33','2021-04-07 09:24:33','d2baa19f-46f4-43b9-9814-750e836b5ce4',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,'Image Slider',NULL),(151,156,1,NULL,'2021-04-07 09:24:33','2021-04-07 09:24:33','8b6a0605-efcc-49d6-8c92-f9490254d9e0',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,'Video',NULL),(152,157,1,NULL,'2021-04-07 09:24:33','2021-04-07 09:24:33','e0210940-6c06-4cb4-b2f7-800e9e878bb9',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,'Accordion',NULL),(153,162,1,'Homepage','2021-04-07 09:31:18','2021-04-07 09:31:18','99002278-935c-48f4-ad89-38b17a7b2f1a',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":{\"1\":\"Homepage\"},\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Homepage - Future Forestry\",\"imageId\":\"\",\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Homepage - Future Forestry\",\"imageId\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":\"\"}}',NULL,NULL,NULL,NULL),(154,163,1,NULL,'2021-04-07 09:31:18','2021-04-07 09:31:18','3a874187-2c86-49e5-aa0b-1bad3f600242',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Edit this content in the Homepage single.</p>','Welcome to the homepage',NULL),(155,164,1,NULL,'2021-04-07 09:31:18','2021-04-07 09:31:18','09a967b8-4c64-4424-b8ce-f2e93b7119a6',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac eros nibh. Aliquam erat volutpat. Aenean non sem sit amet massa efficitur pellentesque sit amet nec turpis. Maecenas ornare nibh id consequat vestibulum. Quisque eu sem a massa fringilla varius. Duis nec felis porta, consectetur augue sit amet, porta est. Morbi imperdiet justo mi, ut aliquet diam bibendum eu. Etiam id enim non sem sollicitudin ultrices vel in purus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed at nisi rutrum, sollicitudin tellus vel, eleifend velit. Praesent sed molestie dolor.</p>',NULL,NULL),(156,165,1,NULL,'2021-04-07 09:31:18','2021-04-07 09:31:18','17e94243-7511-4e2c-838e-d4c021d27b76',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,NULL,NULL),(157,166,1,NULL,'2021-04-07 09:31:18','2021-04-07 09:31:18','bc9bf906-2764-45f6-9352-57ec8d3dbe88',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,'Image Slider',NULL),(158,167,1,NULL,'2021-04-07 09:31:18','2021-04-07 09:31:18','4c53ae2b-ba15-4feb-8d43-c0e6a8f138ff',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,'Video',NULL),(159,169,1,NULL,'2021-04-07 09:31:18','2021-04-07 09:31:18','0fe99a2d-78c4-495a-85e8-b6855cf47689',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,'Accordion',NULL),(160,174,1,'Homepage','2021-04-07 09:42:14','2021-04-07 09:42:14','f93d104a-138f-4af5-81a0-1f49fc1bfce2',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":{\"1\":\"Homepage\"},\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Homepage - Future Forestry\",\"imageId\":\"\",\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Homepage - Future Forestry\",\"imageId\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":\"\"}}',NULL,NULL,NULL,NULL),(161,175,1,NULL,'2021-04-07 09:42:14','2021-04-07 09:42:14','8a4375f6-a738-4bb2-a1b4-dffe3ef500b0',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Edit this content in the Homepage single.</p>','Welcome to the homepage',NULL),(162,176,1,NULL,'2021-04-07 09:42:14','2021-04-07 09:42:14','b27fed9e-71b4-4127-82da-2bd25330e8fe',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac eros nibh. Aliquam erat volutpat. Aenean non sem sit amet massa efficitur pellentesque sit amet nec turpis. Maecenas ornare nibh id consequat vestibulum. Quisque eu sem a massa fringilla varius. Duis nec felis porta, consectetur augue sit amet, porta est. Morbi imperdiet justo mi, ut aliquet diam bibendum eu. Etiam id enim non sem sollicitudin ultrices vel in purus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed at nisi rutrum, sollicitudin tellus vel, eleifend velit. Praesent sed molestie dolor.</p>',NULL,NULL),(163,177,1,NULL,'2021-04-07 09:42:14','2021-04-07 09:42:14','7ea0d1b1-b634-4da8-a7ac-3e47c9ecc4ec',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,NULL,NULL),(164,178,1,NULL,'2021-04-07 09:42:14','2021-04-07 09:42:14','23d63636-7854-4f4e-9b99-25e69ff3ccd7',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,'Image Slider',NULL),(165,179,1,NULL,'2021-04-07 09:42:14','2021-04-07 09:42:14','0fdc1a14-2da2-4e03-aa96-fc47063f45c3',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,'Video',NULL),(166,181,1,NULL,'2021-04-07 09:42:14','2021-04-07 09:42:14','e0df6fd7-529d-48f5-9b4f-2dda8c2648ed',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,'Accordion',NULL),(167,185,1,NULL,'2021-04-07 09:55:25','2021-04-07 09:55:25','d679cd07-60ae-4fe2-9ffd-af682daa0668',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,NULL,NULL),(168,188,1,'Homepage','2021-04-07 09:55:25','2021-04-07 09:55:25','fb5063b0-2c52-4a5b-b6c5-c43c70708ede',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":{\"1\":\"Homepage\"},\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Homepage - Future Forestry\",\"imageId\":\"\",\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Homepage - Future Forestry\",\"imageId\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":\"\"}}',NULL,NULL,NULL,NULL),(169,189,1,NULL,'2021-04-07 09:55:25','2021-04-07 09:55:25','70dff89e-53bc-46c4-bdbf-52f73343fb12',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Edit this content in the Homepage single.</p>','Welcome to the homepage',NULL),(170,190,1,NULL,'2021-04-07 09:55:25','2021-04-07 09:55:25','9af72788-5c3a-404d-a61d-56fcc9263b72',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac eros nibh. Aliquam erat volutpat. Aenean non sem sit amet massa efficitur pellentesque sit amet nec turpis. Maecenas ornare nibh id consequat vestibulum. Quisque eu sem a massa fringilla varius. Duis nec felis porta, consectetur augue sit amet, porta est. Morbi imperdiet justo mi, ut aliquet diam bibendum eu. Etiam id enim non sem sollicitudin ultrices vel in purus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed at nisi rutrum, sollicitudin tellus vel, eleifend velit. Praesent sed molestie dolor.</p>',NULL,NULL),(171,191,1,NULL,'2021-04-07 09:55:25','2021-04-07 09:55:25','60805021-9431-477a-97bb-9d803042a443',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,NULL,NULL),(172,194,1,NULL,'2021-04-07 09:55:25','2021-04-07 09:55:25','9d60effb-d3a5-483e-bc17-0414e25fea9a',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,NULL,NULL),(173,195,1,NULL,'2021-04-07 09:55:25','2021-04-07 09:55:25','d503e48e-eb9f-4b0b-a226-ae8e8a71f203',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,'Image Slider',NULL),(174,196,1,NULL,'2021-04-07 09:55:25','2021-04-07 09:55:25','b1f76be9-7e6c-4435-87fb-636a3cd0d977',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,'Video',NULL),(175,198,1,NULL,'2021-04-07 09:55:25','2021-04-07 09:55:25','8edb1297-0b8d-4b60-bfb5-c9d6c871df9f',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,'Accordion',NULL);
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `craftidtokens`
--

LOCK TABLES `craftidtokens` WRITE;
/*!40000 ALTER TABLE `craftidtokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `craftidtokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `deprecationerrors`
--

LOCK TABLES `deprecationerrors` WRITE;
/*!40000 ALTER TABLE `deprecationerrors` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `deprecationerrors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `drafts`
--

LOCK TABLES `drafts` WRITE;
/*!40000 ALTER TABLE `drafts` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `drafts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elementindexsettings`
--

LOCK TABLES `elementindexsettings` WRITE;
/*!40000 ALTER TABLE `elementindexsettings` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `elementindexsettings` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2021-03-30 09:20:10','2021-03-30 14:54:16',NULL,'841f42bf-e78d-4e7d-8e5c-20454f6f2201'),(2,NULL,NULL,2,'craft\\elements\\GlobalSet',1,0,'2021-03-30 09:31:09','2021-04-06 15:39:52',NULL,'7fc480fa-d689-40a4-9f68-2e36e07830d5'),(3,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2021-03-30 09:38:29','2021-04-07 09:55:25',NULL,'093493de-84ad-4569-a7ca-1b1f74298f19'),(4,NULL,1,3,'craft\\elements\\Entry',1,0,'2021-03-30 09:38:29','2021-03-30 09:38:29',NULL,'833d4d6d-5d08-4a90-8643-cb21e5ce6701'),(5,NULL,2,3,'craft\\elements\\Entry',1,0,'2021-03-30 09:38:52','2021-03-30 09:38:52',NULL,'114734d1-ea16-4c88-af36-9dcaa5de1a57'),(6,NULL,3,3,'craft\\elements\\Entry',1,0,'2021-03-30 10:13:09','2021-03-30 10:13:09',NULL,'3e9cb845-4cc8-44b6-9640-66fc55ec77c0'),(7,NULL,NULL,6,'benf\\neo\\elements\\Block',1,0,'2021-03-30 10:33:15','2021-03-30 10:33:15','2021-03-30 14:30:03','53ec91c5-34b0-4caa-bb81-f73f7ce46d3e'),(8,NULL,NULL,4,'benf\\neo\\elements\\Block',1,0,'2021-03-30 10:33:15','2021-03-30 10:33:15','2021-03-30 14:30:04','03451c17-a315-4943-89be-eef00ab1c24a'),(9,NULL,NULL,5,'benf\\neo\\elements\\Block',1,0,'2021-03-30 10:33:15','2021-03-30 10:33:15','2021-03-30 14:30:04','3257d544-32f0-4657-a07e-39298e9e85d9'),(10,NULL,4,3,'craft\\elements\\Entry',1,0,'2021-03-30 10:33:15','2021-03-30 10:33:15',NULL,'3ab7d6b6-7ba4-46ad-8d4f-90e827ef5bb6'),(11,NULL,NULL,6,'benf\\neo\\elements\\Block',1,0,'2021-03-30 10:33:15','2021-03-30 10:33:15',NULL,'33a981dd-0bcc-427a-9513-0d38c4d81aab'),(12,NULL,NULL,4,'benf\\neo\\elements\\Block',1,0,'2021-03-30 10:33:15','2021-03-30 10:33:15',NULL,'e0e7378f-d52c-45b7-a0c9-d26c20896b1f'),(13,NULL,NULL,5,'benf\\neo\\elements\\Block',1,0,'2021-03-30 10:33:15','2021-03-30 10:33:15',NULL,'baf8b70d-f945-472d-be11-2816027c1504'),(14,NULL,NULL,7,'craft\\elements\\Entry',1,0,'2021-03-30 11:04:36','2021-03-30 11:09:56','2021-03-30 14:30:19','56222523-96f8-4544-bae7-20ead55bb15b'),(15,NULL,5,7,'craft\\elements\\Entry',1,0,'2021-03-30 11:04:36','2021-03-30 11:04:36','2021-03-30 14:30:19','99046eec-a793-4270-bb15-59a2f3e1d31f'),(16,NULL,6,7,'craft\\elements\\Entry',1,0,'2021-03-30 11:05:00','2021-03-30 11:05:00','2021-03-30 14:30:19','231e69e7-4d92-4b97-a774-392fc441e87e'),(17,NULL,NULL,8,'craft\\elements\\Entry',1,0,'2021-03-30 11:05:32','2021-03-30 11:10:02','2021-03-30 14:30:22','37b892b0-66c3-4490-8db9-f4b751e11dd0'),(18,NULL,7,8,'craft\\elements\\Entry',1,0,'2021-03-30 11:05:32','2021-03-30 11:05:32','2021-03-30 14:30:22','ace1cfc8-a7c8-4065-a2ba-69aaeb843c2e'),(19,NULL,8,8,'craft\\elements\\Entry',1,0,'2021-03-30 11:06:23','2021-03-30 11:06:23','2021-03-30 14:30:22','3ef44417-fd7c-4c16-ae7a-b74b8ea3305b'),(20,NULL,NULL,6,'benf\\neo\\elements\\Block',1,0,'2021-03-30 11:07:21','2021-03-30 11:07:21','2021-03-30 14:30:22','096998e5-7667-4cab-a3e9-a697cd9be12b'),(21,NULL,NULL,5,'benf\\neo\\elements\\Block',1,0,'2021-03-30 11:07:21','2021-03-30 11:07:21','2021-03-30 14:30:22','c309769f-95b0-49dd-8772-2a3a5d36548a'),(22,NULL,9,8,'craft\\elements\\Entry',1,0,'2021-03-30 11:07:21','2021-03-30 11:07:21','2021-03-30 14:30:22','6e187459-a2fb-43f0-bcfa-a7fabb3171bc'),(23,NULL,NULL,6,'benf\\neo\\elements\\Block',1,0,'2021-03-30 11:07:21','2021-03-30 11:07:21',NULL,'172bf3eb-6841-4957-a90f-ed14b5eae277'),(24,NULL,NULL,5,'benf\\neo\\elements\\Block',1,0,'2021-03-30 11:07:21','2021-03-30 11:07:21',NULL,'aba4a19f-5b81-47bd-84b1-ed97080f0238'),(25,NULL,NULL,6,'benf\\neo\\elements\\Block',1,0,'2021-03-30 11:07:50','2021-03-30 11:07:50','2021-03-30 14:30:19','e38294a9-7498-45d9-9271-b9ab27f0b216'),(26,NULL,NULL,5,'benf\\neo\\elements\\Block',1,0,'2021-03-30 11:07:50','2021-03-30 11:07:50','2021-03-30 14:30:19','0234229f-8577-4532-952b-42f5a923a4a2'),(27,NULL,10,7,'craft\\elements\\Entry',1,0,'2021-03-30 11:07:50','2021-03-30 11:07:50','2021-03-30 14:30:19','dab13f32-71f7-4baa-83d2-5d9440cddcc5'),(28,NULL,NULL,6,'benf\\neo\\elements\\Block',1,0,'2021-03-30 11:07:50','2021-03-30 11:07:50',NULL,'a3f74c1b-60ec-4a84-82d3-3a2578e8fc17'),(29,NULL,NULL,5,'benf\\neo\\elements\\Block',1,0,'2021-03-30 11:07:50','2021-03-30 11:07:50',NULL,'26da37a6-ed18-4a57-ab57-911a4137c44d'),(30,NULL,11,7,'craft\\elements\\Entry',1,0,'2021-03-30 11:09:07','2021-03-30 11:09:07','2021-03-30 14:30:19','f28df747-61a2-4093-b6b6-0b08a83bf468'),(31,NULL,NULL,6,'benf\\neo\\elements\\Block',1,0,'2021-03-30 11:09:07','2021-03-30 11:07:50',NULL,'e8f6fbfb-f62b-4f6a-96bc-33ca43fd889a'),(32,NULL,NULL,5,'benf\\neo\\elements\\Block',1,0,'2021-03-30 11:09:07','2021-03-30 11:07:50',NULL,'bd80cbc8-3d38-42d1-95f1-9543aa04e7d8'),(33,NULL,12,8,'craft\\elements\\Entry',1,0,'2021-03-30 11:09:29','2021-03-30 11:09:29','2021-03-30 14:30:22','db1589d4-f0ca-492c-a13b-a2ec890a4e7e'),(34,NULL,NULL,6,'benf\\neo\\elements\\Block',1,0,'2021-03-30 11:09:29','2021-03-30 11:07:21',NULL,'f46ad37b-cbe4-4edb-ba06-f58a6c2d05f5'),(35,NULL,NULL,5,'benf\\neo\\elements\\Block',1,0,'2021-03-30 11:09:29','2021-03-30 11:07:21',NULL,'921f963c-4745-4027-a9f5-ff5ed58fc278'),(36,NULL,13,7,'craft\\elements\\Entry',1,0,'2021-03-30 11:09:56','2021-03-30 11:09:56','2021-03-30 14:30:19','ba5d4245-c57a-478d-a9e0-ac68561743dd'),(37,NULL,NULL,6,'benf\\neo\\elements\\Block',1,0,'2021-03-30 11:09:56','2021-03-30 11:07:50',NULL,'ea580b5a-a710-4c2d-803a-e7cf3c98551e'),(38,NULL,NULL,5,'benf\\neo\\elements\\Block',1,0,'2021-03-30 11:09:56','2021-03-30 11:07:50',NULL,'79d2df55-be62-4991-bdec-60e9a6bae088'),(39,NULL,14,8,'craft\\elements\\Entry',1,0,'2021-03-30 11:10:02','2021-03-30 11:10:02','2021-03-30 14:30:22','b276598c-eb1b-41eb-b3d0-647d93bd2ab1'),(40,NULL,NULL,6,'benf\\neo\\elements\\Block',1,0,'2021-03-30 11:10:02','2021-03-30 11:07:21',NULL,'4b2f2572-2203-424d-a230-01dd4dd67087'),(41,NULL,NULL,5,'benf\\neo\\elements\\Block',1,0,'2021-03-30 11:10:02','2021-03-30 11:07:21',NULL,'b550d6c9-836d-4cc6-8d93-b787d8ad5113'),(42,NULL,NULL,NULL,'verbb\\navigation\\elements\\Node',1,0,'2021-03-30 11:14:00','2021-03-30 11:14:00','2021-03-30 14:28:25','d2a3006e-1fe2-4717-a52e-8bffe441b0cb'),(43,NULL,NULL,NULL,'verbb\\navigation\\elements\\Node',1,0,'2021-03-30 11:14:00','2021-03-30 11:14:00','2021-03-30 14:28:25','d1708f5a-716b-4344-9dfe-263689cc7733'),(44,NULL,NULL,NULL,'verbb\\navigation\\elements\\Node',1,0,'2021-03-30 11:14:00','2021-03-30 11:14:00','2021-03-30 14:28:25','1b06bf03-fe98-4ce5-a99c-0c464fe17e90'),(45,NULL,NULL,10,'craft\\elements\\GlobalSet',1,0,'2021-03-30 13:16:05','2021-03-30 13:16:05',NULL,'5ad54cb8-e9b5-495e-a5d0-26b66062cf7d'),(46,NULL,NULL,NULL,'Solspace\\Freeform\\Elements\\Submission',1,0,'2021-03-30 13:47:51','2021-03-30 13:47:51',NULL,'0ff2ad00-4cf3-4ccb-a028-8a727fa4335a'),(47,NULL,NULL,NULL,'Solspace\\Freeform\\Elements\\Submission',1,0,'2021-03-30 13:53:33','2021-03-30 13:53:33',NULL,'4a2de4e8-8ca8-4d35-8606-4cdb5e3cb917'),(48,NULL,NULL,NULL,'Solspace\\Freeform\\Elements\\Submission',1,0,'2021-03-30 13:54:15','2021-03-30 13:54:15',NULL,'f47330ec-1981-45ab-b350-35b6d6ab6644'),(49,NULL,15,3,'craft\\elements\\Entry',1,0,'2021-03-30 14:30:03','2021-03-30 14:30:03',NULL,'20f5502e-5ec5-464e-8604-f303fa03abaa'),(50,NULL,NULL,6,'benf\\neo\\elements\\Block',1,0,'2021-03-30 14:58:55','2021-03-30 15:00:14',NULL,'6013eceb-059d-4750-917c-d16d9327b3c0'),(51,NULL,NULL,4,'benf\\neo\\elements\\Block',1,0,'2021-03-30 14:58:55','2021-03-30 15:00:14',NULL,'502ffbdd-ca71-46e7-81cb-ece009cad567'),(52,NULL,NULL,5,'benf\\neo\\elements\\Block',1,0,'2021-03-30 14:58:55','2021-03-30 14:58:55',NULL,'97b17595-51d8-49a7-bd3d-bc5e7f096483'),(53,NULL,16,3,'craft\\elements\\Entry',1,0,'2021-03-30 14:58:55','2021-03-30 14:58:55',NULL,'40ed4f88-b23b-4118-8cb0-79c237042b9e'),(54,NULL,NULL,6,'benf\\neo\\elements\\Block',1,0,'2021-03-30 14:58:55','2021-03-30 14:58:55',NULL,'44a9747b-33c3-40c8-b1a7-7990ff48da1a'),(55,NULL,NULL,4,'benf\\neo\\elements\\Block',1,0,'2021-03-30 14:58:55','2021-03-30 14:58:55',NULL,'77eec295-b9c2-4a3a-b9fd-327171bf567c'),(56,NULL,NULL,5,'benf\\neo\\elements\\Block',1,0,'2021-03-30 14:58:55','2021-03-30 14:58:55',NULL,'d0ba2204-e58a-4182-a427-3b5ef75553e7'),(57,NULL,17,3,'craft\\elements\\Entry',1,0,'2021-03-30 15:00:14','2021-03-30 15:00:14',NULL,'07511b03-650f-4890-818c-3b54196f72b3'),(58,NULL,NULL,6,'benf\\neo\\elements\\Block',1,0,'2021-03-30 15:00:15','2021-03-30 15:00:14',NULL,'d03559c7-23ba-460b-8b16-ca19bad2da3a'),(59,NULL,NULL,4,'benf\\neo\\elements\\Block',1,0,'2021-03-30 15:00:15','2021-03-30 15:00:14',NULL,'8296b156-69b0-4e08-84f4-a7a7ea913fcc'),(60,NULL,NULL,5,'benf\\neo\\elements\\Block',1,0,'2021-03-30 15:00:15','2021-03-30 14:58:55',NULL,'47fc62b5-cb92-4b8b-8ff2-4451438f23d6'),(61,NULL,NULL,11,'craft\\elements\\Entry',1,0,'2021-03-31 11:24:42','2021-03-31 11:33:02',NULL,'ba2216af-19e4-49f3-8e6b-8b632d9e082c'),(62,NULL,18,11,'craft\\elements\\Entry',1,0,'2021-03-31 11:24:42','2021-03-31 11:24:42',NULL,'66c977d9-c3f4-420e-99ca-babe2bdda76e'),(63,NULL,19,11,'craft\\elements\\Entry',1,0,'2021-03-31 11:25:22','2021-03-31 11:25:22',NULL,'3a626847-9579-4714-bcca-e277e21232f2'),(64,NULL,NULL,12,'craft\\elements\\Entry',1,0,'2021-03-31 11:25:46','2021-04-06 15:56:14',NULL,'122568c7-8df0-4bac-b2a8-a8671b2d266e'),(65,NULL,20,12,'craft\\elements\\Entry',1,0,'2021-03-31 11:25:46','2021-03-31 11:25:46',NULL,'ab1dd1cb-92aa-456b-95a0-ed99ea74a07b'),(66,NULL,21,11,'craft\\elements\\Entry',1,0,'2021-03-31 11:26:20','2021-03-31 11:26:20',NULL,'7ed0aec0-ae2b-4b8e-8659-ee96f2080e82'),(67,NULL,22,11,'craft\\elements\\Entry',1,0,'2021-03-31 11:26:21','2021-03-31 11:26:21',NULL,'728cfee8-23d0-4806-b085-1c814a3df8cd'),(68,NULL,NULL,13,'craft\\elements\\Entry',1,0,'2021-03-31 11:27:00','2021-04-06 15:37:48',NULL,'4c9ec4bc-083b-4bc3-abf1-3f540d9b99ce'),(69,NULL,23,13,'craft\\elements\\Entry',1,0,'2021-03-31 11:27:00','2021-03-31 11:27:00',NULL,'214df264-68a3-4097-ad76-b67535e21a55'),(70,NULL,24,13,'craft\\elements\\Entry',1,0,'2021-03-31 11:28:06','2021-03-31 11:28:06',NULL,'2be35b4b-26cc-429e-ba4f-3c75b69c8511'),(71,NULL,25,12,'craft\\elements\\Entry',1,0,'2021-03-31 11:28:32','2021-03-31 11:28:32',NULL,'813cb24b-3dc6-4095-bc89-821f6c1e702d'),(72,NULL,NULL,6,'benf\\neo\\elements\\Block',1,0,'2021-03-31 11:33:02','2021-03-31 11:33:02',NULL,'84ff9e45-9a0a-4713-abbd-f2b12509c36c'),(73,NULL,NULL,4,'benf\\neo\\elements\\Block',1,0,'2021-03-31 11:33:02','2021-03-31 11:33:02',NULL,'7c46760f-0e8b-4896-9e1d-963a3b21b7cd'),(74,NULL,NULL,5,'benf\\neo\\elements\\Block',1,0,'2021-03-31 11:33:02','2021-03-31 11:33:02',NULL,'b1eb6d71-4b79-43e2-acf8-d6bd81ddf30a'),(75,NULL,26,11,'craft\\elements\\Entry',1,0,'2021-03-31 11:33:02','2021-03-31 11:33:02',NULL,'00f749a6-9639-4840-ae27-851b51142d6d'),(76,NULL,NULL,6,'benf\\neo\\elements\\Block',1,0,'2021-03-31 11:33:02','2021-03-31 11:33:02',NULL,'989adcd6-cd94-480d-8224-84a9f9bd7d5a'),(77,NULL,NULL,4,'benf\\neo\\elements\\Block',1,0,'2021-03-31 11:33:02','2021-03-31 11:33:02',NULL,'58b53042-8220-4635-95f9-bc16bcdb7597'),(78,NULL,NULL,5,'benf\\neo\\elements\\Block',1,0,'2021-03-31 11:33:02','2021-03-31 11:33:02',NULL,'be0074fd-b034-414e-a2c7-bd2ad037d940'),(79,NULL,NULL,6,'benf\\neo\\elements\\Block',1,0,'2021-03-31 11:33:38','2021-03-31 11:33:38',NULL,'a67fa8c4-f74f-4361-9e9c-a54585739abf'),(80,NULL,NULL,4,'benf\\neo\\elements\\Block',1,0,'2021-03-31 11:33:39','2021-03-31 11:33:39',NULL,'91763de7-a5ae-4bbd-9743-8edb8902f145'),(81,NULL,NULL,5,'benf\\neo\\elements\\Block',1,0,'2021-03-31 11:33:39','2021-03-31 11:33:39','2021-04-06 15:56:14','c0a8248f-a147-44cb-b327-b1187f77e6fa'),(82,NULL,27,12,'craft\\elements\\Entry',1,0,'2021-03-31 11:33:38','2021-03-31 11:33:38',NULL,'59e9024e-9022-467c-92e4-2271e49d01fc'),(83,NULL,NULL,6,'benf\\neo\\elements\\Block',1,0,'2021-03-31 11:33:39','2021-03-31 11:33:38',NULL,'236d7711-f731-4053-b62c-f54618b1473d'),(84,NULL,NULL,4,'benf\\neo\\elements\\Block',1,0,'2021-03-31 11:33:39','2021-03-31 11:33:39',NULL,'e30ee1a3-79b9-46cb-a1d2-92f49fc256e9'),(85,NULL,NULL,5,'benf\\neo\\elements\\Block',1,0,'2021-03-31 11:33:39','2021-03-31 11:33:39',NULL,'d6702b71-a8b2-44de-bfd8-81377e1a9aa6'),(86,NULL,NULL,6,'benf\\neo\\elements\\Block',1,0,'2021-03-31 11:34:47','2021-03-31 11:34:47',NULL,'c7800843-4c5d-423a-ba7c-dda8eac02199'),(87,NULL,NULL,4,'benf\\neo\\elements\\Block',1,0,'2021-03-31 11:34:47','2021-03-31 11:34:47',NULL,'fd816165-e623-4c59-a9db-4721307b234a'),(88,NULL,NULL,5,'benf\\neo\\elements\\Block',1,0,'2021-03-31 11:34:48','2021-03-31 11:34:48',NULL,'68f38a66-9197-4b38-8962-d950bcbd6e28'),(89,NULL,28,13,'craft\\elements\\Entry',1,0,'2021-03-31 11:34:47','2021-03-31 11:34:47',NULL,'591fd3e6-65ca-4a5f-ab6f-217f08ee2044'),(90,NULL,NULL,6,'benf\\neo\\elements\\Block',1,0,'2021-03-31 11:34:48','2021-03-31 11:34:47',NULL,'b79f9070-ffd6-4928-8ef2-ad0fd08c59c4'),(91,NULL,NULL,4,'benf\\neo\\elements\\Block',1,0,'2021-03-31 11:34:48','2021-03-31 11:34:47',NULL,'5e6f68ff-23b5-4932-ab33-74d0a613a45d'),(92,NULL,NULL,5,'benf\\neo\\elements\\Block',1,0,'2021-03-31 11:34:48','2021-03-31 11:34:48',NULL,'641900c4-b512-4b78-9add-7ce2be14f8a6'),(94,NULL,NULL,14,'craft\\elements\\Entry',1,0,'2021-03-31 11:36:41','2021-03-31 11:36:41',NULL,'0ef08230-85dd-41d4-8fd6-13478a036b70'),(95,NULL,29,14,'craft\\elements\\Entry',1,0,'2021-03-31 11:36:41','2021-03-31 11:36:41',NULL,'24513e6e-2df6-4f2a-a4d1-0fce606bfa61'),(96,NULL,NULL,NULL,'verbb\\navigation\\elements\\Node',1,0,'2021-03-31 11:37:26','2021-04-06 15:37:48',NULL,'fbd207ac-b795-48ba-8f21-a1b49a75190e'),(97,NULL,NULL,NULL,'verbb\\navigation\\elements\\Node',1,0,'2021-03-31 11:37:26','2021-04-06 15:56:14',NULL,'1800ceb7-8120-4286-b9fe-fb2ec7caa71a'),(98,NULL,NULL,NULL,'verbb\\navigation\\elements\\Node',1,0,'2021-03-31 11:37:26','2021-03-31 11:37:26',NULL,'2dfee5fa-2b3e-45ad-a238-186bd3b4aeac'),(99,NULL,NULL,NULL,'verbb\\navigation\\elements\\Node',1,0,'2021-03-31 11:37:26','2021-04-07 09:55:24',NULL,'310df44b-6d54-496c-9333-9e5d414f3582'),(100,NULL,NULL,NULL,'verbb\\navigation\\elements\\Node',1,0,'2021-03-31 11:38:08','2021-04-06 15:37:48',NULL,'445fb3fb-862b-4921-a489-03e85051dd73'),(101,NULL,NULL,NULL,'verbb\\navigation\\elements\\Node',1,0,'2021-03-31 11:38:08','2021-04-06 15:56:14',NULL,'923929cd-dc84-40e6-925b-520d5e65db67'),(102,NULL,NULL,NULL,'verbb\\navigation\\elements\\Node',1,0,'2021-03-31 11:38:08','2021-03-31 11:38:08',NULL,'a8c40352-f066-4512-82f9-0a978dc3166c'),(103,NULL,NULL,NULL,'verbb\\navigation\\elements\\Node',1,0,'2021-03-31 11:38:08','2021-04-07 09:55:24',NULL,'4c99388a-3fd6-47fa-919f-8fdc9ea6f120'),(104,NULL,30,13,'craft\\elements\\Entry',1,0,'2021-03-31 11:43:49','2021-03-31 11:43:49',NULL,'443d78ed-caea-4440-a353-fb7f1fa64515'),(105,NULL,NULL,6,'benf\\neo\\elements\\Block',1,0,'2021-03-31 11:43:49','2021-03-31 11:34:47',NULL,'51bc007c-cfa7-43ca-b0f9-25aeeb7c6078'),(106,NULL,NULL,4,'benf\\neo\\elements\\Block',1,0,'2021-03-31 11:43:49','2021-03-31 11:34:47',NULL,'771ec02d-00b4-45da-9e74-5349937428ae'),(107,NULL,NULL,5,'benf\\neo\\elements\\Block',1,0,'2021-03-31 11:43:49','2021-03-31 11:34:48',NULL,'ed852db6-82e3-4ad0-9e91-2f6be03b7927'),(108,NULL,NULL,NULL,'verbb\\navigation\\elements\\Node',1,0,'2021-03-31 13:07:33','2021-03-31 13:07:33',NULL,'cca876f5-ecdf-41e7-a03d-26ba632a7df2'),(109,NULL,NULL,14,'craft\\elements\\Entry',1,0,'2021-04-06 12:32:18','2021-04-06 15:24:44',NULL,'c19d6408-cd1f-4543-a35b-f426b7e91ecd'),(110,NULL,31,14,'craft\\elements\\Entry',1,0,'2021-03-31 11:36:41','2021-03-31 11:36:41',NULL,'576101c7-627d-42c4-93d7-15f12cd3634e'),(111,NULL,NULL,NULL,'verbb\\navigation\\elements\\Node',1,0,'2021-04-06 12:32:41','2021-04-06 15:24:44',NULL,'f05aef1e-ff93-43ea-a22e-6ddf34a2cdc2'),(112,NULL,NULL,14,'craft\\elements\\Entry',1,0,'2021-04-06 15:24:28','2021-04-06 15:24:57',NULL,'ed50bd1b-ee1d-45dd-b541-c401502061b2'),(113,NULL,32,14,'craft\\elements\\Entry',1,0,'2021-03-31 11:36:41','2021-03-31 11:36:41',NULL,'978bcb4d-88e7-40a9-9853-a98aac0cf173'),(114,NULL,33,14,'craft\\elements\\Entry',1,0,'2021-04-06 15:24:36','2021-04-06 15:24:36',NULL,'ad7e1521-a2c5-4ae4-91e5-13318c2f17ed'),(115,NULL,34,14,'craft\\elements\\Entry',1,0,'2021-04-06 15:24:44','2021-04-06 15:24:44',NULL,'075b6291-925f-4fa7-8d83-e65b4aa42b72'),(116,NULL,35,14,'craft\\elements\\Entry',1,0,'2021-04-06 15:24:57','2021-04-06 15:24:57',NULL,'608d647e-25c0-48c9-9d31-5402e8c14468'),(117,NULL,36,13,'craft\\elements\\Entry',1,0,'2021-04-06 15:37:48','2021-04-06 15:37:48',NULL,'8a9f072e-63b3-4ae3-990a-29ce1eeb162e'),(118,NULL,NULL,6,'benf\\neo\\elements\\Block',1,0,'2021-04-06 15:37:49','2021-03-31 11:34:47',NULL,'a86094da-37eb-4365-8da5-6ea9e909e53f'),(119,NULL,37,12,'craft\\elements\\Entry',1,0,'2021-04-06 15:56:14','2021-04-06 15:56:14',NULL,'581272e8-d190-4c29-87dc-32a53fdfb230'),(120,NULL,NULL,6,'benf\\neo\\elements\\Block',1,0,'2021-04-06 15:56:14','2021-03-31 11:33:38',NULL,'9d778ba5-1f2c-467b-842b-465780767a4e'),(121,NULL,NULL,4,'benf\\neo\\elements\\Block',1,0,'2021-04-06 15:56:14','2021-03-31 11:33:39',NULL,'bea1ddfe-5019-4790-9a25-e9b5ce7b05f0'),(122,NULL,NULL,NULL,'Solspace\\Freeform\\Elements\\Submission',1,0,'2021-04-06 15:56:28','2021-04-06 15:56:28','2021-04-06 15:59:39','3b38da9b-d43a-4521-aa3b-7f7e8a17ac87'),(123,NULL,NULL,NULL,'Solspace\\Freeform\\Elements\\Submission',1,0,'2021-04-06 15:58:40','2021-04-06 15:58:40','2021-04-06 15:59:39','a2090bab-4647-4be9-bcc7-1c7aa5c67c4f'),(124,NULL,NULL,NULL,'Solspace\\Freeform\\Elements\\Submission',1,0,'2021-04-06 15:59:01','2021-04-06 15:59:01','2021-04-06 15:59:39','aa31d3d0-59e1-49fe-8c11-21c4921a2cb1'),(125,NULL,NULL,15,'benf\\neo\\elements\\Block',1,0,'2021-04-06 16:08:17','2021-04-07 08:54:20',NULL,'eb74ee26-0251-4d2e-ad30-6b59f7c4d937'),(126,NULL,38,3,'craft\\elements\\Entry',1,0,'2021-04-06 16:08:17','2021-04-06 16:08:17',NULL,'9f4f5c9d-2c03-479f-9555-292ec30988c6'),(127,NULL,NULL,6,'benf\\neo\\elements\\Block',1,0,'2021-04-06 16:08:17','2021-03-30 15:00:14',NULL,'894e19ad-925a-4b2a-a5d9-5f34333dfa90'),(128,NULL,NULL,4,'benf\\neo\\elements\\Block',1,0,'2021-04-06 16:08:17','2021-03-30 15:00:14',NULL,'a5c0574b-964a-4d3f-ab47-0f7328c8c26e'),(129,NULL,NULL,5,'benf\\neo\\elements\\Block',1,0,'2021-04-06 16:08:17','2021-03-30 14:58:55',NULL,'94081c28-a480-4ee3-a2dd-31ec08b0aad1'),(130,NULL,NULL,15,'benf\\neo\\elements\\Block',1,0,'2021-04-06 16:08:17','2021-04-06 16:08:17',NULL,'cca344fc-d0a5-4368-b6ed-5c7ae2f3875d'),(131,NULL,NULL,16,'benf\\neo\\elements\\Block',1,0,'2021-04-07 08:25:58','2021-04-07 09:42:14',NULL,'3c232afa-675f-4ded-8a43-f797d2a227b7'),(132,NULL,39,3,'craft\\elements\\Entry',1,0,'2021-04-07 08:25:58','2021-04-07 08:25:58',NULL,'06afc6e3-1914-4ce1-a9de-76ffdf5be652'),(133,NULL,NULL,6,'benf\\neo\\elements\\Block',1,0,'2021-04-07 08:25:58','2021-03-30 15:00:14',NULL,'d3b460c4-dbad-47d4-9f3d-47327a7f99b7'),(134,NULL,NULL,4,'benf\\neo\\elements\\Block',1,0,'2021-04-07 08:25:58','2021-03-30 15:00:14',NULL,'9d9549d8-a55c-4961-ba18-659c049a7d89'),(135,NULL,NULL,5,'benf\\neo\\elements\\Block',1,0,'2021-04-07 08:25:58','2021-03-30 14:58:55',NULL,'b0d79feb-57b0-488e-b978-c318a6b57edc'),(136,NULL,NULL,15,'benf\\neo\\elements\\Block',1,0,'2021-04-07 08:25:58','2021-04-06 16:08:17',NULL,'3786636c-46a0-4a53-9477-9653ac3bc9e5'),(137,NULL,NULL,16,'benf\\neo\\elements\\Block',1,0,'2021-04-07 08:25:58','2021-04-07 08:25:58',NULL,'286b7c60-44fb-401c-8f87-3286967bf139'),(138,NULL,NULL,18,'benf\\neo\\elements\\Block',1,0,'2021-04-07 08:54:20','2021-04-07 09:24:32',NULL,'10c7488a-6d3e-48db-aadb-ddc4e40717ca'),(139,NULL,NULL,17,'craft\\elements\\MatrixBlock',1,0,'2021-04-07 08:54:20','2021-04-07 09:24:32',NULL,'b24a0d2d-e9b2-4b3d-ad27-f8f75c0a8e7e'),(140,NULL,NULL,17,'craft\\elements\\MatrixBlock',1,0,'2021-04-07 08:54:20','2021-04-07 09:24:33',NULL,'28a0158b-72d4-4988-9d90-2b13f1e75ce4'),(141,NULL,40,3,'craft\\elements\\Entry',1,0,'2021-04-07 08:54:20','2021-04-07 08:54:20',NULL,'270c612a-8c90-4e8a-9076-b525fda3431c'),(142,NULL,NULL,6,'benf\\neo\\elements\\Block',1,0,'2021-04-07 08:54:20','2021-03-30 15:00:14',NULL,'73c2c491-d099-4648-91f4-516f0b5fe365'),(143,NULL,NULL,4,'benf\\neo\\elements\\Block',1,0,'2021-04-07 08:54:20','2021-03-30 15:00:14',NULL,'35636b7e-e9f0-4596-ae2d-b62d2092a0a3'),(144,NULL,NULL,5,'benf\\neo\\elements\\Block',1,0,'2021-04-07 08:54:20','2021-03-30 14:58:55',NULL,'228f506c-f0cb-4d93-a669-da276e1060c4'),(145,NULL,NULL,15,'benf\\neo\\elements\\Block',1,0,'2021-04-07 08:54:20','2021-04-07 08:54:20',NULL,'26675cc0-eb02-413a-8655-0f4a3d47c03c'),(146,NULL,NULL,16,'benf\\neo\\elements\\Block',1,0,'2021-04-07 08:54:20','2021-04-07 08:54:20',NULL,'1360e53c-76d5-45b3-af37-c71f87d2594e'),(147,NULL,NULL,18,'benf\\neo\\elements\\Block',1,0,'2021-04-07 08:54:20','2021-04-07 08:54:20',NULL,'30284ad2-6dcd-4d08-aa5f-3c4386315bdd'),(148,NULL,NULL,17,'craft\\elements\\MatrixBlock',1,0,'2021-04-07 08:54:20','2021-04-07 08:54:20',NULL,'69b2cbd9-e4dd-457a-97ab-b574ebabb61b'),(149,NULL,NULL,17,'craft\\elements\\MatrixBlock',1,0,'2021-04-07 08:54:20','2021-04-07 08:54:20',NULL,'15820ed4-557d-4b29-918c-d7b2b55ef81c'),(150,NULL,NULL,17,'craft\\elements\\MatrixBlock',1,0,'2021-04-07 09:24:33','2021-04-07 09:24:33',NULL,'fc42344f-2b97-4298-b50b-24d8c7c99056'),(151,NULL,41,3,'craft\\elements\\Entry',1,0,'2021-04-07 09:24:32','2021-04-07 09:24:32',NULL,'c3df2375-f388-4b94-8042-565bcc58e745'),(152,NULL,NULL,6,'benf\\neo\\elements\\Block',1,0,'2021-04-07 09:24:33','2021-03-30 15:00:14',NULL,'490edfc7-b803-4647-aa58-1fe5f2600151'),(153,NULL,NULL,4,'benf\\neo\\elements\\Block',1,0,'2021-04-07 09:24:33','2021-03-30 15:00:14',NULL,'b96ca28f-4c37-4b44-98df-928b537c0e8b'),(154,NULL,NULL,5,'benf\\neo\\elements\\Block',1,0,'2021-04-07 09:24:33','2021-03-30 14:58:55',NULL,'f1fcb386-dbd6-442b-9559-a068670b9643'),(155,NULL,NULL,15,'benf\\neo\\elements\\Block',1,0,'2021-04-07 09:24:33','2021-04-07 08:54:20',NULL,'0e7df1a0-7f68-4623-8bb7-3eae6133d623'),(156,NULL,NULL,16,'benf\\neo\\elements\\Block',1,0,'2021-04-07 09:24:33','2021-04-07 08:54:20',NULL,'53dccdc3-e67a-4bad-aefa-af6ef080f0c6'),(157,NULL,NULL,18,'benf\\neo\\elements\\Block',1,0,'2021-04-07 09:24:33','2021-04-07 09:24:32',NULL,'7030fabf-062b-4b60-851c-2102c8446d3e'),(158,NULL,NULL,17,'craft\\elements\\MatrixBlock',1,0,'2021-04-07 09:24:33','2021-04-07 09:24:32',NULL,'eb36b77e-b294-47c6-91c3-302aac9cfa1c'),(159,NULL,NULL,17,'craft\\elements\\MatrixBlock',1,0,'2021-04-07 09:24:33','2021-04-07 09:24:33',NULL,'1ea55bfb-0fcc-42fb-89bb-ef9cc7cbf256'),(160,NULL,NULL,17,'craft\\elements\\MatrixBlock',1,0,'2021-04-07 09:24:33','2021-04-07 09:24:33',NULL,'2300a7cc-8260-4925-bf8c-d68933bdebb9'),(161,NULL,NULL,19,'craft\\elements\\MatrixBlock',1,0,'2021-04-07 09:31:18','2021-04-07 09:31:18','2021-04-07 09:42:14','57cac341-0882-49d5-8575-06d1fb2ba358'),(162,NULL,42,3,'craft\\elements\\Entry',1,0,'2021-04-07 09:31:18','2021-04-07 09:31:18',NULL,'dfe54772-91d9-4604-9e64-c8d053c6cea1'),(163,NULL,NULL,6,'benf\\neo\\elements\\Block',1,0,'2021-04-07 09:31:18','2021-03-30 15:00:14',NULL,'a52b9f36-9b55-41c2-bcda-e847caadb647'),(164,NULL,NULL,4,'benf\\neo\\elements\\Block',1,0,'2021-04-07 09:31:18','2021-03-30 15:00:14',NULL,'8181ad1c-218d-4ddc-8b7f-7536070e18c4'),(165,NULL,NULL,5,'benf\\neo\\elements\\Block',1,0,'2021-04-07 09:31:18','2021-03-30 14:58:55',NULL,'8f839565-241b-45cd-b8da-e1158089e40c'),(166,NULL,NULL,15,'benf\\neo\\elements\\Block',1,0,'2021-04-07 09:31:18','2021-04-07 08:54:20',NULL,'0062a916-4beb-4196-b56f-f3ed26fbf653'),(167,NULL,NULL,16,'benf\\neo\\elements\\Block',1,0,'2021-04-07 09:31:18','2021-04-07 09:31:18',NULL,'a16c7ecd-726c-41a1-9a86-2bcf936462ab'),(168,NULL,NULL,19,'craft\\elements\\MatrixBlock',1,0,'2021-04-07 09:31:18','2021-04-07 09:31:18',NULL,'cc2531eb-9278-4d5e-ae3a-75399fac9199'),(169,NULL,NULL,18,'benf\\neo\\elements\\Block',1,0,'2021-04-07 09:31:18','2021-04-07 09:24:32',NULL,'196905e3-1342-4684-a455-edd5eea8b1c1'),(170,NULL,NULL,17,'craft\\elements\\MatrixBlock',1,0,'2021-04-07 09:31:18','2021-04-07 09:24:32',NULL,'df997103-4b56-4bbc-9a21-c3c9af09f9a4'),(171,NULL,NULL,17,'craft\\elements\\MatrixBlock',1,0,'2021-04-07 09:31:18','2021-04-07 09:24:33',NULL,'673c2a11-5fc0-4397-b029-01282c506a76'),(172,NULL,NULL,17,'craft\\elements\\MatrixBlock',1,0,'2021-04-07 09:31:18','2021-04-07 09:24:33',NULL,'fccdbc4a-8506-4cd4-bc70-eb9bb7bc8d51'),(173,NULL,NULL,20,'craft\\elements\\MatrixBlock',1,0,'2021-04-07 09:42:14','2021-04-07 09:42:14',NULL,'085bd391-6059-4334-b012-1538bee6aed8'),(174,NULL,43,3,'craft\\elements\\Entry',1,0,'2021-04-07 09:42:14','2021-04-07 09:42:14',NULL,'2f47865f-31b4-4272-9b4d-821acbc84bb1'),(175,NULL,NULL,6,'benf\\neo\\elements\\Block',1,0,'2021-04-07 09:42:14','2021-03-30 15:00:14',NULL,'a15ed5a6-f071-4f2e-a47c-048d92f2c4dd'),(176,NULL,NULL,4,'benf\\neo\\elements\\Block',1,0,'2021-04-07 09:42:14','2021-03-30 15:00:14',NULL,'78059b1a-4137-4a38-a4d3-da96b03a4655'),(177,NULL,NULL,5,'benf\\neo\\elements\\Block',1,0,'2021-04-07 09:42:14','2021-03-30 14:58:55',NULL,'e73230c9-815a-4d9d-9dde-062fd7dca6fd'),(178,NULL,NULL,15,'benf\\neo\\elements\\Block',1,0,'2021-04-07 09:42:14','2021-04-07 08:54:20',NULL,'75760214-c6d6-4d8a-a577-1dca2c991caa'),(179,NULL,NULL,16,'benf\\neo\\elements\\Block',1,0,'2021-04-07 09:42:14','2021-04-07 09:42:14',NULL,'ecea513e-40cd-463c-893e-b517180fc3cd'),(180,NULL,NULL,20,'craft\\elements\\MatrixBlock',1,0,'2021-04-07 09:42:14','2021-04-07 09:42:14',NULL,'73097971-d71e-4466-861b-fd70fa25acff'),(181,NULL,NULL,18,'benf\\neo\\elements\\Block',1,0,'2021-04-07 09:42:14','2021-04-07 09:24:32',NULL,'2d6260f4-8423-41ec-b944-8581b3e35e37'),(182,NULL,NULL,17,'craft\\elements\\MatrixBlock',1,0,'2021-04-07 09:42:14','2021-04-07 09:24:32',NULL,'4c71adcd-c420-40c4-aa63-7984e7d2c761'),(183,NULL,NULL,17,'craft\\elements\\MatrixBlock',1,0,'2021-04-07 09:42:14','2021-04-07 09:24:33',NULL,'10a4862b-9ae5-4193-86ad-2513975950ea'),(184,NULL,NULL,17,'craft\\elements\\MatrixBlock',1,0,'2021-04-07 09:42:14','2021-04-07 09:24:33',NULL,'ed472bf7-54c9-4341-af7a-43c950cde61b'),(185,NULL,NULL,23,'benf\\neo\\elements\\Block',1,0,'2021-04-07 09:55:25','2021-04-07 09:55:25',NULL,'b2f28ff8-903e-4e26-9522-f1e9424e5ace'),(186,NULL,NULL,21,'craft\\elements\\MatrixBlock',1,0,'2021-04-07 09:55:25','2021-04-07 09:55:25',NULL,'50ff6ded-b8a8-48a5-a29a-565e4895cb8f'),(187,NULL,NULL,22,'craft\\elements\\MatrixBlock',1,0,'2021-04-07 09:55:25','2021-04-07 09:55:25',NULL,'f33b24a4-f12c-47e0-9f6e-7f02955015d8'),(188,NULL,44,3,'craft\\elements\\Entry',1,0,'2021-04-07 09:55:25','2021-04-07 09:55:25',NULL,'8ad65054-b9b4-4db0-b2b3-aeac06f9ad06'),(189,NULL,NULL,6,'benf\\neo\\elements\\Block',1,0,'2021-04-07 09:55:25','2021-03-30 15:00:14',NULL,'d3e56150-6bc8-4f02-95f5-b0d345397983'),(190,NULL,NULL,4,'benf\\neo\\elements\\Block',1,0,'2021-04-07 09:55:25','2021-03-30 15:00:14',NULL,'f9b0c55e-311f-42e1-a85b-10f027717b5e'),(191,NULL,NULL,23,'benf\\neo\\elements\\Block',1,0,'2021-04-07 09:55:25','2021-04-07 09:55:25',NULL,'d3266092-8274-4f8f-b751-1153b8ec166d'),(192,NULL,NULL,21,'craft\\elements\\MatrixBlock',1,0,'2021-04-07 09:55:25','2021-04-07 09:55:25',NULL,'5e749e45-ad69-454b-88e3-74627486ed87'),(193,NULL,NULL,22,'craft\\elements\\MatrixBlock',1,0,'2021-04-07 09:55:25','2021-04-07 09:55:25',NULL,'6620c48d-fdae-4513-bebd-a0e29c1ea161'),(194,NULL,NULL,5,'benf\\neo\\elements\\Block',1,0,'2021-04-07 09:55:25','2021-03-30 14:58:55',NULL,'09047bf2-4b93-4bea-857a-ff3e45f81b43'),(195,NULL,NULL,15,'benf\\neo\\elements\\Block',1,0,'2021-04-07 09:55:25','2021-04-07 08:54:20',NULL,'95433766-eca3-4d01-90a6-a0961b0d29c8'),(196,NULL,NULL,16,'benf\\neo\\elements\\Block',1,0,'2021-04-07 09:55:25','2021-04-07 09:42:14',NULL,'8af3c622-9658-4e65-9908-9ba043683d68'),(197,NULL,NULL,20,'craft\\elements\\MatrixBlock',1,0,'2021-04-07 09:55:25','2021-04-07 09:42:14',NULL,'50e84c97-d7eb-4deb-9652-d34b266f3c95'),(198,NULL,NULL,18,'benf\\neo\\elements\\Block',1,0,'2021-04-07 09:55:25','2021-04-07 09:24:32',NULL,'58be2556-dca4-4e37-88d3-ee895bde6b76'),(199,NULL,NULL,17,'craft\\elements\\MatrixBlock',1,0,'2021-04-07 09:55:25','2021-04-07 09:24:32',NULL,'1a4ede65-ed14-4633-9040-9c34c59202ab'),(200,NULL,NULL,17,'craft\\elements\\MatrixBlock',1,0,'2021-04-07 09:55:26','2021-04-07 09:24:33',NULL,'71b7cb07-cf5f-490f-929c-82e22e6fe4b9'),(201,NULL,NULL,17,'craft\\elements\\MatrixBlock',1,0,'2021-04-07 09:55:26','2021-04-07 09:24:33',NULL,'256a6628-4cc7-42ee-b44e-613cbe24d3ec');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,1,'2021-03-30 09:20:10','2021-03-30 09:20:10','d1806068-a6a1-4e87-85df-14244fbcbbf7'),(2,2,1,NULL,NULL,1,'2021-03-30 09:31:09','2021-03-30 09:31:09','3f718d54-5358-4886-8620-1b0391464b83'),(3,3,1,'homepage','__home__',1,'2021-03-30 09:38:29','2021-03-30 09:38:29','ad72fcf3-ed4f-4ef8-bd1c-1bf86d98df36'),(4,4,1,'homepage','__home__',1,'2021-03-30 09:38:29','2021-03-30 09:38:29','081a54ff-a869-4e2f-b56d-d7852cbff6ab'),(5,5,1,'homepage','__home__',1,'2021-03-30 09:38:52','2021-03-30 09:38:52','29b7db71-8555-4c06-ac8b-60cea527b66a'),(6,6,1,'homepage','__home__',1,'2021-03-30 10:13:09','2021-03-30 10:13:09','7f663328-b9ab-4aaf-ba91-e90629330468'),(7,7,1,NULL,NULL,1,'2021-03-30 10:33:15','2021-03-30 10:33:15','8e988d93-c5cb-4623-b097-fc163f1156e7'),(8,8,1,NULL,NULL,1,'2021-03-30 10:33:15','2021-03-30 10:33:15','4807df27-c549-4982-b36e-8e7a2db0d931'),(9,9,1,NULL,NULL,1,'2021-03-30 10:33:15','2021-03-30 10:33:15','8264a3c6-09fc-4838-8c5b-74923cf7a403'),(10,10,1,'homepage','__home__',1,'2021-03-30 10:33:15','2021-03-30 10:33:15','d66af7ba-07c2-468f-a5f7-299a4451848e'),(11,11,1,NULL,NULL,1,'2021-03-30 10:33:15','2021-03-30 10:33:15','6a178217-e945-4297-b49d-23265ecf9e5c'),(12,12,1,NULL,NULL,1,'2021-03-30 10:33:15','2021-03-30 10:33:15','181bfcca-ac5f-4fee-a51d-6f496639c129'),(13,13,1,NULL,NULL,1,'2021-03-30 10:33:15','2021-03-30 10:33:15','3a48efea-90f2-41c2-b19a-eb26289b1c9b'),(14,14,1,'about-us','about-us',1,'2021-03-30 11:04:36','2021-03-30 11:04:36','6e5900d4-bb18-4a5d-93e6-1f5c8239cca6'),(15,15,1,'about-us','about-us',1,'2021-03-30 11:04:36','2021-03-30 11:04:36','268f58a1-b09d-45b2-b9ae-9177a226df6d'),(16,16,1,'about-us','about-us',1,'2021-03-30 11:05:00','2021-03-30 11:05:00','98cf1f39-dabd-47cc-b105-470192a4ce30'),(17,17,1,'contact','contact',1,'2021-03-30 11:05:32','2021-03-30 11:05:32','88a84537-4a62-4e5a-be37-a0819d1fc31c'),(18,18,1,'contact','contact',1,'2021-03-30 11:05:32','2021-03-30 11:05:32','e4c35d95-f666-4780-8996-6798c7031b37'),(19,19,1,'contact','contact',1,'2021-03-30 11:06:23','2021-03-30 11:06:23','43c6f1c4-1a26-48b4-bd5e-b84905a51f95'),(20,20,1,NULL,NULL,1,'2021-03-30 11:07:21','2021-03-30 11:07:21','fb0e933a-1b09-47d3-a340-44c8dd5f1d55'),(21,21,1,NULL,NULL,1,'2021-03-30 11:07:21','2021-03-30 11:07:21','7b23e017-4512-41b3-bd05-e1297987af9d'),(22,22,1,'contact','contact',1,'2021-03-30 11:07:21','2021-03-30 11:07:21','2198d858-351b-4f47-9af7-caa25cd1241c'),(23,23,1,NULL,NULL,1,'2021-03-30 11:07:21','2021-03-30 11:07:21','e3f1360e-80ad-464b-8b42-fe4486a8b551'),(24,24,1,NULL,NULL,1,'2021-03-30 11:07:21','2021-03-30 11:07:21','7c39c9d9-15a2-4c77-add4-d4a376d4aa8d'),(25,25,1,NULL,NULL,1,'2021-03-30 11:07:50','2021-03-30 11:07:50','f8524872-2d75-4411-a73f-caaa9a7c7656'),(26,26,1,NULL,NULL,1,'2021-03-30 11:07:50','2021-03-30 11:07:50','80196839-6b32-4b60-8f27-95a5f6f5fa1a'),(27,27,1,'about-us','about-us',1,'2021-03-30 11:07:50','2021-03-30 11:07:50','716c0e55-7580-4662-8333-ef6d6eb93a3f'),(28,28,1,NULL,NULL,1,'2021-03-30 11:07:50','2021-03-30 11:07:50','e98383ee-0ddd-405f-9098-045db2399fd5'),(29,29,1,NULL,NULL,1,'2021-03-30 11:07:50','2021-03-30 11:07:50','93e01e16-a022-45f3-b719-4a49c5db8fb5'),(30,30,1,'about-us','about-us',1,'2021-03-30 11:09:07','2021-03-30 11:09:07','6943e783-2681-4f27-b951-651c520cf34b'),(31,31,1,NULL,NULL,1,'2021-03-30 11:09:07','2021-03-30 11:09:07','3a2e6ce4-8973-471f-b0bd-a7ffb8f32295'),(32,32,1,NULL,NULL,1,'2021-03-30 11:09:07','2021-03-30 11:09:07','588833b6-58e3-44b5-85c5-eefd4907b177'),(33,33,1,'contact','contact',1,'2021-03-30 11:09:29','2021-03-30 11:09:29','91f96c04-152d-4a8c-8fe4-93365a5b58c6'),(34,34,1,NULL,NULL,1,'2021-03-30 11:09:29','2021-03-30 11:09:29','7fa4dc35-670e-461e-954e-72f5f520bd75'),(35,35,1,NULL,NULL,1,'2021-03-30 11:09:29','2021-03-30 11:09:29','6c84366c-90ea-4a2a-bcbc-a7f9157aac4d'),(36,36,1,'about-us','about-us',1,'2021-03-30 11:09:56','2021-03-30 11:09:56','d3d8123d-1c05-4fd1-8b0d-f97e2e650884'),(37,37,1,NULL,NULL,1,'2021-03-30 11:09:56','2021-03-30 11:09:56','e3c7cf59-b828-40a5-bdf4-0694e5c01ac7'),(38,38,1,NULL,NULL,1,'2021-03-30 11:09:56','2021-03-30 11:09:56','d4aa1da6-d0ad-4c54-8fc8-5e6ebdfe1401'),(39,39,1,'contact','contact',1,'2021-03-30 11:10:02','2021-03-30 11:10:02','00c7055b-ec51-40b1-b58b-961808ee7235'),(40,40,1,NULL,NULL,1,'2021-03-30 11:10:02','2021-03-30 11:10:02','5d503763-e8e3-4650-b715-76137f3ab6d4'),(41,41,1,NULL,NULL,1,'2021-03-30 11:10:02','2021-03-30 11:10:02','d927c4fe-69f0-47ae-86c9-0f199e415d7a'),(42,42,1,'1',NULL,1,'2021-03-30 11:14:00','2021-03-30 11:14:00','949f4331-096d-4b53-a505-0d17806f7ce4'),(43,43,1,'1',NULL,1,'2021-03-30 11:14:00','2021-03-30 11:14:00','60c04166-6da6-436b-9f2f-bbafd75263fb'),(44,44,1,'1',NULL,1,'2021-03-30 11:14:00','2021-03-30 11:14:00','c935012e-bafd-4f8e-af7b-42272ba6689c'),(45,45,1,NULL,NULL,1,'2021-03-30 13:16:05','2021-03-30 13:16:05','ce266054-1490-40ec-ace4-22a3d0795e95'),(46,46,1,NULL,NULL,1,'2021-03-30 13:47:51','2021-03-30 13:47:51','76556aaf-bf74-4970-bd8a-041502828c61'),(47,47,1,NULL,NULL,1,'2021-03-30 13:53:33','2021-03-30 13:53:33','ab7b11fe-869c-4919-a5fd-52a686cf23c0'),(48,48,1,NULL,NULL,1,'2021-03-30 13:54:15','2021-03-30 13:54:15','3f067256-bfb9-405d-9130-2404c62646d9'),(49,49,1,'homepage','__home__',1,'2021-03-30 14:30:04','2021-03-30 14:30:04','786bfd84-cfb4-4ac0-b1c0-a0fe70f1afd6'),(50,50,1,NULL,NULL,1,'2021-03-30 14:58:55','2021-03-30 14:58:55','01337bf5-1034-4140-8f5e-cfbd175ca606'),(51,51,1,NULL,NULL,1,'2021-03-30 14:58:55','2021-03-30 14:58:55','6d8e7f4f-b76a-4d43-a447-cab5526ba407'),(52,52,1,NULL,NULL,1,'2021-03-30 14:58:55','2021-03-30 14:58:55','bd2d49e4-2039-4211-9076-9b7d760581e5'),(53,53,1,'homepage','__home__',1,'2021-03-30 14:58:55','2021-03-30 14:58:55','cc349527-39ef-457d-99fb-8cfb9285a558'),(54,54,1,NULL,NULL,1,'2021-03-30 14:58:55','2021-03-30 14:58:55','e2db1ba3-6398-47ac-b187-0ebaa20a9885'),(55,55,1,NULL,NULL,1,'2021-03-30 14:58:55','2021-03-30 14:58:55','babb0266-235b-4c1f-9eef-f9d820d8c2ee'),(56,56,1,NULL,NULL,1,'2021-03-30 14:58:55','2021-03-30 14:58:55','333a259f-a0fc-4f4c-915f-48aebb4af5a7'),(57,57,1,'homepage','__home__',1,'2021-03-30 15:00:15','2021-03-30 15:00:15','b644a056-63c3-40b8-9371-ae25766e3281'),(58,58,1,NULL,NULL,1,'2021-03-30 15:00:15','2021-03-30 15:00:15','baba67f5-f3e4-4eec-ba73-29990b0843fe'),(59,59,1,NULL,NULL,1,'2021-03-30 15:00:15','2021-03-30 15:00:15','99bff4ee-647d-43d8-a13e-56861a8d5f74'),(60,60,1,NULL,NULL,1,'2021-03-30 15:00:15','2021-03-30 15:00:15','f7e2c972-5b71-4038-aac4-291d06d18b45'),(61,61,1,'about-us','about',1,'2021-03-31 11:24:42','2021-03-31 11:26:20','50c06ad7-548e-43e6-a4f1-7e86896b3429'),(62,62,1,'about-us','about-us',1,'2021-03-31 11:24:42','2021-03-31 11:24:42','96bb04aa-ecf5-46d2-b374-7a759643980a'),(63,63,1,'about-us','about-us',1,'2021-03-31 11:25:22','2021-03-31 11:25:22','577762c2-63c4-4903-920b-1fe86a1f01a9'),(64,64,1,'contact','contact',1,'2021-03-31 11:25:46','2021-03-31 11:25:46','ad9a9387-baa4-4a1e-848d-dbf905c9daf0'),(65,65,1,'contact','contact',1,'2021-03-31 11:25:46','2021-03-31 11:25:46','d72680b0-744e-4210-906c-f4d188013a15'),(66,66,1,'about-us','about',1,'2021-03-31 11:26:20','2021-03-31 11:26:20','5aaf8e34-7dfe-4799-86b4-68588b20e09d'),(67,67,1,'about-us','about',1,'2021-03-31 11:26:21','2021-03-31 11:26:21','39c65b17-82fb-4ecf-8135-92057ab9dde0'),(68,68,1,'latest','latest',1,'2021-03-31 11:27:00','2021-03-31 11:34:47','60c8e101-f0d5-4219-8740-1c2fc97bbdbd'),(69,69,1,'latest-index','latest',1,'2021-03-31 11:27:00','2021-03-31 11:27:00','ff475649-f06c-426a-bb3d-5e1629e337c0'),(70,70,1,'latest-index','latest',1,'2021-03-31 11:28:06','2021-03-31 11:28:06','056902ba-29e2-4395-9015-17bb48b827e6'),(71,71,1,'contact','contact',1,'2021-03-31 11:28:32','2021-03-31 11:28:32','d6d2286b-7dfe-493c-9594-c2f1e73b8cf5'),(72,72,1,NULL,NULL,1,'2021-03-31 11:33:02','2021-03-31 11:33:02','5fa78945-ab9b-4e4f-8159-43540090dc07'),(73,73,1,NULL,NULL,1,'2021-03-31 11:33:02','2021-03-31 11:33:02','f89bdf3f-c50e-44dd-a471-e28b76b671f9'),(74,74,1,NULL,NULL,1,'2021-03-31 11:33:02','2021-03-31 11:33:02','7f6a70bc-f120-41c8-978d-6c1e094a963b'),(75,75,1,'about-us','about',1,'2021-03-31 11:33:02','2021-03-31 11:33:02','00f97124-5c86-402f-ba84-eaaec21c229d'),(76,76,1,NULL,NULL,1,'2021-03-31 11:33:02','2021-03-31 11:33:02','e711aaeb-3498-4853-bd7a-dfefc6cf493c'),(77,77,1,NULL,NULL,1,'2021-03-31 11:33:02','2021-03-31 11:33:02','58ea871e-46a9-4ae2-b5ad-712b67c91c0f'),(78,78,1,NULL,NULL,1,'2021-03-31 11:33:02','2021-03-31 11:33:02','b952e1ff-a01a-4bac-abf7-9b2ac5738c1a'),(79,79,1,NULL,NULL,1,'2021-03-31 11:33:39','2021-03-31 11:33:39','9087ef82-a7be-4a98-bdb4-57bd03116df6'),(80,80,1,NULL,NULL,1,'2021-03-31 11:33:39','2021-03-31 11:33:39','8c280ecd-126f-4fd0-aa26-8cbfd7eb5480'),(81,81,1,NULL,NULL,1,'2021-03-31 11:33:39','2021-03-31 11:33:39','902e61ec-69bb-4914-9c27-7d8f54b42f54'),(82,82,1,'contact','contact',1,'2021-03-31 11:33:39','2021-03-31 11:33:39','6d6c8a10-a1fd-4129-a3e5-8bb9d44880e7'),(83,83,1,NULL,NULL,1,'2021-03-31 11:33:39','2021-03-31 11:33:39','b638ccc4-ecc2-43b2-b4a0-1498d5737ba5'),(84,84,1,NULL,NULL,1,'2021-03-31 11:33:39','2021-03-31 11:33:39','ec989d8a-e07b-435d-b0cf-dcadcf40bae8'),(85,85,1,NULL,NULL,1,'2021-03-31 11:33:39','2021-03-31 11:33:39','87b99a05-46fb-473f-8268-aa60572ad232'),(86,86,1,NULL,NULL,1,'2021-03-31 11:34:47','2021-03-31 11:34:47','e741ffb3-fcc1-44c4-bb89-a64e6db1734c'),(87,87,1,NULL,NULL,1,'2021-03-31 11:34:47','2021-03-31 11:34:47','9ad7fe8b-ce24-4d0d-a9cd-92a42631418d'),(88,88,1,NULL,NULL,1,'2021-03-31 11:34:48','2021-03-31 11:34:48','3097d3e8-fe88-401b-82ce-c4a6921d0742'),(89,89,1,'latest','latest',1,'2021-03-31 11:34:48','2021-03-31 11:34:48','5594927c-9686-404f-9f40-b89116bc0e3d'),(90,90,1,NULL,NULL,1,'2021-03-31 11:34:48','2021-03-31 11:34:48','5a27717d-84aa-49d2-a89a-a02febd891a0'),(91,91,1,NULL,NULL,1,'2021-03-31 11:34:48','2021-03-31 11:34:48','b5a3efa8-cef1-4b67-8d04-156749e4f7b9'),(92,92,1,NULL,NULL,1,'2021-03-31 11:34:48','2021-03-31 11:34:48','d4424f1e-f793-4a40-85af-c86f7e8c8cb5'),(94,94,1,'article-1','latest/article-1',1,'2021-03-31 11:36:41','2021-03-31 11:36:41','ef4a5009-2451-49e8-893e-a7875833ad93'),(95,95,1,'article-1','latest/article-1',1,'2021-03-31 11:36:41','2021-03-31 11:36:41','1376a774-a0db-4a95-8d9c-5026e57a3ee3'),(96,96,1,'1',NULL,1,'2021-03-31 11:37:26','2021-03-31 11:37:26','cfc43c0f-8aae-4898-b6f5-0ee5737ff0f4'),(97,97,1,'1',NULL,1,'2021-03-31 11:37:26','2021-03-31 11:37:26','c9c3b365-2189-4828-b22f-8b02560c3cc4'),(98,98,1,'1',NULL,1,'2021-03-31 11:37:26','2021-03-31 11:37:26','e2dbf00a-411c-474d-94d8-76eff6e69440'),(99,99,1,'1',NULL,1,'2021-03-31 11:37:26','2021-03-31 11:37:26','75e61523-6e73-43c9-8c19-83e4ca5c93bd'),(100,100,1,'1',NULL,1,'2021-03-31 11:38:08','2021-03-31 11:38:08','6400eed3-fa9c-4a86-99d7-d2da0e86905d'),(101,101,1,'1',NULL,1,'2021-03-31 11:38:08','2021-03-31 11:38:08','50f178e7-915b-48cd-853b-2898988abfe0'),(102,102,1,'1',NULL,1,'2021-03-31 11:38:08','2021-03-31 11:38:08','7a5501d5-2dc4-461f-8873-09befe1c2e02'),(103,103,1,'1',NULL,1,'2021-03-31 11:38:08','2021-03-31 11:38:08','a3dc140b-6d93-476e-9990-a6022de61c36'),(104,104,1,'latest','latest',1,'2021-03-31 11:43:49','2021-03-31 11:43:49','810d6f3e-865f-4024-9845-77b869c48846'),(105,105,1,NULL,NULL,1,'2021-03-31 11:43:49','2021-03-31 11:43:49','dafee899-e9b1-4b94-9b7a-bd8ce60bae01'),(106,106,1,NULL,NULL,1,'2021-03-31 11:43:49','2021-03-31 11:43:49','4f5842f6-1160-44d0-aafb-148656486399'),(107,107,1,NULL,NULL,1,'2021-03-31 11:43:49','2021-03-31 11:43:49','aa24e9b5-d34e-4a18-bc68-eda1c67af47e'),(108,108,1,'1',NULL,1,'2021-03-31 13:07:33','2021-03-31 13:07:33','713ad2e3-7273-4bcb-8af0-a1fe4ebaa509'),(109,109,1,'article-2','latest/article-2',1,'2021-04-06 12:32:18','2021-04-06 15:24:36','cf5ce0e8-9218-4fa0-bd31-7a6b1625264e'),(110,110,1,'article-1-2','latest/article-1-2',1,'2021-04-06 12:32:18','2021-04-06 12:32:18','efc05f01-1636-4332-a391-5649771f345c'),(111,111,1,'1',NULL,1,'2021-04-06 12:32:41','2021-04-06 12:32:41','afb40e00-066e-4842-ad76-178418251c34'),(112,112,1,'article-3','latest/article-3',1,'2021-04-06 15:24:28','2021-04-06 15:24:57','cc1b728c-a275-49ec-8ba9-5d737ea9eb6f'),(113,113,1,'article-1-2-2','latest/article-1-2-2',1,'2021-04-06 15:24:28','2021-04-06 15:24:28','384832a6-0863-4dfb-9056-cd62281f630e'),(114,114,1,'article-2','latest/article-2',1,'2021-04-06 15:24:36','2021-04-06 15:24:36','5e858b4c-fdd0-4339-9ab6-e31edaf2ab31'),(115,115,1,'article-2','latest/article-2',1,'2021-04-06 15:24:44','2021-04-06 15:24:44','b92fca73-a453-4d02-8a7d-42525856341a'),(116,116,1,'article-3','latest/article-3',1,'2021-04-06 15:24:57','2021-04-06 15:24:57','1bc875f0-f407-4954-907b-a1eddf352df1'),(117,117,1,'latest','latest',1,'2021-04-06 15:37:49','2021-04-06 15:37:49','7a92614b-caae-4dfe-bb59-419454af4fea'),(118,118,1,NULL,NULL,1,'2021-04-06 15:37:49','2021-04-06 15:37:49','18eb3eba-d241-47d7-8a86-f0fb5694b0be'),(119,119,1,'contact','contact',1,'2021-04-06 15:56:14','2021-04-06 15:56:14','1b085bea-d36a-4657-8138-5481ba4c775f'),(120,120,1,NULL,NULL,1,'2021-04-06 15:56:14','2021-04-06 15:56:14','52d82524-9d7a-4444-a54f-309530c6f192'),(121,121,1,NULL,NULL,1,'2021-04-06 15:56:14','2021-04-06 15:56:14','1b6f1179-ca1b-420b-a0db-1c3f9891d89f'),(122,122,1,NULL,NULL,1,'2021-04-06 15:56:28','2021-04-06 15:56:28','673fdcf5-57c4-415f-afd6-9fd4eab4eab2'),(123,123,1,NULL,NULL,1,'2021-04-06 15:58:40','2021-04-06 15:58:40','27f39662-2e6e-4c63-84e3-9c937a209cb4'),(124,124,1,NULL,NULL,1,'2021-04-06 15:59:01','2021-04-06 15:59:01','c5eccaf3-4548-4350-840e-d05f6187ca58'),(125,125,1,NULL,NULL,1,'2021-04-06 16:08:17','2021-04-06 16:08:17','a98de334-3995-4936-ba55-f41088596c37'),(126,126,1,'homepage','__home__',1,'2021-04-06 16:08:17','2021-04-06 16:08:17','7cf3b658-1182-4959-8ffd-8276731e0f47'),(127,127,1,NULL,NULL,1,'2021-04-06 16:08:17','2021-04-06 16:08:17','c0196773-adea-4000-a3ab-cabafe455388'),(128,128,1,NULL,NULL,1,'2021-04-06 16:08:17','2021-04-06 16:08:17','ddae18a4-46b6-49c8-8ab6-6fd294f1d7a3'),(129,129,1,NULL,NULL,1,'2021-04-06 16:08:17','2021-04-06 16:08:17','db348800-10c2-4a4c-8bc2-6cf56656838b'),(130,130,1,NULL,NULL,1,'2021-04-06 16:08:17','2021-04-06 16:08:17','9c1aa89e-d853-4d70-8900-3e410f6e6630'),(131,131,1,NULL,NULL,1,'2021-04-07 08:25:58','2021-04-07 08:25:58','397e3cd8-fe6b-4d39-aed0-5ac0884cde03'),(132,132,1,'homepage','__home__',1,'2021-04-07 08:25:58','2021-04-07 08:25:58','42c85219-2c31-4179-8cfb-b33c27459c04'),(133,133,1,NULL,NULL,1,'2021-04-07 08:25:58','2021-04-07 08:25:58','aeaa8480-3682-4d03-92dd-3d477796724a'),(134,134,1,NULL,NULL,1,'2021-04-07 08:25:58','2021-04-07 08:25:58','0c26f752-01b3-4657-8ac8-2ed23b8e8601'),(135,135,1,NULL,NULL,1,'2021-04-07 08:25:58','2021-04-07 08:25:58','bcf58151-74d6-45b5-b01d-1c72c62bfcb6'),(136,136,1,NULL,NULL,1,'2021-04-07 08:25:58','2021-04-07 08:25:58','cc175c88-717e-4135-8cb8-feb89d745e1c'),(137,137,1,NULL,NULL,1,'2021-04-07 08:25:58','2021-04-07 08:25:58','11352ecd-ad68-4016-8c55-9abdd41cc470'),(138,138,1,NULL,NULL,1,'2021-04-07 08:54:20','2021-04-07 08:54:20','ec1fad2e-85a9-448e-b0c4-7f67ed3dd833'),(139,139,1,NULL,NULL,1,'2021-04-07 08:54:20','2021-04-07 08:54:20','cbe52ef6-6931-4ce2-96c8-fa252da4ec00'),(140,140,1,NULL,NULL,1,'2021-04-07 08:54:20','2021-04-07 08:54:20','f8a8f881-9202-408d-a073-66094aafbe47'),(141,141,1,'homepage','__home__',1,'2021-04-07 08:54:20','2021-04-07 08:54:20','4c220843-ba94-4bf2-9e7d-67bc0e5e2059'),(142,142,1,NULL,NULL,1,'2021-04-07 08:54:20','2021-04-07 08:54:20','4561eef7-7cfb-45b8-8195-721ff3997a82'),(143,143,1,NULL,NULL,1,'2021-04-07 08:54:20','2021-04-07 08:54:20','9ef06fa2-9a41-4193-b3a2-7c7b087ce4f0'),(144,144,1,NULL,NULL,1,'2021-04-07 08:54:20','2021-04-07 08:54:20','2faa0d9c-30cc-4980-bede-802623b4da71'),(145,145,1,NULL,NULL,1,'2021-04-07 08:54:20','2021-04-07 08:54:20','71317979-f67e-4842-b003-e1c4ed15c254'),(146,146,1,NULL,NULL,1,'2021-04-07 08:54:20','2021-04-07 08:54:20','37592b85-908b-4af9-bc92-30af46147c4e'),(147,147,1,NULL,NULL,1,'2021-04-07 08:54:20','2021-04-07 08:54:20','9ed4d099-c202-4931-a380-cc02923a9845'),(148,148,1,NULL,NULL,1,'2021-04-07 08:54:20','2021-04-07 08:54:20','efd01469-6983-4258-bf02-0d18e93d472f'),(149,149,1,NULL,NULL,1,'2021-04-07 08:54:20','2021-04-07 08:54:20','7392a03d-a5c3-485c-bf0a-8f7f9bdcd461'),(150,150,1,NULL,NULL,1,'2021-04-07 09:24:33','2021-04-07 09:24:33','2af12060-e338-403d-aed9-b11ab731ace3'),(151,151,1,'homepage','__home__',1,'2021-04-07 09:24:33','2021-04-07 09:24:33','95ddb007-f2db-41fb-89a7-9897a9888eab'),(152,152,1,NULL,NULL,1,'2021-04-07 09:24:33','2021-04-07 09:24:33','6216495b-a3a4-44e4-b37e-3280376f3dcb'),(153,153,1,NULL,NULL,1,'2021-04-07 09:24:33','2021-04-07 09:24:33','a925f398-366d-44bb-9e6f-ce96ec3a4a2d'),(154,154,1,NULL,NULL,1,'2021-04-07 09:24:33','2021-04-07 09:24:33','5ff8ebee-0d9a-4b8a-a0a6-161672d30c04'),(155,155,1,NULL,NULL,1,'2021-04-07 09:24:33','2021-04-07 09:24:33','af330936-6938-475e-9e5d-50d9eee29064'),(156,156,1,NULL,NULL,1,'2021-04-07 09:24:33','2021-04-07 09:24:33','1f711010-dcd3-46e7-8da5-13214c09bf87'),(157,157,1,NULL,NULL,1,'2021-04-07 09:24:33','2021-04-07 09:24:33','29a61584-fbfe-47c0-ba97-87a747ca40de'),(158,158,1,NULL,NULL,1,'2021-04-07 09:24:33','2021-04-07 09:24:33','33d78109-1122-4d15-9aa2-8f2b183f94d1'),(159,159,1,NULL,NULL,1,'2021-04-07 09:24:33','2021-04-07 09:24:33','c2d9dcb0-3e5b-4173-8963-d6934533fcf4'),(160,160,1,NULL,NULL,1,'2021-04-07 09:24:33','2021-04-07 09:24:33','8cf18ff2-d27f-4bf7-96b6-aa655cb29d94'),(161,161,1,NULL,NULL,1,'2021-04-07 09:31:18','2021-04-07 09:31:18','1212e97d-efc9-4f96-9610-4a4529b69c1b'),(162,162,1,'homepage','__home__',1,'2021-04-07 09:31:18','2021-04-07 09:31:18','9b375041-e290-4f09-b54f-e895491ae045'),(163,163,1,NULL,NULL,1,'2021-04-07 09:31:18','2021-04-07 09:31:18','91838f98-f536-4bbb-b57d-f87aa7a781d7'),(164,164,1,NULL,NULL,1,'2021-04-07 09:31:18','2021-04-07 09:31:18','c490c1d0-40e8-4985-a49e-44bcea0e3ccc'),(165,165,1,NULL,NULL,1,'2021-04-07 09:31:18','2021-04-07 09:31:18','9b4f7b6b-d528-4baf-b938-6c02c07c4773'),(166,166,1,NULL,NULL,1,'2021-04-07 09:31:18','2021-04-07 09:31:18','83de6e95-be98-40fc-bda6-b438b3e7ff43'),(167,167,1,NULL,NULL,1,'2021-04-07 09:31:18','2021-04-07 09:31:18','834ac73d-e4a1-41d1-ac76-4cbdbd6b410c'),(168,168,1,NULL,NULL,1,'2021-04-07 09:31:18','2021-04-07 09:31:18','70fc02cf-f6e9-469e-8bd9-eb61a19c83ea'),(169,169,1,NULL,NULL,1,'2021-04-07 09:31:18','2021-04-07 09:31:18','478970e6-f501-404b-a971-dd59fb2e57ba'),(170,170,1,NULL,NULL,1,'2021-04-07 09:31:18','2021-04-07 09:31:18','5a5c14e0-2269-432a-9783-0126632b10a8'),(171,171,1,NULL,NULL,1,'2021-04-07 09:31:18','2021-04-07 09:31:18','3f88e857-7fc4-4304-83ce-f933da948ddf'),(172,172,1,NULL,NULL,1,'2021-04-07 09:31:18','2021-04-07 09:31:18','69664b98-326b-443e-8788-dda73d8e99f6'),(173,173,1,NULL,NULL,1,'2021-04-07 09:42:14','2021-04-07 09:42:14','55eb3a65-3f44-4e94-af5a-cca8a54f9438'),(174,174,1,'homepage','__home__',1,'2021-04-07 09:42:14','2021-04-07 09:42:14','98b8a873-9006-41f0-b9dc-ffad4c69d6ee'),(175,175,1,NULL,NULL,1,'2021-04-07 09:42:14','2021-04-07 09:42:14','eb526d01-3fc6-4e8c-b61c-37ae35c82cfb'),(176,176,1,NULL,NULL,1,'2021-04-07 09:42:14','2021-04-07 09:42:14','d03da77e-16f9-4740-8df9-676582e9688e'),(177,177,1,NULL,NULL,1,'2021-04-07 09:42:14','2021-04-07 09:42:14','e845725d-86e7-4318-a63a-7d07cbb9df9e'),(178,178,1,NULL,NULL,1,'2021-04-07 09:42:14','2021-04-07 09:42:14','fd929b83-4957-48c1-8044-325ddf1f8f07'),(179,179,1,NULL,NULL,1,'2021-04-07 09:42:14','2021-04-07 09:42:14','698ddd5b-5e17-43e0-b64c-88df0ff79bd7'),(180,180,1,NULL,NULL,1,'2021-04-07 09:42:14','2021-04-07 09:42:14','b7cb9a09-f9ee-4448-9df2-cfd0f6bff3f6'),(181,181,1,NULL,NULL,1,'2021-04-07 09:42:14','2021-04-07 09:42:14','2af5ccbd-5523-4841-826f-39775bff82f6'),(182,182,1,NULL,NULL,1,'2021-04-07 09:42:14','2021-04-07 09:42:14','c3596cde-6fa8-425d-946b-54eb638daeeb'),(183,183,1,NULL,NULL,1,'2021-04-07 09:42:14','2021-04-07 09:42:14','ef3be20f-2365-40f4-923e-4936b349ed3b'),(184,184,1,NULL,NULL,1,'2021-04-07 09:42:14','2021-04-07 09:42:14','499738d4-b2c2-4d7c-8b3f-935a8d778ac0'),(185,185,1,NULL,NULL,1,'2021-04-07 09:55:25','2021-04-07 09:55:25','be6aac69-b77c-4262-808b-948b6f698ea5'),(186,186,1,NULL,NULL,1,'2021-04-07 09:55:25','2021-04-07 09:55:25','e1bfca6c-fe1e-4fed-aed0-53135b9182fd'),(187,187,1,NULL,NULL,1,'2021-04-07 09:55:25','2021-04-07 09:55:25','485d0ad3-def3-4553-b51c-7306ac0eef5e'),(188,188,1,'homepage','__home__',1,'2021-04-07 09:55:25','2021-04-07 09:55:25','175e92fd-f190-49c5-bab4-a5c6227b1c04'),(189,189,1,NULL,NULL,1,'2021-04-07 09:55:25','2021-04-07 09:55:25','03657d01-7175-4b2b-97a1-9cd190e46e2f'),(190,190,1,NULL,NULL,1,'2021-04-07 09:55:25','2021-04-07 09:55:25','2d605dd4-290f-49f4-942b-2cf9dfcad56b'),(191,191,1,NULL,NULL,1,'2021-04-07 09:55:25','2021-04-07 09:55:25','c91e9672-65fb-47e2-a516-c66898a0a02e'),(192,192,1,NULL,NULL,1,'2021-04-07 09:55:25','2021-04-07 09:55:25','65557819-ec29-4d95-8004-d45ad8771355'),(193,193,1,NULL,NULL,1,'2021-04-07 09:55:25','2021-04-07 09:55:25','9bf22877-a562-4b61-af96-bf8dc24e036e'),(194,194,1,NULL,NULL,1,'2021-04-07 09:55:25','2021-04-07 09:55:25','196d2c38-7f5c-4fa4-a06e-264063a40270'),(195,195,1,NULL,NULL,1,'2021-04-07 09:55:25','2021-04-07 09:55:25','3a868523-1508-4c0f-81f8-e517893085ad'),(196,196,1,NULL,NULL,1,'2021-04-07 09:55:25','2021-04-07 09:55:25','1add9a93-df33-4372-82e2-288f95f511d5'),(197,197,1,NULL,NULL,1,'2021-04-07 09:55:25','2021-04-07 09:55:25','9add633b-6dd9-453b-93e2-642ce625f34d'),(198,198,1,NULL,NULL,1,'2021-04-07 09:55:25','2021-04-07 09:55:25','047cbd74-8d0f-47d5-a5f8-ca1e6e5b8261'),(199,199,1,NULL,NULL,1,'2021-04-07 09:55:25','2021-04-07 09:55:25','08368fcf-5c0f-4dfd-a024-15dd6a562697'),(200,200,1,NULL,NULL,1,'2021-04-07 09:55:26','2021-04-07 09:55:26','9e9062ba-9517-4465-a8eb-ca2c1d072662'),(201,201,1,NULL,NULL,1,'2021-04-07 09:55:26','2021-04-07 09:55:26','20d70c2d-98d1-45a5-a2fe-169bc5113fd7');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries` VALUES (3,1,NULL,1,NULL,'2021-03-30 09:38:00',NULL,NULL,'2021-03-30 09:38:29','2021-03-30 09:38:29','419e7047-76ef-47e0-bdfa-b45f6ca0b29d'),(4,1,NULL,1,NULL,'2021-03-30 09:38:00',NULL,NULL,'2021-03-30 09:38:29','2021-03-30 09:38:29','75d0332b-b7a6-42b5-a083-bb2805ae9aec'),(5,1,NULL,1,NULL,'2021-03-30 09:38:00',NULL,NULL,'2021-03-30 09:38:52','2021-03-30 09:38:52','25873fde-3274-4d47-9436-45b919c6eb1b'),(6,1,NULL,1,NULL,'2021-03-30 09:38:00',NULL,NULL,'2021-03-30 10:13:09','2021-03-30 10:13:09','92b3f3f3-cc14-431d-a86d-bba445ed62a3'),(10,1,NULL,1,NULL,'2021-03-30 09:38:00',NULL,NULL,'2021-03-30 10:33:15','2021-03-30 10:33:15','8b4519a0-4d7c-41fc-aa71-7d8d37ed20dc'),(14,2,NULL,2,NULL,'2021-03-30 11:04:00',NULL,1,'2021-03-30 11:04:36','2021-03-30 11:04:36','b898447f-2e73-4cdb-8196-69330c748b57'),(15,2,NULL,2,NULL,'2021-03-30 11:04:00',NULL,NULL,'2021-03-30 11:04:36','2021-03-30 11:04:36','e05ec417-d674-4c37-8fb3-be3b6efd9a4f'),(16,2,NULL,2,NULL,'2021-03-30 11:04:00',NULL,NULL,'2021-03-30 11:05:00','2021-03-30 11:05:00','2a732d34-5e61-4118-8da6-e3ae307a86e4'),(17,3,NULL,3,NULL,'2021-03-30 11:05:00',NULL,1,'2021-03-30 11:05:32','2021-03-30 11:05:32','62d07598-8fd2-44cc-a715-27f8025a8676'),(18,3,NULL,3,NULL,'2021-03-30 11:05:00',NULL,NULL,'2021-03-30 11:05:32','2021-03-30 11:05:32','0e571125-98f3-4a82-b35d-8098565ee249'),(19,3,NULL,3,NULL,'2021-03-30 11:05:00',NULL,NULL,'2021-03-30 11:06:23','2021-03-30 11:06:23','55979594-c576-4dc7-81e8-e3c39b0c707c'),(22,3,NULL,3,NULL,'2021-03-30 11:05:00',NULL,NULL,'2021-03-30 11:07:21','2021-03-30 11:07:21','98a24ebb-a82d-4430-b83b-21f12edfb703'),(27,2,NULL,2,NULL,'2021-03-30 11:04:00',NULL,NULL,'2021-03-30 11:07:50','2021-03-30 11:07:50','6de12ea6-3a55-4065-83c1-c98d7b4c6d5f'),(30,2,NULL,2,NULL,'2021-03-30 11:04:00',NULL,NULL,'2021-03-30 11:09:07','2021-03-30 11:09:07','d36942ea-25e1-4664-aaa1-1524ade1a7d1'),(33,3,NULL,3,NULL,'2021-03-30 11:05:00',NULL,NULL,'2021-03-30 11:09:29','2021-03-30 11:09:29','1a63a863-4c70-41ef-a065-bef83838e184'),(36,2,NULL,2,NULL,'2021-03-30 11:04:00',NULL,NULL,'2021-03-30 11:09:56','2021-03-30 11:09:56','1ea3a92a-4a7f-4ff6-9d69-ed701eb6f97e'),(39,3,NULL,3,NULL,'2021-03-30 11:05:00',NULL,NULL,'2021-03-30 11:10:02','2021-03-30 11:10:02','b0574053-f736-4443-bf85-5fcfc04d07f8'),(49,1,NULL,1,NULL,'2021-03-30 09:38:00',NULL,NULL,'2021-03-30 14:30:04','2021-03-30 14:30:04','c7ee6543-1388-41d8-9fd2-f5aa25daa3b8'),(53,1,NULL,1,NULL,'2021-03-30 09:38:00',NULL,NULL,'2021-03-30 14:58:55','2021-03-30 14:58:55','758880b3-2bbe-49f7-a8db-af28d321e711'),(57,1,NULL,1,NULL,'2021-03-30 09:38:00',NULL,NULL,'2021-03-30 15:00:15','2021-03-30 15:00:15','b8e6fbb6-c888-4de6-b772-49fb415ff44f'),(61,4,NULL,4,NULL,'2021-03-31 11:24:00',NULL,NULL,'2021-03-31 11:24:42','2021-03-31 11:24:42','efc4871e-f734-4974-bca5-ab0b0468a532'),(62,4,NULL,4,NULL,'2021-03-31 11:24:00',NULL,NULL,'2021-03-31 11:24:42','2021-03-31 11:24:42','20f46f65-2125-4406-b36f-7bc4418d83e0'),(63,4,NULL,4,NULL,'2021-03-31 11:24:00',NULL,NULL,'2021-03-31 11:25:22','2021-03-31 11:25:22','ad7ccef4-4376-4c77-86a3-7a562c79660d'),(64,5,NULL,5,NULL,'2021-03-31 11:25:00',NULL,NULL,'2021-03-31 11:25:46','2021-03-31 11:25:46','6e02536a-2441-44e9-a2f9-d539b937c419'),(65,5,NULL,5,NULL,'2021-03-31 11:25:00',NULL,NULL,'2021-03-31 11:25:46','2021-03-31 11:25:46','406c7df3-9bc5-422e-85d9-fc74368ed4e4'),(66,4,NULL,4,NULL,'2021-03-31 11:24:00',NULL,NULL,'2021-03-31 11:26:20','2021-03-31 11:26:20','f482fc3c-ff0e-417a-bdf4-8e1aa3904c77'),(67,4,NULL,4,NULL,'2021-03-31 11:24:00',NULL,NULL,'2021-03-31 11:26:21','2021-03-31 11:26:21','2a6fc02e-c571-44e5-913e-ba92eb405823'),(68,6,NULL,6,NULL,'2021-03-31 11:27:00',NULL,NULL,'2021-03-31 11:27:00','2021-03-31 11:27:00','60550b17-715b-4ad3-9792-c58232c294ae'),(69,6,NULL,6,NULL,'2021-03-31 11:27:00',NULL,NULL,'2021-03-31 11:27:00','2021-03-31 11:27:00','25b0b7ee-0b37-4d66-b62f-8622e65b4f20'),(70,6,NULL,6,NULL,'2021-03-31 11:27:00',NULL,NULL,'2021-03-31 11:28:06','2021-03-31 11:28:06','12929303-fa21-4b79-92df-06eec34ee780'),(71,5,NULL,5,NULL,'2021-03-31 11:25:00',NULL,NULL,'2021-03-31 11:28:32','2021-03-31 11:28:32','4b92efed-688c-4dcd-a243-758f34c4ec15'),(75,4,NULL,4,NULL,'2021-03-31 11:24:00',NULL,NULL,'2021-03-31 11:33:02','2021-03-31 11:33:02','04cb03bd-e0ed-4c24-9e01-2f38203e5e0c'),(82,5,NULL,5,NULL,'2021-03-31 11:25:00',NULL,NULL,'2021-03-31 11:33:39','2021-03-31 11:33:39','46a63a88-724e-4ea8-bf50-8324e3c97538'),(89,6,NULL,6,NULL,'2021-03-31 11:27:00',NULL,NULL,'2021-03-31 11:34:48','2021-03-31 11:34:48','6d345feb-f335-4a6d-b08e-3cfc86d163a2'),(94,7,NULL,7,1,'2021-03-31 11:34:00',NULL,NULL,'2021-03-31 11:36:41','2021-03-31 11:36:41','c105179d-4d9e-4245-b4e2-0942ae5571dc'),(95,7,NULL,7,1,'2021-03-31 11:34:00',NULL,NULL,'2021-03-31 11:36:41','2021-03-31 11:36:41','fc3fa53f-63ad-4ba6-a2a2-e5ebbd9a4632'),(104,6,NULL,6,NULL,'2021-03-31 11:27:00',NULL,NULL,'2021-03-31 11:43:49','2021-03-31 11:43:49','5f6dfd02-5c4e-48ad-8e1d-86c7fc8ed61c'),(109,7,NULL,7,1,'2021-03-31 11:34:00',NULL,NULL,'2021-04-06 12:32:18','2021-04-06 12:32:18','4598e654-0242-454d-ba1e-f43c30cb69c4'),(110,7,NULL,7,1,'2021-03-31 11:34:00',NULL,NULL,'2021-04-06 12:32:18','2021-04-06 12:32:18','453ee212-b0c0-4c02-a22c-986a2bca8ad5'),(112,7,NULL,7,1,'2021-03-31 11:34:00',NULL,NULL,'2021-04-06 15:24:28','2021-04-06 15:24:28','21fa51c1-2d4b-4201-a369-48c2dde6a918'),(113,7,NULL,7,1,'2021-03-31 11:34:00',NULL,NULL,'2021-04-06 15:24:28','2021-04-06 15:24:28','7abda17e-5cc7-41aa-a598-0d15bc804989'),(114,7,NULL,7,1,'2021-03-31 11:34:00',NULL,NULL,'2021-04-06 15:24:36','2021-04-06 15:24:36','6f234a7c-2d0a-419e-adeb-75b105aa3adf'),(115,7,NULL,7,1,'2021-03-31 11:34:00',NULL,NULL,'2021-04-06 15:24:44','2021-04-06 15:24:44','e941326e-2bc5-4ac3-9c09-d0628d18fa29'),(116,7,NULL,7,1,'2021-03-31 11:34:00',NULL,NULL,'2021-04-06 15:24:57','2021-04-06 15:24:57','cff4e521-fc5d-42b6-8aa1-38e40182fcb8'),(117,6,NULL,6,NULL,'2021-03-31 11:27:00',NULL,NULL,'2021-04-06 15:37:49','2021-04-06 15:37:49','6e18f37a-6826-4504-97d6-72ef4d1e03c5'),(119,5,NULL,5,NULL,'2021-03-31 11:25:00',NULL,NULL,'2021-04-06 15:56:14','2021-04-06 15:56:14','2edad9a9-2d30-40ac-a97b-826bac7ba215'),(126,1,NULL,1,NULL,'2021-03-30 09:38:00',NULL,NULL,'2021-04-06 16:08:17','2021-04-06 16:08:17','235a0d0b-3a90-491a-8af7-8ce47155164e'),(132,1,NULL,1,NULL,'2021-03-30 09:38:00',NULL,NULL,'2021-04-07 08:25:58','2021-04-07 08:25:58','204b5dc2-6f32-4e0d-aa49-5e58acb04d7a'),(141,1,NULL,1,NULL,'2021-03-30 09:38:00',NULL,NULL,'2021-04-07 08:54:20','2021-04-07 08:54:20','4e5b98e0-7956-420c-a72d-9dcb5a74ac8b'),(151,1,NULL,1,NULL,'2021-03-30 09:38:00',NULL,NULL,'2021-04-07 09:24:33','2021-04-07 09:24:33','8e11cf7a-3646-4e0c-b8f2-9ac1dff167d0'),(162,1,NULL,1,NULL,'2021-03-30 09:38:00',NULL,NULL,'2021-04-07 09:31:18','2021-04-07 09:31:18','619ab621-4f4a-49ba-a757-64906964439b'),(174,1,NULL,1,NULL,'2021-03-30 09:38:00',NULL,NULL,'2021-04-07 09:42:14','2021-04-07 09:42:14','cec2e8dc-744d-4535-bde4-581551d39c2c'),(188,1,NULL,1,NULL,'2021-03-30 09:38:00',NULL,NULL,'2021-04-07 09:55:25','2021-04-07 09:55:25','46a4502b-bb9b-40c4-91ae-c6ca47d817ed');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entrytypes` VALUES (1,1,3,'Homepage','homepage',1,'site',NULL,'{section.name|raw}',1,'2021-03-30 09:38:29','2021-03-30 10:13:09',NULL,'369ea60f-6259-4683-adcc-23418cf8285e'),(2,2,7,'About us','aboutUs',1,'site',NULL,'{section.name|raw}',1,'2021-03-30 11:04:36','2021-03-30 11:05:00','2021-03-30 14:30:19','e712e3c2-4fb0-4741-b535-3be1103a56f6'),(3,3,8,'Contact','contact',1,'site',NULL,'{section.name|raw}',1,'2021-03-30 11:05:32','2021-03-30 11:06:23','2021-03-30 14:30:22','5566eeab-b8cf-4a85-917c-1a72bb54c7a3'),(4,4,11,'About','about',1,'site',NULL,'{section.name|raw}',1,'2021-03-31 11:24:42','2021-03-31 11:26:21',NULL,'f6901440-dc45-4323-a125-0a7d3d90f06c'),(5,5,12,'Contact','contact',1,'site',NULL,'{section.name|raw}',1,'2021-03-31 11:25:46','2021-03-31 11:28:32',NULL,'76ee93ec-459e-4fa9-967f-aa9b48f7b9e1'),(6,6,13,'Latest Index','latestIndex',1,'site',NULL,'{section.name|raw}',1,'2021-03-31 11:27:00','2021-03-31 11:28:06',NULL,'714a1c4f-39d2-4a93-b0fc-1d7089a16ff2'),(7,7,14,'Latest','latest',1,'site',NULL,NULL,1,'2021-03-31 11:27:16','2021-03-31 11:27:16',NULL,'d305657a-b071-42af-960e-aa7b81715a02');
/*!40000 ALTER TABLE `entrytypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldgroups`
--

LOCK TABLES `fieldgroups` WRITE;
/*!40000 ALTER TABLE `fieldgroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldgroups` VALUES (1,'Common','2021-03-30 09:20:10','2021-03-30 09:20:10',NULL,'eb7f69a9-9a89-4024-ba3f-9154d28ac58c'),(2,'Globals','2021-03-30 09:28:39','2021-03-30 09:28:39',NULL,'431efb4a-9ace-451f-8b70-aeda20b1f83f'),(3,'Settings','2021-03-30 09:31:26','2021-03-30 09:31:26',NULL,'7bbeec1d-6526-44a3-9897-d6d1e5918a05'),(4,'SEO','2021-03-30 09:35:52','2021-03-30 09:35:52',NULL,'8f3d51d8-227c-42c1-b81e-f3cba4189a99'),(5,'Summary','2021-03-30 09:37:11','2021-03-30 09:37:11',NULL,'6b6833e3-09b6-4302-8492-fd06e3f794e4'),(6,'Content Builder','2021-03-30 09:39:04','2021-03-30 09:39:04',NULL,'b4718bab-e938-4b97-a8e4-adc9fe5f4ca7'),(7,'Content Builder Fields','2021-03-30 09:39:11','2021-03-30 09:39:11',NULL,'70f3e289-0ffa-4d8a-a2a4-e8c6db06ee3c');
/*!40000 ALTER TABLE `fieldgroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayoutfields`
--

LOCK TABLES `fieldlayoutfields` WRITE;
/*!40000 ALTER TABLE `fieldlayoutfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayoutfields` VALUES (1,1,1,5,0,0,'2021-03-30 09:30:23','2021-03-30 09:30:23','141221f4-3452-4183-a107-c942823fe8c5'),(2,1,1,6,0,1,'2021-03-30 09:30:23','2021-03-30 09:30:23','164fd265-42f6-4b50-9be5-d8ca7f8675d9'),(3,1,1,7,0,2,'2021-03-30 09:30:23','2021-03-30 09:30:23','d9e9b8b7-8f2f-434c-af0f-a03ee917722f'),(4,1,1,8,0,3,'2021-03-30 09:30:23','2021-03-30 09:30:23','76f8f724-864f-4058-87b5-c32302fe2c0c'),(5,2,2,1,0,0,'2021-03-30 09:31:09','2021-03-30 09:31:09','d58f9856-e60b-440c-86b9-7c7a0c153503'),(6,2,2,2,0,1,'2021-03-30 09:31:09','2021-03-30 09:31:09','38ab999c-7a60-4b8c-8b0d-d4408f0b249c'),(7,2,2,3,0,2,'2021-03-30 09:31:09','2021-03-30 09:31:09','4bb0da4a-2752-46e2-a7a6-f8634fa2ef67'),(8,2,2,4,0,3,'2021-03-30 09:31:09','2021-03-30 09:31:09','52c3891d-02a6-4278-974d-b8bf8c2f3faa'),(24,3,13,18,0,1,'2021-03-30 10:13:09','2021-03-30 10:13:09','d9b832b5-8b14-42c3-972f-84f50282eaf4'),(25,3,13,17,0,2,'2021-03-30 10:13:09','2021-03-30 10:13:09','df02a239-7453-4e58-a007-604e97803d8d'),(26,3,14,13,0,0,'2021-03-30 10:13:09','2021-03-30 10:13:09','d353fb3c-5180-4bd1-b38b-c77d9e60d7b4'),(27,3,14,14,0,1,'2021-03-30 10:13:09','2021-03-30 10:13:09','15c28753-1fce-4330-854c-2f4e9e4fdf69'),(28,3,15,12,0,0,'2021-03-30 10:13:09','2021-03-30 10:13:09','8b510fe1-ba3a-4d8b-b2ed-be56f54e7233'),(35,6,18,19,0,0,'2021-03-30 10:34:23','2021-03-30 10:34:23','73d0933e-b40e-47dc-8584-85b692bc750c'),(36,6,18,15,0,1,'2021-03-30 10:34:23','2021-03-30 10:34:23','b5d8f129-e5c5-4c5f-84c1-01b202196e46'),(37,6,18,20,0,2,'2021-03-30 10:34:23','2021-03-30 10:34:23','2fe92831-50e6-49bc-9a7e-8dd664cad85d'),(38,6,19,9,0,0,'2021-03-30 10:34:23','2021-03-30 10:34:23','46ccfc48-1e0c-4178-aaf7-d03a3b10f717'),(39,6,19,11,0,1,'2021-03-30 10:34:23','2021-03-30 10:34:23','77103c00-7f68-44d1-b319-d666bae7cd71'),(40,6,19,10,0,2,'2021-03-30 10:34:23','2021-03-30 10:34:23','a4133b49-46f7-44c7-a639-c375b0e9c732'),(41,7,21,18,0,1,'2021-03-30 11:05:00','2021-03-30 11:05:00','780487ea-efee-4c15-8d5e-2602c8094475'),(42,7,21,17,0,2,'2021-03-30 11:05:00','2021-03-30 11:05:00','f2747cf0-b26c-43b9-bfe7-f45e56473ceb'),(43,7,22,13,0,0,'2021-03-30 11:05:00','2021-03-30 11:05:00','495ebb59-48fa-4832-b5ee-c6d6e1309ed0'),(44,7,22,14,0,1,'2021-03-30 11:05:00','2021-03-30 11:05:00','896bddfd-ce2a-49c4-93fc-ee8b46f234ac'),(45,7,23,12,0,0,'2021-03-30 11:05:00','2021-03-30 11:05:00','d3b38543-40fd-43f0-a9fe-54beb598ef5d'),(46,8,25,18,0,1,'2021-03-30 11:06:23','2021-03-30 11:06:23','00edbe70-c036-4796-834a-0b1ef3394ad8'),(47,8,25,17,0,2,'2021-03-30 11:06:23','2021-03-30 11:06:23','5ac5612a-e6b5-4d4d-9882-9f996f2d69c7'),(48,8,26,13,0,0,'2021-03-30 11:06:23','2021-03-30 11:06:23','0feb2ced-d016-4ba7-b63f-5db677675183'),(49,8,26,14,0,1,'2021-03-30 11:06:23','2021-03-30 11:06:23','b4601d74-5440-4867-a8c7-6b58f23ce090'),(50,8,27,12,0,0,'2021-03-30 11:06:23','2021-03-30 11:06:23','b9cceeb2-4127-424a-a7ed-d03b7dfa7bde'),(51,10,29,21,0,0,'2021-03-30 13:16:05','2021-03-30 13:16:05','56af1a84-9bbe-4bbf-8eae-baf3fe4f4552'),(57,11,35,18,0,1,'2021-03-31 11:26:21','2021-03-31 11:26:21','6ca5b300-b887-458e-a115-7e17d11ed2b1'),(58,11,35,17,0,2,'2021-03-31 11:26:21','2021-03-31 11:26:21','28062b32-fc4b-423e-9c3c-03b19a32b585'),(59,11,36,13,0,0,'2021-03-31 11:26:21','2021-03-31 11:26:21','26465899-8c2f-4e3c-aa29-161fdea44bbb'),(60,11,36,14,0,1,'2021-03-31 11:26:21','2021-03-31 11:26:21','b3f3c8fd-539c-47bb-bb4b-9a3da88826fc'),(61,11,37,12,0,0,'2021-03-31 11:26:21','2021-03-31 11:26:21','53a29f3c-1a16-4c2a-9adf-302f3a280d34'),(69,12,44,18,0,1,'2021-03-31 11:28:32','2021-03-31 11:28:32','ba95ef8c-a316-4510-9130-e3d56fbb7cff'),(70,12,44,17,0,2,'2021-03-31 11:28:32','2021-03-31 11:28:32','cd176138-897f-4af4-aff0-768da16577f5'),(71,12,45,13,0,0,'2021-03-31 11:28:32','2021-03-31 11:28:32','9a675f6c-5bc5-4c79-b834-222934b3e03a'),(72,12,45,14,0,1,'2021-03-31 11:28:32','2021-03-31 11:28:32','ab4bfe37-b0e2-4f5d-967f-cc9db07009b6'),(73,12,46,12,0,0,'2021-03-31 11:28:32','2021-03-31 11:28:32','4b5dfbb3-1827-4d3a-b521-d5bdc05c31ab'),(76,14,48,19,0,1,'2021-03-31 11:36:09','2021-03-31 11:36:09','eee4350e-10ea-45f6-9362-2c9bee0318e8'),(77,14,48,15,0,2,'2021-03-31 11:36:09','2021-03-31 11:36:09','fd4eba56-0a65-424d-81f8-3a5e934c029a'),(78,14,49,13,0,0,'2021-03-31 11:36:09','2021-03-31 11:36:09','204b6f14-93bc-4dae-9e20-51c2d6491f7c'),(79,14,49,14,0,1,'2021-03-31 11:36:09','2021-03-31 11:36:09','97866c7b-c894-41ee-9608-1f2b26025c8d'),(80,14,50,12,0,0,'2021-03-31 11:36:09','2021-03-31 11:36:09','87edae95-ccef-4e24-80e7-d1549c2b10d8'),(81,13,51,18,0,1,'2021-04-06 15:37:48','2021-04-06 15:37:48','978f31f7-2b29-4db3-a9a3-cce635242dd2'),(82,13,52,13,0,0,'2021-04-06 15:37:48','2021-04-06 15:37:48','30948338-5ddb-4bdd-b04a-63f1e7187faa'),(83,13,52,14,0,1,'2021-04-06 15:37:48','2021-04-06 15:37:48','c7b989aa-0ab4-4deb-abee-3186b711785f'),(84,13,53,12,0,0,'2021-04-06 15:37:48','2021-04-06 15:37:48','394d3473-7ca2-4482-bd64-591fa3446436'),(111,17,68,25,0,0,'2021-04-07 08:48:55','2021-04-07 08:48:55','d06a9033-6037-4884-966a-452e7e35abd0'),(112,17,68,26,0,1,'2021-04-07 08:48:55','2021-04-07 08:48:55','4342aaa1-5bc2-4f6b-a245-752094a63377'),(136,19,79,27,0,0,'2021-04-07 09:27:06','2021-04-07 09:27:06','1fb7667e-73c9-4f61-9aad-91bbbd450360'),(137,20,80,28,0,0,'2021-04-07 09:27:06','2021-04-07 09:27:06','28749fa6-6123-4b90-9438-c31b158c3f08'),(138,21,81,30,0,0,'2021-04-07 09:53:17','2021-04-07 09:53:17','64759695-c4c1-4711-bf4e-0065498061bc'),(139,21,81,31,0,1,'2021-04-07 09:53:17','2021-04-07 09:53:17','95910ba2-5d51-48e3-9af5-ad3c571b7322'),(140,22,82,33,0,0,'2021-04-07 09:53:17','2021-04-07 09:53:17','12b307e8-ee7d-4d89-9766-f11a2e0efb54'),(141,22,82,32,0,1,'2021-04-07 09:53:17','2021-04-07 09:53:17','a392435d-13b6-47bd-b4a3-58fb4dbdb305'),(165,4,93,15,0,0,'2021-04-07 09:54:03','2021-04-07 09:54:03','32504bd6-ab15-47c5-9784-297b1d015392'),(166,4,94,9,0,0,'2021-04-07 09:54:03','2021-04-07 09:54:03','a1a50bea-a9cb-4209-a669-da8ece057c5d'),(167,4,94,11,0,1,'2021-04-07 09:54:03','2021-04-07 09:54:03','b563c466-365b-4bcb-8d09-7d3408f54ef8'),(168,4,94,10,0,2,'2021-04-07 09:54:03','2021-04-07 09:54:03','709eecab-993d-404d-960b-9917f2847f73'),(169,5,95,16,0,0,'2021-04-07 09:54:03','2021-04-07 09:54:03','c08fc1a0-d58d-494e-8481-7f511408b15c'),(170,5,96,9,0,0,'2021-04-07 09:54:03','2021-04-07 09:54:03','b310021c-6cd7-4625-aabe-132ee077fa42'),(171,5,96,11,0,1,'2021-04-07 09:54:03','2021-04-07 09:54:03','4849c938-b355-4464-867c-3c4ad722760e'),(172,5,96,10,0,2,'2021-04-07 09:54:03','2021-04-07 09:54:03','044d71ad-8368-4558-b6f5-3044e3f55381'),(173,15,97,19,0,0,'2021-04-07 09:54:03','2021-04-07 09:54:03','d21cb7d5-32f7-4e7a-b76f-09b02d1a8010'),(174,15,97,22,0,1,'2021-04-07 09:54:03','2021-04-07 09:54:03','aead0a0a-8b8a-4273-9f71-d26980eb0c2f'),(175,15,98,9,0,0,'2021-04-07 09:54:03','2021-04-07 09:54:03','fd198efa-bbd1-4493-a433-5dfe6541a8da'),(176,15,98,11,0,1,'2021-04-07 09:54:03','2021-04-07 09:54:03','2960e962-2c78-4556-baa8-0c0f8f85d9ed'),(177,15,98,10,0,2,'2021-04-07 09:54:03','2021-04-07 09:54:03','9379f240-52da-4b5e-8839-dc208a566dcd'),(178,16,99,19,0,0,'2021-04-07 09:54:03','2021-04-07 09:54:03','6408d879-491b-42a2-9cc0-744cf15797e9'),(179,16,99,23,0,1,'2021-04-07 09:54:03','2021-04-07 09:54:03','7570c025-8bf8-4c9a-a34b-cf9c1e1242dc'),(180,16,100,9,0,0,'2021-04-07 09:54:03','2021-04-07 09:54:03','58eaf3e4-35e3-4f60-9d3c-8195f1275d8f'),(181,16,100,11,0,1,'2021-04-07 09:54:03','2021-04-07 09:54:03','0032323e-b578-456d-a6d4-1581b34d42d1'),(182,16,100,10,0,2,'2021-04-07 09:54:03','2021-04-07 09:54:03','07544516-b30a-4ef6-bca4-618d5c761b67'),(183,18,101,19,0,0,'2021-04-07 09:54:03','2021-04-07 09:54:03','aabda7b6-ad50-4a75-b9dc-a44d6b0aeb23'),(184,18,101,24,0,1,'2021-04-07 09:54:03','2021-04-07 09:54:03','92f0e828-47e5-4f45-997d-524e8239527d'),(185,18,102,10,0,0,'2021-04-07 09:54:03','2021-04-07 09:54:03','e2f931d6-f45f-4a66-a4b3-ca9386993473'),(186,18,102,11,0,1,'2021-04-07 09:54:03','2021-04-07 09:54:03','3632804c-3a86-4d7f-b613-8d44dac9ac43'),(187,18,102,9,0,2,'2021-04-07 09:54:03','2021-04-07 09:54:03','e86bc6c9-111d-44cb-9399-935eb8253e9a'),(188,23,103,29,0,0,'2021-04-07 09:54:03','2021-04-07 09:54:03','c158cf4c-c59d-4904-a7a1-8d57d89e5135'),(189,23,104,9,0,0,'2021-04-07 09:54:03','2021-04-07 09:54:03','1366ec0b-89f2-4f12-aa8a-1292209ff330'),(190,23,104,11,0,1,'2021-04-07 09:54:03','2021-04-07 09:54:03','e27c8412-2132-4499-a7b9-792e0a8f7aa4'),(191,23,104,10,0,2,'2021-04-07 09:54:03','2021-04-07 09:54:03','89947e9b-57fe-4318-a098-6ab7e115e6b8');
/*!40000 ALTER TABLE `fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouts` VALUES (1,'verbb\\supertable\\elements\\SuperTableBlockElement','2021-03-30 09:30:23','2021-03-30 09:30:23',NULL,'f73678d2-2b29-48d7-99ef-179a914dc502'),(2,'craft\\elements\\GlobalSet','2021-03-30 09:31:09','2021-03-30 09:31:09',NULL,'d4df5b39-edcc-44f4-9b34-c6e29bad800d'),(3,'craft\\elements\\Entry','2021-03-30 09:38:29','2021-03-30 09:38:29',NULL,'f5c95668-587e-4459-8b0a-5e51bfb4e8e7'),(4,'benf\\neo\\elements\\Block','2021-03-30 09:41:28','2021-03-30 09:41:28',NULL,'09f21b0b-1728-4107-8524-245797d45dd7'),(5,'benf\\neo\\elements\\Block','2021-03-30 09:41:28','2021-03-30 09:41:28',NULL,'54d12f2e-2177-456e-a4b5-4e0803e641b5'),(6,'benf\\neo\\elements\\Block','2021-03-30 09:42:27','2021-03-30 09:42:27',NULL,'6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a'),(7,'craft\\elements\\Entry','2021-03-30 11:04:36','2021-03-30 11:04:36','2021-03-30 14:30:19','42e73765-beb6-4378-ae83-920f9f328575'),(8,'craft\\elements\\Entry','2021-03-30 11:05:32','2021-03-30 11:05:32','2021-03-30 14:30:22','fc7f009e-bfc8-4d7b-bbd3-57e6aa1bc672'),(9,'craft\\elements\\Asset','2021-03-30 11:43:14','2021-03-30 11:43:14','2021-03-30 14:31:52','04594773-5b38-40f0-b373-70e249c5b472'),(10,'craft\\elements\\GlobalSet','2021-03-30 13:16:05','2021-03-30 13:16:05',NULL,'f2d8768a-cbb9-4a52-a62f-3cebeccc956b'),(11,'craft\\elements\\Entry','2021-03-31 11:24:42','2021-03-31 11:24:42',NULL,'655e373b-851f-4c7a-b8bb-0dc97e099268'),(12,'craft\\elements\\Entry','2021-03-31 11:25:46','2021-03-31 11:25:46',NULL,'7834aadb-497b-49cf-849b-b919602283d9'),(13,'craft\\elements\\Entry','2021-03-31 11:27:00','2021-03-31 11:27:00',NULL,'82acde96-0487-43ca-9551-550a19bde42f'),(14,'craft\\elements\\Entry','2021-03-31 11:27:16','2021-03-31 11:27:16',NULL,'7dbf399e-3c1f-423e-a751-ddc09e73f155'),(15,'benf\\neo\\elements\\Block','2021-04-06 16:08:06','2021-04-06 16:08:06',NULL,'de116c4b-6fdd-4504-a503-62e66fb88f12'),(16,'benf\\neo\\elements\\Block','2021-04-07 08:25:16','2021-04-07 08:25:16',NULL,'2394efd8-b6b2-418c-8ce4-99bfc647be17'),(17,'craft\\elements\\MatrixBlock','2021-04-07 08:48:55','2021-04-07 08:48:55',NULL,'e5166699-4103-4dbe-8f15-7722d35cd4fb'),(18,'benf\\neo\\elements\\Block','2021-04-07 08:50:11','2021-04-07 08:50:11',NULL,'03e13715-9e15-411e-9502-fb9b8a38cb3b'),(19,'craft\\elements\\MatrixBlock','2021-04-07 09:27:06','2021-04-07 09:27:06',NULL,'9d1dd6bd-ecbd-4cec-a43f-fe57ed410352'),(20,'craft\\elements\\MatrixBlock','2021-04-07 09:27:06','2021-04-07 09:27:06',NULL,'8be94203-c156-4c39-9b45-466e97070395'),(21,'craft\\elements\\MatrixBlock','2021-04-07 09:53:17','2021-04-07 09:53:17',NULL,'da6619a7-ccfc-4768-b5a7-c580341ac8b4'),(22,'craft\\elements\\MatrixBlock','2021-04-07 09:53:17','2021-04-07 09:53:17',NULL,'88a967f0-7417-4348-a669-4842b7aae7af'),(23,'benf\\neo\\elements\\Block','2021-04-07 09:54:03','2021-04-07 09:54:03',NULL,'99e9a34b-f717-4b29-8c2b-75b95fd83d8f');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouttabs`
--

LOCK TABLES `fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `fieldlayouttabs` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouttabs` VALUES (1,1,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"1f6a1dc8-82d8-47a8-ae54-01af20652730\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"5cd6ad16-cb88-45ba-b275-1558f8f27c05\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"a596aec7-c8ec-49d7-ab4d-97dcdf5ac990\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"d9aafe6e-671c-45da-9958-ccb6470336d6\"}]',1,'2021-03-30 09:30:23','2021-03-30 09:30:23','46a70101-f073-4883-aea2-444b3e9a40f7'),(2,2,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"4af3caf9-e4e3-4acd-90f8-1e8cd585e497\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"3cca813e-09a9-4025-8efa-d5ba11d4dd89\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"386e1cf1-acc9-4336-90e1-fb74daefd6f5\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"13d35453-527a-4094-b642-42292f193f8c\"}]',1,'2021-03-30 09:31:09','2021-03-30 09:31:09','2db2160d-f0bb-4ad1-a0ba-4125293b6445'),(13,3,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"d783368e-a494-4457-9e99-5a027ae72a18\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"1d1d5665-5674-4388-8d46-9b87e4dc65d3\"}]',1,'2021-03-30 10:13:09','2021-03-30 10:13:09','f1585199-7b75-474e-8d0e-39c629cc146d'),(14,3,'Summary','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"39237593-ff51-4bd3-851a-a9dfac329c0b\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"4184d945-e90d-4433-b1f3-727edf65107e\"}]',2,'2021-03-30 10:13:09','2021-03-30 10:13:09','239c7ada-5033-45b6-8833-d79fd4497dc8'),(15,3,'SEO','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"7c5c4db7-bc5e-4979-a31b-6b7734989556\"}]',3,'2021-03-30 10:13:09','2021-03-30 10:13:09','941c2d1a-2696-4741-957e-58a211a922a7'),(18,6,'Main Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"2f64efd3-101a-4ed1-a31e-96657d6dc6e5\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"1d1c9f28-39de-4df6-b077-856d16c001ca\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"4870444e-6820-4ab0-a141-99e310305629\"}]',1,'2021-03-30 10:34:23','2021-03-30 10:34:23','f5de53ec-43e2-4bd7-a1de-834d236e7299'),(19,6,'Settings','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"336f207f-f4fb-43c3-bbc3-f10b641e940a\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"6c4a2320-184d-4f3b-9482-070fc8b8194a\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"bb3731df-a01f-4725-9f8b-06d99359fd9f\"}]',2,'2021-03-30 10:34:23','2021-03-30 10:34:23','ada4a267-4979-4062-86e8-14e5c2664d33'),(21,7,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"d783368e-a494-4457-9e99-5a027ae72a18\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"1d1d5665-5674-4388-8d46-9b87e4dc65d3\"}]',1,'2021-03-30 11:05:00','2021-03-30 11:05:00','7fdd9fc5-d2b7-4fe9-ab53-f75b64003de7'),(22,7,'Summary','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"39237593-ff51-4bd3-851a-a9dfac329c0b\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"4184d945-e90d-4433-b1f3-727edf65107e\"}]',2,'2021-03-30 11:05:00','2021-03-30 11:05:00','7afc9a58-6d49-48f2-bf23-6d50d3bbd740'),(23,7,'SEO','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"7c5c4db7-bc5e-4979-a31b-6b7734989556\"}]',3,'2021-03-30 11:05:00','2021-03-30 11:05:00','57d9d2ac-9315-4129-b5d2-a1fe9e2787ab'),(25,8,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"d783368e-a494-4457-9e99-5a027ae72a18\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"1d1d5665-5674-4388-8d46-9b87e4dc65d3\"}]',1,'2021-03-30 11:06:23','2021-03-30 11:06:23','15719896-4921-4fca-9716-2ca2fd315dca'),(26,8,'Summary','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"39237593-ff51-4bd3-851a-a9dfac329c0b\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"4184d945-e90d-4433-b1f3-727edf65107e\"}]',2,'2021-03-30 11:06:23','2021-03-30 11:06:23','2c086e62-895a-4a6b-98b4-5b8eb92062c6'),(27,8,'SEO','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"7c5c4db7-bc5e-4979-a31b-6b7734989556\"}]',3,'2021-03-30 11:06:23','2021-03-30 11:06:23','a87820a3-8af7-47a8-a829-e64835a8fd7b'),(28,9,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\AssetTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]',1,'2021-03-30 11:43:14','2021-03-30 11:43:14','39bdba3e-8041-4e0d-8b55-ea8a024f9b64'),(29,10,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"3f092924-7454-4778-a975-9d6112f3eb20\"}]',1,'2021-03-30 13:16:05','2021-03-30 13:16:05','0c0a3b11-797c-403b-b697-8cc30d5b27c4'),(35,11,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"d783368e-a494-4457-9e99-5a027ae72a18\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"1d1d5665-5674-4388-8d46-9b87e4dc65d3\"}]',1,'2021-03-31 11:26:21','2021-03-31 11:26:21','313db7da-6dc4-4499-9451-7598e5a2c17d'),(36,11,'Summary','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"39237593-ff51-4bd3-851a-a9dfac329c0b\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"4184d945-e90d-4433-b1f3-727edf65107e\"}]',2,'2021-03-31 11:26:21','2021-03-31 11:26:21','36c3f4d6-19b3-4164-adea-c01199e7fffe'),(37,11,'SEO','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"7c5c4db7-bc5e-4979-a31b-6b7734989556\"}]',3,'2021-03-31 11:26:21','2021-03-31 11:26:21','73c7e5e2-7062-4ea5-8394-62aa05c1a1b2'),(44,12,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"d783368e-a494-4457-9e99-5a027ae72a18\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"1d1d5665-5674-4388-8d46-9b87e4dc65d3\"}]',1,'2021-03-31 11:28:32','2021-03-31 11:28:32','f2a8b50b-d005-4cfa-93fc-321a734f7441'),(45,12,'Summary','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"39237593-ff51-4bd3-851a-a9dfac329c0b\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"4184d945-e90d-4433-b1f3-727edf65107e\"}]',2,'2021-03-31 11:28:32','2021-03-31 11:28:32','998bd0d9-59a0-46d7-aa13-8d8d7224cacb'),(46,12,'SEO','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"7c5c4db7-bc5e-4979-a31b-6b7734989556\"}]',3,'2021-03-31 11:28:32','2021-03-31 11:28:32','4c8b9867-5bfd-49e2-80fb-d4397a5fa25e'),(48,14,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"2f64efd3-101a-4ed1-a31e-96657d6dc6e5\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"1d1c9f28-39de-4df6-b077-856d16c001ca\"}]',1,'2021-03-31 11:36:09','2021-03-31 11:36:09','6c94c891-abaf-4644-8ddf-e332a12c8c47'),(49,14,'Summary','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"39237593-ff51-4bd3-851a-a9dfac329c0b\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"4184d945-e90d-4433-b1f3-727edf65107e\"}]',2,'2021-03-31 11:36:09','2021-03-31 11:36:09','64268d65-aca4-43df-af7a-f729184d985d'),(50,14,'SEO','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"7c5c4db7-bc5e-4979-a31b-6b7734989556\"}]',3,'2021-03-31 11:36:09','2021-03-31 11:36:09','3a9fcb52-6385-4284-9a44-d03b9a2aeae5'),(51,13,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"d783368e-a494-4457-9e99-5a027ae72a18\"}]',1,'2021-04-06 15:37:48','2021-04-06 15:37:48','793efd8a-cde5-40f0-89bf-394661fab117'),(52,13,'Summary','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"39237593-ff51-4bd3-851a-a9dfac329c0b\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"4184d945-e90d-4433-b1f3-727edf65107e\"}]',2,'2021-04-06 15:37:48','2021-04-06 15:37:48','22dfebec-c581-465a-8fa5-3ebab5a8f5a6'),(53,13,'SEO','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"7c5c4db7-bc5e-4979-a31b-6b7734989556\"}]',3,'2021-04-06 15:37:48','2021-04-06 15:37:48','0751161f-1856-4a6a-b258-c10a3354d9ac'),(68,17,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"6bc4604d-7a4d-4a0c-ad53-c3a6adc1a6e8\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"f85e63c0-1f6c-495c-95b7-6b70d338bd07\"}]',1,'2021-04-07 08:48:55','2021-04-07 08:48:55','f41ffd0c-62c2-40c0-8a6c-026975e19024'),(79,19,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"7d034fae-78a0-49b6-a213-aa01fcdf690e\"}]',1,'2021-04-07 09:27:06','2021-04-07 09:27:06','65238bcb-7567-4c6f-9549-5e0724db4388'),(80,20,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"588b4c33-d66a-429a-a796-a6146b14a0f8\"}]',1,'2021-04-07 09:27:06','2021-04-07 09:27:06','bfa9f2df-40c8-4422-b987-61d8596c192f'),(81,21,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"3e5005f5-763a-459a-9bb7-74b2de70f748\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"d54ca455-7ff5-451f-98e4-350b3abb1847\"}]',1,'2021-04-07 09:53:17','2021-04-07 09:53:17','9c0537af-f2de-4bfb-9684-e5563ea116a2'),(82,22,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"bd1a9dd9-c492-4932-ad06-98c72a16cfd8\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"3fb11a52-50bf-49c5-a8dd-c2ee482358ee\"}]',1,'2021-04-07 09:53:17','2021-04-07 09:53:17','34f4a306-cc8c-4ed2-9e2f-a80c58982519'),(93,4,'Main Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"1d1c9f28-39de-4df6-b077-856d16c001ca\"}]',1,'2021-04-07 09:54:03','2021-04-07 09:54:03','79ddf88c-a74e-412e-8c77-47b9d25c88f8'),(94,4,'Settings','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"336f207f-f4fb-43c3-bbc3-f10b641e940a\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"6c4a2320-184d-4f3b-9482-070fc8b8194a\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"bb3731df-a01f-4725-9f8b-06d99359fd9f\"}]',2,'2021-04-07 09:54:03','2021-04-07 09:54:03','495d4d40-0dd4-4735-accb-cbb99b899837'),(95,5,'Main Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"0ffba24e-268b-4f2c-a3f2-ad976b64c979\"}]',1,'2021-04-07 09:54:03','2021-04-07 09:54:03','951502c4-088f-463f-afd4-3ce288abc5cc'),(96,5,'Settings','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"336f207f-f4fb-43c3-bbc3-f10b641e940a\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"6c4a2320-184d-4f3b-9482-070fc8b8194a\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"bb3731df-a01f-4725-9f8b-06d99359fd9f\"}]',2,'2021-04-07 09:54:03','2021-04-07 09:54:03','6f126b5c-c11c-4927-ac01-893e2934589b'),(97,15,'Main Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"2f64efd3-101a-4ed1-a31e-96657d6dc6e5\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"181f8d87-6d88-42ed-96e8-26a3a728eef8\"}]',1,'2021-04-07 09:54:03','2021-04-07 09:54:03','6dfbe89b-4350-4aeb-b372-c26e54b919a3'),(98,15,'Settings','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"336f207f-f4fb-43c3-bbc3-f10b641e940a\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"6c4a2320-184d-4f3b-9482-070fc8b8194a\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"bb3731df-a01f-4725-9f8b-06d99359fd9f\"}]',2,'2021-04-07 09:54:03','2021-04-07 09:54:03','85d1fd75-2b9a-44f5-bb02-c34faafe858c'),(99,16,'Main Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"2f64efd3-101a-4ed1-a31e-96657d6dc6e5\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"4b0ce80c-181f-4c40-bcce-5146dc8c903e\"}]',1,'2021-04-07 09:54:03','2021-04-07 09:54:03','ef5eb2bd-63cf-490a-a682-6edf203fba0a'),(100,16,'Settings','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"336f207f-f4fb-43c3-bbc3-f10b641e940a\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"6c4a2320-184d-4f3b-9482-070fc8b8194a\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"bb3731df-a01f-4725-9f8b-06d99359fd9f\"}]',2,'2021-04-07 09:54:03','2021-04-07 09:54:03','0474e874-d2be-4482-85b6-8e643fb102c5'),(101,18,'Main Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"2f64efd3-101a-4ed1-a31e-96657d6dc6e5\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"b2c6e66f-5fcd-4220-b710-2624b1ef531d\"}]',1,'2021-04-07 09:54:03','2021-04-07 09:54:03','166e5bd2-5293-4192-9c68-873a4d4e8c65'),(102,18,'Settings','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"bb3731df-a01f-4725-9f8b-06d99359fd9f\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"6c4a2320-184d-4f3b-9482-070fc8b8194a\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"336f207f-f4fb-43c3-bbc3-f10b641e940a\"}]',2,'2021-04-07 09:54:03','2021-04-07 09:54:03','bec0ad5c-b41f-42d7-8874-017e8e518965'),(103,23,'Main Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"ae523ce4-60b9-4674-8ed4-cbfa6ff0c20c\"}]',1,'2021-04-07 09:54:03','2021-04-07 09:54:03','4d1486f9-515f-4a30-bb24-ce215ddb5616'),(104,23,'Settings','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"336f207f-f4fb-43c3-bbc3-f10b641e940a\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"6c4a2320-184d-4f3b-9482-070fc8b8194a\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"bb3731df-a01f-4725-9f8b-06d99359fd9f\"}]',2,'2021-04-07 09:54:03','2021-04-07 09:54:03','ea76051c-3e2c-433a-8337-e48bc5385d2a');
/*!40000 ALTER TABLE `fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fields` VALUES (1,2,'Address','address','global','',0,'none',NULL,'craft\\redactor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"cleanupHtml\":true,\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"\",\"removeEmptyTags\":\"1\",\"removeInlineStyles\":\"1\",\"removeNbsp\":\"1\",\"showHtmlButtonForNonAdmins\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"enlarged\"}','2021-03-30 09:28:49','2021-03-30 09:28:49','4af3caf9-e4e3-4acd-90f8-1e8cd585e497'),(2,2,'Email','email','global','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2021-03-30 09:28:55','2021-03-30 09:28:55','3cca813e-09a9-4025-8efa-d5ba11d4dd89'),(3,2,'Phone Number','phoneNumber','global','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2021-03-30 09:29:03','2021-03-30 09:29:03','386e1cf1-acc9-4336-90e1-fb74daefd6f5'),(4,2,'Social Profiles','socialProfiles','global','',0,'site',NULL,'verbb\\supertable\\fields\\SuperTableField','{\"columns\":{\"f63d3738-c5aa-4de0-84fd-0deb6570d894\":{\"width\":\"\"},\"3037eaf7-b2d6-4e6f-b616-b9911cf6f5c2\":{\"width\":\"\"},\"0b7ca9a0-694c-4733-bfee-d1c56b3aa669\":{\"width\":\"\"},\"d960a7c1-c036-40d9-b547-47325ed6c97b\":{\"width\":\"\"}},\"contentTable\":\"{{%stc_socialprofiles}}\",\"fieldLayout\":\"table\",\"maxRows\":\"\",\"minRows\":\"\",\"placeholderKey\":null,\"propagationMethod\":\"all\",\"selectionLabel\":\"\",\"staticField\":\"\"}','2021-03-30 09:30:23','2021-03-30 09:30:23','13d35453-527a-4094-b642-42292f193f8c'),(5,NULL,'Name','socialName','superTableBlockType:dfd34224-0241-4c43-aec4-0c7abd7e9dab','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2021-03-30 09:30:23','2021-03-30 09:30:23','1f6a1dc8-82d8-47a8-ae54-01af20652730'),(6,NULL,'Link','socialLink','superTableBlockType:dfd34224-0241-4c43-aec4-0c7abd7e9dab','',0,'none',NULL,'craft\\fields\\Url','{\"maxLength\":\"255\",\"placeholder\":null,\"types\":[\"url\"]}','2021-03-30 09:30:23','2021-03-30 09:30:23','5cd6ad16-cb88-45ba-b275-1558f8f27c05'),(7,NULL,'Icon','socialIcon','superTableBlockType:dfd34224-0241-4c43-aec4-0c7abd7e9dab','',0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowUploads\":true,\"allowedKinds\":null,\"defaultUploadLocationSource\":\"\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"\",\"localizeRelations\":false,\"previewMode\":\"full\",\"restrictFiles\":\"\",\"selectionLabel\":\"\",\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"useSingleFolder\":false,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2021-03-30 09:30:23','2021-03-30 09:30:23','a596aec7-c8ec-49d7-ab4d-97dcdf5ac990'),(8,NULL,'Alt Icon','altSocialIcon','superTableBlockType:dfd34224-0241-4c43-aec4-0c7abd7e9dab','',0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowUploads\":true,\"allowedKinds\":null,\"defaultUploadLocationSource\":\"\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"\",\"localizeRelations\":false,\"previewMode\":\"full\",\"restrictFiles\":\"\",\"selectionLabel\":\"\",\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"useSingleFolder\":false,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2021-03-30 09:30:23','2021-03-30 09:30:23','d9aafe6e-671c-45da-9958-ccb6470336d6'),(9,3,'Background Color','backgroundColor','global','',0,'none',NULL,'supercool\\buttonbox\\fields\\Colours','{\"options\":[{\"label\":\"White\",\"value\":\"bg-white\",\"cssColour\":\"#FFFFFF\",\"default\":\"1\"},{\"label\":\"Black\",\"value\":\"bg-black\",\"cssColour\":\"#000000\",\"default\":\"\"}]}','2021-03-30 09:32:36','2021-03-30 09:32:36','336f207f-f4fb-43c3-bbc3-f10b641e940a'),(10,3,'Top Spacing','topSpacing','global','',0,'none',NULL,'supercool\\buttonbox\\fields\\Buttons','{\"displayAsGraphic\":\"\",\"displayFullwidth\":\"\",\"options\":[{\"label\":\"None\",\"showLabel\":\"1\",\"value\":\"pt-default\",\"imageUrl\":\"\",\"default\":\"1\"},{\"label\":\"Normal\",\"showLabel\":\"1\",\"value\":\"pt-lg-3 pt-md-3 pt-3\",\"imageUrl\":\"\",\"default\":\"\"},{\"label\":\"Large\",\"showLabel\":\"1\",\"value\":\"pt-lg-5 pt-md-5 pt-4\",\"imageUrl\":\"\",\"default\":\"\"}]}','2021-03-30 09:34:19','2021-03-30 09:34:19','bb3731df-a01f-4725-9f8b-06d99359fd9f'),(11,3,'Bottom Spacing','bottomSpacing','global','',0,'none',NULL,'supercool\\buttonbox\\fields\\Buttons','{\"displayAsGraphic\":\"\",\"displayFullwidth\":\"\",\"options\":[{\"label\":\"None\",\"showLabel\":\"1\",\"value\":\"pb-default\",\"imageUrl\":\"\",\"default\":\"1\"},{\"label\":\"Normal\",\"showLabel\":\"1\",\"value\":\"pb-lg-3 pb-md-3 pb-3\",\"imageUrl\":\"\",\"default\":\"\"},{\"label\":\"Larger\",\"showLabel\":\"1\",\"value\":\"pb-lg-5 pb-md-5 pb-4\",\"imageUrl\":\"\",\"default\":\"\"}]}','2021-03-30 09:35:14','2021-03-30 09:35:14','6c4a2320-184d-4f3b-9482-070fc8b8194a'),(12,4,'SEO','seo','global','',0,'none',NULL,'ether\\seo\\fields\\SeoField','{\"description\":\"\",\"hideSocial\":\"\",\"robots\":[\"\",\"\",\"\",\"\",\"\",\"\"],\"socialImage\":null,\"suffixAsPrefix\":null,\"title\":[{\"key\":\"1\",\"locked\":\"0\",\"template\":\"{title}\"},{\"key\":\"2\",\"locked\":\"1\",\"template\":\" - {{ siteName }}\"}],\"titleSuffix\":null}','2021-03-30 09:36:22','2021-03-30 09:36:35','7c5c4db7-bc5e-4979-a31b-6b7734989556'),(13,5,'Page Summary','pageSummary','global','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2021-03-30 09:37:24','2021-03-30 09:37:24','39237593-ff51-4bd3-851a-a9dfac329c0b'),(14,5,'Summary Image','summaryImage','global','',0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowUploads\":true,\"allowedKinds\":[\"image\"],\"defaultUploadLocationSource\":\"volume:27b00051-5d7e-4c72-8d4c-37eb325f3071\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"1\",\"localizeRelations\":false,\"previewMode\":\"full\",\"restrictFiles\":\"1\",\"selectionLabel\":\"\",\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:27b00051-5d7e-4c72-8d4c-37eb325f3071\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"useSingleFolder\":false,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2021-03-30 09:37:44','2021-03-30 11:47:13','4184d945-e90d-4433-b1f3-727edf65107e'),(15,7,'Copy','copy','global','',0,'none',NULL,'craft\\redactor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"cleanupHtml\":true,\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"\",\"removeEmptyTags\":\"1\",\"removeInlineStyles\":\"1\",\"removeNbsp\":\"1\",\"showHtmlButtonForNonAdmins\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"enlarged\"}','2021-03-30 09:39:25','2021-03-30 09:39:25','1d1c9f28-39de-4df6-b077-856d16c001ca'),(16,7,'Image','image','global','',0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowUploads\":true,\"allowedKinds\":[\"image\"],\"defaultUploadLocationSource\":\"volume:27b00051-5d7e-4c72-8d4c-37eb325f3071\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"1\",\"localizeRelations\":false,\"previewMode\":\"full\",\"restrictFiles\":\"1\",\"selectionLabel\":\"\",\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:27b00051-5d7e-4c72-8d4c-37eb325f3071\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"useSingleFolder\":false,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2021-03-30 09:39:45','2021-03-30 11:46:15','0ffba24e-268b-4f2c-a3f2-ad976b64c979'),(17,6,'Content Builder','contentBuilder','global','',0,'site',NULL,'benf\\neo\\Field','{\"maxBlocks\":\"\",\"maxLevels\":\"\",\"maxTopBlocks\":\"\",\"minBlocks\":\"\",\"propagationMethod\":\"all\",\"wasModified\":true}','2021-03-30 09:41:28','2021-04-07 09:54:03','1d1d5665-5674-4388-8d46-9b87e4dc65d3'),(18,6,'Page Header','pageHeader','global','',0,'site',NULL,'benf\\neo\\Field','{\"maxBlocks\":\"1\",\"maxLevels\":\"\",\"maxTopBlocks\":\"\",\"minBlocks\":\"\",\"propagationMethod\":\"all\",\"wasModified\":false}','2021-03-30 09:42:27','2021-03-30 10:34:23','d783368e-a494-4457-9e99-5a027ae72a18'),(19,7,'Header','header','global','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2021-03-30 09:42:34','2021-03-30 09:42:34','2f64efd3-101a-4ed1-a31e-96657d6dc6e5'),(20,7,'Background Image','backgroundImage','global','',0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowUploads\":true,\"allowedKinds\":[\"image\"],\"defaultUploadLocationSource\":\"volume:27b00051-5d7e-4c72-8d4c-37eb325f3071\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"1\",\"localizeRelations\":false,\"previewMode\":\"full\",\"restrictFiles\":\"1\",\"selectionLabel\":\"\",\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:27b00051-5d7e-4c72-8d4c-37eb325f3071\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"useSingleFolder\":false,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2021-03-30 09:42:53','2021-03-30 11:46:52','4870444e-6820-4ab0-a141-99e310305629'),(21,2,'Google Analytics','googleAnalytics','global','',0,'none',NULL,'craft\\redactor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"cleanupHtml\":true,\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"\",\"removeEmptyTags\":\"1\",\"removeInlineStyles\":\"1\",\"removeNbsp\":\"1\",\"showHtmlButtonForNonAdmins\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"enlarged\"}','2021-03-30 13:13:11','2021-03-30 13:15:33','3f092924-7454-4778-a975-9d6112f3eb20'),(22,7,'Images','images','global','',0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowUploads\":true,\"allowedKinds\":[\"image\"],\"defaultUploadLocationSource\":\"\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"\",\"localizeRelations\":false,\"previewMode\":\"full\",\"restrictFiles\":\"1\",\"selectionLabel\":\"\",\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"useSingleFolder\":false,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2021-04-06 16:07:31','2021-04-06 16:07:31','181f8d87-6d88-42ed-96e8-26a3a728eef8'),(23,7,'Video','video','global','Please choose only one of the following: External Video or Asset Video.',0,'site',NULL,'craft\\fields\\Matrix','{\"contentTable\":\"{{%matrixcontent_video}}\",\"maxBlocks\":\"1\",\"minBlocks\":\"\",\"propagationMethod\":\"all\"}','2021-04-07 08:23:01','2021-04-07 09:27:06','4b0ce80c-181f-4c40-bcce-5146dc8c903e'),(24,7,'Accordion Matrix','accordionMatrix','global','',0,'site',NULL,'craft\\fields\\Matrix','{\"contentTable\":\"{{%matrixcontent_accordionmatrix}}\",\"maxBlocks\":\"\",\"minBlocks\":\"\",\"propagationMethod\":\"all\"}','2021-04-07 08:48:55','2021-04-07 08:48:55','b2c6e66f-5fcd-4220-b710-2624b1ef531d'),(25,NULL,'Question','question','matrixBlockType:80190ffa-9de6-4824-befb-1c21b98c9752','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2021-04-07 08:48:55','2021-04-07 08:48:55','6bc4604d-7a4d-4a0c-ad53-c3a6adc1a6e8'),(26,NULL,'Answer','answer','matrixBlockType:80190ffa-9de6-4824-befb-1c21b98c9752','',0,'none',NULL,'craft\\redactor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"cleanupHtml\":true,\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"\",\"removeEmptyTags\":\"1\",\"removeInlineStyles\":\"1\",\"removeNbsp\":\"1\",\"showHtmlButtonForNonAdmins\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"enlarged\"}','2021-04-07 08:48:55','2021-04-07 08:48:55','f85e63c0-1f6c-495c-95b7-6b70d338bd07'),(27,NULL,'Video','video','matrixBlockType:ead943da-9146-4b32-9f33-8096b522e085','Enter the URL of the video.',0,'none',NULL,'wrav\\oembed\\fields\\OembedField','{\"url\":\"\"}','2021-04-07 09:27:06','2021-04-07 09:27:06','7d034fae-78a0-49b6-a213-aa01fcdf690e'),(28,NULL,'Video','video','matrixBlockType:49b4d1ac-0f61-42c6-a482-63eefaa8933e','',0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowUploads\":true,\"allowedKinds\":[\"video\"],\"defaultUploadLocationSource\":\"\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"1\",\"localizeRelations\":false,\"previewMode\":\"full\",\"restrictFiles\":\"1\",\"selectionLabel\":\"\",\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"useSingleFolder\":false,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2021-04-07 09:27:06','2021-04-07 09:27:06','588b4c33-d66a-429a-a796-a6146b14a0f8'),(29,7,'Button','button','global','',0,'site',NULL,'craft\\fields\\Matrix','{\"contentTable\":\"{{%matrixcontent_button}}\",\"maxBlocks\":\"\",\"minBlocks\":\"\",\"propagationMethod\":\"all\"}','2021-04-07 09:53:17','2021-04-07 09:53:17','ae523ce4-60b9-4674-8ed4-cbfa6ff0c20c'),(30,NULL,'Button Title','buttonTitle','matrixBlockType:d563f248-37de-412a-b0ad-eea19da5e0f9','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2021-04-07 09:53:17','2021-04-07 09:53:17','3e5005f5-763a-459a-9bb7-74b2de70f748'),(31,NULL,'Button Link','buttonLink','matrixBlockType:d563f248-37de-412a-b0ad-eea19da5e0f9','Choose an entry.',0,'site',NULL,'craft\\fields\\Entries','{\"allowSelfRelations\":false,\"limit\":\"1\",\"localizeRelations\":false,\"selectionLabel\":\"\",\"showSiteMenu\":false,\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"validateRelatedElements\":false,\"viewMode\":null}','2021-04-07 09:53:17','2021-04-07 09:53:17','d54ca455-7ff5-451f-98e4-350b3abb1847'),(32,NULL,'Button Link','buttonLink','matrixBlockType:3d768a6c-7660-4551-8c77-a987ed1dfb44','Enter a valid URL starting with - http://, https://, mailto:, tel:, ... ',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2021-04-07 09:53:17','2021-04-07 09:53:17','3fb11a52-50bf-49c5-a8dd-c2ee482358ee'),(33,NULL,'Button Title','buttonTitle','matrixBlockType:3d768a6c-7660-4551-8c77-a987ed1dfb44','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2021-04-07 09:53:17','2021-04-07 09:53:17','bd1a9dd9-c492-4932-ad06-98c72a16cfd8');
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `freeform_crm_fields`
--

LOCK TABLES `freeform_crm_fields` WRITE;
/*!40000 ALTER TABLE `freeform_crm_fields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `freeform_crm_fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `freeform_export_profiles`
--

LOCK TABLES `freeform_export_profiles` WRITE;
/*!40000 ALTER TABLE `freeform_export_profiles` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `freeform_export_profiles` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `freeform_export_settings`
--

LOCK TABLES `freeform_export_settings` WRITE;
/*!40000 ALTER TABLE `freeform_export_settings` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `freeform_export_settings` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `freeform_feed_messages`
--

LOCK TABLES `freeform_feed_messages` WRITE;
/*!40000 ALTER TABLE `freeform_feed_messages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `freeform_feed_messages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `freeform_feeds`
--

LOCK TABLES `freeform_feeds` WRITE;
/*!40000 ALTER TABLE `freeform_feeds` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `freeform_feeds` VALUES (1,'f0c92527-abde-4656-bba0-c0e01b277f92','3.0.0','3.99.999','2021-03-31 19:51:00','2021-04-06 08:30:44','2021-04-06 08:30:44','034c0614-8044-47b8-baf0-9f1f87a644f7');
/*!40000 ALTER TABLE `freeform_feeds` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `freeform_fields`
--

LOCK TABLES `freeform_fields` WRITE;
/*!40000 ALTER TABLE `freeform_fields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `freeform_fields` VALUES (1,'text','firstName','First Name',0,NULL,NULL,'2021-03-30 13:30:12','2021-03-30 13:30:12','559f785f-95b7-4e96-9e28-b6ad8b8e05de'),(2,'text','lastName','Last Name',0,NULL,NULL,'2021-03-30 13:30:12','2021-03-30 13:30:12','b485f678-acd7-4507-a422-245eb88dac42'),(3,'email','email','Email',0,NULL,NULL,'2021-03-30 13:30:12','2021-03-30 13:30:12','b3994fa8-4546-4a0b-ba78-67d003da3644'),(4,'text','website','Website',0,NULL,NULL,'2021-03-30 13:30:12','2021-03-30 13:30:12','4875cfd5-9c66-4743-b450-29251b94c8b1'),(5,'text','cellPhone','Cell Phone',0,NULL,NULL,'2021-03-30 13:30:12','2021-03-30 13:30:12','0116d3a0-6d80-4e97-8d54-022253938c72'),(6,'text','homePhone','Home Phone',0,NULL,NULL,'2021-03-30 13:30:12','2021-03-30 13:30:12','05c0574b-cd7f-4224-a1cd-00c10cb5dcf5'),(7,'text','companyName','Company Name',0,NULL,NULL,'2021-03-30 13:30:12','2021-03-30 13:30:12','fe86ddc4-0a34-4176-b435-565bf481f896'),(8,'textarea','address','Address',0,NULL,'{\"rows\":2}','2021-03-30 13:30:12','2021-03-30 13:30:12','a57fdfe4-129a-426f-9100-6fe0ca8dbc33'),(9,'text','city','City',0,NULL,NULL,'2021-03-30 13:30:12','2021-03-30 13:30:12','d9667cad-bb5e-4b2f-9de3-157c8c51eff1'),(10,'select','state','State',0,NULL,'{\"options\":[{\"value\":\"\",\"label\":\"Select a State\"},{\"value\":\"AL\",\"label\":\"Alabama\"},{\"value\":\"AK\",\"label\":\"Alaska\"},{\"value\":\"AZ\",\"label\":\"Arizona\"},{\"value\":\"AR\",\"label\":\"Arkansas\"},{\"value\":\"CA\",\"label\":\"California\"},{\"value\":\"CO\",\"label\":\"Colorado\"},{\"value\":\"CT\",\"label\":\"Connecticut\"},{\"value\":\"DE\",\"label\":\"Delaware\"},{\"value\":\"DC\",\"label\":\"District of Columbia\"},{\"value\":\"FL\",\"label\":\"Florida\"},{\"value\":\"GA\",\"label\":\"Georgia\"},{\"value\":\"HI\",\"label\":\"Hawaii\"},{\"value\":\"ID\",\"label\":\"Idaho\"},{\"value\":\"IL\",\"label\":\"Illinois\"},{\"value\":\"IN\",\"label\":\"Indiana\"},{\"value\":\"IA\",\"label\":\"Iowa\"},{\"value\":\"KS\",\"label\":\"Kansas\"},{\"value\":\"KY\",\"label\":\"Kentucky\"},{\"value\":\"LA\",\"label\":\"Louisiana\"},{\"value\":\"ME\",\"label\":\"Maine\"},{\"value\":\"MD\",\"label\":\"Maryland\"},{\"value\":\"MA\",\"label\":\"Massachusetts\"},{\"value\":\"MI\",\"label\":\"Michigan\"},{\"value\":\"MN\",\"label\":\"Minnesota\"},{\"value\":\"MS\",\"label\":\"Mississippi\"},{\"value\":\"MO\",\"label\":\"Missouri\"},{\"value\":\"MT\",\"label\":\"Montana\"},{\"value\":\"NE\",\"label\":\"Nebraska\"},{\"value\":\"NV\",\"label\":\"Nevada\"},{\"value\":\"NH\",\"label\":\"New Hampshire\"},{\"value\":\"NJ\",\"label\":\"New Jersey\"},{\"value\":\"NM\",\"label\":\"New Mexico\"},{\"value\":\"NY\",\"label\":\"New York\"},{\"value\":\"NC\",\"label\":\"North Carolina\"},{\"value\":\"ND\",\"label\":\"North Dakota\"},{\"value\":\"OH\",\"label\":\"Ohio\"},{\"value\":\"OK\",\"label\":\"Oklahoma\"},{\"value\":\"OR\",\"label\":\"Oregon\"},{\"value\":\"PA\",\"label\":\"Pennsylvania\"},{\"value\":\"RI\",\"label\":\"Rhode Island\"},{\"value\":\"SC\",\"label\":\"South Carolina\"},{\"value\":\"SD\",\"label\":\"South Dakota\"},{\"value\":\"TN\",\"label\":\"Tennessee\"},{\"value\":\"TX\",\"label\":\"Texas\"},{\"value\":\"UT\",\"label\":\"Utah\"},{\"value\":\"VT\",\"label\":\"Vermont\"},{\"value\":\"VA\",\"label\":\"Virginia\"},{\"value\":\"WA\",\"label\":\"Washington\"},{\"value\":\"WV\",\"label\":\"West Virginia\"},{\"value\":\"WI\",\"label\":\"Wisconsin\"},{\"value\":\"WY\",\"label\":\"Wyoming\"}]}','2021-03-30 13:30:12','2021-03-30 13:30:12','ee8dcd88-3cfc-4cc4-bd86-26bf341836ef'),(11,'text','zipCode','Zip Code',0,NULL,NULL,'2021-03-30 13:30:12','2021-03-30 13:30:12','3462f95f-3ed0-479f-a005-3e1ac3bad762'),(12,'textarea','message','Message',0,NULL,'{\"rows\":5}','2021-03-30 13:30:12','2021-03-30 13:30:12','bc4c88a1-a7d3-4011-99e9-49ac050b630b'),(13,'number','number','Number',0,NULL,NULL,'2021-03-30 13:30:12','2021-03-30 13:30:12','1f45c389-ceb9-4620-bdef-889c4a445290'),(14,'cc_details','payment','',0,NULL,NULL,'2021-03-30 13:30:12','2021-03-30 13:30:12','112aa978-7c32-4b64-9379-30bb87b32e53');
/*!40000 ALTER TABLE `freeform_fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `freeform_forms`
--

LOCK TABLES `freeform_forms` WRITE;
/*!40000 ALTER TABLE `freeform_forms` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `freeform_forms` VALUES (1,'Contact Form','contactForm',0,'{{ dateCreated|date(\"Y-m-d H:i:s\") }}','','{\"composer\":{\"layout\":[[{\"id\":\"QmDyWGKM8\",\"columns\":[\"8oWe9jZpP\"]},{\"id\":\"8P8QrYV16\",\"columns\":[\"5KM0OK02p\"]},{\"id\":\"RDPV1Xoqw\",\"columns\":[\"d1EeG8Z68\"]},{\"id\":\"yRWxzDOn1\",\"columns\":[\"QBOZ7q06y\"]},{\"id\":\"K965wBW82\",\"columns\":[\"3q6kYGWDb\"]}]],\"properties\":{\"page0\":{\"type\":\"page\",\"label\":\"Page 1\"},\"form\":{\"type\":\"form\",\"name\":\"Contact Form\",\"handle\":\"contactForm\",\"color\":\"#a4e8cb\",\"submissionTitleFormat\":\"{{ dateCreated|date(\\\"Y-m-d H:i:s\\\") }}\",\"description\":\"\",\"formTemplate\":\"flexbox.html\",\"returnUrl\":\"\",\"storeData\":true,\"defaultStatus\":2,\"ajaxEnabled\":true},\"validation\":{\"type\":\"validation\",\"validationType\":\"submit\",\"successMessage\":\"\",\"errorMessage\":\"\"},\"integration\":{\"type\":\"integration\",\"integrationId\":0,\"mapping\":[]},\"connections\":{\"type\":\"connections\",\"list\":null},\"rules\":{\"type\":\"rules\",\"list\":[]},\"admin_notifications\":{\"type\":\"admin_notifications\",\"notificationId\":0,\"recipients\":\"\"},\"payment\":{\"type\":\"payment\",\"integrationId\":0,\"mapping\":[]},\"8oWe9jZpP\":{\"hash\":\"8oWe9jZpP\",\"id\":1,\"type\":\"text\",\"handle\":\"firstName\",\"label\":\"First Name\",\"required\":true,\"instructions\":\"\",\"value\":\"\",\"placeholder\":\"\"},\"5KM0OK02p\":{\"hash\":\"5KM0OK02p\",\"id\":2,\"type\":\"text\",\"handle\":\"lastName\",\"label\":\"Last Name\",\"required\":true,\"instructions\":\"\",\"value\":\"\",\"placeholder\":\"\"},\"QBOZ7q06y\":{\"hash\":\"QBOZ7q06y\",\"id\":12,\"type\":\"textarea\",\"handle\":\"message\",\"label\":\"Message\",\"required\":true,\"instructions\":\"\",\"value\":\"\",\"placeholder\":\"\",\"rows\":5},\"3q6kYGWDb\":{\"type\":\"submit\",\"label\":\"Submit\",\"labelNext\":\"Submit\",\"labelPrev\":\"Previous\",\"disablePrev\":false,\"position\":\"left\"},\"d1EeG8Z68\":{\"hash\":\"d1EeG8Z68\",\"id\":3,\"type\":\"email\",\"handle\":\"email\",\"label\":\"Email\",\"required\":true,\"instructions\":\"\",\"notificationId\":0,\"values\":[],\"placeholder\":\"\"}}},\"context\":{\"page\":0,\"hash\":\"QBOZ7q06y\"}}','',2,NULL,'#a4e8cb',NULL,NULL,'','',1,0,'','','2021-04-06 15:55:39','2021-04-06 15:59:28','675a761b-b90a-47a6-acfa-d80ace6de571');
/*!40000 ALTER TABLE `freeform_forms` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `freeform_integrations`
--

LOCK TABLES `freeform_integrations` WRITE;
/*!40000 ALTER TABLE `freeform_integrations` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `freeform_integrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `freeform_integrations_queue`
--

LOCK TABLES `freeform_integrations_queue` WRITE;
/*!40000 ALTER TABLE `freeform_integrations_queue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `freeform_integrations_queue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `freeform_lock`
--

LOCK TABLES `freeform_lock` WRITE;
/*!40000 ALTER TABLE `freeform_lock` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `freeform_lock` VALUES (6,'freeform-purge-cache-key','2021-03-31 11:20:39','2021-03-31 11:20:39','34bf09fb-ea0a-438f-b6cb-2a413cf873ce'),(7,'freeform-feed-cache-key','2021-03-31 11:20:39','2021-03-31 11:20:39','c8aade72-7ff2-4158-94aa-6a9f159cacef'),(8,'freeform-digest-cache-key','2021-03-31 11:20:40','2021-03-31 11:20:40','d8132710-488d-4a78-a540-96aff700430c'),(9,'freeform-purge-cache-key','2021-03-31 12:21:03','2021-03-31 12:21:03','30230de7-7df5-4930-ab96-2859589bfecd'),(10,'freeform-purge-cache-key','2021-03-31 13:21:08','2021-03-31 13:21:08','d471cbe9-6cf9-40d6-b905-69db14b6e2f4'),(11,'freeform-purge-cache-key','2021-04-06 08:30:43','2021-04-06 08:30:43','69d9d6f6-5d4e-4c5a-9ce7-5a027c73c4e3'),(12,'freeform-feed-cache-key','2021-04-06 08:30:44','2021-04-06 08:30:44','94331f49-8743-4bc1-bdd6-fc52305daba0'),(13,'freeform-digest-cache-key','2021-04-06 08:30:45','2021-04-06 08:30:45','c078b55e-4dff-43bf-82f5-edbc7b74d2d9'),(14,'freeform-purge-cache-key','2021-04-06 09:34:59','2021-04-06 09:34:59','7a99ee06-c8db-45f6-a3de-aadd8e45e375'),(15,'freeform-purge-cache-key','2021-04-06 10:35:52','2021-04-06 10:35:52','7a37c201-365f-46b0-a590-97258828a85e'),(16,'freeform-purge-cache-key','2021-04-06 12:03:17','2021-04-06 12:03:17','25218876-5421-4784-80dd-ce0e266a7838'),(17,'freeform-digest-cache-key','2021-04-06 12:03:17','2021-04-06 12:03:17','e21ca27b-da21-431c-a6a9-8234396e8c2f'),(18,'freeform-purge-cache-key','2021-04-06 13:03:47','2021-04-06 13:03:47','dd7e06b4-0a62-49d1-a3e1-02ec6dc7fe14'),(19,'freeform-feed-cache-key','2021-04-06 13:30:54','2021-04-06 13:30:54','dfad7c40-2321-429e-b761-d37f5b290d9d'),(20,'freeform-purge-cache-key','2021-04-06 14:03:48','2021-04-06 14:03:48','2f11ed15-4d3b-4cca-bc46-14647f245f3c'),(21,'freeform-purge-cache-key','2021-04-06 15:04:09','2021-04-06 15:04:09','2c0c42de-c466-4d2b-85ce-f4716d33cc81'),(22,'freeform-digest-cache-key','2021-04-06 15:04:09','2021-04-06 15:04:09','3d946610-a8aa-4645-b7ee-0f6532b48a2c'),(23,'freeform-purge-cache-key','2021-04-06 16:04:47','2021-04-06 16:04:47','c0ce4b5a-120e-45bf-b0b6-b84a4cd4ecaf'),(24,'freeform-purge-cache-key','2021-04-06 17:04:50','2021-04-06 17:04:50','21bd5616-4874-4629-936f-ca7f16f327b0'),(25,'freeform-purge-cache-key','2021-04-07 08:13:26','2021-04-07 08:13:26','6fda2031-9b83-487f-8f31-0a1eccd05414'),(26,'freeform-feed-cache-key','2021-04-07 08:13:26','2021-04-07 08:13:26','b153817d-cebf-4c54-8cff-dadec13a7efc'),(27,'freeform-digest-cache-key','2021-04-07 08:13:27','2021-04-07 08:13:27','ce619b09-8aa2-4b70-bb0c-05b4bf0b6113'),(28,'freeform-purge-cache-key','2021-04-07 09:13:52','2021-04-07 09:13:52','69346098-a465-465e-936e-e92c25d1c187'),(29,'freeform-purge-cache-key','2021-04-07 10:13:52','2021-04-07 10:13:52','9143ffa1-0d25-43c5-9fef-32655480655a');
/*!40000 ALTER TABLE `freeform_lock` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `freeform_mailing_list_fields`
--

LOCK TABLES `freeform_mailing_list_fields` WRITE;
/*!40000 ALTER TABLE `freeform_mailing_list_fields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `freeform_mailing_list_fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `freeform_mailing_lists`
--

LOCK TABLES `freeform_mailing_lists` WRITE;
/*!40000 ALTER TABLE `freeform_mailing_lists` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `freeform_mailing_lists` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `freeform_notification_log`
--

LOCK TABLES `freeform_notification_log` WRITE;
/*!40000 ALTER TABLE `freeform_notification_log` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `freeform_notification_log` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `freeform_notifications`
--

LOCK TABLES `freeform_notifications` WRITE;
/*!40000 ALTER TABLE `freeform_notifications` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `freeform_notifications` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `freeform_payment_gateway_fields`
--

LOCK TABLES `freeform_payment_gateway_fields` WRITE;
/*!40000 ALTER TABLE `freeform_payment_gateway_fields` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `freeform_payment_gateway_fields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `freeform_payments_payments`
--

LOCK TABLES `freeform_payments_payments` WRITE;
/*!40000 ALTER TABLE `freeform_payments_payments` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `freeform_payments_payments` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `freeform_payments_subscription_plans`
--

LOCK TABLES `freeform_payments_subscription_plans` WRITE;
/*!40000 ALTER TABLE `freeform_payments_subscription_plans` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `freeform_payments_subscription_plans` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `freeform_payments_subscriptions`
--

LOCK TABLES `freeform_payments_subscriptions` WRITE;
/*!40000 ALTER TABLE `freeform_payments_subscriptions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `freeform_payments_subscriptions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `freeform_spam_reason`
--

LOCK TABLES `freeform_spam_reason` WRITE;
/*!40000 ALTER TABLE `freeform_spam_reason` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `freeform_spam_reason` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `freeform_statuses`
--

LOCK TABLES `freeform_statuses` WRITE;
/*!40000 ALTER TABLE `freeform_statuses` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `freeform_statuses` VALUES (1,'Pending','pending','light',NULL,1,'2021-03-30 13:30:12','2021-03-30 13:30:12','ab4792e5-bb40-4187-862d-d23e1b689ad2'),(2,'Open','open','green',1,2,'2021-03-30 13:30:12','2021-03-30 13:30:12','58b9f4d1-e089-422c-a462-49860a9f66cb'),(3,'Closed','closed','grey',NULL,3,'2021-03-30 13:30:12','2021-03-30 13:30:12','01164a2d-43f5-43db-9710-7222362dfdde');
/*!40000 ALTER TABLE `freeform_statuses` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `freeform_submission_notes`
--

LOCK TABLES `freeform_submission_notes` WRITE;
/*!40000 ALTER TABLE `freeform_submission_notes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `freeform_submission_notes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `freeform_submissions`
--

LOCK TABLES `freeform_submissions` WRITE;
/*!40000 ALTER TABLE `freeform_submissions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `freeform_submissions` VALUES (122,1,2,1,'5itBRR0HXGnvKBujeIEZMJgIrEvPfwLVG8QfplWx5HOEbljokf60T9yk0umL2YmRtiut3lKWzCdyzQrJ2ek3051H6tPVemYT5mIi','::1',0,'2021-04-06 15:56:28','2021-04-06 15:56:28','f64bd2d5-edd4-4b7f-bd60-ea24e797686f','Andrej','Szalma',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'asdad',NULL,NULL),(123,2,2,1,'ZMCpdL3wopv5RyvKBm8JtPMAphaqbmtiLEVGyVSJIMJYKixPOE1A6Q74UGbGKsj2TO4mmBm7NJvZAlyaIjGEwrTeeHVJ0fSmenSE','::1',0,'2021-04-06 15:58:40','2021-04-06 15:58:40','ad69844e-8672-41f7-9891-5d7c76c9e947','a','a',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'a',NULL,NULL),(124,3,2,1,'AlSnhNKMYZRT3okPUVTi8NF95LFhajFwVQNFzkl84H89zCiQJ3bSEcCvBkkCfKEUbW4aOIi42rekgoYMN7nECKwmeqUkJwCcMNQa','::1',0,'2021-04-06 15:59:01','2021-04-06 15:59:01','d80f059b-ab6d-44c9-bfc8-deb7f445dd38','','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL);
/*!40000 ALTER TABLE `freeform_submissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `freeform_unfinalized_files`
--

LOCK TABLES `freeform_unfinalized_files` WRITE;
/*!40000 ALTER TABLE `freeform_unfinalized_files` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `freeform_unfinalized_files` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `freeform_webhooks`
--

LOCK TABLES `freeform_webhooks` WRITE;
/*!40000 ALTER TABLE `freeform_webhooks` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `freeform_webhooks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `freeform_webhooks_form_relations`
--

LOCK TABLES `freeform_webhooks_form_relations` WRITE;
/*!40000 ALTER TABLE `freeform_webhooks_form_relations` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `freeform_webhooks_form_relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `globalsets`
--

LOCK TABLES `globalsets` WRITE;
/*!40000 ALTER TABLE `globalsets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `globalsets` VALUES (2,'Company Info','companyInfo',2,'2021-03-30 09:31:09','2021-03-30 09:31:09','7fc480fa-d689-40a4-9f68-2e36e07830d5'),(45,'Site Info','siteInfo',10,'2021-03-30 13:16:05','2021-03-30 13:16:05','5d2dca76-1ede-413a-8adf-b4a756ed42ae');
/*!40000 ALTER TABLE `globalsets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqlschemas`
--

LOCK TABLES `gqlschemas` WRITE;
/*!40000 ALTER TABLE `gqlschemas` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gqlschemas` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `gqltokens`
--

LOCK TABLES `gqltokens` WRITE;
/*!40000 ALTER TABLE `gqltokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `gqltokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `info` VALUES (1,'3.6.11.2','3.6.7',0,'gjppbjutflxn','iddhhdcvjnpe','2021-03-30 09:20:10','2021-04-07 09:54:04','f9d6f73c-c7ae-43dc-83bd-61db41fe87d5');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocks`
--

LOCK TABLES `matrixblocks` WRITE;
/*!40000 ALTER TABLE `matrixblocks` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `matrixblocks` VALUES (139,138,24,1,1,NULL,'2021-04-07 08:54:20','2021-04-07 08:54:20','5cc5548c-808d-42b2-a512-7c718aaa81c5'),(140,138,24,1,2,NULL,'2021-04-07 08:54:20','2021-04-07 08:54:20','6fa9ae5e-61b0-40b2-9614-ff78e3ac8eb7'),(148,147,24,1,1,NULL,'2021-04-07 08:54:20','2021-04-07 08:54:20','8edaf91b-51f0-4d96-8baa-33c1a599d753'),(149,147,24,1,2,NULL,'2021-04-07 08:54:20','2021-04-07 08:54:20','2e464e95-7145-4233-a99e-475ccaffeb3b'),(150,138,24,1,3,NULL,'2021-04-07 09:24:33','2021-04-07 09:24:33','26035da6-5f03-4264-aa19-54127bf423e9'),(158,157,24,1,1,NULL,'2021-04-07 09:24:33','2021-04-07 09:24:33','8d3e2db1-9604-4f06-8ef8-3d506657787e'),(159,157,24,1,2,NULL,'2021-04-07 09:24:33','2021-04-07 09:24:33','977e92d0-bb3a-45e4-86b1-78b35655ed47'),(160,157,24,1,3,NULL,'2021-04-07 09:24:33','2021-04-07 09:24:33','ca5ad814-5abd-4f2a-94b8-2e347bdf231e'),(161,131,23,2,1,0,'2021-04-07 09:31:18','2021-04-07 09:31:18','cedacd7d-4192-4949-857e-e48741130690'),(168,167,23,2,1,NULL,'2021-04-07 09:31:18','2021-04-07 09:31:18','259481d5-60b5-4795-99bd-b4a3f5ecaca8'),(170,169,24,1,1,NULL,'2021-04-07 09:31:18','2021-04-07 09:31:18','e7b2cc52-d495-45e0-9e7d-49322bf6629a'),(171,169,24,1,2,NULL,'2021-04-07 09:31:18','2021-04-07 09:31:18','92c95507-de13-49c7-a744-88c8638192d1'),(172,169,24,1,3,NULL,'2021-04-07 09:31:18','2021-04-07 09:31:18','ed8d7796-975e-4511-91ab-2460cad6a7bc'),(173,131,23,3,1,NULL,'2021-04-07 09:42:14','2021-04-07 09:42:14','806f7dea-74dc-4be9-9b2e-59b3c2f05726'),(180,179,23,3,1,NULL,'2021-04-07 09:42:14','2021-04-07 09:42:14','423dc31a-c919-4866-9bd9-8f802ad0a468'),(182,181,24,1,1,NULL,'2021-04-07 09:42:14','2021-04-07 09:42:14','a5575d65-e5b6-4fe0-89ac-2f04cbba26ff'),(183,181,24,1,2,NULL,'2021-04-07 09:42:14','2021-04-07 09:42:14','efc56f29-cdee-47d8-8d8f-455c9b927794'),(184,181,24,1,3,NULL,'2021-04-07 09:42:14','2021-04-07 09:42:14','3f69c245-6412-45ae-b004-83088d91e6ec'),(186,185,29,4,1,NULL,'2021-04-07 09:55:25','2021-04-07 09:55:25','7fc2f9a5-c5da-438c-b0e9-24abfe53c4a8'),(187,185,29,5,2,NULL,'2021-04-07 09:55:25','2021-04-07 09:55:25','3338286f-9f37-4c18-a3b7-8fa62cbbd697'),(192,191,29,4,1,NULL,'2021-04-07 09:55:25','2021-04-07 09:55:25','88bcbee1-befd-4d35-b538-eb44140c9225'),(193,191,29,5,2,NULL,'2021-04-07 09:55:25','2021-04-07 09:55:25','99229463-beac-4695-9279-56106cd2f330'),(197,196,23,3,1,NULL,'2021-04-07 09:55:25','2021-04-07 09:55:25','261b729e-57e0-48a1-9441-d58f57cec3f2'),(199,198,24,1,1,NULL,'2021-04-07 09:55:26','2021-04-07 09:55:26','4e368624-d7d2-40b2-a756-f9f44f1878fe'),(200,198,24,1,2,NULL,'2021-04-07 09:55:26','2021-04-07 09:55:26','09b05793-0c51-4742-b757-7955dbe46918'),(201,198,24,1,3,NULL,'2021-04-07 09:55:26','2021-04-07 09:55:26','4f5d5758-ed18-4591-96ac-dca0fcb12ace');
/*!40000 ALTER TABLE `matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocktypes`
--

LOCK TABLES `matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `matrixblocktypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `matrixblocktypes` VALUES (1,24,17,'Item','item',1,'2021-04-07 08:48:55','2021-04-07 08:48:55','80190ffa-9de6-4824-befb-1c21b98c9752'),(2,23,19,'External Video','externalVideo',1,'2021-04-07 09:27:06','2021-04-07 09:27:06','ead943da-9146-4b32-9f33-8096b522e085'),(3,23,20,'Asset Video','assetVideo',2,'2021-04-07 09:27:06','2021-04-07 09:27:06','49b4d1ac-0f61-42c6-a482-63eefaa8933e'),(4,29,21,'Internal Link','internalLink',1,'2021-04-07 09:53:17','2021-04-07 09:53:17','d563f248-37de-412a-b0ad-eea19da5e0f9'),(5,29,22,'External Link','externalLink',2,'2021-04-07 09:53:17','2021-04-07 09:53:17','3d768a6c-7660-4551-8c77-a987ed1dfb44');
/*!40000 ALTER TABLE `matrixblocktypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixcontent_accordionmatrix`
--

LOCK TABLES `matrixcontent_accordionmatrix` WRITE;
/*!40000 ALTER TABLE `matrixcontent_accordionmatrix` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `matrixcontent_accordionmatrix` VALUES (1,139,1,'2021-04-07 08:54:20','2021-04-07 09:24:33','55e5f222-00e7-4c45-bf63-1f0b6c0dcea7','Question 1','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac eros nibh. Aliquam erat volutpat. Aenean non sem sit amet massa efficitur pellentesque sit amet nec turpis. Maecenas ornare nibh id consequat vestibulum.</p>'),(2,140,1,'2021-04-07 08:54:20','2021-04-07 09:24:33','3e020c77-32e7-45d2-bc24-c1128a42fd00','Question 2','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac eros nibh. Aliquam erat volutpat. Aenean non sem sit amet massa efficitur pellentesque sit amet nec turpis. Maecenas ornare nibh id consequat vestibulum.</p>'),(3,148,1,'2021-04-07 08:54:20','2021-04-07 08:54:20','610dee5b-26e0-4855-956f-f303fb57c658','What\'s green when it flies and red when it dies?','<p>Watermelon.</p>'),(4,149,1,'2021-04-07 08:54:20','2021-04-07 08:54:20','5a0220d3-c515-47e0-81e2-6523581074ee','I can\'t come up with any more riddles.','<p>Nope, I really can\'t.</p>'),(5,150,1,'2021-04-07 09:24:33','2021-04-07 09:24:33','90267d23-793a-4822-b548-994e8df98b63','Question 3','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac eros nibh. Aliquam erat volutpat. Aenean non sem sit amet massa efficitur pellentesque sit amet nec turpis. Maecenas ornare nibh id consequat vestibulum.</p>'),(6,158,1,'2021-04-07 09:24:33','2021-04-07 09:24:33','19c48459-f0eb-4b9b-9dfd-42c44a61f3d8','Question 1','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac eros nibh. Aliquam erat volutpat. Aenean non sem sit amet massa efficitur pellentesque sit amet nec turpis. Maecenas ornare nibh id consequat vestibulum.</p>'),(7,159,1,'2021-04-07 09:24:33','2021-04-07 09:24:33','6c49b53c-64a4-4906-a036-264633ce7009','Question 2','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac eros nibh. Aliquam erat volutpat. Aenean non sem sit amet massa efficitur pellentesque sit amet nec turpis. Maecenas ornare nibh id consequat vestibulum.</p>'),(8,160,1,'2021-04-07 09:24:33','2021-04-07 09:24:33','9668714d-34d3-455c-9f10-c2c6bd071f09','Question 3','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac eros nibh. Aliquam erat volutpat. Aenean non sem sit amet massa efficitur pellentesque sit amet nec turpis. Maecenas ornare nibh id consequat vestibulum.</p>'),(9,170,1,'2021-04-07 09:31:18','2021-04-07 09:31:18','cffce84a-c53a-4fbb-8c6f-b7c01cc167fe','Question 1','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac eros nibh. Aliquam erat volutpat. Aenean non sem sit amet massa efficitur pellentesque sit amet nec turpis. Maecenas ornare nibh id consequat vestibulum.</p>'),(10,171,1,'2021-04-07 09:31:18','2021-04-07 09:31:18','342d89fc-580e-4fec-952a-3904a2257958','Question 2','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac eros nibh. Aliquam erat volutpat. Aenean non sem sit amet massa efficitur pellentesque sit amet nec turpis. Maecenas ornare nibh id consequat vestibulum.</p>'),(11,172,1,'2021-04-07 09:31:18','2021-04-07 09:31:18','9c0847cf-da0f-4ddf-9d7b-25534095edac','Question 3','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac eros nibh. Aliquam erat volutpat. Aenean non sem sit amet massa efficitur pellentesque sit amet nec turpis. Maecenas ornare nibh id consequat vestibulum.</p>'),(12,182,1,'2021-04-07 09:42:14','2021-04-07 09:42:14','7c4560aa-38cd-429c-9a9b-1efd9f2ef190','Question 1','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac eros nibh. Aliquam erat volutpat. Aenean non sem sit amet massa efficitur pellentesque sit amet nec turpis. Maecenas ornare nibh id consequat vestibulum.</p>'),(13,183,1,'2021-04-07 09:42:14','2021-04-07 09:42:14','acc759c6-e4be-4b84-882b-b80fc54bda2e','Question 2','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac eros nibh. Aliquam erat volutpat. Aenean non sem sit amet massa efficitur pellentesque sit amet nec turpis. Maecenas ornare nibh id consequat vestibulum.</p>'),(14,184,1,'2021-04-07 09:42:14','2021-04-07 09:42:14','793a4f42-f31a-46c7-8c86-27105c126340','Question 3','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac eros nibh. Aliquam erat volutpat. Aenean non sem sit amet massa efficitur pellentesque sit amet nec turpis. Maecenas ornare nibh id consequat vestibulum.</p>'),(15,199,1,'2021-04-07 09:55:26','2021-04-07 09:55:26','7665db78-8061-4e3b-b46b-06730f12fef6','Question 1','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac eros nibh. Aliquam erat volutpat. Aenean non sem sit amet massa efficitur pellentesque sit amet nec turpis. Maecenas ornare nibh id consequat vestibulum.</p>'),(16,200,1,'2021-04-07 09:55:26','2021-04-07 09:55:26','4c6b1c79-b9e4-4bc1-bba6-bb6f60fedc74','Question 2','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac eros nibh. Aliquam erat volutpat. Aenean non sem sit amet massa efficitur pellentesque sit amet nec turpis. Maecenas ornare nibh id consequat vestibulum.</p>'),(17,201,1,'2021-04-07 09:55:26','2021-04-07 09:55:26','3010373c-d238-48c3-b662-1210180a7c59','Question 3','<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac eros nibh. Aliquam erat volutpat. Aenean non sem sit amet massa efficitur pellentesque sit amet nec turpis. Maecenas ornare nibh id consequat vestibulum.</p>');
/*!40000 ALTER TABLE `matrixcontent_accordionmatrix` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixcontent_button`
--

LOCK TABLES `matrixcontent_button` WRITE;
/*!40000 ALTER TABLE `matrixcontent_button` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `matrixcontent_button` VALUES (1,186,1,'2021-04-07 09:55:25','2021-04-07 09:55:25','7350abbd-6e34-412e-b96e-2ecb2169470b','Internal Button',NULL,NULL),(2,187,1,'2021-04-07 09:55:25','2021-04-07 09:55:25','8d0d535e-5cbf-4dcd-8eb6-7f6c7cd04b0a',NULL,'https://www.lipsum.com/','External Button'),(3,192,1,'2021-04-07 09:55:25','2021-04-07 09:55:25','5a9d8e9f-3fe3-46ec-bec7-3200f7346d59','Internal Button',NULL,NULL),(4,193,1,'2021-04-07 09:55:25','2021-04-07 09:55:25','1bac35d7-a464-451a-81f1-9a4144f639f1',NULL,'https://www.lipsum.com/','External Button');
/*!40000 ALTER TABLE `matrixcontent_button` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixcontent_video`
--

LOCK TABLES `matrixcontent_video` WRITE;
/*!40000 ALTER TABLE `matrixcontent_video` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `matrixcontent_video` VALUES (1,161,1,'2021-04-07 09:31:18','2021-04-07 09:31:18','10763c5b-d5bd-434e-80ec-ae4be1cb0993','{\"url\":\"https://www.youtube.com/watch?v=NpEaa2P7qZI\",\"oembed\":null}'),(2,168,1,'2021-04-07 09:31:18','2021-04-07 09:31:18','8b0ad50d-07a6-43dd-9be7-34f73352a8b4','{\"url\":{\"url\":\"https://www.youtube.com/watch?v=NpEaa2P7qZI\",\"oembed\":null},\"oembed\":null}'),(3,173,1,'2021-04-07 09:42:14','2021-04-07 09:42:14','9f638af1-991e-4f1b-8840-09daea888c1f',NULL),(4,180,1,'2021-04-07 09:42:14','2021-04-07 09:42:14','5a986c59-9972-4119-b592-e285dae15e2b',NULL),(5,197,1,'2021-04-07 09:55:25','2021-04-07 09:55:25','7cc4bd37-dc29-4017-8e14-445b3a12ebd5',NULL);
/*!40000 ALTER TABLE `matrixcontent_video` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `migrations` VALUES (1,'craft','Install','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','6f2f0b13-4a16-47da-85b6-70ebb4d9cf6d'),(2,'craft','m150403_183908_migrations_table_changes','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','af0511fb-57df-45e2-8414-204506b41dca'),(3,'craft','m150403_184247_plugins_table_changes','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','8369ad3f-8736-4557-9454-0f16170d06eb'),(4,'craft','m150403_184533_field_version','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','e21a8b31-1c26-45bb-a2d3-fa933d757bf6'),(5,'craft','m150403_184729_type_columns','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','65d61a70-286b-4cdd-bcf3-407f7ecfe62a'),(6,'craft','m150403_185142_volumes','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','4547a095-f9cf-461e-bb98-ec9b2c002bdf'),(7,'craft','m150428_231346_userpreferences','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','18b25b98-a64d-4620-9831-91c9fd27290d'),(8,'craft','m150519_150900_fieldversion_conversion','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','b319c329-0840-4b40-9a24-38ce2aaef1b6'),(9,'craft','m150617_213829_update_email_settings','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','aef40a72-cd11-4bf3-8685-64dba9115a3c'),(10,'craft','m150721_124739_templatecachequeries','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','17ae0bfa-f65d-4a27-8415-a3ef16de8120'),(11,'craft','m150724_140822_adjust_quality_settings','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','f496a1aa-3b4c-4e3f-81db-2fc783bcf45c'),(12,'craft','m150815_133521_last_login_attempt_ip','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','9df216f0-214a-49bc-8a1a-9122005108f1'),(13,'craft','m151002_095935_volume_cache_settings','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','98503ec8-6069-49eb-8d3f-64e9b3601215'),(14,'craft','m151005_142750_volume_s3_storage_settings','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','cc84c18c-e643-4243-b63e-5dedb3fb4325'),(15,'craft','m151016_133600_delete_asset_thumbnails','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','9e02c9c9-5e2c-4fc5-a47a-43b67860c1b2'),(16,'craft','m151209_000000_move_logo','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','c2774561-004c-43a1-a410-e240d363b9c7'),(17,'craft','m151211_000000_rename_fileId_to_assetId','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','b7ced217-a6df-415f-a669-7210128c06ab'),(18,'craft','m151215_000000_rename_asset_permissions','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','86ab1310-cc3c-4384-b8d1-1cb2b668c80f'),(19,'craft','m160707_000001_rename_richtext_assetsource_setting','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','975e5e58-c9cf-4e65-a88d-c2418078f08c'),(20,'craft','m160708_185142_volume_hasUrls_setting','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','cf43e0f3-22ba-4514-b072-a821c9df41c6'),(21,'craft','m160714_000000_increase_max_asset_filesize','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','e72b4fa4-c176-40f9-800c-dd2588e53910'),(22,'craft','m160727_194637_column_cleanup','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','ee7c4f98-2e48-4f52-99d7-bc4b9420c9b2'),(23,'craft','m160804_110002_userphotos_to_assets','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','a2e570c0-0db7-4290-96fe-fd47a71965e1'),(24,'craft','m160807_144858_sites','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','b450b10a-93f1-4f68-814e-28d17f38e4ea'),(25,'craft','m160829_000000_pending_user_content_cleanup','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','8f96be70-b274-4f66-9063-be3eef598a16'),(26,'craft','m160830_000000_asset_index_uri_increase','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','d947aa87-6301-4d03-982a-bd77b4d535c8'),(27,'craft','m160912_230520_require_entry_type_id','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','aa6faf63-f572-43f6-a3e4-1352d17e3494'),(28,'craft','m160913_134730_require_matrix_block_type_id','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','92868cde-66f1-4fca-8099-7b8abbae0195'),(29,'craft','m160920_174553_matrixblocks_owner_site_id_nullable','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','bcb12d68-29d4-46f4-9365-d19a92a5390d'),(30,'craft','m160920_231045_usergroup_handle_title_unique','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','c8c9bad6-29e1-473d-a138-4df3b088b0d3'),(31,'craft','m160925_113941_route_uri_parts','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','45894ec2-3c1f-4998-997d-2bf0cbcc99d4'),(32,'craft','m161006_205918_schemaVersion_not_null','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','48e318fa-804c-4087-a9e8-18e84f68702d'),(33,'craft','m161007_130653_update_email_settings','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','41fc9d55-f2ee-4d2a-9b17-d4197a87cbdb'),(34,'craft','m161013_175052_newParentId','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','2730f184-015a-48c2-9263-c2508be91f2c'),(35,'craft','m161021_102916_fix_recent_entries_widgets','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','f5bbccba-76f5-415e-a208-6541dde20ff3'),(36,'craft','m161021_182140_rename_get_help_widget','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','d382f4a1-2348-40f8-87d6-aaab9f11d669'),(37,'craft','m161025_000000_fix_char_columns','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','a86dfe79-1726-4084-8a65-3a08099c8b3b'),(38,'craft','m161029_124145_email_message_languages','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','ae1348e9-5a21-4bd1-b505-73e17d5265c2'),(39,'craft','m161108_000000_new_version_format','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','3aaec0df-2bb9-4b72-875c-153c6e3c5604'),(40,'craft','m161109_000000_index_shuffle','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','7cb2a996-2079-409f-9b9c-80f6749dcdc1'),(41,'craft','m161122_185500_no_craft_app','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','173d2b96-0a04-49f7-b243-6b66a09d90cc'),(42,'craft','m161125_150752_clear_urlmanager_cache','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','41228e9d-1d9a-4b54-9666-a1c51a72c1de'),(43,'craft','m161220_000000_volumes_hasurl_notnull','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','89ddb938-dc9a-4996-b3b2-f66d81471a0f'),(44,'craft','m170114_161144_udates_permission','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','9b5e03b3-2562-4ce1-852c-eb894ed8f26b'),(45,'craft','m170120_000000_schema_cleanup','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','2faa1a74-4736-4c17-9712-c4763a1771f9'),(46,'craft','m170126_000000_assets_focal_point','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','a0daaec1-eead-4c94-88a2-136b3c97ef37'),(47,'craft','m170206_142126_system_name','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','6553c7e3-6c18-4638-8115-724dab2a7739'),(48,'craft','m170217_044740_category_branch_limits','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','aea5e986-8901-41e6-bfac-f6dfec1e3305'),(49,'craft','m170217_120224_asset_indexing_columns','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','4b18bcb6-d030-4f0c-aba9-a5a15edc43b7'),(50,'craft','m170223_224012_plain_text_settings','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','ce4513a5-5c1a-46d9-bba0-936dea9a81e3'),(51,'craft','m170227_120814_focal_point_percentage','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','30267ec8-f08c-45f9-b048-d25bb8d8c397'),(52,'craft','m170228_171113_system_messages','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','03a3e47b-edd6-47af-87ed-111e74ff37c6'),(53,'craft','m170303_140500_asset_field_source_settings','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','cb5783b6-8fe0-4240-9199-a00a05153b90'),(54,'craft','m170306_150500_asset_temporary_uploads','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','fc241ea9-f125-44f6-9392-bde13258a2d9'),(55,'craft','m170523_190652_element_field_layout_ids','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','36ea364b-e491-46d3-a432-0560b350aae2'),(56,'craft','m170621_195237_format_plugin_handles','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','0cb8486c-0f2c-4e8d-b0fb-5aa2b1de04dd'),(57,'craft','m170630_161027_deprecation_line_nullable','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','9fc0927e-0bd7-4f5d-a556-2ce3affc5e7a'),(58,'craft','m170630_161028_deprecation_changes','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','fb5fb969-9e65-4cca-a7a8-347ce8fde625'),(59,'craft','m170703_181539_plugins_table_tweaks','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','6b577c90-4be4-40c2-ab94-afbe37fcf015'),(60,'craft','m170704_134916_sites_tables','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','59bfe901-a606-4d1c-9ca6-91c75eedb459'),(61,'craft','m170706_183216_rename_sequences','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','cbb292fa-9aa1-44f1-be56-30548776e915'),(62,'craft','m170707_094758_delete_compiled_traits','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','797a60e5-6709-4cf3-a58f-850a782e5484'),(63,'craft','m170731_190138_drop_asset_packagist','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','91dfa015-486f-4a50-8ac0-592943401d42'),(64,'craft','m170810_201318_create_queue_table','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','a36e1b81-d04f-4798-9b7a-4953db70bd36'),(65,'craft','m170903_192801_longblob_for_queue_jobs','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','319aa1ab-1c4d-4d9d-8e1e-1f316b7f64fa'),(66,'craft','m170914_204621_asset_cache_shuffle','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','2da4c734-3bf4-4a3e-95c9-183c0052def3'),(67,'craft','m171011_214115_site_groups','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','de3d0d92-802b-4546-b059-78f32da6cdfe'),(68,'craft','m171012_151440_primary_site','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','452cabb9-c405-4101-bd44-e0e082ee4690'),(69,'craft','m171013_142500_transform_interlace','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','72c433f9-7e33-4c66-a577-4383070b374b'),(70,'craft','m171016_092553_drop_position_select','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','32cea281-aea2-475c-8253-fe814d9a6b75'),(71,'craft','m171016_221244_less_strict_translation_method','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','7a1e4b1b-2e7e-4e4a-84dd-68c9d841ee66'),(72,'craft','m171107_000000_assign_group_permissions','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','5bdc770b-baf2-48b5-a0cc-3f4bd0610925'),(73,'craft','m171117_000001_templatecache_index_tune','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','8e07f4ca-15be-428e-9f05-1c890a0b6e11'),(74,'craft','m171126_105927_disabled_plugins','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','6bc69927-2625-437f-9db9-b1a366862007'),(75,'craft','m171130_214407_craftidtokens_table','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','219ad1a1-4666-423a-9fac-117ae8987357'),(76,'craft','m171202_004225_update_email_settings','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','83872e16-c78f-4896-8140-75be72ad0516'),(77,'craft','m171204_000001_templatecache_index_tune_deux','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','5304557a-0486-424f-9e55-6f6649382cc1'),(78,'craft','m171205_130908_remove_craftidtokens_refreshtoken_column','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','17c3d7c2-3d98-49e6-b950-7f871bd43ba3'),(79,'craft','m171218_143135_longtext_query_column','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','abe76b7c-67f0-4d0b-bea6-8ecbbf0c7fbe'),(80,'craft','m171231_055546_environment_variables_to_aliases','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','8869a3ce-f6e6-4cfb-b42d-76b3ceed52f9'),(81,'craft','m180113_153740_drop_users_archived_column','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','8a45efe9-d3dc-4a01-ac51-900a89375776'),(82,'craft','m180122_213433_propagate_entries_setting','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','d9a038c5-1764-4a80-97d6-37650e09be05'),(83,'craft','m180124_230459_fix_propagate_entries_values','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','40631d1a-0e7f-4938-997b-1e35e619fbd3'),(84,'craft','m180128_235202_set_tag_slugs','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','ec809223-20cf-4269-a5be-484741d91f04'),(85,'craft','m180202_185551_fix_focal_points','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','f2deeddc-793f-45f5-b0e5-68f177783d3d'),(86,'craft','m180217_172123_tiny_ints','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','302e1cce-138a-4151-8c76-3679e6e1e1bf'),(87,'craft','m180321_233505_small_ints','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','804a2dff-6a61-464c-a79e-038804eb9b07'),(88,'craft','m180404_182320_edition_changes','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','53fbd7a3-ceed-4739-90ab-facb4f0e4d8c'),(89,'craft','m180411_102218_fix_db_routes','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','56430c27-b549-4618-8725-88c6189dc587'),(90,'craft','m180416_205628_resourcepaths_table','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','9e81cff6-a122-44dd-8ce4-7b3746935e05'),(91,'craft','m180418_205713_widget_cleanup','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','1d310071-f5b4-4bb6-9257-614de21f6dfa'),(92,'craft','m180425_203349_searchable_fields','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','fed50be0-a858-4187-a0cc-13e9b80befe3'),(93,'craft','m180516_153000_uids_in_field_settings','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','c8f291ab-5b85-455f-bb7c-5832283f7213'),(94,'craft','m180517_173000_user_photo_volume_to_uid','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','eae3bac3-4e65-4aba-8fa6-9dbf212b5dea'),(95,'craft','m180518_173000_permissions_to_uid','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','f8814ace-3c38-43c0-85a6-fd42757c697e'),(96,'craft','m180520_173000_matrix_context_to_uids','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','3eb64f64-02bf-40d7-b057-15a11ef5d20a'),(97,'craft','m180521_172900_project_config_table','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','6f52e995-01ae-47d7-83f1-bc46d6cd00e3'),(98,'craft','m180521_173000_initial_yml_and_snapshot','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','1d741140-5064-4474-a6e2-ce9591bb1532'),(99,'craft','m180731_162030_soft_delete_sites','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','9f93d5a3-9fc2-4aec-9fb7-8bdc9c98e11c'),(100,'craft','m180810_214427_soft_delete_field_layouts','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','c1af27db-be38-4c55-abcb-2d5faf443bd0'),(101,'craft','m180810_214439_soft_delete_elements','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','d0215c7e-f3a2-4534-a976-f04b672b30cb'),(102,'craft','m180824_193422_case_sensitivity_fixes','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','2e65741c-9104-4964-8c30-2e3b77184300'),(103,'craft','m180901_151639_fix_matrixcontent_tables','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','8ea2b93b-1b6c-4e0d-9091-b02ab82ddd35'),(104,'craft','m180904_112109_permission_changes','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','15f72d33-7024-4f42-b5a9-a7f307143247'),(105,'craft','m180910_142030_soft_delete_sitegroups','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','76d6d4c0-dbb2-4d4d-8461-e6da0c21f0af'),(106,'craft','m181011_160000_soft_delete_asset_support','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','3ee111e7-0a0b-4f60-928d-710265c4f317'),(107,'craft','m181016_183648_set_default_user_settings','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','6f8d02f2-3e1a-4eae-8fee-3263704870d7'),(108,'craft','m181017_225222_system_config_settings','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','69e4955c-4d27-445f-9a53-3eb71b736783'),(109,'craft','m181018_222343_drop_userpermissions_from_config','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','af14d77b-68f8-4ce0-a1fe-1d8e3b0f8197'),(110,'craft','m181029_130000_add_transforms_routes_to_config','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','70663c30-f448-4ef2-8295-7951f26d9a8e'),(111,'craft','m181112_203955_sequences_table','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','8f765f15-1b87-42d5-a5b3-d15caf559ee1'),(112,'craft','m181121_001712_cleanup_field_configs','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','57dc9bb5-a182-4777-a970-cfa8c6e9e7ce'),(113,'craft','m181128_193942_fix_project_config','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','c4d55e8c-9247-4010-8ef0-232f4df74a42'),(114,'craft','m181130_143040_fix_schema_version','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','f0503503-4ba9-421d-bdfd-150e29866dbc'),(115,'craft','m181211_143040_fix_entry_type_uids','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','d7ec23eb-930e-40d3-86f6-22bb6e6bb27b'),(116,'craft','m181217_153000_fix_structure_uids','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','eb6e02b0-2dac-45e2-aa3c-0f468d0638ab'),(117,'craft','m190104_152725_store_licensed_plugin_editions','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','7fd65469-1166-47b2-a5af-c964adf6cd0e'),(118,'craft','m190108_110000_cleanup_project_config','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','fd5659ec-7d8d-4dfe-beba-bf6a613e7cfe'),(119,'craft','m190108_113000_asset_field_setting_change','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','2c1c5d90-0362-4ef1-95a2-e6930c19e7cd'),(120,'craft','m190109_172845_fix_colspan','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','3a700326-2479-4434-8aea-e85a867a0a67'),(121,'craft','m190110_150000_prune_nonexisting_sites','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','eb4dc7bc-1faa-44c0-9a4b-c046bef35f59'),(122,'craft','m190110_214819_soft_delete_volumes','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','1041ac49-c444-46cc-83ef-3845e8e2841a'),(123,'craft','m190112_124737_fix_user_settings','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','912bafbd-dfee-4759-b135-08365f14f280'),(124,'craft','m190112_131225_fix_field_layouts','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','33d41a8f-3b96-4564-a4c5-a391c75f389e'),(125,'craft','m190112_201010_more_soft_deletes','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','9bedea23-c6eb-48a0-b071-ee4d42a86c35'),(126,'craft','m190114_143000_more_asset_field_setting_changes','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','bc6cf03f-7ed0-4589-b91a-7f82762c6198'),(127,'craft','m190121_120000_rich_text_config_setting','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','78acb996-c359-415a-a228-e2d96c07f4e7'),(128,'craft','m190125_191628_fix_email_transport_password','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','0f258a08-aca8-4110-9105-ace7c83367e4'),(129,'craft','m190128_181422_cleanup_volume_folders','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','263f4de0-2dc6-4031-8ac1-ca844e74c144'),(130,'craft','m190205_140000_fix_asset_soft_delete_index','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','2eef7c4c-d09c-4003-8f5e-501625c2b47d'),(131,'craft','m190218_143000_element_index_settings_uid','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','015415b7-cae8-48bc-8b3a-ba8d03e10124'),(132,'craft','m190312_152740_element_revisions','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','4bb5c130-b726-4908-bed7-ad12d5655f07'),(133,'craft','m190327_235137_propagation_method','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','f555f8bd-92a9-47ee-a56d-971cad7fd8d7'),(134,'craft','m190401_223843_drop_old_indexes','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','0d5c5989-f0d2-4668-83fd-fe90be89a5b7'),(135,'craft','m190416_014525_drop_unique_global_indexes','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','42cacc37-6108-43c3-9e0f-d54eeda856f5'),(136,'craft','m190417_085010_add_image_editor_permissions','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','550113f4-6d58-4be4-be86-fe9aa78de2dd'),(137,'craft','m190502_122019_store_default_user_group_uid','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','01310969-c4e0-4df3-ade6-2878a0bebf28'),(138,'craft','m190504_150349_preview_targets','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','0373a64f-74a1-4c39-b737-34fd4c7c4960'),(139,'craft','m190516_184711_job_progress_label','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','72f6489c-51b9-42e4-92e5-2f30814aec08'),(140,'craft','m190523_190303_optional_revision_creators','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','c8c8e62c-7a9a-484d-ae17-31339110e239'),(141,'craft','m190529_204501_fix_duplicate_uids','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','e7c08f72-ec18-41f5-9e86-def9574314a8'),(142,'craft','m190605_223807_unsaved_drafts','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','f74dcc36-7abe-4f1c-8b48-cce2b3d0d47c'),(143,'craft','m190607_230042_entry_revision_error_tables','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','3d9d6cb6-9a29-45d0-b159-f5e853de5c42'),(144,'craft','m190608_033429_drop_elements_uid_idx','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','c5ef851a-b818-480f-a0d6-0276b4b98b97'),(145,'craft','m190617_164400_add_gqlschemas_table','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','f771fd7b-a117-47e7-992d-bac89957303c'),(146,'craft','m190624_234204_matrix_propagation_method','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','4ac332fd-8c54-4cce-946f-839a4c36e69b'),(147,'craft','m190711_153020_drop_snapshots','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','c78c9c53-615a-4d36-8270-4c54f4d2fe90'),(148,'craft','m190712_195914_no_draft_revisions','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','2e7a2fc2-8167-4b50-bf6b-26ff7d171430'),(149,'craft','m190723_140314_fix_preview_targets_column','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','3982d74e-c38b-48f4-a0f3-2ee98e535564'),(150,'craft','m190820_003519_flush_compiled_templates','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','8492053a-4f3a-4d4e-8bd0-0dd3511135b6'),(151,'craft','m190823_020339_optional_draft_creators','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','c03654b2-56ae-4ab7-ad8c-810bef6cc529'),(152,'craft','m190913_152146_update_preview_targets','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','8ce462a4-8ed6-4cb7-b2c6-a667dd7c27bd'),(153,'craft','m191107_122000_add_gql_project_config_support','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','d5f18363-682a-4bbc-a94c-59a60a2ab518'),(154,'craft','m191204_085100_pack_savable_component_settings','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','f62de8e4-97d4-4a80-be5c-e70f9f5a16ce'),(155,'craft','m191206_001148_change_tracking','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','88830912-b5c1-4f37-8832-90ba36cdf57c'),(156,'craft','m191216_191635_asset_upload_tracking','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','252f1366-54b1-4537-a3f2-9ec94ec09819'),(157,'craft','m191222_002848_peer_asset_permissions','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','a21a265b-261c-4da1-b545-ab2e91de12de'),(158,'craft','m200127_172522_queue_channels','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','0dc020d9-77c7-43ed-940b-881ffd90dfdf'),(159,'craft','m200211_175048_truncate_element_query_cache','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','5c65ff4c-eea5-410a-832d-9e2996dbc8d1'),(160,'craft','m200213_172522_new_elements_index','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','e77027eb-429b-417c-8618-5e763b24c947'),(161,'craft','m200228_195211_long_deprecation_messages','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','5d542f06-e6e4-4a81-bf1d-be63cca403d3'),(162,'craft','m200306_054652_disabled_sites','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','caf7b470-1fb2-44ac-9bf9-56efd204622f'),(163,'craft','m200522_191453_clear_template_caches','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','057e4808-61f2-4400-87c3-d69e6873c6c2'),(164,'craft','m200606_231117_migration_tracks','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','e9f5f759-1ce5-4b8b-a984-d98576e38754'),(165,'craft','m200619_215137_title_translation_method','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','fd53fd9a-3596-4dff-bd2a-f48794eb439c'),(166,'craft','m200620_005028_user_group_descriptions','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','c799b538-26f9-402f-b9ac-3eb6bd4cacce'),(167,'craft','m200620_230205_field_layout_changes','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','f042838c-f61d-463c-9188-6620057a3d78'),(168,'craft','m200625_131100_move_entrytypes_to_top_project_config','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','1e227c14-73b7-41ee-a47a-011f4609732e'),(169,'craft','m200629_112700_remove_project_config_legacy_files','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','f28678f1-5406-4b81-9291-9413cc66c173'),(170,'craft','m200630_183000_drop_configmap','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','1fce26e0-b704-43e7-b7b9-0574b3ae8322'),(171,'craft','m200715_113400_transform_index_error_flag','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','806f1070-109b-4ee4-bc2b-2449ef9d66e8'),(172,'craft','m200716_110900_replace_file_asset_permissions','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','c84d0da2-a4a1-4b03-abbe-de1e3bfc4e27'),(173,'craft','m200716_153800_public_token_settings_in_project_config','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','416177e4-24be-425d-a036-f2eb0ce19602'),(174,'craft','m200720_175543_drop_unique_constraints','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','043b2458-5b0d-4c56-ab0a-951a6a8f82c6'),(175,'craft','m200825_051217_project_config_version','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','7d110ba6-f582-46be-b4f1-6fcec098037e'),(176,'craft','m201116_190500_asset_title_translation_method','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','2d73ae70-ea93-43a8-950a-b7e9cc790c92'),(177,'craft','m201124_003555_plugin_trials','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','f137b11b-1e18-4235-9ee3-debcf3d7001e'),(178,'craft','m210209_135503_soft_delete_field_groups','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','92ea903e-43cb-4bba-b463-15b510db0f74'),(179,'craft','m210212_223539_delete_invalid_drafts','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','4285d9bc-67bf-4d35-92b3-b1fbda92ac17'),(180,'craft','m210214_202731_track_saved_drafts','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','58c7f6b8-56dd-4aad-80a3-5a13e56affdd'),(181,'craft','m210223_150900_add_new_element_gql_schema_components','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','cb865fe5-7e9f-4829-9acd-a1027f2e373e'),(182,'craft','m210224_162000_add_projectconfignames_table','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','2bfba8f5-325c-4839-8910-80637b8752a5'),(183,'craft','m210326_132000_invalidate_projectconfig_cache','2021-03-30 09:20:12','2021-03-30 09:20:12','2021-03-30 09:20:12','06761855-08b5-4aca-9953-ee55637ab7bd'),(184,'plugin:neo','Install','2021-03-30 09:23:23','2021-03-30 09:23:23','2021-03-30 09:23:23','eb4ef9a8-ed4c-402e-9573-b95537b7e431'),(185,'plugin:neo','m181022_123749_craft3_upgrade','2021-03-30 09:23:23','2021-03-30 09:23:23','2021-03-30 09:23:23','16086e61-5747-4690-ab4b-c7cff04462ae'),(186,'plugin:neo','m190127_023247_soft_delete_compatibility','2021-03-30 09:23:23','2021-03-30 09:23:23','2021-03-30 09:23:23','87ddc4fa-a489-4104-b80c-e4b9524c8353'),(187,'plugin:neo','m200313_015120_structure_update','2021-03-30 09:23:23','2021-03-30 09:23:23','2021-03-30 09:23:23','b7e4d1c5-ed68-4acb-8264-f0ee1d9f7563'),(188,'plugin:neo','m200722_061114_add_max_sibling_blocks','2021-03-30 09:23:23','2021-03-30 09:23:23','2021-03-30 09:23:23','06f07f9b-80a0-4e67-b962-5788d016ea54'),(189,'plugin:neo','m201108_123758_block_propagation_method_fix','2021-03-30 09:23:23','2021-03-30 09:23:23','2021-03-30 09:23:23','7e50da1c-e2fc-4f7a-8453-d53252b97d01'),(190,'plugin:neo','m201208_110049_delete_blocks_without_sort_order','2021-03-30 09:23:23','2021-03-30 09:23:23','2021-03-30 09:23:23','c5351b20-191e-403f-88ac-f04a5e20bcb2'),(191,'plugin:neo','m201223_024137_delete_blocks_with_invalid_owner','2021-03-30 09:23:23','2021-03-30 09:23:23','2021-03-30 09:23:23','571b945b-2472-4142-894e-2845214b8091'),(194,'plugin:redactor','m180430_204710_remove_old_plugins','2021-03-30 09:26:57','2021-03-30 09:26:57','2021-03-30 09:26:57','4d54be23-6e9c-4a93-a7bb-f960fe59bfa7'),(195,'plugin:redactor','Install','2021-03-30 09:26:57','2021-03-30 09:26:57','2021-03-30 09:26:57','0b030da6-e19a-4694-8637-fc21be22a43f'),(196,'plugin:redactor','m190225_003922_split_cleanup_html_settings','2021-03-30 09:26:57','2021-03-30 09:26:57','2021-03-30 09:26:57','027d95f2-6f20-44d4-b409-1c00bf7500e4'),(197,'plugin:super-table','Install','2021-03-30 09:27:19','2021-03-30 09:27:19','2021-03-30 09:27:19','c4313e99-6b07-488a-85ef-bf5fc4c9444c'),(198,'plugin:super-table','m180210_000000_migrate_content_tables','2021-03-30 09:27:19','2021-03-30 09:27:19','2021-03-30 09:27:19','b2e710f4-f5e2-4e39-89b8-91528fc2978e'),(199,'plugin:super-table','m180211_000000_type_columns','2021-03-30 09:27:19','2021-03-30 09:27:19','2021-03-30 09:27:19','0a79b754-9725-4d4c-af0e-d53f963ca028'),(200,'plugin:super-table','m180219_000000_sites','2021-03-30 09:27:19','2021-03-30 09:27:19','2021-03-30 09:27:19','cd5171f2-8bd1-4848-9180-dd824e07e5b0'),(201,'plugin:super-table','m180220_000000_fix_context','2021-03-30 09:27:20','2021-03-30 09:27:20','2021-03-30 09:27:20','0b01060f-d091-4606-840b-2caea50bdb78'),(202,'plugin:super-table','m190117_000000_soft_deletes','2021-03-30 09:27:20','2021-03-30 09:27:20','2021-03-30 09:27:20','f8de89c7-706f-4963-9d3f-d197c39aa56f'),(203,'plugin:super-table','m190117_000001_context_to_uids','2021-03-30 09:27:20','2021-03-30 09:27:20','2021-03-30 09:27:20','74e2a6c0-e9da-4665-8e13-1cacba3f1733'),(204,'plugin:super-table','m190120_000000_fix_supertablecontent_tables','2021-03-30 09:27:20','2021-03-30 09:27:20','2021-03-30 09:27:20','93e60044-44dc-4293-8fbe-919434d15ceb'),(205,'plugin:super-table','m190131_000000_fix_supertable_missing_fields','2021-03-30 09:27:20','2021-03-30 09:27:20','2021-03-30 09:27:20','81b1c6f5-41bd-460e-88f1-419a0a262339'),(206,'plugin:super-table','m190227_100000_fix_project_config','2021-03-30 09:27:20','2021-03-30 09:27:20','2021-03-30 09:27:20','a6734ece-3502-4d30-b47b-6f6ff52c0e1d'),(207,'plugin:super-table','m190511_100000_fix_project_config','2021-03-30 09:27:20','2021-03-30 09:27:20','2021-03-30 09:27:20','7d9cd719-809c-4507-8969-bdd706fe2909'),(208,'plugin:super-table','m190520_000000_fix_project_config','2021-03-30 09:27:20','2021-03-30 09:27:20','2021-03-30 09:27:20','b5701d48-ca75-4d7d-8a9a-8b1369cbbb9e'),(209,'plugin:super-table','m190714_000000_propagation_method','2021-03-30 09:27:20','2021-03-30 09:27:20','2021-03-30 09:27:20','2dc999e4-7428-43a8-8a86-cc182af4eb2e'),(210,'plugin:super-table','m191127_000000_fix_width','2021-03-30 09:27:20','2021-03-30 09:27:20','2021-03-30 09:27:20','09bc8690-575c-41d5-b0f0-9fbc5e6a6117'),(211,'plugin:seo','Install','2021-03-30 09:27:41','2021-03-30 09:27:41','2021-03-30 09:27:41','b001eb8d-a6b2-4123-b392-1869f05a87f2'),(212,'plugin:seo','m180906_152947_add_site_id_to_redirects','2021-03-30 09:27:41','2021-03-30 09:27:41','2021-03-30 09:27:41','88f2b309-a4ee-41fc-a896-ba181d14ca41'),(213,'plugin:seo','m190114_152300_upgrade_to_new_data_format','2021-03-30 09:27:41','2021-03-30 09:27:41','2021-03-30 09:27:41','e8f14d35-a015-4b37-8779-fe26d4cc1afb'),(214,'plugin:seo','m200518_110721_add_order_to_redirects','2021-03-30 09:27:41','2021-03-30 09:27:41','2021-03-30 09:27:41','9c9bf84b-fe2c-4cb6-9cf4-8a4135942ae9'),(215,'plugin:aws-s3','Install','2021-03-30 09:28:07','2021-03-30 09:28:07','2021-03-30 09:28:07','f5048d2a-8dfc-435f-824a-db3f0df50333'),(216,'plugin:aws-s3','m180929_165000_remove_storageclass_setting','2021-03-30 09:28:07','2021-03-30 09:28:07','2021-03-30 09:28:07','7a0b3a63-5b3b-4441-bed8-317ab196f462'),(217,'plugin:aws-s3','m190131_214300_cleanup_config','2021-03-30 09:28:07','2021-03-30 09:28:07','2021-03-30 09:28:07','df2c2014-a10e-4c72-9c8e-b42c0788fa9d'),(218,'plugin:aws-s3','m190305_133000_cleanup_expires_config','2021-03-30 09:28:07','2021-03-30 09:28:07','2021-03-30 09:28:07','a995c46a-62b1-4252-afa5-df0131c2ad9a'),(219,'plugin:navigation','Install','2021-03-30 11:13:21','2021-03-30 11:13:21','2021-03-30 11:13:21','4798a268-69ff-4b03-8c11-60afca933ae1'),(220,'plugin:navigation','m180826_000000_propagate_nav_setting','2021-03-30 11:13:21','2021-03-30 11:13:21','2021-03-30 11:13:21','90846cf2-80d1-4af0-9c37-5f08d8e6a4d1'),(221,'plugin:navigation','m180827_000000_propagate_nav_setting_additional','2021-03-30 11:13:21','2021-03-30 11:13:21','2021-03-30 11:13:21','2e443edb-fbdd-4c4f-848b-3c2156da437d'),(222,'plugin:navigation','m181110_000000_add_elementSiteId','2021-03-30 11:13:21','2021-03-30 11:13:21','2021-03-30 11:13:21','329add7e-021e-4862-8717-efc228a0bf6f'),(223,'plugin:navigation','m181123_000000_populate_elementSiteIds','2021-03-30 11:13:21','2021-03-30 11:13:21','2021-03-30 11:13:21','59fb18d9-82ab-41b4-8041-f59b66c58c72'),(224,'plugin:navigation','m190203_000000_add_instructions','2021-03-30 11:13:21','2021-03-30 11:13:21','2021-03-30 11:13:21','5d1f7d07-a0dc-4add-b0bf-e77abc12b40e'),(225,'plugin:navigation','m190209_000000_project_config','2021-03-30 11:13:21','2021-03-30 11:13:21','2021-03-30 11:13:21','3927acaf-364e-4ef1-8f8c-c1bb8bf01d54'),(226,'plugin:navigation','m190223_000000_permissions','2021-03-30 11:13:21','2021-03-30 11:13:21','2021-03-30 11:13:21','61e4aac3-72b9-498b-8638-8b5f46737a22'),(227,'plugin:navigation','m190307_000000_update_field_content','2021-03-30 11:13:21','2021-03-30 11:13:21','2021-03-30 11:13:21','87b51430-fdfa-41a5-859f-77945a7f87da'),(228,'plugin:navigation','m190310_000000_migrate_elementSiteId','2021-03-30 11:13:21','2021-03-30 11:13:21','2021-03-30 11:13:21','8165e838-ca3d-4e38-8d88-4d6740b8ab20'),(229,'plugin:navigation','m190314_000000_soft_deletes','2021-03-30 11:13:21','2021-03-30 11:13:21','2021-03-30 11:13:21','79211f0a-d8fc-4e88-8a2b-085a25d055c4'),(230,'plugin:navigation','m190315_000000_project_config','2021-03-30 11:13:21','2021-03-30 11:13:21','2021-03-30 11:13:21','b1003fa2-edc7-4142-bd7f-5890a892b4a7'),(231,'plugin:navigation','m191127_000000_fix_nav_handle','2021-03-30 11:13:21','2021-03-30 11:13:21','2021-03-30 11:13:21','f6c5fcc4-f0cb-4948-9eda-841c6b63b652'),(232,'plugin:navigation','m191230_102505_add_fieldLayoutId','2021-03-30 11:13:21','2021-03-30 11:13:21','2021-03-30 11:13:21','71097e85-8d54-432a-a71c-0599a18802d6'),(233,'plugin:navigation','m200108_000000_add_attributes','2021-03-30 11:13:21','2021-03-30 11:13:21','2021-03-30 11:13:21','257837e6-33bf-4193-9021-b1f856b4a5f8'),(234,'plugin:navigation','m200108_100000_add_url_suffix','2021-03-30 11:13:21','2021-03-30 11:13:21','2021-03-30 11:13:21','f8705d21-be07-4e89-a8b8-c60d799c8780'),(235,'plugin:navigation','m200108_200000_add_max_nodes','2021-03-30 11:13:21','2021-03-30 11:13:21','2021-03-30 11:13:21','7dced899-0beb-4bea-bf99-1dbbdcc14c75'),(236,'plugin:navigation','m200205_000000_add_data','2021-03-30 11:13:21','2021-03-30 11:13:21','2021-03-30 11:13:21','c19d5ab3-9b51-4eec-a490-55bd3ee29600'),(237,'plugin:navigation','m200810_000000_fix_elementsiteid','2021-03-30 11:13:21','2021-03-30 11:13:21','2021-03-30 11:13:21','a9eaeee6-6d24-497f-9386-eae5ad4d1451'),(238,'plugin:navigation','m200811_000000_fix_uris','2021-03-30 11:13:21','2021-03-30 11:13:21','2021-03-30 11:13:21','9011f02a-cde5-4982-bef4-aef73d08cbf7'),(239,'plugin:navigation','m201017_000000_add_permissions','2021-03-30 11:13:21','2021-03-30 11:13:21','2021-03-30 11:13:21','4b3dc4bf-ff21-4a14-b7e6-c350bdec34f0'),(240,'plugin:navigation','m201018_000000_site_settings','2021-03-30 11:13:21','2021-03-30 11:13:21','2021-03-30 11:13:21','5b23d633-f3b6-4762-8ef3-4ac2620f7485'),(241,'plugin:freeform','Install','2021-03-30 13:30:12','2021-03-30 13:30:12','2021-03-30 13:30:12','d0257cce-92f1-422a-93a2-587b9ac1a247'),(242,'plugin:freeform','m180120_140521_CraftUpgrade','2021-03-30 13:30:12','2021-03-30 13:30:12','2021-03-30 13:30:12','b59646ea-1d48-464e-acb4-e5fa300a4fe7'),(243,'plugin:freeform','m180125_124339_UpdateForeignKeyNames','2021-03-30 13:30:12','2021-03-30 13:30:12','2021-03-30 13:30:12','45c8be8a-f856-450c-b547-11899b90624c'),(244,'plugin:freeform','m180214_094247_AddUniqueTokenToSubmissionsAndForms','2021-03-30 13:30:12','2021-03-30 13:30:12','2021-03-30 13:30:12','10445377-fff2-4c8d-a5f6-de3b2c699810'),(245,'plugin:freeform','m180220_072652_ChangeFileUploadFieldColumnType','2021-03-30 13:30:12','2021-03-30 13:30:12','2021-03-30 13:30:12','8affbec8-8da4-4e15-af4a-d2e05e2c649d'),(246,'plugin:freeform','m180326_094124_AddIsSpamToSubmissions','2021-03-30 13:30:12','2021-03-30 13:30:12','2021-03-30 13:30:12','d13a526f-1120-4431-9db2-3439bf8fafa9'),(247,'plugin:freeform','m180405_101920_AddIpAddressToSubmissions','2021-03-30 13:30:12','2021-03-30 13:30:12','2021-03-30 13:30:12','668525f2-1319-4daf-870e-c7ab5b270ef4'),(248,'plugin:freeform','m180410_131206_CreateIntegrationsQueue','2021-03-30 13:30:12','2021-03-30 13:30:12','2021-03-30 13:30:12','80c4d779-d7f1-4bf1-8bff-d45a3067b7bd'),(249,'plugin:freeform','m180417_134527_AddMultipleSelectTypeToFields','2021-03-30 13:30:12','2021-03-30 13:30:12','2021-03-30 13:30:12','cfe13702-8842-48ce-8769-a7204821d6f4'),(250,'plugin:freeform','m180430_151626_PaymentGateways','2021-03-30 13:30:12','2021-03-30 13:30:12','2021-03-30 13:30:12','1d7d8a74-3925-40e3-b5f1-873ebbe6c88a'),(251,'plugin:freeform','m180508_095131_CreatePaymentGatewayFieldsTable','2021-03-30 13:30:12','2021-03-30 13:30:12','2021-03-30 13:30:12','2284ffee-f052-444d-ba0c-6d64ea93bc61'),(252,'plugin:freeform','m180606_141402_AddConnectionsToFormProperties','2021-03-30 13:30:12','2021-03-30 13:30:12','2021-03-30 13:30:12','41c67cb1-686a-495e-b6d2-b3211849d13d'),(253,'plugin:freeform','m180730_171628_AddCcDetailsFieldType','2021-03-30 13:30:12','2021-03-30 13:30:12','2021-03-30 13:30:12','729bd6f8-c739-44d6-9153-3d5a97581f28'),(254,'plugin:freeform','m180817_091801_AddRulesToFormProperties','2021-03-30 13:30:12','2021-03-30 13:30:12','2021-03-30 13:30:12','8fb9e1a5-2bbe-431b-9f18-cbc1ceb6cfa0'),(255,'plugin:freeform','m181112_152751_ChangeTypeEnumColumnsToIndexedText','2021-03-30 13:30:12','2021-03-30 13:30:12','2021-03-30 13:30:12','cd3733a0-078c-49a9-97f2-2e2fb5743abe'),(256,'plugin:freeform','m181129_083939_ChangeIntegrationFieldTypeColumnTypeToString','2021-03-30 13:30:12','2021-03-30 13:30:12','2021-03-30 13:30:12','387dc3a9-2e3b-4906-86ca-e3b2401f3aa2'),(257,'plugin:freeform','m190501_124050_MergingEditionsMigration','2021-03-30 13:30:12','2021-03-30 13:30:12','2021-03-30 13:30:12','176434f6-f55f-4321-acdd-571f3d04030c'),(258,'plugin:freeform','m190502_155557_AddCCAndBCCToEmailNotifications','2021-03-30 13:30:12','2021-03-30 13:30:12','2021-03-30 13:30:12','73e6702c-3e5f-4d12-a11a-e256d530e3bc'),(259,'plugin:freeform','m190516_085150_AddPresetAssetsToNotifications','2021-03-30 13:30:12','2021-03-30 13:30:12','2021-03-30 13:30:12','e449c096-bca6-47f3-9b2d-4ee0df39b811'),(260,'plugin:freeform','m190529_135307_AddWebhookTables','2021-03-30 13:30:12','2021-03-30 13:30:12','2021-03-30 13:30:12','f12a16c1-9fc1-45e5-b272-16bf870633e5'),(261,'plugin:freeform','m190603_160423_UpgradeFreeformHoneypotEnhancement','2021-03-30 13:30:12','2021-03-30 13:30:12','2021-03-30 13:30:12','e4e2073c-e2ba-40cd-a9bb-567717f4ceb9'),(262,'plugin:freeform','m190604_125112_AddFormLimitSubmissionProperty','2021-03-30 13:30:12','2021-03-30 13:30:12','2021-03-30 13:30:12','bd8c285e-cbb2-4bf0-9f25-26f19664e658'),(263,'plugin:freeform','m190610_074840_MigrateScriptInsertLocation','2021-03-30 13:30:12','2021-03-30 13:30:12','2021-03-30 13:30:12','5158e021-d207-4bf1-9904-d571d4945aa9'),(264,'plugin:freeform','m190614_103420_AddMissingMetaColumnsToProAndPaymentTables','2021-03-30 13:30:12','2021-03-30 13:30:12','2021-03-30 13:30:12','1343e64f-72b6-42ef-9682-694e4f3fd045'),(265,'plugin:freeform','m190617_122427_RemoveBrokenForeignKeys','2021-03-30 13:30:12','2021-03-30 13:30:12','2021-03-30 13:30:12','d606dcb1-cf57-49c6-aef4-ee5a02067852'),(266,'plugin:freeform','m190618_142759_AddFixedForeignKeys','2021-03-30 13:30:12','2021-03-30 13:30:12','2021-03-30 13:30:12','291bcdd6-f335-4b22-8802-57292d80de9b'),(267,'plugin:freeform','m190812_125059_AddNotesTable','2021-03-30 13:30:12','2021-03-30 13:30:12','2021-03-30 13:30:12','c28aa2c2-e1bc-460a-adc4-410b274f8e22'),(268,'plugin:freeform','m190905_113428_FixIntervalCountNotNullColumn','2021-03-30 13:30:12','2021-03-30 13:30:12','2021-03-30 13:30:12','25b9a091-3c36-49d6-bcb3-67872efdc063'),(269,'plugin:freeform','m191214_093453_AddExtraPostUrlColumnToForm','2021-03-30 13:30:12','2021-03-30 13:30:12','2021-03-30 13:30:12','af39e1f4-0830-4719-a31a-ece6f97f4b35'),(270,'plugin:freeform','m200203_180318_AddSpamReasonTable','2021-03-30 13:30:12','2021-03-30 13:30:12','2021-03-30 13:30:12','0216efbc-9b65-48bf-99db-d7b67babc299'),(271,'plugin:freeform','m200214_083115_FixIntegrationQueueIndex','2021-03-30 13:30:12','2021-03-30 13:30:12','2021-03-30 13:30:12','f26ef36f-db94-4a14-834a-0356ac936033'),(272,'plugin:freeform','m200616_143808_FormPermissionsUpdate','2021-03-30 13:30:12','2021-03-30 13:30:12','2021-03-30 13:30:12','a9efbc7c-4692-4888-9017-6b8d4d081e53'),(273,'plugin:freeform','m200630_103347_IncreaseExportProfileSettingSize','2021-03-30 13:30:12','2021-03-30 13:30:12','2021-03-30 13:30:12','62357ba8-39af-4ce3-9fe7-81070bb60eaa'),(274,'plugin:freeform','m200825_124009_SplitPipedriveIntegrationIntoDealsAndLeads','2021-03-30 13:30:12','2021-03-30 13:30:12','2021-03-30 13:30:12','b75329eb-0888-4c46-99d8-e5da1f6429e5'),(275,'plugin:freeform','m200907_081059_AddValidationToFormProperties','2021-03-30 13:30:12','2021-03-30 13:30:12','2021-03-30 13:30:12','8078611d-e89e-4035-9b40-96d9f178a8b6'),(276,'plugin:freeform','m200911_130215_AddReplyToNameToNotifications','2021-03-30 13:30:12','2021-03-30 13:30:12','2021-03-30 13:30:12','fd98a3ba-e4cd-4bcd-bad2-41e40deaf4a3'),(277,'plugin:freeform','m201006_065315_AddFeedTables','2021-03-30 13:30:12','2021-03-30 13:30:12','2021-03-30 13:30:12','af28499f-94b9-4a8f-80c0-4d8125545bd9'),(278,'plugin:freeform','m201014_161213_AddFormSortOrder','2021-03-30 13:30:12','2021-03-30 13:30:12','2021-03-30 13:30:12','e4ad2ed2-2421-428b-91b1-09ea25712a4c'),(279,'plugin:freeform','m201027_103933_AddExportProfileDateRanges','2021-03-30 13:30:12','2021-03-30 13:30:12','2021-03-30 13:30:12','c5958e55-a6a5-40c9-8cb3-63c76de12ee5'),(280,'plugin:freeform','m201209_162655_AddAutoTextColumnToNotifications','2021-03-30 13:30:12','2021-03-30 13:30:12','2021-03-30 13:30:12','1182e759-af00-4649-adcb-93021dfd4793'),(281,'plugin:freeform','m210105_145259_AddGoogleTagManagerColumnsToForms','2021-03-30 13:30:12','2021-03-30 13:30:12','2021-03-30 13:30:12','6c5d2f05-c897-466d-8e80-ccfbb7fa9612');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `navigation_navs`
--

LOCK TABLES `navigation_navs` WRITE;
/*!40000 ALTER TABLE `navigation_navs` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `navigation_navs` VALUES (1,21,'Main Navigation','mainNavigation','',1,0,NULL,'{\"craft\\\\elements\\\\Asset\":{\"enabled\":\"1\",\"permissions\":\"*\"},\"craft\\\\elements\\\\Category\":{\"enabled\":\"1\",\"permissions\":\"*\"},\"craft\\\\elements\\\\Entry\":{\"enabled\":\"1\",\"permissions\":\"*\"},\"craft\\\\elements\\\\Tag\":{\"enabled\":\"\",\"permissions\":\"*\"},\"custom\":{\"enabled\":\"1\"},\"verbb\\\\navigation\\\\nodetypes\\\\PassiveType\":{\"enabled\":\"1\"}}','{\"18d78006-3985-4ea4-b620-67bae10d9c2d\":null}',NULL,'2021-03-30 11:13:52','2021-03-30 11:13:52','2021-03-30 14:28:25','f501c1e9-c078-458b-a8d8-8d96c7a66ae7'),(2,46,'Main Navigation','mainNavigation','',2,0,NULL,'{\"craft\\\\elements\\\\Asset\":{\"enabled\":\"1\",\"permissions\":\"*\"},\"craft\\\\elements\\\\Category\":{\"enabled\":\"1\",\"permissions\":\"*\"},\"craft\\\\elements\\\\Entry\":{\"enabled\":\"1\",\"permissions\":\"*\"},\"craft\\\\elements\\\\Tag\":{\"enabled\":\"\",\"permissions\":\"*\"},\"custom\":{\"enabled\":\"1\"},\"verbb\\\\navigation\\\\nodetypes\\\\PassiveType\":{\"enabled\":\"1\"}}','{\"18d78006-3985-4ea4-b620-67bae10d9c2d\":null}',NULL,'2021-03-31 11:37:11','2021-03-31 11:37:11',NULL,'8b5fa4d7-86cd-4e9b-b8d4-3731f1a60289'),(3,47,'Footer Navigation','footerNavigation','',3,0,NULL,'{\"craft\\\\elements\\\\Asset\":{\"enabled\":\"1\",\"permissions\":\"*\"},\"craft\\\\elements\\\\Category\":{\"enabled\":\"1\",\"permissions\":\"*\"},\"craft\\\\elements\\\\Entry\":{\"enabled\":\"1\",\"permissions\":\"*\"},\"craft\\\\elements\\\\Tag\":{\"enabled\":\"\",\"permissions\":\"*\"},\"custom\":{\"enabled\":\"1\"},\"verbb\\\\navigation\\\\nodetypes\\\\PassiveType\":{\"enabled\":\"1\"}}','{\"18d78006-3985-4ea4-b620-67bae10d9c2d\":null}',NULL,'2021-03-31 11:37:58','2021-03-31 11:37:58',NULL,'23255a47-8fcd-4ad9-8129-8bd0e89121e5');
/*!40000 ALTER TABLE `navigation_navs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `navigation_nodes`
--

LOCK TABLES `navigation_nodes` WRITE;
/*!40000 ALTER TABLE `navigation_nodes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `navigation_nodes` VALUES (42,14,1,NULL,NULL,'craft\\elements\\Entry',NULL,NULL,'[]','[]',0,1,'2021-03-30 11:14:00','2021-03-30 11:14:00','9df9dcfb-23f9-4dc3-8748-b1b68edd171a'),(43,17,1,NULL,NULL,'craft\\elements\\Entry',NULL,NULL,'[]','[]',0,1,'2021-03-30 11:14:00','2021-03-30 11:14:00','a5c0e50e-86b7-460c-b941-8dfa8280b03e'),(44,3,1,NULL,NULL,'craft\\elements\\Entry',NULL,NULL,'[]','[]',0,1,'2021-03-30 11:14:00','2021-03-30 11:14:00','c7aa675c-b983-440d-8861-0caef5ff8160'),(96,68,2,NULL,NULL,'craft\\elements\\Entry',NULL,NULL,'[]','[]',0,NULL,'2021-03-31 11:37:26','2021-03-31 11:37:26','842005ad-13de-4fbe-8517-f16d9590ce47'),(97,64,2,NULL,NULL,'craft\\elements\\Entry',NULL,NULL,'[]','[]',0,NULL,'2021-03-31 11:37:26','2021-03-31 11:37:26','0669a79b-83c3-49f1-a2fe-18a7e3639bc1'),(98,61,2,NULL,NULL,'craft\\elements\\Entry',NULL,NULL,'[]','[]',0,NULL,'2021-03-31 11:37:26','2021-03-31 11:37:26','30857ad6-c02d-4eff-9f4d-74e776ef2344'),(99,3,2,NULL,NULL,'craft\\elements\\Entry',NULL,NULL,'[]','[]',0,NULL,'2021-03-31 11:37:26','2021-03-31 11:37:26','ee277c19-712d-4f74-849f-678d166ea325'),(100,68,3,NULL,NULL,'craft\\elements\\Entry',NULL,NULL,'[]','[]',0,NULL,'2021-03-31 11:38:08','2021-03-31 11:38:08','c2acd8f2-4eaa-4cc2-93c9-8defa413ee40'),(101,64,3,NULL,NULL,'craft\\elements\\Entry',NULL,NULL,'[]','[]',0,NULL,'2021-03-31 11:38:08','2021-03-31 11:38:08','32430e31-648b-4960-81fd-b45ce8543c44'),(102,61,3,NULL,NULL,'craft\\elements\\Entry',NULL,NULL,'[]','[]',0,NULL,'2021-03-31 11:38:08','2021-03-31 11:38:08','c63812b3-d85e-47a8-8151-f6c7a617adbd'),(103,3,3,NULL,NULL,'craft\\elements\\Entry',NULL,NULL,'[]','[]',0,NULL,'2021-03-31 11:38:08','2021-03-31 11:38:08','b9fa6580-c496-44ce-8440-cdde98bb2c3e'),(108,94,2,NULL,NULL,'craft\\elements\\Entry',NULL,NULL,'[]','[]',0,NULL,'2021-03-31 13:07:33','2021-03-31 13:07:33','ce4e4ba3-5b4e-4ce9-8b1c-7d0a46492e1f'),(111,109,2,NULL,NULL,'craft\\elements\\Entry',NULL,NULL,'[]','[]',0,NULL,'2021-04-06 12:32:41','2021-04-06 12:32:41','519f17cb-aa7d-4af4-bba9-0546f3da0ed7');
/*!40000 ALTER TABLE `navigation_nodes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `neoblocks`
--

LOCK TABLES `neoblocks` WRITE;
/*!40000 ALTER TABLE `neoblocks` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `neoblocks` VALUES (7,3,NULL,18,3,1,0,'2021-03-30 10:33:15','2021-03-30 10:33:15','e947a931-8f1e-4439-aed3-7fd1c28a6d98'),(8,3,NULL,17,1,1,0,'2021-03-30 10:33:15','2021-03-30 10:33:15','246334b2-92ef-4c1b-ad38-19bb9bcb12be'),(9,3,NULL,17,2,2,0,'2021-03-30 10:33:15','2021-03-30 10:33:15','6f1b3604-d1e9-434e-9498-e9df2e52e4f0'),(11,10,NULL,18,3,1,NULL,'2021-03-30 10:33:15','2021-03-30 10:33:15','6e9cccc2-eb67-42f1-a060-7a38c6f28a5d'),(12,10,NULL,17,1,1,NULL,'2021-03-30 10:33:15','2021-03-30 10:33:15','77b29b0d-021f-4c19-b2ea-08f57ab564ea'),(13,10,NULL,17,2,2,NULL,'2021-03-30 10:33:15','2021-03-30 10:33:15','c82bba71-79da-41d0-bf5b-bed5d8bab5aa'),(20,17,NULL,18,3,1,1,'2021-03-30 11:07:21','2021-03-30 11:07:21','f9c3f6fb-daa1-4ee1-a3de-79d5e6809d87'),(21,17,NULL,17,2,1,1,'2021-03-30 11:07:21','2021-03-30 11:07:21','e3790097-73b0-49a2-9587-6890d0255def'),(23,22,NULL,18,3,1,NULL,'2021-03-30 11:07:21','2021-03-30 11:07:21','0c561e08-c672-4305-856e-52920667c6a6'),(24,22,NULL,17,2,1,NULL,'2021-03-30 11:07:21','2021-03-30 11:07:21','f5f961fe-13ad-4364-ad58-6dd206b33399'),(25,14,NULL,18,3,1,1,'2021-03-30 11:07:50','2021-03-30 11:07:50','e60261bc-a26e-452f-8197-410137b270b9'),(26,14,NULL,17,2,1,1,'2021-03-30 11:07:50','2021-03-30 11:07:50','f39b5088-24c0-41dc-8886-8446a696bced'),(28,27,NULL,18,3,1,NULL,'2021-03-30 11:07:50','2021-03-30 11:07:50','08931179-f986-4e69-a77d-7393e89e7e84'),(29,27,NULL,17,2,1,NULL,'2021-03-30 11:07:50','2021-03-30 11:07:50','d0cb772d-ccf7-49fa-ab54-70fa53c380e2'),(31,30,NULL,18,3,1,NULL,'2021-03-30 11:09:07','2021-03-30 11:09:07','d8708d32-bbb5-4484-9791-77ff3263f0b2'),(32,30,NULL,17,2,1,NULL,'2021-03-30 11:09:07','2021-03-30 11:09:07','fe099c12-d8ec-44bc-993e-ba38e985a6c8'),(34,33,NULL,18,3,1,NULL,'2021-03-30 11:09:29','2021-03-30 11:09:29','7c47c658-c90f-4b0d-88fb-42291b61de8a'),(35,33,NULL,17,2,1,NULL,'2021-03-30 11:09:29','2021-03-30 11:09:29','b9ba4c7d-2856-4776-bed7-d0d65f19d485'),(37,36,NULL,18,3,1,NULL,'2021-03-30 11:09:56','2021-03-30 11:09:56','d5592f3e-f2dd-43f8-99f3-fe8bc1c0d224'),(38,36,NULL,17,2,1,NULL,'2021-03-30 11:09:56','2021-03-30 11:09:56','6f3913ee-3b9b-41fb-a2e6-1b770e319058'),(40,39,NULL,18,3,1,NULL,'2021-03-30 11:10:02','2021-03-30 11:10:02','7da08b82-c869-4029-b3fa-78c6a9706db6'),(41,39,NULL,17,2,1,NULL,'2021-03-30 11:10:02','2021-03-30 11:10:02','88e09264-9496-4f0a-8bbd-d9fd360db5b4'),(50,3,NULL,18,3,1,NULL,'2021-03-30 14:58:55','2021-03-30 14:58:55','f02d6d3a-66b3-4ad2-86e7-6db4dfdff63f'),(51,3,NULL,17,1,1,NULL,'2021-03-30 14:58:55','2021-03-30 14:58:55','73d88f75-1755-4679-85fc-7b485afbca96'),(52,3,NULL,17,2,3,NULL,'2021-03-30 14:58:55','2021-03-30 14:58:55','23bbe08a-2ea2-42b9-a4ac-22f48fa49a5c'),(54,53,NULL,18,3,1,NULL,'2021-03-30 14:58:55','2021-03-30 14:58:55','b6437484-83c5-4143-81e3-3ca2dab13a9e'),(55,53,NULL,17,1,1,NULL,'2021-03-30 14:58:55','2021-03-30 14:58:55','2d9cb8d1-15b4-496c-bfab-975a9e2c6d46'),(56,53,NULL,17,2,2,NULL,'2021-03-30 14:58:55','2021-03-30 14:58:55','4b7d060e-607b-4888-8dd1-239a58333ac8'),(58,57,NULL,18,3,1,NULL,'2021-03-30 15:00:15','2021-03-30 15:00:15','bd15f99e-a75d-422f-84ac-3d78a1685a7f'),(59,57,NULL,17,1,1,NULL,'2021-03-30 15:00:15','2021-03-30 15:00:15','f7b09d50-ebe3-4a69-8d94-54a275cb6b70'),(60,57,NULL,17,2,2,NULL,'2021-03-30 15:00:15','2021-03-30 15:00:15','55cac05a-a009-4b83-ad5d-64f3cbc29e41'),(72,61,NULL,18,3,1,NULL,'2021-03-31 11:33:02','2021-03-31 11:33:02','d52a08fb-1014-4188-83e3-d0b4276be3d6'),(73,61,NULL,17,1,1,NULL,'2021-03-31 11:33:02','2021-03-31 11:33:02','f09fd7b0-6d6e-4d2f-a117-ef9119b74aaa'),(74,61,NULL,17,2,2,NULL,'2021-03-31 11:33:02','2021-03-31 11:33:02','f122450e-b5fa-4359-8514-4518eae237d1'),(76,75,NULL,18,3,1,NULL,'2021-03-31 11:33:02','2021-03-31 11:33:02','a41c472c-0674-46ab-a178-68bc1ed0eeee'),(77,75,NULL,17,1,1,NULL,'2021-03-31 11:33:02','2021-03-31 11:33:02','e3d9868b-c5fc-4636-b9f5-b30058a57cd4'),(78,75,NULL,17,2,2,NULL,'2021-03-31 11:33:02','2021-03-31 11:33:02','dbc6ec6b-867d-475c-83d7-b3d4cc42046d'),(79,64,NULL,18,3,1,NULL,'2021-03-31 11:33:39','2021-03-31 11:33:39','afe1b5f3-46a3-4155-95b9-59c5ff2bee1b'),(80,64,NULL,17,1,1,NULL,'2021-03-31 11:33:39','2021-03-31 11:33:39','de3e287b-f3b6-4fa1-be91-bec4d1ee5845'),(81,64,NULL,17,2,2,0,'2021-03-31 11:33:39','2021-03-31 11:33:39','efa2ca01-003a-4f2a-ace5-668f6f0d1a9e'),(83,82,NULL,18,3,1,NULL,'2021-03-31 11:33:39','2021-03-31 11:33:39','cadea40f-8f93-4585-9034-f5d850705c0f'),(84,82,NULL,17,1,1,NULL,'2021-03-31 11:33:39','2021-03-31 11:33:39','e9fc9d86-528b-40b7-8fff-d170c86e171c'),(85,82,NULL,17,2,2,NULL,'2021-03-31 11:33:39','2021-03-31 11:33:39','811b7060-5c7c-431b-b02e-34ecae1c6483'),(86,68,NULL,18,3,1,NULL,'2021-03-31 11:34:47','2021-03-31 11:34:47','a8329fda-51af-4f1a-afe3-3d7c46dab940'),(87,68,NULL,17,1,1,NULL,'2021-03-31 11:34:48','2021-03-31 11:34:48','05d7ac63-d134-4ed6-8241-094d7503aa8a'),(88,68,NULL,17,2,2,NULL,'2021-03-31 11:34:48','2021-03-31 11:34:48','409a2e9f-29dd-4e05-9b17-62c3ee4d5ee5'),(90,89,NULL,18,3,1,NULL,'2021-03-31 11:34:48','2021-03-31 11:34:48','a44f642e-8179-480c-b3b6-dd003dbc309d'),(91,89,NULL,17,1,1,NULL,'2021-03-31 11:34:48','2021-03-31 11:34:48','a606e70a-cbf8-44e4-b77e-ea8e1a8e3623'),(92,89,NULL,17,2,2,NULL,'2021-03-31 11:34:48','2021-03-31 11:34:48','f2442069-9eee-4e75-922e-b0c6cb6048f2'),(105,104,NULL,18,3,1,NULL,'2021-03-31 11:43:49','2021-03-31 11:43:49','98a9b4fb-da98-4198-ba42-56ace1f4ad8f'),(106,104,NULL,17,1,1,NULL,'2021-03-31 11:43:49','2021-03-31 11:43:49','b652a171-d010-4c01-a95b-65c30dcb141d'),(107,104,NULL,17,2,2,NULL,'2021-03-31 11:43:49','2021-03-31 11:43:49','964f9e89-de25-492c-a4e6-23e738c52ad0'),(118,117,NULL,18,3,1,NULL,'2021-04-06 15:37:49','2021-04-06 15:37:49','d0c56a41-cf19-4ffa-8a0a-5a7494d12b55'),(120,119,NULL,18,3,1,NULL,'2021-04-06 15:56:14','2021-04-06 15:56:14','ab4b2402-c25d-419e-8e27-af02780d49ef'),(121,119,NULL,17,1,1,NULL,'2021-04-06 15:56:14','2021-04-06 15:56:14','aef7b772-a450-4e23-811a-77e1e026d023'),(125,3,NULL,17,4,4,NULL,'2021-04-06 16:08:17','2021-04-06 16:08:17','f6e2bdee-abcc-467e-a0ee-531b796d5c72'),(127,126,NULL,18,3,1,NULL,'2021-04-06 16:08:17','2021-04-06 16:08:17','8ffb9ffb-3432-4104-a23e-93b3fe513b70'),(128,126,NULL,17,1,1,NULL,'2021-04-06 16:08:17','2021-04-06 16:08:17','393a7977-9f78-4cab-936e-ae2f2dcc40fb'),(129,126,NULL,17,2,2,NULL,'2021-04-06 16:08:17','2021-04-06 16:08:17','344572b9-01db-4753-b68b-9ee3a40210b7'),(130,126,NULL,17,4,3,NULL,'2021-04-06 16:08:17','2021-04-06 16:08:17','48269d46-13c6-40ca-a95c-f3227feac4d1'),(131,3,NULL,17,5,5,NULL,'2021-04-07 08:25:58','2021-04-07 08:25:58','cc0f192b-caa9-4854-8e42-a229748099f5'),(133,132,NULL,18,3,1,NULL,'2021-04-07 08:25:58','2021-04-07 08:25:58','9c5dbfc0-01f1-420a-9e9c-d4212cef43a4'),(134,132,NULL,17,1,1,NULL,'2021-04-07 08:25:58','2021-04-07 08:25:58','975f4bb5-6fb4-4324-b3f4-46d18405f3f5'),(135,132,NULL,17,2,2,NULL,'2021-04-07 08:25:58','2021-04-07 08:25:58','902e8e12-3539-4acd-a397-91b7249ef19a'),(136,132,NULL,17,4,3,NULL,'2021-04-07 08:25:58','2021-04-07 08:25:58','df8334cb-9a10-40d0-9964-d5b683f4d87a'),(137,132,NULL,17,5,4,NULL,'2021-04-07 08:25:58','2021-04-07 08:25:58','7dd9dae2-f6af-4086-b57e-9afbacce9222'),(138,3,NULL,17,6,6,NULL,'2021-04-07 08:54:20','2021-04-07 08:54:20','0e682827-9dad-4cfc-a34c-3345695da7d2'),(142,141,NULL,18,3,1,NULL,'2021-04-07 08:54:20','2021-04-07 08:54:20','725092ec-05eb-4b02-b7e2-c98960c13742'),(143,141,NULL,17,1,1,NULL,'2021-04-07 08:54:20','2021-04-07 08:54:20','3ca07a9e-43e2-484e-aa8b-6074e65a0ba6'),(144,141,NULL,17,2,2,NULL,'2021-04-07 08:54:20','2021-04-07 08:54:20','d3f6e44d-96d0-4c30-80fc-2cc16342b2fc'),(145,141,NULL,17,4,3,NULL,'2021-04-07 08:54:20','2021-04-07 08:54:20','cf36e831-280a-4300-b91e-676ae74debfc'),(146,141,NULL,17,5,4,NULL,'2021-04-07 08:54:20','2021-04-07 08:54:20','1358a560-167e-42fa-bb48-8631877ace92'),(147,141,NULL,17,6,5,NULL,'2021-04-07 08:54:20','2021-04-07 08:54:20','c90bd2d4-c757-4ec3-a439-454b581f83f2'),(152,151,NULL,18,3,1,NULL,'2021-04-07 09:24:33','2021-04-07 09:24:33','b0a104c8-b9a5-4ecc-8b82-f69454406dee'),(153,151,NULL,17,1,1,NULL,'2021-04-07 09:24:33','2021-04-07 09:24:33','5d6d9cb1-f46f-4b0b-a581-d7ccc81fd8e9'),(154,151,NULL,17,2,2,NULL,'2021-04-07 09:24:33','2021-04-07 09:24:33','db62e3ec-f465-442f-936b-5170178959c7'),(155,151,NULL,17,4,3,NULL,'2021-04-07 09:24:33','2021-04-07 09:24:33','0a472f9f-2dc9-4923-aa21-8297ecc04148'),(156,151,NULL,17,5,4,NULL,'2021-04-07 09:24:33','2021-04-07 09:24:33','6a2a1ed4-1f6d-4ba6-9701-36e9de9b648d'),(157,151,NULL,17,6,5,NULL,'2021-04-07 09:24:33','2021-04-07 09:24:33','dcca0258-6bec-4743-aebf-3427162ce5cd'),(163,162,NULL,18,3,1,NULL,'2021-04-07 09:31:18','2021-04-07 09:31:18','14d82a2a-859a-46c9-9ed1-97f0fc186b7d'),(164,162,NULL,17,1,1,NULL,'2021-04-07 09:31:18','2021-04-07 09:31:18','1486aa75-ec43-4856-99e0-3fe3738e0769'),(165,162,NULL,17,2,2,NULL,'2021-04-07 09:31:18','2021-04-07 09:31:18','3c88570f-7a37-4641-9713-8185003a62c6'),(166,162,NULL,17,4,3,NULL,'2021-04-07 09:31:18','2021-04-07 09:31:18','7ca280f2-0dad-40f2-a24e-13db18cf4d33'),(167,162,NULL,17,5,4,NULL,'2021-04-07 09:31:18','2021-04-07 09:31:18','badaaedb-db47-4ef2-bcbc-d7db9bccb989'),(169,162,NULL,17,6,5,NULL,'2021-04-07 09:31:18','2021-04-07 09:31:18','71c34108-d33b-4ec5-9f41-c2655aa4684b'),(175,174,NULL,18,3,1,NULL,'2021-04-07 09:42:14','2021-04-07 09:42:14','7921da5b-8ad3-4807-9c38-16e0e67e6f89'),(176,174,NULL,17,1,1,NULL,'2021-04-07 09:42:14','2021-04-07 09:42:14','8996460f-99fd-4f1e-a704-6a3cf627ef83'),(177,174,NULL,17,2,2,NULL,'2021-04-07 09:42:14','2021-04-07 09:42:14','63230ff6-5d9f-40ff-8310-7216f68e91ff'),(178,174,NULL,17,4,3,NULL,'2021-04-07 09:42:14','2021-04-07 09:42:14','a2d7d471-3f92-4152-a79a-80f7f1215aa5'),(179,174,NULL,17,5,4,NULL,'2021-04-07 09:42:14','2021-04-07 09:42:14','c21fa45b-3d49-474b-923b-770ed75e0d4d'),(181,174,NULL,17,6,5,NULL,'2021-04-07 09:42:14','2021-04-07 09:42:14','c42ab47c-1807-49be-955f-0f25517fcd79'),(185,3,NULL,17,7,2,NULL,'2021-04-07 09:55:25','2021-04-07 09:55:25','a67efabd-30db-4642-8c62-57587fc96979'),(189,188,NULL,18,3,1,NULL,'2021-04-07 09:55:25','2021-04-07 09:55:25','49f979b3-9328-46bb-a4ba-d4f3d8b104dd'),(190,188,NULL,17,1,1,NULL,'2021-04-07 09:55:25','2021-04-07 09:55:25','5c2104cc-a1d4-494d-9e72-a123144ecc04'),(191,188,NULL,17,7,2,NULL,'2021-04-07 09:55:25','2021-04-07 09:55:25','a58b4fde-5dd4-4231-8a26-4f1403b35c76'),(194,188,NULL,17,2,3,NULL,'2021-04-07 09:55:25','2021-04-07 09:55:25','3540f177-a6e1-45c7-a7ea-976ddc58441b'),(195,188,NULL,17,4,4,NULL,'2021-04-07 09:55:25','2021-04-07 09:55:25','5fb2f079-e8c7-45ff-b676-f3ff8dc61f33'),(196,188,NULL,17,5,5,NULL,'2021-04-07 09:55:25','2021-04-07 09:55:25','e7352769-7a17-430d-b49d-840436708cb1'),(198,188,NULL,17,6,6,NULL,'2021-04-07 09:55:25','2021-04-07 09:55:25','566348ad-334a-4581-8e97-8e541e3510bd');
/*!40000 ALTER TABLE `neoblocks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `neoblockstructures`
--

LOCK TABLES `neoblockstructures` WRITE;
/*!40000 ALTER TABLE `neoblockstructures` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `neoblockstructures` VALUES (3,3,10,1,18,'2021-03-30 10:33:18','2021-03-30 10:33:18','8adc4072-478c-47a0-9417-b88b497232a1'),(4,4,10,1,17,'2021-03-30 10:33:18','2021-03-30 10:33:18','e903c203-6ae4-4c63-9d82-b3ce0a8325a3'),(7,7,22,1,18,'2021-03-30 11:07:22','2021-03-30 11:07:22','2cd38d56-aef4-4afc-9706-37b7a803a7f8'),(8,8,22,1,17,'2021-03-30 11:07:22','2021-03-30 11:07:22','ca206d2a-a90c-435c-831a-e8c66a974065'),(11,11,27,1,18,'2021-03-30 11:07:51','2021-03-30 11:07:51','2788a2f2-95da-4db3-a308-9506b660e297'),(12,12,27,1,17,'2021-03-30 11:07:51','2021-03-30 11:07:51','a4caad72-8f84-40e1-8aa6-5309350a53d4'),(13,13,30,1,18,'2021-03-30 11:09:09','2021-03-30 11:09:09','4aacf04f-53a9-4ed3-a9b9-398e3295ed4a'),(14,14,30,1,17,'2021-03-30 11:09:09','2021-03-30 11:09:09','52928948-cb02-4dd0-8b86-c888f2ba8d3e'),(15,15,33,1,18,'2021-03-30 11:09:30','2021-03-30 11:09:30','d10a5ff8-4a1f-4123-9a67-8082e8818241'),(16,16,33,1,17,'2021-03-30 11:09:30','2021-03-30 11:09:30','91deb090-1fbc-4490-8a3a-fbdcf35191f8'),(17,17,36,1,18,'2021-03-30 11:09:57','2021-03-30 11:09:57','dadc61d2-dbb3-4502-9552-2a86fcb80e6b'),(18,18,36,1,17,'2021-03-30 11:09:57','2021-03-30 11:09:57','3f40b0d8-6e11-4b75-ae66-b3de79d49e54'),(19,19,39,1,18,'2021-03-30 11:10:04','2021-03-30 11:10:04','138a584f-e147-4e47-984a-ed73437f0d4c'),(20,20,39,1,17,'2021-03-30 11:10:04','2021-03-30 11:10:04','194d82ca-3e06-472d-aafe-dd3ded54cc80'),(23,24,14,1,18,'2021-03-30 14:30:19','2021-03-30 14:30:19','2867c3b8-bd30-4a81-baff-34af77603ef7'),(24,25,14,1,17,'2021-03-30 14:30:19','2021-03-30 14:30:19','0a1e9845-d0a2-4e46-8688-ef0c5d50e5c2'),(25,26,17,1,18,'2021-03-30 14:30:22','2021-03-30 14:30:22','d238bfd9-7c04-43f2-b47e-16eb63e04e89'),(26,27,17,1,17,'2021-03-30 14:30:22','2021-03-30 14:30:22','42350faf-1671-455e-809f-b94a958d7027'),(27,28,3,1,18,'2021-03-30 14:58:55','2021-03-30 14:58:55','06f383f7-ec7c-4087-b775-1bafba3c99c3'),(29,30,53,1,18,'2021-03-30 14:58:57','2021-03-30 14:58:57','fd85b364-92d9-4b6d-a2ed-43f30c212419'),(30,31,53,1,17,'2021-03-30 14:58:57','2021-03-30 14:58:57','1b054666-840c-4412-9148-ed3d1e619e8e'),(31,32,57,1,18,'2021-03-30 15:00:18','2021-03-30 15:00:18','c82e0082-d361-44ae-8e21-35824e47e8c8'),(32,33,57,1,17,'2021-03-30 15:00:18','2021-03-30 15:00:18','c6ff8ebc-e7c1-4c42-a7c3-c00a411b439d'),(33,34,61,1,18,'2021-03-31 11:33:02','2021-03-31 11:33:02','e1b128fa-69a2-4274-ab2c-7e0395bd3c23'),(34,35,61,1,17,'2021-03-31 11:33:02','2021-03-31 11:33:02','fa0c4be0-4312-495f-a1a1-8436bdc5f043'),(35,36,75,1,18,'2021-03-31 11:33:05','2021-03-31 11:33:05','ef0fd0d5-ecaf-4f85-a64a-cb887581c8ac'),(36,37,75,1,17,'2021-03-31 11:33:05','2021-03-31 11:33:05','e9b5bdd5-7554-4643-89a3-728edac85a23'),(37,38,64,1,18,'2021-03-31 11:33:39','2021-03-31 11:33:39','ee4f2b0b-90ca-475c-b7e0-7c0db0fd388a'),(39,40,82,1,18,'2021-03-31 11:33:41','2021-03-31 11:33:41','4fd78b36-57b6-4b0d-b023-fb6bab692210'),(40,41,82,1,17,'2021-03-31 11:33:41','2021-03-31 11:33:41','178e6d5f-650c-4b48-a750-a06b2f11d149'),(41,42,68,1,18,'2021-03-31 11:34:47','2021-03-31 11:34:47','44469e74-e949-4676-b5a5-67e16887c4fc'),(42,43,68,1,17,'2021-03-31 11:34:48','2021-03-31 11:34:48','6a28cb12-682e-4844-975d-e8511ea2037e'),(43,44,89,1,18,'2021-03-31 11:34:49','2021-03-31 11:34:49','9e16124f-cd74-4df0-9536-4faaadab4fc0'),(44,45,89,1,17,'2021-03-31 11:34:50','2021-03-31 11:34:50','8060e739-839e-46af-90ae-a13ce4bfda0d'),(45,48,104,1,18,'2021-03-31 11:43:51','2021-03-31 11:43:51','64f25619-48ec-4318-807c-19ad9e3bc5bb'),(46,49,104,1,17,'2021-03-31 11:43:51','2021-03-31 11:43:51','806cd1c1-10e7-4061-b164-f304e7ccd66f'),(47,50,117,1,18,'2021-04-06 15:37:51','2021-04-06 15:37:51','fa1334fd-d092-4cbb-9d2b-b135b3a35e49'),(48,51,64,1,17,'2021-04-06 15:56:14','2021-04-06 15:56:14','ec721840-2088-4b1d-a1d3-c289bef64743'),(49,52,119,1,18,'2021-04-06 15:56:16','2021-04-06 15:56:16','577c2020-6c0d-47f5-86ec-a2fdc384bf6f'),(50,53,119,1,17,'2021-04-06 15:56:16','2021-04-06 15:56:16','ab68c1d1-7e0d-4c1f-a9f2-37b47a12a27b'),(52,55,126,1,18,'2021-04-06 16:08:18','2021-04-06 16:08:18','7de87412-7170-4bdf-ae15-f83ed4a01135'),(53,56,126,1,17,'2021-04-06 16:08:18','2021-04-06 16:08:18','149b82a4-0f81-4d62-8a00-e1af879934cd'),(55,58,132,1,18,'2021-04-07 08:26:00','2021-04-07 08:26:00','309643c0-41d5-4979-9cc6-5a28a77f285e'),(56,59,132,1,17,'2021-04-07 08:26:00','2021-04-07 08:26:00','5a5eaca3-0250-4a53-af17-54281f0a31f2'),(58,61,141,1,18,'2021-04-07 08:54:22','2021-04-07 08:54:22','6a9b3d7c-3949-4a21-abb5-0613c7573d7d'),(59,62,141,1,17,'2021-04-07 08:54:22','2021-04-07 08:54:22','6edaa9fe-aece-4054-9116-037e509a0f96'),(60,63,151,1,18,'2021-04-07 09:24:35','2021-04-07 09:24:35','807e8d57-4ac7-41c5-b96d-119d93d38700'),(61,64,151,1,17,'2021-04-07 09:24:35','2021-04-07 09:24:35','9307e34b-aa60-4ecb-9f85-746f3e6c57ea'),(62,65,162,1,18,'2021-04-07 09:31:21','2021-04-07 09:31:21','458b6448-9359-4a24-bc65-e4fa4afaf1bc'),(63,66,162,1,17,'2021-04-07 09:31:21','2021-04-07 09:31:21','bb865ca4-77d7-4e29-80b8-198d883f966d'),(64,67,174,1,18,'2021-04-07 09:42:17','2021-04-07 09:42:17','0408e45a-a823-4786-b123-273e7a33c04c'),(65,68,174,1,17,'2021-04-07 09:42:17','2021-04-07 09:42:17','478e60b6-c413-4acc-b313-99eac7806ab9'),(66,69,3,1,17,'2021-04-07 09:55:25','2021-04-07 09:55:25','f586dccd-d730-491f-a6ea-39305e4ae166'),(67,70,188,1,18,'2021-04-07 09:55:28','2021-04-07 09:55:28','f55c5060-cb61-4b5e-856e-5df3c9b9a133'),(68,71,188,1,17,'2021-04-07 09:55:28','2021-04-07 09:55:28','7382b82b-caa6-4117-ae69-c7a0a8f512c4');
/*!40000 ALTER TABLE `neoblockstructures` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `neoblocktypegroups`
--

LOCK TABLES `neoblocktypegroups` WRITE;
/*!40000 ALTER TABLE `neoblocktypegroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `neoblocktypegroups` VALUES (1,17,'Media',1,'2021-03-30 09:41:28','2021-03-30 09:41:28','dcc7e763-cfad-42ba-a4ed-f0c111f2446b'),(2,17,'Blocks',5,'2021-03-30 09:41:28','2021-04-07 09:54:04','9c3f9dfb-fbb4-4ab1-b8db-5dc9b6045f2d');
/*!40000 ALTER TABLE `neoblocktypegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `neoblocktypes`
--

LOCK TABLES `neoblocktypes` WRITE;
/*!40000 ALTER TABLE `neoblocktypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `neoblocktypes` VALUES (1,17,4,'Copy','copy',0,0,0,'',1,2,'2021-03-30 09:41:28','2021-03-30 09:41:28','4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83'),(2,17,5,'Image','image',0,0,0,'',1,3,'2021-03-30 09:41:28','2021-03-30 09:41:28','f122d996-7ed0-4bc1-ad02-50e74deac2df'),(3,18,6,'Main Header','mainHeader',0,0,0,'',1,1,'2021-03-30 09:42:27','2021-03-30 09:42:27','1af5640c-d8b3-4503-89a1-8d0581554915'),(4,17,15,'Image Slider','imageSlider',0,0,0,'',1,6,'2021-04-06 16:08:06','2021-04-07 09:54:03','ecaf2e51-4a07-4d82-a78b-8181faba1e87'),(5,17,16,'Video','video',0,0,0,'',1,7,'2021-04-07 08:25:16','2021-04-07 09:54:03','ba88d9cd-1570-43ff-9e92-aa456cff2540'),(6,17,18,'Accordion','accordion',0,0,0,'',1,8,'2021-04-07 08:50:11','2021-04-07 09:54:03','8062a4c1-1fc1-482e-9121-c05e1d679599'),(7,17,23,'Button','button',0,0,0,'',1,4,'2021-04-07 09:53:32','2021-04-07 09:54:04','75e32298-2afc-42e4-a7a1-a0df691a9522');
/*!40000 ALTER TABLE `neoblocktypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `plugins` VALUES (1,'neo','2.9.5','2.8.16','trial',NULL,'2021-03-30 09:23:22','2021-03-30 09:23:22','2021-04-07 08:22:34','cad07713-6957-45e4-9438-f0caf451e14b'),(3,'buttonbox','2.0.4','1.0.0','unknown',NULL,'2021-03-30 09:26:37','2021-03-30 09:26:37','2021-04-07 08:22:34','44f05977-bb62-4bb0-a498-01a403fd74f4'),(4,'redactor','2.8.5','2.3.0','unknown',NULL,'2021-03-30 09:26:57','2021-03-30 09:26:57','2021-04-07 08:22:34','d49b778c-8031-4dde-a1d0-828c0616cb95'),(5,'super-table','2.6.7','2.2.1','unknown',NULL,'2021-03-30 09:27:19','2021-03-30 09:27:19','2021-04-07 08:22:34','26b97ad7-53cb-45d3-93e1-376de19fba6c'),(6,'seo','3.6.7','3.1.1','unknown',NULL,'2021-03-30 09:27:41','2021-03-30 09:27:41','2021-04-07 08:22:34','bfa9f957-774d-4bf0-ac79-0ee6a4d4553f'),(7,'aws-s3','1.2.11','1.2','unknown',NULL,'2021-03-30 09:28:07','2021-03-30 09:28:07','2021-04-07 08:22:34','39a8ef93-ba4d-4bda-810e-c8a74e0c879c'),(8,'navigation','1.4.15','1.0.21','trial',NULL,'2021-03-30 11:13:20','2021-03-30 11:13:20','2021-04-07 08:22:34','6b71802d-1bf0-4c44-889b-800d18212a6d'),(9,'freeform','3.10.11','3.3.0','trial',NULL,'2021-03-30 13:30:11','2021-03-30 13:30:11','2021-04-07 08:22:34','05f7bcfb-f377-4924-b867-599434fa1be0'),(10,'oembed','1.3.6','1.0.1','unknown',NULL,'2021-04-07 08:21:16','2021-04-07 08:21:16','2021-04-07 08:22:34','3cb8ef30-337a-463a-baa6-e7bf1e042caa');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `projectconfig` VALUES ('dateModified','1617789243'),('email.fromEmail','\"dev@fortytwo.studio\"'),('email.fromName','\"Future Forestry\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.0.autocapitalize','true'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.0.autocomplete','false'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.0.autocorrect','true'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.0.class','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.0.disabled','false'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.0.id','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.0.instructions','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.0.label','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.0.max','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.0.min','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.0.name','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.0.orientation','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.0.placeholder','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.0.readonly','false'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.0.requirable','false'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.0.size','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.0.step','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.0.tip','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.0.title','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.0.warning','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.0.width','100'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.1.fieldUid','\"d783368e-a494-4457-9e99-5a027ae72a18\"'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.1.instructions','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.1.label','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.1.required','false'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.1.tip','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.1.warning','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.1.width','100'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.2.fieldUid','\"1d1d5665-5674-4388-8d46-9b87e4dc65d3\"'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.2.instructions','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.2.label','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.2.required','false'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.2.tip','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.2.warning','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.2.width','100'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.name','\"Content\"'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.sortOrder','1'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.1.elements.0.fieldUid','\"39237593-ff51-4bd3-851a-a9dfac329c0b\"'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.1.elements.0.instructions','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.1.elements.0.label','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.1.elements.0.required','false'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.1.elements.0.tip','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.1.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.1.elements.0.warning','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.1.elements.0.width','100'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.1.elements.1.fieldUid','\"4184d945-e90d-4433-b1f3-727edf65107e\"'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.1.elements.1.instructions','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.1.elements.1.label','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.1.elements.1.required','false'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.1.elements.1.tip','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.1.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.1.elements.1.warning','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.1.elements.1.width','100'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.1.name','\"Summary\"'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.1.sortOrder','2'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.2.elements.0.fieldUid','\"7c5c4db7-bc5e-4979-a31b-6b7734989556\"'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.2.elements.0.instructions','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.2.elements.0.label','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.2.elements.0.required','false'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.2.elements.0.tip','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.2.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.2.elements.0.warning','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.2.elements.0.width','100'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.2.name','\"SEO\"'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.2.sortOrder','3'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.handle','\"homepage\"'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.hasTitleField','true'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.name','\"Homepage\"'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.section','\"32e8ea43-4e6d-46eb-9344-6755923c28de\"'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.sortOrder','1'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.titleFormat','\"{section.name|raw}\"'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.titleTranslationKeyFormat','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.titleTranslationMethod','\"site\"'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.0.elements.0.autocapitalize','true'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.0.elements.0.autocomplete','false'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.0.elements.0.autocorrect','true'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.0.elements.0.class','null'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.0.elements.0.disabled','false'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.0.elements.0.id','null'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.0.elements.0.instructions','null'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.0.elements.0.label','null'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.0.elements.0.max','null'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.0.elements.0.min','null'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.0.elements.0.name','null'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.0.elements.0.orientation','null'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.0.elements.0.placeholder','null'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.0.elements.0.readonly','false'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.0.elements.0.requirable','false'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.0.elements.0.size','null'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.0.elements.0.step','null'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.0.elements.0.tip','null'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.0.elements.0.title','null'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.0.elements.0.warning','null'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.0.elements.0.width','100'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.0.elements.1.fieldUid','\"d783368e-a494-4457-9e99-5a027ae72a18\"'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.0.elements.1.instructions','null'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.0.elements.1.label','null'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.0.elements.1.required','false'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.0.elements.1.tip','null'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.0.elements.1.warning','null'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.0.elements.1.width','100'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.0.name','\"Content\"'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.0.sortOrder','1'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.1.elements.0.fieldUid','\"39237593-ff51-4bd3-851a-a9dfac329c0b\"'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.1.elements.0.instructions','null'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.1.elements.0.label','null'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.1.elements.0.required','false'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.1.elements.0.tip','null'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.1.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.1.elements.0.warning','null'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.1.elements.0.width','100'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.1.elements.1.fieldUid','\"4184d945-e90d-4433-b1f3-727edf65107e\"'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.1.elements.1.instructions','null'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.1.elements.1.label','null'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.1.elements.1.required','false'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.1.elements.1.tip','null'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.1.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.1.elements.1.warning','null'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.1.elements.1.width','100'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.1.name','\"Summary\"'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.1.sortOrder','2'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.2.elements.0.fieldUid','\"7c5c4db7-bc5e-4979-a31b-6b7734989556\"'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.2.elements.0.instructions','null'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.2.elements.0.label','null'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.2.elements.0.required','false'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.2.elements.0.tip','null'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.2.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.2.elements.0.warning','null'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.2.elements.0.width','100'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.2.name','\"SEO\"'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.fieldLayouts.82acde96-0487-43ca-9551-550a19bde42f.tabs.2.sortOrder','3'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.handle','\"latestIndex\"'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.hasTitleField','true'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.name','\"Latest Index\"'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.section','\"2f28cd37-4b8e-4b68-806e-97ecc9f63d04\"'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.sortOrder','1'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.titleFormat','\"{section.name|raw}\"'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.titleTranslationKeyFormat','null'),('entryTypes.714a1c4f-39d2-4a93-b0fc-1d7089a16ff2.titleTranslationMethod','\"site\"'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.0.elements.0.autocapitalize','true'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.0.elements.0.autocomplete','false'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.0.elements.0.autocorrect','true'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.0.elements.0.class','null'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.0.elements.0.disabled','false'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.0.elements.0.id','null'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.0.elements.0.instructions','null'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.0.elements.0.label','null'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.0.elements.0.max','null'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.0.elements.0.min','null'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.0.elements.0.name','null'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.0.elements.0.orientation','null'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.0.elements.0.placeholder','null'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.0.elements.0.readonly','false'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.0.elements.0.requirable','false'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.0.elements.0.size','null'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.0.elements.0.step','null'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.0.elements.0.tip','null'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.0.elements.0.title','null'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.0.elements.0.warning','null'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.0.elements.0.width','100'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.0.elements.1.fieldUid','\"d783368e-a494-4457-9e99-5a027ae72a18\"'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.0.elements.1.instructions','null'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.0.elements.1.label','null'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.0.elements.1.required','false'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.0.elements.1.tip','null'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.0.elements.1.warning','null'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.0.elements.1.width','100'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.0.elements.2.fieldUid','\"1d1d5665-5674-4388-8d46-9b87e4dc65d3\"'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.0.elements.2.instructions','null'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.0.elements.2.label','null'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.0.elements.2.required','false'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.0.elements.2.tip','null'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.0.elements.2.warning','null'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.0.elements.2.width','100'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.0.name','\"Content\"'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.0.sortOrder','1'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.1.elements.0.fieldUid','\"39237593-ff51-4bd3-851a-a9dfac329c0b\"'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.1.elements.0.instructions','null'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.1.elements.0.label','null'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.1.elements.0.required','false'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.1.elements.0.tip','null'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.1.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.1.elements.0.warning','null'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.1.elements.0.width','100'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.1.elements.1.fieldUid','\"4184d945-e90d-4433-b1f3-727edf65107e\"'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.1.elements.1.instructions','null'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.1.elements.1.label','null'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.1.elements.1.required','false'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.1.elements.1.tip','null'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.1.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.1.elements.1.warning','null'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.1.elements.1.width','100'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.1.name','\"Summary\"'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.1.sortOrder','2'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.2.elements.0.fieldUid','\"7c5c4db7-bc5e-4979-a31b-6b7734989556\"'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.2.elements.0.instructions','null'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.2.elements.0.label','null'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.2.elements.0.required','false'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.2.elements.0.tip','null'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.2.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.2.elements.0.warning','null'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.2.elements.0.width','100'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.2.name','\"SEO\"'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.fieldLayouts.7834aadb-497b-49cf-849b-b919602283d9.tabs.2.sortOrder','3'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.handle','\"contact\"'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.hasTitleField','true'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.name','\"Contact\"'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.section','\"f1abfa1e-3f54-4765-8991-815c87484c9b\"'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.sortOrder','1'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.titleFormat','\"{section.name|raw}\"'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.titleTranslationKeyFormat','null'),('entryTypes.76ee93ec-459e-4fa9-967f-aa9b48f7b9e1.titleTranslationMethod','\"site\"'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.0.elements.0.autocapitalize','true'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.0.elements.0.autocomplete','false'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.0.elements.0.autocorrect','true'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.0.elements.0.class','null'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.0.elements.0.disabled','false'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.0.elements.0.id','null'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.0.elements.0.instructions','null'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.0.elements.0.label','null'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.0.elements.0.max','null'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.0.elements.0.min','null'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.0.elements.0.name','null'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.0.elements.0.orientation','null'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.0.elements.0.placeholder','null'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.0.elements.0.readonly','false'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.0.elements.0.requirable','false'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.0.elements.0.size','null'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.0.elements.0.step','null'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.0.elements.0.tip','null'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.0.elements.0.title','null'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.0.elements.0.warning','null'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.0.elements.0.width','100'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.0.elements.1.fieldUid','\"2f64efd3-101a-4ed1-a31e-96657d6dc6e5\"'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.0.elements.1.instructions','null'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.0.elements.1.label','null'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.0.elements.1.required','false'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.0.elements.1.tip','null'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.0.elements.1.warning','null'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.0.elements.1.width','100'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.0.elements.2.fieldUid','\"1d1c9f28-39de-4df6-b077-856d16c001ca\"'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.0.elements.2.instructions','null'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.0.elements.2.label','null'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.0.elements.2.required','false'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.0.elements.2.tip','null'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.0.elements.2.warning','null'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.0.elements.2.width','100'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.0.name','\"Content\"'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.0.sortOrder','1'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.1.elements.0.fieldUid','\"39237593-ff51-4bd3-851a-a9dfac329c0b\"'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.1.elements.0.instructions','null'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.1.elements.0.label','null'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.1.elements.0.required','false'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.1.elements.0.tip','null'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.1.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.1.elements.0.warning','null'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.1.elements.0.width','100'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.1.elements.1.fieldUid','\"4184d945-e90d-4433-b1f3-727edf65107e\"'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.1.elements.1.instructions','null'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.1.elements.1.label','null'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.1.elements.1.required','false'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.1.elements.1.tip','null'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.1.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.1.elements.1.warning','null'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.1.elements.1.width','100'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.1.name','\"Summary\"'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.1.sortOrder','2'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.2.elements.0.fieldUid','\"7c5c4db7-bc5e-4979-a31b-6b7734989556\"'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.2.elements.0.instructions','null'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.2.elements.0.label','null'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.2.elements.0.required','false'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.2.elements.0.tip','null'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.2.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.2.elements.0.warning','null'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.2.elements.0.width','100'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.2.name','\"SEO\"'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.fieldLayouts.7dbf399e-3c1f-423e-a751-ddc09e73f155.tabs.2.sortOrder','3'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.handle','\"latest\"'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.hasTitleField','true'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.name','\"Latest\"'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.section','\"ddd7384c-d723-4aad-b2f6-845216bb1dbf\"'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.sortOrder','1'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.titleFormat','null'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.titleTranslationKeyFormat','null'),('entryTypes.d305657a-b071-42af-960e-aa7b81715a02.titleTranslationMethod','\"site\"'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.0.elements.0.autocapitalize','true'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.0.elements.0.autocomplete','false'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.0.elements.0.autocorrect','true'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.0.elements.0.class','null'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.0.elements.0.disabled','false'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.0.elements.0.id','null'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.0.elements.0.instructions','null'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.0.elements.0.label','null'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.0.elements.0.max','null'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.0.elements.0.min','null'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.0.elements.0.name','null'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.0.elements.0.orientation','null'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.0.elements.0.placeholder','null'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.0.elements.0.readonly','false'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.0.elements.0.requirable','false'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.0.elements.0.size','null'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.0.elements.0.step','null'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.0.elements.0.tip','null'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.0.elements.0.title','null'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.0.elements.0.warning','null'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.0.elements.0.width','100'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.0.elements.1.fieldUid','\"d783368e-a494-4457-9e99-5a027ae72a18\"'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.0.elements.1.instructions','null'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.0.elements.1.label','null'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.0.elements.1.required','false'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.0.elements.1.tip','null'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.0.elements.1.warning','null'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.0.elements.1.width','100'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.0.elements.2.fieldUid','\"1d1d5665-5674-4388-8d46-9b87e4dc65d3\"'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.0.elements.2.instructions','null'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.0.elements.2.label','null'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.0.elements.2.required','false'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.0.elements.2.tip','null'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.0.elements.2.warning','null'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.0.elements.2.width','100'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.0.name','\"Content\"'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.0.sortOrder','1'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.1.elements.0.fieldUid','\"39237593-ff51-4bd3-851a-a9dfac329c0b\"'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.1.elements.0.instructions','null'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.1.elements.0.label','null'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.1.elements.0.required','false'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.1.elements.0.tip','null'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.1.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.1.elements.0.warning','null'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.1.elements.0.width','100'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.1.elements.1.fieldUid','\"4184d945-e90d-4433-b1f3-727edf65107e\"'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.1.elements.1.instructions','null'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.1.elements.1.label','null'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.1.elements.1.required','false'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.1.elements.1.tip','null'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.1.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.1.elements.1.warning','null'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.1.elements.1.width','100'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.1.name','\"Summary\"'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.1.sortOrder','2'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.2.elements.0.fieldUid','\"7c5c4db7-bc5e-4979-a31b-6b7734989556\"'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.2.elements.0.instructions','null'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.2.elements.0.label','null'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.2.elements.0.required','false'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.2.elements.0.tip','null'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.2.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.2.elements.0.warning','null'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.2.elements.0.width','100'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.2.name','\"SEO\"'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.fieldLayouts.655e373b-851f-4c7a-b8bb-0dc97e099268.tabs.2.sortOrder','3'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.handle','\"about\"'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.hasTitleField','true'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.name','\"About\"'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.section','\"b8e69404-8329-47fa-8f41-a98c933804c3\"'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.sortOrder','1'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.titleFormat','\"{section.name|raw}\"'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.titleTranslationKeyFormat','null'),('entryTypes.f6901440-dc45-4323-a125-0a7d3d90f06c.titleTranslationMethod','\"site\"'),('fieldGroups.431efb4a-9ace-451f-8b70-aeda20b1f83f.name','\"Globals\"'),('fieldGroups.6b6833e3-09b6-4302-8492-fd06e3f794e4.name','\"Summary\"'),('fieldGroups.70f3e289-0ffa-4d8a-a2a4-e8c6db06ee3c.name','\"Content Builder Fields\"'),('fieldGroups.7bbeec1d-6526-44a3-9897-d6d1e5918a05.name','\"Settings\"'),('fieldGroups.8f3d51d8-227c-42c1-b81e-f3cba4189a99.name','\"SEO\"'),('fieldGroups.b4718bab-e938-4b97-a8e4-adc9fe5f4ca7.name','\"Content Builder\"'),('fieldGroups.eb7f69a9-9a89-4024-ba3f-9154d28ac58c.name','\"Common\"'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.contentColumnType','\"string\"'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.fieldGroup','\"70f3e289-0ffa-4d8a-a2a4-e8c6db06ee3c\"'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.handle','\"image\"'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.instructions','\"\"'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.name','\"Image\"'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.searchable','false'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.settings.allowedKinds.0','\"image\"'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.settings.allowSelfRelations','false'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.settings.allowUploads','true'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.settings.defaultUploadLocationSource','\"volume:27b00051-5d7e-4c72-8d4c-37eb325f3071\"'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.settings.defaultUploadLocationSubpath','\"\"'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.settings.limit','\"1\"'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.settings.localizeRelations','false'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.settings.previewMode','\"full\"'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.settings.restrictFiles','\"1\"'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.settings.selectionLabel','\"\"'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.settings.showSiteMenu','true'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.settings.showUnpermittedFiles','false'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.settings.showUnpermittedVolumes','false'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.settings.singleUploadLocationSource','\"volume:27b00051-5d7e-4c72-8d4c-37eb325f3071\"'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.settings.singleUploadLocationSubpath','\"\"'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.settings.source','null'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.settings.sources','\"*\"'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.settings.targetSiteId','null'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.settings.useSingleFolder','false'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.settings.validateRelatedElements','false'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.settings.viewMode','\"list\"'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.translationKeyFormat','null'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.translationMethod','\"site\"'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.type','\"craft\\\\fields\\\\Assets\"'),('fields.13d35453-527a-4094-b642-42292f193f8c.contentColumnType','\"string\"'),('fields.13d35453-527a-4094-b642-42292f193f8c.fieldGroup','\"431efb4a-9ace-451f-8b70-aeda20b1f83f\"'),('fields.13d35453-527a-4094-b642-42292f193f8c.handle','\"socialProfiles\"'),('fields.13d35453-527a-4094-b642-42292f193f8c.instructions','\"\"'),('fields.13d35453-527a-4094-b642-42292f193f8c.name','\"Social Profiles\"'),('fields.13d35453-527a-4094-b642-42292f193f8c.searchable','false'),('fields.13d35453-527a-4094-b642-42292f193f8c.settings.columns.__assoc__.0.0','\"f63d3738-c5aa-4de0-84fd-0deb6570d894\"'),('fields.13d35453-527a-4094-b642-42292f193f8c.settings.columns.__assoc__.0.1.__assoc__.0.0','\"width\"'),('fields.13d35453-527a-4094-b642-42292f193f8c.settings.columns.__assoc__.0.1.__assoc__.0.1','\"\"'),('fields.13d35453-527a-4094-b642-42292f193f8c.settings.columns.__assoc__.1.0','\"3037eaf7-b2d6-4e6f-b616-b9911cf6f5c2\"'),('fields.13d35453-527a-4094-b642-42292f193f8c.settings.columns.__assoc__.1.1.__assoc__.0.0','\"width\"'),('fields.13d35453-527a-4094-b642-42292f193f8c.settings.columns.__assoc__.1.1.__assoc__.0.1','\"\"'),('fields.13d35453-527a-4094-b642-42292f193f8c.settings.columns.__assoc__.2.0','\"0b7ca9a0-694c-4733-bfee-d1c56b3aa669\"'),('fields.13d35453-527a-4094-b642-42292f193f8c.settings.columns.__assoc__.2.1.__assoc__.0.0','\"width\"'),('fields.13d35453-527a-4094-b642-42292f193f8c.settings.columns.__assoc__.2.1.__assoc__.0.1','\"\"'),('fields.13d35453-527a-4094-b642-42292f193f8c.settings.columns.__assoc__.3.0','\"d960a7c1-c036-40d9-b547-47325ed6c97b\"'),('fields.13d35453-527a-4094-b642-42292f193f8c.settings.columns.__assoc__.3.1.__assoc__.0.0','\"width\"'),('fields.13d35453-527a-4094-b642-42292f193f8c.settings.columns.__assoc__.3.1.__assoc__.0.1','\"\"'),('fields.13d35453-527a-4094-b642-42292f193f8c.settings.contentTable','\"{{%stc_socialprofiles}}\"'),('fields.13d35453-527a-4094-b642-42292f193f8c.settings.fieldLayout','\"table\"'),('fields.13d35453-527a-4094-b642-42292f193f8c.settings.maxRows','\"\"'),('fields.13d35453-527a-4094-b642-42292f193f8c.settings.minRows','\"\"'),('fields.13d35453-527a-4094-b642-42292f193f8c.settings.placeholderKey','null'),('fields.13d35453-527a-4094-b642-42292f193f8c.settings.propagationMethod','\"all\"'),('fields.13d35453-527a-4094-b642-42292f193f8c.settings.selectionLabel','\"\"'),('fields.13d35453-527a-4094-b642-42292f193f8c.settings.staticField','\"\"'),('fields.13d35453-527a-4094-b642-42292f193f8c.translationKeyFormat','null'),('fields.13d35453-527a-4094-b642-42292f193f8c.translationMethod','\"site\"'),('fields.13d35453-527a-4094-b642-42292f193f8c.type','\"verbb\\\\supertable\\\\fields\\\\SuperTableField\"'),('fields.181f8d87-6d88-42ed-96e8-26a3a728eef8.contentColumnType','\"string\"'),('fields.181f8d87-6d88-42ed-96e8-26a3a728eef8.fieldGroup','\"70f3e289-0ffa-4d8a-a2a4-e8c6db06ee3c\"'),('fields.181f8d87-6d88-42ed-96e8-26a3a728eef8.handle','\"images\"'),('fields.181f8d87-6d88-42ed-96e8-26a3a728eef8.instructions','\"\"'),('fields.181f8d87-6d88-42ed-96e8-26a3a728eef8.name','\"Images\"'),('fields.181f8d87-6d88-42ed-96e8-26a3a728eef8.searchable','false'),('fields.181f8d87-6d88-42ed-96e8-26a3a728eef8.settings.allowedKinds.0','\"image\"'),('fields.181f8d87-6d88-42ed-96e8-26a3a728eef8.settings.allowSelfRelations','false'),('fields.181f8d87-6d88-42ed-96e8-26a3a728eef8.settings.allowUploads','true'),('fields.181f8d87-6d88-42ed-96e8-26a3a728eef8.settings.defaultUploadLocationSource','\"\"'),('fields.181f8d87-6d88-42ed-96e8-26a3a728eef8.settings.defaultUploadLocationSubpath','\"\"'),('fields.181f8d87-6d88-42ed-96e8-26a3a728eef8.settings.limit','\"\"'),('fields.181f8d87-6d88-42ed-96e8-26a3a728eef8.settings.localizeRelations','false'),('fields.181f8d87-6d88-42ed-96e8-26a3a728eef8.settings.previewMode','\"full\"'),('fields.181f8d87-6d88-42ed-96e8-26a3a728eef8.settings.restrictFiles','\"1\"'),('fields.181f8d87-6d88-42ed-96e8-26a3a728eef8.settings.selectionLabel','\"\"'),('fields.181f8d87-6d88-42ed-96e8-26a3a728eef8.settings.showSiteMenu','false'),('fields.181f8d87-6d88-42ed-96e8-26a3a728eef8.settings.showUnpermittedFiles','false'),('fields.181f8d87-6d88-42ed-96e8-26a3a728eef8.settings.showUnpermittedVolumes','false'),('fields.181f8d87-6d88-42ed-96e8-26a3a728eef8.settings.singleUploadLocationSource','\"\"'),('fields.181f8d87-6d88-42ed-96e8-26a3a728eef8.settings.singleUploadLocationSubpath','\"\"'),('fields.181f8d87-6d88-42ed-96e8-26a3a728eef8.settings.source','null'),('fields.181f8d87-6d88-42ed-96e8-26a3a728eef8.settings.sources','\"*\"'),('fields.181f8d87-6d88-42ed-96e8-26a3a728eef8.settings.targetSiteId','null'),('fields.181f8d87-6d88-42ed-96e8-26a3a728eef8.settings.useSingleFolder','false'),('fields.181f8d87-6d88-42ed-96e8-26a3a728eef8.settings.validateRelatedElements','false'),('fields.181f8d87-6d88-42ed-96e8-26a3a728eef8.settings.viewMode','\"list\"'),('fields.181f8d87-6d88-42ed-96e8-26a3a728eef8.translationKeyFormat','null'),('fields.181f8d87-6d88-42ed-96e8-26a3a728eef8.translationMethod','\"site\"'),('fields.181f8d87-6d88-42ed-96e8-26a3a728eef8.type','\"craft\\\\fields\\\\Assets\"'),('fields.1d1c9f28-39de-4df6-b077-856d16c001ca.contentColumnType','\"text\"'),('fields.1d1c9f28-39de-4df6-b077-856d16c001ca.fieldGroup','\"70f3e289-0ffa-4d8a-a2a4-e8c6db06ee3c\"'),('fields.1d1c9f28-39de-4df6-b077-856d16c001ca.handle','\"copy\"'),('fields.1d1c9f28-39de-4df6-b077-856d16c001ca.instructions','\"\"'),('fields.1d1c9f28-39de-4df6-b077-856d16c001ca.name','\"Copy\"'),('fields.1d1c9f28-39de-4df6-b077-856d16c001ca.searchable','false'),('fields.1d1c9f28-39de-4df6-b077-856d16c001ca.settings.availableTransforms','\"*\"'),('fields.1d1c9f28-39de-4df6-b077-856d16c001ca.settings.availableVolumes','\"*\"'),('fields.1d1c9f28-39de-4df6-b077-856d16c001ca.settings.cleanupHtml','true'),('fields.1d1c9f28-39de-4df6-b077-856d16c001ca.settings.columnType','\"text\"'),('fields.1d1c9f28-39de-4df6-b077-856d16c001ca.settings.configSelectionMode','\"choose\"'),('fields.1d1c9f28-39de-4df6-b077-856d16c001ca.settings.defaultTransform','\"\"'),('fields.1d1c9f28-39de-4df6-b077-856d16c001ca.settings.manualConfig','\"\"'),('fields.1d1c9f28-39de-4df6-b077-856d16c001ca.settings.purifierConfig','\"\"'),('fields.1d1c9f28-39de-4df6-b077-856d16c001ca.settings.purifyHtml','\"1\"'),('fields.1d1c9f28-39de-4df6-b077-856d16c001ca.settings.redactorConfig','\"\"'),('fields.1d1c9f28-39de-4df6-b077-856d16c001ca.settings.removeEmptyTags','\"1\"'),('fields.1d1c9f28-39de-4df6-b077-856d16c001ca.settings.removeInlineStyles','\"1\"'),('fields.1d1c9f28-39de-4df6-b077-856d16c001ca.settings.removeNbsp','\"1\"'),('fields.1d1c9f28-39de-4df6-b077-856d16c001ca.settings.showHtmlButtonForNonAdmins','\"\"'),('fields.1d1c9f28-39de-4df6-b077-856d16c001ca.settings.showUnpermittedFiles','false'),('fields.1d1c9f28-39de-4df6-b077-856d16c001ca.settings.showUnpermittedVolumes','false'),('fields.1d1c9f28-39de-4df6-b077-856d16c001ca.settings.uiMode','\"enlarged\"'),('fields.1d1c9f28-39de-4df6-b077-856d16c001ca.translationKeyFormat','null'),('fields.1d1c9f28-39de-4df6-b077-856d16c001ca.translationMethod','\"none\"'),('fields.1d1c9f28-39de-4df6-b077-856d16c001ca.type','\"craft\\\\redactor\\\\Field\"'),('fields.1d1d5665-5674-4388-8d46-9b87e4dc65d3.contentColumnType','\"string\"'),('fields.1d1d5665-5674-4388-8d46-9b87e4dc65d3.fieldGroup','\"b4718bab-e938-4b97-a8e4-adc9fe5f4ca7\"'),('fields.1d1d5665-5674-4388-8d46-9b87e4dc65d3.handle','\"contentBuilder\"'),('fields.1d1d5665-5674-4388-8d46-9b87e4dc65d3.instructions','\"\"'),('fields.1d1d5665-5674-4388-8d46-9b87e4dc65d3.name','\"Content Builder\"'),('fields.1d1d5665-5674-4388-8d46-9b87e4dc65d3.searchable','false'),('fields.1d1d5665-5674-4388-8d46-9b87e4dc65d3.settings.maxBlocks','\"\"'),('fields.1d1d5665-5674-4388-8d46-9b87e4dc65d3.settings.maxLevels','\"\"'),('fields.1d1d5665-5674-4388-8d46-9b87e4dc65d3.settings.maxTopBlocks','\"\"'),('fields.1d1d5665-5674-4388-8d46-9b87e4dc65d3.settings.minBlocks','\"\"'),('fields.1d1d5665-5674-4388-8d46-9b87e4dc65d3.settings.propagationMethod','\"all\"'),('fields.1d1d5665-5674-4388-8d46-9b87e4dc65d3.settings.wasModified','true'),('fields.1d1d5665-5674-4388-8d46-9b87e4dc65d3.translationKeyFormat','null'),('fields.1d1d5665-5674-4388-8d46-9b87e4dc65d3.translationMethod','\"site\"'),('fields.1d1d5665-5674-4388-8d46-9b87e4dc65d3.type','\"benf\\\\neo\\\\Field\"'),('fields.2f64efd3-101a-4ed1-a31e-96657d6dc6e5.contentColumnType','\"text\"'),('fields.2f64efd3-101a-4ed1-a31e-96657d6dc6e5.fieldGroup','\"70f3e289-0ffa-4d8a-a2a4-e8c6db06ee3c\"'),('fields.2f64efd3-101a-4ed1-a31e-96657d6dc6e5.handle','\"header\"'),('fields.2f64efd3-101a-4ed1-a31e-96657d6dc6e5.instructions','\"\"'),('fields.2f64efd3-101a-4ed1-a31e-96657d6dc6e5.name','\"Header\"'),('fields.2f64efd3-101a-4ed1-a31e-96657d6dc6e5.searchable','false'),('fields.2f64efd3-101a-4ed1-a31e-96657d6dc6e5.settings.byteLimit','null'),('fields.2f64efd3-101a-4ed1-a31e-96657d6dc6e5.settings.charLimit','null'),('fields.2f64efd3-101a-4ed1-a31e-96657d6dc6e5.settings.code','\"\"'),('fields.2f64efd3-101a-4ed1-a31e-96657d6dc6e5.settings.columnType','null'),('fields.2f64efd3-101a-4ed1-a31e-96657d6dc6e5.settings.initialRows','\"4\"'),('fields.2f64efd3-101a-4ed1-a31e-96657d6dc6e5.settings.multiline','\"\"'),('fields.2f64efd3-101a-4ed1-a31e-96657d6dc6e5.settings.placeholder','null'),('fields.2f64efd3-101a-4ed1-a31e-96657d6dc6e5.settings.uiMode','\"normal\"'),('fields.2f64efd3-101a-4ed1-a31e-96657d6dc6e5.translationKeyFormat','null'),('fields.2f64efd3-101a-4ed1-a31e-96657d6dc6e5.translationMethod','\"none\"'),('fields.2f64efd3-101a-4ed1-a31e-96657d6dc6e5.type','\"craft\\\\fields\\\\PlainText\"'),('fields.336f207f-f4fb-43c3-bbc3-f10b641e940a.contentColumnType','\"text\"'),('fields.336f207f-f4fb-43c3-bbc3-f10b641e940a.fieldGroup','\"7bbeec1d-6526-44a3-9897-d6d1e5918a05\"'),('fields.336f207f-f4fb-43c3-bbc3-f10b641e940a.handle','\"backgroundColor\"'),('fields.336f207f-f4fb-43c3-bbc3-f10b641e940a.instructions','\"\"'),('fields.336f207f-f4fb-43c3-bbc3-f10b641e940a.name','\"Background Color\"'),('fields.336f207f-f4fb-43c3-bbc3-f10b641e940a.searchable','false'),('fields.336f207f-f4fb-43c3-bbc3-f10b641e940a.settings.options.0.__assoc__.0.0','\"label\"'),('fields.336f207f-f4fb-43c3-bbc3-f10b641e940a.settings.options.0.__assoc__.0.1','\"White\"'),('fields.336f207f-f4fb-43c3-bbc3-f10b641e940a.settings.options.0.__assoc__.1.0','\"value\"'),('fields.336f207f-f4fb-43c3-bbc3-f10b641e940a.settings.options.0.__assoc__.1.1','\"bg-white\"'),('fields.336f207f-f4fb-43c3-bbc3-f10b641e940a.settings.options.0.__assoc__.2.0','\"cssColour\"'),('fields.336f207f-f4fb-43c3-bbc3-f10b641e940a.settings.options.0.__assoc__.2.1','\"#FFFFFF\"'),('fields.336f207f-f4fb-43c3-bbc3-f10b641e940a.settings.options.0.__assoc__.3.0','\"default\"'),('fields.336f207f-f4fb-43c3-bbc3-f10b641e940a.settings.options.0.__assoc__.3.1','\"1\"'),('fields.336f207f-f4fb-43c3-bbc3-f10b641e940a.settings.options.1.__assoc__.0.0','\"label\"'),('fields.336f207f-f4fb-43c3-bbc3-f10b641e940a.settings.options.1.__assoc__.0.1','\"Black\"'),('fields.336f207f-f4fb-43c3-bbc3-f10b641e940a.settings.options.1.__assoc__.1.0','\"value\"'),('fields.336f207f-f4fb-43c3-bbc3-f10b641e940a.settings.options.1.__assoc__.1.1','\"bg-black\"'),('fields.336f207f-f4fb-43c3-bbc3-f10b641e940a.settings.options.1.__assoc__.2.0','\"cssColour\"'),('fields.336f207f-f4fb-43c3-bbc3-f10b641e940a.settings.options.1.__assoc__.2.1','\"#000000\"'),('fields.336f207f-f4fb-43c3-bbc3-f10b641e940a.settings.options.1.__assoc__.3.0','\"default\"'),('fields.336f207f-f4fb-43c3-bbc3-f10b641e940a.settings.options.1.__assoc__.3.1','\"\"'),('fields.336f207f-f4fb-43c3-bbc3-f10b641e940a.translationKeyFormat','null'),('fields.336f207f-f4fb-43c3-bbc3-f10b641e940a.translationMethod','\"none\"'),('fields.336f207f-f4fb-43c3-bbc3-f10b641e940a.type','\"supercool\\\\buttonbox\\\\fields\\\\Colours\"'),('fields.386e1cf1-acc9-4336-90e1-fb74daefd6f5.contentColumnType','\"text\"'),('fields.386e1cf1-acc9-4336-90e1-fb74daefd6f5.fieldGroup','\"431efb4a-9ace-451f-8b70-aeda20b1f83f\"'),('fields.386e1cf1-acc9-4336-90e1-fb74daefd6f5.handle','\"phoneNumber\"'),('fields.386e1cf1-acc9-4336-90e1-fb74daefd6f5.instructions','\"\"'),('fields.386e1cf1-acc9-4336-90e1-fb74daefd6f5.name','\"Phone Number\"'),('fields.386e1cf1-acc9-4336-90e1-fb74daefd6f5.searchable','false'),('fields.386e1cf1-acc9-4336-90e1-fb74daefd6f5.settings.byteLimit','null'),('fields.386e1cf1-acc9-4336-90e1-fb74daefd6f5.settings.charLimit','null'),('fields.386e1cf1-acc9-4336-90e1-fb74daefd6f5.settings.code','\"\"'),('fields.386e1cf1-acc9-4336-90e1-fb74daefd6f5.settings.columnType','null'),('fields.386e1cf1-acc9-4336-90e1-fb74daefd6f5.settings.initialRows','\"4\"'),('fields.386e1cf1-acc9-4336-90e1-fb74daefd6f5.settings.multiline','\"\"'),('fields.386e1cf1-acc9-4336-90e1-fb74daefd6f5.settings.placeholder','null'),('fields.386e1cf1-acc9-4336-90e1-fb74daefd6f5.settings.uiMode','\"normal\"'),('fields.386e1cf1-acc9-4336-90e1-fb74daefd6f5.translationKeyFormat','null'),('fields.386e1cf1-acc9-4336-90e1-fb74daefd6f5.translationMethod','\"none\"'),('fields.386e1cf1-acc9-4336-90e1-fb74daefd6f5.type','\"craft\\\\fields\\\\PlainText\"'),('fields.39237593-ff51-4bd3-851a-a9dfac329c0b.contentColumnType','\"text\"'),('fields.39237593-ff51-4bd3-851a-a9dfac329c0b.fieldGroup','\"6b6833e3-09b6-4302-8492-fd06e3f794e4\"'),('fields.39237593-ff51-4bd3-851a-a9dfac329c0b.handle','\"pageSummary\"'),('fields.39237593-ff51-4bd3-851a-a9dfac329c0b.instructions','\"\"'),('fields.39237593-ff51-4bd3-851a-a9dfac329c0b.name','\"Page Summary\"'),('fields.39237593-ff51-4bd3-851a-a9dfac329c0b.searchable','false'),('fields.39237593-ff51-4bd3-851a-a9dfac329c0b.settings.byteLimit','null'),('fields.39237593-ff51-4bd3-851a-a9dfac329c0b.settings.charLimit','null'),('fields.39237593-ff51-4bd3-851a-a9dfac329c0b.settings.code','\"\"'),('fields.39237593-ff51-4bd3-851a-a9dfac329c0b.settings.columnType','null'),('fields.39237593-ff51-4bd3-851a-a9dfac329c0b.settings.initialRows','\"4\"'),('fields.39237593-ff51-4bd3-851a-a9dfac329c0b.settings.multiline','\"\"'),('fields.39237593-ff51-4bd3-851a-a9dfac329c0b.settings.placeholder','null'),('fields.39237593-ff51-4bd3-851a-a9dfac329c0b.settings.uiMode','\"normal\"'),('fields.39237593-ff51-4bd3-851a-a9dfac329c0b.translationKeyFormat','null'),('fields.39237593-ff51-4bd3-851a-a9dfac329c0b.translationMethod','\"none\"'),('fields.39237593-ff51-4bd3-851a-a9dfac329c0b.type','\"craft\\\\fields\\\\PlainText\"'),('fields.3cca813e-09a9-4025-8efa-d5ba11d4dd89.contentColumnType','\"text\"'),('fields.3cca813e-09a9-4025-8efa-d5ba11d4dd89.fieldGroup','\"431efb4a-9ace-451f-8b70-aeda20b1f83f\"'),('fields.3cca813e-09a9-4025-8efa-d5ba11d4dd89.handle','\"email\"'),('fields.3cca813e-09a9-4025-8efa-d5ba11d4dd89.instructions','\"\"'),('fields.3cca813e-09a9-4025-8efa-d5ba11d4dd89.name','\"Email\"'),('fields.3cca813e-09a9-4025-8efa-d5ba11d4dd89.searchable','false'),('fields.3cca813e-09a9-4025-8efa-d5ba11d4dd89.settings.byteLimit','null'),('fields.3cca813e-09a9-4025-8efa-d5ba11d4dd89.settings.charLimit','null'),('fields.3cca813e-09a9-4025-8efa-d5ba11d4dd89.settings.code','\"\"'),('fields.3cca813e-09a9-4025-8efa-d5ba11d4dd89.settings.columnType','null'),('fields.3cca813e-09a9-4025-8efa-d5ba11d4dd89.settings.initialRows','\"4\"'),('fields.3cca813e-09a9-4025-8efa-d5ba11d4dd89.settings.multiline','\"\"'),('fields.3cca813e-09a9-4025-8efa-d5ba11d4dd89.settings.placeholder','null'),('fields.3cca813e-09a9-4025-8efa-d5ba11d4dd89.settings.uiMode','\"normal\"'),('fields.3cca813e-09a9-4025-8efa-d5ba11d4dd89.translationKeyFormat','null'),('fields.3cca813e-09a9-4025-8efa-d5ba11d4dd89.translationMethod','\"none\"'),('fields.3cca813e-09a9-4025-8efa-d5ba11d4dd89.type','\"craft\\\\fields\\\\PlainText\"'),('fields.3f092924-7454-4778-a975-9d6112f3eb20.contentColumnType','\"text\"'),('fields.3f092924-7454-4778-a975-9d6112f3eb20.fieldGroup','\"431efb4a-9ace-451f-8b70-aeda20b1f83f\"'),('fields.3f092924-7454-4778-a975-9d6112f3eb20.handle','\"googleAnalytics\"'),('fields.3f092924-7454-4778-a975-9d6112f3eb20.instructions','\"\"'),('fields.3f092924-7454-4778-a975-9d6112f3eb20.name','\"Google Analytics\"'),('fields.3f092924-7454-4778-a975-9d6112f3eb20.searchable','false'),('fields.3f092924-7454-4778-a975-9d6112f3eb20.settings.availableTransforms','\"*\"'),('fields.3f092924-7454-4778-a975-9d6112f3eb20.settings.availableVolumes','\"*\"'),('fields.3f092924-7454-4778-a975-9d6112f3eb20.settings.cleanupHtml','true'),('fields.3f092924-7454-4778-a975-9d6112f3eb20.settings.columnType','\"text\"'),('fields.3f092924-7454-4778-a975-9d6112f3eb20.settings.configSelectionMode','\"choose\"'),('fields.3f092924-7454-4778-a975-9d6112f3eb20.settings.defaultTransform','\"\"'),('fields.3f092924-7454-4778-a975-9d6112f3eb20.settings.manualConfig','\"\"'),('fields.3f092924-7454-4778-a975-9d6112f3eb20.settings.purifierConfig','\"\"'),('fields.3f092924-7454-4778-a975-9d6112f3eb20.settings.purifyHtml','\"1\"'),('fields.3f092924-7454-4778-a975-9d6112f3eb20.settings.redactorConfig','\"\"'),('fields.3f092924-7454-4778-a975-9d6112f3eb20.settings.removeEmptyTags','\"1\"'),('fields.3f092924-7454-4778-a975-9d6112f3eb20.settings.removeInlineStyles','\"1\"'),('fields.3f092924-7454-4778-a975-9d6112f3eb20.settings.removeNbsp','\"1\"'),('fields.3f092924-7454-4778-a975-9d6112f3eb20.settings.showHtmlButtonForNonAdmins','\"\"'),('fields.3f092924-7454-4778-a975-9d6112f3eb20.settings.showUnpermittedFiles','false'),('fields.3f092924-7454-4778-a975-9d6112f3eb20.settings.showUnpermittedVolumes','false'),('fields.3f092924-7454-4778-a975-9d6112f3eb20.settings.uiMode','\"enlarged\"'),('fields.3f092924-7454-4778-a975-9d6112f3eb20.translationKeyFormat','null'),('fields.3f092924-7454-4778-a975-9d6112f3eb20.translationMethod','\"none\"'),('fields.3f092924-7454-4778-a975-9d6112f3eb20.type','\"craft\\\\redactor\\\\Field\"'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.contentColumnType','\"string\"'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.fieldGroup','\"6b6833e3-09b6-4302-8492-fd06e3f794e4\"'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.handle','\"summaryImage\"'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.instructions','\"\"'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.name','\"Summary Image\"'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.searchable','false'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.settings.allowedKinds.0','\"image\"'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.settings.allowSelfRelations','false'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.settings.allowUploads','true'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.settings.defaultUploadLocationSource','\"volume:27b00051-5d7e-4c72-8d4c-37eb325f3071\"'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.settings.defaultUploadLocationSubpath','\"\"'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.settings.limit','\"1\"'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.settings.localizeRelations','false'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.settings.previewMode','\"full\"'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.settings.restrictFiles','\"1\"'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.settings.selectionLabel','\"\"'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.settings.showSiteMenu','true'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.settings.showUnpermittedFiles','false'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.settings.showUnpermittedVolumes','false'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.settings.singleUploadLocationSource','\"volume:27b00051-5d7e-4c72-8d4c-37eb325f3071\"'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.settings.singleUploadLocationSubpath','\"\"'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.settings.source','null'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.settings.sources','\"*\"'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.settings.targetSiteId','null'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.settings.useSingleFolder','false'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.settings.validateRelatedElements','false'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.settings.viewMode','\"list\"'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.translationKeyFormat','null'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.translationMethod','\"site\"'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.type','\"craft\\\\fields\\\\Assets\"'),('fields.4870444e-6820-4ab0-a141-99e310305629.contentColumnType','\"string\"'),('fields.4870444e-6820-4ab0-a141-99e310305629.fieldGroup','\"70f3e289-0ffa-4d8a-a2a4-e8c6db06ee3c\"'),('fields.4870444e-6820-4ab0-a141-99e310305629.handle','\"backgroundImage\"'),('fields.4870444e-6820-4ab0-a141-99e310305629.instructions','\"\"'),('fields.4870444e-6820-4ab0-a141-99e310305629.name','\"Background Image\"'),('fields.4870444e-6820-4ab0-a141-99e310305629.searchable','false'),('fields.4870444e-6820-4ab0-a141-99e310305629.settings.allowedKinds.0','\"image\"'),('fields.4870444e-6820-4ab0-a141-99e310305629.settings.allowSelfRelations','false'),('fields.4870444e-6820-4ab0-a141-99e310305629.settings.allowUploads','true'),('fields.4870444e-6820-4ab0-a141-99e310305629.settings.defaultUploadLocationSource','\"volume:27b00051-5d7e-4c72-8d4c-37eb325f3071\"'),('fields.4870444e-6820-4ab0-a141-99e310305629.settings.defaultUploadLocationSubpath','\"\"'),('fields.4870444e-6820-4ab0-a141-99e310305629.settings.limit','\"1\"'),('fields.4870444e-6820-4ab0-a141-99e310305629.settings.localizeRelations','false'),('fields.4870444e-6820-4ab0-a141-99e310305629.settings.previewMode','\"full\"'),('fields.4870444e-6820-4ab0-a141-99e310305629.settings.restrictFiles','\"1\"'),('fields.4870444e-6820-4ab0-a141-99e310305629.settings.selectionLabel','\"\"'),('fields.4870444e-6820-4ab0-a141-99e310305629.settings.showSiteMenu','true'),('fields.4870444e-6820-4ab0-a141-99e310305629.settings.showUnpermittedFiles','false'),('fields.4870444e-6820-4ab0-a141-99e310305629.settings.showUnpermittedVolumes','false'),('fields.4870444e-6820-4ab0-a141-99e310305629.settings.singleUploadLocationSource','\"volume:27b00051-5d7e-4c72-8d4c-37eb325f3071\"'),('fields.4870444e-6820-4ab0-a141-99e310305629.settings.singleUploadLocationSubpath','\"\"'),('fields.4870444e-6820-4ab0-a141-99e310305629.settings.source','null'),('fields.4870444e-6820-4ab0-a141-99e310305629.settings.sources','\"*\"'),('fields.4870444e-6820-4ab0-a141-99e310305629.settings.targetSiteId','null'),('fields.4870444e-6820-4ab0-a141-99e310305629.settings.useSingleFolder','false'),('fields.4870444e-6820-4ab0-a141-99e310305629.settings.validateRelatedElements','false'),('fields.4870444e-6820-4ab0-a141-99e310305629.settings.viewMode','\"list\"'),('fields.4870444e-6820-4ab0-a141-99e310305629.translationKeyFormat','null'),('fields.4870444e-6820-4ab0-a141-99e310305629.translationMethod','\"site\"'),('fields.4870444e-6820-4ab0-a141-99e310305629.type','\"craft\\\\fields\\\\Assets\"'),('fields.4af3caf9-e4e3-4acd-90f8-1e8cd585e497.contentColumnType','\"text\"'),('fields.4af3caf9-e4e3-4acd-90f8-1e8cd585e497.fieldGroup','\"431efb4a-9ace-451f-8b70-aeda20b1f83f\"'),('fields.4af3caf9-e4e3-4acd-90f8-1e8cd585e497.handle','\"address\"'),('fields.4af3caf9-e4e3-4acd-90f8-1e8cd585e497.instructions','\"\"'),('fields.4af3caf9-e4e3-4acd-90f8-1e8cd585e497.name','\"Address\"'),('fields.4af3caf9-e4e3-4acd-90f8-1e8cd585e497.searchable','false'),('fields.4af3caf9-e4e3-4acd-90f8-1e8cd585e497.settings.availableTransforms','\"*\"'),('fields.4af3caf9-e4e3-4acd-90f8-1e8cd585e497.settings.availableVolumes','\"*\"'),('fields.4af3caf9-e4e3-4acd-90f8-1e8cd585e497.settings.cleanupHtml','true'),('fields.4af3caf9-e4e3-4acd-90f8-1e8cd585e497.settings.columnType','\"text\"'),('fields.4af3caf9-e4e3-4acd-90f8-1e8cd585e497.settings.configSelectionMode','\"choose\"'),('fields.4af3caf9-e4e3-4acd-90f8-1e8cd585e497.settings.defaultTransform','\"\"'),('fields.4af3caf9-e4e3-4acd-90f8-1e8cd585e497.settings.manualConfig','\"\"'),('fields.4af3caf9-e4e3-4acd-90f8-1e8cd585e497.settings.purifierConfig','\"\"'),('fields.4af3caf9-e4e3-4acd-90f8-1e8cd585e497.settings.purifyHtml','\"1\"'),('fields.4af3caf9-e4e3-4acd-90f8-1e8cd585e497.settings.redactorConfig','\"\"'),('fields.4af3caf9-e4e3-4acd-90f8-1e8cd585e497.settings.removeEmptyTags','\"1\"'),('fields.4af3caf9-e4e3-4acd-90f8-1e8cd585e497.settings.removeInlineStyles','\"1\"'),('fields.4af3caf9-e4e3-4acd-90f8-1e8cd585e497.settings.removeNbsp','\"1\"'),('fields.4af3caf9-e4e3-4acd-90f8-1e8cd585e497.settings.showHtmlButtonForNonAdmins','\"\"'),('fields.4af3caf9-e4e3-4acd-90f8-1e8cd585e497.settings.showUnpermittedFiles','false'),('fields.4af3caf9-e4e3-4acd-90f8-1e8cd585e497.settings.showUnpermittedVolumes','false'),('fields.4af3caf9-e4e3-4acd-90f8-1e8cd585e497.settings.uiMode','\"enlarged\"'),('fields.4af3caf9-e4e3-4acd-90f8-1e8cd585e497.translationKeyFormat','null'),('fields.4af3caf9-e4e3-4acd-90f8-1e8cd585e497.translationMethod','\"none\"'),('fields.4af3caf9-e4e3-4acd-90f8-1e8cd585e497.type','\"craft\\\\redactor\\\\Field\"'),('fields.4b0ce80c-181f-4c40-bcce-5146dc8c903e.contentColumnType','\"string\"'),('fields.4b0ce80c-181f-4c40-bcce-5146dc8c903e.fieldGroup','\"70f3e289-0ffa-4d8a-a2a4-e8c6db06ee3c\"'),('fields.4b0ce80c-181f-4c40-bcce-5146dc8c903e.handle','\"video\"'),('fields.4b0ce80c-181f-4c40-bcce-5146dc8c903e.instructions','\"Please choose only one of the following: External Video or Asset Video.\"'),('fields.4b0ce80c-181f-4c40-bcce-5146dc8c903e.name','\"Video\"'),('fields.4b0ce80c-181f-4c40-bcce-5146dc8c903e.searchable','false'),('fields.4b0ce80c-181f-4c40-bcce-5146dc8c903e.settings.contentTable','\"{{%matrixcontent_video}}\"'),('fields.4b0ce80c-181f-4c40-bcce-5146dc8c903e.settings.maxBlocks','\"1\"'),('fields.4b0ce80c-181f-4c40-bcce-5146dc8c903e.settings.minBlocks','\"\"'),('fields.4b0ce80c-181f-4c40-bcce-5146dc8c903e.settings.propagationMethod','\"all\"'),('fields.4b0ce80c-181f-4c40-bcce-5146dc8c903e.translationKeyFormat','null'),('fields.4b0ce80c-181f-4c40-bcce-5146dc8c903e.translationMethod','\"site\"'),('fields.4b0ce80c-181f-4c40-bcce-5146dc8c903e.type','\"craft\\\\fields\\\\Matrix\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.contentColumnType','\"text\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.fieldGroup','\"7bbeec1d-6526-44a3-9897-d6d1e5918a05\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.handle','\"bottomSpacing\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.instructions','\"\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.name','\"Bottom Spacing\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.searchable','false'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.displayAsGraphic','\"\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.displayFullwidth','\"\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.0.__assoc__.0.0','\"label\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.0.__assoc__.0.1','\"None\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.0.__assoc__.1.0','\"showLabel\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.0.__assoc__.1.1','\"1\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.0.__assoc__.2.0','\"value\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.0.__assoc__.2.1','\"pb-default\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.0.__assoc__.3.0','\"imageUrl\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.0.__assoc__.3.1','\"\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.0.__assoc__.4.0','\"default\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.0.__assoc__.4.1','\"1\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.1.__assoc__.0.0','\"label\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.1.__assoc__.0.1','\"Normal\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.1.__assoc__.1.0','\"showLabel\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.1.__assoc__.1.1','\"1\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.1.__assoc__.2.0','\"value\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.1.__assoc__.2.1','\"pb-lg-3 pb-md-3 pb-3\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.1.__assoc__.3.0','\"imageUrl\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.1.__assoc__.3.1','\"\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.1.__assoc__.4.0','\"default\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.1.__assoc__.4.1','\"\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.2.__assoc__.0.0','\"label\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.2.__assoc__.0.1','\"Larger\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.2.__assoc__.1.0','\"showLabel\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.2.__assoc__.1.1','\"1\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.2.__assoc__.2.0','\"value\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.2.__assoc__.2.1','\"pb-lg-5 pb-md-5 pb-4\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.2.__assoc__.3.0','\"imageUrl\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.2.__assoc__.3.1','\"\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.2.__assoc__.4.0','\"default\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.2.__assoc__.4.1','\"\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.translationKeyFormat','null'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.translationMethod','\"none\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.type','\"supercool\\\\buttonbox\\\\fields\\\\Buttons\"'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.contentColumnType','\"text\"'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.fieldGroup','\"8f3d51d8-227c-42c1-b81e-f3cba4189a99\"'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.handle','\"seo\"'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.instructions','\"\"'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.name','\"SEO\"'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.searchable','false'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.settings.description','\"\"'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.settings.hideSocial','\"\"'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.settings.robots.0','\"\"'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.settings.robots.1','\"\"'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.settings.robots.2','\"\"'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.settings.robots.3','\"\"'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.settings.robots.4','\"\"'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.settings.robots.5','\"\"'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.settings.socialImage','null'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.settings.suffixAsPrefix','null'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.settings.title.0.__assoc__.0.0','\"key\"'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.settings.title.0.__assoc__.0.1','\"1\"'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.settings.title.0.__assoc__.1.0','\"locked\"'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.settings.title.0.__assoc__.1.1','\"0\"'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.settings.title.0.__assoc__.2.0','\"template\"'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.settings.title.0.__assoc__.2.1','\"{title}\"'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.settings.title.1.__assoc__.0.0','\"key\"'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.settings.title.1.__assoc__.0.1','\"2\"'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.settings.title.1.__assoc__.1.0','\"locked\"'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.settings.title.1.__assoc__.1.1','\"1\"'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.settings.title.1.__assoc__.2.0','\"template\"'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.settings.title.1.__assoc__.2.1','\" - {{ siteName }}\"'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.settings.titleSuffix','null'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.translationKeyFormat','null'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.translationMethod','\"none\"'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.type','\"ether\\\\seo\\\\fields\\\\SeoField\"'),('fields.ae523ce4-60b9-4674-8ed4-cbfa6ff0c20c.contentColumnType','\"string\"'),('fields.ae523ce4-60b9-4674-8ed4-cbfa6ff0c20c.fieldGroup','\"70f3e289-0ffa-4d8a-a2a4-e8c6db06ee3c\"'),('fields.ae523ce4-60b9-4674-8ed4-cbfa6ff0c20c.handle','\"button\"'),('fields.ae523ce4-60b9-4674-8ed4-cbfa6ff0c20c.instructions','\"\"'),('fields.ae523ce4-60b9-4674-8ed4-cbfa6ff0c20c.name','\"Button\"'),('fields.ae523ce4-60b9-4674-8ed4-cbfa6ff0c20c.searchable','false'),('fields.ae523ce4-60b9-4674-8ed4-cbfa6ff0c20c.settings.contentTable','\"{{%matrixcontent_button}}\"'),('fields.ae523ce4-60b9-4674-8ed4-cbfa6ff0c20c.settings.maxBlocks','\"\"'),('fields.ae523ce4-60b9-4674-8ed4-cbfa6ff0c20c.settings.minBlocks','\"\"'),('fields.ae523ce4-60b9-4674-8ed4-cbfa6ff0c20c.settings.propagationMethod','\"all\"'),('fields.ae523ce4-60b9-4674-8ed4-cbfa6ff0c20c.translationKeyFormat','null'),('fields.ae523ce4-60b9-4674-8ed4-cbfa6ff0c20c.translationMethod','\"site\"'),('fields.ae523ce4-60b9-4674-8ed4-cbfa6ff0c20c.type','\"craft\\\\fields\\\\Matrix\"'),('fields.b2c6e66f-5fcd-4220-b710-2624b1ef531d.contentColumnType','\"string\"'),('fields.b2c6e66f-5fcd-4220-b710-2624b1ef531d.fieldGroup','\"70f3e289-0ffa-4d8a-a2a4-e8c6db06ee3c\"'),('fields.b2c6e66f-5fcd-4220-b710-2624b1ef531d.handle','\"accordionMatrix\"'),('fields.b2c6e66f-5fcd-4220-b710-2624b1ef531d.instructions','\"\"'),('fields.b2c6e66f-5fcd-4220-b710-2624b1ef531d.name','\"Accordion Matrix\"'),('fields.b2c6e66f-5fcd-4220-b710-2624b1ef531d.searchable','false'),('fields.b2c6e66f-5fcd-4220-b710-2624b1ef531d.settings.contentTable','\"{{%matrixcontent_accordionmatrix}}\"'),('fields.b2c6e66f-5fcd-4220-b710-2624b1ef531d.settings.maxBlocks','\"\"'),('fields.b2c6e66f-5fcd-4220-b710-2624b1ef531d.settings.minBlocks','\"\"'),('fields.b2c6e66f-5fcd-4220-b710-2624b1ef531d.settings.propagationMethod','\"all\"'),('fields.b2c6e66f-5fcd-4220-b710-2624b1ef531d.translationKeyFormat','null'),('fields.b2c6e66f-5fcd-4220-b710-2624b1ef531d.translationMethod','\"site\"'),('fields.b2c6e66f-5fcd-4220-b710-2624b1ef531d.type','\"craft\\\\fields\\\\Matrix\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.contentColumnType','\"text\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.fieldGroup','\"7bbeec1d-6526-44a3-9897-d6d1e5918a05\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.handle','\"topSpacing\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.instructions','\"\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.name','\"Top Spacing\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.searchable','false'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.displayAsGraphic','\"\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.displayFullwidth','\"\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.0.__assoc__.0.0','\"label\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.0.__assoc__.0.1','\"None\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.0.__assoc__.1.0','\"showLabel\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.0.__assoc__.1.1','\"1\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.0.__assoc__.2.0','\"value\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.0.__assoc__.2.1','\"pt-default\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.0.__assoc__.3.0','\"imageUrl\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.0.__assoc__.3.1','\"\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.0.__assoc__.4.0','\"default\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.0.__assoc__.4.1','\"1\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.1.__assoc__.0.0','\"label\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.1.__assoc__.0.1','\"Normal\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.1.__assoc__.1.0','\"showLabel\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.1.__assoc__.1.1','\"1\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.1.__assoc__.2.0','\"value\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.1.__assoc__.2.1','\"pt-lg-3 pt-md-3 pt-3\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.1.__assoc__.3.0','\"imageUrl\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.1.__assoc__.3.1','\"\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.1.__assoc__.4.0','\"default\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.1.__assoc__.4.1','\"\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.2.__assoc__.0.0','\"label\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.2.__assoc__.0.1','\"Large\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.2.__assoc__.1.0','\"showLabel\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.2.__assoc__.1.1','\"1\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.2.__assoc__.2.0','\"value\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.2.__assoc__.2.1','\"pt-lg-5 pt-md-5 pt-4\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.2.__assoc__.3.0','\"imageUrl\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.2.__assoc__.3.1','\"\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.2.__assoc__.4.0','\"default\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.2.__assoc__.4.1','\"\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.translationKeyFormat','null'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.translationMethod','\"none\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.type','\"supercool\\\\buttonbox\\\\fields\\\\Buttons\"'),('fields.d783368e-a494-4457-9e99-5a027ae72a18.contentColumnType','\"string\"'),('fields.d783368e-a494-4457-9e99-5a027ae72a18.fieldGroup','\"b4718bab-e938-4b97-a8e4-adc9fe5f4ca7\"'),('fields.d783368e-a494-4457-9e99-5a027ae72a18.handle','\"pageHeader\"'),('fields.d783368e-a494-4457-9e99-5a027ae72a18.instructions','\"\"'),('fields.d783368e-a494-4457-9e99-5a027ae72a18.name','\"Page Header\"'),('fields.d783368e-a494-4457-9e99-5a027ae72a18.searchable','false'),('fields.d783368e-a494-4457-9e99-5a027ae72a18.settings.maxBlocks','\"1\"'),('fields.d783368e-a494-4457-9e99-5a027ae72a18.settings.maxLevels','\"\"'),('fields.d783368e-a494-4457-9e99-5a027ae72a18.settings.maxTopBlocks','\"\"'),('fields.d783368e-a494-4457-9e99-5a027ae72a18.settings.minBlocks','\"\"'),('fields.d783368e-a494-4457-9e99-5a027ae72a18.settings.propagationMethod','\"all\"'),('fields.d783368e-a494-4457-9e99-5a027ae72a18.settings.wasModified','false'),('fields.d783368e-a494-4457-9e99-5a027ae72a18.translationKeyFormat','null'),('fields.d783368e-a494-4457-9e99-5a027ae72a18.translationMethod','\"site\"'),('fields.d783368e-a494-4457-9e99-5a027ae72a18.type','\"benf\\\\neo\\\\Field\"'),('globalSets.5d2dca76-1ede-413a-8adf-b4a756ed42ae.fieldLayouts.f2d8768a-cbb9-4a52-a62f-3cebeccc956b.tabs.0.elements.0.fieldUid','\"3f092924-7454-4778-a975-9d6112f3eb20\"'),('globalSets.5d2dca76-1ede-413a-8adf-b4a756ed42ae.fieldLayouts.f2d8768a-cbb9-4a52-a62f-3cebeccc956b.tabs.0.elements.0.instructions','null'),('globalSets.5d2dca76-1ede-413a-8adf-b4a756ed42ae.fieldLayouts.f2d8768a-cbb9-4a52-a62f-3cebeccc956b.tabs.0.elements.0.label','null'),('globalSets.5d2dca76-1ede-413a-8adf-b4a756ed42ae.fieldLayouts.f2d8768a-cbb9-4a52-a62f-3cebeccc956b.tabs.0.elements.0.required','false'),('globalSets.5d2dca76-1ede-413a-8adf-b4a756ed42ae.fieldLayouts.f2d8768a-cbb9-4a52-a62f-3cebeccc956b.tabs.0.elements.0.tip','null'),('globalSets.5d2dca76-1ede-413a-8adf-b4a756ed42ae.fieldLayouts.f2d8768a-cbb9-4a52-a62f-3cebeccc956b.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.5d2dca76-1ede-413a-8adf-b4a756ed42ae.fieldLayouts.f2d8768a-cbb9-4a52-a62f-3cebeccc956b.tabs.0.elements.0.warning','null'),('globalSets.5d2dca76-1ede-413a-8adf-b4a756ed42ae.fieldLayouts.f2d8768a-cbb9-4a52-a62f-3cebeccc956b.tabs.0.elements.0.width','100'),('globalSets.5d2dca76-1ede-413a-8adf-b4a756ed42ae.fieldLayouts.f2d8768a-cbb9-4a52-a62f-3cebeccc956b.tabs.0.name','\"Content\"'),('globalSets.5d2dca76-1ede-413a-8adf-b4a756ed42ae.fieldLayouts.f2d8768a-cbb9-4a52-a62f-3cebeccc956b.tabs.0.sortOrder','1'),('globalSets.5d2dca76-1ede-413a-8adf-b4a756ed42ae.handle','\"siteInfo\"'),('globalSets.5d2dca76-1ede-413a-8adf-b4a756ed42ae.name','\"Site Info\"'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.0.fieldUid','\"4af3caf9-e4e3-4acd-90f8-1e8cd585e497\"'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.0.instructions','null'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.0.label','null'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.0.required','false'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.0.tip','null'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.0.warning','null'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.0.width','100'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.1.fieldUid','\"3cca813e-09a9-4025-8efa-d5ba11d4dd89\"'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.1.instructions','null'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.1.label','null'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.1.required','false'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.1.tip','null'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.1.warning','null'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.1.width','100'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.2.fieldUid','\"386e1cf1-acc9-4336-90e1-fb74daefd6f5\"'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.2.instructions','null'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.2.label','null'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.2.required','false'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.2.tip','null'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.2.warning','null'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.2.width','100'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.3.fieldUid','\"13d35453-527a-4094-b642-42292f193f8c\"'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.3.instructions','null'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.3.label','null'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.3.required','false'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.3.tip','null'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.3.warning','null'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.3.width','100'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.name','\"Content\"'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.sortOrder','1'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.handle','\"companyInfo\"'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.name','\"Company Info\"'),('matrixBlockTypes.3d768a6c-7660-4551-8c77-a987ed1dfb44.field','\"ae523ce4-60b9-4674-8ed4-cbfa6ff0c20c\"'),('matrixBlockTypes.3d768a6c-7660-4551-8c77-a987ed1dfb44.fieldLayouts.88a967f0-7417-4348-a669-4842b7aae7af.tabs.0.elements.0.fieldUid','\"bd1a9dd9-c492-4932-ad06-98c72a16cfd8\"'),('matrixBlockTypes.3d768a6c-7660-4551-8c77-a987ed1dfb44.fieldLayouts.88a967f0-7417-4348-a669-4842b7aae7af.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.3d768a6c-7660-4551-8c77-a987ed1dfb44.fieldLayouts.88a967f0-7417-4348-a669-4842b7aae7af.tabs.0.elements.0.label','null'),('matrixBlockTypes.3d768a6c-7660-4551-8c77-a987ed1dfb44.fieldLayouts.88a967f0-7417-4348-a669-4842b7aae7af.tabs.0.elements.0.required','false'),('matrixBlockTypes.3d768a6c-7660-4551-8c77-a987ed1dfb44.fieldLayouts.88a967f0-7417-4348-a669-4842b7aae7af.tabs.0.elements.0.tip','null'),('matrixBlockTypes.3d768a6c-7660-4551-8c77-a987ed1dfb44.fieldLayouts.88a967f0-7417-4348-a669-4842b7aae7af.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.3d768a6c-7660-4551-8c77-a987ed1dfb44.fieldLayouts.88a967f0-7417-4348-a669-4842b7aae7af.tabs.0.elements.0.warning','null'),('matrixBlockTypes.3d768a6c-7660-4551-8c77-a987ed1dfb44.fieldLayouts.88a967f0-7417-4348-a669-4842b7aae7af.tabs.0.elements.0.width','100'),('matrixBlockTypes.3d768a6c-7660-4551-8c77-a987ed1dfb44.fieldLayouts.88a967f0-7417-4348-a669-4842b7aae7af.tabs.0.elements.1.fieldUid','\"3fb11a52-50bf-49c5-a8dd-c2ee482358ee\"'),('matrixBlockTypes.3d768a6c-7660-4551-8c77-a987ed1dfb44.fieldLayouts.88a967f0-7417-4348-a669-4842b7aae7af.tabs.0.elements.1.instructions','null'),('matrixBlockTypes.3d768a6c-7660-4551-8c77-a987ed1dfb44.fieldLayouts.88a967f0-7417-4348-a669-4842b7aae7af.tabs.0.elements.1.label','null'),('matrixBlockTypes.3d768a6c-7660-4551-8c77-a987ed1dfb44.fieldLayouts.88a967f0-7417-4348-a669-4842b7aae7af.tabs.0.elements.1.required','false'),('matrixBlockTypes.3d768a6c-7660-4551-8c77-a987ed1dfb44.fieldLayouts.88a967f0-7417-4348-a669-4842b7aae7af.tabs.0.elements.1.tip','null'),('matrixBlockTypes.3d768a6c-7660-4551-8c77-a987ed1dfb44.fieldLayouts.88a967f0-7417-4348-a669-4842b7aae7af.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.3d768a6c-7660-4551-8c77-a987ed1dfb44.fieldLayouts.88a967f0-7417-4348-a669-4842b7aae7af.tabs.0.elements.1.warning','null'),('matrixBlockTypes.3d768a6c-7660-4551-8c77-a987ed1dfb44.fieldLayouts.88a967f0-7417-4348-a669-4842b7aae7af.tabs.0.elements.1.width','100'),('matrixBlockTypes.3d768a6c-7660-4551-8c77-a987ed1dfb44.fieldLayouts.88a967f0-7417-4348-a669-4842b7aae7af.tabs.0.name','\"Content\"'),('matrixBlockTypes.3d768a6c-7660-4551-8c77-a987ed1dfb44.fieldLayouts.88a967f0-7417-4348-a669-4842b7aae7af.tabs.0.sortOrder','1'),('matrixBlockTypes.3d768a6c-7660-4551-8c77-a987ed1dfb44.fields.3fb11a52-50bf-49c5-a8dd-c2ee482358ee.contentColumnType','\"text\"'),('matrixBlockTypes.3d768a6c-7660-4551-8c77-a987ed1dfb44.fields.3fb11a52-50bf-49c5-a8dd-c2ee482358ee.fieldGroup','null'),('matrixBlockTypes.3d768a6c-7660-4551-8c77-a987ed1dfb44.fields.3fb11a52-50bf-49c5-a8dd-c2ee482358ee.handle','\"buttonLink\"'),('matrixBlockTypes.3d768a6c-7660-4551-8c77-a987ed1dfb44.fields.3fb11a52-50bf-49c5-a8dd-c2ee482358ee.instructions','\"Enter a valid URL starting with - http://, https://, mailto:, tel:, ... \"'),('matrixBlockTypes.3d768a6c-7660-4551-8c77-a987ed1dfb44.fields.3fb11a52-50bf-49c5-a8dd-c2ee482358ee.name','\"Button Link\"'),('matrixBlockTypes.3d768a6c-7660-4551-8c77-a987ed1dfb44.fields.3fb11a52-50bf-49c5-a8dd-c2ee482358ee.searchable','false'),('matrixBlockTypes.3d768a6c-7660-4551-8c77-a987ed1dfb44.fields.3fb11a52-50bf-49c5-a8dd-c2ee482358ee.settings.byteLimit','null'),('matrixBlockTypes.3d768a6c-7660-4551-8c77-a987ed1dfb44.fields.3fb11a52-50bf-49c5-a8dd-c2ee482358ee.settings.charLimit','null'),('matrixBlockTypes.3d768a6c-7660-4551-8c77-a987ed1dfb44.fields.3fb11a52-50bf-49c5-a8dd-c2ee482358ee.settings.code','\"\"'),('matrixBlockTypes.3d768a6c-7660-4551-8c77-a987ed1dfb44.fields.3fb11a52-50bf-49c5-a8dd-c2ee482358ee.settings.columnType','null'),('matrixBlockTypes.3d768a6c-7660-4551-8c77-a987ed1dfb44.fields.3fb11a52-50bf-49c5-a8dd-c2ee482358ee.settings.initialRows','\"4\"'),('matrixBlockTypes.3d768a6c-7660-4551-8c77-a987ed1dfb44.fields.3fb11a52-50bf-49c5-a8dd-c2ee482358ee.settings.multiline','\"\"'),('matrixBlockTypes.3d768a6c-7660-4551-8c77-a987ed1dfb44.fields.3fb11a52-50bf-49c5-a8dd-c2ee482358ee.settings.placeholder','null'),('matrixBlockTypes.3d768a6c-7660-4551-8c77-a987ed1dfb44.fields.3fb11a52-50bf-49c5-a8dd-c2ee482358ee.settings.uiMode','\"normal\"'),('matrixBlockTypes.3d768a6c-7660-4551-8c77-a987ed1dfb44.fields.3fb11a52-50bf-49c5-a8dd-c2ee482358ee.translationKeyFormat','null'),('matrixBlockTypes.3d768a6c-7660-4551-8c77-a987ed1dfb44.fields.3fb11a52-50bf-49c5-a8dd-c2ee482358ee.translationMethod','\"none\"'),('matrixBlockTypes.3d768a6c-7660-4551-8c77-a987ed1dfb44.fields.3fb11a52-50bf-49c5-a8dd-c2ee482358ee.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.3d768a6c-7660-4551-8c77-a987ed1dfb44.fields.bd1a9dd9-c492-4932-ad06-98c72a16cfd8.contentColumnType','\"text\"'),('matrixBlockTypes.3d768a6c-7660-4551-8c77-a987ed1dfb44.fields.bd1a9dd9-c492-4932-ad06-98c72a16cfd8.fieldGroup','null'),('matrixBlockTypes.3d768a6c-7660-4551-8c77-a987ed1dfb44.fields.bd1a9dd9-c492-4932-ad06-98c72a16cfd8.handle','\"buttonTitle\"'),('matrixBlockTypes.3d768a6c-7660-4551-8c77-a987ed1dfb44.fields.bd1a9dd9-c492-4932-ad06-98c72a16cfd8.instructions','\"\"'),('matrixBlockTypes.3d768a6c-7660-4551-8c77-a987ed1dfb44.fields.bd1a9dd9-c492-4932-ad06-98c72a16cfd8.name','\"Button Title\"'),('matrixBlockTypes.3d768a6c-7660-4551-8c77-a987ed1dfb44.fields.bd1a9dd9-c492-4932-ad06-98c72a16cfd8.searchable','false'),('matrixBlockTypes.3d768a6c-7660-4551-8c77-a987ed1dfb44.fields.bd1a9dd9-c492-4932-ad06-98c72a16cfd8.settings.byteLimit','null'),('matrixBlockTypes.3d768a6c-7660-4551-8c77-a987ed1dfb44.fields.bd1a9dd9-c492-4932-ad06-98c72a16cfd8.settings.charLimit','null'),('matrixBlockTypes.3d768a6c-7660-4551-8c77-a987ed1dfb44.fields.bd1a9dd9-c492-4932-ad06-98c72a16cfd8.settings.code','\"\"'),('matrixBlockTypes.3d768a6c-7660-4551-8c77-a987ed1dfb44.fields.bd1a9dd9-c492-4932-ad06-98c72a16cfd8.settings.columnType','null'),('matrixBlockTypes.3d768a6c-7660-4551-8c77-a987ed1dfb44.fields.bd1a9dd9-c492-4932-ad06-98c72a16cfd8.settings.initialRows','\"4\"'),('matrixBlockTypes.3d768a6c-7660-4551-8c77-a987ed1dfb44.fields.bd1a9dd9-c492-4932-ad06-98c72a16cfd8.settings.multiline','\"\"'),('matrixBlockTypes.3d768a6c-7660-4551-8c77-a987ed1dfb44.fields.bd1a9dd9-c492-4932-ad06-98c72a16cfd8.settings.placeholder','null'),('matrixBlockTypes.3d768a6c-7660-4551-8c77-a987ed1dfb44.fields.bd1a9dd9-c492-4932-ad06-98c72a16cfd8.settings.uiMode','\"normal\"'),('matrixBlockTypes.3d768a6c-7660-4551-8c77-a987ed1dfb44.fields.bd1a9dd9-c492-4932-ad06-98c72a16cfd8.translationKeyFormat','null'),('matrixBlockTypes.3d768a6c-7660-4551-8c77-a987ed1dfb44.fields.bd1a9dd9-c492-4932-ad06-98c72a16cfd8.translationMethod','\"none\"'),('matrixBlockTypes.3d768a6c-7660-4551-8c77-a987ed1dfb44.fields.bd1a9dd9-c492-4932-ad06-98c72a16cfd8.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.3d768a6c-7660-4551-8c77-a987ed1dfb44.handle','\"externalLink\"'),('matrixBlockTypes.3d768a6c-7660-4551-8c77-a987ed1dfb44.name','\"External Link\"'),('matrixBlockTypes.3d768a6c-7660-4551-8c77-a987ed1dfb44.sortOrder','2'),('matrixBlockTypes.49b4d1ac-0f61-42c6-a482-63eefaa8933e.field','\"4b0ce80c-181f-4c40-bcce-5146dc8c903e\"'),('matrixBlockTypes.49b4d1ac-0f61-42c6-a482-63eefaa8933e.fieldLayouts.8be94203-c156-4c39-9b45-466e97070395.tabs.0.elements.0.fieldUid','\"588b4c33-d66a-429a-a796-a6146b14a0f8\"'),('matrixBlockTypes.49b4d1ac-0f61-42c6-a482-63eefaa8933e.fieldLayouts.8be94203-c156-4c39-9b45-466e97070395.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.49b4d1ac-0f61-42c6-a482-63eefaa8933e.fieldLayouts.8be94203-c156-4c39-9b45-466e97070395.tabs.0.elements.0.label','null'),('matrixBlockTypes.49b4d1ac-0f61-42c6-a482-63eefaa8933e.fieldLayouts.8be94203-c156-4c39-9b45-466e97070395.tabs.0.elements.0.required','false'),('matrixBlockTypes.49b4d1ac-0f61-42c6-a482-63eefaa8933e.fieldLayouts.8be94203-c156-4c39-9b45-466e97070395.tabs.0.elements.0.tip','null'),('matrixBlockTypes.49b4d1ac-0f61-42c6-a482-63eefaa8933e.fieldLayouts.8be94203-c156-4c39-9b45-466e97070395.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.49b4d1ac-0f61-42c6-a482-63eefaa8933e.fieldLayouts.8be94203-c156-4c39-9b45-466e97070395.tabs.0.elements.0.warning','null'),('matrixBlockTypes.49b4d1ac-0f61-42c6-a482-63eefaa8933e.fieldLayouts.8be94203-c156-4c39-9b45-466e97070395.tabs.0.elements.0.width','100'),('matrixBlockTypes.49b4d1ac-0f61-42c6-a482-63eefaa8933e.fieldLayouts.8be94203-c156-4c39-9b45-466e97070395.tabs.0.name','\"Content\"'),('matrixBlockTypes.49b4d1ac-0f61-42c6-a482-63eefaa8933e.fieldLayouts.8be94203-c156-4c39-9b45-466e97070395.tabs.0.sortOrder','1'),('matrixBlockTypes.49b4d1ac-0f61-42c6-a482-63eefaa8933e.fields.588b4c33-d66a-429a-a796-a6146b14a0f8.contentColumnType','\"string\"'),('matrixBlockTypes.49b4d1ac-0f61-42c6-a482-63eefaa8933e.fields.588b4c33-d66a-429a-a796-a6146b14a0f8.fieldGroup','null'),('matrixBlockTypes.49b4d1ac-0f61-42c6-a482-63eefaa8933e.fields.588b4c33-d66a-429a-a796-a6146b14a0f8.handle','\"video\"'),('matrixBlockTypes.49b4d1ac-0f61-42c6-a482-63eefaa8933e.fields.588b4c33-d66a-429a-a796-a6146b14a0f8.instructions','\"\"'),('matrixBlockTypes.49b4d1ac-0f61-42c6-a482-63eefaa8933e.fields.588b4c33-d66a-429a-a796-a6146b14a0f8.name','\"Video\"'),('matrixBlockTypes.49b4d1ac-0f61-42c6-a482-63eefaa8933e.fields.588b4c33-d66a-429a-a796-a6146b14a0f8.searchable','false'),('matrixBlockTypes.49b4d1ac-0f61-42c6-a482-63eefaa8933e.fields.588b4c33-d66a-429a-a796-a6146b14a0f8.settings.allowedKinds.0','\"video\"'),('matrixBlockTypes.49b4d1ac-0f61-42c6-a482-63eefaa8933e.fields.588b4c33-d66a-429a-a796-a6146b14a0f8.settings.allowSelfRelations','false'),('matrixBlockTypes.49b4d1ac-0f61-42c6-a482-63eefaa8933e.fields.588b4c33-d66a-429a-a796-a6146b14a0f8.settings.allowUploads','true'),('matrixBlockTypes.49b4d1ac-0f61-42c6-a482-63eefaa8933e.fields.588b4c33-d66a-429a-a796-a6146b14a0f8.settings.defaultUploadLocationSource','\"\"'),('matrixBlockTypes.49b4d1ac-0f61-42c6-a482-63eefaa8933e.fields.588b4c33-d66a-429a-a796-a6146b14a0f8.settings.defaultUploadLocationSubpath','\"\"'),('matrixBlockTypes.49b4d1ac-0f61-42c6-a482-63eefaa8933e.fields.588b4c33-d66a-429a-a796-a6146b14a0f8.settings.limit','\"1\"'),('matrixBlockTypes.49b4d1ac-0f61-42c6-a482-63eefaa8933e.fields.588b4c33-d66a-429a-a796-a6146b14a0f8.settings.localizeRelations','false'),('matrixBlockTypes.49b4d1ac-0f61-42c6-a482-63eefaa8933e.fields.588b4c33-d66a-429a-a796-a6146b14a0f8.settings.previewMode','\"full\"'),('matrixBlockTypes.49b4d1ac-0f61-42c6-a482-63eefaa8933e.fields.588b4c33-d66a-429a-a796-a6146b14a0f8.settings.restrictFiles','\"1\"'),('matrixBlockTypes.49b4d1ac-0f61-42c6-a482-63eefaa8933e.fields.588b4c33-d66a-429a-a796-a6146b14a0f8.settings.selectionLabel','\"\"'),('matrixBlockTypes.49b4d1ac-0f61-42c6-a482-63eefaa8933e.fields.588b4c33-d66a-429a-a796-a6146b14a0f8.settings.showSiteMenu','false'),('matrixBlockTypes.49b4d1ac-0f61-42c6-a482-63eefaa8933e.fields.588b4c33-d66a-429a-a796-a6146b14a0f8.settings.showUnpermittedFiles','false'),('matrixBlockTypes.49b4d1ac-0f61-42c6-a482-63eefaa8933e.fields.588b4c33-d66a-429a-a796-a6146b14a0f8.settings.showUnpermittedVolumes','false'),('matrixBlockTypes.49b4d1ac-0f61-42c6-a482-63eefaa8933e.fields.588b4c33-d66a-429a-a796-a6146b14a0f8.settings.singleUploadLocationSource','\"\"'),('matrixBlockTypes.49b4d1ac-0f61-42c6-a482-63eefaa8933e.fields.588b4c33-d66a-429a-a796-a6146b14a0f8.settings.singleUploadLocationSubpath','\"\"'),('matrixBlockTypes.49b4d1ac-0f61-42c6-a482-63eefaa8933e.fields.588b4c33-d66a-429a-a796-a6146b14a0f8.settings.source','null'),('matrixBlockTypes.49b4d1ac-0f61-42c6-a482-63eefaa8933e.fields.588b4c33-d66a-429a-a796-a6146b14a0f8.settings.sources','\"*\"'),('matrixBlockTypes.49b4d1ac-0f61-42c6-a482-63eefaa8933e.fields.588b4c33-d66a-429a-a796-a6146b14a0f8.settings.targetSiteId','null'),('matrixBlockTypes.49b4d1ac-0f61-42c6-a482-63eefaa8933e.fields.588b4c33-d66a-429a-a796-a6146b14a0f8.settings.useSingleFolder','false'),('matrixBlockTypes.49b4d1ac-0f61-42c6-a482-63eefaa8933e.fields.588b4c33-d66a-429a-a796-a6146b14a0f8.settings.validateRelatedElements','false'),('matrixBlockTypes.49b4d1ac-0f61-42c6-a482-63eefaa8933e.fields.588b4c33-d66a-429a-a796-a6146b14a0f8.settings.viewMode','\"list\"'),('matrixBlockTypes.49b4d1ac-0f61-42c6-a482-63eefaa8933e.fields.588b4c33-d66a-429a-a796-a6146b14a0f8.translationKeyFormat','null'),('matrixBlockTypes.49b4d1ac-0f61-42c6-a482-63eefaa8933e.fields.588b4c33-d66a-429a-a796-a6146b14a0f8.translationMethod','\"site\"'),('matrixBlockTypes.49b4d1ac-0f61-42c6-a482-63eefaa8933e.fields.588b4c33-d66a-429a-a796-a6146b14a0f8.type','\"craft\\\\fields\\\\Assets\"'),('matrixBlockTypes.49b4d1ac-0f61-42c6-a482-63eefaa8933e.handle','\"assetVideo\"'),('matrixBlockTypes.49b4d1ac-0f61-42c6-a482-63eefaa8933e.name','\"Asset Video\"'),('matrixBlockTypes.49b4d1ac-0f61-42c6-a482-63eefaa8933e.sortOrder','2'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.field','\"b2c6e66f-5fcd-4220-b710-2624b1ef531d\"'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fieldLayouts.e5166699-4103-4dbe-8f15-7722d35cd4fb.tabs.0.elements.0.fieldUid','\"6bc4604d-7a4d-4a0c-ad53-c3a6adc1a6e8\"'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fieldLayouts.e5166699-4103-4dbe-8f15-7722d35cd4fb.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fieldLayouts.e5166699-4103-4dbe-8f15-7722d35cd4fb.tabs.0.elements.0.label','null'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fieldLayouts.e5166699-4103-4dbe-8f15-7722d35cd4fb.tabs.0.elements.0.required','false'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fieldLayouts.e5166699-4103-4dbe-8f15-7722d35cd4fb.tabs.0.elements.0.tip','null'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fieldLayouts.e5166699-4103-4dbe-8f15-7722d35cd4fb.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fieldLayouts.e5166699-4103-4dbe-8f15-7722d35cd4fb.tabs.0.elements.0.warning','null'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fieldLayouts.e5166699-4103-4dbe-8f15-7722d35cd4fb.tabs.0.elements.0.width','100'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fieldLayouts.e5166699-4103-4dbe-8f15-7722d35cd4fb.tabs.0.elements.1.fieldUid','\"f85e63c0-1f6c-495c-95b7-6b70d338bd07\"'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fieldLayouts.e5166699-4103-4dbe-8f15-7722d35cd4fb.tabs.0.elements.1.instructions','null'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fieldLayouts.e5166699-4103-4dbe-8f15-7722d35cd4fb.tabs.0.elements.1.label','null'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fieldLayouts.e5166699-4103-4dbe-8f15-7722d35cd4fb.tabs.0.elements.1.required','false'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fieldLayouts.e5166699-4103-4dbe-8f15-7722d35cd4fb.tabs.0.elements.1.tip','null'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fieldLayouts.e5166699-4103-4dbe-8f15-7722d35cd4fb.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fieldLayouts.e5166699-4103-4dbe-8f15-7722d35cd4fb.tabs.0.elements.1.warning','null'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fieldLayouts.e5166699-4103-4dbe-8f15-7722d35cd4fb.tabs.0.elements.1.width','100'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fieldLayouts.e5166699-4103-4dbe-8f15-7722d35cd4fb.tabs.0.name','\"Content\"'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fieldLayouts.e5166699-4103-4dbe-8f15-7722d35cd4fb.tabs.0.sortOrder','1'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fields.6bc4604d-7a4d-4a0c-ad53-c3a6adc1a6e8.contentColumnType','\"text\"'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fields.6bc4604d-7a4d-4a0c-ad53-c3a6adc1a6e8.fieldGroup','null'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fields.6bc4604d-7a4d-4a0c-ad53-c3a6adc1a6e8.handle','\"question\"'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fields.6bc4604d-7a4d-4a0c-ad53-c3a6adc1a6e8.instructions','\"\"'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fields.6bc4604d-7a4d-4a0c-ad53-c3a6adc1a6e8.name','\"Question\"'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fields.6bc4604d-7a4d-4a0c-ad53-c3a6adc1a6e8.searchable','false'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fields.6bc4604d-7a4d-4a0c-ad53-c3a6adc1a6e8.settings.byteLimit','null'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fields.6bc4604d-7a4d-4a0c-ad53-c3a6adc1a6e8.settings.charLimit','null'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fields.6bc4604d-7a4d-4a0c-ad53-c3a6adc1a6e8.settings.code','\"\"'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fields.6bc4604d-7a4d-4a0c-ad53-c3a6adc1a6e8.settings.columnType','null'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fields.6bc4604d-7a4d-4a0c-ad53-c3a6adc1a6e8.settings.initialRows','\"4\"'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fields.6bc4604d-7a4d-4a0c-ad53-c3a6adc1a6e8.settings.multiline','\"\"'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fields.6bc4604d-7a4d-4a0c-ad53-c3a6adc1a6e8.settings.placeholder','null'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fields.6bc4604d-7a4d-4a0c-ad53-c3a6adc1a6e8.settings.uiMode','\"normal\"'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fields.6bc4604d-7a4d-4a0c-ad53-c3a6adc1a6e8.translationKeyFormat','null'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fields.6bc4604d-7a4d-4a0c-ad53-c3a6adc1a6e8.translationMethod','\"none\"'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fields.6bc4604d-7a4d-4a0c-ad53-c3a6adc1a6e8.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fields.f85e63c0-1f6c-495c-95b7-6b70d338bd07.contentColumnType','\"text\"'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fields.f85e63c0-1f6c-495c-95b7-6b70d338bd07.fieldGroup','null'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fields.f85e63c0-1f6c-495c-95b7-6b70d338bd07.handle','\"answer\"'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fields.f85e63c0-1f6c-495c-95b7-6b70d338bd07.instructions','\"\"'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fields.f85e63c0-1f6c-495c-95b7-6b70d338bd07.name','\"Answer\"'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fields.f85e63c0-1f6c-495c-95b7-6b70d338bd07.searchable','false'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fields.f85e63c0-1f6c-495c-95b7-6b70d338bd07.settings.availableTransforms','\"*\"'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fields.f85e63c0-1f6c-495c-95b7-6b70d338bd07.settings.availableVolumes','\"*\"'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fields.f85e63c0-1f6c-495c-95b7-6b70d338bd07.settings.cleanupHtml','true'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fields.f85e63c0-1f6c-495c-95b7-6b70d338bd07.settings.columnType','\"text\"'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fields.f85e63c0-1f6c-495c-95b7-6b70d338bd07.settings.configSelectionMode','\"choose\"'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fields.f85e63c0-1f6c-495c-95b7-6b70d338bd07.settings.defaultTransform','\"\"'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fields.f85e63c0-1f6c-495c-95b7-6b70d338bd07.settings.manualConfig','\"\"'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fields.f85e63c0-1f6c-495c-95b7-6b70d338bd07.settings.purifierConfig','\"\"'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fields.f85e63c0-1f6c-495c-95b7-6b70d338bd07.settings.purifyHtml','\"1\"'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fields.f85e63c0-1f6c-495c-95b7-6b70d338bd07.settings.redactorConfig','\"\"'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fields.f85e63c0-1f6c-495c-95b7-6b70d338bd07.settings.removeEmptyTags','\"1\"'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fields.f85e63c0-1f6c-495c-95b7-6b70d338bd07.settings.removeInlineStyles','\"1\"'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fields.f85e63c0-1f6c-495c-95b7-6b70d338bd07.settings.removeNbsp','\"1\"'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fields.f85e63c0-1f6c-495c-95b7-6b70d338bd07.settings.showHtmlButtonForNonAdmins','\"\"'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fields.f85e63c0-1f6c-495c-95b7-6b70d338bd07.settings.showUnpermittedFiles','false'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fields.f85e63c0-1f6c-495c-95b7-6b70d338bd07.settings.showUnpermittedVolumes','false'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fields.f85e63c0-1f6c-495c-95b7-6b70d338bd07.settings.uiMode','\"enlarged\"'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fields.f85e63c0-1f6c-495c-95b7-6b70d338bd07.translationKeyFormat','null'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fields.f85e63c0-1f6c-495c-95b7-6b70d338bd07.translationMethod','\"none\"'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.fields.f85e63c0-1f6c-495c-95b7-6b70d338bd07.type','\"craft\\\\redactor\\\\Field\"'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.handle','\"item\"'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.name','\"Item\"'),('matrixBlockTypes.80190ffa-9de6-4824-befb-1c21b98c9752.sortOrder','1'),('matrixBlockTypes.d563f248-37de-412a-b0ad-eea19da5e0f9.field','\"ae523ce4-60b9-4674-8ed4-cbfa6ff0c20c\"'),('matrixBlockTypes.d563f248-37de-412a-b0ad-eea19da5e0f9.fieldLayouts.da6619a7-ccfc-4768-b5a7-c580341ac8b4.tabs.0.elements.0.fieldUid','\"3e5005f5-763a-459a-9bb7-74b2de70f748\"'),('matrixBlockTypes.d563f248-37de-412a-b0ad-eea19da5e0f9.fieldLayouts.da6619a7-ccfc-4768-b5a7-c580341ac8b4.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.d563f248-37de-412a-b0ad-eea19da5e0f9.fieldLayouts.da6619a7-ccfc-4768-b5a7-c580341ac8b4.tabs.0.elements.0.label','null'),('matrixBlockTypes.d563f248-37de-412a-b0ad-eea19da5e0f9.fieldLayouts.da6619a7-ccfc-4768-b5a7-c580341ac8b4.tabs.0.elements.0.required','false'),('matrixBlockTypes.d563f248-37de-412a-b0ad-eea19da5e0f9.fieldLayouts.da6619a7-ccfc-4768-b5a7-c580341ac8b4.tabs.0.elements.0.tip','null'),('matrixBlockTypes.d563f248-37de-412a-b0ad-eea19da5e0f9.fieldLayouts.da6619a7-ccfc-4768-b5a7-c580341ac8b4.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.d563f248-37de-412a-b0ad-eea19da5e0f9.fieldLayouts.da6619a7-ccfc-4768-b5a7-c580341ac8b4.tabs.0.elements.0.warning','null'),('matrixBlockTypes.d563f248-37de-412a-b0ad-eea19da5e0f9.fieldLayouts.da6619a7-ccfc-4768-b5a7-c580341ac8b4.tabs.0.elements.0.width','100'),('matrixBlockTypes.d563f248-37de-412a-b0ad-eea19da5e0f9.fieldLayouts.da6619a7-ccfc-4768-b5a7-c580341ac8b4.tabs.0.elements.1.fieldUid','\"d54ca455-7ff5-451f-98e4-350b3abb1847\"'),('matrixBlockTypes.d563f248-37de-412a-b0ad-eea19da5e0f9.fieldLayouts.da6619a7-ccfc-4768-b5a7-c580341ac8b4.tabs.0.elements.1.instructions','null'),('matrixBlockTypes.d563f248-37de-412a-b0ad-eea19da5e0f9.fieldLayouts.da6619a7-ccfc-4768-b5a7-c580341ac8b4.tabs.0.elements.1.label','null'),('matrixBlockTypes.d563f248-37de-412a-b0ad-eea19da5e0f9.fieldLayouts.da6619a7-ccfc-4768-b5a7-c580341ac8b4.tabs.0.elements.1.required','false'),('matrixBlockTypes.d563f248-37de-412a-b0ad-eea19da5e0f9.fieldLayouts.da6619a7-ccfc-4768-b5a7-c580341ac8b4.tabs.0.elements.1.tip','null'),('matrixBlockTypes.d563f248-37de-412a-b0ad-eea19da5e0f9.fieldLayouts.da6619a7-ccfc-4768-b5a7-c580341ac8b4.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.d563f248-37de-412a-b0ad-eea19da5e0f9.fieldLayouts.da6619a7-ccfc-4768-b5a7-c580341ac8b4.tabs.0.elements.1.warning','null'),('matrixBlockTypes.d563f248-37de-412a-b0ad-eea19da5e0f9.fieldLayouts.da6619a7-ccfc-4768-b5a7-c580341ac8b4.tabs.0.elements.1.width','100'),('matrixBlockTypes.d563f248-37de-412a-b0ad-eea19da5e0f9.fieldLayouts.da6619a7-ccfc-4768-b5a7-c580341ac8b4.tabs.0.name','\"Content\"'),('matrixBlockTypes.d563f248-37de-412a-b0ad-eea19da5e0f9.fieldLayouts.da6619a7-ccfc-4768-b5a7-c580341ac8b4.tabs.0.sortOrder','1'),('matrixBlockTypes.d563f248-37de-412a-b0ad-eea19da5e0f9.fields.3e5005f5-763a-459a-9bb7-74b2de70f748.contentColumnType','\"text\"'),('matrixBlockTypes.d563f248-37de-412a-b0ad-eea19da5e0f9.fields.3e5005f5-763a-459a-9bb7-74b2de70f748.fieldGroup','null'),('matrixBlockTypes.d563f248-37de-412a-b0ad-eea19da5e0f9.fields.3e5005f5-763a-459a-9bb7-74b2de70f748.handle','\"buttonTitle\"'),('matrixBlockTypes.d563f248-37de-412a-b0ad-eea19da5e0f9.fields.3e5005f5-763a-459a-9bb7-74b2de70f748.instructions','\"\"'),('matrixBlockTypes.d563f248-37de-412a-b0ad-eea19da5e0f9.fields.3e5005f5-763a-459a-9bb7-74b2de70f748.name','\"Button Title\"'),('matrixBlockTypes.d563f248-37de-412a-b0ad-eea19da5e0f9.fields.3e5005f5-763a-459a-9bb7-74b2de70f748.searchable','false'),('matrixBlockTypes.d563f248-37de-412a-b0ad-eea19da5e0f9.fields.3e5005f5-763a-459a-9bb7-74b2de70f748.settings.byteLimit','null'),('matrixBlockTypes.d563f248-37de-412a-b0ad-eea19da5e0f9.fields.3e5005f5-763a-459a-9bb7-74b2de70f748.settings.charLimit','null'),('matrixBlockTypes.d563f248-37de-412a-b0ad-eea19da5e0f9.fields.3e5005f5-763a-459a-9bb7-74b2de70f748.settings.code','\"\"'),('matrixBlockTypes.d563f248-37de-412a-b0ad-eea19da5e0f9.fields.3e5005f5-763a-459a-9bb7-74b2de70f748.settings.columnType','null'),('matrixBlockTypes.d563f248-37de-412a-b0ad-eea19da5e0f9.fields.3e5005f5-763a-459a-9bb7-74b2de70f748.settings.initialRows','\"4\"'),('matrixBlockTypes.d563f248-37de-412a-b0ad-eea19da5e0f9.fields.3e5005f5-763a-459a-9bb7-74b2de70f748.settings.multiline','\"\"'),('matrixBlockTypes.d563f248-37de-412a-b0ad-eea19da5e0f9.fields.3e5005f5-763a-459a-9bb7-74b2de70f748.settings.placeholder','null'),('matrixBlockTypes.d563f248-37de-412a-b0ad-eea19da5e0f9.fields.3e5005f5-763a-459a-9bb7-74b2de70f748.settings.uiMode','\"normal\"'),('matrixBlockTypes.d563f248-37de-412a-b0ad-eea19da5e0f9.fields.3e5005f5-763a-459a-9bb7-74b2de70f748.translationKeyFormat','null'),('matrixBlockTypes.d563f248-37de-412a-b0ad-eea19da5e0f9.fields.3e5005f5-763a-459a-9bb7-74b2de70f748.translationMethod','\"none\"'),('matrixBlockTypes.d563f248-37de-412a-b0ad-eea19da5e0f9.fields.3e5005f5-763a-459a-9bb7-74b2de70f748.type','\"craft\\\\fields\\\\PlainText\"'),('matrixBlockTypes.d563f248-37de-412a-b0ad-eea19da5e0f9.fields.d54ca455-7ff5-451f-98e4-350b3abb1847.contentColumnType','\"string\"'),('matrixBlockTypes.d563f248-37de-412a-b0ad-eea19da5e0f9.fields.d54ca455-7ff5-451f-98e4-350b3abb1847.fieldGroup','null'),('matrixBlockTypes.d563f248-37de-412a-b0ad-eea19da5e0f9.fields.d54ca455-7ff5-451f-98e4-350b3abb1847.handle','\"buttonLink\"'),('matrixBlockTypes.d563f248-37de-412a-b0ad-eea19da5e0f9.fields.d54ca455-7ff5-451f-98e4-350b3abb1847.instructions','\"Choose an entry.\"'),('matrixBlockTypes.d563f248-37de-412a-b0ad-eea19da5e0f9.fields.d54ca455-7ff5-451f-98e4-350b3abb1847.name','\"Button Link\"'),('matrixBlockTypes.d563f248-37de-412a-b0ad-eea19da5e0f9.fields.d54ca455-7ff5-451f-98e4-350b3abb1847.searchable','false'),('matrixBlockTypes.d563f248-37de-412a-b0ad-eea19da5e0f9.fields.d54ca455-7ff5-451f-98e4-350b3abb1847.settings.allowSelfRelations','false'),('matrixBlockTypes.d563f248-37de-412a-b0ad-eea19da5e0f9.fields.d54ca455-7ff5-451f-98e4-350b3abb1847.settings.limit','\"1\"'),('matrixBlockTypes.d563f248-37de-412a-b0ad-eea19da5e0f9.fields.d54ca455-7ff5-451f-98e4-350b3abb1847.settings.localizeRelations','false'),('matrixBlockTypes.d563f248-37de-412a-b0ad-eea19da5e0f9.fields.d54ca455-7ff5-451f-98e4-350b3abb1847.settings.selectionLabel','\"\"'),('matrixBlockTypes.d563f248-37de-412a-b0ad-eea19da5e0f9.fields.d54ca455-7ff5-451f-98e4-350b3abb1847.settings.showSiteMenu','false'),('matrixBlockTypes.d563f248-37de-412a-b0ad-eea19da5e0f9.fields.d54ca455-7ff5-451f-98e4-350b3abb1847.settings.source','null'),('matrixBlockTypes.d563f248-37de-412a-b0ad-eea19da5e0f9.fields.d54ca455-7ff5-451f-98e4-350b3abb1847.settings.sources','\"*\"'),('matrixBlockTypes.d563f248-37de-412a-b0ad-eea19da5e0f9.fields.d54ca455-7ff5-451f-98e4-350b3abb1847.settings.targetSiteId','null'),('matrixBlockTypes.d563f248-37de-412a-b0ad-eea19da5e0f9.fields.d54ca455-7ff5-451f-98e4-350b3abb1847.settings.validateRelatedElements','false'),('matrixBlockTypes.d563f248-37de-412a-b0ad-eea19da5e0f9.fields.d54ca455-7ff5-451f-98e4-350b3abb1847.settings.viewMode','null'),('matrixBlockTypes.d563f248-37de-412a-b0ad-eea19da5e0f9.fields.d54ca455-7ff5-451f-98e4-350b3abb1847.translationKeyFormat','null'),('matrixBlockTypes.d563f248-37de-412a-b0ad-eea19da5e0f9.fields.d54ca455-7ff5-451f-98e4-350b3abb1847.translationMethod','\"site\"'),('matrixBlockTypes.d563f248-37de-412a-b0ad-eea19da5e0f9.fields.d54ca455-7ff5-451f-98e4-350b3abb1847.type','\"craft\\\\fields\\\\Entries\"'),('matrixBlockTypes.d563f248-37de-412a-b0ad-eea19da5e0f9.handle','\"internalLink\"'),('matrixBlockTypes.d563f248-37de-412a-b0ad-eea19da5e0f9.name','\"Internal Link\"'),('matrixBlockTypes.d563f248-37de-412a-b0ad-eea19da5e0f9.sortOrder','1'),('matrixBlockTypes.ead943da-9146-4b32-9f33-8096b522e085.field','\"4b0ce80c-181f-4c40-bcce-5146dc8c903e\"'),('matrixBlockTypes.ead943da-9146-4b32-9f33-8096b522e085.fieldLayouts.9d1dd6bd-ecbd-4cec-a43f-fe57ed410352.tabs.0.elements.0.fieldUid','\"7d034fae-78a0-49b6-a213-aa01fcdf690e\"'),('matrixBlockTypes.ead943da-9146-4b32-9f33-8096b522e085.fieldLayouts.9d1dd6bd-ecbd-4cec-a43f-fe57ed410352.tabs.0.elements.0.instructions','null'),('matrixBlockTypes.ead943da-9146-4b32-9f33-8096b522e085.fieldLayouts.9d1dd6bd-ecbd-4cec-a43f-fe57ed410352.tabs.0.elements.0.label','null'),('matrixBlockTypes.ead943da-9146-4b32-9f33-8096b522e085.fieldLayouts.9d1dd6bd-ecbd-4cec-a43f-fe57ed410352.tabs.0.elements.0.required','false'),('matrixBlockTypes.ead943da-9146-4b32-9f33-8096b522e085.fieldLayouts.9d1dd6bd-ecbd-4cec-a43f-fe57ed410352.tabs.0.elements.0.tip','null'),('matrixBlockTypes.ead943da-9146-4b32-9f33-8096b522e085.fieldLayouts.9d1dd6bd-ecbd-4cec-a43f-fe57ed410352.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('matrixBlockTypes.ead943da-9146-4b32-9f33-8096b522e085.fieldLayouts.9d1dd6bd-ecbd-4cec-a43f-fe57ed410352.tabs.0.elements.0.warning','null'),('matrixBlockTypes.ead943da-9146-4b32-9f33-8096b522e085.fieldLayouts.9d1dd6bd-ecbd-4cec-a43f-fe57ed410352.tabs.0.elements.0.width','100'),('matrixBlockTypes.ead943da-9146-4b32-9f33-8096b522e085.fieldLayouts.9d1dd6bd-ecbd-4cec-a43f-fe57ed410352.tabs.0.name','\"Content\"'),('matrixBlockTypes.ead943da-9146-4b32-9f33-8096b522e085.fieldLayouts.9d1dd6bd-ecbd-4cec-a43f-fe57ed410352.tabs.0.sortOrder','1'),('matrixBlockTypes.ead943da-9146-4b32-9f33-8096b522e085.fields.7d034fae-78a0-49b6-a213-aa01fcdf690e.contentColumnType','\"text\"'),('matrixBlockTypes.ead943da-9146-4b32-9f33-8096b522e085.fields.7d034fae-78a0-49b6-a213-aa01fcdf690e.fieldGroup','null'),('matrixBlockTypes.ead943da-9146-4b32-9f33-8096b522e085.fields.7d034fae-78a0-49b6-a213-aa01fcdf690e.handle','\"video\"'),('matrixBlockTypes.ead943da-9146-4b32-9f33-8096b522e085.fields.7d034fae-78a0-49b6-a213-aa01fcdf690e.instructions','\"Enter the URL of the video.\"'),('matrixBlockTypes.ead943da-9146-4b32-9f33-8096b522e085.fields.7d034fae-78a0-49b6-a213-aa01fcdf690e.name','\"Video\"'),('matrixBlockTypes.ead943da-9146-4b32-9f33-8096b522e085.fields.7d034fae-78a0-49b6-a213-aa01fcdf690e.searchable','false'),('matrixBlockTypes.ead943da-9146-4b32-9f33-8096b522e085.fields.7d034fae-78a0-49b6-a213-aa01fcdf690e.settings.url','\"\"'),('matrixBlockTypes.ead943da-9146-4b32-9f33-8096b522e085.fields.7d034fae-78a0-49b6-a213-aa01fcdf690e.translationKeyFormat','null'),('matrixBlockTypes.ead943da-9146-4b32-9f33-8096b522e085.fields.7d034fae-78a0-49b6-a213-aa01fcdf690e.translationMethod','\"none\"'),('matrixBlockTypes.ead943da-9146-4b32-9f33-8096b522e085.fields.7d034fae-78a0-49b6-a213-aa01fcdf690e.type','\"wrav\\\\oembed\\\\fields\\\\OembedField\"'),('matrixBlockTypes.ead943da-9146-4b32-9f33-8096b522e085.handle','\"externalVideo\"'),('matrixBlockTypes.ead943da-9146-4b32-9f33-8096b522e085.name','\"External Video\"'),('matrixBlockTypes.ead943da-9146-4b32-9f33-8096b522e085.sortOrder','1'),('navigation.navs.23255a47-8fcd-4ad9-8129-8bd0e89121e5.handle','\"footerNavigation\"'),('navigation.navs.23255a47-8fcd-4ad9-8129-8bd0e89121e5.instructions','\"\"'),('navigation.navs.23255a47-8fcd-4ad9-8129-8bd0e89121e5.maxNodes','\"\"'),('navigation.navs.23255a47-8fcd-4ad9-8129-8bd0e89121e5.name','\"Footer Navigation\"'),('navigation.navs.23255a47-8fcd-4ad9-8129-8bd0e89121e5.permissions.craft\\elements\\Asset.enabled','\"1\"'),('navigation.navs.23255a47-8fcd-4ad9-8129-8bd0e89121e5.permissions.craft\\elements\\Asset.permissions','\"*\"'),('navigation.navs.23255a47-8fcd-4ad9-8129-8bd0e89121e5.permissions.craft\\elements\\Category.enabled','\"1\"'),('navigation.navs.23255a47-8fcd-4ad9-8129-8bd0e89121e5.permissions.craft\\elements\\Category.permissions','\"*\"'),('navigation.navs.23255a47-8fcd-4ad9-8129-8bd0e89121e5.permissions.craft\\elements\\Entry.enabled','\"1\"'),('navigation.navs.23255a47-8fcd-4ad9-8129-8bd0e89121e5.permissions.craft\\elements\\Entry.permissions','\"*\"'),('navigation.navs.23255a47-8fcd-4ad9-8129-8bd0e89121e5.permissions.craft\\elements\\Tag.enabled','\"\"'),('navigation.navs.23255a47-8fcd-4ad9-8129-8bd0e89121e5.permissions.craft\\elements\\Tag.permissions','\"*\"'),('navigation.navs.23255a47-8fcd-4ad9-8129-8bd0e89121e5.permissions.custom.enabled','\"1\"'),('navigation.navs.23255a47-8fcd-4ad9-8129-8bd0e89121e5.permissions.verbb\\navigation\\nodetypes\\PassiveType.enabled','\"1\"'),('navigation.navs.23255a47-8fcd-4ad9-8129-8bd0e89121e5.propagateNodes','false'),('navigation.navs.23255a47-8fcd-4ad9-8129-8bd0e89121e5.siteSettings.18d78006-3985-4ea4-b620-67bae10d9c2d','null'),('navigation.navs.23255a47-8fcd-4ad9-8129-8bd0e89121e5.sortOrder','3'),('navigation.navs.23255a47-8fcd-4ad9-8129-8bd0e89121e5.structure.maxLevels','null'),('navigation.navs.23255a47-8fcd-4ad9-8129-8bd0e89121e5.structure.uid','\"e80740e1-644b-4f00-b82f-2ee588657483\"'),('navigation.navs.8b5fa4d7-86cd-4e9b-b8d4-3731f1a60289.handle','\"mainNavigation\"'),('navigation.navs.8b5fa4d7-86cd-4e9b-b8d4-3731f1a60289.instructions','\"\"'),('navigation.navs.8b5fa4d7-86cd-4e9b-b8d4-3731f1a60289.maxNodes','\"\"'),('navigation.navs.8b5fa4d7-86cd-4e9b-b8d4-3731f1a60289.name','\"Main Navigation\"'),('navigation.navs.8b5fa4d7-86cd-4e9b-b8d4-3731f1a60289.permissions.craft\\elements\\Asset.enabled','\"1\"'),('navigation.navs.8b5fa4d7-86cd-4e9b-b8d4-3731f1a60289.permissions.craft\\elements\\Asset.permissions','\"*\"'),('navigation.navs.8b5fa4d7-86cd-4e9b-b8d4-3731f1a60289.permissions.craft\\elements\\Category.enabled','\"1\"'),('navigation.navs.8b5fa4d7-86cd-4e9b-b8d4-3731f1a60289.permissions.craft\\elements\\Category.permissions','\"*\"'),('navigation.navs.8b5fa4d7-86cd-4e9b-b8d4-3731f1a60289.permissions.craft\\elements\\Entry.enabled','\"1\"'),('navigation.navs.8b5fa4d7-86cd-4e9b-b8d4-3731f1a60289.permissions.craft\\elements\\Entry.permissions','\"*\"'),('navigation.navs.8b5fa4d7-86cd-4e9b-b8d4-3731f1a60289.permissions.craft\\elements\\Tag.enabled','\"\"'),('navigation.navs.8b5fa4d7-86cd-4e9b-b8d4-3731f1a60289.permissions.craft\\elements\\Tag.permissions','\"*\"'),('navigation.navs.8b5fa4d7-86cd-4e9b-b8d4-3731f1a60289.permissions.custom.enabled','\"1\"'),('navigation.navs.8b5fa4d7-86cd-4e9b-b8d4-3731f1a60289.permissions.verbb\\navigation\\nodetypes\\PassiveType.enabled','\"1\"'),('navigation.navs.8b5fa4d7-86cd-4e9b-b8d4-3731f1a60289.propagateNodes','false'),('navigation.navs.8b5fa4d7-86cd-4e9b-b8d4-3731f1a60289.siteSettings.18d78006-3985-4ea4-b620-67bae10d9c2d','null'),('navigation.navs.8b5fa4d7-86cd-4e9b-b8d4-3731f1a60289.sortOrder','2'),('navigation.navs.8b5fa4d7-86cd-4e9b-b8d4-3731f1a60289.structure.maxLevels','null'),('navigation.navs.8b5fa4d7-86cd-4e9b-b8d4-3731f1a60289.structure.uid','\"a7557cc5-d262-4681-9269-d6275d98085c\"'),('neoBlockTypeGroups.9c3f9dfb-fbb4-4ab1-b8db-5dc9b6045f2d.field','\"1d1d5665-5674-4388-8d46-9b87e4dc65d3\"'),('neoBlockTypeGroups.9c3f9dfb-fbb4-4ab1-b8db-5dc9b6045f2d.name','\"Blocks\"'),('neoBlockTypeGroups.9c3f9dfb-fbb4-4ab1-b8db-5dc9b6045f2d.sortOrder','5'),('neoBlockTypeGroups.dcc7e763-cfad-42ba-a4ed-f0c111f2446b.field','\"1d1d5665-5674-4388-8d46-9b87e4dc65d3\"'),('neoBlockTypeGroups.dcc7e763-cfad-42ba-a4ed-f0c111f2446b.name','\"Media\"'),('neoBlockTypeGroups.dcc7e763-cfad-42ba-a4ed-f0c111f2446b.sortOrder','1'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.childBlocks','\"\"'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.field','\"d783368e-a494-4457-9e99-5a027ae72a18\"'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.0.elements.0.fieldUid','\"2f64efd3-101a-4ed1-a31e-96657d6dc6e5\"'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.0.elements.0.instructions','null'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.0.elements.0.label','null'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.0.elements.0.required','false'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.0.elements.0.tip','null'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.0.elements.0.warning','null'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.0.elements.0.width','100'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.0.elements.1.fieldUid','\"1d1c9f28-39de-4df6-b077-856d16c001ca\"'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.0.elements.1.instructions','null'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.0.elements.1.label','null'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.0.elements.1.required','false'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.0.elements.1.tip','null'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.0.elements.1.warning','null'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.0.elements.1.width','100'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.0.elements.2.fieldUid','\"4870444e-6820-4ab0-a141-99e310305629\"'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.0.elements.2.instructions','null'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.0.elements.2.label','null'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.0.elements.2.required','false'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.0.elements.2.tip','null'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.0.elements.2.warning','null'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.0.elements.2.width','100'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.0.name','\"Main Content\"'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.0.sortOrder','1'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.1.elements.0.fieldUid','\"336f207f-f4fb-43c3-bbc3-f10b641e940a\"'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.1.elements.0.instructions','null'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.1.elements.0.label','null'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.1.elements.0.required','false'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.1.elements.0.tip','null'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.1.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.1.elements.0.warning','null'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.1.elements.0.width','100'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.1.elements.1.fieldUid','\"6c4a2320-184d-4f3b-9482-070fc8b8194a\"'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.1.elements.1.instructions','null'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.1.elements.1.label','null'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.1.elements.1.required','false'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.1.elements.1.tip','null'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.1.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.1.elements.1.warning','null'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.1.elements.1.width','100'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.1.elements.2.fieldUid','\"bb3731df-a01f-4725-9f8b-06d99359fd9f\"'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.1.elements.2.instructions','null'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.1.elements.2.label','null'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.1.elements.2.required','false'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.1.elements.2.tip','null'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.1.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.1.elements.2.warning','null'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.1.elements.2.width','100'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.1.name','\"Settings\"'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.1.sortOrder','2'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.handle','\"mainHeader\"'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.maxBlocks','0'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.maxChildBlocks','0'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.maxSiblingBlocks','0'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.name','\"Main Header\"'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.sortOrder','1'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.topLevel','true'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.childBlocks','\"\"'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.field','\"1d1d5665-5674-4388-8d46-9b87e4dc65d3\"'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.0.elements.0.fieldUid','\"1d1c9f28-39de-4df6-b077-856d16c001ca\"'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.0.elements.0.instructions','null'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.0.elements.0.label','null'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.0.elements.0.required','false'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.0.elements.0.tip','null'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.0.elements.0.warning','null'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.0.elements.0.width','100'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.0.name','\"Main Content\"'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.0.sortOrder','1'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.1.elements.0.fieldUid','\"336f207f-f4fb-43c3-bbc3-f10b641e940a\"'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.1.elements.0.instructions','null'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.1.elements.0.label','null'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.1.elements.0.required','false'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.1.elements.0.tip','null'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.1.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.1.elements.0.warning','null'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.1.elements.0.width','100'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.1.elements.1.fieldUid','\"6c4a2320-184d-4f3b-9482-070fc8b8194a\"'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.1.elements.1.instructions','null'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.1.elements.1.label','null'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.1.elements.1.required','false'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.1.elements.1.tip','null'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.1.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.1.elements.1.warning','null'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.1.elements.1.width','100'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.1.elements.2.fieldUid','\"bb3731df-a01f-4725-9f8b-06d99359fd9f\"'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.1.elements.2.instructions','null'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.1.elements.2.label','null'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.1.elements.2.required','false'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.1.elements.2.tip','null'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.1.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.1.elements.2.warning','null'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.1.elements.2.width','100'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.1.name','\"Settings\"'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.1.sortOrder','2'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.handle','\"copy\"'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.maxBlocks','0'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.maxChildBlocks','0'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.maxSiblingBlocks','0'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.name','\"Copy\"'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.sortOrder','2'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.topLevel','true'),('neoBlockTypes.75e32298-2afc-42e4-a7a1-a0df691a9522.childBlocks','\"\"'),('neoBlockTypes.75e32298-2afc-42e4-a7a1-a0df691a9522.field','\"1d1d5665-5674-4388-8d46-9b87e4dc65d3\"'),('neoBlockTypes.75e32298-2afc-42e4-a7a1-a0df691a9522.fieldLayouts.99e9a34b-f717-4b29-8c2b-75b95fd83d8f.tabs.0.elements.0.fieldUid','\"ae523ce4-60b9-4674-8ed4-cbfa6ff0c20c\"'),('neoBlockTypes.75e32298-2afc-42e4-a7a1-a0df691a9522.fieldLayouts.99e9a34b-f717-4b29-8c2b-75b95fd83d8f.tabs.0.elements.0.instructions','null'),('neoBlockTypes.75e32298-2afc-42e4-a7a1-a0df691a9522.fieldLayouts.99e9a34b-f717-4b29-8c2b-75b95fd83d8f.tabs.0.elements.0.label','null'),('neoBlockTypes.75e32298-2afc-42e4-a7a1-a0df691a9522.fieldLayouts.99e9a34b-f717-4b29-8c2b-75b95fd83d8f.tabs.0.elements.0.required','false'),('neoBlockTypes.75e32298-2afc-42e4-a7a1-a0df691a9522.fieldLayouts.99e9a34b-f717-4b29-8c2b-75b95fd83d8f.tabs.0.elements.0.tip','null'),('neoBlockTypes.75e32298-2afc-42e4-a7a1-a0df691a9522.fieldLayouts.99e9a34b-f717-4b29-8c2b-75b95fd83d8f.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('neoBlockTypes.75e32298-2afc-42e4-a7a1-a0df691a9522.fieldLayouts.99e9a34b-f717-4b29-8c2b-75b95fd83d8f.tabs.0.elements.0.warning','null'),('neoBlockTypes.75e32298-2afc-42e4-a7a1-a0df691a9522.fieldLayouts.99e9a34b-f717-4b29-8c2b-75b95fd83d8f.tabs.0.elements.0.width','100'),('neoBlockTypes.75e32298-2afc-42e4-a7a1-a0df691a9522.fieldLayouts.99e9a34b-f717-4b29-8c2b-75b95fd83d8f.tabs.0.name','\"Main Content\"'),('neoBlockTypes.75e32298-2afc-42e4-a7a1-a0df691a9522.fieldLayouts.99e9a34b-f717-4b29-8c2b-75b95fd83d8f.tabs.0.sortOrder','1'),('neoBlockTypes.75e32298-2afc-42e4-a7a1-a0df691a9522.fieldLayouts.99e9a34b-f717-4b29-8c2b-75b95fd83d8f.tabs.1.elements.0.fieldUid','\"336f207f-f4fb-43c3-bbc3-f10b641e940a\"'),('neoBlockTypes.75e32298-2afc-42e4-a7a1-a0df691a9522.fieldLayouts.99e9a34b-f717-4b29-8c2b-75b95fd83d8f.tabs.1.elements.0.instructions','null'),('neoBlockTypes.75e32298-2afc-42e4-a7a1-a0df691a9522.fieldLayouts.99e9a34b-f717-4b29-8c2b-75b95fd83d8f.tabs.1.elements.0.label','null'),('neoBlockTypes.75e32298-2afc-42e4-a7a1-a0df691a9522.fieldLayouts.99e9a34b-f717-4b29-8c2b-75b95fd83d8f.tabs.1.elements.0.required','false'),('neoBlockTypes.75e32298-2afc-42e4-a7a1-a0df691a9522.fieldLayouts.99e9a34b-f717-4b29-8c2b-75b95fd83d8f.tabs.1.elements.0.tip','null'),('neoBlockTypes.75e32298-2afc-42e4-a7a1-a0df691a9522.fieldLayouts.99e9a34b-f717-4b29-8c2b-75b95fd83d8f.tabs.1.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('neoBlockTypes.75e32298-2afc-42e4-a7a1-a0df691a9522.fieldLayouts.99e9a34b-f717-4b29-8c2b-75b95fd83d8f.tabs.1.elements.0.warning','null'),('neoBlockTypes.75e32298-2afc-42e4-a7a1-a0df691a9522.fieldLayouts.99e9a34b-f717-4b29-8c2b-75b95fd83d8f.tabs.1.elements.0.width','100'),('neoBlockTypes.75e32298-2afc-42e4-a7a1-a0df691a9522.fieldLayouts.99e9a34b-f717-4b29-8c2b-75b95fd83d8f.tabs.1.elements.1.fieldUid','\"6c4a2320-184d-4f3b-9482-070fc8b8194a\"'),('neoBlockTypes.75e32298-2afc-42e4-a7a1-a0df691a9522.fieldLayouts.99e9a34b-f717-4b29-8c2b-75b95fd83d8f.tabs.1.elements.1.instructions','null'),('neoBlockTypes.75e32298-2afc-42e4-a7a1-a0df691a9522.fieldLayouts.99e9a34b-f717-4b29-8c2b-75b95fd83d8f.tabs.1.elements.1.label','null'),('neoBlockTypes.75e32298-2afc-42e4-a7a1-a0df691a9522.fieldLayouts.99e9a34b-f717-4b29-8c2b-75b95fd83d8f.tabs.1.elements.1.required','false'),('neoBlockTypes.75e32298-2afc-42e4-a7a1-a0df691a9522.fieldLayouts.99e9a34b-f717-4b29-8c2b-75b95fd83d8f.tabs.1.elements.1.tip','null'),('neoBlockTypes.75e32298-2afc-42e4-a7a1-a0df691a9522.fieldLayouts.99e9a34b-f717-4b29-8c2b-75b95fd83d8f.tabs.1.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('neoBlockTypes.75e32298-2afc-42e4-a7a1-a0df691a9522.fieldLayouts.99e9a34b-f717-4b29-8c2b-75b95fd83d8f.tabs.1.elements.1.warning','null'),('neoBlockTypes.75e32298-2afc-42e4-a7a1-a0df691a9522.fieldLayouts.99e9a34b-f717-4b29-8c2b-75b95fd83d8f.tabs.1.elements.1.width','100'),('neoBlockTypes.75e32298-2afc-42e4-a7a1-a0df691a9522.fieldLayouts.99e9a34b-f717-4b29-8c2b-75b95fd83d8f.tabs.1.elements.2.fieldUid','\"bb3731df-a01f-4725-9f8b-06d99359fd9f\"'),('neoBlockTypes.75e32298-2afc-42e4-a7a1-a0df691a9522.fieldLayouts.99e9a34b-f717-4b29-8c2b-75b95fd83d8f.tabs.1.elements.2.instructions','null'),('neoBlockTypes.75e32298-2afc-42e4-a7a1-a0df691a9522.fieldLayouts.99e9a34b-f717-4b29-8c2b-75b95fd83d8f.tabs.1.elements.2.label','null'),('neoBlockTypes.75e32298-2afc-42e4-a7a1-a0df691a9522.fieldLayouts.99e9a34b-f717-4b29-8c2b-75b95fd83d8f.tabs.1.elements.2.required','false'),('neoBlockTypes.75e32298-2afc-42e4-a7a1-a0df691a9522.fieldLayouts.99e9a34b-f717-4b29-8c2b-75b95fd83d8f.tabs.1.elements.2.tip','null'),('neoBlockTypes.75e32298-2afc-42e4-a7a1-a0df691a9522.fieldLayouts.99e9a34b-f717-4b29-8c2b-75b95fd83d8f.tabs.1.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('neoBlockTypes.75e32298-2afc-42e4-a7a1-a0df691a9522.fieldLayouts.99e9a34b-f717-4b29-8c2b-75b95fd83d8f.tabs.1.elements.2.warning','null'),('neoBlockTypes.75e32298-2afc-42e4-a7a1-a0df691a9522.fieldLayouts.99e9a34b-f717-4b29-8c2b-75b95fd83d8f.tabs.1.elements.2.width','100'),('neoBlockTypes.75e32298-2afc-42e4-a7a1-a0df691a9522.fieldLayouts.99e9a34b-f717-4b29-8c2b-75b95fd83d8f.tabs.1.name','\"Settings\"'),('neoBlockTypes.75e32298-2afc-42e4-a7a1-a0df691a9522.fieldLayouts.99e9a34b-f717-4b29-8c2b-75b95fd83d8f.tabs.1.sortOrder','2'),('neoBlockTypes.75e32298-2afc-42e4-a7a1-a0df691a9522.handle','\"button\"'),('neoBlockTypes.75e32298-2afc-42e4-a7a1-a0df691a9522.maxBlocks','0'),('neoBlockTypes.75e32298-2afc-42e4-a7a1-a0df691a9522.maxChildBlocks','0'),('neoBlockTypes.75e32298-2afc-42e4-a7a1-a0df691a9522.maxSiblingBlocks','0'),('neoBlockTypes.75e32298-2afc-42e4-a7a1-a0df691a9522.name','\"Button\"'),('neoBlockTypes.75e32298-2afc-42e4-a7a1-a0df691a9522.sortOrder','4'),('neoBlockTypes.75e32298-2afc-42e4-a7a1-a0df691a9522.topLevel','true'),('neoBlockTypes.8062a4c1-1fc1-482e-9121-c05e1d679599.childBlocks','\"\"'),('neoBlockTypes.8062a4c1-1fc1-482e-9121-c05e1d679599.field','\"1d1d5665-5674-4388-8d46-9b87e4dc65d3\"'),('neoBlockTypes.8062a4c1-1fc1-482e-9121-c05e1d679599.fieldLayouts.03e13715-9e15-411e-9502-fb9b8a38cb3b.tabs.0.elements.0.fieldUid','\"2f64efd3-101a-4ed1-a31e-96657d6dc6e5\"'),('neoBlockTypes.8062a4c1-1fc1-482e-9121-c05e1d679599.fieldLayouts.03e13715-9e15-411e-9502-fb9b8a38cb3b.tabs.0.elements.0.instructions','null'),('neoBlockTypes.8062a4c1-1fc1-482e-9121-c05e1d679599.fieldLayouts.03e13715-9e15-411e-9502-fb9b8a38cb3b.tabs.0.elements.0.label','null'),('neoBlockTypes.8062a4c1-1fc1-482e-9121-c05e1d679599.fieldLayouts.03e13715-9e15-411e-9502-fb9b8a38cb3b.tabs.0.elements.0.required','false'),('neoBlockTypes.8062a4c1-1fc1-482e-9121-c05e1d679599.fieldLayouts.03e13715-9e15-411e-9502-fb9b8a38cb3b.tabs.0.elements.0.tip','null'),('neoBlockTypes.8062a4c1-1fc1-482e-9121-c05e1d679599.fieldLayouts.03e13715-9e15-411e-9502-fb9b8a38cb3b.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('neoBlockTypes.8062a4c1-1fc1-482e-9121-c05e1d679599.fieldLayouts.03e13715-9e15-411e-9502-fb9b8a38cb3b.tabs.0.elements.0.warning','null'),('neoBlockTypes.8062a4c1-1fc1-482e-9121-c05e1d679599.fieldLayouts.03e13715-9e15-411e-9502-fb9b8a38cb3b.tabs.0.elements.0.width','100'),('neoBlockTypes.8062a4c1-1fc1-482e-9121-c05e1d679599.fieldLayouts.03e13715-9e15-411e-9502-fb9b8a38cb3b.tabs.0.elements.1.fieldUid','\"b2c6e66f-5fcd-4220-b710-2624b1ef531d\"'),('neoBlockTypes.8062a4c1-1fc1-482e-9121-c05e1d679599.fieldLayouts.03e13715-9e15-411e-9502-fb9b8a38cb3b.tabs.0.elements.1.instructions','null'),('neoBlockTypes.8062a4c1-1fc1-482e-9121-c05e1d679599.fieldLayouts.03e13715-9e15-411e-9502-fb9b8a38cb3b.tabs.0.elements.1.label','null'),('neoBlockTypes.8062a4c1-1fc1-482e-9121-c05e1d679599.fieldLayouts.03e13715-9e15-411e-9502-fb9b8a38cb3b.tabs.0.elements.1.required','false'),('neoBlockTypes.8062a4c1-1fc1-482e-9121-c05e1d679599.fieldLayouts.03e13715-9e15-411e-9502-fb9b8a38cb3b.tabs.0.elements.1.tip','null'),('neoBlockTypes.8062a4c1-1fc1-482e-9121-c05e1d679599.fieldLayouts.03e13715-9e15-411e-9502-fb9b8a38cb3b.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('neoBlockTypes.8062a4c1-1fc1-482e-9121-c05e1d679599.fieldLayouts.03e13715-9e15-411e-9502-fb9b8a38cb3b.tabs.0.elements.1.warning','null'),('neoBlockTypes.8062a4c1-1fc1-482e-9121-c05e1d679599.fieldLayouts.03e13715-9e15-411e-9502-fb9b8a38cb3b.tabs.0.elements.1.width','100'),('neoBlockTypes.8062a4c1-1fc1-482e-9121-c05e1d679599.fieldLayouts.03e13715-9e15-411e-9502-fb9b8a38cb3b.tabs.0.name','\"Main Content\"'),('neoBlockTypes.8062a4c1-1fc1-482e-9121-c05e1d679599.fieldLayouts.03e13715-9e15-411e-9502-fb9b8a38cb3b.tabs.0.sortOrder','1'),('neoBlockTypes.8062a4c1-1fc1-482e-9121-c05e1d679599.fieldLayouts.03e13715-9e15-411e-9502-fb9b8a38cb3b.tabs.1.elements.0.fieldUid','\"bb3731df-a01f-4725-9f8b-06d99359fd9f\"'),('neoBlockTypes.8062a4c1-1fc1-482e-9121-c05e1d679599.fieldLayouts.03e13715-9e15-411e-9502-fb9b8a38cb3b.tabs.1.elements.0.instructions','null'),('neoBlockTypes.8062a4c1-1fc1-482e-9121-c05e1d679599.fieldLayouts.03e13715-9e15-411e-9502-fb9b8a38cb3b.tabs.1.elements.0.label','null'),('neoBlockTypes.8062a4c1-1fc1-482e-9121-c05e1d679599.fieldLayouts.03e13715-9e15-411e-9502-fb9b8a38cb3b.tabs.1.elements.0.required','false'),('neoBlockTypes.8062a4c1-1fc1-482e-9121-c05e1d679599.fieldLayouts.03e13715-9e15-411e-9502-fb9b8a38cb3b.tabs.1.elements.0.tip','null'),('neoBlockTypes.8062a4c1-1fc1-482e-9121-c05e1d679599.fieldLayouts.03e13715-9e15-411e-9502-fb9b8a38cb3b.tabs.1.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('neoBlockTypes.8062a4c1-1fc1-482e-9121-c05e1d679599.fieldLayouts.03e13715-9e15-411e-9502-fb9b8a38cb3b.tabs.1.elements.0.warning','null'),('neoBlockTypes.8062a4c1-1fc1-482e-9121-c05e1d679599.fieldLayouts.03e13715-9e15-411e-9502-fb9b8a38cb3b.tabs.1.elements.0.width','100'),('neoBlockTypes.8062a4c1-1fc1-482e-9121-c05e1d679599.fieldLayouts.03e13715-9e15-411e-9502-fb9b8a38cb3b.tabs.1.elements.1.fieldUid','\"6c4a2320-184d-4f3b-9482-070fc8b8194a\"'),('neoBlockTypes.8062a4c1-1fc1-482e-9121-c05e1d679599.fieldLayouts.03e13715-9e15-411e-9502-fb9b8a38cb3b.tabs.1.elements.1.instructions','null'),('neoBlockTypes.8062a4c1-1fc1-482e-9121-c05e1d679599.fieldLayouts.03e13715-9e15-411e-9502-fb9b8a38cb3b.tabs.1.elements.1.label','null'),('neoBlockTypes.8062a4c1-1fc1-482e-9121-c05e1d679599.fieldLayouts.03e13715-9e15-411e-9502-fb9b8a38cb3b.tabs.1.elements.1.required','false'),('neoBlockTypes.8062a4c1-1fc1-482e-9121-c05e1d679599.fieldLayouts.03e13715-9e15-411e-9502-fb9b8a38cb3b.tabs.1.elements.1.tip','null'),('neoBlockTypes.8062a4c1-1fc1-482e-9121-c05e1d679599.fieldLayouts.03e13715-9e15-411e-9502-fb9b8a38cb3b.tabs.1.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('neoBlockTypes.8062a4c1-1fc1-482e-9121-c05e1d679599.fieldLayouts.03e13715-9e15-411e-9502-fb9b8a38cb3b.tabs.1.elements.1.warning','null'),('neoBlockTypes.8062a4c1-1fc1-482e-9121-c05e1d679599.fieldLayouts.03e13715-9e15-411e-9502-fb9b8a38cb3b.tabs.1.elements.1.width','100'),('neoBlockTypes.8062a4c1-1fc1-482e-9121-c05e1d679599.fieldLayouts.03e13715-9e15-411e-9502-fb9b8a38cb3b.tabs.1.elements.2.fieldUid','\"336f207f-f4fb-43c3-bbc3-f10b641e940a\"'),('neoBlockTypes.8062a4c1-1fc1-482e-9121-c05e1d679599.fieldLayouts.03e13715-9e15-411e-9502-fb9b8a38cb3b.tabs.1.elements.2.instructions','null'),('neoBlockTypes.8062a4c1-1fc1-482e-9121-c05e1d679599.fieldLayouts.03e13715-9e15-411e-9502-fb9b8a38cb3b.tabs.1.elements.2.label','null'),('neoBlockTypes.8062a4c1-1fc1-482e-9121-c05e1d679599.fieldLayouts.03e13715-9e15-411e-9502-fb9b8a38cb3b.tabs.1.elements.2.required','false'),('neoBlockTypes.8062a4c1-1fc1-482e-9121-c05e1d679599.fieldLayouts.03e13715-9e15-411e-9502-fb9b8a38cb3b.tabs.1.elements.2.tip','null'),('neoBlockTypes.8062a4c1-1fc1-482e-9121-c05e1d679599.fieldLayouts.03e13715-9e15-411e-9502-fb9b8a38cb3b.tabs.1.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('neoBlockTypes.8062a4c1-1fc1-482e-9121-c05e1d679599.fieldLayouts.03e13715-9e15-411e-9502-fb9b8a38cb3b.tabs.1.elements.2.warning','null'),('neoBlockTypes.8062a4c1-1fc1-482e-9121-c05e1d679599.fieldLayouts.03e13715-9e15-411e-9502-fb9b8a38cb3b.tabs.1.elements.2.width','100'),('neoBlockTypes.8062a4c1-1fc1-482e-9121-c05e1d679599.fieldLayouts.03e13715-9e15-411e-9502-fb9b8a38cb3b.tabs.1.name','\"Settings\"'),('neoBlockTypes.8062a4c1-1fc1-482e-9121-c05e1d679599.fieldLayouts.03e13715-9e15-411e-9502-fb9b8a38cb3b.tabs.1.sortOrder','2'),('neoBlockTypes.8062a4c1-1fc1-482e-9121-c05e1d679599.handle','\"accordion\"'),('neoBlockTypes.8062a4c1-1fc1-482e-9121-c05e1d679599.maxBlocks','0'),('neoBlockTypes.8062a4c1-1fc1-482e-9121-c05e1d679599.maxChildBlocks','0'),('neoBlockTypes.8062a4c1-1fc1-482e-9121-c05e1d679599.maxSiblingBlocks','0'),('neoBlockTypes.8062a4c1-1fc1-482e-9121-c05e1d679599.name','\"Accordion\"'),('neoBlockTypes.8062a4c1-1fc1-482e-9121-c05e1d679599.sortOrder','8'),('neoBlockTypes.8062a4c1-1fc1-482e-9121-c05e1d679599.topLevel','true'),('neoBlockTypes.ba88d9cd-1570-43ff-9e92-aa456cff2540.childBlocks','\"\"'),('neoBlockTypes.ba88d9cd-1570-43ff-9e92-aa456cff2540.field','\"1d1d5665-5674-4388-8d46-9b87e4dc65d3\"'),('neoBlockTypes.ba88d9cd-1570-43ff-9e92-aa456cff2540.fieldLayouts.2394efd8-b6b2-418c-8ce4-99bfc647be17.tabs.0.elements.0.fieldUid','\"2f64efd3-101a-4ed1-a31e-96657d6dc6e5\"'),('neoBlockTypes.ba88d9cd-1570-43ff-9e92-aa456cff2540.fieldLayouts.2394efd8-b6b2-418c-8ce4-99bfc647be17.tabs.0.elements.0.instructions','null'),('neoBlockTypes.ba88d9cd-1570-43ff-9e92-aa456cff2540.fieldLayouts.2394efd8-b6b2-418c-8ce4-99bfc647be17.tabs.0.elements.0.label','null'),('neoBlockTypes.ba88d9cd-1570-43ff-9e92-aa456cff2540.fieldLayouts.2394efd8-b6b2-418c-8ce4-99bfc647be17.tabs.0.elements.0.required','false'),('neoBlockTypes.ba88d9cd-1570-43ff-9e92-aa456cff2540.fieldLayouts.2394efd8-b6b2-418c-8ce4-99bfc647be17.tabs.0.elements.0.tip','null'),('neoBlockTypes.ba88d9cd-1570-43ff-9e92-aa456cff2540.fieldLayouts.2394efd8-b6b2-418c-8ce4-99bfc647be17.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('neoBlockTypes.ba88d9cd-1570-43ff-9e92-aa456cff2540.fieldLayouts.2394efd8-b6b2-418c-8ce4-99bfc647be17.tabs.0.elements.0.warning','null'),('neoBlockTypes.ba88d9cd-1570-43ff-9e92-aa456cff2540.fieldLayouts.2394efd8-b6b2-418c-8ce4-99bfc647be17.tabs.0.elements.0.width','100'),('neoBlockTypes.ba88d9cd-1570-43ff-9e92-aa456cff2540.fieldLayouts.2394efd8-b6b2-418c-8ce4-99bfc647be17.tabs.0.elements.1.fieldUid','\"4b0ce80c-181f-4c40-bcce-5146dc8c903e\"'),('neoBlockTypes.ba88d9cd-1570-43ff-9e92-aa456cff2540.fieldLayouts.2394efd8-b6b2-418c-8ce4-99bfc647be17.tabs.0.elements.1.instructions','null'),('neoBlockTypes.ba88d9cd-1570-43ff-9e92-aa456cff2540.fieldLayouts.2394efd8-b6b2-418c-8ce4-99bfc647be17.tabs.0.elements.1.label','null'),('neoBlockTypes.ba88d9cd-1570-43ff-9e92-aa456cff2540.fieldLayouts.2394efd8-b6b2-418c-8ce4-99bfc647be17.tabs.0.elements.1.required','false'),('neoBlockTypes.ba88d9cd-1570-43ff-9e92-aa456cff2540.fieldLayouts.2394efd8-b6b2-418c-8ce4-99bfc647be17.tabs.0.elements.1.tip','null'),('neoBlockTypes.ba88d9cd-1570-43ff-9e92-aa456cff2540.fieldLayouts.2394efd8-b6b2-418c-8ce4-99bfc647be17.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('neoBlockTypes.ba88d9cd-1570-43ff-9e92-aa456cff2540.fieldLayouts.2394efd8-b6b2-418c-8ce4-99bfc647be17.tabs.0.elements.1.warning','null'),('neoBlockTypes.ba88d9cd-1570-43ff-9e92-aa456cff2540.fieldLayouts.2394efd8-b6b2-418c-8ce4-99bfc647be17.tabs.0.elements.1.width','100'),('neoBlockTypes.ba88d9cd-1570-43ff-9e92-aa456cff2540.fieldLayouts.2394efd8-b6b2-418c-8ce4-99bfc647be17.tabs.0.name','\"Main Content\"'),('neoBlockTypes.ba88d9cd-1570-43ff-9e92-aa456cff2540.fieldLayouts.2394efd8-b6b2-418c-8ce4-99bfc647be17.tabs.0.sortOrder','1'),('neoBlockTypes.ba88d9cd-1570-43ff-9e92-aa456cff2540.fieldLayouts.2394efd8-b6b2-418c-8ce4-99bfc647be17.tabs.1.elements.0.fieldUid','\"336f207f-f4fb-43c3-bbc3-f10b641e940a\"'),('neoBlockTypes.ba88d9cd-1570-43ff-9e92-aa456cff2540.fieldLayouts.2394efd8-b6b2-418c-8ce4-99bfc647be17.tabs.1.elements.0.instructions','null'),('neoBlockTypes.ba88d9cd-1570-43ff-9e92-aa456cff2540.fieldLayouts.2394efd8-b6b2-418c-8ce4-99bfc647be17.tabs.1.elements.0.label','null'),('neoBlockTypes.ba88d9cd-1570-43ff-9e92-aa456cff2540.fieldLayouts.2394efd8-b6b2-418c-8ce4-99bfc647be17.tabs.1.elements.0.required','false'),('neoBlockTypes.ba88d9cd-1570-43ff-9e92-aa456cff2540.fieldLayouts.2394efd8-b6b2-418c-8ce4-99bfc647be17.tabs.1.elements.0.tip','null'),('neoBlockTypes.ba88d9cd-1570-43ff-9e92-aa456cff2540.fieldLayouts.2394efd8-b6b2-418c-8ce4-99bfc647be17.tabs.1.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('neoBlockTypes.ba88d9cd-1570-43ff-9e92-aa456cff2540.fieldLayouts.2394efd8-b6b2-418c-8ce4-99bfc647be17.tabs.1.elements.0.warning','null'),('neoBlockTypes.ba88d9cd-1570-43ff-9e92-aa456cff2540.fieldLayouts.2394efd8-b6b2-418c-8ce4-99bfc647be17.tabs.1.elements.0.width','100'),('neoBlockTypes.ba88d9cd-1570-43ff-9e92-aa456cff2540.fieldLayouts.2394efd8-b6b2-418c-8ce4-99bfc647be17.tabs.1.elements.1.fieldUid','\"6c4a2320-184d-4f3b-9482-070fc8b8194a\"'),('neoBlockTypes.ba88d9cd-1570-43ff-9e92-aa456cff2540.fieldLayouts.2394efd8-b6b2-418c-8ce4-99bfc647be17.tabs.1.elements.1.instructions','null'),('neoBlockTypes.ba88d9cd-1570-43ff-9e92-aa456cff2540.fieldLayouts.2394efd8-b6b2-418c-8ce4-99bfc647be17.tabs.1.elements.1.label','null'),('neoBlockTypes.ba88d9cd-1570-43ff-9e92-aa456cff2540.fieldLayouts.2394efd8-b6b2-418c-8ce4-99bfc647be17.tabs.1.elements.1.required','false'),('neoBlockTypes.ba88d9cd-1570-43ff-9e92-aa456cff2540.fieldLayouts.2394efd8-b6b2-418c-8ce4-99bfc647be17.tabs.1.elements.1.tip','null'),('neoBlockTypes.ba88d9cd-1570-43ff-9e92-aa456cff2540.fieldLayouts.2394efd8-b6b2-418c-8ce4-99bfc647be17.tabs.1.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('neoBlockTypes.ba88d9cd-1570-43ff-9e92-aa456cff2540.fieldLayouts.2394efd8-b6b2-418c-8ce4-99bfc647be17.tabs.1.elements.1.warning','null'),('neoBlockTypes.ba88d9cd-1570-43ff-9e92-aa456cff2540.fieldLayouts.2394efd8-b6b2-418c-8ce4-99bfc647be17.tabs.1.elements.1.width','100'),('neoBlockTypes.ba88d9cd-1570-43ff-9e92-aa456cff2540.fieldLayouts.2394efd8-b6b2-418c-8ce4-99bfc647be17.tabs.1.elements.2.fieldUid','\"bb3731df-a01f-4725-9f8b-06d99359fd9f\"'),('neoBlockTypes.ba88d9cd-1570-43ff-9e92-aa456cff2540.fieldLayouts.2394efd8-b6b2-418c-8ce4-99bfc647be17.tabs.1.elements.2.instructions','null'),('neoBlockTypes.ba88d9cd-1570-43ff-9e92-aa456cff2540.fieldLayouts.2394efd8-b6b2-418c-8ce4-99bfc647be17.tabs.1.elements.2.label','null'),('neoBlockTypes.ba88d9cd-1570-43ff-9e92-aa456cff2540.fieldLayouts.2394efd8-b6b2-418c-8ce4-99bfc647be17.tabs.1.elements.2.required','false'),('neoBlockTypes.ba88d9cd-1570-43ff-9e92-aa456cff2540.fieldLayouts.2394efd8-b6b2-418c-8ce4-99bfc647be17.tabs.1.elements.2.tip','null'),('neoBlockTypes.ba88d9cd-1570-43ff-9e92-aa456cff2540.fieldLayouts.2394efd8-b6b2-418c-8ce4-99bfc647be17.tabs.1.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('neoBlockTypes.ba88d9cd-1570-43ff-9e92-aa456cff2540.fieldLayouts.2394efd8-b6b2-418c-8ce4-99bfc647be17.tabs.1.elements.2.warning','null'),('neoBlockTypes.ba88d9cd-1570-43ff-9e92-aa456cff2540.fieldLayouts.2394efd8-b6b2-418c-8ce4-99bfc647be17.tabs.1.elements.2.width','100'),('neoBlockTypes.ba88d9cd-1570-43ff-9e92-aa456cff2540.fieldLayouts.2394efd8-b6b2-418c-8ce4-99bfc647be17.tabs.1.name','\"Settings\"'),('neoBlockTypes.ba88d9cd-1570-43ff-9e92-aa456cff2540.fieldLayouts.2394efd8-b6b2-418c-8ce4-99bfc647be17.tabs.1.sortOrder','2'),('neoBlockTypes.ba88d9cd-1570-43ff-9e92-aa456cff2540.handle','\"video\"'),('neoBlockTypes.ba88d9cd-1570-43ff-9e92-aa456cff2540.maxBlocks','0'),('neoBlockTypes.ba88d9cd-1570-43ff-9e92-aa456cff2540.maxChildBlocks','0'),('neoBlockTypes.ba88d9cd-1570-43ff-9e92-aa456cff2540.maxSiblingBlocks','0'),('neoBlockTypes.ba88d9cd-1570-43ff-9e92-aa456cff2540.name','\"Video\"'),('neoBlockTypes.ba88d9cd-1570-43ff-9e92-aa456cff2540.sortOrder','7'),('neoBlockTypes.ba88d9cd-1570-43ff-9e92-aa456cff2540.topLevel','true'),('neoBlockTypes.ecaf2e51-4a07-4d82-a78b-8181faba1e87.childBlocks','\"\"'),('neoBlockTypes.ecaf2e51-4a07-4d82-a78b-8181faba1e87.field','\"1d1d5665-5674-4388-8d46-9b87e4dc65d3\"'),('neoBlockTypes.ecaf2e51-4a07-4d82-a78b-8181faba1e87.fieldLayouts.de116c4b-6fdd-4504-a503-62e66fb88f12.tabs.0.elements.0.fieldUid','\"2f64efd3-101a-4ed1-a31e-96657d6dc6e5\"'),('neoBlockTypes.ecaf2e51-4a07-4d82-a78b-8181faba1e87.fieldLayouts.de116c4b-6fdd-4504-a503-62e66fb88f12.tabs.0.elements.0.instructions','null'),('neoBlockTypes.ecaf2e51-4a07-4d82-a78b-8181faba1e87.fieldLayouts.de116c4b-6fdd-4504-a503-62e66fb88f12.tabs.0.elements.0.label','null'),('neoBlockTypes.ecaf2e51-4a07-4d82-a78b-8181faba1e87.fieldLayouts.de116c4b-6fdd-4504-a503-62e66fb88f12.tabs.0.elements.0.required','false'),('neoBlockTypes.ecaf2e51-4a07-4d82-a78b-8181faba1e87.fieldLayouts.de116c4b-6fdd-4504-a503-62e66fb88f12.tabs.0.elements.0.tip','null'),('neoBlockTypes.ecaf2e51-4a07-4d82-a78b-8181faba1e87.fieldLayouts.de116c4b-6fdd-4504-a503-62e66fb88f12.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('neoBlockTypes.ecaf2e51-4a07-4d82-a78b-8181faba1e87.fieldLayouts.de116c4b-6fdd-4504-a503-62e66fb88f12.tabs.0.elements.0.warning','null'),('neoBlockTypes.ecaf2e51-4a07-4d82-a78b-8181faba1e87.fieldLayouts.de116c4b-6fdd-4504-a503-62e66fb88f12.tabs.0.elements.0.width','100'),('neoBlockTypes.ecaf2e51-4a07-4d82-a78b-8181faba1e87.fieldLayouts.de116c4b-6fdd-4504-a503-62e66fb88f12.tabs.0.elements.1.fieldUid','\"181f8d87-6d88-42ed-96e8-26a3a728eef8\"'),('neoBlockTypes.ecaf2e51-4a07-4d82-a78b-8181faba1e87.fieldLayouts.de116c4b-6fdd-4504-a503-62e66fb88f12.tabs.0.elements.1.instructions','null'),('neoBlockTypes.ecaf2e51-4a07-4d82-a78b-8181faba1e87.fieldLayouts.de116c4b-6fdd-4504-a503-62e66fb88f12.tabs.0.elements.1.label','null'),('neoBlockTypes.ecaf2e51-4a07-4d82-a78b-8181faba1e87.fieldLayouts.de116c4b-6fdd-4504-a503-62e66fb88f12.tabs.0.elements.1.required','false'),('neoBlockTypes.ecaf2e51-4a07-4d82-a78b-8181faba1e87.fieldLayouts.de116c4b-6fdd-4504-a503-62e66fb88f12.tabs.0.elements.1.tip','null'),('neoBlockTypes.ecaf2e51-4a07-4d82-a78b-8181faba1e87.fieldLayouts.de116c4b-6fdd-4504-a503-62e66fb88f12.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('neoBlockTypes.ecaf2e51-4a07-4d82-a78b-8181faba1e87.fieldLayouts.de116c4b-6fdd-4504-a503-62e66fb88f12.tabs.0.elements.1.warning','null'),('neoBlockTypes.ecaf2e51-4a07-4d82-a78b-8181faba1e87.fieldLayouts.de116c4b-6fdd-4504-a503-62e66fb88f12.tabs.0.elements.1.width','100'),('neoBlockTypes.ecaf2e51-4a07-4d82-a78b-8181faba1e87.fieldLayouts.de116c4b-6fdd-4504-a503-62e66fb88f12.tabs.0.name','\"Main Content\"'),('neoBlockTypes.ecaf2e51-4a07-4d82-a78b-8181faba1e87.fieldLayouts.de116c4b-6fdd-4504-a503-62e66fb88f12.tabs.0.sortOrder','1'),('neoBlockTypes.ecaf2e51-4a07-4d82-a78b-8181faba1e87.fieldLayouts.de116c4b-6fdd-4504-a503-62e66fb88f12.tabs.1.elements.0.fieldUid','\"336f207f-f4fb-43c3-bbc3-f10b641e940a\"'),('neoBlockTypes.ecaf2e51-4a07-4d82-a78b-8181faba1e87.fieldLayouts.de116c4b-6fdd-4504-a503-62e66fb88f12.tabs.1.elements.0.instructions','null'),('neoBlockTypes.ecaf2e51-4a07-4d82-a78b-8181faba1e87.fieldLayouts.de116c4b-6fdd-4504-a503-62e66fb88f12.tabs.1.elements.0.label','null'),('neoBlockTypes.ecaf2e51-4a07-4d82-a78b-8181faba1e87.fieldLayouts.de116c4b-6fdd-4504-a503-62e66fb88f12.tabs.1.elements.0.required','false'),('neoBlockTypes.ecaf2e51-4a07-4d82-a78b-8181faba1e87.fieldLayouts.de116c4b-6fdd-4504-a503-62e66fb88f12.tabs.1.elements.0.tip','null'),('neoBlockTypes.ecaf2e51-4a07-4d82-a78b-8181faba1e87.fieldLayouts.de116c4b-6fdd-4504-a503-62e66fb88f12.tabs.1.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('neoBlockTypes.ecaf2e51-4a07-4d82-a78b-8181faba1e87.fieldLayouts.de116c4b-6fdd-4504-a503-62e66fb88f12.tabs.1.elements.0.warning','null'),('neoBlockTypes.ecaf2e51-4a07-4d82-a78b-8181faba1e87.fieldLayouts.de116c4b-6fdd-4504-a503-62e66fb88f12.tabs.1.elements.0.width','100'),('neoBlockTypes.ecaf2e51-4a07-4d82-a78b-8181faba1e87.fieldLayouts.de116c4b-6fdd-4504-a503-62e66fb88f12.tabs.1.elements.1.fieldUid','\"6c4a2320-184d-4f3b-9482-070fc8b8194a\"'),('neoBlockTypes.ecaf2e51-4a07-4d82-a78b-8181faba1e87.fieldLayouts.de116c4b-6fdd-4504-a503-62e66fb88f12.tabs.1.elements.1.instructions','null'),('neoBlockTypes.ecaf2e51-4a07-4d82-a78b-8181faba1e87.fieldLayouts.de116c4b-6fdd-4504-a503-62e66fb88f12.tabs.1.elements.1.label','null'),('neoBlockTypes.ecaf2e51-4a07-4d82-a78b-8181faba1e87.fieldLayouts.de116c4b-6fdd-4504-a503-62e66fb88f12.tabs.1.elements.1.required','false'),('neoBlockTypes.ecaf2e51-4a07-4d82-a78b-8181faba1e87.fieldLayouts.de116c4b-6fdd-4504-a503-62e66fb88f12.tabs.1.elements.1.tip','null'),('neoBlockTypes.ecaf2e51-4a07-4d82-a78b-8181faba1e87.fieldLayouts.de116c4b-6fdd-4504-a503-62e66fb88f12.tabs.1.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('neoBlockTypes.ecaf2e51-4a07-4d82-a78b-8181faba1e87.fieldLayouts.de116c4b-6fdd-4504-a503-62e66fb88f12.tabs.1.elements.1.warning','null'),('neoBlockTypes.ecaf2e51-4a07-4d82-a78b-8181faba1e87.fieldLayouts.de116c4b-6fdd-4504-a503-62e66fb88f12.tabs.1.elements.1.width','100'),('neoBlockTypes.ecaf2e51-4a07-4d82-a78b-8181faba1e87.fieldLayouts.de116c4b-6fdd-4504-a503-62e66fb88f12.tabs.1.elements.2.fieldUid','\"bb3731df-a01f-4725-9f8b-06d99359fd9f\"'),('neoBlockTypes.ecaf2e51-4a07-4d82-a78b-8181faba1e87.fieldLayouts.de116c4b-6fdd-4504-a503-62e66fb88f12.tabs.1.elements.2.instructions','null'),('neoBlockTypes.ecaf2e51-4a07-4d82-a78b-8181faba1e87.fieldLayouts.de116c4b-6fdd-4504-a503-62e66fb88f12.tabs.1.elements.2.label','null'),('neoBlockTypes.ecaf2e51-4a07-4d82-a78b-8181faba1e87.fieldLayouts.de116c4b-6fdd-4504-a503-62e66fb88f12.tabs.1.elements.2.required','false'),('neoBlockTypes.ecaf2e51-4a07-4d82-a78b-8181faba1e87.fieldLayouts.de116c4b-6fdd-4504-a503-62e66fb88f12.tabs.1.elements.2.tip','null'),('neoBlockTypes.ecaf2e51-4a07-4d82-a78b-8181faba1e87.fieldLayouts.de116c4b-6fdd-4504-a503-62e66fb88f12.tabs.1.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('neoBlockTypes.ecaf2e51-4a07-4d82-a78b-8181faba1e87.fieldLayouts.de116c4b-6fdd-4504-a503-62e66fb88f12.tabs.1.elements.2.warning','null'),('neoBlockTypes.ecaf2e51-4a07-4d82-a78b-8181faba1e87.fieldLayouts.de116c4b-6fdd-4504-a503-62e66fb88f12.tabs.1.elements.2.width','100'),('neoBlockTypes.ecaf2e51-4a07-4d82-a78b-8181faba1e87.fieldLayouts.de116c4b-6fdd-4504-a503-62e66fb88f12.tabs.1.name','\"Settings\"'),('neoBlockTypes.ecaf2e51-4a07-4d82-a78b-8181faba1e87.fieldLayouts.de116c4b-6fdd-4504-a503-62e66fb88f12.tabs.1.sortOrder','2'),('neoBlockTypes.ecaf2e51-4a07-4d82-a78b-8181faba1e87.handle','\"imageSlider\"'),('neoBlockTypes.ecaf2e51-4a07-4d82-a78b-8181faba1e87.maxBlocks','0'),('neoBlockTypes.ecaf2e51-4a07-4d82-a78b-8181faba1e87.maxChildBlocks','0'),('neoBlockTypes.ecaf2e51-4a07-4d82-a78b-8181faba1e87.maxSiblingBlocks','0'),('neoBlockTypes.ecaf2e51-4a07-4d82-a78b-8181faba1e87.name','\"Image Slider\"'),('neoBlockTypes.ecaf2e51-4a07-4d82-a78b-8181faba1e87.sortOrder','6'),('neoBlockTypes.ecaf2e51-4a07-4d82-a78b-8181faba1e87.topLevel','true'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.childBlocks','\"\"'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.field','\"1d1d5665-5674-4388-8d46-9b87e4dc65d3\"'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.0.elements.0.fieldUid','\"0ffba24e-268b-4f2c-a3f2-ad976b64c979\"'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.0.elements.0.instructions','null'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.0.elements.0.label','null'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.0.elements.0.required','false'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.0.elements.0.tip','null'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.0.elements.0.warning','null'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.0.elements.0.width','100'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.0.name','\"Main Content\"'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.0.sortOrder','1'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.1.elements.0.fieldUid','\"336f207f-f4fb-43c3-bbc3-f10b641e940a\"'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.1.elements.0.instructions','null'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.1.elements.0.label','null'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.1.elements.0.required','false'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.1.elements.0.tip','null'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.1.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.1.elements.0.warning','null'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.1.elements.0.width','100'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.1.elements.1.fieldUid','\"6c4a2320-184d-4f3b-9482-070fc8b8194a\"'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.1.elements.1.instructions','null'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.1.elements.1.label','null'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.1.elements.1.required','false'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.1.elements.1.tip','null'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.1.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.1.elements.1.warning','null'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.1.elements.1.width','100'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.1.elements.2.fieldUid','\"bb3731df-a01f-4725-9f8b-06d99359fd9f\"'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.1.elements.2.instructions','null'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.1.elements.2.label','null'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.1.elements.2.required','false'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.1.elements.2.tip','null'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.1.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.1.elements.2.warning','null'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.1.elements.2.width','100'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.1.name','\"Settings\"'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.1.sortOrder','2'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.handle','\"image\"'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.maxBlocks','0'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.maxChildBlocks','0'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.maxSiblingBlocks','0'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.name','\"Image\"'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.sortOrder','3'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.topLevel','true'),('plugins.aws-s3.edition','\"standard\"'),('plugins.aws-s3.enabled','true'),('plugins.aws-s3.schemaVersion','\"1.2\"'),('plugins.buttonbox.edition','\"standard\"'),('plugins.buttonbox.enabled','true'),('plugins.buttonbox.schemaVersion','\"1.0.0\"'),('plugins.freeform.edition','\"lite\"'),('plugins.freeform.enabled','true'),('plugins.freeform.licenseKey','\"G1OSD5DGMQDOF1ZPWRHTAK3J\"'),('plugins.freeform.schemaVersion','\"3.3.0\"'),('plugins.freeform.settings.ajaxByDefault','true'),('plugins.freeform.settings.alertNotificationRecipients','null'),('plugins.freeform.settings.autoScrollToErrors','true'),('plugins.freeform.settings.badgeType','\"all\"'),('plugins.freeform.settings.blockedEmails','null'),('plugins.freeform.settings.blockedEmailsError','\"Invalid Email Address\"'),('plugins.freeform.settings.blockedIpAddresses','null'),('plugins.freeform.settings.blockedKeywords','null'),('plugins.freeform.settings.blockedKeywordsError','\"Invalid Entry Data\"'),('plugins.freeform.settings.clientDigestFrequency','1'),('plugins.freeform.settings.clientDigestRecipients','null'),('plugins.freeform.settings.customErrorMessage','null'),('plugins.freeform.settings.customHoneypotName','null'),('plugins.freeform.settings.defaultTemplates','true'),('plugins.freeform.settings.defaultView','\"dashboard\"'),('plugins.freeform.settings.digestFrequency','1'),('plugins.freeform.settings.digestOnlyOnProduction','false'),('plugins.freeform.settings.digestRecipients','null'),('plugins.freeform.settings.displayFeed','true'),('plugins.freeform.settings.emailTemplateDirectory','null'),('plugins.freeform.settings.emailTemplateStorage','\"db\"'),('plugins.freeform.settings.fieldDisplayOrder','\"name\"'),('plugins.freeform.settings.fillWithGet','false'),('plugins.freeform.settings.footerScripts','false'),('plugins.freeform.settings.formattingTemplate','\"flexbox.html\"'),('plugins.freeform.settings.formSubmitDisable','true'),('plugins.freeform.settings.formSubmitExpiration','null'),('plugins.freeform.settings.formTemplateDirectory','null'),('plugins.freeform.settings.freeformHoneypot','true'),('plugins.freeform.settings.freeformHoneypotEnhancement','false'),('plugins.freeform.settings.hideBannerDemo','true'),('plugins.freeform.settings.hideBannerOldFreeform','false'),('plugins.freeform.settings.minimumSubmitTime','null'),('plugins.freeform.settings.pluginName','null'),('plugins.freeform.settings.purgableSpamAgeInDays','null'),('plugins.freeform.settings.purgableSubmissionAgeInDays','null'),('plugins.freeform.settings.purgableUnfinalizedAssetAgeInMinutes','180'),('plugins.freeform.settings.recaptchaBehaviour','\"display_error\"'),('plugins.freeform.settings.recaptchaEnabled','\"\"'),('plugins.freeform.settings.recaptchaErrorMessage','\"Please verify that you are not a robot.\"'),('plugins.freeform.settings.recaptchaKey','\"6Ld4jYAaAAAAABhDk0P5QXtr8pop2g6DvJ5iOg6E\"'),('plugins.freeform.settings.recaptchaMinScore','\"0.5\"'),('plugins.freeform.settings.recaptchaSecret','\"6Ld4jYAaAAAAAE5wnMBwPoYrZEyYvFLM30ll7yLJ\"'),('plugins.freeform.settings.recaptchaSize','\"normal\"'),('plugins.freeform.settings.recaptchaTheme','\"light\"'),('plugins.freeform.settings.recaptchaType','\"v2_checkbox\"'),('plugins.freeform.settings.removeNewlines','false'),('plugins.freeform.settings.renderFormHtmlInCpViews','true'),('plugins.freeform.settings.salesforce_client_id','null'),('plugins.freeform.settings.salesforce_client_secret','null'),('plugins.freeform.settings.salesforce_password','null'),('plugins.freeform.settings.salesforce_username','null'),('plugins.freeform.settings.scriptInsertLocation','\"footer\"'),('plugins.freeform.settings.sessionEntryMaxCount','50'),('plugins.freeform.settings.sessionEntryTTL','10800'),('plugins.freeform.settings.showErrorsForBlockedEmails','false'),('plugins.freeform.settings.showErrorsForBlockedKeywords','false'),('plugins.freeform.settings.showTutorial','false'),('plugins.freeform.settings.spamFolderEnabled','true'),('plugins.freeform.settings.spamProtectionBehaviour','\"simulate_success\"'),('plugins.freeform.settings.submissionThrottlingCount','null'),('plugins.freeform.settings.submissionThrottlingTimeFrame','null'),('plugins.freeform.settings.twigInHtml','true'),('plugins.freeform.settings.twigInHtmlIsolatedMode','true'),('plugins.freeform.settings.updateSearchIndexes','true'),('plugins.navigation.edition','\"standard\"'),('plugins.navigation.enabled','true'),('plugins.navigation.licenseKey','\"R3VO5MHTQ00EOEKHK3EANI9N\"'),('plugins.navigation.schemaVersion','\"1.0.21\"'),('plugins.neo.edition','\"standard\"'),('plugins.neo.enabled','true'),('plugins.neo.licenseKey','\"6CVLNUD6DPTQ61KABAO823E5\"'),('plugins.neo.schemaVersion','\"2.8.16\"'),('plugins.oembed.edition','\"standard\"'),('plugins.oembed.enabled','true'),('plugins.oembed.schemaVersion','\"1.0.1\"'),('plugins.redactor.edition','\"standard\"'),('plugins.redactor.enabled','true'),('plugins.redactor.schemaVersion','\"2.3.0\"'),('plugins.seo.edition','\"standard\"'),('plugins.seo.enabled','true'),('plugins.seo.schemaVersion','\"3.1.1\"'),('plugins.super-table.edition','\"standard\"'),('plugins.super-table.enabled','true'),('plugins.super-table.schemaVersion','\"2.2.1\"'),('sections.2f28cd37-4b8e-4b68-806e-97ecc9f63d04.enableVersioning','true'),('sections.2f28cd37-4b8e-4b68-806e-97ecc9f63d04.handle','\"latestIndex\"'),('sections.2f28cd37-4b8e-4b68-806e-97ecc9f63d04.name','\"Latest Index\"'),('sections.2f28cd37-4b8e-4b68-806e-97ecc9f63d04.propagationMethod','\"all\"'),('sections.2f28cd37-4b8e-4b68-806e-97ecc9f63d04.siteSettings.18d78006-3985-4ea4-b620-67bae10d9c2d.enabledByDefault','true'),('sections.2f28cd37-4b8e-4b68-806e-97ecc9f63d04.siteSettings.18d78006-3985-4ea4-b620-67bae10d9c2d.hasUrls','true'),('sections.2f28cd37-4b8e-4b68-806e-97ecc9f63d04.siteSettings.18d78006-3985-4ea4-b620-67bae10d9c2d.template','\"latest/_index\"'),('sections.2f28cd37-4b8e-4b68-806e-97ecc9f63d04.siteSettings.18d78006-3985-4ea4-b620-67bae10d9c2d.uriFormat','\"latest\"'),('sections.2f28cd37-4b8e-4b68-806e-97ecc9f63d04.type','\"single\"'),('sections.32e8ea43-4e6d-46eb-9344-6755923c28de.enableVersioning','true'),('sections.32e8ea43-4e6d-46eb-9344-6755923c28de.handle','\"homepage\"'),('sections.32e8ea43-4e6d-46eb-9344-6755923c28de.name','\"Homepage\"'),('sections.32e8ea43-4e6d-46eb-9344-6755923c28de.propagationMethod','\"all\"'),('sections.32e8ea43-4e6d-46eb-9344-6755923c28de.siteSettings.18d78006-3985-4ea4-b620-67bae10d9c2d.enabledByDefault','true'),('sections.32e8ea43-4e6d-46eb-9344-6755923c28de.siteSettings.18d78006-3985-4ea4-b620-67bae10d9c2d.hasUrls','true'),('sections.32e8ea43-4e6d-46eb-9344-6755923c28de.siteSettings.18d78006-3985-4ea4-b620-67bae10d9c2d.template','\"index\"'),('sections.32e8ea43-4e6d-46eb-9344-6755923c28de.siteSettings.18d78006-3985-4ea4-b620-67bae10d9c2d.uriFormat','\"__home__\"'),('sections.32e8ea43-4e6d-46eb-9344-6755923c28de.type','\"single\"'),('sections.b8e69404-8329-47fa-8f41-a98c933804c3.enableVersioning','true'),('sections.b8e69404-8329-47fa-8f41-a98c933804c3.handle','\"about\"'),('sections.b8e69404-8329-47fa-8f41-a98c933804c3.name','\"About\"'),('sections.b8e69404-8329-47fa-8f41-a98c933804c3.propagationMethod','\"all\"'),('sections.b8e69404-8329-47fa-8f41-a98c933804c3.siteSettings.18d78006-3985-4ea4-b620-67bae10d9c2d.enabledByDefault','true'),('sections.b8e69404-8329-47fa-8f41-a98c933804c3.siteSettings.18d78006-3985-4ea4-b620-67bae10d9c2d.hasUrls','true'),('sections.b8e69404-8329-47fa-8f41-a98c933804c3.siteSettings.18d78006-3985-4ea4-b620-67bae10d9c2d.template','\"about/_index\"'),('sections.b8e69404-8329-47fa-8f41-a98c933804c3.siteSettings.18d78006-3985-4ea4-b620-67bae10d9c2d.uriFormat','\"about\"'),('sections.b8e69404-8329-47fa-8f41-a98c933804c3.type','\"single\"'),('sections.ddd7384c-d723-4aad-b2f6-845216bb1dbf.enableVersioning','true'),('sections.ddd7384c-d723-4aad-b2f6-845216bb1dbf.handle','\"latest\"'),('sections.ddd7384c-d723-4aad-b2f6-845216bb1dbf.name','\"Latest\"'),('sections.ddd7384c-d723-4aad-b2f6-845216bb1dbf.propagationMethod','\"all\"'),('sections.ddd7384c-d723-4aad-b2f6-845216bb1dbf.siteSettings.18d78006-3985-4ea4-b620-67bae10d9c2d.enabledByDefault','true'),('sections.ddd7384c-d723-4aad-b2f6-845216bb1dbf.siteSettings.18d78006-3985-4ea4-b620-67bae10d9c2d.hasUrls','true'),('sections.ddd7384c-d723-4aad-b2f6-845216bb1dbf.siteSettings.18d78006-3985-4ea4-b620-67bae10d9c2d.template','\"latest/_entry\"'),('sections.ddd7384c-d723-4aad-b2f6-845216bb1dbf.siteSettings.18d78006-3985-4ea4-b620-67bae10d9c2d.uriFormat','\"latest/{slug}\"'),('sections.ddd7384c-d723-4aad-b2f6-845216bb1dbf.type','\"channel\"'),('sections.f1abfa1e-3f54-4765-8991-815c87484c9b.enableVersioning','true'),('sections.f1abfa1e-3f54-4765-8991-815c87484c9b.handle','\"contact\"'),('sections.f1abfa1e-3f54-4765-8991-815c87484c9b.name','\"Contact\"'),('sections.f1abfa1e-3f54-4765-8991-815c87484c9b.propagationMethod','\"all\"'),('sections.f1abfa1e-3f54-4765-8991-815c87484c9b.siteSettings.18d78006-3985-4ea4-b620-67bae10d9c2d.enabledByDefault','true'),('sections.f1abfa1e-3f54-4765-8991-815c87484c9b.siteSettings.18d78006-3985-4ea4-b620-67bae10d9c2d.hasUrls','true'),('sections.f1abfa1e-3f54-4765-8991-815c87484c9b.siteSettings.18d78006-3985-4ea4-b620-67bae10d9c2d.template','\"contact/_index\"'),('sections.f1abfa1e-3f54-4765-8991-815c87484c9b.siteSettings.18d78006-3985-4ea4-b620-67bae10d9c2d.uriFormat','\"contact\"'),('sections.f1abfa1e-3f54-4765-8991-815c87484c9b.type','\"single\"'),('siteGroups.f99d20c5-6966-4180-8dc1-595df3b8f876.name','\"Craft CMS Boilerplate\"'),('sites.18d78006-3985-4ea4-b620-67bae10d9c2d.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.18d78006-3985-4ea4-b620-67bae10d9c2d.enabled','true'),('sites.18d78006-3985-4ea4-b620-67bae10d9c2d.handle','\"default\"'),('sites.18d78006-3985-4ea4-b620-67bae10d9c2d.hasUrls','true'),('sites.18d78006-3985-4ea4-b620-67bae10d9c2d.language','\"en-GB\"'),('sites.18d78006-3985-4ea4-b620-67bae10d9c2d.name','\"Craft CMS Boilerplate\"'),('sites.18d78006-3985-4ea4-b620-67bae10d9c2d.primary','true'),('sites.18d78006-3985-4ea4-b620-67bae10d9c2d.siteGroup','\"f99d20c5-6966-4180-8dc1-595df3b8f876\"'),('sites.18d78006-3985-4ea4-b620-67bae10d9c2d.sortOrder','1'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.field','\"13d35453-527a-4094-b642-42292f193f8c\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.0.fieldUid','\"1f6a1dc8-82d8-47a8-ae54-01af20652730\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.0.instructions','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.0.label','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.0.required','false'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.0.tip','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.0.warning','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.0.width','100'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.1.fieldUid','\"5cd6ad16-cb88-45ba-b275-1558f8f27c05\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.1.instructions','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.1.label','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.1.required','false'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.1.tip','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.1.warning','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.1.width','100'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.2.fieldUid','\"a596aec7-c8ec-49d7-ab4d-97dcdf5ac990\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.2.instructions','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.2.label','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.2.required','false'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.2.tip','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.2.warning','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.2.width','100'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.3.fieldUid','\"d9aafe6e-671c-45da-9958-ccb6470336d6\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.3.instructions','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.3.label','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.3.required','false'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.3.tip','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.3.warning','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.3.width','100'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.name','\"Content\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.sortOrder','1'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.1f6a1dc8-82d8-47a8-ae54-01af20652730.contentColumnType','\"text\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.1f6a1dc8-82d8-47a8-ae54-01af20652730.fieldGroup','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.1f6a1dc8-82d8-47a8-ae54-01af20652730.handle','\"socialName\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.1f6a1dc8-82d8-47a8-ae54-01af20652730.instructions','\"\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.1f6a1dc8-82d8-47a8-ae54-01af20652730.name','\"Name\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.1f6a1dc8-82d8-47a8-ae54-01af20652730.searchable','false'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.1f6a1dc8-82d8-47a8-ae54-01af20652730.settings.byteLimit','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.1f6a1dc8-82d8-47a8-ae54-01af20652730.settings.charLimit','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.1f6a1dc8-82d8-47a8-ae54-01af20652730.settings.code','\"\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.1f6a1dc8-82d8-47a8-ae54-01af20652730.settings.columnType','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.1f6a1dc8-82d8-47a8-ae54-01af20652730.settings.initialRows','\"4\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.1f6a1dc8-82d8-47a8-ae54-01af20652730.settings.multiline','\"\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.1f6a1dc8-82d8-47a8-ae54-01af20652730.settings.placeholder','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.1f6a1dc8-82d8-47a8-ae54-01af20652730.settings.uiMode','\"normal\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.1f6a1dc8-82d8-47a8-ae54-01af20652730.translationKeyFormat','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.1f6a1dc8-82d8-47a8-ae54-01af20652730.translationMethod','\"none\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.1f6a1dc8-82d8-47a8-ae54-01af20652730.type','\"craft\\\\fields\\\\PlainText\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.5cd6ad16-cb88-45ba-b275-1558f8f27c05.contentColumnType','\"string(255)\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.5cd6ad16-cb88-45ba-b275-1558f8f27c05.fieldGroup','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.5cd6ad16-cb88-45ba-b275-1558f8f27c05.handle','\"socialLink\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.5cd6ad16-cb88-45ba-b275-1558f8f27c05.instructions','\"\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.5cd6ad16-cb88-45ba-b275-1558f8f27c05.name','\"Link\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.5cd6ad16-cb88-45ba-b275-1558f8f27c05.searchable','false'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.5cd6ad16-cb88-45ba-b275-1558f8f27c05.settings.maxLength','\"255\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.5cd6ad16-cb88-45ba-b275-1558f8f27c05.settings.placeholder','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.5cd6ad16-cb88-45ba-b275-1558f8f27c05.settings.types.0','\"url\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.5cd6ad16-cb88-45ba-b275-1558f8f27c05.translationKeyFormat','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.5cd6ad16-cb88-45ba-b275-1558f8f27c05.translationMethod','\"none\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.5cd6ad16-cb88-45ba-b275-1558f8f27c05.type','\"craft\\\\fields\\\\Url\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.contentColumnType','\"string\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.fieldGroup','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.handle','\"socialIcon\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.instructions','\"\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.name','\"Icon\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.searchable','false'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.settings.allowedKinds','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.settings.allowSelfRelations','false'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.settings.allowUploads','true'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.settings.defaultUploadLocationSource','\"\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.settings.defaultUploadLocationSubpath','\"\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.settings.limit','\"\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.settings.localizeRelations','false'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.settings.previewMode','\"full\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.settings.restrictFiles','\"\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.settings.selectionLabel','\"\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.settings.showSiteMenu','false'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.settings.showUnpermittedFiles','false'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.settings.showUnpermittedVolumes','false'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.settings.singleUploadLocationSource','\"\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.settings.singleUploadLocationSubpath','\"\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.settings.source','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.settings.sources','\"*\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.settings.targetSiteId','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.settings.useSingleFolder','false'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.settings.validateRelatedElements','false'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.settings.viewMode','\"list\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.translationKeyFormat','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.translationMethod','\"site\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.type','\"craft\\\\fields\\\\Assets\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.contentColumnType','\"string\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.fieldGroup','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.handle','\"altSocialIcon\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.instructions','\"\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.name','\"Alt Icon\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.searchable','false'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.settings.allowedKinds','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.settings.allowSelfRelations','false'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.settings.allowUploads','true'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.settings.defaultUploadLocationSource','\"\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.settings.defaultUploadLocationSubpath','\"\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.settings.limit','\"\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.settings.localizeRelations','false'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.settings.previewMode','\"full\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.settings.restrictFiles','\"\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.settings.selectionLabel','\"\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.settings.showSiteMenu','false'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.settings.showUnpermittedFiles','false'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.settings.showUnpermittedVolumes','false'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.settings.singleUploadLocationSource','\"\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.settings.singleUploadLocationSubpath','\"\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.settings.source','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.settings.sources','\"*\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.settings.targetSiteId','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.settings.useSingleFolder','false'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.settings.validateRelatedElements','false'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.settings.viewMode','\"list\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.translationKeyFormat','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.translationMethod','\"site\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.type','\"craft\\\\fields\\\\Assets\"'),('system.edition','\"solo\"'),('system.live','true'),('system.name','\"Craft CMS Boilerplate\"'),('system.retryDuration','null'),('system.schemaVersion','\"3.6.7\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.requireEmailVerification','true');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `projectconfignames`
--

LOCK TABLES `projectconfignames` WRITE;
/*!40000 ALTER TABLE `projectconfignames` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `projectconfignames` VALUES ('0ffba24e-268b-4f2c-a3f2-ad976b64c979','Image'),('13d35453-527a-4094-b642-42292f193f8c','Social Profiles'),('181f8d87-6d88-42ed-96e8-26a3a728eef8','Images'),('18d78006-3985-4ea4-b620-67bae10d9c2d','Craft CMS Boilerplate'),('1af5640c-d8b3-4503-89a1-8d0581554915','Main Header'),('1d1c9f28-39de-4df6-b077-856d16c001ca','Copy'),('1d1d5665-5674-4388-8d46-9b87e4dc65d3','Content Builder'),('1f6a1dc8-82d8-47a8-ae54-01af20652730','Name'),('23255a47-8fcd-4ad9-8129-8bd0e89121e5','Footer Navigation'),('2f28cd37-4b8e-4b68-806e-97ecc9f63d04','Latest Index'),('2f64efd3-101a-4ed1-a31e-96657d6dc6e5','Header'),('32e8ea43-4e6d-46eb-9344-6755923c28de','Homepage'),('336f207f-f4fb-43c3-bbc3-f10b641e940a','Background Color'),('369ea60f-6259-4683-adcc-23418cf8285e','Homepage'),('386e1cf1-acc9-4336-90e1-fb74daefd6f5','Phone Number'),('39237593-ff51-4bd3-851a-a9dfac329c0b','Page Summary'),('3cca813e-09a9-4025-8efa-d5ba11d4dd89','Email'),('3d768a6c-7660-4551-8c77-a987ed1dfb44','External Link'),('3e5005f5-763a-459a-9bb7-74b2de70f748','Button Title'),('3f092924-7454-4778-a975-9d6112f3eb20','Google Analytics'),('3fb11a52-50bf-49c5-a8dd-c2ee482358ee','Button Link'),('4184d945-e90d-4433-b1f3-727edf65107e','Summary Image'),('431efb4a-9ace-451f-8b70-aeda20b1f83f','Globals'),('4870444e-6820-4ab0-a141-99e310305629','Background Image'),('49b4d1ac-0f61-42c6-a482-63eefaa8933e','Asset Video'),('4af3caf9-e4e3-4acd-90f8-1e8cd585e497','Address'),('4b0ce80c-181f-4c40-bcce-5146dc8c903e','Video'),('4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83','Copy'),('588b4c33-d66a-429a-a796-a6146b14a0f8','Video'),('5cd6ad16-cb88-45ba-b275-1558f8f27c05','Link'),('5d2dca76-1ede-413a-8adf-b4a756ed42ae','Site Info'),('6b6833e3-09b6-4302-8492-fd06e3f794e4','Summary'),('6bc4604d-7a4d-4a0c-ad53-c3a6adc1a6e8','Question'),('6c4a2320-184d-4f3b-9482-070fc8b8194a','Bottom Spacing'),('70f3e289-0ffa-4d8a-a2a4-e8c6db06ee3c','Content Builder Fields'),('714a1c4f-39d2-4a93-b0fc-1d7089a16ff2','Latest Index'),('75e32298-2afc-42e4-a7a1-a0df691a9522','Button'),('76ee93ec-459e-4fa9-967f-aa9b48f7b9e1','Contact'),('7bbeec1d-6526-44a3-9897-d6d1e5918a05','Settings'),('7c5c4db7-bc5e-4979-a31b-6b7734989556','SEO'),('7d034fae-78a0-49b6-a213-aa01fcdf690e','Video'),('7fc480fa-d689-40a4-9f68-2e36e07830d5','Company Info'),('80190ffa-9de6-4824-befb-1c21b98c9752','Item'),('8062a4c1-1fc1-482e-9121-c05e1d679599','Accordion'),('8b5fa4d7-86cd-4e9b-b8d4-3731f1a60289','Main Navigation'),('8f3d51d8-227c-42c1-b81e-f3cba4189a99','SEO'),('9c3f9dfb-fbb4-4ab1-b8db-5dc9b6045f2d','Blocks'),('a596aec7-c8ec-49d7-ab4d-97dcdf5ac990','Icon'),('ae523ce4-60b9-4674-8ed4-cbfa6ff0c20c','Button'),('b2c6e66f-5fcd-4220-b710-2624b1ef531d','Accordion Matrix'),('b4718bab-e938-4b97-a8e4-adc9fe5f4ca7','Content Builder'),('b8e69404-8329-47fa-8f41-a98c933804c3','About'),('ba88d9cd-1570-43ff-9e92-aa456cff2540','Video'),('bb3731df-a01f-4725-9f8b-06d99359fd9f','Top Spacing'),('bd1a9dd9-c492-4932-ad06-98c72a16cfd8','Button Title'),('d305657a-b071-42af-960e-aa7b81715a02','Latest'),('d54ca455-7ff5-451f-98e4-350b3abb1847','Button Link'),('d563f248-37de-412a-b0ad-eea19da5e0f9','Internal Link'),('d783368e-a494-4457-9e99-5a027ae72a18','Page Header'),('d9aafe6e-671c-45da-9958-ccb6470336d6','Alt Icon'),('dcc7e763-cfad-42ba-a4ed-f0c111f2446b','Media'),('ddd7384c-d723-4aad-b2f6-845216bb1dbf','Latest'),('ead943da-9146-4b32-9f33-8096b522e085','External Video'),('eb7f69a9-9a89-4024-ba3f-9154d28ac58c','Common'),('ecaf2e51-4a07-4d82-a78b-8181faba1e87','Image Slider'),('f122d996-7ed0-4bc1-ad02-50e74deac2df','Image'),('f1abfa1e-3f54-4765-8991-815c87484c9b','Contact'),('f6901440-dc45-4323-a125-0a7d3d90f06c','About'),('f85e63c0-1f6c-495c-95b7-6b70d338bd07','Answer'),('f99d20c5-6966-4180-8dc1-595df3b8f876','Craft CMS Boilerplate');
/*!40000 ALTER TABLE `projectconfignames` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `queue` VALUES (161,'queue',_binary 'O:48:\"Solspace\\Freeform\\Jobs\\PurgeUnfinalizedAssetsJob\":4:{s:3:\"age\";i:180;s:11:\"description\";N;s:30:\"\0craft\\queue\\BaseJob\0_progress\";i:0;s:35:\"\0craft\\queue\\BaseJob\0_progressLabel\";N;}','Purge Unfinalized Assets',1617790432,300,0,1024,NULL,NULL,0,NULL,NULL,0,NULL,NULL);
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `relations` VALUES (1,31,186,NULL,61,1,'2021-04-07 09:55:25','2021-04-07 09:55:25','86132aab-0531-4648-a795-55901d21a6d9'),(2,31,192,NULL,61,1,'2021-04-07 09:55:25','2021-04-07 09:55:25','10b717f6-53cd-4212-a900-54e5905fba53');
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `resourcepaths`
--

LOCK TABLES `resourcepaths` WRITE;
/*!40000 ALTER TABLE `resourcepaths` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `resourcepaths` VALUES ('10e942ca','@app/web/assets/matrix/dist'),('11632c99','@lib/prismjs'),('13e52610','@lib/jquery-touch-events'),('14411ad2','@lib/picturefill'),('152b88c4','@supercool/buttonbox/assetbundles/buttonbox/dist'),('1ae43a83','@lib/d3'),('1fcb60fe','@app/web/assets/editentry/dist'),('221e4cb3','@craft/awss3/resources'),('252ddd','@app/web/assets/dbbackup/dist'),('29592d05','@lib/garnishjs'),('380a8cb0','@app/web/assets/fields/dist'),('3c1ff93b','@lib/fabric'),('3ef1b0fb','@app/web/assets/deprecationerrors/dist'),('3f6da2fe','@app/web/assets/dashboard/dist'),('403f3756','@lib/selectize'),('41debb06','@wrav/oembed/assetbundles/oembed/dist/js'),('4610121f','@craft/web/assets/cp/dist'),('4a5373dc','@lib/xregexp'),('4f6b2262','@craft/web/assets/pluginstore/dist'),('57e3122d','@app/web/assets/edituser/dist'),('599c904a','@lib/datepicker-i18n'),('5a020035','@craft/redactor/assets/field/dist'),('5c6ecb8e','@craft/web/assets/updateswidget/dist'),('61a866ae','@app/web/assets/admintable/dist'),('628a67e6','@craft/redactor/assets/redactor-plugins/dist/fullscreen'),('62d489e0','@craft/web/assets/recententries/dist'),('6b17cfbf','@craft/web/assets/updater/dist'),('6bb6c824','@wrav/oembed/assetbundles/oembed/dist/css'),('75ac2ba9','@lib/timepicker'),('779924d5','@app/web/assets/editsection/dist'),('7da6efed','@app/web/assets/plugins/dist'),('857ba70c','@app/web/assets/feed/dist'),('8964d128','@lib/velocity'),('95437ec0','@lib/jquery.payment'),('98eb2655','@bower/jquery/dist'),('9924a1a8','@verbb/base/resources/dist'),('9a0cb70','@app/web/assets/sites/dist'),('9e1bae23','@app/web/assets/utilities/dist'),('a243b','@lib/iframe-resizer'),('b4b1f363','@app/web/assets/matrixsettings/dist'),('b51664bc','@ether/seo/web/assets'),('b77b8da0','@lib/element-resize-detector'),('b8a83730','@freeform/Resources/js/scripts/front-end/plugin'),('bc0c839b','@verbb/navigation/resources/dist'),('bd942608','@craft/web/assets/dashboard/dist'),('c063658','@freeform/Resources'),('c4d700c3','@craft/web/assets/feed/dist'),('c7cd4a8d','@lib/jquery-ui'),('ca91b2c','@lib/fileupload'),('cb33e540','@app/web/assets/generalsettings/dist'),('cd1a0ac4','@lib/axios'),('cd5b380f','@craft/redactor/assets/redactor-plugins/dist/video'),('cf0e2bac','@craft/redactor/assets/redactor/dist'),('cfc2db6e','@app/web/assets/updater/dist'),('d1052590','@app/web/assets/craftsupport/dist'),('d2d4aa08','@app/web/assets/fieldsettings/dist'),('df978951','@app/web/assets/updateswidget/dist'),('e0f1a9b1','@lib/vue'),('e12dcb3f','@app/web/assets/recententries/dist'),('e758a199','@app/web/assets/pluginstore/dist'),('f62a9c1d','@verbb/supertable/resources/dist'),('f85ef9cc','@app/web/assets/login/dist'),('fbc23d87','@craft/web/assets/craftsupport/dist'),('fc60ecb2','@app/web/assets/cp/dist'),('ffa57a6b','@benf/neo/resources');
/*!40000 ALTER TABLE `resourcepaths` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `revisions` VALUES (1,3,1,1,NULL),(2,3,1,2,NULL),(3,3,1,3,NULL),(4,3,1,4,''),(5,14,1,1,NULL),(6,14,1,2,NULL),(7,17,1,1,NULL),(8,17,1,2,NULL),(9,17,1,3,''),(10,14,1,3,''),(11,14,1,4,NULL),(12,17,1,4,NULL),(13,14,1,5,NULL),(14,17,1,5,NULL),(15,3,1,5,''),(16,3,1,6,''),(17,3,1,7,''),(18,61,1,1,NULL),(19,61,1,2,NULL),(20,64,1,1,NULL),(21,61,1,3,NULL),(22,61,1,4,NULL),(23,68,1,1,NULL),(24,68,1,2,NULL),(25,64,1,2,NULL),(26,61,1,5,''),(27,64,1,3,''),(28,68,1,3,''),(29,94,1,1,''),(30,68,1,4,''),(31,109,1,1,NULL),(32,112,1,1,NULL),(33,109,1,2,''),(34,109,1,3,''),(35,112,1,2,''),(36,68,1,5,NULL),(37,64,1,4,''),(38,3,1,8,''),(39,3,1,9,''),(40,3,1,10,''),(41,3,1,11,''),(42,3,1,12,''),(43,3,1,13,''),(44,3,1,14,'');
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `searchindex` VALUES (1,'email',0,1,' dev fortytwo studio '),(1,'firstname',0,1,''),(1,'fullname',0,1,''),(1,'lastname',0,1,''),(1,'slug',0,1,''),(1,'username',0,1,' admin '),(2,'slug',0,1,''),(3,'slug',0,1,' homepage '),(3,'title',0,1,' homepage '),(7,'slug',0,1,''),(8,'slug',0,1,''),(9,'slug',0,1,''),(11,'slug',0,1,''),(12,'slug',0,1,''),(13,'slug',0,1,''),(14,'slug',0,1,' about us '),(14,'title',0,1,' about us '),(17,'slug',0,1,' contact '),(17,'title',0,1,' contact '),(20,'slug',0,1,''),(21,'slug',0,1,''),(23,'slug',0,1,''),(24,'slug',0,1,''),(25,'slug',0,1,''),(26,'slug',0,1,''),(28,'slug',0,1,''),(29,'slug',0,1,''),(31,'slug',0,1,''),(32,'slug',0,1,''),(34,'slug',0,1,''),(35,'slug',0,1,''),(37,'slug',0,1,''),(38,'slug',0,1,''),(40,'slug',0,1,''),(41,'slug',0,1,''),(42,'slug',0,1,' 1 '),(42,'title',0,1,' about us '),(43,'slug',0,1,' 1 '),(43,'title',0,1,' contact '),(44,'slug',0,1,' 1 '),(44,'title',0,1,' homepage '),(45,'slug',0,1,''),(46,'slug',0,1,''),(46,'title',0,1,' 2021 03 30 06 47 51 '),(47,'slug',0,1,''),(47,'title',0,1,' 2021 03 30 06 53 33 '),(48,'slug',0,1,''),(48,'title',0,1,' 2021 03 30 06 54 15 '),(50,'slug',0,1,''),(51,'slug',0,1,''),(52,'slug',0,1,''),(54,'slug',0,1,''),(55,'slug',0,1,''),(56,'slug',0,1,''),(58,'slug',0,1,''),(59,'slug',0,1,''),(60,'slug',0,1,''),(61,'slug',0,1,' about us '),(61,'title',0,1,' about us '),(64,'slug',0,1,' contact '),(64,'title',0,1,' contact '),(68,'slug',0,1,' latest '),(68,'title',0,1,' latest '),(72,'slug',0,1,''),(73,'slug',0,1,''),(74,'slug',0,1,''),(76,'slug',0,1,''),(77,'slug',0,1,''),(78,'slug',0,1,''),(79,'slug',0,1,''),(80,'slug',0,1,''),(81,'slug',0,1,''),(83,'slug',0,1,''),(84,'slug',0,1,''),(85,'slug',0,1,''),(86,'slug',0,1,''),(87,'slug',0,1,''),(88,'slug',0,1,''),(90,'slug',0,1,''),(91,'slug',0,1,''),(92,'slug',0,1,''),(94,'slug',0,1,' article 1 '),(94,'title',0,1,' article 1 '),(96,'slug',0,1,' 1 '),(96,'title',0,1,' latest '),(97,'slug',0,1,' 1 '),(97,'title',0,1,' contact '),(98,'slug',0,1,' 1 '),(98,'title',0,1,' about us '),(99,'slug',0,1,' 1 '),(99,'title',0,1,' homepage '),(100,'slug',0,1,' 1 '),(100,'title',0,1,' latest '),(101,'slug',0,1,' 1 '),(101,'title',0,1,' contact '),(102,'slug',0,1,' 1 '),(102,'title',0,1,' about us '),(103,'slug',0,1,' 1 '),(103,'title',0,1,' homepage '),(105,'slug',0,1,''),(106,'slug',0,1,''),(107,'slug',0,1,''),(108,'slug',0,1,' 1 '),(108,'title',0,1,' article 1 '),(109,'slug',0,1,' article 2 '),(109,'title',0,1,' article 2 '),(111,'slug',0,1,' 1 '),(111,'title',0,1,' article 2 '),(112,'slug',0,1,' article 3 '),(112,'title',0,1,' article 3 '),(118,'slug',0,1,''),(120,'slug',0,1,''),(121,'slug',0,1,''),(122,'slug',0,1,''),(122,'title',0,1,' 2021 04 06 08 56 28 '),(123,'slug',0,1,''),(123,'title',0,1,' 2021 04 06 08 58 40 '),(124,'slug',0,1,''),(124,'title',0,1,' 2021 04 06 08 59 01 '),(125,'slug',0,1,''),(127,'slug',0,1,''),(128,'slug',0,1,''),(129,'slug',0,1,''),(130,'slug',0,1,''),(131,'slug',0,1,''),(133,'slug',0,1,''),(134,'slug',0,1,''),(135,'slug',0,1,''),(136,'slug',0,1,''),(137,'slug',0,1,''),(138,'slug',0,1,''),(139,'slug',0,1,''),(140,'slug',0,1,''),(142,'slug',0,1,''),(143,'slug',0,1,''),(144,'slug',0,1,''),(145,'slug',0,1,''),(146,'slug',0,1,''),(147,'slug',0,1,''),(148,'slug',0,1,''),(149,'slug',0,1,''),(150,'slug',0,1,''),(152,'slug',0,1,''),(153,'slug',0,1,''),(154,'slug',0,1,''),(155,'slug',0,1,''),(156,'slug',0,1,''),(157,'slug',0,1,''),(158,'slug',0,1,''),(159,'slug',0,1,''),(160,'slug',0,1,''),(161,'slug',0,1,''),(163,'slug',0,1,''),(164,'slug',0,1,''),(165,'slug',0,1,''),(166,'slug',0,1,''),(167,'slug',0,1,''),(168,'slug',0,1,''),(169,'slug',0,1,''),(170,'slug',0,1,''),(171,'slug',0,1,''),(172,'slug',0,1,''),(173,'slug',0,1,''),(175,'slug',0,1,''),(176,'slug',0,1,''),(177,'slug',0,1,''),(178,'slug',0,1,''),(179,'slug',0,1,''),(180,'slug',0,1,''),(181,'slug',0,1,''),(182,'slug',0,1,''),(183,'slug',0,1,''),(184,'slug',0,1,''),(185,'slug',0,1,''),(186,'slug',0,1,''),(187,'slug',0,1,''),(189,'slug',0,1,''),(190,'slug',0,1,''),(191,'slug',0,1,''),(192,'slug',0,1,''),(193,'slug',0,1,''),(194,'slug',0,1,''),(195,'slug',0,1,''),(196,'slug',0,1,''),(197,'slug',0,1,''),(198,'slug',0,1,''),(199,'slug',0,1,''),(200,'slug',0,1,''),(201,'slug',0,1,'');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections` VALUES (1,NULL,'Homepage','homepage','single',1,'all',NULL,'2021-03-30 09:38:29','2021-03-30 09:38:29',NULL,'32e8ea43-4e6d-46eb-9344-6755923c28de'),(2,NULL,'About us','aboutUs','single',1,'all',NULL,'2021-03-30 11:04:36','2021-03-30 11:04:36','2021-03-30 14:30:19','2da11c19-0f29-4228-83ca-0b740582f078'),(3,NULL,'Contact','contact','single',1,'all',NULL,'2021-03-30 11:05:32','2021-03-30 11:05:32','2021-03-30 14:30:22','10af4cfa-43f8-4f3d-a351-3cdad7711daf'),(4,NULL,'About','about','single',1,'all',NULL,'2021-03-31 11:24:42','2021-03-31 11:26:20',NULL,'b8e69404-8329-47fa-8f41-a98c933804c3'),(5,NULL,'Contact','contact','single',1,'all',NULL,'2021-03-31 11:25:45','2021-03-31 11:25:45',NULL,'f1abfa1e-3f54-4765-8991-815c87484c9b'),(6,NULL,'Latest Index','latestIndex','single',1,'all',NULL,'2021-03-31 11:27:00','2021-03-31 11:27:00',NULL,'2f28cd37-4b8e-4b68-806e-97ecc9f63d04'),(7,NULL,'Latest','latest','channel',1,'all',NULL,'2021-03-31 11:27:16','2021-03-31 11:27:16',NULL,'ddd7384c-d723-4aad-b2f6-845216bb1dbf');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_sites` VALUES (1,1,1,1,'__home__','index',1,'2021-03-30 09:38:29','2021-03-30 09:38:29','648308b2-5c5e-4444-a35a-5b786d92eada'),(2,2,1,1,'about-us','about-us/index',1,'2021-03-30 11:04:36','2021-03-30 11:09:56','01ccf7e7-7aec-41da-8fa3-ad802c418209'),(3,3,1,1,'contact','contact/index',1,'2021-03-30 11:05:32','2021-03-30 11:10:02','3e73ee33-11fa-4a71-871c-aab068955458'),(4,4,1,1,'about','about/_index',1,'2021-03-31 11:24:42','2021-03-31 11:26:20','31b6c6c9-85cb-4007-b8ff-df7838b54221'),(5,5,1,1,'contact','contact/_index',1,'2021-03-31 11:25:45','2021-03-31 11:25:45','8d53f6ea-e1e5-406d-b369-38403cc72345'),(6,6,1,1,'latest','latest/_index',1,'2021-03-31 11:27:00','2021-03-31 11:27:00','937e0aa0-43be-4caa-b5d3-0f90266c1196'),(7,7,1,1,'latest/{slug}','latest/_entry',1,'2021-03-31 11:27:16','2021-03-31 11:27:16','f278211c-ee9c-43c8-abfc-dc0085a1e052');
/*!40000 ALTER TABLE `sections_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `seo_redirects`
--

LOCK TABLES `seo_redirects` WRITE;
/*!40000 ALTER TABLE `seo_redirects` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `seo_redirects` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `seo_sitemap`
--

LOCK TABLES `seo_sitemap` WRITE;
/*!40000 ALTER TABLE `seo_sitemap` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `seo_sitemap` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sequences`
--

LOCK TABLES `sequences` WRITE;
/*!40000 ALTER TABLE `sequences` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `sequences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `shunnedmessages`
--

LOCK TABLES `shunnedmessages` WRITE;
/*!40000 ALTER TABLE `shunnedmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `shunnedmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sitegroups`
--

LOCK TABLES `sitegroups` WRITE;
/*!40000 ALTER TABLE `sitegroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sitegroups` VALUES (1,'Craft CMS Boilerplate','2021-03-30 09:20:10','2021-03-30 14:56:19',NULL,'f99d20c5-6966-4180-8dc1-595df3b8f876');
/*!40000 ALTER TABLE `sitegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sites` VALUES (1,1,1,1,'Craft CMS Boilerplate','default','en-GB',1,'$PRIMARY_SITE_URL',1,'2021-03-30 09:20:10','2021-03-30 14:56:04',NULL,'18d78006-3985-4ea4-b620-67bae10d9c2d');
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `stc_socialprofiles`
--

LOCK TABLES `stc_socialprofiles` WRITE;
/*!40000 ALTER TABLE `stc_socialprofiles` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `stc_socialprofiles` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structureelements`
--

LOCK TABLES `structureelements` WRITE;
/*!40000 ALTER TABLE `structureelements` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `structureelements` VALUES (1,1,NULL,1,1,2,0,'2021-03-30 10:33:15','2021-03-30 14:30:03','12f23bb8-824a-42b5-bf70-cf1b008c1ec0'),(3,2,NULL,3,1,2,0,'2021-03-30 10:33:15','2021-03-30 14:30:04','dd4fc483-2eb3-4098-9b5b-d053e5b9f5ce'),(6,3,NULL,6,1,4,0,'2021-03-30 10:33:18','2021-03-30 10:33:18','183b0817-ca68-45f9-9898-5e354070d443'),(7,3,11,6,2,3,1,'2021-03-30 10:33:18','2021-03-30 10:33:18','ef57b5c8-8369-42d4-b785-eefc4050a774'),(8,4,NULL,8,1,6,0,'2021-03-30 10:33:18','2021-03-30 10:33:18','76cafe86-b080-4429-bb6e-2e818813ecd7'),(9,4,12,8,2,3,1,'2021-03-30 10:33:18','2021-03-30 10:33:18','6c2703d7-de26-460e-85cb-ed2bc2ea2fe2'),(10,4,13,8,4,5,1,'2021-03-30 10:33:18','2021-03-30 10:33:18','8092b8bc-5a3d-411a-a985-090405bce011'),(11,5,NULL,11,1,2,0,'2021-03-30 11:07:21','2021-03-30 14:30:22','da7ea359-5631-4ee7-a504-704d4dbfdbb6'),(13,6,NULL,13,1,2,0,'2021-03-30 11:07:21','2021-03-30 14:30:22','8aff1714-f1aa-4054-a66f-c7849ff43137'),(15,7,NULL,15,1,4,0,'2021-03-30 11:07:22','2021-03-30 11:07:22','62e4f30d-d09c-415a-8e95-3d4c0027eed6'),(16,7,23,15,2,3,1,'2021-03-30 11:07:22','2021-03-30 11:07:22','cf7297ae-6ed8-475a-9ac5-9c921c5d79f5'),(17,8,NULL,17,1,4,0,'2021-03-30 11:07:22','2021-03-30 11:07:22','cc55d342-55d6-4c27-9468-481e89e7eadd'),(18,8,24,17,2,3,1,'2021-03-30 11:07:22','2021-03-30 11:07:22','86bac375-52dc-4684-ac29-623a8a6af98e'),(19,9,NULL,19,1,2,0,'2021-03-30 11:07:50','2021-03-30 14:30:19','a1deb832-ebf1-4729-b97a-1c818bbd2560'),(21,10,NULL,21,1,2,0,'2021-03-30 11:07:50','2021-03-30 14:30:19','59c2aa68-074e-459e-9f6a-f6d434984162'),(23,11,NULL,23,1,4,0,'2021-03-30 11:07:51','2021-03-30 11:07:51','85841026-c26f-48c4-8f99-6678b568411c'),(24,11,28,23,2,3,1,'2021-03-30 11:07:51','2021-03-30 11:07:51','574a6075-b699-432d-bb99-963d206b5829'),(25,12,NULL,25,1,4,0,'2021-03-30 11:07:51','2021-03-30 11:07:51','bf3aabe3-6c5a-4a00-9a3c-255e3198dc01'),(26,12,29,25,2,3,1,'2021-03-30 11:07:51','2021-03-30 11:07:51','b1f85946-3aec-436a-8895-b175dd267055'),(27,13,NULL,27,1,4,0,'2021-03-30 11:09:09','2021-03-30 11:09:09','dac7d8a9-760a-4a3c-8006-4a70cc9ffbb9'),(28,13,31,27,2,3,1,'2021-03-30 11:09:09','2021-03-30 11:09:09','09f4a2bb-eb12-45da-991d-0885dbb1413e'),(29,14,NULL,29,1,4,0,'2021-03-30 11:09:09','2021-03-30 11:09:09','f77b206e-5c23-49fe-86ac-1ba7b89ed1f7'),(30,14,32,29,2,3,1,'2021-03-30 11:09:09','2021-03-30 11:09:09','07d28317-5925-43cf-905e-170f64cec15e'),(31,15,NULL,31,1,4,0,'2021-03-30 11:09:30','2021-03-30 11:09:30','617d04ed-0ca0-48fa-bc94-0179e33c151d'),(32,15,34,31,2,3,1,'2021-03-30 11:09:30','2021-03-30 11:09:30','4fe4aadd-c284-449b-99ed-bc8d419c4296'),(33,16,NULL,33,1,4,0,'2021-03-30 11:09:30','2021-03-30 11:09:30','fb8e673b-f55b-43f5-9dd5-f058035f800b'),(34,16,35,33,2,3,1,'2021-03-30 11:09:30','2021-03-30 11:09:30','fd3952c2-f358-4f71-b35a-4419763998f3'),(35,17,NULL,35,1,4,0,'2021-03-30 11:09:57','2021-03-30 11:09:57','f8eb1d13-f1df-4fe3-858a-647f5194e075'),(36,17,37,35,2,3,1,'2021-03-30 11:09:57','2021-03-30 11:09:57','e7458099-a8d9-453b-9327-c53b8025f2d5'),(37,18,NULL,37,1,4,0,'2021-03-30 11:09:57','2021-03-30 11:09:57','f409fa8b-0d8b-4337-9494-6567f190b0f7'),(38,18,38,37,2,3,1,'2021-03-30 11:09:57','2021-03-30 11:09:57','2636aa12-55a6-4232-8f69-a64f1ff07730'),(39,19,NULL,39,1,4,0,'2021-03-30 11:10:04','2021-03-30 11:10:04','ef785424-7fcd-4de3-bd18-b31d59158b22'),(40,19,40,39,2,3,1,'2021-03-30 11:10:04','2021-03-30 11:10:04','ff68f1d2-95da-48aa-b355-48e1d2567fc0'),(41,20,NULL,41,1,4,0,'2021-03-30 11:10:04','2021-03-30 11:10:04','952082f3-7bcf-4221-92fd-7fda7257648a'),(42,20,41,41,2,3,1,'2021-03-30 11:10:04','2021-03-30 11:10:04','a38ad659-1feb-49db-8573-4d0576c1e79f'),(43,21,NULL,43,1,2,0,'2021-03-30 11:14:00','2021-03-30 14:28:25','a85106c8-1c9a-41e4-950a-b8f5cf3aa59d'),(47,24,NULL,47,1,4,0,'2021-03-30 14:30:19','2021-03-30 14:30:19','7a63093f-8bb8-4456-82ae-12997f5cacd2'),(48,24,25,47,2,3,1,'2021-03-30 14:30:19','2021-03-30 14:30:19','3b0fba16-9661-44c8-bb7c-c9cb62bb52c2'),(49,25,NULL,49,1,4,0,'2021-03-30 14:30:19','2021-03-30 14:30:19','0cc403ef-88d3-4ec6-acf5-13c5b735b739'),(50,25,26,49,2,3,1,'2021-03-30 14:30:19','2021-03-30 14:30:19','1889dcee-d16a-4ebe-8085-641ee9da37b2'),(51,26,NULL,51,1,4,0,'2021-03-30 14:30:22','2021-03-30 14:30:22','9920b6ce-7f40-4be6-9205-a3fbcbed6c27'),(52,26,20,51,2,3,1,'2021-03-30 14:30:22','2021-03-30 14:30:22','c60a25b3-7966-4e04-abfc-de063d7a505d'),(53,27,NULL,53,1,4,0,'2021-03-30 14:30:22','2021-03-30 14:30:22','c02d6b68-734d-4a83-a460-565688d9239c'),(54,27,21,53,2,3,1,'2021-03-30 14:30:22','2021-03-30 14:30:22','c9f7470d-029d-4624-9c4f-1c724397be77'),(55,28,NULL,55,1,4,0,'2021-03-30 14:58:55','2021-03-30 14:58:55','57c9f939-b9d1-401d-835e-25ab06e34965'),(56,28,50,55,2,3,1,'2021-03-30 14:58:55','2021-03-30 14:58:55','42ac35c9-b231-4a17-974a-1a51d3fc402b'),(57,29,NULL,57,1,6,0,'2021-03-30 14:58:55','2021-03-30 14:58:55','893a8ee6-19d2-45b9-aede-2faf43514a71'),(58,29,51,57,2,3,1,'2021-03-30 14:58:55','2021-03-30 14:58:55','8da76fc6-ac30-4b28-a321-c48b32780f16'),(59,29,52,57,4,5,1,'2021-03-30 14:58:55','2021-03-30 14:58:55','5c0d52d8-6264-409a-9300-ca1d5e51d3b5'),(60,30,NULL,60,1,4,0,'2021-03-30 14:58:57','2021-03-30 14:58:57','472502c2-4f28-4472-b011-d6836921403a'),(61,30,54,60,2,3,1,'2021-03-30 14:58:57','2021-03-30 14:58:57','ee1300eb-d4d4-451c-ae19-3973c975d11a'),(62,31,NULL,62,1,6,0,'2021-03-30 14:58:57','2021-03-30 14:58:57','4546e2b5-88ed-417e-b6df-6924f5d8f7fb'),(63,31,55,62,2,3,1,'2021-03-30 14:58:57','2021-03-30 14:58:57','a2bf66be-3c1b-4ec0-b677-4a43a37c0a72'),(64,31,56,62,4,5,1,'2021-03-30 14:58:57','2021-03-30 14:58:57','7dda3085-e7ad-42cd-8c17-d730fef3fc06'),(65,32,NULL,65,1,4,0,'2021-03-30 15:00:18','2021-03-30 15:00:18','64be63f5-a2b1-431d-9f5f-17a9e1fac4a1'),(66,32,58,65,2,3,1,'2021-03-30 15:00:18','2021-03-30 15:00:18','ce026ac2-8340-4a42-8f84-ba1cae629373'),(67,33,NULL,67,1,6,0,'2021-03-30 15:00:18','2021-03-30 15:00:18','35ea155e-195f-4c2c-85a2-e54d97e49a18'),(68,33,59,67,2,3,1,'2021-03-30 15:00:18','2021-03-30 15:00:18','a9c159e3-041b-4263-b916-bb2f9bcb7f13'),(69,33,60,67,4,5,1,'2021-03-30 15:00:18','2021-03-30 15:00:18','1386aeb4-500c-43ca-b2fe-a245a345d085'),(70,34,NULL,70,1,4,0,'2021-03-31 11:33:02','2021-03-31 11:33:02','1cd45976-ee58-4d5f-902d-3d934961228a'),(71,34,72,70,2,3,1,'2021-03-31 11:33:02','2021-03-31 11:33:02','3b288805-9267-4502-bb22-ebc3d40c490a'),(72,35,NULL,72,1,6,0,'2021-03-31 11:33:02','2021-03-31 11:33:02','3c9d15d2-8aaf-475b-980c-cb191c7e06d7'),(73,35,73,72,2,3,1,'2021-03-31 11:33:02','2021-03-31 11:33:02','4e6f3e37-61f8-4d16-b75e-6f6e9e1aaa96'),(74,35,74,72,4,5,1,'2021-03-31 11:33:02','2021-03-31 11:33:02','85e7b678-1e77-42ce-8e51-e8a5b8fa7e81'),(75,36,NULL,75,1,4,0,'2021-03-31 11:33:05','2021-03-31 11:33:05','3d7b8022-9888-4f34-b7ca-a27182ddb2f4'),(76,36,76,75,2,3,1,'2021-03-31 11:33:05','2021-03-31 11:33:05','a3090df2-6c92-4adc-96a4-99eafbf21105'),(77,37,NULL,77,1,6,0,'2021-03-31 11:33:05','2021-03-31 11:33:05','766ae557-9955-427f-823f-fbeb188c3c50'),(78,37,77,77,2,3,1,'2021-03-31 11:33:05','2021-03-31 11:33:05','89f7ab68-774d-46e0-a0a7-d5a98e4de230'),(79,37,78,77,4,5,1,'2021-03-31 11:33:05','2021-03-31 11:33:05','c77224cc-510f-4dd2-a3dd-76313af90f8b'),(80,38,NULL,80,1,4,0,'2021-03-31 11:33:39','2021-03-31 11:33:39','3d35abc8-2f8e-4b30-bac9-d95f4f78dc72'),(81,38,79,80,2,3,1,'2021-03-31 11:33:39','2021-03-31 11:33:39','b2c96d1d-b9ba-4258-a474-e789fe24928e'),(82,39,NULL,82,1,4,0,'2021-03-31 11:33:39','2021-04-06 15:56:14','84ad1d63-445f-4199-9a11-de2f96d3a332'),(83,39,80,82,2,3,1,'2021-03-31 11:33:39','2021-03-31 11:33:39','61fb0e54-36c0-454f-aacb-3fee38999c5b'),(85,40,NULL,85,1,4,0,'2021-03-31 11:33:41','2021-03-31 11:33:41','d5658982-4421-4afd-aa6d-25d0853d48d5'),(86,40,83,85,2,3,1,'2021-03-31 11:33:41','2021-03-31 11:33:41','202900c1-d9da-45ee-9217-f1ca644a41c2'),(87,41,NULL,87,1,6,0,'2021-03-31 11:33:41','2021-03-31 11:33:41','b517bdd5-2800-4d63-b7e1-a08ae4f34bd6'),(88,41,84,87,2,3,1,'2021-03-31 11:33:41','2021-03-31 11:33:41','34fa6f92-fdef-45ff-b9d2-22db3b396a72'),(89,41,85,87,4,5,1,'2021-03-31 11:33:41','2021-03-31 11:33:41','ed301fa7-57cb-4618-bb66-29fc0935abe4'),(90,42,NULL,90,1,4,0,'2021-03-31 11:34:47','2021-03-31 11:34:47','dba21445-e610-4921-b696-ee238aee7ce6'),(91,42,86,90,2,3,1,'2021-03-31 11:34:47','2021-03-31 11:34:47','9bdf2064-4186-403f-8405-944a0f9e9865'),(92,43,NULL,92,1,6,0,'2021-03-31 11:34:48','2021-03-31 11:34:48','309819a9-a45f-4642-84e5-a3fa9382371c'),(93,43,87,92,2,3,1,'2021-03-31 11:34:48','2021-03-31 11:34:48','9437e9bd-75e3-4d4d-ada4-c80bdfcfcc05'),(94,43,88,92,4,5,1,'2021-03-31 11:34:48','2021-03-31 11:34:48','09c39e2a-d39a-4266-9e0b-663720ddb734'),(95,44,NULL,95,1,4,0,'2021-03-31 11:34:49','2021-03-31 11:34:49','b254c3bc-ee61-4fef-b8f3-e74e52432a4b'),(96,44,90,95,2,3,1,'2021-03-31 11:34:49','2021-03-31 11:34:49','5e0b396f-1e16-42c9-91ec-7267930160d4'),(97,45,NULL,97,1,6,0,'2021-03-31 11:34:50','2021-03-31 11:34:50','7ace44be-da91-46ce-b5c2-ca0700206b90'),(98,45,91,97,2,3,1,'2021-03-31 11:34:50','2021-03-31 11:34:50','cf38f18f-5ae9-4146-b447-57ddcd1e7beb'),(99,45,92,97,4,5,1,'2021-03-31 11:34:50','2021-03-31 11:34:50','4b3dd4b2-bfa3-4495-a2e9-93b98bef3397'),(100,46,NULL,100,1,14,0,'2021-03-31 11:37:26','2021-04-06 12:32:41','f677e59d-2e67-4e5f-8cb5-efbe18b72437'),(101,46,96,100,6,11,1,'2021-03-31 11:37:26','2021-04-06 12:32:41','cc74f8c1-1951-44a4-9973-348469df6f09'),(102,46,97,100,12,13,1,'2021-03-31 11:37:26','2021-04-06 12:32:41','219cb5f7-5883-467c-91e9-aa09790c0972'),(103,46,98,100,4,5,1,'2021-03-31 11:37:26','2021-03-31 13:19:24','fccf6f47-8fe7-462e-8922-fbafb1df420a'),(104,46,99,100,2,3,1,'2021-03-31 11:37:26','2021-03-31 13:19:20','2e3ac0e5-794a-44a7-ad38-6c4801a93264'),(105,47,NULL,105,1,10,0,'2021-03-31 11:38:08','2021-03-31 11:38:16','002bcfec-4bd6-4bca-bcef-33d28f01a0d6'),(106,47,100,105,6,7,1,'2021-03-31 11:38:08','2021-03-31 11:38:16','b2436a73-b58f-46f8-84de-e1d3ea350849'),(107,47,101,105,8,9,1,'2021-03-31 11:38:08','2021-03-31 11:38:16','3d48e237-4552-400d-aa1a-8a8e8031946e'),(108,47,102,105,4,5,1,'2021-03-31 11:38:08','2021-03-31 11:38:16','11de8d2c-78ce-47d2-9832-40ec0b865941'),(109,47,103,105,2,3,1,'2021-03-31 11:38:08','2021-03-31 11:38:16','2aa95cea-4493-4f8e-a6cf-13e06855c0c4'),(110,48,NULL,110,1,4,0,'2021-03-31 11:43:51','2021-03-31 11:43:51','18df8b87-fc7b-426d-990c-2b39e79eb821'),(111,48,105,110,2,3,1,'2021-03-31 11:43:51','2021-03-31 11:43:51','23473bc8-70f9-41e1-bf77-508d7d34bbd6'),(112,49,NULL,112,1,6,0,'2021-03-31 11:43:51','2021-03-31 11:43:51','bde4fe7c-f230-4441-8aa7-fcc291107069'),(113,49,106,112,2,3,1,'2021-03-31 11:43:51','2021-03-31 11:43:51','7875b48b-43a2-4fc4-9bc3-7bdd2204433a'),(114,49,107,112,4,5,1,'2021-03-31 11:43:51','2021-03-31 11:43:51','86fc4615-77bb-4682-b826-4f48d8913448'),(115,46,108,100,7,8,2,'2021-03-31 13:07:33','2021-03-31 13:19:28','cd3b71fb-1f41-41ef-8280-2b1f267d8d8e'),(116,46,111,100,9,10,2,'2021-04-06 12:32:41','2021-04-06 12:32:41','78afe44a-4bae-4a15-95ee-afba84148a8b'),(117,50,NULL,117,1,4,0,'2021-04-06 15:37:51','2021-04-06 15:37:51','5fa5144a-d407-4f0f-965c-7d492fdd43d4'),(118,50,118,117,2,3,1,'2021-04-06 15:37:51','2021-04-06 15:37:51','fa565ba0-2683-4685-8cdb-c1ae670a7e31'),(119,51,NULL,119,1,4,0,'2021-04-06 15:56:14','2021-04-06 15:56:14','e2c8b9a9-b43a-4a5b-a23a-c6eeed256118'),(120,51,80,119,2,3,1,'2021-04-06 15:56:14','2021-04-06 15:56:14','2fcf3afd-6898-439e-854f-638b510a54d7'),(121,52,NULL,121,1,4,0,'2021-04-06 15:56:16','2021-04-06 15:56:16','06ecbdfd-716d-4f1a-94ca-8388e666d35d'),(122,52,120,121,2,3,1,'2021-04-06 15:56:16','2021-04-06 15:56:16','d264d5e3-b491-4fd0-8b30-ce72c1e4902b'),(123,53,NULL,123,1,4,0,'2021-04-06 15:56:16','2021-04-06 15:56:16','87b7369c-0e7f-4967-baa3-1fb03a9927bb'),(124,53,121,123,2,3,1,'2021-04-06 15:56:16','2021-04-06 15:56:16','c7cde4c8-1705-4b3d-bcc1-86c8f8899380'),(125,54,NULL,125,1,8,0,'2021-04-06 16:08:17','2021-04-06 16:08:17','6c9a1435-741e-4935-963c-cc704d6d2351'),(126,54,51,125,2,3,1,'2021-04-06 16:08:17','2021-04-06 16:08:17','cdd47736-9917-449b-ba42-91a41c77158b'),(127,54,52,125,4,5,1,'2021-04-06 16:08:17','2021-04-06 16:08:17','62945c7d-e06f-42c4-9daf-b4c99b5c802d'),(128,54,125,125,6,7,1,'2021-04-06 16:08:17','2021-04-06 16:08:17','bcc7352b-b44f-474a-970e-b8e8df197e83'),(129,55,NULL,129,1,4,0,'2021-04-06 16:08:18','2021-04-06 16:08:18','dd27bfc3-57c3-4635-bb22-61643b233c82'),(130,55,127,129,2,3,1,'2021-04-06 16:08:18','2021-04-06 16:08:18','3d820dc4-6cb9-4ef8-b502-416e185395a1'),(131,56,NULL,131,1,8,0,'2021-04-06 16:08:18','2021-04-06 16:08:18','b47df607-5ae5-4707-9b51-1c432ef546c8'),(132,56,128,131,2,3,1,'2021-04-06 16:08:18','2021-04-06 16:08:18','5c77569a-9760-4452-b7b6-516479da640e'),(133,56,129,131,4,5,1,'2021-04-06 16:08:18','2021-04-06 16:08:18','1ea3c7e4-3c40-4ec1-b24f-a946b811c535'),(134,56,130,131,6,7,1,'2021-04-06 16:08:18','2021-04-06 16:08:18','ddb0b3c7-14e9-4d0e-8889-1b4d53956641'),(135,57,NULL,135,1,10,0,'2021-04-07 08:25:58','2021-04-07 08:25:58','f24fa3fa-0834-48d6-bc40-7cbd06151f8b'),(136,57,51,135,2,3,1,'2021-04-07 08:25:58','2021-04-07 08:25:58','6932bdaf-dd1f-4ed4-932a-4a20d867f02d'),(137,57,52,135,4,5,1,'2021-04-07 08:25:58','2021-04-07 08:25:58','287865c3-36df-4b36-8c80-22d2bfbb3c88'),(138,57,125,135,6,7,1,'2021-04-07 08:25:58','2021-04-07 08:25:58','a57a32d9-10bb-4a78-bcac-bab2b9bcb4fc'),(139,57,131,135,8,9,1,'2021-04-07 08:25:58','2021-04-07 08:25:58','784179f5-3e9d-434f-9ceb-abf42695854c'),(140,58,NULL,140,1,4,0,'2021-04-07 08:26:00','2021-04-07 08:26:00','edca9b59-eb45-4536-aea2-a1783ff6b8dc'),(141,58,133,140,2,3,1,'2021-04-07 08:26:00','2021-04-07 08:26:00','f2fcde48-6afb-4b47-bfd4-893335c8755c'),(142,59,NULL,142,1,10,0,'2021-04-07 08:26:00','2021-04-07 08:26:00','dbbbabfa-adc7-4c83-9fb1-2bf8e1de98c7'),(143,59,134,142,2,3,1,'2021-04-07 08:26:00','2021-04-07 08:26:00','3f2c6ea2-c4f9-45e8-9c9e-4dff7d8111de'),(144,59,135,142,4,5,1,'2021-04-07 08:26:00','2021-04-07 08:26:00','0a673c6e-b879-4bd6-a5aa-33411a0c1443'),(145,59,136,142,6,7,1,'2021-04-07 08:26:00','2021-04-07 08:26:00','0e16715c-2d77-48bb-95da-e4b02e388f37'),(146,59,137,142,8,9,1,'2021-04-07 08:26:00','2021-04-07 08:26:00','6f5dc466-b426-4bc5-8850-d92ffe85e53c'),(147,60,NULL,147,1,12,0,'2021-04-07 08:54:20','2021-04-07 08:54:20','ce724553-0cc2-4288-a7cd-a30811492fc8'),(148,60,51,147,2,3,1,'2021-04-07 08:54:20','2021-04-07 08:54:20','a89f5f5f-ec19-47ab-bd3a-8aacab1b56bb'),(149,60,52,147,4,5,1,'2021-04-07 08:54:20','2021-04-07 08:54:20','566706a2-e90d-4d02-af37-453f380271b6'),(150,60,125,147,6,7,1,'2021-04-07 08:54:20','2021-04-07 08:54:20','d4d56996-a2a9-4450-879e-6ca12f33d6ea'),(151,60,131,147,8,9,1,'2021-04-07 08:54:20','2021-04-07 08:54:20','72fefc8f-5aa6-45ed-88e2-a27c3ceb0adc'),(152,60,138,147,10,11,1,'2021-04-07 08:54:20','2021-04-07 08:54:20','b8099ab0-b94a-4651-a6ca-140e317a3141'),(153,61,NULL,153,1,4,0,'2021-04-07 08:54:22','2021-04-07 08:54:22','74766baf-02a8-49fa-998d-f9d692595b52'),(154,61,142,153,2,3,1,'2021-04-07 08:54:22','2021-04-07 08:54:22','28ca87ae-0f07-4a32-96d7-8c5fdabe1bf7'),(155,62,NULL,155,1,12,0,'2021-04-07 08:54:22','2021-04-07 08:54:22','ff8d1c92-d0ac-4fe8-b1f4-008571ce9cdc'),(156,62,143,155,2,3,1,'2021-04-07 08:54:22','2021-04-07 08:54:22','f05e4d44-a21a-44d3-96bf-c93b301ced7e'),(157,62,144,155,4,5,1,'2021-04-07 08:54:22','2021-04-07 08:54:22','a4c6aede-94f1-4db4-b122-64eaca69f53d'),(158,62,145,155,6,7,1,'2021-04-07 08:54:22','2021-04-07 08:54:22','d8c1924c-1d8b-4a5a-9fb2-6ed334bdb90a'),(159,62,146,155,8,9,1,'2021-04-07 08:54:22','2021-04-07 08:54:22','b596c99e-143e-4e19-aa61-973d582d5540'),(160,62,147,155,10,11,1,'2021-04-07 08:54:22','2021-04-07 08:54:22','2cba239a-b880-4bf0-a02f-cc41c8da0a0c'),(161,63,NULL,161,1,4,0,'2021-04-07 09:24:35','2021-04-07 09:24:35','d540ff3b-da97-4f92-a505-f17cec23e953'),(162,63,152,161,2,3,1,'2021-04-07 09:24:35','2021-04-07 09:24:35','94d19ded-a660-4cd1-9379-5114eedc997c'),(163,64,NULL,163,1,12,0,'2021-04-07 09:24:35','2021-04-07 09:24:35','924de691-4aa7-491c-8e44-61db8d0a24cf'),(164,64,153,163,2,3,1,'2021-04-07 09:24:35','2021-04-07 09:24:35','18bebb2e-928b-4a77-bfa7-2a48a0ba0119'),(165,64,154,163,4,5,1,'2021-04-07 09:24:35','2021-04-07 09:24:35','c3d39b86-f85f-45ee-afe0-76b3175a013d'),(166,64,155,163,6,7,1,'2021-04-07 09:24:35','2021-04-07 09:24:35','45b33331-1306-4b8c-87e8-dde128d98f5c'),(167,64,156,163,8,9,1,'2021-04-07 09:24:35','2021-04-07 09:24:35','2ad88b91-2a66-4dbe-af0a-d998a758fd84'),(168,64,157,163,10,11,1,'2021-04-07 09:24:35','2021-04-07 09:24:35','5518324c-92a1-4195-85c6-4d85fced1201'),(169,65,NULL,169,1,4,0,'2021-04-07 09:31:21','2021-04-07 09:31:21','27eae21e-27e0-461a-af5e-ae3d7be037dc'),(170,65,163,169,2,3,1,'2021-04-07 09:31:21','2021-04-07 09:31:21','417470c4-ca9a-4ba7-8e8d-e03f83dd193c'),(171,66,NULL,171,1,12,0,'2021-04-07 09:31:21','2021-04-07 09:31:21','15838b85-6de5-4faf-9463-7a37f7469daf'),(172,66,164,171,2,3,1,'2021-04-07 09:31:21','2021-04-07 09:31:21','9bc249f5-9673-494f-97eb-f4832d955c3c'),(173,66,165,171,4,5,1,'2021-04-07 09:31:21','2021-04-07 09:31:21','0165860b-9b16-4008-bb16-ce76a83e1629'),(174,66,166,171,6,7,1,'2021-04-07 09:31:21','2021-04-07 09:31:21','90487b80-b43e-43b6-98c4-d463ff3f5318'),(175,66,167,171,8,9,1,'2021-04-07 09:31:21','2021-04-07 09:31:21','e243c00f-6a4d-402f-af66-00e82bb7c192'),(176,66,169,171,10,11,1,'2021-04-07 09:31:21','2021-04-07 09:31:21','a9d30459-9829-4cff-b367-7aae65f072e5'),(177,67,NULL,177,1,4,0,'2021-04-07 09:42:17','2021-04-07 09:42:17','be0ca2b9-49b9-4deb-a864-44038e5276e6'),(178,67,175,177,2,3,1,'2021-04-07 09:42:17','2021-04-07 09:42:17','55ad9aa0-da77-429a-8afc-6b23bb8ac44e'),(179,68,NULL,179,1,12,0,'2021-04-07 09:42:17','2021-04-07 09:42:17','4ec9b672-51fc-445b-be0f-ac317dfd0635'),(180,68,176,179,2,3,1,'2021-04-07 09:42:17','2021-04-07 09:42:17','4d04008a-446a-4c99-84f7-48e3cae16f87'),(181,68,177,179,4,5,1,'2021-04-07 09:42:17','2021-04-07 09:42:17','83e26d84-9aa8-41b0-881b-5ad38419c8a4'),(182,68,178,179,6,7,1,'2021-04-07 09:42:17','2021-04-07 09:42:17','2f83c776-38c2-47bb-8410-bb98020db3a9'),(183,68,179,179,8,9,1,'2021-04-07 09:42:17','2021-04-07 09:42:17','b9156b81-4b6c-4c76-b118-aa642d59a858'),(184,68,181,179,10,11,1,'2021-04-07 09:42:17','2021-04-07 09:42:17','9f05166e-e632-4e0e-8e84-dd2aac738e0f'),(185,69,NULL,185,1,14,0,'2021-04-07 09:55:25','2021-04-07 09:55:25','fe423e5d-c309-4aec-b3bc-4b7d7bc6afb7'),(186,69,51,185,2,3,1,'2021-04-07 09:55:25','2021-04-07 09:55:25','c5418737-c008-475b-a907-85cdb0fe0352'),(187,69,185,185,4,5,1,'2021-04-07 09:55:25','2021-04-07 09:55:25','bff8a1c3-02b7-485f-be87-31dd1586f4ee'),(188,69,52,185,6,7,1,'2021-04-07 09:55:25','2021-04-07 09:55:25','5c71c698-2a92-42a8-958e-15fbf9f8d406'),(189,69,125,185,8,9,1,'2021-04-07 09:55:25','2021-04-07 09:55:25','09899106-c724-4f79-b2fa-41e5159a8b92'),(190,69,131,185,10,11,1,'2021-04-07 09:55:25','2021-04-07 09:55:25','6b65dfd7-d942-41ee-9495-4df5de000b5a'),(191,69,138,185,12,13,1,'2021-04-07 09:55:25','2021-04-07 09:55:25','5e4bfd14-413a-4d3c-a656-16770ed8dce6'),(192,70,NULL,192,1,4,0,'2021-04-07 09:55:28','2021-04-07 09:55:28','f109b7ed-4156-453e-9e8e-544194acfc57'),(193,70,189,192,2,3,1,'2021-04-07 09:55:28','2021-04-07 09:55:28','0097296d-cfd4-491e-8089-6ef2727363db'),(194,71,NULL,194,1,14,0,'2021-04-07 09:55:28','2021-04-07 09:55:28','ab12a472-6f5a-42c1-b547-97d732e44608'),(195,71,190,194,2,3,1,'2021-04-07 09:55:28','2021-04-07 09:55:28','29d65572-a512-44dd-aa35-c548fa88b921'),(196,71,191,194,4,5,1,'2021-04-07 09:55:28','2021-04-07 09:55:28','b36a6f50-58e1-4572-81ea-9a80730f91e3'),(197,71,194,194,6,7,1,'2021-04-07 09:55:28','2021-04-07 09:55:28','8cc1e88f-beee-4c8b-ae06-a0f108121a4e'),(198,71,195,194,8,9,1,'2021-04-07 09:55:28','2021-04-07 09:55:28','06a83a7a-674d-4903-b5d1-facea4873bbb'),(199,71,196,194,10,11,1,'2021-04-07 09:55:28','2021-04-07 09:55:28','6a44a712-b47e-4e75-b193-b536dfbc4008'),(200,71,198,194,12,13,1,'2021-04-07 09:55:28','2021-04-07 09:55:28','69a45b99-cbc5-457c-a815-cc7743005272');
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `structures` VALUES (1,NULL,'2021-03-30 10:33:15','2021-03-30 10:33:15','2021-03-30 14:30:04','d355faf1-2e34-433e-8db4-9ee16b8e468a'),(2,NULL,'2021-03-30 10:33:15','2021-03-30 10:33:15','2021-03-30 14:30:04','a7906e3b-f55f-430f-95f7-b838b6d54eda'),(3,NULL,'2021-03-30 10:33:18','2021-03-30 10:33:18',NULL,'d4ce6b78-64ed-4da3-bbc3-e1e3cb199cb7'),(4,NULL,'2021-03-30 10:33:18','2021-03-30 10:33:18',NULL,'d2f82fe3-2c01-4fd8-94c1-3f883f452282'),(5,NULL,'2021-03-30 11:07:21','2021-03-30 11:07:21','2021-03-30 14:30:22','f50aa040-3874-4763-a501-f40b04477240'),(6,NULL,'2021-03-30 11:07:21','2021-03-30 11:07:21','2021-03-30 14:30:22','d71da807-1e57-4f33-8089-90fa82b6d35b'),(7,NULL,'2021-03-30 11:07:22','2021-03-30 11:07:22',NULL,'3d6b9108-7746-4d1a-876e-05cf72352a44'),(8,NULL,'2021-03-30 11:07:22','2021-03-30 11:07:22',NULL,'bd047094-a9c6-4a61-9ad0-037508f3d292'),(9,NULL,'2021-03-30 11:07:50','2021-03-30 11:07:50','2021-03-30 14:30:19','21591c9d-4153-4e34-bc4a-e44e9853083b'),(10,NULL,'2021-03-30 11:07:50','2021-03-30 11:07:50','2021-03-30 14:30:19','49aa7041-e417-4bcb-964c-e01e2c0406ca'),(11,NULL,'2021-03-30 11:07:51','2021-03-30 11:07:51',NULL,'382b11ce-e067-4a1e-8471-a1b73f3d78ac'),(12,NULL,'2021-03-30 11:07:51','2021-03-30 11:07:51',NULL,'ae2606a2-5287-4ad7-9ad9-2a1a19f818fb'),(13,NULL,'2021-03-30 11:09:09','2021-03-30 11:09:09',NULL,'c2fc1870-82bf-4007-8ee9-a1f9894675d4'),(14,NULL,'2021-03-30 11:09:09','2021-03-30 11:09:09',NULL,'271c4759-b99a-45b3-bad6-5d5f72730538'),(15,NULL,'2021-03-30 11:09:30','2021-03-30 11:09:30',NULL,'6835bfa2-d401-44e1-95c7-9034b040d527'),(16,NULL,'2021-03-30 11:09:30','2021-03-30 11:09:30',NULL,'845b3f10-88fa-4484-b59b-b84951a8f7ff'),(17,NULL,'2021-03-30 11:09:57','2021-03-30 11:09:57',NULL,'10b56caa-98ee-43de-ad3d-9fcf69e413a4'),(18,NULL,'2021-03-30 11:09:57','2021-03-30 11:09:57',NULL,'6254036c-03ac-4ed1-85e6-57c2ffa76723'),(19,NULL,'2021-03-30 11:10:04','2021-03-30 11:10:04',NULL,'c00600f6-142c-42fe-83d2-ce6803e57ede'),(20,NULL,'2021-03-30 11:10:04','2021-03-30 11:10:04',NULL,'49b0612a-93d4-4690-9088-04f86dd62cf6'),(21,NULL,'2021-03-30 11:13:52','2021-03-30 11:13:52','2021-03-30 14:28:25','56a5943d-02e9-49e2-af01-013e03924375'),(22,NULL,'2021-03-30 14:30:04','2021-03-30 14:30:04','2021-03-30 14:58:55','dc3e8e18-3c34-4fac-9d5b-a163dea86697'),(23,NULL,'2021-03-30 14:30:04','2021-03-30 14:30:04','2021-03-30 14:58:55','d29414fa-f296-4cbd-bffa-f4631c12b3d3'),(24,NULL,'2021-03-30 14:30:19','2021-03-30 14:30:19',NULL,'cb07f217-04a0-4b56-9532-db789f3a4d01'),(25,NULL,'2021-03-30 14:30:19','2021-03-30 14:30:19',NULL,'2134a994-950b-418a-9766-7bfa09858ead'),(26,NULL,'2021-03-30 14:30:22','2021-03-30 14:30:22',NULL,'813e3df1-aaa9-4c08-a3f2-7fed33e14406'),(27,NULL,'2021-03-30 14:30:22','2021-03-30 14:30:22',NULL,'f3446965-e47e-4c58-a084-2c865d3d401b'),(28,NULL,'2021-03-30 14:58:55','2021-03-30 14:58:55',NULL,'c8d42b1b-2658-471c-af7d-4e2515b0e667'),(29,NULL,'2021-03-30 14:58:55','2021-03-30 14:58:55','2021-04-06 16:08:17','bdd797b9-5b8d-4fb0-a7bb-cd9bd7a0d465'),(30,NULL,'2021-03-30 14:58:57','2021-03-30 14:58:57',NULL,'eb76fd60-8a04-4de7-bd5f-2ab26bb15843'),(31,NULL,'2021-03-30 14:58:57','2021-03-30 14:58:57',NULL,'c12f8207-f9cf-40b2-ac85-2b635cf48bb8'),(32,NULL,'2021-03-30 15:00:18','2021-03-30 15:00:18',NULL,'ca5bca1c-8a49-46a4-b889-8f5497bae506'),(33,NULL,'2021-03-30 15:00:18','2021-03-30 15:00:18',NULL,'af9a5396-fe37-4fb6-9237-5cd0a7ed771e'),(34,NULL,'2021-03-31 11:33:02','2021-03-31 11:33:02',NULL,'d065cc45-fa7a-41c7-a5dc-952c71cf68ec'),(35,NULL,'2021-03-31 11:33:02','2021-03-31 11:33:02',NULL,'b068f94c-4273-47d4-aaa0-a4740f4e0978'),(36,NULL,'2021-03-31 11:33:05','2021-03-31 11:33:05',NULL,'c6c65eb8-f4ee-423d-9793-fb5ad2d0fbdf'),(37,NULL,'2021-03-31 11:33:05','2021-03-31 11:33:05',NULL,'ad58b5b7-7d2a-4939-b22e-a79b927e5ebf'),(38,NULL,'2021-03-31 11:33:39','2021-03-31 11:33:39',NULL,'19972d6b-d4c8-4561-8413-ecf1b30fdcf2'),(39,NULL,'2021-03-31 11:33:39','2021-03-31 11:33:39','2021-04-06 15:56:14','56d068a8-596e-43d7-8cc5-ab18a4ef8538'),(40,NULL,'2021-03-31 11:33:41','2021-03-31 11:33:41',NULL,'6356a08b-d31c-496f-958d-e024622a1d92'),(41,NULL,'2021-03-31 11:33:41','2021-03-31 11:33:41',NULL,'6eff6085-71c2-47f7-b48d-49698d27a5ef'),(42,NULL,'2021-03-31 11:34:47','2021-03-31 11:34:47',NULL,'0d7a0191-8c68-4d03-8b72-d802357c02cc'),(43,NULL,'2021-03-31 11:34:48','2021-03-31 11:34:48',NULL,'fbdc6160-1ba3-40bd-bc83-5eea28bb0072'),(44,NULL,'2021-03-31 11:34:49','2021-03-31 11:34:49',NULL,'a43df8e0-c184-405a-b198-621031d47ec6'),(45,NULL,'2021-03-31 11:34:50','2021-03-31 11:34:50',NULL,'2e7def22-9313-4b2f-b525-56f076a641d9'),(46,NULL,'2021-03-31 11:37:11','2021-03-31 11:37:11',NULL,'a7557cc5-d262-4681-9269-d6275d98085c'),(47,NULL,'2021-03-31 11:37:58','2021-03-31 11:37:58',NULL,'e80740e1-644b-4f00-b82f-2ee588657483'),(48,NULL,'2021-03-31 11:43:51','2021-03-31 11:43:51',NULL,'781b7ce5-e5a8-42cf-aa1d-ae184e09766c'),(49,NULL,'2021-03-31 11:43:51','2021-03-31 11:43:51',NULL,'70d10912-3a6a-4a7d-aa57-81cde46eb2b5'),(50,NULL,'2021-04-06 15:37:51','2021-04-06 15:37:51',NULL,'fdfacd6e-22b1-459e-a509-6e0db0b5b645'),(51,NULL,'2021-04-06 15:56:14','2021-04-06 15:56:14',NULL,'be33fc5d-5708-413b-b550-1f691418adab'),(52,NULL,'2021-04-06 15:56:16','2021-04-06 15:56:16',NULL,'276a157c-9faf-4bad-837b-74f58b6ca0ba'),(53,NULL,'2021-04-06 15:56:16','2021-04-06 15:56:16',NULL,'bd3ade34-61a3-4f05-91a6-d33852cc05f3'),(54,NULL,'2021-04-06 16:08:17','2021-04-06 16:08:17','2021-04-07 08:25:58','d9cdc06f-9b7f-4cd1-8b81-161aef912697'),(55,NULL,'2021-04-06 16:08:18','2021-04-06 16:08:18',NULL,'f1c38cd4-aafc-4efd-af2d-76b2ecae823d'),(56,NULL,'2021-04-06 16:08:18','2021-04-06 16:08:18',NULL,'0f257195-e818-46fa-9ade-35f454906e0b'),(57,NULL,'2021-04-07 08:25:58','2021-04-07 08:25:58','2021-04-07 08:54:20','5dc26072-315f-4f3d-9bfa-e69c97d679ac'),(58,NULL,'2021-04-07 08:26:00','2021-04-07 08:26:00',NULL,'1f467dff-0089-4f01-94ba-cdd397aac5b1'),(59,NULL,'2021-04-07 08:26:00','2021-04-07 08:26:00',NULL,'b4f94c47-4cf3-411f-9d33-8ff0cf5391d0'),(60,NULL,'2021-04-07 08:54:20','2021-04-07 08:54:20','2021-04-07 09:55:25','5053ae9b-f0d1-4a80-b269-7e8f459856f4'),(61,NULL,'2021-04-07 08:54:22','2021-04-07 08:54:22',NULL,'d80259fe-2a70-43c0-9290-bf889d1972d5'),(62,NULL,'2021-04-07 08:54:22','2021-04-07 08:54:22',NULL,'5c378708-1e7f-4053-8df1-ce04475cc4c5'),(63,NULL,'2021-04-07 09:24:35','2021-04-07 09:24:35',NULL,'ac22bdf0-9aa5-44eb-9598-61e6426e6b6f'),(64,NULL,'2021-04-07 09:24:35','2021-04-07 09:24:35',NULL,'b65d1970-6047-4256-a7ec-feb6a01a967b'),(65,NULL,'2021-04-07 09:31:21','2021-04-07 09:31:21',NULL,'4afe93ff-c438-4a84-ba70-9b74bfd7703e'),(66,NULL,'2021-04-07 09:31:21','2021-04-07 09:31:21',NULL,'2d381d9a-e0ad-4c52-8397-e302af57c2c7'),(67,NULL,'2021-04-07 09:42:17','2021-04-07 09:42:17',NULL,'43e9931c-5de0-4513-9391-2c11fdcdc0de'),(68,NULL,'2021-04-07 09:42:17','2021-04-07 09:42:17',NULL,'e1ad8db6-991a-4885-9ac4-2ebd6affce7e'),(69,NULL,'2021-04-07 09:55:25','2021-04-07 09:55:25',NULL,'c7df7597-b2cb-4c0f-8f20-c8ee8c4075bf'),(70,NULL,'2021-04-07 09:55:28','2021-04-07 09:55:28',NULL,'0714f604-2430-407d-8380-c1bcd0e5450d'),(71,NULL,'2021-04-07 09:55:28','2021-04-07 09:55:28',NULL,'a8ca39f8-5dcd-4321-bce5-f68b4c4e8d8d');
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `supertableblocks`
--

LOCK TABLES `supertableblocks` WRITE;
/*!40000 ALTER TABLE `supertableblocks` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `supertableblocks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `supertableblocktypes`
--

LOCK TABLES `supertableblocktypes` WRITE;
/*!40000 ALTER TABLE `supertableblocktypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `supertableblocktypes` VALUES (1,4,1,'2021-03-30 09:30:23','2021-03-30 09:30:23','dfd34224-0241-4c43-aec4-0c7abd7e9dab');
/*!40000 ALTER TABLE `supertableblocktypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `systemmessages`
--

LOCK TABLES `systemmessages` WRITE;
/*!40000 ALTER TABLE `systemmessages` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `systemmessages` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `taggroups`
--

LOCK TABLES `taggroups` WRITE;
/*!40000 ALTER TABLE `taggroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `taggroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups`
--

LOCK TABLES `usergroups` WRITE;
/*!40000 ALTER TABLE `usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `usergroups_users`
--

LOCK TABLES `usergroups_users` WRITE;
/*!40000 ALTER TABLE `usergroups_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `usergroups_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions`
--

LOCK TABLES `userpermissions` WRITE;
/*!40000 ALTER TABLE `userpermissions` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_usergroups`
--

LOCK TABLES `userpermissions_usergroups` WRITE;
/*!40000 ALTER TABLE `userpermissions_usergroups` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_usergroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpermissions_users`
--

LOCK TABLES `userpermissions_users` WRITE;
/*!40000 ALTER TABLE `userpermissions_users` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `userpermissions_users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `userpreferences`
--

LOCK TABLES `userpreferences` WRITE;
/*!40000 ALTER TABLE `userpreferences` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `userpreferences` VALUES (1,'{\"language\":\"en-GB\",\"locale\":null,\"weekStartDay\":\"1\",\"useShapes\":false,\"underlineLinks\":false,\"showFieldHandles\":false,\"enableDebugToolbarForSite\":false,\"enableDebugToolbarForCp\":false,\"showExceptionView\":false,\"profileTemplates\":false}');
/*!40000 ALTER TABLE `userpreferences` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `users` VALUES (1,'Admin',NULL,'','','dev@fortytwo.studio','$2y$13$3Zv9sh4HRXyqD1tNq/gmoegINdaet8OFyxoyZBbIXMV5yBALD7J0q',1,0,0,0,'2021-04-07 08:18:41',NULL,NULL,NULL,'2021-03-30 14:46:59',NULL,1,NULL,NULL,NULL,0,'2021-03-30 14:54:18','2021-03-30 09:20:12','2021-04-07 08:18:41','e35059a4-d1ca-4c44-9793-7ff136cc1bfc');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumefolders`
--

LOCK TABLES `volumefolders` WRITE;
/*!40000 ALTER TABLE `volumefolders` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumefolders` VALUES (1,NULL,NULL,'Temporary source',NULL,'2021-03-30 11:13:40','2021-03-30 11:13:40','e02ac041-fd96-4ca7-a253-1b34905197ba'),(2,1,NULL,'user_1','user_1/','2021-03-30 11:13:40','2021-03-30 11:13:40','5e966a34-1de5-437c-9550-a83a9de77d4b'),(3,NULL,1,'S3','','2021-03-30 11:43:14','2021-03-30 11:43:14','b300cea7-4e2d-4104-97b8-a4957cde6309');
/*!40000 ALTER TABLE `volumefolders` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `volumes`
--

LOCK TABLES `volumes` WRITE;
/*!40000 ALTER TABLE `volumes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `volumes` VALUES (1,9,'S3','s3','craft\\awss3\\Volume',1,'https://s3.eu-west-1.amazonaws.com/assets.futureforestry.co.uk/','site',NULL,'{\"addSubfolderToRootUrl\":\"1\",\"autoFocalPoint\":\"\",\"bucket\":\"assets.futureforestry.co.uk\",\"bucketSelectionMode\":\"choose\",\"cfDistributionId\":\"\",\"cfPrefix\":\"\",\"expires\":\"\",\"keyId\":\"$S3_KEY_ID\",\"makeUploadsPublic\":\"1\",\"region\":\"eu-west-1\",\"secret\":\"$S3_SECRET\",\"storageClass\":\"\",\"subfolder\":\"\"}',1,'2021-03-30 11:43:14','2021-03-30 11:43:14','2021-03-30 14:31:52','27b00051-5d7e-4c72-8d4c-37eb325f3071');
/*!40000 ALTER TABLE `volumes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `widgets` VALUES (1,1,'craft\\widgets\\RecentEntries',1,NULL,'{\"siteId\":1,\"section\":\"*\",\"limit\":10}',1,'2021-03-30 09:20:14','2021-03-30 09:20:14','b63215ee-6755-4afc-bf1d-ee3797f99416'),(2,1,'craft\\widgets\\CraftSupport',2,NULL,'[]',1,'2021-03-30 09:20:14','2021-03-30 09:20:14','ecc89f17-0923-4471-a026-91b0e94a7a33'),(3,1,'craft\\widgets\\Updates',3,NULL,'[]',1,'2021-03-30 09:20:14','2021-03-30 09:20:14','e9df066d-9435-43da-9872-97701316f68a'),(4,1,'craft\\widgets\\Feed',4,NULL,'{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}',1,'2021-03-30 09:20:14','2021-03-30 09:20:14','de414b70-2818-4fd9-8430-8bad8985de62');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping routines for database 'boilerplate'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-07 11:13:53
