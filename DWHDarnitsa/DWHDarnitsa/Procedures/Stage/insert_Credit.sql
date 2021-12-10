CREATE PROCEDURE [dbo].[insert_Credit]
AS
begin
	select top 1000000
       [бал.од],
              try_cast(iif(try_cast([дата звіту] as int) is not null,
                           dateadd(dd, cast([дата звіту] as int), cast('18991230' as date)), [дата звіту]) as date),
              cast([рах.гк] as int),
              [довг.тек.рах.гол.кн.],
              [мсфо кат.],
              [мсфо вид],
              контрагент,
              [назва контрагенту],
              [тип рахун.],
              cast([пос.рах.] as bigint),
              рік,
              cast([ном.док] as bigint),
              [фінанс.рік],
              [поз.],
              try_cast(iif(try_cast([дата док.] as int) is not null,
                           dateadd(dd, cast([дата док.] as int), cast('18991230' as date)), [дата док.]) as date),
              try_cast(iif(try_cast([дата пров.] as int) is not null,
                           dateadd(dd, cast([дата пров.] as int), cast('18991230' as date)), [дата пров.]) as date),
              [вирівнюв.],
            try_cast(case
                 when datalength(trim([дата догов])) = 0 then null
                 when try_cast([дата догов] as int) <> 0 and datalength(trim([дата догов])) = 16 then
                         substring([дата догов], 5, 4) + substring([дата догов], 3, 2) + substring([дата догов], 1, 2)
                 when try_cast([дата догов] as date) is not null then cast([дата догов] as date)
                 end as date),
              [номер договору],
            try_cast(case
				 when datalength(trim([дат.погаш.])) = 0 then null
                 when try_cast([дат.погаш.] as int) <> 0 and datalength(trim([дат.погаш.])) = 16 then
                         substring([дат.погаш.], 5, 4) + substring([дат.погаш.], 3, 2) + substring([дат.погаш.], 1, 2)
                 when try_cast([дат.погаш.] as date) is not null then cast([дат.погаш.] as date)
                 end as date),
              [вік заборг],
              [дні простр],
              валюта,
              сума,
              [сума у внутр.в.],
              валюта1,
              сумпогзвіт,
              [ср%ст.деп],
              [уяв%дохід],
              [тип валюти],
              [ном.стр.]
from stage.Credit_temp
end