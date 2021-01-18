USE [MCB_BANK]
GO

/****** Object:  Table [dbo].[ORDER_DETAILS]    Script Date: 18-01-2021 05:48:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ORDER_DETAILS](
	[ORDER_ID] [int] IDENTITY(1,1) NOT NULL,
	[ORDER_SUPPLIER_ID] [int] NULL,
	[ORDER_NUMBER] [varchar](250) NOT NULL,
	[ORDER_DESCRIPTION] [varchar](1000) NOT NULL,
	[ORDER_DATE] [date] NOT NULL,
	[ORDER_LINE_AMOUNT] [decimal](18, 3) NULL,
	[ORDER_TOTAL_AMOUNT] [decimal](18, 3) NULL,
	[ORDER_STATUS] [varchar](50) NOT NULL,
	[INVOICE_REFERENCE] [varchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[ORDER_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ORDER_DETAILS]  WITH CHECK ADD FOREIGN KEY([ORDER_SUPPLIER_ID])
REFERENCES [dbo].[SUPPLIER_DETAILS] ([SUPPLIER_ID])
GO

ALTER TABLE [dbo].[ORDER_DETAILS]  WITH CHECK ADD FOREIGN KEY([ORDER_SUPPLIER_ID])
REFERENCES [dbo].[SUPPLIER_DETAILS] ([SUPPLIER_ID])
GO


