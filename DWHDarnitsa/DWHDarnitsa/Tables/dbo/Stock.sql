create table dbo.Stock
(
    Date_Stock      date,
    Year            int,
    Month           int,
    Code            int,
    LOT             nvarchar(max),
    QTY             nvarchar(max),
    Date_Coming     date,
    Date_Expiration date,
    Mon_Term        INT,
    qty_day_real    int,
    qty_day_exp     NVARCHAR(MAX)
)