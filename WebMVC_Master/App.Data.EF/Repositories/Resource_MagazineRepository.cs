using App.Data.Entities;
using App.Data.IRepositories;
using System;
using System.Collections.Generic;
using System.Text;

namespace App.Data.EF.Repositories
{
    public class Resource_MagazineRepository : GenericRepository<Resource_Magazine>, IResource_MagazineRepository
    {
        public Resource_MagazineRepository(AppDbContext dbContext) : base(dbContext)
        {

        }
    }
}
