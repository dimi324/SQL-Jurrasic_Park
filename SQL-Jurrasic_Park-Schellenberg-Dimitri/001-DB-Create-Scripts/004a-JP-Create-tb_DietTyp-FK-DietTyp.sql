USE [JurassicPark]
GO

ALTER TABLE [dbo].[DietTyp]  WITH CHECK ADD  CONSTRAINT [FK_DietTyp_Parkteil] FOREIGN KEY([ParkteilID])
REFERENCES [dbo].[Parkteil] ([ParkteilID])
GO

ALTER TABLE [dbo].[DietTyp] CHECK CONSTRAINT [FK_DietTyp_Parkteil]
GO


