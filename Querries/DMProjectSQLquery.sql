USE [master]
GO
/****** Object:  Database [DBToernooi]    Script Date: 30/05/2021 13:20:04 ******/
CREATE DATABASE [DBToernooi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBToernooi', FILENAME = N'C:\Users\joris\DBToernooi.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBToernooi_log', FILENAME = N'C:\Users\joris\DBToernooi_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DBToernooi] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBToernooi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBToernooi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBToernooi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBToernooi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBToernooi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBToernooi] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBToernooi] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DBToernooi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBToernooi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBToernooi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBToernooi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBToernooi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBToernooi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBToernooi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBToernooi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBToernooi] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DBToernooi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBToernooi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBToernooi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBToernooi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBToernooi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBToernooi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBToernooi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBToernooi] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DBToernooi] SET  MULTI_USER 
GO
ALTER DATABASE [DBToernooi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBToernooi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBToernooi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBToernooi] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBToernooi] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBToernooi] SET QUERY_STORE = OFF
GO
USE [DBToernooi]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [DBToernooi]
GO
/****** Object:  Schema [ToernooiInschrijven]    Script Date: 30/05/2021 13:20:04 ******/
CREATE SCHEMA [ToernooiInschrijven]
GO
/****** Object:  Table [ToernooiInschrijven].[GameMode]    Script Date: 30/05/2021 13:20:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ToernooiInschrijven].[GameMode](
	[gameModeId] [int] IDENTITY(1,1) NOT NULL,
	[gameModeNaam] [varchar](40) NOT NULL,
 CONSTRAINT [PK_GameMode] PRIMARY KEY CLUSTERED 
(
	[gameModeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ToernooiInschrijven].[GameModeRank]    Script Date: 30/05/2021 13:20:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ToernooiInschrijven].[GameModeRank](
	[gameModeRankId] [int] IDENTITY(1,1) NOT NULL,
	[rankId] [int] NOT NULL,
	[gameModeId] [int] NOT NULL,
 CONSTRAINT [PK_GameModeRank] PRIMARY KEY CLUSTERED 
(
	[gameModeRankId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ToernooiInschrijven].[Prijs]    Script Date: 30/05/2021 13:20:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ToernooiInschrijven].[Prijs](
	[prijsId] [int] IDENTITY(1,1) NOT NULL,
	[spelerId] [int] NOT NULL,
	[prijsPot] [int] NOT NULL,
 CONSTRAINT [PK_Prijs] PRIMARY KEY CLUSTERED 
(
	[prijsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ToernooiInschrijven].[Rank]    Script Date: 30/05/2021 13:20:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ToernooiInschrijven].[Rank](
	[rankId] [int] IDENTITY(1,1) NOT NULL,
	[rankNaam] [varchar](40) NOT NULL,
 CONSTRAINT [PK_Rank] PRIMARY KEY CLUSTERED 
(
	[rankId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ToernooiInschrijven].[Speler]    Script Date: 30/05/2021 13:20:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ToernooiInschrijven].[Speler](
	[spelerId] [int] IDENTITY(1,1) NOT NULL,
	[voornaam] [varchar](20) NOT NULL,
	[achternaam] [varchar](20) NOT NULL,
	[nicknaam] [varchar](20) NOT NULL,
	[wachtwoord] [varchar](20) NOT NULL,
	[email] [varchar](30) NOT NULL,
	[geboortedatum] [date] NOT NULL,
	[geboorteplaats] [varchar](30) NULL,
 CONSTRAINT [PK_Speler] PRIMARY KEY CLUSTERED 
(
	[spelerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ToernooiInschrijven].[Toernooi]    Script Date: 30/05/2021 13:20:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ToernooiInschrijven].[Toernooi](
	[toernooiId] [int] IDENTITY(1,1) NOT NULL,
	[toernooiNaam] [varchar](15) NOT NULL,
	[datum] [date] NOT NULL,
	[checkInuur] [time](7) NOT NULL,
	[startuur] [time](7) NOT NULL,
	[gameModeId] [int] NOT NULL,
 CONSTRAINT [PK_Toernooi] PRIMARY KEY CLUSTERED 
(
	[toernooiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [ToernooiInschrijven].[ToernooiPrijs]    Script Date: 30/05/2021 13:20:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ToernooiInschrijven].[ToernooiPrijs](
	[toernooiPrijsId] [int] IDENTITY(1,1) NOT NULL,
	[prijsId] [int] NOT NULL,
	[toernooiId] [int] NOT NULL,
 CONSTRAINT [PK_ToernooiPrijs] PRIMARY KEY CLUSTERED 
(
	[toernooiPrijsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [ToernooiInschrijven].[GameMode] ON 

INSERT [ToernooiInschrijven].[GameMode] ([gameModeId], [gameModeNaam]) VALUES (1, N'Rocket League')
INSERT [ToernooiInschrijven].[GameMode] ([gameModeId], [gameModeNaam]) VALUES (2, N'Fortnite')
INSERT [ToernooiInschrijven].[GameMode] ([gameModeId], [gameModeNaam]) VALUES (3, N'League of legends')
INSERT [ToernooiInschrijven].[GameMode] ([gameModeId], [gameModeNaam]) VALUES (4, N'Valorant')
INSERT [ToernooiInschrijven].[GameMode] ([gameModeId], [gameModeNaam]) VALUES (5, N'Counter-strike')
INSERT [ToernooiInschrijven].[GameMode] ([gameModeId], [gameModeNaam]) VALUES (6, N'Dota 2')
INSERT [ToernooiInschrijven].[GameMode] ([gameModeId], [gameModeNaam]) VALUES (7, N'Call of duty: Warzone')
INSERT [ToernooiInschrijven].[GameMode] ([gameModeId], [gameModeNaam]) VALUES (8, N'Apex legends')
SET IDENTITY_INSERT [ToernooiInschrijven].[GameMode] OFF
GO
SET IDENTITY_INSERT [ToernooiInschrijven].[GameModeRank] ON 

INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (1, 1, 2)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (2, 2, 2)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (3, 3, 2)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (4, 4, 2)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (5, 5, 2)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (6, 6, 2)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (7, 7, 2)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (8, 8, 2)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (9, 9, 2)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (10, 10, 2)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (11, 11, 2)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (12, 12, 1)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (13, 13, 1)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (14, 14, 1)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (15, 15, 1)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (16, 16, 1)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (17, 17, 1)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (18, 18, 1)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (19, 19, 1)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (20, 20, 1)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (21, 21, 3)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (22, 22, 3)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (23, 23, 3)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (24, 24, 3)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (25, 25, 3)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (26, 26, 3)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (27, 27, 3)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (28, 28, 3)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (29, 29, 3)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (30, 30, 3)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (31, 31, 4)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (32, 32, 4)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (33, 33, 4)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (34, 34, 4)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (35, 35, 4)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (36, 36, 4)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (37, 37, 4)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (38, 38, 4)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (39, 39, 4)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (40, 40, 5)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (41, 41, 5)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (42, 42, 5)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (43, 43, 5)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (44, 44, 5)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (45, 45, 5)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (46, 46, 5)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (47, 47, 5)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (48, 48, 5)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (49, 49, 5)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (50, 50, 5)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (51, 51, 5)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (52, 52, 5)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (53, 53, 5)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (54, 54, 5)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (55, 55, 5)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (56, 56, 5)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (57, 57, 5)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (58, 58, 5)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (59, 59, 6)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (60, 60, 6)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (61, 61, 6)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (62, 62, 6)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (63, 63, 6)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (64, 64, 6)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (65, 65, 6)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (66, 66, 6)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (67, 67, 6)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (68, 68, 7)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (69, 69, 8)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (70, 70, 8)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (71, 71, 8)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (72, 72, 8)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (73, 73, 8)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (74, 74, 8)
INSERT [ToernooiInschrijven].[GameModeRank] ([gameModeRankId], [rankId], [gameModeId]) VALUES (75, 75, 8)
SET IDENTITY_INSERT [ToernooiInschrijven].[GameModeRank] OFF
GO
SET IDENTITY_INSERT [ToernooiInschrijven].[Prijs] ON 

INSERT [ToernooiInschrijven].[Prijs] ([prijsId], [spelerId], [prijsPot]) VALUES (1, 1, 10000)
INSERT [ToernooiInschrijven].[Prijs] ([prijsId], [spelerId], [prijsPot]) VALUES (2, 2, 8000)
INSERT [ToernooiInschrijven].[Prijs] ([prijsId], [spelerId], [prijsPot]) VALUES (3, 3, 6000)
INSERT [ToernooiInschrijven].[Prijs] ([prijsId], [spelerId], [prijsPot]) VALUES (4, 4, 4000)
INSERT [ToernooiInschrijven].[Prijs] ([prijsId], [spelerId], [prijsPot]) VALUES (5, 5, 2000)
SET IDENTITY_INSERT [ToernooiInschrijven].[Prijs] OFF
GO
SET IDENTITY_INSERT [ToernooiInschrijven].[Rank] ON 

INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (1, N'Unranked')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (2, N'Open League: Division I')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (3, N'Open League: Division II')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (4, N'Open League: Division III')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (5, N'Open League: Division IV')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (6, N'Contender League: Division I')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (7, N'Contender League: Division II')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (8, N'Contender League: Division III')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (9, N'Champion League: Division I')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (10, N'Champion League: Division II')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (11, N'Champion League: Division III')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (12, N'Unranked')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (13, N'Bronze')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (14, N'Silver')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (15, N'Gold')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (16, N'Platinum')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (17, N'Diamond')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (18, N'Champion')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (19, N'Grand Champion')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (20, N'Supersonic Legend')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (21, N'Unranked')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (22, N'Iron')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (23, N'Bronze')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (24, N'Silver')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (25, N'Gold')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (26, N'Platinum')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (27, N'Diamond')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (28, N'Master')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (29, N'Grandmaster')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (30, N'Challenger')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (31, N'Unranked')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (32, N'Iron')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (33, N'Bronze')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (34, N'Silver')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (35, N'Gold')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (36, N'Platinum')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (37, N'Diamond')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (38, N'Immortal')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (39, N'Radiant')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (40, N'Unranked')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (41, N'Silver I')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (42, N'Silver II')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (43, N'Silver III')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (44, N'Silver IV')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (45, N'Silver Elite')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (46, N'Silver Elite Master')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (47, N'Gold Nova I')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (48, N'Gold Nova II')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (49, N'Gold Nova III')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (50, N'Gold Nova Master')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (51, N'Master Guardian I')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (52, N'Master Guardian II')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (53, N'Master Guardian Elite')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (54, N'Distinguished Master Guardian')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (55, N'Legendary Eagle')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (56, N'Legendary Eagle Master')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (57, N'Supreme Master First Class')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (58, N'Global Elite')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (59, N'Unranked')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (60, N'Herald')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (61, N'Guardian')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (62, N'Crusader')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (63, N'Archon')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (64, N'Legend')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (65, N'Ancient')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (66, N'Divine')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (67, N'Immortal')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (68, N'No ranked system')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (69, N'Unranked')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (70, N'Bronze')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (71, N'Silver')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (72, N'Gold')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (73, N'Platinum')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (74, N'Diamond')
INSERT [ToernooiInschrijven].[Rank] ([rankId], [rankNaam]) VALUES (75, N'Apex Predator')
SET IDENTITY_INSERT [ToernooiInschrijven].[Rank] OFF
GO
SET IDENTITY_INSERT [ToernooiInschrijven].[Speler] ON 

INSERT [ToernooiInschrijven].[Speler] ([spelerId], [voornaam], [achternaam], [nicknaam], [wachtwoord], [email], [geboortedatum], [geboorteplaats]) VALUES (1, N'Joris', N'DeRidder', N'Jeuris42', N'****************', N'joris.42@hotmail.com', CAST(N'1997-02-21' AS Date), N'Belgium')
INSERT [ToernooiInschrijven].[Speler] ([spelerId], [voornaam], [achternaam], [nicknaam], [wachtwoord], [email], [geboortedatum], [geboorteplaats]) VALUES (2, N'Dennis', N'Luyten', N'Kiiro', N'******', N'DennisLuten@outlook.be', CAST(N'1999-05-12' AS Date), N'Belgium')
INSERT [ToernooiInschrijven].[Speler] ([spelerId], [voornaam], [achternaam], [nicknaam], [wachtwoord], [email], [geboortedatum], [geboorteplaats]) VALUES (3, N'Jan', N'Ghesquire', N'Por0', N'********', N'JanGhesquire@telenet.com', CAST(N'1996-03-18' AS Date), N'Spain')
INSERT [ToernooiInschrijven].[Speler] ([spelerId], [voornaam], [achternaam], [nicknaam], [wachtwoord], [email], [geboortedatum], [geboorteplaats]) VALUES (4, N'Alec', N'VanOosterwijck', N'Tankzwaluw', N'******', N'DenAlec@outlook.be', CAST(N'2000-02-04' AS Date), N'Belgium')
INSERT [ToernooiInschrijven].[Speler] ([spelerId], [voornaam], [achternaam], [nicknaam], [wachtwoord], [email], [geboortedatum], [geboorteplaats]) VALUES (5, N'Jelle', N'Vermeulen', N'JayEnvy', N'********', N'JayEnvy@hotmail.be', CAST(N'1994-07-12' AS Date), N'England')
SET IDENTITY_INSERT [ToernooiInschrijven].[Speler] OFF
GO
SET IDENTITY_INSERT [ToernooiInschrijven].[Toernooi] ON 

INSERT [ToernooiInschrijven].[Toernooi] ([toernooiId], [toernooiNaam], [datum], [checkInuur], [startuur], [gameModeId]) VALUES (1, N'RL_3V3_1000', CAST(N'2021-05-05' AS Date), CAST(N'20:00:00' AS Time), CAST(N'20:30:00' AS Time), 1)
INSERT [ToernooiInschrijven].[Toernooi] ([toernooiId], [toernooiNaam], [datum], [checkInuur], [startuur], [gameModeId]) VALUES (2, N'FN_1V1_2000', CAST(N'2021-06-05' AS Date), CAST(N'21:00:00' AS Time), CAST(N'21:30:00' AS Time), 2)
INSERT [ToernooiInschrijven].[Toernooi] ([toernooiId], [toernooiNaam], [datum], [checkInuur], [startuur], [gameModeId]) VALUES (3, N'LOL_5V5_3000', CAST(N'2021-07-05' AS Date), CAST(N'20:00:00' AS Time), CAST(N'20:30:00' AS Time), 3)
INSERT [ToernooiInschrijven].[Toernooi] ([toernooiId], [toernooiNaam], [datum], [checkInuur], [startuur], [gameModeId]) VALUES (4, N'VA_5V5_4000', CAST(N'2021-08-05' AS Date), CAST(N'21:00:00' AS Time), CAST(N'21:30:00' AS Time), 4)
INSERT [ToernooiInschrijven].[Toernooi] ([toernooiId], [toernooiNaam], [datum], [checkInuur], [startuur], [gameModeId]) VALUES (5, N'CSGO_5V5_5000', CAST(N'2021-08-05' AS Date), CAST(N'21:00:00' AS Time), CAST(N'21:30:00' AS Time), 5)
INSERT [ToernooiInschrijven].[Toernooi] ([toernooiId], [toernooiNaam], [datum], [checkInuur], [startuur], [gameModeId]) VALUES (6, N'DO_5V5_6000', CAST(N'2021-09-05' AS Date), CAST(N'21:00:00' AS Time), CAST(N'21:30:00' AS Time), 6)
INSERT [ToernooiInschrijven].[Toernooi] ([toernooiId], [toernooiNaam], [datum], [checkInuur], [startuur], [gameModeId]) VALUES (7, N'WZ_5V5_7000', CAST(N'2021-10-05' AS Date), CAST(N'21:00:00' AS Time), CAST(N'21:30:00' AS Time), 7)
INSERT [ToernooiInschrijven].[Toernooi] ([toernooiId], [toernooiNaam], [datum], [checkInuur], [startuur], [gameModeId]) VALUES (8, N'AL_3V3_8000', CAST(N'2021-11-05' AS Date), CAST(N'21:00:00' AS Time), CAST(N'21:30:00' AS Time), 8)
INSERT [ToernooiInschrijven].[Toernooi] ([toernooiId], [toernooiNaam], [datum], [checkInuur], [startuur], [gameModeId]) VALUES (9, N'RL_3V3_1231', CAST(N'2021-05-22' AS Date), CAST(N'20:30:00' AS Time), CAST(N'21:00:00' AS Time), 1)
INSERT [ToernooiInschrijven].[Toernooi] ([toernooiId], [toernooiNaam], [datum], [checkInuur], [startuur], [gameModeId]) VALUES (10, N'FN_3V3_2514', CAST(N'2021-06-22' AS Date), CAST(N'21:00:00' AS Time), CAST(N'21:30:00' AS Time), 2)
INSERT [ToernooiInschrijven].[Toernooi] ([toernooiId], [toernooiNaam], [datum], [checkInuur], [startuur], [gameModeId]) VALUES (11, N'LOL_5V5_3143', CAST(N'2021-07-22' AS Date), CAST(N'20:00:00' AS Time), CAST(N'20:30:00' AS Time), 3)
INSERT [ToernooiInschrijven].[Toernooi] ([toernooiId], [toernooiNaam], [datum], [checkInuur], [startuur], [gameModeId]) VALUES (12, N'VA_5V5_4412', CAST(N'2021-08-24' AS Date), CAST(N'20:00:00' AS Time), CAST(N'20:30:00' AS Time), 4)
INSERT [ToernooiInschrijven].[Toernooi] ([toernooiId], [toernooiNaam], [datum], [checkInuur], [startuur], [gameModeId]) VALUES (13, N'CSGO_5V5_5531', CAST(N'2021-08-22' AS Date), CAST(N'21:00:00' AS Time), CAST(N'21:30:00' AS Time), 5)
INSERT [ToernooiInschrijven].[Toernooi] ([toernooiId], [toernooiNaam], [datum], [checkInuur], [startuur], [gameModeId]) VALUES (14, N'DO_5V5_6532', CAST(N'2021-09-22' AS Date), CAST(N'21:00:00' AS Time), CAST(N'21:30:00' AS Time), 6)
INSERT [ToernooiInschrijven].[Toernooi] ([toernooiId], [toernooiNaam], [datum], [checkInuur], [startuur], [gameModeId]) VALUES (15, N'WZ_5V5_7435', CAST(N'2021-10-22' AS Date), CAST(N'21:00:00' AS Time), CAST(N'21:30:00' AS Time), 7)
INSERT [ToernooiInschrijven].[Toernooi] ([toernooiId], [toernooiNaam], [datum], [checkInuur], [startuur], [gameModeId]) VALUES (16, N'AL_3V3_8343', CAST(N'2021-11-25' AS Date), CAST(N'21:00:00' AS Time), CAST(N'21:30:00' AS Time), 8)
INSERT [ToernooiInschrijven].[Toernooi] ([toernooiId], [toernooiNaam], [datum], [checkInuur], [startuur], [gameModeId]) VALUES (17, N'RL_3V3_1353', CAST(N'2021-05-15' AS Date), CAST(N'21:30:00' AS Time), CAST(N'22:00:00' AS Time), 1)
INSERT [ToernooiInschrijven].[Toernooi] ([toernooiId], [toernooiNaam], [datum], [checkInuur], [startuur], [gameModeId]) VALUES (18, N'FN_3V3_2533', CAST(N'2021-06-15' AS Date), CAST(N'22:00:00' AS Time), CAST(N'22:30:00' AS Time), 2)
INSERT [ToernooiInschrijven].[Toernooi] ([toernooiId], [toernooiNaam], [datum], [checkInuur], [startuur], [gameModeId]) VALUES (19, N'LOL_5V5_3432', CAST(N'2021-07-15' AS Date), CAST(N'20:00:00' AS Time), CAST(N'20:30:00' AS Time), 3)
INSERT [ToernooiInschrijven].[Toernooi] ([toernooiId], [toernooiNaam], [datum], [checkInuur], [startuur], [gameModeId]) VALUES (20, N'VA_5V5_4532', CAST(N'2021-08-15' AS Date), CAST(N'21:00:00' AS Time), CAST(N'21:30:00' AS Time), 4)
INSERT [ToernooiInschrijven].[Toernooi] ([toernooiId], [toernooiNaam], [datum], [checkInuur], [startuur], [gameModeId]) VALUES (21, N'CSGO_5V5_5544', CAST(N'2021-08-15' AS Date), CAST(N'20:00:00' AS Time), CAST(N'20:30:00' AS Time), 5)
INSERT [ToernooiInschrijven].[Toernooi] ([toernooiId], [toernooiNaam], [datum], [checkInuur], [startuur], [gameModeId]) VALUES (22, N'DO_5V5_6464', CAST(N'2021-09-15' AS Date), CAST(N'20:00:00' AS Time), CAST(N'20:30:00' AS Time), 6)
INSERT [ToernooiInschrijven].[Toernooi] ([toernooiId], [toernooiNaam], [datum], [checkInuur], [startuur], [gameModeId]) VALUES (23, N'WZ_5V5_7123', CAST(N'2021-10-15' AS Date), CAST(N'18:00:00' AS Time), CAST(N'18:30:00' AS Time), 7)
INSERT [ToernooiInschrijven].[Toernooi] ([toernooiId], [toernooiNaam], [datum], [checkInuur], [startuur], [gameModeId]) VALUES (24, N'AL_3V3_8766', CAST(N'2021-11-15' AS Date), CAST(N'19:00:00' AS Time), CAST(N'19:30:00' AS Time), 8)
INSERT [ToernooiInschrijven].[Toernooi] ([toernooiId], [toernooiNaam], [datum], [checkInuur], [startuur], [gameModeId]) VALUES (25, N'RL_3V3_1533', CAST(N'2021-06-20' AS Date), CAST(N'19:30:00' AS Time), CAST(N'20:00:00' AS Time), 1)
INSERT [ToernooiInschrijven].[Toernooi] ([toernooiId], [toernooiNaam], [datum], [checkInuur], [startuur], [gameModeId]) VALUES (26, N'FN_3V3_2767', CAST(N'2021-07-20' AS Date), CAST(N'18:00:00' AS Time), CAST(N'18:30:00' AS Time), 2)
INSERT [ToernooiInschrijven].[Toernooi] ([toernooiId], [toernooiNaam], [datum], [checkInuur], [startuur], [gameModeId]) VALUES (27, N'LOL_5V5_3132', CAST(N'2021-08-20' AS Date), CAST(N'20:00:00' AS Time), CAST(N'20:30:00' AS Time), 3)
INSERT [ToernooiInschrijven].[Toernooi] ([toernooiId], [toernooiNaam], [datum], [checkInuur], [startuur], [gameModeId]) VALUES (29, N'CSGO_5V5_5987', CAST(N'2021-10-15' AS Date), CAST(N'21:00:00' AS Time), CAST(N'21:30:00' AS Time), 5)
INSERT [ToernooiInschrijven].[Toernooi] ([toernooiId], [toernooiNaam], [datum], [checkInuur], [startuur], [gameModeId]) VALUES (30, N'DO_5V5_6135', CAST(N'2021-11-20' AS Date), CAST(N'20:00:00' AS Time), CAST(N'20:30:00' AS Time), 6)
INSERT [ToernooiInschrijven].[Toernooi] ([toernooiId], [toernooiNaam], [datum], [checkInuur], [startuur], [gameModeId]) VALUES (31, N'WZ_5V5_7865', CAST(N'2021-12-20' AS Date), CAST(N'18:00:00' AS Time), CAST(N'18:30:00' AS Time), 7)
INSERT [ToernooiInschrijven].[Toernooi] ([toernooiId], [toernooiNaam], [datum], [checkInuur], [startuur], [gameModeId]) VALUES (32, N'AL_3V3_8642', CAST(N'2021-12-25' AS Date), CAST(N'19:00:00' AS Time), CAST(N'19:30:00' AS Time), 8)
INSERT [ToernooiInschrijven].[Toernooi] ([toernooiId], [toernooiNaam], [datum], [checkInuur], [startuur], [gameModeId]) VALUES (33, N'VA_5V5_4533', CAST(N'2021-05-12' AS Date), CAST(N'20:00:00' AS Time), CAST(N'20:30:00' AS Time), 4)
SET IDENTITY_INSERT [ToernooiInschrijven].[Toernooi] OFF
GO
SET IDENTITY_INSERT [ToernooiInschrijven].[ToernooiPrijs] ON 

INSERT [ToernooiInschrijven].[ToernooiPrijs] ([toernooiPrijsId], [prijsId], [toernooiId]) VALUES (1, 1, 1)
INSERT [ToernooiInschrijven].[ToernooiPrijs] ([toernooiPrijsId], [prijsId], [toernooiId]) VALUES (2, 2, 1)
INSERT [ToernooiInschrijven].[ToernooiPrijs] ([toernooiPrijsId], [prijsId], [toernooiId]) VALUES (3, 3, 1)
INSERT [ToernooiInschrijven].[ToernooiPrijs] ([toernooiPrijsId], [prijsId], [toernooiId]) VALUES (4, 1, 2)
INSERT [ToernooiInschrijven].[ToernooiPrijs] ([toernooiPrijsId], [prijsId], [toernooiId]) VALUES (5, 2, 2)
INSERT [ToernooiInschrijven].[ToernooiPrijs] ([toernooiPrijsId], [prijsId], [toernooiId]) VALUES (6, 3, 2)
INSERT [ToernooiInschrijven].[ToernooiPrijs] ([toernooiPrijsId], [prijsId], [toernooiId]) VALUES (7, 1, 3)
INSERT [ToernooiInschrijven].[ToernooiPrijs] ([toernooiPrijsId], [prijsId], [toernooiId]) VALUES (8, 2, 3)
INSERT [ToernooiInschrijven].[ToernooiPrijs] ([toernooiPrijsId], [prijsId], [toernooiId]) VALUES (9, 3, 3)
INSERT [ToernooiInschrijven].[ToernooiPrijs] ([toernooiPrijsId], [prijsId], [toernooiId]) VALUES (10, 1, 4)
INSERT [ToernooiInschrijven].[ToernooiPrijs] ([toernooiPrijsId], [prijsId], [toernooiId]) VALUES (11, 2, 4)
INSERT [ToernooiInschrijven].[ToernooiPrijs] ([toernooiPrijsId], [prijsId], [toernooiId]) VALUES (12, 3, 4)
INSERT [ToernooiInschrijven].[ToernooiPrijs] ([toernooiPrijsId], [prijsId], [toernooiId]) VALUES (13, 1, 5)
INSERT [ToernooiInschrijven].[ToernooiPrijs] ([toernooiPrijsId], [prijsId], [toernooiId]) VALUES (14, 2, 5)
INSERT [ToernooiInschrijven].[ToernooiPrijs] ([toernooiPrijsId], [prijsId], [toernooiId]) VALUES (15, 3, 5)
INSERT [ToernooiInschrijven].[ToernooiPrijs] ([toernooiPrijsId], [prijsId], [toernooiId]) VALUES (16, 1, 11)
INSERT [ToernooiInschrijven].[ToernooiPrijs] ([toernooiPrijsId], [prijsId], [toernooiId]) VALUES (17, 1, 12)
INSERT [ToernooiInschrijven].[ToernooiPrijs] ([toernooiPrijsId], [prijsId], [toernooiId]) VALUES (18, 1, 13)
INSERT [ToernooiInschrijven].[ToernooiPrijs] ([toernooiPrijsId], [prijsId], [toernooiId]) VALUES (19, 1, 14)
INSERT [ToernooiInschrijven].[ToernooiPrijs] ([toernooiPrijsId], [prijsId], [toernooiId]) VALUES (20, 1, 15)
INSERT [ToernooiInschrijven].[ToernooiPrijs] ([toernooiPrijsId], [prijsId], [toernooiId]) VALUES (21, 1, 16)
INSERT [ToernooiInschrijven].[ToernooiPrijs] ([toernooiPrijsId], [prijsId], [toernooiId]) VALUES (22, 1, 17)
INSERT [ToernooiInschrijven].[ToernooiPrijs] ([toernooiPrijsId], [prijsId], [toernooiId]) VALUES (23, 1, 18)
INSERT [ToernooiInschrijven].[ToernooiPrijs] ([toernooiPrijsId], [prijsId], [toernooiId]) VALUES (24, 1, 19)
INSERT [ToernooiInschrijven].[ToernooiPrijs] ([toernooiPrijsId], [prijsId], [toernooiId]) VALUES (25, 1, 20)
INSERT [ToernooiInschrijven].[ToernooiPrijs] ([toernooiPrijsId], [prijsId], [toernooiId]) VALUES (26, 1, 21)
INSERT [ToernooiInschrijven].[ToernooiPrijs] ([toernooiPrijsId], [prijsId], [toernooiId]) VALUES (27, 1, 22)
INSERT [ToernooiInschrijven].[ToernooiPrijs] ([toernooiPrijsId], [prijsId], [toernooiId]) VALUES (28, 1, 23)
INSERT [ToernooiInschrijven].[ToernooiPrijs] ([toernooiPrijsId], [prijsId], [toernooiId]) VALUES (29, 1, 24)
INSERT [ToernooiInschrijven].[ToernooiPrijs] ([toernooiPrijsId], [prijsId], [toernooiId]) VALUES (30, 1, 25)
INSERT [ToernooiInschrijven].[ToernooiPrijs] ([toernooiPrijsId], [prijsId], [toernooiId]) VALUES (31, 1, 26)
INSERT [ToernooiInschrijven].[ToernooiPrijs] ([toernooiPrijsId], [prijsId], [toernooiId]) VALUES (32, 1, 27)
INSERT [ToernooiInschrijven].[ToernooiPrijs] ([toernooiPrijsId], [prijsId], [toernooiId]) VALUES (34, 1, 29)
INSERT [ToernooiInschrijven].[ToernooiPrijs] ([toernooiPrijsId], [prijsId], [toernooiId]) VALUES (35, 1, 30)
INSERT [ToernooiInschrijven].[ToernooiPrijs] ([toernooiPrijsId], [prijsId], [toernooiId]) VALUES (36, 1, 31)
SET IDENTITY_INSERT [ToernooiInschrijven].[ToernooiPrijs] OFF
GO
ALTER TABLE [ToernooiInschrijven].[GameModeRank]  WITH CHECK ADD  CONSTRAINT [FK1_GameModeRank_Rank] FOREIGN KEY([rankId])
REFERENCES [ToernooiInschrijven].[Rank] ([rankId])
GO
ALTER TABLE [ToernooiInschrijven].[GameModeRank] CHECK CONSTRAINT [FK1_GameModeRank_Rank]
GO
ALTER TABLE [ToernooiInschrijven].[GameModeRank]  WITH CHECK ADD  CONSTRAINT [FK2_GameModeRank_GameMode] FOREIGN KEY([gameModeId])
REFERENCES [ToernooiInschrijven].[GameMode] ([gameModeId])
GO
ALTER TABLE [ToernooiInschrijven].[GameModeRank] CHECK CONSTRAINT [FK2_GameModeRank_GameMode]
GO
ALTER TABLE [ToernooiInschrijven].[Prijs]  WITH CHECK ADD  CONSTRAINT [FK3_Prijs_Speler] FOREIGN KEY([prijsId])
REFERENCES [ToernooiInschrijven].[Speler] ([spelerId])
GO
ALTER TABLE [ToernooiInschrijven].[Prijs] CHECK CONSTRAINT [FK3_Prijs_Speler]
GO
ALTER TABLE [ToernooiInschrijven].[Toernooi]  WITH CHECK ADD  CONSTRAINT [FK4_Toernooi_GameMode] FOREIGN KEY([gameModeId])
REFERENCES [ToernooiInschrijven].[GameMode] ([gameModeId])
GO
ALTER TABLE [ToernooiInschrijven].[Toernooi] CHECK CONSTRAINT [FK4_Toernooi_GameMode]
GO
ALTER TABLE [ToernooiInschrijven].[ToernooiPrijs]  WITH CHECK ADD  CONSTRAINT [FK5_ToernooiPrijs_Toernooi] FOREIGN KEY([toernooiId])
REFERENCES [ToernooiInschrijven].[Toernooi] ([toernooiId])
ON DELETE CASCADE
GO
ALTER TABLE [ToernooiInschrijven].[ToernooiPrijs] CHECK CONSTRAINT [FK5_ToernooiPrijs_Toernooi]
GO
ALTER TABLE [ToernooiInschrijven].[ToernooiPrijs]  WITH CHECK ADD  CONSTRAINT [FK6_ToernooiPrijs_Prijs] FOREIGN KEY([prijsId])
REFERENCES [ToernooiInschrijven].[Prijs] ([prijsId])
GO
ALTER TABLE [ToernooiInschrijven].[ToernooiPrijs] CHECK CONSTRAINT [FK6_ToernooiPrijs_Prijs]
GO
USE [master]
GO
ALTER DATABASE [DBToernooi] SET  READ_WRITE 
GO
