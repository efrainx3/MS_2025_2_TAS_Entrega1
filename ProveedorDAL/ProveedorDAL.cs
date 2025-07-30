using Dapper;
using Entities;
using UtilidadesDAL;

namespace ProveedorDAL
{
    public class ProveedorDAL : BaseDAL
    {
        #region [Propiedades]
        // Aquí puedes definir las propiedades necesarias para la clase ProveedorDAL
        #endregion
        #region [Constructor]
        public ProveedorDAL()
        {
            // Inicialización de la clase, si es necesario
        }
        #endregion
        #region [Métodos]

        public Entities.Proveedor ConsultarProveedorXIdProducto(Guid idProducto)
        {
            Entities.Proveedor proveedor = new Entities.Proveedor();
            var param = new { IdProducto = idProducto };
            using (var conn = ObtenerConexion())
            {
                proveedor = conn.Query<Entities.Proveedor>("SP_Consultar_ProveedorXIdProducto", param, commandType: System.Data.CommandType.StoredProcedure).FirstOrDefault();
            }
            return proveedor;
        }
        #endregion
    }
}
