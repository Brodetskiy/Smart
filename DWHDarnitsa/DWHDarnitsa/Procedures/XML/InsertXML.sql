create PROCEDURE [XML].[InsertXML]
	@XML_type nvarchar(100)
AS
begin
	declare @xml xml
	declare @xml_text nvarchar(max)


	if @XML_type = N'CRMClient'
		begin

			set @XML_text = (select top 1 XML_text from xml.XMLBegin where XML_text like N'%CRMClient%' order by dateInsert desc)

			set @xml = replace(@xml_text, ' encoding="WINDOWS-1251"', '')

			merge [XML].[CRMClient] as ls
			using (SELECT
				  t.value('f[1]/text()[1]', 'nvarchar(max)') CompanyId
				, t.value('f[2]/text()[1]', 'nvarchar(max)') CompanyName
				, t.value('f[3]/text()[1]', 'nvarchar(max)') CompanyAddress
			FROM @xml.nodes('extdata/scheme/data/o/d/r') A(t)) as source on (ls.CompanyId = source.CompanyId)
			when matched
			    then update set ls.CompanyAddress = source.CompanyAddress,
			                    ls.CompanyName = source.CompanyName
			when not matched
			    then insert (CompanyId, CompanyName, CompanyAddress)
			    values (source.CompanyId, source.CompanyName, source.CompanyAddress)
			;

			delete from xml.XMLBegin where XML_text like N'%CRMClient%'

		end

	else if @XML_type = N'CRMDespatch'
		begin

			set @XML_text  = (select top 1 XML_text from xml.XMLBegin where XML_text like N'%CRMDespatch%' order by dateInsert desc)

			set @xml = replace(@xml_text, ' encoding="WINDOWS-1251"', '')


			insert into xml.CRMDespatch(documentdate, documentnumber, warehouseid, pharmacyid, pharmacistid,
										companyid, addressid, dstcodeid, wareid, price, quantity)
			SELECT
				  t.value('../../f[1]/text()[1]', 'nvarchar(max)') AS [DocumentDate]
				, t.value('../../f[2]/text()[1]', 'nvarchar(max)') AS [DocumentNumber]
				, t.value('../../f[3]/text()[1]', 'nvarchar(max)') AS [WarehouseId]
				, t.value('../../f[4]/text()[1]', 'nvarchar(max)') AS [PharmacyId]
				, t.value('../../f[5]/text()[1]', 'nvarchar(max)') AS [PharmacistId]
				, t.value('../../f[6]/text()[1]', 'nvarchar(max)') AS [CompanyId]
				, t.value('../../f[7]/text()[1]', 'nvarchar(max)') AS [AddressId]
				, t.value('../../f[8]/text()[1]', 'nvarchar(max)') AS [DstCodeId]
				, t.value('f[1]/text()[1]', 'nvarchar(max)') WareId
				, t.value('f[2]/text()[1]', 'nvarchar(max)') Price
				, t.value('f[3]/text()[1]', 'nvarchar(max)') Quantity
			FROM @xml.nodes('extdata/scheme/data/o/d/r/d/r') A(t)

			delete from xml.XMLBegin where XML_text like N'%CRMDespatch%'
		end
	else if @XML_type = N'CRMPharmacy'
		begin

			set @XML_text = (select top 1 XML_text from xml.XMLBegin where XML_text like N'%CRMPharmacy%' order by dateInsert desc)

			set @xml = replace(@xml_text, ' encoding="WINDOWS-1251"', '')

			delete
            from xml.CRMPharmacy
			where exists (select 1 FROM @xml.nodes('extdata/scheme/data/o/d/r/d/r') A(t) where PharmacyId = t.value('../../f[1]/text()[1]', 'nvarchar(max)'))

			insert into xml.CRMPharmacy(PharmacyId, CompanyId, PharmacyName, PharmacyAddress, PharmacistId, PharmacistName)
			SELECT
				  t.value('../../f[1]/text()[1]', 'nvarchar(max)') AS [PharmacyId]
				, t.value('../../f[2]/text()[1]', 'nvarchar(max)') AS [CompanyId]
				, t.value('../../f[3]/text()[1]', 'nvarchar(max)') AS [PharmacyName]
				, t.value('../../f[4]/text()[1]', 'nvarchar(max)') AS [PharmacyAddress]
				, t.value('f[1]/text()[1]', 'nvarchar(max)') PharmacistId
				, t.value('f[2]/text()[1]', 'nvarchar(max)') PharmacistName

			FROM @xml.nodes('extdata/scheme/data/o/d/r/d/r') A(t)

			update x
			set x.PharmacistName = t.value('f[2]/text()[1]', 'nvarchar(max)')
			from xml.CRMPharmacy x
			    join @xml.nodes('extdata/scheme/data/o/d/r/d/r') A(t) on t.value('f[1]/text()[1]', 'nvarchar(max)') = x.PharmacistId

			delete from xml.XMLBegin where XML_text like N'%CRMPharmacy%'
		end

	else if @XML_type = N'CRMWare'
		begin

			set @XML_text = (select top 1 XML_text from xml.XMLBegin where XML_text like N'%CRMWare%' order by dateInsert desc)

			set @xml = replace(@xml_text, ' encoding="WINDOWS-1251"', '')


			merge [XML].[CRMWare] as ls
			using (SELECT
                  t.value('f[1]/text()[1]', 'nvarchar(max)') WareId
                , t.value('f[2]/text()[1]', 'nvarchar(max)') MorionCode
                , t.value('f[3]/text()[1]', 'nvarchar(max)') BarCode
                , t.value('f[4]/text()[1]', 'nvarchar(max)') WareName
            FROM @xml.nodes('extdata/scheme/data/o/d/r') A(t)) as source on (ls.WareId = source.WareId)
			when matched
			    then update set ls.WareName = source.WareName,
			                    ls.BarCode = source.BarCode,
			                    ls.MorionCode = source.MorionCode
			when not matched
			    then insert (WareId, MorionCode, BarCode, WareName)
			    values (source.WareId, source.MorionCode, source.BarCode, source.WareName)
			;

-- 			insert into xml.CRMWare(WareId, MorionCode, BarCode, WareName)
-- 			SELECT
--                   t.value('f[1]/text()[1]', 'nvarchar(max)') WareId
--                 , t.value('f[2]/text()[1]', 'nvarchar(max)') MorionCode
--                 , t.value('f[3]/text()[1]', 'nvarchar(max)') BarCode
--                 , t.value('f[4]/text()[1]', 'nvarchar(max)') WareName
--             FROM @xml.nodes('extdata/scheme/data/o/d/r') A(t)

			delete from xml.XMLBegin where XML_text like N'%CRMWare%'
		end

    else if @XML_type = N'CRMWarehouse'
		begin

			set @XML_text = (select top 1 XML_text from xml.XMLBegin where XML_text like N'%CRMWarehouse%' order by dateInsert desc)

			set @xml = replace(@xml_text, ' encoding="WINDOWS-1251"', '')

			merge [XML].[CRMWarehouse] as ls
			using (SELECT
                  t.value('f[1]/text()[1]', 'nvarchar(max)') WarehouseId
                , t.value('f[2]/text()[1]', 'nvarchar(max)') WarehouseName
                , t.value('f[3]/text()[1]', 'nvarchar(max)') WarehouseAddress
            FROM @xml.nodes('extdata/scheme/data/o/d/r') A(t)) as source on (ls.WarehouseId = source.WarehouseId)
			when matched
			    then update set ls.WarehouseName = source.WarehouseName,
			                    ls.WarehouseAddress = source.WarehouseAddress
			when not matched
			    then insert (WarehouseId, WarehouseName, WarehouseAddress)
			    values (source.WarehouseId, source.WarehouseName, source.WarehouseAddress)
			;

-- 			insert into xml.CRMWarehouse(WarehouseId, WarehouseName, WarehouseAddress)
--             SELECT
--                   t.value('f[1]/text()[1]', 'nvarchar(max)') WarehouseId
--                 , t.value('f[2]/text()[1]', 'nvarchar(max)') WarehouseName
--                 , t.value('f[3]/text()[1]', 'nvarchar(max)') WarehouseAddress
--             FROM @xml.nodes('extdata/scheme/data/o/d/r') A(t)

			delete from xml.XMLBegin where XML_text like N'%CRMWarehouse%'
		end

    else if @XML_type = N'CRMWhBalance'
		begin

			set @XML_text = (select top 1 XML_text from xml.XMLBegin where XML_text like N'%CRMWhBalance%' order by dateInsert desc)

			set @xml = replace(@xml_text, ' encoding="WINDOWS-1251"', '')
			insert into xml.CRMWhBalance(PharmacyId, WarehouseId, BalanceDate, WareId, Quantity, Price)
            SELECT
                  t.value('../../f[1]/text()[1]', 'nvarchar(max)') AS [PharmacyId]
                , t.value('../../f[2]/text()[1]', 'nvarchar(max)') AS [WarehouseId]
                , t.value('../../f[3]/text()[1]', 'nvarchar(max)') AS [BalanceDate]
                , t.value('f[1]/text()[1]', 'nvarchar(max)') WareId
                , t.value('f[2]/text()[1]', 'nvarchar(max)') Quantity
                , t.value('f[3]/text()[1]', 'nvarchar(max)') Price
            FROM @xml.nodes('extdata/scheme/data/o/d/r/d/r') A(t)

			delete from xml.XMLBegin where XML_text like N'%CRMWhBalance%'
		end

    else if @XML_type = N'CRMWhReceipt'
		begin

			set @XML_text = (select top 1 XML_text from xml.XMLBegin where XML_text like N'%CRMWhReceipt%' order by dateInsert desc)

			set @xml = replace(@xml_text, ' encoding="WINDOWS-1251"', '')
			insert into xml.CRMWhReceipt(DocumentDate, DocumentNumber, WarehouseId, PharmacyId, CompanyId, SrcCodeId, WareId, Price, Quantity)
            SELECT
                  t.value('../../f[1]/text()[1]', 'nvarchar(max)') AS [DocumentDate]
                , t.value('../../f[2]/text()[1]', 'nvarchar(max)') AS [DocumentNumber]
                , t.value('../../f[3]/text()[1]', 'nvarchar(max)') AS [WarehouseId]
                , t.value('../../f[4]/text()[1]', 'nvarchar(max)') AS [PharmacyId]
                , t.value('../../f[5]/text()[1]', 'nvarchar(max)') AS [CompanyId]
                , t.value('../../f[6]/text()[1]', 'nvarchar(max)') AS [SrcCodeId]

                , t.value('f[1]/text()[1]', 'nvarchar(max)') WareId
                , t.value('f[2]/text()[1]', 'nvarchar(max)') Price
                , t.value('f[3]/text()[1]', 'nvarchar(max)') Quantity
            FROM @xml.nodes('extdata/scheme/data/o/d/r/d/r') A(t)

			delete from xml.XMLBegin where XML_text like N'%CRMWhReceipt%'
		end


end