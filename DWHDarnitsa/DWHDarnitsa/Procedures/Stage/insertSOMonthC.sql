create PROCEDURE [stage].insertSOMonthC
	AS
		begin

			truncate table Morion.SOMonthC
			insert into Morion.SOMonthC (prel_flag, data_type, year, month, AreID, quantity, [VolumeUah],
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
			from stage.SOMonthC_temp

		truncate table stage.SOMonthC_temp
		end