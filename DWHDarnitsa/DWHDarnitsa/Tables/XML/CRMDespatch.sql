CREATE TABLE [XML].[CRMDespatch]
(
	DocumentDate date,
	DocumentNumber nvarchar(max),
	WarehouseId nvarchar(max),
	PharmacyId nvarchar(max),
	PharmacistId nvarchar(max),
	CompanyId nvarchar(max),
	AddressId nvarchar(max),
	DstCodeId nvarchar(max),
	WareId nvarchar(max),
	Price numeric(18,2),
	Quantity numeric(18,2)
)
