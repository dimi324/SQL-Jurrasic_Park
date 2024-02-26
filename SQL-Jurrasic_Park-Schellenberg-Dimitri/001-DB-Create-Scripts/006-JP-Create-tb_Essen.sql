USE [JurassicPark]
GO

/****** Object:  Table [dbo].[Essen]    Script Date: 15.06.2023 08:53:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Essen](
	[EssenID] [int] IDENTITY(1,1) NOT NULL,
	[DiettypID] [int] NOT NULL,
	[GPS?] [nchar](10) NULL,
	[Essensname] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Essen] PRIMARY KEY CLUSTERED 
(
	[EssenID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Essen]  WITH CHECK ADD  CONSTRAINT [FK_Essen_Typ] FOREIGN KEY([DiettypID])
REFERENCES [dbo].[DietTyp] ([DietTypID])
GO

ALTER TABLE [dbo].[Essen] CHECK CONSTRAINT [FK_Essen_Typ]
GO


