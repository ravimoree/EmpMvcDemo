USE [DemoTest2]
GO
/****** Object:  StoredProcedure [dbo].[Sp_DeleteEmployee]    Script Date: 09/01/2022 5.45.41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*-- =============================================-- Author      : dbo-- Create date : Apr 14 2022 11:15PM-- Description : Delete Procedure for Employee-- Exec [dbo].[Sp_DeleteEmployee] @EId  int    -- ============================================= */CREATE PROCEDURE [dbo].[Sp_DeleteEmployee]     @EId  int    ASBEGIN    DELETE FROM [dbo].[Employee]    WHERE [EId] = @EIdEND
GO
