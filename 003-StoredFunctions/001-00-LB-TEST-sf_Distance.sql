USE JurassicPark;
GO

DECLARE @DinoID int;
DECLARE @PersID int;
DECLARE @ZeitID int;

SET @DinoID = 1;
SET @PersID = 1;
SET @ZeitID = 1;


PRINT [dbo].[sf_DistanceDinoPerson](@DinoID, @PersID, @ZeitID, @ZeitID)