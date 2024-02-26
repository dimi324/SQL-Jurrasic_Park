USE JurassicPark
GO

DECLARE
	@path nvarchar(256),
	-------------
	@Erfolg bit ,
	@Feedback nvarchar(max);

SET @path = 'C:\SQL-Kurs\SQL-Jurrasic_Park-Schellenberg-Dimitri\006-BackUp\';

EXEC [dbo].[sp_BackupJP]
		@Path,
		@Erfolg OUTPUT,
		@Feedback OUTPUT;

SELECT @ERFOLG, @Feedback;