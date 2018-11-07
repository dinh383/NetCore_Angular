using App.Data.Entities;
using App.Data.IRepositories;
using App.Model.ViewModel;
using App.Service.Interface;
using Microsoft.EntityFrameworkCore.Query;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;
namespace App.Service.Implement
{
    public class Resource_ChannelService : IResource_ChannelService
    {
        private readonly IResource_ChannelRepository _channelRepository;
        public Resource_ChannelService(IResource_ChannelRepository channelRepository)
        {
            this._channelRepository = channelRepository;
        }
        public Task<Resource_Channel> AddAsync(Resource_Channel entity)
        {
            return _channelRepository.AddAsync(entity);
        }
        public Task<Resource_Channel> UpdateAsync(Resource_Channel entity)
        {
            return _channelRepository.UpdateAsync(entity);
        }
        public Task<Resource_Channel> DeleteAsync(Resource_Channel entity)
        {
            return _channelRepository.DeleteAsync(entity);
        }
        public Task<IEnumerable<Resource_Channel>> ListAsync(Expression<Func<Resource_Channel, bool>> filter, Func<IQueryable<Resource_Channel>, IOrderedQueryable<Resource_Channel>> orderBy, Func<IQueryable<Resource_Channel>, IIncludableQueryable<Resource_Channel, object>> includeProperties)
        {
            return _channelRepository.ListAsync(filter, orderBy, includeProperties);
        }
        public Task<Resource_Channel> GetSingleByIdAsync(dynamic id)
        {
            return _channelRepository.GetSingleByIdAsync(id);
        }

        public IEnumerable<Resource_Channel> GetAll(string[] includes = null)
        {
            return _channelRepository.GetAll(includes);
        }

        public void AddRange(IEnumerable<Resource_Channel> entities)
        {
            _channelRepository.AddRange(entities);
        }

        public Task AddRangeAsync(IEnumerable<Resource_Channel> entities)
        {
            return _channelRepository.AddRangeAsync(entities);
        }

        public void UpdateRange(IEnumerable<Resource_Channel> entities)
        {
            _channelRepository.UpdateRange(entities);
        }

        public Task<Resource_Channel> DeleteByIdAsync(dynamic id)
        {
            return _channelRepository.DeleteByIdAsync(id);
        }

        public Task DeleteMultiByConditionAsync(Expression<Func<Resource_Channel, bool>> where)
        {
            return _channelRepository.DeleteMultiByConditionAsync(where);
        }

        public Task RemoveRangeAsync(IEnumerable<Resource_Channel> entities)
        {
            return _channelRepository.RemoveRangeAsync(entities);
        }

        public Resource_Channel GetSingleByCondition(Expression<Func<Resource_Channel, bool>> expression, string[] includes = null)
        {
            return _channelRepository.GetSingleByCondition(expression);
        }

        public Task<Resource_Channel> GetSingleByConditionAsync(Expression<Func<Resource_Channel, bool>> filter, Func<IQueryable<Resource_Channel>, IIncludableQueryable<Resource_Channel, object>> includeProperties = null)
        {
            return _channelRepository.GetSingleByConditionAsync(filter, includeProperties);
        }

        public Task<bool> AnyAsync(Expression<Func<Resource_Channel, bool>> filter, Func<IQueryable<Resource_Channel>, IIncludableQueryable<Resource_Channel, object>> includeProperties = null)
        {
            return _channelRepository.AnyAsync(filter, includeProperties);
        }
        public int SaveChanges()
        {
            return _channelRepository.SaveChanges();
        }

        public Task<int> SaveChangesAsync()
        {
            return _channelRepository.SaveChangesAsync();
        }
    }
}
