USE [JurassicPark]
GO

/****** Object:  Table [dbo].[Spezies]    Script Date: 15.06.2023 09:03:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Spezies](
	[Spezies ID] [int] IDENTITY(1,1) NOT NULL,
	[Spezies] [nvarchar](50) NOT NULL,
	[DiettypID] [int] NOT NULL,
	[Geschwindigkeit] [float] NOT NULL,
 CONSTRAINT [PK_Spezies] PRIMARY KEY CLUSTERED 
(
	[Spezies ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Spezies]  WITH CHECK ADD  CONSTRAINT [FK_Spezies_Typ] FOREIGN KEY([DiettypID])
REFERENCES [dbo].[DietTyp] ([DietTypID])
GO

ALTER TABLE [dbo].[Spezies] CHECK CONSTRAINT [FK_Spezies_Typ]
GO

ALTER TABLE [dbo].[Spezies]  WITH CHECK ADD  CONSTRAINT [CK_Spezies_Geschw] CHECK  (([Geschwindigkeit]>(0)))
GO

ALTER TABLE [dbo].[Spezies] CHECK CONSTRAINT [CK_Spezies_Geschw]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Geschw. >0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Spezies', @level2type=N'CONSTRAINT',@level2name=N'CK_Spezies_Geschw'
GO


