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
    [Route("api/test-question")]
    public class TestQuestionController : AppBaseController
    {
        private readonly ITest_QuestionService _questionService;
        public TestQuestionController(ITest_QuestionService questionService)
        {
            this._questionService = questionService;
        }

        [HttpGet, Route("getAll")]
        public IActionResult GetAll(DataSourceLoadOptions loadOptions)
        {
            var data = DataSourceLoader.Load(_questionService.GetAll(), loadOptions);
            return Ok(data);
        }

        [HttpGet, Route("getAllAsync")]
        public async Task<IActionResult> GetAllAsync()
        {
            var data = await _questionService.ListAsync();
            return Ok(data);
        }

        [HttpPost, Route("addAsync")]
        public async Task<IActionResult> AddAsync([FromBody] Test_Question question)
        {
            var model = await _questionService.AddAsync(question);
            return Ok(model);
        }

        [HttpPut, Route("updateAsync")]
        public async Task<IActionResult> UpdateAsync([FromBody]Test_Question question)
        {
            var model = await _questionService.UpdateAsync(question);
            return Ok(model);
        }
        [HttpDelete, Route("deleteAsync")]
        public async Task<IActionResult> DeleteAsync([FromBody]Test_Question question)
        {
            var model = await _questionService.DeleteAsync(question);
            return Ok(model);
        }
        [HttpGet, Route("getByIdAsync")]
        public async Task<IActionResult> GetSingleByIdAsync([FromQuery]int id)
        {
            if (id < 1)
            {
                return BadRequest();
            }
            var model = await _questionService.GetSingleByIdAsync(id);
            if (model == null)
            {
                return NotFound(model);
            }
            return Ok(model);
        }

        [HttpPost, Route("InsertOnGrid")]
        public async Task<IActionResult> InsertOnGrid(string values)
        {
            var question = new Test_Question();
            JsonConvert.PopulateObject(values, question);
            if (!TryValidateModel(question))
                return BadRequest(ModelState.GetFullErrorMessage());
            var model = await _questionService.AddAsync(question);
            return Ok(model);
        }

        [HttpPut, Route("UpdateOnGrid")]
        public async Task<IActionResult> UpdateOnGrid(Guid key, string values)
        {
            var question = await _questionService.GetSingleByIdAsync(key);
            JsonConvert.PopulateObject(values, question);
            if (!TryValidateModel(question))
                return BadRequest(ModelState.GetFullErrorMessage());
            var model = await _questionService.UpdateAsync(question);
            return Ok(model);
        }

        [HttpDelete, Route("DeleteOnGrid")]
        public async Task<IActionResult> DeleteOnGrid(Guid key)
        {
            var model = await _questionService.DeleteByIdAsync(key);
            return Ok(model);
        }
    }

}
