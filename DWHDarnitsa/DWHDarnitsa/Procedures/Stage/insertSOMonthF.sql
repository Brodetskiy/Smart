create PROCEDURE [stage].insertSOMonthF
	AS
		begin

			truncate table Morion.SOMonthF
			insert into Morion.SOMonthF (prel_flag, data_type, year, month, AreID, quantity, [VolumeUah],
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
			from stage.SOMonthF_temp

		truncate table stage.SOMonthF_temp
		end