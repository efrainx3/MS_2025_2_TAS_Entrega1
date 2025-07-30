using Dapper;
using UtilidadesDAL;

namespace EnvioDAL
{
    public class EntregaDAL : BaseDAL
    {
        #region [Propiedades]

        #endregion

        #region [Constructor]
        public EntregaDAL()
        {

        }
        #endregion
        #region [Métodos]
        public bool CrearProcesoEntrega(Entities.ProcesoEntrega entrega)
        {
            bool resultado = false;

            var param = new
            {
                IdEntrega = entrega.IdEntrega,
                PlacaVehiculo = entrega.PlacaVehiculo,
                FechaHoraInicio = entrega.FechaHoraInicio,
                FechaHoraFin = entrega.FechaHoraFin
            };
            using (var conn = ObtenerConexion())
            {
                conn.Execute("SP_Crear_ProcesoEntrega", param, commandType: System.Data.CommandType.StoredProcedure);
                resultado = true;
            }
            return resultado;
        }
                
        #endregion
    }
}
