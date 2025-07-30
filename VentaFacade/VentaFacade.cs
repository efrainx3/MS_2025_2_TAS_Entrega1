namespace VentaFacade
{
    public class VentaFacade
    {
        #region [Propiedades]
        // Aquí puedes definir las propiedades necesarias para la clase BodegaFacade
        #endregion
        #region [Constructor]
        public VentaFacade()
        {
            // Inicialización de la clase, si es necesario
        }
        #endregion
        #region [Métodos]

        public bool CrearVenta(Entities.Venta venta)
        {
            VentaBL.VentaBL ventaBL = new VentaBL.VentaBL();
            return ventaBL.CrearVenta(venta);
        }

        public bool FacturarVenta(Entities.Venta venta)
        {
            VentaBL.VentaBL ventaBL = new VentaBL.VentaBL();
            if (ventaBL.FacturarVenta(venta))
            {

                return true;
            }
            else
            {
                return false;
            }
        }

        #endregion
    }
}
