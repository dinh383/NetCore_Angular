using App.Data.Entities;
using App.Data.IRepositories;
using System;
using System.Collections.Generic;
using System.Text;

namespace App.Data.EF.Repositories
{
    public class Test_ExamRepository : GenericRepository<Test_Exam>, ITest_ExamRepository
    {
        public Test_ExamRepository(AppDbContext dbContext) : base(dbContext)
        {

        }
    }
}
