using App.Model.ViewModel;
using App.Service.Interface;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace App.Web.Components.TestExam
{
    public class QuestionsVideoViewComponent : ViewComponent
    {
        private readonly ITest_ExamService _examService;
        private QuestionVideoModel _model = new QuestionVideoModel();
        public QuestionsVideoViewComponent(ITest_ExamService examService)
        {
            this._examService = examService;
        }
        public async Task<IViewComponentResult> InvokeAsync(int videoLineId)
        {
            _model = await _examService.GetInfoExamTest(videoLineId);
            return View("QuestionsVideo", _model);
        }
    }
}
