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
-- Description:	<GPSID in einem Gebiet?>
-- =============================================
CREATE OR ALTER FUNCTION sf_GPSImGebiet
(	@GPSID int, @GebietAnfang geography, @GebietEnde geography
)
RETURNS bit
AS
BEGIN
	DECLARE @TestKoord geography,
			@ZeitID int , 
			@Return bit;
			--letzte aktualisierung
	SET @ZeitID = (SELECT MAX(ZeitDatID) FROM dbo.ZeitPos
				  WHERE dbo.ZeitPos.GPSID = @gpsID);
			--GPS Koordidaten, basierend auf ZeitID und GPSID
	SET @TestKoord = (SELECT Koordinaten FROM dbo.ZeitPos
					WHERE dbo.ZeitPos.GPSID = @gpsID
					AND dbo.ZeitPos.ZeitDatID = @ZeitID
				 );
		--Test ob GPS innerhalb der Koordinaten ist, 4fache ausführung
				--da Test Endkoordinaten nicht immer größer als Anfangskoordinaten sein müssen.
	IF (@TestKoord.Long Between @GebietAnfang.Long and @GebietEnde.Long)
	AND (@TestKoord.Lat Between @GebietAnfang.Lat and @GebietEnde.Lat)
		SET @Return=1   ---GPS im Teilgebiet
		ELSE
	IF (@TestKoord.Long Between @GebietAnfang.Long and @GebietEnde.Long)
	AND (@TestKoord.Lat Between @GebietEnde.Lat and @GebietAnfang.Lat)
		SET @Return=1   ---GPS im Teilgebiet
		ELSE
	IF (@TestKoord.Long Between @GebietEnde.Long and @GebietAnfang.Long)
	AND (@TestKoord.Lat Between @GebietAnfang.Lat and @GebietEnde.Lat)
		SET @Return=1   ---GPS im Teilgebiet
		ELSE
	IF (@TestKoord.Long Between @GebietEnde.Long and @GebietAnfang.Long)
	AND (@TestKoord.Lat Between @GebietEnde.Lat and @GebietAnfang.Lat)
		SET @Return=1   ---GPS im Teilgebiet
		ELSE SET @Return=0; --GPS nicht da

	Return @Return
END
GO

