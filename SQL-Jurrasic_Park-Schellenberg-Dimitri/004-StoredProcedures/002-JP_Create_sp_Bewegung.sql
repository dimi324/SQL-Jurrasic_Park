USE JurassicPark
GO
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Dimitri>
-- Create date: <13.6.23>
-- Description:	<Bewegungsprozedur>
-- =============================================
CREATE OR ALTER PROCEDURE sp_Bewegung 
	-- Add the parameters for the stored procedure here
	@PosAlt geography,  ---Alte Position
	@Speed float,		---Geschwindigkeit
	@Richtung float,	---Richtung, Wert zwichen 0 und 2*PI()
	----------------------------------------------
	@PosNeu geography OUTPUT, --Neue Position
	@Erfolg bit OUTPUT, -- geklappt oder nicht
	@Feedback VARCHAR(MAX) OUTPUT -- Fehlermeldungen etc.
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
BEGIN TRY
	Set @Speed = @Speed / 12 ; --- Wieviel km  hat das Objekt in 5 min zurückgelegt
	SET @PosNeu =geography::Point(@PosAlt.Lat+COS(@Richtung)*[dbo].[sf_KmInKoordLaenge](@Speed),
								@PosAlt.Long+SIN(@Richtung)*[dbo].[sf_KmInKoordLaenge](@Speed),4326)
	SET @Erfolg = 1;
	SET @Feedback = 'Das Objekt ist von ' + CONVERT(nvarchar(MAX),@PosAlt) 
					+ ' nach ' + CONVERT(nvarchar(MAX),@PosNeu) 
					+ ' gelaufen und hat ' + CONVERT(nvarchar(MAX), @PosNeu.STDistance(@PosAlt))
					+ ' km in 5 min zurückgelegt';
END TRY
BEGIN CATCH
	SET @Erfolg = 0; -- nicht geklappt--
	SET @Feedback = 
			ERROR_MESSAGE() + ' Fehler Nr. '+ CONVERT(varchar, ERROR_NUMBER())
						+ ' Prozedur: '  + ERROR_PROCEDURE()
						+ ' Zeile Nr.: ' + CONVERT(varchar,  ERROR_LINE());
END CATCH

END
GO
