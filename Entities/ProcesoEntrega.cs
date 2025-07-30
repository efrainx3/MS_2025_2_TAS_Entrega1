using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class ProcesoEntrega
    {
        #region [Propiedades]
        public Guid IdEntrega { get; set; }

        public string PlacaVehiculo { get; set; }

        public DateTime FechaHoraInicio { get; set; }

        public DateTime? FechaHoraFin { get; set; }  

        public List<DetalleEntrega> LstDetalleEntrega { get; set; } = new List<DetalleEntrega>();

        #endregion
        #region [Constructores]
        public ProcesoEntrega()
        {
            IdEntrega = Guid.NewGuid();
            FechaHoraFin = null; // Inicialmente no hay fecha de fin
            FechaHoraInicio = DateTime.Now;
        }
        #endregion
    }
}
