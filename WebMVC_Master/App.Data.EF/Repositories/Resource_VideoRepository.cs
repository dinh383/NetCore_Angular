using App.Data.Entities;
using App.Data.IRepositories;
using System;
using System.Collections.Generic;
using System.Text;

namespace App.Data.EF.Repositories
{
    public class Resource_VideoRepository : GenericRepository<Resource_Video>, IResource_VideoRepository
    {
        public Resource_VideoRepository(AppDbContext dbContext) : base(dbContext)
        {

        }
    }
}
