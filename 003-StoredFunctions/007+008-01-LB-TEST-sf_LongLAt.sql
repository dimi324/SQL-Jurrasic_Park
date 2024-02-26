USE JurassicPark
GO

DECLARE @A geography;

SET @A=geography::Point(10, -10, 4326)

PRINT 'TEST 1 Lat'

PRINT @A.Lat;

PRINT [dbo].[sf_Koord_to_Lat](@A);  ----sind gleicht

PRINT 'TEST 2 Long'

PRINT @A.Long;

PRINT [dbo].[sf_Koord_to_Long](@A);  ----sind gleicht