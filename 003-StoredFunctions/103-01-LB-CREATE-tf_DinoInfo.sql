USE JurassicPark;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<BRICE>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE OR ALTER FUNCTION tf_DinoInfo 
(	
	@DinoID int
)
RETURNS TABLE 
AS
RETURN 
(
	SELECT TOP (100) PERCENT dbo.Dino.DinoID, dbo.Dino.Name, dbo.Dino.GPSID, dbo.Spezies.Spezies, dbo.Spezies.Geschwindigkeit, dbo.DietTyp.Dietname, dbo.Essen.Essensname
	FROM dbo.Dino INNER JOIN
        dbo.Spezies ON dbo.Dino.SpeziesID = dbo.Spezies.[Spezies ID] INNER JOIN
        dbo.DietTyp ON dbo.Spezies.DiettypID = dbo.DietTyp.DietTypID INNER JOIN
	   dbo.Essen ON dbo.DietTyp.DietTypID = dbo.Essen.DiettypID
	WHERE (dbo.Dino.DinoID = @DinoID)
	ORDER BY dbo.Essen.Essensname
)
GO