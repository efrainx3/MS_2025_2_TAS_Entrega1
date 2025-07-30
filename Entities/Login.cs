using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class Login : Empleado
    {
        public Guid IdLogin { get; set; }
        public string Password { get; set; }
        public DateTime FechaIngresoExitoso { get; set; }
    }
}
