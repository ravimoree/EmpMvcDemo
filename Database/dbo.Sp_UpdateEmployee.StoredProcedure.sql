USE [DemoTest2]
GO
/****** Object:  StoredProcedure [dbo].[Sp_UpdateEmployee]    Script Date: 09/01/2022 5.45.41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*-- =============================================
-- Author      : dbo
-- Create date : Apr 16 2022  6:06PM
-- Description : Update Procedure for Employee
-- Exec [dbo].[Sp_UpdateEmployee] [FirstName],[MiddleName],[LastName],[EmployeeCode],[DOB],[Age],[Gender],[ContactNo],[Email],[Photo]
-- ============================================= */
CREATE PROCEDURE [dbo].[Sp_UpdateEmployee]
     @FirstName  nvarchar(50)
    ,@MiddleName  nvarchar(50)
    ,@LastName  nvarchar(50)
    ,@EmployeeCode  nvarchar(50)
    ,@DOB  datetime
    ,@Age  int
    ,@Gender  nvarchar(50)
    ,@ContactNo  nvarchar(50)
    ,@Email  nvarchar(50)
    ,@Photo  nvarchar(max)
    ,@EId  int
    
AS
BEGIN

    UPDATE [dbo].[Employee]
    SET 
         [FirstName] = @FirstName
        ,[MiddleName] = @MiddleName
        ,[LastName] = @LastName
        ,[EmployeeCode] = @EmployeeCode
        ,[DOB] = @DOB
        ,[Age] = @Age
        ,[Gender] = @Gender
        ,[ContactNo] = @ContactNo
        ,[Email] = @Email
        ,[Photo] = @Photo
        
    WHERE [EId] = @EId

END


GO
