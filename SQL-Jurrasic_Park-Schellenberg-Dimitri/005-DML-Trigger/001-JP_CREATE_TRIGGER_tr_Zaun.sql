USE JurassicPark
GO
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Dimitri>
-- Create date: <14.06.2023>
-- Description:	<Zaun sorgt dafür, dass Dinos Ihr Gehege nicht verlassen und Personen im Park bleiben>
-- =============================================
CREATE OR ALTER TRIGGER tr_Zaun 
   ON  dbo.ZeitPos 
   INSTEAD OF INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @PosNeu geography, @PosAlt geography, @PosNeuTMP geography, 
			@ParkEndeLat float, @ParkEndeLong float,
			@ParkAnfangLat float, @ParkAnfangLong float,
			@GPSID int, @ZeitDatID int, @ZeitDatIDAlt int;
    -- Insert statements for trigger here
	SET @PosNeu = (SELECT Koordinaten FROM inserted);
	SET @PosNeuTMP =@PosNeu;
	SET @GPSID = (SELECT GPSID FROM inserted);
	SET @ZeitDatID = (SELECT ZeitDatID FROM inserted);
	SET @ZeitDatIDAlt = (SELECT MAX(ZeitDatID) FROM dbo.ZeitPos WHERE @GPSID=GPSID)
	SET @PosAlt = (SELECT Koordinaten FROM dbo.ZeitPos WHERE @GPSID=GPSID AND @ZeitDatIDAlt=ZeitDatID)
	
	IF @GPSID IN (SELECT GPSID FROM Dino)
		BEGIN
					----Suche ParkEnde und Parkanfang aus zugehörigem Parkteil
			SET @ParkEndeLat = IIF(	(SELECT Max(PositionEnde.Lat) FROM dbo.View_Übersicht_Parkteil_Dino WHERE GPSID=@GPSID) 
									> (SELECT Max(PositionAnfang.Lat) FROM dbo.View_Übersicht_Parkteil_Dino WHERE GPSID=@GPSID)
									, (SELECT Max(PositionEnde.Lat) FROM dbo.View_Übersicht_Parkteil_Dino WHERE GPSID=@GPSID)
									, (SELECT Max(PositionAnfang.Lat) FROM dbo.View_Übersicht_Parkteil_Dino WHERE GPSID=@GPSID))
			SET @ParkAnfangLat = IIF(	(SELECT Min(PositionEnde.Lat) FROM dbo.View_Übersicht_Parkteil_Dino WHERE GPSID=@GPSID) 
									< (SELECT Min(PositionAnfang.Lat) FROM dbo.View_Übersicht_Parkteil_Dino WHERE GPSID=@GPSID)
									, (SELECT Min(PositionEnde.Lat) FROM dbo.View_Übersicht_Parkteil_Dino WHERE GPSID=@GPSID)
									, (SELECT Min(PositionAnfang.Lat) FROM dbo.View_Übersicht_Parkteil_Dino WHERE GPSID=@GPSID))
			SET @ParkEndeLong = IIF(	(SELECT Max(PositionEnde.Long) FROM dbo.View_Übersicht_Parkteil_Dino WHERE GPSID=@GPSID) 
									> (SELECT Max(PositionAnfang.Long) FROM dbo.View_Übersicht_Parkteil_Dino WHERE GPSID=@GPSID)
									, (SELECT Max(PositionEnde.Long) FROM dbo.View_Übersicht_Parkteil_Dino WHERE GPSID=@GPSID)
									, (SELECT Max(PositionAnfang.Long) FROM dbo.View_Übersicht_Parkteil_Dino WHERE GPSID=@GPSID))
			SET @ParkAnfangLong = IIF(	(SELECT Min(PositionEnde.Long) FROM dbo.View_Übersicht_Parkteil_Dino WHERE GPSID=@GPSID) 
									< (SELECT Min(PositionAnfang.Long) FROM dbo.View_Übersicht_Parkteil_Dino WHERE GPSID=@GPSID)
									, (SELECT Min(PositionEnde.Long) FROM dbo.View_Übersicht_Parkteil_Dino WHERE GPSID=@GPSID)
									, (SELECT Min(PositionAnfang.Long) FROM dbo.View_Übersicht_Parkteil_Dino WHERE GPSID=@GPSID))
	END
	ELSE   ----Für Personen
		BEGIN
					----Suche ParkEnde und Parkanfang aus allen Parkteilen
			SET @ParkEndeLat = IIF(	(SELECT Max(PositionEnde.Lat) FROM dbo.Parkteil) 
									> (SELECT Max(PositionAnfang.Lat) FROM dbo.Parkteil)
									, (SELECT Max(PositionEnde.Lat) FROM dbo.Parkteil)
									, (SELECT Max(PositionAnfang.Lat) FROM dbo.Parkteil))
			SET @ParkAnfangLat = IIF(	(SELECT Min(PositionEnde.Lat) FROM dbo.Parkteil) 
									< (SELECT Min(PositionAnfang.Lat) FROM dbo.Parkteil)
									, (SELECT Min(PositionEnde.Lat) FROM dbo.Parkteil)
									, (SELECT Min(PositionAnfang.Lat) FROM dbo.Parkteil))
			SET @ParkEndeLong = IIF(	(SELECT Max(PositionEnde.Long) FROM dbo.Parkteil) 
									> (SELECT Max(PositionAnfang.Long) FROM dbo.Parkteil)
									, (SELECT Max(PositionEnde.Long) FROM dbo.Parkteil)
									, (SELECT Max(PositionAnfang.Long) FROM dbo.Parkteil))
			SET @ParkAnfangLong = IIF(	(SELECT Min(PositionEnde.Long) FROM dbo.Parkteil) 
									< (SELECT Min(PositionAnfang.Long) FROM dbo.Parkteil)
									, (SELECT Min(PositionEnde.Long) FROM dbo.Parkteil)
									, (SELECT Min(PositionAnfang.Long) FROM dbo.Parkteil))
		END;
					------Abfrage Grenze erreicht oder nicht und Änderung der Endposition 10m vom Zaun weg
		IF @PosAlt.Lat <= @ParkEndeLat AND @PosNeu.Lat > @ParkEndeLat
			SET  @PosNeu = geography::Point(@ParkEndeLat - dbo.sf_KmInKoordLaenge (.01), @PosNeu.Long, 4326);
		IF @PosAlt.Lat <= @ParkAnfangLat AND @PosNeu.Lat > @ParkAnfangLat
			SET  @PosNeu = geography::Point(@ParkAnfangLat + dbo.sf_KmInKoordLaenge (.01), @PosNeu.Long, 4326);
		IF @PosAlt.Long <= @ParkEndeLong AND @PosNeu.Long > @ParkEndeLong
			SET  @PosNeu = geography::Point(@PosNeu.Lat, @ParkEndeLong - dbo.sf_KmInKoordLaenge (.01), 4326);
		IF @PosAlt.Long <= @ParkAnfangLong AND @PosNeu.Long > @ParkAnfangLong
			SET  @PosNeu = geography::Point(@PosNeu.Lat, @ParkAnfangLong + dbo.sf_KmInKoordLaenge (.01), 4326);
		IF @PosNeu.Lat <> @PosNeuTMP.Lat OR @PosNeu.Long <> @PosNeuTMP.Long
			PRINT 'Der Grenzzaun von ' + CONVERT(nvarchar(MAX) ,@GPSID) 
				+ ' wurde erreicht und das Objekt geht anstelle der Position ' 
				+ CONVERT(nvarchar(MAX) ,@PosNeuTMP) + ' zur Position ' 
				+ CONVERT(nvarchar(MAX) ,@PosNeu) + ' ' 

	INSERT INTO dbo.ZeitPos
	(GPSID, ZeitDatID, Koordinaten)
	VALUES(@GPSID, @ZeitDatID, @PosNeu)

END
GO
