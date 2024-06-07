
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Agustin Herrera
-- Create date: 06/06/2024
-- Description:	lista los paquetes con todos sus detalles.
-- =============================================
Create PROCEDURE  SelPaqueteCompleto

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
  FROM PAQUETE AS P


END
GO
