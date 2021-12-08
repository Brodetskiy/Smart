CREATE TABLE [log].[logLoad]
(
	[Id] INT NOT NULL PRIMARY KEY identity,
	tableName nvarchar(200),
	dateOperation datetime default getdate(),
	typeOperation nvarchar(200),
	countRows bigint,
	isSuccess nvarchar(20)
)
