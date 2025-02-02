USE [DSTraining]
GO
/****** Object:  StoredProcedure [dbo].[BLD_WRK_Office_TransactionData]    Script Date: 11/23/2017 8:45:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Samuel Peoples
-- Create date: 20171123
-- Description:	RAW -> WRK
-- MOD DATE:
-- =============================================
Alter PROC [dbo].[BLD_WRK_Office_Both]
AS
BEGIN

-- =============================================
-- CREATE TABLE TRANSACTIONAL DATA
-- =============================================
	--SELECT  * FROM [dbo].[Office_TransactionalData]
Create Table [WRK_Office_TransactionData](
       [RowNumber]    int identity(1,1)
	  ,[Order ID]     varchar(100)
      ,[Order Date]   date
      ,[Customer ID]  varchar(100)
      ,[Region]       int
      ,[Rep]          varchar(100)
      ,[Item]         varchar(100)
      ,[Units]        int
      ,[Unit Price]   float)
-- =============================================
-- DROP TABLE
-- =============================================
IF OBJECT_ID ('WRK_Office_TransactionData') IS NOT NULL
DROP Table [WRK_Office_TransactionData]
--truncate table WRK_Office_TransactionData
-- =============================================
-- INSERT INTO
-- =============================================
Insert into [WRK_Office_TransactionData](
	   [Order ID]
      ,[Order Date]
      ,[Customer ID]
      ,[Region]
      ,[Rep]
      ,[Item]
      ,[Units]
      ,[Unit Price])
Select
       [Order ID]
      ,Convert(Date,[Order Date],20)
      ,[Customer ID]
      ,[Region]
      ,[Rep]
      ,[Item]
      ,CAST([Units] as INT)
      ,CAST([Unit Price] as FLOAT)
FROM [Office_TransactionalData]
--(43 rows affected)


-- ==========================================================================================
-- ==========================================================================================

-- =============================================
-- CREATE TABLE CUSTOMER LIST
-- =============================================
    --SELECT  * FROM [dbo].[Office_CustomerList]
Create Table [WRK_Office_CustomerList](
       [RowNumber]     int identity(1,1)
	  ,[Customer ID]   varchar(100)
      ,[City]          varchar(1000)
      ,[ZipCode]       varchar(5) --will never use zipcode as an integer
      ,[Gender]        varchar(1) --safety catch, will throw truncation error
      ,[Age]           float)
-- =============================================
-- DROP TABLE
-- =============================================
IF OBJECT_ID ('WRK_Office_CustomerList') IS NOT NULL
DROP Table [WRK_Office_CustomerList]
--truncate table WRK_Office_CustomerList
-- =============================================
-- INSERT INTO
-- =============================================
Insert into [WRK_Office_CustomerList](
	   [Customer ID]
      ,[City]
      ,[ZipCode]
      ,[Gender]
      ,[Age])
Select
       RIGHT('0000000'+[Customer ID],7) --Replace leading zeros
      ,[City]
      ,[ZipCode]
      ,[Gender]
      ,CAST([Age] as FLOAT)
FROM [Office_CustomerList]
--(43 rows affected)
END
