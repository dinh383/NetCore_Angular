using App.Data.Entities;
using App.Data.IRepositories;
using System;
using System.Collections.Generic;
using System.Text;

namespace App.Data.EF.Repositories
{
    public class Resource_ChannelRepository : GenericRepository<Resource_Channel>, IResource_ChannelRepository
    {
        public Resource_ChannelRepository(AppDbContext dbContext) : base(dbContext)
        {

        }
    }
}
