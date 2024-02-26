USE JurassicPark
GO
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Dimitri>
-- Create date: <12.6.23>
-- Description:	<Ist der Dino in seinem Gehege?>
-- =============================================
CREATE OR ALTER FUNCTION sf_DinoImGehege
(
	@DinoID int
)
RETURNS bit
AS
BEGIN
	DECLARE @DinoKoord geography, @ParkAnfang geography, @ParkEnde geography,
			@gpsID int, @ZeitID int , 
			@Return bit;

			--GPSID vom Dino mit DinoID
	SET @gpsID = (SELECT dbo.GPS.GPSID FROM dbo.Dino 
					INNER JOIN dbo.GPS 
					ON dbo.Dino.GPSID = dbo.GPS.GPSID
					WHERE dbo.Dino.DinoID = @DinoID
				);
			--letzte aktualisierung
	SET @ZeitID = (SELECT MAX(ZeitDatID) FROM dbo.ZeitPos
				  WHERE dbo.ZeitPos.GPSID = @gpsID);
			--Dino Koordidaten, basierend auf ZeitID und GPSID
	SET @DinoKoord = (SELECT Koordinaten FROM dbo.ZeitPos
					WHERE dbo.ZeitPos.GPSID = @gpsID
					AND dbo.ZeitPos.ZeitDatID = @ZeitID
				 );
				 --Park Anfangskoordinaten
	SET @ParkAnfang = (SELECT dbo.Parkteil.PositionAnfang
					FROM dbo.Dino 
					INNER JOIN dbo.Spezies 
					ON dbo.Dino.SpeziesID = dbo.Spezies.[Spezies ID] 
					INNER JOIN dbo.DietTyp 
					ON dbo.Spezies.DiettypID = dbo.DietTyp.DietTypID 
					INNER JOIN dbo.Parkteil 
					ON dbo.DietTyp.ParkteilID = dbo.Parkteil.ParkteilID
					WHERE @DinoID = dbo.Dino.DinoID
				);
				 --Park Endkoordinaten
	SET @ParkEnde = (SELECT dbo.Parkteil.PositionEnde
					FROM dbo.Dino 
					INNER JOIN dbo.Spezies 
					ON dbo.Dino.SpeziesID = dbo.Spezies.[Spezies ID] 
					INNER JOIN dbo.DietTyp 
					ON dbo.Spezies.DiettypID = dbo.DietTyp.DietTypID 
					INNER JOIN dbo.Parkteil 
					ON dbo.DietTyp.ParkteilID = dbo.Parkteil.ParkteilID
					WHERE @DinoID = dbo.Dino.DinoID
				);
	Return	[dbo].[sf_GPSImGebiet](@GPSID, @ParkAnfang, @ParkEnde)	--@Return
END
GO

