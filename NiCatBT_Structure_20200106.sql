-- MySQL dump 10.13  Distrib 8.0.17, for macos10.14 (x86_64)
--
-- Host: localhost    Database: NiCatBT
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `CASHFLOW`
--

DROP TABLE IF EXISTS `CASHFLOW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CASHFLOW` (
  `TRADEDATE` date NOT NULL COMMENT '交易日期',
  `INCOME` decimal(18,0) NOT NULL DEFAULT '0' COMMENT '收入',
  `EXPENSES` decimal(18,0) NOT NULL DEFAULT '0' COMMENT '支出',
  `BALANCE` decimal(18,0) NOT NULL DEFAULT '0' COMMENT '餘額',
  PRIMARY KEY (`TRADEDATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='現金流資料檔';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `COMMODITY`
--

DROP TABLE IF EXISTS `COMMODITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMMODITY` (
  `ID` varchar(12) NOT NULL DEFAULT '' COMMENT '商品代碼',
  `NAME` varchar(20) NOT NULL DEFAULT '' COMMENT '商品名稱',
  `STYLE` varchar(10) NOT NULL DEFAULT '' COMMENT '樣式',
  `NATIONID` varchar(3) NOT NULL DEFAULT '' COMMENT '國家代碼',
  `SUPPLIERID` varchar(20) NOT NULL DEFAULT '' COMMENT '供應商代碼',
  `SUPPLIER_PRODUCTNO` varchar(20) NOT NULL DEFAULT '' COMMENT '供應商商品代碼',
  `WHOLESALE_PRICE` decimal(18,0) NOT NULL DEFAULT '0' COMMENT '批發價格',
  `RETAIL_PRICE` decimal(18,0) NOT NULL DEFAULT '0' COMMENT '零售價格',
  `REMARK` varchar(50) DEFAULT NULL COMMENT '備註',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品基本資料檔';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `COMMODITYMAST`
--

DROP TABLE IF EXISTS `COMMODITYMAST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMMODITYMAST` (
  `TRADEDATE` date NOT NULL COMMENT '交易日期',
  `COMMODITYID` varchar(12) NOT NULL DEFAULT '' COMMENT '商品代碼',
  `QUANTITY` decimal(18,0) NOT NULL DEFAULT '0' COMMENT '數量',
  PRIMARY KEY (`TRADEDATE`,`COMMODITYID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品庫存資料檔';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `DELIVERYTYPE`
--

DROP TABLE IF EXISTS `DELIVERYTYPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DELIVERYTYPE` (
  `ID` varchar(20) NOT NULL DEFAULT '' COMMENT '配送代碼',
  `NAME` varchar(20) NOT NULL DEFAULT '' COMMENT '配送名稱',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配送基本資料檔';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `NATION`
--

DROP TABLE IF EXISTS `NATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `NATION` (
  `ID` varchar(3) NOT NULL DEFAULT '' COMMENT '國家代碼',
  `NAME` varchar(10) NOT NULL DEFAULT '' COMMENT '國家名稱',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='國家基本資料檔';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ORDER`
--

DROP TABLE IF EXISTS `ORDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ORDER` (
  `TRANSNO` varchar(12) NOT NULL DEFAULT '' COMMENT '交易代碼',
  `TRADEDATE` date NOT NULL COMMENT '交易日期',
  `COMMODITYID` varchar(12) NOT NULL DEFAULT '' COMMENT '商品代碼',
  `TRADEQUANTITY` decimal(18,0) NOT NULL DEFAULT '0' COMMENT '交易數量',
  `TRADEAMOUNT` decimal(18,0) NOT NULL DEFAULT '0' COMMENT '交易金額',
  `RECEIPTNO` varchar(12) DEFAULT NULL COMMENT '收貨代碼',
  `PURCHASENO` varchar(12) DEFAULT NULL COMMENT '採購代碼',
  `REMARK` varchar(50) DEFAULT NULL COMMENT '備註',
  PRIMARY KEY (`TRANSNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='批發下單資料檔';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `PURCHASE`
--

DROP TABLE IF EXISTS `PURCHASE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PURCHASE` (
  `TRANSNO` varchar(12) NOT NULL DEFAULT '' COMMENT '交易代碼',
  `TRADEDATE` date NOT NULL COMMENT '交易日期',
  `FEE` decimal(18,0) NOT NULL DEFAULT '0' COMMENT '費用',
  `REMARK` varchar(50) DEFAULT NULL COMMENT '備註',
  PRIMARY KEY (`TRANSNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='批發採購交易資料檔';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RECEIPT`
--

DROP TABLE IF EXISTS `RECEIPT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RECEIPT` (
  `TRANSNO` varchar(12) NOT NULL DEFAULT '' COMMENT '交易代碼',
  `TRADEDATE` date NOT NULL COMMENT '交易日期',
  `TRADEAMOUNT` decimal(18,0) NOT NULL DEFAULT '0' COMMENT '交易金額',
  `REMARK` varchar(50) DEFAULT NULL COMMENT '備註',
  PRIMARY KEY (`TRANSNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='批發收貨交易資料檔';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SHIPPER`
--

DROP TABLE IF EXISTS `SHIPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SHIPPER` (
  `TRANSNO` varchar(12) NOT NULL DEFAULT '' COMMENT '交易代碼',
  `TRADEDATE` date NOT NULL COMMENT '交易日期',
  `BUYER` varchar(20) NOT NULL DEFAULT '' COMMENT '買家',
  `TRADEAMOUNT` decimal(18,0) NOT NULL DEFAULT '0' COMMENT '交易金額',
  `FEE` decimal(18,0) NOT NULL DEFAULT '0' COMMENT '費用',
  `DELIVERY` varchar(20) DEFAULT '0' COMMENT '配送',
  `REMARK` varchar(50) DEFAULT NULL COMMENT '備註',
  PRIMARY KEY (`TRANSNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='批發交易資料檔';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `SUPPLIER`
--

DROP TABLE IF EXISTS `SUPPLIER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SUPPLIER` (
  `ID` varchar(20) NOT NULL DEFAULT '' COMMENT '供應商代碼',
  `NAME` varchar(20) NOT NULL DEFAULT '' COMMENT '供應商名稱',
  `NATIONID` varchar(3) NOT NULL DEFAULT '' COMMENT '國家代碼',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='供應商基本資料檔';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `TRADING`
--

DROP TABLE IF EXISTS `TRADING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TRADING` (
  `TRANSNO` varchar(12) NOT NULL DEFAULT '' COMMENT '交易代碼',
  `TRADEDATE` date NOT NULL COMMENT '交易日期',
  `BUYER` varchar(20) NOT NULL DEFAULT '' COMMENT '買家',
  `COMMODITYID` varchar(12) NOT NULL DEFAULT '' COMMENT '商品代碼',
  `TRADEQUANTITY` decimal(18,0) NOT NULL DEFAULT '0' COMMENT '交易數量',
  `TRADEAMOUNT` decimal(18,0) NOT NULL DEFAULT '0' COMMENT '交易金額',
  `SHIPPERNO` varchar(12) DEFAULT '0' COMMENT '出貨代碼',
  `REMARK` varchar(50) DEFAULT NULL COMMENT '備註',
  PRIMARY KEY (`TRANSNO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='交易資料檔';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping routines for database 'NiCatBT'
--
/*!50003 DROP FUNCTION IF EXISTS `FN_GET_NEW_ID_COMMODITY` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_GET_NEW_ID_COMMODITY`() RETURNS varchar(12) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	DECLARE v_FORMATE VARCHAR(12) DEFAULT concat('C',date_format(curdate(), '%Y%m%d'));
    DECLARE v_Count DECIMAL(3,0) DEFAULT 1;
	DECLARE v_NewNo DECIMAL(3,0) DEFAULT 1;
	DECLARE v_MaxID VARCHAR(12) DEFAULT '';
	-- 筆數
		SELECT COUNT(*) INTO v_Count
			FROM COMMODITY WHERE ID like v_FORMATE;
	-- 	取得最大ID
		SELECT ID INTO v_MaxID 
			FROM COMMODITY WHERE ID like v_FORMATE ORDER BY ID DESC LIMIT 1;
		
        IF(v_Count > 0) THEN
			SET v_NewNo = (CAST(SUBSTRING(v_MaxID,LENGTH(v_MaxID)-2) AS DECIMAL(3,0)) + 1);
        END IF;

	--	CyyyyMMdd000
	RETURN CONCAT(v_FORMATE, LPAD(v_NewNo, 3, '0'));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FN_GET_NEW_TRANSNO_ORDER` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_GET_NEW_TRANSNO_ORDER`(i_TRADEDATE DATE) RETURNS varchar(12) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	DECLARE v_Count DECIMAL(3,0) DEFAULT 0;
	DECLARE v_NewNo DECIMAL(3,0) DEFAULT 1;
	DECLARE v_MaxTransNo VARCHAR(12) DEFAULT '';
	
--	計算筆數
	SELECT COUNT(*) INTO v_Count 
		FROM `ORDER` WHERE TRADEDATE = i_TRADEDATE;
	
	IF(v_Count > 0) THEN
	-- 	取得最大TransNo
		SELECT TRANSNO INTO v_MaxTransNo 
			FROM `ORDER` WHERE TRADEDATE = i_TRADEDATE ORDER BY TRANSNO DESC LIMIT 1;
		
		IF ISNULL(v_MaxTransNo) = 0 THEN
			SET v_NewNo = (CAST(SUBSTRING(v_MaxTransNo,LENGTH(v_MaxTransNo)-2) AS DECIMAL(3,0)) + 1);
		END IF;
	END IF;

--	0yyyyMMdd000
RETURN CONCAT('0', DATE_FORMAT(i_TRADEDATE,'%Y%m%d'), LPAD(v_NewNo, 3, '0'));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FN_GET_NEW_TRANSNO_PURCHASE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_GET_NEW_TRANSNO_PURCHASE`(i_TRADEDATE DATE) RETURNS varchar(12) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	DECLARE v_Count DECIMAL(3,0) DEFAULT 0;
	DECLARE v_NewNo DECIMAL(3,0) DEFAULT 1;
	DECLARE v_MaxTransNo VARCHAR(12) DEFAULT '';
	
--	計算筆數
	SELECT COUNT(*) INTO v_Count 
		FROM `PURCHASE` WHERE TRADEDATE = i_TRADEDATE;
	
	IF(v_Count > 0) THEN
	-- 	取得最大TransNo
		SELECT TRANSNO INTO v_MaxTransNo 
			FROM `PURCHASE` WHERE TRADEDATE = i_TRADEDATE ORDER BY TRANSNO DESC LIMIT 1;
		
		IF ISNULL(v_MaxTransNo) = 0 THEN
			SET v_NewNo = (CAST(SUBSTRING(v_MaxTransNo,LENGTH(v_MaxTransNo)-2) AS DECIMAL(3,0)) + 1);
		END IF;
	END IF;

--	PyyyyMMdd000
RETURN CONCAT('P', DATE_FORMAT(i_TRADEDATE,'%Y%m%d'), LPAD(v_NewNo, 3, '0'));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FN_GET_NEW_TRANSNO_RECEIPT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_GET_NEW_TRANSNO_RECEIPT`(i_TRADEDATE DATE) RETURNS varchar(12) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	DECLARE v_Count DECIMAL(3,0) DEFAULT 0;
	DECLARE v_NewNo DECIMAL(3,0) DEFAULT 1;
	DECLARE v_MaxTransNo VARCHAR(12) DEFAULT '';
	
--	計算筆數
	SELECT COUNT(*) INTO v_Count 
		FROM `RECEIPT` WHERE TRADEDATE = i_TRADEDATE;
	
	IF(v_Count > 0) THEN
	-- 	取得最大TransNo
		SELECT TRANSNO INTO v_MaxTransNo 
			FROM `RECEIPT` WHERE TRADEDATE = i_TRADEDATE ORDER BY TRANSNO DESC LIMIT 1;
		
		IF ISNULL(v_MaxTransNo) = 0 THEN
			SET v_NewNo = (CAST(SUBSTRING(v_MaxTransNo,LENGTH(v_MaxTransNo)-2) AS DECIMAL(3,0)) + 1);
		END IF;
	END IF;

--	RyyyyMMdd000
RETURN CONCAT('R', DATE_FORMAT(i_TRADEDATE,'%Y%m%d'), LPAD(v_NewNo, 3, '0'));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FN_GET_NEW_TRANSNO_SHIPPER` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_GET_NEW_TRANSNO_SHIPPER`(i_TRADEDATE DATE) RETURNS varchar(12) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	DECLARE v_Count DECIMAL(3,0) DEFAULT 0;
	DECLARE v_NewNo DECIMAL(3,0) DEFAULT 1;
	DECLARE v_MaxTransNo VARCHAR(12) DEFAULT '';
	
--	計算筆數
	SELECT COUNT(*) INTO v_Count 
		FROM `SHIPPER` WHERE TRADEDATE = i_TRADEDATE;
	
	IF(v_Count > 0) THEN
	-- 	取得最大TransNo
		SELECT TRANSNO INTO v_MaxTransNo 
			FROM `SHIPPER` WHERE TRADEDATE = i_TRADEDATE ORDER BY TRANSNO DESC LIMIT 1;
		
		IF ISNULL(v_MaxTransNo) = 0 THEN
			SET v_NewNo = (CAST(SUBSTRING(v_MaxTransNo,LENGTH(v_MaxTransNo)-2) AS DECIMAL(3,0)) + 1);
		END IF;
	END IF;

--	SyyyyMMdd000
RETURN CONCAT('S', DATE_FORMAT(i_TRADEDATE,'%Y%m%d'), LPAD(v_NewNo, 3, '0'));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `FN_GET_NEW_TRANSNO_TRADING` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `FN_GET_NEW_TRANSNO_TRADING`(i_TRADEDATE DATE) RETURNS varchar(12) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	DECLARE v_Count DECIMAL(3,0) DEFAULT 0;
	DECLARE v_NewNo DECIMAL(3,0) DEFAULT 1;
	DECLARE v_MaxTransNo VARCHAR(12) DEFAULT '';
	
--	計算筆數
	SELECT COUNT(*) INTO v_Count 
		FROM `TRADING` WHERE TRADEDATE = i_TRADEDATE;
	
	IF(v_Count > 0) THEN
	-- 	取得最大TransNo
		SELECT TRANSNO INTO v_MaxTransNo 
			FROM `TRADING` WHERE TRADEDATE = i_TRADEDATE ORDER BY TRANSNO DESC LIMIT 1;
		
		IF ISNULL(v_MaxTransNo) = 0 THEN
			SET v_NewNo = (CAST(SUBSTRING(v_MaxTransNo,LENGTH(v_MaxTransNo)-2) AS DECIMAL(3,0)) + 1);
		END IF;
	END IF;

--	TyyyyMMdd000
RETURN CONCAT('T', DATE_FORMAT(i_TRADEDATE,'%Y%m%d'), LPAD(v_NewNo, 3, '0'));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ACCOUND_ADD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ACCOUND_ADD`(In i_TRADEDATE DATE)
BEGIN
	DECLARE v_BeginDate DATE DEFAULT DATE_ADD((SELECT MAX(TRADEDATE) FROM CASHFLOW), INTERVAL 1 DAY);
	REPEAT
	CALL SP_CASHFLOW_ACCOUNT(v_BeginDate);
	CALL SP_COMMODITYMAST_ACCOUNT(v_BeginDate);
	SET v_BeginDate = DATE_ADD(v_BeginDate, INTERVAL 1 DAY);
	UNTIL v_BeginDate > i_TRADEDATE END REPEAT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ACCOUND_DELETE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ACCOUND_DELETE`(In i_TRADEDATE DATE)
BEGIN
	DELETE FROM CASHFLOW WHERE TRADEDATE >= i_TRADEDATE;
	DELETE FROM COMMODITYMAST WHERE TRADEDATE >= i_TRADEDATE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_CASHFLOW_ACCOUNT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CASHFLOW_ACCOUNT`(In i_TRADEDATE DATE)
BEGIN
	DECLARE v_Income DECIMAL(18,0) DEFAULT 0;
	DECLARE v_Expenses DECIMAL(18,0) DEFAULT 0;
	DECLARE v_Balance DECIMAL(18,0) DEFAULT 0;

	SET v_Income = IFNULL((SELECT SUM(TRADEAMOUNT) FROM SHIPPER WHERE TRADEDATE = i_TRADEDATE),0);
	SET v_Expenses = IFNULL((SELECT SUM(FEE) FROM SHIPPER WHERE TRADEDATE = i_TRADEDATE),0);
	SET v_Expenses = v_Expenses + IFNULL((SELECT SUM(TRADEAMOUNT) FROM RECEIPT WHERE TRADEDATE = i_TRADEDATE),0);
	SET v_Expenses = v_Expenses + IFNULL((SELECT SUM(FEE) FROM PURCHASE WHERE TRADEDATE = i_TRADEDATE),0);
	SET v_Balance = IFNULL((SELECT BALANCE FROM CASHFLOW WHERE TRADEDATE = DATE_ADD(i_TRADEDATE, INTERVAL -1 DAY)),0);
	SET v_Balance = v_Balance + v_Income - v_Expenses;

	CALL SP_CASHFLOW_ADD(i_TRADEDATE, v_Income, v_Expenses, v_Balance);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_CASHFLOW_ADD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CASHFLOW_ADD`(IN i_TRADEDATE DATE, IN i_INCOME DECIMAL(18, 0), IN i_EXPENSES DECIMAL(18,0), IN i_BALANCE DECIMAL(18,0))
BEGIN
	INSERT INTO CASHFLOW (TRADEDATE, INCOME, EXPENSES, BALANCE) VALUES (i_TRADEDATE, i_INCOME, i_EXPENSES, i_BALANCE);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_CASHFLOW_DELETE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CASHFLOW_DELETE`(IN i_TRADEDATE DATE)
BEGIN
	DELETE FROM CASHFLOW WHERE TRADEDATE = i_TRADEDATE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_CASHFLOW_GET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CASHFLOW_GET`(IN i_TRADEDATE DATE)
BEGIN
	SELECT * FROM CASHFLOW WHERE TRADEDATE = i_TRADEDATE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_CASHFLOW_LIST` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CASHFLOW_LIST`()
BEGIN
	SELECT * FROM CASHFLOW;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_CASHFLOW_UPDATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_CASHFLOW_UPDATE`(IN i_TRADEDATE DATE, IN i_INCOME DECIMAL(18, 0), IN i_EXPENSES DECIMAL(18,0), IN i_BALANCE DECIMAL(18,0))
BEGIN
	UPDATE CASHFLOW SET INCOME = i_INCOME, EXPENSES = i_EXPENSES, BALANCE = i_BALANCE WHERE TRADEDATE = i_TRADEDATE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_COMMODITYMAST_ACCOUNT` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_COMMODITYMAST_ACCOUNT`(In i_TRADEDATE DATE)
BEGIN
	DECLARE v_Quantity DECIMAL(18,0) DEFAULT 0;
	DECLARE v_In DECIMAL(18,0) DEFAULT 0;
	DECLARE v_Out DECIMAL(18,0) DEFAULT 0;
	DECLARE v_ID VARCHAR(12) DEFAULT '';

	DECLARE finished BOOLEAN DEFAULT FALSE;
	DECLARE v_IDs CURSOR FOR SELECT ID FROM COMMODITY;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = TRUE;
	
	OPEN v_IDs;
    
	addMast: LOOP
        FETCH v_IDs INTO v_ID;
        IF finished THEN 
            LEAVE addMast;
        END IF;
		
		SET v_Out = IFNULL((SELECT SUM(TRADEQUANTITY) FROM TRADING WHERE COMMODITYID = v_ID AND SHIPPERNO IN (SELECT TRANSNO FROM SHIPPER WHERE TRADEDATE = i_TRADEDATE AND TRANSNO IS NOT NULL AND TRANSNO <> '')),0);
		SET v_In = IFNULL((SELECT SUM(TRADEQUANTITY) FROM `ORDER` WHERE COMMODITYID = v_ID AND PURCHASENO IN (SELECT TRANSNO FROM PURCHASE WHERE TRADEDATE = i_TRADEDATE AND TRANSNO IS NOT NULL AND TRANSNO <> '')),0);
		
		SET v_Quantity = IFNULL((SELECT QUANTITY FROM COMMODITYMAST WHERE COMMODITYID = v_ID AND TRADEDATE = DATE_ADD(i_TRADEDATE, INTERVAL 1 DAY)),0) - v_Out + v_In;
	
		CALL SP_COMMODITYMAST_ADD(i_TRADEDATE, v_ID, v_Quantity);
--         reset
        SET v_Quantity = 0, v_Out = 0, v_In = 0;
    END LOOP addMast;
	
	CLOSE v_IDs;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_COMMODITYMAST_ADD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_COMMODITYMAST_ADD`(IN i_TRADEDATE DATE, IN i_COMMODITYID VARCHAR(12), IN i_QUANTITY DECIMAL(18,0))
BEGIN
	INSERT INTO COMMODITYMAST (TRADEDATE, COMMODITYID, QUANTITY) VALUES (i_TRADEDATE, i_COMMODITYID, i_QUANTITY);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_COMMODITYMAST_DELETE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_COMMODITYMAST_DELETE`(IN i_COMMODITYID VARCHAR(12), IN i_TRADEDATE DATE)
BEGIN
	DELETE FROM COMMODITYMAST WHERE COMMODITYID = i_COMMODITYID AND TRADEDATE = i_TRADEDATE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_COMMODITYMAST_GET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_COMMODITYMAST_GET`(IN i_TRADEDATE DATE, IN i_COMMODITYID VARCHAR(12))
BEGIN
	SELECT * FROM COMMODITYMAST WHERE COMMODITYID = i_COMMODITYID AND TRADEDATE = i_TRADEDATE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_COMMODITYMAST_LIST` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_COMMODITYMAST_LIST`()
BEGIN
	SELECT * FROM COMMODITYMAST;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_COMMODITYMAST_UPDATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_COMMODITYMAST_UPDATE`(IN i_TRADEDATE DATE, IN i_COMMODITYID VARCHAR(12), IN i_QUANTITY DECIMAL(18,0))
BEGIN
	UPDATE COMMODITYMAST SET QUANTITY = i_QUANTITY WHERE COMMODITYID = i_COMMODITYID AND TRADEDATE = i_TRADEDATE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_COMMODITY_ADD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_COMMODITY_ADD`(IN i_NAME VARCHAR(20), IN i_STYLE VARCHAR(10), IN i_NATIONID VARCHAR(3), IN i_SUPPLIERID VARCHAR(20), IN i_SUPPLIER_PRODUCTNO VARCHAR(20), IN i_WHOLESALE_PRICE DECIMAL(18,0), IN i_RETAIL_PRICE DECIMAL(18,0), IN i_REMARK VARCHAR(50))
BEGIN
	INSERT INTO COMMODITY (ID, NAME, STYLE, NATIONID, SUPPLIERID, SUPPLIER_PRODUCTNO, WHOLESALE_PRICE, RETAIL_PRICE, REMARK) 
		VALUES (FN_GET_NEW_ID_COMMODITY(), i_NAME, i_STYLE, i_NATIONID, i_SUPPLIERID, i_SUPPLIER_PRODUCTNO, i_WHOLESALE_PRICE, i_RETAIL_PRICE, i_REMARK);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_COMMODITY_DELETE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_COMMODITY_DELETE`(IN i_ID VARCHAR(12))
BEGIN
	DELETE FROM COMMODITY WHERE ID = i_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_COMMODITY_GET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_COMMODITY_GET`(IN i_ID VARCHAR(12))
BEGIN
	SELECT * FROM COMMODITY WHERE ID = i_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_COMMODITY_LIST` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_COMMODITY_LIST`()
BEGIN
	SELECT * FROM COMMODITY;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_COMMODITY_UPDATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_COMMODITY_UPDATE`(IN i_ID VARCHAR(12),IN i_NAME VARCHAR(20), IN i_STYLE VARCHAR(10), IN i_NATIONID VARCHAR(3), IN i_SUPPLIERID VARCHAR(20), IN i_SUPPLIER_PRODUCTNO VARCHAR(20), IN i_WHOLESALE_PRICE DECIMAL(18,0), IN i_RETAIL_PRICE DECIMAL(18,0), IN i_REMARK VARCHAR(50))
BEGIN
	UPDATE COMMODITY SET NAME = i_NAME, STYLE = i_STYLE, NATIONID = i_NATIONID, SUPPLIERID = i_SUPPLIERID, SUPPLIER_PRODUCTNO = i_SUPPLIER_PRODUCTNO, WHOLESALE_PRICE = i_WHOLESALE_PRICE, RETAIL_PRICE = i_RETAIL_PRICE, REMARK = i_REMARK WHERE ID = i_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_DELIVERYTYPE_ADD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELIVERYTYPE_ADD`(IN i_ID VARCHAR(20), IN i_NAME VARCHAR(20))
BEGIN
	INSERT INTO DELIVERYTYPE(ID,NAME) VALUES (i_ID,i_NAME);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_DELIVERYTYPE_DELETE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELIVERYTYPE_DELETE`(IN i_ID VARCHAR(20))
BEGIN
	DELETE FROM DELIVERYTYPE WHERE ID = i_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_DELIVERYTYPE_GET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELIVERYTYPE_GET`(IN i_ID VARCHAR(20))
BEGIN
	SELECT * FROM DELIVERYTYPE WHERE ID = i_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_DELIVERYTYPE_LIST` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELIVERYTYPE_LIST`()
BEGIN
	SELECT * FROM DELIVERYTYPE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_DELIVERYTYPE_UPDATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_DELIVERYTYPE_UPDATE`(IN i_ID VARCHAR(20), IN i_NAME VARCHAR(20))
BEGIN
	UPDATE DELIVERYTYPE SET NAME = i_NAME WHERE ID = i_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_NATION_ADD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_NATION_ADD`(IN i_ID VARCHAR(3), IN i_NAME VARCHAR(10))
BEGIN
	INSERT INTO NATION(ID,NAME) VALUES (i_ID,i_NAME);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_NATION_DELETE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_NATION_DELETE`(IN i_ID VARCHAR(3))
BEGIN
	DELETE FROM NATION WHERE ID = i_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_NATION_GET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_NATION_GET`(IN i_ID VARCHAR(3))
BEGIN
	SELECT * FROM NATION WHERE ID = i_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_NATION_LIST` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_NATION_LIST`()
BEGIN
	SELECT * FROM NATION;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_NATION_UPDATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_NATION_UPDATE`(IN i_ID VARCHAR(3), IN i_NAME VARCHAR(10))
BEGIN
	UPDATE NATION SET NAME = i_NAME WHERE ID = i_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ORDER_ADD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ORDER_ADD`(IN i_TRADEDATE DATE, IN i_COMMODITYID VARCHAR(12), IN i_TRADEQUANTITY DECIMAL(18,0), IN i_TRADEAMOUNT DECIMAL(18,0), IN i_RECEIPTNO VARCHAR(12), IN i_PURCHASENO VARCHAR(12), IN i_REMARK VARCHAR(50))
BEGIN
	INSERT INTO `ORDER` (TRANSNO, TRADEDATE, COMMODITYID, TRADEQUANTITY, TRADEAMOUNT, RECEIPTNO, PURCHASENO, REMARK)
		VALUES (FN_GET_NEW_TRANSNO_ORDER(i_TRADEDATE), i_TRADEDATE, i_COMMODITYID, i_TRADEQUANTITY, i_TRADEAMOUNT, i_RECEIPTNO, i_PURCHASENO, i_REMARK);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ORDER_DELETE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ORDER_DELETE`(IN i_TRANSNO VARCHAR(12))
BEGIN
	DELETE FROM `ORDER` WHERE TRANSNO = i_TRANSNO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ORDER_GET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ORDER_GET`(IN i_TRANSNO VARCHAR(12))
BEGIN
	SELECT * FROM `ORDER` WHERE TRANSNO = i_TRANSNO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ORDER_LIST` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ORDER_LIST`(IN i_TradeDate_S DATE, IN i_TradeDate_E DATE, IN i_CommodityID VARCHAR(12), IN i_TransNos TEXT, IN i_ReceiptNo VARCHAR(12), IN i_PurchaseNo VARCHAR(12))
BEGIN
	DECLARE v_i_TransNos_IsNull BOOLEAN DEFAULT (COALESCE(i_TransNos, '') = '');
    
	SELECT * FROM `ORDER` WHERE
		IFNULL(i_TradeDate_S, TRADEDATE) <= TRADEDATE AND
		IFNULL(i_TradeDate_E, TRADEDATE) >= TRADEDATE AND
		IF(COALESCE(i_CommodityID, '') <> '', i_CommodityID, COMMODITYID) = COMMODITYID AND
		IF(v_i_TransNos_IsNull, 0, 1) = IF(v_i_TransNos_IsNull, 0, FIND_IN_SET(TRANSNO, i_TransNos)) AND
		IF(COALESCE(i_ReceiptNo, '') <> '', i_ReceiptNo, RECEIPTNO) = RECEIPTNO AND
		IF(COALESCE(i_PurchaseNo, '') <> '', i_PurchaseNo, PURCHASENO) = PURCHASENO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ORDER_UNPAID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ORDER_UNPAID`()
BEGIN
	SELECT * FROM `ORDER` WHERE
		COALESCE(RECEIPTNO, '') = '';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ORDER_UNPURCHASE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ORDER_UNPURCHASE`()
BEGIN
	SELECT * FROM `ORDER` WHERE
		COALESCE(RECEIPTNO, '') <> '' AND
        COALESCE(PURCHASENO, '') = '';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_ORDER_UPDATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_ORDER_UPDATE`(IN i_TRANSNO VARCHAR(12), IN i_TRADEDATE DATE, IN i_COMMODITYID VARCHAR(12), IN i_TRADEQUANTITY DECIMAL(18,0), IN i_TRADEAMOUNT DECIMAL(18,0), IN i_RECEIPTNO VARCHAR(12), IN i_PURCHASENO VARCHAR(12), IN i_REMARK VARCHAR(50))
BEGIN
	UPDATE `ORDER` SET TRADEDATE = i_TRADEDATE, COMMODITYID = i_COMMODITYID, TRADEQUANTITY = i_TRADEQUANTITY, TRADEAMOUNT = i_TRADEAMOUNT, RECEIPTNO = i_RECEIPTNO, PURCHASENO = i_PURCHASENO, REMARK = i_REMARK WHERE TRANSNO = i_TRANSNO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_PURCHASE_ADD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PURCHASE_ADD`(IN i_OrderNos TEXT)
BEGIN
	DECLARE v_newTransNo VARCHAR(12) DEFAULT FN_GET_NEW_TRANSNO_PURCHASE(SYSDATE());
    
	INSERT INTO PURCHASE (TRANSNO, TRADEDATE, FEE, REMARK) 
		VALUES (v_newTransNo, SYSDATE(), 0, '');
	UPDATE `ORDER` SET PURCHASENO = v_newTransNo WHERE FIND_IN_SET(TRANSNO, i_OrderNos);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_PURCHASE_DELETE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PURCHASE_DELETE`(IN i_TRANSNO VARCHAR(12))
BEGIN
	DELETE FROM PURCHASE WHERE TRANSNO = i_TRANSNO;
	UPDATE `ORDER` SET PURCHASENO = '' WHERE PURCHASENO = i_TRANSNO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_PURCHASE_GET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PURCHASE_GET`(IN i_TRANSNO VARCHAR(12))
BEGIN
	SELECT * FROM `PURCHASE` WHERE TRANSNO = i_TRANSNO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_PURCHASE_LIST` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PURCHASE_LIST`(IN i_TradeDate_S DATE, IN i_TradeDate_E DATE)
BEGIN
	SELECT * FROM PURCHASE WHERE
		IFNULL(i_TradeDate_S, TRADEDATE) <= TRADEDATE AND
		IFNULL(i_TradeDate_E, TRADEDATE) >= TRADEDATE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_PURCHASE_UPDATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_PURCHASE_UPDATE`(IN i_TRANSNO VARCHAR(12), IN i_TRADEDATE DATE, IN i_FEE DECIMAL(18,0), i_REMARK VARCHAR(50))
BEGIN
	UPDATE PURCHASE SET TRADEDATE = i_TRADEDATE, FEE = i_FEE, REMARK = i_REMARK WHERE TRANSNO = i_TRANSNO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_RECEIPT_ADD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_RECEIPT_ADD`(IN i_OrderNos TEXT)
BEGIN
	DECLARE v_newTransNo VARCHAR(12) DEFAULT FN_GET_NEW_TRANSNO_RECEIPT(SYSDATE());
    DECLARE v_TradeAmount DECIMAL(18, 0) DEFAULT (SELECT SUM(TRADEAMOUNT) FROM `ORDER` WHERE FIND_IN_SET(TRANSNO, i_OrderNos) > 0);

	INSERT INTO RECEIPT (TRANSNO, TRADEDATE, TRADEAMOUNT, REMARK) 
		VALUES (v_newTransNo, SYSDATE(), v_TradeAmount, '');
	UPDATE `ORDER` SET RECEIPTNO = v_newTransNo WHERE FIND_IN_SET(TRANSNO, i_OrderNos);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_RECEIPT_DELETE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_RECEIPT_DELETE`(IN i_TRANSNO VARCHAR(12))
BEGIN
	DELETE FROM RECEIPT WHERE TRANSNO = i_TRANSNO;
	UPDATE `ORDER` SET RECEIPTNO = '' WHERE RECEIPTNO = i_TRANSNO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_RECEIPT_GET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_RECEIPT_GET`(IN i_TRANSNO VARCHAR(12))
BEGIN
	SELECT * FROM `RECEIPT` WHERE TRANSNO = i_TRANSNO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_RECEIPT_LIST` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_RECEIPT_LIST`(IN i_TradeDate_S DATE, IN i_TradeDate_E DATE)
BEGIN
	SELECT * FROM RECEIPT WHERE
		IFNULL(i_TradeDate_S, TRADEDATE) <= TRADEDATE AND
		IFNULL(i_TradeDate_E, TRADEDATE) >= TRADEDATE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_RECEIPT_UPDATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_RECEIPT_UPDATE`(IN i_TRANSNO VARCHAR(12), IN i_TRADEDATE DATE, IN i_TRADEAMOUNT DECIMAL(18,0), i_REMARK VARCHAR(50))
BEGIN
	UPDATE RECEIPT SET TRADEDATE = i_TRADEDATE, TRADEAMOUNT = i_TRADEAMOUNT, REMARK = i_REMARK WHERE TRANSNO = i_TRANSNO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SHIPPER_ADD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SHIPPER_ADD`(IN i_TradingNos TEXT)
BEGIN
	DECLARE v_newTransNo VARCHAR(12) DEFAULT FN_GET_NEW_TRANSNO_SHIPPER(SYSDATE());
    DECLARE v_TradeAmount DECIMAL(18, 0) DEFAULT (SELECT SUM(TRADEAMOUNT) FROM TRADING WHERE FIND_IN_SET(TRANSNO, i_TradingNos) > 0);
    DECLARE v_Buyer VARCHAR(20) DEFAULT (SELECT BUYER FROM `TRADING` WHERE FIND_IN_SET(TRANSNO, i_TradingNos) > 0 LIMIT 1);
    DECLARE v_Delivery VARCHAR(20) DEFAULT (SELECT ID FROM `DELIVERYTYPE` LIMIT 1);

	INSERT INTO SHIPPER (TRANSNO, TRADEDATE, BUYER, TRADEAMOUNT, FEE, DELIVERY, REMARK)
		VALUES (v_newTransNo, SYSDATE(), v_Buyer, v_TradeAmount, 0, v_Delivery, '');
	UPDATE `TRADING` SET SHIPPERNO = v_newTransNo WHERE FIND_IN_SET(TRANSNO, i_TradingNos) > 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SHIPPER_DELETE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SHIPPER_DELETE`(IN i_TRANSNO VARCHAR(12))
BEGIN
	DELETE FROM SHIPPER WHERE TRANSNO = i_TRANSNO;
	UPDATE TRADING SET SHIPPERNO = '' WHERE SHIPPERNO = i_TRANSNO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SHIPPER_GET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SHIPPER_GET`(IN i_TRANSNO VARCHAR(12))
BEGIN
	SELECT * FROM SHIPPER WHERE TRANSNO = i_TRANSNO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SHIPPER_LIST` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SHIPPER_LIST`(IN i_TradeDate_S DATE, IN i_TradeDate_E DATE, IN i_Buyer VARCHAR(20))
BEGIN
	SELECT * FROM SHIPPER WHERE
		IFNULL(i_TradeDate_S, TRADEDATE) <= TRADEDATE AND
		IFNULL(i_TradeDate_E, TRADEDATE) >= TRADEDATE AND
		IF(COALESCE(i_Buyer, '') <> '', i_Buyer, BUYER) = BUYER;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SHIPPER_UPDATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SHIPPER_UPDATE`(IN i_TRANSNO VARCHAR(12), IN i_BUYER VARCHAR(20), IN i_DELIVERY VARCHAR(20), IN i_FEE DECIMAL(18,0), IN i_TRADEDATE DATE, IN i_TRADEAMOUNT DECIMAL(18,0), IN i_REMARK VARCHAR(50))
BEGIN
	UPDATE SHIPPER SET BUYER = i_BUYER, DELIVERY = i_DELIVERY, FEE = i_FEE, TRADEDATE = i_TRADEDATE, TRADEAMOUNT = i_TRADEAMOUNT, REMARK = i_REMARK WHERE TRANSNO = i_TRANSNO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SUPPLIER_ADD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SUPPLIER_ADD`(IN i_ID VARCHAR(20), IN i_NAME VARCHAR(20), IN i_NATIONID VARCHAR(3))
BEGIN
	INSERT INTO SUPPLIER (ID, NAME, NATIONID) VALUES (i_ID, i_NAME, i_NATIONID);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SUPPLIER_DELETE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SUPPLIER_DELETE`(IN i_ID VARCHAR(10))
BEGIN
	DELETE FROM SUPPLIER WHERE ID = i_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SUPPLIER_GET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SUPPLIER_GET`(IN i_ID VARCHAR(20))
BEGIN
	SELECT * FROM SUPPLIER WHERE ID = i_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SUPPLIER_LIST` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SUPPLIER_LIST`()
BEGIN
	SELECT * FROM SUPPLIER;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_SUPPLIER_UPDATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_SUPPLIER_UPDATE`(IN i_ID VARCHAR(20), IN i_NAME VARCHAR(20), IN i_NATIONID VARCHAR(3))
BEGIN
	UPDATE SUPPLIER SET NAME = i_NAME, NATIONID = i_NATIONID WHERE ID = i_ID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_TRADING_ADD` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TRADING_ADD`(IN i_TRADEDATE DATE, IN i_BUYER VARCHAR(20), IN i_COMMODITYID VARCHAR(12), IN i_TRADEQUANTITY DECIMAL(18,0), IN i_TRADEAMOUNT DECIMAL(18,0), IN i_SHIPPERNO VARCHAR(12), IN i_REMARK VARCHAR(50))
BEGIN
	INSERT INTO `TRADING` (TRANSNO, TRADEDATE, BUYER, COMMODITYID, TRADEQUANTITY, TRADEAMOUNT, SHIPPERNO, REMARK)
		VALUES (FN_GET_NEW_TRANSNO_TRADING(i_TRADEDATE), i_TRADEDATE, i_BUYER, i_COMMODITYID, i_TRADEQUANTITY, i_TRADEAMOUNT, i_SHIPPERNO, i_REMARK);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_TRADING_DELETE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TRADING_DELETE`(IN i_TRANSNO VARCHAR(12))
BEGIN
	DELETE FROM TRADING WHERE TRANSNO = i_TRANSNO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_TRADING_GET` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TRADING_GET`(IN i_TRANSNO VARCHAR(12))
BEGIN
	SELECT * FROM TRADING WHERE TRANSNO = i_TRANSNO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_TRADING_LIST` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TRADING_LIST`(IN i_TradeDate_S DATE, IN i_TradeDate_E DATE, IN i_Buyer VARCHAR(20), IN i_CommodityID VARCHAR(12))
BEGIN
	SELECT * FROM TRADING WHERE
		IFNULL(i_TradeDate_S, TRADEDATE) <= TRADEDATE AND
		IFNULL(i_TradeDate_E, TRADEDATE) >= TRADEDATE AND
		IF(COALESCE(i_Buyer, '') <> '', i_Buyer, BUYER) = BUYER AND
		IF(COALESCE(i_CommodityID, '') <> '', i_CommodityID, COMMODITYID) = COMMODITYID;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_TRADING_UNSHIPPED` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TRADING_UNSHIPPED`(IN i_BUYER VARCHAR(20))
BEGIN
	SELECT * FROM TRADING WHERE
		IF(COALESCE(i_BUYER, '') <> '', i_BUYER, BUYER) = BUYER AND
        COALESCE(SHIPPERNO, '') = '';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_TRADING_UPDATE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_TRADING_UPDATE`(IN i_TRANSNO VARCHAR(12), IN i_TRADEDATE DATE, IN i_BUYER VARCHAR(20), IN i_COMMODITYID VARCHAR(12), IN i_TRADEQUANTITY DECIMAL(18,0), IN i_TRADEAMOUNT DECIMAL(18,0), IN i_SHIPPERNO VARCHAR(12), IN i_REMARK VARCHAR(50))
BEGIN
	UPDATE `TRADING` SET TRADEDATE = i_TRADEDATE, BUYER = i_BUYER, COMMODITYID = i_COMMODITYID, TRADEQUANTITY = i_TRADEQUANTITY, TRADEAMOUNT = i_TRADEAMOUNT, SHIPPERNO = i_SHIPPERNO, REMARK = i_REMARK WHERE TRANSNO = i_TRANSNO;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-06 18:10:31
