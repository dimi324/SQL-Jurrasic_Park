USE [JurassicPark]
GO

ALTER TABLE [dbo].[Besucher]  WITH CHECK ADD  CONSTRAINT [FK_Besucher_Spezies] FOREIGN KEY([LieblingsSpeciesID])
REFERENCES [dbo].[Spezies] ([Spezies ID])
GO

ALTER TABLE [dbo].[Besucher] CHECK CONSTRAINT [FK_Besucher_Spezies]
GO


