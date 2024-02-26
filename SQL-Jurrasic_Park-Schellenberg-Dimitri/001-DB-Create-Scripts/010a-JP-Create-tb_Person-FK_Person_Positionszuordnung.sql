USE [JurassicPark]
GO

ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_Positionszuordnung] FOREIGN KEY([GPSID])
REFERENCES [dbo].[GPS] ([GPSID])
GO

ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_Positionszuordnung]
GO


