-- MySQL dump 10.14  Distrib 5.5.60-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: fes
-- ------------------------------------------------------
-- Server version	5.5.60-MariaDB

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
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `IdAdmin` varchar(30) NOT NULL,
  `Password` varchar(34) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Surname` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `IsRoot` tinyint(4) NOT NULL DEFAULT '0',
  `LastLogin` datetime DEFAULT NULL,
  `InsertIdAdmin` varchar(30) NOT NULL,
  `InsertDate` datetime NOT NULL,
  `LastModIdAdmin` varchar(30) DEFAULT NULL,
  `LastModDate` datetime DEFAULT NULL,
  PRIMARY KEY (`IdAdmin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admins_admins_categories`
--

DROP TABLE IF EXISTS `admins_admins_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins_admins_categories` (
  `IdAdmin` varchar(30) NOT NULL,
  `IdAdminCategory` int(10) unsigned NOT NULL,
  PRIMARY KEY (`IdAdmin`,`IdAdminCategory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admins_categories`
--

DROP TABLE IF EXISTS `admins_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins_categories` (
  `IdAdminCategory` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Title` varchar(200) NOT NULL,
  `FlagVisible` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`IdAdminCategory`),
  KEY `FlagVisible` (`FlagVisible`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admins_categories_modules`
--

DROP TABLE IF EXISTS `admins_categories_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins_categories_modules` (
  `IdAdminCategory` int(10) unsigned NOT NULL,
  `Module` varchar(50) NOT NULL,
  `Read` tinyint(1) unsigned NOT NULL,
  `New` tinyint(3) unsigned NOT NULL,
  `Edit` tinyint(3) unsigned NOT NULL,
  `Delete` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`IdAdminCategory`,`Module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admins_categories_tmp`
--

DROP TABLE IF EXISTS `admins_categories_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins_categories_tmp` (
  `IdAdmin` varchar(30) NOT NULL,
  `IdAdminCategory` int(10) unsigned NOT NULL,
  PRIMARY KEY (`IdAdmin`,`IdAdminCategory`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admins_log`
--

DROP TABLE IF EXISTS `admins_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins_log` (
  `IdLog` bigint(20) NOT NULL AUTO_INCREMENT,
  `IdAdmin` varchar(30) NOT NULL,
  `DateLog` datetime NOT NULL,
  `Module` varchar(255) DEFAULT NULL,
  `Action` varchar(50) DEFAULT NULL,
  `IdRecord` varchar(255) DEFAULT NULL,
  `Note` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IdLog`),
  KEY `IdAdmin` (`IdAdmin`,`DateLog`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admins_online`
--

DROP TABLE IF EXISTS `admins_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins_online` (
  `IdAdmin` varchar(30) NOT NULL,
  `IdSession` varchar(100) NOT NULL,
  `IPv4` varchar(20) NOT NULL,
  `LastAccess` datetime NOT NULL,
  PRIMARY KEY (`IdAdmin`,`IdSession`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `admins_permissions`
--

DROP TABLE IF EXISTS `admins_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins_permissions` (
  `IdAdmin` varchar(30) NOT NULL,
  `Module` varchar(50) NOT NULL,
  `Read` tinyint(1) NOT NULL,
  `New` tinyint(3) NOT NULL,
  `Edit` tinyint(3) NOT NULL,
  `Delete` tinyint(3) NOT NULL,
  PRIMARY KEY (`IdAdmin`,`Module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `anag_aliquote_iva`
--

DROP TABLE IF EXISTS `anag_aliquote_iva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anag_aliquote_iva` (
  `IdAliquotaIva` int(11) NOT NULL AUTO_INCREMENT,
  `Aliquota` decimal(5,2) NOT NULL,
  `FlagVisibile` tinyint(1) NOT NULL,
  PRIMARY KEY (`IdAliquotaIva`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `anag_aliquote_iva_full`
--

DROP TABLE IF EXISTS `anag_aliquote_iva_full`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anag_aliquote_iva_full` (
  `IdAliquotaIvaFull` int(11) NOT NULL AUTO_INCREMENT,
  `IdAliquotaIva` int(11) DEFAULT NULL,
  `NomeRichiamo` varchar(255) DEFAULT NULL,
  `Descrizione` varchar(255) DEFAULT NULL,
  `IdNatura` char(6) DEFAULT NULL,
  `FlagVisibile` tinyint(1) NOT NULL,
  PRIMARY KEY (`IdAliquotaIvaFull`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `anag_casse_previdenziali`
--

DROP TABLE IF EXISTS `anag_casse_previdenziali`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anag_casse_previdenziali` (
  `IdCassaPrevidenziale` char(4) NOT NULL,
  `Titolo` varchar(255) NOT NULL,
  `FlagVisibile` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`IdCassaPrevidenziale`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `anag_causali_pagamento`
--

DROP TABLE IF EXISTS `anag_causali_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anag_causali_pagamento` (
  `IdCausalePagamento` char(2) NOT NULL,
  `Titolo` varchar(255) NOT NULL,
  PRIMARY KEY (`IdCausalePagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `anag_cessioni_prestazioni`
--

DROP TABLE IF EXISTS `anag_cessioni_prestazioni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anag_cessioni_prestazioni` (
  `IdCessionePrestazione` char(2) NOT NULL,
  `Titolo` varchar(255) NOT NULL,
  PRIMARY KEY (`IdCessionePrestazione`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `anag_comuni`
--

DROP TABLE IF EXISTS `anag_comuni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anag_comuni` (
  `IdProvincia` char(3) NOT NULL,
  `IdComune` char(6) NOT NULL,
  `Comune` varchar(255) NOT NULL,
  `CodiceCatastale` char(4) NOT NULL,
  PRIMARY KEY (`IdComune`),
  KEY `Codice Provincia` (`IdProvincia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `anag_condizioni_pagamento`
--

DROP TABLE IF EXISTS `anag_condizioni_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anag_condizioni_pagamento` (
  `IdCondizionePagamento` char(4) NOT NULL,
  `Titolo` varchar(255) NOT NULL,
  PRIMARY KEY (`IdCondizionePagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `anag_esigibilita_iva`
--

DROP TABLE IF EXISTS `anag_esigibilita_iva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anag_esigibilita_iva` (
  `IdEsigibilitaIva` char(1) NOT NULL,
  `Titolo` varchar(255) NOT NULL,
  PRIMARY KEY (`IdEsigibilitaIva`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `anag_modalita_pagamento`
--

DROP TABLE IF EXISTS `anag_modalita_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anag_modalita_pagamento` (
  `IdModalitaPagamento` char(4) NOT NULL,
  `Titolo` varchar(255) NOT NULL,
  PRIMARY KEY (`IdModalitaPagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `anag_modalita_pagamento_full`
--

DROP TABLE IF EXISTS `anag_modalita_pagamento_full`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anag_modalita_pagamento_full` (
  `IdModalitaPagamentoFull` int(11) NOT NULL AUTO_INCREMENT,
  `IdModalitaPagamento` char(4) NOT NULL,
  `Titolo` varchar(255) NOT NULL,
  `TipoRateo` varchar(50) DEFAULT NULL,
  `FlagFineMese` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`IdModalitaPagamentoFull`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `anag_nature`
--

DROP TABLE IF EXISTS `anag_nature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anag_nature` (
  `IdNatura` char(6) NOT NULL,
  `Titolo` varchar(255) NOT NULL,
  `Deprecated` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`IdNatura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `anag_nazioni`
--

DROP TABLE IF EXISTS `anag_nazioni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anag_nazioni` (
  `IdNazione` char(2) NOT NULL,
  `CodISO3` char(3) NOT NULL,
  `CodIstat` char(3) NOT NULL,
  `Nazione` varchar(100) NOT NULL,
  `CodiceAT` char(4) NOT NULL,
  PRIMARY KEY (`IdNazione`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `anag_pec_settings`
--

DROP TABLE IF EXISTS `anag_pec_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anag_pec_settings` (
  `IdPecSetting` int(11) NOT NULL AUTO_INCREMENT,
  `Titolo` varchar(255) NOT NULL,
  `PECIMAPHost` varchar(50) NOT NULL,
  `PECIMAPPort` int(11) NOT NULL,
  `PECIMAPSsl` tinyint(1) NOT NULL,
  `PECSMTPHost` varchar(50) NOT NULL,
  `PECSMTPPort` int(11) NOT NULL,
  `PECSMTPSsl` tinyint(1) NOT NULL,
  `InsertIdAdmin` varchar(30) NOT NULL,
  `InsertDate` datetime NOT NULL,
  `LastModIdAdmin` varchar(30) DEFAULT NULL,
  `LastModDate` datetime DEFAULT NULL,
  PRIMARY KEY (`IdPecSetting`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `anag_profili_fiscali`
--

DROP TABLE IF EXISTS `anag_profili_fiscali`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anag_profili_fiscali` (
  `IdProfiloFiscale` int(11) NOT NULL AUTO_INCREMENT,
  `Titolo` varchar(255) NOT NULL,
  PRIMARY KEY (`IdProfiloFiscale`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `anag_province`
--

DROP TABLE IF EXISTS `anag_province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anag_province` (
  `IdProvincia` char(3) NOT NULL,
  `Provincia` varchar(100) NOT NULL,
  `Sigla` char(2) NOT NULL,
  PRIMARY KEY (`IdProvincia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `anag_regimi_fiscali`
--

DROP TABLE IF EXISTS `anag_regimi_fiscali`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anag_regimi_fiscali` (
  `IdRegimeFiscale` char(4) NOT NULL,
  `Titolo` varchar(255) NOT NULL,
  `FlagVisibile` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`IdRegimeFiscale`),
  KEY `FlagVisibile` (`FlagVisibile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `anag_ritenute`
--

DROP TABLE IF EXISTS `anag_ritenute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anag_ritenute` (
  `IdRitenuta` char(4) NOT NULL,
  `Titolo` varchar(255) NOT NULL,
  PRIMARY KEY (`IdRitenuta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `anag_tipi_documento`
--

DROP TABLE IF EXISTS `anag_tipi_documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anag_tipi_documento` (
  `IdTipoDocumento` char(4) NOT NULL,
  `Titolo` varchar(255) NOT NULL,
  PRIMARY KEY (`IdTipoDocumento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `anag_tipi_ritenute`
--

DROP TABLE IF EXISTS `anag_tipi_ritenute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anag_tipi_ritenute` (
  `IdTipoRitenuta` char(4) NOT NULL,
  `Titolo` varchar(255) NOT NULL,
  PRIMARY KEY (`IdTipoRitenuta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `anag_tipi_sconti_maggiorazioni`
--

DROP TABLE IF EXISTS `anag_tipi_sconti_maggiorazioni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anag_tipi_sconti_maggiorazioni` (
  `IdTipoScontoMaggiorazione` char(2) NOT NULL,
  `Titolo` varchar(255) NOT NULL,
  PRIMARY KEY (`IdTipoScontoMaggiorazione`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `anag_titoli`
--

DROP TABLE IF EXISTS `anag_titoli`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anag_titoli` (
  `IdTitolo` int(11) NOT NULL AUTO_INCREMENT,
  `Titolo` varchar(255) NOT NULL,
  `FlagVisibile` tinyint(1) NOT NULL,
  PRIMARY KEY (`IdTitolo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clienti`
--

DROP TABLE IF EXISTS `clienti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `clienti` (
  `IdCliente` int(11) NOT NULL AUTO_INCREMENT,
  `IdProfilo` int(11) NOT NULL,
  `IdProfiloFiscale` int(11) DEFAULT NULL,
  `PartitaIva` varchar(50) DEFAULT NULL,
  `CodiceFiscale` varchar(50) DEFAULT NULL,
  `RagioneSociale` varchar(255) NOT NULL,
  `Nome` varchar(100) DEFAULT NULL,
  `Cognome` varchar(100) DEFAULT NULL,
  `Indirizzo` varchar(255) DEFAULT NULL,
  `NumeroCivico` varchar(10) DEFAULT NULL,
  `CAP` varchar(10) DEFAULT NULL,
  `IdComune` char(6) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `EmailPEC` varchar(100) NOT NULL,
  `CodiceDestinatario` varchar(50) NOT NULL,
  `IdNazione` char(2) NOT NULL,
  `FlagDeleted` tinyint(1) DEFAULT NULL,
  `InsertIdUtente` int(11) NOT NULL,
  `InsertDate` datetime NOT NULL,
  `LastModIdUtente` int(11) DEFAULT NULL,
  `LastModDate` datetime DEFAULT NULL,
  PRIMARY KEY (`IdCliente`),
  KEY `IdProfilo` (`IdProfilo`)
) ENGINE=InnoDB AUTO_INCREMENT=9992 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `PercIva` int(11) DEFAULT NULL,
  `CostoAnnuale` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `counters`
--

DROP TABLE IF EXISTS `counters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `counters` (
  `File` int(11) NOT NULL,
  `FileLogo` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cron_imap_logs`
--

DROP TABLE IF EXISTS `cron_imap_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cron_imap_logs` (
  `IdCronLog` int(11) NOT NULL AUTO_INCREMENT,
  `IdProfilo` int(11) DEFAULT NULL,
  `DateCronStart` datetime NOT NULL,
  `DateCronEnd` datetime DEFAULT NULL,
  `CronExecutionTime` decimal(10,2) DEFAULT NULL,
  `Messaggio` text,
  PRIMARY KEY (`IdCronLog`),
  KEY `IdProfile` (`IdProfilo`)
) ENGINE=InnoDB AUTO_INCREMENT=22462841 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cron_imap_logs_rows`
--

DROP TABLE IF EXISTS `cron_imap_logs_rows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cron_imap_logs_rows` (
  `IdCronLogRow` bigint(20) NOT NULL AUTO_INCREMENT,
  `IdCronLog` int(11) NOT NULL,
  `IdProfilo` int(11) DEFAULT NULL,
  `MailSubject` varchar(255) NOT NULL,
  `MailDate` datetime DEFAULT NULL,
  `MailMessageId` varchar(100) NOT NULL,
  `MailUid` varchar(100) NOT NULL,
  `Esito` varchar(255) NOT NULL,
  `AttachedFile` longtext,
  `JsonErrors` text,
  `IdDocumento` int(11) DEFAULT NULL,
  `DateLog` datetime NOT NULL,
  PRIMARY KEY (`IdCronLogRow`),
  KEY `IdCronLog` (`IdCronLog`)
) ENGINE=InnoDB AUTO_INCREMENT=63904 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cron_imap_p7m_errors`
--

DROP TABLE IF EXISTS `cron_imap_p7m_errors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cron_imap_p7m_errors` (
  `IdProfilo` int(11) NOT NULL,
  `MailUid` varchar(100) NOT NULL,
  `NomeFile` varchar(100) NOT NULL,
  `NumTentativi` int(11) NOT NULL,
  `DataUltimoTentativo` datetime NOT NULL,
  PRIMARY KEY (`IdProfilo`,`MailUid`,`NomeFile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `documenti`
--

DROP TABLE IF EXISTS `documenti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documenti` (
  `IdDocumento` int(11) NOT NULL AUTO_INCREMENT,
  `IdProfilo` int(11) NOT NULL,
  `IdCliente` int(11) DEFAULT NULL,
  `TipoDocumento` enum('I','R') NOT NULL COMMENT 'I=Inviati;R=Ricevuti',
  `IdProfiloFiscale` int(11) DEFAULT NULL,
  `IdTipoDocumento` char(4) DEFAULT NULL,
  `NumeroDocumento` varchar(20) DEFAULT NULL,
  `NumeroDocumentoInserimentoManuale` tinyint(1) NOT NULL DEFAULT '0',
  `ProgressivoInvio` int(11) DEFAULT NULL,
  `DataDocumento` date DEFAULT NULL,
  `NumeroDocumentoInvio` varchar(20) DEFAULT NULL,
  `DataDocumentoInvio` date DEFAULT NULL,
  `Causale` text,
  `IdRitenuta` char(4) DEFAULT NULL,
  `ImportoRitenuta` decimal(15,2) DEFAULT NULL,
  `AliquotaRitenuta` decimal(5,2) DEFAULT NULL,
  `IdCondizionePagamento` char(4) DEFAULT NULL,
  `IdModalitaPagamento` char(4) DEFAULT NULL,
  `IdModalitaPagamentoFull` int(11) DEFAULT NULL,
  `DataScadenzaPagamento` date DEFAULT NULL,
  `IdProfiloIban` int(11) DEFAULT NULL,
  `FlagBollo` tinyint(1) DEFAULT NULL,
  `FlagBolloVirtuale` tinyint(1) DEFAULT NULL,
  `ImportoBollo` decimal(15,2) DEFAULT NULL,
  `ImportoScontoInFattura` decimal(15,2) DEFAULT NULL,
  `StatoDocumento` enum('B','I','E','C','A') DEFAULT NULL COMMENT 'B=Bozza;I=Inviato;E=Errore;C=Confermato;A=Annullato',
  `DataStatoDocumento` datetime DEFAULT NULL,
  `IdFiscaleIva` varchar(50) DEFAULT NULL,
  `Denominazione` varchar(255) DEFAULT NULL,
  `Nome` varchar(50) DEFAULT NULL,
  `Cognome` varchar(50) DEFAULT NULL,
  `TotaleRitenute` decimal(15,2) DEFAULT NULL,
  `TotaleCasse` decimal(15,2) DEFAULT NULL,
  `TotaleIva` decimal(15,2) DEFAULT NULL,
  `Totale` decimal(15,2) DEFAULT NULL,
  `DataInvio` datetime DEFAULT NULL,
  `IdFile` int(11) DEFAULT NULL,
  `NomeFile` varchar(100) DEFAULT NULL,
  `IdCronLogRow` int(11) DEFAULT NULL,
  `LastModDate` datetime DEFAULT NULL,
  `XmlFormat` text,
  `Descrizione` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`IdDocumento`),
  KEY `IdProfilo` (`IdProfilo`,`TipoDocumento`)
) ENGINE=InnoDB AUTO_INCREMENT=70697 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `documenti_contatori`
--

DROP TABLE IF EXISTS `documenti_contatori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documenti_contatori` (
  `IdProfilo` int(11) NOT NULL,
  `Progressivo` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`IdProfilo`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `documenti_numeri_contatori`
--

DROP TABLE IF EXISTS `documenti_numeri_contatori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documenti_numeri_contatori` (
  `IdProfilo` int(11) NOT NULL,
  `IdTipoDocumento` char(4) NOT NULL,
  `Anno` year(4) NOT NULL,
  `Contatore` varchar(50) NOT NULL,
  PRIMARY KEY (`IdProfilo`,`IdTipoDocumento`,`Anno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `documenti_servizi`
--

DROP TABLE IF EXISTS `documenti_servizi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documenti_servizi` (
  `IdDocumentoServizio` int(11) NOT NULL AUTO_INCREMENT,
  `IdDocumento` int(11) NOT NULL,
  `IdCessionePrestazione` char(2) DEFAULT NULL,
  `IdProfiloServizio` int(11) DEFAULT NULL,
  `Descrizione` text NOT NULL,
  `DescrizioneDettaglio` text,
  `Quantita` decimal(15,2) DEFAULT NULL,
  `UnitaMisura` varchar(10) DEFAULT NULL,
  `DataInizioPeriodo` date DEFAULT NULL,
  `DataFinePeriodo` date DEFAULT NULL,
  `PrezzoUnitario` decimal(15,2) DEFAULT NULL,
  `FlagScontoMaggiorazione` tinyint(1) NOT NULL DEFAULT '0',
  `IdTipoScontoMaggiorazione` char(2) DEFAULT NULL,
  `PercScontoMaggiorazione` decimal(5,2) DEFAULT NULL,
  `ImportoScontoMaggiorazione` decimal(15,2) DEFAULT NULL,
  `FlagScontoInFattura` tinyint(1) NOT NULL DEFAULT '0',
  `AltriDatiTipoDato` varchar(10) DEFAULT NULL,
  `AltriDatiTesto` varchar(60) DEFAULT NULL,
  `PrezzoTotale` decimal(15,2) DEFAULT NULL,
  `IdAliquotaIva` int(11) DEFAULT NULL,
  `IdAliquotaIvaFull` int(11) DEFAULT NULL,
  `FlagCassa` tinyint(1) DEFAULT NULL,
  `FlagRitenuta` tinyint(1) DEFAULT NULL,
  `IdNatura` char(6) DEFAULT NULL,
  `IdEsigibilitaIva` char(1) DEFAULT NULL,
  `RiferimentoAmministrazione` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`IdDocumentoServizio`),
  KEY `IdDocumento` (`IdDocumento`)
) ENGINE=InnoDB AUTO_INCREMENT=101691 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `documenti_servizi_tmp`
--

DROP TABLE IF EXISTS `documenti_servizi_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documenti_servizi_tmp` (
  `IdDocumentoServizioTmp` int(11) NOT NULL AUTO_INCREMENT,
  `IdUtente` int(11) NOT NULL,
  `IdCessionePrestazione` char(2) DEFAULT NULL,
  `IdProfiloServizio` int(11) DEFAULT NULL,
  `Descrizione` text NOT NULL,
  `DescrizioneDettaglio` text,
  `Quantita` decimal(15,2) DEFAULT NULL,
  `UnitaMisura` varchar(10) DEFAULT NULL,
  `DataInizioPeriodo` date DEFAULT NULL,
  `DataFinePeriodo` date DEFAULT NULL,
  `PrezzoUnitario` decimal(15,2) DEFAULT NULL,
  `FlagScontoMaggiorazione` tinyint(1) NOT NULL DEFAULT '0',
  `IdTipoScontoMaggiorazione` char(2) DEFAULT NULL,
  `PercScontoMaggiorazione` decimal(5,2) DEFAULT NULL,
  `ImportoScontoMaggiorazione` decimal(15,2) DEFAULT NULL,
  `FlagScontoInFattura` tinyint(1) NOT NULL DEFAULT '0',
  `AltriDatiTipoDato` varchar(10) DEFAULT NULL,
  `AltriDatiTesto` varchar(60) DEFAULT NULL,
  `PrezzoTotale` decimal(15,2) DEFAULT NULL,
  `IdAliquotaIva` int(11) DEFAULT NULL,
  `IdAliquotaIvaFull` int(11) DEFAULT NULL,
  `FlagCassa` tinyint(1) DEFAULT NULL,
  `FlagRitenuta` tinyint(1) DEFAULT NULL,
  `IdNatura` char(6) DEFAULT NULL,
  `IdEsigibilitaIva` char(1) DEFAULT NULL,
  `RiferimentoAmministrazione` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`IdDocumentoServizioTmp`),
  KEY `IdDocumento` (`IdUtente`)
) ENGINE=InnoDB AUTO_INCREMENT=334341 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `import_temp_data`
--

DROP TABLE IF EXISTS `import_temp_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `import_temp_data` (
  `IdImport` int(11) NOT NULL AUTO_INCREMENT,
  `IdUtente` bigint(20) NOT NULL,
  `RawData` text NOT NULL,
  `FlagProcessed` tinyint(1) NOT NULL,
  `FlagError` tinyint(1) NOT NULL,
  `ErrorCode` int(11) DEFAULT NULL,
  `Note` text,
  PRIMARY KEY (`IdImport`),
  KEY `IdAdmin` (`IdUtente`)
) ENGINE=MyISAM AUTO_INCREMENT=31177 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `import_temp_data_headers`
--

DROP TABLE IF EXISTS `import_temp_data_headers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `import_temp_data_headers` (
  `IdUtente` int(11) NOT NULL,
  `Colonna` varchar(255) NOT NULL,
  `NumColonnaCSV` int(11) DEFAULT NULL,
  PRIMARY KEY (`IdUtente`,`Colonna`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language` (
  `LangCode` char(2) NOT NULL DEFAULT '',
  `LocalCode` varchar(10) NOT NULL DEFAULT '',
  `Title` varchar(100) NOT NULL,
  `FlagActive` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`LangCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mime_types`
--

DROP TABLE IF EXISTS `mime_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mime_types` (
  `Extension` varchar(10) NOT NULL,
  `MimeType` varchar(255) NOT NULL,
  `FlagImage` tinyint(1) NOT NULL,
  `FlagForceInline` tinyint(1) NOT NULL,
  PRIMARY KEY (`Extension`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ordini`
--

DROP TABLE IF EXISTS `ordini`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordini` (
  `IdOrdine` int(11) NOT NULL AUTO_INCREMENT,
  `IdUtente` int(11) NOT NULL,
  `IdMetodoPagamento` enum('BB','PP') NOT NULL,
  `IdProfilo` int(11) DEFAULT NULL,
  `DataOrdine` datetime NOT NULL,
  `IdStato` enum('B','A','C','P') NOT NULL COMMENT 'B=Bozza;A=Attesa pagamento;C=Cancellata;P=Pagata',
  `TotaleNetto` decimal(10,2) NOT NULL,
  `TotaleIva` decimal(10,2) NOT NULL,
  `Totale` decimal(10,2) NOT NULL,
  `PaypalID` varchar(255) DEFAULT NULL,
  `PaypalToken` varchar(255) DEFAULT NULL,
  `DataPagamento` datetime DEFAULT NULL,
  `LastModIdAdmin` varchar(30) DEFAULT NULL,
  `LastModDate` datetime DEFAULT NULL,
  PRIMARY KEY (`IdOrdine`),
  KEY `IdStato` (`IdStato`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ordini_logs`
--

DROP TABLE IF EXISTS `ordini_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordini_logs` (
  `IdOrdineLog` int(11) NOT NULL AUTO_INCREMENT,
  `IdOrdine` int(11) NOT NULL,
  `DataLog` datetime NOT NULL,
  `Message` text,
  `PaypalResponse` text,
  PRIMARY KEY (`IdOrdineLog`),
  KEY `IdOrdine` (`IdOrdine`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `profili`
--

DROP TABLE IF EXISTS `profili`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profili` (
  `IdProfilo` int(11) NOT NULL AUTO_INCREMENT,
  `IdFileLogo` varchar(50) DEFAULT NULL,
  `LogoAlign` enum('left','center','right') NOT NULL DEFAULT 'left',
  `LogoHeight` int(11) NOT NULL DEFAULT '150',
  `Nome` varchar(50) DEFAULT NULL,
  `Cognome` varchar(50) DEFAULT NULL,
  `IdTitolo` int(11) DEFAULT NULL,
  `EmailPEC` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `CodiceFiscale` char(16) DEFAULT NULL,
  `PartitaIva` char(11) DEFAULT NULL,
  `Denominazione` varchar(255) DEFAULT NULL,
  `IdProfiloFiscale` int(11) DEFAULT NULL,
  `IdRegimeFiscale` char(4) DEFAULT NULL,
  `FlagRitenuta` tinyint(1) DEFAULT NULL,
  `IdTipoRitenuta` char(4) DEFAULT NULL,
  `AliquotaRitenuta` decimal(5,2) DEFAULT NULL,
  `IdCausalePagamento` char(2) DEFAULT NULL,
  `Indirizzo` varchar(255) DEFAULT NULL,
  `NumeroCivico` varchar(10) DEFAULT NULL,
  `CAP` char(5) DEFAULT NULL,
  `IdComune` char(6) DEFAULT NULL,
  `PECIMAPHost` varchar(50) DEFAULT NULL,
  `PECIMAPPort` int(11) DEFAULT NULL,
  `PECIMAPSsl` tinyint(1) DEFAULT NULL,
  `PECSMTPHost` varchar(50) DEFAULT NULL,
  `PECSMTPPort` int(11) DEFAULT NULL,
  `PECSMTPSsl` tinyint(1) DEFAULT NULL,
  `PECUsername` varchar(100) DEFAULT NULL,
  `PECPassword` varchar(255) DEFAULT NULL,
  `EmailSDI` varchar(100) DEFAULT 'sdi01@pec.fatturapa.it',
  `DataScadenza` date DEFAULT NULL,
  `FlagLetturaInCorso` tinyint(1) DEFAULT NULL,
  `DataLetturaInCorso` datetime DEFAULT NULL,
  `DataUltimaLettura` datetime DEFAULT NULL,
  `IdCronLogError` int(11) DEFAULT NULL,
  `IdUtenteLastMod` int(11) DEFAULT NULL,
  `LastModDate` datetime DEFAULT NULL,
  PRIMARY KEY (`IdProfilo`),
  KEY `DataScadenza_FlagLetturaInCorso_DataLetturaInCorso` (`DataScadenza`,`FlagLetturaInCorso`,`DataLetturaInCorso`)
) ENGINE=InnoDB AUTO_INCREMENT=1420 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `profili_casse_previdenziali`
--

DROP TABLE IF EXISTS `profili_casse_previdenziali`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profili_casse_previdenziali` (
  `IdProfiloCassaPrevidenziale` int(11) NOT NULL AUTO_INCREMENT,
  `IdProfilo` int(11) NOT NULL,
  `IdCassaPrevidenziale` char(4) NOT NULL,
  `Aliquota` decimal(5,2) DEFAULT NULL,
  `IdAliquotaIva` int(11) DEFAULT NULL,
  `FlagRitenuta` tinyint(1) NOT NULL DEFAULT '0',
  `IdNatura` char(6) DEFAULT NULL,
  PRIMARY KEY (`IdProfiloCassaPrevidenziale`),
  KEY `IdProfilo` (`IdProfilo`)
) ENGINE=InnoDB AUTO_INCREMENT=455 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `profili_casse_previdenziali_tmp`
--

DROP TABLE IF EXISTS `profili_casse_previdenziali_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profili_casse_previdenziali_tmp` (
  `IdProfiloCassaPrevidenzialeTmp` int(11) NOT NULL AUTO_INCREMENT,
  `IdUtente` int(11) NOT NULL,
  `IdCassaPrevidenziale` char(4) NOT NULL,
  `Aliquota` decimal(5,2) DEFAULT NULL,
  `IdAliquotaIva` int(11) DEFAULT NULL,
  `FlagRitenuta` tinyint(1) NOT NULL DEFAULT '0',
  `IdNatura` char(6) DEFAULT NULL,
  PRIMARY KEY (`IdProfiloCassaPrevidenzialeTmp`),
  KEY `IdProfilo` (`IdUtente`)
) ENGINE=InnoDB AUTO_INCREMENT=1135 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `profili_codici_servizi`
--

DROP TABLE IF EXISTS `profili_codici_servizi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profili_codici_servizi` (
  `IdProfiloServizio` int(11) NOT NULL AUTO_INCREMENT,
  `IdProfilo` int(11) NOT NULL,
  `Codice` varchar(10) NOT NULL,
  `Descrizione` text NOT NULL,
  PRIMARY KEY (`IdProfiloServizio`),
  KEY `IdProfilo` (`IdProfilo`)
) ENGINE=InnoDB AUTO_INCREMENT=1791 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `profili_device`
--

DROP TABLE IF EXISTS `profili_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profili_device` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idProfilo` int(11) DEFAULT NULL,
  `Imei` varchar(100) DEFAULT NULL,
  `FBToken` varchar(200) DEFAULT NULL,
  `UltimaModifica` datetime DEFAULT NULL,
  `idUltimoDocRicevuto` int(11) DEFAULT '1',
  KEY `profili_device_id_IDX` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `profili_iban`
--

DROP TABLE IF EXISTS `profili_iban`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profili_iban` (
  `IdProfiloIban` int(11) NOT NULL AUTO_INCREMENT,
  `IdProfilo` int(11) NOT NULL,
  `IstitutoFinanziario` varchar(255) NOT NULL,
  `IBAN` varchar(34) NOT NULL,
  `BIC` varchar(11) NOT NULL,
  PRIMARY KEY (`IdProfiloIban`),
  KEY `IdProfilo` (`IdProfilo`)
) ENGINE=InnoDB AUTO_INCREMENT=1457 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `profili_iban_tmp`
--

DROP TABLE IF EXISTS `profili_iban_tmp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profili_iban_tmp` (
  `IdProfiloIbanTmp` int(11) NOT NULL AUTO_INCREMENT,
  `IdUtente` int(11) NOT NULL,
  `IstitutoFinanziario` varchar(255) NOT NULL,
  `IBAN` varchar(34) NOT NULL,
  `BIC` varchar(11) NOT NULL,
  PRIMARY KEY (`IdProfiloIbanTmp`),
  KEY `IdProfilo` (`IdUtente`)
) ENGINE=InnoDB AUTO_INCREMENT=3893 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `records_lock`
--

DROP TABLE IF EXISTS `records_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `records_lock` (
  `TableName` varchar(255) NOT NULL,
  `IdValue` varchar(50) NOT NULL,
  `IdAdmin` varchar(30) NOT NULL,
  `LockDate` datetime NOT NULL,
  PRIMARY KEY (`TableName`,`IdValue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `utenti`
--

DROP TABLE IF EXISTS `utenti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utenti` (
  `IdUtente` int(11) NOT NULL AUTO_INCREMENT,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(34) NOT NULL,
  `Nome` varchar(50) NOT NULL DEFAULT '',
  `Cognome` varchar(50) NOT NULL DEFAULT '',
  `Indirizzo` varchar(255) DEFAULT NULL,
  `CAP` varchar(10) DEFAULT NULL,
  `IdComune` char(6) DEFAULT NULL,
  `Telefono` varchar(50) DEFAULT NULL,
  `Denominazione` varchar(200) DEFAULT NULL,
  `CodiceFiscale` char(16) DEFAULT NULL,
  `PartitaIva` char(11) DEFAULT NULL,
  `FlagBonusIdProfilo` int(11) DEFAULT NULL,
  `FlagBonusIdOrdine` int(11) DEFAULT NULL,
  `FlagEmailOfferte` tinyint(1) DEFAULT NULL,
  `FlagEmailSondaggi` tinyint(1) DEFAULT NULL,
  `DataUltimaVisita` datetime DEFAULT NULL,
  `IdentityId` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IdUtente`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=1417 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `utenti_bkp`
--

DROP TABLE IF EXISTS `utenti_bkp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utenti_bkp` (
  `IdUtente` int(11) NOT NULL AUTO_INCREMENT,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(34) NOT NULL,
  `Nome` varchar(50) NOT NULL DEFAULT '',
  `Cognome` varchar(50) NOT NULL DEFAULT '',
  `Indirizzo` varchar(255) DEFAULT NULL,
  `CAP` varchar(10) DEFAULT NULL,
  `IdComune` char(6) DEFAULT NULL,
  `Telefono` varchar(50) DEFAULT NULL,
  `Denominazione` varchar(200) DEFAULT NULL,
  `CodiceFiscale` char(16) DEFAULT NULL,
  `PartitaIva` char(11) DEFAULT NULL,
  `FlagBonusIdProfilo` int(11) DEFAULT NULL,
  `FlagBonusIdOrdine` int(11) DEFAULT NULL,
  `FlagEmailOfferte` tinyint(1) DEFAULT NULL,
  `FlagEmailSondaggi` tinyint(1) DEFAULT NULL,
  `DataUltimaVisita` datetime DEFAULT NULL,
  `IdentityId` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`IdUtente`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=1386 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `utenti_profili`
--

DROP TABLE IF EXISTS `utenti_profili`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utenti_profili` (
  `IdUtente` int(11) NOT NULL,
  `IdProfilo` int(11) NOT NULL,
  `FlagProprietario` tinyint(1) NOT NULL DEFAULT '0',
  `FlagRequest` tinyint(1) DEFAULT NULL,
  `DateRequest` datetime DEFAULT NULL,
  PRIMARY KEY (`IdUtente`,`IdProfilo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `utenti_recupero_password`
--

DROP TABLE IF EXISTS `utenti_recupero_password`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utenti_recupero_password` (
  `IdUtente` int(11) NOT NULL,
  `CodiceSblocco` varchar(20) NOT NULL,
  `DataRichiesta` datetime NOT NULL,
  PRIMARY KEY (`IdUtente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-23 15:43:11
