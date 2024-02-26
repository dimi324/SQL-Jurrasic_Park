USE [JurassicPark]
GO

/****** Object:  Table [dbo].[GPS]    Script Date: 15.06.2023 08:55:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[GPS](
	[GPSID] [int] IDENTITY(1,1) NOT NULL,
	[Kommentar] [nvarchar](50) NULL,
 CONSTRAINT [PK_Positionszuordnung] PRIMARY KEY CLUSTERED 
(
	[GPSID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

