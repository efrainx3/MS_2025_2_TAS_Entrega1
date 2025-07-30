using Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Helper
{
    public class DataFake
    {
        #region [ Propiedades ]
        public static DataFake Datos
        {
            get
            {
                if (_instance == null)
                {
                    _instance = new DataFake();
                    InicializarDatos();
                }
                return _instance;
            }
        }

        private static DataFake _instance;

        private static List<Bodega> Bodegas { get; set; }

        private static List<Cliente> Clientes { get; set; }

        private static List<Producto> Productos { get; set; }

        private static List<Proveedor> Proveedores { get; set; }

        private static List<SolicitudProducto> SolicitudProductos { get; set; }

        private static List<Venta> Ventas { get; set; }

        private static List<DetalleEntrega> DetalleEntregas { get; set; }

        private static List<DetalleVenta> DetalleVentas { get; set; }

        private static List<ProcesoEntrega> ProcesoEntregas { get; set; }


        private static List<Empleado> Empleados { get; set; } = new List<Empleado>();
        private static List<Tarea> Tareas { get; set; } = new List<Tarea>();
        private static void InicializarDatos()
        {
            // Bodegas
            Bodegas = new List<Bodega>
            {
                new Bodega { IdBodega = 1, Nombre = "Bodega Central", Direccion = "Av. Principal 123", Activa = true, TamanoMetros2 = 500 },
                new Bodega { IdBodega = 2, Nombre = "Bodega Norte", Direccion = "Calle 45 #67-89", Activa = true, TamanoMetros2 = 300 }
            };

            // Proveedores (necesario para Productos)
            Proveedores = new List<Proveedor>
            {
                new Proveedor { IdProveedor = Guid.NewGuid(), Nombre = "Proveedor Uno", Contacto = "Carlos Ruiz", Telefono = "3001234567", Email = "proveedor1@email.com", Direccion = "Cra 10 #20-30", FechaRegistro = DateTime.Now.AddMonths(-6) },
                new Proveedor { IdProveedor = Guid.NewGuid(), Nombre = "Proveedor Dos", Contacto = "Ana Torres", Telefono = "3019876543", Email = "proveedor2@email.com", Direccion = "Av. 5 #15-25", FechaRegistro = DateTime.Now.AddMonths(-12) }
            };

            // Productos
            Productos = new List<Producto>
            {
                new Producto { IdProducto = Guid.NewGuid(), Nombre = "Laptop", Descripcion = "Laptop de alto rendimiento", Precio = 3500.00m, Cantidad = 10, IdBodega = Bodegas[0], Activo = true, IdProveedor = Proveedores[0] },
                new Producto { IdProducto = Guid.NewGuid(), Nombre = "Mouse", Descripcion = "Mouse inalámbrico", Precio = 50.00m, Cantidad = 100, IdBodega = Bodegas[1], Activo = true, IdProveedor = Proveedores[1] }
            };

            // Clientes
            Clientes = new List<Cliente>
            {
                new Cliente { IdCliente = Guid.NewGuid(), TipoCliente = TipoCliente.PersonaNatural, TipoIdentificacion = "CC", NumeroIdentificacion = "123456789", Nombres = "Pedro Gómez" },
                new Cliente { IdCliente = Guid.NewGuid(), TipoCliente = TipoCliente.PersonaJuridica, TipoIdentificacion = "NIT", NumeroIdentificacion = "900123456", Nombres = "Empresa XYZ S.A.S." }
            };

            // Empleados
            Empleados = new List<Empleado>
            {
                new Empleado { IdEmpleado = Guid.NewGuid(), Nombres = "Juan Perez", FechaContratacion = DateTime.Now.AddYears(-1), Activo = true },
                new Empleado { IdEmpleado = Guid.NewGuid(), Nombres = "Maria Lopez", FechaContratacion = DateTime.Now.AddYears(-2), Activo = false }
            };

            // Tareas
            Tareas = new List<Tarea>
            {
                new Tarea { IdTarea = Guid.NewGuid(), Descripcion = "Tarea 1", FechaCreacion = DateTime.Now, FechaVencimiento = DateTime.Now.AddDays(5), Completada = false, IdEmpleado = Empleados[0] },
                new Tarea { IdTarea = Guid.NewGuid(), Descripcion = "Tarea 2", FechaCreacion = DateTime.Now, FechaVencimiento = DateTime.Now.AddDays(10), Completada = true, IdEmpleado = Empleados[1] }
            };
        }

        #endregion

        
    }
}
