USE [master]
GO
/****** Object:  Database [dbescolastico]    Script Date: 3/8/2020 13:59:34 ******/
CREATE DATABASE [dbescolastico]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbescolastico', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\dbescolastico.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'dbescolastico_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\dbescolastico_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [dbescolastico] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbescolastico].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbescolastico] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbescolastico] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbescolastico] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbescolastico] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbescolastico] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbescolastico] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbescolastico] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbescolastico] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbescolastico] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbescolastico] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbescolastico] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbescolastico] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbescolastico] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbescolastico] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbescolastico] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbescolastico] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbescolastico] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbescolastico] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbescolastico] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbescolastico] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbescolastico] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbescolastico] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbescolastico] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbescolastico] SET  MULTI_USER 
GO
ALTER DATABASE [dbescolastico] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbescolastico] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbescolastico] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbescolastico] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbescolastico] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbescolastico] SET QUERY_STORE = OFF
GO
USE [dbescolastico]
GO
/****** Object:  Table [dbo].[Alumno]    Script Date: 3/8/2020 13:59:34 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Area]    Script Date: 3/8/2020 13:59:34 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Calificacion]    Script Date: 3/8/2020 13:59:34 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Club]    Script Date: 3/8/2020 13:59:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Club](
	[id_club] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[campus] [varchar](50) NOT NULL,
	[lider] [varchar](50) NOT NULL,
	[telefono] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Club] PRIMARY KEY CLUSTERED 
(
	[id_club] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materia]    Script Date: 3/8/2020 13:59:34 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Matricula]    Script Date: 3/8/2020 13:59:34 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
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
ALTER DATABASE [dbescolastico] SET  READ_WRITE 
GO
