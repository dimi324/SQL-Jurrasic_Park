USE [JurassicPark]
GO

ALTER TABLE [dbo].[Spezies]  WITH CHECK ADD  CONSTRAINT [FK_Spezies_Typ] FOREIGN KEY([DiettypID])
REFERENCES [dbo].[DietTyp] ([DietTypID])
GO

ALTER TABLE [dbo].[Spezies] CHECK CONSTRAINT [FK_Spezies_Typ]
GO


