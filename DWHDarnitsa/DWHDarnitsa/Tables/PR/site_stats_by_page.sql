CREATE TABLE [PR].[site_stats_by_page]
(
	[date] date,
	[sourceMedium] nvarchar(max),
	[campaign] nvarchar(max),
	[pageTitle] nvarchar(max),
	[pagePath] nvarchar(max),
	[users] int,
	[sessions] int,
	[account] int
)
