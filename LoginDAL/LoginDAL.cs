using Dapper;
using Entities;
using UtilidadesDAL;

namespace LoginDAL
{
    public class LoginDAL : BaseDAL
    {
        #region [Propiedades]

        #endregion

        #region [Constructor]
        public LoginDAL()
        {

        }
        #endregion

        #region [Métodos]
        public Empleado IniciarSesion(Entities.Login login)
        {
            Empleado resultado = new Empleado();
            var param = new { login.Email, login.Password };
            using (var conn = ObtenerConexion())
            {
                resultado = conn.Query<Empleado>("SP_IniciarSesion", param, commandType: System.Data.CommandType.StoredProcedure).FirstOrDefault();
            }
            return resultado;
        }
        #endregion
    }
}
