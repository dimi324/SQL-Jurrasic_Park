USE JurassicPark
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE OR ALTER FUNCTION tf_BesucherInfo
(	
	@BesucherID int
)
RETURNS TABLE 
AS
RETURN 
 -- Add the SELECT statement with parameter references here
(

SELECT        TOP (100) PERCENT dbo.Person.Vorname AS BeVN, dbo.Person.Nachname AS BeNN, dbo.Person.Telefonnummer, dbo.Adresse.Adresse, dbo.ZeitPos.Koordinaten, dbo.Spezies.Spezies AS LieblingsDino, dbo.GPS.GPSID, 
                         dbo.Besucher.BesucherID
FROM            dbo.Besucher INNER JOIN
                         dbo.Person ON dbo.Besucher.PersonID = dbo.Person.PersonID INNER JOIN
                         dbo.Adresse ON dbo.Person.AdresseID = dbo.Adresse.AdresseID INNER JOIN
                         dbo.GPS ON dbo.Person.GPSID = dbo.GPS.GPSID INNER JOIN
                         dbo.ZeitPos ON dbo.GPS.GPSID = dbo.ZeitPos.GPSID INNER JOIN
                         dbo.Spezies ON dbo.Besucher.LieblingsSpeciesID = dbo.Spezies.[Spezies ID]
						 WHERE (dbo.Besucher.BesucherID = @BesucherID)
)
GO
