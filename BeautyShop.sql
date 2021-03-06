USE [master]
GO
/****** Object:  Database [KosmeticDB]    Script Date: 25.01.2022 15:57:26 ******/
CREATE DATABASE [KosmeticDB]
GO
USE [KosmeticDB]
GO
/****** Object:  Table [dbo].[AttachedProduct]    Script Date: 25.01.2022 15:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttachedProduct](
	[MainProductID] [int] NOT NULL,
	[AttachedProductID] [int] NOT NULL,
	[Nothing] [nvarchar](4) NULL,
 CONSTRAINT [PK_AttachedProduct] PRIMARY KEY CLUSTERED 
(
	[MainProductID] ASC,
	[AttachedProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 25.01.2022 15:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
	[Birthday] [date] NULL,
	[RegistrationDate] [datetime] NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[GenderCode] [nchar](1) NOT NULL,
	[PhotoPath] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientService]    Script Date: 25.01.2022 15:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NOT NULL,
	[ServiceID] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[Comment] [nvarchar](max) NULL,
 CONSTRAINT [PK_ClientService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentByService]    Script Date: 25.01.2022 15:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentByService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientServiceID] [int] NOT NULL,
	[DocumentPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_DocumentByService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 25.01.2022 15:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[Code] [nchar](1) NOT NULL,
	[Name] [nvarchar](10) NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 25.01.2022 15:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[StartDate] [date] NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 25.01.2022 15:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Cost] [money] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[MainImagePath] [nvarchar](1000) NOT NULL,
	[ManufacturerID] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductPhoto]    Script Date: 25.01.2022 15:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ProductPhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSale]    Script Date: 25.01.2022 15:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSale](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SaleDate] [datetime] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ClientServiceID] [int] NULL,
 CONSTRAINT [PK_ProductSale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 25.01.2022 15:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Cost] [money] NOT NULL,
	[DurationInSeconds] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Discount] [float] NULL,
	[MainImagePath] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServicePhoto]    Script Date: 25.01.2022 15:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServicePhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ServicePhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 25.01.2022 15:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](30) NOT NULL,
	[Color] [nchar](6) NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagOfClient]    Script Date: 25.01.2022 15:57:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagOfClient](
	[ClientID] [int] NOT NULL,
	[TagID] [int] NOT NULL,
 CONSTRAINT [PK_TagOfClient] PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AttachedProduct] ([MainProductID], [AttachedProductID], [Nothing]) VALUES (1, 8, NULL)
GO
SET IDENTITY_INSERT [dbo].[Manufacturer] ON 

INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (1, N'AMSARVEDA', CAST(N'2015-12-11' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (2, N'ANDALOU', CAST(N'2015-11-11' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (3, N'ANTI AGE', CAST(N'2015-11-01' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (4, N'Agent Netty PRO', CAST(N'2016-03-17' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (5, N'Altanya', CAST(N'2015-03-23' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (6, N'BIOSelect', CAST(N'2016-12-29' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (7, N'Bel Savon', CAST(N'2015-04-20' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (8, N'Blue Beautifly', CAST(N'2017-01-15' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (9, N'DIONY', CAST(N'2017-12-03' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (10, N'Green Mama', CAST(N'2016-11-11' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (11, N'Green era', CAST(N'2017-07-28' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (12, N'MAGIC HERBS', CAST(N'2016-02-23' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (13, N'MATSESTA', CAST(N'2018-04-21' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (14, N'Milotto', CAST(N'2016-06-19' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (15, N'Natura Botanica', CAST(N'2016-05-02' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (16, N'Natura Siberica', CAST(N'2018-01-20' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (17, N'SATIVA', CAST(N'2017-01-13' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (18, N'SHELK Cosmetics', CAST(N'2017-01-19' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (19, N'SIBERINA', CAST(N'2015-10-01' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (20, N'SLAVIC HAIR Company', CAST(N'2015-12-20' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (21, N'VIQQO — производитель инновационной уходовой косметики', CAST(N'2017-10-12' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (22, N'Weleda', CAST(N'2015-04-14' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (23, N'АЙРОН БАРБЕР', CAST(N'2018-04-16' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (24, N'АЛВА', CAST(N'2016-08-18' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (25, N'АлтайЯ', CAST(N'2015-07-04' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (26, N'Алтэя', CAST(N'2018-05-14' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (27, N'Альпика', CAST(N'2018-05-31' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (28, N'Аравия', CAST(N'2015-06-23' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (29, N'АромаВятка', CAST(N'2016-10-01' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (30, N'Арт-Визаж', CAST(N'2018-04-15' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (31, N'Биопин ФАРМА', CAST(N'2016-08-13' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (32, N'Валери-Д', CAST(N'2018-06-28' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (33, N'ДОМ ПРИРОДЫ', CAST(N'2015-11-25' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (34, N'ЕвроТек', CAST(N'2017-10-21' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (35, N'Жерминаль', CAST(N'2017-04-04' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (36, N'Живая косметика Сибири', CAST(N'2015-03-05' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (37, N'ИРИДА-НЕВА', CAST(N'2017-05-27' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (38, N'Клеона', CAST(N'2017-10-29' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (39, N'Колорит', CAST(N'2017-12-22' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (40, N'Лаборатория натуральной косметики MIXIT', CAST(N'2018-06-12' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (41, N'Малавит', CAST(N'2017-09-18' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (42, N'Мастерская Fitoland Organic', CAST(N'2017-07-10' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (43, N'НИКОЛЬ', CAST(N'2017-02-27' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (44, N'РУСХИМТЕХ', CAST(N'2017-07-03' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (45, N'Русская косметика', CAST(N'2015-07-19' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (46, N'Славяна', CAST(N'2015-03-09' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (47, N'Фитокосметик', CAST(N'2016-03-01' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (48, N'Флора', CAST(N'2016-01-18' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (49, N'Черный бриллиант', CAST(N'2016-01-07' AS Date))
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (50, N'ЭКО ТАВРИДА', CAST(N'2016-06-27' AS Date))
SET IDENTITY_INSERT [dbo].[Manufacturer] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (1, N'S.O.S. средство против локальных несовершенств кожи', 870.0000, 1, N'', N'Товары салона красоты\7847905-1.jpg', 22)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (2, N'Антивозрастная коллекция Освежающий тоник Цветочный', 940.0000, 1, N'', N'Товары салона красоты\3432442-1.jpg', 2)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (3, N'Антивозрастной крем для лица с органическими ягодами годжи', 990.0000, 0, N'', N'Товары салона красоты\6433981-1.jpg', 8)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (4, N'Восстанавливающая маска для лица', 630.0000, 0, N'', N'Товары салона красоты\3432465-1.jpg', 2)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (5, N'Восстанавливающий крем для лица с органическим шиповником', 960.0000, 1, N'', N'Товары салона красоты\6433984-1.jpg', 8)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (6, N'Гималайская грязевая маска антиоксидантная', 660.0000, 1, N'', N'Товары салона красоты\6556454-1.jpg', 1)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (7, N'Гималайская грязевая маска восстанавливающая', 640.0000, 1, N'', N'Товары салона красоты\6556455-1.jpg', 1)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (8, N'Гранатовая интенсивная сыворотка-лифтинг', 720.0000, 1, N'', N'Товары салона красоты\1781670-1.jpg', 22)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (9, N'Гранатовый дневной крем-лифтинг', 800.0000, 1, N'', N'Товары салона красоты\1781695-1.jpg', 22)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (10, N'Гранатовый ночной крем-лифтинг', 560.0000, 1, N'', N'Товары салона красоты\1781696-1.jpg', 22)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (11, N'Деликатное очищающее молочко', 680.0000, 1, N'', N'Товары салона красоты\1781675-1.jpg', 22)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (12, N'Деликатное питательное масло для лица', 930.0000, 1, N'', N'Товары салона красоты\2262226-1.jpg', 22)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (13, N'Деликатный питательный крем', 890.0000, 1, N'', N'Товары салона красоты\1781676-1.jpg', 22)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (14, N'Деликатный увлажняющий крем', 940.0000, 1, N'', N'Товары салона красоты\1781680-1.jpg', 22)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (15, N'Живительный тоник для лица', 770.0000, 0, N'', N'Товары салона красоты\2008486-1.jpg', 22)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (16, N'Ирисовый освежающий дневной крем', 740.0000, 1, N'', N'Товары салона красоты\1781693-1.jpg', 22)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (17, N'Ирисовый освежающий ночной крем', 840.0000, 1, N'', N'Товары салона красоты\1781674-1.jpg', 22)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (18, N'Ирисовый освежающий увлажняющий крем', 720.0000, 1, N'', N'Товары салона красоты\1953276-1.jpg', 22)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (19, N'Коллекция Кокосовая, Очищающая пенка для лица с экстрактами кактуса', 540.0000, 1, N'', N'Товары салона красоты\3472602-1.jpg', 2)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (20, N'Коллекция Кокосовая, Увлажняющий ночной крем с экстрактами кактуса', 700.0000, 1, N'', N'Товары салона красоты\3472608-1.jpg', 2)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (21, N'Коллекция Кокосовая, Укрепляющая сыворотка с экстрактами кактуса', 680.0000, 1, N'', N'Товары салона красоты\3472604-1.jpg', 2)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (22, N'Коллекция Сияние, Очищающая крем-пенка Лимон Мейера', 750.0000, 1, N'', N'Товары салона красоты\3472591-1.jpg', 2)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (23, N'Крем PERFECT выравнивающий тон лица натуральный', 780.0000, 1, N'', N'Товары салона красоты\9939700-1.jpg', 13)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (24, N'Крем SILK для чувствительной кожи лица натуральный', 740.0000, 1, N'', N'Товары салона красоты\9939701-1.jpg', 13)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (25, N'Крем для лица с антиоксидантами органической клюквы', 980.0000, 0, N'', N'Товары салона красоты\6433979-1.jpg', 8)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (26, N'Крем питательный тонизирующий ночной', 950.0000, 1, N'', N'Товары салона красоты\3388879-1.jpg', 6)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (27, N'Крем против морщин для глаз', 570.0000, 0, N'', N'Товары салона красоты\5427580-1.jpg', 6)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (28, N'Крем-маска WOW EFFECT омолаживающая для лица натуральная', 950.0000, 1, N'', N'Товары салона красоты\9939704-1.jpg', 13)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (29, N'Лифтинг-сыворотка для лица', 930.0000, 0, N'', N'Товары салона красоты\6556462-1.jpg', 1)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (30, N'Лифтинг-сыворотка для лица с гиалуроновой кислотой', 610.0000, 1, N'', N'Товары салона красоты\9631446-1.jpg', 9)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (31, N'Маска для лица увлажняющая и тонизирующая', 860.0000, 1, N'', N'Товары салона красоты\6556451-1.jpg', 1)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (32, N'Маска-пленка для глубокого очищения пор', 920.0000, 1, N'', N'Товары салона красоты\6556453-1.jpg', 1)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (33, N'Маска-пленка отшелушивающая с лифтинг-эффектом', 860.0000, 1, N'', N'Товары салона красоты\6556452-1.jpg', 1)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (34, N'Масло для лица массажное, с эффектом Лифтинга', 500.0000, 0, N'', N'Товары салона красоты\6953169-1.jpg', 15)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (35, N'Масло персиковое', 280.0000, 1, N'', N'Товары салона красоты\6691688-1.jpg', 15)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (36, N'Масло после бритья Натуральное, Лимон и Корица', 300.0000, 1, N'', N'Товары салона красоты\7528031-1.jpg', 15)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (37, N'Масло праймер для лица (основа под макияж), Выравнивание', 530.0000, 1, N'', N'Товары салона красоты\6953159-1.jpg', 15)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (38, N'Масло сладкого миндаля', 250.0000, 1, N'', N'Товары салона красоты\6691687-1.jpg', 15)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (39, N'Массажный крем для лица с увлажняющим и тонизирующим эффектом', 740.0000, 1, N'', N'Товары салона красоты\6556449-1.jpg', 1)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (40, N'Мягкая пенка для умывания', 680.0000, 0, N'', N'Товары салона красоты\5625224-1.jpg', 22)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (41, N'Натуральная пенка для умывания, с ароматом розового дерева', 750.0000, 0, N'', N'Товары салона красоты\6953177-1.jpg', 15)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (42, N'Органический тонер с экстрактом Розы', 960.0000, 1, N'', N'Товары салона красоты\7889950-1.jpg', 8)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (43, N'Органическое 100% аргановое масло', 760.0000, 1, N'', N'Товары салона красоты\6433982-1.jpg', 8)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (44, N'Очищающая коллекция Ночной восстанавливающий крем для лица', 570.0000, 1, N'', N'Товары салона красоты\3432453-1.jpg', 2)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (45, N'Очищающий гель для комбинированной и жирной кожи лица', 980.0000, 1, N'', N'Товары салона красоты\6556457-1.jpg', 1)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (46, N'Очищающий гель для нормальной и сухой кожи лица', 720.0000, 1, N'', N'Товары салона красоты\6556458-1.jpg', 1)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (47, N'Очищающий гель для умывания', 720.0000, 0, N'', N'Товары салона красоты\7847906-1.jpg', 22)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (48, N'Пена для бритья Натуральная, Лимон и Корица', 470.0000, 1, N'', N'Товары салона красоты\7528034-1.jpg', 15)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (49, N'Пенка для лица для чувствительной кожи', 630.0000, 1, N'', N'Товары салона красоты\3472601-1.jpg', 2)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (50, N'Пенка для умывания Натуральная, Лимон и корица', 280.0000, 1, N'', N'Товары салона красоты\7528032-1.jpg', 15)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (51, N'Пенка для умывания, для жирной и комбинированной кожи', 780.0000, 1, N'', N'Товары салона красоты\9631437-1.jpg', 9)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (52, N'Пенка для умывания, для нормальной кожи', 400.0000, 1, N'', N'Товары салона красоты\9631438-1.jpg', 9)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (53, N'Пенка для умывания, для сухой и чувствительной кожи', 440.0000, 1, N'', N'Товары салона красоты\9631439-1.jpg', 9)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (54, N'Питательный крем для лица', 800.0000, 0, N'', N'Товары салона красоты\6556464-1.jpg', 1)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (55, N'Подарочный набор For HIM, Сильный мужчина', 900.0000, 1, N'', N'Товары салона красоты\7299377-1.jpg', 15)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (56, N'Подарочный набор For MEN', 840.0000, 1, N'', N'Товары салона красоты\7299378-1.jpg', 15)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (57, N'Подарочный набор Travel, в Командировку, мужской', 880.0000, 1, N'', N'Товары салона красоты\7299376-1.jpg', 15)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (58, N'Подарочный набор Глубокое Очищение', 860.0000, 1, N'', N'Товары салона красоты\6964196-1.jpg', 15)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (59, N'Подарочный набор Мягкое Очищение', 850.0000, 1, N'', N'Товары салона красоты\6964195-1.jpg', 15)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (60, N'Подарочный набор Сияние', 630.0000, 1, N'', N'Товары салона красоты\6964198-1.jpg', 15)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (61, N'Подарочный набор Сияние и Красота', 570.0000, 1, N'', N'Товары салона красоты\6964199-1.jpg', 15)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (62, N'Подарочный набор Супер Увлажнение', 830.0000, 1, N'', N'Товары салона красоты\6964197-1.jpg', 15)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (63, N'Розовое растительное мыло', 470.0000, 1, N'', N'Товары салона красоты\1781711-1.jpg', 22)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (64, N'Розовый разглаживающий увлажняющий крем', 890.0000, 1, N'', N'Товары салона красоты\1781679-1.jpg', 22)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (65, N'Солнцезащитный лосьон для лица и тела', 830.0000, 1, N'', N'Товары салона красоты\6556469-1.jpg', 1)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (66, N'Специальный крем для клеточного восстановления', 920.0000, 0, N'', N'Товары салона красоты\6556466-1.jpg', 1)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (67, N'Сыворотка COUPEROSE укрепляющая сосуды натуральная', 590.0000, 1, N'', N'Товары салона красоты\9939714-1.jpg', 13)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (68, N'Сыворотка PERFECT SERUM депигментирующая натуральная', 710.0000, 1, N'', N'Товары салона красоты\9939719-1.jpg', 13)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (69, N'Сыворотка для кожи вокруг глаз с гиалуроновой кислотой', 690.0000, 1, N'', N'Товары салона красоты\9631447-1.jpg', 9)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (70, N'Сыворотка для лица с гиалуроновой кислотой, для нормальной кожи', 560.0000, 1, N'', N'Товары салона красоты\9631445-1.jpg', 9)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (71, N'Сыворотка для лица с гиалуроновой кислотой, для сухой и чувствительной кожи', 590.0000, 0, N'', N'Товары салона красоты\9631448-1.jpg', 9)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (72, N'Тонизирующая сыворотка для лица', 780.0000, 1, N'', N'Товары салона красоты\6556461-1.jpg', 1)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (73, N'Тонизирующее очищающее средство 2 в 1', 640.0000, 1, N'', N'Товары салона красоты\2008488-1.jpg', 22)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (74, N'Тонизирующий крем для лица', 800.0000, 1, N'', N'Товары салона красоты\6556465-1.jpg', 1)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (75, N'Тоник ACTIVE для возрастной кожи лица натуральный', 720.0000, 1, N'', N'Товары салона красоты\9939709-1.jpg', 13)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (76, N'Тоник для лица дневной, Витаминный', 800.0000, 1, N'', N'Товары салона красоты\7293278-1.jpg', 15)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (77, N'Тоник для лица, Успокаивающий, для всех типов кожи', 410.0000, 1, N'', N'Товары салона красоты\6953158-1.jpg', 15)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (78, N'Тоник для лица, для жирной и проблемной кожи', 600.0000, 1, N'', N'Товары салона красоты\9631442-1.jpg', 9)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (79, N'Тоник для лица, для сухой и нормальной кожи', 490.0000, 1, N'', N'Товары салона красоты\9631443-1.jpg', 9)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (80, N'Тоник для ухода за жирной и комбинированной кожей', 800.0000, 1, N'', N'Товары салона красоты\6556460-1.jpg', 1)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (81, N'Тоник для ухода за сухой и нормальной кожей', 990.0000, 1, N'', N'Товары салона красоты\6556459-1.jpg', 1)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (82, N'Тоник-пилинг для лица EXFOLIANT на основе фруктовых кислот натуральный', 660.0000, 1, N'', N'Товары салона красоты\9939710-1.jpg', 13)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (83, N'Увлажняющая эмульсия для лица', 910.0000, 1, N'', N'Товары салона красоты\6556463-1.jpg', 1)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (84, N'Увлажняющий 24-часовой крем против морщин', 910.0000, 1, N'', N'Товары салона красоты\2697576-1.jpg', 6)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (85, N'Увлажняющий крем', 730.0000, 0, N'', N'Товары салона красоты\1781678-1.jpg', 22)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (86, N'Универсальный питательный крем SKIN FOOD', 640.0000, 1, N'', N'Товары салона красоты\2351755-1.jpg', 22)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (87, N'Ухаживающее масло для лица, восстанавливает кожу', 420.0000, 1, N'', N'Товары салона красоты\6953176-1.jpg', 15)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (88, N'Ухаживающее масло, против сухости кожи', 410.0000, 1, N'', N'Товары салона красоты\6953160-1.jpg', 15)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (89, N'Чистящая пена-гель для лица', 550.0000, 1, N'', N'Товары салона красоты\2697586-1.jpg', 6)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (90, N'Эфирное масло бергамота', 380.0000, 1, N'', N'Товары салона красоты\7064315-1.jpg', 15)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (91, N'Эфирное масло жасмин', 610.0000, 1, N'', N'Товары салона красоты\7064330-1.jpg', 15)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (92, N'Эфирное масло корицы', 370.0000, 1, N'', N'Товары салона красоты\7064335-1.jpg', 15)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (93, N'Эфирное масло лаванды', 570.0000, 1, N'', N'Товары салона красоты\7064314-1.jpg', 15)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (94, N'Эфирное масло лемонграсс', 380.0000, 1, N'', N'Товары салона красоты\7064323-1.jpg', 15)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (95, N'Эфирное масло лимона', 330.0000, 1, N'', N'Товары салона красоты\7064322-1.jpg', 15)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (96, N'Эфирное масло мелиссы', 380.0000, 1, N'', N'Товары салона красоты\7064333-1.jpg', 15)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (97, N'Эфирное масло перечной мяты', 390.0000, 0, N'', N'Товары салона красоты\7064324-1.jpg', 15)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (98, N'Эфирное масло розовое дерево', 510.0000, 0, N'', N'Товары салона красоты\7064326-1.jpg', 15)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (99, N'Эфирное масло чайного дерева', 410.0000, 1, N'', N'Товары салона красоты\7064334-1.jpg', 15)
GO
INSERT [dbo].[Product] ([ID], [Title], [Cost], [IsActive], [Description], [MainImagePath], [ManufacturerID]) VALUES (100, N'Эфирное масло эвкалипт', 410.0000, 1, N'', N'Товары салона красоты\7064320-1.jpg', 15)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductPhoto] ON 

INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (1, 18, N' Товары салона красоты\1953276-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (2, 1, N' Товары салона красоты\7847905-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (3, 69, N' Товары салона красоты\9631447-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (4, 8, N' Товары салона красоты\1781670-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (5, 76, N' Товары салона красоты\7293278-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (6, 9, N' Товары салона красоты\1781695-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (7, 39, N' Товары салона красоты\6556449-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (8, 10, N' Товары салона красоты\1781696-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (9, 33, N' Товары салона красоты\6556452-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (10, 11, N' Товары салона красоты\1781675-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (11, 66, N' Товары салона красоты\6556466-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (12, 12, N' Товары салона красоты\2262226-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (13, 85, N' Товары салона красоты\1781678-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (14, 13, N' Товары салона красоты\1781676-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (15, 4, N' Товары салона красоты\3432465-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (16, 14, N' Товары салона красоты\1781680-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (17, 24, N' Товары салона красоты\9939701-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (18, 15, N' Товары салона красоты\2008486-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (19, 60, N' Товары салона красоты\6964198-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (20, 16, N' Товары салона красоты\1781693-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (21, 48, N' Товары салона красоты\7528034-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (22, 17, N' Товары салона красоты\1781674-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (23, 26, N' Товары салона красоты\3388879-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (24, 62, N' Товары салона красоты\6964197-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (25, 40, N' Товары салона красоты\5625224-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (26, 58, N' Товары салона красоты\6964196-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (27, 47, N' Товары салона красоты\7847906-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (28, 75, N' Товары салона красоты\9939709-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (29, 6, N' Товары салона красоты\6556454-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (30, 96, N' Товары салона красоты\7064333-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (31, 7, N' Товары салона красоты\6556455-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (32, 83, N' Товары салона красоты\6556463-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (33, 29, N' Товары салона красоты\6556462-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (34, 35, N' Товары салона красоты\6691688-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (35, 31, N' Товары салона красоты\6556451-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (36, 44, N' Товары салона красоты\3432453-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (37, 32, N' Товары салона красоты\6556453-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (38, 55, N' Товары салона красоты\7299377-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (39, 2, N' Товары салона красоты\3432442-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (40, 64, N' Товары салона красоты\1781679-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (41, 45, N' Товары салона красоты\6556457-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (42, 46, N' Товары салона красоты\6556458-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (43, 38, N' Товары салона красоты\6691687-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (44, 91, N' Товары салона красоты\7064330-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (45, 41, N' Товары салона красоты\6953177-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (46, 19, N' Товары салона красоты\3472602-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (47, 79, N' Товары салона красоты\9631443-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (48, 20, N' Товары салона красоты\3472608-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (49, 94, N' Товары салона красоты\7064323-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (50, 21, N' Товары салона красоты\3472604-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (51, 22, N' Товары салона красоты\3472591-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (52, 92, N' Товары салона красоты\7064335-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (53, 49, N' Товары салона красоты\3472601-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (54, 3, N' Товары салона красоты\6433981-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (55, 65, N' Товары салона красоты\6556469-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (56, 5, N' Товары салона красоты\6433984-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (57, 25, N' Товары салона красоты\6433979-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (58, 42, N' Товары салона красоты\7889950-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (59, 43, N' Товары салона красоты\6433982-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (60, 61, N' Товары салона красоты\6964199-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (61, 27, N' Товары салона красоты\5427580-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (62, 30, N' Товары салона красоты\9631446-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (63, 51, N' Товары салона красоты\9631437-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (64, 88, N' Товары салона красоты\6953160-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (65, 23, N' Товары салона красоты\9939700-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (66, 63, N' Товары салона красоты\1781711-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (67, 28, N' Товары салона красоты\9939704-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (68, 73, N' Товары салона красоты\2008488-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (69, 34, N' Товары салона красоты\6953169-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (70, 71, N' Товары салона красоты\9631448-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (71, 95, N' Товары салона красоты\7064322-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (72, 36, N' Товары салона красоты\7528031-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (73, 98, N' Товары салона красоты\7064326-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (74, 37, N' Товары салона красоты\6953159-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (75, 70, N' Товары салона красоты\9631445-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (76, 78, N' Товары салона красоты\9631442-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (77, 53, N' Товары салона красоты\9631439-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (78, 50, N' Товары салона красоты\7528032-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (79, 52, N' Товары салона красоты\9631438-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (80, 100, N' Товары салона красоты\7064320-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (81, 68, N' Товары салона красоты\9939719-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (82, 54, N' Товары салона красоты\6556464-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (83, 56, N' Товары салона красоты\7299378-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (84, 57, N' Товары салона красоты\7299376-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (85, 59, N' Товары салона красоты\6964195-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (86, 81, N' Товары салона красоты\6556459-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (87, 72, N' Товары салона красоты\6556461-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (88, 67, N' Товары салона красоты\9939714-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (89, 99, N' Товары салона красоты\7064334-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (90, 74, N' Товары салона красоты\6556465-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (91, 87, N' Товары салона красоты\6953176-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (92, 77, N' Товары салона красоты\6953158-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (93, 86, N' Товары салона красоты\2351755-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (94, 80, N' Товары салона красоты\6556460-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (95, 82, N' Товары салона красоты\9939710-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (96, 89, N' Товары салона красоты\2697586-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (97, 84, N' Товары салона красоты\2697576-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (98, 90, N' Товары салона красоты\7064315-1.jpg')
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (99, 97, N' Товары салона красоты\7064324-1.jpg')
GO
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (100, 93, N' Товары салона красоты\7064314-1.jpg')
SET IDENTITY_INSERT [dbo].[ProductPhoto] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductSale] ON 

INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (1, CAST(N'2019-01-01T15:08:49.000' AS DateTime), 57, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (2, CAST(N'2019-01-07T11:22:57.000' AS DateTime), 34, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (3, CAST(N'2019-01-09T10:46:52.000' AS DateTime), 97, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (4, CAST(N'2019-01-11T12:11:42.000' AS DateTime), 17, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (5, CAST(N'2019-01-12T15:11:05.000' AS DateTime), 26, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (6, CAST(N'2019-01-28T17:01:30.000' AS DateTime), 11, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (7, CAST(N'2019-01-29T19:09:18.000' AS DateTime), 82, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (8, CAST(N'2019-02-03T08:37:25.000' AS DateTime), 19, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (9, CAST(N'2019-02-05T10:48:29.000' AS DateTime), 70, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (10, CAST(N'2019-02-08T16:40:39.000' AS DateTime), 87, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (11, CAST(N'2019-02-12T17:09:02.000' AS DateTime), 86, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (12, CAST(N'2019-02-13T16:49:50.000' AS DateTime), 70, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (13, CAST(N'2019-02-17T11:39:54.000' AS DateTime), 6, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (14, CAST(N'2019-02-18T14:44:42.000' AS DateTime), 34, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (15, CAST(N'2019-02-25T16:25:11.000' AS DateTime), 12, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (16, CAST(N'2019-02-25T18:04:08.000' AS DateTime), 75, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (17, CAST(N'2019-03-01T12:00:30.000' AS DateTime), 5, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (18, CAST(N'2019-03-03T08:32:34.000' AS DateTime), 84, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (19, CAST(N'2019-03-03T18:35:05.000' AS DateTime), 67, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (20, CAST(N'2019-03-08T10:24:21.000' AS DateTime), 91, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (21, CAST(N'2019-03-11T17:02:02.000' AS DateTime), 90, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (22, CAST(N'2019-03-20T18:47:06.000' AS DateTime), 91, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (23, CAST(N'2019-03-25T09:35:21.000' AS DateTime), 10, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (24, CAST(N'2019-03-27T12:18:33.000' AS DateTime), 9, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (25, CAST(N'2019-03-31T14:53:31.000' AS DateTime), 25, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (26, CAST(N'2019-04-01T08:42:31.000' AS DateTime), 22, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (27, CAST(N'2019-04-08T08:45:46.000' AS DateTime), 52, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (28, CAST(N'2019-04-09T12:02:17.000' AS DateTime), 6, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (29, CAST(N'2019-04-10T13:43:06.000' AS DateTime), 44, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (30, CAST(N'2019-04-28T08:46:31.000' AS DateTime), 23, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (31, CAST(N'2019-05-15T15:17:17.000' AS DateTime), 66, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (32, CAST(N'2019-05-16T10:42:57.000' AS DateTime), 8, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (33, CAST(N'2019-05-16T16:19:03.000' AS DateTime), 78, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (34, CAST(N'2019-05-25T08:08:27.000' AS DateTime), 63, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (35, CAST(N'2019-05-25T15:29:20.000' AS DateTime), 28, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (36, CAST(N'2019-05-28T09:56:47.000' AS DateTime), 1, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (37, CAST(N'2019-06-07T10:05:11.000' AS DateTime), 34, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (38, CAST(N'2019-06-10T11:07:03.000' AS DateTime), 74, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (39, CAST(N'2019-06-10T15:57:53.000' AS DateTime), 62, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (40, CAST(N'2019-06-10T19:54:41.000' AS DateTime), 100, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (41, CAST(N'2019-06-19T15:28:05.000' AS DateTime), 60, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (42, CAST(N'2019-06-22T12:07:06.000' AS DateTime), 85, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (43, CAST(N'2019-06-23T14:33:36.000' AS DateTime), 28, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (44, CAST(N'2019-07-03T16:52:30.000' AS DateTime), 34, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (45, CAST(N'2019-07-05T16:03:31.000' AS DateTime), 29, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (46, CAST(N'2019-07-08T15:21:09.000' AS DateTime), 55, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (47, CAST(N'2019-07-10T17:54:19.000' AS DateTime), 83, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (48, CAST(N'2019-07-11T16:30:13.000' AS DateTime), 54, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (49, CAST(N'2019-07-14T10:29:21.000' AS DateTime), 28, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (50, CAST(N'2019-07-16T09:44:46.000' AS DateTime), 82, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (51, CAST(N'2019-07-16T11:31:38.000' AS DateTime), 58, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (52, CAST(N'2019-07-16T13:09:03.000' AS DateTime), 32, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (53, CAST(N'2019-07-18T14:32:52.000' AS DateTime), 41, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (54, CAST(N'2019-07-25T16:30:45.000' AS DateTime), 29, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (55, CAST(N'2019-07-25T18:52:26.000' AS DateTime), 28, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (56, CAST(N'2019-07-29T13:37:35.000' AS DateTime), 39, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (57, CAST(N'2019-07-29T13:38:09.000' AS DateTime), 95, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (58, CAST(N'2019-08-06T13:21:49.000' AS DateTime), 52, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (59, CAST(N'2019-08-06T14:38:35.000' AS DateTime), 83, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (60, CAST(N'2019-08-08T18:37:15.000' AS DateTime), 9, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (61, CAST(N'2019-08-12T09:17:22.000' AS DateTime), 71, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (62, CAST(N'2019-08-12T09:33:21.000' AS DateTime), 97, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (63, CAST(N'2019-08-18T17:09:56.000' AS DateTime), 44, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (64, CAST(N'2019-08-21T10:39:22.000' AS DateTime), 26, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (65, CAST(N'2019-08-21T17:01:40.000' AS DateTime), 87, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (66, CAST(N'2019-08-25T18:00:11.000' AS DateTime), 47, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (67, CAST(N'2019-09-06T12:57:51.000' AS DateTime), 47, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (68, CAST(N'2019-09-08T11:52:21.000' AS DateTime), 78, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (69, CAST(N'2019-09-22T16:57:19.000' AS DateTime), 78, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (70, CAST(N'2019-09-29T08:59:34.000' AS DateTime), 73, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (71, CAST(N'2019-10-02T17:30:21.000' AS DateTime), 80, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (72, CAST(N'2019-10-03T11:04:12.000' AS DateTime), 93, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (73, CAST(N'2019-10-03T19:54:58.000' AS DateTime), 93, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (74, CAST(N'2019-10-10T11:39:43.000' AS DateTime), 20, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (75, CAST(N'2019-10-11T13:27:50.000' AS DateTime), 42, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (76, CAST(N'2019-10-18T18:40:13.000' AS DateTime), 54, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (77, CAST(N'2019-10-22T12:34:59.000' AS DateTime), 13, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (78, CAST(N'2019-10-23T18:53:31.000' AS DateTime), 87, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (79, CAST(N'2019-11-01T15:39:50.000' AS DateTime), 77, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (80, CAST(N'2019-11-02T16:32:41.000' AS DateTime), 10, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (81, CAST(N'2019-11-03T13:25:34.000' AS DateTime), 41, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (82, CAST(N'2019-11-06T10:21:22.000' AS DateTime), 93, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (83, CAST(N'2019-11-12T18:41:34.000' AS DateTime), 64, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (84, CAST(N'2019-11-17T17:57:46.000' AS DateTime), 72, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (85, CAST(N'2019-11-18T08:33:45.000' AS DateTime), 13, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (86, CAST(N'2019-11-18T17:32:43.000' AS DateTime), 23, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (87, CAST(N'2019-11-23T12:58:02.000' AS DateTime), 66, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (88, CAST(N'2019-11-23T16:12:05.000' AS DateTime), 65, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (89, CAST(N'2019-11-24T13:21:32.000' AS DateTime), 88, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (90, CAST(N'2019-11-27T17:14:17.000' AS DateTime), 50, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (91, CAST(N'2019-11-29T15:53:06.000' AS DateTime), 5, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (92, CAST(N'2019-12-04T13:10:28.000' AS DateTime), 89, 2, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (93, CAST(N'2019-12-08T16:58:50.000' AS DateTime), 62, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (94, CAST(N'2019-12-09T11:56:02.000' AS DateTime), 96, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (95, CAST(N'2019-12-15T19:02:56.000' AS DateTime), 2, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (96, CAST(N'2019-12-23T09:03:04.000' AS DateTime), 32, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (97, CAST(N'2019-12-26T08:06:58.000' AS DateTime), 31, 1, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (98, CAST(N'2019-12-26T19:39:58.000' AS DateTime), 7, 3, NULL)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (99, CAST(N'2019-12-27T16:58:35.000' AS DateTime), 88, 2, NULL)
GO
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (100, CAST(N'2019-12-31T16:42:58.000' AS DateTime), 94, 2, NULL)
SET IDENTITY_INSERT [dbo].[ProductSale] OFF
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product] FOREIGN KEY([MainProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product]
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product1] FOREIGN KEY([AttachedProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product1]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Gender] FOREIGN KEY([GenderCode])
REFERENCES [dbo].[Gender] ([Code])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_Gender]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_Client]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_Service]
GO
ALTER TABLE [dbo].[DocumentByService]  WITH CHECK ADD  CONSTRAINT [FK_DocumentByService_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[DocumentByService] CHECK CONSTRAINT [FK_DocumentByService_ClientService]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacturer] FOREIGN KEY([ManufacturerID])
REFERENCES [dbo].[Manufacturer] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Manufacturer]
GO
ALTER TABLE [dbo].[ProductPhoto]  WITH CHECK ADD  CONSTRAINT [FK_ProductPhoto_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductPhoto] CHECK CONSTRAINT [FK_ProductPhoto_Product]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_ClientService]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Product]
GO
ALTER TABLE [dbo].[ServicePhoto]  WITH CHECK ADD  CONSTRAINT [FK_ServicePhoto_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[ServicePhoto] CHECK CONSTRAINT [FK_ServicePhoto_Service]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Client]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Tag] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tag] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Tag]
GO
USE [master]
GO
ALTER DATABASE [KosmeticDB] SET  READ_WRITE 
GO
