using App.Data.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace App.Model.ViewModel
{
    public class QuestionVideoModel
    {
        public QuestionVideoModel()
        {
            ExamStructure = new Test_ExamStructure();
            Exam = new Test_Exam();
            Questions = new List<Test_Question>();
        }
        public Test_ExamStructure ExamStructure { get; set; }
        public Test_Exam Exam { get; set; }
        public IList<Test_Question> Questions { get; set; }

    }
}
