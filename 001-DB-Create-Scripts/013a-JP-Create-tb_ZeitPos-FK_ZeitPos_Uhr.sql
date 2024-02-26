USE [JurassicPark]
GO

ALTER TABLE [dbo].[ZeitPos]  WITH CHECK ADD  CONSTRAINT [FK_ZeitPos_Uhr] FOREIGN KEY([ZeitDatID])
REFERENCES [dbo].[Uhr] ([ZeitDatID])
GO

ALTER TABLE [dbo].[ZeitPos] CHECK CONSTRAINT [FK_ZeitPos_Uhr]
GO


