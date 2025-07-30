using Entities;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Text;

namespace PoliMarket.Utilidades
{
    public static class UtilidadesToken
    {
        public static Empleado ObtenerUsuarioToken(string authorizationHeader, string secretKey)
        {
            Empleado empleado = new Empleado();
            try
			{
                // 1. Obtener el token del encabezado de autorización                
                if (string.IsNullOrEmpty(authorizationHeader))
                {
                    return null;
                }

                var token = authorizationHeader.Substring("Bearer ".Length).Trim();

                // 2. Decodificar el token
                var tokenHandler = new JwtSecurityTokenHandler();
                var key = Encoding.ASCII.GetBytes(secretKey);
                var signingKey = new SymmetricSecurityKey(key);
                var singingCredentials = new SigningCredentials(signingKey, SecurityAlgorithms.HmacSha256);

                var validationParameters = new TokenValidationParameters
                {
                    ValidateIssuerSigningKey = true,
                    IssuerSigningKey = singingCredentials.Key,
                    ValidateIssuer = false, // Ajustar según la configuración de tu token
                    ValidateAudience = false, // Ajustar según la configuración de tu token
                    ClockSkew = TimeSpan.Zero // Ajustar según la configuración de tu token
                };

                SecurityToken validatedToken;
                var principal = tokenHandler.ValidateToken(authorizationHeader, validationParameters, out validatedToken);

                // 3. Acceder a las reclamaciones (claims)
                var userIdClaim = principal.Claims.FirstOrDefault(c => c.Type.Split('/').LastOrDefault() == "role")?.Value; //  Ejemplo: "userId"
                var userNameClaim = principal.Claims.FirstOrDefault(c => c.Type.Split('/').LastOrDefault() == "name")?.Value; //  Ejemplo: "name"


                if (string.IsNullOrEmpty(userIdClaim) || string.IsNullOrEmpty(userNameClaim))
                {
                    return null;
                }

                empleado = Newtonsoft.Json.JsonConvert.DeserializeObject<Empleado>(userNameClaim); 
            }
			catch (Exception ex)
			{
			}
            return empleado;
        }
    }
}
