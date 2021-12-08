CREATE PROCEDURE Stage.insert_fact



as BEGIN



SET DATEFORMAT DMY



IF EXISTS (select 1 FROM Stage.fact_qlik_temp fqt) AND EXISTS (select 1 FROM Stage.fact_SAP_temp fst)



begin



TRUNCATE TABLE dar.fact




INSERT INTO dar.fact (Версія, Год, Месяц, Матеріал, QTY, Валюта, SUM_CURR, SUM_UAH, SUM_CURR_AE, SUM_UAH_AE)
SELECT
'ACTUAL' Версія
,fact_qlik.y
,fact_qlik.m
,fact_qlik.material
,fact_qlik.qty
,fact_qlik.currency
,fact_qlik.SUM_CURR
,fact_qlik.SUM_UAH
,s.sum_curr_ae
,s.sum_uah_ae
FROM (SELECT
YEAR(TRY_CAST(fqt.postingDate AS DATE)) Y
,MONTH(TRY_CAST(fqt.postingDate AS DATE)) m
,CAST(fqt.material AS INT) material
,SUM(CAST(REPLACE(REPLACE(IIF(qty LIKE '%-', CONCAT('-', REPLACE(qty, '-', '')), qty), ' ', ''), ',', '.') AS FLOAT)) qty
,CAST(fqt.currency AS CHAR(3)) currency
--, AVG(cast(replace(REPLACE(iif(fqt.PRICE_CURR LIKE '%-',concat('-',replace(PRICE_CURR,'-','')),PRICE_CURR), ' ', ''),',','.') AS float)) PRICE_CURR
,SUM(CAST(REPLACE(REPLACE(IIF(fqt.SUM_CURR LIKE '%-', CONCAT('-', REPLACE(SUM_CURR, '-', '')), SUM_CURR), ' ', ''), ',', '.') AS FLOAT)) SUM_CURR
--, AVG(cast(replace(REPLACE(iif(fqt.PRICE_UAH LIKE '%-',concat('-',replace(PRICE_UAH,'-','')),PRICE_UAH), ' ', ''),',','.') AS float)) PRICE_UAH
,SUM(CAST(REPLACE(REPLACE(IIF(fqt.SUM_UAH LIKE '%-', CONCAT('-', REPLACE(SUM_UAH, '-', '')), SUM_UAH), ' ', ''), ',', '.') AS FLOAT)) SUM_UAH
FROM Stage.fact_qlik_temp fqt
WHERE TRY_CAST(fqt.postingDate AS DATE) IS NOT NULL
AND fqt.accountingType = N'Бухгалтерський облік'
GROUP BY YEAR(TRY_CAST(fqt.postingDate AS DATE))
,MONTH(TRY_CAST(fqt.postingDate AS DATE))
,CAST(fqt.material AS INT)
,CAST(fqt.currency AS CHAR(3))) fact_qlik
LEFT JOIN Stage.fact_SAP_temp s
ON s.y = fact_qlik.y
AND s.m = fact_qlik.m
AND s.material = fact_qlik.material
AND s.currency = fact_qlik.currency






TRUNCATE TABLE Stage.fact_qlik_temp
TRUNCATE TABLE Stage.fact_SAP_temp




END




END
