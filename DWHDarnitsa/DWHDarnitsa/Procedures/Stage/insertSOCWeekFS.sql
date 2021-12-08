create PROCEDURE [stage].insertSOCWeekFS
	AS
		begin

			truncate table Morion.SOCWeekFS
			insert into Morion.SOCWeekFS (prel_flag, data_type, year, month, AreID, quantity, [VolumeUah],
										[VolumeUsd], [VolumeEur], [PriceUAH], [PriceUSD], [PriceEUR], [SRO], [SROw], [DrID] )
			select 
				prel_flag,
				data_type,
				year,
				month,
				AreID,
				replace(quantity, ',', '.'),
				replace([VolumeUah], ',', '.'),
				replace([VolumeUsd], ',', '.'),
				replace([VolumeEur], ',', '.'),
				replace([PriceUAH], ',', '.'),
				replace([PriceUSD], ',', '.'),
				replace([PriceEUR], ',', '.'),
				[SRO],
				[SROw],
				[DrID] 
			from stage.SOCWeekFS_temp

		truncate table stage.SOCWeekFS_temp
		end