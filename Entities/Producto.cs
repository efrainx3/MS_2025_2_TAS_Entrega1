using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class Producto
    {
        #region [Propiedades]
        public Guid IdProducto { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public decimal Precio { get; set; }
        public int Cantidad { get; set; }
        public int IdBodega { get; set; }
        public bool Activo { get; set; }
        public Guid IdProveedor { get; set; }

        #endregion
        #region [Constructores]
        public Producto()
        {
            IdProducto = Guid.NewGuid();
            Precio = 0.0m;
            Cantidad = 0;
            Activo = false;
        }
        #endregion
    }
}
