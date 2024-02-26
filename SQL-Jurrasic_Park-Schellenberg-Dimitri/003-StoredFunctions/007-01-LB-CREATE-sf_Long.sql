USE JurassicPark;
GO
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE OR ALTER FUNCTION sf_Koord_to_Long 
(
	@Koord geography
)
RETURNS float
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Long float

	-- Add the T-SQL statements to compute the return value here
	SET @Long = @Koord.Long;

	-- Return the result of the function
	RETURN @Long;

END
GO

