USE [TWAccess]
GO

/****** Object:  Table [dbo].[Tbl_AuditoriaIngreso]    Script Date: 08/11/2013 15:31:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Tbl_AuditoriaIngreso](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PersonaIngresa] [int] NOT NULL,
	[NumeroDocumento] [nvarchar](50) NOT NULL,
	[NombrePersonaIngresa] [nvarchar](150) NOT NULL,
	[CargoPersonaIngresa] [nvarchar](50) NOT NULL,
	[SedePersonaIngresa] [nvarchar](150) NOT NULL,
	[CentroCostoPersonaIngresa] [nvarchar](150) NOT NULL,
	[EmpresaPersonaIngresa] [nvarchar](150) NOT NULL,
	[FechaRegistro] [datetime] NULL,
	[DireccionIPDispositivo] [nvarchar](20) NULL,
	[Motivo] [nvarchar](250) NULL,
 CONSTRAINT [PK_AuditoriaIngreso] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


--===========================================================

USE [TWAccess]
GO

/****** Object:  Table [dbo].[Tbl_Autorizaciones]    Script Date: 08/11/2013 15:31:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Tbl_Autorizaciones](
	[Id_Autorizacion] [int] IDENTITY(1,1) NOT NULL,
	[PersonaIngresa] [nvarchar](50) NOT NULL,
	[NumeroDocumento] [nvarchar](50) NOT NULL,
	[NombrePersonaIngresa] [nvarchar](150) NOT NULL,
	[CargoPersonaIngresa] [nvarchar](50) NOT NULL,
	[SedePersonaIngresa] [nvarchar](150) NOT NULL,
	[CentroCostoPersonaIngresa] [nvarchar](150) NOT NULL,
	[EmpresaPersonaIngresa] [nvarchar](150) NOT NULL,
	[FechaInicial] [datetime] NOT NULL,
	[FechaFinal] [datetime] NOT NULL,
	[FechaRegistro] [datetime] NOT NULL,
	[PersonaAutoriza] [int] NOT NULL,
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

--===========================================================

USE [TWAccess]
GO

/****** Object:  StoredProcedure [TWA].[CreateAuthorization]    Script Date: 08/11/2013 15:32:29 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TWA].[CreateAuthorization]
	@EMPLOYEE_CODE nvarchar(50),
	@ID_PERSONAUTHORIZING int,
	@DOCUMENT_NUMBER_PERSONAUTHORIZING nvarchar(50),
	@NAME_PERSONAUTHORIZING nvarchar(150),
	@CHARGE_PERSONAUTHORIZING nvarchar(50),
	@HEADQUARTER_PERSONAUTHORIZING nvarchar(150),
	@COSTCENTER_PERSONAUTHORIZING nvarchar(150),
	@COMPANY_PERSONAUTHORIZING nvarchar(150),
	@IP_DEVICE nvarchar(20),
	@REASON_MESSAGE nvarchar (250)
AS
BEGIN
	
	SET NOCOUNT ON;

	INSERT INTO [TWAccess].[dbo].[Tbl_Autorizaciones]
           ([PersonaIngresa]
           ,[NumeroDocumento]
           ,[NombrePersonaIngresa]
           ,[CargoPersonaIngresa]
           ,[SedePersonaIngresa]
           ,[CentroCostoPersonaIngresa]
           ,[EmpresaPersonaIngresa]
           ,[FechaInicial]
           ,[FechaFinal]
           ,[FechaRegistro]
           ,[PersonaAutoriza]
           ,[Id_TipoIngreso]
           ,[DireccionIPDispositivo]
           ,[Motivo]
           ,[Autorizado])
     VALUES
           (@EMPLOYEE_CODE
           , @DOCUMENT_NUMBER_PERSONAUTHORIZING
           , @NAME_PERSONAUTHORIZING
           , @CHARGE_PERSONAUTHORIZING
           , @HEADQUARTER_PERSONAUTHORIZING
           , @COSTCENTER_PERSONAUTHORIZING
           , @COMPANY_PERSONAUTHORIZING
           ,DATEADD(DD,0,DATEDIFF(DD,0,GETDATE()))
           ,DATEADD(DD,0,DATEDIFF(DD,-1,GETDATE()))
           ,GETDATE()
           ,@ID_PersonAuthorizing
           ,null
           , @IP_DEVICE
           ,@Reason_Message
           ,null)
END


GO



--===========================================================

USE [TWAccess]
GO

/****** Object:  StoredProcedure [TWA].[CreateEntryRegister]    Script Date: 08/11/2013 15:32:42 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TWA].[CreateEntryRegister]
	@EMPLOYEE_CODE nvarchar(50),
	@DOCUMENT_NUMBER_PERSONAUTHORIZING nvarchar(50),
	@NAME_PERSONAUTHORIZING nvarchar(150),
	@CHARGE_PERSONAUTHORIZING nvarchar(50),
	@HEADQUARTER_PERSONAUTHORIZING nvarchar(150),
	@COSTCENTER_PERSONAUTHORIZING nvarchar(150),
	@COMPANY_PERSONAUTHORIZING nvarchar(150),
	@IP_DEVICE nvarchar(20),
	@MESSAGE nvarchar (250)
AS
BEGIN
	
	SET NOCOUNT ON;

	INSERT INTO [dbo].[Tbl_AuditoriaIngreso]
           ([PersonaIngresa]
           ,[NumeroDocumento]
           ,[NombrePersonaIngresa]
           ,[CargoPersonaIngresa]
           ,[SedePersonaIngresa]
           ,[CentroCostoPersonaIngresa]
           ,[EmpresaPersonaIngresa]
           ,[FechaRegistro]
           ,[DireccionIPDispositivo]
           ,[Motivo])
     VALUES
           (@EMPLOYEE_CODE
           ,@DOCUMENT_NUMBER_PERSONAUTHORIZING
           ,@NAME_PERSONAUTHORIZING
           ,@CHARGE_PERSONAUTHORIZING
           ,@HEADQUARTER_PERSONAUTHORIZING
           ,@COSTCENTER_PERSONAUTHORIZING
           ,@COMPANY_PERSONAUTHORIZING
           ,GETDATE()
           ,@IP_DEVICE
           ,@MESSAGE)
END


GO


--=========================================================== 