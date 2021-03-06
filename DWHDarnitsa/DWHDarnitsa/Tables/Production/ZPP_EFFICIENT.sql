CREATE TABLE [Production].[ZPP_EFFICIENT]
(
	MANDT nvarchar(3),
	BEGDA nvarchar(8),
	ENDDA nvarchar(8),
	AUFNR nvarchar(12),
	CHARG nvarchar(10),
	RESURS_ID nvarchar(8),
	RESURS nvarchar(40),
	TXT nvarchar(40),
	PLNBEZ           NVARCHAR(18) ,
    MAKTX            NVARCHAR(40) ,
    GLTRI            NVARCHAR(8),
    GOT_PROD         DECIMAL(16, 3),
    BRAK             DECIMAL(16, 3),
    RESURS_WRK_TIME  DECIMAL(16, 3),
    TIME_GOT_PROD    DECIMAL(16, 3),
    TIME_BRAK        DECIMAL(16, 3),
    TIME_LOST        DECIMAL(16, 3),
    PROSTOY          DECIMAL(16, 3),
    FAZA_PEREHOD     DECIMAL(16, 3),
    OPER_STANDARD    DECIMAL(16, 3),
    PERENALADKI_TIME DECIMAL(16, 3),
    AVAIL            DECIMAL(16, 3),
    AVAIL_D1         DECIMAL(16, 3),
    AVAIL_D2         DECIMAL(16, 3),
    AVAIL_D3         DECIMAL(16, 3)
)
