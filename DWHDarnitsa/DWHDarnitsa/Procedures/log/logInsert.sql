CREATE PROCEDURE [log].[logInsert] @tableName nvarchar(max), @isSuccess nvarchar(max), @typeOperation nvarchar(max)
    AS
        begin
            declare @temp table
                          (
                              countRows int
                          )

            declare @query nvarchar(max) = 'select count(*) from ' + @tableName
            insert into @temp (countRows)
                exec (@query)

            insert into [log].[logLoad] (tableName, typeOperation, countRows, isSuccess)
            select @tableName, @typeOperation, (select countRows from @temp), @isSuccess
        end
