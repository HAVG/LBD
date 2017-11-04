USE [master]
GO
/****** Object:  Database [Consultorio]    Script Date: 04/11/2017 02:58:53 p.m. ******/
CREATE DATABASE [Consultorio]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Consultorio', FILENAME = N'F:\Consultorio\Consultorio.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Consultorio_log', FILENAME = N'F:\Consultorio\Consultorio_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Consultorio] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Consultorio].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Consultorio] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Consultorio] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Consultorio] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Consultorio] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Consultorio] SET ARITHABORT OFF 
GO
ALTER DATABASE [Consultorio] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Consultorio] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Consultorio] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Consultorio] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Consultorio] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Consultorio] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Consultorio] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Consultorio] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Consultorio] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Consultorio] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Consultorio] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Consultorio] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Consultorio] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Consultorio] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Consultorio] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Consultorio] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Consultorio] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Consultorio] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Consultorio] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Consultorio] SET  MULTI_USER 
GO
ALTER DATABASE [Consultorio] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Consultorio] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Consultorio] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Consultorio] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Consultorio]
GO
/****** Object:  Table [dbo].[CitaPaciente]    Script Date: 04/11/2017 02:58:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CitaPaciente](
	[IDEmpleado] [uniqueidentifier] NOT NULL,
	[IDPaciente] [uniqueidentifier] NOT NULL,
	[NumConsultorio] [int] NOT NULL,
	[InicioCita] [time](7) NOT NULL,
	[FinCita] [time](7) NOT NULL,
	[NumCita] [int] NOT NULL,
 CONSTRAINT [PK_CitaPaciente] PRIMARY KEY CLUSTERED 
(
	[NumCita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Consultorio]    Script Date: 04/11/2017 02:58:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Consultorio](
	[NumConsultorio] [int] NOT NULL,
	[Ubicacion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Consultorio] PRIMARY KEY CLUSTERED 
(
	[NumConsultorio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DetalleOrdenCompra]    Script Date: 04/11/2017 02:58:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleOrdenCompra](
	[IDMedicamento] [uniqueidentifier] NOT NULL,
	[IDOrdenCompra] [uniqueidentifier] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Precio] [money] NOT NULL,
	[Total] [money] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DetalleReceta]    Script Date: 04/11/2017 02:58:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleReceta](
	[IDReceta] [uniqueidentifier] NOT NULL,
	[IDMedicamento] [uniqueidentifier] NOT NULL,
	[Dosis] [int] NOT NULL,
	[Frecuencia] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DetalleTicket]    Script Date: 04/11/2017 02:58:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleTicket](
	[IDMedicamento] [uniqueidentifier] NOT NULL,
	[IDTicket] [uniqueidentifier] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Precio] [money] NOT NULL,
	[Total] [money] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DoctorConsultorio]    Script Date: 04/11/2017 02:58:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DoctorConsultorio](
	[IDEmpleado] [uniqueidentifier] NOT NULL,
	[Especialidad] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EmpleadoConsultorio]    Script Date: 04/11/2017 02:58:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[EmpleadoConsultorio](
	[IDEmpleado] [uniqueidentifier] NOT NULL,
	[NomEmpleado] [varchar](50) NOT NULL,
 CONSTRAINT [PK_EmpleadoConsultorio] PRIMARY KEY CLUSTERED 
(
	[IDEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HistorialMedicinas]    Script Date: 04/11/2017 02:58:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistorialMedicinas](
	[IDHistorial] [uniqueidentifier] NOT NULL,
	[IDMedicamento] [uniqueidentifier] NOT NULL,
	[Dosis] [int] NOT NULL,
	[Frecuencia] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HistorialPaciente]    Script Date: 04/11/2017 02:58:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HistorialPaciente](
	[IDPaciente] [uniqueidentifier] NOT NULL,
	[Diagnostico] [varchar](50) NOT NULL,
	[IDHistorial] [uniqueidentifier] NOT NULL,
	[Tratamiento] [varchar](50) NOT NULL,
	[Descripcion] [text] NOT NULL,
 CONSTRAINT [PK_HistorialPaciente] PRIMARY KEY CLUSTERED 
(
	[IDHistorial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InventarioMedicamentos]    Script Date: 04/11/2017 02:58:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventarioMedicamentos](
	[IDMedicamento] [uniqueidentifier] NOT NULL,
	[Cantidad] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ListadoMedicamentos]    Script Date: 04/11/2017 02:58:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ListadoMedicamentos](
	[IDMedicamento] [uniqueidentifier] NOT NULL,
	[NomMedicamento] [varchar](50) NOT NULL,
	[DescripcionMedicamento] [text] NOT NULL,
 CONSTRAINT [PK_ListadoMedicamentos] PRIMARY KEY CLUSTERED 
(
	[IDMedicamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MovimientoSalida]    Script Date: 04/11/2017 02:58:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovimientoSalida](
	[IDMedicamento] [uniqueidentifier] NOT NULL,
	[Cantidad] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MovimientosEntrada]    Script Date: 04/11/2017 02:58:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovimientosEntrada](
	[IDMedicamento] [uniqueidentifier] NOT NULL,
	[Cantidad] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrdenCompra]    Script Date: 04/11/2017 02:58:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrdenCompra](
	[IDProveedor] [uniqueidentifier] NOT NULL,
	[FechaCompra] [date] NOT NULL,
	[IDOrdenCompra] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_OrdenCompra] PRIMARY KEY CLUSTERED 
(
	[IDOrdenCompra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PacienteConsultorio]    Script Date: 04/11/2017 02:58:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PacienteConsultorio](
	[IDPaciente] [uniqueidentifier] NOT NULL,
	[NomPaciente] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PacienteConsultorio] PRIMARY KEY CLUSTERED 
(
	[IDPaciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 04/11/2017 02:58:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Proveedor](
	[IDProveedor] [uniqueidentifier] NOT NULL,
	[NomProveedor] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Proveedor] PRIMARY KEY CLUSTERED 
(
	[IDProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RecetaPaciente]    Script Date: 04/11/2017 02:58:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RecetaPaciente](
	[NumCita] [int] NOT NULL,
	[FechaReceta] [time](7) NOT NULL,
	[VencimientoReceta] [time](7) NOT NULL,
	[EstatusReceta] [char](10) NOT NULL,
	[IDReceta] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_RecetaPaciente] PRIMARY KEY CLUSTERED 
(
	[IDReceta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[VistaCitasDoctor]    Script Date: 04/11/2017 02:58:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[VistaCitasDoctor] as
select c.InicioCita,c.FinCita,e.NomEmpleado,p.NomPaciente
from CitaPaciente c,PacienteConsultorio p,EmpleadoConsultorio e
left join CitaPaciente a on a.IDEmpleado=e.IDEmpleado

GO
/****** Object:  View [dbo].[VistaCitasPaciente]    Script Date: 04/11/2017 02:58:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[VistaCitasPaciente] as
select c.InicioCita,c.FinCita,e.NomEmpleado,p.NomPaciente
from CitaPaciente c,EmpleadoConsultorio e,PacienteConsultorio p
left join CitaPaciente b on b.IDPaciente=p.IDPaciente

GO
/****** Object:  View [dbo].[VistaCitas]    Script Date: 04/11/2017 02:58:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[VistaCitas] as
select p.InicioCita,p.FinCita,e.NomEmpleado,p.NomPaciente
from VistaCitasPaciente p,VistaCitasDoctor e
left join VistaCitasPaciente c on e.NomEmpleado=c.NomEmpleado

GO
/****** Object:  Index [IX_InventarioMedicamentos]    Script Date: 04/11/2017 02:58:53 p.m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_InventarioMedicamentos] ON [dbo].[InventarioMedicamentos]
(
	[IDMedicamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_MovimientoSalida]    Script Date: 04/11/2017 02:58:53 p.m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_MovimientoSalida] ON [dbo].[MovimientoSalida]
(
	[IDMedicamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_MovimientosEntrada]    Script Date: 04/11/2017 02:58:53 p.m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_MovimientosEntrada] ON [dbo].[MovimientosEntrada]
(
	[IDMedicamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EmpleadoConsultorio] ADD  DEFAULT (newid()) FOR [IDEmpleado]
GO
ALTER TABLE [dbo].[EmpleadoConsultorio] ADD  DEFAULT ('John Doe') FOR [NomEmpleado]
GO
ALTER TABLE [dbo].[PacienteConsultorio] ADD  DEFAULT (newid()) FOR [IDPaciente]
GO
ALTER TABLE [dbo].[PacienteConsultorio] ADD  DEFAULT ('John Doe') FOR [NomPaciente]
GO
ALTER TABLE [dbo].[CitaPaciente]  WITH CHECK ADD  CONSTRAINT [FK_CitaPaciente_Consultorio] FOREIGN KEY([NumConsultorio])
REFERENCES [dbo].[Consultorio] ([NumConsultorio])
GO
ALTER TABLE [dbo].[CitaPaciente] CHECK CONSTRAINT [FK_CitaPaciente_Consultorio]
GO
ALTER TABLE [dbo].[CitaPaciente]  WITH CHECK ADD  CONSTRAINT [FK_CitaPaciente_EmpleadoConsultorio] FOREIGN KEY([IDEmpleado])
REFERENCES [dbo].[EmpleadoConsultorio] ([IDEmpleado])
GO
ALTER TABLE [dbo].[CitaPaciente] CHECK CONSTRAINT [FK_CitaPaciente_EmpleadoConsultorio]
GO
ALTER TABLE [dbo].[CitaPaciente]  WITH CHECK ADD  CONSTRAINT [FK_CitaPaciente_PacienteConsultorio] FOREIGN KEY([IDPaciente])
REFERENCES [dbo].[PacienteConsultorio] ([IDPaciente])
GO
ALTER TABLE [dbo].[CitaPaciente] CHECK CONSTRAINT [FK_CitaPaciente_PacienteConsultorio]
GO
ALTER TABLE [dbo].[DetalleOrdenCompra]  WITH CHECK ADD  CONSTRAINT [FK_DetalleOrdenCompra_MovimientosEntrada] FOREIGN KEY([IDMedicamento])
REFERENCES [dbo].[MovimientosEntrada] ([IDMedicamento])
GO
ALTER TABLE [dbo].[DetalleOrdenCompra] CHECK CONSTRAINT [FK_DetalleOrdenCompra_MovimientosEntrada]
GO
ALTER TABLE [dbo].[DetalleOrdenCompra]  WITH CHECK ADD  CONSTRAINT [FK_DetalleOrdenCompra_OrdenCompra] FOREIGN KEY([IDOrdenCompra])
REFERENCES [dbo].[OrdenCompra] ([IDOrdenCompra])
GO
ALTER TABLE [dbo].[DetalleOrdenCompra] CHECK CONSTRAINT [FK_DetalleOrdenCompra_OrdenCompra]
GO
ALTER TABLE [dbo].[DetalleReceta]  WITH CHECK ADD  CONSTRAINT [FK_DetalleReceta_ListadoMedicamentos] FOREIGN KEY([IDMedicamento])
REFERENCES [dbo].[ListadoMedicamentos] ([IDMedicamento])
GO
ALTER TABLE [dbo].[DetalleReceta] CHECK CONSTRAINT [FK_DetalleReceta_ListadoMedicamentos]
GO
ALTER TABLE [dbo].[DetalleReceta]  WITH CHECK ADD  CONSTRAINT [FK_DetalleReceta_RecetaPaciente] FOREIGN KEY([IDReceta])
REFERENCES [dbo].[RecetaPaciente] ([IDReceta])
GO
ALTER TABLE [dbo].[DetalleReceta] CHECK CONSTRAINT [FK_DetalleReceta_RecetaPaciente]
GO
ALTER TABLE [dbo].[DetalleTicket]  WITH CHECK ADD  CONSTRAINT [FK_DetalleTicket_MovimientoSalida] FOREIGN KEY([IDMedicamento])
REFERENCES [dbo].[MovimientoSalida] ([IDMedicamento])
GO
ALTER TABLE [dbo].[DetalleTicket] CHECK CONSTRAINT [FK_DetalleTicket_MovimientoSalida]
GO
ALTER TABLE [dbo].[DoctorConsultorio]  WITH CHECK ADD  CONSTRAINT [FK_DoctorConsultorio_EmpleadoConsultorio] FOREIGN KEY([IDEmpleado])
REFERENCES [dbo].[EmpleadoConsultorio] ([IDEmpleado])
GO
ALTER TABLE [dbo].[DoctorConsultorio] CHECK CONSTRAINT [FK_DoctorConsultorio_EmpleadoConsultorio]
GO
ALTER TABLE [dbo].[HistorialMedicinas]  WITH CHECK ADD  CONSTRAINT [FK_HistorialMedicinas_HistorialPaciente] FOREIGN KEY([IDHistorial])
REFERENCES [dbo].[HistorialPaciente] ([IDHistorial])
GO
ALTER TABLE [dbo].[HistorialMedicinas] CHECK CONSTRAINT [FK_HistorialMedicinas_HistorialPaciente]
GO
ALTER TABLE [dbo].[HistorialMedicinas]  WITH CHECK ADD  CONSTRAINT [FK_HistorialMedicinas_ListadoMedicamentos] FOREIGN KEY([IDHistorial])
REFERENCES [dbo].[ListadoMedicamentos] ([IDMedicamento])
GO
ALTER TABLE [dbo].[HistorialMedicinas] CHECK CONSTRAINT [FK_HistorialMedicinas_ListadoMedicamentos]
GO
ALTER TABLE [dbo].[HistorialPaciente]  WITH CHECK ADD  CONSTRAINT [FK_HistorialPaciente_PacienteConsultorio] FOREIGN KEY([IDPaciente])
REFERENCES [dbo].[PacienteConsultorio] ([IDPaciente])
GO
ALTER TABLE [dbo].[HistorialPaciente] CHECK CONSTRAINT [FK_HistorialPaciente_PacienteConsultorio]
GO
ALTER TABLE [dbo].[InventarioMedicamentos]  WITH CHECK ADD  CONSTRAINT [FK_InventarioMedicamentos_ListadoMedicamentos] FOREIGN KEY([IDMedicamento])
REFERENCES [dbo].[ListadoMedicamentos] ([IDMedicamento])
GO
ALTER TABLE [dbo].[InventarioMedicamentos] CHECK CONSTRAINT [FK_InventarioMedicamentos_ListadoMedicamentos]
GO
ALTER TABLE [dbo].[MovimientoSalida]  WITH CHECK ADD  CONSTRAINT [FK_MovimientoSalida_InventarioMedicamentos] FOREIGN KEY([IDMedicamento])
REFERENCES [dbo].[InventarioMedicamentos] ([IDMedicamento])
GO
ALTER TABLE [dbo].[MovimientoSalida] CHECK CONSTRAINT [FK_MovimientoSalida_InventarioMedicamentos]
GO
ALTER TABLE [dbo].[MovimientosEntrada]  WITH CHECK ADD  CONSTRAINT [FK_MovimientosEntrada_InventarioMedicamentos] FOREIGN KEY([IDMedicamento])
REFERENCES [dbo].[InventarioMedicamentos] ([IDMedicamento])
GO
ALTER TABLE [dbo].[MovimientosEntrada] CHECK CONSTRAINT [FK_MovimientosEntrada_InventarioMedicamentos]
GO
ALTER TABLE [dbo].[OrdenCompra]  WITH CHECK ADD  CONSTRAINT [FK_OrdenCompra_Proveedor] FOREIGN KEY([IDProveedor])
REFERENCES [dbo].[Proveedor] ([IDProveedor])
GO
ALTER TABLE [dbo].[OrdenCompra] CHECK CONSTRAINT [FK_OrdenCompra_Proveedor]
GO
ALTER TABLE [dbo].[RecetaPaciente]  WITH CHECK ADD  CONSTRAINT [FK_RecetaPaciente_CitaPaciente] FOREIGN KEY([NumCita])
REFERENCES [dbo].[CitaPaciente] ([NumCita])
GO
ALTER TABLE [dbo].[RecetaPaciente] CHECK CONSTRAINT [FK_RecetaPaciente_CitaPaciente]
GO
USE [master]
GO
ALTER DATABASE [Consultorio] SET  READ_WRITE 
GO
