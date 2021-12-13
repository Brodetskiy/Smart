CREATE PROCEDURE [stage].[Insert_war_pallet]
AS
begin

    truncate table dbo.[war_pallet]

    set dateformat dmy; 

	insert into dbo.[war_pallet] (date, curr, zone, code, n_pallet)

select
               try_cast(iif(try_cast([date] as int) is not null,
                        dateadd(dd, cast([date] as int), cast('18991230' as date)),
                        [date]) as date),
               curr,
               zone,
               code,
               n_pallet
from [Stage].[war_pallet]

end