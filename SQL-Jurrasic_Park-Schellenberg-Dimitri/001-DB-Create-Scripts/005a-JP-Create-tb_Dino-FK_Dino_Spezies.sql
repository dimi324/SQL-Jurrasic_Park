USE [JurassicPark]
GO

ALTER TABLE [dbo].[Dino]  WITH CHECK ADD  CONSTRAINT [FK_Dino_Spezies] FOREIGN KEY([SpeziesID])
REFERENCES [dbo].[Spezies] ([Spezies ID])
GO

ALTER TABLE [dbo].[Dino] CHECK CONSTRAINT [FK_Dino_Spezies]
GO


