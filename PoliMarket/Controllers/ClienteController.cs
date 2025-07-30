using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace PoliMarket.Controllers
{
    [Authorize(Roles = "Vendedor")]
    [Route("api/[controller]")]
    [ApiController]
    public class ClienteController : BaseAPIController
    {
        #region [Propiedades]
        private readonly IConfiguration _config;
        #endregion
        #region [Constructor]
        public ClienteController(IConfiguration config) : base(config)
        {
            _config = config;
        }
        #endregion
        #region [Métodos]
        /// <summary>
        /// Obtiene todos los clientes
        /// </summary>
        /// <returns>Lista de clientes</returns>
        [HttpGet("ConsultarClientesDisponibles")]
        public IActionResult ConsultarClientesDisponibles()
        {
            List<Entities.Cliente> clientes = new List<Entities.Cliente>();
            try
            {
                AdministrativoFacade.ClienteFacade clienteFacade = new AdministrativoFacade.ClienteFacade();
                clientes = clienteFacade.ConsultarClientesDisponibles();
            }
            catch (Exception ex)
            { return StatusCode(500, "Error interno del servidor: " + ex.Message); }
            return Ok(clientes);
        }
        #endregion
    }
}
