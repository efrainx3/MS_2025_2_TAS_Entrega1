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

        #endregion
    }
}
