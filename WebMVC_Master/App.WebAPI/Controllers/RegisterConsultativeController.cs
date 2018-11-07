using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using App.Data.Entities;
using App.Service.Interface;
using Microsoft.AspNetCore.Mvc;
using DevExtreme.AspNet.Data;
using App.WebAPI.Infrastructure.DevExtreme;
using Newtonsoft.Json;
using App.CommonExtensions.Extensions;
using App.BaseWebAPI.Controllers;

namespace App.WebAPI.Controllers
{
    [Route("api/registerConsultative")]
    public class RegisterConsultativeController : AppBaseController
    {
        private readonly IRegisterConsultativeService _registerConsultativeService;
        public RegisterConsultativeController(IRegisterConsultativeService registerConsultativeService)
        {
            this._registerConsultativeService = registerConsultativeService;
        }
        [HttpGet, Route("getAll")]
        public IActionResult GetAll(DataSourceLoadOptions loadOptions)
        {
            var data = DataSourceLoader.Load(_registerConsultativeService.GetAll(), loadOptions);
            return Ok(data);
        }
        [HttpPost, Route("addAsync")]
        public async Task<IActionResult> AddAsync([FromBody] RegisterConsultative registerConsultative)
        {
            var model = await _registerConsultativeService.AddAsync(registerConsultative);
            return Ok(model);
        }
        [HttpPut, Route("updateAsync")]
        public async Task<IActionResult> UpdateAsync([FromBody]RegisterConsultative registerConsultative)
        {
            var model = await _registerConsultativeService.UpdateAsync(registerConsultative);
            return Ok(model);
        }
        [HttpDelete, Route("deleteAsync")]
        public async Task<IActionResult> DeleteAsync([FromBody]RegisterConsultative registerConsultative)
        {
            var model = await _registerConsultativeService.DeleteAsync(registerConsultative);
            return Ok(model);
        }
        [HttpGet, Route("getByIdAsync")]
        public async Task<IActionResult> GetSingleByIdAsync([FromQuery]int id)
        {
            if (id < 1)
            {
                return BadRequest();
            }
            var model = await _registerConsultativeService.GetSingleByIdAsync(id);
            if (model == null)
            {
                return NotFound(model);
            }
            return Ok(model);
        }
        [HttpPost, Route("InsertOnGrid")]
        public async Task<IActionResult> InsertOnGrid(string values)
        {
            var registerConsultative = new RegisterConsultative();
            JsonConvert.PopulateObject(values, registerConsultative);
            if (!TryValidateModel(registerConsultative))
                return BadRequest(ModelState.GetFullErrorMessage());
            var model = await _registerConsultativeService.AddAsync(registerConsultative);
            return Ok(model);
        }

        [HttpPut, Route("UpdateOnGrid")]
        public async Task<IActionResult> UpdateOnGrid(int key, string values)
        {
            var registerConsultative = await _registerConsultativeService.GetSingleByIdAsync(key);
            JsonConvert.PopulateObject(values, registerConsultative);
            if (!TryValidateModel(registerConsultative))
                return BadRequest(ModelState.GetFullErrorMessage());
            var model = await _registerConsultativeService.UpdateAsync(registerConsultative);
            return Ok(model);
        }

        [HttpDelete, Route("DeleteOnGrid")]
        public async Task<IActionResult> DeleteOnGrid(int key)
        {
            var model = await _registerConsultativeService.DeleteByIdAsync(key);
            return Ok(model);
        }
    }
}
