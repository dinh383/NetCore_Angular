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
    [Route("api/video")]
    public class VideoController : AppBaseController
    {
        private readonly IResource_VideoService _videoService;
        public VideoController(IResource_VideoService videoService)
        {
            this._videoService = videoService;
        }
        [HttpGet, Route("getAll")]
        public IActionResult GetAll(DataSourceLoadOptions loadOptions)
        {
            var data = DataSourceLoader.Load(_videoService.GetAll(), loadOptions);
            return Ok(data);
        }
        [HttpPost, Route("addAsync")]
        public async Task<IActionResult> AddAsync([FromBody] Resource_Video video)
        {
            var model = await _videoService.AddAsync(video);
            return Ok(model);
        }
        [HttpPut, Route("updateAsync")]
        public async Task<IActionResult> UpdateAsync([FromBody]Resource_Video video)
        {
            var model = await _videoService.UpdateAsync(video);
            return Ok(model);
        }
        [HttpDelete, Route("deleteAsync")]
        public async Task<IActionResult> DeleteAsync([FromBody]Resource_Video video)
        {
            var model = await _videoService.DeleteAsync(video);
            return Ok(model);
        }
        [HttpGet, Route("getByIdAsync")]
        public async Task<IActionResult> GetSingleByIdAsync([FromQuery]int id)
        {
            if (id < 1)
            {
                return BadRequest();
            }
            var model = await _videoService.GetSingleByIdAsync(id);
            if (model == null)
            {
                return NotFound(model);
            }
            return Ok(model);
        }

        [HttpPost, Route("InsertOnGrid")]
        public async Task<IActionResult> InsertOnGrid(string values)
        {
            var video = new Resource_Video();
            JsonConvert.PopulateObject(values, video);
            if (!TryValidateModel(video))
                return BadRequest(ModelState.GetFullErrorMessage());
            var model = await _videoService.AddAsync(video);
            return Ok(model);
        }

        [HttpPut, Route("UpdateOnGrid")]
        public async Task<IActionResult> UpdateOnGrid(int key, string values)
        {
            var video = await _videoService.GetSingleByIdAsync(key);
            JsonConvert.PopulateObject(values, video);
            if (!TryValidateModel(video))
                return BadRequest(ModelState.GetFullErrorMessage());
            var model = await _videoService.UpdateAsync(video);
            return Ok(model);
        }

        [HttpDelete, Route("DeleteOnGrid")]
        public async Task<IActionResult> DeleteOnGrid(int key)
        {
            var model = await _videoService.DeleteByIdAsync(key);
            return Ok(model);
        }
    }

}
