using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class Venta
    {   
        #region [Propiedades]
        public Guid IdVenta { get; set; }
        public DateTime FechaVenta { get; set; }
        public decimal ValorTotal { get; set; }
        public Empleado IdEmpleado { get; set; }
        public Cliente IdCliente { get; set; }
        public List<DetalleVenta> LstDetallVenta { get; set; } = new List<DetalleVenta>();
        public EstadoVenta EstadoVenta { get; set; }
        #endregion
        #region [Constructores]
        public Venta(Empleado empleado, Cliente cliente)
        {
            IdVenta = Guid.NewGuid();
            FechaVenta = DateTime.Now;
            EstadoVenta = EstadoVenta.EnEspera;
            IdEmpleado = empleado ?? throw new ArgumentNullException(nameof(empleado), "El empleado no puede ser nulo.");
            IdCliente = cliente ?? throw new ArgumentNullException(nameof(cliente), "El cliente no puede ser nulo.");
            LstDetallVenta = new List<DetalleVenta>();
        }
        #endregion
    }
}
