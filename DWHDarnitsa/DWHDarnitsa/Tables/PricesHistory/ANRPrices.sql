CREATE TABLE [PricesHistory].[ANRPrices]
(
	[КодМориона] int,
	[ЦенаЗак] float,
	[ЦенаБНДС] float,
	[СтавкаНДС] int,
	[Производитель] nvarchar(max),
	[Наименование] nvarchar(max),
	[ВнешнийКод] nvarchar(max),
	[Партнер] nvarchar(max),
	[ПартнерОКПО] int
)
