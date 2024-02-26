USE JurassicPark
GO


DECLARE @Erfolg bit, @Feedback VARCHAR(MAX);

EXEC [dbo].[sp_BringBack]
@Erfolg OUTPUT,
@Feedback OUTPUT;

PRINT @Erfolg
Print @Feedback;