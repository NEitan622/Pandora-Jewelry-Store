Create database store
go
USE [store]
GO
/****** Object:  Table [dbo].[categories]    Script Date: 03/02/2025 19:58:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categories](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[collections]    Script Date: 03/02/2025 19:58:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[collections](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customers]    Script Date: 03/02/2025 19:58:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customers](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](20) NOT NULL,
	[phone] [varchar](10) NOT NULL,
	[email] [varchar](30) NOT NULL,
	[birthdate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_details]    Script Date: 03/02/2025 19:58:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_details](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[order_id] [smallint] NULL,
	[product_id] [smallint] NULL,
	[quantity] [smallint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 03/02/2025 19:58:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[customer_id] [smallint] NOT NULL,
	[date] [datetime] NOT NULL,
	[payment] [float] NOT NULL,
	[difference] [float] NULL,
	[isPay] [bit] NOT NULL,
 CONSTRAINT [PK__orders__3213E83F9382F472] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 03/02/2025 19:58:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[id] [smallint] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[category_id] [smallint] NOT NULL,
	[collection_id] [smallint] NOT NULL,
	[description] [varchar](50) NULL,
	[price] [smallint] NOT NULL,
	[stock_quantity] [smallint] NOT NULL,
	[last_update] [datetime] NOT NULL,
 CONSTRAINT [PK__products__3213E83F351D8C57] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[categories] ON 
GO
INSERT [dbo].[categories] ([id], [name]) VALUES (1, N'צמידים')
GO
INSERT [dbo].[categories] ([id], [name]) VALUES (2, N'טבעות')
GO
INSERT [dbo].[categories] ([id], [name]) VALUES (3, N'עגילים')
GO
INSERT [dbo].[categories] ([id], [name]) VALUES (4, N'צ''ארמס')
GO
INSERT [dbo].[categories] ([id], [name]) VALUES (5, N'שרשראות')
GO
SET IDENTITY_INSERT [dbo].[categories] OFF
GO
SET IDENTITY_INSERT [dbo].[collections] ON 
GO
INSERT [dbo].[collections] ([id], [name]) VALUES (1, N'Pandora Moments')
GO
INSERT [dbo].[collections] ([id], [name]) VALUES (2, N'Pandora Me')
GO
INSERT [dbo].[collections] ([id], [name]) VALUES (3, N'Disney x Pandora')
GO
INSERT [dbo].[collections] ([id], [name]) VALUES (4, N'תכשיטי לבבות')
GO
SET IDENTITY_INSERT [dbo].[collections] OFF
GO
SET IDENTITY_INSERT [dbo].[customers] ON 
GO
INSERT [dbo].[customers] ([id], [name], [phone], [email], [birthdate]) VALUES (0, N'מרים וואלף', N'0556722858', N'm0556722858@gmail.com', CAST(N'2004-10-16' AS Date))
GO
INSERT [dbo].[customers] ([id], [name], [phone], [email], [birthdate]) VALUES (1, N'ריקי קרליבך', N'0527149667', N'r0527149667@gmail.com', CAST(N'1997-10-14' AS Date))
GO
INSERT [dbo].[customers] ([id], [name], [phone], [email], [birthdate]) VALUES (2, N'נחמי איתן', N'0556723622', N'nechamie10@gmail.com', CAST(N'2005-03-25' AS Date))
GO
INSERT [dbo].[customers] ([id], [name], [phone], [email], [birthdate]) VALUES (4, N'דסי איתן', N'0556707265', N'dasi@gmail.com', CAST(N'2001-07-04' AS Date))
GO
INSERT [dbo].[customers] ([id], [name], [phone], [email], [birthdate]) VALUES (6, N'אמא', N'0527662970', N'a0527662970@gmail.com', CAST(N'1974-12-16' AS Date))
GO
INSERT [dbo].[customers] ([id], [name], [phone], [email], [birthdate]) VALUES (7, N'תהילה', N'0548475665', N't5898@gmail.com', CAST(N'2002-01-28' AS Date))
GO
INSERT [dbo].[customers] ([id], [name], [phone], [email], [birthdate]) VALUES (8, N'ציבי', N'0527689817', N't@gmail.com', CAST(N'2000-01-28' AS Date))
GO
INSERT [dbo].[customers] ([id], [name], [phone], [email], [birthdate]) VALUES (9, N'תמר לוי', N'0556714522', N'tamar@gmail.com', CAST(N'2000-01-10' AS Date))
GO
INSERT [dbo].[customers] ([id], [name], [phone], [email], [birthdate]) VALUES (11, N'מיכל קופשיץ', N'0556722854', N'michal@gmail.com', CAST(N'2002-01-01' AS Date))
GO
INSERT [dbo].[customers] ([id], [name], [phone], [email], [birthdate]) VALUES (13, N'מירי', N'055258587', N'miri989@gmail.com', CAST(N'2004-01-05' AS Date))
GO
INSERT [dbo].[customers] ([id], [name], [phone], [email], [birthdate]) VALUES (15, N'אריה', N'055598555', N'm055445@gmail.com', CAST(N'2001-01-30' AS Date))
GO
SET IDENTITY_INSERT [dbo].[customers] OFF
GO
SET IDENTITY_INSERT [dbo].[order_details] ON 
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity]) VALUES (1, 63, 1, 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity]) VALUES (2, 65, 2, 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity]) VALUES (3, 63, 1, 2)
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity]) VALUES (4, 63, 2, 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity]) VALUES (5, 63, 1, 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity]) VALUES (6, 94, 2, 2)
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity]) VALUES (7, 94, 1, 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity]) VALUES (8, 96, 2, 2)
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity]) VALUES (9, 96, 1, 3)
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity]) VALUES (10, 97, 1, 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity]) VALUES (11, 98, 1, 3)
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity]) VALUES (12, 99, 1, 2)
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity]) VALUES (13, 100, 2, 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity]) VALUES (14, 101, 2, 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity]) VALUES (15, 102, 2, 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity]) VALUES (16, 103, 48, 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity]) VALUES (17, 103, 51, 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity]) VALUES (18, 103, 48, 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity]) VALUES (19, 103, 51, 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity]) VALUES (20, 103, 48, 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity]) VALUES (21, 103, 51, 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity]) VALUES (22, 104, 51, 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity]) VALUES (23, 104, 51, 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity]) VALUES (24, 106, 52, 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity]) VALUES (25, 107, 52, 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity]) VALUES (26, 107, 52, 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity]) VALUES (27, 108, 52, 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity]) VALUES (28, 110, 45, 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity]) VALUES (29, 110, 48, 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity]) VALUES (30, 112, 48, 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity]) VALUES (31, 112, 51, 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity]) VALUES (32, 113, 48, 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity]) VALUES (33, 113, 48, 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity]) VALUES (34, 116, 51, 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity]) VALUES (35, 119, 51, 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity]) VALUES (36, 121, 48, 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity]) VALUES (37, 122, 48, 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity]) VALUES (38, 122, 51, 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity]) VALUES (39, 123, 48, 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity]) VALUES (40, 123, 51, 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity]) VALUES (41, 123, 51, 1)
GO
INSERT [dbo].[order_details] ([id], [order_id], [product_id], [quantity]) VALUES (42, 123, 52, 1)
GO
SET IDENTITY_INSERT [dbo].[order_details] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (63, 8, CAST(N'2025-01-28T00:00:00.000' AS DateTime), 705.6, 78.399999999999977, 1)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (64, 8, CAST(N'2025-01-28T00:00:00.000' AS DateTime), 784, 78.399999999999977, 0)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (65, 8, CAST(N'2025-01-28T00:00:00.000' AS DateTime), 301.5, 33.5, 1)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (66, 0, CAST(N'2025-01-28T00:00:00.000' AS DateTime), 1677, 0, 0)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (67, 0, CAST(N'2025-01-28T00:00:00.000' AS DateTime), 784, 0, 0)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (68, 0, CAST(N'2025-01-28T00:00:00.000' AS DateTime), 1119, 0, 0)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (69, 0, CAST(N'2025-01-28T00:00:00.000' AS DateTime), 1454, 0, 0)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (70, 0, CAST(N'2025-01-28T00:00:00.000' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (71, 0, CAST(N'2025-01-28T00:00:00.000' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (72, 0, CAST(N'2025-01-28T00:00:00.000' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (73, 0, CAST(N'2025-01-28T00:00:00.000' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (74, 0, CAST(N'2025-01-28T00:00:00.000' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (75, 0, CAST(N'2025-01-28T00:00:00.000' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (76, 0, CAST(N'2025-01-28T00:00:00.000' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (77, 0, CAST(N'2025-01-28T00:00:00.000' AS DateTime), 784, 0, 0)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (78, 0, CAST(N'2025-01-28T00:00:00.000' AS DateTime), 1119, 0, 0)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (79, 0, CAST(N'2025-01-28T00:00:00.000' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (80, 0, CAST(N'2025-01-28T00:00:00.000' AS DateTime), 1233, 0, 0)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (81, 0, CAST(N'2025-01-28T00:00:00.000' AS DateTime), 784, 0, 0)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (82, 0, CAST(N'2025-01-28T00:00:00.000' AS DateTime), 1119, 0, 0)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (83, 0, CAST(N'2025-01-28T00:00:00.000' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (84, 0, CAST(N'2025-01-28T00:00:00.000' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (85, 0, CAST(N'2025-01-28T00:00:00.000' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (86, 0, CAST(N'2025-01-28T00:00:00.000' AS DateTime), 1233, 0, 0)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (87, 0, CAST(N'2025-01-28T00:00:00.000' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (88, 0, CAST(N'2025-01-28T00:00:00.000' AS DateTime), 1233, 0, 0)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (89, 8, CAST(N'2025-01-28T00:00:00.000' AS DateTime), 1411.2, 156.79999999999996, 0)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (90, 0, CAST(N'2025-01-28T00:00:00.000' AS DateTime), 1119, 0, 0)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (91, 0, CAST(N'2025-01-28T00:00:00.000' AS DateTime), 1568, 0, 0)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (92, 0, CAST(N'2025-01-28T00:00:00.000' AS DateTime), 784, 0, 0)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (93, 0, CAST(N'2025-01-28T00:00:00.000' AS DateTime), 1233, 0, 0)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (94, 0, CAST(N'2025-01-28T00:00:00.000' AS DateTime), 1233, 0, 1)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (95, 0, CAST(N'2025-01-28T00:00:00.000' AS DateTime), 1233, 0, 0)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (96, 0, CAST(N'2025-01-28T00:00:00.000' AS DateTime), 1903, 0, 1)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (97, 2, CAST(N'2025-01-28T00:00:00.000' AS DateTime), 335, 0, 1)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (98, 0, CAST(N'2025-01-28T00:00:00.000' AS DateTime), 1005, 0, 1)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (99, 0, CAST(N'2025-01-28T00:00:00.000' AS DateTime), 670, 0, 1)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (100, 0, CAST(N'2025-01-28T00:00:00.000' AS DateTime), 449, 0, 1)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (101, 2, CAST(N'2025-01-28T00:00:00.000' AS DateTime), 449, 0, 1)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (102, 2, CAST(N'2025-01-28T00:00:00.000' AS DateTime), 449, 0, 1)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (103, 2, CAST(N'2025-01-29T00:00:00.000' AS DateTime), 308, 0, 1)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (104, 2, CAST(N'2025-01-29T00:00:00.000' AS DateTime), 119, 0, 1)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (105, 2, CAST(N'2025-01-29T00:00:00.000' AS DateTime), 119, 0, 0)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (106, 0, CAST(N'2025-01-29T00:00:00.000' AS DateTime), 95, 0, 1)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (107, 9, CAST(N'2025-01-29T00:00:00.000' AS DateTime), 171, 19, 1)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (108, 0, CAST(N'2025-01-30T00:00:00.000' AS DateTime), 95, 0, 1)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (109, 0, CAST(N'2025-01-30T00:00:00.000' AS DateTime), 95, 0, 0)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (110, 0, CAST(N'2025-01-30T00:00:00.000' AS DateTime), 428, 0, 1)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (111, 0, CAST(N'2025-01-30T00:00:00.000' AS DateTime), 308, 0, 0)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (112, 0, CAST(N'2025-01-30T00:00:00.000' AS DateTime), 308, 0, 1)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (113, 2, CAST(N'2025-01-30T00:00:00.000' AS DateTime), 378, 0, 1)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (114, 2, CAST(N'2025-01-30T00:00:00.000' AS DateTime), 378, 0, 0)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (115, 2, CAST(N'2025-01-30T00:00:00.000' AS DateTime), 378, 0, 0)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (116, 0, CAST(N'2025-01-30T00:00:00.000' AS DateTime), 119, 0, 1)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (117, 0, CAST(N'2025-01-30T00:00:00.000' AS DateTime), 119, 0, 0)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (118, 0, CAST(N'2025-01-30T00:00:00.000' AS DateTime), 119, 0, 0)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (119, 9, CAST(N'2025-01-30T00:00:00.000' AS DateTime), 107.10000000000001, 11.899999999999992, 1)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (120, 9, CAST(N'2025-01-30T00:00:00.000' AS DateTime), 0, 0, 0)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (121, 0, CAST(N'2025-01-30T00:00:00.000' AS DateTime), 189, 0, 1)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (122, 0, CAST(N'2025-01-30T00:00:00.000' AS DateTime), 308, 0, 1)
GO
INSERT [dbo].[orders] ([id], [customer_id], [date], [payment], [difference], [isPay]) VALUES (123, 0, CAST(N'2025-01-30T00:00:00.000' AS DateTime), 469.8, 52.199999999999989, 1)
GO
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 
GO
INSERT [dbo].[products] ([id], [name], [category_id], [collection_id], [description], [price], [stock_quantity], [last_update]) VALUES (1, N'צמיד בנגל כסף', 1, 1, N'Best Seller', 335, 92, CAST(N'2025-01-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[products] ([id], [name], [category_id], [collection_id], [description], [price], [stock_quantity], [last_update]) VALUES (2, N'צמיד טניס כסף מרובע נוצץ', 1, 1, N'Best Seller', 449, 77, CAST(N'2025-01-28T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[products] ([id], [name], [category_id], [collection_id], [description], [price], [stock_quantity], [last_update]) VALUES (3, N'צמיד ממומנס ציפוי זהב', 1, 4, N'Best Seller', 779, 60, CAST(N'2025-12-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[products] ([id], [name], [category_id], [collection_id], [description], [price], [stock_quantity], [last_update]) VALUES (4, N'צמיד כסף פאווה חוליות עבות', 1, 1, N'BACK IN STOCK', 869, 1, CAST(N'2025-12-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[products] ([id], [name], [category_id], [collection_id], [description], [price], [stock_quantity], [last_update]) VALUES (6, N' צמיד טניס כסף גלואו', 1, 1, N'Best SellerBest Seller', 389, 50, CAST(N'2025-12-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[products] ([id], [name], [category_id], [collection_id], [description], [price], [stock_quantity], [last_update]) VALUES (7, N'צמיד רוז מומנטס כתר פנדורה נוצץ', 1, 1, NULL, 779, 40, CAST(N'2025-12-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[products] ([id], [name], [category_id], [collection_id], [description], [price], [stock_quantity], [last_update]) VALUES (8, N'סט צמיד כסף לינקים ודאבל סטיילינג מי', 1, 2, NULL, 504, 100, CAST(N'2025-12-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[products] ([id], [name], [category_id], [collection_id], [description], [price], [stock_quantity], [last_update]) VALUES (10, N'צמיד עור שחור', 1, 1, NULL, 295, 3, CAST(N'2025-12-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[products] ([id], [name], [category_id], [collection_id], [description], [price], [stock_quantity], [last_update]) VALUES (11, N'סוגר קרבין ME צמיד רוז לינקים צאנקי  ', 1, 2, N'Best Seller', 825, 100, CAST(N'2025-12-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[products] ([id], [name], [category_id], [collection_id], [description], [price], [stock_quantity], [last_update]) VALUES (15, N'צמיד כסף לינקים מי עם סוגר קרבין', 1, 2, N'Best Seller', 335, 50, CAST(N'2025-12-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[products] ([id], [name], [category_id], [collection_id], [description], [price], [stock_quantity], [last_update]) VALUES (16, N'צמיד מומנטס כסף כוכב הצפון', 1, 1, N'NEW COLLECTION', 379, 200, CAST(N'2025-12-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[products] ([id], [name], [category_id], [collection_id], [description], [price], [stock_quantity], [last_update]) VALUES (18, N'צמיד כסף מומנטס היילו בשיבוץ זרקונים', 1, 1, N'Best Seller', 389, 500, CAST(N'2025-12-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[products] ([id], [name], [category_id], [collection_id], [description], [price], [stock_quantity], [last_update]) VALUES (19, N'צמיד כסף מומנטס קיוט מיקי מאוס', 1, 3, N'BACK IN STOC', 425, 100, CAST(N'2025-12-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[products] ([id], [name], [category_id], [collection_id], [description], [price], [stock_quantity], [last_update]) VALUES (20, N'צמיד כסף מומנטס לב המשפחה', 1, 4, N'Best Seller', 389, 410, CAST(N'2025-12-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[products] ([id], [name], [category_id], [collection_id], [description], [price], [stock_quantity], [last_update]) VALUES (21, N'צמיד קונספט כסף עם סוגר לב פנדורה רוז בשיבוץ פאווה', 1, 4, N'Best Seller', 529, 100, CAST(N'2025-12-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[products] ([id], [name], [category_id], [collection_id], [description], [price], [stock_quantity], [last_update]) VALUES (22, N'טבעת לב מנצנץ', 2, 4, N'Best Seller', 379, 0, CAST(N'2025-12-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[products] ([id], [name], [category_id], [collection_id], [description], [price], [stock_quantity], [last_update]) VALUES (23, N'טבעת כסף דאבל לב מנצנץ', 2, 4, N'NEW COLLECTION', 475, 5, CAST(N'2025-12-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[products] ([id], [name], [category_id], [collection_id], [description], [price], [stock_quantity], [last_update]) VALUES (25, N'טבעת כסף איטרניטי נוצצת', 2, 1, N'BACK IN STOC', 379, 500, CAST(N'2025-12-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[products] ([id], [name], [category_id], [collection_id], [description], [price], [stock_quantity], [last_update]) VALUES (26, N'טבעת כסף פלאוור קראון', 2, 1, N'Best Seller', 285, 500, CAST(N'2025-12-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[products] ([id], [name], [category_id], [collection_id], [description], [price], [stock_quantity], [last_update]) VALUES (27, N'טבעת כסף שוטינג סטאר', 2, 1, N'NEW COLLECTION', 239, 10, CAST(N'2025-12-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[products] ([id], [name], [category_id], [collection_id], [description], [price], [stock_quantity], [last_update]) VALUES (28, N'טבעת כסף מלופפת ספרקלינג', 2, 1, N'Best Seller', 425, 600, CAST(N'2025-12-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[products] ([id], [name], [category_id], [collection_id], [description], [price], [stock_quantity], [last_update]) VALUES (29, N'טבעת כפולה רוז לאב איט', 2, 4, N'NEW COLLECTIONNEW COLLECTION', 475, 300, CAST(N'2025-12-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[products] ([id], [name], [category_id], [collection_id], [description], [price], [stock_quantity], [last_update]) VALUES (30, N'טבעת רוז לב מנצנץ', 2, 4, N'Best Seller', 425, 400, CAST(N'2025-12-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[products] ([id], [name], [category_id], [collection_id], [description], [price], [stock_quantity], [last_update]) VALUES (32, N'טבעת רוז ספרקלינג טוויסט', 2, 1, N'Best Seller', 555, 255, CAST(N'2025-12-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[products] ([id], [name], [category_id], [collection_id], [description], [price], [stock_quantity], [last_update]) VALUES (33, N'טבעת כסף טייני הארטס', 2, 4, NULL, 285, 442, CAST(N'2025-12-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[products] ([id], [name], [category_id], [collection_id], [description], [price], [stock_quantity], [last_update]) VALUES (34, N'טבעת כסף משאלה מנצנצת', 2, 1, NULL, 285, 232, CAST(N'2025-12-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[products] ([id], [name], [category_id], [collection_id], [description], [price], [stock_quantity], [last_update]) VALUES (35, N'טבעת רוז נסיכותית חצי משובצת', 2, 1, NULL, 219, 356, CAST(N'2025-12-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[products] ([id], [name], [category_id], [collection_id], [description], [price], [stock_quantity], [last_update]) VALUES (37, N'טבעת רוז מי פרמידה', 2, 2, NULL, 239, 141, CAST(N'2025-12-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[products] ([id], [name], [category_id], [collection_id], [description], [price], [stock_quantity], [last_update]) VALUES (38, N'טבעת ציפוי זהב מי אמייל שחור', 2, 2, N'NEW COLLECTION', 285, 252, CAST(N'2025-12-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[products] ([id], [name], [category_id], [collection_id], [description], [price], [stock_quantity], [last_update]) VALUES (39, N'טבעת כסף מי שייני טאץ', 2, 2, NULL, 189, 212, CAST(N'2025-12-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[products] ([id], [name], [category_id], [collection_id], [description], [price], [stock_quantity], [last_update]) VALUES (42, N'טבעת כסף חותם דאבל פאווה', 2, 1, N'BACK IN STOC', 379, 352, CAST(N'2025-12-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[products] ([id], [name], [category_id], [collection_id], [description], [price], [stock_quantity], [last_update]) VALUES (43, N'טבעת כסף אלגנטית כפולה', 2, 1, N'Best Seller', 425, 252, CAST(N'2025-12-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[products] ([id], [name], [category_id], [collection_id], [description], [price], [stock_quantity], [last_update]) VALUES (44, N'עגילים כסף לב מנצנץ', 3, 4, N'Best Seller', 285, 141, CAST(N'2025-12-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[products] ([id], [name], [category_id], [collection_id], [description], [price], [stock_quantity], [last_update]) VALUES (45, N'עגילי כסף צמודים', 3, 1, N'Best Seller', 239, 110, CAST(N'2025-01-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[products] ([id], [name], [category_id], [collection_id], [description], [price], [stock_quantity], [last_update]) VALUES (46, N'עגילי כסף צמודים אינפינטי לאב', 3, 4, NULL, 239, 424, CAST(N'2025-12-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[products] ([id], [name], [category_id], [collection_id], [description], [price], [stock_quantity], [last_update]) VALUES (47, N'עגילי כסף פפיון גדול', 3, 1, N'NEW COLLECTION', 285, 200, CAST(N'2025-12-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[products] ([id], [name], [category_id], [collection_id], [description], [price], [stock_quantity], [last_update]) VALUES (48, N'עגילי כסף קטנים לבבות אי סימטריים', 3, 4, N'Best Seller', 189, 190, CAST(N'2025-01-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[products] ([id], [name], [category_id], [collection_id], [description], [price], [stock_quantity], [last_update]) VALUES (49, N'עגילי כסף צמודים נוצצים לב כפול', 3, 4, N'Best Seller', 285, 424, CAST(N'2025-12-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[products] ([id], [name], [category_id], [collection_id], [description], [price], [stock_quantity], [last_update]) VALUES (50, N'עגילי כסף צמודים ביג לאב', 3, 4, NULL, 239, 255, CAST(N'2025-12-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[products] ([id], [name], [category_id], [collection_id], [description], [price], [stock_quantity], [last_update]) VALUES (51, N'צארמ כסף סטאר לאב', 4, 4, N'Best Seller', 119, 241, CAST(N'2025-01-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[products] ([id], [name], [category_id], [collection_id], [description], [price], [stock_quantity], [last_update]) VALUES (52, N'צארמ כסף שרשרת ומנעול', 4, 1, N'Best Seller', 95, 395, CAST(N'2025-01-30T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[products] ([id], [name], [category_id], [collection_id], [description], [price], [stock_quantity], [last_update]) VALUES (53, N'קליפס כסף משפחה ', 4, 4, N'Best Seller', 189, 900, CAST(N'2025-12-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[products] ([id], [name], [category_id], [collection_id], [description], [price], [stock_quantity], [last_update]) VALUES (54, N'תליון כסף חמסה מגנה', 4, 1, NULL, 139, 200, CAST(N'2025-12-01T00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[products] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK]    Script Date: 03/02/2025 19:58:39 ******/
ALTER TABLE [dbo].[customers] ADD  CONSTRAINT [UK] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD  CONSTRAINT [FK__order_det__order__31EC6D26] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([id])
GO
ALTER TABLE [dbo].[order_details] CHECK CONSTRAINT [FK__order_det__order__31EC6D26]
GO
ALTER TABLE [dbo].[order_details]  WITH CHECK ADD  CONSTRAINT [FK__order_det__produ__32E0915F] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[order_details] CHECK CONSTRAINT [FK__order_det__produ__32E0915F]
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD  CONSTRAINT [FK__orders__customer__2E1BDC42] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customers] ([id])
GO
ALTER TABLE [dbo].[orders] CHECK CONSTRAINT [FK__orders__customer__2E1BDC42]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FK__products__catego__286302EC] FOREIGN KEY([category_id])
REFERENCES [dbo].[categories] ([id])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FK__products__catego__286302EC]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FK__products__compan__29572725] FOREIGN KEY([collection_id])
REFERENCES [dbo].[collections] ([id])
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FK__products__compan__29572725]
GO
