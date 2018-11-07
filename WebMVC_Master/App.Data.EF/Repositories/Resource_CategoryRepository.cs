using App.Data.Entities;
using App.Data.IRepositories;
using System;
using System.Collections.Generic;
using System.Text;

namespace App.Data.EF.Repositories
{
    public class Resource_CategoryRepository : GenericRepository<Resource_Category>, IResource_CategoryRepository
    {
        public Resource_CategoryRepository(AppDbContext dbContext) : base(dbContext)
        {

        }
    }
}
