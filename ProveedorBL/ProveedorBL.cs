using ProveedorDAL;

namespace ProveedorBL
{
    public class ProveedorBL
    {
        #region [Propiedades]

        #endregion
        #region [Constructor]
        public ProveedorBL()
        {
            
        }
        #endregion
        #region [Métodos]
        
        public Entities.Proveedor ConsultarProveedorXIdProducto(Guid idProducto)
        {
            ProveedorDAL.ProveedorDAL proveedorDAL = new ProveedorDAL.ProveedorDAL();
            return proveedorDAL.ConsultarProveedorXIdProducto(idProducto);
        }

        #endregion
    }
}
