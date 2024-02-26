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
CREATE OR ALTER FUNCTION [dbo].[sf_ZeitBisDinoDaIst] 
(
	@DinoID int,
	@Distance float -- Meter
)
RETURNS smallint
AS
BEGIN
	-- Declare the return variable here
	DECLARE @ZeitBisSec smallint;
	DECLARE @ZeitBisMin smallint;

	-- 1. Geschwindigkeit 
	DECLARE @DinoSpeedKmStd float;
	DECLARE @DinoSpeedMSec float;
	SET @DinoSpeedKmStd =
	(
		SELECT dbo.Spezies.Geschwindigkeit
		FROM dbo.Dino INNER JOIN
			dbo.Spezies ON dbo.Dino.SpeziesID = dbo.Spezies.[Spezies ID]
		WHERE (dbo.Dino.DinoID = @DinoID)
	)

	SET @DinoSpeedMSec = @DinoSpeedKmStd * 1000 / 3600; 

	SET @ZeitBisSec = @Distance / @DinoSpeedMSec;
	SET @ZeitBisMin = @ZeitBisSec/60;

	-- Return the result of the function
	RETURN @ZeitBisMin;

END
