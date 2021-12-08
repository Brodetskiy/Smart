CREATE TABLE [xml].[CRMWhReceipt]
(
	DocumentDate date,
	DocumentNumber nvarchar(max),
	WarehouseId nvarchar(max),
	PharmacyId nvarchar(max),
	CompanyId nvarchar(max),
	SrcCodeId nvarchar(max),
	WareId nvarchar(max),
	Price numeric(18,2),
	Quantity numeric(18,2)
)
