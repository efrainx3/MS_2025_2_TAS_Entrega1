﻿using Dapper;
using Entities;
using UtilidadesDAL;

namespace ProductoDAL
{
    public class ProductoDAL : BaseDAL
    {
        #region [Propiedades]

        #endregion

        #region [Constructor]
        public ProductoDAL()
        {

        }
        #endregion

        #region [Métodos]
        public bool CrearProducto(Entities.Producto producto)
        {
            bool resultado = false;

            var param = new
            {
                producto.IdProducto,
                producto.Nombre,
                producto.Descripcion,
                producto.Precio,
                producto.Cantidad,
                producto.IdBodega,
                producto.Activo,
                producto.IdProveedor
            };
            using (var conn = ObtenerConexion())
            {
                conn.Execute("SP_Crear_Cliente", param, commandType: System.Data.CommandType.StoredProcedure) ;
                resultado = true;
            }
            return resultado;
        }

        public List<Producto> ConsultarProductosDisponibles()
        {
            List<Entities.Producto> lstProductos = new List<Entities.Producto>();
            using (var
                conn = ObtenerConexion())
            {
                lstProductos = conn.Query<Entities.Producto>("SP_Consultar_Productos_Disponibles", commandType: System.Data.CommandType.StoredProcedure).ToList();
            }
            return lstProductos;
        }

        public bool ActualizarStockPorVenta(Entities.Venta venta)
        {
            bool resultado = false;
            var param = new
            {
                venta.IdVenta,
            };
            using (var conn = ObtenerConexion())
            {
                conn.Execute("SP_Actualizar_Stock_Por_Venta", param, commandType: System.Data.CommandType.StoredProcedure);
            }
            return resultado;
        }

        public bool SolicitarStock(Guid idEmpleado, Entities.Producto producto) { 
            bool resultado = false;
            var param = new
            {
                IdEmpleado = idEmpleado,
                producto.IdProducto,
            };
            using (var conn = ObtenerConexion())
            {
                conn.Execute("SP_Solicitar_Stock", param, commandType: System.Data.CommandType.StoredProcedure);
                resultado = true;
            }
            return resultado;
        }

        #endregion
    }
}
