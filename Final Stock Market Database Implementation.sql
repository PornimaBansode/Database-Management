-- *****Create the Stock_Market database*****
IF  NOT EXISTS (SELECT * FROM sys.databases WHERE NAME = N'Stock_Market')
    BEGIN
        CREATE DATABASE [Stock_Market]
    END;

GO

-- *****Create tables in the Stock_Market database*****

USE [Stock_Market]
GO
/****** Object:  Table [dbo].[Account_Transactions]    Script Date: 7/22/2018 10:47:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account_Transactions](
	[TransactionID] [int] IDENTITY(1,1) NOT NULL,
	[TransactionDate] [datetime] NOT NULL,
	[Amount] [money] NOT NULL,
	[TransType] [varchar](5) NOT NULL,
	[BankAcctID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Bank_Accounts]    Script Date: 7/22/2018 10:47:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bank_Accounts](
	[BankAccountID] [int] IDENTITY(100000000,1) NOT NULL,
	[AccountHolderName] [varchar](max) NOT NULL,
	[AccountNumber] [int] NOT NULL,
	[RoutingNo] [int] NOT NULL,
	[UserID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BankAccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Country]    Script Date: 7/22/2018 10:47:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Country](
	[CountryCode] [int] NOT NULL,
	[CountryName] [varchar](200) NOT NULL,
	[SettlementSchedule] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CountryCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Currency]    Script Date: 7/22/2018 10:47:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Currency](
	[CurrencyCode] [varchar](3) NOT NULL,
	[SpotRate] [numeric](28, 10) NULL,
PRIMARY KEY CLUSTERED 
(
	[CurrencyCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Current_Price]    Script Date: 7/22/2018 10:47:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Current_Price](
	[CurrentPriceID] [int] IDENTITY(1,1) NOT NULL,
	[SecurityID] [int] NOT NULL,
	[Price] [numeric](28, 10) NULL,
	[Volume] [int] NULL,
	[OpeningPrice] [numeric](28, 10) NULL,
	[ClosingPrice] [numeric](28, 10) NULL,
PRIMARY KEY CLUSTERED 
(
	[CurrentPriceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Derivatives]    Script Date: 7/22/2018 10:47:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Derivatives](
	[DerivativeID] [int] IDENTITY(1,1) NOT NULL,
	[SecurityID] [int] NOT NULL,
	[StrikePrice] [money] NOT NULL,
	[ExpirationDate] [datetime] NOT NULL,
	[DaysToSettle] [smallint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DerivativeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Device_Information]    Script Date: 7/22/2018 10:47:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Device_Information](
	[DeviceID] [int] IDENTITY(1,1) NOT NULL,
	[DeviceName] [varchar](250) NULL,
	[DeviceType] [varchar](50) NULL,
	[UserID] [int] NOT NULL,
	[TCAAgreementDetailsID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DeviceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Historical_price]    Script Date: 7/22/2018 10:47:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Historical_price](
	[HistoricalPriceID] [int] IDENTITY(1,1) NOT NULL,
	[SecurityID] [int] NOT NULL,
	[PriceDate] [date] NULL,
	[Volume] [int] NULL,
	[OpeningPrice] [numeric](28, 10) NULL,
	[ClosingPrice] [numeric](28, 10) NULL,
PRIMARY KEY CLUSTERED 
(
	[HistoricalPriceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Holdings]    Script Date: 7/22/2018 10:47:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Holdings](
	[BuyingDate] [date] NULL,
	[DurationHeld]  AS (case when isnull([BuyingDate],'')='' then NULL else datediff(day,[BuyingDate],getdate()) end),
	[BuyingPrice] [numeric](28, 10) NULL,
	[QuantityHeld] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[SecurityID] [int] NOT NULL,
	[DerivativeID] [int] NOT NULL,
 CONSTRAINT [HoldingKey] PRIMARY KEY CLUSTERED 
(
	[SecurityID] ASC,
	[DerivativeID] ASC,
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Security]    Script Date: 7/22/2018 10:47:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Security](
	[SecurityID] [int] IDENTITY(1000,1) NOT NULL,
	[SecurityDescription] [varchar](200) NOT NULL,
	[EarningsDate] [datetime] NOT NULL,
	[EarningsResult] [money] NOT NULL,
	[CountryCode] [int] NOT NULL,
	[CurrencyCode] [varchar](3) NOT NULL,
	[Industry] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SecurityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TCAAgreementDetails]    Script Date: 7/22/2018 10:47:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TCAAgreementDetails](
	[TCAAgreementDetailsID] [int] IDENTITY(1,1) NOT NULL,
	[DateOfAgreement] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TCAAgreementDetailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Trade_History]    Script Date: 7/22/2018 10:47:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trade_History](
	[TradeHistID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[TradeID] [int] NOT NULL,
	[SecurityID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TradeHistID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Trades]    Script Date: 7/22/2018 10:47:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Trades](
	[TradeID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[SecurityID] [int] NOT NULL,
	[Buy_OR_Sell] [varchar](50) NOT NULL,
	[Shares] [int] NOT NULL,
	[LimitPrice] [money] NOT NULL,
	[Amount] [money] NOT NULL,
	[Price] [numeric](28, 10) NOT NULL,
	[Trading_date] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TradeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User_Watchlist]    Script Date: 7/22/2018 10:47:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Watchlist](
	[UserWatchlistID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[SecurityID] [int] NOT NULL,
	[EntryPrice] [money] NOT NULL,
	[ExitPrice] [money] NOT NULL,
	[Price] [money] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 7/22/2018 11:00:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserProfile](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](200) NOT NULL,
	[MiddleName] [varchar](200) NOT NULL,
	[LastName] [varchar](200) NOT NULL,
	[DateOfBirth] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[UserProfile]  WITH CHECK ADD CHECK  (([UserProfile].[DateOfBirth]>'01-01-1901' AND [UserProfile].[DateOfBirth]<getdate()))
GO

-- *****Insert values in the Stock_Market database*****

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Account_Transactions] ON 

GO
INSERT [dbo].[Account_Transactions] ([TransactionID], [TransactionDate], [Amount], [TransType], [BankAcctID]) VALUES (1, CAST(N'2018-02-12 11:20:27.000' AS DateTime), 5000.0000, N'Debit', 100000000)
GO
INSERT [dbo].[Account_Transactions] ([TransactionID], [TransactionDate], [Amount], [TransType], [BankAcctID]) VALUES (2, CAST(N'2018-07-11 12:00:14.000' AS DateTime), 4050.0300, N'Debit', 100000003)
GO
INSERT [dbo].[Account_Transactions] ([TransactionID], [TransactionDate], [Amount], [TransType], [BankAcctID]) VALUES (3, CAST(N'2018-01-10 10:28:21.000' AS DateTime), 2487.1400, N'Crdit', 100000004)
GO
INSERT [dbo].[Account_Transactions] ([TransactionID], [TransactionDate], [Amount], [TransType], [BankAcctID]) VALUES (4, CAST(N'2018-04-11 13:25:40.000' AS DateTime), 10352.2800, N'Crdit', 100000005)
GO
INSERT [dbo].[Account_Transactions] ([TransactionID], [TransactionDate], [Amount], [TransType], [BankAcctID]) VALUES (5, CAST(N'2018-06-20 22:46:12.000' AS DateTime), 37792.8800, N'Crdit', 100000006)
GO
INSERT [dbo].[Account_Transactions] ([TransactionID], [TransactionDate], [Amount], [TransType], [BankAcctID]) VALUES (6, CAST(N'2017-12-28 12:46:22.000' AS DateTime), 57215.8800, N'Debit', 100000011)
GO
SET IDENTITY_INSERT [dbo].[Account_Transactions] OFF
GO
SET IDENTITY_INSERT [dbo].[Bank_Accounts] ON 

GO
INSERT [dbo].[Bank_Accounts] ([BankAccountID], [AccountHolderName], [AccountNumber], [RoutingNo], [UserID]) VALUES (100000000, N'Samuel Beckett', 1002887868, 876526598, 1)
GO
INSERT [dbo].[Bank_Accounts] ([BankAccountID], [AccountHolderName], [AccountNumber], [RoutingNo], [UserID]) VALUES (100000001, N'Bob Cooper', 1265926986, 819084057, 2)
GO
INSERT [dbo].[Bank_Accounts] ([BankAccountID], [AccountHolderName], [AccountNumber], [RoutingNo], [UserID]) VALUES (100000002, N'Mary Carter', 1029587276, 137896568, 3)
GO
INSERT [dbo].[Bank_Accounts] ([BankAccountID], [AccountHolderName], [AccountNumber], [RoutingNo], [UserID]) VALUES (100000003, N'Daniel Finley', 1587587323, 467437676, 4)
GO
INSERT [dbo].[Bank_Accounts] ([BankAccountID], [AccountHolderName], [AccountNumber], [RoutingNo], [UserID]) VALUES (100000004, N'Raj Kapoor', 1907027579, 307807256, 5)
GO
INSERT [dbo].[Bank_Accounts] ([BankAccountID], [AccountHolderName], [AccountNumber], [RoutingNo], [UserID]) VALUES (100000005, N'Matthew Jones', 1214704369, 143298667, 6)
GO
INSERT [dbo].[Bank_Accounts] ([BankAccountID], [AccountHolderName], [AccountNumber], [RoutingNo], [UserID]) VALUES (100000006, N'Carol Mason', 1408907867, 128754745, 7)
GO
INSERT [dbo].[Bank_Accounts] ([BankAccountID], [AccountHolderName], [AccountNumber], [RoutingNo], [UserID]) VALUES (100000007, N'Emily Smith', 1274168636, 187681575, 8)
GO
INSERT [dbo].[Bank_Accounts] ([BankAccountID], [AccountHolderName], [AccountNumber], [RoutingNo], [UserID]) VALUES (100000008, N'Laura Walker', 1153490707, 214654377, 9)
GO
INSERT [dbo].[Bank_Accounts] ([BankAccountID], [AccountHolderName], [AccountNumber], [RoutingNo], [UserID]) VALUES (100000009, N'Helen Ashley', 1079687576, 248979676, 10)
GO
INSERT [dbo].[Bank_Accounts] ([BankAccountID], [AccountHolderName], [AccountNumber], [RoutingNo], [UserID]) VALUES (100000010, N'Nicholas Ellis', 1007685477, 213256585, 11)
GO
INSERT [dbo].[Bank_Accounts] ([BankAccountID], [AccountHolderName], [AccountNumber], [RoutingNo], [UserID]) VALUES (100000011, N'Anna West', 1187654872, 241659871, 12)
GO
SET IDENTITY_INSERT [dbo].[Bank_Accounts] OFF
GO
INSERT [dbo].[Country] ([CountryCode], [CountryName], [SettlementSchedule]) VALUES (101, N'United States', 2)
GO
INSERT [dbo].[Country] ([CountryCode], [CountryName], [SettlementSchedule]) VALUES (102, N'United Kingdom', 2)
GO
INSERT [dbo].[Country] ([CountryCode], [CountryName], [SettlementSchedule]) VALUES (103, N'India', 3)
GO
INSERT [dbo].[Country] ([CountryCode], [CountryName], [SettlementSchedule]) VALUES (104, N'Maldives', 4)
GO
INSERT [dbo].[Country] ([CountryCode], [CountryName], [SettlementSchedule]) VALUES (105, N'Spain', 2)
GO
INSERT [dbo].[Country] ([CountryCode], [CountryName], [SettlementSchedule]) VALUES (106, N'Srilanka', 4)
GO
INSERT [dbo].[Country] ([CountryCode], [CountryName], [SettlementSchedule]) VALUES (107, N'United Arab Emirates', 1)
GO
INSERT [dbo].[Country] ([CountryCode], [CountryName], [SettlementSchedule]) VALUES (108, N'China', 3)
GO
INSERT [dbo].[Country] ([CountryCode], [CountryName], [SettlementSchedule]) VALUES (109, N'Philippines', 5)
GO
INSERT [dbo].[Country] ([CountryCode], [CountryName], [SettlementSchedule]) VALUES (110, N'Thailand', 4)
GO
INSERT [dbo].[Country] ([CountryCode], [CountryName], [SettlementSchedule]) VALUES (111, N'Ukraine', 3)
GO
INSERT [dbo].[Country] ([CountryCode], [CountryName], [SettlementSchedule]) VALUES (112, N'Yemen', 3)
GO
INSERT [dbo].[Country] ([CountryCode], [CountryName], [SettlementSchedule]) VALUES (113, N'Argentina', 1)
GO
INSERT [dbo].[Currency] ([CurrencyCode], [SpotRate]) VALUES (N'ARS', CAST(0.1853000000 AS Numeric(28, 10)))
GO
INSERT [dbo].[Currency] ([CurrencyCode], [SpotRate]) VALUES (N'CNY', CAST(1.1245000000 AS Numeric(28, 10)))
GO
INSERT [dbo].[Currency] ([CurrencyCode], [SpotRate]) VALUES (N'ESP', CAST(0.0388000000 AS Numeric(28, 10)))
GO
INSERT [dbo].[Currency] ([CurrencyCode], [SpotRate]) VALUES (N'GBP', CAST(1.1788000000 AS Numeric(28, 10)))
GO
INSERT [dbo].[Currency] ([CurrencyCode], [SpotRate]) VALUES (N'INR', CAST(0.1788000000 AS Numeric(28, 10)))
GO
INSERT [dbo].[Currency] ([CurrencyCode], [SpotRate]) VALUES (N'LKR', CAST(0.0953000000 AS Numeric(28, 10)))
GO
INSERT [dbo].[Currency] ([CurrencyCode], [SpotRate]) VALUES (N'MVR', CAST(0.0572000000 AS Numeric(28, 10)))
GO
INSERT [dbo].[Currency] ([CurrencyCode], [SpotRate]) VALUES (N'PHP', CAST(0.0742000000 AS Numeric(28, 10)))
GO
INSERT [dbo].[Currency] ([CurrencyCode], [SpotRate]) VALUES (N'THB', CAST(0.1322000000 AS Numeric(28, 10)))
GO
INSERT [dbo].[Currency] ([CurrencyCode], [SpotRate]) VALUES (N'UAE', CAST(1.1342000000 AS Numeric(28, 10)))
GO
INSERT [dbo].[Currency] ([CurrencyCode], [SpotRate]) VALUES (N'UAH', CAST(0.0346000000 AS Numeric(28, 10)))
GO
INSERT [dbo].[Currency] ([CurrencyCode], [SpotRate]) VALUES (N'USD', CAST(1.1588000000 AS Numeric(28, 10)))
GO
INSERT [dbo].[Currency] ([CurrencyCode], [SpotRate]) VALUES (N'YER', CAST(0.0214000000 AS Numeric(28, 10)))
GO
SET IDENTITY_INSERT [dbo].[Current_Price] ON 

GO
INSERT [dbo].[Current_Price] ([CurrentPriceID], [SecurityID], [Price], [Volume], [OpeningPrice], [ClosingPrice]) VALUES (1, 1001, CAST(1189.1200000000 AS Numeric(28, 10)), 8877126, CAST(191.7800000000 AS Numeric(28, 10)), CAST(192.0100000000 AS Numeric(28, 10)))
GO
INSERT [dbo].[Current_Price] ([CurrentPriceID], [SecurityID], [Price], [Volume], [OpeningPrice], [ClosingPrice]) VALUES (2, 1002, CAST(3464.1425300000 AS Numeric(28, 10)), 5436367, CAST(152.4600000000 AS Numeric(28, 10)), CAST(153.5300000000 AS Numeric(28, 10)))
GO
INSERT [dbo].[Current_Price] ([CurrentPriceID], [SecurityID], [Price], [Volume], [OpeningPrice], [ClosingPrice]) VALUES (3, 1003, CAST(1355.1543000000 AS Numeric(28, 10)), 1979066, CAST(101.2400000000 AS Numeric(28, 10)), CAST(98.9700000000 AS Numeric(28, 10)))
GO
INSERT [dbo].[Current_Price] ([CurrentPriceID], [SecurityID], [Price], [Volume], [OpeningPrice], [ClosingPrice]) VALUES (4, 1004, CAST(2566.2367000000 AS Numeric(28, 10)), 5749633, CAST(144.2300000000 AS Numeric(28, 10)), CAST(147.3500000000 AS Numeric(28, 10)))
GO
INSERT [dbo].[Current_Price] ([CurrentPriceID], [SecurityID], [Price], [Volume], [OpeningPrice], [ClosingPrice]) VALUES (5, 1005, CAST(3465.1235600000 AS Numeric(28, 10)), 2466366, CAST(133.7800000000 AS Numeric(28, 10)), CAST(137.0100000000 AS Numeric(28, 10)))
GO
INSERT [dbo].[Current_Price] ([CurrentPriceID], [SecurityID], [Price], [Volume], [OpeningPrice], [ClosingPrice]) VALUES (6, 1006, CAST(6326.2565700000 AS Numeric(28, 10)), 2565424, CAST(93.1400000000 AS Numeric(28, 10)), CAST(99.1500000000 AS Numeric(28, 10)))
GO
INSERT [dbo].[Current_Price] ([CurrentPriceID], [SecurityID], [Price], [Volume], [OpeningPrice], [ClosingPrice]) VALUES (7, 1007, CAST(2345.1476500000 AS Numeric(28, 10)), 7342564, CAST(77.2100000000 AS Numeric(28, 10)), CAST(82.3700000000 AS Numeric(28, 10)))
GO
INSERT [dbo].[Current_Price] ([CurrentPriceID], [SecurityID], [Price], [Volume], [OpeningPrice], [ClosingPrice]) VALUES (8, 1008, CAST(5266.3734000000 AS Numeric(28, 10)), 4672477, CAST(200.2500000000 AS Numeric(28, 10)), CAST(204.4600000000 AS Numeric(28, 10)))
GO
INSERT [dbo].[Current_Price] ([CurrentPriceID], [SecurityID], [Price], [Volume], [OpeningPrice], [ClosingPrice]) VALUES (9, 1009, CAST(4362.3682400000 AS Numeric(28, 10)), 2145346, CAST(111.2500000000 AS Numeric(28, 10)), CAST(111.0100000000 AS Numeric(28, 10)))
GO
INSERT [dbo].[Current_Price] ([CurrentPriceID], [SecurityID], [Price], [Volume], [OpeningPrice], [ClosingPrice]) VALUES (10, 1010, CAST(3578.2587000000 AS Numeric(28, 10)), 4689426, CAST(222.5200000000 AS Numeric(28, 10)), CAST(221.0400000000 AS Numeric(28, 10)))
GO
INSERT [dbo].[Current_Price] ([CurrentPriceID], [SecurityID], [Price], [Volume], [OpeningPrice], [ClosingPrice]) VALUES (11, 1011, CAST(2554.1842600000 AS Numeric(28, 10)), 3246457, CAST(156.7800000000 AS Numeric(28, 10)), CAST(153.5400000000 AS Numeric(28, 10)))
GO
SET IDENTITY_INSERT [dbo].[Current_Price] OFF
GO
SET IDENTITY_INSERT [dbo].[Derivatives] ON 

GO
INSERT [dbo].[Derivatives] ([DerivativeID], [SecurityID], [StrikePrice], [ExpirationDate], [DaysToSettle]) VALUES (1, 1001, 100.0000, CAST(N'2018-09-21 16:59:00.000' AS DateTime), 12)
GO
INSERT [dbo].[Derivatives] ([DerivativeID], [SecurityID], [StrikePrice], [ExpirationDate], [DaysToSettle]) VALUES (2, 1002, 159.0000, CAST(N'2018-08-17 16:59:00.000' AS DateTime), 9)
GO
INSERT [dbo].[Derivatives] ([DerivativeID], [SecurityID], [StrikePrice], [ExpirationDate], [DaysToSettle]) VALUES (3, 1003, 200.0000, CAST(N'2018-07-16 16:59:00.000' AS DateTime), 6)
GO
INSERT [dbo].[Derivatives] ([DerivativeID], [SecurityID], [StrikePrice], [ExpirationDate], [DaysToSettle]) VALUES (4, 1004, 230.3800, CAST(N'2018-10-10 16:59:00.000' AS DateTime), 32)
GO
INSERT [dbo].[Derivatives] ([DerivativeID], [SecurityID], [StrikePrice], [ExpirationDate], [DaysToSettle]) VALUES (5, 1005, 214.3500, CAST(N'2018-09-18 16:59:00.000' AS DateTime), 15)
GO
INSERT [dbo].[Derivatives] ([DerivativeID], [SecurityID], [StrikePrice], [ExpirationDate], [DaysToSettle]) VALUES (6, 1006, 429.3100, CAST(N'2018-11-15 16:59:00.000' AS DateTime), 43)
GO
INSERT [dbo].[Derivatives] ([DerivativeID], [SecurityID], [StrikePrice], [ExpirationDate], [DaysToSettle]) VALUES (7, 1007, 338.1400, CAST(N'2018-07-28 16:59:00.000' AS DateTime), 7)
GO
INSERT [dbo].[Derivatives] ([DerivativeID], [SecurityID], [StrikePrice], [ExpirationDate], [DaysToSettle]) VALUES (8, 1008, 620.6200, CAST(N'2018-08-15 16:59:00.000' AS DateTime), 18)
GO
INSERT [dbo].[Derivatives] ([DerivativeID], [SecurityID], [StrikePrice], [ExpirationDate], [DaysToSettle]) VALUES (9, 1009, 720.2700, CAST(N'2018-12-01 16:59:00.000' AS DateTime), 48)
GO
INSERT [dbo].[Derivatives] ([DerivativeID], [SecurityID], [StrikePrice], [ExpirationDate], [DaysToSettle]) VALUES (10, 1010, 277.9400, CAST(N'2018-07-27 16:59:00.000' AS DateTime), 6)
GO
INSERT [dbo].[Derivatives] ([DerivativeID], [SecurityID], [StrikePrice], [ExpirationDate], [DaysToSettle]) VALUES (11, 1011, 412.8400, CAST(N'2018-08-15 16:59:00.000' AS DateTime), 13)
GO
SET IDENTITY_INSERT [dbo].[Derivatives] OFF
GO
SET IDENTITY_INSERT [dbo].[Device_Information] ON 

GO
INSERT [dbo].[Device_Information] ([DeviceID], [DeviceName], [DeviceType], [UserID], [TCAAgreementDetailsID]) VALUES (1, N'MAC', N'Macbook', 1, 1)
GO
INSERT [dbo].[Device_Information] ([DeviceID], [DeviceName], [DeviceType], [UserID], [TCAAgreementDetailsID]) VALUES (2, N'HP', N'Laptop', 2, 2)
GO
INSERT [dbo].[Device_Information] ([DeviceID], [DeviceName], [DeviceType], [UserID], [TCAAgreementDetailsID]) VALUES (3, N'Acer', N'Desktop', 3, 3)
GO
INSERT [dbo].[Device_Information] ([DeviceID], [DeviceName], [DeviceType], [UserID], [TCAAgreementDetailsID]) VALUES (4, N'Sony', N'Phone', 4, 4)
GO
INSERT [dbo].[Device_Information] ([DeviceID], [DeviceName], [DeviceType], [UserID], [TCAAgreementDetailsID]) VALUES (5, N'Lenovo', N'Laptop', 5, 5)
GO
INSERT [dbo].[Device_Information] ([DeviceID], [DeviceName], [DeviceType], [UserID], [TCAAgreementDetailsID]) VALUES (6, N'IPhone8', N'Phone', 6, 6)
GO
INSERT [dbo].[Device_Information] ([DeviceID], [DeviceName], [DeviceType], [UserID], [TCAAgreementDetailsID]) VALUES (7, N'OnePlus5T', N'Phone', 7, 7)
GO
INSERT [dbo].[Device_Information] ([DeviceID], [DeviceName], [DeviceType], [UserID], [TCAAgreementDetailsID]) VALUES (8, N'Acer', N'Laptop', 8, 8)
GO
INSERT [dbo].[Device_Information] ([DeviceID], [DeviceName], [DeviceType], [UserID], [TCAAgreementDetailsID]) VALUES (9, N'SamsungS9', N'Phone', 9, 9)
GO
INSERT [dbo].[Device_Information] ([DeviceID], [DeviceName], [DeviceType], [UserID], [TCAAgreementDetailsID]) VALUES (10, N'HPSpectre', N'Laptop', 10, 10)
GO
INSERT [dbo].[Device_Information] ([DeviceID], [DeviceName], [DeviceType], [UserID], [TCAAgreementDetailsID]) VALUES (11, N'Motorola', N'Phone', 11, 11)
GO
INSERT [dbo].[Device_Information] ([DeviceID], [DeviceName], [DeviceType], [UserID], [TCAAgreementDetailsID]) VALUES (12, N'SonyZ3', N'Phone', 12, 12)
GO
SET IDENTITY_INSERT [dbo].[Device_Information] OFF
GO
INSERT [dbo].[Holdings] ([BuyingDate], [BuyingPrice], [QuantityHeld], [UserID], [SecurityID], [DerivativeID]) VALUES (CAST(N'2018-06-22' AS Date), CAST(160.3200000000 AS Numeric(28, 10)), 3, 1, 1001, 1)
GO
INSERT [dbo].[Holdings] ([BuyingDate], [BuyingPrice], [QuantityHeld], [UserID], [SecurityID], [DerivativeID]) VALUES (CAST(N'2018-07-12' AS Date), CAST(111.7400000000 AS Numeric(28, 10)), 5, 2, 1002, 2)
GO
INSERT [dbo].[Holdings] ([BuyingDate], [BuyingPrice], [QuantityHeld], [UserID], [SecurityID], [DerivativeID]) VALUES (CAST(N'2018-07-15' AS Date), CAST(100.3200000000 AS Numeric(28, 10)), 2, 3, 1003, 3)
GO
INSERT [dbo].[Holdings] ([BuyingDate], [BuyingPrice], [QuantityHeld], [UserID], [SecurityID], [DerivativeID]) VALUES (CAST(N'2018-07-03' AS Date), CAST(111.3400000000 AS Numeric(28, 10)), 3, 4, 1004, 4)
GO
INSERT [dbo].[Holdings] ([BuyingDate], [BuyingPrice], [QuantityHeld], [UserID], [SecurityID], [DerivativeID]) VALUES (CAST(N'2018-06-30' AS Date), CAST(172.4400000000 AS Numeric(28, 10)), 4, 10, 1004, 11)
GO
INSERT [dbo].[Holdings] ([BuyingDate], [BuyingPrice], [QuantityHeld], [UserID], [SecurityID], [DerivativeID]) VALUES (CAST(N'2018-06-13' AS Date), CAST(125.4400000000 AS Numeric(28, 10)), 4, 5, 1005, 5)
GO
INSERT [dbo].[Holdings] ([BuyingDate], [BuyingPrice], [QuantityHeld], [UserID], [SecurityID], [DerivativeID]) VALUES (CAST(N'2018-07-20' AS Date), CAST(87.1500000000 AS Numeric(28, 10)), 2, 5, 1006, 6)
GO
INSERT [dbo].[Holdings] ([BuyingDate], [BuyingPrice], [QuantityHeld], [UserID], [SecurityID], [DerivativeID]) VALUES (CAST(N'2018-06-22' AS Date), CAST(160.3200000000 AS Numeric(28, 10)), 3, 8, 1007, 7)
GO
INSERT [dbo].[Holdings] ([BuyingDate], [BuyingPrice], [QuantityHeld], [UserID], [SecurityID], [DerivativeID]) VALUES (CAST(N'2018-07-03' AS Date), CAST(117.2800000000 AS Numeric(28, 10)), 3, 9, 1008, 8)
GO
INSERT [dbo].[Holdings] ([BuyingDate], [BuyingPrice], [QuantityHeld], [UserID], [SecurityID], [DerivativeID]) VALUES (CAST(N'2018-06-28' AS Date), CAST(200.3200000000 AS Numeric(28, 10)), 2, 10, 1009, 9)
GO
INSERT [dbo].[Holdings] ([BuyingDate], [BuyingPrice], [QuantityHeld], [UserID], [SecurityID], [DerivativeID]) VALUES (CAST(N'2018-07-05' AS Date), CAST(109.2400000000 AS Numeric(28, 10)), 7, 11, 1010, 10)
GO
INSERT [dbo].[Holdings] ([BuyingDate], [BuyingPrice], [QuantityHeld], [UserID], [SecurityID], [DerivativeID]) VALUES (CAST(N'2018-07-05' AS Date), CAST(157.9400000000 AS Numeric(28, 10)), 2, 12, 1011, 11)
GO
SET IDENTITY_INSERT [dbo].[Security] ON 

GO
INSERT [dbo].[Security] ([SecurityID], [SecurityDescription], [EarningsDate], [EarningsResult], [CountryCode], [CurrencyCode], [Industry]) VALUES (1000, N'Caterpillar', CAST(N'2018-04-21 10:25:13.000' AS DateTime), 2.6600, 101, N'USD', N'construction')
GO
INSERT [dbo].[Security] ([SecurityID], [SecurityDescription], [EarningsDate], [EarningsResult], [CountryCode], [CurrencyCode], [Industry]) VALUES (1001, N'Tesla', CAST(N'2018-06-13 09:22:52.000' AS DateTime), 2.3200, 102, N'GBP', N'Automotive')
GO
INSERT [dbo].[Security] ([SecurityID], [SecurityDescription], [EarningsDate], [EarningsResult], [CountryCode], [CurrencyCode], [Industry]) VALUES (1002, N'Amazon', CAST(N'2018-07-16 09:48:22.000' AS DateTime), 3.4400, 103, N'INR', N'E-Commerce')
GO
INSERT [dbo].[Security] ([SecurityID], [SecurityDescription], [EarningsDate], [EarningsResult], [CountryCode], [CurrencyCode], [Industry]) VALUES (1003, N'Cisco', CAST(N'2018-06-29 11:37:12.000' AS DateTime), 3.0300, 104, N'MVR', N'Networking Harsware')
GO
INSERT [dbo].[Security] ([SecurityID], [SecurityDescription], [EarningsDate], [EarningsResult], [CountryCode], [CurrencyCode], [Industry]) VALUES (1004, N'Netflix', CAST(N'2018-07-14 14:12:56.000' AS DateTime), 3.4200, 105, N'ESP', N'Entertainment')
GO
INSERT [dbo].[Security] ([SecurityID], [SecurityDescription], [EarningsDate], [EarningsResult], [CountryCode], [CurrencyCode], [Industry]) VALUES (1005, N'JPMorgan Chase', CAST(N'2018-04-12 12:30:35.000' AS DateTime), 12.2000, 106, N'LKR', N'Banking services')
GO
INSERT [dbo].[Security] ([SecurityID], [SecurityDescription], [EarningsDate], [EarningsResult], [CountryCode], [CurrencyCode], [Industry]) VALUES (1006, N'Boeing', CAST(N'2018-06-27 13:35:29.000' AS DateTime), 4.3500, 107, N'UAE', N'Aerospace')
GO
INSERT [dbo].[Security] ([SecurityID], [SecurityDescription], [EarningsDate], [EarningsResult], [CountryCode], [CurrencyCode], [Industry]) VALUES (1007, N'Visa', CAST(N'2018-07-18 12:36:11.000' AS DateTime), 2.8900, 108, N'CNY', N'?Financial services')
GO
INSERT [dbo].[Security] ([SecurityID], [SecurityDescription], [EarningsDate], [EarningsResult], [CountryCode], [CurrencyCode], [Industry]) VALUES (1008, N'Arista Networks', CAST(N'2018-07-04 09:23:28.000' AS DateTime), 3.7300, 109, N'PHP', N'Networking Hardware')
GO
INSERT [dbo].[Security] ([SecurityID], [SecurityDescription], [EarningsDate], [EarningsResult], [CountryCode], [CurrencyCode], [Industry]) VALUES (1009, N'McDonalds', CAST(N'2018-07-15 10:27:33.000' AS DateTime), 4.2800, 110, N'THB', N'Restaurant')
GO
INSERT [dbo].[Security] ([SecurityID], [SecurityDescription], [EarningsDate], [EarningsResult], [CountryCode], [CurrencyCode], [Industry]) VALUES (1010, N'Southwest Airlines', CAST(N'2018-04-18 15:36:56.000' AS DateTime), 4.0100, 112, N'YER', N'Aerospace')
GO
INSERT [dbo].[Security] ([SecurityID], [SecurityDescription], [EarningsDate], [EarningsResult], [CountryCode], [CurrencyCode], [Industry]) VALUES (1011, N'Qualcomm', CAST(N'2018-07-20 09:29:30.000' AS DateTime), 2.2000, 113, N'ARS', N'Telecommunications')
GO
SET IDENTITY_INSERT [dbo].[Security] OFF
GO
SET IDENTITY_INSERT [dbo].[TCAAgreementDetails] ON 

GO
INSERT [dbo].[TCAAgreementDetails] ([TCAAgreementDetailsID], [DateOfAgreement]) VALUES (1, CAST(N'2018-02-13' AS Date))
GO
INSERT [dbo].[TCAAgreementDetails] ([TCAAgreementDetailsID], [DateOfAgreement]) VALUES (2, CAST(N'2018-05-20' AS Date))
GO
INSERT [dbo].[TCAAgreementDetails] ([TCAAgreementDetailsID], [DateOfAgreement]) VALUES (3, CAST(N'2017-11-22' AS Date))
GO
INSERT [dbo].[TCAAgreementDetails] ([TCAAgreementDetailsID], [DateOfAgreement]) VALUES (4, CAST(N'2018-06-18' AS Date))
GO
INSERT [dbo].[TCAAgreementDetails] ([TCAAgreementDetailsID], [DateOfAgreement]) VALUES (5, CAST(N'2017-01-29' AS Date))
GO
INSERT [dbo].[TCAAgreementDetails] ([TCAAgreementDetailsID], [DateOfAgreement]) VALUES (6, CAST(N'2018-07-11' AS Date))
GO
INSERT [dbo].[TCAAgreementDetails] ([TCAAgreementDetailsID], [DateOfAgreement]) VALUES (7, CAST(N'2018-04-28' AS Date))
GO
INSERT [dbo].[TCAAgreementDetails] ([TCAAgreementDetailsID], [DateOfAgreement]) VALUES (8, CAST(N'2018-05-20' AS Date))
GO
INSERT [dbo].[TCAAgreementDetails] ([TCAAgreementDetailsID], [DateOfAgreement]) VALUES (9, CAST(N'2018-05-20' AS Date))
GO
INSERT [dbo].[TCAAgreementDetails] ([TCAAgreementDetailsID], [DateOfAgreement]) VALUES (10, CAST(N'2018-05-20' AS Date))
GO
INSERT [dbo].[TCAAgreementDetails] ([TCAAgreementDetailsID], [DateOfAgreement]) VALUES (11, CAST(N'2018-05-20' AS Date))
GO
INSERT [dbo].[TCAAgreementDetails] ([TCAAgreementDetailsID], [DateOfAgreement]) VALUES (12, CAST(N'2018-05-20' AS Date))
GO
SET IDENTITY_INSERT [dbo].[TCAAgreementDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Trade_History] ON 

GO
INSERT [dbo].[Trade_History] ([TradeHistID], [UserID], [TradeID], [SecurityID]) VALUES (1, 1, 1, 1001)
GO
INSERT [dbo].[Trade_History] ([TradeHistID], [UserID], [TradeID], [SecurityID]) VALUES (2, 2, 2, 1002)
GO
INSERT [dbo].[Trade_History] ([TradeHistID], [UserID], [TradeID], [SecurityID]) VALUES (3, 3, 3, 1003)
GO
INSERT [dbo].[Trade_History] ([TradeHistID], [UserID], [TradeID], [SecurityID]) VALUES (4, 4, 4, 1004)
GO
SET IDENTITY_INSERT [dbo].[Trade_History] OFF
GO
SET IDENTITY_INSERT [dbo].[Trades] ON 

GO
INSERT [dbo].[Trades] ([TradeID], [UserID], [SecurityID], [Buy_OR_Sell], [Shares], [LimitPrice], [Amount], [Price], [Trading_date]) VALUES (1, 1, 1001, N'Buy', 12, 5.5000, 68.3000, CAST(6.6200000000 AS Numeric(28, 10)), CAST(N'2018-05-22 10:27:47.000' AS DateTime))
GO
INSERT [dbo].[Trades] ([TradeID], [UserID], [SecurityID], [Buy_OR_Sell], [Shares], [LimitPrice], [Amount], [Price], [Trading_date]) VALUES (2, 2, 1002, N'Sell', 5, 5.7200, 28.6000, CAST(5.8800000000 AS Numeric(28, 10)), CAST(N'2018-06-27 11:27:24.000' AS DateTime))
GO
INSERT [dbo].[Trades] ([TradeID], [UserID], [SecurityID], [Buy_OR_Sell], [Shares], [LimitPrice], [Amount], [Price], [Trading_date]) VALUES (3, 3, 1003, N'Sell', 4, 6.2700, 25.8000, CAST(6.3900000000 AS Numeric(28, 10)), CAST(N'2018-05-15 11:45:13.000' AS DateTime))
GO
INSERT [dbo].[Trades] ([TradeID], [UserID], [SecurityID], [Buy_OR_Sell], [Shares], [LimitPrice], [Amount], [Price], [Trading_date]) VALUES (4, 1, 1001, N'Buy', 12, 5.5000, 68.3000, CAST(6.6200000000 AS Numeric(28, 10)), CAST(N'2018-05-22 10:27:47.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Trades] OFF
GO
SET IDENTITY_INSERT [dbo].[User_Watchlist] ON 

GO
INSERT [dbo].[User_Watchlist] ([UserWatchlistID], [UserID], [SecurityID], [EntryPrice], [ExitPrice], [Price]) VALUES (1, 1, 1001, 169.8300, 170.3300, 175.2300)
GO
INSERT [dbo].[User_Watchlist] ([UserWatchlistID], [UserID], [SecurityID], [EntryPrice], [ExitPrice], [Price]) VALUES (2, 2, 1002, 132.6700, 135.5500, 137.3400)
GO
INSERT [dbo].[User_Watchlist] ([UserWatchlistID], [UserID], [SecurityID], [EntryPrice], [ExitPrice], [Price]) VALUES (3, 3, 1003, 93.7300, 94.3300, 95.1000)
GO
INSERT [dbo].[User_Watchlist] ([UserWatchlistID], [UserID], [SecurityID], [EntryPrice], [ExitPrice], [Price]) VALUES (4, 4, 1004, 97.5400, 99.2400, 97.6600)
GO
INSERT [dbo].[User_Watchlist] ([UserWatchlistID], [UserID], [SecurityID], [EntryPrice], [ExitPrice], [Price]) VALUES (5, 5, 1005, 123.2600, 126.2200, 126.2900)
GO
INSERT [dbo].[User_Watchlist] ([UserWatchlistID], [UserID], [SecurityID], [EntryPrice], [ExitPrice], [Price]) VALUES (6, 6, 1006, 65.2000, 67.1400, 66.3700)
GO
INSERT [dbo].[User_Watchlist] ([UserWatchlistID], [UserID], [SecurityID], [EntryPrice], [ExitPrice], [Price]) VALUES (7, 8, 1007, 169.2500, 170.3300, 173.1800)
GO
INSERT [dbo].[User_Watchlist] ([UserWatchlistID], [UserID], [SecurityID], [EntryPrice], [ExitPrice], [Price]) VALUES (8, 9, 1008, 104.3300, 107.1400, 106.7300)
GO
INSERT [dbo].[User_Watchlist] ([UserWatchlistID], [UserID], [SecurityID], [EntryPrice], [ExitPrice], [Price]) VALUES (9, 10, 1009, 192.9900, 195.6100, 196.6600)
GO
INSERT [dbo].[User_Watchlist] ([UserWatchlistID], [UserID], [SecurityID], [EntryPrice], [ExitPrice], [Price]) VALUES (10, 11, 1010, 103.9900, 101.7200, 104.7500)
GO
INSERT [dbo].[User_Watchlist] ([UserWatchlistID], [UserID], [SecurityID], [EntryPrice], [ExitPrice], [Price]) VALUES (11, 12, 1011, 141.3900, 144.7200, 143.5500)
GO
SET IDENTITY_INSERT [dbo].[User_Watchlist] OFF
GO
SET IDENTITY_INSERT [dbo].[UserProfile] ON 

GO
INSERT [dbo].[UserProfile] ([UserID], [FirstName], [MiddleName], [LastName], [DateOfBirth]) VALUES (1, N'Samuel', N'Adam', N'Cooper', CAST(N'1992-02-12 23:00:12.000' AS DateTime))
GO
INSERT [dbo].[UserProfile] ([UserID], [FirstName], [MiddleName], [LastName], [DateOfBirth]) VALUES (2, N'Bob', N'Tim', N'Cooper', CAST(N'1983-11-27 19:02:00.000' AS DateTime))
GO
INSERT [dbo].[UserProfile] ([UserID], [FirstName], [MiddleName], [LastName], [DateOfBirth]) VALUES (3, N'Mary', N'Michael', N'Carter', CAST(N'1977-07-13 14:22:06.000' AS DateTime))
GO
INSERT [dbo].[UserProfile] ([UserID], [FirstName], [MiddleName], [LastName], [DateOfBirth]) VALUES (4, N'Daniel', N'MArk', N'Finley', CAST(N'1982-07-22 05:30:12.000' AS DateTime))
GO
INSERT [dbo].[UserProfile] ([UserID], [FirstName], [MiddleName], [LastName], [DateOfBirth]) VALUES (5, N'Raj', N'Arjun', N'Kapoor', CAST(N'1988-11-26 22:35:40.000' AS DateTime))
GO
INSERT [dbo].[UserProfile] ([UserID], [FirstName], [MiddleName], [LastName], [DateOfBirth]) VALUES (6, N'Matthew', N'Paul', N'Jones', CAST(N'1990-03-16 13:22:37.000' AS DateTime))
GO
INSERT [dbo].[UserProfile] ([UserID], [FirstName], [MiddleName], [LastName], [DateOfBirth]) VALUES (7, N'Carol', N'John', N'Mason', CAST(N'1965-12-11 22:19:00.000' AS DateTime))
GO
INSERT [dbo].[UserProfile] ([UserID], [FirstName], [MiddleName], [LastName], [DateOfBirth]) VALUES (8, N'Emily', N'George', N'Smith', CAST(N'1988-04-02 11:06:16.000' AS DateTime))
GO
INSERT [dbo].[UserProfile] ([UserID], [FirstName], [MiddleName], [LastName], [DateOfBirth]) VALUES (9, N'Laura', N'Jason', N'Walker', CAST(N'1984-06-06 07:06:24.000' AS DateTime))
GO
INSERT [dbo].[UserProfile] ([UserID], [FirstName], [MiddleName], [LastName], [DateOfBirth]) VALUES (10, N'Helen', N'JAcob', N'Ashley', CAST(N'1973-11-29 06:14:19.000' AS DateTime))
GO
INSERT [dbo].[UserProfile] ([UserID], [FirstName], [MiddleName], [LastName], [DateOfBirth]) VALUES (11, N'Nicholas', N'Eric', N'Ellis', CAST(N'1990-02-12 07:18:22.000' AS DateTime))
GO
INSERT [dbo].[UserProfile] ([UserID], [FirstName], [MiddleName], [LastName], [DateOfBirth]) VALUES (12, N'Anna', N'Stephen', N'West', CAST(N'1972-05-20 20:22:02.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[UserProfile] OFF
GO
ALTER TABLE [dbo].[Account_Transactions]  WITH CHECK ADD FOREIGN KEY([BankAcctID])
REFERENCES [dbo].[Bank_Accounts] ([BankAccountID])
GO
ALTER TABLE [dbo].[Bank_Accounts]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfile] ([UserID])
GO
ALTER TABLE [dbo].[Current_Price]  WITH CHECK ADD FOREIGN KEY([SecurityID])
REFERENCES [dbo].[Security] ([SecurityID])
GO
ALTER TABLE [dbo].[Derivatives]  WITH CHECK ADD FOREIGN KEY([SecurityID])
REFERENCES [dbo].[Security] ([SecurityID])
GO
ALTER TABLE [dbo].[Device_Information]  WITH CHECK ADD FOREIGN KEY([TCAAgreementDetailsID])
REFERENCES [dbo].[TCAAgreementDetails] ([TCAAgreementDetailsID])
GO
ALTER TABLE [dbo].[Device_Information]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfile] ([UserID])
GO
ALTER TABLE [dbo].[Historical_price]  WITH CHECK ADD FOREIGN KEY([SecurityID])
REFERENCES [dbo].[Security] ([SecurityID])
GO
ALTER TABLE [dbo].[Holdings]  WITH CHECK ADD FOREIGN KEY([DerivativeID])
REFERENCES [dbo].[Derivatives] ([DerivativeID])
GO
ALTER TABLE [dbo].[Holdings]  WITH CHECK ADD FOREIGN KEY([SecurityID])
REFERENCES [dbo].[Security] ([SecurityID])
GO
ALTER TABLE [dbo].[Holdings]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfile] ([UserID])
GO
ALTER TABLE [dbo].[Security]  WITH CHECK ADD FOREIGN KEY([CountryCode])
REFERENCES [dbo].[Country] ([CountryCode])
GO
ALTER TABLE [dbo].[Security]  WITH CHECK ADD FOREIGN KEY([CurrencyCode])
REFERENCES [dbo].[Currency] ([CurrencyCode])
GO
ALTER TABLE [dbo].[Trade_History]  WITH CHECK ADD FOREIGN KEY([SecurityID])
REFERENCES [dbo].[Security] ([SecurityID])
GO
ALTER TABLE [dbo].[Trade_History]  WITH CHECK ADD FOREIGN KEY([TradeID])
REFERENCES [dbo].[Trades] ([TradeID])
GO
ALTER TABLE [dbo].[Trade_History]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfile] ([UserID])
GO
ALTER TABLE [dbo].[Trades]  WITH CHECK ADD FOREIGN KEY([SecurityID])
REFERENCES [dbo].[Security] ([SecurityID])
GO
ALTER TABLE [dbo].[Trades]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfile] ([UserID])
GO
ALTER TABLE [dbo].[User_Watchlist]  WITH CHECK ADD FOREIGN KEY([SecurityID])
REFERENCES [dbo].[Security] ([SecurityID])
GO
ALTER TABLE [dbo].[User_Watchlist]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[UserProfile] ([UserID])
GO
USE [master]
GO
ALTER DATABASE [Stock_Market] SET  READ_WRITE 
GO

-- *****Encrypt the User's last name in the UserProfile table in the Stock Market database*****
-- Reference: https://www.c-sharpcorner.com/article/implement-column-level-encryption-decryption-in-sql-server-2016/

CREATE MASTER KEY ENCRYPTION BY  
PASSWORD = 'Robinhood123$%'  
GO

CREATE CERTIFICATE SelfSignedCertificate  
WITH SUBJECT = 'Password Encryption';  
GO  
CREATE SYMMETRIC KEY SQLSymmetricKey  
WITH ALGORITHM = AES_128
ENCRYPTION BY CERTIFICATE SelfSignedCertificate;  
GO

USE Stock_Market;
ALTER TABLE UserProfile
ADD EncryptedLastName varbinary(MAX)NULL  
GO

OPEN SYMMETRIC KEY SQLSymmetricKey  
DECRYPTION BY CERTIFICATE SelfSignedCertificate; 

UPDATE UserProfile
SET [EncryptedLastName] = EncryptByKey(Key_GUID('SQLSymmetricKey'), LastName);  
GO

CLOSE SYMMETRIC KEY SQLSymmetricKey;  
GO  

-- ***** Functions for use in the Stock Market database *****

--CustomerTrades function --
-- Gives details of all the trades performed by entering userid of multiple customer--

CREATE FUNCTION StringToValues
(@ListofIds nvarchar(max))
RETURNS @rtn TABLE (IntegerValue int)
AS
BEGIN
    WHILE(CHARINDEX(',', @ListofIds) > 0)
        BEGIN
            INSERT INTO @Rtn
                SELECT LTRIM(RTRIM(SUBSTRING(@ListofIds, 1, CHARINDEX(',', @ListofIds) - 1)));
            SET @ListofIds = SUBSTRING(@ListofIds, CHARINDEX(',', @ListofIds) + LEN(','), LEN(@ListofIds));
        END;
    INSERT INTO @Rtn SELECT LTRIM(RTRIM(@ListofIds));
    RETURN;
END;
GO


CREATE FUNCTION CUSTOMERTRADES
(@USERIDs VARCHAR(MAX))
returns table
as
return
	SELECT
 u.UserID, 
	FirstName,
	MiddleName,
	LastName,
	DateOfBirth,
	t.TradeID,
	t.SecurityID,
	st.securitydescription,
	t.Shares,
	t.Buy_OR_Sell,
	t.Price
		from Stock_Market.dbo.userprofile u
	INNER JOIN Stock_Market.dbo.trades t
	on t.UserID = u.userid
	INNER JOIN Stock_Market.dbo.Security st
	on st.SecurityID = t.SecurityID
		INNER JOIN dbo.StringToValues(@USERIDs) s
	on s.IntegerValue = u.UserID;
GO

-- SELECT  * from dbo.CUSTOMERTRADES('1,2,3,4');

--SecurityPL Function--
--Purpose: to take start price, last price and holding amount to calculate profit and loss
GO
CREATE FUNCTION SecurityPL
(@StartPrice NUMERIC(28,10), @LastPrice NUMERIC(28,10), @Amount INT)
	RETURNS NUMERIC(28,10)
AS
	BEGIN
	DECLARE @ProfitAndLoss NUMERIC(28,10);
	SELECT @ProfitAndLoss = (@LastPrice - @StartPrice)*@Amount
	RETURN @ProfitAndLoss;
END;
GO

-- SELECT dbo.securityPL(11.23,12.11,10);

-- ****** Views that are to be used in the Stock Market database ****** --
--View to display each user’s holdings and calculate the profit and loss on each holding using the defined function

CREATE VIEW UserHoldingsPL
AS 
	SELECT
		up.UserID
		,h.SecurityID
		,h.QuantityHeld
		,h.buyingPrice
		,cp.Price
		,[dbo].securityPL(h.buyingPrice,cp.Price,h.QuantityHeld) AS SecurityPNL
	FROM UserProfile up
	JOIN Holdings h ON h.userid = up.userid
	JOIN Current_Price cp ON cp.securityID = h.securityID;
GO

-- SELECT * FROM UserHoldingsPL;

--View to display prices of all securities now
CREATE VIEW SecurityPriceNow AS
	SELECT SecurityDescription,
	Price
	FROM [Security] S
	LEFT JOIN [Current_Price] C ON S.SecurityID = C.SecurityID;

GO

--SELECT * FROM SecurityPriceNow;

