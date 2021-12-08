create PROCEDURE [stage].insertSOMonthD
	AS
		begin

			truncate table Morion.SOMonthD
			insert into Morion.SOMonthD (prel_flag, data_type, year, month, AreID, quantity, [VolumeUah],
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
			from stage.SOMonthD_temp

		truncate table stage.SOMonthD_temp
		end