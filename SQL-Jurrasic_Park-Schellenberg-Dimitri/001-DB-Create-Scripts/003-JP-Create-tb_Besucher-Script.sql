USE [JurassicPark]
GO

/****** Object:  Table [dbo].[Besucher]    Script Date: 12.06.2023 21:59:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER TABLE [dbo].[Besucher](
	[BesucherID] [int] IDENTITY(1,1) NOT NULL,
	[PersonID] [int] NOT NULL,
	[LieblingsSpeciesID] [int] NOT NULL,
 CONSTRAINT [PK_Besucher] PRIMARY KEY CLUSTERED 
(
	[BesucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Besucher]  WITH CHECK ADD  CONSTRAINT [FK_Besucher_Person] FOREIGN KEY([PersonID])
REFERENCES [dbo].[Person] ([PersonID])
GO

ALTER TABLE [dbo].[Besucher] CHECK CONSTRAINT [FK_Besucher_Person]
GO

ALTER TABLE [dbo].[Besucher]  WITH CHECK ADD  CONSTRAINT [FK_Besucher_Spezies] FOREIGN KEY([LieblingsSpeciesID])
REFERENCES [dbo].[Spezies] ([Spezies ID])
GO

ALTER TABLE [dbo].[Besucher] CHECK CONSTRAINT [FK_Besucher_Spezies]
GO


