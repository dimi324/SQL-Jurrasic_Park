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
CREATE OR ALTER PROCEDURE sp_EveryoneMove 
	@Erfolg bit OUTPUT, -- geklappt oder nicht
	@Feedback VARCHAR(MAX) OUTPUT -- Fehlermeldungen etc.
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @ZeitDatIDAlt int,
			@ZeitDatID int,
			@PosAlt geography,  ---Alte Position
			@Speed float,		---Geschwindigkeit
			@Richtung float,	---Richtung
			@GPSID int, 
			@Pos geography,
			@Feedback2 VARCHAR(MAX);
BEGIN TRY
	
	SET @Feedback = '';
	INSERT INTO dbo.Uhr
	(ZeitDatum) VALUES (CURRENT_TIMESTAMP);
	SET @ZeitDatID = (SELECT MAX(ZeitDatID) FROM Uhr);
			IF CURSOR_STATUS('global','EMove_Cursor')>=-1
			BEGIN
				CLOSE EMove_Cursor;
				DEALLOCATE EMove_Cursor
			END
	DECLARE EMove_Cursor CURSOR FOR
			SELECT GPSID
			FROM dbo.GPS
		OPEN EMove_Cursor;
		FETCH NEXT FROM EMove_Cursor INTO @GPSID
		WHILE @@FETCH_STATUS = 0
		BEGIN
			SET @ZeitDatIDAlt = (SELECT MAX(ZeitDatID) FROM ZeitPos WHERE @GPSID=GPSID);
			SET @PosAlt = (SELECT Koordinaten
						FROM dbo.ZeitPos
						WHERE ZeitDatID=@ZeitDatIDAlt AND GPSID=@GPSID);
			SET @Speed = COALESCE((SELECT dbo.Spezies.Geschwindigkeit FROM dbo.Dino INNER JOIN
                         dbo.Spezies ON dbo.Dino.SpeziesID = dbo.Spezies.[Spezies ID] WHERE @GPSID=GPSID),5)
			SET @Richtung = RAND() * PI()*2;

			EXEC dbo.sp_Bewegung
			@PosAlt,
			@Speed,
			@Richtung,
			@Pos OUTPUT,
			@Erfolg OUTPUT,
			@Feedback2 OUTPUT;


			INSERT INTO dbo.ZeitPos
				(GPSID, ZeitDatID, Koordinaten)
				VALUES (@GPSID,@ZeitDatID,@Pos)
			SET @Feedback += @Feedback2 + char(10) + 'GPSID ' + CONVERT(nvarchar(max),@GPSID) + ' hat sich bewegt ' + char(10);
			FETCH NEXT FROM EMove_Cursor INTO @GPSID
		END;
	CLOSE EMove_Cursor;
	DEALLOCATE EMove_Cursor;
	SET @Erfolg = 1;
END TRY
BEGIN CATCH
	SET @Erfolg = 0; -- nicht geklappt--
	SET @Feedback = 
			ERROR_MESSAGE() + ' Fehler Nr. '+ CONVERT(varchar, ERROR_NUMBER())
						+ ' Prozedur: '  + ERROR_PROCEDURE()
						+ ' Zeile Nr.: ' + CONVERT(varchar,  ERROR_LINE());
	DELETE FROM dbo.Uhr WHERE ZeitDatID=@ZeitDatID
			IF CURSOR_STATUS('global','EMove_Cursor')>=-1
			BEGIN
				CLOSE EMove_Cursor;
				DEALLOCATE EMove_Cursor
			END

END CATCH

END
GO
