using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class Empleado : Usuario
    {
        #region [Propiedades]
        public Guid IdEmpleado { get; set; }
        public TipoEmpleado Cargo { get; set; }
        public decimal Salario { get; set; }
        public DateTime FechaContratacion { get; set; }
        public bool Activo { get; set; }
        public DateTime FechaActivacion { get; set; }
        #endregion
        #region [Constructores]
        public Empleado()
        {
            IdEmpleado = Guid.NewGuid();
            FechaContratacion = DateTime.Now;
            Activo = false;
        }
        #endregion
        #region [Métodos]
        public void ActivarEmpleado()
        {
            Activo = true;
        }
        #endregion
    }
}
