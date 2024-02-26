USE JurassicPark
GO

DECLARE @GPSID int, @GebietAnfang geography, @GebietEnde geography;
SET @GPSID=1; ----(Start)Koordinaten (0.05 0.05)
---TEST---DINO im Gebiet
SET @GebietAnfang=geography::Point(0, 0, 4326);
SET @GebietEnde=geography::Point(1, 1, 4326);
PRINT dbo.sf_GPSImGebiet (@GPSID, @GebietAnfang, @GebietEnde);

---TEST---DINO nicht im Gebiet
SET @GebietAnfang=geography::Point(0.5, 0.5, 4326);
SET @GebietEnde=geography::Point(1, 1, 4326);
PRINT dbo.sf_GPSImGebiet (@GPSID, @GebietAnfang, @GebietEnde);

---TEST---DINO nicht im Gebiet--- Anfang und Ende vertauscht
SET @GebietAnfang=geography::Point(1, 1, 4326);
SET @GebietEnde=geography::Point(0.5, 0.5, 4326);
PRINT dbo.sf_GPSImGebiet (@GPSID, @GebietAnfang, @GebietEnde);


---TEST---DINO im Gebiet--- Anfang und Ende vertauscht
SET @GebietAnfang=geography::Point(1, 1, 4326);
SET @GebietEnde=geography::Point(0, 0, 4326);
PRINT dbo.sf_GPSImGebiet (@GPSID, @GebietAnfang, @GebietEnde);