using App.Data.Entities;
using App.Data.IRepositories;
using System;
using System.Collections.Generic;
using System.Text;

namespace App.Data.EF.Repositories
{
    public class Test_QuestionRepository : GenericRepository<Test_Question>, ITest_QuestionRepository
    {
        public Test_QuestionRepository(AppDbContext dbContext) : base(dbContext)
        {

        }
    }
}
