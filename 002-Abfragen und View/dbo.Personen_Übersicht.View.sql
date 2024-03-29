USE [JurassicPark]
GO
/****** Object:  View [dbo].[Personen_Übersicht]    Script Date: 15.06.2023 09:14:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   VIEW  [dbo].[Personen_Übersicht]
AS
SELECT        TOP (100) PERCENT p.PersonID, p.Vorname, p.Nachname, p.Telefonnummer, a.Adresse, CASE WHEN b.BesucherID IS NOT NULL THEN 'Besucher' WHEN m.MitarbeiterID IS NOT NULL THEN 'Mitarbeiter' END AS Status, 
                         dbo.ZeitPos.Koordinaten AS ZeitPosition, dbo.Uhr.ZeitDatum AS Datum
FROM            dbo.ZeitPos INNER JOIN
                         dbo.GPS AS g ON dbo.ZeitPos.GPSID = g.GPSID INNER JOIN
                         dbo.Uhr ON dbo.ZeitPos.ZeitDatID = dbo.Uhr.ZeitDatID RIGHT OUTER JOIN
                         dbo.Person AS p LEFT OUTER JOIN
                         dbo.Adresse AS a ON p.AdresseID = a.AdresseID ON g.GPSID = p.GPSID LEFT OUTER JOIN
                         dbo.Besucher AS b ON p.PersonID = b.PersonID LEFT OUTER JOIN
                         dbo.Mitarbeiter AS m ON p.PersonID = m.PersonID
ORDER BY p.PersonID, p.Vorname, p.Nachname
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
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "p"
            Begin Extent = 
               Top = 48
               Left = 420
               Bottom = 178
               Right = 594
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "a"
            Begin Extent = 
               Top = 228
               Left = 291
               Bottom = 324
               Right = 458
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "g"
            Begin Extent = 
               Top = 218
               Left = 799
               Bottom = 314
               Right = 966
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "b"
            Begin Extent = 
               Top = 68
               Left = 73
               Bottom = 181
               Right = 259
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "m"
            Begin Extent = 
               Top = 16
               Left = 662
               Bottom = 129
               Right = 829
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Uhr"
            Begin Extent = 
               Top = 210
               Left = 1137
               Bottom = 306
               Right = 1304
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ZeitPos"
            Begin Extent = 
               Top = 27
               Left = 952
               Bottom = 157
               Right = 1119
            End
            DisplayFlags = 280
            TopColumn = 0
 ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Personen_Übersicht'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'        End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Personen_Übersicht'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'Personen_Übersicht'
GO
