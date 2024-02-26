USE [JurassicPark]
GO

ALTER TABLE [dbo].[Dino]  WITH CHECK ADD  CONSTRAINT [FK_Dino_Positionszuordnung] FOREIGN KEY([GPSID])
REFERENCES [dbo].[GPS] ([GPSID])
GO

ALTER TABLE [dbo].[Dino] CHECK CONSTRAINT [FK_Dino_Positionszuordnung]
GO


