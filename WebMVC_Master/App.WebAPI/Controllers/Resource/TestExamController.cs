using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using App.BaseWebAPI.Controllers;
using App.Data.Entities;
using App.Service.Interface;
using App.WebAPI.Infrastructure.DevExtreme;
using DevExtreme.AspNet.Data;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace App.WebAPI.Controllers.Resource
{
    [Route("api/[controller]")]
    [ApiController]
    public class TestExamController : AppBaseController
    {
        private readonly ITest_ExamService _examService;
        public TestExamController(ITest_ExamService examService)
        {
            this._examService = examService;
        }
        [HttpGet, Route("getAll")]
        public IActionResult GetAll(DataSourceLoadOptions loadOptions)
        {

            var data = DataSourceLoader.Load(_examService.GetAll(), loadOptions);
            return Ok(data);
        }
        [HttpGet, Route("getInfoExamTest")]
        public async Task<IActionResult> GetInfoExamTest([FromQuery]int id)
        {
            if (id < 1)
            {
                return BadRequest();
            }
            var model = await _examService.GetInfoExamTest(id);
            return Ok(model);
        }

        [HttpPost, Route("bulkInsertAsync")]
        public async Task<IActionResult> BulkInsertAsync()
        {
            var testExams = new List<Test_Exam>()
            {
                new Test_Exam() { ExamId = Guid.NewGuid(), ExamName = "Exam --> " + DateTime.Now.AddMilliseconds(1), CreateDate = DateTime.Now }
            };
            //for (int i = 0; i < 1000000; i++)
            //{
            //    var exam = new Test_Exam() { ExamId = Guid.NewGuid(), ExamName = "Exam --> " + DateTime.Now.AddMilliseconds(1), CreateDate = DateTime.Now };
            //    testExams.Add(exam);
            //}
            await _examService.BulkInsertAsync(testExams);
            return Ok(testExams);
        }

        [HttpPost, Route("bulkInsertOrUpdateAsync")]
        public async Task<IActionResult> BulkInsertOrUpdateAsync()
        {
            var testExams = new List<Test_Exam>()
            {
                new Test_Exam() {ExamId = Guid.Parse("97de8891-774c-49ac-86e9-2124a27e7647"), ExamName = "Exam 1", CreateDate = DateTime.Now },
                new Test_Exam() {ExamId = Guid.Parse("00be0bbc-d05d-4879-92bd-7d23149b6d18"), ExamName = "Exam 22", CreateDate = DateTime.Now },
                new Test_Exam() {ExamId = Guid.Parse("9f9224df-129e-4d69-b69e-8fc9b192dae5"), ExamName = "Exam 4", CreateDate = DateTime.Now }
            };
            await _examService.BulkInsertOrUpdateAsync(testExams);
            return Ok(testExams);
        }

        [HttpPost, Route("bulkUpdateAsync")]
        public async Task<IActionResult> BulkUpdateAsync()
        {
            var testExams = new List<Test_Exam>()
            {
                new Test_Exam() {ExamId = Guid.Parse("97de8891-774c-49ac-86e9-2124a27e7647"), ExamName = "Exam 1_Update", CreateDate = DateTime.Now },
                new Test_Exam() {ExamId = Guid.Parse("00be0bbc-d05d-4879-92bd-7d23149b6d18"), ExamName = "Exam 22_Update", CreateDate = DateTime.Now },
                new Test_Exam() {ExamId = Guid.Parse("9f9224df-129e-4d69-b69e-8fc9b192dae5"), ExamName = "Exam 6", CreateDate = DateTime.Now }
            };
            await _examService.BulkUpdateAsync(testExams);
            return Ok(testExams);
        }

        [HttpPost, Route("bulkDeleteAsync")]
        public async Task<IActionResult> BulkDeleteAsync()
        {
            var testExams = new List<Test_Exam>()
            {
                new Test_Exam() {ExamId = Guid.Parse("97de8891-774c-49ac-86e9-2124a27e7647"), ExamName = "Exam 1_Update", CreateDate = DateTime.Now },
                new Test_Exam() {ExamId = Guid.Parse("00be0bbc-d05d-4879-92bd-7d23149b6d18"), ExamName = "Exam 22_Update", CreateDate = DateTime.Now },
                new Test_Exam() {ExamId = Guid.Parse("9f9224df-129e-4d69-b69e-8fc9b192dae5"), ExamName = "Exam 6", CreateDate = DateTime.Now }
            };
            await _examService.BulkDeleteAsync(testExams);
            return Ok(testExams);
        }
    }
}