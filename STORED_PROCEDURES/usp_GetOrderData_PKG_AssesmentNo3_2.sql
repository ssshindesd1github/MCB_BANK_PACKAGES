-- =============================================
-- Author:		<SACHIN SHINDE>
-- Create date: <17-01-2021,,>
-- Description:	<usp_GetOrderData_PKG>
-- =============================================
CREATE PROCEDURE usp_GetOrderData_PKG	

AS
BEGIN


  ------------------------------ GET order table data from raw table ------------------------
    
		WITH cte AS
		(   	SELECT S.SUPPLIER_ID,ORDER_REF AS ORDER_NUMBER,INVOICE_REFERENCE,ORDER_DESCRIPTION,Convert(datetime, ORDER_DATE, 103) AS ORDER_DATE ,dbo.GetOnlyNumbersConvertToDecimal(ORDER_LINE_AMOUNT) AS ORDER_LINE_AMOUNT,
		         dbo.GetOnlyNumbersConvertToDecimal(ORDER_TOTAL_AMOUNT) AS ORDER_TOTAL_AMOUNT,
		         ORDER_STATUS,
				 ROW_NUMBER() OVER (PARTITION BY ORDER_REF ORDER BY ORDER_REF DESC) AS rn
			FROM XXBCM_ORDER_MGT X with (nolock) LEFT OUTER JOIN SUPPLIER_DETAILS S with (nolock) ON X.SUPPLIER_NAME = S.SUPPLIER_NAME
		)
		
		SELECT C.ORDER_NUMBER,C.SUPPLIER_ID,C.INVOICE_REFERENCE,C.ORDER_DESCRIPTION,C.ORDER_DATE,C.ORDER_LINE_AMOUNT,
		C.ORDER_TOTAL_AMOUNT,
		 C.ORDER_STATUS
		FROM cte C  
		WHERE C.rn =1 

END
GO



