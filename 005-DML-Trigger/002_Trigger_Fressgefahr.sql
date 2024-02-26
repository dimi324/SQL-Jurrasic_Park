USE JurassicPark
GO
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Dimitri>
-- Create date: <15.6.23>
-- Description:	<Trigger falls Dino und Personen zu nah sind>
-- =============================================
CREATE TRIGGER tr_Fressgefahr 
ON dbo.ZeitPos
   FOR INSERT

AS 
BEGIN
	DECLARE @DinoID int, @PersonID int, @GPSID int;

	BEGIN TRY
	IF (SELECT GPSID FROM INSERTED) IN (SELECT GPSID FROM Person)   -----Wenn Person sich bewegt hat
		BEGIN
			SET @GPSID = (SELECT GPSID FROM INSERTED);
			SET @PersonID = (SELECT PersonID FROM Person WHERE GPSID=@GPSID)
			IF CURSOR_STATUS('global','Dino_Cursor')>=-1
			BEGIN
				CLOSE Dino_Cursor
				DEALLOCATE Dino_Cursor
			END

			DECLARE Dino_Cursor CURSOR FOR       ----Alle Dinos abrufen
			SELECT DinoID
			FROM dbo.Dino
			OPEN Dino_Cursor;
			FETCH NEXT FROM Dino_Cursor INTO @DinoID
			WHILE @@FETCH_STATUS = 0
			BEGIN
				IF [dbo].[sf_ÜberenntMichDerDinoIn5Min](@PersonID,@DinoID)=1   ----Test Überrennt nich der Dino
				PRINT 'LAUF!';

				FETCH NEXT FROM Dino_Cursor INTO @DinoID
			END
		END
	ELSE			----Wenn der Dino sich bewegt hat
		BEGIN
			SET @GPSID = (SELECT GPSID FROM INSERTED);
			SET @DinoID = (SELECT DinoID FROM Dino WHERE GPSID=@GPSID)
			IF CURSOR_STATUS('global','Person_Cursor')>=-1
			BEGIN
				CLOSE Person_Cursor
				DEALLOCATE Person_Cursor
			END

			DECLARE Person_Cursor CURSOR FOR    ----Alle Personen abrufen
			SELECT PersonID
			FROM dbo.Person
			OPEN Person_Cursor;
			FETCH NEXT FROM Person_Cursor INTO @PersonID
			WHILE @@FETCH_STATUS = 0
			BEGIN
				IF [dbo].[sf_ÜberenntMichDerDinoIn5Min](@PersonID,@DinoID)=1 ---Test Überrennt nich der Dino
				PRINT 'LAUF!';

				FETCH NEXT FROM Person_Cursor INTO @PersonID
			END
		END;
		END TRY
	BEGIN CATCH
			IF CURSOR_STATUS('global','Dino_Cursor')>=-1
			BEGIN
				CLOSE Dino_Cursor
				DEALLOCATE Dino_Cursor
			END
			IF CURSOR_STATUS('global','Person_Cursor')>=-1
			BEGIN
				CLOSE Person_Cursor
				DEALLOCATE Person_Cursor
			END
	END CATCH;

END
GO
