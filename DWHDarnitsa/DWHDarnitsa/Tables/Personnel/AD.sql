﻿create table Personnel.AD
(
    MANDT            NVARCHAR(3) ,
    PERNR            NVARCHAR(8) ,
    NACHN            NVARCHAR(40) ,
    VORNA            NVARCHAR(40) ,
    MIDNM            NVARCHAR(40) ,
    GBDAT            NVARCHAR(8) ,
    BEGDA_PRV        NVARCHAR(8) ,
    ORGEH            NVARCHAR(8) ,
    PLANS            NVARCHAR(8) ,
    ENAME            NVARCHAR(40),
    ZZPLANS_TXT      NVARCHAR(255) ,
    ZZORGEH_TXT      NVARCHAR(255) ,
    BEGDA_PRM        NVARCHAR(8) ,
    EMAIL            NVARCHAR(241) ,
    AD_LOGIN         NVARCHAR(30),
    WRM_PHONE        NVARCHAR(30),
    INT_PHONE        NVARCHAR(30),
    MOB_PHONE        NVARCHAR(30),
    EMAIL_CHIEF      NVARCHAR(241),
    AD_LOGIN_CHIEF   NVARCHAR(30) ,
    PERNR_CHIEF      NVARCHAR(8) ,
    FIO              NVARCHAR(40) ,
    WRG_PHONE        NVARCHAR(30) ,
    WRK_PLACE        NVARCHAR(30) ,
    DEP_CODE         NVARCHAR(12) ,
    VACATION_DAYS    DECIMAL(10, 5) ,
    CODE_BONUS       NVARCHAR(25) ,
    CHIEF            NVARCHAR(1) ,
    ADDR1            NVARCHAR(255) ,
    ADDR2            NVARCHAR(255) ,
    PSTLZ_1          NVARCHAR(10) ,
    BEZEI_1          NVARCHAR(20) ,
    ORT02_1          NVARCHAR(40) ,
    ORT01_1          NVARCHAR(40) ,
    STRAS_1          NVARCHAR(60) ,
    HSNMR_1          NVARCHAR(10) ,
    POSTA_1          NVARCHAR(10) ,
    PSTLZ_3          NVARCHAR(10) ,
    BEZEI_3          NVARCHAR(20) ,
    ORT02_3          NVARCHAR(40) ,
    ORT01_3          NVARCHAR(40) ,
    STRAS_3          NVARCHAR(60) ,
    HSNMR_3          NVARCHAR(10) ,
    POSTA_3          NVARCHAR(10) ,
    GESCH            NVARCHAR(1) ,
    INTERNAL         NVARCHAR(1) ,
    MILITARY         NVARCHAR(1) ,
    MATERNITY        NVARCHAR(1) ,
    SICK             NVARCHAR(1) ,
    INVALID          NVARCHAR(1) ,
    DEPARTMENT_SHORT NVARCHAR(12) ,
    DEPARTMENT_NAME  NVARCHAR(100) ,
    VIDPUSTKA_BEGDA  NVARCHAR(8) ,
    VIDPUSTKA_ENDDA  NVARCHAR(8) ,
    VLASRAH_BEGDA    NVARCHAR(8) ,
    VLASRAH_ENDDA    NVARCHAR(8)
)