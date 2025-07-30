using Dapper;
using Entities;
using System.Collections.Generic;
using UtilidadesDAL;

namespace EmpleadoDAL
{
    public class EmpleadoDAL : BaseDAL
    {
        #region [Propiedades]
        #endregion
        #region [Constructor]
        public EmpleadoDAL()
        {
        }
        #endregion
        #region [Métodos]
        public bool CrearEmpleado(Entities.Empleado empleado)
        {
            bool resultado = false;
            var param = new
            {
                empleado.Apellidos,
                empleado.Email,
                empleado.Nombres,
                empleado.NumeroIdentificacion,
                empleado.Telefono,
                empleado.TipoIdentificacion,
                empleado.FechaContratacion,
                empleado.Activo,
                empleado.IdEmpleado,
                empleado.Salario,
                empleado.Cargo
            };
            using (var conn = ObtenerConexion())
            {
                resultado = conn.Execute("SP_Crear_Empleado", param, commandType: System.Data.CommandType.StoredProcedure) > 0;
            }
            return resultado;
        }

        public List<Entities.Empleado> ObtenerEmpleados()
        {
            List < Entities.Empleado > empleados = new List<Entities.Empleado>();
            using (var conn = ObtenerConexion())
            {
                empleados = conn.Query<Entities.Empleado>("SP_Obtener_Empleados", commandType: System.Data.CommandType.StoredProcedure).AsList();
            }   
            return empleados;
        }

        public List<Entities.Empleado> ObtenerEmpleadosInactivos()
        {
            List<Entities.Empleado> empleados = new List<Entities.Empleado>();
            using (var conn = ObtenerConexion())
            {
                empleados = conn.Query<Entities.Empleado>("SP_Obtener_Empleados_Inactivos", commandType: System.Data.CommandType.StoredProcedure).AsList();
            }
            return empleados;
        }

        public bool HabilitarEmpleadoVendedor(Entities.Empleado empleadoRRHH, Entities.Empleado empleadoVendedor)
        {
            bool resultado = false;            
            var param = new
            {
                empleadoVendedor.IdEmpleado,
                empleadoVendedor.Activo,
            };
            using (var conn = ObtenerConexion())
            {
                conn.Execute("SP_Habilitar_Empleado_Vendedor", param, commandType: System.Data.CommandType.StoredProcedure);
                resultado = true;
            }
            return resultado;
        }
        #endregion
    }
}
