using Dapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using UtilidadesDAL;

namespace VentaDAL
{
    public class DetalleVentaDAL : BaseDAL
    {
        #region [Propiedades]
        // Aquí puedes definir las propiedades necesarias para la clase DetalleVentaDAL
        #endregion
        #region [Constructor]
        public DetalleVentaDAL()
        {
            // Inicialización de la clase, si es necesario
        }
        #endregion
        #region [Métodos]
        public bool CrearDetalleVenta(Entities.Venta venta)
        {
            bool resultado = false;
            if (venta?.LstDetallVenta != null && venta.LstDetallVenta.Count > 0)
            {
                using (var conn = ObtenerConexion())
                {
                    foreach (var detalle in venta.LstDetallVenta)
                    {
                        var param = new
                        {
                            IdDetalleVenta = detalle.IdDetalleVenta,
                            IdVenta = venta.IdVenta,
                            IdProducto = detalle.IdProducto,
                            Cantidad = detalle.Cantidad,
                            PrecioUnitario = detalle.PrecioUnitario,
                            Subtotal = detalle.Subtotal
                        };
                        conn.Execute("SP_Crear_DetalleVenta", param, commandType: System.Data.CommandType.StoredProcedure);
                    }
                    resultado = true;
                }
            }
            return resultado;
        }
        #endregion
    }
}
