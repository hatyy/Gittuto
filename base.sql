USE [master]
GO
/****** Object:  Database [Services-db2]    Script Date: 19/06/2020 10:53:21 ******/
CREATE DATABASE [Services-db2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Services-db2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Services-db2.mdf' , SIZE = 176320KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Services-db2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Services-db2_log.ldf' , SIZE = 39936KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Services-db2] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Services-db2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Services-db2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Services-db2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Services-db2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Services-db2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Services-db2] SET ARITHABORT OFF 
GO
ALTER DATABASE [Services-db2] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Services-db2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Services-db2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Services-db2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Services-db2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Services-db2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Services-db2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Services-db2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Services-db2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Services-db2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Services-db2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Services-db2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Services-db2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Services-db2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Services-db2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Services-db2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Services-db2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Services-db2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Services-db2] SET  MULTI_USER 
GO
ALTER DATABASE [Services-db2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Services-db2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Services-db2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Services-db2] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Services-db2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Services-db2] SET QUERY_STORE = OFF
GO
USE [Services-db2]
GO
/****** Object:  User [sidy]    Script Date: 19/06/2020 10:53:22 ******/
CREATE USER [sidy] FOR LOGIN [sidy] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [NT SERVICE\MSOLAP$SIDYAHMETSSAS]    Script Date: 19/06/2020 10:53:22 ******/
CREATE USER [NT SERVICE\MSOLAP$SIDYAHMETSSAS] FOR LOGIN [NT SERVICE\MSOLAP$SIDYAHMETSSAS] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [sidy]
GO
ALTER ROLE [db_owner] ADD MEMBER [NT SERVICE\MSOLAP$SIDYAHMETSSAS]
GO
/****** Object:  Schema [m2ss]    Script Date: 19/06/2020 10:53:22 ******/
CREATE SCHEMA [m2ss]
GO
/****** Object:  Schema [mydb]    Script Date: 19/06/2020 10:53:22 ******/
CREATE SCHEMA [mydb]
GO
/****** Object:  Table [dbo].[Bad Data]    Script Date: 19/06/2020 10:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bad Data](
	[SALESID] [float] NULL,
	[YEAR] [float] NULL,
	[Month] [nvarchar](255) NULL,
	[WEEK] [nvarchar](255) NULL,
	[N° POS] [nvarchar](255) NULL,
	[POS NAME] [nvarchar](255) NULL,
	[CLASS] [nvarchar](255) NULL,
	[Commercial] [nvarchar](255) NULL,
	[ADRESS] [nvarchar](255) NULL,
	[MARQUE] [nvarchar](255) NULL,
	[SEGMENT] [nvarchar](255) NULL,
	[MODELES] [nvarchar](255) NULL,
	[CODE] [nvarchar](255) NULL,
	[QUANTITE VENDUE] [float] NULL,
	[PRIX D'ACHAT] [float] NULL,
	[PRIX DE VENTE] [float] NULL,
	[SOURCE D'APPRO] [nvarchar](255) NULL,
	[STOCK DISPONIBLE] [nvarchar](255) NULL,
	[COMMANDE] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bad_sales_campagne]    Script Date: 19/06/2020 10:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bad_sales_campagne](
	[YEAR] [nvarchar](10) NULL,
	[Month] [nvarchar](255) NULL,
	[WEEK] [nvarchar](255) NULL,
	[Campagne] [nvarchar](255) NULL,
	[PROMOTER] [nvarchar](255) NULL,
	[ADRESS] [nvarchar](255) NULL,
	[MARQUE] [nvarchar](255) NULL,
	[SEGMENT] [nvarchar](255) NULL,
	[MODELES] [nvarchar](255) NULL,
	[CODE] [nvarchar](255) NULL,
	[QUANTITE VENDUE] [float] NULL,
	[PRIX D'ACHAT] [float] NULL,
	[PRIX DE VENTE] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Campagne]    Script Date: 19/06/2020 10:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Campagne](
	[idCAMPAGNE] [int] IDENTITY(1,1) NOT NULL,
	[PERIODE] [varchar](100) NULL,
	[CAMPAGNE] [varchar](1000) NULL,
	[LIEU_CAMPAGNE] [varchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[idCAMPAGNE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[God_Campagne_Data]    Script Date: 19/06/2020 10:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[God_Campagne_Data](
	[YEAR] [varchar](10) NULL,
	[MONTH] [varchar](10) NULL,
	[WEEK] [varchar](10) NULL,
	[CAMPAGNE] [varchar](10) NULL,
	[PROMOTTER] [varchar](10) NULL,
	[MARQUE] [varchar](10) NULL,
	[CODE] [varchar](10) NULL,
	[SEGMENT] [varchar](10) NULL,
	[ADRESS] [nvarchar](255) NULL,
	[QUANTITE VENDUE] [int] NULL,
	[PRIX D'ACHAT] [int] NULL,
	[PRIX DE VENTE] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[God_Sales_Data]    Script Date: 19/06/2020 10:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[God_Sales_Data](
	[SALESID] [float] NULL,
	[YEAR] [float] NULL,
	[Month] [nvarchar](255) NULL,
	[WEEK] [nvarchar](255) NULL,
	[N° POS] [nvarchar](255) NULL,
	[POS NAME] [nvarchar](255) NULL,
	[CLASS] [nvarchar](255) NULL,
	[Commercial] [nvarchar](255) NULL,
	[ADRESS] [nvarchar](255) NULL,
	[MARQUE] [nvarchar](255) NULL,
	[SEGMENT] [nvarchar](255) NULL,
	[MODELES] [nvarchar](255) NULL,
	[CODE] [nvarchar](255) NULL,
	[QUANTITE VENDUE] [int] NULL,
	[PRIX D'ACHAT] [int] NULL,
	[PRIX DE VENTE] [int] NULL,
	[SOURCE D'APPRO] [nvarchar](255) NULL,
	[STOCK DISPONIBLE] [nvarchar](255) NULL,
	[COMMANDE] [nvarchar](255) NULL,
	[Port] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NO_IBPORTABLE]    Script Date: 19/06/2020 10:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NO_IBPORTABLE](
	[SALESID] [float] NULL,
	[YEAR] [float] NULL,
	[Month] [nvarchar](255) NULL,
	[WEEK] [nvarchar](255) NULL,
	[N° POS] [nvarchar](255) NULL,
	[POS NAME] [nvarchar](255) NULL,
	[CLASS] [nvarchar](255) NULL,
	[Commercial] [nvarchar](255) NULL,
	[ADRESS] [nvarchar](255) NULL,
	[MARQUE] [nvarchar](255) NULL,
	[SEGMENT] [nvarchar](255) NULL,
	[MODELES] [nvarchar](255) NULL,
	[CODE] [nvarchar](255) NULL,
	[QUANTITE VENDUE] [int] NULL,
	[PRIX D'ACHAT] [int] NULL,
	[PRIX DE VENTE] [int] NULL,
	[SOURCE D'APPRO] [nvarchar](255) NULL,
	[STOCK DISPONIBLE] [nvarchar](255) NULL,
	[COMMANDE] [nvarchar](255) NULL,
	[Port] [nvarchar](255) NULL,
	[idPSO] [int] NULL,
	[idMARQUE] [int] NULL,
	[idSEGMENT] [int] NULL,
	[idCOMMERCIAL] [int] NULL,
	[D_Y] [nvarchar](10) NULL,
	[PORT_NEW] [varchar](10) NULL,
	[idDimDate] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POS_ZONE]    Script Date: 19/06/2020 10:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[POS_ZONE](
	[POS NAME] [nvarchar](255) NULL,
	[ZONE] [nvarchar](255) NULL,
	[N° POS] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROMOTTER]    Script Date: 19/06/2020 10:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROMOTTER](
	[IdPROMOTTER] [int] IDENTITY(1,1) NOT NULL,
	[PROMOTTER] [varchar](50) NOT NULL,
	[ADRESS_PROMOTTER] [varchar](250) NULL,
	[CAMPAGNE_idCAMPAGNE] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPROMOTTER] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sales_campagnes]    Script Date: 19/06/2020 10:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales_campagnes](
	[DimDate_idDate] [int] NULL,
	[MARQUE_idMARQUE] [int] NULL,
	[PORTABLE_idPORTALE] [int] NULL,
	[SEGMENT_id_SEGMENT] [int] NULL,
	[PROMOTTER_idPROMOTTER] [int] NULL,
	[QUENTITE_VENDUE] [int] NULL,
	[PRIX_ACHAT] [int] NULL,
	[PRIX_VENTE] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sales_Com_Zone]    Script Date: 19/06/2020 10:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales_Com_Zone](
	[Commercial] [nvarchar](255) NULL,
	[Zone] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SRC_Campagne]    Script Date: 19/06/2020 10:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SRC_Campagne](
	[YEAR] [int] NULL,
	[Month] [nvarchar](255) NULL,
	[WEEK] [nvarchar](255) NULL,
	[Campagne] [nvarchar](255) NULL,
	[PROMOTER] [nvarchar](255) NULL,
	[ADRESS] [nvarchar](255) NULL,
	[MARQUE] [nvarchar](255) NULL,
	[SEGMENT] [nvarchar](255) NULL,
	[MODELES] [nvarchar](255) NULL,
	[CODE] [nvarchar](255) NULL,
	[QUANTITE VENDUE] [int] NULL,
	[PRIX D'ACHAT] [int] NULL,
	[PRIX DE VENTE] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SRC_Sales Data]    Script Date: 19/06/2020 10:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SRC_Sales Data](
	[SALESID] [float] NULL,
	[YEAR] [float] NULL,
	[Month] [nvarchar](255) NULL,
	[WEEK] [nvarchar](255) NULL,
	[N° POS] [nvarchar](255) NULL,
	[POS NAME] [nvarchar](255) NULL,
	[CLASS] [nvarchar](255) NULL,
	[Commercial] [nvarchar](255) NULL,
	[ADRESS] [nvarchar](255) NULL,
	[MARQUE] [nvarchar](255) NULL,
	[SEGMENT] [nvarchar](255) NULL,
	[MODELES] [nvarchar](255) NULL,
	[CODE] [nvarchar](255) NULL,
	[QUANTITE VENDUE] [float] NULL,
	[PRIX D'ACHAT] [float] NULL,
	[PRIX DE VENTE] [float] NULL,
	[SOURCE D'APPRO] [nvarchar](255) NULL,
	[STOCK DISPONIBLE] [nvarchar](255) NULL,
	[COMMANDE] [nvarchar](255) NULL,
	[Port] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TESTFACT]    Script Date: 19/06/2020 10:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TESTFACT](
	[SALESID] [float] NULL,
	[YEAR] [float] NULL,
	[Month] [nvarchar](255) NULL,
	[WEEK] [nvarchar](255) NULL,
	[N° POS] [nvarchar](255) NULL,
	[POS NAME] [nvarchar](255) NULL,
	[CLASS] [nvarchar](255) NULL,
	[Commercial] [nvarchar](255) NULL,
	[ADRESS] [nvarchar](255) NULL,
	[MARQUE] [nvarchar](255) NULL,
	[SEGMENT] [nvarchar](255) NULL,
	[MODELES] [nvarchar](255) NULL,
	[CODE] [nvarchar](255) NULL,
	[QUANTITE VENDUE] [int] NULL,
	[PRIX D'ACHAT] [int] NULL,
	[PRIX DE VENTE] [int] NULL,
	[SOURCE D'APPRO] [nvarchar](255) NULL,
	[STOCK DISPONIBLE] [nvarchar](255) NULL,
	[COMMANDE] [nvarchar](255) NULL,
	[idPSO] [int] NULL,
	[idMARQUE] [int] NULL,
	[idSEGMENT] [int] NULL,
	[idCOMMERCIAL] [int] NULL,
	[D_Y] [nvarchar](10) NULL,
	[idDimDate] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [mydb].[commercial]    Script Date: 19/06/2020 10:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [mydb].[commercial](
	[idCOMMERCIAL] [int] IDENTITY(196,1) NOT NULL,
	[CODECOMMERCIAL] [nvarchar](45) NULL,
	[COMMERCIAL] [nvarchar](250) NULL,
	[CNI] [nvarchar](45) NULL,
	[DATE_DE_NAISS] [nvarchar](45) NULL,
	[ADRESS] [nvarchar](45) NULL,
	[zone_idZONE] [int] NOT NULL,
 CONSTRAINT [PK_commercial_idCOMMERCIAL] PRIMARY KEY CLUSTERED 
(
	[idCOMMERCIAL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [mydb].[date]    Script Date: 19/06/2020 10:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [mydb].[date](
	[idDimDate] [int] IDENTITY(1,1) NOT NULL,
	[YEAR] [nvarchar](45) NULL,
	[MONTH] [nvarchar](45) NULL,
	[WEEK] [nvarchar](45) NULL,
 CONSTRAINT [PK_date_idDimDate] PRIMARY KEY CLUSTERED 
(
	[idDimDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [mydb].[marque]    Script Date: 19/06/2020 10:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [mydb].[marque](
	[idMARQUE] [int] IDENTITY(1,1) NOT NULL,
	[MARQUE] [nvarchar](45) NULL,
 CONSTRAINT [PK_marque_idMARQUE] PRIMARY KEY CLUSTERED 
(
	[idMARQUE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [mydb].[portable]    Script Date: 19/06/2020 10:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [mydb].[portable](
	[idPORTABLE] [int] IDENTITY(1,1) NOT NULL,
	[MODELE] [nvarchar](45) NULL,
	[CODE] [nvarchar](45) NULL,
	[CODEPORT] [varchar](100) NULL,
 CONSTRAINT [PK_portable_idPORTABLE] PRIMARY KEY CLUSTERED 
(
	[idPORTABLE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [mydb].[pos]    Script Date: 19/06/2020 10:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [mydb].[pos](
	[idPSO] [int] IDENTITY(1,1) NOT NULL,
	[NPOS] [nvarchar](45) NULL,
	[NOMPOS] [nvarchar](250) NULL,
	[ADRESSE] [nvarchar](250) NULL,
	[NOMPROPRIETAIRE] [nvarchar](45) NULL,
	[NOMGERANT] [nvarchar](45) NULL,
	[CLASS] [nvarchar](45) NULL,
	[zone_idZONE] [int] NOT NULL,
 CONSTRAINT [PK_pos_idPSO] PRIMARY KEY CLUSTERED 
(
	[idPSO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [mydb].[sales]    Script Date: 19/06/2020 10:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [mydb].[sales](
	[SALESID] [int] IDENTITY(1,1) NOT NULL,
	[COMMERCIAL_idCOMMERCIAL] [int] NULL,
	[POS_idPSO] [int] NULL,
	[DATE_idDimDate] [int] NULL,
	[SEGMENT_idSEGMENT] [int] NULL,
	[MARQUE_idMARQUE] [int] NULL,
	[PORTABLE_idPORTABLE] [int] NULL,
	[QUANTITE] [int] NULL,
	[PRIX_ACHAT] [int] NULL,
	[PRIX_VENTE] [int] NULL,
	[SOURCE_APRO] [int] NULL,
	[STOCK_DISP] [int] NULL,
	[COMMANDE] [int] NULL,
 CONSTRAINT [PK_sales_SALESID] PRIMARY KEY CLUSTERED 
(
	[SALESID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [mydb].[segment]    Script Date: 19/06/2020 10:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [mydb].[segment](
	[idSEGMENT] [int] IDENTITY(1,1) NOT NULL,
	[SEGMENT] [nvarchar](45) NULL,
 CONSTRAINT [PK_segment_idSEGMENT] PRIMARY KEY CLUSTERED 
(
	[idSEGMENT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [mydb].[zone]    Script Date: 19/06/2020 10:53:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [mydb].[zone](
	[idZONE] [int] IDENTITY(4,1) NOT NULL,
	[ZONE] [nvarchar](45) NULL,
	[DELIMITATION_GEO] [nvarchar](45) NULL,
 CONSTRAINT [PK_zone_idZONE] PRIMARY KEY CLUSTERED 
(
	[idZONE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [fk_commercial_zone1_idx]    Script Date: 19/06/2020 10:53:22 ******/
CREATE NONCLUSTERED INDEX [fk_commercial_zone1_idx] ON [mydb].[commercial]
(
	[zone_idZONE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [NonClusteredIndex-20200109-120526]    Script Date: 19/06/2020 10:53:22 ******/
CREATE UNIQUE NONCLUSTERED INDEX [NonClusteredIndex-20200109-120526] ON [mydb].[commercial]
(
	[COMMERCIAL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [NonClusteredIndex-20200109-115828]    Script Date: 19/06/2020 10:53:22 ******/
CREATE UNIQUE NONCLUSTERED INDEX [NonClusteredIndex-20200109-115828] ON [mydb].[marque]
(
	[MARQUE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_pos_zone1_idx]    Script Date: 19/06/2020 10:53:22 ******/
CREATE NONCLUSTERED INDEX [fk_pos_zone1_idx] ON [mydb].[pos]
(
	[zone_idZONE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [NonClusteredIndex-20200109-161624]    Script Date: 19/06/2020 10:53:22 ******/
CREATE UNIQUE NONCLUSTERED INDEX [NonClusteredIndex-20200109-161624] ON [mydb].[pos]
(
	[NPOS] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_SALES_COMMERCIAL1_idx]    Script Date: 19/06/2020 10:53:22 ******/
CREATE NONCLUSTERED INDEX [fk_SALES_COMMERCIAL1_idx] ON [mydb].[sales]
(
	[COMMERCIAL_idCOMMERCIAL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_SALES_DATE1_idx]    Script Date: 19/06/2020 10:53:22 ******/
CREATE NONCLUSTERED INDEX [fk_SALES_DATE1_idx] ON [mydb].[sales]
(
	[DATE_idDimDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_SALES_MARQUE1_idx]    Script Date: 19/06/2020 10:53:22 ******/
CREATE NONCLUSTERED INDEX [fk_SALES_MARQUE1_idx] ON [mydb].[sales]
(
	[MARQUE_idMARQUE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_SALES_PORTABLE1_idx]    Script Date: 19/06/2020 10:53:22 ******/
CREATE NONCLUSTERED INDEX [fk_SALES_PORTABLE1_idx] ON [mydb].[sales]
(
	[PORTABLE_idPORTABLE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_SALES_POS1_idx]    Script Date: 19/06/2020 10:53:22 ******/
CREATE NONCLUSTERED INDEX [fk_SALES_POS1_idx] ON [mydb].[sales]
(
	[POS_idPSO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fk_SALES_SEGMENT1_idx]    Script Date: 19/06/2020 10:53:22 ******/
CREATE NONCLUSTERED INDEX [fk_SALES_SEGMENT1_idx] ON [mydb].[sales]
(
	[SEGMENT_idSEGMENT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [NonClusteredIndex-20200109-120231]    Script Date: 19/06/2020 10:53:22 ******/
CREATE UNIQUE NONCLUSTERED INDEX [NonClusteredIndex-20200109-120231] ON [mydb].[segment]
(
	[SEGMENT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [NonClusteredIndex-20200109-120302]    Script Date: 19/06/2020 10:53:22 ******/
CREATE UNIQUE NONCLUSTERED INDEX [NonClusteredIndex-20200109-120302] ON [mydb].[zone]
(
	[ZONE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [mydb].[commercial] ADD  DEFAULT (NULL) FOR [CODECOMMERCIAL]
GO
ALTER TABLE [mydb].[commercial] ADD  DEFAULT (NULL) FOR [COMMERCIAL]
GO
ALTER TABLE [mydb].[commercial] ADD  DEFAULT (NULL) FOR [CNI]
GO
ALTER TABLE [mydb].[commercial] ADD  DEFAULT (NULL) FOR [DATE_DE_NAISS]
GO
ALTER TABLE [mydb].[commercial] ADD  DEFAULT (NULL) FOR [ADRESS]
GO
ALTER TABLE [mydb].[date] ADD  DEFAULT (NULL) FOR [YEAR]
GO
ALTER TABLE [mydb].[date] ADD  DEFAULT (NULL) FOR [MONTH]
GO
ALTER TABLE [mydb].[date] ADD  DEFAULT (NULL) FOR [WEEK]
GO
ALTER TABLE [mydb].[marque] ADD  DEFAULT (NULL) FOR [MARQUE]
GO
ALTER TABLE [mydb].[portable] ADD  DEFAULT (NULL) FOR [MODELE]
GO
ALTER TABLE [mydb].[portable] ADD  DEFAULT (NULL) FOR [CODE]
GO
ALTER TABLE [mydb].[pos] ADD  DEFAULT (NULL) FOR [NPOS]
GO
ALTER TABLE [mydb].[pos] ADD  DEFAULT (NULL) FOR [NOMPOS]
GO
ALTER TABLE [mydb].[pos] ADD  DEFAULT (NULL) FOR [ADRESSE]
GO
ALTER TABLE [mydb].[pos] ADD  DEFAULT (NULL) FOR [NOMPROPRIETAIRE]
GO
ALTER TABLE [mydb].[pos] ADD  DEFAULT (NULL) FOR [NOMGERANT]
GO
ALTER TABLE [mydb].[pos] ADD  DEFAULT (NULL) FOR [CLASS]
GO
ALTER TABLE [mydb].[sales] ADD  DEFAULT (NULL) FOR [COMMERCIAL_idCOMMERCIAL]
GO
ALTER TABLE [mydb].[sales] ADD  DEFAULT (NULL) FOR [POS_idPSO]
GO
ALTER TABLE [mydb].[sales] ADD  DEFAULT (NULL) FOR [DATE_idDimDate]
GO
ALTER TABLE [mydb].[sales] ADD  DEFAULT (NULL) FOR [SEGMENT_idSEGMENT]
GO
ALTER TABLE [mydb].[sales] ADD  DEFAULT (NULL) FOR [MARQUE_idMARQUE]
GO
ALTER TABLE [mydb].[sales] ADD  DEFAULT (NULL) FOR [PORTABLE_idPORTABLE]
GO
ALTER TABLE [mydb].[sales] ADD  DEFAULT (NULL) FOR [QUANTITE]
GO
ALTER TABLE [mydb].[sales] ADD  DEFAULT (NULL) FOR [PRIX_ACHAT]
GO
ALTER TABLE [mydb].[sales] ADD  DEFAULT (NULL) FOR [PRIX_VENTE]
GO
ALTER TABLE [mydb].[sales] ADD  DEFAULT (NULL) FOR [SOURCE_APRO]
GO
ALTER TABLE [mydb].[sales] ADD  DEFAULT (NULL) FOR [STOCK_DISP]
GO
ALTER TABLE [mydb].[sales] ADD  DEFAULT (NULL) FOR [COMMANDE]
GO
ALTER TABLE [mydb].[segment] ADD  DEFAULT (NULL) FOR [SEGMENT]
GO
ALTER TABLE [mydb].[zone] ADD  DEFAULT (NULL) FOR [ZONE]
GO
ALTER TABLE [mydb].[zone] ADD  DEFAULT (NULL) FOR [DELIMITATION_GEO]
GO
ALTER TABLE [dbo].[PROMOTTER]  WITH CHECK ADD  CONSTRAINT [fk_campagne_promotter_id] FOREIGN KEY([CAMPAGNE_idCAMPAGNE])
REFERENCES [dbo].[Campagne] ([idCAMPAGNE])
GO
ALTER TABLE [dbo].[PROMOTTER] CHECK CONSTRAINT [fk_campagne_promotter_id]
GO
ALTER TABLE [dbo].[Sales_campagnes]  WITH CHECK ADD  CONSTRAINT [fk_DimDate_sales_campagne_id] FOREIGN KEY([DimDate_idDate])
REFERENCES [mydb].[date] ([idDimDate])
GO
ALTER TABLE [dbo].[Sales_campagnes] CHECK CONSTRAINT [fk_DimDate_sales_campagne_id]
GO
ALTER TABLE [dbo].[Sales_campagnes]  WITH CHECK ADD  CONSTRAINT [fk_Marque_sales_campagne_id] FOREIGN KEY([MARQUE_idMARQUE])
REFERENCES [mydb].[marque] ([idMARQUE])
GO
ALTER TABLE [dbo].[Sales_campagnes] CHECK CONSTRAINT [fk_Marque_sales_campagne_id]
GO
ALTER TABLE [dbo].[Sales_campagnes]  WITH CHECK ADD  CONSTRAINT [fk_Portable_sales_campagne_id] FOREIGN KEY([PORTABLE_idPORTALE])
REFERENCES [mydb].[portable] ([idPORTABLE])
GO
ALTER TABLE [dbo].[Sales_campagnes] CHECK CONSTRAINT [fk_Portable_sales_campagne_id]
GO
ALTER TABLE [dbo].[Sales_campagnes]  WITH CHECK ADD  CONSTRAINT [Promotter_sales_campagne_id] FOREIGN KEY([PROMOTTER_idPROMOTTER])
REFERENCES [dbo].[PROMOTTER] ([IdPROMOTTER])
GO
ALTER TABLE [dbo].[Sales_campagnes] CHECK CONSTRAINT [Promotter_sales_campagne_id]
GO
ALTER TABLE [dbo].[Sales_campagnes]  WITH CHECK ADD  CONSTRAINT [segment_sales_campagne_id] FOREIGN KEY([SEGMENT_id_SEGMENT])
REFERENCES [mydb].[segment] ([idSEGMENT])
GO
ALTER TABLE [dbo].[Sales_campagnes] CHECK CONSTRAINT [segment_sales_campagne_id]
GO
ALTER TABLE [mydb].[commercial]  WITH CHECK ADD  CONSTRAINT [commercial$fk_commercial_zone] FOREIGN KEY([zone_idZONE])
REFERENCES [mydb].[zone] ([idZONE])
GO
ALTER TABLE [mydb].[commercial] CHECK CONSTRAINT [commercial$fk_commercial_zone]
GO
ALTER TABLE [mydb].[pos]  WITH CHECK ADD  CONSTRAINT [pos$fk_pos_zone1] FOREIGN KEY([zone_idZONE])
REFERENCES [mydb].[zone] ([idZONE])
GO
ALTER TABLE [mydb].[pos] CHECK CONSTRAINT [pos$fk_pos_zone1]
GO
ALTER TABLE [mydb].[sales]  WITH CHECK ADD  CONSTRAINT [sales$fk_SALES_COMMERCIAL1] FOREIGN KEY([COMMERCIAL_idCOMMERCIAL])
REFERENCES [mydb].[commercial] ([idCOMMERCIAL])
GO
ALTER TABLE [mydb].[sales] CHECK CONSTRAINT [sales$fk_SALES_COMMERCIAL1]
GO
ALTER TABLE [mydb].[sales]  WITH CHECK ADD  CONSTRAINT [sales$fk_SALES_DATE1] FOREIGN KEY([DATE_idDimDate])
REFERENCES [mydb].[date] ([idDimDate])
GO
ALTER TABLE [mydb].[sales] CHECK CONSTRAINT [sales$fk_SALES_DATE1]
GO
ALTER TABLE [mydb].[sales]  WITH CHECK ADD  CONSTRAINT [sales$fk_SALES_MARQUE1] FOREIGN KEY([MARQUE_idMARQUE])
REFERENCES [mydb].[marque] ([idMARQUE])
GO
ALTER TABLE [mydb].[sales] CHECK CONSTRAINT [sales$fk_SALES_MARQUE1]
GO
ALTER TABLE [mydb].[sales]  WITH CHECK ADD  CONSTRAINT [sales$fk_SALES_PORTABLE1] FOREIGN KEY([PORTABLE_idPORTABLE])
REFERENCES [mydb].[portable] ([idPORTABLE])
GO
ALTER TABLE [mydb].[sales] CHECK CONSTRAINT [sales$fk_SALES_PORTABLE1]
GO
ALTER TABLE [mydb].[sales]  WITH CHECK ADD  CONSTRAINT [sales$fk_SALES_POS1] FOREIGN KEY([POS_idPSO])
REFERENCES [mydb].[pos] ([idPSO])
GO
ALTER TABLE [mydb].[sales] CHECK CONSTRAINT [sales$fk_SALES_POS1]
GO
ALTER TABLE [mydb].[sales]  WITH CHECK ADD  CONSTRAINT [sales$fk_SALES_SEGMENT1] FOREIGN KEY([SEGMENT_idSEGMENT])
REFERENCES [mydb].[segment] ([idSEGMENT])
GO
ALTER TABLE [mydb].[sales] CHECK CONSTRAINT [sales$fk_SALES_SEGMENT1]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'mydb.commercial' , @level0type=N'SCHEMA',@level0name=N'mydb', @level1type=N'TABLE',@level1name=N'commercial'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'mydb.`date`' , @level0type=N'SCHEMA',@level0name=N'mydb', @level1type=N'TABLE',@level1name=N'date'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'mydb.marque' , @level0type=N'SCHEMA',@level0name=N'mydb', @level1type=N'TABLE',@level1name=N'marque'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'mydb.portable' , @level0type=N'SCHEMA',@level0name=N'mydb', @level1type=N'TABLE',@level1name=N'portable'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'mydb.pos' , @level0type=N'SCHEMA',@level0name=N'mydb', @level1type=N'TABLE',@level1name=N'pos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'mydb.sales' , @level0type=N'SCHEMA',@level0name=N'mydb', @level1type=N'TABLE',@level1name=N'sales'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'mydb.segment' , @level0type=N'SCHEMA',@level0name=N'mydb', @level1type=N'TABLE',@level1name=N'segment'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_SSMA_SOURCE', @value=N'mydb.zone' , @level0type=N'SCHEMA',@level0name=N'mydb', @level1type=N'TABLE',@level1name=N'zone'
GO
USE [master]
GO
ALTER DATABASE [Services-db2] SET  READ_WRITE 
GO
