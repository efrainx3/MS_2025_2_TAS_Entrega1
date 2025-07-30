using Dapper;
using Entities;
using UtilidadesDAL;

namespace ClienteDAL
{
    public class ClienteDAL : BaseDAL
    {
        #region [Propiedades]

        #endregion

        #region [Constructor]
        public ClienteDAL()
        {

        }
        #endregion

        #region [Métodos]

        public List<Cliente> ConsultarClientesDisponibles()
        {
            List<Entities.Cliente> lstClientes = new List<Entities.Cliente>();
            using (var
                conn = ObtenerConexion())
            {
                lstClientes = conn.Query<Entities.Cliente>("SP_Consultar_Clientes_Disponibles", commandType: System.Data.CommandType.StoredProcedure).ToList();
            }
            return lstClientes;
        }

        public bool CrearCliente(Entities.Cliente cliente)
        {
            bool resultado = false;
            var param = new { cliente.Apellidos, cliente.Email, cliente.Nombres, cliente.NumeroIdentificacion, cliente.Telefono, cliente.TipoCliente, cliente.TipoIdentificacion };
            using (var conn = ObtenerConexion())
            {
                resultado = conn.Execute("SP_Crear_Cliente", param, commandType: System.Data.CommandType.StoredProcedure) > 0;
            }
            return resultado;
        }
        #endregion
    }
}
