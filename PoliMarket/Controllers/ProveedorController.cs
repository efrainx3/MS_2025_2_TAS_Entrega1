using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace PoliMarket.Controllers
{
    [Authorize(Roles = "Almacen")]
    [Route("api/Proveedor")]
    [ApiController]
    public class ProveedorController : BaseAPIController
    {
        #region [Propiedades]
        private readonly IConfiguration _config;
        #endregion
        #region [Constructor]
        public ProveedorController(IConfiguration config) : base(config)
        {
            _config = config;
        }
        #endregion
        #region [Métodos]
        /// <summary>
        /// Obtiene todos los proveedores
        /// </summary>
        /// <returns>Lista de proveedores</returns>
        [HttpGet("ConsultarProveedorXIdProducto")]
        public IActionResult ConsultarProveedorXIdProducto(Guid idProducto)
        {
            Entities.Proveedor proveedor = new Entities.Proveedor();
            try
            {
                ProveedorFacade.ProveedorFacade proveedorFacade = new ProveedorFacade.ProveedorFacade();
                proveedor = proveedorFacade.ConsultarProveedorXIdProducto(idProducto);
            }
            catch (Exception ex)
            {
                return StatusCode(500, "Error interno del servidor: " + ex.Message);
            }
            return Ok(proveedor);
        }
        #endregion
    }
}
