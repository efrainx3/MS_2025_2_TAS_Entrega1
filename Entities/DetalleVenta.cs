using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public  class DetalleVenta
    {
        #region [Propiedades]
        public Guid IdDetalleVenta { get; set; }
        public Guid IdVenta { get; set; }
        public Guid IdProducto { get; set; }
        public int Cantidad { get; set; }
        public decimal PrecioUnitario { get; set; }
        public decimal Subtotal { get; set; }
        #endregion
        #region [Constructores]
        public DetalleVenta()
        {
            IdDetalleVenta = Guid.NewGuid();
        }
        #endregion
    }
}
