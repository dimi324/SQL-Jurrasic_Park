USE [JurassicPark]
GO
/****** Object:  View [dbo].[View_Dino_Übersicht]    Script Date: 15.06.2023 09:14:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Dino_Übersicht]
AS
SELECT        TOP (100) PERCENT dbo.Uhr.ZeitDatum, dbo.Spezies.Spezies, dbo.Dino.Name, dbo.Spezies.Geschwindigkeit, dbo.DietTyp.Dietname, dbo.Parkteil.Name AS Parkteil, dbo.ZeitPos.Koordinaten
FROM            dbo.Dino INNER JOIN
                         dbo.Spezies ON dbo.Dino.SpeziesID = dbo.Spezies.[Spezies ID] INNER JOIN
                         dbo.DietTyp ON dbo.Spezies.DiettypID = dbo.DietTyp.DietTypID INNER JOIN
                         dbo.Parkteil ON dbo.DietTyp.ParkteilID = dbo.Parkteil.ParkteilID INNER JOIN
                         dbo.GPS ON dbo.Dino.GPSID = dbo.GPS.GPSID INNER JOIN
                         dbo.ZeitPos ON dbo.GPS.GPSID = dbo.ZeitPos.GPSID INNER JOIN
                         dbo.Uhr ON dbo.ZeitPos.ZeitDatID = dbo.Uhr.ZeitDatID
ORDER BY dbo.Uhr.ZeitDatum DESC, dbo.Dino.Name, dbo.Spezies.Spezies
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
         Top = -96
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Dino"
            Begin Extent = 
               Top = 16
               Left = 582
               Bottom = 220
               Right = 843
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Spezies"
            Begin Extent = 
               Top = 48
               Left = 286
               Bottom = 178
               Right = 462
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DietTyp"
            Begin Extent = 
               Top = 83
               Left = 56
               Bottom = 248
               Right = 248
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Parkteil"
            Begin Extent = 
               Top = 192
               Left = 289
               Bottom = 322
               Right = 460
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "GPS"
            Begin Extent = 
               Top = 50
               Left = 938
               Bottom = 129
               Right = 1105
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ZeitPos"
            Begin Extent = 
               Top = 42
               Left = 1175
               Bottom = 172
               Right = 1342
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Uhr"
            Begin Extent = 
               Top = 222
               Left = 917
               Bottom = 318
               Right = 1084
            End
            DisplayFlags = 280
  ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Dino_Übersicht'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'          TopColumn = 0
         End
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Dino_Übersicht'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Dino_Übersicht'
GO
