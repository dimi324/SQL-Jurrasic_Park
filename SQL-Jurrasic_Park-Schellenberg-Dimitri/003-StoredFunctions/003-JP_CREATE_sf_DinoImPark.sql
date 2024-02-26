USE [JurassicPark]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Dimitri>
-- Create date: <12.6.23>
-- Description:	<Ist der Dino in Park?>
-- =============================================
CREATE OR ALTER FUNCTION [dbo].[sf_DinoImPark]
(
	@DinoID int
)
RETURNS bit
AS
BEGIN
	DECLARE @Koord geography, @ParkAnfang geography, @ParkEnde geography,
			@gpsID int, @ZeitID int ,@ParkteilID int,
			@Return int;
	---TEST Dino im Gehege?
	SET @Return = dbo.sf_DinoImGehege(@DinoID);
	--FAlls nicht
	IF @Return <> 1
	BEGIN

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
		SET @Koord = (SELECT Koordinaten FROM dbo.ZeitPos
						WHERE dbo.ZeitPos.GPSID = @gpsID
						AND dbo.ZeitPos.ZeitDatID = @ZeitID
					 );
			---Cursor checkt alle Parkteile---
		DECLARE DinoImPark_Cursor CURSOR FOR
			SELECT dbo.Parkteil.ParkteilID
			FROM dbo.Parkteil
		OPEN DinoImPark_Cursor;
			FETCH NEXT FROM DinoImPark_Cursor INTO @ParkteilID
			WHILE @@FETCH_STATUS = 0
			BEGIN
				SET @ParkAnfang = (SELECT dbo.Parkteil.PositionAnfang
								FROM dbo.Parkteil
								WHERE ParkteilID=@ParkteilID
							);
				SET @ParkEnde = (SELECT dbo.Parkteil.PositionEnde
								FROM dbo.Parkteil 
								WHERE ParkteilID=@ParkteilID
							);
				SET @Return += dbo.sf_GPSImGebiet(@gpsID, @ParkAnfang, @ParkEnde)
			
				FETCH NEXT FROM DinoImPark_Cursor INTO @ParkteilID
			END
			CLOSE DinoImPark_Cursor;
			DEALLOCATE DinoImPark_Cursor;
	END
	Return IIF(@Return>0,1,0)
END
GO


