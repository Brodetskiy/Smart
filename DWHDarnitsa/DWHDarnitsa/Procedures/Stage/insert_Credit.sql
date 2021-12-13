CREATE PROCEDURE [dbo].[insert_Credit]
AS
begin
    
    set dateformat dmy;

    truncate table dbo.credit

    insert into dbo.credit ([бал.од], [дата звіту], [рах.гк], [довг.тек.рах.гол.кн.], [мсфо кат.], [мсфо вид],
                            контрагент, [назва контрагенту], [тип рахун.], [пос.рах.], рік, [ном.док], [фінанс.рік],
                            [поз.], [дата док.], [дата пров.], [вирівнюв.], [дата догов], [номер договору],
                            [дат.погаш.], [вік заборг], [дні простр], валюта, сума, [сума у внутр.в.], валюта1,
                            сумпогзвіт, [ср%ст.деп], [уяв%дохід], [тип валюти], [ном.стр.])
    select [бал.од],
           try_cast(iif(try_cast([дата звіту] as int) is not null,
                        dateadd(dd, cast([дата звіту] as int), cast('18991230' as date)),
                        [дата звіту]) as date),
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
                        dateadd(dd, cast([дата пров.] as int), cast('18991230' as date)),
                        [дата пров.]) as date),
           [вирівнюв.],
           try_cast(case
                        when datalength(trim([дата догов])) = 0 then null
                        when try_cast([дата догов] as int) <> 0 and datalength(trim([дата догов])) = 16 then
                                substring([дата догов], 5, 4) + substring([дата догов], 3, 2) +
                                substring([дата догов], 1, 2)
                        when try_cast([дата догов] as date) is not null then cast([дата догов] as date)
               end as date),
           [номер договору],
           try_cast(case
                        when datalength(trim([дат.погаш.])) = 0 then null
                        when try_cast([дат.погаш.] as int) <> 0 and datalength(trim([дат.погаш.])) = 16 then
                                substring([дат.погаш.], 5, 4) + substring([дат.погаш.], 3, 2) +
                                substring([дат.погаш.], 1, 2)
                        when try_cast([дат.погаш.] as date) is not null then cast([дат.погаш.] as date)
               end as date),
           cast(trim([вік заборг]) as int),
           cast(trim([дні простр]) as int),
           валюта,
           try_cast(iif(CHARINDEX('-', [сума]) = 0, replace(replace([сума], ' ', ''), ',', '.'),
                        '-' + replace(replace(replace([сума], ' ', ''), '-', ''), ',', '.')) as numeric(18, 2)),
           try_cast(iif(CHARINDEX('-', [сума у внутр.в.]) = 0,
                        replace(replace([сума у внутр.в.], ' ', ''), ',', '.'), '-' + replace(
                           replace(replace([сума у внутр.в.], ' ', ''), '-', ''), ',', '.')) as numeric(18, 2)),

           валюта1,
           try_cast(replace(trim(сумпогзвіт), ',', '.') as float),
           [ср%ст.деп],
           try_cast(iif(CHARINDEX('-', [уяв%дохід]) = 0, replace(replace([уяв%дохід], ' ', ''), ',', '.'),
                        '-' + replace(replace(replace([уяв%дохід], ' ', ''), '-', ''), ',', '.')) as numeric(18, 2)),
           [тип валюти],
           [ном.стр.]
    from stage.Credit_temp
end