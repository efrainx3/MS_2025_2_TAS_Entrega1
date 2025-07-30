using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class Proveedor
    {
        #region [Propiedades]
        public Guid IdProveedor { get; set; }
        public string Nombre { get; set; }
        public string Contacto { get; set; }
        public string Telefono { get; set; }
        public string Email { get; set; }
        public string Direccion { get; set; }
        public DateTime FechaRegistro { get; set; }
        #endregion
        #region [Constructores]
        public Proveedor()
        {
            IdProveedor = Guid.NewGuid();
            FechaRegistro = DateTime.Now;
        }
        #endregion
    }
}
