USE [DemoTest2]
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetAllEmployee]    Script Date: 09/01/2022 5.45.41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*-- =============================================-- Author      : dbo-- Create date : Apr 14 2022 11:15PM-- Description : Select Procedure for Employee-- Exec [dbo].[Sp_GetAllEmployee]-- ============================================= */CREATE PROCEDURE [dbo].[Sp_GetAllEmployee]ASBEGIN    SELECT * FROM [dbo].[Employee]END
GO
