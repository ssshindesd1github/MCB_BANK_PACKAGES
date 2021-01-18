CREATE FUNCTION [dbo].[GetOnlyNumbersConvertToDecimal] (@Temp VARCHAR(100))
	RETURNS DECIMAL 
	AS
	BEGIN
	 DECLARE @KeepValues AS VARCHAR(50)
    SET @KeepValues = '%[^0-9]%'
    WHILE PATINDEX(@KeepValues, @Temp) > 0
        SET @Temp = STUFF(@Temp, PATINDEX(@KeepValues, @Temp), 1, '')
		RETURN CONVERT(DECIMAL(18,3),@Temp)
	END