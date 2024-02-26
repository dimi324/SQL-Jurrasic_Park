USE JurassicPark;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE OR ALTER FUNCTION sf_MaxZeitDatID_Person 
(
	@PersonID int
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @MaxZeitDatID int;

	-- Add the T-SQL statements to compute the return value here
	SET @MaxZeitDatID = 
	(
		SELECT MAX(dbo.Uhr.ZeitDatID) AS maxZeitDat
		FROM dbo.Person INNER JOIN
			dbo.GPS ON dbo.Person.GPSID = dbo.GPS.GPSID INNER JOIN
			dbo.ZeitPos ON dbo.GPS.GPSID = dbo.ZeitPos.GPSID INNER JOIN
			dbo.Uhr ON dbo.ZeitPos.ZeitDatID = dbo.Uhr.ZeitDatID
		WHERE (dbo.Person.PersonID = @PersonID)	
	)

	-- Return the result of the function
	RETURN @MaxZeitDatID;

END
GO

