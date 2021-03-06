USE [master]
GO
/****** Object:  Database [DBESCOLASTICO]    Script Date: 30/7/2020 10:07:16 ******/
CREATE DATABASE [DBESCOLASTICO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBESCOLASTICO', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\DBESCOLASTICO.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBESCOLASTICO_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\DBESCOLASTICO_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DBESCOLASTICO] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBESCOLASTICO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBESCOLASTICO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBESCOLASTICO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBESCOLASTICO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBESCOLASTICO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBESCOLASTICO] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBESCOLASTICO] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBESCOLASTICO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBESCOLASTICO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBESCOLASTICO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBESCOLASTICO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBESCOLASTICO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBESCOLASTICO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBESCOLASTICO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBESCOLASTICO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBESCOLASTICO] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBESCOLASTICO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBESCOLASTICO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBESCOLASTICO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBESCOLASTICO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBESCOLASTICO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBESCOLASTICO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBESCOLASTICO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBESCOLASTICO] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DBESCOLASTICO] SET  MULTI_USER 
GO
ALTER DATABASE [DBESCOLASTICO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBESCOLASTICO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBESCOLASTICO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBESCOLASTICO] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBESCOLASTICO] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBESCOLASTICO] SET QUERY_STORE = OFF
GO
USE [DBESCOLASTICO]
GO
/****** Object:  Table [dbo].[Alumno]    Script Date: 30/7/2020 10:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alumno](
	[idalumno] [int] IDENTITY(1,1) NOT NULL,
	[nombres] [varchar](50) NULL,
	[apellidos] [varchar](50) NULL,
	[cedula] [varchar](15) NULL,
	[fecha_nacimiento] [date] NULL,
	[lugar_nacimiento] [varchar](50) NULL,
	[sexo] [nchar](1) NULL,
 CONSTRAINT [PK_Alumno] PRIMARY KEY CLUSTERED 
(
	[idalumno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Area]    Script Date: 30/7/2020 10:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Area](
	[idarea] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[coordinador] [varchar](50) NULL,
 CONSTRAINT [PK_Area] PRIMARY KEY CLUSTERED 
(
	[idarea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Calificacion]    Script Date: 30/7/2020 10:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calificacion](
	[idcalificacion] [int] IDENTITY(1,1) NOT NULL,
	[valor] [decimal](4, 2) NULL,
	[fecha] [datetime] NULL,
	[unidad] [nchar](1) NULL,
	[idmatricula] [int] NULL,
 CONSTRAINT [PK_Calificacion] PRIMARY KEY CLUSTERED 
(
	[idcalificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materia]    Script Date: 30/7/2020 10:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materia](
	[idmateria] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](75) NULL,
	[nrc] [nchar](5) NULL,
	[creditos] [smallint] NULL,
	[idarea] [int] NULL,
 CONSTRAINT [PK_Materia] PRIMARY KEY CLUSTERED 
(
	[idmateria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Matricula]    Script Date: 30/7/2020 10:07:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Matricula](
	[idmatricula] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NULL,
	[costo] [decimal](18, 2) NULL,
	[estado] [nchar](1) NULL,
	[tipo] [nchar](1) NULL,
	[idalumno] [int] NULL,
	[idmateria] [int] NULL,
 CONSTRAINT [PK_Matricula] PRIMARY KEY CLUSTERED 
(
	[idmatricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Alumno] ON 

INSERT [dbo].[Alumno] ([idalumno], [nombres], [apellidos], [cedula], [fecha_nacimiento], [lugar_nacimiento], [sexo]) VALUES (3, N'Denniss', N'Manotoa', N'01578451321', CAST(N'1994-02-26' AS Date), N'Riobamba', N'H')
INSERT [dbo].[Alumno] ([idalumno], [nombres], [apellidos], [cedula], [fecha_nacimiento], [lugar_nacimiento], [sexo]) VALUES (4, N'Daniel', N'Yáñez', N'0123465788', CAST(N'1996-05-16' AS Date), N'Riobamba', N'H')
INSERT [dbo].[Alumno] ([idalumno], [nombres], [apellidos], [cedula], [fecha_nacimiento], [lugar_nacimiento], [sexo]) VALUES (1002, N'Álex', N'Montalvo', N'0200159487', CAST(N'1999-08-07' AS Date), N'Ambato', N'H')
INSERT [dbo].[Alumno] ([idalumno], [nombres], [apellidos], [cedula], [fecha_nacimiento], [lugar_nacimiento], [sexo]) VALUES (1003, N'David', N'Vique', N'485126792', CAST(N'1997-10-19' AS Date), N'Guaranda', N'H')
INSERT [dbo].[Alumno] ([idalumno], [nombres], [apellidos], [cedula], [fecha_nacimiento], [lugar_nacimiento], [sexo]) VALUES (1004, N'Jasson', N'Salguero', N'4567891231', CAST(N'1999-06-25' AS Date), N'Quito', N'H')
INSERT [dbo].[Alumno] ([idalumno], [nombres], [apellidos], [cedula], [fecha_nacimiento], [lugar_nacimiento], [sexo]) VALUES (1005, N'Ronny', N'Gil', N'78946578941', CAST(N'1995-12-19' AS Date), N'Cayambe', N'H')
INSERT [dbo].[Alumno] ([idalumno], [nombres], [apellidos], [cedula], [fecha_nacimiento], [lugar_nacimiento], [sexo]) VALUES (2006, N'Roberto', N'Barahona', N'0123456798', CAST(N'1999-11-15' AS Date), N'Quito', N'H')
INSERT [dbo].[Alumno] ([idalumno], [nombres], [apellidos], [cedula], [fecha_nacimiento], [lugar_nacimiento], [sexo]) VALUES (2007, N'Jhonny', N'Moya', N'02132456789', CAST(N'1999-10-25' AS Date), N'Quito', N'H')
INSERT [dbo].[Alumno] ([idalumno], [nombres], [apellidos], [cedula], [fecha_nacimiento], [lugar_nacimiento], [sexo]) VALUES (2008, N'Jefferson', N'Herrera', N'01234897887', CAST(N'1997-10-25' AS Date), N'Quito', N'H')
INSERT [dbo].[Alumno] ([idalumno], [nombres], [apellidos], [cedula], [fecha_nacimiento], [lugar_nacimiento], [sexo]) VALUES (2010, N'Christian', N'Guanopatín', N'1234567980', NULL, NULL, N'H')
INSERT [dbo].[Alumno] ([idalumno], [nombres], [apellidos], [cedula], [fecha_nacimiento], [lugar_nacimiento], [sexo]) VALUES (2011, N'Luis Armando', N'Chicaiza', N'0145678918', NULL, NULL, N'H')
INSERT [dbo].[Alumno] ([idalumno], [nombres], [apellidos], [cedula], [fecha_nacimiento], [lugar_nacimiento], [sexo]) VALUES (2012, N'Alan', N'Oña', N'0214567897', CAST(N'2000-07-16' AS Date), N'Tulcán', N'H')
INSERT [dbo].[Alumno] ([idalumno], [nombres], [apellidos], [cedula], [fecha_nacimiento], [lugar_nacimiento], [sexo]) VALUES (2013, N'Anita', N'Lopez', N'0123458971', CAST(N'2001-10-07' AS Date), N'Loja', N'M')
SET IDENTITY_INSERT [dbo].[Alumno] OFF
GO
SET IDENTITY_INSERT [dbo].[Area] ON 

INSERT [dbo].[Area] ([idarea], [nombre], [coordinador]) VALUES (4, N'Programación', N'Ing. Javier Montaluisa')
INSERT [dbo].[Area] ([idarea], [nombre], [coordinador]) VALUES (5, N'Software', N'Dr. Edison Espinosa')
INSERT [dbo].[Area] ([idarea], [nombre], [coordinador]) VALUES (6, N'IA', N'Dr. José Carrillo')
SET IDENTITY_INSERT [dbo].[Area] OFF
GO
SET IDENTITY_INSERT [dbo].[Materia] ON 

INSERT [dbo].[Materia] ([idmateria], [nombre], [nrc], [creditos], [idarea]) VALUES (4, N'Fundamentos de programación', N'7000 ', 10, 4)
INSERT [dbo].[Materia] ([idmateria], [nombre], [nrc], [creditos], [idarea]) VALUES (5, N'Fundamentos de programación', N'7001 ', 10, 4)
INSERT [dbo].[Materia] ([idmateria], [nombre], [nrc], [creditos], [idarea]) VALUES (6, N'Programación orientada a objetos', N'7002 ', 8, 4)
INSERT [dbo].[Materia] ([idmateria], [nombre], [nrc], [creditos], [idarea]) VALUES (7, N'Programación orientada a objetos', N'7007 ', 10, 4)
INSERT [dbo].[Materia] ([idmateria], [nombre], [nrc], [creditos], [idarea]) VALUES (8, N'Certificación I', N'7600 ', 4, 4)
INSERT [dbo].[Materia] ([idmateria], [nombre], [nrc], [creditos], [idarea]) VALUES (1002, N'Lab', N'9000 ', 4, 5)
SET IDENTITY_INSERT [dbo].[Materia] OFF
GO
SET IDENTITY_INSERT [dbo].[Matricula] ON 

INSERT [dbo].[Matricula] ([idmatricula], [fecha], [costo], [estado], [tipo], [idalumno], [idmateria]) VALUES (3, CAST(N'2020-06-18T10:51:06.533' AS DateTime), CAST(0.00 AS Decimal(18, 2)), N'1', N'P', 3, 6)
INSERT [dbo].[Matricula] ([idmatricula], [fecha], [costo], [estado], [tipo], [idalumno], [idmateria]) VALUES (4, CAST(N'2020-06-18T10:56:42.810' AS DateTime), CAST(0.00 AS Decimal(18, 2)), N'1', N'P', 4, 7)
INSERT [dbo].[Matricula] ([idmatricula], [fecha], [costo], [estado], [tipo], [idalumno], [idmateria]) VALUES (5, NULL, NULL, NULL, N'S', 1002, 7)
INSERT [dbo].[Matricula] ([idmatricula], [fecha], [costo], [estado], [tipo], [idalumno], [idmateria]) VALUES (6, CAST(N'2020-06-18T11:15:51.813' AS DateTime), CAST(196.00 AS Decimal(18, 2)), N'1', N'T', 1003, 7)
INSERT [dbo].[Matricula] ([idmatricula], [fecha], [costo], [estado], [tipo], [idalumno], [idmateria]) VALUES (7, CAST(N'2020-06-18T11:16:05.127' AS DateTime), CAST(245.00 AS Decimal(18, 2)), N'1', N'T', 1004, 4)
INSERT [dbo].[Matricula] ([idmatricula], [fecha], [costo], [estado], [tipo], [idalumno], [idmateria]) VALUES (8, CAST(N'2020-06-18T11:36:29.770' AS DateTime), CAST(98.00 AS Decimal(18, 2)), N'1', N'S', 1005, 6)
INSERT [dbo].[Matricula] ([idmatricula], [fecha], [costo], [estado], [tipo], [idalumno], [idmateria]) VALUES (1002, CAST(N'2020-07-09T10:55:33.137' AS DateTime), CAST(49.00 AS Decimal(18, 2)), N'1', N'S', 1002, 8)
SET IDENTITY_INSERT [dbo].[Matricula] OFF
GO
ALTER TABLE [dbo].[Calificacion]  WITH CHECK ADD  CONSTRAINT [FK_Calificacion_Matricula] FOREIGN KEY([idmatricula])
REFERENCES [dbo].[Matricula] ([idmatricula])
GO
ALTER TABLE [dbo].[Calificacion] CHECK CONSTRAINT [FK_Calificacion_Matricula]
GO
ALTER TABLE [dbo].[Materia]  WITH CHECK ADD  CONSTRAINT [FK_Materia_Area] FOREIGN KEY([idarea])
REFERENCES [dbo].[Area] ([idarea])
GO
ALTER TABLE [dbo].[Materia] CHECK CONSTRAINT [FK_Materia_Area]
GO
ALTER TABLE [dbo].[Matricula]  WITH CHECK ADD  CONSTRAINT [FK_Matricula_Alumno] FOREIGN KEY([idalumno])
REFERENCES [dbo].[Alumno] ([idalumno])
GO
ALTER TABLE [dbo].[Matricula] CHECK CONSTRAINT [FK_Matricula_Alumno]
GO
ALTER TABLE [dbo].[Matricula]  WITH CHECK ADD  CONSTRAINT [FK_Matricula_Materia] FOREIGN KEY([idmateria])
REFERENCES [dbo].[Materia] ([idmateria])
GO
ALTER TABLE [dbo].[Matricula] CHECK CONSTRAINT [FK_Matricula_Materia]
GO
USE [master]
GO
ALTER DATABASE [DBESCOLASTICO] SET  READ_WRITE 
GO
