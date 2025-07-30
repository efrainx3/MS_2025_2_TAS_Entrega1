using Entities;
using EntregaDAL;

namespace EntregaBL
{
    public class EntregaBL
    {
        #region [Propiedades]
        // Aquí puedes definir las propiedades necesarias para la clase EntregaBL
        #endregion
        #region [Constructor]
        public EntregaBL()
        {
            // Inicialización de la clase, si es necesario
        }
        #endregion
        #region [Métodos]

        public bool CrearRegistroEnvio(DetalleEntrega detalleEntrega)
        {
            DetalleEntregaDAL entregaDAL = new DetalleEntregaDAL();
            return entregaDAL.CrearDetalleEntrega(detalleEntrega);
        }

        public bool ActualizarEstadoEnvio(DetalleEntrega detalleEntrega)
        {
            DetalleEntregaDAL entregaDAL = new DetalleEntregaDAL();
            return entregaDAL.ActualizarEstadoEnvio(detalleEntrega);
        }

        public List<Entities.DetalleEntrega> ConsultarEnviosPendientes()
        {
            DetalleEntregaDAL entregaDAL = new DetalleEntregaDAL();
            return entregaDAL.ConsultarEnviosPendientes();
        }

        #endregion
    }
}
