USE [MCB_BANK]
GO

/****** Object:  Table [dbo].[XXBCM_ORDER_MGT]    Script Date: 18-01-2021 05:47:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[XXBCM_ORDER_MGT](
	[ORDER_REF] [varchar](2000) NULL,
	[ORDER_DATE] [varchar](2000) NULL,
	[SUPPLIER_NAME] [varchar](2000) NULL,
	[SUPP_CONTACT_NAME] [varchar](2000) NULL,
	[SUPP_ADDRESS] [varchar](2000) NULL,
	[SUPP_CONTACT_NUMBER] [varchar](2000) NULL,
	[SUPP_EMAIL] [varchar](2000) NULL,
	[ORDER_TOTAL_AMOUNT] [varchar](2000) NULL,
	[ORDER_DESCRIPTION] [varchar](2000) NULL,
	[ORDER_STATUS] [varchar](2000) NULL,
	[ORDER_LINE_AMOUNT] [varchar](2000) NULL,
	[INVOICE_REFERENCE] [varchar](2000) NULL,
	[INVOICE_DATE] [varchar](2000) NULL,
	[INVOICE_STATUS] [varchar](2000) NULL,
	[INVOICE_HOLD_REASON] [varchar](2000) NULL,
	[INVOICE_AMOUNT] [varchar](2000) NULL,
	[INVOICE_DESCRIPTION] [varchar](2000) NULL
) ON [PRIMARY]
GO


