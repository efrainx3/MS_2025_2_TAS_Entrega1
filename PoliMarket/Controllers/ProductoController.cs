﻿using Entities;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace PoliMarket.Controllers
{
    [Authorize(Roles = "Vendedor")]
    [Route("api/Producto")]
    [ApiController]
    public class ProductoController : BaseAPIController
    {
        #region [Propiedades]
        private readonly IConfiguration _config;
        #endregion
        #region [Constructor]
        public ProductoController(IConfiguration config) : base(config)
        {
            _config = config;
        }
        #endregion
        #region [Métodos]
        /// <summary>
        /// Obtiene todos los productos
        /// </summary>
        /// <returns>Lista de productos</returns>
        [HttpGet("ConsultarProductosDisponibles")]
        public IActionResult ConsultarProductosDisponibles()
        {
            List<Entities.Producto> productos = new List<Entities.Producto>();
            try
            {
                BodegaFacade.BodegaFacade bodegaFacade = new BodegaFacade.BodegaFacade();
                productos = bodegaFacade.ConsultarProductosDisponibles();
            }
            catch (Exception ex)
            { return StatusCode(500, "Error interno del servidor: " + ex.Message); }
            return Ok(productos);
        }

        [HttpPost("SolicitarStock")]
        public IActionResult SolicitarStock(Entities.Producto producto)
        {
            bool result = false;
            try
            {
                var authorizationHeader = HttpContext.Request.Headers["Authorization"].FirstOrDefault();
                Empleado empleadoRRHH = ObtenerUsuarioToken(authorizationHeader);
                BodegaFacade.BodegaFacade bodegaFacade = new BodegaFacade.BodegaFacade();
                result = bodegaFacade.SolicitarStock(empleadoRRHH.IdEmpleado, producto);
            }
            catch (Exception ex)
            { return StatusCode(500, "Error interno del servidor: " + ex.Message); }
            return Ok(result);
        }
        #endregion
    }
}
