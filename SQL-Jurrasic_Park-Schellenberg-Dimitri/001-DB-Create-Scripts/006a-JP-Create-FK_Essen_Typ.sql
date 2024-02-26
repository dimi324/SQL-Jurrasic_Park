USE [JurassicPark]
GO

ALTER TABLE [dbo].[Essen]  WITH CHECK ADD  CONSTRAINT [FK_Essen_Typ] FOREIGN KEY([DiettypID])
REFERENCES [dbo].[DietTyp] ([DietTypID])
GO

ALTER TABLE [dbo].[Essen] CHECK CONSTRAINT [FK_Essen_Typ]
GO


