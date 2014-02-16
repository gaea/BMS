--CRUD
--Visitas.
--Personas (Visitantes: Funcionarios o Personas del Comun).
--Agenda.
--Autorizaciones de ingreso
--+ Tablas maestras

USE TWAccess

-- 1. Consultar los datos básicos de la Persona (Si no existe se crea)
SELECT	P.CODPERSONA AS CODIGO_LECTOR_BIOMETRICO
		, P.*
FROM dbo.TBL_PERSONAS P WITH(NOLOCK)


-- 2. Validamos si está agen 
SELECT	V.IdVisitante AS DOCUMENTO_IDENTIFICACION
		, V.FECHA AS FECHA_TRANSACCION -- Fecha actual GETDATE() 
		, V.RECIBEVISITA  -- es la identificación del funcionario que recibe la visita (IdFuncionario), si no es una visita para un funcionario colocar el valor núlo 
		, V.IDUSUARIO --Puede ser nùlo
		, V.*
FROM	dbo.TBL_VISITAS V WITH(NOLOCK)
--Adicionar campo Tipo de Visita: para los cuales adicionamos si es un funcionario, practicante
--u otro tipo

-- Si no está agendada la visita, se debe agendar.
SELECT *
FROM dbo.Tbl_AgendaVisitasFuncionario WITH(NOLOCK)


-- Visitas de funcionarios.
SELECT	F.CODEMPLEADO AS CODIGO_LECTOR_BIOMETRICO
		, F.*
FROM dbo.TBL_FUNCIONARIOS F WITH(NOLOCK)


 