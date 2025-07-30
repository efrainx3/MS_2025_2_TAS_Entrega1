namespace AdministrativoFacade
{
    public class ClienteFacade
    {
        #region [Propiedades]
        // Aquí puedes definir las propiedades necesarias para la clase ClienteFacade
        #endregion
        #region [Constructor]
        public ClienteFacade()
        {
            // Inicialización de la clase, si es necesario
        }
        #endregion
        #region [Métodos]
        /// <summary>
        /// Obtiene todos los clientes disponibles
        /// </summary>
        /// <returns>Lista de clientes</returns>
        public List<Entities.Cliente> ConsultarClientesDisponibles()
        {
            ClienteBL.ClienteBL clienteBL = new ClienteBL.ClienteBL();
            return clienteBL.ConsultarClientesDisponibles();
        }
        #endregion
    }
}
