using App.Data.Entities;
using App.Data.IRepositories;
using System;
using System.Collections.Generic;
using System.Text;

namespace App.Data.EF.Repositories
{
    public class Test_QuestionDetailRepository : GenericRepository<Test_QuestionDetail>, ITest_QuestionDetailRepository
    {
        public Test_QuestionDetailRepository(AppDbContext dbContext) : base(dbContext)
        {

        }
    }
}
