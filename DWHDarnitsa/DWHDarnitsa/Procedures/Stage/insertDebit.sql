create PROCEDURE [stage].[insertDebit]
	AS
		begin
			
			set dateformat dmy;
			
			truncate table Finance.Debit
			
			--delete 
			--from Finance.Debit
			--where [Дата звіту] >= dateadd(MM, -1, cast(GETDATE() as date))
			--where exists (select 1 from stage.debit_temp s where try_cast(s.[Дата звіту] as date) = [Дата звіту])

			insert into Finance.Debit ([Бал.од], [Дата звіту], [Рах.ГК], [Довг.тек.рах.гол.кн.], [МСФО кат.], [МСФО вид],
										[Контрагент], [Назва контрагенту], [Тип рахун.], [Пос.рах.], [Рік], [Ном.док], 
										[Фінанс.рік], [Поз.], [Дата док.], [Дата пров.], [Вирівнюв.], [Дата догов],
										[Номер договору], [Дат.погаш.], [Вік заборг], [дні простр], [Валюта], [Сума],
										[Сума у внутр.в.], [Валюта1], [СумПогЗвіт], [Ср%ст.деп], [Уяв%дохід], [Тип валюти], [Ном.стр.])
select 
			try_cast([Бал.од] as int),
			try_cast([Дата звіту] as date),
			try_cast([Рах.ГК] as bigint),
			[Довг.тек.рах.гол.кн.],
			[МСФО кат.],
			[МСФО вид],
			[Контрагент],
			[Назва контрагенту],
			[Тип рахун.],
			try_cast([Пос.рах.] as bigint),
			try_cast([Рік] as int),
			try_cast([Ном.док] as bigint),
			try_cast([Фінанс.рік] as int),
			try_cast([Поз.] as int),
			try_cast(iif([Дата док.] = '          ', null, [Дата док.]) as date),
			try_cast(iif([Дата пров.] = '          ', null, [Дата пров.]) as date),
			try_cast(iif([Вирівнюв.] = '          ', null, [Вирівнюв.]) as date) [Вирівнюв.],
			try_cast(iif([Дата догов] = '          ', null, [Дата догов]) as date),
			[Номер договору],
			try_cast(iif([Дат.погаш.] = '          ', null, [Дат.погаш.]) as date) [Дат.погаш.],
			try_cast([Вік заборг] as int),
			try_cast([дні простр] as int),
			[Валюта],
			try_cast(iif (CHARINDEX('-', [Сума]) = 0, replace(replace([Сума], ' ', ''), ',', '.'), '-' + replace(replace(replace([Сума], ' ', ''), '-', ''), ',', '.')) as numeric(18,2)),
			try_cast(iif (CHARINDEX('-', [Сума у внутр.в.]) = 0, replace(replace([Сума у внутр.в.], ' ', ''), ',', '.'), '-' + replace(replace(replace([Сума у внутр.в.], ' ', ''), '-', ''), ',', '.')) as numeric(18,2)),
			[Валюта1],
			try_cast(replace([СумПогЗвіт], ',', '.') as numeric(18,2)),
			try_cast([Ср%ст.деп] as int),
			try_cast(iif (CHARINDEX('-', [Уяв%дохід]) = 0, replace(replace([Уяв%дохід], ' ', ''), ',', '.'), '-' + replace(replace(replace([Уяв%дохід], ' ', ''), '-', ''), ',', '.')) as numeric(18,2)),
			try_cast([Тип валюти] as int),
			try_cast([Ном.стр.] as int)

		from stage.debit_temp s

		truncate table stage.debit_temp
		end
		


		--exec [stage].[insertDebit]

