CREATE TABLE Finance.[DebitGoodsInTransit]
(
	[Ном.док] nvarchar(max),
	[Контрагент] nvarchar(max),
	[Назва контрагенту] nvarchar(max),
	[Дата док.] date,
	[ТипДокумента] nvarchar(max),
	[LAND1] nvarchar(max),
	[Канал] int,
	[KURRF] float,
	[Валюта] nvarchar(max),
	[NETWR] float,
	[MWSBK] float,
	[ZTERM] float,
	[Рах.ГК] bigint,
	[Счет_ГК] nvarchar(max),
	[Сума] float,
	[Сума у внутр.в.] float,
	[Дата звіту] date default getdate()
)
