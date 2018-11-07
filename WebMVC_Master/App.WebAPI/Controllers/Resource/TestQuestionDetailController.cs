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
    [Route("api/test-question-detail")]
    public class TestQuestionDetailController : AppBaseController
    {
        private readonly ITest_QuestionDetailService _questionDetailService;
        public TestQuestionDetailController(ITest_QuestionDetailService questionDetailService)
        {
            this._questionDetailService = questionDetailService;
        }
        [HttpGet, Route("getAll")]
        public IActionResult GetAll(DataSourceLoadOptions loadOptions)
        {
            var data = DataSourceLoader.Load(_questionDetailService.GetAll(), loadOptions);
            return Ok(data);
        }
        [HttpGet, Route("getAllAsync")]
        public async Task<IActionResult> GetAllAsync()
        {
            var data = await _questionDetailService.ListAsync();
            return Ok(data);
        }
        [HttpPost, Route("addAsync")]
        public async Task<IActionResult> AddAsync([FromBody] Test_QuestionDetail questionDetail)
        {
            var model = await _questionDetailService.AddAsync(questionDetail);
            return Ok(model);
        }
        [HttpPut, Route("updateAsync")]
        public async Task<IActionResult> UpdateAsync([FromBody]Test_QuestionDetail questionDetail)
        {
            var model = await _questionDetailService.UpdateAsync(questionDetail);
            return Ok(model);
        }
        [HttpDelete, Route("deleteAsync")]
        public async Task<IActionResult> DeleteAsync([FromBody]Test_QuestionDetail questionDetail)
        {
            var model = await _questionDetailService.DeleteAsync(questionDetail);
            return Ok(model);
        }
        [HttpGet, Route("getByIdAsync")]
        public async Task<IActionResult> GetSingleByIdAsync([FromQuery]int id)
        {
            if (id < 1)
            {
                return BadRequest();
            }
            var model = await _questionDetailService.GetSingleByIdAsync(id);
            if (model == null)
            {
                return NotFound(model);
            }
            return Ok(model);
        }

        [HttpPost, Route("InsertOnGrid")]
        public async Task<IActionResult> InsertOnGrid(string values)
        {
            var questionDetail = new Test_QuestionDetail();
            JsonConvert.PopulateObject(values, questionDetail);
            if (!TryValidateModel(questionDetail))
                return BadRequest(ModelState.GetFullErrorMessage());
            var model = await _questionDetailService.AddAsync(questionDetail);
            return Ok(model);
        }

        [HttpPut, Route("UpdateOnGrid")]
        public async Task<IActionResult> UpdateOnGrid(int key, string values)
        {
            var questionDetail = await _questionDetailService.GetSingleByIdAsync(key);
            JsonConvert.PopulateObject(values, questionDetail);
            if (!TryValidateModel(questionDetail))
                return BadRequest(ModelState.GetFullErrorMessage());
            var model = await _questionDetailService.UpdateAsync(questionDetail);
            return Ok(model);
        }

        [HttpDelete, Route("DeleteOnGrid")]
        public async Task<IActionResult> DeleteOnGrid(int key)
        {
            var model = await _questionDetailService.DeleteByIdAsync(key);
            return Ok(model);
        }
    }

}
