CREATE TABLE [dar].[fact](
	[Версія] [nvarchar](50) NULL,
	[Год] [int] NULL,
	[Месяц] [int] NULL,
	[Матеріал] [int] NULL,
	[QTY] [float] NULL,
	[Валюта] [char](3) NULL,
	[SUM_CURR] [float] NULL,
	[SUM_UAH] [float] NULL,
	[SUM_CURR_AE] [float] NULL,
	[SUM_UAH_AE] [float] NULL,
	[accountingType] [nvarchar](200) NULL
)