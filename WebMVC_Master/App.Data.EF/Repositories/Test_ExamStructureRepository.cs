using App.Data.Entities;
using App.Data.IRepositories;
using System;
using System.Collections.Generic;
using System.Text;

namespace App.Data.EF.Repositories
{
    public class Test_ExamStructureRepository : GenericRepository<Test_ExamStructure>, ITest_ExamStructureRepository
    {
        public Test_ExamStructureRepository(AppDbContext dbContext) : base(dbContext)
        {

        }
    }
}
