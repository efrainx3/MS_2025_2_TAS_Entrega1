using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class DetalleEntrega
    {
        #region [Propiedades]
        public Guid IdDetalleEntrega { get; set; }
        public Guid IdEntrega { get; set; }
        public Guid IdVenta { get; set; }
        public DateTime? FechaEntrega { get; set; }
        public string DireccionEntrega { get; set; }
        public bool Entregado { get; set; }

        #endregion
        #region [Constructores]
        public DetalleEntrega()
        {
            IdDetalleEntrega = Guid.NewGuid();
            FechaEntrega = null; // Inicialmente no hay fecha de entrega
            Entregado = false; // Estado inicial por defecto
        }
        #endregion
    }
}
