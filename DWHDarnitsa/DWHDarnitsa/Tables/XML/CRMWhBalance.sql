CREATE TABLE [xml].[CRMWhBalance]
(
	PharmacyId nvarchar(max),
	WarehouseId nvarchar(max),
	BalanceDate date,
	WareId nvarchar(max),
	Quantity numeric(18,2),
	Price numeric(18,2)
)
