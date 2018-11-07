using App.Data.Entities;
using App.Data.IRepositories;
using System;
using System.Collections.Generic;
using System.Text;

namespace App.Data.EF.Repositories
{
    public class RegisterConsultativeRepository : GenericRepository<RegisterConsultative>, IRegisterConsultativeRepository
    {
        public RegisterConsultativeRepository(AppDbContext dbContext) : base(dbContext)
        {

        }
    }
}
