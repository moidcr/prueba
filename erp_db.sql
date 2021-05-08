/*
 Navicat Premium Data Transfer

 Source Server         : Local
 Source Server Type    : MySQL
 Source Server Version : 50624
 Source Host           : localhost
 Source Database       : erp

 Target Server Type    : MySQL
 Target Server Version : 50624
 File Encoding         : utf-8

 Date: 05/08/2021 12:08:11 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `llx_accounting_account`
-- ----------------------------
DROP TABLE IF EXISTS `llx_accounting_account`;
CREATE TABLE `llx_accounting_account` (
  `rowid` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_pcg_version` varchar(32) NOT NULL,
  `pcg_type` varchar(20) NOT NULL,
  `account_number` varchar(32) NOT NULL,
  `account_parent` int(11) DEFAULT '0',
  `label` varchar(255) NOT NULL,
  `labelshort` varchar(255) DEFAULT NULL,
  `fk_accounting_category` int(11) DEFAULT '0',
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `reconcilable` tinyint(4) NOT NULL DEFAULT '0',
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_accounting_account` (`account_number`,`entity`,`fk_pcg_version`),
  KEY `idx_accounting_account_fk_pcg_version` (`fk_pcg_version`),
  KEY `idx_accounting_account_account_parent` (`account_parent`),
  CONSTRAINT `fk_accounting_account_fk_pcg_version` FOREIGN KEY (`fk_pcg_version`) REFERENCES `llx_accounting_system` (`pcg_version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_accounting_bookkeeping`
-- ----------------------------
DROP TABLE IF EXISTS `llx_accounting_bookkeeping`;
CREATE TABLE `llx_accounting_bookkeeping` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `doc_date` date NOT NULL,
  `doc_type` varchar(30) NOT NULL,
  `doc_ref` varchar(300) NOT NULL,
  `fk_doc` int(11) NOT NULL,
  `fk_docdet` int(11) NOT NULL,
  `thirdparty_code` varchar(32) DEFAULT NULL,
  `subledger_account` varchar(32) DEFAULT NULL,
  `subledger_label` varchar(255) DEFAULT NULL,
  `numero_compte` varchar(32) NOT NULL,
  `label_compte` varchar(255) NOT NULL,
  `label_operation` varchar(255) DEFAULT NULL,
  `debit` double(24,8) NOT NULL,
  `credit` double(24,8) NOT NULL,
  `montant` double(24,8) DEFAULT NULL,
  `sens` varchar(1) DEFAULT NULL,
  `multicurrency_amount` double(24,8) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `lettering_code` varchar(255) DEFAULT NULL,
  `date_lettering` datetime DEFAULT NULL,
  `date_lim_reglement` datetime DEFAULT NULL,
  `fk_user_author` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user` int(11) DEFAULT NULL,
  `code_journal` varchar(32) NOT NULL,
  `journal_label` varchar(255) DEFAULT NULL,
  `piece_num` int(11) NOT NULL,
  `date_validated` datetime DEFAULT NULL,
  `date_export` datetime DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_accounting_bookkeeping_doc_date` (`doc_date`),
  KEY `idx_accounting_bookkeeping_fk_doc` (`fk_doc`),
  KEY `idx_accounting_bookkeeping_fk_docdet` (`fk_docdet`),
  KEY `idx_accounting_bookkeeping_numero_compte` (`numero_compte`),
  KEY `idx_accounting_bookkeeping_code_journal` (`code_journal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_accounting_bookkeeping_tmp`
-- ----------------------------
DROP TABLE IF EXISTS `llx_accounting_bookkeeping_tmp`;
CREATE TABLE `llx_accounting_bookkeeping_tmp` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `doc_date` date NOT NULL,
  `doc_type` varchar(30) NOT NULL,
  `doc_ref` varchar(300) NOT NULL,
  `fk_doc` int(11) NOT NULL,
  `fk_docdet` int(11) NOT NULL,
  `thirdparty_code` varchar(32) DEFAULT NULL,
  `subledger_account` varchar(32) DEFAULT NULL,
  `subledger_label` varchar(255) DEFAULT NULL,
  `numero_compte` varchar(32) DEFAULT NULL,
  `label_compte` varchar(255) NOT NULL,
  `label_operation` varchar(255) DEFAULT NULL,
  `debit` double(24,8) NOT NULL,
  `credit` double(24,8) NOT NULL,
  `montant` double(24,8) NOT NULL,
  `sens` varchar(1) DEFAULT NULL,
  `multicurrency_amount` double(24,8) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `lettering_code` varchar(255) DEFAULT NULL,
  `date_lettering` datetime DEFAULT NULL,
  `date_lim_reglement` datetime DEFAULT NULL,
  `fk_user_author` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user` int(11) DEFAULT NULL,
  `code_journal` varchar(32) NOT NULL,
  `journal_label` varchar(255) DEFAULT NULL,
  `piece_num` int(11) NOT NULL,
  `date_validated` datetime DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_accounting_bookkeeping_tmp_doc_date` (`doc_date`),
  KEY `idx_accounting_bookkeeping_tmp_fk_docdet` (`fk_docdet`),
  KEY `idx_accounting_bookkeeping_tmp_numero_compte` (`numero_compte`),
  KEY `idx_accounting_bookkeeping_tmp_code_journal` (`code_journal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_accounting_fiscalyear`
-- ----------------------------
DROP TABLE IF EXISTS `llx_accounting_fiscalyear`;
CREATE TABLE `llx_accounting_fiscalyear` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(128) NOT NULL,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `statut` tinyint(4) NOT NULL DEFAULT '0',
  `entity` int(11) NOT NULL DEFAULT '1',
  `datec` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_accounting_journal`
-- ----------------------------
DROP TABLE IF EXISTS `llx_accounting_journal`;
CREATE TABLE `llx_accounting_journal` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `code` varchar(32) NOT NULL,
  `label` varchar(128) NOT NULL,
  `nature` smallint(6) NOT NULL DEFAULT '1',
  `active` smallint(6) DEFAULT '0',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_accounting_journal_code` (`code`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_accounting_journal`
-- ----------------------------
BEGIN;
INSERT INTO `llx_accounting_journal` VALUES ('1', '1', 'VT', 'ACCOUNTING_SELL_JOURNAL', '2', '1'), ('2', '1', 'AC', 'ACCOUNTING_PURCHASE_JOURNAL', '3', '1'), ('3', '1', 'BQ', 'FinanceJournal', '4', '1'), ('4', '1', 'OD', 'ACCOUNTING_MISCELLANEOUS_JOURNAL', '1', '1'), ('5', '1', 'AN', 'ACCOUNTING_HAS_NEW_JOURNAL', '9', '1'), ('6', '1', 'ER', 'ExpenseReportsJournal', '5', '1'), ('7', '1', 'INV', 'InventoryJournal', '8', '1');
COMMIT;

-- ----------------------------
--  Table structure for `llx_accounting_system`
-- ----------------------------
DROP TABLE IF EXISTS `llx_accounting_system`;
CREATE TABLE `llx_accounting_system` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_country` int(11) DEFAULT NULL,
  `pcg_version` varchar(32) NOT NULL,
  `label` varchar(128) NOT NULL,
  `active` smallint(6) DEFAULT '0',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_accounting_system_pcg_version` (`pcg_version`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_accounting_system`
-- ----------------------------
BEGIN;
INSERT INTO `llx_accounting_system` VALUES ('1', '1', 'PCG99-ABREGE', 'The simple accountancy french plan', '1'), ('2', '1', 'PCG99-BASE', 'The base accountancy french plan', '1'), ('3', '1', 'PCG14-DEV', 'The developed accountancy french plan 2014', '1'), ('4', '2', 'PCMN-BASE', 'The base accountancy belgium plan', '1'), ('5', '4', 'PCG08-PYME', 'The PYME accountancy spanish plan', '1'), ('6', '5', 'SKR03', 'Standardkontenrahmen SKR 03', '1'), ('7', '5', 'SKR04', 'Standardkontenrahmen SKR 04', '1'), ('8', '6', 'PCG_SUISSE', 'Switzerland plan', '1'), ('9', '7', 'ENG-BASE', 'England plan', '1'), ('10', '10', 'PCT', 'The Tunisia plan', '1'), ('11', '67', 'PC-MIPYME', 'The PYME accountancy Chile plan', '1'), ('12', '80', 'DK-STD', 'Standardkontoplan fra SKAT', '1'), ('13', '140', 'PCN-LUXEMBURG', 'Plan comptable normalisé Luxembourgeois', '1'), ('14', '12', 'PCG', 'The Moroccan chart of accounts', '1'), ('15', '49', 'SYSCOHADA-BJ', 'Plan comptable Ouest-Africain', '1'), ('16', '60', 'SYSCOHADA-BF', 'Plan comptable Ouest-Africain', '1'), ('17', '24', 'SYSCOHADA-CM', 'Plan comptable Ouest-Africain', '1'), ('18', '65', 'SYSCOHADA-CF', 'Plan comptable Ouest-Africain', '1'), ('19', '71', 'SYSCOHADA-KM', 'Plan comptable Ouest-Africain', '1'), ('20', '72', 'SYSCOHADA-CG', 'Plan comptable Ouest-Africain', '1'), ('21', '21', 'SYSCOHADA-CI', 'Plan comptable Ouest-Africain', '1'), ('22', '16', 'SYSCOHADA-GA', 'Plan comptable Ouest-Africain', '1'), ('23', '87', 'SYSCOHADA-GQ', 'Plan comptable Ouest-Africain', '1'), ('24', '147', 'SYSCOHADA-ML', 'Plan comptable Ouest-Africain', '1'), ('25', '168', 'SYSCOHADA-NE', 'Plan comptable Ouest-Africain', '1'), ('26', '73', 'SYSCOHADA-CD', 'Plan comptable Ouest-Africain', '1'), ('27', '22', 'SYSCOHADA-SN', 'Plan comptable Ouest-Africain', '1'), ('28', '66', 'SYSCOHADA-TD', 'Plan comptable Ouest-Africain', '1'), ('29', '15', 'SYSCOHADA-TG', 'Plan comptable Ouest-Africain', '1'), ('30', '188', 'RO-BASE', 'Plan de conturi romanesc', '1'), ('61', '20', 'BAS-K1-MINI', 'The Swedish mini chart of accounts', '1'), ('62', '1', 'PCG18-ASSOC', 'French foundation chart of accounts 2018', '1'), ('63', '1', 'PCGAFR14-DEV', 'The developed farm accountancy french plan 2014', '1'), ('64', '41', 'AT-BASE', 'Plan Austria', '1');
COMMIT;

-- ----------------------------
--  Table structure for `llx_actioncomm`
-- ----------------------------
DROP TABLE IF EXISTS `llx_actioncomm`;
CREATE TABLE `llx_actioncomm` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ref_ext` varchar(255) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `datep` datetime DEFAULT NULL,
  `datep2` datetime DEFAULT NULL,
  `fk_action` int(11) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_mod` int(11) DEFAULT NULL,
  `fk_project` int(11) DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_contact` int(11) DEFAULT NULL,
  `fk_parent` int(11) NOT NULL DEFAULT '0',
  `fk_user_action` int(11) DEFAULT NULL,
  `fk_user_done` int(11) DEFAULT NULL,
  `transparency` int(11) DEFAULT NULL,
  `priority` smallint(6) DEFAULT NULL,
  `fulldayevent` smallint(6) NOT NULL DEFAULT '0',
  `percent` smallint(6) NOT NULL DEFAULT '0',
  `location` varchar(128) DEFAULT NULL,
  `durationp` double DEFAULT NULL,
  `label` varchar(255) NOT NULL,
  `note` text,
  `email_subject` varchar(255) DEFAULT NULL,
  `email_msgid` varchar(255) DEFAULT NULL,
  `email_from` varchar(255) DEFAULT NULL,
  `email_sender` varchar(255) DEFAULT NULL,
  `email_to` varchar(255) DEFAULT NULL,
  `email_tocc` varchar(255) DEFAULT NULL,
  `email_tobcc` varchar(255) DEFAULT NULL,
  `errors_to` varchar(255) DEFAULT NULL,
  `recurid` varchar(128) DEFAULT NULL,
  `recurrule` varchar(128) DEFAULT NULL,
  `recurdateend` datetime DEFAULT NULL,
  `fk_element` int(11) DEFAULT NULL,
  `elementtype` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `calling_duration` int(11) DEFAULT NULL,
  `visibility` varchar(12) DEFAULT 'default',
  `reply_to` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_actioncomm_fk_soc` (`fk_soc`),
  KEY `idx_actioncomm_fk_contact` (`fk_contact`),
  KEY `idx_actioncomm_code` (`code`),
  KEY `idx_actioncomm_fk_element` (`fk_element`),
  KEY `idx_actioncomm_fk_user_action` (`fk_user_action`),
  KEY `idx_actioncomm_fk_project` (`fk_project`),
  KEY `idx_actioncomm_datep` (`datep`),
  KEY `idx_actioncomm_datep2` (`datep2`),
  KEY `idx_actioncomm_recurid` (`recurid`),
  KEY `idx_actioncomm_ref_ext` (`ref_ext`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_actioncomm`
-- ----------------------------
BEGIN;
INSERT INTO `llx_actioncomm` VALUES ('1', null, '1', '2021-05-08 04:42:28', '2021-05-08 04:42:28', '40', 'AC_PRODUCT_CREATE', '2021-05-08 04:42:28', '2021-05-07 21:42:28', '1', null, null, null, null, '0', '1', null, '0', '0', '0', '-1', '', null, 'Producto Escalera creado', 'Autor: admin297\nProducto Escalera creado', null, null, null, null, null, null, null, null, null, null, null, '1', 'product', null, null, null, 'default', null), ('2', null, '1', '2021-05-08 04:43:04', '2021-05-08 04:43:04', '40', 'AC_COMPANY_CREATE', '2021-05-08 04:43:04', '2021-05-07 21:43:04', '1', null, null, '1', null, '0', '1', null, '0', '0', '0', '-1', '', null, 'Tercero Moisés creado', 'Autor: admin297\nTercero Moisés creado', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'default', null), ('3', null, '1', '2021-05-08 04:47:59', '2021-05-08 04:47:59', '40', 'AC_PRODUCT_MODIFY', '2021-05-08 04:47:59', '2021-05-07 21:47:59', '1', null, null, null, null, '0', '1', null, '0', '0', '0', '-1', '', null, 'Producto Escalera modificado', 'Autor: admin297\nProducto Escalera modificado', null, null, null, null, null, null, null, null, null, null, null, '1', 'product', null, null, null, 'default', null), ('4', null, '1', '2021-05-08 04:48:10', '2021-05-08 04:48:10', '40', 'AC_PRODUCT_MODIFY', '2021-05-08 04:48:10', '2021-05-07 21:48:10', '1', null, null, null, null, '0', '1', null, '0', '0', '0', '-1', '', null, 'Producto Escalera modificado', 'Autor: admin297\nProducto Escalera modificado', null, null, null, null, null, null, null, null, null, null, null, '1', 'product', null, null, null, 'default', null);
COMMIT;

-- ----------------------------
--  Table structure for `llx_actioncomm_extrafields`
-- ----------------------------
DROP TABLE IF EXISTS `llx_actioncomm_extrafields`;
CREATE TABLE `llx_actioncomm_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_actioncomm_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_actioncomm_reminder`
-- ----------------------------
DROP TABLE IF EXISTS `llx_actioncomm_reminder`;
CREATE TABLE `llx_actioncomm_reminder` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `dateremind` datetime NOT NULL,
  `typeremind` varchar(32) NOT NULL,
  `fk_user` int(11) NOT NULL,
  `offsetvalue` int(11) NOT NULL,
  `offsetunit` varchar(1) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `entity` int(11) NOT NULL DEFAULT '1',
  `fk_actioncomm` int(11) NOT NULL,
  `fk_email_template` int(11) DEFAULT NULL,
  `lasterror` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_actioncomm_reminder_unique` (`fk_user`,`typeremind`,`offsetvalue`,`offsetunit`,`fk_actioncomm`),
  KEY `idx_actioncomm_reminder_rowid` (`rowid`),
  KEY `idx_actioncomm_reminder_dateremind` (`dateremind`),
  KEY `idx_actioncomm_reminder_fk_user` (`fk_user`),
  KEY `idx_actioncomm_reminder_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_actioncomm_resources`
-- ----------------------------
DROP TABLE IF EXISTS `llx_actioncomm_resources`;
CREATE TABLE `llx_actioncomm_resources` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_actioncomm` int(11) NOT NULL,
  `element_type` varchar(50) NOT NULL,
  `fk_element` int(11) NOT NULL,
  `answer_status` varchar(50) DEFAULT NULL,
  `mandatory` smallint(6) DEFAULT NULL,
  `transparency` smallint(6) DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_actioncomm_resources` (`fk_actioncomm`,`element_type`,`fk_element`),
  KEY `idx_actioncomm_resources_fk_element` (`fk_element`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_actioncomm_resources`
-- ----------------------------
BEGIN;
INSERT INTO `llx_actioncomm_resources` VALUES ('1', '1', 'user', '1', '0', '0', '0'), ('2', '2', 'user', '1', '0', '0', '0'), ('3', '3', 'user', '1', '0', '0', '0'), ('4', '4', 'user', '1', '0', '0', '0');
COMMIT;

-- ----------------------------
--  Table structure for `llx_adherent`
-- ----------------------------
DROP TABLE IF EXISTS `llx_adherent`;
CREATE TABLE `llx_adherent` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `ref_ext` varchar(128) DEFAULT NULL,
  `civility` varchar(6) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `login` varchar(50) DEFAULT NULL,
  `pass` varchar(50) DEFAULT NULL,
  `pass_crypted` varchar(128) DEFAULT NULL,
  `fk_adherent_type` int(11) NOT NULL,
  `morphy` varchar(3) NOT NULL,
  `societe` varchar(128) DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `address` text,
  `zip` varchar(30) DEFAULT NULL,
  `town` varchar(50) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `country` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `socialnetworks` text,
  `skype` varchar(255) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `phone_perso` varchar(30) DEFAULT NULL,
  `phone_mobile` varchar(30) DEFAULT NULL,
  `birth` date DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `statut` smallint(6) NOT NULL DEFAULT '0',
  `public` smallint(6) NOT NULL DEFAULT '0',
  `datefin` datetime DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `model_pdf` varchar(255) DEFAULT NULL,
  `datevalid` datetime DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_mod` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `canvas` varchar(32) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `snapchat` varchar(255) DEFAULT NULL,
  `googleplus` varchar(255) DEFAULT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `whatsapp` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_adherent_login` (`login`,`entity`),
  UNIQUE KEY `uk_adherent_fk_soc` (`fk_soc`),
  KEY `idx_adherent_fk_adherent_type` (`fk_adherent_type`),
  CONSTRAINT `adherent_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_adherent_adherent_type` FOREIGN KEY (`fk_adherent_type`) REFERENCES `llx_adherent_type` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_adherent_extrafields`
-- ----------------------------
DROP TABLE IF EXISTS `llx_adherent_extrafields`;
CREATE TABLE `llx_adherent_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_adherent_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_adherent_type`
-- ----------------------------
DROP TABLE IF EXISTS `llx_adherent_type`;
CREATE TABLE `llx_adherent_type` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `statut` smallint(6) NOT NULL DEFAULT '0',
  `libelle` varchar(50) NOT NULL,
  `subscription` varchar(3) NOT NULL DEFAULT '1',
  `vote` varchar(3) NOT NULL DEFAULT '1',
  `note` text,
  `mail_valid` text,
  `morphy` varchar(3) DEFAULT NULL,
  `duration` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_adherent_type_libelle` (`libelle`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_adherent_type_extrafields`
-- ----------------------------
DROP TABLE IF EXISTS `llx_adherent_type_extrafields`;
CREATE TABLE `llx_adherent_type_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_adherent_type_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_adherent_type_lang`
-- ----------------------------
DROP TABLE IF EXISTS `llx_adherent_type_lang`;
CREATE TABLE `llx_adherent_type_lang` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_type` int(11) NOT NULL DEFAULT '0',
  `lang` varchar(5) NOT NULL DEFAULT '0',
  `label` varchar(255) NOT NULL,
  `description` text,
  `email` text,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_advtargetemailing`
-- ----------------------------
DROP TABLE IF EXISTS `llx_advtargetemailing`;
CREATE TABLE `llx_advtargetemailing` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(180) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `fk_element` int(11) NOT NULL,
  `type_element` varchar(180) NOT NULL,
  `filtervalue` text,
  `fk_user_author` int(11) NOT NULL,
  `datec` datetime NOT NULL,
  `fk_user_mod` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_advtargetemailing_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_asset`
-- ----------------------------
DROP TABLE IF EXISTS `llx_asset`;
CREATE TABLE `llx_asset` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(128) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `label` varchar(255) DEFAULT NULL,
  `amount_ht` double(24,8) DEFAULT NULL,
  `amount_vat` double(24,8) DEFAULT NULL,
  `fk_asset_type` int(11) NOT NULL,
  `description` text,
  `note_public` text,
  `note_private` text,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_asset_rowid` (`rowid`),
  KEY `idx_asset_ref` (`ref`),
  KEY `idx_asset_entity` (`entity`),
  KEY `idx_asset_fk_asset_type` (`fk_asset_type`),
  CONSTRAINT `fk_asset_asset_type` FOREIGN KEY (`fk_asset_type`) REFERENCES `llx_asset_type` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_asset_extrafields`
-- ----------------------------
DROP TABLE IF EXISTS `llx_asset_extrafields`;
CREATE TABLE `llx_asset_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_asset_type`
-- ----------------------------
DROP TABLE IF EXISTS `llx_asset_type`;
CREATE TABLE `llx_asset_type` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `label` varchar(50) NOT NULL,
  `accountancy_code_asset` varchar(32) DEFAULT NULL,
  `accountancy_code_depreciation_asset` varchar(32) DEFAULT NULL,
  `accountancy_code_depreciation_expense` varchar(32) DEFAULT NULL,
  `note` text,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_asset_type_label` (`label`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_asset_type_extrafields`
-- ----------------------------
DROP TABLE IF EXISTS `llx_asset_type_extrafields`;
CREATE TABLE `llx_asset_type_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_asset_type_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_bank`
-- ----------------------------
DROP TABLE IF EXISTS `llx_bank`;
CREATE TABLE `llx_bank` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datev` date DEFAULT NULL,
  `dateo` date DEFAULT NULL,
  `amount` double(24,8) NOT NULL DEFAULT '0.00000000',
  `label` varchar(255) DEFAULT NULL,
  `fk_account` int(11) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_rappro` int(11) DEFAULT NULL,
  `fk_type` varchar(6) DEFAULT NULL,
  `num_releve` varchar(50) DEFAULT NULL,
  `num_chq` varchar(50) DEFAULT NULL,
  `numero_compte` varchar(32) DEFAULT NULL,
  `rappro` tinyint(4) DEFAULT '0',
  `note` text,
  `fk_bordereau` int(11) DEFAULT '0',
  `banque` varchar(255) DEFAULT NULL,
  `emetteur` varchar(255) DEFAULT NULL,
  `author` varchar(40) DEFAULT NULL,
  `origin_id` int(11) DEFAULT NULL,
  `origin_type` varchar(64) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_bank_datev` (`datev`),
  KEY `idx_bank_dateo` (`dateo`),
  KEY `idx_bank_fk_account` (`fk_account`),
  KEY `idx_bank_rappro` (`rappro`),
  KEY `idx_bank_num_releve` (`num_releve`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_bank`
-- ----------------------------
BEGIN;
INSERT INTO `llx_bank` VALUES ('1', '2021-05-06 15:29:54', '2021-05-06 10:29:54', '2021-05-06', '2021-05-06', '0.00000000', '(Saldo inicial)', '1', '1', null, 'SOLD', null, null, '', '0', null, '0', null, null, null, null, null, null), ('2', '2021-05-06 15:30:10', '2021-05-06 10:30:10', '2021-05-06', '2021-05-06', '0.00000000', '(Saldo inicial)', '2', '1', null, 'SOLD', null, null, '', '0', null, '0', null, null, null, null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `llx_bank_account`
-- ----------------------------
DROP TABLE IF EXISTS `llx_bank_account`;
CREATE TABLE `llx_bank_account` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ref` varchar(12) NOT NULL,
  `label` varchar(30) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `bank` varchar(60) DEFAULT NULL,
  `code_banque` varchar(128) DEFAULT NULL,
  `code_guichet` varchar(6) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `cle_rib` varchar(5) DEFAULT NULL,
  `bic` varchar(11) DEFAULT NULL,
  `iban_prefix` varchar(34) DEFAULT NULL,
  `country_iban` varchar(2) DEFAULT NULL,
  `cle_iban` varchar(2) DEFAULT NULL,
  `domiciliation` varchar(255) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `fk_pays` int(11) NOT NULL,
  `proprio` varchar(60) DEFAULT NULL,
  `owner_address` varchar(255) DEFAULT NULL,
  `courant` smallint(6) NOT NULL DEFAULT '0',
  `clos` smallint(6) NOT NULL DEFAULT '0',
  `rappro` smallint(6) DEFAULT '1',
  `url` varchar(128) DEFAULT NULL,
  `account_number` varchar(32) DEFAULT NULL,
  `fk_accountancy_journal` int(11) DEFAULT NULL,
  `currency_code` varchar(3) NOT NULL,
  `min_allowed` int(11) DEFAULT '0',
  `min_desired` int(11) DEFAULT '0',
  `comment` text,
  `note_public` text,
  `model_pdf` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_bank_account_label` (`label`,`entity`),
  KEY `idx_fk_accountancy_journal` (`fk_accountancy_journal`),
  CONSTRAINT `fk_bank_account_accountancy_journal` FOREIGN KEY (`fk_accountancy_journal`) REFERENCES `llx_accounting_journal` (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_bank_account`
-- ----------------------------
BEGIN;
INSERT INTO `llx_bank_account` VALUES ('1', '2021-05-06 15:29:54', '2021-05-06 10:29:54', 'Banco', 'Banco', '1', null, null, '', '', '', '', '', '', '', null, null, '', null, '4', '', '', '1', '0', '1', null, '', null, 'EUR', null, null, '', null, null, null, null), ('2', '2021-05-06 15:30:10', '2021-05-06 10:30:10', 'Caja', 'caja', '1', null, null, '', '', '', '', '', '', '', null, null, '', null, '4', '', '', '2', '0', '1', null, '', null, 'EUR', null, null, '', null, null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `llx_bank_account_extrafields`
-- ----------------------------
DROP TABLE IF EXISTS `llx_bank_account_extrafields`;
CREATE TABLE `llx_bank_account_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_bank_account_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_bank_categ`
-- ----------------------------
DROP TABLE IF EXISTS `llx_bank_categ`;
CREATE TABLE `llx_bank_categ` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_bank_class`
-- ----------------------------
DROP TABLE IF EXISTS `llx_bank_class`;
CREATE TABLE `llx_bank_class` (
  `lineid` int(11) NOT NULL,
  `fk_categ` int(11) NOT NULL,
  UNIQUE KEY `uk_bank_class_lineid` (`lineid`,`fk_categ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_bank_url`
-- ----------------------------
DROP TABLE IF EXISTS `llx_bank_url`;
CREATE TABLE `llx_bank_url` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_bank` int(11) DEFAULT NULL,
  `url_id` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `type` varchar(24) NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_bank_url` (`fk_bank`,`url_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_blockedlog`
-- ----------------------------
DROP TABLE IF EXISTS `llx_blockedlog`;
CREATE TABLE `llx_blockedlog` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `date_creation` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `action` varchar(50) DEFAULT NULL,
  `amounts` double(24,8) NOT NULL,
  `element` varchar(50) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `user_fullname` varchar(255) DEFAULT NULL,
  `fk_object` int(11) DEFAULT NULL,
  `ref_object` varchar(255) DEFAULT NULL,
  `date_object` datetime DEFAULT NULL,
  `signature` varchar(100) NOT NULL,
  `signature_line` varchar(100) NOT NULL,
  `object_data` mediumtext,
  `certified` int(11) DEFAULT NULL,
  `object_version` varchar(32) DEFAULT '',
  PRIMARY KEY (`rowid`),
  KEY `signature` (`signature`),
  KEY `fk_object_element` (`fk_object`,`element`),
  KEY `entity` (`entity`),
  KEY `fk_user` (`fk_user`),
  KEY `entity_action` (`entity`,`action`),
  KEY `entity_action_certified` (`entity`,`action`,`certified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_blockedlog_authority`
-- ----------------------------
DROP TABLE IF EXISTS `llx_blockedlog_authority`;
CREATE TABLE `llx_blockedlog_authority` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `blockchain` longtext NOT NULL,
  `signature` varchar(100) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rowid`),
  KEY `signature` (`signature`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_bom_bom`
-- ----------------------------
DROP TABLE IF EXISTS `llx_bom_bom`;
CREATE TABLE `llx_bom_bom` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `ref` varchar(128) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` text,
  `note_public` text,
  `note_private` text,
  `fk_product` int(11) DEFAULT NULL,
  `qty` double(24,8) DEFAULT NULL,
  `efficiency` double(8,4) DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_valid` datetime DEFAULT NULL,
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `duration` double(24,8) DEFAULT NULL,
  `fk_warehouse` int(11) DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `bomtype` int(11) DEFAULT '0',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_bom_bom_ref` (`ref`,`entity`),
  KEY `idx_bom_bom_rowid` (`rowid`),
  KEY `idx_bom_bom_ref` (`ref`),
  KEY `llx_bom_bom_fk_user_creat` (`fk_user_creat`),
  KEY `idx_bom_bom_status` (`status`),
  KEY `idx_bom_bom_fk_product` (`fk_product`),
  CONSTRAINT `llx_bom_bom_fk_user_creat` FOREIGN KEY (`fk_user_creat`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_bom_bom_extrafields`
-- ----------------------------
DROP TABLE IF EXISTS `llx_bom_bom_extrafields`;
CREATE TABLE `llx_bom_bom_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_bom_bom_extrafields_fk_object` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_bom_bomline`
-- ----------------------------
DROP TABLE IF EXISTS `llx_bom_bomline`;
CREATE TABLE `llx_bom_bomline` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_bom` int(11) NOT NULL,
  `fk_product` int(11) NOT NULL,
  `fk_bom_child` int(11) DEFAULT NULL,
  `description` text,
  `import_key` varchar(14) DEFAULT NULL,
  `qty` double(24,8) NOT NULL,
  `efficiency` double(8,4) NOT NULL DEFAULT '1.0000',
  `position` int(11) NOT NULL,
  `qty_frozen` smallint(6) DEFAULT '0',
  `disable_stock_change` smallint(6) DEFAULT '0',
  PRIMARY KEY (`rowid`),
  KEY `idx_bom_bomline_rowid` (`rowid`),
  KEY `idx_bom_bomline_fk_product` (`fk_product`),
  KEY `idx_bom_bomline_fk_bom` (`fk_bom`),
  CONSTRAINT `llx_bom_bomline_fk_bom` FOREIGN KEY (`fk_bom`) REFERENCES `llx_bom_bom` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_bom_bomline_extrafields`
-- ----------------------------
DROP TABLE IF EXISTS `llx_bom_bomline_extrafields`;
CREATE TABLE `llx_bom_bomline_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_bookmark`
-- ----------------------------
DROP TABLE IF EXISTS `llx_bookmark`;
CREATE TABLE `llx_bookmark` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_user` int(11) NOT NULL,
  `dateb` datetime DEFAULT NULL,
  `url` text,
  `target` varchar(16) DEFAULT NULL,
  `title` varchar(64) DEFAULT NULL,
  `favicon` varchar(24) DEFAULT NULL,
  `position` int(11) DEFAULT '0',
  `entity` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_bookmark_title` (`fk_user`,`entity`,`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_bordereau_cheque`
-- ----------------------------
DROP TABLE IF EXISTS `llx_bordereau_cheque`;
CREATE TABLE `llx_bordereau_cheque` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) NOT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `datec` datetime NOT NULL,
  `date_bordereau` date DEFAULT NULL,
  `amount` double(24,8) NOT NULL,
  `nbcheque` smallint(6) NOT NULL,
  `fk_bank_account` int(11) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `statut` smallint(6) NOT NULL DEFAULT '0',
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `note` text,
  `entity` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_bordereau_cheque` (`ref`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_boxes`
-- ----------------------------
DROP TABLE IF EXISTS `llx_boxes`;
CREATE TABLE `llx_boxes` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `box_id` int(11) NOT NULL,
  `position` smallint(6) NOT NULL,
  `box_order` varchar(3) NOT NULL,
  `fk_user` int(11) NOT NULL DEFAULT '0',
  `maxline` int(11) DEFAULT NULL,
  `params` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_boxes` (`entity`,`box_id`,`position`,`fk_user`),
  KEY `idx_boxes_boxid` (`box_id`),
  KEY `idx_boxes_fk_user` (`fk_user`),
  CONSTRAINT `fk_boxes_box_id` FOREIGN KEY (`box_id`) REFERENCES `llx_boxes_def` (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_boxes`
-- ----------------------------
BEGIN;
INSERT INTO `llx_boxes` VALUES ('1', '1', '1', '0', '0', '0', null, null), ('2', '1', '2', '0', '0', '0', null, null), ('3', '1', '3', '0', '0', '0', null, null), ('4', '1', '4', '0', '0', '0', null, null), ('5', '1', '5', '0', '0', '0', null, null), ('6', '1', '6', '0', '0', '0', null, null), ('7', '1', '7', '0', '0', '0', null, null), ('8', '1', '8', '0', '0', '0', null, null), ('9', '1', '9', '0', '0', '0', null, null), ('10', '1', '10', '0', '0', '0', null, null), ('11', '1', '11', '0', '0', '0', null, null), ('12', '1', '12', '0', '0', '0', null, null), ('14', '1', '14', '0', '0', '0', null, null), ('15', '1', '15', '0', '0', '0', null, null), ('16', '1', '16', '0', '0', '0', null, null), ('17', '1', '17', '0', '0', '0', null, null), ('18', '1', '18', '0', '0', '0', null, null), ('19', '1', '19', '0', '0', '0', null, null), ('20', '1', '20', '0', '0', '0', null, null), ('21', '1', '21', '0', '0', '0', null, null), ('22', '1', '22', '0', '0', '0', null, null), ('23', '1', '23', '0', '0', '0', null, null), ('24', '1', '24', '0', '0', '0', null, null), ('25', '1', '25', '0', '0', '0', null, null), ('26', '1', '26', '0', '0', '0', null, null), ('27', '1', '27', '0', '0', '0', null, null), ('28', '1', '28', '0', '0', '0', null, null), ('29', '1', '29', '0', '0', '0', null, null), ('30', '1', '30', '0', '0', '0', null, null), ('31', '1', '36', '0', '0', '0', null, null), ('32', '1', '37', '0', '0', '0', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `llx_boxes_def`
-- ----------------------------
DROP TABLE IF EXISTS `llx_boxes_def`;
CREATE TABLE `llx_boxes_def` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `file` varchar(200) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `note` varchar(130) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_boxes_def` (`file`,`entity`,`note`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_boxes_def`
-- ----------------------------
BEGIN;
INSERT INTO `llx_boxes_def` VALUES ('1', 'box_lastlogin.php', '1', '2021-04-28 08:55:49', null), ('2', 'box_clients.php', '1', '2021-04-28 08:58:11', null), ('3', 'box_prospect.php', '1', '2021-04-28 08:58:11', null), ('4', 'box_contacts.php', '1', '2021-04-28 08:58:11', null), ('5', 'box_activity.php', '1', '2021-04-28 08:58:11', '(WarningUsingThisBoxSlowDown)'), ('6', 'box_goodcustomers.php', '1', '2021-04-28 08:58:11', '(WarningUsingThisBoxSlowDown)'), ('7', 'box_factures_imp.php', '1', '2021-04-28 08:58:15', null), ('8', 'box_factures.php', '1', '2021-04-28 08:58:15', null), ('9', 'box_graph_invoices_permonth.php', '1', '2021-04-28 08:58:15', null), ('10', 'box_produits.php', '1', '2021-04-28 09:14:03', null), ('11', 'box_produits_alerte_stock.php', '1', '2021-04-28 09:14:03', null), ('12', 'box_graph_product_distribution.php', '1', '2021-04-28 09:14:03', null), ('14', 'box_commandes.php', '1', '2021-04-28 09:14:09', null), ('15', 'box_graph_orders_permonth.php', '1', '2021-04-28 09:14:09', null), ('16', 'box_graph_invoices_supplier_permonth.php', '1', '2021-04-28 09:14:09', null), ('17', 'box_graph_orders_supplier_permonth.php', '1', '2021-04-28 09:14:09', null), ('18', 'box_fournisseurs.php', '1', '2021-04-28 09:14:09', null), ('19', 'box_factures_fourn_imp.php', '1', '2021-04-28 09:14:09', null), ('20', 'box_factures_fourn.php', '1', '2021-04-28 09:14:09', null), ('21', 'box_supplier_orders.php', '1', '2021-04-28 09:14:09', null), ('22', 'box_graph_propales_permonth.php', '1', '2021-05-06 04:33:52', null), ('23', 'box_propales.php', '1', '2021-05-06 04:33:52', null), ('24', 'box_contracts.php', '1', '2021-05-06 04:33:56', null), ('25', 'box_services_expired.php', '1', '2021-05-06 04:33:56', null), ('26', 'box_comptes.php', '1', '2021-05-06 04:34:12', null), ('27', 'box_actions.php', '1', '2021-05-06 04:34:27', null), ('28', 'box_project.php', '1', '2021-05-06 04:34:29', null), ('29', 'box_task.php', '1', '2021-05-06 04:34:29', null), ('30', 'box_bookmarks.php', '1', '2021-05-06 04:34:42', null), ('31', 'box_funnel_of_prospection.php', '1', '2021-05-06 04:49:10', null), ('32', 'box_customers_outstanding_bill_reached.php', '1', '2021-05-06 04:49:10', null), ('33', 'box_scheduled_jobs.php', '1', '2021-05-06 04:49:10', null), ('34', 'box_supplier_orders_awaiting_reception.php', '1', '2021-05-06 04:49:23', null), ('35', 'box_birthdays.php', '1', '2021-05-06 04:49:25', null), ('36', 'box_boms.php', '1', '2021-05-06 05:06:27', null), ('37', 'box_mos.php', '1', '2021-05-06 05:06:30', null);
COMMIT;

-- ----------------------------
--  Table structure for `llx_budget`
-- ----------------------------
DROP TABLE IF EXISTS `llx_budget`;
CREATE TABLE `llx_budget` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `label` varchar(255) NOT NULL,
  `status` int(11) DEFAULT NULL,
  `note` text,
  `date_start` date DEFAULT NULL,
  `date_end` date DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_budget_lines`
-- ----------------------------
DROP TABLE IF EXISTS `llx_budget_lines`;
CREATE TABLE `llx_budget_lines` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_budget` int(11) NOT NULL,
  `fk_project_ids` varchar(180) NOT NULL,
  `amount` double(24,8) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_budget_lines` (`fk_budget`,`fk_project_ids`),
  CONSTRAINT `fk_budget_lines_budget` FOREIGN KEY (`fk_budget`) REFERENCES `llx_budget` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_c_accounting_category`
-- ----------------------------
DROP TABLE IF EXISTS `llx_c_accounting_category`;
CREATE TABLE `llx_c_accounting_category` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `code` varchar(16) NOT NULL,
  `label` varchar(255) NOT NULL,
  `range_account` varchar(255) NOT NULL,
  `sens` tinyint(4) NOT NULL DEFAULT '0',
  `category_type` tinyint(4) NOT NULL DEFAULT '0',
  `formula` varchar(255) NOT NULL,
  `position` int(11) DEFAULT '0',
  `fk_country` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_accounting_category` (`code`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_c_accounting_category`
-- ----------------------------
BEGIN;
INSERT INTO `llx_c_accounting_category` VALUES ('1', '1', 'INCOMES', 'Income of products/services', 'Example: 7xxxxx', '0', '0', '', '10', '0', '1'), ('2', '1', 'EXPENSES', 'Expenses of products/services', 'Example: 6xxxxx', '0', '0', '', '20', '0', '1'), ('3', '1', 'PROFIT', 'Balance', '', '0', '1', 'INCOMES+EXPENSES', '30', '0', '1');
COMMIT;

-- ----------------------------
--  Table structure for `llx_c_action_trigger`
-- ----------------------------
DROP TABLE IF EXISTS `llx_c_action_trigger`;
CREATE TABLE `llx_c_action_trigger` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `elementtype` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `label` varchar(128) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `rang` int(11) DEFAULT '0',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_action_trigger_code` (`code`),
  KEY `idx_action_trigger_rang` (`rang`)
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_c_action_trigger`
-- ----------------------------
BEGIN;
INSERT INTO `llx_c_action_trigger` VALUES ('66', 'societe', 'COMPANY_CREATE', 'Third party created', 'Executed when a third party is created', '1'), ('67', 'societe', 'COMPANY_SENTBYMAIL', 'Mails sent from third party card', 'Executed when you send email from third party card', '1'), ('68', 'propal', 'PROPAL_VALIDATE', 'Customer proposal validated', 'Executed when a commercial proposal is validated', '2'), ('69', 'propal', 'PROPAL_SENTBYMAIL', 'Commercial proposal sent by mail', 'Executed when a commercial proposal is sent by mail', '3'), ('70', 'propal', 'PROPAL_CLOSE_SIGNED', 'Customer proposal closed signed', 'Executed when a customer proposal is closed signed', '2'), ('71', 'propal', 'PROPAL_CLOSE_REFUSED', 'Customer proposal closed refused', 'Executed when a customer proposal is closed refused', '2'), ('72', 'propal', 'PROPAL_CLASSIFY_BILLED', 'Customer proposal set billed', 'Executed when a customer proposal is set to billed', '2'), ('73', 'commande', 'ORDER_VALIDATE', 'Customer order validate', 'Executed when a customer order is validated', '4'), ('74', 'commande', 'ORDER_CLOSE', 'Customer order classify delivered', 'Executed when a customer order is set delivered', '5'), ('75', 'commande', 'ORDER_CLASSIFY_BILLED', 'Customer order classify billed', 'Executed when a customer order is set to billed', '5'), ('76', 'commande', 'ORDER_CANCEL', 'Customer order canceled', 'Executed when a customer order is canceled', '5'), ('77', 'commande', 'ORDER_SENTBYMAIL', 'Customer order sent by mail', 'Executed when a customer order is sent by mail ', '5'), ('78', 'facture', 'BILL_VALIDATE', 'Customer invoice validated', 'Executed when a customer invoice is approved', '6'), ('79', 'facture', 'BILL_PAYED', 'Customer invoice payed', 'Executed when a customer invoice is payed', '7'), ('80', 'facture', 'BILL_CANCEL', 'Customer invoice canceled', 'Executed when a customer invoice is conceled', '8'), ('81', 'facture', 'BILL_SENTBYMAIL', 'Customer invoice sent by mail', 'Executed when a customer invoice is sent by mail', '9'), ('82', 'facture', 'BILL_UNVALIDATE', 'Customer invoice unvalidated', 'Executed when a customer invoice status set back to draft', '9'), ('83', 'proposal_supplier', 'PROPOSAL_SUPPLIER_VALIDATE', 'Price request validated', 'Executed when a commercial proposal is validated', '10'), ('84', 'proposal_supplier', 'PROPOSAL_SUPPLIER_SENTBYMAIL', 'Price request sent by mail', 'Executed when a commercial proposal is sent by mail', '10'), ('85', 'proposal_supplier', 'PROPOSAL_SUPPLIER_CLOSE_SIGNED', 'Price request closed signed', 'Executed when a customer proposal is closed signed', '10'), ('86', 'proposal_supplier', 'PROPOSAL_SUPPLIER_CLOSE_REFUSED', 'Price request closed refused', 'Executed when a customer proposal is closed refused', '10'), ('87', 'order_supplier', 'ORDER_SUPPLIER_VALIDATE', 'Supplier order validated', 'Executed when a supplier order is validated', '12'), ('88', 'order_supplier', 'ORDER_SUPPLIER_APPROVE', 'Supplier order request approved', 'Executed when a supplier order is approved', '13'), ('89', 'order_supplier', 'ORDER_SUPPLIER_SUBMIT', 'Supplier order request submited', 'Executed when a supplier order is approved', '13'), ('90', 'order_supplier', 'ORDER_SUPPLIER_RECEIVE', 'Supplier order request received', 'Executed when a supplier order is received', '13'), ('91', 'order_supplier', 'ORDER_SUPPLIER_REFUSE', 'Supplier order request refused', 'Executed when a supplier order is refused', '13'), ('92', 'order_supplier', 'ORDER_SUPPLIER_SENTBYMAIL', 'Supplier order sent by mail', 'Executed when a supplier order is sent by mail', '14'), ('93', 'order_supplier', 'ORDER_SUPPLIER_CLASSIFY_BILLED', 'Supplier order set billed', 'Executed when a supplier order is set as billed', '14'), ('94', 'invoice_supplier', 'BILL_SUPPLIER_VALIDATE', 'Supplier invoice validated', 'Executed when a supplier invoice is validated', '15'), ('95', 'invoice_supplier', 'BILL_SUPPLIER_UNVALIDATE', 'Supplier invoice unvalidated', 'Executed when a supplier invoice status is set back to draft', '15'), ('96', 'invoice_supplier', 'BILL_SUPPLIER_PAYED', 'Supplier invoice payed', 'Executed when a supplier invoice is payed', '16'), ('97', 'invoice_supplier', 'BILL_SUPPLIER_SENTBYMAIL', 'Supplier invoice sent by mail', 'Executed when a supplier invoice is sent by mail', '17'), ('98', 'invoice_supplier', 'BILL_SUPPLIER_CANCELED', 'Supplier invoice cancelled', 'Executed when a supplier invoice is cancelled', '17'), ('99', 'contrat', 'CONTRACT_VALIDATE', 'Contract validated', 'Executed when a contract is validated', '18'), ('100', 'contrat', 'CONTRACT_SENTBYMAIL', 'Contract sent by mail', 'Executed when a contract is sent by mail', '18'), ('101', 'shipping', 'SHIPPING_VALIDATE', 'Shipping validated', 'Executed when a shipping is validated', '20'), ('102', 'shipping', 'SHIPPING_SENTBYMAIL', 'Shipping sent by mail', 'Executed when a shipping is sent by mail', '21'), ('103', 'member', 'MEMBER_VALIDATE', 'Member validated', 'Executed when a member is validated', '22'), ('104', 'member', 'MEMBER_SENTBYMAIL', 'Mails sent from member card', 'Executed when you send email from member card', '23'), ('105', 'member', 'MEMBER_SUBSCRIPTION_CREATE', 'Member subscribtion recorded', 'Executed when a member subscribtion is deleted', '24'), ('106', 'member', 'MEMBER_SUBSCRIPTION_MODIFY', 'Member subscribtion modified', 'Executed when a member subscribtion is modified', '24'), ('107', 'member', 'MEMBER_SUBSCRIPTION_DELETE', 'Member subscribtion deleted', 'Executed when a member subscribtion is deleted', '24'), ('108', 'member', 'MEMBER_RESILIATE', 'Member resiliated', 'Executed when a member is resiliated', '25'), ('109', 'member', 'MEMBER_DELETE', 'Member deleted', 'Executed when a member is deleted', '26'), ('110', 'ficheinter', 'FICHINTER_VALIDATE', 'Intervention validated', 'Executed when a intervention is validated', '30'), ('111', 'ficheinter', 'FICHINTER_CLASSIFY_BILLED', 'Intervention set billed', 'Executed when a intervention is set to billed (when option FICHINTER_CLASSIFY_BILLED is set)', '32'), ('112', 'ficheinter', 'FICHINTER_CLASSIFY_UNBILLED', 'Intervention set unbilled', 'Executed when a intervention is set to unbilled (when option FICHINTER_CLASSIFY_BILLED is set)', '33'), ('113', 'ficheinter', 'FICHINTER_REOPEN', 'Intervention opened', 'Executed when a intervention is re-opened', '34'), ('114', 'ficheinter', 'FICHINTER_SENTBYMAIL', 'Intervention sent by mail', 'Executed when a intervention is sent by mail', '35'), ('115', 'product', 'PRODUCT_CREATE', 'Product or service created', 'Executed when a product or sevice is created', '40'), ('116', 'product', 'PRODUCT_DELETE', 'Product or service deleted', 'Executed when a product or sevice is deleted', '42'), ('117', 'expensereport', 'EXPENSE_REPORT_CREATE', 'Expense report created', 'Executed when an expense report is created', '201'), ('118', 'expensereport', 'EXPENSE_REPORT_VALIDATE', 'Expense report validated', 'Executed when an expense report is validated', '202'), ('119', 'expensereport', 'EXPENSE_REPORT_APPROVE', 'Expense report approved', 'Executed when an expense report is approved', '203'), ('120', 'expensereport', 'EXPENSE_REPORT_PAID', 'Expense report billed', 'Executed when an expense report is set as billed', '204'), ('121', 'project', 'PROJECT_VALIDATE', 'Project validation', 'Executed when a project is validated', '141'), ('122', 'project', 'PROJECT_DELETE', 'Project deleted', 'Executed when a project is deleted', '143'), ('123', 'product', 'PRODUCT_MODIFY', 'Product or service modified', 'Executed when a product or sevice is modified', '41'), ('124', 'member', 'MEMBER_MODIFY', 'Member modified', 'Executed when a member is modified', '23'), ('125', 'ficheinter', 'FICHINTER_MODIFY', 'Intervention modified', 'Executed when a intervention is modified', '31'), ('126', 'project', 'PROJECT_CREATE', 'Project creation', 'Executed when a project is created', '140'), ('127', 'project', 'PROJECT_MODIFY', 'Project modified', 'Executed when a project is modified', '142'), ('128', 'project', 'TASK_CREATE', 'Task created', 'Executed when a project task is created', '150'), ('129', 'project', 'TASK_MODIFY', 'Task modified', 'Executed when a project task is modified', '151'), ('130', 'project', 'TASK_DELETE', 'Task deleted', 'Executed when a project task is deleted', '152'), ('131', 'societe', 'COMPANY_DELETE', 'Third party deleted', 'Executed when you delete third party', '1'), ('132', 'propal', 'PROPAL_DELETE', 'Customer proposal deleted', 'Executed when a customer proposal is deleted', '2'), ('133', 'commande', 'ORDER_DELETE', 'Customer order deleted', 'Executed when a customer order is deleted', '5'), ('134', 'facture', 'BILL_DELETE', 'Customer invoice deleted', 'Executed when a customer invoice is deleted', '9'), ('135', 'proposal_supplier', 'PROPOSAL_SUPPLIER_DELETE', 'Price request deleted', 'Executed when a customer proposal delete', '10'), ('136', 'order_supplier', 'ORDER_SUPPLIER_DELETE', 'Supplier order deleted', 'Executed when a supplier order is deleted', '14'), ('137', 'invoice_supplier', 'BILL_SUPPLIER_DELETE', 'Supplier invoice deleted', 'Executed when a supplier invoice is deleted', '17'), ('138', 'contrat', 'CONTRACT_DELETE', 'Contract deleted', 'Executed when a contract is deleted', '18'), ('139', 'ficheinter', 'FICHINTER_DELETE', 'Intervention is deleted', 'Executed when a intervention is deleted', '35'), ('140', 'expensereport', 'EXPENSE_REPORT_DELETE', 'Expense report deleted', 'Executed when an expense report is deleted', '204'), ('141', 'expensereport', 'HOLIDAY_VALIDATE', 'Expense report validated', 'Executed when an expense report is validated', '202'), ('142', 'expensereport', 'HOLIDAY_APPROVE', 'Expense report approved', 'Executed when an expense report is approved', '203'), ('143', 'ticket', 'TICKET_CREATE', 'Ticket created', 'Executed when a ticket is created', '161'), ('144', 'ticket', 'TICKET_MODIFY', 'Ticket modified', 'Executed when a ticket is modified', '163'), ('145', 'ticket', 'TICKET_ASSIGNED', 'Ticket assigned', 'Executed when a ticket is assigned to another user', '164'), ('146', 'ticket', 'TICKET_CLOSE', 'Ticket closed', 'Executed when a ticket is closed', '165'), ('147', 'ticket', 'TICKET_SENTBYMAIL', 'Ticket message sent by email', 'Executed when a message is sent from the ticket record', '166'), ('148', 'ticket', 'TICKET_DELETE', 'Ticket deleted', 'Executed when a ticket is deleted', '167'), ('149', 'user', 'USER_SENTBYMAIL', 'Email sent', 'Executed when an email is sent from user card', '300'), ('150', 'bom', 'BOM_VALIDATE', 'BOM validated', 'Executed when a BOM is validated', '650'), ('151', 'bom', 'BOM_UNVALIDATE', 'BOM unvalidated', 'Executed when a BOM is unvalidated', '651'), ('152', 'bom', 'BOM_CLOSE', 'BOM disabled', 'Executed when a BOM is disabled', '652'), ('153', 'bom', 'BOM_REOPEN', 'BOM reopen', 'Executed when a BOM is re-open', '653'), ('154', 'bom', 'BOM_DELETE', 'BOM deleted', 'Executed when a BOM deleted', '654'), ('155', 'bom', 'MRP_MO_VALIDATE', 'MO validated', 'Executed when a MO is validated', '660'), ('156', 'bom', 'MRP_MO_PRODUCED', 'MO produced', 'Executed when a MO is produced', '661'), ('157', 'bom', 'MRP_MO_DELETE', 'MO deleted', 'Executed when a MO is deleted', '662'), ('158', 'bom', 'MRP_MO_CANCEL', 'MO canceled', 'Executed when a MO is canceled', '663'), ('159', 'contact', 'CONTACT_CREATE', 'Contact address created', 'Executed when a contact is created', '50'), ('160', 'contact', 'CONTACT_SENTBYMAIL', 'Mails sent from third party card', 'Executed when you send email from contact adress card', '51'), ('161', 'contact', 'CONTACT_DELETE', 'Contact address deleted', 'Executed when a contact is deleted', '52'), ('162', 'recruitment', 'RECRUITMENTJOBPOSITION_CREATE', 'Job created', 'Executed when a job is created', '7500'), ('163', 'recruitment', 'RECRUITMENTJOBPOSITION_MODIFY', 'Job modified', 'Executed when a job is modified', '7502'), ('164', 'recruitment', 'RECRUITMENTJOBPOSITION_SENTBYMAIL', 'Mails sent from job record', 'Executed when you send email from job record', '7504'), ('165', 'recruitment', 'RECRUITMENTJOBPOSITION_DELETE', 'Job deleted', 'Executed when a job is deleted', '7506'), ('166', 'recruitment', 'RECRUITMENTCANDIDATURE_CREATE', 'Candidature created', 'Executed when a candidature is created', '7510'), ('167', 'recruitment', 'RECRUITMENTCANDIDATURE_MODIFY', 'Candidature modified', 'Executed when a candidature is modified', '7512'), ('168', 'recruitment', 'RECRUITMENTCANDIDATURE_SENTBYMAIL', 'Mails sent from candidature record', 'Executed when you send email from candidature record', '7514'), ('169', 'recruitment', 'RECRUITMENTCANDIDATURE_DELETE', 'Candidature deleted', 'Executed when a candidature is deleted', '7516');
COMMIT;

-- ----------------------------
--  Table structure for `llx_c_actioncomm`
-- ----------------------------
DROP TABLE IF EXISTS `llx_c_actioncomm`;
CREATE TABLE `llx_c_actioncomm` (
  `id` int(11) NOT NULL,
  `code` varchar(12) NOT NULL,
  `type` varchar(50) NOT NULL DEFAULT 'system',
  `libelle` varchar(48) NOT NULL,
  `module` varchar(16) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `todo` tinyint(4) DEFAULT NULL,
  `color` varchar(9) DEFAULT NULL,
  `picto` varchar(48) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_c_actioncomm` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_c_actioncomm`
-- ----------------------------
BEGIN;
INSERT INTO `llx_c_actioncomm` VALUES ('1', 'AC_TEL', 'system', 'Phone call', null, '1', null, null, null, '2'), ('2', 'AC_FAX', 'system', 'Send Fax', null, '1', null, null, null, '3'), ('4', 'AC_EMAIL', 'system', 'Send Email', null, '1', null, null, null, '4'), ('5', 'AC_RDV', 'system', 'Rendez-vous', null, '1', null, null, null, '1'), ('6', 'AC_EMAIL_IN', 'system', 'reception Email', null, '1', null, null, null, '4'), ('11', 'AC_INT', 'system', 'Intervention on site', null, '1', null, null, null, '4'), ('40', 'AC_OTH_AUTO', 'systemauto', 'Other (automatically inserted events)', null, '1', null, null, null, '20'), ('50', 'AC_OTH', 'system', 'Other (manually inserted events)', null, '1', null, null, null, '5');
COMMIT;

-- ----------------------------
--  Table structure for `llx_c_availability`
-- ----------------------------
DROP TABLE IF EXISTS `llx_c_availability`;
CREATE TABLE `llx_c_availability` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) NOT NULL,
  `label` varchar(60) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_availability` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_c_availability`
-- ----------------------------
BEGIN;
INSERT INTO `llx_c_availability` VALUES ('1', 'AV_NOW', 'Immediate', '1'), ('2', 'AV_1W', '1 week', '1'), ('3', 'AV_2W', '2 weeks', '1'), ('4', 'AV_3W', '3 weeks', '1');
COMMIT;

-- ----------------------------
--  Table structure for `llx_c_barcode_type`
-- ----------------------------
DROP TABLE IF EXISTS `llx_c_barcode_type`;
CREATE TABLE `llx_c_barcode_type` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(16) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `libelle` varchar(50) NOT NULL,
  `coder` varchar(16) NOT NULL,
  `example` varchar(16) NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_barcode_type` (`code`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_c_barcode_type`
-- ----------------------------
BEGIN;
INSERT INTO `llx_c_barcode_type` VALUES ('1', 'EAN8', '1', 'EAN8', 'tcpdfbarcode', '1234567'), ('2', 'EAN13', '1', 'EAN13', 'tcpdfbarcode', '123456789012'), ('3', 'UPC', '1', 'UPC', 'tcpdfbarcode', '123456789012'), ('4', 'ISBN', '1', 'ISBN', 'tcpdfbarcode', '123456789'), ('5', 'C39', '1', 'Code 39', 'tcpdfbarcode', '1234567890'), ('6', 'C128', '1', 'Code 128', 'tcpdfbarcode', 'ABCD1234567890'), ('7', 'DATAMATRIX', '1', 'Datamatrix', 'tcpdfbarcode', '1234567xyz'), ('8', 'QRCODE', '1', 'Qr Code', 'tcpdfbarcode', 'www.dolibarr.org');
COMMIT;

-- ----------------------------
--  Table structure for `llx_c_chargesociales`
-- ----------------------------
DROP TABLE IF EXISTS `llx_c_chargesociales`;
CREATE TABLE `llx_c_chargesociales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(80) DEFAULT NULL,
  `deductible` smallint(6) NOT NULL DEFAULT '0',
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `code` varchar(12) NOT NULL,
  `accountancy_code` varchar(32) DEFAULT NULL,
  `fk_pays` int(11) NOT NULL DEFAULT '1',
  `module` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4110 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_c_chargesociales`
-- ----------------------------
BEGIN;
INSERT INTO `llx_c_chargesociales` VALUES ('1', 'Allocations familiales', '1', '1', 'TAXFAM', null, '1', null), ('2', 'CSG Deductible', '1', '1', 'TAXCSGD', null, '1', null), ('3', 'CSG/CRDS NON Deductible', '0', '1', 'TAXCSGND', null, '1', null), ('10', 'Taxe apprentissage', '0', '1', 'TAXAPP', null, '1', null), ('11', 'Taxe professionnelle', '0', '1', 'TAXPRO', null, '1', null), ('12', 'Cotisation fonciere des entreprises', '0', '1', 'TAXCFE', null, '1', null), ('13', 'Cotisation sur la valeur ajoutee des entreprises', '0', '1', 'TAXCVAE', null, '1', null), ('20', 'Impots locaux/fonciers', '0', '1', 'TAXFON', null, '1', null), ('25', 'Impots revenus', '0', '1', 'TAXREV', null, '1', null), ('30', 'Assurance Sante', '0', '1', 'TAXSECU', null, '1', null), ('40', 'Mutuelle', '0', '1', 'TAXMUT', null, '1', null), ('50', 'Assurance vieillesse', '0', '1', 'TAXRET', null, '1', null), ('60', 'Assurance Chomage', '0', '1', 'TAXCHOM', null, '1', null), ('201', 'ONSS', '1', '1', 'TAXBEONSS', null, '2', null), ('210', 'Precompte professionnel', '1', '1', 'TAXBEPREPRO', null, '2', null), ('220', 'Prime existence', '1', '1', 'TAXBEPRIEXI', null, '2', null), ('230', 'Precompte immobilier', '1', '1', 'TAXBEPREIMMO', null, '2', null), ('4101', 'Krankenversicherung', '1', '1', 'TAXATKV', null, '41', null), ('4102', 'Unfallversicherung', '1', '1', 'TAXATUV', null, '41', null), ('4103', 'Pensionsversicherung', '1', '1', 'TAXATPV', null, '41', null), ('4104', 'Arbeitslosenversicherung', '1', '1', 'TAXATAV', null, '41', null), ('4105', 'Insolvenzentgeltsicherungsfond', '1', '1', 'TAXATIESG', null, '41', null), ('4106', 'Wohnbauförderung', '1', '1', 'TAXATWF', null, '41', null), ('4107', 'Arbeiterkammerumlage', '1', '1', 'TAXATAK', null, '41', null), ('4108', 'Mitarbeitervorsorgekasse', '1', '1', 'TAXATMVK', null, '41', null), ('4109', 'Familienlastenausgleichsfond', '1', '1', 'TAXATFLAF', null, '41', null);
COMMIT;

-- ----------------------------
--  Table structure for `llx_c_civility`
-- ----------------------------
DROP TABLE IF EXISTS `llx_c_civility`;
CREATE TABLE `llx_c_civility` (
  `rowid` int(11) NOT NULL,
  `code` varchar(6) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `module` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_civility` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_c_civility`
-- ----------------------------
BEGIN;
INSERT INTO `llx_c_civility` VALUES ('1', 'MME', 'Madame', '1', null), ('3', 'MR', 'Monsieur', '1', null), ('5', 'MLE', 'Mademoiselle', '1', null), ('7', 'MTRE', 'Maître', '1', null), ('8', 'DR', 'Docteur', '1', null);
COMMIT;

-- ----------------------------
--  Table structure for `llx_c_country`
-- ----------------------------
DROP TABLE IF EXISTS `llx_c_country`;
CREATE TABLE `llx_c_country` (
  `rowid` int(11) NOT NULL,
  `code` varchar(2) NOT NULL,
  `code_iso` varchar(3) DEFAULT NULL,
  `label` varchar(50) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `favorite` tinyint(4) NOT NULL DEFAULT '0',
  `eec` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_c_country_code` (`code`),
  UNIQUE KEY `idx_c_country_label` (`label`),
  UNIQUE KEY `idx_c_country_code_iso` (`code_iso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_c_country`
-- ----------------------------
BEGIN;
INSERT INTO `llx_c_country` VALUES ('0', '', null, '-', '1', '1', null), ('1', 'FR', 'FRA', 'France', '1', '0', '1'), ('2', 'BE', 'BEL', 'Belgium', '1', '0', '1'), ('3', 'IT', 'ITA', 'Italy', '1', '0', '1'), ('4', 'ES', 'ESP', 'Spain', '1', '0', '1'), ('5', 'DE', 'DEU', 'Germany', '1', '0', '1'), ('6', 'CH', 'CHE', 'Switzerland', '1', '0', null), ('7', 'GB', 'GBR', 'United Kingdom', '1', '0', '1'), ('8', 'IE', 'IRL', 'Irland', '1', '0', '1'), ('9', 'CN', 'CHN', 'China', '1', '0', null), ('10', 'TN', 'TUN', 'Tunisia', '1', '0', null), ('11', 'US', 'USA', 'United States', '1', '0', null), ('12', 'MA', 'MAR', 'Maroc', '1', '0', null), ('13', 'DZ', 'DZA', 'Algeria', '1', '0', null), ('14', 'CA', 'CAN', 'Canada', '1', '0', null), ('15', 'TG', 'TGO', 'Togo', '1', '0', null), ('16', 'GA', 'GAB', 'Gabon', '1', '0', null), ('17', 'NL', 'NLD', 'Nederland', '1', '0', '1'), ('18', 'HU', 'HUN', 'Hongrie', '1', '0', '1'), ('19', 'RU', 'RUS', 'Russia', '1', '0', null), ('20', 'SE', 'SWE', 'Sweden', '1', '0', '1'), ('21', 'CI', 'CIV', 'Côte d\'Ivoire', '1', '0', null), ('22', 'SN', 'SEN', 'Senegal', '1', '0', null), ('23', 'AR', 'ARG', 'Argentine', '1', '0', null), ('24', 'CM', 'CMR', 'Cameroun', '1', '0', null), ('25', 'PT', 'PRT', 'Portugal', '1', '0', '1'), ('26', 'SA', 'SAU', 'Saudi Arabia', '1', '0', null), ('27', 'MC', 'MCO', 'Monaco', '1', '0', '1'), ('28', 'AU', 'AUS', 'Australia', '1', '0', null), ('29', 'SG', 'SGP', 'Singapour', '1', '0', null), ('30', 'AF', 'AFG', 'Afghanistan', '1', '0', null), ('31', 'AX', 'ALA', 'Iles Aland', '1', '0', null), ('32', 'AL', 'ALB', 'Albanie', '1', '0', null), ('33', 'AS', 'ASM', 'Samoa américaines', '1', '0', null), ('34', 'AD', 'AND', 'Andorre', '1', '0', null), ('35', 'AO', 'AGO', 'Angola', '1', '0', null), ('36', 'AI', 'AIA', 'Anguilla', '1', '0', null), ('37', 'AQ', 'ATA', 'Antarctique', '1', '0', null), ('38', 'AG', 'ATG', 'Antigua-et-Barbuda', '1', '0', null), ('39', 'AM', 'ARM', 'Arménie', '1', '0', null), ('40', 'AW', 'ABW', 'Aruba', '1', '0', null), ('41', 'AT', 'AUT', 'Autriche', '1', '0', '1'), ('42', 'AZ', 'AZE', 'Azerbaïdjan', '1', '0', null), ('43', 'BS', 'BHS', 'Bahamas', '1', '0', null), ('44', 'BH', 'BHR', 'Bahreïn', '1', '0', null), ('45', 'BD', 'BGD', 'Bangladesh', '1', '0', null), ('46', 'BB', 'BRB', 'Barbade', '1', '0', null), ('47', 'BY', 'BLR', 'Biélorussie', '1', '0', null), ('48', 'BZ', 'BLZ', 'Belize', '1', '0', null), ('49', 'BJ', 'BEN', 'Bénin', '1', '0', null), ('50', 'BM', 'BMU', 'Bermudes', '1', '0', null), ('51', 'BT', 'BTN', 'Bhoutan', '1', '0', null), ('52', 'BO', 'BOL', 'Bolivie', '1', '0', null), ('53', 'BA', 'BIH', 'Bosnie-Herzégovine', '1', '0', null), ('54', 'BW', 'BWA', 'Botswana', '1', '0', null), ('55', 'BV', 'BVT', 'Ile Bouvet', '1', '0', null), ('56', 'BR', 'BRA', 'Brazil', '1', '0', null), ('57', 'IO', 'IOT', 'Territoire britannique de l\'Océan Indien', '1', '0', null), ('58', 'BN', 'BRN', 'Brunei', '1', '0', null), ('59', 'BG', 'BGR', 'Bulgarie', '1', '0', '1'), ('60', 'BF', 'BFA', 'Burkina Faso', '1', '0', null), ('61', 'BI', 'BDI', 'Burundi', '1', '0', null), ('62', 'KH', 'KHM', 'Cambodge', '1', '0', null), ('63', 'CV', 'CPV', 'Cap-Vert', '1', '0', null), ('64', 'KY', 'CYM', 'Iles Cayman', '1', '0', null), ('65', 'CF', 'CAF', 'République centrafricaine', '1', '0', null), ('66', 'TD', 'TCD', 'Tchad', '1', '0', null), ('67', 'CL', 'CHL', 'Chili', '1', '0', null), ('68', 'CX', 'CXR', 'Ile Christmas', '1', '0', null), ('69', 'CC', 'CCK', 'Iles des Cocos (Keeling)', '1', '0', null), ('70', 'CO', 'COL', 'Colombie', '1', '0', null), ('71', 'KM', 'COM', 'Comores', '1', '0', null), ('72', 'CG', 'COG', 'Congo', '1', '0', null), ('73', 'CD', 'COD', 'République démocratique du Congo', '1', '0', null), ('74', 'CK', 'COK', 'Iles Cook', '1', '0', null), ('75', 'CR', 'CRI', 'Costa Rica', '1', '0', null), ('76', 'HR', 'HRV', 'Croatie', '1', '0', '1'), ('77', 'CU', 'CUB', 'Cuba', '1', '0', null), ('78', 'CY', 'CYP', 'Cyprus', '1', '0', '1'), ('79', 'CZ', 'CZE', 'République Tchèque', '1', '0', '1'), ('80', 'DK', 'DNK', 'Danemark', '1', '0', '1'), ('81', 'DJ', 'DJI', 'Djibouti', '1', '0', null), ('82', 'DM', 'DMA', 'Dominique', '1', '0', null), ('83', 'DO', 'DOM', 'République Dominicaine', '1', '0', null), ('84', 'EC', 'ECU', 'Equateur', '1', '0', null), ('85', 'EG', 'EGY', 'Egypte', '1', '0', null), ('86', 'SV', 'SLV', 'Salvador', '1', '0', null), ('87', 'GQ', 'GNQ', 'Guinée Equatoriale', '1', '0', null), ('88', 'ER', 'ERI', 'Erythrée', '1', '0', null), ('89', 'EE', 'EST', 'Estonia', '1', '0', '1'), ('90', 'ET', 'ETH', 'Ethiopie', '1', '0', null), ('91', 'FK', 'FLK', 'Iles Falkland', '1', '0', null), ('92', 'FO', 'FRO', 'Iles Féroé', '1', '0', null), ('93', 'FJ', 'FJI', 'Iles Fidji', '1', '0', null), ('94', 'FI', 'FIN', 'Finlande', '1', '0', '1'), ('95', 'GF', 'GUF', 'Guyane française', '1', '0', null), ('96', 'PF', 'PYF', 'Polynésie française', '1', '0', null), ('97', 'TF', 'ATF', 'Terres australes françaises', '1', '0', null), ('98', 'GM', 'GMB', 'Gambie', '1', '0', null), ('99', 'GE', 'GEO', 'Georgia', '1', '0', null), ('100', 'GH', 'GHA', 'Ghana', '1', '0', null), ('101', 'GI', 'GIB', 'Gibraltar', '1', '0', null), ('102', 'GR', 'GRC', 'Greece', '1', '0', '1'), ('103', 'GL', 'GRL', 'Groenland', '1', '0', null), ('104', 'GD', 'GRD', 'Grenade', '1', '0', null), ('106', 'GU', 'GUM', 'Guam', '1', '0', null), ('107', 'GT', 'GTM', 'Guatemala', '1', '0', null), ('108', 'GN', 'GIN', 'Guinea', '1', '0', null), ('109', 'GW', 'GNB', 'Guinea-Bissao', '1', '0', null), ('111', 'HT', 'HTI', 'Haiti', '1', '0', null), ('112', 'HM', 'HMD', 'Iles Heard et McDonald', '1', '0', null), ('113', 'VA', 'VAT', 'Saint-Siège (Vatican)', '1', '0', null), ('114', 'HN', 'HND', 'Honduras', '1', '0', null), ('115', 'HK', 'HKG', 'Hong Kong', '1', '0', null), ('116', 'IS', 'ISL', 'Islande', '1', '0', null), ('117', 'IN', 'IND', 'India', '1', '0', null), ('118', 'ID', 'IDN', 'Indonésie', '1', '0', null), ('119', 'IR', 'IRN', 'Iran', '1', '0', null), ('120', 'IQ', 'IRQ', 'Iraq', '1', '0', null), ('121', 'IL', 'ISR', 'Israel', '1', '0', null), ('122', 'JM', 'JAM', 'Jamaïque', '1', '0', null), ('123', 'JP', 'JPN', 'Japon', '1', '0', null), ('124', 'JO', 'JOR', 'Jordanie', '1', '0', null), ('125', 'KZ', 'KAZ', 'Kazakhstan', '1', '0', null), ('126', 'KE', 'KEN', 'Kenya', '1', '0', null), ('127', 'KI', 'KIR', 'Kiribati', '1', '0', null), ('128', 'KP', 'PRK', 'North Corea', '1', '0', null), ('129', 'KR', 'KOR', 'South Corea', '1', '0', null), ('130', 'KW', 'KWT', 'Koweït', '1', '0', null), ('131', 'KG', 'KGZ', 'Kirghizistan', '1', '0', null), ('132', 'LA', 'LAO', 'Laos', '1', '0', null), ('133', 'LV', 'LVA', 'Lettonie', '1', '0', '1'), ('134', 'LB', 'LBN', 'Liban', '1', '0', null), ('135', 'LS', 'LSO', 'Lesotho', '1', '0', null), ('136', 'LR', 'LBR', 'Liberia', '1', '0', null), ('137', 'LY', 'LBY', 'Libye', '1', '0', null), ('138', 'LI', 'LIE', 'Liechtenstein', '1', '0', null), ('139', 'LT', 'LTU', 'Lituanie', '1', '0', '1'), ('140', 'LU', 'LUX', 'Luxembourg', '1', '0', '1'), ('141', 'MO', 'MAC', 'Macao', '1', '0', null), ('142', 'MK', 'MKD', 'ex-République yougoslave de Macédoine', '1', '0', null), ('143', 'MG', 'MDG', 'Madagascar', '1', '0', null), ('144', 'MW', 'MWI', 'Malawi', '1', '0', null), ('145', 'MY', 'MYS', 'Malaisie', '1', '0', null), ('146', 'MV', 'MDV', 'Maldives', '1', '0', null), ('147', 'ML', 'MLI', 'Mali', '1', '0', null), ('148', 'MT', 'MLT', 'Malte', '1', '0', '1'), ('149', 'MH', 'MHL', 'Iles Marshall', '1', '0', null), ('151', 'MR', 'MRT', 'Mauritanie', '1', '0', null), ('152', 'MU', 'MUS', 'Maurice', '1', '0', null), ('153', 'YT', 'MYT', 'Mayotte', '1', '0', null), ('154', 'MX', 'MEX', 'Mexique', '1', '0', null), ('155', 'FM', 'FSM', 'Micronésie', '1', '0', null), ('156', 'MD', 'MDA', 'Moldavie', '1', '0', null), ('157', 'MN', 'MNG', 'Mongolie', '1', '0', null), ('158', 'MS', 'MSR', 'Monserrat', '1', '0', null), ('159', 'MZ', 'MOZ', 'Mozambique', '1', '0', null), ('160', 'MM', 'MMR', 'Birmanie (Myanmar)', '1', '0', null), ('161', 'NA', 'NAM', 'Namibie', '1', '0', null), ('162', 'NR', 'NRU', 'Nauru', '1', '0', null), ('163', 'NP', 'NPL', 'Népal', '1', '0', null), ('165', 'NC', 'NCL', 'Nouvelle-Calédonie', '1', '0', null), ('166', 'NZ', 'NZL', 'Nouvelle-Zélande', '1', '0', null), ('167', 'NI', 'NIC', 'Nicaragua', '1', '0', null), ('168', 'NE', 'NER', 'Niger', '1', '0', null), ('169', 'NG', 'NGA', 'Nigeria', '1', '0', null), ('170', 'NU', 'NIU', 'Nioué', '1', '0', null), ('171', 'NF', 'NFK', 'Ile Norfolk', '1', '0', null), ('172', 'MP', 'MNP', 'Mariannes du Nord', '1', '0', null), ('173', 'NO', 'NOR', 'Norvège', '1', '0', null), ('174', 'OM', 'OMN', 'Oman', '1', '0', null), ('175', 'PK', 'PAK', 'Pakistan', '1', '0', null), ('176', 'PW', 'PLW', 'Palaos', '1', '0', null), ('177', 'PS', 'PSE', 'Territoire Palestinien Occupé', '1', '0', null), ('178', 'PA', 'PAN', 'Panama', '1', '0', null), ('179', 'PG', 'PNG', 'Papouasie-Nouvelle-Guinée', '1', '0', null), ('180', 'PY', 'PRY', 'Paraguay', '1', '0', null), ('181', 'PE', 'PER', 'Peru', '1', '0', null), ('182', 'PH', 'PHL', 'Philippines', '1', '0', null), ('183', 'PN', 'PCN', 'Iles Pitcairn', '1', '0', null), ('184', 'PL', 'POL', 'Pologne', '1', '0', '1'), ('185', 'PR', 'PRI', 'Porto Rico', '1', '0', null), ('186', 'QA', 'QAT', 'Qatar', '1', '0', null), ('188', 'RO', 'ROU', 'Roumanie', '1', '0', '1'), ('189', 'RW', 'RWA', 'Rwanda', '1', '0', null), ('190', 'SH', 'SHN', 'Sainte-Hélène', '1', '0', null), ('191', 'KN', 'KNA', 'Saint-Christophe-et-Niévès', '1', '0', null), ('192', 'LC', 'LCA', 'Sainte-Lucie', '1', '0', null), ('193', 'PM', 'SPM', 'Saint-Pierre-et-Miquelon', '1', '0', null), ('194', 'VC', 'VCT', 'Saint-Vincent-et-les-Grenadines', '1', '0', null), ('195', 'WS', 'WSM', 'Samoa', '1', '0', null), ('196', 'SM', 'SMR', 'Saint-Marin', '1', '0', null), ('197', 'ST', 'STP', 'Sao Tomé-et-Principe', '1', '0', null), ('198', 'RS', 'SRB', 'Serbie', '1', '0', null), ('199', 'SC', 'SYC', 'Seychelles', '1', '0', null), ('200', 'SL', 'SLE', 'Sierra Leone', '1', '0', null), ('201', 'SK', 'SVK', 'Slovaquie', '1', '0', '1'), ('202', 'SI', 'SVN', 'Slovénie', '1', '0', '1'), ('203', 'SB', 'SLB', 'Iles Salomon', '1', '0', null), ('204', 'SO', 'SOM', 'Somalie', '1', '0', null), ('205', 'ZA', 'ZAF', 'South Africa', '1', '0', null), ('206', 'GS', 'SGS', 'Iles Géorgie du Sud et Sandwich du Sud', '1', '0', null), ('207', 'LK', 'LKA', 'Sri Lanka', '1', '0', null), ('208', 'SD', 'SDN', 'Soudan', '1', '0', null), ('209', 'SR', 'SUR', 'Suriname', '1', '0', null), ('210', 'SJ', 'SJM', 'Iles Svalbard et Jan Mayen', '1', '0', null), ('211', 'SZ', 'SWZ', 'Swaziland', '1', '0', null), ('212', 'SY', 'SYR', 'Syrie', '1', '0', null), ('213', 'TW', 'TWN', 'Taïwan', '1', '0', null), ('214', 'TJ', 'TJK', 'Tadjikistan', '1', '0', null), ('215', 'TZ', 'TZA', 'Tanzanie', '1', '0', null), ('216', 'TH', 'THA', 'Thaïlande', '1', '0', null), ('217', 'TL', 'TLS', 'Timor Oriental', '1', '0', null), ('218', 'TK', 'TKL', 'Tokélaou', '1', '0', null), ('219', 'TO', 'TON', 'Tonga', '1', '0', null), ('220', 'TT', 'TTO', 'Trinité-et-Tobago', '1', '0', null), ('221', 'TR', 'TUR', 'Turquie', '1', '0', null), ('222', 'TM', 'TKM', 'Turkménistan', '1', '0', null), ('223', 'TC', 'TCA', 'Iles Turks-et-Caicos', '1', '0', null), ('224', 'TV', 'TUV', 'Tuvalu', '1', '0', null), ('225', 'UG', 'UGA', 'Ouganda', '1', '0', null), ('226', 'UA', 'UKR', 'Ukraine', '1', '0', null), ('227', 'AE', 'ARE', 'United Arab Emirates', '1', '0', null), ('228', 'UM', 'UMI', 'Iles mineures éloignées des États-Unis', '1', '0', null), ('229', 'UY', 'URY', 'Uruguay', '1', '0', null), ('230', 'UZ', 'UZB', 'Ouzbékistan', '1', '0', null), ('231', 'VU', 'VUT', 'Vanuatu', '1', '0', null), ('232', 'VE', 'VEN', 'Vénézuela', '1', '0', null), ('233', 'VN', 'VNM', 'Viêt Nam', '1', '0', null), ('234', 'VG', 'VGB', 'Iles Vierges britanniques', '1', '0', null), ('235', 'VI', 'VIR', 'Iles Vierges américaines', '1', '0', null), ('236', 'WF', 'WLF', 'Wallis-et-Futuna', '1', '0', null), ('237', 'EH', 'ESH', 'Sahara occidental', '1', '0', null), ('238', 'YE', 'YEM', 'Yémen', '1', '0', null), ('239', 'ZM', 'ZMB', 'Zambie', '1', '0', null), ('240', 'ZW', 'ZWE', 'Zimbabwe', '1', '0', null), ('241', 'GG', 'GGY', 'Guernesey', '1', '0', null), ('242', 'IM', 'IMN', 'Ile de Man', '1', '0', '1'), ('243', 'JE', 'JEY', 'Jersey', '1', '0', null), ('244', 'ME', 'MNE', 'Monténégro', '1', '0', null), ('245', 'BL', 'BLM', 'Saint-Barthélemy', '1', '0', null), ('246', 'MF', 'MAF', 'Saint-Martin', '1', '0', null), ('300', 'CW', 'CUW', 'Curaçao', '1', '0', null), ('301', 'SX', 'SXM', 'Sint Maarten', '1', '0', null);
COMMIT;

-- ----------------------------
--  Table structure for `llx_c_currencies`
-- ----------------------------
DROP TABLE IF EXISTS `llx_c_currencies`;
CREATE TABLE `llx_c_currencies` (
  `code_iso` varchar(3) NOT NULL,
  `label` varchar(64) NOT NULL,
  `unicode` varchar(32) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`code_iso`),
  UNIQUE KEY `uk_c_currencies_code_iso` (`code_iso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_c_currencies`
-- ----------------------------
BEGIN;
INSERT INTO `llx_c_currencies` VALUES ('AED', 'United Arab Emirates Dirham', null, '1'), ('AFN', 'Afghanistan Afghani', '[1547]', '1'), ('ALL', 'Albania Lek', '[76,101,107]', '1'), ('ANG', 'Netherlands Antilles Guilder', '[402]', '1'), ('ARP', 'Pesos argentins', null, '0'), ('ARS', 'Argentino Peso', '[36]', '1'), ('ATS', 'Shiliing autrichiens', null, '0'), ('AUD', 'Australia Dollar', '[36]', '1'), ('AWG', 'Aruba Guilder', '[402]', '1'), ('AZN', 'Azerbaijan New Manat', '[1084,1072,1085]', '1'), ('BAM', 'Bosnia and Herzegovina Convertible Marka', '[75,77]', '1'), ('BBD', 'Barbados Dollar', '[36]', '1'), ('BDT', 'Bangladeshi Taka', '[2547]', '1'), ('BEF', 'Francs belges', null, '0'), ('BGN', 'Bulgaria Lev', '[1083,1074]', '1'), ('BHD', 'Bahrain', null, '1'), ('BMD', 'Bermuda Dollar', '[36]', '1'), ('BND', 'Brunei Darussalam Dollar', '[36]', '1'), ('BOB', 'Bolivia Boliviano', '[36,98]', '1'), ('BRL', 'Brazil Real', '[82,36]', '1'), ('BSD', 'Bahamas Dollar', '[36]', '1'), ('BWP', 'Botswana Pula', '[80]', '1'), ('BYR', 'Belarus Ruble', '[112,46]', '1'), ('BZD', 'Belize Dollar', '[66,90,36]', '1'), ('CAD', 'Canada Dollar', '[36]', '1'), ('CHF', 'Switzerland Franc', '[67,72,70]', '1'), ('CLP', 'Chile Peso', '[36]', '1'), ('CNY', 'China Yuan Renminbi', '[165]', '1'), ('COP', 'Colombia Peso', '[36]', '1'), ('CRC', 'Costa Rica Colon', '[8353]', '1'), ('CUP', 'Cuba Peso', '[8369]', '1'), ('CZK', 'Czech Republic Koruna', '[75,269]', '1'), ('DEM', 'Deutsch mark', null, '0'), ('DKK', 'Denmark Krone', '[107,114]', '1'), ('DOP', 'Dominican Republic Peso', '[82,68,36]', '1'), ('DZD', 'Algeria Dinar', null, '1'), ('EEK', 'Estonia Kroon', '[107,114]', '1'), ('EGP', 'Egypt Pound', '[163]', '1'), ('ESP', 'Pesete', null, '0'), ('EUR', 'Euro Member Countries', '[8364]', '1'), ('FIM', 'Mark finlandais', null, '0'), ('FJD', 'Fiji Dollar', '[36]', '1'), ('FKP', 'Falkland Islands (Malvinas) Pound', '[163]', '1'), ('FRF', 'Francs francais', null, '0'), ('GBP', 'United Kingdom Pound', '[163]', '1'), ('GGP', 'Guernsey Pound', '[163]', '1'), ('GHC', 'Ghana Cedis', '[162]', '1'), ('GIP', 'Gibraltar Pound', '[163]', '1'), ('GNF', 'Franc Guinéen', '[70,71]', '1'), ('GRD', 'Drachme (grece)', null, '0'), ('GTQ', 'Guatemala Quetzal', '[81]', '1'), ('GYD', 'Guyana Dollar', '[36]', '1'), ('HKD', 'Hong Kong Dollar', '[36]', '1'), ('HNL', 'Honduras Lempira', '[76]', '1'), ('HRK', 'Croatia Kuna', '[107,110]', '1'), ('HUF', 'Hungary Forint', '[70,116]', '1'), ('IDR', 'Indonesia Rupiah', '[82,112]', '1'), ('IEP', 'Livres irlandaises', null, '0'), ('ILS', 'Israel Shekel', '[8362]', '1'), ('IMP', 'Isle of Man Pound', '[163]', '1'), ('INR', 'India Rupee', '[8377]', '1'), ('IRR', 'Iran Rial', '[65020]', '1'), ('ISK', 'Iceland Krona', '[107,114]', '1'), ('ITL', 'Lires', null, '0'), ('JEP', 'Jersey Pound', '[163]', '1'), ('JMD', 'Jamaica Dollar', '[74,36]', '1'), ('JPY', 'Japan Yen', '[165]', '1'), ('KES', 'Kenya Shilling', null, '1'), ('KGS', 'Kyrgyzstan Som', '[1083,1074]', '1'), ('KHR', 'Cambodia Riel', '[6107]', '1'), ('KPW', 'Korea (North) Won', '[8361]', '1'), ('KRW', 'Korea (South) Won', '[8361]', '1'), ('KYD', 'Cayman Islands Dollar', '[36]', '1'), ('KZT', 'Kazakhstan Tenge', '[1083,1074]', '1'), ('LAK', 'Laos Kip', '[8365]', '1'), ('LBP', 'Lebanon Pound', '[163]', '1'), ('LKR', 'Sri Lanka Rupee', '[8360]', '1'), ('LRD', 'Liberia Dollar', '[36]', '1'), ('LTL', 'Lithuania Litas', '[76,116]', '1'), ('LUF', 'Francs luxembourgeois', null, '0'), ('LVL', 'Latvia Lat', '[76,115]', '1'), ('MAD', 'Morocco Dirham', null, '1'), ('MGA', 'Ariary', null, '1'), ('MKD', 'Macedonia Denar', '[1076,1077,1085]', '1'), ('MNT', 'Mongolia Tughrik', '[8366]', '1'), ('MRO', 'Mauritania Ouguiya', null, '1'), ('MUR', 'Mauritius Rupee', '[8360]', '1'), ('MXN', 'Mexico Peso', '[36]', '1'), ('MXP', 'Pesos Mexicans', null, '0'), ('MYR', 'Malaysia Ringgit', '[82,77]', '1'), ('MZN', 'Mozambique Metical', '[77,84]', '1'), ('NAD', 'Namibia Dollar', '[36]', '1'), ('NGN', 'Nigeria Naira', '[8358]', '1'), ('NIO', 'Nicaragua Cordoba', '[67,36]', '1'), ('NLG', 'Florins', null, '0'), ('NOK', 'Norway Krone', '[107,114]', '1'), ('NPR', 'Nepal Rupee', '[8360]', '1'), ('NZD', 'New Zealand Dollar', '[36]', '1'), ('OMR', 'Oman Rial', '[65020]', '1'), ('PAB', 'Panama Balboa', '[66,47,46]', '1'), ('PEN', 'Peru Nuevo Sol', '[83,47,46]', '1'), ('PHP', 'Philippines Peso', '[8369]', '1'), ('PKR', 'Pakistan Rupee', '[8360]', '1'), ('PLN', 'Poland Zloty', '[122,322]', '1'), ('PTE', 'Escudos', null, '0'), ('PYG', 'Paraguay Guarani', '[71,115]', '1'), ('QAR', 'Qatar Riyal', '[65020]', '1'), ('RON', 'Romania New Leu', '[108,101,105]', '1'), ('RSD', 'Serbia Dinar', '[1044,1080,1085,46]', '1'), ('RUB', 'Russia Ruble', '[1088,1091,1073]', '1'), ('SAR', 'Saudi Arabia Riyal', '[65020]', '1'), ('SBD', 'Solomon Islands Dollar', '[36]', '1'), ('SCR', 'Seychelles Rupee', '[8360]', '1'), ('SEK', 'Sweden Krona', '[107,114]', '1'), ('SGD', 'Singapore Dollar', '[36]', '1'), ('SHP', 'Saint Helena Pound', '[163]', '1'), ('SKK', 'Couronnes slovaques', null, '0'), ('SOS', 'Somalia Shilling', '[83]', '1'), ('SRD', 'Suriname Dollar', '[36]', '1'), ('SUR', 'Rouble', null, '0'), ('SVC', 'El Salvador Colon', '[36]', '1'), ('SYP', 'Syria Pound', '[163]', '1'), ('THB', 'Thailand Baht', '[3647]', '1'), ('TND', 'Tunisia Dinar', null, '1'), ('TRL', 'Turkey Lira', '[84,76]', '1'), ('TRY', 'Turkey Lira', '[8356]', '1'), ('TTD', 'Trinidad and Tobago Dollar', '[84,84,36]', '1'), ('TVD', 'Tuvalu Dollar', '[36]', '1'), ('TWD', 'Taiwan New Dollar', '[78,84,36]', '1'), ('UAH', 'Ukraine Hryvna', '[8372]', '1'), ('USD', 'United States Dollar', '[36]', '1'), ('UYU', 'Uruguay Peso', '[36,85]', '1'), ('UZS', 'Uzbekistan Som', '[1083,1074]', '1'), ('VEF', 'Venezuela Bolivar Fuerte', '[66,115]', '1'), ('VND', 'Viet Nam Dong', '[8363]', '1'), ('XAF', 'Communaute Financiere Africaine (BEAC) CFA Franc', null, '1'), ('XCD', 'East Caribbean Dollar', '[36]', '1'), ('XEU', 'Ecus', null, '0'), ('XOF', 'Communaute Financiere Africaine (BCEAO) Franc', null, '1'), ('XPF', 'Franc CFP', '[70]', '1'), ('YER', 'Yemen Rial', '[65020]', '1'), ('ZAR', 'South Africa Rand', '[82]', '1'), ('ZWD', 'Zimbabwe Dollar', '[90,36]', '1');
COMMIT;

-- ----------------------------
--  Table structure for `llx_c_departements`
-- ----------------------------
DROP TABLE IF EXISTS `llx_c_departements`;
CREATE TABLE `llx_c_departements` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code_departement` varchar(6) NOT NULL,
  `fk_region` int(11) DEFAULT NULL,
  `cheflieu` varchar(50) DEFAULT NULL,
  `tncc` int(11) DEFAULT NULL,
  `ncc` varchar(50) DEFAULT NULL,
  `nom` varchar(50) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_departements` (`code_departement`,`fk_region`),
  KEY `idx_departements_fk_region` (`fk_region`),
  CONSTRAINT `fk_departements_fk_region` FOREIGN KEY (`fk_region`) REFERENCES `llx_c_regions` (`code_region`)
) ENGINE=InnoDB AUTO_INCREMENT=2861 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_c_departements`
-- ----------------------------
BEGIN;
INSERT INTO `llx_c_departements` VALUES ('1', '0', '0', '0', '0', '-', '-', '1'), ('2', '971', '1', '97105', '3', 'GUADELOUPE', 'Guadeloupe', '1'), ('3', '972', '2', '97209', '3', 'MARTINIQUE', 'Martinique', '1'), ('4', '973', '3', '97302', '3', 'GUYANE', 'Guyane', '1'), ('5', '974', '4', '97411', '3', 'REUNION', 'Réunion', '1'), ('6', '976', '6', '97601', '3', 'MAYOTTE', 'Mayotte', '1'), ('7', '01', '84', '01053', '5', 'AIN', 'Ain', '1'), ('8', '02', '32', '02408', '5', 'AISNE', 'Aisne', '1'), ('9', '03', '84', '03190', '5', 'ALLIER', 'Allier', '1'), ('10', '04', '93', '04070', '4', 'ALPES-DE-HAUTE-PROVENCE', 'Alpes-de-Haute-Provence', '1'), ('11', '05', '93', '05061', '4', 'HAUTES-ALPES', 'Hautes-Alpes', '1'), ('12', '06', '93', '06088', '4', 'ALPES-MARITIMES', 'Alpes-Maritimes', '1'), ('13', '07', '84', '07186', '5', 'ARDECHE', 'Ardèche', '1'), ('14', '08', '44', '08105', '4', 'ARDENNES', 'Ardennes', '1'), ('15', '09', '76', '09122', '5', 'ARIEGE', 'Ariège', '1'), ('16', '10', '44', '10387', '5', 'AUBE', 'Aube', '1'), ('17', '11', '76', '11069', '5', 'AUDE', 'Aude', '1'), ('18', '12', '76', '12202', '5', 'AVEYRON', 'Aveyron', '1'), ('19', '13', '93', '13055', '4', 'BOUCHES-DU-RHONE', 'Bouches-du-Rhône', '1'), ('20', '14', '28', '14118', '2', 'CALVADOS', 'Calvados', '1'), ('21', '15', '84', '15014', '2', 'CANTAL', 'Cantal', '1'), ('22', '16', '75', '16015', '3', 'CHARENTE', 'Charente', '1'), ('23', '17', '75', '17300', '3', 'CHARENTE-MARITIME', 'Charente-Maritime', '1'), ('24', '18', '24', '18033', '2', 'CHER', 'Cher', '1'), ('25', '19', '75', '19272', '3', 'CORREZE', 'Corrèze', '1'), ('26', '2A', '94', '2A004', '3', 'CORSE-DU-SUD', 'Corse-du-Sud', '1'), ('27', '2B', '94', '2B033', '3', 'HAUTE-CORSE', 'Haute-Corse', '1'), ('28', '21', '27', '21231', '3', 'COTE-D OR', 'Côte-d Or', '1'), ('29', '22', '53', '22278', '4', 'COTES-D ARMOR', 'Côtes-d Armor', '1'), ('30', '23', '75', '23096', '3', 'CREUSE', 'Creuse', '1'), ('31', '24', '75', '24322', '3', 'DORDOGNE', 'Dordogne', '1'), ('32', '25', '27', '25056', '2', 'DOUBS', 'Doubs', '1'), ('33', '26', '84', '26362', '3', 'DROME', 'Drôme', '1'), ('34', '27', '28', '27229', '5', 'EURE', 'Eure', '1'), ('35', '28', '24', '28085', '1', 'EURE-ET-LOIR', 'Eure-et-Loir', '1'), ('36', '29', '53', '29232', '2', 'FINISTERE', 'Finistère', '1'), ('37', '30', '76', '30189', '2', 'GARD', 'Gard', '1'), ('38', '31', '76', '31555', '3', 'HAUTE-GARONNE', 'Haute-Garonne', '1'), ('39', '32', '76', '32013', '2', 'GERS', 'Gers', '1'), ('40', '33', '75', '33063', '3', 'GIRONDE', 'Gironde', '1'), ('41', '34', '76', '34172', '5', 'HERAULT', 'Hérault', '1'), ('42', '35', '53', '35238', '1', 'ILLE-ET-VILAINE', 'Ille-et-Vilaine', '1'), ('43', '36', '24', '36044', '5', 'INDRE', 'Indre', '1'), ('44', '37', '24', '37261', '1', 'INDRE-ET-LOIRE', 'Indre-et-Loire', '1'), ('45', '38', '84', '38185', '5', 'ISERE', 'Isère', '1'), ('46', '39', '27', '39300', '2', 'JURA', 'Jura', '1'), ('47', '40', '75', '40192', '4', 'LANDES', 'Landes', '1'), ('48', '41', '24', '41018', '0', 'LOIR-ET-CHER', 'Loir-et-Cher', '1'), ('49', '42', '84', '42218', '3', 'LOIRE', 'Loire', '1'), ('50', '43', '84', '43157', '3', 'HAUTE-LOIRE', 'Haute-Loire', '1'), ('51', '44', '52', '44109', '3', 'LOIRE-ATLANTIQUE', 'Loire-Atlantique', '1'), ('52', '45', '24', '45234', '2', 'LOIRET', 'Loiret', '1'), ('53', '46', '76', '46042', '2', 'LOT', 'Lot', '1'), ('54', '47', '75', '47001', '0', 'LOT-ET-GARONNE', 'Lot-et-Garonne', '1'), ('55', '48', '76', '48095', '3', 'LOZERE', 'Lozère', '1'), ('56', '49', '52', '49007', '0', 'MAINE-ET-LOIRE', 'Maine-et-Loire', '1'), ('57', '50', '28', '50502', '3', 'MANCHE', 'Manche', '1'), ('58', '51', '44', '51108', '3', 'MARNE', 'Marne', '1'), ('59', '52', '44', '52121', '3', 'HAUTE-MARNE', 'Haute-Marne', '1'), ('60', '53', '52', '53130', '3', 'MAYENNE', 'Mayenne', '1'), ('61', '54', '44', '54395', '0', 'MEURTHE-ET-MOSELLE', 'Meurthe-et-Moselle', '1'), ('62', '55', '44', '55029', '3', 'MEUSE', 'Meuse', '1'), ('63', '56', '53', '56260', '2', 'MORBIHAN', 'Morbihan', '1'), ('64', '57', '44', '57463', '3', 'MOSELLE', 'Moselle', '1'), ('65', '58', '27', '58194', '3', 'NIEVRE', 'Nièvre', '1'), ('66', '59', '32', '59350', '2', 'NORD', 'Nord', '1'), ('67', '60', '32', '60057', '5', 'OISE', 'Oise', '1'), ('68', '61', '28', '61001', '5', 'ORNE', 'Orne', '1'), ('69', '62', '32', '62041', '2', 'PAS-DE-CALAIS', 'Pas-de-Calais', '1'), ('70', '63', '84', '63113', '2', 'PUY-DE-DOME', 'Puy-de-Dôme', '1'), ('71', '64', '75', '64445', '4', 'PYRENEES-ATLANTIQUES', 'Pyrénées-Atlantiques', '1'), ('72', '65', '76', '65440', '4', 'HAUTES-PYRENEES', 'Hautes-Pyrénées', '1'), ('73', '66', '76', '66136', '4', 'PYRENEES-ORIENTALES', 'Pyrénées-Orientales', '1'), ('74', '67', '44', '67482', '2', 'BAS-RHIN', 'Bas-Rhin', '1'), ('75', '68', '44', '68066', '2', 'HAUT-RHIN', 'Haut-Rhin', '1'), ('76', '69', '84', '69123', '2', 'RHONE', 'Rhône', '1'), ('77', '70', '27', '70550', '3', 'HAUTE-SAONE', 'Haute-Saône', '1'), ('78', '71', '27', '71270', '0', 'SAONE-ET-LOIRE', 'Saône-et-Loire', '1'), ('79', '72', '52', '72181', '3', 'SARTHE', 'Sarthe', '1'), ('80', '73', '84', '73065', '3', 'SAVOIE', 'Savoie', '1'), ('81', '74', '84', '74010', '3', 'HAUTE-SAVOIE', 'Haute-Savoie', '1'), ('82', '75', '11', '75056', '0', 'PARIS', 'Paris', '1'), ('83', '76', '28', '76540', '3', 'SEINE-MARITIME', 'Seine-Maritime', '1'), ('84', '77', '11', '77288', '0', 'SEINE-ET-MARNE', 'Seine-et-Marne', '1'), ('85', '78', '11', '78646', '4', 'YVELINES', 'Yvelines', '1'), ('86', '79', '75', '79191', '4', 'DEUX-SEVRES', 'Deux-Sèvres', '1'), ('87', '80', '32', '80021', '3', 'SOMME', 'Somme', '1'), ('88', '81', '76', '81004', '2', 'TARN', 'Tarn', '1'), ('89', '82', '76', '82121', '0', 'TARN-ET-GARONNE', 'Tarn-et-Garonne', '1'), ('90', '83', '93', '83137', '2', 'VAR', 'Var', '1'), ('91', '84', '93', '84007', '0', 'VAUCLUSE', 'Vaucluse', '1'), ('92', '85', '52', '85191', '3', 'VENDEE', 'Vendée', '1'), ('93', '86', '75', '86194', '3', 'VIENNE', 'Vienne', '1'), ('94', '87', '75', '87085', '3', 'HAUTE-VIENNE', 'Haute-Vienne', '1'), ('95', '88', '44', '88160', '4', 'VOSGES', 'Vosges', '1'), ('96', '89', '27', '89024', '5', 'YONNE', 'Yonne', '1'), ('97', '90', '27', '90010', '0', 'TERRITOIRE DE BELFORT', 'Territoire de Belfort', '1'), ('98', '91', '11', '91228', '5', 'ESSONNE', 'Essonne', '1'), ('99', '92', '11', '92050', '4', 'HAUTS-DE-SEINE', 'Hauts-de-Seine', '1'), ('100', '93', '11', '93008', '3', 'SEINE-SAINT-DENIS', 'Seine-Saint-Denis', '1'), ('101', '94', '11', '94028', '2', 'VAL-DE-MARNE', 'Val-de-Marne', '1'), ('102', '95', '11', '95500', '2', 'VAL-D OISE', 'Val-d Oise', '1'), ('103', 'B', '4101', null, null, 'BURGENLAND', 'Burgenland', '1'), ('104', 'K', '4101', null, null, 'KAERNTEN', 'Kärnten', '1'), ('105', 'N', '4101', null, null, 'NIEDEROESTERREICH', 'Niederösterreich', '1'), ('106', 'O', '4101', null, null, 'OBEROESTERREICH', 'Oberösterreich', '1'), ('107', 'S', '4101', null, null, 'SALZBURG', 'Salzburg', '1'), ('108', 'ST', '4101', null, null, 'STEIERMARK', 'Steiermark', '1'), ('109', 'T', '4101', null, null, 'TIROL', 'Tirol', '1'), ('110', 'V', '4101', null, null, 'VORARLBERG', 'Vorarlberg', '1'), ('111', 'W', '4101', null, null, 'WIEN', 'Wien', '1'), ('112', '01', '201', '', '1', 'ANVERS', 'Anvers', '1'), ('113', '02', '203', '', '3', 'BRUXELLES-CAPITALE', 'Bruxelles-Capitale', '1'), ('114', '03', '202', '', '2', 'BRABANT-WALLON', 'Brabant-Wallon', '1'), ('115', '04', '201', '', '1', 'BRABANT-FLAMAND', 'Brabant-Flamand', '1'), ('116', '05', '201', '', '1', 'FLANDRE-OCCIDENTALE', 'Flandre-Occidentale', '1'), ('117', '06', '201', '', '1', 'FLANDRE-ORIENTALE', 'Flandre-Orientale', '1'), ('118', '07', '202', '', '2', 'HAINAUT', 'Hainaut', '1'), ('119', '08', '201', '', '2', 'LIEGE', 'Liège', '1'), ('120', '09', '202', '', '1', 'LIMBOURG', 'Limbourg', '1'), ('121', '10', '202', '', '2', 'LUXEMBOURG', 'Luxembourg', '1'), ('122', '11', '201', '', '2', 'NAMUR', 'Namur', '1'), ('123', 'AG', '315', null, null, null, 'AGRIGENTO', '1'), ('124', 'AL', '312', null, null, null, 'ALESSANDRIA', '1'), ('125', 'AN', '310', null, null, null, 'ANCONA', '1'), ('126', 'AO', '319', null, null, null, 'AOSTA', '1'), ('127', 'AR', '316', null, null, null, 'AREZZO', '1'), ('128', 'AP', '310', null, null, null, 'ASCOLI PICENO', '1'), ('129', 'AT', '312', null, null, null, 'ASTI', '1'), ('130', 'AV', '304', null, null, null, 'AVELLINO', '1'), ('131', 'BA', '313', null, null, null, 'BARI', '1'), ('132', 'BT', '313', null, null, null, 'BARLETTA-ANDRIA-TRANI', '1'), ('133', 'BL', '320', null, null, null, 'BELLUNO', '1'), ('134', 'BN', '304', null, null, null, 'BENEVENTO', '1'), ('135', 'BG', '309', null, null, null, 'BERGAMO', '1'), ('136', 'BI', '312', null, null, null, 'BIELLA', '1'), ('137', 'BO', '305', null, null, null, 'BOLOGNA', '1'), ('138', 'BZ', '317', null, null, null, 'BOLZANO', '1'), ('139', 'BS', '309', null, null, null, 'BRESCIA', '1'), ('140', 'BR', '313', null, null, null, 'BRINDISI', '1'), ('141', 'CA', '314', null, null, null, 'CAGLIARI', '1'), ('142', 'CL', '315', null, null, null, 'CALTANISSETTA', '1'), ('143', 'CB', '311', null, null, null, 'CAMPOBASSO', '1'), ('144', 'CI', '314', null, null, null, 'CARBONIA-IGLESIAS', '1'), ('145', 'CE', '304', null, null, null, 'CASERTA', '1'), ('146', 'CT', '315', null, null, null, 'CATANIA', '1'), ('147', 'CZ', '303', null, null, null, 'CATANZARO', '1'), ('148', 'CH', '301', null, null, null, 'CHIETI', '1'), ('149', 'CO', '309', null, null, null, 'COMO', '1'), ('150', 'CS', '303', null, null, null, 'COSENZA', '1'), ('151', 'CR', '309', null, null, null, 'CREMONA', '1'), ('152', 'KR', '303', null, null, null, 'CROTONE', '1'), ('153', 'CN', '312', null, null, null, 'CUNEO', '1'), ('154', 'EN', '315', null, null, null, 'ENNA', '1'), ('155', 'FM', '310', null, null, null, 'FERMO', '1'), ('156', 'FE', '305', null, null, null, 'FERRARA', '1'), ('157', 'FI', '316', null, null, null, 'FIRENZE', '1'), ('158', 'FG', '313', null, null, null, 'FOGGIA', '1'), ('159', 'FC', '305', null, null, null, 'FORLI-CESENA', '1'), ('160', 'FR', '307', null, null, null, 'FROSINONE', '1'), ('161', 'GE', '308', null, null, null, 'GENOVA', '1'), ('162', 'GO', '306', null, null, null, 'GORIZIA', '1'), ('163', 'GR', '316', null, null, null, 'GROSSETO', '1'), ('164', 'IM', '308', null, null, null, 'IMPERIA', '1'), ('165', 'IS', '311', null, null, null, 'ISERNIA', '1'), ('166', 'SP', '308', null, null, null, 'LA SPEZIA', '1'), ('167', 'AQ', '301', null, null, null, 'L AQUILA', '1'), ('168', 'LT', '307', null, null, null, 'LATINA', '1'), ('169', 'LE', '313', null, null, null, 'LECCE', '1'), ('170', 'LC', '309', null, null, null, 'LECCO', '1'), ('171', 'LI', '314', null, null, null, 'LIVORNO', '1'), ('172', 'LO', '309', null, null, null, 'LODI', '1'), ('173', 'LU', '316', null, null, null, 'LUCCA', '1'), ('174', 'MC', '310', null, null, null, 'MACERATA', '1'), ('175', 'MN', '309', null, null, null, 'MANTOVA', '1'), ('176', 'MS', '316', null, null, null, 'MASSA-CARRARA', '1'), ('177', 'MT', '302', null, null, null, 'MATERA', '1'), ('178', 'VS', '314', null, null, null, 'MEDIO CAMPIDANO', '1'), ('179', 'ME', '315', null, null, null, 'MESSINA', '1'), ('180', 'MI', '309', null, null, null, 'MILANO', '1'), ('181', 'MB', '309', null, null, null, 'MONZA e BRIANZA', '1'), ('182', 'MO', '305', null, null, null, 'MODENA', '1'), ('183', 'NA', '304', null, null, null, 'NAPOLI', '1'), ('184', 'NO', '312', null, null, null, 'NOVARA', '1'), ('185', 'NU', '314', null, null, null, 'NUORO', '1'), ('186', 'OG', '314', null, null, null, 'OGLIASTRA', '1'), ('187', 'OT', '314', null, null, null, 'OLBIA-TEMPIO', '1'), ('188', 'OR', '314', null, null, null, 'ORISTANO', '1'), ('189', 'PD', '320', null, null, null, 'PADOVA', '1'), ('190', 'PA', '315', null, null, null, 'PALERMO', '1'), ('191', 'PR', '305', null, null, null, 'PARMA', '1'), ('192', 'PV', '309', null, null, null, 'PAVIA', '1'), ('193', 'PG', '318', null, null, null, 'PERUGIA', '1'), ('194', 'PU', '310', null, null, null, 'PESARO e URBINO', '1'), ('195', 'PE', '301', null, null, null, 'PESCARA', '1'), ('196', 'PC', '305', null, null, null, 'PIACENZA', '1'), ('197', 'PI', '316', null, null, null, 'PISA', '1'), ('198', 'PT', '316', null, null, null, 'PISTOIA', '1'), ('199', 'PN', '306', null, null, null, 'PORDENONE', '1'), ('200', 'PZ', '302', null, null, null, 'POTENZA', '1'), ('201', 'PO', '316', null, null, null, 'PRATO', '1'), ('202', 'RG', '315', null, null, null, 'RAGUSA', '1'), ('203', 'RA', '305', null, null, null, 'RAVENNA', '1'), ('204', 'RC', '303', null, null, null, 'REGGIO CALABRIA', '1'), ('205', 'RE', '305', null, null, null, 'REGGIO NELL EMILIA', '1'), ('206', 'RI', '307', null, null, null, 'RIETI', '1'), ('207', 'RN', '305', null, null, null, 'RIMINI', '1'), ('208', 'RM', '307', null, null, null, 'ROMA', '1'), ('209', 'RO', '320', null, null, null, 'ROVIGO', '1'), ('210', 'SA', '304', null, null, null, 'SALERNO', '1'), ('211', 'SS', '314', null, null, null, 'SASSARI', '1'), ('212', 'SV', '308', null, null, null, 'SAVONA', '1'), ('213', 'SI', '316', null, null, null, 'SIENA', '1'), ('214', 'SR', '315', null, null, null, 'SIRACUSA', '1'), ('215', 'SO', '309', null, null, null, 'SONDRIO', '1'), ('216', 'TA', '313', null, null, null, 'TARANTO', '1'), ('217', 'TE', '301', null, null, null, 'TERAMO', '1'), ('218', 'TR', '318', null, null, null, 'TERNI', '1'), ('219', 'TO', '312', null, null, null, 'TORINO', '1'), ('220', 'TP', '315', null, null, null, 'TRAPANI', '1'), ('221', 'TN', '317', null, null, null, 'TRENTO', '1'), ('222', 'TV', '320', null, null, null, 'TREVISO', '1'), ('223', 'TS', '306', null, null, null, 'TRIESTE', '1'), ('224', 'UD', '306', null, null, null, 'UDINE', '1'), ('225', 'VA', '309', null, null, null, 'VARESE', '1'), ('226', 'VE', '320', null, null, null, 'VENEZIA', '1'), ('227', 'VB', '312', null, null, null, 'VERBANO-CUSIO-OSSOLA', '1'), ('228', 'VC', '312', null, null, null, 'VERCELLI', '1'), ('229', 'VR', '320', null, null, null, 'VERONA', '1'), ('230', 'VV', '303', null, null, null, 'VIBO VALENTIA', '1'), ('231', 'VI', '320', null, null, null, 'VICENZA', '1'), ('232', 'VT', '307', null, null, null, 'VITERBO', '1'), ('233', 'AL01', '1301', '', '0', '', 'Wilaya d\'Adrar', '1'), ('234', 'AL02', '1301', '', '0', '', 'Wilaya de Chlef', '1'), ('235', 'AL03', '1301', '', '0', '', 'Wilaya de Laghouat', '1'), ('236', 'AL04', '1301', '', '0', '', 'Wilaya d\'Oum El Bouaghi', '1'), ('237', 'AL05', '1301', '', '0', '', 'Wilaya de Batna', '1'), ('238', 'AL06', '1301', '', '0', '', 'Wilaya de Béjaïa', '1'), ('239', 'AL07', '1301', '', '0', '', 'Wilaya de Biskra', '1'), ('240', 'AL08', '1301', '', '0', '', 'Wilaya de Béchar', '1'), ('241', 'AL09', '1301', '', '0', '', 'Wilaya de Blida', '1'), ('242', 'AL10', '1301', '', '0', '', 'Wilaya de Bouira', '1'), ('243', 'AL11', '1301', '', '0', '', 'Wilaya de Tamanrasset', '1'), ('244', 'AL12', '1301', '', '0', '', 'Wilaya de Tébessa', '1'), ('245', 'AL13', '1301', '', '0', '', 'Wilaya de Tlemcen', '1'), ('246', 'AL14', '1301', '', '0', '', 'Wilaya de Tiaret', '1'), ('247', 'AL15', '1301', '', '0', '', 'Wilaya de Tizi Ouzou', '1'), ('248', 'AL16', '1301', '', '0', '', 'Wilaya d\'Alger', '1'), ('249', 'AL17', '1301', '', '0', '', 'Wilaya de Djelfa', '1'), ('250', 'AL18', '1301', '', '0', '', 'Wilaya de Jijel', '1'), ('251', 'AL19', '1301', '', '0', '', 'Wilaya de Sétif	', '1'), ('252', 'AL20', '1301', '', '0', '', 'Wilaya de Saïda', '1'), ('253', 'AL21', '1301', '', '0', '', 'Wilaya de Skikda', '1'), ('254', 'AL22', '1301', '', '0', '', 'Wilaya de Sidi Bel Abbès', '1'), ('255', 'AL23', '1301', '', '0', '', 'Wilaya d\'Annaba', '1'), ('256', 'AL24', '1301', '', '0', '', 'Wilaya de Guelma', '1'), ('257', 'AL25', '1301', '', '0', '', 'Wilaya de Constantine', '1'), ('258', 'AL26', '1301', '', '0', '', 'Wilaya de Médéa', '1'), ('259', 'AL27', '1301', '', '0', '', 'Wilaya de Mostaganem', '1'), ('260', 'AL28', '1301', '', '0', '', 'Wilaya de M\'Sila', '1'), ('261', 'AL29', '1301', '', '0', '', 'Wilaya de Mascara', '1'), ('262', 'AL30', '1301', '', '0', '', 'Wilaya d\'Ouargla', '1'), ('263', 'AL31', '1301', '', '0', '', 'Wilaya d\'Oran', '1'), ('264', 'AL32', '1301', '', '0', '', 'Wilaya d\'El Bayadh', '1'), ('265', 'AL33', '1301', '', '0', '', 'Wilaya d\'Illizi', '1'), ('266', 'AL34', '1301', '', '0', '', 'Wilaya de Bordj Bou Arreridj', '1'), ('267', 'AL35', '1301', '', '0', '', 'Wilaya de Boumerdès', '1'), ('268', 'AL36', '1301', '', '0', '', 'Wilaya d\'El Tarf', '1'), ('269', 'AL37', '1301', '', '0', '', 'Wilaya de Tindouf', '1'), ('270', 'AL38', '1301', '', '0', '', 'Wilaya de Tissemsilt', '1'), ('271', 'AL39', '1301', '', '0', '', 'Wilaya d\'El Oued', '1'), ('272', 'AL40', '1301', '', '0', '', 'Wilaya de Khenchela', '1'), ('273', 'AL41', '1301', '', '0', '', 'Wilaya de Souk Ahras', '1'), ('274', 'AL42', '1301', '', '0', '', 'Wilaya de Tipaza', '1'), ('275', 'AL43', '1301', '', '0', '', 'Wilaya de Mila', '1'), ('276', 'AL44', '1301', '', '0', '', 'Wilaya d\'Aïn Defla', '1'), ('277', 'AL45', '1301', '', '0', '', 'Wilaya de Naâma', '1'), ('278', 'AL46', '1301', '', '0', '', 'Wilaya d\'Aïn Témouchent', '1'), ('279', 'AL47', '1301', '', '0', '', 'Wilaya de Ghardaia', '1'), ('280', 'AL48', '1301', '', '0', '', 'Wilaya de Relizane', '1'), ('281', 'MA', '1209', '', '0', '', 'Province de Benslimane', '1'), ('282', 'MA1', '1209', '', '0', '', 'Province de Berrechid', '1'), ('283', 'MA2', '1209', '', '0', '', 'Province de Khouribga', '1'), ('284', 'MA3', '1209', '', '0', '', 'Province de Settat', '1'), ('285', 'MA4', '1210', '', '0', '', 'Province d\'El Jadida', '1'), ('286', 'MA5', '1210', '', '0', '', 'Province de Safi', '1'), ('287', 'MA6', '1210', '', '0', '', 'Province de Sidi Bennour', '1'), ('288', 'MA7', '1210', '', '0', '', 'Province de Youssoufia', '1'), ('289', 'MA6B', '1205', '', '0', '', 'Préfecture de Fès', '1'), ('290', 'MA7B', '1205', '', '0', '', 'Province de Boulemane', '1'), ('291', 'MA8', '1205', '', '0', '', 'Province de Moulay Yacoub', '1'), ('292', 'MA9', '1205', '', '0', '', 'Province de Sefrou', '1'), ('293', 'MA8A', '1202', '', '0', '', 'Province de Kénitra', '1'), ('294', 'MA9A', '1202', '', '0', '', 'Province de Sidi Kacem', '1'), ('295', 'MA10', '1202', '', '0', '', 'Province de Sidi Slimane', '1'), ('296', 'MA11', '1208', '', '0', '', 'Préfecture de Casablanca', '1'), ('297', 'MA12', '1208', '', '0', '', 'Préfecture de Mohammédia', '1'), ('298', 'MA13', '1208', '', '0', '', 'Province de Médiouna', '1'), ('299', 'MA14', '1208', '', '0', '', 'Province de Nouaceur', '1'), ('300', 'MA15', '1214', '', '0', '', 'Province d\'Assa-Zag', '1'), ('301', 'MA16', '1214', '', '0', '', 'Province d\'Es-Semara', '1'), ('302', 'MA17A', '1214', '', '0', '', 'Province de Guelmim', '1'), ('303', 'MA18', '1214', '', '0', '', 'Province de Tata', '1'), ('304', 'MA19', '1214', '', '0', '', 'Province de Tan-Tan', '1'), ('305', 'MA15', '1215', '', '0', '', 'Province de Boujdour', '1'), ('306', 'MA16', '1215', '', '0', '', 'Province de Lâayoune', '1'), ('307', 'MA17', '1215', '', '0', '', 'Province de Tarfaya', '1'), ('308', 'MA18', '1211', '', '0', '', 'Préfecture de Marrakech', '1'), ('309', 'MA19', '1211', '', '0', '', 'Province d\'Al Haouz', '1'), ('310', 'MA20', '1211', '', '0', '', 'Province de Chichaoua', '1'), ('311', 'MA21', '1211', '', '0', '', 'Province d\'El Kelâa des Sraghna', '1'), ('312', 'MA22', '1211', '', '0', '', 'Province d\'Essaouira', '1'), ('313', 'MA23', '1211', '', '0', '', 'Province de Rehamna', '1'), ('314', 'MA24', '1206', '', '0', '', 'Préfecture de Meknès', '1'), ('315', 'MA25', '1206', '', '0', '', 'Province d’El Hajeb', '1'), ('316', 'MA26', '1206', '', '0', '', 'Province d\'Errachidia', '1'), ('317', 'MA27', '1206', '', '0', '', 'Province d’Ifrane', '1'), ('318', 'MA28', '1206', '', '0', '', 'Province de Khénifra', '1'), ('319', 'MA29', '1206', '', '0', '', 'Province de Midelt', '1'), ('320', 'MA30', '1204', '', '0', '', 'Préfecture d\'Oujda-Angad', '1'), ('321', 'MA31', '1204', '', '0', '', 'Province de Berkane', '1'), ('322', 'MA32', '1204', '', '0', '', 'Province de Driouch', '1'), ('323', 'MA33', '1204', '', '0', '', 'Province de Figuig', '1'), ('324', 'MA34', '1204', '', '0', '', 'Province de Jerada', '1'), ('325', 'MA35', '1204', '', '0', '', 'Province de Nador', '1'), ('326', 'MA36', '1204', '', '0', '', 'Province de Taourirt', '1'), ('327', 'MA37', '1216', '', '0', '', 'Province d\'Aousserd', '1'), ('328', 'MA38', '1216', '', '0', '', 'Province d\'Oued Ed-Dahab', '1'), ('329', 'MA39', '1207', '', '0', '', 'Préfecture de Rabat', '1'), ('330', 'MA40', '1207', '', '0', '', 'Préfecture de Skhirat-Témara', '1'), ('331', 'MA41', '1207', '', '0', '', 'Préfecture de Salé', '1'), ('332', 'MA42', '1207', '', '0', '', 'Province de Khémisset', '1'), ('333', 'MA43', '1213', '', '0', '', 'Préfecture d\'Agadir Ida-Outanane', '1'), ('334', 'MA44', '1213', '', '0', '', 'Préfecture d\'Inezgane-Aït Melloul', '1'), ('335', 'MA45', '1213', '', '0', '', 'Province de Chtouka-Aït Baha', '1'), ('336', 'MA46', '1213', '', '0', '', 'Province d\'Ouarzazate', '1'), ('337', 'MA47', '1213', '', '0', '', 'Province de Sidi Ifni', '1'), ('338', 'MA48', '1213', '', '0', '', 'Province de Taroudant', '1'), ('339', 'MA49', '1213', '', '0', '', 'Province de Tinghir', '1'), ('340', 'MA50', '1213', '', '0', '', 'Province de Tiznit', '1'), ('341', 'MA51', '1213', '', '0', '', 'Province de Zagora', '1'), ('342', 'MA52', '1212', '', '0', '', 'Province d\'Azilal', '1'), ('343', 'MA53', '1212', '', '0', '', 'Province de Beni Mellal', '1'), ('344', 'MA54', '1212', '', '0', '', 'Province de Fquih Ben Salah', '1'), ('345', 'MA55', '1201', '', '0', '', 'Préfecture de M\'diq-Fnideq', '1'), ('346', 'MA56', '1201', '', '0', '', 'Préfecture de Tanger-Asilah', '1'), ('347', 'MA57', '1201', '', '0', '', 'Province de Chefchaouen', '1'), ('348', 'MA58', '1201', '', '0', '', 'Province de Fahs-Anjra', '1'), ('349', 'MA59', '1201', '', '0', '', 'Province de Larache', '1'), ('350', 'MA60', '1201', '', '0', '', 'Province d\'Ouezzane', '1'), ('351', 'MA61', '1201', '', '0', '', 'Province de Tétouan', '1'), ('352', 'MA62', '1203', '', '0', '', 'Province de Guercif', '1'), ('353', 'MA63', '1203', '', '0', '', 'Province d\'Al Hoceïma', '1'), ('354', 'MA64', '1203', '', '0', '', 'Province de Taounate', '1'), ('355', 'MA65', '1203', '', '0', '', 'Province de Taza', '1'), ('356', 'MA6A', '1205', '', '0', '', 'Préfecture de Fès', '1'), ('357', 'MA7A', '1205', '', '0', '', 'Province de Boulemane', '1'), ('358', 'MA15A', '1214', '', '0', '', 'Province d\'Assa-Zag', '1'), ('359', 'MA16A', '1214', '', '0', '', 'Province d\'Es-Semara', '1'), ('360', 'MA18A', '1211', '', '0', '', 'Préfecture de Marrakech', '1'), ('361', 'MA19A', '1214', '', '0', '', 'Province de Tan-Tan', '1'), ('362', 'MA19B', '1214', '', '0', '', 'Province de Tan-Tan', '1'), ('363', 'TN01', '1001', '', '0', '', 'Ariana', '1'), ('364', 'TN02', '1001', '', '0', '', 'Béja', '1'), ('365', 'TN03', '1001', '', '0', '', 'Ben Arous', '1'), ('366', 'TN04', '1001', '', '0', '', 'Bizerte', '1'), ('367', 'TN05', '1001', '', '0', '', 'Gabès', '1'), ('368', 'TN06', '1001', '', '0', '', 'Gafsa', '1'), ('369', 'TN07', '1001', '', '0', '', 'Jendouba', '1'), ('370', 'TN08', '1001', '', '0', '', 'Kairouan', '1'), ('371', 'TN09', '1001', '', '0', '', 'Kasserine', '1'), ('372', 'TN10', '1001', '', '0', '', 'Kébili', '1'), ('373', 'TN11', '1001', '', '0', '', 'La Manouba', '1'), ('374', 'TN12', '1001', '', '0', '', 'Le Kef', '1'), ('375', 'TN13', '1001', '', '0', '', 'Mahdia', '1'), ('376', 'TN14', '1001', '', '0', '', 'Médenine', '1'), ('377', 'TN15', '1001', '', '0', '', 'Monastir', '1'), ('378', 'TN16', '1001', '', '0', '', 'Nabeul', '1'), ('379', 'TN17', '1001', '', '0', '', 'Sfax', '1'), ('380', 'TN18', '1001', '', '0', '', 'Sidi Bouzid', '1'), ('381', 'TN19', '1001', '', '0', '', 'Siliana', '1'), ('382', 'TN20', '1001', '', '0', '', 'Sousse', '1'), ('383', 'TN21', '1001', '', '0', '', 'Tataouine', '1'), ('384', 'TN22', '1001', '', '0', '', 'Tozeur', '1'), ('385', 'TN23', '1001', '', '0', '', 'Tunis', '1'), ('386', 'TN24', '1001', '', '0', '', 'Zaghouan', '1'), ('387', '001', '5201', '', '0', '', 'Belisario Boeto', '1'), ('388', '002', '5201', '', '0', '', 'Hernando Siles', '1'), ('389', '003', '5201', '', '0', '', 'Jaime Zudáñez', '1'), ('390', '004', '5201', '', '0', '', 'Juana Azurduy de Padilla', '1'), ('391', '005', '5201', '', '0', '', 'Luis Calvo', '1'), ('392', '006', '5201', '', '0', '', 'Nor Cinti', '1'), ('393', '007', '5201', '', '0', '', 'Oropeza', '1'), ('394', '008', '5201', '', '0', '', 'Sud Cinti', '1'), ('395', '009', '5201', '', '0', '', 'Tomina', '1'), ('396', '010', '5201', '', '0', '', 'Yamparáez', '1'), ('397', '011', '5202', '', '0', '', 'Abel Iturralde', '1'), ('398', '012', '5202', '', '0', '', 'Aroma', '1'), ('399', '013', '5202', '', '0', '', 'Bautista Saavedra', '1'), ('400', '014', '5202', '', '0', '', 'Caranavi', '1'), ('401', '015', '5202', '', '0', '', 'Eliodoro Camacho', '1'), ('402', '016', '5202', '', '0', '', 'Franz Tamayo', '1'), ('403', '017', '5202', '', '0', '', 'Gualberto Villarroel', '1'), ('404', '018', '5202', '', '0', '', 'Ingaví', '1'), ('405', '019', '5202', '', '0', '', 'Inquisivi', '1'), ('406', '020', '5202', '', '0', '', 'José Ramón Loayza', '1'), ('407', '021', '5202', '', '0', '', 'Larecaja', '1'), ('408', '022', '5202', '', '0', '', 'Los Andes (Bolivia)', '1'), ('409', '023', '5202', '', '0', '', 'Manco Kapac', '1'), ('410', '024', '5202', '', '0', '', 'Muñecas', '1'), ('411', '025', '5202', '', '0', '', 'Nor Yungas', '1'), ('412', '026', '5202', '', '0', '', 'Omasuyos', '1'), ('413', '027', '5202', '', '0', '', 'Pacajes', '1'), ('414', '028', '5202', '', '0', '', 'Pedro Domingo Murillo', '1'), ('415', '029', '5202', '', '0', '', 'Sud Yungas', '1'), ('416', '030', '5202', '', '0', '', 'General José Manuel Pando', '1'), ('417', '031', '5203', '', '0', '', 'Arani', '1'), ('418', '032', '5203', '', '0', '', 'Arque', '1'), ('419', '033', '5203', '', '0', '', 'Ayopaya', '1'), ('420', '034', '5203', '', '0', '', 'Bolívar (Bolivia)', '1'), ('421', '035', '5203', '', '0', '', 'Campero', '1'), ('422', '036', '5203', '', '0', '', 'Capinota', '1'), ('423', '037', '5203', '', '0', '', 'Cercado (Cochabamba)', '1'), ('424', '038', '5203', '', '0', '', 'Esteban Arze', '1'), ('425', '039', '5203', '', '0', '', 'Germán Jordán', '1'), ('426', '040', '5203', '', '0', '', 'José Carrasco', '1'), ('427', '041', '5203', '', '0', '', 'Mizque', '1'), ('428', '042', '5203', '', '0', '', 'Punata', '1'), ('429', '043', '5203', '', '0', '', 'Quillacollo', '1'), ('430', '044', '5203', '', '0', '', 'Tapacarí', '1'), ('431', '045', '5203', '', '0', '', 'Tiraque', '1'), ('432', '046', '5203', '', '0', '', 'Chapare', '1'), ('433', '047', '5204', '', '0', '', 'Carangas', '1'), ('434', '048', '5204', '', '0', '', 'Cercado (Oruro)', '1'), ('435', '049', '5204', '', '0', '', 'Eduardo Avaroa', '1'), ('436', '050', '5204', '', '0', '', 'Ladislao Cabrera', '1'), ('437', '051', '5204', '', '0', '', 'Litoral de Atacama', '1'), ('438', '052', '5204', '', '0', '', 'Mejillones', '1'), ('439', '053', '5204', '', '0', '', 'Nor Carangas', '1'), ('440', '054', '5204', '', '0', '', 'Pantaleón Dalence', '1'), ('442', '055', '5204', '', '0', '', 'Poopó', '1'), ('443', '056', '5204', '', '0', '', 'Sabaya', '1'), ('444', '057', '5204', '', '0', '', 'Sajama', '1'), ('445', '058', '5204', '', '0', '', 'San Pedro de Totora', '1'), ('446', '059', '5204', '', '0', '', 'Saucarí', '1'), ('447', '060', '5204', '', '0', '', 'Sebastián Pagador', '1'), ('448', '061', '5204', '', '0', '', 'Sud Carangas', '1'), ('449', '062', '5204', '', '0', '', 'Tomás Barrón', '1'), ('450', '063', '5205', '', '0', '', 'Alonso de Ibáñez', '1'), ('451', '064', '5205', '', '0', '', 'Antonio Quijarro', '1'), ('452', '065', '5205', '', '0', '', 'Bernardino Bilbao', '1'), ('453', '066', '5205', '', '0', '', 'Charcas (Potosí)', '1'), ('454', '067', '5205', '', '0', '', 'Chayanta', '1'), ('455', '068', '5205', '', '0', '', 'Cornelio Saavedra', '1'), ('456', '069', '5205', '', '0', '', 'Daniel Campos', '1'), ('457', '070', '5205', '', '0', '', 'Enrique Baldivieso', '1'), ('458', '071', '5205', '', '0', '', 'José María Linares', '1'), ('459', '072', '5205', '', '0', '', 'Modesto Omiste', '1'), ('460', '073', '5205', '', '0', '', 'Nor Chichas', '1'), ('461', '074', '5205', '', '0', '', 'Nor Lípez', '1'), ('462', '075', '5205', '', '0', '', 'Rafael Bustillo', '1'), ('463', '076', '5205', '', '0', '', 'Sud Chichas', '1'), ('464', '077', '5205', '', '0', '', 'Sud Lípez', '1'), ('465', '078', '5205', '', '0', '', 'Tomás Frías', '1'), ('466', '079', '5206', '', '0', '', 'Aniceto Arce', '1'), ('467', '080', '5206', '', '0', '', 'Burdet O\'Connor', '1'), ('468', '081', '5206', '', '0', '', 'Cercado (Tarija)', '1'), ('469', '082', '5206', '', '0', '', 'Eustaquio Méndez', '1'), ('470', '083', '5206', '', '0', '', 'José María Avilés', '1'), ('471', '084', '5206', '', '0', '', 'Gran Chaco', '1'), ('472', '085', '5207', '', '0', '', 'Andrés Ibáñez', '1'), ('473', '086', '5207', '', '0', '', 'Caballero', '1'), ('474', '087', '5207', '', '0', '', 'Chiquitos', '1'), ('475', '088', '5207', '', '0', '', 'Cordillera (Bolivia)', '1'), ('476', '089', '5207', '', '0', '', 'Florida', '1'), ('477', '090', '5207', '', '0', '', 'Germán Busch', '1'), ('478', '091', '5207', '', '0', '', 'Guarayos', '1'), ('479', '092', '5207', '', '0', '', 'Ichilo', '1'), ('480', '093', '5207', '', '0', '', 'Obispo Santistevan', '1'), ('481', '094', '5207', '', '0', '', 'Sara', '1'), ('482', '095', '5207', '', '0', '', 'Vallegrande', '1'), ('483', '096', '5207', '', '0', '', 'Velasco', '1'), ('484', '097', '5207', '', '0', '', 'Warnes', '1'), ('485', '098', '5207', '', '0', '', 'Ángel Sandóval', '1'), ('486', '099', '5207', '', '0', '', 'Ñuflo de Chaves', '1'), ('487', '100', '5208', '', '0', '', 'Cercado (Beni)', '1'), ('488', '101', '5208', '', '0', '', 'Iténez', '1'), ('489', '102', '5208', '', '0', '', 'Mamoré', '1'), ('490', '103', '5208', '', '0', '', 'Marbán', '1'), ('491', '104', '5208', '', '0', '', 'Moxos', '1'), ('492', '105', '5208', '', '0', '', 'Vaca Díez', '1'), ('493', '106', '5208', '', '0', '', 'Yacuma', '1'), ('494', '107', '5208', '', '0', '', 'General José Ballivián Segurola', '1'), ('495', '108', '5209', '', '0', '', 'Abuná', '1'), ('496', '109', '5209', '', '0', '', 'Madre de Dios', '1'), ('497', '110', '5209', '', '0', '', 'Manuripi', '1'), ('498', '111', '5209', '', '0', '', 'Nicolás Suárez', '1'), ('499', '112', '5209', '', '0', '', 'General Federico Román', '1'), ('500', 'NSW', '2801', '', '1', '', 'New South Wales', '1'), ('501', 'VIC', '2801', '', '1', '', 'Victoria', '1'), ('502', 'QLD', '2801', '', '1', '', 'Queensland', '1'), ('503', 'SA', '2801', '', '1', '', 'South Australia', '1'), ('504', 'ACT', '2801', '', '1', '', 'Australia Capital Territory', '1'), ('505', 'TAS', '2801', '', '1', '', 'Tasmania', '1'), ('506', 'WA', '2801', '', '1', '', 'Western Australia', '1'), ('507', 'NT', '2801', '', '1', '', 'Northern Territory', '1'), ('508', 'ON', '1401', '', '1', '', 'Ontario', '1'), ('509', 'QC', '1401', '', '1', '', 'Quebec', '1'), ('510', 'NS', '1401', '', '1', '', 'Nova Scotia', '1'), ('511', 'NB', '1401', '', '1', '', 'New Brunswick', '1'), ('512', 'MB', '1401', '', '1', '', 'Manitoba', '1'), ('513', 'BC', '1401', '', '1', '', 'British Columbia', '1'), ('514', 'PE', '1401', '', '1', '', 'Prince Edward Island', '1'), ('515', 'SK', '1401', '', '1', '', 'Saskatchewan', '1'), ('516', 'AB', '1401', '', '1', '', 'Alberta', '1'), ('517', 'NL', '1401', '', '1', '', 'Newfoundland and Labrador', '1'), ('518', 'VI', '419', '', '19', 'ALAVA', 'Álava', '1'), ('519', 'AB', '404', '', '4', 'ALBACETE', 'Albacete', '1'), ('520', 'A', '411', '', '11', 'ALICANTE', 'Alicante', '1'), ('521', 'AL', '401', '', '1', 'ALMERIA', 'Almería', '1'), ('522', 'AV', '403', '', '3', 'AVILA', 'Avila', '1'), ('523', 'BA', '412', '', '12', 'BADAJOZ', 'Badajoz', '1'), ('524', 'PM', '414', '', '14', 'ISLAS BALEARES', 'Islas Baleares', '1'), ('525', 'B', '406', '', '6', 'BARCELONA', 'Barcelona', '1'), ('526', 'BU', '403', '', '8', 'BURGOS', 'Burgos', '1'), ('527', 'CC', '412', '', '12', 'CACERES', 'Cáceres', '1'), ('528', 'CA', '401', '', '1', 'CADIZ', 'Cádiz', '1'), ('529', 'CS', '411', '', '11', 'CASTELLON', 'Castellón', '1'), ('530', 'CR', '404', '', '4', 'CIUDAD REAL', 'Ciudad Real', '1'), ('531', 'CO', '401', '', '1', 'CORDOBA', 'Córdoba', '1'), ('532', 'C', '413', '', '13', 'LA CORUÑA', 'La Coruña', '1'), ('533', 'CU', '404', '', '4', 'CUENCA', 'Cuenca', '1'), ('534', 'GI', '406', '', '6', 'GERONA', 'Gerona', '1'), ('535', 'GR', '401', '', '1', 'GRANADA', 'Granada', '1'), ('536', 'GU', '404', '', '4', 'GUADALAJARA', 'Guadalajara', '1'), ('537', 'SS', '419', '', '19', 'GUIPUZCOA', 'Guipúzcoa', '1'), ('538', 'H', '401', '', '1', 'HUELVA', 'Huelva', '1'), ('539', 'HU', '402', '', '2', 'HUESCA', 'Huesca', '1'), ('540', 'J', '401', '', '1', 'JAEN', 'Jaén', '1'), ('541', 'LE', '403', '', '3', 'LEON', 'León', '1'), ('542', 'L', '406', '', '6', 'LERIDA', 'Lérida', '1'), ('543', 'LO', '415', '', '15', 'LA RIOJA', 'La Rioja', '1'), ('544', 'LU', '413', '', '13', 'LUGO', 'Lugo', '1'), ('545', 'M', '416', '', '16', 'MADRID', 'Madrid', '1'), ('546', 'MA', '401', '', '1', 'MALAGA', 'Málaga', '1'), ('547', 'MU', '417', '', '17', 'MURCIA', 'Murcia', '1'), ('548', 'NA', '408', '', '8', 'NAVARRA', 'Navarra', '1'), ('549', 'OR', '413', '', '13', 'ORENSE', 'Orense', '1'), ('550', 'O', '418', '', '18', 'ASTURIAS', 'Asturias', '1'), ('551', 'P', '403', '', '3', 'PALENCIA', 'Palencia', '1'), ('552', 'GC', '405', '', '5', 'LAS PALMAS', 'Las Palmas', '1'), ('553', 'PO', '413', '', '13', 'PONTEVEDRA', 'Pontevedra', '1'), ('554', 'SA', '403', '', '3', 'SALAMANCA', 'Salamanca', '1'), ('555', 'TF', '405', '', '5', 'STA. CRUZ DE TENERIFE', 'Sta. Cruz de Tenerife', '1'), ('556', 'S', '410', '', '10', 'CANTABRIA', 'Cantabria', '1'), ('557', 'SG', '403', '', '3', 'SEGOVIA', 'Segovia', '1'), ('558', 'SE', '401', '', '1', 'SEVILLA', 'Sevilla', '1'), ('559', 'SO', '403', '', '3', 'SORIA', 'Soria', '1'), ('560', 'T', '406', '', '6', 'TARRAGONA', 'Tarragona', '1'), ('561', 'TE', '402', '', '2', 'TERUEL', 'Teruel', '1'), ('562', 'TO', '404', '', '5', 'TOLEDO', 'Toledo', '1'), ('563', 'V', '411', '', '11', 'VALENCIA', 'Valencia', '1'), ('564', 'VA', '403', '', '3', 'VALLADOLID', 'Valladolid', '1'), ('565', 'BI', '419', '', '19', 'VIZCAYA', 'Vizcaya', '1'), ('566', 'ZA', '403', '', '3', 'ZAMORA', 'Zamora', '1'), ('567', 'Z', '402', '', '1', 'ZARAGOZA', 'Zaragoza', '1'), ('568', 'CE', '407', '', '7', 'CEUTA', 'Ceuta', '1'), ('569', 'ML', '409', '', '9', 'MELILLA', 'Melilla', '1'), ('570', 'BW', '501', null, null, 'BADEN-WÜRTTEMBERG', 'Baden-Württemberg', '1'), ('571', 'BY', '501', null, null, 'BAYERN', 'Bayern', '1'), ('572', 'BE', '501', null, null, 'BERLIN', 'Berlin', '1'), ('573', 'BB', '501', null, null, 'BRANDENBURG', 'Brandenburg', '1'), ('574', 'HB', '501', null, null, 'BREMEN', 'Bremen', '1'), ('575', 'HH', '501', null, null, 'HAMBURG', 'Hamburg', '1'), ('576', 'HE', '501', null, null, 'HESSEN', 'Hessen', '1'), ('577', 'MV', '501', null, null, 'MECKLENBURG-VORPOMMERN', 'Mecklenburg-Vorpommern', '1'), ('578', 'NI', '501', null, null, 'NIEDERSACHSEN', 'Niedersachsen', '1'), ('579', 'NW', '501', null, null, 'NORDRHEIN-WESTFALEN', 'Nordrhein-Westfalen', '1'), ('580', 'RP', '501', null, null, 'RHEINLAND-PFALZ', 'Rheinland-Pfalz', '1'), ('581', 'SL', '501', null, null, 'SAARLAND', 'Saarland', '1'), ('582', 'SN', '501', null, null, 'SACHSEN', 'Sachsen', '1'), ('583', 'ST', '501', null, null, 'SACHSEN-ANHALT', 'Sachsen-Anhalt', '1'), ('584', 'SH', '501', null, null, 'SCHLESWIG-HOLSTEIN', 'Schleswig-Holstein', '1'), ('585', 'TH', '501', null, null, 'THÜRINGEN', 'Thüringen', '1'), ('586', '66', '10201', '', '0', '', 'Αθήνα', '1'), ('587', '67', '10205', '', '0', '', 'Δράμα', '1'), ('588', '01', '10205', '', '0', '', 'Έβρος', '1'), ('589', '02', '10205', '', '0', '', 'Θάσος', '1'), ('590', '03', '10205', '', '0', '', 'Καβάλα', '1'), ('591', '04', '10205', '', '0', '', 'Ξάνθη', '1'), ('592', '05', '10205', '', '0', '', 'Ροδόπη', '1'), ('593', '06', '10203', '', '0', '', 'Ημαθία', '1'), ('594', '07', '10203', '', '0', '', 'Θεσσαλονίκη', '1'), ('595', '08', '10203', '', '0', '', 'Κιλκίς', '1'), ('596', '09', '10203', '', '0', '', 'Πέλλα', '1'), ('597', '10', '10203', '', '0', '', 'Πιερία', '1'), ('598', '11', '10203', '', '0', '', 'Σέρρες', '1'), ('599', '12', '10203', '', '0', '', 'Χαλκιδική', '1'), ('600', '13', '10206', '', '0', '', 'Άρτα', '1'), ('601', '14', '10206', '', '0', '', 'Θεσπρωτία', '1'), ('602', '15', '10206', '', '0', '', 'Ιωάννινα', '1'), ('603', '16', '10206', '', '0', '', 'Πρέβεζα', '1'), ('604', '17', '10213', '', '0', '', 'Γρεβενά', '1'), ('605', '18', '10213', '', '0', '', 'Καστοριά', '1'), ('606', '19', '10213', '', '0', '', 'Κοζάνη', '1'), ('607', '20', '10213', '', '0', '', 'Φλώρινα', '1'), ('608', '21', '10212', '', '0', '', 'Καρδίτσα', '1'), ('609', '22', '10212', '', '0', '', 'Λάρισα', '1'), ('610', '23', '10212', '', '0', '', 'Μαγνησία', '1'), ('611', '24', '10212', '', '0', '', 'Τρίκαλα', '1'), ('612', '25', '10212', '', '0', '', 'Σποράδες', '1'), ('613', '26', '10212', '', '0', '', 'Βοιωτία', '1'), ('614', '27', '10202', '', '0', '', 'Εύβοια', '1'), ('615', '28', '10202', '', '0', '', 'Ευρυτανία', '1'), ('616', '29', '10202', '', '0', '', 'Φθιώτιδα', '1'), ('617', '30', '10202', '', '0', '', 'Φωκίδα', '1'), ('618', '31', '10209', '', '0', '', 'Αργολίδα', '1'), ('619', '32', '10209', '', '0', '', 'Αρκαδία', '1'), ('620', '33', '10209', '', '0', '', 'Κορινθία', '1'), ('621', '34', '10209', '', '0', '', 'Λακωνία', '1'), ('622', '35', '10209', '', '0', '', 'Μεσσηνία', '1'), ('623', '36', '10211', '', '0', '', 'Αιτωλοακαρνανία', '1'), ('624', '37', '10211', '', '0', '', 'Αχαΐα', '1'), ('625', '38', '10211', '', '0', '', 'Ηλεία', '1'), ('626', '39', '10207', '', '0', '', 'Ζάκυνθος', '1'), ('627', '40', '10207', '', '0', '', 'Κέρκυρα', '1'), ('628', '41', '10207', '', '0', '', 'Κεφαλληνία', '1'), ('629', '42', '10207', '', '0', '', 'Ιθάκη', '1'), ('630', '43', '10207', '', '0', '', 'Λευκάδα', '1'), ('631', '44', '10208', '', '0', '', 'Ικαρία', '1'), ('632', '45', '10208', '', '0', '', 'Λέσβος', '1'), ('633', '46', '10208', '', '0', '', 'Λήμνος', '1'), ('634', '47', '10208', '', '0', '', 'Σάμος', '1'), ('635', '48', '10208', '', '0', '', 'Χίος', '1'), ('636', '49', '10210', '', '0', '', 'Άνδρος', '1'), ('637', '50', '10210', '', '0', '', 'Θήρα', '1'), ('638', '51', '10210', '', '0', '', 'Κάλυμνος', '1'), ('639', '52', '10210', '', '0', '', 'Κάρπαθος', '1'), ('640', '53', '10210', '', '0', '', 'Κέα-Κύθνος', '1'), ('641', '54', '10210', '', '0', '', 'Κω', '1'), ('642', '55', '10210', '', '0', '', 'Μήλος', '1'), ('643', '56', '10210', '', '0', '', 'Μύκονος', '1'), ('644', '57', '10210', '', '0', '', 'Νάξος', '1'), ('645', '58', '10210', '', '0', '', 'Πάρος', '1'), ('646', '59', '10210', '', '0', '', 'Ρόδος', '1'), ('647', '60', '10210', '', '0', '', 'Σύρος', '1'), ('648', '61', '10210', '', '0', '', 'Τήνος', '1'), ('649', '62', '10204', '', '0', '', 'Ηράκλειο', '1'), ('650', '63', '10204', '', '0', '', 'Λασίθι', '1'), ('651', '64', '10204', '', '0', '', 'Ρέθυμνο', '1'), ('652', '65', '10204', '', '0', '', 'Χανιά', '1'), ('653', 'AG', '601', null, null, 'ARGOVIE', 'Argovie', '1'), ('654', 'AI', '601', null, null, 'APPENZELL RHODES INTERIEURES', 'Appenzell Rhodes intérieures', '1'), ('655', 'AR', '601', null, null, 'APPENZELL RHODES EXTERIEURES', 'Appenzell Rhodes extérieures', '1'), ('656', 'BE', '601', null, null, 'BERNE', 'Berne', '1'), ('657', 'BL', '601', null, null, 'BALE CAMPAGNE', 'Bâle Campagne', '1'), ('658', 'BS', '601', null, null, 'BALE VILLE', 'Bâle Ville', '1'), ('659', 'FR', '601', null, null, 'FRIBOURG', 'Fribourg', '1'), ('660', 'GE', '601', null, null, 'GENEVE', 'Genève', '1'), ('661', 'GL', '601', null, null, 'GLARIS', 'Glaris', '1'), ('662', 'GR', '601', null, null, 'GRISONS', 'Grisons', '1'), ('663', 'JU', '601', null, null, 'JURA', 'Jura', '1'), ('664', 'LU', '601', null, null, 'LUCERNE', 'Lucerne', '1'), ('665', 'NE', '601', null, null, 'NEUCHATEL', 'Neuchâtel', '1'), ('666', 'NW', '601', null, null, 'NIDWALD', 'Nidwald', '1'), ('667', 'OW', '601', null, null, 'OBWALD', 'Obwald', '1'), ('668', 'SG', '601', null, null, 'SAINT-GALL', 'Saint-Gall', '1'), ('669', 'SH', '601', null, null, 'SCHAFFHOUSE', 'Schaffhouse', '1'), ('670', 'SO', '601', null, null, 'SOLEURE', 'Soleure', '1'), ('671', 'SZ', '601', null, null, 'SCHWYZ', 'Schwyz', '1'), ('672', 'TG', '601', null, null, 'THURGOVIE', 'Thurgovie', '1'), ('673', 'TI', '601', null, null, 'TESSIN', 'Tessin', '1'), ('674', 'UR', '601', null, null, 'URI', 'Uri', '1'), ('675', 'VD', '601', null, null, 'VAUD', 'Vaud', '1'), ('676', 'VS', '601', null, null, 'VALAIS', 'Valais', '1'), ('677', 'ZG', '601', null, null, 'ZUG', 'Zug', '1'), ('678', 'ZH', '601', null, null, 'ZURICH', 'Zürich', '1'), ('679', '701', '701', null, '0', null, 'Bedfordshire', '1'), ('680', '702', '701', null, '0', null, 'Berkshire', '1'), ('681', '703', '701', null, '0', null, 'Bristol, City of', '1'), ('682', '704', '701', null, '0', null, 'Buckinghamshire', '1'), ('683', '705', '701', null, '0', null, 'Cambridgeshire', '1'), ('684', '706', '701', null, '0', null, 'Cheshire', '1'), ('685', '707', '701', null, '0', null, 'Cleveland', '1'), ('686', '708', '701', null, '0', null, 'Cornwall', '1'), ('687', '709', '701', null, '0', null, 'Cumberland', '1'), ('688', '710', '701', null, '0', null, 'Cumbria', '1'), ('689', '711', '701', null, '0', null, 'Derbyshire', '1'), ('690', '712', '701', null, '0', null, 'Devon', '1'), ('691', '713', '701', null, '0', null, 'Dorset', '1'), ('692', '714', '701', null, '0', null, 'Co. Durham', '1'), ('693', '715', '701', null, '0', null, 'East Riding of Yorkshire', '1'), ('694', '716', '701', null, '0', null, 'East Sussex', '1'), ('695', '717', '701', null, '0', null, 'Essex', '1'), ('696', '718', '701', null, '0', null, 'Gloucestershire', '1'), ('697', '719', '701', null, '0', null, 'Greater Manchester', '1'), ('698', '720', '701', null, '0', null, 'Hampshire', '1'), ('699', '721', '701', null, '0', null, 'Hertfordshire', '1'), ('700', '722', '701', null, '0', null, 'Hereford and Worcester', '1'), ('701', '723', '701', null, '0', null, 'Herefordshire', '1'), ('702', '724', '701', null, '0', null, 'Huntingdonshire', '1'), ('703', '725', '701', null, '0', null, 'Isle of Man', '1'), ('704', '726', '701', null, '0', null, 'Isle of Wight', '1'), ('705', '727', '701', null, '0', null, 'Jersey', '1'), ('706', '728', '701', null, '0', null, 'Kent', '1'), ('707', '729', '701', null, '0', null, 'Lancashire', '1'), ('708', '730', '701', null, '0', null, 'Leicestershire', '1'), ('709', '731', '701', null, '0', null, 'Lincolnshire', '1'), ('710', '732', '701', null, '0', null, 'London - City of London', '1'), ('711', '733', '701', null, '0', null, 'Merseyside', '1'), ('712', '734', '701', null, '0', null, 'Middlesex', '1'), ('713', '735', '701', null, '0', null, 'Norfolk', '1'), ('714', '736', '701', null, '0', null, 'North Yorkshire', '1'), ('715', '737', '701', null, '0', null, 'North Riding of Yorkshire', '1'), ('716', '738', '701', null, '0', null, 'Northamptonshire', '1'), ('717', '739', '701', null, '0', null, 'Northumberland', '1'), ('718', '740', '701', null, '0', null, 'Nottinghamshire', '1'), ('719', '741', '701', null, '0', null, 'Oxfordshire', '1'), ('720', '742', '701', null, '0', null, 'Rutland', '1'), ('721', '743', '701', null, '0', null, 'Shropshire', '1'), ('722', '744', '701', null, '0', null, 'Somerset', '1'), ('723', '745', '701', null, '0', null, 'Staffordshire', '1'), ('724', '746', '701', null, '0', null, 'Suffolk', '1'), ('725', '747', '701', null, '0', null, 'Surrey', '1'), ('726', '748', '701', null, '0', null, 'Sussex', '1'), ('727', '749', '701', null, '0', null, 'Tyne and Wear', '1'), ('728', '750', '701', null, '0', null, 'Warwickshire', '1'), ('729', '751', '701', null, '0', null, 'West Midlands', '1'), ('730', '752', '701', null, '0', null, 'West Sussex', '1'), ('731', '753', '701', null, '0', null, 'West Yorkshire', '1'), ('732', '754', '701', null, '0', null, 'West Riding of Yorkshire', '1'), ('733', '755', '701', null, '0', null, 'Wiltshire', '1'), ('734', '756', '701', null, '0', null, 'Worcestershire', '1'), ('735', '757', '701', null, '0', null, 'Yorkshire', '1'), ('736', '758', '702', null, '0', null, 'Anglesey', '1'), ('737', '759', '702', null, '0', null, 'Breconshire', '1'), ('738', '760', '702', null, '0', null, 'Caernarvonshire', '1'), ('739', '761', '702', null, '0', null, 'Cardiganshire', '1'), ('740', '762', '702', null, '0', null, 'Carmarthenshire', '1'), ('741', '763', '702', null, '0', null, 'Ceredigion', '1'), ('742', '764', '702', null, '0', null, 'Denbighshire', '1'), ('743', '765', '702', null, '0', null, 'Flintshire', '1'), ('744', '766', '702', null, '0', null, 'Glamorgan', '1'), ('745', '767', '702', null, '0', null, 'Gwent', '1'), ('746', '768', '702', null, '0', null, 'Gwynedd', '1'), ('747', '769', '702', null, '0', null, 'Merionethshire', '1'), ('748', '770', '702', null, '0', null, 'Monmouthshire', '1'), ('749', '771', '702', null, '0', null, 'Mid Glamorgan', '1'), ('750', '772', '702', null, '0', null, 'Montgomeryshire', '1'), ('751', '773', '702', null, '0', null, 'Pembrokeshire', '1'), ('752', '774', '702', null, '0', null, 'Powys', '1'), ('753', '775', '702', null, '0', null, 'Radnorshire', '1'), ('754', '776', '702', null, '0', null, 'South Glamorgan', '1'), ('755', '777', '703', null, '0', null, 'Aberdeen, City of', '1'), ('756', '778', '703', null, '0', null, 'Angus', '1'), ('757', '779', '703', null, '0', null, 'Argyll', '1'), ('758', '780', '703', null, '0', null, 'Ayrshire', '1'), ('759', '781', '703', null, '0', null, 'Banffshire', '1'), ('760', '782', '703', null, '0', null, 'Berwickshire', '1'), ('761', '783', '703', null, '0', null, 'Bute', '1'), ('762', '784', '703', null, '0', null, 'Caithness', '1'), ('763', '785', '703', null, '0', null, 'Clackmannanshire', '1'), ('764', '786', '703', null, '0', null, 'Dumfriesshire', '1'), ('765', '787', '703', null, '0', null, 'Dumbartonshire', '1'), ('766', '788', '703', null, '0', null, 'Dundee, City of', '1'), ('767', '789', '703', null, '0', null, 'East Lothian', '1'), ('768', '790', '703', null, '0', null, 'Fife', '1'), ('769', '791', '703', null, '0', null, 'Inverness', '1'), ('770', '792', '703', null, '0', null, 'Kincardineshire', '1'), ('771', '793', '703', null, '0', null, 'Kinross-shire', '1'), ('772', '794', '703', null, '0', null, 'Kirkcudbrightshire', '1'), ('773', '795', '703', null, '0', null, 'Lanarkshire', '1'), ('774', '796', '703', null, '0', null, 'Midlothian', '1'), ('775', '797', '703', null, '0', null, 'Morayshire', '1'), ('776', '798', '703', null, '0', null, 'Nairnshire', '1'), ('777', '799', '703', null, '0', null, 'Orkney', '1'), ('778', '800', '703', null, '0', null, 'Peebleshire', '1'), ('779', '801', '703', null, '0', null, 'Perthshire', '1'), ('780', '802', '703', null, '0', null, 'Renfrewshire', '1'), ('781', '803', '703', null, '0', null, 'Ross & Cromarty', '1'), ('782', '804', '703', null, '0', null, 'Roxburghshire', '1'), ('783', '805', '703', null, '0', null, 'Selkirkshire', '1'), ('784', '806', '703', null, '0', null, 'Shetland', '1'), ('785', '807', '703', null, '0', null, 'Stirlingshire', '1'), ('786', '808', '703', null, '0', null, 'Sutherland', '1'), ('787', '809', '703', null, '0', null, 'West Lothian', '1'), ('788', '810', '703', null, '0', null, 'Wigtownshire', '1'), ('789', '811', '704', null, '0', null, 'Antrim', '1'), ('790', '812', '704', null, '0', null, 'Armagh', '1'), ('791', '813', '704', null, '0', null, 'Co. Down', '1'), ('792', '814', '704', null, '0', null, 'Co. Fermanagh', '1'), ('793', '815', '704', null, '0', null, 'Co. Londonderry', '1'), ('794', 'AL', '1101', '', '0', 'ALABAMA', 'Alabama', '1'), ('795', 'AK', '1101', '', '0', 'ALASKA', 'Alaska', '1'), ('796', 'AZ', '1101', '', '0', 'ARIZONA', 'Arizona', '1'), ('797', 'AR', '1101', '', '0', 'ARKANSAS', 'Arkansas', '1'), ('798', 'CA', '1101', '', '0', 'CALIFORNIA', 'California', '1'), ('799', 'CO', '1101', '', '0', 'COLORADO', 'Colorado', '1'), ('800', 'CT', '1101', '', '0', 'CONNECTICUT', 'Connecticut', '1'), ('801', 'DE', '1101', '', '0', 'DELAWARE', 'Delaware', '1'), ('802', 'FL', '1101', '', '0', 'FLORIDA', 'Florida', '1'), ('803', 'GA', '1101', '', '0', 'GEORGIA', 'Georgia', '1'), ('804', 'HI', '1101', '', '0', 'HAWAII', 'Hawaii', '1'), ('805', 'ID', '1101', '', '0', 'IDAHO', 'Idaho', '1'), ('806', 'IL', '1101', '', '0', 'ILLINOIS', 'Illinois', '1'), ('807', 'IN', '1101', '', '0', 'INDIANA', 'Indiana', '1'), ('808', 'IA', '1101', '', '0', 'IOWA', 'Iowa', '1'), ('809', 'KS', '1101', '', '0', 'KANSAS', 'Kansas', '1'), ('810', 'KY', '1101', '', '0', 'KENTUCKY', 'Kentucky', '1'), ('811', 'LA', '1101', '', '0', 'LOUISIANA', 'Louisiana', '1'), ('812', 'ME', '1101', '', '0', 'MAINE', 'Maine', '1'), ('813', 'MD', '1101', '', '0', 'MARYLAND', 'Maryland', '1'), ('814', 'MA', '1101', '', '0', 'MASSACHUSSETTS', 'Massachusetts', '1'), ('815', 'MI', '1101', '', '0', 'MICHIGAN', 'Michigan', '1'), ('816', 'MN', '1101', '', '0', 'MINNESOTA', 'Minnesota', '1'), ('817', 'MS', '1101', '', '0', 'MISSISSIPPI', 'Mississippi', '1'), ('818', 'MO', '1101', '', '0', 'MISSOURI', 'Missouri', '1'), ('819', 'MT', '1101', '', '0', 'MONTANA', 'Montana', '1'), ('820', 'NE', '1101', '', '0', 'NEBRASKA', 'Nebraska', '1'), ('821', 'NV', '1101', '', '0', 'NEVADA', 'Nevada', '1'), ('822', 'NH', '1101', '', '0', 'NEW HAMPSHIRE', 'New Hampshire', '1'), ('823', 'NJ', '1101', '', '0', 'NEW JERSEY', 'New Jersey', '1'), ('824', 'NM', '1101', '', '0', 'NEW MEXICO', 'New Mexico', '1'), ('825', 'NY', '1101', '', '0', 'NEW YORK', 'New York', '1'), ('826', 'NC', '1101', '', '0', 'NORTH CAROLINA', 'North Carolina', '1'), ('827', 'ND', '1101', '', '0', 'NORTH DAKOTA', 'North Dakota', '1'), ('828', 'OH', '1101', '', '0', 'OHIO', 'Ohio', '1'), ('829', 'OK', '1101', '', '0', 'OKLAHOMA', 'Oklahoma', '1'), ('830', 'OR', '1101', '', '0', 'OREGON', 'Oregon', '1'), ('831', 'PA', '1101', '', '0', 'PENNSYLVANIA', 'Pennsylvania', '1'), ('832', 'RI', '1101', '', '0', 'RHODE ISLAND', 'Rhode Island', '1'), ('833', 'SC', '1101', '', '0', 'SOUTH CAROLINA', 'South Carolina', '1'), ('834', 'SD', '1101', '', '0', 'SOUTH DAKOTA', 'South Dakota', '1'), ('835', 'TN', '1101', '', '0', 'TENNESSEE', 'Tennessee', '1'), ('836', 'TX', '1101', '', '0', 'TEXAS', 'Texas', '1'), ('837', 'UT', '1101', '', '0', 'UTAH', 'Utah', '1'), ('838', 'VT', '1101', '', '0', 'VERMONT', 'Vermont', '1'), ('839', 'VA', '1101', '', '0', 'VIRGINIA', 'Virginia', '1'), ('840', 'WA', '1101', '', '0', 'WASHINGTON', 'Washington', '1'), ('841', 'WV', '1101', '', '0', 'WEST VIRGINIA', 'West Virginia', '1'), ('842', 'WI', '1101', '', '0', 'WISCONSIN', 'Wisconsin', '1'), ('843', 'WY', '1101', '', '0', 'WYOMING', 'Wyoming', '1'), ('844', 'GR', '1701', null, null, null, 'Groningen', '1'), ('845', 'FR', '1701', null, null, null, 'Friesland', '1'), ('846', 'DR', '1701', null, null, null, 'Drenthe', '1'), ('847', 'OV', '1701', null, null, null, 'Overijssel', '1'), ('848', 'GD', '1701', null, null, null, 'Gelderland', '1'), ('849', 'FL', '1701', null, null, null, 'Flevoland', '1'), ('850', 'UT', '1701', null, null, null, 'Utrecht', '1'), ('851', 'NH', '1701', null, null, null, 'Noord-Holland', '1'), ('852', 'ZH', '1701', null, null, null, 'Zuid-Holland', '1'), ('853', 'ZL', '1701', null, null, null, 'Zeeland', '1'), ('854', 'NB', '1701', null, null, null, 'Noord-Brabant', '1'), ('855', 'LB', '1701', null, null, null, 'Limburg', '1'), ('856', 'SS', '8601', '', '0', '', 'San Salvador', '1'), ('857', 'SA', '8603', '', '0', '', 'Santa Ana', '1'), ('858', 'AH', '8603', '', '0', '', 'Ahuachapan', '1'), ('859', 'SO', '8603', '', '0', '', 'Sonsonate', '1'), ('860', 'US', '8602', '', '0', '', 'Usulutan', '1'), ('861', 'SM', '8602', '', '0', '', 'San Miguel', '1'), ('862', 'MO', '8602', '', '0', '', 'Morazan', '1'), ('863', 'LU', '8602', '', '0', '', 'La Union', '1'), ('864', 'LL', '8601', '', '0', '', 'La Libertad', '1'), ('865', 'CH', '8601', '', '0', '', 'Chalatenango', '1'), ('866', 'CA', '8601', '', '0', '', 'Cabañas', '1'), ('867', 'LP', '8601', '', '0', '', 'La Paz', '1'), ('868', 'SV', '8601', '', '0', '', 'San Vicente', '1'), ('869', 'CU', '8601', '', '0', '', 'Cuscatlan', '1'), ('870', '2301', '2301', '', '0', 'CATAMARCA', 'Catamarca', '1'), ('871', '2302', '2301', '', '0', 'JUJUY', 'Jujuy', '1'), ('872', '2303', '2301', '', '0', 'TUCAMAN', 'Tucamán', '1'), ('873', '2304', '2301', '', '0', 'SANTIAGO DEL ESTERO', 'Santiago del Estero', '1'), ('874', '2305', '2301', '', '0', 'SALTA', 'Salta', '1'), ('875', '2306', '2302', '', '0', 'CHACO', 'Chaco', '1'), ('876', '2307', '2302', '', '0', 'CORRIENTES', 'Corrientes', '1'), ('877', '2308', '2302', '', '0', 'ENTRE RIOS', 'Entre Ríos', '1'), ('878', '2309', '2302', '', '0', 'FORMOSA', 'Formosa', '1'), ('879', '2310', '2302', '', '0', 'SANTA FE', 'Santa Fe', '1'), ('880', '2311', '2303', '', '0', 'LA RIOJA', 'La Rioja', '1'), ('881', '2312', '2303', '', '0', 'MENDOZA', 'Mendoza', '1'), ('882', '2313', '2303', '', '0', 'SAN JUAN', 'San Juan', '1'), ('883', '2314', '2303', '', '0', 'SAN LUIS', 'San Luis', '1'), ('884', '2315', '2304', '', '0', 'CORDOBA', 'Córdoba', '1'), ('885', '2316', '2304', '', '0', 'BUENOS AIRES', 'Buenos Aires', '1'), ('886', '2317', '2304', '', '0', 'CABA', 'Caba', '1'), ('887', '2318', '2305', '', '0', 'LA PAMPA', 'La Pampa', '1'), ('888', '2319', '2305', '', '0', 'NEUQUEN', 'Neuquén', '1'), ('889', '2320', '2305', '', '0', 'RIO NEGRO', 'Río Negro', '1'), ('890', '2321', '2305', '', '0', 'CHUBUT', 'Chubut', '1'), ('891', '2322', '2305', '', '0', 'SANTA CRUZ', 'Santa Cruz', '1'), ('892', '2323', '2305', '', '0', 'TIERRA DEL FUEGO', 'Tierra del Fuego', '1'), ('893', '2324', '2305', '', '0', 'ISLAS MALVINAS', 'Islas Malvinas', '1'), ('894', '2325', '2305', '', '0', 'ANTARTIDA', 'Antártida', '1'), ('895', '2326', '2305', '', '0', 'MISIONES', 'Misiones', '1'), ('896', 'CC', '4601', 'Oistins', '0', 'CC', 'Christ Church', '1'), ('897', 'SA', '4601', 'Greenland', '0', 'SA', 'Saint Andrew', '1'), ('898', 'SG', '4601', 'Bulkeley', '0', 'SG', 'Saint George', '1'), ('899', 'JA', '4601', 'Holetown', '0', 'JA', 'Saint James', '1'), ('900', 'SJ', '4601', 'Four Roads', '0', 'SJ', 'Saint John', '1'), ('901', 'SB', '4601', 'Bathsheba', '0', 'SB', 'Saint Joseph', '1'), ('902', 'SL', '4601', 'Crab Hill', '0', 'SL', 'Saint Lucy', '1'), ('903', 'SM', '4601', 'Bridgetown', '0', 'SM', 'Saint Michael', '1'), ('904', 'SP', '4601', 'Speightstown', '0', 'SP', 'Saint Peter', '1'), ('905', 'SC', '4601', 'Crane', '0', 'SC', 'Saint Philip', '1'), ('906', 'ST', '4601', 'Hillaby', '0', 'ST', 'Saint Thomas', '1'), ('907', 'AC', '5601', 'ACRE', '0', 'AC', 'Acre', '1'), ('908', 'AL', '5601', 'ALAGOAS', '0', 'AL', 'Alagoas', '1'), ('909', 'AP', '5601', 'AMAPA', '0', 'AP', 'Amapá', '1'), ('910', 'AM', '5601', 'AMAZONAS', '0', 'AM', 'Amazonas', '1'), ('911', 'BA', '5601', 'BAHIA', '0', 'BA', 'Bahia', '1'), ('912', 'CE', '5601', 'CEARA', '0', 'CE', 'Ceará', '1'), ('913', 'ES', '5601', 'ESPIRITO SANTO', '0', 'ES', 'Espirito Santo', '1'), ('914', 'GO', '5601', 'GOIAS', '0', 'GO', 'Goiás', '1'), ('915', 'MA', '5601', 'MARANHAO', '0', 'MA', 'Maranhão', '1'), ('916', 'MT', '5601', 'MATO GROSSO', '0', 'MT', 'Mato Grosso', '1'), ('917', 'MS', '5601', 'MATO GROSSO DO SUL', '0', 'MS', 'Mato Grosso do Sul', '1'), ('918', 'MG', '5601', 'MINAS GERAIS', '0', 'MG', 'Minas Gerais', '1'), ('919', 'PA', '5601', 'PARA', '0', 'PA', 'Pará', '1'), ('920', 'PB', '5601', 'PARAIBA', '0', 'PB', 'Paraiba', '1'), ('921', 'PR', '5601', 'PARANA', '0', 'PR', 'Paraná', '1'), ('922', 'PE', '5601', 'PERNAMBUCO', '0', 'PE', 'Pernambuco', '1'), ('923', 'PI', '5601', 'PIAUI', '0', 'PI', 'Piauí', '1'), ('924', 'RJ', '5601', 'RIO DE JANEIRO', '0', 'RJ', 'Rio de Janeiro', '1'), ('925', 'RN', '5601', 'RIO GRANDE DO NORTE', '0', 'RN', 'Rio Grande do Norte', '1'), ('926', 'RS', '5601', 'RIO GRANDE DO SUL', '0', 'RS', 'Rio Grande do Sul', '1'), ('927', 'RO', '5601', 'RONDONIA', '0', 'RO', 'Rondônia', '1'), ('928', 'RR', '5601', 'RORAIMA', '0', 'RR', 'Roraima', '1'), ('929', 'SC', '5601', 'SANTA CATARINA', '0', 'SC', 'Santa Catarina', '1'), ('930', 'SE', '5601', 'SERGIPE', '0', 'SE', 'Sergipe', '1'), ('931', 'SP', '5601', 'SAO PAULO', '0', 'SP', 'Sao Paulo', '1'), ('932', 'TO', '5601', 'TOCANTINS', '0', 'TO', 'Tocantins', '1'), ('933', 'DF', '5601', 'DISTRITO FEDERAL', '0', 'DF', 'Distrito Federal', '1'), ('934', '151', '6715', '', '0', '151', 'Arica', '1'), ('935', '152', '6715', '', '0', '152', 'Parinacota', '1'), ('936', '011', '6701', '', '0', '011', 'Iquique', '1'), ('937', '014', '6701', '', '0', '014', 'Tamarugal', '1'), ('938', '021', '6702', '', '0', '021', 'Antofagasa', '1'), ('939', '022', '6702', '', '0', '022', 'El Loa', '1'), ('940', '023', '6702', '', '0', '023', 'Tocopilla', '1'), ('941', '031', '6703', '', '0', '031', 'Copiapó', '1'), ('942', '032', '6703', '', '0', '032', 'Chañaral', '1'), ('943', '033', '6703', '', '0', '033', 'Huasco', '1'), ('944', '041', '6704', '', '0', '041', 'Elqui', '1'), ('945', '042', '6704', '', '0', '042', 'Choapa', '1'), ('946', '043', '6704', '', '0', '043', 'Limarí', '1'), ('947', '051', '6705', '', '0', '051', 'Valparaíso', '1'), ('948', '052', '6705', '', '0', '052', 'Isla de Pascua', '1'), ('949', '053', '6705', '', '0', '053', 'Los Andes', '1'), ('950', '054', '6705', '', '0', '054', 'Petorca', '1'), ('951', '055', '6705', '', '0', '055', 'Quillota', '1'), ('952', '056', '6705', '', '0', '056', 'San Antonio', '1'), ('953', '057', '6705', '', '0', '057', 'San Felipe de Aconcagua', '1'), ('954', '058', '6705', '', '0', '058', 'Marga Marga', '1'), ('955', '061', '6706', '', '0', '061', 'Cachapoal', '1'), ('956', '062', '6706', '', '0', '062', 'Cardenal Caro', '1'), ('957', '063', '6706', '', '0', '063', 'Colchagua', '1'), ('958', '071', '6707', '', '0', '071', 'Talca', '1'), ('959', '072', '6707', '', '0', '072', 'Cauquenes', '1'), ('960', '073', '6707', '', '0', '073', 'Curicó', '1'), ('961', '074', '6707', '', '0', '074', 'Linares', '1'), ('962', '081', '6708', '', '0', '081', 'Concepción', '1'), ('963', '082', '6708', '', '0', '082', 'Arauco', '1'), ('964', '083', '6708', '', '0', '083', 'Biobío', '1'), ('965', '084', '6708', '', '0', '084', 'Ñuble', '1'), ('966', '091', '6709', '', '0', '091', 'Cautín', '1'), ('967', '092', '6709', '', '0', '092', 'Malleco', '1'), ('968', '141', '6714', '', '0', '141', 'Valdivia', '1'), ('969', '142', '6714', '', '0', '142', 'Ranco', '1'), ('970', '101', '6710', '', '0', '101', 'Llanquihue', '1'), ('971', '102', '6710', '', '0', '102', 'Chiloé', '1'), ('972', '103', '6710', '', '0', '103', 'Osorno', '1'), ('973', '104', '6710', '', '0', '104', 'Palena', '1'), ('974', '111', '6711', '', '0', '111', 'Coihaique', '1'), ('975', '112', '6711', '', '0', '112', 'Aisén', '1'), ('976', '113', '6711', '', '0', '113', 'Capitán Prat', '1'), ('977', '114', '6711', '', '0', '114', 'General Carrera', '1'), ('978', '121', '6712', '', '0', '121', 'Magallanes', '1'), ('979', '122', '6712', '', '0', '122', 'Antártica Chilena', '1'), ('980', '123', '6712', '', '0', '123', 'Tierra del Fuego', '1'), ('981', '124', '6712', '', '0', '124', 'Última Esperanza', '1'), ('982', '131', '6713', '', '0', '131', 'Santiago', '1'), ('983', '132', '6713', '', '0', '132', 'Cordillera', '1'), ('984', '133', '6713', '', '0', '133', 'Chacabuco', '1'), ('985', '134', '6713', '', '0', '134', 'Maipo', '1'), ('986', '135', '6713', '', '0', '135', 'Melipilla', '1'), ('987', '136', '6713', '', '0', '136', 'Talagante', '1'), ('988', 'AN', '11701', null, '0', 'AN', 'Andaman & Nicobar', '1'), ('989', 'AP', '11701', null, '0', 'AP', 'Andhra Pradesh', '1'), ('990', 'AR', '11701', null, '0', 'AR', 'Arunachal Pradesh', '1'), ('991', 'AS', '11701', null, '0', 'AS', 'Assam', '1'), ('992', 'BR', '11701', null, '0', 'BR', 'Bihar', '1'), ('993', 'CG', '11701', null, '0', 'CG', 'Chattisgarh', '1'), ('994', 'CH', '11701', null, '0', 'CH', 'Chandigarh', '1'), ('995', 'DD', '11701', null, '0', 'DD', 'Daman & Diu', '1'), ('996', 'DL', '11701', null, '0', 'DL', 'Delhi', '1'), ('997', 'DN', '11701', null, '0', 'DN', 'Dadra and Nagar Haveli', '1'), ('998', 'GA', '11701', null, '0', 'GA', 'Goa', '1'), ('999', 'GJ', '11701', null, '0', 'GJ', 'Gujarat', '1'), ('1000', 'HP', '11701', null, '0', 'HP', 'Himachal Pradesh', '1'), ('1001', 'HR', '11701', null, '0', 'HR', 'Haryana', '1'), ('1002', 'JH', '11701', null, '0', 'JH', 'Jharkhand', '1'), ('1003', 'JK', '11701', null, '0', 'JK', 'Jammu & Kashmir', '1'), ('1004', 'KA', '11701', null, '0', 'KA', 'Karnataka', '1'), ('1005', 'KL', '11701', null, '0', 'KL', 'Kerala', '1'), ('1006', 'LD', '11701', null, '0', 'LD', 'Lakshadweep', '1'), ('1007', 'MH', '11701', null, '0', 'MH', 'Maharashtra', '1'), ('1008', 'ML', '11701', null, '0', 'ML', 'Meghalaya', '1'), ('1009', 'MN', '11701', null, '0', 'MN', 'Manipur', '1'), ('1010', 'MP', '11701', null, '0', 'MP', 'Madhya Pradesh', '1'), ('1011', 'MZ', '11701', null, '0', 'MZ', 'Mizoram', '1'), ('1012', 'NL', '11701', null, '0', 'NL', 'Nagaland', '1'), ('1013', 'OR', '11701', null, '0', 'OR', 'Orissa', '1'), ('1014', 'PB', '11701', null, '0', 'PB', 'Punjab', '1'), ('1015', 'PY', '11701', null, '0', 'PY', 'Puducherry', '1'), ('1016', 'RJ', '11701', null, '0', 'RJ', 'Rajasthan', '1'), ('1017', 'SK', '11701', null, '0', 'SK', 'Sikkim', '1'), ('1018', 'TN', '11701', null, '0', 'TN', 'Tamil Nadu', '1'), ('1019', 'TR', '11701', null, '0', 'TR', 'Tripura', '1'), ('1020', 'UL', '11701', null, '0', 'UL', 'Uttarakhand', '1'), ('1021', 'UP', '11701', null, '0', 'UP', 'Uttar Pradesh', '1'), ('1022', 'WB', '11701', null, '0', 'WB', 'West Bengal', '1'), ('1023', 'BA', '11801', null, '0', 'BA', 'Bali', '1'), ('1024', 'BB', '11801', null, '0', 'BB', 'Bangka Belitung', '1'), ('1025', 'BT', '11801', null, '0', 'BT', 'Banten', '1'), ('1026', 'BE', '11801', null, '0', 'BA', 'Bengkulu', '1'), ('1027', 'YO', '11801', null, '0', 'YO', 'DI Yogyakarta', '1'), ('1028', 'JK', '11801', null, '0', 'JK', 'DKI Jakarta', '1'), ('1029', 'GO', '11801', null, '0', 'GO', 'Gorontalo', '1'), ('1030', 'JA', '11801', null, '0', 'JA', 'Jambi', '1'), ('1031', 'JB', '11801', null, '0', 'JB', 'Jawa Barat', '1'), ('1032', 'JT', '11801', null, '0', 'JT', 'Jawa Tengah', '1'), ('1033', 'JI', '11801', null, '0', 'JI', 'Jawa Timur', '1'), ('1034', 'KB', '11801', null, '0', 'KB', 'Kalimantan Barat', '1'), ('1035', 'KS', '11801', null, '0', 'KS', 'Kalimantan Selatan', '1'), ('1036', 'KT', '11801', null, '0', 'KT', 'Kalimantan Tengah', '1'), ('1037', 'KI', '11801', null, '0', 'KI', 'Kalimantan Timur', '1'), ('1038', 'KU', '11801', null, '0', 'KU', 'Kalimantan Utara', '1'), ('1039', 'KR', '11801', null, '0', 'KR', 'Kepulauan Riau', '1'), ('1040', 'LA', '11801', null, '0', 'LA', 'Lampung', '1'), ('1041', 'MA', '11801', null, '0', 'MA', 'Maluku', '1'), ('1042', 'MU', '11801', null, '0', 'MU', 'Maluku Utara', '1'), ('1043', 'AC', '11801', null, '0', 'AC', 'Nanggroe Aceh Darussalam', '1'), ('1044', 'NB', '11801', null, '0', 'NB', 'Nusa Tenggara Barat', '1'), ('1045', 'NT', '11801', null, '0', 'NT', 'Nusa Tenggara Timur', '1'), ('1046', 'PA', '11801', null, '0', 'PA', 'Papua', '1'), ('1047', 'PB', '11801', null, '0', 'PB', 'Papua Barat', '1'), ('1048', 'RI', '11801', null, '0', 'RI', 'Riau', '1'), ('1049', 'SR', '11801', null, '0', 'SR', 'Sulawesi Barat', '1'), ('1050', 'SN', '11801', null, '0', 'SN', 'Sulawesi Selatan', '1'), ('1051', 'ST', '11801', null, '0', 'ST', 'Sulawesi Tengah', '1'), ('1052', 'SG', '11801', null, '0', 'SG', 'Sulawesi Tenggara', '1'), ('1053', 'SA', '11801', null, '0', 'SA', 'Sulawesi Utara', '1'), ('1054', 'SB', '11801', null, '0', 'SB', 'Sumatera Barat', '1'), ('1055', 'SS', '11801', null, '0', 'SS', 'Sumatera Selatan', '1'), ('1056', 'SU', '11801', null, '0', 'SU', 'Sumatera Utara	', '1'), ('1057', 'DIF', '15401', '', '0', 'DIF', 'Distrito Federal', '1'), ('1058', 'AGS', '15401', '', '0', 'AGS', 'Aguascalientes', '1'), ('1059', 'BCN', '15401', '', '0', 'BCN', 'Baja California Norte', '1'), ('1060', 'BCS', '15401', '', '0', 'BCS', 'Baja California Sur', '1'), ('1061', 'CAM', '15401', '', '0', 'CAM', 'Campeche', '1'), ('1062', 'CHP', '15401', '', '0', 'CHP', 'Chiapas', '1'), ('1063', 'CHI', '15401', '', '0', 'CHI', 'Chihuahua', '1'), ('1064', 'COA', '15401', '', '0', 'COA', 'Coahuila', '1'), ('1065', 'COL', '15401', '', '0', 'COL', 'Colima', '1'), ('1066', 'DUR', '15401', '', '0', 'DUR', 'Durango', '1'), ('1067', 'GTO', '15401', '', '0', 'GTO', 'Guanajuato', '1'), ('1068', 'GRO', '15401', '', '0', 'GRO', 'Guerrero', '1'), ('1069', 'HGO', '15401', '', '0', 'HGO', 'Hidalgo', '1'), ('1070', 'JAL', '15401', '', '0', 'JAL', 'Jalisco', '1'), ('1071', 'MEX', '15401', '', '0', 'MEX', 'México', '1'), ('1072', 'MIC', '15401', '', '0', 'MIC', 'Michoacán de Ocampo', '1'), ('1073', 'MOR', '15401', '', '0', 'MOR', 'Morelos', '1'), ('1074', 'NAY', '15401', '', '0', 'NAY', 'Nayarit', '1'), ('1075', 'NLE', '15401', '', '0', 'NLE', 'Nuevo León', '1'), ('1076', 'OAX', '15401', '', '0', 'OAX', 'Oaxaca', '1'), ('1077', 'PUE', '15401', '', '0', 'PUE', 'Puebla', '1'), ('1078', 'QRO', '15401', '', '0', 'QRO', 'Querétaro', '1'), ('1079', 'ROO', '15401', '', '0', 'ROO', 'Quintana Roo', '1');
INSERT INTO `llx_c_departements` VALUES ('1080', 'SLP', '15401', '', '0', 'SLP', 'San Luis Potosí', '1'), ('1081', 'SIN', '15401', '', '0', 'SIN', 'Sinaloa', '1'), ('1082', 'SON', '15401', '', '0', 'SON', 'Sonora', '1'), ('1083', 'TAB', '15401', '', '0', 'TAB', 'Tabasco', '1'), ('1084', 'TAM', '15401', '', '0', 'TAM', 'Tamaulipas', '1'), ('1085', 'TLX', '15401', '', '0', 'TLX', 'Tlaxcala', '1'), ('1086', 'VER', '15401', '', '0', 'VER', 'Veracruz', '1'), ('1087', 'YUC', '15401', '', '0', 'YUC', 'Yucatán', '1'), ('1088', 'ZAC', '15401', '', '0', 'ZAC', 'Zacatecas', '1'), ('1089', 'ANT', '7001', '', '0', 'ANT', 'Antioquia', '1'), ('1090', 'BOL', '7001', '', '0', 'BOL', 'Bolívar', '1'), ('1091', 'BOY', '7001', '', '0', 'BOY', 'Boyacá', '1'), ('1092', 'CAL', '7001', '', '0', 'CAL', 'Caldas', '1'), ('1093', 'CAU', '7001', '', '0', 'CAU', 'Cauca', '1'), ('1094', 'CUN', '7001', '', '0', 'CUN', 'Cundinamarca', '1'), ('1095', 'HUI', '7001', '', '0', 'HUI', 'Huila', '1'), ('1096', 'LAG', '7001', '', '0', 'LAG', 'La Guajira', '1'), ('1097', 'MET', '7001', '', '0', 'MET', 'Meta', '1'), ('1098', 'NAR', '7001', '', '0', 'NAR', 'Nariño', '1'), ('1099', 'NDS', '7001', '', '0', 'NDS', 'Norte de Santander', '1'), ('1100', 'SAN', '7001', '', '0', 'SAN', 'Santander', '1'), ('1101', 'SUC', '7001', '', '0', 'SUC', 'Sucre', '1'), ('1102', 'TOL', '7001', '', '0', 'TOL', 'Tolima', '1'), ('1103', 'VAC', '7001', '', '0', 'VAC', 'Valle del Cauca', '1'), ('1104', 'RIS', '7001', '', '0', 'RIS', 'Risalda', '1'), ('1105', 'ATL', '7001', '', '0', 'ATL', 'Atlántico', '1'), ('1106', 'COR', '7001', '', '0', 'COR', 'Córdoba', '1'), ('1107', 'SAP', '7001', '', '0', 'SAP', 'San Andrés, Providencia y Santa Catalina', '1'), ('1108', 'ARA', '7001', '', '0', 'ARA', 'Arauca', '1'), ('1109', 'CAS', '7001', '', '0', 'CAS', 'Casanare', '1'), ('1110', 'AMA', '7001', '', '0', 'AMA', 'Amazonas', '1'), ('1111', 'CAQ', '7001', '', '0', 'CAQ', 'Caquetá', '1'), ('1112', 'CHO', '7001', '', '0', 'CHO', 'Chocó', '1'), ('1113', 'GUA', '7001', '', '0', 'GUA', 'Guainía', '1'), ('1114', 'GUV', '7001', '', '0', 'GUV', 'Guaviare', '1'), ('1115', 'PUT', '7001', '', '0', 'PUT', 'Putumayo', '1'), ('1116', 'QUI', '7001', '', '0', 'QUI', 'Quindío', '1'), ('1117', 'VAU', '7001', '', '0', 'VAU', 'Vaupés', '1'), ('1118', 'BOG', '7001', '', '0', 'BOG', 'Bogotá', '1'), ('1119', 'VID', '7001', '', '0', 'VID', 'Vichada', '1'), ('1120', 'CES', '7001', '', '0', 'CES', 'Cesar', '1'), ('1121', 'MAG', '7001', '', '0', 'MAG', 'Magdalena', '1'), ('1122', 'AT', '11401', '', '0', 'AT', 'Atlántida', '1'), ('1123', 'CH', '11401', '', '0', 'CH', 'Choluteca', '1'), ('1124', 'CL', '11401', '', '0', 'CL', 'Colón', '1'), ('1125', 'CM', '11401', '', '0', 'CM', 'Comayagua', '1'), ('1126', 'CO', '11401', '', '0', 'CO', 'Copán', '1'), ('1127', 'CR', '11401', '', '0', 'CR', 'Cortés', '1'), ('1128', 'EP', '11401', '', '0', 'EP', 'El Paraíso', '1'), ('1129', 'FM', '11401', '', '0', 'FM', 'Francisco Morazán', '1'), ('1130', 'GD', '11401', '', '0', 'GD', 'Gracias a Dios', '1'), ('1131', 'IN', '11401', '', '0', 'IN', 'Intibucá', '1'), ('1132', 'IB', '11401', '', '0', 'IB', 'Islas de la Bahía', '1'), ('1133', 'LP', '11401', '', '0', 'LP', 'La Paz', '1'), ('1134', 'LM', '11401', '', '0', 'LM', 'Lempira', '1'), ('1135', 'OC', '11401', '', '0', 'OC', 'Ocotepeque', '1'), ('1136', 'OL', '11401', '', '0', 'OL', 'Olancho', '1'), ('1137', 'SB', '11401', '', '0', 'SB', 'Santa Bárbara', '1'), ('1138', 'VL', '11401', '', '0', 'VL', 'Valle', '1'), ('1139', 'YO', '11401', '', '0', 'YO', 'Yoro', '1'), ('1140', 'DC', '11401', '', '0', 'DC', 'Distrito Central', '1'), ('1141', 'AB', '18801', '', '0', '', 'Alba', '1'), ('1142', 'AR', '18801', '', '0', '', 'Arad', '1'), ('1143', 'AG', '18801', '', '0', '', 'Argeș', '1'), ('1144', 'BC', '18801', '', '0', '', 'Bacău', '1'), ('1145', 'BH', '18801', '', '0', '', 'Bihor', '1'), ('1146', 'BN', '18801', '', '0', '', 'Bistrița-Năsăud', '1'), ('1147', 'BT', '18801', '', '0', '', 'Botoșani', '1'), ('1148', 'BV', '18801', '', '0', '', 'Brașov', '1'), ('1149', 'BR', '18801', '', '0', '', 'Brăila', '1'), ('1150', 'BZ', '18801', '', '0', '', 'Buzău', '1'), ('1151', 'CL', '18801', '', '0', '', 'Călărași', '1'), ('1152', 'CS', '18801', '', '0', '', 'Caraș-Severin', '1'), ('1153', 'CJ', '18801', '', '0', '', 'Cluj', '1'), ('1154', 'CT', '18801', '', '0', '', 'Constanța', '1'), ('1155', 'CV', '18801', '', '0', '', 'Covasna', '1'), ('1156', 'DB', '18801', '', '0', '', 'Dâmbovița', '1'), ('1157', 'DJ', '18801', '', '0', '', 'Dolj', '1'), ('1158', 'GL', '18801', '', '0', '', 'Galați', '1'), ('1159', 'GR', '18801', '', '0', '', 'Giurgiu', '1'), ('1160', 'GJ', '18801', '', '0', '', 'Gorj', '1'), ('1161', 'HR', '18801', '', '0', '', 'Harghita', '1'), ('1162', 'HD', '18801', '', '0', '', 'Hunedoara', '1'), ('1163', 'IL', '18801', '', '0', '', 'Ialomița', '1'), ('1164', 'IS', '18801', '', '0', '', 'Iași', '1'), ('1165', 'IF', '18801', '', '0', '', 'Ilfov', '1'), ('1166', 'MM', '18801', '', '0', '', 'Maramureș', '1'), ('1167', 'MH', '18801', '', '0', '', 'Mehedinți', '1'), ('1168', 'MS', '18801', '', '0', '', 'Mureș', '1'), ('1169', 'NT', '18801', '', '0', '', 'Neamț', '1'), ('1170', 'OT', '18801', '', '0', '', 'Olt', '1'), ('1171', 'PH', '18801', '', '0', '', 'Prahova', '1'), ('1172', 'SM', '18801', '', '0', '', 'Satu Mare', '1'), ('1173', 'SJ', '18801', '', '0', '', 'Sălaj', '1'), ('1174', 'SB', '18801', '', '0', '', 'Sibiu', '1'), ('1175', 'SV', '18801', '', '0', '', 'Suceava', '1'), ('1176', 'TR', '18801', '', '0', '', 'Teleorman', '1'), ('1177', 'TM', '18801', '', '0', '', 'Timiș', '1'), ('1178', 'TL', '18801', '', '0', '', 'Tulcea', '1'), ('1179', 'VS', '18801', '', '0', '', 'Vaslui', '1'), ('1180', 'VL', '18801', '', '0', '', 'Vâlcea', '1'), ('1181', 'VN', '18801', '', '0', '', 'Vrancea', '1'), ('1182', 'BU', '18801', '', '0', '', 'Bucuresti', '1'), ('1183', 'VE-L', '23201', '', '0', 'VE-L', 'Mérida', '1'), ('1184', 'VE-T', '23201', '', '0', 'VE-T', 'Trujillo', '1'), ('1185', 'VE-E', '23201', '', '0', 'VE-E', 'Barinas', '1'), ('1186', 'VE-M', '23202', '', '0', 'VE-M', 'Miranda', '1'), ('1187', 'VE-W', '23202', '', '0', 'VE-W', 'Vargas', '1'), ('1188', 'VE-A', '23202', '', '0', 'VE-A', 'Distrito Capital', '1'), ('1189', 'VE-D', '23203', '', '0', 'VE-D', 'Aragua', '1'), ('1190', 'VE-G', '23203', '', '0', 'VE-G', 'Carabobo', '1'), ('1191', 'VE-I', '23204', '', '0', 'VE-I', 'Falcón', '1'), ('1192', 'VE-K', '23204', '', '0', 'VE-K', 'Lara', '1'), ('1193', 'VE-U', '23204', '', '0', 'VE-U', 'Yaracuy', '1'), ('1194', 'VE-F', '23205', '', '0', 'VE-F', 'Bolívar', '1'), ('1195', 'VE-X', '23205', '', '0', 'VE-X', 'Amazonas', '1'), ('1196', 'VE-Y', '23205', '', '0', 'VE-Y', 'Delta Amacuro', '1'), ('1197', 'VE-O', '23206', '', '0', 'VE-O', 'Nueva Esparta', '1'), ('1198', 'VE-Z', '23206', '', '0', 'VE-Z', 'Dependencias Federales', '1'), ('1199', 'VE-C', '23207', '', '0', 'VE-C', 'Apure', '1'), ('1200', 'VE-J', '23207', '', '0', 'VE-J', 'Guárico', '1'), ('1201', 'VE-H', '23207', '', '0', 'VE-H', 'Cojedes', '1'), ('1202', 'VE-P', '23207', '', '0', 'VE-P', 'Portuguesa', '1'), ('1203', 'VE-B', '23208', '', '0', 'VE-B', 'Anzoátegui', '1'), ('1204', 'VE-N', '23208', '', '0', 'VE-N', 'Monagas', '1'), ('1205', 'VE-R', '23208', '', '0', 'VE-R', 'Sucre', '1'), ('1206', 'VE-V', '23209', '', '0', 'VE-V', 'Zulia', '1'), ('1207', 'VE-S', '23209', '', '0', 'VE-S', 'Táchira', '1'), ('1208', 'LU0001', '14001', '', '0', '', 'Clervaux', '1'), ('1209', 'LU0002', '14001', '', '0', '', 'Diekirch', '1'), ('1210', 'LU0003', '14001', '', '0', '', 'Redange', '1'), ('1211', 'LU0004', '14001', '', '0', '', 'Vianden', '1'), ('1212', 'LU0005', '14001', '', '0', '', 'Wiltz', '1'), ('1213', 'LU0006', '14002', '', '0', '', 'Echternach', '1'), ('1214', 'LU0007', '14002', '', '0', '', 'Grevenmacher', '1'), ('1215', 'LU0008', '14002', '', '0', '', 'Remich', '1'), ('1216', 'LU0009', '14003', '', '0', '', 'Capellen', '1'), ('1217', 'LU0010', '14003', '', '0', '', 'Esch-sur-Alzette', '1'), ('1218', 'LU0011', '14003', '', '0', '', 'Luxembourg', '1'), ('1219', 'LU0012', '14003', '', '0', '', 'Mersch', '1'), ('1220', '0101', '18101', '', '0', '', 'Chachapoyas', '1'), ('1221', '0102', '18101', '', '0', '', 'Bagua', '1'), ('1222', '0103', '18101', '', '0', '', 'Bongará', '1'), ('1223', '0104', '18101', '', '0', '', 'Condorcanqui', '1'), ('1224', '0105', '18101', '', '0', '', 'Luya', '1'), ('1225', '0106', '18101', '', '0', '', 'Rodríguez de Mendoza', '1'), ('1226', '0107', '18101', '', '0', '', 'Utcubamba', '1'), ('1227', '0201', '18102', '', '0', '', 'Huaraz', '1'), ('1228', '0202', '18102', '', '0', '', 'Aija', '1'), ('1229', '0203', '18102', '', '0', '', 'Antonio Raymondi', '1'), ('1230', '0204', '18102', '', '0', '', 'Asunción', '1'), ('1231', '0205', '18102', '', '0', '', 'Bolognesi', '1'), ('1232', '0206', '18102', '', '0', '', 'Carhuaz', '1'), ('1233', '0207', '18102', '', '0', '', 'Carlos Fermín Fitzcarrald', '1'), ('1234', '0208', '18102', '', '0', '', 'Casma', '1'), ('1235', '0209', '18102', '', '0', '', 'Corongo', '1'), ('1236', '0210', '18102', '', '0', '', 'Huari', '1'), ('1237', '0211', '18102', '', '0', '', 'Huarmey', '1'), ('1238', '0212', '18102', '', '0', '', 'Huaylas', '1'), ('1239', '0213', '18102', '', '0', '', 'Mariscal Luzuriaga', '1'), ('1240', '0214', '18102', '', '0', '', 'Ocros', '1'), ('1241', '0215', '18102', '', '0', '', 'Pallasca', '1'), ('1242', '0216', '18102', '', '0', '', 'Pomabamba', '1'), ('1243', '0217', '18102', '', '0', '', 'Recuay', '1'), ('1244', '0218', '18102', '', '0', '', 'Papá', '1'), ('1245', '0219', '18102', '', '0', '', 'Sihuas', '1'), ('1246', '0220', '18102', '', '0', '', 'Yungay', '1'), ('1247', '0301', '18103', '', '0', '', 'Abancay', '1'), ('1248', '0302', '18103', '', '0', '', 'Andahuaylas', '1'), ('1249', '0303', '18103', '', '0', '', 'Antabamba', '1'), ('1250', '0304', '18103', '', '0', '', 'Aymaraes', '1'), ('1251', '0305', '18103', '', '0', '', 'Cotabambas', '1'), ('1252', '0306', '18103', '', '0', '', 'Chincheros', '1'), ('1253', '0307', '18103', '', '0', '', 'Grau', '1'), ('1254', '0401', '18104', '', '0', '', 'Arequipa', '1'), ('1255', '0402', '18104', '', '0', '', 'Camaná', '1'), ('1256', '0403', '18104', '', '0', '', 'Caravelí', '1'), ('1257', '0404', '18104', '', '0', '', 'Castilla', '1'), ('1258', '0405', '18104', '', '0', '', 'Caylloma', '1'), ('1259', '0406', '18104', '', '0', '', 'Condesuyos', '1'), ('1260', '0407', '18104', '', '0', '', 'Islay', '1'), ('1261', '0408', '18104', '', '0', '', 'La Unión', '1'), ('1262', '0501', '18105', '', '0', '', 'Huamanga', '1'), ('1263', '0502', '18105', '', '0', '', 'Cangallo', '1'), ('1264', '0503', '18105', '', '0', '', 'Huanca Sancos', '1'), ('1265', '0504', '18105', '', '0', '', 'Huanta', '1'), ('1266', '0505', '18105', '', '0', '', 'La Mar', '1'), ('1267', '0506', '18105', '', '0', '', 'Lucanas', '1'), ('1268', '0507', '18105', '', '0', '', 'Parinacochas', '1'), ('1269', '0508', '18105', '', '0', '', 'Páucar del Sara Sara', '1'), ('1270', '0509', '18105', '', '0', '', 'Sucre', '1'), ('1271', '0510', '18105', '', '0', '', 'Víctor Fajardo', '1'), ('1272', '0511', '18105', '', '0', '', 'Vilcas Huamán', '1'), ('1273', '0601', '18106', '', '0', '', 'Cajamarca', '1'), ('1274', '0602', '18106', '', '0', '', 'Cajabamba', '1'), ('1275', '0603', '18106', '', '0', '', 'Celendín', '1'), ('1276', '0604', '18106', '', '0', '', 'Chota', '1'), ('1277', '0605', '18106', '', '0', '', 'Contumazá', '1'), ('1278', '0606', '18106', '', '0', '', 'Cutervo', '1'), ('1279', '0607', '18106', '', '0', '', 'Hualgayoc', '1'), ('1280', '0608', '18106', '', '0', '', 'Jaén', '1'), ('1281', '0609', '18106', '', '0', '', 'San Ignacio', '1'), ('1282', '0610', '18106', '', '0', '', 'San Marcos', '1'), ('1283', '0611', '18106', '', '0', '', 'San Miguel', '1'), ('1284', '0612', '18106', '', '0', '', 'San Pablo', '1'), ('1285', '0613', '18106', '', '0', '', 'Santa Cruz', '1'), ('1286', '0701', '18107', '', '0', '', 'Callao', '1'), ('1287', '0801', '18108', '', '0', '', 'Cusco', '1'), ('1288', '0802', '18108', '', '0', '', 'Acomayo', '1'), ('1289', '0803', '18108', '', '0', '', 'Anta', '1'), ('1290', '0804', '18108', '', '0', '', 'Calca', '1'), ('1291', '0805', '18108', '', '0', '', 'Canas', '1'), ('1292', '0806', '18108', '', '0', '', 'Canchis', '1'), ('1293', '0807', '18108', '', '0', '', 'Chumbivilcas', '1'), ('1294', '0808', '18108', '', '0', '', 'Espinar', '1'), ('1295', '0809', '18108', '', '0', '', 'La Convención', '1'), ('1296', '0810', '18108', '', '0', '', 'Paruro', '1'), ('1297', '0811', '18108', '', '0', '', 'Paucartambo', '1'), ('1298', '0812', '18108', '', '0', '', 'Quispicanchi', '1'), ('1299', '0813', '18108', '', '0', '', 'Urubamba', '1'), ('1300', '0901', '18109', '', '0', '', 'Huancavelica', '1'), ('1301', '0902', '18109', '', '0', '', 'Acobamba', '1'), ('1302', '0903', '18109', '', '0', '', 'Angaraes', '1'), ('1303', '0904', '18109', '', '0', '', 'Castrovirreyna', '1'), ('1304', '0905', '18109', '', '0', '', 'Churcampa', '1'), ('1305', '0906', '18109', '', '0', '', 'Huaytará', '1'), ('1306', '0907', '18109', '', '0', '', 'Tayacaja', '1'), ('1307', '1001', '18110', '', '0', '', 'Huánuco', '1'), ('1308', '1002', '18110', '', '0', '', 'Ambón', '1'), ('1309', '1003', '18110', '', '0', '', 'Dos de Mayo', '1'), ('1310', '1004', '18110', '', '0', '', 'Huacaybamba', '1'), ('1311', '1005', '18110', '', '0', '', 'Huamalíes', '1'), ('1312', '1006', '18110', '', '0', '', 'Leoncio Prado', '1'), ('1313', '1007', '18110', '', '0', '', 'Marañón', '1'), ('1314', '1008', '18110', '', '0', '', 'Pachitea', '1'), ('1315', '1009', '18110', '', '0', '', 'Puerto Inca', '1'), ('1316', '1010', '18110', '', '0', '', 'Lauricocha', '1'), ('1317', '1011', '18110', '', '0', '', 'Yarowilca', '1'), ('1318', '1101', '18111', '', '0', '', 'Ica', '1'), ('1319', '1102', '18111', '', '0', '', 'Chincha', '1'), ('1320', '1103', '18111', '', '0', '', 'Nazca', '1'), ('1321', '1104', '18111', '', '0', '', 'Palpa', '1'), ('1322', '1105', '18111', '', '0', '', 'Pisco', '1'), ('1323', '1201', '18112', '', '0', '', 'Huancayo', '1'), ('1324', '1202', '18112', '', '0', '', 'Concepción', '1'), ('1325', '1203', '18112', '', '0', '', 'Chanchamayo', '1'), ('1326', '1204', '18112', '', '0', '', 'Jauja', '1'), ('1327', '1205', '18112', '', '0', '', 'Junín', '1'), ('1328', '1206', '18112', '', '0', '', 'Satipo', '1'), ('1329', '1207', '18112', '', '0', '', 'Tarma', '1'), ('1330', '1208', '18112', '', '0', '', 'Yauli', '1'), ('1331', '1209', '18112', '', '0', '', 'Chupaca', '1'), ('1332', '1301', '18113', '', '0', '', 'Trujillo', '1'), ('1333', '1302', '18113', '', '0', '', 'Ascope', '1'), ('1334', '1303', '18113', '', '0', '', 'Bolívar', '1'), ('1335', '1304', '18113', '', '0', '', 'Chepén', '1'), ('1336', '1305', '18113', '', '0', '', 'Julcán', '1'), ('1337', '1306', '18113', '', '0', '', 'Otuzco', '1'), ('1338', '1307', '18113', '', '0', '', 'Pacasmayo', '1'), ('1339', '1308', '18113', '', '0', '', 'Pataz', '1'), ('1340', '1309', '18113', '', '0', '', 'Sánchez Carrión', '1'), ('1341', '1310', '18113', '', '0', '', 'Santiago de Chuco', '1'), ('1342', '1311', '18113', '', '0', '', 'Gran Chimú', '1'), ('1343', '1312', '18113', '', '0', '', 'Virú', '1'), ('1344', '1401', '18114', '', '0', '', 'Chiclayo', '1'), ('1345', '1402', '18114', '', '0', '', 'Ferreñafe', '1'), ('1346', '1403', '18114', '', '0', '', 'Lambayeque', '1'), ('1347', '1501', '18115', '', '0', '', 'Lima', '1'), ('1348', '1502', '18116', '', '0', '', 'Huaura', '1'), ('1349', '1503', '18116', '', '0', '', 'Barranca', '1'), ('1350', '1504', '18116', '', '0', '', 'Cajatambo', '1'), ('1351', '1505', '18116', '', '0', '', 'Canta', '1'), ('1352', '1506', '18116', '', '0', '', 'Cañete', '1'), ('1353', '1507', '18116', '', '0', '', 'Huaral', '1'), ('1354', '1508', '18116', '', '0', '', 'Huarochirí', '1'), ('1355', '1509', '18116', '', '0', '', 'Oyón', '1'), ('1356', '1510', '18116', '', '0', '', 'Yauyos', '1'), ('1357', '1601', '18117', '', '0', '', 'Maynas', '1'), ('1358', '1602', '18117', '', '0', '', 'Alto Amazonas', '1'), ('1359', '1603', '18117', '', '0', '', 'Loreto', '1'), ('1360', '1604', '18117', '', '0', '', 'Mariscal Ramón Castilla', '1'), ('1361', '1605', '18117', '', '0', '', 'Requena', '1'), ('1362', '1606', '18117', '', '0', '', 'Ucayali', '1'), ('1363', '1607', '18117', '', '0', '', 'Datem del Marañón', '1'), ('1364', '1701', '18118', '', '0', '', 'Tambopata', '1'), ('1365', '1702', '18118', '', '0', '', 'Manú', '1'), ('1366', '1703', '18118', '', '0', '', 'Tahuamanu', '1'), ('1367', '1801', '18119', '', '0', '', 'Mariscal Nieto', '1'), ('1368', '1802', '18119', '', '0', '', 'General Sánchez Cerro', '1'), ('1369', '1803', '18119', '', '0', '', 'Ilo', '1'), ('1370', '1901', '18120', '', '0', '', 'Pasco', '1'), ('1371', '1902', '18120', '', '0', '', 'Daniel Alcides Carrión', '1'), ('1372', '1903', '18120', '', '0', '', 'Oxapampa', '1'), ('1373', '2001', '18121', '', '0', '', 'Piura', '1'), ('1374', '2002', '18121', '', '0', '', 'Ayabaca', '1'), ('1375', '2003', '18121', '', '0', '', 'Huancabamba', '1'), ('1376', '2004', '18121', '', '0', '', 'Morropón', '1'), ('1377', '2005', '18121', '', '0', '', 'Paita', '1'), ('1378', '2006', '18121', '', '0', '', 'Sullana', '1'), ('1379', '2007', '18121', '', '0', '', 'Talara', '1'), ('1380', '2008', '18121', '', '0', '', 'Sechura', '1'), ('1381', '2101', '18122', '', '0', '', 'Puno', '1'), ('1382', '2102', '18122', '', '0', '', 'Azángaro', '1'), ('1383', '2103', '18122', '', '0', '', 'Carabaya', '1'), ('1384', '2104', '18122', '', '0', '', 'Chucuito', '1'), ('1385', '2105', '18122', '', '0', '', 'El Collao', '1'), ('1386', '2106', '18122', '', '0', '', 'Huancané', '1'), ('1387', '2107', '18122', '', '0', '', 'Lampa', '1'), ('1388', '2108', '18122', '', '0', '', 'Melgar', '1'), ('1389', '2109', '18122', '', '0', '', 'Moho', '1'), ('1390', '2110', '18122', '', '0', '', 'San Antonio de Putina', '1'), ('1391', '2111', '18122', '', '0', '', 'San Román', '1'), ('1392', '2112', '18122', '', '0', '', 'Sandia', '1'), ('1393', '2113', '18122', '', '0', '', 'Yunguyo', '1'), ('1394', '2201', '18123', '', '0', '', 'Moyobamba', '1'), ('1395', '2202', '18123', '', '0', '', 'Bellavista', '1'), ('1396', '2203', '18123', '', '0', '', 'El Dorado', '1'), ('1397', '2204', '18123', '', '0', '', 'Huallaga', '1'), ('1398', '2205', '18123', '', '0', '', 'Lamas', '1'), ('1399', '2206', '18123', '', '0', '', 'Mariscal Cáceres', '1'), ('1400', '2207', '18123', '', '0', '', 'Picota', '1'), ('1401', '2208', '18123', '', '0', '', 'La Rioja', '1'), ('1402', '2209', '18123', '', '0', '', 'San Martín', '1'), ('1403', '2210', '18123', '', '0', '', 'Tocache', '1'), ('1404', '2301', '18124', '', '0', '', 'Tacna', '1'), ('1405', '2302', '18124', '', '0', '', 'Candarave', '1'), ('1406', '2303', '18124', '', '0', '', 'Jorge Basadre', '1'), ('1407', '2304', '18124', '', '0', '', 'Tarata', '1'), ('1408', '2401', '18125', '', '0', '', 'Tumbes', '1'), ('1409', '2402', '18125', '', '0', '', 'Contralmirante Villar', '1'), ('1410', '2403', '18125', '', '0', '', 'Zarumilla', '1'), ('1411', '2501', '18126', '', '0', '', 'Coronel Portillo', '1'), ('1412', '2502', '18126', '', '0', '', 'Atalaya', '1'), ('1413', '2503', '18126', '', '0', '', 'Padre Abad', '1'), ('1414', '2504', '18126', '', '0', '', 'Purús', '1'), ('1415', 'PA-1', '17801', '', '0', '', 'Bocas del Toro', '1'), ('1416', 'PA-2', '17801', '', '0', '', 'Coclé', '1'), ('1417', 'PA-3', '17801', '', '0', '', 'Colón', '1'), ('1418', 'PA-4', '17801', '', '0', '', 'Chiriquí', '1'), ('1419', 'PA-5', '17801', '', '0', '', 'Darién', '1'), ('1420', 'PA-6', '17801', '', '0', '', 'Herrera', '1'), ('1421', 'PA-7', '17801', '', '0', '', 'Los Santos', '1'), ('1422', 'PA-8', '17801', '', '0', '', 'Panamá', '1'), ('1423', 'PA-9', '17801', '', '0', '', 'Veraguas', '1'), ('1424', 'PA-13', '17801', '', '0', '', 'Panamá Oeste', '1'), ('1425', 'AE-1', '22701', '', '0', '', 'Abu Dhabi', '1'), ('1426', 'AE-2', '22701', '', '0', '', 'Dubai', '1'), ('1427', 'AE-3', '22701', '', '0', '', 'Ajman', '1'), ('1428', 'AE-4', '22701', '', '0', '', 'Fujairah', '1'), ('1429', 'AE-5', '22701', '', '0', '', 'Ras al-Khaimah', '1'), ('1430', 'AE-6', '22701', '', '0', '', 'Sharjah', '1'), ('1431', 'AE-7', '22701', '', '0', '', 'Umm al-Quwain', '1');
COMMIT;

-- ----------------------------
--  Table structure for `llx_c_ecotaxe`
-- ----------------------------
DROP TABLE IF EXISTS `llx_c_ecotaxe`;
CREATE TABLE `llx_c_ecotaxe` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(64) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `price` double(24,8) DEFAULT NULL,
  `organization` varchar(255) DEFAULT NULL,
  `fk_pays` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_ecotaxe` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_c_ecotaxe`
-- ----------------------------
BEGIN;
INSERT INTO `llx_c_ecotaxe` VALUES ('1', '25040', 'PETIT APPAREILS MENAGERS', '0.25000000', 'Eco-systèmes', '1', '1'), ('2', '25050', 'TRES PETIT APPAREILS MENAGERS', '0.08000000', 'Eco-systèmes', '1', '1'), ('3', '32070', 'ECRAN POIDS < 5 KG', '2.08000000', 'Eco-systèmes', '1', '1'), ('4', '32080', 'ECRAN POIDS > 5 KG', '1.25000000', 'Eco-systèmes', '1', '1'), ('5', '32051', 'ORDINATEUR PORTABLE', '0.42000000', 'Eco-systèmes', '1', '1'), ('6', '32061', 'TABLETTE INFORMATIQUE', '0.84000000', 'Eco-systèmes', '1', '1'), ('7', '36011', 'ORDINATEUR FIXE (UC)', '1.15000000', 'Eco-systèmes', '1', '1'), ('8', '36021', 'IMPRIMANTES', '0.83000000', 'Eco-systèmes', '1', '1'), ('9', '36030', 'IT (INFORMATIQUE ET TELECOMS)', '0.83000000', 'Eco-systèmes', '1', '1'), ('10', '36040', 'PETIT IT (CLAVIERS / SOURIS)', '0.08000000', 'Eco-systèmes', '1', '1'), ('11', '36050', 'TELEPHONIE MOBILE', '0.02000000', 'Eco-systèmes', '1', '1'), ('12', '36060', 'CONNECTIQUE CABLES', '0.02000000', 'Eco-systèmes', '1', '1'), ('13', '45010', 'GROS MATERIEL GRAND PUBLIC (TELEAGRANDISSEURS)', '1.67000000', 'Eco-systèmes', '1', '1'), ('14', '45020', 'MOYEN MATERIEL GRAND PUBLIC (LOUPES ELECTRONIQUES)', '0.42000000', 'Eco-systèmes', '1', '1'), ('15', '45030', 'PETIT MATERIEL GRAND PUBLIC (VIE QUOTIDIENNE)', '0.08000000', 'Eco-systèmes', '1', '1'), ('16', '75030', 'JOUETS < 0,5 KG', '0.08000000', 'Eco-systèmes', '1', '1'), ('17', '75040', 'JOUETS ENTRE 0,5 KG ET 10 KG', '0.17000000', 'Eco-systèmes', '1', '1'), ('18', '74050', 'JOUETS > 10 KG', '1.67000000', 'Eco-systèmes', '1', '1'), ('19', '85010', 'EQUIPEMENT MEDICAL < 0,5 KG', '0.08000000', 'Eco-systèmes', '1', '1');
COMMIT;

-- ----------------------------
--  Table structure for `llx_c_effectif`
-- ----------------------------
DROP TABLE IF EXISTS `llx_c_effectif`;
CREATE TABLE `llx_c_effectif` (
  `id` int(11) NOT NULL,
  `code` varchar(12) NOT NULL,
  `libelle` varchar(30) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `module` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_c_effectif` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_c_effectif`
-- ----------------------------
BEGIN;
INSERT INTO `llx_c_effectif` VALUES ('0', 'EF0', '-', '1', null), ('1', 'EF1-5', '1 - 5', '1', null), ('2', 'EF6-10', '6 - 10', '1', null), ('3', 'EF11-50', '11 - 50', '1', null), ('4', 'EF51-100', '51 - 100', '1', null), ('5', 'EF100-500', '100 - 500', '1', null), ('6', 'EF500-', '> 500', '1', null);
COMMIT;

-- ----------------------------
--  Table structure for `llx_c_email_senderprofile`
-- ----------------------------
DROP TABLE IF EXISTS `llx_c_email_senderprofile`;
CREATE TABLE `llx_c_email_senderprofile` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `private` smallint(6) NOT NULL DEFAULT '0',
  `date_creation` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `label` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `signature` text,
  `position` smallint(6) DEFAULT '0',
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_email_senderprofile` (`entity`,`label`,`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_c_email_templates`
-- ----------------------------
DROP TABLE IF EXISTS `llx_c_email_templates`;
CREATE TABLE `llx_c_email_templates` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `module` varchar(32) DEFAULT NULL,
  `type_template` varchar(32) DEFAULT NULL,
  `lang` varchar(6) DEFAULT '',
  `private` smallint(6) NOT NULL DEFAULT '0',
  `fk_user` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `label` varchar(180) DEFAULT NULL,
  `position` smallint(6) DEFAULT NULL,
  `enabled` varchar(255) DEFAULT '1',
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `topic` text,
  `joinfiles` text,
  `content` mediumtext,
  `content_lines` text,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_email_templates` (`entity`,`label`,`lang`),
  KEY `idx_type` (`type_template`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_c_email_templates`
-- ----------------------------
BEGIN;
INSERT INTO `llx_c_email_templates` VALUES ('1', '0', 'banque', 'thirdparty', '', '0', null, null, '2021-04-28 08:55:25', '(YourSEPAMandate)', '1', '1', '0', '__(YourSEPAMandate)__', null, '__(Hello)__,<br><br>\n\n__(FindYourSEPAMandate)__ :<br>\n__MYCOMPANY_NAME__<br>\n__MYCOMPANY_FULLADDRESS__<br><br>\n__(Sincerely)__<br>\n__USER_SIGNATURE__', null), ('2', '0', 'adherent', 'member', '', '0', null, null, '2021-04-28 08:55:25', '(SendingEmailOnAutoSubscription)', '10', '1', '1', '[__[MAIN_INFO_SOCIETE_NOM]__] __(YourMembershipRequestWasReceived)__', '0', '__(Hello)__ __MEMBER_FULLNAME__,<br><br>\n\n__(ThisIsContentOfYourMembershipRequestWasReceived)__<br>\n<br>__ONLINE_PAYMENT_TEXT_AND_URL__<br>\n<br><br>\n__(Sincerely)__<br>__USER_SIGNATURE__', null), ('3', '0', 'adherent', 'member', '', '0', null, null, '2021-04-28 08:55:25', '(SendingEmailOnMemberValidation)', '20', '1', '1', '[__[MAIN_INFO_SOCIETE_NOM]__] __(YourMembershipWasValidated)__', '0', '__(Hello)__ __MEMBER_FULLNAME__,<br><br>\n\n__(ThisIsContentOfYourMembershipWasValidated)__<br>__INFOS__<br>\n<br>__ONLINE_PAYMENT_TEXT_AND_URL__<br>\n<br><br>\n__(Sincerely)__<br>__USER_SIGNATURE__', null), ('4', '0', 'adherent', 'member', '', '0', null, null, '2021-04-28 08:55:25', '(SendingEmailOnNewSubscription)', '30', '1', '1', '[__[MAIN_INFO_SOCIETE_NOM]__] __(YourSubscriptionWasRecorded)__', '1', '__(Hello)__ __MEMBER_FULLNAME__,<br><br>\n\n__(ThisIsContentOfYourSubscriptionWasRecorded)__<br>\n\n<br><br>\n__(Sincerely)__<br>__USER_SIGNATURE__', null), ('5', '0', 'adherent', 'member', '', '0', null, null, '2021-04-28 08:55:25', '(SendingReminderForExpiredSubscription)', '40', '1', '1', '[__[MAIN_INFO_SOCIETE_NOM]__] __(SubscriptionReminderEmail)__', '0', '__(Hello)__ __MEMBER_FULLNAME__,<br><br>\n\n__(ThisIsContentOfSubscriptionReminderEmail)__<br>\n<br>__ONLINE_PAYMENT_TEXT_AND_URL__<br>\n<br><br>\n__(Sincerely)__<br>__USER_SIGNATURE__', null), ('6', '0', 'adherent', 'member', '', '0', null, null, '2021-04-28 08:55:25', '(SendingEmailOnCancelation)', '50', '1', '1', '[__[MAIN_INFO_SOCIETE_NOM]__] __(YourMembershipWasCanceled)__', '0', '__(Hello)__ __MEMBER_FULLNAME__,<br><br>\n\n__(YourMembershipWasCanceled)__<br>\n<br><br>\n__(Sincerely)__<br>__USER_SIGNATURE__', null), ('7', '0', 'adherent', 'member', '', '0', null, null, '2021-04-28 08:55:25', '(SendingAnEMailToMember)', '60', '1', '1', '[__[MAIN_INFO_SOCIETE_NOM]__] __(CardContent)__', '0', '__(Hello)__,<br><br>\n\n__(ThisIsContentOfYourCard)__<br>\n__(ID)__ : __ID__<br>\n__(Civiliyty)__ : __MEMBER_CIVILITY__<br>\n__(Firstname)__ : __MEMBER_FIRSTNAME__<br>\n__(Lastname)__ : __MEMBER_LASTNAME__<br>\n__(Fullname)__ : __MEMBER_FULLNAME__<br>\n__(Company)__ : __MEMBER_COMPANY__<br>\n__(Address)__ : __MEMBER_ADDRESS__<br>\n__(Zip)__ : __MEMBER_ZIP__<br>\n__(Town)__ : __MEMBER_TOWN__<br>\n__(Country)__ : __MEMBER_COUNTRY__<br>\n__(Email)__ : __MEMBER_EMAIL__<br>\n__(Birthday)__ : __MEMBER_BIRTH__<br>\n__(Photo)__ : __MEMBER_PHOTO__<br>\n__(Login)__ : __MEMBER_LOGIN__<br>\n__(Password)__ : __MEMBER_PASSWORD__<br>\n__(Phone)__ : __MEMBER_PHONE__<br>\n__(PhonePerso)__ : __MEMBER_PHONEPRO__<br>\n__(PhoneMobile)__ : __MEMBER_PHONEMOBILE__<br><br>\n__(Sincerely)__<br>__USER_SIGNATURE__', null), ('15', '0', 'recruitment', 'recruitmentcandidature_send', '', '0', null, null, '2021-05-06 04:49:05', '(AnswerCandidature)', '100', '$conf->recruitment->enabled', '1', '[__[MAIN_INFO_SOCIETE_NOM]__] __(YourCandidature)__', '0', '__(Hello)__ __CANDIDATE_FULLNAME__,<br><br>\n\n__(YourCandidatureAnswer)__<br>\n<br><br>\n__(Sincerely)__<br>__USER_SIGNATURE__', null);
COMMIT;

-- ----------------------------
--  Table structure for `llx_c_exp_tax_cat`
-- ----------------------------
DROP TABLE IF EXISTS `llx_c_exp_tax_cat`;
CREATE TABLE `llx_c_exp_tax_cat` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(48) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_c_exp_tax_cat`
-- ----------------------------
BEGIN;
INSERT INTO `llx_c_exp_tax_cat` VALUES ('1', 'ExpAutoCat', '1', '0'), ('2', 'ExpCycloCat', '1', '0'), ('3', 'ExpMotoCat', '1', '0'), ('4', 'ExpAuto3CV', '1', '1'), ('5', 'ExpAuto4CV', '1', '1'), ('6', 'ExpAuto5CV', '1', '1'), ('7', 'ExpAuto6CV', '1', '1'), ('8', 'ExpAuto7CV', '1', '1'), ('9', 'ExpAuto8CV', '1', '1'), ('10', 'ExpAuto9CV', '1', '0'), ('11', 'ExpAuto10CV', '1', '0'), ('12', 'ExpAuto11CV', '1', '0'), ('13', 'ExpAuto12CV', '1', '0'), ('14', 'ExpAuto3PCV', '1', '0'), ('15', 'ExpAuto4PCV', '1', '0'), ('16', 'ExpAuto5PCV', '1', '0'), ('17', 'ExpAuto6PCV', '1', '0'), ('18', 'ExpAuto7PCV', '1', '0'), ('19', 'ExpAuto8PCV', '1', '0'), ('20', 'ExpAuto9PCV', '1', '0'), ('21', 'ExpAuto10PCV', '1', '0'), ('22', 'ExpAuto11PCV', '1', '0'), ('23', 'ExpAuto12PCV', '1', '0'), ('24', 'ExpAuto13PCV', '1', '0'), ('25', 'ExpCyclo', '1', '0'), ('26', 'ExpMoto12CV', '1', '0'), ('27', 'ExpMoto345CV', '1', '0'), ('28', 'ExpMoto5PCV', '1', '0');
COMMIT;

-- ----------------------------
--  Table structure for `llx_c_exp_tax_range`
-- ----------------------------
DROP TABLE IF EXISTS `llx_c_exp_tax_range`;
CREATE TABLE `llx_c_exp_tax_range` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_c_exp_tax_cat` int(11) NOT NULL DEFAULT '1',
  `range_ik` double NOT NULL DEFAULT '0',
  `entity` int(11) NOT NULL DEFAULT '1',
  `active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_c_exp_tax_range`
-- ----------------------------
BEGIN;
INSERT INTO `llx_c_exp_tax_range` VALUES ('1', '4', '0', '1', '1'), ('2', '4', '5000', '1', '1'), ('3', '4', '20000', '1', '1'), ('4', '5', '0', '1', '1'), ('5', '5', '5000', '1', '1'), ('6', '5', '20000', '1', '1'), ('7', '6', '0', '1', '1'), ('8', '6', '5000', '1', '1'), ('9', '6', '20000', '1', '1'), ('10', '7', '0', '1', '1'), ('11', '7', '5000', '1', '1'), ('12', '7', '20000', '1', '1'), ('13', '8', '0', '1', '1'), ('14', '8', '5000', '1', '1'), ('15', '8', '20000', '1', '1');
COMMIT;

-- ----------------------------
--  Table structure for `llx_c_field_list`
-- ----------------------------
DROP TABLE IF EXISTS `llx_c_field_list`;
CREATE TABLE `llx_c_field_list` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `element` varchar(64) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `name` varchar(32) NOT NULL,
  `alias` varchar(32) NOT NULL,
  `title` varchar(32) NOT NULL,
  `align` varchar(6) DEFAULT 'left',
  `sort` tinyint(4) NOT NULL DEFAULT '1',
  `search` tinyint(4) NOT NULL DEFAULT '0',
  `visible` tinyint(4) NOT NULL DEFAULT '1',
  `enabled` varchar(255) DEFAULT '1',
  `rang` int(11) DEFAULT '0',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_c_format_cards`
-- ----------------------------
DROP TABLE IF EXISTS `llx_c_format_cards`;
CREATE TABLE `llx_c_format_cards` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `paper_size` varchar(20) NOT NULL,
  `orientation` varchar(1) NOT NULL,
  `metric` varchar(5) NOT NULL,
  `leftmargin` double(24,8) NOT NULL,
  `topmargin` double(24,8) NOT NULL,
  `nx` int(11) NOT NULL,
  `ny` int(11) NOT NULL,
  `spacex` double(24,8) NOT NULL,
  `spacey` double(24,8) NOT NULL,
  `width` double(24,8) NOT NULL,
  `height` double(24,8) NOT NULL,
  `font_size` int(11) NOT NULL,
  `custom_x` double(24,8) NOT NULL,
  `custom_y` double(24,8) NOT NULL,
  `active` int(11) NOT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_c_format_cards`
-- ----------------------------
BEGIN;
INSERT INTO `llx_c_format_cards` VALUES ('1', '5160', 'Avery-5160, WL-875WX', 'letter', 'P', 'mm', '5.58165000', '12.70000000', '3', '10', '3.55600000', '0.00000000', '65.87490000', '25.40000000', '7', '0.00000000', '0.00000000', '1'), ('2', '5161', 'Avery-5161, WL-75WX', 'letter', 'P', 'mm', '4.44500000', '12.70000000', '2', '10', '3.96800000', '0.00000000', '101.60000000', '25.40000000', '7', '0.00000000', '0.00000000', '1'), ('3', '5162', 'Avery-5162, WL-100WX', 'letter', 'P', 'mm', '3.87350000', '22.35200000', '2', '7', '4.95400000', '0.00000000', '101.60000000', '33.78100000', '8', '0.00000000', '0.00000000', '1'), ('4', '5163', 'Avery-5163, WL-125WX', 'letter', 'P', 'mm', '4.57200000', '12.70000000', '2', '5', '3.55600000', '0.00000000', '101.60000000', '50.80000000', '10', '0.00000000', '0.00000000', '1'), ('5', '5164', '5164 (Letter)', 'letter', 'P', 'in', '0.14800000', '0.50000000', '2', '3', '0.20310000', '0.00000000', '4.00000000', '3.33000000', '12', '0.00000000', '0.00000000', '0'), ('6', '8600', 'Avery-8600', 'letter', 'P', 'mm', '7.10000000', '19.00000000', '3', '10', '9.50000000', '3.10000000', '66.60000000', '25.40000000', '7', '0.00000000', '0.00000000', '1'), ('7', '99012', 'DYMO 99012 89*36mm', 'custom', 'L', 'mm', '1.00000000', '1.00000000', '1', '1', '0.00000000', '0.00000000', '36.00000000', '89.00000000', '10', '36.00000000', '89.00000000', '1'), ('8', '99014', 'DYMO 99014 101*54mm', 'custom', 'L', 'mm', '1.00000000', '1.00000000', '1', '1', '0.00000000', '0.00000000', '54.00000000', '101.00000000', '10', '54.00000000', '101.00000000', '1'), ('9', 'AVERYC32010', 'Avery-C32010', 'A4', 'P', 'mm', '15.00000000', '13.00000000', '2', '5', '10.00000000', '0.00000000', '85.00000000', '54.00000000', '10', '0.00000000', '0.00000000', '1'), ('10', 'CARD', 'Dolibarr Business cards', 'A4', 'P', 'mm', '15.00000000', '15.00000000', '2', '5', '0.00000000', '0.00000000', '85.00000000', '54.00000000', '10', '0.00000000', '0.00000000', '1'), ('11', 'L7163', 'Avery-L7163', 'A4', 'P', 'mm', '5.00000000', '15.00000000', '2', '7', '2.50000000', '0.00000000', '99.10000000', '38.10000000', '8', '0.00000000', '0.00000000', '1');
COMMIT;

-- ----------------------------
--  Table structure for `llx_c_forme_juridique`
-- ----------------------------
DROP TABLE IF EXISTS `llx_c_forme_juridique`;
CREATE TABLE `llx_c_forme_juridique` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(11) NOT NULL,
  `fk_pays` int(11) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `isvatexempted` tinyint(4) NOT NULL DEFAULT '0',
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `module` varchar(32) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_forme_juridique` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=484 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_c_forme_juridique`
-- ----------------------------
BEGIN;
INSERT INTO `llx_c_forme_juridique` VALUES ('238', '0', '0', '-', '0', '1', null, '0'), ('239', '2301', '23', 'Monotributista', '0', '1', null, '0'), ('240', '2302', '23', 'Sociedad Civil', '0', '1', null, '0'), ('241', '2303', '23', 'Sociedades Comerciales', '0', '1', null, '0'), ('242', '2304', '23', 'Sociedades de Hecho', '0', '1', null, '0'), ('243', '2305', '23', 'Sociedades Irregulares', '0', '1', null, '0'), ('244', '2306', '23', 'Sociedad Colectiva', '0', '1', null, '0'), ('245', '2307', '23', 'Sociedad en Comandita Simple', '0', '1', null, '0'), ('246', '2308', '23', 'Sociedad de Capital e Industria', '0', '1', null, '0'), ('247', '2309', '23', 'Sociedad Accidental o en participación', '0', '1', null, '0'), ('248', '2310', '23', 'Sociedad de Responsabilidad Limitada', '0', '1', null, '0'), ('249', '2311', '23', 'Sociedad Anónima', '0', '1', null, '0'), ('250', '2312', '23', 'Sociedad Anónima con Participación Estatal Mayoritaria', '0', '1', null, '0'), ('251', '2313', '23', 'Sociedad en Comandita por Acciones (arts. 315 a 324, LSC)', '0', '1', null, '0'), ('252', '4100', '41', 'GmbH - Gesellschaft mit beschränkter Haftung', '0', '1', null, '0'), ('253', '4101', '41', 'GesmbH - Gesellschaft mit beschränkter Haftung', '0', '1', null, '0'), ('254', '4102', '41', 'AG - Aktiengesellschaft', '0', '1', null, '0'), ('255', '4103', '41', 'EWIV - Europäische wirtschaftliche Interessenvereinigung', '0', '1', null, '0'), ('256', '4104', '41', 'KEG - Kommanditerwerbsgesellschaft', '0', '1', null, '0'), ('257', '4105', '41', 'OEG - Offene Erwerbsgesellschaft', '0', '1', null, '0'), ('258', '4106', '41', 'OHG - Offene Handelsgesellschaft', '0', '1', null, '0'), ('259', '4107', '41', 'AG & Co KG - Kommanditgesellschaft', '0', '1', null, '0'), ('260', '4108', '41', 'GmbH & Co KG - Kommanditgesellschaft', '0', '1', null, '0'), ('261', '4109', '41', 'KG - Kommanditgesellschaft', '0', '1', null, '0'), ('262', '4110', '41', 'OG - Offene Gesellschaft', '0', '1', null, '0'), ('263', '4111', '41', 'GbR - Gesellschaft nach bürgerlichem Recht', '0', '1', null, '0'), ('264', '4112', '41', 'GesbR - Gesellschaft nach bürgerlichem Recht', '0', '1', null, '0'), ('265', '4113', '41', 'GesnbR - Gesellschaft nach bürgerlichem Recht', '0', '1', null, '0'), ('266', '4114', '41', 'e.U. - eingetragener Einzelunternehmer', '0', '1', null, '0'), ('267', '11', '1', 'Artisan Commerçant (EI)', '0', '1', null, '0'), ('268', '12', '1', 'Commerçant (EI)', '0', '1', null, '0'), ('269', '13', '1', 'Artisan (EI)', '0', '1', null, '0'), ('270', '14', '1', 'Officier public ou ministériel', '0', '1', null, '0'), ('271', '15', '1', 'Profession libérale (EI)', '0', '1', null, '0'), ('272', '16', '1', 'Exploitant agricole', '0', '1', null, '0'), ('273', '17', '1', 'Agent commercial', '0', '1', null, '0'), ('274', '18', '1', 'Associé Gérant de société', '0', '1', null, '0'), ('275', '19', '1', 'Personne physique', '0', '1', null, '0'), ('276', '21', '1', 'Indivision', '0', '1', null, '0'), ('277', '22', '1', 'Société créée de fait', '0', '1', null, '0'), ('278', '23', '1', 'Société en participation', '0', '1', null, '0'), ('279', '27', '1', 'Paroisse hors zone concordataire', '0', '1', null, '0'), ('280', '29', '1', 'Groupement de droit privé non doté de la personnalité morale', '0', '1', null, '0'), ('281', '31', '1', 'Personne morale de droit étranger, immatriculée au RCS', '0', '1', null, '0'), ('282', '32', '1', 'Personne morale de droit étranger, non immatriculée au RCS', '0', '1', null, '0'), ('283', '35', '1', 'Régime auto-entrepreneur', '0', '1', null, '0'), ('284', '41', '1', 'Etablissement public ou régie à caractère industriel ou commercial', '0', '1', null, '0'), ('285', '51', '1', 'Société coopérative commerciale particulière', '0', '1', null, '0'), ('286', '52', '1', 'Société en nom collectif', '0', '1', null, '0'), ('287', '53', '1', 'Société en commandite', '0', '1', null, '0'), ('288', '54', '1', 'Société à responsabilité limitée (SARL)', '0', '1', null, '0'), ('289', '55', '1', 'Société anonyme à conseil d administration', '0', '1', null, '0'), ('290', '56', '1', 'Société anonyme à directoire', '0', '1', null, '0'), ('291', '57', '1', 'Société par actions simplifiée (SAS)', '0', '1', null, '0'), ('292', '58', '1', 'Entreprise Unipersonnelle à Responsabilité Limitée (EURL)', '0', '1', null, '0'), ('293', '59', '1', 'Société par actions simplifiée unipersonnelle (SASU)', '0', '1', null, '0'), ('294', '60', '1', 'Entreprise Individuelle à Responsabilité Limitée (EIRL)', '0', '1', null, '0'), ('295', '61', '1', 'Caisse d\'épargne et de prévoyance', '0', '1', null, '0'), ('296', '62', '1', 'Groupement d\'intérêt économique (GIE)', '0', '1', null, '0'), ('297', '63', '1', 'Société coopérative agricole', '0', '1', null, '0'), ('298', '64', '1', 'Société non commerciale d assurances', '0', '1', null, '0'), ('299', '65', '1', 'Société civile', '0', '1', null, '0'), ('300', '69', '1', 'Personnes de droit privé inscrites au RCS', '0', '1', null, '0'), ('301', '71', '1', 'Administration de l état', '0', '1', null, '0'), ('302', '72', '1', 'Collectivité territoriale', '0', '1', null, '0'), ('303', '73', '1', 'Etablissement public administratif', '0', '1', null, '0'), ('304', '74', '1', 'Personne morale de droit public administratif', '0', '1', null, '0'), ('305', '81', '1', 'Organisme gérant régime de protection social à adhésion obligatoire', '0', '1', null, '0'), ('306', '82', '1', 'Organisme mutualiste', '0', '1', null, '0'), ('307', '83', '1', 'Comité d entreprise', '0', '1', null, '0'), ('308', '84', '1', 'Organisme professionnel', '0', '1', null, '0'), ('309', '85', '1', 'Organisme de retraite à adhésion non obligatoire', '0', '1', null, '0'), ('310', '91', '1', 'Syndicat de propriétaires', '0', '1', null, '0'), ('311', '92', '1', 'Association loi 1901 ou assimilé', '0', '1', null, '0'), ('312', '93', '1', 'Fondation', '0', '1', null, '0'), ('313', '99', '1', 'Personne morale de droit privé', '0', '1', null, '0'), ('314', '200', '2', 'Indépendant', '0', '1', null, '0'), ('315', '201', '2', 'SRL - Société à responsabilité limitée', '0', '1', null, '0'), ('316', '202', '2', 'SA   - Société Anonyme', '0', '1', null, '0'), ('317', '203', '2', 'SCRL - Société coopérative à responsabilité limitée', '0', '1', null, '0'), ('318', '204', '2', 'ASBL - Association sans but Lucratif', '0', '1', null, '0'), ('319', '205', '2', 'SCRI - Société coopérative à responsabilité illimitée', '0', '1', null, '0'), ('320', '206', '2', 'SCS  - Société en commandite simple', '0', '1', null, '0'), ('321', '207', '2', 'SCA  - Société en commandite par action', '0', '1', null, '0'), ('322', '208', '2', 'SNC  - Société en nom collectif', '0', '1', null, '0'), ('323', '209', '2', 'GIE  - Groupement d intérêt économique', '0', '1', null, '0'), ('324', '210', '2', 'GEIE - Groupement européen d intérêt économique', '0', '1', null, '0'), ('325', '220', '2', 'Eenmanszaak', '0', '1', null, '0'), ('326', '221', '2', 'BVBA - Besloten vennootschap met beperkte aansprakelijkheid', '0', '1', null, '0'), ('327', '222', '2', 'NV   - Naamloze Vennootschap', '0', '1', null, '0'), ('328', '223', '2', 'CVBA - Coöperatieve vennootschap met beperkte aansprakelijkheid', '0', '1', null, '0'), ('329', '224', '2', 'VZW  - Vereniging zonder winstoogmerk', '0', '1', null, '0'), ('330', '225', '2', 'CVOA - Coöperatieve vennootschap met onbeperkte aansprakelijkheid ', '0', '1', null, '0'), ('331', '226', '2', 'GCV  - Gewone commanditaire vennootschap', '0', '1', null, '0'), ('332', '227', '2', 'Comm.VA - Commanditaire vennootschap op aandelen', '0', '1', null, '0'), ('333', '228', '2', 'VOF  - Vennootschap onder firma', '0', '1', null, '0'), ('334', '229', '2', 'VS0  - Vennootschap met sociaal oogmerk', '0', '1', null, '0'), ('335', '500', '5', 'GmbH - Gesellschaft mit beschränkter Haftung', '0', '1', null, '0'), ('336', '501', '5', 'AG - Aktiengesellschaft ', '0', '1', null, '0'), ('337', '502', '5', 'GmbH&Co. KG - Gesellschaft mit beschränkter Haftung & Compagnie Kommanditgesellschaft', '0', '1', null, '0'), ('338', '503', '5', 'Gewerbe - Personengesellschaft', '0', '1', null, '0'), ('339', '504', '5', 'UG - Unternehmergesellschaft -haftungsbeschränkt-', '0', '1', null, '0'), ('340', '505', '5', 'GbR - Gesellschaft des bürgerlichen Rechts', '0', '1', null, '0'), ('341', '506', '5', 'KG - Kommanditgesellschaft', '0', '1', null, '0'), ('342', '507', '5', 'Ltd. - Limited Company', '0', '1', null, '0'), ('343', '508', '5', 'OHG - Offene Handelsgesellschaft', '0', '1', null, '0'), ('344', '10201', '102', 'Ατομική επιχείρηση', '0', '1', null, '0'), ('345', '10202', '102', 'Εταιρική  επιχείρηση', '0', '1', null, '0'), ('346', '10203', '102', 'Ομόρρυθμη Εταιρεία Ο.Ε', '0', '1', null, '0'), ('347', '10204', '102', 'Ετερόρρυθμη Εταιρεία Ε.Ε', '0', '1', null, '0'), ('348', '10205', '102', 'Εταιρεία Περιορισμένης Ευθύνης Ε.Π.Ε', '0', '1', null, '0'), ('349', '10206', '102', 'Ανώνυμη Εταιρεία Α.Ε', '0', '1', null, '0'), ('350', '10207', '102', 'Ανώνυμη ναυτιλιακή εταιρεία Α.Ν.Ε', '0', '1', null, '0'), ('351', '10208', '102', 'Συνεταιρισμός', '0', '1', null, '0'), ('352', '10209', '102', 'Συμπλοιοκτησία', '0', '1', null, '0'), ('353', '301', '3', 'Società semplice', '0', '1', null, '0'), ('354', '302', '3', 'Società in nome collettivo s.n.c.', '0', '1', null, '0'), ('355', '303', '3', 'Società in accomandita semplice s.a.s.', '0', '1', null, '0'), ('356', '304', '3', 'Società per azioni s.p.a.', '0', '1', null, '0'), ('357', '305', '3', 'Società a responsabilità limitata s.r.l.', '0', '1', null, '0'), ('358', '306', '3', 'Società in accomandita per azioni s.a.p.a.', '0', '1', null, '0'), ('359', '307', '3', 'Società cooperativa a r.l.', '0', '1', null, '0'), ('360', '308', '3', 'Società consortile', '0', '1', null, '0'), ('361', '309', '3', 'Società europea', '0', '1', null, '0'), ('362', '310', '3', 'Società cooperativa europea', '0', '1', null, '0'), ('363', '311', '3', 'Società unipersonale', '0', '1', null, '0'), ('364', '312', '3', 'Società di professionisti', '0', '1', null, '0'), ('365', '313', '3', 'Società di fatto', '0', '1', null, '0'), ('366', '315', '3', 'Società apparente', '0', '1', null, '0'), ('367', '316', '3', 'Impresa individuale ', '0', '1', null, '0'), ('368', '317', '3', 'Impresa coniugale', '0', '1', null, '0'), ('369', '318', '3', 'Impresa familiare', '0', '1', null, '0'), ('370', '319', '3', 'Consorzio cooperativo', '0', '1', null, '0'), ('371', '320', '3', 'Società cooperativa sociale', '0', '1', null, '0'), ('372', '321', '3', 'Società cooperativa di consumo', '0', '1', null, '0'), ('373', '322', '3', 'Società cooperativa agricola', '0', '1', null, '0'), ('374', '323', '3', 'A.T.I. Associazione temporanea di imprese', '0', '1', null, '0'), ('375', '324', '3', 'R.T.I. Raggruppamento temporaneo di imprese', '0', '1', null, '0'), ('376', '325', '3', 'Studio associato', '0', '1', null, '0'), ('377', '600', '6', 'Raison Individuelle', '0', '1', null, '0'), ('378', '601', '6', 'Société Simple', '0', '1', null, '0'), ('379', '602', '6', 'Société en nom collectif', '0', '1', null, '0'), ('380', '603', '6', 'Société en commandite', '0', '1', null, '0'), ('381', '604', '6', 'Société anonyme (SA)', '0', '1', null, '0'), ('382', '605', '6', 'Société en commandite par actions', '0', '1', null, '0'), ('383', '606', '6', 'Société à responsabilité limitée (SARL)', '0', '1', null, '0'), ('384', '607', '6', 'Société coopérative', '0', '1', null, '0'), ('385', '608', '6', 'Association', '0', '1', null, '0'), ('386', '609', '6', 'Fondation', '0', '1', null, '0'), ('387', '700', '7', 'Sole Trader', '0', '1', null, '0'), ('388', '701', '7', 'Partnership', '0', '1', null, '0'), ('389', '702', '7', 'Private Limited Company by shares (LTD)', '0', '1', null, '0'), ('390', '703', '7', 'Public Limited Company', '0', '1', null, '0'), ('391', '704', '7', 'Workers Cooperative', '0', '1', null, '0'), ('392', '705', '7', 'Limited Liability Partnership', '0', '1', null, '0'), ('393', '706', '7', 'Franchise', '0', '1', null, '0'), ('394', '1000', '10', 'Société à responsabilité limitée (SARL)', '0', '1', null, '0'), ('395', '1001', '10', 'Société en Nom Collectif (SNC)', '0', '1', null, '0'), ('396', '1002', '10', 'Société en Commandite Simple (SCS)', '0', '1', null, '0'), ('397', '1003', '10', 'société en participation', '0', '1', null, '0'), ('398', '1004', '10', 'Société Anonyme (SA)', '0', '1', null, '0'), ('399', '1005', '10', 'Société Unipersonnelle à Responsabilité Limitée (SUARL)', '0', '1', null, '0'), ('400', '1006', '10', 'Groupement d\'intérêt économique (GEI)', '0', '1', null, '0'), ('401', '1007', '10', 'Groupe de sociétés', '0', '1', null, '0'), ('402', '1701', '17', 'Eenmanszaak', '0', '1', null, '0'), ('403', '1702', '17', 'Maatschap', '0', '1', null, '0'), ('404', '1703', '17', 'Vennootschap onder firma', '0', '1', null, '0'), ('405', '1704', '17', 'Commanditaire vennootschap', '0', '1', null, '0'), ('406', '1705', '17', 'Besloten vennootschap (BV)', '0', '1', null, '0'), ('407', '1706', '17', 'Naamloze Vennootschap (NV)', '0', '1', null, '0'), ('408', '1707', '17', 'Vereniging', '0', '1', null, '0'), ('409', '1708', '17', 'Stichting', '0', '1', null, '0'), ('410', '1709', '17', 'Coöperatie met beperkte aansprakelijkheid (BA)', '0', '1', null, '0'), ('411', '1710', '17', 'Coöperatie met uitgesloten aansprakelijkheid (UA)', '0', '1', null, '0'), ('412', '1711', '17', 'Coöperatie met wettelijke aansprakelijkheid (WA)', '0', '1', null, '0'), ('413', '1712', '17', 'Onderlinge waarborgmaatschappij', '0', '1', null, '0'), ('414', '401', '4', 'Empresario Individual', '0', '1', null, '0'), ('415', '402', '4', 'Comunidad de Bienes', '0', '1', null, '0'), ('416', '403', '4', 'Sociedad Civil', '0', '1', null, '0'), ('417', '404', '4', 'Sociedad Colectiva', '0', '1', null, '0'), ('418', '405', '4', 'Sociedad Limitada', '0', '1', null, '0'), ('419', '406', '4', 'Sociedad Anónima', '0', '1', null, '0'), ('420', '407', '4', 'Sociedad Comanditaria por Acciones', '0', '1', null, '0'), ('421', '408', '4', 'Sociedad Comanditaria Simple', '0', '1', null, '0'), ('422', '409', '4', 'Sociedad Laboral', '0', '1', null, '0'), ('423', '410', '4', 'Sociedad Cooperativa', '0', '1', null, '0'), ('424', '411', '4', 'Sociedad de Garantía Recíproca', '0', '1', null, '0'), ('425', '412', '4', 'Entidad de Capital-Riesgo', '0', '1', null, '0'), ('426', '413', '4', 'Agrupación de Interés Económico', '0', '1', null, '0'), ('427', '414', '4', 'Sociedad de Inversión Mobiliaria', '0', '1', null, '0'), ('428', '415', '4', 'Agrupación sin Ánimo de Lucro', '0', '1', null, '0'), ('429', '15201', '152', 'Mauritius Private Company Limited By Shares', '0', '1', null, '0'), ('430', '15202', '152', 'Mauritius Company Limited By Guarantee', '0', '1', null, '0'), ('431', '15203', '152', 'Mauritius Public Company Limited By Shares', '0', '1', null, '0'), ('432', '15204', '152', 'Mauritius Foreign Company', '0', '1', null, '0'), ('433', '15205', '152', 'Mauritius GBC1 (Offshore Company)', '0', '1', null, '0'), ('434', '15206', '152', 'Mauritius GBC2 (International Company)', '0', '1', null, '0'), ('435', '15207', '152', 'Mauritius General Partnership', '0', '1', null, '0'), ('436', '15208', '152', 'Mauritius Limited Partnership', '0', '1', null, '0'), ('437', '15209', '152', 'Mauritius Sole Proprietorship', '0', '1', null, '0'), ('438', '15210', '152', 'Mauritius Trusts', '0', '1', null, '0'), ('439', '15401', '154', 'Sociedad en nombre colectivo', '0', '1', null, '0'), ('440', '15402', '154', 'Sociedad en comandita simple', '0', '1', null, '0'), ('441', '15403', '154', 'Sociedad de responsabilidad limitada', '0', '1', null, '0'), ('442', '15404', '154', 'Sociedad anónima', '0', '1', null, '0'), ('443', '15405', '154', 'Sociedad en comandita por acciones', '0', '1', null, '0'), ('444', '15406', '154', 'Sociedad cooperativa', '0', '1', null, '0'), ('445', '14001', '140', 'Entreprise individuelle', '0', '1', null, '0'), ('446', '14002', '140', 'Société en nom collectif (SENC)', '0', '1', null, '0'), ('447', '14003', '140', 'Société en commandite simple (SECS)', '0', '1', null, '0'), ('448', '14004', '140', 'Société en commandite par actions (SECA)', '0', '1', null, '0'), ('449', '14005', '140', 'Société à responsabilité limitée (SARL)', '0', '1', null, '0'), ('450', '14006', '140', 'Société anonyme (SA)', '0', '1', null, '0'), ('451', '14007', '140', 'Société coopérative (SC)', '0', '1', null, '0'), ('452', '14008', '140', 'Société européenne (SE)', '0', '1', null, '0'), ('453', '18801', '188', 'AFJ - Alte forme juridice', '0', '1', null, '0'), ('454', '18802', '188', 'ASF - Asociatie familialã', '0', '1', null, '0'), ('455', '18803', '188', 'CON - Concesiune', '0', '1', null, '0'), ('456', '18804', '188', 'CRL - Soc civilã profesionala cu pers. juridica si rãspundere limitata (SPRL)', '0', '1', null, '0'), ('457', '18805', '188', 'INC - Închiriere', '0', '1', null, '0'), ('458', '18806', '188', 'LOC - Locaţie de gestiune', '0', '1', null, '0'), ('459', '18807', '188', 'OC1 - Organizaţie cooperatistã meşteşugãreascã', '0', '1', null, '0'), ('460', '18808', '188', 'OC2 - Organizaţie cooperatistã de consum', '0', '1', null, '0'), ('461', '18809', '188', 'OC3 - Organizaţie cooperatistã de credit', '0', '1', null, '0'), ('462', '18810', '188', 'PFA - Persoanã fizicã independentã', '0', '1', null, '0'), ('463', '18811', '188', 'RA - Regie autonomã', '0', '1', null, '0'), ('464', '18812', '188', 'SA - Societate comercialã pe acţiuni', '0', '1', null, '0'), ('465', '18813', '188', 'SCS - Societate comercialã în comanditã simplã', '0', '1', null, '0'), ('466', '18814', '188', 'SNC - Societate comercialã în nume colectiv', '0', '1', null, '0'), ('467', '18815', '188', 'SPI - Societate profesionala practicieni in insolventa (SPPI)', '0', '1', null, '0'), ('468', '18816', '188', 'SRL - Societate comercialã cu rãspundere limitatã', '0', '1', null, '0'), ('469', '18817', '188', 'URL - Intreprindere profesionala unipersonala cu rãspundere limitata (IPURL)', '0', '1', null, '0'), ('470', '17801', '178', 'Empresa individual', '0', '1', null, '0'), ('471', '17802', '178', 'Asociación General', '0', '1', null, '0'), ('472', '17803', '178', 'Sociedad de Responsabilidad Limitada', '0', '1', null, '0'), ('473', '17804', '178', 'Sociedad Civil', '0', '1', null, '0'), ('474', '17805', '178', 'Sociedad Anónima', '0', '1', null, '0'), ('475', '8001', '80', 'Aktieselvskab A/S', '0', '1', null, '0'), ('476', '8002', '80', 'Anparts Selvskab ApS', '0', '1', null, '0'), ('477', '8003', '80', 'Personlig ejet selvskab', '0', '1', null, '0'), ('478', '8004', '80', 'Iværksætterselvskab IVS', '0', '1', null, '0'), ('479', '8005', '80', 'Interessentskab I/S', '0', '1', null, '0'), ('480', '8006', '80', 'Holdingselskab', '0', '1', null, '0'), ('481', '8007', '80', 'Selskab Med Begrænset Hæftelse SMBA', '0', '1', null, '0'), ('482', '8008', '80', 'Kommanditselskab K/S', '0', '1', null, '0'), ('483', '8009', '80', 'SPE-selskab', '0', '1', null, '0');
COMMIT;

-- ----------------------------
--  Table structure for `llx_c_holiday_types`
-- ----------------------------
DROP TABLE IF EXISTS `llx_c_holiday_types`;
CREATE TABLE `llx_c_holiday_types` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(16) NOT NULL,
  `label` varchar(255) NOT NULL,
  `affect` int(11) NOT NULL,
  `delay` int(11) NOT NULL,
  `newByMonth` double(8,5) NOT NULL DEFAULT '0.00000',
  `fk_country` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_holiday_types` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_c_holiday_types`
-- ----------------------------
BEGIN;
INSERT INTO `llx_c_holiday_types` VALUES ('1', 'LEAVE_SICK', 'Sick leave', '0', '0', '0.00000', null, '1'), ('2', 'LEAVE_OTHER', 'Other leave', '0', '0', '0.00000', null, '1'), ('3', 'LEAVE_PAID', 'Paid vacation', '1', '7', '0.00000', null, '0'), ('4', 'LEAVE_RTT_FR', 'RTT', '1', '7', '0.83000', '1', '1'), ('5', 'LEAVE_PAID_FR', 'Paid vacation', '1', '30', '2.08334', '1', '1');
COMMIT;

-- ----------------------------
--  Table structure for `llx_c_hrm_department`
-- ----------------------------
DROP TABLE IF EXISTS `llx_c_hrm_department`;
CREATE TABLE `llx_c_hrm_department` (
  `rowid` int(11) NOT NULL,
  `pos` tinyint(4) NOT NULL DEFAULT '0',
  `code` varchar(16) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_c_hrm_department`
-- ----------------------------
BEGIN;
INSERT INTO `llx_c_hrm_department` VALUES ('1', '5', 'MANAGEMENT', 'Management', '1'), ('3', '15', 'TRAINING', 'Training', '1'), ('4', '20', 'IT', 'Inform. Technology (IT)', '0'), ('5', '25', 'MARKETING', 'Marketing', '0'), ('6', '30', 'SALES', 'Sales', '1'), ('7', '35', 'LEGAL', 'Legal', '0'), ('8', '40', 'FINANCIAL', 'Financial accounting', '1'), ('9', '45', 'HUMANRES', 'Human resources', '1'), ('10', '50', 'PURCHASING', 'Purchasing', '1'), ('12', '60', 'CUSTOMSERV', 'Customer service', '0'), ('14', '70', 'LOGISTIC', 'Logistics', '1'), ('15', '75', 'CONSTRUCT', 'Engineering/design', '0'), ('16', '80', 'PRODUCTION', 'Production', '1'), ('17', '85', 'QUALITY', 'Quality assurance', '0');
COMMIT;

-- ----------------------------
--  Table structure for `llx_c_hrm_function`
-- ----------------------------
DROP TABLE IF EXISTS `llx_c_hrm_function`;
CREATE TABLE `llx_c_hrm_function` (
  `rowid` int(11) NOT NULL,
  `pos` tinyint(4) NOT NULL DEFAULT '0',
  `code` varchar(16) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `c_level` tinyint(4) NOT NULL DEFAULT '0',
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_c_hrm_function`
-- ----------------------------
BEGIN;
INSERT INTO `llx_c_hrm_function` VALUES ('1', '5', 'EXECBOARD', 'Executive board', '0', '1'), ('2', '10', 'MANAGDIR', 'Managing director', '1', '1'), ('3', '15', 'ACCOUNTMANAG', 'Account manager', '0', '1'), ('4', '20', 'ENGAGDIR', 'Engagement director', '1', '1'), ('5', '25', 'DIRECTOR', 'Director', '1', '1'), ('6', '30', 'PROJMANAG', 'Project manager', '0', '1'), ('7', '35', 'DEPHEAD', 'Department head', '0', '1'), ('8', '40', 'SECRETAR', 'Secretary', '0', '1'), ('9', '45', 'EMPLOYEE', 'Department employee', '0', '1');
COMMIT;

-- ----------------------------
--  Table structure for `llx_c_hrm_public_holiday`
-- ----------------------------
DROP TABLE IF EXISTS `llx_c_hrm_public_holiday`;
CREATE TABLE `llx_c_hrm_public_holiday` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '0',
  `fk_country` int(11) DEFAULT NULL,
  `code` varchar(62) DEFAULT NULL,
  `dayrule` varchar(64) DEFAULT '',
  `day` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT '1',
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_c_hrm_public_holiday` (`entity`,`code`),
  UNIQUE KEY `uk_c_hrm_public_holiday2` (`entity`,`fk_country`,`dayrule`,`day`,`month`,`year`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_c_hrm_public_holiday`
-- ----------------------------
BEGIN;
INSERT INTO `llx_c_hrm_public_holiday` VALUES ('1', '0', '0', 'NEWYEARDAY1', '', '1', '1', '0', '1', null), ('2', '0', '0', 'LABORDAY1', '', '1', '5', '0', '1', null), ('3', '0', '0', 'ASSOMPTIONDAY1', '', '15', '8', '0', '1', null), ('4', '0', '0', 'CHRISTMASDAY1', '', '25', '12', '0', '1', null), ('5', '0', '1', 'FR-VICTORYDAY', '', '8', '5', '0', '1', null), ('6', '0', '1', 'FR-NATIONALDAY', '', '14', '7', '0', '1', null), ('7', '0', '1', 'FR-ASSOMPTION', '', '15', '8', '0', '1', null), ('8', '0', '1', 'FR-TOUSSAINT', '', '1', '11', '0', '1', null), ('9', '0', '1', 'FR-ARMISTICE', '', '11', '11', '0', '1', null), ('10', '0', '1', 'FR-EASTER', 'eastermonday', '0', '0', '0', '1', null), ('11', '0', '1', 'FR-ASCENSION', 'ascension', '0', '0', '0', '1', null), ('12', '0', '1', 'FR-PENTECOST', 'pentecost', '0', '0', '0', '1', null), ('13', '0', '3', 'IT-LIBEAZIONE', '', '25', '4', '0', '1', null), ('14', '0', '3', 'IT-EPIPHANY', '', '1', '6', '0', '1', null), ('15', '0', '3', 'IT-REPUBBLICA', '', '2', '6', '0', '1', null), ('16', '0', '3', 'IT-TUTTISANTIT', '', '1', '11', '0', '1', null), ('17', '0', '3', 'IT-IMMACULE', '', '8', '12', '0', '1', null), ('18', '0', '3', 'IT-SAINTSTEFAN', '', '26', '12', '0', '1', null), ('19', '0', '4', 'ES-EASTER', 'easter', '0', '0', '0', '1', null), ('20', '0', '4', 'ES-REYE', '', '1', '6', '0', '1', null), ('21', '0', '4', 'ES-HISPANIDAD', '', '12', '10', '0', '1', null), ('22', '0', '4', 'ES-TOUSSAINT', '', '1', '11', '0', '1', null), ('23', '0', '4', 'ES-CONSTITUIZION', '', '6', '12', '0', '1', null), ('24', '0', '4', 'ES-IMMACULE', '', '8', '12', '0', '1', null), ('25', '0', '41', 'AT-EASTER', 'eastermonday', '0', '0', '0', '1', null), ('26', '0', '41', 'AT-ASCENSION', 'ascension', '0', '0', '0', '1', null), ('27', '0', '41', 'AT-PENTECOST', 'pentecost', '0', '0', '0', '1', null), ('28', '0', '41', 'AT-FRONLEICHNAM', 'fronleichnam', '0', '0', '0', '1', null), ('29', '0', '41', 'AT-KONEGIE', '', '1', '6', '0', '1', null), ('30', '0', '41', 'AT-26OKT', '', '26', '10', '0', '1', null), ('31', '0', '41', 'AT-TOUSSAINT', '', '1', '11', '0', '1', null), ('32', '0', '41', 'AT-IMMACULE', '', '8', '12', '0', '1', null), ('33', '0', '41', 'AT-24DEC', '', '24', '12', '0', '1', null), ('34', '0', '41', 'AT-SAINTSTEFAN', '', '26', '12', '0', '1', null), ('35', '0', '41', 'AT-Silvester', '', '31', '12', '0', '1', null), ('36', '0', '117', 'IN-REPUBLICDAY', '', '26', '1', '0', '1', null), ('37', '0', '117', 'IN-GANDI', '', '2', '10', '0', '1', null);
COMMIT;

-- ----------------------------
--  Table structure for `llx_c_incoterms`
-- ----------------------------
DROP TABLE IF EXISTS `llx_c_incoterms`;
CREATE TABLE `llx_c_incoterms` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(3) NOT NULL,
  `libelle` varchar(255) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `label` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_incoterms` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_c_incoterms`
-- ----------------------------
BEGIN;
INSERT INTO `llx_c_incoterms` VALUES ('1', 'EXW', 'Ex Works, au départ non chargé, non dédouané sortie d\'usine (uniquement adapté aux flux domestiques, nationaux)', '1', null), ('2', 'FCA', 'Free Carrier, marchandises dédouanées et chargées dans le pays de départ, chez le vendeur ou chez le commissionnaire de transport de l\'acheteur', '1', null), ('3', 'FAS', 'Free Alongside Ship, sur le quai du port de départ', '1', null), ('4', 'FOB', 'Free On Board, chargé sur le bateau, les frais de chargement dans celui-ci étant fonction du liner term indiqué par la compagnie maritime (à la charge du vendeur)', '1', null), ('5', 'CFR', 'Cost and Freight, chargé dans le bateau, livraison au port de départ, frais payés jusqu\'au port d\'arrivée, sans assurance pour le transport, non déchargé du navire à destination (les frais de déchargement sont inclus ou non au port d\'arrivée)', '1', null), ('6', 'CIF', 'Cost, Insurance and Freight, chargé sur le bateau, frais jusqu\'au port d\'arrivée, avec l\'assurance marchandise transportée souscrite par le vendeur pour le compte de l\'acheteur', '1', null), ('7', 'CPT', 'Carriage Paid To, livraison au premier transporteur, frais jusqu\'au déchargement du mode de transport, sans assurance pour le transport', '1', null), ('8', 'CIP', 'Carriage and Insurance Paid to, idem CPT, avec assurance marchandise transportée souscrite par le vendeur pour le compte de l\'acheteur', '1', null), ('9', 'DAT', 'Delivered At Terminal, marchandises (déchargées) livrées sur quai, dans un terminal maritime, fluvial, aérien, routier ou ferroviaire désigné (dédouanement import, et post-acheminement payés par l\'acheteur)', '1', null), ('10', 'DAP', 'Delivered At Place, marchandises (non déchargées) mises à disposition de l\'acheteur dans le pays d\'importation au lieu précisé dans le contrat (déchargement, dédouanement import payé par l\'acheteur)', '1', null), ('11', 'DDP', 'Delivered Duty Paid, marchandises (non déchargées) livrées à destination finale, dédouanement import et taxes à la charge du vendeur ; l\'acheteur prend en charge uniquement le déchargement (si exclusion des taxes type TVA, le préciser clairement)', '1', null);
COMMIT;

-- ----------------------------
--  Table structure for `llx_c_input_method`
-- ----------------------------
DROP TABLE IF EXISTS `llx_c_input_method`;
CREATE TABLE `llx_c_input_method` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) DEFAULT NULL,
  `libelle` varchar(60) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `module` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_input_method` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_c_input_method`
-- ----------------------------
BEGIN;
INSERT INTO `llx_c_input_method` VALUES ('1', 'OrderByMail', 'Courrier', '1', null), ('2', 'OrderByFax', 'Fax', '1', null), ('3', 'OrderByEMail', 'EMail', '1', null), ('4', 'OrderByPhone', 'Téléphone', '1', null), ('5', 'OrderByWWW', 'En ligne', '1', null);
COMMIT;

-- ----------------------------
--  Table structure for `llx_c_input_reason`
-- ----------------------------
DROP TABLE IF EXISTS `llx_c_input_reason`;
CREATE TABLE `llx_c_input_reason` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(30) DEFAULT NULL,
  `label` varchar(60) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `module` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_input_reason` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_c_input_reason`
-- ----------------------------
BEGIN;
INSERT INTO `llx_c_input_reason` VALUES ('1', 'SRC_INTE', 'Web site', '1', null), ('2', 'SRC_CAMP_MAIL', 'Mailing campaign', '1', null), ('3', 'SRC_CAMP_PHO', 'Phone campaign', '1', null), ('4', 'SRC_CAMP_FAX', 'Fax campaign', '1', null), ('5', 'SRC_COMM', 'Commercial contact', '1', null), ('6', 'SRC_SHOP', 'Shop contact', '1', null), ('7', 'SRC_CAMP_EMAIL', 'EMailing campaign', '1', null), ('8', 'SRC_WOM', 'Word of mouth', '1', null), ('9', 'SRC_PARTNER', 'Partner', '1', null), ('10', 'SRC_EMPLOYEE', 'Employee', '1', null), ('11', 'SRC_SPONSORING', 'Sponsorship', '1', null);
COMMIT;

-- ----------------------------
--  Table structure for `llx_c_lead_status`
-- ----------------------------
DROP TABLE IF EXISTS `llx_c_lead_status`;
CREATE TABLE `llx_c_lead_status` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) DEFAULT NULL,
  `label` varchar(50) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `percent` double(5,2) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_lead_status_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_c_lead_status`
-- ----------------------------
BEGIN;
INSERT INTO `llx_c_lead_status` VALUES ('1', 'PROSP', 'Prospection', '10', '0.00', '1'), ('2', 'QUAL', 'Qualification', '20', '20.00', '1'), ('3', 'PROPO', 'Proposal', '30', '40.00', '1'), ('4', 'NEGO', 'Negotiation', '40', '60.00', '1'), ('5', 'PENDING', 'Pending', '50', '50.00', '0'), ('6', 'WON', 'Won', '60', '100.00', '1'), ('7', 'LOST', 'Lost', '70', '0.00', '1');
COMMIT;

-- ----------------------------
--  Table structure for `llx_c_paiement`
-- ----------------------------
DROP TABLE IF EXISTS `llx_c_paiement`;
CREATE TABLE `llx_c_paiement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `code` varchar(6) NOT NULL,
  `libelle` varchar(62) DEFAULT NULL,
  `type` smallint(6) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `accountancy_code` varchar(32) DEFAULT NULL,
  `module` varchar(32) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_c_paiement_code` (`entity`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_c_paiement`
-- ----------------------------
BEGIN;
INSERT INTO `llx_c_paiement` VALUES ('1', '1', 'TIP', 'TIP', '2', '0', null, null, '0'), ('2', '1', 'VIR', 'Transfer', '2', '1', null, null, '0'), ('3', '1', 'PRE', 'Debit order', '2', '1', null, null, '0'), ('4', '1', 'LIQ', 'Cash', '2', '1', null, null, '0'), ('6', '1', 'CB', 'Credit card', '2', '1', null, null, '0'), ('7', '1', 'CHQ', 'Cheque', '2', '1', null, null, '0'), ('50', '1', 'VAD', 'Online payment', '2', '0', null, null, '0'), ('51', '1', 'TRA', 'Traite', '2', '0', null, null, '0'), ('52', '1', 'LCR', 'LCR', '2', '0', null, null, '0'), ('53', '1', 'FAC', 'Factor', '2', '0', null, null, '0');
COMMIT;

-- ----------------------------
--  Table structure for `llx_c_paper_format`
-- ----------------------------
DROP TABLE IF EXISTS `llx_c_paper_format`;
CREATE TABLE `llx_c_paper_format` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(16) NOT NULL,
  `label` varchar(50) NOT NULL,
  `width` float(6,2) DEFAULT '0.00',
  `height` float(6,2) DEFAULT '0.00',
  `unit` varchar(5) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `module` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_c_paper_format`
-- ----------------------------
BEGIN;
INSERT INTO `llx_c_paper_format` VALUES ('1', 'EU4A0', 'Format 4A0', '1682.00', '2378.00', 'mm', '1', null), ('2', 'EU2A0', 'Format 2A0', '1189.00', '1682.00', 'mm', '1', null), ('3', 'EUA0', 'Format A0', '840.00', '1189.00', 'mm', '1', null), ('4', 'EUA1', 'Format A1', '594.00', '840.00', 'mm', '1', null), ('5', 'EUA2', 'Format A2', '420.00', '594.00', 'mm', '1', null), ('6', 'EUA3', 'Format A3', '297.00', '420.00', 'mm', '1', null), ('7', 'EUA4', 'Format A4', '210.00', '297.00', 'mm', '1', null), ('8', 'EUA5', 'Format A5', '148.00', '210.00', 'mm', '1', null), ('9', 'EUA6', 'Format A6', '105.00', '148.00', 'mm', '1', null), ('100', 'USLetter', 'Format Letter (A)', '216.00', '279.00', 'mm', '1', null), ('105', 'USLegal', 'Format Legal', '216.00', '356.00', 'mm', '1', null), ('110', 'USExecutive', 'Format Executive', '190.00', '254.00', 'mm', '1', null), ('115', 'USLedger', 'Format Ledger/Tabloid (B)', '279.00', '432.00', 'mm', '1', null), ('200', 'CAP1', 'Format Canadian P1', '560.00', '860.00', 'mm', '1', null), ('205', 'CAP2', 'Format Canadian P2', '430.00', '560.00', 'mm', '1', null), ('210', 'CAP3', 'Format Canadian P3', '280.00', '430.00', 'mm', '1', null), ('215', 'CAP4', 'Format Canadian P4', '215.00', '280.00', 'mm', '1', null), ('220', 'CAP5', 'Format Canadian P5', '140.00', '215.00', 'mm', '1', null), ('225', 'CAP6', 'Format Canadian P6', '107.00', '140.00', 'mm', '1', null);
COMMIT;

-- ----------------------------
--  Table structure for `llx_c_payment_term`
-- ----------------------------
DROP TABLE IF EXISTS `llx_c_payment_term`;
CREATE TABLE `llx_c_payment_term` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `code` varchar(16) DEFAULT NULL,
  `sortorder` smallint(6) DEFAULT NULL,
  `active` tinyint(4) DEFAULT '1',
  `libelle` varchar(255) DEFAULT NULL,
  `libelle_facture` text,
  `type_cdr` tinyint(4) DEFAULT NULL,
  `nbjour` smallint(6) DEFAULT NULL,
  `decalage` smallint(6) DEFAULT NULL,
  `module` varchar(32) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_payment_term_code` (`entity`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_c_payment_term`
-- ----------------------------
BEGIN;
INSERT INTO `llx_c_payment_term` VALUES ('1', '1', 'RECEP', '1', '1', 'Due upon receipt', 'Due upon receipt', '0', '1', null, null, '0'), ('2', '1', '30D', '2', '1', '30 days', 'Due in 30 days', '0', '30', null, null, '0'), ('3', '1', '30DENDMONTH', '3', '1', '30 days end of month', 'Due in 30 days, end of month', '1', '30', null, null, '0'), ('4', '1', '60D', '4', '1', '60 days', 'Due in 60 days, end of month', '0', '60', null, null, '0'), ('5', '1', '60DENDMONTH', '5', '1', '60 days end of month', 'Due in 60 days, end of month', '1', '60', null, null, '0'), ('6', '1', 'PT_ORDER', '6', '1', 'Due on order', 'Due on order', '0', '1', null, null, '0'), ('7', '1', 'PT_DELIVERY', '7', '1', 'Due on delivery', 'Due on delivery', '0', '1', null, null, '0'), ('8', '1', 'PT_5050', '8', '1', '50 and 50', '50% on order, 50% on delivery', '0', '1', null, null, '0'), ('9', '1', '10D', '9', '1', '10 days', 'Due in 10 days', '0', '10', null, null, '0'), ('10', '1', '10DENDMONTH', '10', '1', '10 days end of month', 'Due in 10 days, end of month', '1', '10', null, null, '0'), ('11', '1', '14D', '11', '1', '14 days', 'Due in 14 days', '0', '14', null, null, '0'), ('12', '1', '14DENDMONTH', '12', '1', '14 days end of month', 'Due in 14 days, end of month', '1', '14', null, null, '0');
COMMIT;

-- ----------------------------
--  Table structure for `llx_c_price_expression`
-- ----------------------------
DROP TABLE IF EXISTS `llx_c_price_expression`;
CREATE TABLE `llx_c_price_expression` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(20) NOT NULL,
  `expression` varchar(255) NOT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_c_price_global_variable`
-- ----------------------------
DROP TABLE IF EXISTS `llx_c_price_global_variable`;
CREATE TABLE `llx_c_price_global_variable` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `description` text,
  `value` double(24,8) DEFAULT '0.00000000',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_c_price_global_variable_updater`
-- ----------------------------
DROP TABLE IF EXISTS `llx_c_price_global_variable_updater`;
CREATE TABLE `llx_c_price_global_variable_updater` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL,
  `description` text,
  `parameters` text,
  `fk_variable` int(11) NOT NULL,
  `update_interval` int(11) DEFAULT '0',
  `next_update` int(11) DEFAULT '0',
  `last_status` text,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_c_product_nature`
-- ----------------------------
DROP TABLE IF EXISTS `llx_c_product_nature`;
CREATE TABLE `llx_c_product_nature` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` tinyint(4) NOT NULL,
  `label` varchar(100) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_product_nature` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_c_product_nature`
-- ----------------------------
BEGIN;
INSERT INTO `llx_c_product_nature` VALUES ('1', '0', 'RowMaterial', '1'), ('2', '1', 'Finished', '1');
COMMIT;

-- ----------------------------
--  Table structure for `llx_c_propalst`
-- ----------------------------
DROP TABLE IF EXISTS `llx_c_propalst`;
CREATE TABLE `llx_c_propalst` (
  `id` smallint(6) NOT NULL,
  `code` varchar(12) NOT NULL,
  `label` varchar(30) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_c_propalst` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_c_propalst`
-- ----------------------------
BEGIN;
INSERT INTO `llx_c_propalst` VALUES ('0', 'PR_DRAFT', 'Brouillon', '1'), ('1', 'PR_OPEN', 'Ouverte', '1'), ('2', 'PR_SIGNED', 'Signée', '1'), ('3', 'PR_NOTSIGNED', 'Non Signée', '1'), ('4', 'PR_FAC', 'Facturée', '1');
COMMIT;

-- ----------------------------
--  Table structure for `llx_c_prospectcontactlevel`
-- ----------------------------
DROP TABLE IF EXISTS `llx_c_prospectcontactlevel`;
CREATE TABLE `llx_c_prospectcontactlevel` (
  `code` varchar(12) NOT NULL,
  `label` varchar(30) DEFAULT NULL,
  `sortorder` smallint(6) DEFAULT NULL,
  `active` smallint(6) NOT NULL DEFAULT '1',
  `module` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_c_prospectcontactlevel`
-- ----------------------------
BEGIN;
INSERT INTO `llx_c_prospectcontactlevel` VALUES ('PL_HIGH', 'High', '4', '1', null), ('PL_LOW', 'Low', '2', '1', null), ('PL_MEDIUM', 'Medium', '3', '1', null), ('PL_NONE', 'None', '1', '1', null);
COMMIT;

-- ----------------------------
--  Table structure for `llx_c_prospectlevel`
-- ----------------------------
DROP TABLE IF EXISTS `llx_c_prospectlevel`;
CREATE TABLE `llx_c_prospectlevel` (
  `code` varchar(12) NOT NULL,
  `label` varchar(30) DEFAULT NULL,
  `sortorder` smallint(6) DEFAULT NULL,
  `active` smallint(6) NOT NULL DEFAULT '1',
  `module` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_c_prospectlevel`
-- ----------------------------
BEGIN;
INSERT INTO `llx_c_prospectlevel` VALUES ('PL_HIGH', 'High', '4', '1', null), ('PL_LOW', 'Low', '2', '1', null), ('PL_MEDIUM', 'Medium', '3', '1', null), ('PL_NONE', 'None', '1', '1', null);
COMMIT;

-- ----------------------------
--  Table structure for `llx_c_recruitment_origin`
-- ----------------------------
DROP TABLE IF EXISTS `llx_c_recruitment_origin`;
CREATE TABLE `llx_c_recruitment_origin` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `label` varchar(64) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_c_regions`
-- ----------------------------
DROP TABLE IF EXISTS `llx_c_regions`;
CREATE TABLE `llx_c_regions` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code_region` int(11) NOT NULL,
  `fk_pays` int(11) NOT NULL,
  `cheflieu` varchar(50) DEFAULT NULL,
  `tncc` int(11) DEFAULT NULL,
  `nom` varchar(100) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_code_region` (`code_region`),
  KEY `idx_c_regions_fk_pays` (`fk_pays`),
  CONSTRAINT `fk_c_regions_fk_pays` FOREIGN KEY (`fk_pays`) REFERENCES `llx_c_country` (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=464 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_c_regions`
-- ----------------------------
BEGIN;
INSERT INTO `llx_c_regions` VALUES ('1', '0', '0', '0', '0', '-', '1'), ('2', '1', '1', '97105', '3', 'Guadeloupe', '1'), ('3', '2', '1', '97209', '3', 'Martinique', '1'), ('4', '3', '1', '97302', '3', 'Guyane', '1'), ('5', '4', '1', '97411', '3', 'Réunion', '1'), ('6', '6', '1', '97601', '3', 'Mayotte', '1'), ('7', '11', '1', '75056', '1', 'Île-de-France', '1'), ('11', '24', '1', '45234', '2', 'Centre-Val de Loire', '1'), ('18', '52', '1', '44109', '4', 'Pays de la Loire', '1'), ('19', '53', '1', '35238', '0', 'Bretagne', '1'), ('27', '93', '1', '13055', '0', 'Provence-Alpes-Côte d\'Azur', '1'), ('28', '94', '1', '2A004', '0', 'Corse', '1'), ('29', '4101', '41', '', '0', 'Österreich', '1'), ('30', '201', '2', '', '1', 'Flandre', '1'), ('31', '202', '2', '', '2', 'Wallonie', '1'), ('32', '203', '2', '', '3', 'Bruxelles-Capitale', '1'), ('33', '301', '3', null, '1', 'Abruzzo', '1'), ('34', '302', '3', null, '1', 'Basilicata', '1'), ('35', '303', '3', null, '1', 'Calabria', '1'), ('36', '304', '3', null, '1', 'Campania', '1'), ('37', '305', '3', null, '1', 'Emilia-Romagna', '1'), ('38', '306', '3', null, '1', 'Friuli-Venezia Giulia', '1'), ('39', '307', '3', null, '1', 'Lazio', '1'), ('40', '308', '3', null, '1', 'Liguria', '1'), ('41', '309', '3', null, '1', 'Lombardia', '1'), ('42', '310', '3', null, '1', 'Marche', '1'), ('43', '311', '3', null, '1', 'Molise', '1'), ('44', '312', '3', null, '1', 'Piemonte', '1'), ('45', '313', '3', null, '1', 'Puglia', '1'), ('46', '314', '3', null, '1', 'Sardegna', '1'), ('47', '315', '3', null, '1', 'Sicilia', '1'), ('48', '316', '3', null, '1', 'Toscana', '1'), ('49', '317', '3', null, '1', 'Trentino-Alto Adige', '1'), ('50', '318', '3', null, '1', 'Umbria', '1'), ('51', '319', '3', null, '1', 'Valle d Aosta', '1'), ('52', '320', '3', null, '1', 'Veneto', '1'), ('53', '401', '4', '', '0', 'Andalucia', '1'), ('54', '402', '4', '', '0', 'Aragón', '1'), ('55', '403', '4', '', '0', 'Castilla y León', '1'), ('56', '404', '4', '', '0', 'Castilla la Mancha', '1'), ('57', '405', '4', '', '0', 'Canarias', '1'), ('58', '406', '4', '', '0', 'Cataluña', '1'), ('59', '407', '4', '', '0', 'Comunidad de Ceuta', '1'), ('60', '408', '4', '', '0', 'Comunidad Foral de Navarra', '1'), ('61', '409', '4', '', '0', 'Comunidad de Melilla', '1'), ('62', '410', '4', '', '0', 'Cantabria', '1'), ('63', '411', '4', '', '0', 'Comunidad Valenciana', '1'), ('64', '412', '4', '', '0', 'Extemadura', '1'), ('65', '413', '4', '', '0', 'Galicia', '1'), ('66', '414', '4', '', '0', 'Islas Baleares', '1'), ('67', '415', '4', '', '0', 'La Rioja', '1'), ('68', '416', '4', '', '0', 'Comunidad de Madrid', '1'), ('69', '417', '4', '', '0', 'Región de Murcia', '1'), ('70', '418', '4', '', '0', 'Principado de Asturias', '1'), ('71', '419', '4', '', '0', 'Pais Vasco', '1'), ('72', '420', '4', '', '0', 'Otros', '1'), ('73', '501', '5', '', '0', 'Deutschland', '1'), ('74', '10201', '102', null, null, 'Αττική', '1'), ('75', '10202', '102', null, null, 'Στερεά Ελλάδα', '1'), ('76', '10203', '102', null, null, 'Κεντρική Μακεδονία', '1'), ('77', '10204', '102', null, null, 'Κρήτη', '1'), ('78', '10205', '102', null, null, 'Ανατολική Μακεδονία και Θράκη', '1'), ('79', '10206', '102', null, null, 'Ήπειρος', '1'), ('80', '10207', '102', null, null, 'Ιόνια νησιά', '1'), ('81', '10208', '102', null, null, 'Βόρειο Αιγαίο', '1'), ('82', '10209', '102', null, null, 'Πελοπόννησος', '1'), ('83', '10210', '102', null, null, 'Νότιο Αιγαίο', '1'), ('84', '10211', '102', null, null, 'Δυτική Ελλάδα', '1'), ('85', '10212', '102', null, null, 'Θεσσαλία', '1'), ('86', '10213', '102', null, null, 'Δυτική Μακεδονία', '1'), ('87', '601', '6', '', '1', 'Cantons', '1'), ('88', '701', '7', '', '0', 'England', '1'), ('89', '702', '7', '', '0', 'Wales', '1'), ('90', '703', '7', '', '0', 'Scotland', '1'), ('91', '704', '7', '', '0', 'Northern Ireland', '1'), ('92', '1001', '10', '', '0', 'Ariana', '1'), ('93', '1002', '10', '', '0', 'Béja', '1'), ('94', '1003', '10', '', '0', 'Ben Arous', '1'), ('95', '1004', '10', '', '0', 'Bizerte', '1'), ('96', '1005', '10', '', '0', 'Gabès', '1'), ('97', '1006', '10', '', '0', 'Gafsa', '1'), ('98', '1007', '10', '', '0', 'Jendouba', '1'), ('99', '1008', '10', '', '0', 'Kairouan', '1'), ('100', '1009', '10', '', '0', 'Kasserine', '1'), ('101', '1010', '10', '', '0', 'Kébili', '1'), ('102', '1011', '10', '', '0', 'La Manouba', '1'), ('103', '1012', '10', '', '0', 'Le Kef', '1'), ('104', '1013', '10', '', '0', 'Mahdia', '1'), ('105', '1014', '10', '', '0', 'Médenine', '1'), ('106', '1015', '10', '', '0', 'Monastir', '1'), ('107', '1016', '10', '', '0', 'Nabeul', '1'), ('108', '1017', '10', '', '0', 'Sfax', '1'), ('109', '1018', '10', '', '0', 'Sidi Bouzid', '1'), ('110', '1019', '10', '', '0', 'Siliana', '1'), ('111', '1020', '10', '', '0', 'Sousse', '1'), ('112', '1021', '10', '', '0', 'Tataouine', '1'), ('113', '1022', '10', '', '0', 'Tozeur', '1'), ('114', '1023', '10', '', '0', 'Tunis', '1'), ('115', '1024', '10', '', '0', 'Zaghouan', '1'), ('116', '1101', '11', '', '0', 'United-States', '1'), ('117', '1301', '13', '', '0', 'Algerie', '1'), ('118', '1401', '14', '', '0', 'Canada', '1'), ('119', '1701', '17', '', '0', 'Provincies van Nederland ', '1'), ('120', '2301', '23', '', '0', 'Norte', '1'), ('121', '2302', '23', '', '0', 'Litoral', '1'), ('122', '2303', '23', '', '0', 'Cuyana', '1'), ('123', '2304', '23', '', '0', 'Central', '1'), ('124', '2305', '23', '', '0', 'Patagonia', '1'), ('125', '2801', '28', '', '0', 'Australia', '1'), ('126', '4601', '46', '', '0', 'Barbados', '1'), ('127', '5201', '52', '', '0', 'Chuquisaca', '1'), ('128', '5202', '52', '', '0', 'La Paz', '1'), ('129', '5203', '52', '', '0', 'Cochabamba', '1'), ('130', '5204', '52', '', '0', 'Oruro', '1'), ('131', '5205', '52', '', '0', 'Potosí', '1'), ('132', '5206', '52', '', '0', 'Tarija', '1'), ('133', '5207', '52', '', '0', 'Santa Cruz', '1'), ('134', '5208', '52', '', '0', 'El Beni', '1'), ('135', '5209', '52', '', '0', 'Pando', '1'), ('136', '5601', '56', '', '0', 'Brasil', '1'), ('137', '7001', '70', '', '0', 'Colombie', '1'), ('138', '6701', '67', null, null, 'Tarapacá', '1'), ('139', '6702', '67', null, null, 'Antofagasta', '1'), ('140', '6703', '67', null, null, 'Atacama', '1'), ('141', '6704', '67', null, null, 'Coquimbo', '1'), ('142', '6705', '67', null, null, 'Valparaíso', '1'), ('143', '6706', '67', null, null, 'General Bernardo O Higgins', '1'), ('144', '6707', '67', null, null, 'Maule', '1'), ('145', '6708', '67', null, null, 'Biobío', '1'), ('146', '6709', '67', null, null, 'Raucanía', '1'), ('147', '6710', '67', null, null, 'Los Lagos', '1'), ('148', '6711', '67', null, null, 'Aysén General Carlos Ibáñez del Campo', '1'), ('149', '6712', '67', null, null, 'Magallanes y Antártica Chilena', '1'), ('150', '6713', '67', null, null, 'Metropolitana de Santiago', '1'), ('151', '6714', '67', null, null, 'Los Ríos', '1'), ('152', '6715', '67', null, null, 'Arica y Parinacota', '1'), ('153', '8601', '86', null, null, 'Central', '1'), ('154', '8602', '86', null, null, 'Oriental', '1'), ('155', '8603', '86', null, null, 'Occidental', '1'), ('156', '11401', '114', '', '0', 'Honduras', '1'), ('157', '11701', '117', '', '0', 'India', '1'), ('158', '11801', '118', '', '0', 'Indonesia', '1'), ('159', '1201', '12', '', '0', 'Tanger-Tétouan', '1'), ('160', '1202', '12', '', '0', 'Gharb-Chrarda-Beni Hssen', '1'), ('161', '1203', '12', '', '0', 'Taza-Al Hoceima-Taounate', '1'), ('162', '1204', '12', '', '0', 'L\'Oriental', '1'), ('163', '1205', '12', '', '0', 'Fès-Boulemane', '1'), ('164', '1206', '12', '', '0', 'Meknès-Tafialet', '1'), ('165', '1207', '12', '', '0', 'Rabat-Salé-Zemour-Zaër', '1'), ('166', '1208', '12', '', '0', 'Grand Cassablanca', '1'), ('167', '1209', '12', '', '0', 'Chaouia-Ouardigha', '1'), ('168', '1210', '12', '', '0', 'Doukahla-Adba', '1'), ('169', '1211', '12', '', '0', 'Marrakech-Tensift-Al Haouz', '1'), ('170', '1212', '12', '', '0', 'Tadla-Azilal', '1'), ('171', '1213', '12', '', '0', 'Sous-Massa-Drâa', '1'), ('172', '1214', '12', '', '0', 'Guelmim-Es Smara', '1'), ('173', '1215', '12', '', '0', 'Laâyoune-Boujdour-Sakia el Hamra', '1'), ('174', '1216', '12', '', '0', 'Oued Ed-Dahab Lagouira', '1'), ('175', '14001', '140', '', '0', 'Diekirch', '1'), ('176', '14002', '140', '', '0', 'Grevenmacher', '1'), ('177', '14003', '140', '', '0', 'Luxembourg', '1'), ('178', '15201', '152', '', '0', 'Rivière Noire', '1'), ('179', '15202', '152', '', '0', 'Flacq', '1'), ('180', '15203', '152', '', '0', 'Grand Port', '1'), ('181', '15204', '152', '', '0', 'Moka', '1'), ('182', '15205', '152', '', '0', 'Pamplemousses', '1'), ('183', '15206', '152', '', '0', 'Plaines Wilhems', '1'), ('184', '15207', '152', '', '0', 'Port-Louis', '1'), ('185', '15208', '152', '', '0', 'Rivière du Rempart', '1'), ('186', '15209', '152', '', '0', 'Savanne', '1'), ('187', '15210', '152', '', '0', 'Rodrigues', '1'), ('188', '15211', '152', '', '0', 'Les îles Agaléga', '1'), ('189', '15212', '152', '', '0', 'Les écueils des Cargados Carajos', '1'), ('190', '15401', '154', '', '0', 'Mexique', '1'), ('191', '18801', '188', '', '0', 'Romania', '1'), ('192', '23201', '232', '', '0', 'Los Andes', '1'), ('193', '23202', '232', '', '0', 'Capital', '1'), ('194', '23203', '232', '', '0', 'Central', '1'), ('195', '23204', '232', '', '0', 'Cento Occidental', '1'), ('196', '23205', '232', '', '0', 'Guayana', '1'), ('197', '23206', '232', '', '0', 'Insular', '1'), ('198', '23207', '232', '', '0', 'Los Llanos', '1'), ('199', '23208', '232', '', '0', 'Nor-Oriental', '1'), ('200', '23209', '232', '', '0', 'Zuliana', '1'), ('201', '18101', '181', '', '0', 'Amazonas', '1'), ('202', '18102', '181', '', '0', 'Ancash', '1'), ('203', '18103', '181', '', '0', 'Apurimac', '1'), ('204', '18104', '181', '', '0', 'Arequipa', '1'), ('205', '18105', '181', '', '0', 'Ayacucho', '1'), ('206', '18106', '181', '', '0', 'Cajamarca', '1'), ('207', '18107', '181', '', '0', 'Callao', '1'), ('208', '18108', '181', '', '0', 'Cuzco', '1'), ('209', '18109', '181', '', '0', 'Huancavelica', '1'), ('210', '18110', '181', '', '0', 'Huanuco', '1'), ('211', '18111', '181', '', '0', 'Ica', '1'), ('212', '18112', '181', '', '0', 'Junin', '1'), ('213', '18113', '181', '', '0', 'La Libertad', '1'), ('214', '18114', '181', '', '0', 'Lambayeque', '1'), ('215', '18115', '181', '', '0', 'Lima Metropolitana', '1'), ('216', '18116', '181', '', '0', 'Lima', '1'), ('217', '18117', '181', '', '0', 'Loreto', '1'), ('218', '18118', '181', '', '0', 'Madre de Dios', '1'), ('219', '18119', '181', '', '0', 'Moquegua', '1'), ('220', '18120', '181', '', '0', 'Pasco', '1'), ('221', '18121', '181', '', '0', 'Piura', '1'), ('222', '18122', '181', '', '0', 'Puno', '1'), ('223', '18123', '181', '', '0', 'San Martín', '1'), ('224', '18124', '181', '', '0', 'Tacna', '1'), ('225', '18125', '181', '', '0', 'Tumbes', '1'), ('226', '18126', '181', '', '0', 'Ucayali', '1'), ('227', '17801', '178', '', '0', 'Panama', '1'), ('228', '22701', '227', '', '0', 'United Arab Emirates', '1'), ('457', '27', '1', '21231', '0', 'Bourgogne-Franche-Comté', '1'), ('458', '28', '1', '76540', '0', 'Normandie', '1'), ('459', '32', '1', '59350', '4', 'Hauts-de-France', '1'), ('460', '44', '1', '67482', '2', 'Grand Est', '1'), ('461', '75', '1', '33063', '0', 'Nouvelle-Aquitaine', '1'), ('462', '76', '1', '31355', '1', 'Occitanie', '1'), ('463', '84', '1', '69123', '1', 'Auvergne-Rhône-Alpes', '1');
COMMIT;

-- ----------------------------
--  Table structure for `llx_c_revenuestamp`
-- ----------------------------
DROP TABLE IF EXISTS `llx_c_revenuestamp`;
CREATE TABLE `llx_c_revenuestamp` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_pays` int(11) NOT NULL,
  `taux` double NOT NULL,
  `revenuestamp_type` varchar(16) NOT NULL DEFAULT 'fixed',
  `note` varchar(128) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `accountancy_code_sell` varchar(32) DEFAULT NULL,
  `accountancy_code_buy` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=1543 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_c_revenuestamp`
-- ----------------------------
BEGIN;
INSERT INTO `llx_c_revenuestamp` VALUES ('101', '10', '0.4', 'fixed', 'Revenue stamp tunisia', '1', null, null), ('1541', '154', '1.5', 'percent', 'Revenue stamp mexico', '1', null, null), ('1542', '154', '3', 'percent', 'Revenue stamp mexico', '1', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `llx_c_shipment_mode`
-- ----------------------------
DROP TABLE IF EXISTS `llx_c_shipment_mode`;
CREATE TABLE `llx_c_shipment_mode` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `code` varchar(30) NOT NULL,
  `libelle` varchar(50) NOT NULL,
  `description` text,
  `tracking` varchar(255) DEFAULT NULL,
  `active` tinyint(4) DEFAULT '0',
  `module` varchar(32) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_shipment_mode` (`code`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_c_shipment_mode`
-- ----------------------------
BEGIN;
INSERT INTO `llx_c_shipment_mode` VALUES ('1', '2021-04-28 08:55:25', 'CATCH', 'At-Store Reclamation', 'At-Store Reclamation by the customer', '', '1', null, '1'), ('2', '2021-04-28 08:55:25', 'TRANS', 'Generic transporter', 'Generic transporter', '', '1', null, '1'), ('3', '2021-04-28 08:55:25', 'COLSUI', 'Colissimo Suivi', 'Colissimo Suivi', 'http://www.colissimo.fr/portail_colissimo/suivre.do?colispart={TRACKID}', '0', null, '1'), ('4', '2021-04-28 08:55:25', 'LETTREMAX', 'Lettre Max', 'Courrier Suivi et Lettre Max', '', '0', null, '1'), ('5', '2021-04-28 08:55:25', 'UPS', 'UPS', 'United Parcel Service', 'http://wwwapps.ups.com/etracking/tracking.cgi?InquiryNumber2=&InquiryNumber3=&tracknums_displayed=3&loc=fr_FR&TypeOfInquiryNumber=T&HTMLVersion=4.0&InquiryNumber22=&InquiryNumber32=&track=Track&Suivi.x=64&Suivi.y=7&Suivi=Valider&InquiryNumber1={TRACKID}', '0', null, '1'), ('6', '2021-04-28 08:55:25', 'KIALA', 'KIALA', 'Relais Kiala', 'http://www.kiala.fr/tnt/delivery/{TRACKID}', '0', null, '1'), ('7', '2021-04-28 08:55:25', 'GLS', 'GLS', 'General Logistics Systems', 'https://gls-group.eu/FR/fr/suivi-colis?match={TRACKID}', '0', null, '1'), ('8', '2021-04-28 08:55:25', 'CHRONO', 'Chronopost', 'Chronopost', 'http://www.chronopost.fr/expedier/inputLTNumbersNoJahia.do?listeNumeros={TRACKID}', '0', null, '1'), ('9', '2021-05-06 04:48:43', 'INPERSON', 'In person at your site', null, null, '0', null, '1'), ('10', '2021-05-06 04:48:43', 'FEDEX', 'Fedex', null, 'https://www.fedex.com/apps/fedextrack/index.html?tracknumbers={TRACKID}', '0', null, '1'), ('11', '2021-05-06 04:48:43', 'TNT', 'TNT', null, 'https://www.tnt.com/express/fr_fr/site/outils-expedition/suivi.html?searchType=con&cons=={TRACKID}', '0', null, '1'), ('12', '2021-05-06 04:48:43', 'DHL', 'DHL', null, 'https://www.dhl.com/fr-fr/home/tracking/tracking-global-forwarding.html?submit=1&tracking-id={TRACKID}', '0', null, '1'), ('13', '2021-05-06 04:48:43', 'DPD', 'DPD', null, 'https://www.dpd.fr/trace/{TRACKID}', '0', null, '1'), ('14', '2021-05-06 04:48:43', 'MAINFREIGHT', 'Mainfreight', null, 'https://www.mainfreight.com/track?{TRACKID}', '0', null, '1');
COMMIT;

-- ----------------------------
--  Table structure for `llx_c_shipment_package_type`
-- ----------------------------
DROP TABLE IF EXISTS `llx_c_shipment_package_type`;
CREATE TABLE `llx_c_shipment_package_type` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  `entity` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_c_socialnetworks`
-- ----------------------------
DROP TABLE IF EXISTS `llx_c_socialnetworks`;
CREATE TABLE `llx_c_socialnetworks` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `code` varchar(100) DEFAULT NULL,
  `label` varchar(150) DEFAULT NULL,
  `url` text,
  `icon` varchar(20) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_c_socialnetworks_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_c_socialnetworks`
-- ----------------------------
BEGIN;
INSERT INTO `llx_c_socialnetworks` VALUES ('1', '1', 'facebook', 'Facebook', 'https://www.facebook.com/{socialid}', 'fa-facebook', '1'), ('2', '1', 'skype', 'Skype', 'https://www.skype.com/{socialid}', 'fa-skype', '1'), ('3', '1', 'twitter', 'Twitter', 'https://www.twitter.com/{socialid}', 'fa-twitter', '1'), ('4', '1', 'linkedin', 'LinkedIn', 'https://www.linkedin.com/{socialid}', 'fa-linkedin', '1'), ('5', '1', 'instagram', 'Instagram', 'https://www.instagram.com/{socialid}', 'fa-instagram', '1'), ('6', '1', 'snapchat', 'Snapchat', '{socialid}', 'fa-snapchat', '1'), ('7', '1', 'googleplus', 'GooglePlus', 'https://www.googleplus.com/{socialid}', 'fa-google-plus-g', '1'), ('8', '1', 'youtube', 'Youtube', 'https://www.youtube.com/{socialid}', 'fa-youtube', '1'), ('9', '1', 'whatsapp', 'Whatsapp', '{socialid}', 'fa-whatsapp', '1'), ('10', '1', 'tumblr', 'Tumblr', 'https://www.tumblr.com/{socialid}', 'fa-tumblr', '0'), ('11', '1', 'vero', 'Vero', 'https://vero.co/{socialid}', '', '0'), ('12', '1', 'viadeo', 'Viadeo', 'https://fr.viadeo.com/fr/{socialid}', 'fa-viadeo', '0'), ('13', '1', 'slack', 'Slack', '{socialid}', 'fa-slack', '0'), ('14', '1', 'xing', 'Xing', '{socialid}', 'fa-xing', '0'), ('15', '1', 'meetup', 'Meetup', '{socialid}', 'fa-meetup', '0'), ('16', '1', 'pinterest', 'Pinterest', '{socialid}', 'fa-pinterest', '0'), ('17', '1', 'flickr', 'Flickr', '{socialid}', 'fa-flickr', '0'), ('18', '1', '500px', '500px', '{socialid}', 'fa-500px', '0'), ('19', '1', 'giphy', 'Giphy', '{socialid}', '', '0'), ('20', '1', 'gifycat', 'Gificat', '{socialid}', '', '0'), ('21', '1', 'dailymotion', 'Dailymotion', '{socialid}', '', '0'), ('22', '1', 'vimeo', 'Vimeo', '{socialid}', '', '0'), ('23', '1', 'periscope', 'Periscope', '{socialid}', '', '0'), ('24', '1', 'twitch', 'Twitch', '{socialid}', '', '0'), ('25', '1', 'discord', 'Discord', '{socialid}', 'fa-discord', '0'), ('26', '1', 'wikipedia', 'Wikipedia', '{socialid}', '', '0'), ('27', '1', 'reddit', 'Reddit', '{socialid}', 'fa-reddit', '0'), ('28', '1', 'quora', 'Quora', '{socialid}', '', '0'), ('29', '1', 'tripadvisor', 'Tripadvisor', '{socialid}', '', '0'), ('30', '1', 'mastodon', 'Mastodon', '{socialid}', '', '0'), ('31', '1', 'diaspora', 'Diaspora', '{socialid}', '', '0'), ('32', '1', 'viber', 'Viber', '{socialid}', '', '0'), ('33', '1', 'github', 'Github', 'https://github.com/{socialid}', 'fa-github', '1');
COMMIT;

-- ----------------------------
--  Table structure for `llx_c_stcomm`
-- ----------------------------
DROP TABLE IF EXISTS `llx_c_stcomm`;
CREATE TABLE `llx_c_stcomm` (
  `id` int(11) NOT NULL,
  `code` varchar(12) NOT NULL,
  `libelle` varchar(30) DEFAULT NULL,
  `picto` varchar(128) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_c_stcomm` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_c_stcomm`
-- ----------------------------
BEGIN;
INSERT INTO `llx_c_stcomm` VALUES ('-1', 'ST_NO', 'Do not contact', null, '1'), ('0', 'ST_NEVER', 'Never contacted', null, '1'), ('1', 'ST_TODO', 'To contact', null, '1'), ('2', 'ST_PEND', 'Contact in progress', null, '1'), ('3', 'ST_DONE', 'Contacted', null, '1');
COMMIT;

-- ----------------------------
--  Table structure for `llx_c_stcommcontact`
-- ----------------------------
DROP TABLE IF EXISTS `llx_c_stcommcontact`;
CREATE TABLE `llx_c_stcommcontact` (
  `id` int(11) NOT NULL,
  `code` varchar(12) NOT NULL,
  `libelle` varchar(30) DEFAULT NULL,
  `picto` varchar(128) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_c_stcommcontact` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_c_stcommcontact`
-- ----------------------------
BEGIN;
INSERT INTO `llx_c_stcommcontact` VALUES ('-1', 'ST_NO', 'Do not contact', null, '1'), ('0', 'ST_NEVER', 'Never contacted', null, '1'), ('1', 'ST_TODO', 'To contact', null, '1'), ('2', 'ST_PEND', 'Contact in progress', null, '1'), ('3', 'ST_DONE', 'Contacted', null, '1');
COMMIT;

-- ----------------------------
--  Table structure for `llx_c_ticket_category`
-- ----------------------------
DROP TABLE IF EXISTS `llx_c_ticket_category`;
CREATE TABLE `llx_c_ticket_category` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) DEFAULT '1',
  `code` varchar(32) NOT NULL,
  `pos` varchar(32) NOT NULL,
  `label` varchar(128) NOT NULL,
  `active` int(11) DEFAULT '1',
  `use_default` int(11) DEFAULT '1',
  `description` varchar(255) DEFAULT NULL,
  `fk_parent` int(11) NOT NULL DEFAULT '0',
  `force_severity` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_code` (`code`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_c_ticket_category`
-- ----------------------------
BEGIN;
INSERT INTO `llx_c_ticket_category` VALUES ('1', '1', 'OTHER', '10', 'Other', '1', '1', null, '0', null);
COMMIT;

-- ----------------------------
--  Table structure for `llx_c_ticket_resolution`
-- ----------------------------
DROP TABLE IF EXISTS `llx_c_ticket_resolution`;
CREATE TABLE `llx_c_ticket_resolution` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) DEFAULT '1',
  `code` varchar(32) NOT NULL,
  `pos` varchar(32) NOT NULL,
  `label` varchar(128) NOT NULL,
  `active` int(11) DEFAULT '1',
  `use_default` int(11) DEFAULT '1',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_code` (`code`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_c_ticket_resolution`
-- ----------------------------
BEGIN;
INSERT INTO `llx_c_ticket_resolution` VALUES ('1', '1', 'SOLVED', '10', 'Solved', '1', '0', null), ('2', '1', 'CANCELED', '50', 'Canceled', '1', '0', null), ('3', '1', 'OTHER', '90', 'Other', '1', '0', null);
COMMIT;

-- ----------------------------
--  Table structure for `llx_c_ticket_severity`
-- ----------------------------
DROP TABLE IF EXISTS `llx_c_ticket_severity`;
CREATE TABLE `llx_c_ticket_severity` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) DEFAULT '1',
  `code` varchar(32) NOT NULL,
  `pos` varchar(32) NOT NULL,
  `label` varchar(128) NOT NULL,
  `color` varchar(10) DEFAULT NULL,
  `active` int(11) DEFAULT '1',
  `use_default` int(11) DEFAULT '1',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_code` (`code`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_c_ticket_severity`
-- ----------------------------
BEGIN;
INSERT INTO `llx_c_ticket_severity` VALUES ('1', '1', 'LOW', '10', 'Low', '', '1', '0', null), ('2', '1', 'NORMAL', '20', 'Normal', '', '1', '1', null), ('3', '1', 'HIGH', '30', 'High', '', '1', '0', null), ('4', '1', 'BLOCKING', '40', 'Critical / blocking', '', '1', '0', null);
COMMIT;

-- ----------------------------
--  Table structure for `llx_c_ticket_type`
-- ----------------------------
DROP TABLE IF EXISTS `llx_c_ticket_type`;
CREATE TABLE `llx_c_ticket_type` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) DEFAULT '1',
  `code` varchar(32) NOT NULL,
  `pos` varchar(32) NOT NULL,
  `label` varchar(128) NOT NULL,
  `active` int(11) DEFAULT '1',
  `use_default` int(11) DEFAULT '1',
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_code` (`code`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_c_ticket_type`
-- ----------------------------
BEGIN;
INSERT INTO `llx_c_ticket_type` VALUES ('1', '1', 'COM', '10', 'Commercial question', '1', '1', null), ('2', '1', 'ISSUE', '20', 'Issue or problem', '1', '0', null), ('3', '1', 'REQUEST', '25', 'Change or enhancement request', '1', '0', null), ('4', '1', 'PROJECT', '30', 'Project', '0', '0', null), ('5', '1', 'OTHER', '40', 'Other', '1', '0', null), ('11', '1', 'HELP', '15', 'Request for functionnal help', '1', '0', null);
COMMIT;

-- ----------------------------
--  Table structure for `llx_c_transport_mode`
-- ----------------------------
DROP TABLE IF EXISTS `llx_c_transport_mode`;
CREATE TABLE `llx_c_transport_mode` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `code` varchar(3) NOT NULL,
  `label` varchar(255) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_transport_mode` (`code`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_c_transport_mode`
-- ----------------------------
BEGIN;
INSERT INTO `llx_c_transport_mode` VALUES ('1', '1', 'MAR', 'Transport maritime (y compris camions ou wagons sur bateau)', '1'), ('2', '1', 'TRA', 'Transport par chemin de fer (y compris camions sur wagon)', '1'), ('3', '1', 'ROU', 'Transport par route', '1'), ('4', '1', 'AIR', 'Transport par air', '1'), ('5', '1', 'POS', 'Envois postaux', '1'), ('6', '1', 'OLE', 'Installations de transport fixe (oléoduc)', '1'), ('7', '1', 'NAV', 'Transport par navigation intérieure', '1'), ('8', '1', 'PRO', 'Propulsion propre', '1');
COMMIT;

-- ----------------------------
--  Table structure for `llx_c_tva`
-- ----------------------------
DROP TABLE IF EXISTS `llx_c_tva`;
CREATE TABLE `llx_c_tva` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_pays` int(11) NOT NULL,
  `code` varchar(10) DEFAULT '',
  `taux` double NOT NULL,
  `localtax1` varchar(20) NOT NULL DEFAULT '0',
  `localtax1_type` varchar(10) NOT NULL DEFAULT '0',
  `localtax2` varchar(20) NOT NULL DEFAULT '0',
  `localtax2_type` varchar(10) NOT NULL DEFAULT '0',
  `recuperableonly` int(11) NOT NULL DEFAULT '0',
  `note` varchar(128) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `accountancy_code_sell` varchar(32) DEFAULT NULL,
  `accountancy_code_buy` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_tva_id` (`fk_pays`,`code`,`taux`,`recuperableonly`)
) ENGINE=InnoDB AUTO_INCREMENT=2473 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_c_tva`
-- ----------------------------
BEGIN;
INSERT INTO `llx_c_tva` VALUES ('11', '1', '', '20', '0', '0', '0', '0', '0', 'VAT standard rate (France hors DOM-TOM)', '1', null, null), ('14', '1', '', '5.5', '0', '0', '0', '0', '0', 'VAT reduced rate (France hors DOM-TOM)', '1', null, null), ('15', '1', '', '0', '0', '0', '0', '0', '0', 'VAT Rate 0 ou non applicable', '1', null, null), ('16', '1', '', '2.1', '0', '0', '0', '0', '0', 'VAT super-reduced rate', '1', null, null), ('17', '1', '', '10', '0', '0', '0', '0', '0', 'VAT reduced rate', '1', null, null), ('21', '2', '', '21', '0', '0', '0', '0', '0', 'VAT standard rate', '1', null, null), ('22', '2', '', '6', '0', '0', '0', '0', '0', 'VAT reduced rate', '1', null, null), ('23', '2', '', '0', '0', '0', '0', '0', '0', 'VAT Rate 0 ou non applicable', '1', null, null), ('24', '2', '', '12', '0', '0', '0', '0', '0', 'VAT reduced rate', '1', null, null), ('31', '3', '', '22', '0', '0', '0', '0', '0', 'VAT standard rate', '1', null, null), ('32', '3', '', '10', '0', '0', '0', '0', '0', 'VAT reduced rate', '1', null, null), ('33', '3', '', '4', '0', '0', '0', '0', '0', 'VAT super-reduced rate', '1', null, null), ('34', '3', '', '0', '0', '0', '0', '0', '0', 'VAT Rate 0', '1', null, null), ('41', '4', '', '21', '5.2', '3', '-19:-15:-9', '5', '0', 'VAT standard rate', '1', null, null), ('42', '4', '', '10', '1.4', '3', '-19:-15:-9', '5', '0', 'VAT reduced rate', '1', null, null), ('43', '4', '', '4', '0.5', '3', '-19:-15:-9', '5', '0', 'VAT super-reduced rate', '1', null, null), ('44', '4', '', '0', '0', '3', '-19:-15:-9', '5', '0', 'VAT Rate 0', '1', null, null), ('51', '5', '', '19', '0', '0', '0', '0', '0', 'allgemeine Ust.', '1', null, null), ('52', '5', '', '7', '0', '0', '0', '0', '0', 'ermäßigte USt.', '1', null, null), ('53', '5', '', '0', '0', '0', '0', '0', '0', 'keine USt.', '1', null, null), ('54', '5', '', '5.5', '0', '0', '0', '0', '0', 'USt. Forst', '0', null, null), ('55', '5', '', '10.7', '0', '0', '0', '0', '0', 'USt. Landwirtschaft', '0', null, null), ('61', '6', '', '7.7', '0', '0', '0', '0', '0', 'VAT standard rate', '1', null, null), ('62', '6', '', '3.7', '0', '0', '0', '0', '0', 'VAT reduced rate', '1', null, null), ('63', '6', '', '2.5', '0', '0', '0', '0', '0', 'VAT super-reduced rate', '1', null, null), ('64', '6', '', '0', '0', '0', '0', '0', '0', 'VAT Rate 0', '1', null, null), ('71', '7', '', '20', '0', '0', '0', '0', '0', 'VAT standard rate', '1', null, null), ('72', '7', '', '17.5', '0', '0', '0', '0', '0', 'VAT standard rate before 2011', '1', null, null), ('73', '7', '', '5', '0', '0', '0', '0', '0', 'VAT reduced rate', '1', null, null), ('74', '7', '', '0', '0', '0', '0', '0', '0', 'VAT Rate 0', '1', null, null), ('81', '8', '', '0', '0', '0', '0', '0', '0', 'VAT Rate 0', '1', null, null), ('82', '8', '', '23', '0', '0', '0', '0', '0', 'VAT standard rate', '1', null, null), ('83', '8', '', '13.5', '0', '0', '0', '0', '0', 'VAT reduced rate', '1', null, null), ('84', '8', '', '9', '0', '0', '0', '0', '0', 'VAT reduced rate', '1', null, null), ('85', '8', '', '4.8', '0', '0', '0', '0', '0', 'VAT reduced rate', '1', null, null), ('91', '9', '', '17', '0', '0', '0', '0', '0', 'VAT standard rate', '1', null, null), ('92', '9', '', '13', '0', '0', '0', '0', '0', 'VAT reduced rate 0', '1', null, null), ('93', '9', '', '3', '0', '0', '0', '0', '0', 'VAT super reduced rate 0', '1', null, null), ('94', '9', '', '0', '0', '0', '0', '0', '0', 'VAT Rate 0', '1', null, null), ('101', '10', '', '6', '1', '4', '0', '0', '0', 'VAT 6%', '1', null, null), ('102', '10', '', '12', '1', '4', '0', '0', '0', 'VAT 12%', '1', null, null), ('103', '10', '', '18', '1', '4', '0', '0', '0', 'VAT 18%', '1', null, null), ('104', '10', '', '7.5', '1', '4', '0', '0', '0', 'VAT 6% Majoré à 25% (7.5%)', '1', null, null), ('105', '10', '', '15', '1', '4', '0', '0', '0', 'VAT 12% Majoré à 25% (15%)', '1', null, null), ('106', '10', '', '22.5', '1', '4', '0', '0', '0', 'VAT 18% Majoré à 25% (22.5%)', '1', null, null), ('107', '10', '', '0', '1', '4', '0', '0', '0', 'VAT Rate 0', '1', null, null), ('111', '11', '', '0', '0', '0', '0', '0', '0', 'No Sales Tax', '1', null, null), ('112', '11', '', '4', '0', '0', '0', '0', '0', 'Sales Tax 4%', '1', null, null), ('113', '11', '', '6', '0', '0', '0', '0', '0', 'Sales Tax 6%', '1', null, null), ('121', '12', '', '20', '0', '0', '0', '0', '0', 'VAT standard rate', '1', null, null), ('122', '12', '', '14', '0', '0', '0', '0', '0', 'VAT reduced rate', '1', null, null), ('123', '12', '', '10', '0', '0', '0', '0', '0', 'VAT reduced rate', '1', null, null), ('124', '12', '', '7', '0', '0', '0', '0', '0', 'VAT super-reduced rate', '1', null, null), ('125', '12', '', '0', '0', '0', '0', '0', '0', 'VAT Rate 0', '1', null, null), ('141', '14', '', '7', '0', '0', '0', '0', '0', 'VAT standard rate', '1', null, null), ('142', '14', '', '0', '0', '0', '0', '0', '0', 'VAT Rate 0', '1', null, null), ('143', '14', '', '5', '9.975', '1', '0', '0', '0', 'GST/TPS and PST/TVQ rate for Province', '1', null, null), ('171', '17', '', '19', '0', '0', '0', '0', '0', 'Algemeen BTW tarief', '1', null, null), ('172', '17', '', '6', '0', '0', '0', '0', '0', 'Verlaagd BTW tarief', '1', null, null), ('173', '17', '', '0', '0', '0', '0', '0', '0', '0 BTW tarief', '1', null, null), ('174', '17', '', '21', '0', '0', '0', '0', '0', 'Algemeen BTW tarief (vanaf 1 oktober 2012)', '0', null, null), ('201', '20', '', '25', '0', '0', '0', '0', '0', 'VAT standard rate', '1', null, null), ('202', '20', '', '12', '0', '0', '0', '0', '0', 'VAT reduced rate', '1', null, null), ('203', '20', '', '6', '0', '0', '0', '0', '0', 'VAT super-reduced rate', '1', null, null), ('204', '20', '', '0', '0', '0', '0', '0', '0', 'VAT Rate 0', '1', null, null), ('211', '21', '', '0', '0', '0', '0', '0', '0', 'IVA Rate 0', '1', null, null), ('212', '21', '', '18', '7.5', '2', '0', '0', '0', 'IVA standard rate', '1', null, null), ('221', '22', '', '18', '0', '0', '0', '0', '0', 'VAT standard rate', '1', null, null), ('222', '22', '', '10', '0', '0', '0', '0', '0', 'VAT reduced rate', '1', null, null), ('223', '22', '', '0', '0', '0', '0', '0', '0', 'VAT Rate 0', '1', null, null), ('231', '23', '', '21', '0', '0', '0', '0', '0', 'IVA standard rate', '1', null, null), ('232', '23', '', '10.5', '0', '0', '0', '0', '0', 'IVA reduced rate', '1', null, null), ('233', '23', '', '0', '0', '0', '0', '0', '0', 'IVA Rate 0', '1', null, null), ('241', '24', '', '19.25', '0', '0', '0', '0', '0', 'VAT standard rate', '1', null, null), ('242', '24', '', '0', '0', '0', '0', '0', '0', 'VAT Rate 0', '1', null, null), ('251', '25', '', '23', '0', '0', '0', '0', '0', 'VAT standard rate', '1', null, null), ('252', '25', '', '13', '0', '0', '0', '0', '0', 'VAT reduced rate', '1', null, null), ('253', '25', '', '0', '0', '0', '0', '0', '0', 'VAT Rate 0', '1', null, null), ('254', '25', '', '6', '0', '0', '0', '0', '0', 'VAT reduced rate', '1', null, null), ('261', '26', '', '0', '0', '0', '0', '0', '0', 'VAT Rate 0', '1', null, null), ('262', '26', '', '5', '0', '0', '0', '0', '0', 'VAT Rate 5', '1', null, null), ('271', '27', '', '19.6', '0', '0', '0', '0', '0', 'VAT standard rate (France hors DOM-TOM)', '1', null, null), ('272', '27', '', '8.5', '0', '0', '0', '0', '0', 'VAT standard rate (DOM sauf Guyane et Saint-Martin)', '0', null, null), ('273', '27', '', '8.5', '0', '0', '0', '0', '1', 'VAT standard rate (DOM sauf Guyane et Saint-Martin), non perçu par le vendeur mais récupérable par acheteur', '0', null, null), ('274', '27', '', '5.5', '0', '0', '0', '0', '0', 'VAT reduced rate (France hors DOM-TOM)', '0', null, null), ('275', '27', '', '0', '0', '0', '0', '0', '0', 'VAT Rate 0 ou non applicable', '1', null, null), ('276', '27', '', '2.1', '0', '0', '0', '0', '0', 'VAT super-reduced rate', '1', null, null), ('277', '27', '', '7', '0', '0', '0', '0', '0', 'VAT reduced rate', '1', null, null), ('281', '28', '', '10', '0', '0', '0', '0', '0', 'VAT standard rate', '1', null, null), ('282', '28', '', '0', '0', '0', '0', '0', '0', 'VAT Rate 0', '1', null, null), ('411', '41', '', '20', '0', '0', '0', '0', '0', 'VAT standard rate', '1', null, null), ('412', '41', '', '10', '0', '0', '0', '0', '0', 'VAT reduced rate', '1', null, null), ('413', '41', '', '0', '0', '0', '0', '0', '0', 'VAT Rate 0', '1', null, null), ('461', '46', '', '0', '0', '0', '0', '0', '0', 'No VAT', '1', null, null), ('462', '46', '', '15', '0', '0', '0', '0', '0', 'VAT 15%', '1', null, null), ('463', '46', '', '7.5', '0', '0', '0', '0', '0', 'VAT 7.5%', '1', null, null), ('561', '56', '', '0', '0', '0', '0', '0', '0', 'VAT reduced rate', '1', null, null), ('591', '59', '', '20', '0', '0', '0', '0', '0', 'VAT standard rate', '1', null, null), ('592', '59', '', '7', '0', '0', '0', '0', '0', 'VAT reduced rate', '1', null, null), ('593', '59', '', '0', '0', '0', '0', '0', '0', 'VAT Rate 0', '1', null, null), ('671', '67', '', '19', '0', '0', '0', '0', '0', 'VAT standard rate', '1', null, null), ('672', '67', '', '0', '0', '0', '0', '0', '0', 'VAT Rate 0', '1', null, null), ('721', '72', '', '0', '0', '0', '0', '0', '0', 'VAT Rate 0', '1', null, null), ('722', '72', '', '18', '0.9', '1', '0', '0', '0', 'VAT Rate 18+0.9', '1', null, null), ('781', '78', '', '19', '0', '0', '0', '0', '0', 'VAT standard rate', '1', null, null), ('782', '78', '', '9', '0', '0', '0', '0', '0', 'VAT Rate 9', '1', null, null), ('783', '78', '', '5', '0', '0', '0', '0', '0', 'VAT Rate 5', '1', null, null), ('784', '78', '', '0', '0', '0', '0', '0', '0', 'VAT Rate 0', '1', null, null), ('801', '80', '', '25', '0', '0', '0', '0', '0', 'VAT standard rate', '1', null, null), ('802', '80', '', '0', '0', '0', '0', '0', '0', 'VAT Rate 0', '1', null, null), ('861', '86', '', '13', '0', '0', '0', '0', '0', 'IVA 13', '1', null, null), ('862', '86', '', '0', '0', '0', '0', '0', '0', 'SIN IVA', '1', null, null), ('1141', '114', '', '0', '0', '0', '0', '0', '0', 'No ISV', '1', null, null), ('1142', '114', '', '12', '0', '0', '0', '0', '0', 'ISV 12%', '1', null, null), ('1161', '116', '', '25.5', '0', '0', '0', '0', '0', 'VAT standard rate', '1', null, null), ('1162', '116', '', '7', '0', '0', '0', '0', '0', 'VAT reduced rate', '1', null, null), ('1163', '116', '', '0', '0', '0', '0', '0', '0', 'VAT rate 0', '1', null, null), ('1171', '117', '', '0', '0', '0', '0', '0', '0', 'VAT Rate 0', '0', null, null), ('1176', '117', 'C+S-18', '0', '9', '1', '9', '1', '0', 'CGST+SGST - Same state sales', '1', null, null), ('1177', '117', 'I-18', '18', '0', '0', '0', '0', '0', 'IGST', '1', null, null), ('1178', '117', 'C+S-5', '0', '2.5', '1', '2.5', '1', '0', 'CGST+SGST - Same state sales', '1', null, null), ('1179', '117', 'I-5', '5', '0', '0', '0', '0', '0', 'IGST', '1', null, null), ('1180', '117', 'C+S-12', '0', '6', '1', '6', '1', '0', 'CGST+SGST - Same state sales', '1', null, null), ('1181', '117', 'I-12', '12', '0', '0', '0', '0', '0', 'IGST', '1', null, null), ('1182', '117', 'C+S-28', '0', '14', '1', '14', '1', '0', 'CGST+SGST - Same state sales', '1', null, null), ('1183', '117', 'I-28', '28', '0', '0', '0', '0', '0', 'IGST', '1', null, null), ('1231', '123', '', '0', '0', '0', '0', '0', '0', 'VAT Rate 0', '1', null, null), ('1232', '123', '', '5', '0', '0', '0', '0', '0', 'VAT Rate 5', '1', null, null), ('1401', '140', '', '17', '0', '0', '0', '0', '0', 'VAT standard rate', '1', null, null), ('1402', '140', '', '14', '0', '0', '0', '0', '0', 'VAT intermediary rate', '1', null, null), ('1403', '140', '', '8', '0', '0', '0', '0', '0', 'VAT reduced rate', '1', null, null), ('1404', '140', '', '3', '0', '0', '0', '0', '0', 'VAT super-reduced rate', '1', null, null), ('1405', '140', '', '0', '0', '0', '0', '0', '0', 'VAT Rate 0', '1', null, null), ('1481', '148', '', '18', '0', '0', '0', '0', '0', 'VAT standard rate', '1', null, null), ('1482', '148', '', '7', '0', '0', '0', '0', '0', 'VAT reduced rate', '1', null, null), ('1483', '148', '', '5', '0', '0', '0', '0', '0', 'VAT super-reduced rate', '1', null, null), ('1484', '148', '', '0', '0', '0', '0', '0', '0', 'VAT Rate 0', '1', null, null), ('1511', '151', '', '0', '0', '0', '0', '0', '0', 'VAT Rate 0', '1', null, null), ('1512', '151', '', '14', '0', '0', '0', '0', '0', 'VAT Rate 14', '1', null, null), ('1521', '152', '', '0', '0', '0', '0', '0', '0', 'VAT Rate 0', '1', null, null), ('1522', '152', '', '15', '0', '0', '0', '0', '0', 'VAT Rate 15', '1', null, null), ('1541', '154', '', '0', '0', '0', '0', '0', '0', 'No VAT', '1', null, null), ('1542', '154', '', '16', '0', '0', '0', '0', '0', 'VAT 16%', '1', null, null), ('1543', '154', '', '10', '0', '0', '0', '0', '0', 'VAT Frontero', '1', null, null), ('1662', '166', '', '15', '0', '0', '0', '0', '0', 'VAT standard rate', '1', null, null), ('1663', '166', '', '0', '0', '0', '0', '0', '0', 'VAT Rate 0', '1', null, null), ('1692', '169', '', '5', '0', '0', '0', '0', '0', 'VAT standard rate', '1', null, null), ('1693', '169', '', '0', '0', '0', '0', '0', '0', 'VAT Rate 0', '1', null, null), ('1731', '173', '', '25', '0', '0', '0', '0', '0', 'VAT standard rate', '1', null, null), ('1732', '173', '', '14', '0', '0', '0', '0', '0', 'VAT reduced rate', '1', null, null), ('1733', '173', '', '8', '0', '0', '0', '0', '0', 'VAT reduced rate', '1', null, null), ('1734', '173', '', '0', '0', '0', '0', '0', '0', 'VAT Rate 0', '1', null, null), ('1781', '178', '', '7', '0', '0', '0', '0', '0', 'ITBMS standard rate', '1', null, null), ('1782', '178', '', '0', '0', '0', '0', '0', '0', 'ITBMS Rate 0', '1', null, null), ('1811', '181', '', '18', '0', '0', '0', '0', '0', 'VAT standard rate', '1', null, null), ('1812', '181', '', '0', '0', '0', '0', '0', '0', 'VAT Rate 0', '1', null, null), ('1841', '184', '', '23', '0', '0', '0', '0', '0', 'VAT standard rate', '1', null, null), ('1842', '184', '', '8', '0', '0', '0', '0', '0', 'VAT reduced rate', '1', null, null), ('1843', '184', '', '3', '0', '0', '0', '0', '0', 'VAT reduced rate', '1', null, null), ('1844', '184', '', '0', '0', '0', '0', '0', '0', 'VAT Rate 0', '1', null, null), ('1881', '188', '', '19', '0', '0', '0', '0', '0', 'VAT standard rate', '1', null, null), ('1882', '188', '', '9', '0', '0', '0', '0', '0', 'VAT reduced rate', '1', null, null), ('1883', '188', '', '0', '0', '0', '0', '0', '0', 'VAT Rate 0', '1', null, null), ('1884', '188', '', '5', '0', '0', '0', '0', '0', 'VAT reduced rate', '1', null, null), ('1931', '193', '', '0', '0', '0', '0', '0', '0', 'No VAT in SPM', '1', null, null), ('2011', '201', '', '19', '0', '0', '0', '0', '0', 'VAT standard rate', '1', null, null), ('2012', '201', '', '10', '0', '0', '0', '0', '0', 'VAT reduced rate', '1', null, null), ('2013', '201', '', '0', '0', '0', '0', '0', '0', 'VAT Rate 0', '1', null, null), ('2021', '202', '', '22', '0', '0', '0', '0', '0', 'VAT standard rate', '1', null, null), ('2022', '202', '', '9.5', '0', '0', '0', '0', '0', 'VAT reduced rate', '1', null, null), ('2023', '202', '', '0', '0', '0', '0', '0', '0', 'VAT Rate 0', '1', null, null), ('2051', '205', '', '15', '0', '0', '0', '0', '0', 'VAT standard rate', '1', null, null), ('2052', '205', '', '14', '0', '0', '0', '0', '0', 'VAT 14%', '1', null, null), ('2053', '205', '', '0', '0', '0', '0', '0', '0', 'VAT Rate 0', '1', null, null), ('2071', '207', '', '0', '0', '0', '0', '0', '0', 'VAT 0', '1', null, null), ('2072', '207', '', '15', '0', '0', '0', '0', '0', 'VAT 15%', '1', null, null), ('2131', '213', '', '5', '0', '0', '0', '0', '0', 'VAT 5%', '1', null, null), ('2132', '213', '', '0', '0', '0', '0', '0', '0', 'VAT 0', '1', null, null), ('2261', '226', '', '20', '0', '0', '0', '0', '0', 'VAT standart rate', '1', null, null), ('2262', '226', '', '0', '0', '0', '0', '0', '0', 'VAT Rate 0', '1', null, null), ('2321', '232', '', '0', '0', '0', '0', '0', '0', 'No VAT', '1', null, null), ('2322', '232', '', '12', '0', '0', '0', '0', '0', 'VAT 12%', '1', null, null), ('2323', '232', '', '8', '0', '0', '0', '0', '0', 'VAT 8%', '1', null, null), ('2461', '246', '', '0', '0', '0', '0', '0', '0', 'VAT Rate 0', '1', null, null), ('2462', '102', '', '24', '0', '0', '0', '0', '0', 'Κανονικός Φ.Π.Α.', '1', null, null), ('2463', '102', '', '0', '0', '0', '0', '0', '0', 'Μηδενικό Φ.Π.Α.', '1', null, null), ('2464', '102', '', '13', '0', '0', '0', '0', '0', 'Μειωμένος Φ.Π.Α.', '1', null, null), ('2465', '102', '', '6.5', '0', '0', '0', '0', '0', 'Υπερμειωμένος Φ.Π.Α.', '1', null, null), ('2466', '102', '', '16', '0', '0', '0', '0', '0', 'Νήσων κανονικός Φ.Π.Α.', '1', null, null), ('2467', '102', '', '9', '0', '0', '0', '0', '0', 'Νήσων μειωμένος Φ.Π.Α.', '1', null, null), ('2468', '102', '', '5', '0', '0', '0', '0', '0', 'Νήσων υπερμειωμένος Φ.Π.Α.', '1', null, null), ('2469', '1', '85', '8.5', '0', '0', '0', '0', '0', 'VAT standard rate (DOM sauf Guyane et Saint-Martin)', '0', null, null), ('2470', '1', '85NPR', '8.5', '0', '0', '0', '0', '1', 'VAT standard rate (DOM sauf Guyane et Saint-Martin), non perçu par le vendeur mais récupérable par acheteur', '0', null, null), ('2471', '1', '85NPROM', '8.5', '2', '3', '0', '0', '1', 'VAT standard rate (DOM sauf Guyane et Saint-Martin), NPR, Octroi de Mer', '0', null, null), ('2472', '1', '85NPROMOMR', '8.5', '2', '3', '2.5', '3', '1', 'VAT standard rate (DOM sauf Guyane et Saint-Martin), NPR, Octroi de Mer et Octroi de Mer Regional', '0', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `llx_c_type_contact`
-- ----------------------------
DROP TABLE IF EXISTS `llx_c_type_contact`;
CREATE TABLE `llx_c_type_contact` (
  `rowid` int(11) NOT NULL,
  `element` varchar(30) NOT NULL,
  `source` varchar(8) NOT NULL DEFAULT 'external',
  `code` varchar(32) NOT NULL,
  `libelle` varchar(64) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `module` varchar(32) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_type_contact_id` (`element`,`source`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_c_type_contact`
-- ----------------------------
BEGIN;
INSERT INTO `llx_c_type_contact` VALUES ('10', 'contrat', 'internal', 'SALESREPSIGN', 'Commercial signataire du contrat', '1', null, '0'), ('11', 'contrat', 'internal', 'SALESREPFOLL', 'Commercial suivi du contrat', '1', null, '0'), ('20', 'contrat', 'external', 'BILLING', 'Contact client facturation contrat', '1', null, '0'), ('21', 'contrat', 'external', 'CUSTOMER', 'Contact client suivi contrat', '1', null, '0'), ('22', 'contrat', 'external', 'SALESREPSIGN', 'Contact client signataire contrat', '1', null, '0'), ('31', 'propal', 'internal', 'SALESREPFOLL', 'Commercial à l\'origine de la propale', '1', null, '0'), ('40', 'propal', 'external', 'BILLING', 'Contact client facturation propale', '1', null, '0'), ('41', 'propal', 'external', 'CUSTOMER', 'Contact client suivi propale', '1', null, '0'), ('42', 'propal', 'external', 'SHIPPING', 'Contact client livraison propale', '1', null, '0'), ('50', 'facture', 'internal', 'SALESREPFOLL', 'Responsable suivi du paiement', '1', null, '0'), ('60', 'facture', 'external', 'BILLING', 'Contact client facturation', '1', null, '0'), ('61', 'facture', 'external', 'SHIPPING', 'Contact client livraison', '1', null, '0'), ('62', 'facture', 'external', 'SERVICE', 'Contact client prestation', '1', null, '0'), ('70', 'invoice_supplier', 'internal', 'SALESREPFOLL', 'Responsable suivi du paiement', '1', null, '0'), ('71', 'invoice_supplier', 'external', 'BILLING', 'Contact fournisseur facturation', '1', null, '0'), ('72', 'invoice_supplier', 'external', 'SHIPPING', 'Contact fournisseur livraison', '1', null, '0'), ('73', 'invoice_supplier', 'external', 'SERVICE', 'Contact fournisseur prestation', '1', null, '0'), ('80', 'agenda', 'internal', 'ACTOR', 'Responsable', '1', null, '0'), ('81', 'agenda', 'internal', 'GUEST', 'Guest', '1', null, '0'), ('85', 'agenda', 'external', 'ACTOR', 'Responsable', '1', null, '0'), ('86', 'agenda', 'external', 'GUEST', 'Guest', '1', null, '0'), ('91', 'commande', 'internal', 'SALESREPFOLL', 'Responsable suivi de la commande', '1', null, '0'), ('100', 'commande', 'external', 'BILLING', 'Contact client facturation commande', '1', null, '0'), ('101', 'commande', 'external', 'CUSTOMER', 'Contact client suivi commande', '1', null, '0'), ('102', 'commande', 'external', 'SHIPPING', 'Contact client livraison commande', '1', null, '0'), ('110', 'supplier_proposal', 'internal', 'SALESREPFOLL', 'Responsable suivi de la demande', '1', null, '0'), ('111', 'supplier_proposal', 'external', 'BILLING', 'Contact fournisseur facturation', '1', null, '0'), ('112', 'supplier_proposal', 'external', 'SHIPPING', 'Contact fournisseur livraison', '1', null, '0'), ('113', 'supplier_proposal', 'external', 'SERVICE', 'Contact fournisseur prestation', '1', null, '0'), ('120', 'fichinter', 'internal', 'INTERREPFOLL', 'Responsable suivi de l\'intervention', '1', null, '0'), ('121', 'fichinter', 'internal', 'INTERVENING', 'Intervenant', '1', null, '0'), ('130', 'fichinter', 'external', 'BILLING', 'Contact client facturation intervention', '1', null, '0'), ('131', 'fichinter', 'external', 'CUSTOMER', 'Contact client suivi de l\'intervention', '1', null, '0'), ('140', 'order_supplier', 'internal', 'SALESREPFOLL', 'Responsable suivi de la commande', '1', null, '0'), ('141', 'order_supplier', 'internal', 'SHIPPING', 'Responsable réception de la commande', '1', null, '0'), ('142', 'order_supplier', 'external', 'BILLING', 'Contact fournisseur facturation commande', '1', null, '0'), ('143', 'order_supplier', 'external', 'CUSTOMER', 'Contact fournisseur suivi commande', '1', null, '0'), ('145', 'order_supplier', 'external', 'SHIPPING', 'Contact fournisseur livraison commande', '1', null, '0'), ('150', 'dolresource', 'internal', 'USERINCHARGE', 'In charge of resource', '1', null, '0'), ('151', 'dolresource', 'external', 'THIRDINCHARGE', 'In charge of resource', '1', null, '0'), ('155', 'ticket', 'internal', 'SUPPORTTEC', 'Utilisateur contact support', '1', null, '0'), ('156', 'ticket', 'internal', 'CONTRIBUTOR', 'Intervenant', '1', null, '0'), ('157', 'ticket', 'external', 'SUPPORTCLI', 'Contact client suivi incident', '1', null, '0'), ('158', 'ticket', 'external', 'CONTRIBUTOR', 'Intervenant', '1', null, '0'), ('160', 'project', 'internal', 'PROJECTLEADER', 'Chef de Projet', '1', null, '0'), ('161', 'project', 'internal', 'PROJECTCONTRIBUTOR', 'Intervenant', '1', null, '0'), ('170', 'project', 'external', 'PROJECTLEADER', 'Chef de Projet', '1', null, '0'), ('171', 'project', 'external', 'PROJECTCONTRIBUTOR', 'Intervenant', '1', null, '0'), ('180', 'project_task', 'internal', 'TASKEXECUTIVE', 'Responsable', '1', null, '0'), ('181', 'project_task', 'internal', 'TASKCONTRIBUTOR', 'Intervenant', '1', null, '0'), ('190', 'project_task', 'external', 'TASKEXECUTIVE', 'Responsable', '1', null, '0'), ('191', 'project_task', 'external', 'TASKCONTRIBUTOR', 'Intervenant', '1', null, '0');
COMMIT;

-- ----------------------------
--  Table structure for `llx_c_type_container`
-- ----------------------------
DROP TABLE IF EXISTS `llx_c_type_container`;
CREATE TABLE `llx_c_type_container` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `label` varchar(64) NOT NULL,
  `module` varchar(32) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_type_container_id` (`code`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_c_type_container`
-- ----------------------------
BEGIN;
INSERT INTO `llx_c_type_container` VALUES ('1', 'page', '1', 'Page', 'system', '1'), ('2', 'banner', '1', 'Banner', 'system', '1'), ('3', 'blogpost', '1', 'BlogPost', 'system', '1'), ('4', 'other', '1', 'Other', 'system', '1'), ('9', 'menu', '1', 'Menu', 'system', '1');
COMMIT;

-- ----------------------------
--  Table structure for `llx_c_type_fees`
-- ----------------------------
DROP TABLE IF EXISTS `llx_c_type_fees`;
CREATE TABLE `llx_c_type_fees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(12) NOT NULL,
  `label` varchar(30) DEFAULT NULL,
  `type` int(11) DEFAULT '0',
  `accountancy_code` varchar(32) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `module` varchar(32) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_c_type_fees` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_c_type_fees`
-- ----------------------------
BEGIN;
INSERT INTO `llx_c_type_fees` VALUES ('1', 'TF_OTHER', 'Other', '0', null, '1', null, '0'), ('2', 'TF_TRIP', 'Transportation', '0', null, '1', null, '0'), ('3', 'TF_LUNCH', 'Lunch', '0', null, '1', null, '0'), ('4', 'EX_KME', 'ExpLabelKm', '0', null, '1', null, '0'), ('5', 'EX_FUE', 'ExpLabelFuelCV', '0', null, '0', null, '0'), ('6', 'EX_HOT', 'ExpLabelHotel', '0', null, '0', null, '0'), ('7', 'EX_PAR', 'ExpLabelParkingCV', '0', null, '0', null, '0'), ('8', 'EX_TOL', 'ExpLabelTollCV', '0', null, '0', null, '0'), ('9', 'EX_TAX', 'ExpLabelVariousTaxes', '0', null, '0', null, '0'), ('10', 'EX_IND', 'ExpLabelIndemnityTransSubscrip', '0', null, '0', null, '0'), ('11', 'EX_SUM', 'ExpLabelMaintenanceSupply', '0', null, '0', null, '0'), ('12', 'EX_SUO', 'ExpLabelOfficeSupplies', '0', null, '0', null, '0'), ('13', 'EX_CAR', 'ExpLabelCarRental', '0', null, '0', null, '0'), ('14', 'EX_DOC', 'ExpLabelDocumentation', '0', null, '0', null, '0'), ('15', 'EX_CUR', 'ExpLabelCustomersReceiving', '0', null, '0', null, '0'), ('16', 'EX_OTR', 'ExpLabelOtherReceiving', '0', null, '0', null, '0'), ('17', 'EX_POS', 'ExpLabelPostage', '0', null, '0', null, '0'), ('18', 'EX_CAM', 'ExpLabelMaintenanceRepairCV', '0', null, '0', null, '0'), ('19', 'EX_EMM', 'ExpLabelEmployeesMeal', '0', null, '0', null, '0'), ('20', 'EX_GUM', 'ExpLabelGuestsMeal', '0', null, '0', null, '0'), ('21', 'EX_BRE', 'ExpLabelBreakfast', '0', null, '0', null, '0'), ('22', 'EX_FUE_VP', 'ExpLabelFuelPV', '0', null, '0', null, '0'), ('23', 'EX_TOL_VP', 'ExpLabelTollPV', '0', null, '0', null, '0'), ('24', 'EX_PAR_VP', 'ExpLabelParkingPV', '0', null, '0', null, '0'), ('25', 'EX_CAM_VP', 'ExpLabelMaintenanceRepairPV', '0', null, '0', null, '0');
COMMIT;

-- ----------------------------
--  Table structure for `llx_c_type_resource`
-- ----------------------------
DROP TABLE IF EXISTS `llx_c_type_resource`;
CREATE TABLE `llx_c_type_resource` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(32) NOT NULL,
  `label` varchar(64) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_type_resource_id` (`label`,`code`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_c_type_resource`
-- ----------------------------
BEGIN;
INSERT INTO `llx_c_type_resource` VALUES ('1', 'RES_ROOMS', 'Rooms', '1'), ('2', 'RES_CARS', 'Cars', '1');
COMMIT;

-- ----------------------------
--  Table structure for `llx_c_typent`
-- ----------------------------
DROP TABLE IF EXISTS `llx_c_typent`;
CREATE TABLE `llx_c_typent` (
  `id` int(11) NOT NULL,
  `code` varchar(12) NOT NULL,
  `libelle` varchar(64) DEFAULT NULL,
  `fk_country` int(11) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `module` varchar(32) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_c_typent` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_c_typent`
-- ----------------------------
BEGIN;
INSERT INTO `llx_c_typent` VALUES ('0', 'TE_UNKNOWN', '-', null, '1', null, '0'), ('1', 'TE_STARTUP', 'Start-up', null, '0', null, '0'), ('2', 'TE_GROUP', 'Grand groupe', null, '1', null, '0'), ('3', 'TE_MEDIUM', 'PME/PMI', null, '1', null, '0'), ('4', 'TE_SMALL', 'TPE', null, '1', null, '0'), ('5', 'TE_ADMIN', 'Administration', null, '1', null, '0'), ('6', 'TE_WHOLE', 'Grossiste', null, '0', null, '0'), ('7', 'TE_RETAIL', 'Revendeur', null, '0', null, '0'), ('8', 'TE_PRIVATE', 'Particulier', null, '1', null, '0'), ('100', 'TE_OTHER', 'Autres', null, '1', null, '0'), ('231', 'TE_A_RI', 'Responsable Inscripto (typo A)', '23', '0', null, '0'), ('232', 'TE_B_RNI', 'Responsable No Inscripto (typo B)', '23', '0', null, '0'), ('233', 'TE_C_FE', 'Consumidor Final/Exento (typo C)', '23', '0', null, '0');
COMMIT;

-- ----------------------------
--  Table structure for `llx_c_units`
-- ----------------------------
DROP TABLE IF EXISTS `llx_c_units`;
CREATE TABLE `llx_c_units` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(3) DEFAULT NULL,
  `label` varchar(50) DEFAULT NULL,
  `short_label` varchar(5) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `scale` int(11) DEFAULT NULL,
  `unit_type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_c_units_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_c_units`
-- ----------------------------
BEGIN;
INSERT INTO `llx_c_units` VALUES ('1', 'P', 'piece', 'p', '1', null, null), ('2', 'SET', 'set', 'se', '1', null, null), ('3', 'S', 'second', 's', '1', null, 'time'), ('4', 'H', 'hour', 'h', '1', '3600', 'time'), ('5', 'D', 'day', 'd', '1', '86400', 'time'), ('6', 'KG', 'kilogram', 'kg', '1', '0', 'weight'), ('7', 'G', 'gram', 'g', '1', '-3', 'weight'), ('8', 'M', 'SizeUnitm', 'm', '1', '0', 'size'), ('9', 'LM', 'linear meter', 'lm', '0', '0', 'size'), ('10', 'M2', 'SurfaceUnitm2', 'm2', '1', '0', 'surface'), ('11', 'M3', 'VolumeUnitm3', 'm3', '1', '0', 'volume'), ('12', 'L', 'liter', 'l', '0', '-3', 'volume'), ('25', 'T', 'WeightUnitton', 'T', '1', '3', 'weight'), ('28', 'MG', 'WeightUnitmg', 'mg', '1', '-6', 'weight'), ('29', 'OZ', 'WeightUnitounce', 'Oz', '1', '98', 'weight'), ('30', 'LB', 'WeightUnitpound', 'lb', '1', '99', 'weight'), ('32', 'DM', 'SizeUnitdm', 'dm', '1', '-1', 'size'), ('33', 'CM', 'SizeUnitcm', 'cm', '1', '-2', 'size'), ('34', 'MM', 'SizeUnitmm', 'mm', '1', '-3', 'size'), ('35', 'FT', 'SizeUnitfoot', 'ft', '1', '98', 'size'), ('36', 'IN', 'SizeUnitinch', 'in', '1', '99', 'size'), ('38', 'DM2', 'SurfaceUnitdm2', 'dm2', '1', '-2', 'surface'), ('39', 'CM2', 'SurfaceUnitcm2', 'cm2', '1', '-4', 'surface'), ('40', 'MM2', 'SurfaceUnitmm2', 'mm2', '1', '-6', 'surface'), ('41', 'FT2', 'SurfaceUnitfoot2', 'ft2', '1', '98', 'surface'), ('42', 'IN2', 'SurfaceUnitinch2', 'in2', '1', '99', 'surface'), ('44', 'DM3', 'VolumeUnitdm3', 'dm3', '1', '-3', 'volume'), ('45', 'CM3', 'VolumeUnitcm3', 'cm3', '1', '-6', 'volume'), ('46', 'MM3', 'VolumeUnitmm3', 'mm3', '1', '-9', 'volume'), ('47', 'FT3', 'VolumeUnitfoot3', 'ft3', '1', '88', 'volume'), ('48', 'IN3', 'VolumeUnitinch3', 'in3', '1', '89', 'volume'), ('49', 'OZ3', 'VolumeUnitounce', 'Oz', '1', '97', 'volume'), ('51', 'GAL', 'VolumeUnitgallon', 'gal', '1', '99', 'volume'), ('55', 'MI', 'minute', 'i', '1', '60', 'time'), ('58', 'W', 'week', 'w', '1', '604800', 'time'), ('59', 'MO', 'month', 'm', '1', '2629800', 'time'), ('60', 'Y', 'year', 'y', '1', '31557600', 'time');
COMMIT;

-- ----------------------------
--  Table structure for `llx_c_ziptown`
-- ----------------------------
DROP TABLE IF EXISTS `llx_c_ziptown`;
CREATE TABLE `llx_c_ziptown` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(5) DEFAULT NULL,
  `fk_county` int(11) DEFAULT NULL,
  `fk_pays` int(11) NOT NULL DEFAULT '0',
  `zip` varchar(10) NOT NULL,
  `town` varchar(180) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_ziptown_fk_pays` (`zip`,`town`,`fk_pays`),
  KEY `idx_c_ziptown_fk_county` (`fk_county`),
  KEY `idx_c_ziptown_fk_pays` (`fk_pays`),
  KEY `idx_c_ziptown_zip` (`zip`),
  CONSTRAINT `fk_c_ziptown_fk_county` FOREIGN KEY (`fk_county`) REFERENCES `llx_c_departements` (`rowid`),
  CONSTRAINT `fk_c_ziptown_fk_pays` FOREIGN KEY (`fk_pays`) REFERENCES `llx_c_country` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_categorie`
-- ----------------------------
DROP TABLE IF EXISTS `llx_categorie`;
CREATE TABLE `llx_categorie` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `fk_parent` int(11) NOT NULL DEFAULT '0',
  `label` varchar(180) NOT NULL,
  `type` int(11) NOT NULL DEFAULT '1',
  `description` text,
  `color` varchar(8) DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `visible` tinyint(4) NOT NULL DEFAULT '1',
  `import_key` varchar(14) DEFAULT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_categorie_ref` (`entity`,`fk_parent`,`label`,`type`),
  KEY `idx_categorie_type` (`type`),
  KEY `idx_categorie_label` (`label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_categorie_account`
-- ----------------------------
DROP TABLE IF EXISTS `llx_categorie_account`;
CREATE TABLE `llx_categorie_account` (
  `fk_categorie` int(11) NOT NULL,
  `fk_account` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_account`),
  KEY `idx_categorie_account_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_account_fk_account` (`fk_account`),
  CONSTRAINT `fk_categorie_account_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_account_fk_account` FOREIGN KEY (`fk_account`) REFERENCES `llx_bank_account` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_categorie_actioncomm`
-- ----------------------------
DROP TABLE IF EXISTS `llx_categorie_actioncomm`;
CREATE TABLE `llx_categorie_actioncomm` (
  `fk_categorie` int(11) NOT NULL,
  `fk_actioncomm` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_actioncomm`),
  KEY `idx_categorie_actioncomm_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_actioncomm_fk_actioncomm` (`fk_actioncomm`),
  CONSTRAINT `fk_categorie_actioncomm_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_actioncomm_fk_actioncomm` FOREIGN KEY (`fk_actioncomm`) REFERENCES `llx_actioncomm` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_categorie_contact`
-- ----------------------------
DROP TABLE IF EXISTS `llx_categorie_contact`;
CREATE TABLE `llx_categorie_contact` (
  `fk_categorie` int(11) NOT NULL,
  `fk_socpeople` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_socpeople`),
  KEY `idx_categorie_contact_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_contact_fk_socpeople` (`fk_socpeople`),
  CONSTRAINT `fk_categorie_contact_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_contact_fk_socpeople` FOREIGN KEY (`fk_socpeople`) REFERENCES `llx_socpeople` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_categorie_fournisseur`
-- ----------------------------
DROP TABLE IF EXISTS `llx_categorie_fournisseur`;
CREATE TABLE `llx_categorie_fournisseur` (
  `fk_categorie` int(11) NOT NULL,
  `fk_soc` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_soc`),
  KEY `idx_categorie_fournisseur_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_fournisseur_fk_societe` (`fk_soc`),
  CONSTRAINT `fk_categorie_fournisseur_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_fournisseur_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_categorie_lang`
-- ----------------------------
DROP TABLE IF EXISTS `llx_categorie_lang`;
CREATE TABLE `llx_categorie_lang` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_category` int(11) NOT NULL DEFAULT '0',
  `lang` varchar(5) NOT NULL DEFAULT '0',
  `label` varchar(255) NOT NULL,
  `description` text,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_category_lang` (`fk_category`,`lang`),
  CONSTRAINT `fk_category_lang_fk_category` FOREIGN KEY (`fk_category`) REFERENCES `llx_categorie` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_categorie_member`
-- ----------------------------
DROP TABLE IF EXISTS `llx_categorie_member`;
CREATE TABLE `llx_categorie_member` (
  `fk_categorie` int(11) NOT NULL,
  `fk_member` int(11) NOT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_member`),
  KEY `idx_categorie_member_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_member_fk_member` (`fk_member`),
  CONSTRAINT `fk_categorie_member_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_member_member_rowid` FOREIGN KEY (`fk_member`) REFERENCES `llx_adherent` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_categorie_product`
-- ----------------------------
DROP TABLE IF EXISTS `llx_categorie_product`;
CREATE TABLE `llx_categorie_product` (
  `fk_categorie` int(11) NOT NULL,
  `fk_product` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_product`),
  KEY `idx_categorie_product_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_product_fk_product` (`fk_product`),
  CONSTRAINT `fk_categorie_product_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_product_product_rowid` FOREIGN KEY (`fk_product`) REFERENCES `llx_product` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_categorie_project`
-- ----------------------------
DROP TABLE IF EXISTS `llx_categorie_project`;
CREATE TABLE `llx_categorie_project` (
  `fk_categorie` int(11) NOT NULL,
  `fk_project` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_project`),
  KEY `idx_categorie_project_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_project_fk_project` (`fk_project`),
  CONSTRAINT `fk_categorie_project_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_project_fk_project_rowid` FOREIGN KEY (`fk_project`) REFERENCES `llx_projet` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_categorie_societe`
-- ----------------------------
DROP TABLE IF EXISTS `llx_categorie_societe`;
CREATE TABLE `llx_categorie_societe` (
  `fk_categorie` int(11) NOT NULL,
  `fk_soc` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_soc`),
  KEY `idx_categorie_societe_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_societe_fk_societe` (`fk_soc`),
  CONSTRAINT `fk_categorie_societe_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_societe_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_categorie_user`
-- ----------------------------
DROP TABLE IF EXISTS `llx_categorie_user`;
CREATE TABLE `llx_categorie_user` (
  `fk_categorie` int(11) NOT NULL,
  `fk_user` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_user`),
  KEY `idx_categorie_user_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_user_fk_user` (`fk_user`),
  CONSTRAINT `fk_categorie_user_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_user_fk_user` FOREIGN KEY (`fk_user`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_categorie_warehouse`
-- ----------------------------
DROP TABLE IF EXISTS `llx_categorie_warehouse`;
CREATE TABLE `llx_categorie_warehouse` (
  `fk_categorie` int(11) NOT NULL,
  `fk_warehouse` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_warehouse`),
  KEY `idx_categorie_warehouse_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_warehouse_fk_warehouse` (`fk_warehouse`),
  CONSTRAINT `fk_categorie_warehouse_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_warehouse_fk_warehouse_rowid` FOREIGN KEY (`fk_warehouse`) REFERENCES `llx_entrepot` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_categorie_website_page`
-- ----------------------------
DROP TABLE IF EXISTS `llx_categorie_website_page`;
CREATE TABLE `llx_categorie_website_page` (
  `fk_categorie` int(11) NOT NULL,
  `fk_website_page` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`fk_categorie`,`fk_website_page`),
  KEY `idx_categorie_website_page_fk_categorie` (`fk_categorie`),
  KEY `idx_categorie_website_page_fk_website_page` (`fk_website_page`),
  CONSTRAINT `fk_categorie_website_page_categorie_rowid` FOREIGN KEY (`fk_categorie`) REFERENCES `llx_categorie` (`rowid`),
  CONSTRAINT `fk_categorie_website_page_website_page_rowid` FOREIGN KEY (`fk_website_page`) REFERENCES `llx_website_page` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_categories_extrafields`
-- ----------------------------
DROP TABLE IF EXISTS `llx_categories_extrafields`;
CREATE TABLE `llx_categories_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_categories_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_chargesociales`
-- ----------------------------
DROP TABLE IF EXISTS `llx_chargesociales`;
CREATE TABLE `llx_chargesociales` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(16) DEFAULT NULL,
  `date_ech` datetime NOT NULL,
  `libelle` varchar(80) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_creation` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_type` int(11) NOT NULL,
  `fk_account` int(11) DEFAULT NULL,
  `fk_mode_reglement` int(11) DEFAULT NULL,
  `amount` double(24,8) NOT NULL DEFAULT '0.00000000',
  `paye` smallint(6) NOT NULL DEFAULT '0',
  `periode` date DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_commande`
-- ----------------------------
DROP TABLE IF EXISTS `llx_commande`;
CREATE TABLE `llx_commande` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `ref_ext` varchar(255) DEFAULT NULL,
  `ref_int` varchar(255) DEFAULT NULL,
  `ref_client` varchar(255) DEFAULT NULL,
  `fk_soc` int(11) NOT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_creation` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `date_cloture` datetime DEFAULT NULL,
  `date_commande` date DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_user_cloture` int(11) DEFAULT NULL,
  `source` smallint(6) DEFAULT NULL,
  `fk_statut` smallint(6) DEFAULT '0',
  `amount_ht` double(24,8) DEFAULT '0.00000000',
  `remise_percent` double DEFAULT '0',
  `remise_absolue` double DEFAULT '0',
  `remise` double DEFAULT '0',
  `tva` double(24,8) DEFAULT '0.00000000',
  `localtax1` double(24,8) DEFAULT '0.00000000',
  `localtax2` double(24,8) DEFAULT '0.00000000',
  `total_ht` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT '0.00000000',
  `note_private` text,
  `note_public` text,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `facture` tinyint(4) DEFAULT '0',
  `fk_account` int(11) DEFAULT NULL,
  `fk_currency` varchar(3) DEFAULT NULL,
  `fk_cond_reglement` int(11) DEFAULT NULL,
  `fk_mode_reglement` int(11) DEFAULT NULL,
  `date_livraison` datetime DEFAULT NULL,
  `fk_shipping_method` int(11) DEFAULT NULL,
  `fk_warehouse` int(11) DEFAULT NULL,
  `fk_availability` int(11) DEFAULT NULL,
  `fk_input_reason` int(11) DEFAULT NULL,
  `fk_delivery_address` int(11) DEFAULT NULL,
  `fk_incoterms` int(11) DEFAULT NULL,
  `location_incoterms` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT '1.00000000',
  `multicurrency_total_ht` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_tva` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ttc` double(24,8) DEFAULT '0.00000000',
  `module_source` varchar(32) DEFAULT NULL,
  `pos_source` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_commande_ref` (`ref`,`entity`),
  KEY `idx_commande_fk_soc` (`fk_soc`),
  KEY `idx_commande_fk_user_author` (`fk_user_author`),
  KEY `idx_commande_fk_user_valid` (`fk_user_valid`),
  KEY `idx_commande_fk_user_cloture` (`fk_user_cloture`),
  KEY `idx_commande_fk_projet` (`fk_projet`),
  KEY `idx_commande_fk_account` (`fk_account`),
  KEY `idx_commande_fk_currency` (`fk_currency`),
  CONSTRAINT `fk_commande_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `llx_projet` (`rowid`),
  CONSTRAINT `fk_commande_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_commande_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `fk_commande_fk_user_cloture` FOREIGN KEY (`fk_user_cloture`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `fk_commande_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_commande`
-- ----------------------------
BEGIN;
INSERT INTO `llx_commande` VALUES ('1', '(PROV1)', '1', null, null, '123', '1', null, '2021-05-07 23:23:10', '2021-05-08 04:44:13', null, null, '2021-05-07', '1', null, null, null, null, '0', '0.00000000', '0', null, '0', '37.20000000', '0.00000000', '0.00000000', '240.00000000', '277.20000000', '', '', 'custom_order', 'commande/(PROV1)/(PROV1).pdf', '0', null, null, null, null, null, '2', null, null, null, null, '0', '', null, null, '0', 'EUR', '1.00000000', '240.00000000', '37.20000000', '277.20000000', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `llx_commande_extrafields`
-- ----------------------------
DROP TABLE IF EXISTS `llx_commande_extrafields`;
CREATE TABLE `llx_commande_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `serie` varchar(255) DEFAULT NULL,
  `palets` int(10) DEFAULT NULL,
  `bultos` int(10) DEFAULT NULL,
  `peso` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_commande_extrafields` (`fk_object`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_commande_extrafields`
-- ----------------------------
BEGIN;
INSERT INTO `llx_commande_extrafields` VALUES ('1', '2021-05-07 21:44:13', '1', null, '0', '56', '67', '78');
COMMIT;

-- ----------------------------
--  Table structure for `llx_commande_fournisseur`
-- ----------------------------
DROP TABLE IF EXISTS `llx_commande_fournisseur`;
CREATE TABLE `llx_commande_fournisseur` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(180) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `ref_ext` varchar(255) DEFAULT NULL,
  `ref_supplier` varchar(255) DEFAULT NULL,
  `fk_soc` int(11) NOT NULL,
  `fk_projet` int(11) DEFAULT '0',
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_creation` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `date_approve` datetime DEFAULT NULL,
  `date_approve2` datetime DEFAULT NULL,
  `date_commande` date DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_user_approve` int(11) DEFAULT NULL,
  `fk_user_approve2` int(11) DEFAULT NULL,
  `source` smallint(6) NOT NULL,
  `fk_statut` smallint(6) DEFAULT '0',
  `billed` smallint(6) DEFAULT '0',
  `amount_ht` double(24,8) DEFAULT '0.00000000',
  `remise_percent` double DEFAULT '0',
  `remise` double DEFAULT '0',
  `tva` double(24,8) DEFAULT '0.00000000',
  `localtax1` double(24,8) DEFAULT '0.00000000',
  `localtax2` double(24,8) DEFAULT '0.00000000',
  `total_ht` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT '0.00000000',
  `note_private` text,
  `note_public` text,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `date_livraison` datetime DEFAULT NULL,
  `fk_account` int(11) DEFAULT NULL,
  `fk_cond_reglement` int(11) DEFAULT NULL,
  `fk_mode_reglement` int(11) DEFAULT NULL,
  `fk_input_method` int(11) DEFAULT '0',
  `fk_incoterms` int(11) DEFAULT NULL,
  `location_incoterms` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT '1.00000000',
  `multicurrency_total_ht` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_tva` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ttc` double(24,8) DEFAULT '0.00000000',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_commande_fournisseur_ref` (`ref`,`fk_soc`,`entity`),
  KEY `idx_commande_fournisseur_fk_soc` (`fk_soc`),
  KEY `billed` (`billed`),
  CONSTRAINT `fk_commande_fournisseur_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_commande_fournisseur_dispatch`
-- ----------------------------
DROP TABLE IF EXISTS `llx_commande_fournisseur_dispatch`;
CREATE TABLE `llx_commande_fournisseur_dispatch` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_commande` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `fk_commandefourndet` int(11) DEFAULT NULL,
  `qty` float DEFAULT NULL,
  `fk_entrepot` int(11) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `batch` varchar(128) DEFAULT NULL,
  `eatby` date DEFAULT NULL,
  `sellby` date DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_projet` int(11) DEFAULT NULL,
  `fk_reception` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_commande_fournisseur_dispatch_fk_commande` (`fk_commande`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_commande_fournisseur_dispatch_extrafields`
-- ----------------------------
DROP TABLE IF EXISTS `llx_commande_fournisseur_dispatch_extrafields`;
CREATE TABLE `llx_commande_fournisseur_dispatch_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_commande_fournisseur_dispatch_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_commande_fournisseur_extrafields`
-- ----------------------------
DROP TABLE IF EXISTS `llx_commande_fournisseur_extrafields`;
CREATE TABLE `llx_commande_fournisseur_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `serie` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_commande_fournisseur_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_commande_fournisseur_log`
-- ----------------------------
DROP TABLE IF EXISTS `llx_commande_fournisseur_log`;
CREATE TABLE `llx_commande_fournisseur_log` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datelog` datetime NOT NULL,
  `fk_commande` int(11) NOT NULL,
  `fk_statut` smallint(6) NOT NULL,
  `fk_user` int(11) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_commande_fournisseurdet`
-- ----------------------------
DROP TABLE IF EXISTS `llx_commande_fournisseurdet`;
CREATE TABLE `llx_commande_fournisseurdet` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_commande` int(11) NOT NULL,
  `fk_parent_line` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `ref` varchar(50) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` text,
  `vat_src_code` varchar(10) DEFAULT '',
  `tva_tx` double(6,3) DEFAULT '0.000',
  `localtax1_tx` double(6,3) DEFAULT '0.000',
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(6,3) DEFAULT '0.000',
  `localtax2_type` varchar(10) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT '0',
  `remise` double DEFAULT '0',
  `subprice` double(24,8) DEFAULT '0.00000000',
  `total_ht` double(24,8) DEFAULT '0.00000000',
  `total_tva` double(24,8) DEFAULT '0.00000000',
  `total_localtax1` double(24,8) DEFAULT '0.00000000',
  `total_localtax2` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT '0.00000000',
  `product_type` int(11) DEFAULT '0',
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `info_bits` int(11) DEFAULT '0',
  `special_code` int(11) DEFAULT '0',
  `rang` int(11) DEFAULT '0',
  `import_key` varchar(14) DEFAULT NULL,
  `fk_unit` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ht` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_tva` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ttc` double(24,8) DEFAULT '0.00000000',
  PRIMARY KEY (`rowid`),
  KEY `fk_commande_fournisseurdet_fk_unit` (`fk_unit`),
  KEY `idx_commande_fournisseurdet_fk_commande` (`fk_commande`),
  KEY `idx_commande_fournisseurdet_fk_product` (`fk_product`),
  CONSTRAINT `fk_commande_fournisseurdet_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `llx_c_units` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_commande_fournisseurdet_extrafields`
-- ----------------------------
DROP TABLE IF EXISTS `llx_commande_fournisseurdet_extrafields`;
CREATE TABLE `llx_commande_fournisseurdet_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_commande_fournisseurdet_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_commandedet`
-- ----------------------------
DROP TABLE IF EXISTS `llx_commandedet`;
CREATE TABLE `llx_commandedet` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_commande` int(11) NOT NULL,
  `fk_parent_line` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `description` text,
  `vat_src_code` varchar(10) DEFAULT '',
  `tva_tx` double(6,3) DEFAULT NULL,
  `localtax1_tx` double(6,3) DEFAULT '0.000',
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(6,3) DEFAULT '0.000',
  `localtax2_type` varchar(10) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT '0',
  `remise` double DEFAULT '0',
  `fk_remise_except` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `subprice` double(24,8) DEFAULT '0.00000000',
  `total_ht` double(24,8) DEFAULT '0.00000000',
  `total_tva` double(24,8) DEFAULT '0.00000000',
  `total_localtax1` double(24,8) DEFAULT '0.00000000',
  `total_localtax2` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT '0.00000000',
  `product_type` int(11) DEFAULT '0',
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `info_bits` int(11) DEFAULT '0',
  `buy_price_ht` double(24,8) DEFAULT '0.00000000',
  `fk_product_fournisseur_price` int(11) DEFAULT NULL,
  `special_code` int(11) DEFAULT '0',
  `rang` int(11) DEFAULT '0',
  `fk_unit` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `fk_commandefourndet` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ht` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_tva` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ttc` double(24,8) DEFAULT '0.00000000',
  PRIMARY KEY (`rowid`),
  KEY `idx_commandedet_fk_commande` (`fk_commande`),
  KEY `idx_commandedet_fk_product` (`fk_product`),
  KEY `fk_commandedet_fk_unit` (`fk_unit`),
  KEY `fk_commandedet_fk_commandefourndet` (`fk_commandefourndet`),
  CONSTRAINT `fk_commandedet_fk_commande` FOREIGN KEY (`fk_commande`) REFERENCES `llx_commande` (`rowid`),
  CONSTRAINT `fk_commandedet_fk_commandefourndet` FOREIGN KEY (`fk_commandefourndet`) REFERENCES `llx_commande_fournisseurdet` (`rowid`),
  CONSTRAINT `fk_commandedet_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `llx_c_units` (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_commandedet`
-- ----------------------------
BEGIN;
INSERT INTO `llx_commandedet` VALUES ('1', '1', null, '1', null, '', 'Descripci&oacute;n: <strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', '', '21.000', '0.000', '3', '0.000', '5', '1', '0', '0', null, '120', '120.00000000', '120.00000000', '25.20000000', '0.00000000', '0.00000000', '145.20000000', '0', null, null, '0', '0.00000000', null, '0', '1', null, null, null, null, 'EUR', '120.00000000', '120.00000000', '25.20000000', '145.20000000'), ('2', '1', null, '1', null, '', 'Descripci&oacute;n: <strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.<br />\r\nfff', '', '10.000', '0.000', '3', '0.000', '5', '1', '0', '0', null, '120', '120.00000000', '120.00000000', '12.00000000', '0.00000000', '0.00000000', '132.00000000', '0', null, null, '0', '0.00000000', null, '0', '2', null, null, null, null, 'EUR', '120.00000000', '120.00000000', '12.00000000', '132.00000000');
COMMIT;

-- ----------------------------
--  Table structure for `llx_commandedet_extrafields`
-- ----------------------------
DROP TABLE IF EXISTS `llx_commandedet_extrafields`;
CREATE TABLE `llx_commandedet_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `ordfabr` varchar(25) DEFAULT NULL,
  `numped` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_commandedet_extrafields` (`fk_object`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_commandedet_extrafields`
-- ----------------------------
BEGIN;
INSERT INTO `llx_commandedet_extrafields` VALUES ('1', '2021-05-07 21:48:47', '1', null, null, null), ('5', '2021-05-08 06:20:05', '2', null, 'Hola', 'Adios');
COMMIT;

-- ----------------------------
--  Table structure for `llx_comment`
-- ----------------------------
DROP TABLE IF EXISTS `llx_comment`;
CREATE TABLE `llx_comment` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `description` text NOT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_element` int(11) DEFAULT NULL,
  `element_type` varchar(50) DEFAULT NULL,
  `entity` int(11) DEFAULT '1',
  `import_key` varchar(125) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_const`
-- ----------------------------
DROP TABLE IF EXISTS `llx_const`;
CREATE TABLE `llx_const` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(180) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `value` text NOT NULL,
  `type` varchar(64) DEFAULT 'string',
  `visible` tinyint(4) NOT NULL DEFAULT '1',
  `note` text,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_const` (`name`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=535 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_const`
-- ----------------------------
BEGIN;
INSERT INTO `llx_const` VALUES ('2', 'MAIN_FEATURES_LEVEL', '0', '0', 'chaine', '1', 'Level of features to show: -1=stable+deprecated, 0=stable only (default), 1=stable+experimental, 2=stable+experimental+development', '2021-04-28 08:55:26'), ('3', 'MAILING_LIMIT_SENDBYWEB', '0', '25', 'chaine', '1', 'Number of targets to defined packet size when sending mass email', '2021-04-28 08:55:26'), ('4', 'MAIN_ENABLE_LOG_TO_HTML', '0', '0', 'chaine', '1', 'If this option is set to 1, it is possible to see log output at end of HTML sources by adding paramater logtohtml=1 on URL. Module log must also be enabled.', '2021-04-28 08:55:26'), ('5', 'MAIN_SECURITY_CSRF_WITH_TOKEN', '0', '0', 'chaine', '1', 'If this option is set to 1, a CSRF protection using an antiCSRF token is added.', '2021-04-28 08:55:26'), ('6', 'SYSLOG_HANDLERS', '0', '[\"mod_syslog_file\"]', 'chaine', '0', 'Which logger to use', '2021-04-28 08:55:26'), ('7', 'SYSLOG_FILE', '0', 'DOL_DATA_ROOT/dolibarr.log', 'chaine', '0', 'Directory where to write log file', '2021-04-28 08:55:26'), ('8', 'SYSLOG_LEVEL', '0', '7', 'chaine', '0', 'Level of debug info to show', '2021-04-28 08:55:26'), ('9', 'MAIN_UPLOAD_DOC', '0', '2048', 'chaine', '0', 'Max size for file upload (0 means no upload allowed)', '2021-04-28 08:55:26'), ('10', 'MAIN_ENABLE_OVERWRITE_TRANSLATION', '1', '1', 'chaine', '0', 'Enable translation overwrite', '2021-04-28 08:55:26'), ('11', 'MAIN_ENABLE_DEFAULT_VALUES', '1', '1', 'chaine', '0', 'Enable default value overwrite', '2021-04-28 08:55:26'), ('16', 'MAIN_SIZE_LISTE_LIMIT', '0', '25', 'chaine', '0', 'Longueur maximum des listes', '2021-04-28 08:55:26'), ('17', 'MAIN_SIZE_SHORTLIST_LIMIT', '0', '3', 'chaine', '0', 'Longueur maximum des listes courtes (fiche client)', '2021-04-28 08:55:26'), ('18', 'MAIN_MENU_STANDARD', '0', 'eldy_menu.php', 'chaine', '0', 'Menu manager for internal users', '2021-04-28 08:55:26'), ('19', 'MAIN_MENUFRONT_STANDARD', '0', 'eldy_menu.php', 'chaine', '0', 'Menu manager for external users', '2021-04-28 08:55:26'), ('20', 'MAIN_MENU_SMARTPHONE', '0', 'eldy_menu.php', 'chaine', '0', 'Menu manager for internal users using smartphones', '2021-04-28 08:55:26'), ('21', 'MAIN_MENUFRONT_SMARTPHONE', '0', 'eldy_menu.php', 'chaine', '0', 'Menu manager for external users using smartphones', '2021-04-28 08:55:26'), ('22', 'MAIN_DELAY_ACTIONS_TODO', '1', '7', 'chaine', '0', 'Tolérance de retard avant alerte (en jours) sur actions planifiées non réalisées', '2021-04-28 08:55:26'), ('23', 'MAIN_DELAY_ORDERS_TO_PROCESS', '1', '2', 'chaine', '0', 'Tolérance de retard avant alerte (en jours) sur commandes clients non traitées', '2021-04-28 08:55:26'), ('24', 'MAIN_DELAY_SUPPLIER_ORDERS_TO_PROCESS', '1', '7', 'chaine', '0', 'Tolérance de retard avant alerte (en jours) sur commandes fournisseurs non traitées', '2021-04-28 08:55:26'), ('25', 'MAIN_DELAY_PROPALS_TO_CLOSE', '1', '31', 'chaine', '0', 'Tolérance de retard avant alerte (en jours) sur propales à cloturer', '2021-04-28 08:55:26'), ('26', 'MAIN_DELAY_PROPALS_TO_BILL', '1', '7', 'chaine', '0', 'Tolérance de retard avant alerte (en jours) sur propales non facturées', '2021-04-28 08:55:26'), ('27', 'MAIN_DELAY_CUSTOMER_BILLS_UNPAYED', '1', '31', 'chaine', '0', 'Tolérance de retard avant alerte (en jours) sur factures client impayées', '2021-04-28 08:55:26'), ('28', 'MAIN_DELAY_SUPPLIER_BILLS_TO_PAY', '1', '2', 'chaine', '0', 'Tolérance de retard avant alerte (en jours) sur factures fournisseur impayées', '2021-04-28 08:55:26'), ('29', 'MAIN_DELAY_NOT_ACTIVATED_SERVICES', '1', '0', 'chaine', '0', 'Tolérance de retard avant alerte (en jours) sur services à activer', '2021-04-28 08:55:26'), ('30', 'MAIN_DELAY_RUNNING_SERVICES', '1', '0', 'chaine', '0', 'Tolérance de retard avant alerte (en jours) sur services expirés', '2021-04-28 08:55:26'), ('31', 'MAIN_DELAY_MEMBERS', '1', '31', 'chaine', '0', 'Tolérance de retard avant alerte (en jours) sur cotisations adhérent en retard', '2021-04-28 08:55:26'), ('32', 'MAIN_DELAY_TRANSACTIONS_TO_CONCILIATE', '1', '62', 'chaine', '0', 'Tolérance de retard avant alerte (en jours) sur rapprochements bancaires à faire', '2021-04-28 08:55:26'), ('33', 'MAIN_DELAY_EXPENSEREPORTS_TO_PAY', '1', '31', 'chaine', '0', 'Tolérance de retard avant alerte (en jours) sur les notes de frais impayées', '2021-04-28 08:55:26'), ('34', 'MAIN_FIX_FOR_BUGGED_MTA', '1', '1', 'chaine', '1', 'Set constant to fix email ending from PHP with some linux ike system', '2021-04-28 08:55:26'), ('35', 'MAILING_EMAIL_FROM', '1', 'dolibarr@domain.com', 'chaine', '0', 'EMail emmetteur pour les envois d emailings', '2021-04-28 08:55:26'), ('36', 'PRODUCT_ADDON_PDF_ODT_PATH', '1', 'DOL_DATA_ROOT/doctemplates/products', 'chaine', '0', null, '2021-04-28 08:55:26'), ('37', 'CONTRACT_ADDON_PDF_ODT_PATH', '1', 'DOL_DATA_ROOT/doctemplates/contracts', 'chaine', '0', null, '2021-04-28 08:55:26'), ('38', 'USERGROUP_ADDON_PDF_ODT_PATH', '1', 'DOL_DATA_ROOT/doctemplates/usergroups', 'chaine', '0', null, '2021-04-28 08:55:26'), ('39', 'USER_ADDON_PDF_ODT_PATH', '1', 'DOL_DATA_ROOT/doctemplates/users', 'chaine', '0', null, '2021-04-28 08:55:26'), ('80', 'DATABASE_PWD_ENCRYPTED', '1', '1', 'chaine', '0', '', '2021-04-28 08:55:49'), ('81', 'MAIN_SECURITY_SALT', '0', '20210428135549', 'chaine', '0', '', '2021-04-28 08:55:49'), ('82', 'MAIN_SECURITY_HASH_ALGO', '0', 'password_hash', 'chaine', '0', '', '2021-04-28 08:55:49'), ('83', 'MAIN_VERSION_FIRST_INSTALL', '0', '8.0.6', 'chaine', '0', 'Dolibarr version when first install', '2021-04-28 08:55:49'), ('84', 'MAIN_VERSION_LAST_INSTALL', '0', '8.0.6', 'chaine', '0', 'Dolibarr version when last install', '2021-04-28 08:55:49'), ('99', 'SOCIETE_CODECLIENT_ADDON', '1', 'mod_codeclient_monkey', 'chaine', '0', 'Module to control third parties codes', '2021-04-28 08:58:11'), ('100', 'SOCIETE_CODECOMPTA_ADDON', '1', 'mod_codecompta_panicum', 'chaine', '0', 'Module to control third parties codes', '2021-04-28 08:58:11'), ('101', 'COMPANY_ADDON_PDF_ODT_PATH', '1', 'DOL_DATA_ROOT/doctemplates/thirdparties', 'chaine', '0', null, '2021-04-28 08:58:11'), ('102', 'SOCIETE_ADD_REF_IN_LIST', '1', '0', 'yesno', '0', 'Display customer ref into select list', '2021-04-28 08:58:11'), ('105', 'FACTURE_ADDON_PDF', '1', 'crabe', 'chaine', '0', 'Name of PDF model of invoice', '2021-04-28 08:58:15'), ('106', 'FACTURE_ADDON_PDF_ODT_PATH', '1', 'DOL_DATA_ROOT/doctemplates/invoices', 'chaine', '0', null, '2021-04-28 08:58:15'), ('107', 'MAIN_MODULE_PRODUCT', '1', '1', 'string', '0', '{\"authorid\":\"1\",\"ip\":\"81.35.126.40\"}', '2021-04-28 09:14:03'), ('108', 'PRODUCT_CODEPRODUCT_ADDON', '1', 'mod_codeproduct_leopard', 'chaine', '0', 'Module to control product codes', '2021-04-28 09:14:03'), ('110', 'MAIN_MODULE_STOCK', '1', '1', 'string', '0', '{\"authorid\":\"1\",\"ip\":\"81.35.126.40\"}', '2021-04-28 09:14:07'), ('111', 'STOCK_ALLOW_NEGATIVE_TRANSFER', '1', '1', 'chaine', '1', null, '2021-04-28 09:14:07'), ('112', 'STOCK_ADDON_PDF', '1', 'Standard', 'chaine', '0', 'Name of PDF model of stock', '2021-04-28 09:14:07'), ('113', 'MOUVEMENT_ADDON_PDF', '1', 'StdMouvement', 'chaine', '0', 'Name of PDF model of stock mouvement', '2021-04-28 09:14:07'), ('114', 'STOCK_ADDON_PDF_ODT_PATH', '1', 'DOL_DATA_ROOT/doctemplates/stocks', 'chaine', '0', null, '2021-04-28 09:14:07'), ('115', 'MOUVEMENT_ADDON_PDF_ODT_PATH', '1', 'DOL_DATA_ROOT/doctemplates/stocks/mouvements', 'chaine', '0', null, '2021-04-28 09:14:07'), ('116', 'MAIN_MODULE_PRODUCTBATCH', '1', '1', 'string', '0', '{\"authorid\":\"1\",\"ip\":\"81.35.126.40\"}', '2021-04-28 09:14:09'), ('117', 'MAIN_MODULE_EXPEDITION', '1', '1', 'string', '0', '{\"authorid\":\"1\",\"ip\":\"81.35.126.40\"}', '2021-04-28 09:14:09'), ('118', 'EXPEDITION_ADDON_PDF', '1', 'rouget', 'chaine', '0', 'Nom du gestionnaire de generation des bons expeditions en PDF', '2021-04-28 09:14:09'), ('119', 'EXPEDITION_ADDON_NUMBER', '1', 'mod_expedition_safor', 'chaine', '0', 'Name for numbering manager for shipments', '2021-04-28 09:14:09'), ('120', 'EXPEDITION_ADDON_PDF_ODT_PATH', '1', 'DOL_DATA_ROOT/doctemplates/shipment', 'chaine', '0', null, '2021-04-28 09:14:09'), ('121', 'LIVRAISON_ADDON_PDF', '1', 'typhon', 'chaine', '0', 'Nom du gestionnaire de generation des bons de reception en PDF', '2021-04-28 09:14:09'), ('122', 'DELIVERY_ADDON_NUMBER', '1', 'mod_delivery_jade', 'chaine', '0', 'Nom du gestionnaire de numerotation des bons de reception', '2021-05-06 04:49:10'), ('123', 'LIVRAISON_ADDON_PDF_ODT_PATH', '1', 'DOL_DATA_ROOT/doctemplates/delivery', 'chaine', '0', null, '2021-04-28 09:14:09'), ('124', 'MAIN_SUBMODULE_EXPEDITION', '1', '1', 'chaine', '0', 'Enable shipments', '2021-04-28 09:14:09'), ('126', 'COMMANDE_ADDON_PDF', '1', 'einstein', 'chaine', '0', 'Name of PDF model of order', '2021-04-28 09:14:09'), ('127', 'COMMANDE_ADDON', '1', 'mod_commande_marbre', 'chaine', '0', 'Name of numbering numerotation rules of order', '2021-04-28 09:14:09'), ('128', 'COMMANDE_ADDON_PDF_ODT_PATH', '1', 'DOL_DATA_ROOT/doctemplates/orders', 'chaine', '0', null, '2021-04-28 09:14:09'), ('130', 'COMMANDE_SUPPLIER_ADDON_PDF', '1', 'muscadet', 'chaine', '0', 'Nom du gestionnaire de generation des bons de commande en PDF', '2021-04-28 09:14:09'), ('131', 'COMMANDE_SUPPLIER_ADDON_NUMBER', '1', 'mod_commande_fournisseur_muguet', 'chaine', '0', 'Nom du gestionnaire de numerotation des commandes fournisseur', '2021-04-28 09:14:09'), ('132', 'INVOICE_SUPPLIER_ADDON_NUMBER', '1', 'mod_facture_fournisseur_cactus', 'chaine', '0', 'Nom du gestionnaire de numerotation des factures fournisseur', '2021-04-28 09:14:09'), ('133', 'INVOICE_CAN_ALWAYS_BE_EDITED', '1', '1', 'chaine', '1', '', '2021-05-06 04:30:29'), ('135', 'FACTURE_SENDBYEMAIL_FOR_ALL_STATUS', '1', '1', 'chaine', '1', '', '2021-05-06 04:30:37'), ('138', 'MAIN_PDF_ADDALSOTARGETDETAILS', '1', '1', 'chaine', '1', '', '2021-05-06 04:30:50'), ('140', 'MAIN_HELPCENTER_LINKTOUSE', '1', 'https://www.serboweb.com/soporte.php', 'chaine', '1', '', '2021-05-06 04:31:14'), ('161', 'EXPENSEREPORT_ADDON_PDF', '1', 'standard', 'chaine', '0', 'Name of manager to build PDF expense reports documents', '2021-05-06 04:33:47'), ('162', 'EXPENSEREPORT_ADDON', '1', 'mod_expensereport_jade', 'chaine', '0', 'Name of manager to generate expense report ref number', '2021-05-06 04:33:47'), ('163', 'MAIN_DELAY_EXPENSEREPORTS', '1', '15', 'chaine', '0', 'Tolerance delay (in days) before alert for expense reports to approve', '2021-05-06 04:33:47'), ('165', 'MAIN_MODULE_PROPALE', '1', '1', 'string', '0', '{\"authorid\":\"1\",\"ip\":\"81.35.126.40\"}', '2021-05-06 04:33:52'), ('166', 'PROPALE_ADDON_PDF', '1', 'azur', 'chaine', '0', 'Name of the proposal generation manager in PDF format', '2021-05-06 04:33:52'), ('167', 'PROPALE_ADDON', '1', 'mod_propale_marbre', 'chaine', '0', 'Name of proposal numbering manager', '2021-05-06 04:33:52'), ('168', 'PROPALE_VALIDITY_DURATION', '1', '15', 'chaine', '0', 'Duration of validity of business proposals', '2021-05-06 04:33:52'), ('169', 'PROPALE_ADDON_PDF_ODT_PATH', '1', 'DOL_DATA_ROOT/doctemplates/proposals', 'chaine', '0', null, '2021-05-06 04:33:52'), ('170', 'MAIN_MODULE_CONTRAT', '1', '1', 'string', '0', '{\"authorid\":\"1\",\"ip\":\"81.35.126.40\"}', '2021-05-06 04:33:56'), ('171', 'CONTRACT_ADDON', '1', 'mod_contract_serpis', 'chaine', '0', 'Nom du gestionnaire de numerotation des contrats', '2021-05-06 04:33:56'), ('172', 'CONTRACT_ADDON_PDF', '1', 'strato', 'chaine', '0', 'Name of PDF model of contract', '2021-05-06 04:33:56'), ('173', 'MAIN_MODULE_SUPPLIERPROPOSAL', '1', '1', 'string', '0', '{\"authorid\":\"1\",\"ip\":\"81.35.126.40\"}', '2021-05-06 04:34:01'), ('174', 'SUPPLIER_PROPOSAL_ADDON_PDF', '1', 'aurore', 'chaine', '0', 'Name of submodule to generate PDF for supplier quotation request', '2021-05-06 04:34:01'), ('175', 'SUPPLIER_PROPOSAL_ADDON', '1', 'mod_supplier_proposal_marbre', 'chaine', '0', 'Name of submodule to number supplier quotation request', '2021-05-06 04:34:01'), ('176', 'SUPPLIER_PROPOSAL_ADDON_PDF_ODT_PATH', '1', 'DOL_DATA_ROOT/doctemplates/supplier_proposal', 'chaine', '0', null, '2021-05-06 04:34:01'), ('177', 'MAIN_MODULE_INCOTERM', '1', '1', 'string', '0', '{\"authorid\":\"1\",\"ip\":\"81.35.126.40\"}', '2021-05-06 04:34:03'), ('178', 'INCOTERM_ACTIVATE', '1', '', 'chaine', '0', 'Description de INCOTERM_ACTIVATE', '2021-05-06 04:34:03'), ('179', 'MAIN_MODULE_TAX', '1', '1', 'string', '0', '{\"authorid\":\"1\",\"ip\":\"81.35.126.40\"}', '2021-05-06 04:34:06'), ('181', 'SALARIES_ACCOUNTING_ACCOUNT_PAYMENT', '1', '421', 'chaine', '0', null, '2021-05-06 04:34:09'), ('182', 'SALARIES_ACCOUNTING_ACCOUNT_CHARGE', '1', '641', 'chaine', '0', null, '2021-05-06 04:34:09'), ('183', 'MAIN_MODULE_LOAN', '1', '1', 'string', '0', '{\"authorid\":\"1\",\"ip\":\"81.35.126.40\"}', '2021-05-06 04:34:10'), ('184', 'LOAN_ACCOUNTING_ACCOUNT_CAPITAL', '1', '164', 'chaine', '0', null, '2021-05-06 04:34:10'), ('185', 'LOAN_ACCOUNTING_ACCOUNT_INSURANCE', '1', '6162', 'chaine', '0', null, '2021-05-06 04:34:10'), ('186', 'MAIN_MODULE_BANQUE', '1', '1', 'string', '0', '{\"authorid\":\"1\",\"ip\":\"81.35.126.40\"}', '2021-05-06 04:34:12'), ('187', 'MAIN_MODULE_PRELEVEMENT', '1', '1', 'string', '0', '{\"authorid\":\"1\",\"ip\":\"81.35.126.40\"}', '2021-05-06 04:34:15'), ('188', 'BANK_ADDON_PDF', '1', 'sepamandate', 'chaine', '0', 'Name of manager to generate SEPA mandate', '2021-05-06 04:34:15'), ('189', 'MAIN_MODULE_MARGIN', '1', '1', 'string', '0', '{\"authorid\":\"1\",\"ip\":\"81.35.126.40\"}', '2021-05-06 04:34:18'), ('190', 'MAIN_MODULE_MARGIN_TABS_0', '1', 'product:+margin:Margins:margins:$user->rights->margins->liretous:/margin/tabs/productMargins.php?id=__ID__', 'chaine', '0', null, '2021-05-06 04:34:18'), ('191', 'MAIN_MODULE_MARGIN_TABS_1', '1', 'thirdparty:+margin:Margins:margins:empty($user->societe_id) && $user->rights->margins->liretous && ($object->client > 0):/margin/tabs/thirdpartyMargins.php?socid=__ID__', 'chaine', '0', null, '2021-05-06 04:34:18'), ('192', 'MARGIN_TYPE', '1', 'costprice', 'chaine', '0', 'Rule for margin calculation by default', '2021-05-06 04:34:18'), ('193', 'MAIN_MODULE_COMPTABILITE', '1', '1', 'string', '0', '{\"authorid\":\"1\",\"ip\":\"81.35.126.40\"}', '2021-05-06 04:34:20'), ('195', 'MAIN_AGENDA_ACTIONAUTO_COMPANY_CREATE', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('196', 'MAIN_AGENDA_ACTIONAUTO_COMPANY_SENTBYMAIL', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('197', 'MAIN_AGENDA_ACTIONAUTO_PROPAL_VALIDATE', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('198', 'MAIN_AGENDA_ACTIONAUTO_PROPAL_CLOSE_SIGNED', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('199', 'MAIN_AGENDA_ACTIONAUTO_PROPAL_CLOSE_REFUSED', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('200', 'MAIN_AGENDA_ACTIONAUTO_PROPAL_CLASSIFY_BILLED', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('201', 'MAIN_AGENDA_ACTIONAUTO_PROPAL_SENTBYMAIL', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('202', 'MAIN_AGENDA_ACTIONAUTO_ORDER_VALIDATE', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('203', 'MAIN_AGENDA_ACTIONAUTO_ORDER_CLOSE', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('204', 'MAIN_AGENDA_ACTIONAUTO_ORDER_CLASSIFY_BILLED', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('205', 'MAIN_AGENDA_ACTIONAUTO_ORDER_CANCEL', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('206', 'MAIN_AGENDA_ACTIONAUTO_ORDER_SENTBYMAIL', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('207', 'MAIN_AGENDA_ACTIONAUTO_BILL_VALIDATE', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('208', 'MAIN_AGENDA_ACTIONAUTO_BILL_PAYED', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('209', 'MAIN_AGENDA_ACTIONAUTO_BILL_CANCEL', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('210', 'MAIN_AGENDA_ACTIONAUTO_BILL_SENTBYMAIL', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('211', 'MAIN_AGENDA_ACTIONAUTO_BILL_UNVALIDATE', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('212', 'MAIN_AGENDA_ACTIONAUTO_PROPOSAL_SUPPLIER_VALIDATE', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('213', 'MAIN_AGENDA_ACTIONAUTO_PROPOSAL_SUPPLIER_SENTBYMAIL', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('214', 'MAIN_AGENDA_ACTIONAUTO_PROPOSAL_SUPPLIER_CLOSE_SIGNED', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('215', 'MAIN_AGENDA_ACTIONAUTO_PROPOSAL_SUPPLIER_CLOSE_REFUSED', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('216', 'MAIN_AGENDA_ACTIONAUTO_ORDER_SUPPLIER_VALIDATE', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('217', 'MAIN_AGENDA_ACTIONAUTO_ORDER_SUPPLIER_APPROVE', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('218', 'MAIN_AGENDA_ACTIONAUTO_ORDER_SUPPLIER_SUBMIT', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('219', 'MAIN_AGENDA_ACTIONAUTO_ORDER_SUPPLIER_RECEIVE', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('220', 'MAIN_AGENDA_ACTIONAUTO_ORDER_SUPPLIER_REFUSE', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('221', 'MAIN_AGENDA_ACTIONAUTO_ORDER_SUPPLIER_SENTBYMAIL', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('222', 'MAIN_AGENDA_ACTIONAUTO_ORDER_SUPPLIER_CLASSIFY_BILLED', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('223', 'MAIN_AGENDA_ACTIONAUTO_BILL_SUPPLIER_VALIDATE', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('224', 'MAIN_AGENDA_ACTIONAUTO_BILL_SUPPLIER_UNVALIDATE', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('225', 'MAIN_AGENDA_ACTIONAUTO_BILL_SUPPLIER_PAYED', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('226', 'MAIN_AGENDA_ACTIONAUTO_BILL_SUPPLIER_SENTBYMAIL', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('227', 'MAIN_AGENDA_ACTIONAUTO_BILL_SUPPLIER_CANCELED', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('228', 'MAIN_AGENDA_ACTIONAUTO_CONTRACT_VALIDATE', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('229', 'MAIN_AGENDA_ACTIONAUTO_CONTRACT_SENTBYMAIL', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('230', 'MAIN_AGENDA_ACTIONAUTO_SHIPPING_VALIDATE', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('231', 'MAIN_AGENDA_ACTIONAUTO_SHIPPING_SENTBYMAIL', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('232', 'MAIN_AGENDA_ACTIONAUTO_MEMBER_VALIDATE', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('233', 'MAIN_AGENDA_ACTIONAUTO_MEMBER_SENTBYMAIL', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('234', 'MAIN_AGENDA_ACTIONAUTO_MEMBER_MODIFY', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('235', 'MAIN_AGENDA_ACTIONAUTO_MEMBER_SUBSCRIPTION_CREATE', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('236', 'MAIN_AGENDA_ACTIONAUTO_MEMBER_SUBSCRIPTION_MODIFY', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('237', 'MAIN_AGENDA_ACTIONAUTO_MEMBER_SUBSCRIPTION_DELETE', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('238', 'MAIN_AGENDA_ACTIONAUTO_MEMBER_RESILIATE', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('239', 'MAIN_AGENDA_ACTIONAUTO_MEMBER_DELETE', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('240', 'MAIN_AGENDA_ACTIONAUTO_FICHINTER_VALIDATE', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('241', 'MAIN_AGENDA_ACTIONAUTO_FICHINTER_MODIFY', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('242', 'MAIN_AGENDA_ACTIONAUTO_FICHINTER_CLASSIFY_BILLED', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('243', 'MAIN_AGENDA_ACTIONAUTO_FICHINTER_CLASSIFY_UNBILLED', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('244', 'MAIN_AGENDA_ACTIONAUTO_FICHINTER_REOPEN', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('245', 'MAIN_AGENDA_ACTIONAUTO_FICHINTER_SENTBYMAIL', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('246', 'MAIN_AGENDA_ACTIONAUTO_PRODUCT_CREATE', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('247', 'MAIN_AGENDA_ACTIONAUTO_PRODUCT_MODIFY', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('248', 'MAIN_AGENDA_ACTIONAUTO_PRODUCT_DELETE', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('249', 'MAIN_AGENDA_ACTIONAUTO_PROJECT_CREATE', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('250', 'MAIN_AGENDA_ACTIONAUTO_PROJECT_VALIDATE', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('251', 'MAIN_AGENDA_ACTIONAUTO_PROJECT_MODIFY', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('252', 'MAIN_AGENDA_ACTIONAUTO_PROJECT_DELETE', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('253', 'MAIN_AGENDA_ACTIONAUTO_EXPENSE_REPORT_CREATE', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('254', 'MAIN_AGENDA_ACTIONAUTO_EXPENSE_REPORT_VALIDATE', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('255', 'MAIN_AGENDA_ACTIONAUTO_EXPENSE_REPORT_APPROVE', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('256', 'MAIN_AGENDA_ACTIONAUTO_EXPENSE_REPORT_PAYED', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:27'), ('257', 'MAIN_MODULE_PROJET', '1', '1', 'string', '0', '{\"authorid\":\"1\",\"ip\":\"81.35.126.40\"}', '2021-05-06 04:34:29'), ('258', 'PROJECT_ADDON_PDF', '1', 'baleine', 'chaine', '0', 'Name of PDF/ODT project manager class', '2021-05-06 04:34:29'), ('259', 'PROJECT_ADDON', '1', 'mod_project_simple', 'chaine', '0', 'Name of Numbering Rule project manager class', '2021-05-06 04:34:29'), ('260', 'PROJECT_ADDON_PDF_ODT_PATH', '1', 'DOL_DATA_ROOT/doctemplates/projects', 'chaine', '0', null, '2021-05-06 04:34:29'), ('261', 'PROJECT_TASK_ADDON_PDF', '1', '', 'chaine', '0', 'Name of PDF/ODT tasks manager class', '2021-05-06 04:34:29'), ('262', 'PROJECT_TASK_ADDON', '1', 'mod_task_simple', 'chaine', '0', 'Name of Numbering Rule task manager class', '2021-05-06 04:34:29'), ('263', 'PROJECT_TASK_ADDON_PDF_ODT_PATH', '1', 'DOL_DATA_ROOT/doctemplates/tasks', 'chaine', '0', null, '2021-05-06 04:34:29'), ('264', 'PROJECT_USE_OPPORTUNITIES', '1', '1', 'chaine', '0', null, '2021-05-06 04:34:29'), ('265', 'MAIN_DELAY_PROJECT_TO_CLOSE', '1', '7', 'chaine', '0', null, '2021-05-06 04:34:29'), ('266', 'MAIN_DELAY_TASKS_TODO', '1', '7', 'chaine', '0', null, '2021-05-06 04:34:29'), ('269', 'ECM_AUTO_TREE_ENABLED', '1', '1', 'chaine', '0', 'Auto tree is enabled by default', '2021-05-06 04:34:33'), ('270', 'MAIN_MODULE_CATEGORIE', '1', '1', 'string', '0', '{\"authorid\":\"1\",\"ip\":\"81.35.126.40\"}', '2021-05-06 04:34:35'), ('271', 'CATEGORIE_RECURSIV_ADD', '1', '0', 'yesno', '0', 'Affect parent categories', '2021-05-06 04:34:35'), ('272', 'MAIN_MODULE_FCKEDITOR', '1', '1', 'string', '0', '{\"authorid\":\"1\",\"ip\":\"81.35.126.40\"}', '2021-05-06 04:34:36'), ('273', 'FCKEDITOR_ENABLE_SOCIETE', '1', '1', 'yesno', '0', 'WYSIWIG for description and note (except products/services)', '2021-05-06 04:34:36'), ('274', 'FCKEDITOR_ENABLE_PRODUCTDESC', '1', '1', 'yesno', '0', 'WYSIWIG for products/services description and note', '2021-05-06 04:34:36'), ('275', 'FCKEDITOR_ENABLE_MAILING', '1', '1', 'yesno', '0', 'WYSIWIG for mass emailings', '2021-05-06 04:34:36'), ('276', 'FCKEDITOR_ENABLE_DETAILS', '1', '1', 'yesno', '0', 'WYSIWIG for products details lines for all entities', '2021-05-06 04:34:36'), ('277', 'FCKEDITOR_ENABLE_USERSIGN', '1', '1', 'yesno', '0', 'WYSIWIG for user signature', '2021-05-06 04:34:36'), ('278', 'FCKEDITOR_ENABLE_MAIL', '1', '1', 'yesno', '0', 'WYSIWIG for products details lines for all entities', '2021-05-06 04:34:36'), ('279', 'FCKEDITOR_SKIN', '1', 'moono-lisa', 'string', '0', 'Skin by default for fckeditor', '2021-05-06 04:34:36'), ('280', 'MAIN_MODULE_BOOKMARK', '1', '1', 'string', '0', '{\"authorid\":\"1\",\"ip\":\"81.35.126.40\"}', '2021-05-06 04:34:42'), ('282', 'MAIN_MODULE_WORKFLOW', '1', '1', 'string', '0', '{\"authorid\":\"1\",\"ip\":\"81.35.126.40\"}', '2021-05-06 04:34:46'), ('283', 'MAIN_MODULE_IMPORT', '1', '1', 'string', '0', '{\"authorid\":\"1\",\"ip\":\"81.35.126.40\"}', '2021-05-06 04:34:48'), ('284', 'MAIN_MODULE_EXPORT', '1', '1', 'string', '0', '{\"authorid\":\"1\",\"ip\":\"81.35.126.40\"}', '2021-05-06 04:34:49'), ('285', 'MAIN_MODULE_NOTIFICATION', '1', '1', 'string', '0', '{\"authorid\":\"1\",\"ip\":\"81.35.126.40\"}', '2021-05-06 04:34:57'), ('287', 'CRON_KEY', '0', '', 'chaine', '0', 'CRON KEY', '2021-05-06 04:35:01'), ('375', 'MAIN_MULTILANGS', '1', '0', 'chaine', '0', '', '2021-05-06 04:42:26'), ('380', 'MAIN_DISABLE_JAVASCRIPT', '1', '0', 'chaine', '0', '', '2021-05-06 04:42:26'), ('381', 'MAIN_BUTTON_HIDE_UNAUTHORIZED', '1', '1', 'chaine', '0', '', '2021-05-06 04:42:26'), ('387', 'MAIN_HELPCENTER_DISABLELINK', '0', '0', 'chaine', '0', '', '2021-05-06 04:42:26'), ('390', 'INVOICE_CAN_ALWAYS_BE_REMOVED', '1', '0', 'chaine', '1', '', '2021-05-06 04:44:26'), ('417', 'PRODUCT_PRICE_BASE_TYPE', '0', 'HT', 'string', '0', null, '2021-05-06 04:48:54'), ('418', 'MAIN_MODULE_AGENDA', '1', '1', 'string', '0', '{\"authorid\":0,\"ip\":\"81.35.126.40\"}', '2021-05-06 04:49:19'), ('419', 'MAIN_MODULE_BARCODE', '1', '1', 'string', '0', '{\"authorid\":0,\"ip\":\"81.35.126.40\"}', '2021-05-06 04:49:20'), ('420', 'MAIN_MODULE_CRON', '1', '1', 'string', '0', '{\"authorid\":0,\"ip\":\"81.35.126.40\"}', '2021-05-06 04:49:20'), ('421', 'MAIN_MODULE_COMMANDE', '1', '1', 'string', '0', '{\"authorid\":0,\"ip\":\"81.35.126.40\"}', '2021-05-06 04:49:20'), ('422', 'MAIN_MODULE_ECM', '1', '1', 'string', '0', '{\"authorid\":0,\"ip\":\"81.35.126.40\"}', '2021-05-06 04:49:21'), ('423', 'MAIN_MODULE_EXPENSEREPORT', '1', '1', 'string', '0', '{\"authorid\":0,\"ip\":\"81.35.126.40\"}', '2021-05-06 04:49:21'), ('424', 'MAIN_MODULE_FACTURE', '1', '1', 'string', '0', '{\"authorid\":0,\"ip\":\"81.35.126.40\"}', '2021-05-06 04:49:22'), ('425', 'MAIN_MODULE_FOURNISSEUR', '1', '1', 'string', '0', '{\"authorid\":0,\"ip\":\"81.35.126.40\"}', '2021-05-06 04:49:23'), ('426', 'MAIN_MODULE_HOLIDAY', '1', '1', 'string', '0', '{\"authorid\":0,\"ip\":\"81.35.126.40\"}', '2021-05-06 04:49:24'), ('427', 'MAIN_MODULE_RESOURCE', '1', '1', 'string', '0', '{\"authorid\":0,\"ip\":\"81.35.126.40\"}', '2021-05-06 04:49:24'), ('428', 'MAIN_MODULE_SALARIES', '1', '1', 'string', '0', '{\"authorid\":0,\"ip\":\"81.35.126.40\"}', '2021-05-06 04:49:24'), ('429', 'MAIN_MODULE_SOCIETE', '1', '1', 'string', '0', '{\"authorid\":0,\"ip\":\"81.35.126.40\"}', '2021-05-06 04:49:25'), ('430', 'MAIN_MODULE_USER', '0', '1', 'string', '0', '{\"authorid\":0,\"ip\":\"81.35.126.40\"}', '2021-05-06 04:49:25'), ('431', 'MAIN_VERSION_LAST_UPGRADE', '0', '13.0.2', 'chaine', '0', 'Dolibarr version for last upgrade', '2021-05-06 04:49:28'), ('433', 'MAIN_LAST_PING_KO_DATE', '1', '20210506094933', 'gmt', '0', '', '2021-05-06 04:49:33'), ('434', 'MAIN_INFO_SOCIETE_COUNTRY', '1', '4:ES:España', 'chaine', '0', '', '2021-05-06 04:49:50'), ('435', 'MAIN_INFO_SOCIETE_STATE', '1', '553:PO:Pontevedra', 'chaine', '0', '', '2021-05-06 04:49:50'), ('436', 'MAIN_INFO_SOCIETE_NOM', '1', 'FP Plast-Yect S.L', 'chaine', '0', '', '2021-05-06 04:49:50'), ('437', 'MAIN_INFO_SOCIETE_ADDRESS', '1', 'Carretera, Estrada Tui-A Guarda, km 55, 3, Pontevedra', 'chaine', '0', '', '2021-05-06 04:49:50'), ('438', 'MAIN_INFO_SOCIETE_TOWN', '1', 'O Rosal', 'chaine', '0', '', '2021-05-06 04:49:50'), ('439', 'MAIN_INFO_SOCIETE_ZIP', '1', '36760', 'chaine', '0', '', '2021-05-06 04:49:50'), ('440', 'MAIN_MONNAIE', '1', 'EUR', 'chaine', '0', '', '2021-05-06 04:49:50'), ('441', 'MAIN_INFO_SOCIETE_TEL', '1', '986610772', 'chaine', '0', '', '2021-05-06 04:49:50'), ('442', 'MAIN_INFO_SOCIETE_MAIL', '1', 'fp@plast-yect.com', 'chaine', '0', '', '2021-05-06 04:49:50'), ('443', 'MAIN_INFO_SOCIETE_WEB', '1', 'https://plast-yect.com', 'chaine', '0', '', '2021-05-06 04:49:50'), ('444', 'MAIN_INFO_SOCIETE_LOGO', '1', 'logo-plast-yect-soft.jpg', 'chaine', '0', '', '2021-05-06 04:49:50'), ('445', 'MAIN_INFO_SOCIETE_LOGO_SMALL', '1', 'logo-plast-yect-soft_small.jpg', 'chaine', '0', '', '2021-05-06 04:49:50'), ('446', 'MAIN_INFO_SOCIETE_LOGO_MINI', '1', 'logo-plast-yect-soft_mini.jpg', 'chaine', '0', '', '2021-05-06 04:49:50'), ('447', 'MAIN_INFO_SOCIETE_LOGO_SQUARRED', '1', 'logo-plast-yect-soft.jpg', 'chaine', '0', '', '2021-05-06 04:49:50'), ('448', 'MAIN_INFO_SOCIETE_LOGO_SQUARRED_SMALL', '1', 'logo-plast-yect-soft_small.jpg', 'chaine', '0', '', '2021-05-06 04:49:50'), ('449', 'MAIN_INFO_SOCIETE_LOGO_SQUARRED_MINI', '1', 'logo-plast-yect-soft_mini.jpg', 'chaine', '0', '', '2021-05-06 04:49:50'), ('450', 'MAIN_INFO_SOCIETE_FORME_JURIDIQUE', '1', '405', 'chaine', '0', '', '2021-05-06 04:49:50'), ('451', 'MAIN_INFO_SIREN', '1', 'B94085032', 'chaine', '0', '', '2021-05-06 04:49:50'), ('452', 'MAIN_INFO_TVAINTRA', '1', 'ESB94085032', 'chaine', '0', '', '2021-05-06 04:49:50'), ('453', 'SOCIETE_FISCAL_MONTH_START', '1', '1', 'chaine', '0', '', '2021-05-06 04:49:50'), ('454', 'FACTURE_TVAOPTION', '1', '1', 'chaine', '0', '', '2021-05-06 04:49:50'), ('455', 'FACTURE_LOCAL_TAX1_OPTION', '1', 'localtax1off', 'chaine', '0', '', '2021-05-06 04:49:50'), ('456', 'FACTURE_LOCAL_TAX2_OPTION', '1', 'localtax2off', 'chaine', '0', '', '2021-05-06 04:49:50'), ('457', 'MAIN_MENU_HIDE_UNAUTHORIZED', '1', '1', 'chaine', '0', '', '2021-05-06 04:50:13'), ('459', 'MAIN_HELP_DISABLELINK', '1', '1', 'chaine', '0', '', '2021-05-06 04:50:47'), ('460', 'MAIN_LANG_DEFAULT', '1', 'auto', 'chaine', '0', '', '2021-05-06 04:50:56'), ('461', 'MAIN_IHM_PARAMS_REV', '1', '1', 'chaine', '0', '', '2021-05-06 04:50:56'), ('462', 'MAIN_THEME', '1', 'eldy', 'chaine', '0', '', '2021-05-06 04:50:56'), ('463', 'MAIN_SIZE_LISTE_LIMIT', '1', '25', 'chaine', '0', '', '2021-05-06 04:50:56'), ('464', 'MAIN_SIZE_SHORTLIST_LIMIT', '1', '3', 'chaine', '0', '', '2021-05-06 04:50:56'), ('465', 'MAIN_START_WEEK', '1', '1', 'chaine', '0', '', '2021-05-06 04:50:56'), ('466', 'MAIN_DEFAULT_WORKING_DAYS', '1', '1-5', 'chaine', '0', '', '2021-05-06 04:50:56'), ('467', 'MAIN_DEFAULT_WORKING_HOURS', '1', '9-18', 'chaine', '0', '', '2021-05-06 04:50:56'), ('468', 'MAIN_FIRSTNAME_NAME_POSITION', '1', '0', 'chaine', '0', '', '2021-05-06 04:50:56'), ('469', 'MAIN_MODULE_PAYMENTBYBANKTRANSFER', '1', '1', 'string', '0', '{\"authorid\":\"1\",\"ip\":\"81.35.126.40\"}', '2021-05-06 05:06:17'), ('470', 'MAIN_MODULE_BOM', '1', '1', 'string', '0', '{\"authorid\":\"1\",\"ip\":\"81.35.126.40\"}', '2021-05-06 05:06:27'), ('471', 'BOM_ADDON_PDF', '1', 'generic_bom_odt', 'chaine', '0', 'Name of PDF model of BOM', '2021-05-06 05:06:27'), ('472', 'BOM_ADDON', '1', 'mod_bom_standard', 'chaine', '0', 'Name of numbering rules of BOM', '2021-05-06 05:06:27'), ('473', 'BOM_ADDON_PDF_ODT_PATH', '1', 'DOL_DATA_ROOT/doctemplates/boms', 'chaine', '0', null, '2021-05-06 05:06:27'), ('474', 'MAIN_MODULE_MRP', '1', '1', 'string', '0', '{\"authorid\":\"1\",\"ip\":\"81.35.126.40\"}', '2021-05-06 05:06:30'), ('475', 'MAIN_MODULE_MRP_TRIGGERS', '1', '0', 'chaine', '0', null, '2021-05-06 05:06:30'), ('476', 'MAIN_MODULE_MRP_LOGIN', '1', '0', 'chaine', '0', null, '2021-05-06 05:06:30'), ('477', 'MAIN_MODULE_MRP_SUBSTITUTIONS', '1', '0', 'chaine', '0', null, '2021-05-06 05:06:30'), ('478', 'MAIN_MODULE_MRP_MENUS', '1', '0', 'chaine', '0', null, '2021-05-06 05:06:30'), ('479', 'MAIN_MODULE_MRP_TPL', '1', '0', 'chaine', '0', null, '2021-05-06 05:06:30'), ('480', 'MAIN_MODULE_MRP_BARCODE', '1', '0', 'chaine', '0', null, '2021-05-06 05:06:30'), ('481', 'MAIN_MODULE_MRP_MODELS', '1', '0', 'chaine', '0', null, '2021-05-06 05:06:30'), ('482', 'MAIN_MODULE_MRP_THEME', '1', '0', 'chaine', '0', null, '2021-05-06 05:06:30'), ('483', 'MAIN_MODULE_MRP_MODULEFOREXTERNAL', '1', '0', 'chaine', '0', null, '2021-05-06 05:06:30'), ('484', 'MRP_MO_ADDON_PDF', '1', 'alpha', 'chaine', '0', 'Name of PDF model of MO', '2021-05-06 05:06:30'), ('485', 'MRP_MO_ADDON', '1', 'mod_mo_standard', 'chaine', '0', 'Name of numbering rules of MO', '2021-05-06 05:06:30'), ('486', 'MRP_MO_ADDON_PDF_ODT_PATH', '1', 'DOL_DATA_ROOT/doctemplates/mrps', 'chaine', '0', null, '2021-05-06 05:06:30'), ('487', 'SOCIETE_IDPROF1_UNIQUE', '1', '1', 'chaine', '0', '', '2021-05-06 10:25:31'), ('488', 'SOCIETE_IDPROF1_INVOICE_MANDATORY', '1', '1', 'chaine', '0', '', '2021-05-06 10:25:33'), ('489', 'CONTACT_SHOW_EMAIL_PHONE_TOWN_SELECTLIST', '1', '1', 'yesno', '0', '', '2021-05-06 10:26:08'), ('490', 'SOCIETE_DISABLE_PROSPECTSCUSTOMERS', '1', '1', 'yesno', '0', '', '2021-05-06 10:26:14'), ('491', 'THIRDPARTY_CUSTOMERTYPE_BY_DEFAULT', '1', '1', 'chaine', '0', '', '2021-05-06 10:26:18'), ('492', 'MAIN_MODULE_NUMBERSERIES', '1', '1', 'string', '0', '{\"authorid\":\"1\",\"ip\":\"81.35.126.40\"}', '2021-05-06 10:33:02'), ('493', 'MAIN_MODULE_NUMBERSERIES_MODELS', '1', '1', 'chaine', '0', null, '2021-05-06 10:33:02'), ('494', 'MAIN_MODULE_NUMBERSERIES_CSS', '1', '[\"numberseries\\/css\\/numberseries.css\"]', 'chaine', '0', null, '2021-05-06 10:33:02'), ('495', 'FACTURE_ADDON', '1', 'mod_facture_numberseries', 'chaine', '0', '', '2021-05-06 10:35:20'), ('496', 'NOTIFICATION_EMAIL_FROM', '1', 'administracion@plast-yect.com', 'chaine', '0', '', '2021-05-06 10:39:20'), ('497', 'MAIN_DISABLE_ALL_MAILS', '1', '0', 'chaine', '0', '', '2021-05-06 10:40:49'), ('498', 'MAIN_MAIL_ENABLED_USER_DEST_SELECT', '1', '0', 'chaine', '0', '', '2021-05-06 10:40:49'), ('499', 'MAIN_MAIL_SENDMODE', '1', 'smtps', 'chaine', '0', '', '2021-05-06 10:40:49'), ('500', 'MAIN_MAIL_SMTP_PORT', '1', '465', 'chaine', '0', '', '2021-05-06 10:40:49'), ('501', 'MAIN_MAIL_SMTP_SERVER', '1', 's100.servidorestop.com', 'chaine', '0', '', '2021-05-06 10:40:49'), ('502', 'MAIN_MAIL_SMTPS_ID', '1', 'administracion@plast-yect.com', 'chaine', '0', '', '2021-05-06 10:40:49'), ('503', 'MAIN_MAIL_SMTPS_PW', '1', 'jeGh_035', 'chaine', '0', '', '2021-05-06 10:40:49'), ('504', 'MAIN_MAIL_EMAIL_TLS', '1', '1', 'chaine', '0', '', '2021-05-06 10:40:49'), ('505', 'MAIN_MAIL_EMAIL_STARTTLS', '1', '0', 'chaine', '0', '', '2021-05-06 10:40:49'), ('506', 'MAIN_MAIL_EMAIL_SMTP_ALLOW_SELF_SIGNED', '1', '1', 'chaine', '0', '', '2021-05-06 10:40:49'), ('507', 'MAIN_MAIL_EMAIL_FROM', '1', 'administracion@plast-yect.com', 'chaine', '0', '', '2021-05-06 10:40:49'), ('508', 'MAIN_MAIL_ERRORS_TO', '1', 'administracion@plast-yect.com', 'chaine', '0', '', '2021-05-06 10:40:49'), ('509', 'MAIN_MAIL_AUTOCOPY_TO', '1', 'administracion@plast-yect.com', 'chaine', '0', '', '2021-05-06 10:40:49'), ('510', 'MAIN_MAIL_DEFAULT_FROMTYPE', '1', 'user', 'chaine', '0', '', '2021-05-06 10:40:49'), ('511', 'PRODUIT_DEFAULT_BARCODE_TYPE', '1', '2', 'chaine', '0', '', '2021-05-06 10:42:14'), ('512', 'GENBARCODE_BARCODETYPE_THIRDPARTY', '1', '1', 'chaine', '0', '', '2021-05-06 10:42:14'), ('513', 'BARCODE_PRODUCT_ADDON_NUM', '1', 'mod_barcode_product_standard', 'chaine', '0', '', '2021-05-06 10:42:16'), ('515', 'BARCODE_STANDARD_PRODUCT_MASK', '1', '020{000000000}', 'chaine', '0', '', '2021-05-06 10:42:26'), ('516', 'MAIN_SECURITY_ENABLECAPTCHA', '1', '1', 'chaine', '0', '', '2021-05-07 09:13:44'), ('517', 'MAIN_APPLICATION_TITLE', '1', 'ERP Serboweb', 'chaine', '0', '', '2021-05-07 09:13:49'), ('518', 'MAIN_SESSION_TIMEOUT', '1', '1440', 'chaine', '0', '', '2021-05-07 09:13:49'), ('519', 'USER_PASSWORD_PATTERN', '1', '10;1;1;1;3;1', 'chaine', '0', '', '2021-05-07 09:13:50'), ('520', 'MAIN_SECURITY_DISABLEFORGETPASSLINK', '1', '1', 'chaine', '0', '', '2021-05-07 09:15:44'), ('521', 'MAIN_UPLOAD_DOC', '1', '16384', 'chaine', '0', '', '2021-05-07 09:16:29'), ('522', 'MAIN_UMASK', '1', '0664', 'chaine', '0', '', '2021-05-07 09:16:29'), ('523', 'MAIN_MODULE_MODULEBUILDER', '1', '1', 'string', '0', '{\"authorid\":\"1\",\"ip\":\"::1\"}', '2021-05-07 21:15:25'), ('524', 'MAIN_MODULE_SIN_PRECIO', '1', '1', 'string', '0', '{\"authorid\":\"1\",\"ip\":\"::1\"}', '2021-05-07 21:18:59'), ('525', 'MAIN_MODULE_SIN_PRECIO_TRIGGERS', '1', '0', 'chaine', '0', null, '2021-05-07 21:18:59'), ('526', 'MAIN_MODULE_SIN_PRECIO_LOGIN', '1', '0', 'chaine', '0', null, '2021-05-07 21:18:59'), ('527', 'MAIN_MODULE_SIN_PRECIO_SUBSTITUTIONS', '1', '0', 'chaine', '0', null, '2021-05-07 21:18:59'), ('528', 'MAIN_MODULE_SIN_PRECIO_MENUS', '1', '0', 'chaine', '0', null, '2021-05-07 21:18:59'), ('529', 'MAIN_MODULE_SIN_PRECIO_TPL', '1', '0', 'chaine', '0', null, '2021-05-07 21:18:59'), ('530', 'MAIN_MODULE_SIN_PRECIO_BARCODE', '1', '0', 'chaine', '0', null, '2021-05-07 21:18:59'), ('531', 'MAIN_MODULE_SIN_PRECIO_MODELS', '1', '0', 'chaine', '0', null, '2021-05-07 21:18:59'), ('532', 'MAIN_MODULE_SIN_PRECIO_PRINTING', '1', '0', 'chaine', '0', null, '2021-05-07 21:18:59'), ('533', 'MAIN_MODULE_SIN_PRECIO_THEME', '1', '0', 'chaine', '0', null, '2021-05-07 21:18:59'), ('534', 'MAIN_MODULE_SIN_PRECIO_MODULEFOREXTERNAL', '1', '0', 'chaine', '0', null, '2021-05-07 21:18:59');
COMMIT;

-- ----------------------------
--  Table structure for `llx_contrat`
-- ----------------------------
DROP TABLE IF EXISTS `llx_contrat`;
CREATE TABLE `llx_contrat` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(255) DEFAULT NULL,
  `ref_customer` varchar(255) DEFAULT NULL,
  `ref_supplier` varchar(255) DEFAULT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` datetime DEFAULT NULL,
  `date_contrat` datetime DEFAULT NULL,
  `statut` smallint(6) DEFAULT '0',
  `mise_en_service` datetime DEFAULT NULL,
  `fin_validite` datetime DEFAULT NULL,
  `date_cloture` datetime DEFAULT NULL,
  `fk_soc` int(11) NOT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `fk_commercial_signature` int(11) DEFAULT NULL,
  `fk_commercial_suivi` int(11) DEFAULT NULL,
  `fk_user_author` int(11) NOT NULL DEFAULT '0',
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_mise_en_service` int(11) DEFAULT NULL,
  `fk_user_cloture` int(11) DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_contrat_ref` (`ref`,`entity`),
  KEY `idx_contrat_fk_soc` (`fk_soc`),
  KEY `idx_contrat_fk_user_author` (`fk_user_author`),
  CONSTRAINT `fk_contrat_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_contrat_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_contrat_extrafields`
-- ----------------------------
DROP TABLE IF EXISTS `llx_contrat_extrafields`;
CREATE TABLE `llx_contrat_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_contrat_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_contratdet`
-- ----------------------------
DROP TABLE IF EXISTS `llx_contratdet`;
CREATE TABLE `llx_contratdet` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_contrat` int(11) NOT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `statut` smallint(6) DEFAULT '0',
  `label` text,
  `description` text,
  `fk_remise_except` int(11) DEFAULT NULL,
  `date_commande` datetime DEFAULT NULL,
  `date_ouverture_prevue` datetime DEFAULT NULL,
  `date_ouverture` datetime DEFAULT NULL,
  `date_fin_validite` datetime DEFAULT NULL,
  `date_cloture` datetime DEFAULT NULL,
  `vat_src_code` varchar(10) DEFAULT '',
  `tva_tx` double(6,3) DEFAULT '0.000',
  `localtax1_tx` double(6,3) DEFAULT '0.000',
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(6,3) DEFAULT '0.000',
  `localtax2_type` varchar(10) DEFAULT NULL,
  `qty` double NOT NULL,
  `remise_percent` double DEFAULT '0',
  `subprice` double(24,8) DEFAULT '0.00000000',
  `price_ht` double DEFAULT NULL,
  `remise` double DEFAULT '0',
  `total_ht` double(24,8) DEFAULT '0.00000000',
  `total_tva` double(24,8) DEFAULT '0.00000000',
  `total_localtax1` double(24,8) DEFAULT '0.00000000',
  `total_localtax2` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT '0.00000000',
  `product_type` int(11) DEFAULT '1',
  `info_bits` int(11) DEFAULT '0',
  `buy_price_ht` double(24,8) DEFAULT NULL,
  `fk_product_fournisseur_price` int(11) DEFAULT NULL,
  `fk_user_author` int(11) NOT NULL DEFAULT '0',
  `fk_user_ouverture` int(11) DEFAULT NULL,
  `fk_user_cloture` int(11) DEFAULT NULL,
  `commentaire` text,
  `fk_unit` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ht` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_tva` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ttc` double(24,8) DEFAULT '0.00000000',
  PRIMARY KEY (`rowid`),
  KEY `idx_contratdet_fk_contrat` (`fk_contrat`),
  KEY `idx_contratdet_fk_product` (`fk_product`),
  KEY `idx_contratdet_date_ouverture_prevue` (`date_ouverture_prevue`),
  KEY `idx_contratdet_date_ouverture` (`date_ouverture`),
  KEY `idx_contratdet_date_fin_validite` (`date_fin_validite`),
  KEY `fk_contratdet_fk_unit` (`fk_unit`),
  CONSTRAINT `fk_contratdet_fk_contrat` FOREIGN KEY (`fk_contrat`) REFERENCES `llx_contrat` (`rowid`),
  CONSTRAINT `fk_contratdet_fk_product` FOREIGN KEY (`fk_product`) REFERENCES `llx_product` (`rowid`),
  CONSTRAINT `fk_contratdet_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `llx_c_units` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_contratdet_extrafields`
-- ----------------------------
DROP TABLE IF EXISTS `llx_contratdet_extrafields`;
CREATE TABLE `llx_contratdet_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_contratdet_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_contratdet_log`
-- ----------------------------
DROP TABLE IF EXISTS `llx_contratdet_log`;
CREATE TABLE `llx_contratdet_log` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_contratdet` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `statut` smallint(6) NOT NULL,
  `fk_user_author` int(11) NOT NULL,
  `commentaire` text,
  PRIMARY KEY (`rowid`),
  KEY `idx_contratdet_log_fk_contratdet` (`fk_contratdet`),
  KEY `idx_contratdet_log_date` (`date`),
  CONSTRAINT `fk_contratdet_log_fk_contratdet` FOREIGN KEY (`fk_contratdet`) REFERENCES `llx_contratdet` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_cronjob`
-- ----------------------------
DROP TABLE IF EXISTS `llx_cronjob`;
CREATE TABLE `llx_cronjob` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` datetime DEFAULT NULL,
  `jobtype` varchar(10) NOT NULL,
  `label` text NOT NULL,
  `command` varchar(255) DEFAULT NULL,
  `classesname` varchar(255) DEFAULT NULL,
  `objectname` varchar(255) DEFAULT NULL,
  `methodename` varchar(255) DEFAULT NULL,
  `params` text,
  `md5params` varchar(32) DEFAULT NULL,
  `module_name` varchar(255) DEFAULT NULL,
  `priority` int(11) DEFAULT '0',
  `datelastrun` datetime DEFAULT NULL,
  `datenextrun` datetime DEFAULT NULL,
  `datestart` datetime DEFAULT NULL,
  `dateend` datetime DEFAULT NULL,
  `datelastresult` datetime DEFAULT NULL,
  `lastresult` text,
  `lastoutput` text,
  `unitfrequency` varchar(255) NOT NULL DEFAULT '3600',
  `frequency` int(11) NOT NULL DEFAULT '0',
  `maxrun` int(11) NOT NULL DEFAULT '0',
  `nbrun` int(11) DEFAULT NULL,
  `autodelete` int(11) DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1',
  `processing` int(11) NOT NULL DEFAULT '0',
  `test` varchar(255) DEFAULT '1',
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_mod` int(11) DEFAULT NULL,
  `fk_mailing` int(11) DEFAULT NULL,
  `note` text,
  `libname` varchar(255) DEFAULT NULL,
  `entity` int(11) DEFAULT '0',
  PRIMARY KEY (`rowid`),
  KEY `idx_cronjob_status` (`status`),
  KEY `idx_cronjob_datelastrun` (`datelastrun`),
  KEY `idx_cronjob_datenextrun` (`datenextrun`),
  KEY `idx_cronjob_datestart` (`datestart`),
  KEY `idx_cronjob_dateend` (`dateend`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_cronjob`
-- ----------------------------
BEGIN;
INSERT INTO `llx_cronjob` VALUES ('1', '2021-04-28 08:58:15', '2021-04-28 13:58:15', 'method', 'RecurringInvoices', null, 'compta/facture/class/facture-rec.class.php', 'FactureRec', 'createRecurringInvoices', null, null, 'facture', '50', null, null, '2021-04-28 13:58:15', null, null, null, null, '86400', '1', '0', null, '0', '1', '0', '$conf->facture->enabled', null, null, null, 'Generate recurring invoices', null, '1'), ('2', '2021-05-06 04:34:27', '2021-05-06 09:34:27', 'method', 'SendEmailsReminders', null, 'comm/action/class/actioncomm.class.php', 'ActionComm', 'sendEmailsReminder', null, null, 'agenda', '10', null, null, '2021-05-06 09:34:27', null, null, null, null, '60', '10', '0', null, '0', '1', '0', '$conf->agenda->enabled', null, null, null, 'SendEMailsReminder', null, '1'), ('3', '2021-05-06 04:35:02', '2021-05-06 09:35:02', 'method', 'PurgeDeleteTemporaryFilesShort', null, 'core/class/utils.class.php', 'Utils', 'purgeFiles', null, null, 'cron', '50', null, null, '2021-05-06 09:35:02', null, null, null, null, '604800', '2', '0', null, '0', '1', '0', '1', null, null, null, 'PurgeDeleteTemporaryFiles', null, '0'), ('4', '2021-05-06 04:35:02', '2021-05-06 09:35:02', 'method', 'MakeLocalDatabaseDumpShort', null, 'core/class/utils.class.php', 'Utils', 'dumpDatabase', 'none,auto,1,auto,10', null, 'cron', '90', null, null, '2021-05-06 09:35:02', null, null, null, null, '604800', '1', '0', null, '0', '0', '0', '1', null, null, null, 'MakeLocalDatabaseDump', null, '0');
COMMIT;

-- ----------------------------
--  Table structure for `llx_default_values`
-- ----------------------------
DROP TABLE IF EXISTS `llx_default_values`;
CREATE TABLE `llx_default_values` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `type` varchar(10) DEFAULT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `page` varchar(255) DEFAULT NULL,
  `param` varchar(255) DEFAULT NULL,
  `value` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_default_values` (`type`,`entity`,`user_id`,`page`,`param`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_delivery`
-- ----------------------------
DROP TABLE IF EXISTS `llx_delivery`;
CREATE TABLE `llx_delivery` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ref` varchar(30) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `fk_soc` int(11) NOT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `ref_int` varchar(255) DEFAULT NULL,
  `ref_customer` varchar(255) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `date_delivery` datetime DEFAULT NULL,
  `fk_address` int(11) DEFAULT NULL,
  `fk_statut` smallint(6) DEFAULT '0',
  `total_ht` double(24,8) DEFAULT '0.00000000',
  `note_private` text,
  `note_public` text,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `fk_incoterms` int(11) DEFAULT NULL,
  `location_incoterms` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_delivery_uk_ref` (`ref`,`entity`),
  KEY `idx_delivery_fk_soc` (`fk_soc`),
  KEY `idx_delivery_fk_user_author` (`fk_user_author`),
  KEY `idx_delivery_fk_user_valid` (`fk_user_valid`),
  CONSTRAINT `fk_delivery_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_delivery_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `fk_delivery_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_delivery_extrafields`
-- ----------------------------
DROP TABLE IF EXISTS `llx_delivery_extrafields`;
CREATE TABLE `llx_delivery_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_livraison_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_deliverydet`
-- ----------------------------
DROP TABLE IF EXISTS `llx_deliverydet`;
CREATE TABLE `llx_deliverydet` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_delivery` int(11) DEFAULT NULL,
  `fk_origin_line` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `description` text,
  `qty` double DEFAULT NULL,
  `subprice` double(24,8) DEFAULT '0.00000000',
  `total_ht` double(24,8) DEFAULT '0.00000000',
  `rang` int(11) DEFAULT '0',
  PRIMARY KEY (`rowid`),
  KEY `idx_deliverydet_fk_delivery` (`fk_delivery`),
  CONSTRAINT `fk_deliverydet_fk_delivery` FOREIGN KEY (`fk_delivery`) REFERENCES `llx_delivery` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_deliverydet_extrafields`
-- ----------------------------
DROP TABLE IF EXISTS `llx_deliverydet_extrafields`;
CREATE TABLE `llx_deliverydet_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_livraisondet_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_deplacement`
-- ----------------------------
DROP TABLE IF EXISTS `llx_deplacement`;
CREATE TABLE `llx_deplacement` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `datec` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dated` datetime DEFAULT NULL,
  `fk_user` int(11) NOT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `type` varchar(12) NOT NULL,
  `fk_statut` int(11) NOT NULL DEFAULT '1',
  `km` double DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT '0',
  `note_private` text,
  `note_public` text,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_document_model`
-- ----------------------------
DROP TABLE IF EXISTS `llx_document_model`;
CREATE TABLE `llx_document_model` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(50) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `type` varchar(64) DEFAULT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_document_model` (`nom`,`type`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_document_model`
-- ----------------------------
BEGIN;
INSERT INTO `llx_document_model` VALUES ('2', 'standard', '1', 'stock', null, null), ('3', 'stdmovement', '1', 'movement', null, null), ('4', 'rouget', '1', 'shipping', null, null), ('5', 'typhon', '1', 'delivery', null, null), ('9', 'azur', '1', 'propal', null, null), ('10', 'strato', '1', 'contract', null, null), ('11', 'aurore', '1', 'supplier_proposal', null, null), ('12', 'sepamandate', '1', 'bankaccount', null, null), ('13', '', '1', 'task', null, null), ('14', 'beluga', '1', 'project', null, null), ('15', 'baleine', '1', 'project', null, null), ('16', 'einstein', '1', 'order', null, null), ('17', 'standard', '1', 'expensereport', null, null), ('18', 'crabe', '1', 'invoice', null, null), ('19', 'muscadet', '1', 'order_supplier', null, null), ('20', 'sponge', '1', 'invoice', 'sponge', null), ('21', 'custom_order', '1', 'order', 'custom_order', null);
COMMIT;

-- ----------------------------
--  Table structure for `llx_don`
-- ----------------------------
DROP TABLE IF EXISTS `llx_don`;
CREATE TABLE `llx_don` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_statut` smallint(6) NOT NULL DEFAULT '0',
  `datedon` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT '0.00000000',
  `fk_payment` int(11) DEFAULT NULL,
  `paid` smallint(6) NOT NULL DEFAULT '0',
  `firstname` varchar(50) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `societe` varchar(50) DEFAULT NULL,
  `address` text,
  `zip` varchar(30) DEFAULT NULL,
  `town` varchar(50) DEFAULT NULL,
  `country` varchar(50) DEFAULT NULL,
  `fk_country` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(24) DEFAULT NULL,
  `phone_mobile` varchar(24) DEFAULT NULL,
  `public` smallint(6) NOT NULL DEFAULT '1',
  `fk_projet` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `fk_user_author` int(11) NOT NULL,
  `date_valid` datetime DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `model_pdf` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_don_extrafields`
-- ----------------------------
DROP TABLE IF EXISTS `llx_don_extrafields`;
CREATE TABLE `llx_don_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_don_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_ecm_directories`
-- ----------------------------
DROP TABLE IF EXISTS `llx_ecm_directories`;
CREATE TABLE `llx_ecm_directories` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(64) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `fk_parent` int(11) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `cachenbofdoc` int(11) NOT NULL DEFAULT '0',
  `fullpath` varchar(750) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `date_c` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_c` int(11) DEFAULT NULL,
  `fk_user_m` int(11) DEFAULT NULL,
  `acl` text,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_ecm_directories` (`label`,`fk_parent`,`entity`),
  KEY `idx_ecm_directories_fk_user_c` (`fk_user_c`),
  KEY `idx_ecm_directories_fk_user_m` (`fk_user_m`),
  CONSTRAINT `fk_ecm_directories_fk_user_c` FOREIGN KEY (`fk_user_c`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `fk_ecm_directories_fk_user_m` FOREIGN KEY (`fk_user_m`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_ecm_directories_extrafields`
-- ----------------------------
DROP TABLE IF EXISTS `llx_ecm_directories_extrafields`;
CREATE TABLE `llx_ecm_directories_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_ecm_directories_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_ecm_files`
-- ----------------------------
DROP TABLE IF EXISTS `llx_ecm_files`;
CREATE TABLE `llx_ecm_files` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(128) DEFAULT NULL,
  `label` varchar(128) NOT NULL,
  `share` varchar(128) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `filepath` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `src_object_type` varchar(64) DEFAULT NULL,
  `src_object_id` int(11) DEFAULT NULL,
  `fullpath_orig` varchar(750) DEFAULT NULL,
  `description` text,
  `keywords` varchar(750) DEFAULT NULL,
  `cover` text,
  `position` int(11) DEFAULT NULL,
  `gen_or_uploaded` varchar(12) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `date_c` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_c` int(11) DEFAULT NULL,
  `fk_user_m` int(11) DEFAULT NULL,
  `acl` text,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_ecm_files` (`filepath`,`filename`,`entity`),
  KEY `idx_ecm_files_label` (`label`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_ecm_files`
-- ----------------------------
BEGIN;
INSERT INTO `llx_ecm_files` VALUES ('1', '6ff10adf8e3d9126866bea3fe560ed96', '70ada04f51c11bdcaa1af3c6c89d6841', null, '1', 'commande/(PROV1)', '(PROV1).pdf', 'commande', '1', '', '', null, null, '1', 'generated', null, '2021-05-08 04:48:47', '2021-05-08 12:05:44', '1', '1', null);
COMMIT;

-- ----------------------------
--  Table structure for `llx_ecm_files_extrafields`
-- ----------------------------
DROP TABLE IF EXISTS `llx_ecm_files_extrafields`;
CREATE TABLE `llx_ecm_files_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_ecm_files_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_element_contact`
-- ----------------------------
DROP TABLE IF EXISTS `llx_element_contact`;
CREATE TABLE `llx_element_contact` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `datecreate` datetime DEFAULT NULL,
  `statut` smallint(6) DEFAULT '5',
  `element_id` int(11) NOT NULL,
  `fk_c_type_contact` int(11) NOT NULL,
  `fk_socpeople` int(11) NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_element_contact_idx1` (`element_id`,`fk_c_type_contact`,`fk_socpeople`),
  KEY `fk_element_contact_fk_c_type_contact` (`fk_c_type_contact`),
  KEY `idx_element_contact_fk_socpeople` (`fk_socpeople`),
  CONSTRAINT `fk_element_contact_fk_c_type_contact` FOREIGN KEY (`fk_c_type_contact`) REFERENCES `llx_c_type_contact` (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_element_contact`
-- ----------------------------
BEGIN;
INSERT INTO `llx_element_contact` VALUES ('2', '2021-05-08 15:06:20', '4', '1', '101', '1');
COMMIT;

-- ----------------------------
--  Table structure for `llx_element_element`
-- ----------------------------
DROP TABLE IF EXISTS `llx_element_element`;
CREATE TABLE `llx_element_element` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_source` int(11) NOT NULL,
  `sourcetype` varchar(32) NOT NULL,
  `fk_target` int(11) NOT NULL,
  `targettype` varchar(32) NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_element_element_idx1` (`fk_source`,`sourcetype`,`fk_target`,`targettype`),
  KEY `idx_element_element_fk_target` (`fk_target`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_element_resources`
-- ----------------------------
DROP TABLE IF EXISTS `llx_element_resources`;
CREATE TABLE `llx_element_resources` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `element_id` int(11) DEFAULT NULL,
  `element_type` varchar(64) DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `resource_type` varchar(64) DEFAULT NULL,
  `busy` int(11) DEFAULT NULL,
  `mandatory` int(11) DEFAULT NULL,
  `duree` double DEFAULT NULL,
  `fk_user_create` int(11) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_element_resources_idx1` (`resource_id`,`resource_type`,`element_id`,`element_type`),
  KEY `idx_element_element_element_id` (`element_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_emailcollector_emailcollector`
-- ----------------------------
DROP TABLE IF EXISTS `llx_emailcollector_emailcollector`;
CREATE TABLE `llx_emailcollector_emailcollector` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `ref` varchar(128) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` text,
  `host` varchar(255) DEFAULT NULL,
  `login` varchar(128) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `source_directory` varchar(255) NOT NULL,
  `target_directory` varchar(255) DEFAULT NULL,
  `datelastresult` datetime DEFAULT NULL,
  `codelastresult` varchar(16) DEFAULT NULL,
  `lastresult` varchar(255) DEFAULT NULL,
  `note_public` text,
  `note_private` text,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `datelastok` datetime DEFAULT NULL,
  `maxemailpercollect` int(11) DEFAULT '100',
  `hostcharset` varchar(16) DEFAULT 'UTF-8',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_emailcollector_emailcollector_ref` (`ref`,`entity`),
  KEY `idx_emailcollector_entity` (`entity`),
  KEY `idx_emailcollector_status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_emailcollector_emailcollectoraction`
-- ----------------------------
DROP TABLE IF EXISTS `llx_emailcollector_emailcollectoraction`;
CREATE TABLE `llx_emailcollector_emailcollectoraction` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_emailcollector` int(11) NOT NULL,
  `type` varchar(128) NOT NULL,
  `actionparam` varchar(255) DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT '0',
  `import_key` varchar(14) DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_emailcollector_emailcollectoraction` (`fk_emailcollector`,`type`),
  KEY `idx_emailcollector_fk_emailcollector` (`fk_emailcollector`),
  CONSTRAINT `fk_emailcollectoraction_fk_emailcollector` FOREIGN KEY (`fk_emailcollector`) REFERENCES `llx_emailcollector_emailcollector` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_emailcollector_emailcollectorfilter`
-- ----------------------------
DROP TABLE IF EXISTS `llx_emailcollector_emailcollectorfilter`;
CREATE TABLE `llx_emailcollector_emailcollectorfilter` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_emailcollector` int(11) NOT NULL,
  `type` varchar(128) NOT NULL,
  `rulevalue` varchar(128) DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_emailcollector_emailcollectorfilter` (`fk_emailcollector`,`type`,`rulevalue`),
  KEY `idx_emailcollector_fk_emailcollector` (`fk_emailcollector`),
  CONSTRAINT `fk_emailcollectorfilter_fk_emailcollector` FOREIGN KEY (`fk_emailcollector`) REFERENCES `llx_emailcollector_emailcollector` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_entrepot`
-- ----------------------------
DROP TABLE IF EXISTS `llx_entrepot`;
CREATE TABLE `llx_entrepot` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(255) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `entity` int(11) NOT NULL DEFAULT '1',
  `description` text,
  `lieu` varchar(64) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `town` varchar(50) DEFAULT NULL,
  `fk_departement` int(11) DEFAULT NULL,
  `fk_pays` int(11) DEFAULT '0',
  `statut` tinyint(4) DEFAULT '1',
  `fk_user_author` int(11) DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `fk_parent` int(11) DEFAULT '0',
  `fax` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_entrepot_label` (`ref`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_entrepot`
-- ----------------------------
BEGIN;
INSERT INTO `llx_entrepot` VALUES ('1', 'A1', '2021-05-06 15:30:52', '2021-05-07 03:43:10', '1', '', 'Almacén O Rosal', '', '', '', null, '4', '1', '1', null, null, null, '', '');
COMMIT;

-- ----------------------------
--  Table structure for `llx_entrepot_extrafields`
-- ----------------------------
DROP TABLE IF EXISTS `llx_entrepot_extrafields`;
CREATE TABLE `llx_entrepot_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_entrepot_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_establishment`
-- ----------------------------
DROP TABLE IF EXISTS `llx_establishment`;
CREATE TABLE `llx_establishment` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `name` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zip` varchar(25) DEFAULT NULL,
  `town` varchar(50) DEFAULT NULL,
  `fk_state` int(11) DEFAULT '0',
  `fk_country` int(11) DEFAULT '0',
  `profid1` varchar(20) DEFAULT NULL,
  `profid2` varchar(20) DEFAULT NULL,
  `profid3` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `fk_user_author` int(11) NOT NULL,
  `fk_user_mod` int(11) DEFAULT NULL,
  `datec` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(4) DEFAULT '1',
  `ref` varchar(30) NOT NULL,
  `label` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_event_element`
-- ----------------------------
DROP TABLE IF EXISTS `llx_event_element`;
CREATE TABLE `llx_event_element` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_source` int(11) NOT NULL,
  `fk_target` int(11) NOT NULL,
  `targettype` varchar(32) NOT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_events`
-- ----------------------------
DROP TABLE IF EXISTS `llx_events`;
CREATE TABLE `llx_events` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `type` varchar(32) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `dateevent` datetime DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `description` varchar(250) NOT NULL,
  `ip` varchar(250) NOT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `fk_object` int(11) DEFAULT NULL,
  `prefix_session` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_events_dateevent` (`dateevent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_expedition`
-- ----------------------------
DROP TABLE IF EXISTS `llx_expedition`;
CREATE TABLE `llx_expedition` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ref` varchar(30) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `fk_soc` int(11) NOT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `ref_int` varchar(255) DEFAULT NULL,
  `ref_customer` varchar(255) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `date_delivery` datetime DEFAULT NULL,
  `date_expedition` datetime DEFAULT NULL,
  `fk_address` int(11) DEFAULT NULL,
  `fk_shipping_method` int(11) DEFAULT NULL,
  `tracking_number` varchar(50) DEFAULT NULL,
  `fk_statut` smallint(6) DEFAULT '0',
  `billed` smallint(6) DEFAULT '0',
  `height` float DEFAULT NULL,
  `width` float DEFAULT NULL,
  `size_units` int(11) DEFAULT NULL,
  `size` float DEFAULT NULL,
  `weight_units` int(11) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `fk_incoterms` int(11) DEFAULT NULL,
  `location_incoterms` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_expedition_uk_ref` (`ref`,`entity`),
  KEY `idx_expedition_fk_soc` (`fk_soc`),
  KEY `idx_expedition_fk_user_author` (`fk_user_author`),
  KEY `idx_expedition_fk_user_valid` (`fk_user_valid`),
  KEY `idx_expedition_fk_shipping_method` (`fk_shipping_method`),
  CONSTRAINT `fk_expedition_fk_shipping_method` FOREIGN KEY (`fk_shipping_method`) REFERENCES `llx_c_shipment_mode` (`rowid`),
  CONSTRAINT `fk_expedition_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_expedition_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `fk_expedition_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_expedition_extrafields`
-- ----------------------------
DROP TABLE IF EXISTS `llx_expedition_extrafields`;
CREATE TABLE `llx_expedition_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_expedition_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_expedition_package`
-- ----------------------------
DROP TABLE IF EXISTS `llx_expedition_package`;
CREATE TABLE `llx_expedition_package` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_expedition` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `value` double(24,8) DEFAULT '0.00000000',
  `fk_parcel_type` int(11) DEFAULT NULL,
  `height` float DEFAULT NULL,
  `width` float DEFAULT NULL,
  `size` float DEFAULT NULL,
  `size_units` int(11) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `weight_units` int(11) DEFAULT NULL,
  `dangerous_goods` smallint(6) DEFAULT '0',
  `tail_lift` smallint(6) DEFAULT '0',
  `rang` int(11) DEFAULT '0',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_expeditiondet`
-- ----------------------------
DROP TABLE IF EXISTS `llx_expeditiondet`;
CREATE TABLE `llx_expeditiondet` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_expedition` int(11) NOT NULL,
  `fk_origin_line` int(11) DEFAULT NULL,
  `fk_entrepot` int(11) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `rang` int(11) DEFAULT '0',
  PRIMARY KEY (`rowid`),
  KEY `idx_expeditiondet_fk_expedition` (`fk_expedition`),
  KEY `idx_expeditiondet_fk_origin_line` (`fk_origin_line`),
  CONSTRAINT `fk_expeditiondet_fk_expedition` FOREIGN KEY (`fk_expedition`) REFERENCES `llx_expedition` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_expeditiondet_batch`
-- ----------------------------
DROP TABLE IF EXISTS `llx_expeditiondet_batch`;
CREATE TABLE `llx_expeditiondet_batch` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_expeditiondet` int(11) NOT NULL,
  `eatby` date DEFAULT NULL,
  `sellby` date DEFAULT NULL,
  `batch` varchar(128) DEFAULT NULL,
  `qty` double NOT NULL DEFAULT '0',
  `fk_origin_stock` int(11) NOT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_fk_expeditiondet` (`fk_expeditiondet`),
  CONSTRAINT `fk_expeditiondet_batch_fk_expeditiondet` FOREIGN KEY (`fk_expeditiondet`) REFERENCES `llx_expeditiondet` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_expeditiondet_extrafields`
-- ----------------------------
DROP TABLE IF EXISTS `llx_expeditiondet_extrafields`;
CREATE TABLE `llx_expeditiondet_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_expeditiondet_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_expensereport`
-- ----------------------------
DROP TABLE IF EXISTS `llx_expensereport`;
CREATE TABLE `llx_expensereport` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(50) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `ref_number_int` int(11) DEFAULT NULL,
  `ref_ext` int(11) DEFAULT NULL,
  `total_ht` double(24,8) DEFAULT '0.00000000',
  `total_tva` double(24,8) DEFAULT '0.00000000',
  `localtax1` double(24,8) DEFAULT '0.00000000',
  `localtax2` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT '0.00000000',
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `date_create` datetime NOT NULL,
  `date_valid` datetime DEFAULT NULL,
  `date_approve` datetime DEFAULT NULL,
  `date_refuse` datetime DEFAULT NULL,
  `date_cancel` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_author` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_user_validator` int(11) DEFAULT NULL,
  `fk_user_approve` int(11) DEFAULT NULL,
  `fk_user_refuse` int(11) DEFAULT NULL,
  `fk_user_cancel` int(11) DEFAULT NULL,
  `fk_statut` int(11) NOT NULL,
  `fk_c_paiement` int(11) DEFAULT NULL,
  `paid` smallint(6) NOT NULL DEFAULT '0',
  `note_public` text,
  `note_private` text,
  `detail_refuse` varchar(255) DEFAULT NULL,
  `detail_cancel` varchar(255) DEFAULT NULL,
  `integration_compta` int(11) DEFAULT NULL,
  `fk_bank_account` int(11) DEFAULT NULL,
  `model_pdf` varchar(50) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT '1.00000000',
  `multicurrency_total_ht` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_tva` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ttc` double(24,8) DEFAULT '0.00000000',
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_expensereport_uk_ref` (`ref`,`entity`),
  KEY `idx_expensereport_date_debut` (`date_debut`),
  KEY `idx_expensereport_date_fin` (`date_fin`),
  KEY `idx_expensereport_fk_statut` (`fk_statut`),
  KEY `idx_expensereport_fk_user_author` (`fk_user_author`),
  KEY `idx_expensereport_fk_user_valid` (`fk_user_valid`),
  KEY `idx_expensereport_fk_user_approve` (`fk_user_approve`),
  KEY `idx_expensereport_fk_refuse` (`fk_user_approve`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_expensereport_det`
-- ----------------------------
DROP TABLE IF EXISTS `llx_expensereport_det`;
CREATE TABLE `llx_expensereport_det` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_expensereport` int(11) NOT NULL,
  `docnumber` varchar(128) DEFAULT NULL,
  `fk_c_type_fees` int(11) NOT NULL,
  `fk_c_exp_tax_cat` int(11) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `comments` text NOT NULL,
  `product_type` int(11) DEFAULT '-1',
  `qty` double NOT NULL,
  `subprice` double(24,8) NOT NULL DEFAULT '0.00000000',
  `value_unit` double(24,8) NOT NULL,
  `remise_percent` double DEFAULT NULL,
  `vat_src_code` varchar(10) DEFAULT '',
  `tva_tx` double(6,3) DEFAULT NULL,
  `localtax1_tx` double(6,3) DEFAULT '0.000',
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(6,3) DEFAULT '0.000',
  `localtax2_type` varchar(10) DEFAULT NULL,
  `total_ht` double(24,8) NOT NULL DEFAULT '0.00000000',
  `total_tva` double(24,8) NOT NULL DEFAULT '0.00000000',
  `total_localtax1` double(24,8) DEFAULT '0.00000000',
  `total_localtax2` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) NOT NULL DEFAULT '0.00000000',
  `date` date NOT NULL,
  `info_bits` int(11) DEFAULT '0',
  `special_code` int(11) DEFAULT '0',
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ht` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_tva` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ttc` double(24,8) DEFAULT '0.00000000',
  `fk_facture` int(11) DEFAULT '0',
  `fk_code_ventilation` int(11) DEFAULT '0',
  `rang` int(11) DEFAULT '0',
  `import_key` varchar(14) DEFAULT NULL,
  `rule_warning_message` text,
  `fk_ecm_files` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_expensereport_extrafields`
-- ----------------------------
DROP TABLE IF EXISTS `llx_expensereport_extrafields`;
CREATE TABLE `llx_expensereport_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_expensereport_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_expensereport_ik`
-- ----------------------------
DROP TABLE IF EXISTS `llx_expensereport_ik`;
CREATE TABLE `llx_expensereport_ik` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_c_exp_tax_cat` int(11) NOT NULL DEFAULT '0',
  `fk_range` int(11) NOT NULL DEFAULT '0',
  `coef` double NOT NULL DEFAULT '0',
  `ikoffset` double NOT NULL DEFAULT '0',
  `active` int(11) DEFAULT '1',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_expensereport_ik`
-- ----------------------------
BEGIN;
INSERT INTO `llx_expensereport_ik` VALUES ('1', null, '2021-04-28 08:55:26', '4', '1', '0.41', '0', '1'), ('2', null, '2021-04-28 08:55:26', '4', '2', '0.244', '824', '1'), ('3', null, '2021-04-28 08:55:26', '4', '3', '0.286', '0', '1'), ('4', null, '2021-04-28 08:55:26', '5', '4', '0.493', '0', '1'), ('5', null, '2021-04-28 08:55:26', '5', '5', '0.277', '1082', '1'), ('6', null, '2021-04-28 08:55:26', '5', '6', '0.332', '0', '1'), ('7', null, '2021-04-28 08:55:26', '6', '7', '0.543', '0', '1'), ('8', null, '2021-04-28 08:55:26', '6', '8', '0.305', '1180', '1'), ('9', null, '2021-04-28 08:55:26', '6', '9', '0.364', '0', '1'), ('10', null, '2021-04-28 08:55:26', '7', '10', '0.568', '0', '1'), ('11', null, '2021-04-28 08:55:26', '7', '11', '0.32', '1244', '1'), ('12', null, '2021-04-28 08:55:26', '7', '12', '0.382', '0', '1'), ('13', null, '2021-04-28 08:55:26', '8', '13', '0.595', '0', '1'), ('14', null, '2021-04-28 08:55:26', '8', '14', '0.337', '1288', '1'), ('15', null, '2021-04-28 08:55:26', '8', '15', '0.401', '0', '1');
COMMIT;

-- ----------------------------
--  Table structure for `llx_expensereport_rules`
-- ----------------------------
DROP TABLE IF EXISTS `llx_expensereport_rules`;
CREATE TABLE `llx_expensereport_rules` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dates` datetime NOT NULL,
  `datee` datetime NOT NULL,
  `amount` double(24,8) NOT NULL,
  `restrictive` tinyint(4) NOT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `fk_usergroup` int(11) DEFAULT NULL,
  `fk_c_type_fees` int(11) NOT NULL,
  `code_expense_rules_type` varchar(50) NOT NULL,
  `is_for_all` tinyint(4) DEFAULT '0',
  `entity` int(11) DEFAULT '1',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_export_compta`
-- ----------------------------
DROP TABLE IF EXISTS `llx_export_compta`;
CREATE TABLE `llx_export_compta` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(12) NOT NULL,
  `date_export` datetime NOT NULL,
  `fk_user` int(11) NOT NULL,
  `note` text,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_export_model`
-- ----------------------------
DROP TABLE IF EXISTS `llx_export_model`;
CREATE TABLE `llx_export_model` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_user` int(11) NOT NULL DEFAULT '0',
  `label` varchar(50) NOT NULL,
  `type` varchar(20) NOT NULL,
  `field` text NOT NULL,
  `filter` text,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_export_model` (`label`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_extrafields`
-- ----------------------------
DROP TABLE IF EXISTS `llx_extrafields`;
CREATE TABLE `llx_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `elementtype` varchar(64) NOT NULL DEFAULT 'member',
  `label` varchar(255) NOT NULL,
  `type` varchar(8) DEFAULT NULL,
  `size` varchar(8) DEFAULT NULL,
  `fieldcomputed` text,
  `fielddefault` varchar(255) DEFAULT NULL,
  `fieldunique` int(11) DEFAULT '0',
  `fieldrequired` int(11) DEFAULT '0',
  `perms` varchar(255) DEFAULT NULL,
  `enabled` varchar(255) DEFAULT NULL,
  `pos` int(11) DEFAULT '0',
  `alwayseditable` int(11) DEFAULT '0',
  `param` text,
  `list` varchar(255) DEFAULT '1',
  `totalizable` tinyint(1) DEFAULT '0',
  `langs` varchar(64) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `help` text,
  `printable` int(11) DEFAULT '0',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_extrafields_name` (`name`,`entity`,`elementtype`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_extrafields`
-- ----------------------------
BEGIN;
INSERT INTO `llx_extrafields` VALUES ('1', 'ordfabr', '1', 'commandedet', 'Ord. Fabric.', 'varchar', '25', null, null, '0', '0', null, '1', '100', '1', 'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}', '1', '1', null, '1', '1', '2021-05-06 15:27:32', '2021-05-06 10:27:32', null, '1'), ('2', 'numped', '1', 'commandedet', 'Nº Pedido', 'varchar', '25', null, null, '0', '0', null, '1', '100', '1', 'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}', '1', '1', null, '1', '1', '2021-05-06 15:27:51', '2021-05-06 10:27:51', null, '1'), ('5', 'serie', '1', 'facture', 'Número de serie', 'sellist', '', null, null, '0', '0', null, '1', '1', '0', 'a:1:{s:7:\"options\";a:1:{s:51:\"numberseries:ref:rowid:: typedoc = 1 AND entity = 1\";s:0:\"\";}}', '-1', '0', null, '1', '1', '2021-05-06 15:33:01', '2021-05-06 10:33:01', null, '0'), ('6', 'serie', '1', 'facture_fourn', 'Número de serie', 'sellist', '', null, null, '0', '0', null, '1', '1', '0', 'a:1:{s:7:\"options\";a:1:{s:51:\"numberseries:ref:rowid:: typedoc = 2 AND entity = 1\";s:0:\"\";}}', '-1', '0', null, '1', '1', '2021-05-06 15:33:01', '2021-05-06 10:33:01', null, '0'), ('7', 'serie', '1', 'commande', 'Número de serie', 'sellist', '', null, null, '0', '0', null, '1', '1', '0', 'a:1:{s:7:\"options\";a:1:{s:51:\"numberseries:ref:rowid:: typedoc = 3 AND entity = 1\";s:0:\"\";}}', '-1', '0', null, '1', '1', '2021-05-06 15:33:01', '2021-05-06 10:33:01', null, '0'), ('8', 'serie', '1', 'commande_fournisseur', 'Número de serie', 'sellist', '', null, null, '0', '0', null, '1', '1', '0', 'a:1:{s:7:\"options\";a:1:{s:51:\"numberseries:ref:rowid:: typedoc = 4 AND entity = 1\";s:0:\"\";}}', '-1', '0', null, '1', '1', '2021-05-06 15:33:01', '2021-05-06 10:33:01', null, '0'), ('9', 'serie', '1', 'propal', 'Número de serie', 'sellist', '', null, null, '0', '0', null, '1', '1', '0', 'a:1:{s:7:\"options\";a:1:{s:51:\"numberseries:ref:rowid:: typedoc = 5 AND entity = 1\";s:0:\"\";}}', '-1', '0', null, '1', '1', '2021-05-06 15:33:01', '2021-05-06 10:33:01', null, '0'), ('10', 'palets', '1', 'commande', 'Palets', 'int', '10', null, null, '0', '0', null, '1', '100', '1', 'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}', '1', '1', null, '1', '1', '2021-05-07 14:07:05', '2021-05-07 09:07:05', null, '1'), ('11', 'bultos', '1', 'commande', 'Bultos', 'int', '10', null, null, '0', '0', null, '1', '100', '1', 'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}', '1', '1', null, '1', '1', '2021-05-07 14:07:21', '2021-05-07 09:07:21', null, '1'), ('12', 'peso', '1', 'commande', 'Peso', 'varchar', '25', null, null, '0', '0', null, '1', '100', '1', 'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}', '1', '1', null, '1', '1', '2021-05-07 14:07:50', '2021-05-07 09:07:50', null, '1'), ('17', 'undcaja', '1', 'product', 'Ud. Caja', 'int', '10', null, null, '0', '0', null, '1', '100', '1', 'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}', '1', '1', null, '1', '1', '2021-05-08 13:49:23', '2021-05-08 06:49:23', null, '1'), ('18', 'design', '1', 'product', 'Designación', 'varchar', '25', null, null, '0', '0', null, '1', '100', '1', 'a:1:{s:7:\"options\";a:1:{s:0:\"\";N;}}', '1', '1', null, '1', '1', '2021-05-08 13:49:31', '2021-05-08 06:49:31', null, '1');
COMMIT;

-- ----------------------------
--  Table structure for `llx_facture`
-- ----------------------------
DROP TABLE IF EXISTS `llx_facture`;
CREATE TABLE `llx_facture` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `ref_ext` varchar(255) DEFAULT NULL,
  `ref_int` varchar(255) DEFAULT NULL,
  `ref_client` varchar(255) DEFAULT NULL,
  `type` smallint(6) NOT NULL DEFAULT '0',
  `increment` varchar(10) DEFAULT NULL,
  `fk_soc` int(11) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `datef` date DEFAULT NULL,
  `date_pointoftax` date DEFAULT NULL,
  `date_valid` date DEFAULT NULL,
  `date_closing` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `paye` smallint(6) NOT NULL DEFAULT '0',
  `amount` double(24,8) NOT NULL DEFAULT '0.00000000',
  `remise_percent` double DEFAULT '0',
  `remise_absolue` double DEFAULT '0',
  `remise` double DEFAULT '0',
  `close_code` varchar(16) DEFAULT NULL,
  `close_note` varchar(128) DEFAULT NULL,
  `tva` double(24,8) DEFAULT '0.00000000',
  `localtax1` double(24,8) DEFAULT '0.00000000',
  `localtax2` double(24,8) DEFAULT '0.00000000',
  `revenuestamp` double(24,8) DEFAULT '0.00000000',
  `total` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT '0.00000000',
  `fk_statut` smallint(6) NOT NULL DEFAULT '0',
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_user_closing` int(11) DEFAULT NULL,
  `fk_fac_rec_source` int(11) DEFAULT NULL,
  `fk_facture_source` int(11) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `fk_account` int(11) DEFAULT NULL,
  `fk_currency` varchar(3) DEFAULT NULL,
  `fk_cond_reglement` int(11) NOT NULL DEFAULT '1',
  `fk_mode_reglement` int(11) DEFAULT NULL,
  `date_lim_reglement` date DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `fk_incoterms` int(11) DEFAULT NULL,
  `location_incoterms` varchar(255) DEFAULT NULL,
  `fk_transport_mode` int(11) DEFAULT NULL,
  `situation_cycle_ref` smallint(6) DEFAULT NULL,
  `situation_counter` smallint(6) DEFAULT NULL,
  `situation_final` smallint(6) DEFAULT NULL,
  `retained_warranty` double DEFAULT NULL,
  `retained_warranty_date_limit` date DEFAULT NULL,
  `retained_warranty_fk_cond_reglement` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT '1.00000000',
  `multicurrency_total_ht` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_tva` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ttc` double(24,8) DEFAULT '0.00000000',
  `module_source` varchar(32) DEFAULT NULL,
  `pos_source` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_facture_ref` (`ref`,`entity`),
  KEY `idx_facture_fk_soc` (`fk_soc`),
  KEY `idx_facture_fk_user_author` (`fk_user_author`),
  KEY `idx_facture_fk_user_valid` (`fk_user_valid`),
  KEY `idx_facture_fk_facture_source` (`fk_facture_source`),
  KEY `idx_facture_fk_projet` (`fk_projet`),
  KEY `idx_facture_fk_account` (`fk_account`),
  KEY `idx_facture_fk_currency` (`fk_currency`),
  KEY `idx_facture_fk_statut` (`fk_statut`),
  CONSTRAINT `fk_facture_fk_facture_source` FOREIGN KEY (`fk_facture_source`) REFERENCES `llx_facture` (`rowid`),
  CONSTRAINT `fk_facture_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `llx_projet` (`rowid`),
  CONSTRAINT `fk_facture_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_facture_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `fk_facture_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_facture_extrafields`
-- ----------------------------
DROP TABLE IF EXISTS `llx_facture_extrafields`;
CREATE TABLE `llx_facture_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `serie` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_facture_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_facture_fourn`
-- ----------------------------
DROP TABLE IF EXISTS `llx_facture_fourn`;
CREATE TABLE `llx_facture_fourn` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(180) NOT NULL,
  `ref_supplier` varchar(180) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `ref_ext` varchar(255) DEFAULT NULL,
  `type` smallint(6) NOT NULL DEFAULT '0',
  `fk_soc` int(11) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `datef` date DEFAULT NULL,
  `date_pointoftax` date DEFAULT NULL,
  `date_valid` date DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `libelle` varchar(255) DEFAULT NULL,
  `paye` smallint(6) NOT NULL DEFAULT '0',
  `amount` double(24,8) NOT NULL DEFAULT '0.00000000',
  `remise` double(24,8) DEFAULT '0.00000000',
  `close_code` varchar(16) DEFAULT NULL,
  `close_note` varchar(128) DEFAULT NULL,
  `tva` double(24,8) DEFAULT '0.00000000',
  `localtax1` double(24,8) DEFAULT '0.00000000',
  `localtax2` double(24,8) DEFAULT '0.00000000',
  `total_ht` double(24,8) DEFAULT '0.00000000',
  `total_tva` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT '0.00000000',
  `fk_statut` smallint(6) NOT NULL DEFAULT '0',
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_facture_source` int(11) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `fk_account` int(11) DEFAULT NULL,
  `fk_cond_reglement` int(11) DEFAULT NULL,
  `fk_mode_reglement` int(11) DEFAULT NULL,
  `date_lim_reglement` date DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `fk_incoterms` int(11) DEFAULT NULL,
  `location_incoterms` varchar(255) DEFAULT NULL,
  `fk_transport_mode` int(11) DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT '1.00000000',
  `multicurrency_total_ht` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_tva` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ttc` double(24,8) DEFAULT '0.00000000',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_facture_fourn_ref` (`ref`,`entity`),
  UNIQUE KEY `uk_facture_fourn_ref_supplier` (`ref_supplier`,`fk_soc`,`entity`),
  KEY `idx_facture_fourn_date_lim_reglement` (`date_lim_reglement`),
  KEY `idx_facture_fourn_fk_soc` (`fk_soc`),
  KEY `idx_facture_fourn_fk_user_author` (`fk_user_author`),
  KEY `idx_facture_fourn_fk_user_valid` (`fk_user_valid`),
  KEY `idx_facture_fourn_fk_projet` (`fk_projet`),
  CONSTRAINT `fk_facture_fourn_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `llx_projet` (`rowid`),
  CONSTRAINT `fk_facture_fourn_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_facture_fourn_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `fk_facture_fourn_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_facture_fourn_det`
-- ----------------------------
DROP TABLE IF EXISTS `llx_facture_fourn_det`;
CREATE TABLE `llx_facture_fourn_det` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_facture_fourn` int(11) NOT NULL,
  `fk_parent_line` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `ref` varchar(50) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` text,
  `pu_ht` double(24,8) DEFAULT NULL,
  `pu_ttc` double(24,8) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT '0',
  `vat_src_code` varchar(10) DEFAULT '',
  `tva_tx` double(6,3) DEFAULT NULL,
  `localtax1_tx` double(6,3) DEFAULT '0.000',
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(6,3) DEFAULT '0.000',
  `localtax2_type` varchar(10) DEFAULT NULL,
  `total_ht` double(24,8) DEFAULT NULL,
  `tva` double(24,8) DEFAULT NULL,
  `total_localtax1` double(24,8) DEFAULT '0.00000000',
  `total_localtax2` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT NULL,
  `product_type` int(11) DEFAULT '0',
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `info_bits` int(11) DEFAULT '0',
  `fk_code_ventilation` int(11) NOT NULL DEFAULT '0',
  `special_code` int(11) DEFAULT '0',
  `rang` int(11) DEFAULT '0',
  `import_key` varchar(14) DEFAULT NULL,
  `fk_unit` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ht` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_tva` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ttc` double(24,8) DEFAULT '0.00000000',
  PRIMARY KEY (`rowid`),
  KEY `idx_facture_fourn_det_fk_facture` (`fk_facture_fourn`),
  KEY `idx_facture_fourn_det_fk_product` (`fk_product`),
  KEY `idx_facture_fourn_det_fk_code_ventilation` (`fk_code_ventilation`),
  KEY `fk_facture_fourn_det_fk_unit` (`fk_unit`),
  CONSTRAINT `fk_facture_fourn_det_fk_facture` FOREIGN KEY (`fk_facture_fourn`) REFERENCES `llx_facture_fourn` (`rowid`),
  CONSTRAINT `fk_facture_fourn_det_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `llx_c_units` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_facture_fourn_det_extrafields`
-- ----------------------------
DROP TABLE IF EXISTS `llx_facture_fourn_det_extrafields`;
CREATE TABLE `llx_facture_fourn_det_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_facture_fourn_det_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_facture_fourn_extrafields`
-- ----------------------------
DROP TABLE IF EXISTS `llx_facture_fourn_extrafields`;
CREATE TABLE `llx_facture_fourn_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `serie` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_facture_fourn_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_facture_rec`
-- ----------------------------
DROP TABLE IF EXISTS `llx_facture_rec`;
CREATE TABLE `llx_facture_rec` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(200) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `fk_soc` int(11) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `suspended` int(11) DEFAULT '0',
  `amount` double(24,8) NOT NULL DEFAULT '0.00000000',
  `remise` double DEFAULT '0',
  `remise_percent` double DEFAULT '0',
  `remise_absolue` double DEFAULT '0',
  `vat_src_code` varchar(10) DEFAULT '',
  `tva` double(24,8) DEFAULT '0.00000000',
  `localtax1` double(24,8) DEFAULT '0.00000000',
  `localtax2` double(24,8) DEFAULT '0.00000000',
  `revenuestamp` double(24,8) DEFAULT '0.00000000',
  `total` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT '0.00000000',
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `fk_cond_reglement` int(11) NOT NULL DEFAULT '1',
  `fk_mode_reglement` int(11) DEFAULT '0',
  `date_lim_reglement` date DEFAULT NULL,
  `fk_account` int(11) DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `modelpdf` varchar(255) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT '1.00000000',
  `multicurrency_total_ht` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_tva` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ttc` double(24,8) DEFAULT '0.00000000',
  `usenewprice` int(11) DEFAULT '0',
  `frequency` int(11) DEFAULT NULL,
  `unit_frequency` varchar(2) DEFAULT 'm',
  `date_when` datetime DEFAULT NULL,
  `date_last_gen` datetime DEFAULT NULL,
  `nb_gen_done` int(11) DEFAULT NULL,
  `nb_gen_max` int(11) DEFAULT NULL,
  `auto_validate` int(11) DEFAULT '0',
  `generate_pdf` int(11) DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_facture_rec_uk_titre` (`titre`,`entity`),
  KEY `idx_facture_rec_fk_soc` (`fk_soc`),
  KEY `idx_facture_rec_fk_user_author` (`fk_user_author`),
  KEY `idx_facture_rec_fk_projet` (`fk_projet`),
  CONSTRAINT `fk_facture_rec_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `llx_projet` (`rowid`),
  CONSTRAINT `fk_facture_rec_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_facture_rec_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_facture_rec_extrafields`
-- ----------------------------
DROP TABLE IF EXISTS `llx_facture_rec_extrafields`;
CREATE TABLE `llx_facture_rec_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_facture_rec_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_facturedet`
-- ----------------------------
DROP TABLE IF EXISTS `llx_facturedet`;
CREATE TABLE `llx_facturedet` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_facture` int(11) NOT NULL,
  `fk_parent_line` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` text,
  `vat_src_code` varchar(10) DEFAULT '',
  `tva_tx` double(6,3) DEFAULT NULL,
  `localtax1_tx` double(6,3) DEFAULT '0.000',
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(6,3) DEFAULT '0.000',
  `localtax2_type` varchar(10) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT '0',
  `remise` double DEFAULT '0',
  `fk_remise_except` int(11) DEFAULT NULL,
  `subprice` double(24,8) DEFAULT NULL,
  `price` double(24,8) DEFAULT NULL,
  `total_ht` double(24,8) DEFAULT NULL,
  `total_tva` double(24,8) DEFAULT NULL,
  `total_localtax1` double(24,8) DEFAULT '0.00000000',
  `total_localtax2` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT NULL,
  `product_type` int(11) DEFAULT '0',
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `info_bits` int(11) DEFAULT '0',
  `buy_price_ht` double(24,8) DEFAULT '0.00000000',
  `fk_product_fournisseur_price` int(11) DEFAULT NULL,
  `fk_code_ventilation` int(11) NOT NULL DEFAULT '0',
  `special_code` int(11) DEFAULT '0',
  `rang` int(11) DEFAULT '0',
  `fk_contract_line` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `situation_percent` double DEFAULT '100',
  `fk_prev_id` int(11) DEFAULT NULL,
  `fk_unit` int(11) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ht` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_tva` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ttc` double(24,8) DEFAULT '0.00000000',
  `ref_ext` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_fk_remise_except` (`fk_remise_except`,`fk_facture`),
  KEY `idx_facturedet_fk_facture` (`fk_facture`),
  KEY `idx_facturedet_fk_product` (`fk_product`),
  KEY `idx_facturedet_fk_code_ventilation` (`fk_code_ventilation`),
  KEY `fk_facturedet_fk_unit` (`fk_unit`),
  CONSTRAINT `fk_facturedet_fk_facture` FOREIGN KEY (`fk_facture`) REFERENCES `llx_facture` (`rowid`),
  CONSTRAINT `fk_facturedet_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `llx_c_units` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_facturedet_extrafields`
-- ----------------------------
DROP TABLE IF EXISTS `llx_facturedet_extrafields`;
CREATE TABLE `llx_facturedet_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_facturedet_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_facturedet_rec`
-- ----------------------------
DROP TABLE IF EXISTS `llx_facturedet_rec`;
CREATE TABLE `llx_facturedet_rec` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_facture` int(11) NOT NULL,
  `fk_parent_line` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `product_type` int(11) DEFAULT '0',
  `label` varchar(255) DEFAULT NULL,
  `description` text,
  `vat_src_code` varchar(10) DEFAULT '',
  `tva_tx` double(6,3) DEFAULT NULL,
  `localtax1_tx` double(6,3) DEFAULT '0.000',
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(6,3) DEFAULT '0.000',
  `localtax2_type` varchar(10) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT '0',
  `remise` double DEFAULT '0',
  `subprice` double(24,8) DEFAULT NULL,
  `price` double(24,8) DEFAULT NULL,
  `total_ht` double(24,8) DEFAULT NULL,
  `total_tva` double(24,8) DEFAULT NULL,
  `total_localtax1` double(24,8) DEFAULT '0.00000000',
  `total_localtax2` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT NULL,
  `date_start_fill` int(11) DEFAULT '0',
  `date_end_fill` int(11) DEFAULT '0',
  `info_bits` int(11) DEFAULT '0',
  `special_code` int(10) unsigned DEFAULT '0',
  `rang` int(11) DEFAULT '0',
  `fk_contract_line` int(11) DEFAULT NULL,
  `fk_unit` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ht` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_tva` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ttc` double(24,8) DEFAULT '0.00000000',
  `buy_price_ht` double(24,8) DEFAULT '0.00000000',
  `fk_product_fournisseur_price` int(11) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `fk_facturedet_rec_fk_unit` (`fk_unit`),
  CONSTRAINT `fk_facturedet_rec_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `llx_c_units` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_facturedet_rec_extrafields`
-- ----------------------------
DROP TABLE IF EXISTS `llx_facturedet_rec_extrafields`;
CREATE TABLE `llx_facturedet_rec_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_facturedet_rec_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_fichinter`
-- ----------------------------
DROP TABLE IF EXISTS `llx_fichinter`;
CREATE TABLE `llx_fichinter` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_soc` int(11) NOT NULL,
  `fk_projet` int(11) DEFAULT '0',
  `fk_contrat` int(11) DEFAULT '0',
  `ref` varchar(30) NOT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `datei` date DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_statut` smallint(6) DEFAULT '0',
  `dateo` date DEFAULT NULL,
  `datee` date DEFAULT NULL,
  `datet` date DEFAULT NULL,
  `duree` double DEFAULT NULL,
  `description` text,
  `note_private` text,
  `note_public` text,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_fichinter_ref` (`ref`,`entity`),
  KEY `idx_fichinter_fk_soc` (`fk_soc`),
  CONSTRAINT `fk_fichinter_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_fichinter_extrafields`
-- ----------------------------
DROP TABLE IF EXISTS `llx_fichinter_extrafields`;
CREATE TABLE `llx_fichinter_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_ficheinter_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_fichinter_rec`
-- ----------------------------
DROP TABLE IF EXISTS `llx_fichinter_rec`;
CREATE TABLE `llx_fichinter_rec` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(50) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `fk_soc` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `fk_contrat` int(11) DEFAULT '0',
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `duree` double DEFAULT NULL,
  `description` text,
  `modelpdf` varchar(50) DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `frequency` int(11) DEFAULT NULL,
  `unit_frequency` varchar(2) DEFAULT 'm',
  `date_when` datetime DEFAULT NULL,
  `date_last_gen` datetime DEFAULT NULL,
  `nb_gen_done` int(11) DEFAULT NULL,
  `nb_gen_max` int(11) DEFAULT NULL,
  `auto_validate` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_fichinter_rec_uk_titre` (`titre`,`entity`),
  KEY `idx_fichinter_rec_fk_soc` (`fk_soc`),
  KEY `idx_fichinter_rec_fk_user_author` (`fk_user_author`),
  KEY `idx_fichinter_rec_fk_projet` (`fk_projet`),
  CONSTRAINT `fk_fichinter_rec_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `llx_projet` (`rowid`),
  CONSTRAINT `fk_fichinter_rec_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_fichinterdet`
-- ----------------------------
DROP TABLE IF EXISTS `llx_fichinterdet`;
CREATE TABLE `llx_fichinterdet` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_fichinter` int(11) DEFAULT NULL,
  `fk_parent_line` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `description` text,
  `duree` int(11) DEFAULT NULL,
  `rang` int(11) DEFAULT '0',
  PRIMARY KEY (`rowid`),
  KEY `idx_fichinterdet_fk_fichinter` (`fk_fichinter`),
  CONSTRAINT `fk_fichinterdet_fk_fichinter` FOREIGN KEY (`fk_fichinter`) REFERENCES `llx_fichinter` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_fichinterdet_extrafields`
-- ----------------------------
DROP TABLE IF EXISTS `llx_fichinterdet_extrafields`;
CREATE TABLE `llx_fichinterdet_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_ficheinterdet_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_fichinterdet_rec`
-- ----------------------------
DROP TABLE IF EXISTS `llx_fichinterdet_rec`;
CREATE TABLE `llx_fichinterdet_rec` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_fichinter` int(11) NOT NULL,
  `date` datetime DEFAULT NULL,
  `description` text,
  `duree` int(11) DEFAULT NULL,
  `rang` int(11) DEFAULT '0',
  `total_ht` double(24,8) DEFAULT NULL,
  `subprice` double(24,8) DEFAULT NULL,
  `fk_parent_line` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `tva_tx` double(6,3) DEFAULT NULL,
  `localtax1_tx` double(6,3) DEFAULT '0.000',
  `localtax1_type` varchar(1) DEFAULT NULL,
  `localtax2_tx` double(6,3) DEFAULT '0.000',
  `localtax2_type` varchar(1) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT '0',
  `remise` double DEFAULT '0',
  `fk_remise_except` int(11) DEFAULT NULL,
  `price` double(24,8) DEFAULT NULL,
  `total_tva` double(24,8) DEFAULT NULL,
  `total_localtax1` double(24,8) DEFAULT '0.00000000',
  `total_localtax2` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT NULL,
  `product_type` int(11) DEFAULT '0',
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `info_bits` int(11) DEFAULT '0',
  `buy_price_ht` double(24,8) DEFAULT '0.00000000',
  `fk_product_fournisseur_price` int(11) DEFAULT NULL,
  `fk_code_ventilation` int(11) NOT NULL DEFAULT '0',
  `fk_export_commpta` int(11) NOT NULL DEFAULT '0',
  `special_code` int(10) unsigned DEFAULT '0',
  `fk_unit` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_holiday`
-- ----------------------------
DROP TABLE IF EXISTS `llx_holiday`;
CREATE TABLE `llx_holiday` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) NOT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `fk_user` int(11) NOT NULL,
  `fk_user_create` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_type` int(11) NOT NULL,
  `date_create` datetime NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_debut` date NOT NULL,
  `date_fin` date NOT NULL,
  `halfday` int(11) DEFAULT '0',
  `statut` int(11) NOT NULL DEFAULT '1',
  `fk_validator` int(11) NOT NULL,
  `date_valid` datetime DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `date_refuse` datetime DEFAULT NULL,
  `fk_user_refuse` int(11) DEFAULT NULL,
  `date_cancel` datetime DEFAULT NULL,
  `fk_user_cancel` int(11) DEFAULT NULL,
  `detail_refuse` varchar(250) DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_holiday_entity` (`entity`),
  KEY `idx_holiday_fk_user` (`fk_user`),
  KEY `idx_holiday_fk_user_create` (`fk_user_create`),
  KEY `idx_holiday_date_create` (`date_create`),
  KEY `idx_holiday_date_debut` (`date_debut`),
  KEY `idx_holiday_date_fin` (`date_fin`),
  KEY `idx_holiday_fk_validator` (`fk_validator`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_holiday_config`
-- ----------------------------
DROP TABLE IF EXISTS `llx_holiday_config`;
CREATE TABLE `llx_holiday_config` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `value` text,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_holiday_config` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_holiday_config`
-- ----------------------------
BEGIN;
INSERT INTO `llx_holiday_config` VALUES ('1', 'lastUpdate', null);
COMMIT;

-- ----------------------------
--  Table structure for `llx_holiday_extrafields`
-- ----------------------------
DROP TABLE IF EXISTS `llx_holiday_extrafields`;
CREATE TABLE `llx_holiday_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_holiday_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_holiday_logs`
-- ----------------------------
DROP TABLE IF EXISTS `llx_holiday_logs`;
CREATE TABLE `llx_holiday_logs` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `date_action` datetime NOT NULL,
  `fk_user_action` int(11) NOT NULL,
  `fk_user_update` int(11) NOT NULL,
  `fk_type` int(11) NOT NULL,
  `type_action` varchar(255) NOT NULL,
  `prev_solde` varchar(255) NOT NULL,
  `new_solde` varchar(255) NOT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_holiday_users`
-- ----------------------------
DROP TABLE IF EXISTS `llx_holiday_users`;
CREATE TABLE `llx_holiday_users` (
  `fk_user` int(11) NOT NULL,
  `fk_type` int(11) NOT NULL,
  `nb_holiday` double NOT NULL DEFAULT '0',
  UNIQUE KEY `uk_holiday_users` (`fk_user`,`fk_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_import_model`
-- ----------------------------
DROP TABLE IF EXISTS `llx_import_model`;
CREATE TABLE `llx_import_model` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_user` int(11) NOT NULL DEFAULT '0',
  `label` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `field` text NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_import_model` (`label`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_intracommreport`
-- ----------------------------
DROP TABLE IF EXISTS `llx_intracommreport`;
CREATE TABLE `llx_intracommreport` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `type_declaration` varchar(32) DEFAULT NULL,
  `periods` varchar(32) DEFAULT NULL,
  `mode` varchar(32) DEFAULT NULL,
  `content_xml` text,
  `type_export` varchar(10) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_inventory`
-- ----------------------------
DROP TABLE IF EXISTS `llx_inventory`;
CREATE TABLE `llx_inventory` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) DEFAULT '0',
  `ref` varchar(48) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_warehouse` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `date_inventory` datetime DEFAULT NULL,
  `date_validation` datetime DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_inventory_ref` (`ref`,`entity`),
  KEY `idx_inventory_tms` (`tms`),
  KEY `idx_inventory_date_creation` (`date_creation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_inventorydet`
-- ----------------------------
DROP TABLE IF EXISTS `llx_inventorydet`;
CREATE TABLE `llx_inventorydet` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_inventory` int(11) DEFAULT '0',
  `fk_warehouse` int(11) DEFAULT '0',
  `fk_product` int(11) DEFAULT '0',
  `batch` varchar(30) DEFAULT NULL,
  `qty_view` double DEFAULT NULL,
  `qty_stock` double DEFAULT NULL,
  `qty_regulated` double DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_inventorydet` (`fk_inventory`,`fk_warehouse`,`fk_product`,`batch`),
  KEY `idx_inventorydet_tms` (`tms`),
  KEY `idx_inventorydet_datec` (`datec`),
  KEY `idx_inventorydet_fk_inventory` (`fk_inventory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_links`
-- ----------------------------
DROP TABLE IF EXISTS `llx_links`;
CREATE TABLE `llx_links` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `datea` datetime NOT NULL,
  `url` varchar(255) NOT NULL,
  `label` varchar(255) NOT NULL,
  `objecttype` varchar(255) NOT NULL,
  `objectid` int(11) NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_links` (`objectid`,`label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_loan`
-- ----------------------------
DROP TABLE IF EXISTS `llx_loan`;
CREATE TABLE `llx_loan` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `label` varchar(80) NOT NULL,
  `fk_bank` int(11) DEFAULT NULL,
  `capital` double(24,8) NOT NULL DEFAULT '0.00000000',
  `datestart` date DEFAULT NULL,
  `dateend` date DEFAULT NULL,
  `nbterm` double DEFAULT NULL,
  `rate` double NOT NULL,
  `note_private` text,
  `note_public` text,
  `capital_position` double(24,8) DEFAULT '0.00000000',
  `date_position` date DEFAULT NULL,
  `paid` smallint(6) NOT NULL DEFAULT '0',
  `accountancy_account_capital` varchar(32) DEFAULT NULL,
  `accountancy_account_insurance` varchar(32) DEFAULT NULL,
  `accountancy_account_interest` varchar(32) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `insurance_amount` double(24,8) DEFAULT '0.00000000',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_loan_schedule`
-- ----------------------------
DROP TABLE IF EXISTS `llx_loan_schedule`;
CREATE TABLE `llx_loan_schedule` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_loan` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datep` datetime DEFAULT NULL,
  `amount_capital` double(24,8) DEFAULT '0.00000000',
  `amount_insurance` double(24,8) DEFAULT '0.00000000',
  `amount_interest` double(24,8) DEFAULT '0.00000000',
  `fk_typepayment` int(11) NOT NULL,
  `num_payment` varchar(50) DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `fk_bank` int(11) NOT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_payment_loan` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_localtax`
-- ----------------------------
DROP TABLE IF EXISTS `llx_localtax`;
CREATE TABLE `llx_localtax` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `localtaxtype` tinyint(4) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datep` date DEFAULT NULL,
  `datev` date DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `note` text,
  `fk_bank` int(11) DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_mailing`
-- ----------------------------
DROP TABLE IF EXISTS `llx_mailing`;
CREATE TABLE `llx_mailing` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `statut` smallint(6) DEFAULT '0',
  `titre` varchar(128) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `sujet` varchar(128) DEFAULT NULL,
  `body` mediumtext,
  `bgcolor` varchar(8) DEFAULT NULL,
  `bgimage` varchar(255) DEFAULT NULL,
  `cible` varchar(60) DEFAULT NULL,
  `nbemail` int(11) DEFAULT NULL,
  `email_from` varchar(160) DEFAULT NULL,
  `email_replyto` varchar(160) DEFAULT NULL,
  `email_errorsto` varchar(160) DEFAULT NULL,
  `tag` varchar(128) DEFAULT NULL,
  `date_creat` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `date_appro` datetime DEFAULT NULL,
  `date_envoi` datetime DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_user_appro` int(11) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `joined_file1` varchar(255) DEFAULT NULL,
  `joined_file2` varchar(255) DEFAULT NULL,
  `joined_file3` varchar(255) DEFAULT NULL,
  `joined_file4` varchar(255) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_mailing_cibles`
-- ----------------------------
DROP TABLE IF EXISTS `llx_mailing_cibles`;
CREATE TABLE `llx_mailing_cibles` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_mailing` int(11) NOT NULL,
  `fk_contact` int(11) NOT NULL,
  `lastname` varchar(160) DEFAULT NULL,
  `firstname` varchar(160) DEFAULT NULL,
  `email` varchar(160) NOT NULL,
  `other` varchar(255) DEFAULT NULL,
  `tag` varchar(128) DEFAULT NULL,
  `statut` smallint(6) NOT NULL DEFAULT '0',
  `source_url` varchar(255) DEFAULT NULL,
  `source_id` int(11) DEFAULT NULL,
  `source_type` varchar(16) DEFAULT NULL,
  `date_envoi` datetime DEFAULT NULL,
  `error_text` varchar(255) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_mailing_cibles` (`fk_mailing`,`email`),
  KEY `idx_mailing_cibles_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_mailing_unsubscribe`
-- ----------------------------
DROP TABLE IF EXISTS `llx_mailing_unsubscribe`;
CREATE TABLE `llx_mailing_unsubscribe` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `email` varchar(255) DEFAULT NULL,
  `unsubscribegroup` varchar(128) DEFAULT '',
  `ip` varchar(128) DEFAULT NULL,
  `date_creat` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_mailing_unsubscribe` (`email`,`entity`,`unsubscribegroup`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_menu`
-- ----------------------------
DROP TABLE IF EXISTS `llx_menu`;
CREATE TABLE `llx_menu` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `menu_handler` varchar(16) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `module` varchar(255) DEFAULT NULL,
  `type` varchar(4) NOT NULL,
  `mainmenu` varchar(100) NOT NULL,
  `leftmenu` varchar(100) DEFAULT NULL,
  `fk_menu` int(11) NOT NULL,
  `fk_mainmenu` varchar(100) DEFAULT NULL,
  `fk_leftmenu` varchar(100) DEFAULT NULL,
  `position` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `target` varchar(100) DEFAULT NULL,
  `titre` varchar(255) NOT NULL,
  `langs` varchar(100) DEFAULT NULL,
  `level` smallint(6) DEFAULT NULL,
  `perms` text,
  `enabled` text,
  `usertype` int(11) NOT NULL DEFAULT '0',
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_menu_uk_menu` (`menu_handler`,`fk_menu`,`position`,`url`,`entity`),
  KEY `idx_menu_menuhandler_type` (`menu_handler`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_menu`
-- ----------------------------
BEGIN;
INSERT INTO `llx_menu` VALUES ('5', 'all', '1', 'margins', 'left', 'billing', 'margins', '-1', 'billing', null, '100', '/margin/index.php', '', 'Margins', 'margins', null, '$user->rights->margins->liretous', '$conf->margin->enabled', '2', '2021-05-06 04:34:18'), ('20', 'all', '1', 'resource', 'left', 'tools', 'resource', '-1', 'tools', null, '100', '/resource/list.php', '', 'MenuResourceIndex', 'resource', null, '$user->rights->resource->read', '1', '0', '2021-05-06 04:34:31'), ('21', 'all', '1', 'resource', 'left', 'tools', 'resource_add', '-1', 'tools', 'resource', '101', '/resource/card.php?action=create', '', 'MenuResourceAdd', 'resource', null, '$user->rights->resource->write', '1', '0', '2021-05-06 04:34:31'), ('22', 'all', '1', 'resource', 'left', 'tools', 'resource_list', '-1', 'tools', 'resource', '102', '/resource/list.php', '', 'List', 'resource', null, '$user->rights->resource->read', '1', '0', '2021-05-06 04:34:31'), ('30', 'all', '1', 'agenda', 'top', 'agenda', null, '0', null, null, '86', '/comm/action/index.php', '', 'TMenuAgenda', 'agenda', null, '$user->rights->agenda->myactions->read', '$conf->agenda->enabled', '2', '2021-05-06 04:49:20'), ('31', 'all', '1', 'agenda', 'left', 'agenda', null, '30', null, null, '100', '/comm/action/index.php?mainmenu=agenda&amp;leftmenu=agenda', '', 'Actions', 'agenda', null, '$user->rights->agenda->myactions->read', '$conf->agenda->enabled', '2', '2021-05-06 04:49:20'), ('32', 'all', '1', 'agenda', 'left', 'agenda', null, '31', null, null, '101', '/comm/action/card.php?mainmenu=agenda&amp;leftmenu=agenda&amp;action=create', '', 'NewAction', 'commercial', null, '($user->rights->agenda->myactions->create||$user->rights->agenda->allactions->create)', '$conf->agenda->enabled', '2', '2021-05-06 04:49:20'), ('33', 'all', '1', 'agenda', 'left', 'agenda', null, '31', null, null, '140', '/comm/action/index.php?action=default&amp;mainmenu=agenda&amp;leftmenu=agenda', '', 'Calendar', 'agenda', null, '$user->rights->agenda->myactions->read', '$conf->agenda->enabled', '2', '2021-05-06 04:49:20'), ('34', 'all', '1', 'agenda', 'left', 'agenda', null, '33', null, null, '141', '/comm/action/index.php?action=default&amp;mainmenu=agenda&amp;leftmenu=agenda&amp;status=todo&amp;filter=mine', '', 'MenuToDoMyActions', 'agenda', null, '$user->rights->agenda->myactions->read', '$conf->agenda->enabled', '2', '2021-05-06 04:49:20'), ('35', 'all', '1', 'agenda', 'left', 'agenda', null, '33', null, null, '142', '/comm/action/index.php?action=default&amp;mainmenu=agenda&amp;leftmenu=agenda&amp;status=done&amp;filter=mine', '', 'MenuDoneMyActions', 'agenda', null, '$user->rights->agenda->myactions->read', '$conf->agenda->enabled', '2', '2021-05-06 04:49:20'), ('36', 'all', '1', 'agenda', 'left', 'agenda', null, '33', null, null, '143', '/comm/action/index.php?action=default&amp;mainmenu=agenda&amp;leftmenu=agenda&amp;status=todo&amp;filtert=-1', '', 'MenuToDoActions', 'agenda', null, '$user->rights->agenda->allactions->read', '$user->rights->agenda->allactions->read', '2', '2021-05-06 04:49:20'), ('37', 'all', '1', 'agenda', 'left', 'agenda', null, '33', null, null, '144', '/comm/action/index.php?action=default&amp;mainmenu=agenda&amp;leftmenu=agenda&amp;status=done&amp;filtert=-1', '', 'MenuDoneActions', 'agenda', null, '$user->rights->agenda->allactions->read', '$user->rights->agenda->allactions->read', '2', '2021-05-06 04:49:20'), ('38', 'all', '1', 'agenda', 'left', 'agenda', null, '31', null, null, '110', '/comm/action/list.php?action=show_list&amp;mainmenu=agenda&amp;leftmenu=agenda', '', 'List', 'agenda', null, '$user->rights->agenda->myactions->read', '$conf->agenda->enabled', '2', '2021-05-06 04:49:20'), ('39', 'all', '1', 'agenda', 'left', 'agenda', null, '38', null, null, '111', '/comm/action/list.php?action=show_list&amp;mainmenu=agenda&amp;leftmenu=agenda&amp;status=todo&amp;filter=mine', '', 'MenuToDoMyActions', 'agenda', null, '$user->rights->agenda->myactions->read', '$conf->agenda->enabled', '2', '2021-05-06 04:49:20'), ('40', 'all', '1', 'agenda', 'left', 'agenda', null, '38', null, null, '112', '/comm/action/list.php?action=show_list&amp;mainmenu=agenda&amp;leftmenu=agenda&amp;status=done&amp;filter=mine', '', 'MenuDoneMyActions', 'agenda', null, '$user->rights->agenda->myactions->read', '$conf->agenda->enabled', '2', '2021-05-06 04:49:20'), ('41', 'all', '1', 'agenda', 'left', 'agenda', null, '38', null, null, '113', '/comm/action/list.php?action=show_list&amp;mainmenu=agenda&amp;leftmenu=agenda&amp;status=todo&amp;filtert=-1', '', 'MenuToDoActions', 'agenda', null, '$user->rights->agenda->allactions->read', '$user->rights->agenda->allactions->read', '2', '2021-05-06 04:49:20'), ('42', 'all', '1', 'agenda', 'left', 'agenda', null, '38', null, null, '114', '/comm/action/list.php?action=show_list&amp;mainmenu=agenda&amp;leftmenu=agenda&amp;status=done&amp;filtert=-1', '', 'MenuDoneActions', 'agenda', null, '$user->rights->agenda->allactions->read', '$user->rights->agenda->allactions->read', '2', '2021-05-06 04:49:20'), ('43', 'all', '1', 'agenda', 'left', 'agenda', null, '31', null, null, '160', '/comm/action/rapport/index.php?mainmenu=agenda&amp;leftmenu=agenda', '', 'Reportings', 'agenda', null, '$user->rights->agenda->allactions->read', '$conf->agenda->enabled', '2', '2021-05-06 04:49:20'), ('44', 'all', '1', 'agenda', 'left', 'agenda', null, '31', null, null, '170', '/categories/index.php?mainmenu=agenda&amp;leftmenu=agenda&type=10', '', 'Categories', 'agenda', null, '$user->rights->agenda->allactions->read', '$conf->categorie->enabled&&$conf->categorie->enabled', '2', '2021-05-06 04:49:20'), ('45', 'all', '1', 'barcode', 'left', 'tools', 'barcodeprint', '-1', 'tools', null, '200', '/barcode/printsheet.php?mainmenu=tools&leftmenu=barcodeprint', '', 'BarCodePrintsheet', 'products', null, '($conf->global->MAIN_USE_ADVANCED_PERMS && $user->rights->barcode->lire_advance) || (! $conf->global->MAIN_USE_ADVANCED_PERMS)', '$conf->barcode->enabled', '2', '2021-05-06 04:49:20'), ('46', 'all', '1', 'barcode', 'left', 'home', null, '-1', 'home', 'admintools', '300', '/barcode/codeinit.php?mainmenu=home&leftmenu=admintools', '', 'MassBarcodeInit', 'products', null, '($conf->global->MAIN_USE_ADVANCED_PERMS && $user->rights->barcode->creer_advance) || (! $conf->global->MAIN_USE_ADVANCED_PERMS)', '$conf->barcode->enabled && preg_match(\'/^(admintools|all)/\',$leftmenu)', '0', '2021-05-06 04:49:20'), ('47', 'all', '1', 'cron', 'left', 'home', null, '-1', 'home', 'admintools', '200', '/cron/list.php?leftmenu=admintools', '', 'CronList', 'cron', null, '$user->rights->cron->read', '$conf->cron->enabled && preg_match(\'/^(admintools|all)/\', $leftmenu)', '2', '2021-05-06 04:49:20'), ('48', 'all', '1', 'ecm', 'top', 'ecm', null, '0', null, null, '82', '/ecm/index.php', '', 'MenuECM', 'ecm', null, '$user->rights->ecm->read || $user->rights->ecm->upload || $user->rights->ecm->setup', '$conf->ecm->enabled', '2', '2021-05-06 04:49:21'), ('49', 'all', '1', 'ecm', 'left', 'ecm', 'ecm', '-1', 'ecm', null, '101', '/ecm/index.php?mainmenu=ecm&leftmenu=ecm', '', 'ECMArea', 'ecm', null, '$user->rights->ecm->read || $user->rights->ecm->upload', '$user->rights->ecm->read || $user->rights->ecm->upload', '2', '2021-05-06 04:49:21'), ('50', 'all', '1', 'ecm', 'left', 'ecm', 'ecm_manual', '-1', 'ecm', 'ecm', '102', '/ecm/index.php?action=file_manager&mainmenu=ecm&leftmenu=ecm', '', 'ECMSectionsManual', 'ecm', null, '$user->rights->ecm->read || $user->rights->ecm->upload', '$user->rights->ecm->read || $user->rights->ecm->upload', '2', '2021-05-06 04:49:21'), ('51', 'all', '1', 'ecm', 'left', 'ecm', null, '-1', 'ecm', 'ecm', '103', '/ecm/index_auto.php?action=file_manager&mainmenu=ecm&leftmenu=ecm', '', 'ECMSectionsAuto', 'ecm', null, '$user->rights->ecm->read || $user->rights->ecm->upload', '($user->rights->ecm->read || $user->rights->ecm->upload) && ! empty($conf->global->ECM_AUTO_TREE_ENABLED)', '2', '2021-05-06 04:49:21'), ('52', 'all', '1', 'modulebuilder', 'left', 'home', 'admintools_modulebuilder', '-1', 'home', 'admintools', '100', '/modulebuilder/index.php?mainmenu=home&amp;leftmenu=admintools', '_modulebuilder', 'ModuleBuilder', 'modulebuilder', null, '1', '$conf->modulebuilder->enabled && preg_match(\'/^(admintools|all)/\',$leftmenu) && ($user->admin || $conf->global->MODULEBUILDER_FOREVERYONE)', '0', '2021-05-07 21:15:25'), ('53', 'all', '1', 'sin_precio', 'top', 'sin_precio', null, '0', null, null, '1001', '/sin_precio/sin_precioindex.php', '', 'ModuleSin_precioName', 'sin_precio@sin_precio', null, '1', '$conf->sin_precio->enabled', '2', '2021-05-07 21:18:59');
COMMIT;

-- ----------------------------
--  Table structure for `llx_mrp_mo`
-- ----------------------------
DROP TABLE IF EXISTS `llx_mrp_mo`;
CREATE TABLE `llx_mrp_mo` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(128) NOT NULL DEFAULT '(PROV)',
  `entity` int(11) NOT NULL DEFAULT '1',
  `label` varchar(255) DEFAULT NULL,
  `qty` double NOT NULL,
  `fk_warehouse` int(11) DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `note_public` text,
  `note_private` text,
  `date_creation` datetime NOT NULL,
  `date_valid` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `fk_product` int(11) NOT NULL,
  `date_start_planned` datetime DEFAULT NULL,
  `date_end_planned` datetime DEFAULT NULL,
  `fk_bom` int(11) DEFAULT NULL,
  `fk_project` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_mrp_mo_ref` (`ref`),
  KEY `idx_mrp_mo_entity` (`entity`),
  KEY `idx_mrp_mo_fk_soc` (`fk_soc`),
  KEY `fk_mrp_mo_fk_user_creat` (`fk_user_creat`),
  KEY `idx_mrp_mo_status` (`status`),
  KEY `idx_mrp_mo_fk_product` (`fk_product`),
  KEY `idx_mrp_mo_date_start_planned` (`date_start_planned`),
  KEY `idx_mrp_mo_date_end_planned` (`date_end_planned`),
  KEY `idx_mrp_mo_fk_bom` (`fk_bom`),
  KEY `idx_mrp_mo_fk_project` (`fk_project`),
  CONSTRAINT `fk_mrp_mo_fk_user_creat` FOREIGN KEY (`fk_user_creat`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_mrp_mo_extrafields`
-- ----------------------------
DROP TABLE IF EXISTS `llx_mrp_mo_extrafields`;
CREATE TABLE `llx_mrp_mo_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_mrp_mo_fk_object` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_mrp_production`
-- ----------------------------
DROP TABLE IF EXISTS `llx_mrp_production`;
CREATE TABLE `llx_mrp_production` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_mo` int(11) NOT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  `fk_product` int(11) NOT NULL,
  `fk_warehouse` int(11) DEFAULT NULL,
  `qty` double NOT NULL DEFAULT '1',
  `qty_frozen` smallint(6) DEFAULT '0',
  `disable_stock_change` smallint(6) DEFAULT '0',
  `batch` varchar(128) DEFAULT NULL,
  `role` varchar(10) DEFAULT NULL,
  `fk_mrp_production` int(11) DEFAULT NULL,
  `fk_stock_movement` int(11) DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `fk_mrp_production_product` (`fk_product`),
  KEY `fk_mrp_production_stock_movement` (`fk_stock_movement`),
  KEY `idx_mrp_production_fk_mo` (`fk_mo`),
  CONSTRAINT `fk_mrp_production_mo` FOREIGN KEY (`fk_mo`) REFERENCES `llx_mrp_mo` (`rowid`),
  CONSTRAINT `fk_mrp_production_product` FOREIGN KEY (`fk_product`) REFERENCES `llx_product` (`rowid`),
  CONSTRAINT `fk_mrp_production_stock_movement` FOREIGN KEY (`fk_stock_movement`) REFERENCES `llx_stock_mouvement` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_multicurrency`
-- ----------------------------
DROP TABLE IF EXISTS `llx_multicurrency`;
CREATE TABLE `llx_multicurrency` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `date_create` datetime DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `entity` int(11) DEFAULT '1',
  `fk_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_multicurrency_rate`
-- ----------------------------
DROP TABLE IF EXISTS `llx_multicurrency_rate`;
CREATE TABLE `llx_multicurrency_rate` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `date_sync` datetime DEFAULT NULL,
  `rate` double NOT NULL DEFAULT '0',
  `fk_multicurrency` int(11) NOT NULL,
  `entity` int(11) DEFAULT '1',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_notify`
-- ----------------------------
DROP TABLE IF EXISTS `llx_notify`;
CREATE TABLE `llx_notify` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `daten` datetime DEFAULT NULL,
  `fk_action` int(11) NOT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_contact` int(11) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `type` varchar(16) DEFAULT 'email',
  `type_target` varchar(16) DEFAULT NULL,
  `objet_type` varchar(24) NOT NULL,
  `objet_id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_notify_def`
-- ----------------------------
DROP TABLE IF EXISTS `llx_notify_def`;
CREATE TABLE `llx_notify_def` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` date DEFAULT NULL,
  `fk_action` int(11) NOT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_contact` int(11) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `type` varchar(16) DEFAULT 'email',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_notify_def_object`
-- ----------------------------
DROP TABLE IF EXISTS `llx_notify_def_object`;
CREATE TABLE `llx_notify_def_object` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `objet_type` varchar(16) DEFAULT NULL,
  `objet_id` int(11) NOT NULL,
  `type_notif` varchar(16) DEFAULT 'browser',
  `date_notif` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `moreparam` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_numberseries`
-- ----------------------------
DROP TABLE IF EXISTS `llx_numberseries`;
CREATE TABLE `llx_numberseries` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `ref` varchar(30) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `typedoc` smallint(6) NOT NULL DEFAULT '0',
  `defaultserie` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_numberseries_ref` (`ref`,`entity`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_numberseries`
-- ----------------------------
BEGIN;
INSERT INTO `llx_numberseries` VALUES ('1', '1', 'F', 'F', '1', '1');
COMMIT;

-- ----------------------------
--  Table structure for `llx_numberseries_det`
-- ----------------------------
DROP TABLE IF EXISTS `llx_numberseries_det`;
CREATE TABLE `llx_numberseries_det` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_serie` int(11) NOT NULL,
  `mask_1` varchar(30) DEFAULT NULL,
  `mask_2` varchar(30) DEFAULT NULL,
  `mask_3` varchar(30) DEFAULT NULL,
  `mask_4` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_numberseriesdet_fk_serie` (`fk_serie`),
  CONSTRAINT `llx_numberseriesdet_fk_serie` FOREIGN KEY (`fk_serie`) REFERENCES `llx_numberseries` (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_numberseries_det`
-- ----------------------------
BEGIN;
INSERT INTO `llx_numberseries_det` VALUES ('1', '1', 'F{00000}', 'FA{00000}', 'FR{00000}', 'FA{00000}');
COMMIT;

-- ----------------------------
--  Table structure for `llx_oauth_state`
-- ----------------------------
DROP TABLE IF EXISTS `llx_oauth_state`;
CREATE TABLE `llx_oauth_state` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `service` varchar(36) DEFAULT NULL,
  `state` varchar(128) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `fk_adherent` int(11) DEFAULT NULL,
  `entity` int(11) DEFAULT '1',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_oauth_token`
-- ----------------------------
DROP TABLE IF EXISTS `llx_oauth_token`;
CREATE TABLE `llx_oauth_token` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `service` varchar(36) DEFAULT NULL,
  `token` text,
  `fk_soc` int(11) DEFAULT NULL,
  `tokenstring` text,
  `fk_user` int(11) DEFAULT NULL,
  `fk_adherent` int(11) DEFAULT NULL,
  `entity` int(11) DEFAULT '1',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_object_lang`
-- ----------------------------
DROP TABLE IF EXISTS `llx_object_lang`;
CREATE TABLE `llx_object_lang` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_object` int(11) NOT NULL DEFAULT '0',
  `type_object` varchar(32) NOT NULL,
  `property` varchar(32) NOT NULL,
  `lang` varchar(5) NOT NULL DEFAULT '0',
  `value` text,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_object_lang` (`fk_object`,`type_object`,`property`,`lang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_onlinesignature`
-- ----------------------------
DROP TABLE IF EXISTS `llx_onlinesignature`;
CREATE TABLE `llx_onlinesignature` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `object_type` varchar(32) NOT NULL,
  `object_id` int(11) NOT NULL,
  `datec` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `name` varchar(255) NOT NULL,
  `ip` varchar(128) DEFAULT NULL,
  `pathoffile` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_opensurvey_comments`
-- ----------------------------
DROP TABLE IF EXISTS `llx_opensurvey_comments`;
CREATE TABLE `llx_opensurvey_comments` (
  `id_comment` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_sondage` char(16) NOT NULL,
  `comment` text NOT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `usercomment` text,
  PRIMARY KEY (`id_comment`),
  KEY `idx_id_comment` (`id_comment`),
  KEY `idx_id_sondage` (`id_sondage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_opensurvey_formquestions`
-- ----------------------------
DROP TABLE IF EXISTS `llx_opensurvey_formquestions`;
CREATE TABLE `llx_opensurvey_formquestions` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `id_sondage` varchar(16) DEFAULT NULL,
  `question` text,
  `available_answers` text,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_opensurvey_sondage`
-- ----------------------------
DROP TABLE IF EXISTS `llx_opensurvey_sondage`;
CREATE TABLE `llx_opensurvey_sondage` (
  `id_sondage` varchar(16) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `commentaires` text,
  `mail_admin` varchar(128) DEFAULT NULL,
  `nom_admin` varchar(64) DEFAULT NULL,
  `fk_user_creat` int(11) NOT NULL,
  `titre` text NOT NULL,
  `date_fin` datetime DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `format` varchar(2) NOT NULL,
  `mailsonde` tinyint(4) NOT NULL DEFAULT '0',
  `allow_comments` tinyint(4) NOT NULL DEFAULT '1',
  `allow_spy` tinyint(4) NOT NULL DEFAULT '1',
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sujet` text,
  PRIMARY KEY (`id_sondage`),
  KEY `idx_date_fin` (`date_fin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_opensurvey_user_formanswers`
-- ----------------------------
DROP TABLE IF EXISTS `llx_opensurvey_user_formanswers`;
CREATE TABLE `llx_opensurvey_user_formanswers` (
  `fk_user_survey` int(11) NOT NULL,
  `fk_question` int(11) NOT NULL,
  `reponses` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_opensurvey_user_studs`
-- ----------------------------
DROP TABLE IF EXISTS `llx_opensurvey_user_studs`;
CREATE TABLE `llx_opensurvey_user_studs` (
  `id_users` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(64) NOT NULL,
  `id_sondage` varchar(16) NOT NULL,
  `reponses` varchar(100) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_users`),
  KEY `idx_opensurvey_user_studs_id_users` (`id_users`),
  KEY `idx_opensurvey_user_studs_nom` (`nom`),
  KEY `idx_opensurvey_user_studs_id_sondage` (`id_sondage`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_overwrite_trans`
-- ----------------------------
DROP TABLE IF EXISTS `llx_overwrite_trans`;
CREATE TABLE `llx_overwrite_trans` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `lang` varchar(5) DEFAULT NULL,
  `transkey` varchar(128) DEFAULT NULL,
  `transvalue` text,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_overwrite_trans` (`lang`,`transkey`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_overwrite_trans`
-- ----------------------------
BEGIN;
INSERT INTO `llx_overwrite_trans` VALUES ('1', '1', 'es_ES', 'Read objects of Sin_precio', 'Leer objetos de Sin precio'), ('2', '1', 'es_ES', 'Create/Update objects of Sin_precio', 'Crear / actualizar objetos de Sin precio'), ('3', '1', 'es_ES', 'Delete objects of Sin_precio', 'Eliminar objetos de Sin precio'), ('4', '1', 'es_ES', 'Do not see product prices', 'No ver precios de productos'), ('5', '1', 'es_ES', 'Molde', 'Nº Molde'), ('6', '1', 'es_ES', 'label_product', 'Referencia pieza'), ('7', '1', 'es_ES', 'DenominationOr', 'Denominación'), ('8', '1', 'es_ES', 'DesignationAd', 'Designación'), ('9', '1', 'es_ES', 'QtyOr', 'Cantidad'), ('10', '1', 'es_ES', 'Deliver', 'Entregar'), ('11', '1', 'es_ES', 'Agency', 'Agencia');
COMMIT;

-- ----------------------------
--  Table structure for `llx_paiement`
-- ----------------------------
DROP TABLE IF EXISTS `llx_paiement`;
CREATE TABLE `llx_paiement` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) NOT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datep` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT '0.00000000',
  `multicurrency_amount` double(24,8) DEFAULT '0.00000000',
  `fk_paiement` int(11) NOT NULL,
  `num_paiement` varchar(50) DEFAULT NULL,
  `note` text,
  `fk_bank` int(11) NOT NULL DEFAULT '0',
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `statut` smallint(6) NOT NULL DEFAULT '0',
  `fk_export_compta` int(11) NOT NULL DEFAULT '0',
  `pos_change` double(24,8) DEFAULT '0.00000000',
  `ext_payment_id` varchar(128) DEFAULT NULL,
  `ext_payment_site` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_paiement_facture`
-- ----------------------------
DROP TABLE IF EXISTS `llx_paiement_facture`;
CREATE TABLE `llx_paiement_facture` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_paiement` int(11) DEFAULT NULL,
  `fk_facture` int(11) DEFAULT NULL,
  `amount` double(24,8) DEFAULT '0.00000000',
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT '1.00000000',
  `multicurrency_amount` double(24,8) DEFAULT '0.00000000',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_paiement_facture` (`fk_paiement`,`fk_facture`),
  KEY `idx_paiement_facture_fk_facture` (`fk_facture`),
  KEY `idx_paiement_facture_fk_paiement` (`fk_paiement`),
  CONSTRAINT `fk_paiement_facture_fk_facture` FOREIGN KEY (`fk_facture`) REFERENCES `llx_facture` (`rowid`),
  CONSTRAINT `fk_paiement_facture_fk_paiement` FOREIGN KEY (`fk_paiement`) REFERENCES `llx_paiement` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_paiementcharge`
-- ----------------------------
DROP TABLE IF EXISTS `llx_paiementcharge`;
CREATE TABLE `llx_paiementcharge` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_charge` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datep` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT '0.00000000',
  `fk_typepaiement` int(11) NOT NULL,
  `num_paiement` varchar(50) DEFAULT NULL,
  `note` text,
  `fk_bank` int(11) NOT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_paiementfourn`
-- ----------------------------
DROP TABLE IF EXISTS `llx_paiementfourn`;
CREATE TABLE `llx_paiementfourn` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) DEFAULT NULL,
  `entity` int(11) DEFAULT '1',
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` datetime DEFAULT NULL,
  `datep` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT '0.00000000',
  `multicurrency_amount` double(24,8) DEFAULT '0.00000000',
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_paiement` int(11) NOT NULL,
  `num_paiement` varchar(50) DEFAULT NULL,
  `note` text,
  `fk_bank` int(11) NOT NULL,
  `statut` smallint(6) NOT NULL DEFAULT '0',
  `model_pdf` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_paiementfourn_facturefourn`
-- ----------------------------
DROP TABLE IF EXISTS `llx_paiementfourn_facturefourn`;
CREATE TABLE `llx_paiementfourn_facturefourn` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_paiementfourn` int(11) DEFAULT NULL,
  `fk_facturefourn` int(11) DEFAULT NULL,
  `amount` double(24,8) DEFAULT '0.00000000',
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT '1.00000000',
  `multicurrency_amount` double(24,8) DEFAULT '0.00000000',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_paiementfourn_facturefourn` (`fk_paiementfourn`,`fk_facturefourn`),
  KEY `idx_paiementfourn_facturefourn_fk_facture` (`fk_facturefourn`),
  KEY `idx_paiementfourn_facturefourn_fk_paiement` (`fk_paiementfourn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_payment_donation`
-- ----------------------------
DROP TABLE IF EXISTS `llx_payment_donation`;
CREATE TABLE `llx_payment_donation` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_donation` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datep` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT '0.00000000',
  `fk_typepayment` int(11) NOT NULL,
  `num_payment` varchar(50) DEFAULT NULL,
  `note` text,
  `fk_bank` int(11) NOT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_payment_expensereport`
-- ----------------------------
DROP TABLE IF EXISTS `llx_payment_expensereport`;
CREATE TABLE `llx_payment_expensereport` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_expensereport` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datep` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT '0.00000000',
  `fk_typepayment` int(11) NOT NULL,
  `num_payment` varchar(50) DEFAULT NULL,
  `note` text,
  `fk_bank` int(11) NOT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_payment_loan`
-- ----------------------------
DROP TABLE IF EXISTS `llx_payment_loan`;
CREATE TABLE `llx_payment_loan` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_loan` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datep` datetime DEFAULT NULL,
  `amount_capital` double(24,8) DEFAULT '0.00000000',
  `amount_insurance` double(24,8) DEFAULT '0.00000000',
  `amount_interest` double(24,8) DEFAULT '0.00000000',
  `fk_typepayment` int(11) NOT NULL,
  `num_payment` varchar(50) DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `fk_bank` int(11) NOT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_payment_salary`
-- ----------------------------
DROP TABLE IF EXISTS `llx_payment_salary`;
CREATE TABLE `llx_payment_salary` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` datetime DEFAULT NULL,
  `fk_user` int(11) NOT NULL,
  `datep` date DEFAULT NULL,
  `datev` date DEFAULT NULL,
  `salary` double(24,8) DEFAULT NULL,
  `amount` double(24,8) NOT NULL DEFAULT '0.00000000',
  `fk_projet` int(11) DEFAULT NULL,
  `fk_typepayment` int(11) NOT NULL,
  `num_payment` varchar(50) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `datesp` date DEFAULT NULL,
  `dateep` date DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `note` text,
  `fk_bank` int(11) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_payment_salary_ref` (`num_payment`),
  KEY `idx_payment_salary_user` (`fk_user`,`entity`),
  KEY `idx_payment_salary_datep` (`datep`),
  KEY `idx_payment_salary_datesp` (`datesp`),
  KEY `idx_payment_salary_dateep` (`dateep`),
  CONSTRAINT `fk_payment_salary_user` FOREIGN KEY (`fk_user`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_payment_salary_extrafields`
-- ----------------------------
DROP TABLE IF EXISTS `llx_payment_salary_extrafields`;
CREATE TABLE `llx_payment_salary_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_payment_salary_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_payment_various`
-- ----------------------------
DROP TABLE IF EXISTS `llx_payment_various`;
CREATE TABLE `llx_payment_various` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) DEFAULT NULL,
  `num_payment` varchar(50) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` datetime DEFAULT NULL,
  `datep` date DEFAULT NULL,
  `datev` date DEFAULT NULL,
  `sens` smallint(6) NOT NULL DEFAULT '0',
  `amount` double(24,8) NOT NULL DEFAULT '0.00000000',
  `fk_typepayment` int(11) NOT NULL,
  `accountancy_code` varchar(32) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `note` text,
  `fk_bank` int(11) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `subledger_account` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_pos_cash_fence`
-- ----------------------------
DROP TABLE IF EXISTS `llx_pos_cash_fence`;
CREATE TABLE `llx_pos_cash_fence` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `ref` varchar(64) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `opening` double(24,8) DEFAULT '0.00000000',
  `cash` double(24,8) DEFAULT '0.00000000',
  `card` double(24,8) DEFAULT '0.00000000',
  `cheque` double(24,8) DEFAULT '0.00000000',
  `status` int(11) DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `date_valid` datetime DEFAULT NULL,
  `day_close` int(11) DEFAULT NULL,
  `month_close` int(11) DEFAULT NULL,
  `year_close` int(11) DEFAULT NULL,
  `posmodule` varchar(30) DEFAULT NULL,
  `posnumber` varchar(30) DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_prelevement_bons`
-- ----------------------------
DROP TABLE IF EXISTS `llx_prelevement_bons`;
CREATE TABLE `llx_prelevement_bons` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(12) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `datec` datetime DEFAULT NULL,
  `amount` double(24,8) DEFAULT '0.00000000',
  `statut` smallint(6) DEFAULT '0',
  `credite` smallint(6) DEFAULT '0',
  `note` text,
  `date_trans` datetime DEFAULT NULL,
  `method_trans` smallint(6) DEFAULT NULL,
  `fk_user_trans` int(11) DEFAULT NULL,
  `date_credit` datetime DEFAULT NULL,
  `fk_user_credit` int(11) DEFAULT NULL,
  `type` varchar(16) DEFAULT 'debit-order',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_prelevement_bons_ref` (`ref`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_prelevement_facture`
-- ----------------------------
DROP TABLE IF EXISTS `llx_prelevement_facture`;
CREATE TABLE `llx_prelevement_facture` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_facture` int(11) DEFAULT NULL,
  `fk_prelevement_lignes` int(11) NOT NULL,
  `fk_facture_fourn` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_prelevement_facture_fk_prelevement_lignes` (`fk_prelevement_lignes`),
  CONSTRAINT `fk_prelevement_facture_fk_prelevement_lignes` FOREIGN KEY (`fk_prelevement_lignes`) REFERENCES `llx_prelevement_lignes` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_prelevement_facture_demande`
-- ----------------------------
DROP TABLE IF EXISTS `llx_prelevement_facture_demande`;
CREATE TABLE `llx_prelevement_facture_demande` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_facture` int(11) DEFAULT NULL,
  `amount` double(24,8) NOT NULL,
  `date_demande` datetime NOT NULL,
  `traite` smallint(6) DEFAULT '0',
  `date_traite` datetime DEFAULT NULL,
  `fk_prelevement_bons` int(11) DEFAULT NULL,
  `fk_user_demande` int(11) NOT NULL,
  `code_banque` varchar(128) DEFAULT NULL,
  `code_guichet` varchar(6) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `cle_rib` varchar(5) DEFAULT NULL,
  `entity` int(11) DEFAULT NULL,
  `sourcetype` varchar(32) DEFAULT NULL,
  `ext_payment_id` varchar(128) DEFAULT NULL,
  `ext_payment_site` varchar(128) DEFAULT NULL,
  `fk_facture_fourn` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_prelevement_facture_demande_fk_facture` (`fk_facture`),
  KEY `idx_prelevement_facture_demande_fk_facture_fourn` (`fk_facture_fourn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_prelevement_lignes`
-- ----------------------------
DROP TABLE IF EXISTS `llx_prelevement_lignes`;
CREATE TABLE `llx_prelevement_lignes` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_prelevement_bons` int(11) DEFAULT NULL,
  `fk_soc` int(11) NOT NULL,
  `statut` smallint(6) DEFAULT '0',
  `client_nom` varchar(255) DEFAULT NULL,
  `amount` double(24,8) DEFAULT '0.00000000',
  `code_banque` varchar(128) DEFAULT NULL,
  `code_guichet` varchar(6) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `cle_rib` varchar(5) DEFAULT NULL,
  `note` text,
  PRIMARY KEY (`rowid`),
  KEY `idx_prelevement_lignes_fk_prelevement_bons` (`fk_prelevement_bons`),
  CONSTRAINT `fk_prelevement_lignes_fk_prelevement_bons` FOREIGN KEY (`fk_prelevement_bons`) REFERENCES `llx_prelevement_bons` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_prelevement_rejet`
-- ----------------------------
DROP TABLE IF EXISTS `llx_prelevement_rejet`;
CREATE TABLE `llx_prelevement_rejet` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_prelevement_lignes` int(11) DEFAULT NULL,
  `date_rejet` datetime DEFAULT NULL,
  `motif` int(11) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `fk_user_creation` int(11) DEFAULT NULL,
  `note` text,
  `afacturer` tinyint(4) DEFAULT '0',
  `fk_facture` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_printing`
-- ----------------------------
DROP TABLE IF EXISTS `llx_printing`;
CREATE TABLE `llx_printing` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` datetime DEFAULT NULL,
  `printer_name` text NOT NULL,
  `printer_location` text NOT NULL,
  `printer_id` varchar(255) NOT NULL,
  `copy` int(11) NOT NULL DEFAULT '1',
  `module` varchar(16) NOT NULL,
  `driver` varchar(16) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_product`
-- ----------------------------
DROP TABLE IF EXISTS `llx_product`;
CREATE TABLE `llx_product` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(128) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `ref_ext` varchar(128) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_parent` int(11) DEFAULT '0',
  `label` varchar(255) NOT NULL,
  `description` text,
  `note_public` text,
  `note` text,
  `customcode` varchar(32) DEFAULT NULL,
  `fk_country` int(11) DEFAULT NULL,
  `fk_state` int(11) DEFAULT NULL,
  `price` double(24,8) DEFAULT '0.00000000',
  `price_ttc` double(24,8) DEFAULT '0.00000000',
  `price_min` double(24,8) DEFAULT '0.00000000',
  `price_min_ttc` double(24,8) DEFAULT '0.00000000',
  `price_base_type` varchar(3) DEFAULT 'HT',
  `cost_price` double(24,8) DEFAULT NULL,
  `default_vat_code` varchar(10) DEFAULT NULL,
  `tva_tx` double(6,3) DEFAULT NULL,
  `recuperableonly` int(11) NOT NULL DEFAULT '0',
  `localtax1_tx` double(6,3) DEFAULT '0.000',
  `localtax1_type` varchar(10) NOT NULL DEFAULT '0',
  `localtax2_tx` double(6,3) DEFAULT '0.000',
  `localtax2_type` varchar(10) NOT NULL DEFAULT '0',
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `tosell` tinyint(4) DEFAULT '1',
  `tobuy` tinyint(4) DEFAULT '1',
  `onportal` tinyint(4) DEFAULT '0',
  `tobatch` tinyint(4) NOT NULL DEFAULT '0',
  `fk_product_type` int(11) DEFAULT '0',
  `duration` varchar(6) DEFAULT NULL,
  `seuil_stock_alerte` float DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `barcode` varchar(180) DEFAULT NULL,
  `fk_barcode_type` int(11) DEFAULT NULL,
  `accountancy_code_sell` varchar(32) DEFAULT NULL,
  `accountancy_code_sell_intra` varchar(32) DEFAULT NULL,
  `accountancy_code_sell_export` varchar(32) DEFAULT NULL,
  `accountancy_code_buy` varchar(32) DEFAULT NULL,
  `accountancy_code_buy_intra` varchar(32) DEFAULT NULL,
  `accountancy_code_buy_export` varchar(32) DEFAULT NULL,
  `partnumber` varchar(32) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `weight_units` tinyint(4) DEFAULT NULL,
  `length` float DEFAULT NULL,
  `length_units` tinyint(4) DEFAULT NULL,
  `width` float DEFAULT NULL,
  `width_units` tinyint(4) DEFAULT NULL,
  `height` float DEFAULT NULL,
  `height_units` tinyint(4) DEFAULT NULL,
  `surface` float DEFAULT NULL,
  `surface_units` tinyint(4) DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `volume_units` tinyint(4) DEFAULT NULL,
  `stock` double DEFAULT NULL,
  `pmp` double(24,8) NOT NULL DEFAULT '0.00000000',
  `fifo` double(24,8) DEFAULT NULL,
  `lifo` double(24,8) DEFAULT NULL,
  `fk_default_warehouse` int(11) DEFAULT NULL,
  `canvas` varchar(32) DEFAULT NULL,
  `finished` tinyint(4) DEFAULT NULL,
  `hidden` tinyint(4) DEFAULT '0',
  `import_key` varchar(14) DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `fk_price_expression` int(11) DEFAULT NULL,
  `desiredstock` float DEFAULT NULL,
  `fk_unit` int(11) DEFAULT NULL,
  `price_autogen` tinyint(4) DEFAULT '0',
  `fk_project` int(11) DEFAULT NULL,
  `net_measure` float DEFAULT NULL,
  `net_measure_units` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_ref` (`ref`,`entity`),
  UNIQUE KEY `uk_product_barcode` (`barcode`,`fk_barcode_type`,`entity`),
  KEY `idx_product_label` (`label`),
  KEY `idx_product_barcode` (`barcode`),
  KEY `idx_product_import_key` (`import_key`),
  KEY `idx_product_seuil_stock_alerte` (`seuil_stock_alerte`),
  KEY `idx_product_fk_country` (`fk_country`),
  KEY `idx_product_fk_user_author` (`fk_user_author`),
  KEY `idx_product_fk_barcode_type` (`fk_barcode_type`),
  KEY `fk_product_fk_unit` (`fk_unit`),
  KEY `fk_product_default_warehouse` (`fk_default_warehouse`),
  KEY `idx_product_fk_project` (`fk_project`),
  KEY `fk_product_finished` (`finished`),
  CONSTRAINT `fk_product_barcode_type` FOREIGN KEY (`fk_barcode_type`) REFERENCES `llx_c_barcode_type` (`rowid`),
  CONSTRAINT `fk_product_default_warehouse` FOREIGN KEY (`fk_default_warehouse`) REFERENCES `llx_entrepot` (`rowid`),
  CONSTRAINT `fk_product_finished` FOREIGN KEY (`finished`) REFERENCES `llx_c_product_nature` (`code`),
  CONSTRAINT `fk_product_fk_country` FOREIGN KEY (`fk_country`) REFERENCES `llx_c_country` (`rowid`),
  CONSTRAINT `fk_product_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `llx_c_units` (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_product`
-- ----------------------------
BEGIN;
INSERT INTO `llx_product` VALUES ('1', 'Escalera', '1', null, '2021-05-08 04:42:28', '2021-05-07 21:48:10', '0', '123', 'Descripci&oacute;n: <strong>Lorem Ipsum</strong> is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', null, '', '', null, null, '120.00000000', '145.20000000', '110.00000000', '133.10000000', 'HT', null, null, '21.000', '0', '0.000', '0', '0.000', '0', '1', '1', '1', '1', '0', '0', '0', '', '0', null, '020000000001', '2', '', '', '', '', '', '', null, '23', '0', '1', '0', '2', '0', '3', '0', '2', null, '2', '0', null, '0.00000000', null, null, null, '', null, '0', null, null, null, '0', null, '0', null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `llx_product_association`
-- ----------------------------
DROP TABLE IF EXISTS `llx_product_association`;
CREATE TABLE `llx_product_association` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_product_pere` int(11) NOT NULL DEFAULT '0',
  `fk_product_fils` int(11) NOT NULL DEFAULT '0',
  `qty` double DEFAULT NULL,
  `incdec` int(11) DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_association` (`fk_product_pere`,`fk_product_fils`),
  KEY `idx_product_association_fils` (`fk_product_fils`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_product_attribute`
-- ----------------------------
DROP TABLE IF EXISTS `llx_product_attribute`;
CREATE TABLE `llx_product_attribute` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(255) NOT NULL,
  `ref_ext` varchar(255) DEFAULT NULL,
  `label` varchar(255) NOT NULL,
  `rang` int(11) NOT NULL DEFAULT '0',
  `entity` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_attribute_ref` (`ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_product_attribute_combination`
-- ----------------------------
DROP TABLE IF EXISTS `llx_product_attribute_combination`;
CREATE TABLE `llx_product_attribute_combination` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_product_parent` int(11) NOT NULL,
  `fk_product_child` int(11) NOT NULL,
  `variation_price` float NOT NULL,
  `variation_price_percentage` int(11) DEFAULT NULL,
  `variation_weight` float NOT NULL,
  `variation_ref_ext` varchar(255) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  KEY `idx_product_att_com_product_parent` (`fk_product_parent`),
  KEY `idx_product_att_com_product_child` (`fk_product_child`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_product_attribute_combination2val`
-- ----------------------------
DROP TABLE IF EXISTS `llx_product_attribute_combination2val`;
CREATE TABLE `llx_product_attribute_combination2val` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_prod_combination` int(11) NOT NULL,
  `fk_prod_attr` int(11) NOT NULL,
  `fk_prod_attr_val` int(11) NOT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_product_attribute_combination_price_level`
-- ----------------------------
DROP TABLE IF EXISTS `llx_product_attribute_combination_price_level`;
CREATE TABLE `llx_product_attribute_combination_price_level` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_product_attribute_combination` int(11) NOT NULL DEFAULT '1',
  `fk_price_level` int(11) NOT NULL DEFAULT '1',
  `variation_price` double(24,8) NOT NULL,
  `variation_price_percentage` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `fk_product_attribute_combination` (`fk_product_attribute_combination`,`fk_price_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_product_attribute_value`
-- ----------------------------
DROP TABLE IF EXISTS `llx_product_attribute_value`;
CREATE TABLE `llx_product_attribute_value` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_product_attribute` int(11) NOT NULL,
  `ref` varchar(180) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_attribute_value` (`fk_product_attribute`,`ref`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_product_batch`
-- ----------------------------
DROP TABLE IF EXISTS `llx_product_batch`;
CREATE TABLE `llx_product_batch` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_product_stock` int(11) NOT NULL,
  `eatby` datetime DEFAULT NULL,
  `sellby` datetime DEFAULT NULL,
  `batch` varchar(128) DEFAULT NULL,
  `qty` double NOT NULL DEFAULT '0',
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_batch` (`fk_product_stock`,`batch`),
  KEY `idx_fk_product_stock` (`fk_product_stock`),
  KEY `idx_batch` (`batch`),
  CONSTRAINT `fk_product_batch_fk_product_stock` FOREIGN KEY (`fk_product_stock`) REFERENCES `llx_product_stock` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_product_customer_price`
-- ----------------------------
DROP TABLE IF EXISTS `llx_product_customer_price`;
CREATE TABLE `llx_product_customer_price` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_product` int(11) NOT NULL,
  `fk_soc` int(11) NOT NULL,
  `price` double(24,8) DEFAULT '0.00000000',
  `price_ttc` double(24,8) DEFAULT '0.00000000',
  `price_min` double(24,8) DEFAULT '0.00000000',
  `price_min_ttc` double(24,8) DEFAULT '0.00000000',
  `price_base_type` varchar(3) DEFAULT 'HT',
  `default_vat_code` varchar(10) DEFAULT NULL,
  `tva_tx` double(6,3) DEFAULT NULL,
  `recuperableonly` int(11) NOT NULL DEFAULT '0',
  `localtax1_tx` double(6,3) DEFAULT '0.000',
  `localtax1_type` varchar(10) NOT NULL DEFAULT '0',
  `localtax2_tx` double(6,3) DEFAULT '0.000',
  `localtax2_type` varchar(10) NOT NULL DEFAULT '0',
  `fk_user` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_customer_price_fk_product_fk_soc` (`fk_product`,`fk_soc`),
  KEY `idx_product_customer_price_fk_user` (`fk_user`),
  KEY `idx_product_customer_price_fk_soc` (`fk_soc`),
  CONSTRAINT `fk_product_customer_price_fk_product` FOREIGN KEY (`fk_product`) REFERENCES `llx_product` (`rowid`),
  CONSTRAINT `fk_product_customer_price_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_product_customer_price_fk_user` FOREIGN KEY (`fk_user`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_product_customer_price_log`
-- ----------------------------
DROP TABLE IF EXISTS `llx_product_customer_price_log`;
CREATE TABLE `llx_product_customer_price_log` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `datec` datetime DEFAULT NULL,
  `fk_product` int(11) NOT NULL,
  `fk_soc` int(11) NOT NULL DEFAULT '0',
  `price` double(24,8) DEFAULT '0.00000000',
  `price_ttc` double(24,8) DEFAULT '0.00000000',
  `price_min` double(24,8) DEFAULT '0.00000000',
  `price_min_ttc` double(24,8) DEFAULT '0.00000000',
  `price_base_type` varchar(3) DEFAULT 'HT',
  `default_vat_code` varchar(10) DEFAULT NULL,
  `tva_tx` double(6,3) DEFAULT NULL,
  `recuperableonly` int(11) NOT NULL DEFAULT '0',
  `localtax1_tx` double(6,3) DEFAULT '0.000',
  `localtax1_type` varchar(10) NOT NULL DEFAULT '0',
  `localtax2_tx` double(6,3) DEFAULT '0.000',
  `localtax2_type` varchar(10) NOT NULL DEFAULT '0',
  `fk_user` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_product_extrafields`
-- ----------------------------
DROP TABLE IF EXISTS `llx_product_extrafields`;
CREATE TABLE `llx_product_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `design` varchar(25) DEFAULT NULL,
  `undcaja` int(10) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_product_extrafields` (`fk_object`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_product_extrafields`
-- ----------------------------
BEGIN;
INSERT INTO `llx_product_extrafields` VALUES ('3', '2021-05-07 21:48:10', '1', null, 'Designado', null);
COMMIT;

-- ----------------------------
--  Table structure for `llx_product_fournisseur_price`
-- ----------------------------
DROP TABLE IF EXISTS `llx_product_fournisseur_price`;
CREATE TABLE `llx_product_fournisseur_price` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_product` int(11) DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `ref_fourn` varchar(30) DEFAULT NULL,
  `desc_fourn` text,
  `fk_availability` int(11) DEFAULT NULL,
  `price` double(24,8) DEFAULT '0.00000000',
  `quantity` double DEFAULT NULL,
  `remise_percent` double NOT NULL DEFAULT '0',
  `remise` double NOT NULL DEFAULT '0',
  `unitprice` double(24,8) DEFAULT '0.00000000',
  `charges` double(24,8) DEFAULT '0.00000000',
  `default_vat_code` varchar(10) DEFAULT NULL,
  `tva_tx` double(6,3) NOT NULL,
  `localtax1_tx` double(6,3) DEFAULT '0.000',
  `localtax1_type` varchar(10) NOT NULL DEFAULT '0',
  `localtax2_tx` double(6,3) DEFAULT '0.000',
  `localtax2_type` varchar(10) NOT NULL DEFAULT '0',
  `info_bits` int(11) NOT NULL DEFAULT '0',
  `fk_user` int(11) DEFAULT NULL,
  `fk_supplier_price_expression` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `delivery_time_days` int(11) DEFAULT NULL,
  `supplier_reputation` varchar(10) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT '1.00000000',
  `multicurrency_unitprice` double(24,8) DEFAULT NULL,
  `multicurrency_price` double(24,8) DEFAULT NULL,
  `barcode` varchar(180) DEFAULT NULL,
  `fk_barcode_type` int(11) DEFAULT NULL,
  `packaging` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_fournisseur_price_ref` (`ref_fourn`,`fk_soc`,`quantity`,`entity`),
  UNIQUE KEY `uk_product_barcode` (`barcode`,`fk_barcode_type`,`entity`),
  KEY `idx_product_fournisseur_price_fk_user` (`fk_user`),
  KEY `idx_product_fourn_price_fk_product` (`fk_product`,`entity`),
  KEY `idx_product_fourn_price_fk_soc` (`fk_soc`,`entity`),
  KEY `idx_product_barcode` (`barcode`),
  KEY `idx_product_fk_barcode_type` (`fk_barcode_type`),
  CONSTRAINT `fk_product_fournisseur_price_barcode_type` FOREIGN KEY (`fk_barcode_type`) REFERENCES `llx_c_barcode_type` (`rowid`),
  CONSTRAINT `fk_product_fournisseur_price_fk_product` FOREIGN KEY (`fk_product`) REFERENCES `llx_product` (`rowid`),
  CONSTRAINT `fk_product_fournisseur_price_fk_user` FOREIGN KEY (`fk_user`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_product_fournisseur_price_extrafields`
-- ----------------------------
DROP TABLE IF EXISTS `llx_product_fournisseur_price_extrafields`;
CREATE TABLE `llx_product_fournisseur_price_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_product_fournisseur_price_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_product_fournisseur_price_log`
-- ----------------------------
DROP TABLE IF EXISTS `llx_product_fournisseur_price_log`;
CREATE TABLE `llx_product_fournisseur_price_log` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `datec` datetime DEFAULT NULL,
  `fk_product_fournisseur` int(11) NOT NULL,
  `price` double(24,8) DEFAULT '0.00000000',
  `quantity` double DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT '1.00000000',
  `multicurrency_unitprice` double(24,8) DEFAULT NULL,
  `multicurrency_price` double(24,8) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_product_lang`
-- ----------------------------
DROP TABLE IF EXISTS `llx_product_lang`;
CREATE TABLE `llx_product_lang` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_product` int(11) NOT NULL DEFAULT '0',
  `lang` varchar(5) NOT NULL DEFAULT '0',
  `label` varchar(255) NOT NULL,
  `description` text,
  `note` text,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_lang` (`fk_product`,`lang`),
  CONSTRAINT `fk_product_lang_fk_product` FOREIGN KEY (`fk_product`) REFERENCES `llx_product` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_product_lot`
-- ----------------------------
DROP TABLE IF EXISTS `llx_product_lot`;
CREATE TABLE `llx_product_lot` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) DEFAULT '1',
  `fk_product` int(11) NOT NULL,
  `batch` varchar(128) DEFAULT NULL,
  `eatby` date DEFAULT NULL,
  `sellby` date DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_lot` (`fk_product`,`batch`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_product_lot_extrafields`
-- ----------------------------
DROP TABLE IF EXISTS `llx_product_lot_extrafields`;
CREATE TABLE `llx_product_lot_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_product_lot_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_product_price`
-- ----------------------------
DROP TABLE IF EXISTS `llx_product_price`;
CREATE TABLE `llx_product_price` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_product` int(11) NOT NULL,
  `date_price` datetime NOT NULL,
  `price_level` smallint(6) DEFAULT '1',
  `price` double(24,8) DEFAULT NULL,
  `price_ttc` double(24,8) DEFAULT NULL,
  `price_min` double(24,8) DEFAULT NULL,
  `price_min_ttc` double(24,8) DEFAULT NULL,
  `price_base_type` varchar(3) DEFAULT 'HT',
  `default_vat_code` varchar(10) DEFAULT NULL,
  `tva_tx` double(6,3) NOT NULL DEFAULT '0.000',
  `recuperableonly` int(11) NOT NULL DEFAULT '0',
  `localtax1_tx` double(6,3) DEFAULT '0.000',
  `localtax1_type` varchar(10) NOT NULL DEFAULT '0',
  `localtax2_tx` double(6,3) DEFAULT '0.000',
  `localtax2_type` varchar(10) NOT NULL DEFAULT '0',
  `fk_user_author` int(11) DEFAULT NULL,
  `tosell` tinyint(4) DEFAULT '1',
  `price_by_qty` int(11) NOT NULL DEFAULT '0',
  `fk_price_expression` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT '1.00000000',
  `multicurrency_price` double(24,8) DEFAULT NULL,
  `multicurrency_price_ttc` double(24,8) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_product_price_fk_user_author` (`fk_user_author`),
  KEY `idx_product_price_fk_product` (`fk_product`),
  CONSTRAINT `fk_product_price_product` FOREIGN KEY (`fk_user_author`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `fk_product_price_user_author` FOREIGN KEY (`fk_product`) REFERENCES `llx_product` (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_product_price`
-- ----------------------------
BEGIN;
INSERT INTO `llx_product_price` VALUES ('1', '1', '2021-05-07 21:42:28', '1', '2021-05-08 04:42:28', '1', '0.00000000', '0.00000000', '0.00000000', '0.00000000', 'HT', null, '21.000', '0', '0.000', '0', '0.000', '0', '1', '1', '0', null, null, null, null, '1.00000000', null, null), ('2', '1', '2021-05-07 21:47:58', '1', '2021-05-08 04:47:58', '1', '120.00000000', '145.20000000', '0.00000000', '0.00000000', 'HT', null, '21.000', '0', '0.000', '0', '0.000', '0', '1', '1', '0', null, null, null, null, '1.00000000', null, null), ('3', '1', '2021-05-07 21:48:10', '1', '2021-05-08 04:48:10', '1', '120.00000000', '145.20000000', '110.00000000', '133.10000000', 'HT', null, '21.000', '0', '0.000', '0', '0.000', '0', '1', '1', '0', null, null, null, null, '1.00000000', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `llx_product_price_by_qty`
-- ----------------------------
DROP TABLE IF EXISTS `llx_product_price_by_qty`;
CREATE TABLE `llx_product_price_by_qty` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_product_price` int(11) NOT NULL,
  `price` double(24,8) DEFAULT '0.00000000',
  `price_base_type` varchar(3) DEFAULT 'HT',
  `quantity` double DEFAULT NULL,
  `remise_percent` double NOT NULL DEFAULT '0',
  `remise` double NOT NULL DEFAULT '0',
  `unitprice` double(24,8) DEFAULT '0.00000000',
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT '1.00000000',
  `multicurrency_price` double(24,8) DEFAULT NULL,
  `multicurrency_price_ttc` double(24,8) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_price_by_qty_level` (`fk_product_price`,`quantity`),
  KEY `idx_product_price_by_qty_fk_product_price` (`fk_product_price`),
  CONSTRAINT `fk_product_price_by_qty_fk_product_price` FOREIGN KEY (`fk_product_price`) REFERENCES `llx_product_price` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_product_pricerules`
-- ----------------------------
DROP TABLE IF EXISTS `llx_product_pricerules`;
CREATE TABLE `llx_product_pricerules` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `level` int(11) NOT NULL,
  `fk_level` int(11) NOT NULL,
  `var_percent` float NOT NULL,
  `var_min_percent` float NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `unique_level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_product_stock`
-- ----------------------------
DROP TABLE IF EXISTS `llx_product_stock`;
CREATE TABLE `llx_product_stock` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_product` int(11) NOT NULL,
  `fk_entrepot` int(11) NOT NULL,
  `reel` double DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_product_stock` (`fk_product`,`fk_entrepot`),
  KEY `idx_product_stock_fk_product` (`fk_product`),
  KEY `idx_product_stock_fk_entrepot` (`fk_entrepot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_product_warehouse_properties`
-- ----------------------------
DROP TABLE IF EXISTS `llx_product_warehouse_properties`;
CREATE TABLE `llx_product_warehouse_properties` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_product` int(11) NOT NULL,
  `fk_entrepot` int(11) NOT NULL,
  `seuil_stock_alerte` float DEFAULT NULL,
  `desiredstock` float DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_projet`
-- ----------------------------
DROP TABLE IF EXISTS `llx_projet`;
CREATE TABLE `llx_projet` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_soc` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dateo` date DEFAULT NULL,
  `datee` date DEFAULT NULL,
  `ref` varchar(50) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `title` varchar(255) NOT NULL,
  `description` text,
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `public` int(11) DEFAULT NULL,
  `fk_statut` int(11) NOT NULL DEFAULT '0',
  `fk_opp_status` int(11) DEFAULT NULL,
  `opp_percent` double(5,2) DEFAULT NULL,
  `date_close` datetime DEFAULT NULL,
  `fk_user_close` int(11) DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `opp_amount` double(24,8) DEFAULT NULL,
  `budget_amount` double(24,8) DEFAULT NULL,
  `usage_bill_time` int(11) DEFAULT '0',
  `model_pdf` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `usage_opportunity` int(11) DEFAULT '0',
  `usage_task` int(11) DEFAULT '1',
  `usage_organize_event` int(11) DEFAULT '0',
  `email_msgid` varchar(255) DEFAULT NULL,
  `fk_opp_status_end` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_projet_ref` (`ref`,`entity`),
  KEY `idx_projet_fk_soc` (`fk_soc`),
  CONSTRAINT `fk_projet_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_projet_extrafields`
-- ----------------------------
DROP TABLE IF EXISTS `llx_projet_extrafields`;
CREATE TABLE `llx_projet_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_projet_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_projet_task`
-- ----------------------------
DROP TABLE IF EXISTS `llx_projet_task`;
CREATE TABLE `llx_projet_task` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(50) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `fk_projet` int(11) NOT NULL,
  `fk_task_parent` int(11) NOT NULL DEFAULT '0',
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `dateo` datetime DEFAULT NULL,
  `datee` datetime DEFAULT NULL,
  `datev` datetime DEFAULT NULL,
  `label` varchar(255) NOT NULL,
  `description` text,
  `duration_effective` double DEFAULT '0',
  `planned_workload` double DEFAULT '0',
  `progress` int(11) DEFAULT '0',
  `priority` int(11) DEFAULT '0',
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_statut` smallint(6) NOT NULL DEFAULT '0',
  `note_private` text,
  `note_public` text,
  `rang` int(11) DEFAULT '0',
  `model_pdf` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_projet_task_ref` (`ref`,`entity`),
  KEY `idx_projet_task_fk_projet` (`fk_projet`),
  KEY `idx_projet_task_fk_user_creat` (`fk_user_creat`),
  KEY `idx_projet_task_fk_user_valid` (`fk_user_valid`),
  CONSTRAINT `fk_projet_task_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `llx_projet` (`rowid`),
  CONSTRAINT `fk_projet_task_fk_user_creat` FOREIGN KEY (`fk_user_creat`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `fk_projet_task_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_projet_task_extrafields`
-- ----------------------------
DROP TABLE IF EXISTS `llx_projet_task_extrafields`;
CREATE TABLE `llx_projet_task_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_projet_task_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_projet_task_time`
-- ----------------------------
DROP TABLE IF EXISTS `llx_projet_task_time`;
CREATE TABLE `llx_projet_task_time` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_task` int(11) NOT NULL,
  `task_date` date DEFAULT NULL,
  `task_datehour` datetime DEFAULT NULL,
  `task_date_withhour` int(11) DEFAULT '0',
  `task_duration` double DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `thm` double(24,8) DEFAULT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `invoice_line_id` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `note` text,
  PRIMARY KEY (`rowid`),
  KEY `idx_projet_task_time_task` (`fk_task`),
  KEY `idx_projet_task_time_date` (`task_date`),
  KEY `idx_projet_task_time_datehour` (`task_datehour`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_propal`
-- ----------------------------
DROP TABLE IF EXISTS `llx_propal`;
CREATE TABLE `llx_propal` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `ref_ext` varchar(255) DEFAULT NULL,
  `ref_int` varchar(255) DEFAULT NULL,
  `ref_client` varchar(255) DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` datetime DEFAULT NULL,
  `datep` date DEFAULT NULL,
  `fin_validite` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `date_cloture` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_user_cloture` int(11) DEFAULT NULL,
  `fk_statut` smallint(6) NOT NULL DEFAULT '0',
  `price` double DEFAULT '0',
  `remise_percent` double DEFAULT '0',
  `remise_absolue` double DEFAULT '0',
  `remise` double DEFAULT '0',
  `total_ht` double(24,8) DEFAULT '0.00000000',
  `tva` double(24,8) DEFAULT '0.00000000',
  `localtax1` double(24,8) DEFAULT '0.00000000',
  `localtax2` double(24,8) DEFAULT '0.00000000',
  `total` double(24,8) DEFAULT '0.00000000',
  `fk_account` int(11) DEFAULT NULL,
  `fk_currency` varchar(3) DEFAULT NULL,
  `fk_cond_reglement` int(11) DEFAULT NULL,
  `fk_mode_reglement` int(11) DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `date_livraison` date DEFAULT NULL,
  `fk_shipping_method` int(11) DEFAULT NULL,
  `fk_availability` int(11) DEFAULT NULL,
  `fk_input_reason` int(11) DEFAULT NULL,
  `fk_incoterms` int(11) DEFAULT NULL,
  `location_incoterms` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `fk_delivery_address` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT '1.00000000',
  `multicurrency_total_ht` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_tva` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ttc` double(24,8) DEFAULT '0.00000000',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_propal_ref` (`ref`,`entity`),
  KEY `idx_propal_fk_soc` (`fk_soc`),
  KEY `idx_propal_fk_user_author` (`fk_user_author`),
  KEY `idx_propal_fk_user_valid` (`fk_user_valid`),
  KEY `idx_propal_fk_user_cloture` (`fk_user_cloture`),
  KEY `idx_propal_fk_projet` (`fk_projet`),
  KEY `idx_propal_fk_account` (`fk_account`),
  KEY `idx_propal_fk_currency` (`fk_currency`),
  CONSTRAINT `fk_propal_fk_projet` FOREIGN KEY (`fk_projet`) REFERENCES `llx_projet` (`rowid`),
  CONSTRAINT `fk_propal_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_propal_fk_user_author` FOREIGN KEY (`fk_user_author`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `fk_propal_fk_user_cloture` FOREIGN KEY (`fk_user_cloture`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `fk_propal_fk_user_valid` FOREIGN KEY (`fk_user_valid`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_propal_extrafields`
-- ----------------------------
DROP TABLE IF EXISTS `llx_propal_extrafields`;
CREATE TABLE `llx_propal_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `serie` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_propal_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_propal_merge_pdf_product`
-- ----------------------------
DROP TABLE IF EXISTS `llx_propal_merge_pdf_product`;
CREATE TABLE `llx_propal_merge_pdf_product` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_product` int(11) NOT NULL,
  `file_name` varchar(200) NOT NULL,
  `lang` varchar(5) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_mod` int(11) NOT NULL,
  `datec` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_propaldet`
-- ----------------------------
DROP TABLE IF EXISTS `llx_propaldet`;
CREATE TABLE `llx_propaldet` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_propal` int(11) NOT NULL,
  `fk_parent_line` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` text,
  `fk_remise_except` int(11) DEFAULT NULL,
  `vat_src_code` varchar(10) DEFAULT '',
  `tva_tx` double(6,3) DEFAULT '0.000',
  `localtax1_tx` double(6,3) DEFAULT '0.000',
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(6,3) DEFAULT '0.000',
  `localtax2_type` varchar(10) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT '0',
  `remise` double DEFAULT '0',
  `price` double DEFAULT NULL,
  `subprice` double(24,8) DEFAULT '0.00000000',
  `total_ht` double(24,8) DEFAULT '0.00000000',
  `total_tva` double(24,8) DEFAULT '0.00000000',
  `total_localtax1` double(24,8) DEFAULT '0.00000000',
  `total_localtax2` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT '0.00000000',
  `product_type` int(11) DEFAULT '0',
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  `info_bits` int(11) DEFAULT '0',
  `buy_price_ht` double(24,8) DEFAULT '0.00000000',
  `fk_product_fournisseur_price` int(11) DEFAULT NULL,
  `special_code` int(11) DEFAULT '0',
  `rang` int(11) DEFAULT '0',
  `fk_unit` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ht` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_tva` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ttc` double(24,8) DEFAULT '0.00000000',
  PRIMARY KEY (`rowid`),
  KEY `idx_propaldet_fk_propal` (`fk_propal`),
  KEY `idx_propaldet_fk_product` (`fk_product`),
  KEY `fk_propaldet_fk_unit` (`fk_unit`),
  CONSTRAINT `fk_propaldet_fk_propal` FOREIGN KEY (`fk_propal`) REFERENCES `llx_propal` (`rowid`),
  CONSTRAINT `fk_propaldet_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `llx_c_units` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_propaldet_extrafields`
-- ----------------------------
DROP TABLE IF EXISTS `llx_propaldet_extrafields`;
CREATE TABLE `llx_propaldet_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_propaldet_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_reception`
-- ----------------------------
DROP TABLE IF EXISTS `llx_reception`;
CREATE TABLE `llx_reception` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ref` varchar(30) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `fk_soc` int(11) NOT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `ref_ext` varchar(30) DEFAULT NULL,
  `ref_int` varchar(30) DEFAULT NULL,
  `ref_supplier` varchar(30) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `date_delivery` datetime DEFAULT NULL,
  `date_reception` datetime DEFAULT NULL,
  `fk_shipping_method` int(11) DEFAULT NULL,
  `tracking_number` varchar(50) DEFAULT NULL,
  `fk_statut` smallint(6) DEFAULT '0',
  `billed` smallint(6) DEFAULT '0',
  `height` float DEFAULT NULL,
  `width` float DEFAULT NULL,
  `size_units` int(11) DEFAULT NULL,
  `size` float DEFAULT NULL,
  `weight_units` int(11) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `model_pdf` varchar(255) DEFAULT NULL,
  `fk_incoterms` int(11) DEFAULT NULL,
  `location_incoterms` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_reception_uk_ref` (`ref`,`entity`),
  KEY `idx_reception_fk_soc` (`fk_soc`),
  KEY `idx_reception_fk_user_author` (`fk_user_author`),
  KEY `idx_reception_fk_user_valid` (`fk_user_valid`),
  KEY `idx_reception_fk_shipping_method` (`fk_shipping_method`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_reception_extrafields`
-- ----------------------------
DROP TABLE IF EXISTS `llx_reception_extrafields`;
CREATE TABLE `llx_reception_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_reception_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_recruitment_recruitmentcandidature`
-- ----------------------------
DROP TABLE IF EXISTS `llx_recruitment_recruitmentcandidature`;
CREATE TABLE `llx_recruitment_recruitmentcandidature` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `fk_recruitmentjobposition` int(11) DEFAULT NULL,
  `ref` varchar(128) NOT NULL DEFAULT '(PROV)',
  `description` text,
  `note_public` text,
  `note_private` text,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `firstname` varchar(128) DEFAULT NULL,
  `lastname` varchar(128) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(64) DEFAULT NULL,
  `date_birth` date DEFAULT NULL,
  `remuneration_requested` int(11) DEFAULT NULL,
  `remuneration_proposed` int(11) DEFAULT NULL,
  `email_msgid` varchar(255) DEFAULT NULL,
  `fk_recruitment_origin` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_recruitmentcandidature_email_msgid` (`email_msgid`),
  KEY `idx_recruitment_recruitmentcandidature_rowid` (`rowid`),
  KEY `idx_recruitment_recruitmentcandidature_ref` (`ref`),
  KEY `llx_recruitment_recruitmentcandidature_fk_user_creat` (`fk_user_creat`),
  KEY `idx_recruitment_recruitmentcandidature_status` (`status`),
  CONSTRAINT `llx_recruitment_recruitmentcandidature_fk_user_creat` FOREIGN KEY (`fk_user_creat`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_recruitment_recruitmentcandidature_extrafields`
-- ----------------------------
DROP TABLE IF EXISTS `llx_recruitment_recruitmentcandidature_extrafields`;
CREATE TABLE `llx_recruitment_recruitmentcandidature_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_recruitmentcandidature_fk_object` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_recruitment_recruitmentjobposition`
-- ----------------------------
DROP TABLE IF EXISTS `llx_recruitment_recruitmentjobposition`;
CREATE TABLE `llx_recruitment_recruitmentjobposition` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(128) NOT NULL DEFAULT '(PROV)',
  `entity` int(11) NOT NULL DEFAULT '1',
  `label` varchar(255) NOT NULL,
  `qty` int(11) NOT NULL DEFAULT '1',
  `fk_soc` int(11) DEFAULT NULL,
  `fk_project` int(11) DEFAULT NULL,
  `fk_user_recruiter` int(11) DEFAULT NULL,
  `fk_user_supervisor` int(11) DEFAULT NULL,
  `fk_establishment` int(11) DEFAULT NULL,
  `date_planned` date DEFAULT NULL,
  `remuneration_suggested` varchar(255) DEFAULT NULL,
  `description` text,
  `note_public` text,
  `note_private` text,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `status` smallint(6) NOT NULL,
  `email_recruiter` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_recruitment_recruitmentjobposition_rowid` (`rowid`),
  KEY `idx_recruitment_recruitmentjobposition_ref` (`ref`),
  KEY `idx_recruitment_recruitmentjobposition_fk_soc` (`fk_soc`),
  KEY `idx_recruitment_recruitmentjobposition_fk_project` (`fk_project`),
  KEY `llx_recruitment_recruitmentjobposition_fk_user_recruiter` (`fk_user_recruiter`),
  KEY `llx_recruitment_recruitmentjobposition_fk_user_supervisor` (`fk_user_supervisor`),
  KEY `llx_recruitment_recruitmentjobposition_fk_establishment` (`fk_establishment`),
  KEY `llx_recruitment_recruitmentjobposition_fk_user_creat` (`fk_user_creat`),
  KEY `idx_recruitment_recruitmentjobposition_status` (`status`),
  CONSTRAINT `llx_recruitment_recruitmentjobposition_fk_establishment` FOREIGN KEY (`fk_establishment`) REFERENCES `llx_establishment` (`rowid`),
  CONSTRAINT `llx_recruitment_recruitmentjobposition_fk_user_creat` FOREIGN KEY (`fk_user_creat`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `llx_recruitment_recruitmentjobposition_fk_user_recruiter` FOREIGN KEY (`fk_user_recruiter`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `llx_recruitment_recruitmentjobposition_fk_user_supervisor` FOREIGN KEY (`fk_user_supervisor`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_recruitment_recruitmentjobposition_extrafields`
-- ----------------------------
DROP TABLE IF EXISTS `llx_recruitment_recruitmentjobposition_extrafields`;
CREATE TABLE `llx_recruitment_recruitmentjobposition_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_recruitmentjobposition_fk_object` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_resource`
-- ----------------------------
DROP TABLE IF EXISTS `llx_resource`;
CREATE TABLE `llx_resource` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `ref` varchar(255) DEFAULT NULL,
  `asset_number` varchar(255) DEFAULT NULL,
  `description` text,
  `fk_code_type_resource` varchar(32) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_statut` smallint(6) NOT NULL DEFAULT '0',
  `note_public` text,
  `note_private` text,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `fk_country` int(11) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_resource_ref` (`ref`,`entity`),
  KEY `fk_code_type_resource_idx` (`fk_code_type_resource`),
  KEY `idx_resource_fk_country` (`fk_country`),
  CONSTRAINT `fk_resource_fk_country` FOREIGN KEY (`fk_country`) REFERENCES `llx_c_country` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_resource_extrafields`
-- ----------------------------
DROP TABLE IF EXISTS `llx_resource_extrafields`;
CREATE TABLE `llx_resource_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_resource_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_rights_def`
-- ----------------------------
DROP TABLE IF EXISTS `llx_rights_def`;
CREATE TABLE `llx_rights_def` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) DEFAULT NULL,
  `module` varchar(64) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `perms` varchar(50) DEFAULT NULL,
  `subperms` varchar(50) DEFAULT NULL,
  `type` varchar(1) DEFAULT NULL,
  `bydefault` tinyint(4) DEFAULT '0',
  `module_position` int(11) NOT NULL DEFAULT '0',
  `family_position` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_rights_def`
-- ----------------------------
BEGIN;
INSERT INTO `llx_rights_def` VALUES ('11', 'Read invoices', 'facture', '1', 'lire', null, 'a', '0', '11', '0'), ('12', 'Create and update invoices', 'facture', '1', 'creer', null, 'a', '0', '11', '0'), ('13', 'Devalidate invoices', 'facture', '1', 'invoice_advance', 'unvalidate', 'a', '0', '11', '0'), ('14', 'Validate invoices', 'facture', '1', 'invoice_advance', 'validate', 'a', '0', '11', '0'), ('15', 'Send invoices by email', 'facture', '1', 'invoice_advance', 'send', 'a', '0', '11', '0'), ('16', 'Issue payments on invoices', 'facture', '1', 'paiement', null, 'a', '0', '11', '0'), ('19', 'Delete invoices', 'facture', '1', 'supprimer', null, 'a', '0', '11', '0'), ('21', 'Read commercial proposals', 'propale', '1', 'lire', null, 'r', '0', '10', '0'), ('22', 'Create and update commercial proposals', 'propale', '1', 'creer', null, 'w', '0', '10', '0'), ('24', 'Validate commercial proposals', 'propale', '1', 'propal_advance', 'validate', 'd', '0', '10', '0'), ('25', 'Send commercial proposals to customers', 'propale', '1', 'propal_advance', 'send', 'd', '0', '10', '0'), ('26', 'Close commercial proposals', 'propale', '1', 'propal_advance', 'close', 'd', '0', '10', '0'), ('27', 'Delete commercial proposals', 'propale', '1', 'supprimer', null, 'd', '0', '10', '0'), ('28', 'Exporting commercial proposals and attributes', 'propale', '1', 'export', null, 'r', '0', '10', '0'), ('31', 'Read products', 'produit', '1', 'lire', null, 'r', '0', '26', '0'), ('32', 'Create/modify products', 'produit', '1', 'creer', null, 'w', '0', '26', '0'), ('34', 'Delete products', 'produit', '1', 'supprimer', null, 'd', '0', '26', '0'), ('38', 'Export products', 'produit', '1', 'export', null, 'r', '0', '26', '0'), ('39', 'Ignore minimum price', 'produit', '1', 'ignore_price_min_advance', null, 'r', '0', '26', '0'), ('41', 'Read projects and tasks (shared projects or projects I am contact for). Can also enter time consumed on assigned tasks (timesheet)', 'projet', '1', 'lire', null, 'r', '0', '14', '0'), ('42', 'Create/modify projects and tasks (shared projects or projects I am contact for)', 'projet', '1', 'creer', null, 'w', '0', '14', '0'), ('44', 'Delete project and tasks (shared projects or projects I am contact for)', 'projet', '1', 'supprimer', null, 'd', '0', '14', '0'), ('45', 'Export projects', 'projet', '1', 'export', null, 'd', '0', '14', '0'), ('81', 'Read sales orders', 'commande', '1', 'lire', null, 'r', '0', '11', '0'), ('82', 'Creeat/modify sales orders', 'commande', '1', 'creer', null, 'w', '0', '11', '0'), ('84', 'Validate sales orders', 'commande', '1', 'order_advance', 'validate', 'd', '0', '11', '0'), ('86', 'Send sale orders by email', 'commande', '1', 'order_advance', 'send', 'd', '0', '11', '0'), ('87', 'Close sale orders', 'commande', '1', 'order_advance', 'close', 'd', '0', '11', '0'), ('88', 'Cancel sale orders', 'commande', '1', 'order_advance', 'annuler', 'd', '0', '11', '0'), ('89', 'Delete sales orders', 'commande', '1', 'supprimer', null, 'd', '0', '11', '0'), ('91', 'Lire les charges', 'tax', '1', 'charges', 'lire', 'r', '0', '50', '0'), ('92', 'Creer/modifier les charges', 'tax', '1', 'charges', 'creer', 'w', '0', '50', '0'), ('93', 'Supprimer les charges', 'tax', '1', 'charges', 'supprimer', 'd', '0', '50', '0'), ('94', 'Exporter les charges', 'tax', '1', 'charges', 'export', 'r', '0', '50', '0'), ('95', 'Lire CA, bilans, resultats', 'compta', '1', 'resultat', 'lire', 'r', '0', '60', '0'), ('101', 'Lire les expeditions', 'expedition', '1', 'lire', null, 'r', '0', '40', '0'), ('102', 'Creer modifier les expeditions', 'expedition', '1', 'creer', null, 'w', '0', '40', '0'), ('104', 'Valider les expeditions', 'expedition', '1', 'shipping_advance', 'validate', 'd', '0', '40', '0'), ('105', 'Envoyer les expeditions aux clients', 'expedition', '1', 'shipping_advance', 'send', 'd', '0', '40', '0'), ('106', 'Exporter les expeditions', 'expedition', '1', 'shipment', 'export', 'r', '0', '40', '0'), ('109', 'Supprimer les expeditions', 'expedition', '1', 'supprimer', null, 'd', '0', '40', '0'), ('111', 'Lire les comptes bancaires', 'banque', '1', 'lire', null, 'r', '0', '51', '0'), ('112', 'Creer/modifier montant/supprimer ecriture bancaire', 'banque', '1', 'modifier', null, 'w', '0', '51', '0'), ('113', 'Configurer les comptes bancaires (creer, gerer categories)', 'banque', '1', 'configurer', null, 'a', '0', '51', '0'), ('114', 'Rapprocher les ecritures bancaires', 'banque', '1', 'consolidate', null, 'w', '0', '51', '0'), ('115', 'Exporter transactions et releves', 'banque', '1', 'export', null, 'r', '0', '51', '0'), ('116', 'Virements entre comptes', 'banque', '1', 'transfer', null, 'w', '0', '51', '0'), ('117', 'Gerer les envois de cheques', 'banque', '1', 'cheque', null, 'w', '0', '51', '0'), ('121', 'Read third parties', 'societe', '1', 'lire', null, 'r', '0', '9', '0'), ('122', 'Create and update third parties', 'societe', '1', 'creer', null, 'w', '0', '9', '0'), ('125', 'Delete third parties', 'societe', '1', 'supprimer', null, 'd', '0', '9', '0'), ('126', 'Export third parties', 'societe', '1', 'export', null, 'r', '0', '9', '0'), ('141', 'Read all projects and tasks (also private projects I am not contact for)', 'projet', '1', 'all', 'lire', 'r', '0', '14', '0'), ('142', 'Create/modify all projects and tasks (also private projects I am not contact for). Can also enter time consumed on assigned tasks (timesheet)', 'projet', '1', 'all', 'creer', 'w', '0', '14', '0'), ('144', 'Delete all projects and tasks (also private projects I am not contact for)', 'projet', '1', 'all', 'supprimer', 'd', '0', '14', '0'), ('151', 'Read direct debit payment orders', 'prelevement', '1', 'bons', 'lire', 'r', '0', '52', '0'), ('152', 'Create/modify a direct debit payment order', 'prelevement', '1', 'bons', 'creer', 'w', '0', '52', '0'), ('153', 'Send/Transmit direct debit payment orders', 'prelevement', '1', 'bons', 'send', 'a', '0', '52', '0'), ('154', 'Record Credits/Rejects of direct debit payment orders', 'prelevement', '1', 'bons', 'credit', 'a', '0', '52', '0'), ('161', 'Lire les contrats', 'contrat', '1', 'lire', null, 'r', '0', '41', '0'), ('162', 'Creer / modifier les contrats', 'contrat', '1', 'creer', null, 'w', '0', '41', '0'), ('163', 'Activer un service d\'un contrat', 'contrat', '1', 'activer', null, 'w', '0', '41', '0'), ('164', 'Desactiver un service d\'un contrat', 'contrat', '1', 'desactiver', null, 'w', '0', '41', '0'), ('165', 'Supprimer un contrat', 'contrat', '1', 'supprimer', null, 'd', '0', '41', '0'), ('167', 'Export contracts', 'contrat', '1', 'export', null, 'r', '0', '41', '0'), ('241', 'Lire les categories', 'categorie', '1', 'lire', null, 'r', '0', '20', '0'), ('242', 'Creer/modifier les categories', 'categorie', '1', 'creer', null, 'w', '0', '20', '0'), ('243', 'Supprimer les categories', 'categorie', '1', 'supprimer', null, 'd', '0', '20', '0'), ('251', 'Consulter les autres utilisateurs', 'user', '1', 'user', 'lire', 'r', '0', '5', '0'), ('252', 'Consulter les permissions des autres utilisateurs', 'user', '1', 'user_advance', 'readperms', 'r', '0', '5', '0'), ('253', 'Creer/modifier utilisateurs internes et externes', 'user', '1', 'user', 'creer', 'w', '0', '5', '0'), ('254', 'Creer/modifier utilisateurs externes seulement', 'user', '1', 'user_advance', 'write', 'w', '0', '5', '0'), ('255', 'Modifier le mot de passe des autres utilisateurs', 'user', '1', 'user', 'password', 'w', '0', '5', '0'), ('256', 'Supprimer ou desactiver les autres utilisateurs', 'user', '1', 'user', 'supprimer', 'd', '0', '5', '0'), ('262', 'Read all third parties by internal users (otherwise only if commercial contact). Not effective for external users (limited to themselves).', 'societe', '1', 'client', 'voir', 'r', '0', '9', '0'), ('281', 'Read contacts', 'societe', '1', 'contact', 'lire', 'r', '0', '9', '0'), ('282', 'Create and update contact', 'societe', '1', 'contact', 'creer', 'w', '0', '9', '0'), ('283', 'Delete contacts', 'societe', '1', 'contact', 'supprimer', 'd', '0', '9', '0'), ('286', 'Export contacts', 'societe', '1', 'contact', 'export', 'd', '0', '9', '0'), ('300', 'Read barcodes', 'barcode', '1', 'lire_advance', null, 'r', '1', '0', '0'), ('301', 'Create/modify barcodes', 'barcode', '1', 'creer_advance', null, 'w', '0', '0', '0'), ('331', 'Lire les bookmarks', 'bookmark', '1', 'lire', null, 'r', '0', '50', '0'), ('332', 'Creer/modifier les bookmarks', 'bookmark', '1', 'creer', null, 'r', '0', '50', '0'), ('333', 'Supprimer les bookmarks', 'bookmark', '1', 'supprimer', null, 'r', '0', '50', '0'), ('341', 'Consulter ses propres permissions', 'user', '1', 'self_advance', 'readperms', 'r', '0', '5', '0'), ('342', 'Creer/modifier ses propres infos utilisateur', 'user', '1', 'self', 'creer', 'w', '0', '5', '0'), ('343', 'Modifier son propre mot de passe', 'user', '1', 'self', 'password', 'w', '0', '5', '0'), ('344', 'Modifier ses propres permissions', 'user', '1', 'self_advance', 'writeperms', 'w', '0', '5', '0'), ('351', 'Consulter les groupes', 'user', '1', 'group_advance', 'read', 'r', '0', '5', '0'), ('352', 'Consulter les permissions des groupes', 'user', '1', 'group_advance', 'readperms', 'r', '0', '5', '0'), ('353', 'Creer/modifier les groupes et leurs permissions', 'user', '1', 'group_advance', 'write', 'w', '0', '5', '0'), ('354', 'Supprimer ou desactiver les groupes', 'user', '1', 'group_advance', 'delete', 'd', '0', '5', '0'), ('358', 'Exporter les utilisateurs', 'user', '1', 'user', 'export', 'r', '0', '5', '0'), ('511', 'Read payments of employee salaries (yours and your subordinates)', 'salaries', '1', 'read', null, 'r', '0', '50', '0'), ('512', 'Create/modify payments of empoyee salaries', 'salaries', '1', 'write', null, 'w', '0', '50', '0'), ('514', 'Delete payments of employee salary', 'salaries', '1', 'delete', null, 'd', '0', '50', '0'), ('517', 'Read payments of salariests of every employee', 'salaries', '1', 'readall', null, 'r', '0', '50', '0'), ('519', 'Export payments of employee salaries', 'salaries', '1', 'export', null, 'r', '0', '50', '0'), ('520', 'Read loans', 'loan', '1', 'read', null, 'r', '0', '50', '0'), ('522', 'Create/modify loans', 'loan', '1', 'write', null, 'w', '0', '50', '0'), ('524', 'Delete loans', 'loan', '1', 'delete', null, 'd', '0', '50', '0'), ('525', 'Access loan calculator', 'loan', '1', 'calc', null, 'r', '0', '50', '0'), ('527', 'Export loans', 'loan', '1', 'export', null, 'r', '0', '50', '0'), ('561', 'Read bank transfer payment orders', 'paymentbybanktransfer', '1', 'read', null, 'r', '0', '52', '0'), ('562', 'Create/modify a bank transfer payment order', 'paymentbybanktransfer', '1', 'create', null, 'w', '0', '52', '0'), ('563', 'Send/Transmit bank transfer payment order', 'paymentbybanktransfer', '1', 'send', null, 'a', '0', '52', '0'), ('564', 'Record Debits/Rejects of bank transfer payment order', 'paymentbybanktransfer', '1', 'debit', null, 'a', '0', '52', '0'), ('650', 'Read bom of Bom', 'bom', '1', 'read', null, 'w', '0', '65', '0'), ('651', 'Create/Update bom of Bom', 'bom', '1', 'write', null, 'w', '0', '65', '0'), ('652', 'Delete bom of Bom', 'bom', '1', 'delete', null, 'w', '0', '65', '0'), ('660', 'Read Manufacturing Order', 'mrp', '1', 'read', null, 'w', '0', '66', '0'), ('661', 'Create/Update Manufacturing Order', 'mrp', '1', 'write', null, 'w', '0', '66', '0'), ('662', 'Delete Manufacturing Order', 'mrp', '1', 'delete', null, 'w', '0', '66', '0'), ('771', 'Read expense reports (yours and your subordinates)', 'expensereport', '1', 'lire', null, 'r', '0', '42', '0'), ('772', 'Create/modify expense reports', 'expensereport', '1', 'creer', null, 'w', '0', '42', '0'), ('773', 'Delete expense reports', 'expensereport', '1', 'supprimer', null, 'd', '0', '42', '0'), ('775', 'Approve expense reports', 'expensereport', '1', 'approve', null, 'w', '0', '42', '0'), ('776', 'Pay expense reports', 'expensereport', '1', 'to_paid', null, 'w', '0', '42', '0'), ('777', 'Read expense reports of everybody', 'expensereport', '1', 'readall', null, 'r', '0', '42', '0'), ('778', 'Create expense reports for everybody', 'expensereport', '1', 'writeall_advance', null, 'w', '0', '42', '0'), ('779', 'Export expense reports', 'expensereport', '1', 'export', null, 'r', '0', '42', '0'), ('1001', 'Lire les stocks', 'stock', '1', 'lire', null, 'r', '0', '39', '0'), ('1002', 'Creer/Modifier les stocks', 'stock', '1', 'creer', null, 'w', '0', '39', '0'), ('1003', 'Supprimer les stocks', 'stock', '1', 'supprimer', null, 'd', '0', '39', '0'), ('1004', 'Lire mouvements de stocks', 'stock', '1', 'mouvement', 'lire', 'r', '0', '39', '0'), ('1005', 'Creer/modifier mouvements de stocks', 'stock', '1', 'mouvement', 'creer', 'w', '0', '39', '0'), ('1101', 'Lire les bons de livraison', 'expedition', '1', 'delivery', 'lire', 'r', '0', '40', '0'), ('1102', 'Creer modifier les bons de livraison', 'expedition', '1', 'delivery', 'creer', 'w', '0', '40', '0'), ('1104', 'Valider les bons de livraison', 'expedition', '1', 'delivery_advance', 'validate', 'd', '0', '40', '0'), ('1109', 'Supprimer les bons de livraison', 'expedition', '1', 'delivery', 'supprimer', 'd', '0', '40', '0'), ('1121', 'Read supplier proposals', 'supplier_proposal', '1', 'lire', null, 'w', '0', '35', '0'), ('1122', 'Create/modify supplier proposals', 'supplier_proposal', '1', 'creer', null, 'w', '0', '35', '0'), ('1123', 'Validate supplier proposals', 'supplier_proposal', '1', 'validate_advance', null, 'w', '0', '35', '0'), ('1124', 'Envoyer les demandes fournisseurs', 'supplier_proposal', '1', 'send_advance', null, 'w', '0', '35', '0'), ('1125', 'Delete supplier proposals', 'supplier_proposal', '1', 'supprimer', null, 'w', '0', '35', '0'), ('1126', 'Close supplier price requests', 'supplier_proposal', '1', 'cloturer', null, 'w', '0', '35', '0'), ('1181', 'Consulter les fournisseurs', 'fournisseur', '1', 'lire', null, 'r', '0', '12', '0'), ('1182', 'Consulter les commandes fournisseur', 'fournisseur', '1', 'commande', 'lire', 'r', '0', '12', '0'), ('1183', 'Creer une commande fournisseur', 'fournisseur', '1', 'commande', 'creer', 'w', '0', '12', '0'), ('1184', 'Valider une commande fournisseur', 'fournisseur', '1', 'supplier_order_advance', 'validate', 'w', '0', '12', '0'), ('1185', 'Approuver une commande fournisseur', 'fournisseur', '1', 'commande', 'approuver', 'w', '0', '12', '0'), ('1186', 'Commander une commande fournisseur', 'fournisseur', '1', 'commande', 'commander', 'w', '0', '12', '0'), ('1187', 'Receptionner une commande fournisseur', 'fournisseur', '1', 'commande', 'receptionner', 'd', '0', '12', '0'), ('1188', 'Supprimer une commande fournisseur', 'fournisseur', '1', 'commande', 'supprimer', 'd', '0', '12', '0'), ('1189', 'Check/Uncheck a supplier order reception', 'fournisseur', '1', 'commande_advance', 'check', 'w', '0', '12', '0'), ('1191', 'Exporter les commande fournisseurs, attributs', 'fournisseur', '1', 'commande', 'export', 'r', '0', '12', '0'), ('1201', 'Lire les exports', 'export', '1', 'lire', null, 'r', '0', '72', '0'), ('1202', 'Creer/modifier un export', 'export', '1', 'creer', null, 'w', '0', '72', '0'), ('1231', 'Consulter les factures fournisseur', 'fournisseur', '1', 'facture', 'lire', 'r', '0', '12', '0'), ('1232', 'Creer une facture fournisseur', 'fournisseur', '1', 'facture', 'creer', 'w', '0', '12', '0'), ('1233', 'Valider une facture fournisseur', 'fournisseur', '1', 'supplier_invoice_advance', 'validate', 'w', '0', '12', '0'), ('1234', 'Supprimer une facture fournisseur', 'fournisseur', '1', 'facture', 'supprimer', 'd', '0', '12', '0'), ('1235', 'Envoyer les factures par mail', 'fournisseur', '1', 'supplier_invoice_advance', 'send', 'a', '0', '12', '0'), ('1236', 'Exporter les factures fournisseurs, attributs et reglements', 'fournisseur', '1', 'facture', 'export', 'r', '0', '12', '0'), ('1251', 'Run mass imports of external data (data load)', 'import', '1', 'run', null, 'r', '0', '70', '0'), ('1321', 'Export customer invoices, attributes and payments', 'facture', '1', 'facture', 'export', 'r', '0', '11', '0'), ('1322', 'Re-open a fully paid invoice', 'facture', '1', 'invoice_advance', 'reopen', 'r', '0', '11', '0'), ('1421', 'Export sales orders and attributes', 'commande', '1', 'commande', 'export', 'r', '0', '11', '0'), ('2401', 'Read actions/tasks linked to his account', 'agenda', '1', 'myactions', 'read', 'r', '0', '15', '0'), ('2402', 'Create/modify actions/tasks linked to his account', 'agenda', '1', 'myactions', 'create', 'w', '0', '15', '0'), ('2403', 'Delete actions/tasks linked to his account', 'agenda', '1', 'myactions', 'delete', 'w', '0', '15', '0'), ('2411', 'Read actions/tasks of others', 'agenda', '1', 'allactions', 'read', 'r', '0', '15', '0'), ('2412', 'Create/modify actions/tasks of others', 'agenda', '1', 'allactions', 'create', 'w', '0', '15', '0'), ('2413', 'Delete actions/tasks of others', 'agenda', '1', 'allactions', 'delete', 'w', '0', '15', '0'), ('2414', 'Export actions/tasks of others', 'agenda', '1', 'export', null, 'w', '0', '15', '0'), ('2501', 'Read or download documents', 'ecm', '1', 'read', null, 'r', '0', '10', '0'), ('2503', 'Upload a document', 'ecm', '1', 'upload', null, 'w', '0', '10', '0'), ('2515', 'Administer directories of documents', 'ecm', '1', 'setup', null, 'w', '0', '10', '0'), ('3301', 'Generate new modules', 'modulebuilder', '1', 'run', null, 'a', '0', '90', '0'), ('20001', 'Read leave requests (yours and your subordinates)', 'holiday', '1', 'read', null, 'w', '0', '42', '0'), ('20002', 'Create/modify leave requests', 'holiday', '1', 'write', null, 'w', '0', '42', '0'), ('20003', 'Delete leave requests', 'holiday', '1', 'delete', null, 'w', '0', '42', '0'), ('20004', 'Read leave requests for everybody', 'holiday', '1', 'readall', null, 'w', '0', '42', '0'), ('20005', 'Create/modify leave requests for everybody', 'holiday', '1', 'writeall_advance', null, 'w', '0', '42', '0'), ('20006', 'Setup leave requests of users (setup and update balance)', 'holiday', '1', 'define_holiday', null, 'w', '0', '42', '0'), ('20007', 'Approve leave requests', 'holiday', '1', 'approve', null, 'w', '0', '42', '0'), ('23001', 'Read cron jobs', 'cron', '1', 'read', null, 'w', '0', '50', '0'), ('23002', 'Create cron Jobs', 'cron', '1', 'create', null, 'w', '0', '50', '0'), ('23003', 'Delete cron Jobs', 'cron', '1', 'delete', null, 'w', '0', '50', '0'), ('23004', 'Execute cron Jobs', 'cron', '1', 'execute', null, 'w', '0', '50', '0'), ('59001', 'Visualiser les marges', 'margins', '1', 'liretous', null, 'r', '0', '55', '0'), ('59002', 'Définir les marges', 'margins', '1', 'creer', null, 'w', '0', '55', '0'), ('59003', 'Read every user margin', 'margins', '1', 'read', 'all', 'r', '0', '55', '0'), ('63001', 'Read resources', 'resource', '1', 'read', null, 'w', '0', '16', '0'), ('63002', 'Create/Modify resources', 'resource', '1', 'write', null, 'w', '0', '16', '0'), ('63003', 'Delete resources', 'resource', '1', 'delete', null, 'w', '0', '16', '0'), ('63004', 'Link resources to agenda events', 'resource', '1', 'link', null, 'w', '0', '16', '0'), ('500000', 'Read objects of Sin_precio', 'sin_precio', '1', 'myobject', 'read', 'w', '0', '90', '0'), ('500001', 'Create/Update objects of Sin_precio', 'sin_precio', '1', 'myobject', 'write', 'w', '0', '90', '0'), ('500002', 'Delete objects of Sin_precio', 'sin_precio', '1', 'myobject', 'delete', 'w', '0', '90', '0'), ('500003', 'Do not see product prices', 'sin_precio', '1', 'myobject', 'price', 'w', '0', '90', '0');
COMMIT;

-- ----------------------------
--  Table structure for `llx_session`
-- ----------------------------
DROP TABLE IF EXISTS `llx_session`;
CREATE TABLE `llx_session` (
  `session_id` varchar(50) NOT NULL,
  `session_variable` text,
  `last_accessed` datetime NOT NULL,
  `fk_user` int(11) NOT NULL,
  `remote_ip` varchar(64) DEFAULT NULL,
  `user_agent` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_societe`
-- ----------------------------
DROP TABLE IF EXISTS `llx_societe`;
CREATE TABLE `llx_societe` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(128) DEFAULT NULL,
  `name_alias` varchar(128) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `ref_ext` varchar(255) DEFAULT NULL,
  `ref_int` varchar(255) DEFAULT NULL,
  `statut` tinyint(4) DEFAULT '0',
  `parent` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `code_client` varchar(24) DEFAULT NULL,
  `code_fournisseur` varchar(24) DEFAULT NULL,
  `code_compta` varchar(24) DEFAULT NULL,
  `code_compta_fournisseur` varchar(24) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zip` varchar(25) DEFAULT NULL,
  `town` varchar(50) DEFAULT NULL,
  `fk_departement` int(11) DEFAULT '0',
  `fk_pays` int(11) DEFAULT '0',
  `fk_account` int(11) DEFAULT '0',
  `phone` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `socialnetworks` text,
  `skype` varchar(255) DEFAULT NULL,
  `whatsapp` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `googleplus` varchar(255) DEFAULT NULL,
  `snapchat` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `fk_effectif` int(11) DEFAULT '0',
  `fk_typent` int(11) DEFAULT '0',
  `fk_forme_juridique` int(11) DEFAULT '0',
  `fk_currency` varchar(3) DEFAULT NULL,
  `siren` varchar(128) DEFAULT NULL,
  `siret` varchar(128) DEFAULT NULL,
  `ape` varchar(128) DEFAULT NULL,
  `idprof4` varchar(128) DEFAULT NULL,
  `idprof5` varchar(128) DEFAULT NULL,
  `idprof6` varchar(128) DEFAULT NULL,
  `tva_intra` varchar(20) DEFAULT NULL,
  `capital` double(24,8) DEFAULT NULL,
  `fk_stcomm` int(11) NOT NULL DEFAULT '0',
  `note_private` text,
  `note_public` text,
  `model_pdf` varchar(255) DEFAULT NULL,
  `prefix_comm` varchar(5) DEFAULT NULL,
  `client` tinyint(4) DEFAULT '0',
  `fournisseur` tinyint(4) DEFAULT '0',
  `supplier_account` varchar(32) DEFAULT NULL,
  `fk_prospectlevel` varchar(12) DEFAULT NULL,
  `fk_incoterms` int(11) DEFAULT NULL,
  `location_incoterms` varchar(255) DEFAULT NULL,
  `customer_bad` tinyint(4) DEFAULT '0',
  `customer_rate` double DEFAULT '0',
  `supplier_rate` double DEFAULT '0',
  `remise_client` double DEFAULT '0',
  `remise_supplier` double DEFAULT '0',
  `mode_reglement` tinyint(4) DEFAULT NULL,
  `cond_reglement` tinyint(4) DEFAULT NULL,
  `transport_mode` tinyint(4) DEFAULT NULL,
  `mode_reglement_supplier` tinyint(4) DEFAULT NULL,
  `cond_reglement_supplier` tinyint(4) DEFAULT NULL,
  `transport_mode_supplier` tinyint(4) DEFAULT NULL,
  `fk_shipping_method` int(11) DEFAULT NULL,
  `tva_assuj` tinyint(4) DEFAULT '1',
  `localtax1_assuj` tinyint(4) DEFAULT '0',
  `localtax1_value` double(6,3) DEFAULT NULL,
  `localtax2_assuj` tinyint(4) DEFAULT '0',
  `localtax2_value` double(6,3) DEFAULT NULL,
  `barcode` varchar(180) DEFAULT NULL,
  `fk_barcode_type` int(11) DEFAULT '0',
  `price_level` int(11) DEFAULT NULL,
  `outstanding_limit` double(24,8) DEFAULT NULL,
  `order_min_amount` double(24,8) DEFAULT NULL,
  `supplier_order_min_amount` double(24,8) DEFAULT NULL,
  `default_lang` varchar(6) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `canvas` varchar(32) DEFAULT NULL,
  `fk_entrepot` int(11) DEFAULT '0',
  `webservices_url` varchar(255) DEFAULT NULL,
  `webservices_key` varchar(128) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` datetime DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `logo_squarred` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_societe_prefix_comm` (`prefix_comm`,`entity`),
  UNIQUE KEY `uk_societe_code_client` (`code_client`,`entity`),
  UNIQUE KEY `uk_societe_code_fournisseur` (`code_fournisseur`,`entity`),
  UNIQUE KEY `uk_societe_barcode` (`barcode`,`fk_barcode_type`,`entity`),
  KEY `idx_societe_user_creat` (`fk_user_creat`),
  KEY `idx_societe_user_modif` (`fk_user_modif`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_societe`
-- ----------------------------
BEGIN;
INSERT INTO `llx_societe` VALUES ('1', 'Moisés', 'Moy', '1', null, null, '0', null, '1', 'CU2105-00001', null, null, null, 'Panamá', null, null, '0', '4', '0', null, null, null, null, '[]', null, null, null, null, null, null, null, null, null, null, '0', null, null, '', '', '', '', '', '', '', null, '0', null, null, '', null, '2', '0', null, '', '0', null, '0', '0', '0', '0', '0', null, null, null, null, null, null, null, '1', null, '0.000', null, '0.000', null, '0', null, null, null, null, null, null, null, '0', null, null, '2021-05-07 21:43:04', '2021-05-08 04:43:04', '1', '1', '0', '', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `llx_societe_account`
-- ----------------------------
DROP TABLE IF EXISTS `llx_societe_account`;
CREATE TABLE `llx_societe_account` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) DEFAULT '1',
  `key_account` varchar(128) DEFAULT NULL,
  `login` varchar(128) NOT NULL,
  `pass_encoding` varchar(24) DEFAULT NULL,
  `pass_crypted` varchar(128) DEFAULT NULL,
  `pass_temp` varchar(128) DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `site` varchar(128) DEFAULT NULL,
  `fk_website` int(11) DEFAULT NULL,
  `note_private` text,
  `date_last_login` datetime DEFAULT NULL,
  `date_previous_login` datetime DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_creat` int(11) NOT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `site_account` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_societe_account_login_website_soc` (`entity`,`fk_soc`,`login`,`site`,`fk_website`),
  UNIQUE KEY `uk_societe_account_key_account_soc` (`entity`,`fk_soc`,`key_account`,`site`,`fk_website`),
  KEY `idx_societe_account_rowid` (`rowid`),
  KEY `idx_societe_account_login` (`login`),
  KEY `idx_societe_account_status` (`status`),
  KEY `idx_societe_account_fk_website` (`fk_website`),
  KEY `idx_societe_account_fk_soc` (`fk_soc`),
  CONSTRAINT `llx_societe_account_fk_societe` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `llx_societe_account_fk_website` FOREIGN KEY (`fk_website`) REFERENCES `llx_website` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_societe_address`
-- ----------------------------
DROP TABLE IF EXISTS `llx_societe_address`;
CREATE TABLE `llx_societe_address` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `label` varchar(30) DEFAULT NULL,
  `fk_soc` int(11) DEFAULT '0',
  `name` varchar(60) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zip` varchar(10) DEFAULT NULL,
  `town` varchar(50) DEFAULT NULL,
  `fk_pays` int(11) DEFAULT '0',
  `phone` varchar(20) DEFAULT NULL,
  `fax` varchar(20) DEFAULT NULL,
  `note` text,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_societe_commerciaux`
-- ----------------------------
DROP TABLE IF EXISTS `llx_societe_commerciaux`;
CREATE TABLE `llx_societe_commerciaux` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_societe_commerciaux` (`fk_soc`,`fk_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_societe_contacts`
-- ----------------------------
DROP TABLE IF EXISTS `llx_societe_contacts`;
CREATE TABLE `llx_societe_contacts` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `date_creation` datetime NOT NULL,
  `fk_soc` int(11) NOT NULL,
  `fk_c_type_contact` int(11) NOT NULL,
  `fk_socpeople` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `idx_societe_contacts_idx1` (`entity`,`fk_soc`,`fk_c_type_contact`,`fk_socpeople`),
  KEY `fk_societe_contacts_fk_c_type_contact` (`fk_c_type_contact`),
  KEY `fk_societe_contacts_fk_soc` (`fk_soc`),
  KEY `fk_societe_contacts_fk_socpeople` (`fk_socpeople`),
  CONSTRAINT `fk_societe_contacts_fk_c_type_contact` FOREIGN KEY (`fk_c_type_contact`) REFERENCES `llx_c_type_contact` (`rowid`),
  CONSTRAINT `fk_societe_contacts_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_societe_contacts_fk_socpeople` FOREIGN KEY (`fk_socpeople`) REFERENCES `llx_socpeople` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_societe_extrafields`
-- ----------------------------
DROP TABLE IF EXISTS `llx_societe_extrafields`;
CREATE TABLE `llx_societe_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_societe_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_societe_log`
-- ----------------------------
DROP TABLE IF EXISTS `llx_societe_log`;
CREATE TABLE `llx_societe_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datel` datetime DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_statut` int(11) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `author` varchar(30) DEFAULT NULL,
  `label` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_societe_prices`
-- ----------------------------
DROP TABLE IF EXISTS `llx_societe_prices`;
CREATE TABLE `llx_societe_prices` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_soc` int(11) DEFAULT '0',
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `price_level` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_societe_remise`
-- ----------------------------
DROP TABLE IF EXISTS `llx_societe_remise`;
CREATE TABLE `llx_societe_remise` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `fk_soc` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `remise_client` double(6,3) NOT NULL DEFAULT '0.000',
  `note` text,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_societe_remise_except`
-- ----------------------------
DROP TABLE IF EXISTS `llx_societe_remise_except`;
CREATE TABLE `llx_societe_remise_except` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `fk_soc` int(11) NOT NULL,
  `discount_type` int(11) NOT NULL DEFAULT '0',
  `datec` datetime DEFAULT NULL,
  `amount_ht` double(24,8) NOT NULL,
  `amount_tva` double(24,8) NOT NULL DEFAULT '0.00000000',
  `amount_ttc` double(24,8) NOT NULL DEFAULT '0.00000000',
  `tva_tx` double(6,3) NOT NULL DEFAULT '0.000',
  `fk_user` int(11) NOT NULL,
  `fk_facture_line` int(11) DEFAULT NULL,
  `fk_facture` int(11) DEFAULT NULL,
  `fk_facture_source` int(11) DEFAULT NULL,
  `fk_invoice_supplier_line` int(11) DEFAULT NULL,
  `fk_invoice_supplier` int(11) DEFAULT NULL,
  `fk_invoice_supplier_source` int(11) DEFAULT NULL,
  `description` text NOT NULL,
  `multicurrency_amount_ht` double(24,8) NOT NULL DEFAULT '0.00000000',
  `multicurrency_amount_tva` double(24,8) NOT NULL DEFAULT '0.00000000',
  `multicurrency_amount_ttc` double(24,8) NOT NULL DEFAULT '0.00000000',
  `vat_src_code` varchar(10) DEFAULT '',
  PRIMARY KEY (`rowid`),
  KEY `idx_societe_remise_except_fk_user` (`fk_user`),
  KEY `idx_societe_remise_except_fk_soc` (`fk_soc`),
  KEY `idx_societe_remise_except_fk_facture_line` (`fk_facture_line`),
  KEY `idx_societe_remise_except_fk_facture` (`fk_facture`),
  KEY `idx_societe_remise_except_fk_facture_source` (`fk_facture_source`),
  KEY `idx_societe_remise_except_discount_type` (`discount_type`),
  KEY `fk_soc_remise_fk_invoice_supplier_line` (`fk_invoice_supplier_line`),
  KEY `fk_societe_remise_fk_invoice_supplier_source` (`fk_invoice_supplier`),
  CONSTRAINT `fk_soc_remise_fk_facture_line` FOREIGN KEY (`fk_facture_line`) REFERENCES `llx_facturedet` (`rowid`),
  CONSTRAINT `fk_soc_remise_fk_invoice_supplier_line` FOREIGN KEY (`fk_invoice_supplier_line`) REFERENCES `llx_facture_fourn_det` (`rowid`),
  CONSTRAINT `fk_soc_remise_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_societe_remise_fk_facture` FOREIGN KEY (`fk_facture`) REFERENCES `llx_facture` (`rowid`),
  CONSTRAINT `fk_societe_remise_fk_facture_source` FOREIGN KEY (`fk_facture_source`) REFERENCES `llx_facture` (`rowid`),
  CONSTRAINT `fk_societe_remise_fk_invoice_supplier` FOREIGN KEY (`fk_invoice_supplier`) REFERENCES `llx_facture_fourn` (`rowid`),
  CONSTRAINT `fk_societe_remise_fk_invoice_supplier_source` FOREIGN KEY (`fk_invoice_supplier`) REFERENCES `llx_facture_fourn` (`rowid`),
  CONSTRAINT `fk_societe_remise_fk_user` FOREIGN KEY (`fk_user`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_societe_remise_supplier`
-- ----------------------------
DROP TABLE IF EXISTS `llx_societe_remise_supplier`;
CREATE TABLE `llx_societe_remise_supplier` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `fk_soc` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `remise_supplier` double(6,3) NOT NULL DEFAULT '0.000',
  `note` text,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_societe_rib`
-- ----------------------------
DROP TABLE IF EXISTS `llx_societe_rib`;
CREATE TABLE `llx_societe_rib` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) NOT NULL DEFAULT 'ban',
  `label` varchar(200) DEFAULT NULL,
  `fk_soc` int(11) NOT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `bank` varchar(255) DEFAULT NULL,
  `code_banque` varchar(128) DEFAULT NULL,
  `code_guichet` varchar(6) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `cle_rib` varchar(5) DEFAULT NULL,
  `bic` varchar(20) DEFAULT NULL,
  `iban_prefix` varchar(34) DEFAULT NULL,
  `domiciliation` varchar(255) DEFAULT NULL,
  `proprio` varchar(60) DEFAULT NULL,
  `owner_address` varchar(255) DEFAULT NULL,
  `default_rib` smallint(6) NOT NULL DEFAULT '0',
  `rum` varchar(32) DEFAULT NULL,
  `date_rum` date DEFAULT NULL,
  `frstrecur` varchar(16) DEFAULT 'FRST',
  `last_four` varchar(4) DEFAULT NULL,
  `card_type` varchar(255) DEFAULT NULL,
  `cvn` varchar(255) DEFAULT NULL,
  `exp_date_month` int(11) DEFAULT NULL,
  `exp_date_year` int(11) DEFAULT NULL,
  `country_code` varchar(10) DEFAULT NULL,
  `approved` int(11) DEFAULT '0',
  `email` varchar(255) DEFAULT NULL,
  `ending_date` date DEFAULT NULL,
  `max_total_amount_of_all_payments` double(24,8) DEFAULT NULL,
  `preapproval_key` varchar(255) DEFAULT NULL,
  `starting_date` date DEFAULT NULL,
  `total_amount_of_all_payments` double(24,8) DEFAULT NULL,
  `stripe_card_ref` varchar(128) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `import_key` varchar(14) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `ipaddress` varchar(68) DEFAULT NULL,
  `stripe_account` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_societe_rib` (`label`,`fk_soc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_socpeople`
-- ----------------------------
DROP TABLE IF EXISTS `llx_socpeople`;
CREATE TABLE `llx_socpeople` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_soc` int(11) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `ref_ext` varchar(255) DEFAULT NULL,
  `civility` varchar(6) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zip` varchar(25) DEFAULT NULL,
  `town` varchar(255) DEFAULT NULL,
  `fk_departement` int(11) DEFAULT NULL,
  `fk_pays` int(11) DEFAULT '0',
  `birthday` date DEFAULT NULL,
  `poste` varchar(80) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `phone_perso` varchar(30) DEFAULT NULL,
  `phone_mobile` varchar(30) DEFAULT NULL,
  `fax` varchar(30) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `socialnetworks` text,
  `jabberid` varchar(255) DEFAULT NULL,
  `skype` varchar(255) DEFAULT NULL,
  `whatsapp` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `googleplus` varchar(255) DEFAULT NULL,
  `snapchat` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `no_email` smallint(6) NOT NULL DEFAULT '0',
  `priv` smallint(6) NOT NULL DEFAULT '0',
  `fk_prospectcontactlevel` varchar(12) DEFAULT NULL,
  `fk_stcommcontact` int(11) NOT NULL DEFAULT '0',
  `fk_user_creat` int(11) DEFAULT '0',
  `fk_user_modif` int(11) DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `default_lang` varchar(6) DEFAULT NULL,
  `canvas` varchar(32) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `statut` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`rowid`),
  KEY `idx_socpeople_fk_soc` (`fk_soc`),
  KEY `idx_socpeople_fk_user_creat` (`fk_user_creat`),
  CONSTRAINT `fk_socpeople_fk_soc` FOREIGN KEY (`fk_soc`) REFERENCES `llx_societe` (`rowid`),
  CONSTRAINT `fk_socpeople_user_creat_user_rowid` FOREIGN KEY (`fk_user_creat`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_socpeople`
-- ----------------------------
BEGIN;
INSERT INTO `llx_socpeople` VALUES ('1', '2021-05-08 15:04:21', '2021-05-08 08:05:54', '1', '1', '', 'MME', 'cantonaaa', 'contacto', 'cr', '', '', null, '4', null, '', '', '', '', '', '', '[]', null, null, null, null, null, null, null, null, null, null, '', '0', '0', '', '0', '1', '1', '', '', null, null, null, '1');
COMMIT;

-- ----------------------------
--  Table structure for `llx_socpeople_extrafields`
-- ----------------------------
DROP TABLE IF EXISTS `llx_socpeople_extrafields`;
CREATE TABLE `llx_socpeople_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_socpeople_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_stock_mouvement`
-- ----------------------------
DROP TABLE IF EXISTS `llx_stock_mouvement`;
CREATE TABLE `llx_stock_mouvement` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datem` datetime DEFAULT NULL,
  `fk_product` int(11) NOT NULL,
  `batch` varchar(128) DEFAULT NULL,
  `eatby` date DEFAULT NULL,
  `sellby` date DEFAULT NULL,
  `fk_entrepot` int(11) NOT NULL,
  `value` double DEFAULT NULL,
  `price` double(24,8) DEFAULT '0.00000000',
  `type_mouvement` smallint(6) DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `inventorycode` varchar(128) DEFAULT NULL,
  `fk_origin` int(11) DEFAULT NULL,
  `origintype` varchar(32) DEFAULT NULL,
  `model_pdf` varchar(255) DEFAULT NULL,
  `fk_projet` int(11) NOT NULL DEFAULT '0',
  `fk_project` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_stock_mouvement_fk_product` (`fk_product`),
  KEY `idx_stock_mouvement_fk_entrepot` (`fk_entrepot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_subscription`
-- ----------------------------
DROP TABLE IF EXISTS `llx_subscription`;
CREATE TABLE `llx_subscription` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` datetime DEFAULT NULL,
  `fk_adherent` int(11) DEFAULT NULL,
  `dateadh` datetime DEFAULT NULL,
  `datef` datetime DEFAULT NULL,
  `subscription` double(24,8) DEFAULT NULL,
  `fk_bank` int(11) DEFAULT NULL,
  `note` text,
  `fk_type` int(11) DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_subscription` (`fk_adherent`,`dateadh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_supplier_proposal`
-- ----------------------------
DROP TABLE IF EXISTS `llx_supplier_proposal`;
CREATE TABLE `llx_supplier_proposal` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `ref` varchar(30) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `ref_ext` varchar(255) DEFAULT NULL,
  `ref_int` varchar(255) DEFAULT NULL,
  `fk_soc` int(11) DEFAULT NULL,
  `fk_projet` int(11) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` datetime DEFAULT NULL,
  `date_valid` datetime DEFAULT NULL,
  `date_cloture` datetime DEFAULT NULL,
  `fk_user_author` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `fk_user_valid` int(11) DEFAULT NULL,
  `fk_user_cloture` int(11) DEFAULT NULL,
  `fk_statut` smallint(6) NOT NULL DEFAULT '0',
  `price` double DEFAULT '0',
  `remise_percent` double DEFAULT '0',
  `remise_absolue` double DEFAULT '0',
  `remise` double DEFAULT '0',
  `total_ht` double(24,8) DEFAULT '0.00000000',
  `tva` double(24,8) DEFAULT '0.00000000',
  `localtax1` double(24,8) DEFAULT '0.00000000',
  `localtax2` double(24,8) DEFAULT '0.00000000',
  `total` double(24,8) DEFAULT '0.00000000',
  `fk_account` int(11) DEFAULT NULL,
  `fk_currency` varchar(3) DEFAULT NULL,
  `fk_cond_reglement` int(11) DEFAULT NULL,
  `fk_mode_reglement` int(11) DEFAULT NULL,
  `note_private` text,
  `note_public` text,
  `model_pdf` varchar(255) DEFAULT NULL,
  `last_main_doc` varchar(255) DEFAULT NULL,
  `date_livraison` date DEFAULT NULL,
  `fk_shipping_method` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `extraparams` varchar(255) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_tx` double(24,8) DEFAULT '1.00000000',
  `multicurrency_total_ht` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_tva` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ttc` double(24,8) DEFAULT '0.00000000',
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_supplier_proposal_extrafields`
-- ----------------------------
DROP TABLE IF EXISTS `llx_supplier_proposal_extrafields`;
CREATE TABLE `llx_supplier_proposal_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_supplier_proposaldet`
-- ----------------------------
DROP TABLE IF EXISTS `llx_supplier_proposaldet`;
CREATE TABLE `llx_supplier_proposaldet` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_supplier_proposal` int(11) NOT NULL,
  `fk_parent_line` int(11) DEFAULT NULL,
  `fk_product` int(11) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` text,
  `fk_remise_except` int(11) DEFAULT NULL,
  `vat_src_code` varchar(10) DEFAULT '',
  `tva_tx` double(6,3) DEFAULT '0.000',
  `localtax1_tx` double(6,3) DEFAULT '0.000',
  `localtax1_type` varchar(10) DEFAULT NULL,
  `localtax2_tx` double(6,3) DEFAULT '0.000',
  `localtax2_type` varchar(10) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `remise_percent` double DEFAULT '0',
  `remise` double DEFAULT '0',
  `price` double DEFAULT NULL,
  `subprice` double(24,8) DEFAULT '0.00000000',
  `total_ht` double(24,8) DEFAULT '0.00000000',
  `total_tva` double(24,8) DEFAULT '0.00000000',
  `total_localtax1` double(24,8) DEFAULT '0.00000000',
  `total_localtax2` double(24,8) DEFAULT '0.00000000',
  `total_ttc` double(24,8) DEFAULT '0.00000000',
  `product_type` int(11) DEFAULT '0',
  `info_bits` int(11) DEFAULT '0',
  `buy_price_ht` double(24,8) DEFAULT '0.00000000',
  `fk_product_fournisseur_price` int(11) DEFAULT NULL,
  `special_code` int(11) DEFAULT '0',
  `rang` int(11) DEFAULT '0',
  `ref_fourn` varchar(30) DEFAULT NULL,
  `fk_multicurrency` int(11) DEFAULT NULL,
  `multicurrency_code` varchar(255) DEFAULT NULL,
  `multicurrency_subprice` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ht` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_tva` double(24,8) DEFAULT '0.00000000',
  `multicurrency_total_ttc` double(24,8) DEFAULT '0.00000000',
  `fk_unit` int(11) DEFAULT NULL,
  `date_start` datetime DEFAULT NULL,
  `date_end` datetime DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_supplier_proposaldet_fk_supplier_proposal` (`fk_supplier_proposal`),
  KEY `idx_supplier_proposaldet_fk_product` (`fk_product`),
  KEY `fk_supplier_proposaldet_fk_unit` (`fk_unit`),
  CONSTRAINT `fk_supplier_proposaldet_fk_supplier_proposal` FOREIGN KEY (`fk_supplier_proposal`) REFERENCES `llx_supplier_proposal` (`rowid`),
  CONSTRAINT `fk_supplier_proposaldet_fk_unit` FOREIGN KEY (`fk_unit`) REFERENCES `llx_c_units` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_supplier_proposaldet_extrafields`
-- ----------------------------
DROP TABLE IF EXISTS `llx_supplier_proposaldet_extrafields`;
CREATE TABLE `llx_supplier_proposaldet_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_takepos_floor_tables`
-- ----------------------------
DROP TABLE IF EXISTS `llx_takepos_floor_tables`;
CREATE TABLE `llx_takepos_floor_tables` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `label` varchar(255) DEFAULT NULL,
  `leftpos` float DEFAULT NULL,
  `toppos` float DEFAULT NULL,
  `floor` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_ticket`
-- ----------------------------
DROP TABLE IF EXISTS `llx_ticket`;
CREATE TABLE `llx_ticket` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) DEFAULT '1',
  `ref` varchar(128) NOT NULL,
  `track_id` varchar(128) NOT NULL,
  `fk_soc` int(11) DEFAULT '0',
  `fk_project` int(11) DEFAULT '0',
  `origin_email` varchar(128) DEFAULT NULL,
  `fk_user_create` int(11) DEFAULT NULL,
  `fk_user_assign` int(11) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text,
  `fk_statut` int(11) DEFAULT NULL,
  `resolution` int(11) DEFAULT NULL,
  `progress` varchar(100) DEFAULT NULL,
  `timing` varchar(20) DEFAULT NULL,
  `type_code` varchar(32) DEFAULT NULL,
  `category_code` varchar(32) DEFAULT NULL,
  `severity_code` varchar(32) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `date_read` datetime DEFAULT NULL,
  `date_close` datetime DEFAULT NULL,
  `notify_tiers_at_create` tinyint(4) DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `import_key` varchar(14) DEFAULT NULL,
  `email_msgid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_ticket_track_id` (`track_id`),
  UNIQUE KEY `uk_ticket_ref` (`ref`,`entity`),
  KEY `idx_ticket_entity` (`entity`),
  KEY `idx_ticket_fk_soc` (`fk_soc`),
  KEY `idx_ticket_fk_user_assign` (`fk_user_assign`),
  KEY `idx_ticket_fk_project` (`fk_project`),
  KEY `idx_ticket_fk_statut` (`fk_statut`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_ticket_extrafields`
-- ----------------------------
DROP TABLE IF EXISTS `llx_ticket_extrafields`;
CREATE TABLE `llx_ticket_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_ticket_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_tva`
-- ----------------------------
DROP TABLE IF EXISTS `llx_tva`;
CREATE TABLE `llx_tva` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datec` datetime DEFAULT NULL,
  `datep` date DEFAULT NULL,
  `datev` date DEFAULT NULL,
  `amount` double(24,8) NOT NULL DEFAULT '0.00000000',
  `fk_typepayment` int(11) DEFAULT NULL,
  `num_payment` varchar(50) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `note` text,
  `fk_bank` int(11) DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_user`
-- ----------------------------
DROP TABLE IF EXISTS `llx_user`;
CREATE TABLE `llx_user` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `ref_ext` varchar(50) DEFAULT NULL,
  `ref_int` varchar(50) DEFAULT NULL,
  `employee` tinyint(4) DEFAULT '1',
  `fk_establishment` int(11) DEFAULT '0',
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `login` varchar(50) NOT NULL,
  `pass_encoding` varchar(24) DEFAULT NULL,
  `pass` varchar(128) DEFAULT NULL,
  `pass_crypted` varchar(128) DEFAULT NULL,
  `pass_temp` varchar(128) DEFAULT NULL,
  `api_key` varchar(128) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `civility` varchar(6) DEFAULT NULL,
  `lastname` varchar(50) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `zip` varchar(25) DEFAULT NULL,
  `town` varchar(50) DEFAULT NULL,
  `fk_state` int(11) DEFAULT '0',
  `fk_country` int(11) DEFAULT '0',
  `birth` date DEFAULT NULL,
  `job` varchar(128) DEFAULT NULL,
  `office_phone` varchar(20) DEFAULT NULL,
  `office_fax` varchar(20) DEFAULT NULL,
  `user_mobile` varchar(20) DEFAULT NULL,
  `personal_mobile` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `personal_email` varchar(255) DEFAULT NULL,
  `socialnetworks` text,
  `signature` text,
  `admin` smallint(6) DEFAULT '0',
  `module_comm` smallint(6) DEFAULT '1',
  `module_compta` smallint(6) DEFAULT '1',
  `fk_soc` int(11) DEFAULT NULL,
  `fk_socpeople` int(11) DEFAULT NULL,
  `fk_member` int(11) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `fk_user_expense_validator` int(11) DEFAULT NULL,
  `fk_user_holiday_validator` int(11) DEFAULT NULL,
  `note_public` text,
  `note` text,
  `model_pdf` varchar(255) DEFAULT NULL,
  `datelastlogin` datetime DEFAULT NULL,
  `datepreviouslogin` datetime DEFAULT NULL,
  `egroupware_id` int(11) DEFAULT NULL,
  `ldap_sid` varchar(255) DEFAULT NULL,
  `openid` varchar(255) DEFAULT NULL,
  `statut` tinyint(4) DEFAULT '1',
  `photo` varchar(255) DEFAULT NULL,
  `lang` varchar(6) DEFAULT NULL,
  `color` varchar(6) DEFAULT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `fk_barcode_type` int(11) DEFAULT '0',
  `accountancy_code` varchar(32) DEFAULT NULL,
  `nb_holiday` int(11) DEFAULT '0',
  `thm` double(24,8) DEFAULT NULL,
  `tjm` double(24,8) DEFAULT NULL,
  `salary` double(24,8) DEFAULT NULL,
  `salaryextra` double(24,8) DEFAULT NULL,
  `dateemployment` date DEFAULT NULL,
  `dateemploymentend` date DEFAULT NULL,
  `weeklyhours` double(16,8) DEFAULT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  `default_range` int(11) DEFAULT NULL,
  `default_c_exp_tax_cat` int(11) DEFAULT NULL,
  `fk_warehouse` int(11) DEFAULT NULL,
  `iplastlogin` varchar(250) DEFAULT NULL,
  `ippreviouslogin` varchar(250) DEFAULT NULL,
  `datelastpassvalidation` datetime DEFAULT NULL,
  `datestartvalidity` datetime DEFAULT NULL,
  `dateendvalidity` datetime DEFAULT NULL,
  `idpers1` varchar(128) DEFAULT NULL,
  `idpers2` varchar(128) DEFAULT NULL,
  `idpers3` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_user_login` (`login`,`entity`),
  UNIQUE KEY `uk_user_fk_socpeople` (`fk_socpeople`),
  UNIQUE KEY `uk_user_fk_member` (`fk_member`),
  UNIQUE KEY `uk_user_api_key` (`api_key`),
  KEY `idx_user_fk_societe` (`fk_soc`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_user`
-- ----------------------------
BEGIN;
INSERT INTO `llx_user` VALUES ('1', '0', null, null, '1', '0', '2021-04-28 13:55:49', '2021-05-07 09:17:26', null, null, 'admin297', null, null, '$2y$10$Undsar632Gesz.X9L9vcp.PHV5YaKOLk8OgtFG6tVP8ikQcwIfXZa', null, null, null, '', 'Serboweb', 'Soporte', '', '', '', null, null, null, '', '', '', '', '', '', '', '[]', '', '1', '1', '1', null, null, null, null, null, null, '', '', null, '2021-05-08 04:13:53', '2021-05-07 14:06:11', null, '', null, '1', null, null, '', null, '0', '', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null), ('2', '1', null, null, '0', '0', '2021-05-06 15:44:45', '2021-05-06 10:44:45', null, null, 'felixplast', null, null, '$2y$10$LTW2r3lnaMzsnoTe6dZ99umA6a/Y0rcZ8Unmq91Z0yfuhXJjCwbuy', null, 'y947chdjk1', 'man', '', 'Fernández', 'Felix', '', '', '', null, null, null, '', '', '', '', '', 'fp@plast-yect.com', '', '[]', '', '0', '1', '1', null, null, null, null, null, null, '', '', null, '2021-05-06 15:45:25', null, null, '', null, '1', null, null, '', null, '0', '', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `llx_user_alert`
-- ----------------------------
DROP TABLE IF EXISTS `llx_user_alert`;
CREATE TABLE `llx_user_alert` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `fk_contact` int(11) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_user_clicktodial`
-- ----------------------------
DROP TABLE IF EXISTS `llx_user_clicktodial`;
CREATE TABLE `llx_user_clicktodial` (
  `fk_user` int(11) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `login` varchar(32) DEFAULT NULL,
  `pass` varchar(64) DEFAULT NULL,
  `poste` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`fk_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_user_employment`
-- ----------------------------
DROP TABLE IF EXISTS `llx_user_employment`;
CREATE TABLE `llx_user_employment` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `ref` varchar(50) DEFAULT NULL,
  `ref_ext` varchar(50) DEFAULT NULL,
  `fk_user` int(11) DEFAULT NULL,
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `job` varchar(128) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `salary` double(24,8) DEFAULT NULL,
  `salaryextra` double(24,8) DEFAULT NULL,
  `weeklyhours` double(16,8) DEFAULT NULL,
  `dateemployment` date DEFAULT NULL,
  `dateemploymentend` date DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_user_employment` (`ref`,`entity`),
  KEY `fk_user_employment_fk_user` (`fk_user`),
  CONSTRAINT `fk_user_employment_fk_user` FOREIGN KEY (`fk_user`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_user_extrafields`
-- ----------------------------
DROP TABLE IF EXISTS `llx_user_extrafields`;
CREATE TABLE `llx_user_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_user_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_user_param`
-- ----------------------------
DROP TABLE IF EXISTS `llx_user_param`;
CREATE TABLE `llx_user_param` (
  `fk_user` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `param` varchar(180) NOT NULL,
  `value` text NOT NULL,
  UNIQUE KEY `uk_user_param` (`fk_user`,`param`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_user_rib`
-- ----------------------------
DROP TABLE IF EXISTS `llx_user_rib`;
CREATE TABLE `llx_user_rib` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_user` int(11) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `label` varchar(30) DEFAULT NULL,
  `bank` varchar(255) DEFAULT NULL,
  `code_banque` varchar(128) DEFAULT NULL,
  `code_guichet` varchar(6) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `cle_rib` varchar(5) DEFAULT NULL,
  `bic` varchar(11) DEFAULT NULL,
  `iban_prefix` varchar(34) DEFAULT NULL,
  `domiciliation` varchar(255) DEFAULT NULL,
  `proprio` varchar(60) DEFAULT NULL,
  `owner_address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_user_rights`
-- ----------------------------
DROP TABLE IF EXISTS `llx_user_rights`;
CREATE TABLE `llx_user_rights` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `fk_user` int(11) NOT NULL,
  `fk_id` int(11) NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_user_rights` (`entity`,`fk_user`,`fk_id`),
  KEY `fk_user_rights_fk_user_user` (`fk_user`),
  CONSTRAINT `fk_user_rights_fk_user_user` FOREIGN KEY (`fk_user`) REFERENCES `llx_user` (`rowid`)
) ENGINE=InnoDB AUTO_INCREMENT=661 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `llx_user_rights`
-- ----------------------------
BEGIN;
INSERT INTO `llx_user_rights` VALUES ('324', '1', '1', '11'), ('318', '1', '1', '12'), ('319', '1', '1', '13'), ('320', '1', '1', '14'), ('321', '1', '1', '15'), ('323', '1', '1', '16'), ('325', '1', '1', '19'), ('137', '1', '1', '21'), ('130', '1', '1', '22'), ('131', '1', '1', '24'), ('132', '1', '1', '25'), ('134', '1', '1', '26'), ('136', '1', '1', '27'), ('138', '1', '1', '28'), ('33', '1', '1', '31'), ('30', '1', '1', '32'), ('32', '1', '1', '34'), ('34', '1', '1', '38'), ('224', '1', '1', '41'), ('221', '1', '1', '42'), ('223', '1', '1', '44'), ('225', '1', '1', '45'), ('293', '1', '1', '81'), ('288', '1', '1', '82'), ('289', '1', '1', '84'), ('290', '1', '1', '86'), ('291', '1', '1', '87'), ('292', '1', '1', '88'), ('294', '1', '1', '89'), ('166', '1', '1', '91'), ('163', '1', '1', '92'), ('165', '1', '1', '93'), ('167', '1', '1', '94'), ('207', '1', '1', '95'), ('56', '1', '1', '101'), ('52', '1', '1', '102'), ('53', '1', '1', '104'), ('54', '1', '1', '105'), ('55', '1', '1', '106'), ('57', '1', '1', '109'), ('195', '1', '1', '111'), ('186', '1', '1', '112'), ('188', '1', '1', '113'), ('190', '1', '1', '114'), ('192', '1', '1', '115'), ('194', '1', '1', '116'), ('196', '1', '1', '117'), ('387', '1', '1', '121'), ('384', '1', '1', '122'), ('386', '1', '1', '125'), ('388', '1', '1', '126'), ('229', '1', '1', '141'), ('228', '1', '1', '142'), ('230', '1', '1', '144'), ('202', '1', '1', '151'), ('199', '1', '1', '152'), ('201', '1', '1', '153'), ('203', '1', '1', '154'), ('148', '1', '1', '161'), ('141', '1', '1', '162'), ('143', '1', '1', '163'), ('145', '1', '1', '164'), ('147', '1', '1', '165'), ('149', '1', '1', '167'), ('246', '1', '1', '241'), ('245', '1', '1', '242'), ('247', '1', '1', '243'), ('417', '1', '1', '251'), ('398', '1', '1', '252'), ('400', '1', '1', '253'), ('401', '1', '1', '254'), ('403', '1', '1', '255'), ('405', '1', '1', '256'), ('389', '1', '1', '262'), ('395', '1', '1', '281'), ('392', '1', '1', '282'), ('394', '1', '1', '283'), ('396', '1', '1', '286'), ('277', '1', '1', '300'), ('278', '1', '1', '301'), ('251', '1', '1', '331'), ('250', '1', '1', '332'), ('252', '1', '1', '333'), ('406', '1', '1', '341'), ('407', '1', '1', '342'), ('408', '1', '1', '343'), ('409', '1', '1', '344'), ('415', '1', '1', '351'), ('412', '1', '1', '352'), ('414', '1', '1', '353'), ('416', '1', '1', '354'), ('418', '1', '1', '358'), ('380', '1', '1', '511'), ('375', '1', '1', '512'), ('377', '1', '1', '514'), ('379', '1', '1', '517'), ('381', '1', '1', '519'), ('182', '1', '1', '520'), ('177', '1', '1', '522'), ('179', '1', '1', '524'), ('181', '1', '1', '525'), ('183', '1', '1', '527'), ('40', '1', '1', '531'), ('37', '1', '1', '532'), ('39', '1', '1', '534'), ('41', '1', '1', '538'), ('424', '1', '1', '561'), ('421', '1', '1', '562'), ('423', '1', '1', '563'), ('425', '1', '1', '564'), ('429', '1', '1', '650'), ('428', '1', '1', '651'), ('430', '1', '1', '652'), ('434', '1', '1', '660'), ('433', '1', '1', '661'), ('435', '1', '1', '662'), ('314', '1', '1', '771'), ('303', '1', '1', '772'), ('305', '1', '1', '773'), ('307', '1', '1', '775'), ('309', '1', '1', '776'), ('311', '1', '1', '777'), ('313', '1', '1', '778'), ('315', '1', '1', '779'), ('45', '1', '1', '1001'), ('44', '1', '1', '1002'), ('46', '1', '1', '1003'), ('48', '1', '1', '1004'), ('49', '1', '1', '1005'), ('62', '1', '1', '1101'), ('60', '1', '1', '1102'), ('61', '1', '1', '1104'), ('63', '1', '1', '1109'), ('159', '1', '1', '1121'), ('152', '1', '1', '1122'), ('154', '1', '1', '1123'), ('156', '1', '1', '1124'), ('158', '1', '1', '1125'), ('160', '1', '1', '1126'), ('328', '1', '1', '1181'), ('342', '1', '1', '1182'), ('331', '1', '1', '1183'), ('332', '1', '1', '1184'), ('334', '1', '1', '1185'), ('336', '1', '1', '1186'), ('338', '1', '1', '1187'), ('341', '1', '1', '1188'), ('339', '1', '1', '1189'), ('343', '1', '1', '1191'), ('257', '1', '1', '1201'), ('258', '1', '1', '1202'), ('351', '1', '1', '1231'), ('346', '1', '1', '1232'), ('347', '1', '1', '1233'), ('349', '1', '1', '1234'), ('350', '1', '1', '1235'), ('352', '1', '1', '1236'), ('255', '1', '1', '1251'), ('326', '1', '1', '1321'), ('327', '1', '1', '1322'), ('295', '1', '1', '1421'), ('269', '1', '1', '2401'), ('268', '1', '1', '2402'), ('270', '1', '1', '2403'), ('274', '1', '1', '2411'), ('273', '1', '1', '2412'), ('275', '1', '1', '2413'), ('276', '1', '1', '2414'), ('299', '1', '1', '2501'), ('298', '1', '1', '2503'), ('300', '1', '1', '2515'), ('639', '1', '1', '3301'), ('364', '1', '1', '20001'), ('355', '1', '1', '20002'), ('357', '1', '1', '20003'), ('361', '1', '1', '20004'), ('363', '1', '1', '20005'), ('365', '1', '1', '20006'), ('359', '1', '1', '20007'), ('284', '1', '1', '23001'), ('281', '1', '1', '23002'), ('283', '1', '1', '23003'), ('285', '1', '1', '23004'), ('204', '1', '1', '59001'), ('205', '1', '1', '59002'), ('206', '1', '1', '59003'), ('371', '1', '1', '63001'), ('368', '1', '1', '63002'), ('370', '1', '1', '63003'), ('372', '1', '1', '63004'), ('659', '1', '1', '500000'), ('642', '1', '1', '500001'), ('644', '1', '1', '500002'), ('660', '1', '1', '500003'), ('437', '1', '2', '11'), ('438', '1', '2', '12'), ('439', '1', '2', '13'), ('440', '1', '2', '14'), ('441', '1', '2', '15'), ('442', '1', '2', '16'), ('443', '1', '2', '19'), ('444', '1', '2', '21'), ('445', '1', '2', '22'), ('446', '1', '2', '24'), ('447', '1', '2', '25'), ('448', '1', '2', '26'), ('449', '1', '2', '27'), ('450', '1', '2', '28'), ('451', '1', '2', '31'), ('452', '1', '2', '32'), ('453', '1', '2', '34'), ('454', '1', '2', '38'), ('455', '1', '2', '39'), ('456', '1', '2', '41'), ('457', '1', '2', '42'), ('458', '1', '2', '44'), ('459', '1', '2', '45'), ('460', '1', '2', '81'), ('461', '1', '2', '82'), ('462', '1', '2', '84'), ('463', '1', '2', '86'), ('464', '1', '2', '87'), ('465', '1', '2', '88'), ('466', '1', '2', '89'), ('467', '1', '2', '91'), ('468', '1', '2', '92'), ('469', '1', '2', '93'), ('470', '1', '2', '94'), ('471', '1', '2', '95'), ('472', '1', '2', '101'), ('473', '1', '2', '102'), ('474', '1', '2', '104'), ('475', '1', '2', '105'), ('476', '1', '2', '106'), ('477', '1', '2', '109'), ('478', '1', '2', '111'), ('479', '1', '2', '112'), ('480', '1', '2', '113'), ('481', '1', '2', '114'), ('482', '1', '2', '115'), ('483', '1', '2', '116'), ('484', '1', '2', '117'), ('485', '1', '2', '121'), ('486', '1', '2', '122'), ('487', '1', '2', '125'), ('488', '1', '2', '126'), ('489', '1', '2', '141'), ('490', '1', '2', '142'), ('491', '1', '2', '144'), ('492', '1', '2', '151'), ('493', '1', '2', '152'), ('494', '1', '2', '153'), ('495', '1', '2', '154'), ('496', '1', '2', '161'), ('497', '1', '2', '162'), ('498', '1', '2', '163'), ('499', '1', '2', '164'), ('500', '1', '2', '165'), ('501', '1', '2', '167'), ('502', '1', '2', '241'), ('503', '1', '2', '242'), ('504', '1', '2', '243'), ('625', '1', '2', '252'), ('627', '1', '2', '254'), ('511', '1', '2', '262'), ('512', '1', '2', '281'), ('513', '1', '2', '282'), ('514', '1', '2', '283'), ('515', '1', '2', '286'), ('516', '1', '2', '300'), ('517', '1', '2', '301'), ('518', '1', '2', '331'), ('519', '1', '2', '332'), ('520', '1', '2', '333'), ('630', '1', '2', '341'), ('631', '1', '2', '342'), ('632', '1', '2', '343'), ('633', '1', '2', '344'), ('634', '1', '2', '351'), ('635', '1', '2', '352'), ('636', '1', '2', '353'), ('637', '1', '2', '354'), ('530', '1', '2', '511'), ('531', '1', '2', '512'), ('532', '1', '2', '514'), ('533', '1', '2', '517'), ('534', '1', '2', '519'), ('535', '1', '2', '520'), ('536', '1', '2', '522'), ('537', '1', '2', '524'), ('538', '1', '2', '525'), ('539', '1', '2', '527'), ('540', '1', '2', '561'), ('541', '1', '2', '562'), ('542', '1', '2', '563'), ('543', '1', '2', '564'), ('544', '1', '2', '650'), ('545', '1', '2', '651'), ('546', '1', '2', '652'), ('547', '1', '2', '660'), ('548', '1', '2', '661'), ('549', '1', '2', '662'), ('550', '1', '2', '771'), ('551', '1', '2', '772'), ('552', '1', '2', '773'), ('553', '1', '2', '775'), ('554', '1', '2', '776'), ('555', '1', '2', '777'), ('556', '1', '2', '778'), ('557', '1', '2', '779'), ('558', '1', '2', '1001'), ('559', '1', '2', '1002'), ('560', '1', '2', '1003'), ('561', '1', '2', '1004'), ('562', '1', '2', '1005'), ('563', '1', '2', '1101'), ('564', '1', '2', '1102'), ('565', '1', '2', '1104'), ('566', '1', '2', '1109'), ('567', '1', '2', '1121'), ('568', '1', '2', '1122'), ('569', '1', '2', '1123'), ('570', '1', '2', '1124'), ('571', '1', '2', '1125'), ('572', '1', '2', '1126'), ('573', '1', '2', '1181'), ('574', '1', '2', '1182'), ('575', '1', '2', '1183'), ('576', '1', '2', '1184'), ('577', '1', '2', '1185'), ('578', '1', '2', '1186'), ('579', '1', '2', '1187'), ('580', '1', '2', '1188'), ('581', '1', '2', '1189'), ('582', '1', '2', '1191'), ('583', '1', '2', '1201'), ('584', '1', '2', '1202'), ('585', '1', '2', '1231'), ('586', '1', '2', '1232'), ('587', '1', '2', '1233'), ('588', '1', '2', '1234'), ('589', '1', '2', '1235'), ('590', '1', '2', '1236'), ('591', '1', '2', '1251'), ('592', '1', '2', '1321'), ('593', '1', '2', '1322'), ('594', '1', '2', '1421'), ('595', '1', '2', '2401'), ('596', '1', '2', '2402'), ('597', '1', '2', '2403'), ('598', '1', '2', '2411'), ('599', '1', '2', '2412'), ('600', '1', '2', '2413'), ('601', '1', '2', '2414'), ('602', '1', '2', '2501'), ('603', '1', '2', '2503'), ('604', '1', '2', '2515'), ('605', '1', '2', '20001'), ('606', '1', '2', '20002'), ('607', '1', '2', '20003'), ('608', '1', '2', '20004'), ('609', '1', '2', '20005'), ('610', '1', '2', '20006'), ('611', '1', '2', '20007'), ('612', '1', '2', '23001'), ('613', '1', '2', '23002'), ('614', '1', '2', '23003'), ('615', '1', '2', '23004'), ('616', '1', '2', '59001'), ('617', '1', '2', '59002'), ('618', '1', '2', '59003'), ('619', '1', '2', '63001'), ('620', '1', '2', '63002'), ('621', '1', '2', '63003'), ('622', '1', '2', '63004');
COMMIT;

-- ----------------------------
--  Table structure for `llx_usergroup`
-- ----------------------------
DROP TABLE IF EXISTS `llx_usergroup`;
CREATE TABLE `llx_usergroup` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(180) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `datec` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `note` text,
  `model_pdf` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_usergroup_name` (`nom`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_usergroup_extrafields`
-- ----------------------------
DROP TABLE IF EXISTS `llx_usergroup_extrafields`;
CREATE TABLE `llx_usergroup_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_usergroup_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_usergroup_rights`
-- ----------------------------
DROP TABLE IF EXISTS `llx_usergroup_rights`;
CREATE TABLE `llx_usergroup_rights` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `fk_usergroup` int(11) NOT NULL,
  `fk_id` int(11) NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_usergroup_rights` (`entity`,`fk_usergroup`,`fk_id`),
  KEY `fk_usergroup_rights_fk_usergroup` (`fk_usergroup`),
  CONSTRAINT `fk_usergroup_rights_fk_usergroup` FOREIGN KEY (`fk_usergroup`) REFERENCES `llx_usergroup` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_usergroup_user`
-- ----------------------------
DROP TABLE IF EXISTS `llx_usergroup_user`;
CREATE TABLE `llx_usergroup_user` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `fk_user` int(11) NOT NULL,
  `fk_usergroup` int(11) NOT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_usergroup_user` (`entity`,`fk_user`,`fk_usergroup`),
  KEY `fk_usergroup_user_fk_user` (`fk_user`),
  KEY `fk_usergroup_user_fk_usergroup` (`fk_usergroup`),
  CONSTRAINT `fk_usergroup_user_fk_user` FOREIGN KEY (`fk_user`) REFERENCES `llx_user` (`rowid`),
  CONSTRAINT `fk_usergroup_user_fk_usergroup` FOREIGN KEY (`fk_usergroup`) REFERENCES `llx_usergroup` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_website`
-- ----------------------------
DROP TABLE IF EXISTS `llx_website`;
CREATE TABLE `llx_website` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `type_container` varchar(16) NOT NULL DEFAULT 'page',
  `entity` int(11) NOT NULL DEFAULT '1',
  `ref` varchar(128) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `fk_default_home` int(11) DEFAULT NULL,
  `virtualhost` varchar(255) DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `import_key` varchar(14) DEFAULT NULL,
  `maincolor` varchar(16) DEFAULT NULL,
  `maincolorbis` varchar(16) DEFAULT NULL,
  `use_manifest` int(11) DEFAULT NULL,
  `lang` varchar(8) DEFAULT NULL,
  `otherlang` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT '0',
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_website_ref` (`ref`,`entity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_website_extrafields`
-- ----------------------------
DROP TABLE IF EXISTS `llx_website_extrafields`;
CREATE TABLE `llx_website_extrafields` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `fk_object` int(11) NOT NULL,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  KEY `idx_website_extrafields` (`fk_object`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_website_page`
-- ----------------------------
DROP TABLE IF EXISTS `llx_website_page`;
CREATE TABLE `llx_website_page` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `fk_website` int(11) NOT NULL,
  `type_container` varchar(16) NOT NULL DEFAULT 'page',
  `pageurl` varchar(255) NOT NULL,
  `aliasalt` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `keywords` varchar(255) DEFAULT NULL,
  `lang` varchar(6) DEFAULT NULL,
  `fk_page` int(11) DEFAULT NULL,
  `htmlheader` text,
  `content` mediumtext,
  `status` int(11) DEFAULT '1',
  `grabbed_from` varchar(255) DEFAULT NULL,
  `fk_user_creat` int(11) DEFAULT NULL,
  `fk_user_modif` int(11) DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `import_key` varchar(14) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `author_alias` varchar(64) DEFAULT NULL,
  `allowed_in_frames` int(11) DEFAULT '0',
  `object_type` varchar(255) DEFAULT NULL,
  `fk_object` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rowid`),
  UNIQUE KEY `uk_website_page_url` (`fk_website`,`pageurl`),
  CONSTRAINT `fk_website_page_website` FOREIGN KEY (`fk_website`) REFERENCES `llx_website` (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `llx_zapier_hook`
-- ----------------------------
DROP TABLE IF EXISTS `llx_zapier_hook`;
CREATE TABLE `llx_zapier_hook` (
  `rowid` int(11) NOT NULL AUTO_INCREMENT,
  `entity` int(11) NOT NULL DEFAULT '1',
  `url` varchar(255) DEFAULT NULL,
  `event` varchar(255) DEFAULT NULL,
  `module` varchar(128) DEFAULT NULL,
  `action` varchar(128) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `date_creation` datetime NOT NULL,
  `fk_user` int(11) NOT NULL,
  `tms` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `import_key` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`rowid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `tmp_llx_accouting_account`
-- ----------------------------
DROP TABLE IF EXISTS `tmp_llx_accouting_account`;
CREATE TABLE `tmp_llx_accouting_account` (
  `MINID` int(11) DEFAULT NULL,
  `MAXID` int(11) DEFAULT NULL,
  `account_number` varchar(32) NOT NULL,
  `entity` int(11) NOT NULL DEFAULT '1',
  `fk_pcg_version` varchar(32) NOT NULL,
  `NB` bigint(21) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;
