using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class Bodega
    {
        public int IdBodega { get; set; }
        public string Nombre { get; set; } = string.Empty;
        public string Direccion { get; set; } = string.Empty;
        public bool Activa { get; set; }
        public int TamanoMetros2 { get; set; }

        #region [Propiedades]

        #endregion
    }
}
