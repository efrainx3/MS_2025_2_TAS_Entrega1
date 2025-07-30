using Microsoft.Data.SqlClient;

namespace UtilidadesDAL
{
    public class BaseDAL
    {
        #region [ Propiedades ]
        protected string cadenaConexion { get; private set; }
        #endregion

        #region [ Constructor ]
        public BaseDAL()
        {
            cadenaConexion = "Data Source=EFRAZENBOOK\\ZENBOOKSQL;Initial Catalog=PoliMarket;User ID=AppUser;Password=C************3;Encrypt=True;Trust Server Certificate=True";
        }
        #endregion

        #region [ Metodos ]

        public SqlConnection ObtenerConexion()
        {
            SqlConnection conexion;
            conexion = new SqlConnection(cadenaConexion);
            return conexion;
        }

        #endregion
    }
}
