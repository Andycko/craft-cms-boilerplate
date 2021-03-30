-- MySQL dump 10.13  Distrib 5.7.26, for osx10.10 (x86_64)
--
-- Host: localhost    Database: craftcms_boilerplate
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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
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
-- Dumping routines for database 'craftcms_boilerplate'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-30 16:52:10
-- MySQL dump 10.13  Distrib 5.7.26, for osx10.10 (x86_64)
--
-- Host: localhost    Database: craftcms_boilerplate
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
INSERT INTO `changedattributes` VALUES (1,1,'firstName','2021-03-30 14:29:15',0,1),(1,1,'lastName','2021-03-30 14:29:15',0,1),(1,1,'lastPasswordChangeDate','2021-03-30 14:54:18',0,1),(1,1,'password','2021-03-30 14:54:18',0,1);
/*!40000 ALTER TABLE `changedattributes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `changedfields`
--

LOCK TABLES `changedfields` WRITE;
/*!40000 ALTER TABLE `changedfields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `changedfields` VALUES (3,1,12,'2021-03-30 10:33:15',0,1),(3,1,17,'2021-03-30 15:00:15',0,1),(3,1,18,'2021-03-30 15:00:15',0,1),(14,1,12,'2021-03-30 11:07:50',0,1),(14,1,17,'2021-03-30 11:07:50',0,1),(14,1,18,'2021-03-30 11:07:50',0,1),(17,1,12,'2021-03-30 11:07:21',0,1),(17,1,17,'2021-03-30 11:07:21',0,1),(17,1,18,'2021-03-30 11:07:21',0,1);
/*!40000 ALTER TABLE `changedfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `content` VALUES (1,1,1,NULL,'2021-03-30 09:20:10','2021-03-30 14:54:16','059cf906-eede-4bc3-a138-0badc14970ec',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,2,1,NULL,'2021-03-30 09:31:09','2021-03-30 09:31:09','24b982c0-4544-4d1b-8638-6c121774bc50',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,3,1,'Homepage','2021-03-30 09:38:29','2021-03-30 15:00:14','48c6866e-f1f0-409e-bf73-e8cb0d2fe8ec',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":{\"1\":\"Homepage\"},\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Homepage - Future Forestry\",\"imageId\":\"\",\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Homepage - Future Forestry\",\"imageId\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":\"\"}}',NULL,NULL,NULL,NULL),(4,4,1,'Homepage','2021-03-30 09:38:29','2021-03-30 09:38:29','532cc3b3-0fe3-4222-a4e5-334e78081ebf',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,5,1,'Homepage','2021-03-30 09:38:52','2021-03-30 09:38:52','3e46bab1-66ec-4a92-85d2-f10ffaa274dd',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":[],\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"neutral\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Homepage - Future Forestry\",\"imageId\":null,\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Homepage - Future Forestry\",\"imageId\":null,\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":null}}',NULL,NULL,NULL,NULL),(6,6,1,'Homepage','2021-03-30 10:13:09','2021-03-30 10:13:09','07695502-b576-4681-ac5d-2d60ba17ad53',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":[],\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"neutral\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Homepage - Future Forestry\",\"imageId\":null,\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Homepage - Future Forestry\",\"imageId\":null,\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":null}}',NULL,NULL,NULL,NULL),(7,7,1,NULL,'2021-03-30 10:33:15','2021-03-30 10:33:15','824d6e50-eca5-4e17-9f55-4786f49951fa',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Lorem Ipsum dolor sit amet...</p>','This is the main header',NULL),(8,8,1,NULL,'2021-03-30 10:33:15','2021-03-30 10:33:15','995c8b1f-3cdd-45f2-a063-e56cb22c5e18',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Some random copy</p>',NULL,NULL),(9,9,1,NULL,'2021-03-30 10:33:15','2021-03-30 10:33:15','e65f5409-e96b-4ef9-bf44-0fa770beeaff',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,NULL,NULL),(10,10,1,'Homepage','2021-03-30 10:33:15','2021-03-30 10:33:15','525cf901-2a8a-4a32-b98b-816a77b6e879',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":{\"1\":\"Homepage\"},\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Homepage - Future Forestry\",\"imageId\":\"\",\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Homepage - Future Forestry\",\"imageId\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":\"\"}}',NULL,NULL,NULL,NULL),(11,11,1,NULL,'2021-03-30 10:33:15','2021-03-30 10:33:15','58d6103f-2285-45cf-bf4b-27cc43debc3a',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Lorem Ipsum dolor sit amet...</p>','This is the main header',NULL),(12,12,1,NULL,'2021-03-30 10:33:15','2021-03-30 10:33:15','d9930864-e3f7-4f9f-952d-7f939dff1495',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Some random copy</p>',NULL,NULL),(13,13,1,NULL,'2021-03-30 10:33:15','2021-03-30 10:33:15','409b8ac9-4bdd-4d02-b829-2abd96c73de1',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,NULL,NULL),(14,14,1,'About us','2021-03-30 11:04:36','2021-03-30 11:09:56','7c0b3f90-0708-4fda-aa64-bbe57cb4ceb0',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":{\"1\":\"About us\"},\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"About us - Future Forestry\",\"imageId\":\"\",\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"About us - Future Forestry\",\"imageId\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":\"\"}}',NULL,NULL,NULL,NULL),(15,15,1,'About us','2021-03-30 11:04:36','2021-03-30 11:04:36','45400b45-9692-4e8c-af1a-6ad8aafd6085',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(16,16,1,'About us','2021-03-30 11:05:00','2021-03-30 11:05:00','34149107-6901-4aed-a5e5-0a558476018c',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":[],\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"neutral\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"About us - Future Forestry\",\"imageId\":null,\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"About us - Future Forestry\",\"imageId\":null,\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":null}}',NULL,NULL,NULL,NULL),(17,17,1,'Contact','2021-03-30 11:05:32','2021-03-30 11:10:02','8f7165fc-0ae9-4c76-b6f8-6163e643872c',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":{\"1\":\"Contact\"},\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Contact - Future Forestry\",\"imageId\":\"\",\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Contact - Future Forestry\",\"imageId\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":\"\"}}',NULL,NULL,NULL,NULL),(18,18,1,'Contact','2021-03-30 11:05:32','2021-03-30 11:05:32','8cf056af-3855-4726-86fe-51640da4d399',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(19,19,1,'Contact','2021-03-30 11:06:23','2021-03-30 11:06:23','9fcfcc19-b5af-4503-b002-eafcac42cf34',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":[],\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"neutral\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Contact - Future Forestry\",\"imageId\":null,\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Contact - Future Forestry\",\"imageId\":null,\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":null}}',NULL,NULL,NULL,NULL),(20,20,1,NULL,'2021-03-30 11:07:21','2021-03-30 11:07:21','ece25f30-7ce7-4661-a7aa-a32222e4eb95',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Lorem ipsum dolor sit amet ...</p>','Hi, this is the Contact page',NULL),(21,21,1,NULL,'2021-03-30 11:07:21','2021-03-30 11:07:21','3caa5cb1-4f73-4521-a807-4399af7b70e5',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,NULL,NULL),(22,22,1,'Contact','2021-03-30 11:07:21','2021-03-30 11:07:21','37d3ec6f-0e45-4f0d-ac34-9cce280bfdf8',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":{\"1\":\"Contact\"},\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Contact - Future Forestry\",\"imageId\":\"\",\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Contact - Future Forestry\",\"imageId\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":\"\"}}',NULL,NULL,NULL,NULL),(23,23,1,NULL,'2021-03-30 11:07:21','2021-03-30 11:07:21','c2f8a24a-b457-4d67-8322-cea0c87352e0',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Lorem ipsum dolor sit amet ...</p>','Hi, this is the Contact page',NULL),(24,24,1,NULL,'2021-03-30 11:07:21','2021-03-30 11:07:21','fb99cf12-4828-41ab-9abf-9c50f1b9fdb1',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,NULL,NULL),(25,25,1,NULL,'2021-03-30 11:07:50','2021-03-30 11:07:50','f4480c5d-1f7d-4684-8055-8ee2f3c05429',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Lorem ipsum dolor sit amet ...</p>','Hi this is the About us page',NULL),(26,26,1,NULL,'2021-03-30 11:07:50','2021-03-30 11:07:50','af4d4561-7e70-4d69-b999-f65b6c2d4798',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,NULL,NULL),(27,27,1,'About us','2021-03-30 11:07:50','2021-03-30 11:07:50','eca978c8-b729-4244-9602-6a9c71211b50',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":{\"1\":\"About us\"},\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"About us - Future Forestry\",\"imageId\":\"\",\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"About us - Future Forestry\",\"imageId\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":\"\"}}',NULL,NULL,NULL,NULL),(28,28,1,NULL,'2021-03-30 11:07:50','2021-03-30 11:07:50','3edf1e5f-74bb-4c69-84b3-15854e41c79b',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Lorem ipsum dolor sit amet ...</p>','Hi this is the About us page',NULL),(29,29,1,NULL,'2021-03-30 11:07:50','2021-03-30 11:07:50','6df7bafd-960b-4d2b-b338-64be41b07af7',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,NULL,NULL),(30,30,1,'About us','2021-03-30 11:09:07','2021-03-30 11:09:07','20613e9f-1dee-4fbf-8862-ea9bea0cf5a7',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":{\"1\":\"About us\"},\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"About us - Future Forestry\",\"imageId\":\"\",\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"About us - Future Forestry\",\"imageId\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":\"\"}}',NULL,NULL,NULL,NULL),(31,31,1,NULL,'2021-03-30 11:09:07','2021-03-30 11:09:07','d38604f8-9a5f-4bdf-94e6-e4966f308cf4',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Lorem ipsum dolor sit amet ...</p>','Hi this is the About us page',NULL),(32,32,1,NULL,'2021-03-30 11:09:07','2021-03-30 11:09:07','31c832a4-bec0-4f6a-997d-0af789b7dc0f',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,NULL,NULL),(33,33,1,'Contact','2021-03-30 11:09:29','2021-03-30 11:09:29','7d0bfdd2-3d4a-4c22-adb3-bd78557072b1',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":{\"1\":\"Contact\"},\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Contact - Future Forestry\",\"imageId\":\"\",\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Contact - Future Forestry\",\"imageId\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":\"\"}}',NULL,NULL,NULL,NULL),(34,34,1,NULL,'2021-03-30 11:09:29','2021-03-30 11:09:29','546e0f61-5633-4753-b16e-32e8082a8976',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Lorem ipsum dolor sit amet ...</p>','Hi, this is the Contact page',NULL),(35,35,1,NULL,'2021-03-30 11:09:29','2021-03-30 11:09:29','c6e91cb1-1cc5-4f1a-9439-f0ff54b6b56f',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,NULL,NULL),(36,36,1,'About us','2021-03-30 11:09:56','2021-03-30 11:09:56','9e3b1db8-6388-45cc-9318-8291c2bf29b6',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":{\"1\":\"About us\"},\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"About us - Future Forestry\",\"imageId\":\"\",\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"About us - Future Forestry\",\"imageId\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":\"\"}}',NULL,NULL,NULL,NULL),(37,37,1,NULL,'2021-03-30 11:09:56','2021-03-30 11:09:56','3ba0ecea-746d-4041-844a-11d10426353c',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Lorem ipsum dolor sit amet ...</p>','Hi this is the About us page',NULL),(38,38,1,NULL,'2021-03-30 11:09:56','2021-03-30 11:09:56','ea838449-31d9-4b89-b537-b7ab0ab6deab',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,NULL,NULL),(39,39,1,'Contact','2021-03-30 11:10:02','2021-03-30 11:10:02','1faa7e64-9567-4a18-9ae4-c34624f923f7',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":{\"1\":\"Contact\"},\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Contact - Future Forestry\",\"imageId\":\"\",\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Contact - Future Forestry\",\"imageId\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":\"\"}}',NULL,NULL,NULL,NULL),(40,40,1,NULL,'2021-03-30 11:10:02','2021-03-30 11:10:02','c7570e88-af96-4ca4-99fc-5ce9d36364f5',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Lorem ipsum dolor sit amet ...</p>','Hi, this is the Contact page',NULL),(41,41,1,NULL,'2021-03-30 11:10:02','2021-03-30 11:10:02','46d6b854-212c-4653-9977-749619886e5e',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,NULL,NULL),(42,42,1,'About us','2021-03-30 11:14:00','2021-03-30 11:14:00','4abf7390-9987-440b-88cc-7273dea8f1ad',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(43,43,1,'Contact','2021-03-30 11:14:00','2021-03-30 11:14:00','e93068c3-4b75-4bc0-9bc4-eb900c119e5c',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(44,44,1,'Homepage','2021-03-30 11:14:00','2021-03-30 11:14:00','8e54656d-0373-471d-ae5f-bd5baeab3c02',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(45,45,1,NULL,'2021-03-30 13:16:05','2021-03-30 13:16:05','0aac892d-a1ef-4ccb-9406-c8c0d0ed811f',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(46,46,1,'2021-03-30 06:47:51','2021-03-30 13:47:51','2021-03-30 13:47:51','48c9ad55-68e6-454c-89ce-6b54f19f3d18',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(47,47,1,'2021-03-30 06:53:33','2021-03-30 13:53:33','2021-03-30 13:53:33','a4369b28-e55e-4d65-8491-2ed04f5a6467',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(48,48,1,'2021-03-30 06:54:15','2021-03-30 13:54:15','2021-03-30 13:54:15','3967c8ae-8fcc-400f-9c8a-450ef5cc42eb',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(49,49,1,'Homepage','2021-03-30 14:30:04','2021-03-30 14:30:04','38f886d0-d761-483c-addb-2e4d2f2db481',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":{\"1\":\"Homepage\"},\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Homepage - Future Forestry\",\"imageId\":\"\",\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Homepage - Future Forestry\",\"imageId\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":\"\"}}',NULL,NULL,NULL,NULL),(50,50,1,NULL,'2021-03-30 14:58:55','2021-03-30 15:00:14','348ffa36-efb1-4b58-af02-6d5779873d05',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Edit this content in the Homepage single.</p>','Welcome to the homepage',NULL),(51,51,1,NULL,'2021-03-30 14:58:55','2021-03-30 15:00:14','f52100b5-7eef-4410-a4ec-5137fb0cc2a9',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac eros nibh. Aliquam erat volutpat. Aenean non sem sit amet massa efficitur pellentesque sit amet nec turpis. Maecenas ornare nibh id consequat vestibulum. Quisque eu sem a massa fringilla varius. Duis nec felis porta, consectetur augue sit amet, porta est. Morbi imperdiet justo mi, ut aliquet diam bibendum eu. Etiam id enim non sem sollicitudin ultrices vel in purus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed at nisi rutrum, sollicitudin tellus vel, eleifend velit. Praesent sed molestie dolor.</p>',NULL,NULL),(52,52,1,NULL,'2021-03-30 14:58:55','2021-03-30 14:58:55','53650b38-92b1-41e2-b00c-a7944b15058e',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,NULL,NULL),(53,53,1,'Homepage','2021-03-30 14:58:55','2021-03-30 14:58:55','a080b93a-88fb-46bc-abe6-045dfb4bbf74',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":{\"1\":\"Homepage\"},\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Homepage - Future Forestry\",\"imageId\":\"\",\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Homepage - Future Forestry\",\"imageId\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":\"\"}}',NULL,NULL,NULL,NULL),(54,54,1,NULL,'2021-03-30 14:58:55','2021-03-30 14:58:55','c12ff4ef-9650-4f81-972b-b586fbbfb7cd',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Hi, I\'m a copy in the header</p>','Hi, I\'m a title in the header.',NULL),(55,55,1,NULL,'2021-03-30 14:58:55','2021-03-30 14:58:55','8737fb0f-356d-4252-a542-b8fe89649c8d',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Hi, I\'m a copy block.</p>',NULL,NULL),(56,56,1,NULL,'2021-03-30 14:58:55','2021-03-30 14:58:55','a44e6c9f-80f8-46df-b95a-c3a1fff198f8',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,NULL,NULL),(57,57,1,'Homepage','2021-03-30 15:00:15','2021-03-30 15:00:15','165e881b-30c2-4ba8-be36-454884be7f64',NULL,NULL,NULL,NULL,NULL,NULL,'{\"titleRaw\":{\"1\":\"Homepage\"},\"descriptionRaw\":\"\",\"keywords\":[],\"score\":\"\",\"social\":{\"twitter\":{\"handle\":null,\"title\":\"Homepage - Future Forestry\",\"imageId\":\"\",\"description\":\"\"},\"facebook\":{\"handle\":null,\"title\":\"Homepage - Future Forestry\",\"imageId\":\"\",\"description\":\"\"}},\"advanced\":{\"robots\":[],\"canonical\":\"\"}}',NULL,NULL,NULL,NULL),(58,58,1,NULL,'2021-03-30 15:00:15','2021-03-30 15:00:15','72e059dd-b5ff-46c4-b264-9e56237a58c9',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Edit this content in the Homepage single.</p>','Welcome to the homepage',NULL),(59,59,1,NULL,'2021-03-30 15:00:15','2021-03-30 15:00:15','e7041874-6c7e-47d5-a86f-508454bf3eec',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce ac eros nibh. Aliquam erat volutpat. Aenean non sem sit amet massa efficitur pellentesque sit amet nec turpis. Maecenas ornare nibh id consequat vestibulum. Quisque eu sem a massa fringilla varius. Duis nec felis porta, consectetur augue sit amet, porta est. Morbi imperdiet justo mi, ut aliquet diam bibendum eu. Etiam id enim non sem sollicitudin ultrices vel in purus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed at nisi rutrum, sollicitudin tellus vel, eleifend velit. Praesent sed molestie dolor.</p>',NULL,NULL),(60,60,1,NULL,'2021-03-30 15:00:15','2021-03-30 15:00:15','8573406a-81f8-4445-b739-d9aa8f61e4f7',NULL,NULL,NULL,'bg-white','pt-default','pb-default',NULL,NULL,NULL,NULL,NULL);
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
INSERT INTO `elements` VALUES (1,NULL,NULL,NULL,'craft\\elements\\User',1,0,'2021-03-30 09:20:10','2021-03-30 14:54:16',NULL,'841f42bf-e78d-4e7d-8e5c-20454f6f2201'),(2,NULL,NULL,2,'craft\\elements\\GlobalSet',1,0,'2021-03-30 09:31:09','2021-03-30 09:31:09',NULL,'f08ee490-251f-494f-9831-e67a836aa942'),(3,NULL,NULL,3,'craft\\elements\\Entry',1,0,'2021-03-30 09:38:29','2021-03-30 15:00:14',NULL,'093493de-84ad-4569-a7ca-1b1f74298f19'),(4,NULL,1,3,'craft\\elements\\Entry',1,0,'2021-03-30 09:38:29','2021-03-30 09:38:29',NULL,'833d4d6d-5d08-4a90-8643-cb21e5ce6701'),(5,NULL,2,3,'craft\\elements\\Entry',1,0,'2021-03-30 09:38:52','2021-03-30 09:38:52',NULL,'114734d1-ea16-4c88-af36-9dcaa5de1a57'),(6,NULL,3,3,'craft\\elements\\Entry',1,0,'2021-03-30 10:13:09','2021-03-30 10:13:09',NULL,'3e9cb845-4cc8-44b6-9640-66fc55ec77c0'),(7,NULL,NULL,6,'benf\\neo\\elements\\Block',1,0,'2021-03-30 10:33:15','2021-03-30 10:33:15','2021-03-30 14:30:03','53ec91c5-34b0-4caa-bb81-f73f7ce46d3e'),(8,NULL,NULL,4,'benf\\neo\\elements\\Block',1,0,'2021-03-30 10:33:15','2021-03-30 10:33:15','2021-03-30 14:30:04','03451c17-a315-4943-89be-eef00ab1c24a'),(9,NULL,NULL,5,'benf\\neo\\elements\\Block',1,0,'2021-03-30 10:33:15','2021-03-30 10:33:15','2021-03-30 14:30:04','3257d544-32f0-4657-a07e-39298e9e85d9'),(10,NULL,4,3,'craft\\elements\\Entry',1,0,'2021-03-30 10:33:15','2021-03-30 10:33:15',NULL,'3ab7d6b6-7ba4-46ad-8d4f-90e827ef5bb6'),(11,NULL,NULL,6,'benf\\neo\\elements\\Block',1,0,'2021-03-30 10:33:15','2021-03-30 10:33:15',NULL,'33a981dd-0bcc-427a-9513-0d38c4d81aab'),(12,NULL,NULL,4,'benf\\neo\\elements\\Block',1,0,'2021-03-30 10:33:15','2021-03-30 10:33:15',NULL,'e0e7378f-d52c-45b7-a0c9-d26c20896b1f'),(13,NULL,NULL,5,'benf\\neo\\elements\\Block',1,0,'2021-03-30 10:33:15','2021-03-30 10:33:15',NULL,'baf8b70d-f945-472d-be11-2816027c1504'),(14,NULL,NULL,7,'craft\\elements\\Entry',1,0,'2021-03-30 11:04:36','2021-03-30 11:09:56','2021-03-30 14:30:19','56222523-96f8-4544-bae7-20ead55bb15b'),(15,NULL,5,7,'craft\\elements\\Entry',1,0,'2021-03-30 11:04:36','2021-03-30 11:04:36','2021-03-30 14:30:19','99046eec-a793-4270-bb15-59a2f3e1d31f'),(16,NULL,6,7,'craft\\elements\\Entry',1,0,'2021-03-30 11:05:00','2021-03-30 11:05:00','2021-03-30 14:30:19','231e69e7-4d92-4b97-a774-392fc441e87e'),(17,NULL,NULL,8,'craft\\elements\\Entry',1,0,'2021-03-30 11:05:32','2021-03-30 11:10:02','2021-03-30 14:30:22','37b892b0-66c3-4490-8db9-f4b751e11dd0'),(18,NULL,7,8,'craft\\elements\\Entry',1,0,'2021-03-30 11:05:32','2021-03-30 11:05:32','2021-03-30 14:30:22','ace1cfc8-a7c8-4065-a2ba-69aaeb843c2e'),(19,NULL,8,8,'craft\\elements\\Entry',1,0,'2021-03-30 11:06:23','2021-03-30 11:06:23','2021-03-30 14:30:22','3ef44417-fd7c-4c16-ae7a-b74b8ea3305b'),(20,NULL,NULL,6,'benf\\neo\\elements\\Block',1,0,'2021-03-30 11:07:21','2021-03-30 11:07:21','2021-03-30 14:30:22','096998e5-7667-4cab-a3e9-a697cd9be12b'),(21,NULL,NULL,5,'benf\\neo\\elements\\Block',1,0,'2021-03-30 11:07:21','2021-03-30 11:07:21','2021-03-30 14:30:22','c309769f-95b0-49dd-8772-2a3a5d36548a'),(22,NULL,9,8,'craft\\elements\\Entry',1,0,'2021-03-30 11:07:21','2021-03-30 11:07:21','2021-03-30 14:30:22','6e187459-a2fb-43f0-bcfa-a7fabb3171bc'),(23,NULL,NULL,6,'benf\\neo\\elements\\Block',1,0,'2021-03-30 11:07:21','2021-03-30 11:07:21',NULL,'172bf3eb-6841-4957-a90f-ed14b5eae277'),(24,NULL,NULL,5,'benf\\neo\\elements\\Block',1,0,'2021-03-30 11:07:21','2021-03-30 11:07:21',NULL,'aba4a19f-5b81-47bd-84b1-ed97080f0238'),(25,NULL,NULL,6,'benf\\neo\\elements\\Block',1,0,'2021-03-30 11:07:50','2021-03-30 11:07:50','2021-03-30 14:30:19','e38294a9-7498-45d9-9271-b9ab27f0b216'),(26,NULL,NULL,5,'benf\\neo\\elements\\Block',1,0,'2021-03-30 11:07:50','2021-03-30 11:07:50','2021-03-30 14:30:19','0234229f-8577-4532-952b-42f5a923a4a2'),(27,NULL,10,7,'craft\\elements\\Entry',1,0,'2021-03-30 11:07:50','2021-03-30 11:07:50','2021-03-30 14:30:19','dab13f32-71f7-4baa-83d2-5d9440cddcc5'),(28,NULL,NULL,6,'benf\\neo\\elements\\Block',1,0,'2021-03-30 11:07:50','2021-03-30 11:07:50',NULL,'a3f74c1b-60ec-4a84-82d3-3a2578e8fc17'),(29,NULL,NULL,5,'benf\\neo\\elements\\Block',1,0,'2021-03-30 11:07:50','2021-03-30 11:07:50',NULL,'26da37a6-ed18-4a57-ab57-911a4137c44d'),(30,NULL,11,7,'craft\\elements\\Entry',1,0,'2021-03-30 11:09:07','2021-03-30 11:09:07','2021-03-30 14:30:19','f28df747-61a2-4093-b6b6-0b08a83bf468'),(31,NULL,NULL,6,'benf\\neo\\elements\\Block',1,0,'2021-03-30 11:09:07','2021-03-30 11:07:50',NULL,'e8f6fbfb-f62b-4f6a-96bc-33ca43fd889a'),(32,NULL,NULL,5,'benf\\neo\\elements\\Block',1,0,'2021-03-30 11:09:07','2021-03-30 11:07:50',NULL,'bd80cbc8-3d38-42d1-95f1-9543aa04e7d8'),(33,NULL,12,8,'craft\\elements\\Entry',1,0,'2021-03-30 11:09:29','2021-03-30 11:09:29','2021-03-30 14:30:22','db1589d4-f0ca-492c-a13b-a2ec890a4e7e'),(34,NULL,NULL,6,'benf\\neo\\elements\\Block',1,0,'2021-03-30 11:09:29','2021-03-30 11:07:21',NULL,'f46ad37b-cbe4-4edb-ba06-f58a6c2d05f5'),(35,NULL,NULL,5,'benf\\neo\\elements\\Block',1,0,'2021-03-30 11:09:29','2021-03-30 11:07:21',NULL,'921f963c-4745-4027-a9f5-ff5ed58fc278'),(36,NULL,13,7,'craft\\elements\\Entry',1,0,'2021-03-30 11:09:56','2021-03-30 11:09:56','2021-03-30 14:30:19','ba5d4245-c57a-478d-a9e0-ac68561743dd'),(37,NULL,NULL,6,'benf\\neo\\elements\\Block',1,0,'2021-03-30 11:09:56','2021-03-30 11:07:50',NULL,'ea580b5a-a710-4c2d-803a-e7cf3c98551e'),(38,NULL,NULL,5,'benf\\neo\\elements\\Block',1,0,'2021-03-30 11:09:56','2021-03-30 11:07:50',NULL,'79d2df55-be62-4991-bdec-60e9a6bae088'),(39,NULL,14,8,'craft\\elements\\Entry',1,0,'2021-03-30 11:10:02','2021-03-30 11:10:02','2021-03-30 14:30:22','b276598c-eb1b-41eb-b3d0-647d93bd2ab1'),(40,NULL,NULL,6,'benf\\neo\\elements\\Block',1,0,'2021-03-30 11:10:02','2021-03-30 11:07:21',NULL,'4b2f2572-2203-424d-a230-01dd4dd67087'),(41,NULL,NULL,5,'benf\\neo\\elements\\Block',1,0,'2021-03-30 11:10:02','2021-03-30 11:07:21',NULL,'b550d6c9-836d-4cc6-8d93-b787d8ad5113'),(42,NULL,NULL,NULL,'verbb\\navigation\\elements\\Node',1,0,'2021-03-30 11:14:00','2021-03-30 11:14:00','2021-03-30 14:28:25','d2a3006e-1fe2-4717-a52e-8bffe441b0cb'),(43,NULL,NULL,NULL,'verbb\\navigation\\elements\\Node',1,0,'2021-03-30 11:14:00','2021-03-30 11:14:00','2021-03-30 14:28:25','d1708f5a-716b-4344-9dfe-263689cc7733'),(44,NULL,NULL,NULL,'verbb\\navigation\\elements\\Node',1,0,'2021-03-30 11:14:00','2021-03-30 11:14:00','2021-03-30 14:28:25','1b06bf03-fe98-4ce5-a99c-0c464fe17e90'),(45,NULL,NULL,10,'craft\\elements\\GlobalSet',1,0,'2021-03-30 13:16:05','2021-03-30 13:16:05',NULL,'5ad54cb8-e9b5-495e-a5d0-26b66062cf7d'),(46,NULL,NULL,NULL,'Solspace\\Freeform\\Elements\\Submission',1,0,'2021-03-30 13:47:51','2021-03-30 13:47:51',NULL,'0ff2ad00-4cf3-4ccb-a028-8a727fa4335a'),(47,NULL,NULL,NULL,'Solspace\\Freeform\\Elements\\Submission',1,0,'2021-03-30 13:53:33','2021-03-30 13:53:33',NULL,'4a2de4e8-8ca8-4d35-8606-4cdb5e3cb917'),(48,NULL,NULL,NULL,'Solspace\\Freeform\\Elements\\Submission',1,0,'2021-03-30 13:54:15','2021-03-30 13:54:15',NULL,'f47330ec-1981-45ab-b350-35b6d6ab6644'),(49,NULL,15,3,'craft\\elements\\Entry',1,0,'2021-03-30 14:30:03','2021-03-30 14:30:03',NULL,'20f5502e-5ec5-464e-8604-f303fa03abaa'),(50,NULL,NULL,6,'benf\\neo\\elements\\Block',1,0,'2021-03-30 14:58:55','2021-03-30 15:00:14',NULL,'6013eceb-059d-4750-917c-d16d9327b3c0'),(51,NULL,NULL,4,'benf\\neo\\elements\\Block',1,0,'2021-03-30 14:58:55','2021-03-30 15:00:14',NULL,'502ffbdd-ca71-46e7-81cb-ece009cad567'),(52,NULL,NULL,5,'benf\\neo\\elements\\Block',1,0,'2021-03-30 14:58:55','2021-03-30 14:58:55',NULL,'97b17595-51d8-49a7-bd3d-bc5e7f096483'),(53,NULL,16,3,'craft\\elements\\Entry',1,0,'2021-03-30 14:58:55','2021-03-30 14:58:55',NULL,'40ed4f88-b23b-4118-8cb0-79c237042b9e'),(54,NULL,NULL,6,'benf\\neo\\elements\\Block',1,0,'2021-03-30 14:58:55','2021-03-30 14:58:55',NULL,'44a9747b-33c3-40c8-b1a7-7990ff48da1a'),(55,NULL,NULL,4,'benf\\neo\\elements\\Block',1,0,'2021-03-30 14:58:55','2021-03-30 14:58:55',NULL,'77eec295-b9c2-4a3a-b9fd-327171bf567c'),(56,NULL,NULL,5,'benf\\neo\\elements\\Block',1,0,'2021-03-30 14:58:55','2021-03-30 14:58:55',NULL,'d0ba2204-e58a-4182-a427-3b5ef75553e7'),(57,NULL,17,3,'craft\\elements\\Entry',1,0,'2021-03-30 15:00:14','2021-03-30 15:00:14',NULL,'07511b03-650f-4890-818c-3b54196f72b3'),(58,NULL,NULL,6,'benf\\neo\\elements\\Block',1,0,'2021-03-30 15:00:15','2021-03-30 15:00:14',NULL,'d03559c7-23ba-460b-8b16-ca19bad2da3a'),(59,NULL,NULL,4,'benf\\neo\\elements\\Block',1,0,'2021-03-30 15:00:15','2021-03-30 15:00:14',NULL,'8296b156-69b0-4e08-84f4-a7a7ea913fcc'),(60,NULL,NULL,5,'benf\\neo\\elements\\Block',1,0,'2021-03-30 15:00:15','2021-03-30 14:58:55',NULL,'47fc62b5-cb92-4b8b-8ff2-4451438f23d6');
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `elements_sites`
--

LOCK TABLES `elements_sites` WRITE;
/*!40000 ALTER TABLE `elements_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `elements_sites` VALUES (1,1,1,NULL,NULL,1,'2021-03-30 09:20:10','2021-03-30 09:20:10','d1806068-a6a1-4e87-85df-14244fbcbbf7'),(2,2,1,NULL,NULL,1,'2021-03-30 09:31:09','2021-03-30 09:31:09','3f718d54-5358-4886-8620-1b0391464b83'),(3,3,1,'homepage','__home__',1,'2021-03-30 09:38:29','2021-03-30 09:38:29','ad72fcf3-ed4f-4ef8-bd1c-1bf86d98df36'),(4,4,1,'homepage','__home__',1,'2021-03-30 09:38:29','2021-03-30 09:38:29','081a54ff-a869-4e2f-b56d-d7852cbff6ab'),(5,5,1,'homepage','__home__',1,'2021-03-30 09:38:52','2021-03-30 09:38:52','29b7db71-8555-4c06-ac8b-60cea527b66a'),(6,6,1,'homepage','__home__',1,'2021-03-30 10:13:09','2021-03-30 10:13:09','7f663328-b9ab-4aaf-ba91-e90629330468'),(7,7,1,NULL,NULL,1,'2021-03-30 10:33:15','2021-03-30 10:33:15','8e988d93-c5cb-4623-b097-fc163f1156e7'),(8,8,1,NULL,NULL,1,'2021-03-30 10:33:15','2021-03-30 10:33:15','4807df27-c549-4982-b36e-8e7a2db0d931'),(9,9,1,NULL,NULL,1,'2021-03-30 10:33:15','2021-03-30 10:33:15','8264a3c6-09fc-4838-8c5b-74923cf7a403'),(10,10,1,'homepage','__home__',1,'2021-03-30 10:33:15','2021-03-30 10:33:15','d66af7ba-07c2-468f-a5f7-299a4451848e'),(11,11,1,NULL,NULL,1,'2021-03-30 10:33:15','2021-03-30 10:33:15','6a178217-e945-4297-b49d-23265ecf9e5c'),(12,12,1,NULL,NULL,1,'2021-03-30 10:33:15','2021-03-30 10:33:15','181bfcca-ac5f-4fee-a51d-6f496639c129'),(13,13,1,NULL,NULL,1,'2021-03-30 10:33:15','2021-03-30 10:33:15','3a48efea-90f2-41c2-b19a-eb26289b1c9b'),(14,14,1,'about-us','about-us',1,'2021-03-30 11:04:36','2021-03-30 11:04:36','6e5900d4-bb18-4a5d-93e6-1f5c8239cca6'),(15,15,1,'about-us','about-us',1,'2021-03-30 11:04:36','2021-03-30 11:04:36','268f58a1-b09d-45b2-b9ae-9177a226df6d'),(16,16,1,'about-us','about-us',1,'2021-03-30 11:05:00','2021-03-30 11:05:00','98cf1f39-dabd-47cc-b105-470192a4ce30'),(17,17,1,'contact','contact',1,'2021-03-30 11:05:32','2021-03-30 11:05:32','88a84537-4a62-4e5a-be37-a0819d1fc31c'),(18,18,1,'contact','contact',1,'2021-03-30 11:05:32','2021-03-30 11:05:32','e4c35d95-f666-4780-8996-6798c7031b37'),(19,19,1,'contact','contact',1,'2021-03-30 11:06:23','2021-03-30 11:06:23','43c6f1c4-1a26-48b4-bd5e-b84905a51f95'),(20,20,1,NULL,NULL,1,'2021-03-30 11:07:21','2021-03-30 11:07:21','fb0e933a-1b09-47d3-a340-44c8dd5f1d55'),(21,21,1,NULL,NULL,1,'2021-03-30 11:07:21','2021-03-30 11:07:21','7b23e017-4512-41b3-bd05-e1297987af9d'),(22,22,1,'contact','contact',1,'2021-03-30 11:07:21','2021-03-30 11:07:21','2198d858-351b-4f47-9af7-caa25cd1241c'),(23,23,1,NULL,NULL,1,'2021-03-30 11:07:21','2021-03-30 11:07:21','e3f1360e-80ad-464b-8b42-fe4486a8b551'),(24,24,1,NULL,NULL,1,'2021-03-30 11:07:21','2021-03-30 11:07:21','7c39c9d9-15a2-4c77-add4-d4a376d4aa8d'),(25,25,1,NULL,NULL,1,'2021-03-30 11:07:50','2021-03-30 11:07:50','f8524872-2d75-4411-a73f-caaa9a7c7656'),(26,26,1,NULL,NULL,1,'2021-03-30 11:07:50','2021-03-30 11:07:50','80196839-6b32-4b60-8f27-95a5f6f5fa1a'),(27,27,1,'about-us','about-us',1,'2021-03-30 11:07:50','2021-03-30 11:07:50','716c0e55-7580-4662-8333-ef6d6eb93a3f'),(28,28,1,NULL,NULL,1,'2021-03-30 11:07:50','2021-03-30 11:07:50','e98383ee-0ddd-405f-9098-045db2399fd5'),(29,29,1,NULL,NULL,1,'2021-03-30 11:07:50','2021-03-30 11:07:50','93e01e16-a022-45f3-b719-4a49c5db8fb5'),(30,30,1,'about-us','about-us',1,'2021-03-30 11:09:07','2021-03-30 11:09:07','6943e783-2681-4f27-b951-651c520cf34b'),(31,31,1,NULL,NULL,1,'2021-03-30 11:09:07','2021-03-30 11:09:07','3a2e6ce4-8973-471f-b0bd-a7ffb8f32295'),(32,32,1,NULL,NULL,1,'2021-03-30 11:09:07','2021-03-30 11:09:07','588833b6-58e3-44b5-85c5-eefd4907b177'),(33,33,1,'contact','contact',1,'2021-03-30 11:09:29','2021-03-30 11:09:29','91f96c04-152d-4a8c-8fe4-93365a5b58c6'),(34,34,1,NULL,NULL,1,'2021-03-30 11:09:29','2021-03-30 11:09:29','7fa4dc35-670e-461e-954e-72f5f520bd75'),(35,35,1,NULL,NULL,1,'2021-03-30 11:09:29','2021-03-30 11:09:29','6c84366c-90ea-4a2a-bcbc-a7f9157aac4d'),(36,36,1,'about-us','about-us',1,'2021-03-30 11:09:56','2021-03-30 11:09:56','d3d8123d-1c05-4fd1-8b0d-f97e2e650884'),(37,37,1,NULL,NULL,1,'2021-03-30 11:09:56','2021-03-30 11:09:56','e3c7cf59-b828-40a5-bdf4-0694e5c01ac7'),(38,38,1,NULL,NULL,1,'2021-03-30 11:09:56','2021-03-30 11:09:56','d4aa1da6-d0ad-4c54-8fc8-5e6ebdfe1401'),(39,39,1,'contact','contact',1,'2021-03-30 11:10:02','2021-03-30 11:10:02','00c7055b-ec51-40b1-b58b-961808ee7235'),(40,40,1,NULL,NULL,1,'2021-03-30 11:10:02','2021-03-30 11:10:02','5d503763-e8e3-4650-b715-76137f3ab6d4'),(41,41,1,NULL,NULL,1,'2021-03-30 11:10:02','2021-03-30 11:10:02','d927c4fe-69f0-47ae-86c9-0f199e415d7a'),(42,42,1,'1',NULL,1,'2021-03-30 11:14:00','2021-03-30 11:14:00','949f4331-096d-4b53-a505-0d17806f7ce4'),(43,43,1,'1',NULL,1,'2021-03-30 11:14:00','2021-03-30 11:14:00','60c04166-6da6-436b-9f2f-bbafd75263fb'),(44,44,1,'1',NULL,1,'2021-03-30 11:14:00','2021-03-30 11:14:00','c935012e-bafd-4f8e-af7b-42272ba6689c'),(45,45,1,NULL,NULL,1,'2021-03-30 13:16:05','2021-03-30 13:16:05','ce266054-1490-40ec-ace4-22a3d0795e95'),(46,46,1,NULL,NULL,1,'2021-03-30 13:47:51','2021-03-30 13:47:51','76556aaf-bf74-4970-bd8a-041502828c61'),(47,47,1,NULL,NULL,1,'2021-03-30 13:53:33','2021-03-30 13:53:33','ab7b11fe-869c-4919-a5fd-52a686cf23c0'),(48,48,1,NULL,NULL,1,'2021-03-30 13:54:15','2021-03-30 13:54:15','3f067256-bfb9-405d-9130-2404c62646d9'),(49,49,1,'homepage','__home__',1,'2021-03-30 14:30:04','2021-03-30 14:30:04','786bfd84-cfb4-4ac0-b1c0-a0fe70f1afd6'),(50,50,1,NULL,NULL,1,'2021-03-30 14:58:55','2021-03-30 14:58:55','01337bf5-1034-4140-8f5e-cfbd175ca606'),(51,51,1,NULL,NULL,1,'2021-03-30 14:58:55','2021-03-30 14:58:55','6d8e7f4f-b76a-4d43-a447-cab5526ba407'),(52,52,1,NULL,NULL,1,'2021-03-30 14:58:55','2021-03-30 14:58:55','bd2d49e4-2039-4211-9076-9b7d760581e5'),(53,53,1,'homepage','__home__',1,'2021-03-30 14:58:55','2021-03-30 14:58:55','cc349527-39ef-457d-99fb-8cfb9285a558'),(54,54,1,NULL,NULL,1,'2021-03-30 14:58:55','2021-03-30 14:58:55','e2db1ba3-6398-47ac-b187-0ebaa20a9885'),(55,55,1,NULL,NULL,1,'2021-03-30 14:58:55','2021-03-30 14:58:55','babb0266-235b-4c1f-9eef-f9d820d8c2ee'),(56,56,1,NULL,NULL,1,'2021-03-30 14:58:55','2021-03-30 14:58:55','333a259f-a0fc-4f4c-915f-48aebb4af5a7'),(57,57,1,'homepage','__home__',1,'2021-03-30 15:00:15','2021-03-30 15:00:15','b644a056-63c3-40b8-9371-ae25766e3281'),(58,58,1,NULL,NULL,1,'2021-03-30 15:00:15','2021-03-30 15:00:15','baba67f5-f3e4-4eec-ba73-29990b0843fe'),(59,59,1,NULL,NULL,1,'2021-03-30 15:00:15','2021-03-30 15:00:15','99bff4ee-647d-43d8-a13e-56861a8d5f74'),(60,60,1,NULL,NULL,1,'2021-03-30 15:00:15','2021-03-30 15:00:15','f7e2c972-5b71-4038-aac4-291d06d18b45');
/*!40000 ALTER TABLE `elements_sites` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entries` VALUES (3,1,NULL,1,NULL,'2021-03-30 09:38:00',NULL,NULL,'2021-03-30 09:38:29','2021-03-30 09:38:29','419e7047-76ef-47e0-bdfa-b45f6ca0b29d'),(4,1,NULL,1,NULL,'2021-03-30 09:38:00',NULL,NULL,'2021-03-30 09:38:29','2021-03-30 09:38:29','75d0332b-b7a6-42b5-a083-bb2805ae9aec'),(5,1,NULL,1,NULL,'2021-03-30 09:38:00',NULL,NULL,'2021-03-30 09:38:52','2021-03-30 09:38:52','25873fde-3274-4d47-9436-45b919c6eb1b'),(6,1,NULL,1,NULL,'2021-03-30 09:38:00',NULL,NULL,'2021-03-30 10:13:09','2021-03-30 10:13:09','92b3f3f3-cc14-431d-a86d-bba445ed62a3'),(10,1,NULL,1,NULL,'2021-03-30 09:38:00',NULL,NULL,'2021-03-30 10:33:15','2021-03-30 10:33:15','8b4519a0-4d7c-41fc-aa71-7d8d37ed20dc'),(14,2,NULL,2,NULL,'2021-03-30 11:04:00',NULL,1,'2021-03-30 11:04:36','2021-03-30 11:04:36','b898447f-2e73-4cdb-8196-69330c748b57'),(15,2,NULL,2,NULL,'2021-03-30 11:04:00',NULL,NULL,'2021-03-30 11:04:36','2021-03-30 11:04:36','e05ec417-d674-4c37-8fb3-be3b6efd9a4f'),(16,2,NULL,2,NULL,'2021-03-30 11:04:00',NULL,NULL,'2021-03-30 11:05:00','2021-03-30 11:05:00','2a732d34-5e61-4118-8da6-e3ae307a86e4'),(17,3,NULL,3,NULL,'2021-03-30 11:05:00',NULL,1,'2021-03-30 11:05:32','2021-03-30 11:05:32','62d07598-8fd2-44cc-a715-27f8025a8676'),(18,3,NULL,3,NULL,'2021-03-30 11:05:00',NULL,NULL,'2021-03-30 11:05:32','2021-03-30 11:05:32','0e571125-98f3-4a82-b35d-8098565ee249'),(19,3,NULL,3,NULL,'2021-03-30 11:05:00',NULL,NULL,'2021-03-30 11:06:23','2021-03-30 11:06:23','55979594-c576-4dc7-81e8-e3c39b0c707c'),(22,3,NULL,3,NULL,'2021-03-30 11:05:00',NULL,NULL,'2021-03-30 11:07:21','2021-03-30 11:07:21','98a24ebb-a82d-4430-b83b-21f12edfb703'),(27,2,NULL,2,NULL,'2021-03-30 11:04:00',NULL,NULL,'2021-03-30 11:07:50','2021-03-30 11:07:50','6de12ea6-3a55-4065-83c1-c98d7b4c6d5f'),(30,2,NULL,2,NULL,'2021-03-30 11:04:00',NULL,NULL,'2021-03-30 11:09:07','2021-03-30 11:09:07','d36942ea-25e1-4664-aaa1-1524ade1a7d1'),(33,3,NULL,3,NULL,'2021-03-30 11:05:00',NULL,NULL,'2021-03-30 11:09:29','2021-03-30 11:09:29','1a63a863-4c70-41ef-a065-bef83838e184'),(36,2,NULL,2,NULL,'2021-03-30 11:04:00',NULL,NULL,'2021-03-30 11:09:56','2021-03-30 11:09:56','1ea3a92a-4a7f-4ff6-9d69-ed701eb6f97e'),(39,3,NULL,3,NULL,'2021-03-30 11:05:00',NULL,NULL,'2021-03-30 11:10:02','2021-03-30 11:10:02','b0574053-f736-4443-bf85-5fcfc04d07f8'),(49,1,NULL,1,NULL,'2021-03-30 09:38:00',NULL,NULL,'2021-03-30 14:30:04','2021-03-30 14:30:04','c7ee6543-1388-41d8-9fd2-f5aa25daa3b8'),(53,1,NULL,1,NULL,'2021-03-30 09:38:00',NULL,NULL,'2021-03-30 14:58:55','2021-03-30 14:58:55','758880b3-2bbe-49f7-a8db-af28d321e711'),(57,1,NULL,1,NULL,'2021-03-30 09:38:00',NULL,NULL,'2021-03-30 15:00:15','2021-03-30 15:00:15','b8e6fbb6-c888-4de6-b772-49fb415ff44f');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `entrytypes`
--

LOCK TABLES `entrytypes` WRITE;
/*!40000 ALTER TABLE `entrytypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `entrytypes` VALUES (1,1,3,'Homepage','homepage',1,'site',NULL,'{section.name|raw}',1,'2021-03-30 09:38:29','2021-03-30 10:13:09',NULL,'369ea60f-6259-4683-adcc-23418cf8285e'),(2,2,7,'About us','aboutUs',1,'site',NULL,'{section.name|raw}',1,'2021-03-30 11:04:36','2021-03-30 11:05:00','2021-03-30 14:30:19','e712e3c2-4fb0-4741-b535-3be1103a56f6'),(3,3,8,'Contact','contact',1,'site',NULL,'{section.name|raw}',1,'2021-03-30 11:05:32','2021-03-30 11:06:23','2021-03-30 14:30:22','5566eeab-b8cf-4a85-917c-1a72bb54c7a3');
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
INSERT INTO `fieldlayoutfields` VALUES (1,1,1,5,0,0,'2021-03-30 09:30:23','2021-03-30 09:30:23','141221f4-3452-4183-a107-c942823fe8c5'),(2,1,1,6,0,1,'2021-03-30 09:30:23','2021-03-30 09:30:23','164fd265-42f6-4b50-9be5-d8ca7f8675d9'),(3,1,1,7,0,2,'2021-03-30 09:30:23','2021-03-30 09:30:23','d9e9b8b7-8f2f-434c-af0f-a03ee917722f'),(4,1,1,8,0,3,'2021-03-30 09:30:23','2021-03-30 09:30:23','76f8f724-864f-4058-87b5-c32302fe2c0c'),(5,2,2,1,0,0,'2021-03-30 09:31:09','2021-03-30 09:31:09','d58f9856-e60b-440c-86b9-7c7a0c153503'),(6,2,2,2,0,1,'2021-03-30 09:31:09','2021-03-30 09:31:09','38ab999c-7a60-4b8c-8b0d-d4408f0b249c'),(7,2,2,3,0,2,'2021-03-30 09:31:09','2021-03-30 09:31:09','4bb0da4a-2752-46e2-a7a6-f8634fa2ef67'),(8,2,2,4,0,3,'2021-03-30 09:31:09','2021-03-30 09:31:09','52c3891d-02a6-4278-974d-b8bf8c2f3faa'),(12,4,7,15,0,0,'2021-03-30 09:41:28','2021-03-30 09:41:28','208516cd-9e89-4606-9c82-aa2ede7d781f'),(13,4,8,9,0,0,'2021-03-30 09:41:28','2021-03-30 09:41:28','493db277-d748-4b27-9c3c-acfd731af931'),(14,4,8,11,0,1,'2021-03-30 09:41:28','2021-03-30 09:41:28','a7d3afde-3c0d-43af-8ebd-1c3066e51bd2'),(15,4,8,10,0,2,'2021-03-30 09:41:28','2021-03-30 09:41:28','2662f25b-e01b-44ed-b450-f7e84d24dd64'),(16,5,9,16,0,0,'2021-03-30 09:41:28','2021-03-30 09:41:28','ccde66aa-cb9b-4627-abff-e13de325f656'),(17,5,10,9,0,0,'2021-03-30 09:41:28','2021-03-30 09:41:28','8abfc399-3c4a-4fdc-97e2-f84e14d1d729'),(18,5,10,11,0,1,'2021-03-30 09:41:28','2021-03-30 09:41:28','cb7b171b-d4eb-4bed-b277-27a78d27062f'),(19,5,10,10,0,2,'2021-03-30 09:41:28','2021-03-30 09:41:28','1f4c2aea-fdfb-4aa7-a627-bbfc8130fa98'),(24,3,13,18,0,1,'2021-03-30 10:13:09','2021-03-30 10:13:09','d9b832b5-8b14-42c3-972f-84f50282eaf4'),(25,3,13,17,0,2,'2021-03-30 10:13:09','2021-03-30 10:13:09','df02a239-7453-4e58-a007-604e97803d8d'),(26,3,14,13,0,0,'2021-03-30 10:13:09','2021-03-30 10:13:09','d353fb3c-5180-4bd1-b38b-c77d9e60d7b4'),(27,3,14,14,0,1,'2021-03-30 10:13:09','2021-03-30 10:13:09','15c28753-1fce-4330-854c-2f4e9e4fdf69'),(28,3,15,12,0,0,'2021-03-30 10:13:09','2021-03-30 10:13:09','8b510fe1-ba3a-4d8b-b2ed-be56f54e7233'),(35,6,18,19,0,0,'2021-03-30 10:34:23','2021-03-30 10:34:23','73d0933e-b40e-47dc-8584-85b692bc750c'),(36,6,18,15,0,1,'2021-03-30 10:34:23','2021-03-30 10:34:23','b5d8f129-e5c5-4c5f-84c1-01b202196e46'),(37,6,18,20,0,2,'2021-03-30 10:34:23','2021-03-30 10:34:23','2fe92831-50e6-49bc-9a7e-8dd664cad85d'),(38,6,19,9,0,0,'2021-03-30 10:34:23','2021-03-30 10:34:23','46ccfc48-1e0c-4178-aaf7-d03a3b10f717'),(39,6,19,11,0,1,'2021-03-30 10:34:23','2021-03-30 10:34:23','77103c00-7f68-44d1-b319-d666bae7cd71'),(40,6,19,10,0,2,'2021-03-30 10:34:23','2021-03-30 10:34:23','a4133b49-46f7-44c7-a639-c375b0e9c732'),(41,7,21,18,0,1,'2021-03-30 11:05:00','2021-03-30 11:05:00','780487ea-efee-4c15-8d5e-2602c8094475'),(42,7,21,17,0,2,'2021-03-30 11:05:00','2021-03-30 11:05:00','f2747cf0-b26c-43b9-bfe7-f45e56473ceb'),(43,7,22,13,0,0,'2021-03-30 11:05:00','2021-03-30 11:05:00','495ebb59-48fa-4832-b5ee-c6d6e1309ed0'),(44,7,22,14,0,1,'2021-03-30 11:05:00','2021-03-30 11:05:00','896bddfd-ce2a-49c4-93fc-ee8b46f234ac'),(45,7,23,12,0,0,'2021-03-30 11:05:00','2021-03-30 11:05:00','d3b38543-40fd-43f0-a9fe-54beb598ef5d'),(46,8,25,18,0,1,'2021-03-30 11:06:23','2021-03-30 11:06:23','00edbe70-c036-4796-834a-0b1ef3394ad8'),(47,8,25,17,0,2,'2021-03-30 11:06:23','2021-03-30 11:06:23','5ac5612a-e6b5-4d4d-9882-9f996f2d69c7'),(48,8,26,13,0,0,'2021-03-30 11:06:23','2021-03-30 11:06:23','0feb2ced-d016-4ba7-b63f-5db677675183'),(49,8,26,14,0,1,'2021-03-30 11:06:23','2021-03-30 11:06:23','b4601d74-5440-4867-a8c7-6b58f23ce090'),(50,8,27,12,0,0,'2021-03-30 11:06:23','2021-03-30 11:06:23','b9cceeb2-4127-424a-a7ed-d03b7dfa7bde'),(51,10,29,21,0,0,'2021-03-30 13:16:05','2021-03-30 13:16:05','56af1a84-9bbe-4bbf-8eae-baf3fe4f4552');
/*!40000 ALTER TABLE `fieldlayoutfields` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouts`
--

LOCK TABLES `fieldlayouts` WRITE;
/*!40000 ALTER TABLE `fieldlayouts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouts` VALUES (1,'verbb\\supertable\\elements\\SuperTableBlockElement','2021-03-30 09:30:23','2021-03-30 09:30:23',NULL,'f73678d2-2b29-48d7-99ef-179a914dc502'),(2,'craft\\elements\\GlobalSet','2021-03-30 09:31:09','2021-03-30 09:31:09',NULL,'d4df5b39-edcc-44f4-9b34-c6e29bad800d'),(3,'craft\\elements\\Entry','2021-03-30 09:38:29','2021-03-30 09:38:29',NULL,'f5c95668-587e-4459-8b0a-5e51bfb4e8e7'),(4,'benf\\neo\\elements\\Block','2021-03-30 09:41:28','2021-03-30 09:41:28',NULL,'09f21b0b-1728-4107-8524-245797d45dd7'),(5,'benf\\neo\\elements\\Block','2021-03-30 09:41:28','2021-03-30 09:41:28',NULL,'54d12f2e-2177-456e-a4b5-4e0803e641b5'),(6,'benf\\neo\\elements\\Block','2021-03-30 09:42:27','2021-03-30 09:42:27',NULL,'6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a'),(7,'craft\\elements\\Entry','2021-03-30 11:04:36','2021-03-30 11:04:36','2021-03-30 14:30:19','42e73765-beb6-4378-ae83-920f9f328575'),(8,'craft\\elements\\Entry','2021-03-30 11:05:32','2021-03-30 11:05:32','2021-03-30 14:30:22','fc7f009e-bfc8-4d7b-bbd3-57e6aa1bc672'),(9,'craft\\elements\\Asset','2021-03-30 11:43:14','2021-03-30 11:43:14','2021-03-30 14:31:52','04594773-5b38-40f0-b373-70e249c5b472'),(10,'craft\\elements\\GlobalSet','2021-03-30 13:16:05','2021-03-30 13:16:05',NULL,'f2d8768a-cbb9-4a52-a62f-3cebeccc956b');
/*!40000 ALTER TABLE `fieldlayouts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fieldlayouttabs`
--

LOCK TABLES `fieldlayouttabs` WRITE;
/*!40000 ALTER TABLE `fieldlayouttabs` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fieldlayouttabs` VALUES (1,1,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"1f6a1dc8-82d8-47a8-ae54-01af20652730\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"5cd6ad16-cb88-45ba-b275-1558f8f27c05\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"a596aec7-c8ec-49d7-ab4d-97dcdf5ac990\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"d9aafe6e-671c-45da-9958-ccb6470336d6\"}]',1,'2021-03-30 09:30:23','2021-03-30 09:30:23','46a70101-f073-4883-aea2-444b3e9a40f7'),(2,2,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"4af3caf9-e4e3-4acd-90f8-1e8cd585e497\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"3cca813e-09a9-4025-8efa-d5ba11d4dd89\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"386e1cf1-acc9-4336-90e1-fb74daefd6f5\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"13d35453-527a-4094-b642-42292f193f8c\"}]',1,'2021-03-30 09:31:09','2021-03-30 09:31:09','2db2160d-f0bb-4ad1-a0ba-4125293b6445'),(7,4,'Main Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"1d1c9f28-39de-4df6-b077-856d16c001ca\"}]',1,'2021-03-30 09:41:28','2021-03-30 09:41:28','7a144623-c000-4dd9-a1e3-1053a65dabec'),(8,4,'Settings','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"336f207f-f4fb-43c3-bbc3-f10b641e940a\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"6c4a2320-184d-4f3b-9482-070fc8b8194a\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"bb3731df-a01f-4725-9f8b-06d99359fd9f\"}]',2,'2021-03-30 09:41:28','2021-03-30 09:41:28','1d15c5c7-33e7-4764-90f8-508f1d875e2b'),(9,5,'Main Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"0ffba24e-268b-4f2c-a3f2-ad976b64c979\"}]',1,'2021-03-30 09:41:28','2021-03-30 09:41:28','e05d6911-4022-431e-bb3c-aa1a2aad036f'),(10,5,'Settings','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"336f207f-f4fb-43c3-bbc3-f10b641e940a\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"6c4a2320-184d-4f3b-9482-070fc8b8194a\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"bb3731df-a01f-4725-9f8b-06d99359fd9f\"}]',2,'2021-03-30 09:41:28','2021-03-30 09:41:28','3ec11185-004b-41ba-a9b9-9e7fcd68de47'),(13,3,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"d783368e-a494-4457-9e99-5a027ae72a18\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"1d1d5665-5674-4388-8d46-9b87e4dc65d3\"}]',1,'2021-03-30 10:13:09','2021-03-30 10:13:09','f1585199-7b75-474e-8d0e-39c629cc146d'),(14,3,'Summary','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"39237593-ff51-4bd3-851a-a9dfac329c0b\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"4184d945-e90d-4433-b1f3-727edf65107e\"}]',2,'2021-03-30 10:13:09','2021-03-30 10:13:09','239c7ada-5033-45b6-8833-d79fd4497dc8'),(15,3,'SEO','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"7c5c4db7-bc5e-4979-a31b-6b7734989556\"}]',3,'2021-03-30 10:13:09','2021-03-30 10:13:09','941c2d1a-2696-4741-957e-58a211a922a7'),(18,6,'Main Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"2f64efd3-101a-4ed1-a31e-96657d6dc6e5\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"1d1c9f28-39de-4df6-b077-856d16c001ca\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"4870444e-6820-4ab0-a141-99e310305629\"}]',1,'2021-03-30 10:34:23','2021-03-30 10:34:23','f5de53ec-43e2-4bd7-a1de-834d236e7299'),(19,6,'Settings','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"336f207f-f4fb-43c3-bbc3-f10b641e940a\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"6c4a2320-184d-4f3b-9482-070fc8b8194a\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"bb3731df-a01f-4725-9f8b-06d99359fd9f\"}]',2,'2021-03-30 10:34:23','2021-03-30 10:34:23','ada4a267-4979-4062-86e8-14e5c2664d33'),(21,7,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"d783368e-a494-4457-9e99-5a027ae72a18\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"1d1d5665-5674-4388-8d46-9b87e4dc65d3\"}]',1,'2021-03-30 11:05:00','2021-03-30 11:05:00','7fdd9fc5-d2b7-4fe9-ab53-f75b64003de7'),(22,7,'Summary','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"39237593-ff51-4bd3-851a-a9dfac329c0b\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"4184d945-e90d-4433-b1f3-727edf65107e\"}]',2,'2021-03-30 11:05:00','2021-03-30 11:05:00','7afc9a58-6d49-48f2-bf23-6d50d3bbd740'),(23,7,'SEO','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"7c5c4db7-bc5e-4979-a31b-6b7734989556\"}]',3,'2021-03-30 11:05:00','2021-03-30 11:05:00','57d9d2ac-9315-4129-b5d2-a1fe9e2787ab'),(25,8,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\EntryTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"d783368e-a494-4457-9e99-5a027ae72a18\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"1d1d5665-5674-4388-8d46-9b87e4dc65d3\"}]',1,'2021-03-30 11:06:23','2021-03-30 11:06:23','15719896-4921-4fca-9716-2ca2fd315dca'),(26,8,'Summary','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"39237593-ff51-4bd3-851a-a9dfac329c0b\"},{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"4184d945-e90d-4433-b1f3-727edf65107e\"}]',2,'2021-03-30 11:06:23','2021-03-30 11:06:23','2c086e62-895a-4a6b-98b4-5b8eb92062c6'),(27,8,'SEO','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"7c5c4db7-bc5e-4979-a31b-6b7734989556\"}]',3,'2021-03-30 11:06:23','2021-03-30 11:06:23','a87820a3-8af7-47a8-a829-e64835a8fd7b'),(28,9,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\AssetTitleField\",\"autocomplete\":false,\"class\":null,\"size\":null,\"name\":null,\"autocorrect\":true,\"autocapitalize\":true,\"disabled\":false,\"readonly\":false,\"title\":null,\"placeholder\":null,\"step\":null,\"min\":null,\"max\":null,\"requirable\":false,\"id\":null,\"containerAttributes\":[],\"inputContainerAttributes\":[],\"labelAttributes\":[],\"orientation\":null,\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"width\":100}]',1,'2021-03-30 11:43:14','2021-03-30 11:43:14','39bdba3e-8041-4e0d-8b55-ea8a024f9b64'),(29,10,'Content','[{\"type\":\"craft\\\\fieldlayoutelements\\\\CustomField\",\"label\":null,\"instructions\":null,\"tip\":null,\"warning\":null,\"required\":false,\"width\":100,\"fieldUid\":\"3f092924-7454-4778-a975-9d6112f3eb20\"}]',1,'2021-03-30 13:16:05','2021-03-30 13:16:05','0c0a3b11-797c-403b-b697-8cc30d5b27c4');
/*!40000 ALTER TABLE `fieldlayouttabs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `fields` VALUES (1,2,'Address','address','global','',0,'none',NULL,'craft\\redactor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"cleanupHtml\":true,\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"\",\"removeEmptyTags\":\"1\",\"removeInlineStyles\":\"1\",\"removeNbsp\":\"1\",\"showHtmlButtonForNonAdmins\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"enlarged\"}','2021-03-30 09:28:49','2021-03-30 09:28:49','4af3caf9-e4e3-4acd-90f8-1e8cd585e497'),(2,2,'Email','email','global','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2021-03-30 09:28:55','2021-03-30 09:28:55','3cca813e-09a9-4025-8efa-d5ba11d4dd89'),(3,2,'Phone Number','phoneNumber','global','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2021-03-30 09:29:03','2021-03-30 09:29:03','386e1cf1-acc9-4336-90e1-fb74daefd6f5'),(4,2,'Social Profiles','socialProfiles','global','',0,'site',NULL,'verbb\\supertable\\fields\\SuperTableField','{\"columns\":{\"f63d3738-c5aa-4de0-84fd-0deb6570d894\":{\"width\":\"\"},\"3037eaf7-b2d6-4e6f-b616-b9911cf6f5c2\":{\"width\":\"\"},\"0b7ca9a0-694c-4733-bfee-d1c56b3aa669\":{\"width\":\"\"},\"d960a7c1-c036-40d9-b547-47325ed6c97b\":{\"width\":\"\"}},\"contentTable\":\"{{%stc_socialprofiles}}\",\"fieldLayout\":\"table\",\"maxRows\":\"\",\"minRows\":\"\",\"placeholderKey\":null,\"propagationMethod\":\"all\",\"selectionLabel\":\"\",\"staticField\":\"\"}','2021-03-30 09:30:23','2021-03-30 09:30:23','13d35453-527a-4094-b642-42292f193f8c'),(5,NULL,'Name','socialName','superTableBlockType:dfd34224-0241-4c43-aec4-0c7abd7e9dab','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2021-03-30 09:30:23','2021-03-30 09:30:23','1f6a1dc8-82d8-47a8-ae54-01af20652730'),(6,NULL,'Link','socialLink','superTableBlockType:dfd34224-0241-4c43-aec4-0c7abd7e9dab','',0,'none',NULL,'craft\\fields\\Url','{\"maxLength\":\"255\",\"placeholder\":null,\"types\":[\"url\"]}','2021-03-30 09:30:23','2021-03-30 09:30:23','5cd6ad16-cb88-45ba-b275-1558f8f27c05'),(7,NULL,'Icon','socialIcon','superTableBlockType:dfd34224-0241-4c43-aec4-0c7abd7e9dab','',0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowUploads\":true,\"allowedKinds\":null,\"defaultUploadLocationSource\":\"\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"\",\"localizeRelations\":false,\"previewMode\":\"full\",\"restrictFiles\":\"\",\"selectionLabel\":\"\",\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"useSingleFolder\":false,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2021-03-30 09:30:23','2021-03-30 09:30:23','a596aec7-c8ec-49d7-ab4d-97dcdf5ac990'),(8,NULL,'Alt Icon','altSocialIcon','superTableBlockType:dfd34224-0241-4c43-aec4-0c7abd7e9dab','',0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowUploads\":true,\"allowedKinds\":null,\"defaultUploadLocationSource\":\"\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"\",\"localizeRelations\":false,\"previewMode\":\"full\",\"restrictFiles\":\"\",\"selectionLabel\":\"\",\"showSiteMenu\":false,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"useSingleFolder\":false,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2021-03-30 09:30:23','2021-03-30 09:30:23','d9aafe6e-671c-45da-9958-ccb6470336d6'),(9,3,'Background Color','backgroundColor','global','',0,'none',NULL,'supercool\\buttonbox\\fields\\Colours','{\"options\":[{\"label\":\"White\",\"value\":\"bg-white\",\"cssColour\":\"#FFFFFF\",\"default\":\"1\"},{\"label\":\"Black\",\"value\":\"bg-black\",\"cssColour\":\"#000000\",\"default\":\"\"}]}','2021-03-30 09:32:36','2021-03-30 09:32:36','336f207f-f4fb-43c3-bbc3-f10b641e940a'),(10,3,'Top Spacing','topSpacing','global','',0,'none',NULL,'supercool\\buttonbox\\fields\\Buttons','{\"displayAsGraphic\":\"\",\"displayFullwidth\":\"\",\"options\":[{\"label\":\"None\",\"showLabel\":\"1\",\"value\":\"pt-default\",\"imageUrl\":\"\",\"default\":\"1\"},{\"label\":\"Normal\",\"showLabel\":\"1\",\"value\":\"pt-lg-3 pt-md-3 pt-3\",\"imageUrl\":\"\",\"default\":\"\"},{\"label\":\"Large\",\"showLabel\":\"1\",\"value\":\"pt-lg-5 pt-md-5 pt-4\",\"imageUrl\":\"\",\"default\":\"\"}]}','2021-03-30 09:34:19','2021-03-30 09:34:19','bb3731df-a01f-4725-9f8b-06d99359fd9f'),(11,3,'Bottom Spacing','bottomSpacing','global','',0,'none',NULL,'supercool\\buttonbox\\fields\\Buttons','{\"displayAsGraphic\":\"\",\"displayFullwidth\":\"\",\"options\":[{\"label\":\"None\",\"showLabel\":\"1\",\"value\":\"pb-default\",\"imageUrl\":\"\",\"default\":\"1\"},{\"label\":\"Normal\",\"showLabel\":\"1\",\"value\":\"pb-lg-3 pb-md-3 pb-3\",\"imageUrl\":\"\",\"default\":\"\"},{\"label\":\"Larger\",\"showLabel\":\"1\",\"value\":\"pb-lg-5 pb-md-5 pb-4\",\"imageUrl\":\"\",\"default\":\"\"}]}','2021-03-30 09:35:14','2021-03-30 09:35:14','6c4a2320-184d-4f3b-9482-070fc8b8194a'),(12,4,'SEO','seo','global','',0,'none',NULL,'ether\\seo\\fields\\SeoField','{\"description\":\"\",\"hideSocial\":\"\",\"robots\":[\"\",\"\",\"\",\"\",\"\",\"\"],\"socialImage\":null,\"suffixAsPrefix\":null,\"title\":[{\"key\":\"1\",\"locked\":\"0\",\"template\":\"{title}\"},{\"key\":\"2\",\"locked\":\"1\",\"template\":\" - {{ siteName }}\"}],\"titleSuffix\":null}','2021-03-30 09:36:22','2021-03-30 09:36:35','7c5c4db7-bc5e-4979-a31b-6b7734989556'),(13,5,'Page Summary','pageSummary','global','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2021-03-30 09:37:24','2021-03-30 09:37:24','39237593-ff51-4bd3-851a-a9dfac329c0b'),(14,5,'Summary Image','summaryImage','global','',0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowUploads\":true,\"allowedKinds\":[\"image\"],\"defaultUploadLocationSource\":\"volume:27b00051-5d7e-4c72-8d4c-37eb325f3071\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"1\",\"localizeRelations\":false,\"previewMode\":\"full\",\"restrictFiles\":\"1\",\"selectionLabel\":\"\",\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:27b00051-5d7e-4c72-8d4c-37eb325f3071\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"useSingleFolder\":false,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2021-03-30 09:37:44','2021-03-30 11:47:13','4184d945-e90d-4433-b1f3-727edf65107e'),(15,7,'Copy','copy','global','',0,'none',NULL,'craft\\redactor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"cleanupHtml\":true,\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"\",\"removeEmptyTags\":\"1\",\"removeInlineStyles\":\"1\",\"removeNbsp\":\"1\",\"showHtmlButtonForNonAdmins\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"enlarged\"}','2021-03-30 09:39:25','2021-03-30 09:39:25','1d1c9f28-39de-4df6-b077-856d16c001ca'),(16,7,'Image','image','global','',0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowUploads\":true,\"allowedKinds\":[\"image\"],\"defaultUploadLocationSource\":\"volume:27b00051-5d7e-4c72-8d4c-37eb325f3071\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"1\",\"localizeRelations\":false,\"previewMode\":\"full\",\"restrictFiles\":\"1\",\"selectionLabel\":\"\",\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:27b00051-5d7e-4c72-8d4c-37eb325f3071\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"useSingleFolder\":false,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2021-03-30 09:39:45','2021-03-30 11:46:15','0ffba24e-268b-4f2c-a3f2-ad976b64c979'),(17,6,'Content Builder','contentBuilder','global','',0,'site',NULL,'benf\\neo\\Field','{\"maxBlocks\":\"\",\"maxLevels\":\"\",\"maxTopBlocks\":\"\",\"minBlocks\":\"\",\"propagationMethod\":\"all\",\"wasModified\":false}','2021-03-30 09:41:28','2021-03-30 09:41:28','1d1d5665-5674-4388-8d46-9b87e4dc65d3'),(18,6,'Page Header','pageHeader','global','',0,'site',NULL,'benf\\neo\\Field','{\"maxBlocks\":\"1\",\"maxLevels\":\"\",\"maxTopBlocks\":\"\",\"minBlocks\":\"\",\"propagationMethod\":\"all\",\"wasModified\":false}','2021-03-30 09:42:27','2021-03-30 10:34:23','d783368e-a494-4457-9e99-5a027ae72a18'),(19,7,'Header','header','global','',0,'none',NULL,'craft\\fields\\PlainText','{\"byteLimit\":null,\"charLimit\":null,\"code\":\"\",\"columnType\":null,\"initialRows\":\"4\",\"multiline\":\"\",\"placeholder\":null,\"uiMode\":\"normal\"}','2021-03-30 09:42:34','2021-03-30 09:42:34','2f64efd3-101a-4ed1-a31e-96657d6dc6e5'),(20,7,'Background Image','backgroundImage','global','',0,'site',NULL,'craft\\fields\\Assets','{\"allowSelfRelations\":false,\"allowUploads\":true,\"allowedKinds\":[\"image\"],\"defaultUploadLocationSource\":\"volume:27b00051-5d7e-4c72-8d4c-37eb325f3071\",\"defaultUploadLocationSubpath\":\"\",\"limit\":\"1\",\"localizeRelations\":false,\"previewMode\":\"full\",\"restrictFiles\":\"1\",\"selectionLabel\":\"\",\"showSiteMenu\":true,\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"singleUploadLocationSource\":\"volume:27b00051-5d7e-4c72-8d4c-37eb325f3071\",\"singleUploadLocationSubpath\":\"\",\"source\":null,\"sources\":\"*\",\"targetSiteId\":null,\"useSingleFolder\":false,\"validateRelatedElements\":false,\"viewMode\":\"list\"}','2021-03-30 09:42:53','2021-03-30 11:46:52','4870444e-6820-4ab0-a141-99e310305629'),(21,2,'Google Analytics','googleAnalytics','global','',0,'none',NULL,'craft\\redactor\\Field','{\"availableTransforms\":\"*\",\"availableVolumes\":\"*\",\"cleanupHtml\":true,\"columnType\":\"text\",\"configSelectionMode\":\"choose\",\"defaultTransform\":\"\",\"manualConfig\":\"\",\"purifierConfig\":\"\",\"purifyHtml\":\"1\",\"redactorConfig\":\"\",\"removeEmptyTags\":\"1\",\"removeInlineStyles\":\"1\",\"removeNbsp\":\"1\",\"showHtmlButtonForNonAdmins\":\"\",\"showUnpermittedFiles\":false,\"showUnpermittedVolumes\":false,\"uiMode\":\"enlarged\"}','2021-03-30 13:13:11','2021-03-30 13:15:33','3f092924-7454-4778-a975-9d6112f3eb20');
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
INSERT INTO `freeform_lock` VALUES (1,'freeform-purge-cache-key','2021-03-30 13:30:15','2021-03-30 13:30:15','f25857bb-8df5-4058-bb76-2524cddb1674'),(2,'freeform-feed-cache-key','2021-03-30 13:30:16','2021-03-30 13:30:16','a0e41403-97db-4387-ad5b-053b6fb42a93'),(3,'freeform-digest-cache-key','2021-03-30 13:30:16','2021-03-30 13:30:16','8e96c36b-ae37-42aa-9816-a1f820b04828'),(4,'freeform-purge-cache-key','2021-03-30 14:30:18','2021-03-30 14:30:18','7c6edcd6-bd1d-4404-9506-9862e856bc7d'),(5,'freeform-purge-cache-key','2021-03-30 15:30:49','2021-03-30 15:30:49','50217dfa-b6d6-47e4-8cc1-2021090d987f');
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
INSERT INTO `info` VALUES (1,'3.6.11.2','3.6.7',0,'vegswimkufji','ttqvazqtrxwv','2021-03-30 09:20:10','2021-03-30 15:31:52','f9d6f73c-c7ae-43dc-83bd-61db41fe87d5');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocks`
--

LOCK TABLES `matrixblocks` WRITE;
/*!40000 ALTER TABLE `matrixblocks` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `matrixblocks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `matrixblocktypes`
--

LOCK TABLES `matrixblocktypes` WRITE;
/*!40000 ALTER TABLE `matrixblocktypes` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `matrixblocktypes` ENABLE KEYS */;
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
INSERT INTO `navigation_navs` VALUES (1,21,'Main Navigation','mainNavigation','',1,0,NULL,'{\"craft\\\\elements\\\\Asset\":{\"enabled\":\"1\",\"permissions\":\"*\"},\"craft\\\\elements\\\\Category\":{\"enabled\":\"1\",\"permissions\":\"*\"},\"craft\\\\elements\\\\Entry\":{\"enabled\":\"1\",\"permissions\":\"*\"},\"craft\\\\elements\\\\Tag\":{\"enabled\":\"\",\"permissions\":\"*\"},\"custom\":{\"enabled\":\"1\"},\"verbb\\\\navigation\\\\nodetypes\\\\PassiveType\":{\"enabled\":\"1\"}}','{\"18d78006-3985-4ea4-b620-67bae10d9c2d\":null}',NULL,'2021-03-30 11:13:52','2021-03-30 11:13:52','2021-03-30 14:28:25','f501c1e9-c078-458b-a8d8-8d96c7a66ae7');
/*!40000 ALTER TABLE `navigation_navs` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `navigation_nodes`
--

LOCK TABLES `navigation_nodes` WRITE;
/*!40000 ALTER TABLE `navigation_nodes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `navigation_nodes` VALUES (42,14,1,NULL,NULL,'craft\\elements\\Entry',NULL,NULL,'[]','[]',0,1,'2021-03-30 11:14:00','2021-03-30 11:14:00','9df9dcfb-23f9-4dc3-8748-b1b68edd171a'),(43,17,1,NULL,NULL,'craft\\elements\\Entry',NULL,NULL,'[]','[]',0,1,'2021-03-30 11:14:00','2021-03-30 11:14:00','a5c0e50e-86b7-460c-b941-8dfa8280b03e'),(44,3,1,NULL,NULL,'craft\\elements\\Entry',NULL,NULL,'[]','[]',0,1,'2021-03-30 11:14:00','2021-03-30 11:14:00','c7aa675c-b983-440d-8861-0caef5ff8160');
/*!40000 ALTER TABLE `navigation_nodes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `neoblocks`
--

LOCK TABLES `neoblocks` WRITE;
/*!40000 ALTER TABLE `neoblocks` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `neoblocks` VALUES (7,3,NULL,18,3,1,0,'2021-03-30 10:33:15','2021-03-30 10:33:15','e947a931-8f1e-4439-aed3-7fd1c28a6d98'),(8,3,NULL,17,1,1,0,'2021-03-30 10:33:15','2021-03-30 10:33:15','246334b2-92ef-4c1b-ad38-19bb9bcb12be'),(9,3,NULL,17,2,2,0,'2021-03-30 10:33:15','2021-03-30 10:33:15','6f1b3604-d1e9-434e-9498-e9df2e52e4f0'),(11,10,NULL,18,3,1,NULL,'2021-03-30 10:33:15','2021-03-30 10:33:15','6e9cccc2-eb67-42f1-a060-7a38c6f28a5d'),(12,10,NULL,17,1,1,NULL,'2021-03-30 10:33:15','2021-03-30 10:33:15','77b29b0d-021f-4c19-b2ea-08f57ab564ea'),(13,10,NULL,17,2,2,NULL,'2021-03-30 10:33:15','2021-03-30 10:33:15','c82bba71-79da-41d0-bf5b-bed5d8bab5aa'),(20,17,NULL,18,3,1,1,'2021-03-30 11:07:21','2021-03-30 11:07:21','f9c3f6fb-daa1-4ee1-a3de-79d5e6809d87'),(21,17,NULL,17,2,1,1,'2021-03-30 11:07:21','2021-03-30 11:07:21','e3790097-73b0-49a2-9587-6890d0255def'),(23,22,NULL,18,3,1,NULL,'2021-03-30 11:07:21','2021-03-30 11:07:21','0c561e08-c672-4305-856e-52920667c6a6'),(24,22,NULL,17,2,1,NULL,'2021-03-30 11:07:21','2021-03-30 11:07:21','f5f961fe-13ad-4364-ad58-6dd206b33399'),(25,14,NULL,18,3,1,1,'2021-03-30 11:07:50','2021-03-30 11:07:50','e60261bc-a26e-452f-8197-410137b270b9'),(26,14,NULL,17,2,1,1,'2021-03-30 11:07:50','2021-03-30 11:07:50','f39b5088-24c0-41dc-8886-8446a696bced'),(28,27,NULL,18,3,1,NULL,'2021-03-30 11:07:50','2021-03-30 11:07:50','08931179-f986-4e69-a77d-7393e89e7e84'),(29,27,NULL,17,2,1,NULL,'2021-03-30 11:07:50','2021-03-30 11:07:50','d0cb772d-ccf7-49fa-ab54-70fa53c380e2'),(31,30,NULL,18,3,1,NULL,'2021-03-30 11:09:07','2021-03-30 11:09:07','d8708d32-bbb5-4484-9791-77ff3263f0b2'),(32,30,NULL,17,2,1,NULL,'2021-03-30 11:09:07','2021-03-30 11:09:07','fe099c12-d8ec-44bc-993e-ba38e985a6c8'),(34,33,NULL,18,3,1,NULL,'2021-03-30 11:09:29','2021-03-30 11:09:29','7c47c658-c90f-4b0d-88fb-42291b61de8a'),(35,33,NULL,17,2,1,NULL,'2021-03-30 11:09:29','2021-03-30 11:09:29','b9ba4c7d-2856-4776-bed7-d0d65f19d485'),(37,36,NULL,18,3,1,NULL,'2021-03-30 11:09:56','2021-03-30 11:09:56','d5592f3e-f2dd-43f8-99f3-fe8bc1c0d224'),(38,36,NULL,17,2,1,NULL,'2021-03-30 11:09:56','2021-03-30 11:09:56','6f3913ee-3b9b-41fb-a2e6-1b770e319058'),(40,39,NULL,18,3,1,NULL,'2021-03-30 11:10:02','2021-03-30 11:10:02','7da08b82-c869-4029-b3fa-78c6a9706db6'),(41,39,NULL,17,2,1,NULL,'2021-03-30 11:10:02','2021-03-30 11:10:02','88e09264-9496-4f0a-8bbd-d9fd360db5b4'),(50,3,NULL,18,3,1,NULL,'2021-03-30 14:58:55','2021-03-30 14:58:55','f02d6d3a-66b3-4ad2-86e7-6db4dfdff63f'),(51,3,NULL,17,1,1,NULL,'2021-03-30 14:58:55','2021-03-30 14:58:55','73d88f75-1755-4679-85fc-7b485afbca96'),(52,3,NULL,17,2,2,NULL,'2021-03-30 14:58:55','2021-03-30 14:58:55','23bbe08a-2ea2-42b9-a4ac-22f48fa49a5c'),(54,53,NULL,18,3,1,NULL,'2021-03-30 14:58:55','2021-03-30 14:58:55','b6437484-83c5-4143-81e3-3ca2dab13a9e'),(55,53,NULL,17,1,1,NULL,'2021-03-30 14:58:55','2021-03-30 14:58:55','2d9cb8d1-15b4-496c-bfab-975a9e2c6d46'),(56,53,NULL,17,2,2,NULL,'2021-03-30 14:58:55','2021-03-30 14:58:55','4b7d060e-607b-4888-8dd1-239a58333ac8'),(58,57,NULL,18,3,1,NULL,'2021-03-30 15:00:15','2021-03-30 15:00:15','bd15f99e-a75d-422f-84ac-3d78a1685a7f'),(59,57,NULL,17,1,1,NULL,'2021-03-30 15:00:15','2021-03-30 15:00:15','f7b09d50-ebe3-4a69-8d94-54a275cb6b70'),(60,57,NULL,17,2,2,NULL,'2021-03-30 15:00:15','2021-03-30 15:00:15','55cac05a-a009-4b83-ad5d-64f3cbc29e41');
/*!40000 ALTER TABLE `neoblocks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `neoblockstructures`
--

LOCK TABLES `neoblockstructures` WRITE;
/*!40000 ALTER TABLE `neoblockstructures` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `neoblockstructures` VALUES (3,3,10,1,18,'2021-03-30 10:33:18','2021-03-30 10:33:18','8adc4072-478c-47a0-9417-b88b497232a1'),(4,4,10,1,17,'2021-03-30 10:33:18','2021-03-30 10:33:18','e903c203-6ae4-4c63-9d82-b3ce0a8325a3'),(7,7,22,1,18,'2021-03-30 11:07:22','2021-03-30 11:07:22','2cd38d56-aef4-4afc-9706-37b7a803a7f8'),(8,8,22,1,17,'2021-03-30 11:07:22','2021-03-30 11:07:22','ca206d2a-a90c-435c-831a-e8c66a974065'),(11,11,27,1,18,'2021-03-30 11:07:51','2021-03-30 11:07:51','2788a2f2-95da-4db3-a308-9506b660e297'),(12,12,27,1,17,'2021-03-30 11:07:51','2021-03-30 11:07:51','a4caad72-8f84-40e1-8aa6-5309350a53d4'),(13,13,30,1,18,'2021-03-30 11:09:09','2021-03-30 11:09:09','4aacf04f-53a9-4ed3-a9b9-398e3295ed4a'),(14,14,30,1,17,'2021-03-30 11:09:09','2021-03-30 11:09:09','52928948-cb02-4dd0-8b86-c888f2ba8d3e'),(15,15,33,1,18,'2021-03-30 11:09:30','2021-03-30 11:09:30','d10a5ff8-4a1f-4123-9a67-8082e8818241'),(16,16,33,1,17,'2021-03-30 11:09:30','2021-03-30 11:09:30','91deb090-1fbc-4490-8a3a-fbdcf35191f8'),(17,17,36,1,18,'2021-03-30 11:09:57','2021-03-30 11:09:57','dadc61d2-dbb3-4502-9552-2a86fcb80e6b'),(18,18,36,1,17,'2021-03-30 11:09:57','2021-03-30 11:09:57','3f40b0d8-6e11-4b75-ae66-b3de79d49e54'),(19,19,39,1,18,'2021-03-30 11:10:04','2021-03-30 11:10:04','138a584f-e147-4e47-984a-ed73437f0d4c'),(20,20,39,1,17,'2021-03-30 11:10:04','2021-03-30 11:10:04','194d82ca-3e06-472d-aafe-dd3ded54cc80'),(23,24,14,1,18,'2021-03-30 14:30:19','2021-03-30 14:30:19','2867c3b8-bd30-4a81-baff-34af77603ef7'),(24,25,14,1,17,'2021-03-30 14:30:19','2021-03-30 14:30:19','0a1e9845-d0a2-4e46-8688-ef0c5d50e5c2'),(25,26,17,1,18,'2021-03-30 14:30:22','2021-03-30 14:30:22','d238bfd9-7c04-43f2-b47e-16eb63e04e89'),(26,27,17,1,17,'2021-03-30 14:30:22','2021-03-30 14:30:22','42350faf-1671-455e-809f-b94a958d7027'),(27,28,3,1,18,'2021-03-30 14:58:55','2021-03-30 14:58:55','06f383f7-ec7c-4087-b775-1bafba3c99c3'),(28,29,3,1,17,'2021-03-30 14:58:55','2021-03-30 14:58:55','2a97c479-4cad-473f-a1a9-b1c2b16d2ce2'),(29,30,53,1,18,'2021-03-30 14:58:57','2021-03-30 14:58:57','fd85b364-92d9-4b6d-a2ed-43f30c212419'),(30,31,53,1,17,'2021-03-30 14:58:57','2021-03-30 14:58:57','1b054666-840c-4412-9148-ed3d1e619e8e'),(31,32,57,1,18,'2021-03-30 15:00:18','2021-03-30 15:00:18','c82e0082-d361-44ae-8e21-35824e47e8c8'),(32,33,57,1,17,'2021-03-30 15:00:18','2021-03-30 15:00:18','c6ff8ebc-e7c1-4c42-a7c3-c00a411b439d');
/*!40000 ALTER TABLE `neoblockstructures` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `neoblocktypegroups`
--

LOCK TABLES `neoblocktypegroups` WRITE;
/*!40000 ALTER TABLE `neoblocktypegroups` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `neoblocktypegroups` VALUES (1,17,'Media',1,'2021-03-30 09:41:28','2021-03-30 09:41:28','dcc7e763-cfad-42ba-a4ed-f0c111f2446b'),(2,17,'Blocks',4,'2021-03-30 09:41:28','2021-03-30 09:41:28','9c3f9dfb-fbb4-4ab1-b8db-5dc9b6045f2d');
/*!40000 ALTER TABLE `neoblocktypegroups` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `neoblocktypes`
--

LOCK TABLES `neoblocktypes` WRITE;
/*!40000 ALTER TABLE `neoblocktypes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `neoblocktypes` VALUES (1,17,4,'Copy','copy',0,0,0,'',1,2,'2021-03-30 09:41:28','2021-03-30 09:41:28','4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83'),(2,17,5,'Image','image',0,0,0,'',1,3,'2021-03-30 09:41:28','2021-03-30 09:41:28','f122d996-7ed0-4bc1-ad02-50e74deac2df'),(3,18,6,'Main Header','mainHeader',0,0,0,'',1,1,'2021-03-30 09:42:27','2021-03-30 09:42:27','1af5640c-d8b3-4503-89a1-8d0581554915');
/*!40000 ALTER TABLE `neoblocktypes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `plugins`
--

LOCK TABLES `plugins` WRITE;
/*!40000 ALTER TABLE `plugins` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `plugins` VALUES (1,'neo','2.9.5','2.8.16','trial',NULL,'2021-03-30 09:23:22','2021-03-30 09:23:22','2021-03-30 15:32:01','cad07713-6957-45e4-9438-f0caf451e14b'),(3,'buttonbox','2.0.4','1.0.0','unknown',NULL,'2021-03-30 09:26:37','2021-03-30 09:26:37','2021-03-30 15:32:01','44f05977-bb62-4bb0-a498-01a403fd74f4'),(4,'redactor','2.8.5','2.3.0','unknown',NULL,'2021-03-30 09:26:57','2021-03-30 09:26:57','2021-03-30 15:32:01','d49b778c-8031-4dde-a1d0-828c0616cb95'),(5,'super-table','2.6.7','2.2.1','unknown',NULL,'2021-03-30 09:27:19','2021-03-30 09:27:19','2021-03-30 15:32:01','26b97ad7-53cb-45d3-93e1-376de19fba6c'),(6,'seo','3.6.7','3.1.1','unknown',NULL,'2021-03-30 09:27:41','2021-03-30 09:27:41','2021-03-30 15:32:01','bfa9f957-774d-4bf0-ac79-0ee6a4d4553f'),(7,'aws-s3','1.2.11','1.2','unknown',NULL,'2021-03-30 09:28:07','2021-03-30 09:28:07','2021-03-30 15:32:01','39a8ef93-ba4d-4bda-810e-c8a74e0c879c'),(8,'navigation','1.4.15','1.0.21','trial',NULL,'2021-03-30 11:13:20','2021-03-30 11:13:20','2021-03-30 15:32:01','6b71802d-1bf0-4c44-889b-800d18212a6d'),(9,'freeform','3.10.11','3.3.0','trial',NULL,'2021-03-30 13:30:11','2021-03-30 13:30:11','2021-03-30 15:32:01','05f7bcfb-f377-4924-b867-599434fa1be0');
/*!40000 ALTER TABLE `plugins` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `projectconfig`
--

LOCK TABLES `projectconfig` WRITE;
/*!40000 ALTER TABLE `projectconfig` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `projectconfig` VALUES ('dateModified','1617118312'),('email.fromEmail','\"dev@fortytwo.studio\"'),('email.fromName','\"Future Forestry\"'),('email.transportType','\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.0.autocapitalize','true'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.0.autocomplete','false'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.0.autocorrect','true'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.0.class','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.0.disabled','false'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.0.id','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.0.instructions','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.0.label','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.0.max','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.0.min','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.0.name','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.0.orientation','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.0.placeholder','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.0.readonly','false'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.0.requirable','false'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.0.size','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.0.step','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.0.tip','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.0.title','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\EntryTitleField\"'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.0.warning','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.0.width','100'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.1.fieldUid','\"d783368e-a494-4457-9e99-5a027ae72a18\"'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.1.instructions','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.1.label','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.1.required','false'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.1.tip','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.1.warning','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.1.width','100'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.2.fieldUid','\"1d1d5665-5674-4388-8d46-9b87e4dc65d3\"'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.2.instructions','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.2.label','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.2.required','false'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.2.tip','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.2.warning','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.elements.2.width','100'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.name','\"Content\"'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.0.sortOrder','1'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.1.elements.0.fieldUid','\"39237593-ff51-4bd3-851a-a9dfac329c0b\"'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.1.elements.0.instructions','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.1.elements.0.label','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.1.elements.0.required','false'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.1.elements.0.tip','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.1.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.1.elements.0.warning','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.1.elements.0.width','100'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.1.elements.1.fieldUid','\"4184d945-e90d-4433-b1f3-727edf65107e\"'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.1.elements.1.instructions','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.1.elements.1.label','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.1.elements.1.required','false'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.1.elements.1.tip','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.1.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.1.elements.1.warning','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.1.elements.1.width','100'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.1.name','\"Summary\"'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.1.sortOrder','2'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.2.elements.0.fieldUid','\"7c5c4db7-bc5e-4979-a31b-6b7734989556\"'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.2.elements.0.instructions','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.2.elements.0.label','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.2.elements.0.required','false'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.2.elements.0.tip','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.2.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.2.elements.0.warning','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.2.elements.0.width','100'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.2.name','\"SEO\"'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.fieldLayouts.f5c95668-587e-4459-8b0a-5e51bfb4e8e7.tabs.2.sortOrder','3'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.handle','\"homepage\"'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.hasTitleField','true'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.name','\"Homepage\"'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.section','\"32e8ea43-4e6d-46eb-9344-6755923c28de\"'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.sortOrder','1'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.titleFormat','\"{section.name|raw}\"'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.titleTranslationKeyFormat','null'),('entryTypes.369ea60f-6259-4683-adcc-23418cf8285e.titleTranslationMethod','\"site\"'),('fieldGroups.431efb4a-9ace-451f-8b70-aeda20b1f83f.name','\"Globals\"'),('fieldGroups.6b6833e3-09b6-4302-8492-fd06e3f794e4.name','\"Summary\"'),('fieldGroups.70f3e289-0ffa-4d8a-a2a4-e8c6db06ee3c.name','\"Content Builder Fields\"'),('fieldGroups.7bbeec1d-6526-44a3-9897-d6d1e5918a05.name','\"Settings\"'),('fieldGroups.8f3d51d8-227c-42c1-b81e-f3cba4189a99.name','\"SEO\"'),('fieldGroups.b4718bab-e938-4b97-a8e4-adc9fe5f4ca7.name','\"Content Builder\"'),('fieldGroups.eb7f69a9-9a89-4024-ba3f-9154d28ac58c.name','\"Common\"'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.contentColumnType','\"string\"'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.fieldGroup','\"70f3e289-0ffa-4d8a-a2a4-e8c6db06ee3c\"'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.handle','\"image\"'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.instructions','\"\"'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.name','\"Image\"'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.searchable','false'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.settings.allowedKinds.0','\"image\"'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.settings.allowSelfRelations','false'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.settings.allowUploads','true'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.settings.defaultUploadLocationSource','\"volume:27b00051-5d7e-4c72-8d4c-37eb325f3071\"'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.settings.defaultUploadLocationSubpath','\"\"'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.settings.limit','\"1\"'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.settings.localizeRelations','false'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.settings.previewMode','\"full\"'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.settings.restrictFiles','\"1\"'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.settings.selectionLabel','\"\"'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.settings.showSiteMenu','true'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.settings.showUnpermittedFiles','false'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.settings.showUnpermittedVolumes','false'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.settings.singleUploadLocationSource','\"volume:27b00051-5d7e-4c72-8d4c-37eb325f3071\"'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.settings.singleUploadLocationSubpath','\"\"'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.settings.source','null'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.settings.sources','\"*\"'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.settings.targetSiteId','null'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.settings.useSingleFolder','false'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.settings.validateRelatedElements','false'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.settings.viewMode','\"list\"'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.translationKeyFormat','null'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.translationMethod','\"site\"'),('fields.0ffba24e-268b-4f2c-a3f2-ad976b64c979.type','\"craft\\\\fields\\\\Assets\"'),('fields.13d35453-527a-4094-b642-42292f193f8c.contentColumnType','\"string\"'),('fields.13d35453-527a-4094-b642-42292f193f8c.fieldGroup','\"431efb4a-9ace-451f-8b70-aeda20b1f83f\"'),('fields.13d35453-527a-4094-b642-42292f193f8c.handle','\"socialProfiles\"'),('fields.13d35453-527a-4094-b642-42292f193f8c.instructions','\"\"'),('fields.13d35453-527a-4094-b642-42292f193f8c.name','\"Social Profiles\"'),('fields.13d35453-527a-4094-b642-42292f193f8c.searchable','false'),('fields.13d35453-527a-4094-b642-42292f193f8c.settings.columns.__assoc__.0.0','\"f63d3738-c5aa-4de0-84fd-0deb6570d894\"'),('fields.13d35453-527a-4094-b642-42292f193f8c.settings.columns.__assoc__.0.1.__assoc__.0.0','\"width\"'),('fields.13d35453-527a-4094-b642-42292f193f8c.settings.columns.__assoc__.0.1.__assoc__.0.1','\"\"'),('fields.13d35453-527a-4094-b642-42292f193f8c.settings.columns.__assoc__.1.0','\"3037eaf7-b2d6-4e6f-b616-b9911cf6f5c2\"'),('fields.13d35453-527a-4094-b642-42292f193f8c.settings.columns.__assoc__.1.1.__assoc__.0.0','\"width\"'),('fields.13d35453-527a-4094-b642-42292f193f8c.settings.columns.__assoc__.1.1.__assoc__.0.1','\"\"'),('fields.13d35453-527a-4094-b642-42292f193f8c.settings.columns.__assoc__.2.0','\"0b7ca9a0-694c-4733-bfee-d1c56b3aa669\"'),('fields.13d35453-527a-4094-b642-42292f193f8c.settings.columns.__assoc__.2.1.__assoc__.0.0','\"width\"'),('fields.13d35453-527a-4094-b642-42292f193f8c.settings.columns.__assoc__.2.1.__assoc__.0.1','\"\"'),('fields.13d35453-527a-4094-b642-42292f193f8c.settings.columns.__assoc__.3.0','\"d960a7c1-c036-40d9-b547-47325ed6c97b\"'),('fields.13d35453-527a-4094-b642-42292f193f8c.settings.columns.__assoc__.3.1.__assoc__.0.0','\"width\"'),('fields.13d35453-527a-4094-b642-42292f193f8c.settings.columns.__assoc__.3.1.__assoc__.0.1','\"\"'),('fields.13d35453-527a-4094-b642-42292f193f8c.settings.contentTable','\"{{%stc_socialprofiles}}\"'),('fields.13d35453-527a-4094-b642-42292f193f8c.settings.fieldLayout','\"table\"'),('fields.13d35453-527a-4094-b642-42292f193f8c.settings.maxRows','\"\"'),('fields.13d35453-527a-4094-b642-42292f193f8c.settings.minRows','\"\"'),('fields.13d35453-527a-4094-b642-42292f193f8c.settings.placeholderKey','null'),('fields.13d35453-527a-4094-b642-42292f193f8c.settings.propagationMethod','\"all\"'),('fields.13d35453-527a-4094-b642-42292f193f8c.settings.selectionLabel','\"\"'),('fields.13d35453-527a-4094-b642-42292f193f8c.settings.staticField','\"\"'),('fields.13d35453-527a-4094-b642-42292f193f8c.translationKeyFormat','null'),('fields.13d35453-527a-4094-b642-42292f193f8c.translationMethod','\"site\"'),('fields.13d35453-527a-4094-b642-42292f193f8c.type','\"verbb\\\\supertable\\\\fields\\\\SuperTableField\"'),('fields.1d1c9f28-39de-4df6-b077-856d16c001ca.contentColumnType','\"text\"'),('fields.1d1c9f28-39de-4df6-b077-856d16c001ca.fieldGroup','\"70f3e289-0ffa-4d8a-a2a4-e8c6db06ee3c\"'),('fields.1d1c9f28-39de-4df6-b077-856d16c001ca.handle','\"copy\"'),('fields.1d1c9f28-39de-4df6-b077-856d16c001ca.instructions','\"\"'),('fields.1d1c9f28-39de-4df6-b077-856d16c001ca.name','\"Copy\"'),('fields.1d1c9f28-39de-4df6-b077-856d16c001ca.searchable','false'),('fields.1d1c9f28-39de-4df6-b077-856d16c001ca.settings.availableTransforms','\"*\"'),('fields.1d1c9f28-39de-4df6-b077-856d16c001ca.settings.availableVolumes','\"*\"'),('fields.1d1c9f28-39de-4df6-b077-856d16c001ca.settings.cleanupHtml','true'),('fields.1d1c9f28-39de-4df6-b077-856d16c001ca.settings.columnType','\"text\"'),('fields.1d1c9f28-39de-4df6-b077-856d16c001ca.settings.configSelectionMode','\"choose\"'),('fields.1d1c9f28-39de-4df6-b077-856d16c001ca.settings.defaultTransform','\"\"'),('fields.1d1c9f28-39de-4df6-b077-856d16c001ca.settings.manualConfig','\"\"'),('fields.1d1c9f28-39de-4df6-b077-856d16c001ca.settings.purifierConfig','\"\"'),('fields.1d1c9f28-39de-4df6-b077-856d16c001ca.settings.purifyHtml','\"1\"'),('fields.1d1c9f28-39de-4df6-b077-856d16c001ca.settings.redactorConfig','\"\"'),('fields.1d1c9f28-39de-4df6-b077-856d16c001ca.settings.removeEmptyTags','\"1\"'),('fields.1d1c9f28-39de-4df6-b077-856d16c001ca.settings.removeInlineStyles','\"1\"'),('fields.1d1c9f28-39de-4df6-b077-856d16c001ca.settings.removeNbsp','\"1\"'),('fields.1d1c9f28-39de-4df6-b077-856d16c001ca.settings.showHtmlButtonForNonAdmins','\"\"'),('fields.1d1c9f28-39de-4df6-b077-856d16c001ca.settings.showUnpermittedFiles','false'),('fields.1d1c9f28-39de-4df6-b077-856d16c001ca.settings.showUnpermittedVolumes','false'),('fields.1d1c9f28-39de-4df6-b077-856d16c001ca.settings.uiMode','\"enlarged\"'),('fields.1d1c9f28-39de-4df6-b077-856d16c001ca.translationKeyFormat','null'),('fields.1d1c9f28-39de-4df6-b077-856d16c001ca.translationMethod','\"none\"'),('fields.1d1c9f28-39de-4df6-b077-856d16c001ca.type','\"craft\\\\redactor\\\\Field\"'),('fields.1d1d5665-5674-4388-8d46-9b87e4dc65d3.contentColumnType','\"string\"'),('fields.1d1d5665-5674-4388-8d46-9b87e4dc65d3.fieldGroup','\"b4718bab-e938-4b97-a8e4-adc9fe5f4ca7\"'),('fields.1d1d5665-5674-4388-8d46-9b87e4dc65d3.handle','\"contentBuilder\"'),('fields.1d1d5665-5674-4388-8d46-9b87e4dc65d3.instructions','\"\"'),('fields.1d1d5665-5674-4388-8d46-9b87e4dc65d3.name','\"Content Builder\"'),('fields.1d1d5665-5674-4388-8d46-9b87e4dc65d3.searchable','false'),('fields.1d1d5665-5674-4388-8d46-9b87e4dc65d3.settings.maxBlocks','\"\"'),('fields.1d1d5665-5674-4388-8d46-9b87e4dc65d3.settings.maxLevels','\"\"'),('fields.1d1d5665-5674-4388-8d46-9b87e4dc65d3.settings.maxTopBlocks','\"\"'),('fields.1d1d5665-5674-4388-8d46-9b87e4dc65d3.settings.minBlocks','\"\"'),('fields.1d1d5665-5674-4388-8d46-9b87e4dc65d3.settings.propagationMethod','\"all\"'),('fields.1d1d5665-5674-4388-8d46-9b87e4dc65d3.settings.wasModified','false'),('fields.1d1d5665-5674-4388-8d46-9b87e4dc65d3.translationKeyFormat','null'),('fields.1d1d5665-5674-4388-8d46-9b87e4dc65d3.translationMethod','\"site\"'),('fields.1d1d5665-5674-4388-8d46-9b87e4dc65d3.type','\"benf\\\\neo\\\\Field\"'),('fields.2f64efd3-101a-4ed1-a31e-96657d6dc6e5.contentColumnType','\"text\"'),('fields.2f64efd3-101a-4ed1-a31e-96657d6dc6e5.fieldGroup','\"70f3e289-0ffa-4d8a-a2a4-e8c6db06ee3c\"'),('fields.2f64efd3-101a-4ed1-a31e-96657d6dc6e5.handle','\"header\"'),('fields.2f64efd3-101a-4ed1-a31e-96657d6dc6e5.instructions','\"\"'),('fields.2f64efd3-101a-4ed1-a31e-96657d6dc6e5.name','\"Header\"'),('fields.2f64efd3-101a-4ed1-a31e-96657d6dc6e5.searchable','false'),('fields.2f64efd3-101a-4ed1-a31e-96657d6dc6e5.settings.byteLimit','null'),('fields.2f64efd3-101a-4ed1-a31e-96657d6dc6e5.settings.charLimit','null'),('fields.2f64efd3-101a-4ed1-a31e-96657d6dc6e5.settings.code','\"\"'),('fields.2f64efd3-101a-4ed1-a31e-96657d6dc6e5.settings.columnType','null'),('fields.2f64efd3-101a-4ed1-a31e-96657d6dc6e5.settings.initialRows','\"4\"'),('fields.2f64efd3-101a-4ed1-a31e-96657d6dc6e5.settings.multiline','\"\"'),('fields.2f64efd3-101a-4ed1-a31e-96657d6dc6e5.settings.placeholder','null'),('fields.2f64efd3-101a-4ed1-a31e-96657d6dc6e5.settings.uiMode','\"normal\"'),('fields.2f64efd3-101a-4ed1-a31e-96657d6dc6e5.translationKeyFormat','null'),('fields.2f64efd3-101a-4ed1-a31e-96657d6dc6e5.translationMethod','\"none\"'),('fields.2f64efd3-101a-4ed1-a31e-96657d6dc6e5.type','\"craft\\\\fields\\\\PlainText\"'),('fields.336f207f-f4fb-43c3-bbc3-f10b641e940a.contentColumnType','\"text\"'),('fields.336f207f-f4fb-43c3-bbc3-f10b641e940a.fieldGroup','\"7bbeec1d-6526-44a3-9897-d6d1e5918a05\"'),('fields.336f207f-f4fb-43c3-bbc3-f10b641e940a.handle','\"backgroundColor\"'),('fields.336f207f-f4fb-43c3-bbc3-f10b641e940a.instructions','\"\"'),('fields.336f207f-f4fb-43c3-bbc3-f10b641e940a.name','\"Background Color\"'),('fields.336f207f-f4fb-43c3-bbc3-f10b641e940a.searchable','false'),('fields.336f207f-f4fb-43c3-bbc3-f10b641e940a.settings.options.0.__assoc__.0.0','\"label\"'),('fields.336f207f-f4fb-43c3-bbc3-f10b641e940a.settings.options.0.__assoc__.0.1','\"White\"'),('fields.336f207f-f4fb-43c3-bbc3-f10b641e940a.settings.options.0.__assoc__.1.0','\"value\"'),('fields.336f207f-f4fb-43c3-bbc3-f10b641e940a.settings.options.0.__assoc__.1.1','\"bg-white\"'),('fields.336f207f-f4fb-43c3-bbc3-f10b641e940a.settings.options.0.__assoc__.2.0','\"cssColour\"'),('fields.336f207f-f4fb-43c3-bbc3-f10b641e940a.settings.options.0.__assoc__.2.1','\"#FFFFFF\"'),('fields.336f207f-f4fb-43c3-bbc3-f10b641e940a.settings.options.0.__assoc__.3.0','\"default\"'),('fields.336f207f-f4fb-43c3-bbc3-f10b641e940a.settings.options.0.__assoc__.3.1','\"1\"'),('fields.336f207f-f4fb-43c3-bbc3-f10b641e940a.settings.options.1.__assoc__.0.0','\"label\"'),('fields.336f207f-f4fb-43c3-bbc3-f10b641e940a.settings.options.1.__assoc__.0.1','\"Black\"'),('fields.336f207f-f4fb-43c3-bbc3-f10b641e940a.settings.options.1.__assoc__.1.0','\"value\"'),('fields.336f207f-f4fb-43c3-bbc3-f10b641e940a.settings.options.1.__assoc__.1.1','\"bg-black\"'),('fields.336f207f-f4fb-43c3-bbc3-f10b641e940a.settings.options.1.__assoc__.2.0','\"cssColour\"'),('fields.336f207f-f4fb-43c3-bbc3-f10b641e940a.settings.options.1.__assoc__.2.1','\"#000000\"'),('fields.336f207f-f4fb-43c3-bbc3-f10b641e940a.settings.options.1.__assoc__.3.0','\"default\"'),('fields.336f207f-f4fb-43c3-bbc3-f10b641e940a.settings.options.1.__assoc__.3.1','\"\"'),('fields.336f207f-f4fb-43c3-bbc3-f10b641e940a.translationKeyFormat','null'),('fields.336f207f-f4fb-43c3-bbc3-f10b641e940a.translationMethod','\"none\"'),('fields.336f207f-f4fb-43c3-bbc3-f10b641e940a.type','\"supercool\\\\buttonbox\\\\fields\\\\Colours\"'),('fields.386e1cf1-acc9-4336-90e1-fb74daefd6f5.contentColumnType','\"text\"'),('fields.386e1cf1-acc9-4336-90e1-fb74daefd6f5.fieldGroup','\"431efb4a-9ace-451f-8b70-aeda20b1f83f\"'),('fields.386e1cf1-acc9-4336-90e1-fb74daefd6f5.handle','\"phoneNumber\"'),('fields.386e1cf1-acc9-4336-90e1-fb74daefd6f5.instructions','\"\"'),('fields.386e1cf1-acc9-4336-90e1-fb74daefd6f5.name','\"Phone Number\"'),('fields.386e1cf1-acc9-4336-90e1-fb74daefd6f5.searchable','false'),('fields.386e1cf1-acc9-4336-90e1-fb74daefd6f5.settings.byteLimit','null'),('fields.386e1cf1-acc9-4336-90e1-fb74daefd6f5.settings.charLimit','null'),('fields.386e1cf1-acc9-4336-90e1-fb74daefd6f5.settings.code','\"\"'),('fields.386e1cf1-acc9-4336-90e1-fb74daefd6f5.settings.columnType','null'),('fields.386e1cf1-acc9-4336-90e1-fb74daefd6f5.settings.initialRows','\"4\"'),('fields.386e1cf1-acc9-4336-90e1-fb74daefd6f5.settings.multiline','\"\"'),('fields.386e1cf1-acc9-4336-90e1-fb74daefd6f5.settings.placeholder','null'),('fields.386e1cf1-acc9-4336-90e1-fb74daefd6f5.settings.uiMode','\"normal\"'),('fields.386e1cf1-acc9-4336-90e1-fb74daefd6f5.translationKeyFormat','null'),('fields.386e1cf1-acc9-4336-90e1-fb74daefd6f5.translationMethod','\"none\"'),('fields.386e1cf1-acc9-4336-90e1-fb74daefd6f5.type','\"craft\\\\fields\\\\PlainText\"'),('fields.39237593-ff51-4bd3-851a-a9dfac329c0b.contentColumnType','\"text\"'),('fields.39237593-ff51-4bd3-851a-a9dfac329c0b.fieldGroup','\"6b6833e3-09b6-4302-8492-fd06e3f794e4\"'),('fields.39237593-ff51-4bd3-851a-a9dfac329c0b.handle','\"pageSummary\"'),('fields.39237593-ff51-4bd3-851a-a9dfac329c0b.instructions','\"\"'),('fields.39237593-ff51-4bd3-851a-a9dfac329c0b.name','\"Page Summary\"'),('fields.39237593-ff51-4bd3-851a-a9dfac329c0b.searchable','false'),('fields.39237593-ff51-4bd3-851a-a9dfac329c0b.settings.byteLimit','null'),('fields.39237593-ff51-4bd3-851a-a9dfac329c0b.settings.charLimit','null'),('fields.39237593-ff51-4bd3-851a-a9dfac329c0b.settings.code','\"\"'),('fields.39237593-ff51-4bd3-851a-a9dfac329c0b.settings.columnType','null'),('fields.39237593-ff51-4bd3-851a-a9dfac329c0b.settings.initialRows','\"4\"'),('fields.39237593-ff51-4bd3-851a-a9dfac329c0b.settings.multiline','\"\"'),('fields.39237593-ff51-4bd3-851a-a9dfac329c0b.settings.placeholder','null'),('fields.39237593-ff51-4bd3-851a-a9dfac329c0b.settings.uiMode','\"normal\"'),('fields.39237593-ff51-4bd3-851a-a9dfac329c0b.translationKeyFormat','null'),('fields.39237593-ff51-4bd3-851a-a9dfac329c0b.translationMethod','\"none\"'),('fields.39237593-ff51-4bd3-851a-a9dfac329c0b.type','\"craft\\\\fields\\\\PlainText\"'),('fields.3cca813e-09a9-4025-8efa-d5ba11d4dd89.contentColumnType','\"text\"'),('fields.3cca813e-09a9-4025-8efa-d5ba11d4dd89.fieldGroup','\"431efb4a-9ace-451f-8b70-aeda20b1f83f\"'),('fields.3cca813e-09a9-4025-8efa-d5ba11d4dd89.handle','\"email\"'),('fields.3cca813e-09a9-4025-8efa-d5ba11d4dd89.instructions','\"\"'),('fields.3cca813e-09a9-4025-8efa-d5ba11d4dd89.name','\"Email\"'),('fields.3cca813e-09a9-4025-8efa-d5ba11d4dd89.searchable','false'),('fields.3cca813e-09a9-4025-8efa-d5ba11d4dd89.settings.byteLimit','null'),('fields.3cca813e-09a9-4025-8efa-d5ba11d4dd89.settings.charLimit','null'),('fields.3cca813e-09a9-4025-8efa-d5ba11d4dd89.settings.code','\"\"'),('fields.3cca813e-09a9-4025-8efa-d5ba11d4dd89.settings.columnType','null'),('fields.3cca813e-09a9-4025-8efa-d5ba11d4dd89.settings.initialRows','\"4\"'),('fields.3cca813e-09a9-4025-8efa-d5ba11d4dd89.settings.multiline','\"\"'),('fields.3cca813e-09a9-4025-8efa-d5ba11d4dd89.settings.placeholder','null'),('fields.3cca813e-09a9-4025-8efa-d5ba11d4dd89.settings.uiMode','\"normal\"'),('fields.3cca813e-09a9-4025-8efa-d5ba11d4dd89.translationKeyFormat','null'),('fields.3cca813e-09a9-4025-8efa-d5ba11d4dd89.translationMethod','\"none\"'),('fields.3cca813e-09a9-4025-8efa-d5ba11d4dd89.type','\"craft\\\\fields\\\\PlainText\"'),('fields.3f092924-7454-4778-a975-9d6112f3eb20.contentColumnType','\"text\"'),('fields.3f092924-7454-4778-a975-9d6112f3eb20.fieldGroup','\"431efb4a-9ace-451f-8b70-aeda20b1f83f\"'),('fields.3f092924-7454-4778-a975-9d6112f3eb20.handle','\"googleAnalytics\"'),('fields.3f092924-7454-4778-a975-9d6112f3eb20.instructions','\"\"'),('fields.3f092924-7454-4778-a975-9d6112f3eb20.name','\"Google Analytics\"'),('fields.3f092924-7454-4778-a975-9d6112f3eb20.searchable','false'),('fields.3f092924-7454-4778-a975-9d6112f3eb20.settings.availableTransforms','\"*\"'),('fields.3f092924-7454-4778-a975-9d6112f3eb20.settings.availableVolumes','\"*\"'),('fields.3f092924-7454-4778-a975-9d6112f3eb20.settings.cleanupHtml','true'),('fields.3f092924-7454-4778-a975-9d6112f3eb20.settings.columnType','\"text\"'),('fields.3f092924-7454-4778-a975-9d6112f3eb20.settings.configSelectionMode','\"choose\"'),('fields.3f092924-7454-4778-a975-9d6112f3eb20.settings.defaultTransform','\"\"'),('fields.3f092924-7454-4778-a975-9d6112f3eb20.settings.manualConfig','\"\"'),('fields.3f092924-7454-4778-a975-9d6112f3eb20.settings.purifierConfig','\"\"'),('fields.3f092924-7454-4778-a975-9d6112f3eb20.settings.purifyHtml','\"1\"'),('fields.3f092924-7454-4778-a975-9d6112f3eb20.settings.redactorConfig','\"\"'),('fields.3f092924-7454-4778-a975-9d6112f3eb20.settings.removeEmptyTags','\"1\"'),('fields.3f092924-7454-4778-a975-9d6112f3eb20.settings.removeInlineStyles','\"1\"'),('fields.3f092924-7454-4778-a975-9d6112f3eb20.settings.removeNbsp','\"1\"'),('fields.3f092924-7454-4778-a975-9d6112f3eb20.settings.showHtmlButtonForNonAdmins','\"\"'),('fields.3f092924-7454-4778-a975-9d6112f3eb20.settings.showUnpermittedFiles','false'),('fields.3f092924-7454-4778-a975-9d6112f3eb20.settings.showUnpermittedVolumes','false'),('fields.3f092924-7454-4778-a975-9d6112f3eb20.settings.uiMode','\"enlarged\"'),('fields.3f092924-7454-4778-a975-9d6112f3eb20.translationKeyFormat','null'),('fields.3f092924-7454-4778-a975-9d6112f3eb20.translationMethod','\"none\"'),('fields.3f092924-7454-4778-a975-9d6112f3eb20.type','\"craft\\\\redactor\\\\Field\"'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.contentColumnType','\"string\"'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.fieldGroup','\"6b6833e3-09b6-4302-8492-fd06e3f794e4\"'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.handle','\"summaryImage\"'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.instructions','\"\"'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.name','\"Summary Image\"'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.searchable','false'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.settings.allowedKinds.0','\"image\"'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.settings.allowSelfRelations','false'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.settings.allowUploads','true'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.settings.defaultUploadLocationSource','\"volume:27b00051-5d7e-4c72-8d4c-37eb325f3071\"'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.settings.defaultUploadLocationSubpath','\"\"'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.settings.limit','\"1\"'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.settings.localizeRelations','false'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.settings.previewMode','\"full\"'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.settings.restrictFiles','\"1\"'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.settings.selectionLabel','\"\"'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.settings.showSiteMenu','true'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.settings.showUnpermittedFiles','false'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.settings.showUnpermittedVolumes','false'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.settings.singleUploadLocationSource','\"volume:27b00051-5d7e-4c72-8d4c-37eb325f3071\"'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.settings.singleUploadLocationSubpath','\"\"'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.settings.source','null'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.settings.sources','\"*\"'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.settings.targetSiteId','null'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.settings.useSingleFolder','false'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.settings.validateRelatedElements','false'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.settings.viewMode','\"list\"'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.translationKeyFormat','null'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.translationMethod','\"site\"'),('fields.4184d945-e90d-4433-b1f3-727edf65107e.type','\"craft\\\\fields\\\\Assets\"'),('fields.4870444e-6820-4ab0-a141-99e310305629.contentColumnType','\"string\"'),('fields.4870444e-6820-4ab0-a141-99e310305629.fieldGroup','\"70f3e289-0ffa-4d8a-a2a4-e8c6db06ee3c\"'),('fields.4870444e-6820-4ab0-a141-99e310305629.handle','\"backgroundImage\"'),('fields.4870444e-6820-4ab0-a141-99e310305629.instructions','\"\"'),('fields.4870444e-6820-4ab0-a141-99e310305629.name','\"Background Image\"'),('fields.4870444e-6820-4ab0-a141-99e310305629.searchable','false'),('fields.4870444e-6820-4ab0-a141-99e310305629.settings.allowedKinds.0','\"image\"'),('fields.4870444e-6820-4ab0-a141-99e310305629.settings.allowSelfRelations','false'),('fields.4870444e-6820-4ab0-a141-99e310305629.settings.allowUploads','true'),('fields.4870444e-6820-4ab0-a141-99e310305629.settings.defaultUploadLocationSource','\"volume:27b00051-5d7e-4c72-8d4c-37eb325f3071\"'),('fields.4870444e-6820-4ab0-a141-99e310305629.settings.defaultUploadLocationSubpath','\"\"'),('fields.4870444e-6820-4ab0-a141-99e310305629.settings.limit','\"1\"'),('fields.4870444e-6820-4ab0-a141-99e310305629.settings.localizeRelations','false'),('fields.4870444e-6820-4ab0-a141-99e310305629.settings.previewMode','\"full\"'),('fields.4870444e-6820-4ab0-a141-99e310305629.settings.restrictFiles','\"1\"'),('fields.4870444e-6820-4ab0-a141-99e310305629.settings.selectionLabel','\"\"'),('fields.4870444e-6820-4ab0-a141-99e310305629.settings.showSiteMenu','true'),('fields.4870444e-6820-4ab0-a141-99e310305629.settings.showUnpermittedFiles','false'),('fields.4870444e-6820-4ab0-a141-99e310305629.settings.showUnpermittedVolumes','false'),('fields.4870444e-6820-4ab0-a141-99e310305629.settings.singleUploadLocationSource','\"volume:27b00051-5d7e-4c72-8d4c-37eb325f3071\"'),('fields.4870444e-6820-4ab0-a141-99e310305629.settings.singleUploadLocationSubpath','\"\"'),('fields.4870444e-6820-4ab0-a141-99e310305629.settings.source','null'),('fields.4870444e-6820-4ab0-a141-99e310305629.settings.sources','\"*\"'),('fields.4870444e-6820-4ab0-a141-99e310305629.settings.targetSiteId','null'),('fields.4870444e-6820-4ab0-a141-99e310305629.settings.useSingleFolder','false'),('fields.4870444e-6820-4ab0-a141-99e310305629.settings.validateRelatedElements','false'),('fields.4870444e-6820-4ab0-a141-99e310305629.settings.viewMode','\"list\"'),('fields.4870444e-6820-4ab0-a141-99e310305629.translationKeyFormat','null'),('fields.4870444e-6820-4ab0-a141-99e310305629.translationMethod','\"site\"'),('fields.4870444e-6820-4ab0-a141-99e310305629.type','\"craft\\\\fields\\\\Assets\"'),('fields.4af3caf9-e4e3-4acd-90f8-1e8cd585e497.contentColumnType','\"text\"'),('fields.4af3caf9-e4e3-4acd-90f8-1e8cd585e497.fieldGroup','\"431efb4a-9ace-451f-8b70-aeda20b1f83f\"'),('fields.4af3caf9-e4e3-4acd-90f8-1e8cd585e497.handle','\"address\"'),('fields.4af3caf9-e4e3-4acd-90f8-1e8cd585e497.instructions','\"\"'),('fields.4af3caf9-e4e3-4acd-90f8-1e8cd585e497.name','\"Address\"'),('fields.4af3caf9-e4e3-4acd-90f8-1e8cd585e497.searchable','false'),('fields.4af3caf9-e4e3-4acd-90f8-1e8cd585e497.settings.availableTransforms','\"*\"'),('fields.4af3caf9-e4e3-4acd-90f8-1e8cd585e497.settings.availableVolumes','\"*\"'),('fields.4af3caf9-e4e3-4acd-90f8-1e8cd585e497.settings.cleanupHtml','true'),('fields.4af3caf9-e4e3-4acd-90f8-1e8cd585e497.settings.columnType','\"text\"'),('fields.4af3caf9-e4e3-4acd-90f8-1e8cd585e497.settings.configSelectionMode','\"choose\"'),('fields.4af3caf9-e4e3-4acd-90f8-1e8cd585e497.settings.defaultTransform','\"\"'),('fields.4af3caf9-e4e3-4acd-90f8-1e8cd585e497.settings.manualConfig','\"\"'),('fields.4af3caf9-e4e3-4acd-90f8-1e8cd585e497.settings.purifierConfig','\"\"'),('fields.4af3caf9-e4e3-4acd-90f8-1e8cd585e497.settings.purifyHtml','\"1\"'),('fields.4af3caf9-e4e3-4acd-90f8-1e8cd585e497.settings.redactorConfig','\"\"'),('fields.4af3caf9-e4e3-4acd-90f8-1e8cd585e497.settings.removeEmptyTags','\"1\"'),('fields.4af3caf9-e4e3-4acd-90f8-1e8cd585e497.settings.removeInlineStyles','\"1\"'),('fields.4af3caf9-e4e3-4acd-90f8-1e8cd585e497.settings.removeNbsp','\"1\"'),('fields.4af3caf9-e4e3-4acd-90f8-1e8cd585e497.settings.showHtmlButtonForNonAdmins','\"\"'),('fields.4af3caf9-e4e3-4acd-90f8-1e8cd585e497.settings.showUnpermittedFiles','false'),('fields.4af3caf9-e4e3-4acd-90f8-1e8cd585e497.settings.showUnpermittedVolumes','false'),('fields.4af3caf9-e4e3-4acd-90f8-1e8cd585e497.settings.uiMode','\"enlarged\"'),('fields.4af3caf9-e4e3-4acd-90f8-1e8cd585e497.translationKeyFormat','null'),('fields.4af3caf9-e4e3-4acd-90f8-1e8cd585e497.translationMethod','\"none\"'),('fields.4af3caf9-e4e3-4acd-90f8-1e8cd585e497.type','\"craft\\\\redactor\\\\Field\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.contentColumnType','\"text\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.fieldGroup','\"7bbeec1d-6526-44a3-9897-d6d1e5918a05\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.handle','\"bottomSpacing\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.instructions','\"\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.name','\"Bottom Spacing\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.searchable','false'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.displayAsGraphic','\"\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.displayFullwidth','\"\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.0.__assoc__.0.0','\"label\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.0.__assoc__.0.1','\"None\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.0.__assoc__.1.0','\"showLabel\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.0.__assoc__.1.1','\"1\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.0.__assoc__.2.0','\"value\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.0.__assoc__.2.1','\"pb-default\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.0.__assoc__.3.0','\"imageUrl\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.0.__assoc__.3.1','\"\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.0.__assoc__.4.0','\"default\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.0.__assoc__.4.1','\"1\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.1.__assoc__.0.0','\"label\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.1.__assoc__.0.1','\"Normal\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.1.__assoc__.1.0','\"showLabel\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.1.__assoc__.1.1','\"1\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.1.__assoc__.2.0','\"value\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.1.__assoc__.2.1','\"pb-lg-3 pb-md-3 pb-3\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.1.__assoc__.3.0','\"imageUrl\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.1.__assoc__.3.1','\"\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.1.__assoc__.4.0','\"default\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.1.__assoc__.4.1','\"\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.2.__assoc__.0.0','\"label\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.2.__assoc__.0.1','\"Larger\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.2.__assoc__.1.0','\"showLabel\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.2.__assoc__.1.1','\"1\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.2.__assoc__.2.0','\"value\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.2.__assoc__.2.1','\"pb-lg-5 pb-md-5 pb-4\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.2.__assoc__.3.0','\"imageUrl\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.2.__assoc__.3.1','\"\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.2.__assoc__.4.0','\"default\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.settings.options.2.__assoc__.4.1','\"\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.translationKeyFormat','null'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.translationMethod','\"none\"'),('fields.6c4a2320-184d-4f3b-9482-070fc8b8194a.type','\"supercool\\\\buttonbox\\\\fields\\\\Buttons\"'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.contentColumnType','\"text\"'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.fieldGroup','\"8f3d51d8-227c-42c1-b81e-f3cba4189a99\"'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.handle','\"seo\"'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.instructions','\"\"'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.name','\"SEO\"'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.searchable','false'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.settings.description','\"\"'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.settings.hideSocial','\"\"'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.settings.robots.0','\"\"'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.settings.robots.1','\"\"'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.settings.robots.2','\"\"'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.settings.robots.3','\"\"'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.settings.robots.4','\"\"'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.settings.robots.5','\"\"'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.settings.socialImage','null'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.settings.suffixAsPrefix','null'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.settings.title.0.__assoc__.0.0','\"key\"'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.settings.title.0.__assoc__.0.1','\"1\"'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.settings.title.0.__assoc__.1.0','\"locked\"'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.settings.title.0.__assoc__.1.1','\"0\"'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.settings.title.0.__assoc__.2.0','\"template\"'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.settings.title.0.__assoc__.2.1','\"{title}\"'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.settings.title.1.__assoc__.0.0','\"key\"'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.settings.title.1.__assoc__.0.1','\"2\"'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.settings.title.1.__assoc__.1.0','\"locked\"'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.settings.title.1.__assoc__.1.1','\"1\"'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.settings.title.1.__assoc__.2.0','\"template\"'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.settings.title.1.__assoc__.2.1','\" - {{ siteName }}\"'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.settings.titleSuffix','null'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.translationKeyFormat','null'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.translationMethod','\"none\"'),('fields.7c5c4db7-bc5e-4979-a31b-6b7734989556.type','\"ether\\\\seo\\\\fields\\\\SeoField\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.contentColumnType','\"text\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.fieldGroup','\"7bbeec1d-6526-44a3-9897-d6d1e5918a05\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.handle','\"topSpacing\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.instructions','\"\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.name','\"Top Spacing\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.searchable','false'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.displayAsGraphic','\"\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.displayFullwidth','\"\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.0.__assoc__.0.0','\"label\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.0.__assoc__.0.1','\"None\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.0.__assoc__.1.0','\"showLabel\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.0.__assoc__.1.1','\"1\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.0.__assoc__.2.0','\"value\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.0.__assoc__.2.1','\"pt-default\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.0.__assoc__.3.0','\"imageUrl\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.0.__assoc__.3.1','\"\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.0.__assoc__.4.0','\"default\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.0.__assoc__.4.1','\"1\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.1.__assoc__.0.0','\"label\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.1.__assoc__.0.1','\"Normal\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.1.__assoc__.1.0','\"showLabel\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.1.__assoc__.1.1','\"1\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.1.__assoc__.2.0','\"value\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.1.__assoc__.2.1','\"pt-lg-3 pt-md-3 pt-3\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.1.__assoc__.3.0','\"imageUrl\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.1.__assoc__.3.1','\"\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.1.__assoc__.4.0','\"default\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.1.__assoc__.4.1','\"\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.2.__assoc__.0.0','\"label\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.2.__assoc__.0.1','\"Large\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.2.__assoc__.1.0','\"showLabel\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.2.__assoc__.1.1','\"1\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.2.__assoc__.2.0','\"value\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.2.__assoc__.2.1','\"pt-lg-5 pt-md-5 pt-4\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.2.__assoc__.3.0','\"imageUrl\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.2.__assoc__.3.1','\"\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.2.__assoc__.4.0','\"default\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.settings.options.2.__assoc__.4.1','\"\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.translationKeyFormat','null'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.translationMethod','\"none\"'),('fields.bb3731df-a01f-4725-9f8b-06d99359fd9f.type','\"supercool\\\\buttonbox\\\\fields\\\\Buttons\"'),('fields.d783368e-a494-4457-9e99-5a027ae72a18.contentColumnType','\"string\"'),('fields.d783368e-a494-4457-9e99-5a027ae72a18.fieldGroup','\"b4718bab-e938-4b97-a8e4-adc9fe5f4ca7\"'),('fields.d783368e-a494-4457-9e99-5a027ae72a18.handle','\"pageHeader\"'),('fields.d783368e-a494-4457-9e99-5a027ae72a18.instructions','\"\"'),('fields.d783368e-a494-4457-9e99-5a027ae72a18.name','\"Page Header\"'),('fields.d783368e-a494-4457-9e99-5a027ae72a18.searchable','false'),('fields.d783368e-a494-4457-9e99-5a027ae72a18.settings.maxBlocks','\"1\"'),('fields.d783368e-a494-4457-9e99-5a027ae72a18.settings.maxLevels','\"\"'),('fields.d783368e-a494-4457-9e99-5a027ae72a18.settings.maxTopBlocks','\"\"'),('fields.d783368e-a494-4457-9e99-5a027ae72a18.settings.minBlocks','\"\"'),('fields.d783368e-a494-4457-9e99-5a027ae72a18.settings.propagationMethod','\"all\"'),('fields.d783368e-a494-4457-9e99-5a027ae72a18.settings.wasModified','false'),('fields.d783368e-a494-4457-9e99-5a027ae72a18.translationKeyFormat','null'),('fields.d783368e-a494-4457-9e99-5a027ae72a18.translationMethod','\"site\"'),('fields.d783368e-a494-4457-9e99-5a027ae72a18.type','\"benf\\\\neo\\\\Field\"'),('globalSets.5d2dca76-1ede-413a-8adf-b4a756ed42ae.fieldLayouts.f2d8768a-cbb9-4a52-a62f-3cebeccc956b.tabs.0.elements.0.fieldUid','\"3f092924-7454-4778-a975-9d6112f3eb20\"'),('globalSets.5d2dca76-1ede-413a-8adf-b4a756ed42ae.fieldLayouts.f2d8768a-cbb9-4a52-a62f-3cebeccc956b.tabs.0.elements.0.instructions','null'),('globalSets.5d2dca76-1ede-413a-8adf-b4a756ed42ae.fieldLayouts.f2d8768a-cbb9-4a52-a62f-3cebeccc956b.tabs.0.elements.0.label','null'),('globalSets.5d2dca76-1ede-413a-8adf-b4a756ed42ae.fieldLayouts.f2d8768a-cbb9-4a52-a62f-3cebeccc956b.tabs.0.elements.0.required','false'),('globalSets.5d2dca76-1ede-413a-8adf-b4a756ed42ae.fieldLayouts.f2d8768a-cbb9-4a52-a62f-3cebeccc956b.tabs.0.elements.0.tip','null'),('globalSets.5d2dca76-1ede-413a-8adf-b4a756ed42ae.fieldLayouts.f2d8768a-cbb9-4a52-a62f-3cebeccc956b.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.5d2dca76-1ede-413a-8adf-b4a756ed42ae.fieldLayouts.f2d8768a-cbb9-4a52-a62f-3cebeccc956b.tabs.0.elements.0.warning','null'),('globalSets.5d2dca76-1ede-413a-8adf-b4a756ed42ae.fieldLayouts.f2d8768a-cbb9-4a52-a62f-3cebeccc956b.tabs.0.elements.0.width','100'),('globalSets.5d2dca76-1ede-413a-8adf-b4a756ed42ae.fieldLayouts.f2d8768a-cbb9-4a52-a62f-3cebeccc956b.tabs.0.name','\"Content\"'),('globalSets.5d2dca76-1ede-413a-8adf-b4a756ed42ae.fieldLayouts.f2d8768a-cbb9-4a52-a62f-3cebeccc956b.tabs.0.sortOrder','1'),('globalSets.5d2dca76-1ede-413a-8adf-b4a756ed42ae.handle','\"siteInfo\"'),('globalSets.5d2dca76-1ede-413a-8adf-b4a756ed42ae.name','\"Site Info\"'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.0.fieldUid','\"4af3caf9-e4e3-4acd-90f8-1e8cd585e497\"'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.0.instructions','null'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.0.label','null'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.0.required','false'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.0.tip','null'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.0.warning','null'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.0.width','100'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.1.fieldUid','\"3cca813e-09a9-4025-8efa-d5ba11d4dd89\"'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.1.instructions','null'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.1.label','null'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.1.required','false'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.1.tip','null'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.1.warning','null'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.1.width','100'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.2.fieldUid','\"386e1cf1-acc9-4336-90e1-fb74daefd6f5\"'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.2.instructions','null'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.2.label','null'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.2.required','false'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.2.tip','null'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.2.warning','null'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.2.width','100'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.3.fieldUid','\"13d35453-527a-4094-b642-42292f193f8c\"'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.3.instructions','null'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.3.label','null'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.3.required','false'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.3.tip','null'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.3.warning','null'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.elements.3.width','100'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.name','\"Content\"'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.fieldLayouts.d4df5b39-edcc-44f4-9b34-c6e29bad800d.tabs.0.sortOrder','1'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.handle','\"companyInfo\"'),('globalSets.7fc480fa-d689-40a4-9f68-2e36e07830d5.name','\"Company Info\"'),('neoBlockTypeGroups.9c3f9dfb-fbb4-4ab1-b8db-5dc9b6045f2d.field','\"1d1d5665-5674-4388-8d46-9b87e4dc65d3\"'),('neoBlockTypeGroups.9c3f9dfb-fbb4-4ab1-b8db-5dc9b6045f2d.name','\"Blocks\"'),('neoBlockTypeGroups.9c3f9dfb-fbb4-4ab1-b8db-5dc9b6045f2d.sortOrder','4'),('neoBlockTypeGroups.dcc7e763-cfad-42ba-a4ed-f0c111f2446b.field','\"1d1d5665-5674-4388-8d46-9b87e4dc65d3\"'),('neoBlockTypeGroups.dcc7e763-cfad-42ba-a4ed-f0c111f2446b.name','\"Media\"'),('neoBlockTypeGroups.dcc7e763-cfad-42ba-a4ed-f0c111f2446b.sortOrder','1'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.childBlocks','\"\"'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.field','\"d783368e-a494-4457-9e99-5a027ae72a18\"'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.0.elements.0.fieldUid','\"2f64efd3-101a-4ed1-a31e-96657d6dc6e5\"'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.0.elements.0.instructions','null'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.0.elements.0.label','null'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.0.elements.0.required','false'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.0.elements.0.tip','null'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.0.elements.0.warning','null'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.0.elements.0.width','100'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.0.elements.1.fieldUid','\"1d1c9f28-39de-4df6-b077-856d16c001ca\"'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.0.elements.1.instructions','null'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.0.elements.1.label','null'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.0.elements.1.required','false'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.0.elements.1.tip','null'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.0.elements.1.warning','null'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.0.elements.1.width','100'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.0.elements.2.fieldUid','\"4870444e-6820-4ab0-a141-99e310305629\"'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.0.elements.2.instructions','null'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.0.elements.2.label','null'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.0.elements.2.required','false'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.0.elements.2.tip','null'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.0.elements.2.warning','null'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.0.elements.2.width','100'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.0.name','\"Main Content\"'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.0.sortOrder','1'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.1.elements.0.fieldUid','\"336f207f-f4fb-43c3-bbc3-f10b641e940a\"'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.1.elements.0.instructions','null'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.1.elements.0.label','null'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.1.elements.0.required','false'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.1.elements.0.tip','null'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.1.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.1.elements.0.warning','null'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.1.elements.0.width','100'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.1.elements.1.fieldUid','\"6c4a2320-184d-4f3b-9482-070fc8b8194a\"'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.1.elements.1.instructions','null'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.1.elements.1.label','null'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.1.elements.1.required','false'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.1.elements.1.tip','null'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.1.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.1.elements.1.warning','null'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.1.elements.1.width','100'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.1.elements.2.fieldUid','\"bb3731df-a01f-4725-9f8b-06d99359fd9f\"'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.1.elements.2.instructions','null'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.1.elements.2.label','null'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.1.elements.2.required','false'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.1.elements.2.tip','null'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.1.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.1.elements.2.warning','null'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.1.elements.2.width','100'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.1.name','\"Settings\"'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.fieldLayouts.6b4ac8f3-0289-4f15-a21e-a56d7c9cab3a.tabs.1.sortOrder','2'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.handle','\"mainHeader\"'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.maxBlocks','0'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.maxChildBlocks','0'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.maxSiblingBlocks','0'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.name','\"Main Header\"'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.sortOrder','1'),('neoBlockTypes.1af5640c-d8b3-4503-89a1-8d0581554915.topLevel','true'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.childBlocks','\"\"'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.field','\"1d1d5665-5674-4388-8d46-9b87e4dc65d3\"'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.0.elements.0.fieldUid','\"1d1c9f28-39de-4df6-b077-856d16c001ca\"'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.0.elements.0.instructions','null'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.0.elements.0.label','null'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.0.elements.0.required','false'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.0.elements.0.tip','null'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.0.elements.0.warning','null'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.0.elements.0.width','100'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.0.name','\"Main Content\"'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.0.sortOrder','1'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.1.elements.0.fieldUid','\"336f207f-f4fb-43c3-bbc3-f10b641e940a\"'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.1.elements.0.instructions','null'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.1.elements.0.label','null'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.1.elements.0.required','false'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.1.elements.0.tip','null'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.1.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.1.elements.0.warning','null'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.1.elements.0.width','100'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.1.elements.1.fieldUid','\"6c4a2320-184d-4f3b-9482-070fc8b8194a\"'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.1.elements.1.instructions','null'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.1.elements.1.label','null'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.1.elements.1.required','false'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.1.elements.1.tip','null'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.1.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.1.elements.1.warning','null'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.1.elements.1.width','100'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.1.elements.2.fieldUid','\"bb3731df-a01f-4725-9f8b-06d99359fd9f\"'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.1.elements.2.instructions','null'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.1.elements.2.label','null'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.1.elements.2.required','false'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.1.elements.2.tip','null'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.1.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.1.elements.2.warning','null'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.1.elements.2.width','100'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.1.name','\"Settings\"'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.fieldLayouts.09f21b0b-1728-4107-8524-245797d45dd7.tabs.1.sortOrder','2'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.handle','\"copy\"'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.maxBlocks','0'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.maxChildBlocks','0'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.maxSiblingBlocks','0'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.name','\"Copy\"'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.sortOrder','2'),('neoBlockTypes.4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83.topLevel','true'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.childBlocks','\"\"'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.field','\"1d1d5665-5674-4388-8d46-9b87e4dc65d3\"'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.0.elements.0.fieldUid','\"0ffba24e-268b-4f2c-a3f2-ad976b64c979\"'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.0.elements.0.instructions','null'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.0.elements.0.label','null'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.0.elements.0.required','false'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.0.elements.0.tip','null'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.0.elements.0.warning','null'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.0.elements.0.width','100'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.0.name','\"Main Content\"'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.0.sortOrder','1'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.1.elements.0.fieldUid','\"336f207f-f4fb-43c3-bbc3-f10b641e940a\"'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.1.elements.0.instructions','null'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.1.elements.0.label','null'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.1.elements.0.required','false'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.1.elements.0.tip','null'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.1.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.1.elements.0.warning','null'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.1.elements.0.width','100'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.1.elements.1.fieldUid','\"6c4a2320-184d-4f3b-9482-070fc8b8194a\"'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.1.elements.1.instructions','null'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.1.elements.1.label','null'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.1.elements.1.required','false'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.1.elements.1.tip','null'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.1.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.1.elements.1.warning','null'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.1.elements.1.width','100'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.1.elements.2.fieldUid','\"bb3731df-a01f-4725-9f8b-06d99359fd9f\"'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.1.elements.2.instructions','null'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.1.elements.2.label','null'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.1.elements.2.required','false'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.1.elements.2.tip','null'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.1.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.1.elements.2.warning','null'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.1.elements.2.width','100'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.1.name','\"Settings\"'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.fieldLayouts.54d12f2e-2177-456e-a4b5-4e0803e641b5.tabs.1.sortOrder','2'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.handle','\"image\"'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.maxBlocks','0'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.maxChildBlocks','0'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.maxSiblingBlocks','0'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.name','\"Image\"'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.sortOrder','3'),('neoBlockTypes.f122d996-7ed0-4bc1-ad02-50e74deac2df.topLevel','true'),('plugins.aws-s3.edition','\"standard\"'),('plugins.aws-s3.enabled','true'),('plugins.aws-s3.schemaVersion','\"1.2\"'),('plugins.buttonbox.edition','\"standard\"'),('plugins.buttonbox.enabled','true'),('plugins.buttonbox.schemaVersion','\"1.0.0\"'),('plugins.freeform.edition','\"lite\"'),('plugins.freeform.enabled','true'),('plugins.freeform.licenseKey','\"G1OSD5DGMQDOF1ZPWRHTAK3J\"'),('plugins.freeform.schemaVersion','\"3.3.0\"'),('plugins.freeform.settings.ajaxByDefault','true'),('plugins.freeform.settings.alertNotificationRecipients','null'),('plugins.freeform.settings.autoScrollToErrors','true'),('plugins.freeform.settings.badgeType','\"all\"'),('plugins.freeform.settings.blockedEmails','null'),('plugins.freeform.settings.blockedEmailsError','\"Invalid Email Address\"'),('plugins.freeform.settings.blockedIpAddresses','null'),('plugins.freeform.settings.blockedKeywords','null'),('plugins.freeform.settings.blockedKeywordsError','\"Invalid Entry Data\"'),('plugins.freeform.settings.clientDigestFrequency','1'),('plugins.freeform.settings.clientDigestRecipients','null'),('plugins.freeform.settings.customErrorMessage','null'),('plugins.freeform.settings.customHoneypotName','null'),('plugins.freeform.settings.defaultTemplates','true'),('plugins.freeform.settings.defaultView','\"dashboard\"'),('plugins.freeform.settings.digestFrequency','1'),('plugins.freeform.settings.digestOnlyOnProduction','false'),('plugins.freeform.settings.digestRecipients','null'),('plugins.freeform.settings.displayFeed','true'),('plugins.freeform.settings.emailTemplateDirectory','null'),('plugins.freeform.settings.emailTemplateStorage','\"db\"'),('plugins.freeform.settings.fieldDisplayOrder','\"name\"'),('plugins.freeform.settings.fillWithGet','false'),('plugins.freeform.settings.footerScripts','false'),('plugins.freeform.settings.formattingTemplate','\"flexbox.html\"'),('plugins.freeform.settings.formSubmitDisable','true'),('plugins.freeform.settings.formSubmitExpiration','null'),('plugins.freeform.settings.formTemplateDirectory','null'),('plugins.freeform.settings.freeformHoneypot','true'),('plugins.freeform.settings.freeformHoneypotEnhancement','false'),('plugins.freeform.settings.hideBannerDemo','true'),('plugins.freeform.settings.hideBannerOldFreeform','false'),('plugins.freeform.settings.minimumSubmitTime','null'),('plugins.freeform.settings.pluginName','null'),('plugins.freeform.settings.purgableSpamAgeInDays','null'),('plugins.freeform.settings.purgableSubmissionAgeInDays','null'),('plugins.freeform.settings.purgableUnfinalizedAssetAgeInMinutes','180'),('plugins.freeform.settings.recaptchaBehaviour','\"display_error\"'),('plugins.freeform.settings.recaptchaEnabled','\"\"'),('plugins.freeform.settings.recaptchaErrorMessage','\"Please verify that you are not a robot.\"'),('plugins.freeform.settings.recaptchaKey','\"6Ld4jYAaAAAAABhDk0P5QXtr8pop2g6DvJ5iOg6E\"'),('plugins.freeform.settings.recaptchaMinScore','\"0.5\"'),('plugins.freeform.settings.recaptchaSecret','\"6Ld4jYAaAAAAAE5wnMBwPoYrZEyYvFLM30ll7yLJ\"'),('plugins.freeform.settings.recaptchaSize','\"normal\"'),('plugins.freeform.settings.recaptchaTheme','\"light\"'),('plugins.freeform.settings.recaptchaType','\"v2_checkbox\"'),('plugins.freeform.settings.removeNewlines','false'),('plugins.freeform.settings.renderFormHtmlInCpViews','true'),('plugins.freeform.settings.salesforce_client_id','null'),('plugins.freeform.settings.salesforce_client_secret','null'),('plugins.freeform.settings.salesforce_password','null'),('plugins.freeform.settings.salesforce_username','null'),('plugins.freeform.settings.scriptInsertLocation','\"footer\"'),('plugins.freeform.settings.sessionEntryMaxCount','50'),('plugins.freeform.settings.sessionEntryTTL','10800'),('plugins.freeform.settings.showErrorsForBlockedEmails','false'),('plugins.freeform.settings.showErrorsForBlockedKeywords','false'),('plugins.freeform.settings.showTutorial','false'),('plugins.freeform.settings.spamFolderEnabled','true'),('plugins.freeform.settings.spamProtectionBehaviour','\"simulate_success\"'),('plugins.freeform.settings.submissionThrottlingCount','null'),('plugins.freeform.settings.submissionThrottlingTimeFrame','null'),('plugins.freeform.settings.twigInHtml','true'),('plugins.freeform.settings.twigInHtmlIsolatedMode','true'),('plugins.freeform.settings.updateSearchIndexes','true'),('plugins.navigation.edition','\"standard\"'),('plugins.navigation.enabled','true'),('plugins.navigation.licenseKey','\"R3VO5MHTQ00EOEKHK3EANI9N\"'),('plugins.navigation.schemaVersion','\"1.0.21\"'),('plugins.neo.edition','\"standard\"'),('plugins.neo.enabled','true'),('plugins.neo.licenseKey','\"6CVLNUD6DPTQ61KABAO823E5\"'),('plugins.neo.schemaVersion','\"2.8.16\"'),('plugins.redactor.edition','\"standard\"'),('plugins.redactor.enabled','true'),('plugins.redactor.schemaVersion','\"2.3.0\"'),('plugins.seo.edition','\"standard\"'),('plugins.seo.enabled','true'),('plugins.seo.schemaVersion','\"3.1.1\"'),('plugins.super-table.edition','\"standard\"'),('plugins.super-table.enabled','true'),('plugins.super-table.schemaVersion','\"2.2.1\"'),('sections.32e8ea43-4e6d-46eb-9344-6755923c28de.enableVersioning','true'),('sections.32e8ea43-4e6d-46eb-9344-6755923c28de.handle','\"homepage\"'),('sections.32e8ea43-4e6d-46eb-9344-6755923c28de.name','\"Homepage\"'),('sections.32e8ea43-4e6d-46eb-9344-6755923c28de.propagationMethod','\"all\"'),('sections.32e8ea43-4e6d-46eb-9344-6755923c28de.siteSettings.18d78006-3985-4ea4-b620-67bae10d9c2d.enabledByDefault','true'),('sections.32e8ea43-4e6d-46eb-9344-6755923c28de.siteSettings.18d78006-3985-4ea4-b620-67bae10d9c2d.hasUrls','true'),('sections.32e8ea43-4e6d-46eb-9344-6755923c28de.siteSettings.18d78006-3985-4ea4-b620-67bae10d9c2d.template','\"index\"'),('sections.32e8ea43-4e6d-46eb-9344-6755923c28de.siteSettings.18d78006-3985-4ea4-b620-67bae10d9c2d.uriFormat','\"__home__\"'),('sections.32e8ea43-4e6d-46eb-9344-6755923c28de.type','\"single\"'),('siteGroups.f99d20c5-6966-4180-8dc1-595df3b8f876.name','\"Craft CMS Boilerplate\"'),('sites.18d78006-3985-4ea4-b620-67bae10d9c2d.baseUrl','\"$PRIMARY_SITE_URL\"'),('sites.18d78006-3985-4ea4-b620-67bae10d9c2d.enabled','true'),('sites.18d78006-3985-4ea4-b620-67bae10d9c2d.handle','\"default\"'),('sites.18d78006-3985-4ea4-b620-67bae10d9c2d.hasUrls','true'),('sites.18d78006-3985-4ea4-b620-67bae10d9c2d.language','\"en-GB\"'),('sites.18d78006-3985-4ea4-b620-67bae10d9c2d.name','\"Craft CMS Boilerplate\"'),('sites.18d78006-3985-4ea4-b620-67bae10d9c2d.primary','true'),('sites.18d78006-3985-4ea4-b620-67bae10d9c2d.siteGroup','\"f99d20c5-6966-4180-8dc1-595df3b8f876\"'),('sites.18d78006-3985-4ea4-b620-67bae10d9c2d.sortOrder','1'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.field','\"13d35453-527a-4094-b642-42292f193f8c\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.0.fieldUid','\"1f6a1dc8-82d8-47a8-ae54-01af20652730\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.0.instructions','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.0.label','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.0.required','false'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.0.tip','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.0.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.0.warning','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.0.width','100'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.1.fieldUid','\"5cd6ad16-cb88-45ba-b275-1558f8f27c05\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.1.instructions','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.1.label','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.1.required','false'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.1.tip','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.1.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.1.warning','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.1.width','100'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.2.fieldUid','\"a596aec7-c8ec-49d7-ab4d-97dcdf5ac990\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.2.instructions','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.2.label','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.2.required','false'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.2.tip','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.2.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.2.warning','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.2.width','100'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.3.fieldUid','\"d9aafe6e-671c-45da-9958-ccb6470336d6\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.3.instructions','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.3.label','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.3.required','false'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.3.tip','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.3.type','\"craft\\\\fieldlayoutelements\\\\CustomField\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.3.warning','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.elements.3.width','100'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.name','\"Content\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fieldLayouts.f73678d2-2b29-48d7-99ef-179a914dc502.tabs.0.sortOrder','1'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.1f6a1dc8-82d8-47a8-ae54-01af20652730.contentColumnType','\"text\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.1f6a1dc8-82d8-47a8-ae54-01af20652730.fieldGroup','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.1f6a1dc8-82d8-47a8-ae54-01af20652730.handle','\"socialName\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.1f6a1dc8-82d8-47a8-ae54-01af20652730.instructions','\"\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.1f6a1dc8-82d8-47a8-ae54-01af20652730.name','\"Name\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.1f6a1dc8-82d8-47a8-ae54-01af20652730.searchable','false'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.1f6a1dc8-82d8-47a8-ae54-01af20652730.settings.byteLimit','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.1f6a1dc8-82d8-47a8-ae54-01af20652730.settings.charLimit','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.1f6a1dc8-82d8-47a8-ae54-01af20652730.settings.code','\"\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.1f6a1dc8-82d8-47a8-ae54-01af20652730.settings.columnType','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.1f6a1dc8-82d8-47a8-ae54-01af20652730.settings.initialRows','\"4\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.1f6a1dc8-82d8-47a8-ae54-01af20652730.settings.multiline','\"\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.1f6a1dc8-82d8-47a8-ae54-01af20652730.settings.placeholder','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.1f6a1dc8-82d8-47a8-ae54-01af20652730.settings.uiMode','\"normal\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.1f6a1dc8-82d8-47a8-ae54-01af20652730.translationKeyFormat','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.1f6a1dc8-82d8-47a8-ae54-01af20652730.translationMethod','\"none\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.1f6a1dc8-82d8-47a8-ae54-01af20652730.type','\"craft\\\\fields\\\\PlainText\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.5cd6ad16-cb88-45ba-b275-1558f8f27c05.contentColumnType','\"string(255)\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.5cd6ad16-cb88-45ba-b275-1558f8f27c05.fieldGroup','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.5cd6ad16-cb88-45ba-b275-1558f8f27c05.handle','\"socialLink\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.5cd6ad16-cb88-45ba-b275-1558f8f27c05.instructions','\"\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.5cd6ad16-cb88-45ba-b275-1558f8f27c05.name','\"Link\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.5cd6ad16-cb88-45ba-b275-1558f8f27c05.searchable','false'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.5cd6ad16-cb88-45ba-b275-1558f8f27c05.settings.maxLength','\"255\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.5cd6ad16-cb88-45ba-b275-1558f8f27c05.settings.placeholder','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.5cd6ad16-cb88-45ba-b275-1558f8f27c05.settings.types.0','\"url\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.5cd6ad16-cb88-45ba-b275-1558f8f27c05.translationKeyFormat','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.5cd6ad16-cb88-45ba-b275-1558f8f27c05.translationMethod','\"none\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.5cd6ad16-cb88-45ba-b275-1558f8f27c05.type','\"craft\\\\fields\\\\Url\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.contentColumnType','\"string\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.fieldGroup','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.handle','\"socialIcon\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.instructions','\"\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.name','\"Icon\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.searchable','false'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.settings.allowedKinds','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.settings.allowSelfRelations','false'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.settings.allowUploads','true'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.settings.defaultUploadLocationSource','\"\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.settings.defaultUploadLocationSubpath','\"\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.settings.limit','\"\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.settings.localizeRelations','false'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.settings.previewMode','\"full\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.settings.restrictFiles','\"\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.settings.selectionLabel','\"\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.settings.showSiteMenu','false'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.settings.showUnpermittedFiles','false'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.settings.showUnpermittedVolumes','false'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.settings.singleUploadLocationSource','\"\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.settings.singleUploadLocationSubpath','\"\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.settings.source','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.settings.sources','\"*\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.settings.targetSiteId','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.settings.useSingleFolder','false'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.settings.validateRelatedElements','false'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.settings.viewMode','\"list\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.translationKeyFormat','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.translationMethod','\"site\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.a596aec7-c8ec-49d7-ab4d-97dcdf5ac990.type','\"craft\\\\fields\\\\Assets\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.contentColumnType','\"string\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.fieldGroup','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.handle','\"altSocialIcon\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.instructions','\"\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.name','\"Alt Icon\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.searchable','false'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.settings.allowedKinds','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.settings.allowSelfRelations','false'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.settings.allowUploads','true'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.settings.defaultUploadLocationSource','\"\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.settings.defaultUploadLocationSubpath','\"\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.settings.limit','\"\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.settings.localizeRelations','false'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.settings.previewMode','\"full\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.settings.restrictFiles','\"\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.settings.selectionLabel','\"\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.settings.showSiteMenu','false'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.settings.showUnpermittedFiles','false'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.settings.showUnpermittedVolumes','false'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.settings.singleUploadLocationSource','\"\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.settings.singleUploadLocationSubpath','\"\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.settings.source','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.settings.sources','\"*\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.settings.targetSiteId','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.settings.useSingleFolder','false'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.settings.validateRelatedElements','false'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.settings.viewMode','\"list\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.translationKeyFormat','null'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.translationMethod','\"site\"'),('superTableBlockTypes.dfd34224-0241-4c43-aec4-0c7abd7e9dab.fields.d9aafe6e-671c-45da-9958-ccb6470336d6.type','\"craft\\\\fields\\\\Assets\"'),('system.edition','\"solo\"'),('system.live','true'),('system.name','\"Craft CMS Boilerplate\"'),('system.retryDuration','null'),('system.schemaVersion','\"3.6.7\"'),('system.timeZone','\"America/Los_Angeles\"'),('users.allowPublicRegistration','false'),('users.defaultGroup','null'),('users.photoSubpath','null'),('users.photoVolumeUid','null'),('users.requireEmailVerification','true');
/*!40000 ALTER TABLE `projectconfig` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `projectconfignames`
--

LOCK TABLES `projectconfignames` WRITE;
/*!40000 ALTER TABLE `projectconfignames` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `projectconfignames` VALUES ('0ffba24e-268b-4f2c-a3f2-ad976b64c979','Image'),('13d35453-527a-4094-b642-42292f193f8c','Social Profiles'),('18d78006-3985-4ea4-b620-67bae10d9c2d','Craft CMS Boilerplate'),('1af5640c-d8b3-4503-89a1-8d0581554915','Main Header'),('1d1c9f28-39de-4df6-b077-856d16c001ca','Copy'),('1d1d5665-5674-4388-8d46-9b87e4dc65d3','Content Builder'),('1f6a1dc8-82d8-47a8-ae54-01af20652730','Name'),('2f64efd3-101a-4ed1-a31e-96657d6dc6e5','Header'),('32e8ea43-4e6d-46eb-9344-6755923c28de','Homepage'),('336f207f-f4fb-43c3-bbc3-f10b641e940a','Background Color'),('369ea60f-6259-4683-adcc-23418cf8285e','Homepage'),('386e1cf1-acc9-4336-90e1-fb74daefd6f5','Phone Number'),('39237593-ff51-4bd3-851a-a9dfac329c0b','Page Summary'),('3cca813e-09a9-4025-8efa-d5ba11d4dd89','Email'),('3f092924-7454-4778-a975-9d6112f3eb20','Google Analytics'),('4184d945-e90d-4433-b1f3-727edf65107e','Summary Image'),('431efb4a-9ace-451f-8b70-aeda20b1f83f','Globals'),('4870444e-6820-4ab0-a141-99e310305629','Background Image'),('4af3caf9-e4e3-4acd-90f8-1e8cd585e497','Address'),('4ee575cd-9fd3-4198-a6d1-3d8f2f13ea83','Copy'),('5cd6ad16-cb88-45ba-b275-1558f8f27c05','Link'),('5d2dca76-1ede-413a-8adf-b4a756ed42ae','Site Info'),('6b6833e3-09b6-4302-8492-fd06e3f794e4','Summary'),('6c4a2320-184d-4f3b-9482-070fc8b8194a','Bottom Spacing'),('70f3e289-0ffa-4d8a-a2a4-e8c6db06ee3c','Content Builder Fields'),('7bbeec1d-6526-44a3-9897-d6d1e5918a05','Settings'),('7c5c4db7-bc5e-4979-a31b-6b7734989556','SEO'),('7fc480fa-d689-40a4-9f68-2e36e07830d5','Company Info'),('8f3d51d8-227c-42c1-b81e-f3cba4189a99','SEO'),('9c3f9dfb-fbb4-4ab1-b8db-5dc9b6045f2d','Blocks'),('a596aec7-c8ec-49d7-ab4d-97dcdf5ac990','Icon'),('b4718bab-e938-4b97-a8e4-adc9fe5f4ca7','Content Builder'),('bb3731df-a01f-4725-9f8b-06d99359fd9f','Top Spacing'),('d783368e-a494-4457-9e99-5a027ae72a18','Page Header'),('d9aafe6e-671c-45da-9958-ccb6470336d6','Alt Icon'),('dcc7e763-cfad-42ba-a4ed-f0c111f2446b','Media'),('eb7f69a9-9a89-4024-ba3f-9154d28ac58c','Common'),('f122d996-7ed0-4bc1-ad02-50e74deac2df','Image'),('f99d20c5-6966-4180-8dc1-595df3b8f876','Craft CMS Boilerplate');
/*!40000 ALTER TABLE `projectconfignames` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `queue`
--

LOCK TABLES `queue` WRITE;
/*!40000 ALTER TABLE `queue` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `queue` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
set autocommit=0;
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `resourcepaths`
--

LOCK TABLES `resourcepaths` WRITE;
/*!40000 ALTER TABLE `resourcepaths` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `resourcepaths` VALUES ('11632c99','@lib/prismjs'),('13e52610','@lib/jquery-touch-events'),('14411ad2','@lib/picturefill'),('152b88c4','@supercool/buttonbox/assetbundles/buttonbox/dist'),('1ae43a83','@lib/d3'),('1fcb60fe','@app/web/assets/editentry/dist'),('221e4cb3','@craft/awss3/resources'),('29592d05','@lib/garnishjs'),('380a8cb0','@app/web/assets/fields/dist'),('3c1ff93b','@lib/fabric'),('3ef1b0fb','@app/web/assets/deprecationerrors/dist'),('3f6da2fe','@app/web/assets/dashboard/dist'),('403f3756','@lib/selectize'),('4610121f','@craft/web/assets/cp/dist'),('4a5373dc','@lib/xregexp'),('4f6b2262','@craft/web/assets/pluginstore/dist'),('57e3122d','@app/web/assets/edituser/dist'),('599c904a','@lib/datepicker-i18n'),('5a020035','@craft/redactor/assets/field/dist'),('5c6ecb8e','@craft/web/assets/updateswidget/dist'),('61a866ae','@app/web/assets/admintable/dist'),('628a67e6','@craft/redactor/assets/redactor-plugins/dist/fullscreen'),('62d489e0','@craft/web/assets/recententries/dist'),('6b17cfbf','@craft/web/assets/updater/dist'),('779924d5','@app/web/assets/editsection/dist'),('7da6efed','@app/web/assets/plugins/dist'),('8964d128','@lib/velocity'),('95437ec0','@lib/jquery.payment'),('98eb2655','@bower/jquery/dist'),('9924a1a8','@verbb/base/resources/dist'),('9a0cb70','@app/web/assets/sites/dist'),('9e1bae23','@app/web/assets/utilities/dist'),('a243b','@lib/iframe-resizer'),('b51664bc','@ether/seo/web/assets'),('b77b8da0','@lib/element-resize-detector'),('b8a83730','@freeform/Resources/js/scripts/front-end/plugin'),('bc0c839b','@verbb/navigation/resources/dist'),('bd942608','@craft/web/assets/dashboard/dist'),('c063658','@freeform/Resources'),('c4d700c3','@craft/web/assets/feed/dist'),('c7cd4a8d','@lib/jquery-ui'),('ca91b2c','@lib/fileupload'),('cb33e540','@app/web/assets/generalsettings/dist'),('cd1a0ac4','@lib/axios'),('cd5b380f','@craft/redactor/assets/redactor-plugins/dist/video'),('cf0e2bac','@craft/redactor/assets/redactor/dist'),('cfc2db6e','@app/web/assets/updater/dist'),('d1052590','@app/web/assets/craftsupport/dist'),('d2d4aa08','@app/web/assets/fieldsettings/dist'),('df978951','@app/web/assets/updateswidget/dist'),('e0f1a9b1','@lib/vue'),('e12dcb3f','@app/web/assets/recententries/dist'),('e758a199','@app/web/assets/pluginstore/dist'),('f62a9c1d','@verbb/supertable/resources/dist'),('f85ef9cc','@app/web/assets/login/dist'),('fbc23d87','@craft/web/assets/craftsupport/dist'),('fc60ecb2','@app/web/assets/cp/dist'),('ffa57a6b','@benf/neo/resources');
/*!40000 ALTER TABLE `resourcepaths` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `revisions` VALUES (1,3,1,1,NULL),(2,3,1,2,NULL),(3,3,1,3,NULL),(4,3,1,4,''),(5,14,1,1,NULL),(6,14,1,2,NULL),(7,17,1,1,NULL),(8,17,1,2,NULL),(9,17,1,3,''),(10,14,1,3,''),(11,14,1,4,NULL),(12,17,1,4,NULL),(13,14,1,5,NULL),(14,17,1,5,NULL),(15,3,1,5,''),(16,3,1,6,''),(17,3,1,7,'');
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `searchindex`
--

LOCK TABLES `searchindex` WRITE;
/*!40000 ALTER TABLE `searchindex` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `searchindex` VALUES (1,'email',0,1,' dev fortytwo studio '),(1,'firstname',0,1,''),(1,'fullname',0,1,''),(1,'lastname',0,1,''),(1,'slug',0,1,''),(1,'username',0,1,' admin '),(2,'slug',0,1,''),(3,'slug',0,1,' homepage '),(3,'title',0,1,' homepage '),(7,'slug',0,1,''),(8,'slug',0,1,''),(9,'slug',0,1,''),(11,'slug',0,1,''),(12,'slug',0,1,''),(13,'slug',0,1,''),(14,'slug',0,1,' about us '),(14,'title',0,1,' about us '),(17,'slug',0,1,' contact '),(17,'title',0,1,' contact '),(20,'slug',0,1,''),(21,'slug',0,1,''),(23,'slug',0,1,''),(24,'slug',0,1,''),(25,'slug',0,1,''),(26,'slug',0,1,''),(28,'slug',0,1,''),(29,'slug',0,1,''),(31,'slug',0,1,''),(32,'slug',0,1,''),(34,'slug',0,1,''),(35,'slug',0,1,''),(37,'slug',0,1,''),(38,'slug',0,1,''),(40,'slug',0,1,''),(41,'slug',0,1,''),(42,'slug',0,1,' 1 '),(42,'title',0,1,' about us '),(43,'slug',0,1,' 1 '),(43,'title',0,1,' contact '),(44,'slug',0,1,' 1 '),(44,'title',0,1,' homepage '),(45,'slug',0,1,''),(46,'slug',0,1,''),(46,'title',0,1,' 2021 03 30 06 47 51 '),(47,'slug',0,1,''),(47,'title',0,1,' 2021 03 30 06 53 33 '),(48,'slug',0,1,''),(48,'title',0,1,' 2021 03 30 06 54 15 '),(50,'slug',0,1,''),(51,'slug',0,1,''),(52,'slug',0,1,''),(54,'slug',0,1,''),(55,'slug',0,1,''),(56,'slug',0,1,''),(58,'slug',0,1,''),(59,'slug',0,1,''),(60,'slug',0,1,'');
/*!40000 ALTER TABLE `searchindex` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections` VALUES (1,NULL,'Homepage','homepage','single',1,'all',NULL,'2021-03-30 09:38:29','2021-03-30 09:38:29',NULL,'32e8ea43-4e6d-46eb-9344-6755923c28de'),(2,NULL,'About us','aboutUs','single',1,'all',NULL,'2021-03-30 11:04:36','2021-03-30 11:04:36','2021-03-30 14:30:19','2da11c19-0f29-4228-83ca-0b740582f078'),(3,NULL,'Contact','contact','single',1,'all',NULL,'2021-03-30 11:05:32','2021-03-30 11:05:32','2021-03-30 14:30:22','10af4cfa-43f8-4f3d-a351-3cdad7711daf');
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `sections_sites`
--

LOCK TABLES `sections_sites` WRITE;
/*!40000 ALTER TABLE `sections_sites` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sections_sites` VALUES (1,1,1,1,'__home__','index',1,'2021-03-30 09:38:29','2021-03-30 09:38:29','648308b2-5c5e-4444-a35a-5b786d92eada'),(2,2,1,1,'about-us','about-us/index',1,'2021-03-30 11:04:36','2021-03-30 11:09:56','01ccf7e7-7aec-41da-8fa3-ad802c418209'),(3,3,1,1,'contact','contact/index',1,'2021-03-30 11:05:32','2021-03-30 11:10:02','3e73ee33-11fa-4a71-871c-aab068955458');
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
INSERT INTO `structureelements` VALUES (1,1,NULL,1,1,2,0,'2021-03-30 10:33:15','2021-03-30 14:30:03','12f23bb8-824a-42b5-bf70-cf1b008c1ec0'),(3,2,NULL,3,1,2,0,'2021-03-30 10:33:15','2021-03-30 14:30:04','dd4fc483-2eb3-4098-9b5b-d053e5b9f5ce'),(6,3,NULL,6,1,4,0,'2021-03-30 10:33:18','2021-03-30 10:33:18','183b0817-ca68-45f9-9898-5e354070d443'),(7,3,11,6,2,3,1,'2021-03-30 10:33:18','2021-03-30 10:33:18','ef57b5c8-8369-42d4-b785-eefc4050a774'),(8,4,NULL,8,1,6,0,'2021-03-30 10:33:18','2021-03-30 10:33:18','76cafe86-b080-4429-bb6e-2e818813ecd7'),(9,4,12,8,2,3,1,'2021-03-30 10:33:18','2021-03-30 10:33:18','6c2703d7-de26-460e-85cb-ed2bc2ea2fe2'),(10,4,13,8,4,5,1,'2021-03-30 10:33:18','2021-03-30 10:33:18','8092b8bc-5a3d-411a-a985-090405bce011'),(11,5,NULL,11,1,2,0,'2021-03-30 11:07:21','2021-03-30 14:30:22','da7ea359-5631-4ee7-a504-704d4dbfdbb6'),(13,6,NULL,13,1,2,0,'2021-03-30 11:07:21','2021-03-30 14:30:22','8aff1714-f1aa-4054-a66f-c7849ff43137'),(15,7,NULL,15,1,4,0,'2021-03-30 11:07:22','2021-03-30 11:07:22','62e4f30d-d09c-415a-8e95-3d4c0027eed6'),(16,7,23,15,2,3,1,'2021-03-30 11:07:22','2021-03-30 11:07:22','cf7297ae-6ed8-475a-9ac5-9c921c5d79f5'),(17,8,NULL,17,1,4,0,'2021-03-30 11:07:22','2021-03-30 11:07:22','cc55d342-55d6-4c27-9468-481e89e7eadd'),(18,8,24,17,2,3,1,'2021-03-30 11:07:22','2021-03-30 11:07:22','86bac375-52dc-4684-ac29-623a8a6af98e'),(19,9,NULL,19,1,2,0,'2021-03-30 11:07:50','2021-03-30 14:30:19','a1deb832-ebf1-4729-b97a-1c818bbd2560'),(21,10,NULL,21,1,2,0,'2021-03-30 11:07:50','2021-03-30 14:30:19','59c2aa68-074e-459e-9f6a-f6d434984162'),(23,11,NULL,23,1,4,0,'2021-03-30 11:07:51','2021-03-30 11:07:51','85841026-c26f-48c4-8f99-6678b568411c'),(24,11,28,23,2,3,1,'2021-03-30 11:07:51','2021-03-30 11:07:51','574a6075-b699-432d-bb99-963d206b5829'),(25,12,NULL,25,1,4,0,'2021-03-30 11:07:51','2021-03-30 11:07:51','bf3aabe3-6c5a-4a00-9a3c-255e3198dc01'),(26,12,29,25,2,3,1,'2021-03-30 11:07:51','2021-03-30 11:07:51','b1f85946-3aec-436a-8895-b175dd267055'),(27,13,NULL,27,1,4,0,'2021-03-30 11:09:09','2021-03-30 11:09:09','dac7d8a9-760a-4a3c-8006-4a70cc9ffbb9'),(28,13,31,27,2,3,1,'2021-03-30 11:09:09','2021-03-30 11:09:09','09f4a2bb-eb12-45da-991d-0885dbb1413e'),(29,14,NULL,29,1,4,0,'2021-03-30 11:09:09','2021-03-30 11:09:09','f77b206e-5c23-49fe-86ac-1ba7b89ed1f7'),(30,14,32,29,2,3,1,'2021-03-30 11:09:09','2021-03-30 11:09:09','07d28317-5925-43cf-905e-170f64cec15e'),(31,15,NULL,31,1,4,0,'2021-03-30 11:09:30','2021-03-30 11:09:30','617d04ed-0ca0-48fa-bc94-0179e33c151d'),(32,15,34,31,2,3,1,'2021-03-30 11:09:30','2021-03-30 11:09:30','4fe4aadd-c284-449b-99ed-bc8d419c4296'),(33,16,NULL,33,1,4,0,'2021-03-30 11:09:30','2021-03-30 11:09:30','fb8e673b-f55b-43f5-9dd5-f058035f800b'),(34,16,35,33,2,3,1,'2021-03-30 11:09:30','2021-03-30 11:09:30','fd3952c2-f358-4f71-b35a-4419763998f3'),(35,17,NULL,35,1,4,0,'2021-03-30 11:09:57','2021-03-30 11:09:57','f8eb1d13-f1df-4fe3-858a-647f5194e075'),(36,17,37,35,2,3,1,'2021-03-30 11:09:57','2021-03-30 11:09:57','e7458099-a8d9-453b-9327-c53b8025f2d5'),(37,18,NULL,37,1,4,0,'2021-03-30 11:09:57','2021-03-30 11:09:57','f409fa8b-0d8b-4337-9494-6567f190b0f7'),(38,18,38,37,2,3,1,'2021-03-30 11:09:57','2021-03-30 11:09:57','2636aa12-55a6-4232-8f69-a64f1ff07730'),(39,19,NULL,39,1,4,0,'2021-03-30 11:10:04','2021-03-30 11:10:04','ef785424-7fcd-4de3-bd18-b31d59158b22'),(40,19,40,39,2,3,1,'2021-03-30 11:10:04','2021-03-30 11:10:04','ff68f1d2-95da-48aa-b355-48e1d2567fc0'),(41,20,NULL,41,1,4,0,'2021-03-30 11:10:04','2021-03-30 11:10:04','952082f3-7bcf-4221-92fd-7fda7257648a'),(42,20,41,41,2,3,1,'2021-03-30 11:10:04','2021-03-30 11:10:04','a38ad659-1feb-49db-8573-4d0576c1e79f'),(43,21,NULL,43,1,2,0,'2021-03-30 11:14:00','2021-03-30 14:28:25','a85106c8-1c9a-41e4-950a-b8f5cf3aa59d'),(47,24,NULL,47,1,4,0,'2021-03-30 14:30:19','2021-03-30 14:30:19','7a63093f-8bb8-4456-82ae-12997f5cacd2'),(48,24,25,47,2,3,1,'2021-03-30 14:30:19','2021-03-30 14:30:19','3b0fba16-9661-44c8-bb7c-c9cb62bb52c2'),(49,25,NULL,49,1,4,0,'2021-03-30 14:30:19','2021-03-30 14:30:19','0cc403ef-88d3-4ec6-acf5-13c5b735b739'),(50,25,26,49,2,3,1,'2021-03-30 14:30:19','2021-03-30 14:30:19','1889dcee-d16a-4ebe-8085-641ee9da37b2'),(51,26,NULL,51,1,4,0,'2021-03-30 14:30:22','2021-03-30 14:30:22','9920b6ce-7f40-4be6-9205-a3fbcbed6c27'),(52,26,20,51,2,3,1,'2021-03-30 14:30:22','2021-03-30 14:30:22','c60a25b3-7966-4e04-abfc-de063d7a505d'),(53,27,NULL,53,1,4,0,'2021-03-30 14:30:22','2021-03-30 14:30:22','c02d6b68-734d-4a83-a460-565688d9239c'),(54,27,21,53,2,3,1,'2021-03-30 14:30:22','2021-03-30 14:30:22','c9f7470d-029d-4624-9c4f-1c724397be77'),(55,28,NULL,55,1,4,0,'2021-03-30 14:58:55','2021-03-30 14:58:55','57c9f939-b9d1-401d-835e-25ab06e34965'),(56,28,50,55,2,3,1,'2021-03-30 14:58:55','2021-03-30 14:58:55','42ac35c9-b231-4a17-974a-1a51d3fc402b'),(57,29,NULL,57,1,6,0,'2021-03-30 14:58:55','2021-03-30 14:58:55','893a8ee6-19d2-45b9-aede-2faf43514a71'),(58,29,51,57,2,3,1,'2021-03-30 14:58:55','2021-03-30 14:58:55','8da76fc6-ac30-4b28-a321-c48b32780f16'),(59,29,52,57,4,5,1,'2021-03-30 14:58:55','2021-03-30 14:58:55','5c0d52d8-6264-409a-9300-ca1d5e51d3b5'),(60,30,NULL,60,1,4,0,'2021-03-30 14:58:57','2021-03-30 14:58:57','472502c2-4f28-4472-b011-d6836921403a'),(61,30,54,60,2,3,1,'2021-03-30 14:58:57','2021-03-30 14:58:57','ee1300eb-d4d4-451c-ae19-3973c975d11a'),(62,31,NULL,62,1,6,0,'2021-03-30 14:58:57','2021-03-30 14:58:57','4546e2b5-88ed-417e-b6df-6924f5d8f7fb'),(63,31,55,62,2,3,1,'2021-03-30 14:58:57','2021-03-30 14:58:57','a2bf66be-3c1b-4ec0-b677-4a43a37c0a72'),(64,31,56,62,4,5,1,'2021-03-30 14:58:57','2021-03-30 14:58:57','7dda3085-e7ad-42cd-8c17-d730fef3fc06'),(65,32,NULL,65,1,4,0,'2021-03-30 15:00:18','2021-03-30 15:00:18','64be63f5-a2b1-431d-9f5f-17a9e1fac4a1'),(66,32,58,65,2,3,1,'2021-03-30 15:00:18','2021-03-30 15:00:18','ce026ac2-8340-4a42-8f84-ba1cae629373'),(67,33,NULL,67,1,6,0,'2021-03-30 15:00:18','2021-03-30 15:00:18','35ea155e-195f-4c2c-85a2-e54d97e49a18'),(68,33,59,67,2,3,1,'2021-03-30 15:00:18','2021-03-30 15:00:18','a9c159e3-041b-4263-b916-bb2f9bcb7f13'),(69,33,60,67,4,5,1,'2021-03-30 15:00:18','2021-03-30 15:00:18','1386aeb4-500c-43ca-b2fe-a245a345d085');
/*!40000 ALTER TABLE `structureelements` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `structures` VALUES (1,NULL,'2021-03-30 10:33:15','2021-03-30 10:33:15','2021-03-30 14:30:04','d355faf1-2e34-433e-8db4-9ee16b8e468a'),(2,NULL,'2021-03-30 10:33:15','2021-03-30 10:33:15','2021-03-30 14:30:04','a7906e3b-f55f-430f-95f7-b838b6d54eda'),(3,NULL,'2021-03-30 10:33:18','2021-03-30 10:33:18',NULL,'d4ce6b78-64ed-4da3-bbc3-e1e3cb199cb7'),(4,NULL,'2021-03-30 10:33:18','2021-03-30 10:33:18',NULL,'d2f82fe3-2c01-4fd8-94c1-3f883f452282'),(5,NULL,'2021-03-30 11:07:21','2021-03-30 11:07:21','2021-03-30 14:30:22','f50aa040-3874-4763-a501-f40b04477240'),(6,NULL,'2021-03-30 11:07:21','2021-03-30 11:07:21','2021-03-30 14:30:22','d71da807-1e57-4f33-8089-90fa82b6d35b'),(7,NULL,'2021-03-30 11:07:22','2021-03-30 11:07:22',NULL,'3d6b9108-7746-4d1a-876e-05cf72352a44'),(8,NULL,'2021-03-30 11:07:22','2021-03-30 11:07:22',NULL,'bd047094-a9c6-4a61-9ad0-037508f3d292'),(9,NULL,'2021-03-30 11:07:50','2021-03-30 11:07:50','2021-03-30 14:30:19','21591c9d-4153-4e34-bc4a-e44e9853083b'),(10,NULL,'2021-03-30 11:07:50','2021-03-30 11:07:50','2021-03-30 14:30:19','49aa7041-e417-4bcb-964c-e01e2c0406ca'),(11,NULL,'2021-03-30 11:07:51','2021-03-30 11:07:51',NULL,'382b11ce-e067-4a1e-8471-a1b73f3d78ac'),(12,NULL,'2021-03-30 11:07:51','2021-03-30 11:07:51',NULL,'ae2606a2-5287-4ad7-9ad9-2a1a19f818fb'),(13,NULL,'2021-03-30 11:09:09','2021-03-30 11:09:09',NULL,'c2fc1870-82bf-4007-8ee9-a1f9894675d4'),(14,NULL,'2021-03-30 11:09:09','2021-03-30 11:09:09',NULL,'271c4759-b99a-45b3-bad6-5d5f72730538'),(15,NULL,'2021-03-30 11:09:30','2021-03-30 11:09:30',NULL,'6835bfa2-d401-44e1-95c7-9034b040d527'),(16,NULL,'2021-03-30 11:09:30','2021-03-30 11:09:30',NULL,'845b3f10-88fa-4484-b59b-b84951a8f7ff'),(17,NULL,'2021-03-30 11:09:57','2021-03-30 11:09:57',NULL,'10b56caa-98ee-43de-ad3d-9fcf69e413a4'),(18,NULL,'2021-03-30 11:09:57','2021-03-30 11:09:57',NULL,'6254036c-03ac-4ed1-85e6-57c2ffa76723'),(19,NULL,'2021-03-30 11:10:04','2021-03-30 11:10:04',NULL,'c00600f6-142c-42fe-83d2-ce6803e57ede'),(20,NULL,'2021-03-30 11:10:04','2021-03-30 11:10:04',NULL,'49b0612a-93d4-4690-9088-04f86dd62cf6'),(21,NULL,'2021-03-30 11:13:52','2021-03-30 11:13:52','2021-03-30 14:28:25','56a5943d-02e9-49e2-af01-013e03924375'),(22,NULL,'2021-03-30 14:30:04','2021-03-30 14:30:04','2021-03-30 14:58:55','dc3e8e18-3c34-4fac-9d5b-a163dea86697'),(23,NULL,'2021-03-30 14:30:04','2021-03-30 14:30:04','2021-03-30 14:58:55','d29414fa-f296-4cbd-bffa-f4631c12b3d3'),(24,NULL,'2021-03-30 14:30:19','2021-03-30 14:30:19',NULL,'cb07f217-04a0-4b56-9532-db789f3a4d01'),(25,NULL,'2021-03-30 14:30:19','2021-03-30 14:30:19',NULL,'2134a994-950b-418a-9766-7bfa09858ead'),(26,NULL,'2021-03-30 14:30:22','2021-03-30 14:30:22',NULL,'813e3df1-aaa9-4c08-a3f2-7fed33e14406'),(27,NULL,'2021-03-30 14:30:22','2021-03-30 14:30:22',NULL,'f3446965-e47e-4c58-a084-2c865d3d401b'),(28,NULL,'2021-03-30 14:58:55','2021-03-30 14:58:55',NULL,'c8d42b1b-2658-471c-af7d-4e2515b0e667'),(29,NULL,'2021-03-30 14:58:55','2021-03-30 14:58:55',NULL,'bdd797b9-5b8d-4fb0-a7bb-cd9bd7a0d465'),(30,NULL,'2021-03-30 14:58:57','2021-03-30 14:58:57',NULL,'eb76fd60-8a04-4de7-bd5f-2ab26bb15843'),(31,NULL,'2021-03-30 14:58:57','2021-03-30 14:58:57',NULL,'c12f8207-f9cf-40b2-ac85-2b635cf48bb8'),(32,NULL,'2021-03-30 15:00:18','2021-03-30 15:00:18',NULL,'ca5bca1c-8a49-46a4-b889-8f5497bae506'),(33,NULL,'2021-03-30 15:00:18','2021-03-30 15:00:18',NULL,'af9a5396-fe37-4fb6-9237-5cd0a7ed771e');
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
INSERT INTO `users` VALUES (1,'Admin',NULL,'','','dev@fortytwo.studio','$2y$13$3Zv9sh4HRXyqD1tNq/gmoegINdaet8OFyxoyZBbIXMV5yBALD7J0q',1,0,0,0,'2021-03-30 15:27:35',NULL,NULL,NULL,'2021-03-30 14:46:59',NULL,1,NULL,NULL,NULL,0,'2021-03-30 14:54:18','2021-03-30 09:20:12','2021-03-30 15:27:35','e35059a4-d1ca-4c44-9793-7ff136cc1bfc');
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
-- Dumping routines for database 'craftcms_boilerplate'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-30 16:52:10
