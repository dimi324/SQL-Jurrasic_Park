-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: <Author,,Name>
-- Create date: <Create Date,,>
-- Description: <Description,,>
-- =============================================
CREATE PROCEDURE GetRandomDirection 
@Direction float OUTPUT,
@Erfolg bit OUTPUT,
@Feedback VARCHAR(MAX) OUTPUT
AS
BEGIN
SET NOCOUNT ON;

BEGIN TRY
SET @Direction = RAND() * PI()*2;
SET @Erfolg = 1; -- Setze Erfolg auf 1 (true), um anzuzeigen, dass die Prozedur erfolgreich ausgeführt wurde.
SET @Feedback = 'Die Richtung wurde erfolgreich generiert.'; -- Feedback-Meldung für den Erfolgsfall


END TRY
BEGIN CATCH
SET @Direction = NULL; -- Setze die Richtung auf NULL, um anzuzeigen, dass ein Fehler aufgetreten ist.
SET @Erfolg = 0; -- Setze Erfolg auf 0 (false), um anzuzeigen, dass die Prozedur nicht erfolgreich war.
SET @Feedback = 'Fehler beim Generieren der Richtung: ' + ERROR_MESSAGE(); -- Fehlermeldung in das Feedback einfügen.
END CATCH;
END
GO
