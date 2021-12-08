CREATE PROCEDURE Stage.insert_plan



as BEGIN



IF EXISTS (select 1 FROM Stage.plan_temp pt)



BEGIN



TRUNCATE TABLE dar.[plan]



INSERT INTO dar.[plan] (Версія, Год, Месяц, Матеріал, QTY, Валюта, SUM_CURR, SUM_UAH, SUM_CURR_AE, SUM_UAH_AE)
SELECT TRY_CAST(pt.VER_PLAN AS NVARCHAR(10)) VER_PLAN
, TRY_CAST(pt.Year AS int) [Year]
, TRY_CAST(pt.MonthNum AS int) MonthNum
, TRY_CAST(pt.MATERIAL AS int) MATERIAL
, TRY_CAST(replace(pt.QTY,',','.') AS float) QTY
, TRY_CAST(pt.CURR AS NCHAR(3)) CURR
, TRY_CAST(replace(pt.SUM_CURR,',','.') AS FLOAT) SUM_CURR
, TRY_CAST(replace(pt.SUM_UAH,',','.') AS FLOAT) SUM_UAH
, TRY_CAST(replace(pt.PRICE_CURR_AE,',','.') AS FLOAT) * TRY_CAST(replace(pt.QTY,',','.') AS float) SUM_CURR_AE
, TRY_CAST(replace(pt.PRICE_UAH_AE,',','.') AS FLOAT) * TRY_CAST(replace(pt.QTY,',','.') AS float) SUM_UAH_AE
FROM Stage.plan_temp pt
WHERE pt.ACCOUNT_N IN ('BS_0020110000', 'BS_0020210000')



TRUNCATE TABLE Stage.plan_temp



END



END