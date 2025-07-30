using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace PoliMarket.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class VentaController : BaseAPIController
    {
        #region [Propiedades]
        private readonly IConfiguration _config;
        #endregion
        #region [Constructor]
        public VentaController(IConfiguration config) : base(config)
        {
            _config = config;
        }
        #endregion
        #region [Métodos]
        /// <summary>
        /// Realiza una venta
        /// </summary>
        /// <param name="venta">Objeto de venta</param>
        /// <returns>Resultado de la venta</returns>
        [HttpPost("RealizarVenta")]
        public IActionResult CrearVenta([FromBody] Entities.Venta venta)
        {
            try
            {
                if (venta == null)
                {
                    return BadRequest("El objeto de venta no puede ser nulo.");
                }
                // Aquí se llamaría al método del Facade para realizar la venta
                // Por ejemplo:
                // VentaFacade ventaFacade = new VentaFacade();
                // bool result = ventaFacade.RealizarVenta(venta);
                // Simulación de resultado
                bool result = true; // Simular que la venta fue exitosa
                if (result)
                {
                    return Ok("Venta realizada exitosamente.");
                }
                else
                {
                    return BadRequest("Error al realizar la venta.");
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, "Error interno del servidor: " + ex.Message);
            }
        }
        #endregion
    }
}
