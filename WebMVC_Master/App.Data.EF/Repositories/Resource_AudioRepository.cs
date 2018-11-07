using App.Data.Entities;
using App.Data.IRepositories;
using System;
using System.Collections.Generic;
using System.Text;

namespace App.Data.EF.Repositories
{
    public class Resource_AudioRepository : GenericRepository<Resource_Audio>, IResource_AudioRepository
    {
        public Resource_AudioRepository(AppDbContext dbContext) : base(dbContext)
        {

        }
    }
}
