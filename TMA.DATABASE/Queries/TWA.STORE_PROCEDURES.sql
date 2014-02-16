USE [TimeWork]
GO

/****** Object:  StoredProcedure [TWA].[CanEntryByAuthorization]    Script Date: 10/15/2013 11:02:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [TWA].[CanEntryByAuthorization]
	@EMPLOYEE_CODE INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT	Autorizado
	FROM	TWA.Tbl_Autorizaciones WITH(NOLOCK)
	WHERE	PersonaIngresa = @EMPLOYEE_CODE
	AND FechaInicial < GETDATE()
	AND FechaFinal > GETDATE()

END
GO



--================================================


USE [TimeWork]
GO

/****** Object:  StoredProcedure [TWA].[CanEntryPerson]    Script Date: 10/15/2013 11:03:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================7

--EXEC [TWA].[CanEntryPerson] '1', '2013-08-09'
CREATE PROCEDURE [TWA].[CanEntryPerson]
	@ID_BIOMETRIC NVARCHAR(MAX),
	@ENTRY_DATE DATETIME
AS
BEGIN
	DECLARE @ENTRY INT,
			@DOCUMENT_NUMBER NVARCHAR(MAX),
			@NAME VARCHAR(MAX),
			@MESSAGE VARCHAR(MAX)
	
	SET NOCOUNT ON;
	
	SELECT	@DOCUMENT_NUMBER = CONVERT(VARCHAR, CONVERT(DECIMAL, IdPersona) )
			, @NAME = NomPersona + ' ' + ApePersona
			, @ENTRY = COUNT(1)
	FROM	TWA.Tbl_Personas WITH(NOLOCK)
	WHERE	CodPersona = @ID_BIOMETRIC
	GROUP BY	IdPersona
					, ( NomPersona + ' ' + ApePersona )
					
	SET @MESSAGE = 'Validando la persona: ' + @ID_BIOMETRIC + ', existe: ' + CONVERT(VARCHAR, @ENTRY )
	-- Se valida si existe la persona
	IF ( @ENTRY > 0)
	BEGIN 
		
		SET		@ENTRY = 0
		
		SELECT	@ENTRY = COUNT(1)
		FROM	dbo.Tbl_AgendaVisitasFuncionario AGEN WITH(NOLOCK)
		INNER JOIN	TWA.Tbl_Personas PER WITH(NOLOCK) ON PER.IdPersona = AGEN.IdVisitante
		WHERE	AGEN.Fecha >= @ENTRY_DATE AND AGEN.Fecha < DATEADD(MINUTE,1439,DATEDIFF(DD,0,GETDATE()))
				AND	PER.CodPersona = @ID_BIOMETRIC
		
		SET @MESSAGE = @MESSAGE + ' , ' + 'Validando la agenda para: ' + @ID_BIOMETRIC + ', existe: ' + CONVERT(VARCHAR, @ENTRY )
				
				-- Si la persona está agendada
				IF( @ENTRY > 0 )
				BEGIN
				
					SELECT '1' AS CAN_ENTRY
				
				END
				-- Se verifica si el usuario está aprobado para ingresar
				ELSE IF( @ENTRY = 0 )
				BEGIN
					
					SET @ENTRY = 0
					
					SELECT	@ENTRY = COUNT(1)
					FROM	TWA.Tbl_Autorizaciones WITH(NOLOCK)
					WHERE	PersonaIngresa = @DOCUMENT_NUMBER
							AND ( GETDATE()  BETWEEN FechaInicial AND FechaFinal  )
				
					SET @MESSAGE = @MESSAGE + ' , ' + 'Verificando las autorizaciones para: ' + ISNULL(@DOCUMENT_NUMBER, ' ')  + ', existe: ' + CONVERT(VARCHAR, @ENTRY )	
					-- Si la persona tiene autorización
					IF( @ENTRY > 0 )
					BEGIN
						SELECT '1' AS CAN_ENTRY, @DOCUMENT_NUMBER AS DOCUMENT_NUMBER, @NAME AS NAME 
					END	
					ELSE
					BEGIN
						
						SET @MESSAGE = @MESSAGE + ' , ' + 'No existe una agenda ni aprobación, se realiza creación de la solicitud para la autorización'
						INSERT INTO TWA.Tbl_Autorizaciones VALUES( 
						( SELECT TOP 1 CONVERT(VARCHAR, CONVERT(DECIMAL, idPersona))  FROM TWA.Tbl_Personas WITH(NOLOCK) WHERE CodPersona = @ID_BIOMETRIC ) -- Persona que ingresa
						, @DOCUMENT_NUMBER -- Número de documento
						, @NAME -- Nombre de la persona que ingresa
						, 'Pendiente asignación de cargo' -- Cargo de la persona que ingresa
						, 'Pendiente asignación de sede' -- Sede de la persona que ingresa
						, 'Pendiente asignación de centro de costo' -- Centro de costo de la persona que ingresa
						, -1 -- Empresa de la persona que ingresa
						, GETDATE() -- Fecha inicial
						, DATEADD(HOUR, 3,GETDATE()) -- Fecha final
						, GETDATE() -- Fecha del registro
						, -1 -- Persona que autoriza el ingreso
						, -1 -- Tipo de ingreso
						, NULL -- IP del dispositivo biométrico
						, NULL -- Motivo del ingreso
						, NULL -- Autorizado ?
						 )
						SELECT '0' AS CAN_ENTRY, @DOCUMENT_NUMBER AS DOCUMENT_NUMBER, @NAME AS NAME 
					
					END
				END
				
				ELSE 
				BEGIN
				
					SET @MESSAGE = @MESSAGE + ' , ' + 'Creando la solicitud para la autorización'
					INSERT INTO TWA.Tbl_Autorizaciones VALUES( 
						( SELECT TOP 1 CONVERT(VARCHAR, CONVERT(DECIMAL, idPersona))  FROM TWA.Tbl_Personas WITH(NOLOCK) WHERE CodPersona = @ID_BIOMETRIC ) -- Persona que ingresa
						, @DOCUMENT_NUMBER -- Número de documento
						, @NAME -- Nombre de la persona que ingresa
						, 'Pendiente asignación de cargo' -- Cargo de la persona que ingresa
						, 'Pendiente asignación de sede' -- Sede de la persona que ingresa
						, 'Pendiente asignación de centro de costo' -- Centro de costo de la persona que ingresa
						, -1 -- Empresa de la persona que ingresa
						, GETDATE() -- Fecha inicial
						, DATEADD(HOUR, 3,GETDATE()) -- Fecha final
						, GETDATE() -- Fecha del registro
						, -1 -- Persona que autoriza el ingreso
						, -1 -- Tipo de ingreso
						, NULL -- IP del dispositivo biométrico
						, NULL -- Motivo del ingreso
						, NULL -- Autorizado ?
						 )
					SELECT '0' AS CAN_ENTRY, @DOCUMENT_NUMBER AS DOCUMENT_NUMBER, @NAME AS NAME 
				
				END
	END
	
	PRINT @MESSAGE

END

GO


--================================================


USE [TimeWork]
GO

/****** Object:  StoredProcedure [TWA].[CreateAuthorization]    Script Date: 10/15/2013 11:06:01 ******/
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

	INSERT INTO [TWA].[Tbl_Autorizaciones]
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

--================================================


USE [TimeWork]
GO

/****** Object:  StoredProcedure [TWA].[CreateDevice]    Script Date: 10/15/2013 11:06:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

--EXEC [TWA].[CreateDevice] '192.168.0.111', 'Inactivo', 'Ninguna'
CREATE PROCEDURE [TWA].[CreateDevice]
	@IP_DEVICE NVARCHAR(20),
	@STATE NVARCHAR(20),
	@OBSERVATIONS NVARCHAR(250)

AS
BEGIN
	
	DECLARE @EXIST NVARCHAR(1)
	
	EXEC  TWA.ExistDevice @IP_DEVICE, @EXIST = @EXIST OUTPUT
	
	IF @EXIST <> 0
	BEGIN
		UPDATE [TWA].[Tbl_Dispositivos]
		SET	   [Estado] = @STATE
			   ,[FechaRegistro] = GETDATE()
			   ,[Observaciones] = @OBSERVATIONS
		 WHERE [DireccionIPDispositivo]  = @IP_DEVICE
	END
	ELSE
	BEGIN
		INSERT INTO [TWA].[Tbl_Dispositivos]
			   ([DireccionIPDispositivo]
			   ,[Estado]
			   ,[FechaRegistro]
			   ,[Observaciones])
		 VALUES
			   ( @IP_DEVICE
			   , @STATE
			   , GETDATE()
			   , @OBSERVATIONS )

	END
END

GO


--================================================

USE [TimeWork]
GO

/****** Object:  StoredProcedure [TWA].[CreateEntryRegister]    Script Date: 10/15/2013 11:06:56 ******/
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

	INSERT INTO [TWA].[Tbl_AuditoriaIngreso]
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

--================================================

USE [TimeWork]
GO

/****** Object:  StoredProcedure [TWA].[ExistDevice]    Script Date: 10/15/2013 11:07:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

--EXEC [TWA].[ExistDevice] '7791'
CREATE PROCEDURE [TWA].[ExistDevice]
	@IP_DEVICE NVARCHAR(20),
	@EXIST NVARCHAR(1) OUTPUT

AS
BEGIN
	
	SET NOCOUNT ON;
	
	DECLARE @COUNT INT
	
	SET @COUNT = 0
		
	SELECT	@COUNT = COUNT( 1 )
	FROM 	TWA.Tbl_Dispositivos	
	WHERE 	DireccionIPDispositivo = @IP_DEVICE

	IF @COUNT > 0
	BEGIN 
		SET @EXIST = 1
		SELECT @EXIST AS EXIST 
	END
	ELSE 
	BEGIN 
		SET @EXIST = 0
		SELECT @EXIST AS EXIST 
	END

END

GO

--================================================

USE [TimeWork]
GO

/****** Object:  StoredProcedure [TWA].[ExistFunctionary]    Script Date: 10/15/2013 11:07:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

--EXEC [TWA].[ExistFunctionary] '77926543'
CREATE PROCEDURE [TWA].[ExistFunctionary]
	@ID_BIOMETRIC NVARCHAR(10)

AS
BEGIN
	
	SET NOCOUNT ON;
	
	DECLARE @COUNT INT
	
	SET @COUNT = 0
		
	SELECT	@COUNT = COUNT( 1 )
	FROM 	Tbl_Funcionarios	
	WHERE 	Tbl_Funcionarios.CodEmpleado = @ID_BIOMETRIC

	IF @COUNT > 0
	BEGIN 
		SELECT 1 AS EXIST 
	END
	ELSE 
	BEGIN 
		SELECT 0 AS EXIST 
	END

END

GO


--================================================
USE [TimeWork]
GO

/****** Object:  StoredProcedure [TWA].[GetFunctionary]    Script Date: 10/15/2013 11:07:40 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

--EXEC [TWA].[GetFunctionary] '7791'
CREATE PROCEDURE [TWA].[GetFunctionary]
	@ID_BIOMETRIC NVARCHAR(10)

AS
BEGIN
	
	SET NOCOUNT ON;
	
	SELECT	Tbl_Funcionarios.CodEmpleado AS ID_BIOMETRIC
			, Tbl_Funcionarios.IdFuncionario AS DOCUMENT_NUMBER
			, ( Tbl_Funcionarios.NomFuncionario + ' ' + Tbl_Funcionarios.ApeFuncionario ) AS NAME
			, Tbl_Funcionarios.Empresa AS COMPANY
			, Tbl_Funcionarios.NumeroSede AS HEADQUARTER
			, Tbl_Funcionarios.CodigoCargo AS CHARGE_CODE
	FROM 	Tbl_Funcionarios	
	WHERE 	Tbl_Funcionarios.CodEmpleado = @ID_BIOMETRIC

END

GO


--================================================
USE [TimeWork]
GO

/****** Object:  StoredProcedure [TWA].[GetFunctionaryTurn]    Script Date: 10/15/2013 11:07:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

--EXEC [TWA].[GetFunctionaryTurn] '7791'
CREATE PROCEDURE [TWA].[GetFunctionaryTurn]
	@ID_BIOMETRIC NVARCHAR(10)

AS
BEGIN
	
	SET NOCOUNT ON;
	
	SELECT 	Tbl_Funcionarios.CodEmpleado AS ID_BIOMETRIC
			, Tbl_TurnosPorFuncionario.Fecha AS TURN_DATE
			, Tbl_TurnosPorFuncionario.CodigoTurno AS TURN_CODE
			, Tbl_Turnos.HorasxTurno AS TOTAL_HOURS
			, Tbl_ParametrosxEmpresa.MinutosAntesLlegada AS MINUTES_BEFORE_ENTRY
			, Tbl_ParametrosxEmpresa.MinutosDespuesLlegada AS MINUTES_AFTER_ENTRY		
	FROM	Tbl_Funcionarios WITH(NOLOCK)
			INNER JOIN Tbl_ParametrosxEmpresa  WITH(NOLOCK) ON Tbl_Funcionarios.Empresa = Tbl_ParametrosxEmpresa.Id_Tercero
			INNER JOIN Tbl_TurnosPorFuncionario ON Tbl_Funcionarios.IdFuncionario = Tbl_TurnosPorFuncionario.IdFuncionario
			INNER JOIN Tbl_Turnos ON Tbl_Turnos.CodigoTurno = Tbl_TurnosPorFuncionario.CodigoTurno		
	WHERE 	Tbl_Funcionarios.CodEmpleado = @ID_BIOMETRIC
			AND CONVERT(NVARCHAR, Tbl_TurnosPorFuncionario.Fecha, 101) = CONVERT(NVARCHAR, GETDATE(), 101)

END

GO


--================================================

USE [TimeWork]
GO

/****** Object:  StoredProcedure [TWA].[HasFunctionaryTurn]    Script Date: 10/15/2013 11:07:59 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

--EXEC [TWA].[HasFunctionaryTurn] '7791'
CREATE PROCEDURE [TWA].[HasFunctionaryTurn]
	@ID_BIOMETRIC NVARCHAR(10)

AS
BEGIN
	
	SET NOCOUNT ON;
	
	DECLARE @COUNT INT
	
	SET @COUNT = 0
		
	SELECT	@COUNT = COUNT( 1 )
	FROM 	Tbl_Funcionarios	
			INNER JOIN Tbl_TurnosPorFuncionario ON Tbl_Funcionarios.IdFuncionario = Tbl_TurnosPorFuncionario.IdFuncionario
	WHERE 	Tbl_Funcionarios.CodEmpleado = @ID_BIOMETRIC
			AND CONVERT(NVARCHAR, Tbl_TurnosPorFuncionario.Fecha, 101) = CONVERT(NVARCHAR, GETDATE(), 101)

	IF @COUNT > 0
	BEGIN 
		SELECT 1 AS EXIST 
	END
	ELSE 
	BEGIN 
		SELECT 0 AS EXIST 
	END

END

GO

--================================================
