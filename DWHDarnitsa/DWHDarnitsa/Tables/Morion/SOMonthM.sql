CREATE TABLE [Morion].SOMonthM(
	[PREL_FLAG] [int] NULL,
	[DATA_TYPE] [nvarchar](20) NULL,
	[YEAR] [int] NULL,
	[Month] [nvarchar](50) NULL,
	[AreID] [int] NULL,
	[DrID] [int] NULL,
	[Quantity] [numeric](18, 2) NULL,
	[VolumeUah] [numeric](18, 2) NULL,
	[VolumeUsd] [numeric](18, 2) NULL,
	[VolumeEur] [numeric](18, 2) NULL,
	[PriceUAH] [numeric](18, 2) NULL,
	[PriceUSD] [numeric](18, 2) NULL,
	[PriceEUR] [numeric](18, 2) NULL,
	[SRO] NVARCHAR(50) NULL,
	[SROw] NVARCHAR(50) NULL
)