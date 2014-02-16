USE [TimeWork]
GO

CREATE SCHEMA TWA

GO

--================================================

USE [TimeWork]
GO

/****** Object:  Table [TWA].[Tbl_AuditoriaIngreso]    Script Date: 10/15/2013 10:54:06 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [TWA].[Tbl_AuditoriaIngreso](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PersonaIngresa] [int] NULL,
	[NumeroDocumento] [nvarchar](50) NULL,
	[NombrePersonaIngresa] [nvarchar](150) NULL,
	[CargoPersonaIngresa] [nvarchar](50) NULL,
	[SedePersonaIngresa] [nvarchar](150) NULL,
	[CentroCostoPersonaIngresa] [nvarchar](150) NULL,
	[EmpresaPersonaIngresa] [nvarchar](150) NULL,
	[FechaRegistro] [datetime] NULL,
	[DireccionIPDispositivo] [nvarchar](20) NULL,
	[Motivo] [nvarchar](250) NULL,
 CONSTRAINT [PK_AuditoriaIngreso] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

--================================================


USE [TimeWork]
GO

/****** Object:  Table [TWA].[Tbl_Autorizaciones]    Script Date: 10/15/2013 10:57:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [TWA].[Tbl_Autorizaciones](
	[Id_Autorizacion] [int] IDENTITY(1,1) NOT NULL,
	[PersonaIngresa] [nvarchar](50) NULL,
	[NumeroDocumento] [nvarchar](50) NULL,
	[NombrePersonaIngresa] [nvarchar](150) NULL,
	[CargoPersonaIngresa] [nvarchar](50) NULL,
	[SedePersonaIngresa] [nvarchar](150) NULL,
	[CentroCostoPersonaIngresa] [nvarchar](150) NULL,
	[EmpresaPersonaIngresa] [nvarchar](150) NULL,
	[FechaInicial] [datetime] NULL,
	[FechaFinal] [datetime] NULL,
	[FechaRegistro] [datetime] NULL,
	[PersonaAutoriza] [int] NULL,
	[Id_TipoIngreso] [int] NULL,
	[DireccionIPDispositivo] [nvarchar](20) NULL,
	[Motivo] [nvarchar](250) NULL,
	[Autorizado] [bit] NULL,
 CONSTRAINT [PK_Tbl_Autorizaciones] PRIMARY KEY CLUSTERED 
(
	[Id_Autorizacion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


--================================================

USE [TimeWork]
GO

/****** Object:  Table [TWA].[Tbl_Dispositivos]    Script Date: 10/15/2013 10:57:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [TWA].[Tbl_Dispositivos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DireccionIPDispositivo] [nvarchar](20) NULL,
	[Estado] [nvarchar](10) NULL,
	[FechaRegistro] [datetime] NULL,
	[Observaciones] [nvarchar](250) NULL,
 CONSTRAINT [PK_Dispositivos] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

--================================================

USE [TimeWork]
GO

/****** Object:  Table [TWA].[Tbl_Estados]    Script Date: 10/15/2013 10:58:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [TWA].[Tbl_Estados](
	[Id_Estado] [int] IDENTITY(1,1) NOT NULL,
	[NombreEstado] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO

INSERT INTO  [TWA].[Tbl_Estados] VALUES('Inactivo')
GO
INSERT INTO  [TWA].[Tbl_Estados] VALUES('Activo')
GO

--================================================

USE [TimeWork]
GO

/****** Object:  Table [TWA].[Tbl_Personas]    Script Date: 10/15/2013 10:58:21 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [TWA].[Tbl_Personas](
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


--================================================

USE [TimeWork]
GO

/****** Object:  Table [TWA].[Tbl_TipoIngreso]    Script Date: 10/15/2013 10:58:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [TWA].[Tbl_TipoIngreso](
	[Id_TipoIngreso] [int] IDENTITY(1,1) NOT NULL,
	[NombreTipoIngreso] [nvarchar](50) NOT NULL
) ON [PRIMARY]

GO



INSERT INTO [TWA].[Tbl_TipoIngreso] VALUES ('Funcionario')
GO
INSERT INTO [TWA].[Tbl_TipoIngreso] VALUES ('Contratista')
GO
INSERT INTO [TWA].[Tbl_TipoIngreso] VALUES ('Estudiante')
GO
INSERT INTO [TWA].[Tbl_TipoIngreso] VALUES ('Becario')
GO
INSERT INTO [TWA].[Tbl_TipoIngreso] VALUES ('Soporte')
GO


--================================================

USE [TimeWork]
GO

/****** Object:  Table [TWA].[Tbl_Visitas]    Script Date: 10/15/2013 10:58:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [TWA].[Tbl_Visitas](
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

ALTER TABLE [TWA].[Tbl_Visitas] ADD  CONSTRAINT [DF__Tbl_Visit__Recib__6B44E613]  DEFAULT (NULL) FOR [RecibeVisita]
GO

ALTER TABLE [TWA].[Tbl_Visitas] ADD  CONSTRAINT [DF__Tbl_Visit__Fecha__6C390A4C]  DEFAULT (NULL) FOR [FechaInicial]
GO

ALTER TABLE [TWA].[Tbl_Visitas] ADD  CONSTRAINT [DF__Tbl_Visit__HoraI__6D2D2E85]  DEFAULT (NULL) FOR [HoraInicial]
GO

ALTER TABLE [TWA].[Tbl_Visitas] ADD  CONSTRAINT [DF__Tbl_Visit__Fecha__6E2152BE]  DEFAULT (NULL) FOR [FechaFinal]
GO

ALTER TABLE [TWA].[Tbl_Visitas] ADD  CONSTRAINT [DF__Tbl_Visit__HoraF__6F1576F7]  DEFAULT (NULL) FOR [HoraFinal]
GO

ALTER TABLE [TWA].[Tbl_Visitas] ADD  CONSTRAINT [DF__Tbl_Visit__Durac__70099B30]  DEFAULT ('00:00:00') FOR [DuracionVisita]
GO

ALTER TABLE [TWA].[Tbl_Visitas] ADD  CONSTRAINT [DF__Tbl_Visit__IdUsu__70FDBF69]  DEFAULT (NULL) FOR [IdUsuario]
GO

ALTER TABLE [TWA].[Tbl_Visitas] ADD  CONSTRAINT [DF__Tbl_Visita__area__71F1E3A2]  DEFAULT (NULL) FOR [area]
GO

--================================================
