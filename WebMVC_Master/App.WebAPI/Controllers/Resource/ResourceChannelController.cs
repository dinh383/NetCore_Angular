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

namespace App.WebAPI.Controllers
{
    [Route("api/resource-channel")]
    public class ResourceChannelController : AppBaseController
    {
        private readonly IResource_ChannelService _channelService;
        public ResourceChannelController(IResource_ChannelService channelService)
        {
            this._channelService = channelService;
        }
        [HttpGet, Route("getAll")]
        public IActionResult GetAll(DataSourceLoadOptions loadOptions)
        {
            var userName = User.Identity.Name;
            var data = DataSourceLoader.Load(_channelService.GetAll(), loadOptions);
            return Ok(data);
        }
        [HttpPost, Route("addAsync")]
        public async Task<IActionResult> AddAsync([FromBody] Resource_Channel channel)
        {
            var model = await _channelService.AddAsync(channel);
            return Ok(model);
        }
        [HttpPut, Route("updateAsync")]
        public async Task<IActionResult> UpdateAsync([FromBody]Resource_Channel channel)
        {
            var model = await _channelService.UpdateAsync(channel);
            return Ok(model);
        }
        [HttpDelete, Route("deleteAsync")]
        public async Task<IActionResult> DeleteAsync([FromBody]Resource_Channel channel)
        {
            var model = await _channelService.DeleteAsync(channel);
            return Ok(model);
        }
        [HttpGet, Route("getByIdAsync")]
        public async Task<IActionResult> GetSingleByIdAsync([FromQuery]int id)
        {
            if (id < 1)
            {
                return BadRequest();
            }
            var model = await _channelService.GetSingleByIdAsync(id);
            if (model == null)
            {
                return NotFound(model);
            }
            return Ok(model);
        }

        [HttpPost, Route("InsertOnGrid")]
        public async Task<IActionResult> InsertOnGrid(string values)
        {
            var channel = new Resource_Channel();
            JsonConvert.PopulateObject(values, channel);
            if (!TryValidateModel(channel))
                return BadRequest(ModelState.GetFullErrorMessage());
            var model = await _channelService.AddAsync(channel);
            return Ok(model);
        }

        [HttpPut, Route("UpdateOnGrid")]
        public async Task<IActionResult> UpdateOnGrid(int key, string values)
        {
            var channel = await _channelService.GetSingleByIdAsync(key);
            JsonConvert.PopulateObject(values, channel);
            if (!TryValidateModel(channel))
                return BadRequest(ModelState.GetFullErrorMessage());
            var model = await _channelService.UpdateAsync(channel);
            return Ok(model);
        }

        [HttpDelete, Route("DeleteOnGrid")]
        public async Task<IActionResult> DeleteOnGrid(int key)
        {
            var model = await _channelService.DeleteByIdAsync(key);
            return Ok(model);
        }
    }

}
