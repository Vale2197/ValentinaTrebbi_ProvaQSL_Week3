USE [master]
GO
/****** Object:  Database [NegozioDischi]    Script Date: 18/03/2022 11:55:30 ******/
CREATE DATABASE [NegozioDischi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NegozioDischi', FILENAME = N'C:\Users\vave1\NegozioDischi.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NegozioDischi_log', FILENAME = N'C:\Users\vave1\NegozioDischi_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [NegozioDischi] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NegozioDischi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NegozioDischi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NegozioDischi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NegozioDischi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NegozioDischi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NegozioDischi] SET ARITHABORT OFF 
GO
ALTER DATABASE [NegozioDischi] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [NegozioDischi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NegozioDischi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NegozioDischi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NegozioDischi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NegozioDischi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NegozioDischi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NegozioDischi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NegozioDischi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NegozioDischi] SET  ENABLE_BROKER 
GO
ALTER DATABASE [NegozioDischi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NegozioDischi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NegozioDischi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NegozioDischi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NegozioDischi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NegozioDischi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NegozioDischi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NegozioDischi] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [NegozioDischi] SET  MULTI_USER 
GO
ALTER DATABASE [NegozioDischi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NegozioDischi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NegozioDischi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NegozioDischi] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NegozioDischi] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [NegozioDischi] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [NegozioDischi] SET QUERY_STORE = OFF
GO
USE [NegozioDischi]
GO
/****** Object:  Table [dbo].[Album]    Script Date: 18/03/2022 11:55:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Album](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Titolo] [varchar](100) NULL,
	[AnnoUscita] [date] NULL,
	[CasaDiscografica] [varchar](100) NULL,
	[Genere] [varchar](100) NULL,
	[Distribuzione] [varchar](100) NULL,
	[IdBand] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Album_Brano]    Script Date: 18/03/2022 11:55:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Album_Brano](
	[IdRaccolta] [int] IDENTITY(1,1) NOT NULL,
	[IdAlbum] [int] NULL,
	[IdBrano] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRaccolta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Band]    Script Date: 18/03/2022 11:55:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Band](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](100) NULL,
	[NumeroComponenti] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brano]    Script Date: 18/03/2022 11:55:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brano](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Titolo] [varchar](100) NULL,
	[DurataInSecondi] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Album] ON 

INSERT [dbo].[Album] ([Id], [Titolo], [AnnoUscita], [CasaDiscografica], [Genere], [Distribuzione], [IdBand]) VALUES (1, N'Maneskin Before', CAST(N'2000-03-04' AS Date), N'sony music', N'rock', N'cd', 2)
INSERT [dbo].[Album] ([Id], [Titolo], [AnnoUscita], [CasaDiscografica], [Genere], [Distribuzione], [IdBand]) VALUES (2, N'Maneskin album recente', CAST(N'2020-05-04' AS Date), N'sony music', N'rock', N'cd', 2)
INSERT [dbo].[Album] ([Id], [Titolo], [AnnoUscita], [CasaDiscografica], [Genere], [Distribuzione], [IdBand]) VALUES (3, N'i the giorn best', CAST(N'1900-03-04' AS Date), N'sony music', N'Classico', N'cd', 3)
INSERT [dbo].[Album] ([Id], [Titolo], [AnnoUscita], [CasaDiscografica], [Genere], [Distribuzione], [IdBand]) VALUES (4, N'gli 88Bravi', CAST(N'2021-03-04' AS Date), N'sony music', N'pop', N'vinile', 1)
INSERT [dbo].[Album] ([Id], [Titolo], [AnnoUscita], [CasaDiscografica], [Genere], [Distribuzione], [IdBand]) VALUES (5, N'Le Cartelle primo', CAST(N'2022-03-04' AS Date), N'Casasconosciuta', N'pop', N'cd', 5)
INSERT [dbo].[Album] ([Id], [Titolo], [AnnoUscita], [CasaDiscografica], [Genere], [Distribuzione], [IdBand]) VALUES (6, N'altro album 883', CAST(N'2011-03-04' AS Date), N'casa234', N'Classico', N'cd', 1)
INSERT [dbo].[Album] ([Id], [Titolo], [AnnoUscita], [CasaDiscografica], [Genere], [Distribuzione], [IdBand]) VALUES (7, N'album the giornalisti 2', CAST(N'2011-03-04' AS Date), N'casa234', N'metal', N'cd', 3)
SET IDENTITY_INSERT [dbo].[Album] OFF
GO
SET IDENTITY_INSERT [dbo].[Album_Brano] ON 

INSERT [dbo].[Album_Brano] ([IdRaccolta], [IdAlbum], [IdBrano]) VALUES (1, 3, 8)
INSERT [dbo].[Album_Brano] ([IdRaccolta], [IdAlbum], [IdBrano]) VALUES (2, 3, 6)
INSERT [dbo].[Album_Brano] ([IdRaccolta], [IdAlbum], [IdBrano]) VALUES (3, 1, 2)
INSERT [dbo].[Album_Brano] ([IdRaccolta], [IdAlbum], [IdBrano]) VALUES (4, 2, 5)
INSERT [dbo].[Album_Brano] ([IdRaccolta], [IdAlbum], [IdBrano]) VALUES (5, 4, 1)
INSERT [dbo].[Album_Brano] ([IdRaccolta], [IdAlbum], [IdBrano]) VALUES (6, 4, 3)
INSERT [dbo].[Album_Brano] ([IdRaccolta], [IdAlbum], [IdBrano]) VALUES (7, 4, 4)
INSERT [dbo].[Album_Brano] ([IdRaccolta], [IdAlbum], [IdBrano]) VALUES (8, 5, 7)
INSERT [dbo].[Album_Brano] ([IdRaccolta], [IdAlbum], [IdBrano]) VALUES (9, 1, 6)
INSERT [dbo].[Album_Brano] ([IdRaccolta], [IdAlbum], [IdBrano]) VALUES (10, 2, 6)
INSERT [dbo].[Album_Brano] ([IdRaccolta], [IdAlbum], [IdBrano]) VALUES (11, 5, 6)
INSERT [dbo].[Album_Brano] ([IdRaccolta], [IdAlbum], [IdBrano]) VALUES (12, 5, 8)
INSERT [dbo].[Album_Brano] ([IdRaccolta], [IdAlbum], [IdBrano]) VALUES (13, 7, 10)
SET IDENTITY_INSERT [dbo].[Album_Brano] OFF
GO
SET IDENTITY_INSERT [dbo].[Band] ON 

INSERT [dbo].[Band] ([ID], [Nome], [NumeroComponenti]) VALUES (1, N'883', 4)
INSERT [dbo].[Band] ([ID], [Nome], [NumeroComponenti]) VALUES (2, N'Maneskin', 5)
INSERT [dbo].[Band] ([ID], [Nome], [NumeroComponenti]) VALUES (3, N'The Giornalisti', 2)
INSERT [dbo].[Band] ([ID], [Nome], [NumeroComponenti]) VALUES (4, N'Band nuova', 6)
INSERT [dbo].[Band] ([ID], [Nome], [NumeroComponenti]) VALUES (5, N'Le Cartelle', 3)
SET IDENTITY_INSERT [dbo].[Band] OFF
GO
SET IDENTITY_INSERT [dbo].[Brano] ON 

INSERT [dbo].[Brano] ([Id], [Titolo], [DurataInSecondi]) VALUES (1, N'gli 88Lunghi', 190)
INSERT [dbo].[Brano] ([Id], [Titolo], [DurataInSecondi]) VALUES (2, N'Marlena torna a casa', 150)
INSERT [dbo].[Brano] ([Id], [Titolo], [DurataInSecondi]) VALUES (3, N'ci sono acnh''io', 181)
INSERT [dbo].[Brano] ([Id], [Titolo], [DurataInSecondi]) VALUES (4, N'sei fantastica', 140)
INSERT [dbo].[Brano] ([Id], [Titolo], [DurataInSecondi]) VALUES (5, N'Mammamia', 190)
INSERT [dbo].[Brano] ([Id], [Titolo], [DurataInSecondi]) VALUES (6, N'Imagine', 190)
INSERT [dbo].[Brano] ([Id], [Titolo], [DurataInSecondi]) VALUES (7, N'Brano Le cartelle', 150)
INSERT [dbo].[Brano] ([Id], [Titolo], [DurataInSecondi]) VALUES (8, N'nessuno è niente', 170)
INSERT [dbo].[Brano] ([Id], [Titolo], [DurataInSecondi]) VALUES (9, N'filosofia', 120)
INSERT [dbo].[Brano] ([Id], [Titolo], [DurataInSecondi]) VALUES (10, N'le ballerine', 150)
SET IDENTITY_INSERT [dbo].[Brano] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [PK_AllField]    Script Date: 18/03/2022 11:55:30 ******/
ALTER TABLE [dbo].[Album] ADD  CONSTRAINT [PK_AllField] UNIQUE NONCLUSTERED 
(
	[Titolo] ASC,
	[AnnoUscita] ASC,
	[CasaDiscografica] ASC,
	[Genere] ASC,
	[Distribuzione] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Album]  WITH CHECK ADD FOREIGN KEY([IdBand])
REFERENCES [dbo].[Band] ([ID])
GO
ALTER TABLE [dbo].[Album_Brano]  WITH CHECK ADD FOREIGN KEY([IdAlbum])
REFERENCES [dbo].[Album] ([Id])
GO
ALTER TABLE [dbo].[Album_Brano]  WITH CHECK ADD FOREIGN KEY([IdBrano])
REFERENCES [dbo].[Brano] ([Id])
GO
ALTER TABLE [dbo].[Album]  WITH CHECK ADD CHECK  (([Distribuzione]='CD' OR [Distribuzione]='Vinile' OR [Distribuzione]='Streaming'))
GO
ALTER TABLE [dbo].[Album]  WITH CHECK ADD CHECK  (([genere]='Classico' OR [genere]='Jazz' OR [Genere]='Pop' OR [Genere]='Rock' OR [Genere]='Metal'))
GO
USE [master]
GO
ALTER DATABASE [NegozioDischi] SET  READ_WRITE 
GO
