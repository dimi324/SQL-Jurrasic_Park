USE [JurassicPark]
GO
/****** Object:  View [dbo].[View_Übersicht_Zeit_Ort]    Script Date: 15.06.2023 09:14:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Übersicht_Zeit_Ort]
AS
SELECT        dbo.Uhr.ZeitDatum, dbo.ZeitPos.Koordinaten, dbo.Person.Nachname, dbo.Person.Vorname, dbo.Dino.Name, dbo.Spezies.Spezies, dbo.Spezies.Geschwindigkeit, dbo.DietTyp.Dietname, dbo.Parkteil.Name AS Parkteil
FROM            dbo.ZeitPos FULL OUTER JOIN
                         dbo.GPS ON dbo.ZeitPos.GPSID = dbo.GPS.GPSID FULL OUTER JOIN
                         dbo.Person ON dbo.GPS.GPSID = dbo.Person.GPSID FULL OUTER JOIN
                         dbo.Uhr ON dbo.ZeitPos.ZeitDatID = dbo.Uhr.ZeitDatID FULL OUTER JOIN
                         dbo.Spezies INNER JOIN
                         dbo.Parkteil INNER JOIN
                         dbo.DietTyp ON dbo.Parkteil.ParkteilID = dbo.DietTyp.ParkteilID ON dbo.Spezies.DiettypID = dbo.DietTyp.DietTypID RIGHT OUTER JOIN
                         dbo.Dino ON dbo.Spezies.[Spezies ID] = dbo.Dino.SpeziesID ON dbo.GPS.GPSID = dbo.Dino.GPSID
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
         Begin Table = "DietTyp"
            Begin Extent = 
               Top = 6
               Left = 243
               Bottom = 119
               Right = 410
            End
            DisplayFlags = 344
            TopColumn = 0
         End
         Begin Table = "Dino"
            Begin Extent = 
               Top = 175
               Left = 294
               Bottom = 305
               Right = 461
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "GPS"
            Begin Extent = 
               Top = 6
               Left = 653
               Bottom = 102
               Right = 820
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Parkteil"
            Begin Extent = 
               Top = 26
               Left = 1141
               Bottom = 164
               Right = 1312
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Person"
            Begin Extent = 
               Top = 222
               Left = 1160
               Bottom = 352
               Right = 1334
            End
            DisplayFlags = 344
            TopColumn = 0
         End
         Begin Table = "Spezies"
            Begin Extent = 
               Top = 79
               Left = 15
               Bottom = 209
               Right = 191
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Uhr"
            Begin Extent = 
               Top = 236
               Left = 802
               Bottom = 332
               Right = 969
            End
            DisplayFlags = 344
      ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Übersicht_Zeit_Ort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'      TopColumn = 0
         End
         Begin Table = "ZeitPos"
            Begin Extent = 
               Top = 246
               Left = 496
               Bottom = 376
               Right = 663
            End
            DisplayFlags = 344
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 11
         Width = 284
         Width = 2430
         Width = 1500
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Übersicht_Zeit_Ort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_Übersicht_Zeit_Ort'
GO
