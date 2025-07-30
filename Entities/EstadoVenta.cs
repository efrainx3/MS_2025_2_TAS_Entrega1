using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public enum EstadoVenta
    {
        EnEspera = 1,
        EnProceso = 2,
        Completada = 3,
        Cancelada = 4,
        Reembolsada = 5,
        PendienteDePago = 6,
        Pagada = 7,
        Enviada = 8,
        Entregada = 9,
        Devuelta = 10
    }
}
