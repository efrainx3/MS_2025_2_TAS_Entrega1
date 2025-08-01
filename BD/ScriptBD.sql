USE [PoliMarket]
GO
/****** Object:  Table [dbo].[Bodega]    Script Date: 29/07/2025 9:47:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bodega](
	[IdBodega] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Direccion] [varchar](50) NOT NULL,
	[Activa] [bit] NOT NULL,
	[TamanoMetros2] [int] NOT NULL,
 CONSTRAINT [PK_Bodega] PRIMARY KEY CLUSTERED 
(
	[IdBodega] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 29/07/2025 9:47:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[IdCliente] [uniqueidentifier] NOT NULL,
	[TipoIdentificacion] [varchar](2) NOT NULL,
	[NumeroIdentificacion] [varchar](50) NOT NULL,
	[Nombres] [varchar](50) NOT NULL,
	[Apellidos] [varchar](50) NOT NULL,
	[Email] [varchar](200) NOT NULL,
	[Telefono] [varchar](50) NOT NULL,
	[TipoCliente] [int] NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleEntrega]    Script Date: 29/07/2025 9:47:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleEntrega](
	[IdDetalleEntrega] [uniqueidentifier] NOT NULL,
	[IdEntrega] [uniqueidentifier] NOT NULL,
	[IdVenta] [uniqueidentifier] NOT NULL,
	[FechaEntrega] [datetime] NOT NULL,
	[DireccionEntrega] [varchar](200) NOT NULL,
	[Entregado] [bit] NOT NULL,
 CONSTRAINT [PK_DetalleEntrega] PRIMARY KEY CLUSTERED 
(
	[IdDetalleEntrega] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleVenta]    Script Date: 29/07/2025 9:47:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleVenta](
	[IdDetalleVenta] [uniqueidentifier] NOT NULL,
	[IdVenta] [uniqueidentifier] NOT NULL,
	[IdProducto] [uniqueidentifier] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[PrecioUnitario] [decimal](18, 0) NOT NULL,
	[Subtotal] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_DetalleVenta] PRIMARY KEY CLUSTERED 
(
	[IdDetalleVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 29/07/2025 9:47:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[IdEmpleado] [uniqueidentifier] NOT NULL,
	[TipoIdentificacion] [varchar](2) NOT NULL,
	[NumeroIdentificacion] [varchar](50) NOT NULL,
	[Nombres] [varchar](50) NOT NULL,
	[Apellidos] [varchar](50) NOT NULL,
	[Email] [varchar](200) NOT NULL,
	[Telefono] [varchar](50) NOT NULL,
	[Cargo] [int] NOT NULL,
	[Salario] [decimal](18, 0) NULL,
	[FechaRegistro] [datetime] NOT NULL,
	[Activo] [bit] NULL,
	[FechaActivacion] [datetime] NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[IdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoginModel]    Script Date: 29/07/2025 9:47:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginModel](
	[IdLogin] [uniqueidentifier] NOT NULL,
	[Password] [varchar](500) NOT NULL,
	[FechaIngresoExitoso] [datetime] NULL,
	[IdEmpleado] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_LoginModel] PRIMARY KEY CLUSTERED 
(
	[IdLogin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProcesoEntrega]    Script Date: 29/07/2025 9:47:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcesoEntrega](
	[IdEntrega] [uniqueidentifier] NOT NULL,
	[PlacaVehiculo] [varchar](50) NOT NULL,
	[FechaInicio] [datetime] NOT NULL,
	[FechaFin] [datetime] NOT NULL,
 CONSTRAINT [PK_ProcesoEntrega] PRIMARY KEY CLUSTERED 
(
	[IdEntrega] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 29/07/2025 9:47:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[IdProducto] [uniqueidentifier] NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Descripcion] [varchar](200) NOT NULL,
	[Precio] [decimal](18, 0) NOT NULL,
	[Cantidad] [int] NOT NULL,
	[IdProveedor] [uniqueidentifier] NOT NULL,
	[IdBodega] [int] NOT NULL,
	[Activo] [bit] NOT NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 29/07/2025 9:47:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor](
	[IdProveedor] [uniqueidentifier] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Contacto] [varchar](50) NOT NULL,
	[Telefono] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Direccion] [varchar](50) NOT NULL,
	[FechaRegistro] [datetime] NOT NULL,
 CONSTRAINT [PK_Proveedor] PRIMARY KEY CLUSTERED 
(
	[IdProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SolicitudProducto]    Script Date: 29/07/2025 9:47:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SolicitudProducto](
	[IdSolicitudProducto] [uniqueidentifier] NOT NULL,
	[FechaSolicitud] [datetime] NOT NULL,
	[Descripcion] [varchar](200) NOT NULL,
	[IdEmpleado] [uniqueidentifier] NOT NULL,
	[IdProducto] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_SolicitudProducto] PRIMARY KEY CLUSTERED 
(
	[IdSolicitudProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tarea]    Script Date: 29/07/2025 9:47:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tarea](
	[IdTarea] [uniqueidentifier] NOT NULL,
	[Descripcion] [varchar](500) NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[FechaVencimiento] [datetime] NOT NULL,
	[EstaCompleta] [bit] NOT NULL,
	[IdEmpleado] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Tarea] PRIMARY KEY CLUSTERED 
(
	[IdTarea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 29/07/2025 9:47:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[IdVenta] [uniqueidentifier] NOT NULL,
	[FechaVenta] [datetime] NOT NULL,
	[ValorTotal] [decimal](18, 0) NOT NULL,
	[IdEmpleado] [uniqueidentifier] NOT NULL,
	[EstadoVenta] [int] NOT NULL,
	[IdCliente] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Venta] PRIMARY KEY CLUSTERED 
(
	[IdVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Bodega] ([IdBodega], [Nombre], [Direccion], [Activa], [TamanoMetros2]) VALUES (1, N'Bodega 1', N'Carrera 23 #45 - 12', 1, 45)
INSERT [dbo].[Bodega] ([IdBodega], [Nombre], [Direccion], [Activa], [TamanoMetros2]) VALUES (2, N'Bodega 2', N'Carrera 22 #45 - 89', 1, 65)
GO
INSERT [dbo].[Cliente] ([IdCliente], [TipoIdentificacion], [NumeroIdentificacion], [Nombres], [Apellidos], [Email], [Telefono], [TipoCliente]) VALUES (N'4797cd5d-1020-4c94-8a80-015064c01b27', N'TI', N'900100017', N'Sofía', N'Mejía', N'sofia.mejia@example.com', N'3001110017', 2)
INSERT [dbo].[Cliente] ([IdCliente], [TipoIdentificacion], [NumeroIdentificacion], [Nombres], [Apellidos], [Email], [Telefono], [TipoCliente]) VALUES (N'd898f3fd-657f-45f6-83dc-1e5dc51c7aba', N'CE', N'900100015', N'Daniela', N'Peña', N'daniela.pena@example.com', N'3001110015', 1)
INSERT [dbo].[Cliente] ([IdCliente], [TipoIdentificacion], [NumeroIdentificacion], [Nombres], [Apellidos], [Email], [Telefono], [TipoCliente]) VALUES (N'a8358bb3-3a38-4133-9250-23c4ee9dbe1b', N'CC', N'900100013', N'Valentina', N'Cruz', N'valentina.cruz@example.com', N'3001110013', 1)
INSERT [dbo].[Cliente] ([IdCliente], [TipoIdentificacion], [NumeroIdentificacion], [Nombres], [Apellidos], [Email], [Telefono], [TipoCliente]) VALUES (N'9e816c09-2767-41a6-8d80-25b452dc7e50', N'CC', N'900100007', N'Camila', N'López', N'camila.lopez@example.com', N'3001110007', 2)
INSERT [dbo].[Cliente] ([IdCliente], [TipoIdentificacion], [NumeroIdentificacion], [Nombres], [Apellidos], [Email], [Telefono], [TipoCliente]) VALUES (N'b1075484-7148-44cf-8f84-2b6a8008c111', N'CE', N'900100018', N'Tomás', N'Ríos', N'tomas.rios@example.com', N'3001110018', 2)
INSERT [dbo].[Cliente] ([IdCliente], [TipoIdentificacion], [NumeroIdentificacion], [Nombres], [Apellidos], [Email], [Telefono], [TipoCliente]) VALUES (N'b3743bc9-ee3a-4d6c-a025-2eea1403a7a0', N'TI', N'900100005', N'Juliana', N'Moreno', N'juliana.moreno@example.com', N'3001110005', 2)
INSERT [dbo].[Cliente] ([IdCliente], [TipoIdentificacion], [NumeroIdentificacion], [Nombres], [Apellidos], [Email], [Telefono], [TipoCliente]) VALUES (N'0110a856-023b-4c45-bb85-3e62b8217eda', N'CC', N'900100010', N'Felipe', N'Castro', N'felipe.castro@example.com', N'3001110010', 1)
INSERT [dbo].[Cliente] ([IdCliente], [TipoIdentificacion], [NumeroIdentificacion], [Nombres], [Apellidos], [Email], [Telefono], [TipoCliente]) VALUES (N'73e0d6af-b019-44a4-8786-43300b5cff4c', N'CE', N'900100003', N'Laura', N'Martínez', N'laura.martinez@example.com', N'3001110003', 1)
INSERT [dbo].[Cliente] ([IdCliente], [TipoIdentificacion], [NumeroIdentificacion], [Nombres], [Apellidos], [Email], [Telefono], [TipoCliente]) VALUES (N'56a2eed5-518d-4f06-8ec9-5f940890ff47', N'TI', N'900100002', N'Carlos', N'Rodríguez', N'carlos.rodriguez@example.com', N'3001110002', 2)
INSERT [dbo].[Cliente] ([IdCliente], [TipoIdentificacion], [NumeroIdentificacion], [Nombres], [Apellidos], [Email], [Telefono], [TipoCliente]) VALUES (N'6d1958c0-4e7b-4ac6-9d06-746ecfa767fd', N'CC', N'900100001', N'Ana', N'Pérez', N'ana.perez@example.com', N'3001110001', 1)
INSERT [dbo].[Cliente] ([IdCliente], [TipoIdentificacion], [NumeroIdentificacion], [Nombres], [Apellidos], [Email], [Telefono], [TipoCliente]) VALUES (N'e7979f94-3ecf-4120-a908-93dc4c8d35e9', N'CE', N'900100006', N'Andrés', N'Vargas', N'andres.vargas@example.com', N'3001110006', 1)
INSERT [dbo].[Cliente] ([IdCliente], [TipoIdentificacion], [NumeroIdentificacion], [Nombres], [Apellidos], [Email], [Telefono], [TipoCliente]) VALUES (N'62aa0c65-058d-4e24-ac4b-9aee49e6fd33', N'TI', N'900100020', N'Manuel', N'Suárez', N'manuel.suarez@example.com', N'3001110020', 2)
INSERT [dbo].[Cliente] ([IdCliente], [TipoIdentificacion], [NumeroIdentificacion], [Nombres], [Apellidos], [Email], [Telefono], [TipoCliente]) VALUES (N'b1e448fd-b5b4-42aa-9721-a8e94e53e323', N'CC', N'900100019', N'Lucía', N'Fernández', N'lucia.fernandez@example.com', N'3001110019', 1)
INSERT [dbo].[Cliente] ([IdCliente], [TipoIdentificacion], [NumeroIdentificacion], [Nombres], [Apellidos], [Email], [Telefono], [TipoCliente]) VALUES (N'5faffbe4-27f4-4e72-a07a-b4b634f04330', N'CC', N'900100004', N'Diego', N'Gómez', N'diego.gomez@example.com', N'3001110004', 1)
INSERT [dbo].[Cliente] ([IdCliente], [TipoIdentificacion], [NumeroIdentificacion], [Nombres], [Apellidos], [Email], [Telefono], [TipoCliente]) VALUES (N'7bf82eb9-e7de-426e-b542-bacd7d0aa1d8', N'TI', N'900100014', N'Esteban', N'Mendoza', N'esteban.mendoza@example.com', N'3001110014', 2)
INSERT [dbo].[Cliente] ([IdCliente], [TipoIdentificacion], [NumeroIdentificacion], [Nombres], [Apellidos], [Email], [Telefono], [TipoCliente]) VALUES (N'43c36b92-d019-4e72-9ed2-bcff70ff5d7a', N'CE', N'900100009', N'Natalia', N'Ramírez', N'natalia.ramirez@example.com', N'3001110009', 2)
INSERT [dbo].[Cliente] ([IdCliente], [TipoIdentificacion], [NumeroIdentificacion], [Nombres], [Apellidos], [Email], [Telefono], [TipoCliente]) VALUES (N'51a08630-5eb3-41e4-8b6c-d0951cc82ee4', N'CE', N'900100012', N'Santiago', N'Patiño', N'santiago.patino@example.com', N'3001110012', 2)
INSERT [dbo].[Cliente] ([IdCliente], [TipoIdentificacion], [NumeroIdentificacion], [Nombres], [Apellidos], [Email], [Telefono], [TipoCliente]) VALUES (N'00192752-9b86-4c0b-8b39-e151fdeeb60c', N'TI', N'900100008', N'Javier', N'Salazar', N'javier.salazar@example.com', N'3001110008', 1)
INSERT [dbo].[Cliente] ([IdCliente], [TipoIdentificacion], [NumeroIdentificacion], [Nombres], [Apellidos], [Email], [Telefono], [TipoCliente]) VALUES (N'b86f5801-ea97-4895-968f-f22fdaefb0b0', N'TI', N'900100011', N'Isabella', N'Torres', N'isabella.torres@example.com', N'3001110011', 1)
INSERT [dbo].[Cliente] ([IdCliente], [TipoIdentificacion], [NumeroIdentificacion], [Nombres], [Apellidos], [Email], [Telefono], [TipoCliente]) VALUES (N'81a89c7d-ec46-45b7-aff5-f5acdb4c0d1b', N'CC', N'900100016', N'Luis', N'Gutiérrez', N'luis.gutierrez@example.com', N'3001110016', 1)
GO
INSERT [dbo].[Empleado] ([IdEmpleado], [TipoIdentificacion], [NumeroIdentificacion], [Nombres], [Apellidos], [Email], [Telefono], [Cargo], [Salario], [FechaRegistro], [Activo], [FechaActivacion]) VALUES (N'e27a3b8a-d4e9-460c-a16b-044095b21c3a', N'TI', N'1001001008', N'Paula', N'Torres', N'paula.torres@example.com', N'3148901234', 1, CAST(2000000 AS Decimal(18, 0)), CAST(N'2025-07-28T20:30:02.627' AS DateTime), 1, CAST(N'2025-07-28T20:30:02.627' AS DateTime))
INSERT [dbo].[Empleado] ([IdEmpleado], [TipoIdentificacion], [NumeroIdentificacion], [Nombres], [Apellidos], [Email], [Telefono], [Cargo], [Salario], [FechaRegistro], [Activo], [FechaActivacion]) VALUES (N'fb47ecf6-ed8e-4e2b-b801-0537d00d96f1', N'CE', N'1001001019', N'Héctor', N'Mejía', N'hector.mejia@example.com', N'3259012345', 7, CAST(2800000 AS Decimal(18, 0)), CAST(N'2025-07-28T20:30:02.627' AS DateTime), 1, CAST(N'2025-07-28T20:30:02.627' AS DateTime))
INSERT [dbo].[Empleado] ([IdEmpleado], [TipoIdentificacion], [NumeroIdentificacion], [Nombres], [Apellidos], [Email], [Telefono], [Cargo], [Salario], [FechaRegistro], [Activo], [FechaActivacion]) VALUES (N'56742b22-3730-4295-81e6-196b5891386b', N'CC', N'1001001012', N'Camila', N'Gutiérrez', N'camila.gutierrez@example.com', N'3182345678', 2, CAST(1900000 AS Decimal(18, 0)), CAST(N'2025-07-28T20:30:02.627' AS DateTime), 1, NULL)
INSERT [dbo].[Empleado] ([IdEmpleado], [TipoIdentificacion], [NumeroIdentificacion], [Nombres], [Apellidos], [Email], [Telefono], [Cargo], [Salario], [FechaRegistro], [Activo], [FechaActivacion]) VALUES (N'b60d249e-b949-4375-9bf1-20d86dd73e3f', N'TI', N'1001001018', N'Valentina', N'Peña', N'valentina.pena@example.com', N'3248901234', 1, CAST(2500000 AS Decimal(18, 0)), CAST(N'2025-07-28T20:30:02.627' AS DateTime), 0, CAST(N'2025-07-28T20:30:02.627' AS DateTime))
INSERT [dbo].[Empleado] ([IdEmpleado], [TipoIdentificacion], [NumeroIdentificacion], [Nombres], [Apellidos], [Email], [Telefono], [Cargo], [Salario], [FechaRegistro], [Activo], [FechaActivacion]) VALUES (N'8cd318f2-ecc7-40f5-9e5e-23b60d9c3612', N'TI', N'1001001011', N'Sebastián', N'Moreno', N'sebastian.moreno@example.com', N'3171234567', 1, CAST(2300000 AS Decimal(18, 0)), CAST(N'2025-07-28T20:30:02.627' AS DateTime), 0, CAST(N'2025-07-28T20:30:02.627' AS DateTime))
INSERT [dbo].[Empleado] ([IdEmpleado], [TipoIdentificacion], [NumeroIdentificacion], [Nombres], [Apellidos], [Email], [Telefono], [Cargo], [Salario], [FechaRegistro], [Activo], [FechaActivacion]) VALUES (N'4d433f38-2e24-4157-b1f8-2b39d1ca42f8', N'CE', N'1001001016', N'Sara', N'Patiño', N'sara.patino@example.com', N'3226789012', 3, CAST(2200000 AS Decimal(18, 0)), CAST(N'2025-07-28T20:30:02.627' AS DateTime), 0, NULL)
INSERT [dbo].[Empleado] ([IdEmpleado], [TipoIdentificacion], [NumeroIdentificacion], [Nombres], [Apellidos], [Email], [Telefono], [Cargo], [Salario], [FechaRegistro], [Activo], [FechaActivacion]) VALUES (N'fd7c8564-8b22-4de7-ae64-34a11e1982ec', N'CC', N'1001001007', N'David', N'López', N'david.lopez@example.com', N'3137890123', 2, CAST(2600000 AS Decimal(18, 0)), CAST(N'2025-07-28T20:30:02.627' AS DateTime), 0, NULL)
INSERT [dbo].[Empleado] ([IdEmpleado], [TipoIdentificacion], [NumeroIdentificacion], [Nombres], [Apellidos], [Email], [Telefono], [Cargo], [Salario], [FechaRegistro], [Activo], [FechaActivacion]) VALUES (N'aac4c5cf-a201-4cbe-aa74-5fcfe530a22f', N'CE', N'1001001013', N'Felipe', N'Salazar', N'felipe.salazar@example.com', N'3193456789', 1, CAST(3000000 AS Decimal(18, 0)), CAST(N'2025-07-28T20:30:02.627' AS DateTime), 0, CAST(N'2025-07-28T20:30:02.627' AS DateTime))
INSERT [dbo].[Empleado] ([IdEmpleado], [TipoIdentificacion], [NumeroIdentificacion], [Nombres], [Apellidos], [Email], [Telefono], [Cargo], [Salario], [FechaRegistro], [Activo], [FechaActivacion]) VALUES (N'9f016556-3d28-4d07-a9bd-6d72d9697d2a', N'TI', N'1001001005', N'Andrés', N'Martínez', N'andres.martinez@example.com', N'3115678901', 2, CAST(2200000 AS Decimal(18, 0)), CAST(N'2025-07-28T20:30:02.627' AS DateTime), 0, CAST(N'2025-07-28T20:30:02.627' AS DateTime))
INSERT [dbo].[Empleado] ([IdEmpleado], [TipoIdentificacion], [NumeroIdentificacion], [Nombres], [Apellidos], [Email], [Telefono], [Cargo], [Salario], [FechaRegistro], [Activo], [FechaActivacion]) VALUES (N'c6a1c64c-337b-447b-9c02-706738573799', N'CC', N'1001001004', N'María', N'Fernández', N'maria.fernandez@example.com', N'3014567890', 3, CAST(3000000 AS Decimal(18, 0)), CAST(N'2025-07-28T20:30:02.627' AS DateTime), 0, NULL)
INSERT [dbo].[Empleado] ([IdEmpleado], [TipoIdentificacion], [NumeroIdentificacion], [Nombres], [Apellidos], [Email], [Telefono], [Cargo], [Salario], [FechaRegistro], [Activo], [FechaActivacion]) VALUES (N'7131165f-9365-4a27-b2bc-793901c27494', N'TI', N'1001001002', N'Laura', N'Gómez', N'laura.gomez@example.com', N'3102345678', 2, CAST(1800000 AS Decimal(18, 0)), CAST(N'2025-07-28T20:30:02.627' AS DateTime), 0, CAST(N'2025-07-28T20:30:02.627' AS DateTime))
INSERT [dbo].[Empleado] ([IdEmpleado], [TipoIdentificacion], [NumeroIdentificacion], [Nombres], [Apellidos], [Email], [Telefono], [Cargo], [Salario], [FechaRegistro], [Activo], [FechaActivacion]) VALUES (N'568054a5-0e59-4a50-a235-88e57e846695', N'CC', N'1001001020', N'Natalia', N'Suárez', N'natalia.suarez@example.com', N'3260123456', 1, CAST(2400000 AS Decimal(18, 0)), CAST(N'2025-07-28T20:30:02.627' AS DateTime), 1, CAST(N'2025-07-28T20:30:02.627' AS DateTime))
INSERT [dbo].[Empleado] ([IdEmpleado], [TipoIdentificacion], [NumeroIdentificacion], [Nombres], [Apellidos], [Email], [Telefono], [Cargo], [Salario], [FechaRegistro], [Activo], [FechaActivacion]) VALUES (N'6b6f7613-5256-4a69-ba43-9617b4899d82', N'CE', N'1001001006', N'Lucía', N'Ramírez', N'lucia.ramirez@example.com', N'3126789012', 1, CAST(2100000 AS Decimal(18, 0)), CAST(N'2025-07-28T20:30:02.627' AS DateTime), 0, CAST(N'2025-07-28T20:30:02.627' AS DateTime))
INSERT [dbo].[Empleado] ([IdEmpleado], [TipoIdentificacion], [NumeroIdentificacion], [Nombres], [Apellidos], [Email], [Telefono], [Cargo], [Salario], [FechaRegistro], [Activo], [FechaActivacion]) VALUES (N'86887497-11ef-46ed-a116-96301bc60ed4', N'CC', N'1001001014', N'Daniela', N'Cruz', N'daniela.cruz@example.com', N'3204567890', 2, CAST(2100000 AS Decimal(18, 0)), CAST(N'2025-07-28T20:30:02.627' AS DateTime), 0, CAST(N'2025-07-28T20:30:02.627' AS DateTime))
INSERT [dbo].[Empleado] ([IdEmpleado], [TipoIdentificacion], [NumeroIdentificacion], [Nombres], [Apellidos], [Email], [Telefono], [Cargo], [Salario], [FechaRegistro], [Activo], [FechaActivacion]) VALUES (N'055e8c23-b992-422e-b42d-b9f043e035ec', N'CE', N'1001001009', N'Jorge', N'Ríos', N'jorge.rios@example.com', N'3159012345', 3, CAST(2400000 AS Decimal(18, 0)), CAST(N'2025-07-28T20:30:02.627' AS DateTime), 0, CAST(N'2025-07-28T20:30:02.627' AS DateTime))
INSERT [dbo].[Empleado] ([IdEmpleado], [TipoIdentificacion], [NumeroIdentificacion], [Nombres], [Apellidos], [Email], [Telefono], [Cargo], [Salario], [FechaRegistro], [Activo], [FechaActivacion]) VALUES (N'fb1e9b3d-2880-452e-8040-c18da82e53c7', N'CE', N'1001001003', N'Carlos', N'Rodríguez', N'carlos.rod@example.com', N'3203456789', 1, CAST(2700000 AS Decimal(18, 0)), CAST(N'2025-07-28T20:30:02.627' AS DateTime), 0, CAST(N'2025-07-28T20:30:02.627' AS DateTime))
INSERT [dbo].[Empleado] ([IdEmpleado], [TipoIdentificacion], [NumeroIdentificacion], [Nombres], [Apellidos], [Email], [Telefono], [Cargo], [Salario], [FechaRegistro], [Activo], [FechaActivacion]) VALUES (N'd75a03e2-e864-44c3-b512-d49902e476a5', N'CC', N'1001001010', N'Carolina', N'Vargas', N'carolina.vargas@example.com', N'3160123456', 2, CAST(2800000 AS Decimal(18, 0)), CAST(N'2025-07-28T20:30:02.627' AS DateTime), 0, CAST(N'2025-07-28T20:30:02.627' AS DateTime))
INSERT [dbo].[Empleado] ([IdEmpleado], [TipoIdentificacion], [NumeroIdentificacion], [Nombres], [Apellidos], [Email], [Telefono], [Cargo], [Salario], [FechaRegistro], [Activo], [FechaActivacion]) VALUES (N'bed1bb83-152b-422b-80c9-e28a7a3bd1ea', N'CC', N'1001001001', N'Juan', N'Pérez', N'juan.perez@example.com', N'3001234567', 1, CAST(2500000 AS Decimal(18, 0)), CAST(N'2025-07-28T20:30:02.627' AS DateTime), 0, CAST(N'2025-07-28T20:30:02.627' AS DateTime))
INSERT [dbo].[Empleado] ([IdEmpleado], [TipoIdentificacion], [NumeroIdentificacion], [Nombres], [Apellidos], [Email], [Telefono], [Cargo], [Salario], [FechaRegistro], [Activo], [FechaActivacion]) VALUES (N'950d4fb5-9cc1-4734-a596-e8374ddc0c1d', N'CC', N'1001001017', N'Ricardo', N'Castro', N'ricardo.castro@example.com', N'3237890123', 2, CAST(2700000 AS Decimal(18, 0)), CAST(N'2025-07-28T20:30:02.627' AS DateTime), 0, CAST(N'2025-07-28T20:30:02.627' AS DateTime))
INSERT [dbo].[Empleado] ([IdEmpleado], [TipoIdentificacion], [NumeroIdentificacion], [Nombres], [Apellidos], [Email], [Telefono], [Cargo], [Salario], [FechaRegistro], [Activo], [FechaActivacion]) VALUES (N'41cfb77a-5dd8-4680-a68d-e8f6519e72e6', N'TI', N'1001001015', N'Tomás', N'Mendoza', N'tomas.mendoza@example.com', N'3215678901', 1, CAST(2600000 AS Decimal(18, 0)), CAST(N'2025-07-28T20:30:02.627' AS DateTime), 0, CAST(N'2025-07-28T20:30:02.627' AS DateTime))
GO
INSERT [dbo].[LoginModel] ([IdLogin], [Password], [FechaIngresoExitoso], [IdEmpleado]) VALUES (N'75615934-d6c8-472e-ae45-12b1b5d4886e', N'1234Poli', NULL, N'fd7c8564-8b22-4de7-ae64-34a11e1982ec')
INSERT [dbo].[LoginModel] ([IdLogin], [Password], [FechaIngresoExitoso], [IdEmpleado]) VALUES (N'f9f6cac5-26cd-442c-ac24-1ead28227cc0', N'1234Poli', NULL, N'7131165f-9365-4a27-b2bc-793901c27494')
INSERT [dbo].[LoginModel] ([IdLogin], [Password], [FechaIngresoExitoso], [IdEmpleado]) VALUES (N'c4468d72-441d-4bf3-9b0e-24f2bec6f59e', N'1234Poli', NULL, N'41cfb77a-5dd8-4680-a68d-e8f6519e72e6')
INSERT [dbo].[LoginModel] ([IdLogin], [Password], [FechaIngresoExitoso], [IdEmpleado]) VALUES (N'c8226595-13c2-46cd-9ded-27cbd5859767', N'1234Poli', NULL, N'055e8c23-b992-422e-b42d-b9f043e035ec')
INSERT [dbo].[LoginModel] ([IdLogin], [Password], [FechaIngresoExitoso], [IdEmpleado]) VALUES (N'2ec27484-5ad5-4802-b88a-3bb814ac1dc5', N'1234Poli', NULL, N'd75a03e2-e864-44c3-b512-d49902e476a5')
INSERT [dbo].[LoginModel] ([IdLogin], [Password], [FechaIngresoExitoso], [IdEmpleado]) VALUES (N'82ec19a4-edc1-4317-9ce5-533f3773715c', N'1234Poli', NULL, N'6b6f7613-5256-4a69-ba43-9617b4899d82')
INSERT [dbo].[LoginModel] ([IdLogin], [Password], [FechaIngresoExitoso], [IdEmpleado]) VALUES (N'be3bf973-09bd-4f95-93e1-57bb9c82b776', N'1234Poli', NULL, N'86887497-11ef-46ed-a116-96301bc60ed4')
INSERT [dbo].[LoginModel] ([IdLogin], [Password], [FechaIngresoExitoso], [IdEmpleado]) VALUES (N'9804e774-bd43-4f62-86f0-69bd737db856', N'1234Poli', NULL, N'c6a1c64c-337b-447b-9c02-706738573799')
INSERT [dbo].[LoginModel] ([IdLogin], [Password], [FechaIngresoExitoso], [IdEmpleado]) VALUES (N'4f487f01-7d57-4209-9ceb-755383293905', N'1234Poli', NULL, N'568054a5-0e59-4a50-a235-88e57e846695')
INSERT [dbo].[LoginModel] ([IdLogin], [Password], [FechaIngresoExitoso], [IdEmpleado]) VALUES (N'4725d042-2f2e-49e8-9f63-78beab2d0a81', N'1234Poli', NULL, N'aac4c5cf-a201-4cbe-aa74-5fcfe530a22f')
INSERT [dbo].[LoginModel] ([IdLogin], [Password], [FechaIngresoExitoso], [IdEmpleado]) VALUES (N'876d53bd-997e-4e03-b156-8e306648d93e', N'1234Poli', NULL, N'9f016556-3d28-4d07-a9bd-6d72d9697d2a')
INSERT [dbo].[LoginModel] ([IdLogin], [Password], [FechaIngresoExitoso], [IdEmpleado]) VALUES (N'6585eba7-26c0-48eb-8c4b-a298aa85e7d2', N'1234Poli', NULL, N'950d4fb5-9cc1-4734-a596-e8374ddc0c1d')
INSERT [dbo].[LoginModel] ([IdLogin], [Password], [FechaIngresoExitoso], [IdEmpleado]) VALUES (N'8e7c95e5-45c5-46a9-a41b-aa01700124cc', N'1234Poli', NULL, N'4d433f38-2e24-4157-b1f8-2b39d1ca42f8')
INSERT [dbo].[LoginModel] ([IdLogin], [Password], [FechaIngresoExitoso], [IdEmpleado]) VALUES (N'854097ab-19d4-4c57-9357-ba3ff6e0d90d', N'1234Poli', NULL, N'fb47ecf6-ed8e-4e2b-b801-0537d00d96f1')
INSERT [dbo].[LoginModel] ([IdLogin], [Password], [FechaIngresoExitoso], [IdEmpleado]) VALUES (N'71ee420b-7f03-4903-a07b-bd7b07f965ea', N'1234Poli', NULL, N'bed1bb83-152b-422b-80c9-e28a7a3bd1ea')
INSERT [dbo].[LoginModel] ([IdLogin], [Password], [FechaIngresoExitoso], [IdEmpleado]) VALUES (N'8f96db33-844e-47c9-bc86-c40c5a530bff', N'1234Poli', NULL, N'e27a3b8a-d4e9-460c-a16b-044095b21c3a')
INSERT [dbo].[LoginModel] ([IdLogin], [Password], [FechaIngresoExitoso], [IdEmpleado]) VALUES (N'804d34f3-82f6-41df-99a3-c615a7eef387', N'1234Poli', NULL, N'fb1e9b3d-2880-452e-8040-c18da82e53c7')
INSERT [dbo].[LoginModel] ([IdLogin], [Password], [FechaIngresoExitoso], [IdEmpleado]) VALUES (N'733da8c6-df20-4b33-8e51-d56cbab3e0f0', N'1234Poli', NULL, N'b60d249e-b949-4375-9bf1-20d86dd73e3f')
INSERT [dbo].[LoginModel] ([IdLogin], [Password], [FechaIngresoExitoso], [IdEmpleado]) VALUES (N'2fd2d0c9-e2cf-45b3-b378-d95a436d4f7f', N'1234Poli', NULL, N'8cd318f2-ecc7-40f5-9e5e-23b60d9c3612')
INSERT [dbo].[LoginModel] ([IdLogin], [Password], [FechaIngresoExitoso], [IdEmpleado]) VALUES (N'9c3d7db5-4ce4-4cd7-9c4b-e1197a1a2a21', N'1234Poli', NULL, N'56742b22-3730-4295-81e6-196b5891386b')
GO
INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Descripcion], [Precio], [Cantidad], [IdProveedor], [IdBodega], [Activo]) VALUES (N'19e90549-749f-4aa6-b11b-04c42c7a91ad', N'Bolsa Plástica Grande', N'Bolsa con asas para productos pesados', CAST(300 AS Decimal(18, 0)), 1000, N'98937e1c-eb67-4cf1-a684-9be2b21b0f6c', 2, 1)
INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Descripcion], [Precio], [Cantidad], [IdProveedor], [IdBodega], [Activo]) VALUES (N'0d880b1d-a582-4d8b-b6ce-091159315d07', N'Carpeta Plástica', N'Carpeta tipo sobre con botón', CAST(2000 AS Decimal(18, 0)), 200, N'dea1d56c-4c2f-4e19-8ff6-a3e8c11096af', 2, 1)
INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Descripcion], [Precio], [Cantidad], [IdProveedor], [IdBodega], [Activo]) VALUES (N'b6dcde44-efd6-42b7-b94a-0a0d790df067', N'Botella de Vidrio 1L', N'Botella de vidrio reciclable con tapa', CAST(3500 AS Decimal(18, 0)), 200, N'dea1d56c-4c2f-4e19-8ff6-a3e8c11096af', 2, 1)
INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Descripcion], [Precio], [Cantidad], [IdProveedor], [IdBodega], [Activo]) VALUES (N'001a4d8c-7284-4ddc-a9a8-280290186fa8', N'Envase de Aluminio 1L', N'Envase térmico con tapa de presión', CAST(4200 AS Decimal(18, 0)), 150, N'dea1d56c-4c2f-4e19-8ff6-a3e8c11096af', 2, 0)
INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Descripcion], [Precio], [Cantidad], [IdProveedor], [IdBodega], [Activo]) VALUES (N'2da5fd54-c457-4fde-8b0a-288efba2161c', N'Corrector Líquido', N'Corrector blanco líquido con brocha', CAST(2500 AS Decimal(18, 0)), 150, N'991ea8ef-5a13-45b8-8ac3-581177ab7f1b', 2, 1)
INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Descripcion], [Precio], [Cantidad], [IdProveedor], [IdBodega], [Activo]) VALUES (N'61afeddd-eee4-49ea-b93c-29ae01f11a2b', N'Caja de Cartón Mediana', N'Caja corrugada para empaque', CAST(1800 AS Decimal(18, 0)), 100, N'991ea8ef-5a13-45b8-8ac3-581177ab7f1b', 1, 1)
INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Descripcion], [Precio], [Cantidad], [IdProveedor], [IdBodega], [Activo]) VALUES (N'143ebba6-6da6-4990-be6a-2c1900696478', N'Botella Deportiva 750ml', N'Botella reutilizable con boquilla', CAST(5000 AS Decimal(18, 0)), 120, N'991ea8ef-5a13-45b8-8ac3-581177ab7f1b', 2, 1)
INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Descripcion], [Precio], [Cantidad], [IdProveedor], [IdBodega], [Activo]) VALUES (N'43c8835a-cdf9-479a-807e-4662c68844dc', N'Resma de Papel Carta', N'Papel blanco tamaño carta 75g', CAST(15000 AS Decimal(18, 0)), 50, N'dea1d56c-4c2f-4e19-8ff6-a3e8c11096af', 1, 1)
INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Descripcion], [Precio], [Cantidad], [IdProveedor], [IdBodega], [Activo]) VALUES (N'0069b127-d346-4dde-bb61-99363ac84936', N'Esfero Azul', N'Esfero tinta azul marca económica', CAST(800 AS Decimal(18, 0)), 500, N'98937e1c-eb67-4cf1-a684-9be2b21b0f6c', 2, 1)
INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Descripcion], [Precio], [Cantidad], [IdProveedor], [IdBodega], [Activo]) VALUES (N'1fe27e89-f310-495f-b3b6-a20101d80e44', N'Envase para Comida 750ml', N'Envase plástico para alimentos', CAST(1100 AS Decimal(18, 0)), 500, N'98937e1c-eb67-4cf1-a684-9be2b21b0f6c', 1, 1)
INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Descripcion], [Precio], [Cantidad], [IdProveedor], [IdBodega], [Activo]) VALUES (N'8c865bd7-543f-4450-a5c5-a679c3d39a4e', N'Caja de Plástico Organizador', N'Caja con compartimientos internos', CAST(8500 AS Decimal(18, 0)), 80, N'dea1d56c-4c2f-4e19-8ff6-a3e8c11096af', 2, 1)
INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Descripcion], [Precio], [Cantidad], [IdProveedor], [IdBodega], [Activo]) VALUES (N'd3280e9e-5839-4c45-b78e-a6825a935090', N'Bloc de Notas Adhesivas', N'Post-it 3x3 de colores', CAST(4000 AS Decimal(18, 0)), 90, N'dea1d56c-4c2f-4e19-8ff6-a3e8c11096af', 2, 1)
INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Descripcion], [Precio], [Cantidad], [IdProveedor], [IdBodega], [Activo]) VALUES (N'7af0cfce-24c7-4fa8-adc2-b1c137be30b4', N'Tijeras Escolares', N'Tijeras punta redonda', CAST(3500 AS Decimal(18, 0)), 75, N'98937e1c-eb67-4cf1-a684-9be2b21b0f6c', 2, 1)
INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Descripcion], [Precio], [Cantidad], [IdProveedor], [IdBodega], [Activo]) VALUES (N'00e5cd87-2789-469d-9f08-bf69823469b1', N'Bolsa Kraft', N'Bolsa ecológica de papel kraft', CAST(1000 AS Decimal(18, 0)), 600, N'991ea8ef-5a13-45b8-8ac3-581177ab7f1b', 1, 1)
INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Descripcion], [Precio], [Cantidad], [IdProveedor], [IdBodega], [Activo]) VALUES (N'321fd11d-3632-4b78-bb64-c52af5beef04', N'Regla 30 cm', N'Regla plástica de 30 centímetros', CAST(1200 AS Decimal(18, 0)), 100, N'991ea8ef-5a13-45b8-8ac3-581177ab7f1b', 1, 0)
INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Descripcion], [Precio], [Cantidad], [IdProveedor], [IdBodega], [Activo]) VALUES (N'299c789b-4da7-46b5-bec5-c8749c08585a', N'Cuaderno Profesional', N'Cuaderno de 100 hojas con espiral', CAST(4500 AS Decimal(18, 0)), 120, N'98937e1c-eb67-4cf1-a684-9be2b21b0f6c', 1, 1)
INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Descripcion], [Precio], [Cantidad], [IdProveedor], [IdBodega], [Activo]) VALUES (N'5ed775d2-0913-48a5-b587-cc297171e15a', N'Borrador Blanco', N'Borrador blanco para lápiz', CAST(500 AS Decimal(18, 0)), 300, N'98937e1c-eb67-4cf1-a684-9be2b21b0f6c', 1, 1)
INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Descripcion], [Precio], [Cantidad], [IdProveedor], [IdBodega], [Activo]) VALUES (N'9e14167a-29fc-45e7-a7a9-cf0ab0e35ff2', N'Marcadores de Colores', N'Set de 6 marcadores colores surtidos', CAST(6000 AS Decimal(18, 0)), 60, N'dea1d56c-4c2f-4e19-8ff6-a3e8c11096af', 1, 1)
INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Descripcion], [Precio], [Cantidad], [IdProveedor], [IdBodega], [Activo]) VALUES (N'88491e6e-ce77-48e0-b94f-cfd85bc5a095', N'Tapa Plástica Roja', N'Tapa rosca estándar para botellas', CAST(200 AS Decimal(18, 0)), 800, N'98937e1c-eb67-4cf1-a684-9be2b21b0f6c', 1, 1)
INSERT [dbo].[Producto] ([IdProducto], [Nombre], [Descripcion], [Precio], [Cantidad], [IdProveedor], [IdBodega], [Activo]) VALUES (N'09b370ff-0eba-47a3-9435-dcb562c54cde', N'Envase Plástico 500ml', N'Envase transparente con tapa rosca', CAST(900 AS Decimal(18, 0)), 400, N'991ea8ef-5a13-45b8-8ac3-581177ab7f1b', 1, 1)
GO
INSERT [dbo].[Proveedor] ([IdProveedor], [Nombre], [Contacto], [Telefono], [Email], [Direccion], [FechaRegistro]) VALUES (N'0e8350d5-5c03-4eea-a219-1f675f7ce3b0', N'Soluciones Médicas Integrales', N'Andrés Pérez', N'3206660006', N'proveedores@solmed.com', N'Carrera 7 #60-40', CAST(N'2025-07-28T20:45:32.777' AS DateTime))
INSERT [dbo].[Proveedor] ([IdProveedor], [Nombre], [Contacto], [Telefono], [Email], [Direccion], [FechaRegistro]) VALUES (N'01829c81-1b6a-479f-840a-3f6926e02874', N'Distribuciones del Norte Ltda', N'Carlos Rodríguez', N'3102220002', N'ventas@distribucionesnorte.com', N'Carrera 8 #21-34', CAST(N'2025-07-28T20:45:32.777' AS DateTime))
INSERT [dbo].[Proveedor] ([IdProveedor], [Nombre], [Contacto], [Telefono], [Email], [Direccion], [FechaRegistro]) VALUES (N'fe71ba57-b896-4929-88c7-4597515fe90c', N'Tecnologías y Redes', N'Felipe Gómez', N'3004440004', N'servicio@tyrtech.com', N'Diagonal 50 #10-15', CAST(N'2025-07-28T20:45:32.777' AS DateTime))
INSERT [dbo].[Proveedor] ([IdProveedor], [Nombre], [Contacto], [Telefono], [Email], [Direccion], [FechaRegistro]) VALUES (N'e775d94f-3090-4311-8472-51d4c50d8e16', N'EcoEnvases SAS', N'Luis Suárez', N'3000000010', N'contacto@ecoenvases.com', N'Calle 100 #30-10', CAST(N'2025-07-28T20:45:32.777' AS DateTime))
INSERT [dbo].[Proveedor] ([IdProveedor], [Nombre], [Contacto], [Telefono], [Email], [Direccion], [FechaRegistro]) VALUES (N'991ea8ef-5a13-45b8-8ac3-581177ab7f1b', N'Logística Ágil SAS', N'Paola Ramírez', N'3007770007', N'logistica@agilsas.com', N'Calle 80 #25-90', CAST(N'2025-07-28T20:45:32.777' AS DateTime))
INSERT [dbo].[Proveedor] ([IdProveedor], [Nombre], [Contacto], [Telefono], [Email], [Direccion], [FechaRegistro]) VALUES (N'98937e1c-eb67-4cf1-a684-9be2b21b0f6c', N'Papelería Express', N'Ana Torres', N'3203330003', N'info@papeleriaexpress.com', N'Av. 19 #100-20', CAST(N'2025-07-28T20:45:32.777' AS DateTime))
INSERT [dbo].[Proveedor] ([IdProveedor], [Nombre], [Contacto], [Telefono], [Email], [Direccion], [FechaRegistro]) VALUES (N'da5a9f6c-67bc-43ce-99bc-9c5789270fe5', N'Alimentos del Campo', N'María Fernanda Ríos', N'3105550005', N'contacto@alimentoscampo.com', N'Calle 33 #55-77', CAST(N'2025-07-28T20:45:32.777' AS DateTime))
INSERT [dbo].[Proveedor] ([IdProveedor], [Nombre], [Contacto], [Telefono], [Email], [Direccion], [FechaRegistro]) VALUES (N'dea1d56c-4c2f-4e19-8ff6-a3e8c11096af', N'OfiProveedores Ltda', N'Camila Mejía', N'3209990009', N'cm@ofiproveedores.com', N'Carrera 15 #45-20', CAST(N'2025-07-28T20:45:32.777' AS DateTime))
INSERT [dbo].[Proveedor] ([IdProveedor], [Nombre], [Contacto], [Telefono], [Email], [Direccion], [FechaRegistro]) VALUES (N'6402cc6c-8d84-458a-8ae3-e0cb4de9aa97', N'Suministros Globales S.A.S', N'Laura Martínez', N'3001110001', N'contacto@suministrosglobales.com', N'Calle 12 #45-67', CAST(N'2025-07-28T20:45:32.777' AS DateTime))
INSERT [dbo].[Proveedor] ([IdProveedor], [Nombre], [Contacto], [Telefono], [Email], [Direccion], [FechaRegistro]) VALUES (N'a3b933fc-eb53-4d0b-99ea-ed0231dbc40e', N'ConstruRed S.A.', N'Jorge Castro', N'3108880008', N'jorge.castro@construred.com', N'Transversal 23 #12-34', CAST(N'2025-07-28T20:45:32.777' AS DateTime))
GO
ALTER TABLE [dbo].[DetalleEntrega]  WITH CHECK ADD  CONSTRAINT [FK_DetalleEntrega_ProcesoEntrega] FOREIGN KEY([IdEntrega])
REFERENCES [dbo].[ProcesoEntrega] ([IdEntrega])
GO
ALTER TABLE [dbo].[DetalleEntrega] CHECK CONSTRAINT [FK_DetalleEntrega_ProcesoEntrega]
GO
ALTER TABLE [dbo].[DetalleEntrega]  WITH CHECK ADD  CONSTRAINT [FK_DetalleEntrega_Venta] FOREIGN KEY([IdVenta])
REFERENCES [dbo].[Venta] ([IdVenta])
GO
ALTER TABLE [dbo].[DetalleEntrega] CHECK CONSTRAINT [FK_DetalleEntrega_Venta]
GO
ALTER TABLE [dbo].[DetalleVenta]  WITH CHECK ADD  CONSTRAINT [FK_DetalleVenta_Producto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([IdProducto])
GO
ALTER TABLE [dbo].[DetalleVenta] CHECK CONSTRAINT [FK_DetalleVenta_Producto]
GO
ALTER TABLE [dbo].[DetalleVenta]  WITH CHECK ADD  CONSTRAINT [FK_DetalleVenta_Venta] FOREIGN KEY([IdVenta])
REFERENCES [dbo].[Venta] ([IdVenta])
GO
ALTER TABLE [dbo].[DetalleVenta] CHECK CONSTRAINT [FK_DetalleVenta_Venta]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Bodega] FOREIGN KEY([IdBodega])
REFERENCES [dbo].[Bodega] ([IdBodega])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Bodega]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Proveedor] FOREIGN KEY([IdProveedor])
REFERENCES [dbo].[Proveedor] ([IdProveedor])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Proveedor]
GO
ALTER TABLE [dbo].[SolicitudProducto]  WITH CHECK ADD  CONSTRAINT [FK_SolicitudProducto_Producto] FOREIGN KEY([IdProducto])
REFERENCES [dbo].[Producto] ([IdProducto])
GO
ALTER TABLE [dbo].[SolicitudProducto] CHECK CONSTRAINT [FK_SolicitudProducto_Producto]
GO
ALTER TABLE [dbo].[Tarea]  WITH CHECK ADD  CONSTRAINT [FK_Tarea_Empleado] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleado] ([IdEmpleado])
GO
ALTER TABLE [dbo].[Tarea] CHECK CONSTRAINT [FK_Tarea_Empleado]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Cliente]
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_Empleado] FOREIGN KEY([IdEmpleado])
REFERENCES [dbo].[Empleado] ([IdEmpleado])
GO
ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_Empleado]
GO
/****** Object:  StoredProcedure [dbo].[SP_Consultar_Clientes_Disponibles]    Script Date: 29/07/2025 9:47:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Consultar_Clientes_Disponibles] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT * FROM Cliente C 
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Consultar_Productos_Disponibles]    Script Date: 29/07/2025 9:47:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Consultar_Productos_Disponibles] 
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Producto P WITH(NOLOCK) WHERE P.Activo = 1
END
GO
/****** Object:  StoredProcedure [dbo].[SP_Consultar_ProveedorXIdProducto]    Script Date: 29/07/2025 9:47:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Consultar_ProveedorXIdProducto] 
	-- Add the parameters for the stored procedure here
	@IdProducto UNIQUEIDENTIFIER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Proveedor Pv
	INNER JOIN Producto Pd ON Pv.IdProveedor = Pd.IdProveedor
	WHERE Pd.IdProducto = @IdProducto

END
GO
/****** Object:  StoredProcedure [dbo].[SP_Habilitar_Empleado_Vendedor]    Script Date: 29/07/2025 9:47:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Habilitar_Empleado_Vendedor]
	-- Add the parameters for the stored procedure here
	@IdEmpleado UNIQUEIDENTIFIER = NULL,
	@Activo BIT = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	UPDATE Empleado SET Activo = @Activo WHERE IdEmpleado = @IdEmpleado
END
GO
/****** Object:  StoredProcedure [dbo].[SP_IniciarSesion]    Script Date: 29/07/2025 9:47:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_IniciarSesion]
	-- Add the parameters for the stored procedure here
	@Email VARCHAR(100),
	@Password VARCHAR(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * FROM Empleado E
		INNER JOIN LoginModel LM ON E.IdEmpleado = LM.IdEmpleado
		WHERE Email = @Email AND LM.Password = @Password
END
GO
