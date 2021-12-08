create PROCEDURE [stage].insertSOCMonthFS
	AS
		begin

			truncate table Morion.SOCMonthFS
			insert into Morion.SOCMonthFS (prel_flag, data_type, year, month, AreID, quantity, [VolumeUah],
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
			from stage.SOCMonthFS_temp

		truncate table stage.SOCMonthFS_temp
		end