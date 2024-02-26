DECLARE @OutputDirection float;
DECLARE @OutputSuccess bit;
DECLARE @OutputFeedback VARCHAR(MAX);


EXEC GetRandomDirection @OutputDirection OUTPUT, @OutputSuccess OUTPUT, @OutputFeedback OUTPUT;

SELECT @OutputDirection AS Direction, @OutputSuccess AS Success, @OutputFeedback AS Feedback;