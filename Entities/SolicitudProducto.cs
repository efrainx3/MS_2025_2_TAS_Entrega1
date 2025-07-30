using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class SolicitudProducto
    {
        #region [Propiedades]
        public Guid IdSolicitudProducto { get; set; }
        public DateTime FechaSolicitud { get; set; }
        public string Descripcion { get; set; }
        public Empleado IdEmpleado { get; set; }
        public List<Producto> LstProductos { get; set; } = new List<Producto>();
        #endregion
        #region [Constructores]
        public SolicitudProducto(Empleado empleado)
        {
            IdSolicitudProducto = Guid.NewGuid();
            FechaSolicitud = DateTime.Now;
            IdEmpleado = empleado ?? throw new ArgumentNullException(nameof(empleado), "El empleado no puede ser nulo.");
            LstProductos = new List<Producto>();
        }
        #endregion
    }
}
