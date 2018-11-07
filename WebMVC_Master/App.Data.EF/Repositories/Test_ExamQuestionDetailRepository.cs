using App.Data.Entities;
using App.Data.IRepositories;
using System;
using System.Collections.Generic;
using System.Text;

namespace App.Data.EF.Repositories
{
    public class Test_ExamQuestionDetailRepository : GenericRepository<Test_ExamQuestionDetail>, ITest_ExamQuestionDetailRepository
    {
        public Test_ExamQuestionDetailRepository(AppDbContext dbContext) : base(dbContext)
        {

        }
    }
}
