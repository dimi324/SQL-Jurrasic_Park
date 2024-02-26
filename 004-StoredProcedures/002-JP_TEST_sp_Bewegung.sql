----TEST Bewegung-----
USE JurassicPark
GO
DECLARE
	@PosAlt geography,  ---Alte Position
	@Speed float,		---Geschwindigkeit
	@Richtung float,	---Richtung
	----------------------------------------------
	@PosNeu geography , --Neue Position
	@Erfolg bit, -- geklappt oder nicht
	@Feedback VARCHAR(MAX); -- Fehlermeldungen etc.

SET @PosAlt = (SELECT Koordinaten
				FROM dbo.ZeitPos
				WHERE ZeitDatID=1 AND GPSID=1);
SET	@Speed = 10;
SET @Richtung = 0;

EXEC dbo.sp_Bewegung
@PosAlt,
@Speed,
@Richtung,
@PosNeu OUTPUT,
@Erfolg OUTPUT,
@Feedback OUTPUT;

SELECT @Speed AS Speed, @Richtung AS Richtung, @PosAlt AS PosAlt, 
@Erfolg AS Erfolg, @Feedback As Feedback, @PosNeu AS NeuePos

---TEST 60km/h geschwindigkeit

USE JurassicPark
GO
DECLARE
	@PosAlt geography,  ---Alte Position
	@Speed float,		---Geschwindigkeit
	@Richtung float,	---Richtung
	----------------------------------------------
	@PosNeu geography , --Neue Position
	@Erfolg bit, -- geklappt oder nicht
	@Feedback VARCHAR(MAX); -- Fehlermeldungen etc.

SET @PosAlt = (SELECT Koordinaten
				FROM dbo.ZeitPos
				WHERE ZeitDatID=1 AND GPSID=1);
SET	@Speed = 60;
SET @Richtung = PI()/2;

EXEC dbo.sp_Bewegung
@PosAlt,
@Speed,
@Richtung,
@PosNeu OUTPUT,
@Erfolg OUTPUT,
@Feedback OUTPUT;

SELECT @Speed AS Speed, @Richtung AS Richtung, @PosAlt AS PosAlt, 
@Erfolg AS Erfolg, @Feedback As Feedback, @PosNeu AS NeuePos


