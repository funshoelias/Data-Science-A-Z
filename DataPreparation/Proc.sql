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
	SELECT  * FROM [dbo].[Office_TransactionData]
	SELECT  * FROM [dbo].[Office_CustomerList]
END
