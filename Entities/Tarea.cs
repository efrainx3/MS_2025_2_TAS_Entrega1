using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class Tarea
    {
        #region [Propiedades]
        public Guid IdTarea { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public DateTime FechaCreacion { get; set; }
        public DateTime? FechaVencimiento { get; set; }
        public bool Completada { get; set; }
        public Empleado IdEmpleado { get; set; } // Referencia al empleado asignado
        #endregion
        #region [Constructores]
        public Tarea()
        {
            IdTarea = Guid.NewGuid();
            FechaCreacion = DateTime.Now;
            Completada = false;
        }
        #endregion

        #region [Métodos]
        #endregion
    }
}
