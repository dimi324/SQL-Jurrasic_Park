USE JurassicPark
GO
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Dimitri>
-- Create date: <13.06.2023>
-- Description:	<8 ursprüngliche GPS wieder zurückbringen>
-- =============================================
CREATE OR ALTER PROCEDURE sp_BringBack 
	@Erfolg bit OUTPUT, -- geklappt oder nicht
	@Feedback VARCHAR(MAX) OUTPUT -- Fehlermeldungen etc.
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @ZeitDatID int, @GPSID int, @Pos geography;
BEGIN TRY
	SET @GPSID = 1;
	INSERT INTO dbo.Uhr
	(ZeitDatum) VALUES (CURRENT_TIMESTAMP);
	SET @Feedback = '';
	SET @ZeitDatID = (SELECT MAX(ZeitDatID) FROM Uhr);
	WHILE @GPSID <=8
BEGIN
	SET @POS =  (SELECT Koordinaten FROM ZeitPos WHERE @GPSID=GPSID AND ZeitDatID=1)
	INSERT INTO dbo.ZeitPos
		(GPSID, ZeitDatID, Koordinaten)
		VALUES (@GPSID,@ZeitDatID,@Pos)
	SET @Feedback += 'GPSID ' + CONVERT(nvarchar(max),@GPSID) + ' zurückgesetzt auf ' + CONVERT(nvarchar(max), @Pos) + char(10);
	SET @GPSID += 1;
END;
	SET @Erfolg = 1;
END TRY
BEGIN CATCH
	SET @Erfolg = 0; -- nicht geklappt--
	SET @Feedback = 
			ERROR_MESSAGE() + ' Fehler Nr. '+ CONVERT(varchar, ERROR_NUMBER())
						+ ' Prozedur: '  + ERROR_PROCEDURE()
						+ ' Zeile Nr.: ' + CONVERT(varchar,  ERROR_LINE());
	DELETE FROM dbo.Uhr WHERE ZeitDatID=@ZeitDatID
END CATCH

END
GO
