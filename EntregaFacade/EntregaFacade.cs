namespace EntregaFacade
{
    public class EntregaFacade
    {
        #region [Propiedades]
        // Aquí puedes definir las propiedades necesarias para la clase BodegaFacade
        #endregion
        #region [Constructor]
        public EntregaFacade()
        {
            // Inicialización de la clase, si es necesario
        }
        #endregion
        #region [Métodos]

        public bool CrearRegistroEnvio(Entities.DetalleEntrega entrega)
        {
            EntregaBL.EntregaBL EntregaBL = new EntregaBL.EntregaBL();
            return EntregaBL.CrearRegistroEnvio(entrega);
        }

        public bool ActualizarEstadoEnvio(Entities.DetalleEntrega entrega)
        {
            EntregaBL.EntregaBL EntregaBL = new EntregaBL.EntregaBL();
            return EntregaBL.ActualizarEstadoEnvio(entrega);
        }

        public List<Entities.DetalleEntrega> ConsultarEnviosPendientes()
        {
            EntregaBL.EntregaBL EntregaBL = new EntregaBL.EntregaBL();
            return EntregaBL.ConsultarEnviosPendientes();
        }


        #endregion
    }
}
