using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace PoliMarket.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class EnvioController : BaseAPIController
    {
        #region [Propiedades]
        private readonly IConfiguration _config;
        #endregion
        #region [Constructor]
        public EnvioController(IConfiguration config) : base(config)
        {
            _config = config;
        }
        #endregion
        #region [Métodos]
        /// <summary>
        /// Realiza un envío
        /// </summary>
        /// <param name="envio">Objeto de envío</param>
        /// <returns>Resultado del envío</returns>
        [HttpPost("CrearRegistroEnvio")]
        public IActionResult CrearRegistroEnvio([FromBody] Entities.DetalleEntrega entrega)
        {
            try
            {
                if (entrega == null)
                {
                    return BadRequest("El objeto de envío no puede ser nulo.");
                }
                EntregaFacade.EntregaFacade entregaFacade = new EntregaFacade.EntregaFacade();
                bool result = entregaFacade.CrearRegistroEnvio(entrega);
                if (result)
                {
                    return Ok("Envío creado exitosamente.");
                }
                else
                {
                    return BadRequest("Error al crear el envío.");
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, "Error interno del servidor: " + ex.Message);
            }
        }

        [HttpPost("ActualizarEstadoEnvio")]
        public IActionResult ActualizarEstadoEnvio([FromBody] Entities.DetalleEntrega entrega)
        {
            try
            {
                if (entrega == null)
                {
                    return BadRequest("El objeto de envío no puede ser nulo.");
                }
                EntregaFacade.EntregaFacade entregaFacade = new EntregaFacade.EntregaFacade();
                bool result = entregaFacade.ActualizarEstadoEnvio(entrega);
                if (result)
                {
                    return Ok("Envío actualizado exitosamente.");
                }
                else
                {
                    return BadRequest("Error al actualizar el envío.");
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, "Error interno del servidor: " + ex.Message);
            }
        }

        [HttpGet("ConsultarEnviosPendientes")]
        public IActionResult ConsultarEnviosPendientes()
        {
            List<Entities.DetalleEntrega> entregas = new List<Entities.DetalleEntrega>();
            try
            {
                EntregaFacade.EntregaFacade entregaFacade = new EntregaFacade.EntregaFacade();
                entregas = entregaFacade.ConsultarEnviosPendientes();
            }
            catch (Exception ex)
            { return StatusCode(500, "Error interno del servidor: " + ex.Message); }
            return Ok(entregas);
        }

        #endregion
    }
}
