USE JurassicPark;
GO
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE OR ALTER PROCEDURE sp_BackupJP
	@path nvarchar(256),
	-------------
	@Erfolg bit OUTPUT,
	@Feedback nvarchar(max) OUTPUT
AS
BEGIN
	DECLARE @dbname NVARCHAR(MAX); -- database name
	DECLARE @backupFile NVARCHAR(MAX); -- backup file name
	DECLARE @fullDBBackupName NVARCHAR(MAX); -- full backup file name with path
	------------------------

	BEGIN TRY 
		DECLARE @t TABLE (FileExists int, FileIsDir int, ParentDirExists int);
		INSERT INTO @t EXEC master.dbo.xp_fileexist @path;
		--SELECT * FROM @t;
		IF ((SELECT FileExists FROM @t) = 1)
				THROW 50100, 'Pfad ist eine Datei', 1
		ELSE IF ((SELECT FileIsDir FROM @t) = 0) AND ((SELECT FileExists FROM @t) = 0) 
		BEGIN
		-- Ordner existiert nicht, ist keine Datei 
			-- @path testen
			BEGIN -- testen ob die Festplatte existiert
				DECLARE @Char3 char(3) = @Path;
					--PRINT @Char3;
				DECLARE @t2 TABLE (FileExists int, FileIsDir int, ParentDirExists int);
				INSERT INTO @t2 EXEC master.dbo.xp_fileexist @Char3;
					-- SELECT * FROM @t2;
				IF (SELECT FileIsDir FROM @t2) = 0
						THROW 50101, 'Festplatte ungültig',1
				ELSE
					BEGIN -- 3) Ordner erstellen
						EXEC master.sys.xp_create_subdir @path;
						PRINT 'Ordner ' + @path + 'erstellt';
					END  -- 3) Ordner erstellen
			END -- testen ob die Festplatte existiert
		END -- Ordner existiert nicht, ist keine Datei
		PRINT 'Pfad existiert, alles OK';
		------BACKUP------------
			BEGIN
				SET @dbname = 'JurassicPark';
				PRINT @dbname + 'sichern';
				SET @fullDBBackupName = @path + @dbname + '-' + FirmaUebung.dbo.sf_Zeitstempel() + '.bak'
				BACKUP DATABASE @dbname TO DISK = @fullDBBackupName; -- DB sichern
			END
		-----------------------------------------------
		SET @Erfolg = 1;
		SET @Feedback = 'Alles OK!';
	END TRY
	BEGIN CATCH
		SET @Erfolg = 0; -- nicht geklappt--
		-- @Feedback text OUTPUT --Fehlermeldungen etc.
		SET @Feedback = 
		ERROR_MESSAGE() + ' Fehler Nr. ' + CONVERT(varchar, ERROR_NUMBER())
		+ ' Prozedur: ' + ERROR_PROCEDURE()
		+ ' Zeile Nr.: ' + CONVERT(varchar, ERROR_LINE());
	END CATCH;
END
GO
