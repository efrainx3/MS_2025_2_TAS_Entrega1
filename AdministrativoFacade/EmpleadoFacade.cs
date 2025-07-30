using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AdministrativoFacade
{
    public class EmpleadoFacade
    {
        #region [Propiedades]
        // Aquí puedes definir las propiedades necesarias para la clase EmpleadoFacade
        #endregion
        #region [Constructor]
        public EmpleadoFacade()
        {
            // Inicialización de la clase, si es necesario
        }
        #endregion
        #region [Métodos]

        public List<Entities.Empleado> ObtenerEmpleados()
        {
            EmpleadoBL.EmpleadoBL empleadoBL = new EmpleadoBL.EmpleadoBL();
            return empleadoBL.ObtenerEmpleados();
        }

        public List<Entities.Empleado> ObtenerEmpleadosInactivos()
        {
            EmpleadoBL.EmpleadoBL empleadoBL = new EmpleadoBL.EmpleadoBL();
            return empleadoBL.ObtenerEmpleados();
        }

        public bool HabilitarEmpleadoVendedor(Entities.Empleado empleadoRRHH, Entities.Empleado empleadoVendedor)
        {
            EmpleadoBL.EmpleadoBL empleadoBL = new EmpleadoBL.EmpleadoBL();
            return empleadoBL.HabilitarEmpleadoVendedor(empleadoRRHH, empleadoVendedor);
        }
        #endregion
    }
}
