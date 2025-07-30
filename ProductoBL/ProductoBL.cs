using Entities;

namespace ProductoBL
{
    public class ProductoBL
    {
        #region [Propiedades]
        // Aquí puedes definir las propiedades necesarias para la clase ProductoBL
        #endregion
        #region [Constructor]
        public ProductoBL()
        {
            // Inicialización de la clase, si es necesario
        }
        #endregion
        #region [Métodos]

        public List<Producto> ConsultarProductosDisponibles()
        {
            ProductoDAL.ProductoDAL ProductoDAL = new ProductoDAL.ProductoDAL();
            return ProductoDAL.ConsultarProductosDisponibles();
        }

        public bool ActualizarStockPorVenta(Entities.Venta venta)
        {
            ProductoDAL.ProductoDAL ProductoDAL = new ProductoDAL.ProductoDAL();
            return ProductoDAL.ActualizarStockPorVenta(venta);
        }

        public bool SolicitarStock(Guid idEmpleado, Entities.Producto producto)
        {
            ProductoDAL.ProductoDAL ProductoDAL = new ProductoDAL.ProductoDAL();
            return ProductoDAL.SolicitarStock(idEmpleado, producto);
        }

        #endregion
    }
}
