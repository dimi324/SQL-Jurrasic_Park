USE JurassicPark;
GO

-- Test sf_ZeitBisABC

PRINT [dbo].[sf_ZeitBisDinoDaIst](2,1000) -- 10 Km/Std, 6 Min. OK
PRINT [dbo].[sf_ZeitBisDinoDaIst](1,1000) -- 20 Km/Std, 3 Min. OK