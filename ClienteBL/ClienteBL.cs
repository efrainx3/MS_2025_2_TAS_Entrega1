using Entities;

namespace ClienteBL
{
    public class ClienteBL
    {
        #region [Propiedades]
        // Aquí puedes definir las propiedades necesarias para la clase ClienteBL
        #endregion
        #region [Constructor]
        public ClienteBL()
        {
            // Inicialización de la clase, si es necesario
        }
        #endregion
        #region [Métodos]
        // Aquí puedes definir los métodos necesarios para la clase ClienteBL
        public List<Cliente> ConsultarClientesDisponibles()
        {
            ClienteDAL.ClienteDAL ClienteDAL = new ClienteDAL.ClienteDAL();
            return ClienteDAL.ConsultarClientesDisponibles();
        }
        #endregion
    }
}
