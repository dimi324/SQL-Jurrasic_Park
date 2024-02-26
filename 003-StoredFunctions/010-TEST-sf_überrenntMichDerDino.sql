USE JurassicPark
GO

DECLARE @PersonID int, @DinoID int, @GPSID int, @DinoKoordinaten geography;
DECLARE @PosZeitIDDino Int;
SET @PersonID = 1;
SET @DinoID = 1;

SET @PosZeitIDDino = (SELECT MAX(ZeitDatID)  ----Dino Max ZeitID
						FROM ZeitPos 
						WHERE GPSID = (SELECT GPSID FROM Dino WHERE Dino.DinoID = @DinoID))

SET @DinoKoordinaten = (SELECT dbo.ZeitPos.Koordinaten 
						FROM dbo.Dino 
						INNER JOIN dbo.GPS 
						ON dbo.Dino.GPSID = dbo.GPS.GPSID 
						INNER JOIN dbo.ZeitPos 
						ON dbo.GPS.GPSID = dbo.ZeitPos.GPSID
						WHERE (dbo.Dino.DinoID = @DinoID) AND ZeitDatID=@PosZeitIDDino)

BEGIN TRANSACTION TEST

	UPDATE dbo.ZeitPos
	SET Koordinaten = geography::Point(@DinoKoordinaten.Lat, @DinoKoordinaten.Long, 4326)
	WHERE (ZeitDatID = [dbo].[sf_MaxZeitDatID_Person](@PersonID))
						AND (GPSID=(SELECT GPSID FROM Person WHERE Person.PersonID = @PersonID))
						;
SELECT 'TEST 1 Dino ist bei mir' , [dbo].[sf_ÜberenntMichDerDinoIn5Min] (@PersonID, @DinoID);

ROLLBACK TRANSACTION TEST

BEGIN TRANSACTION TEST

	UPDATE dbo.ZeitPos
	SET Koordinaten = geography::Point(@DinoKoordinaten.Lat-1, @DinoKoordinaten.Long-1, 4326)
	WHERE (ZeitDatID = [dbo].[sf_MaxZeitDatID_Person](@PersonID))
						AND (GPSID=(SELECT GPSID FROM Person WHERE Person.PersonID = @PersonID))
						;
SELECT 'TEST 1 Dino ist weit weg' , [dbo].[sf_ÜberenntMichDerDinoIn5Min] (@PersonID, @DinoID);

ROLLBACK TRANSACTION TEST