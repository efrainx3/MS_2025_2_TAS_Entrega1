using Entities;

namespace VentaBL
{
    public class VentaBL
    {
        #region [Propiedades]
        // Aquí puedes definir las propiedades necesarias para la clase ProductoBL
        #endregion
        #region [Constructor]
        public VentaBL()
        {
            // Inicialización de la clase, si es necesario
        }
        #endregion
        #region [Métodos]

        public bool CrearVenta(Venta venta)
        {
            VentaDAL.VentaDAL ventaDAL = new VentaDAL.VentaDAL();
            if (ventaDAL.CrearVenta(venta))
            {
                DetalleVentaBL detalleVentaBL = new DetalleVentaBL();
                return detalleVentaBL.CrearDetallesVenta(venta);
            }
            else
            {
                return false;
            }
        }

        public bool FacturarVenta(Venta venta)
        {
            VentaDAL.VentaDAL ventaDAL = new VentaDAL.VentaDAL();
            return ventaDAL.FacturarVenta(venta);
        }

        #endregion
    }
}
