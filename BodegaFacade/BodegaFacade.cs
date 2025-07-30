namespace BodegaFacade
{
    public class BodegaFacade
    {
        #region [Propiedades]
        // Aquí puedes definir las propiedades necesarias para la clase BodegaFacade
        #endregion
        #region [Constructor]
        public BodegaFacade()
        {
            // Inicialización de la clase, si es necesario
        }
        #endregion
        #region [Métodos]

        public List<Entities.Producto> ConsultarProductosDisponibles()
        {
            ProductoBL.ProductoBL ProductoBL = new ProductoBL.ProductoBL();
            return ProductoBL.ConsultarProductosDisponibles();
        }

        public bool ActualizarStockPorVenta()
        {
            ProductoBL.ProductoBL ProductoBL = new ProductoBL.ProductoBL();
            return ProductoBL.ConsultarProductosDisponibles();
        }

        #endregion
    }
}
