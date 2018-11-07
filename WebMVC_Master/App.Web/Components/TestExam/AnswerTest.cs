using App.CommonExtensions.Extensions;
using App.Data.Entities;
using App.Model.ViewModel;
using App.Service.Interface;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace App.Web.Components.TestExam
{
    public class AnswerTestViewComponent : ViewComponent
    {
        private readonly IResource_VideoService _videoService;
        private readonly ITest_ExamService _examService;
        private readonly ITest_ExamQuestionDetailService _examQuestionDetailService;
        private QuestionVideoModel _model = new QuestionVideoModel();

        public AnswerTestViewComponent(IResource_VideoService videoService,
            ITest_ExamService examService, ITest_ExamQuestionDetailService examQuestionDetailService)
        {
            this._videoService = videoService;
            this._examService = examService;
            this._examQuestionDetailService = examQuestionDetailService;
        }
        public async Task<IViewComponentResult> InvokeAsync()
        {
            QuestionVideoModel questionVideoModel = TempData.Get<QuestionVideoModel>("questionVideoModel");
            if (questionVideoModel == null)
            {
                questionVideoModel = new QuestionVideoModel();
            }
            UpdateQuestionVideoModel(questionVideoModel);
            await SaveData(questionVideoModel);
            return View("AnswerTest", questionVideoModel);
        }
        private async Task SaveData(QuestionVideoModel questionVideoModel)
        {
            var exam = await _examService.AddAsync(questionVideoModel.Exam);
            var examQuestionDetails = questionVideoModel.Questions.Select(n => n.ExamQuestionDetails);
            foreach (var examQuestionDetail in examQuestionDetails)
            {
                await _examQuestionDetailService.AddRangeAsync(examQuestionDetail);
            }
            await _examQuestionDetailService.SaveChangesAsync();
        }
        private QuestionVideoModel UpdateQuestionVideoModel(QuestionVideoModel questionVideoModel)
        {
            questionVideoModel.Exam.ExamId = Guid.NewGuid();
            foreach (var question in questionVideoModel.Questions)
            {
                var answer = question.AnswerChoosed ?? "";
                question.IsCorrect = question.Answer.ToLower() == answer.ToLower();
                question.ExamQuestionDetails
                    .Add(new Test_ExamQuestionDetail()
                    {
                        QuestionId = question.QuestionId,
                        ExamId = questionVideoModel.Exam.ExamId,
                        Answer = answer,
                        Result = question.Answer,
                        IsCorrect = question.IsCorrect,
                        CreateByUser = "admin",
                        CreateDate = DateTime.Now
                    });
                if (!string.IsNullOrEmpty(answer))
                {
                    var answerChoosed = question.QuestionDetails.SingleOrDefault(n => n.AnswerPossobolity.Equals(answer));
                    var isCorrect = answerChoosed != null ? answerChoosed.IsCorrect = question.IsCorrect : null;
                }
            }
            var totalCorrect = questionVideoModel.Questions.Count(n => n.IsCorrect == true);
            var totalInCorrect = questionVideoModel.Questions.Count(n => n.IsCorrect == false);
            var totalQuestion = questionVideoModel.Questions.Count();
            questionVideoModel.Exam.QtyCorrect = totalCorrect;
            questionVideoModel.Exam.QtyIncorrect = totalInCorrect;
            questionVideoModel.Exam.TotalScore = totalQuestion;
            return questionVideoModel;
        }
    }
}
