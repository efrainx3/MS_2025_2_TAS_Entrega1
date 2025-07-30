using Entities;

namespace SeguridadBL
{
    public class SeguridadBL
    {
        #region [Propiedades]

        #endregion
        #region [Constructor]
        public SeguridadBL()
        {
            // Inicialización de la clase, si es necesario
        }
        #endregion
        #region [Métodos]
        // Aquí puedes definir los métodos necesarios para la clase SeguridadBL
        public Empleado IniciarSesion(Login login)
        {
            LoginDAL.LoginDAL loginDAL = new LoginDAL.LoginDAL();
            var empleado = loginDAL.IniciarSesion(login);
            return empleado;
        }
        #endregion
    }
}
