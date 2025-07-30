using Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using SeguridadFacade;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace PoliMarket.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class SeguridadController : BaseAPIController
    {
        #region [Propiedades]
        private readonly IConfiguration _config;
        #endregion      
        public SeguridadController(IConfiguration configuration): base(configuration)
        {
            _config = configuration;
        }
        [AllowAnonymous]
        [HttpPost("LoginAPI")]
        public IActionResult LoginAPI(string email, string password)
        {
            try
            {
                Login login = new Login
                {
                    Email = email,
                    Password = password,
                };

                if (string.IsNullOrEmpty(login.Email) || string.IsNullOrEmpty(login.Password))
                {
                    return BadRequest("Email and password are required.");
                }

                SeguridadFacade.SeguridadFacade seguridadFacade = new SeguridadFacade.SeguridadFacade();
                Empleado empleado = seguridadFacade.IniciarSesion(login);

                if (empleado == null)
                {
                    return Unauthorized("Credenciales no validas.");
                }
                else if (!empleado.Activo)
                {
                    return Unauthorized("El empleado no esta activo.");
                }
                else
                {
                    string userJson = Newtonsoft.Json.JsonConvert.SerializeObject(empleado);
                    var token = GenerateJwtToken(userJson, empleado.Cargo.ToString());
                    return Ok(new { token });
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, "Internal server error: " + ex.Message);
            }
        }

        private string GenerateJwtToken(string username, string role)
        {
            var jwtConfig = _config.GetSection("Jwt");
            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(jwtConfig["Key"]));
            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            var claims = new[]
            {
            new Claim(ClaimTypes.Name, username),
            new Claim(ClaimTypes.Role, role),
            new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString())
        };

            var token = new JwtSecurityToken(
                claims: claims,
                expires: DateTime.UtcNow.AddMinutes(Convert.ToDouble(jwtConfig["ExpireMinutes"])),
                signingCredentials: creds);

            return new JwtSecurityTokenHandler().WriteToken(token);
        }
    }
}
