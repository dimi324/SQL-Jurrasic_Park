USE JurassicPark;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Brice>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE OR ALTER FUNCTION [dbo].[sf_ÜberenntMichDerDinoIn5Min]
(
	@PersonID int,
	@DinoID int
)
RETURNS bit
AS
BEGIN
	DECLARE @Ergebnis bit;
	DECLARE @ZeitIDP int;
	DECLARE @ZeitIDD int;
	SET @ZeitIDP = 
	(
	SELECT MAX(ZeitDatID) ---Person Max ZeitID
	FROM ZeitPos 
	WHERE GPSID = 
		(SELECT GPSID FROM Person WHERE Person.PersonID = @PersonID)
	);
	SET @ZeitIDD = 
	(
	SELECT MAX(ZeitDatID)  ----Dino Max ZeitID
	FROM ZeitPos 
	WHERE GPSID = 
		(SELECT GPSID FROM Dino WHERE Dino.DinoID = @DinoID)
	);

	SET @Ergebnis = IIF(dbo.sf_ZeitBisDinoDaIst(@DinoID,[dbo].[sf_DistanceDinoPerson](@DinoID, @PersonID, @ZeitIDP, @ZeitIDD)) <= 5,1,0);
	----SET @Variable = IIF(Ausdruck: x>y / X=2y, Ergebnis wenn wahr, Ergebnis wenn falsch)
	-- Return the result of the function
	RETURN @Ergebnis;
END

