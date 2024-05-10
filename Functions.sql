-- Bernard Kirk Katamanso
-- Functions Scripts
-- 22-02-2005
-- 3/14/2024

CREATE FUNCTION ConcatenateNames (@Name1 nvarchar(25),@Name2 nvarchar(25),@Name3 nvarchar(25),@Title nvarchar(10))
-- Purpose: Concatenates name parts, handles nulls, trims spaces
-- Parameters: name1, name2, name3 and title
-- Returns: "name1 name2 name3, title"
RETURNS VARCHAR(85)
AS
BEGIN
	DECLARE @Result VARCHAR(75);
	SET @Result = ISNULL(TRIM(@Name1),'')+' '+
				  ISNULL(TRIM(@Name2),'')+' '+
				  ISNULL(TRIM(@Name2),'')+
				  TRIM(ISNULL(','+'('+ @Title+')',N''));

	SET @Result = TRIM(@Result);
	Return @Result
END