using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class Cliente : Usuario
    {
        #region [Propiedades]
        public Guid IdCliente { get; set; }

        public TipoCliente TipoCliente { get; set; }

        #endregion

        #region [Constructores]
        public Cliente()
        {
            IdCliente = Guid.NewGuid();
        }
        #endregion
    }
}
