USE [JurassicPark]
GO

ALTER TABLE [dbo].[Person]  WITH CHECK ADD  CONSTRAINT [FK_Person_Adresse] FOREIGN KEY([AdresseID])
REFERENCES [dbo].[Adresse] ([AdresseID])
GO

ALTER TABLE [dbo].[Person] CHECK CONSTRAINT [FK_Person_Adresse]
GO


