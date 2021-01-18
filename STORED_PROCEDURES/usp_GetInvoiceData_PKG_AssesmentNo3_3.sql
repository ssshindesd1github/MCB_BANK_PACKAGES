-- =============================================
-- Author:		<SACHIN SHINDE>
-- Create date: <17-01-2021,,>
-- Description:	<usp_GetInvoiceData_PKG>
-- =============================================
CREATE PROCEDURE usp_GetInvoiceData_PKG	

AS
BEGIN


  ------------------------------ GET order table data from raw table ------------------------
		
	 WITH cte AS
	(     
		 SELECT *, ROW_NUMBER() OVER (PARTITION BY INVOICE_REFERENCE ORDER BY INVOICE_REFERENCE DESC) AS rn
		FROM XXBCM_ORDER_MGT X with (nolock) WHERE INVOICE_REFERENCE IS NOT NULL 

	)

	SELECT C.INVOICE_REFERENCE,Convert(datetime, C.INVOICE_DATE, 103) AS INVOICE_DATE,dbo.GetOnlyNumbersConvertToDecimal(C.INVOICE_AMOUNT) AS INVOICE_AMOUNT,
	  C.INVOICE_DESCRIPTION,C.INVOICE_HOLD_REASON,C.INVOICE_STATUS
	FROM cte C WHERE rn = 1 
END
GO






