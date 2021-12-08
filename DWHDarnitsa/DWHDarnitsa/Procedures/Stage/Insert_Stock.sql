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
       qty,
       try_cast(iif(try_cast(date_coming as int) is not null, dateadd(dd, cast(date_coming as int), cast('18991230' as date)), date_coming ) as date),
       try_cast(iif(try_cast(date_expiration as int) is not null, dateadd(dd, cast(date_expiration as int), cast('18991230' as date)), date_expiration ) as date),
       mon_term,
       qty_day_real,
       qty_day_exp
from stage.Stock_temp

truncate table stage.Stock_temp
        end