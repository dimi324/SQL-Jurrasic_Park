USE [JurassicPark]
GO

ALTER TABLE [dbo].[ZeitPos]  WITH CHECK ADD  CONSTRAINT [FK_ZeitPos_Positionszuordnung] FOREIGN KEY([GPSID])
REFERENCES [dbo].[GPS] ([GPSID])
GO

ALTER TABLE [dbo].[ZeitPos] CHECK CONSTRAINT [FK_ZeitPos_Positionszuordnung]
GO


