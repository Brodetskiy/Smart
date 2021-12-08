CREATE TABLE [dar].[CRM](
[main_year_id] [int] NULL,
[main_month_id] [int] NULL,
[main_product_code_name] [nvarchar](200) NULL,
[main_product_name] [nvarchar](200) NULL,
[plan_SI_quantity] [float] NULL,
[plan_SI_sum] [float] NULL,
[fact_SI_quantity] [float] NULL,
[fact_SI_sum] [float] NULL,
[plan_area_quantity] [float] NULL,
[plan_area_sum] [float] NULL,
[fact_SISO_quantity] [float] NULL,
[fact_SISO_sum] [float] NULL,
[main_classifier_hospital_name] [nvarchar](50) NULL
) ON [PRIMARY]
GO




CREATE CLUSTERED INDEX [CRM_YearMonth] ON [dar].[CRM]
(
[main_year_id] ASC,
[main_month_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO