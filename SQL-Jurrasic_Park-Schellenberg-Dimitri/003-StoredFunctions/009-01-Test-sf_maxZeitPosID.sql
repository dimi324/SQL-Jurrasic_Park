USE JurassicPark
GO
DECLARE @PerID int;

SET @PerID=1;

WHILE @PerID<=6
BEGIN
	IF [dbo].[sf_MaxZeitDatID_Person](@PerID) IS NULL
	PRINT 'Person mit dieser ID existiert nicht'  ---PerID 3 &4 gibt es nicht
	ELSE PRINT [dbo].[sf_MaxZeitDatID_Person](@PerID);  --letzter Zeit Zeitpunkt stimmt.
	
	SET @PerID +=1;
END