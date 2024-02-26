USE [JurassicPark]
GO

ALTER TABLE [dbo].[Besucher]  WITH CHECK ADD  CONSTRAINT [FK_Besucher_Person] FOREIGN KEY([PersonID])
REFERENCES [dbo].[Person] ([PersonID])
GO

ALTER TABLE [dbo].[Besucher] CHECK CONSTRAINT [FK_Besucher_Person]
GO


