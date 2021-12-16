CREATE PROCEDURE [stage].[insert_fact_shipment]
as
begin

    set dateformat dmy;
    truncate table [dbo].[fact_shipment]

    insert into [dbo].[fact_shipment](датвідвант, [дата факт.], рік, місяць, чверть, ттн, кодтовару,
                                      [найменування товару],
                                      замовник, клієнт, краiна, назва, кз, [канал збуту], [департ.], reprsez,
                                      [обс.пост.],
                                      еи, [сума без пдв], податок, [сума з пдв], валют, сумабезпдвгрн, [подат.грн],
                                      [сумазпдв грн], [відтермін.], [№ контр.], кодгрмат, [опис гр.матер.], рз,
                                      отримувач)
    select try_cast([датвідвант] as date),
           cast([дата факт.] as date), -- ??
           cast(рік as int),           -- ??
           cast(місяць as int),        --??
           cast(чверть as int),        -- ??
           cast(ттн as int),
           cast(кодтовару as int),
           [найменування товару],
           cast(замовник as int),
           клієнт,
           краiна,
           назва,
           cast(кз as int),
           [канал збуту],
           [департ.],
           reprsez,
           try_cast(iif(CHARINDEX('-', [обс.пост.]) = 0, replace(replace([обс.пост.], ' ', ''), ',', '.'),
                        '-' + replace(replace(replace([обс.пост.], ' ', ''), '-', ''), ',', '.')) as numeric(18, 2)),
           еи,
           cast(replace(replace(trim([сума без пдв]), ' ', ''), ',', '.') as float),
           cast(replace(replace(trim([податок]), ' ', ''), ',', '.') as float),
           cast(replace(replace(trim([сума з пдв]), ' ', ''), ',', '.') as float),
           валют,
           cast(replace(replace(trim([сумабезпдвгрн]), ' ', ''), ',', '.') as float),
           cast(replace(replace(trim([подат.грн]), ' ', ''), ',', '.') as float),
           cast(replace(replace(trim([сумазпдв грн]), ' ', ''), ',', '.') as float),
           cast([відтермін.] as int),
           [№ контр.],
           cast(кодгрмат as int),
           [опис гр.матер.],
           рз,
           отримувач
    from [stage].[fact_shipment]
end

