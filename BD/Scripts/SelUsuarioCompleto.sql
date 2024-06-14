SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Agustin Herrera
-- Create date: 06/06/2024
-- Description:	lista los usuarios con todos sus detalles.
-- =============================================
create PROCEDURE  SelUsuarioCompleto

AS
BEGIN
	SET NOCOUNT ON;

SELECT [IdReserva]
      ,[DNI]
      ,[EstadoReserva]
      ,[IdPaquete]
      ,[Precio]
  FROM[RESERVA]


END