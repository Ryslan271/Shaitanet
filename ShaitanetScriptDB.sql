USE [master]
GO
/****** Object:  Database [Chaitanet]    Script Date: 13.04.2024 9:53:22 ******/
CREATE DATABASE [Chaitanet]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Chaitanet', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Chaitanet.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Chaitanet_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Chaitanet_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Chaitanet] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Chaitanet].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Chaitanet] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Chaitanet] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Chaitanet] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Chaitanet] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Chaitanet] SET ARITHABORT OFF 
GO
ALTER DATABASE [Chaitanet] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Chaitanet] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Chaitanet] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Chaitanet] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Chaitanet] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Chaitanet] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Chaitanet] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Chaitanet] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Chaitanet] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Chaitanet] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Chaitanet] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Chaitanet] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Chaitanet] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Chaitanet] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Chaitanet] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Chaitanet] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Chaitanet] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Chaitanet] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Chaitanet] SET  MULTI_USER 
GO
ALTER DATABASE [Chaitanet] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Chaitanet] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Chaitanet] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Chaitanet] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Chaitanet] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Chaitanet] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Chaitanet] SET QUERY_STORE = OFF
GO
USE [Chaitanet]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 13.04.2024 9:53:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 13.04.2024 9:53:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Balance] [decimal](18, 2) NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 13.04.2024 9:53:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PositionId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 13.04.2024 9:53:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[Date] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 13.04.2024 9:53:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
	[Count] [int] NOT NULL,
 CONSTRAINT [PK_OrderProduct] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderTransaction]    Script Date: 13.04.2024 9:53:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderTransaction](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
 CONSTRAINT [PK_OrderTransaction] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Position]    Script Date: 13.04.2024 9:53:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Position](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Position] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 13.04.2024 9:53:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[Description] [ntext] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Modifydata] [datetime] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 13.04.2024 9:53:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 13.04.2024 9:53:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](250) NOT NULL,
	[Login] [nvarchar](250) NOT NULL,
	[Password] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [Title]) VALUES (1, N'Сухой корм для собак')
INSERT [dbo].[Category] ([Id], [Title]) VALUES (2, N'Консервы для собак')
INSERT [dbo].[Category] ([Id], [Title]) VALUES (3, N'Натуральный корм для собак')
INSERT [dbo].[Category] ([Id], [Title]) VALUES (4, N'Влажный корм для собак')
INSERT [dbo].[Category] ([Id], [Title]) VALUES (5, N'Зерновой корм для собак')
INSERT [dbo].[Category] ([Id], [Title]) VALUES (6, N'Полужидкий корм для собак')
INSERT [dbo].[Category] ([Id], [Title]) VALUES (7, N'Диетический корм для собак')
INSERT [dbo].[Category] ([Id], [Title]) VALUES (8, N'Мокрый корм для собак')
INSERT [dbo].[Category] ([Id], [Title]) VALUES (9, N'Домашний корм для собак')
INSERT [dbo].[Category] ([Id], [Title]) VALUES (10, N'Супер-премиум корм для собак')
INSERT [dbo].[Category] ([Id], [Title]) VALUES (11, N'Корм для щенков')
INSERT [dbo].[Category] ([Id], [Title]) VALUES (12, N'Корм для взрослых собак')
INSERT [dbo].[Category] ([Id], [Title]) VALUES (13, N'Корм для стареющих собак')
INSERT [dbo].[Category] ([Id], [Title]) VALUES (14, N'Паучи для собак')
INSERT [dbo].[Category] ([Id], [Title]) VALUES (15, N'Корм для породистых собак')
INSERT [dbo].[Category] ([Id], [Title]) VALUES (16, N'Зерновой беззерновой корм для собак')
INSERT [dbo].[Category] ([Id], [Title]) VALUES (17, N'Протеиновый корм для собак')
INSERT [dbo].[Category] ([Id], [Title]) VALUES (18, N'Корм для чувствительных желудков собак')
INSERT [dbo].[Category] ([Id], [Title]) VALUES (19, N'Корм для спортивных собак')
INSERT [dbo].[Category] ([Id], [Title]) VALUES (20, N'Корм для рыбацких собак')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([Id], [Balance], [UserId]) VALUES (11, CAST(100.00 AS Decimal(18, 2)), 11)
INSERT [dbo].[Customer] ([Id], [Balance], [UserId]) VALUES (12, CAST(150.00 AS Decimal(18, 2)), 12)
INSERT [dbo].[Customer] ([Id], [Balance], [UserId]) VALUES (13, CAST(100.00 AS Decimal(18, 2)), 13)
INSERT [dbo].[Customer] ([Id], [Balance], [UserId]) VALUES (14, CAST(100.00 AS Decimal(18, 2)), 14)
INSERT [dbo].[Customer] ([Id], [Balance], [UserId]) VALUES (15, CAST(150.00 AS Decimal(18, 2)), 15)
INSERT [dbo].[Customer] ([Id], [Balance], [UserId]) VALUES (16, CAST(100.00 AS Decimal(18, 2)), 16)
INSERT [dbo].[Customer] ([Id], [Balance], [UserId]) VALUES (17, CAST(100.00 AS Decimal(18, 2)), 17)
INSERT [dbo].[Customer] ([Id], [Balance], [UserId]) VALUES (18, CAST(150.00 AS Decimal(18, 2)), 18)
INSERT [dbo].[Customer] ([Id], [Balance], [UserId]) VALUES (19, CAST(100.00 AS Decimal(18, 2)), 19)
INSERT [dbo].[Customer] ([Id], [Balance], [UserId]) VALUES (20, CAST(100.00 AS Decimal(18, 2)), 20)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Id], [PositionId], [UserId]) VALUES (1, 1, 1)
INSERT [dbo].[Employee] ([Id], [PositionId], [UserId]) VALUES (2, 2, 2)
INSERT [dbo].[Employee] ([Id], [PositionId], [UserId]) VALUES (3, 3, 3)
INSERT [dbo].[Employee] ([Id], [PositionId], [UserId]) VALUES (4, 4, 4)
INSERT [dbo].[Employee] ([Id], [PositionId], [UserId]) VALUES (5, 1, 5)
INSERT [dbo].[Employee] ([Id], [PositionId], [UserId]) VALUES (6, 2, 6)
INSERT [dbo].[Employee] ([Id], [PositionId], [UserId]) VALUES (7, 3, 7)
INSERT [dbo].[Employee] ([Id], [PositionId], [UserId]) VALUES (8, 4, 8)
INSERT [dbo].[Employee] ([Id], [PositionId], [UserId]) VALUES (9, 1, 9)
INSERT [dbo].[Employee] ([Id], [PositionId], [UserId]) VALUES (10, 2, 10)
SET IDENTITY_INSERT [dbo].[Employee] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([Id], [CustomerId], [Date]) VALUES (31, 11, CAST(N'2024-04-13T00:00:00' AS SmallDateTime))
INSERT [dbo].[Order] ([Id], [CustomerId], [Date]) VALUES (32, 12, CAST(N'2024-04-13T00:00:00' AS SmallDateTime))
INSERT [dbo].[Order] ([Id], [CustomerId], [Date]) VALUES (33, 13, CAST(N'2024-04-13T00:00:00' AS SmallDateTime))
INSERT [dbo].[Order] ([Id], [CustomerId], [Date]) VALUES (34, 14, CAST(N'2024-04-13T00:00:00' AS SmallDateTime))
INSERT [dbo].[Order] ([Id], [CustomerId], [Date]) VALUES (35, 15, CAST(N'2024-04-13T00:00:00' AS SmallDateTime))
INSERT [dbo].[Order] ([Id], [CustomerId], [Date]) VALUES (36, 16, CAST(N'2024-04-13T00:00:00' AS SmallDateTime))
INSERT [dbo].[Order] ([Id], [CustomerId], [Date]) VALUES (37, 17, CAST(N'2024-04-13T00:00:00' AS SmallDateTime))
INSERT [dbo].[Order] ([Id], [CustomerId], [Date]) VALUES (38, 18, CAST(N'2024-04-13T00:00:00' AS SmallDateTime))
INSERT [dbo].[Order] ([Id], [CustomerId], [Date]) VALUES (39, 19, CAST(N'2024-04-13T00:00:00' AS SmallDateTime))
INSERT [dbo].[Order] ([Id], [CustomerId], [Date]) VALUES (40, 20, CAST(N'2024-04-13T00:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[Position] ON 

INSERT [dbo].[Position] ([Id], [Title]) VALUES (1, N'Модератор')
INSERT [dbo].[Position] ([Id], [Title]) VALUES (2, N'Администратор')
INSERT [dbo].[Position] ([Id], [Title]) VALUES (3, N'Работник пункта выдачи')
INSERT [dbo].[Position] ([Id], [Title]) VALUES (4, N'Работник магазина')
SET IDENTITY_INSERT [dbo].[Position] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([Id], [Title], [Description], [CategoryId], [Modifydata]) VALUES (1, N'Сухой корм для собак', N'Сбалансированный рацион', 1, CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [CategoryId], [Modifydata]) VALUES (2, N'Консервы для собак', N'Пищевой продукт', 1, CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [CategoryId], [Modifydata]) VALUES (3, N'Кости для собак', N'Поощрение и занятие', 1, CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [CategoryId], [Modifydata]) VALUES (4, N'Лакомства для собак', N'Поощрение и лакомство', 1, CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [CategoryId], [Modifydata]) VALUES (5, N'Игрушки для собак', N'Развлечение', 1, CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [CategoryId], [Modifydata]) VALUES (6, N'Миски для собак', N'Посуда для кормления', 1, CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [CategoryId], [Modifydata]) VALUES (7, N'Ошейники для собак', N'Принадлежность для прогулок', 1, CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [CategoryId], [Modifydata]) VALUES (8, N'Поводки для собак', N'Принадлежность для прогулок', 1, CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [CategoryId], [Modifydata]) VALUES (9, N'Коврики для собак', N'Место для сна и отдыха', 1, CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [CategoryId], [Modifydata]) VALUES (10, N'Шампуни для собак', N'Средства гигиены', 1, CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [CategoryId], [Modifydata]) VALUES (11, N'Корм для кошек', N'Сухой и влажный корм', 2, CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [CategoryId], [Modifydata]) VALUES (12, N'Игрушки для кошек', N'Развлечение', 2, CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [CategoryId], [Modifydata]) VALUES (13, N'Когтеточки для кошек', N'Место для затачивания когтей', 2, CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [CategoryId], [Modifydata]) VALUES (14, N'Миски для кошек', N'Посуда для кормления', 2, CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [CategoryId], [Modifydata]) VALUES (15, N'Корм для птиц', N'Семена и пища', 3, CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [CategoryId], [Modifydata]) VALUES (16, N'Клетки для птиц', N'Проживание', 3, CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [CategoryId], [Modifydata]) VALUES (17, N'Игрушки для птиц', N'Развлечение', 3, CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [CategoryId], [Modifydata]) VALUES (18, N'Корм для грызунов', N'Зерно и пища', 4, CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [CategoryId], [Modifydata]) VALUES (19, N'Игрушки для грызунов', N'Развлечение', 4, CAST(N'2024-04-13T00:00:00.000' AS DateTime))
INSERT [dbo].[Product] ([Id], [Title], [Description], [CategoryId], [Modifydata]) VALUES (20, N'Вольеры для грызунов', N'Проживание', 4, CAST(N'2024-04-13T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([Id], [Title]) VALUES (1, N'Title')
INSERT [dbo].[Status] ([Id], [Title]) VALUES (2, N'Принят')
INSERT [dbo].[Status] ([Id], [Title]) VALUES (3, N'Собирается')
INSERT [dbo].[Status] ([Id], [Title]) VALUES (4, N'Доставка')
INSERT [dbo].[Status] ([Id], [Title]) VALUES (5, N'Готов к выдаче')
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Username], [Login], [Password]) VALUES (1, N'user1', N'user1login', N'user1pass')
INSERT [dbo].[User] ([Id], [Username], [Login], [Password]) VALUES (2, N'user2', N'user2login', N'user2pass')
INSERT [dbo].[User] ([Id], [Username], [Login], [Password]) VALUES (3, N'user3', N'user3login', N'user3pass')
INSERT [dbo].[User] ([Id], [Username], [Login], [Password]) VALUES (4, N'user4', N'user4login', N'user4pass')
INSERT [dbo].[User] ([Id], [Username], [Login], [Password]) VALUES (5, N'user5', N'user5login', N'user5pass')
INSERT [dbo].[User] ([Id], [Username], [Login], [Password]) VALUES (6, N'user6', N'user6login', N'user6pass')
INSERT [dbo].[User] ([Id], [Username], [Login], [Password]) VALUES (7, N'user7', N'user7login', N'user7pass')
INSERT [dbo].[User] ([Id], [Username], [Login], [Password]) VALUES (8, N'user8', N'user8login', N'user8pass')
INSERT [dbo].[User] ([Id], [Username], [Login], [Password]) VALUES (9, N'user9', N'user9login', N'user9pass')
INSERT [dbo].[User] ([Id], [Username], [Login], [Password]) VALUES (10, N'user10', N'user10login', N'user10pass')
INSERT [dbo].[User] ([Id], [Username], [Login], [Password]) VALUES (11, N'user11', N'user11login', N'user11pass')
INSERT [dbo].[User] ([Id], [Username], [Login], [Password]) VALUES (12, N'user12', N'user12login', N'user12pass')
INSERT [dbo].[User] ([Id], [Username], [Login], [Password]) VALUES (13, N'user13', N'user13login', N'user13pass')
INSERT [dbo].[User] ([Id], [Username], [Login], [Password]) VALUES (14, N'user14', N'user14login', N'user14pass')
INSERT [dbo].[User] ([Id], [Username], [Login], [Password]) VALUES (15, N'user15', N'user15login', N'user15pass')
INSERT [dbo].[User] ([Id], [Username], [Login], [Password]) VALUES (16, N'user16', N'user16login', N'user16pass')
INSERT [dbo].[User] ([Id], [Username], [Login], [Password]) VALUES (17, N'user17', N'user17login', N'user17pass')
INSERT [dbo].[User] ([Id], [Username], [Login], [Password]) VALUES (18, N'user18', N'user18login', N'user18pass')
INSERT [dbo].[User] ([Id], [Username], [Login], [Password]) VALUES (19, N'user19', N'user19login', N'user19pass')
INSERT [dbo].[User] ([Id], [Username], [Login], [Password]) VALUES (20, N'user20', N'user20login', N'user20pass')
INSERT [dbo].[User] ([Id], [Username], [Login], [Password]) VALUES (21, N'user21
', N'user21login
', N'user21pass
')
INSERT [dbo].[User] ([Id], [Username], [Login], [Password]) VALUES (22, N'user22
', N'user22login
', N'user22pass
')
INSERT [dbo].[User] ([Id], [Username], [Login], [Password]) VALUES (24, N'user23
', N'user23login
', N'user23pass
')
INSERT [dbo].[User] ([Id], [Username], [Login], [Password]) VALUES (26, N'user24', N'user24login
', N'user24login
')
INSERT [dbo].[User] ([Id], [Username], [Login], [Password]) VALUES (27, N'user25
', N'user25login
', N'user25pass
')
INSERT [dbo].[User] ([Id], [Username], [Login], [Password]) VALUES (29, N'user26
', N'user26login
', N'user26pass
')
INSERT [dbo].[User] ([Id], [Username], [Login], [Password]) VALUES (30, N'user27
', N'user27login
', N'user27pass
')
INSERT [dbo].[User] ([Id], [Username], [Login], [Password]) VALUES (31, N'user28
', N'user28login
', N'user28pass
')
INSERT [dbo].[User] ([Id], [Username], [Login], [Password]) VALUES (32, N'user29
', N'user29login
', N'user29pass
')
INSERT [dbo].[User] ([Id], [Username], [Login], [Password]) VALUES (33, N'user30
', N'user30login
', N'user30pass
')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_User1] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_User1]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Position1] FOREIGN KEY([PositionId])
REFERENCES [dbo].[Position] ([Id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Position1]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_User1] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_User1]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer1] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer1]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_Order1] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Order1]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_Product1] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Product1]
GO
ALTER TABLE [dbo].[OrderTransaction]  WITH CHECK ADD  CONSTRAINT [FK_OrderTransaction_Employee1] FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[Employee] ([Id])
GO
ALTER TABLE [dbo].[OrderTransaction] CHECK CONSTRAINT [FK_OrderTransaction_Employee1]
GO
ALTER TABLE [dbo].[OrderTransaction]  WITH CHECK ADD  CONSTRAINT [FK_OrderTransaction_Order1] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderTransaction] CHECK CONSTRAINT [FK_OrderTransaction_Order1]
GO
ALTER TABLE [dbo].[OrderTransaction]  WITH CHECK ADD  CONSTRAINT [FK_OrderTransaction_Status1] FOREIGN KEY([StatusId])
REFERENCES [dbo].[Status] ([Id])
GO
ALTER TABLE [dbo].[OrderTransaction] CHECK CONSTRAINT [FK_OrderTransaction_Status1]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category1] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category1]
GO
USE [master]
GO
ALTER DATABASE [Chaitanet] SET  READ_WRITE 
GO
