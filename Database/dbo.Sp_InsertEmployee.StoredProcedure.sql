USE [DemoTest2]
GO
/****** Object:  StoredProcedure [dbo].[Sp_InsertEmployee]    Script Date: 09/01/2022 5.45.41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*-- =============================================-- Author      : dbo-- Create date : Apr 16 2022  6:06PM-- Description : Insert Procedure for Employee-- Exec [dbo].[Sp_InsertEmployee] [FirstName],[MiddleName],[LastName],[EmployeeCode],[DOB],[Age],[Gender],[ContactNo],[Email],[Photo]-- ============================================= */CREATE PROCEDURE [dbo].[Sp_InsertEmployee]     @FirstName  nvarchar(50)    ,@MiddleName  nvarchar(50)    ,@LastName  nvarchar(50)    ,@EmployeeCode  nvarchar(50)    ,@DOB  datetime    ,@Age  int    ,@Gender  nvarchar(50)    ,@ContactNo  nvarchar(50)    ,@Email  nvarchar(50)    ,@Photo  nvarchar(max)    ASBEGIN    INSERT INTO [dbo].[Employee]    (          [FirstName]        ,[MiddleName]        ,[LastName]        ,[EmployeeCode]        ,[DOB]        ,[Age]        ,[Gender]        ,[ContactNo]        ,[Email]        ,[Photo]            )    VALUES    (         @FirstName        ,@MiddleName        ,@LastName        ,@EmployeeCode        ,@DOB        ,@Age        ,@Gender        ,@ContactNo        ,@Email        ,@Photo            )END
GO
