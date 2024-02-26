USE JurassicPark
GO
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Dimitri>
-- Create date: <15.06.2023>
-- Description:	<Dino Übersicht letzte Position>
-- =============================================
CREATE OR ALTER FUNCTION tf_Uebersicht_Dino_zuZeitpunkt
(	
		@ZeitID int
)
RETURNS TABLE 
AS
RETURN 
(
	-- Add the SELECT statement with parameter references here
	SELECT        TOP (100) PERCENT dbo.Uhr.ZeitDatum, dbo.Spezies.Spezies, dbo.Dino.Name, dbo.Spezies.Geschwindigkeit, dbo.DietTyp.Dietname, dbo.Parkteil.Name AS Parkteil, dbo.ZeitPos.Koordinaten
	FROM            dbo.Dino INNER JOIN
                         dbo.Spezies ON dbo.Dino.SpeziesID = dbo.Spezies.[Spezies ID] INNER JOIN
                         dbo.DietTyp ON dbo.Spezies.DiettypID = dbo.DietTyp.DietTypID INNER JOIN
                         dbo.Parkteil ON dbo.DietTyp.ParkteilID = dbo.Parkteil.ParkteilID INNER JOIN
                         dbo.GPS ON dbo.Dino.GPSID = dbo.GPS.GPSID INNER JOIN
                         dbo.ZeitPos ON dbo.GPS.GPSID = dbo.ZeitPos.GPSID INNER JOIN
                         dbo.Uhr ON dbo.ZeitPos.ZeitDatID = dbo.Uhr.ZeitDatID
						 WHERE dbo.ZeitPos.ZeitDatID=@ZeitID
)
GO
