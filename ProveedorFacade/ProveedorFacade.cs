namespace ProveedorFacade
{
    public class ProveedorFacade
    {
        #region [Propiedades]
        // Aquí puedes definir las propiedades necesarias para la clase ProveedorFacade
        #endregion
        #region [Constructor]
        public ProveedorFacade()
        {
            // Inicialización de la clase, si es necesario
        }
        #endregion
        #region [Métodos]
        public Entities.Proveedor ConsultarProveedorXIdProducto(Guid idProducto)
        {
            ProveedorBL.ProveedorBL proveedorDAL = new ProveedorBL.ProveedorBL();
            return proveedorDAL.ConsultarProveedorXIdProducto(idProducto);
        }
        #endregion
    }
}
