using Entities;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using PoliMarket.Utilidades;
using System.Text;

namespace PoliMarket.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BaseAPIController : ControllerBase
    {
        private readonly IConfiguration _config;

        /// <summary>
        /// Base API Controller for common functionality
        /// </summary>
        public BaseAPIController(IConfiguration config)
        {
            _config = config;
        }

        protected Empleado ObtenerUsuarioToken(string authorizationHeader)
        {
            if (string.IsNullOrEmpty(authorizationHeader))
            {
                return null;
            }
            else if (authorizationHeader.StartsWith("Bearer "))
            {
                var jwtSettings = _config.GetSection("Jwt");
                string token = authorizationHeader.Substring("Bearer ".Length).Trim();
                return UtilidadesToken.ObtenerUsuarioToken(token, jwtSettings["Key"]);
            }
            else
            {
                return null;
            }
        }

        /// <summary>
        /// Returns a generic success response
        /// </summary>
        /// <returns>Ok response</returns>
        protected IActionResult SuccessResponse()
        {
            return Ok(new { message = "Request was successful." });
        }
        /// <summary>
        /// Returns a generic error response
        /// </summary>
        /// <param name="message">Error message</param>
        /// <returns>Bad Request response</returns>
        protected IActionResult ErrorResponse(string message)
        {
            return BadRequest(new { error = message });
        }
    }
}
