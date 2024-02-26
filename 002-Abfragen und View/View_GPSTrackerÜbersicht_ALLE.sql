USE [JurassicPark]
GO

/****** Object:  View [dbo].[View_GPSTracker‹bersicht_ALLE]    Script Date: 15.06.2023 14:50:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[View_GPSTracker‹bersicht_ALLE]
AS
SELECT        TOP (100) PERCENT dbo.GPS.GPSID, dbo.Person.Nachname, dbo.Person.Vorname, dbo.Spezies.Spezies, dbo.Dino.Name, Spezies_1.Spezies AS Lieblingsspezies, dbo.Mitarbeiter.Aufgabe, dbo.Person.Telefonnummer
FROM            dbo.Spezies AS Spezies_1 INNER JOIN
                         dbo.Besucher ON Spezies_1.[Spezies ID] = dbo.Besucher.LieblingsSpeciesID RIGHT OUTER JOIN
                         dbo.Person ON dbo.Besucher.PersonID = dbo.Person.PersonID LEFT OUTER JOIN
                         dbo.Mitarbeiter ON dbo.Person.PersonID = dbo.Mitarbeiter.PersonID RIGHT OUTER JOIN
                         dbo.Dino INNER JOIN
                         dbo.Spezies ON dbo.Dino.SpeziesID = dbo.Spezies.[Spezies ID] RIGHT OUTER JOIN
                         dbo.GPS ON dbo.Dino.GPSID = dbo.GPS.GPSID ON dbo.Person.GPSID = dbo.GPS.GPSID
ORDER BY dbo.Person.Nachname, dbo.Person.Vorname, dbo.Spezies.Spezies, dbo.Dino.Name
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
         Begin Table = "Person"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 212
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Besucher"
            Begin Extent = 
               Top = 187
               Left = 224
               Bottom = 300
               Right = 410
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Spezies"
            Begin Extent = 
               Top = 153
               Left = 1111
               Bottom = 283
               Right = 1287
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "GPS"
            Begin Extent = 
               Top = 10
               Left = 1062
               Bottom = 106
               Right = 1229
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Dino"
            Begin Extent = 
               Top = 170
               Left = 681
               Bottom = 300
               Right = 848
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Spezies_1"
            Begin Extent = 
               Top = 174
               Left = 451
               Bottom = 304
               Right = 627
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Mitarbeiter"
            Begin Extent = 
               Top = 0
               Left = 311
               Bottom = 113
               Right = 478
            End
            DisplayFlags = ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_GPSTracker‹bersicht_ALLE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'280
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
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_GPSTracker‹bersicht_ALLE'
GO

EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_GPSTracker‹bersicht_ALLE'
GO


