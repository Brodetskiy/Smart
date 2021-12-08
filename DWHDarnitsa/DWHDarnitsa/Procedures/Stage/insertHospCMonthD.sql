create PROCEDURE [stage].insertHospCMonthD
	AS
		begin

			truncate table Morion.HospCMonthD
			insert into Morion.HospCMonthD (prel_flag, data_type, year, Week, AreID, quantity, [VolumeUah],
										[VolumeUsd], [VolumeEur], [PriceUAH], [PriceUSD], [PriceEUR], [SRO], [SROw], [DrID] )
			select 
				prel_flag,
				data_type,
				year,
				week,
				AreID,
				replace(quantity, ',', '.'),
				replace([VolumeUah], ',', '.'),
				replace([VolumeUsd], ',', '.'),
				replace([VolumeEur], ',', '.'),
				replace([PriceUAH], ',', '.'),
				replace([PriceUSD], ',', '.'),
				replace([PriceEUR], ',', '.'),
				replace([SRO], ',', '.'),
				replace([SROw], ',', '.'),
				[DrID] 
			from stage.HospCMonthD_temp

		truncate table stage.HospCMonthD_temp
		end