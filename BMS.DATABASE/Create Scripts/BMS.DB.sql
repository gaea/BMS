USE [master]
GO

/****** Object:  Database [BMS]    Script Date: 02/06/2013 13:59:41 ******/
CREATE DATABASE [BMS] ON  PRIMARY 
( NAME = N'BMS', FILENAME = N'C:\BMS.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'BMS_log', FILENAME = N'C:\BMS_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [BMS] SET COMPATIBILITY_LEVEL = 90
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [BMS] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [BMS] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [BMS] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [BMS] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [BMS] SET ARITHABORT OFF 
GO

ALTER DATABASE [BMS] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [BMS] SET AUTO_CREATE_STATISTICS ON 
GO

ALTER DATABASE [BMS] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [BMS] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [BMS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [BMS] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [BMS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [BMS] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [BMS] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [BMS] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [BMS] SET  DISABLE_BROKER 
GO

ALTER DATABASE [BMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [BMS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [BMS] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [BMS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [BMS] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [BMS] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [BMS] SET  READ_WRITE 
GO

ALTER DATABASE [BMS] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [BMS] SET  MULTI_USER 
GO

ALTER DATABASE [BMS] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [BMS] SET DB_CHAINING OFF 
GO


USE [BMS]
GO
/****** Object:  Schema [BMS]    Script Date: 02/06/2013 13:59:22 ******/
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'BMS')
EXEC sys.sp_executesql N'CREATE SCHEMA [BMS] AUTHORIZATION [dbo]'
GO
/****** Object:  Table [BMS].[Roles]    Script Date: 02/06/2013 13:59:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[BMS].[Roles]') AND type in (N'U'))
BEGIN
CREATE TABLE [BMS].[Roles](
	[Id_Rol] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](150) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id_Rol] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [BMS].[Modules]    Script Date: 02/06/2013 13:59:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[BMS].[Modules]') AND type in (N'U'))
BEGIN
CREATE TABLE [BMS].[Modules](
	[Id_Module] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](150) NULL,
 CONSTRAINT [PK_Modules] PRIMARY KEY CLUSTERED 
(
	[Id_Module] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [BMS].[ModulesByRole]    Script Date: 02/06/2013 13:59:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[BMS].[ModulesByRole]') AND type in (N'U'))
BEGIN
CREATE TABLE [BMS].[ModulesByRole](
	[Id_Module] [int] NULL,
	[Id_Role] [int] NULL,
	[Description] [nvarchar](150) NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [BMS].[Users]    Script Date: 02/06/2013 13:59:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[BMS].[Users]') AND type in (N'U'))
BEGIN
CREATE TABLE [BMS].[Users](
	[Id_User] [int] IDENTITY(1,1) NOT NULL,
	[Login] [nvarchar](30) NULL,
	[Password] [nvarchar](20) NULL,
	[Id_Role] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id_User] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [BMS].[Authorizations]    Script Date: 02/06/2013 13:59:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[BMS].[Authorizations]') AND type in (N'U'))
BEGIN
CREATE TABLE [BMS].[Authorizations](
	[Id_Authorization] [int] IDENTITY(1,1) NOT NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Id_User] [int] NULL,
 CONSTRAINT [PK_Authorizations] PRIMARY KEY CLUSTERED 
(
	[Id_Authorization] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  ForeignKey [FK_Authorizations_Users]    Script Date: 02/06/2013 13:59:23 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[BMS].[FK_Authorizations_Users]') AND parent_object_id = OBJECT_ID(N'[BMS].[Authorizations]'))
ALTER TABLE [BMS].[Authorizations]  WITH CHECK ADD  CONSTRAINT [FK_Authorizations_Users] FOREIGN KEY([Id_User])
REFERENCES [BMS].[Users] ([Id_User])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[BMS].[FK_Authorizations_Users]') AND parent_object_id = OBJECT_ID(N'[BMS].[Authorizations]'))
ALTER TABLE [BMS].[Authorizations] CHECK CONSTRAINT [FK_Authorizations_Users]
GO
/****** Object:  ForeignKey [FK_ModulesByRole_Modules]    Script Date: 02/06/2013 13:59:23 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[BMS].[FK_ModulesByRole_Modules]') AND parent_object_id = OBJECT_ID(N'[BMS].[ModulesByRole]'))
ALTER TABLE [BMS].[ModulesByRole]  WITH CHECK ADD  CONSTRAINT [FK_ModulesByRole_Modules] FOREIGN KEY([Id_Module])
REFERENCES [BMS].[Modules] ([Id_Module])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[BMS].[FK_ModulesByRole_Modules]') AND parent_object_id = OBJECT_ID(N'[BMS].[ModulesByRole]'))
ALTER TABLE [BMS].[ModulesByRole] CHECK CONSTRAINT [FK_ModulesByRole_Modules]
GO
/****** Object:  ForeignKey [FK_ModulesByRole_Roles]    Script Date: 02/06/2013 13:59:23 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[BMS].[FK_ModulesByRole_Roles]') AND parent_object_id = OBJECT_ID(N'[BMS].[ModulesByRole]'))
ALTER TABLE [BMS].[ModulesByRole]  WITH CHECK ADD  CONSTRAINT [FK_ModulesByRole_Roles] FOREIGN KEY([Id_Role])
REFERENCES [BMS].[Roles] ([Id_Rol])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[BMS].[FK_ModulesByRole_Roles]') AND parent_object_id = OBJECT_ID(N'[BMS].[ModulesByRole]'))
ALTER TABLE [BMS].[ModulesByRole] CHECK CONSTRAINT [FK_ModulesByRole_Roles]
GO
/****** Object:  ForeignKey [FK_Users_Roles]    Script Date: 02/06/2013 13:59:23 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[BMS].[FK_Users_Roles]') AND parent_object_id = OBJECT_ID(N'[BMS].[Users]'))
ALTER TABLE [BMS].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([Id_Role])
REFERENCES [BMS].[Roles] ([Id_Rol])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[BMS].[FK_Users_Roles]') AND parent_object_id = OBJECT_ID(N'[BMS].[Users]'))
ALTER TABLE [BMS].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
