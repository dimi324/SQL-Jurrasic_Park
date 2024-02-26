USE [JurassicPark]
GO

ALTER TABLE [dbo].[Spezies]  WITH CHECK ADD  CONSTRAINT [CK_Spezies_Geschw] CHECK  (([Geschwindigkeit]>(0)))
GO

ALTER TABLE [dbo].[Spezies] CHECK CONSTRAINT [CK_Spezies_Geschw]
GO

EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Geschw. >0' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Spezies', @level2type=N'CONSTRAINT',@level2name=N'CK_Spezies_Geschw'
GO


