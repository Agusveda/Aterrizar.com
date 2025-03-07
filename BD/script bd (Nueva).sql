USE [master]
GO
/****** Object:  Database [ATERRIZAR_COM]    Script Date: 16/07/2024 20:12:03 ******/
CREATE DATABASE [ATERRIZAR_COM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ATERRIZAR_COM', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ATERRIZAR_COM.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ATERRIZAR_COM_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ATERRIZAR_COM_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
EXEC sys.sp_db_vardecimal_storage_format N'ATERRIZAR_COM', N'ON'
GO
ALTER DATABASE [ATERRIZAR_COM] SET QUERY_STORE = ON
GO
ALTER DATABASE [ATERRIZAR_COM] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ATERRIZAR_COM]
GO
/****** Object:  Table [dbo].[DESTINO]    Script Date: 16/07/2024 20:12:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DESTINO](
	[IdDestino] [int] IDENTITY(1,1) NOT NULL,
	[cdgDestino] [int] NOT NULL,
	[NombreDestino] [varchar](500) NOT NULL,
 CONSTRAINT [PK_DESTINO] PRIMARY KEY CLUSTERED 
(
	[IdDestino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EXCURSIONES]    Script Date: 16/07/2024 20:12:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EXCURSIONES](
	[IdExcursion] [int] IDENTITY(1,1) NOT NULL,
	[cdgdestino] [int] NOT NULL,
	[Descripcion] [varchar](200) NOT NULL,
	[Precio] [money] NOT NULL,
	[Duracion] [int] NULL,
	[Nombre] [varchar](50) NULL,
 CONSTRAINT [PK_EXCURSIONES] PRIMARY KEY CLUSTERED 
(
	[IdExcursion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FECHAS]    Script Date: 16/07/2024 20:12:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FECHAS](
	[IdFecha] [int] IDENTITY(1,1) NOT NULL,
	[IdMes] [int] NOT NULL,
	[FechaInicio] [date] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HOTEL]    Script Date: 16/07/2024 20:12:04 ******/
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
	[URLimagen] [varchar](5000) NULL,
 CONSTRAINT [PK_HOTEL] PRIMARY KEY CLUSTERED 
(
	[IdHotel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MES]    Script Date: 16/07/2024 20:12:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MES](
	[IdMes] [int] NOT NULL,
	[NombreMes] [nvarchar](50) NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_MES] PRIMARY KEY CLUSTERED 
(
	[IdMes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PAQUETE]    Script Date: 16/07/2024 20:12:04 ******/
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
/****** Object:  Table [dbo].[RelExcursionXreserva]    Script Date: 16/07/2024 20:12:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RelExcursionXreserva](
	[IdExcursion] [int] NULL,
	[IdReserva] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RelReservaXUsuario]    Script Date: 16/07/2024 20:12:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RelReservaXUsuario](
	[IdReserva] [int] NULL,
	[DniUsuario] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RESERVA]    Script Date: 16/07/2024 20:12:04 ******/
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
	[IdHotel] [int] NULL,
	[FechaInicio] [date] NULL,
 CONSTRAINT [PK_RESERVA_1] PRIMARY KEY CLUSTERED 
(
	[IdReserva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USUARIOS]    Script Date: 16/07/2024 20:12:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIOS](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[CorreoElectronico] [varchar](150) NOT NULL,
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

INSERT [dbo].[DESTINO] ([IdDestino], [cdgDestino], [NombreDestino]) VALUES (2, 1, N'Bariloche')
INSERT [dbo].[DESTINO] ([IdDestino], [cdgDestino], [NombreDestino]) VALUES (3, 2, N'Jujuy')
INSERT [dbo].[DESTINO] ([IdDestino], [cdgDestino], [NombreDestino]) VALUES (4, 3, N'Villa Carlos Paz')
INSERT [dbo].[DESTINO] ([IdDestino], [cdgDestino], [NombreDestino]) VALUES (5, 4, N'Cordoba')
SET IDENTITY_INSERT [dbo].[DESTINO] OFF
GO
SET IDENTITY_INSERT [dbo].[EXCURSIONES] ON 

INSERT [dbo].[EXCURSIONES] ([IdExcursion], [cdgdestino], [Descripcion], [Precio], [Duracion], [Nombre]) VALUES (1, 1, N'El Circuito Chico en Bariloche ofrece vistas espectaculares de la Patagonia, destacando lugares como Cerro Campanario y el Hotel Llao Llao.', 15000.0000, 4, N'Circuito Chico ')
INSERT [dbo].[EXCURSIONES] ([IdExcursion], [cdgdestino], [Descripcion], [Precio], [Duracion], [Nombre]) VALUES (2, 1, N'San Martín de los Andes es el punto de partida para la famosa excursión por los 7 lagos, un recorrido escénico que atraviesa paisajes espectaculares de lagos y montañas en la Patagonia argentina.', 15000.0000, 10, N'San Martín de los Andes ')
INSERT [dbo].[EXCURSIONES] ([IdExcursion], [cdgdestino], [Descripcion], [Precio], [Duracion], [Nombre]) VALUES (7, 1, N'Descubre la majestuosidad del Cerro Tronador y el Glaciar Ventisquero Negro. Desde la Ruta Nacional 40, bordeando los lagos Gutiérrez y Mascardi, llegarás a la base del imponente Cerro Tronador.', 25000.0000, 4, N'Cerro tronador')
INSERT [dbo].[EXCURSIONES] ([IdExcursion], [cdgdestino], [Descripcion], [Precio], [Duracion], [Nombre]) VALUES (8, 1, N'Descubre Bariloche: paisajes de película, lago cristalino, Bosque de Arrayanes. Navega a Quetrihue, conoce Arrayán centenario, visita isla Victoria y Puerto Anchorena. Disfruta del paisaje, ', 36000.0000, 4, N'Paseo en barco ')
INSERT [dbo].[EXCURSIONES] ([IdExcursion], [cdgdestino], [Descripcion], [Precio], [Duracion], [Nombre]) VALUES (10, 1, N'¡Vive la emoción de la nieve en Cerro López! Ascenso en 4x4, caminata con raquetas, pista de trineo, almuerzo de fondue de queso y merienda de fondue de chocolate', 15000.0000, 9, N'Refugio Extremo Encantado')
INSERT [dbo].[EXCURSIONES] ([IdExcursion], [cdgdestino], [Descripcion], [Precio], [Duracion], [Nombre]) VALUES (12, 2, N'Una vuelta en forma de "D" por unos paisajes increíbles llenos de vegetación y agua cristalina.', 4000.0000, 3, N'Circuito Yala - Reyes')
INSERT [dbo].[EXCURSIONES] ([IdExcursion], [cdgdestino], [Descripcion], [Precio], [Duracion], [Nombre]) VALUES (13, 2, N'Un bonito viaje cerca del cerro de 7 colores, el  camino de los colorados y las Salinas grandes.', 3000.0000, 3, N'Quebrada de puna')
INSERT [dbo].[EXCURSIONES] ([IdExcursion], [cdgdestino], [Descripcion], [Precio], [Duracion], [Nombre]) VALUES (14, 2, N'Paseo por la quebrada de Humahuaca.', 15000.0000, 6, N'Quebrada de humahuaca')
INSERT [dbo].[EXCURSIONES] ([IdExcursion], [cdgdestino], [Descripcion], [Precio], [Duracion], [Nombre]) VALUES (15, 2, N'Paseo en las afueras de la ciudad para disfrutar de la vista panorámica desde el Cristo de la Hermandad. Luego, visitamos la Casa de Gobierno y el Salón de la Bandera. ', 15000.0000, 6, N'City Tour Jujuy')
INSERT [dbo].[EXCURSIONES] ([IdExcursion], [cdgdestino], [Descripcion], [Precio], [Duracion], [Nombre]) VALUES (16, 3, N'Una Cabalgata Serrana de 1 hora por uno de los mejores cordones montañosos, entre vegetación tupida típica de la región, avistaje de aves y flora autóctona, disfrute de la verdadera naturaleza y respi', 4000.0000, 1, N'Cabalgata Serrana')
INSERT [dbo].[EXCURSIONES] ([IdExcursion], [cdgdestino], [Descripcion], [Precio], [Duracion], [Nombre]) VALUES (17, 3, N'En esta excursión conocerás la ciudad de la cerveza artesanal y el chocolate  “Villa General Belgrano”, ubicada en el Valle de Calamuchita. ', 4000.0000, 2, N'Tour medio dia')
INSERT [dbo].[EXCURSIONES] ([IdExcursion], [cdgdestino], [Descripcion], [Precio], [Duracion], [Nombre]) VALUES (18, 3, N'En esta excursión conocerás el camino de las Altas Cumbres y el Valle de Traslasierra (Mina Clavero + Villa Cura Brochero)', 15000.0000, 6, N'Mina Clavero')
INSERT [dbo].[EXCURSIONES] ([IdExcursion], [cdgdestino], [Descripcion], [Precio], [Duracion], [Nombre]) VALUES (19, 3, N'En esta excursión conocerás el camino de las Altas Cumbres, el Valle de Traslasierra (Mina Clavero ) y Los Túneles de Taninga. ', 15000.0000, 6, N'Valle de Traslasierra')
INSERT [dbo].[EXCURSIONES] ([IdExcursion], [cdgdestino], [Descripcion], [Precio], [Duracion], [Nombre]) VALUES (20, 4, N'Maravíllese ante los monumentos de La Cumbrecita, declarados Patrimonio de la Humanidad por la UNESCO', 4000.0000, 3, N' La Cumbrecita desde Córdoba')
INSERT [dbo].[EXCURSIONES] ([IdExcursion], [cdgdestino], [Descripcion], [Precio], [Duracion], [Nombre]) VALUES (21, 4, N'Realizamos un recorrido por los sitios mas destacados de la ciudad', 4000.0000, 3, N'City Tour Córdoba')
INSERT [dbo].[EXCURSIONES] ([IdExcursion], [cdgdestino], [Descripcion], [Precio], [Duracion], [Nombre]) VALUES (22, 4, N'Conozca los primeros años del icono revolucionario Che Guevara con una visita a la casa donde pasó su infancia en esta excursión de 4 horas a Alta Gracia desde Córdoba.', 15000.0000, 6, N'Alta Gracia desde Córdoba')
INSERT [dbo].[EXCURSIONES] ([IdExcursion], [cdgdestino], [Descripcion], [Precio], [Duracion], [Nombre]) VALUES (23, 4, N'Nuestro plan es experimentar un día diferente entre viñedos, victorias y los espectaculares paisajes de montañas, colinas y lagos, degustando excelentes vinos mientras disfruta de la deliciosa cocina ', 15000.0000, 6, N'Calamuchita')
SET IDENTITY_INSERT [dbo].[EXCURSIONES] OFF
GO
SET IDENTITY_INSERT [dbo].[FECHAS] ON 

INSERT [dbo].[FECHAS] ([IdFecha], [IdMes], [FechaInicio]) VALUES (1, 1, CAST(N'2024-07-10' AS Date))
INSERT [dbo].[FECHAS] ([IdFecha], [IdMes], [FechaInicio]) VALUES (2, 7, CAST(N'2024-07-20' AS Date))
INSERT [dbo].[FECHAS] ([IdFecha], [IdMes], [FechaInicio]) VALUES (3, 7, CAST(N'2024-07-24' AS Date))
INSERT [dbo].[FECHAS] ([IdFecha], [IdMes], [FechaInicio]) VALUES (4, 7, CAST(N'2024-07-30' AS Date))
INSERT [dbo].[FECHAS] ([IdFecha], [IdMes], [FechaInicio]) VALUES (9, 10, CAST(N'2024-10-30' AS Date))
INSERT [dbo].[FECHAS] ([IdFecha], [IdMes], [FechaInicio]) VALUES (10, 10, CAST(N'2024-10-15' AS Date))
INSERT [dbo].[FECHAS] ([IdFecha], [IdMes], [FechaInicio]) VALUES (11, 10, CAST(N'2024-10-24' AS Date))
INSERT [dbo].[FECHAS] ([IdFecha], [IdMes], [FechaInicio]) VALUES (12, 11, CAST(N'2024-11-30' AS Date))
INSERT [dbo].[FECHAS] ([IdFecha], [IdMes], [FechaInicio]) VALUES (13, 11, CAST(N'2024-11-15' AS Date))
INSERT [dbo].[FECHAS] ([IdFecha], [IdMes], [FechaInicio]) VALUES (14, 12, CAST(N'2024-12-24' AS Date))
INSERT [dbo].[FECHAS] ([IdFecha], [IdMes], [FechaInicio]) VALUES (15, 12, CAST(N'2024-12-30' AS Date))
SET IDENTITY_INSERT [dbo].[FECHAS] OFF
GO
SET IDENTITY_INSERT [dbo].[HOTEL] ON 

INSERT [dbo].[HOTEL] ([IdHotel], [NombreHotel], [Descripcion], [PrecioPorNoche], [cdgDestino], [URLimagen]) VALUES (1, N'Alma Del Lago Suites', N'Ubicado frente al Lago Nahuel Huapi, en Bariloche', 169103.0000, 1, N'https://alma-del-lago.hotelesenpatagonia.com/data/Photos/OriginalPhoto/7486/748656/748656929.JPEG')
INSERT [dbo].[HOTEL] ([IdHotel], [NombreHotel], [Descripcion], [PrecioPorNoche], [cdgDestino], [URLimagen]) VALUES (2, N'Villa Huapi', N'Situado en frente del lago Nahuel Huapi, en Dina Huapi', 81600.0000, 1, N'https://cf.bstatic.com/xdata/images/hotel/max1024x768/92998290.jpg?k=17a4a438ad335c96bf5563d74d017efaf81fbfcfa761722012404fae3f57c195&o=&hp=1')
INSERT [dbo].[HOTEL] ([IdHotel], [NombreHotel], [Descripcion], [PrecioPorNoche], [cdgDestino], [URLimagen]) VALUES (4, N'Hotel Concorde', N'El Hotel Concorde se encuentra en San Carlos de Bariloche,', 70000.0000, 1, N'https://www.barilochehoy.com/wp-content/uploads/2023/12/hotel-concorde-en-bariloche-rio-negro-argentina.jpg')
INSERT [dbo].[HOTEL] ([IdHotel], [NombreHotel], [Descripcion], [PrecioPorNoche], [cdgDestino], [URLimagen]) VALUES (8, N'Altos de la Viña', N'El Hotel Altos de la Viña cuenta con pileta, centro de fitness y restaurante. Se encuentra en San Salvador de Jujuy.', 185000.0000, 2, N'https://turismo.uejn.org.ar/wp-content/uploads/2021/01/Hotel-Altos-de-la-Vin%CC%83a.jpg_0009_Captura-de-Pantalla-2021-01-11-a-las-11.18.00.jpg')
INSERT [dbo].[HOTEL] ([IdHotel], [NombreHotel], [Descripcion], [PrecioPorNoche], [cdgDestino], [URLimagen]) VALUES (9, N'Munay jujuy', N'Este hotel sencillo, ubicado entre tiendas y restaurantes, se encuentra a 9 minutos a pie del Museo Arqueológico Provincial.', 170000.0000, 2, N'https://munay-4600.hotelesenjujuy.com/data/Images/OriginalPhoto/5140/514040/514040187/image-san-salvador-de-jujuy-munay-hotel-4600-20.JPEG')
INSERT [dbo].[HOTEL] ([IdHotel], [NombreHotel], [Descripcion], [PrecioPorNoche], [cdgDestino], [URLimagen]) VALUES (10, N'Howard Johnson by Wyndham Plaza Jujuy', N'Este hotel tranquilo con fachada de cristal y ladrillo está a 9 minutos a pie de la catedral de San Salvador de Jujuy', 250000.0000, 2, N'https://copaipa.org.ar/wp-content/uploads/2016/01/HJPLAZAJUJUY.jpg')
INSERT [dbo].[HOTEL] ([IdHotel], [NombreHotel], [Descripcion], [PrecioPorNoche], [cdgDestino], [URLimagen]) VALUES (12, N'Hotel Posada Sol', N'Hotel Posada Sol es un alojamiento de 1 estrella que se encuentra en Villa Carlos Paz, a 6 min a pie de Ayuntamiento, y que dispone de terraza.', 20000.0000, 3, N'https://hotel-posada-sol.hotels-villa-carlos-paz.com/data/Images/OriginalPhoto/13034/1303420/1303420195/image-villa-carlos-paz-1.JPEG')
INSERT [dbo].[HOTEL] ([IdHotel], [NombreHotel], [Descripcion], [PrecioPorNoche], [cdgDestino], [URLimagen]) VALUES (13, N'Gran Lourdes Hotel by CPH', N'Gran Lourdes Hotel by CPH dispone de alojamiento en Villa Carlos Paz, cerca de Reloj Cucú y de Ayuntamiento.', 24000.0000, 3, N'https://gran-lourdes-5152.hotels-villa-carlos-paz.com/data/Images/OriginalPhoto/10838/1083853/1083853417/image-villa-carlos-paz-gran-lourdes-35.JPEG')
INSERT [dbo].[HOTEL] ([IdHotel], [NombreHotel], [Descripcion], [PrecioPorNoche], [cdgDestino], [URLimagen]) VALUES (14, N'Savannah Cordoba Hotel', N'El Savannah Cordoba Hotel está situado a sólo 700 metros de la plaza San Martín. ', 19000.0000, 4, N'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/05/e5/fa/64/frente.jpg')
INSERT [dbo].[HOTEL] ([IdHotel], [NombreHotel], [Descripcion], [PrecioPorNoche], [cdgDestino], [URLimagen]) VALUES (15, N'Posada Alpenrose Neu', N'La Posada Alpenrose Neu se encuentra en Villa Carlos Paz y ofrece piscina exterior y habitaciones con aire acondicionado.', 22000.0000, 3, N'https://cdn.discordapp.com/attachments/1225954536632352788/1262856280469409882/176000038.jpg?ex=66981e0f&is=6696cc8f&hm=e025ff3f5a734ac43a1a3372200affbf0ed218f70d6f807ae6d1087feb1bb3c7&')
INSERT [dbo].[HOTEL] ([IdHotel], [NombreHotel], [Descripcion], [PrecioPorNoche], [cdgDestino], [URLimagen]) VALUES (16, N'Cordoba Yolanda Hotel', N'El Cordoba Yolanda Hotel ofrece habitaciones con WiFi gratuita y TV por cable en Córdoba, a solo 800 metros del centro de la ciudad.', 33000.0000, 4, N'https://cdn.discordapp.com/attachments/1225954536632352788/1262857223298875505/13196273.jpg?ex=66981ef0&is=6696cd70&hm=95848beb7d43b9fd0ed6c2669888b761f0d3afe846bf3940891b0d9b806c48c6&')
INSERT [dbo].[HOTEL] ([IdHotel], [NombreHotel], [Descripcion], [PrecioPorNoche], [cdgDestino], [URLimagen]) VALUES (17, N'Hotel Riviera', N'Hotel Riviera ofrece habitaciones en Córdoba, cerca de Centro cívico de Córdoba y de Catedral de Córdoba.', 42000.0000, 4, N'https://media.discordapp.net/attachments/1225954536632352788/1262857757548220488/278872063.jpg?ex=66981f70&is=6696cdf0&hm=33fec87b15ca60ce2edd7c6885daa8eb0dd4c95955f3268474d33e355ba7c88f&=&format=webp')
SET IDENTITY_INSERT [dbo].[HOTEL] OFF
GO
INSERT [dbo].[MES] ([IdMes], [NombreMes], [Activo]) VALUES (1, N'ENERO', 0)
INSERT [dbo].[MES] ([IdMes], [NombreMes], [Activo]) VALUES (2, N'FEBRERO', 0)
INSERT [dbo].[MES] ([IdMes], [NombreMes], [Activo]) VALUES (3, N'MARZO', 0)
INSERT [dbo].[MES] ([IdMes], [NombreMes], [Activo]) VALUES (4, N'ABRIL', 0)
INSERT [dbo].[MES] ([IdMes], [NombreMes], [Activo]) VALUES (5, N'MAYO', 0)
INSERT [dbo].[MES] ([IdMes], [NombreMes], [Activo]) VALUES (6, N'JUNIO', 0)
INSERT [dbo].[MES] ([IdMes], [NombreMes], [Activo]) VALUES (7, N'JULIO', 1)
INSERT [dbo].[MES] ([IdMes], [NombreMes], [Activo]) VALUES (8, N'AGOSTO', 0)
INSERT [dbo].[MES] ([IdMes], [NombreMes], [Activo]) VALUES (9, N'SEPTIEMBRE', 0)
INSERT [dbo].[MES] ([IdMes], [NombreMes], [Activo]) VALUES (10, N'OCTUBRE', 1)
INSERT [dbo].[MES] ([IdMes], [NombreMes], [Activo]) VALUES (11, N'NOVIEMBRE', 1)
INSERT [dbo].[MES] ([IdMes], [NombreMes], [Activo]) VALUES (12, N'DICIEMBRE', 1)
GO
SET IDENTITY_INSERT [dbo].[PAQUETE] ON 

INSERT [dbo].[PAQUETE] ([IdPaquete], [cdgDestino], [NombrePaquete], [Descripcion], [PrecioPaquete], [Mes], [Duracion], [TipoTransporte], [URLimagen], [Disponibilidad]) VALUES (2, 1, N'Nieve en Bariloche', N'Podras disfrutar la nieve en bariloche con el mejor hotel recomendado', 400000.0000, 7, 7, 1, N'https://www.shutterstock.com/image-photo/argentina-patagonia-bariloche-island-isla-600nw-2240573477.jpg', 100)
INSERT [dbo].[PAQUETE] ([IdPaquete], [cdgDestino], [NombrePaquete], [Descripcion], [PrecioPaquete], [Mes], [Duracion], [TipoTransporte], [URLimagen], [Disponibilidad]) VALUES (3, 1, N'Bariloche low cost', N'Disfruta bariloche de una manera mas barata y accesible', 180000.0000, 7, 4, 2, N'https://www.interpatagonia.com/bariloche/imagenes/sanbernardo2.jpg', 100)
INSERT [dbo].[PAQUETE] ([IdPaquete], [cdgDestino], [NombrePaquete], [Descripcion], [PrecioPaquete], [Mes], [Duracion], [TipoTransporte], [URLimagen], [Disponibilidad]) VALUES (5, 2, N'Jujuy Maravilloso', N'Descubre la belleza de la Quebrada de Humahuaca y la cultura local en un viaje inolvidable.', 300000.0000, 7, 7, 1, N'https://media.istockphoto.com/id/1303686899/es/foto/paisaje-de-colores-en-purmamarca-jujuy-argentina.jpg?s=612x612&w=0&k=20&c=wQtVfID95eoE-w4o6TK_pe0JdplKmWGFEkLd2uyLgPE=', 100)
INSERT [dbo].[PAQUETE] ([IdPaquete], [cdgDestino], [NombrePaquete], [Descripcion], [PrecioPaquete], [Mes], [Duracion], [TipoTransporte], [URLimagen], [Disponibilidad]) VALUES (6, 2, N'Aventura en Jujuy', N'Explora los paisajes únicos de Salinas Grandes y las coloridas montañas de Purmamarca.', 150000.0000, 7, 4, 2, N'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Cerro_de_los_siete_colores.JPG/800px-Cerro_de_los_siete_colores.JPG', 100)
INSERT [dbo].[PAQUETE] ([IdPaquete], [cdgDestino], [NombrePaquete], [Descripcion], [PrecioPaquete], [Mes], [Duracion], [TipoTransporte], [URLimagen], [Disponibilidad]) VALUES (9, 3, N'Encanto de Villa Carlos Paz', N'Disfruta de las espectaculares vistas del lago San Roque y de la vibrante vida nocturna local.', 355000.0000, 7, 7, 1, N'https://regionobjetivo.com.ar/download/multimedia.normal.8c6176f4af854e89.524547494f4e204f424a455449564f20464f544f2056494c4c41204341524c4f5f6e6f726d616c2e77656270.webp', 100)
INSERT [dbo].[PAQUETE] ([IdPaquete], [cdgDestino], [NombrePaquete], [Descripcion], [PrecioPaquete], [Mes], [Duracion], [TipoTransporte], [URLimagen], [Disponibilidad]) VALUES (11, 4, N'Relax en Cordoba Capital', N'Descubre los atractivos turísticos de esta encantadora ciudad', 173000.0000, 7, 4, 1, N'https://www.elciudadanoweb.com/wp-content/uploads/2024/01/carlospaz.jpg', 100)
INSERT [dbo].[PAQUETE] ([IdPaquete], [cdgDestino], [NombrePaquete], [Descripcion], [PrecioPaquete], [Mes], [Duracion], [TipoTransporte], [URLimagen], [Disponibilidad]) VALUES (16, 1, N'Nieve en Bariloche', N'Podras disfrutar la nieve en bariloche con el mejor hotel recomendado', 400000.0000, 10, 7, 1, N'https://www.shutterstock.com/image-photo/argentina-patagonia-bariloche-island-isla-600nw-2240573477.jpg', 100)
INSERT [dbo].[PAQUETE] ([IdPaquete], [cdgDestino], [NombrePaquete], [Descripcion], [PrecioPaquete], [Mes], [Duracion], [TipoTransporte], [URLimagen], [Disponibilidad]) VALUES (17, 1, N'Bariloche low cost', N'Disfruta bariloche de una manera mas barata y accesible', 180000.0000, 10, 4, 2, N'https://www.interpatagonia.com/bariloche/imagenes/sanbernardo2.jpg', 100)
INSERT [dbo].[PAQUETE] ([IdPaquete], [cdgDestino], [NombrePaquete], [Descripcion], [PrecioPaquete], [Mes], [Duracion], [TipoTransporte], [URLimagen], [Disponibilidad]) VALUES (18, 2, N'Jujuy Maravilloso', N'Descubre la belleza de la Quebrada de Humahuaca y la cultura local en un viaje inolvidable.', 300000.0000, 10, 7, 1, N'https://media.istockphoto.com/id/1303686899/es/foto/paisaje-de-colores-en-purmamarca-jujuy-argentina.jpg?s=612x612&w=0&k=20&c=wQtVfID95eoE-w4o6TK_pe0JdplKmWGFEkLd2uyLgPE=', 100)
INSERT [dbo].[PAQUETE] ([IdPaquete], [cdgDestino], [NombrePaquete], [Descripcion], [PrecioPaquete], [Mes], [Duracion], [TipoTransporte], [URLimagen], [Disponibilidad]) VALUES (19, 2, N'Aventura en Jujuy', N'Explora los paisajes únicos de Salinas Grandes y las coloridas montañas de Purmamarca.', 150000.0000, 10, 4, 2, N'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Cerro_de_los_siete_colores.JPG/800px-Cerro_de_los_siete_colores.JPG', 100)
INSERT [dbo].[PAQUETE] ([IdPaquete], [cdgDestino], [NombrePaquete], [Descripcion], [PrecioPaquete], [Mes], [Duracion], [TipoTransporte], [URLimagen], [Disponibilidad]) VALUES (20, 3, N'Encanto de Villa Carlos Paz', N'Disfruta de las espectaculares vistas del lago San Roque y de la vibrante vida nocturna local.', 355000.0000, 10, 7, 1, N'https://regionobjetivo.com.ar/download/multimedia.normal.8c6176f4af854e89.524547494f4e204f424a455449564f20464f544f2056494c4c41204341524c4f5f6e6f726d616c2e77656270.webp', 100)
INSERT [dbo].[PAQUETE] ([IdPaquete], [cdgDestino], [NombrePaquete], [Descripcion], [PrecioPaquete], [Mes], [Duracion], [TipoTransporte], [URLimagen], [Disponibilidad]) VALUES (21, 4, N'Relax en Cordoba Capital', N'Descubre los atractivos turísticos de esta encantadora ciudad', 173000.0000, 10, 4, 1, N'https://www.elciudadanoweb.com/wp-content/uploads/2024/01/carlospaz.jpg', 100)
INSERT [dbo].[PAQUETE] ([IdPaquete], [cdgDestino], [NombrePaquete], [Descripcion], [PrecioPaquete], [Mes], [Duracion], [TipoTransporte], [URLimagen], [Disponibilidad]) VALUES (22, 1, N'Nieve en Bariloche', N'Podras disfrutar la nieve en bariloche con el mejor hotel recomendado', 400000.0000, 11, 7, 1, N'https://www.shutterstock.com/image-photo/argentina-patagonia-bariloche-island-isla-600nw-2240573477.jpg', 100)
INSERT [dbo].[PAQUETE] ([IdPaquete], [cdgDestino], [NombrePaquete], [Descripcion], [PrecioPaquete], [Mes], [Duracion], [TipoTransporte], [URLimagen], [Disponibilidad]) VALUES (23, 1, N'Bariloche low cost', N'Disfruta bariloche de una manera mas barata y accesible', 180000.0000, 11, 4, 2, N'https://www.interpatagonia.com/bariloche/imagenes/sanbernardo2.jpg', 100)
INSERT [dbo].[PAQUETE] ([IdPaquete], [cdgDestino], [NombrePaquete], [Descripcion], [PrecioPaquete], [Mes], [Duracion], [TipoTransporte], [URLimagen], [Disponibilidad]) VALUES (24, 2, N'Jujuy Maravilloso', N'Descubre la belleza de la Quebrada de Humahuaca y la cultura local en un viaje inolvidable.', 300000.0000, 11, 7, 1, N'https://media.istockphoto.com/id/1303686899/es/foto/paisaje-de-colores-en-purmamarca-jujuy-argentina.jpg?s=612x612&w=0&k=20&c=wQtVfID95eoE-w4o6TK_pe0JdplKmWGFEkLd2uyLgPE=', 100)
INSERT [dbo].[PAQUETE] ([IdPaquete], [cdgDestino], [NombrePaquete], [Descripcion], [PrecioPaquete], [Mes], [Duracion], [TipoTransporte], [URLimagen], [Disponibilidad]) VALUES (25, 2, N'Aventura en Jujuy', N'Explora los paisajes únicos de Salinas Grandes y las coloridas montañas de Purmamarca.', 150000.0000, 11, 4, 2, N'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Cerro_de_los_siete_colores.JPG/800px-Cerro_de_los_siete_colores.JPG', 100)
INSERT [dbo].[PAQUETE] ([IdPaquete], [cdgDestino], [NombrePaquete], [Descripcion], [PrecioPaquete], [Mes], [Duracion], [TipoTransporte], [URLimagen], [Disponibilidad]) VALUES (26, 3, N'Encanto de Villa Carlos Paz', N'Disfruta de las espectaculares vistas del lago San Roque y de la vibrante vida nocturna local.', 355000.0000, 11, 7, 1, N'https://regionobjetivo.com.ar/download/multimedia.normal.8c6176f4af854e89.524547494f4e204f424a455449564f20464f544f2056494c4c41204341524c4f5f6e6f726d616c2e77656270.webp', 100)
INSERT [dbo].[PAQUETE] ([IdPaquete], [cdgDestino], [NombrePaquete], [Descripcion], [PrecioPaquete], [Mes], [Duracion], [TipoTransporte], [URLimagen], [Disponibilidad]) VALUES (27, 4, N'Relax en Cordoba Capital', N'Descubre los atractivos turísticos de esta encantadora ciudad', 173000.0000, 11, 4, 1, N'https://www.elciudadanoweb.com/wp-content/uploads/2024/01/carlospaz.jpg', 100)
INSERT [dbo].[PAQUETE] ([IdPaquete], [cdgDestino], [NombrePaquete], [Descripcion], [PrecioPaquete], [Mes], [Duracion], [TipoTransporte], [URLimagen], [Disponibilidad]) VALUES (28, 1, N'Nieve en Bariloche', N'Podras disfrutar la nieve en bariloche con el mejor hotel recomendado', 400000.0000, 12, 7, 1, N'https://www.shutterstock.com/image-photo/argentina-patagonia-bariloche-island-isla-600nw-2240573477.jpg', 100)
INSERT [dbo].[PAQUETE] ([IdPaquete], [cdgDestino], [NombrePaquete], [Descripcion], [PrecioPaquete], [Mes], [Duracion], [TipoTransporte], [URLimagen], [Disponibilidad]) VALUES (29, 1, N'Bariloche low cost', N'Disfruta bariloche de una manera mas barata y accesible', 180000.0000, 12, 4, 2, N'https://www.interpatagonia.com/bariloche/imagenes/sanbernardo2.jpg', 100)
INSERT [dbo].[PAQUETE] ([IdPaquete], [cdgDestino], [NombrePaquete], [Descripcion], [PrecioPaquete], [Mes], [Duracion], [TipoTransporte], [URLimagen], [Disponibilidad]) VALUES (30, 2, N'Jujuy Maravilloso', N'Descubre la belleza de la Quebrada de Humahuaca y la cultura local en un viaje inolvidable.', 300000.0000, 12, 7, 1, N'https://media.istockphoto.com/id/1303686899/es/foto/paisaje-de-colores-en-purmamarca-jujuy-argentina.jpg?s=612x612&w=0&k=20&c=wQtVfID95eoE-w4o6TK_pe0JdplKmWGFEkLd2uyLgPE=', 100)
INSERT [dbo].[PAQUETE] ([IdPaquete], [cdgDestino], [NombrePaquete], [Descripcion], [PrecioPaquete], [Mes], [Duracion], [TipoTransporte], [URLimagen], [Disponibilidad]) VALUES (31, 2, N'Aventura en Jujuy', N'Explora los paisajes únicos de Salinas Grandes y las coloridas montañas de Purmamarca.', 150000.0000, 12, 4, 2, N'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3c/Cerro_de_los_siete_colores.JPG/800px-Cerro_de_los_siete_colores.JPG', 100)
INSERT [dbo].[PAQUETE] ([IdPaquete], [cdgDestino], [NombrePaquete], [Descripcion], [PrecioPaquete], [Mes], [Duracion], [TipoTransporte], [URLimagen], [Disponibilidad]) VALUES (32, 3, N'Encanto de Villa Carlos Paz', N'Disfruta de las espectaculares vistas del lago San Roque y de la vibrante vida nocturna local.', 355000.0000, 12, 7, 1, N'https://regionobjetivo.com.ar/download/multimedia.normal.8c6176f4af854e89.524547494f4e204f424a455449564f20464f544f2056494c4c41204341524c4f5f6e6f726d616c2e77656270.webp', 100)
INSERT [dbo].[PAQUETE] ([IdPaquete], [cdgDestino], [NombrePaquete], [Descripcion], [PrecioPaquete], [Mes], [Duracion], [TipoTransporte], [URLimagen], [Disponibilidad]) VALUES (33, 4, N'Relax en Cordoba Capital', N'Descubre los atractivos turísticos de esta encantadora ciudad', 173000.0000, 12, 4, 1, N'https://www.elciudadanoweb.com/wp-content/uploads/2024/01/carlospaz.jpg', 100)
SET IDENTITY_INSERT [dbo].[PAQUETE] OFF
GO
INSERT [dbo].[RelExcursionXreserva] ([IdExcursion], [IdReserva]) VALUES (2, 11)
INSERT [dbo].[RelExcursionXreserva] ([IdExcursion], [IdReserva]) VALUES (10, 11)
INSERT [dbo].[RelExcursionXreserva] ([IdExcursion], [IdReserva]) VALUES (2, 9)
INSERT [dbo].[RelExcursionXreserva] ([IdExcursion], [IdReserva]) VALUES (10, 9)
INSERT [dbo].[RelExcursionXreserva] ([IdExcursion], [IdReserva]) VALUES (2, 12)
INSERT [dbo].[RelExcursionXreserva] ([IdExcursion], [IdReserva]) VALUES (10, 12)
GO
INSERT [dbo].[RelReservaXUsuario] ([IdReserva], [DniUsuario]) VALUES (1, 11223344)
INSERT [dbo].[RelReservaXUsuario] ([IdReserva], [DniUsuario]) VALUES (1, 1234123)
INSERT [dbo].[RelReservaXUsuario] ([IdReserva], [DniUsuario]) VALUES (9, 12341)
INSERT [dbo].[RelReservaXUsuario] ([IdReserva], [DniUsuario]) VALUES (11, 11223344)
INSERT [dbo].[RelReservaXUsuario] ([IdReserva], [DniUsuario]) VALUES (10, 12341)
INSERT [dbo].[RelReservaXUsuario] ([IdReserva], [DniUsuario]) VALUES (10, 11223344)
INSERT [dbo].[RelReservaXUsuario] ([IdReserva], [DniUsuario]) VALUES (12, 441)
GO
SET IDENTITY_INSERT [dbo].[RESERVA] ON 

INSERT [dbo].[RESERVA] ([IdReserva], [DNI], [EstadoReserva], [IdPaquete], [Precio], [IdHotel], [FechaInicio]) VALUES (9, 12341, 0, 2, 1583721.0000, 1, CAST(N'2024-07-24' AS Date))
INSERT [dbo].[RESERVA] ([IdReserva], [DNI], [EstadoReserva], [IdPaquete], [Precio], [IdHotel], [FechaInicio]) VALUES (10, 12341, 0, 2, 1598721.0000, 1, CAST(N'2024-07-15' AS Date))
INSERT [dbo].[RESERVA] ([IdReserva], [DNI], [EstadoReserva], [IdPaquete], [Precio], [IdHotel], [FechaInicio]) VALUES (11, 11223344, 0, 2, 920000.0000, 4, CAST(N'2024-07-24' AS Date))
INSERT [dbo].[RESERVA] ([IdReserva], [DNI], [EstadoReserva], [IdPaquete], [Precio], [IdHotel], [FechaInicio]) VALUES (12, 441, 1, 2, 1613721.0000, 1, CAST(N'2024-07-24' AS Date))
SET IDENTITY_INSERT [dbo].[RESERVA] OFF
GO
SET IDENTITY_INSERT [dbo].[USUARIOS] ON 

INSERT [dbo].[USUARIOS] ([IdUsuario], [Nombre], [CorreoElectronico], [DNI], [Telefono], [TipoUsuario]) VALUES (1, N'Agustin', N'Agusveda110303@gmail.com', 11223344, N'1123640290', 1)
INSERT [dbo].[USUARIOS] ([IdUsuario], [Nombre], [CorreoElectronico], [DNI], [Telefono], [TipoUsuario]) VALUES (2, N'Andres', N'andriuwSlanplay@yajo.am', 12341, N'1234512', 1)
INSERT [dbo].[USUARIOS] ([IdUsuario], [Nombre], [CorreoElectronico], [DNI], [Telefono], [TipoUsuario]) VALUES (5, N'Admin', N'raul@hotmail.com', 319723, N'121213', 2)
INSERT [dbo].[USUARIOS] ([IdUsuario], [Nombre], [CorreoElectronico], [DNI], [Telefono], [TipoUsuario]) VALUES (6, N'Prueba', N'prueba@chemail.com', 12341, N'55501054', 1)
INSERT [dbo].[USUARIOS] ([IdUsuario], [Nombre], [CorreoElectronico], [DNI], [Telefono], [TipoUsuario]) VALUES (21, N'Agustins', N'agu3@gmail.com', 44332211, N'1123640290', 1)
INSERT [dbo].[USUARIOS] ([IdUsuario], [Nombre], [CorreoElectronico], [DNI], [Telefono], [TipoUsuario]) VALUES (22, N'facu', N'facucrax@gmail.com', 441, N'', 1)
INSERT [dbo].[USUARIOS] ([IdUsuario], [Nombre], [CorreoElectronico], [DNI], [Telefono], [TipoUsuario]) VALUES (23, N'facu', N'asdasd@gmail.com', 111, N'12312', 1)
SET IDENTITY_INSERT [dbo].[USUARIOS] OFF
GO
/****** Object:  StoredProcedure [dbo].[Del_Destino]    Script Date: 16/07/2024 20:12:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[Del_Destino]
    @IdDestino INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM DESTINO
    WHERE IdDestino = @IdDestino;
END;
GO
/****** Object:  StoredProcedure [dbo].[DelExcursiones]    Script Date: 16/07/2024 20:12:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:    agustin herrera
-- Create date: 10/07/2024
-- Description:    Borra excursiones
-- =============================================
create PROCEDURE  [dbo].[DelExcursiones]

@IdExcursiones  INT = NULL

AS
BEGIN
    SET NOCOUNT ON;

    Delete 

    FROM 
        EXCURSIONES
    WHERE 
        @IdExcursiones  = IdExcursion

END
GO
/****** Object:  StoredProcedure [dbo].[DelHotel]    Script Date: 16/07/2024 20:12:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:    agustin herrera
-- Create date: 03/07/2024
-- Description:    Borrar hotel
-- =============================================
create PROCEDURE  [dbo].[DelHotel]

@IdHotel  INT = NULL

AS
BEGIN
    SET NOCOUNT ON;

    Delete 

    FROM 
        HOTEL
    WHERE 
        @IdHotel  = IdHotel

END
GO
/****** Object:  StoredProcedure [dbo].[DelPaquete]    Script Date: 16/07/2024 20:12:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
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
        @IdPaquete  = IdPaquete

END
GO
/****** Object:  StoredProcedure [dbo].[insDestino]    Script Date: 16/07/2024 20:12:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Agustin Herrera
-- Create date: 19/06/2024
-- Description:	ingresa un nuevo Destino a la tabla..
-- =============================================
CREATE PROCEDURE  [dbo].[insDestino]

@cdgDestino int,
@NombreDestino varchar(500)
AS
BEGIN


INSERT INTO DESTINO	
           (cdgDestino,NombreDestino)
     VALUES
	 (@cdgDestino,@NombreDestino)
END



/****** Object:  StoredProcedure [dbo].[ObtenerUsuarioPorId]    Script Date: 19/06/2024 16:19:46 ******/
GO
/****** Object:  StoredProcedure [dbo].[insExcursiones]    Script Date: 16/07/2024 20:12:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Agustin Herrera
-- Create date: 19/06/2024
-- Description:	ingresa un nuevo excursion a la tabla..
-- =============================================
CREATE PROCEDURE  [dbo].[insExcursiones]

@cdgDestino int,
@Descripcion varchar(200),
@Precio money,
@Duracion int,
@Nombre varchar(50)
AS
BEGIN
	SET NOCOUNT ON;


INSERT INTO EXCURSIONES	
           (cdgdestino,Descripcion,Precio,Duracion,Nombre)
     VALUES
	 (@cdgdestino,@Descripcion,@Precio,@Duracion,@Nombre)
END



/****** Object:  StoredProcedure [dbo].[ObtenerUsuarioPorId]    Script Date: 19/06/2024 16:19:46 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[insHotel]    Script Date: 16/07/2024 20:12:04 ******/
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
/****** Object:  StoredProcedure [dbo].[insPaquete]    Script Date: 16/07/2024 20:12:04 ******/
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
/****** Object:  StoredProcedure [dbo].[insRelExcursionXreserva]    Script Date: 16/07/2024 20:12:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Agustin Herrera
-- Create date: 16/07/2024
-- Description:	ingresa la relacion de el id de reserva y la excursion adicional seleccionada
-- =============================================
create PROCEDURE  [dbo].[insRelExcursionXreserva]	
@IdExcursion int,
@IdReserva int 
AS
BEGIN
	SET NOCOUNT ON;


INSERT INTO RelExcursionXreserva	
           (IdExcursion, IdReserva)
     VALUES
	 (@IdExcursion, @IdReserva)
END



/****** Object:  StoredProcedure [dbo].[ObtenerUsuarioPorId]    Script Date: 19/06/2024 16:19:46 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[insRelReservaXUsuario]    Script Date: 16/07/2024 20:12:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Agustin Herrera
-- Create date: 16/07/2024
-- Description:	ingresa la relacion de el id de reserva y el dni de usuario para poder asignar mas de un idreserva a usuarios
-- =============================================
create PROCEDURE  [dbo].[insRelReservaXUsuario]	

@IdReserva int ,
@DniUsuario int
AS
BEGIN
	SET NOCOUNT ON;


INSERT INTO RelReservaXUsuario	
           (IdReserva,DniUsuario)
     VALUES
	 (@IdReserva, @DniUsuario)
END



/****** Object:  StoredProcedure [dbo].[ObtenerUsuarioPorId]    Script Date: 19/06/2024 16:19:46 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[insReserva]    Script Date: 16/07/2024 20:12:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Agustin Herrera
-- Create date: 19/06/2024
-- Description:	ingresa un nuevo Reserva  a la tabla..
-- =============================================
CREATE PROCEDURE  [dbo].[insReserva] 

@DNI int,
@EstadoReserva int,
@IdPaquete int,
@IdHotel int,
@Precio money,
@FechaInicio date
AS
BEGIN
	SET NOCOUNT ON;


INSERT INTO RESERVA	
           (DNI,EstadoReserva,IdPaquete,Precio,IdHotel,FechaInicio)
     VALUES
	 (@DNI,@EstadoReserva,@IdPaquete,@Precio,@IdHotel,@FechaInicio)
END



/****** Object:  StoredProcedure [dbo].[ObtenerUsuarioPorId]    Script Date: 19/06/2024 16:19:46 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[insUsuario]    Script Date: 16/07/2024 20:12:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[insUsuario] 
@Nombre varchar(50),
@CorreoElectronico varchar(150),

@DNI int,
@Telefono varchar(50),
@TipoUsuario int
AS
BEGIN
	SET NOCOUNT ON;


INSERT INTO USUARIOS	
           (Nombre,CorreoElectronico,DNI,Telefono,TipoUsuario)
     VALUES
	 (@Nombre,@CorreoElectronico,@DNI,@Telefono,@TipoUsuario)
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerDestinoPorcdgDestino]    Script Date: 16/07/2024 20:12:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Agustin Herrera
-- Create date: 30/06/2024
-- Description:	Obtiene destino por cdgDestino.
-- =============================================
CREATE PROCEDURE  [dbo].[ObtenerDestinoPorcdgDestino]
@cdgDestino INT = NULL
AS
BEGIN
	SET NOCOUNT ON;

SELECT [IdDestino]
      ,[cdgDestino]
	  ,NombreDestino
	  
	 
      
      
  FROM [DESTINO]
    WHERE 
	cdgDestino = @cdgDestino

END

GO
/****** Object:  StoredProcedure [dbo].[ObtenerDestinoPorId]    Script Date: 16/07/2024 20:12:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Dorrego Facundo
-- Create date: 19/06/2024
-- Description:	Obtiene destino por id.
-- =============================================
CREATE PROCEDURE  [dbo].[ObtenerDestinoPorId]
@IdDestino INT = NULL
AS
BEGIN
	SET NOCOUNT ON;

SELECT [IdDestino]
      ,[cdgDestino]
	  ,NombreDestino
	
	 
      
      
  FROM [DESTINO]
    WHERE 
	(@IdDestino IS NULL OR IdDestino = @IdDestino);

END

GO
/****** Object:  StoredProcedure [dbo].[ObtenerExcursionesIncluidas]    Script Date: 16/07/2024 20:12:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[ObtenerExcursionesIncluidas]
@cdgDestino INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT [IdExcursion]
          ,[cdgDestino]
          ,[Nombre]
          ,[Duracion]
    FROM [EXCURSIONES]
    WHERE cdgDestino = @cdgDestino
      AND Duracion < 5
END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerExcursionesPorId]    Script Date: 16/07/2024 20:12:04 ******/
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
      ,[Duracion]
      ,[Nombre]
  FROM [EXCURSIONES]
    WHERE 
	(@IdExcursion IS NULL OR IdExcursion = @IdExcursion);

END



/****** Object:  StoredProcedure [dbo].[ObtenerUsuarioPorId]    Script Date: 19/06/2024 16:19:46 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[ObtenerFechaPorId]    Script Date: 16/07/2024 20:12:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Agustin Herrera
-- Create date: 10/07/2024
-- Description:	Trae todas las fechas por id.
-- =============================================
create   PROCEDURE  [dbo].[ObtenerFechaPorId] 
@IdFecha int
AS
BEGIN
	SET NOCOUNT ON;
select 
		fechaInicio
from FECHAS
where @IdFecha = IdFecha


END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerFechaPorMes]    Script Date: 16/07/2024 20:12:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Agustin Herrera
-- Create date: 10/07/2024
-- Description:	Trae todas las fechas por mes.
-- =============================================
CREATE   PROCEDURE  [dbo].[ObtenerFechaPorMes] 
@mes int
AS
BEGIN
	SET NOCOUNT ON;
select 
		IdFecha,
		fechaInicio
from FECHAS
where idmes = @mes


END
GO
/****** Object:  StoredProcedure [dbo].[ObtenerHotelPorId]    Script Date: 16/07/2024 20:12:04 ******/
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
/****** Object:  StoredProcedure [dbo].[ObtenerPaquetePorId]    Script Date: 16/07/2024 20:12:04 ******/
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
/****** Object:  StoredProcedure [dbo].[ObtenerReservaPorDNI]    Script Date: 16/07/2024 20:12:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Agustin Herrera
-- Create date: 14/0/2024
-- Description:	Obtiene reserva por DNI.
-- =============================================
CREATE PROCEDURE  [dbo].[ObtenerReservaPorDNI] 
@DNI INT = NULL
AS
BEGIN
	SET NOCOUNT ON;

SELECT r.[IdReserva]
      ,rrxu.DniUsuario
	  ,P.cdgDestino
      ,[EstadoReserva]
      ,r.IdPaquete
	  ,P.NombrePaquete
      ,[Precio]
	  ,R.IdHotel
	  ,H.NombreHotel
	  ,FechaInicio
      FROM RESERVA R
	  INNER JOIN PAQUETE P
	  on  P.idpaquete = R.IdPaquete	
	  INNER JOIN HOTEL H
	  on H.IdHotel = R.IdHotel
	  right join RelReservaXUsuario rrxu
	  on rrxu.IdReserva = r.IdReserva
	  where @DNI = rrxu.DniUsuario



END



/** Object:  StoredProcedure [dbo].[ObtenerUsuarioPorId]    Script Date: 19/06/2024 16:19:46 **/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[ObtenerReservaPorId]    Script Date: 16/07/2024 20:12:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	Dorrego Facundo
-- Create date: 19/06/2024
-- Description:	Obtiene reserva por id.
-- =============================================
CREATE PROCEDURE  [dbo].[ObtenerReservaPorId]
@IdReserva INT = NULL
AS
BEGIN
	SET NOCOUNT ON;

SELECT [IdReserva]
      ,[DNI]
      ,[EstadoReserva]
      ,[IdPaquete]
      ,[Precio]
	  ,IdHotel
      
  FROM [RESERVA]
    WHERE 
	(@IdReserva IS NULL OR IdReserva = @IdReserva);

END



/****** Object:  StoredProcedure [dbo].[ObtenerUsuarioPorId]    Script Date: 19/06/2024 16:19:46 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[ObtenerUltimoRegistroReserva]    Script Date: 16/07/2024 20:12:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author: Agustin Herrera
-- Create date: 19/07/2024
-- Description:	Obtiene ultimo registro de reserva.
-- =============================================
create PROCEDURE  [dbo].[ObtenerUltimoRegistroReserva] 
AS
BEGIN
	SET NOCOUNT ON;
select top 1  IdReserva from RESERVA
order by IdReserva desc;

END



/****** Object:  StoredProcedure [dbo].[ObtenerUsuarioPorId]    Script Date: 19/06/2024 16:19:46 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[ObtenerUsuarioPorId]    Script Date: 16/07/2024 20:12:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:	agustin herrera
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
	  ,Telefono
      
      
  FROM [USUARIOS]
    WHERE 
	(@IdUsuario IS NULL OR IdUsuario = @IdUsuario);

END

/****** Object:  StoredProcedure [dbo].[ObtenerDestinoPorId]    Script Date: 19/06/2024 16:19:46 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[SelDestinoCompleto]    Script Date: 16/07/2024 20:12:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelDestinoCompleto]
AS
BEGIN
    SELECT IdDestino, cdgDestino, NombreDestino
    FROM DESTINO;
END;
GO
/****** Object:  StoredProcedure [dbo].[SelExcursionesCompleto]    Script Date: 16/07/2024 20:12:04 ******/
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
      ,[Duracion]
	  ,[Nombre]
  FROM[EXCURSIONES]


END
GO
/****** Object:  StoredProcedure [dbo].[SelExcursionesPorDestino]    Script Date: 16/07/2024 20:12:04 ******/
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
      ,[Duracion]
	  ,[Nombre]
  FROM[EXCURSIONES]

  WHERE [cdgDestino] = @cdgDestino
END
GO
/****** Object:  StoredProcedure [dbo].[SelHotelCompleto]    Script Date: 16/07/2024 20:12:04 ******/
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
/****** Object:  StoredProcedure [dbo].[SelHotelCompletoPorDestino]    Script Date: 16/07/2024 20:12:04 ******/
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
/****** Object:  StoredProcedure [dbo].[SelObtenerMesActivoPorId]    Script Date: 16/07/2024 20:12:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[SelObtenerMesActivoPorId]
    @Activo INT

AS
BEGIN
    SET NOCOUNT ON;

    SELECT IdMes, NombreMes
    FROM MES
    WHERE Activo = @Activo
END
GO
/****** Object:  StoredProcedure [dbo].[SelPaqueteCompleto]    Script Date: 16/07/2024 20:12:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[SelPaqueteCompleto]

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
		AND (@Mes IS NULL OR mes = @Mes) AND (Disponibilidad > 0)
       
END
GO
/****** Object:  StoredProcedure [dbo].[selRelExcursionXreserva]    Script Date: 16/07/2024 20:12:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[selRelExcursionXreserva] 
@Idreserva int
as
begin
select 
		rexr.IdExcursion,
		e.Nombre
from relexcursionxreserva rexr
inner join EXCURSIONES e
on e.IdExcursion = rexr.IdExcursion
where @Idreserva = rexr.idreserva

end
GO
/****** Object:  StoredProcedure [dbo].[SelReservaCompleto]    Script Date: 16/07/2024 20:12:04 ******/
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
/****** Object:  StoredProcedure [dbo].[SelUsuarioCompleto]    Script Date: 16/07/2024 20:12:04 ******/
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
      ,[DNI]
      ,[Telefono]
	  ,[TipoUsuario]
	  
  FROM USUARIOS


END

/****** Object:  StoredProcedure [dbo].[ObtenerReservaPorId]    Script Date: 19/06/2024 16:19:46 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[updEstadoMes]    Script Date: 16/07/2024 20:12:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updEstadoMes]
    @IdMes INT,
    @Activo BIT
AS
BEGIN
    SET NOCOUNT ON;
    
    UPDATE MES
    SET Activo = @Activo
    WHERE IdMes = @IdMes;
END
GO
/****** Object:  StoredProcedure [dbo].[updEstadoReserva]    Script Date: 16/07/2024 20:12:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[updEstadoReserva] 
@IdReserva INT = NULL,
@IdPaquete INT = NULL,
@auxDispo INT = NULL
AS
BEGIN
	SET NOCOUNT ON;
	SET @auxDispo = (select Disponibilidad from PAQUETE where IdPaquete=@IdPaquete)
	update RESERVA set EstadoReserva = 1 where IdReserva=@IdReserva
	update PAQUETE set Disponibilidad = (@auxDispo-1) where IdPaquete=@IdPaquete

END

/****** Object:  StoredProcedure [dbo].[ObtenerUsuarioPorId]    Script Date: 19/06/2024 16:19:46 ******/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[updExcursiones]    Script Date: 16/07/2024 20:12:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: Agustin herrera
-- Create date: 01/07/2024
-- Description:	updatea la tabla de excursiones..
-- =============================================
CREATE PROCEDURE [dbo].[updExcursiones]
@idExcursion int,
@cdgDestino int,
@Descripcion varchar(200),
@Precio money,
@Duracion int,
@Nombre varchar(50)
as 

update EXCURSIONES set cdgDestino = @cdgdestino, 
Nombre = @Nombre,
Descripcion = @Descripcion,
Precio= @Precio,
Duracion = @Duracion

where IdExcursion = @idExcursion


	




GO
/****** Object:  StoredProcedure [dbo].[updHotel]    Script Date: 16/07/2024 20:12:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author: Agustin herrera
-- Create date: 03/07/2024
-- Description:	updatea la tabla de hoteles..
-- =============================================
CREATE PROCEDURE [dbo].[updHotel]
@idHotel int,
@NombreHotel varchar(80),
@Descripcion varchar(150),
@PrecioPorNoche money,
@cdgDestino int,
@URLImagen varchar(5000)
as 

update HOTEL set NombreHotel = @NombreHotel, 
Descripcion = @Descripcion,
PrecioPorNoche = @PrecioPorNoche,
cdgDestino = @cdgDestino,
URLimagen = @URLImagen

where IdHotel = @idHotel

	




GO
/****** Object:  StoredProcedure [dbo].[updPaquetes]    Script Date: 16/07/2024 20:12:04 ******/
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

where IdPaquete = @idPaquete

	




GO
/****** Object:  StoredProcedure [dbo].[verificarUsuarioExistente]    Script Date: 16/07/2024 20:12:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[verificarUsuarioExistente]
    @DNI INT = NULL,
    @CorreoElectronico NVARCHAR(255) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @Existe INT;

    SELECT @Existe = CASE 
                        WHEN COUNT(*) > 0 THEN 1 
                        ELSE 0 
                     END
    FROM USUARIOS
    WHERE DNI = @DNI AND CorreoElectronico = @CorreoElectronico;

    SELECT @Existe AS Existe;
END
GO
USE [master]
GO
ALTER DATABASE [ATERRIZAR_COM] SET  READ_WRITE 
GO
