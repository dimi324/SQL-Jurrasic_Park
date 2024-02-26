USE [JurassicPark]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Brice Zambou>
-- Create date: <Create Date,12.06.2023,>
-- Description:	<Description,Funktion DistanceDinoPerson und Berechnet die Position Dino und Person>
-- =============================================

---- Position Dino und Position Person

CREATE OR ALTER FUNCTION sf_DistanceDinoPerson 
(
	@DinoID int, @PersonID int, @ZeitIDPerson int, @ZeitIDDino int
)
RETURNS float
AS
BEGIN
	-- Declare the return variable here
	DECLARE @PosDino geography ;
	DECLARE @PosPerson geography;

           ---Define @PosDino;

SET @PosDino = ( SELECT  dbo.ZeitPos.Koordinaten
           FROM dbo.Dino INNER JOIN dbo.GPS 
		   ON dbo.Dino.GPSID = dbo.GPS.GPSID INNER JOIN dbo.ZeitPos 
		   ON dbo.GPS.GPSID = dbo.ZeitPos.GPSID
           WHERE (dbo.Dino.DinoID = @DinoID ) AND (dbo.ZeitPos.ZeitDatID = @zeitIDPerson))

		   --- Define @PosPerson; 

SET @PosPerson = ( SELECT dbo.ZeitPos.Koordinaten
             FROM dbo.Person INNER JOIN dbo.GPS 
			 ON dbo.Person.GPSID = dbo.GPS.GPSID INNER JOIN dbo.ZeitPos 
			 ON dbo.GPS.GPSID = dbo.ZeitPos.GPSID
             WHERE (dbo.Person.PersonID = @PersonID ) AND (dbo.ZeitPos.ZeitDatID = @ZeitIDDino))
	
         -- Die Entfernung zwischen PosDino und PosPerson .

 DECLARE @Entfernung float;
 SET @Entfernung = ( SELECT @PosDino.STDistance(@PosPerson))


	     -- Return the result of the function
	RETURN @Entfernung;

END
GO

