USE [JurassicPark]
GO

/****** Object:  Table [dbo].[Adresse]    Script Date: 12.06.2023 21:56:56 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER TABLE [dbo].[Adresse](
	[AdresseID] [int] IDENTITY(1,1) NOT NULL,
	[Adresse] [nvarchar](50) NULL,
 CONSTRAINT [PK_Adresse] PRIMARY KEY CLUSTERED 
(
	[AdresseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


