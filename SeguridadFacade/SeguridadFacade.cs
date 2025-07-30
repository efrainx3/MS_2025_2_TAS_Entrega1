using Entities;

namespace SeguridadFacade
{
    public class SeguridadFacade
    {
        #region [Propiedades]

        #endregion
        #region [Constructor]
        public SeguridadFacade()
        {
            // Inicialización de la clase, si es necesario
        }
        #endregion
        #region [Métodos]
        // Aquí puedes definir los métodos necesarios para la clase SeguridadBL
        public Empleado IniciarSesion(Login login)
        {
            SeguridadBL.SeguridadBL seguridadBL = new SeguridadBL.SeguridadBL();
            var empleado = seguridadBL.IniciarSesion(login);
            return empleado;
        }
        #endregion
    }
}
