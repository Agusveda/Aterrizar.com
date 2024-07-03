USE [master]
GO
/****** Object:  Database [ATERRIZAR_COM]    Script Date: 3/7/2024 18:51:40 ******/
CREATE DATABASE [ATERRIZAR_COM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ATERRIZAR_COM', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ATERRIZAR_COM.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ATERRIZAR_COM_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ATERRIZAR_COM_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ATERRIZAR_COM] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ATERRIZAR_COM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ATERRIZAR_COM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ATERRIZAR_COM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ATERRIZAR_COM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ATERRIZAR_COM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ATERRIZAR_COM] SET ARITHABORT OFF 
GO
ALTER DATABASE [ATERRIZAR_COM] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ATERRIZAR_COM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ATERRIZAR_COM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ATERRIZAR_COM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ATERRIZAR_COM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ATERRIZAR_COM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ATERRIZAR_COM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ATERRIZAR_COM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ATERRIZAR_COM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ATERRIZAR_COM] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ATERRIZAR_COM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ATERRIZAR_COM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ATERRIZAR_COM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ATERRIZAR_COM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ATERRIZAR_COM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ATERRIZAR_COM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ATERRIZAR_COM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ATERRIZAR_COM] SET RECOVERY FULL 
GO
ALTER DATABASE [ATERRIZAR_COM] SET  MULTI_USER 
GO
ALTER DATABASE [ATERRIZAR_COM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ATERRIZAR_COM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ATERRIZAR_COM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ATERRIZAR_COM] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ATERRIZAR_COM] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ATERRIZAR_COM] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ATERRIZAR_COM] SET QUERY_STORE = ON
GO
ALTER DATABASE [ATERRIZAR_COM] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ATERRIZAR_COM]
GO
/****** Object:  Table [dbo].[DESTINO]    Script Date: 3/7/2024 18:51:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DESTINO](
	[IdDestino] [int] IDENTITY(1,1) NOT NULL,
	[cdgDestino] [int] NOT NULL,
	[NombreDestino] [varchar](500) NOT NULL,
	[TipoTransporte] [int] NOT NULL,
	[PrecioTransporte] [money] NOT NULL,
 CONSTRAINT [PK_DESTINO] PRIMARY KEY CLUSTERED 
(
	[IdDestino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EXCURSIONES]    Script Date: 3/7/2024 18:51:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EXCURSIONES](
	[IdExcursion] [int] IDENTITY(1,1) NOT NULL,
	[cdgdestino] [int] NOT NULL,
	[Descripcion] [varchar](200) NOT NULL,
	[Precio] [money] NOT NULL,
	[CantidadPersonas] [int] NULL,
	[Duracion] [int] NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_EXCURSIONES] PRIMARY KEY CLUSTERED 
(
	[IdExcursion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HOTEL]    Script Date: 3/7/2024 18:51:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HOTEL](
	[IdHotel] [int] IDENTITY(1,1) NOT NULL,
	[NombreHotel] [varchar](80) NOT NULL,
	[Descripcion] [varchar](150) NOT NULL,
	[PrecioPorNoche] [money] NOT NULL,
	[cdgDestino] [int] NOT NULL,
	[URLimagen] [varchar](500) NULL,
 CONSTRAINT [PK_HOTEL] PRIMARY KEY CLUSTERED 
(
	[IdHotel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PAQUETE]    Script Date: 3/7/2024 18:51:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PAQUETE](
	[IdPaquete] [int] IDENTITY(1,1) NOT NULL,
	[cdgDestino] [int] NOT NULL,
	[NombrePaquete] [varchar](200) NOT NULL,
	[Descripcion] [varchar](400) NOT NULL,
	[PrecioPaquete] [money] NOT NULL,
	[Mes] [int] NOT NULL,
	[Duracion] [int] NOT NULL,
	[TipoTransporte] [int] NOT NULL,
	[URLimagen] [varchar](1000) NOT NULL,
	[Disponibilidad] [int] NULL,
 CONSTRAINT [PK_PAQUETE] PRIMARY KEY CLUSTERED 
(
	[IdPaquete] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RESERVA]    Script Date: 3/7/2024 18:51:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RESERVA](
	[IdReserva] [int] IDENTITY(1,1) NOT NULL,
	[DNI] [int] NOT NULL,
	[EstadoReserva] [int] NOT NULL,
	[IdPaquete] [int] NOT NULL,
	[Precio] [money] NOT NULL,
 CONSTRAINT [PK_RESERVA_1] PRIMARY KEY CLUSTERED 
(
	[IdReserva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIOS]    Script Date: 3/7/2024 18:51:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIOS](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[CorreoElectronico] [varchar](150) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[DNI] [int] NOT NULL,
	[Telefono] [varchar](50) NULL,
	[TipoUsuario] [int] NULL,
 CONSTRAINT [PK_USUARIOS] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DESTINO] ON 

INSERT [dbo].[DESTINO] ([IdDestino], [cdgDestino], [NombreDestino], [TipoTransporte], [PrecioTransporte]) VALUES (2, 1, N'Bariloche', 1, 68700.0000)
INSERT [dbo].[DESTINO] ([IdDestino], [cdgDestino], [NombreDestino], [TipoTransporte], [PrecioTransporte]) VALUES (3, 2, N'Jujuy', 1, 63200.0000)
INSERT [dbo].[DESTINO] ([IdDestino], [cdgDestino], [NombreDestino], [TipoTransporte], [PrecioTransporte]) VALUES (4, 3, N'Villa Carlos Paz', 1, 65000.0000)
INSERT [dbo].[DESTINO] ([IdDestino], [cdgDestino], [NombreDestino], [TipoTransporte], [PrecioTransporte]) VALUES (5, 1, N'Cordoba', 1, 35000.0000)
SET IDENTITY_INSERT [dbo].[DESTINO] OFF
GO
SET IDENTITY_INSERT [dbo].[EXCURSIONES] ON 

INSERT [dbo].[EXCURSIONES] ([IdExcursion], [cdgdestino], [Descripcion], [Precio], [CantidadPersonas], [Duracion], [Nombre]) VALUES (1, 1, N'El Circuito Chico en Bariloche ofrece vistas espectaculares de la Patagonia, destacando lugares como Cerro Campanario y el Hotel Llao Llao.', 15000.0000, 1, 4, N'Circuito Chico ')
INSERT [dbo].[EXCURSIONES] ([IdExcursion], [cdgdestino], [Descripcion], [Precio], [CantidadPersonas], [Duracion], [Nombre]) VALUES (2, 1, N'San Martín de los Andes es el punto de partida para la famosa excursión por los 7 lagos, un recorrido escénico que atraviesa paisajes espectaculares de lagos y montañas en la Patagonia argentina.', 42000.0000, 1, 10, N'San Martín de los Andes ')
INSERT [dbo].[EXCURSIONES] ([IdExcursion], [cdgdestino], [Descripcion], [Precio], [CantidadPersonas], [Duracion], [Nombre]) VALUES (7, 1, N'Descubre la majestuosidad del Cerro Tronador y el Glaciar Ventisquero Negro. Desde la Ruta Nacional 40, bordeando los lagos Gutiérrez y Mascardi, llegarás a la base del imponente Cerro Tronador.', 25000.0000, 1, 4, N'Cerro tronador')
INSERT [dbo].[EXCURSIONES] ([IdExcursion], [cdgdestino], [Descripcion], [Precio], [CantidadPersonas], [Duracion], [Nombre]) VALUES (8, 1, N'Descubre Bariloche: paisajes de película, lago cristalino, Bosque de Arrayanes. Navega a Quetrihue, conoce Arrayán centenario, visita isla Victoria y Puerto Anchorena. Disfruta del paisaje, ', 36000.0000, 1, 4, N'Paseo en barco ')
INSERT [dbo].[EXCURSIONES] ([IdExcursion], [cdgdestino], [Descripcion], [Precio], [CantidadPersonas], [Duracion], [Nombre]) VALUES (10, 1, N'¡Vive la emoción de la nieve en Cerro López! Ascenso en 4x4, caminata con raquetas, pista de trineo, almuerzo de fondue de queso y merienda de fondue de chocolate', 120000.0000, 1, 9, N'Refugio Extremo Encantado')
INSERT [dbo].[EXCURSIONES] ([IdExcursion], [cdgdestino], [Descripcion], [Precio], [CantidadPersonas], [Duracion], [Nombre]) VALUES (11, 2, N'prueba', 3444.0000, 2, 10, N'prueba')
SET IDENTITY_INSERT [dbo].[EXCURSIONES] OFF
GO
SET IDENTITY_INSERT [dbo].[HOTEL] ON 

INSERT [dbo].[HOTEL] ([IdHotel], [NombreHotel], [Descripcion], [PrecioPorNoche], [cdgDestino], [URLimagen]) VALUES (1, N'Alma Del Lago Suites', N'Ubicado frente al Lago Nahuel Huapi, en Bariloche', 169103.0000, 1, N'https://alma-del-lago.hotelesenpatagonia.com/data/Photos/OriginalPhoto/7486/748656/748656929.JPEG')
INSERT [dbo].[HOTEL] ([IdHotel], [NombreHotel], [Descripcion], [PrecioPorNoche], [cdgDestino], [URLimagen]) VALUES (2, N'Villa Huapi', N'Situado en frente del lago Nahuel Huapi, en Dina Huapi', 81600.0000, 1, N'https://cf.bstatic.com/xdata/images/hotel/max1024x768/92998290.jpg?k=17a4a438ad335c96bf5563d74d017efaf81fbfcfa761722012404fae3f57c195&o=&hp=1')
INSERT [dbo].[HOTEL] ([IdHotel], [NombreHotel], [Descripcion], [PrecioPorNoche], [cdgDestino], [URLimagen]) VALUES (4, N'Hotel Concorde', N'El Hotel Concorde se encuentra en San Carlos de Bariloche,', 70000.0000, 1, N'https://www.barilochehoy.com/wp-content/uploads/2023/12/hotel-concorde-en-bariloche-rio-negro-argentina.jpg')
INSERT [dbo].[HOTEL] ([IdHotel], [NombreHotel], [Descripcion], [PrecioPorNoche], [cdgDestino], [URLimagen]) VALUES (5, N'prueba', N'prueba', 2522.0000, 1, N'nul')
SET IDENTITY_INSERT [dbo].[HOTEL] OFF
GO
SET IDENTITY_INSERT [dbo].[PAQUETE] ON 

INSERT [dbo].[PAQUETE] ([IdPaquete], [cdgDestino], [NombrePaquete], [Descripcion], [PrecioPaquete], [Mes], [Duracion], [TipoTransporte], [URLimagen], [Disponibilidad]) VALUES (2, 1, N'Nieve en Bariloche', N'Podras disfrutar la nieve en bariloche con el mejor hotel recomendado', 400000.0000, 7, 7, 1, N'https://www.shutterstock.com/image-photo/argentina-patagonia-bariloche-island-isla-600nw-2240573477.jpg', 100)
INSERT [dbo].[PAQUETE] ([IdPaquete], [cdgDestino], [NombrePaquete], [Descripcion], [PrecioPaquete], [Mes], [Duracion], [TipoTransporte], [URLimagen], [Disponibilidad]) VALUES (3, 1, N'Bariloche low cost', N'Disfruta bariloche de una manera mas barata y accesible', 180000.0000, 7, 4, 2, N'https://www.interpatagonia.com/bariloche/imagenes/sanbernardo2.jpg', 100)
INSERT [dbo].[PAQUETE] ([IdPaquete], [cdgDestino], [NombrePaquete], [Descripcion], [PrecioPaquete], [Mes], [Duracion], [TipoTransporte], [URLimagen], [Disponibilidad]) VALUES (5, 2, N'Jujuy Maravilloso', N'Descubre la belleza de la Quebrada de Humahuaca y la cultura local en un viaje inolvidable.', 300000.0000, 7, 7, 1, N'https://media.istockphoto.com/id/1303686899/es/foto/paisaje-de-colores-en-purmamarca-jujuy-argentina.jpg?s=612x612&w=0&k=20&c=wQtVfID95eoE-w4o6TK_pe0JdplKmWGFEkLd2uyLgPE=', 100)
INSERT [dbo].[PAQUETE] ([IdPaquete], [cdgDestino], [NombrePaquete], [Descripcion], [PrecioPaquete], [Mes], [Duracion], [TipoTransporte], [URLimagen], [Disponibilidad]) VALUES (6, 2, N'Aventura en Jujuy', N'Explora los paisajes únicos de Salinas Grandes y las coloridas montañas de Purmamarca.', 150000.0000, 7, 4, 2, N'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Cerro_de_los_siete_colores.JPG/800px-Cerro_de_los_siete_colores.JPG', 100)
INSERT [dbo].[PAQUETE] ([IdPaquete], [cdgDestino], [NombrePaquete], [Descripcion], [PrecioPaquete], [Mes], [Duracion], [TipoTransporte], [URLimagen], [Disponibilidad]) VALUES (9, 3, N'Encanto de Villa Carlos Paz', N'Disfruta de las espectaculares vistas del lago San Roque y de la vibrante vida nocturna local.', 355000.0000, 7, 7, 1, N'https://regionobjetivo.com.ar/download/multimedia.normal.8c6176f4af854e89.524547494f4e204f424a455449564f20464f544f2056494c4c41204341524c4f5f6e6f726d616c2e77656270.webp', 100)
INSERT [dbo].[PAQUETE] ([IdPaquete], [cdgDestino], [NombrePaquete], [Descripcion], [PrecioPaquete], [Mes], [Duracion], [TipoTransporte], [URLimagen], [Disponibilidad]) VALUES (11, 3, N'Relax en Carlos Paz', N'Descubre los atractivos turísticos de esta encantadora ciudad', 173000.0000, 7, 4, 1, N'https://www.elciudadanoweb.com/wp-content/uploads/2024/01/carlospaz.jpg', 100)
INSERT [dbo].[PAQUETE] ([IdPaquete], [cdgDestino], [NombrePaquete], [Descripcion], [PrecioPaquete], [Mes], [Duracion], [TipoTransporte], [URLimagen], [Disponibilidad]) VALUES (12, 2, N'prueba', N'descripcion prueba', 35000.0000, 4, 2, 1, N'null', 100)
INSERT [dbo].[PAQUETE] ([IdPaquete], [cdgDestino], [NombrePaquete], [Descripcion], [PrecioPaquete], [Mes], [Duracion], [TipoTransporte], [URLimagen], [Disponibilidad]) VALUES (13, 1, N'Prue2', N'verificando', 1555.0000, 6, 7, 1, N'asdasdasd', 4)
SET IDENTITY_INSERT [dbo].[PAQUETE] OFF
GO
SET IDENTITY_INSERT [dbo].[RESERVA] ON 

INSERT [dbo].[RESERVA] ([IdReserva], [DNI], [EstadoReserva], [IdPaquete], [Precio]) VALUES (1, 11223344, 1, 2, 35000.0000)
INSERT [dbo].[RESERVA] ([IdReserva], [DNI], [EstadoReserva], [IdPaquete], [Precio]) VALUES (2, 452151, 1, 5, 35066.0000)
SET IDENTITY_INSERT [dbo].[RESERVA] OFF
GO
SET IDENTITY_INSERT [dbo].[USUARIOS] ON 

INSERT [dbo].[USUARIOS] ([IdUsuario], [Nombre], [CorreoElectronico], [Password], [DNI], [Telefono], [TipoUsuario]) VALUES (1, N'Agustin', N'Agusveda110303@gmail.com', N'agu1234', 11223344, N'1123640290', 1)
INSERT [dbo].[USUARIOS] ([IdUsuario], [Nombre], [CorreoElectronico], [Password], [DNI], [Telefono], [TipoUsuario]) VALUES (2, N'Andres', N'andriuwSlanplay@yajo.am', N'andriuwthebest', 12341, N'1234512', 1)
INSERT [dbo].[USUARIOS] ([IdUsuario], [Nombre], [CorreoElectronico], [Password], [DNI], [Telefono], [TipoUsuario]) VALUES (5, N'Admin', N'raul@1234', N'Admin', 319723, N'121213', 2)
INSERT [dbo].[USUARIOS] ([IdUsuario], [Nombre], [CorreoElectronico], [Password], [DNI], [Telefono], [TipoUsuario]) VALUES (6, N'Prueba', N'prueba@chemail.com', N'prueba1234', 12341, N'55501054', 1)
INSERT [dbo].[USUARIOS] ([IdUsuario], [Nombre], [CorreoElectronico], [Password], [DNI], [Telefono], [TipoUsuario]) VALUES (8, N'prueba2', N'prueba2@sisi.com', N'prueba2', 1234123, N'123422', 1)
INSERT [dbo].[USUARIOS] ([IdUsuario], [Nombre], [CorreoElectronico], [Password], [DNI], [Telefono], [TipoUsuario]) VALUES (9, N'asd', N'pruaaeba2@sisaaai.com', N'asd', 11111, N'22222', 1)
INSERT [dbo].[USUARIOS] ([IdUsuario], [Nombre], [CorreoElectronico], [Password], [DNI], [Telefono], [TipoUsuario]) VALUES (10, N'asdasd', N'asdasd11', N'asd11', 11111, N'11111', 1)
INSERT [dbo].[USUARIOS] ([IdUsuario], [Nombre], [CorreoElectronico], [Password], [DNI], [Telefono], [TipoUsuario]) VALUES (11, N'asdas', N'andresben18@gmail.com', N'asdasd', 3434141, N'', 1)
INSERT [dbo].[USUARIOS] ([IdUsuario], [Nombre], [CorreoElectronico], [Password], [DNI], [Telefono], [TipoUsuario]) VALUES (12, N'andres', N'andresben18@gmail.com', N'Prog3', 39517168, N'1231231', 1)
INSERT [dbo].[USUARIOS] ([IdUsuario], [Nombre], [CorreoElectronico], [Password], [DNI], [Telefono], [TipoUsuario]) VALUES (13, N'andresb', N'andresben18@gmail.com', N'123123', 3123123, N'1231231', 1)
INSERT [dbo].[USUARIOS] ([IdUsuario], [Nombre], [CorreoElectronico], [Password], [DNI], [Telefono], [TipoUsuario]) VALUES (14, N'andresb', N'andresben18@gmail.com', N'12312312', 12321312, N'', 1)
INSERT [dbo].[USUARIOS] ([IdUsuario], [Nombre], [CorreoElectronico], [Password], [DNI], [Telefono], [TipoUsuario]) VALUES (15, N'andresb', N'andresben18@gmail.com', N'asdasd', 39517168, N'', 1)
INSERT [dbo].[USUARIOS] ([IdUsuario], [Nombre], [CorreoElectronico], [Password], [DNI], [Telefono], [TipoUsuario]) VALUES (16, N'asdasd', N'andresben18@gmail.com', N'123123', 2131231, N'', 1)
INSERT [dbo].[USUARIOS] ([IdUsuario], [Nombre], [CorreoElectronico], [Password], [DNI], [Telefono], [TipoUsuario]) VALUES (17, N'asdasd', N'andresben18@gmail.com', N'123123', 123123, N'12312', 1)
SET IDENTITY_INSERT [dbo].[USUARIOS] OFF
GO
/****** Object:  StoredProcedure [dbo].[DelPaquete]    Script Date: 3/7/2024 18:51:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--=============================================
-- Author:    Facundo Dorrego
-- Create date: 28/06/2024
-- Description:    Borrar Paquete
-- =============================================
CREATE PROCEDURE  [dbo].[DelPaquete]

@IdPaquete INT = NULL

AS
BEGIN
    SET NOCOUNT ON;

    Delete 

    FROM 
        PAQUETE 
    WHERE 
        @IdPaquete  = IdPaquete

END
GO
/****** Object:  StoredProcedure [dbo].[insDestino]    Script Date: 3/7/2024 18:51:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Agustin Herrera
-- Create date: 19/06/2024
-- Description:	ingresa un nuevo Destino a la tabla..
-- =============================================
create PROCEDURE  [dbo].[insDestino]

@cdgDestino int,
@NombreDestino varchar(500),
@TipoTransporte int,
@PrecioTransporte money
AS
BEGIN
	SET NOCOUNT ON;


INSERT INTO DESTINO	
           (cdgDestino,NombreDestino,TipoTransporte,PrecioTransporte)
     VALUES
	 (@cdgDestino,@NombreDestino,@TipoTransporte,@PrecioTransporte)
END



/****** Object:  StoredProcedure [dbo].[ObtenerUsuarioPorId]    Script Date: 19/06/2024 16:19:46 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[insExcursiones]    Script Date: 3/7/2024 18:51:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Agustin Herrera
-- Create date: 19/06/2024
-- Description:	ingresa un nuevo excursion a la tabla..
-- =============================================
create PROCEDURE  [dbo].[insExcursiones]

@cdgDestino int,
@Descripcion varchar(200),
@Precio money,
@NombreHotel varchar(80),
@CantidadPersonas int,
@Duracion int,
@Nombre varchar(50)
AS
BEGIN
	SET NOCOUNT ON;


INSERT INTO EXCURSIONES	
           (cdgdestino,Descripcion,Precio,CantidadPersonas,Duracion,Nombre)
     VALUES
	 (@cdgdestino,@Descripcion,@Precio,@CantidadPersonas,@Duracion,@Nombre)
END



/****** Object:  StoredProcedure [dbo].[ObtenerUsuarioPorId]    Script Date: 19/06/2024 16:19:46 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[insHotel]    Script Date: 3/7/2024 18:51:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Agustin Herrera
-- Create date: 19/06/2024
-- Description:	ingresa un nuevo hotel a la tabla..
-- =============================================
CREATE  PROCEDURE  [dbo].[insHotel]	

@NombreHotel varchar(80),
@Descripcion varchar(150),
@PrecioPorNoche money,
@cdgDestino int,
@URLimagen varchar(500)
AS
BEGIN
	SET NOCOUNT ON;


INSERT INTO HOTEL	
           (NombreHotel,Descripcion,PrecioPorNoche,cdgDestino,URLimagen)
     VALUES
	 (@NombreHotel,@Descripcion,@PrecioPorNoche,@cdgDestino,@URLimagen)
END



/****** Object:  StoredProcedure [dbo].[ObtenerUsuarioPorId]    Script Date: 19/06/2024 16:19:46 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[insPaquete]    Script Date: 3/7/2024 18:51:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Agustin Herrera
-- Create date: 19/06/2024
-- Description:	
-- =============================================
create PROCEDURE  [dbo].[insPaquete]

@cdgDestino int,
@NombrePaquete varchar(200),
@Descripcion varchar(400),
@PrecioPaquete money,
@Mes int,
@Duracion int, 
@TipoTransporte int,
@URLimagen varchar(1000),
@Disponibilidad int
AS
BEGIN
	SET NOCOUNT ON;


INSERT INTO PAQUETE
           (cdgDestino,NombrePaquete,Descripcion,PrecioPaquete,Mes ,Duracion ,TipoTransporte,URLimagen ,Disponibilidad)
     VALUES
	 (@cdgDestino,@NombrePaquete,@Descripcion,@PrecioPaquete,@Mes ,@Duracion ,@TipoTransporte, @URLimagen ,@Disponibilidad)
END



/****** Object:  StoredProcedure [dbo].[ObtenerUsuarioPorId]    Script Date: 19/06/2024 16:19:46 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[insReserva]    Script Date: 3/7/2024 18:51:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Agustin Herrera
-- Create date: 19/06/2024
-- Description:	ingresa un nuevo Reserva  a la tabla..
-- =============================================
create PROCEDURE  [dbo].[insReserva] 

@DNI int,
@EstadoReserva int,
@IdPaquete int,
@Precio money
AS
BEGIN
	SET NOCOUNT ON;


INSERT INTO RESERVA	
           (DNI,EstadoReserva,IdPaquete,Precio)
     VALUES
	 (@DNI,@EstadoReserva,@IdPaquete,@Precio)
END



/****** Object:  StoredProcedure [dbo].[ObtenerUsuarioPorId]    Script Date: 19/06/2024 16:19:46 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[insUsuario]    Script Date: 3/7/2024 18:51:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Agustin Herrera
-- Create date: 20/06/2024
-- Description:	ingresa un nuevo Usuario  a la tabla..
-- =============================================
CREATE PROCEDURE  [dbo].[insUsuario] 
@Nombre varchar(50),
@CorreoElectronico varchar(150),
@Password varchar(50),
@DNI int,
@Telefono varchar(50),
@TipoUsuario int
AS
BEGIN
	SET NOCOUNT ON;


INSERT INTO USUARIOS	
           (Nombre,CorreoElectronico,Password,DNI,Telefono,TipoUsuario)
     VALUES
	 (@Nombre,@CorreoElectronico,@Password,@DNI,@Telefono,@TipoUsuario)
END



/****** Object:  StoredProcedure [dbo].[ObtenerUsuarioPorId]    Script Date: 19/06/2024 16:19:46 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[ObtenerDestinoPorId]    Script Date: 3/7/2024 18:51:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Dorrego Facundo
-- Create date: 19/06/2024
-- Description:	Obtiene destino por id.
-- =============================================
Create PROCEDURE  [dbo].[ObtenerDestinoPorId]
@IdDestino INT = NULL
AS
BEGIN
	SET NOCOUNT ON;

SELECT [IdDestino]
      ,[cdgDestino]
	  ,NombreDestino
	  ,TipoTransporte
	  ,PrecioTransporte
	 
      
      
  FROM [DESTINO]
    WHERE 
	(@IdDestino IS NULL OR IdDestino = @IdDestino);

END

GO
/****** Object:  StoredProcedure [dbo].[ObtenerExcursionesPorId]    Script Date: 3/7/2024 18:51:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Agustin Herrera
-- Create date: 19/06/2024
-- Description:	Obtiene Excursion por id.
-- =============================================
CREATE PROCEDURE  [dbo].[ObtenerExcursionesPorId] 
@IdExcursion INT = NULL
AS
BEGIN
	SET NOCOUNT ON;

SELECT  [IdExcursion]
      ,[cdgdestino]
      ,[Descripcion]
      ,[Precio]
      ,[CantidadPersonas]
      ,[Duracion]
      ,[Nombre]
  FROM [EXCURSIONES]
    WHERE 
	(@IdExcursion IS NULL OR IdExcursion = @IdExcursion);

END



/****** Object:  StoredProcedure [dbo].[ObtenerUsuarioPorId]    Script Date: 19/06/2024 16:19:46 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[ObtenerHotelPorId]    Script Date: 3/7/2024 18:51:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[ObtenerHotelPorId]

@IdHotel INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

   SELECT [IdHotel]
      ,[NombreHotel]
      ,[Descripcion]
      ,[PrecioPorNoche]
      ,[cdgDestino]
      ,[URLimagen]
  FROM [HOTEL]
    WHERE 
	(@IdHotel IS NULL OR IdHotel = @IdHotel);
END

GO
/****** Object:  StoredProcedure [dbo].[ObtenerPaquetePorId]    Script Date: 3/7/2024 18:51:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[ObtenerPaquetePorId]

@IdPaquete INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT  
        [IdPaquete],
        [cdgDestino],
        [NombrePaquete],
        [Descripcion],
        [PrecioPaquete],
        [mes],
        [Duracion],
        [TipoTransporte],
        URLimagen,
        Disponibilidad
    FROM 
        PAQUETE 
    WHERE 
	(@IdPaquete IS NULL OR IdPaquete = @IdPaquete);
END

GO
/****** Object:  StoredProcedure [dbo].[ObtenerReservaPorId]    Script Date: 3/7/2024 18:51:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Dorrego Facundo
-- Create date: 19/06/2024
-- Description:	Obtiene reserva por id.
-- =============================================
Create PROCEDURE  [dbo].[ObtenerReservaPorId]
@IdReserva INT = NULL
AS
BEGIN
	SET NOCOUNT ON;

SELECT [IdReserva]
      ,[DNI]
      ,[EstadoReserva]
      ,[IdPaquete]
      ,[Precio]
      
  FROM [RESERVA]
    WHERE 
	(@IdReserva IS NULL OR IdReserva = @IdReserva);

END



/****** Object:  StoredProcedure [dbo].[ObtenerUsuarioPorId]    Script Date: 19/06/2024 16:19:46 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[ObtenerUsuarioPorId]    Script Date: 3/7/2024 18:51:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Dorrego Facundo
-- Create date: 19/06/2024
-- Description:	Obtiene usuario por id.
-- =============================================
CREATE PROCEDURE  [dbo].[ObtenerUsuarioPorId]
@IdUsuario INT = NULL
AS
BEGIN
	SET NOCOUNT ON;

SELECT [IdUsuario]
      ,[DNI]
	  ,Nombre
	  ,CorreoElectronico
	  ,[Password]
	  ,Telefono
      
      
  FROM [USUARIOS]
    WHERE 
	(@IdUsuario IS NULL OR IdUsuario = @IdUsuario);

END

/****** Object:  StoredProcedure [dbo].[ObtenerDestinoPorId]    Script Date: 19/06/2024 16:19:46 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[SelDestinoCompleto]    Script Date: 3/7/2024 18:51:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Agustin Herrera
-- Create date: 06/06/2024
-- Description:	lista los destinos con todos sus detalles.
-- =============================================
CREATE PROCEDURE [dbo].[SelDestinoCompleto]

AS
BEGIN
	SELECT[IdDestino]
      ,[cdgDestino]
      ,[NombreDestino]
      ,[TipoTransporte]
      ,[PrecioTransporte]
  FROM [DESTINO]
END
GO
/****** Object:  StoredProcedure [dbo].[SelExcursionesCompleto]    Script Date: 3/7/2024 18:51:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Agustin Herrera
-- Create date: 06/06/2024
-- Description:	lista los paquetes con todos sus detalles.
-- =============================================
CREATE PROCEDURE  [dbo].[SelExcursionesCompleto]

AS
BEGIN
	SET NOCOUNT ON;

SELECT [IdExcursion]
      ,[cdgdestino]
      ,[Descripcion]
      ,[Precio]
      ,[CantidadPersonas]
      ,[Duracion]
	  ,[Nombre]
  FROM[EXCURSIONES]


END
GO
/****** Object:  StoredProcedure [dbo].[SelExcursionesPorDestino]    Script Date: 3/7/2024 18:51:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE  [dbo].[SelExcursionesPorDestino]
    @cdgDestino INT = NULL

AS
BEGIN
	SET NOCOUNT ON;

SELECT [IdExcursion]
      ,[cdgdestino]
      ,[Descripcion]
      ,[Precio]
      ,[CantidadPersonas]
      ,[Duracion]
	  ,[Nombre]
  FROM[EXCURSIONES]

  WHERE [cdgDestino] = @cdgDestino
END
GO
/****** Object:  StoredProcedure [dbo].[SelHotelCompleto]    Script Date: 3/7/2024 18:51:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Agustin Herrera
-- Create date: 06/06/2024
-- Description:	lista los paquetes con todos sus detalles.
-- =============================================
CREATE PROCEDURE  [dbo].[SelHotelCompleto]

AS
BEGIN
	SET NOCOUNT ON;
SELECT  [IdHotel]
      ,[NombreHotel]
      ,[Descripcion]
      ,[PrecioPorNoche]
      ,[cdgDestino]
	  , URLimagen
  FROM [HOTEL]


END
GO
/****** Object:  StoredProcedure [dbo].[SelHotelCompletoPorDestino]    Script Date: 3/7/2024 18:51:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Agustin Herrera
-- Create date: 06/06/2024
-- Description:	Trae hoteles por cdgdestino
-- =============================================
create PROCEDURE  [dbo].[SelHotelCompletoPorDestino]
@cdgDestino Int = null
 
AS
BEGIN
	SET NOCOUNT ON;
SELECT  [IdHotel]
      ,[NombreHotel]
      ,[Descripcion]
      ,[PrecioPorNoche]
      ,[cdgDestino]
	  , URLimagen
  FROM [HOTEL]
  where cdgDestino = @cdgDestino


END
GO
/****** Object:  StoredProcedure [dbo].[SelPaqueteCompleto]    Script Date: 3/7/2024 18:51:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE  [dbo].[SelPaqueteCompleto]

@TipoTransporte INT = NULL,
@Mes INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT  
        [IdPaquete],
        [cdgDestino],
        [NombrePaquete],
        [Descripcion],
        [PrecioPaquete],
        [mes],
        [Duracion],
        [TipoTransporte],
        URLimagen,
        Disponibilidad
    FROM 
        PAQUETE 
    WHERE 
        (@TipoTransporte IS NULL OR TipoTransporte = @TipoTransporte)
		AND (@Mes IS NULL OR mes = @Mes)
       
END

GO
/****** Object:  StoredProcedure [dbo].[SelReservaCompleto]    Script Date: 3/7/2024 18:51:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Agustin Herrera
-- Create date: 06/06/2024
-- Description:	lista los paquetes con todos sus detalles.
-- =============================================
CREATE PROCEDURE  [dbo].[SelReservaCompleto]

AS
BEGIN
	SET NOCOUNT ON;

SELECT [IdReserva]
      ,[DNI]
      ,[EstadoReserva]
      ,R.IdPaquete
      ,[Precio]
	  ,P.NombrePaquete
	  ,P.Descripcion
	  ,P.PrecioPaquete
	  ,P.Duracion
  FROM RESERVA R

  INNER JOIN PAQUETE P
  ON P.IdPaquete=R.IdPaquete

  --SELECT * FROM  PAQUETE
 -- SELECT * FROM RESERVA



END
GO
/****** Object:  StoredProcedure [dbo].[SelUsuarioCompleto]    Script Date: 3/7/2024 18:51:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Agustin Herrera
-- Create date: 06/06/2024
-- Description:	lista los usuarios con todos sus detalles.
-- =============================================
CREATE PROCEDURE  [dbo].[SelUsuarioCompleto]

AS
BEGIN
	SET NOCOUNT ON;

SELECT  [IdUsuario]
      ,[Nombre]
      ,[CorreoElectronico]
      ,[Password]
      ,[DNI]
      ,[Telefono]
	  ,[TipoUsuario]
  FROM USUARIOS


END

/****** Object:  StoredProcedure [dbo].[ObtenerReservaPorId]    Script Date: 19/06/2024 16:19:46 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[updPaquetes]    Script Date: 3/7/2024 18:51:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: Agustin herrera
-- Create date: 01/07/2024
-- Description:	updatea la tabla de paquetes..
-- =============================================
CREATE PROCEDURE [dbo].[updPaquetes]
@idPaquete int,
@cdgdestino int,
@NombrePaquete varchar(200),
@Descripcion varchar(400),
@precioPaquete money,
@Mes int,
@Duracion int,
@TipoTransporte int,
@URLImagen varchar(1000),
@Disponibilidad int
as 

update PAQUETE set cdgDestino = @cdgdestino, 
NombrePaquete = @NombrePaquete,
Descripcion = @Descripcion,
PrecioPaquete = @PrecioPaquete,
Mes = @Mes,
Duracion = @Duracion,
TipoTransporte = @TipoTransporte,
URLimagen = @URLImagen,
Disponibilidad = @Disponibilidad

where IdPaquete = @idPaquete
GO
USE [master]
GO
ALTER DATABASE [ATERRIZAR_COM] SET  READ_WRITE 
GO
