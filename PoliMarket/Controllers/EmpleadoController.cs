using AdministrativoFacade;
using Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace PoliMarket.Controllers
{
    [Route("api/Empleado")]
    [ApiController]
    public class EmpleadoController : BaseAPIController
    {
        #region [Propiedades]
        private readonly IConfiguration _config;
        #endregion
        #region [Constructor]
        public EmpleadoController(IConfiguration config) : base(config)
        {
            _config = config;
        }
        #endregion
        #region [Métodos]
        [HttpGet("Test")]
        [Authorize(Roles = "GestionHumana")]
        public IActionResult Test()
        {
            return Ok("Test de EmpleadoController exitoso.");
        }

        /// <summary>
        /// Obtiene todos los empleados
        /// </summary>
        /// <returns>Lista de empleados</returns>
        [Authorize(Roles = "GestionHumana")]
        [HttpPost("HabilitarEmpleadoVendedor")]
        public IActionResult HabilitarEmpleadoVendedor([FromBody]Entities.Empleado empleadoVendedor)
        {
            bool result = false;
            try
            {
                if (empleadoVendedor == null)
                {
                    return BadRequest("El empleado vendedor no puede ser nulo.");
                }
                var authorizationHeader = HttpContext.Request.Headers["Authorization"].FirstOrDefault();

                Empleado empleadoRRHH = ObtenerUsuarioToken(authorizationHeader);
                EmpleadoFacade empleadoFacade = new EmpleadoFacade();
                result = empleadoFacade.HabilitarEmpleadoVendedor(empleadoRRHH, empleadoVendedor);
            }
            catch (Exception ex)
            {
                return StatusCode(500, "Error interno del servidor: " + ex.Message);
            }
            return Ok("Resultado: " + result.ToString());
        }
        #endregion
    }
}
