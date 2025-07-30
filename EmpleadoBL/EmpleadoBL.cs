using Entities;

namespace EmpleadoBL
{
    public class EmpleadoBL
    {
        #region [Propiedades]
        // Aquí puedes definir las propiedades necesarias para la clase EmpleadoBL
        #endregion
        #region [Constructor]
        public EmpleadoBL()
        {
            // Inicialización de la clase, si es necesario
        }
        #endregion
        #region [Métodos]
        public List<Entities.Empleado> ObtenerEmpleados()
        {
            EmpleadoDAL.EmpleadoDAL empleadoDAL = new EmpleadoDAL.EmpleadoDAL();
            return empleadoDAL.ObtenerEmpleados();
        }

        public List<Entities.Empleado> ObtenerEmpleadosInactivos()
        {
            EmpleadoDAL.EmpleadoDAL empleadoDAL = new EmpleadoDAL.EmpleadoDAL();
            return empleadoDAL.ObtenerEmpleadosInactivos();
        }
        public bool HabilitarEmpleadoVendedor(Empleado empleadoRRHH, Empleado empleadoVendedor)
        {
            bool result = false;
            if (empleadoRRHH.Cargo == TipoEmpleado.GestionHumana)
            {
                empleadoVendedor.ActivarEmpleado();
                EmpleadoDAL.EmpleadoDAL empleadoDAL = new EmpleadoDAL.EmpleadoDAL();
                result = empleadoDAL.HabilitarEmpleadoVendedor(empleadoRRHH, empleadoVendedor);
            }
            
            return result;
        }
        #endregion
    }
}
