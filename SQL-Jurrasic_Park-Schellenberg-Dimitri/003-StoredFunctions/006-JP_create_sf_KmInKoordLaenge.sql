USE JurassicPark
GO
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Dimitri>
-- Create date: <12.6.23>
-- Description:	<Umrechnungsfaktor für Input in km, sodass man mit Dezimalkoordinaten arbeiten kann>
-- =============================================
CREATE OR ALTER FUNCTION sf_KmInKoordLaenge
(
		@kmdist float
)
RETURNS float
AS
BEGIN
RETURN @kmdist/110.574;   ---Umrechnungsfaktor
END
GO

