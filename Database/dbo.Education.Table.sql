USE [DemoTest2]
GO
/****** Object:  Table [dbo].[Education]    Script Date: 09/01/2022 5.45.41 PM ******/
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
