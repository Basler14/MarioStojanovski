USE [master]
GO
/****** Object:  Database [Bank]    Script Date: 3/9/2018 12:38:04 AM ******/
CREATE DATABASE [Bank]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Bank', FILENAME = N'E:\MidTermPreparationBazi\Bank.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Bank_log', FILENAME = N'E:\MidTermPreparationBazi\Bank_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Bank] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Bank].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Bank] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Bank] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Bank] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Bank] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Bank] SET ARITHABORT OFF 
GO
ALTER DATABASE [Bank] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Bank] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Bank] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Bank] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Bank] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Bank] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Bank] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Bank] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Bank] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Bank] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Bank] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Bank] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Bank] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Bank] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Bank] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Bank] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Bank] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Bank] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Bank] SET  MULTI_USER 
GO
ALTER DATABASE [Bank] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Bank] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Bank] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Bank] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Bank] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Bank', N'ON'
GO
ALTER DATABASE [Bank] SET QUERY_STORE = OFF
GO
USE [Bank]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Bank]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/9/2018 12:38:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[AccountTypeId] [bigint] NOT NULL,
	[Balance] [decimal](18, 2) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[ClientId] [bigint] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AccountType]    Script Date: 3/9/2018 12:38:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountType](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](50) NOT NULL,
 CONSTRAINT [PK_AccountType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Address]    Script Date: 3/9/2018 12:38:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Street] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Client]    Script Date: 3/9/2018 12:38:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[PhoneNumber] [varchar](20) NOT NULL,
	[AddressId] [bigint] NOT NULL,
	[ClientTypeId] [bigint] NOT NULL,
	[Email] [varchar](50) NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClientType]    Script Date: 3/9/2018 12:38:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientType](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](20) NULL,
 CONSTRAINT [PK_ClientType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([Id], [Name], [AccountTypeId], [Balance], [IsActive], [ClientId]) VALUES (1, N'Cash Management', 2, CAST(433833.23 AS Decimal(18, 2)), 1, 5)
INSERT [dbo].[Account] ([Id], [Name], [AccountTypeId], [Balance], [IsActive], [ClientId]) VALUES (3, N'Salary Account', 1, CAST(200500.50 AS Decimal(18, 2)), 1, 5)
INSERT [dbo].[Account] ([Id], [Name], [AccountTypeId], [Balance], [IsActive], [ClientId]) VALUES (4, N'Cash Management', 2, CAST(500000.70 AS Decimal(18, 2)), 1, 4)
INSERT [dbo].[Account] ([Id], [Name], [AccountTypeId], [Balance], [IsActive], [ClientId]) VALUES (5, N'Salary Account', 1, CAST(240000.00 AS Decimal(18, 2)), 1, 4)
INSERT [dbo].[Account] ([Id], [Name], [AccountTypeId], [Balance], [IsActive], [ClientId]) VALUES (6, N'Housing Load', 4, CAST(-55000.40 AS Decimal(18, 2)), 1, 3)
INSERT [dbo].[Account] ([Id], [Name], [AccountTypeId], [Balance], [IsActive], [ClientId]) VALUES (7, N'MasterCard', 3, CAST(5688.40 AS Decimal(18, 2)), 1, 3)
INSERT [dbo].[Account] ([Id], [Name], [AccountTypeId], [Balance], [IsActive], [ClientId]) VALUES (8, N'MasterCard', 3, CAST(1.00 AS Decimal(18, 2)), 0, 3)
INSERT [dbo].[Account] ([Id], [Name], [AccountTypeId], [Balance], [IsActive], [ClientId]) VALUES (9, N'Personal Account', 1, CAST(7900.00 AS Decimal(18, 2)), 1, 2)
SET IDENTITY_INSERT [dbo].[Account] OFF
SET IDENTITY_INSERT [dbo].[AccountType] ON 

INSERT [dbo].[AccountType] ([Id], [Type]) VALUES (1, N'Current Account')
INSERT [dbo].[AccountType] ([Id], [Type]) VALUES (2, N'Savings Account')
INSERT [dbo].[AccountType] ([Id], [Type]) VALUES (3, N'Credit Card')
INSERT [dbo].[AccountType] ([Id], [Type]) VALUES (4, N'Loan')
SET IDENTITY_INSERT [dbo].[AccountType] OFF
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([Id], [Street], [City], [Country]) VALUES (1, N'
Frying Pan Road', N'London', N'UK')
INSERT [dbo].[Address] ([Id], [Street], [City], [Country]) VALUES (2, N'Error Place', N'Cincinnati', N'USA')
INSERT [dbo].[Address] ([Id], [Street], [City], [Country]) VALUES (3, N'Bad Route Road', N'Rome', N'Italy')
INSERT [dbo].[Address] ([Id], [Street], [City], [Country]) VALUES (4, N'Pillow Talk Court', N'Las Vegas', N'USA')
SET IDENTITY_INSERT [dbo].[Address] OFF
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([Id], [Name], [PhoneNumber], [AddressId], [ClientTypeId], [Email]) VALUES (2, N'Nicoline Abspoel', N'077-999-999', 4, 1, N'NicolineAbspoel@gmail.com')
INSERT [dbo].[Client] ([Id], [Name], [PhoneNumber], [AddressId], [ClientTypeId], [Email]) VALUES (3, N'Andrew Kennard', N'+38976999999', 2, 1, N'akennard@firm.com')
INSERT [dbo].[Client] ([Id], [Name], [PhoneNumber], [AddressId], [ClientTypeId], [Email]) VALUES (4, N'Google', N'1111111111111', 3, 2, N'info@google.com')
INSERT [dbo].[Client] ([Id], [Name], [PhoneNumber], [AddressId], [ClientTypeId], [Email]) VALUES (5, N'Microsoft', N'32-3231-354', 1, 2, N'info@microsoft.com')
SET IDENTITY_INSERT [dbo].[Client] OFF
SET IDENTITY_INSERT [dbo].[ClientType] ON 

INSERT [dbo].[ClientType] ([Id], [Type]) VALUES (1, N'Residential')
INSERT [dbo].[ClientType] ([Id], [Type]) VALUES (2, N'Business')
SET IDENTITY_INSERT [dbo].[ClientType] OFF
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_AccountType] FOREIGN KEY([AccountTypeId])
REFERENCES [dbo].[AccountType] ([Id])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_AccountType]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Client] FOREIGN KEY([ClientId])
REFERENCES [dbo].[Client] ([Id])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Client]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Address] FOREIGN KEY([AddressId])
REFERENCES [dbo].[Address] ([Id])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_Address]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_ClientType] FOREIGN KEY([ClientTypeId])
REFERENCES [dbo].[ClientType] ([Id])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_ClientType]
GO
USE [master]
GO
ALTER DATABASE [Bank] SET  READ_WRITE 
GO
