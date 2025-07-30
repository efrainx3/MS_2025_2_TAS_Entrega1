using Dapper;
using UtilidadesDAL;

namespace VentaDAL
{
    public class VentaDAL : BaseDAL
    {
        #region [Propiedades]

        #endregion

        #region [Constructor]
        public VentaDAL()
        {

        }
        public bool CrearVenta(Entities.Venta venta)
        {
            bool resultado = false;
            var param = new
            {
                IdVenta = venta.IdVenta,
                FechaVenta = venta.FechaVenta,
                ValorTotal = venta.ValorTotal,
                IdEmpleado = venta.IdEmpleado?.IdEmpleado,
                IdCliente = venta.IdCliente?.IdCliente,
                EstadoVenta = (int)venta.EstadoVenta
            };
            using (var conn = ObtenerConexion())
            {
                conn.Execute("SP_Crear_Venta", param, commandType: System.Data.CommandType.StoredProcedure);
            }
            return resultado;
        }

        public bool FacturarVenta(Entities.Venta venta)
        {
            bool resultado = false;
            var param = new
            {
                IdVenta = venta.IdVenta,
                EstadoVenta = (int)venta.EstadoVenta
            };
            using (var conn = ObtenerConexion())
            {
                conn.Execute("SP_Facturar_Venta", param, commandType: System.Data.CommandType.StoredProcedure);
            }
            return resultado;
        }
        #endregion
    }
}
