USE [JurassicPark];
GO

/****** Object:  UserDefinedFunction [dbo].[sf_Koord_to_Long]    Script Date: 15.06.2023 08:47:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE OR ALTER  FUNCTION [dbo].[sf_Koord_to_Lat] 
(
	@Koord geography
)
RETURNS float
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Long float

	-- Add the T-SQL statements to compute the return value here
	SET @Long = @Koord.Lat;

	-- Return the result of the function
	RETURN @Long;

END
GO


