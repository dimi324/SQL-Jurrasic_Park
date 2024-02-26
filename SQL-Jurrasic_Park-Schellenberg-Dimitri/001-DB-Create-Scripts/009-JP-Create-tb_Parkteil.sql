USE [JurassicPark]
GO

/****** Object:  Table [dbo].[Parkteil]    Script Date: 15.06.2023 08:57:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Parkteil](
	[ParkteilID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[PositionAnfang] [geography] NOT NULL,
	[PositionEnde] [geography] NOT NULL,
 CONSTRAINT [PK_Gehege] PRIMARY KEY CLUSTERED 
(
	[ParkteilID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


