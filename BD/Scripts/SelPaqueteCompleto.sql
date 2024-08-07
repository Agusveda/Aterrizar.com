USE [ATERRIZAR_COM]
GO
/****** Object:  StoredProcedure [dbo].[SelPaqueteCompleto]    Script Date: 14/6/2024 20:05:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE  [dbo].[SelPaqueteCompleto]
@TipoTransporte INT = NULL

AS
BEGIN
	SET NOCOUNT ON;

SELECT  [IdPaquete]
      ,[cdgDestino]
      ,[NombrePaquete]
      ,[Descripcion]
      ,[PrecioPaquete]
      ,[mes]
      ,[Duracion]
      ,[TipoTransporte]
	  , URLimagen
  FROM PAQUETE 

  WHERE 
        @TipoTransporte IS NULL OR TipoTransporte = @TipoTransporte
END