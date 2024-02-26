USE [JurassicPark]
GO

/****** Object:  Table [dbo].[Person]    Script Date: 15.06.2023 08:59:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Person](
	[PersonID] [int] IDENTITY(1,1) NOT NULL,
	[Vorname] [nvarchar](50) NOT NULL,
	[Nachname] [nvarchar](50) NOT NULL,
	[Telefonnummer] [nvarchar](20) NOT NULL,
	[AdresseID] [int] NOT NULL,
	[GPSID] [int] NOT NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_Adresse] FOREIGN KEY([AdresseID])
REFERENCES [dbo].[Adresse] ([AdresseID])
GO

ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_Adresse]
GO

ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_Positionszuordnung] FOREIGN KEY([GPSID])
REFERENCES [dbo].[GPS] ([GPSID])
GO

ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_Positionszuordnung]
GO


