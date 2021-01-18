CREATE FUNCTION [dbo].[GetOnlyNumbers] (@Temp VARCHAR(1000))
	returns T
	AS
	BEGIN
	 DECLARE @KeepValues AS VARCHAR(50)
    SET @KeepValues = '%[^0-9]%'
    WHILE PATINDEX(@KeepValues, @Temp) > 0
        SET @Temp = STUFF(@Temp, PATINDEX(@KeepValues, @Temp), 1, '')
		RETURN @Temp
	END