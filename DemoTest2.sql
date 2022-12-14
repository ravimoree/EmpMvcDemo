USE [master]
GO
/****** Object:  Database [DemoTest2]    Script Date: 15-04-2022 1.37.46 AM ******/
CREATE DATABASE [DemoTest2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DemoTest2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DemoTest2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DemoTest2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DemoTest2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DemoTest2] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DemoTest2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DemoTest2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DemoTest2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DemoTest2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DemoTest2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DemoTest2] SET ARITHABORT OFF 
GO
ALTER DATABASE [DemoTest2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DemoTest2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DemoTest2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DemoTest2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DemoTest2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DemoTest2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DemoTest2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DemoTest2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DemoTest2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DemoTest2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DemoTest2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DemoTest2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DemoTest2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DemoTest2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DemoTest2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DemoTest2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DemoTest2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DemoTest2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DemoTest2] SET  MULTI_USER 
GO
ALTER DATABASE [DemoTest2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DemoTest2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DemoTest2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DemoTest2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DemoTest2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DemoTest2] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DemoTest2] SET QUERY_STORE = OFF
GO
USE [DemoTest2]
GO
/****** Object:  Table [dbo].[Education]    Script Date: 15-04-2022 1.37.46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Education](
	[EdId] [int] NOT NULL,
	[EmpId] [int] NULL,
	[Degree] [nvarchar](50) NULL,
	[PassingYear] [nvarchar](50) NULL,
	[Percentage] [nvarchar](50) NULL,
 CONSTRAINT [PK_Education] PRIMARY KEY CLUSTERED 
(
	[EdId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 15-04-2022 1.37.46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[MiddleName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[EmployeeCode] [nvarchar](50) NULL,
	[DOB] [datetime] NULL,
	[Age] [int] NULL,
	[Gender] [nvarchar](50) NULL,
	[ConactNo] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([EId], [FirstName], [MiddleName], [LastName], [EmployeeCode], [DOB], [Age], [Gender], [ConactNo], [Email]) VALUES (1, N'ravi', N'Chaturbhai', N'Mori', N'21699122646', CAST(N'1992-09-29T00:00:00.000' AS DateTime), 30, N'male', N'9586088860', N'moree@gmail.com')
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
/****** Object:  StoredProcedure [dbo].[Sp_DeleteEmployee]    Script Date: 15-04-2022 1.37.46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*-- =============================================-- Author      : dbo-- Create date : Apr 14 2022 11:15PM-- Description : Delete Procedure for Employee-- Exec [dbo].[Sp_DeleteEmployee] @EId  int    -- ============================================= */CREATE PROCEDURE [dbo].[Sp_DeleteEmployee]     @EId  int    ASBEGIN    DELETE FROM [dbo].[Employee]    WHERE [EId] = @EIdEND
GO
/****** Object:  StoredProcedure [dbo].[Sp_GetAllEmployee]    Script Date: 15-04-2022 1.37.46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*-- =============================================-- Author      : dbo-- Create date : Apr 14 2022 11:15PM-- Description : Select Procedure for Employee-- Exec [dbo].[Sp_GetAllEmployee]-- ============================================= */CREATE PROCEDURE [dbo].[Sp_GetAllEmployee]ASBEGIN    SELECT * FROM [dbo].[Employee]END
GO
/****** Object:  StoredProcedure [dbo].[Sp_InsertEmployee]    Script Date: 15-04-2022 1.37.46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*-- =============================================-- Author      : dbo-- Create date : Apr 14 2022 11:15PM-- Description : Insert Procedure for Employee-- Exec [dbo].[Sp_InsertEmployee] [FirstName],[MiddleName],[LastName],[EmployeeCode],[DOB],[Age],[Gender],[ConactNo],[Email]-- ============================================= */CREATE PROCEDURE [dbo].[Sp_InsertEmployee]     @FirstName  nvarchar(50)    ,@MiddleName  nvarchar(50)    ,@LastName  nvarchar(50)    ,@EmployeeCode  int    ,@DOB  datetime    ,@Age  int    ,@Gender  nvarchar(50)    ,@ConactNo nvarchar(50)    ,@Email  nvarchar(50)    ASBEGIN    INSERT INTO [dbo].[Employee]    (          [FirstName]        ,[MiddleName]        ,[LastName]        ,[EmployeeCode]        ,[DOB]        ,[Age]        ,[Gender]        ,[ConactNo]        ,[Email]            )    VALUES    (         @FirstName        ,@MiddleName        ,@LastName        ,@EmployeeCode        ,@DOB        ,@Age        ,@Gender        ,@ConactNo        ,@Email            )END
GO
/****** Object:  StoredProcedure [dbo].[Sp_UpdateEmployee]    Script Date: 15-04-2022 1.37.46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*-- =============================================-- Author      : dbo-- Create date : Apr 14 2022 11:15PM-- Description : Update Procedure for Employee-- Exec [dbo].[Sp_UpdateEmployee] [FirstName],[MiddleName],[LastName],[EmployeeCode],[DOB],[Age],[Gender],[ConactNo],[Email]-- ============================================= */CREATE PROCEDURE [dbo].[Sp_UpdateEmployee]     @FirstName  nvarchar(50)    ,@MiddleName  nvarchar(50)    ,@LastName  nvarchar(50)    ,@EmployeeCode  nvarchar(50)    ,@DOB  datetime    ,@Age  int    ,@Gender  nvarchar(50)    ,@ConactNo  nvarchar(50)    ,@Email  nvarchar(50)    ,@EId  int    ASBEGIN    UPDATE [dbo].[Employee]    SET          [FirstName] = @FirstName        ,[MiddleName] = @MiddleName        ,[LastName] = @LastName        ,[EmployeeCode] = @EmployeeCode        ,[DOB] = @DOB        ,[Age] = @Age        ,[Gender] = @Gender        ,[ConactNo] = @ConactNo        ,[Email] = @Email            WHERE [EId] = @EIdEND
GO
USE [master]
GO
ALTER DATABASE [DemoTest2] SET  READ_WRITE 
GO
