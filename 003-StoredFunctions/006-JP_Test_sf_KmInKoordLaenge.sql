DECLARE @A geography, @B geography, @C geography, @d float;

SET @A=geography::Point(0, 0, 4326);

SET @B=geography::Point(1, 0, 4326);

SET @d=@A.STDistance(@B)/1000;  --Abstand
PRINT '---TEST1 Faktor----'
PRINT @d 
--sollte Linear sein-----
PRINT '---TEST2 Linear----'
PRINT [dbo].[sf_KmInKoordLaenge](1)
PRINT [dbo].[sf_KmInKoordLaenge](1)*@d

PRINT [dbo].[sf_KmInKoordLaenge](.1)
PRINT [dbo].[sf_KmInKoordLaenge](.1)*@d

PRINT [dbo].[sf_KmInKoordLaenge](10)
PRINT [dbo].[sf_KmInKoordLaenge](10)*@d

PRINT '---TEST3 Abstand----'
SET @C=geography::Point(0+[dbo].[sf_KmInKoordLaenge](1), 0, 4326);
PRINT @C.STDistance(@A)/1000;   ---Abstand sollte 1 sein