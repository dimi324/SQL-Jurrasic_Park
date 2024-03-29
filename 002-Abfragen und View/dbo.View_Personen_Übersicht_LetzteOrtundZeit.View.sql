USE [JurassicPark]
GO
/****** Object:  View [dbo].[View_Personen_Übersicht_LetzteOrtundZeit]    Script Date: 15.06.2023 09:14:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[View_Personen_Übersicht_LetzteOrtundZeit]
AS
SELECT        TOP (100) PERCENT dbo.Person.Vorname, dbo.Person.Nachname, dbo.Person.Telefonnummer, dbo.sf_Koord_to_Long(dbo.ZeitPos.Koordinaten) AS Koordinate, dbo.Uhr.ZeitDatum, dbo.GPS.GPSID, dbo.Adresse.Adresse
FROM            dbo.ZeitPos INNER JOIN
                         dbo.GPS ON dbo.ZeitPos.GPSID = dbo.GPS.GPSID INNER JOIN
                         dbo.Uhr ON dbo.ZeitPos.ZeitDatID = dbo.Uhr.ZeitDatID INNER JOIN
                         dbo.Person ON dbo.GPS.GPSID = dbo.Person.GPSID INNER JOIN
                         dbo.Adresse ON dbo.Person.AdresseID = dbo.Adresse.AdresseID INNER JOIN
                         dbo.Besucher ON dbo.Person.PersonID = dbo.Besucher.PersonID
ORDER BY dbo.Person.Vorname, dbo.Person.Nachname
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -192
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Adresse"
            Begin Extent = 
               Top = 109
               Left = 273
               Bottom = 211
               Right = 440
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Besucher"
            Begin Extent = 
               Top = 0
               Left = 503
               Bottom = 113
               Right = 689
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "GPS"
            Begin Extent = 
               Top = 235
               Left = 304
               Bottom = 331
               Right = 471
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ZeitPos"
            Begin Extent = 
               Top = 198
               Left = 618
               Bottom = 328
               Right = 785
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Uhr"
            Begin Extent = 
               Top = 205
               Left = 1060
               Bottom = 301
               Right = 1227
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Person"
            Begin Extent = 
               Top = 7
               Left = 15
               Bottom = 137
               Right = 189
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
       ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Personen_Übersicht_LetzteOrtundZeit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'  Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 2670
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 3885
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Personen_Übersicht_LetzteOrtundZeit'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Personen_Übersicht_LetzteOrtundZeit'
GO
