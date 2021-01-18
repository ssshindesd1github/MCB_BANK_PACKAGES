-- =============================================
-- Author:		<SACHIN SHINDE>
-- Create date: <17-01-2021,,>
-- Description:	<usp_GetSupplierData_PKG>
-- =============================================
CREATE PROCEDURE usp_GetSupplierData_PKG	

AS
BEGIN


  ------------------------------ GET supplier table data from raw table ------------------------
	 WITH cte AS
	(   SELECT *, ROW_NUMBER() OVER (PARTITION BY SUPPLIER_NAME ORDER BY SUPPLIER_NAME DESC) AS rn
		FROM XXBCM_ORDER_MGT with (nolock)
	)
	SELECT C.SUPPLIER_NAME,C.SUPP_CONTACT_NAME,dbo.GetOnlyNumbers(case CHARINDEX(',',C.SUPP_CONTACT_NUMBER) when 0 then C.SUPP_CONTACT_NUMBER
			else SUBSTRING(C.SUPP_CONTACT_NUMBER, 1, CHARINDEX(',',C.SUPP_CONTACT_NUMBER) - 1) end) SUPP_CONTACT_NUMBER1, 
	   dbo.GetOnlyNumbers(case CHARINDEX(',',C.SUPP_CONTACT_NUMBER) when 0 then C.SUPP_CONTACT_NUMBER
			else SUBSTRING(C.SUPP_CONTACT_NUMBER, CHARINDEX(',',C.SUPP_CONTACT_NUMBER) + 1, LEN(C.SUPP_CONTACT_NUMBER)) end)  SUPP_CONTACT_NUMBER2,C.SUPP_EMAIL,
			C.SUPP_ADDRESS,C.ORDER_REF AS SUPP_ORDER_NUM
	FROM cte C
	WHERE rn = 1;
END
GO