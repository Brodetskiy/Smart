CREATE TABLE [Quality].[metrics]
(
	[Номер метрики] int,
	[Відділ] nvarchar(max),
	[Назва метрики] nvarchar(max),
	[Що характеризує метрика] nvarchar(max),
	[Критерій прийнятності] nvarchar(max),
	[Верхня границя = відмінно] float,
	[Верхня границя = задовільно] float,
	[Нижня границя] float,
	[2020] float,
	[Q1, Q2 2021] float,
	[Q3 2021] float
)
