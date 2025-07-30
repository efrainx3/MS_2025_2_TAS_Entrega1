using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using VentaDAL;

namespace VentaBL
{
    public class DetalleVentaBL
    {
        #region [Propiedades]
        // Aquí puedes definir las propiedades necesarias para la clase DetalleVentaBL
        #endregion
        #region [Constructor]
        public DetalleVentaBL()
        {
            // Inicialización de la clase, si es necesario
        }
        #endregion
        #region [Métodos]
        public bool CrearDetallesVenta(Entities.Venta venta)
        {
            DetalleVentaDAL detalleVentaDAL = new DetalleVentaDAL();
            return detalleVentaDAL.CrearDetalleVenta(venta);
        }
        #endregion
    }
}
