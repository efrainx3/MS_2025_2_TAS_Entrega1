using Dapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UtilidadesDAL;

namespace EntregaDAL
{
    public class DetalleEntregaDAL : BaseDAL
    {
        #region [Propiedades]
        // Aquí puedes definir las propiedades necesarias para la clase DetalleEntregaDAL
        #endregion
        #region [Constructor]
        public DetalleEntregaDAL()
        {
            // Inicialización de la clase, si es necesario
        }
        #endregion
        #region [Métodos]
        public bool CrearDetalleEntrega(Entities.DetalleEntrega detalleEntrega)
        {
            bool resultado = false;
            var param = new
            {
                IdDetalleEntrega = detalleEntrega.IdDetalleEntrega,
                IdEntrega = detalleEntrega.IdEntrega,
                IdVenta = detalleEntrega.IdVenta,
                FechaEntrega = detalleEntrega.FechaEntrega,
                DireccionEntrega = detalleEntrega.DireccionEntrega,
                Entregado = detalleEntrega.Entregado
            };
            using (var conn = ObtenerConexion())
            {
                conn.Execute("SP_Crear_Detalle_Entrega", param, commandType: System.Data.CommandType.StoredProcedure);
                resultado = true;
            }
            return resultado;
        }

        public bool ActualizarEstadoEnvio(Entities.DetalleEntrega detalleEntrega)
        {
            bool resultado = false;
            var param = new
            {
                IdDetalleEntrega = detalleEntrega.IdDetalleEntrega,
                IdEntrega = detalleEntrega.IdEntrega,
                IdVenta = detalleEntrega.IdVenta,
                FechaEntrega = detalleEntrega.FechaEntrega,
                DireccionEntrega = detalleEntrega.DireccionEntrega,
                Entregado = detalleEntrega.Entregado
            };
            using (var conn = ObtenerConexion())
            {
                conn.Execute("SP_Crear_Detalle_Entrega", param, commandType: System.Data.CommandType.StoredProcedure);
                resultado = true;
            }
            return resultado;
        }


        public List<Entities.DetalleEntrega> ConsultarEnviosPendientes()
        {
            List<Entities.DetalleEntrega> lstDetalles = new List<Entities.DetalleEntrega>();
            using (var conn = ObtenerConexion())
            {
                lstDetalles = conn.Query<Entities.DetalleEntrega>("SP_Consultar_Detalles_Entregas_Pendientes", commandType: System.Data.CommandType.StoredProcedure).ToList();
            }
            return lstDetalles;
        }
        #endregion
    }
}
