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
using Microsoft.AspNetCore.Authorization;
using App.BaseWebAPI.Controllers;
using App.BaseWebAPI.Providers;

namespace App.WebAPI.Controllers
{
    [Route("api/resource-category")]
    public class ResourceCategoryController : AppBaseController
    {
        private readonly IResource_CategoryService _categoryService;
        public ResourceCategoryController(IResource_CategoryService categoryService)
        {
            this._categoryService = categoryService;
        }
        [HttpGet, Route("testPermission")]
        [ClaimRequirement("Permission", "CanReadResource")]
        //[Authorize]
        //[Authorize(Policy = "AtLeast21")]
        public IActionResult TestPermission(DataSourceLoadOptions loadOptions)
        {
            var userName = User.Identity.Name;
            var data = DataSourceLoader.Load(_categoryService.GetAll(), loadOptions);
            return Ok(data);
        }
        [AllowAnonymous]
        [HttpGet, Route("getAll")]
        public IActionResult GetAll(DataSourceLoadOptions loadOptions)
        {
            var userName = User.Identity.Name;
            var data = DataSourceLoader.Load(_categoryService.GetAll(), loadOptions);
            return Ok(data);
        }
        [HttpPost, Route("addAsync")]
        public async Task<IActionResult> AddAsync([FromBody] Resource_Category category)
        {
            var model = await _categoryService.AddAsync(category);
            return Ok(model);
        }
        [HttpPut, Route("updateAsync")]
        public async Task<IActionResult> UpdateAsync([FromBody]Resource_Category category)
        {
            var model = await _categoryService.UpdateAsync(category);
            return Ok(model);
        }
        [HttpDelete, Route("deleteAsync")]
        public async Task<IActionResult> DeleteAsync([FromBody]Resource_Category category)
        {
            var model = await _categoryService.DeleteAsync(category);
            return Ok(model);
        }
        [HttpGet, Route("getByIdAsync")]
        public async Task<IActionResult> GetSingleByIdAsync([FromQuery]int id)
        {
            if (id < 1)
            {
                return BadRequest();
            }
            var model = await _categoryService.GetSingleByIdAsync(id);
            if (model == null)
            {
                return NotFound(model);
            }
            return Ok(model);
        }

        [HttpPost, Route("InsertOnGrid")]
        public async Task<IActionResult> InsertOnGrid(string values)
        {
            var category = new Resource_Category();
            JsonConvert.PopulateObject(values, category);
            if (!TryValidateModel(category))
                return BadRequest(ModelState.GetFullErrorMessage());
            var model = await _categoryService.AddAsync(category);
            return Ok(model);
        }

        [HttpPut, Route("UpdateOnGrid")]
        public async Task<IActionResult> UpdateOnGrid(int key, string values)
        {
            var category = await _categoryService.GetSingleByIdAsync(key);
            JsonConvert.PopulateObject(values, category);
            if (!TryValidateModel(category))
                return BadRequest(ModelState.GetFullErrorMessage());
            var model = await _categoryService.UpdateAsync(category);
            return Ok(model);
        }

        [HttpDelete, Route("DeleteOnGrid")]
        public async Task<IActionResult> DeleteOnGrid(int key)
        {
            var model = await _categoryService.DeleteByIdAsync(key);
            return Ok(model);
        }
    }

}
