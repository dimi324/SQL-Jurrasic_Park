USE [JurassicPark]
GO

ALTER TABLE [dbo].[Uhr] ADD  CONSTRAINT [DF_Uhr_ZeitDatum]  DEFAULT (getdate()) FOR [ZeitDatum]
GO


