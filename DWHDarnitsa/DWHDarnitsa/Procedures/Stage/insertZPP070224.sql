create PROCEDURE [stage].[insertZPP070224]
AS
begin
    set dateformat dmy;
    truncate table Production.ZPP070224
    --where exists (select 1 from stage.debit_temp s where try_cast(s.[Дата звіту] as date) = [Дата звіту])

    insert into Production.ZPP070224 ([наименован], [код ресурса], [номер заказа], материал, [наименование материала],
                                      серия, [текст операции], [дата завершення], количество, количество1, количество2,
                                      еи, [общее время работы ресурса], [время на переналадки],
                                      [время перехода на след серию], [время на производство],
                                      [плановая производительность], [коеф пересчета], [общая эффективность],
                                      [эффективность без учета], производительность, качество, доступность,
                                      [доступность д1], [доступность д2], [доступность д3])
    select --top 1000
           [Наименован],
           [код ресурса],
           cast([номер заказа] as int),
           [материал],
           [наименование материала],
           [серия],
           [текст операции],
           cast(substring([Дата завершення], 7, 4) + substring([Дата завершення], 4, 2) +
                substring([Дата завершення], 1, 2) as date) [Дата завершення],
           cast(replace(replace([количество], ',', '.'), ' ', '') as float),
           cast(replace(replace([количество1], ',', '.'), ' ', '') as float),
           cast(replace(replace([количество2], ',', '.'), ' ', '') as float),
           [еи],
           cast(replace(replace([общее время работы ресурса], ',', '.'), ' ', '') as float),
           cast(replace(replace([время на переналадки], ',', '.'), ' ', '') as float),
           cast(replace(replace([время перехода на след серию], ',', '.'), ' ', '') as float),
           cast(replace(replace([время на производство], ',', '.'), ' ', '') as float),
           cast(replace(replace([плановая производительность], ',', '.'), ' ', '') as float),
           cast(replace(replace([коеф пересчета], ',', '.'), ' ', '') as float),
           cast(replace(replace([общая эффективность], ',', '.'), ' ', '') as float),
           cast(replace(replace([эффективность без учета], ',', '.'), ' ', '') as float),
           cast(replace(replace([производительность], ',', '.'), ' ', '') as float),
           cast(replace(replace([качество], ',', '.'), ' ', '') as float),
           cast(replace(replace([доступность], ',', '.'), ' ', '') as float),
           cast(replace(replace([доступность д1], ',', '.'), ' ', '') as float),
           cast(replace(replace([доступность д2], ',', '.'), ' ', '') as float),
           iif(charindex('-', [доступность д3]) = 0,
               cast(replace(replace([доступность д3], ',', '.'), ' ', '') as float),
               cast(replace(replace(replace([доступность д3], ',', '.'), ' ', ''), '-', '') as float) * -1)
    from stage.[ZPP070224]


    truncate table stage.[ZPP070224]
end


--exec [stage].[insertDebit]

