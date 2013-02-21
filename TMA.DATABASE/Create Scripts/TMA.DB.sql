 USE [master]
GO

/****** Object:  Database [TWAccess]    Script Date: 02/04/2013 18:14:42 ******/
CREATE DATABASE [TWAccess] ON  PRIMARY 
( NAME = N'TimeAcces', FILENAME = N'C:\TWAccess.mdf' , SIZE = 13312KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TimeAccess_log', FILENAME = N'C:\TWAccess.ldf' , SIZE = 8384KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [TWAccess] SET COMPATIBILITY_LEVEL = 100
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TWAccess].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [TWAccess] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [TWAccess] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [TWAccess] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [TWAccess] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [TWAccess] SET ARITHABORT OFF 
GO

ALTER DATABASE [TWAccess] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [TWAccess] SET AUTO_CREATE_STATISTICS ON 
GO

ALTER DATABASE [TWAccess] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [TWAccess] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [TWAccess] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [TWAccess] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [TWAccess] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [TWAccess] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [TWAccess] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [TWAccess] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [TWAccess] SET  DISABLE_BROKER 
GO

ALTER DATABASE [TWAccess] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [TWAccess] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [TWAccess] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [TWAccess] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [TWAccess] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [TWAccess] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [TWAccess] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [TWAccess] SET  READ_WRITE 
GO

ALTER DATABASE [TWAccess] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [TWAccess] SET  MULTI_USER 
GO

ALTER DATABASE [TWAccess] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [TWAccess] SET DB_CHAINING OFF 
GO


--===================

USE [master]
GO
/****** Object:  Database [TWAccess]    Script Date: 02/09/2013 11:13:15 ******/
CREATE DATABASE [TWAccess] ON  PRIMARY 
( NAME = N'TimeAcces', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQL2008R2\MSSQL\DATA\TWAccess.mdf' , SIZE = 13312KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TimeAccess_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQL2008R2\MSSQL\DATA\TWAccess_log.ldf' , SIZE = 8384KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TWAccess] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TWAccess].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TWAccess] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [TWAccess] SET ANSI_NULLS OFF
GO
ALTER DATABASE [TWAccess] SET ANSI_PADDING OFF
GO
ALTER DATABASE [TWAccess] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [TWAccess] SET ARITHABORT OFF
GO
ALTER DATABASE [TWAccess] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [TWAccess] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [TWAccess] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [TWAccess] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [TWAccess] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [TWAccess] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [TWAccess] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [TWAccess] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [TWAccess] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [TWAccess] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [TWAccess] SET  DISABLE_BROKER
GO
ALTER DATABASE [TWAccess] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [TWAccess] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [TWAccess] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [TWAccess] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [TWAccess] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [TWAccess] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [TWAccess] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [TWAccess] SET  READ_WRITE
GO
ALTER DATABASE [TWAccess] SET RECOVERY SIMPLE
GO
ALTER DATABASE [TWAccess] SET  MULTI_USER
GO
ALTER DATABASE [TWAccess] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [TWAccess] SET DB_CHAINING OFF
GO
USE [TWAccess]
GO
/****** Object:  User [its]    Script Date: 02/09/2013 11:13:15 ******/
CREATE USER [its] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  StoredProcedure [dbo].[getNumeroMaximo]    Script Date: 02/09/2013 11:13:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ===============================================
-- Author:		Margarita Hoyos
-- Create date: 13-Enero-2010
-- Description:	Obtiene el numero valido para un
-- campo autoincrement de la BD
-- ===============================================
CREATE PROCEDURE [dbo].[getNumeroMaximo]
	@sql varchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @strSql nvarchar(max)

set @strSql = @sql
	
exec sp_executesql @strSql

END
GO
/****** Object:  StoredProcedure [dbo].[getDatosMenuHijo]    Script Date: 02/09/2013 11:13:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ===============================================
-- Author:		Diego Guevara
-- Create date: 17-Nov-2008
-- Description:	Obtiene los items que son opciones
-- hijas
-- ===============================================
CREATE PROCEDURE [dbo].[getDatosMenuHijo]
	@PValIdMenuPadres varchar(100), 
	@perfil varchar(2)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @strSql nvarchar(max)

set @strSql = 'SELECT [INTER].[InterfasId],[INTER].[Descripcion],[INTER].[Posicion],[INTER].[Icono] ,[INTER].[Habilitado]
      ,[INTER].[Url],[INTER].[Menu],[INTER].[UsuarioCrea],[INTER].[FechaCrea],[INTER].[UsuarioModifica],[INTER].[FechaModifica]
  FROM [dbo].[Tbl_Interfaces] [INTER]
   INNER JOIN dbo.Tbl_PermisosUsuarios [PERMISO]ON
		[PERMISO].iui = [INTER].InterfasId 
  WHERE [INTER].[Menu] in (' +@PValIdMenuPadres +') AND [PERMISO].ver =1 AND [perf] = '+ @perfil +'
  ORDER BY [INTER].[Posicion] '
	
exec sp_executesql @strSql

END
GO
/****** Object:  StoredProcedure [dbo].[getCantidadItems]    Script Date: 02/09/2013 11:13:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ===============================================
-- Author:		Diego Guevara
-- Create date: 17-Nov-2008
-- Description:	Obtiene los items que son opciones
-- hijas
-- ===============================================
CREATE PROCEDURE [dbo].[getCantidadItems]
	@sql varchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @strSql nvarchar(max)

set @strSql = @sql
	
exec sp_executesql @strSql

END
GO
/****** Object:  Table [dbo].[CHECKINOUT]    Script Date: 02/09/2013 11:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHECKINOUT](
	[Userid] [nvarchar](20) NOT NULL,
	[CheckTime] [datetime] NOT NULL,
	[CheckType] [nvarchar](1) NULL,
	[Sensorid] [nvarchar](10) NULL,
 CONSTRAINT [CHECKINOUT$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[Userid] ASC,
	[CheckTime] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[prcValidarID]    Script Date: 02/09/2013 11:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ===============================================
-- Author:		Margarita Hoyos
-- Create date: 28-Septiembre-2010
-- Description:	Valida si un id ya existe
-- ===============================================
CREATE PROCEDURE [dbo].[prcValidarID]
	@sql varchar(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @strSql nvarchar(max)

set @strSql = @sql
	
exec sp_executesql @strSql

END
GO
/****** Object:  Table [dbo].[Tbl_Lectores]    Script Date: 02/09/2013 11:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_Lectores](
	[NumeroLector] [int] NOT NULL,
	[NombreLector] [nvarchar](20) NULL,
	[TipoComunicacion] [nvarchar](50) NULL,
	[DireccionIP] [nvarchar](20) NULL,
	[PuertoSerial] [int] NULL,
	[PuertoIp] [int] NULL,
	[Baudrate] [int] NULL,
	[TipoLector] [varchar](50) NULL,
 CONSTRAINT [PK_Tbl_Lectores] PRIMARY KEY CLUSTERED 
(
	[NumeroLector] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbl_Aproximaciones]    Script Date: 02/09/2013 11:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Aproximaciones](
	[Accion] [nvarchar](50) NOT NULL,
	[MinutoInicial] [smallint] NOT NULL,
	[MinutoFinal] [smallint] NOT NULL,
	[AproximaHora] [nvarchar](50) NOT NULL,
	[MinutoAproximar] [smallint] NOT NULL,
 CONSTRAINT [Tbl_Aproximaciones$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[Accion] ASC,
	[MinutoInicial] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Cargos]    Script Date: 02/09/2013 11:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Cargos](
	[CodigoCargo] [int] NOT NULL,
	[Cargo] [nvarchar](50) NOT NULL,
	[UsuarioCrea] [nvarchar](50) NULL,
	[FechaCrea] [datetime] NULL,
	[UsuarioModifica] [nvarchar](50) NULL,
	[FechaModifica] [datetime] NULL,
 CONSTRAINT [Tbl_Cargos$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[CodigoCargo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Empresa]    Script Date: 02/09/2013 11:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_Empresa](
	[Id_Tercero] [int] NOT NULL,
	[Sucursal] [int] NOT NULL,
	[DigitoVerificacion] [smallint] NULL,
	[NombreEmpresa] [nvarchar](50) NULL,
	[DireccionCorrespondencia] [nvarchar](50) NULL,
	[Ciudad] [int] NULL,
	[ApartadoAereo] [nvarchar](50) NULL,
	[TelOficina] [nvarchar](50) NULL,
	[Fax] [nvarchar](50) NULL,
	[CodigoPersoneriaJuridica] [int] NULL,
	[RepresentanteLegal] [nvarchar](50) NULL,
	[Cedula_RepLegal] [int] NULL,
	[Observaciones] [nvarchar](max) NULL,
	[LicenciaSoftware] [nvarchar](50) NULL,
	[Logo] [varbinary](max) NULL,
	[CodigoNomina] [smallint] NULL,
	[LectorMouse] [bit] NULL,
	[UsuarioCrea] [nvarchar](50) NULL,
	[FechaCrea] [datetime] NULL,
	[UsuarioModifica] [nvarchar](50) NULL,
	[FechaModifica] [datetime] NULL,
 CONSTRAINT [Tbl_Empresa$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[Id_Tercero] ASC,
	[Sucursal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbl_Dependencias]    Script Date: 02/09/2013 11:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Dependencias](
	[CodigoDependencia] [int] NOT NULL,
	[Dependencia] [nvarchar](50) NOT NULL,
	[ClaseDependencia] [nvarchar](50) NULL,
	[UsuarioCrea] [nvarchar](50) NULL,
	[FechaCrea] [datetime] NULL,
	[UsuarioModifica] [nvarchar](50) NULL,
	[FechaModifica] [datetime] NULL,
	[IdEmpresa] [int] NULL,
 CONSTRAINT [Tbl_Dependencias$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[CodigoDependencia] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Departamentos]    Script Date: 02/09/2013 11:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Departamentos](
	[Departamento] [int] NOT NULL,
	[NombreDepartamento] [nvarchar](50) NULL,
 CONSTRAINT [Tbl_Departamentos$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[Departamento] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_CorreoEmpresa]    Script Date: 02/09/2013 11:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_CorreoEmpresa](
	[IdCorreoEmpresa] [int] NOT NULL,
	[IdEmpresa] [int] NULL,
	[DeCorreoEmpresa] [nvarchar](50) NULL,
	[Nombre] [nvarchar](50) NULL,
	[Usuario] [nvarchar](50) NULL,
	[Clave] [nvarchar](50) NULL,
	[Asunto] [nvarchar](50) NULL,
	[Mensaje] [nvarchar](max) NULL,
	[smtp] [nvarchar](50) NULL,
	[puerto] [int] NULL,
	[Firma] [nvarchar](50) NULL,
 CONSTRAINT [PK_Tbl_CorreoEmpresa] PRIMARY KEY CLUSTERED 
(
	[IdCorreoEmpresa] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Continentes]    Script Date: 02/09/2013 11:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Continentes](
	[Continente] [smallint] NOT NULL,
	[Nombre] [nvarchar](50) NULL,
 CONSTRAINT [Tbl_Continentes$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[Continente] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_ClaseContratos]    Script Date: 02/09/2013 11:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_ClaseContratos](
	[ClaseContrato] [int] NOT NULL,
	[Contratacion] [nvarchar](50) NULL,
 CONSTRAINT [Tbl_ClaseContratos$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[ClaseContrato] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Tags]    Script Date: 02/09/2013 11:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_Tags](
	[IdTag] [varchar](255) NOT NULL,
	[Descripcion] [varchar](max) NULL,
	[Estado] [char](1) NULL,
	[FechaCrea] [datetime] NULL,
	[FechaModifica] [datetime] NULL,
	[UsuarioCrea] [varchar](255) NULL,
	[UsuarioModifica] [varchar](255) NULL,
 CONSTRAINT [PK_Tbl_Tags] PRIMARY KEY CLUSTERED 
(
	[IdTag] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbl_Sedes]    Script Date: 02/09/2013 11:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Sedes](
	[NumeroSede] [smallint] NOT NULL,
	[Sede] [nvarchar](50) NULL,
 CONSTRAINT [Tbl_Sedes$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[NumeroSede] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_PermisosUsuarios]    Script Date: 02/09/2013 11:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_PermisosUsuarios](
	[idPermiso] [int] NOT NULL,
	[iui] [int] NULL,
	[ver] [bit] NOT NULL,
	[perf] [int] NULL,
	[adic] [bit] NULL,
	[dro] [bit] NULL,
	[upd] [bit] NULL,
	[con] [bit] NULL,
	[ucr] [int] NULL,
	[fcr] [datetime] NULL,
	[umo] [int] NULL,
	[fmo] [datetime] NULL,
 CONSTRAINT [Permisos$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[idPermiso] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_PeriodosTrabajo]    Script Date: 02/09/2013 11:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_PeriodosTrabajo](
	[PeriodoAnual] [smallint] NOT NULL,
	[NroPeriodo] [int] NOT NULL,
	[FechaInicial] [datetime] NULL,
	[FechaFinal] [datetime] NULL,
	[UsuarioCrea] [nvarchar](50) NULL,
	[FechaCrea] [datetime] NULL,
	[UsuarioModifica] [nvarchar](50) NULL,
	[FechaModifica] [datetime] NULL,
 CONSTRAINT [Tbl_PeriodosTrabajo$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[PeriodoAnual] ASC,
	[NroPeriodo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_PerfilesUsuarios]    Script Date: 02/09/2013 11:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_PerfilesUsuarios](
	[idPerfil] [int] IDENTITY(1,1) NOT NULL,
	[nmb] [nvarchar](255) NULL,
	[usr] [int] NULL,
	[fcre] [datetime] NULL,
	[usrm] [int] NULL,
	[fmod] [datetime] NULL,
 CONSTRAINT [Grupos$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[idPerfil] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_TurnosPorCCosto]    Script Date: 02/09/2013 11:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_TurnosPorCCosto](
	[CentroCosto] [smallint] NOT NULL,
	[Turno] [nvarchar](3) NOT NULL,
	[NombreTurno] [nvarchar](50) NULL,
	[CodigoTurno] [smallint] NULL,
	[UsuarioCrea] [nvarchar](50) NULL,
	[FechaCrea] [datetime] NULL,
	[UsuarioModifica] [nvarchar](50) NULL,
	[FechaModifica] [datetime] NULL,
 CONSTRAINT [Tbl_TurnosPorCCosto$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[CentroCosto] ASC,
	[Turno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_TurnosAtencion]    Script Date: 02/09/2013 11:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_TurnosAtencion](
	[Turno] [int] NOT NULL,
	[fechaTurno] [date] NOT NULL,
	[Comentarios] [nvarchar](50) NULL,
	[IdPersona] [float] NULL,
	[StsTurno] [char](1) NULL,
	[HoraInicial] [time](7) NULL,
	[HoraFinal] [time](7) NULL,
 CONSTRAINT [PK_Tbl_TurnosAtencion] PRIMARY KEY CLUSTERED 
(
	[Turno] ASC,
	[fechaTurno] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbl_Turnos]    Script Date: 02/09/2013 11:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Turnos](
	[CodigoTurno] [smallint] NOT NULL,
	[Consecutivo] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [nvarchar](50) NULL,
	[HoraInicial] [datetime] NULL,
	[HoraFinal] [datetime] NULL,
	[HorasxTurno] [datetime] NULL,
	[HorasDiurnasxTurno] [datetime] NULL,
	[HorasNocturnasxTurno] [datetime] NULL,
	[MinutosExcluidos] [smallint] NULL,
	[ClaseMinutosExcluidos] [nvarchar](50) NULL,
	[UsuarioCrea] [nvarchar](50) NULL,
	[FechaCrea] [datetime] NULL,
	[UsuarioModifica] [nvarchar](50) NULL,
	[FechaModifica] [datetime] NULL,
 CONSTRAINT [Tbl_Turnos$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[CodigoTurno] ASC,
	[Consecutivo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Torres]    Script Date: 02/09/2013 11:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_Torres](
	[IdTorre] [int] NOT NULL,
	[Nombre] [varchar](100) NULL,
	[CantidadPisos] [int] NULL,
	[FechaCrea] [date] NULL,
	[FechaModifica] [date] NULL,
	[UsuarioCrea] [varchar](255) NULL,
	[UsuarioModifica] [varchar](255) NULL,
 CONSTRAINT [PK_Tbl_Torres] PRIMARY KEY CLUSTERED 
(
	[IdTorre] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbl_Terceros]    Script Date: 02/09/2013 11:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_Terceros](
	[Id_Tercero] [float] NOT NULL,
	[DigitoSucursal] [smallint] NULL,
	[DigitoVerificacion] [smallint] NULL,
	[Sigla] [varchar](50) NULL,
	[Nombre] [varchar](255) NULL,
	[DireccionCorrespondencia] [varchar](100) NULL,
	[Ciudad] [int] NULL,
	[ZonaPostal] [int] NULL,
	[ApartadoAereo] [varchar](50) NULL,
	[TelOficina] [varchar](50) NULL,
	[Extension] [varchar](50) NULL,
	[TelCasa] [varchar](50) NULL,
	[Celular] [varchar](50) NULL,
	[Fax] [varchar](50) NULL,
	[MesCumpleaños] [smallint] NULL,
	[DiaCumpleaños] [smallint] NULL,
	[Huella] [varbinary](max) NULL,
	[Foto] [varbinary](max) NULL,
	[CodigoPersoneriaJuridica] [int] NULL,
	[RepresentanteLegal] [varchar](50) NULL,
	[Cedula_RepLegal] [varchar](20) NULL,
	[CodigoRegimenIva] [smallint] NULL,
	[CodigoContribuyente] [smallint] NULL,
	[Autoretenedor] [bit] NULL,
	[DireccioneElectronica] [varchar](50) NULL,
	[ReferenciaComercial] [varchar](50) NULL,
	[ContactoRefComercial] [varchar](50) NULL,
	[TelRefComercial] [varchar](50) NULL,
	[ReferenciaBancaria] [varchar](50) NULL,
	[CuentaBancaria] [varchar](30) NULL,
	[ReferenciaPersonal] [varchar](50) NULL,
	[TelRefPersonal] [varchar](50) NULL,
	[RetienexIca] [bit] NULL,
	[CodigoActividadIca] [smallint] NULL,
	[CodigoGremio] [smallint] NULL,
	[Verificado] [bit] NULL,
	[GirarChequesA] [varchar](80) NULL,
	[Observaciones] [varchar](max) NULL,
	[UsuarioCrea] [varchar](50) NULL,
	[FechaCrea] [datetime] NULL,
	[UsuarioModifica] [varchar](50) NULL,
	[FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_Tbl_Terceros_1] PRIMARY KEY CLUSTERED 
(
	[Id_Tercero] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbl_Templates]    Script Date: 02/09/2013 11:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_Templates](
	[CodPersona] [int] NOT NULL,
	[fingerID] [smallint] NOT NULL,
	[templatea] [text] NULL,
	[HuellaDigital] [varbinary](max) NULL,
	[template2] [text] NULL,
	[template3] [text] NULL,
	[UsuarioCrea] [nvarchar](50) NULL,
	[UsuarioModifica] [nvarchar](50) NULL,
	[FechaCrea] [datetime] NULL,
	[FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_Tbl_Templates] PRIMARY KEY CLUSTERED 
(
	[CodPersona] ASC,
	[fingerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[adicionaDependencias_x_Usuario]    Script Date: 02/09/2013 11:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Marisol 
-- Create date: 17-Noviembre-2009
-- Description:	
-- ==================================================
CREATE PROCEDURE [dbo].[adicionaDependencias_x_Usuario]
	@IdUsuario int,
	@IdDependencia int
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		BEGIN
			INSERT INTO Tbl_UsuariosDependencia (IdUsuario,IdDependencia,FechaCrea) VALUES(@IdUsuario,@IdDependencia,GETDATE())
		END
END
GO
/****** Object:  Table [dbo].[Tbl_Menus]    Script Date: 02/09/2013 11:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_Menus](
	[MenuId] [int] NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[Posicion] [int] NOT NULL,
	[Icono] [varchar](50) NULL,
	[Habilitado] [bit] NOT NULL,
	[Url] [varchar](50) NULL,
	[UsuarioCrea] [int] NULL,
	[FechaCrea] [date] NULL,
	[UsuarioModifica] [int] NULL,
	[FechaModifica] [date] NULL,
 CONSTRAINT [PK_Tbl_Menus] PRIMARY KEY CLUSTERED 
(
	[MenuId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbl_MarcacionesVehiculos]    Script Date: 02/09/2013 11:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_MarcacionesVehiculos](
	[IdMarcacion] [int] NOT NULL,
	[IdEmpresa] [int] NOT NULL,
	[Estado] [char](1) NULL,
	[Nombre] [varchar](50) NULL,
	[Apellido] [varchar](50) NULL,
	[Documento] [varchar](50) NULL,
	[FechaInicio] [date] NULL,
	[HoraInicio] [time](7) NULL,
	[FechaFin] [date] NULL,
	[HoraFin] [time](7) NULL,
	[IdTag] [int] NULL,
	[IdVehiculo] [varchar](10) NULL,
	[Foto1] [varbinary](max) NULL,
	[Foto2] [varbinary](max) NULL,
	[Foto3] [varbinary](max) NULL,
	[Foto4] [varbinary](max) NULL,
	[FechaCrea] [datetime] NULL,
	[FechaModifica] [datetime] NULL,
	[UsuarioCrea] [varchar](255) NULL,
	[UsuarioModifica] [varchar](255) NULL,
 CONSTRAINT [PK_Tbl_Marcaciones] PRIMARY KEY CLUSTERED 
(
	[IdMarcacion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbl_Pacientes]    Script Date: 02/09/2013 11:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_Pacientes](
	[Identificacion] [varchar](20) NOT NULL,
	[Nombre] [varchar](100) NULL,
	[Apellido] [varchar](100) NULL,
	[Edad] [int] NULL,
	[FechaNacimiento] [date] NULL,
	[Observaciones] [text] NULL,
	[FechaCrea] [date] NULL,
	[FechaModifica] [date] NULL,
	[UsuarioCrea] [varchar](255) NULL,
	[UsuarioModifica] [varchar](255) NULL,
 CONSTRAINT [PK_Tbl_Pacientes] PRIMARY KEY CLUSTERED 
(
	[Identificacion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbl_Meses]    Script Date: 02/09/2013 11:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Meses](
	[CodigoMes] [smallint] NOT NULL,
	[Mes] [nvarchar](50) NULL,
 CONSTRAINT [Tbl_Meses$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[CodigoMes] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Personas]    Script Date: 02/09/2013 11:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Personas](
	[IdPersona] [float] NOT NULL,
	[CodPersona] [int] NULL,
	[Empresa] [float] NULL,
	[NomPersona] [nvarchar](50) NULL,
	[ApePersona] [nvarchar](50) NULL,
	[MesCumpleaños] [smallint] NULL,
	[DiaCumpleaños] [smallint] NULL,
	[DireccionCorrespondencia] [nvarchar](50) NULL,
	[Ciudad] [int] NULL,
	[TelCasa] [int] NULL,
	[Celular] [float] NULL,
	[Fax] [int] NULL,
	[eMail] [nvarchar](50) NULL,
	[Activo] [bit] NULL,
	[Observaciones] [nvarchar](max) NULL,
	[Foto] [nvarchar](50) NULL,
	[UsuarioCrea] [nvarchar](50) NULL,
	[FechaCrea] [datetime] NULL,
	[UsuarioModifica] [nvarchar](50) NULL,
	[FechaModifica] [datetime] NULL,
	[contratista] [bit] NULL,
	[fechavigenciaARP] [date] NULL,
 CONSTRAINT [PK_Tbl_Personas] PRIMARY KEY CLUSTERED 
(
	[IdPersona] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_VisitantePaciente]    Script Date: 02/09/2013 11:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_VisitantePaciente](
	[Identificacion] [varchar](20) NOT NULL,
	[Nombre] [varchar](255) NULL,
	[Huella] [varbinary](max) NULL,
	[Foto] [varbinary](max) NULL,
	[Observaciones] [text] NULL,
	[FechaCrea] [date] NULL,
	[FechaModifica] [date] NULL,
	[UsuarioCrea] [varchar](255) NULL,
	[UsuarioModifica] [varchar](255) NULL,
 CONSTRAINT [PK_Tbl_VisitantePaciente] PRIMARY KEY CLUSTERED 
(
	[Identificacion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbl_Vehiculos]    Script Date: 02/09/2013 11:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_Vehiculos](
	[Placa] [varchar](10) NOT NULL,
	[Ciudad] [int] NULL,
	[Marca] [varchar](50) NULL,
	[TipoVehiculo] [varchar](50) NULL,
	[Modelo] [varchar](50) NULL,
	[NumeroChasis] [varchar](50) NULL,
	[Color] [varchar](20) NULL,
	[NumeroMotor] [varchar](50) NULL,
	[Foto] [varbinary](max) NULL,
	[NombrePropietario] [varchar](100) NULL,
	[ApellidoPropietario] [varchar](100) NULL,
	[Estado] [char](1) NULL,
	[Observacion] [text] NULL,
	[FechaCrea] [datetime] NULL,
	[FechaModifica] [datetime] NULL,
	[UsuarioCrea] [varchar](255) NULL,
	[UsuarioModifica] [varchar](255) NULL,
 CONSTRAINT [PK_Tbl_Vehiculos] PRIMARY KEY CLUSTERED 
(
	[Placa] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbl_ZonasPostales]    Script Date: 02/09/2013 11:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_ZonasPostales](
	[ZonaPostal] [smallint] NOT NULL,
	[NombreZona] [nvarchar](50) NULL,
 CONSTRAINT [Tbl_ZonasPostales$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[ZonaPostal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_VisitasPaciente]    Script Date: 02/09/2013 11:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_VisitasPaciente](
	[IdVisita] [int] NOT NULL,
	[Paciente] [varchar](20) NOT NULL,
	[Visitante] [varchar](20) NOT NULL,
	[Historial] [int] NOT NULL,
	[FechaIngreso] [date] NULL,
	[HoraIngreso] [time](7) NULL,
	[FechaSalida] [date] NULL,
	[HoraSalida] [time](7) NULL,
	[Estado] [char](1) NULL,
	[Observaciones] [text] NULL,
	[FechaCrea] [date] NULL,
	[FechaModifica] [date] NULL,
	[UsuarioCrea] [varchar](255) NULL,
	[UsuarioModifica] [varchar](255) NULL,
 CONSTRAINT [PK_Tbl_VisitasPaciente] PRIMARY KEY CLUSTERED 
(
	[IdVisita] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbl_Visitas]    Script Date: 02/09/2013 11:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_Visitas](
	[Consecutivo] [int] IDENTITY(1,1) NOT NULL,
	[IdVisitante] [float] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[RecibeVisita] [float] NULL,
	[MotivoVisita] [text] NULL,
	[ElementosIngresa] [text] NULL,
	[StsActividad] [char](1) NULL,
	[FechaInicial] [datetime] NULL,
	[HoraInicial] [datetime] NULL,
	[FechaFinal] [datetime] NULL,
	[HoraFinal] [datetime] NULL,
	[DuracionVisita] [varchar](45) NULL,
	[IdUsuario] [int] NULL,
	[area] [int] NULL,
	[Seguimiento] [varchar](100) NULL,
	[ConfirmaSalidaEquipos] [bit] NULL,
	[CitaProgramada] [bit] NULL,
	[CodigosBarras] [text] NULL,
	[Proveedor] [float] NULL,
	[FechaCrea] [datetime] NULL,
	[FechaModifica] [datetime] NULL,
	[UsuarioCrea] [nvarchar](50) NULL,
	[UsuarioModifica] [nvarchar](50) NULL,
 CONSTRAINT [PK_Tbl_Visitas] PRIMARY KEY CLUSTERED 
(
	[Consecutivo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[VerificarVisitanteVehiculo]    Script Date: 02/09/2013 11:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Margarita Hoyos
-- Create date: 01-Jul-2011
-- Description:	Verifica si un visitante ingresó cno
-- vehiculo
-- =============================================
CREATE PROCEDURE [dbo].[VerificarVisitanteVehiculo]
	
	@Fecha date,
	@DocVisitante varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT Tbl_MarcacionesVehiculos.IdMarcacion, Tbl_MarcacionesVehiculos.IdVehiculo 
	FROM Tbl_MarcacionesVehiculos
	WHERE	FechaInicio = @Fecha AND Estado = 'E' AND 
			Documento = @DocVisitante
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateQuery]    Script Date: 02/09/2013 11:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateQuery]
(
	@DigitoVerificacion smallint,
	@Sigla varchar(50),
	@Nombre varchar(255),
	@DireccionCorrespondencia varchar(100),
	@Ciudad int,
	@ZonaPostal int,
	@TelOficina varchar(50),
	@Extension varchar(50),
	@TelCasa varchar(50),
	@Celular varchar(50),
	@Foto varbinary(MAX),
	@CodigoPersoneriaJuridica int,
	@RepresentanteLegal varchar(50),
	@Cedula_RepLegal varchar(20),
	@CodigoRegimenIva smallint,
	@CodigoContribuyente smallint,
	@Autoretenedor bit,
	@DireccioneElectronica varchar(50),
	@ReferenciaComercial varchar(50),
	@ContactoRefComercial varchar(50),
	@TelRefComercial varchar(50),
	@ReferenciaBancaria varchar(50),
	@CuentaBancaria varchar(30),
	@ReferenciaPersonal varchar(50),
	@TelRefPersonal varchar(50),
	@RetienexIca bit,
	@UsuarioModifica varchar(50),
	@FechaModifica datetime,
	@Id_Tercero bigint
)
AS
	SET NOCOUNT OFF;
UPDATE       Tbl_Terceros
SET                DigitoVerificacion = @DigitoVerificacion, Sigla = @Sigla, Nombre = @Nombre, DireccionCorrespondencia = @DireccionCorrespondencia, Ciudad = @Ciudad, 
                         ZonaPostal = @ZonaPostal, TelOficina = @TelOficina, Extension = @Extension, TelCasa = @TelCasa, Celular = @Celular, Foto = @Foto, 
                         CodigoPersoneriaJuridica = @CodigoPersoneriaJuridica, RepresentanteLegal = @RepresentanteLegal, Cedula_RepLegal = @Cedula_RepLegal, 
                         CodigoRegimenIva = @CodigoRegimenIva, CodigoContribuyente = @CodigoContribuyente, Autoretenedor = @Autoretenedor, 
                         DireccioneElectronica = @DireccioneElectronica, ReferenciaComercial = @ReferenciaComercial, ContactoRefComercial = @ContactoRefComercial, 
                         TelRefComercial = @TelRefComercial, ReferenciaBancaria = @ReferenciaBancaria, CuentaBancaria = @CuentaBancaria, 
                         ReferenciaPersonal = @ReferenciaPersonal, TelRefPersonal = @TelRefPersonal, RetienexIca = @RetienexIca, UsuarioModifica = @UsuarioModifica, 
                         FechaModifica = @FechaModifica
WHERE        (Id_Tercero = @Id_Tercero)
GO
/****** Object:  StoredProcedure [dbo].[UpdateFingerPrint]    Script Date: 02/09/2013 11:13:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateFingerPrint]
(
	@Huella varbinary(MAX),
	@Id_Tercero bigint
)
AS
	SET NOCOUNT OFF;
UPDATE       Tbl_Terceros
SET                Huella = @Huella
WHERE        (Id_Tercero = @Id_Tercero)
GO
/****** Object:  StoredProcedure [dbo].[pruebaobtieneVisitas_x_Funcionario]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Marisol 
-- Create date: 17-Noviembre-2009
-- Description:	
-- ==================================================
CREATE PROCEDURE [dbo].[pruebaobtieneVisitas_x_Funcionario]
	
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here

		SELECT     Tbl_AgendaVisitasFuncionario.IdFuncionario, Tbl_AgendaVisitasFuncionario.Fecha, Tbl_AgendaVisitasFuncionario.Hora, 
                   Tbl_AgendaVisitasFuncionario.IdVisitante,Tbl_AgendaVisitasFuncionario.Estado, Tbl_AgendaVisitasFuncionario.Motivo, Tbl_Personas.NomFuncionario, Tbl_Personas.ApeFuncionario,Tbl_AgendaVisitasFuncionario.csc,Tbl_Personas.Celular,Tbl_Personas.eMail,Tbl_Personas.contratista
		FROM       Tbl_AgendaVisitasFuncionario INNER JOIN
                   Tbl_Personas ON Tbl_AgendaVisitasFuncionario.IdVisitante = Tbl_Personas.IdPersona
END
GO
/****** Object:  StoredProcedure [dbo].[getNumeroNuevaSede]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos
-- Create date: 28-Mayo-2009
-- Description:	Obtiene un numero valido para 
-- registrar una nueva sede
-- ==================================================
CREATE PROCEDURE [dbo].[getNumeroNuevaSede]
	
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT MAX([NumeroSede]) + 1 Numero
	FROM  [dbo].[Tbl_Sedes]
END
GO
/****** Object:  Table [dbo].[Tbl_TagsxVehiculo]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_TagsxVehiculo](
	[IdTag] [varchar](255) NOT NULL,
	[IdVehiculo] [varchar](10) NOT NULL,
	[Consecutivo] [int] NOT NULL,
	[Estado] [char](1) NULL,
	[FechaCrea] [datetime] NULL,
	[FechaModifica] [datetime] NULL,
	[UsuarioCrea] [varchar](255) NULL,
	[UsuarioModifica] [varchar](255) NULL,
 CONSTRAINT [PK_Tbl_TagsxVehiculo] PRIMARY KEY CLUSTERED 
(
	[IdTag] ASC,
	[IdVehiculo] ASC,
	[Consecutivo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbl_PermisosxAreas]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_PermisosxAreas](
	[Dependencia] [int] NOT NULL,
	[Tag] [varchar](255) NOT NULL,
	[TipoPermiso] [char](1) NULL,
	[FrecuenciaReconocimiento] [time](7) NULL,
	[FechaInicial] [date] NULL,
	[FechaFinal] [date] NULL,
	[UsuarioCrea] [nvarchar](50) NULL,
	[UsuarioModifica] [nvarchar](50) NULL,
	[FechaCrea] [date] NULL,
	[FechaModifica] [date] NULL,
 CONSTRAINT [PK_Tbl_PermisosxAreas_1] PRIMARY KEY CLUSTERED 
(
	[Dependencia] ASC,
	[Tag] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbl_MenusxPerfil]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_MenusxPerfil](
	[idMenu] [int] NOT NULL,
	[idPerfil] [int] NOT NULL,
 CONSTRAINT [PK_Tbl_MenusxPerfil] PRIMARY KEY CLUSTERED 
(
	[idMenu] ASC,
	[idPerfil] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Lectores_x_Area]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Lectores_x_Area](
	[Area] [int] NOT NULL,
	[Lector] [int] NOT NULL,
 CONSTRAINT [PK_Tbl_Lectores_x_Area] PRIMARY KEY CLUSTERED 
(
	[Area] ASC,
	[Lector] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_usuarios]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_usuarios](
	[IdUsuario] [int] NOT NULL,
	[login] [nvarchar](255) NULL,
	[nombre] [nvarchar](255) NOT NULL,
	[passwd] [nvarchar](255) NULL,
	[perfil] [int] NOT NULL,
	[activo] [bit] NULL,
	[tpoDocumento] [int] NOT NULL,
	[documento] [int] NULL,
	[direccion] [nvarchar](255) NULL,
	[telefono] [nvarchar](255) NULL,
	[correo] [nvarchar](255) NULL,
	[usrCrea] [nvarchar](10) NULL,
	[fechaCrea] [datetime] NULL,
	[usrMod] [nvarchar](10) NULL,
	[fechaMod] [datetime] NULL,
 CONSTRAINT [usuarios$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_TagsxVisitante]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_TagsxVisitante](
	[Id] [int] NOT NULL,
	[Visitante] [float] NOT NULL,
	[Tag] [varchar](255) NOT NULL,
	[Fecha] [date] NULL,
	[Estado] [varchar](1) NULL,
	[FechaCrea] [datetime] NULL,
	[FechaModifica] [datetime] NULL,
	[UsuarioCrea] [varchar](255) NULL,
	[UsuarioModifica] [varchar](255) NULL,
 CONSTRAINT [PK_Tbl_TagsxVisitante] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbl_Paises]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Paises](
	[Pais] [smallint] NOT NULL,
	[Nombre] [nvarchar](50) NULL,
	[Continente] [smallint] NULL,
	[Moneda] [nvarchar](50) NULL,
 CONSTRAINT [Tbl_Paises$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[Pais] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_Ciudades]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Ciudades](
	[Ciudad] [int] NOT NULL,
	[NombreCiudad] [nvarchar](50) NULL,
	[Departamento] [int] NULL,
	[CodigoDane] [int] NULL,
 CONSTRAINT [Tbl_Ciudades$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[Ciudad] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_CentrosCosto]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_CentrosCosto](
	[CentroCosto] [int] NOT NULL,
	[CodigoDependencia] [int] NOT NULL,
	[NombreCentroCosto] [nvarchar](50) NULL,
 CONSTRAINT [Tbl_CentrosCosto$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[CentroCosto] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_AutorizadosxEmpresa]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_AutorizadosxEmpresa](
	[Persona] [float] NOT NULL,
	[Proveedor] [float] NOT NULL,
	[Autorizado] [bit] NULL,
	[FechaAutorizacion] [datetime] NULL,
	[NombreAutorizo] [nvarchar](50) NULL,
	[Observacion] [text] NULL,
	[UsuarioCrea] [nvarchar](50) NULL,
	[FechaCrea] [datetime] NULL,
	[UsuarioModifica] [nvarchar](50) NULL,
	[FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_Tbl_AutorizadosxEmpresa] PRIMARY KEY CLUSTERED 
(
	[Persona] ASC,
	[Proveedor] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_AlertasxAreas]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_AlertasxAreas](
	[IdAlerta] [int] NOT NULL,
	[Dependencia] [int] NOT NULL,
	[Lector] [int] NOT NULL,
	[IdPersona] [varchar](50) NULL,
	[FechaAlerta] [datetime] NULL,
	[Estado] [char](1) NULL,
	[UsuarioCrea] [varchar](50) NULL,
	[UsuarioModifica] [varchar](50) NULL,
	[FechaCrea] [date] NULL,
	[FechaModifica] [date] NULL,
 CONSTRAINT [PK_Tbl_AlertasxAreas] PRIMARY KEY CLUSTERED 
(
	[IdAlerta] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[SelectFingerPrint]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectFingerPrint]
(
	@Id_Tercero bigint
)
AS
	SET NOCOUNT ON;
SELECT        Huella
FROM            Tbl_Terceros
WHERE        (Id_Tercero = @Id_Tercero)
GO
/****** Object:  StoredProcedure [dbo].[RegistrarVisitaPaciente]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyod
-- Create date: 18-Marzo-2011
-- Description:	Registra Visita a Pacientes
-- ==================================================
CREATE PROCEDURE [dbo].[RegistrarVisitaPaciente]
	@IdVisita int,
	@Paciente varchar(20),
	@Visitante varchar(20),
	@Historial int,
	@FechaIngreso date,
	@HoraIngreso time(7),
	@Estado char(1),
	@Observaciones text,
	@UsuarioCrea varchar(255)

AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    
	BEGIN
		INSERT INTO [dbo].[Tbl_VisitasPaciente](
			[IdVisita],
			[Paciente],
			[Visitante],
			[Historial],
			[FechaIngreso],
			[HoraIngreso],
			[Estado],
			[Observaciones],
			[UsuarioCrea],
			[FechaCrea]
		)
		VALUES(
			@IdVisita,
			@Paciente,
			@Visitante,
			@Historial,
			@FechaIngreso,
			@HoraIngreso,
			@Estado,
			@Observaciones,
			@UsuarioCrea,
			GETDATE()
		)
	END  
	    
	
END
GO
/****** Object:  StoredProcedure [dbo].[RegistrarVisitantePaciente]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================
-- Author:		Margarita Hoyos
-- Create date: 18-Marzo-2011
-- Description:	Crea el registro de un visitante
-- ================================================
CREATE PROCEDURE [dbo].[RegistrarVisitantePaciente]
	@Identificacion varchar(20),
	@Nombre varchar(255),
	@Huella varbinary(max),
	@Foto varbinary(max),
	@UsuarioCrea varchar(255)
AS
BEGIN

	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [dbo].[Tbl_VisitantePaciente] (
		[Identificacion],
		[Nombre],
		[Huella],
		[Foto],
		[FechaCrea],
		[UsuarioCrea]
	)
	VALUES(@Identificacion,@Nombre,@Huella,@Foto,GETDATE(),@UsuarioCrea)

END
GO
/****** Object:  StoredProcedure [dbo].[obtieneDatos_CorreoEmpresa]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Marisol 
-- Create date: 06-Sep-2010
-- Description:	Se obtiene la configuración del correo 
-- de la empresa para el envio de correo desde la agenda
-- ==================================================
CREATE PROCEDURE [dbo].[obtieneDatos_CorreoEmpresa]
@idCorreoEmpresa int

AS
BEGIN
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	SELECT     DeCorreoEmpresa, Nombre, Usuario, Clave, Asunto, smtp, puerto, Firma
	FROM       Tbl_CorreoEmpresa
	WHERE	   IdCorreoEmpresa=@idCorreoEmpresa

END
GO
/****** Object:  StoredProcedure [dbo].[obtenerVisitasAgendaFuncionario]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Marisol 
-- Create date: 17-Noviembre-2009
-- Description:	
-- ==================================================
CREATE PROCEDURE [dbo].[obtenerVisitasAgendaFuncionario]
	@IdFuncionario bigint,
	@Fecha date,
	@Hora time(7)
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here

		BEGIN
			SELECT  IdFuncionario,Fecha,Hora,csc,IdVisitante
			FROM	Tbl_AgendaVisitasFuncionario
			WHERE IdFuncionario=@IdFuncionario AND Fecha=@Fecha AND Hora= @Hora
		END
END
GO
/****** Object:  StoredProcedure [dbo].[prcActualizarVisita]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos
-- Create date: 14-Julio-2009
-- Description:	Obtiene de la visita realizada por
-- una persona
-- ==================================================
CREATE PROCEDURE [dbo].[prcActualizarVisita]
	@intId bigint,
	@fecha date,
	@horaFin time,
	@salidaEquipos bit
	
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[Tbl_Visitas]
     SET  [StsActividad] = 'S', [HoraFinal] = @horaFin, [ConfirmaSalidaEquipos] = @salidaEquipos
  WHERE [StsActividad] = 'E' AND [IdVisitante]= @intId AND [Fecha] = @fecha
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerVisitanteSinTag]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Margarita Hoyos
-- Create date: 17-Dic-2011
-- Description:	Obtiene los Visitantes a los que
-- no se les ha asignado un Tag RFID
-- =============================================
CREATE PROCEDURE [dbo].[ObtenerVisitanteSinTag]
	@Fecha date
AS

BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT [IdPersona] Documento, [NomFuncionario]+ ' ' +[ApeFuncionario] Visitante, [Fecha]
	FROM [Tbl_Personas], [Tbl_Visitas]
	WHERE [Tbl_Visitas].[IdVisitante] = [Tbl_Personas].[IdPersona] 
		AND [Tbl_Visitas].[StsActividad] = 'E' AND [Tbl_Visitas].[Fecha] = @Fecha
		AND [IdPersona] NOT IN (SELECT [Tbl_TagsxVisitante].[Visitante] 
								FROM Tbl_TagsxVisitante 
								WHERE  [Tbl_TagsxVisitante].[Fecha] = @Fecha )
	ORDER BY [Tbl_Visitas].[HoraInicial] DESC

END
GO
/****** Object:  StoredProcedure [dbo].[obtenerTipoLectorMouse]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos
-- Create date: 24-Agosto-2009
-- Description:	
-- ==================================================
CREATE PROCEDURE [dbo].[obtenerTipoLectorMouse]
	
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [Tbl_Lectores].[TipoLector]
	FROM [Tbl_Lectores]
	WHERE [Tbl_Lectores].[NumeroLector] = 0
END
GO
/****** Object:  StoredProcedure [dbo].[obtenerTemplatesByUserID]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ===============================================
-- Author:		Marisol
-- Create date: 18-Jun-2009
-- Description:	Obtiene id de usuario de la tabla template
-- hijas
-- ===============================================
CREATE PROCEDURE [dbo].[obtenerTemplatesByUserID]
	@UserId bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	SELECT userID,fingerID 
	FROM Tbl_Templates
	WHERE userID=@UserId
END
GO
/****** Object:  StoredProcedure [dbo].[obtenerTblPermisosUsuario]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Margarita Hoyos
-- Create date: 28-Enero-2009
-- Description:	obtiene los datos de la Tbl_PermisosUsuarios
-- =============================================
CREATE PROCEDURE [dbo].[obtenerTblPermisosUsuario]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT [idPermiso],[Tbl_PerfilesUsuarios].[nmb] Perfil, [Tbl_Menus].[Descripcion] Menu,[Tbl_Interfaces].[Descripcion] Interfaz, 
			[ver] Ver, [adic] Adicionar, [upd] Actualizar, [dro] Eliminar
    FROM [Tbl_PermisosUsuarios], [Tbl_Interfaces], [Tbl_Menus],[Tbl_PerfilesUsuarios]
    WHERE [Tbl_Interfaces].[InterfasId] = [iui] AND [Tbl_Menus].[MenuId] = [Tbl_Interfaces].[Menu]
			AND [Tbl_PerfilesUsuarios].[idPerfil] = [Tbl_PermisosUsuarios].[perf]
    ORDER BY [Tbl_PerfilesUsuarios].[nmb]
END
GO
/****** Object:  StoredProcedure [dbo].[obtenerTblPerfiles]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Margarita Hoyos
-- Create date: 15-Abril-2009
-- Description:	obtiene la Tbl perfiles
-- =============================================
CREATE PROCEDURE [dbo].[obtenerTblPerfiles]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT [idPerfil] Id, [nmb] Perfil
    FROM [dbo].[Tbl_PerfilesUsuarios]
    ORDER BY [Tbl_PerfilesUsuarios].[idPerfil]

END
GO
/****** Object:  StoredProcedure [dbo].[prcRegistrarPersona]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos
-- Create date: 14-Julio-2009
-- Description:	Guarda el registro de una persona
-- ==================================================
CREATE PROCEDURE [dbo].[prcRegistrarPersona]
	@idPersona float,
	@codigo int,
	@Empresa varchar(max), 
	@nombre varchar(max),
	@apellido varchar(max),
	@foto varbinary(max),
	@telefono int,
	@contratista bit,
	@vigencia date,
	@observaciones varchar(max),
	@celular float
	
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    INSERT INTO [dbo].[Tbl_Personas]
    ([IdPersona]
    ,[CodEmpleado]
    ,[Empresa]
    ,[NomFuncionario]
    ,[ApeFuncionario]
    ,[Foto]
    ,[TelCasa]
    ,[contratista]
    ,[fechavigenciaARP]
    ,[Observaciones]
    ,[Celular]
    )
    VALUES
    (@idPersona
    ,@codigo
    ,@Empresa
    ,@nombre
    ,@apellido
    ,@foto
    ,@telefono
    ,@contratista
    ,@vigencia
    ,@observaciones
    ,@celular
    )
END
GO
/****** Object:  StoredProcedure [dbo].[prcRegistrarHuellaDigital]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Margarita Hoyos
-- Create date: 24-Ago-2008
-- Description:	Registra la huella de un usuario en
-- tomada con el lector Digital persona
-- =============================================
CREATE PROCEDURE [dbo].[prcRegistrarHuellaDigital]
	@idUsuario bigint,
	@idDedo int,
	@huella varbinary(max)
AS
BEGIN

	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO  [dbo].[Tbl_Templates]
           ([userID]
           ,[fingerID]
           ,[HuellaDigital]
           ,[FechaCrea])
     VALUES
           (@idUsuario
           ,@idDedo
           ,@huella
           ,GETDATE())

END
GO
/****** Object:  StoredProcedure [dbo].[prcRegistrarHuella]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Diego Guevara
-- Create date: 17-Nov-2008
-- Description:	Crea un nuevo usuario de la app
-- =============================================
CREATE PROCEDURE [dbo].[prcRegistrarHuella]
	@idUsuario bigint,
	@idDedo int,
	@template text
AS
BEGIN

	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO  [dbo].[Tbl_Templates]
           ([userID]
           ,[fingerID]
           ,[template1]
           ,[FechaCrea])
     VALUES
           (@idUsuario
           ,@idDedo
           ,@template
           ,GETDATE())

END
GO
/****** Object:  StoredProcedure [dbo].[prcCrearInicioVisita]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Margarita Hoyos
-- Create date: 14-Julio-2009
-- Description:	Crea inicio de visita
-- =============================================
CREATE PROCEDURE [dbo].[prcCrearInicioVisita]
	@idVisitante float,
	@funcionario bigint, 
	@fecha date, 
	@motivo text, 
	@elementos text, 
	@actividad As Char, 
	@fechaIn date, 
	@fechaFin date,
	@horaIn time, 
	@horaFin time, 
	@area int,
	@NombreLector varchar(100),
	@IdUsuario int,
	@UsuarioCrea nvarchar(50),
	@CodigosBarras text,
	@Proveedor bigint
	
AS
BEGIN

	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO  [dbo].[Tbl_Visitas]
           ([IdVisitante]
           ,[RecibeVisita]
           ,[Fecha]
           ,[MotivoVisita]
           ,[ElementosIngresa]
           ,[StsActividad]
           ,[FechaInicial]
           ,[FechaFinal]
           ,[HoraInicial]
           ,[HoraFinal]
           ,[area]
           ,[Seguimiento]
           ,[IdUsuario]
           ,[FechaCrea]
           ,[UsuarioCrea]
           ,[CodigosBarras]
           ,[Proveedor])
     VALUES
           (@idVisitante
           ,@funcionario
           ,@fecha
           ,@motivo
           ,@elementos
           ,@actividad
           ,@fechaIn
           ,@fechaFin
           ,@horaIn
           ,@horaFin
           ,@area
           ,@NombreLector
           ,@IdUsuario
           , GETDATE()
           ,@UsuarioCrea
           ,@CodigosBarras
           ,@Proveedor)

END
GO
/****** Object:  StoredProcedure [dbo].[prcCrearFuncionario]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================
-- Author:		Margarita Hoyos
-- Create date: 15-Mayo-2009
-- Description:	Crea un funcionario
-- ================================================
CREATE PROCEDURE [dbo].[prcCrearFuncionario]
@idEmpresa int,
@activo bit,
@sede int,
@nombre varchar(max),
@apellido varchar(max),
@documento bigint,
@codigo int,
@CodigoDependencia as int
AS
BEGIN

	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [TimeAccess].[dbo].[Tbl_Funcionarios] (
		[Empresa]
		,[Activo]
		,[NumeroSede]
		,[NomFuncionario]
		,[ApeFuncionario]
		,[IdFuncionario]
		,[CodEmpleado]
		,[CodigoDependencia] )
	VALUES(
		@idEmpresa
		,@activo
		,@sede
		,@nombre
		,@apellido
		,@documento
		,@codigo
		,@CodigoDependencia)

END
GO
/****** Object:  StoredProcedure [dbo].[prcValidarExisteEntrada]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Diego Guevara
-- Create date: 17-Nov-2008
-- Description:	Valida un usuario, teniendo en
-- cuenta su login y password
-- =============================================
CREATE PROCEDURE [dbo].[prcValidarExisteEntrada]
	
	@Fecha date,
	@Placa varchar(10),
	@Empresa Int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT COUNT(IdMarcacion) As Cantidad
	FROM Tbl_MarcacionesVehiculos
	WHERE	FechaInicio = @Fecha AND 
			Estado = 'E' AND 
			IdVehiculo = @Placa AND
			IdEmpresa = @Empresa
END
GO
/****** Object:  StoredProcedure [dbo].[asignarTagxVisitante]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos 
-- Create date: 24-Agosto-2011
-- Description:	
-- ==================================================
CREATE PROCEDURE [dbo].[asignarTagxVisitante]
	@Id int,
	@IdTag varchar(255),
	@IdVisitante float,
	@Fecha date,
	@UsuarioCrea varchar(255),
	@UsuarioModifica varchar(255)
	
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [Tbl_TagsxVisitante] 
	VALUES(
	@Id, 
	@IdVisitante,
	@IdTag,
	@Fecha,
	'',
	GETDATE(),
	GETDATE(),
	@UsuarioCrea,
	@UsuarioModifica)
END
GO
/****** Object:  StoredProcedure [dbo].[adicionaVisitas_x_Funcionario]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Marisol 
-- Create date: 17-Noviembre-2009
-- Description:	
-- ==================================================
CREATE PROCEDURE [dbo].[adicionaVisitas_x_Funcionario]
	@IdFuncionario bigint,
	@Fecha date,
	@Hora time(7),
	@IdVisitante bigint,
	@Motivo text,
	@NomPersona nvarchar(50),
	@ApePersona nvarchar(50),
	@celular float,
	@email nvarchar(50),
	@estado nvarchar(50),
	@contratista bit,
	@idUsuario int
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		IF NOT EXISTS (SELECT * FROM Tbl_AgendaVisitasFuncionario WHERE IdFuncionario=@IdFuncionario AND Fecha=@Fecha AND Hora=@Hora)
		BEGIN
			BEGIN
				IF EXISTS(SELECT IdPersona, NomFuncionario, ApeFuncionario FROM Tbl_Personas WHERE (IdPersona = @IdVisitante) )
				BEGIN 
					UPDATE Tbl_Personas SET NomFuncionario=@NomPersona,ApeFuncionario=@ApePersona,Celular=@celular,eMail=@email,contratista=@contratista ,FechaModifica=GETDATE()
					WHERE IdPersona=@IdVisitante
				END
				ELSE
				BEGIN
					INSERT INTO Tbl_Personas (IdPersona,NomFuncionario,ApeFuncionario,Celular,eMail,contratista,CodEmpleado,FechaCrea) VALUES(@IdVisitante,@NomPersona,@ApePersona,@celular,@email,@contratista,(SELECT isnull((Max(Tbl_Personas.CodEmpleado)+1),1) codigo FROM Tbl_Personas ),GETDATE())
				END
			END 

			BEGIN
				INSERT INTO Tbl_AgendaVisitasFuncionario (IdFuncionario,Fecha,Hora,IdVisitante,Motivo,Estado,FechaCrea, IdUsuario) 
				VALUES (@IdFuncionario,@fecha,@hora,@IdVisitante,@motivo,@estado,GETDATE(), @idUsuario)
			END
		END 
	
END
GO
/****** Object:  StoredProcedure [dbo].[AdicionarVehiculo]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================
-- Author:		Margarita Hoyos
-- Create date: 03-Febrero-2011
-- Description:	Adiciona los datos de un vehiculo
-- ================================================
CREATE PROCEDURE [dbo].[AdicionarVehiculo]
	@placa varchar(10),
	@ciudad int,
	@marca varchar(50),
	@tipoVehiculo varchar(50),
	@modelo varchar(50), 
	@NumeroChasis varchar(50),
	@Color varchar(50),
	@NumeroMotor varchar(50),
	@Foto varbinary(MAX),
	@NombrePropietario varchar(255),
	@Estado char(1),
	@Observacion varchar(255),
	@UsuarioCrea varchar(255)
AS
BEGIN

	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO  [dbo].[Tbl_Vehiculos] (
		[Placa],
		[Ciudad],
		[Marca],
		[TipoVehiculo],
		[Modelo],
		[NumeroChasis],
		[Color],
		[NumeroMotor],
		[Foto],
		[NombrePropietario],
		[Estado],
		[Observacion],
		[FechaCrea],
		[UsuarioCrea]
		) 
		VALUES(
		@placa,
		@ciudad,
		@marca,
		@tipoVehiculo,
		@modelo,
		@NumeroChasis,
		@Color,
		@NumeroMotor,
		@Foto,
		@NombrePropietario,
		@Estado,
		@Observacion,
		GETDATE(),
		@UsuarioCrea)


END
GO
/****** Object:  StoredProcedure [dbo].[adicionarTemplatesByUserID]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ===============================================
-- Author:		Marisol
-- Create date: 19-Jun-2009
-- Description:	Actualizar la Tabla Template
-- hijas
-- ===============================================
CREATE PROCEDURE [dbo].[adicionarTemplatesByUserID]
	@userId bigint,
	@fingerID smallint,
	@template1 varbinary(MAX),
	@template2 varbinary(MAX),
	@template3 varbinary(MAX),
	@usuarioCrea int,
	@fechaCrea date,
	@usuarioModifica int,
	@fechaModifica date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	INSERT INTO Tbl_Templates (userID,fingerID,template1,template2,template3,UsuarioCrea,FechaCrea,UsuarioModifica,FechaModifica) 
	VALUES (@userId,@fingerID,@template1,@template2,@template3,@usuarioCrea,@fechaCrea,@usuarioModifica,@fechaModifica)
END
GO
/****** Object:  StoredProcedure [dbo].[AdicionarSede]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Margarita Hoyos
-- Create date: 29-Enero-2009
-- Description:	Crea un registro en la Tbl_Sedes
-- =============================================
CREATE PROCEDURE [dbo].[AdicionarSede]
	@numero smallint,
	@nombre nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO [dbo].[Tbl_Sedes] VALUES(@numero,@nombre)

END
GO
/****** Object:  StoredProcedure [dbo].[adicionarPermisosUsuario]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Margarita Hoyos
-- Create date: 28-Enero-2009
-- Description:	Crea un registro en la Tbl_PermisosUsuario
-- =============================================
CREATE PROCEDURE [dbo].[adicionarPermisosUsuario]
	@idPermiso int,
	@idInterfaz int,
	@idPerfil int,
	@ver bit,
	@adicionar bit,
	@actualizar bit,
	@eliminar bit,
	@usrCrea int	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO [dbo].[Tbl_PermisosUsuarios](
		[idPermiso],
		[iui],
		[perf],
		[ver],
		[adic],
		[upd],
		[dro],
		[ucr],
		[fcr]) 
	VALUES(
		@idPermiso,
		@idInterfaz,
		@idPerfil,
		@ver,
		@adicionar,
		@actualizar,
		@eliminar,
		@usrCrea,
		GETDATE()
	)

END
GO
/****** Object:  StoredProcedure [dbo].[AdicionarMarcacionVehiculo]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================
-- Author:		Margarita Hoyos
-- Create date: 03-Febrero-2011
-- Description:	Adiciona las marcaciones de los
-- vehiculos
-- ================================================
CREATE PROCEDURE [dbo].[AdicionarMarcacionVehiculo]
	@IdMarcacion int,
	@IdEmpresa int,
	@NmbResponsable varchar(50),
	@ApeResponsable varchar(50),
	@Documento varchar(50),
	@FechaInicio date,
	@HoraInicio time(7), 
	@FechaFin date,
	@HoraFin time(7),
	@IdTag int,
	@IdVehiculo varchar(10),
	@UsuarioCrea varchar(255)
AS
BEGIN

	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO  [dbo].[Tbl_MarcacionesVehiculos] (
		[IdMarcacion],
		[IdEmpresa],
		[Nombre],
		[Apellido],
		[Documento],
		[FechaInicio],
		[HoraInicio],
		[FechaFin],
		[HoraFin],
		[IdTag],
		[IdVehiculo],
		[FechaCrea],
		[UsuarioCrea],
		[Estado]
		) 
		VALUES(
		@IdMarcacion,
		@IdEmpresa,
		@NmbResponsable,
		@ApeResponsable,
		@Documento,
		@FechaInicio,
		@HoraInicio,
		@FechaFin,
		@HoraFin,
		@IdTag,
		@IdVehiculo,
		GETDATE(),
		@UsuarioCrea,
		'E')


END
GO
/****** Object:  StoredProcedure [dbo].[adicionarLector]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos 
-- Create date: 30-Enero-2010
-- Description:	Adiciona un registro en la Tbl_lectores
-- ==================================================
CREATE PROCEDURE [dbo].[adicionarLector]
	@numero int,
	@nombre nvarchar(20),
	@comunicacion nvarchar(50),
	@ip nvarchar(20),
	@serial int,
	@puertoIp int,
	@braudate int
	
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [Tbl_Lectores](NumeroLector, NombreLector,TipoComunicacion,DireccionIP,PuertoSerial, PuertoIp,Baudrate) 
	VALUES(@numero, @nombre, @comunicacion, @ip, @serial, @puertoIp, @braudate)
END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarVisitantePaciente]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Margarita Hoyos
-- Create date: 30-Jun-2011
-- Description:	Actualiza los datos de visitantes a pacientes
-- =============================================
CREATE PROCEDURE [dbo].[ActualizarVisitantePaciente]
	@Documento varchar(20),
	@Nombre nvarchar(50),
	@Foto varbinary(max)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE [Tbl_VisitantePaciente] SET [Nombre] = @Nombre, [Foto] = @Foto WHERE [Identificacion] = @Documento

END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarSede]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Margarita Hoyos
-- Create date: 29-Enero-2009
-- Description:	Actualiza un registro en la Tbl_Sedes
-- =============================================
CREATE PROCEDURE [dbo].[ActualizarSede]
	@numero smallint,
	@nombre nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE [Tbl_Sedes] SET [Sede] = @nombre WHERE [NumeroSede] = @numero

END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarPerfil]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Margarita Hoyos
-- Create date: 01-Febrero-2010
-- Description:	Actualiza un perfil de usuario
-- =============================================
CREATE PROCEDURE [dbo].[ActualizarPerfil]
	@id int,
	@perfil nvarchar(255)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE [Tbl_PerfilesUsuarios] SET [nmb] = @perfil WHERE [idPerfil] = @id

END
GO
/****** Object:  StoredProcedure [dbo].[actualizarLector]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos 
-- Create date: 30-Enero-2010
-- Description:	Actualiza un registro en la Tbl_lectores
-- ==================================================
CREATE PROCEDURE [dbo].[actualizarLector]
	@numero int,
	@nombre nvarchar(20),
	@comunicacion nvarchar(50),
	@ip nvarchar(20),
	@serial int,
	@puertoIp int,
	@braudate int
	
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[Tbl_Lectores] SET 
	[NombreLector] = @nombre, [TipoComunicacion] = @comunicacion,
	[DireccionIP] = @ip, [PuertoSerial]=@serial, [PuertoIp] = @puertoIp, [Baudrate] = @braudate
	WHERE [NumeroLector] = @numero
END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarEstadoVisitaPaciente]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos
-- Create date: 23-Marzo-2011
-- Description:	Actualiza el estado de una visita a
-- un paciente
-- ==================================================
CREATE PROCEDURE [dbo].[ActualizarEstadoVisitaPaciente]
	@IdVisita int,
	@FechaSalida date,
	@HoraSalida time(7),
	@Estado char(1),
	@UsuarioModifica varchar(255)

AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    
	BEGIN
		UPDATE [dbo].[Tbl_VisitasPaciente]
		SET [Estado] = @Estado, [FechaSalida] = @FechaSalida, [HoraSalida] = @HoraSalida,
			[UsuarioModifica] = @UsuarioModifica, [FechaModifica] = GETDATE()
		WHERE [IdVisita] = @IdVisita
	END  
	    
	
END
GO
/****** Object:  StoredProcedure [dbo].[actualizarEstadoTag]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos 
-- Create date: 24-Agosto-2014
-- Description:	Actualiza el estado de un tag rfid
-- ==================================================
CREATE PROCEDURE [dbo].[actualizarEstadoTag]
	@IdTag varchar(255),
	@Estado varchar(1),
	@UsuarioModifica varchar(255)
	
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[Tbl_Tags] SET 
	[Estado] = @Estado, [UsuarioModifica] = @UsuarioModifica
	WHERE [IdTag] = @IdTag
END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarEstadoMarcacionVehiculo]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================
-- Author:		Margarita Hoyos
-- Create date: 08-Febrero-2011
-- Description:	Actualiza el estado de una marcación
-- de un vehículo
-- ================================================
CREATE PROCEDURE [dbo].[ActualizarEstadoMarcacionVehiculo]
	@IdMarcacion int,
	@Estado char(1),
	@HoraSalida time(7),
	@UsuarioModifica varchar(255)
AS
BEGIN

	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[Tbl_MarcacionesVehiculos] SET 
		[Estado] = @Estado, [HoraFin] = @HoraSalida,[UsuarioModifica] = @UsuarioModifica, [FechaModifica] = GETDATE()
	WHERE [IdMarcacion] = @IdMarcacion

END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarEmpresa]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================
-- Author:		Margarita Hoyos
-- Create date: 29-Enero-2010
-- Description:	Actualiza los datos de una empresa
-- ================================================
CREATE PROCEDURE [dbo].[ActualizarEmpresa]
	@idTercero int,
	@digito int,
	@direccion nvarchar(50),
	@observaciones varchar(max),
	@Empresa nvarchar(50), 
	@ciudad int,
	@telefono nvarchar(50),
	@AA nvarchar(50),
	@fax nvarchar(50),
	@representante nvarchar(50),
	@lector bit
AS
BEGIN

	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE  [dbo].[Tbl_Empresa] SET
		[DigitoVerificacion] = @digito,
		[DireccionCorrespondencia] = @direccion,
		[Observaciones] = @observaciones,
		[NombreEmpresa] = @Empresa,
		[Ciudad] = @ciudad,
		[TelOficina] = @telefono,
		[ApartadoAereo] = @AA,
		[Fax] = @fax,
		[RepresentanteLegal] = @representante,
		[LectorMouse] = @lector

	WHERE [Id_Tercero] = @idTercero

END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarDependencia]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Margarita Hoyos
-- Create date: 30-Enero-2009
-- Description:	Actualiza un registro en la Tbl_Dependencias
-- =============================================
CREATE PROCEDURE [dbo].[ActualizarDependencia]
	@codigo int,
	@nombre nvarchar(50),
	@clase nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    UPDATE [Tbl_Dependencias] SET [Dependencia] = @nombre, [ClaseDependencia] = @clase WHERE [CodigoDependencia] = @codigo

END
GO
/****** Object:  StoredProcedure [dbo].[adicionaFuncionarios_x_Usuario]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Marisol 
-- Create date: 26-Noviembre-2009
-- Description:	Adiciona Funcionarios por Usuario
-- ==================================================
CREATE PROCEDURE [dbo].[adicionaFuncionarios_x_Usuario]
@IdUsuario int,
@IdFuncionario bigint

AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		INSERT INTO Tbl_Funcionarios_x_Usuario (IdUsuario,IdFuncionario,FechaCrea) VALUES (@IdUsuario,@IdFuncionario,GETDATE())
            
END
GO
/****** Object:  StoredProcedure [dbo].[actualizaDatos_CorreoEmpresa]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Marisol 
-- Create date: 06-Sep-2010
-- Description:	Actualiza la configuración del correo 
-- de la empresa para el envio de correo desde la agenda
-- ==================================================
CREATE PROCEDURE [dbo].[actualizaDatos_CorreoEmpresa]
@idCorreoEmpresa int,
@de as nvarchar(50),
@nombre as nvarchar(50),
@usuario as nvarchar(50),
@clave as nvarchar(50),
@asunto as nvarchar(50),
@smtp as nvarchar(50),
@puerto as int,
@firma as nvarchar(50)


AS
BEGIN
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	UPDATE  Tbl_CorreoEmpresa 
		SET DeCorreoEmpresa=@de
			,Nombre=@nombre 
			,Usuario=@de
			,Clave=@clave
			,Asunto=@asunto
			,smtp=@smtp
			,puerto=@puerto
			,Firma=@firma
	WHERE IdCorreoEmpresa=@idCorreoEmpresa
END
GO
/****** Object:  StoredProcedure [dbo].[adicionaDatos_CorreoEmpresa]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Marisol 
-- Create date: 06-Sep-2010
-- Description:	Adiciona la configuración del correo 
-- de la empresa para el envio de correo desde la agenda
-- ==================================================
CREATE PROCEDURE [dbo].[adicionaDatos_CorreoEmpresa]
@idCorreoEmpresa int,
@de as nvarchar(50),
@nombre as nvarchar(50),
@usuario as nvarchar(50),
@clave as nvarchar(50),
@asunto as nvarchar(50),
@smtp as nvarchar(50),
@puerto as int,
@firma as nvarchar(50)


AS
BEGIN
	SET NOCOUNT ON;
    -- Insert statements for procedure here
	INSERT INTO  Tbl_CorreoEmpresa (IdCorreoEmpresa,DeCorreoEmpresa, Nombre, Usuario, Clave, Asunto, smtp, puerto, Firma) 
	VALUES (@idCorreoEmpresa,@de,@nombre,@de,@clave,@asunto,@smtp,@puerto,@firma)

END
GO
/****** Object:  StoredProcedure [dbo].[eliminaFuncionarios_x_Usuario]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Marisol 
-- Create date: 26-Noviembre-2009
-- Description:	Elimina de la tabla Tbl_Funcionarios_x_Usuario los Funcionarios asignados a un Usuario
-- ==================================================
CREATE PROCEDURE [dbo].[eliminaFuncionarios_x_Usuario]
@IdUsuario int,
@IdFuncionario bigint

AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		DELETE 
		FROM Tbl_Funcionarios_x_Usuario
		WHERE IdUsuario=@IdUsuario AND IdFuncionario=@IdFuncionario
            
END
GO
/****** Object:  StoredProcedure [dbo].[AdicionarEmpresa]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================
-- Author:		Margarita Hoyos
-- Create date: 29-Enero-2010
-- Description:	Adiciona los datos de una empresa
-- ================================================
CREATE PROCEDURE [dbo].[AdicionarEmpresa]
	@idTercero int,
	@digito int,
	@direccion nvarchar(50),
	@observaciones varchar(max),
	@Empresa nvarchar(50), 
	@ciudad int,
	@telefono nvarchar(50),
	@AA nvarchar(50),
	@fax nvarchar(50),
	@representante nvarchar(50),
	@lector bit
AS
BEGIN

	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO  [dbo].[Tbl_Empresa] (
		[Id_Tercero],
		[DigitoVerificacion],
		[DireccionCorrespondencia],
		[Observaciones],
		[NombreEmpresa],
		[Ciudad],
		[TelOficina],
		[ApartadoAereo],
		[Fax],
		[RepresentanteLegal],
		[LectorMouse]) 
		VALUES(
		@idTercero,
		@digito,
		@direccion,
		@observaciones,
		@Empresa,
		@ciudad,
		@telefono,
		@AA,
		@fax,
		@representante,
		@lector)


END
GO
/****** Object:  StoredProcedure [dbo].[AdicionarDatosPersonaVisita]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Marisol 
-- Create date: 17-Noviembre-2009
-- Description:	
-- ==================================================
CREATE PROCEDURE [dbo].[AdicionarDatosPersonaVisita]
	@idPersona int,
	@nomPersona nvarchar(50),
	@apePersona nvarchar(50)
	--,@fechaIni datetime,
	--@horaIni datetime,
	--@motivo text
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    IF NOT EXISTS (SELECT Tbl_Personas.IdPersona FROM Tbl_Personas WHERE Tbl_Personas.IdPersona=@idPersona) 
	BEGIN
		BEGIN
			INSERT INTO Tbl_Personas (Tbl_Personas.IdPersona,Tbl_Personas.NomFuncionario,Tbl_Personas.ApeFuncionario) 
			VALUES (@idPersona,@nomPersona,@apePersona)
		END  
	    
		--BEGIN
		--	INSERT INTO Tbl_Visitas (Tbl_Visitas.IdVisitante,Tbl_Visitas.FechaInicial,Tbl_Visitas.HoraInicial,Tbl_Visitas.MotivoVisita,Tbl_Visitas.Fecha)
		--	VALUES (@idPersona,@fechaIni,@horaIni,@motivo,GETDATE())
		--END
	END
END
GO
/****** Object:  StoredProcedure [dbo].[EliminarHuellasVisitante]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Margarita Hoyos
-- Create date: 13-Julio-2011
-- Description:	Elimina las huella del visitante
-- =============================================
CREATE PROCEDURE [dbo].[EliminarHuellasVisitante]
	@IdVisitante float
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DELETE FROM [Tbl_Templates] WHERE [UserID] = @IdVisitante

END
GO
/****** Object:  StoredProcedure [dbo].[getAreaFuncionario]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================
-- Author:		Margarita Hoyos
-- Create date: 04-Dic-2009
-- Description:	Obtiene el area a la que pertenece
-- un funcionario
-- ================================================
CREATE PROCEDURE [dbo].[getAreaFuncionario]
	@IdFuncionario bigint
AS
BEGIN

	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [CodigoDependencia]
	FROM  [dbo].[Tbl_Funcionarios]
	WHERE IdFuncionario = @IdFuncionario

END
GO
/****** Object:  StoredProcedure [dbo].[eliminaVisitas_x_Funcionario]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Marisol 
-- Create date: 17-Noviembre-2009
-- Description:	
-- ==================================================
CREATE PROCEDURE [dbo].[eliminaVisitas_x_Funcionario]
	--@IdFuncionario bigint,
	--@Fecha date,
	--@Hora time(7)
	@csc int
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here

		BEGIN
			DELETE 
			FROM Tbl_AgendaVisitasFuncionario 
			WHERE csc=@csc
		END
END
GO
/****** Object:  StoredProcedure [dbo].[getLectores]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos
-- Create date: 20-Noviembre-2009
-- Description:	Obtiene los lectores registrados
-- ==================================================
CREATE PROCEDURE [dbo].[getLectores]
	
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	  SELECT *
	  FROM  [dbo].[Tbl_Lectores] WHERE [NumeroLector] > 0
	  ORDER BY [NumeroLector] ASC
END
GO
/****** Object:  StoredProcedure [dbo].[getIdVisitante]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================
-- Author:		Margarita Hoyos
-- Create date: 14-Diciembre-2009
-- Description:	Obtiene el id de un visitante de
-- acuerdo a su nombre
-- ================================================
CREATE PROCEDURE [dbo].[getIdVisitante]
@nombre varchar(max)
AS
BEGIN

	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [IdPersona]
	FROM  [dbo].[Tbl_Personas]
	WHERE ([NomFuncionario] + ' ' + [ApeFuncionario])= @nombre 

END
GO
/****** Object:  StoredProcedure [dbo].[getIdUsuarioCreaCita]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos
-- Create date: 04-Dic-2009
-- Description:	Obtiene el Id del Usuario que creo
-- el registro de la cita
-- ==================================================
CREATE PROCEDURE [dbo].[getIdUsuarioCreaCita]
	@csc int
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT IdUsuario
	FROM Tbl_AgendaVisitasFuncionario 
	WHERE [csc] = @csc
END
GO
/****** Object:  StoredProcedure [dbo].[getIdSede]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos
-- Create date: 21-Julio-2009
-- Description:	Obtiene el id de la sede
-- ==================================================
CREATE PROCEDURE [dbo].[getIdSede]
	@nmbSede nvarchar(50) 
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [NumeroSede]
	FROM  [dbo].[Tbl_Sedes]
	WHERE [Sede] = @nmbSede
END
GO
/****** Object:  StoredProcedure [dbo].[getIdPerfil]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Diego Guevara
-- Create date: 22-Noviembre-2008
-- Description:	Obtiene el id del perfil del usuario
-- ==================================================
CREATE PROCEDURE [dbo].[getIdPerfil]
	@PValIdUsuario INT 
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [idPerfil]
  FROM  [dbo].[Tbl_PerfilesUsuarios]
  WHERE [idPerfil] = @PValIdUsuario
END
GO
/****** Object:  StoredProcedure [dbo].[getIdInterfaz]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos
-- Create date: 05-Junio-2009
-- Description:	Obtiene el id de la interfaz
-- ==================================================
CREATE PROCEDURE [dbo].[getIdInterfaz]
	@strDescInterfaz varchar(100)
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [InterfasId]
  FROM [dbo].[Tbl_Interfaces]
  WHERE [Descripcion] = @strDescInterfaz
END
GO
/****** Object:  StoredProcedure [dbo].[getIdFuncionarioRecibeVisita]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos
-- Create date: 11-Dic-2009
-- Description:	Obtiene el id del funcionario al que
-- el recibe visita de una persona
-- ==================================================
CREATE PROCEDURE [dbo].[getIdFuncionarioRecibeVisita]
	@IdVisitante bigint,
	@fecha date
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		SELECT Distinct [RecibeVisita] IdFuncionario
		FROM  [dbo].[Tbl_Visitas]
		WHERE [IdVisitante]= @IdVisitante AND [Fecha] = @fecha
END
GO
/****** Object:  StoredProcedure [dbo].[getIdFuncionario]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================
-- Author:		Margarita Hoyos
-- Create date: 16-Julio-2009
-- Description:	Obtiene el id de un funcionario de
-- acuerdo a su nombre
-- ================================================
CREATE PROCEDURE [dbo].[getIdFuncionario]
@nombre varchar(max)
AS
BEGIN

	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [IdFuncionario]
	FROM  [dbo].[Tbl_Funcionarios]
	WHERE ([NomFuncionario] + ' ' + [ApeFuncionario])= @nombre 

END
GO
/****** Object:  StoredProcedure [dbo].[getIdEmpresa]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos
-- Create date: 27-Mayo-2009
-- Description:	Obtiene el id de la empresa
-- ==================================================
CREATE PROCEDURE [dbo].[getIdEmpresa]
	@nmbEmpresa nvarchar(50) 
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [Id_Tercero]
	FROM  [dbo].[Tbl_Empresa]
	WHERE [NombreEmpresa] = @nmbEmpresa
END
GO
/****** Object:  StoredProcedure [dbo].[getId_x_Codigo]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos
-- Create date: 25-Nov-2009
-- Description:	Obtiene id Visitante mediante el codigo
-- en el lector
-- ==================================================
CREATE PROCEDURE [dbo].[getId_x_Codigo]
	@intCodigo int
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [Tbl_Personas].[IdPersona]
	FROM  [Tbl_Personas]
	WHERE [Tbl_Personas].[CodEmpleado] = @intCodigo
END
GO
/****** Object:  StoredProcedure [dbo].[getHuella]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos
-- Create date: 13-Julio-2009
-- Description:	Obtiene la huella de una persona
-- ==================================================
CREATE PROCEDURE [dbo].[getHuella]
	@intId bigint
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	  SELECT [template1], [HuellaDigital]
	  FROM  [dbo].[Tbl_Personas], [dbo].[Tbl_Templates]
	  WHERE [userID] = [IdPersona] AND [IdPersona]= @intId
END
GO
/****** Object:  StoredProcedure [dbo].[getFuncionario]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Marisol Nieto
-- Create date: 30-Junio-2009
-- Description:	Obtiene datos del funcionario
-- ==================================================
CREATE PROCEDURE [dbo].[getFuncionario]
	@idfuncionario bigint = NULL
AS
BEGIN
	SET NOCOUNT ON;
	
    -- Insert statements for procedure here
    IF @idfuncionario IS NOT NULL
		SELECT IdFuncionario,(NomFuncionario + ' ' + ApeFuncionario) as NmbApe
		FROM Tbl_Funcionarios
		WHERE IdFuncionario=@idfuncionario
    ELSE
		SELECT IdFuncionario,(NomFuncionario + ' ' + ApeFuncionario) as NmbApe
		FROM Tbl_Funcionarios
END
GO
/****** Object:  StoredProcedure [dbo].[getEstadoVisita]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos
-- Create date: 14-Julio-2009
-- Description:	Decide si la visita está registrando
-- su entrada o salida
-- ==================================================
CREATE PROCEDURE [dbo].[getEstadoVisita]
	@intId bigint,
	@fecha date
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [StsActividad]      
  FROM  [dbo].[Tbl_Visitas]
  WHERE [IdVisitante]= @intId AND [Fecha] = @fecha AND [StsActividad] <> '-'
  ORDER BY [Consecutivo] ASC
END
GO
/****** Object:  StoredProcedure [dbo].[getDatosVisita]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos
-- Create date: 14-Julio-2009
-- Description:	Obtiene de la visita realizada por
-- una persona
-- ==================================================
CREATE PROCEDURE [dbo].[getDatosVisita]
	@intId bigint,
	@fecha date
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [MotivoVisita]
      ,[ElementosIngresa]
      ,[StsActividad]
      ,[FechaInicial]
      ,[FechaFinal]
      ,[HoraInicial]
      ,[area]
      ,[RecibeVisita]
      ,[IdUsuario]
      ,[Proveedor]
  FROM  [dbo].[Tbl_Visitas]
  WHERE [StsActividad] = 'E' AND [IdVisitante]= @intId AND [Fecha] = @fecha
  ORDER BY ABS(DATEDIFF(MINUTE, CONVERT(VARCHAR(12), getdate(), 108), [HoraInicial]))
END
GO
/****** Object:  StoredProcedure [dbo].[getDatosFuncionarioVisita]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Marisol 
-- Create date: 17-Noviembre-2009
-- Description:	
-- ==================================================
CREATE PROCEDURE [dbo].[getDatosFuncionarioVisita]
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    
	BEGIN
		SELECT     IdFuncionario, (NomFuncionario + ' ' + ApeFuncionario) as NmbApe
		FROM       Tbl_Funcionarios WHERE Activo = 'True'
	END
END
GO
/****** Object:  StoredProcedure [dbo].[getDatosFuncionario]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================
-- Author:		Margarita Hoyos
-- Create date: 18-Mayo-2009
-- Description:	Obtiene los datos de un funcionario
-- ================================================
CREATE PROCEDURE [dbo].[getDatosFuncionario]
@idFuncionario int,
@codigo int
AS
BEGIN

	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [DireccionCorrespondencia]
	,[Ciudad]
	,[ZonaPostal]
	,[TelCasa]
	,[Celular]
	,[Beeper]
	,[CodigoBeeper]
	,[Fax]
	,[eMail]
	,[ApartadoAereo]
	,[MesCumpleaños]
	,[DiaCumpleaños]
	,[CodigoCargo]
	,[CentroCosto]
	,[Turno]
	,[JefeInmediato]
	,[ClaseContrato]
	,[PorNomina]
	,[PorHoras]
	,[SalarioIntegral]
	,[Observaciones]
	FROM  [dbo].[Tbl_Funcionarios]
	WHERE [IdFuncionario] = @idFuncionario AND [CodEmpleado] = @codigo

END
GO
/****** Object:  StoredProcedure [dbo].[getDatosCitaVisitante]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos
-- Create date: 23-Noviembre-2009
-- Description:	Obtiene los datos de un visitante con
-- cita programada
-- ==================================================
CREATE PROCEDURE [dbo].[getDatosCitaVisitante]
	@IdVisitante bigint,
	@fecha date
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [Tbl_AgendaVisitasFuncionario].* 
	FROM [Tbl_Personas], [Tbl_AgendaVisitasFuncionario] 
	WHERE [Tbl_Personas].[IdPersona] = [Tbl_AgendaVisitasFuncionario].[IdVisitante] AND 
		  [Tbl_Personas].[IdPersona] = @IdVisitante AND [Tbl_AgendaVisitasFuncionario].[Fecha] >= @fecha AND
		  ([Tbl_AgendaVisitasFuncionario].[Estado] = 'PROGRAMADO' OR [Tbl_AgendaVisitasFuncionario].[Estado] = 'CONFIRMADA')		  
	ORDER BY ABS(DATEDIFF(MINUTE, CONVERT(VARCHAR(12), getdate(), 108), [Tbl_AgendaVisitasFuncionario].[Hora]))
END
GO
/****** Object:  StoredProcedure [dbo].[getDatosCita_x_Csc]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos
-- Create date: 23-Noviembre-2009
-- Description:	Obtiene los datos de un visitante con
-- cita programada
-- ==================================================
CREATE PROCEDURE [dbo].[getDatosCita_x_Csc]
	@csc int
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [Tbl_AgendaVisitasFuncionario].* 
	FROM [Tbl_AgendaVisitasFuncionario] 
	WHERE [Tbl_AgendaVisitasFuncionario].[csc] = @csc AND
		  ([Tbl_AgendaVisitasFuncionario].[Estado] = 'PROGRAMADO' OR [Tbl_AgendaVisitasFuncionario].[Estado] = 'CONFIRMADA')
END
GO
/****** Object:  StoredProcedure [dbo].[getCodigoNuevoFunc]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos
-- Create date: 28-Mayo-2009
-- Description:	Obtiene un codigo valido para 
-- registrar a un nuevo funcionario
-- ==================================================
CREATE PROCEDURE [dbo].[getCodigoNuevoFunc]
	
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT MAX([CodEmpleado]) + 1 Codigo
	FROM [TimeAccess].[dbo].[Tbl_Funcionarios]
END
GO
/****** Object:  StoredProcedure [dbo].[getCodigoNuevaPersona]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos
-- Create date: 28-Mayo-2009
-- Description:	Obtiene un codigo valido para 
-- registrar a una nueva persona
-- ==================================================
CREATE PROCEDURE [dbo].[getCodigoNuevaPersona]
	
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT MAX([CodEmpleado]) + 1 Codigo
	FROM [TimeAccess].[dbo].[Tbl_Personas]
END
GO
/****** Object:  StoredProcedure [dbo].[getNombreVisitante]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Marisol 
-- Create date: 17-Noviembre-2009
-- Description:	
-- ==================================================
CREATE PROCEDURE [dbo].[getNombreVisitante]
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    
	BEGIN
		SELECT     IdPersona, NomFuncionario + ' ' + ApeFuncionario AS NmbApeVisitante
		FROM       Tbl_Personas   
	END
END
GO
/****** Object:  StoredProcedure [dbo].[getNombreSedes]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================
-- Author:		Margarita Hoyos
-- Create date: 21-Julio-2009
-- Description:	Obtiene los nombres de las sedes
-- ================================================
CREATE PROCEDURE [dbo].[getNombreSedes]
AS
BEGIN

	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [Sede]
	FROM  [dbo].[Tbl_Sedes]

END
GO
/****** Object:  StoredProcedure [dbo].[getNombreLector]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos
-- Create date: 25-Noviembre-2009
-- Description:	Obtiene el nombre de un lector
-- ==================================================
CREATE PROCEDURE [dbo].[getNombreLector]
	@intNumero int
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	  SELECT *
	  FROM  [dbo].[Tbl_Lectores] WHERE [NumeroLector] = @intNumero
END
GO
/****** Object:  StoredProcedure [dbo].[getNombreFuncionarios]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================
-- Author:		Margarita Hoyos
-- Create date: 16-Julio-2009
-- Description:	Obtiene los nombres de los funcionarios
-- ================================================
CREATE PROCEDURE [dbo].[getNombreFuncionarios]
AS
BEGIN

	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [NomFuncionario] +' '+[ApeFuncionario] Nombre
	FROM  [dbo].[Tbl_Funcionarios] WHERE [Activo] = 'true'

END
GO
/****** Object:  StoredProcedure [dbo].[getNombreEmpresas]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================
-- Author:		Margarita Hoyos
-- Create date: 21-Julio-2009
-- Description:	Obtiene los nombres de las empresas
-- ================================================
CREATE PROCEDURE [dbo].[getNombreEmpresas]
AS
BEGIN

	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [NombreEmpresa]
	FROM  [dbo].[Tbl_Empresa]

END
GO
/****** Object:  StoredProcedure [dbo].[getMarcacionesNombre]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================
-- Author:		Margarita Hoyos
-- Create date: 20-Mayo-2009
-- Description:	Obtiene las marcaciones de los 
-- funcionarios asociados a un nombre
-- ================================================
CREATE PROCEDURE [dbo].[getMarcacionesNombre]
@strNombre varchar(MAX)
AS
BEGIN

	SET NOCOUNT ON;

    -- Insert statements for procedure here
    SET LANGUAGE Spanish
	SELECT 
		[Tbl_Funcionarios].[NomFuncionario] Nombre
		,[Tbl_Funcionarios].[ApeFuncionario] Apellido
		,[Tbl_Cargos].[Cargo]
		,[CHECKINOUT].[Sensorid]
		,right('0'+CAST(DAY([CHECKINOUT].[CheckTime]) as varchar), 2) + ' ' + left(DATENAME(MONTH,[CHECKINOUT].[CheckTime]), 3) + ' de ' + CAST(YEAR([CHECKINOUT].[CheckTime]) as varchar) 'Fecha'
		,right('0'+DATENAME(hh,  [CHECKINOUT].[CheckTime]),2) +  ':' + right('0'+DATENAME(mi,  [CHECKINOUT].[CheckTime]),2) Hora
		
	FROM [Tbl_Funcionarios], [CHECKINOUT], [Tbl_Cargos] 
	WHERE [Tbl_Funcionarios].[IdFuncionario] = [CHECKINOUT].[Userid] AND [Tbl_Cargos].[CodigoCargo] = [Tbl_Funcionarios].[CodigoCargo]
			AND ( [Tbl_Funcionarios].[NomFuncionario]+' '+[Tbl_Funcionarios].[ApeFuncionario] = @strNombre )
END
GO
/****** Object:  StoredProcedure [dbo].[getMarcacionesId]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================
-- Author:		Margarita Hoyos
-- Create date: 20-Mayo-2009
-- Description:	Obtiene las marcaciones de el
-- funcionario asociados a una identificacion
-- ================================================
CREATE PROCEDURE [dbo].[getMarcacionesId]
@intId int
AS
BEGIN

	SET NOCOUNT ON;

    -- Insert statements for procedure here
    SET LANGUAGE Spanish
	SELECT 
		[Tbl_Funcionarios].[NomFuncionario] Nombre
		,[Tbl_Funcionarios].[ApeFuncionario] Apellido
		,[Tbl_Cargos].[Cargo]
		,[CHECKINOUT].[Sensorid]
		,right('0'+CAST(DAY([CHECKINOUT].[CheckTime]) as varchar), 2) + ' ' + left(DATENAME(MONTH,[CHECKINOUT].[CheckTime]), 3) + ' de ' + CAST(YEAR([CHECKINOUT].[CheckTime]) as varchar) 'Fecha'
		,right('0'+DATENAME(hh,  [CHECKINOUT].[CheckTime]),2) +  ':' + right('0'+DATENAME(mi,  [CHECKINOUT].[CheckTime]),2) Hora
		
	FROM [Tbl_Funcionarios], [CHECKINOUT], [Tbl_Cargos] 
	WHERE [Tbl_Funcionarios].[IdFuncionario] = [CHECKINOUT].[Userid] AND [Tbl_Cargos].[CodigoCargo] = [Tbl_Funcionarios].[CodigoCargo]
			AND [Tbl_Funcionarios].[IdFuncionario]= @intId 
END
GO
/****** Object:  StoredProcedure [dbo].[getMarcacionesFecha]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================
-- Author:		Margarita Hoyos
-- Create date: 20-Mayo-2009
-- Description:	Obtiene las marcaciones de los 
-- funcionarios en un rango de fechas
-- ================================================
CREATE PROCEDURE [dbo].[getMarcacionesFecha]
@fecha1 date,
@fecha2 date
AS
BEGIN

	SET NOCOUNT ON;

    -- Insert statements for procedure here
    SET LANGUAGE Spanish
	SELECT 
		[Tbl_Funcionarios].[NomFuncionario] Nombre
		,[Tbl_Funcionarios].[ApeFuncionario] Apellido
		,[Tbl_Cargos].[Cargo]
		,[CHECKINOUT].[Sensorid]
		,right('0'+CAST(DAY([CHECKINOUT].[CheckTime]) as varchar), 2) + ' ' + left(DATENAME(MONTH,[CHECKINOUT].[CheckTime]), 3) + ' de ' + CAST(YEAR([CHECKINOUT].[CheckTime]) as varchar) 'Fecha'
		,right('0'+DATENAME(hh,  [CHECKINOUT].[CheckTime]),2) +  ':' + right('0'+DATENAME(mi,  [CHECKINOUT].[CheckTime]),2) Hora
		
	FROM [Tbl_Funcionarios], [CHECKINOUT], [Tbl_Cargos] 
	WHERE [Tbl_Funcionarios].[IdFuncionario] = [CHECKINOUT].[Userid] AND [Tbl_Cargos].[CodigoCargo] = [Tbl_Funcionarios].[CodigoCargo]
			AND ( [CHECKINOUT].[CheckTime] BETWEEN @fecha1 AND @fecha2 )
END
GO
/****** Object:  StoredProcedure [dbo].[obtenerInterfacesSinPermiso]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Margarita Hoyos
-- Create date: 27-Enero-2009
-- Description:	obtiene las interfaces sin permiso
-- asignado
-- =============================================
CREATE PROCEDURE [dbo].[obtenerInterfacesSinPermiso]
	@idPerfil int,
	@idMenu int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT [Tbl_Interfaces].[InterfasId], [Tbl_Interfaces].[Descripcion] Interfaz
    FROM [dbo].[Tbl_Interfaces], [Tbl_Menus]
    WHERE [Tbl_Menus].[MenuId] = [Tbl_Interfaces].[Menu] AND 
    [Tbl_Interfaces].[Menu] = @idMenu AND
    [Tbl_Interfaces].[InterfasId] NOT IN (SELECT [iui] FROM [dbo].[Tbl_PermisosUsuarios] WHERE [perf] = @idPerfil)

END
GO
/****** Object:  StoredProcedure [dbo].[obtenerPersonasHomonimas]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Marisol 
-- Create date: 11-mar-2010
-- Description:	Busca Personas con Nombre y Apellido coincidentes
-- ==================================================
CREATE PROCEDURE [dbo].[obtenerPersonasHomonimas]
	@Nombre as nvarchar(50),
	@Apellido as nvarchar(50),
	@IdPersona as bigint
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here

		SELECT     IdPersona, NomFuncionario, ApeFuncionario, Celular, eMail, TelCasa, contratista, (STR(IdPersona) + '  ' + NomFuncionario + '  ' + ApeFuncionario) as IdePersona, (NomFuncionario + '  ' + ApeFuncionario + '  ' + STR(IdPersona)) as Nombre, (ApeFuncionario + '  ' + NomFuncionario + '  ' + STR(IdPersona))as Apellido
		FROM       Tbl_Personas
		WHERE      NomFuncionario like @Nombre AND ApeFuncionario like @Apellido and IdPersona<>@IdPersona
END
GO
/****** Object:  StoredProcedure [dbo].[obtenerPermisos_Usuario]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Marisol 
-- Create date: 04-Dic-2009
-- Description:	
-- ==================================================
CREATE PROCEDURE [dbo].[obtenerPermisos_Usuario]
@IdUsuario int

AS
BEGIN
	SET NOCOUNT ON;
	    -- Insert statements for procedure here
		SELECT * FROM Tbl_PermisosUsuarios WHERE iui=@IdUsuario
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerTbl_Funcionarios]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================
-- Author:		Margarita Hoyos
-- Create date: 31-Marzo-2010
-- Description:	Obtiene los funcionarios
-- ================================================
CREATE PROCEDURE [dbo].[ObtenerTbl_Funcionarios]
AS
BEGIN

	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [IdFuncionario]
	FROM  [dbo].[Tbl_Funcionarios]

END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerTagsDisponibles]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Margarita Hoyos
-- Create date: 23-Agosto-2011
-- Description:	Obtiene los tags rfid disponibles
-- =============================================
CREATE PROCEDURE [dbo].[ObtenerTagsDisponibles]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT [IdTag], [Descripcion]
	FROM [dbo].[Tbl_Tags]
	WHERE [Estado] = 'D'

END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerIdVisitanteByTag]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos
-- Create date: 19-Diciembre-2011
-- Description:	Obtiene el Id de un visitante mediante
-- el Tag RFID que se le asignó
-- ==================================================
CREATE PROCEDURE [dbo].[ObtenerIdVisitanteByTag]
	@IdTag varchar(255),
	@Fecha date
	
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SELECT  Tbl_TagsxVisitante.[Visitante]
	FROM    Tbl_TagsxVisitante, Tbl_Tags
	WHERE   Tbl_Tags.[IdTag] = Tbl_TagsxVisitante.[Tag] AND Tbl_TagsxVisitante.[Tag] = @IdTag 
			AND Tbl_TagsxVisitante.[Fecha] = @Fecha

END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerIdRegistroVisitaPaciente]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Margarita Hoyos
-- Create date: 31-Marzo-2011
-- Description:	Verifica si un visitante tiene
-- un registro de visita, activo
-- =============================================
CREATE PROCEDURE [dbo].[ObtenerIdRegistroVisitaPaciente]
	@Fecha date,
	@Visitante varchar(20)
	
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT IdVisita
	FROM Tbl_VisitasPaciente
	WHERE	FechaIngreso = @Fecha AND Visitante = @Visitante AND Estado = 'E' 
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerHuellasVisitantes]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos
-- Create date: 23-Marzo-2011
-- Description:	Obtiene las huellas de los visitantes
-- de los pacientes
-- ==================================================
CREATE PROCEDURE [dbo].[ObtenerHuellasVisitantes]
	
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [Huella], [Identificacion] FROM  [dbo].[Tbl_VisitantePaciente]
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerDatosEntradaVehiculo]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Margarita Hoyos
-- Create date: 05-Feb-2011
-- Description:	Obtiene los datos de la marcación
-- de entrada de un vehiculo
-- =============================================
CREATE PROCEDURE [dbo].[ObtenerDatosEntradaVehiculo]
	
	@Fecha date,
	@Placa varchar(10),
	@Empresa Int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT *
	FROM Tbl_MarcacionesVehiculos
	WHERE	FechaInicio = @Fecha AND Estado = 'E' AND 
			IdVehiculo = @Placa AND	IdEmpresa = @Empresa
END
GO
/****** Object:  StoredProcedure [dbo].[eliminarPermisoUsuario]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Margarita Hoyos
-- Create date: 28-Enero-2009
-- Description:	Elimina permisos para un perfil
-- de usuario
-- =============================================
CREATE PROCEDURE [dbo].[eliminarPermisoUsuario]
	@idPermiso int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DELETE [dbo].[Tbl_PermisosUsuarios] WHERE [idPermiso] = @idPermiso

END
GO
/****** Object:  StoredProcedure [dbo].[obtieneTbl_Funcionarios_x_Usuario]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Marisol 
-- Create date: 26-Noviembre-2009
-- Description:	Obtiene Funcionarios por Usuario
-- ==================================================
CREATE PROCEDURE [dbo].[obtieneTbl_Funcionarios_x_Usuario]
@IdUsuario int,
@IdFuncionario bigint

AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		SELECT * 
		FROM Tbl_Funcionarios_x_Usuario 
		WHERE  IdUsuario=@IdUsuario AND IdFuncionario=@IdFuncionario
END
GO
/****** Object:  StoredProcedure [dbo].[obtieneMinPerfil]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marisol Nieto
-- Create date: 02-Dic-2009
-- Description:	obtiene el id de perfil minimo
-- =============================================
CREATE PROCEDURE [dbo].[obtieneMinPerfil]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT MIN(idPerfil) as minIdPerfil FROM [dbo].[Tbl_PerfilesUsuarios]

END
GO
/****** Object:  StoredProcedure [dbo].[obtieneMaxFechaAgenda]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marisol Nieto
-- Create date: 08-Ene-2009
-- Description:	obtiene La máxima Fecha Programada de la Agenda del Funcionario
-- =============================================
CREATE PROCEDURE [dbo].[obtieneMaxFechaAgenda]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT Max(Fecha) as maxFechaAgenda FROM Tbl_AgendaVisitasFuncionario

END
GO
/****** Object:  StoredProcedure [dbo].[obtieneFuncionariosActivos_x_Usuario]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Marisol 
-- Create date: 26-Noviembre-2009
-- Description:	Obtiene Los Funcionarios de las dependencias del Usuario
-- ==================================================
CREATE PROCEDURE [dbo].[obtieneFuncionariosActivos_x_Usuario]
@IdUsuario int
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		SELECT     Tbl_Funcionarios.IdFuncionario, Tbl_Funcionarios.NomFuncionario + ' ' + Tbl_Funcionarios.ApeFuncionario AS NmbApe
		FROM       Tbl_Funcionarios INNER JOIN
				   Tbl_Funcionarios_x_Usuario ON Tbl_Funcionarios.IdFuncionario = Tbl_Funcionarios_x_Usuario.IdFuncionario
		WHERE     (Tbl_Funcionarios_x_Usuario.IdUsuario = @IdUsuario) AND Activo = 'True'
            
END
GO
/****** Object:  StoredProcedure [dbo].[obtieneFuncionarios_x_Usuario]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Marisol 
-- Create date: 26-Noviembre-2009
-- Description:	Obtiene Los Funcionarios de las dependencias del Usuario
-- ==================================================
CREATE PROCEDURE [dbo].[obtieneFuncionarios_x_Usuario]
@IdUsuario int
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		SELECT     Tbl_Funcionarios.IdFuncionario, Tbl_Funcionarios.NomFuncionario + ' ' + Tbl_Funcionarios.ApeFuncionario AS NmbApe
		FROM       Tbl_Funcionarios INNER JOIN
				   Tbl_Funcionarios_x_Usuario ON Tbl_Funcionarios.IdFuncionario = Tbl_Funcionarios_x_Usuario.IdFuncionario
		WHERE     (Tbl_Funcionarios_x_Usuario.IdUsuario = @IdUsuario)
            
END
GO
/****** Object:  StoredProcedure [dbo].[obtieneFuncionarios_x_Dependencia]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Marisol 
-- Create date: 26-Noviembre-2009
-- Description:	Obtiene las dependencias de los Funcionarios
-- ==================================================
CREATE PROCEDURE [dbo].[obtieneFuncionarios_x_Dependencia]
@IdDependencia int
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		
		SELECT     Tbl_Funcionarios.IdFuncionario, Tbl_Funcionarios.NomFuncionario + ' ' + Tbl_Funcionarios.ApeFuncionario AS NmbApe, 
                   Tbl_Funcionarios.CodigoDependencia, Tbl_Dependencias.Dependencia
		FROM       Tbl_Funcionarios INNER JOIN
                   Tbl_Dependencias ON Tbl_Funcionarios.CodigoDependencia = Tbl_Dependencias.CodigoDependencia
   		WHERE     Tbl_Funcionarios.CodigoDependencia = @IdDependencia
            
END
GO
/****** Object:  StoredProcedure [dbo].[prcActualizarPersona]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================
-- Author:		Margarita Hoyos
-- Create date: 28-Julio-2009
-- Description:	Actualiza los datos de un visitante
-- ================================================
CREATE PROCEDURE [dbo].[prcActualizarPersona]
	@idPersona int,
	@Empresa varchar(max), 
	@nombre varchar(max),
	@apellido varchar(max),
	@foto varbinary(max),
	@telefono int,
	@contratista bit,
	@vigencia date,
	@observaciones varchar(max),
	@celular float
AS
BEGIN

	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE  [dbo].[Tbl_Personas] SET 
		[Empresa] = @Empresa,
		[NomFuncionario] = @nombre,
		[ApeFuncionario] = @apellido,
		[Foto] = @foto,
		[TelCasa] = @telefono,
		[contratista] = @contratista,
		[fechavigenciaARP] = @vigencia,
		[Observaciones] = @observaciones,
		[Celular] = @celular

	WHERE [IdPersona] = @idPersona

END
GO
/****** Object:  StoredProcedure [dbo].[prcActualizarHuellaDigital]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos
-- Create date: 24-Ago-2009
-- Description:	Actualiza la huella tomada con el lector
-- Digital Persona
-- ==================================================
CREATE PROCEDURE [dbo].[prcActualizarHuellaDigital]
	@intId bigint,
	@template varbinary(max)
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	  UPDATE [dbo].[Tbl_Templates] SET [HuellaDigital] = @template
	  WHERE [userID] = @intId
END
GO
/****** Object:  StoredProcedure [dbo].[prcActualizarHuella]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos
-- Create date: 19-Noviembre-2009
-- Description:	Actualiza la huella de una persona
-- ==================================================
CREATE PROCEDURE [dbo].[prcActualizarHuella]
	@intId bigint,
	@template text
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	  UPDATE [dbo].[Tbl_Templates] SET [template1] = @template
	  WHERE [userID] = @intId
END
GO
/****** Object:  StoredProcedure [dbo].[prcActualizarFuncionario]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================
-- Author:		Margarita Hoyos
-- Create date: 15-Mayo-2009
-- Description:	Actualiza un funcionario de la app
-- ================================================
CREATE PROCEDURE [dbo].[prcActualizarFuncionario]
@idEmpresa int,
@nombre varchar(max),
@apellido  varchar(max),
@idSede int,
@activo bit,
@idFuncionario int,
@codigo int,
@dependencia int
AS
BEGIN

	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE  [dbo].[Tbl_Funcionarios] SET 
		[Empresa] = @idEmpresa,
		[NomFuncionario] = @nombre,
		[ApeFuncionario] = @apellido,
		[NumeroSede] = @idSede,
		[Activo] = @activo,
		[CodigoDependencia] = @dependencia
	WHERE [IdFuncionario] = @idFuncionario AND [CodEmpleado] = @codigo

END
GO
/****** Object:  StoredProcedure [dbo].[prcActualizarEstadoCita]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos
-- Create date: 26-Nov-2009
-- Description:	Actualiza el estado de la cita
-- ==================================================
CREATE PROCEDURE [dbo].[prcActualizarEstadoCita]
	@csc int,
	@estado varchar(50)
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[Tbl_AgendaVisitasFuncionario]
    SET  [Estado] = @estado 
	WHERE [csc]= @csc AND ([Estado] = 'PROGRAMADO' OR [Estado] = 'CONFIRMADA' )
END
GO
/****** Object:  StoredProcedure [dbo].[obtieneVisitasAgenda_x_Visitante]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Marisol Nieto Gutiérrez
-- Create date: 12-Ene-2010
-- Description:	Obtiene todas las visitas de la agenda de acuerdo al id de un visitante
-- ==================================================
CREATE PROCEDURE [dbo].[obtieneVisitasAgenda_x_Visitante]

	@FechaIni as date,
	@FechaFin as date,
	@IdUsuario as int,
	@IdVisitante as bigint
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here

		SELECT     convert(varchar(12),Tbl_AgendaVisitasFuncionario.Fecha,111) as Fecha, Tbl_AgendaVisitasFuncionario.Hora, Tbl_AgendaVisitasFuncionario.IdVisitante AS IdVisitante, Tbl_Personas.NomFuncionario AS Nombre, 
                      Tbl_Personas.ApeFuncionario AS Apellido, Tbl_AgendaVisitasFuncionario.Motivo, Tbl_Personas.Celular, Tbl_Personas.eMail, 
                      Tbl_AgendaVisitasFuncionario.Estado, CASE WHEN Tbl_Personas.contratista = 'true' THEN 'Si' ELSE 'No' END AS contratista, (Tbl_Funcionarios.NomFuncionario + ' ' + Tbl_Funcionarios.ApeFuncionario) as Funcionario_Visitado, 
                      Tbl_AgendaVisitasFuncionario.IdFuncionario
		FROM         Tbl_AgendaVisitasFuncionario INNER JOIN   Tbl_Personas                ON   Tbl_AgendaVisitasFuncionario.IdVisitante = Tbl_Personas.IdPersona 
		                                          INNER JOIN   Tbl_Funcionarios_x_Usuario  ON   Tbl_AgendaVisitasFuncionario.IdFuncionario = Tbl_Funcionarios_x_Usuario.IdFuncionario 
		                                          INNER JOIN   Tbl_Funcionarios            ON   Tbl_AgendaVisitasFuncionario.IdFuncionario = Tbl_Funcionarios.IdFuncionario 
												  AND          Tbl_Funcionarios_x_Usuario.IdFuncionario = Tbl_Funcionarios.IdFuncionario

	    WHERE Tbl_Funcionarios_x_Usuario.IdUsuario=@IdUsuario AND Tbl_AgendaVisitasFuncionario.IdVisitante=@IdVisitante AND Tbl_AgendaVisitasFuncionario.Fecha BETWEEN @FechaIni AND @FechaFin
	    
	    ORDER BY Tbl_AgendaVisitasFuncionario.Fecha DESC
END
GO
/****** Object:  StoredProcedure [dbo].[obtieneVisitasAgenda_x_Funcionario]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Marisol 
-- Create date: 08-Ene-2010
-- Description:	Obtiene las visitas de la agenda  para un Funcionario 
-- ==================================================
CREATE PROCEDURE [dbo].[obtieneVisitasAgenda_x_Funcionario]
	@IdFuncionario as bigint,
	@FechaIni as date,
	@FechaFin as date
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here

		SELECT     convert(varchar(12),Tbl_AgendaVisitasFuncionario.Fecha,111) as Fecha, Tbl_AgendaVisitasFuncionario.Hora, Tbl_AgendaVisitasFuncionario.IdVisitante as IdVisitante, Tbl_Personas.NomFuncionario as Nombre, Tbl_Personas.ApeFuncionario as Apellido, 
                      Tbl_AgendaVisitasFuncionario.Motivo, Tbl_Personas.Celular, Tbl_Personas.eMail, Tbl_AgendaVisitasFuncionario.Estado, 
                       case	when Tbl_Personas.contratista='true' then 'Si' else 'No' end as contratista
		FROM         Tbl_AgendaVisitasFuncionario INNER JOIN
                      Tbl_Personas ON Tbl_AgendaVisitasFuncionario.IdVisitante = Tbl_Personas.IdPersona
  		WHERE        Tbl_AgendaVisitasFuncionario.IdFuncionario=@IdFuncionario AND Tbl_AgendaVisitasFuncionario.IdFuncionario=@IdFuncionario AND Tbl_AgendaVisitasFuncionario.Fecha BETWEEN @FechaIni AND @FechaFin
  		ORDER BY Tbl_AgendaVisitasFuncionario.Fecha DESC
END
GO
/****** Object:  StoredProcedure [dbo].[obtieneVisitasAgenda_Todos]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Marisol 
-- Create date: 08-Ene-2010
-- Description:	Obtiene todos las visitas de la agenda cuyo estado es programada
-- ==================================================
CREATE PROCEDURE [dbo].[obtieneVisitasAgenda_Todos]

	@FechaIni as date,
	@FechaFin as date,
	@IdUsuario as int
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here

		SELECT    convert(varchar(12),Tbl_AgendaVisitasFuncionario.Fecha,111) as Fecha, Tbl_AgendaVisitasFuncionario.Hora, Tbl_AgendaVisitasFuncionario.IdVisitante AS IdVisitante, Tbl_Personas.NomFuncionario AS Nombre, 
                      Tbl_Personas.ApeFuncionario AS Apellido, Tbl_AgendaVisitasFuncionario.Motivo, Tbl_Personas.Celular, Tbl_Personas.eMail, 
                      Tbl_AgendaVisitasFuncionario.Estado, CASE WHEN Tbl_Personas.contratista = 'true' THEN 'Si' ELSE 'No' END AS contratista, (Tbl_Funcionarios.NomFuncionario + ' ' + Tbl_Funcionarios.ApeFuncionario) as Funcionario_Visitado, 
                      Tbl_AgendaVisitasFuncionario.IdFuncionario
		FROM         Tbl_AgendaVisitasFuncionario INNER JOIN   Tbl_Personas                ON   Tbl_AgendaVisitasFuncionario.IdVisitante = Tbl_Personas.IdPersona 
		                                          INNER JOIN   Tbl_Funcionarios_x_Usuario  ON   Tbl_AgendaVisitasFuncionario.IdFuncionario = Tbl_Funcionarios_x_Usuario.IdFuncionario 
		                                          INNER JOIN   Tbl_Funcionarios            ON   Tbl_AgendaVisitasFuncionario.IdFuncionario = Tbl_Funcionarios.IdFuncionario 
												  AND          Tbl_Funcionarios_x_Usuario.IdFuncionario = Tbl_Funcionarios.IdFuncionario

	    WHERE Tbl_Funcionarios_x_Usuario.IdUsuario=@IdUsuario AND Tbl_AgendaVisitasFuncionario.Fecha BETWEEN @FechaIni AND @FechaFin
	    
	    ORDER BY Tbl_AgendaVisitasFuncionario.Fecha DESC
END
GO
/****** Object:  StoredProcedure [dbo].[obtieneVisitas_x_Funcionario]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Marisol 
-- Create date: 17-Noviembre-2009
-- Description:	
-- ==================================================
CREATE PROCEDURE [dbo].[obtieneVisitas_x_Funcionario]
	@IdFuncionario bigint,
	@FechaVisita as date
	
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here

		SELECT     Tbl_AgendaVisitasFuncionario.IdFuncionario, Tbl_AgendaVisitasFuncionario.Fecha, Tbl_AgendaVisitasFuncionario.Hora, 
                   Tbl_AgendaVisitasFuncionario.IdVisitante,Tbl_AgendaVisitasFuncionario.Estado, Tbl_AgendaVisitasFuncionario.Motivo, Tbl_Personas.NomFuncionario, Tbl_Personas.ApeFuncionario,Tbl_AgendaVisitasFuncionario.csc,Tbl_Personas.Celular,Tbl_Personas.eMail,Tbl_Personas.contratista
		FROM       Tbl_AgendaVisitasFuncionario INNER JOIN
                   Tbl_Personas ON Tbl_AgendaVisitasFuncionario.IdVisitante = Tbl_Personas.IdPersona
		WHERE      (IdFuncionario = @IdFuncionario AND Fecha=@FechaVisita)
END
GO
/****** Object:  StoredProcedure [dbo].[obtieneVisitantes_x_Usuario]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Marisol 
-- Create date: 12-Ene-2010
-- Description:	Obtiene Los Visitantes de la Agenda a la cual tiene permiso el usuario
-- ==================================================
CREATE PROCEDURE [dbo].[obtieneVisitantes_x_Usuario]
@IdUsuario int
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		SELECT   distinct( Tbl_AgendaVisitasFuncionario.IdVisitante) as IdPersona, (Tbl_Personas.NomFuncionario + ' ' + Tbl_Personas.ApeFuncionario + ' -- ' + str(Tbl_Personas.IdPersona)) AS Nombre
		FROM         Tbl_AgendaVisitasFuncionario INNER JOIN   Tbl_Personas                ON   Tbl_AgendaVisitasFuncionario.IdVisitante = Tbl_Personas.IdPersona 
		                                          INNER JOIN   Tbl_Funcionarios_x_Usuario  ON   Tbl_AgendaVisitasFuncionario.IdFuncionario = Tbl_Funcionarios_x_Usuario.IdFuncionario 
		WHERE Tbl_Funcionarios_x_Usuario.IdUsuario= @IdUsuario
		ORDER BY (Tbl_Personas.NomFuncionario + ' ' + Tbl_Personas.ApeFuncionario + ' -- ' + str(Tbl_Personas.IdPersona))
            
END
GO
/****** Object:  StoredProcedure [dbo].[InsertQuery]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertQuery]
(
	@Id_Tercero bigint,
	@DigitoVerificacion smallint,
	@Sigla varchar(50),
	@Nombre varchar(255),
	@DireccionCorrespondencia varchar(100),
	@Ciudad int,
	@ZonaPostal int,
	@TelOficina varchar(50),
	@Extension varchar(50),
	@TelCasa varchar(50),
	@Celular varchar(50),
	@CodigoPersoneriaJuridica int,
	@RepresentanteLegal varchar(50),
	@Cedula_RepLegal varchar(20),
	@CodigoRegimenIva smallint,
	@CodigoContribuyente smallint,
	@Autoretenedor bit,
	@DireccioneElectronica varchar(50),
	@ReferenciaComercial varchar(50),
	@ContactoRefComercial varchar(50),
	@TelRefComercial varchar(50),
	@ReferenciaBancaria varchar(50),
	@CuentaBancaria varchar(30),
	@ReferenciaPersonal varchar(50),
	@TelRefPersonal varchar(50),
	@RetienexIca bit,
	@UsuarioCrea varchar(50),
	@FechaCrea datetime
)
AS
	SET NOCOUNT OFF;
INSERT INTO Tbl_Terceros
                         (Id_Tercero, DigitoVerificacion, Sigla, Nombre, DireccionCorrespondencia, Ciudad, ZonaPostal, TelOficina, Extension, TelCasa, Celular, 
                         CodigoPersoneriaJuridica, RepresentanteLegal, Cedula_RepLegal, CodigoRegimenIva, CodigoContribuyente, Autoretenedor, DireccioneElectronica, 
                         ReferenciaComercial, ContactoRefComercial, TelRefComercial, ReferenciaBancaria, CuentaBancaria, ReferenciaPersonal, TelRefPersonal, RetienexIca, 
                         UsuarioCrea, FechaCrea)
VALUES        (@Id_Tercero,@DigitoVerificacion,@Sigla,@Nombre,@DireccionCorrespondencia,@Ciudad,@ZonaPostal,@TelOficina,@Extension,@TelCasa,@Celular,@CodigoPersoneriaJuridica,@RepresentanteLegal,@Cedula_RepLegal,@CodigoRegimenIva,@CodigoContribuyente,@Autoretenedor,@DireccioneElectronica,@ReferenciaComercial,@ContactoRefComercial,@TelRefComercial,@ReferenciaBancaria,@CuentaBancaria,@ReferenciaPersonal,@TelRefPersonal,@RetienexIca,@UsuarioCrea,@FechaCrea)
GO
/****** Object:  StoredProcedure [dbo].[getVisitasPorSalir]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos
-- Create date: 14-Julio-2009
-- Description:	Obtiene los visitantes que no han registrado
-- salida
-- ==================================================
CREATE PROCEDURE [dbo].[getVisitasPorSalir]
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [IdPersona] Documento, [NomFuncionario]+ ' ' +[ApeFuncionario] Visitante, [Fecha], [HoraInicial] Ingreso, [Seguimiento], [CodigosBarras] 'Equipos'
	FROM [Tbl_Personas], [Tbl_Visitas]
	WHERE [Tbl_Visitas].[IdVisitante] = [Tbl_Personas].[IdPersona] AND [Tbl_Visitas].[StsActividad] = 'E'
	ORDER BY [Tbl_Visitas].[HoraInicial], [Tbl_Personas].[IdPersona] ASC
END
GO
/****** Object:  StoredProcedure [dbo].[getVisitasPorFuncionario]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos
-- Create date: 14-Julio-2009
-- Description:	Obtiene las visitas que están pendientes
-- por salir
-- ==================================================

CREATE PROCEDURE [dbo].[getVisitasPorFuncionario]
	@idFuncionario bigint
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [IdPersona] Documento, [Tbl_Personas].[NomFuncionario]+ ' ' +[Tbl_Personas].[ApeFuncionario] Visitante, 
		[Tbl_Funcionarios].[NomFuncionario]+ ' ' +[Tbl_Funcionarios].[ApeFuncionario] Funcionario,
		[Tbl_Visitas].[Fecha], [Tbl_Visitas].[HoraInicial] Ingreso, 
		[Tbl_Visitas].[HoraFinal] Salida, [Tbl_Visitas].[StsActividad] Estado, [CodigosBarras] 'Equipos'
	FROM [Tbl_Personas], [Tbl_Visitas],[Tbl_Funcionarios]
	WHERE [Tbl_Visitas].[IdVisitante] = [Tbl_Personas].[IdPersona] AND 
	[Tbl_Visitas].[RecibeVisita] = [Tbl_Funcionarios].[IdFuncionario] AND [Tbl_Funcionarios].[IdFuncionario] = @idFuncionario
	ORDER BY [Tbl_Personas].[IdPersona], [Tbl_Visitas].[HoraInicial] ASC
END
GO
/****** Object:  StoredProcedure [dbo].[getVisitasPorFecha]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos
-- Create date: 14-Julio-2009
-- Description:	Obtiene las visitas en determinada fecha
-- ==================================================

CREATE PROCEDURE [dbo].[getVisitasPorFecha]
	@fecha date
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [IdPersona] Documento, [NomFuncionario]+ ' ' +[ApeFuncionario] Visitante, [Fecha], [HoraInicial] Ingreso, [HoraFinal] Salida, [Seguimiento], [StsActividad] Sts, [CodigosBarras] 'Equipos'
	FROM [Tbl_Personas], [Tbl_Visitas]
	WHERE [Tbl_Visitas].[IdVisitante] = [Tbl_Personas].[IdPersona] AND [Tbl_Visitas].[Fecha] = @fecha
	ORDER BY [Tbl_Personas].[IdPersona], [Tbl_Visitas].[HoraInicial] ASC
END
GO
/****** Object:  StoredProcedure [dbo].[getVisitasPersonaFecha]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos
-- Create date: 233-Julio-2009
-- Description:	Obtiene las visitas que ha realizado
-- una persona para un rango de fechas
-- ==================================================

CREATE PROCEDURE [dbo].[getVisitasPersonaFecha]
	@idPersona bigint,
	@fechaInicial date,
	@fechaFinal date
	
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT f.[NomFuncionario]+ ' ' + f.[ApeFuncionario] Funcionario,
		 right('0'+DATENAME(DD, v.[FechaInicial]), 2) + '/' + right('0'+CAST(DATEPART(MONTH, v.[FechaInicial]) AS VARCHAR), 2) + '/'+ DATENAME(YYYY, v.[FechaInicial]) 'Fecha',  
		 v.[HoraInicial] 'Entrada', v.[HoraFinal] 'Salida', 
		 v.[MotivoVisita] 'Motivo', v.[ElementosIngresa] 'Equipos',
		 (SELECT TOP 1 agenda.Estado FROM [Tbl_AgendaVisitasFuncionario] agenda WHERE agenda.Fecha = v.[Fecha] AND
	  agenda.IdFuncionario = f.[IdFuncionario] AND agenda.IdVisitante = p.[IdPersona] ORDER BY
	  ABS(DATEDIFF(MINUTE, CONVERT(VARCHAR(12), agenda.[Hora] , 108), v.[HoraInicial]))) 'Cita'
	FROM [Tbl_Personas] p, [Tbl_Visitas] v, [Tbl_Funcionarios] f
	WHERE v.[IdVisitante] = p.[IdPersona] AND f.[IdFuncionario] = v.[RecibeVisita] AND
	p.[IdPersona] = @idPersona AND v.[Fecha] BETWEEN @fechaInicial AND @fechaFinal
	AND v.[StsActividad] <> '-'
	ORDER BY Funcionario, v.[FechaInicial] ASC, v.[HoraInicial] ASC
END
GO
/****** Object:  StoredProcedure [dbo].[getVisitasPersona]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos
-- Create date: 233-Julio-2009
-- Description:	Obtiene las visitas que ha realizado
-- una persona para un rango de fechas
-- ==================================================

CREATE PROCEDURE [dbo].[getVisitasPersona]
	@idPersona int	
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT f.[NomFuncionario]+ ' ' + f.[ApeFuncionario] Funcionario,
		 v.[FechaInicial] 'Fecha', v.[HoraInicial] 'Entrada', v.[HoraFinal] 'Salida', 
		 v.[MotivoVisita] 'Motivo', v.[ElementosIngresa] 'Equipos',
		 (SELECT a.Estado FROM [Tbl_AgendaVisitasFuncionario] a WHERE a.Fecha = v.[Fecha] AND
		  a.IdFuncionario = f.[IdFuncionario] AND a.IdVisitante = p.[IdPersona]) 'Cita'
	FROM [Tbl_Personas] p, [Tbl_Visitas] v, [Tbl_Funcionarios] f
	WHERE v.[IdVisitante] = p.[IdPersona] AND p.[IdPersona] = @idPersona 
END
GO
/****** Object:  StoredProcedure [dbo].[getVisitasFuncionarioFecha]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos
-- Create date: 233-Julio-2009
-- Description:	Obtiene las visitas que ha recibido 
-- un funcionario para un rango de fechas
-- ==================================================

CREATE PROCEDURE [dbo].[getVisitasFuncionarioFecha]
	@idFuncionario bigint,
	@fechaInicial date,
	@fechaFinal date
	
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT p.[NomFuncionario]+ ' ' + p.[ApeFuncionario] Visitante,
		 right('0'+DATENAME(DD, v.[FechaInicial]), 2) + '/' + right('0'+CAST(DATEPART(MONTH, v.[FechaInicial]) AS VARCHAR), 2) + '/'+ DATENAME(YYYY, v.[FechaInicial]) 'Fecha', 
		 v.[HoraInicial] 'Entrada', v.[HoraFinal] 'Salida', 
		 v.[MotivoVisita] 'Motivo', v.[ElementosIngresa] 'Equipos',
		 (SELECT TOP 1 agenda.Estado FROM [Tbl_AgendaVisitasFuncionario] agenda WHERE agenda.Fecha = v.[Fecha] AND
	  agenda.IdFuncionario = f.[IdFuncionario] AND agenda.IdVisitante = p.[IdPersona] ORDER BY
	  ABS(DATEDIFF(MINUTE, CONVERT(VARCHAR(12), agenda.[Hora] , 108), v.[HoraInicial]))) 'Cita'
	FROM [Tbl_Personas] p, [Tbl_Visitas] v, [Tbl_Funcionarios] f
	WHERE v.[IdVisitante] = p.[IdPersona] AND v.[RecibeVisita] = f.[IdFuncionario] 
	AND f.[IdFuncionario] = @idFuncionario AND v.[Fecha] BETWEEN @fechaInicial AND @fechaFinal
	AND v.[StsActividad] <> '-'
	ORDER BY Visitante, v.[FechaInicial] ASC, v.[HoraInicial] ASC
END
GO
/****** Object:  StoredProcedure [dbo].[getVisitasFuncionario]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos
-- Create date: 233-Julio-2009
-- Description:	Obtiene las visitas que ha recibido 
-- un funcionario para un rango de fechas
-- ==================================================

CREATE PROCEDURE [dbo].[getVisitasFuncionario]
	@idFuncionario int
	
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT p.[NomFuncionario]+ ' ' + p.[ApeFuncionario] Visitante,
		 v.[FechaInicial] 'Fecha', v.[HoraInicial] 'Entrada', v.[HoraFinal] 'Salida', 
		 v.[MotivoVisita] 'Motivo', v.[ElementosIngresa] 'Equipos',
		 (SELECT a.Estado FROM [Tbl_AgendaVisitasFuncionario] a WHERE a.Fecha = v.[Fecha] AND
		  a.IdFuncionario = f.[IdFuncionario] AND a.IdVisitante = p.[IdPersona]) 'Cita'
	FROM [Tbl_Personas] p, [Tbl_Visitas] v, [Tbl_Funcionarios] f
	WHERE v.[IdVisitante] = p.[IdPersona] AND 
	v.[RecibeVisita] = f.[IdFuncionario] AND f.[IdFuncionario] = @idFuncionario 
END
GO
/****** Object:  StoredProcedure [dbo].[getVariableLectorEmpresa]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================
-- Author:		Margarita Hoyos
-- Create date: 04-Dic-2009
-- Description:	Obtiene la variable que indica si
-- la empresa maneja lector mouse
-- ================================================
CREATE PROCEDURE [dbo].[getVariableLectorEmpresa]
	
AS
BEGIN

	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT TOP 1 [LectorMouse]
	FROM  [dbo].[Tbl_Empresa]

END
GO
/****** Object:  StoredProcedure [dbo].[getTodasVisitasFecha]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos
-- Create date: 14-Julio-2009
-- Description:	Obtiene las visitas que están pendientes
-- por salir
-- ==================================================

CREATE PROCEDURE [dbo].[getTodasVisitasFecha]
	@fechaInicial date,
	@fechaFinal date,
	@orden varchar(20)
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    IF @orden = 'Funcionario'
    BEGIN
		SELECT p.[NomFuncionario]+ ' ' + p.[ApeFuncionario] Visitante, f.[NomFuncionario]+ ' ' + f.[ApeFuncionario] Funcionario,
			 right('0'+DATENAME(DD, v.[FechaInicial]), 2) + '/' + right('0'+CAST(DATEPART(MONTH, v.[FechaInicial]) AS VARCHAR), 2) + '/'+ DATENAME(YYYY, v.[FechaInicial]) 'Fecha', 
			  v.[HoraInicial] 'Entrada', v.[HoraFinal] 'Salida', 
			 v.[MotivoVisita] 'Motivo', v.[ElementosIngresa] 'Equipos',
			 (SELECT TOP 1 agenda.Estado FROM [Tbl_AgendaVisitasFuncionario] agenda WHERE agenda.Fecha = v.[Fecha] AND
	  agenda.IdFuncionario = f.[IdFuncionario] AND agenda.IdVisitante = p.[IdPersona] ORDER BY
	  ABS(DATEDIFF(MINUTE, CONVERT(VARCHAR(12), agenda.[Hora] , 108), v.[HoraInicial]))) 'Cita'
		FROM [Tbl_Personas] p, [Tbl_Visitas] v, [Tbl_Funcionarios] f
		WHERE v.[IdVisitante] = p.[IdPersona] AND v.[RecibeVisita] = f.[IdFuncionario] 
			AND v.[Fecha] BETWEEN @fechaInicial AND @fechaFinal
			AND v.[StsActividad] <> '-'
		ORDER BY Funcionario, v.[FechaInicial] ASC, v.[HoraInicial] ASC
    END
    ELSE
		SELECT p.[NomFuncionario]+ ' ' + p.[ApeFuncionario] Visitante, f.[NomFuncionario]+ ' ' + f.[ApeFuncionario] Funcionario,
			 right('0'+DATENAME(DD, v.[FechaInicial]), 2) + '/' + right('0'+CAST(DATEPART(MONTH, v.[FechaInicial]) AS VARCHAR), 2) + '/'+ DATENAME(YYYY, v.[FechaInicial]) 'Fecha', 
			  v.[HoraInicial] 'Entrada', v.[HoraFinal] 'Salida', 
			 v.[MotivoVisita] 'Motivo', v.[ElementosIngresa] 'Equipos',
			 (SELECT TOP 1 agenda.Estado FROM [Tbl_AgendaVisitasFuncionario] agenda WHERE agenda.Fecha = v.[Fecha] AND
	  agenda.IdFuncionario = f.[IdFuncionario] AND agenda.IdVisitante = p.[IdPersona] ORDER BY
	  ABS(DATEDIFF(MINUTE, CONVERT(VARCHAR(12), agenda.[Hora] , 108), v.[HoraInicial]))) 'Cita'
		FROM [Tbl_Personas] p, [Tbl_Visitas] v, [Tbl_Funcionarios] f
		WHERE v.[IdVisitante] = p.[IdPersona] AND v.[RecibeVisita] = f.[IdFuncionario] 
			AND v.[Fecha] BETWEEN @fechaInicial AND @fechaFinal
			AND v.[StsActividad] <> '-'
		ORDER BY Visitante, v.[FechaInicial] ASC, v.[HoraInicial] ASC
		
END
GO
/****** Object:  StoredProcedure [dbo].[getTodasVisitas]    Script Date: 02/09/2013 11:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos
-- Create date: 14-Julio-2009
-- Description:	Obtiene las visitas que están pendientes
-- por salir
-- ==================================================

CREATE PROCEDURE [dbo].[getTodasVisitas]

AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT p.[NomFuncionario]+ ' ' + p.[ApeFuncionario] Visitante, f.[NomFuncionario]+ ' ' + f.[ApeFuncionario] Funcionario,
		 right('0'+DATENAME(DD, v.[FechaInicial]), 2) + '/' + right('0'+CAST(DATEPART(MONTH, v.[FechaInicial]) AS VARCHAR), 2) + '/'+ DATENAME(YYYY, v.[FechaInicial]) 'Fecha', 
		 v.[HoraInicial] 'Entrada', v.[HoraFinal] 'Salida', 
		 v.[MotivoVisita] 'Motivo', v.[ElementosIngresa] 'Equipos',
		 (SELECT a.Estado FROM [Tbl_AgendaVisitasFuncionario] a WHERE a.Fecha = v.[Fecha] AND
		  a.IdFuncionario = f.[IdFuncionario] AND a.IdVisitante = p.[IdPersona]) 'Cita'
	FROM [Tbl_Personas] p, [Tbl_Visitas] v, [Tbl_Funcionarios] f
	WHERE v.[IdVisitante] = p.[IdPersona] AND v.[RecibeVisita] = f.[IdFuncionario] 
		
END
GO
/****** Object:  StoredProcedure [dbo].[getTemplates]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos
-- Create date: 13-Julio-2009
-- Description:	Obtiene las huellas de la BD
-- ==================================================
CREATE PROCEDURE [dbo].[getTemplates]
	
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM  [dbo].[Tbl_Templates]
END
GO
/****** Object:  StoredProcedure [dbo].[getPermisoModificar]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos
-- Create date: 05-Junio-2009
-- Description:	Obtiene el valor del permiso upd
-- ==================================================
CREATE PROCEDURE [dbo].[getPermisoModificar]
	@intIdInterfaz int,
	@intIdPerfil int
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [upd]
  FROM [dbo].[Tbl_PermisosUsuarios]
  WHERE [iui] = @intIdInterfaz AND [perf] = @intIdPerfil
END
GO
/****** Object:  StoredProcedure [dbo].[getPermisoEliminar]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos
-- Create date: 05-Junio-2009
-- Description:	Obtiene el valor del permiso dro
-- ==================================================
CREATE PROCEDURE [dbo].[getPermisoEliminar]
	@intIdInterfaz int,
	@intIdPerfil int
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [dro]
  FROM [dbo].[Tbl_PermisosUsuarios]
  WHERE [iui] = @intIdInterfaz AND [perf] = @intIdPerfil
END
GO
/****** Object:  StoredProcedure [dbo].[getPermisoAdicionar]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos
-- Create date: 05-Junio-2009
-- Description:	Obtiene el id de la interfaz
-- ==================================================
CREATE PROCEDURE [dbo].[getPermisoAdicionar]
	@intIdInterfaz int,
	@intIdPerfil int
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [adic]
  FROM [dbo].[Tbl_PermisosUsuarios]
  WHERE [iui] = @intIdInterfaz AND [perf] = @intIdPerfil
END
GO
/****** Object:  StoredProcedure [dbo].[getNumeroNuevoContrato]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos
-- Create date: 01-Junio-2009
-- Description:	Obtiene un numero valido para 
-- registrar un nuevo tipo de contrato
-- ==================================================
CREATE PROCEDURE [dbo].[getNumeroNuevoContrato]
	
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT MAX([ClaseContrato]) + 1 Numero
	FROM  [dbo].[Tbl_ClaseContratos]
END
GO
/****** Object:  StoredProcedure [dbo].[getDatosTicketParqueadero]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================
-- Author:		Margarita Hoyos
-- Create date: 30-Jun-2011
-- Description:	Obtiene los datos del ticket de
-- visita a pacientes
-- ================================================
CREATE PROCEDURE [dbo].[getDatosTicketParqueadero]
	@Placa varchar(10),
	@Fecha date
AS
BEGIN

	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT Nombre +' '+Apellido 'Nombre', Documento, FechaInicio Fecha, HoraInicio Hora, IdVehiculo Placa
	FROM  [dbo].[Tbl_MarcacionesVehiculos]
	WHERE [Tbl_MarcacionesVehiculos].[Estado] = 'E' And 
		  [Tbl_MarcacionesVehiculos].[IdVehiculo] = @Placa And
		  [Tbl_MarcacionesVehiculos].[FechaInicio] = @Fecha

END
GO
/****** Object:  StoredProcedure [dbo].[getDatosTicket2]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================
-- Author:		Margarita Hoyos
-- Create date: 26-Nov-2009
-- Description:	Obtiene los datos del ticket de
-- visita
-- ================================================
CREATE PROCEDURE [dbo].[getDatosTicket2]
	@fecha date,
	@idVisitante bigint
AS
BEGIN

	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [Tbl_Personas].[NomFuncionario] + ' '+ [Tbl_Personas].[ApeFuncionario] Nombre, 
		   [Tbl_Personas].[IdPersona] Documento, [Tbl_Visitas].[FechaInicial] fecha, 
		   [Tbl_Visitas].[HoraInicial] hora,[Tbl_Funcionarios].[NomFuncionario] + ' ' + [Tbl_Funcionarios].[ApeFuncionario] Funcionario,
		   [Tbl_Dependencias].[Dependencia] Area, (SELECT Nombre FROM [dbo].[Tbl_Terceros] WHERE [Id_Tercero] = [Tbl_Visitas].[Proveedor]) Proveedor, [Tbl_Personas].[Foto] 
	FROM  [dbo].[Tbl_Personas], [dbo].[Tbl_Visitas], [dbo].[Tbl_Funcionarios], [dbo].[Tbl_Dependencias]
	WHERE [Tbl_Personas].[IdPersona] = [Tbl_Visitas].[IdVisitante] AND [Tbl_Visitas].[area] = [Tbl_Dependencias].[CodigoDependencia]
		  AND [Tbl_Funcionarios].[IdFuncionario] = [Tbl_Visitas].[RecibeVisita] AND [Tbl_Personas].[IdPersona] = @idVisitante
		  AND [Tbl_Visitas].[FechaInicial] = @fecha AND [Tbl_Visitas].[StsActividad] = 'E'

END
GO
/****** Object:  StoredProcedure [dbo].[getDatosTicket]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================
-- Author:		Margarita Hoyos
-- Create date: 26-Nov-2009
-- Description:	Obtiene los datos del ticket de
-- visita
-- ================================================
CREATE PROCEDURE [dbo].[getDatosTicket]
	@fecha date,
	@idVisitante bigint
AS
BEGIN

	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [Tbl_Personas].[NomFuncionario] + ' '+ [Tbl_Personas].[ApeFuncionario] Nombre, 
		   [Tbl_Personas].[IdPersona] Documento, [Tbl_Visitas].[FechaInicial] fecha, 
		   [Tbl_Visitas].[HoraInicial] hora,[Tbl_Funcionarios].[NomFuncionario] + ' ' + [Tbl_Funcionarios].[ApeFuncionario] Funcionario,
		   [Tbl_Dependencias].[Dependencia] Area, [Tbl_Personas].[Foto] 
	FROM  [dbo].[Tbl_Personas], [dbo].[Tbl_Visitas], [dbo].[Tbl_Funcionarios], [dbo].[Tbl_Dependencias]
	WHERE [Tbl_Personas].[IdPersona] = [Tbl_Visitas].[IdVisitante] AND [Tbl_Visitas].[area] = [Tbl_Dependencias].[CodigoDependencia]
		  AND [Tbl_Funcionarios].[IdFuncionario] = [Tbl_Visitas].[RecibeVisita] AND [Tbl_Personas].[IdPersona] = @idVisitante
		  AND [Tbl_Visitas].[FechaInicial] = @fecha AND [Tbl_Visitas].[StsActividad] = 'E'

END
GO
/****** Object:  StoredProcedure [dbo].[getDatosRegistroVisita]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================
-- Author:		Margarita Hoyos
-- Create date: 30-Septiembre-2009
-- Description:	Obtiene los datos del formulario de
-- registro y control de visitas
-- ================================================
CREATE PROCEDURE [dbo].[getDatosRegistroVisita]
AS
BEGIN

	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [Tbl_Personas].[NomFuncionario] NmbPersona, [Tbl_Personas].[ApeFuncionario] ApePersona, 
			[Tbl_Personas].[IdPersona], [Tbl_Personas].[TelCasa] TelPersona, [Tbl_Personas].[Empresa],
			[Tbl_Personas].[Observaciones], [Tbl_Personas].[Foto]
	FROM  [dbo].[Tbl_Personas] 
	--WHERE [Activo] = 'true'

END
GO
/****** Object:  StoredProcedure [dbo].[getDatosPersonaXCodigo]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos
-- Create date: 25-Nov-2009
-- Description:	Obtiene los datos del Visitante
-- ==================================================
CREATE PROCEDURE [dbo].[getDatosPersonaXCodigo]
	@intCodigo int
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [Tbl_Personas].*, [Tbl_Visitas].[area], [Tbl_Visitas].[IdUsuario], [Tbl_Visitas].[RecibeVisita]
	FROM  [Tbl_Personas], [Tbl_Visitas]
	WHERE [Tbl_Visitas].[IdVisitante] = [Tbl_Personas].[IdPersona] AND 
			[Tbl_Visitas].[Fecha] = CONVERT(VARCHAR(12), GETDATE(), 111) AND
			[Tbl_Visitas].[StsActividad] <>'-' AND [Tbl_Personas].[CodEmpleado] = @intCodigo
	ORDER BY ABS(DATEDIFF(MINUTE, CONVERT(VARCHAR(12), getdate(), 108), [Tbl_Visitas].[HoraInicial]))
END
GO
/****** Object:  StoredProcedure [dbo].[getDatosPersona]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos
-- Create date: 13-Julio-2009
-- Description:	Obtiene los datos de la persona que
-- llega como visitante.
-- ==================================================
CREATE PROCEDURE [dbo].[getDatosPersona]
	@intId float
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [IdPersona]
	  ,[CodEmpleado]
      ,[NomFuncionario]
      ,[ApeFuncionario]
      ,[Foto]
      ,[TelCasa]
      ,[Empresa]
      ,[Observaciones]
      ,[Celular]
      ,[contratista]
      ,[fechavigenciaARP]
      
  FROM  [dbo].[Tbl_Personas]
  WHERE [IdPersona]= @intId
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerCodigosBarras]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos
-- Create date: 09-Junio-2011
-- Description:	Obtiene los códigos de barras de los
-- equipos que ingresó el visitante
-- ==================================================
CREATE PROCEDURE [dbo].[ObtenerCodigosBarras]
	@IdVisitante float,
	@fecha date
	
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT CodigosBarras FROM [dbo].[Tbl_Visitas]
    WHERE [StsActividad] = 'E' AND [IdVisitante]= @IdVisitante AND [Fecha] = @fecha
    
END
GO
/****** Object:  StoredProcedure [dbo].[modificaVisitas_x_Funcionario2]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Marisol 
-- Create date: 17-Noviembre-2009
-- Description:	
-- ==================================================
CREATE PROCEDURE [dbo].[modificaVisitas_x_Funcionario2]
	@IdVisitante bigint,
	@Motivo text,
	@NomPersona nvarchar(50),
	@ApePersona nvarchar(50),
	@csc  int,
	@celular float,
	@email nvarchar(50),
	@estado nvarchar(50),
	@contratista bit
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here

		BEGIN
			UPDATE Tbl_AgendaVisitasFuncionario SET IdVisitante=@IdVisitante,Motivo=@Motivo,Estado=@estado,FechaModifica=GETDATE() 
			WHERE csc=@csc
		END
		
		BEGIN
			IF EXISTS(SELECT IdPersona, NomFuncionario, ApeFuncionario FROM Tbl_Personas WHERE (IdPersona = @IdVisitante) )
			BEGIN 
				UPDATE Tbl_Personas SET NomFuncionario=@NomPersona,ApeFuncionario=@ApePersona,Celular=@celular,eMail=@email,contratista=@contratista,FechaModifica=GETDATE()
				WHERE IdPersona=@IdVisitante
			END
			ELSE
			BEGIN
				INSERT INTO Tbl_Personas (IdPersona,NomFuncionario,ApeFuncionario,Celular,eMail,contratista,CodEmpleado,FechaCrea) VALUES(@IdVisitante,@NomPersona,@ApePersona,@celular,@email,@contratista,(SELECT isnull((Max(Tbl_Personas.CodEmpleado)+1),1) codigo FROM Tbl_Personas ),GETDATE())
			END
		END 
	
END
GO
/****** Object:  StoredProcedure [dbo].[modificaVisitas_x_Funcionario]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Marisol 
-- Create date: 17-Noviembre-2009
-- Description:	
-- ==================================================
CREATE PROCEDURE [dbo].[modificaVisitas_x_Funcionario]
	@IdFuncionario bigint,
	@Fecha date,
	@Hora time(7),
	@IdVisitante bigint,
	@Motivo text,
	@NomPersona nvarchar(50),
	@ApePersona nvarchar(50),
	@csc  int,
	@celular float,
	@email nvarchar(50),
	@estado nvarchar(50),
	@contratista bit
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		--IF NOT EXISTS(SELECT  IdFuncionario,Fecha,Hora	FROM	Tbl_AgendaVisitasFuncionario WHERE IdFuncionario=@IdFuncionario AND Fecha=@Fecha AND Hora= @Hora )
		IF @IdFuncionario<>0  
		BEGIN
			BEGIN
				UPDATE Tbl_AgendaVisitasFuncionario SET Fecha=@fecha,Hora=@Hora,IdVisitante=@IdVisitante,Motivo=@Motivo,Estado=@estado,FechaModifica=GETDATE() 
				WHERE csc=@csc
			END
			
			BEGIN
				IF EXISTS(SELECT IdPersona, NomFuncionario, ApeFuncionario FROM Tbl_Personas WHERE (IdPersona = @IdVisitante) )
				BEGIN 
					UPDATE Tbl_Personas SET NomFuncionario=@NomPersona,ApeFuncionario=@ApePersona,Celular=@celular,eMail=@email,contratista=@contratista,FechaModifica=GETDATE()
					WHERE IdPersona=@IdVisitante
				END
				ELSE
				BEGIN
					INSERT INTO Tbl_Personas (IdPersona,NomFuncionario,ApeFuncionario,Celular,eMail,contratista,CodEmpleado,FechaCrea) VALUES(@IdVisitante,@NomPersona,@ApePersona,@celular,@email,@contratista,(SELECT isnull((Max(Tbl_Personas.CodEmpleado)+1),1) codigo FROM Tbl_Personas ),GETDATE())
				END
			END 
		END
END
GO
/****** Object:  StoredProcedure [dbo].[modificaIdPersona]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Marisol 
-- Create date: 26-Febrero-2010
-- Description:	
-- ==================================================
CREATE PROCEDURE [dbo].[modificaIdPersona]
	@newIdPersona bigint,
	@IdPersona as bigint
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here

		BEGIN 
			UPDATE Tbl_Personas SET Tbl_Personas.IdPersona=@newIdPersona
			WHERE Tbl_Personas.IdPersona=@IdPersona
		END
END
GO
/****** Object:  StoredProcedure [dbo].[obtenerHistoria_x_Usuario]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Marisol 
-- Create date: 04-Dic-2009
-- Description:	
-- ==================================================
CREATE PROCEDURE [dbo].[obtenerHistoria_x_Usuario]
@IdUsuario int

AS
BEGIN
	SET NOCOUNT ON;
	    -- Insert statements for procedure here
		IF EXISTS (SELECT * FROM Tbl_AgendaVisitasFuncionario WHERE IdUsuario=@IdUsuario)
		BEGIN
			SELECT * FROM Tbl_AgendaVisitasFuncionario WHERE IdUsuario=@IdUsuario		
		END 
		ELSE
		BEGIN
			SELECT * FROM Tbl_Visitas WHERE IdUsuario=@IdUsuario		
		END
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerEntradasDia]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos
-- Create date: 04-Febrero-2011
-- Description:	Obtiene los vehiculos que han entrado
-- en la fecha
-- ==================================================

CREATE PROCEDURE [dbo].[ObtenerEntradasDia]
	@Fecha date
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT IdMarcacion Csc, IdVehiculo Placa,
			FechaInicio FEntrada , HoraInicio HEntrada, FechaFin FSalida, HoraFin HSalida, Estado,
			DATEDIFF(MI,HoraInicio, HoraFin) As 'Min'
	FROM [Tbl_MarcacionesVehiculos], [Tbl_Empresa]
	WHERE [Tbl_MarcacionesVehiculos].[IdEmpresa] = [Tbl_Empresa].[Id_Tercero] AND [Tbl_MarcacionesVehiculos].[FechaInicio] = @Fecha
	ORDER BY [Tbl_MarcacionesVehiculos].[HoraInicio] DESC
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerDependencias]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Margarita Hoyos
-- Create date: 02-Febero-2010
-- Description:	Obtiene los registros de Tbl_Dependencias
-- =============================================
CREATE PROCEDURE [dbo].[ObtenerDependencias]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT [CodigoDependencia] 'Código', [Dependencia], [Tbl_Empresa].[NombreEmpresa] Empresa
	FROM [dbo].[Tbl_Dependencias], [dbo].[Tbl_Empresa]
	WHERE [Tbl_Empresa].[Id_Tercero] = [Tbl_Dependencias].[IdEmpresa]
	ORDER BY [Tbl_Empresa].[Id_Tercero]

END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerDatosVisitantePaciente]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos
-- Create date: 23-Marzo-2011
-- Description:	Obtiene los Datos de un Visitante de
-- pacientes
-- ==================================================
CREATE PROCEDURE [dbo].[ObtenerDatosVisitantePaciente]
	@IdVisitante varchar(20)
	
AS
	BEGIN
		SET NOCOUNT ON;

		-- Insert statements for procedure here

			SELECT [Identificacion], [Nombre], [Foto]
			FROM [dbo].[Tbl_VisitantePaciente]
			WHERE [Identificacion] = @IdVisitante

	END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerDatosVehiculo]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos
-- Create date: 05-Julio-2011
-- Description:	Obtiene la Información de un vehiculo
-- ==================================================
CREATE PROCEDURE [dbo].[ObtenerDatosVehiculo]
	@Placa varchar(10)
	
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here

		SELECT Ciudad, Marca, TipoVehiculo, Modelo, NumeroChasis, Color, 
			   Foto, NumeroMotor, NombrePropietario, ApellidoPropietario
		FROM   Tbl_Vehiculos
		WHERE  Placa = @Placa
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerDatosTagAsignadoVisitante]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos
-- Create date: 13-Sep-2011
-- Description:	Obtiene los datos del tag RFID asignado
--  a un visitante.
-- ==================================================
CREATE PROCEDURE [dbo].[ObtenerDatosTagAsignadoVisitante]
	@IdVisitante float,
	@Fecha date
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [Tbl_TagsxVisitante].[Id], [Tbl_Tags].[IdTag]
	FROM [Tbl_TagsxVisitante], [Tbl_Personas], [Tbl_Tags]
	WHERE [Tbl_TagsxVisitante].[Fecha] = @Fecha AND [Tbl_TagsxVisitante].[Visitante] = [Tbl_Personas].[IdPersona] AND
		  [Tbl_TagsxVisitante].[Tag] = [Tbl_Tags].[IdTag] AND
		  [Tbl_Personas].[IdPersona] = @IdVisitante AND
		  [Tbl_Tags].[Estado] = 'O'

		  
END
GO
/****** Object:  StoredProcedure [dbo].[obtenerDatosPersonaVisita]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Marisol 
-- Create date: 17-Noviembre-2009
-- Description:	
-- ==================================================
CREATE PROCEDURE [dbo].[obtenerDatosPersonaVisita]
	@IdPersona bigint
	
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here

		SELECT     Tbl_Personas.NomFuncionario, Tbl_Personas.ApeFuncionario,Tbl_Personas.Celular,Tbl_Personas.eMail,Tbl_Personas.TelCasa,Tbl_Personas.contratista
		FROM       Tbl_Personas 
		WHERE      Tbl_Personas.IdPersona=@IdPersona
END
GO
/****** Object:  StoredProcedure [dbo].[obtenerDatosPersonaCombo]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Marisol 
-- Create date: 09-mar-2010
-- Description:	obitiene lista de las personas registradas 
-- ==================================================
CREATE PROCEDURE [dbo].[obtenerDatosPersonaCombo]
	
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here

		SELECT     IdPersona, NomFuncionario, ApeFuncionario, Celular, eMail, TelCasa, contratista, (STR(IdPersona) + '  ' + NomFuncionario + '  ' + ApeFuncionario) as IdePersona, (NomFuncionario + '  ' + ApeFuncionario + '  ' + STR(IdPersona)) as Nombre, (ApeFuncionario + '  ' + NomFuncionario + '  ' + STR(IdPersona))as Apellido
		FROM       Tbl_Personas
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerDatosPermisoTagArea]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos
-- Create date: 19-Diciembre-2011
-- Description:	Obtiene la información de autorización
-- de un Tag en una área.
-- ==================================================
CREATE PROCEDURE [dbo].[ObtenerDatosPermisoTagArea]
	@IdTag varchar(255),
	@Area int
	
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SELECT  Tbl_PermisosxAreas.TipoPermiso, Tbl_PermisosxAreas.FrecuenciaReconocimiento,
			Tbl_PermisosxAreas.FechaInicial, Tbl_PermisosxAreas.FechaFinal
	FROM    Tbl_PermisosxAreas, Tbl_Dependencias
	WHERE   Tbl_PermisosxAreas.[Dependencia] = Tbl_Dependencias.[CodigoDependencia] 
			AND Tbl_PermisosxAreas.[Tag] = @IdTag AND Tbl_PermisosxAreas.[Dependencia] = @Area
			

END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerDatosPermisoLectorTag]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos
-- Create date: 12-Enero-2012
-- Description:	Obtiene la información de autorización
-- un lector y tag en un área
-- ==================================================
CREATE PROCEDURE [dbo].[ObtenerDatosPermisoLectorTag]
	@IdTag varchar(255),
	@IdLector int
	
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	SELECT TipoPermiso, FechaInicial, FechaFinal FROM Tbl_PermisosxAreas 
	WHERE Tag = @IdTag AND Dependencia IN 
	(
		SELECT Area FROM Tbl_Lectores_x_Area WHERE Lector = @IdLector
	)
	--WHERE   Tbl_PermisosxAreas.[Dependencia] = Tbl_Dependencias.[CodigoDependencia] 
	--		AND Tbl_PermisosxAreas.[Tag] = @IdTag AND Tbl_PermisosxAreas.[Dependencia] = @Area
		

END
GO
/****** Object:  StoredProcedure [dbo].[modifica_EstadoUsuario]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marisol Nieto
-- Create date: 11-Dic-2009
-- Description:	Actualiza el estado al usuario
-- =============================================
CREATE PROCEDURE [dbo].[modifica_EstadoUsuario]
@IdUsuario int,
@activo bit
AS
BEGIN

	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[Tbl_usuarios]
           SET [activo] = @activo
           ,[fechaMod] = GETDATE()
           WHERE [IdUsuario] = @IdUsuario
           
END
GO
/****** Object:  StoredProcedure [dbo].[getDatosMenuPadre]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ===============================================
-- Author:		Diego Guevara
-- Create date: 17-Nov-2008
-- Description:	Obtiene los items que son opciones
-- padres
-- ===============================================
CREATE PROCEDURE [dbo].[getDatosMenuPadre]
	@PValIdPerfil INT 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT [MenuId]
      ,[Descripcion]
      ,[Posicion]
      ,[Icono]
      ,[Habilitado]
      ,[Url]
      ,[UsuarioCrea]
      ,[FechaCrea]
      ,[UsuarioModifica]
      ,[FechaModifica]
  FROM [dbo].[Tbl_Menus], [dbo].[Tbl_MenusxPerfil]
  WHERE [Tbl_MenusxPerfil].[idMenu] = [MenuId] AND [Tbl_MenusxPerfil].[idPerfil] = @PValIdPerfil
  ORDER BY [Posicion] ASC
END
GO
/****** Object:  StoredProcedure [dbo].[getNumeroNuevoCentroCosto]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos
-- Create date: 01-Junio-2009
-- Description:	Obtiene un numero valido para 
-- registrar un nuevo centro de costo
-- ==================================================
CREATE PROCEDURE [dbo].[getNumeroNuevoCentroCosto]
	
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT MAX([CentroCosto]) + 1 Numero
	FROM  [dbo].[Tbl_CentrosCosto]
END
GO
/****** Object:  StoredProcedure [dbo].[obtieneUsuarios_x_Funcionario]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos
-- Create date: 12-Diciembre-2009
-- Description:	Obtiene Los Usuarios que programan un Funcionario
-- ==================================================
CREATE PROCEDURE [dbo].[obtieneUsuarios_x_Funcionario]
@IdFuncionario int
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		SELECT     Tbl_usuarios.IdUsuario, Tbl_usuarios.nombre
		FROM       Tbl_usuarios INNER JOIN
				   Tbl_Funcionarios_x_Usuario ON Tbl_usuarios.IdUsuario = Tbl_Funcionarios_x_Usuario.IdUsuario
		WHERE     (Tbl_Funcionarios_x_Usuario.IdFuncionario = @IdFuncionario)
            
END
GO
/****** Object:  StoredProcedure [dbo].[obtieneDoc_PassUsuario]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marisol Nieto
-- Create date: 01-Dic-2009
-- Description:	obtiene el documento y contraseña del usuario
-- =============================================
CREATE PROCEDURE [dbo].[obtieneDoc_PassUsuario]
@login varchar (15),
@passwd varchar (255)

AS
BEGIN

	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM  [Tbl_usuarios]
    WHERE [Tbl_usuarios].[login]=@login

END
GO
/****** Object:  StoredProcedure [dbo].[obtieneDatos_Usuario]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Marisol 
-- Create date: 26-Noviembre-2009
-- Description:	Tomando como condición el login obtiene los datos del usuario
-- ==================================================
CREATE PROCEDURE [dbo].[obtieneDatos_Usuario]
@login nvarchar(255)

AS
BEGIN
	SET NOCOUNT ON;
    -- Insert statements for procedure here
		SELECT * 
		FROM Tbl_usuarios
		WHERE  [Tbl_usuarios].[login]=@login
END
GO
/****** Object:  StoredProcedure [dbo].[eliminarMenu_x_Perfil]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Margarita Hoyos
-- Create date: 27-Enero-2009
-- Description:	Elimina un menu de un perfil
-- =============================================
CREATE PROCEDURE [dbo].[eliminarMenu_x_Perfil]
	@idMenu int,
	@idPerfil int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    DELETE [dbo].[Tbl_MenusxPerfil] WHERE [idMenu] = @idMenu AND [idPerfil] = @idPerfil

END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerPlacaVehiculo_IdTag]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Margarita Hoyos
-- Create date: 05-Jul-2011
-- Description:	Obtiene la placa de un vehículo, 
-- usando el Id del Tag
-- =============================================
CREATE PROCEDURE [dbo].[ObtenerPlacaVehiculo_IdTag]
	
	@IDTag varchar(255)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT IdVehiculo FROM Tbl_TagsxVehiculo WHERE CAST(IdTag AS int) = @IDTag
END
GO
/****** Object:  StoredProcedure [dbo].[obtenerMenus_x_Perfil]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Margarita Hoyos
-- Create date: 27-Enero-2009
-- Description:	obtiene los menus para un perfil
-- =============================================
CREATE PROCEDURE [dbo].[obtenerMenus_x_Perfil]
	@idPerfil int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT [Tbl_Menus].[MenuId], [Tbl_Menus].[Descripcion] Menu
    FROM [dbo].[Tbl_Menus]
    WHERE [Tbl_Menus].[MenuId] NOT IN (SELECT [idMenu] FROM [dbo].[Tbl_MenusxPerfil] WHERE [idPerfil] = @idPerfil)

END
GO
/****** Object:  StoredProcedure [dbo].[obtenerLectoresTransferencia]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos 
-- Create date: 16-Diciembre-2009
-- Description:	
-- ==================================================
CREATE PROCEDURE [dbo].[obtenerLectoresTransferencia]
	@IdArea smallint
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [Tbl_Lectores].*
	FROM [Tbl_Lectores_x_Area], [Tbl_Dependencias], [Tbl_Lectores]
	WHERE [Tbl_Lectores_x_Area].[Area] = [Tbl_Dependencias].[CodigoDependencia] 
	AND [Tbl_Lectores_x_Area].[Lector] = [Tbl_Lectores].[NumeroLector] AND 
	[Tbl_Lectores_x_Area].[Area] = @IdArea 
END
GO
/****** Object:  StoredProcedure [dbo].[obtenerLectores_x_Area]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos 
-- Create date: 16-Diciembre-2009
-- Description:	
-- ==================================================
CREATE PROCEDURE [dbo].[obtenerLectores_x_Area]
	
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [Tbl_Lectores_x_Area].[Area], [Tbl_Lectores_x_Area].[Lector] idLector, [Tbl_Dependencias].[Dependencia] Dependencia, [Tbl_Lectores].[NombreLector] Lector
	FROM [Tbl_Lectores_x_Area], [Tbl_Dependencias], [Tbl_Lectores]
	WHERE [Tbl_Lectores_x_Area].[Area] = [Tbl_Dependencias].[CodigoDependencia] AND [Tbl_Lectores_x_Area].[Lector] = [Tbl_Lectores].[NumeroLector] 
END
GO
/****** Object:  StoredProcedure [dbo].[getLoginUsuario]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos
-- Create date: 12-Diciembre-2008
-- Description:	Obtiene el login del usuario
-- ==================================================
CREATE PROCEDURE [dbo].[getLoginUsuario]
	@IdUsuario INT 
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [login]
	FROM  [dbo].[Tbl_usuarios]
	WHERE [IdUsuario] = @IdUsuario
END
GO
/****** Object:  StoredProcedure [dbo].[getLectoresValidos_x_Area]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos
-- Create date: 16-Diciembre-2009
-- Description:	Obtiene 
-- ==================================================
CREATE PROCEDURE [dbo].[getLectoresValidos_x_Area]
	@IdArea smallint
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	  SELECT [NombreLector], [NumeroLector]
	  FROM  [Tbl_Lectores]
	  WHERE [Tbl_Lectores].[NumeroLector] NOT IN (SELECT [Lector] FROM [Tbl_Lectores_x_Area] WHERE [Area] = @IdArea)
			AND [Tbl_Lectores].[NumeroLector] <> 0
END
GO
/****** Object:  StoredProcedure [dbo].[getCitasFecha]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos
-- Create date: 01-Dic-2009
-- Description:	Obtiene las citas para una determinada
-- fecha
-- ==================================================
CREATE PROCEDURE [dbo].[getCitasFecha]
	@fecha date
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [Tbl_Personas].[IdPersona], [Tbl_Personas].[NomFuncionario] + ' ' + [Tbl_Personas].[ApeFuncionario] Visitante,
			[Tbl_Funcionarios].[NomFuncionario] + ' ' + [Tbl_Funcionarios].[ApeFuncionario] Funcionario,
			[Tbl_AgendaVisitasFuncionario].[Hora], [Tbl_usuarios].[nombre] 'Programó',
			[Tbl_AgendaVisitasFuncionario].[csc]
	FROM [Tbl_Funcionarios], [Tbl_Personas], [Tbl_AgendaVisitasFuncionario], [Tbl_usuarios]
	WHERE [Tbl_Personas].[IdPersona] = [Tbl_AgendaVisitasFuncionario].[IdVisitante] AND
		  [Tbl_Funcionarios].[IdFuncionario] = [Tbl_AgendaVisitasFuncionario].[IdFuncionario] AND
		  [Tbl_usuarios].[IdUsuario] = [Tbl_AgendaVisitasFuncionario].[IdUsuario] AND [Tbl_AgendaVisitasFuncionario].[Fecha] = @fecha AND
		  ([Tbl_AgendaVisitasFuncionario].[Estado] = 'PROGRAMADO' OR [Tbl_AgendaVisitasFuncionario].[Estado] = 'CONFIRMADA')
	ORDER BY ABS(DATEDIFF(MINUTE, CONVERT(VARCHAR(12), getdate(), 108), Hora))

		  
END
GO
/****** Object:  StoredProcedure [dbo].[getDatosUsuario]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Diego Guevara
-- Create date: 22-Noviembre-2008
-- Description:	Obtiene los datos del usuario
-- ==================================================
CREATE PROCEDURE [dbo].[getDatosUsuario]
	@PTxtLogin varchar(255),
	@PTxtPassword varchar(255)
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [IdUsuario]
      ,[login]
      ,[nombre]
      ,[passwd]
      ,[perfil]
      ,[activo]
      ,[documento]
      ,[usrCrea]
      ,[fechaCrea]
      ,[usrMod]
      ,[fechaMod]
  FROM  [dbo].[Tbl_usuarios]
  WHERE [login]= @PTxtLogin And [passwd]=@PTxtPassword
END
GO
/****** Object:  StoredProcedure [dbo].[eliminarUsuario]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Marisol 
-- Create date: 04-Dic-2009
-- Description:	
-- ==================================================
CREATE PROCEDURE [dbo].[eliminarUsuario]
@IdUsuario int

AS
BEGIN
	SET NOCOUNT ON;
	    -- Insert statements for procedure here
			DELETE 
			FROM Tbl_usuarios
			WHERE IdUsuario=@IdUsuario
		
END
GO
/****** Object:  StoredProcedure [dbo].[eliminaLector_x_Area]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita
-- Create date: 16-Diciembre-2009
-- Description:	
-- ==================================================
CREATE PROCEDURE [dbo].[eliminaLector_x_Area]
	@idArea int,
	@idLector int
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here

		BEGIN
			DELETE 
			FROM [Tbl_Lectores_x_Area]
			WHERE [Area] = @idArea AND [Lector] = @idLector
		END
END
GO
/****** Object:  StoredProcedure [dbo].[adicionaLectores_x_Area]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos 
-- Create date: 16-Diciembre-2009
-- Description:	
-- ==================================================
CREATE PROCEDURE [dbo].[adicionaLectores_x_Area]
	@IdLector int,
	@IdArea smallint
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO [Tbl_Lectores_x_Area] VALUES(@IdArea, @IdLector)
END
GO
/****** Object:  StoredProcedure [dbo].[crearMenu_x_Perfil]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Margarita Hoyos
-- Create date: 27-Enero-2009
-- Description:	Crea un registro en la Tbl_MenuxPerfil
-- =============================================
CREATE PROCEDURE [dbo].[crearMenu_x_Perfil]
	@idMenu int,
	@idPerfil int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    INSERT INTO [dbo].[Tbl_MenusxPerfil] VALUES(@idMenu,@idPerfil)

END
GO
/****** Object:  StoredProcedure [dbo].[prcValidaLogin]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Diego Guevara
-- Create date: 17-Nov-2008
-- Description:	Valida un usuario, teniendo en
-- cuenta su login y password
-- =============================================
CREATE PROCEDURE [dbo].[prcValidaLogin]
	
	@PTxtLogin varchar(15),
	@PTxtPassword varchar(255)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT [IdUsuario]
      ,[nombre]
      ,[perfil]
      ,[activo]
      ,[tpoDocumento]
      ,[documento]
      ,[direccion]
      ,[telefono]
      ,[correo]
      ,[usrCrea]
      ,[fechaCrea]
      ,[usrMod]
      ,[fechaMod]
  FROM [dbo].[Tbl_usuarios]
  WHERE [login]=@PTxtLogin 
	AND [passwd]= @PTxtPassword

END
GO
/****** Object:  StoredProcedure [dbo].[prcCambiarPasswd]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Margarita Hoyos
-- Create date: 22-Julio-2009
-- Description:	Cambia la contraseña del usuario
-- =============================================
CREATE PROCEDURE [dbo].[prcCambiarPasswd]
@idUsuario int,
@passwd varchar(max)

AS
BEGIN

	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[Tbl_usuarios] SET [passwd] = @passwd
	WHERE [IdUsuario] = @idUsuario

END
GO
/****** Object:  StoredProcedure [dbo].[prcDisponibilidadLogin]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Margarita Hoyos
-- Create date: 22-Julio-2009
-- Description:	Verifica si el login ya existe
-- =============================================
CREATE PROCEDURE [dbo].[prcDisponibilidadLogin]
	
	@login varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT COUNT(*) FROM [dbo].[Tbl_usuarios] WHERE [login] = @login 

END
GO
/****** Object:  StoredProcedure [dbo].[prcDisponibilidadDocumento]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Marisol Nieto
-- Create date: 02-Dic-2009
-- Description:	Verifica si existe un usuario de acuerdo al númeo de documento
-- =============================================
CREATE PROCEDURE [dbo].[prcDisponibilidadDocumento]
	
	@documento bigint
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT COUNT(*) FROM [dbo].[Tbl_usuarios] WHERE [documento] = @documento 

END
GO
/****** Object:  StoredProcedure [dbo].[prcCrearUsuario]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Margarita Hoyos
-- Create date: 22-Julio-2009
-- Description:	Crea un nuevo usuario
-- Modify date: 02-dic-2009
-- =============================================
CREATE PROCEDURE [dbo].[prcCrearUsuario]
@login varchar (15),
@documento bigint,
@nombre varchar (255),
@idPerfil int,
@activo bit
AS
BEGIN

	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO  [dbo].[Tbl_usuarios]
           ([login]
           ,[nombre]
           ,[passwd]
           ,[perfil]
           ,[activo]
           ,[usrCrea]
           ,[fechaCrea]
           ,[tpoDocumento]
           ,[documento]
           ,[IdUsuario])
     VALUES
           (@login
           ,@nombre
           ,@documento
           ,@idPerfil
           ,@activo
           ,'userc'
           ,GETDATE()
           ,1
           ,@documento
           ,@documento)

END
GO
/****** Object:  StoredProcedure [dbo].[obtenerTblMenus_x_Perfil]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Margarita Hoyos
-- Create date: 27-Enero-2009
-- Description:	obtiene los menus para un perfil
-- =============================================
CREATE PROCEDURE [dbo].[obtenerTblMenus_x_Perfil]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT [Tbl_PerfilesUsuarios].[idPerfil], [Tbl_Menus].[MenuId], [Tbl_PerfilesUsuarios].[nmb] Perfil, [Tbl_Menus].[Descripcion] Menu
    FROM [dbo].[Tbl_Menus], [dbo].[Tbl_PerfilesUsuarios], [dbo].[Tbl_MenusxPerfil]
    WHERE [Tbl_Menus].[MenuId] = [Tbl_MenusxPerfil].[idMenu] AND [Tbl_PerfilesUsuarios].[idPerfil] = [Tbl_MenusxPerfil].[idPerfil]
    ORDER BY [Tbl_PerfilesUsuarios].[idPerfil]

END
GO
/****** Object:  StoredProcedure [dbo].[prcActualizarUsuario]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Margarita Hoyos
-- Create date: 22-Julio-2009
-- Description:	Actualiza datos de un nuevo usuario
-- =============================================
CREATE PROCEDURE [dbo].[prcActualizarUsuario]
@login varchar (15),
@documento varchar (255),
@nombre varchar (255),
@idPerfil int,
@activo bit
AS
BEGIN

	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[Tbl_usuarios]
           SET [nombre] = @nombre
           --,[documento] = @documento
           ,[perfil] = @idPerfil
           ,[activo] = @activo
           ,[fechaMod] = GETDATE()
           WHERE [login] = @login
           
END
GO
/****** Object:  Table [dbo].[Tbl_Funcionarios]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_Funcionarios](
	[IdFuncionario] [float] NOT NULL,
	[CodEmpleado] [int] NULL,
	[Empresa] [int] NULL,
	[NumeroSede] [smallint] NULL,
	[NomFuncionario] [nvarchar](50) NULL,
	[ApeFuncionario] [nvarchar](50) NULL,
	[CodigoDependencia] [int] NULL,
	[MesCumpleaños] [smallint] NULL,
	[DiaCumpleaños] [smallint] NULL,
	[DireccionCorrespondencia] [nvarchar](50) NULL,
	[Ciudad] [int] NULL,
	[ZonaPostal] [smallint] NULL,
	[ApartadoAereo] [nvarchar](50) NULL,
	[TelCasa] [int] NULL,
	[Celular] [float] NULL,
	[Beeper] [nvarchar](8) NULL,
	[CodigoBeeper] [nvarchar](6) NULL,
	[Fax] [int] NULL,
	[eMail] [nvarchar](50) NULL,
	[Password] [nvarchar](6) NULL,
	[CodigoCargo] [int] NULL,
	[PorNomina] [bit] NULL,
	[PorHoras] [bit] NULL,
	[SalarioIntegral] [bit] NULL,
	[ClaseContrato] [int] NULL,
	[Activo] [bit] NULL,
	[CentroCosto] [int] NULL,
	[Turno] [nvarchar](3) NULL,
	[Extension] [int] NULL,
	[JefeInmediato] [nvarchar](50) NULL,
	[ExtensionJefe] [smallint] NULL,
	[Observaciones] [nvarchar](max) NULL,
	[IndiceLector] [smallint] NULL,
	[IdBtw] [smallint] NULL,
	[Huella] [varbinary](max) NULL,
	[Foto] [varbinary](max) NULL,
	[UsuarioCrea] [nvarchar](50) NULL,
	[FechaCrea] [datetime] NULL,
	[UsuarioModifica] [nvarchar](50) NULL,
	[FechaModifica] [datetime] NULL,
 CONSTRAINT [Tbl_Funcionarios$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[IdFuncionario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbl_Secciones]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_Secciones](
	[Codigo] [int] NOT NULL,
	[CentroCosto] [int] NOT NULL,
	[NombreSeccion] [varchar](255) NULL,
	[FechaCrea] [datetime] NULL,
	[FechaModifica] [datetime] NULL,
	[UsuarioCrea] [varchar](255) NULL,
	[UsuarioModifica] [varchar](255) NULL,
 CONSTRAINT [PK_Tbl_Secciones] PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbl_ProgramacionMensual]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_ProgramacionMensual](
	[IdFuncionario] [float] NOT NULL,
	[CCostoDia] [int] NOT NULL,
	[Dia1] [datetime] NULL,
	[TurnoDia1] [nvarchar](50) NULL,
	[NovedadDia1] [nvarchar](50) NULL,
	[Dia2] [datetime] NULL,
	[TurnoDia2] [nvarchar](50) NULL,
	[NovedadDia2] [nvarchar](50) NULL,
	[Dia3] [datetime] NULL,
	[TurnoDia3] [nvarchar](50) NULL,
	[NovedadDia3] [nvarchar](50) NULL,
	[Dia4] [datetime] NULL,
	[TurnoDia4] [nvarchar](50) NULL,
	[NovedadDia4] [nvarchar](50) NULL,
	[Dia5] [datetime] NULL,
	[TurnoDia5] [nvarchar](50) NULL,
	[NovedadDia5] [nvarchar](50) NULL,
	[Dia6] [datetime] NULL,
	[TurnoDia6] [nvarchar](50) NULL,
	[NovedadDia6] [nvarchar](50) NULL,
	[Dia7] [datetime] NULL,
	[TurnoDia7] [nvarchar](50) NULL,
	[NovedadDia7] [nvarchar](50) NULL,
	[Dia8] [datetime] NULL,
	[TurnoDia8] [nvarchar](50) NULL,
	[NovedadDia8] [nvarchar](50) NULL,
	[Dia9] [datetime] NULL,
	[TurnoDia9] [nvarchar](50) NULL,
	[NovedadDia9] [nvarchar](50) NULL,
	[Dia10] [datetime] NULL,
	[TurnoDia10] [nvarchar](50) NULL,
	[NovedadDia10] [nvarchar](50) NULL,
	[Dia11] [datetime] NULL,
	[TurnoDia11] [nvarchar](50) NULL,
	[NovedadDia11] [nvarchar](50) NULL,
	[Dia12] [datetime] NULL,
	[TurnoDia12] [nvarchar](50) NULL,
	[NovedadDia12] [nvarchar](50) NULL,
	[Dia13] [datetime] NULL,
	[TurnoDia13] [nvarchar](50) NULL,
	[NovedadDia13] [nvarchar](50) NULL,
	[Dia14] [datetime] NULL,
	[TurnoDia14] [nvarchar](50) NULL,
	[NovedadDia14] [nvarchar](50) NULL,
	[Dia15] [datetime] NULL,
	[TurnoDia15] [nvarchar](50) NULL,
	[NovedadDia15] [nvarchar](50) NULL,
	[Dia16] [datetime] NULL,
	[TurnoDia16] [nvarchar](50) NULL,
	[NovedadDia16] [nvarchar](50) NULL,
	[Dia17] [datetime] NULL,
	[TurnoDia17] [nvarchar](50) NULL,
	[NovedadDia17] [nvarchar](50) NULL,
	[Dia18] [datetime] NULL,
	[TurnoDia18] [nvarchar](50) NULL,
	[NovedadDia18] [nvarchar](50) NULL,
	[Dia19] [datetime] NULL,
	[TurnoDia19] [nvarchar](50) NULL,
	[NovedadDia19] [nvarchar](50) NULL,
	[Dia20] [datetime] NULL,
	[TurnoDia20] [nvarchar](50) NULL,
	[NovedadDia20] [nvarchar](50) NULL,
	[Dia21] [datetime] NULL,
	[TurnoDia21] [nvarchar](50) NULL,
	[NovedadDia21] [nvarchar](50) NULL,
	[Dia22] [datetime] NULL,
	[TurnoDia22] [nvarchar](50) NULL,
	[NovedadDia22] [nvarchar](50) NULL,
	[Dia23] [datetime] NULL,
	[TurnoDia23] [nvarchar](50) NULL,
	[NovedadDia23] [nvarchar](50) NULL,
	[Dia24] [datetime] NULL,
	[TurnoDia24] [nvarchar](50) NULL,
	[NovedadDia24] [nvarchar](50) NULL,
	[Dia25] [datetime] NULL,
	[TurnoDia25] [nvarchar](50) NULL,
	[NovedadDia25] [nvarchar](50) NULL,
	[Dia26] [datetime] NULL,
	[TurnoDia26] [nvarchar](50) NULL,
	[NovedadDia26] [nvarchar](50) NULL,
	[Dia27] [datetime] NULL,
	[TurnoDia27] [nvarchar](50) NULL,
	[NovedadDia27] [nvarchar](50) NULL,
	[Dia28] [datetime] NULL,
	[TurnoDia28] [nvarchar](50) NULL,
	[NovedadDia28] [nvarchar](50) NULL,
	[Dia29] [datetime] NULL,
	[TurnoDia29] [nvarchar](50) NULL,
	[NovedadDia29] [nvarchar](50) NULL,
	[Dia30] [datetime] NULL,
	[TurnoDia30] [nvarchar](50) NULL,
	[NovedadDia30] [nvarchar](50) NULL,
	[Dia31] [datetime] NULL,
	[TurnoDia31] [nvarchar](50) NULL,
	[NovedadDia31] [nvarchar](50) NULL,
	[UsuarioCrea] [nvarchar](50) NULL,
	[FechaCrea] [datetime] NULL,
	[UsuarioModifica] [nvarchar](50) NULL,
	[FechaModifica] [datetime] NULL,
	[SSMA_TimeStamp] [timestamp] NOT NULL,
 CONSTRAINT [Tbl_ProgramacionMensual$PrimaryKey] PRIMARY KEY CLUSTERED 
(
	[IdFuncionario] ASC,
	[CCostoDia] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_UsuariosEmpresa]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_UsuariosEmpresa](
	[idUsuario] [int] NOT NULL,
	[idEmpresa] [int] NOT NULL,
 CONSTRAINT [PK_Tbl_UsuariosEmpresa] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC,
	[idEmpresa] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[RegistrarIngresoNoPermitido]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos
-- Create date: 20-Enero-2012
-- Description:	Registra ingreso no permitido a un 
-- área restringida
-- ==================================================
CREATE PROCEDURE [dbo].[RegistrarIngresoNoPermitido]
	@Id int,
	@Dependencia int,
	@Lector int,
	@IdPersona varchar(50),
	@FechaAlerta datetime,
	@Estado char(1),
	@UsuarioCrea varchar(50),
	@UsuarioModifica varchar(50)

AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    
	BEGIN
		INSERT INTO [dbo].[Tbl_AlertasxAreas](
			[IdAlerta],
			[Dependencia],
			[Lector],
			[IdPersona],
			[FechaAlerta],
			[Estado],
			[UsuarioCrea],
			[UsuarioModifica],
			[FechaCrea],
			[FechaModifica]
		)
		VALUES(
			@Id,
			@Dependencia,
			@Lector,
			@IdPersona,
			@FechaAlerta,
			@Estado,
			@UsuarioCrea,
			@UsuarioModifica,
			GETDATE(),
			GETDATE()
		)
	END  
	    
	
END
GO
/****** Object:  Table [dbo].[Tbl_Habitaciones]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_Habitaciones](
	[Torre] [int] NOT NULL,
	[Codigo] [varchar](50) NOT NULL,
	[Descripcion] [varchar](100) NULL,
	[Seccion] [int] NOT NULL,
	[Piso] [int] NULL,
	[CantidadCamas] [int] NULL,
	[CamasOcupadas] [int] NULL,
	[PermiteVisitas] [bit] NULL,
	[VisitasxPaciente] [smallint] NULL,
	[Estado] [char](1) NULL,
	[FechaCrea] [date] NULL,
	[FechaModifica] [date] NULL,
	[UsuarioCrea] [varchar](255) NULL,
	[UsuarioModifica] [varchar](255) NULL,
 CONSTRAINT [PK_Tbl_Habitaciones] PRIMARY KEY CLUSTERED 
(
	[Torre] ASC,
	[Codigo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tbl_Funcionarios_x_Usuario]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_Funcionarios_x_Usuario](
	[IdUsuario] [int] NOT NULL,
	[IdFuncionario] [float] NOT NULL,
	[FechaCrea] [datetime] NULL,
	[FechaModifica] [datetime] NULL,
 CONSTRAINT [PK_Tbl_Funcionarios_x_Usuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC,
	[IdFuncionario] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_AgendaVisitasFuncionario]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tbl_AgendaVisitasFuncionario](
	[IdFuncionario] [float] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Hora] [time](7) NOT NULL,
	[IdVisitante] [float] NULL,
	[Motivo] [text] NULL,
	[FechaCrea] [datetime] NULL,
	[FechaModifica] [datetime] NULL,
	[UsuarioCrea] [nvarchar](50) NULL,
	[UsuarioModifica] [nvarchar](50) NULL,
	[csc] [int] IDENTITY(1,1) NOT NULL,
	[Estado] [nvarchar](50) NULL,
	[IdUsuario] [int] NULL,
 CONSTRAINT [PK_Tbl_AgendaVisitasFuncionario2] PRIMARY KEY CLUSTERED 
(
	[IdFuncionario] ASC,
	[Fecha] ASC,
	[Hora] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tbl_HorarioVisitasxSeccion]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_HorarioVisitasxSeccion](
	[Id] [int] NOT NULL,
	[Seccion] [int] NOT NULL,
	[HoraInicio] [time](7) NULL,
	[HoraFin] [time](7) NULL,
	[FechaCrea] [datetime] NULL,
	[FechaModifica] [datetime] NULL,
	[UsuarioCrea] [varchar](255) NULL,
	[UsuarioModifica] [varchar](255) NULL,
 CONSTRAINT [PK_Tbl_HorarioVisitasxDependencia] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[ActualizarCantidadCamasOCupadas]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos 
-- Create date: 10-Marzo-2011
-- Description:	Actualiza la Cantidad de Camas Ocupadas
-- en una Habitación
-- ==================================================
CREATE PROCEDURE [dbo].[ActualizarCantidadCamasOCupadas]
	@Torre int,
	@Habitacion varchar(50),
	@Cantidad int,
	@UsuarioModifica varchar(255)
	
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[Tbl_Habitaciones] 
	SET [CamasOcupadas] = @Cantidad, [FechaModifica] = GETDATE(), [UsuarioModifica] = @UsuarioModifica
	WHERE [Torre] = @Torre AND [Codigo] = @Habitacion
	
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerInformacionHabitacion]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos
-- Create date: 17-Febrero-2011
-- Description:	Obtiene la información de una 
-- habitación de acuerdo a la torre y el código
-- ==================================================

CREATE PROCEDURE [dbo].[ObtenerInformacionHabitacion]
	@Torre int,
	@Codigo varchar(50)
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Tbl_Habitaciones WHERE [Torre] = @Torre AND [Codigo] = @Codigo
	
END
GO
/****** Object:  Table [dbo].[Tbl_HistorialPacientes]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tbl_HistorialPacientes](
	[IdHistorial] [int] NOT NULL,
	[Paciente] [varchar](20) NOT NULL,
	[FechaIngreso] [date] NULL,
	[HoraIngreso] [time](7) NULL,
	[Torre] [int] NOT NULL,
	[Habitacion] [varchar](50) NOT NULL,
	[Cama] [varchar](10) NULL,
	[FechaSalida] [date] NULL,
	[HoraSalida] [time](7) NULL,
	[Estado] [char](1) NULL,
	[PermiteVisitas] [bit] NULL,
	[CantidadVisitas] [int] NULL,
	[VisitasActivas] [int] NULL,
	[Observaciones] [text] NULL,
	[FechaCrea] [date] NULL,
	[FechaModifica] [date] NULL,
	[UsuarioCrea] [varchar](255) NULL,
	[UsuarioModifica] [varchar](255) NULL,
 CONSTRAINT [PK_Tbl_HistorialPaciente] PRIMARY KEY CLUSTERED 
(
	[IdHistorial] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[RegistrarSalidaPaciente]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================
-- Author:		Margarita Hoyos
-- Create date: 12-Marzo-2011
-- Description:	Actualiza el registro del historial
-- del paciente.
-- ================================================
CREATE PROCEDURE [dbo].[RegistrarSalidaPaciente]
	@Id int,
	@FechaSalida date,
	@HoraSalida time(7),
	@Estado char(1),
	@Observaciones text,
	@UsuarioModifica varchar(255)
AS
BEGIN

	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[Tbl_HistorialPacientes]
	SET [FechaSalida] = @FechaSalida, [HoraSalida] = @HoraSalida, [Estado] = @Estado,
		[Observaciones] = @Observaciones, [UsuarioModifica] = @UsuarioModifica,
		[FechaModifica] = GETDATE()
	WHERE [IdHistorial] = @Id

END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerVisitantesPacientePedientesPorSalir]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos
-- Create date: 22-Marzo-2011
-- Description:	Obtiene la lista de visitantes que están
-- pendientes por salir
-- ==================================================

CREATE PROCEDURE [dbo].[ObtenerVisitantesPacientePedientesPorSalir]
	
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    SELECT Tbl_HistorialPacientes.[IdHistorial], Tbl_VisitasPaciente.[IdVisita] 'No.', 
		Tbl_VisitantePaciente.[Identificacion] 'Doc. Visitante', Tbl_VisitantePaciente.[Nombre] Visitante, 
		Tbl_Pacientes.[Identificacion] 'Doc. Paciente', Tbl_Pacientes.[Nombre] + ' ' + Tbl_Pacientes.[Apellido] Paciente, 
		Tbl_VisitasPaciente.[FechaIngreso], Tbl_VisitasPaciente.[HoraIngreso]
    FROM Tbl_VisitantePaciente, Tbl_HistorialPacientes, Tbl_VisitasPaciente, Tbl_Pacientes
    WHERE Tbl_VisitantePaciente.[Identificacion] = Tbl_VisitasPaciente.[Visitante] AND 
    Tbl_HistorialPacientes.[IdHistorial] = Tbl_VisitasPaciente.[Historial] AND
    Tbl_VisitasPaciente.[Paciente] = Tbl_Pacientes.[Identificacion] AND
    Tbl_VisitasPaciente.[Estado] = 'E'

	
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerPacientesInternos]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos
-- Create date: 16-Marzo-2011
-- Description:	Obtiene la información de una 
-- habitación de acuerdo a la torre y el código
-- ==================================================

CREATE PROCEDURE [dbo].[ObtenerPacientesInternos]
	
AS
BEGIN
	SET NOCOUNT ON; 

    -- Insert statements for procedure here
	SELECT Tbl_HistorialPacientes.[IdHistorial] As 'No.', Tbl_Pacientes.[Identificacion] Id, Tbl_Pacientes.[Nombre] + ' ' + Tbl_Pacientes.[Apellido] As Nombre,
		   Tbl_HistorialPacientes.[PermiteVisitas] As 'Permite Visitas',
		   Tbl_Torres.[Nombre] As Torre, Tbl_Habitaciones.Codigo '# Hab.', Tbl_Habitaciones.Descripcion As 'Habitación', 
		   Tbl_HistorialPacientes.[Cama], Tbl_HistorialPacientes.[VisitasActivas] As 'Activas',
		   Tbl_HistorialPacientes.[CantidadVisitas] As 'Máx', Tbl_HistorialPacientes.[Observaciones] As 'Observación', Tbl_Torres.IdTorre
	FROM Tbl_Pacientes, Tbl_HistorialPacientes, Tbl_Torres, Tbl_Habitaciones
	WHERE Tbl_Pacientes.[Identificacion] = Tbl_HistorialPacientes.[Paciente] AND
		  Tbl_HistorialPacientes.[Estado] = 'A' AND Tbl_HistorialPacientes.[Torre] = Tbl_Torres.[IdTorre]
		  AND Tbl_HistorialPacientes.[Habitacion] = Tbl_Habitaciones.[Codigo] AND
		  Tbl_Habitaciones.[Torre] = Tbl_Torres.[IdTorre]
	
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerHorariosVisitaxHistorial]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos
-- Create date: 05-Abril-2011
-- Description:	Obtiene el horario de visitas válido 
-- para un paciente, de acuerdo a su historial activo
-- ==================================================

CREATE PROCEDURE [dbo].[ObtenerHorariosVisitaxHistorial]
	@Historial int
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    SELECT Tbl_HorarioVisitasxSeccion.[HoraInicio], Tbl_HorarioVisitasxSeccion.[HoraFin]
    FROM Tbl_HistorialPacientes, Tbl_HorarioVisitasxSeccion, Tbl_Habitaciones
    WHERE Tbl_Habitaciones.[Codigo] = Tbl_HistorialPacientes.[Habitacion] AND
		  Tbl_Habitaciones.[Torre] = Tbl_HistorialPacientes.[Torre] AND
		  Tbl_Habitaciones.[Seccion] = Tbl_HorarioVisitasxSeccion.[Seccion] AND 
		  Tbl_HistorialPacientes.[IdHistorial] = @Historial

	
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerDatosEntradaPaciente]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Margarita Hoyos
-- Create date: 17-Feb-2011
-- Description:	Obtiene los Datos del Registro de
-- Entrada de un paciente de acuerdo al doc
-- =============================================
CREATE PROCEDURE [dbo].[ObtenerDatosEntradaPaciente]
	
	@Documento varchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT IdHistorial, Torre, Habitacion, Cama, PermiteVisitas, CantidadVisitas, 
			VisitasActivas, Estado, FechaIngreso, HoraIngreso, Observaciones
	FROM Tbl_HistorialPacientes
	WHERE	Paciente = @Documento AND Estado = 'A'
	
END
GO
/****** Object:  StoredProcedure [dbo].[getDatosTicketVisitaPacientes]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================
-- Author:		Margarita Hoyos
-- Create date: 30-Jun-2011
-- Description:	Obtiene los datos del ticket de
-- visita a pacientes
-- ================================================
CREATE PROCEDURE [dbo].[getDatosTicketVisitaPacientes]
	@Fecha date,
	@Visitante varchar(20)
AS
BEGIN

	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT [Tbl_VisitantePaciente].[Nombre], 
		   [Tbl_VisitantePaciente].[Identificacion] Documento, [Tbl_VisitasPaciente].[FechaIngreso] Fecha, 
		   [Tbl_VisitasPaciente].[HoraIngreso] Hora,[Tbl_Pacientes].[Nombre] + ' ' + [Tbl_Pacientes].[Apellido] Paciente,
		   'T: ' + CAST([Tbl_HistorialPacientes].[Torre] AS nvarchar(30)) + '- H: ' + [Tbl_HistorialPacientes].[Habitacion] + '- C: ' + CAST([Tbl_HistorialPacientes].[Cama] AS nvarchar(30)) 'Ubicacion',
		   [Tbl_VisitantePaciente].[Foto]
	FROM  [dbo].[Tbl_VisitantePaciente], [dbo].[Tbl_VisitasPaciente], [dbo].[Tbl_Pacientes], [dbo].[Tbl_HistorialPacientes]
	WHERE [Tbl_VisitantePaciente].[Identificacion] = [Tbl_VisitasPaciente].[Visitante] AND
		  [Tbl_VisitasPaciente].[Historial] = [Tbl_HistorialPacientes].IdHistorial
		  AND [Tbl_Pacientes].[Identificacion] = [Tbl_VisitasPaciente].[Paciente] AND [Tbl_VisitantePaciente].[Identificacion] = @Visitante
		  AND [Tbl_VisitasPaciente].[FechaIngreso] = @fecha AND [Tbl_VisitasPaciente].[Estado] = 'E'

END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarVisitasxTorre]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Margarita Hoyos
-- Create date: 08-Abril-2011
-- Description:	Consulta las visitas recibidas por
-- Torre, en un periodo
-- =============================================
CREATE PROCEDURE [dbo].[ConsultarVisitasxTorre]
	@Torre int,
	@FechaInicio date,
	@FechaFin date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT Tbl_Pacientes.Identificacion 'Id Paciente', Tbl_Pacientes.Nombre +' '+ Tbl_Pacientes.Apellido 'Paciente',
		   Tbl_VisitantePaciente.Identificacion 'Id Visitante', Tbl_VisitantePaciente.Nombre 'Visitante', 
		   Tbl_Dependencias.Dependencia, Tbl_CentrosCosto.NombreCentroCosto 'C. Costo',
		   Tbl_Secciones.Codigo '# Sección', Tbl_Secciones.NombreSeccion 'Sección',
		   Tbl_Habitaciones.Codigo '# Hab', Tbl_Habitaciones.Descripcion 'Habitación', Tbl_HistorialPacientes.Cama, 
		   Tbl_VisitasPaciente.FechaIngreso 'Fecha Entrada', Tbl_VisitasPaciente.HoraIngreso 'Hora', Tbl_VisitasPaciente.Estado
	FROM Tbl_VisitasPaciente, Tbl_Pacientes, Tbl_VisitantePaciente, 
		 Tbl_Torres, Tbl_Secciones, Tbl_CentrosCosto, Tbl_Dependencias,
		 Tbl_Habitaciones, Tbl_HistorialPacientes
	WHERE Tbl_VisitantePaciente.Identificacion = Tbl_VisitasPaciente.Visitante AND
		Tbl_VisitasPaciente.Paciente = Tbl_Pacientes.Identificacion AND 
		Tbl_VisitasPaciente.Historial = Tbl_HistorialPacientes.IdHistorial AND
		Tbl_HistorialPacientes.Paciente = Tbl_Pacientes.Identificacion AND
		Tbl_HistorialPacientes.Torre = Tbl_Torres.IdTorre AND
		Tbl_HistorialPacientes.Habitacion = Tbl_Habitaciones.Codigo AND
		Tbl_Habitaciones.Torre = Tbl_Torres.IdTorre AND
		Tbl_Habitaciones.Seccion = Tbl_Secciones.Codigo AND
		Tbl_Secciones.CentroCosto = Tbl_CentrosCosto.CentroCosto AND
		Tbl_CentrosCosto.CodigoDependencia = Tbl_Dependencias.CodigoDependencia AND
		Tbl_Torres.IdTorre = @Torre AND
		(Tbl_VisitasPaciente.FechaIngreso BETWEEN @FechaInicio AND @FechaFin)
	Order By Tbl_Pacientes.Identificacion, Tbl_Secciones.NombreSeccion
	
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarVisitasxSeccion]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Margarita Hoyos
-- Create date: 08-Abril-2011
-- Description:	Consulta las visitas recibidas por
-- seccion, en un periodo
-- =============================================
CREATE PROCEDURE [dbo].[ConsultarVisitasxSeccion]
	@Seccion int,
	@FechaInicio date,
	@FechaFin date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT Tbl_Pacientes.Identificacion 'Id Paciente', Tbl_Pacientes.Nombre +' '+ Tbl_Pacientes.Apellido 'Paciente',
		   Tbl_VisitantePaciente.Identificacion 'Id Visitante', Tbl_VisitantePaciente.Nombre 'Visitante', 
		   Tbl_Dependencias.Dependencia, Tbl_CentrosCosto.NombreCentroCosto 'C. Costo',
		   Tbl_Torres.IdTorre '# Torre', Tbl_Torres.Nombre 'Torre',
		   Tbl_Habitaciones.Codigo '# Hab', Tbl_Habitaciones.Descripcion 'Habitación', Tbl_HistorialPacientes.Cama, 
		   Tbl_VisitasPaciente.FechaIngreso 'Fecha Entrada', Tbl_VisitasPaciente.HoraIngreso 'Hora', Tbl_VisitasPaciente.Estado
	FROM Tbl_VisitasPaciente, Tbl_Pacientes, Tbl_VisitantePaciente, 
		 Tbl_Torres, Tbl_Secciones, Tbl_CentrosCosto, Tbl_Dependencias,
		 Tbl_Habitaciones, Tbl_HistorialPacientes
	WHERE Tbl_VisitantePaciente.Identificacion = Tbl_VisitasPaciente.Visitante AND
		Tbl_VisitasPaciente.Paciente = Tbl_Pacientes.Identificacion AND 
		Tbl_VisitasPaciente.Historial = Tbl_HistorialPacientes.IdHistorial AND
		Tbl_HistorialPacientes.Paciente = Tbl_Pacientes.Identificacion AND
		Tbl_HistorialPacientes.Torre = Tbl_Torres.IdTorre AND
		Tbl_HistorialPacientes.Habitacion = Tbl_Habitaciones.Codigo AND
		Tbl_Habitaciones.Torre = Tbl_Torres.IdTorre AND
		Tbl_Habitaciones.Seccion = Tbl_Secciones.Codigo AND
		Tbl_Secciones.CentroCosto = Tbl_CentrosCosto.CentroCosto AND
		Tbl_CentrosCosto.CodigoDependencia = Tbl_Dependencias.CodigoDependencia AND
		Tbl_Secciones.Codigo = @Seccion AND
		(Tbl_VisitasPaciente.FechaIngreso BETWEEN @FechaInicio AND @FechaFin)
	Order By Tbl_Pacientes.Identificacion, Tbl_Secciones.NombreSeccion
	
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarVisitasxPaciente]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Margarita Hoyos
-- Create date: 08-Abril-2011
-- Description:	Consulta las visitas recibidas por
-- Paciente, en un periodo
-- =============================================
CREATE PROCEDURE [dbo].[ConsultarVisitasxPaciente]
	@Paciente varchar(20),
	@FechaInicio date,
	@FechaFin date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT Tbl_VisitantePaciente.Identificacion 'Id Visitante', Tbl_VisitantePaciente.Nombre 'Visitante', 
		   Tbl_Dependencias.Dependencia, Tbl_CentrosCosto.NombreCentroCosto 'C. Costo',
		   Tbl_Secciones.Codigo '# Sección', Tbl_Secciones.NombreSeccion 'Sección', Tbl_Torres.IdTorre '# Torre',
		   Tbl_Torres.Nombre 'Torre', Tbl_Habitaciones.Codigo '# Hab', Tbl_Habitaciones.Descripcion 'Habitación', Tbl_HistorialPacientes.Cama,
		   Tbl_VisitasPaciente.FechaIngreso 'Fecha Entrada', Tbl_VisitasPaciente.HoraIngreso 'Hora', Tbl_VisitasPaciente.Estado
	FROM Tbl_VisitasPaciente, Tbl_Pacientes, Tbl_VisitantePaciente, 
		 Tbl_Torres, Tbl_Secciones, Tbl_CentrosCosto, Tbl_Dependencias,
		 Tbl_Habitaciones, Tbl_HistorialPacientes
	WHERE Tbl_VisitantePaciente.Identificacion = Tbl_VisitasPaciente.Visitante AND
		Tbl_VisitasPaciente.Paciente = Tbl_Pacientes.Identificacion AND 
		Tbl_VisitasPaciente.Historial = Tbl_HistorialPacientes.IdHistorial AND
		Tbl_HistorialPacientes.Paciente = Tbl_Pacientes.Identificacion AND
		Tbl_HistorialPacientes.Torre = Tbl_Torres.IdTorre AND
		Tbl_HistorialPacientes.Habitacion = Tbl_Habitaciones.Codigo AND
		Tbl_Habitaciones.Torre = Tbl_Torres.IdTorre AND
		Tbl_Habitaciones.Seccion = Tbl_Secciones.Codigo AND
		Tbl_Secciones.CentroCosto = Tbl_CentrosCosto.CentroCosto AND
		Tbl_CentrosCosto.CodigoDependencia = Tbl_Dependencias.CodigoDependencia AND
		Tbl_Pacientes.Identificacion = @Paciente AND
		(Tbl_VisitasPaciente.FechaIngreso BETWEEN @FechaInicio AND @FechaFin)
	Order By Tbl_Dependencias.Dependencia, Tbl_CentrosCosto.CentroCosto,Tbl_Secciones.NombreSeccion
	
END
GO
/****** Object:  StoredProcedure [dbo].[ConsultarVisitasxDependencia]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Margarita Hoyos
-- Create date: 07-Abril-2011
-- Description:	Consulta las visitas recibidas por
-- dependencia, en un periodo
-- =============================================
CREATE PROCEDURE [dbo].[ConsultarVisitasxDependencia]
	@Dependencia int,
	@FechaInicio date,
	@FechaFin date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT Tbl_Pacientes.Identificacion 'Id Paciente', Tbl_Pacientes.Nombre +' '+ Tbl_Pacientes.Apellido 'Paciente',
		   Tbl_VisitantePaciente.Identificacion 'Id Visitante', Tbl_VisitantePaciente.Nombre 'Visitante', 
		   Tbl_Secciones.Codigo '# Sección', Tbl_Secciones.NombreSeccion 'Sección', Tbl_Torres.IdTorre '# Torre',
		   Tbl_Torres.Nombre 'Torre', Tbl_Habitaciones.Codigo '# Hab', Tbl_Habitaciones.Descripcion 'Habitación', Tbl_HistorialPacientes.Cama,
		   Tbl_VisitasPaciente.FechaIngreso 'Fecha Entrada', Tbl_VisitasPaciente.HoraIngreso 'Hora', Tbl_VisitasPaciente.Estado
	FROM Tbl_VisitasPaciente, Tbl_Pacientes, Tbl_VisitantePaciente, 
		 Tbl_Torres, Tbl_Secciones, Tbl_CentrosCosto, Tbl_Dependencias,
		 Tbl_Habitaciones, Tbl_HistorialPacientes
	WHERE Tbl_VisitantePaciente.Identificacion = Tbl_VisitasPaciente.Visitante AND
		Tbl_VisitasPaciente.Paciente = Tbl_Pacientes.Identificacion AND 
		Tbl_VisitasPaciente.Historial = Tbl_HistorialPacientes.IdHistorial AND
		Tbl_HistorialPacientes.Paciente = Tbl_Pacientes.Identificacion AND
		Tbl_HistorialPacientes.Torre = Tbl_Torres.IdTorre AND
		Tbl_HistorialPacientes.Habitacion = Tbl_Habitaciones.Codigo AND
		Tbl_Habitaciones.Torre = Tbl_Torres.IdTorre AND
		Tbl_Habitaciones.Seccion = Tbl_Secciones.Codigo AND
		Tbl_Secciones.CentroCosto = Tbl_CentrosCosto.CentroCosto AND
		Tbl_CentrosCosto.CodigoDependencia = Tbl_Dependencias.CodigoDependencia AND
		Tbl_Dependencias.CodigoDependencia = @Dependencia AND
		(Tbl_VisitasPaciente.FechaIngreso BETWEEN @FechaInicio AND @FechaFin)
	Order By Tbl_Pacientes.Identificacion Asc, Tbl_Secciones.NombreSeccion Asc
	
END
GO
/****** Object:  StoredProcedure [dbo].[ActualizarVisitasActivasPaciente]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ==================================================
-- Author:		Margarita Hoyos 
-- Create date: 19-Marzo-2011
-- Description:	Actualiza la Cantidad de Visitas activas
-- de un paciente
-- ==================================================
CREATE PROCEDURE [dbo].[ActualizarVisitasActivasPaciente]
	@IdHistorial int,
	@Visitas int,
	@UsuarioModifica varchar(255)
	
AS
BEGIN
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE [dbo].[Tbl_HistorialPacientes] 
	SET [VisitasActivas] = @Visitas, [FechaModifica] = GETDATE(), [UsuarioModifica] = @UsuarioModifica
	WHERE [IdHistorial] = @IdHistorial
	
END
GO
/****** Object:  StoredProcedure [dbo].[AdicionarHistorialPaciente]    Script Date: 02/09/2013 11:13:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ================================================
-- Author:		Margarita Hoyos
-- Create date: 09-Marzo-2011
-- Description:	Crea un registro en el historial del
-- paciente
-- ================================================
CREATE PROCEDURE [dbo].[AdicionarHistorialPaciente]
	@Id int,
	@Paciente varchar(20),
	@FechaIngreso date,
	@HoraIngreso time(7),
	@Torre int, 
	@Habitacion varchar(50),
	@Cama varchar(10),
	@Estado char(1),
	@PermiteVisitas bit,
	@CantidadVisitas int,
	@Observaciones text,
	@UsuarioCrea varchar(255)
AS
BEGIN

	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO  [dbo].[Tbl_HistorialPacientes] (
		[IdHistorial],
		[Paciente],
		[FechaIngreso],
		[HoraIngreso],
		[Torre],
		[Habitacion],
		[Cama],
		[Estado],
		[PermiteVisitas],
		[CantidadVisitas],
		[Observaciones],
		[FechaCrea],
		[UsuarioCrea]
		) 
		VALUES(
		@Id,
		@Paciente,
		@FechaIngreso,
		@HoraIngreso,
		@Torre,
		@Habitacion,
		@Cama,
		@Estado,
		@PermiteVisitas,
		@CantidadVisitas,
		@Observaciones,
		GETDATE(),
		@UsuarioCrea)


END
GO
/****** Object:  Default [DF__CHECKINOU__Check__023D5A04]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[CHECKINOUT] ADD  DEFAULT (getdate()) FOR [CheckTime]
GO
/****** Object:  Default [DF__CHECKINOU__Check__03317E3D]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[CHECKINOUT] ADD  DEFAULT ('I') FOR [CheckType]
GO
/****** Object:  Default [DF_Tbl_Lectores_PuertoSerial]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[Tbl_Lectores] ADD  CONSTRAINT [DF_Tbl_Lectores_PuertoSerial]  DEFAULT ((1)) FOR [PuertoSerial]
GO
/****** Object:  Default [DF_Tbl_Lectores_PuertoIp]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[Tbl_Lectores] ADD  CONSTRAINT [DF_Tbl_Lectores_PuertoIp]  DEFAULT ((4370)) FOR [PuertoIp]
GO
/****** Object:  Default [DF_Tbl_Lectores_Baudrate]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[Tbl_Lectores] ADD  CONSTRAINT [DF_Tbl_Lectores_Baudrate]  DEFAULT ((9600)) FOR [Baudrate]
GO
/****** Object:  Default [DF__Tbl_Empre__Codig__740F363E]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[Tbl_Empresa] ADD  CONSTRAINT [DF__Tbl_Empre__Codig__740F363E]  DEFAULT ((0)) FOR [CodigoNomina]
GO
/****** Object:  Default [DF__Tbl_Depar__Depar__1A14E395]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[Tbl_Departamentos] ADD  DEFAULT ((0)) FOR [Departamento]
GO
/****** Object:  Default [DF__Tbl_Conti__Conti__2D27B809]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[Tbl_Continentes] ADD  DEFAULT ((0)) FOR [Continente]
GO
/****** Object:  Default [DF__Tbl_Clase__Clase__29572725]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[Tbl_ClaseContratos] ADD  DEFAULT ((0)) FOR [ClaseContrato]
GO
/****** Object:  Default [DF__Tbl_Sedes__Numer__5FB337D6]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[Tbl_Sedes] ADD  DEFAULT ((0)) FOR [NumeroSede]
GO
/****** Object:  Default [DF_Tbl_PermisosUsuarios_ver]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[Tbl_PermisosUsuarios] ADD  CONSTRAINT [DF_Tbl_PermisosUsuarios_ver]  DEFAULT ((1)) FOR [ver]
GO
/****** Object:  Default [DF__Tbl_Permis__adic__149C0161]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[Tbl_PermisosUsuarios] ADD  CONSTRAINT [DF__Tbl_Permis__adic__149C0161]  DEFAULT ((0)) FOR [adic]
GO
/****** Object:  Default [DF__Tbl_Permiso__dro__1590259A]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[Tbl_PermisosUsuarios] ADD  CONSTRAINT [DF__Tbl_Permiso__dro__1590259A]  DEFAULT ((0)) FOR [dro]
GO
/****** Object:  Default [DF__Tbl_Permiso__upd__168449D3]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[Tbl_PermisosUsuarios] ADD  CONSTRAINT [DF__Tbl_Permiso__upd__168449D3]  DEFAULT ((0)) FOR [upd]
GO
/****** Object:  Default [DF__Tbl_Permiso__con__17786E0C]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[Tbl_PermisosUsuarios] ADD  CONSTRAINT [DF__Tbl_Permiso__con__17786E0C]  DEFAULT ((0)) FOR [con]
GO
/****** Object:  Default [DF__Tbl_Permiso__fmo__186C9245]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[Tbl_PermisosUsuarios] ADD  CONSTRAINT [DF__Tbl_Permiso__fmo__186C9245]  DEFAULT (getdate()) FOR [fmo]
GO
/****** Object:  Default [DF__Tbl_Perio__Perio__55F4C372]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[Tbl_PeriodosTrabajo] ADD  DEFAULT ((0)) FOR [PeriodoAnual]
GO
/****** Object:  Default [DF__Tbl_Perio__NroPe__56E8E7AB]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[Tbl_PeriodosTrabajo] ADD  DEFAULT ((0)) FOR [NroPeriodo]
GO
/****** Object:  Default [DF__Tbl_Perfil__usrm__1EA48E88]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[Tbl_PerfilesUsuarios] ADD  DEFAULT ((0)) FOR [usrm]
GO
/****** Object:  Default [DF__Tbl_Perfil__fmod__1F98B2C1]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[Tbl_PerfilesUsuarios] ADD  DEFAULT (getdate()) FOR [fmod]
GO
/****** Object:  Default [DF__Tbl_Turno__Codig__160F4887]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[Tbl_Turnos] ADD  DEFAULT ((0)) FOR [CodigoTurno]
GO
/****** Object:  Default [DF__Tbl_Turno__Minut__17036CC0]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[Tbl_Turnos] ADD  DEFAULT ((0)) FOR [MinutosExcluidos]
GO
/****** Object:  Default [DF__Tbl_Meses__Codig__0B91BA14]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[Tbl_Meses] ADD  DEFAULT ((0)) FOR [CodigoMes]
GO
/****** Object:  Default [DF__Tbl_Zonas__ZonaP__0F624AF8]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[Tbl_ZonasPostales] ADD  DEFAULT ((0)) FOR [ZonaPostal]
GO
/****** Object:  Default [DF__Tbl_Visit__Recib__6B44E613]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[Tbl_Visitas] ADD  CONSTRAINT [DF__Tbl_Visit__Recib__6B44E613]  DEFAULT (NULL) FOR [RecibeVisita]
GO
/****** Object:  Default [DF__Tbl_Visit__Fecha__6C390A4C]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[Tbl_Visitas] ADD  CONSTRAINT [DF__Tbl_Visit__Fecha__6C390A4C]  DEFAULT (NULL) FOR [FechaInicial]
GO
/****** Object:  Default [DF__Tbl_Visit__HoraI__6D2D2E85]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[Tbl_Visitas] ADD  CONSTRAINT [DF__Tbl_Visit__HoraI__6D2D2E85]  DEFAULT (NULL) FOR [HoraInicial]
GO
/****** Object:  Default [DF__Tbl_Visit__Fecha__6E2152BE]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[Tbl_Visitas] ADD  CONSTRAINT [DF__Tbl_Visit__Fecha__6E2152BE]  DEFAULT (NULL) FOR [FechaFinal]
GO
/****** Object:  Default [DF__Tbl_Visit__HoraF__6F1576F7]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[Tbl_Visitas] ADD  CONSTRAINT [DF__Tbl_Visit__HoraF__6F1576F7]  DEFAULT (NULL) FOR [HoraFinal]
GO
/****** Object:  Default [DF__Tbl_Visit__Durac__70099B30]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[Tbl_Visitas] ADD  CONSTRAINT [DF__Tbl_Visit__Durac__70099B30]  DEFAULT ('00:00:00') FOR [DuracionVisita]
GO
/****** Object:  Default [DF__Tbl_Visit__IdUsu__70FDBF69]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[Tbl_Visitas] ADD  CONSTRAINT [DF__Tbl_Visit__IdUsu__70FDBF69]  DEFAULT (NULL) FOR [IdUsuario]
GO
/****** Object:  Default [DF__Tbl_Visita__area__71F1E3A2]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[Tbl_Visitas] ADD  CONSTRAINT [DF__Tbl_Visita__area__71F1E3A2]  DEFAULT (NULL) FOR [area]
GO
/****** Object:  Default [DF__Tbl_usuar__activ__4A18FC72]    Script Date: 02/09/2013 11:13:33 ******/
ALTER TABLE [dbo].[Tbl_usuarios] ADD  CONSTRAINT [DF__Tbl_usuar__activ__4A18FC72]  DEFAULT ((0)) FOR [activo]
GO
/****** Object:  Default [DF__Tbl_usuar__fecha__4B0D20AB]    Script Date: 02/09/2013 11:13:33 ******/
ALTER TABLE [dbo].[Tbl_usuarios] ADD  CONSTRAINT [DF__Tbl_usuar__fecha__4B0D20AB]  DEFAULT (getdate()) FOR [fechaMod]
GO
/****** Object:  Default [DF__Tbl_Paises__Pais__06CD04F7]    Script Date: 02/09/2013 11:13:33 ******/
ALTER TABLE [dbo].[Tbl_Paises] ADD  DEFAULT ((0)) FOR [Pais]
GO
/****** Object:  Default [DF__Tbl_Paise__Conti__07C12930]    Script Date: 02/09/2013 11:13:33 ******/
ALTER TABLE [dbo].[Tbl_Paises] ADD  DEFAULT ((0)) FOR [Continente]
GO
/****** Object:  Default [DF__Tbl_Ciuda__Ciuda__239E4DCF]    Script Date: 02/09/2013 11:13:33 ******/
ALTER TABLE [dbo].[Tbl_Ciudades] ADD  DEFAULT ((0)) FOR [Ciudad]
GO
/****** Object:  Default [DF__Tbl_Ciuda__Depar__24927208]    Script Date: 02/09/2013 11:13:33 ******/
ALTER TABLE [dbo].[Tbl_Ciudades] ADD  DEFAULT ((0)) FOR [Departamento]
GO
/****** Object:  Default [DF__Tbl_Ciuda__Codig__25869641]    Script Date: 02/09/2013 11:13:33 ******/
ALTER TABLE [dbo].[Tbl_Ciudades] ADD  DEFAULT ((0)) FOR [CodigoDane]
GO
/****** Object:  Default [DF__Tbl_Centr__Centr__0BC6C43E]    Script Date: 02/09/2013 11:13:33 ******/
ALTER TABLE [dbo].[Tbl_CentrosCosto] ADD  CONSTRAINT [DF__Tbl_Centr__Centr__0BC6C43E]  DEFAULT ((0)) FOR [CentroCosto]
GO
/****** Object:  Default [DF__Tbl_Centr__Codig__0CBAE877]    Script Date: 02/09/2013 11:13:33 ******/
ALTER TABLE [dbo].[Tbl_CentrosCosto] ADD  CONSTRAINT [DF__Tbl_Centr__Codig__0CBAE877]  DEFAULT ((0)) FOR [CodigoDependencia]
GO
/****** Object:  Default [DF__Tbl_Funci__Empre__71D1E811]    Script Date: 02/09/2013 11:13:34 ******/
ALTER TABLE [dbo].[Tbl_Funcionarios] ADD  CONSTRAINT [DF__Tbl_Funci__Empre__71D1E811]  DEFAULT ((0)) FOR [Empresa]
GO
/****** Object:  Default [DF__Tbl_Funci__Numer__72C60C4A]    Script Date: 02/09/2013 11:13:34 ******/
ALTER TABLE [dbo].[Tbl_Funcionarios] ADD  CONSTRAINT [DF__Tbl_Funci__Numer__72C60C4A]  DEFAULT ((0)) FOR [NumeroSede]
GO
/****** Object:  Default [DF__Tbl_Funci__Codig__797309D9]    Script Date: 02/09/2013 11:13:34 ******/
ALTER TABLE [dbo].[Tbl_Funcionarios] ADD  CONSTRAINT [DF__Tbl_Funci__Codig__797309D9]  DEFAULT ((0)) FOR [CodigoDependencia]
GO
/****** Object:  Default [DF__Tbl_Funci__Codig__73BA3083]    Script Date: 02/09/2013 11:13:34 ******/
ALTER TABLE [dbo].[Tbl_Funcionarios] ADD  CONSTRAINT [DF__Tbl_Funci__Codig__73BA3083]  DEFAULT ((0)) FOR [CodigoCargo]
GO
/****** Object:  Default [DF__Tbl_Funci__PorNo__74AE54BC]    Script Date: 02/09/2013 11:13:34 ******/
ALTER TABLE [dbo].[Tbl_Funcionarios] ADD  CONSTRAINT [DF__Tbl_Funci__PorNo__74AE54BC]  DEFAULT ((0)) FOR [PorNomina]
GO
/****** Object:  Default [DF__Tbl_Funci__PorHo__75A278F5]    Script Date: 02/09/2013 11:13:34 ******/
ALTER TABLE [dbo].[Tbl_Funcionarios] ADD  CONSTRAINT [DF__Tbl_Funci__PorHo__75A278F5]  DEFAULT ((0)) FOR [PorHoras]
GO
/****** Object:  Default [DF__Tbl_Funci__Salar__76969D2E]    Script Date: 02/09/2013 11:13:34 ******/
ALTER TABLE [dbo].[Tbl_Funcionarios] ADD  CONSTRAINT [DF__Tbl_Funci__Salar__76969D2E]  DEFAULT ((0)) FOR [SalarioIntegral]
GO
/****** Object:  Default [DF__Tbl_Funci__Clase__778AC167]    Script Date: 02/09/2013 11:13:34 ******/
ALTER TABLE [dbo].[Tbl_Funcionarios] ADD  CONSTRAINT [DF__Tbl_Funci__Clase__778AC167]  DEFAULT ((0)) FOR [ClaseContrato]
GO
/****** Object:  Default [DF__Tbl_Funci__Activ__787EE5A0]    Script Date: 02/09/2013 11:13:34 ******/
ALTER TABLE [dbo].[Tbl_Funcionarios] ADD  CONSTRAINT [DF__Tbl_Funci__Activ__787EE5A0]  DEFAULT ((0)) FOR [Activo]
GO
/****** Object:  Default [DF__Tbl_Funci__Centr__7A672E12]    Script Date: 02/09/2013 11:13:34 ******/
ALTER TABLE [dbo].[Tbl_Funcionarios] ADD  CONSTRAINT [DF__Tbl_Funci__Centr__7A672E12]  DEFAULT ((0)) FOR [CentroCosto]
GO
/****** Object:  Default [DF__Tbl_Funci__Exten__7B5B524B]    Script Date: 02/09/2013 11:13:34 ******/
ALTER TABLE [dbo].[Tbl_Funcionarios] ADD  CONSTRAINT [DF__Tbl_Funci__Exten__7B5B524B]  DEFAULT ((0)) FOR [ExtensionJefe]
GO
/****** Object:  Default [DF__Tbl_Funci__Indic__7C4F7684]    Script Date: 02/09/2013 11:13:34 ******/
ALTER TABLE [dbo].[Tbl_Funcionarios] ADD  CONSTRAINT [DF__Tbl_Funci__Indic__7C4F7684]  DEFAULT ((0)) FOR [IndiceLector]
GO
/****** Object:  Default [DF__Tbl_Progr__IdFun__5CA1C101]    Script Date: 02/09/2013 11:13:34 ******/
ALTER TABLE [dbo].[Tbl_ProgramacionMensual] ADD  CONSTRAINT [DF__Tbl_Progr__IdFun__5CA1C101]  DEFAULT ((0)) FOR [IdFuncionario]
GO
/****** Object:  Default [DF__Tbl_Progr__CCost__5D95E53A]    Script Date: 02/09/2013 11:13:34 ******/
ALTER TABLE [dbo].[Tbl_ProgramacionMensual] ADD  CONSTRAINT [DF__Tbl_Progr__CCost__5D95E53A]  DEFAULT ((0)) FOR [CCostoDia]
GO
/****** Object:  Check [SSMA_CC$CHECKINOUT$CheckType$disallow_zero_length]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[CHECKINOUT]  WITH CHECK ADD  CONSTRAINT [SSMA_CC$CHECKINOUT$CheckType$disallow_zero_length] CHECK  ((len([CheckType])>(0)))
GO
ALTER TABLE [dbo].[CHECKINOUT] CHECK CONSTRAINT [SSMA_CC$CHECKINOUT$CheckType$disallow_zero_length]
GO
/****** Object:  Check [SSMA_CC$CHECKINOUT$Sensorid$disallow_zero_length]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[CHECKINOUT]  WITH CHECK ADD  CONSTRAINT [SSMA_CC$CHECKINOUT$Sensorid$disallow_zero_length] CHECK  ((len([Sensorid])>(0)))
GO
ALTER TABLE [dbo].[CHECKINOUT] CHECK CONSTRAINT [SSMA_CC$CHECKINOUT$Sensorid$disallow_zero_length]
GO
/****** Object:  Check [SSMA_CC$CHECKINOUT$Userid$disallow_zero_length]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[CHECKINOUT]  WITH CHECK ADD  CONSTRAINT [SSMA_CC$CHECKINOUT$Userid$disallow_zero_length] CHECK  ((len([Userid])>(0)))
GO
ALTER TABLE [dbo].[CHECKINOUT] CHECK CONSTRAINT [SSMA_CC$CHECKINOUT$Userid$disallow_zero_length]
GO
/****** Object:  Check [SSMA_CC$Tbl_Aproximaciones$Accion$disallow_zero_length]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[Tbl_Aproximaciones]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Tbl_Aproximaciones$Accion$disallow_zero_length] CHECK  ((len([Accion])>(0)))
GO
ALTER TABLE [dbo].[Tbl_Aproximaciones] CHECK CONSTRAINT [SSMA_CC$Tbl_Aproximaciones$Accion$disallow_zero_length]
GO
/****** Object:  Check [SSMA_CC$Tbl_Aproximaciones$AproximaHora$disallow_zero_length]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[Tbl_Aproximaciones]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Tbl_Aproximaciones$AproximaHora$disallow_zero_length] CHECK  ((len([AproximaHora])>(0)))
GO
ALTER TABLE [dbo].[Tbl_Aproximaciones] CHECK CONSTRAINT [SSMA_CC$Tbl_Aproximaciones$AproximaHora$disallow_zero_length]
GO
/****** Object:  Check [SSMA_CC$Tbl_Cargos$Cargo$disallow_zero_length]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[Tbl_Cargos]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Tbl_Cargos$Cargo$disallow_zero_length] CHECK  ((len([Cargo])>(0)))
GO
ALTER TABLE [dbo].[Tbl_Cargos] CHECK CONSTRAINT [SSMA_CC$Tbl_Cargos$Cargo$disallow_zero_length]
GO
/****** Object:  Check [SSMA_CC$Tbl_Cargos$UsuarioCrea$disallow_zero_length]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[Tbl_Cargos]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Tbl_Cargos$UsuarioCrea$disallow_zero_length] CHECK  ((len([UsuarioCrea])>(0)))
GO
ALTER TABLE [dbo].[Tbl_Cargos] CHECK CONSTRAINT [SSMA_CC$Tbl_Cargos$UsuarioCrea$disallow_zero_length]
GO
/****** Object:  Check [SSMA_CC$Tbl_Cargos$UsuarioModifica$disallow_zero_length]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[Tbl_Cargos]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Tbl_Cargos$UsuarioModifica$disallow_zero_length] CHECK  ((len([UsuarioModifica])>(0)))
GO
ALTER TABLE [dbo].[Tbl_Cargos] CHECK CONSTRAINT [SSMA_CC$Tbl_Cargos$UsuarioModifica$disallow_zero_length]
GO
/****** Object:  Check [SSMA_CC$Tbl_Dependencias$ClaseDependencia$disallow_zero_length]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[Tbl_Dependencias]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Tbl_Dependencias$ClaseDependencia$disallow_zero_length] CHECK  ((len([ClaseDependencia])>(0)))
GO
ALTER TABLE [dbo].[Tbl_Dependencias] NOCHECK CONSTRAINT [SSMA_CC$Tbl_Dependencias$ClaseDependencia$disallow_zero_length]
GO
/****** Object:  Check [SSMA_CC$Tbl_Dependencias$CodigoDependencia$validation_rule]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[Tbl_Dependencias]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Tbl_Dependencias$CodigoDependencia$validation_rule] CHECK  (([CodigoDependencia]>(0)))
GO
ALTER TABLE [dbo].[Tbl_Dependencias] NOCHECK CONSTRAINT [SSMA_CC$Tbl_Dependencias$CodigoDependencia$validation_rule]
GO
/****** Object:  Check [SSMA_CC$Tbl_Dependencias$Dependencia$disallow_zero_length]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[Tbl_Dependencias]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Tbl_Dependencias$Dependencia$disallow_zero_length] CHECK  ((len([Dependencia])>(0)))
GO
ALTER TABLE [dbo].[Tbl_Dependencias] NOCHECK CONSTRAINT [SSMA_CC$Tbl_Dependencias$Dependencia$disallow_zero_length]
GO
/****** Object:  Check [SSMA_CC$Tbl_Dependencias$UsuarioCrea$disallow_zero_length]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[Tbl_Dependencias]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Tbl_Dependencias$UsuarioCrea$disallow_zero_length] CHECK  ((len([UsuarioCrea])>(0)))
GO
ALTER TABLE [dbo].[Tbl_Dependencias] NOCHECK CONSTRAINT [SSMA_CC$Tbl_Dependencias$UsuarioCrea$disallow_zero_length]
GO
/****** Object:  Check [SSMA_CC$Tbl_Dependencias$UsuarioModifica$disallow_zero_length]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[Tbl_Dependencias]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Tbl_Dependencias$UsuarioModifica$disallow_zero_length] CHECK  ((len([UsuarioModifica])>(0)))
GO
ALTER TABLE [dbo].[Tbl_Dependencias] NOCHECK CONSTRAINT [SSMA_CC$Tbl_Dependencias$UsuarioModifica$disallow_zero_length]
GO
/****** Object:  Check [SSMA_CC$Tbl_Departamentos$Departamento$validation_rule]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[Tbl_Departamentos]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Tbl_Departamentos$Departamento$validation_rule] CHECK  (([Departamento]>(0)))
GO
ALTER TABLE [dbo].[Tbl_Departamentos] CHECK CONSTRAINT [SSMA_CC$Tbl_Departamentos$Departamento$validation_rule]
GO
/****** Object:  Check [SSMA_CC$Tbl_Departamentos$NombreDepartamento$disallow_zero_length]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[Tbl_Departamentos]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Tbl_Departamentos$NombreDepartamento$disallow_zero_length] CHECK  ((len([NombreDepartamento])>(0)))
GO
ALTER TABLE [dbo].[Tbl_Departamentos] CHECK CONSTRAINT [SSMA_CC$Tbl_Departamentos$NombreDepartamento$disallow_zero_length]
GO
/****** Object:  Check [SSMA_CC$Tbl_Continentes$Nombre$disallow_zero_length]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[Tbl_Continentes]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Tbl_Continentes$Nombre$disallow_zero_length] CHECK  ((len([Nombre])>(0)))
GO
ALTER TABLE [dbo].[Tbl_Continentes] CHECK CONSTRAINT [SSMA_CC$Tbl_Continentes$Nombre$disallow_zero_length]
GO
/****** Object:  Check [SSMA_CC$Tbl_ClaseContratos$Contratacion$disallow_zero_length]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[Tbl_ClaseContratos]  WITH CHECK ADD  CONSTRAINT [SSMA_CC$Tbl_ClaseContratos$Contratacion$disallow_zero_length] CHECK  ((len([Contratacion])>(0)))
GO
ALTER TABLE [dbo].[Tbl_ClaseContratos] CHECK CONSTRAINT [SSMA_CC$Tbl_ClaseContratos$Contratacion$disallow_zero_length]
GO
/****** Object:  Check [SSMA_CC$Tbl_Sedes$Sede$disallow_zero_length]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[Tbl_Sedes]  WITH CHECK ADD  CONSTRAINT [SSMA_CC$Tbl_Sedes$Sede$disallow_zero_length] CHECK  ((len([Sede])>(0)))
GO
ALTER TABLE [dbo].[Tbl_Sedes] CHECK CONSTRAINT [SSMA_CC$Tbl_Sedes$Sede$disallow_zero_length]
GO
/****** Object:  Check [SSMA_CC$Tbl_PeriodosTrabajo$UsuarioCrea$disallow_zero_length]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[Tbl_PeriodosTrabajo]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Tbl_PeriodosTrabajo$UsuarioCrea$disallow_zero_length] CHECK  ((len([UsuarioCrea])>(0)))
GO
ALTER TABLE [dbo].[Tbl_PeriodosTrabajo] CHECK CONSTRAINT [SSMA_CC$Tbl_PeriodosTrabajo$UsuarioCrea$disallow_zero_length]
GO
/****** Object:  Check [SSMA_CC$Tbl_PeriodosTrabajo$UsuarioModifica$disallow_zero_length]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[Tbl_PeriodosTrabajo]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Tbl_PeriodosTrabajo$UsuarioModifica$disallow_zero_length] CHECK  ((len([UsuarioModifica])>(0)))
GO
ALTER TABLE [dbo].[Tbl_PeriodosTrabajo] CHECK CONSTRAINT [SSMA_CC$Tbl_PeriodosTrabajo$UsuarioModifica$disallow_zero_length]
GO
/****** Object:  Check [SSMA_CC$Tbl_TurnosPorCCosto$NombreTurno$disallow_zero_length]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[Tbl_TurnosPorCCosto]  WITH CHECK ADD  CONSTRAINT [SSMA_CC$Tbl_TurnosPorCCosto$NombreTurno$disallow_zero_length] CHECK  ((len([NombreTurno])>(0)))
GO
ALTER TABLE [dbo].[Tbl_TurnosPorCCosto] CHECK CONSTRAINT [SSMA_CC$Tbl_TurnosPorCCosto$NombreTurno$disallow_zero_length]
GO
/****** Object:  Check [SSMA_CC$Tbl_TurnosPorCCosto$Turno$disallow_zero_length]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[Tbl_TurnosPorCCosto]  WITH CHECK ADD  CONSTRAINT [SSMA_CC$Tbl_TurnosPorCCosto$Turno$disallow_zero_length] CHECK  ((len([Turno])>(0)))
GO
ALTER TABLE [dbo].[Tbl_TurnosPorCCosto] CHECK CONSTRAINT [SSMA_CC$Tbl_TurnosPorCCosto$Turno$disallow_zero_length]
GO
/****** Object:  Check [SSMA_CC$Tbl_TurnosPorCCosto$UsuarioCrea$disallow_zero_length]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[Tbl_TurnosPorCCosto]  WITH CHECK ADD  CONSTRAINT [SSMA_CC$Tbl_TurnosPorCCosto$UsuarioCrea$disallow_zero_length] CHECK  ((len([UsuarioCrea])>(0)))
GO
ALTER TABLE [dbo].[Tbl_TurnosPorCCosto] CHECK CONSTRAINT [SSMA_CC$Tbl_TurnosPorCCosto$UsuarioCrea$disallow_zero_length]
GO
/****** Object:  Check [SSMA_CC$Tbl_TurnosPorCCosto$UsuarioModifica$disallow_zero_length]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[Tbl_TurnosPorCCosto]  WITH CHECK ADD  CONSTRAINT [SSMA_CC$Tbl_TurnosPorCCosto$UsuarioModifica$disallow_zero_length] CHECK  ((len([UsuarioModifica])>(0)))
GO
ALTER TABLE [dbo].[Tbl_TurnosPorCCosto] CHECK CONSTRAINT [SSMA_CC$Tbl_TurnosPorCCosto$UsuarioModifica$disallow_zero_length]
GO
/****** Object:  Check [SSMA_CC$Tbl_Turnos$ClaseMinutosExcluidos$disallow_zero_length]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[Tbl_Turnos]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Tbl_Turnos$ClaseMinutosExcluidos$disallow_zero_length] CHECK  ((len([ClaseMinutosExcluidos])>(0)))
GO
ALTER TABLE [dbo].[Tbl_Turnos] CHECK CONSTRAINT [SSMA_CC$Tbl_Turnos$ClaseMinutosExcluidos$disallow_zero_length]
GO
/****** Object:  Check [SSMA_CC$Tbl_Turnos$Descripcion$disallow_zero_length]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[Tbl_Turnos]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Tbl_Turnos$Descripcion$disallow_zero_length] CHECK  ((len([Descripcion])>(0)))
GO
ALTER TABLE [dbo].[Tbl_Turnos] CHECK CONSTRAINT [SSMA_CC$Tbl_Turnos$Descripcion$disallow_zero_length]
GO
/****** Object:  Check [SSMA_CC$Tbl_Turnos$UsuarioCrea$disallow_zero_length]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[Tbl_Turnos]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Tbl_Turnos$UsuarioCrea$disallow_zero_length] CHECK  ((len([UsuarioCrea])>(0)))
GO
ALTER TABLE [dbo].[Tbl_Turnos] CHECK CONSTRAINT [SSMA_CC$Tbl_Turnos$UsuarioCrea$disallow_zero_length]
GO
/****** Object:  Check [SSMA_CC$Tbl_Turnos$UsuarioModifica$disallow_zero_length]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[Tbl_Turnos]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Tbl_Turnos$UsuarioModifica$disallow_zero_length] CHECK  ((len([UsuarioModifica])>(0)))
GO
ALTER TABLE [dbo].[Tbl_Turnos] CHECK CONSTRAINT [SSMA_CC$Tbl_Turnos$UsuarioModifica$disallow_zero_length]
GO
/****** Object:  Check [SSMA_CC$Tbl_Meses$Mes$disallow_zero_length]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[Tbl_Meses]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Tbl_Meses$Mes$disallow_zero_length] CHECK  ((len([Mes])>(0)))
GO
ALTER TABLE [dbo].[Tbl_Meses] CHECK CONSTRAINT [SSMA_CC$Tbl_Meses$Mes$disallow_zero_length]
GO
/****** Object:  Check [SSMA_CC$Tbl_ZonasPostales$NombreZona$disallow_zero_length]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[Tbl_ZonasPostales]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Tbl_ZonasPostales$NombreZona$disallow_zero_length] CHECK  ((len([NombreZona])>(0)))
GO
ALTER TABLE [dbo].[Tbl_ZonasPostales] CHECK CONSTRAINT [SSMA_CC$Tbl_ZonasPostales$NombreZona$disallow_zero_length]
GO
/****** Object:  Check [SSMA_CC$Tbl_Paises$Moneda$disallow_zero_length]    Script Date: 02/09/2013 11:13:33 ******/
ALTER TABLE [dbo].[Tbl_Paises]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Tbl_Paises$Moneda$disallow_zero_length] CHECK  ((len([Moneda])>(0)))
GO
ALTER TABLE [dbo].[Tbl_Paises] CHECK CONSTRAINT [SSMA_CC$Tbl_Paises$Moneda$disallow_zero_length]
GO
/****** Object:  Check [SSMA_CC$Tbl_Paises$Nombre$disallow_zero_length]    Script Date: 02/09/2013 11:13:33 ******/
ALTER TABLE [dbo].[Tbl_Paises]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Tbl_Paises$Nombre$disallow_zero_length] CHECK  ((len([Nombre])>(0)))
GO
ALTER TABLE [dbo].[Tbl_Paises] CHECK CONSTRAINT [SSMA_CC$Tbl_Paises$Nombre$disallow_zero_length]
GO
/****** Object:  Check [SSMA_CC$Tbl_Ciudades$Ciudad$validation_rule]    Script Date: 02/09/2013 11:13:33 ******/
ALTER TABLE [dbo].[Tbl_Ciudades]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Tbl_Ciudades$Ciudad$validation_rule] CHECK  (([Ciudad]>(0)))
GO
ALTER TABLE [dbo].[Tbl_Ciudades] CHECK CONSTRAINT [SSMA_CC$Tbl_Ciudades$Ciudad$validation_rule]
GO
/****** Object:  Check [SSMA_CC$Tbl_Ciudades$NombreCiudad$disallow_zero_length]    Script Date: 02/09/2013 11:13:33 ******/
ALTER TABLE [dbo].[Tbl_Ciudades]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Tbl_Ciudades$NombreCiudad$disallow_zero_length] CHECK  ((len([NombreCiudad])>(0)))
GO
ALTER TABLE [dbo].[Tbl_Ciudades] CHECK CONSTRAINT [SSMA_CC$Tbl_Ciudades$NombreCiudad$disallow_zero_length]
GO
/****** Object:  Check [SSMA_CC$Tbl_CentrosCosto$NombreCentroCosto$disallow_zero_length]    Script Date: 02/09/2013 11:13:33 ******/
ALTER TABLE [dbo].[Tbl_CentrosCosto]  WITH CHECK ADD  CONSTRAINT [SSMA_CC$Tbl_CentrosCosto$NombreCentroCosto$disallow_zero_length] CHECK  ((len([NombreCentroCosto])>(0)))
GO
ALTER TABLE [dbo].[Tbl_CentrosCosto] CHECK CONSTRAINT [SSMA_CC$Tbl_CentrosCosto$NombreCentroCosto$disallow_zero_length]
GO
/****** Object:  Check [SSMA_CC$Tbl_Funcionarios$ApartadoAereo$disallow_zero_length]    Script Date: 02/09/2013 11:13:34 ******/
ALTER TABLE [dbo].[Tbl_Funcionarios]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Tbl_Funcionarios$ApartadoAereo$disallow_zero_length] CHECK  ((len([ApartadoAereo])>(0)))
GO
ALTER TABLE [dbo].[Tbl_Funcionarios] CHECK CONSTRAINT [SSMA_CC$Tbl_Funcionarios$ApartadoAereo$disallow_zero_length]
GO
/****** Object:  Check [SSMA_CC$Tbl_Funcionarios$ApeFuncionario$disallow_zero_length]    Script Date: 02/09/2013 11:13:34 ******/
ALTER TABLE [dbo].[Tbl_Funcionarios]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Tbl_Funcionarios$ApeFuncionario$disallow_zero_length] CHECK  ((len([ApeFuncionario])>(0)))
GO
ALTER TABLE [dbo].[Tbl_Funcionarios] CHECK CONSTRAINT [SSMA_CC$Tbl_Funcionarios$ApeFuncionario$disallow_zero_length]
GO
/****** Object:  Check [SSMA_CC$Tbl_Funcionarios$Beeper$disallow_zero_length]    Script Date: 02/09/2013 11:13:34 ******/
ALTER TABLE [dbo].[Tbl_Funcionarios]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Tbl_Funcionarios$Beeper$disallow_zero_length] CHECK  ((len([Beeper])>(0)))
GO
ALTER TABLE [dbo].[Tbl_Funcionarios] CHECK CONSTRAINT [SSMA_CC$Tbl_Funcionarios$Beeper$disallow_zero_length]
GO
/****** Object:  Check [SSMA_CC$Tbl_Funcionarios$CodigoBeeper$disallow_zero_length]    Script Date: 02/09/2013 11:13:34 ******/
ALTER TABLE [dbo].[Tbl_Funcionarios]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Tbl_Funcionarios$CodigoBeeper$disallow_zero_length] CHECK  ((len([CodigoBeeper])>(0)))
GO
ALTER TABLE [dbo].[Tbl_Funcionarios] CHECK CONSTRAINT [SSMA_CC$Tbl_Funcionarios$CodigoBeeper$disallow_zero_length]
GO
/****** Object:  Check [SSMA_CC$Tbl_Funcionarios$DireccionCorrespondencia$disallow_zero_length]    Script Date: 02/09/2013 11:13:34 ******/
ALTER TABLE [dbo].[Tbl_Funcionarios]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Tbl_Funcionarios$DireccionCorrespondencia$disallow_zero_length] CHECK  ((len([DireccionCorrespondencia])>(0)))
GO
ALTER TABLE [dbo].[Tbl_Funcionarios] CHECK CONSTRAINT [SSMA_CC$Tbl_Funcionarios$DireccionCorrespondencia$disallow_zero_length]
GO
/****** Object:  Check [SSMA_CC$Tbl_Funcionarios$eMail$disallow_zero_length]    Script Date: 02/09/2013 11:13:34 ******/
ALTER TABLE [dbo].[Tbl_Funcionarios]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Tbl_Funcionarios$eMail$disallow_zero_length] CHECK  ((len([eMail])>(0)))
GO
ALTER TABLE [dbo].[Tbl_Funcionarios] CHECK CONSTRAINT [SSMA_CC$Tbl_Funcionarios$eMail$disallow_zero_length]
GO
/****** Object:  Check [SSMA_CC$Tbl_Funcionarios$JefeInmediato$disallow_zero_length]    Script Date: 02/09/2013 11:13:34 ******/
ALTER TABLE [dbo].[Tbl_Funcionarios]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Tbl_Funcionarios$JefeInmediato$disallow_zero_length] CHECK  ((len([JefeInmediato])>(0)))
GO
ALTER TABLE [dbo].[Tbl_Funcionarios] CHECK CONSTRAINT [SSMA_CC$Tbl_Funcionarios$JefeInmediato$disallow_zero_length]
GO
/****** Object:  Check [SSMA_CC$Tbl_Funcionarios$NomFuncionario$disallow_zero_length]    Script Date: 02/09/2013 11:13:34 ******/
ALTER TABLE [dbo].[Tbl_Funcionarios]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Tbl_Funcionarios$NomFuncionario$disallow_zero_length] CHECK  ((len([NomFuncionario])>(0)))
GO
ALTER TABLE [dbo].[Tbl_Funcionarios] CHECK CONSTRAINT [SSMA_CC$Tbl_Funcionarios$NomFuncionario$disallow_zero_length]
GO
/****** Object:  Check [SSMA_CC$Tbl_Funcionarios$Observaciones$disallow_zero_length]    Script Date: 02/09/2013 11:13:34 ******/
ALTER TABLE [dbo].[Tbl_Funcionarios]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Tbl_Funcionarios$Observaciones$disallow_zero_length] CHECK  ((len([Observaciones])>(0)))
GO
ALTER TABLE [dbo].[Tbl_Funcionarios] CHECK CONSTRAINT [SSMA_CC$Tbl_Funcionarios$Observaciones$disallow_zero_length]
GO
/****** Object:  Check [SSMA_CC$Tbl_Funcionarios$Password$disallow_zero_length]    Script Date: 02/09/2013 11:13:34 ******/
ALTER TABLE [dbo].[Tbl_Funcionarios]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Tbl_Funcionarios$Password$disallow_zero_length] CHECK  ((len([Password])>(0)))
GO
ALTER TABLE [dbo].[Tbl_Funcionarios] CHECK CONSTRAINT [SSMA_CC$Tbl_Funcionarios$Password$disallow_zero_length]
GO
/****** Object:  Check [SSMA_CC$Tbl_Funcionarios$Turno$disallow_zero_length]    Script Date: 02/09/2013 11:13:34 ******/
ALTER TABLE [dbo].[Tbl_Funcionarios]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Tbl_Funcionarios$Turno$disallow_zero_length] CHECK  ((len([Turno])>(0)))
GO
ALTER TABLE [dbo].[Tbl_Funcionarios] CHECK CONSTRAINT [SSMA_CC$Tbl_Funcionarios$Turno$disallow_zero_length]
GO
/****** Object:  Check [SSMA_CC$Tbl_Funcionarios$UsuarioCrea$disallow_zero_length]    Script Date: 02/09/2013 11:13:34 ******/
ALTER TABLE [dbo].[Tbl_Funcionarios]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Tbl_Funcionarios$UsuarioCrea$disallow_zero_length] CHECK  ((len([UsuarioCrea])>(0)))
GO
ALTER TABLE [dbo].[Tbl_Funcionarios] CHECK CONSTRAINT [SSMA_CC$Tbl_Funcionarios$UsuarioCrea$disallow_zero_length]
GO
/****** Object:  Check [SSMA_CC$Tbl_Funcionarios$UsuarioModifica$disallow_zero_length]    Script Date: 02/09/2013 11:13:34 ******/
ALTER TABLE [dbo].[Tbl_Funcionarios]  WITH NOCHECK ADD  CONSTRAINT [SSMA_CC$Tbl_Funcionarios$UsuarioModifica$disallow_zero_length] CHECK  ((len([UsuarioModifica])>(0)))
GO
ALTER TABLE [dbo].[Tbl_Funcionarios] CHECK CONSTRAINT [SSMA_CC$Tbl_Funcionarios$UsuarioModifica$disallow_zero_length]
GO
/****** Object:  Check [SSMA_CC$Tbl_ProgramacionMensual$UsuarioCrea$disallow_zero_length]    Script Date: 02/09/2013 11:13:34 ******/
ALTER TABLE [dbo].[Tbl_ProgramacionMensual]  WITH CHECK ADD  CONSTRAINT [SSMA_CC$Tbl_ProgramacionMensual$UsuarioCrea$disallow_zero_length] CHECK  ((len([UsuarioCrea])>(0)))
GO
ALTER TABLE [dbo].[Tbl_ProgramacionMensual] CHECK CONSTRAINT [SSMA_CC$Tbl_ProgramacionMensual$UsuarioCrea$disallow_zero_length]
GO
/****** Object:  Check [SSMA_CC$Tbl_ProgramacionMensual$UsuarioModifica$disallow_zero_length]    Script Date: 02/09/2013 11:13:34 ******/
ALTER TABLE [dbo].[Tbl_ProgramacionMensual]  WITH CHECK ADD  CONSTRAINT [SSMA_CC$Tbl_ProgramacionMensual$UsuarioModifica$disallow_zero_length] CHECK  ((len([UsuarioModifica])>(0)))
GO
ALTER TABLE [dbo].[Tbl_ProgramacionMensual] CHECK CONSTRAINT [SSMA_CC$Tbl_ProgramacionMensual$UsuarioModifica$disallow_zero_length]
GO
/****** Object:  ForeignKey [FK_Tbl_Departamentos_Tbl_Departamentos]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[Tbl_Departamentos]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Departamentos_Tbl_Departamentos] FOREIGN KEY([Departamento])
REFERENCES [dbo].[Tbl_Departamentos] ([Departamento])
GO
ALTER TABLE [dbo].[Tbl_Departamentos] CHECK CONSTRAINT [FK_Tbl_Departamentos_Tbl_Departamentos]
GO
/****** Object:  ForeignKey [FK_Tbl_Visitas_Tbl_Personas]    Script Date: 02/09/2013 11:13:32 ******/
ALTER TABLE [dbo].[Tbl_Visitas]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Visitas_Tbl_Personas] FOREIGN KEY([IdVisitante])
REFERENCES [dbo].[Tbl_Personas] ([IdPersona])
GO
ALTER TABLE [dbo].[Tbl_Visitas] CHECK CONSTRAINT [FK_Tbl_Visitas_Tbl_Personas]
GO
/****** Object:  ForeignKey [FK_Tbl_TagsxVehiculo_Tbl_Tags]    Script Date: 02/09/2013 11:13:33 ******/
ALTER TABLE [dbo].[Tbl_TagsxVehiculo]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_TagsxVehiculo_Tbl_Tags] FOREIGN KEY([IdTag])
REFERENCES [dbo].[Tbl_Tags] ([IdTag])
GO
ALTER TABLE [dbo].[Tbl_TagsxVehiculo] CHECK CONSTRAINT [FK_Tbl_TagsxVehiculo_Tbl_Tags]
GO
/****** Object:  ForeignKey [FK_Tbl_TagsxVehiculo_Tbl_Vehiculos]    Script Date: 02/09/2013 11:13:33 ******/
ALTER TABLE [dbo].[Tbl_TagsxVehiculo]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_TagsxVehiculo_Tbl_Vehiculos] FOREIGN KEY([IdVehiculo])
REFERENCES [dbo].[Tbl_Vehiculos] ([Placa])
GO
ALTER TABLE [dbo].[Tbl_TagsxVehiculo] CHECK CONSTRAINT [FK_Tbl_TagsxVehiculo_Tbl_Vehiculos]
GO
/****** Object:  ForeignKey [FK_Tbl_PermisosxAreas_Tbl_Tags]    Script Date: 02/09/2013 11:13:33 ******/
ALTER TABLE [dbo].[Tbl_PermisosxAreas]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_PermisosxAreas_Tbl_Tags] FOREIGN KEY([Tag])
REFERENCES [dbo].[Tbl_Tags] ([IdTag])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Tbl_PermisosxAreas] CHECK CONSTRAINT [FK_Tbl_PermisosxAreas_Tbl_Tags]
GO
/****** Object:  ForeignKey [FK_Tbl_MenusxPerfil_Tbl_Menus]    Script Date: 02/09/2013 11:13:33 ******/
ALTER TABLE [dbo].[Tbl_MenusxPerfil]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_MenusxPerfil_Tbl_Menus] FOREIGN KEY([idMenu])
REFERENCES [dbo].[Tbl_Menus] ([MenuId])
GO
ALTER TABLE [dbo].[Tbl_MenusxPerfil] CHECK CONSTRAINT [FK_Tbl_MenusxPerfil_Tbl_Menus]
GO
/****** Object:  ForeignKey [FK_Tbl_MenusxPerfil_Tbl_PerfilesUsuarios]    Script Date: 02/09/2013 11:13:33 ******/
ALTER TABLE [dbo].[Tbl_MenusxPerfil]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_MenusxPerfil_Tbl_PerfilesUsuarios] FOREIGN KEY([idPerfil])
REFERENCES [dbo].[Tbl_PerfilesUsuarios] ([idPerfil])
GO
ALTER TABLE [dbo].[Tbl_MenusxPerfil] CHECK CONSTRAINT [FK_Tbl_MenusxPerfil_Tbl_PerfilesUsuarios]
GO
/****** Object:  ForeignKey [FK_Tbl_Lectores_x_Area_Tbl_Dependencias]    Script Date: 02/09/2013 11:13:33 ******/
ALTER TABLE [dbo].[Tbl_Lectores_x_Area]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Lectores_x_Area_Tbl_Dependencias] FOREIGN KEY([Area])
REFERENCES [dbo].[Tbl_Dependencias] ([CodigoDependencia])
GO
ALTER TABLE [dbo].[Tbl_Lectores_x_Area] CHECK CONSTRAINT [FK_Tbl_Lectores_x_Area_Tbl_Dependencias]
GO
/****** Object:  ForeignKey [FK_Tbl_Lectores_x_Area_Tbl_Lectores]    Script Date: 02/09/2013 11:13:33 ******/
ALTER TABLE [dbo].[Tbl_Lectores_x_Area]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Lectores_x_Area_Tbl_Lectores] FOREIGN KEY([Lector])
REFERENCES [dbo].[Tbl_Lectores] ([NumeroLector])
GO
ALTER TABLE [dbo].[Tbl_Lectores_x_Area] CHECK CONSTRAINT [FK_Tbl_Lectores_x_Area_Tbl_Lectores]
GO
/****** Object:  ForeignKey [FK_Tbl_Lectores_x_Area_Tbl_Lectores_x_Area]    Script Date: 02/09/2013 11:13:33 ******/
ALTER TABLE [dbo].[Tbl_Lectores_x_Area]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Lectores_x_Area_Tbl_Lectores_x_Area] FOREIGN KEY([Area], [Lector])
REFERENCES [dbo].[Tbl_Lectores_x_Area] ([Area], [Lector])
GO
ALTER TABLE [dbo].[Tbl_Lectores_x_Area] CHECK CONSTRAINT [FK_Tbl_Lectores_x_Area_Tbl_Lectores_x_Area]
GO
/****** Object:  ForeignKey [FK_Tbl_usuarios_Tbl_perfilesUsuarios]    Script Date: 02/09/2013 11:13:33 ******/
ALTER TABLE [dbo].[Tbl_usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_usuarios_Tbl_perfilesUsuarios] FOREIGN KEY([perfil])
REFERENCES [dbo].[Tbl_PerfilesUsuarios] ([idPerfil])
GO
ALTER TABLE [dbo].[Tbl_usuarios] CHECK CONSTRAINT [FK_Tbl_usuarios_Tbl_perfilesUsuarios]
GO
/****** Object:  ForeignKey [FK_Tbl_TagsxVisitante_Tbl_Personas]    Script Date: 02/09/2013 11:13:33 ******/
ALTER TABLE [dbo].[Tbl_TagsxVisitante]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_TagsxVisitante_Tbl_Personas] FOREIGN KEY([Visitante])
REFERENCES [dbo].[Tbl_Personas] ([IdPersona])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Tbl_TagsxVisitante] CHECK CONSTRAINT [FK_Tbl_TagsxVisitante_Tbl_Personas]
GO
/****** Object:  ForeignKey [FK_Tbl_TagsxVisitante_Tbl_Tags]    Script Date: 02/09/2013 11:13:33 ******/
ALTER TABLE [dbo].[Tbl_TagsxVisitante]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_TagsxVisitante_Tbl_Tags] FOREIGN KEY([Tag])
REFERENCES [dbo].[Tbl_Tags] ([IdTag])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Tbl_TagsxVisitante] CHECK CONSTRAINT [FK_Tbl_TagsxVisitante_Tbl_Tags]
GO
/****** Object:  ForeignKey [FK_Tbl_Paises_Tbl_Continentes]    Script Date: 02/09/2013 11:13:33 ******/
ALTER TABLE [dbo].[Tbl_Paises]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Paises_Tbl_Continentes] FOREIGN KEY([Continente])
REFERENCES [dbo].[Tbl_Continentes] ([Continente])
GO
ALTER TABLE [dbo].[Tbl_Paises] CHECK CONSTRAINT [FK_Tbl_Paises_Tbl_Continentes]
GO
/****** Object:  ForeignKey [FK_Tbl_Ciudades_Tbl_Departamentos]    Script Date: 02/09/2013 11:13:33 ******/
ALTER TABLE [dbo].[Tbl_Ciudades]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Ciudades_Tbl_Departamentos] FOREIGN KEY([Departamento])
REFERENCES [dbo].[Tbl_Departamentos] ([Departamento])
GO
ALTER TABLE [dbo].[Tbl_Ciudades] CHECK CONSTRAINT [FK_Tbl_Ciudades_Tbl_Departamentos]
GO
/****** Object:  ForeignKey [FK_Tbl_CentrosCosto_Tbl_Dependencias]    Script Date: 02/09/2013 11:13:33 ******/
ALTER TABLE [dbo].[Tbl_CentrosCosto]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_CentrosCosto_Tbl_Dependencias] FOREIGN KEY([CodigoDependencia])
REFERENCES [dbo].[Tbl_Dependencias] ([CodigoDependencia])
GO
ALTER TABLE [dbo].[Tbl_CentrosCosto] CHECK CONSTRAINT [FK_Tbl_CentrosCosto_Tbl_Dependencias]
GO
/****** Object:  ForeignKey [FK_Tbl_AutorizadosxEmpresa_Tbl_Personas]    Script Date: 02/09/2013 11:13:33 ******/
ALTER TABLE [dbo].[Tbl_AutorizadosxEmpresa]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_AutorizadosxEmpresa_Tbl_Personas] FOREIGN KEY([Persona])
REFERENCES [dbo].[Tbl_Personas] ([IdPersona])
GO
ALTER TABLE [dbo].[Tbl_AutorizadosxEmpresa] CHECK CONSTRAINT [FK_Tbl_AutorizadosxEmpresa_Tbl_Personas]
GO
/****** Object:  ForeignKey [FK_Tbl_AlertasxAreas_Tbl_Dependencias]    Script Date: 02/09/2013 11:13:33 ******/
ALTER TABLE [dbo].[Tbl_AlertasxAreas]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_AlertasxAreas_Tbl_Dependencias] FOREIGN KEY([Dependencia])
REFERENCES [dbo].[Tbl_Dependencias] ([CodigoDependencia])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Tbl_AlertasxAreas] CHECK CONSTRAINT [FK_Tbl_AlertasxAreas_Tbl_Dependencias]
GO
/****** Object:  ForeignKey [FK_Tbl_AlertasxAreas_Tbl_Lectores]    Script Date: 02/09/2013 11:13:33 ******/
ALTER TABLE [dbo].[Tbl_AlertasxAreas]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_AlertasxAreas_Tbl_Lectores] FOREIGN KEY([Lector])
REFERENCES [dbo].[Tbl_Lectores] ([NumeroLector])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Tbl_AlertasxAreas] CHECK CONSTRAINT [FK_Tbl_AlertasxAreas_Tbl_Lectores]
GO
/****** Object:  ForeignKey [FK_Tbl_Funcionarios_Tbl_Ciudades]    Script Date: 02/09/2013 11:13:34 ******/
ALTER TABLE [dbo].[Tbl_Funcionarios]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Funcionarios_Tbl_Ciudades] FOREIGN KEY([Ciudad])
REFERENCES [dbo].[Tbl_Ciudades] ([Ciudad])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Tbl_Funcionarios] CHECK CONSTRAINT [FK_Tbl_Funcionarios_Tbl_Ciudades]
GO
/****** Object:  ForeignKey [FK_Tbl_Funcionarios_Tbl_Dependencias]    Script Date: 02/09/2013 11:13:34 ******/
ALTER TABLE [dbo].[Tbl_Funcionarios]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Funcionarios_Tbl_Dependencias] FOREIGN KEY([CodigoDependencia])
REFERENCES [dbo].[Tbl_Dependencias] ([CodigoDependencia])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Tbl_Funcionarios] CHECK CONSTRAINT [FK_Tbl_Funcionarios_Tbl_Dependencias]
GO
/****** Object:  ForeignKey [FK_Tbl_Funcionarios_Tbl_Sedes]    Script Date: 02/09/2013 11:13:34 ******/
ALTER TABLE [dbo].[Tbl_Funcionarios]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Funcionarios_Tbl_Sedes] FOREIGN KEY([NumeroSede])
REFERENCES [dbo].[Tbl_Sedes] ([NumeroSede])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Tbl_Funcionarios] CHECK CONSTRAINT [FK_Tbl_Funcionarios_Tbl_Sedes]
GO
/****** Object:  ForeignKey [FK_Tbl_Secciones_Tbl_CentrosCosto]    Script Date: 02/09/2013 11:13:34 ******/
ALTER TABLE [dbo].[Tbl_Secciones]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Secciones_Tbl_CentrosCosto] FOREIGN KEY([CentroCosto])
REFERENCES [dbo].[Tbl_CentrosCosto] ([CentroCosto])
GO
ALTER TABLE [dbo].[Tbl_Secciones] CHECK CONSTRAINT [FK_Tbl_Secciones_Tbl_CentrosCosto]
GO
/****** Object:  ForeignKey [FK_Tbl_ProgramacionMensual_Tbl_Funcionarios]    Script Date: 02/09/2013 11:13:34 ******/
ALTER TABLE [dbo].[Tbl_ProgramacionMensual]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_ProgramacionMensual_Tbl_Funcionarios] FOREIGN KEY([CCostoDia])
REFERENCES [dbo].[Tbl_CentrosCosto] ([CentroCosto])
GO
ALTER TABLE [dbo].[Tbl_ProgramacionMensual] CHECK CONSTRAINT [FK_Tbl_ProgramacionMensual_Tbl_Funcionarios]
GO
/****** Object:  ForeignKey [FK_Tbl_UsuariosEmpresa_Tbl_usuarios]    Script Date: 02/09/2013 11:13:34 ******/
ALTER TABLE [dbo].[Tbl_UsuariosEmpresa]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_UsuariosEmpresa_Tbl_usuarios] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Tbl_usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[Tbl_UsuariosEmpresa] CHECK CONSTRAINT [FK_Tbl_UsuariosEmpresa_Tbl_usuarios]
GO
/****** Object:  ForeignKey [FK_Tbl_Habitaciones_Tbl_Secciones]    Script Date: 02/09/2013 11:13:34 ******/
ALTER TABLE [dbo].[Tbl_Habitaciones]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Habitaciones_Tbl_Secciones] FOREIGN KEY([Seccion])
REFERENCES [dbo].[Tbl_Secciones] ([Codigo])
GO
ALTER TABLE [dbo].[Tbl_Habitaciones] CHECK CONSTRAINT [FK_Tbl_Habitaciones_Tbl_Secciones]
GO
/****** Object:  ForeignKey [FK_Tbl_Habitaciones_Tbl_Torres]    Script Date: 02/09/2013 11:13:34 ******/
ALTER TABLE [dbo].[Tbl_Habitaciones]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Habitaciones_Tbl_Torres] FOREIGN KEY([Torre])
REFERENCES [dbo].[Tbl_Torres] ([IdTorre])
GO
ALTER TABLE [dbo].[Tbl_Habitaciones] CHECK CONSTRAINT [FK_Tbl_Habitaciones_Tbl_Torres]
GO
/****** Object:  ForeignKey [FK_Tbl_Funcionarios]    Script Date: 02/09/2013 11:13:34 ******/
ALTER TABLE [dbo].[Tbl_Funcionarios_x_Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Funcionarios] FOREIGN KEY([IdFuncionario])
REFERENCES [dbo].[Tbl_Funcionarios] ([IdFuncionario])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Tbl_Funcionarios_x_Usuario] CHECK CONSTRAINT [FK_Tbl_Funcionarios]
GO
/****** Object:  ForeignKey [FK_Tbl_Usuarios]    Script Date: 02/09/2013 11:13:34 ******/
ALTER TABLE [dbo].[Tbl_Funcionarios_x_Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_Usuarios] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Tbl_usuarios] ([IdUsuario])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Tbl_Funcionarios_x_Usuario] CHECK CONSTRAINT [FK_Tbl_Usuarios]
GO
/****** Object:  ForeignKey [FK_Tbl_AgendaVisitasFuncionario_Tbl_Funcionarios]    Script Date: 02/09/2013 11:13:34 ******/
ALTER TABLE [dbo].[Tbl_AgendaVisitasFuncionario]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_AgendaVisitasFuncionario_Tbl_Funcionarios] FOREIGN KEY([IdFuncionario])
REFERENCES [dbo].[Tbl_Funcionarios] ([IdFuncionario])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Tbl_AgendaVisitasFuncionario] CHECK CONSTRAINT [FK_Tbl_AgendaVisitasFuncionario_Tbl_Funcionarios]
GO
/****** Object:  ForeignKey [FK_Tbl_AgendaVisitasFuncionario_Tbl_Personas]    Script Date: 02/09/2013 11:13:34 ******/
ALTER TABLE [dbo].[Tbl_AgendaVisitasFuncionario]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_AgendaVisitasFuncionario_Tbl_Personas] FOREIGN KEY([IdVisitante])
REFERENCES [dbo].[Tbl_Personas] ([IdPersona])
GO
ALTER TABLE [dbo].[Tbl_AgendaVisitasFuncionario] CHECK CONSTRAINT [FK_Tbl_AgendaVisitasFuncionario_Tbl_Personas]
GO
/****** Object:  ForeignKey [FK_Tbl_HorarioVisitasxSeccion_Tbl_Secciones]    Script Date: 02/09/2013 11:13:34 ******/
ALTER TABLE [dbo].[Tbl_HorarioVisitasxSeccion]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_HorarioVisitasxSeccion_Tbl_Secciones] FOREIGN KEY([Seccion])
REFERENCES [dbo].[Tbl_Secciones] ([Codigo])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Tbl_HorarioVisitasxSeccion] CHECK CONSTRAINT [FK_Tbl_HorarioVisitasxSeccion_Tbl_Secciones]
GO
/****** Object:  ForeignKey [FK_Tbl_HistorialPaciente_Tbl_Pacientes]    Script Date: 02/09/2013 11:13:34 ******/
ALTER TABLE [dbo].[Tbl_HistorialPacientes]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_HistorialPaciente_Tbl_Pacientes] FOREIGN KEY([Paciente])
REFERENCES [dbo].[Tbl_Pacientes] ([Identificacion])
GO
ALTER TABLE [dbo].[Tbl_HistorialPacientes] CHECK CONSTRAINT [FK_Tbl_HistorialPaciente_Tbl_Pacientes]
GO
/****** Object:  ForeignKey [FK_Tbl_HistorialPacientes_Tbl_Habitaciones]    Script Date: 02/09/2013 11:13:34 ******/
ALTER TABLE [dbo].[Tbl_HistorialPacientes]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_HistorialPacientes_Tbl_Habitaciones] FOREIGN KEY([Torre], [Habitacion])
REFERENCES [dbo].[Tbl_Habitaciones] ([Torre], [Codigo])
GO
ALTER TABLE [dbo].[Tbl_HistorialPacientes] CHECK CONSTRAINT [FK_Tbl_HistorialPacientes_Tbl_Habitaciones]
GO

USE [TWAccess]
GO

/****** Object:  Table [dbo].[Tbl_AgendaVisitasFuncionario]    Script Date: 02/20/2013 20:51:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Tbl_AgendaVisitasFuncionario](
	[IdFuncionario] [float] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Hora] [time](7) NOT NULL,
	[IdVisitante] [float] NULL,
	[Motivo] [text] NULL,
	[FechaCrea] [datetime] NULL,
	[FechaModifica] [datetime] NULL,
	[UsuarioCrea] [nvarchar](50) NULL,
	[UsuarioModifica] [nvarchar](50) NULL,
	[csc] [int] IDENTITY(1,1) NOT NULL,
	[Estado] [nvarchar](50) NULL,
	[IdUsuario] [int] NULL,
 CONSTRAINT [PK_Tbl_AgendaVisitasFuncionario2] PRIMARY KEY CLUSTERED 
(
	[IdFuncionario] ASC,
	[Fecha] ASC,
	[Hora] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[Tbl_AgendaVisitasFuncionario]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_AgendaVisitasFuncionario_Tbl_Funcionarios] FOREIGN KEY([IdFuncionario])
REFERENCES [dbo].[Tbl_Funcionarios] ([IdFuncionario])
ON UPDATE CASCADE
GO

ALTER TABLE [dbo].[Tbl_AgendaVisitasFuncionario] CHECK CONSTRAINT [FK_Tbl_AgendaVisitasFuncionario_Tbl_Funcionarios]
GO

ALTER TABLE [dbo].[Tbl_AgendaVisitasFuncionario]  WITH CHECK ADD  CONSTRAINT [FK_Tbl_AgendaVisitasFuncionario_Tbl_Personas] FOREIGN KEY([IdVisitante])
REFERENCES [dbo].[Tbl_Personas] ([IdPersona])
GO

ALTER TABLE [dbo].[Tbl_AgendaVisitasFuncionario] CHECK CONSTRAINT [FK_Tbl_AgendaVisitasFuncionario_Tbl_Personas]
GO


USE [TWAccess]
GO

/****** Object:  Table [dbo].[Tbl_Personas]    Script Date: 02/20/2013 20:52:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Tbl_Personas](
	[IdPersona] [float] NOT NULL,
	[CodPersona] [int] NULL,
	[Empresa] [float] NULL,
	[NomPersona] [nvarchar](50) NULL,
	[ApePersona] [nvarchar](50) NULL,
	[MesCumpleaños] [smallint] NULL,
	[DiaCumpleaños] [smallint] NULL,
	[DireccionCorrespondencia] [nvarchar](50) NULL,
	[Ciudad] [int] NULL,
	[TelCasa] [int] NULL,
	[Celular] [float] NULL,
	[Fax] [int] NULL,
	[eMail] [nvarchar](50) NULL,
	[Activo] [bit] NULL,
	[Observaciones] [nvarchar](max) NULL,
	[Foto] [nvarchar](50) NULL,
	[UsuarioCrea] [nvarchar](50) NULL,
	[FechaCrea] [datetime] NULL,
	[UsuarioModifica] [nvarchar](50) NULL,
	[FechaModifica] [datetime] NULL,
	[contratista] [bit] NULL,
	[fechavigenciaARP] [date] NULL,
 CONSTRAINT [PK_Tbl_Personas] PRIMARY KEY CLUSTERED 
(
	[IdPersona] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

