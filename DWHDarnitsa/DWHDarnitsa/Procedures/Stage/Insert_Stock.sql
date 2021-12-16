create procedure Stage.insert_Stock
    as
    begin
set dateformat dmy;

truncate table dbo.Stock

insert into dbo.Stock (date_stock, year, month, code, lot, qty, date_coming, date_expiration, mon_term, qty_day_real,
                       qty_day_exp)
select cast(substring(date_stock, 7, 4) + substring(Date_Stock, 4, 2) + substring(Date_Stock, 1, 2) as date),
       year,
       month,
       code,
       lot,
       cast(qty as float),
       try_cast(iif(try_cast(date_coming as int) is not null, dateadd(dd, try_cast(date_coming as int), cast('18991230' as date)), date_coming ) as date),
       try_cast(case
                        when datalength(trim(date_coming)) = 0 then null
                        when try_cast(date_coming as int) <> 0 and datalength(trim(date_coming)) = 16 then
                                substring(date_coming, 5, 4) + substring(date_coming, 3, 2) +
                                substring(date_coming, 1, 2)
                        when try_cast(date_coming as date) is not null then cast(date_coming as date)
               end as date),
       mon_term,
       qty_day_real,
       try_cast(qty_day_exp as int)
from stage.Stock_temp

--truncate table stage.Stock_temp
        end